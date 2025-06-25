Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C299204863;
	Wed, 25 Jun 2025 23:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750893943; cv=fail; b=sPsQJXsVtwklU4bO5ROem6ZmQBh+9etAprQnuJVe6kzAEgC4zUM9qGSpSzZHtMtq8M7SrjS8IzRJbGVqboqKjg3pHbgf7tanIWNwzRnDNi+hBKZHHZjJXlefzD/6rSk5s6ZJ3kJom+7QTW/5nif8eM6jVEjA8fXDIlhUnkkZdz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750893943; c=relaxed/simple;
	bh=CjlTDLWQTyAkoVmnNeN6SSmX0OIvq1bsQaPh2rLyX+w=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oSLGSlQXlJKQOsspA0pWeCLQAEVcriqR85pyYokHJYixyCukKwnQd+JxRpkwltSmPEEw6iysiMRNqVsXG9TYSLfMrTFRhp5evFJOmoYo7z29CjAreOK8JJWZKpKDYcEpuW6YaxjsXgynZBmKxVU3xg5c4EpubIFAU1U1Lr2Lx9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FsxZ2XMb; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FsxZ2XMb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750893942; x=1782429942;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CjlTDLWQTyAkoVmnNeN6SSmX0OIvq1bsQaPh2rLyX+w=;
  b=FsxZ2XMbv+WaKfd08+S2bKfZ6XH0WIno6mrlzzvyRjGW75KBsZ2speeB
   S3U8vbuGeLhxnxE5Vqfj6R5MECN/ZhYgHrpIpcz0UUQeAL/3PR2aOZDu6
   udF4xJ9dsFFa3ZZYQ7ARNeu/NaAD8YIh97HiUrMY0Kd/5Z5kLAjTX88aK
   D3b9AoiLmsZUxEWMPiDN8edEW9qI7qT+VzNQ1lnXFF4GqgxH5Q17PzwbS
   UIhyxH2LNhMY4V19cjoF0fi2I6cBI/+0d8eVbs5/hZfey+r59ky0QhJgu
   Z0Hoo3tay/OKz2CZlwWaCV1gxm3puPTTEsCusdcM9ZoKufaivYlqTCd+j
   g==;
