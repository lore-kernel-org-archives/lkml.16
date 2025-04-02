Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2051.outbound.protection.outlook.com [40.107.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DB217E8E2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743609432; cv=fail; b=KZS5VFq0RC8yv0b/0gamJ1JosMeCzlExmGV4dSokZgPMUSTC+CTPiFk0yJ/J65UbpRElCMPcvFFL+TOV/E1jvPPylRQRnciRzb7HJf2G8Q3G5+hZoWKbwRu7oCEc7NkOUMyBXQx9SGlVQ1KBKNtccTPJoo68Jt63RnNMrydahIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743609432; c=relaxed/simple;
	bh=jROTzTr4OaXrnV5lTvpEzF5UKWyhrXc6S/DUFA3ZAG0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Wcp2aMQtDkghM+ookBZYKJAX3lL3bgXBRLmtD0C+nOQ2S5T1aDuuVvb697L4wIchDY2ZxXD+Xdzn4V6lffngY2FS7aQLi5qVCjQBe3yQoFQYtj3Vj1+ISqufYKbP0SgZwJF/ZVU9euRCbJaiXto4fewVxsFe7VjjU+hAHxgJnk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uPOUcEB+; arc=fail smtp.client-ip=40.107.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uPOUcEB+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRHl5cKS3lcqL0Is3MprZeaa+J8/NA58lkovqk/PpWOJ2fFIk4uA1iNT/CLiOhS2d2wxHtVOo9IGtGD8ZES5GNVF0HmjSU359fSXuMo8s4ZUPy9lX3cL01w2deft/aheBTwLpQT4roGvfWg2H8VuhYnMIg62DS+mYVRycVFNMhuay1H+Dug3Xhwgis9RaCIXaJ3O8daHMZ5I69lqPEFgzRz74DBcVSVd6/kYxbcM3P9AqzaRI8adviq3GtX+MT87mGmz8cipGzaDvCSz6Ed59v9qOWiCq6iUMSYZbvl/AjhUbrGJrC7BWOjB/BxggaLbLvFOpvL4YkXmd/0KwfyYcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfAMm4e0wa8jKV2j+xhxtByjc0se8RIRVD2pmj7N0CE=;
 b=eWwwekoH+mtC8b5eM6/zk8fnyrQ3/BzV5sE+g5+lkxlKszg/aG1dgAFeGQPlSmH2HLO5vrHAW83JX19+31p8SEGsLOwlSNmTcw9TYmioKDooMyHCdrdPeLTkQuxPWWtTqJVO8vHcnDNMv7l55OhaACr4ydRYJQCEE16Uozp9wCAhIqUTwVIAkn7D9N/TmqKVuJrO1XMeWonGwLS0/jdAd3Sp0JnaCRSfmMVEWw5XUc2f3L1CSz49HQ5wDshSouV7Kb5fXspOUQiWYQxBIUv/9L4a2d4XP6gT3q3GrPxCKGiQEcngQk7oJ7WBOrDufc/WBCecfJey4xNMO9YcW8d28g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PfAMm4e0wa8jKV2j+xhxtByjc0se8RIRVD2pmj7N0CE=;
 b=uPOUcEB+RmMKZ4SkkPlQgZeM6OpxWZ9HOxeSbU94PcpoeuFM+uIKP4pPW0IDn2xye9fcn75IJQ5VPeSGmlQ01t749PJlQdHIc7NXFUkdBARBPPVwuUjCL+H2hQ40K8wmZwvpEcKHF3LUZ7EeAycL819oHFoLhXc6NFhKgFKJop8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6583.namprd12.prod.outlook.com (2603:10b6:8:d1::12) by
 SJ2PR12MB7962.namprd12.prod.outlook.com (2603:10b6:a03:4c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 15:57:07 +0000
Received: from DS0PR12MB6583.namprd12.prod.outlook.com
 ([fe80::c8a9:4b0d:e1c7:aecb]) by DS0PR12MB6583.namprd12.prod.outlook.com
 ([fe80::c8a9:4b0d:e1c7:aecb%5]) with mapi id 15.20.8534.045; Wed, 2 Apr 2025
 15:57:07 +0000
Message-ID: <9f7ba2e9-58d8-499e-a67b-c79a647eafc7@amd.com>
Date: Wed, 2 Apr 2025 08:57:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/fwctl/pds/main.c:113:65: sparse: sparse: restricted
 __le32 degrades to integer
To: Jason Gunthorpe <jgg@ziepe.ca>, kernel test robot <lkp@intel.com>
Cc: Brett Creeley <brett.creeley@amd.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Leon Romanovsky <leonro@nvidia.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <202504020246.Dfbhxoo9-lkp@intel.com>
 <20250402122833.GB327284@ziepe.ca>
Content-Language: en-US
From: "Nelson, Shannon" <shannon.nelson@amd.com>
In-Reply-To: <20250402122833.GB327284@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN8PR15CA0005.namprd15.prod.outlook.com
 (2603:10b6:408:c0::18) To DS0PR12MB6583.namprd12.prod.outlook.com
 (2603:10b6:8:d1::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6583:EE_|SJ2PR12MB7962:EE_
X-MS-Office365-Filtering-Correlation-Id: 97df9dcb-f5d7-4709-880e-08dd71ff04d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dnNEM0FkN2pPRk5yUXEvNTJFdkRuWWtENXg2YzhOSVh1bEhocnpFajBiN0R1?=
 =?utf-8?B?RjBGOFFuUmNVcXRHbVNnajlkQ0FnbTVQWDQ1R1JiUC9PNmpGV25ZVlRYTGY4?=
 =?utf-8?B?MS9zN3I3QzhQNGR2ODk0c2h0eHByRmdBais0Y0RhYXlJZmFrVmZJWmdvL3Za?=
 =?utf-8?B?QXY1VXpxRENiOG0yY0p1WTFSWEhrUmhEUlVmVWJsZEZqUXJ3aXlpa0FtTCtJ?=
 =?utf-8?B?VE5ETHROK3AydUFROWpkUGNSNy94c0VIT3BuMWI1Z0tLb0QxSFNTanVYRWFZ?=
 =?utf-8?B?K29UQm81R3YxakM5UGRuSkQzSnJObk15Mzk2ZFZ5Q2JxaXIvdGZaYjdwNU1q?=
 =?utf-8?B?R0FKTmFZQzJZenNLNVYxK2VYS01sUHBRTTdRdlorbDQ5eG83MU9wYU9MV1M3?=
 =?utf-8?B?UGU4ODlUL3ZoZWw1N2sxMHFwOTdyclFjckxpbG5LaHNTQm1CejNhZU9VZlZa?=
 =?utf-8?B?ZDBRNGRCLzBUSHdFOWtmaUZSOFNSYkVMNnM3Q2hzSFAvNEhJV2ltWWtnTnpP?=
 =?utf-8?B?L2xsRFQvcGQveGNYYWkwSFhDSUE1QktnSXN2ZmRpeHdPeTlEUm13dWU4bXpQ?=
 =?utf-8?B?d1hyVjg2TythK3hzcUJsQU10RjJlaUFpdVBkUUkrNENTNDZlNVFjdytKeEVQ?=
 =?utf-8?B?cEZxaUE0N2pUUExNRGhxek1iQzc2TFhaVlZMYkRvVmJWNkVyVmlzajc2L2p6?=
 =?utf-8?B?Mlh4Ri9PK3d5ejY2YkhHQmxSb2hUVGZtaDNtMTM0OTRwYWxWU3lMeTZHWUtZ?=
 =?utf-8?B?S2FQdmw5VWZISWVRajBaZmsxd2RaREtxOUloYXI4L0lQdW9TRUNqd3FGb0Jh?=
 =?utf-8?B?UjAvY0lhWVpXWTZnL1pGQVp4bGNreVR6MVNkRFdTeTF5L1hMMGovVzZEWFFY?=
 =?utf-8?B?OFBHaVdOWU9tOUtnSlIwTzNVSUkwU2YxZXdsWXhKTG1JbGFKU3RWRmdXbWc4?=
 =?utf-8?B?MEt6VzROWWNpRzlGaklneUlQSDdSNHdqRHJMb2FLYnh5a0g0L3RHRXAzUUZt?=
 =?utf-8?B?MGhrcG1PdWVMRGx5OExCQ3QxRnB0NUEwTWFuOC8rMlNhK1RUR3JkTzFlVnN6?=
 =?utf-8?B?aW9oL01USTY4eFBVMzI1K0t3alpjMFJ2V1JzUjB2ZGV3elhtSmNLYklydURV?=
 =?utf-8?B?MHdVOTgwK3dTRkJ1djdQc2lJaGlDY3RaRVFxajc3OHpMSHRGRTRBUEprR1BS?=
 =?utf-8?B?SjkzK21JRTNBUUJDM2Zya0hGK2luUlRRL0VIS1l1QUttakYzUnh0Sll3dWlJ?=
 =?utf-8?B?VUFoQm9QQjV1a3ZvYjZDRmVCb2JMTzYyZkRqRnJMQklEdXhsTGNUaWFLd1da?=
 =?utf-8?B?SCtwRGYvTDdWS0Y1TGJZb3pCZ1pBTkxKeVN6VG5Pd2wxeWx0cnFTNXBmZDJ2?=
 =?utf-8?B?ZUhjbDl2K1JGelJYK0hwcEcwZjVFWFd1UUpEaWlWQkFwM3dEVGxmcmdPTVZF?=
 =?utf-8?B?MCtEY2dXbmtwODNIUG1vS0Z4emxmSGx3ZFRkbm5YM3NoQVEwRkVVcmoxeWFJ?=
 =?utf-8?B?M291dTRJNzZuTmJQTTJwZWFRTUxXTjNMeHZBWndwL1F2NlRoRXM0c1VKMS85?=
 =?utf-8?B?TFhkaVNINHI0UnhNYVQ1UklMbzBPK0xJeHJwQnJDQ3NWa3lWa0FYUFk0V1FJ?=
 =?utf-8?B?ZGlNNDNDSnM4UlRaUDByaGs3ZGUwaWN3cUpUV1NPWmxOY2l2RlFCbEJycXcw?=
 =?utf-8?B?dkVLL1FONVltb0lqT3pEUTZUZkwxT2h3bFJnUU9mMDRQbGdQNkJ0UW9oYWtj?=
 =?utf-8?B?aXM2aHRqM2M0MjIvYVFoaEQwUGdBRVdVbTIzWmd1VG1yOTJyM1NLb2FGS1Nj?=
 =?utf-8?B?ZEpYYmduWjNzTTRwVkRRdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6583.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a01BY2ZwaTFCN2lSb2N2RzRQQWt4dTlUb3pQbkZmRHZVS1kyZ0ltdWQyamhv?=
 =?utf-8?B?am9yQ2ZrRG9zWVVFaHJoelZlWG5Mem1hdGRTS1lzaUl5aHBZcy93VXhxQkZs?=
 =?utf-8?B?cjlEVlU5dmNxMzc5SmtXVUhhVEFScFN1VHFNRVJtZTJMZG5OMzZMTXdzRnBI?=
 =?utf-8?B?T3pwTFhPZFRTL0JRNStlWTduOUZMT3VNcWFlVEpITjhDZW5ZUi96SmpSTHpr?=
 =?utf-8?B?M01FbStBNU1oa0ZsY2lNWWJaVi9oOUhlM3dndkFPeVVmTCswYmNkVWZLQm1E?=
 =?utf-8?B?UEMrTVVBQkFkRFZCNCs4cGVvb1JWdS9UM1B5M1A3TDNMRHlhSE5FNFVZVDJt?=
 =?utf-8?B?VzZsaFI1VXF6NDNpbFBpSG5GSU1rYU5NbUlMdXhoaGJDZ0xCV3JEUjh4eno2?=
 =?utf-8?B?a0VGNm5rZTlHaGpUSXlLeHdvdzdFSTJKdzBqbkdWUFBZT0l1SVRUVzdZMU9B?=
 =?utf-8?B?UGtkUU15NEVIUk8wUGJPQ0M3emRwOHRoWEdVRW4rY3R0cHc0cGdrZ0xKelJB?=
 =?utf-8?B?ajY0MmE0anRkSlJGMVF4ejJxalV0MHNRcUZQMFowMkpZWTVDd0VwTGVpWUxp?=
 =?utf-8?B?aFZuU1BTbk1wZnBQbHRtbVpUQm42OHFIWHJob1FGRWw2c1V1QVFCRHlkQ0No?=
 =?utf-8?B?dFZIQ3pHTFBHb3hsS1puckNpNm9zYzlGaDN4ckdOQU1VSGo1bWhZa2lKVDMv?=
 =?utf-8?B?UitQVWc2eVFybVNFNFNiU1Z3NkVGbExaZHZGV0V6VmxXTTRJNGRpakxkaUtT?=
 =?utf-8?B?NmIvanpJUzBuNncwenFhcmxRNzZuZ1dvQ2UyUzdBbUV4VmN3dndiUFZ2a094?=
 =?utf-8?B?cUFoemo5VndubCtSVUs3eHROVys0Vmc2aElXY3NEYlV0TmJjU21SdXRhZFM3?=
 =?utf-8?B?VWZxU3Z6N0RGSU11azdicC95Rnl2VnVKR1VPaWpuN3crTkkzd3IvTCtYeUVh?=
 =?utf-8?B?WUZvaVN0ekUrZW5CdXkzaVY0NUN2M1RxWWNXUnh0WitFdzBlZzJlLy8rR2Z2?=
 =?utf-8?B?dllCOFZGS0tvUHFEc0ZNeEtKSzJ1TXZ5Z0ZMVTNBazc0czRLcitoWDdMakNr?=
 =?utf-8?B?VjdSejM0ZzlBOTFVUC9SMXVDWnNjWk9qaVlNQlRIcHFHc1BmdXI3S05NK2xi?=
 =?utf-8?B?SDJ0bzRKY0dxY0dYUnVvTkVoZUkvOWRocW8wM2dod0JuZDJoVi9yYmlYblMx?=
 =?utf-8?B?UEdEdUl0Zzl4cDVtd3VmTmRTR2EyMWErRlh6emthRGlYcll0bjd5N0V1ZS9M?=
 =?utf-8?B?alBCZC96M1loSStuNVYxTWUvZHZOVUhNY1RXeVlsTGkrNm9jcEZsRkJUdWVi?=
 =?utf-8?B?QmI0cDVRTWl1RE5mQ2NxbGMyUDZCZXNydmxsaGl0Y0FMdGlYTU90Nkw5RzJK?=
 =?utf-8?B?bmViS1l1THc3dnlFWURzS0pTVmFjeEdGKzhjRkpadHVWQnUxREJ6Vll4cGly?=
 =?utf-8?B?b2Y4SXRhMCsyY25rc3JFSXhSdnZBZXJoTW1paGhmZ1ppRWZqYjBRMW5pUHYx?=
 =?utf-8?B?RGZqS0ZZY3lSRHprd2YzRGhkYTQ0a3BIUnhuWnJiRHBxcngzSGtsUjFyK2hI?=
 =?utf-8?B?OVZPNmVmL2tPTjFWcEQwRHdvRWRmekdTWFhMUGZUV1hMaGtWTmUyQk5vOVdi?=
 =?utf-8?B?d2xZU2dJS2RvWjNYLyt4ZjdNNjd3OVNsY1kweUdzMXBlZDB4ZG15d2FXeE8y?=
 =?utf-8?B?QjMyUWNUN1c1R2ZPNEV1VEc0RTljSVVaOUJsT2VUdFE5ZEF1SUcvOWhydmZW?=
 =?utf-8?B?YTJjNVVTc3dId0FzQkNudGlRM045b29iemltNTlvblphV21EYk9yUjBNOU04?=
 =?utf-8?B?OE9BWTRRRXVSOWdKMHZqTVF4ZXhKbW42Vy9zZU5vdEdpYzdVSFhUU0Qyak54?=
 =?utf-8?B?RkZyMG5DVXdkaDhYN0MyUnpTK1R3Y2t3em1Pamx5SWhRSUNKUlpvK2x6Nnp6?=
 =?utf-8?B?WFFyWE55dFBSNHE1Z3BNcXV5cVI0MTFzNVdUMHVuY0VpNGdMdlVOMndVdENz?=
 =?utf-8?B?bWhpZ2xLRUp6eEtvNGJVNi9LelBvNnJxNTlBd2QxL0txalhNbzdYd2JZOHJv?=
 =?utf-8?B?bHZ0dEhnQ2p2OGFBSStRZU5ZWlM1a3R4RDlLaXdkVGZMU3VKQTBKN29kYWpE?=
 =?utf-8?Q?+lAHtpnVSlpBYimaSibZmpxll?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97df9dcb-f5d7-4709-880e-08dd71ff04d8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6583.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 15:57:07.0528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UyNtFtvwxlAcDNL5lyNZhOKda/Roww9lkU2n9ZQspJhjkIsWk0vhVj+2UbbwiLiB8qhYYaa2/nk2vQMzOx0zdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7962

On 4/2/2025 5:28 AM, Jason Gunthorpe wrote:
> 
> On Wed, Apr 02, 2025 at 02:46:38AM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   08733088b566b58283f0f12fb73f5db6a9a9de30
>> commit: 92c66ee829b99a860a90f62ef16df3e42f92edac pds_fwctl: add rpc and query support
>> date:   11 days ago
>> config: loongarch-randconfig-r111-20250401 (https://download.01.org/0day-ci/archive/20250402/202504020246.Dfbhxoo9-lkp@intel.com/config)
>> compiler: loongarch64-linux-gcc (GCC) 14.2.0
>> reproduce: (https://download.01.org/0day-ci/archive/20250402/202504020246.Dfbhxoo9-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202504020246.Dfbhxoo9-lkp@intel.com/
> 
> Shannon, can you send a patch to fix all the sparse errors?
> 
> Thanks

Yes, I have one mostly ready, should get it sent out later today.
sln


> 
>> sparse warnings: (new ones prefixed by >>)
>>>> drivers/fwctl/pds/main.c:113:65: sparse: sparse: restricted __le32 degrades to integer
>>>> drivers/fwctl/pds/main.c:202:50: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] endpoint @@     got restricted __le32 [usertype] id @@
>>     drivers/fwctl/pds/main.c:202:50: sparse:     expected unsigned int [usertype] endpoint
>>     drivers/fwctl/pds/main.c:202:50: sparse:     got restricted __le32 [usertype] id
>>     drivers/fwctl/pds/main.c:250:29: sparse: sparse: restricted __le32 degrades to integer
>>     drivers/fwctl/pds/main.c:288:39: sparse: sparse: restricted __le32 degrades to integer
>>     drivers/fwctl/pds/main.c:294:40: sparse: sparse: restricted __le32 degrades to integer
>>     drivers/fwctl/pds/main.c:300:41: sparse: sparse: restricted __le32 degrades to integer
>>     drivers/fwctl/pds/main.c:329:44: sparse: sparse: restricted __le32 degrades to integer
>>>> drivers/fwctl/pds/main.c:330:21: sparse: sparse: cast to restricted __le32
>>     drivers/fwctl/pds/main.c:330:21: sparse: sparse: restricted __le32 degrades to integer
>>     drivers/fwctl/pds/main.c:330:21: sparse: sparse: restricted __le32 degrades to integer
>>>> drivers/fwctl/pds/main.c:330:21: sparse: sparse: cast to restricted __le32
>>     drivers/fwctl/pds/main.c:330:21: sparse: sparse: restricted __le32 degrades to integer
>>     drivers/fwctl/pds/main.c:330:21: sparse: sparse: restricted __le32 degrades to integer
>>>> drivers/fwctl/pds/main.c:405:56: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] flags @@     got int @@
>>     drivers/fwctl/pds/main.c:405:56: sparse:     expected restricted __le16 [usertype] flags
>>     drivers/fwctl/pds/main.c:405:56: sparse:     got int

