Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013033.outbound.protection.outlook.com [40.107.162.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA95B4B5AE;
	Fri,  4 Jul 2025 03:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751598701; cv=fail; b=ShKgq9+xcaZnmljlrviADB8jsUd0GrMOezGFU39N+EfAuRqBfWRxppuKzyyh5MPl0hYGSlBymAVlwRUVC9xaObL3+jDHhy5mycNGt+v3ogTYAR4KJQ4xxMHet6oMXU4bZ/tKac0IzzwkW3BHK2KyCwNeDzLGsopp8eWo2TJQ3ss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751598701; c=relaxed/simple;
	bh=H+JypYIyR1E/kZpm2YOrxZj5NcJA7+9AiWQMo7yLVo8=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=AsTanXD0pEPZFFQegEbofKHaEokpxtODen2VZyD99Zcg8jB1hZE4fk4H1e9o0NpVBKArj72KV7ydZhYWQjIRaTHMGc1wgnT1rpxt1uqIw1PKBm8XksXzuIM2pxomd0gOtOnEHVdmK/I7l+fTP3YDca6xTkdpYEOMzPdK9rebMVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Pq1rTiTE; arc=fail smtp.client-ip=40.107.162.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Pq1rTiTE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aT4BMaHKN4yyV7As2pWd1rQwEMN6G9woCw4EP8DsIEMAfKS0UwJAOC4TGLST2oizTJT/ZS527Yv+Zx4I/svwEkstN45s0KsnSwJ1ZlUQQdtLusWPzyG5CBKnu/93j+d44p7f998IuIodxeE9BxQmcvO9CuppgixVGyxzD5wrfG0QD0h7GEuOv0aOUqiivxUnZ+WpywABb0CC1k7/bnGrSQn/4yJYDScwIV4nagW19pAeketrmIi8Rt1IB9azZx5aowUObSX7HsNKglpMAUOPz2ECRUvYZ0wRp/MFE4ln8rWaB5zx4Q6VSgtdsmcYSIpErljlyYjBZiQcHx9W19VZ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXyiaqjxB56LEghcTZUMx92C7JzCSAuNTWijcQw8ib0=;
 b=hGTFiDdHatZARzmC01bp8Ou+D0GuyorD6gsH7155msQyMUH8Uz6jmq/Y2sys1oGkwTEfv7OYJF/AHZarx19/gBt0XevXfCDGQUsOq3uqJ6IVz6H/FFdPbKb+6dNdCcDl/v4LiTvyb3bgPIwR1cn3PG1NaDVzDF1vU6I+DlUNZbe9AaNqREVLcliDMlJnS0oS4jYHNRNFUDUqDuPSpRu01iuMn2GT3pQKBmix/SbEE+jxU63b17yTuzknxT6znm/tq2YGvpif1PvWeu+AF+vHzBnkHVJlRpdC6IVYCzcTC6JAa1qxX6fgwi2ctu6NxvpQzcVQpqGU6vO6+KPhNFdqJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXyiaqjxB56LEghcTZUMx92C7JzCSAuNTWijcQw8ib0=;
 b=Pq1rTiTEwNZ8W6sgaAscC7CYJIJUh7zOJnWrhWNHW0VA7thkOcdTnxSUXR2xV34QJBaYtKtl3RjFmqWflDjDlub8OYWAEM6PX6fcXoJ07oyyNl9udHhbWtaG8O+4I4mnZwnEao23rlIO6yyvKdtMtSRJOI6dxahYRvmb4oRkSyVly0n3ussI3B4MsfpJrH2ZieIh3sBJIqGfQ2TOhUB+bMpabW1D0QI5enLraQy6FRHYrLR0C3dRjipoS/WZSVkhOetGXSuk60Xzz6uLZE+/roNXRhdf9NZVJA5cuKs0YDrf09sSxehEGWXRhldbkT0GGBDJn+FwDP9Jdrb17fEeJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AM9PR04MB7634.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 03:11:35 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%3]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 03:11:35 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 0/2] firmware: arm_scmi: add pm ops for
 scmi_power_control
