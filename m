Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D491C84D9
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 16:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746203466; cv=fail; b=RRni4122XAkWZgDrnLmUE8MqG2+VZz78+5ikiKMFrjxu1ZFM8cg0K5AtrWIqJAABR6WchVR3mN2/OVVTJFHnqusmszvGnTyMW3u6JXJUsy4TDO199rtrXojreh1RdikOXZXZkq0ld2rqcJHVn8/5t+II0kCjddsM33JT2mkWHi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746203466; c=relaxed/simple;
	bh=HABDSf2K1UWc9AFgsFeENUIKy5uNfP4869nQRoTOBkU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=m5ggTZgB5V2y5DoKJOgmEETKezZpY/ZNav1oyJj/I9on8kTPW/HPtSWGiq8v0b0AqBlc6ekw1FmrPPBbakhiCl7pr0gPULFbRlENkXaqDN81A90AZb0W8wOwJCGzoVejAcUdLdXAP1lTlIZ/QnuGWbEmA4BrwPLtDE0z2+N6F3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MqR9RbU/; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MqR9RbU/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746203465; x=1777739465;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HABDSf2K1UWc9AFgsFeENUIKy5uNfP4869nQRoTOBkU=;
  b=MqR9RbU/PH82MrwsILwE3mL5Xq1x66RNDbqMzbnWkWNzEnxT9yd3m1vv
   3i0klFwGfvR+Wm2u+J2roxpRm9cNAS+imzgGqUGa1Y/2pNMEAteubUh4N
   kjvZXpjP4ZXk1/AdTXe2csAGc9Ma+2LI96RNFIqpeCN//xmDOWug/mg8t
   rEkc+r96pnNHLdo1ff+gvpDtDLSxedxxh7uSTHYnHsOnjx0KxgqjjleRo
   ltJ9xvAP5cuAjNFRqhTKYRxNwuHXoOCI74kwabjJBJSs6E5wWBo9BQuju
   pcRmw0zsGhy/CLJU3uHkPNqhMOShKK6EghqBpsSLWN1EkQwMADFDnifmw
   Q==;
X-CSE-ConnectionGUID: mvOKbp1ISMOXuMvk8JrvkA==
X-CSE-MsgGUID: 9ug0SoxuTTONbWC1K6RBLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="59274490"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="59274490"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 09:30:50 -0700
X-CSE-ConnectionGUID: Ng+nqvhXS5+aEaFmEtUpDw==
X-CSE-MsgGUID: 2cpMVay3TeyBihykILMjPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="138698242"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 09:30:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 2 May 2025 09:30:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 2 May 2025 09:30:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 2 May 2025 09:30:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XlkwLeLcsHUBYvKbNTsffZ9wpTZAT9kZLbjuDl1h6Bhn7l9srcdFUA97F/aBxqAz+t7hDumwsBQyR6K6vEnoFE23CX7QFQGIATY4p4tzCEW/JPtJfR3oPTycgyvmvRaLPu5OdFgV73ygxBaqSFD/cT+o1OpJl4aZ2t1N7Ce0+Hg1LNlLaH1MP7aZ15pV805/R3ISQe85c32jzn0N0TcQtUW/N2UoI3jar09aMP2FmjFRBdqZOJ8mtbksS5hUp0mw1xA8Faj0nrvkTjV54V3CbFCIgxRG9V5+Mxa3BhLuBda+zAUnM5PDCnzqX0Q094PGfQI12L0r6v1SMMLpK6nXVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8eAV2mO1aK7Co/xi/qt8P2xJ0Id3QVstYx7HqH7J2cM=;
 b=tRUvyKu47gkfBqgmjNKDvOqKVltiKRf4mEHvd1Wz6XSR8xHORtt5a3U2Dbowj8HPE0a6pXTbkYsODC1W+i1S+cHnCUklueXIAfgHSNdW6GoRIeQgUiX7Jcri0ooGx0aj+8tLXHsc5Or3cHwTeJi2F1lU8zUMbJKOZ0nbnXvTbClCTsJmHUxlcnJlNv27qOMmTLQVLNMAUwAUXrCpvbcS/ilYtmZPcSpu08tZWC/0TgqUmAVP/zqJH/blx1XmB7XAea8W7/5a8fOgSLdDqR6IwafjbZdtr1LUUgC1ushg6daVNshI0QBBCwZ2rPzmJONoiiLkQOs3kTwLljxIsbyODA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DS7PR11MB6224.namprd11.prod.outlook.com (2603:10b6:8:97::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.24; Fri, 2 May 2025 16:30:11 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8699.022; Fri, 2 May 2025
 16:30:10 +0000
Message-ID: <f8bf0815-4013-4485-9ed0-a5b5ffab9f26@intel.com>
Date: Fri, 2 May 2025 09:30:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/27] x86/resctrl: Move the resctrl filesystem code to
 /fs/resctrl
