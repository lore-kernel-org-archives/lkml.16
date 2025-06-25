Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013064.outbound.protection.outlook.com [40.107.159.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1ECE307487
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.64
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750850220; cv=fail; b=pFwZUPsnu6sKVBBFMPn4rrVjT7vrNh4J/hw8cPCgDtTvLuktBN/D5ItIoxi8/lu2bXs3+erHEb8kDuyoKp3TvixS3hfmeIKuifx/A4mNvCWETkldtbjJgvcCN2TKsiwa+H0iSbZBgrCIkUMchQAwgk10afAXsTkUS4VJ5l3bh2Q=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750850220; c=relaxed/simple;
	bh=H4f3Ai2XTNgC8PdBvQSvgg7BugBxaJb7yk5Bj8jDfnI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IcUn1SnXGtigTbsV220mIQcwU+3mENgFIbLf3CvF8K1+d/xFU+/z0/RxZj5v3zYExG4eenCFRHjWnYjf4Mje0EdUyTzmctEunV9zeIVkWNiWMUpn8hwiXeX3SUOa7srmVan39d+d4Sb0RKv1Ox3sDApV5iY9ytmrwKNMbI9NMeA=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=BbW6B5kN; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=BbW6B5kN; arc=fail smtp.client-ip=40.107.159.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="BbW6B5kN";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="BbW6B5kN"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bGKe/osHKc7DsW80Nx99kyfzXFaZGmEYiCfW75hD6n+Mn2P49U844+N/CV9ZfYgX+S1zm3Jk5SvBI0P/L7Ul+ZkdpcNrgrm0NKlnNu1QUObSuwKIZt3vI4qOf3dLO25swwymYd7K59XQnWYAl0gHBRcPAWssE/BHTJdhk/XZBMqjEEXNiLxA0/Xy273T76zfbRDfyYW/R6deE/H5XyM+aI3IKPCPZ6kc1jA8L2kfowZZZGppa5GcKBS9ehH5zryeyO6QKCt7LeEAcXgwVn4D4aLwBIrNZ3rUZoWE4qw8pJf5/DqkiUKKV92heVjapYbBAIykGem9bWwS/YwUw607Hw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5c2+qKpSqdiaFxU7jGzAqbm3CdxdOBKFnkjpLPu8Vhw=;
 b=t/5Yg89iQlj2R45RUGmEPWImEh2PbdesULvYCW7c/+bLXJobVrzKvuadJrmVnqbPGNl8IudpyVOEwzGvRZqVn0a0C0y2WDuZUC/wYae5229HvcRwwsJGZvhqxQrgQISW3HoXtycVRHg7QUEz7EZvOhNYG/+nwLCxVIfWPZjXBA1ZYHQAOeW2G8aZ9Sv67+lgYpK3XTKXK0JoDUBahkv7h1BAV3enQxFrxyWv9ms/nUt567tEQvUidzxttIay87CYqLZ14EhuD2BxO+2lm6RyC315lDgtogjtFM3yVIEwtQ19V9uIoBE7vhU10A1nyHUu3ZRdz8iH1jzfmwkyAektKA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5c2+qKpSqdiaFxU7jGzAqbm3CdxdOBKFnkjpLPu8Vhw=;
 b=BbW6B5kNwjnef8xEg0QKrhCLtNhnZNpBoSBXoUghnZCfb2DrVK15VwoNOuWnObwQPLeveMOH8wpSZ6nCDjyUIX4DpHpiLdhjMP3OpbjUT9qWMcwQffiCYRl8L+dvKMWNNDtFJoDBaEiTw0fuFZnhTHHymUTPVVhlNYtkiu0XlqU=
Received: from AM0PR02CA0103.eurprd02.prod.outlook.com (2603:10a6:208:154::44)
 by GV2PR08MB8749.eurprd08.prod.outlook.com (2603:10a6:150:b9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 11:16:54 +0000
Received: from AMS0EPF000001A3.eurprd05.prod.outlook.com
 (2603:10a6:208:154:cafe::9e) by AM0PR02CA0103.outlook.office365.com
 (2603:10a6:208:154::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Wed,
 25 Jun 2025 11:16:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A3.mail.protection.outlook.com (10.167.16.228) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Wed, 25 Jun 2025 11:16:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qoca+dg1tGyWwdRxOWkblZE+iT4t3BTCi3Hv0lfaphjPCwx2lDR5q6k3Wb61+u8HjXdecUT06gL6TbxhaBoIE+G6ZctcvxTGDM36nN2Py3ePqShrre+9EkOuuvnz8/dOzi8Yea5gLrz39jmU9RooaPjQUrtdnBdy7huvd0LBamP421QEU5rIsw4OX+D5x6seWHkQRNaTOUdYOfAkcOWkW9ujn3NnL4HK8z0XKyQ4PnNz7Cmvlmhp6maT4j+pU6ZogsT2JrcH97Fsk68FQT1c/Plar+ELriKdFf07ZS85hufXb0YNgfJHP1p4Q1iMl/hX4vH+0n4D+IvQgpxrgqYsaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5c2+qKpSqdiaFxU7jGzAqbm3CdxdOBKFnkjpLPu8Vhw=;
 b=JbqWHLSG40K94SgbHMBin4wGgTRX4tUfwp5Hq6dqBaTwVLFbnTTpxudbBauwynd0cFKq8n+f5GhFV2wfveTqNuAyjTlasE9SrFfoIEGsDJlrEjmFSMEhM4/ouX61lyh2qkyQB6UQJj7/Q7vqSuYSRnj8hF5Bbe2/fAKH9r9CQTW2E8A9HGPh/kRfkjXE/86s5pPUAsD+vpytRnv5xUSAxUncXYAV51lOL1ZUGnoTJyCMH9yp74pvZJ/spfKTV+wNY7HDt9xrRFRyIFPErfc6Ep+BYaMcOVswg62GfJol5a8zhA7wsWrZjtHJuyDbD6otuAA5x8060kQXENgMXujwRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5c2+qKpSqdiaFxU7jGzAqbm3CdxdOBKFnkjpLPu8Vhw=;
 b=BbW6B5kNwjnef8xEg0QKrhCLtNhnZNpBoSBXoUghnZCfb2DrVK15VwoNOuWnObwQPLeveMOH8wpSZ6nCDjyUIX4DpHpiLdhjMP3OpbjUT9qWMcwQffiCYRl8L+dvKMWNNDtFJoDBaEiTw0fuFZnhTHHymUTPVVhlNYtkiu0XlqU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB7114.eurprd08.prod.outlook.com (2603:10a6:10:2c7::19)
 by DBAPR08MB5717.eurprd08.prod.outlook.com (2603:10a6:10:1ae::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 11:16:18 +0000
Received: from DB9PR08MB7114.eurprd08.prod.outlook.com
 ([fe80::515:9f73:5a61:fddb]) by DB9PR08MB7114.eurprd08.prod.outlook.com
 ([fe80::515:9f73:5a61:fddb%7]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 11:16:18 +0000
Message-ID: <f1000755-15e6-4352-bf85-09c8886c40cd@arm.com>
Date: Wed, 25 Jun 2025 16:46:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: pageattr: Enable huge-vmalloc permission
 change
To: Ryan Roberts <ryan.roberts@arm.com>, akpm@linux-foundation.org,
 david@redhat.com, catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 yang@os.amperecomputing.com, anshuman.khandual@arm.com
References: <20250613134352.65994-1-dev.jain@arm.com>
 <20250613134352.65994-3-dev.jain@arm.com>
 <400b6d4e-bf10-4b89-bcbe-2375b1972220@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <400b6d4e-bf10-4b89-bcbe-2375b1972220@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::12) To DB9PR08MB7114.eurprd08.prod.outlook.com
 (2603:10a6:10:2c7::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DB9PR08MB7114:EE_|DBAPR08MB5717:EE_|AMS0EPF000001A3:EE_|GV2PR08MB8749:EE_
X-MS-Office365-Filtering-Correlation-Id: cc3f55dd-47cd-4e74-f1a7-08ddb3d9c90d
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?R0JiZ1NQZ050WHJpS0hTeXFiNUMweWJzNXdZcTZhMXYzMkU3eTBUUVdSOTJm?=
 =?utf-8?B?ckM3c1pLOEdwN01saUZWV05Rd2JaVmZjdC96enB3b1AyMDMrKzV0VjdrdjRs?=
 =?utf-8?B?SEJSSEQyQVAwN2N4c0gyVU5sdU0ydUtPcXBBdzlvUkV4cElyMWhVSVZWQ0Nu?=
 =?utf-8?B?aXpER3VWNnNiSVBWWUl3UWM2Y3BoNEZjV2dtM1I4V1lKeTFMQ0hzbUMrZjBQ?=
 =?utf-8?B?T2JzLzFPZzNOWE9PY2hjQ1JaSG4wL2pMRExoSHl4d3plSVdpazBLcXE2djJv?=
 =?utf-8?B?dWVoVUJxeFFkb041N05lMlJXUGxuLytEQm53WjBWaTN0V3dRZFoyRnRzQ2NS?=
 =?utf-8?B?NFBoNGhoRFYzMjF6VWN0MFRnZEl6anYrejF1VjR6NlYwL2xINHN0dVdranoz?=
 =?utf-8?B?VFhZQzNrZ2ZneDB3bVVEUDBPaWNlS3o5dnpoQmpNZEZ6RXBxN1RtT2RRdXds?=
 =?utf-8?B?Ky9QMy8xSE0zWmNtM1RnaTNLbGNVOUx0d3lkUWV3N05ScGRJb0p4SXQ3MFEw?=
 =?utf-8?B?WWowM3VKcjVBS3BnWng1a1d0blVSbGNUN1NaRW1ZVjR6Z21oYlZjV25aTldG?=
 =?utf-8?B?UU9jak5raHZQTGh2VyswL3BPdWhLdFptaTA5cU03ZkRwN3Y1WWM3cllpRHp0?=
 =?utf-8?B?YjYraUgzMDVTbVZxRTFzODdDN0xDY2M2UjlaalhvZ1FpNFlsdjJvd1hlaW1Q?=
 =?utf-8?B?NnprQXRDS2IxNEhtZGNRaktSZjhlWmhhRDlCYnFkK2p5SWFYMmFLK0hCQXR6?=
 =?utf-8?B?UElJdnhqVnlDOW14ODd5WTZaVmxiUmE4MHM1V3piYjJNY2E1Ny9CeDN3a01m?=
 =?utf-8?B?RzR3MVJsb2xsTlREaFFLYWRXNVBjQW94YWxqVTdhdk1BdGNPTWJLSlN0NEli?=
 =?utf-8?B?ZWlOUzNLMkJpeVRGZFdscHJveGM2Y3hlRGZiekxhTjljNzMvMm04cHVub0hK?=
 =?utf-8?B?L0tJajl2RFAvVHJrbC8zM1FFdmJyUC9xT1o2bTkydUhicnpnenQ1UkhCWkpi?=
 =?utf-8?B?U2lSM2lwU3hRUlByT1dZaDFhWktXVEZDbmpWNFl3bU5KOWtSZUhrOXRWS2N4?=
 =?utf-8?B?aGF4cTY0TmxuMm1jU1hoNXo3RDM4QjFQM05wRU9iRFVQZDVIVkd1R2I1YUtY?=
 =?utf-8?B?UVdnNDhBRnQrWStnSzRxUlRoNTBPRDczemEzQUc0dDBDN3diSUJSQ01mSVA5?=
 =?utf-8?B?VE1FeE54dGhqT0cvT3lreGhlOTkvYVBhYjBLaUYrd2hmOU1DNnVUTTRiTU1w?=
 =?utf-8?B?RDhPckJjOWhVQSs1NTdObHEySHArSE51c0xZOXhIS0hVcHhXenJ3SGlWdUhz?=
 =?utf-8?B?RWZmVVdFSEd2YXdjdk9MTHU5M0IvOGI3WE5yT04zdmxNRktMa1E4MjNtSDNt?=
 =?utf-8?B?WTB3bWZIWnFvTVdhWFVyc2VwNElscUxGK1NxMmZwK3A4R1pLblF1VEUwa0FS?=
 =?utf-8?B?N1l4cDU1ZnJRMVR5UCtOZEVuQ1ZqZHdKQ1BqV3Y1eE94OXdsQm9HL0kxaFJU?=
 =?utf-8?B?ZGtjdWIxVnJJS25WdEFkVk9IT2F4a2NVTGVMdStJckJVZHFRb0d2N1dWdVpK?=
 =?utf-8?B?T2VSdkw1cDl6R2FyNlkxVzhhQVVUSFpRR1htdlY1UzU2UVp5QngvOGFKak9m?=
 =?utf-8?B?aVk2NzBxTE51ODFYNFM1bUVUcGYxNXFab0psZGp6MFdLUFYzQkpHS3FTOXhj?=
 =?utf-8?B?cnN4S002b3hFMXhCUDlFSDdUbXdZVEdvSTh5V3dkVkNPWWxQcVY2d1h0UVg0?=
 =?utf-8?B?dnl6ZE5nSXpUWlpjNzYwSmc1ZXBvdFhYVHNTUFVkazdDaWU4aHNXV3IvODRa?=
 =?utf-8?B?RjNjaS90OVRXbFBjSHZBbGNselpsejJLZTdVM1FHd2FBWDk1dDd4cHFFOXJB?=
 =?utf-8?B?UVNkSjVnVmw2eUpvdjJUUnp1VFRtZ3VqaGNTN1M5UEM0bmV4UUJQQU4zQ3g4?=
 =?utf-8?Q?brbKHOwQaH0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7114.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5717
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b1c3aa18-02ab-4df2-0cea-08ddb3d9b50a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|35042699022|14060799003|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0pFbDBRZzBxMG1IUFFaMlNBOXU5ajVXM1U3ZmQxTkI0a2tpNHdteld0R3Z3?=
 =?utf-8?B?UXUzR1RBUjRCMEZXNmhZNFJZVHFxalVqWHpKd2JZUUxpVVJZSVg4enFPT25I?=
 =?utf-8?B?WVhWd3RTYURuTHozMS9SM0hVVGowallYeHZ6VzNvQzROejcvNDgzYUtuYXRK?=
 =?utf-8?B?TnlvT3h0dzlVWE1RM0hVZXlhUWwxWm5JL1o3Q01VTFpqQmJxczJhQkpiTnc2?=
 =?utf-8?B?VU4xYWFTVDEzOExCV1p0UnNGY2dRYUx0QUlwVkc5cVhTTjhweGh1UDBMTEE3?=
 =?utf-8?B?bVY5T0xiakhzb0NXS2wzay81NGRaNmdRSUdMaklKWmxEWU9Da0VZMTNMU0Jj?=
 =?utf-8?B?OHA5RGhodS9MQUdJNStIRGF0Z3BpKzhTQy83T0pYai9HT3ZITHc2aHZxemNm?=
 =?utf-8?B?dTlPTkRCZ1FNSVZNUkVaRGxmclA5dlRJVU9WdUpXWmFMZGwwVzdXRmhtYUZ0?=
 =?utf-8?B?WWdLS2VpT2pjcTljQ3pwRDl5SXErWk9oWTdlWGdyRk9PZC9LbndMd0tTcWNx?=
 =?utf-8?B?R3IyakVtZG5JTFZLZkYzdVpoaTc3RXJUKzY1UjV4Zy9QendIODRXRkVINUZF?=
 =?utf-8?B?K1k5dXgzWlI2SHZGRlliMEl2cVVmeHZLeEhjQS8zRzFKU1NQZ3hHaE5SdlNl?=
 =?utf-8?B?eks3Z1VMazlDM3pVcFp3UFFJR2tSNDZTZEZhbjFrQUNKbGlTNktTNFIrejQx?=
 =?utf-8?B?enJEWk5tT2NyOVhYUjZtUjZsaVhocmxWTVhEZzI2T1JnZHNkTDBPZG1sbDJ6?=
 =?utf-8?B?czMzSTVRWm81aElHRVFSNnh5VGFJSVFXcGdtYi9zT1dWOVZ2bk1PYTBQNHJT?=
 =?utf-8?B?ZlE5Vm1OK3pQTVZKeW1ONHRLSEV2MW1JUUVPMlF5MkRKTUswZ1lvRVlHQ1pi?=
 =?utf-8?B?cTJaQi9la2k4cEI0UytGcUp0M3B6ejFxNU94VEQ2Q0RVb3hwUkI0SXV0WHIy?=
 =?utf-8?B?Q0VKa2hEQjNQc0dRT0xoMmdCWWZuMVB6RllPVGg5ZmRRL3Z3M3BsREVkRlQw?=
 =?utf-8?B?MWpVVHMwVDdUWjhBSFUwU1dmS3loQXBoU0g3NzdHMGZtS0dwcnZsbzhYU21J?=
 =?utf-8?B?aGl3SHp3N1M1NWhDMUQ5MFl1ZUdqaXA1a01BRGI4RDBWZjh3M1crUzBNc2lO?=
 =?utf-8?B?NUJsRWJLNkI4QVFUZUdRWDRxdDV1U002QzhRMTJGSTVQa1FJQlY2UHA2R1lQ?=
 =?utf-8?B?YzJYSGVMMThycExtaGoxem4yVWFWQTBocmY0NnNOa3FSUjBlYzE0UXRCNysy?=
 =?utf-8?B?OFNSSFRSd0V1SVRYR3pmakJaa3NZUGFvUEFBUlc5TDhreXc1RjVaV2daOEll?=
 =?utf-8?B?aFFrYVFQRCs5bUFjMWxvOVF5Y000dUpUYmZqNllpazU2a0ZGdWp6aHpnZ2V4?=
 =?utf-8?B?WWNiTk95RFo4TlNXVSttSVI5Q0JaL3p1Y0FJcGxURTdNOWJiNWoyazNuY1RH?=
 =?utf-8?B?Z3grSFlVNU4yYThLQ3RzeTFvaDB5d3VhYWZtQk4vT3drUm1FV2hzb0tFZ1JE?=
 =?utf-8?B?TnhLRjdiN2ZWZmxUd2QxQThYaWtlR0lPa2VDT0ZERG9KT3BSaFVrcHZObE8x?=
 =?utf-8?B?TjdRZmRCUUFObEI2citadkJLTXZRY083TUM3MCsxZG1VclhYR1BRSUNwZ21m?=
 =?utf-8?B?VW01Ris1NkoxbG5IZGhFUWZnQm1GUUJUM3FTenFjcGhib1BhUGJ2WGhyWDRq?=
 =?utf-8?B?S0ltaGpmL24yaUdhdFpkU3hiVlY0Z3lVRlVvNUI5eVkrS0NCNktPS0x0dC9m?=
 =?utf-8?B?djdVVldjcm9RMlZTL2NBeFpUd0k0TjJZSkdmTlRiTDJmTmlYUGM5TUxmUWkv?=
 =?utf-8?B?RExqc0F3YmhHZkMzMkNGRFlpQWZ5Ty94aUdEOFNybTVtbjlYMnA2c2ErTGxa?=
 =?utf-8?B?S2ErbE1HUm5iamxIS3BlWCtSckpkbXpKWnh5VWJLTXhmc2luNDdIdXRIcmVN?=
 =?utf-8?B?cER1NVdPenlpdWI3dE42bWhXWmxmSEI5cEgyVDlnUHFMVmhkakJvSithWk8r?=
 =?utf-8?B?STFUVEZ5aDJ1bHBEaVpCUUk5MUhHbUFPZU9ZZitoMHR0V1NBS3NzS2RYaTJO?=
 =?utf-8?Q?ipeqga?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(35042699022)(14060799003)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 11:16:51.7925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc3f55dd-47cd-4e74-f1a7-08ddb3d9c90d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8749


On 25/06/25 4:38 pm, Ryan Roberts wrote:
> On 13/06/2025 14:43, Dev Jain wrote:
>> Commit fcf8dda8cc48 ("arm64: pageattr: Explicitly bail out when changing
>> permissions for vmalloc_huge mappings") disallowed changing permissions
>> for vmalloc-huge mappings. The motivation of this was to enforce an API
>> requirement and explicitly tell the caller that it is unsafe to change
>> permissions for block mappings since splitting may be required, which
>> cannot be handled safely on an arm64 system in absence of BBML2.
>>
>> This patch effectively partially reverts this commit, since patch 1
>> will now enable permission changes on kernel block mappings, thus,
>> through change_memory_common(), enable permission changes for vmalloc-huge
>> mappings. Any caller "misusing" the API, in the sense, calling it for
>> a partial block mapping, will receive an error code of -EINVAL via
>> the pagewalk callbacks, thus reverting to the behaviour of the API
>> itself returning -EINVAL, through apply_to_page_range returning -EINVAL
>> in case of block mappings, the difference now being, the -EINVAL is
>> restricted to playing permission games on partial block mappings
>> courtesy of patch 1.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   arch/arm64/mm/pageattr.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>> index cfc5279f27a2..66676f7f432a 100644
>> --- a/arch/arm64/mm/pageattr.c
>> +++ b/arch/arm64/mm/pageattr.c
>> @@ -195,8 +195,6 @@ static int change_memory_common(unsigned long addr, int numpages,
>>   	 * we are operating on does not result in such splitting.
>>   	 *
>>   	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
>> -	 * Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
>> -	 * mappings are updated and splitting is never needed.
>>   	 *
>>   	 * So check whether the [addr, addr + size) interval is entirely
>>   	 * covered by precisely one VM area that has the VM_ALLOC flag set.
>> @@ -204,7 +202,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>>   	area = find_vm_area((void *)addr);
>>   	if (!area ||
>>   	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
>> -	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
>> +	    !(area->flags & VM_ALLOC))
>>   		return -EINVAL;
>>   
>>   	if (!numpages)
> I'd be inclined to leave this restriction in place for now. It is not useful
> until we have context of the full vmalloc-huge-by-default series, I don't think?

Okay.

