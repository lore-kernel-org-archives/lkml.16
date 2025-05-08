Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013065.outbound.protection.outlook.com [52.101.67.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E518C1E
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 06:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746684825; cv=fail; b=HmWMhdmFDjPNWhipKgQAwxkFT112WmKvbUpS8wViS38xDXxjIMSnyHQJQUk74c///hm3JukOFEqv4xmQRyGRi7TMNHp+NCfL2tTzopgH1Z7elzQLZSH9uUVloRnmVD8Osov7PgvsZ38yN5RkW4j2bPvKMeQgxhM38msJoY+J47k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746684825; c=relaxed/simple;
	bh=POavOK4TUTlhJhMQmBVYSgUEW4MJ3FgzxyIsTGtXvNk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=foCfTSGz9WWlL/SoC7G4+0t38AE7HZdfNTgfRzaSKoZoY8NzSRNxp2ra5MorFCZMCv9d6tcCpiqa7Y+yBsXI4a6GQ91dgyq37iqcnibGZQI9LnzgU38bg0+cTs25MtMAoXWylOrqUZeMMPfXpYvO/7kZgD0+zf4QBmO5FRR+6I8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=lqnFSh6b; arc=fail smtp.client-ip=52.101.67.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="lqnFSh6b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uBcdTiHNHLmxP6R0CJCjo/MnSvNMd+5enG/yEgbKx9gEeUYmMtfHN7H69k4tvOFUOakSb+qrgbLLVXJJwEEdldkPteU6un6mWRCXfyBO9KxFNdZRV+hWC4c4Dk5Y1uTYRznLWvJA0yDKVN/w1MZ+kTAnB2CgvzB2/vVFOppq10pzwsQWeXJIIpNaASbQb+EJm+Uiq/ib1Xdu6V1pUSFN+OYX5WAx9OeK2JkGfHDaGGbwoqMMqqv5dH6a67m4atLo5lDnXVqZvbDqEAuM2CQ9gPdVowcc9kbbYDN2tCouhpnU6dI5VW4uxocCpDGalX+xQI7CylKQ5takTnobyAPEcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lmSfdvIZf+lQy1ccTWGKgbZLSo1V4SG5keyoKT2FHs=;
 b=c50yGEOaf81w3jpIho7e+p+AxJrGr9+nksuRBJEhm+SB8qW6QR0XF3+mtfUzMBeG/8xJXypLJqc1Jr1XGWm5ToGjwJA1fPE2ta8HB4NHpzPMjqHHV+NZ/z3P29ydDSOY/p457glhvISJw9afLwS0DSL96fBpOOp3AN3tKpeAlGsE5gFXunFjgZkH3nCaIqDO0fRhibq0Wl0dXF05xawvOlB+OVL6AlI+mwTxm5ffUn6jWTsRgEByOP6Ttgdct32YZ2M2FHfuJk+itWBTrKgh0vM+sitEbdyVLTcb0Zmwq2/DwVCT9tzAJlQ2kyWRpONdB/JAteiAu3dD2V937r3tOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lmSfdvIZf+lQy1ccTWGKgbZLSo1V4SG5keyoKT2FHs=;
 b=lqnFSh6bqJOdtmlaGqHbkMbEV3rg1WUhUDiwgFKWqDk1urAXm+U52DaDQUGlznY4Rcg1B1HbnPg1OASGx4+F9t9Y21/XcYk+VPj3PNbMqJCbHU8yE/zqJLmraLT7tcVTXBnuWPyEiU0SDWj6XIN/9joFHSelzhSZtBjDum/kzap2hytg+0AKmQaPy/K3DrcrxLjMeIaRVdxE2RmeBhzukFcQTjO0dK0JEJ7GE8dxtE5PufdZ83sRIbapkrN1sE0Q/AG4nqBzP+L7Gz2VDAdQ+qa5UOGJQYOu9a8lPz2qyHzWL6/UdvaYHWn7XyT6IywtSNhaqACooEWf0sd2WRoVkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by VI1PR10MB3502.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.33; Thu, 8 May
 2025 06:13:41 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8fe1:7e71:cf4a:7408]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8fe1:7e71:cf4a:7408%5]) with mapi id 15.20.8699.026; Thu, 8 May 2025
 06:13:40 +0000
Message-ID: <ef402bac-3b41-4322-b5b2-224c874275e3@siemens.com>
Date: Thu, 8 May 2025 08:13:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 7/7] sched/fair: alternative way of accounting
 throttle time
