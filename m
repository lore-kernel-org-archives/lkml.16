Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2077.outbound.protection.outlook.com [40.107.21.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C1622FF33
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 05:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744695000; cv=fail; b=KTk+l0LE80uVnLrx/4exOTlsCG9DoTAVTNaPdc949wYccopdhUmk7bOuACYSqidzbvJlqdf36kNlc8apBIb5mHy/18p52C2qciSNokbtyczCu7DBmwq2zTje1+djTLTXFSMsgYQHzXQwnzGMw6GrpjLFLia42dHE2loysSh0G7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744695000; c=relaxed/simple;
	bh=GBog4TlZIobLAHFjpv5w9lsCQ6Tq2yETRBnxijUZdko=;
	h=Content-Type:Message-ID:Date:Subject:To:Cc:References:From:
	 In-Reply-To:MIME-Version; b=cIqihQwogXNump7zqNzBvmlXwBQYqxAwSWI1b9JSaUvNjcW3c/w7PUvfCXwgmFe9VE9Xy9YMqMlz5GUvavC5Y+iyNHpg3OC+9r1EftytZPAUBEcRKnf1RUFqKcUNYy3Fud8i6ZQMr92h+TBtnl0dYttFkwJpwgbsbwaeu/Y6SRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=RBK/kV24; arc=fail smtp.client-ip=40.107.21.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="RBK/kV24"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBhQUTSySkH/vePZ0Fd/rI/Gsl/2d8OSDkr3m75lIIJ6pgVHgdQqIYA8JT18o37OPvsJJ6cfKqA94o22jvBTeIjJFF5NSJlGyseLXJfVGZYyMUnp8nfMJ/q1nbwohACCmw31XvfKiwGlei6uPDUt70nw0gqZZe0ftfe0kuD6KoMyuiTM4No/ZNkjVfXsBRNmIbINi6ynyr04Ihwib3gMj+E/gkXwV6ZKi4ABes8bykPHJ8CgpKXQ9+u3hZd7oRHM1HtOqMlT0CyLHSKSLNolnAHsROpvT3hpayrLIMYEcyj0vNiqozK3lyTKOxj1dpCKkBg9SGGwmLWk1hMCicyLVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcjj0cioS8QRzKE+Ib9P8t82AYZW7ttpRrMmYatqGKE=;
 b=v3C7fW4z7Qj9Sn00az6QckE6g0SWGco1G+3xCnqWbXC6mldcL6ZodZRgbfBlv5dM1bKzV0gYuaWPrs0gM8i//u5QnNNst1+2IlJ7uu2nSyO509LDIJAOAfnDkJtrZuZgxCUoy7C73hyhajagqNJC8MB4ew7K37cq0h25PUcvUwvj9QgMptWRPr5YuXT53E+jdu6DS+URtcROEjyB3gD9B1s1fa9WNOBhU7S5yMs8BRe51NcjV668qLZIYMr1ZchLVYg/dl4V1NLLLLfMkZn4wcpG5MRdSVmFrqd/2LiAWNEl71nuVVULCL3/gYGy43ZQL/KxkKyN+HzTdVUznwnh6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcjj0cioS8QRzKE+Ib9P8t82AYZW7ttpRrMmYatqGKE=;
 b=RBK/kV24X2yMnocNmw995Al24Anqd7f2Qjx3lLc9dQYKJeYWWmVw0Zkk6grBzNYp+F/tIb3T7ydLxsA7OFqId1t2pblxK9RQ/vDqRdO5DdXMvMIozdDXjR7wk7nAJC/ZDxrPiegp08AA6KGuVawzPv97g9rX+Rq/i+MwA0v4Uy/UgQEJcNXePIX04Ws0UlZqkh1xy3Isfwk0TqZDmxB9GoLNVvJs9AZKPf39uZR6+eWlF5nm2KpyEcFo5eL/MGNzhGcWJfYURiJiFQhZYbeH9ew6LLYMA4udGPlAI3KmZw844T4NALFC6G2Ig0ox4Lc4pcByRCzsw6/P5u4bWjXdiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by VE1PR10MB3808.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:160::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.30; Tue, 15 Apr
 2025 05:29:54 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8fe1:7e71:cf4a:7408]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8fe1:7e71:cf4a:7408%4]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 05:29:54 +0000
