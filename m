Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021086.outbound.protection.outlook.com [52.101.65.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7B42E2EF1;
	Sat, 14 Jun 2025 14:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.86
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749910897; cv=fail; b=uMWv0RfmpIMUWVTolvBp35RegXuAhGlpbmoHYGMMRy7MakZFjo/EtvK3kfgqKtIGPvZhz2ev6rip+OUEq2+bGQGVWrR3ZL8e3tz4hfcPltcvTQC/VA2Pt7s/MMKXr4TRgS0CCyKHmn82M2d7wNggMpJLkyTSMmeaand/6U5uQ5w=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749910897; c=relaxed/simple;
	bh=YaMVMWp+CWlLq/CxfYBYiXmLI2U8ZnbpBY0HtO3M6nQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=aIJX40A2uTK3OsHM5t7HXJIgT0ZMKndxbt4du0GIorCxW5H9C7591c+4D7O5ThGxsSa8ThMC8UQG01eh8oYK2anBWussgL50uy5bP6mJ9QdCK1fq7BJ7yx7xtP3QaNf6eELgSDtwEYr1mp2EliU/VOl7WRErtxoN3WMWBIaw8gM=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=hc7aG3J2; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=hc7aG3J2; arc=fail smtp.client-ip=52.101.65.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="hc7aG3J2";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="hc7aG3J2"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=l4nEJ5FuGEDx3yjlkL/EoAKNakLcXEMW/QcCIpIugCDmaYno7/fMIkV3lWpOeCr2IWW3/Rn6Y0LA2ARmfmQ8D02gR3J+eVi4ydAbh74gIl4lcWpE/OhXnkK8SR1U/bvdP1az6I30XcwklKZmyZ4dOhWITGBH0gIttb7A/EJEk4T5DFvIFMIHt5QPwXnIHzyTFWxzKZwkaAX+8vpV08owq2Z0uhvYnTPiVH71eWRW///SCaQHHd8je320BHVpTooW94UqSz09jOsEb/3KnWwcuDR9brVNyeX9Fa1DgbSgVp2Sq+dLJQ+sc+ZYLlkRNsy3EO2273g9tSwwDh/MfrpuOg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vz68rCYafkV9A6gl62nzR4vFniAhcvj0HWJY1atpBjE=;
 b=x2BcIUXLzlF4umLwS01l6mK18vlhUzYWr3ZXE3KEeMmOTQI7qRFcA0nnS90zVyjMVuJ66pi+s+4Fqvo78eDgJqtOhq3G6EmGSJXEpzN6Iy1kTY1/2bF9JSNQOjA2EPXmDgWst91fLlAshmcNy3APDNFueYeqMirfgtoNit+bZG6IaqCtH1QXIMqkQhbwdKoB7bsGDQC6m0oIdGmkogqpv47z/lgM0jzlz2aFBy0/YD5BYTEp+hPTRUjKAb0O/OO6eGml4aUcvuuq8FMYb0hh1fEiwFLaepYtILprSTswc5GedNjLAe2g22j1/15QkrkPW7Knb7YxUcAbLhIUozSC4A==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vz68rCYafkV9A6gl62nzR4vFniAhcvj0HWJY1atpBjE=;
 b=hc7aG3J2eGuZpEKxyneoU85UqOkwWBdVSJCFNbOwh8HTnyoi31H42IjpFL6NPdhGzvw/Uye1vPN5BLEUy9nkZKfcM0OtDBgi95jPJLro0j54kwERzfYNvpb3wgetfPMhFwNpH4kWk2nYf39yoPwuIEVVR+QNDjut0VWPJcChA10=
Received: from AS9PR06CA0280.eurprd06.prod.outlook.com (2603:10a6:20b:45a::17)
 by GVXPR04MB10304.eurprd04.prod.outlook.com (2603:10a6:150:1e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Sat, 14 Jun
 2025 14:21:30 +0000
Received: from AM3PEPF0000A798.eurprd04.prod.outlook.com
 (2603:10a6:20b:45a:cafe::89) by AS9PR06CA0280.outlook.office365.com
 (2603:10a6:20b:45a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Sat,
 14 Jun 2025 14:21:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF0000A798.mail.protection.outlook.com (10.167.16.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Sat, 14 Jun 2025 14:21:29 +0000
Received: from emails-8145592-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-176.eu-west-1.compute.internal [10.20.5.176])
	by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 36A757FF0C;
	Sat, 14 Jun 2025 14:21:29 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
  dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1749910889; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=Vz68rCYafkV9A6gl62nzR4vFniAhcvj0HWJY1atpBjE=;
 b=aLa5wHQaZG10STLMBif9h7L2yklCDcm/Ijk5cZanNP8aXx5vjh6G4T7uQfqy9jx0IfHXq
 JK38Jj0fgvdho+1JUQ+r6j7s2sIzZnojr075lZLZU9ZWKTYxk1fySGLSkpAWHbwLSS8hCTi
 toOhO59NenaT2ZbFDLbrsqIS9hR2UB8=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1749910889;
 b=ITEb1IDro0yPtJgmR0r7JaU95wevcOR8LbZBFTlSxXMiV2G5TlFJvGsSEfdUXHyeKDgJZ
 NyFUdINCo213EGOpUbwatHWcYZYYR6wQ/V9as5HgLNNfRxrnvUvMhy5oLW4Q7edCPmSADcp
 qV4APiqOG+VEdszVNHDUp248mjR9PtU=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hACMheBeYLwn+5Qt9+cvdZEOehC2HqFnNP/GIcUHK4Cu+74s72nizlUrgKy9JKDX9dZzrKQW9WaAJx4RN8YmJZg99zSiYKGkUTUTyfpcXXStmCsrYSizBVrit4Tv2CJWSl32L9z6EFXSxE0R5ZWP+mnghCdBQqlGPssUW/pzC+8d9SdoFZKBupYszhAOrplh9jlU5CNzbusI5smL4mju0dHYQpa5DTv3Ep6ex6aGQqK0zVwwdbPfaU5U2qH4mxTTSMOk0mdzDq6MGcgwKY/AHlHpF/uw5iMoPEhaAw9/A/d2WU/UCPjvDQ7L9qxAK3MIqf1kH4SIia+Yv4aZXUaP4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vz68rCYafkV9A6gl62nzR4vFniAhcvj0HWJY1atpBjE=;
 b=G52zzQNVXtloxYkEs/+EVWLWqpbrjvyl4x9wIsSyw7POkZiGSld4NBDNUxeLPpqYeC4jN7JsxIeC4qufXzPJk+rMxVEp59gQJauHhPM/tq1b0BnOGCj35X1emREl8qx/78wt45E4hiiM07CdOhyYlXvoccce7ot+K2g0nhmAP+0WJfeahh6I9WF5D+DHC65B2jPZSnElq+VL7PunldFEczCylOxI+PR4Fwi/9/FjHNRi8eMb6E7+wKAKE3B1foQqtKyHlEJvY0GaoeKUhJXHQRgxCvULQvsXe4z6FxD/wbvQi8qxXxp4UTrZ7gZHIXXKJx1Qlp1QmwyxNmPWZR5XyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vz68rCYafkV9A6gl62nzR4vFniAhcvj0HWJY1atpBjE=;
 b=hc7aG3J2eGuZpEKxyneoU85UqOkwWBdVSJCFNbOwh8HTnyoi31H42IjpFL6NPdhGzvw/Uye1vPN5BLEUy9nkZKfcM0OtDBgi95jPJLro0j54kwERzfYNvpb3wgetfPMhFwNpH4kWk2nYf39yoPwuIEVVR+QNDjut0VWPJcChA10=
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::17)
 by VI0PR04MB10174.eurprd04.prod.outlook.com (2603:10a6:800:243::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Sat, 14 Jun
 2025 14:21:13 +0000
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::c04e:8a97:516c:5529]) by AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::c04e:8a97:516c:5529%5]) with mapi id 15.20.8835.026; Sat, 14 Jun 2025
 14:21:13 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sat, 14 Jun 2025 17:20:58 +0300