To: <babu.moger@amd.com>, James Morse <james.morse@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
	<shameerali.kolothum.thodi@huawei.com>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
	"Dave Martin" <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>
References: <20250425173809.5529-1-james.morse@arm.com>
 <76b16ef7-2f37-4c30-97af-1d372b7fb251@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <76b16ef7-2f37-4c30-97af-1d372b7fb251@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0089.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::30) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DS7PR11MB6224:EE_
X-MS-Office365-Filtering-Correlation-Id: 7793b701-8b6a-470a-450b-08dd89969b4a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bm1iSTRDRTlXVkowYVBkR2tBa3A3a2FwUEdJM3dnaDFhdG1tNTlscTJuNjhF?=
 =?utf-8?B?cno0VGJuRWNQMzh3NUo0VUtnMHNLM2VRc1FqSUd3Z3E1TlBDcmRGakR6OWIw?=
 =?utf-8?B?OHdjUW45dzZuK3pHdGU0UTNNc0IvZWsxNklYZ0Vyd2t0OEVkZTdxcUdYTVJ4?=
 =?utf-8?B?U3UzclpUZnFEdTJRMGw3N2dmN0xZVWpJVTlCQTBzNmRoODFvUUdTdHI2cUNT?=
 =?utf-8?B?cVFhM3ZhbHFiZmhoWEhiV3UwMXdiR3ZIMW5oYWcwOUdMTVRwL09URWh4ZTI0?=
 =?utf-8?B?QVBEa29GZ20vUXVLSHNmeU91R1ZRYkd2eHdJckkwc3pRd1kwSTFlMUhsdlc4?=
 =?utf-8?B?bjlnL0ZsMjk4enExRms1U3B3QzNpK0pzZTIydUZsbGtLUTZBMk1Ha0M3UTJ3?=
 =?utf-8?B?VmNKZUs3ZExrNWtnOGExbExxdUtFamVEbjNyNmNYdExNQTYwQUNyTWwzcmww?=
 =?utf-8?B?em4wSlJLeEV2MmhsamJoaStXTENJWEFYaDlha2xDWkg5NExnUWdtWnpyU2Ns?=
 =?utf-8?B?YzZKaUxLUE1jMmE0MnFodE5FeUNpc2dISXRmSk1iM0JhMmpBV2J3blRGUEMz?=
 =?utf-8?B?ZGIrQk1SNHppN01NbldpN0JpVkZKUi9waFdWaU5mWkVsanBxTUgwQU5VVlJD?=
 =?utf-8?B?WHM2d2t2VDNZRW45TTVVVWFzVVZXVENBWCsrL3lUR0laeU9TUUdsV2xSeEdE?=
 =?utf-8?B?R2hCUE52WHN6UDhsdHRCL0I0NTdxOG1QSFRTWEdJaXdvVlVmWlZ5VCt2QVVS?=
 =?utf-8?B?b1R2NmdGZnBheUhFeDVDUThnaXhSRmlKaG5PYTNlY2FGcmlQSWZ6OVJvVWtl?=
 =?utf-8?B?TkZPUlpLclZVM1NDLzl2Qk95Q3ZOT3oyM2VYa1pnZDh1clJEK0xiQmNqQ1Vh?=
 =?utf-8?B?YWQzSjczV0FKS0pNcm0zWm9EU3RGT1lpU1M1ZnZXeWdiNHQ0d2MrR0xtTERw?=
 =?utf-8?B?YS9sTnVSQTFnWnJuSS95MTFEL3p0RXRpdDhyTHl3a0c0SS83YkswRHBGWlJv?=
 =?utf-8?B?cklsQVR3cFNOa2RmNEsxdzVocHlkSllKenArYnIxZFJyYllmSlZyKzBValo2?=
 =?utf-8?B?bkVnWkNnS0FRWm5ROFh6UTNXdTNjcEQwRnZkNXVHb0VDWUdDNmtLejdtL1ZF?=
 =?utf-8?B?dWNOQlVsb296cUhoblZkZ1F3VGJVOGJSOXZwZmRoaTQxVmJsNDMwMi8xeUw0?=
 =?utf-8?B?T3NSNUxqUzVWVkVaU29HRmhoTlhDUWc5S25JZXdNQzNydUYxdytrYSt5TW9H?=
 =?utf-8?B?UXh6Z1ZaRVA2YUdNKzJRbGNyRWhPSVI4SjN2bldsQytzSnE0c3U0NlBJSElF?=
 =?utf-8?B?ZDd4NzBpZ2tEdnROUHBpZ05SS1ZKK040UjcwWnlkT1BPWWRGdXdCSW5uVlBo?=
 =?utf-8?B?MlJiTkV1dUpPYUIvcmVXMTI2QTJ3U3NnOXFKUCtJVEwwKzh2TnVxLzIrbkkr?=
 =?utf-8?B?QWpKUnBxN0Y0WmdEN2luRGxqUFhuK2R2MDRLTU5wNjhEbjVMMHcwZjFhYkg1?=
 =?utf-8?B?QTNKa1BNSHErRFlKNEdOTVkrTGFDTmN1Vkp4cDd4M3lFOHBYK2s2a284SHRy?=
 =?utf-8?B?bW93TEh3aXV3OXJvOGtuQmd1TFViRVdDQkZ0eTVONDY4L3JwRUVoMVE2QjdU?=
 =?utf-8?B?NVNDaGtld3FKK2tldXdFU3VTUDYxK2ZxcVgzTkFhSWw4aHowV2FOcGU5cGhv?=
 =?utf-8?B?RG9XcHAxWGIzZWlhM2NVN2RwanhFamtadXZaaE1PdG54aHJ4Z1N5ZEVBZXFG?=
 =?utf-8?B?ZFVtbWw3SU1MTDZBWHJkL2gzM3Z2a3VJU0lhSVlHaVRwa096MGdQTTJtYkc4?=
 =?utf-8?B?VUk2WXlrZTJlQ0t5NWhhdXVWektrWDNiS2RYTWVoTVpQMlpCcnUvVU9ob1B4?=
 =?utf-8?B?dlZZeGxzcUFTa2VmRS9vVThXazJ5VWRURWszSHVWME1QUnB2dDhOS1JrTTZG?=
 =?utf-8?Q?K9JP1+Fj/nY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0hSeGtSWUtlRzlpb204dENqcG11ZGtOblg4MjFFdnhSQjI0SGtMTGJWRmNX?=
 =?utf-8?B?SWJUNzlka29XM09WZy8xVnVkcU5neUxxZXBFMmdUNU5PN0VoeFJ3SnlFVllr?=
 =?utf-8?B?ZnZ1Z1hTSUZjV0R0M2lkbWtDMjlpcFVoWVNOUEVmaGdacUhZYTE2a1R6U0E3?=
 =?utf-8?B?aHRqSFJ5cCtIK2MrV0V0SkNJVkxHdmVLR0NUS3VsUS9EUDhlZ3VVMytYSzVk?=
 =?utf-8?B?c2pQTm5HbzVGMDQzU1hvOUh6NmZkVGh0M3JET1dHK1pGck8vMGNLUmZ5b0Uz?=
 =?utf-8?B?VjExVlQ0d0had3c5SXZCVXowTTdHcXh2NkxENFlUd1BzZkxES1B3NEUvRXM2?=
 =?utf-8?B?ekxSNXdOWHZIWTcvYXNuMzcwZzB2VUVvNUpmdy90bkNPVUE4R09QS1I5bjJQ?=
 =?utf-8?B?SlFjcmoxR0EyMGs0L2s0V0NUbk5XVkNyd1dKeXdaV1A4VDIrZjJmYjVpYWdX?=
 =?utf-8?B?RkoydDR4Skl2MnZ0WkZQSng4U2pkL2l1VGFTVUwwelJRSnRzWllwb3IvQzhy?=
 =?utf-8?B?ODF2c3dtVEFualI1ZXB1TU9FTjdzOGpraTJmL21RY3o0UXJUeEJkR3d2RTlE?=
 =?utf-8?B?akdnNFRrY3VxKzhCWGJQNWlwU3BzRGJhSUx0NktZRXYrUW1ESDh4MjhtT0x4?=
 =?utf-8?B?ZGFhdkowWnFhU2p6N3JCTmtwK0N0ZGVCUVRtMk84MklvNTRwMjhGbUJuWVlk?=
 =?utf-8?B?c0ZmZjdDRVFrUFNBejRsLzEyYk9LN1ZHL0w4M096OW83a3RBV3BMS2ZQd0pV?=
 =?utf-8?B?cEQ0MUpZeHFSZGU2eXgwSGJHcmdCUTJJZ1FGNFBLZW9ldGNNNlhHOWNZak92?=
 =?utf-8?B?NCtUU3o2bGdMZU92eFYwMlRPNVNIQ09DdGJ2QVNPQzV5RXVXaWpZbDNFcFRM?=
 =?utf-8?B?cGR4QXQ4ZFIrbitYdmE5NWNBb0ZZRHFSckxhTTBhR1FtTk13b3VkWlZrMHcz?=
 =?utf-8?B?MGsvWnBHc0U3dUs3MEEzcGJKYmEvcy9sSjlDcWpSM0prQzk2eG50V1hUaFhX?=
 =?utf-8?B?Zm13d2owY2IzWnN5NzZiT2hRNTdIVWJxZUswbEtjRmNacllwOXEvdXdVT2Ix?=
 =?utf-8?B?Mjh6NHIwNEt4NmlNWFJ1UGVRQVpZK1gwMWloWFpxd0NBRkFIUEljUEhSejZ0?=
 =?utf-8?B?OFVZd1F2eGJMVXl3RXE4ZTRuRElkRVRsQnR5RWFrT2dyaVhEeFIvTnNMVVRs?=
 =?utf-8?B?V2c5MmI5YUo4UlF0UG1yZXpXZ1pjc0Q1M1JIUnNjOWJjdVpxQkpiNG90YjJ1?=
 =?utf-8?B?bEJXZWFVaHhNUXUrb3RvaEZFQVFkOWZENUVORzJHVmdNV0ZlNnN6NWdLKytW?=
 =?utf-8?B?UGdWclNDbWxRdGFWMXZKalE2Qkl1S0FtUzdDNGp5VHdLREh2S3N3NWdFdUlo?=
 =?utf-8?B?cVB5VWxYcjgrcEJ6NUY3VWV6OWE2TFdWdEJmbVZSL2dVdVQyWjVYQ0dUdWsr?=
 =?utf-8?B?V3B3WkEwN3BLb3NxeGdsbUtyUTRPbGU5ZmoyRmpHekZRUmU3MmtoMGlSczNY?=
 =?utf-8?B?Z3pYV2hpM1FsSXFLOGkxL2hueVg5M1A4UXJXVWJDWFBEaTdaZXRCNFFCakZ1?=
 =?utf-8?B?d3VxMzY3QzZpb3dnSDFqL1pDS3JBbXE3NlV3MzJSSm53SVNVeFhWQUFBWlFs?=
 =?utf-8?B?ZllpWlR0ZHVDS2dBQXR6YXB1YnROTVlZMGd2Q1BMaldnRndXYnR5TVByMVVB?=
 =?utf-8?B?cW5iRVlzVUJ4SEFBbWJpVEduR2RrSlB1UWtmV1EvS1haeWlGeTh5US9kZGRl?=
 =?utf-8?B?Mll4Z1h4VjZwUVdhOXQvU3VlQm1TT0p4eE16OUcyYzNrQUZDYUd6MlU4dEta?=
 =?utf-8?B?MWlaUlRJKzBLYlJIOWhqUW4wZ0l1ZXJuaDVoencrY0swako3Q2hRcys1N0Q0?=
 =?utf-8?B?YzlEUVVYT0hKVEtIOEM2eTRZNys5OTNVbHRWdkllNDh4bjR5RTFZbmJxTnE0?=
 =?utf-8?B?K0RNSXhnQTV5OEJMNGFsbk9iTFE2anB1U1BGT3JkS1VhRzZqcXg3WGtWb2xY?=
 =?utf-8?B?SnNFeWZvTGN6bDlxelNPdjBvUGN4MWZMQThDaHRsUjB1ZkExZWNDdC9RZ1Yx?=
 =?utf-8?B?UU5SUFJSNmpuOVYvaUZTc0RnRGtGT2FURXVrWStWV1F2S2JaT21kam9jU0k4?=
 =?utf-8?B?NjZEL3A0R1pLZFpMMEZ3NnhOU05majcrRnZGc3IxV3AycG5lSy82WDFhNUNK?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7793b701-8b6a-470a-450b-08dd89969b4a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 16:30:10.6483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fhpVng4H0iZTPXtQ19F83dYq2gBAvoPcggnnM8FpbX4hrfVJthZmkkvCt3B2whqUxwp1/szLEqcjc2hunJN54jmBaHP1zdQ7JbKids/Onyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6224
X-OriginatorOrg: intel.com

Hi Babu,

On 5/2/25 9:04 AM, Moger, Babu wrote:
> 
> I retested the patches on a couple of AMD systems, and everything looks good.
> 
> Tested-by: Babu Moger babu.moger@amd.com

Thank you very much.

> 
> It's very likely that these patches will be merged before my ABMC series [1].
> 
> I'm currently working on v13 of the ABMC series and considering rebasing
> it on top of James' v9. That could potentially eliminate one review cycle
> during the merge process.
> 
> What are your thoughts on this approach?

Thanks for considering this. From my viewpoint this sounds like a good plan.
I do not have insight into James's schedule to support this but from what I
can tell this work is close to being ready for inclusion.

Reinette

> 
> 1. https://lore.kernel.org/lkml/cover.1743725907.git.babu.moger@amd.com/

