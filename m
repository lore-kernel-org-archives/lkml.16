Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2063.outbound.protection.outlook.com [40.107.105.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731092940F;
	Wed,  9 Apr 2025 02:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744165506; cv=fail; b=KwcPfebqlff2jWFCvTIxIcb3ajNaLRtv9bHreF4rDqrPrNDnUmplV8MvpPHeo9vcxO5CAmH4iC7/iILeH12WxhvhmFnZYX37F/1XTUVMQHROzcYNTVz/Zd6AzrCKsW3/vyBllT7ALWTvl2IOGYhNwoAmiNVghNg9AAM0yx7jKuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744165506; c=relaxed/simple;
	bh=ivD0wIklj1jD0AcXtuXJyEQR5Yv7aZSVFRb4oYRVuoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tVjN6hscWSDuBWwNxYlTYVAll9I62H4Cf00udhKPYRhndf/2GkWtTGv9gET/PheHGnrn11k7X4Y1bZXT/JmfkffT0tsQEqMhUJ3Jv/Pil3X1RGemo9XKSPoZ/JSeVMZ9ik+YOc6RYg9oHza3UjX7kbGBI8tyeBNy6dIjhGLUAD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KF5tBrf6; arc=fail smtp.client-ip=40.107.105.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KF5tBrf6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwBg6j6ZPefwrvzA/TWP3Vwmknl2YJuMnBhqe3HlrGmvGRXlQqVuGgKiLOWdV8CvNOj68OIKu1zMT04XySQPRtoSepDQkGYr7plz1/ihekbGIGbsuArA4gbae74ez55aehzj5fVtdh9gVjPdri6ypeoQ8lM1peQjjdmo2udpAw7c0zSIsF7txRggSRZRUlmTrWvtwcIjyScAs6pX/7TSHsqvs5wj7DoZJ5b4Sdyqi8WtA0RC6pGDfBO5DxC6CWirQlkHSwz1Zd8GgFIx5f5mUGGVsb/OZ5ubJ2F7O8IOHs6DfNc5/yYb155xKucG2BiAwStY8AbnpT8syy6ElaSuFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYJeeJRYL2cHEUPTDwmS3LMbu/7nu7bbE/aPRqFm0Pk=;
 b=Pe1wZU15+mbfqK8pkq+y0fOzm0I2JHNZapnRPryouFHystTpP9X83ERkbKz41gATfAvrkQjVvMcID2gfNGs8NFqJsblVIEvwNQ4mvspc79zPKtd4zqht+nccZEcoH+iNx1KyKHmlfcrc2H8GuIegzWTIXCCTiowvr1JLJXvbqngHuiL5X466z0VBzrM17P3Oywd8iDp0/ofE7Cqk8qHXLNXH82tv5Sz4ZmBMgmX9DGMe+4Y4WkIhWHNwoXliwC1cCJeKorL7gpkGS7IVWUDSwlB8Lu6nTUOpgSm29abH8ZtF8l+x+UkueJDxGR0ya7eD4v9bv0tGi5BEmV2KRATQGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYJeeJRYL2cHEUPTDwmS3LMbu/7nu7bbE/aPRqFm0Pk=;
 b=KF5tBrf64mn0REN0UTQc/EW1mkNjmB9pVDrEDd9fxAK5SR0tbDLg3AnQMK4/uAiEqST7LUZhCblaEPvQs0Rxoni510MFSmvbkzOJpDGEo7W0Nv/UrQiFr+QxsGMcVyErsrlJ0/K1gUod9NpoImZ/hyUeK1BiVlzKSUpEmjgV3A1wZc//qGlQc69Ds24tIPElMOW06QEfEPXWlSEKwXeyffSvx8jcAzwX+kfgBD6Id9U3N/coZQmoopjiVBjbxiV5OJNFYqQvFK1yXU2YYwwQBt93hvCT4bbVEeNjbT2RhiscRwnO0YnF4qLk3XltOdZoDzTknsyvJdSWmpWE04v2+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7763.eurprd04.prod.outlook.com (2603:10a6:20b:246::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 02:25:01 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 02:25:01 +0000
Date: Wed, 9 Apr 2025 11:33:25 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 3/7] firmware: arm_scmi: imx: Add i.MX95 LMM protocol
Message-ID: <20250409033325.GA27988@nxa18884-linux>
References: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
 <20250408-imx-lmm-cpu-v4-3-4c5f4a456e49@nxp.com>
 <b85cd7c9-1747-4f8d-82e5-5bf734263566@stanley.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b85cd7c9-1747-4f8d-82e5-5bf734263566@stanley.mountain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:3:18::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM8PR04MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: aff640d8-5865-461c-2fc2-08dd770dbad8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DH5sPYSqb7C7c+CV/HWInYoeoxpvD4dRlnpXDQCGAgjVioh/5BeQxLSwtI9N?=
 =?us-ascii?Q?t+8lsK7AcOLYp7UdaUDMdzx4WsxbimtQoTlCFgFwbZZmurjhxnn6+PYmzFM8?=
 =?us-ascii?Q?hbRNJX3t1nCBE1ry9WW6ERtgIh3KEnYnEAXwvUk8JsrPyLB8wcj37ai4SPjo?=
 =?us-ascii?Q?BrjSI8tk/E1wVz+nQGpnHOGkqB0/HBarDvnnh2HiUnqX6Tc99/zg23vEJ6dM?=
 =?us-ascii?Q?z/Gn9x8d7kX367RskC/3XbFRq14qBJ6os+O0IpWxu0ck+vfI4YrqkRmjjMZD?=
 =?us-ascii?Q?VJgKegcm75riLk0iGwMLsBJNfimpZL+PDFan8rlitKXiDRg/yf9NN2N9TUMe?=
 =?us-ascii?Q?7/H8ElMu8jl5cM7NKJjugw4GfkjIeoVk2R5czQ1J3Zqt+7ofzKI9ubPTPdIW?=
 =?us-ascii?Q?cv0ivomrDE7LzbKcpFpoZUDCgKmmvqUXulrRK0hKcgBtNORWLS3kQw9OZNLf?=
 =?us-ascii?Q?TI9Bao0Ud1+lO9SGRyJoXTTh6LITzlvvSRYY3e1cRGeex2u7xq3h5VSneAqh?=
 =?us-ascii?Q?+BeXh85Wvw73cx2T82CLesirdz8fM6Nfqr1HbSSyqqFa70nJdZ+vQGeZpFFI?=
 =?us-ascii?Q?TM1mljP/L5bpXQN75SByWqBtLr9yL6NI23el27HemNutZTdajQOGRB4AiEdJ?=
 =?us-ascii?Q?MTAbMDZQjTQmiqma+NEdBtftgFVm7V6z5n9fKnqI9R+aG7LN8dcLVv0l8xG+?=
 =?us-ascii?Q?NflBkxpxfm9Ebz3/yqWuw2+B3MqS5Y+su2VqK67reyG6ON3J20UBUMMaWnuS?=
 =?us-ascii?Q?cNfJ4rHQp4iIhVNF9QTjMA2/3tassu2hd2+MbW9iXyst96pkRSktK3lZtzFr?=
 =?us-ascii?Q?7rJ8e1N2ohpkiOj+WDynim6T53LrQq+U6ODhsPZ164QIu9r04g3+dn12JyKi?=
 =?us-ascii?Q?a8AG2HoOuPMux0o2sH8cuBngYGfSID/2zujbsdmqb33cFSLd+537lPVc2uTY?=
 =?us-ascii?Q?As0IjrshBCWPLN2Db0VPrTvPXPOhje1kTGFGL59XRJjJWiFGB4BKzHrlKPms?=
 =?us-ascii?Q?neHak9EpBagBXV3cE2CP3/EF5ecfbzhcVb0SLLd9OCLuxMD4VigtpNCg7eKy?=
 =?us-ascii?Q?b2LDqNyLYqB6XGqq09wWteNBwPEakVxIN7DJ+nzVa/juG2iMwIOK1+E25bvQ?=
 =?us-ascii?Q?MqrpnPjfknCMwf2qc/H9VajbyB8GFVFvGZLjB7pb54He0/iKzcD0+R2hX9RB?=
 =?us-ascii?Q?eB4on8EOlhlW8vYgr2pBTREErzr6xbb8a6B/zrOIE+ur37ylaDE2/kkoC+kQ?=
 =?us-ascii?Q?JpjpOW8tk95CBKISuDgy+kuN1dW+gzJx0uLreuZT6XcnDBRhyFplV7K86zXN?=
 =?us-ascii?Q?Tk2brkIeEJ06NTJvqwuRf/qUCKxwGG/0Ne160uW5Ef+60DJ8iy/qCVZ+gTWA?=
 =?us-ascii?Q?DvHqBj3f03OPu8hDGPdLu0BitiQNnR4aZuBFbw52b2vYuLsOYzuG/rCSrkL/?=
 =?us-ascii?Q?drUidkAOAYAtCnaZIynnCPr3/aKN1cLH62ecBvWVf6hYWP1UeH5dxA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ztuKASLEchYIp6QqBrYBOFCr0e/K0rPAHGaxdfrjrgZiR8JR/3mw/HLNPBmQ?=
 =?us-ascii?Q?TWvugWLlO/lpKDq/YHi32yV2AOIt3m0mZqaOhOy1g6CiuVXdY/T423sQmYXu?=
 =?us-ascii?Q?DAPUSCnaFdjckQBBPbCGCXlCeka87OVUDxFGIRZPGHWZFdhfjZuFUjfurJvF?=
 =?us-ascii?Q?Irpy/MKyMAi+1oqfUmo9IndnA58ujcpUZutqD58hMCQ/1elGIAbajhcikWix?=
 =?us-ascii?Q?SKcraVe+spyzj+n3ObMSNBbETzsZ2IKZ+z0hhGoxCkftF/C/V9Yh9EO8hlFl?=
 =?us-ascii?Q?XCU4XWRnTVQoTEWBb0eOW3H4lACLEo54BftC5kI41V6gd157hU7bHWgos3RN?=
 =?us-ascii?Q?/ijdns99SqUl0VujjGhznjKtXSkZb8aaTXROulxBbGTLAyP+hy0n5Pl1mqoc?=
 =?us-ascii?Q?+tpGXjggC9D4lJvhT6nETndC7MynsCQkmDf9mGElG6hVxLP4EY2yAKUF7Lah?=
 =?us-ascii?Q?7yBqNXuxpWLEcvPQlNkVu1VI8VdDH34riUmi3g+jfee1GyAr0N5YrJe6SEM2?=
 =?us-ascii?Q?wtxk/eNsMmYRF606gJkvofHoJEgkLE/Jv1HIx3uH8wSfkT6bBF/tXH4g7ELs?=
 =?us-ascii?Q?psNeDHo7MK7KaOsAibtJ89YuFW4VFSfV34bX8LrP4eufme/6gbT0n31msr3A?=
 =?us-ascii?Q?nKNFdIKm53qr8exC1S2yT/TqmFS7LRa+2MPSMN6foLcoL0LznwFes1UDEdSJ?=
 =?us-ascii?Q?9+GDJmc+DA2MiUvLfDgsgOX7T2Yqph1bp1SBG0+LhnWftyMHmaVQYFaZIWKK?=
 =?us-ascii?Q?nwgz6+dwDrtEp5MoNuaLIatBPF9pupQKwYFXXiFJ7KqhhVqoneDn67qColWQ?=
 =?us-ascii?Q?2Qaq3cz6ez0H9Hn7oXlkg+XyoPbSA1u+ucbAnvp/JdS+0ccEMmx9s172GELk?=
 =?us-ascii?Q?QoN/c+FkKCA0PM88dBmE2Y85vPBHXGaiTGHgS4vQT1MHgy0kxz+3+H3fzdx+?=
 =?us-ascii?Q?RMCrPzfY3xvQSJ15o4Mhn99UkVFLZdbw5SeExP0F8FWJ9qdcdzQv4wLAO6I5?=
 =?us-ascii?Q?t4EyzqPBmpgylX7lMEretzPoHdOUZ3+b0fScPN1N9TvA+LCpOecf3DAB5e2Y?=
 =?us-ascii?Q?pGC6r8yxqt/a2jvwBrKkR7KK0KUY3JB+5GxqlveePV9p7skizI9ssQyXyG3s?=
 =?us-ascii?Q?sI9UAZseF8hsKmHDfuVkm/GfvYYzMyOsvEqdXTvCZdExsvMeksi8ga9eq1WO?=
 =?us-ascii?Q?SMNW9ZDWNg2A+T0EvjuG2mteNocDoaNsIhXBL09Up/Y5FAoQn/7pk73SbZwk?=
 =?us-ascii?Q?pLvI0qM4SerQ9Hcn58lRop1w6xvnJYlYKeW8Sv+nBnAX53VYs++eyNm+/6bE?=
 =?us-ascii?Q?mxQ4q38EYzvuL19lWeL0WwDGUjS6pfjYjo35ikciOpgp1gJIY09CFPDIlvpa?=
 =?us-ascii?Q?9lJrsM2arUhzG6ih3X11YIKDq3D0+Mu00mR/pLZqjN9LBOM+m+vYVZljOWk6?=
 =?us-ascii?Q?UvKdnsUz4/ni0pkmVsmuzLNNCI6metWLKJm6n/RungC/Mp6+99ngyLSyVade?=
 =?us-ascii?Q?CuhKyjzi5nKq9TJZv1I3hDsthzEKSPCUfTwB/D8j4uVd5wnJ/VV0cqk5NFt4?=
 =?us-ascii?Q?Bdql2rR6xqrAtqOQmd6Km32FEoLrqdalokE1TsmY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aff640d8-5865-461c-2fc2-08dd770dbad8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 02:25:01.1342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /nrk+DgjqaWEZbPkE2FbA59954/Ek2dSHNtABMOBrirY5VFZ9KrTNyIeiuhbch9vq2ysCRhGNkliMjtwqwtpFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7763