Content-Type: multipart/mixed; boundary="------------spaum1ezOJKKG0dS1AYXqxtP"
Message-ID: <7483d3ae-5846-4067-b9f7-390a614ba408@siemens.com>
Date: Tue, 15 Apr 2025 07:29:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/7] Defer throttle when task exits to user
To: Aaron Lu <ziqianlu@bytedance.com>,
 Florian Bezdeka <florian.bezdeka@siemens.com>
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
 <cee5bca4e2b024d3406b40b84c0d5db91c7d276f.camel@siemens.com>
 <20250414120407.GC3558904@bytedance>
From: Jan Kiszka <jan.kiszka@siemens.com>
Content-Language: en-US
Autocrypt: addr=jan.kiszka@siemens.com; keydata=
 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
In-Reply-To: <20250414120407.GC3558904@bytedance>
X-ClientProxiedBy: FR4P281CA0367.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::11) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|VE1PR10MB3808:EE_
X-MS-Office365-Filtering-Correlation-Id: e70f1525-de1d-479e-292b-08dd7bde8d92
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|4053099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3FhM3N1WmFzNzlCVVZkVHZJY3NZTmdYMnNXdWxtUWMwUnRMeWMyVDZScXd5?=
 =?utf-8?B?UkZNVVdxZkswZXQzcHBLVlFrRVlYaHhVRzd6bE1nRnpjYWwrMm03SVJqbnJZ?=
 =?utf-8?B?Yi9ha0NGWlVPVmtPU2c5QWhrNDlBekxHNm9KMlkxREY1K3FnNHJLOGFIc29M?=
 =?utf-8?B?cng5cmFFOUZsemk1WUVraUV3SEp0M3RIT0dYVFZkRm1KMW9ERXNTbUs5QkZ1?=
 =?utf-8?B?cTZXMW9WSVhLdzltNjhwUGlhZUMzVUdidFBYQ2cxL3RtMVB1ZkYyQmdDcGZF?=
 =?utf-8?B?d0VGbExUREZydWlmNWsxVzRZRXBtN09aNXFIUUNoN0l6Y2xzcHNBSjMvSTJ1?=
 =?utf-8?B?WDU3eHlZWTgvV3hVb3VDZk9ZOUxMb0JLOVBVQnErNXhXUDhIYzdNUTlvRnNN?=
 =?utf-8?B?VmVvaUwrdFNGalduTmg3ajlYUThESEIvWlBwRURtUXpFVUR1OUdIckpGYlo4?=
 =?utf-8?B?NjJDWVlCa09WTFNFUUpRd3lnRFZLRWtlYmdSb2puYWFpS0xObVN3Mmk1VW5v?=
 =?utf-8?B?MThXOVVNa1gvV25IZktFbHNPbGFJdjNXbTFNNTJKazljN0FUSEhSeVhGbHpn?=
 =?utf-8?B?WkNWZXQwZ25lNFp5aUV3ZkxLZkJQcU5lVmpHcVNxMm9jVHUwS3duNm5kTmJx?=
 =?utf-8?B?WGNmcTZEbWdvQUY4U0V1UldyQ3hOU0ZjbWFkWVhDNGE0U3oySkREdy9PZjFq?=
 =?utf-8?B?V0V2bFJVT3J0TW9EblUzTTZGeUMzVnRCQnRwdTFFam56RU9yNlZQZ2crQjFW?=
 =?utf-8?B?VVFad3AwSXlnc1c0M0J5MFdUZTNUeG1QbTUyZTRNWnR2d0VNc3FpSFc4ZkNk?=
 =?utf-8?B?bGovWkIvZFBHQlZ1TURJbll0ckxWN3U3SUJXbEx3UkF4UlJWNVdPRmwvZkpv?=
 =?utf-8?B?a2FIVFdNV29oTGxCVkc5VzZjYkluTWg0NzBhdmQwMkxkWlBDWUtlbXVqQTJP?=
 =?utf-8?B?M09wNlUydGRuU0Z4SDVQQUxlbWJwWElZMVVSeEZZV1pMUW9SRUNkOWtFbzFt?=
 =?utf-8?B?bHRLQmlaTHBhTS94MHZXUjVtd25adnJRYXhxcUdyY1p2cFMzbmV5N1N1YUUx?=
 =?utf-8?B?NDQ5RVhtL1Q3VWNkdjduVCt4dEJUZWtiN2EvazZuTnNzUW1uelRncW1EaWpM?=
 =?utf-8?B?a21aOE40ZGlqaWJPWDdQUVFBdlF4NGRlbnpMbVRTdXlyQnFSUW9LcXM1Z0s4?=
 =?utf-8?B?VlZMdmhHK1VDcTk0T2ZMUzRKUTA2SlNKMTNLbG13SFVIb0M4UzdqNGpwM2xP?=
 =?utf-8?B?Q2ViemxpTHlwTmFLS29PeGR5Y1VQRmZWakFsdXI3K05wWW04Qmp1NHZWN3BO?=
 =?utf-8?B?UzBVTkJweVJ5TkZNVWJaanJsanR3aXNqUEs2ZDdtNVN4dFVaTG9Hc3FjUnJR?=
 =?utf-8?B?TnpJcHNiWkpwdlEwdTRRMWRrRlQwS3hRUncwbW5CekVFWGdOYXlSdVYrNFVt?=
 =?utf-8?B?QSsxQmxvWFlxcm5KTjRGWGp4UU5MYk9qN0p2NmUya1RTQnFmd0VsdmJWb0hZ?=
 =?utf-8?B?a3ZxTk9udTVrV0dYcmtWN0tJaEh1VG1ZaEhJeGNYQllIS3RwUXN6NnAzMVVW?=
 =?utf-8?B?MWJRcGFNZEEwZW0rbTBTNkVwS3puOGZ0eU5mOU1JdzByR08yU2pSUkZ2emtY?=
 =?utf-8?B?TWlpaWNQUWJ2cm44dDY5RDYyVXR2d3h6c1FhVnVrR25LUUZ2akQ1M213Z3lq?=
 =?utf-8?B?bG5FbGZPMHNOUkNNNkV5d2VCM3JOZ2srYVdlaE9YT2NFRUs0TklITmpZSWFa?=
 =?utf-8?B?TXFWWXhTZXNOaGg5dUc3Ky9Md3ZCVlRoZkNPSlBvZmNaYmlYMzh3VTJzR3Y4?=
 =?utf-8?B?Q2c3eEF1NThwOXk5N0ZNcFhHZndFdUoxYWhtekphRDBkLzRuVlpkKzBIUk1t?=
 =?utf-8?B?OGRxdUd3NEk1N3RDRTN2Z1BXamM0MmgrVElINkx4YWFmcklxamJDTVd5Q09r?=
 =?utf-8?Q?D4z6jIGNpFU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3hjaklXVURib1l5THBKRjlzVDM3SFRBVEdrK0RHZHpSUHJRQlNwaHo4amow?=
 =?utf-8?B?ZWV6WXBkR3JHV0pTc3FXTTB1K2VXYVBLemNHUndNQ0p3T0JvbXdvaEQxY0J1?=
 =?utf-8?B?cWlCQ3lIL3J1R0pXczVhSnN6bERDVlRmQ094cFZ3QzIzMkVXbzAvTFhUallO?=
 =?utf-8?B?dkpyWGpCaTFldzJ3QkFjWk1jeHFsbEMwMnNGWndNKytzK1NpcTBGdmw0Q0pi?=
 =?utf-8?B?VDVaMmxZQnhlemhTRURuZzhtODYyNXF3T0oxRVpRNlhpMWhFOHU4d2V6Y3Ir?=
 =?utf-8?B?blFtNlg0dFJiSzJGZ3VBdkovVDBTVFU0WVVpZUw4RkdzNnR4aWN1QVZaUXpN?=
 =?utf-8?B?ZnNDSDdDRkx6RzA3bHZYRFM1Nmw5RHpFTnYwR2ZjZVZiMTVaYWkzWmE1QnM5?=
 =?utf-8?B?bll1Mk9nVzFiVlVIcEJlanNDWTBOWEhRQURDZFVzaDc5QmVVRnhhSG15YU1D?=
 =?utf-8?B?U1pqTWs3R3NJRnRGRzN6eFhPcjJpRllyUTF6M0dqSE5TVlZDNVI5M08yalN2?=
 =?utf-8?B?SmJnM2dOUitxQ2tDNW5oSC83eS9ianh2WWttK0EwUkRFRGF5dmtaVk9pVnlL?=
 =?utf-8?B?Z2hza3pLQjd4WjBOOXR2c2RGcTJYNHAwQmtyUDFkb3pvQjlHMXJDaGhCSUwv?=
 =?utf-8?B?WW5DTzNiK2laNHdCcEI3QWhUczNvZlk5MUdoTzhNcnM5djhwV1ZIeE5LYm5F?=
 =?utf-8?B?QktpSVlaYmxUbmZDVk9WVEhJY1QzSkx4OEI5Z2lsczhiQVJ0MkdEZitUOFZG?=
 =?utf-8?B?YkNyNktRVW1sUDdVWHBmbGx0YXdLRkhGYllGU1lHNlhGajhuUnFLVGpYVkZp?=
 =?utf-8?B?VWMzL2FSYTdKWlFrZ1pPQVNRRW0yRmVveVhoeVNUTzlKTXc2Z05JN1ZMbUhk?=
 =?utf-8?B?NW5wZHVkT1JwM0JGZ2hraU94UlBMU3pBbnVpRkJRaWQ4WE9YSm1JeE42SE9u?=
 =?utf-8?B?Yy8wdEhOOWVwMHJRUmp3bW5GekduQlRlejZwQk51VUQwRjhZVlcrT1RleDlx?=
 =?utf-8?B?VDd1SjFWWWF0bFNuTjNIUE5TYnhFcFRVOEdiTmZTbkhwdFJIZ21WRWkwci9v?=
 =?utf-8?B?Wmc2NFVzZm9DTlljM2F1bzZaRjh2dDhjUEdCUkEvWGpyUG5GWU9QUlBoc0ZD?=
 =?utf-8?B?ejRPa0w1Wk1mUlhpcGJWcm5jSDRjTzE5MTM1Mm01UVl5M3NOODYrU1hlZklQ?=
 =?utf-8?B?dlYza2dHdHI5UU9VWDJQRHJpblNpNGFVeldva05SY1RTQzQwSWpkZ2tGakJI?=
 =?utf-8?B?NURqQmh0cVROcUlSbVVLck5zS3NsQjNBd3VPR2N5UXdCcnBRalNPbWVWZHVR?=
 =?utf-8?B?QzlLWnczM2E2Y0pxc2dvZTJ1cXE1VXlTeHV5TE1uYjdhcWJUTm4wS1pLSXAv?=
 =?utf-8?B?VXJpZHkyYkM3cnhoUUYvQkp3VjZIRmZGdFkxSGhBVU9OK3FvdFBIZU9uK0Z1?=
 =?utf-8?B?UzdXZlJ4ZUdpNE9xSHVDV1pLWTRSM1UzR0EzTUdqTGhmSzkyR0RPOGg2Wjhh?=
 =?utf-8?B?QmVnUUt6RitPdEc2RndTTlo5NSswZGxSLzN6NzhTOThTSk5TNTlmZ0lzVVZJ?=
 =?utf-8?B?WTZJOHZWK3U3UGFaQUVXV3lXMGhReDVHb0hFOFNjUTFSN2ZEZjI2WHFzQ0U0?=
 =?utf-8?B?dFRxd2ZybUhaWFhQMFdGWXI1eStGWUxzeUlVVHUxOVU4aUJQYkZBcXpEVzc1?=
 =?utf-8?B?TThDMXhOc2lQMExxVGF5ZVp4ZWN5bzFMdEpaSDBQcWRPbWtlUGd3WEJmOHNU?=
 =?utf-8?B?YjhqNGliazNoVzZ0NGZ6N0hsSE5nZFhtdWhJaWdKdWhMWlRrUVJiM2cwQzJP?=
 =?utf-8?B?aFpZSGdITVBlQWV4M3BUWHA1Qm1IRHBvVkFJc3Y3TUdRT1NQcUx0ZXpwem5q?=
 =?utf-8?B?MEdNMHhQdWlKMjZkeUVBUGhNeFE5d0dsU1hYU2VKQUFqelBvOGYvblo5UnpZ?=
 =?utf-8?B?RVdnYmNudEd6UlB3NEJDR2UzODR1RUI0N3JObjJ6TU5iVXhMVTZ2OWgrTCtI?=
 =?utf-8?B?UUphREpTbG0rTERmZnNFZ0xNbk9KWjl1em9Jb0w4amdjUGRFUUFaOUNMcWRY?=
 =?utf-8?B?OWx5cnd1Y3hlb1hHQWd5dUZ3Rml0bStvZExFSHBVZENjcWJRZU1yRlNkelZa?=
 =?utf-8?Q?WGfSp3gLlzLZJ/9v93GLYgsER?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e70f1525-de1d-479e-292b-08dd7bde8d92
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 05:29:54.6537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1PWmfxs+HXiwkZ0cTS9Trab0MUIhnKsBq/DfwvLk5x21mZ+U/tQucFDD9rxVmwrtU2lfJtGsU2NP90iXsGNB5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3808

