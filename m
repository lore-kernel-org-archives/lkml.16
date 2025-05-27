Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2082.outbound.protection.outlook.com [40.107.103.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F0F15E5DC
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 03:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.82
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748316585; cv=fail; b=JxuE+OoFyEUWgNWbJYm8dQqxqEpvPKvIQZv6YyJfqR5NaWQbzMY/TIn9l4fiLbGNOdksByqTM4dugo7nS/TvvTXbGVSaMm4DEKNMRi7ZgkFAvkPBCIznrZOQVTKqkqqdEthamSRvcm2566qdZHXisNFfwqz6kJsTtK4lrEX2FZk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748316585; c=relaxed/simple;
	bh=mLS2SzhNwAu6YJMcbaitrSGBFVbMztJ8MIHv8fxOUeA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ptYHkz4MswRFKKC9G28qoZU2A0yTy3y7SzWD4RnoD0maff6NaBWt/6ST6RwNNQBekBAcwSyIWm465V1C1rZHfO5kO5nhy4HLDdpDWyvL+gWh/iU5nf2BDOQIlLelH+gBoApdbx/7iOe85hpbH85xiuv7HR22Vm/cqkHr3cmq9FE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=XU5QzBDS; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=XU5QzBDS; arc=fail smtp.client-ip=40.107.103.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XU5QzBDS";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XU5QzBDS"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TgMD3QZdymarw5QhHwK9FgDuwwQawPL+fM/3bHCN97VKeCEHBf6hXMOPb1eJmTm2tQfOvxIE0UrTgf4R4NL1O8Y5nnI0pVW3ajh6mlWDeVAv2hPDBK89tqA1Pu1PCB4J7iJlrlg7dESaPoMBLioVmJZHJBJHwUNW8alRWzftVCW8AXY/QqbG5cZajMUihof02PRNE2P0r1QNGmKWyYxnM6wJReFRHCZPLFBiZznXFnoa7meZi0x4850j9TWwyDrxJ099gHtzizt4c20C6Jk50SJZWBzPyJSP1c8RSTcljoM+z6t+t8vjaD1rAwwjXyuF+o75UkZ/O1fWjXMR6mZrGg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLS2SzhNwAu6YJMcbaitrSGBFVbMztJ8MIHv8fxOUeA=;
 b=pPxbBp+iEy6hz9uVl9VmO7fH3Q0ExoQgCEfEVS51YO39UVncqye+miQ1x1M5fhrut43Qkvk2931wEhq+Llk5d/ajNrk9hueGRRrlmetpsGmZruI1dTxqxX9Cs6HOGUd+c13jT4AV6wzwD9GG2sNBfzgOh4YWs3q/1ZcKtsS6Dgdw28NPaSDgJg5ccwD86zLcpSAK5z9NOsLwkXH6U0lCOuYxWzZ8NYKsXZFXOqkBKgamlz460bm47jXXwokcKimr+mjaiMsP4Mwrb+J1y4B9nU7Edb8iCSeDxM42O9xspXR6VKGBvEzofBy7sl9MM5QOhZIjw571HuBkJVrnBHUiXg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLS2SzhNwAu6YJMcbaitrSGBFVbMztJ8MIHv8fxOUeA=;
 b=XU5QzBDSrxgdZkicY7KFdKzxI0kUWi+e8/lkIRmqN+OXSgMzsJlcuF3IDVuiw1taORXs3ATNTphwP/0ERlW1j8HfgTqniKQY+EQEttERwmIbUvfczAIuq1ZIxDRXFNW6Wdc7tr3TptnPEV3ymuNLqOLg9JKbConEmaZtBcBnhLo=
Received: from DU7P191CA0022.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::22)
 by DU5PR08MB10823.eurprd08.prod.outlook.com (2603:10a6:10:528::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 03:29:36 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::69) by DU7P191CA0022.outlook.office365.com
 (2603:10a6:10:54e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.27 via Frontend Transport; Tue,
 27 May 2025 03:29:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Tue, 27 May 2025 03:29:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y4egl+dHw7wKwmJXQhMNLCx1L6NV98x/zA9joJy/7ln87dTzLpUK/xZONfE98d7TKkavHbQiQfOjxY1mqEiDTmJ8Y1cVkJEgMj1HcR1aPe9Mk2JvtbDjFse/h5Ci6FrH6IWvqNX3YulOt8WVFiWZcDYMOTUWt344/Cak/qs9NhPXxKSTt54Hyzv3DkqOn9SPkSuT7S4RVues9iofez3YElBPSAn1SMSMeRar1EFjZADsH4e0nlqzIGWJnnE2tZdi1grHsgaCvXHJPZeonEFD1mu2ude846YCngHZUmK3BSlgmpG0mYq5lJ5hfrlw61V128dPqUp/JAqMIPIo3dANrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLS2SzhNwAu6YJMcbaitrSGBFVbMztJ8MIHv8fxOUeA=;
 b=Ejsu2NhRp2jhUeoTvK7n7oltMrCBuQJh3iBnTEaE8ZzW2NaxdvSrRf2W3fK/s1uiDVIM9b+n/rNik5XPzu1KpdjJxnB2Dq4B8zrJ8LhCmj/HxbAAprGZBYRR9u8EwkZrc/8cSYsufKOR7tW4dTAahovjGXE2+szc8cpKyNm+xyDN9UqVq4tslzwcOwO/fCkBwBfBd2vsh4NS6OCYKbttnm2ki7MxeVDoghrejNqXbuHOJH0j0qmIg9PMbxQwxJDI+hYeipUxi4CZiKpfBByUBLh7iGIxkMXrnTOCeTu//jiUIpGyisHfvse/AoGHOR3fBWV57HCm923hvNKDpC5pBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLS2SzhNwAu6YJMcbaitrSGBFVbMztJ8MIHv8fxOUeA=;
 b=XU5QzBDSrxgdZkicY7KFdKzxI0kUWi+e8/lkIRmqN+OXSgMzsJlcuF3IDVuiw1taORXs3ATNTphwP/0ERlW1j8HfgTqniKQY+EQEttERwmIbUvfczAIuq1ZIxDRXFNW6Wdc7tr3TptnPEV3ymuNLqOLg9JKbConEmaZtBcBnhLo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS8PR08MB6310.eurprd08.prod.outlook.com (2603:10a6:20b:292::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Tue, 27 May
 2025 03:29:02 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 03:29:02 +0000
Message-ID: <4142626f-0c99-401a-8e1e-b5b5c739ebee@arm.com>
Date: Tue, 27 May 2025 08:58:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/2] mm/khugepaged: clean up refcount check using
 folio_expected_ref_count()
To: Shivank Garg <shivankg@amd.com>, akpm@linux-foundation.org,
 david@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, fengwei.yin@intel.com, bharata@amd.com
References: <20250526182818.37978-1-shivankg@amd.com>
 <20250526182818.37978-2-shivankg@amd.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250526182818.37978-2-shivankg@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::7) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS8PR08MB6310:EE_|DB5PEPF00014B88:EE_|DU5PR08MB10823:EE_
