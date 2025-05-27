Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CBE19F43A;
	Tue, 27 May 2025 20:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748377998; cv=fail; b=fOARZUT3TdqMljXknnZIOSaGihboVhqyEla4iblqWHGHmvMVTnb7fEoprmDYtLdyCHyA9cG3t48p7QRSrMTV8lrt85O8XxIGbo+kWoFSFPBHOqzrsIGoBoRAsdKrnC3ndX4t36tRikn33y4Y7jRT86gFm1b9UPTXka8yQxoZJtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748377998; c=relaxed/simple;
	bh=5d3EWeNYqJw3K5VOoWe1ba/AInR6cAeA0Y5oO1WlI4I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B4zT5Ol4/JGeuY9uTpR8iInYJHzZfmVuHLUPhuSwbvmQv+H0J30evp+a6QnTrAFs5FMWvNhDFlLRcwdCx5iczUpy6It5fh8l6pdomayWUrbl04qCydoEuJ6mt5e8YmAIiy810mOXP+0VrIhp84f2BdRKDlh7NlMJw37u8y1OgOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=X3jFq96L; arc=fail smtp.client-ip=40.107.223.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="X3jFq96L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAVluO6uMIZA0a/3fmbXb61hDGPkzVm33dzY9TPlqahR4NZOdgJ2xr5za6gPHrlLW30oe6JUbpueND3hgHb/5Kzlsn1qB8sls9csbo9no08qemXRxBVpTAh8280VWG+tg3Oz8h+tBjx1OYpowKqHv+H/0GvG+H/qzu5Jp9i/Ar68sjwRCqH7de8SYG8YkY0/OJOzyGCrR4J8dfBQ/cj4U0S/P4yl7x1UW9wVtV/kRxwUC/mrWjAFvg0mGnTLQtsObzjABCTLwCQsmacKzSQARk5xXSTJIMr1WNDqumd3I8OYrLUTUvxI4bqVMholthmeGNtRtiT/jboGeeu8NMe17Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLHS1WUsOHsJ4FHQmiLVATaU/DCzRrvlx2I3SP9v9Sc=;
 b=EcoeoikY6opF2u8sAZvhFkDuqIvHJGqBhFRaJdca2y/l9U/K/+7AaoDaNx7lahqGhG0g7xBHgaWNfu3HD8cK3pNeW5VKXmcoc0CFaUiGoG9FXPnIgvojO+8Ko6T1OpSvzmGhI7I++dKtD6Vo66BsgSz5PKpVfYOdbCSLLC20dmRa2WQMe1hrE7dPD/fo/IXL6fX+xkF6SbwW05y9BMc55CiPZQHrC9KSWcBh1JqjhLvrAnQ+sKAqTCW81uDXGR4UvFeiGuM5m1SY9e/afoTti7Hr35iSZ6XuH3onB77V8NGjkYh+0Otj+w7wmU1Av7+APNijB3qzoJ7tnEF07E7rSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLHS1WUsOHsJ4FHQmiLVATaU/DCzRrvlx2I3SP9v9Sc=;
 b=X3jFq96LIBNV73PqdqPcniF8qbvIWzCkcXkDr02nj+M54HsYBD4qgL/LYFL9TxWQD/vcCXA/+MOkDoHw6ewsHSFYS8Tu+hS8KSxe01IdjLy28RgJUhxxcPYDhJD/Xflttq2x3fI8vykWfZqczGlmjtTuJT11tmUxD+yTO/pWDnE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by BY5PR12MB4081.namprd12.prod.outlook.com (2603:10b6:a03:20e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 20:33:13 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Tue, 27 May 2025
 20:33:13 +0000
Message-ID: <d1e9694f-2e92-4762-9a9d-fec6a1f5e467@amd.com>
Date: Tue, 27 May 2025 15:33:10 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v13 06/27] x86/resctrl: Introduce the interface to display
 monitor mode
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: james.morse@arm.com, dave.martin@arm.com, fenghuay@nvidia.com,
 x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 ardb@kernel.org, gregkh@linuxfoundation.org, daniel.sneddon@linux.intel.com,
 jpoimboe@kernel.org, alexandre.chartre@oracle.com,
 pawan.kumar.gupta@linux.intel.com, thomas.lendacky@amd.com,
 perry.yuan@amd.com, seanjc@google.com, kai.huang@intel.com,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, xin3.li@intel.com,
 ebiggers@google.com, xin@zytor.com, sohil.mehta@intel.com,
 andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, maciej.wieczor-retman@intel.com, eranian@google.com,
 Xiaojian.Du@amd.com, gautham.shenoy@amd.com
