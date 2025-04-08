Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2065.outbound.protection.outlook.com [40.107.249.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85878266B74;
	Tue,  8 Apr 2025 08:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102069; cv=fail; b=BVzEakUyiQwR+ES2UmuzHYTWzj3nmZMCz+5Rlg3rZuLOO2GNCQvzYeBWEoEpDO0MCnTm2gnNau5oMZ/U5Fc3QLr+5kaHyl/0SFfBSnjzhb5gQt1/ieGdbgCDGN+tfO9NvclPaLJjAhMbMZQy/OsBhsb5DdxEK7Ey+zJS4DQebs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102069; c=relaxed/simple;
	bh=uddcIm3mCe5SaB87JueEiVs8AWMGP4SfOAiezc0fr3s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PfSxHJi5p+pDXFZRVOtn/0dyBe/D6qG/Dm+ouinNpGsiIQUEaExdgjxMYujvhP8cXx+ZWueWaIirOrBB+YzDE6SleqDY0v3wYpfGjllzBl5a6IPRYgGRXjGVDo2kj28sj/Ij0ZR7ESGzX6oBWknuyvk8dRbH83kgQwo9Hbx7W+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XWcE9AsR; arc=fail smtp.client-ip=40.107.249.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XWcE9AsR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k87lDxJKgSuoGJWYXd6mE/DQJQIq/oQZUko0SMm0IIvFOGromf9k3gc2dRqnFNU1VTuQkz3x3hUnzPM+tlE3oDeqthsEmGnbW745Sfzu0wlSR7y8z+52Ako/dmYZbCEkCSnpJoHTD6Nd8W/0/E6rtwYs35zOfyxld1BkgGsDMgCtzsC5jclSRaZssL9ZCXpGXg2mfsMs7oOJuWen5RIYwoGW36pOZrU8Am0l/8zXzyVVuQR3ddH7tDpjncecP5RkSZmsRoEja1ZY0qwIBwHDvbtKQ0H1Fd2o6MV09+yM5+NeQdyJY9gsp/lAQ6puiCm48+fDTPu6WyH5R1bhEh30PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ue1bTtJmxgaGtwDoDuKgQqlks51lX70OPpO37EttAdA=;
 b=CNE8cZcjkJYrR4WxXIPlbmGSrX0PxZTiHi249aHj7U3fazQwJvUU+rruXvQzv0upoeBhCWHYJmgDOEUrzBMBmwS2I/BUVq5Uuy+bYcw4Us5wopDhGV2mXgSXD+HLLrbNltQSIs1y9qfz478BJgeeb5D54VQxikjuYSesy0Mf+MPlIuWJ70agmoFjsM44Hf+Pc1lC+9jNDX4L6faw0Lokar16Zxqis/4/9nBPIN7laA06LdhFvLQnV0Fd3Ydw64egW3llZjBBPhHYKmZ2vIWqyO2oG3fIMzZ3qyXlXr8ohoXEd4Nq5TZ9euxw0F5iZy/ZOLAH5NaoHIPpA3sUKRQ2Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ue1bTtJmxgaGtwDoDuKgQqlks51lX70OPpO37EttAdA=;
 b=XWcE9AsRkC3wOK5MFj3ZSX2I5ERJmdNXiEyZIRX/xOF2QLARQGg0liDcCJawaNic4HbzTI/CUCeLN4UJqc247r+ZXIippq1PGUjQq13oR0+Zqf6IwIKJhgqoyKbMkirlCrSmW0/pqQfEDVN+hCEawnJM95BABnkUySOGWEbPbq0HKC+RKksz83CI5MDJAkglm+Re8QeFfPR+aPpgjj+J5AMgz0z6MXSbovzuh6V6YLdYuVv2v2DRZqu4Otb1zfOHjAZX+lFh/wI2NbnwT5vZ5cBxmh/3oV00IUCHD6VFqEOZb5rUMvLkesbxKN9sNWePUI0zE+HwHZplbH3prAZJqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBAPR04MB7224.eurprd04.prod.outlook.com (2603:10a6:10:1a8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 08:47:43 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 08:47:43 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 08 Apr 2025 16:44:31 +0800
Subject: [PATCH v4 7/7] MAINTAINERS: add entry for i.MX SCMI extensions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-imx-lmm-cpu-v4-7-4c5f4a456e49@nxp.com>
References: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
In-Reply-To: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744101964; l=977;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ATAybhJ8S8dUnRsn1OtmHx3Mrkujcbd5Z4FXS3mP5NA=;
 b=M2xYwekpbShPzQRY9rrsatKB8qogUW14X/FPs22aQ1tXiwPA21BbZrpsfZlj3rd4bKTwc3MsV
 bEoaIUaMfvkDfMg/trlBATy4iW4DxvTKY3M3PBvqJW4vs+lXFbdzo3R
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBAPR04MB7224:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f6fbffa-841b-460d-82aa-08dd767a06dd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGxldVdYQmdBLzAza1JaSUVmVkttVEVid1dwVVJMN2t2Wmt2N2hZSXJmaGgv?=
 =?utf-8?B?cGlad2s0L2VNZGh0bE9RRlJnZG44bFJMTDF2YTRWS1pMdzJGbW8vMjd0cGU2?=
 =?utf-8?B?bkQ4ZmIrMVhPQjdUczZKUWt1TVJXZlVMVGFLMDdTZmhRNnp0YVJtL3lZU3Q1?=
 =?utf-8?B?b3JJRld2a0RPa3pkdG5va3ROYVV6NUYwWXRkdm10TmxEUHA1b2FIUENhSDFF?=
 =?utf-8?B?SVlZdjRPWWlya2pTL3pKUzdzTXdjR1pma3k1bm5rMHp0MXRaQ0trQXhtUG5K?=
 =?utf-8?B?WE9jVUs3aGk5UEp0TDV1cVhaM1I2RFM2NlRWYmI2RWJPZWc1SGhYK09heG41?=
 =?utf-8?B?b3Ixb0NTQmM5OXB4am45eUFhQ213MitML3M0djVqenRqNDFOMGRkNHFDLzdq?=
 =?utf-8?B?Q1llTmtvTHg2NTRoNWhGeitGdkM0dlVNZFYwalhQVFJmU3BwSEs0ZDdXeHdU?=
 =?utf-8?B?ZExZMksxZGpObU02cEIxYzEwVlZ5dVJHRzBpRnVuSUZxcWFMajdQTHFWd0lU?=
 =?utf-8?B?SnRnVERTWFFaVHZ6a1RSdGlPUGhjczR4NE83aDhwaytIZXVGNTVNS1RCMXJ3?=
 =?utf-8?B?UDBUdTExVmxLczNtdTlGcXEveWpIRHZJalluQk95SkFjRTh3eEc2RitkZm02?=
 =?utf-8?B?MXZHSEdLckRkbnl2TmFIcVhhWXZEK09UNFJBaTQyMldPTjhZMmZuY2RTanZv?=
 =?utf-8?B?TW5VRC9IUHlwYWV2S29OSWhDZ1JVL3VJQzZOcXRJM1VDMUVjZVdvNTdSK3Fa?=
 =?utf-8?B?Q0lXalZPd01hSWJIMWd1RGV2WFMxNFY2K2VMMCthamhoTVA0TWNXQVltQS9K?=
 =?utf-8?B?bzQvY2lycjZWcXVaTGVoMldDWGpEQTZKVHUrdW5ZU3Z1MkVKQ1ZxdnIzZ0t3?=
 =?utf-8?B?a3hXcjNVcElYa3VMTVNQVjFmMlNtY3VQWk5yMTFTdGcyM09WYVFaQWdEd0px?=
 =?utf-8?B?bGJCUi9FbEw0RjBaYnVSR3FpRFdyUEVFWFMySFk4UVBaR2U0cWxzSFJKbGdU?=
 =?utf-8?B?R1lUS0xxbFVHSXV1UXp6UytEbFVNTmNMSnZPOXIrc0VaN1o1NFpGb1o4ZnZq?=
 =?utf-8?B?UWJEelBzZkZBZDRET3I5Q2ZPN0o3SUI3MVVlNjJDYnVLYnBDWWVOazJTS1ht?=
 =?utf-8?B?RU5sVm9nNmVSVS9GYzlwNmZNcGpqV2M2VlV1VVppNmp0MTNqQVgrQS9EUEY4?=
 =?utf-8?B?RVdoKzl3bi9nM1BMN0RaVzkvenQ3YnhuSXZVbkV1L0YvV2FpYU8wUVp3UHhp?=
 =?utf-8?B?ODlETnFjVVpRbEs2Z240WGZPQXRKbGRVVlM1dldKQWdDb2ZPaFlEYTBHMVJX?=
 =?utf-8?B?aUd3Skk2Y2VJak5jay9jRzlEcDVraHpza0JkQ2hXMW9HRXNCNEUyc2piS1Fr?=
 =?utf-8?B?YzRxa3FjVXJvNnA1ZEk5SGorOGdFY01qM2svZGRCUkh5Z3Q2M0haNXJVZVQ5?=
 =?utf-8?B?YkNBOUxiS2U2RE00bnpYRTZ1Y1BmbFM1YkY5cStLUXhjTnEyZVFRU0dTbnJn?=
 =?utf-8?B?cm1lUEhmanlERXJwWms2eDY2K3VkWnI5Q3gzYnBZa3FsWHY1aW96YVo3eUdt?=
 =?utf-8?B?ZHdGeUh5WmhIYmN1VlFONG1vbm42RklORDBnOEhNTVZXY1RYaWxrUUVCR2lE?=
 =?utf-8?B?cXBoc2xaOWdEd0htbjNJeFY4eU9XZ002MnFpTnZSaWRiVW80OXorMTN6cXJW?=
 =?utf-8?B?U2xOZlpmbWptRHEwUUh3R0RmeEJMY1N3aW0zTmxyd2h4aXFsdlFqOWRpMlI1?=
 =?utf-8?B?Z1orZ0phV2grZlQvSDVzRUNFei9rZ0VIak84MDVxQjZIbkxJV3pBY1V3QTFo?=
 =?utf-8?B?UzFMZnV2U3g2d1ZsRjEvMTVKN2ZzZGFzNnFmQ2d4VXIvVTUxUkgvQXFrQ3hw?=
 =?utf-8?B?Wkl6VVFUb3ltVFVNZHFpUldtb1lDMFVhRCttd0JGMDVEZnpzdmpmSGtSZ0hT?=
 =?utf-8?Q?S2QuL98Jf/ZGbYmX/WJaTdlZ0Lbrwg6L?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzF0RTM5RXZGTVZUNUtNeHR4N2FVbmpsMlhXQWErcURQVkU2UGFYRFpsYkxx?=
 =?utf-8?B?US9zdFQydm40U3ZudWJhcEh1MkhtbjQ5VWg2SWMxcHBCd25vQ1JITXRUeExT?=
 =?utf-8?B?UUxBc1FJdzJKWGVua1dCV081bmUwWDJwWjhjN0JZYnFuQ0pwR1RJS0V6VGJE?=
 =?utf-8?B?RjNPSFNZZVY2SmRldHllWGFmSHhVU29kcjE0Q0hYVmVBUERKVHJlL0RFYklO?=
 =?utf-8?B?bW1RUTVEUXd2Q1B2NzZVQVFBV2Q4TUFWUUlnMDBMeDFTMGZlOWtqYUhHbURM?=
 =?utf-8?B?NDlRRUJ2elkxdXZiazZYU2ZlbGhhdUczVEFOUENLYkE4eklCaFh2S1NDTzRr?=
 =?utf-8?B?WStrTGVVNitqY0ZGVVkxbjFkN3Z0K3Q3RFZ1NUNRU0FOdGhsUmZBWk1mMGVw?=
 =?utf-8?B?cHdTWkJjbHRBZ3dGY0ZmTnRvZWlmWC9XQXBVSkVoejRMU0NSRm81bHBQemcr?=
 =?utf-8?B?Q3ZHVUxvNUs0ODZqRmY2WHp3cEtUc25KZk9mOTllYVRLaWNXZ2w3anRUeEJm?=
 =?utf-8?B?enQyTDJJbDJsRTA0ODVJaFNUdTNJQTQrK3pyMXJRRmRYcldHMEw3SnJ4MERp?=
 =?utf-8?B?YnBRUmpPMnRjcTRMRnFybVhFL2lKNFhla0UwODh4ZWx0ZjQ5MXliMWJSNEZh?=
 =?utf-8?B?eWszRlZmcGg3ek1OMDl2MzRXV3lWbTdyb0tjVzJEd3hsUTVFK2dnOEwzTkpU?=
 =?utf-8?B?K0hjZ1ZoSGZQc1VKYUxqcVZ3RlkrM0EwVEVSSmVBNUxkZ3lTc2ZwbEEzWTZq?=
 =?utf-8?B?RDZqUXBQc3draWNoNjhKZXc4UkFxTnI3ZmlZMkhESmg2c1VsZzdYZk4wbWYv?=
 =?utf-8?B?d1AvR211cnV3elYydHp2dGx4dStiMjRuQ1pxYUt5N1pneldaRzZKSlM5Tmxi?=
 =?utf-8?B?MGVINERkUmZkZVlVMFp4MHBrRGNFYWljZjVmTlJvejNDTzVyTXBvOGRYMDMw?=
 =?utf-8?B?ZzlncTJ5RUQvVmc3M1V3Z1RKWlJZWDA4TG9HOHpKTTV2UHg1QXlNUHY1NHhR?=
 =?utf-8?B?ekY0NU0wUXpFZmZHVVR0VUpDSTRUQjZ1ZVVjQ0hySHUrQ2dnZU9scXZkZEh4?=
 =?utf-8?B?dEZzRS9SNWptNjM0aGdUYnlaZjBNTndzOElzM3QvS0k4eWgzeW92WlFkUGxr?=
 =?utf-8?B?Yll4RDgzRTV6MGZuS2wzWGRNVDI3WGtyZHFVV1NRWTFrTEE5MldXV1NNM1pa?=
 =?utf-8?B?SU1vK29aM3F3c3o3c1ltaFVLbWRzQjAvRWFERDFMZFR2VS9md2tUSFZZa29P?=
 =?utf-8?B?SXRhSm5SQm1KWS9aenBZTXlhRGg5b1czSmxCZ1VCYk5rZS8rMDNqTTVSdGFT?=
 =?utf-8?B?eXRsQUE2ZXVXU0pTOCtVclVGdzVQVm5sYzlweEpSYW1NZEJEWWhMbU9ldVB1?=
 =?utf-8?B?TnBub1JHakJnaktSSENLdUR3c3pQOGRPRUtTRDNQN08wZkJzUFJhRUNLTDVk?=
 =?utf-8?B?SWpjWjU3bDI2Qitldzd2RE1KUWFiV3pGdjZJZU5nTE1mcHZUVjNkM2R5T0tz?=
 =?utf-8?B?YUpOaXRBUE5tajVqOGx5NmU2NlhKbFpvZzhDUGRYS2tNb1hTVy9OOVpxbXBj?=
 =?utf-8?B?dlI1U1NqZFEyRkdleTAyOVNuUzBjL21naEVGaVhQUHpNeTdtWGZWcmRydm5T?=
 =?utf-8?B?SkZSUDR6UlFLckFqaldLUXRvRnArem1GWnJaOHFUQXIxaW1rQ2dsQmoveXBT?=
 =?utf-8?B?Q1FTSDNsUmdOM3JRWklHUjN2Yzg2OUNicWU0OWlWYXZDUm5HT2RvZVdOV1ZO?=
 =?utf-8?B?MVNBK29sVVo2YWdiQ3hMdytDNlJLekMrKzJQdU4rVUFFeUpnR2NOTmRITUZL?=
 =?utf-8?B?Vk1PcnUvZERWWllwaElOZXZabkszR0RFdWoydWZ1dFdHUUYveGVzVm1KOUQ2?=
 =?utf-8?B?OC9pV0JjMVMxZTBhZEh2VFA3citvMjJBbWgydGJ0MGhHcDdwWmFiekt1eml4?=
 =?utf-8?B?ZXo2Z2pkeFN4SWdoNStjNExxSjdZY2ZsYVNFRWRiZHhVVEY3OXBLRUg1d3dt?=
 =?utf-8?B?NmJoaDFrT3pVU0lQYmt3MXdINXJkR3QxbEdqVnpwRmJYOUcySDFPaVRVUmlF?=
 =?utf-8?B?b3oyTGRFUkhuOGlZWFh2WFpMRm43by9naXFzc2d5b0RHbitQeDFjL2JFRWpS?=
 =?utf-8?Q?vZWLj1S50aZfOFhsjaQGxnQIY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6fbffa-841b-460d-82aa-08dd767a06dd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 08:47:43.1256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a12wzg8iUmlOL821Y40UwtNvwtFKG428Mlq48qN647kgDTr2afLcDJxgHiKQcD3csxLmApg5WtcP8Atwm1UYmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7224

From: Peng Fan <peng.fan@nxp.com>

Add entry for i.MX SCMI extensions and myself as maintainer

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ce2b64f4568d5d3dc48792843b6bb8928f5e0728..e406de86df9bed0f34871fe1ddca408984463493 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23505,6 +23505,15 @@ F:	include/linux/sc[mp]i_protocol.h
 F:	include/trace/events/scmi.h
 F:	include/uapi/linux/virtio_scmi.h
 
+SYSTEM CONTROL MANAGEMENT INTERFACE (SCMI) i.MX Extension Message Protocol drivers
+M:	Peng Fan <peng.fan@nxp.com>
+L:	arm-scmi@vger.kernel.org
+L:	imx@lists.linux.dev
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/firmware/nxp,*scmi.yaml
+F:	drivers/firmware/arm_scmi/vendors/imx/
+
 SYSTEM RESET/SHUTDOWN DRIVERS
 M:	Sebastian Reichel <sre@kernel.org>
 L:	linux-pm@vger.kernel.org

-- 
2.37.1