X-CSE-ConnectionGUID: pFaBE7ztSjqj3d2zd7rKbg==
X-CSE-MsgGUID: +BJzcWYbRx2/wk26SzjlqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53248844"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="53248844"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 16:25:41 -0700
X-CSE-ConnectionGUID: OERb1KQuREWltc/nENZ6nA==
X-CSE-MsgGUID: nDp1yxBJSXK78XgMu49HZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="151874925"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 16:25:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 16:25:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 16:25:40 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.58)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 16:25:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uULrkDEfSHvfl3XY9k0M4hBedlMz+uxIbTsPBKGoeRLvxSP3caI86lvrA/nlotXUtlAoYTfxLVNFudsYNukeokuGfZ2z9r28x6Yrzx4Do2U4iOIL8pLoocHP8pA4Mfz+sqNp1Idjw9hq3j3GlgjIB6+65Sqpq5j7/KYX2jIQa+OfNzujtSKj2LuKdmIqdQuPzdJtxAKszpRa6qLrZcm3ReP0AS6XOFq8LgQ6pbmlJ/pHojK3b/e0a7oAvDP0AqOCSHebNN8nCIlsqiuV3lXZZl61IHpRlfOkf6YTdM6JXJzNjdS4ytpAbB77QoDJ/eQM6329WUzoC/S34xFZWtQosg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTy3ctUR5dRjlArDMLvJyRIqT41eFXNEvilMRDrDgrA=;
 b=NvfE1Wyl8Oseozy8ZSZMryA7tb79z1Y8fL+lQVgYgd9nDLqYBvwHhUeoRO1iDo9EXFeaaaCMbLM2QFwfAWa/6wGgnKYhgSQVLT2j3xmT3lYMh2Qusw8Y936XO3zUTUhXNsqD/PoHKeBw2h/MxJQN8JwmXSUzCho4wsF4J4JRdfPYNcPeBuVdH33MXVE/zzU1aHq2FBMcmsaEfjyx2TRr58yXlhr8HXx/QjEKjvl748TlvjODjOgpjMHiVjfQWlLeDMH8/hh37GAcBbyLUOCZJfMfpeW4i6T0Qyd10abUasbnY7TBEylcyTTI/RCdFqEsUo64bsrZ8645v4+Rg3iqHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DM6PR11MB4529.namprd11.prod.outlook.com (2603:10b6:5:2ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 23:25:21 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Wed, 25 Jun 2025
 23:25:21 +0000
Message-ID: <c5d040fa-1e27-4edd-a808-0ef9811c2e9a@intel.com>
Date: Wed, 25 Jun 2025 16:25:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 27/32] x86,fs/resctrl: Auto assign/unassign counters
 on mkdir
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rostedt@goodmis.org>, <paulmck@kernel.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<manali.shukla@amd.com>, <perry.yuan@amd.com>, <kai.huang@intel.com>,
	<peterz@infradead.org>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <gautham.shenoy@amd.com>,
	<xin@zytor.com>, <chang.seok.bae@intel.com>, <fenghuay@nvidia.com>,
	<peternewman@google.com>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <cover.1749848714.git.babu.moger@amd.com>
 <e20b41f127668098a9e662e866767b582878b98e.1749848715.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <e20b41f127668098a9e662e866767b582878b98e.1749848715.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR2101CA0026.namprd21.prod.outlook.com
 (2603:10b6:302:1::39) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DM6PR11MB4529:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f9ad8f5-d7ea-4a47-c8b1-08ddb43f8daa
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlQ1ck9kWGFvd3NXNVc4RmRwaDNvNzdHTUI1Wnh6b0JMQkpqZXorc3k4bWF5?=
 =?utf-8?B?RXJVV0RxL3dLb0ZDY3cxZTZlQlM3V3diSnNiWktyalQ4Z0Y5STNlUUdrVFBu?=
 =?utf-8?B?ZUZIK3Jka2hCT2pFZk56TXQzd2Q0ZlFCU24vQlhGRkg4aG5pSTN1aG1pK1VB?=
 =?utf-8?B?Qkt3VTFXT1VhYXE4QkhYbjBsT3FHZ1ppREU4cng3VmRYNXlEcEZXS3hjOGJH?=
 =?utf-8?B?ZEtPUmJKTnIyV2Q0NlR5Wit4c0M3ay9Lb2JtZ3FoL1ExOTZsSnk3THA0RmxQ?=
 =?utf-8?B?Q09wY3pxMHRlNVkraWNvZXFoSTdCN2dmeGFzaDR2YWFSeWExUWU4dlFjS2JL?=
 =?utf-8?B?Y1V5VWN0UDg0bm1MWGNUbEZFVkhPaUc3aTRiUHdGNUxnZEVSTFhzQklIcjNq?=
 =?utf-8?B?Q1gwdmlxWDFRM2dBQk5nU2tqMSsrNkdnTnVEbHNkQ1IvQUQ1L1pHTG03djNv?=
 =?utf-8?B?eVBCR2YwbENTZHdiR25zeHZrTWt1aUwybTRRdTdVM1FWQmFsK2tsVEtBd1JV?=
 =?utf-8?B?eWgwSjI2dmxhaWdRWVZ0NHI2R0xHclgyRWhkZlNGMUdqSUtFbmwzUmtwaUEv?=
 =?utf-8?B?YUEzdHpDRVYxOVJ6SGNjb05iRzVEVXAxcGhiZnNMR2pJVEdMdGxySGZpVFU2?=
 =?utf-8?B?eExVSytSb0pnK3V0ejM3M2N0bkpmT2ovcFpOdXN3czFJWWQ1L3BjU0s1Yzhj?=
 =?utf-8?B?SENOL29BNExDdHZmY0gyZ0puS0RJb25NVnU5RXVvWHVxU0tuRTJOVFZMZjk4?=
 =?utf-8?B?YzBxVE50UkFwUlpRRnk2ZG1tc2FGRVFQNzdkbHVzZ2ZVS08yNHJKM3RQNWpT?=
 =?utf-8?B?d2R0bUY5QmQzU254Qkd4VlJEWG9VNmU5T2dWbmJxSnhMVVFwY1lPd1lDU3hz?=
 =?utf-8?B?dGZiVUZNSlJSdGIrMXlTWmZ1SDZ5MGRVdC94UW1oRUNsZ29vbmJ5eGNhQjZu?=
 =?utf-8?B?RmwyeU1xRGswbUpiWGxJbmRwVHVTY0E4ZGRQK0IzVjF6NVcwV0NTSTZkMDNt?=
 =?utf-8?B?bGlQMGRma0s2MEhSdTVVK1hKOUFWcWtBUXZ5dFpVWGcyZEFEaXRuei92OHNq?=
 =?utf-8?B?KzFkZzVFL2Zla0FHbXdtQWNCbUszU1ljc3ZQcnRjUk93cnBsQVh0ZjZ4cXpW?=
 =?utf-8?B?QnlzS2VwaE9VMVVJUHA4N0JGT29BamFGYko1cCtBTVh6ODFOZkEydW1udUxH?=
 =?utf-8?B?eHJ2Rm10ZEd3NjJ4c2hQQ1RuVzJIVjg2VkZyS3BkT0lHUkI0WEtDUXJ5Yk5G?=
 =?utf-8?B?NVpsUWp5RUg0WTNYVHl6NUlDZmVra09NYkJJTjZYNWc0N1QyMXdrUm9NVllD?=
 =?utf-8?B?TDdXS2xRN285RFRwYkxlNml6L1hMcWxhdGJ6TUYvMk1oNDd3WXArK3hNNkhj?=
 =?utf-8?B?NmNkYndFWktMWjlwa3VzWFlDSW15QklzTk4xUEVhSHZFUjArYWF6eUt0UStT?=
 =?utf-8?B?OU5ZTnpPc3R5bGgxN05WV1dWRlFZcVlyeE1lUk5wSkhJZnZiL3ZEZ2xmandJ?=
 =?utf-8?B?R2t0REVCMlh3NEJXbWM0dDhPT1BDMU1yQUpNTG1MVXJvSWozMDFmSE1IYWgy?=
 =?utf-8?B?UjBlSDlZMjhENmphdEFGcU1ZbUlJdUk1OHl3TkQ1c2t6WkZlMlg1Q052bkNs?=
 =?utf-8?B?bVI5dEtlMHNnb2RKM0pLWElvTk56cFAyWkd1RjU3ZE1pVm5Eam9PaHVPRUtl?=
 =?utf-8?B?czlaT1pFY3pCSUZmUVp0dU9ERXJvSTN5bmdXWklGSkpkOFhUeHpKU29hK0lE?=
 =?utf-8?B?cUFhcGx2RElrNnZDQ283T01iQ2NCUmdlbGhBNHJZdUxGdkUyWDlpRDdGQjli?=
 =?utf-8?B?THM1ekwvOFU5QXNwU0k3bjhBUzVjTmF5TVgvMWdWNnN5eGtzR1JpekF3Y3dS?=
 =?utf-8?B?djk5TmRtVzdQUGg5ZWt5dnpoVjY4NitRM1hNaURoVkdIV0hOWmpDVTQ1WXNz?=
 =?utf-8?Q?T8NgqZrf33Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkJsMzROM3JSeEZBKzNLbk5ROXZXUnFqUW1BNXNuZy95MXNLSEltZ0NRb0s3?=
 =?utf-8?B?TEhoTTNEUmRhVWVmOUhxQm5zZUJsUGNnUnp1cnFUb2ZuN293Qk83Wk80YzVL?=
 =?utf-8?B?dkEvTGN5M0E5VVAzeGtpVFdrL1gvRWNNMk4yMWNJYWUyVi9ERHpYV3QrdGJI?=
 =?utf-8?B?Z0tBeEZqT0ZHZC9VVW1MbmxrbGhXb3FHUzc5ZW5XdTFsVzZaQmlIYWFEOERS?=
 =?utf-8?B?QW5tenhDalVPOU96VXFPZ2Z3UTdPbnhFZ1VmQTVIQjZ6bnduZGJqN1R3ZzRW?=
 =?utf-8?B?RXRyWFZNc0dXd1R4cEUxcXRUUGpVbVE4Q29JYm40c1Z1cVZ6NEppTlRxb1hF?=
 =?utf-8?B?SkpNdFowOGZrSTNDUjlMVjZmRFZvNjA0SWhOUmFDVDFkMWJ1elM5OXoyMWNM?=
 =?utf-8?B?eWJYekVZS21vVm04Ym5mWjhKSk10ZUVsVmR3WGg2VXNvSGY2U0crb2lOWVZL?=
 =?utf-8?B?a2R2UDVjN0pIUXNoeUNkMUw3NWRDekdlT3dqZGd6MkNBaXBuVFlyekpmZ2My?=
 =?utf-8?B?d0NHSUQ0TEtIYndLbm5ZMHU0MCt4QWw5Nnk3QXZYOE5jamJ6YWdNVHNjRzNG?=
 =?utf-8?B?WW1YU0pDdjNrM0tRREU0aXp6UVNqL3BEZ2RiUzVNc2h5TFFsb0lBanhkVk5o?=
 =?utf-8?B?MnBIOFFlS29lQkQwTXhtYUl6QjRTWGgwK21DTDBJeVRiQWhydzBlS1pmclBk?=
 =?utf-8?B?aEdJTVhEZkY0cmlUL3J2Y0M0TGp0SktTUEhtZjgwWHkxR2NXbGEwWXBEWmc4?=
 =?utf-8?B?RHBEeWgxQ0kwZzgwZWM3SG5DR1M1OEJNSVJqb1pua0FSaGUveHcxZFZHNGpO?=
 =?utf-8?B?VW52c2Vmd3VoejN3Z1hXWnBCS3NKNWhldlRVV3JKKzBnNWt1Vmp5dUJDMmxC?=
 =?utf-8?B?eTNlK0NOTUd2U1FCckFkQjJ3ZGEwOEI1WEZPdlAwUTVLc29qd1Bpb1poK0FJ?=
 =?utf-8?B?ODFYNFV0UWl5ckM2VHhyVW9IOWNKTFpnM2JyUXRtVHJNdTI3VENzLzQ0Mmdm?=
 =?utf-8?B?amo5Sm4vVmlrdkZKbmpac0lZZ3NKSUZLd0tHUmVOSmdyOEVuOGU1VHJuK01R?=
 =?utf-8?B?NkRMYUplU2hXVkt2WXM1T2k1THJRYWJuSDBmREpGWFJ5WnNaYnV1RGVCbVA0?=
 =?utf-8?B?VStaYjNLWFQ4UUhQTDNjOS9XeWxreWRGWFNwQUU3UE1sNmhIUHFCeVdPcW9v?=
 =?utf-8?B?cUI3NEZybmVoVVEvTmt2WWJ3b1doNVRDd1ViRVJ0VENZNnVtLzlsVzlKNnQ3?=
 =?utf-8?B?cHRyeXhhWDk2SWNTR053aWFodDJzSWFtYmV4SFhqM3QrTDB0OVdkWGtJa1dQ?=
 =?utf-8?B?RUpWRVJmS3ZsTVVSL3lWTitnT1ZKbXB2WDBxbDllYk4wTGNveTFobk5pd0dS?=
 =?utf-8?B?RWZBOXRsUyt1amhVNGgxa09NRi9rM05uS3pkOXJsSlF6cTRQY3huSkJjcHIz?=
 =?utf-8?B?MDJOVkc2MjJSTDkxdXBSS1BKUnMxeTZlWmpiY2RWRnFSZ2hTVHMrckRUZml6?=
 =?utf-8?B?UDRMU1oyeVdhdkV4WDVqWFNOSllDK3JMdzAzWlMrNHVhRFNpaUxIMmlsTkd1?=
 =?utf-8?B?RFlXQmtWbGJwNHhkVmVPbDNBdGZqR2Z4VnFYZjczb004ckNwbXlwenNMaStn?=
 =?utf-8?B?SU5LaVZITFgxRmdta1VvMVI4Tml1bFZZcXQvbHNLTTczMW50bC9RblZzd0pD?=
 =?utf-8?B?QXdMd1Q2N0pVSDJrTUo5RGphWG1Zd3ZlMXZRVlhZVU81aEZaOFRxQXRBLzhR?=
 =?utf-8?B?VDV6S3RJZkE2emFtN1Zjb1RhWEpSdlpjbldNL3N6TkV1cHJsQS9zWjFOZVg0?=
 =?utf-8?B?NzJSSi9jWTBrb3krK3ZGaGo1Sjh6dVFFcmJzTFJ1Q3hISW1kM0Jyb043WGli?=
 =?utf-8?B?TjgwQkRJZVRjM3BEZnNmUVo1OTJ6K2RCNUxGOEN3clZmQVF0bE1qcnl0Rm9N?=
 =?utf-8?B?eDF3cnBxSDJmZEVPVWlXSzlZM0duVXRoQ2wyd0tBSjRYc25hU2FyT1E5eEw5?=
 =?utf-8?B?dVo1ZEtXYW9BbVZ6djRSbnZkOEQyeUx6Tm5DZFJJSGRUUEkzZDVNczFSZWpT?=
 =?utf-8?B?cjlXa0paSytDb3orR0l2WFdoMDgrcDNQUXFFOEUvMllLOTRDYW9QYlBabW9l?=
 =?utf-8?B?a3hob0YvcDh6cDJPVnR1aDJpU2pQVjQxRFdWZnVPa282RndWM0kyd2VBYW92?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f9ad8f5-d7ea-4a47-c8b1-08ddb43f8daa
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 23:25:21.0561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E08qrBweJf9Nea4hNXYX0psCgiqSVIB8xMh2U1Oxgd6AQaMl+29akaB2+6qj43xhiuxfxOCjMUIopHtEjOckEKHUo1NL1eWRi6H2bFAa1fU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4529
X-OriginatorOrg: intel.com