--------------spaum1ezOJKKG0dS1AYXqxtP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.04.25 14:04, Aaron Lu wrote:
> Hi Florian,
> 
> On Mon, Apr 14, 2025 at 10:54:48AM +0200, Florian Bezdeka wrote:
>> Hi Aaron, Hi Valentin,
>>
>> On Wed, 2025-04-09 at 20:07 +0800, Aaron Lu wrote:
>>> This is a continuous work based on Valentin Schneider's posting here:
>>> Subject: [RFC PATCH v3 00/10] sched/fair: Defer CFS throttle to user entry
>>> https://lore.kernel.org/lkml/20240711130004.2157737-1-vschneid@redhat.com/
>>>
>>> Valentin has described the problem very well in the above link. We also
>>> have task hung problem from time to time in our environment due to cfs quota.
>>> It is mostly visible with rwsem: when a reader is throttled, writer comes in
>>> and has to wait, the writer also makes all subsequent readers wait,
>>> causing problems of priority inversion or even whole system hung.
>>
>> for testing purposes I backported this series to 6.14. We're currently
>> hunting for a sporadic bug with PREEMPT_RT enabled. We see RCU stalls
>> and complete system freezes after a couple of days with some container
>> workload deployed. See [1]. 
> 
> I tried to make a setup last week to reproduce the RT/cfs throttle
> deadlock issue Valentin described but haven't succeeded yet...
> 

