Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013020.outbound.protection.outlook.com [40.107.162.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF26201004;
	Fri, 27 Jun 2025 06:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751004365; cv=fail; b=ka7BbDatDVBQp1COse8wXFyArnO1uaS5K2KUaYHnJrWZ/fXQIQXD8nCtoDy14em1jjqChnjjiVeK3cRvmpS1sNSzPw9MgxI950n9EIc5O6HxullNivFo+ZgkRpm/Ingwv29LdgPzHVWSkCXuLhNZ2TCFcH6dAJrRpAXynQjI7MM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751004365; c=relaxed/simple;
	bh=UKc33iRq8lIclsux9267eNeNs4bErQCc2Z9aT24IbFo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZyG+fQAFUDjhvfOp0DGQz2lLPR+fLe1Hz3h8iyR9Cq1r4RKJxh5uRhPPgFH+pUH007qYGVzynrijsRb8TTQiJHa0bMyUxK6OIswt3iTin0rOw9c1zfqeXZ+jsfWcCnoxtPebtvzKEUBz+SpHgCuMlMPqa9opu1zvlUulzLuEapI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dVgc49Nj; arc=fail smtp.client-ip=40.107.162.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dVgc49Nj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pfy1lQ+twsx+kSHF26R6FX8cL1HtDyNeDXO1Ko1i2MF50cOTtylYtn4JTx9tdmM0kLDhR+G3iVGJsUEE9uOaNrtzNG/9L79yH5DrhKwHXKdbR4jZ+wajbdr7VwPSeLCMMWe02SjcJNpnnhWeLhJFRK3bWwTUsHs+MWPKesfurVIeqlFC0qHZb3WWAhzYSqdR2IQFRg1/ZcTpW/h0hPNmKkeEeUsoe3Dy/N64w2eaizHTSP1kuRkB3/izWOu5Ql4DU51Qu5d4iswPO6+0+azlqyqrqRzwaUZFRKvLD4hXimi67w8tT+eV8qRZIrB+wDt3RosESu4aPvyKZC9ePmfzug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTGgML63raAxygMvsDnCkSRFjAlpRcUFEDyXuFsrQAU=;
 b=lkeJqO4jTf7s/7tGUHPxk+5MQ/BbrpZKTJeuc7ObQDSdHfvc3TZYCv7/EMY4cWQJJBHKTPr+hZt1cvP7o3VFlWRlBLIkCc4HH0eTF9qmbR+++2dn60DNkw2UebOSN9DNzhGdmKcJUOiKP57fqr0aAOQeiSC3gKAi8P4Ah7LNq61/++AioiEt/yfLuMCvRWkziKyPLbPFuSIny8ykFAgqekVRHgyxeHj5zNhWCshwHAXgN+10aGxVptVB6otxtsBNvOES2S8pVfCaLqJCbz/5j+d6mYDIgkMmM7tPpeuXqhVtmd9suzv9O8hwbiDg0Ox5FW/OQW9RAp1rKXT5C52MRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTGgML63raAxygMvsDnCkSRFjAlpRcUFEDyXuFsrQAU=;
 b=dVgc49Njwlvlbx93DG3SHrQ9OkKKJWwMujVsiF8GyGYxfW8c7vLZPxNHqWDYPy8ygfo/+khRx5eLodMqH8poGXf1kSHwyM8HnfS7RWOBrf2hoZO3EQwqiOs0zwH9O0qO0xbFZVo06LVh3odeVuHLfYiYitZCLYBhA2gqoGpHIeBx+WE1NzhNEHXwzhklIsoziWHHrubNi3IOthR8Zv0DCujS3eLtMUgOjSyd06YT/BHjw6+2yFf+85JaS78NLOhGFhikoTTRu5KZ+WCD9v0y5B3PUmpzWuJVZRw7WzLR1gNp01bwHNl8NGsKrCyz9CUxC9tsfgI0BX4TKBD8SAOwtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Fri, 27 Jun
 2025 06:06:00 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 06:06:00 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 27 Jun 2025 14:03:48 +0800
Subject: [PATCH 5/7] firmware: arm_scmi: imx: Support getting syslog of
 MISC protocol
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-sm-misc-api-v1-v1-5-2b99481fe825@nxp.com>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
In-Reply-To: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: arm-scmi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751004238; l=5061;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=UKc33iRq8lIclsux9267eNeNs4bErQCc2Z9aT24IbFo=;
 b=KNvTw55nntfgJS7A2LUeUPGESNzJuyFrMjqhg93Q6/OOyw1C73UNb1eyVeGZhzoP4T60b6WzI
 8Q3aRgFffveBCr3eqtwkrivrpIKXmWdp3AgdX6bsIxi/EouW0r1V09s
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXPR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::27) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8906:EE_
X-MS-Office365-Filtering-Correlation-Id: c2f11b84-9703-4f7f-a0ad-08ddb540b08b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cm1uUDlCUmplZlVsdXZnczMzUmY2dHkwQXRsUld0aStWajB6di9CaUwrQVgr?=
 =?utf-8?B?L1IvY21sczBKT0JKZURVdTZpL2V5aHhqZ0d2UEJVWU03YmdRWDZhUm5GMktx?=
 =?utf-8?B?djJvb3pEU3dsSEtXZzVBUEFZYkVKT1JsbTFyMWtVUDNQRjk2U2tFUndKSnA1?=
 =?utf-8?B?Y2RoTTJvNnJYbDNQckdQRzlhMFJPVUowcXlpSFJnMy9JSHgyOXN5bklPNjdw?=
 =?utf-8?B?by9hdFBvN09hRWxlRDlkYXR4eGJPaC9wOXNxc2lwYmZHTVZxbWRtZDhZclpp?=
 =?utf-8?B?UFYrMTJRaGRiUnBUYUVUbVcrMmhOaUI0TDRlQmZwZ3A0NURhNktvcUtIL0lU?=
 =?utf-8?B?NjFaazdmcUI2eFhSK1FkVVVCL1pFSE5JT0dLRTUzSEVrbitrWlZReTV3aU5r?=
 =?utf-8?B?S1NrK1Q3VnozdHJCSVpneCs5T3daL1c5QzRMWXp1eDQ4b1lBWXdpYmRGOHdv?=
 =?utf-8?B?ci9WTVZKVFpFTUk5L3ZQTGRqeUlTWEFvcWJ1dXNRNG1CYWxVVDNvNmdHR0Jo?=
 =?utf-8?B?azNZSWtNLzBoWFMrZERGZXYzQTRObE5HVlFlUHhJYUcrNFZCT2IwTjhrc1JW?=
 =?utf-8?B?U2xCMzIxd3c3R0RGaXBVL2RvdytTano4dlEwRTd0VmVaYk1qRHdVZExYVTdH?=
 =?utf-8?B?RkY1dVlrMytkdW9obk15Q3BDL0VXeW5xbDVvZTdUQ0djby9na1ZmV0NOY2lm?=
 =?utf-8?B?Tm1RdEI0VmtXVXNTcHZFVGQxTjRBZE4yYlRsM1cxYnFPY3pPam1OTmFXa2xH?=
 =?utf-8?B?K0dUR3RRa1FJbUlHY2srcXZ5bm1DaWZ1V1ljcTYvY1dWaTR5YW8wM3RnUnBG?=
 =?utf-8?B?S0dtYld3VGpMMjl4ekQvQ01BVC84T2xuV3Y2WE55R05xMWdSZU1pVUdTa2Rw?=
 =?utf-8?B?a2JOdEozMFdUUnlqOVNaRUNacG0vMi9HNGlSSUJVNSt3dERlYUhnUUd6SS85?=
 =?utf-8?B?VE9jNUVvN1lnQnNVQ3oxamRtLzhjdU5kbUQ1VTZUVmdqbDRNYlRNYktSTTQ4?=
 =?utf-8?B?dTVyc2drNTVkTndoNnI3azRZRVpabUNDbGlCdjVKdFFwckw0dGdVTWY2NThv?=
 =?utf-8?B?Vm9XL3EyalhQM25FU3dCcjcrYjRpVXd1TGIzL0dZc043SVBSREFueUFhV2lt?=
 =?utf-8?B?VXNWbGJPWDE5VU1ZdmRzRktlNE9ib0NTUTd0UUpnRFNBUFM1SGdJbHFNYy9t?=
 =?utf-8?B?bXp4bFgzdXdNWXNvWUpSNVhoZVhyeERjZ2JNNDh5blExRFpuakM0VVZjTFBP?=
 =?utf-8?B?Y1RNbkt6SE5EY0N1VHlEUnpqV05pcXdSaGJrRmZuMDd5WWUzQmdweUQwZWxE?=
 =?utf-8?B?ZVpiMSs5Wm81Q3BFcEMwT1JKRVoyUEFGUExFcXVHeFJ0dmtVR1pDN0MrbjZB?=
 =?utf-8?B?UFZhajBuMno0K0Y4ck1wdDRlRjZrTy9lVjlrV2hkZCsxajhMY0d3QXRSbUZE?=
 =?utf-8?B?WEVjRXVxaWtvSkZBU2JrY1dkdHp1c01mS1NCT3ZrQkNjY0ppeUMvOXIzenJk?=
 =?utf-8?B?NE9oK25tMFh5RUZvbXJkNUdibmVOOFMwMFoxcWJ6OXM1ZmU3QzhvbWs1Vkla?=
 =?utf-8?B?bXZRZFg3T1VpUFhQM2t6TEZwVmIvblB4cHB6Y212SUlSS3p2SGhLVDFFN1Vx?=
 =?utf-8?B?c1oyRFZZbWtHVXFDempNQThkMnQ1WUdrMlhEWlorNnBnbnZiRWIyQXJCYjRy?=
 =?utf-8?B?dmFmdkk2Zk41Q1BPeHdHd1JyN3NmOHZtUEsvNEhXYnorZUtqVlNFcWxGd2ZB?=
 =?utf-8?B?cEFGTE1lbnIrbXpXZmpGZjdoQTk0SzJkR0FZNTFjaFROeDd5eXIzUG5wRjYv?=
 =?utf-8?B?bk54c25TSGFJcnJHRkxlZGQvVWdlUm0xMG5EZ1R5aS96YnZrSTh4L1pkQXRa?=
 =?utf-8?B?b2U1ZFo1L1h6UFMvQ1BOdTdEcjk0RmFKNE5EYVVPZEdWdjZ0ZzIrY0hXSHNK?=
 =?utf-8?B?VGdMTFd0ZEFXVGRqRWhRb2E0T2RrejBUNktxaTF6QlFIbHpCM0dxaU1pRlFh?=
 =?utf-8?B?S3NrLzNFSHRnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?em9qdkNlNlh2TGlPWFZSTk9xMlNVd2FacjB6d1N3ZWtXTGdtVDRHd21Ed1Jm?=
 =?utf-8?B?bUVOT3g1enF1aVdoY3poLzZoVkpTdG1vSlJPMGttcjRheUxyODBicEtEbWxD?=
 =?utf-8?B?N0JBNDg2QjhQWWxTVmhHWm9QdXQrMDh5Z3YwUW55ajFhTGQ5U1hKM0NVNWxT?=
 =?utf-8?B?MnlTeVVHMWlkbjZ5UFhHTEUxb1plZnJHbGh6WWMyVzZyTkwwaTIrNFpPc1ho?=
 =?utf-8?B?UE0xNDJ4cmlpc2d1TWFNUzlVMnE1RTAxV1lycFVVWTZ4dmc2aktpWGVyeUo2?=
 =?utf-8?B?aUJkeDJHU1F5cGpLUzcySE54QjlJbGdzanFmclMvcTFTbmNCNWNzSFVVZnFW?=
 =?utf-8?B?Q1BUWVFVTmdVUmFnc0F2UDZtbHVjMWFDMDFDdC9FSlRQR3dYc0dsY2tIbUND?=
 =?utf-8?B?S3Z4YTNpOEluQUxwQVdiaWtCZy95a1BiSy82REl6bVdvMVQ2d2t3ZS9zK1pk?=
 =?utf-8?B?SVNBbWllZUcwTUpGM3ZEb1p5K3owbGdnSnNRWDlRVlFpNExhY3Y3b0gzcGVX?=
 =?utf-8?B?Ymh3bjRGNE9tZHF3VFVYd05qait4OEtJSUNXVUhjQ1hTeWhWeGRwRWNyRWRw?=
 =?utf-8?B?djJoYis3ajcySmRFbU55U3ByZG9EU2w2SkpBNkszRlZ0b3ZmMkh4UmgwWHVs?=
 =?utf-8?B?YkRVN01vSWFtZ0gvZ1JmODBjQUNoZlF6MFg0VEpPMk5FQWk4WUxFV1JTaEw4?=
 =?utf-8?B?YkJoeURrNkxtZXBDQ3VUTHpXQ1VtTE1Cc21HUVQ5Q0xEODVzWlBkSHJ1TlI0?=
 =?utf-8?B?U0E2dlhzenBlbVhaczdLa3lqZVdiOHc2WmtZL21ZdmI1a0phYUthcU04Y2cz?=
 =?utf-8?B?K2p2ckVFeWx2ZUlQWnBYeEJmSGVua2NSaFpTd2ZTc20rb3lVMHFYbTgycXpB?=
 =?utf-8?B?cGxaSXhBdUY0dUlSTWcwc25ZTElid2pCSmpWVmNneE5PTTdNekJOV2tmWXVW?=
 =?utf-8?B?N0ZDUjBnRW53TWRraU5mdWQzaTZtYm5EZ1dEQTNlek96d3dYYktXdGxXTGk4?=
 =?utf-8?B?MzgyQ1V3S1REaERmSmJadVpCYmVDT1FUVWtvL2ZheHkxckNoREZoT3o1QlJh?=
 =?utf-8?B?UEc3VEJ6R1NKV2RJTS9CWmtzNVZGYW1LbDhobER0YXhwa3h6OW00UXAzaXVN?=
 =?utf-8?B?WUZyTDlkdkMyaHd4T29BZm9BQmtJM0FhYTNDZTV5YnpocTF6K2NwenIvR2hy?=
 =?utf-8?B?UHZLUFlhb2QrcTlrdDVVb2MvU0NyZ0lyZkVVQWtpa1BMVTlmTkFTMmRNODI3?=
 =?utf-8?B?eHJRell6SWRmNStXeXFkNEEyZmdvenZSUktMM3JzbHJuQkZYOFcwLytKQ2Qz?=
 =?utf-8?B?UkRyQUxxbXFhcHNqSFpBd3U1Mm1ISmEzT2YwMHdJelZ5VnQ0QURrN2c4YjNQ?=
 =?utf-8?B?ZjROVVlNZm84T1NwWGk1UkNSM2hkSW0zMUZaRDE2d25CcUQwaUhQQ25xMjBC?=
 =?utf-8?B?Nk5aT2lJY0RSbVU0NG1kQ3RBODFUcU9YOUUrNUJFZlZqaG96b25EME41dDVv?=
 =?utf-8?B?Uk5JbWthYWkwc1cvdTVkVkVvWngxL1BZRlN4TSs2dGo4QVphRUtIZVU4WlJy?=
 =?utf-8?B?VFZsZTVSd3ZOamhFOW10aTdpb29GNHlnT1BoaXNKNWhzQTBaVFViN2xOd0s1?=
 =?utf-8?B?V3pyWVFhTnVoQ3lScUFQT2VZMER0ckNWRVoyNm1IVDdaZnQyWEdXeDdxY1Zi?=
 =?utf-8?B?UEVvQTF3SkdpQVd4S0JESXdhaHgzakxOamZaYzlLSUhHeDhoRjdlL3BMamRU?=
 =?utf-8?B?WnFOVnNpKzVzdVlNeG9vd2c4VFV1a2luQXBrREFCTDNvbFcwYzY1My9oVXB4?=
 =?utf-8?B?bEcwMnN2U1BXQXl5ZGJaWlZSTW80TkFKS0VpTTNjQ0hUKzhnTXAxMzJibnZt?=
 =?utf-8?B?cWFRSnJvVjRpNFFZSGRqbUNDVSs3VmdXRmRncUVwV1p6QmRXTjUrM1Z6Tk1D?=
 =?utf-8?B?WGNsYitNdXllcDE3R0k0RWN2VmRGMFRYb0hIUDNUOGRBcVQzclBXU3NiN1Nu?=
 =?utf-8?B?WWhTWWlmSlZIdjJLalROZnEyQ1BUcktsdWQ3ck1UWTVrTmNQbzRRMWdIeHBt?=
 =?utf-8?B?L2tZamFSTXlveG8wa2tESFVOSDlMd0pEQXpabGlmYU9HWXJZT2FTbUFQYy91?=
 =?utf-8?Q?jaAIjVKpXbCo6mk4D6krzDrZB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f11b84-9703-4f7f-a0ad-08ddb540b08b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 06:06:00.1922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9j+jovC6IxMQA7sf983TMtCLqEVM47iGrBp7KEzRZBmfJ9hEQPOoaZ6d0KdFbW0acQ51ggFg/Cwds9oeRQxcaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8906

