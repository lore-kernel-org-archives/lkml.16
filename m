Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C4521422A
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 22:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746744353; cv=fail; b=JT2Fk9LPT3SdeomwOwXcylA2S4y5S00PvkoQoC/oCehQBTkabejbKn2BvUp8zbSrS/OYcIIzWywc76YwZXf14w4IOlhjEgoD/H8KTdIMVPyh//JI7I4roOuia2ponRqSakJBh07fz8AHV0NY14d5sd2HOR7nIwtRYXs+Aw2yFD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746744353; c=relaxed/simple;
	bh=1c/GxbGTq6r1foYgWKlgPXjUD9yq4mKpXL+Vo7wULAM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ts67RSFP25PV2w9juZlirBOKzjSSHcdsl5fsj9/v6ZolTosTEehDWXxpJnYEzAelf7V2GwNW/k/IkKA5dfBB094mFE8q9WbhMoR8McUCiCUZ8jLz4OmbMx0M01t1f5qz+/e7z+/BLj/I5102iOOcp7RJTewHLGKJrtHnztOpSMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cNnXVSgH; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cNnXVSgH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746744352; x=1778280352;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1c/GxbGTq6r1foYgWKlgPXjUD9yq4mKpXL+Vo7wULAM=;
  b=cNnXVSgHVeVOe6/y5t2XlK/YUX+2I8HrH6CvnQCVVqXNmkIbGeorUeTg
   jnj2nQe5GnsmoFxkB2xKGrttoGLyKCoI1Q+vYn7lIXqYDiqDMtXB22JGa
   FSrqBNdWrYeLFpIiEB9DBYhryuukagKdLEADVGFQYZbIUbbqatQXGYhEF
   han60XfrJEmLCqis7YStb31raSNV9PH1yngqs+qkSHudshC64a6oppyYD
   GbMq1EQdqTapVA/esGQ6IerkHMQmutVY/Sg7mE7kBpqIRIagH9KJ7RZrv
   yPXH4x8/fEWSpDprcco0G7Sic7rfWdppmKEoaYlLAFjdtynmUpP7vAC0P
   A==;
X-CSE-ConnectionGUID: ezqBcoaZTnGzQqTzkoh+jw==
X-CSE-MsgGUID: uGOcJF6qS6Ctk8KbAfPy0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="66088218"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="66088218"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 15:45:42 -0700
X-CSE-ConnectionGUID: FwD9q+9QSGS042iV1IVwLQ==
X-CSE-MsgGUID: YTB9pvxFSEycjo/N213mIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="167373804"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 15:45:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 15:45:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 15:45:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 15:45:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tR0qD/X1NQ0PS2650s8efgp4vbKtlY94kjpCtMTkEo8RcPrNQjlSIFv4cWjCOdLmh6jvdAOlaeLt4vFMkBoWq/ukEbNI8EBg6TjAgsBYvpCUX3qIRUBWLuE+Tfl28WqVmt+QvESCwNmYI5avH3LcT3UwPoYHid0kHzLt+E2NorRicP0OYt+YtGCQjpXiHCokv5klZp/cqxXASfJPy5yYurKTpqyPbz02UU5iSi6VvsrE/GE95oEiRwezUm16E6BAeU0j7vizNjex3i4Ps2I9QMkcnjsYfnTaEqJHvFIYlRLE7WZ8/Tzsgp1Eo6Zp0/lfCWUkf5ogI+mfvs1uyQzA6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wP1uxzYADQKKAC8L/ua2RvpAG0bwhivhS+0kuRTjmKc=;
 b=Fd7YVgOzpFZ6u78HMovS0NM+ginr5O+cwzjgqfGmH1ut4AR5eoqwqBG1UxriIwUiHlm4VFCZq/h7rMAlpTVKsTR6P5tWmSoTywcXsRiEIlNFJiAD9vOyx353u7iXungNrrNJ883N5dMR7eeNCWtN9SyR1OeeJP/N6QU/nrQPgIBMq3w4KBkwqPNIgML/nmaACgSiwRUTRZEvUOmnP6+5KFr+3myrNe79JBCQKp8I4LxBT4ddNnUBRVvUUSKV0xKQb2fUQ7Z/DS8fra7XcMWKucQUVLZczXARoydCwHz+pu+Kpweuy7cJyewlqUsIkIDDyQD6J2QAlBjvj40ILtMfKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SJ0PR11MB5007.namprd11.prod.outlook.com (2603:10b6:a03:2d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Thu, 8 May
 2025 22:45:35 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8722.021; Thu, 8 May 2025
 22:45:35 +0000
Message-ID: <3e573f62-3204-485a-870f-4cd469390855@intel.com>
Date: Thu, 8 May 2025 15:45:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 29/30] x86,fs/resctrl: Move resctrl.rst to live under
 Documentation/filesystems