To: Aaron Lu <ziqianlu@bytedance.com>,
 Florian Bezdeka <florian.bezdeka@siemens.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Valentin Schneider <vschneid@redhat.com>, Ben Segall
 <bsegall@google.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, Josh Don <joshdon@google.com>,
 Ingo Molnar <mingo@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Xi Wang <xii@google.com>,
 linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
 Chengming Zhou <chengming.zhou@linux.dev>,
 Chuyi Zhou <zhouchuyi@bytedance.com>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
 <20250409120746.635476-8-ziqianlu@bytedance.com>
 <099db50ce28f8b4bde37b051485de62a8f452cc2.camel@siemens.com>
 <20250507090923.GA194948@bytedance>
 <618bc3b199f19be916913301edb5ec832131e842.camel@siemens.com>
 <20250508024525.GA628019@bytedance>
From: Jan Kiszka <jan.kiszka@siemens.com>
Content-Language: en-US
Autocrypt: addr=jan.kiszka@siemens.com; keydata=
 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
In-Reply-To: <20250508024525.GA628019@bytedance>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::15) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|VI1PR10MB3502:EE_
X-MS-Office365-Filtering-Correlation-Id: fc4749d0-a374-4191-3865-08dd8df77a46
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGV2czRZVDdhc1dqb3ZYWDcxeUJVcVRGU2x0TWo0SnRPei9BSUJzbTB3aCtJ?=
 =?utf-8?B?U1RjZ290aGpWYWxJOXZ2NmZITVlSK1Y2cFA5RlpzdGpOOE5HY3NxZnVMNHVj?=
 =?utf-8?B?NTBzTXB5VitNYngrbW14ZVlYT3RCcUFzbE43YVh0T285VlNsWVJDSFA0N3lW?=
 =?utf-8?B?MGZ5aXI0WVFQUDdYRU1kbjh5NGhlTTVvN1JqZzA3S2xndU0rSGErU28xMHBE?=
 =?utf-8?B?ek9sMWdXdUNQMWdJTVV2SnhXeVlkOTFhcFh1TGFSbDN6VzhuelZhWm5TQm1B?=
 =?utf-8?B?VWpBUnpFZjBEQ0dpSDZzMk02bS9HS1RjNjlOMnl2VTF2c2trTzl2Yy80WDVt?=
 =?utf-8?B?RitMVi9GaG1neDZyelJTTTRMWFlGVmdNNnBoSXIzaUxQZVZ4aU85MTBpU2dt?=
 =?utf-8?B?akVaQjUwdDgyZjdRcXdub2d2RTFNWEl3SDdNR29oMjg2bVRoREwvU01NQmpL?=
 =?utf-8?B?VURGZFpjUW5zU09GVUZIcTY0elhFcm1HS2NMNkxuRGRIOEJmbmI5b2psNW01?=
 =?utf-8?B?d3M4ZkJzWkF6NUhFMTM2Yzk5YlByQllJZW5JaFJIVjhHV3c3M0tHeWRnbi9x?=
 =?utf-8?B?Q1FNTktUdk9aSGxUZE0vNnVueHVYUEg5eG9yRHpxVzhrS3g3WXFqYWcrSVhk?=
 =?utf-8?B?bDF6WE5haE9vVitIQm1XdUpRUG8xd25MczdzOUQzUHdLelRCYWIzQXNKV3VH?=
 =?utf-8?B?aHM2dGdoMHovdGgvU2VyeGdnYXhEVnF5ZXVzY3ZJaTRXcXBqcXY1Yk5qY1o3?=
 =?utf-8?B?OUxlQU4rVkIvNlNuMERzV2hNSW1yRXk0Tk5mQ3REM1cvN3AvQ3krQ05yWFdm?=
 =?utf-8?B?ZTE1NWdsL1VzblRKZ2NjZjdoN012TDdlOWN5RkpGMDhLMytNbitXaG83RkJh?=
 =?utf-8?B?SDAzWitTaDhnMGZwL25vY1BYSE9FREoyRnhvamZQNmprWUtMRDdpUTBaWkJ2?=
 =?utf-8?B?ZEJnQU41QjRodEFLUDhZZVdBU2N1UlRnODVReTQ1M2pncCtzd3BqRUs0cWJS?=
 =?utf-8?B?c1lJNGpqeERUa0t1V0JtZkdsRUVZZTZrWEl6SmFSVHRRak5tMThuLzRXN1k3?=
 =?utf-8?B?T1I5Ujd6MEZERVJNd2lORlgrOEdiSy83UFdVQWZTUFVWTFlxM1VyT1NsVWJs?=
 =?utf-8?B?QXN0a0pCdzN4T3FneUtrY2RqQmZzSVFydVZCRzM4dDlXY0NWRlljeW9pWUg0?=
 =?utf-8?B?KzZMbzRUYndKUyszMFloWFZzYVN4WFltclZsS05iaDI2UlUvb3FjUXNCNXBC?=
 =?utf-8?B?c1JkOEZzZnJTcjJWbmEyb2d0SkRKWXNUaFBYajFBS2NvUUVxTFVCcUhWV3hw?=
 =?utf-8?B?emlrTWpleHMxQnZFaTJYVXhDYTllRUphQWlta0Q5dFdUMHBvazdCeWZXZkcr?=
 =?utf-8?B?YUZ5NjJDVmYwKzFVM0ZsUGtVaVNPMGtWZ0tqTDRDV3dFRFhBOWJYSE1KOG52?=
 =?utf-8?B?ZFIxZGduNjZzbjJjc3ZCdkNLb0tlY1BXSGRQTWRDTGhoOEhpTytIK1BNSjJx?=
 =?utf-8?B?UW9yd21FNlhPSnlwSU5OT0J4ZFdXa3NncEhqaFRKSUY2ZDFYeXZZNTRrQVFs?=
 =?utf-8?B?eURNRVFackhaRks5NzNLZjdQSHJUalh6RWZIaE5XQnNHL3ZqSDZlbHU3WE0v?=
 =?utf-8?B?aXErK2ZkL1Z2Y3oyREY4b1JuQk5NOXZTTk1qbTRmNXJxNFZkOVd0dG5wVWVs?=
 =?utf-8?B?eEYwVjZUWjVzLzlJSnFlY2oyWmtSRmFXUDJMN0QwbTJBQlR6cDVXdG9pQVJS?=
 =?utf-8?B?dFFibEY1ako1d3FUNHVkMmRHSkYwLzBIUEM3WWdjYWxXMGxJRXZGSEk1amRR?=
 =?utf-8?B?dG1kVmJpK0ZkWWxjZVkraElEcG9kaG05ZFlTaFFwcUFUeXUyOVNpK003Z01z?=
 =?utf-8?B?eWhSczJ1TkJIa2hJcDlUU211ZkE5Q1o5Ynl1VVVjaWllV1pnNnRnOXZLSDBW?=
 =?utf-8?Q?LjrtRVNec1E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVIxZXFMalJ2MWFDUC94bEFqOFZaMjNmeE5sVTVCcktGUmp6WGFtb1duaTc3?=
 =?utf-8?B?c2VSVlE0UUZJcU1rM3MrODRWYURPMTlKRUJWbVFwdjZBK0JFK3BMa0QwaU5H?=
 =?utf-8?B?N0wyZTB5VnhJV0RQQi8ydG14NzRDb21oaVVoSzhOeDE0YklFYUVnMEsyaVR2?=
 =?utf-8?B?RzF6LzJVZHd3ODVpcWJxNWpTMU5ScktHY05SNHNkM3A2WnJ5UTBCQjQyYndY?=
 =?utf-8?B?RE1BL0UrQW1zdVppV1Jpb2tlN3RMaFlLMWE2RzFhTXY5ci9RTERrc012Y205?=
 =?utf-8?B?c05tSiszUVhCQTlrNVI5ejJFMUZYdU81SEFoU0FYQUNsZzI5VUJraVhlT2Vs?=
 =?utf-8?B?MlRLV3hXOHFjeUI4dFVrbzR2VDFYRHZGVmRhTEpPb1JMMTFmN1M5ZUpSb2ls?=
 =?utf-8?B?QTJRNmZDWVBFMnlHbU90S3FHTklaVjltdG8rNWNJNXJ3RDkySW1QTGNHbGYw?=
 =?utf-8?B?WThjV1AreEdWQWsrRENWbytLNlZMclQ3SW5EOHQ2c0k5ZFduYnJhWVFReWk1?=
 =?utf-8?B?dTNzMlJhT2VIbEVLR2J4NEoxTlJCdFdFTTJFdjVpcGM4UlBPOUtiWnpIenBS?=
 =?utf-8?B?L01nZkNjdGdyY2haR0h6OURtZS9Sbm5zdVNsUXJEaldZc1BOWVRJYmFVOUNR?=
 =?utf-8?B?d0dEMnFtbXdCOTVONHdFSW54cjRQMkdUa1UyRzgvVFkycVdwenp6bTBDL2Ru?=
 =?utf-8?B?WEtGUDI3UDJVcVhFZmRBa0dxeEYzR1RwUGs3MHQyQnM5MkNvUTlZN0tjM1Ro?=
 =?utf-8?B?QmdtL056OGJCSVgzaGhqTmRlYjVMY09EOGdmR3lNSktmZTVFZHhpMzZPM1BN?=
 =?utf-8?B?d1dpMGVYRExVdHlBVTRnWHErbk5DbHNLMUxRdUZ4S2FYdVVmd3ZKV1AyWjRO?=
 =?utf-8?B?d2xvNXNiTXFjd3dHaGY5UjJlY3QrVk1MMHlTUjJRWWE5dU5oalo5T25oNERF?=
 =?utf-8?B?RGYzT3JKWm15Znh3cVJKTjliR2pQYXlURlpNYWROQUZ4aVVSL3BVcmZFUzZF?=
 =?utf-8?B?LzVaU1lNemdKWEdCdHZOZXRTRmUycjhSdmd6aUlIZERRMEovcC9yNXczTjQw?=
 =?utf-8?B?YlladklzNzZFUzR5aUN6SDFraVdHRW9wTWUyNFBuL3hiaUsrZWtkejN3ZGps?=
 =?utf-8?B?WG52a2JISGdVTVRneXlSSk1mUFpybjQ4NmVrTWV2L1k3S2VMNDUweUo5Yjh0?=
 =?utf-8?B?S0NsUjQvT0VXSTlmMk93Qlg2M0dROFlUd1RNZE1sRWFQRTdwVVJ3MDZPWkNi?=
 =?utf-8?B?cFdHTFlvQkRhQzZwMEQ3VFkrUmlsR3pObkJ1U2IxOEg0MFlJWGN3cE05b0M4?=
 =?utf-8?B?V282SCtWbVdHQmZ2b0JjS2ZwekcxaTlWK0l5UnovMTM4V2pQR0pnTnR0cXJH?=
 =?utf-8?B?SFg5dzFnR3VteGxOSHI4TDVtdkdUSGdiWDBOL1ZkYkxGOWRWMStiQ3RlV2V1?=
 =?utf-8?B?dnN1M0M2TURsQVl1cUJQNTBhcHlLbTFjaS9FeVZMOGNxU2FPeXVyMVYrNFlp?=
 =?utf-8?B?Rmh4djZKWFV2OVV2ZFlWd1FuZC9IK1BTNE9xakNrbzI0b0J5UitYWjBOMjB4?=
 =?utf-8?B?WGhvYSt4ek9YOWdsV2FCcFEzMUdqelh5RUovcEc1YVhpNjc0VG1FU01memYx?=
 =?utf-8?B?aUJBelV2RHdPWlVvTWZWbDJzTklRS1BTRTJtRVZWM1lMZUtINENTYnJyVS9C?=
 =?utf-8?B?WVdrajdsV3NIY3JscXR0a2oxRkh5SWtKUGdWSVlwK2JYemRraTdHN1paSGlL?=
 =?utf-8?B?SnpqcHpxUVhjQldaRnV3QUt3YndLUGFhYlBCRE5Lck8wNmN6eUhJNGNsa090?=
 =?utf-8?B?Mk82eFJQbEY4T0U2d0V6MkFmL1V5aVhVLzA0VzgwOEVLMzZBdDBYSU9xK0tC?=
 =?utf-8?B?cDk0bnVrQXF1WWhKZ0FDQStjUjV4RFRJTEMxZ0dZenR4NHQwNmJncmx6aHkr?=
 =?utf-8?B?ME00UjVBRTFvU0s3a1hkSlpMd2hXenREQmlzSDNUelBFWkJxY2dldTdZcFZO?=
 =?utf-8?B?UzhCSmlSbFpXeUdyZjkzbG1ORzdrWnFKdTZRaG1HK3BSZnNTSm5VZXdRZHBV?=
 =?utf-8?B?YW1NWUN2Z3N3eDlFa252MFdiOEp0ZUtaRjRSb1o3QjVVSENCMlptV3ozQko3?=
 =?utf-8?Q?deq9vS+F7yvmIeqR/JF1f2NBA?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc4749d0-a374-4191-3865-08dd8df77a46
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 06:13:40.6067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z6+Gnnl+5PPpuBP/RoIeCvh9fBAqmJrDo8ris9NMG6ZM6VUl1M3qs+yp18MKuEKjn4tabCmce+xBk996ZQdwHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3502

On 08.05.25 04:45, Aaron Lu wrote:
> On Wed, May 07, 2025 at 11:33:42AM +0200, Florian Bezdeka wrote:
>> To sum up: This series fixes (or seems to fix, let's wait for one more
>> week to be sure) a critical RT issue. Is there a chance that once we
>> made it into mainline that we see (official) backports? 6.12 or 6.1
>> would be nice.
> 
> I don't think there will be official backports if this series entered
> mainline because stable kernels only take fixes while this series changed
> throttle behavior dramatically. Of course, this is just my personal
> view, and the maintainer will make the final decision.

With 6.12 carrying RT in-tree and this patches serious fixing a hard
lock-up of that configuration, a backport to 6.12-stable would be
required IMHO. Backports beyond that should be a topic for the
(separate) rt-stable trees.

Jan

-- 
Siemens AG, Foundational Technologies
Linux Expert Center