Date: Fri, 04 Jul 2025 11:09:34 +0800
Message-Id: <20250704-scmi-pm-v2-0-9316cec2f9cc@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO5FZ2gC/2XMQQ7CIBCF4as0s3bMMKZUXXkP00WDYGcBNNCQm
 oa7i926/F9evh2yTWIz3Lsdki2SJYYWfOrAzFN4W5RXa2DinjQTZuMFF49Xp9VAg77xhaC9l2S
 dbIf0HFvPkteYPgdc1G/9N4pCQsOO2Ey2V8yPsC1nEz2MtdYvPQkbi5wAAAA=
X-Change-ID: 20250620-scmi-pm-8f6170769230
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>, 
 Chuck Cannon <chuck.cannon@nxp.com>, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751598594; l=1870;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=H+JypYIyR1E/kZpm2YOrxZj5NcJA7+9AiWQMo7yLVo8=;
 b=70jEtD3GDyXF1kY4htl5yxHyawIbSY5MW8wkmnzrqyKedXJsYLrkTnOi96cNj+u/xF78gMknI
 rrQiIgXZBxzBH3olD4GkhmeHJN7skoxQAPBFCpPm5WE8KbPkPXj5E4Z
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXPR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::21) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|AM9PR04MB7634:EE_
X-MS-Office365-Filtering-Correlation-Id: 388f6642-10fa-435d-c74f-08ddbaa87bfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RkpQbXFHeXZQc3pXVHZqMXRnaWw1dnhCaExoNUdTcVhRNVl2TlBWdjZ4UE92?=
 =?utf-8?B?UG1mVzNycTFyOTFSSzhJWTlPajdmV3BGcDREZXV6R0xqLzFBUUhuZ3hxRlNZ?=
 =?utf-8?B?ajZNSjBOR2xmU2E5bUpBdkFQK2ZaYlBzVi9pVXNIWitTZTlsZzlLQ01SQTgw?=
 =?utf-8?B?N09McDNKK0tocWU5MzQ1Z3BGTzNTSXp3QStURTVVdUhaVmVIb2FvUnptTlFM?=
 =?utf-8?B?RU4wemhBUy9GSzBJdmhpc1V0TWtOREFURVBVVnBJdHEwRGdUTnVoUDhwWXM0?=
 =?utf-8?B?ME44dEZoUFhud0EzRC9oMTUyazRaQ3o2S09PSjJIeUdHMkdrMGRvY2srMDVa?=
 =?utf-8?B?WFZlbnFqODlOaFA0YSs1Z3d2M0djZU5sVFpTQlFLb2NUWXlxaWNzd3lpNmhL?=
 =?utf-8?B?TlY4Zjg1cVBURksvSUFaWWdzamZIWGFnWWZmd1RGRjdRL3B6WVRLcnVRWlg4?=
 =?utf-8?B?Qitlbm1nQ0s1RVpLYkVFZnNaYzl5aUE0L0ZHTm1TVWpCU0hPMFI1OHRYWmpt?=
 =?utf-8?B?ZS9HUjVlYVd3ZDU4OHExd3Z3KzhTZlAva3YxM2RadzNoVWpxeHJGZmNGRmN0?=
 =?utf-8?B?emhTUUI1UFRDVzA2dEZsWmh4QmFSYy8zbGVYbXhuWFhCZncyZlp0ek54Z0V0?=
 =?utf-8?B?UGJEMU9FejB6TFNTZHkzWGRWQnRnY1luNlpHNEJYM0hmNUxSYkQ3U21rd3gr?=
 =?utf-8?B?SmFJalovaTk4T0xwdVJ5SDZtSTdCTTBMdEpySFYwTTU0aWU4ai9FTmxXaWNR?=
 =?utf-8?B?R3RhRXIvMy9zMCtIZnZFdFZETVNTVFVIQzdRU1ZwMEhveEo0ZE1QR2lHeUdn?=
 =?utf-8?B?dXgvQStqQUwxZ1RYcVYxcGNOcGdvajVDcXR0STlvYWtKaHRVV3N5aEkxYWI3?=
 =?utf-8?B?OEFDZGcwRmhRdnlwdnljYTZLQjJ6SHN1UTNKSzNmUUp1MzNQUCtpMDNDMHBR?=
 =?utf-8?B?MHZXT29UTVNGYUZyL2VsNEFiK1hSeXNZRHlUZGR3cnFSdytvN3ZnYTdWeFVO?=
 =?utf-8?B?RWt2QkhkNzRJNzNqYmxNUml1RnRoSW5qMnRPZ0dneWFTcGNYZ0ZDRitEQktF?=
 =?utf-8?B?SGNSc29pYlVvTDVwNDZJUjVTL2IyVDNEZE1rS29yR0RJSnFPU29MeUxJZVZP?=
 =?utf-8?B?WmVjVGxiODVSLzB6amcydFpKRDBaQmgzQWFsWmlMQzZNSFBHQzdBT2kxVFNL?=
 =?utf-8?B?WFNNYnRYS1FBUDlOdzU0bHVHenVacUk0WVRSR0dxTmM3NEtZZ1pDUUREdjla?=
 =?utf-8?B?ZncvRHYzaG9nNy82Mk9MUjkzOTU2dzBlTFV3ejZWbkVENEoyMEUvejV6ZHRT?=
 =?utf-8?B?bnpzckxwWlZzdmtsMEZNeGh5c2VTcHI0bGs5K1RaV2lGZG50cVA1TFZpMkZs?=
 =?utf-8?B?TUdEc21xUkFDaUE2RGdvVDhvWHpGS2J5MkduTnM2S2Y5b3hTQytEeGpBVXI2?=
 =?utf-8?B?R216QUhseCtFWHhCVjl5VDRZZHphRFZhUkh4czd2NmFiMWNkMjRkQUNlbkM5?=
 =?utf-8?B?aFFrbC9iZGRFb3E3YnNqU3ZGb0xLTHV6Y084OUVXUFozbDl6MjRRaWxoaExj?=
 =?utf-8?B?WHpmMDBKWkcvUGhFWmJqWVNVMGppSGl2NHRFaDN2cUZRYUpyaTJoWHBRSzRq?=
 =?utf-8?B?a0F1eEFidWJXZk50d0NKVXJmYkIwZzdIb0JaSnFZSVZrUTdwa1Mrd3hPWTRs?=
 =?utf-8?B?S2FPSVlFajlBcGRlUHg1TXRtVmU2VlFOWVhOcjFIcHJXdFpSbUFqaVJNY01U?=
 =?utf-8?B?cmFSNW9PZWQyK0J4N2o4eVZhQjE1cEVpVjR2bUNkdDlsQ1BkMExGRk9jcXI0?=
 =?utf-8?B?Zy9sTWwrZ3RLZjhiRCt4MldoYUFOOWNWeGNZMVRON3lJbXZMRm05VGE3MmJC?=
 =?utf-8?B?WlNTTitzNXV2R0RldTMvbGNQSmJtYkIwZE52Um9Ga3pNdmZMQzdlb2d3Rnly?=
 =?utf-8?B?aitHWWRzV3RmeFlKeGZwK3BxY3JBTjJCS0hEcHVabzFxUDdlVkV6V0JJWldx?=
 =?utf-8?Q?9NLSvaZzLJb11aB9CpCjGINizDjnF0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0YyRXJvSnZ2cFFjdng5MlpuZkdGc2JaVW40dEFlZnNTdTM1eFNYalVMQ1I4?=
 =?utf-8?B?QW9wZ3JuTm12am1Lamc5bEhNN0VjQnZISzQxcGt1RzRMVjgwaDRYSGcydmIx?=
 =?utf-8?B?Rlhwb3BuQlZvZjFjQU1MZnY5Q3NGVWR6L1U4QmpkNWt5Zkx1Q3FpYmFKWWVk?=
 =?utf-8?B?WldEVVY0aW11K00zVFJSS3lkV1JPSG9HUWF0YUhtV2NVOFlwb25DTGF6T25i?=
 =?utf-8?B?V0hXK2w1MXdQV3BKVzk0aWdNMnVJQlJybURsQk1iV0loWHdsRzhPYzFiMU16?=
 =?utf-8?B?VHNURFZjSWFUbTNja1p4b0ZsSE01bTVPM0NxeERabk1oUGtjd292V0d1ZVpV?=
 =?utf-8?B?UUV1Qi9BY3F2VWo0Qm15dmQySi9WenBqbFAveFNHWG9HTU95Z0RJM29nL3VX?=
 =?utf-8?B?Mm5BaTIwTkQvdEtvNnE3eVVFcXNEZERuVDhxY08yQlpUcEhmTldXQWFwNVhC?=
 =?utf-8?B?SjZMMFZ5RmYwU1h4dzllYVNvbGdUZndSYTl6SVhVNmFid0dsRlRlZEQ5NDVO?=
 =?utf-8?B?UDMwL0R5MmRuL21KRFhNNHg2WjNhV04wZHFRWG9ISy9Ka24yTXN1NmJ4MXgx?=
 =?utf-8?B?RWRNNmJtcW5NdjhJcm1abVlKaStYMEFrMHRuVlk5UkJnKzdHYi9oREJwTGU3?=
 =?utf-8?B?UHpFWktFOWRCU2QydGN5M2h0cXNCbUxQK2Jiazlma3lMM0RvMFVUL3FxRVJr?=
 =?utf-8?B?OUthb0l1VnBUSWViRWRlZTdLRlpUNHhSUGhpVnFMb1FwQ3JJOTVTYWtFbEIx?=
 =?utf-8?B?dDFBdmVzVnBzdWRZa1RtZlhKbUtjNno0NlJlNTZDVEZTNEE5N0tzS2J0ckJH?=
 =?utf-8?B?NUZTeDNKSFplRkxzVUdxT1hGSjB6NDlOUFVQNHF4R2ZkN1lUNHRBUE5TMTJh?=
 =?utf-8?B?ZlFaakx0a0RmNCt1dG11aThRMTUyeEZ2ajgvU3lrUDc4RjNOWS82dlM1VkFT?=
 =?utf-8?B?c2R4UDlWOHFlb2tJVHBtNUhGY0ZXVW9RMnkweTBPelZXalFISmtIaHFEN1VW?=
 =?utf-8?B?QzFhWDArTUROYTIvSmd6RFY5c1dxaHdPckozSG5SQ1ZzNUhZbmNTMWhVLzkz?=
 =?utf-8?B?ZlQ2MTVrM0MwQUpTNk0xU3hqd044eHBHR1JDbVZUeVVVRG9jNzZqK08zQVZq?=
 =?utf-8?B?SXVoTVZLWlUxWkZsMktDY3gzb0lhRFA3NWRlTWhJRUhEZCs4eW5tYzRDTnFI?=
 =?utf-8?B?WE1mV2l4ZkZ0SjdJKzRLUWkyNXRqK3QvMEZvajRhc3NiY3hCeW1uY21uZTRR?=
 =?utf-8?B?bmdtdGJ5Mm1LUUp3MmI0R0NrQUxzbHRUY3EzTHY2aElabHhhc011QlFpUFBu?=
 =?utf-8?B?OHhZckVLSUZ2UE9hSEpnZkJ4TFNzeHBYRXVhekRUK0haWTJIZGgwem1QTS80?=
 =?utf-8?B?V0JaRkloZVlhRE9zUTNqeGRvd0VsVDFUQ0F5S1JidkxvRVR1NHd5TlY3SVVi?=
 =?utf-8?B?b0RibW5UcTI2Wi9pZHllOWhqeGl3Z2o2dnlqMUU2VzRKYXVwc0JOWnFYUFox?=
 =?utf-8?B?b2lIaU1DK0pPS0JJYUM4TEh2Zzl6a3ZBdkp3cmkrd2dRaEdGWERHd3dmMVNO?=
 =?utf-8?B?bFZTYTc1d3RjcnpFM1U0SlVVYXRKb2lDMzZRSW4rRllHQVVlemplalpUKzln?=
 =?utf-8?B?UDdyL3BGZ3FqR0N4SUl3bFU1TFZqWkFocGpqbVBidExGOUM5NUcrMGdKYjZ0?=
 =?utf-8?B?bHBId2U1NUpHb3lnYzdsSGl0SEZCc2hadmlFV3QwZjY2SlFHSm5EUWxJSTA4?=
 =?utf-8?B?V3RrdllKTGcxcTdzV0NNM1QvMFYwdjUzTXVURVZ5Ky9OOUxtSm1PMytNVUtj?=
 =?utf-8?B?ZnZ5RnpzbmZhVVpmT1FQZDFZc1JEb0tENGJLZVN4dVU3cnNGU0p1ckFFZ0xU?=
 =?utf-8?B?OU9MVGovR3VjenNPRGUvcVhRejhaM2E1MitSczhRUktnWVVWVEk1Z1o0dmtH?=
 =?utf-8?B?RGJ3QVgvSWFMcEdoNGJHWmx6WFRXQVh4eVBPZzdkN1lOMnNxNkovTGVBeWMy?=
 =?utf-8?B?dU9vTzlxZDRBbGJGMG5CaUt2RFRTOXQvZ3Qxa3hwTGhwaGpQS2dpVEJ4ZXhy?=
 =?utf-8?B?aiszaDdSdDRSWjRQOWx5SXE4TVJzS1BITGxSWXVnTlRpa2NZUjlJcG12MjFG?=
 =?utf-8?Q?lRl6jOPLVrZtS7FxNtW/z1m4w?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 388f6642-10fa-435d-c74f-08ddbaa87bfd
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 03:11:35.5180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPSv02HGD8mtxV3ISumgwfZSxr17mRqDUIFEw9MepsIJzaTFsc6oO9bp8FauOr8CmOgP12VBuVQF5yAgOcNKBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7634

