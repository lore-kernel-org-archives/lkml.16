Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8329C1922FD
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747171164; cv=fail; b=FQHjUiZaZswq79kRJ2xd2GsZu2lJX1Qsxbr1ASTmCOQ789ifPZNYBO5pZpNx/JTPYy5ZnqPb0H2T6j9zrSSUJNPTY1tafA1wX+QMp2vYmq155zNAKXEsEfAC/mOe5y0IypDfKhV7qOhD0q9RQBi0SZDt9zffJIJdlwo0V2hROVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747171164; c=relaxed/simple;
	bh=LTwH6fB7ffOWz6dGa2BKnSSBJcRC+LnQwiawGTtuZB8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hjJT0hne9HsFRBGjTBSkDzmKA9TRFdNFs8SFkMI9+uM4WwPxAsrVpgHl+9rRzc0MigTzU6kwrEYTGOyufHq6PNxXF3oXG8rB3ZvtQMm2WqxVRakoVHD1Bs8IqK2rKazopgIu2Ati3p/tCtqj22EE+gO25WZRXVdVK83QqQlTFRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SPXc6Pqm; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SPXc6Pqm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747171162; x=1778707162;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LTwH6fB7ffOWz6dGa2BKnSSBJcRC+LnQwiawGTtuZB8=;
  b=SPXc6PqmtcJbmTY98mV3ZmRSN69nWGb397cxF7hzzTkUq9G7jgNmGZ5i
   LGBISIqrSP+xDVv8iYsxy7XJndU2JSnfj+GIoNOb8sediuAfzeea2mnqD
   zyKUPScTRFt3+726PeE0a6lz3Fm908GolWLHQKs+UMG8wS0ojD8JF7zsE
   OGpKVyZX92wMtWVaPVy3Y0kmPmNZUSI6AsCE/K8jTHIwi6/AAMJkOUuQt
   atvBCflbW5lGXJAjX8VwgVVppVIfo/TSrlBVV44HyvS5t4ql5ycLsyaiD
   lrwlw5tJWRAyj54cJSb8pV6KYeh0TeYUSrsS9i7jqIC2Gvw1KW/vKYLqZ
   A==;
X-CSE-ConnectionGUID: nRh9e76iTDC69+1xS4y57g==
X-CSE-MsgGUID: gLfJYQZ9TnO5XsOqyIItsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48915221"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="48915221"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 14:19:21 -0700
X-CSE-ConnectionGUID: 2N9MXJk1QYycu0G7bllBrg==
X-CSE-MsgGUID: /7drqgwJQxi6mPukMHnfYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="141859530"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 14:19:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 14:19:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 14:19:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 14:19:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h0JcA73/fB2X3CfPjltwumGfPeY1aZ/PRogxk8uOWquBG3GplTeqcwGpBxXgWk2mOi9rSd+QP18XfJOuZC6A4r8bTsaxPg3ET7zg31Auk7Z1c4b6L6M7rdCM6Kwivr+3uDfGujNipp6OmNftUXKQ7J9jQgPSFju9OPkfqMMWDJNgaC4GVyibcfuHiOwI5XqipXhc8/UhYyrDBMaVv//0u+bcYCp6KKqMvfVSd/BxUFcGql8qSphFtCvyPJ+dyILRcfRtoxqa45qiiizYJJysbU0mwcoqtEHF+/JBtOH6vRZ3wpHCnMHHs72DdtUHTdQzWBR0HA6ta+u8RBQoWMn2yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCEuCGItmgucw2y/fefGImJo/MvKI6QdTl00CbZgfZw=;
 b=Vg8K2EY/ByInRldP1XXLzEPTVRkCoFa/KmfpUtpmtW4/zFTDl5RpYbpNscapWyZJzJ51dAcqszNIC8Pj3KEIteWppJY6b8yqsPiAOnXvIRhuzveav26QQvX1kKBvzv0sWfyY98GDlfZhiXv/jvNcCfa2kq2b7Fk6F78E7iJBMCZto1RUTBluI3zC8gJzC94PIDPUAcLOpBgkGfRRu7yeDuRQVSlrrOuM+YA1t8bhzl/zwlZJ5kqtO8wrRpRLwpXrODa2+hiIiDzW4G9zwpSfyfjw2BLBiviQIwEBM82UXTm00cwO6G4vtHEK8Bo/hdg0uJlgcqcqrx4AF5yVlfhefg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH0PR11MB5783.namprd11.prod.outlook.com (2603:10b6:510:128::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Tue, 13 May
 2025 21:18:45 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 21:18:44 +0000
Message-ID: <d48cd73b-a39d-4809-be71-32a84d02febd@intel.com>
Date: Tue, 13 May 2025 14:18:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/30] x86/resctrl: Check all domains are offline in
 resctrl_exit()
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
References: <20250513171547.15194-1-james.morse@arm.com>
 <20250513171547.15194-8-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250513171547.15194-8-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::7) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH0PR11MB5783:EE_
