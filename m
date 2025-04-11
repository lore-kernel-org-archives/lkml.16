Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F96202C50;
	Fri, 11 Apr 2025 22:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744409079; cv=fail; b=NW9wAVbkE2iNgxnPhBnCgufmWM0qNx6cOp07Zmz/QWE7XK5+AuDxCnoIhT2p7GAEXBz68Rv8rxoPUBDqt4btAWgU4AJA5gxNnU2LVCKhMqR2dSuOLQNfv+2EZN12pjOss5/eJBvkNDUc7VPe/rVelALigFZvnKgRSp0pbkFIKGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744409079; c=relaxed/simple;
	bh=uZe6U7Stn+RcjALQhXYkLYHf+HnGEd1rnO2/SLnyZLQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Bvf0rr39Kf5/BUUsOcdlgF5FmiUYMcKa0cGhZxkioUTjlSkR4kyq+SijZR41ligcpwdytwnYXVo9kIDoRG1TsHloHRwF/WZkc4TeeUX4RtpHxHOVUFHiPcQap2jULSfg4vDiEzuGbtzZ6Xw9XjNRrt3KV8Z9gzEBcJI3KpamuQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4WkYZXW; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4WkYZXW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744409076; x=1775945076;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uZe6U7Stn+RcjALQhXYkLYHf+HnGEd1rnO2/SLnyZLQ=;
  b=R4WkYZXWwzNMHvVXiupSW1mx5W7PeY+Qw+C3ReZ8Z0k0950WCAM9QFVe
   1otEhFCb7fwqt/sW0Adbc/EqATR+JjLt6L7p8gJuZSxotbSn7KdXU9f+f
   iDCiqHbSPK/xiUI/0o44Nm9dSEhBlQ2tc0J1Jfkr0hJx2CvPna/4PFstv
   v+e+gDz3WhaCyAiMQTEn4bT6vEoqLeN2aM7VKrup6wugKq63qM6WAxasO
   Mt/nUSQ75oaO2BsQnovSDvmYlKGZvr+ZsPv0M6AyLeVJ+jiNa8G4M6svf
   Qk1VMfGbKbNrkoTDLcJbsse/bIaVX6ZOpHrtcPN8N2n9KseY1MflbCdPe
   Q==;
X-CSE-ConnectionGUID: E9cD48+qTYCxAPfc8dnU1w==
X-CSE-MsgGUID: IJzPuZE2T6OpFlhf8pkIfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="71354697"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="71354697"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 15:04:35 -0700
X-CSE-ConnectionGUID: aGnaPXxYTgewmFAlqEqfpA==
X-CSE-MsgGUID: /sjvlHc7RpyXiOyqnuda4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="129649208"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 15:04:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 15:04:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 15:04:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 15:04:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDoUo7bdTLEjk/poIjsAM7tjpXWLnhSmKDaUVycxrgG0DH5Lnn4MsbsnJ48sduRDVhO2vEB98un9ZExxfKVdiSuRpe6FE3EdfUgpT9YXIS6zJ3hRqWyhGf2+56gq7Fwnv4URV4EdgvGlcNJKaZcTViEIXonU49JgZL5W7KeOKQCvLMVcm/+PeBQRXzrlzZpT70jZUjU9rKAJbCTbUc9P54ySXg8gLv2dbXYM2TKYTjhnKChY6BitLpfAFYFYP03Je7EZAThyhDu6KpanXOvoJd+t8n9DH3R6BAI6cBst0skLSmKRzxDOW/JrAQm5cO5XGT/1d8Qjz8I954+dJ0vPQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptLx/27pVRcqorlaK54w4iAot+Ss2hWsflo1Puc9LZ4=;
 b=nepG8VuwhaEKgx+MNudlWW5xmpSYEbMSyPOsIcLrq59Sp/LMzlTArySfofxqZjWCfGyuY0MY4W/4cJyxsp2sGEFQC6VjZRKYNyDaayj2PNT0nK834eraI/qY7FahnyvfCRZiLwqus0kEv/pgEi7SYpOGfe32/ylNnj12xGWwVwav1bvW1IdrvxzBQC5pdDf8i7xxqKZWoH0SKg7qk9DGNoWKKt6LWfcf0BzLuvwAUGYiS8khYpYrbf+8SJVRBVGrJX1U+FQJXGMYkD1rvJrAYfzC0pIye2GjgcEn0e0j1E7LtpWuaiELhxg8+UeTH5dHChIR76eas6a/blrtU/+Syw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7)
 by DM4PR11MB7304.namprd11.prod.outlook.com (2603:10b6:8:107::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 22:04:31 +0000
Received: from SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15]) by SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15%6]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 22:04:31 +0000
Message-ID: <ee19ea57-96e7-43d0-ab27-3dd12fb549bc@intel.com>
Date: Fri, 11 Apr 2025 15:04:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 19/26] x86/resctrl: Add event configuration directory
 under info/L3_MON/