Hi Babu,

On 6/13/25 2:05 PM, Babu Moger wrote:
> Resctrl provides a user-configurable option mbm_assign_on_mkdir that
> determines if a counter will automatically be assigned to an RMID, event
> pair when its associated monitor group is created via mkdir.
> 
> Enable mbm_assign_on_mkdir by default and automatically assign or unassign
> counters when a resctrl group is created or deleted.

This is a bit confusing since I do not think mbm_assign_on_mkdir has *anything*
to do with unassign of counters. Counters are always (irrespective of mbm_assign_on_mkdir)
unassigned when a resctrl group is deleted, no?

The subject also does not seem accurate since there is no unassign on
mkdir.

> 
> By default, each group requires two counters: one for the MBM total event
> and one for the MBM local event.
> 
> If the counters are exhausted, the kernel will log the error message
> "Unable to allocate counter in domain" in
> /sys/fs/resctrl/info/last_cmd_status when a new group is created and the
> counter assignment will fail. However, the creation of a group should not
> fail due to assignment failures. Users have the flexibility to modify the
> assignments at a later time.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

...

> ---
>  arch/x86/kernel/cpu/resctrl/monitor.c |  1 +
>  fs/resctrl/rdtgroup.c                 | 71 ++++++++++++++++++++++++++-
>  2 files changed, 70 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index ee0aa741cf6c..053f516a8e67 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -429,6 +429,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
>  		r->mon.mbm_cntr_assignable = true;
>  		cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
>  		r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
> +		r->mon.mbm_assign_on_mkdir = true;
>  	}
>  
>  	r->mon_capable = true;
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index bf5fd46bd455..128a9db339f3 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -2945,6 +2945,55 @@ static void schemata_list_destroy(void)
>  	}
>  }
>  
> +/**
> + * rdtgroup_assign_cntrs() - Assign counters to MBM events. Called when
> + *			     a new group is created.
> + * If "mbm_event" mode is enabled, counters are automatically assigned.

"counters are automatically assigned" -> "counters should be automatically assigned
if the "mbm_assign_on_mkdir" is set"?

> + * Each group can accommodate two counters: one for the total event and
> + * one for the local event. Assignments may fail due to the limited number
> + * of counters. However, it is not necessary to fail the group creation
> + * and thus no failure is returned. Users have the option to modify the
> + * counter assignments after the group has been created.
> + */
> +static void rdtgroup_assign_cntrs(struct rdtgroup *rdtgrp)
> +{
> +	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
> +
> +	if (!r->mon_capable)
> +		return;
> +
> +	if (resctrl_arch_mbm_cntr_assign_enabled(r) && !r->mon.mbm_assign_on_mkdir)
> +		return;

This check is not clear to me. It looks to me as though counter assignment
will be attempted if !resctrl_arch_mbm_cntr_assign_enabled(r)? Perhaps
something like:
	if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r) ||
	    !r->mon.mbm_assign_on_mkdir)
		return;

