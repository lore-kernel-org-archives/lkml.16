Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD6320CCD0;
	Wed, 28 May 2025 21:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748468482; cv=fail; b=mArofwDnJQhiXJP85Np/tRa/YO+e1fDQ6fsMG//iPDFWQWChwp1aBUWT4xHLgC7HXYbwKAsq2BXdW35nsTiYZ+D+owM47hNbZ5EVMLXLUJSjVjFoDy8UN6cJcQTq8ce+ZRP22+mFLHvpAubTJd5BUdupf3kFUKY6Q1IT0ICTKh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748468482; c=relaxed/simple;
	bh=vLvAmjSF2ymt3Mw19eUMKdh9bfVDJP6O32RBKBYH7yw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=a+0muq8Wl9d7ZNurv/xGrxxanH6AUZmcXiS2MO7etahgvZCX8zLs3pkJA5ytSiUAMCy9oLqVbTYlEhQ+JB47BuCe06NhYepuXroqOxEsaLeC+x7XwCu1eQtTk7mrPjuKLQ5ddxFeXp41fA2559CHCtqiPJSZhSZ/FfIQrMCKpio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=E+OSLVJd; arc=fail smtp.client-ip=40.107.237.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="E+OSLVJd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ycBGI1EMV5JDo39Cynm69AsW3Yxzvn7xdgnr+EvXNdG1fCXkpSS5SoT++nMZbL5GyrCmuqB0U58wTOVWlQ5vvpLFXPN/9wD0l7rV4yAK92MgydsGbI5l9FNY4q99zPWgS0POZag6iDoYRxyKdybzN9eL0oL5LeMhJ1tmTY7nvF8ytLYeprnCBRdjsXu+x/C//ZJZZF7U2ZOyNdKNx+h++sVcP4jvpN3Z8Ww/2efPmFj7TZmzmQMxwrwqPzG3KnabehSEn6bQHwkGEyfPhIySouxrmm31GAZU3xFYq6blS9hI8K4S5P7UcKjSlV0Y5wpE2U0ylllsm8YVq6vCxLPI0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3l8EYFtkRCJB7T90LSUlwQGVXrMSn4DIec873uoSTKA=;
 b=jdlcPLKUSS+mD89U29fsZFMoBpWQ31vd5nfGEH2YuKiELPQWyC3UEwBOfvhYmRdCMQDwqsnEGc0q/gvEROTJ/Df1E8EW0cMJCXhhaWzmvsMOqI9dhZ0sl1GYZjiTeUn5BwuOy6lRMovdIG4yfWDqrAP6p3djURcda1BuZ1EOQuOlUc4sA4P0JeDQXzfs55kG8Yx22FvrWK9G7x7uTyyhWAGb3M3uNyQOYPNjo4wH+314GwclfzGsEDh5oQ+qszljRf6JTM8eDAG2hLXtms1F6RnLFmIA2belV8K+Fhrs2qJjm2GZE2Kk/nmkAe+guJB5uR4bZ2IMrk6XvOhYBVb1WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3l8EYFtkRCJB7T90LSUlwQGVXrMSn4DIec873uoSTKA=;
 b=E+OSLVJdoQFOK2v8mPcb42gKKj6aWfpMRr7qp7j2yr2G2APnuyaljmairjmdmn+aBoFmlzTvL9aTbwVBKa5gyiseur00/wKxsfVyt/+w21vQGQIFRGqZzoJ7QnD753xItKu2yLXUG9r0eDe44CMNhR6A8XBRgMn2hhc7uIXtVE4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by IA1PR12MB9062.namprd12.prod.outlook.com (2603:10b6:208:3aa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 21:41:16 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Wed, 28 May 2025
 21:41:16 +0000
Message-ID: <396dbfa9-37a5-495a-adaf-7ec1fe6471de@amd.com>
Date: Wed, 28 May 2025 16:41:10 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: RE: [PATCH v13 11/27] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
To: "Luck, Tony" <tony.luck@intel.com>, Peter Newman <peternewman@google.com>
Cc: "Chatre, Reinette" <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, "corbet@lwn.net" <corbet@lwn.net>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "dave.martin@arm.com" <dave.martin@arm.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>, "x86@kernel.org"
 <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "paulmck@kernel.org" <paulmck@kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "ardb@kernel.org" <ardb@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "daniel.sneddon@linux.intel.com" <daniel.sneddon@linux.intel.com>,
 "jpoimboe@kernel.org" <jpoimboe@kernel.org>,
 "alexandre.chartre@oracle.com" <alexandre.chartre@oracle.com>,
 "pawan.kumar.gupta@linux.intel.com" <pawan.kumar.gupta@linux.intel.com>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 "perry.yuan@amd.com" <perry.yuan@amd.com>,
 "seanjc@google.com" <seanjc@google.com>, "Huang, Kai" <kai.huang@intel.com>,
 "Li, Xiaoyao" <xiaoyao.li@intel.com>,
 "kan.liang@linux.intel.com" <kan.liang@linux.intel.com>,
 "Li, Xin3" <xin3.li@intel.com>, "ebiggers@google.com" <ebiggers@google.com>,
 "xin@zytor.com" <xin@zytor.com>, "Mehta, Sohil" <sohil.mehta@intel.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "mario.limonciello@amd.com" <mario.limonciello@amd.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Wieczor-Retman, Maciej" <maciej.wieczor-retman@intel.com>,
 "Eranian, Stephane" <eranian@google.com>,
 "Xiaojian.Du@amd.com" <Xiaojian.Du@amd.com>,
 "gautham.shenoy@amd.com" <gautham.shenoy@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <e7e8f489ef148a4dcd5837d71c83efad47b5b7c3.1747349530.git.babu.moger@amd.com>
 <dd195d60-3e40-42be-88e5-7f3bbbba63ce@intel.com>
 <SJ1PR11MB6083C5179F98E3873CA34C35FC99A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <aDDjs4PZxeouNJr0@agluck-desk3>
 <CALPaoCj7FBv_vfDp+4tgqo4p8T7Eov_Ys+CQRoAX6u43a4OTDQ@mail.gmail.com>
 <SJ1PR11MB60839776B024017D65EF4E65FC64A@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <SJ1PR11MB60839776B024017D65EF4E65FC64A@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::11) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|IA1PR12MB9062:EE_