Move information could be found in patch 2 commit log, hope it is clear

When testing on i.MX95, two consecutive suspend message send to the Linux
agent, Linux will suspend(by the 1st suspend message) and wake up(by the
2nd suspend message).

The ARM SCMI spec does not allow for filtering of which messages an agent
wants to get on the system power protocol. To i.MX95, as we use mailbox
to receive message, and the mailbox supports wake up(interrupt is always
enabled), so linux will also get a repeated suspend message. This will
cause Linux to wake (and should then go back into suspend).

This patchset is to make the 2nd suspend message could suspend linux
again.

So why SCMI firmware couldn't block the 2nd suspend message from being
sent to Linux agent? Per checking with our SCMI firmware owner:
The SM(System Manager) does not know exactly when Linux is in suspend.
There are no handshakes that clearly tell the SM this. The flow should
be, if in suspend and you send a suspend (or graceful reset/power off)
it will wake and then do the request action

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Simplify code follow Dan's comments for patch 1
- Rewrite commit log for patch 2 to make it clear
- Rebased to next-20250703
- Link to v1: https://lore.kernel.org/r/20250620-scmi-pm-v1-0-c2f02cae5122@nxp.com

---
Peng Fan (2):
      firmware: arm_scmi: bus: Add pm ops
      firmware: arm_scmi: power_control: Set SCMI_SYSPOWER_IDLE in PM resume

 drivers/firmware/arm_scmi/bus.c                | 33 ++++++++++++++++++++++++++
 drivers/firmware/arm_scmi/scmi_power_control.c | 24 +++++++++++++++----
 2 files changed, 52 insertions(+), 5 deletions(-)
---
base-commit: 38e1f239ba67d7a34d6b5e300fd61cb6fdffc831
change-id: 20250620-scmi-pm-8f6170769230

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

