Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013016.outbound.protection.outlook.com [40.107.159.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99D71E515
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 03:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.16
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751342003; cv=fail; b=chQ+Wbg7uJ/n9mWPhyg8P/Zx7GeVni0oZCmHIm5VRKSwU6yWXtLLjW8FcLHkZIBKXlZMP2oh2c3vUrYrAJy5BxskEZTYUXe+oCptG9WSnPLX153/rLvaYKHk2y7GqJ/P1Q+mw61HUZTk78Fkqdn815BNECyiMsEygZNcllTWUZY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751342003; c=relaxed/simple;
	bh=l1aMv5Jr2WwjEzC+QaL60phxMiEHzsCCulrgspd+aN4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=d9zUnrxdoywqaefwnG/tHC1OAq+w+shNhmXViaoLNE8Naay4y52J7y4lCwYuLt7HMdKI6pGxIEvFXZgshIcLN5Dn/lewcAicvOIRxpIc0z/qPWuEIfF96S/U/+YuKMbC3KTPNhAmYZAcLImvsvlstrpm0kP0fXdcGS9a+0lYmbw=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cR059Aih; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cR059Aih; arc=fail smtp.client-ip=40.107.159.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cR059Aih";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cR059Aih"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vU8PnXmFO1yiajREseFTaDSirc/CI6zXZjBv7rJvl4+KotVad+GBt6nH2/KimVHbqDDFrhnIOUW+D3qNC+wLOIQuUCFPGMZd5oP8bfqRH6Ji9RneQFHf/hWkrtUAZtbHWYjmG7YsRT7BHO46EGPWYc+6yKOILER7HWsEz+xfyDfDMp5NAIT9Adha6HwZgDAECfihvf1aNp75ohM7g5XLifMg01BTA2KwrqWLcigCEKDqACPP9G3OsAUbsy8l/67hID1cnLpvERNS9TyybknUMJcRkD3zkLecHIYh2e0a5Ujym0h6b3zEP1AbZ29Or2HlcXrewEZ3eorx/5egGrO8nQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZfsDilldiYmQOxBKDX5xoOLWDI0HX/g6L7QWtbMrsU=;
 b=kW52LOLAGiKk3GHnjKPEmCEcWiVhPz8hIPrJmlgmKfIjz0/RMKRUq9uBKaJKVda3J+DtGA8an4erXtagrixbnHYnuG05aFrxG2pGKMG+fPHJIIjGoNHwcIFlHqE0y3k0/cXbwiU7Da5yeyBMdDJO0d0haQMIiQ+IEaK77kBr+a8sKlaaYFvdXWrTqvazY9uU+VHtGT4v2LHzNmqBlEtLoOCEjrMtokh6o4TmdkT+ODQFXX0BTcDfbECf42RcvtTqrFQcvhjtanEJEbn/qODp2Es1RYEVGu8wj2HeJpIjByV8qQ/Q9oEGjqNfApUL0vbT2pBhb1jx0W2V2T/sAHyT/w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux.dev smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZfsDilldiYmQOxBKDX5xoOLWDI0HX/g6L7QWtbMrsU=;
 b=cR059Aih8wP/bEB2Um0hVpx3niGjxKwooD00ef/BA57ZETgNij8Fqi/x52s4WTV0161r4Ug1M+fOGIUJSgUIAONvJvtjNQrGxFUQyj2oz5MNqjBEWxEBl+DLcG5LqkSPn4uLw+XI+xwlfMcPYvS43SLi7RCtnHgnOPDuowRYzDg=
Received: from DU2PR04CA0306.eurprd04.prod.outlook.com (2603:10a6:10:2b5::11)
 by PR3PR08MB5580.eurprd08.prod.outlook.com (2603:10a6:102:8c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Tue, 1 Jul
 2025 03:53:15 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::b7) by DU2PR04CA0306.outlook.office365.com
 (2603:10a6:10:2b5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.32 via Frontend Transport; Tue,
 1 Jul 2025 03:53:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15 via
 Frontend Transport; Tue, 1 Jul 2025 03:53:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPlV0aArTzIubzJj+mZ3e96bQq9fm+Xb+M3PsnpC7S3s8dX9auvRXpDZCi1mS0xE9yFuDtnGG/OhOeXTzBCzX9kelnoAio/kqK4lDMGjK6OEvQwLi2+hHjscw7guvwh6PVAVYDzPobGx5sqYMO9zXKqvJsSMlXQ82JZR+iTLMzWRtxX5OiZbodC66RlZh3pCkpPcxz6JXslUq34JNTtkj15tgSeqIXczm1K+2MrNhf0k6KgRtcrwp6gFbG6E+TEE0FPIwPSGl2+lnkrk2nGpnbv5/sbz8Cqq3P/51JcKUZr3gNwGzU/uoWs+UkIGPbXpGOd9vsEdW4Jh5oLPY0wAew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZfsDilldiYmQOxBKDX5xoOLWDI0HX/g6L7QWtbMrsU=;
 b=RhFo/AyAmzdcS8MI68XIOISfAtEJ+XdoJS0IqqiDSoqeuztnDZWBlbRiJd6EkgDf2Fl/6/Yvqedi0bXsHJXXdetDxBefL9Po2cuQNbvHSh5f9LdFQFqOqAgscTs0FiPDPishm4PQKPO2xTEjTcOSefwUDYHAxtgIWGEFRJGdckE9o1uK/PWcsQkWXFZCqv4fT5upqAdbPoiQmK3y+E1NERS9HObvGYEknE5fCFvYZTV76i98Clb3rd2ePp5ZMTHSyrVJMqeq/GXFhZIcN9u2mVWeyZivCnLGO1YPNHlIWCVE7zkONihbI2wTfZWZLqq6Y1DkbTM2A40NIHoRLH2J1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZfsDilldiYmQOxBKDX5xoOLWDI0HX/g6L7QWtbMrsU=;
 b=cR059Aih8wP/bEB2Um0hVpx3niGjxKwooD00ef/BA57ZETgNij8Fqi/x52s4WTV0161r4Ug1M+fOGIUJSgUIAONvJvtjNQrGxFUQyj2oz5MNqjBEWxEBl+DLcG5LqkSPn4uLw+XI+xwlfMcPYvS43SLi7RCtnHgnOPDuowRYzDg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS8PR08MB6167.eurprd08.prod.outlook.com (2603:10a6:20b:298::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Tue, 1 Jul
 2025 03:52:42 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 03:52:42 +0000
Message-ID: <b574a67a-3631-41c8-91b0-6cea92c01e49@arm.com>
Date: Tue, 1 Jul 2025 09:22:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hugetlb: Use str_plural() in report_hugepages()
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250630171826.114008-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250630171826.114008-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::17) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS8PR08MB6167:EE_|DU6PEPF0000A7E1:EE_|PR3PR08MB5580:EE_
X-MS-Office365-Filtering-Correlation-Id: de22c06c-6ab0-43ed-1110-08ddb852ce60
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ZnZmOTR4eE5FVXhCKzBuN1RsSE1TUFlTOUFSclh1N0YxQ0dzNy9HN0lTU3li?=
 =?utf-8?B?KzQ2VDBHN2J4N2ptcTFQbUxPb3VxVkRPY1ZnV2RFS3F4SGR0WHAxdUVqdG5F?=
 =?utf-8?B?ZVZrRFJjMWxBYm01NXVXazUvSzBYeFM2bVVsdG41WHIzd2NuQ0g4d1J2Zzg1?=
 =?utf-8?B?MkdKWDlwNHh5WVpjYkxRUFh5b21oTmFIWWZOVmJjdy95clRlc3hYL1poZzNX?=
 =?utf-8?B?K2sxSTZlOVV5NzRUOGRFOXVkeWFJL0tnSDZRbExqWjlqdVFEQmZVbnpRNFZo?=
 =?utf-8?B?WUlBZTNnZ3Q3MEl2SGNNSGJscnVBZTFzYk1kWDBwdjV0NWV6cmphMWxpeWU2?=
 =?utf-8?B?NGVkNXk5TCtmR0xNQ0tQUnpuL2x4QUp2ekJmdmRCRjlwY0NxeEJHcXU1NXpv?=
 =?utf-8?B?ZG5YNGQyWlkvSkhhVVdTOEZxbVV6a1hUVVdtOTFJQVJiS3ovem8yalcvUkk4?=
 =?utf-8?B?NDFrS2dIdFA2cGtpcEM5VmNwaVFVYkZjYk03TVB5L0E5SnFzL1dCVjUyaDJp?=
 =?utf-8?B?TTZqSmxtY0pSUEtLS2pPQU9DZmdSbmg4djFORXZueENIcHE1bFpjU1dJKzFB?=
 =?utf-8?B?d3dxaG0vamd2VUxaREdFODY5VFY1V09ua09GNm1TRTlCb1VsaFBQMG1WUlJp?=
 =?utf-8?B?c0hWZzh5LzF1L1Z1Uk9xSVBNYXBLcnhYZVo0OW82SWdlb2dRcG80Y2UyWnNs?=
 =?utf-8?B?ZEhYclh4YzJYOXZsUlNPUGFKcm00UFp4bE9KK1drb3dIejRZbjR3OFBkaFdQ?=
 =?utf-8?B?TEMvckJQZytxRmtjcXl3V05pdzJ5U1RzVGlGeXdRNVhPa2RHZ1JEdGUvSmpu?=
 =?utf-8?B?SWJqTDhUajFRcU1EOHNUOGxuT251WVh2Mm14Zk9idHZ4NEpINTJKVFY0SThE?=
 =?utf-8?B?RkRua0c2SnJyaUJQaW94RFhSNk9rc0trbXJsNDgyNEs1N3VISDZmaUVpUE9N?=
 =?utf-8?B?MWcrZ1lib0Y3UjRCdldMWEVwK1VaYlJONnkzNDhoTFk5K3ZleHdxTm51ZXFz?=
 =?utf-8?B?bml6eThMd3pjclExYjY5RGJJVVN1RDd1c0pDMG1GN3hjS3NhblBKR2pmQ3pk?=
 =?utf-8?B?WmR6M0dscE9JRHNrekNCYkw1UkFQNVlxdmVaaEZCYTlzNGVhbWo4eHkyTHBR?=
 =?utf-8?B?dFpyajM1NnFKSGhtS0V3Y2dtQ3VtajlHV0RkalRRTFRlbjAzcmtxZmlUYVZk?=
 =?utf-8?B?cGhabzBOZXZQTnhSb3N2b3BTemxubHZ1Q0JzaDNtR1RWVm5vQWkyMnB2ZmU5?=
 =?utf-8?B?ZXVFWmpYSUxPVzJzVmp1emQySXNxYTVNNUJBSzNrOXJkdHVLZngrcGhOTStK?=
 =?utf-8?B?bFprZU85UFBZQ1RlT0xwaytXQk5xclVCL2RyVlFHNE1FdXVWQThDc0JUQ2hW?=
 =?utf-8?B?RlpoMnQzcTZXOEN6NkFHZXEvcnM1UkdFS2Q0NXdxTUN0NVF1M0lnd2MrYUJO?=
 =?utf-8?B?RzNwSXpGZUNkZGEwOGVMYmNhRjFkYmVsWTk0ckcvNGp5Wm1nL0VTaEllZTJS?=
 =?utf-8?B?YmV6bTV5TG1aaE8zTWVKRlJjb000WlE0cU1xNTNBWmhGcklKaTc3WHJpRFI1?=
 =?utf-8?B?N0JJaXBhdjhnb1BtVjg2QnpUazMySCt2VGpUWXNDSms0V1NqaFpsb0FUT0l3?=
 =?utf-8?B?dkdaUGg4c09lT01HK00ySm90OWV3TWVpcndjVThDdHR4aTVrSjZsVEMxdFI3?=
 =?utf-8?B?bXEyOTdzdm94MlRjMU9PaGhRa3poZUw5ci9PV1JlU1FUbE1RWkttMEpQeEI0?=
 =?utf-8?B?MHBPUXArM3FCRmtKdEpaOElFb0Fla2NJRTBleXBvRGljaVpyMEg4bDVTb0JC?=
 =?utf-8?B?Y08wd0NZak5EVzMyUFRGZTk5ZGpNa2phQjRCUWNOQnVuSlo1Y2RrVnRwMnRT?=
 =?utf-8?B?OG01cWxmNjc2alpHOEVreW43TkRDc2o5NXRkUVA2M0RickdIZ0JIWHVjczlj?=
 =?utf-8?Q?5FIkCS6IMEA=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6167
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c80fc3d2-a64f-4d99-b968-08ddb852bb0d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|36860700013|82310400026|376014|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z0FxYUlhekJTUG14UTdScUYxZnZPeFI4V0pIdFBZUlcxcmFTUHMxUEdtQ2J2?=
 =?utf-8?B?eEJkcUtNVFA5Zk9QeFNEQzZGOHlGR1Z1Rzc5S2NTRElFLzBhQ2dJVjkvRTdo?=
 =?utf-8?B?cnNQd0tLVWpDdnRJQU9yZUVXT0l5TUlNNVdVVjdNSTF3dEtCbk53WHozQm5q?=
 =?utf-8?B?ci9JaUptMzYxMGViK0RqeGxHc2RjSHFFdDNiMGZVUC9OY1MybkxVSitLajdR?=
 =?utf-8?B?UUdZQzFyN1crNHRSWU5pRVMwdG1aeFMwUlRrS1VZYVIxcHg4bVkwSHRaTkRn?=
 =?utf-8?B?L3Q5ZWFNeUYvTjdDZ29RNXRneHIvbWlnWFRPaVFBUXpRUWZMRHZOejZKTDFB?=
 =?utf-8?B?akxoRC9wWFYxcnEyYi8rbklWSmNQeStCdkFSdmUyTE1VOThVYXE0Z0RJZklz?=
 =?utf-8?B?aU5nYnppRyt0RXd0SWZjZVppNDBhTVUxZ3oycVpoTEVBTS9LS29UMUZTSTJt?=
 =?utf-8?B?Nzl4SFRmQWYzVjJMaVZoN1F6RUtIaThFbGEyZGx2TjU1M1RtNzFjdFNLaFY4?=
 =?utf-8?B?MGdFUzVIc3BTN0ltTmNSaHE5d0s2K0g3Q2pIN3l6Y1FNc1BPcjd2N2FCVjd1?=
 =?utf-8?B?eG9rMlhDdXppMkMzOVRVRUxkWWpuSHQ2eHFHYXY0OWFDdDRYZlRjQkVINExs?=
 =?utf-8?B?WWtqQU55WlpqRHI5dmtXMXdUOGJvUUZDK1ZxZXFsMHVEMGErMVM1ZXFwSnJG?=
 =?utf-8?B?ejJVMWRmR3JscEJBamhUNlAzRXpBSE40ODg0bHhEWlNhaDhoVFB5bVpmYTNO?=
 =?utf-8?B?YmNlWEVPMGduVnRqSjQ3REdSNktRTFFnK2pyTGNmYk5hQ3ZPNjBJMlFKN3hU?=
 =?utf-8?B?RjlPWXBKVFd1SVpBNU04T2taaW5Xa0EzbUI4aVEwMDc3Wko4VjY3YnlQTW8r?=
 =?utf-8?B?cmxTZytyWkwvUmV0dndmaFNxYWZPQkxENklQM2Jza0Qxc3ZZWDZxRGdWUVBQ?=
 =?utf-8?B?YUc1eW9LZkJNM00rK0Z5Q2F3WUJzOE03aXFiWmw1OUpqWjFBYU9iNFY5UzJr?=
 =?utf-8?B?bE0rNjJ6a2hjUXFpdUp6YnY5ejY2azhoT3VRcWJlbFR6Sm5OZ2EvNTNDYzdT?=
 =?utf-8?B?emFTaEJFcVF2SkFkR1Vhc1NwMi8rcjEyb3dlS3FFeVBRclZMbElyOHVhN1d3?=
 =?utf-8?B?bUZoWHY0NlNYZzZVdXpQMFhtNjFTMllHeFlNY0RXREJGUFVNZDEwL2haMnRT?=
 =?utf-8?B?SS82N1ZMbGNQRmt6V0syOXUzaFNxeDlwdnp6UFUzdU5tZ0sreVBTK0IzRm9u?=
 =?utf-8?B?UUVuUVBBV0RoTUdLa2xGVHhLUXpnMC9PajZJNkNTMGcrdy9sS0RNa2FmQTlO?=
 =?utf-8?B?K2RlTjcxRVNqYnBXQjQvY3d4eWhmZFBrcDdrRURKTUJ5TXBnbEkvOWxnU0hz?=
 =?utf-8?B?M2doUjFRT0NQaGV2amlaKzdSbjl3OUsvdW1TNmIwMTFjdldPRC82bERoZStJ?=
 =?utf-8?B?c0dwSk9KRlh6ZWxZZ0xhVDlmQmRDNzN2ZG53bW5LdjlpQXRFaE5KRDgrNkZK?=
 =?utf-8?B?VlNUVHdPNFUyR0RmY3psckczOFp4UlNLRS80MitoWmErdmdmOXEvSFdzU3B3?=
 =?utf-8?B?Z3pOUkRtRjR1K2lzblB6WFpaalh0TytSL0tTVmc3ZXVXaCtWKzlQQjhRMlhi?=
 =?utf-8?B?NUhxMGlodENMZXJreEd4UWUza0tUUnovNkx4UkhYK1ArTDF4MGtvVG5sZGhW?=
 =?utf-8?B?R1B5K1JSL3hMVXlNV2VBaG8rM1NIOWhFaDUrY1RVWWxnZEJKWGovdjI5SFN3?=
 =?utf-8?B?MnJPNVoyK3ZDZFgzU0ZUSmI3MlpBb0NyZ2J5T0oxTU0xaDlXR1NOOGxON29G?=
 =?utf-8?B?a2szamI3eEhVNHlXYUpIL0NQaVB6R05QQlgxTzZiWG9ObnRscUoxTmFzSG1j?=
 =?utf-8?B?T2JsQ0hjem9uZE5yeXpJWHgrZlkzYnUrazJpRklBR200TzU5R3N5ckhNTW1a?=
 =?utf-8?B?QXZhd0FXWXJqRXJwRlh6Y0JGWk1oT1lrbjVKMGgyaExTMTh2aG9TbnBxVEQr?=
 =?utf-8?B?ZFdrMFlqWDk3SFdvRVoxakpmK2w2Y2czTmovR2ozYUtxcHdyajFBRFBvbjgy?=
 =?utf-8?Q?c0WeWg?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(36860700013)(82310400026)(376014)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 03:53:14.4735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de22c06c-6ab0-43ed-1110-08ddb852ce60
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5580


On 30/06/25 10:48 pm, Thorsten Blum wrote:
> Use the string choice helper function str_plural() to simplify the code
> and to fix the following Coccinelle/coccicheck warning reported by
> string_choices.cocci:
>
>    opportunity for str_plural(nrinvalid)
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>   mm/hugetlb.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 9dc95eac558c..08abe7395f2f 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -25,6 +25,7 @@
>   #include <linux/mmdebug.h>
>   #include <linux/sched/signal.h>
>   #include <linux/rmap.h>
> +#include <linux/string_choices.h>
>   #include <linux/string_helpers.h>
>   #include <linux/swap.h>
>   #include <linux/swapops.h>
> @@ -3724,7 +3725,7 @@ static void __init report_hugepages(void)
>   			buf, h->nr_huge_pages);
>   		if (nrinvalid)
>   			pr_info("HugeTLB: %s page size: %lu invalid page%s discarded\n",
> -					buf, nrinvalid, nrinvalid > 1 ? "s" : "");
> +					buf, nrinvalid, str_plural(nrinvalid));
>   		pr_info("HugeTLB: %d KiB vmemmap can be freed for a %s page\n",
>   			hugetlb_vmemmap_optimizable_size(h) / SZ_1K, buf);
>   	}

LGTM

Reviewed-by: Dev Jain <dev.jain@arm.com>