Attached the bits with which we succeeded, sometimes. Setup: Debian 12,
RT kernel, 2-4 cores VM, 1-5 instances of the test, 2 min - 2 h
patience. As we have to succeed with at least 3 race conditions in a
row, that is still not bad... But maybe someone has an idea how to
increase probabilities further.

Jan

-- 
Siemens AG, Foundational Technologies
Linux Expert Center
--------------spaum1ezOJKKG0dS1AYXqxtP
Content-Type: text/x-csrc; charset=UTF-8; name="epoll-stall.c"
Content-Disposition: attachment; filename="epoll-stall.c"
Content-Transfer-Encoding: base64

I2luY2x1ZGUgPGFzc2VydC5oPgojaW5jbHVkZSA8ZmNudGwuaD4KI2luY2x1ZGUgPHN0ZGlvLmg+
CiNpbmNsdWRlIDx1bmlzdGQuaD4KI2luY2x1ZGUgPHN5cy9lcG9sbC5oPgojaW5jbHVkZSA8c3lz
L3RpbWVyZmQuaD4KCmludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCnsKCWludCBwaXBl
LCB0aW1lcmZkLCBlcG9sbDsKCXN0cnVjdCBlcG9sbF9ldmVudCBldlsyXTsKCXN0cnVjdCBpdGlt
ZXJzcGVjIGl0OwoJaW50IHJldDsKCglhc3NlcnQoYXJnYyA9PSAyKTsKCXBpcGUgPSBvcGVuKGFy
Z3ZbMV0sIE9fUkRPTkxZKTsKCWFzc2VydChwaXBlID49IDApOwoKCXRpbWVyZmQgPSB0aW1lcmZk
X2NyZWF0ZShDTE9DS19NT05PVE9OSUMsIDApOwoJYXNzZXJ0KHRpbWVyZmQgPj0gMCk7CglpdC5p
dF92YWx1ZS50dl9zZWMgPSAwOwoJaXQuaXRfdmFsdWUudHZfbnNlYyA9IDE7CglpdC5pdF9pbnRl
cnZhbC50dl9zZWMgPSAwOwoJaXQuaXRfaW50ZXJ2YWwudHZfbnNlYyA9IDUwMDAwOwoJcmV0ID0g
dGltZXJmZF9zZXR0aW1lKHRpbWVyZmQsIDAsICZpdCwgTlVMTCk7Cglhc3NlcnQocmV0ID09IDAp
OwoKCWVwb2xsID0gZXBvbGxfY3JlYXRlMSgwKTsKCWFzc2VydChlcG9sbCA+PSAwKTsKCglldlsw
XS5ldmVudHMgPSBFUE9MTElOOwoJZXZbMF0uZGF0YS5mZCA9IHBpcGU7CglyZXQgPSBlcG9sbF9j
dGwoZXBvbGwsIEVQT0xMX0NUTF9BREQsIHBpcGUsICZldlswXSk7Cglhc3NlcnQocmV0ID09IDAp
OwoKCWV2WzFdLmV2ZW50cyA9IEVQT0xMSU47CglldlsxXS5kYXRhLmZkID0gdGltZXJmZDsKCXJl
dCA9IGVwb2xsX2N0bChlcG9sbCwgRVBPTExfQ1RMX0FERCwgdGltZXJmZCwgJmV2WzFdKTsKCWFz
c2VydChyZXQgPT0gMCk7CgoJcHJpbnRmKCJzdGFydGluZyBsb29wXG4iKTsKCXdoaWxlICgxKSB7
CgkJc3RydWN0IGVwb2xsX2V2ZW50IGV2ZW50OwoJCWNoYXIgYnVmZmVyWzhdOwoJCXNpemVfdCBz
aXplOwoKCQlyZXQgPSBlcG9sbF93YWl0KGVwb2xsLCAmZXZlbnQsIDEsIC0xKTsKCQlhc3NlcnQo
cmV0ID09IDEpOwoJCWlmIChldmVudC5kYXRhLmZkID09IHRpbWVyZmQpCgkJCXNpemUgPSA4OwoJ
CWVsc2UKCQkJc2l6ZSA9IDE7CgkJcmV0ID0gcmVhZChldmVudC5kYXRhLmZkLCBidWZmZXIsIHNp
emUpOwoJCWFzc2VydChyZXQgPT0gc2l6ZSk7Cgl9Cn0K