X-MS-Office365-Filtering-Correlation-Id: c853b53f-a50c-4eac-8e9c-08dd9cceb3f5
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Y09iMnFUczRabjNoVGYxU3U4Tlh3VzJ4VUZmYllJMHYwVDNtUm1oY0UyVkNV?=
 =?utf-8?B?TW8xb2FHelVXZUFmT0toK3N2eHFSTnk0QWdBekdrZTdNTVo0UE1CRk1wWTVL?=
 =?utf-8?B?Z3hETDB3L0tRQXptZE5FbUlPQ3hMbWpPZEN1VWdQRkZQYWJvNy9ITE80eWs1?=
 =?utf-8?B?Wm5HejM3NjRGcE1BOTQzZXFUby9RYitRTkhMS0RUTzVKUmxOemVMUTIxZlNO?=
 =?utf-8?B?azNmMDBTd1NTT3NBOFRpUnFkVGwyT25lSnh1UFo5ckRTai9yMWt3VytJcjd4?=
 =?utf-8?B?WEdaWlprQVRuMWFJSDNUcVRnMWxDdzdvYVFBQ1BkU2pCYUhjQmJKSVp5Sk8v?=
 =?utf-8?B?QjRBRlJmYnpjTCthYk9lWnlTbU1WbUlrbThlbjh0Y1BGQkpwYVF3T2lSWllS?=
 =?utf-8?B?ZWRMaTZ6aVM4UzJIZkM4ZEVsSEIyaGR1TXBaSi9oSU9YdXAxZGFIWkVFajJO?=
 =?utf-8?B?ZHFLVXlyOGpzR0phNWQxb2RYUHhVTDhxckptYkJGWXQxY3BjNUg5dmk5bHIr?=
 =?utf-8?B?NjJ3RU9RWWgxK3YyOEpaaGJTdVRxQ0NKS2VBSlZvU0EzdUNadk83eW1ZN2pI?=
 =?utf-8?B?c2dneEw0NFJJdFVNZER3TklVRFZUZkM1VVZNakZlaXFPUE5sSCsrZzV6eDRi?=
 =?utf-8?B?ckQ4ZW1vY3l4WjY5c0ltOURyUVd3bTViRVhTMnpPb2lJMndzaS9lK3A0Tm9t?=
 =?utf-8?B?MURsY1VPR1Byalorek1ac1VJY0ZtK2t0M0JMa0F0T2hwNm5SRGk4d1RxTzhZ?=
 =?utf-8?B?VndCa3hHd2MyN2pQcjFXR2ZpQS9hZEg4cU94dDB0WDZHYTJYS1Vubk9RMDBF?=
 =?utf-8?B?ZmFKZFFjRzRlNDJZMENnTGNUeklYdE51elVpU2lpUVZTUUo5bmd2YUFBL0kw?=
 =?utf-8?B?YXlpaytnS3lCWTlGb3dmRmFmVmJMSkhKUHhMWXdvbTFQWlZuZzFQZWlpMHVu?=
 =?utf-8?B?bWhwQVJGUU5SamxrUTJjOG1DazNkcnVDQTFaemZqcVUrYTVIcjMzbDVDQmhP?=
 =?utf-8?B?THFPVEx6blI5SWVTaURUOXZtVFVLcTlTa2Z2akIyam1rVjl1SVZJRkFkdlJM?=
 =?utf-8?B?M3p4dk5EUDgvWWJ4ZHdkamJsRUdnZUkza2tsT3dtOFo3cnRrZ3lzeiszemdS?=
 =?utf-8?B?dnJXLzdNV3U0alF0NmtrTkhZYXRZbnpkdy81V1pIeDEyS05QM0lkU09ua0x6?=
 =?utf-8?B?NjNyUzM1WlFmdFVidUYxblFBMlZkNHhQb01IWit2L29idVVpNE9sWkN0K2t4?=
 =?utf-8?B?SEZibnFsV0trYnFHa1hJOWNIRDFDVzFaZ2tHdXJBdHBwSnd4MUR6OGk1M0xD?=
 =?utf-8?B?NzVFNUpZZG54aVFhb0tDTm1pNHJOeVBVaXdkUC8xTVJTNU9POU5xODNVSUhQ?=
 =?utf-8?B?dzJtZGdSaEVGcExhRkl3S2swQTcyZlRpMVNhdVFZQ1p1MG5zeWJlSjdEUEhN?=
 =?utf-8?B?M3FMWHlEc2RRMzBwQXhYNXdDaEI5VEJMa2M3NVB0WExjN1IxRGNwMVZDT0xZ?=
 =?utf-8?B?RVBydTRwZnJ0aFVHT2VhaEx0cWY5cndRTkxuZHVPR1FtcktrZjZlVWYzVDZ1?=
 =?utf-8?B?RTVUbjFwckZxQ3VXcGs1akVFbXpsbm5uS0dhUkl5TVdpUnVtcmd3NXhjbEFp?=
 =?utf-8?B?RXNsOG5CWnFEcm5kUmM5MG1RTlhIZjRvRnJ0aElSUG52bmJ0cFZGM2VJS2ND?=
 =?utf-8?B?SENJM2h0Ym9aSVJpdUZwd0o4RmZpMjYzMGZIUWpzbmd2R2FUVUF3aTVXTTNu?=
 =?utf-8?B?Nmg4cE9HbUVreUppNXBTU0lTOStjbVgwUG9ha1hrMnhLRWtRNUU1S09YNWsw?=
 =?utf-8?B?UlN2dDU3UUFIU2thblRvTmpWd2ZaK1ROci9ZQWdFSXYxQ3dxajkyODVxSDgv?=
 =?utf-8?B?eE5ZWERYck8wLzJxb3JtOWNmVFFMMjMwTDF6ZllUanZJWGFnUlIvWGZqdXJo?=
 =?utf-8?Q?YsVYJSpMJK0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6310
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5067122e-ef39-493b-80cd-08dd9ccea00a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|82310400026|1800799024|14060799003|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjNOYTRIektYbVYrWmVwd2VPR0N2bzRmcHlobHIxZDd6NDQvSXpxWWVQVVpo?=
 =?utf-8?B?TnhQYUlEcDljZHNHdGViV3B2T0xCNnJITmhMZklneWZCSEtCNEtuUXVRUHg4?=
 =?utf-8?B?ZVA1RGVqZVdqZVVSV1JiR1JFYUpLc2tncGdzRnlsNGZ5OGRKRS9LQUQ4Njg1?=
 =?utf-8?B?Zjc3NkVla3hjaEdmeGJaMWJBN1ZnUlhWeUxXd013bERuZkVZQllEVmQvem1X?=
 =?utf-8?B?MkhPdjZhVFRYSUcyQkRweUFGRExuMGJ5Nzg4ZDAwOUxuT250eDR4YnVlTFY1?=
 =?utf-8?B?Vi8ybU4zcng2Mk52a2JxRkFSak43YjN1M1hJak5Ga1hUUWFoVG9aTy9iK3Yw?=
 =?utf-8?B?QmZvK0J5L0lPWHhlRDV2WTZGRFdGWmtSa2hmZGpJWEJKSjQ0V25sdEYxZXhh?=
 =?utf-8?B?TUwvTXJyV3lucWhJUWJqQVE1NnJhYUtsYTR0TllVSUFDdnhpWjlrZFoyS0RM?=
 =?utf-8?B?ZzRDVzFBMG81bG1qaGVrZUI5cmdGQjRUaXZRR045Uk9jN2Y2UzhZTXcyeGVH?=
 =?utf-8?B?WFZMQUNWN1JLRkNRNTVCVlpJaUI3M05GaGRiRkd6MXp1Y2ZDcHU4bTRycXc1?=
 =?utf-8?B?RFdROWJURTVURGlxV1cwaWkxOXp6Y2gvem8waGw2Q2xJUlc1aTluM1VNZHVK?=
 =?utf-8?B?alhha0RzY3FNUTAyeDVteWNDZlh4YTJnUk43R1J2ck1iVmNkV2gvSjBoYVl3?=
 =?utf-8?B?SUROSVFCcVZ2ajZ6dEhhNTlPb0YybFJDaEVtb0tMYStOT2hqaU4wN29OUEdP?=
 =?utf-8?B?MG02Vk1CdVBNNXM1NDRsMmZ5VitxMEFNNkZWdlZiQjJtZ0ZZYXBNNUpZODh1?=
 =?utf-8?B?N3dDK2JpYytMU0FwdVFtWko4TFdIeFVKN08rNTBiMnRGRTFxWThIb2NzaDZa?=
 =?utf-8?B?cEc1Wm96RGYvK05ZMmNCNFNJS3FBSWttemdibU4rLzdteVNQRVpxWW9qMkRW?=
 =?utf-8?B?T3VxdStYL3BENmpHVnRyeHlnZytaR3NFYk5FdEVRZ0s1N3JaQk5QL0x1VnYv?=
 =?utf-8?B?Vit6b0EyR3ljbTJiSHBFMUJqQUlRN3JCazlsRWx4ZndEZnlHR0Rjb3NiR2g1?=
 =?utf-8?B?MnkyYUlIRS9NWVAxSWpwUEdMRnhzYUNZZFlvRHhucWh6OXdGc1JGRTRwclhC?=
 =?utf-8?B?V3dvMU40UmdlMnUzSTF2SkUwYW1yaDNIaGJQN2kyNExlS1duOGg3eU5OWGZr?=
 =?utf-8?B?WHVlOExEbXlVaHY2NktPK3E3dU9KZWJtSnpxVitvNjV5eFFJUjFSUmhPOTBD?=
 =?utf-8?B?WStwcUdBcUVMZVZjUlYvRE1XemIwNmRlT2Y4cEg3b3U5S25tK0NlVEhnUkFD?=
 =?utf-8?B?YkE2VUVObmNYc1JOMlhJaml3dzhCeEhuUXdNOCsya1dsR2J2a08zelJDN3kv?=
 =?utf-8?B?SWlYekhUa3EyN3NhQTAxMDN2Z0JBdnRTTTJ4WU9EWkR2bllES2dXWGJmSVRi?=
 =?utf-8?B?SHFZMUJpSkFOdEJnd0x6TGozaTRMV0hDalFZVkF6OG4vbWYzZU5maE1aMDkv?=
 =?utf-8?B?R016aThBbWJKNkZLODI0S1R2L2NIUEx3NmlWd2x4c01DZnJaR0s5L1c4MU9z?=
 =?utf-8?B?RnpyTmRwaFVpWUsvUlNpS0JSOFdHa2ZIV0pTNGJSZEZCdDFGVEwySW5TcStK?=
 =?utf-8?B?cENIdHd2endTNXBRQmRuRVRad3FCazZjZ2N2MFNrUjVKdE83UXkwblFBSXlz?=
 =?utf-8?B?dWVsc2ZUbTU0T2FlNDZscHpJVm9uaXJqbjAxTVdOOGJ6RG1RVUNoSzdLWm8y?=
 =?utf-8?B?MGwrSGhHTjZlVWpDV1NBbmFDUGRCQkhXTjJmSVo3VE9ScXBnUS90d1Y4dnBG?=
 =?utf-8?B?T3oxY3hkak1nR1B4dzk2TEk2UnJ1QjhpWkovTC8weWIwb284aTNpMEhyTGlB?=
 =?utf-8?B?cmlxc01CMU1mcExTVlZWdjZGRVMwVUg2VGlDUU1UL21RUlM1b01TRlEyd3BD?=
 =?utf-8?B?dlJra0tkeGlidnE2dXlycVFqUEpJT1N3SlJVcXBmUUM3ZHp5TlpTZmFPTXhk?=
 =?utf-8?B?NmNwVTRqY3haYXpDQ3VZZUgvc25pRkdwM05Dd0o5bWIrMjFEZTJ2NFJjTFNO?=
 =?utf-8?Q?xGa1Xe?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(82310400026)(1800799024)(14060799003)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 03:29:35.1918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c853b53f-a50c-4eac-8e9c-08dd9cceb3f5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10823


On 26/05/25 11:58 pm, Shivank Garg wrote:
> Use folio_expected_ref_count() instead of open-coded logic in
> is_refcount_suitable(). This avoids code duplication and improves
> clarity.
>
> Drop is_refcount_suitable() as it is no longer needed.
>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> ---

Acked-by: Dev Jain <dev.jain@arm.com>

