Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011020.outbound.protection.outlook.com [52.101.70.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F381F9F61;
	Fri, 27 Jun 2025 06:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751004359; cv=fail; b=gBzfcwbvIfQ7eZCUj/c2mSJxzkT34RoYywlxoo0LvYnn/KvBbq1QUL3lVIlerNvBFlsKqUREQr8F8Dtp2XBBB6vF/p8Gaw1eewk9sAyt+8tBh09mxLOtuAxIM8xJKwZFbFO7z29BQP63Va2ExO6phFYQJalKtECPstimV65lrEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751004359; c=relaxed/simple;
	bh=HPjO6vT5cKhUJgMAtTm0fak7f/fqVj2QS7GWFvcSGO8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jvUKFEPk8Z4Mi0qC9BcxqUWMIugd7tY0PFBE0wuD8eb7O3Ftq3ISNaBp71J3qDbPPfG5u5FlbwND5izjy/otIPTnrUNtWlRDziQzK/L0Dpdqs7M0qFUyKAOSIP0drrkhWl/V8Z2jAQUPQa/+bsd/B8nKQW/vTERi5As7TX3ipc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IBLMp1Jd; arc=fail smtp.client-ip=52.101.70.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IBLMp1Jd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wj65hRNGS+rZHFX8p5oU2g2C0C0A9NfC3Ie7U2DDn+fBuq1JbbMVk4b4D4IVgt6PUZkxCT2etN4BDNrBF6cbPL0+tPThy4ai+n+DsSEZdsLs5ArGIZvtO6Q/uoAdBX9zXR7KgKr2wvk57VChwoU5kdvSjTDKOoBKVVszkPj+KWloFigI9nhr+eXwxxCBG2JXLtdOZvz4e6tZUU5njEn1Z8GiY6ydZRJdcQ+K2XMMLgHqJPbfse+egM9ioFVIkPRAPRQmM18m7xWS6r7SU25iO7ux4+7cLv78EGbC+0LOHSFuI+5lJIra6CW2F/Et+Wow6EBGOiZ1yvvGRm/NhxB0TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9z91OnwaVwNjiCy15omIfQDlwzxEufGyONNeya6kcYQ=;
 b=p1gjENqfU5LX+Wt8nJLEgeIfefHIVUIEIKbCDFwIRa3Z2JQ/6Ai6nQzNwih2D8DsKb4Pa9bTz2VsDeDXYGISV7662dx8d+G6phMgpK0zp66CGJh0kh9n5mjILIMuyuT0Bktmoi0dbrnq67nAyj9ipj59zZCeSG5MbsdFuvN7rm9S0TanLc64JXazzu+gwMydDNVqX+PLp0kSlQvQQ/b0EdTz2u287HGGqUNkkEZeMKkbvdP+EB1+9HZAmxZhHKIwetASuwbzUFoh4Y6CZbVxwZ7pnldwWH1kAD3LOjWrkdU3s23DnLXpmpn+o5POaeSD/akMCbx3dBVY+9b0UQVM+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9z91OnwaVwNjiCy15omIfQDlwzxEufGyONNeya6kcYQ=;
 b=IBLMp1Jdma0y2DaCiToQEO+XtKeFnbSMX6cBOCcO4DWNFFNVFARGMxiNrb3/B6RH099ismLRDuO61Y/xMM7ZJ20v7wchTlmR49/jiPUx0iZLQ82FqYtJs/pDYZ7X9E33sB84f6KFIkBbCe2ihiqOLYFOafhdo8KNUkl8cFofMC9hEv+Nv66jU688grX0Vf7nFZp5lfW/3CEqmBtDVnYL8/K+nGfLEatdn+oaQBXN6tMCxpvD2ShisAhX7aoCym/4kNfHe3TGpes5OMgohD8eDfyiwgNGetIWJj0dB0xKeVVnx217j8IDiOCJ9HQ/epVFpykhiirp8fWuDWlQJD3lOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Fri, 27 Jun
 2025 06:05:55 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 06:05:55 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 27 Jun 2025 14:03:47 +0800
Subject: [PATCH 4/7] firmware: arm_scmi: imx: Support getting silicon info
 of MISC protocol
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-sm-misc-api-v1-v1-4-2b99481fe825@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751004238; l=3766;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=HPjO6vT5cKhUJgMAtTm0fak7f/fqVj2QS7GWFvcSGO8=;
 b=ChY7+N6nzmCxuKmXewXbimoARDD2XGYdaHMvJwbcpJI7J8I16vOhLBXIKWVZ90Ma/82ElkcDJ
 2sjY9HNOXEmD7f9uFrTNRyLIn7T4iCvONBvoaHihZnws19ZW7x9aawp
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
X-MS-Office365-Filtering-Correlation-Id: 47918de1-752d-434d-ae89-08ddb540adaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UkM0MHRWaStNb0R5MTFZWWdkbU1KRjU4Wkp1SXhoUjBOSmQwaTNkMDhweWNx?=
 =?utf-8?B?Z1ZvU3pOcGNib1ZDRWs4dTdtWDBycktFdjQ5RnRmby9TMDBvNzZQc2twVUwv?=
 =?utf-8?B?Y3JWRzJIL09BMHd0ZDlkdG42RmRCRUtvS0V0QWIzNFBjRENiQlA5Ym1GNTJV?=
 =?utf-8?B?RjF5emE1VDN4OHh6MnlwcS9VZUM4YjdlbE1QWGkxMjY5VFhXUnVqRnNJZGVr?=
 =?utf-8?B?YVZlQWdZdXMrNXVYWldNWWNITFdZTlMreERCSWlYcWNUcnVDUkd1ejR4czlp?=
 =?utf-8?B?TUI3WFl5Sm9UdkxCWHZQbytSbXNxcEI5b21sdWNsdndzcHZ6REVCOHRWL1Qw?=
 =?utf-8?B?RThwS2t6dkV0Z2tjRWJUUldKZDNCRlZNRlMydXFIYy9UcWlzaWJ2K3lWMXd5?=
 =?utf-8?B?Ymtpd1kwaEZzcHZvM2t1eFpoOWJNcy96ZDhPRVlUbkFMdzAzSnUrZ1pmVDBz?=
 =?utf-8?B?ZlFFSFJIcmNDNVZnZVFjQXpCb2tvbEZxaFFySHJsV3VrY0VvWHdWRThPQ0NB?=
 =?utf-8?B?ZVl6RVNlc1FSejBIRWtUb0dUQi9YYmRib3dtaVNCWktmZ1BrMGpzWEM1ZkRO?=
 =?utf-8?B?SXYyOWhVZ0RRZkVUclpPVFczOFQxTk1jQzJQNnZackFiMmlPdTFUbDdiQ1ZH?=
 =?utf-8?B?U20yVUxyZzJSaGJaN1RRUUVJNm5lUDJKOFhUSXhhTmJMME8rRS9RZ2pobFBw?=
 =?utf-8?B?NEU2MDhYUk5QdmhQTXpVd3RUOUJDL3kreVVwNXQwdUxyRExxOWZQdW5TWDl5?=
 =?utf-8?B?ajRDMDBuQ2c5TW5jVlNlaU9uNis3MkI1ZnI0V25ldnovaVRXRXB4cUpTUVRo?=
 =?utf-8?B?bTBpMW4rQUtQM0JmVEtqTHNiUDV2QlpNcHA0NlJxZDFBMmxLeVA0QlowK2JJ?=
 =?utf-8?B?bFRqdi9JZnNWSFg1am1xeE9UaDhPRGZjV0tiN3kvL2xoNXZUZjVaUDF1azdu?=
 =?utf-8?B?NjF3ZU5sNHpYa05JNS9HdHVNT1RVUUp4UEgzYmpXb3dUdmZHWGIzTkZPTHR2?=
 =?utf-8?B?a05rby9RR1d3NGFGc0RtekVLczk2bm9nZkVpcUl6VG9EQS9JdURkMjhGSllu?=
 =?utf-8?B?bEFHRi9nVWo2RkdCRlAvcXFYYU9SUnY5K05Vc0xmNHVXN05hZ0pNOEVBSGZm?=
 =?utf-8?B?L0tOKzBPTnFxQUFkZWpFOEs2a1oxZm9LbWFPbUVUYk10K1FaeFVaOW9ZZkUx?=
 =?utf-8?B?ZDkzUW1tRVk4T3Y2YXhuOU4yN1dIanRCUFB0ZTBKYklKREI2Zm1HVVRsS0w3?=
 =?utf-8?B?emdyU2VaeUROM2tnWmszRkRaVUtuMGNqSHFUZVgyOFhFblBIdzFOTTU4eUwz?=
 =?utf-8?B?SHErN09tdU9KWHN0N1A1ejlYOXREVUdHWWdJRFk4VFlacXVZRXdxS24vNXc1?=
 =?utf-8?B?Z09QL24yTWJUVTNKSXNwblcyYjl0V2NQWml1WHA0MkZHMGRuYk83bFJQekty?=
 =?utf-8?B?eFljb3Z3VEgxbDlyZXdzUmFrWkFIaDl5a1VSdHU5UlgxdGdZekw3VHZlNjZn?=
 =?utf-8?B?S3JCMUVQd0taYldXMVR1UVJIYWlOcitXWFhQTmtzeTl3eVhRUEpvMFlxbS9K?=
 =?utf-8?B?ZWsrRC9HNk11TTRiNzUzTTFRMGorWVlnaXNIR2dXbXRFSHlLK0xyOTF6SzhP?=
 =?utf-8?B?dmlvTXhaaEZyRU1YOVYzdUxtanhGbkpad2dieVltZGMxeFY4YkN5WXp2UXJ4?=
 =?utf-8?B?c2MxUXVWRkNvRlBvSGNhUmtKSnMxZUIvUlhZQ01WUWtGMDRLODZZSk5zTlpa?=
 =?utf-8?B?ZDBYVm4rbmhmYVFlNDBjUXRZS3F5Y3FXK0E0RUxpNmt3dFF2alkwQUs1YlZE?=
 =?utf-8?B?dHhPWUNzYkwzc1pJSG1NYUFwSUJNcWJRQ1M3Q0FoTDliUExwaFpWVGZIeUVh?=
 =?utf-8?B?eWxPSm85WkNoMmx2S3VlZWxxMDBEMEdZZjNGc3JoTjJyM2N3WEw3cWN2NFRD?=
 =?utf-8?B?Ykk1ckJNenlud29LNEcxbnJwR29kRjU5bmlhT3Nnd25IRDhOU0RDUlVKNnJC?=
 =?utf-8?B?ZUVDR2dqd0VnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUVCaUlNQmdybUEzZmxyaUlPcWFKcnNVSWp2NXl2dzN1QmcyalAySDRydWIv?=
 =?utf-8?B?aHUvdTRmYzU1cHZvdUt0ZUVzbEkwZ2hCNTRYMCtnMDJ2bityeUkxaTNqQXAz?=
 =?utf-8?B?dzRaNTZ2aFg3ZTFEaHUxdDRqZ2l3WkVwTnFxY1dBODZnUmlVUktSSzM1cWgy?=
 =?utf-8?B?dXA4K2tTZ2MxeXRuZWkxM0hiSmZOL0IxVWoyY1BESjRRQm1kaFZFbzJxc0M3?=
 =?utf-8?B?RTdXN21vaGtuSERQTHJjU2RrRUlRSmhOVHRaSjlZZzBScHlLelhMV2E0a2hQ?=
 =?utf-8?B?WWFUaVVLRjZXayt0Mnh3V2w5a1JBQVdSZWtuQVh6UWJjanc3bzM4MUVxTkt0?=
 =?utf-8?B?QzZud3E3RkNBUm9iSEdiVVVwanYxSUViNEhCRWZqSmxhM2NsZlRvNzNOTE54?=
 =?utf-8?B?TmpXTUlXZG1BVk0xN2NuSWdUWU05ZVFjSnU2eWdXbU9pc2xMWlBrVzlSRFNK?=
 =?utf-8?B?djgwbDRLMWV4THA1OHNhYjdvTjJOV0lzNzVZeEd5KzNIU255NmFLUis2QXBS?=
 =?utf-8?B?c3R4b2NHb2Y4VC9HMGZvTm5JcXRCVFpJNDNReXRvYWtvTURKNi85MEdqMHRR?=
 =?utf-8?B?MlIvaFB1dzF6OFpna3hQMTBLcHA2RUtKelR5dUhLb1lZMUY5blJEWkJ0TjBv?=
 =?utf-8?B?V0NMNWQvSU1LSDU5c1dIV2JaVVVWT21yMkVhU1FDbWtLZ0FKVm5aQVdxUFdj?=
 =?utf-8?B?M2llUUtETURVK1hXVUwwcG5rTkVFM3N6YkJPeFMvNHlGVGpCSDRxbXFpVG4z?=
 =?utf-8?B?bjhhMXlzZUlQVjdqY1E0K0thMXIwbExwUldlTjI5RjlxVUNmZi9MWlNhQis5?=
 =?utf-8?B?ZmViSW4yWC9Wd2p5LzMzRTVxQUdNMUh3dGVOTVU5VWh5L3UzenFyQzBETFRn?=
 =?utf-8?B?WUY1ampWQ0R5UjJ2S0s2YkNxZ2hYbXBYeS9WL0xycHUwZ0dhc01BQ2kwL1VQ?=
 =?utf-8?B?YXJqQlpUQzJpTzcxN1JnZU1oZ3ZTNnY5YkV3aUMweE1qbHRlM0RUTk94TEZP?=
 =?utf-8?B?ZXBxRnZtbG1qNnZwcFJoWVAyTDVsaWJEdzNhOHVOanRzT1lwQ0lUSUcrbWw3?=
 =?utf-8?B?bWpHTEsveTFzNnNhQVNoeU1lZ01BT1M0M2xma3ROeWw0Q0Z5Y1FHeVkxMWww?=
 =?utf-8?B?WVJvK1hKeW5BYWhKZGxxa0hxTkdqV0k2bHdROFBMa2plcVhTMlgrT09CNjJ2?=
 =?utf-8?B?YWpNejBNQ1FSdXh1TjJ2Z0JwNGtUemVrQXBnN1JEN3pjdUpFbDZ2QUNxdGhG?=
 =?utf-8?B?MEMyNEs2VEFibmp4QkxoYkNjOTY0TWs2blVLZkNwVkQ4aUFrWkhPUEtsVEh4?=
 =?utf-8?B?WDFFVC91aHhTdGRsT1RxUnBvRFA1Y0o0bUQ1U09aVlU4aFgrSEJMMWd0V0I4?=
 =?utf-8?B?ZWdKUFFlekhBNDRmc0t5cWx5RGVacmdLbUhaQk5IbXd3NzMwMzM2QnhpM3R5?=
 =?utf-8?B?SjZiZGlhbXFIeTR4OW5INDIwOHpZb2w3Y2t5Nmh0OWY2RmdBY0tQT0lsSnF0?=
 =?utf-8?B?WTFyUE44U1FTdnUyV2YwUzUzbVNrSVRBUFpnUXZsYnNtVitvWFZmSzhTaVYx?=
 =?utf-8?B?cmhiSnpITjRsRE8rU1VQYlAvTnFsNjJHTFlkVVczT1NZY0w4bGV5WjhId1kw?=
 =?utf-8?B?THQrL1hCeFU1ZzNFOUR0cHZBcFNWaUYzOHlpYUxrMTdCNERqdG02WUwwMEs2?=
 =?utf-8?B?dEpuSjdtZUxyMzEycEpEZlJYUHRQWW9WMUtLSVpNS1IxVFpsYVJ3MXVHdW5h?=
 =?utf-8?B?OE5wMjJFSWxUWDY0MnhESHRhMEdPT0dqZUFnNEdpc1QwMnF2c2hpODNDTXpq?=
 =?utf-8?B?V2lHenpiKzdydzVaWmE4ZkFVTS9jVVdvK3I0Q3JndG9RUnJmSVAvZWZhTVdq?=
 =?utf-8?B?WjUwNUthTVNROC8rRmNwbnFqNDhuRUtqd1BsUXZWcVJ2aTRJTkh4RUtTaXpu?=
 =?utf-8?B?dk5SQnhBeFJZc2dhQmpvQnM2OXBndGt1ZVdqUXBSTmZuTHF5TFdUT2JmM1E4?=
 =?utf-8?B?elVYeWtaVkJuMUhXOFI5ekdsTkF1dnB0WEwrcHR6S1BCRGdQQmtJS3BFazhi?=
 =?utf-8?B?VWpRVW1leWlZelo5WEJoN0tmQkZmcTNGcGMyM2xpVUd1dFZSdS9leXBHTURp?=
 =?utf-8?Q?RInJspOvQ+w3d+dgp3ajiYvFE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47918de1-752d-434d-ae89-08ddb540adaf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 06:05:55.3964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fL22FDbx1UAx0B7N8BhoLm9XKouq/23ViOsa41euoBuFY/iFqW1mIAOl2Vrw/yRn8ql7zTBWtVqvj5kmSHaHaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8906

MISC protocol supports getting the silicon information including revision
number, part number and etc. Add the API for user to retrieve the
information from SM.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 34 ++++++++++++++++++++++
 include/linux/scmi_imx_protocol.h                  |  8 +++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
index 8ce4bf92e6535af2f30d72a34717678613b35049..d5b24bc4d4ca6c19f4cddfaea6e9d9b32a4c92f7 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
@@ -26,6 +26,7 @@ enum scmi_imx_misc_protocol_cmd {
 	SCMI_IMX_MISC_CTRL_SET	= 0x3,
 	SCMI_IMX_MISC_CTRL_GET	= 0x4,
 	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
+	SCMI_IMX_MISC_SI_INFO = 0xB,
 	SCMI_IMX_MISC_CFG_INFO = 0xC,
 	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
 };
@@ -79,6 +80,13 @@ struct scmi_imx_misc_cfg_info_out {
 	u8 cfgname[MISC_MAX_CFGNAME];
 };
 
+struct scmi_imx_misc_si_info_out {
+	__le32 deviceid;
+	__le32 sirev;
+	__le32 partnum;
+	u8 siname[MISC_MAX_SINAME];
+};
+
 static int scmi_imx_misc_attributes_get(const struct scmi_protocol_handle *ph,
 					struct scmi_imx_misc_info *mi)
 {
@@ -335,12 +343,38 @@ static int scmi_imx_misc_cfg_info(const struct scmi_protocol_handle *ph,
 	return ret;
 }
 
+static int scmi_imx_misc_silicon_info(const struct scmi_protocol_handle *ph,
+				      struct scmi_imx_misc_system_info *info)
+{
+	struct scmi_imx_misc_si_info_out *out;
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_SI_INFO, 0, sizeof(*out), &t);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		out = t->rx.buf;
+		info->deviceid = le32_to_cpu(out->deviceid);
+		info->sirev = le32_to_cpu(out->sirev);
+		info->partnum = le32_to_cpu(out->partnum);
+		strscpy(info->siname, out->siname, MISC_MAX_SINAME);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
 static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
 	.misc_cfg_info = scmi_imx_misc_cfg_info,
 	.misc_ctrl_set = scmi_imx_misc_ctrl_set,
 	.misc_ctrl_get = scmi_imx_misc_ctrl_get,
 	.misc_ctrl_req_notify = scmi_imx_misc_ctrl_notify,
 	.misc_discover_build_info = scmi_imx_discover_build_info,
+	.misc_silicon_info = scmi_imx_misc_silicon_info,
 };
 
 static int scmi_imx_misc_protocol_init(const struct scmi_protocol_handle *ph)
diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
index bb0c35b5d6705acddd6c83c31474482a2667b418..0e639dfb5d16e281e2ccf006a63694b316c431f4 100644
--- a/include/linux/scmi_imx_protocol.h
+++ b/include/linux/scmi_imx_protocol.h
@@ -55,6 +55,7 @@ struct scmi_imx_misc_ctrl_notify_report {
 #define MISC_MAX_BUILDDATE	16
 #define MISC_MAX_BUILDTIME	16
 #define MISC_MAX_CFGNAME	16
+#define MISC_MAX_SINAME		16
 
 struct scmi_imx_misc_system_info {
 	u32 buildnum;
@@ -63,6 +64,11 @@ struct scmi_imx_misc_system_info {
 	u8 time[MISC_MAX_BUILDTIME];
 	u32 msel;
 	u8 cfgname[MISC_MAX_CFGNAME];
+	/* silicon */
+	u32 deviceid;
+	u32 sirev;
+	u32 partnum;
+	u8 siname[MISC_MAX_SINAME];
 };
 
 struct scmi_imx_misc_proto_ops {
@@ -76,6 +82,8 @@ struct scmi_imx_misc_proto_ops {
 				    u32 ctrl_id, u32 evt_id, u32 flags);
 	int (*misc_discover_build_info)(const struct scmi_protocol_handle *ph,
 					struct scmi_imx_misc_system_info *info);
+	int (*misc_silicon_info)(const struct scmi_protocol_handle *ph,
+				 struct scmi_imx_misc_system_info *info);
 };
 
 /* See LMM_ATTRIBUTES in imx95.rst */

-- 
2.37.1