--------------spaum1ezOJKKG0dS1AYXqxtP
Content-Type: text/x-csrc; charset=UTF-8; name="epoll-stall-writer.c"
Content-Disposition: attachment; filename="epoll-stall-writer.c"
Content-Transfer-Encoding: base64

I2luY2x1ZGUgPGFzc2VydC5oPgojaW5jbHVkZSA8ZmNudGwuaD4KI2luY2x1ZGUgPHN0ZGlvLmg+
CiNpbmNsdWRlIDx1bmlzdGQuaD4KCmludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCnsK
CWludCBwaXBlLCByZXQ7CgoJYXNzZXJ0KGFyZ2MgPT0gMik7CglwaXBlID0gb3Blbihhcmd2WzFd
LCBPX1dST05MWSk7Cglhc3NlcnQocGlwZSA+PSAwKTsKCglwcmludGYoInN0YXJ0aW5nIHdyaXRl
clxuIik7Cgl3aGlsZSAoMSkgewoJCXJldCA9IHdyaXRlKHBpcGUsICJ4IiwgMSk7CgkJYXNzZXJ0
KHJldCA9PSAxKTsKCX0KfQo=

--------------spaum1ezOJKKG0dS1AYXqxtP
Content-Type: application/x-shellscript; name="run.sh"
Content-Disposition: attachment; filename="run.sh"
Content-Transfer-Encoding: base64

