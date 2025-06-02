Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011001.outbound.protection.outlook.com [52.101.65.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72781253F31;
	Mon,  2 Jun 2025 22:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748901691; cv=fail; b=DQrJg27JqmqAtaC6KjvAbPKuLe4JWKkOvHgB8/0L+KsDvEMzUsAYaPM1OrRYiVIqFbwMS+RWZ8eG3NqfrkPviC0YBP6Xe4ENnSVPdus7wIx5EoCjyBTfBuR/ki150tm8U7nyor0SQ2+8cxfR2sdMoaZN/6tyPIaD+R70lMdYH94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748901691; c=relaxed/simple;
	bh=0qMpQW+eN2WAoiINWMY/5+jhBYLhyoFlRlgqBTOWQ3c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CPt8kj3jhu1Ii1UaOy38scdDPuNClCfMCQ650gQuJ+EMiJO05bLn86/qaNlKRg1hEBdRwMBTOLrGHMEOtxb2PTXSn6OmSYW9BQs/2jbJc7KGhycJ8kjiUfTvRZltzyCTAVnJDwj2E0sYnxGK9ZY7zAaz/LHXBDikFaSAfO/RizY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=b4zUCGoH; arc=fail smtp.client-ip=52.101.65.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="b4zUCGoH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b41yRjCaUrnrcw0vGT6LdcOSzExu9rsqxY3DpBGr/56cJfrHMShgJl5yxLDF9wfx3R8y7LLsJ2/8OCNEu4gOyn3mRFVliLCdhJsYyOtLAqSOD6UgQ8gg7zHJJoESaYAF9etZrEJq/Fxhxi0upOweLmniwk05yKedQMxa9MR/o35pEnvLlLupb6/G4Mta0NADcIUc1Fws/VF8yim+wVLWbDmGTf7CUUyCF639drz8W6OU9LEeQNiVm7MkNP59/8jIEDqVXs/OesOjyhjkPcQe650/lsn0LMx0A7MyE97Qrve4EVK02F4xDN8Atc2jPqNiqzEwRavUzSal1ABXD9/cnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MA0yOsvTjebP/G4kunEnCoBO2xYnKirOZeSk2GSyV3U=;
 b=CKdicPJmd40Fm0cT/TJCwJY8Afe1XYZAxH4xLbh6Qk1ihZfAU1p6cRCxNhK7q4GSXDQI739+QhXjUjggX61y4KV9EsDCN09++XxOLwHd+PeFebb/L2+/uNFE7G6euvUUtSlCTUsGYPQERHXEvkufSwWMLr03FHeTsuEdP5khOKnc9WXskxAhl4y1wkwaLa/3Cu5ZOH+EQv/Unpl+C65LrzlZND2WKjIIwbaMElEbpkjxofRXJMlpeDEg2fDEsct/Kcd/GTM4ugDSmyl1hYx8W63l99omdm3tgVzJ3SPLjes9CQBM0zBwpV+Kr7LNk5T4zFCD6SUVcD9ThDOuLuqjkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MA0yOsvTjebP/G4kunEnCoBO2xYnKirOZeSk2GSyV3U=;
 b=b4zUCGoHDwyHdLH/CBBj+CdCvt2sFWm1rdJxlpsRWEZZrJvfYT3bKaB8Yc0J/iAoiOUNlNYTz6V+xiQIuGFuvPhq09xJcZOI7IUr1+Hxq+mwg1aFdlFfZRr5+dfTOBMBilj6m1CMUGYULP28uBuXLsfUun7FVi4VHsIP/FdtDhFb9TNb2R1aij1BwTBRlL5y+/WGyt8tPDcuPRDQuOUa0pOyPiVGEzXFCf8/5auYug18S8+GwB/7Y8MD1gh8T93rfx3Dyx9nlQig2HqJXVD8DWQ5sEyecKx/mNx/1A5MfbTj9lNM0Px4D53shDi2kuV9rq7GrJlM4dItiJ3GpuAVcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PR3PR04MB7386.eurprd04.prod.outlook.com (2603:10a6:102:85::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Mon, 2 Jun
 2025 22:01:26 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 22:01:26 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 02 Jun 2025 18:01:03 -0400
Subject: [PATCH 3/3] arm64: dts: layerscape: add dma-coherent for usb node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-ls_dma_coherence-v1-3-c67484d6ab64@nxp.com>
References: <20250602-ls_dma_coherence-v1-0-c67484d6ab64@nxp.com>
In-Reply-To: <20250602-ls_dma_coherence-v1-0-c67484d6ab64@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Shawn Guo <shawnguo@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 bjorn.andersson@oss.qualcomm.com, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748901674; l=8370;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=0qMpQW+eN2WAoiINWMY/5+jhBYLhyoFlRlgqBTOWQ3c=;
 b=t7e3koZ+ULGmR5tVmIW5YVLJ+9dJtWKA0BKqlFYjQR8Ph5sm/7JDJ7PaP7JFBv3Rxo7kRnYHq
 Dg8rcEepJm7Bu8opSlHtGzcV3zjaMTJzmAG7bzN2v7a4uctytxPzoNT
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P221CA0055.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::27) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PR3PR04MB7386:EE_
X-MS-Office365-Filtering-Correlation-Id: be2aef56-a2fb-479c-47ce-08dda221050f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0dPWHRseUVHTStwUE9BOW1Pb0h1KytqSUtSVTFGcGVDVXhrYnYxY0U1Vm1U?=
 =?utf-8?B?VTRXc3ozdlMwdSs3ekNoVFRKT05MZjJ2T3lwN2hCR2tjZDQ1bVZ5cjllM0hl?=
 =?utf-8?B?Qk1sOFFGK2FSeGFZdCtaSlRjOWNjQkVUVFZlOXhZWHFKTHczaWp6UWYya0dR?=
 =?utf-8?B?UER6OTNDUUNUS0JERWRVZ1RUV0lKVXNicGdrWm5xd1AyaHpmZnlyWldZOUNs?=
 =?utf-8?B?OEVzNEpZNExGWWtlWk93RU5BcXhFdDZZTDVXVW1GOFVES0VlL041K005NERO?=
 =?utf-8?B?RmJVaTlmR0NyTW1WbjNuVzdjaXloNkxuTzNuR3NnZDFpWUhIV2F1NkV4djQr?=
 =?utf-8?B?ZzNIenRXTzQ5Q05ud0ZjSzR2NWxHWmRYRTRvNCtiMmJvTllnYXFuQUUxZzln?=
 =?utf-8?B?ZldkZUExWUl0eVFOemo4SnBWTFhwanA4MjRSRFRqYVJPYjJUYkJnUkRvenVU?=
 =?utf-8?B?RVNnNnUzK2htM3IyTWRZd280cG5iQTkyemZUMnB5cFdOQVo2anNUeEV5VlE0?=
 =?utf-8?B?a1FILzk1dCtSZmtENFplQjVhSXlFQnFnTW1jeWdVdFRMVVdsNXkvSitQV01R?=
 =?utf-8?B?Sk5oVXhkc3hHMWJLRmozOHBzajlKS2QreG9CWWEzME12Z2p3UVpKbG9FRkZ3?=
 =?utf-8?B?OFBUOU9RRWEyeWdseE0rV3pLTnc1OWl2WWRnRUJpVlFNVC9KRDlFUzZQcng1?=
 =?utf-8?B?TGg2Kytha1JTZ0pyd292T1JuNHQvU0NmUnRyTGV0UU1kbzZpWjVEVG8zVkRC?=
 =?utf-8?B?T3ZUbjBvUktxZFJVTHlqSWlDUjFxSkFRN0F4VjdjWE51TmFyRjUwRVVwTzlO?=
 =?utf-8?B?S3lYUUx1UXNYVk5WUUxZejlWK2VtK0JKK2wzaHdsdWVpSG12QTNES2xRWTdl?=
 =?utf-8?B?OTk1em1yc245K2ovdDE4M21OYUo1d2VMeXVYalg3T1cxVkJDcTg4MldkOTNi?=
 =?utf-8?B?WjJzOVh1V3d0TVhDajkxc3JNbzBJYWw5ZS84ZjhsdTZpMm1mbXE2YldTb3RX?=
 =?utf-8?B?cVU5R0VtZ1p0VDR2UnRySVVJdmR4cHhJNVJieC9xS3hjZjBnNzRRTHRSR0lH?=
 =?utf-8?B?eVF3VUZNV1lsZTI3K1YzRjdKYlpSUjJjbittSEc0Y0xvendUODVGZWc3VFJj?=
 =?utf-8?B?NUI2aGkyejRsRWZOYlhuWk0rYkkyM0F1S3BESTUvKzRISWpwemFxVWlock01?=
 =?utf-8?B?QUMrY21HWmdId0xIb0FUWDRyTEpoYTRac1NxRmF2Nm5KallCRnk0OURxOVlh?=
 =?utf-8?B?ZXhUN1ZGNEJtK0tiVTAwS2VxRVlqN2ZpdGVrTzAxOWc3b29uQWZBa3Z1UUlV?=
 =?utf-8?B?amw3TlJkOGVxakkxTGpPQk5KWTU2OVpTS2xVbU1Ld1Byd0w0VjBkZEk2SElq?=
 =?utf-8?B?NG9TZnBBUEZTZ2w2QmQ2Q1hFOXdIVncxMXBReUtHOW1LQ2xRKzlPT3AyTXBQ?=
 =?utf-8?B?aDJ4SktwNnlYVnZFbzhUaVlocytkU0pIcWxhMWpQWnhjSGVjYTZoSlM1WUly?=
 =?utf-8?B?dWJteEJId1R4ak1CWkVWT1k3YzBIbmIvVzY5dWpmY2tWTk0yMU4xSEFwbkRk?=
 =?utf-8?B?eUE4UDdwcU5ic2hydHVoazNuVFhmN3BSSmp1ZUNRVXNOcXlqbkdzdzZXd3VS?=
 =?utf-8?B?QmFEMDFNcUpjY09CbXQycDhyTDQ1akNibjJEazdnUWhLRU5FN3AxZnF6cGY3?=
 =?utf-8?B?a09Xc1RTMDM5ai9jM0FkZmNjdFhidkdqQ2NIUkdnRHhBQUZKNWNDT2JuOHNq?=
 =?utf-8?B?NjcrUXJ5OU5Henlvc1NxOEVwS2RpWmM2ZnlvWjZPNWtDTm0yeENCYmUzY2VE?=
 =?utf-8?B?TzB5SWU3YzlvdGoyajg0cVNmbFdtMGxGWWFUMWIxME9zRmNvSThacGl2dWhC?=
 =?utf-8?B?bDZSQ3psZDE5cVFmbVo1UlErK3c5eitZNENrRFI2Z0wwL2Y4OEhRU05NYnJn?=
 =?utf-8?B?SmdyVFoyWEVoQWM2aHZGcTVSeFlpUVVNcEZYRUhJaHNKR3lTaGVLL3U2czhJ?=
 =?utf-8?B?MjMyanNyNjV3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTRxdFU3cFJWQktrMDNvTi83cnd0aXhLTHU2RnREU2lxdndtYkovcFZyOTJR?=
 =?utf-8?B?K0Z0RzRjcXRmeTBwS2J6bjRzeGF2ckNtc3UrZ0I3QmpXUVdiWUNGand1QkU3?=
 =?utf-8?B?cC9pZXdtNHIySm1ZZStZRkhmeWEybnovclc4a25mUXpKWDFHd0p0b3NmOEJO?=
 =?utf-8?B?Y2g1aTJFNXZKVkhjcHU4dU9SNXJnNTdkZTU0RHMrZWJpb2ExTWlaQkhXMVRk?=
 =?utf-8?B?MmdDcS9VUGZUaFFab1JXMzZHTWpSaERuZ21mZFpYcGJoNWZGendxUTc2aGZ4?=
 =?utf-8?B?Qzh3dmFTSDlvT2luVXJKNit2R1BCSjB1a1g0N2Y5V3RpNjNldXQwQ3p5YS9W?=
 =?utf-8?B?MmdPdnhBeGI5ZkM0Y0FzVVJZbGFoMXBOS1haRTZOS2tmVU9KbHR6d0tLZXQ0?=
 =?utf-8?B?NmNFcWI2MmYvb3d6dGlpNm9TQXQzTzNFSm5tZFl3am9SZmR6YjgvMU1kRWtV?=
 =?utf-8?B?eDVmTU05bmtVekp6S3RvMUhuYmptMmVnd1dpMXF0Z2s5czF5L3hNdkR2MjZR?=
 =?utf-8?B?Y3prYndnaWMvUWlyaDBoY200Ylp2RzhMVWZrdWZtU0FyWjlYOTkxeU1pdk5t?=
 =?utf-8?B?bitWY2ZHaFVmMXdCN2tNeFVSdWQxTjlPclF3VDhNY0pkc0E4Tkd4NzRuU29X?=
 =?utf-8?B?NHZML3ZyeExUTjBKL3p0NklFUVBDUUlkOVVyalFtdjRSWEV2aTV4elhVV3lT?=
 =?utf-8?B?V2FwTVZBTHhDRm4reXo0WCszUzEwMjhVR3FuMWY1WmE0YVJFMzNybFVsTWxR?=
 =?utf-8?B?VS9CdnpSdlRMS1QyN2lSeE9pVW1uZkNLdEFseDBaYjlIajdldjkrNzhKN3A5?=
 =?utf-8?B?SG1ZOUJOdU9MaGxQcDdFU2VrU0hNcUFpSmx2RlFsMS9Oc1F6QVJGYk9xdWhR?=
 =?utf-8?B?Z1FZU2lCQVFlVSt6WWxFQTBldkNYYXZHbnZvSlF3R0UwS1o5eU80Y0pVOXJk?=
 =?utf-8?B?amVGSTNkT2pvVUhMSzNLQkh3S2VJUFFmVlJzUjJzaHRLOG5pSmlGbHA2R3VG?=
 =?utf-8?B?RUYvZCtCNFJ6L21CT2JUY0VVRExENDkrdUdaVncrUFB1UTZJSlhDSjl6U056?=
 =?utf-8?B?R2R2cmhud1I3Wk1odjlWa3hoV1BFOUtNbHovbUJxMm8rUEZOQnFodFJkK2VJ?=
 =?utf-8?B?MDA1TFpxR1R6WXBnY0g2RFlKSFJDZDRsOXVTcTZZeWcyYmRUTkxMbys5bzNv?=
 =?utf-8?B?a3RLZEw2VG5oblRyT3Fwa0VmeTJwN3o0bDEwVEtiYzNRWFpiWE8xVTdETFJj?=
 =?utf-8?B?MlN1c2duK2tRVU1VTVA4WDMrL0xZWXRqZUg0clU0c0tWamJvUXRiN2R2ZEZO?=
 =?utf-8?B?S1lhTDhwWU5yR0JHeFVqSlBDMk5rNTVXbXRFRno3T1ZQelFRVy82RURCaDN4?=
 =?utf-8?B?SjhpUU95K21XckdmNWVEcXFTTHZycVpOQUlzTXkzZVZxQnN4blc2aFlWREpq?=
 =?utf-8?B?R0V0eWNJOHNUcnR1MVRoUzc5dFRtOFZVVmRDUGhGRHhvVUdBTkR6amhKVE9u?=
 =?utf-8?B?V3pndWpnVUQzOHJ2VHhmZWcxbUhSaytwcmhDbW1MWTRjRFQxZ2ppa1ZadU9I?=
 =?utf-8?B?NnlvL0pOQzFlMzZZU1FINGNWUHZNT1IrVWxJNHpGTkpvS0NyUlpFOFEwSVZV?=
 =?utf-8?B?ZVZYckJGY0VaeHBERVN4cXJ5dW1kcWpNQlVha3dCdVZ6Z1VTU0FlUzc2ZFNX?=
 =?utf-8?B?amI3YWxHWVZsdjcyTURxSitXOUY4UzZSM2VvbjFlYnFBU2pLWVlTblNVNFQ4?=
 =?utf-8?B?MGE4NGNTK2Y0OHB1cUFLdzBHOXB4dStkdDE4NDJPUkV2ZDBRcUJWanNVYkt0?=
 =?utf-8?B?Mkp2MFduRHhkZGNzS1pUVWFnNDFUNTkycEt2NW84UjE1ZkttejV5Y1BzbVU5?=
 =?utf-8?B?SDRZQ1IrUjlEcTZBVjVjalZkSXNQcTN3TXdvZi9rbloyc0NOT0RNQTlJUUdJ?=
 =?utf-8?B?WFNOUjhjRlMrM0puSDZ1dVljZGNoUHZTZnpHeWFvVm9qcTdmU3hncjl3OURQ?=
 =?utf-8?B?MGlHS2lEc2ZVWWR1MlhmazhjVHNQbU0vUDgwcVFaVTlweWJCa0UrNlhER3Vj?=
 =?utf-8?B?aGNkZWY0enUvSkN4UUJ0ZFQvTU9xZ0xveVVMNStocHlnYUdKRlcrRVZOUXJO?=
 =?utf-8?Q?YHc3jwM5zeIWPPKmi4e67zZNk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be2aef56-a2fb-479c-47ce-08dda221050f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 22:01:26.1187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RvtvM2Uue9PtrD/BOEe7SuwCiesoobw2vJEld/8yg0zvSoMsLa+69JpivqIXFJGpLzUUZanTi8yK7HqBN9R/3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7386

Add SOC special compatible string, remove fallback snps,dwc3 to let flatten
dwc3-layerscape driver to be probed and enable dma-coherence for usb node
since commit add layerscape dwc3 support, which set correct gsbustcfg0
value.

Add iommus property to run at old uboot, which use fixup add iommus by
check compatible string snsp,dwc3 compatible string.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi | 3 ++-
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 8 ++++++--
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 9 ++++++---
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 9 ++++++---
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 8 ++++++--
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 8 ++++++--
 6 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
index dd479889658d4..bb6c40d28c5de 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
@@ -492,10 +492,11 @@ QORIQ_CLK_PLL_DIV(4)>,
 		};
 
 		usb0: usb@2f00000 {
-			compatible = "snps,dwc3";
+			compatible = "fsl,ls1012a-dwc3", "fsl,ls1028a-dwc3";
 			reg = <0x0 0x2f00000 0x0 0x10000>;
 			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
 			dr_mode = "host";
+			dma-coherent;
 			snps,quirk-frame-length-adjustment = <0x20>;
 			snps,dis_rxdet_inp3_quirk;
 			snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index 7d172d7e5737c..e7f9c9319319a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -613,9 +613,11 @@ gpio3: gpio@2320000 {
 		};
 
 		usb0: usb@3100000 {
-			compatible = "fsl,ls1028a-dwc3", "snps,dwc3";
+			compatible = "fsl,ls1028a-dwc3";
 			reg = <0x0 0x3100000 0x0 0x10000>;
 			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&smmu 1>;
+			dma-coherent;
 			snps,dis_rxdet_inp3_quirk;
 			snps,quirk-frame-length-adjustment = <0x20>;
 			snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
@@ -623,9 +625,11 @@ usb0: usb@3100000 {
 		};
 
 		usb1: usb@3110000 {
-			compatible = "fsl,ls1028a-dwc3", "snps,dwc3";
+			compatible = "fsl,ls1028a-dwc3";
 			reg = <0x0 0x3110000 0x0 0x10000>;
 			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&smmu 2>;
+			dma-coherent;
 			snps,dis_rxdet_inp3_quirk;
 			snps,quirk-frame-length-adjustment = <0x20>;
 			snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index c0e3e8fa1e794..755f65a727fba 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -805,10 +805,11 @@ aux_bus: bus {
 			dma-ranges = <0x0 0x0 0x0 0x0 0x100 0x00000000>;
 
 			usb0: usb@2f00000 {
-				compatible = "snps,dwc3";
+				compatible = "fsl,ls1043a-dwc3", "fsl,ls1028a-dwc3";
 				reg = <0x0 0x2f00000 0x0 0x10000>;
 				interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
 				dr_mode = "host";
+				dma-coherent;
 				snps,quirk-frame-length-adjustment = <0x20>;
 				snps,dis_rxdet_inp3_quirk;
 				usb3-lpm-capable;
@@ -817,10 +818,11 @@ usb0: usb@2f00000 {
 			};
 
 			usb1: usb@3000000 {
-				compatible = "snps,dwc3";
+				compatible = "fsl,ls1043a-dwc3", "fsl,ls1028a-dwc3";
 				reg = <0x0 0x3000000 0x0 0x10000>;
 				interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
 				dr_mode = "host";
+				dma-coherent;
 				snps,quirk-frame-length-adjustment = <0x20>;
 				snps,dis_rxdet_inp3_quirk;
 				usb3-lpm-capable;
@@ -829,10 +831,11 @@ usb1: usb@3000000 {
 			};
 
 			usb2: usb@3100000 {
-				compatible = "snps,dwc3";
+				compatible = "fsl,ls1043a-dwc3", "fsl,ls1028a-dwc3";
 				reg = <0x0 0x3100000 0x0 0x10000>;
 				interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
 				dr_mode = "host";
+				dma-coherent;
 				snps,quirk-frame-length-adjustment = <0x20>;
 				snps,dis_rxdet_inp3_quirk;
 				usb3-lpm-capable;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 0baf256b44003..33fa2918d1a46 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -720,10 +720,11 @@ aux_bus: bus {
 			dma-ranges = <0x0 0x0 0x0 0x0 0x100 0x00000000>;
 
 			usb0: usb@2f00000 {
-				compatible = "snps,dwc3";
+				compatible = "fsl,ls1046a-dwc3", "fsl,ls1028a-dwc3";
 				reg = <0x0 0x2f00000 0x0 0x10000>;
 				interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
 				dr_mode = "host";
+				dma-coherent;
 				snps,quirk-frame-length-adjustment = <0x20>;
 				snps,dis_rxdet_inp3_quirk;
 				snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
@@ -731,10 +732,11 @@ usb0: usb@2f00000 {
 			};
 
 			usb1: usb@3000000 {
-				compatible = "snps,dwc3";
+				compatible = "fsl,ls1046a-dwc3", "fsl,ls1028a-dwc3";
 				reg = <0x0 0x3000000 0x0 0x10000>;
 				interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
 				dr_mode = "host";
+				dma-coherent;
 				snps,quirk-frame-length-adjustment = <0x20>;
 				snps,dis_rxdet_inp3_quirk;
 				snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
@@ -742,10 +744,11 @@ usb1: usb@3000000 {
 			};
 
 			usb2: usb@3100000 {
-				compatible = "snps,dwc3";
+				compatible = "fsl,ls1046a-dwc3", "fsl,ls1028a-dwc3";
 				reg = <0x0 0x3100000 0x0 0x10000>;
 				interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
 				dr_mode = "host";
+				dma-coherent;
 				snps,quirk-frame-length-adjustment = <0x20>;
 				snps,dis_rxdet_inp3_quirk;
 				snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index 9d5726378aa01..b2f6cd237be04 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -489,10 +489,12 @@ esdhc: mmc@2140000 {
 		};
 
 		usb0: usb@3100000 {
-			compatible = "snps,dwc3";
+			compatible = "fsl,ls1088a-dwc3", "fsl,ls1028a-dwc3";
 			reg = <0x0 0x3100000 0x0 0x10000>;
 			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 			dr_mode = "host";
+			iommus = <&smmu 1>;
+			dma-coherent;
 			snps,quirk-frame-length-adjustment = <0x20>;
 			snps,dis_rxdet_inp3_quirk;
 			snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
@@ -500,10 +502,12 @@ usb0: usb@3100000 {
 		};
 
 		usb1: usb@3110000 {
-			compatible = "snps,dwc3";
+			compatible = "fsl,ls1088a-dwc3", "fsl,ls1028a-dwc3";
 			reg = <0x0 0x3110000 0x0 0x10000>;
 			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
 			dr_mode = "host";
+			iommus = <&smmu 2>;
+			dma-coherent;
 			snps,quirk-frame-length-adjustment = <0x20>;
 			snps,dis_rxdet_inp3_quirk;
 			snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index c9541403bcd82..d899c0355e51d 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -1094,24 +1094,28 @@ ftm_alarm0: rtc@2800000 {
 		};
 
 		usb0: usb@3100000 {
-			compatible = "snps,dwc3";
+			compatible = "fsl,lx2160a-dwc3", "fsl,ls1028a-dwc3";
 			reg = <0x0 0x3100000 0x0 0x10000>;
 			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 			dr_mode = "host";
 			snps,quirk-frame-length-adjustment = <0x20>;
 			usb3-lpm-capable;
+			iommus = <&smmu 1>;
+			dma-coherent;
 			snps,dis_rxdet_inp3_quirk;
 			snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
 			status = "disabled";
 		};
 
 		usb1: usb@3110000 {
-			compatible = "snps,dwc3";
+			compatible = "fsl,lx2160a-dwc3", "fsl,ls1028a-dwc3";
 			reg = <0x0 0x3110000 0x0 0x10000>;
 			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
 			dr_mode = "host";
 			snps,quirk-frame-length-adjustment = <0x20>;
 			usb3-lpm-capable;
+			iommus = <&smmu 2>;
+			dma-coherent;
 			snps,dis_rxdet_inp3_quirk;
 			snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
 			status = "disabled";

-- 
2.34.1