To: James Morse <james.morse@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>, Babu Moger
	<Babu.Moger@amd.com>, <shameerali.kolothum.thodi@huawei.com>, "D Scott
 Phillips OS" <scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
	"Dave Martin" <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>, Shaopeng Tan
	<tan.shaopeng@jp.fujitsu.com>
References: <20250508171858.9197-1-james.morse@arm.com>
 <20250508171858.9197-30-james.morse@arm.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20250508171858.9197-30-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0113.namprd05.prod.outlook.com
 (2603:10b6:a03:334::28) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SJ0PR11MB5007:EE_
X-MS-Office365-Filtering-Correlation-Id: ba7c9bd9-4417-4033-a111-08dd8e820b9d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkRkWGoyU0RMVjlJdkpqZUkwYWhzWHNYald5elhDcTlhMEdEUFJBR0dUdTJM?=
 =?utf-8?B?cEwvS0RBNG0vMi9SQ29lRnJrYVJUUGI4RlBtL2E2MUN0NFRGbTl3L1F5Wmky?=
 =?utf-8?B?QnFZaWRtNmN3Y3dlVzFydFp1eEJSTmR2cGhCY3Mvc3BqNGZJVXlBc01YVVc2?=
 =?utf-8?B?NTdiRG1JZDl1ZWxIYS92RW9oU2xrZVdFanJIdjZPd3BQRFFwam9SRmlJZjNE?=
 =?utf-8?B?cjVBRTFhWDdrWDE3VGU1SmRqRVJrLzErU2JjS2MvQnRHYURYR1RSVSttNzdm?=
 =?utf-8?B?WkMxK2pDS2VtTGVKakpHRkJCQjJTZk02OGVOSGFDUmxUcmRTc1dRVmI0M2xF?=
 =?utf-8?B?bWVWVFFUWHVobi9WNm9RNHhmUEQyTWR1T1dQeXFVa1BJdlVwQU4wRy9GSTA2?=
 =?utf-8?B?VlU2Z1pHR25NOS9KQlZNQk9vOXJJN2hwUEpycG9lS2Y1NUxRV2tZY2J4WjFz?=
 =?utf-8?B?eGlsMkRidWVvbSsrZmZwMmtYOUtsa3JIN2g1bXZVVCtGL1puRDM0QkhCQ1JY?=
 =?utf-8?B?UVRDVjJGdlFxaGRtY1ozWGN6Y0ZYbFNRREkvdHgxam1WamtiZEsreTJPcWNK?=
 =?utf-8?B?TUVZcXN1TUk0Q1l2emFySTNvMHdLbFlPbXQxdlhLM2dIWlRlUHBXdWhDS2gv?=
 =?utf-8?B?VitiUXJWY3lUejFnMVZTdmw2THRIaDh0dWVQeFFxTjN1cmJrRXpaTStSZDRW?=
 =?utf-8?B?WE9FVjFhL01IL0xoTmNXYnVUWk1lSDBpYktuNFNmbzdMdytRSURyeDljSmFZ?=
 =?utf-8?B?SC94WlBPbllnWFlpVVZRcDU5WkM4czkrL3ZaRUdBSWphaWViSlNyZHRiRXUy?=
 =?utf-8?B?MWlCNkg4QVhPRkQ0YVJNVy8rbXV3QmtJY2ZYa0tybEEyNFBKZVFPN0xzTDZ4?=
 =?utf-8?B?dlp6N3B0VjY2WkNtdC9xMXFlM1VxN2VQK3FHN0pFdjExN0RPZmpJazZpSWI4?=
 =?utf-8?B?NjFEUjd6bkF3V1FycDQxc2hMYmJOY1ZoWHV6bWduNzJ4MzZLTGp6NFJxUEdn?=
 =?utf-8?B?K2NWemFhRzlFcFdtZldMemFzM091ZnNBOFMzZFBnMTNtb0dKOW1OMmZ5ZGNw?=
 =?utf-8?B?YVFTRHU1azJ0d21BUk0yeXN6ZXhFMGFJMjJjWVlVYTV1ckgxSWtydmxkL0RG?=
 =?utf-8?B?Mm1FR09tVkxFakF3aFp0Y2tJWnhpVmk3bmNaanQ3NU1sWTJ3OThZL3ZEYXBX?=
 =?utf-8?B?bTgzWG94aHBhK3ljMExkNlhremNQNnZkY2ZpMVIrNkNxVEhMWTVCdTJLWmp6?=
 =?utf-8?B?WGFDYktoZ24ra2ZNa0lmcDNFay9yU1FKSDhFTWFnK0w3b05DU2pCMGhxTURO?=
 =?utf-8?B?OTBKLyttRCtkMXNjRjdjQ0xYUlVCRlRLZUFLR21wZmlqa3RSNG5pbXFIQTdC?=
 =?utf-8?B?dThXVE41azZSdU5CdDJENnMxQWlYd2kyVGVYQnhNOXRWUGNXbjdNemUvbW8y?=
 =?utf-8?B?N2tHMmFBVGsrUnVKeXN4VzhIYVBjMnBzRzJnc2M2cm55aGV0bHJsQytEVDEz?=
 =?utf-8?B?bHFPcnNsSmxLL0FCdzJ5ZEdoZEpZbDBvZU1FcHNvSGNHN1JRTmVEaE5IaVNB?=
 =?utf-8?B?M2FEajMxaVFhUE9jWXM3SmpNcUxHcGNoaFpMdXdlMWdMZkxnb2t1UHBWSmta?=
 =?utf-8?B?aC95TllxMFo5clNNYnlCSTVWMTlDZGcyZHNvNytsakFiazl4QWY0b1RSaGlQ?=
 =?utf-8?B?OFNhNmNzRjBrNnJ5TUhjNmFRNko0TWx4aFVRUnJLK3ZZMmxGKytBWkMyNEdv?=
 =?utf-8?B?TWhXWGR6WW9OWEEzcUxQN3dydXQ1WW9MbFRoV2hrdjVLQWY3ZUdIZzNHbFBW?=
 =?utf-8?B?YThpY3BHS0hsaDhVU2tQYm11L2VpY0cvYmROQ0ZEeHNJU0NWbkJnUERWczJn?=
 =?utf-8?B?cFg3djJVb1B4UmtoTGFVZlFXNWtGNkZGbys2Z3dtNjZybDdsbmRBR0p6RU13?=
 =?utf-8?Q?AQQ2eIRD5EU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGRYN0ZzdThjak9qNllocUY3am1oaXBtaXhpWk1Zb0FOVFQ5NmV2ZHVyYzhD?=
 =?utf-8?B?ZzZjc2RubTgrdENHb3k3cTNxdFY5aUhFOG1oYWZqTys4VHJseHBEMnM0RTMz?=
 =?utf-8?B?aUY2dG4yU2xkSDRMS0U3YXdxNlpIa2w3M3lHdzZQbnA2dHZpY1VnVUY0ZWVX?=
 =?utf-8?B?dVplbVNSajRJN0FzNEl4MjZrR3pEa1dwZThrSlU2am1wZEhxMmpEYk9wWXYv?=
 =?utf-8?B?TU9oaGVZbVAxdTlDKzI4MlhQMEpBSVAxblhHRnQwajVLR1ZMNkdWS0RpbEQw?=
 =?utf-8?B?R1BGT1MxU01yNUd1ak1wRU0zU3NLQWFmYmVQS09TeXJPNFZ6a1pkQTE0MkhX?=
 =?utf-8?B?L0RaVUpYc050dkUweGxSVXRvTlRYeXdscmNqOTAyb2U4aTBsYkFxSFNrWDEz?=
 =?utf-8?B?K3lSZGgzanRDejQ2WEpKLzhQaWdYTjM5bk4yTG1UN2Y3TmVaV0ViVHRVQ2dL?=
 =?utf-8?B?R2E3ZjUxQ2ZINDRmMFUwNUV2MGZSNy8xN1NWNFJWdHBzb3NPc1UycUpOUTk0?=
 =?utf-8?B?TGxoVDF6aGViZUxUSEl4QVp2cDJWUUJ4T2JGM1RMOW1vVmYvaUxTb2ZJcXhB?=
 =?utf-8?B?b3cxVnRZU3llSEt0YUUxdkR0WEVOalMyTGltd2hXV1B6Qzd1V1dUMUVCR1FJ?=
 =?utf-8?B?anRKTzlwWWJqMHR6T01xVUh3SFdLVklranVpMFNIQkRXV1Q3TVJpanZ0RkZI?=
 =?utf-8?B?S3hueW1BMUlUUC92d2tFblVZTTN6c0c2dzhad2h2M1J1Y1lodk5VYVZ0akUv?=
 =?utf-8?B?blBNRVgwcFp0ZXpsNHdDQ0k3RGd6RUxMaC9PbG8rWGJsajEwemk0RjhSRUU4?=
 =?utf-8?B?UkUwNWMzY0tGOHBrcVc0WjZpVkV2ZWZLRjVScFRSMjJaOU9pYjlYQXl3OW4v?=
 =?utf-8?B?L2N6T1lvcXcrSGRPckttZWtiTis1ajJCZGdjREZuZGdocTB0N3RGd054NlZh?=
 =?utf-8?B?bTRFc1dWeGloVFFMWUloVTI5d2xIaGNZUkl5VGNPMjcxWW8yRW1HNzFBWFQr?=
 =?utf-8?B?UDN0V2NUcU83Wm55eEllNzlpcDhBNXpiY21za3lNd1h1alFrWjlEbDZlZjdX?=
 =?utf-8?B?WitNQWJJazgyZVJqYitxTDJTZlMvMWllTUFGNjdEQUcxYks5TDBoa29mRDR0?=
 =?utf-8?B?MDFTVCt4NnNNVldYWXBIVHpiOVFkQlZaVDFkMXFiaURiUXVHTVJhMm5HbzBu?=
 =?utf-8?B?ZElPYjhUUkxVVyszd05wQ0h5MFBsUDBFSnRHNnZBc0RDU3JLU0NJT3FLa3FM?=
 =?utf-8?B?VlRqTUV4c0d5ejBjUmh3Nngyc3VsWlVITXNJVE5lOXc1L2d5b2E0dXFkMXl1?=
 =?utf-8?B?VWh4YW90T0dMSXNuUjI0VFUvNlZqYXd1UStNWmJLZTg1aXhoSjRURHBNSlNu?=
 =?utf-8?B?UGVnOFlOZ2JpQzNkT1o3OVhaTDdkUThDZmMxWVRkTWoxaW10Yi9VeVVCS0tP?=
 =?utf-8?B?SERFdGhFUHQ1Nm5Kd0hJRGVQeHdWSDVidFl5Wlo0T3lpTFltYzA3TFZueFlz?=
 =?utf-8?B?YXdETDdRWURRYXJnemtqOG1DY1NOTXJXYk90bXdLTmlvaFJJZG1rbHRxelBr?=
 =?utf-8?B?SkJvV2crYWprRFN4S0l3RmsvdVJOdHMvUTVHS1lCb0dVYzY1VkNuMzU0LzVF?=
 =?utf-8?B?ZUV2RmdVRWs1bncvSXUwb09MS3c3eG8wOC84cE1TVm1OUUR2R0xGRVBWb3ZI?=
 =?utf-8?B?Q3BUUmczdkZDVXg5c05EdTJoS1ZTSC83bm9oMUU5YUNWblBWb3NlNDNOYjNT?=
 =?utf-8?B?UnF6Y0ZvaXBNSlFKS014OWluN1JMU1AxTFcvVFFsaFdtV29tK0IrMFovUzJB?=
 =?utf-8?B?RzRpMFBBazhnQnNqazVrbEtTUFhJbW1keHo0c1AxM3ZsemdnYWdjZ1g4Wi9M?=
 =?utf-8?B?Y1Robk1CNTlkZFAvWlJlR3ZvWkh1UzJYVWtrcW9pVVowaGRiWElrNS9MVmlS?=
 =?utf-8?B?UzRLYmlFd0NJRDRpQnVUL3lJSCt6ZS9SVjRlOVRtS254WU1BUFBXZksvR0RZ?=
 =?utf-8?B?andGWnhscnRtb2dxa05HNjZudWZVSTBCVkFuY2FnUE5VaWNTblVTOHhWTzhU?=
 =?utf-8?B?WlpNNTltWVhMbTNQSWYvQWVoRWcvWUxoclhZRjlKMG10Z0V6VGllelRWSFQ3?=
 =?utf-8?B?ZWIyOUtGMXR2bzNRTWlLUFJpcVZjZjJoTUhQZWswcXM5UWp0ZllabmI3c3Mw?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba7c9bd9-4417-4033-a111-08dd8e820b9d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 22:45:34.9587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4TKvK2j4KKkNia1RjPOLkPzhcaA1ED7aA8ASnCh47wkXDNXUudK+ZKCtvSnFydEAEOHfF02Pdd7Z+KIhiMmCYaiaFJnd4F7kPcsfqrz5QXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5007
X-OriginatorOrg: intel.com

Hi James,

On 5/8/25 10:18 AM, James Morse wrote:
> The filesystem code has moved from arch/x86 to fs. Move the documentation
> too.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Amit Singh Tomar <amitsinght@marvell.com> # arm64
> Tested-by: Shanker Donthineni <sdonthineni@nvidia.com> # arm64
> Tested-by: Babu Moger <babu.moger@amd.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> ---

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette

