Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011021.outbound.protection.outlook.com [52.101.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D0539FD9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.21
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743607376; cv=fail; b=dW6vO9BgDgipHzIImZsGW/yqePz31A40BYZqVcKtu3DPnXJT5ACztRDyszlYOFh8FPJHzTszk6h3mRsXa3lQX6gXpg5gAV8v0Sv5NS1t8TtiAPJ48NVM5pNVZ5PNfgudGA2PepaX19AvFXc0UGovkvloZ6NiVeSf7hhmlFb6/EM=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743607376; c=relaxed/simple;
	bh=sv7gB9bPx5UxYOFAQZyFlQkviXh2Hir0KplGSzjV7VI=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DTBhhzkeHo4ym6NvF/BSeNPqcEwmqU4bhy6luu3UlYY3kfOWpxapIi01Od9lvhragDwpWTRAtlDFEsb0cTmlDqYTNGuQnZ2MlilovzNxcUTVn2WHbo4gpr07P7U+JMUAsrrhkzlTO/lVwJF/DaZYcJGBfMCtu/XVEpWJc0j0Cvc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LEcybUZX; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LEcybUZX; arc=fail smtp.client-ip=52.101.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LEcybUZX";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LEcybUZX"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=md58AA0JrlzXQ1hwD9tL2dAXwz2DvgfpEqvAItjpOTfOZr/P+bEQ62LN7vYtJTONH3vOCdSa1Ox+GibH2O+8PBAxxWSW/PIU7HNysIU8Gzogaae8DG++lymGGGV2Ki/bqLHtA02YXXQtqoSMTd4PYbGLrzC0IqJTWq7qJYqeGfUHauTdLC48YdagvzTOEWEevs8eOVGQy9gM0txcVoaF2R6KMjdORfWt8xEWpGQc8dFwcuvIDoRSHWNBrugV9l3XVlaJBvBVZ0GuAxzNq3HAsddlDXA7WZZ6tAzSPH9gRP6tj1wjG7e5jFbJreosm6kW1XrOjxSiGz2wAtLxN+Re9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlJjmDNkU3zLw97IBpbWn4hmJ+8DMJLHSNRXn8f00zM=;
 b=kZEQIHrTpwcZrK1mkoqSTgNJDxPK9Q9qN0rEgvQoA0b2aaNzU2lTwDWw9O6JQqTcYtECzU0Ab03oWPGcPfA9w6bX7gbGH896A3v20C40HHReM3533ZCyzcgb/AwraJKap3As4W5y1qaJagSI5QwzsPmV3wW8CffGXnloITID8X1poE/BH/xaRbmVkKyfbTa5lyqiLBoWbtlghQf28/QCztjyVNNOvsPWattmyIISSGVXo6Vf5SNZfbMJB3zOr9QxWMHdHn8RdNYr0CrtKMhrKwzFzdZY5jgd1NqgeC4Qq9FJoQ7WMT+YqeuE6M9dv9u5IRn8GtFNhJ/4YKKaan/NZQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlJjmDNkU3zLw97IBpbWn4hmJ+8DMJLHSNRXn8f00zM=;
 b=LEcybUZXvUIPVmfFxGINO0TIv6KEKhDVk+aIsxYL4ndMkm/jyTIlBupo8X8VesC+Q2RVhZjWrj0O2L5WibG7m2IryT4F7NJEtYXyRpYFxwLgUMgFaGobAxYUYGNd/mZf5s1bQlzPHzToXgVBHV2NAfxu6i8HbKwMdewa3tASYkA=
Received: from DUZPR01CA0109.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::28) by DU0PR08MB9252.eurprd08.prod.outlook.com
 (2603:10a6:10:41b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.48; Wed, 2 Apr
 2025 15:22:46 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:4bb:cafe::bb) by DUZPR01CA0109.outlook.office365.com
 (2603:10a6:10:4bb::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.41 via Frontend Transport; Wed,
 2 Apr 2025 15:22:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22 via
 Frontend Transport; Wed, 2 Apr 2025 15:22:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k3lV8pwSXEVJq6odQbLexkg6eqjykIoDz4d/MSp7jWrGBhckJEVYzK6iCCSelVJwjwJmx2dNzh2FH+XqFsMoIUrksoKPYhm1UXdDBblqbjcu2dNrsLHIsSBeCgzxt99fYZjiGvO9BSTkhq6px0aqMES1KHkgMV1qf7jQydp5QwqDQcHhYXlvqGRKt43dFb9DNLz2M1OgqpncbIpZ++bWb369e9kqnl+Dy09Si2O+x3/vxB9qcVmnEzvKjl6UGigM8EsiY9Ego6hJ43bogUwp7YxH/GFTw+8eO7EO2ANqDDKUd7oEuGNRRViwvsUnKLn6YIbmTkwD3OFkdmY7bPUCSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlJjmDNkU3zLw97IBpbWn4hmJ+8DMJLHSNRXn8f00zM=;
 b=jZC2VjLCWMjeJv51d691ArNdYMYWIAUHLjb0SS7Z+VA1/FCGuI2DvI+KIR2VWYiyXjuntbClrnUPIXFqQQHf1987oQsdIXBH7swJcrWVPAcwxKzPXLVjliOJUeYMpRRVW8xsOeNch/yJCm92KnSjf0MZ4dKwI7rmUuSs7Q5QMtUDqp1NpH8yDJWw3hp9JOY12QutMSEFof1TXGhDFA0Y8sLmBcS2KGoaQ1tJY4NgchBNG0cUCm8vyPdHshY7SOCZg59S4svXQi43RRTnPVNDFhfukcugZaifG/VL/NQ/Y12IdZQaxQZKXLrUVhkR4d1XqlmDoja0e1ukNQlpL7IlSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlJjmDNkU3zLw97IBpbWn4hmJ+8DMJLHSNRXn8f00zM=;
 b=LEcybUZXvUIPVmfFxGINO0TIv6KEKhDVk+aIsxYL4ndMkm/jyTIlBupo8X8VesC+Q2RVhZjWrj0O2L5WibG7m2IryT4F7NJEtYXyRpYFxwLgUMgFaGobAxYUYGNd/mZf5s1bQlzPHzToXgVBHV2NAfxu6i8HbKwMdewa3tASYkA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PR3PR08MB5852.eurprd08.prod.outlook.com (2603:10a6:102:8e::21)
 by PAWPR08MB11193.eurprd08.prod.outlook.com (2603:10a6:102:46c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 15:22:13 +0000
Received: from PR3PR08MB5852.eurprd08.prod.outlook.com
 ([fe80::f44:d113:1c29:825d]) by PR3PR08MB5852.eurprd08.prod.outlook.com
 ([fe80::f44:d113:1c29:825d%6]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 15:22:13 +0000
Message-ID: <725629dc-b1a4-42d5-81c6-ae09dc5f9444@arm.com>
Date: Wed, 2 Apr 2025 16:22:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] sched: Improving scheduler debugging/tracing interfaces
Content-Language: en-US
From: Luis Machado <luis.machado@arm.com>
To: linux-kernel@vger.kernel.org, peterz@infradead.org,
 dietmar.eggemann@arm.com
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com
References: <20250402122607.2982523-1-luis.machado@arm.com>
In-Reply-To: <20250402122607.2982523-1-luis.machado@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0044.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::10) To PR3PR08MB5852.eurprd08.prod.outlook.com
 (2603:10a6:102:8e::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PR3PR08MB5852:EE_|PAWPR08MB11193:EE_|DU6PEPF0000A7E0:EE_|DU0PR08MB9252:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f234a15-84df-46c2-01fe-08dd71fa38ae
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ZjJyQUxxTDAvd2lzT2R3WE55SDFDTFQ0Vi9RU3NmbnhaMFlIWndSTFVkalhI?=
 =?utf-8?B?VEUxWjk5MFJIVnJhSG50Ti8yd04ycS9QN2F2ck1EWHdYZjBpQzNoQ1VwRXEv?=
 =?utf-8?B?T0ExUEFsQUhaeDlMQ0VtWXJDVHZaWHorZEEwRVVjQ0p1cFRINTd3SzVmU0VC?=
 =?utf-8?B?RytYNE9HNWVsWEwyS29kK1RZUHd2aGxDNkowWWVSY2tRKytVWGhTamt5bkZL?=
 =?utf-8?B?VWZPVnEwVHJUSlRoazdGTjF0Slhjb0d2a0dRNVlMZkZjWWNKUGw5VGQyRXAv?=
 =?utf-8?B?Sm1YMHJRUXRYVi8zeUwvSVo2UE5IcVFNOUxKMDA3a0JoZnZKVnZXQjVsczM1?=
 =?utf-8?B?V0JPOHJpNzdqVFZzRlNXM3RGZkxnM0JFQjgxRmNvazVyNHQ5KzdpL1czelkx?=
 =?utf-8?B?NTZScTRwdk12QklRT3FMdEtESDliZ1VJN09lVWtDR1M2OTQyYzNtWDVkYnpC?=
 =?utf-8?B?WG0wZ0JNZkZmVlhOb000NkZxZ2FDQ1poR2tJSkE0WVlJdVBaZllsaHZiV1F5?=
 =?utf-8?B?MCtNRVJVQ3RzemNFVURhQ2VoTm8xTkNzZ1RvOTdWZDF4dytyQ1JmQTVWV2dB?=
 =?utf-8?B?dzhLakFod1ZKRDNkUHBITnYwb1FKS1J6ZTE4NjZZQkQxdGdOVnh1Q2JlbU5z?=
 =?utf-8?B?WVVKcE5XZDA0TnFUbmd0bXlQUnJ1T1cvaDN2K1BPRFJSSE55ZTJNWmwvMUtL?=
 =?utf-8?B?MzJDRmVwWEM3MWxuUXVmekhBUGpENzhBMzJ3eHl3NVE3dEFNZ0ZyK1M2QVVC?=
 =?utf-8?B?TEw2aUZDOG5FaGVYSjBQK3BDRFlYaWRSc3AzcDZKOWdqZ0g1bk4wdGI5R1pn?=
 =?utf-8?B?MkVjaUNXbWJkTlBaMEpmdi81UGgwQnloZHE0RkdYK3B1ZzJ0ODg5cVI4SW5G?=
 =?utf-8?B?Z2o4ZDdSZzBFMGxSd1c3WXc0SHBkRXkzUk9icVF0bXMrU0tKeVh5R2NLY1dx?=
 =?utf-8?B?SG0yc2FDSUg0RmgwQnU2Q3lMOERRZ2RKbkVUdkVPN3FPcWI3ZjRSUzlEVGQ0?=
 =?utf-8?B?ZmMrdzhWcExPdzJkLzljQjEyTUxkZkw4ZEEyMGtWc1pFSGh2WEViRVpheGNF?=
 =?utf-8?B?bjZwTmRKOTFoMkRVS2JIRVhnMGF0eE9BOUYzMGZtcUdLZ0k5U1ZramZyT2pu?=
 =?utf-8?B?UHd5dHhPcnVwdlkwR2phN09vSVRIR1lNY3hQa0gzbi9kcUtPSythQWk5WUFa?=
 =?utf-8?B?enQxSWlXajIxbnBJTlpKWjEvaXNoY2JCS0k5ei9QWENVUmx5L0NPR0YyWXY3?=
 =?utf-8?B?VG15L1h3Z0pKcUtuZHFtWEtyOFFXeDFxZitFUk1QbTQwQ2ppS1lLakFlbFhE?=
 =?utf-8?B?UnRZbkl5L0ZTSFRDT0t1Y0RtaksyRXp1ZHJXV2hHVXNweVZETlFWdHVnMmt3?=
 =?utf-8?B?Z2h6dGJKVU5XYXJzUUtrREoreGRzc1VrWXJWUUxqTnljeUh2YUpIZ0FaVHZX?=
 =?utf-8?B?ZnFkYldWTjdTSzJNUkF1UzVBRXQwRkpDZXplR0pzOWEwNU5RSTFTRVF0a3Nj?=
 =?utf-8?B?a2JzUG5ycFBtMTRBazdFRnZFbWl1RytyN0ZKNkNWN00yWkdsM21xSEdheHVs?=
 =?utf-8?B?eHRKNHFLMEt5Q01yZlFTUUh4eUl3aUZ5S2pJUjhYdld0eEVqbExZMDA2enFG?=
 =?utf-8?B?V3FUYTRaWkNvbjFXbExwcGU0YXBYNStQU0JPZmZURGRzR2dBeElvQUVNQ0pB?=
 =?utf-8?B?MkIxbjdKY2RQTXlwUjVuSjdGa0l5cDk2SU1JeWptTmFQVWF0amZOYVNicTBH?=
 =?utf-8?B?blpvYnYvOUl4QTRaK3pIdjhFZVhHSXRBNDBNZ29IeWwrMUFrOWNkbTVCVkFE?=
 =?utf-8?B?QndqTjhXaXVxMjk1VHFXWEtac01TZjI4dGRrM0NQK1Zla2Q4a1hDaStkQjk1?=
 =?utf-8?B?TnBaU3owNHdWUE1GdEZTaFhpRThmbFlhajZVbGRWS3hZd0VnaEE4MlQyOTdS?=
 =?utf-8?Q?0Xhtl1nJ86U=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5852.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	56895311-dbf6-41ca-dcaf-08dd71fa24f8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|1800799024|82310400026|14060799003|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Um1ZcVIzSldjWEpodXVtTURWblF2NUM3SyttbHp4V1JTNGdFTE1id20zQmgz?=
 =?utf-8?B?RFJjODBEN2dmaVhrdlYvbk5ES3M0aHdYdlhxVHRCVi9wL3QvQUU5eHcrNkRR?=
 =?utf-8?B?RGwzNElVbEV5YzhtYTFFYnpOcENPUTdobXk2aDFxdDlqSXpoTDJQUDZSNDcv?=
 =?utf-8?B?amNiMTJhVTkvWll2NTd5cEhYZDhYcUQ3Q2dyMFN5QXJuYnNXVWk0WnZYc2Rn?=
 =?utf-8?B?YWpLWVRzSHVjbW4ySlh6emM1QWRMUWRKMm50L0Rad1RFMHVrRUpzYThYNGRx?=
 =?utf-8?B?T3FvZnl2MllXYWNJcEhoWDdZaTFheXpJT2l1S0RUN3YvWDROWW8xcm5lajkx?=
 =?utf-8?B?WHBmaStrN0FnY0p6eDhNRFFpUjRzNUR1WnZROWRLNXZtK0FLT1lSTVAwTUZP?=
 =?utf-8?B?T2dvRDRVbHFuTHJJbUhBa01WNmdxV2Q2SWpmUVZmdFB4ZFV2M05tQ05lYVdZ?=
 =?utf-8?B?ak1WanUwQkpXdnZqdkc0aWs0QWxBSVlzeWtWcDROcUpWYW93R2creTdlTUgv?=
 =?utf-8?B?clRBNUNJQVR0eHpKcU90Y3J2YlFnNDRzVjY5Sy9RRkRpMUF3dnJxTzVUNHF5?=
 =?utf-8?B?TllZUHpaOXFTOEkxL0MvajZyMEFSbHp1ZG5YR3lBeVgrU0VNVkpVMFhyK0p3?=
 =?utf-8?B?TGVKeEF3azY3VUx0K1cvT0ZaSUZkR0ZiVGZDUDNOTTFybzR5dktqN1VUL1RO?=
 =?utf-8?B?M2N0cTd2cW5McGRRTjRDdDhHaFArbld1ZDhYc2U1UXltUEZ0ZTQzeDBPZnlM?=
 =?utf-8?B?YTRrT21HSURycXd5RGdiQTlQMGZ4RzVqZ1BVQ2FGbHBrd2hVa1hrYVZNeGd1?=
 =?utf-8?B?RHZ5QXplaCtzbmJRbXR2dnBUSFkzU1FMU09MWXQ5Y2xKZE9DR3VUc09GdEcv?=
 =?utf-8?B?dEtod3pIK0k4WXc1L1ZQdTRkWStRdUZLVnVwbHU2a0VmQTNZZFRWeEEwSHhQ?=
 =?utf-8?B?MGF4elFvMnpVWjV1REtId3JqVk5Sclk3bmYwZFNYbXpjTmRPN3hyTG1CcTdz?=
 =?utf-8?B?cittc1kvZFpNYTRMeVdjWFUzK2lxb2NUNVJuOVdtUTVaWnA4S3NOZ1NXQnlM?=
 =?utf-8?B?TDFKSUNlb3NEbCtaLzdieHBJQTFyb2YyMkNVRnlMZFJ5RmRjanptL1dxVExI?=
 =?utf-8?B?alFwekIwSW1xbW13QmZGU3lmRXB4OU1vNHZZOWFTYk9lOHR6TE1Hb2pDSzFF?=
 =?utf-8?B?UlBweU5nQnpxb0hhL2Jua2JMbjV0SGNPNHRoOTBNZmk4RTViUTJtb1NQc1hl?=
 =?utf-8?B?dHNRQTJ2ODdqZXRWbkNlenBzYVFMZFRmcWdTbjZwR2lFbnlyWnZqL3JYc3R5?=
 =?utf-8?B?dWwwaldxd2xSUkVFdTYxL2VuVDJWL29NRFNuZTZBM2d6Tm9WZkNhcHlBK25p?=
 =?utf-8?B?OWtYY1F4bzhTRVRFb1o3dFp3RlhWTDRwQlp6cE1haTJJSFArVlMxampiWFFJ?=
 =?utf-8?B?NmtnbEJ4ZmlWUkM1NThyYzNVeXFpRW9sMG51RHphMjRRcU9seXZFNWUvbTFr?=
 =?utf-8?B?aXp0djRaanV0NEFFVk13d3A3Y1M5OGx1RndFN3hnNk4rcGNUS2krV2ZlYnZZ?=
 =?utf-8?B?bGNrVDhHKzVSYXRMVDJmeHV2Qzc0aCtBS0IxQm53TVd3KzhqN3Y0OGdJRzg1?=
 =?utf-8?B?WDJVYU9ZRWx0RnJTS3RJR1F4dWl6SDU3ZFdQY01jaWxXSHBFa2trYTlBdmEy?=
 =?utf-8?B?ZFFHVnEyK3liMGtlK3FxY0RzSGdxUWY0ZXBQbU1MaERuTEhxSlBETUVUbkg5?=
 =?utf-8?B?cGxsY2NoVlUzc3lnMGRGTm1pWTlsN1VudWppeFRmN1pMZm9OQ1Q1dGFPQ2Jt?=
 =?utf-8?B?TEFpNUdvY0xkTzFHZ2dNUlRPd1ppM3E5TFZUMW9LcHVjKzdEYmU4dklIRjVF?=
 =?utf-8?B?Q1ozL1VnZForRXMzUXpTOGtLdyt5MXpySEtLZFZkWW1hNHRGczduZyt4ZE1Q?=
 =?utf-8?B?SDRBYUpuOFVRQzU2WXhwVWxyYS83cjFHMS96eHV4bkdicm1Pb0ZTZG03MTgy?=
 =?utf-8?B?M2FGWEVoZFZDbGpkUHYrOXljUDJPOWFVTkFrdmJBbXcycnhsWThadXY1TnJW?=
 =?utf-8?B?SkhydDY1NHpoRWFjOGFqVHhJcE1uYjRudTErUT09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(1800799024)(82310400026)(14060799003)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 15:22:46.2075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f234a15-84df-46c2-01fe-08dd71fa38ae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9252

On 4/2/25 13:26, Luis Machado wrote:
> This patch is primarily a proposal aimed at improving the observability of the
> scheduler, especially in the context of energy-aware scheduling, without
> introducing long-term maintenance burdens such as a stable userspace ABI. I’m
> seeking feedback from the community on whether this approach seems viable, or
> if there are suggestions for making it more robust or maintainable.
> 
> Today, validating that a set of scheduler changes behaves sanely and doesn’t
> regress performance or energy metrics can be time-consuming. On the
> energy-aware side in particular, this often requires significant manual
> intervention to collect, post-process, and analyze data.
> 
> Another challenge is the limited availability of platforms that can run a
> mainline kernel while still exposing the detailed data we need. While we do
> have some options, most devices running upstream kernels don’t provide as
> much — or as precise — information as we’d like. The most data-rich devices
> tend to be phones or Android-based systems, which typically run slightly
> older or patched kernels, adding yet another layer of complexity.
> 
> As a result, going from reviewing a patch series on LKML to having a concrete
> good/bad/neutral result often involves several intermediate steps and tooling
> hurdles.
> 
> Our current data collection relies heavily on existing kernel tracepoints and
> trace events. However, adding new trace events is increasingly discouraged,
> since these are often treated as part of a de facto userspace ABI — something
> we want to avoid maintaining long-term. So extending the trace events set isn’t
> a viable option.
> 
> To work around this, we use a kernel module (LISA) that defines its own trace
> events based on existing scheduler tracepoints. This approach gives us
> flexibility in creating events without modifying the kernel’s core trace
> infrastructure or establishing any new userspace ABI.
> 
> For the past few years, tracepoint definitions for the scheduler have been
> exposed in include/trace/events/sched.h. These definitions are not always
> made available via tracefs, and are documented as being for testing and
> debugging purposes — which aligns well with our use case.
> 
> However, this approach has limitations. One issue is the visibility of
> tracepoint argument types. If a tracepoint uses a public type defined in a
> public header, we can dereference members directly to extract data. But if
> the type is internal or opaque — such as struct rq — we can’t access its
> contents, which prevents us from retrieving useful values like the CPU number.
> 
> One workaround is to duplicate the kernel’s internal struct definitions in
> the module, but this is not good: it’s error-prone due to alignment issues and
> requires constant tracking of kernel changes to avoid mismatches.
> 
> A better approach, which we currently use, is to rely on BTF (BPF Type
> Format) to reconstruct type information. BTF allows us to access internal
> kernel types without having to maintain duplicate struct definitions. As long
> as BTF info is available, we can introspect data structures even if they’re
> not publicly defined.
> 
> Using this, our module can define trace events and dereference internal types
> to extract data — but it’s not without friction:
> 
> - Struct members are often nested deeply within BTF type trees, which can make
> it awkward to navigate and extract data.
> 
> - BTF describes data types, but not semantics. For example, sched_avg.util_est
> appears to be a numeric value, but in reality it encodes a flag alongside the
> actual utilization value. The kernel uses the following helper to extract the
> actual data:
> 
> static inline unsigned long _task_util_est(struct task_struct *p)
> {
>     return READ_ONCE(p->se.avg.util_est) & ~UTIL_AVG_UNCHANGED;
> }
> 
> There is no way to infer from BTF alone that this masking is needed. And even
> when such helpers exist in the kernel, they’re often inlined or unavailable
> to modules, so we’d have to reimplement them — again reintroducing
> maintenance overhead.
> 
> To address these challenges and reduce duplication, we propose adding an
> extra argument to certain scheduler tracepoints: a pointer to a struct of
> function pointers (callbacks). These callbacks would act as "getters" that
> the module could use to fetch internal data in a safe, forward-compatible
> way.
> 
> For example, to extract the CPU capacity from a struct rq (which is opaque to
> the module), the module could call a getter function via the callback struct.
> These functions would reside inside the kernel, and could leverage internal
> knowledge, including inlined helpers and static data.
> 
> Here's an example of the proposed callback structure:
> 
> struct sched_tp_callbacks {
>     /* Fetches the util_est from a cfs_rq. */
>     unsigned int (*cfs_rq_util_est)(struct cfs_rq *cfs_rq);
> 
>     /* Fetches the util_est from a sched_entity. */
>     unsigned int (*se_util_est)(struct sched_entity *se);
> 
>     /* Fetches the current CPU capacity from an rq. */
>     unsigned long (*rq_cpu_current_capacity)(struct rq *rq);
> };
> 
> The idea is simple: given a base type (e.g. rq, cfs_rq, sched_entity), the
> module calls a getter function that returns the data it needs. These getters
> encapsulate internal kernel logic and remove the need for the module to
> replicate or guess how to access scheduler internals.
> 
> Since these additions would be part of tracepoints used for
> testing/debugging, they are not considered stable ABI and can evolve as the
> kernel changes. It would be up to the module to adapt to changes in available
> hooks, types, or fields — something we already do today using BTF for
> disappearing types (e.g. struct util_est becoming a raw integer).
> 
> While this approach would require some extra code in the kernel to define the
> callback struct and register the functions, we believe it would significantly
> improve testability and maintainability of tooling like LISA. It could even
> be extended to support non-energy-aware scheduler debugging scenarios as
> well.
> 
> Our current testing pipeline already makes heavy use of LISA [1], which
> automates test execution and data analysis. It also integrates with rt-app
> [2] to generate configurable workloads.
> 
> The attached proof-of-concept patch adds three such callback functions as a
> demonstration. We’ve tested this against a modified version of our module
> that uses the callbacks to fetch scheduler internals.
> 
> Thoughts?
> 
> [1] https://tooling.sites.arm.com/lisa/latest/
> [2] https://github.com/scheduler-tools/rt-app
> 
> Signed-off-by: Luis Machado <luis.machado@arm.com>
> ---
>  include/trace/events/sched.h | 27 +++++++++++++++++----------
>  kernel/sched/core.c          | 27 +++++++++++++++++++++++++++
>  kernel/sched/fair.c          | 16 ++++++++--------
>  kernel/sched/pelt.c          |  6 +++---
>  kernel/sched/sched.h         | 11 +++++++++++
>  5 files changed, 66 insertions(+), 21 deletions(-)
> 
> diff --git a/include/trace/events/sched.h b/include/trace/events/sched.h
> index 8994e97d86c..0687f4f62d9 100644
> --- a/include/trace/events/sched.h
> +++ b/include/trace/events/sched.h
> @@ -767,6 +767,13 @@ TRACE_EVENT(sched_wake_idle_without_ipi,
>  	TP_printk("cpu=%d", __entry->cpu)
>  );
>  
> +/* This struct is declared here so the tracepoints below can pass
> + * these types as parameter.
> + * This is only used for testing and debugging, so tracepoint probes can
> + * use the callbacks to fetch the data they need.
> + */
> +struct sched_tp_callbacks;
> +
>  /*
>   * Following tracepoints are not exported in tracefs and provide hooking
>   * mechanisms only for testing and debugging purposes.
> @@ -774,8 +781,8 @@ TRACE_EVENT(sched_wake_idle_without_ipi,
>   * Postfixed with _tp to make them easily identifiable in the code.
>   */
>  DECLARE_TRACE(pelt_cfs_tp,
> -	TP_PROTO(struct cfs_rq *cfs_rq),
> -	TP_ARGS(cfs_rq));
> +	TP_PROTO(struct cfs_rq *cfs_rq, struct sched_tp_callbacks *sched_tp_callbacks),
> +	TP_ARGS(cfs_rq, sched_tp_callbacks));
>  
>  DECLARE_TRACE(pelt_rt_tp,
>  	TP_PROTO(struct rq *rq),
> @@ -794,24 +801,24 @@ DECLARE_TRACE(pelt_irq_tp,
>  	TP_ARGS(rq));
>  
>  DECLARE_TRACE(pelt_se_tp,
> -	TP_PROTO(struct sched_entity *se),
> -	TP_ARGS(se));
> +	TP_PROTO(struct sched_entity *se, struct sched_tp_callbacks *sched_tp_callbacks),
> +	TP_ARGS(se, sched_tp_callbacks));
>  
>  DECLARE_TRACE(sched_cpu_capacity_tp,
> -	TP_PROTO(struct rq *rq),
> -	TP_ARGS(rq));
> +	TP_PROTO(struct rq *rq, struct sched_tp_callbacks *sched_tp_callbacks),
> +	TP_ARGS(rq, sched_tp_callbacks));
>  
>  DECLARE_TRACE(sched_overutilized_tp,
>  	TP_PROTO(struct root_domain *rd, bool overutilized),
>  	TP_ARGS(rd, overutilized));
>  
>  DECLARE_TRACE(sched_util_est_cfs_tp,
> -	TP_PROTO(struct cfs_rq *cfs_rq),
> -	TP_ARGS(cfs_rq));
> +	TP_PROTO(struct cfs_rq *cfs_rq, struct sched_tp_callbacks *sched_tp_callbacks),
> +	TP_ARGS(cfs_rq, sched_tp_callbacks));
>  
>  DECLARE_TRACE(sched_util_est_se_tp,
> -	TP_PROTO(struct sched_entity *se),
> -	TP_ARGS(se));
> +	TP_PROTO(struct sched_entity *se, struct sched_tp_callbacks *sched_tp_callbacks),
> +	TP_ARGS(se, sched_tp_callbacks));
>  
>  DECLARE_TRACE(sched_update_nr_running_tp,
>  	TP_PROTO(struct rq *rq, int change),
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index c81cf642dba..a0ee7534aaa 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -99,6 +99,27 @@
>  EXPORT_TRACEPOINT_SYMBOL_GPL(ipi_send_cpu);
>  EXPORT_TRACEPOINT_SYMBOL_GPL(ipi_send_cpumask);
>  
> +static unsigned int cfs_rq_util_est(struct cfs_rq *cfs_rq)
> +{
> +	return cfs_rq ? cfs_rq->avg.util_est: 0;
> +}
> +
> +static unsigned int se_util_est(struct sched_entity *se)
> +{
> +
> +	return se ? se->avg.util_est & ~UTIL_AVG_UNCHANGED : 0;
> +}
> +
> +static unsigned long rq_cpu_current_capacity(struct rq *rq)
> +{
> +	if (rq == NULL)
> +		return 0;
> +
> +	unsigned long capacity_orig = per_cpu(cpu_scale, rq->cpu);
> +	unsigned long scale_freq = per_cpu(arch_freq_scale, rq->cpu);
> +	return cap_scale(capacity_orig, scale_freq);
> +}
> +
>  /*
>   * Export tracepoints that act as a bare tracehook (ie: have no trace event
>   * associated with them) to allow external modules to probe them.
> @@ -8524,11 +8545,17 @@ LIST_HEAD(task_groups);
>  static struct kmem_cache *task_group_cache __ro_after_init;
>  #endif
>  
> +struct sched_tp_callbacks sched_tp_callbacks;
> +
>  void __init sched_init(void)
>  {
>  	unsigned long ptr = 0;
>  	int i;
>  
> +	sched_tp_callbacks.cfs_rq_util_est = cfs_rq_util_est;
> +	sched_tp_callbacks.se_util_est = se_util_est;
> +	sched_tp_callbacks.rq_cpu_current_capacity = rq_cpu_current_capacity;
> +
>  	/* Make sure the linker didn't screw up */
>  #ifdef CONFIG_SMP
>  	BUG_ON(!sched_class_above(&stop_sched_class, &dl_sched_class));
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index e43993a4e58..f115842669b 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -4433,8 +4433,8 @@ static inline int propagate_entity_load_avg(struct sched_entity *se)
>  	update_tg_cfs_runnable(cfs_rq, se, gcfs_rq);
>  	update_tg_cfs_load(cfs_rq, se, gcfs_rq);
>  
> -	trace_pelt_cfs_tp(cfs_rq);
> -	trace_pelt_se_tp(se);
> +	trace_pelt_cfs_tp(cfs_rq, &sched_tp_callbacks);
> +	trace_pelt_se_tp(se, &sched_tp_callbacks);
>  
>  	return 1;
>  }
> @@ -4698,7 +4698,7 @@ static void attach_entity_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *s
>  
>  	cfs_rq_util_change(cfs_rq, 0);
>  
> -	trace_pelt_cfs_tp(cfs_rq);
> +	trace_pelt_cfs_tp(cfs_rq, &sched_tp_callbacks);
>  }
>  
>  /**
> @@ -4728,7 +4728,7 @@ static void detach_entity_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *s
>  
>  	cfs_rq_util_change(cfs_rq, 0);
>  
> -	trace_pelt_cfs_tp(cfs_rq);
> +	trace_pelt_cfs_tp(cfs_rq, &sched_tp_callbacks);
>  }
>  
>  /*
> @@ -4865,7 +4865,7 @@ static inline void util_est_enqueue(struct cfs_rq *cfs_rq,
>  	enqueued += _task_util_est(p);
>  	WRITE_ONCE(cfs_rq->avg.util_est, enqueued);
>  
> -	trace_sched_util_est_cfs_tp(cfs_rq);
> +	trace_sched_util_est_cfs_tp(cfs_rq, &sched_tp_callbacks);
>  }
>  
>  static inline void util_est_dequeue(struct cfs_rq *cfs_rq,
> @@ -4881,7 +4881,7 @@ static inline void util_est_dequeue(struct cfs_rq *cfs_rq,
>  	enqueued -= min_t(unsigned int, enqueued, _task_util_est(p));
>  	WRITE_ONCE(cfs_rq->avg.util_est, enqueued);
>  
> -	trace_sched_util_est_cfs_tp(cfs_rq);
> +	trace_sched_util_est_cfs_tp(cfs_rq, &sched_tp_callbacks);
>  }
>  
>  #define UTIL_EST_MARGIN (SCHED_CAPACITY_SCALE / 100)
> @@ -4970,7 +4970,7 @@ static inline void util_est_update(struct cfs_rq *cfs_rq,
>  	ewma |= UTIL_AVG_UNCHANGED;
>  	WRITE_ONCE(p->se.avg.util_est, ewma);
>  
> -	trace_sched_util_est_se_tp(&p->se);
> +	trace_sched_util_est_se_tp(&p->se, &sched_tp_callbacks);
>  }
>  
>  static inline unsigned long get_actual_cpu_capacity(int cpu)
> @@ -10009,7 +10009,7 @@ static void update_cpu_capacity(struct sched_domain *sd, int cpu)
>  		capacity = 1;
>  
>  	cpu_rq(cpu)->cpu_capacity = capacity;
> -	trace_sched_cpu_capacity_tp(cpu_rq(cpu));
> +	trace_sched_cpu_capacity_tp(cpu_rq(cpu), &sched_tp_callbacks);
>  
>  	sdg->sgc->capacity = capacity;
>  	sdg->sgc->min_capacity = capacity;
> diff --git a/kernel/sched/pelt.c b/kernel/sched/pelt.c
> index 7a8534a2def..7ca37abf46b 100644
> --- a/kernel/sched/pelt.c
> +++ b/kernel/sched/pelt.c
> @@ -296,7 +296,7 @@ int __update_load_avg_blocked_se(u64 now, struct sched_entity *se)
>  {
>  	if (___update_load_sum(now, &se->avg, 0, 0, 0)) {
>  		___update_load_avg(&se->avg, se_weight(se));
> -		trace_pelt_se_tp(se);
> +		trace_pelt_se_tp(se, &sched_tp_callbacks);
>  		return 1;
>  	}
>  
> @@ -310,7 +310,7 @@ int __update_load_avg_se(u64 now, struct cfs_rq *cfs_rq, struct sched_entity *se
>  
>  		___update_load_avg(&se->avg, se_weight(se));
>  		cfs_se_util_change(&se->avg);
> -		trace_pelt_se_tp(se);
> +		trace_pelt_se_tp(se, &sched_tp_callbacks);
>  		return 1;
>  	}
>  
> @@ -325,7 +325,7 @@ int __update_load_avg_cfs_rq(u64 now, struct cfs_rq *cfs_rq)
>  				cfs_rq->curr != NULL)) {
>  
>  		___update_load_avg(&cfs_rq->avg, 1);
> -		trace_pelt_cfs_tp(cfs_rq);
> +		trace_pelt_cfs_tp(cfs_rq, &sched_tp_callbacks);
>  		return 1;
>  	}
>  
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 47972f34ea7..5b0b8bb460c 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -182,6 +182,17 @@ extern struct list_head asym_cap_list;
>   */
>  #define RUNTIME_INF		((u64)~0ULL)
>  
> +struct sched_tp_callbacks {
> +	/* Fetches the util_est from a cfs_rq. */
> +	unsigned int (*cfs_rq_util_est)(struct cfs_rq *cfs_rq);
> +	/* Fetches the util_est from a sched_entity. */
> +	unsigned int (*se_util_est)(struct sched_entity *se);
> +	/* Fetches the current cpu capacity out of a rq. */
> +	unsigned long (*rq_cpu_current_capacity)(struct rq *rq);
> +};
> +
> +extern struct sched_tp_callbacks sched_tp_callbacks;
> +
>  static inline int idle_policy(int policy)
>  {
>  	return policy == SCHED_IDLE;
> 
> base-commit: 328802738e1cd091d04076317f3c2174125c5916

And I see the kernel test robot has an issue building on i386 that I need to look at first.

cpu_scale and arch_freq_scale are not defined there.
