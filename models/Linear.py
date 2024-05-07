import torch
import torch.nn as nn
import torch.nn.functional as F
import numpy as np

class Model(nn.Module):
    """
    Just one Linear layer
    """
    def __init__(self, configs):
        super(Model, self).__init__()
        self.seq_len = configs.seq_len
        self.pred_len = configs.pred_len
        self.Linear = nn.Linear(self.seq_len, self.pred_len)
        self.activation = None
        if configs.rnn_type == 'tanh':
            self.activation = nn.Tanh()
        # Use this line if you want to visualize the weights
        # self.Linear.weight = nn.Parameter((1/self.seq_len)*torch.ones([self.pred_len,self.seq_len]))

    def forward(self, x):
        # x: [Batch, Input length, Channel]
        x = self.Linear(x.permute(0,2,1)).permute(0,2,1)
        if self.activation is not None:
            x = self.activation(x)
        return x # [Batch, Output length, Channel]