X-MS-Office365-Filtering-Correlation-Id: 628cda17-43e7-4132-6d88-08dd9263be34
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGtIc0swblhya3lPMkQrNFk5ZnJmOWczOWRLNExkWDVnMHQvVE43T2hrTzZx?=
 =?utf-8?B?amcvL3MzSnhxQWtyMDIxbTIxKzVpdTRZRG5pOFhxbjN0cUNFVzJGSFFGMDhN?=
 =?utf-8?B?N3R1aFk0SDk3UGlmSDFpUDF2eTR3UlJRRGRCaUY3M0M0QTZBWUl1Tnc0bGdD?=
 =?utf-8?B?VEwyMDlRdFdLcHpNZWVyYjZWWkVYWDNOVEthUWVpZlpMdFFrUnl6RHdHZHJp?=
 =?utf-8?B?MHFnT25peE9ORHRwcERZMm5LTXlTa3laZmEwRVpCUW5oaXBmczdhYWxtbDN5?=
 =?utf-8?B?NDM3Mnh6bjN1TzZWc0NMSVNra2RJZEZsc3BDaXVlNlo1VFdGNDljRGNYR09G?=
 =?utf-8?B?Z25UMktMejZVY2NibTRYTThNUHR0dCs5anB0VCthT25zYSt4aXFNdXMwNDNo?=
 =?utf-8?B?WnFJUGo5YTJVK1A2M3R5MlBzOTRWQmtvWERKMUl3MXJYNzltL2Z6RjRYT0JQ?=
 =?utf-8?B?b2I2REFwR0FkdExGTmJkbmtHT2hZdXhzYXBWd0ZaQWIweGYyelhqaUJjTWhE?=
 =?utf-8?B?UDg1SzdOSkFEZTMxYU5sYlNCMm1tK280ZEh0bFZpeGtTNXVPUGxzTFUxZzhG?=
 =?utf-8?B?N2VNY3JXSlVnY253SnQ0aGNtUXl1eU5lNjBHVXNhNWFtQ3pWQzVIRjZBek1s?=
 =?utf-8?B?azdLR2xXdkpiN1NpNkhCYWRyMk9GV280eEZtS1N3SlcrMFB4TVFybEVhd0tw?=
 =?utf-8?B?TkRjMXNraTBYSlZIVEdUTSs5dGJkRGhvdW9WOWw4R2pGTXdpTFdxWW5wWjJs?=
 =?utf-8?B?dU9PK2xZV1lCbGtHa3VVZEZLazhIcmp3c3VhMjB2U1pXRTF0ekJTYVpCTzJQ?=
 =?utf-8?B?ajVXalZBU0FlSDB4MldJamwwdU5nbDFNQWJibFJYSHJmekZVUnEyWlp5Z3Nj?=
 =?utf-8?B?SmpCYjFZSFF3a0lRYkNSYmdMWHpldTRDL0tJa2FLZE83NlBMbWU4ZFVhYUNK?=
 =?utf-8?B?SUlScU1iVEFJdHU4S0lpSXp0dGFuOTZsL2JRa2lnaS9TcDRiYngwK0EycG41?=
 =?utf-8?B?aGJCemxuV2dVcUh5UlFoendRRXF5VDJSVUFpS0lvUGZobWRMcFBEMDU0Y3pz?=
 =?utf-8?B?ODBiOFlFKzkvUWY3L3Z6Q0RQYXNMVUpkWmZSSlJwd2UvRDlCL2lJejlBa3Jn?=
 =?utf-8?B?RCtmNkNnL3NzaU1UL01sN0NDUWV5aGtEN2puSTZUc1EvTXYvT2IzVDRvcXQ5?=
 =?utf-8?B?S3FUVDQ5M2pQSkZDTFZVU1A2V05Mc3lkbFJGVzJGQXQrb3ZPZEx4SzRNMDA2?=
 =?utf-8?B?YnE0ZjRjZjNteDVVQjlnQ281T1gxOWtzeVY4MFR1eFI3NjFhMUpST1hOTngz?=
 =?utf-8?B?Z1hzL0NnZktXcHV3VmYwOU5NR3l1Q093SFdzWks0MlAyclU2NTByMkZNS09H?=
 =?utf-8?B?WVM5WExsOUNlNjI3N2RMZ1hiK1ZQSitUSlhIaGR2RzI3OWFnWnJjUzYxTENC?=
 =?utf-8?B?c2dhRk5WajFsUE0xajJLZjcrVmE3cHdiQnRFaVBuN0ljVHVkR3BUbjVvd0Qv?=
 =?utf-8?B?L0hUT2VtVGlwSnNiMGFtNGNycVI0UGpibzBqNDRaZnAwN2lzaDV5TVRlME5Z?=
 =?utf-8?B?dkVDUWp4Q1ozVTBCUERNMUVpT21NMXNJa0ZJTU5MYXJ3bzRWUUNtU2VieTdi?=
 =?utf-8?B?cjRkK0ZvMTBpSjZxbHVRL3E2OVBmc0VjMGhLY2QrdXIrdFo4VERlTjBLS3F2?=
 =?utf-8?B?dC95VklwRW1UdzVmZkRGczhHYUdnVUhWTHpybVVXTU55YUVHc3g2MktZY082?=
 =?utf-8?B?WU9FeFhBQnhBS1dJdW1SRXBRWHBwQmVZWGNOTW9ZNERBeTBmbnRIYzE3ZmdI?=
 =?utf-8?B?TFhjRzczMVI0aC9HNGxiQThuVFd4Uno5SSs5WEgvZ1UrdVlNSnkxZUNlNHc5?=
 =?utf-8?B?Sk9xeUUzUmdxYnE4ZkFPRklLRzVydXpHKzNGUjB4bWw4V0VKczhmVU9MODNy?=
 =?utf-8?Q?/juYrl/T07I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXd2M29vSWFVZGhrK1VRK3VLT2ErSEs0ZDNkWm92QXhTK2JqMW9oZERrNG5I?=
 =?utf-8?B?SmtKNy9rMFFnUGUzaTNqS2YwT1BPNkxqUERXSVRoRit4TTZPUXZRaDZaUGdY?=
 =?utf-8?B?ZXhuUlM5YURWZWdheDBRMEN4SWVaRi81ME50aTJLMjQvZkZ0bW1Ydk5HWmVC?=
 =?utf-8?B?N0hnY1luTmp3Zi9RakhBWmh6c0piRDNlenVJeVp4WUFSWUtjSW8reWhVdEhB?=
 =?utf-8?B?c0hKY0ZiYlU2RXdCSVVIOW1ZNzV2ZG9yRE1uOFEzZGpNV1hmK3R3NkxYMTIv?=
 =?utf-8?B?YlByS3ZreUExYUNIOGNySWNES203V1Jucml2QklDMkJxaTAvQ1Z6NDNabjZ6?=
 =?utf-8?B?YWZYaFVQNkg2aklhcTYySTUxcTZlUFBjaVYyeWxzWlZWb3RFaGQ1Vm5KYkhT?=
 =?utf-8?B?Z3ZCamp4UkU0YjcwZjZNa1REajlZc2dzalFIeDZFTzA4YUtZU1N1QTFTQlZt?=
 =?utf-8?B?M0Fycys5Q0pWdkZTZCtURnVITUpjNEd4c0V4M1krd3B1UUF2WlRTdHpOVFNV?=
 =?utf-8?B?VFFqVEZadnBrbTl6OTYrVjQ0TmZHZk5IVWdpZ3BPanAwZTVBQi9wRzZNMFlU?=
 =?utf-8?B?R1U5L3NXemdKcUtHRUlNekdLT1J1VXdjZnVSL0ViRnRUcVpKNVNHdmYyMmMx?=
 =?utf-8?B?ZStQM2c2V0E5M1V3YllZY3ptNlZFbEg1N2d5eHhMNzM3T01nbmJOREt1QmhZ?=
 =?utf-8?B?MEloWmRFYkRUcGwybUlrYmVzeDRldm1TV0ptRXVyZmRBeTVtcytTYXRUZ1dw?=
 =?utf-8?B?NHhOQjYwcVVMUC93eTFtN3ZFVjRYNFcwNjB5akFXbGIxVXYraEZSdUlNRzA5?=
 =?utf-8?B?UUZQcHYzMG84Z3NOZG1lUXQ0U0p1Ny9IcVVRVDRhek9mcWFtOWpCVFRiZ2Yx?=
 =?utf-8?B?UFk0Y3NvMmVhS0Z6aHZJa3l3U3dnOXI2ZWJiTkFEai9qQll0SmNHeENKdmlH?=
 =?utf-8?B?eGh5dWFuQUlvY0ZkYmNveGFjeHVONTFjcG04WURLK1pLdW5MdEtOdUdPVDE5?=
 =?utf-8?B?cTNZdS84Ni9ZNnJYYVYwd0tSZk11MGQzWDhkT21ISXpScDI3T2NQRFZ5NWhx?=
 =?utf-8?B?bnR6MU44blR6YlNRbkw5ZHRVWkVVdVBNay81M1BnZEFGcSs5Rm1Hd0JERVQ5?=
 =?utf-8?B?RGJ1RWJydWNxNHgzbGUwaUdQZUMrN2dMMUM3Umg3UkJ1ZGtkR1ZOR2xtTzNX?=
 =?utf-8?B?ZTVxUGdJaGtaalE0bi9yOGR6WGNacjJkQUdzM1ZKTHRxM2RuOVMwQmZNZmRw?=
 =?utf-8?B?WTNYd2FtZGR3WFBXMTk4cHBhK1BHZ2wwNzl1eGU4eTZCTVFNVWRwNDV4KzEr?=
 =?utf-8?B?YWlSY3grWmtibDMzaVRHUExJbEt1OCtyV0pUVTRBNnhpVjZiZmUrSEJlTUxC?=
 =?utf-8?B?UkJOM2VpU0FZay9vWDh1VXBOdThQTDQzRVcvUHdUdzBHMVg3MHhlaVdPZDgx?=
 =?utf-8?B?bjNQbVp0THdHSzFxUktrbFljL2pIM3U4azcrNFY0c3kxR0FaaDdibDZiaytv?=
 =?utf-8?B?UDRGeGdQZ2dMTkJIWVhwUFFjOE1MUm1mMUV5bWlSMktmVE4yWE5oYkNpWjNP?=
 =?utf-8?B?eC9OSjJJV051UHRGTVN5eVY1eWhhQjZkSUdpR2o5NWJkQjNNZk0vUnhsbkI0?=
 =?utf-8?B?cEdSSEpKNHQySU5EUTE2TnV6bUIrMW5rTE5WWkZjcjJQM1NGQ2FUbml6U05i?=
 =?utf-8?B?bDJJdlkxWWgxY2UyYlp4ZXRxa0xHbkJLZkRYWHFFOVVhTTZCUmJBYk9YYzl1?=
 =?utf-8?B?eVpmbTE2Z2sxTE1DWGt5R0hjZXMzSkJkZm8vM1Y4NXNnVWhTUWsxR2poVldD?=
 =?utf-8?B?VXIxcU5yRTc1bWRDTWFKaDVFUmVybENpWDQ3bGxUc3NudmZyMmx5dXQraUNo?=
 =?utf-8?B?aGpmQ3FUb0IyTm81Ky9ybjdOcnE3VGpuMGd1cUVldTZGcXpSUlR0aFpHcVZR?=
 =?utf-8?B?TlpCWlI3dG90RUJaWEUxOXZxZ25zeWVTR3RhTzR4RXZXMU5JeEJTbkFrSHdi?=
 =?utf-8?B?ajFJaHFzYmpGZmZKNjFOVk51eUxzWjBmSDd2NVBjRDg1KzJDM1VXc2FEZThZ?=
 =?utf-8?B?VC9vMUlqZWJwMnltRUtZUGdTZmJIakdDVmFlZ3Vxc1ZPZGdoOWl2bFpHR05E?=
 =?utf-8?B?WmxSSno3TUdENWRDSDJLQkNMTjlTT2RndXp2ZzJPMCtFUExBaVQ3cFpadXpC?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 628cda17-43e7-4132-6d88-08dd9263be34
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 21:18:44.8543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Q2fDrxk4RxSx1IYyOXvppedC33jAuey8HmevqJ6E3T4/lAQlEk42A/PI64V5EHHLJeiu8s11yA5Mo3Gqw+et6t3YfCkU51du7g1JWjQSkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5783
X-OriginatorOrg: intel.com

Hi James,

On 5/13/25 10:15 AM, James Morse wrote:
> resctrl_exit() removes things like the resctrl mount point directory
> and unregisters the filesystem prior to freeing data structures that
> were allocated during resctrl_init().
> 
> This assumes that there are no online domains when resctrl_exit() is
> called. If any domain were online, the limbo or overflow handler could
> be scheduled to run.
> 
> Add a check for any online control or monitor domains, and document that
> the architecture code is required to offline all monitor and control
> domains before calling resctrl_exit().
> 
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Babu Moger <babu.moger@amd.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> ---

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette
