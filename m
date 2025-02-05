Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2083.outbound.protection.outlook.com [40.107.96.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AD7227B98
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 06:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738736666; cv=fail; b=DYFDenFE3puw3cX3pRj+RczlkH2zXJ3Pjy9pi2XHotdYjC9mI/FECZcx85zNvSnuDnOCKhR9kg6HaQz9OWtzHhRYF2CgyZl7PhmgoWMwfiZjufYqzJQZQFoPWzfZeGnL79lcvlQvsoCMe+QkOwAFP/ox6rx/spHvapLhsNq9I1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738736666; c=relaxed/simple;
	bh=eCZ6xyxYxPundi7zrobw5X4bCKqDdbpojnyb7WsT53I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LhfILLatlPf2UVL7UChVGIql1ZPMhrh4UDrpUeSbJvpv13w/uB/AvYvWAOrOOm8b9vs1P7qIv2fP/GEemoe4Pax0NkS4K77qXvokKpqFFRbLdwsW22HtjcTeNRNu/paOvAyvj2KYiKeKozn8PwGiHCyrW2CBdx9wHaLUIoepGc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Jb0jJuap; arc=fail smtp.client-ip=40.107.96.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Jb0jJuap"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MrVSriJOHH2ZkeUaA/vYy5zSnnqq+JYh3RJu1oLEGs5IW2ogKAVl70GgXpCkVnFIJpgklGcaJ/TUYVWjYvi6PU02TPlpNm87qxt2FLIqFGMUZJZbZiorH3I6e7mtRuYFqyBKcV4W+qHxzQ2VaXho87hkhCrj2GMjg9xDfW0kN5gA2nheeu+iXf5e0/HGT+hWWMuLa/R0iAcqCMx1mW0KbCRVuO2erfbKzy5B+tywSjRGfQOPUryfj3P5I7Z+tzo8PySOVdXsj/pbBTFbgP4ZPIrKWuUlQDqbEB1PV+Sd1fR7IJa5SELv0+DFZ3M3AZbwzJjPClh5Q1bum5semKipLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3E2HEYPGTxZlN0XoIWltePQt/XHuTqrjM9TyenT6q0=;
 b=Du2DTPvLM6lT9qE6r9LEPwXfrFXHDfEWs6DY2TzI4z612+Ujbtogu+lm7AOq4qIzrW4o/JAyT7Q85ox2TEunOB9g389g+unYEw1V6AzMab7tRuE8leVGUWgfqjsH2/NUy4IRB43CqiC5VPobRGkLJEXizDdi9odiHphCVsdkQV4YnglcharelTtRKgKedG0n7R6KyEV4Sdm/OXQVrIWvRKS1Njl4evXxypSQMYrIZPhmV02ft5GpmjYgli/YlwwlBrhYjXAeMA4t6UImd3nmL1hwklGjbJe5h8+HO7t8cVuxaqxxoYzlqQo/7HZGskEtsTPP9tWR28jTkvNyxI99IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3E2HEYPGTxZlN0XoIWltePQt/XHuTqrjM9TyenT6q0=;
 b=Jb0jJuapI5E/0ciMxeri8a72fIelox3Zpophh98K7DSBVnbsLwUoyEyxsQWkePMBjn/Fl/XRUHpc5A/BM/o5dmekq1FxcljmeRgtiGjS9YVq0FnbS3P13tfG86BfyNH8hSLJiDNDJym8TPKIJIfu7nY84PY7kf6nt//lVM2sUO8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6434.namprd12.prod.outlook.com (2603:10b6:208:3ae::10)
 by BL3PR12MB6594.namprd12.prod.outlook.com (2603:10b6:208:38d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Wed, 5 Feb
 2025 06:24:21 +0000
Received: from IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134]) by IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134%7]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 06:24:21 +0000
Message-ID: <de31971e-98fc-4baf-8f4f-09d153902e2e@amd.com>
Date: Wed, 5 Feb 2025 11:54:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [LSF/MM/BPF TOPIC] Unifying sources of page temperature
 information - what info is actually wanted?
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Raghavendra K T <raghavendra.kt@amd.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
 lsf-pc@lists.linux-foundation.org, gourry@gourry.net, nehagholkar@meta.com,
 abhishekd@meta.com, ying.huang@linux.alibaba.com, nphamcs@gmail.com,
 hannes@cmpxchg.org, feng.tang@intel.com, kbusch@meta.com,
 Hasan.Maruf@amd.com, sj@kernel.org, david@redhat.com, willy@infradead.org,
 k.shutemov@gmail.com, mgorman@techsingularity.net, vbabka@suse.cz,
 hughd@google.com, rientjes@google.com, shy828301@gmail.com,
 liam.howlett@oracle.com, peterz@infradead.org, mingo@redhat.com,
 nadav.amit@gmail.com, shivankg@amd.com, ziy@nvidia.com, jhubbard@nvidia.com,
 AneeshKumar.KizhakeVeetil@arm.com, linux-kernel@vger.kernel.org,
 jon.grimm@amd.com, santosh.shukla@amd.com, Michael.Day@amd.com,
 riel@surriel.com, weixugc@google.com, leesuyeon0506@gmail.com,
 honggyu.kim@sk.com, leillc@google.com, kmanaouil.dev@gmail.com,
 rppt@kernel.org, dave.hansen@intel.com