Subject: [PATCH 3/3] arm64: dts: add description for solidrun imx8mp
 hummingboard variants
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-imx8mp-sr-som-v1-3-3ca3269883c4@solid-run.com>
References: <20250614-imx8mp-sr-som-v1-0-3ca3269883c4@solid-run.com>
In-Reply-To: <20250614-imx8mp-sr-som-v1-0-3ca3269883c4@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Yazan Shhady <yazan.shhady@solid-run.com>, 
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Jon Nettleton <jon@solid-run.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TL0P290CA0004.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::17) To AM9PR04MB7586.eurprd04.prod.outlook.com
 (2603:10a6:20b:2d5::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR04MB7586:EE_|VI0PR04MB10174:EE_|AM3PEPF0000A798:EE_|GVXPR04MB10304:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e587137-6f47-4ba0-d09c-08ddab4ec159
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|52116014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dm5ZclJVRHh0ajRXRDBqK29lZVEyT3RBRUtqM2phWDk3a3IyNGVhMVhyL3FE?=
 =?utf-8?B?TEhkM0c0eDJLUVlwQ01EajlHNlFpeExwVDduVlNNbk10Qmk1R0JxbnVjS3Qv?=
 =?utf-8?B?blVqT1NYM1ZuMTVpSVdDTnJZNjJQdDdqSFhidGVYVjg1bTJXOXpYVkVnSE93?=
 =?utf-8?B?Q1N6T3g2QnZLa3hNeFRtSlU2RzB0dlNpQ3dOc212OStNdm56bkY2c1FoOFUv?=
 =?utf-8?B?bFp6MzUwVndkZzZUWGtLcmQxYlVDVmhpS3hNMUc0SGpBUVhKRVpCZkVYeDY0?=
 =?utf-8?B?OHIxZXdSV3BVMS9BV0h4NStUL3FiYlIvSGtyMHhtaGl4enN1MDc1UlVOVmhn?=
 =?utf-8?B?Withcmg4Qm5yVStVMGpiN3R5SVhUanRYUGJTSVBXTkFiVDRoYWdDWXJYTUpO?=
 =?utf-8?B?SkZzaUt5UVZZc1BPYXZ6aEVPQmd4VTBYS1NJcHZFQnFBbTFXeHhaWjBZRzZY?=
 =?utf-8?B?WCs3WU53bmZiV21MNGthelk5eDVNWGtpZGtmWG1XaVVORjYwYnRXU3VpWCtj?=
 =?utf-8?B?aGFJeE1LN2xXOHMwQm0vQ2dhcFQ3QjdBa2g4RU1xR0RlUDVySjdVY3VjcVR6?=
 =?utf-8?B?alRtN1BHUC84c0NBSnJXbjEvTEdlNFVRdUE1cVFtdVY3UjVOWm1RclFLd0dB?=
 =?utf-8?B?b2xJVGlNcXVqenpUNTRXdTczL3hHMUZIbXFpbmplSXhLNXZzaTVkVkdOMW4z?=
 =?utf-8?B?Yi95MjNxTDhyYk5KVEdqTWxEbnMrZzQySWhmenQwMUJKZlE3bDcwY2w5eTYx?=
 =?utf-8?B?dzNiSzVrOFYvakgrcmlZTDJhNysvNnkveGxQRGFNV1JyWUZaYVNkcFZtR0g1?=
 =?utf-8?B?MEU1UHBXN3VxeENRTk1nU0s2K1FmbVN4MlgyYkpQN2hQVVpyaklJU2pTUUhu?=
 =?utf-8?B?VlE3OXQyemhSUnUxTkJKVlhmVkxDeUF2R2l2bGltUmNWYWI4RXdqYkt6MDRF?=
 =?utf-8?B?dXZqeVRCeVpYQnAzNVI4NUVYS0s0eTZwa3I2SGJZSzg2TjBLS1I0T3MzaFlU?=
 =?utf-8?B?bitLMGk2NG1MVXA3bWkyVWZPVUVjRjFpcENSVUVGQ2NySGZldVRsd3BLYW4y?=
 =?utf-8?B?QmFQc1NOMG04MDVWemtFb08rVWxTQnhHSVg4M0RFalpNeGRESmxwc1dkMEFE?=
 =?utf-8?B?RmhkVXJSSDdnbG9pNjlZWlRBMHA5VzQrVGdmWG5DWXhzUE5zd2tPL0FpbFFv?=
 =?utf-8?B?Y1pGRTBvVDBlMlNoS01wUmJxUHdYZDBVQ0Fqb1ZjOGtWMEVOeDNpZmkzNERv?=
 =?utf-8?B?RVJ4SlE4SXh0OHM3US90c3dIZ3hBYjR0c3RySFZMTVNQOEtwd3NFVFpENXY3?=
 =?utf-8?B?VWdhM1J4QVM2K3dIRkpGRTF2ZGp2RmI4ckJUemp4czRoeVhkWDl1aXZrNXQv?=
 =?utf-8?B?cVBLU3ZXMTJEZzBpUEE2MFY5TVRSQkNDQWlzMXJTVFVtK2pGdmVNK0dZWXpr?=
 =?utf-8?B?WmE4UzdnTVBidXhERC9hS21McFFDbmhnTHBpMHFqRW1NVDg5WUpNVFFKS1BX?=
 =?utf-8?B?cUp4aW1tVGlUZ0ZBNVlTVU80c3g1L2tLdkNHa1hLdzEyTmZLSllHS3VPWm1h?=
 =?utf-8?B?TDVMemdmT1E1RXRGL1h3MExrUy9Wbnc0b1Btdm9KSFFLQllqdWZhZGIzajUr?=
 =?utf-8?B?U3NmL0VibkRWMnptVE5yeVVZdFlhc1NIUDZ1cHdNOXZiVnQ4QUtydHNUbXlj?=
 =?utf-8?B?N0pJOUxtMkJGeDNsSXN4d2twQ1RKblF5a2NOcElRNEVoeTVhUFNUU25jT3ls?=
 =?utf-8?B?YUxNVmROWERXQi9DZU0vWFBqVmZZazFKZEg1N1drZVpnRmxLa0F4TXExUStZ?=
 =?utf-8?B?bHhNREtsdWJHZVhtNlZHUVY1cW5KZG1TOE5nZEMwL29JMTVPTG1HSk8zaU1z?=
 =?utf-8?B?TTNja0xyYUpkSy8wWmJXOUw1UldRVTlkcUZZVUxBVHRnR2dTaXpQRHFveHp0?=
 =?utf-8?Q?uokvJNXWD+Y=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB7586.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(52116014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10174
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 61c1dd5456bc4cdbb469d2e9d5d36d16:solidrun,office365_emails,sent,inline:c6c1941fd6a7e60e4eda29d9496811eb
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cb848167-e668-4ad4-6d32-08ddab4eb787
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|82310400026|1800799024|7416014|14060799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SDFiT0tYUUFPbFNQTjdHamV0ZEVPaWNDdVZuMjB1c0dXamMrTUhjZ2s5NTRm?=
 =?utf-8?B?Q0NZbUZTYUZGZCtIbFBLdHNTb0x3RVgvNzJJcU8zWi8yNXcvYXJoYUFDSDJZ?=
 =?utf-8?B?VWZZZ2pJRUtHdlpUbDY1Z1ljM1hFM3pSZzlmU0hmUFJWVjRTbFJidTlwVnlW?=
 =?utf-8?B?cFJ6eFhLcDFCREN4Y1kzZEdvTXFmYXZNNlR2SlZRYktjVGY3cUdBa29UcnZO?=
 =?utf-8?B?WVM1L0JGZndTejhUcldRS1FUZ1R2emV5MHFScXZoaGNXQ3dTckQ2cW5aMTlp?=
 =?utf-8?B?amVjNVl2a2MyZXJTRC9sSGc2Z2lJUWFoZ0phRDFWdno4ODNTcW4rbE50YnFS?=
 =?utf-8?B?ZHZOdExQZU40VFQvK3JXdFVLUExFRDc3UkZPbldKY2JqdVMzRHlLdjZkOUZz?=
 =?utf-8?B?cGE1WGJDd0UxQUNyNmNab0pHSWg0MUovMzdIV2Y2bitoRFg1eHVRc1gvYnRr?=
 =?utf-8?B?RytlTjdjMjRidHl5Ly8rS0M0MlZOM3dWZ3ByMUZGY0JjVkFRYXdrTUlNK3VE?=
 =?utf-8?B?S25qUkQzM253Tnlzc2VaTkFVVTMwT01DNHpEZWo0dGtkOVFIZW5YZ2piWVZ3?=
 =?utf-8?B?UHNKdWZZcTdwOFp6UDVRS2Z4QmNtV0g5UzI1SVZvZStNV1NSWGF1RXNqc05P?=
 =?utf-8?B?MDBhNHJUMG5IY1NSYU9BK3ZudjRsdU45WG5qSDFkN1JVd3BlTytYSkdXdStw?=
 =?utf-8?B?R3BxNEFYRHRTZGUyR2tnenRxdEc3b2lqMTQ2TEphbHpGZ3lTQzFDdzJMbFhX?=
 =?utf-8?B?RU90R0M4eDN6T290U1d3V1JSUzhiM041NURIRU8zaUs3NzBRZDRITzF0TWxs?=
 =?utf-8?B?cHVjNVlxL1JDcXZRWUwxS2JUWllwdkJ1d2UzbXlMS2tndXhJWGl5UmRJM2Rq?=
 =?utf-8?B?eGNXblVWY0JtUmZRZVhDNkYzTitzYm1PTDhPQ3YzMUN4RjNtSmZQQzhrR0xC?=
 =?utf-8?B?bFRiYXJ1QStNQTA5QVJHZ0JxcDVLa3lzZW1NVkg5TUtQVk9LSjlkaEhudmtt?=
 =?utf-8?B?WUZnZE9vMWZSRkZBeCszWDRoTWlmcFBYWFlzSm1IK21yNVcrSmUrN2dRY29j?=
 =?utf-8?B?V2RNUU1Zd3FSTXhMcnNjZGF2OVNLVjhreitSZkVtakwvWk52dUc5VHNRSlZV?=
 =?utf-8?B?WiszaXlkdmxHMXdQR28wYzV2am1VZHg4NHpTb09abVl1dGNMaVo5NStrRW5D?=
 =?utf-8?B?WjlXRHFCYUx2dlRWcDhjL0xBcEVkdVlBdjBLakdsVzREK0JqV2ZBbmwvQ1d4?=
 =?utf-8?B?NFRKYUZQZVA4ajFRUUExRXB6VlVhb3dBazF4WXdTUXhDVDlidlBES2xEbEFl?=
 =?utf-8?B?UGFDWXZvbnhtamdNeGZMUDBMSmcra1AwQTJ0aDgvZHF5cHcyejQzT0trdWE5?=
 =?utf-8?B?em91anYra2Z3cGRNYlJUWUY5cVdPVkJZYWZCSW9VNzlQdWFCR29FYk80UXZk?=
 =?utf-8?B?TjIydThYZ0hzMTRjVnBob0Y2clh3c0JzMlovZ1pKa0NhYXpQeVRiM2ovTUU3?=
 =?utf-8?B?aVAvUUxFVnhsOEZqMXU0T2NUWjhUSTdLZ2ZFa0NpakZZMFlwZ2pCUjl5bDlH?=
 =?utf-8?B?aVBnc2FYeXV3ZG1pUmtqenVSVlZ5VlJVcEdGS21uSkN2cWdPM0FWTjF5SzFh?=
 =?utf-8?B?WFQwNnFOajY2NHJzNGpvVjFGcUUvdDZ5R1lYRlcwQlc1K3c1Y1MvaDN2Uldk?=
 =?utf-8?B?RXZGTGM5NkFKVWgrSVV3b0VianNMU3RjU1Z5MWhERTdteGFORkc5TUxLRHUy?=
 =?utf-8?B?dUZHUlNJOGF0bGJyejVTeWw5VkYyMGd2MDh4enI5T3FaZ2lSQ28wQXBnaktZ?=
 =?utf-8?B?d0ZpbnZ5T01qa0YzdXhyVkNTYWs5ZzJ3bldZS2w3cjVNWGlGVnJ4MkJYZEd3?=
 =?utf-8?B?UG0zNUs5Q2hoWlVQYktaM01tOThDakV3VzVOUDFzMWVHWThVNFRCTkowRjZW?=
 =?utf-8?B?VEliN2VVT1lzM05pMTJnSzJodHo3R1QyaFR5RTBScEFwam81T1Zwb295b0k0?=
 =?utf-8?B?V1ZTS2hKSDZ3S0dWNzJVNFcxZ3RqbzdSQzRDdUJ1UWM0bGFIeWNPcUtvOHlX?=
 =?utf-8?Q?YZ/zu/?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(82310400026)(1800799024)(7416014)(14060799003)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2025 14:21:29.5272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e587137-6f47-4ba0-d09c-08ddab4ec159
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10304

Add descriptions for the SolidRun i.MX8M Plus System on Module based
HummingBoard product-line. They share a common designed based on the
"Pulse" version, defined by various assembly options.

The HummingBoard Pulse features:
- 2x RJ45 Ethernet
- 2x USB-3.0 Type A
- HDMI connector
- mini-HDMI connector
- microSD connector
- mini-PCI-E connector with SIM slot supporting USB-2.0/3.0 interfaces
- M.2 connector with SIM slot supporting USB-2.0/3.0 interfaces
- MIPI-CSI Camera Connector (not described without specific camera)
- 3.5mm Analog Stereo Out / Microphone In Headphone Jack
- RTC with backup battery

The variants Mate and Ripple are reduced versions of Pulse.

The HummingBoard Pro extends Pulse with PCI-E on M.2 connector.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 .../dts/freescale/imx8mp-hummingboard-mate.dts     |  31 ++
 .../boot/dts/freescale/imx8mp-hummingboard-pro.dts |  76 ++++
 .../freescale/imx8mp-hummingboard-pulse-codec.dtsi |  59 ++++
 .../imx8mp-hummingboard-pulse-common.dtsi          | 390 +++++++++++++++++++++
 .../freescale/imx8mp-hummingboard-pulse-hdmi.dtsi  |  44 +++
 .../freescale/imx8mp-hummingboard-pulse-m2con.dtsi |  60 ++++
 .../imx8mp-hummingboard-pulse-mini-hdmi.dtsi       |  81 +++++
 .../dts/freescale/imx8mp-hummingboard-pulse.dts    |  72 ++++
 .../dts/freescale/imx8mp-hummingboard-ripple.dts   |  31 ++
 10 files changed, 848 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index e98c15eb949957a193eb3a7612f3f0f2b04790af..ccc1d6f98495589cb6a55b198d1933bcf076fcb8 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -203,6 +203,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pro.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pulse.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-ripple.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-iota2-lumpy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-bl-osm-s.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-mate.dts b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-mate.dts
new file mode 100644
index 0000000000000000000000000000000000000000..00614f5d58ea9de51aad9a5f36212dc3d4f3ecaf
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-mate.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include "imx8mp-sr-som.dtsi"
+#include "imx8mp-hummingboard-pulse-common.dtsi"
+#include "imx8mp-hummingboard-pulse-hdmi.dtsi"
+
+/ {
+	model = "SolidRun i.MX8MP HummingBoard Mate";
+	compatible = "solidrun,imx8mp-hummingboard-mate",
+		     "solidrun,imx8mp-sr-som", "fsl,imx8mp";
+
+	aliases {
+		ethernet0 = &eqos;
+		/delete-property/ ethernet1;
+	};
+};
+
+&fec {
+	/* this board does not use second phy / ethernet on SoM */
+	status = "disabled";
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mikro_pwm_pins>, <&mikro_int_pins>, <&mikro_rst_pins>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pro.dts b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pro.dts
new file mode 100644
index 0000000000000000000000000000000000000000..36cd452f1583987a1e826d33798d9aecaaf21568
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pro.dts
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/phy/phy-imx8-pcie.h>
+
+#include "imx8mp-sr-som.dtsi"
+#include "imx8mp-hummingboard-pulse-codec.dtsi"
+#include "imx8mp-hummingboard-pulse-common.dtsi"
+#include "imx8mp-hummingboard-pulse-hdmi.dtsi"
+#include "imx8mp-hummingboard-pulse-m2con.dtsi"
+#include "imx8mp-hummingboard-pulse-mini-hdmi.dtsi"
+
+/ {
+	model = "SolidRun i.MX8MP HummingBoard Pro";
+	compatible = "solidrun,imx8mp-hummingboard-pro",
+		     "solidrun,imx8mp-sr-som", "fsl,imx8mp";
+
+	aliases {
+		ethernet0 = &eqos;
+		ethernet1 = &fec;
+	};
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mikro_pwm_pins>, <&mikro_int_pins>, <&hdmi_pins>,
+		    <&m2_wwan_wake_pins>;
+};
+
+&pcie {
+	pinctrl-0 = <&m2_reset_pins>;
+	pinctrl-names = "default";
+	reset-gpio = <&gpio1 6 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcie_phy {
+	clocks = <&hsio_blk_ctrl>;
+	clock-names = "ref";
+	fsl,clkreq-unsupported;
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_OUTPUT>;
+	status = "okay";
+};
+
+&phy0 {
+	leds {
+		/* ADIN1300 LED_0 pin */
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_ORANGE>;
+			function = LED_FUNCTION_LAN;
+			default-state = "keep";
+		};
+
+		/delete-node/ led@1;
+	};
+};
+
+&phy1 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* ADIN1300 LED_0 pin */
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			default-state = "keep";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-codec.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-codec.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..fd16916676db4ec6f0e66d9c52355c37fe06b971
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-codec.dtsi
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/ {
+	sound-wm8904 {
+		compatible = "fsl,imx-audio-wm8904";
+		model = "audio-wm8904";
+		audio-cpu = <&sai3>;
+		audio-codec = <&codec>;
+		audio-routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"AMIC", "MICBIAS",
+			"IN2R", "AMIC";
+	};
+};
+
+&i2c2 {
+	codec: codec@1a {
+		#sound-dai-cells = <0>;
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>;
+		clock-names = "mclk";
+		AVDD-supply = <&v_1_8>;
+		CPVDD-supply = <&v_1_8>;
+		DBVDD-supply = <&v_3_3>;
+		DCVDD-supply = <&v_1_8>;
+		MICVDD-supply = <&v_3_3>;
+	};
+};
+
+&iomuxc {
+	sai3_pins: pinctrl-sai3-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_MCLK__AUDIOMIX_SAI3_MCLK	0xd6
+			MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI3_TX_SYNC	0xd6
+			MX8MP_IOMUXC_SAI3_TXC__AUDIOMIX_SAI3_TX_BCLK	0xd6
+			MX8MP_IOMUXC_SAI3_TXD__AUDIOMIX_SAI3_TX_DATA00	0xd6
+			MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI3_RX_DATA00	0xd6
+		>;
+	};
+};
+
+&sai3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sai3_pins>;
+	assigned-clocks = <&clk IMX8MP_CLK_SAI3>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <12288000>;
+	clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_IPG>, <&clk IMX8MP_CLK_DUMMY>,
+		 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>, <&clk IMX8MP_CLK_DUMMY>,
+		 <&clk IMX8MP_CLK_DUMMY>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..904c8d6fd5cdb4295da0a8d58711032a51578371
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
@@ -0,0 +1,390 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+#include <dt-bindings/leds/common.h>
+
+/ {
+	aliases {
+		rtc0 = &carrier_rtc;
+		rtc1 = &snvs_rtc;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins>;
+
+		led-0 {
+			label = "D30";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 28 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-1 {
+			label = "D31";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio4 24 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-2 {
+			label = "D32";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio4 23 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-3 {
+			label = "D33";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio4 21 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-4 {
+			label = "D34";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+	};
+
+	rfkill-mpcie-wifi {
+		/*
+		 * The mpcie connector only has USB,
+		 * therefore this rfkill is for cellular radios only.
+		 */
+		compatible = "rfkill-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&mpcie_rfkill_pins>;
+		label = "mpcie radio";
+		radio-type = "wwan";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
+	};
+
+	vmmc: regulator-mmc {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vmmc_pins>;
+		regulator-name = "vmmc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <250>;
+	};
+
+	vbus1: regulator-vbus-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus1";
+		gpio = <&gpio1 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vbus1_pins>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vbus2: regulator-vbus-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus2";
+		gpio = <&gpio1 15 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vbus2_pins>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	v_1_2: regulator-1-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+	};
+
+	vmpcie {
+		/* supplies mpcie and m2 connectors */
+		compatible = "regulator-fixed";
+		regulator-name = "vmpcie";
+		gpio = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vmpcie_pins>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+};
+
+/* mikrobus spi */
+&ecspi2 {
+	num-cs = <1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&mikro_spi_pins>;
+	status = "okay";
+
+	spi@0 {
+		reg = <0>;
+		compatible = "rohm,dh2228fv";
+		spi-max-frequency = <500000>;
+	};
+};
+
+&gpio1 {
+	pinctrl-0 = <&mpcie_reset_pins>;
+	pinctrl-names = "default";
+
+	mpcie-reset-hog {
+		gpio-hog;
+		gpios = <1 GPIO_ACTIVE_LOW>;
+		output-low;
+		line-name = "mpcie-reset";
+	};
+};
+
+&i2c3 {
+	carrier_rtc: rtc@69 {
+		compatible = "abracon,ab1805";
+		reg = <0x69>;
+		abracon,tc-diode = "schottky";
+		abracon,tc-resistor = <3>;
+	};
+
+	carrier_eeprom: eeprom@57{
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+};
+
+&iomuxc {
+	csi_pins: pinctrl-csi-grp {
+		fsl,pins = <
+			/* Pin 24: STROBE */
+			MX8MP_IOMUXC_NAND_DATA01__GPIO3_IO07		0x0
+		>;
+	};
+
+	mikro_int_pins: pinctrl-mikro-int-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09		0x0
+		>;
+	};
+
+	mikro_pwm_pins: pinctrl-mikro-pwm-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_MISO__GPIO5_IO08		0x0
+		>;
+	};
+
+	mikro_rst_pins: pinctrl-mikro-rst-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_RXD__GPIO4_IO30		0x0
+		>;
+	};
+
+	mikro_spi_pins: pinctrl-mikro-spi-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SS0__ECSPI2_SS0		0x40000
+			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK		0x82
+			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO		0x82
+			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI		0x82
+		>;
+	};
+
+	mikro_uart_pins: pinctrl-mikro-uart-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX		0x140
+			MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX		0x140
+		>;
+	};
+
+	led_pins: pinctrl-led-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_RXC__GPIO4_IO22		0x0
+			MX8MP_IOMUXC_SAI2_RXFS__GPIO4_IO21		0x0
+			MX8MP_IOMUXC_SAI2_RXD0__GPIO4_IO23		0x0
+			MX8MP_IOMUXC_SAI2_TXFS__GPIO4_IO24		0x0
+			MX8MP_IOMUXC_UART4_RXD__GPIO5_IO28		0x0
+		>;
+	};
+
+	mpcie_reset_pins: pinctrl-mpcie-reset-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01		0x0
+		>;
+	};
+
+	mpcie_rfkill_pins: pinctrl-pcie-rfkill-grp {
+		fsl,pins = <
+			/* weak i/o, open drain */
+			MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05		0x20
+		>;
+	};
+
+	usb_hub_pins: pinctrl-usb-hub-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO11__GPIO1_IO11		0x0
+		>;
+	};
+
+	usdhc2_pins: pinctrl-usdhc2-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x190
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d0
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d0
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d0
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d0
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
+		>;
+	};
+
+	usdhc2_100mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x194
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d4
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d4
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d4
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d4
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d4
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
+		>;
+	};
+
+	usdhc2_200mhz_pins: pinctrl-usdhc2-200mhz-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x196
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d6
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d6
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d6
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d6
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d6
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
+		>;
+	};
+
+	vbus1_pins: pinctrl-vbus-1-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14		0x20
+		>;
+	};
+
+	vbus2_pins: pinctrl-vbus-2-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15		0x20
+		>;
+	};
+
+	vmmc_pins: pinctrl-vmmc-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19		0x41
+		>;
+	};
+
+	vmpcie_pins: pinctrl-vmpcie-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10		0x0
+		>;
+	};
+};
+
+&phy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* ADIN1300 LED_0 pin */
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_ORANGE>;
+			function = LED_FUNCTION_LAN;
+			default-state = "keep";
+		};
+
+		/* ADIN1300 LINK_ST pin */
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			default-state = "keep";
+		};
+	};
+};
+
+&snvs_pwrkey {
+	status = "okay";
+};
+
+/* mikrobus uart */
+&uart3 {
+	status = "okay";
+};
+
+&usb3_phy0 {
+	fsl,phy-tx-preemp-amp-tune-microamp = <1200>;
+	vbus-supply = <&vbus2>;
+	status = "okay";
+};
+
+&usb3_0 {
+	status = "okay";
+};
+
+&usb3_phy1 {
+	vbus-supply = <&vbus1>;
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	dr_mode = "host";
+};
+
+&usb_dwc3_1 {
+	dr_mode = "host";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb_hub_pins>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb4b4,6502", "usb4b4,6506";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&v_1_2>;
+		vdd2-supply = <&v_3_3>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb4b4,6500", "usb4b4,6504";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&v_1_2>;
+		vdd2-supply = <&v_3_3>;
+	};
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&usdhc2_pins>;
+	pinctrl-1 = <&usdhc2_100mhz_pins>;
+	pinctrl-2 = <&usdhc2_200mhz_pins>;
+	vmmc-supply = <&vmmc>;
+	bus-width = <4>;
+	cap-power-off-card;
+	full-pwr-cycle;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-hdmi.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-hdmi.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..d7a999c0d7e06a8c47a61632a59eb97faea9e3d4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-hdmi.dtsi
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/ {
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+	};
+};
+
+&aud2htx {
+	status = "okay";
+};
+
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	status = "okay";
+};
+
+&hdmi_tx_phy {
+	status = "okay";
+};
+
+&iomuxc {
+	hdmi_pins: pinctrl-hdmi-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x400001c3
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x400001c3
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x154
+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD		0x154
+		>;
+	};
+};
+
+&lcdif3 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-m2con.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-m2con.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..b879ca4ed21428b8d4c6866f9a827bcfbef1caee
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-m2con.dtsi
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/ {
+	rfkill-m2-gnss {
+		compatible = "rfkill-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&m2_gnss_rfkill_pins>;
+		label = "m.2 GNSS";
+		radio-type = "gps";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+	};
+
+	/* M.2 is B-keyed, so w-disable is for WWAN */
+	rfkill-m2-wwan {
+		compatible = "rfkill-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&m2_wwan_rfkill_pins>;
+		label = "m.2 WWAN";
+		radio-type = "wwan";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&iomuxc {
+	m2_gnss_rfkill_pins: pinctrl-m2-gnss-rfkill-grp {
+		fsl,pins = <
+			/* weak i/o, open drain */
+			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07		0x20
+		>;
+	};
+
+	m2_wwan_rfkill_pins: pinctrl-m2-wwan-rfkill-grp {
+		fsl,pins = <
+			/* weak i/o, open drain */
+			MX8MP_IOMUXC_GPIO1_IO13__GPIO1_IO13		0x20
+		>;
+	};
+
+	m2_wwan_wake_pins: pinctrl-m2-wwan-wake-grp {
+		fsl,pins = <
+			/* weak i/o, open drain */
+			MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12		0x20
+		>;
+	};
+
+	m2_reset_pins: pinctrl-m2-reset-grp {
+		fsl,pins = <
+			/*
+			 * 3.3V domain on SoC, set open-drain to ensure
+			 * 1.8V logic on connector
+			 */
+			MX8MP_IOMUXC_GPIO1_IO06__GPIO1_IO06		0x20
+		>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..46916ddc053355b6708629898fa13e55c6493cc2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/ {
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "c";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
+};
+
+&i2c3 {
+	hdmi@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>, <0x3f>, <0x3c>, <0x38>;
+		reg-names = "main", "edid", "cec", "packet";
+		adi,dsi-lanes = <4>;
+		avdd-supply = <&v_1_8>;
+		dvdd-supply = <&v_1_8>;
+		pvdd-supply = <&v_1_8>;
+		a2vdd-supply = <&v_1_8>;
+		v3p3-supply = <&v_3_3>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&mini_hdmi_pins>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				adv7535_from_dsim: endpoint {
+					remote-endpoint = <&dsim_to_adv7535>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				adv7535_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
+&iomuxc {
+	mini_hdmi_pins: pinctrl-mini-hdmi-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_MCLK__GPIO4_IO27		0x0
+		>;
+	};
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <10000000>;
+	status = "okay";
+
+	port@1 {
+		dsim_to_adv7535: endpoint {
+			remote-endpoint = <&adv7535_from_dsim>;
+			attach-bridge;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dts b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dts
new file mode 100644
index 0000000000000000000000000000000000000000..920740630e3524ffbb94d70be0f66a2653eb0394
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dts
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/phy/phy-imx8-pcie.h>
+
+#include "imx8mp-sr-som.dtsi"
+#include "imx8mp-hummingboard-pulse-codec.dtsi"
+#include "imx8mp-hummingboard-pulse-common.dtsi"
+#include "imx8mp-hummingboard-pulse-hdmi.dtsi"
+#include "imx8mp-hummingboard-pulse-m2con.dtsi"
+#include "imx8mp-hummingboard-pulse-mini-hdmi.dtsi"
+
+/ {
+	model = "SolidRun i.MX8MP HummingBoard Pulse";
+	compatible = "solidrun,imx8mp-hummingboard-pulse",
+		     "solidrun,imx8mp-sr-som", "fsl,imx8mp";
+
+	aliases {
+		ethernet0 = &eqos;
+		ethernet1 = &pcie_eth;
+	};
+};
+
+&fec {
+	/* this board does not use second phy / ethernet on SoM */
+	status = "disabled";
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mikro_pwm_pins>, <&mikro_int_pins>, <&hdmi_pins>,
+		    <&m2_wwan_wake_pins>, <&m2_reset_pins>;
+
+	pcie_eth_pins: pinctrl-pcie-eth-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28		0x0
+		>;
+	};
+};
+
+&pcie {
+	pinctrl-0 = <&pcie_eth_pins>;
+	pinctrl-names = "default";
+	reset-gpio = <&gpio4 28 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	root@0,0 {
+		compatible = "pci16c3,abcd";
+		reg = <0x00000000 0 0 0 0>;
+
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		/* Intel i210 */
+		pcie_eth: ethernet@1,0 {
+			compatible = "pci8086,157b";
+			reg = <0x00010000 0 0 0 0>;
+		};
+	};
+};
+
+&pcie_phy {
+	clocks = <&hsio_blk_ctrl>;
+	clock-names = "ref";
+	fsl,clkreq-unsupported;
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_OUTPUT>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-ripple.dts b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-ripple.dts
new file mode 100644
index 0000000000000000000000000000000000000000..4ce5b799b6abc514ca00e2e2134d5ff1606dc87d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-ripple.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include "imx8mp-sr-som.dtsi"
+#include "imx8mp-hummingboard-pulse-common.dtsi"
+#include "imx8mp-hummingboard-pulse-mini-hdmi.dtsi"
+
+/ {
+	model = "SolidRun i.MX8MP HummingBoard Ripple";
+	compatible = "solidrun,imx8mp-hummingboard-ripple",
+		     "solidrun,imx8mp-sr-som", "fsl,imx8mp";
+
+	aliases {
+		ethernet0 = &eqos;
+		/delete-property/ ethernet1;
+	};
+};
+
+&fec {
+	/* this board does not use second phy / ethernet on SoM */
+	status = "disabled";
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mikro_pwm_pins>, <&mikro_int_pins>, <&mikro_rst_pins>;
+};

-- 
2.43.0