IyEvYmluL2VudiBiYXNoCgp0ZXN0X25hbWU9IiR7MX0iCmlmIFsgLXogIiR7dGVzdF9uYW1lfSIg
XTsgdGhlbgoJdGVzdF9uYW1lPSJmaWZvIgoJZWNobyAiVXNpbmcgZGVmYXVsdCB0ZXN0IG5hbWUg
JHt0ZXN0X25hbWV9IgpmaQoKbWtmaWZvICIvdG1wLyR7dGVzdF9uYW1lfSIKbWtkaXIgIi9zeXMv
ZnMvY2dyb3VwLyR7dGVzdF9uYW1lfS5zbGljZSIKZWNobyAiMTAwMCAyMDAwIiA+ICIvc3lzL2Zz
L2Nncm91cC8ke3Rlc3RfbmFtZX0uc2xpY2UvY3B1Lm1heCIKLi9lcG9sbC1zdGFsbCAiL3RtcC8k
e3Rlc3RfbmFtZX0iICYKc3lzdGVtZC1ydW4gLS1zbGljZSAiJHt0ZXN0X25hbWV9LnNsaWNlIiAu
L2Vwb2xsLXN0YWxsLXdyaXRlciAiL3RtcC8ke3Rlc3RfbmFtZX0iICYK

--------------spaum1ezOJKKG0dS1AYXqxtP--