References: <cover.1747349530.git.babu.moger@amd.com>
 <ba19163dc9de8e8a2804d1968d5251f9bc801389.1747349530.git.babu.moger@amd.com>
 <fbec5f62-10cc-4b9c-87d1-7777136a792e@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <fbec5f62-10cc-4b9c-87d1-7777136a792e@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY8PR12CA0044.namprd12.prod.outlook.com
 (2603:10b6:930:49::10) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|BY5PR12MB4081:EE_
X-MS-Office365-Filtering-Correlation-Id: dd28539c-56d6-4073-2849-08dd9d5db41f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NjdkWVZVa2IvT29LZkZ6ZXRXVjlrNTU5WWZxZHd3ZTkycUIzSzB5RXNKSFBT?=
 =?utf-8?B?VitabW9qRkNZcGg5ZU8yV3ptV09xMmVocjdnZ0tqOEk0VmJtZWdremlTbExJ?=
 =?utf-8?B?TUNwQmp5alR0QjhQa1N1R0xzWlJZZDlDSTgzNTZIUktYdnhOQVN6dHdVNElv?=
 =?utf-8?B?QzFoUy9DVlhXUWhLVThreG44b3ZuWGZNN3BZdE5kNnd3OXFHTTAwZGt4Z1RV?=
 =?utf-8?B?aTJUWEVvWXFnUFVxY2p1a0dBNUhBcXkyZFVDM3VidVVtRW9sNU1SbVRiUzFT?=
 =?utf-8?B?aVRNR1VDUTRId29tZFBZaEhCN0RudjEzTC84dW83UExYYVJqbDdMWnBueTJ0?=
 =?utf-8?B?ZjRUT1k3YzRMdEFQWGV0OHp2WDM2S2hIUHBsWXhoR2tucEtFdmtyeVZJdXZD?=
 =?utf-8?B?dFpaYkNGbW9jenFXcDMrMGhEbGt5N0Z4YXkrYVFqZEd0M3FleWlJdXh4a09z?=
 =?utf-8?B?cEd4eHpxUERQSFIra0VCanYwbEp6cElDeklHM0tudXppQU5TQzhDSFNZaDFD?=
 =?utf-8?B?MWZLak1UeWN4MlVlNzRUMEVwUTlUYWx1ZUF4eE1xWCtJVER6NVZ3amZjcWV5?=
 =?utf-8?B?T3Jyc0UzaEd3TlpqcWVYdS9uaU0vZi8zR3UrWFJHcDVVZWxSeE0wOHkyajhV?=
 =?utf-8?B?QW9jNkliS0ZtdFNRb25pOSszTG9NK1ByeldwNEVvTGpLZTlGeVJtVUU4aTBO?=
 =?utf-8?B?Q2V3aGUxb0JHc24wbTlMQ204eS9pQ1FSZyt3aFkzbDdvSndPNENOWXhRcDRX?=
 =?utf-8?B?RWVjNnB3bVQ0c0pybEUwOTFUQTJGVi9UNDUzZko1YzIvUGhscHRpbTUvREVM?=
 =?utf-8?B?MW1SN04vY3Jkc0NYa2FCRityTzY4K09FK0JpRnpWZWVKMDF0Nk0wMDV2Sklv?=
 =?utf-8?B?ZmtRdHdMa1dGYjNtWlgvSjlaalRCWlFqQXFsYlEzTmV0cHFiaUJPT0tWb1Fy?=
 =?utf-8?B?ZkpJWDFpR3E2OGdxU3ZibUw0UndtenRUU1EwTFhPS2VJcjh0UTFyeDZDS1Ra?=
 =?utf-8?B?UUVBQnN6WVVpT0F0NFFpeXZyM0VGZEVDdzFnM3VpY1l1SXFlSkFXTjA0ZUY0?=
 =?utf-8?B?NUhwNHo3eCttdVJVRlRFc0hTNWQzSVNBQVBKN3Q5SjBGNDdsOW5xTGZZS0xQ?=
 =?utf-8?B?RXpUc1RhcjljOXBmRXJFVVRoNjBDMUVUb21DMEQzMUhDQ1QyNlZDL3FOMTVi?=
 =?utf-8?B?RXBQTi80T0MxSDRxeWc1V2k4dFVRcGhHUFhmMmY0WFBlSytPV0IrdWh4L0Fi?=
 =?utf-8?B?VmtFU1FnTWVHY3dxNllPNVRqdENQTExzMzcxbXI1allvUGRveEpyZks5UzRF?=
 =?utf-8?B?TEFWZjZlR3ZZSCtRNE15OVpkMGlKamgxeVlsRkhRQUVZTDJJK29Wdi9EVGxD?=
 =?utf-8?B?UUxKU0FZZ3I5aGdJRkt2ckYrWFh3VmI3b0svajRNVURkbUdUN1NJbmdCQXkw?=
 =?utf-8?B?b29HNVFmNmpPQkhxRng2eVlzLzlyOGxJVFpxdkkyd0hJS05ndFQyRUc2aXBW?=
 =?utf-8?B?TXpFYlE2bnRJU0hzNnY4SlJPeU1KRnBUdXhnTFlMbGhPVDNBSWNMcngzKy9r?=
 =?utf-8?B?OUVTN1JCK2hJZWdBOVZGekZzcjVHSG8rVS9JcXh0N0xtb3pJa0c3amVmbU1P?=
 =?utf-8?B?WmRVeG4vZ3NJSjMyVXVRWEhhdVpmV1o2UjV0N0JhVkhNakR5Y25uOS9TOEkz?=
 =?utf-8?B?cmxGSXNNbzBITHYvY2ovZjZZQzcvdzVpWFFPUVBGUnQ3ME84VDJCMXNVdEdS?=
 =?utf-8?B?ZVpqUEdmdENVbWNlZGFOaFF6YkRxMDJ5eVNEMWhjc0xBVVRaQXpqeHpERHFH?=
 =?utf-8?B?NE44UXAvMkIyZ2xzdURPSlB3QlpLbGVnVUtjOFNPSTRoUnE2OUU5RFBHUFgv?=
 =?utf-8?B?Q0dVTVhNNUNZTHBZNnVZVDAyNmdwdzRYOCtTbG80eUNybVl1OWMxQ2tvak9O?=
 =?utf-8?Q?PMfMpEwUqXo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3RpUDFmTWs2YjNrOGhoeW9TRklSd1lnc1NORHk2NzA5Rzh2M0xQL0laSVlk?=
 =?utf-8?B?N0RtaU1SWko5WG1PUGN4UEhPZXRGczEwdmRhMTZHYlZCVDlIcE04NkZHakFU?=
 =?utf-8?B?K0xyNkNKcFFVdFZUUVpsQTFBdzN5Z0lkRmExTEVqRk5KMG1INm1wOEI1NVNo?=
 =?utf-8?B?SUJlUkNjOGtTSnlNYU9tK29DdnNWMk5mempnZHJSeFZsZVVMMnlqTTJZWUFJ?=
 =?utf-8?B?eEJObjBHRk93RXpmZTNvazlkNGRSOUhQbThnbm5DVFVlcmlIM1RqTzRyU1RO?=
 =?utf-8?B?WERqa242anpBUFE0VEIrQjIyUnUxc20vekpiN3Y1REFHc0t1V3RIeWU1QVRK?=
 =?utf-8?B?M0NscUttT2FNWE9CUWlDOU5RYjZwU3dWZHZxSzhvUTAyUzZHRHM5RkswTndO?=
 =?utf-8?B?T1NtT1piYjVVY2hQakZQUnFaYWdsVFdUR082ZXJDSVBaOWFQSmk2VGoxVWVG?=
 =?utf-8?B?MUE0YWFaVjdEYjhVZ1QwMUdLUjdVMHFMUGE5U1l3aHdHTTBMdHY2czF4ZHVH?=
 =?utf-8?B?RVZmOGcyZG0xVWxielYzNVZ4L0hPVDMwZmwxMkNMZGdCelRXNjB3ZUpCZ2x1?=
 =?utf-8?B?U3lEZDdZNE90NUYvOTZRT0doRHhDa0E1ekF2dXc0UmdMZU0xTVczNkFMcURp?=
 =?utf-8?B?MUFPbitPb0xDQm1OQVM5ekNuTGVEbS9TL1U0WXVTMVE0SG5FYTdrcUFMNHFU?=
 =?utf-8?B?d2JEUlJyKy83a3pHeTJwNzVkazdsbXJXWUJyZjRnRmZhRUxxTWFTRlZUZmJN?=
 =?utf-8?B?a0JBUGVQOHVWNG13cFRQWkF1WkErZW80TE9TTS9hSGRtZWNUVlkrbnlZeGRG?=
 =?utf-8?B?cDlJUWtOOW1jOW8rcXRZNXRUaG90TEZ5cFZQaW44alREWGl0NThCQ3hxOXhJ?=
 =?utf-8?B?NHZqa3grdW5SOTJBZTUyTWtLZzg5aXNlTTNBMlhZMVlNNkoyVnQ0bnliK1JG?=
 =?utf-8?B?M1M3RTIyTU5oWkJjdGpOL2cvMGNTRTgrWUFCK1J0Skt3NUFSWkhEUnhqemFX?=
 =?utf-8?B?MHRBcHJaL1k5SldGVTRnbWlTdXNIVlFZRm93eWFXVGt3dFpEODV5UEJiWlNM?=
 =?utf-8?B?L2x5T09obmtXZXZWa1pjUjQvSWgvWFFUQS92a3JRMTFhZXd4VWluR0hHODAr?=
 =?utf-8?B?Z0c4UktLOVNsNjdydWF3bitSUUduL3FFS3RFeGRWU3QzaWpHT3A3RGdxbTRS?=
 =?utf-8?B?UlVzWVdybkdHMUpRNU0wbXVwSWxzSWwyVytKNU93bXAxeGQ0YzBxRWRpR1ov?=
 =?utf-8?B?OThRTEZDKzVTb3BsRzRpMWp5Q3VXdFFXVllyNFBHVEt2ZEhkS3A2Vkh3azdh?=
 =?utf-8?B?U2t6VldZK3gwTUU2TG16ZitKQ3J2L2kzS0srTFFwOENEWFRZT25TcXdpSzF1?=
 =?utf-8?B?bWZBOStvT051TXBTczJVNm5WVGU2bi94TjhiL1hwblV6aFo1Y2hSbENQZ3hJ?=
 =?utf-8?B?YS9ZWlpHR1V3emMwR041U083YXVFT0xRQTdEeWlUUzdjelBmYWRrOVcwYThC?=
 =?utf-8?B?SFBGdXRKYUFGcUNGOXB1M2ZtRnNwejA4WDhma1Y3dWFMMXVTWUg1MzBwMHhV?=
 =?utf-8?B?QmRwVFltZGFMVDY1a1JuMGpHWlozT0JwOUxEMjRZRXVlTko3Ty9lTG1iYTFE?=
 =?utf-8?B?TDFicTdMRnNyYUhaRXpPTlUyWHVNWWtUQ2hSZ3FOTmk4VVIzSWpkaVV3Z3lz?=
 =?utf-8?B?cmtKQ3ZEVXJFdnRuM0ZjOS9SMkYwK3MvaWhDWGd2NkdzS01ja2JSc0VCUk1V?=
 =?utf-8?B?OE1acEZ2L05wa3IrclVuNVF6cC8xMnpQMDhhWnZDQWF0RmdGNmZCdENSOHB0?=
 =?utf-8?B?MjQxNGFRMzJlNGdmMnE3SkJNdnoyK3VzN2E3ZmEvTGYvRDVaMXUwbjc1Y2xN?=
 =?utf-8?B?c3RMT1NFMnVtZFYwcFNhemVKam81TFQ2UG05ZCtraU94RG05ZExocFRNN1pW?=
 =?utf-8?B?R3VGUjVsTjRVMzVTWHhtVXNsWWtqS2gxSExXakZGb1loTzFXZ25Ua2J1T255?=
 =?utf-8?B?VVNqQXd1NERwUFFPc1EzRGNmL1BMZWtwTFRZOERpRmxidHJYK2JGdTZOejlJ?=
 =?utf-8?B?TUM5RlllVmpUdGgzNGtjMkwzT1FTMmRoSDBhM3FKODZHWkttb21xcnV4dFBU?=
 =?utf-8?Q?k9xo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd28539c-56d6-4073-2849-08dd9d5db41f
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 20:33:13.7409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKsWAXFL4mxzGhXBSF4524wJnNiP27NlBfF8qnX/40F8RxpcNH7T/Q/UcYh93Wnm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4081

Hi Reinette,

On 5/22/25 15:56, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/15/25 3:51 PM, Babu Moger wrote:
> 
> No comments on changelog since I expect it to be reworked based on 
> https://lore.kernel.org/lkml/7628cec8-5914-4895-8289-027e7821777e@amd.com/

Yes. Sure.

> 
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -257,6 +257,33 @@ with the following files:
>>  	    # cat /sys/fs/resctrl/info/L3_MON/mbm_local_bytes_config
>>  	    0=0x30;1=0x30;3=0x15;4=0x15
>>  
>> +"mbm_assign_mode":
>> +	Reports the list of monitoring modes supported. The enclosed brackets
> 
> Please try to avoid unnecessary words. For example,
> "Reports the list of monitoring modes supported." -> "The supported monitoring modes."

Sure.
-- 
Thanks
Babu Moger