X-MS-Office365-Filtering-Correlation-Id: 67360a58-78a9-4e7f-5ead-08dd9e306007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGxSQTZFMTY5Vkh3QVJFdmthVVM5TW8vUUxIK1JPVlFONW5oZHFwaHR5MUdV?=
 =?utf-8?B?Zm44NEtTVVBoelBHVm5nOUxYaExNT3RDWVB4T1RRd2kvUXpxMCtMU29STWZD?=
 =?utf-8?B?eFdXTk9mM1oxcXpFL25rNEFNZ21IaGJNTlEzZXprbDBVOFB3MEQ1Qzg1dDhU?=
 =?utf-8?B?RGpvNEE5WnpycU8rYWxOUjhjUzFlQTZCWm90WGl3b2lQbU84bmRxZnNhdCt1?=
 =?utf-8?B?NVpweHlRTStVMHY0VmZVRk1rWEF6NE1BZEx3NzBocGhDS3RidHo3M1dHVzNm?=
 =?utf-8?B?UDkzZ3JtNkcvbnkzQU1nVi84RERsSnZreHpJR1VXdk9uU2dXM3dkTVpwMFNZ?=
 =?utf-8?B?Z1NxZmtOUWZCOWNyVCt6Qm9UU1gzYVJzWWZjYWFtekxudytWZjE0blc4WVJJ?=
 =?utf-8?B?VXJua3E5TUxkL3prUU5KeTRFMmVJamw1NXdPNSs4SUxQMFFBNGxUMlF6QmNW?=
 =?utf-8?B?dE5KeFgxZzNZRXN5MTMwYkZPMFV5eTlLSDk1MFNNazdIZlN5Unpkbjg2YVE5?=
 =?utf-8?B?TG44YUZselRXdFVpNHBza3prTmdvYU1yd0s5Rm1lclR2UW5aZ0tPb3lJakdo?=
 =?utf-8?B?M2oybXhwdyt5Z01Vb29uVXZ3ejdCazh2b3lPUHhCb0NLbW5jQlo3M3R3ZW1a?=
 =?utf-8?B?bHZTdUFsTHhlaytKc1UrQ1VVdzRoN1lkV00xaTE4RC9XWkU1UlA2d1JYcGF2?=
 =?utf-8?B?eUZPbVNpZXpscFVjYms5K0lrN05QR3ltSGRIK3BhRHhpcTQ3OGNhcWlZZGJD?=
 =?utf-8?B?aWRZZWdFdi9GV2pUQU9LMGpIS3pjbFUxbEhycUQ2WCsyc0tEZUsxZEh2NmIr?=
 =?utf-8?B?N1MxSXhwbTdJRmhSR2VoVDlGTU82YWtlNGpHNjR4T1JyY2N1MmtlbWo5aksr?=
 =?utf-8?B?ZHFiWEtneW5ldXJ2SWVNQjNlU1R4aUtHa3FuM0V2TVFSQ3pFcmNwTjM2ZVV3?=
 =?utf-8?B?VGNRUEIxVFpIeEZKeEdSd1UyUngxZTB5Vm5HcldQZlZPdThMd3kzZ240ZDl3?=
 =?utf-8?B?K2RJRzdHbkVDaEZaK2FkYzlqNEVENXRuU2NqVDNWRWRxeTdXSUh0dUp1SVNr?=
 =?utf-8?B?d1FIamg2SzEwZnF6N0MzbCtDTDF4MkpzUUViQXlSc2d2ZVNYczdBb1pNS1Vw?=
 =?utf-8?B?ZGRCczBNY0ZHb1luczJMRXhpRXc3U04wSkNyWmZrVmtRdVNwRjg3RzZ3R0pK?=
 =?utf-8?B?MGlCbC9yZkUrcGJiM3d1eFZIYzloblFNdThrQ0s2dlpLTEFDaXVpY2h6TGFS?=
 =?utf-8?B?Mk9LU2o0Zm1OaSs4L2dQM2ZJelRtYkZ1RCsySHBXbmxOZjI5STRrOWdIYU1n?=
 =?utf-8?B?eFNxRzFYS05VSkJMNHVzRWJ4MW9zUkV5bU9wbWZJUkxFdUxveUROYjAvTlVM?=
 =?utf-8?B?QjdqeDNIK01Pd1NHVkM3VDY2cXliQzB4a1gwdnFSRGJleGU0d21SbUVPWlZ4?=
 =?utf-8?B?UmR2Z3JxbWd6WlRvK0hBMXNLNFljRGRFOTJVQ0NrSmNRUFRVeDJ0eVpDWTZM?=
 =?utf-8?B?YXoyZDY3cXltUDBhUHdRUGg0MnZtQk8zUW40UHhMVGo1NmxMY3J6V1dzYXE4?=
 =?utf-8?B?YU1hQ05lOU5SQmRlc1JScjgyTm5EaXc4eXBYMU9TOWVFMjU0bFhuK25nbUd4?=
 =?utf-8?B?NEZmeExrWFJocThSQlZmNFVNOFlLZzZrUlYxaEgyODNFd21VTWRTQWFiWXdt?=
 =?utf-8?B?VUVubnBWekc0cjY1RDNqR2xacDNoMk4xbTZTcUY0MkdmaWpoRVc5ejFyK09J?=
 =?utf-8?B?bXd4N0pSRk11ekZFdHNBTlhsaG1hSFB4YkxRRS9QT29ZbzRIbUF5aElVM3dj?=
 =?utf-8?B?SEl4L1k4djRzM0orcTRWeG5jZHVSV1pRaWZFS0VrSjJOSDQrSmJOQmVtS1lu?=
 =?utf-8?B?RGE2REdpWUM0eURjdWdzTnBlYzZTS0NYZ1ZHZVd1cFFZMTRIS1ZlQ1YwUlZl?=
 =?utf-8?Q?ALhHqxl2XC5ZiEdXiYBYwUh4jc7GEjSf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0pDYzhzYVRYUHcwZEUzM2NodHpsenVSWkI3TzUxbzR2OHFwVXBTaTh2N1dO?=
 =?utf-8?B?SzN0Y0VRVWlmZ3F4cUJ4RzZVVWdoVWJ2cCtoMjF0UmMxcGdGY3VCQ2tIMEZj?=
 =?utf-8?B?c3RnL25rMkdQZ1NacXRKdnVzU0xRMURWWHZ0a0NwdjdsSGZKRmROV0Y4bFFG?=
 =?utf-8?B?RUl0MGs4aDR0TVUyQ1ZpWlNWU2pBREdLUG9WNFk2cDc0czBpSzZxZ3NGZHFs?=
 =?utf-8?B?ZEQ4ZjExTjh3NTBCUHFkT01EbFBPNW5DUEUrUmQyYU1BdWgyWFd6WjFPM1Bm?=
 =?utf-8?B?d0VjSGw0MXRBT2RPcGo0QldyOGdNcjNCU29UaGUwR1hFblpuZDNRYTZUdVlp?=
 =?utf-8?B?dGI3eVFqVzVnQ0V2QmJDWlJaSnBmc2pGK3FzM2NHbkFzMkIzVWZyaGFOd3lx?=
 =?utf-8?B?bGFKdW1YV2MxSnZxOVYxb01xNmxDRTFTYXZWUGplUFV6ZGI1M1ZkSTM4WVd1?=
 =?utf-8?B?M1l3aUhXNHE5VDBaWWY0YzFmU21LWWpXL1VhdE9LK1lzd3VZUE9YdTB3RDRD?=
 =?utf-8?B?T1laK2hCMFpMWGpDNDhTblpiNVNxcVVrMWxHTkVuTjRINmRQNXprSTR6RGcv?=
 =?utf-8?B?NVhrMVIzTFIvY2Y1Y0tIVHFHVUFVRkFZK3RyUXNtMUxJc1ZvSlFqWG9KY3VR?=
 =?utf-8?B?dG03WU91bGdxaDBFd0l5VUlUVzlKT2FZc1NDcWJrYjZGWVBkQ2VOZnAvS1Jl?=
 =?utf-8?B?aXhzUkVIYmdKZXkzL0J2WGhoT24yR3diWkNVa1ZTWGhwbTJ6eWNlZXR5VCs4?=
 =?utf-8?B?aUY1UGo2M3VPazlxem5VTkJ5Nk5yUFNQY255ck9yZDJsNlZwU2h4c0djaHNQ?=
 =?utf-8?B?NlFFOXB4aU52c1hUMnB6YjRDTVZmb0JkOEhrLzRIY0kreDFjK0htbXJlT1Nx?=
 =?utf-8?B?VWsrYk40UUtWdWMvSXQ4TmlpR1F5L3duWTV2RGd4MFZWdThEWTBaM1l3THpO?=
 =?utf-8?B?V0paUktKSkp6TGw1UTQzMXBqY3pVL0VXbjJ6bUlTZ2hQTTNzODJZdlhkWkMw?=
 =?utf-8?B?Wk5Pd3FMUUpoanFNV1FWOWNQMkZ2dWxmQzVTS3V2bGYrR3BoWS9NMWZrSGN2?=
 =?utf-8?B?S0V5dVp0ZGV3dHh1Q3FBNnlodHgxT3krYUV1VGFFVmFqVlV5ZStCNDNUQW9M?=
 =?utf-8?B?OUxpdWU3d3llbHVPR20yaFEreFJmQXoxSE5VTi9rUlVHZ2JxeEV0VWVNU1pt?=
 =?utf-8?B?aWhBT1ZWVGh1Nis5ZTJCTjFaU2NWelU2MS9oeEhMNXhad0cvTDQxanR1TjYr?=
 =?utf-8?B?U21zS2RxSFRqWDEvM2dpRW55S3NGbk45YmpuSTNjdnlYcjJlN0tQNHZIbFJU?=
 =?utf-8?B?TTBFZlJOTWwwQ3NNTFRiMjQ3L0RYTkw5RVFjbDE0ODBjamlJMGh4WDV4NmJh?=
 =?utf-8?B?dE1GWUNuRHhNcXlZN2UxNk5YMGJkNyszQStnSnhmenJSa2RhNEVnZzFtOFNC?=
 =?utf-8?B?MDRmcklFNlEyR2U0VkFscjFvekRpQWROSmZQY1JLSUp5ZUluUmpySnBTcjc5?=
 =?utf-8?B?U0k2bWFNVm1Lc2pGUFg2dGJ0YUVuU3Q0OElML3pwdlNwa3p5SmxLTU9tcGRH?=
 =?utf-8?B?Tkp3L0QwUTF2WW5qSVZReTFtYnFrSGY4Y05xeDdlM1preU1aaHlRWXJhQjZH?=
 =?utf-8?B?SjFDem5tOEZaNU1lN0NiKzR1dkVOa3g5MFpQS3hiN0ZpTnF0SEZzblk5Z3Nn?=
 =?utf-8?B?cStDdzNqMDVkaVFGRmNGZkxPTHJwMElBYVkzTDdiZ3g3eU51K3o1TFdxQ0VY?=
 =?utf-8?B?bi8rYXpPdVJRTGN2M1I1ZGhiTVJXcXp5UEJIWldrdjNhQUVPREFLT2Q4OXVP?=
 =?utf-8?B?dC9BNXZvaHBNUDlldklQYVI4dUMrZjdnelJ3VlVEMjYrNzZWMjAzRkpyMFU2?=
 =?utf-8?B?M3VIS3ViL2E0M2ltcHFnSmtuK0tWQXlTejhiMklLUEc4eGQxRk5BMDlwRWFi?=
 =?utf-8?B?eUNyWDh1NjdQQk1QU1JYWXJNOTVaeXNJVTNLbXJZUDFjSGNtVHV4V2dwa1Vn?=
 =?utf-8?B?T0pDME5RVHZHcStvMEUva0xOcEVnbGtXQlZCYVFhclV6cjVJN0YvZU1CVjN4?=
 =?utf-8?B?Ni9IK21OVVoyY1UwNkowbUxsQ2VXY0RCaHR4WlNVeFVvVXBNbWpkNm1GVnZp?=
 =?utf-8?Q?C5Vo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67360a58-78a9-4e7f-5ead-08dd9e306007
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 21:41:16.4538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T1fEorysRHH0hO4pmqfBvfnIu0DsMsomjOTvFp3yKwM+7KSp2qbzCYFWP623bsYe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9062

Hi Tony, Peter,

On 5/27/2025 4:41 PM, Luck, Tony wrote:
> 
>> Thanks for applying my suggestion[1] about the array entry sizes, but
>> you needed one more dereference:
> 
>> -       size_t tsize = sizeof(hw_dom->arch_mbm_states[0]);
>> +       size_t tsize = sizeof(*hw_dom->arch_mbm_states[0]);
> 
>> -       size_t tsize = sizeof(d->mbm_states[0]);
>> +       size_t tsize = sizeof(*d->mbm_states[0]);
> 
> Indeed yes. Thanks.
> 

Tony, Thanks for porting patches.

I can actually pick your branch [1] and apply review comments on top for 
v14 series. Hope that is fine with everyone.
[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git/log/?h=my_mbm_plus_babu_abmc

One question though: Where will the Peter's fix [2] go?
[2] 
https://lore.kernel.org/lkml/CALPaoCj7FBv_vfDp+4tgqo4p8T7Eov_Ys+CQRoAX6u43a4OTDQ@mail.gmail.com/

thanks
Babu

