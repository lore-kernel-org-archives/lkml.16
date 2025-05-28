Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2088.outbound.protection.outlook.com [40.107.100.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94D714A8E;
	Wed, 28 May 2025 21:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748468409; cv=fail; b=t1rFsnlqzcGhW9gdAsl+OtICZdyjdSybHDy0NMWLN1YSaVV81SAeaXolNKh2IiIdqCBv6A5DNOBZtkPgfnc1L3fR9nbmrF6D+JH4It5LpRlcWncj1bDGrNNZBHVjK/xdoBczQB04gAgjlRhcGJL8uE/rxIIYG3acGRT7AdBTYlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748468409; c=relaxed/simple;
	bh=deHUwPvQXK3V58iSTgKHzir0siVjrVAGTC+3/BD5+1U=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LEZv1TU8QITzYX14LaR2bvEL84QEQHSIFQUhpTnyTDXc8BuCsRKc/HQcf+9VkMyMHmWT6m2guXYYAG2EqIF2rRjfWGvxmfTeXHE/ShbiEGh3ZB2/2nldrY2DqmeoZxgrIG7MPou3ILeSa3M2hiCCZut8uRlsXQQDyUmXJdf218o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EjJzec4T; arc=fail smtp.client-ip=40.107.100.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EjJzec4T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LW7TtY43qniyOI4nqkB5fKhv9Au3STUt+E6vzg/npnoCF0O5gg0bnc8c+jx6534NvEkpR+XBt/lDC8xbHLLzth3yWBx2CGnr2h5y2ZXMZsI6PTRH60Bnf9j5vKpyJZvyDP/DkXMfR2NesWqX+iovSxGSo8b0w5nsf/v+0owiuf+tmxLWoHp1yw84+OyK6hghPZYBm6r9QgOZe9q5Bq9L7x3Zpyy6AIKGRgQjPgw5uE2tT/XrkeZtv73GkDePbTpLqhAC57bTDd2jFh0fP+TgQjmp2sOoqf7YFPU6ngSXyMpcQvldFcSTRJZRVyGho/18lj+uhOs0zBMb0czQLbuY8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGg8MjakZn4/MeNVcKdvFxwBG+IOXjuv94GdKFMist4=;
 b=hvDXUbgbqBZ9WACZyHzTrHmyHxkns1ZE+m7oTzYa6QdPpRqzKsjYnVsKbDiUTPWMUylruSysYOz0QcpEYj4qUJ73AZteqKoaq/5Xmki4d+gIs5tDy6tOUd5OqYfYbLXZO8kV2OO5QdRH3udFH2qnT8imax8MyIGIPnECjOseTMy2/WhAlX1mqPc0E49z69dvvhUlnQ/NFrFend8O+HR/5qq80/vba7lASGDDcpTQFTEsp1aKR/KlDqZkoZyrJabmCwGEa/5GTgLhIDwoiMArBnmxfSOCT/N8ylAB5nkcDqJU4of0LwgBwbqVjDHAepcAFuT5Tu0dYINCNfDaBOJ9eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGg8MjakZn4/MeNVcKdvFxwBG+IOXjuv94GdKFMist4=;
 b=EjJzec4TqPXlYPkvLS1wews+pSDNuPb2D31m5sP/4g6aEeu+WOmZtSURKfLjNjLeJAdO5gW7gyVnLkOpbgNV48HEyN+HQHJei+Akj0USckHWQ+NFH+OXMbnpUOKz0QaWayWtCbYMUr6JKT+B4fX6D1l2g03Y4dKMNAdha5X0KHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by IA0PR12MB8349.namprd12.prod.outlook.com (2603:10b6:208:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 28 May
 2025 21:40:04 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Wed, 28 May 2025
 21:40:04 +0000
Message-ID: <08f37011-baa1-40c6-815f-1ed89d19c90d@amd.com>
Date: Wed, 28 May 2025 16:39:57 -0500
User-Agent: Mozilla Thunderbird
From: "Moger, Babu" <bmoger@amd.com>
Subject: Re: [PATCH v13 11/27] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
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
 <e7e8f489ef148a4dcd5837d71c83efad47b5b7c3.1747349530.git.babu.moger@amd.com>
 <dd195d60-3e40-42be-88e5-7f3bbbba63ce@intel.com>
Content-Language: en-US
In-Reply-To: <dd195d60-3e40-42be-88e5-7f3bbbba63ce@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:5:334::32) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|IA0PR12MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: 54ee2d67-76a2-441f-30c0-08dd9e3034c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2lzM2V6N3BYRVdGam44WkZLaDIwWFUrZ2NMeU41Rit4N1dDVFFBMTljYUpW?=
 =?utf-8?B?Qm5LTm44clVESit1ZUo2Mk4yQTBkK2hNc0QvZjZuVDk0di9yOTN2aHdhMElM?=
 =?utf-8?B?UWlOVHYvaWY5bEd2bnB1cklSeGppM3pueFlkaHUxUDNTdEVzZ1VhL05hMUJZ?=
 =?utf-8?B?MHdSTnBwajRGZmw4U1IxTUNHek5YeU5aNDhPZ3VOWVRiN2F5OXNHMFNnOHoy?=
 =?utf-8?B?czNoVzFSdExzSUpLcmtLZFJvalM0N1hRMUVMNGk0V05TbG1pRVI0VjUvbVhi?=
 =?utf-8?B?V0p2THYzZHQ3ZUtKWkZhRlFyd1BZRUFCN1FRcGg2TU9GekxjRk9wL3NEUDFv?=
 =?utf-8?B?NjRPRFdxa2tjVnZBMC9NU0wrMitPRmYydjlzaGRWV2I0WGRlRXJKbUh0OUZl?=
 =?utf-8?B?SVBnTzJ6UUNjOFV2Zm5EZURhMC9LQXN2Qmo3R0dJWjM5VFo3cXFBQnNOcnRy?=
 =?utf-8?B?RTE4UEJpeC96MFk5S0pycnJxT005QWcvY0xiS0IxblBEYmZtSzdoV3llYWsx?=
 =?utf-8?B?QzRXM2VlS0labFVUQUtzSndyK1ZQM1NDaFFjaE5DS2Mvc0dEZXovODkvZFlS?=
 =?utf-8?B?Qm9GTUlWZGV1eHZtelkrM0s0QnZXS00xVzhUZUQ0NzJzcUVheUIzN0tZQ0Nu?=
 =?utf-8?B?TTVqL1FVVTRSYXp3dHhCcTVML3d1YlloTVhaVWJUKzlubHQ0dWhMQWYwb1dX?=
 =?utf-8?B?TGVqNVRDTWhCYTRvdm9rNTVKVEZtUUFxRmNmdDFmdkJlZmVGZ0ZOL09PVVpq?=
 =?utf-8?B?NkkvcnRNdWhib3RHREJ6MU1uR1NrQm1OdjRVbmpVVzFFemxiemhoaXNyMi9E?=
 =?utf-8?B?bVNGZ0M2RUJWQmNGaW1UdVNsUDRLdG9vZ2JENkc4MmFlaDcyc1ZMZXVRUkwx?=
 =?utf-8?B?TUc2ZkpWcDRXQmp2Y29zRjhWYTQ1Z21OOHQyZnJUdFNjTnNWNWlKWUtsT3R2?=
 =?utf-8?B?Vnk4Ky9LTThlNG9RYXhTSERxQWp1NlZrSEtrbytuN01CelIzWWdaNWZtRGVl?=
 =?utf-8?B?SklZNDc5OWdjYTJjc25SMytPZG5hazl4b2dUWXFTMGNEbno5ZW43UFp5N0Ft?=
 =?utf-8?B?WEN0Yk41Ny9yNTdPVWVsSXd1QjJFZmR1TTBqNTh1a0RKNGE0eU93NnpSbVBB?=
 =?utf-8?B?d0lJTDNPMjlaWi9zNllwd2tsdmd3SDkzdEVreW4xSEprbVJaWkh1WkYzc1dh?=
 =?utf-8?B?NlRsUGthbDVlSk1pcCtwOTl4TW45YUpKc09XbTFDN1NQeTl6TEExY1M1RjV6?=
 =?utf-8?B?MFpER0IyZ1VqNFowbklYS0ZlZEF5dUtML2F0RlM4NHNFaUdwSkozQmpWUExT?=
 =?utf-8?B?N0J6WFZsb1dxMWZJN2FrZzZwUkRiYURZS2tja0tNM0lQRk1ycWJSc0tubGpF?=
 =?utf-8?B?TE93ckZxWXM4WC9mR0JoRlFFaGFxNkFIaHpXRzJJL0ZWRzcyb1VBWE1MZ1or?=
 =?utf-8?B?YStEUU90dXMvYzdmWDFaL2lSY3M3ekhXbTNaVWlzZUpuUWtSTVZHdzk5MkZS?=
 =?utf-8?B?TTVKbnFoSkFLVUc3OENZN21EUnJtWnR6V3JDZXkxU1Y3TFVzUE8vL3M3a09x?=
 =?utf-8?B?YmQyMlFEMjdwYndUc0RYVnFtbDBSQ0hxZDdEdHlaWUgzUnFjM00reVgyaVdP?=
 =?utf-8?B?VWdRZi84djVrb1pQYkxST3FTLzdwK2RzNEpQZk5VeGI5MzJnWUw2bXBFaU0y?=
 =?utf-8?B?S04zeXRleHo0bVl3T0NmS3o5L0lwSnZWQ011M0xLQldXaERneEp6RUxRWnV1?=
 =?utf-8?B?SEVvSzQwQU9HU0ZIMXk4Zi91b0t2ZUt2cWNMaktsWC84VHVhVlhkWThubHNJ?=
 =?utf-8?B?TjYvRi9QSUwwcnQ3cW9KNjhoanZPeTdHMEJLU3poU2RDMVpWYUNSelVmY0g2?=
 =?utf-8?B?R2Q4MWFmZ1FDZUVWNjIza1lPY1Qvbm1PVGdPRi9HNk9xWFZUWXdwUCs1RFlK?=
 =?utf-8?Q?rkq5QyCb40mFUwPwxvmaEtaxAMJgGNwZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3VGUC9LdVVOUTJDc0xpNFJ3T1oxeFZUdVJUMXpac2w2TEd3WHlBR1k1T2wz?=
 =?utf-8?B?WVM4eUovV0lTSC9ZSTBhblBJdmd3SkFlcUZHUDM5dHNwZ0FOU2lEWUZyam4z?=
 =?utf-8?B?VFgxWXhEVGc4THJMa1E0NndFVG9RRzdpVU53L3RIRnZSRHlXdTl2Z3d3MXZ4?=
 =?utf-8?B?WmdldjdDekpIS21rWmJzNEI0R1FqRitRUWxiSmR0YXhmL0Y4KzZPWXg5ekRP?=
 =?utf-8?B?czhkMWdEUVF1UHB1Z0QwdnNJTXRhK2xtcUpSazZrVnZqeHNIbU9UV0pKaC9O?=
 =?utf-8?B?T0E1NWxDeEM3VkRkYXdDWHpoUjBjM3ZvWCtGMTh3RC91ZzlRYWhDMTRwSC9j?=
 =?utf-8?B?TS9RM2ZXWVdWRzQ1eTlqMzV1N1BqUGhBRWhvMmdQOFNUVWRId3dTTzNabnBo?=
 =?utf-8?B?T1A0WHo0NHpzdDV4UFkvQTFub1VoWVNZb09MVnNjOU9MZGRZSWhKVS9OcjJF?=
 =?utf-8?B?SWxVR2ZlWWg1aFV6a2RCbmZWZ244SmxlUnZ2bXJpSTVkekE1OUR2MHhVUW1y?=
 =?utf-8?B?VG9WQXVGZWtwclNFWm95c2tib3JIRWxCTFkzZjBjNlptbW9MT1Nxc1lrR0I5?=
 =?utf-8?B?d1BDVE5aYU04ayt0TDRVdDNRYVdWUzlYc09WTmh6Z0p0dDVSVlpmaGFtcUNL?=
 =?utf-8?B?dytUM1RzVzVOZ1puc3krSSsrbDgwd3Z4YWxxZTRhYkNSVlNqNEdqRDJWNEFV?=
 =?utf-8?B?T1RETU4zRlplYUFTTjNCNVdFVlJhcFQ5ZlJTSndZTjZ0blZHTmdUUml1Kzkz?=
 =?utf-8?B?R1oxT2JQT3hWR0kwOXlVWVVUOHhTNGhjaVYyZ2JCaStVNGxnZUpSMjZLdGF1?=
 =?utf-8?B?Vkt5ZkZFMG54OEVxRFF2VS82OGFOc00ydVZ1czlFOGk2VTIxaDZEejFNUEhN?=
 =?utf-8?B?STdKaG9FdWhLQmJ4MldPWitvK3RvWit5ZDVsNi85RkkwSkRJN3JjVEpQcnNa?=
 =?utf-8?B?ZE15WFplOEVyZ094aVJiZjBHS1R6NVBaTlhSVk5uUCtWL2xZem10YktTdk5G?=
 =?utf-8?B?cS93ZjdDbEE3TVcwVUVkYlN6LzBrWjJDYXdIb0ZEbWxtbEpHM1hTbVN0QWIy?=
 =?utf-8?B?d1pTZ21BMzJNdGVJZzNHSzk5RzlvWnNzSlVwK0NsSkZIM0krM0hNRzNlNUhN?=
 =?utf-8?B?YkM1NHBqTnQvUTBFNjdnQ3hpNXJPTjdicEJIN2JFWll4ZVN0cE1PUDlNZGhC?=
 =?utf-8?B?T0xORjFqTXhjRjk3MENjZWlNU0EvZ0NTZGZObmJhS1lvdmFUamtJV2F4Yzl4?=
 =?utf-8?B?SXBxMDRnWm03OFNRd2svNG94RWFhNHorOG95VXNLVDVZaGY5SGRyR01ranBv?=
 =?utf-8?B?ZlllOWdka09SZklpOWRLWnBhYXhJTVl6cUh5U3JUcXBhOHpXdGVQbG9EK0VN?=
 =?utf-8?B?ZzI4eHNlUFE0clF1NVVVd2ZuaTlsMys3V29FYnZPUmg1ZUt2NzNPU3JNcXpq?=
 =?utf-8?B?QUQ5QjhnSGY4eGtEWFUvMWhSMklZR1JPR1VMbk5wb04xSHhKb3o5aVMrTVZN?=
 =?utf-8?B?VUFxRVRiRmpkQnNnQk42aW9ob1JVU3V6aEtNMS9GNnF1a2ZIK1FxTCtRQTZi?=
 =?utf-8?B?SS9kZXdadkQ1d3BrRm1yby9zbnBtWm5ycTV2ZGhaNXkwTWxqa0RxQ3ZlcSt2?=
 =?utf-8?B?ZzhYY3FrV3pDTVM3bTBwZXBNOWJxNlYyc1lrcXRsN3ZZemNidXBQWXBKVmlN?=
 =?utf-8?B?VG5wd2g5bGFnd21HOXBtZk01aDRtT2hmdmFuUmMvOEtoTW9RdHhJdmtFODh0?=
 =?utf-8?B?ekpCUnpaWktmNTg4NWlaZS9yWHdqemUrQ1c4WS9XbkxhSE1mRWc2bTBrc2g4?=
 =?utf-8?B?ekVVbVcweTkyRDNYeFN4QlVzcVJyTThNNXRod3BZUENRdDgxUVo0TnV2Zms0?=
 =?utf-8?B?cTEwRXQ5NTMvSnFVb25KdGVHZDVuNGpuRHgzMk9hcEZhNXZOQWNRYUNhOWJo?=
 =?utf-8?B?N2YxVDk3R1BYdW1zdWVXdS9hMUhuMXRWYmZncmFKQXE1cC9SQk82VndOWC9V?=
 =?utf-8?B?Z3psVVZyNnRVeGJ2QWZhbERMMy80VHNlODJydlpFcFJzQkExM1ByUUdsRWZU?=
 =?utf-8?B?Y1hFREMvUnViL0NnQ1FsWGRtSTlSRWVud1hxOGdIWHNoK2hhdlU2RFJ4Z25G?=
 =?utf-8?Q?28lg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ee2d67-76a2-441f-30c0-08dd9e3034c1
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 21:40:03.8762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+mstZQyr7tGAoOy7K1pKq6XY18mumS1EPjh1FlG7UK7gmdAWONDSlFo076EE8Oy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8349

Hi Reinette,

On 5/22/2025 4:51 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/15/25 3:51 PM, Babu Moger wrote:
>> The ABMC feature provides an option to the user to assign a hardware
>> counter to an RMID, event pair and monitor the bandwidth as long as it
>> is assigned. The assigned RMID will be tracked by the hardware until the
>> user unassigns it manually.
> 
> (please review this often repeated snippet to match new design)

Sure.
> 
>>
>> Implement an architecture-specific handler to assign and unassign the
>> counter. Configure counters by writing to the L3_QOS_ABMC_CFG MSR,
>> specifying the counter ID, bandwidth source (RMID), and event
>> configuration.
>>
> 
> ...
> 
>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>> index ff4b2abfa044..e31084f7babd 100644
>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>> @@ -448,3 +448,40 @@ inline bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
>>   {
>>   	return resctrl_to_arch_res(r)->mbm_cntr_assign_enabled;
>>   }
>> +
>> +static void resctrl_abmc_config_one_amd(void *info)
>> +{
>> +	union l3_qos_abmc_cfg *abmc_cfg = info;
>> +
>> +	wrmsrl(MSR_IA32_L3_QOS_ABMC_CFG, abmc_cfg->full);
>> +}
>> +
>> +/*
>> + * Send an IPI to the domain to assign the counter to RMID, event pair.
>> + */
>> +void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			      enum resctrl_event_id evtid, u32 rmid, u32 closid,
>> +			      u32 cntr_id, u32 evt_cfg, bool assign)
>> +{
>> +	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
>> +	union l3_qos_abmc_cfg abmc_cfg = { 0 };
>> +	struct arch_mbm_state *am;
>> +
>> +	abmc_cfg.split.cfg_en = 1;
>> +	abmc_cfg.split.cntr_en = assign ? 1 : 0;
>> +	abmc_cfg.split.cntr_id = cntr_id;
>> +	abmc_cfg.split.bw_src = rmid;
>> +	abmc_cfg.split.bw_type = evt_cfg;
> 
> Is evt_cfg really needed to be programmed when unassigning a counter? Looking ahead at
> patch #14 resctrl_free_config_cntr() needs to go through extra list walk to get this data
> but why would hardware need an accurate event configuration to *unassign* a counter?

evt_cfg is not required during unassign. I can remove it.

> 
> It seems unnecessary to provide both the event ID *and* the configuration.
> resctrl_arch_config_cntr() could drop the "evt_cfg" parameter and instead there
> can be a new resctrl utility that architecture can use to query the event's configuration.
> Similar to resctrl_is_mon_event_enabled() introduced in
> https://lore.kernel.org/lkml/20250521225049.132551-3-tony.luck@intel.com/ that exposes an
> event property.

Sounds good.
I can add a new function resctrl_get_mon_event_config(evtid) and call it 
only during the "assign". It will be called inside 
resctrl_arch_config_cntr().

> 
> It looks to me as though there are a couple of changes in the telemetry work
> that would benefit this work. https://lore.kernel.org/lkml/20250521225049.132551-2-tony.luck@intel.com/
> switches the monitor events to be maintained in an array indexed by event ID, eliminating the
> need for searching the evt_list that this work does in a couple of places. Also note the handy
> new for_each_mbm_event() helper (https://lore.kernel.org/lkml/20250521225049.132551-5-tony.luck@intel.com/).

Sure. Looking at it now.

> 
> 
>> +
>> +	smp_call_function_any(&d->hdr.cpu_mask, resctrl_abmc_config_one_amd, &abmc_cfg, 1);
>> +
>> +	/*
>> +	 * The hardware counter is reset (because cfg_en == 1) so there is no
>> +	 * need to record initial non-zero counts.
>> +	 */
>> +	if (assign) {
>> +		am = get_arch_mbm_state(hw_dom, rmid, evtid);
>> +		if (am)
>> +			memset(am, 0, sizeof(*am));
>> +	}
>> +}
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index d77981d1fcb9..59a4fe60ab46 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -559,6 +559,23 @@ void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *
>>    */
>>   void resctrl_arch_reset_all_ctrls(struct rdt_resource *r);
>>   
>> +/**
>> + * resctrl_arch_config_cntr() - Configure the counter id to RMID, event
>> + *				pair on the domain.
> 
> The sentence seem strange, should "Configure the counter" perhaps be
> "Assign the counter"? Or if the naming requires "configure" ...
> "Configure the counter with its new RMID and event details."? Please feel
> free to improve.

Last one looks good.

> 
>> + * @r:			Resource structure.
>> + * @d:			Domain that the counter id to be configured.
> 
> I am unable to parse description of @d.

The domain in which the counter ID is to be configured.

> 
>> + * @evtid:		Event type to configure.
>> + * @rmid:		RMID to configure.
>> + * @closid:		CLOSID to configure.
>> + * @cntr_id:		Counter ID to configure.
> 
> All four parameters descriptions end with "to configure" ... but it is actually only
> the counter that is configured while the rest is the data that the counter is configured with, no?

Will remove "to configure" from all the other fields except the cntr_id.

> 
>> + * @evt_cfg:		MBM event configuration value representing reads,
>> + *			writes etc.
> 
> Needs definition about what the contents of @evt_cfg means. This is the API ...it
> cannot be vague like "reads, write, etc." but should be specific about which bit means
> what.

Copying your comment on other patch
https://lore.kernel.org/lkml/14ca1527-ee25-448d-949b-ed8df546c916@intel.com/

@evt_cfg: Event configuration created using the READS_TO_LOCAL_MEM, 
READS_TO_REMOTE_MEM, etc. bits that represent the memory transactions 
being counted.


> 
>> + * @assign:		Assign or unassign.
> 
> "True to assign the counter, false to unassign the counter."
> 

Sure.

> 
> Needs some context here about what architecture can expect on how this function will
> be called. For example, "Can be called from any CPU."
> 

Sure.

>> + */
>> +void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			      enum resctrl_event_id evtid, u32 rmid, u32 closid,
>> +			      u32 cntr_id, u32 evt_cfg, bool assign);
>> +
>>   extern unsigned int resctrl_rmid_realloc_threshold;
>>   extern unsigned int resctrl_rmid_realloc_limit;
>>   
> 
> Reinette
> 

Thanks
Babu