To: Babu Moger <babu.moger@amd.com>, <tony.luck@intel.com>,
	<peternewman@google.com>
CC: <corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <paulmck@kernel.org>, <akpm@linux-foundation.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <ardb@kernel.org>,
	<gregkh@linuxfoundation.org>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <alexandre.chartre@oracle.com>,
	<pawan.kumar.gupta@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <seanjc@google.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>, <xin3.li@intel.com>,
	<ebiggers@google.com>, <xin@zytor.com>, <sohil.mehta@intel.com>,
	<andrew.cooper3@citrix.com>, <mario.limonciello@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>
References: <cover.1743725907.git.babu.moger@amd.com>
 <b5b9dcc35d737b999aee9f1aee727d0eced5739c.1743725907.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <b5b9dcc35d737b999aee9f1aee727d0eced5739c.1743725907.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:303:8f::32) To SN7PR11MB7566.namprd11.prod.outlook.com
 (2603:10b6:806:34d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7566:EE_|DM4PR11MB7304:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ed24c00-6d65-40a9-b477-08dd7944d608
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aitlaWFleWJCOWhOOTE5cXFvMU5RbEwrbTduTTJwU2xhTmhyZjNZRk9MMlhH?=
 =?utf-8?B?bGhzQlFsUThlandqUVcwRlNENlJGV3ZoQzgrSXpNUzRTQ0oxMXlKREMvNFlm?=
 =?utf-8?B?bHZmMkpxaElUczJrRW5KdG53UWJoQU5vdnc1cFJRRFRsTStkTTh6VWM4SUEw?=
 =?utf-8?B?K0tjOXR1bzBtcGU0eGVxSkZkeVphTzYyS3Y3M05hcEhrc1ZWS0VUOElsQkNW?=
 =?utf-8?B?YUFybW45eEZ3QjN6NkNIdVgwS2JOZ2tqNUM0eFNLTVFrMEhyNzUxUnB2MU1V?=
 =?utf-8?B?WFdKRjg3UTZuYUhUdnlJZGNSV1ZFTTBLdGp6NEYxdk5xWkxRNkFYOVZnNUV1?=
 =?utf-8?B?aWN5SEpBVEFjZ3lnaGZaTFdvM045T2F3cGRwQzk4MzJkelVTbEwzRmp5bHVQ?=
 =?utf-8?B?N3h0am1MYlRHRC92UUhkMFVJekgxSW1GT0JWTFl0WWtuaU9kcTlXRkJzWmVh?=
 =?utf-8?B?TzhJVWtaZklmK1g1Uk9xRVZ6eTl3cGxsVUVIdGVNdU9hRjdyYW9KM1d4NlJD?=
 =?utf-8?B?QktwWG0zaXJUWmYwdHBzM0YyWFp2eFAzS21pYUc2Y0hWTjhzYnJlNWlITWJj?=
 =?utf-8?B?cEE1U0RKKzZONlhYQ0pmcm9OejZjVXc2SHo4dlRZRUczdVVoWUh3U3U2UWoy?=
 =?utf-8?B?UFhvRGJEeGVpZE8vdXNCRW5aMWdxWkN3cmMvMm9xQ3VhVUpGdUNBZVlBSkZB?=
 =?utf-8?B?bERBUGlhbUs2T3FhaTU2UXljRTVac2xMOG5EL3lTQ2I5UGEvYk01cittRkIv?=
 =?utf-8?B?WTFIYjRPUG5HSUVlZzhwY1dXSXc1UWd1Z2MvQ1BpY2FiRGtjaWd5K1g1QXdt?=
 =?utf-8?B?NFEyM0IraE1ETHNpcmorV1l2eDdKdjRCMUo5RWdYa3NyemtuSHUvN3ZwRGVv?=
 =?utf-8?B?WjNCN25zZXFqUnUxaDE1Sm81cHAxREZkcHNNMGtzcjVpQjlINUIxQ3FEV3NP?=
 =?utf-8?B?bGNjVWl4OFRETisvck9JM1JSRitxSGNmdzVoWmE5bFJUTGM1RXRQN2gvSVJS?=
 =?utf-8?B?MGJPV1AyR1J2ZE1FbHp4SmlhL2hkRU5rc2w4Zk5vRnBWd1UvTE11THQwcmxF?=
 =?utf-8?B?bDlVejFjcFRCbG9pblRmRTU1T05OQjltWjFqdWlab0M4TnFwYjdTOHVRWVFw?=
 =?utf-8?B?cnJiV0YwdE1McEVhaSt5MnFYNGh6THV6K09NZGx5VU1CMnhHM0tCUERJcXcz?=
 =?utf-8?B?eWFnUmNXTWhyc1ZwUGM3Q3hXMjB3c3JhZTJZbytQZW0vUzBWeXFPU0JFMTVW?=
 =?utf-8?B?aUNIdkZ6K1VQMldJZkJ5b0FrLyt0WDd0bDQyYU9oeVRIY094bWNoNC9iN1FP?=
 =?utf-8?B?ejV0R3lDTndVUU8rck1HWityL2NrRktMVCsyZ0JESFAzLytnT3lOdUczaDNZ?=
 =?utf-8?B?RmliNlFYdG5uKzMrNG8zWlp1VU5kYkNld2RnRHhIYmhNeUZFSDEzYjN6RTRs?=
 =?utf-8?B?Zzg5YVZuT0I5UWlWaDFldm5ueVJvS3kvQVluZkdQbnBPK0VlQ0h0Mno2T09Q?=
 =?utf-8?B?MVNaODJLWXZVdzN6WHFDL0QyR2dTUlpzZzNmem04SEhUcE1EZUtENWxNSTdI?=
 =?utf-8?B?YTY3VS8yRENLVU9zWm01QVpWbmd4Y1IrQ3VaSEFhWXZVdURxOFZvcXBBN0Vz?=
 =?utf-8?B?STB1bng5T0laeDlMbVU1V1dFMktrUVIxSlVwSS9iU0RKUU5tUUw0c1RMVVBk?=
 =?utf-8?B?cFFxdWlaSnlMNVVoRFZBMFNVM0VocUZLbXB0ZXNRSEZFT2tZWnpXYllhWER1?=
 =?utf-8?B?WnU2UithQUV6OUxRandlaW9oNFFtOHhsQ3FscVkwSGtabHgvMjF0aXNSTDYz?=
 =?utf-8?B?TnBxKzkrTFhBTnBFTVI0Y2R0czhvUllwV1VEZWRrYytBOWNBYXRjNFZhVXcr?=
 =?utf-8?B?TkNKK3Z1Z1NXL1ZUUmtsejBuVTA3b0JDRWRsL3VyRDhOVDhUenZjZXYya0NZ?=
 =?utf-8?Q?FKe7rFMburs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7566.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alVITGtmbTJCeWx3RHlvZElFZ1YyYWw2bDlVaTF3bVNWVHlIVXRkNGVSTjR0?=
 =?utf-8?B?bWdjeTcwWVF0VTdYSzVQajArY1A1TmVzcWpUMVl3QU14R0FpVjlRWEhWSTJT?=
 =?utf-8?B?TFNIZUUwYmE1VnkrTE5obzZySG93MjNjSHpkd2xIa2hJTDI3akRHTmdoR3VB?=
 =?utf-8?B?Tjc0SzNUZXFISXFLajVwRU9xYTllLzAwT3F4Q2IxbGRxSFJSV2NYbmt0UHl2?=
 =?utf-8?B?czVjc3BaNldKMEwyRWNwbU9OblA4Mi9yRkRCTzU0MmkxY3N3alkzMFBCTzBw?=
 =?utf-8?B?U2RzRmNlbFVDM3BmVWJISFZwZ3B6QkZPdEM4MWxGL0hKYlpCeUJoN21rNEhh?=
 =?utf-8?B?MXhCaFA1blp5UFJRaHRKNXFjNko2USs5ampLc2RXaExTZExSWE8yRUg0eXZh?=
 =?utf-8?B?RmhNOGdIbWE2QkRXQzRoYlZnUnpkZXVCSFNTSU5tQ1RpcWppVTM1blVwVmpK?=
 =?utf-8?B?aDN3UEZUUnBLdHE1S25HU1NyUkRad1Y2Ti92ZndweS84QVNJWEZQVWpHUEFM?=
 =?utf-8?B?elI4cnFEdStON3NQbHdDbVo2R09mRDdSOEI4dnkwOHkyM2c3d1cwbk5mQmpM?=
 =?utf-8?B?ZHNHU2ZINzM0UmtpRVl2dDlqVTdZQlBxVHNvTzVybE0wdkZJUWkzUXJiblN0?=
 =?utf-8?B?cEFjZWhDZENNZEFDL2JzSk1hdkdWTExMSDVQZE1HOEliOExuUVZKdXo5MGl0?=
 =?utf-8?B?VTFQWVB6dG9CZ2ZaYi90a3VTdG84cmlvK0ZoekRkcWJhTGhxSHVLcnpmblVS?=
 =?utf-8?B?MUFhR0V5K3Q1THlPczlnK083akhjYlpIZmc2WjVRRlQ5ZTRGVzdRZWJONkNR?=
 =?utf-8?B?VGpjU2QyVnoxZXY0dGJTSGVBNGE0QVl4Q2hkS2FNZWVHbEM0K3pwSGdJWWVn?=
 =?utf-8?B?Q0kxQVpveW5yaGFrZm1iTmNGYUc4MjR1aWcvelpza3VuMTFiL1p3NjFiNzRa?=
 =?utf-8?B?ZjdUVWlaTVR4ZXZkM1ZaU1lseEtGVkdjQVEzZHlBRHFvWUkvR3E0bDJKY0Nw?=
 =?utf-8?B?Ykxadkt4WUk5Q3ZOUUdpU0ZZSElRT3lpaEpmYTRSdjNEMEw0VFZsRHRTWmRV?=
 =?utf-8?B?T1ZremZLb016YnFIdS9yakZXMWdUVEEyZ2ZUZVdwS1hiZHFMZ1RWZjIxNDNs?=
 =?utf-8?B?aWRha3JLTjlTOWNwZTRUT1VXWlI2elhzZmlMMGJ1SElzbkRITGgwMTVIU3hJ?=
 =?utf-8?B?VUxPM0lhR2pQSjlJRDd6REFRZWl5SVNSdzg2dXBkREtvV250QnJ3Y3ZwVTFV?=
 =?utf-8?B?QWdROW9aeG92YnYyOW0yaUh2WlVwT3NRMkRGSlZ1eEV4d0NGTCtkVWxPYWMr?=
 =?utf-8?B?dmxxT0VveEl4cjQzQ0tzaWpnZzR4ZDcyV0VKeGFKSHhkNlNZd3Vkbmh2THd3?=
 =?utf-8?B?QWFLL2R0a0NxZTM1dzdnbFVwdDlXVG1YcTBpdEdlK0hKb0F2dzJNR3BFNjFQ?=
 =?utf-8?B?L1ExWnBtRnZ0Sms0TWpCTTRBbDVRRWdvTzN6ZVlObXdOamxyTEtjTUFSZkc4?=
 =?utf-8?B?MjJnNkJmQjczS0FYbDdaV2lvK281WW9XRCtCcjRLUEk3TWt2alJqTzJEczN2?=
 =?utf-8?B?TENieDA4YjlpWjJ5aHY5SFZwVWlBa3l0eW83S3lRSit3SEoyaUdDVzlSVit3?=
 =?utf-8?B?enNyQmllUEJOVDR4STA1b1BjVElDRDhhRGlQYk5BdnRPeUI0QWlOWkpNNjFL?=
 =?utf-8?B?WWZmV0p1blAxU29UVXYrVE1yTjA1MzhzWERrR1lCS0twWmx0cERDRkdndDdP?=
 =?utf-8?B?MmRKZE9CV0ZzR01ZNFJpUzlaSit0akM1b3hSSTQyZDAzNjlvckpVOW9SZUdX?=
 =?utf-8?B?UGtwbEU3RVlmckZTenFaeHNNcUN1d3UxNXFYbUtTQis4Zis3dzh3ZjYyNGdK?=
 =?utf-8?B?K2taUGNLb2FQajJQblU1cTV4ejhmOEhUa0ltTkh5bktsampVc29CSzdUTXZU?=
 =?utf-8?B?RlNCWWpwRjdHWjZ3K3VmTE5sbFFUVkR3dzRlWHFaTjhwODhHYnZUNkJFV1I1?=
 =?utf-8?B?VlNqb21oQjMxSFJRQzRaVlhRcHVzZ3gwTkU3NHo5WXlIN2hsNzBOQStmSGF5?=
 =?utf-8?B?M0g2Z0VpZkNhZFI3bjdlVDdwcXg5ZStONE1lZHZLUndSd290c2lTTkp4TEpo?=
 =?utf-8?B?RGpUdTJXQTJEcTNLWVRvNXhzbVVMZ3o3eEFVUlU0clJkVmY1dXltdFZwSHY3?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed24c00-6d65-40a9-b477-08dd7944d608
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7566.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 22:04:31.4225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R+g9MWkYYDrr3HMAoYaIql2yiD6kyFvaKbz0zg7omgfw0A2eYah6FMUBhf2X3lJXlPwxT3+ki3rImFhaVTw+kjML4vX5h0JUJR7LXZ2XpE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7304
X-OriginatorOrg: intel.com

Hi Babu

On 4/3/25 5:18 PM, Babu Moger wrote:
> Create the configuration directory and files for mbm_cntr_assign mode.
> These configurations will be used to assign MBM events in mbm_cntr_assign
> mode, with two default configurations created upon mounting.
> 
> Example:
> $ cd /sys/fs/resctrl/
> $ cat info/L3_MON/counter_configs/mbm_total_bytes/event_filter
>   local_reads, remote_reads, local_non_temporal_writes,
>   remote_non_temporal_writes, local_reads_slow_memory,
>   remote_reads_slow_memory, dirty_victim_writes_all
> 
> $ cat info/L3_MON/counter_configs/mbm_local_bytes/event_filter
>   local_reads, local_non_temporal_writes, local_reads_slow_memory
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v12: New patch to hold the MBM event configurations for mbm_cntr_assign mode.
> ---
>  Documentation/arch/x86/resctrl.rst     | 29 ++++++++++
>  arch/x86/kernel/cpu/resctrl/internal.h |  2 +
>  arch/x86/kernel/cpu/resctrl/monitor.c  |  1 +
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 77 ++++++++++++++++++++++++++
>  4 files changed, 109 insertions(+)
> 
> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
> index 71ed1cfed33a..99f9f4b9b501 100644
> --- a/Documentation/arch/x86/resctrl.rst
> +++ b/Documentation/arch/x86/resctrl.rst
> @@ -306,6 +306,35 @@ with the following files:
>  	  # cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs
>  	  0=30;1=30
>  
> +"counter_configs:

(mismatch quotes)

This organization needs some extra thought ... consider that the section starts with
"If RDT monitoring is available there will be an "L3_MON" directory              
with the following *files*:"


> +	The directory for storing event configuration files, which will be used to
> +	assign counters when the mbm_cntr_assign mode is enabled.

Needs more imperative tone.

> +
> +	Following types of events are supported:
> +
> +	==== ========================= ============================================================
> +	Bits Name   		         Description
> +	==== ========================= ============================================================
> +	6    dirty_victim_writes_all     Dirty Victims from the QOS domain to all types of memory
> +	5    remote_reads_slow_memory    Reads to slow memory in the non-local NUMA domain
> +	4    local_reads_slow_memory     Reads to slow memory in the local NUMA domain
> +	3    remote_non_temporal_writes  Non-temporal writes to non-local NUMA domain
> +	2    local_non_temporal_writes   Non-temporal writes to local NUMA domain
> +	1    remote_reads                Reads to memory in the non-local NUMA domain
> +	0    local_reads                 Reads to memory in the local NUMA domain
> +	==== ========================= ==========================================================
> +
> +	Two default configurations, mbm_local_bytes and mbm_total_bytes, will be created

"will be created" -> "are created" ... or maybe just:
	 There are two default configurations: mbm_local_bytes and mbm_total_bytes.

> +	upon mounting.

"upon mounting" seems unnecessary.

> +	::
> +
> +	    # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter
> +	    local_reads, remote_reads, local_non_temporal_writes, remote_non_temporal_writes,
> +	    local_reads_slow_memory, remote_reads_slow_memory, dirty_victim_writes_all
> +
> +	    # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
> +	    local_reads, local_non_temporal_writes, local_reads_slow_memory
> +
>  "max_threshold_occupancy":
>  		Read/write file provides the largest value (in
>  		bytes) at which a previously used LLC_occupancy
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index b7d1a59f09f8..a943450bf2c8 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -282,11 +282,13 @@ struct mbm_cntr_cfg {
>  #define RFTYPE_RES_CACHE		BIT(8)
>  #define RFTYPE_RES_MB			BIT(9)
>  #define RFTYPE_DEBUG			BIT(10)
> +#define RFTYPE_CONFIG			BIT(11)

hmmm ... these flags are becoming quite complex. Even so, RFTYPE_CONFIG would be
unique to this new feature so I think a more specific name would be appropriate.
Maybe even "RFTYPE_MBM_EVENT_CONFIG".

>  #define RFTYPE_CTRL_INFO		(RFTYPE_INFO | RFTYPE_CTRL)
>  #define RFTYPE_MON_INFO			(RFTYPE_INFO | RFTYPE_MON)
>  #define RFTYPE_TOP_INFO			(RFTYPE_INFO | RFTYPE_TOP)
>  #define RFTYPE_CTRL_BASE		(RFTYPE_BASE | RFTYPE_CTRL)
>  #define RFTYPE_MON_BASE			(RFTYPE_BASE | RFTYPE_MON)
> +#define RFTYPE_MON_CONFIG		(RFTYPE_CONFIG | RFTYPE_MON)

Why is this flag needed?

>  
>  /* List of all resource groups */
>  extern struct list_head rdt_all_groups;
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index 58476c065921..4525295b1725 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -1264,6 +1264,7 @@ int __init resctrl_mon_resource_init(void)
>  	if (r->mon.mbm_cntr_assignable) {
>  		resctrl_file_fflags_init("num_mbm_cntrs", RFTYPE_MON_INFO);
>  		resctrl_file_fflags_init("available_mbm_cntrs", RFTYPE_MON_INFO);
> +		resctrl_file_fflags_init("event_filter", RFTYPE_MON_CONFIG);
>  	}
>  
>  	return 0;
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index aba23e2096db..b2122a1dd36c 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -1907,6 +1907,25 @@ static ssize_t mbm_local_bytes_config_write(struct kernfs_open_file *of,
>  	return ret ?: nbytes;
>  }
>  
> +static int event_filter_show(struct kernfs_open_file *of, struct seq_file *seq, void *v)
> +{
> +	struct mbm_assign_config *assign_config = of->kn->parent->priv;
> +	bool sep = false;
> +	int i;
> +
> +	for (i = 0; i < NUM_MBM_EVT_VALUES; i++) {
> +		if (assign_config->val & mbm_evt_values[i].evt_val) {
> +			if (sep)
> +				seq_puts(seq, ", ");

seq_putc()

> +			seq_printf(seq, "%s", mbm_evt_values[i].evt_name);
> +			sep = true;
> +		}
> +	}
> +	seq_puts(seq, "\n");
seq_putc()
> +
> +	return 0;
> +}
> +
>  /* rdtgroup information files for one cache resource. */
>  static struct rftype res_common_files[] = {
>  	{
> @@ -2019,6 +2038,12 @@ static struct rftype res_common_files[] = {
>  		.seq_show	= mbm_local_bytes_config_show,
>  		.write		= mbm_local_bytes_config_write,
>  	},
> +	{
> +		.name		= "event_filter",
> +		.mode		= 0444,
> +		.kf_ops		= &rdtgroup_kf_single_ops,
> +		.seq_show	= event_filter_show,
> +	},
>  	{
>  		.name		= "mbm_assign_mode",
>  		.mode		= 0444,
> @@ -2314,6 +2339,52 @@ static int rdtgroup_mkdir_info_resdir(void *priv, char *name,
>  	return ret;
>  }
>  
> +static int resctrl_mkdir_info_configs(void *priv,  char *name, unsigned long fflags)

Why a void * instead of struct rdt_resource *?

Also please fix spacing.

Also, why do fflags need to be provided as parameter? These are so custom I think the
hardcoding should be contained here instead of the caller. With this the function name
can also be made specific to what it does ... perhaps "resctrl_mkdir_counter_configs()"
(please feel free to improve).


> +{
> +	struct kernfs_node *l3_mon_kn, *kn_subdir, *kn_subdir2;
> +	int ret, i;
> +
> +	l3_mon_kn = kernfs_find_and_get(kn_info, name);
> +	if (!l3_mon_kn)
> +		return -ENOENT;
> +
> +	kn_subdir = kernfs_create_dir(l3_mon_kn, "counter_configs", l3_mon_kn->mode, priv);
> +	if (IS_ERR(kn_subdir)) {
> +		kernfs_put(l3_mon_kn);
> +		return PTR_ERR(kn_subdir);
> +	}
> +
> +	ret = rdtgroup_kn_set_ugid(kn_subdir);
> +	if (ret) {
> +		kernfs_put(l3_mon_kn);
> +		return ret;
> +	}
> +
> +	for (i = 0; i < NUM_MBM_ASSIGN_CONFIGS; i++) {

This can instead work through the resource's evt_list and use a flag (TBD how to
adapt "configurable") to determine if a directory should be created for it.

> +		kn_subdir2 = kernfs_create_dir(kn_subdir, mbm_assign_configs[i].name,
> +					       kn_subdir->mode, &mbm_assign_configs[i]);
> +		if (IS_ERR(kn_subdir)) {

IS_ERR(kn_subdir2)?

> +			ret = PTR_ERR(kn_subdir2);
> +			goto config_out;
> +		}
> +
> +		ret = rdtgroup_kn_set_ugid(kn_subdir2);
> +		if (ret)
> +			goto config_out;
> +
> +		ret = rdtgroup_add_files(kn_subdir2, fflags);
> +		if (!ret)
> +			kernfs_activate(kn_subdir);
> +	}
> +
> +config_out:
> +	kernfs_put(l3_mon_kn);
> +	if (ret)
> +		kernfs_remove(kn_subdir);
> +
> +	return ret;
> +}
> +
>  static unsigned long fflags_from_resource(struct rdt_resource *r)
>  {
>  	switch (r->rid) {
> @@ -2360,6 +2431,12 @@ static int rdtgroup_create_info_dir(struct kernfs_node *parent_kn)
>  		ret = rdtgroup_mkdir_info_resdir(r, name, fflags);
>  		if (ret)
>  			goto out_destroy;
> +
> +		if (r->mon.mbm_cntr_assignable) {
> +			ret = resctrl_mkdir_info_configs(r, name, RFTYPE_MON_CONFIG);
> +			if (ret)
> +				goto out_destroy;
> +		}
>  	}
>  
>  	ret = rdtgroup_kn_set_ugid(kn_info);

Reinette
