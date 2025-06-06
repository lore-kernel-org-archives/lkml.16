Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013037.outbound.protection.outlook.com [40.107.159.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8C0191F7E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 09:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.37
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749202445; cv=fail; b=a2zpL15X6dUKnOIlMqDr6KsUBeKuBn0MzqsMpAuBzkhY+iBeeqFsAFzV1fA7K6IpQKorqDNoYgmFP2tZKo+P9E/45sne5lK0sgP7gIKkCDdfW9pnad3+17AihDLfGT89wron2Gqe8r0Eh6s043zfsCbHBL/Ky8GHgaH8J4NHn1c=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749202445; c=relaxed/simple;
	bh=O06LhCQIuK7c+cBnHkhPsCPx5QW19MkpuGP0Gw3q1lg=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ay6q4hIF2w11cGAD31tyoxVjlmb81M/fbly5lG/i3nuwGZPb8naker46coYBZHY3gQkK0WT912665ayyFX7O9lbxLkHsCQiNAIp6HuWUl93ytn+hPwfywxO3QORv9t72lVRnWLqqkgKjXenZqlD+7MGtObwBD94Stf+hSx+mb5Q=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AsVUO9lP; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AsVUO9lP; arc=fail smtp.client-ip=40.107.159.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AsVUO9lP";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AsVUO9lP"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=d1SC8zechAMhFIfSX29TpixgkpC9qMCEJeM6SjBJsdZYVauCEpG5YWA3J4FzorqbjsVfM6A7hHmpQcwQFs8UOY2WVOQvqlUfb0xZtb/Rgxfg5jxUjJvdVxWs7ZexOgq1Nnu3JQmB9wV5kiNMeyNx5ye/LW97IutfARtLF+bEangcfIVGZcp2p274YvnoICqp3hyMphA+tBPoP/ZSgZQrym9PiDFVkLWWmxFsxmI0xjWPq0yA8rp61fCRlQT9mMRRVQLf0Ay6BVxSlE/TpaL4joP6GSdESCA0ILzmFiHylJa4k7gjUoOUqjOvUiIhZnAynKNOxQIz9jrNNK62WzdiRA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOMA75XJH6voJUZcIb2cczi10iVLH2bEc3TJt7aeA28=;
 b=cGZlI9Bp5+cYq18trHgcluZYyi1P9MFEQXzjeltXMLX9+PJCquDQRFBr9XdMiY/lHt3W/CuRSavBOfnpg1bTUxYvopN0iY1SFxXF2rpMa6ILLzhJ6mJE7XUE6YafK0wjxx8LUEWxRrG6NKhFb2BWmBSHMZiCmDrs8Pa/OKaE5E+mApYg71rewjWUMro1KUlJC0Wcp20kvQVGOOMSYtT2vj1SkMK+7baPbfyfhTfRST8xbhILiARo1GrXGF4KqDpWLg8H54fbvgxUjhZuTfSrgDB2CuQpeoCL6hH/hKjFRSZVy28wVaPOvfBucOQ7q3JGvVFX4YSioqKi/O9tnq+hCQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOMA75XJH6voJUZcIb2cczi10iVLH2bEc3TJt7aeA28=;
 b=AsVUO9lPm+GNZ1i+lZ1IkhAdqHJyvLYuPIfZRsDnVmRCHFPDSxyHokZmGCsoh7tx515M8y6AETYY7Q9pLD4jIE1g0iOt5Z5My+v/PCo4ZbILtolQ+W9iEYlRD7aHk9l8BRIh0Fsdde7zOQCRoqEHHl3+3ynkUQhVwb4Pr7Qo+Vk=
Received: from AS4P192CA0009.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::16)
 by AM8PR08MB6402.eurprd08.prod.outlook.com (2603:10a6:20b:363::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 09:33:59 +0000
Received: from AMS0EPF000001B1.eurprd05.prod.outlook.com
 (2603:10a6:20b:5da:cafe::7e) by AS4P192CA0009.outlook.office365.com
 (2603:10a6:20b:5da::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29 via Frontend Transport; Fri,
 6 Jun 2025 09:33:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B1.mail.protection.outlook.com (10.167.16.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Fri, 6 Jun 2025 09:33:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFTjnsrpm1bXUt5eEAvUjOfBYhsAniA5F4Mb/uXgDX75FbVfM7d07X7J6qs5z/qOMi0VX9gu/YOcyLRtJs9M2RUw6ChgRjoG+TWX8TPhG2lYkT1MoD1clJlqV0vHtJswFX2AePDgQhLtj6qgHr3HZJj1zGWeZAQyRbdRuXiBfmAWbK4Z/MCgXJaEIDZ5C0J4KF2cCYP15J36HjSCQ5cUiprXqb87hUavKHNhyTvGixUiNL39OsPCeBPT/Y0P82tha/axIxUQxujwmMJ/lDTK+RT3MwZS5mqkSf8tJvEiEMmDnF+fkjTWhLAsuSo0sSVd+1o3eVSIrM4g2qAo6hDLFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOMA75XJH6voJUZcIb2cczi10iVLH2bEc3TJt7aeA28=;
 b=EFZk/bQ1hE52Rm1Gi+4+zUQRZBFx4DUuGfknO+ehoiU7hmqzsyTONQ1m8MNRu9oywCTc4DrbIHTb5U/Ifisz372vU4GHFWdtHxRtLbVGE3mBuYD+C0CZxCJ7SuEm1xFfAWy9RLPLJDZsgYJhbggKvN3HVNVe7Vo9o6ZsAtIMaM6hqPDdzFiDPlVaoAZpdoATmAVW4Jj7JHJMzqv1w/NwIqxqm7/2RLmd8Glx0rPIC3Z9q48LDTjDGmvUkb5PWSerC6DHaYTQA10mVoSN+mrjxFfYFqeiWKkGtbbPhqQk2ek7Q+QsvqUFgZul074IFSxWMJmWl52fL1bIhTyVAZ/Kuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOMA75XJH6voJUZcIb2cczi10iVLH2bEc3TJt7aeA28=;
 b=AsVUO9lPm+GNZ1i+lZ1IkhAdqHJyvLYuPIfZRsDnVmRCHFPDSxyHokZmGCsoh7tx515M8y6AETYY7Q9pLD4jIE1g0iOt5Z5My+v/PCo4ZbILtolQ+W9iEYlRD7aHk9l8BRIh0Fsdde7zOQCRoqEHHl3+3ynkUQhVwb4Pr7Qo+Vk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PAVPR08MB9722.eurprd08.prod.outlook.com (2603:10a6:102:31d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 09:33:25 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8813.018; Fri, 6 Jun 2025
 09:33:25 +0000
Message-ID: <099ada2f-ed5e-4797-a51e-ba3edc528620@arm.com>
Date: Fri, 6 Jun 2025 15:03:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mm: Allow pagewalk without locks
From: Dev Jain <dev.jain@arm.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 Jann Horn <jannh@google.com>, Yang Shi <yang@os.amperecomputing.com>,
 Ryan Roberts <ryan.roberts@arm.com>
References: <20250530090407.19237-1-dev.jain@arm.com>
 <20250530090407.19237-2-dev.jain@arm.com>
 <6a60c052-9935-489e-a38e-1b03a1a79155@lucifer.local>
 <ecfed817-105d-487f-80ba-52965f926c1e@arm.com>
Content-Language: en-US
In-Reply-To: <ecfed817-105d-487f-80ba-52965f926c1e@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::14) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|PAVPR08MB9722:EE_|AMS0EPF000001B1:EE_|AM8PR08MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: b866f0ed-5773-4a4a-83a1-08dda4dd43ad
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MU4wN296Y25Pd3BYdGpGWU91VmhyMmdjQWhWcHRIR2lKemZiZ3BQRFpybHZM?=
 =?utf-8?B?amF5YkFNM05LdmxxSGNtWWM2MlYxM09JTHBoTE43eENDMnNIQXVQSmtYT0Fp?=
 =?utf-8?B?dDlqdWEwbENBQmtmNlBVSnNHWC95Q2hrQTRoVE1MWGV1OC95R0hwNFpaWWU4?=
 =?utf-8?B?UW5kSS9QSlNLVmFDUnRVRXVkWlFyR0VCNURCdVZUaFdEMHhEYjAyY3FRTWMr?=
 =?utf-8?B?ZTB0bHBnUmtWcmd4NGsxS3VkNy9EL1BERHYxVS9PL1dPK1I0VnF6Ym5Mb0Ji?=
 =?utf-8?B?bk14MWJxaVVQV2dhb25BaUV4Z0NVM2dWT3dOdjBqS1ZpaS8yanNkR2xnVlB3?=
 =?utf-8?B?WFd5N1ZpWUIyV1N3Yld1TG5lN3FlanVXeGI1SWo0SU9IczVLUkxGV1FEOHlS?=
 =?utf-8?B?Vk02Q21tbTYxYmhTWFFZbTRSTkdjR0xlQkNtb2k4V1IzbFMvb3RqTi9xWWFK?=
 =?utf-8?B?bmluTTROL2dMOWxrM3NXTzdxZ1dtMHRGVUR3Z1BPcnUrTWRuYlFad3Y5TEZ0?=
 =?utf-8?B?ZGVDeml2bk5pNllQRnBEam5GV1dwUUZaWU5FbGZVRE1HOWxrcnNiYWdYOS91?=
 =?utf-8?B?QUMrNzVydG9TT1FXZGpLYnp5VFZ2WGdWRzRmNXBUcUlvRTdLdFRldG9FS2dT?=
 =?utf-8?B?aDVBempmT0t3L2tvdWc0d3pXeW4yTVBYNXhXOXpzenkwOXh0SGRBd1QrcWM2?=
 =?utf-8?B?TkdLQ29IM3psd3RUeVEwUHprSzg3d2dFZjA3aStsTFZjaFdQTEVQbW5NeWFl?=
 =?utf-8?B?VE1jR3c4UlM4SWhjT0Z4Sm5kYk5NSTY0NE5IdjRqcm9senc2aE4rRHNiR3lt?=
 =?utf-8?B?MG50S28rNXVGaGdqcGVPVEtCOVBiWkZYb0MxR0Qwck1JbENmWmx1eUNnS3Fl?=
 =?utf-8?B?OGs1V2tMQlBuWXhCOEVXQ0x0WVlMckpIQkpkb1l0RG1OV1hZeENiQ2dkZk1B?=
 =?utf-8?B?WUpUM3ROKzJpckc5VXJla2k1Q3Y5SlFLVEdiNEZUQjJiY3p6UXRyYWpzT29v?=
 =?utf-8?B?WWcwYW9ZVW0waHlWQStFM2pabERJVW1mV216TFMrU05XcEpHWVIxbVdLbUMy?=
 =?utf-8?B?Vm5VVThGbmpuNFMyV1czVGRBYTFqVXdPVEs0bWhKbGE0MXdBenZtVnFTMVRp?=
 =?utf-8?B?YmtPL2ovc2FCSm9aRHQydjV3RDhhV1JzaEhrcmZMSkJGc1F5Njdtb1YwazJw?=
 =?utf-8?B?WWFCZGFtVm41SG54L3IxU3FRTkY2SVk3WDVkaXNpOVA5VWk4bWhjUjdzUU5k?=
 =?utf-8?B?RHYyVEk3RFkzWjBBS3FoVERQSVliS3prTEdmS0kxeXR6N2VyTTl5Vnc1OXBH?=
 =?utf-8?B?MCtHN0NZSVM5dWZPQkNsQXlFN0NRNXhNYld6cngzS0RUUlZMN1dkOVpHSi9P?=
 =?utf-8?B?aTg0TlRJbHdXVnpmd0dYSlluNVBTM3F5aHhFM1EwRXlUclAweTdpQ0hKalp1?=
 =?utf-8?B?R0had2ZnK2lUekFFOTZja00zSFFRWFhoVDBsQUZwRnFiRCtYOTFBWXN5UWNT?=
 =?utf-8?B?NVpSb3ZVN3ZKOHZXSUcrS2o1YlFUdXNwZDBvMTJWZlRId3FrUHpPckpwMll0?=
 =?utf-8?B?WEEvbkRkeHQvdGxSZVhYR000RkV3ZXMxa1FJTzhqa29iKzJUYVNmVzdMOWtF?=
 =?utf-8?B?aXExd1ZYak1QdnZ2a3dIOTV2NDlSc1loOTN6ZFg1b01qZDRaK2Z2Rk80TStj?=
 =?utf-8?B?cXBQQ3N6U1hqREtLbDdlVU4zODlucEtTd0RqeHVwOHJlWWRhTmkvaXFUMTAz?=
 =?utf-8?B?bDVoalpnSkp3RjN4K0RHQU13NmxZeFltZFUxaGpBN1lsZ0VmTkNKUHNvbXEr?=
 =?utf-8?B?b3QxSC8rUFhGS1hhcTNSeGZrTlNNc2FnblVsc0NIcVoxalhXZlAvcHVWbHNJ?=
 =?utf-8?B?dXY5K0t5L3NWODFzRkl1RGNENXJFN01RUVdWVHQ0dThLb3Uyd3NITzBiVUFQ?=
 =?utf-8?Q?Pi0eDpMJTRs=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9722
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B1.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7f26a5a2-0e28-45e5-894b-08dda4dd2f71
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|35042699022|1800799024|14060799003|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGkwYUNQU05lMEl4aFZqd0NLQjc1VDhxNzVwR21saFBVVUdNR3pHYWtoQ2Fn?=
 =?utf-8?B?OHU3UmpEcXR1b1ptSm1WS3hWdkkwdWFIZC9TVlhRUUtnSlloUXpHcmc1SytO?=
 =?utf-8?B?a1MvbzlYZ0RqMkQ0ZDFwOWxnbFNMMVBBemFXanZJWEpYOVV4SjZwZnFpVE5T?=
 =?utf-8?B?QUp0OUhTZFpITUM5ZHFJY3E4dUZDTDBUcDl6ZjNjRy9YR1A5QUNjRmx3Nldt?=
 =?utf-8?B?Vm1kdGVaWjU1dmNpUWNOSlZQNzdzaWFOK0VwaFkza2o4aGs3OThBc01odS96?=
 =?utf-8?B?NFVSSm9wNU5hTDVjKzAzL0NpYnh2cW8vbFc5WmYwY1dpODBXdGM2UGpIQ0JE?=
 =?utf-8?B?RmhCMnBxQkoxMGIvL2s0THpBUDBxeVp1ZnQ0R1N6Z25iZEhCQVJld0tuWGVC?=
 =?utf-8?B?bmJ5bkQzS2QzbUxVZXJUQjkzenJ1cHBYaTY2a1ZzTHRhekViTEhNUE4wY1NV?=
 =?utf-8?B?RUJCMDRQNUt6N2xiNEtmN3BHQmMzaWZ2bWdyQ3c4MUR6ZVFJWnBVcTR5OFBz?=
 =?utf-8?B?MEUwMjRZTWx0S2taWXpMYzNHUUlCb0NlTUdBUFFxd2t1akZTUnI1c3ByQytX?=
 =?utf-8?B?M2tnL3RhRGp3RlFpUWMxWGxDWk5vYVd4em5wNzNGemFNbmgzajJCSE54TDVI?=
 =?utf-8?B?bC93S29sZkQwUjlSVm1xYTc4ZmRSUXhoV2l4VnpWTi9GYmxOeW4vOGxhRnBD?=
 =?utf-8?B?Y2wvZU1rSG9pVUNxV0RuWWtRM0M0dDdPNnJzSGNTNmZ3U1g5K0VyQWgra2pr?=
 =?utf-8?B?VFpnYjJsUkt0YkhCQ1lac3gwN2RlYmlQS3d1M3pReG8rbzZPY3EyVEZkcG50?=
 =?utf-8?B?Rlo3RXFUWWFZWEVpZ3UxTkJaSENRQnpRVDF1UTU2RkkvL3BEWk9Gbnp2aS9K?=
 =?utf-8?B?eFQrNmt1QkpPMXlaN1Z1MU5QTWFLbkNvZFNFYmZ4THR1TmpJQmxxc3ZPWmli?=
 =?utf-8?B?VEM1dXRIdkVoSHdHRG9CUFI0VnZYcWFlSzVnbmpZT1h3ZHRINzVwT2pSMnc2?=
 =?utf-8?B?a0tuYmJaK0dvMk5jOG5jL2g3dlpwT0NoRjlDQ21hMmJVKzhsK2FrOFA2WmJ3?=
 =?utf-8?B?bnZpUUFINGJnQkFzNTZXd1IwWWZ2eDd2WEIyTklCVURPREcyOG02d01UZ2Ur?=
 =?utf-8?B?bVFZS3RjM1pLWlNDT0JNcDNSdlRVNGp0N1R6WVcyQ2YvdkxNdldMeHplTTRC?=
 =?utf-8?B?a3QyMThkczhyc3B1QkQ2ODF2UWRKSnZ2anU2MjJVdnkwV1BmU1krb3M4b2tR?=
 =?utf-8?B?RjBRYVBnQmtYRUdNSzVGNGhrL1VoemUxWnd3WW1kWU5saEg2Z3hzeXRySzBQ?=
 =?utf-8?B?c2tROHZ0RXpzWGt0VzVRRFNhMXFnSi94N1NNK0M4bjA4NmFJUXV5TGs0NFVw?=
 =?utf-8?B?MkdpTmRRUlR0TEdHNE5DSHNvcHJXNk1WWG5iKzBmN3BrdHFPRWhsU1RxT2R4?=
 =?utf-8?B?eUFzNkZ6eVRXTS96Qi9nbE54bzNjb2pIRkpNdG1CSXFZY0xvNEx6VDUyTExm?=
 =?utf-8?B?TW9TV0U2YmlvQ2pFZURwRUZZRlpEWFlyT3VTRUpCVjNvMVBqOW03M29BazR3?=
 =?utf-8?B?K3ZPaXg2WGdvU3NUZUVHMmZlL01veWcycTloRGZFL3NyWGp1RjBnbVEvUUNZ?=
 =?utf-8?B?MyttbzdDYVI3VnQ5YlJzeFdsYm1XQkhqZXZ0VW9MNDJjWFpDWHl0ay9zUjcx?=
 =?utf-8?B?eE1hZWpPNEZMZ2V4TWIwWjBZOThzM1BjL1lUSFBxM1R4S2NGNWtRSEpTUVIx?=
 =?utf-8?B?MWFHODhocG5tTDllTUVyV1VyazJveW1wZ044YW9RcmVRYW1KMnZwR0dKL0Ns?=
 =?utf-8?B?OFozZUFmN0lFODFrcXlVVEdXRVJHVUY0TW1abzNzWHdFTUprOHpNTDg3VUQ5?=
 =?utf-8?B?SGF4Z245NVRlb2poR3VrbEIzc1hUYnRGZlh2b29lbGE1ZkhjYkllOVhFV2xE?=
 =?utf-8?B?c1BSZ1djejV4WnpzaFdEVFpmTU1VNUlKVEt6RllkWWVJM29nUWVQNENhVzhs?=
 =?utf-8?B?ZWhITFFnbmI4LzlvdTIwWlZ1T1BiK25tQ1FxcUN4SlA4TjAzQ2ZkcTBjT1U4?=
 =?utf-8?B?U0ljaVlBQ09yVVY4Z1pRNGxiK3pqNDZKT2FSdz09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(35042699022)(1800799024)(14060799003)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 09:33:58.5736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b866f0ed-5773-4a4a-83a1-08dda4dd43ad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6402


On 06/06/25 2:51 pm, Dev Jain wrote:
>
> On 30/05/25 4:27 pm, Lorenzo Stoakes wrote:
>> +cc Jan for page table stuff.
>>
>> On Fri, May 30, 2025 at 02:34:05PM +0530, Dev Jain wrote:
>>> It is noted at [1] that KFENCE can manipulate kernel pgtable entries 
>>> during
>>> softirqs. It does this by calling set_memory_valid() -> 
>>> __change_memory_common().
>>> This being a non-sleepable context, we cannot take the init_mm mmap 
>>> lock.
>>> Therefore, add PGWALK_NOLOCK to enable walk_page_range_novma() usage 
>>> without
>>> locks.
>> Hm This is worrying.
>>
>> You're unconditionally making it possible for dangerous usage here - to
>> walk page tables without a lock.
>>
>> We need to assert this is only being used in a context where this makes
>> sense, e.g. a no VMA range under the right circumstances.
>>
>> At the very least we need asserts that we are in a circumstance where 
>> this
>> is permitted.
>>
>> For VMAs, you must keep the VMA stable, which requires a VMA read 
>> lock at
>> minimum.
>>
>> See
>> https://origin.kernel.org/doc/html/latest/mm/process_addrs.html#page-tables 
>>
>> for details where these requirements are documented.
>>
>> I also think we should update this documentation to cover off this 
>> non-VMA
>> task context stuff. I can perhaps do this so as not to egregiously add
>> workload to this series :)
>>
>> Also, again this commit message is not enough for such a major change to
>> core mm stuff. I think you need to underline that - in non-task 
>> context -
>> you are safe to manipulate _kernel_ mappings, having precluded KFENCE 
>> as a
>> concern.
>
> Sorry for late reply, after your comments I had to really go and 
> understand
> kernel pagetable walking properly by reading your process_addrs 
> documentation
> and reading the code, so that I could prepare an answer and improve my
> understanding, thanks for your review!
>
> How does the below comment above PGWALK_NOLOCK look?
>
> "Walk without any lock. Use of this is only meant for the
>  case where there is no underlying VMA, and the user has
>  exclusive control over the range, guaranteeing no concurrent
>  access. For example, changing permissions of vmalloc objects."
>
> and the patch description can be modified as
> "
> It is noted at [1] that KFENCE can manipulate kernel pgtable entries 
> during
> softirqs. It does this by calling set_memory_valid() -> 
> __change_memory_common().
> This being a non-sleepable context, we cannot take the init_mm mmap lock.
> Therefore, add PGWALK_NOLOCK to enable walk_page_range_novma() usage 
> without
> locks.
> Currently, apply_to_page_range is being used by __change_memory_common()
> to change permissions over a range of vmalloc space, without any locking.
> Patch 2 in this series shifts to the usage of walk_page_range_novma(), 
> hence
> this patch is needed. We do not need any locks because the vmalloc object
> has exclusive access to the range, i.e two vmalloc objects do not share
> the same physical address.
> "
>
>
>>
>>> [1] 
>>> https://lore.kernel.org/linux-arm-kernel/89d0ad18-4772-4d8f-ae8a-7c48d26a927e@arm.com/
>> Basically expand upon this information.
>>
>> Basically the commit message refers to your usage, but describes a patch
>> that makes it possible to do unlocked page table walks.
>>
>> As I get into below, no pun intended, but this needs to be _locked down_
>> heavily.
>>
>> - Only walk_page_range_novma() should allow it. All other functions 
>> should
>>    return -EINVAL if this is set.
>
> Sure.
>
>>
>> - walk_page_range_novma() should assert we're in the appropriate context
>>    where this is feasible.
>
> There should be two conditions: that the mm is init_mm, and the start 
> address
> belongs to the vmalloc (or module) space. I am a little nervous about 
> the second. On searching
> throughout the codebase, I could find only vmalloc and module 
> addresses getting
> modified through set_memory_* API, but I couldn't prove that all such 
> usages
> are being done on vmalloc/module addresses.

Sorry, please ignore the bit about the second point, I confused it with 
some other

issue in the past. Now set_direct_map_invalid_noflush() will also use 
__change_memory_common ->

walk_page_range_novma, and previously too it was doing it locklessly. So 
let us assert only for

mm == init_mm.


>
>>
>> - Comments should be updated accordingly.
>>
>> - We should assert (at least CONFIG_DEBUG_VM asserts) in every place 
>> that
>>    checks for a VMA that we are not in this lock mode, since this is
>>    disallowed.
>>
>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>> ---
>>>   include/linux/pagewalk.h |  2 ++
>>>   mm/pagewalk.c            | 12 ++++++++----
>>>   2 files changed, 10 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
>>> index 9700a29f8afb..9bc8853ed3de 100644
>>> --- a/include/linux/pagewalk.h
>>> +++ b/include/linux/pagewalk.h
>>> @@ -14,6 +14,8 @@ enum page_walk_lock {
>>>       PGWALK_WRLOCK = 1,
>>>       /* vma is expected to be already write-locked during the walk */
>>>       PGWALK_WRLOCK_VERIFY = 2,
>>> +    /* no lock is needed */
>>> +    PGWALK_NOLOCK = 3,
>> I'd prefer something very explicitly documenting that, at the very 
>> least, this
>> can only be used for non-VMA cases.
>>
>> It's hard to think of a name here, but the comment should be explicit 
>> as to
>> under what circumstances this is allowed.
>>
>>>   };
>>>
>>>   /**
>>> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
>>> index e478777c86e1..9657cf4664b2 100644
>>> --- a/mm/pagewalk.c
>>> +++ b/mm/pagewalk.c
>>> @@ -440,6 +440,8 @@ static inline void process_vma_walk_lock(struct 
>>> vm_area_struct *vma,
>>>       case PGWALK_RDLOCK:
>>>           /* PGWALK_RDLOCK is handled by process_mm_walk_lock */
>>>           break;
>>> +    default:
>>> +        break;
>> Please no 'default' here, we want to be explicit and cover all cases.
>
> Sure.
>
>>
>> And surely, since you're explicitly only allowing this for non-VMA 
>> ranges, this
>> should be a WARN_ON_ONCE() or something?
>
> Sounds good, maybe a WARN_ON_ONCE(vma)?
>
>>
>>>       }
>>>   #endif
>>>   }
>>> @@ -640,10 +642,12 @@ int walk_page_range_novma(struct mm_struct 
>>> *mm, unsigned long start,
>>>        * specified address range from being freed. The caller should 
>>> take
>>>        * other actions to prevent this race.
>>>        */
>> All functions other than this should explicitly disallow this locking 
>> mode
>> with -EINVAL checks. I do not want to see this locking mode made 
>> available
>> in a broken context.
>>
>> The full comment:
>>
>>     /*
>>      * 1) For walking the user virtual address space:
>>      *
>>      * The mmap lock protects the page walker from changes to the page
>>      * tables during the walk.  However a read lock is insufficient to
>>      * protect those areas which don't have a VMA as munmap() detaches
>>      * the VMAs before downgrading to a read lock and actually tearing
>>      * down PTEs/page tables. In which case, the mmap write lock should
>>      * be hold.
>>      *
>>      * 2) For walking the kernel virtual address space:
>>      *
>>      * The kernel intermediate page tables usually do not be freed, so
>>      * the mmap map read lock is sufficient. But there are some 
>> exceptions.
>>      * E.g. memory hot-remove. In which case, the mmap lock is 
>> insufficient
>>      * to prevent the intermediate kernel pages tables belonging to the
>>      * specified address range from being freed. The caller should take
>>      * other actions to prevent this race.
>>      */
>>
>> Are you walking kernel memory only? Point 1 above explicitly points 
>> out why
>> userland novma memory requires a lock.
>>
>> For point 2 you need to indicate why you don't need to consider 
>> hotplugging,
>
> Well, hotunplugging will first offline the physical memory, and since the
> vmalloc object has the reference to the pages, there is no race.
>
>> etc.
>>
>> But as Ryan points out elsewhere, you should be expanding this 
>> comment to
>> explain your case...
>>
>> You should also assert you're in a context where this applies and error
>> out/WARN if not.
>>
>>> -    if (mm == &init_mm)
>>> -        mmap_assert_locked(walk.mm);
>>> -    else
>>> -        mmap_assert_write_locked(walk.mm);
>>> +    if (ops->walk_lock != PGWALK_NOLOCK) {
>> I really don't like the idea that you're allowing no lock for 
>> userland mappings.
>>
>> This should at the very least be:
>>
>> if (mm == &init_mm)  {
>>     if (ops->walk_lock != PGWALK_NOLOCK)
>>         mmap_assert_locked(walk.mm);
>> } else {
>>     mmap_assert_write_locked(walk.mm);
>> }
>
> Sure.
>
>>
>>> +        if (mm == &init_mm)
>>> +            mmap_assert_locked(walk.mm);
>>> +        else
>>> +            mmap_assert_write_locked(walk.mm);
>>> +    }
>>>
>>>       return walk_pgd_range(start, end, &walk);
>>>   }
>>> -- 
>>> 2.30.2
>>>
>> We have to be _really_ careful with this stuff. It's very fiddly and
>> brokenness can be a security issue.
>