> +
> +	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
> +		resctrl_assign_cntr_event(r, NULL, rdtgrp,
> +					  &mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID]);

Switching the namespace like this is confusing to me. rdtgroup_assign_cntrs()
has prefix rdtgroup_ to indicate it operates on a resource group. It is confusing
when it switches namespace to call resctrl_assign_cntr_event() that actually assigns
a specific event to a resource group. I think this will be easier to follow if:
resctrl_assign_cntr_event() -> rdtgroup_assign_cntr_event()

> +
> +	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
> +		resctrl_assign_cntr_event(r, NULL, rdtgrp,
> +					  &mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID]);
> +}
> +
> +/*
> + * rdtgroup_unassign_cntrs() - Unassign the counters associated with MBM events.
> + *			       Called when a group is deleted.
> + */
> +static void rdtgroup_unassign_cntrs(struct rdtgroup *rdtgrp)
> +{
> +	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
> +
> +	if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r))
> +		return;
> +
> +	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
> +		resctrl_unassign_cntr_event(r, NULL, rdtgrp,
> +					    &mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID]);

same here, I think this will be easier to follow when namespace is
consistent:
resctrl_unassign_cntr_event() -> rdtgroup_unassign_cntr_event()


Also, the struct rdt_resource parameter should not be needed when
struct mon_evt is provided and resource can be obtained from mon_evt::rid.

> +
> +	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
> +		resctrl_unassign_cntr_event(r, NULL, rdtgrp,
> +					    &mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID]);
> +}
> +
>  static int rdt_get_tree(struct fs_context *fc)
>  {
>  	struct rdt_fs_context *ctx = rdt_fc2context(fc);


Reinette