On Tue, Apr 08, 2025 at 12:21:56PM +0300, Dan Carpenter wrote:
>On Tue, Apr 08, 2025 at 04:44:27PM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> Add Logical Machine Management(LMM) protocol which is intended for boot,
>> shutdown, and reset of other logical machines (LM). It is usually used to
>> allow one LM to manager another used as an offload or accelerator engine.
>> 
>> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  drivers/firmware/arm_scmi/vendors/imx/Kconfig      |  11 +
>>  drivers/firmware/arm_scmi/vendors/imx/Makefile     |   1 +
>>  drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c | 262 +++++++++++++++++++++
>>  include/linux/scmi_imx_protocol.h                  |  32 +++
>>  4 files changed, 306 insertions(+)
>> 
>> diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
>> index a01bf5e47301d2f93c9bfc7eebc77e083ea4ed75..1a936fc87d2350e2a21bccd45dfbeebfa3b90286 100644
>> --- a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
>> +++ b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
>> @@ -12,6 +12,17 @@ config IMX_SCMI_BBM_EXT
>>  	  To compile this driver as a module, choose M here: the
>>  	  module will be called imx-sm-bbm.
>>  
>> +config IMX_SCMI_LMM_EXT
>> +	tristate "i.MX SCMI LMM EXTENSION"
>> +	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
>> +	default y if ARCH_MXC
>> +	help
>> +	  This enables i.MX System Logical Machine Protocol to
>> +	  manage Logical Machines boot, shutdown and etc.
>> +
>> +	  To compile this driver as a module, choose M here: the
>> +	  module will be called imx-sm-lmm.
>> +
>
>Remind me again what happens if you have both the default and the
>extension modules enabled?

With update defconfig to m, it will be built as module as below output:

  MODPOST Module.symvers
  CC [M]  drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.mod.o
  CC [M]  drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.mod.o
  LD [M]  drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.ko
  LD [M]  drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.ko

Regards,
Peng
>
>regards,
>dan carpenter
>
