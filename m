Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013010.outbound.protection.outlook.com [40.107.162.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F401E485
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.10
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648379; cv=fail; b=nfz4ktbMslYbcTFloOzFq1RvZAnDmvZY3Rm1pvsLUWyUaoOtSgo/ffCeI1bjVZy4zk8Nz7XFsep/gbHPJEXPx2BXXLGbXmj819L+MAqW4skaeWDNP5g9gBGznpR9/YX9jYGbbsSUlnmYez7kKzlP3tHRRDSy6v4Bw8ooPl0TnoU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648379; c=relaxed/simple;
	bh=Clv5hRCocKGyUYM7AiELCYKeddNTp4sauSAgT6CTyd8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rxxlMScwA9evextVloLcFmrz9AVvURL7Ll8DPVRZUryyfyG/iEgToRqcmX6X0pi7sbK7bw5jVpYgOpVFzLaZOnhsd4Zdt1fE2UKk8NsNcylKjDncPGZiHzQUCEyOBEJsbpy2nHIvIj2N9rv2xqFIg+tksXk4WHouCZtY8HbSkJ4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aX18yOZS; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aX18yOZS; arc=fail smtp.client-ip=40.107.162.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aX18yOZS";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aX18yOZS"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TwWeHZGpKTF4eyg/VbXTW/nvR1OmuSorHKbUtHnHKIqeHzp/aF62SUG6vWuqYb+IScG6uXB78g+/g6K+Tsod1lXefhC70Sl5nBzKTO7qGtqYYxgl6v9S72nQOMMK4BAUEttkX9c/bx3Hrv/O4rnDM9T/rOufSVzFj/WYgAEp4zy661ywzGGzl8KEmEbub/jYnbKV3NGfKS8Vqw04L9m/oAOxFK9PL7NRwnDyB+4jVhdasyLfQUsFrHQEGlstTIbkOu+fb6/OmA64oIQq9Dxj5E732ZmiOagc/20h2XvfBg3++Lacy0OkaVqMsa4tnH0FQoTe5oXe2ekd+UkRFt9QJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4lpnW597HHO4f3TMWCyRDR39ZBfz2HCzcMzz8pN07U=;
 b=D3vBeihusHSln7l/gdpdDrj0eP+Zf9ej+dclHAOQE4JYTnAJ5+yn/7JOKO33XcaOYDbi6CYxN7aK3n4a/xbqisyr3pGP/NbWrlaIuXwPlgZhJnBh6W5JnwYrNhTCaNJFcjjYir8CJqSLd0dn30k+OYrJ5/NfC87ESUe+set277kbj51g9BqYTz9/pIPUELMxziVTMdCRnyj+dgtrxnD05ns5i3dU2b4U2pK74Bjk+m8Qlnyb0KmbMUnUbQTY0mWrGezTtnRxc5TYvoaqlalNj/5yZaMEq5SC2vWDKYjI+e6jLhWKrJa78TmvC9hoO8DZmFNiP0CYxXRhLlLl7TONkA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4lpnW597HHO4f3TMWCyRDR39ZBfz2HCzcMzz8pN07U=;
 b=aX18yOZSposXGWgRRsfRVD7PFokKkaEghtVFgg9BWR7HC7SFfA9QGHyTZxo1iy9IuTpfj4H2lYSOjsQxdc6c+7RYKN3cHsK2iY+imJoi4DxMyxUEfkf0itZMETILCtTB9sxGebk22m/k6edMcR4P3ozvZ/BHAmxFMQpPna9c5a4=
Received: from AM4PR07CA0006.eurprd07.prod.outlook.com (2603:10a6:205:1::19)
 by PAVPR08MB9257.eurprd08.prod.outlook.com (2603:10a6:102:309::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Wed, 11 Jun
 2025 13:26:11 +0000
Received: from AM4PEPF00025F96.EURPRD83.prod.outlook.com
 (2603:10a6:205:1:cafe::c) by AM4PR07CA0006.outlook.office365.com
 (2603:10a6:205:1::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Wed,
 11 Jun 2025 13:26:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F96.mail.protection.outlook.com (10.167.16.5) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.0 via
 Frontend Transport; Wed, 11 Jun 2025 13:26:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TsVtQqaZ7ihRehlbwVGuQ4ozcFJCx0r08LA7ID2GW0HDI6PNqG9cS6j6Br0nVjXox++X32Cr1JcpORcC6TJXk4st0CBjXTdM2kfTrtk3Ck64x5NvYQvMt5Tx23/lZwnOH9yNTQtGYfMCALgQoYmXeWnHRpAah6Pw537/ra5anC9Z/YlKn8fYP4TYVn9kW9w0lqXY7w4z0lgNBHqMNGJ8Y1Jc8wICItutqBoHpR/Q/MRJ2uqMFKvWzQYzYc7ueMF8JvzzTcYZkPr9rhT2wczQPSB1YizukCTNv7cWaTbvQ0tXQbQxTxhnbAUWQH4FuPAlx46hbIZ+O1mtYPgItV8g+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4lpnW597HHO4f3TMWCyRDR39ZBfz2HCzcMzz8pN07U=;
 b=zPdQSQaEg7p/QaMhS4r9PSVC9v1DFSFxmhs6DkXRjyqQQk5+IDgcgvxVoISwV4gjXnKow/3JZ52KJTEu6wSDr7xPBsED1HAUwJbK0OtSnta0aL6mOaGF91Q3l7pLEGWmyDnP6CmN2AODE18URGeT/UpNFfFkVkrK5V4JXnwYVuoUC+qdQCeDyASSaV792pgL8lvpGtd0H3s7p4vyYf1RVX3i01rIEQdHF/9c1I3Hzj2dCsOzMWMWZTuaUeOfXOZ8b71UqcCzW6j8mZXbbUjlmqwNrvpLP5nrCWYX3x5tfo2YeM2nasGBFLlQfno783q22M7xSi3jLPM9NI9qua7QEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4lpnW597HHO4f3TMWCyRDR39ZBfz2HCzcMzz8pN07U=;
 b=aX18yOZSposXGWgRRsfRVD7PFokKkaEghtVFgg9BWR7HC7SFfA9QGHyTZxo1iy9IuTpfj4H2lYSOjsQxdc6c+7RYKN3cHsK2iY+imJoi4DxMyxUEfkf0itZMETILCtTB9sxGebk22m/k6edMcR4P3ozvZ/BHAmxFMQpPna9c5a4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DU4PR08MB11055.eurprd08.prod.outlook.com (2603:10a6:10:576::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Wed, 11 Jun
 2025 13:25:36 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 13:25:36 +0000
Message-ID: <574a1c6f-f542-408e-8d26-728749892b1c@arm.com>
Date: Wed, 11 Jun 2025 18:55:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] mm: Call pointers to ptes as ptep
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, peterx@redhat.com, ryan.roberts@arm.com,
 mingo@kernel.org, libang.li@antgroup.com, maobibo@loongson.cn,
 zhengqi.arch@bytedance.com, baohua@kernel.org, anshuman.khandual@arm.com,
 willy@infradead.org, ioworker0@gmail.com, yang@os.amperecomputing.com,
 baolin.wang@linux.alibaba.com, ziy@nvidia.com, hughd@google.com
References: <20250610035043.75448-1-dev.jain@arm.com>
 <20250610035043.75448-2-dev.jain@arm.com>
 <9cbaf817-7a33-42d8-ba39-fa1b448266f6@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <9cbaf817-7a33-42d8-ba39-fa1b448266f6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::19) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DU4PR08MB11055:EE_|AM4PEPF00025F96:EE_|PAVPR08MB9257:EE_
X-MS-Office365-Filtering-Correlation-Id: 257299fa-e2f9-4d95-f43a-08dda8eb8767
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VVJIeFdTbWRzYzM4d2tQUUVteWI0K0RhZnNEYXduV0dwcDg3L2dXdnFWOFFN?=
 =?utf-8?B?RldVY1J2N1cyYjdPRWV1TDczeE8vQ2VuUGtoRmhMK2VnUFhMUjVFekJkT3p2?=
 =?utf-8?B?TElLdTVpVkdBeFpMRFdJREhGT2E1VTlTMjZoWUgvcG1MUTZwQlcxSU51VS9B?=
 =?utf-8?B?dkFnd2hiNVA5ZVQ0QkdPenZnd05GUnRONGUzN0xPYVY1UWo5TEtHb2lxN1d3?=
 =?utf-8?B?RmQ2ampDRU4yRUIvdExDRkdNWnZoR0ZNNWZwWjJ2WXlpbXZxS0owNVI5KzBk?=
 =?utf-8?B?Wi9OZGhzZUQxSXZkVm1QVlZ5TnVMdjVYYkFEbDY4RTB5ajYwQlo4d0JQTnlT?=
 =?utf-8?B?aGdHcTJ3Q2JObC9JdjVOclMyMjB5YzJ0VzFtVWxiRm54aDlPejB0anZoMXp5?=
 =?utf-8?B?Ty8wWldJQXl5Qy9sS1N1R1VKZ3JGY01DQ0FodVhuTHA5OCtGQTBKQndoK0NT?=
 =?utf-8?B?ZGllVS83SUtLc3pQRDB0bUxMRklzRGN6emJrSEM3czJ1OEkvVXc3VnplOUVo?=
 =?utf-8?B?QkM5TmdyZ3BPOHpmZ2Y4VTVOQXM2WFNzbC9HWGh2Sks1amlhVDc0Tkx1R1BI?=
 =?utf-8?B?U3pNUW1wZ1pQQkxPQkFTVzVUWDNZNDdDMDF5YktOTGYzcUxqc284d29ZZFVR?=
 =?utf-8?B?NHlXZXBsY2NFamxPc0o4VkJjUDZiS2xVT2x4cnFobGZiTzhFRUN0YUdxT1R0?=
 =?utf-8?B?TzdET2tWQ1lTN3pjeWduVlFaeVl6Z3dZR1pSR2liZ0g3WkM1dFkrU0ZSUlFH?=
 =?utf-8?B?WTJYd0JKWm5GWFNvUHo2UGdvSXBYSmF4SjhFZXNOdEtCbzlmNmZkMnBVTFNQ?=
 =?utf-8?B?NU1nNGkzWVdRbCtOLzE0SGdmYXRaZFlDUTNrTmpiek5nVUl0UDBjTUZ2SXhp?=
 =?utf-8?B?K2Y2QTJWL080cEdWK0NEUmgyL1JmdUs0WnA3VFJ2UVZ6OTg2a3hqUG41ejZo?=
 =?utf-8?B?UUNsTXlsQ3pUa1JEK2orblBFWDMrU25ickRpSzRmaVNSTG5MbkIxaU5TTmds?=
 =?utf-8?B?TkhxRk00RkhmT0kydkVseDVXcElQZVZxSFhIU3pLakFvQWg0Y3plMk80aGpE?=
 =?utf-8?B?dStSd1haVjhRMmtIM2xEaEJkSGNVZzR5N28vbGE3MzdmTEcxekV0YUNPejh0?=
 =?utf-8?B?TXJhLy8wR1NmY0JjdGtqYTJuT2FWYy9rYnhnQ3paSnljUGF5R0szTys5ZkMw?=
 =?utf-8?B?NTA0b2p0OS9zN0lDZGt3anRqc0J0SWxTS1lveG00TDd0TzRXbXpEK3N0Q215?=
 =?utf-8?B?cm1VdnBCQ1psdmd0ajIyR2EraFQzd0FBZFhzSG51NWVBSlN5am1tMUVQYjBT?=
 =?utf-8?B?YXkwRC9qckdZbkZYei8rYmpTV0lXRkJXV2wvUTk5UElKdjhaN1FIL0hJb3Bq?=
 =?utf-8?B?WllJeGkrU3BFanRmdWlqcmRaMC80UzdUbWd3M3pmT0g0MlVpcWRZN1hXNFRa?=
 =?utf-8?B?N2tyMy8zNUcwYTNCT3o3RllYS09qcVJ5L3lLVUo1b2pRWlR2TGE1V1Y2TE1J?=
 =?utf-8?B?MGxDVURiVVVVMG54b1g2MEMvQ0F4ZTczUVErbGluL2JDYm0yYTFoZkVBM0Iz?=
 =?utf-8?B?Y0xyS3doRFRSQk01ZS9PeW9WTldxWXdmS3ZkQXlna0Jhblc0YUNJOURyT0V3?=
 =?utf-8?B?VHJhblRNVWpzb2tSMlJIM090blB2UDhSVXdFZUkyam42TEp3b0Rka2s2dzVE?=
 =?utf-8?B?bUZud1FEenBLTHJQcloybkttcGdrM3dSRGpwNzJLUzNteVZZS1V6Mm5sZk1a?=
 =?utf-8?B?QlJEU1JvS284RFhIUWVqdzJCQUl2bDFhTGpXdEpRNUhDdUF4WnJ0R2l2UFpJ?=
 =?utf-8?B?bEROZU1WRlZLTzhrMFlyMm1TdXZBbHFTenZmZjZlM1EzcHdGMktCU3V6NWt3?=
 =?utf-8?B?MkxGYnpId3pQUFhhVlZZLzlMMGVQbkR4REZsblRDWFgrK3ZBM3JDY1pGWjFs?=
 =?utf-8?Q?GOlnT1YyQls=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11055
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e39c0080-0a66-4536-ed12-08dda8eb7374
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|14060799003|376014|7416014|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzYvcEN1YlNwOUFjWjB4cjdUU082UUJvQkFrcFEzQm9hY2MrZXJlbFBpMC9k?=
 =?utf-8?B?VmUwbWx6aDloVUFRdXNmYU9lT0lLd2JZUXlkQXMxdW5kb0tTZlYvclZvVjJz?=
 =?utf-8?B?dExxYnJqVGFJeFllQkVFR3pjSGhqajEySzI5OTh3bTlMUGJ0UGtHa09TelhG?=
 =?utf-8?B?WnBDN1BwTS9RdnJSVk1zZHlQenYzSld1c3MwN0ZtL2Q3amFSYkhnNUNQakhX?=
 =?utf-8?B?VVdpaWV6dHFISHRtclNjVmRoeHRBSUdQTksvSHVVMWxGYnR0a2l2R3JlT3Fh?=
 =?utf-8?B?VklBcU1weHVtOEkxQm5mNTl4YWJURGlRRERweU9uMEtjS2U4ZzFFUFovRFQz?=
 =?utf-8?B?SGdma21aR2tPUVZ5bU9HUjRpeXkveUNENEVFeFN6c05VVllpVHNuYUZCU1dQ?=
 =?utf-8?B?RktlRndCSXMyWDh6NlJxT0Q3VEJFeWljOFoyZFBPYjhzNXRwTXNYa3dwZys5?=
 =?utf-8?B?RlIySkl1RFVTKzZCam1VbXhBcjA2Z0VuMExNV25oMFB4OCtEUHhmSnBTOU1L?=
 =?utf-8?B?d3FqTU1jTjNLcWxaUHdTZUZ5Vklwd2k3T2tqeW55ZUZJQng5dmFneXNGTWNN?=
 =?utf-8?B?bnA4Z094cmFhNmUwa0RsTVB1R2lxQXhKUnc1TERZRkxZQ25lSFQ3ZzFBdkxx?=
 =?utf-8?B?cDliMHg0aGtlc2lHdlFHUk9hS1pxQ2VMYWxhKzVRaTFFcGlkdGdWR0YvaWQ2?=
 =?utf-8?B?SStiREJ3cGNyTXJLa1dmT0dWMzRVOFNERnF2L2RZWXJjcGVCMENPNTYyZlgy?=
 =?utf-8?B?SG94c3BqNmNSNU9rekV6ZzZWZlVhOEc1dkRsSHJQYTltN3FLdk83WGdDKzg3?=
 =?utf-8?B?YVFIZUVQNWxMSVJvL25uYm5TM2ZWT3c0V000VnIreEwyN25STnlza21kOVd1?=
 =?utf-8?B?K0d4TytmWEsyd1dZaUQ0b21oM3NyWnhOR1lUN1BSZ3pjRVVhWHRNdGNRRjBX?=
 =?utf-8?B?ZW0reVdCejJtektZWFYyT0RCZFNuWUNnOFVIcThVT1ZnelNjOWxobTVuOUJl?=
 =?utf-8?B?SVlNT1FIWGRLRncyNVk5NENDdklWN3k3bHNSYWFMOXBRRStVWk5PaGFFMWlT?=
 =?utf-8?B?TStHSDE5eG9Ob2wrVGhVRmZyeG9OLzBrZHdCYVRkdjh1ditFbDhaNlJwbFFU?=
 =?utf-8?B?b1BoS21QUGFIK1ZQTjBoVVliVHNiQlFremJBSkliR3l3UU1NS2FNbTBoOGtu?=
 =?utf-8?B?WVp6NmgvWVJnV2dSS0Q4VDdwMVJmVWw4UXBBZlpMMW5uTTNRYmZsSFprTTBP?=
 =?utf-8?B?Zk9pR1NGSGF2TDcwR0liUVFUNmIwTGhteVZqTU8wSjBrS0ZOMDFHcFZvVDYz?=
 =?utf-8?B?eXhKYTlVM0lIZXhoUGc5eC94WXhxckZFc3phdWhWRkYvK3cwSUcvS2dHc1JX?=
 =?utf-8?B?SSt5OWFzZVZ5ZzVGeEVvN1duUzl6OHBzMy9tL1JMcWx4ME51NG9sV0FqUXJV?=
 =?utf-8?B?SWZoU001R1NhZHFIUmVNNmkxNTJ5ekw1K1EzNWdqUjYwNDdCQnVEQkppU0Zr?=
 =?utf-8?B?Rk1UY0FuZXFldWlYbzYvL3ppT21XMEtUMGgzL3hGMkRESVJCSHV3NHJDZDM4?=
 =?utf-8?B?aTMxOVdJM3daemU5V0p1RmVNcEx2Szg4akxaK1BTTW9iWDNWWC9DWGdIZ0hP?=
 =?utf-8?B?N2greHg2dW9ZUHdvbFc2RVNPQWFHTE85eDl3dXRhdXpQYzcrNHpTY2JVaFd1?=
 =?utf-8?B?ampHOVpWZmdXS3RUOVVZZXhWMlRHWmxQaExNMGRNRE1GYURkamJoVWRZVERs?=
 =?utf-8?B?NzZCWGhCVFNwMGQzUTRJUWprMG15Ui9lWDhPd2k0bXFvTlZkWWlTWjVDTTNh?=
 =?utf-8?B?Y3N3THdaUlI2Q3puWm5jNDBjNGIvejY4dnJqRmR4b1RSR2RKVXRJS2QxMDRa?=
 =?utf-8?B?TGgyd1g3ajIwOUQ0elowOHFZdm13RGRMdm5HL3hBR2tCdnZDMUlsVm1RTzFj?=
 =?utf-8?B?bStrbnMybEdzUHVFUjNNNFRPZ2ZJRG10VDU4R2FSNnI0OUkwS2kzbHdXTUFt?=
 =?utf-8?B?U01obGpWNXZlaUFuc01ZU1lQejV0MVJSZ1pmTTdoRFFIVk8wbXlNVG1QUkk3?=
 =?utf-8?Q?llSSnq?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(14060799003)(376014)(7416014)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 13:26:09.8096
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 257299fa-e2f9-4d95-f43a-08dda8eb8767
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9257


On 11/06/25 6:53 pm, David Hildenbrand wrote:
> On 10.06.25 05:50, Dev Jain wrote:
>> Avoid confusion between pte_t* and pte_t data types by suffixing pointer
>> type variables with p. No functional change.
>>
>> Reviewed-by: Barry Song <baohua@kernel.org>
>> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   mm/mremap.c | 31 ++++++++++++++++---------------
>>   1 file changed, 16 insertions(+), 15 deletions(-)
>>
>> diff --git a/mm/mremap.c b/mm/mremap.c
>> index 60f6b8d0d5f0..180b12225368 100644
>> --- a/mm/mremap.c
>> +++ b/mm/mremap.c
>> @@ -176,7 +176,8 @@ static int move_ptes(struct 
>> pagetable_move_control *pmc,
>>       struct vm_area_struct *vma = pmc->old;
>>       bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
>>       struct mm_struct *mm = vma->vm_mm;
>> -    pte_t *old_pte, *new_pte, pte;
>> +    pte_t *old_ptep, *new_ptep;
>> +    pte_t pte;
>
> Could have left that on the same line ...

AFAIR Lorenzo had insisted on moving that to a new line.


>
>>       pmd_t dummy_pmdval;
>>       spinlock_t *old_ptl, *new_ptl;
>>       bool force_flush = false;
>> @@ -211,8 +212,8 @@ static int move_ptes(struct 
>> pagetable_move_control *pmc,
>>        * We don't have to worry about the ordering of src and dst
>>        * pte locks because exclusive mmap_lock prevents deadlock.
>>        */
>> -    old_pte = pte_offset_map_lock(mm, old_pmd, old_addr, &old_ptl);
>> -    if (!old_pte) {
>> +    old_ptep = pte_offset_map_lock(mm, old_pmd, old_addr, &old_ptl);
>> +    if (!old_ptep) {
>>           err = -EAGAIN;
>
> One of those things that's completely inconsistent all over the place.
>
> But yeah, I agree that ptep is much better for a PTE pointer.
>
> Acked-by: David Hildenbrand <david@redhat.com>
>