References: <20250123105721.424117-1-raghavendra.kt@amd.com>
 <20250131122803.000031aa@huawei.com> <20250131130901.00000dd1@huawei.com>
Content-Language: en-US
From: Bharata B Rao <bharata@amd.com>
In-Reply-To: <20250131130901.00000dd1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::20) To IA1PR12MB6434.namprd12.prod.outlook.com
 (2603:10b6:208:3ae::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6434:EE_|BL3PR12MB6594:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a8a1822-eda7-4f30-43b5-08dd45adb9e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGNKVWZ2V0JsTUgvWFk0SjZlVVdsYVZyY2NmSEgvUDU1MVVENzdsTmpEK3k0?=
 =?utf-8?B?amdxb25LekJ2c1Q2M2NIc1VLN3FLUUxKa3l2UzlWdmJCZ1Z3RVc0VDE0STVC?=
 =?utf-8?B?cUhZcTQ3S3Z2SHRMTGJLRXdGM20zMUVUNU92SCtQTlVnSVRER1Z0cjNuWklK?=
 =?utf-8?B?WG5OcGpGdHpTYTFGU3ZlZXdXU00vUytKdExHZTdKVi8vVE1XMTJsQ0M2dmdE?=
 =?utf-8?B?NWc5ZG1uQXVuNnFYVnowVS8vWFpiWGxscHEydWhIVWpSNW84Wnl0UStneTlo?=
 =?utf-8?B?OXh3VmZUVFNJMklITitzVEhLeUFrL1BXbHdURmpaWjdBamVxSCtxcHpkdlls?=
 =?utf-8?B?MEVRWUFOMVhlUncyOVhxMWNmR0NxSTdEaFZFb3pHUzVqb2h4RXltSHIya1I2?=
 =?utf-8?B?Q2ZPZTdPOUdWSkVWRnczOGNWa3ZLYWVUNlNSdEpZNDVUQU5vdDBNY3V0WmtS?=
 =?utf-8?B?NVBSNzJSVmg5b1NSbW5QdlNlSDhycVU2RlZBdkJmZ1N3d0o3dDF4SCtGNm9z?=
 =?utf-8?B?enpsN1pWTk8rOWg5YW9HaHlkOUl3TVBQcldGWDNGMlRuU0xBbzFiajJBQW5Y?=
 =?utf-8?B?R2REdGd6MVMzYkJkZFhPRnRpckk0UEpTOGIyQnp6OGlBd0xtc2F6endtY3B0?=
 =?utf-8?B?Z0RqRzd1UHdJQWFBYjFTTER4ejhsd3lwWXNhbGF4czRjTjN1SXArL2kya092?=
 =?utf-8?B?anM4c1ZWZmlObk5BVXl5eHBTcGE1bGQ0b2lUditQOW1CdXdtclZhZ2I2L1RR?=
 =?utf-8?B?VndDUlR6Z3dIL1FsTlBkcW0yQXVKTUxXN0JxWTQzWWVBZ2Fib1F3bzV2cmpL?=
 =?utf-8?B?SkRDZkZScUhrcTJTQnNrTjdCNVlNQ05yNk5zZ2IzWEQvT0Q2UVVuL2VmMGs0?=
 =?utf-8?B?UC9DSEI0TDlBMkhGU3FCYW4zUDc5RGpmUU1KV0FFZlozd1hxT1E0OER0SS9S?=
 =?utf-8?B?YThvMkJPemZQbXE0YTFQcERPM3pzNnhFSnRDckVUWTdvMDRySUlsNitOc2p5?=
 =?utf-8?B?REdsRHBiczU0NmlRWjU0OWhVQ1VEK0tmV25sbllnRWtFRFZVYWtGOWd3cFJO?=
 =?utf-8?B?azRrRkhUMDdUUitIaGtjOHFzb1kyd1UxZ1lYQjNIMmNaMTdybSthNmJocjhE?=
 =?utf-8?B?U2M2VkZqSFJEays5OGp4TlZ0RE9XdUZkdTExc1RGaFJqbW1oaXg3NkZza0dy?=
 =?utf-8?B?TTgvMmFtbWJrTjQ4NG9JTDFJZG1KYWpYdjBScG1EMzljOXpvY2wzbDlkaWJr?=
 =?utf-8?B?Nkt4WG1JUFdXb2RmSGZSNUlWVElEdVN3QWFFZjRqZjhrZnRUaS9GZmgyR3hS?=
 =?utf-8?B?WVhDanl4U2RFTGRrNHJ0NWdzaFFPOHpaazlHK25HNFpUKzh3ZmdramtQdm1x?=
 =?utf-8?B?UW1MWjdGa2JuaVhRSEhSQzRFSG9SYzNWZUVEd1FVajZEa2NzV3NmaGlpNDli?=
 =?utf-8?B?c1F1ZG5zU005d2wwRXNiY1BGYXRSOHByYVF1Sk9VYm11ZS9CdVZDamd5dGc2?=
 =?utf-8?B?ZWpPelZOZEtoY2ZjaU91ZU8wdldhSy92M3U4UklSVVQ1eWlneFJNQkRzZ1JQ?=
 =?utf-8?B?RXFMdmZtQUxtSmxjeWhJTldQZkdsOEpzSERCWGw2Z1FSaGRsZDhrajhrcU0v?=
 =?utf-8?B?dlJHeEtRUHBtajZZcW9mSTlXM0JNQzJvZ01RaVIwd1lBQmhlWWdOVzRsY210?=
 =?utf-8?B?RkMwd1N0Z2VsVDNVaXdVVTZyZUt2N21ySGIxWCswRkxEdUNxTmFNNTExKytz?=
 =?utf-8?B?ZXM2Sk1ZRE5JZld4QkFhZmFCaGFNamIrY29JaGIycFlLRjJPa3dBby8wSklj?=
 =?utf-8?B?WE9SZis2SXdhOGxxTUFDbHpPTEZiUDdBZlZOS1lwLzFvbkhOeVkyTFR5a1Q5?=
 =?utf-8?Q?FuNWgahff4fl/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6434.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aktHVFNnSTdzbDJaMGpRU2FFWnZPMVpnSG8xQUt1OFFiT3dUalZ1MHZUSzdo?=
 =?utf-8?B?aTZlT0p3MDB4QzFINURkQkRIalpwc25OOCtUaUhYd3p2aTYyRm1vMWo3ekNV?=
 =?utf-8?B?cEVNeFN0MW9vbHdyTDlwYWV0SUxvbXg3aUkyOVlEZ2UzaTBYVWF3S0N3L0Y4?=
 =?utf-8?B?ZWJCVUF2NERxNlNBdjBKNjAyWitiR29aRW1YUzVxRXhWQ0w1M0w2N3BldnZG?=
 =?utf-8?B?d1hVYktCV0E4MEVZZ242eFZ0cnd3b25aZkhCUVFnOExKTlFCaW1hTUpxeVIr?=
 =?utf-8?B?UlRKUHkrMEZKY1pVMzRxVE5mUW5lalhrcHpLSkk2UER3ZE9QTU1vL0JicVc5?=
 =?utf-8?B?Nm5BL1ZBMXdQU28ySzBkbkxDWnFtRm9YT2tWY0sxUEpsM3JGdWN5RTFUZjFC?=
 =?utf-8?B?eGM1dGl2a0g2L2ZzdGxCOGJaZ3B2RHdoQzlIQUVYZVAreUIyTTV0WGNaQTIr?=
 =?utf-8?B?Zm1QVTZDWkhOakg3ZUtIUXo4dXdNNEp5ZEF5K09vdTRJV2FNWm5SR2tXL2Vh?=
 =?utf-8?B?bkpFVWlldWlzTW93enVTSWtIKzlNdGNQZExiQWpFN2JoK2c5Tk9PZE5Nd1R6?=
 =?utf-8?B?am42N0xIbjd4OTNnbFJueHllaDk1YnFIeEZ5aHNORHdWQlhLZmFENnkwNFli?=
 =?utf-8?B?TkQ0aGlsZkNaclBmTDVtSHNTUU53MEVUMmdjZzh2aWNnRHJyeUpCWWdScUo4?=
 =?utf-8?B?ZDQvanVON0h3ZU5sOEhJVDYzZW5kK2xuK21DM2wraDQvTEo2dUJ2ck4vanpa?=
 =?utf-8?B?VVExeVJQZlpKRnNyTnpGd2FYdjJCc0RYVVJsVWF0UzV2SUY5QkRWMFFqZnB2?=
 =?utf-8?B?RjF1cjNFZ2NuVmQ4R2J2czNIa1dycEo4UE5HcUM1ZlZMdk1zZEh5eTYyTlYx?=
 =?utf-8?B?UnM2T0YrMnpxQ0p5eTRtZGR2dzloOTg0MmZVUnFtN01hWHEzQTFmZCswdkNm?=
 =?utf-8?B?ZnFvdmF5cDhiTlg4M3pPSmZTYjltMVo1dmZCQkR3T1RRdE1Vb3JjTHdCTTVS?=
 =?utf-8?B?RmdIYUtWSkZnL2hGeHNHdUxkTml4TEh3NHE3NUhtbGhRUkxnWkFBSzR0WVVE?=
 =?utf-8?B?YkplK1JHa21WdExqNTgwVDhEdTJZdFVSMW45Zzd5QXdoNll5WHd5Q2tqT1V6?=
 =?utf-8?B?M0RCRzE3UHRPUncxelZOckYwVkFPYXFJNGt5Ui9QcUJTWmJBYzJnK3ptMG02?=
 =?utf-8?B?Szg5b2ovUHdoRWM5Mlc1MXBnRno3L0NtUFlyeXpIcjdJMU5uOVMwcCtEYXdG?=
 =?utf-8?B?NVplU0RtL0dRa0wwaGQ3Skxud3hQWmlsVnRvb0JwUmo0a1l6bXdoMGpsRERE?=
 =?utf-8?B?MHBab1ZjY3lJRVN5NEYreXM1SG1jRW54OTg4dXBWZlZzZkpGNUdDWUFWRk5J?=
 =?utf-8?B?U2hMYUVRRm9uMEVsY1lpWjh4c3pKZWtyMVNES2lYdFpPTjM4U2h1SW10ZXZR?=
 =?utf-8?B?UCtaQUpmbDNrMmtDUTF6MEM4akpza2E4UDU0d1lTRGd6RU12VURNVTQ3aWd1?=
 =?utf-8?B?a1ZQUTVOTDZNVWVDSlRGTHpsU3BLSGdVSVRZTWNuQkJyMXdlMzBqcWt2QVBW?=
 =?utf-8?B?SURKL2ZIdFk5d1VaRGdSZEtHM1VLZktaUkxrWjdDN21Ed2o3VUxPdU5zVTQy?=
 =?utf-8?B?VEJiZERZMFRJNnZTcUNDdFRRRENmSTJXYUdDSUFYaUF3WWoweGI0T1QvM1Jx?=
 =?utf-8?B?TGNndEw0d0NTMTlNMW4vc2d0ME9LNUMvL0ZYWDVwbWJGU2pQYkl6ZmlwZ2sz?=
 =?utf-8?B?QWZrWmJyaC9tZVVoOUUzS21VNFVuRW9XaXFhQjFwdXBBV3VGWXFyL2diUUpT?=
 =?utf-8?B?WGF6REEzYSt6V2piLzBFcDIxY1J4T0RZWFdiaDN6VStpWkJuZ0ZoRDc4SWFY?=
 =?utf-8?B?aWloWTNpK2h1WjNWQzNtUHh5Mk9LZEhjbmdlaktzNEQxVFJSc1pDWU9yelZv?=
 =?utf-8?B?MmgxVm1RWTdiem5zdi9PZjdUZkZ0NEhyQXBIMkJERmI4WFRjS3NpUVVYNm5o?=
 =?utf-8?B?V0p4ckErNlV3dkJsUXowbStoZlFSOElyaks2Y2tlelFLMUxnNmZmOVh5UXox?=
 =?utf-8?B?VXp6VGpYWThLRk1EdTdtZzhGNFZ4dUwvZTFMbjRzWlowd1dzOW9jWG15T1hk?=
 =?utf-8?Q?g9m2VCc40KuQLSSmViZwyUz5+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8a1822-eda7-4f30-43b5-08dd45adb9e1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6434.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 06:24:20.9848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJ1f+Lkg/vY6iVxG+dSMKqHz5l+ek89tdMEsIZlCpPsgwUBkK6m6uW619M8OgoN9LyhNC/9qJQDm/7wpJTnGDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6594

On 31-Jan-25 6:39 PM, Jonathan Cameron wrote:
> On Fri, 31 Jan 2025 12:28:03 +0000
> Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
> 
>>> Here is the list of potential discussion points:
>> ...
>>
>>> 2. Possibility of maintaining single source of truth for page hotness that would
>>> maintain hot page information from multiple sources and let other sub-systems
>>> use that info.
>> Hi,
>>
>> I was thinking of proposing a separate topic on a single source of hotness,
>> but this question covers it so I'll add some thoughts here instead.
>> I think we are very early, but sharing some experience and thoughts in a
>> session may be useful.
> 
> Thinking more on this over lunch, I think it is worth calling this out as a
> potential session topic in it's own right rather than trying to find
> time within other sessions.  Hence the title change.
> 
> I think a session would start with a brief listing of the temperature sources
> we have and those on the horizon to motivate what we are unifying, then
> discussion to focus on need for such a unification + requirements
> (maybe with a straw man).

Here is a compilation of available temperature sources and how the 
hot/access data is consumed by different subsystems:

PA-Physical address available
VA-Virtual address available
AA-Access time available
NA-accessing Node info available

I have left the slot blank for those which I am not sure about.
==================================================
Temperature		PA	VA	AA	NA
source
==================================================
PROT_NONE faults	Y	Y	Y	Y
--------------------------------------------------
folio_mark_accessed()	Y		Y	Y
--------------------------------------------------
PTE A bit		Y	Y	N	N
--------------------------------------------------
Platform hints		Y	Y	Y	Y
(AMD IBS)
--------------------------------------------------
Device hints		Y
(CXL HMU)
==================================================

And here is an attempt to compile how different subsystems
use the above data:
==============================================================
Source			Subsystem		Consumption
==============================================================
PROT_NONE faults	NUMAB		NUMAB=1 locality based
via process pgtable			balancing
walk					NUMAB=2 hot page
					promotion
==============================================================
folio_mark_accessed()	FS/filemap/GUP	LRU list activation
==============================================================
PTE A bit via		Reclaim:LRU	LRU list activation,	
rmap walk				deactivation/demotion
==============================================================
PTE A bit via		Reclaim:MGLRU	LRU list activation,	
rmap walk and process			deactivation/demotion
pgtable walk
==============================================================
PTE A bit via		DAMON		LRU activation,
rmap walk				hot page promotion,
					demotion etc
==============================================================
Platform hints		NUMAB		NUMAB=1 Locality based
(AMD IBS)				balancing and
					NUMAB=2 hot page
					promotion
==============================================================
Device hints		NUMAB		NUMAB=2 hot page
					promotion
==============================================================
The last two are listed as possibilities.

Feel free to correct/clarify and add more.

Regards,
Bharata.





