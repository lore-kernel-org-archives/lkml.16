Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2081.outbound.protection.outlook.com [40.107.103.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F51219A9D;
	Mon, 31 Mar 2025 19:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743447796; cv=fail; b=Nk9o0yL6leoeloefcGfQO/uCtYqOKA+e4Uh7GT+y/Yy284TgC+lJ0+QFmjzFSK5c39PxYxhE7Q9lTYkenDEhUjSEk/ZzhdYEP2adJHmXiCks7H6K4VnEgnAHltGFx1Ae8bbb2hU6DAoEHs5p7NdGmgF1Rv9r6tznHEdvRYT8i/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743447796; c=relaxed/simple;
	bh=RBMSI3ADIJKGIqpzwUcdguMq0thFRHCRC1IYciJ1o8o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=N5a0OSO++G7XcsnMKFGONRSvaVp0BdRz4QAf5Na/Luadt0MyNF586+0BbYs/6Qsp7NsZSP/9fUG0mVpI7dGXyliPm7ew+CVWfKuiYT2RMG2S7gcsY+vsVLRdXt+5zZm/Vah4MG+asxi2NoozDMFtojpcgP0XEaLtzoDWlB1yn3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BDvVVxXj; arc=fail smtp.client-ip=40.107.103.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BDvVVxXj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGSe47cF8GEd3sVD91+ozhreEh1mDanafETfgOUsSBpod+QMbIZJMiA0Qpwk6VmUof2Heuu26dX/fAmtUJrZVfTFaLG4fXaQOchRA+JUZtGjXlCrT0lFIyIhvqfEfPiWpxsh9TxSMYsko/xvbVWEsaPBWJwstlp/hEjMe9XVL6q1+lFDIL8nMyCN3KU9ph3Gx6ZDX7qtxXN3gR7FtdMNqZv5S00Y9FWompIHznpcAgdyU7mns8Xt0wAGXTjYTqsh6o4zaFHfUjPocSBMD0AFK3qfKh/QX4GIn1HoQoyoPgZFccOwaFkvO60edlQonuByqdTHMCrvtWFGaW7iyVXtKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBgbXxCRcUEKMXlHB4yezFVKoHPmVvq26W8DlLVrh4s=;
 b=H3IwWD45DzXwsQdwXjAVxhXMeI3NyxGKN2fHOkc97g2SEKWxlsFIFKELsMZHzGVbE62ptQyJ1NREovjd2fMKl2dMjZiwfrQXiVraY6cQZ3C9Osy1vStdzbGMkFao+pGHL1EqXh3peHPTbierAh+K5hPnTTz7ENbXNftfrgaRwofQAhMtjPS0vUgQE1iGjRm5EoHfUVW0h4THTIvNc8jDMtf/DF64aRncuzjJGVBVB8hUdn6S/+9KjpZS4Uxt0bQ4NwkCnCK618u2jLxViS3WRW2yIicBgZA2VgvG6IGk7RH6oZKw4exvZBu9p2o9RUkapJssMCy6hf0+pv+RWButiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBgbXxCRcUEKMXlHB4yezFVKoHPmVvq26W8DlLVrh4s=;
 b=BDvVVxXjYbBH+kndShQagdQflLb5GwOB6y8fOdeAl7knGZGj0zU2rprKn+I92fvHtJymmSgNcsWx1EQ2+QTs/iezy8+UoCnu2Rp3jqDojHzNoxOtK7C+yEsHVwniAyZNbNZ0/gB3/VFyoO9Maj2RihtT/ZmfJ4lw6oJIFpnFseJH3+OksOPo8Tp9q/+ufZWcxYPXNfa6cVuvzMMReQvXwbzdFeC+QeN5ug3IbRSwTpUKWcgKO+rdYW9Wn/Rm1xUVQ4ZWYzDe6RTMIXCnF6tTVT11HV2SQTbk7Fcw0jR5t7ksOFwmQSMG2p2Ec6IJEweXTPk0Sp8xdoZA5lTkQnnbrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8557.eurprd04.prod.outlook.com (2603:10a6:102:214::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 19:03:13 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 19:03:13 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 31 Mar 2025 15:02:41 -0400
Subject: [PATCH 3/8] arm64: dts: imx8dxl-evk: Add pcie0-ep node and use
 unified pcie0 label
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-imx8_pcie_ep_dts-v1-3-270ef0868ac9@nxp.com>
References: <20250331-imx8_pcie_ep_dts-v1-0-270ef0868ac9@nxp.com>
In-Reply-To: <20250331-imx8_pcie_ep_dts-v1-0-270ef0868ac9@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 hongxing.zhu@nxp.com, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743447781; l=1063;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=RBMSI3ADIJKGIqpzwUcdguMq0thFRHCRC1IYciJ1o8o=;
 b=NAjLA8nU+qk9DnmNxrnmxQv1iS0ikcdiyijCM8XnGbs8FYR2l3eG2d4oUoGAUq0Pg+IfIhVOk
 l3HJxMoSqmJAPkwczCvYWuiYNtrjwlL4EBb4mML1k9bPwUbME4bR92w
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH1PEPF000132E4.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: 07125552-9510-4bad-446c-08dd7086afb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEh2S1BHNXArQW9jYW90bzh1K2MyeWJPdFRxeDhCSU5YQWtwNElTYmV2ZEFU?=
 =?utf-8?B?dkt5Yk12SWJzd3NSMDBMZmRpSGhjVXRTenJuRTJXYzlLbzc2UlY1THdtVEV5?=
 =?utf-8?B?T2FyWFlwS1phNmJvRDl5MnRiSDFYNTF4dng3L1VRRWxzTFNGbGNBSVJzbEVF?=
 =?utf-8?B?Y3NqK3BqM3l0OEw5MW1hL1lQLzdpLzJ6NjY3OW5VSnBEUzYvaWU0MlNxQTc3?=
 =?utf-8?B?cGsrbjE0TG9Uc2FqQjV6elA2d1RhM0pta2pwcEMvMHhtYjRxejlGcmNaYWpu?=
 =?utf-8?B?Z0pVcjgyWm1RTWJVb2RMbkVES0VpNC9DUlpDOEJFYllVcVVGeXhBbzNHV0Jj?=
 =?utf-8?B?b1NvQ0pteFIxaUFGOGplaUY2RVFxRmJndjFlQVpsWkdpeXQrUFcrRjkxVlRo?=
 =?utf-8?B?am5lbGNDRldWTGduVjRNN2FvVHRRS3YwWVE3eEY4RVVQS01wVHBkNlJNRFcz?=
 =?utf-8?B?TlRFTSt1eXdWUlo5R0lQWC8zSE41UU11MzRva3VrNk5GRWVCcGNFd2lwdlNw?=
 =?utf-8?B?ZmtIQVZDU3g2SFpQZzhtaTh3ZXFUdjhqcnY1OUluR2p3aG9YcklPM09URmpM?=
 =?utf-8?B?QUNoakhHYVI2ZkkzMFNrNTNwT0wvS1NNOGhKTERmK0diN0FZb1lLSlduZk8z?=
 =?utf-8?B?OTlEQkdSTWN3Z0JURlR4Y0M1OWlVYUU2My9YSEJmNUZ2VDYwRHVLMDN4UVFD?=
 =?utf-8?B?My9ZSDcxZ0RyUXlOUkhkeVliNy9qMFdIK1hldmpmb3ZlZ2g5UVVHZkk3OC8v?=
 =?utf-8?B?VUsraUhPTjFlUjZReWp1WnRVclNTODl4TEhaR3FBdnZaVUJwRWN6ZWdRNHI5?=
 =?utf-8?B?cy94ZlFYUzdIQVV2S0sra2psNEROWk9tZUN1cHJkbzMrS0RtWlkrR2xqRUIv?=
 =?utf-8?B?aGVQb1FyOGRyZk15ZkNxbzRuMEhQN2ZIVTdId1NMNG9jOUdkUDVkdjIvblM1?=
 =?utf-8?B?dlVaaGJjenF3YmVWSCtMc2c4a3VZVFBLV1QySVAyNjlvTXBTWnY3aHVlcXA2?=
 =?utf-8?B?N0dxZjRiSkpXYVJ6R2hvT2RZWVBhMnJaN3BnQWNadHhldjM2Q3dhOVRSOWJy?=
 =?utf-8?B?a2ZNZU11eU5Ea0doTk9YcGZpR1pFNjlaYy9vZDJKd1ZBeGFwYXdwQU5DUHZl?=
 =?utf-8?B?eFRmUU5qSi9KbC9JUTdTZkNPclpvZGh6T3htVmIyd0w0VmFMVDIxQ2k5WVBw?=
 =?utf-8?B?RktOOFBGWE9VY3JNVDg4T1M4TUhEbVZCS2toOTlkMFExUXVNbmF4ZGo1cjZj?=
 =?utf-8?B?S2VpUWE0eWlvclZMOG1Tc054WTRmSUhCdUN0aVRXZmdEVkJtNVpmV2puTTVa?=
 =?utf-8?B?Z2pPM012elFzSWVLNVBtNlJtSkp3cXJKVlpLbkZZZ3pKN2xNd0FHS2Rid0E0?=
 =?utf-8?B?MlloWWJXSlE0QTk0RHFIS0NDUTFTdnp3ditFMTZLNDNLcjhOaVRrZ1I1ejkw?=
 =?utf-8?B?OHNjN1czRlZnbVVnREYxTWVWNGlLTHNSYzREcmI4WGI3SWlLMWZxaTJiQ0tQ?=
 =?utf-8?B?TzcyMnJsZW43RDJBTUFHTHp0Z2Y1ZWcrQU5BZFA3NmlQT3FOSjNPQ1R5blZG?=
 =?utf-8?B?R2llNFJPSTdRR24zZ0ZRdms1dTkzNlYvYmdzcWZjb0gzT0kwL0lWN3VYSDds?=
 =?utf-8?B?MENXc2NTYUY0aHhlL3hMM1crd0pMVitzOXFFVlZ3YjZLa0dvVHhBNllCeXRa?=
 =?utf-8?B?OTk0Q0JORVVNVnNrOEQ0alNweXBXM2xzUGM2WjFzMzJIWVRiZXp0czRZcFlh?=
 =?utf-8?B?c2V3UVlTY3I4K0t6WXFsQUVMVU41bFIvWVpTdEx3Q1NpSExacG1SV1VzS2Yv?=
 =?utf-8?B?Z3lYYkNBSE5XdWJZMDNrSXZXRDdsd1hEcWFaOURPWmxOOU1GdldvYko0b1lU?=
 =?utf-8?B?N0V3Wkw5K2lXREVrZFFJbTFxREhoUGxtYTVYQ3phZlB1SElLZUNGRHVWSkZB?=
 =?utf-8?Q?XfzibHV0U8JDSi0H5YRHccazDyX55qBh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXRYNXFtL04wS3Nxc1VsZFdEN0dDNHRlOHMxdlBPeVpHcWdTd1NvQWhtSFVL?=
 =?utf-8?B?dDBKRkNBYmMyWk9oWk42eDZxSHV0eHAwVnZGTFgyZUlPVzVIUjNWSFlOcUdu?=
 =?utf-8?B?Y2dBQXpYekZTRFJpRUllUHF1K2RGTkJLQlpPSEFaczJzRGRyY0lad1hnQ2Zr?=
 =?utf-8?B?SEpWVkxwb3VFbFRVMHhlRHRZc3Y5d3dZNE9GUmkxdWtQYTNGaTNUOFJsOFpK?=
 =?utf-8?B?dkVLY21mM1JmaUtQYVRQY3lOVGM2SXoxTlRmT0xzQ2tJajlNZ3pJdDJKd2h6?=
 =?utf-8?B?ckJweFdFZUVIOHoyU0IxLzZjT21sZ3Z5RTJpNE9XOGx1eTIzVUtnaGlERGZh?=
 =?utf-8?B?T3pkUkxLY1IwMmFuTXBNT2t6c2dNYVRJZ2hpaHRUNmRoVXBmSkJUSmN2ckRH?=
 =?utf-8?B?TXorcDVvWFhRZjZwekQ0bmdoakQ5MVc4NGg0bDY3enNRSEVaZ1NkV1dTNVJV?=
 =?utf-8?B?amx5RFhjT1ZpYnFrVFhMRFd0aTN0d1dqZUpWTFRsZHVTUlVMZFhNN1BvdzZU?=
 =?utf-8?B?TS8wUStjS3oyTW1tU3Q1RnAzQkl4N0Jzb1VBQmJ0MU1QTkxHZUkra1FtUnVo?=
 =?utf-8?B?d1RzRzF0K212QnFDajd4M1NydWdsUmZvTWdZMS9wUE5oeFNIQmEzVkxUdzlD?=
 =?utf-8?B?SVBGK1RQSW5NbWdJM3NzMlB3U01HME0wY2sxY1MyTUdEKzFyL2NpS21BWHpI?=
 =?utf-8?B?RzJJNFM0MmpIT2RHQXhlWXpPbCs3eGhybGcrR2FLQXR6dklESEU2OVRnVHZK?=
 =?utf-8?B?WmNKUXcrQjM5ZkJsZXI5RU5BR084KzBuQnJGTHVBV05EVkkzOGYwQVFoenpw?=
 =?utf-8?B?SHdidXJ3cjZCSFBLMHJSM1JWRENQWWlldkxiY0tEVmcvN2F3QUNrdyt0OEpS?=
 =?utf-8?B?YzlZRkt6c1NtRDJEcGwrZlFBZWE2Uy9uQmFVbnpOZE5lT2pIZXdpZGFwSUMr?=
 =?utf-8?B?eENueitXYWVwWVlNZW02OHBEQ013VXUrSGJ3cEVHM3AvWEFhdGVKam9SckJx?=
 =?utf-8?B?OVJkT095YStaMFg3SENDYkI1R3hkV2pTb3VWNmZQeUxYRDljTmJ0S2RtR01x?=
 =?utf-8?B?Z2hNR2xrWnZ0N3RGRk1MV3V5dk0reEt4cE5hd2VhY3orRTJTWFJCT0pCWGls?=
 =?utf-8?B?UXBkdzJZQ0Q5T1Z5bkJONklwQmowZTByT3FreHFORk5PY1FIaVBUdyt5ek9B?=
 =?utf-8?B?dXpGTEFoSmRCTzdxY241Rk1FOFFqSVZ0b0FnalA4akFnUnF0ekJhRDZma2l5?=
 =?utf-8?B?OUEybmFWb2xvTE5oQW51aGZsMlFIME5iRHdVUEJBRVh5WW4wUVJhZkJsdE1X?=
 =?utf-8?B?RHlXcHhmcVZBY1c5alVmdG1IVDgyUWJTZ1RCMmQycUlDcllWdS9nWEk5VSsx?=
 =?utf-8?B?VWJPUkZxRXoxRVRFK0FZcmR3bzdKcU5sem9sNThNeld6ZUZOUG5PVE5CV1dN?=
 =?utf-8?B?czh5RDF3UGlreU1uNVJRTlltREJGeUxhL3NkMkIzeFRJR2M5bGdUWUZqYkZl?=
 =?utf-8?B?b0xtYklybXphbC9KU2V2dmJjbG1XK1lrZTFqZS9DMzEzUkxmeXNqY3dWanNZ?=
 =?utf-8?B?WU80V3dPK3UrODhNMjZGcGQ4amU2UVdQRk5DVXVNdmV6b3V3NElwa0tsc1d5?=
 =?utf-8?B?RStlQmtmaE9OQkhMM1diSVdZcGFkN3dPeW1WWDBzdGh2c1RaMVJQNXM4OWEx?=
 =?utf-8?B?cE9rWDlLTkJwVlhhRkpnTnQ3elYyTC8wWGh4MHNUdGhKeXlRVmc1eHFYUXF6?=
 =?utf-8?B?TUx3VkR2eG0wOWd5dTZnRExTb3RwVS8zSEpleHhkY3FmaTY0VTl1aUhiMUxD?=
 =?utf-8?B?Q2tNTEhZeHFpbU90dGtndmFEUUd1elUraUlQcm1BekRSZTdRdGRBdkNYNEE1?=
 =?utf-8?B?TzZTbGVuWlc2c1JmSEF0azEvUy9jb1FNN0Z1UnJ0L2R4WGNmT1crYUNJSUlF?=
 =?utf-8?B?K1ZuVjNCbmFXZ3VwOGFHdHhUcW1zcGtGME9aeGJ0STlDSUVvVWhSbUZ4a25Y?=
 =?utf-8?B?SllnSGVNdVVRc0J0T04zU1FmZzhEUG8rUTlRT2VlZnBmM1ZlMU5pUnJYMVlt?=
 =?utf-8?B?VzF2a0kyVy8rRmZQR3VNQmhKMUpNKzBVZjVaUzJzbUJ1alRTQS9JV2sxMmJW?=
 =?utf-8?Q?rbFwRy6STph0kBmpZYsTfizLP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07125552-9510-4bad-446c-08dd7086afb8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 19:03:13.4256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j4M2xK+CqmoGC00KmtAORv5ai9TWvkLb5XFczAT/D/L4ABuqR/jD7wzq/vL4CHetG/gDYOADCuEMqrXWeI8xzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8557

Use unified pcie0 label and add pcie0-ep node.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
index 5f3b4014e1521..b6d64d3906eaf 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
@@ -642,7 +642,7 @@ &lsio_gpio5 {
 	status = "okay";
 };
 
-&pcieb {
+&pcie0 {
 	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pcieb>;
@@ -652,6 +652,16 @@ &pcieb {
 	status = "okay";
 };
 
+&pcie0_ep{
+	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
+	phy-names = "pcie-phy";
+	pinctrl-0 = <&pinctrl_pcieb>;
+	pinctrl-names = "default";
+	reset-gpio = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+	vpcie-supply = <&reg_pcieb>;
+	status = "disabled";
+};
+
 &sai0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai0>;

-- 
2.34.1

