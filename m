Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011021.outbound.protection.outlook.com [52.101.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C741027CB16
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 16:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.21
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386890; cv=fail; b=W587z/WXznmbBrsD9j2EipjBkQxLE4kfqDiT31T1mXw0Q59O3mJDklFYidRt4+sTyzVwk0/p/ohusBVIWfQzqMUWsUQ87KIb0ybeEzv7eeSZq8AhwrEl69qsfAkc87dtsrj/u9OizS1kqIq8zqMCeBbe+F6pRelynhTKsoicOb0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386890; c=relaxed/simple;
	bh=gneoh49KDjf57QjQijgVAj5CWkwUT6arJHnz32E35uM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AIc77/P4hmnmdBpS5m2aiqQfdMWl9WPSicwyl41FTHNfCMg5xsPjVzsanj8omBwHwE1Zu80F/oaYG3uRstUlcglJC1ja3oDVsVD5CeF3zy9YPzLc4snd290aJuZVB4zp3FH8/RapnUiHpjumm9kaQGLjYjp1wlRzHpCvmFguFcc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=oSUG2THP; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=oSUG2THP; arc=fail smtp.client-ip=52.101.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="oSUG2THP";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="oSUG2THP"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Va5TxYg2wL9md/EHL5FpTTUYxRIQ++ZPt0YKCGu5dSE15pkUJMkz4R1cuyk3w9JI7h17/8IwYW2gVt/Zz70dVOrZPVCdpQ4h0iIRmPUvA32c9FLucRcYnARubDJQYL8LBeM0I1TRnUZ1XBDeA5YmudSB9wCSnOxh+66lhmdOu5mWB4yvhgMfwJlgQS+/bBOwBYr7KcxzzLSaffDp5LiVI76fB8Q5tIKC9kviVcIHwo8HgTbJI6TuKYgl3MrfqE7seU4ZBuUFnAY86rY+eWReacPq02PKwNdisSeGlsmrT9wpiB8A6VwckF+CkupTTjfe5HTnetow4wNJSEJ3oxjN3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gneoh49KDjf57QjQijgVAj5CWkwUT6arJHnz32E35uM=;
 b=pKjxWtNHLoGfCLQCG8Hj3GUGxRfk3nHluf2dfbXaB6C+s0aT49AgFZ5KXw8RGNSh5N30BReNvWiAPl+vR7aegZ/YWExSJiLV+1tJ3bUHfyPQeGYf1jLNEgQZTZrIoPxMqKkNyxbxzXkgs0D2xsTGlDlLPTzaMbg+6jg3XJ1MCbyWelNxWZsMTYnN6zEYSu9Az1Vm/oZLVe+aBNsP4M0itb6+BSvRCYMHj0jjjpCsVFcbUv4NvYcjSjTLtm6v1XxX9ZKOlhHDQE2ec/jdyNDK09KTOHJiFEkysD+4KQsVCe74akC5USm7RXEG5gph0wxAXBOzhkHdnTuk9ZhojH/bYA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gneoh49KDjf57QjQijgVAj5CWkwUT6arJHnz32E35uM=;
 b=oSUG2THPuXom3HRRluVsn/i+xucXn6fdsBLSx3XI4TzceWuH/QhqySEIFRU7tCosMYH/q0jh2PmSFCWdJFM097jmfObP0E0FD2nBrFGgOMHqHmq228lsTSJnTUpBkd7DER8tF9EfqvO2hWUwdxZB3W3+b0zce+8Zg+7iS2whBF8=
Received: from DU6P191CA0057.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::15)
 by DB9PR08MB8292.eurprd08.prod.outlook.com (2603:10a6:10:3dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Tue, 1 Jul
 2025 16:21:20 +0000
Received: from DU2PEPF00028D04.eurprd03.prod.outlook.com
 (2603:10a6:10:53e:cafe::1c) by DU6P191CA0057.outlook.office365.com
 (2603:10a6:10:53e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Tue,
 1 Jul 2025 16:21:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D04.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 16:21:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2Ih603H5ZSPZtFdpxaOWJshlFYkKiRqXEwRR0/VgxC0oECV9azv3rugZ1ZrIyrqjZtKd71mWfnONTBVOQg19b0OyLuAR5ckNATGwlZbuTZQ1GnGQc66prxXtJGqZFMWsJAHWa/xp9ZrD5InRYNegmZqQo09hKh0mx+SIAo5MXCxv7TZhfXaJyXjaMRTxX6xWa1lejR3MoxeVbcR9bH0gtOfOrtHWLs6WkdWi+SmYEOLGnW3wHrloojEsreqWOLGEoXMCVtx4W6c+cYjNKJh4JFA6JTcfuvV9tRSxdUq7FVSCZ9UJF8/Ll7Sq3wHWtMjbsBdqvnIzQ0LQX1jteRFqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gneoh49KDjf57QjQijgVAj5CWkwUT6arJHnz32E35uM=;
 b=NL74XXVx8uDw4wFmZBR9EnykG7PqIVqWG7ElEGvQX25FaN59HJJRwqt70We6KaL20DfBBOQMzmeyH6yCWJXw1VrIkZz4XRSYW2xluRFm+daXhRMYGPW7D4CKGKEGq4/0YLADJzTwMO8qpU/7aq/aJMX9qmvKxn1Bb6U6dSmbxkgt2M1PBoWmB7E/tMkPifKYUeywJ0x4ecmUDOiamk6yCwRGhm/iCEkLghuOOwOz1ZkJxd+ow3hI4eWTHm7dOcq2x9Ofwu3zvflDUeUpkT4SP7k72MFIbChfqkpSO34YQb0TAoBDfrg39PGEq9KRd4Ik6+rJkDfzos9J87Wg0BBWEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gneoh49KDjf57QjQijgVAj5CWkwUT6arJHnz32E35uM=;
 b=oSUG2THPuXom3HRRluVsn/i+xucXn6fdsBLSx3XI4TzceWuH/QhqySEIFRU7tCosMYH/q0jh2PmSFCWdJFM097jmfObP0E0FD2nBrFGgOMHqHmq228lsTSJnTUpBkd7DER8tF9EfqvO2hWUwdxZB3W3+b0zce+8Zg+7iS2whBF8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS8PR08MB5910.eurprd08.prod.outlook.com (2603:10a6:20b:296::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 16:20:47 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8901.018; Tue, 1 Jul 2025
 16:20:46 +0000
Message-ID: <6eaaa2e4-9067-47bc-8dd4-d8ef56c26b3b@arm.com>
Date: Tue, 1 Jul 2025 21:50:38 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_mm=3A_limit_THP_alignment_=E2=80=93_per?=
 =?UTF-8?Q?formance_gain_observed_in_AI_inference_workloads?=
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, siddhartha@kenip.in
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, mgorman@suse.de
References: <d8ffe547-5516-43e5-9f33-56b2698a0b4f@arm.com>
 <ba2c89bd-88de-48f8-abd0-b62d8b1d50b3@lucifer.local>
 <5816677a-705e-4a8f-b598-d74ff6198a02@arm.com>
 <ee92d6a9-529a-4ac5-b3d0-0ff4e9085786@lucifer.local>
 <e7152150-2f3e-4ad7-a6c5-f4b77e5c0e05@arm.com>
 <f746d3aa-17e7-4b42-9e08-97cdb2cad89b@lucifer.local>
 <80b849d4-faf3-47a9-8b8c-e8053299cfb2@arm.com>
 <2e99712b-8dac-4762-9fc5-fe3ef569b65e@lucifer.local>
 <afe95bb0-185b-4c4a-ae41-e02457422cc3@arm.com>
 <787639a1e6a27c0f3b0e3ae658e1b8e7@kenip.in>
 <5c3d307f-d303-48c3-b730-99a83d4815ec@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <5c3d307f-d303-48c3-b730-99a83d4815ec@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::21) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS8PR08MB5910:EE_|DU2PEPF00028D04:EE_|DB9PR08MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ebda5f2-309b-4252-ee56-08ddb8bb4feb
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?OEw3SENSZWpsU0xMZGhObUFBNmJyclkyMUdWSUIvV0lqSU1DTkhYWVhCTjdV?=
 =?utf-8?B?SG4rZWZRVWVIaTg2WEJ1L0M0TnBBL2h4ZVlyVW1KbEEwdWpHV1RNZ2xJOU42?=
 =?utf-8?B?TVNDbGdndTNVcTZMcGJ6WHJSalFDWENoUUFYQ1ZyWndla1pvV3BuVWNJNzVr?=
 =?utf-8?B?ZmtpM1N1U0FHNjZ5SHJ2VHFWM3Y1aUZvOW5NaXZyNndHY1praUFzWW4zQVZZ?=
 =?utf-8?B?YVhzTElyMWpjR0lySVFPWFJOWFRLREo2UGI4cDRYQ3VrbnBzY3lkeVMvcE5C?=
 =?utf-8?B?bHYyeWtYbWo4UVZjYnByTGFJQjNlUDEwLytxTldiMjN6eEJhcWhnNWwyZDFR?=
 =?utf-8?B?UVorNDdrTDJtZ1BKOGRnbnVxbkhVdDJYRjBZVjZ6UVlybGJSdmpDbVgzRkt2?=
 =?utf-8?B?UEZGR2FSWXliVlRyNEc1L0V6eTJCT051WGpSdmd4YnUwRUd3cVhkeCtGdlQ3?=
 =?utf-8?B?bzd0Q2hiUS90dUtCYjM3eElYTVNaaTVxWU9Qdk12TmhlQ0Jaa29GRVZWNmN1?=
 =?utf-8?B?YStkYWszaWkwdzZORGMwU0N1Q0NpMmlYSFFTWEIxZmljclQ2M1ZLb0grakJV?=
 =?utf-8?B?OE5LaGpTWmp4a2U5MkN4bXdVdnV0U0lkd0MvYlU3WnpkYUdCbjk1ODgySHAr?=
 =?utf-8?B?VWdlS2tJcUZaQUYwWGo3N3FjTlZzT2ZZc2F5MmQyeXFhNXdIUk1XOUx6bUU3?=
 =?utf-8?B?NHRjbk93NzJ4MWh6bk1uOUhnZ3dINFBHSmJDZnRRdWVRK3Q3K2JmWEo1V3k1?=
 =?utf-8?B?RGI1UVNQaE9ndWFuckxDRll1eEduZnBGeTRkUnJxRDI4VFdRa0JOd3BPU0xJ?=
 =?utf-8?B?U2ZLeUNNT0NJNU9wWHo3MHVoQjlLd3p3OFNqVUZJdUdnaEtyd0pwVHJWTFpQ?=
 =?utf-8?B?ZUJ3SnVnT002VkxUYlUzeDhYb0xwOUhsenhmK3lTb3JhOTdyK2g1WHlRWU9W?=
 =?utf-8?B?Y3c0dWw1UXJTaEZRNGxLa1Y3b2taQTNOTnFPQzJVTVVkb3k5MUVpUzdncm9J?=
 =?utf-8?B?aWRpeGtCY29vMUhkeDlSclAvTENlcndJMmc1WENmNit4ZmN3RzQvbkdueEdq?=
 =?utf-8?B?VWpNQzdhUW9ldFNOUHF6UGR3TmpnREtMWUtuYkxJYWJGdzI5Ky9Na3pkRTlE?=
 =?utf-8?B?TDNyYXVFZWxqeE82TFYrK1NMV0hvZndCc3A5eWt4S01paGp2M0MxdzZvOXNz?=
 =?utf-8?B?RmNVMVcxYnJmVW1hdVZmN05nbUd4bGY0T1M0Z056UG1aR2tPRkNVSGtKMEVx?=
 =?utf-8?B?QklrUzc3NE9oV2FtSGJjb3MreGZCcUNVdkE2NjVCanJXSlNnUU9sQVRaOUQ2?=
 =?utf-8?B?SWVhTlF3M2ZzQytSZkdSMFN2S1grU1NLTXFiVjdIYk1VNDU3WDJ4VGRtTkN2?=
 =?utf-8?B?aG9IMHg2REloOGp2b2s0Q3BkeUh1N0tDVmhlQUhEdGo2K2tiVm5lVFdjR1Bp?=
 =?utf-8?B?d0oxMUFJeklmbmlsaGxqaVhKL3JNSDhMengvYlk0dkIrc2c0ZEcyYkZ3Y0pW?=
 =?utf-8?B?VDUxVng3QTZnV2M2Y1NSelJOZ1ZWSjYrWXFHdjN6MW9lV3ZPRWxGbmtwT1BT?=
 =?utf-8?B?UUlkcGNMMmtYVjBUT0szLzk0WjV1bzVreHJiSTJYVHFxUnBMYVhNS3FhQlNV?=
 =?utf-8?B?MUoxK3piQ2xZcUVzQzMyWkQ5b3FXU2RnOStSYVYzK0tzT0QzRzZsd3JyU2lU?=
 =?utf-8?B?S3ZoRFd3cXRxUTdvanVxREkralZmblo4QTZ5MHNMYXRNSXMxSnIyK2oxSUQv?=
 =?utf-8?B?TVpMenBSQVJCVWY1OXdrZ0VzYnRyYVZzMGZVc1RtSFJPNFpIeTJqMms3Zi9o?=
 =?utf-8?B?Y2hvSGE5aFFwTXR4dkJmbVpqUTQwV1d4bktFcU1Eb2FkeWdBcVpQZHB1TmhM?=
 =?utf-8?B?S2F6MHM3ZHE4M2RLSlVJOFBRUnArZ2dkRWxYTEp6cmNKb1RReVkzdmloc083?=
 =?utf-8?Q?yQZqyhp6lE8=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5910
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	42c26f56-a567-43cf-eb8c-08ddb8bb3c3f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|30052699003|14060799003|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDl6dGRDb0tlV1YxWFZqZ2l1VVJrVEp6VnpyUTgvM3RBUm0zL3lLRnpyc3NB?=
 =?utf-8?B?bkRCN0dzNWhVcHVnOHVMRGV6S25RSmdOUG5TYVpwdGNNVUU5ai9GWTVYTE9l?=
 =?utf-8?B?YjVEK3QxbXhMRm1UQjNqSFFOS1ZBV3JTY2VSNDdKM1AzSHFqRjhJUTZHNjd2?=
 =?utf-8?B?Nyt6Qm5ZaHdPWnQ1VFdGSjNNWUI0b2tPYmUzak5wVWpvTDFiZ0FXZjkzbzc1?=
 =?utf-8?B?VXg0VWhaTFlhclR5RHJKcndtM01kYm03SzJxQ0FhTUhwUnZRREprb3o3b3B2?=
 =?utf-8?B?bGtOa05SWE8wVi93aW1FWFFNUGVpTU41VXlvSVFISU0yYW0zditHTUlGQ09a?=
 =?utf-8?B?MSt1Q1Q4dXhkSzZIbTgyaTdBMzQwaWhxUENqcnRuUEFDbmlsMklaSWtGcEZT?=
 =?utf-8?B?NkhzR0ZieDFWazlPWGRaNVZUOFNpa0ZKQVI2T2xhNlhXQ2hPZ2hscmtaYTJo?=
 =?utf-8?B?NFRHQkNvbjhSRWtNZVM5QlozcjhNMG1RTEM3UVBjcnpvVHIyYnRoV1A5ZGFu?=
 =?utf-8?B?U0dkY3ZNQmxpenBBdWlFVldkVks1ZnJUVFJCSjZiUlMzaDdwSGlBb0pGcnRW?=
 =?utf-8?B?eTRhZCtnSGdWWUhqclVpVDA3ZU5xTy84aS9DQnZCSUlEWnkyOFlKdjdvT1g3?=
 =?utf-8?B?UXh3dytPZERpRjlvamhoZUJYbkFqU0VwWkxwVmtCenZOVlFuYXhJVnNHV3Z2?=
 =?utf-8?B?L0xTWnJlUmF3UEw0N1IybEhxU2VUanZTQ3pOZjN3TUNTRzUyVDZjSzZnU0Jn?=
 =?utf-8?B?ZFZFNkRXTEV0VDJEbTB1N091Zk5XUGY3OXA1TGl1bEpUeFNMQW8xM2ZVUTM2?=
 =?utf-8?B?MkNBSEpoT1FqRFBPY2kwdXZxODQ0NzF2R0RLckVRR2ZoZ0NicHQ1NjM5enQw?=
 =?utf-8?B?TkFrS1czM1JCTHlUK0ZycHZEUDk4Y24vN3BxRUZHTFBhRGQ0V09zNDJVdW5T?=
 =?utf-8?B?d3g4SlVsSHpIb1RuS0JZaXVEOW50ZXlVMzNuUFBDMFZvWUsxWndwSmMxWWla?=
 =?utf-8?B?UllPNlVUZlNzeUxlLzk0UVRpMVBXeXJhcFQxQ3hvaTBIUWtMdHNTdDE3Zk9U?=
 =?utf-8?B?M2pNeGhuS1poQWx6VWtheFdBa0NkbkVTVGIyWStEVDVhSFM3RUh1SXVTNUdT?=
 =?utf-8?B?SWkzMStqeG5WL3BoYU1LdlRIUThpb0NDekRDZFJpb0UvMUVDZlMxaEp1MndX?=
 =?utf-8?B?RW5IakxGR093bFAveXNyY042TzAzK1oyVlVKeDdtbzdGSTZkcW5ybjJUNlhJ?=
 =?utf-8?B?NjlHYjlLR1ZTRG1tSUw3OGlOL1ZwOXMxZUYrRno0TWZSajNOK1FLMUY4ODVt?=
 =?utf-8?B?K2gzd3BqTjdEMUs5eVRlaUM1a0RRUCtBOVlOWDY2Y0YwNGlKa25RNG9QUGlw?=
 =?utf-8?B?UzhnQ1BNczJWYUFoeUZ6eHA5Tm5ZdVR0d2JSd1Z0aHdZZGdsMVhFOWJSSzlQ?=
 =?utf-8?B?THpBV2R3RUxyek5YcTNRZ0cxU0c0T1liK2NLcEhZcVRpM09wT0E0VUh5N0JD?=
 =?utf-8?B?MlZoSm52c2NVVE1IZE5nTnFtQXovakkvV2VFZVlGbEFpSllJMlZmdGtFWVgy?=
 =?utf-8?B?UWcwcVV4M0dvZkczUXU3b2hlMHM2SDRaRmdLd2JSMjBuekJqcWRVMmN0clZz?=
 =?utf-8?B?Y084cnNTZUZtSjRuc1lwN2FqMCtPMHloWmlweER0YnQwa3dpaStkKytkZ0g1?=
 =?utf-8?B?SitweTlsZ3ZhY3hsNklQZ0VIcGpRcGZLcktGNHlDbDRlWDhhWGs5WXFyQUQ2?=
 =?utf-8?B?OExDUUJlMDFoR08zc2lVRGVCRE12ZTJTUDlReXl0cWZxeEplUml4dGY3NGtU?=
 =?utf-8?B?WDlLR0t0dDdoeTZRM1l2SjdmUjdIN25PR3dVZ0ptSnhOSkovUjR2YmI4UWcw?=
 =?utf-8?B?SWkyTUlWN1NLZmczeFRlU3ZkZkhWWjZlbmVYdG9kbjhiMHdVemFGQmVrbHJQ?=
 =?utf-8?B?Ymt4ZlFRQVIvaERVV2RCTzJ1M2RFYmd4aTZnVjU2N2dyUzdvSUMwZWFqam4v?=
 =?utf-8?B?SVM4OURrdUFwZmdNYWFmdDRZczlmYTIvT1NHaXBNK3FWaEJmQUR3azJuQnhO?=
 =?utf-8?Q?bGYW65?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(30052699003)(14060799003)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 16:21:19.4636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ebda5f2-309b-4252-ee56-08ddb8bb4feb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8292


On 01/07/25 6:09 pm, Lorenzo Stoakes wrote:
> On Tue, Jul 01, 2025 at 05:45:51PM +0530, siddhartha@kenip.in wrote:
>> 🧩 1. Does the patch cause VMAs to be merged eventually?
>> You're correct: VMA merging only happens at mmap() time (via
>> __mmap_region()). What the patch affects is the behavior of
>> thp_get_unmapped_area_vmflags() before the mmap is placed.
> [...]
>
>> 📐 2. Why aren’t the VMAs mergeable before the patch?
>> Great question. Even if the VMA flags are identical, gaps introduced by
>> forced alignment from get_unmapped_area() break the precondition for
>> merging:
> [...]
>
>> 💡 4. Why this patch complements Rik’s rather than contradicts it:
> I'm really perplexed as to why you felt the need to (seemingly via LLM)
> reply with the explanation I've already provided here?...
>
> There's errors in things you say here too.
>
> With respect, please don't do this.
>
> (I'm the co-maintainer of pretty much all the relevant code here and wrote
> the VMA merge logic you're referring to.)
>
>> 🤖 3. How does this impact AI workloads like Hugging Face Transformers?
>> Tokenization and dynamic batching create non-deterministic memory allocation
>> patterns:
>>
>> Models like BERT and T5 dynamically allocate intermediate buffers per
>> token-length, batch size, and attention window.
>>
>> Hugging Face + ONNX Runtime uses multiple small-ish anonymous mmap()s, often
>> 512KB–1.8MB.
>>
>> These allocations come in bursts — but due to forced alignment, the kernel
>> was placing them with artificial gaps, defeating THP eligibility entirely.
>>
>> By not force-aligning non-PMD-sized mappings, we avoid injecting gaps. The
>> result is that:
>>
>> a. VMAs remain adjacent → mergeable
>>
>> b. Physical memory is contiguous → eligible for khugepaged collapse
>>
>> c. THP utilization increases → fewer TLB misses → lower latency → higher
>> throughput
>>
> This is very useful information and it's appreciated! Let's not drown this
> out with restatements of stuff already covered.
>
>> ⚙️ 5. mTHP note
>> Although this patch doesn’t target mTHP directly, I believe a similar logic
>> tweak could apply there too — especially with shmem-backed workloads (common
>> in model servers using shared tensor memory). I’d be happy to help test any
>> changes proposed there to derive the consequent results.
> Dev - could we hold off on any effort to do something like this until I've
> had a chance to refactor THP somewhat? This is already a mess and I'd like
> to avoid us piling on more complexity.
>
> We can revisit this at a later stage.

Yes of course. I had run a small benchmark on a quick dumb patch I wrote and I
don't see any measurable perf improvement, probably because the highest THP order
getting chosen is always PMD size.

Out of curiosity, where do you plan to do the refactoring?

>
>> Thanks again for the detailed discussion. Let me know if you’d like a trace
>> or VMA map from a Hugging Face benchmarked run (happy to generate one
>> locally).
>>
> Thanks! Much appreciated.
>
> Cheers, Lorenzo