MISC protocol supports getting system log regarding system sleep latency
,wakeup interrupt and etc. Add the API for user to retrieve the
information from SM.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 78 ++++++++++++++++++++++
 include/linux/scmi_imx_protocol.h                  | 19 ++++++
 2 files changed, 97 insertions(+)

diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
index d5b24bc4d4ca6c19f4cddfaea6e9d9b32a4c92f7..1a6d75357b76ce6bb7d06461999b368c27f1fa43 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
@@ -28,6 +28,7 @@ enum scmi_imx_misc_protocol_cmd {
 	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
 	SCMI_IMX_MISC_SI_INFO = 0xB,
 	SCMI_IMX_MISC_CFG_INFO = 0xC,
+	SCMI_IMX_MISC_SYSLOG = 0xD,
 	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
 };
 
@@ -87,6 +88,19 @@ struct scmi_imx_misc_si_info_out {
 	u8 siname[MISC_MAX_SINAME];
 };
 
+struct scmi_imx_misc_syslog_in {
+	__le32 flags;
+	__le32 index;
+};
+
+#define REMAINING(x)	le32_get_bits((x), GENMASK(31, 20))
+#define RETURNED(x)	le32_get_bits((x), GENMASK(11, 0))
+
+struct scmi_imx_misc_syslog_out {
+	__le32 numlogflags;
+	__le32 syslog[];
+};
+
 static int scmi_imx_misc_attributes_get(const struct scmi_protocol_handle *ph,
 					struct scmi_imx_misc_info *mi)
 {
@@ -368,6 +382,69 @@ static int scmi_imx_misc_silicon_info(const struct scmi_protocol_handle *ph,
 	return ret;
 }
 
+struct scmi_imx_misc_syslog_ipriv {
+	u32 *array;
+};
+
+static void iter_misc_syslog_prepare_message(void *message, u32 desc_index,
+					     const void *priv)
+{
+	struct scmi_imx_misc_syslog_in *msg = message;
+
+	msg->flags = cpu_to_le32(0);
+	msg->index = cpu_to_le32(desc_index);
+}
+
+static int iter_misc_syslog_update_state(struct scmi_iterator_state *st,
+					 const void *response, void *priv)
+{
+	const struct scmi_imx_misc_syslog_out *r = response;
+
+	st->num_returned = RETURNED(r->numlogflags);
+	st->num_remaining = REMAINING(r->numlogflags);
+
+	return 0;
+}
+
+static int
+iter_misc_syslog_process_response(const struct scmi_protocol_handle *ph,
+				  const void *response,
+				  struct scmi_iterator_state *st, void *priv)
+{
+	const struct scmi_imx_misc_syslog_out *r = response;
+	struct scmi_imx_misc_syslog_ipriv *p = priv;
+
+	p->array[st->desc_index + st->loop_idx] =
+		le32_to_cpu(r->syslog[st->loop_idx]);
+
+	return 0;
+}
+
+static int scmi_imx_misc_syslog(const struct scmi_protocol_handle *ph, u16 size,
+				void *array)
+{
+	struct scmi_iterator_ops ops = {
+		.prepare_message = iter_misc_syslog_prepare_message,
+		.update_state = iter_misc_syslog_update_state,
+		.process_response = iter_misc_syslog_process_response,
+	};
+	struct scmi_imx_misc_syslog_ipriv ipriv = {
+		.array = array,
+	};
+	void *iter;
+
+	if (!array || !size)
+		return -EINVAL;
+
+	iter = ph->hops->iter_response_init(ph, &ops, size, SCMI_IMX_MISC_SYSLOG,
+					    sizeof(struct scmi_imx_misc_syslog_in),
+					    &ipriv);
+	if (IS_ERR(iter))
+		return PTR_ERR(iter);
+
+	return ph->hops->iter_response_run(iter);
+}
+
 static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
 	.misc_cfg_info = scmi_imx_misc_cfg_info,
 	.misc_ctrl_set = scmi_imx_misc_ctrl_set,
@@ -375,6 +452,7 @@ static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
 	.misc_ctrl_req_notify = scmi_imx_misc_ctrl_notify,
 	.misc_discover_build_info = scmi_imx_discover_build_info,
 	.misc_silicon_info = scmi_imx_misc_silicon_info,
+	.misc_syslog = scmi_imx_misc_syslog,
 };
 
 static int scmi_imx_misc_protocol_init(const struct scmi_protocol_handle *ph)
diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
index 0e639dfb5d16e281e2ccf006a63694b316c431f4..ff34d974046aa982fa9f5d46fc673412e01a532d 100644
--- a/include/linux/scmi_imx_protocol.h
+++ b/include/linux/scmi_imx_protocol.h
@@ -71,6 +71,23 @@ struct scmi_imx_misc_system_info {
 	u8 siname[MISC_MAX_SINAME];
 };
 
+struct scmi_imx_misc_sys_sleep_rec {
+	u32 sleepentryusec;
+	u32 sleepexitusec;
+	u32 sleepcnt;
+	u32 wakesource;
+	u32 mixpwrstat;
+	u32 mempwrstat;
+	u32 pllpwrstat;
+	u32 syssleepmode;
+	u32 syssleepflags;
+};
+
+struct scmi_imx_misc_syslog {
+	struct scmi_imx_misc_sys_sleep_rec syssleeprecord;
+	uint32_t deverrlog;
+};
+
 struct scmi_imx_misc_proto_ops {
 	int (*misc_cfg_info)(const struct scmi_protocol_handle *ph,
 			     struct scmi_imx_misc_system_info *info);
@@ -84,6 +101,8 @@ struct scmi_imx_misc_proto_ops {
 					struct scmi_imx_misc_system_info *info);
 	int (*misc_silicon_info)(const struct scmi_protocol_handle *ph,
 				 struct scmi_imx_misc_system_info *info);
+	int (*misc_syslog)(const struct scmi_protocol_handle *ph, u16 size,
+			  void *array);
 };
 
 /* See LMM_ATTRIBUTES in imx95.rst */

-- 
2.37.1

