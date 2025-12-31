return {
	WrapInFunction       = require("blus.steps.WrapInFunction");
	SplitStrings         = require("blus.steps.SplitStrings");
	Vmify                = require("blus.steps.Vmify");
	ConstantArray        = require("blus.steps.ConstantArray");
	ProxifyLocals  			 = require("blus.steps.ProxifyLocals");
	AntiTamper  				 = require("blus.steps.AntiTamper");
	EncryptStrings 			 = require("blus.steps.EncryptStrings");
	NumbersToExpressions = require("blus.steps.NumbersToExpressions");
	AddVararg 					 = require("blus.steps.AddVararg");
	WatermarkCheck		   = require("blus.steps.WatermarkCheck");
	Debug		   = require("blus.steps.Debug");
}