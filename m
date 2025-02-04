Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2051.outbound.protection.outlook.com [40.107.21.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6D9210F58;
	Tue,  4 Feb 2025 12:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738672939; cv=fail; b=ZdFeDXFOw0J8HKNTan+yfFl2qAfQA6N8OiU8XNFjcpyiYSdt/K1dMl6/8TCgIU8rkGmXg4Gg0vAG7k+0z97KqNVX5BRXpLgvoPKmU+3giiUJ73QYhWaAUuE8BREmOdEvRC3KLTvguv1rvKotv8dyzVdgZzK4DBPEV+BhAaodC8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738672939; c=relaxed/simple;
	bh=i+186PcLHTk+RhUefAjfgXPCaS85IDhKUSbqaEg3Yvc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JbFPSFuRevrpyQQec1z2FX4rBMQi6U1iYN0FSVil4Uu2J1ZQP0yso911svrEAn8zA3v+1Aqj/HV5RdCIGN2hlFyMH4VUou1871np1Bqxe6TYRWJkQ9ZVi2qbmKQtjwHIgmM5It773A7S31shkw0rTqPKam51zZ/R/0T/Aoeai60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QK0r04p0; arc=fail smtp.client-ip=40.107.21.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QK0r04p0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KP+2Q2Ku3jeLgVKm070qPyal7eeVJnoEe5317L8+8SI4k8vGGZuJmTjizeuxXuzJXOTZ5REUuBAS9qjbD/GqL2WxYIQcU+rJPGd2CG1fE21tefXLwocoiutKA9a9Wp0Fgqs49rIYvIAzM/6Dmg73LhBGTIrhqhNb+3BgtldwixpH7rt/dOsqteY7fAx9K54ecRJGRo+k7FXA4VMWY+CbL1/JMmBXW9gJMU0UOsMnbelf+h4E7/rlwVxgmQDv/Y1I1jzdy1oYzEBZhYjnWyi5Epz5YrQIRC/1hU9rG6aIby4kT1lAnH3f36RvFyz5f8+VBmDq6rrFjUaj2GcbM3tCVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdIJXtIxysd9FAgZSSUlMCTkFE6yGwXa3xz5U4l3mzY=;
 b=lAFXmEiMbKMnC0Sg3Za9cWoRQ611pbbHpN9rdtC8mAywAMEoROnKZ+dsMyh4fvd9YmbX6o1TphsY2CzcYx+tHtILZotqZuHboQBYWvVjKqprPXjvYCBbgfOZHC62rr1VdW5gPqryikhmRj7g7mQ6CovmSK0a8K9bpFjcs8T5jSd76+OzMisbuL6vSLhx+tnxo970UfE6YIjhEQ7aOJuvEzpjf/bK5moR9KhmpM/wgxUrSYf9HV0oLzcjG1mSvKW+7yf+kdajirC+OBahU+3+eielbw6bv+YX1Owf3AFyYjWqzhbITT/y4gXIN7V4IPdVFoeiPR2KVmhZhT9IwKXg/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdIJXtIxysd9FAgZSSUlMCTkFE6yGwXa3xz5U4l3mzY=;
 b=QK0r04p0dO0hB7glAlPiyc0BYnHhFslsPFOktT1rf20Wbj4PP3GtcYCoUlaB88SjXz3JZiXGxp/qhTkq3CAJ4POghCzm5rWvQanXQ+VuHKCtz15lafwIrD7wDZ/nKbuAKjkHB8U4hyzqbJJcAPg0rxfBsFgJhCerz/5lJSLE2BzRBYm8TWS1SX+coZpy/7UCLWt83yaulAU80TU+TlFbKmvKEXCkR5oBCLYK7txCvRv+mUCVxbUy9T7N3BwBbKtlX2YQeyFd8YGJh82UAmW6R+TJA2QYSHEjdt2CrTmUZxDAJffKY6QxxAEsGZAjrs399dIXIvhq9OdIczZjboFcfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10889.eurprd04.prod.outlook.com (2603:10a6:102:491::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 12:42:15 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 12:42:14 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 04 Feb 2025 20:41:14 +0800
Subject: [PATCH v8 2/2] nvmem: imx-ocotp-ele: Support accessing controller
 for i.MX9
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-imx-ocotp-v8-2-01be4a4bb045@nxp.com>
References: <20250204-imx-ocotp-v8-0-01be4a4bb045@nxp.com>
In-Reply-To: <20250204-imx-ocotp-v8-0-01be4a4bb045@nxp.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738672884; l=9163;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=IwvgJVXLT5aU/bv14bty/b3x/EdTuTasIiBLOcfQxE4=;
 b=KGoIyodJpc+tVXbzD5Ty17gVKr8ozCiEJTdzQB5NGngd3cdSucx/PebKdDgZQNXOzu9hrqNZu
 Z0jJPtMf/GmANlBkClMR+yNhdNrNuv4pntNMgk3KyJtaxRuAywQQlEy
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10889:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a44adb6-c6cc-4fdc-0716-08dd45195a45
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REFZWFg3RGVZZGpvdXRSMFJWVTcxbXIvRVJRWHRVWnV2V2N3Z0dVTFVqdzBG?=
 =?utf-8?B?Yy81cVoxbkpHdDhjK3hJc213c0NraC9VQ2trYTE3aXExR2JjWm9rY0srZDVU?=
 =?utf-8?B?MU5acnJFNUVQTWppY2dQWkVUR0NFSXpvSy94QXRpL28xZGtKNldTTjdXdzAy?=
 =?utf-8?B?cTBneU1mUkNvSEk4UGxteUF3WjA5VmJZa3J1ZlFXQXRPMVA1RGMyOXlqSHFv?=
 =?utf-8?B?SVB5RElQMFEzVktGTW94Z1RZeWNjN0xYK2hHdWNDRWZET3dIZjVKZDlQdFBP?=
 =?utf-8?B?TEljeC9vQmdrNE53dkhIV0x2bmFVNWVYWEJmbFJ6NlViZUtjWnBkbzI4UVRp?=
 =?utf-8?B?ODh1QnpyemNwSnFxUlg5ajFBUER5b1luTG10bWQ0eVVvUlc5NWdtYzFkYjNn?=
 =?utf-8?B?K3k1OFdCQTBXTDFQaGNaendxOWdxaWpSdWFjeFhWVVo0OXc5NjhaaUdvYU0x?=
 =?utf-8?B?TjNCODlsTDE3VTQvV0hBaGYyYTREWER0VWdWckU4azExcEVCOGY2MEdnK1N5?=
 =?utf-8?B?MkVZdFFzenlVZXVURGR6eS9CbXpEL1NwdlpHbnlZM3lsNlJSSWRWUU84R1Qy?=
 =?utf-8?B?a0ZlUWRoYVhpWk1pMFNKdHB0RDh4L21yc2lNRDNnWnF6N0d3dnR2eHA2Rm4w?=
 =?utf-8?B?b0E0bUhPaHJKRGg4YjF4cFc3d2FvamVvMVNUL3pDSDBBUEFlWU1XWUpvdmdk?=
 =?utf-8?B?S0FCYUVCWklpOFhxVGFZcEVVTmNYc3dpNnNTTE0xdEo3eFpoaGE4Vy9UOEp3?=
 =?utf-8?B?cC9DL2lnaEgvVHRzZ3p1WUljSDBxRTlqMDJ6M2tDZCt2Rnk2dGI1ZTI4UUpT?=
 =?utf-8?B?N3QyNFNVSUplcEE2SFQzWVJQSG1BRWd5ZkdXUGlRRGZGaHE4QXVFam9hYjlw?=
 =?utf-8?B?dWFoT1MySlNnT3AxVEl2aDB2WWtValI4YmdNQ3NubmEzT2had2JzcWFFUjJK?=
 =?utf-8?B?czhCTldXNTRvU3JoOEpLY3NPd1dCMlliZVNUWExZT0h5OGs2aGFyOWc1SjBl?=
 =?utf-8?B?YWNFc2RhVjlrenlYYUxWVEY0akhlTDNpQzZSbko2bjMweVRwRmYzZlNQTGFy?=
 =?utf-8?B?bkFLOUoyQ3V6UXl6TVFxR2tYTUtvWlluRWE1R0t2UWhxeDNqczhwa3AvaDdi?=
 =?utf-8?B?OVptREwzOVFKZGMxMjZuVXhkK21KMUR3ZjR2cTdCT2hLeFg4aHRrSENOVXl1?=
 =?utf-8?B?RGJYNVROcG5jVnlvbmZRMG1uS3MxOFFoaFFab09xSnNZK2RhcXI2aFNrNlR1?=
 =?utf-8?B?SWNIa0c5N1NaY05PS2dSY1dRSFBoZ21MSmFiWXdyanVoREN6Rk8zRFZMeXk5?=
 =?utf-8?B?VlRQVTlPSVRHWFFnWmlXbGJ3KzdUZnlybklueFR5OGRRTi9hc2VxWDJtR1NH?=
 =?utf-8?B?YXVyV3lQTTY4UEIycU1LdzN0eTY2dk45QzdWK1N6L2QvZXlJUS9kZmZnVVlD?=
 =?utf-8?B?UjZYVHFHZDl3TWxSVXgxbjB1cmk0cWovcFV2a1FOYTZnOFNUK3BIUVcvd0E0?=
 =?utf-8?B?WTNyZmwvQVdLL3hZM3BLVjNxeWtSdmJyNk5xUW1XUHFISHZTRGtZVndORkNK?=
 =?utf-8?B?ZDJsSTBLM2JZNWdzNGtUdHAxL0QxYnl0eWYzNHkwb2o0Mm9MT1ZtQ3RBdlB4?=
 =?utf-8?B?YU9xTmxzazU4bW1lcFhrRDRFeVNtcTNvM1M5NFd3TjRQOC9RRkdhRG03NEZk?=
 =?utf-8?B?Ry8wbXRoeGRSSWkzVGZaRkRKdzNrUlViSUNHRHZsUXp3YVl4T21KV1YwdmJW?=
 =?utf-8?B?Ky9xcVpSMVJoRXdUYmt5SmRBRzhheVlRMUJlbEdBZ0dUMXk5SWpMS0cvY01t?=
 =?utf-8?B?QlJpbzBib0Rucy9KQ2V1YTh1UTlXQlZFUmRIZ0hWeng5U0NnMWZzMWVlNk40?=
 =?utf-8?B?L3ROMTZUdllaSko5WExNZlJzRnJQT1hYY3ovcUs5WFRwS0ZvZ2VBbkhhbGxx?=
 =?utf-8?Q?ZxMDQHUmEJfQXAY0RbVj6u++P5pfRSso?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3BJcWttd0RSZE9hZmxLaU1XSENsejUwbTEvdndYdk9WZ3N4WkVYUGRmU2N2?=
 =?utf-8?B?aDl1ZlgrdXR4WWhlRHc2c3R6Z09tQ2JYNzZQbDZ3cVJRVU1zalVpdUZsdFRH?=
 =?utf-8?B?M0hGZWtXVm9KMWpBaExYT1M1ZUNHOTBmT1NseTRxTEVyN2R6N1dJcWlBa3Zh?=
 =?utf-8?B?NmJwYi9YNGxvKy9KR2dwWDZwaWZhdjB0WWJWMlhkTEN2T2ZTU1c3K0c1OWN2?=
 =?utf-8?B?Z2czTU9XMHhkNFRqeDRuUG1sd3h0eGFZTFpQdFh0d1ZWc1h2V2NHbmlWNHlt?=
 =?utf-8?B?NDI2UWZQQ2FjRnBwN1NIK3Q3SXZEdlRDdjdGdUlsMTFpTk9hM0ZVejM2M0VD?=
 =?utf-8?B?djQ4Q0I1bTFPYko2MlNNUVpXMFdXTHh3OVgwNnk4SGlzY1F1dlF6THovWEw5?=
 =?utf-8?B?MUVOWjdKckpKTEIrck1mNTN0UzZkcHJITEJFaXpMaTNnVEp4bDBUNFVqZGJR?=
 =?utf-8?B?NXdhbzhJTHRrQWE3QjhjN1BvejZHRFV4MjBkN2ZJcy9qcGI5ZlhFNXpQb3lR?=
 =?utf-8?B?d0VwU1pQb1IrZVJCNzNOa1U0RGh4eVB4OXBoQ2pEVndwVnEvbmdXd1hHOWpB?=
 =?utf-8?B?ZFF2NjROSTVVOFdNb3VFUTJqZEJibGNtdkdxNzlHYWx4SnlJbXdQTGl5WVNG?=
 =?utf-8?B?ZWtNNy9uVDFLUURncUc2ekNUWjcwNXZWTGNqSTdSMnQzYmMvQmNrbEpFM05n?=
 =?utf-8?B?Rlc1ckI3cVdKQm5sQkNHV2VvdWxFTkkrU1N0ZXdGQ1JUcU1YOGx5d2lmRzlh?=
 =?utf-8?B?dUV1dDlJL1didUltdWNpd0k2V0I2Z1NzdW5DdFNKT3l4TjlqRXBDZXJ4MFRW?=
 =?utf-8?B?V1F5Kzd5VlVxZWQwZ0ZlUmdYYm9GSnh1ZXhGczFvK0tzT2dxSDFPT1lZQkpF?=
 =?utf-8?B?d0tibmtuSmFJWlFQSFRrNklDNnpBTG9aRldjRU9qdHlFSlI5SE5paWF5VllT?=
 =?utf-8?B?QXpEdzhCKzVUUTJtM0liT3BpSmdwejU5WHVxZysyZ1lCVXFDZ3h1c1dGRUlO?=
 =?utf-8?B?WFNuUXVWS09QUWV3VWJrVUx1cVdtRG1QVTNISk1QOVJUTWcxbkRDdkIrUTVD?=
 =?utf-8?B?NDlNdDV5S0UxMWpYaXhReXZMaVFhOHRiU01SODRBOCtmTk80ZFNxVkYvck0x?=
 =?utf-8?B?WWE5UFdCcmZ3K2Q3UTFUZU9LL3M2Uk5pV04yZU1VVjNqNngvVEF5MndhR2tD?=
 =?utf-8?B?NmlvUFBJQWVZQ3hFbzI4SzlHd3BDNEhjNTVuOEVrcnQ2SXpHeHo5TEhST1I4?=
 =?utf-8?B?NUJpNGM2dFc2ZzljUC8wNjN0Q2RXaWt6Z0pwNk05Y0RtK1lobEFYd1E0ZEY5?=
 =?utf-8?B?SWlBUldGQUVoVkliTFZneVNpbDR1M0dZUkJXbW1rSGRJZ0NsbXdPUnhyU3U1?=
 =?utf-8?B?eERIcG9ScnZ4OEIweE5jZVdLdlhDdVNJYk00THRMVnpOemhRZVd6K0w2cllU?=
 =?utf-8?B?RDJIbTZZOEJTRjdQNEhRMEtza1BiK3V4cEJaeTAxUzJDdDVpTWpUdG1PZFZC?=
 =?utf-8?B?MG9jZ29MbWlDZ25acHBVaTVwV25HRXovbHBtcHhjZ2FseEFRNzV6MWNlL3Bk?=
 =?utf-8?B?L25ibjJIdTQyNkVkVkExbnhSaVFQNCs4ZldJTFpxc1FDb29CeWhCdHgzbHpN?=
 =?utf-8?B?a0cyOXVvZm9XckpHSkVjZXYybHlac0RWakh0QUV1VEFtNmtzaENPRk82R3lz?=
 =?utf-8?B?R1FWM0RTR3l3RG5RY2NldTlzU1ZBYm11R2NxZUdLSmRuS1FFYTlsMDNhK1F1?=
 =?utf-8?B?K0tybDBDa0JSWUZ0Q3VpbWxzVnRLMFF0THlrQ0JoMTViZXhrbFNvZWN4RThX?=
 =?utf-8?B?dXhkY2pSV2xLYnlrUXQweWNZZmc4N3hYRmZUVlFnbzg4VXJRZlNlWktLWVd5?=
 =?utf-8?B?VmNNMmphR0hacUhlNHRyT2F4N0d4VWFGUWFKclFGd3FIMnE5NmNHaXVSYkFI?=
 =?utf-8?B?eW83eVNpUVVzL2FZWEJZUUdweEVwaElqd29xbHFnNDdhZXgvbnJhNWJRTXkx?=
 =?utf-8?B?NG1EYkJMNVNQQ3ZXRHpXYWxEakl2OG54alV4VEIzUW0rU3lOWC8xSFVvMnVL?=
 =?utf-8?B?dWF4QjNEd3pXL3p2QUtCODVFSm1KbTJ2OXFMQk1ZWGhaQ0JYUnQxK25yL1F2?=
 =?utf-8?Q?EG/NBLcbR2skNg55iTFBqqKBh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a44adb6-c6cc-4fdc-0716-08dd45195a45
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 12:42:14.8982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2zUD0GY7TpLo+q1tp3XvcCT7eq8bzSwdquSILYlWCbIuXSJplcgtkAgxVc2ozLazYnDn0jFo6TQAIxbN/uPSxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10889

From: Peng Fan <peng.fan@nxp.com>

i.MX9 OCOTP supports a specific peripheral or function being fused
which means disabled, so
 - Introduce ocotp_access_gates to be container of efuse gate info
 - Iterate all nodes to check accessing permission. If not
   allowed to be accessed, detach the node

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/nvmem/Kconfig         |   3 +
 drivers/nvmem/imx-ocotp-ele.c | 173 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 175 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 8671b7c974b933e147154bb40b5d41b5730518d2..77cc496fd5e0e1afd753534b56fe1f5ef3e3ec55 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -93,6 +93,9 @@ config NVMEM_IMX_OCOTP_ELE
 	  This is a driver for the On-Chip OTP Controller (OCOTP)
 	  available on i.MX SoCs which has ELE.
 
+	  If built as modules, any other driver relying on this working
+	  as access controller also needs to be a module as well.
+
 config NVMEM_IMX_OCOTP_SCU
 	tristate "i.MX8 SCU On-Chip OTP Controller support"
 	depends on IMX_SCU
diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index ca6dd71d8a2e29888c6e556aaea116c1a967cb5f..fe243e4d3377e98a21f660ebad92dbe9bff94330 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -5,6 +5,8 @@
  * Copyright 2023 NXP
  */
 
+#include <dt-bindings/nvmem/fsl,imx93-ocotp.h>
+#include <dt-bindings/nvmem/fsl,imx95-ocotp.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -27,6 +29,7 @@ struct ocotp_map_entry {
 };
 
 struct ocotp_devtype_data {
+	const struct ocotp_access_gates *access_gates;
 	u32 reg_off;
 	char *name;
 	u32 size;
@@ -36,6 +39,20 @@ struct ocotp_devtype_data {
 	struct ocotp_map_entry entry[];
 };
 
+#define OCOTP_MAX_NUM_GATE_WORDS 4
+
+struct access_gate {
+	u32 word;
+	u32 mask;
+};
+
+struct ocotp_access_gates {
+	u32 num_words;
+	u32 words[OCOTP_MAX_NUM_GATE_WORDS];
+	u32 num_gates;
+	const struct access_gate *gates;
+};
+
 struct imx_ocotp_priv {
 	struct device *dev;
 	void __iomem *base;
@@ -131,6 +148,83 @@ static void imx_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
 	cell->read_post_process = imx_ocotp_cell_pp;
 }
 
+static int imx_ele_ocotp_check_access(struct imx_ocotp_priv *priv, u32 id)
+{
+	const struct ocotp_access_gates *access_gates = priv->data->access_gates;
+	void __iomem *reg = priv->base + priv->data->reg_off;
+	u32 word, mask, val;
+
+	if (id >= access_gates->num_gates) {
+		dev_err(priv->config.dev, "Index %d too large\n", id);
+		return -EACCES;
+	}
+
+	word = access_gates->gates[id].word;
+	mask = access_gates->gates[id].mask;
+
+	reg = priv->base + priv->data->reg_off + (word << 2);
+	val = readl(reg);
+
+	dev_dbg(priv->config.dev, "id:%d word:%d mask:0x%08x\n", id, word, mask);
+	/* true means not allow access */
+	if (val & mask)
+		return -EACCES;
+
+	return 0;
+}
+
+static int imx_ele_ocotp_grant_access(struct imx_ocotp_priv *priv, struct device_node *parent)
+{
+	struct device *dev = priv->config.dev;
+
+	for_each_available_child_of_node_scoped(parent, child) {
+		struct of_phandle_args args;
+		u32 id, idx = 0;
+
+		while (!of_parse_phandle_with_args(child, "access-controllers",
+						   "#access-controller-cells",
+						   idx++, &args)) {
+			of_node_put(args.np);
+			if (args.np != dev->of_node)
+				continue;
+
+			/* Only support one cell */
+			if (args.args_count != 1) {
+				dev_err(dev, "wrong args count\n");
+				continue;
+			}
+
+			id = args.args[0];
+
+			dev_dbg(dev, "Checking node: %pOF gate: %d\n", child, id);
+
+			if (imx_ele_ocotp_check_access(priv, id)) {
+				of_detach_node(child);
+				dev_info(dev, "%pOF: Not granted, device driver will not be probed\n",
+					 child);
+			}
+		}
+
+		imx_ele_ocotp_grant_access(priv, child);
+	}
+
+	return 0;
+}
+
+static int imx_ele_ocotp_access_control(struct imx_ocotp_priv *priv)
+{
+	struct device_node *root __free(device_node) = of_find_node_by_path("/");
+
+	if (!priv->data->access_gates)
+		return 0;
+
+	/* This should never happen */
+	if (WARN_ON(!root))
+		return -EINVAL;
+
+	return imx_ele_ocotp_grant_access(priv, root);
+}
+
 static int imx_ele_ocotp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -161,14 +255,45 @@ static int imx_ele_ocotp_probe(struct platform_device *pdev)
 	priv->config.fixup_dt_cell_info = imx_ocotp_fixup_dt_cell_info;
 	mutex_init(&priv->lock);
 
+	platform_set_drvdata(pdev, priv);
+
 	nvmem = devm_nvmem_register(dev, &priv->config);
 	if (IS_ERR(nvmem))
 		return PTR_ERR(nvmem);
 
-	return 0;
+
+	return imx_ele_ocotp_access_control(priv);
 }
 
+static const struct access_gate imx93_access_gate[] = {
+		[IMX93_OCOTP_NPU_GATE]		= { .word = 19, .mask = BIT(13) },
+		[IMX93_OCOTP_A550_GATE]		= { .word = 19, .mask = BIT(14) },
+		[IMX93_OCOTP_A551_GATE]		= { .word = 19, .mask = BIT(15) },
+		[IMX93_OCOTP_M33_GATE]		= { .word = 19, .mask = BIT(24) },
+		[IMX93_OCOTP_CAN1_FD_GATE]	= { .word = 19, .mask = BIT(28) },
+		[IMX93_OCOTP_CAN2_FD_GATE]	= { .word = 19, .mask = BIT(29) },
+		[IMX93_OCOTP_CAN1_GATE]		= { .word = 19, .mask = BIT(30) },
+		[IMX93_OCOTP_CAN2_GATE]		= { .word = 19, .mask = BIT(31) },
+		[IMX93_OCOTP_USB1_GATE]		= { .word = 20, .mask = BIT(3) },
+		[IMX93_OCOTP_USB2_GATE]		= { .word = 20, .mask = BIT(4) },
+		[IMX93_OCOTP_ENET1_GATE]	= { .word = 20, .mask = BIT(5) },
+		[IMX93_OCOTP_ENET2_GATE]	= { .word = 20, .mask = BIT(6) },
+		[IMX93_OCOTP_PXP_GATE]		= { .word = 20, .mask = BIT(10) },
+		[IMX93_OCOTP_MIPI_CSI1_GATE]	= { .word = 20, .mask = BIT(17) },
+		[IMX93_OCOTP_MIPI_DSI1_GATE]	= { .word = 20, .mask = BIT(19) },
+		[IMX93_OCOTP_LVDS1_GATE]	= { .word = 20, .mask = BIT(24) },
+		[IMX93_OCOTP_ADC1_GATE]		= { .word = 21, .mask = BIT(7) },
+};
+
+static const struct ocotp_access_gates imx93_access_gates_info = {
+	.num_words = 3,
+	.words = {19, 20, 21},
+	.num_gates = ARRAY_SIZE(imx93_access_gate),
+	.gates = imx93_access_gate,
+};
+
 static const struct ocotp_devtype_data imx93_ocotp_data = {
+	.access_gates = &imx93_access_gates_info,
 	.reg_off = 0x8000,
 	.reg_read = imx_ocotp_reg_read,
 	.size = 2048,
@@ -183,7 +308,53 @@ static const struct ocotp_devtype_data imx93_ocotp_data = {
 	},
 };
 
+static const struct access_gate imx95_access_gate[] = {
+		[IMX95_OCOTP_CANFD1_GATE]	= { .word = 17, .mask = BIT(20) },
+		[IMX95_OCOTP_CANFD2_GATE]	= { .word = 17, .mask = BIT(21) },
+		[IMX95_OCOTP_CANFD3_GATE]	= { .word = 17, .mask = BIT(22) },
+		[IMX95_OCOTP_CANFD4_GATE]	= { .word = 17, .mask = BIT(23) },
+		[IMX95_OCOTP_CANFD5_GATE]	= { .word = 17, .mask = BIT(24) },
+		[IMX95_OCOTP_CAN1_GATE]		= { .word = 17, .mask = BIT(25) },
+		[IMX95_OCOTP_CAN2_GATE]		= { .word = 17, .mask = BIT(26) },
+		[IMX95_OCOTP_CAN3_GATE]		= { .word = 17, .mask = BIT(27) },
+		[IMX95_OCOTP_CAN4_GATE]		= { .word = 17, .mask = BIT(28) },
+		[IMX95_OCOTP_CAN5_GATE]		= { .word = 17, .mask = BIT(29) },
+		[IMX95_OCOTP_NPU_GATE]		= { .word = 18, .mask = BIT(0) },
+		[IMX95_OCOTP_A550_GATE]		= { .word = 18, .mask = BIT(1) },
+		[IMX95_OCOTP_A551_GATE]		= { .word = 18, .mask = BIT(2) },
+		[IMX95_OCOTP_A552_GATE]		= { .word = 18, .mask = BIT(3) },
+		[IMX95_OCOTP_A553_GATE]		= { .word = 18, .mask = BIT(4) },
+		[IMX95_OCOTP_A554_GATE]		= { .word = 18, .mask = BIT(5) },
+		[IMX95_OCOTP_A555_GATE]		= { .word = 18, .mask = BIT(6) },
+		[IMX95_OCOTP_M7_GATE]		= { .word = 18, .mask = BIT(9) },
+		[IMX95_OCOTP_DCSS_GATE]		= { .word = 18, .mask = BIT(22) },
+		[IMX95_OCOTP_LVDS1_GATE]	= { .word = 18, .mask = BIT(27) },
+		[IMX95_OCOTP_ISP_GATE]		= { .word = 18, .mask = BIT(29) },
+		[IMX95_OCOTP_USB1_GATE]		= { .word = 19, .mask = BIT(2) },
+		[IMX95_OCOTP_USB2_GATE]		= { .word = 19, .mask = BIT(3) },
+		[IMX95_OCOTP_NETC_GATE]		= { .word = 19, .mask = BIT(4) },
+		[IMX95_OCOTP_PCIE1_GATE]	= { .word = 19, .mask = BIT(6) },
+		[IMX95_OCOTP_PCIE2_GATE]	= { .word = 19, .mask = BIT(7) },
+		[IMX95_OCOTP_ADC1_GATE]		= { .word = 19, .mask = BIT(8) },
+		[IMX95_OCOTP_EARC_RX_GATE]	= { .word = 19, .mask = BIT(11) },
+		[IMX95_OCOTP_GPU3D_GATE]	= { .word = 19, .mask = BIT(16) },
+		[IMX95_OCOTP_VPU_GATE]		= { .word = 19, .mask = BIT(17) },
+		[IMX95_OCOTP_JPEG_ENC_GATE]	= { .word = 19, .mask = BIT(18) },
+		[IMX95_OCOTP_JPEG_DEC_GATE]	= { .word = 19, .mask = BIT(19) },
+		[IMX95_OCOTP_MIPI_CSI1_GATE]	= { .word = 19, .mask = BIT(21) },
+		[IMX95_OCOTP_MIPI_CSI2_GATE]	= { .word = 19, .mask = BIT(22) },
+		[IMX95_OCOTP_MIPI_DSI1_GATE]	= { .word = 19, .mask = BIT(23) },
+};
+
+static const struct ocotp_access_gates imx95_access_gates_info = {
+	.num_words = 3,
+	.words = {17, 18, 19},
+	.num_gates = ARRAY_SIZE(imx95_access_gate),
+	.gates = imx95_access_gate,
+};
+
 static const struct ocotp_devtype_data imx95_ocotp_data = {
+	.access_gates = &imx95_access_gates_info,
 	.reg_off = 0x8000,
 	.reg_read = imx_ocotp_reg_read,
 	.size = 2048,

-- 
2.37.1

