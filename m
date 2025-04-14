Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3334A28DF1F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 18:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744655488; cv=fail; b=RCgN/57LqcPNftFNfWGc03+FdNVpdwPfm80B6U0FGlg2foEvbwiVOB3CVwICmWSzRXpc3odiHa0QRzD8sSCZ3W8v7EMSNVjJfyrkWPU8ol3MR+cH025TMY2y9lTF66z6h3DOqzFkaYkehC3VEBTwLDcqMaGdDi1buBJUoM4N4Cs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744655488; c=relaxed/simple;
	bh=VfVDvqusU6MHwkbjdL3r6Y57pDc+q7GxpKAWb0dj2HI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=k5ffAtIDe8+pq10zbkIBEHG6AxSrKt7iq0PgoLyT5H22erNWgpAyljojL5sXB+JdATunWeXS+nVSCcnBnfxpi4JUIYAimb6rniA2eIrNbAZxEDsxAFhWv5a12BdNWsrbybxUvza8Sul2PmH4xFnFM98bkILUz2/FCb+RAWRZsfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/e4E5wf; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/e4E5wf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744655486; x=1776191486;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VfVDvqusU6MHwkbjdL3r6Y57pDc+q7GxpKAWb0dj2HI=;
  b=l/e4E5wfej1mdARGSEumeYAkEpTSt1Owc/yMGQIwqqZcyAE4xzPB9j3f
   utY3nWNHRFR98qfmeHyOkVDeukNYRFCD9r2w0BtbBn4MjCDKxtLnbyzwW
   P3uU0yG3QplgOgYKbuCOt4btsFCwGvamJvZ5zCYbrnyiJXDNgUAmGyNFs
   8mPG3BmMeW0rW18fZU4ZlIgLWMRT3zAJTMAgPH+JBSWoyNVG/xzg2C+iT
   GZs0fdsFTd+kClXr10xsiJa03QfMQaZGyn3uYgqK5epz074PvEBn+gNpr
   Jf51uPE4pz7OO9d9TFeFCWMjTRSINkZlCmJ6AsQNaYY3tjwaXeCCpbGHF
   Q==;
X-CSE-ConnectionGUID: uvLr+3ILTAeErt0JgFwPpw==
X-CSE-MsgGUID: qjR++SQARECsM6otNFOKvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46148897"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="46148897"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 11:31:25 -0700
X-CSE-ConnectionGUID: ELUnR366ToqoznKm62fTzw==
X-CSE-MsgGUID: SRv6gf3zR3WfCo4nKHcdug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="130775559"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 11:31:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 11:31:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 11:31:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 11:31:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bvm/iDgD7kwYglFjgXTbVLpYc1l46Q6vgpDZSX6mRQ/Yj/Eh9z0/znC1+T9K9CJElKpKAnknnfUY0pQY545CgUgXjsDQ1nGROsxM6LrK+GWsM+BxpEu6ePWT8yg7g6kgBKh1p1Q9DnHVM3jEwPEME6gtqFAAk4gBCT8iwScOImKcF7u+fCfjLU7CFXRvbdckl/wRwuoPrJIn52Vz2ydlgm3ItO60+2J9aTZv1u9bcCdH+R/nSlESYiNmJRfAXWNFFJI0KAMSNF3p7ZJ1pT4Fjkgw4RpnMSt+0efoJabbgB2vTpgb2ITrEfDr+I6LUuoOj/5iKvRQCKcP/mD2MWuU9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8yi/0XdwkOmLKoCxuqp7yOxrtmahwsmwD0tWfDhtZs=;
 b=gZPzQw86ph1ecKw7cfUrpveCp1dmmhE23XcTsKZs3LqV1duWz4X/UQOLyD96nnywTcB8k2ORZ49v77wT+xwzoG3rkPa5eUBeuhHAGc7nwYdjrNHmQdu2n2gGA68ydFD43c85ErneXzhStn0XHm1AH7wQS+TOyXxnw8RgTfru/R/80rrd6CkQqbwQTC2His0acxHr8JFlFqKw+PtLk4j8fSt8LAsICPKxQKAx9Fcu3VW6QihrpQplk2DIRKQgaksmw7rHI6vsuGD2kLtAPtFPkI5o1WT+2A4RtJOpgQQJmXvDkV3lTPJOI6k47C+DGCdCFH2EvblwXy5XjLl9UF4p8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 MW6PR11MB8365.namprd11.prod.outlook.com (2603:10b6:303:240::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 18:31:08 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::b1ef:c95b:554d:19c9]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::b1ef:c95b:554d:19c9%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 18:31:07 +0000
Message-ID: <ca0a9ace-17cd-494d-b04c-f1302b6677a8@intel.com>
Date: Mon, 14 Apr 2025 11:31:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2a 5/9] x86/cpufeatures: Add X86_FEATURE_APX
To: Ingo Molnar <mingo@kernel.org>, Sohil Mehta <sohil.mehta@intel.com>
CC: <linux-kernel@vger.kernel.org>, <x86@kernel.org>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
References: <20250320234301.8342-6-chang.seok.bae@intel.com>
 <20250411161250.14662-1-chang.seok.bae@intel.com>
 <d076ee8c-0c22-4e99-964c-5ea254f5be14@intel.com>
 <7b91d929-fe97-44c6-aa94-05417bce1014@intel.com>
 <009062d3-d4db-443f-8337-ae4223efffa1@intel.com> <Z_onl1QbH9L1-8dq@gmail.com>
 <Z_zGCCNE_Qt3IlMZ@gmail.com>
Content-Language: en-US
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <Z_zGCCNE_Qt3IlMZ@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0205.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::30) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|MW6PR11MB8365:EE_
X-MS-Office365-Filtering-Correlation-Id: 8907b958-7b74-497d-9d49-08dd7b8285a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1N0blJXQnZ4dERwQlFIamRQT25SRGt6KzNzdkozRFJHSEdxUTJDakdhcDla?=
 =?utf-8?B?QWxTM0VnN25vemM1VWNla215ZlVZZmxZek9WQnU0dGg4dU9LN3J3dnBsVzVR?=
 =?utf-8?B?V0RiWXZ1WWNQR0Y2bkgvQko5cGI0U1RhSnhtVG45bUVFbGQ1cUFpNlluMExi?=
 =?utf-8?B?MU1hMXVGK2xaZE9xd0o0RnFvdE5OMFRYamg4UDUrVERZcFV5T1YyUTNOZ2Fh?=
 =?utf-8?B?bFVBRFBTOFg2WEIzNmQ5bzRlaFZNZU9mN29DMEs1UFltcDU3aCs1ZzBEUUJy?=
 =?utf-8?B?aU9lei9SdjhyOUF4UytweVpHOU9tbmhWVHhrRXNreFFUZmR1YUs3dkhueGxQ?=
 =?utf-8?B?RlBKTmJRenNQMFlnc0dpbUJyVk9scE9VOXNWWTEzeXE5UXY2ZXNJcTQ2SS82?=
 =?utf-8?B?dkl0QUtqV0VBNnhFWDZaVUZtWERLMXFDTjQ5WnhHbDI4SUZobDBQc2pvSFlv?=
 =?utf-8?B?eU9jRkt6QWc4bmxoNlpwUXdKcWpudzF5ZW1tQU56aER3aVRwT1k3TXBFK3dz?=
 =?utf-8?B?MjdDdHhwczhDNTlLc2NKd082Q0VQdFlId1EvOEV4RFVpeFM4UzRKQzhlbVMr?=
 =?utf-8?B?V3RCMzY5eVZwTEgyQ0FyeUpxYUkvR3BJOGNHWkZ3QS9TQjZ0NVlpY0tDYXZD?=
 =?utf-8?B?UXllTFdtUDdHazJHUGdBckJsUE90dm90MkZHTUo2aE9sTnJYYkxVQm9VdXVi?=
 =?utf-8?B?NC9ZOG5XWnRlZ1c4bDQxWUtVN2tTR0hFcVNhRjd0Y29hckV2WlFXL2xyUE44?=
 =?utf-8?B?R3NJV1JRQmw5RHdEM2EyQndOUVpmd1RvWDN0cHlEVHFDK1dBU0pPNitoSlBs?=
 =?utf-8?B?NXBSWjE3TVB3eEl6SVV0NG1tZDBVRjduVnVPMzl4ZTBJODl5ZUIwYWNVaGpY?=
 =?utf-8?B?ZHB3V0U4RmJMSlE1RXR2SHI0dVNrZ0UxM2JwaXc2SHpiNDkvQ2NHcW1QZGNN?=
 =?utf-8?B?djFaNnJLaGxzdHpHUklZbzI2Ty90Ky9KMklHUmlnWXh4YzlCYlRidzhOdnkv?=
 =?utf-8?B?b3Q4TjNPL3ZGV01BTTB5OEtTMTI1d0trcnl1bHhZVWdVaVMzV2FHUUQ0ejFz?=
 =?utf-8?B?QTEzK2ZkbkU2ay8vTi9mc0oyWWg3VXNEblJ2cjl4a09ob0ZaM1hhM0xOQk5G?=
 =?utf-8?B?eC8yVkVuU3ZyTWFNQXJHdmkvZVFtZElUVkx1SzlXMGZQMEJzdWE1bFlNck1S?=
 =?utf-8?B?MlNIaUtqY056NW9ZUkRudUQ4Qy9YY284RThGMmVVd1I5ZkZnblI0VGg2enhH?=
 =?utf-8?B?SDIydG5XMnh2SDFJUWFhbWtiaURuc3BOQU9wdjg0cEtDaWVmVVN0QUpWMm4y?=
 =?utf-8?B?cStnZEFsWmI4ODI4emlkLzRPRUFlRU00c0hKN1lFY1p4MDdEUWFidTFSaFlV?=
 =?utf-8?B?LzMzNnZGakNDSStlcGlpZVhIVU5pTWZtRStRTTM3TDMycG9peGVxVFFkTE5a?=
 =?utf-8?B?dXcxdzNxb25wbmFHNjhrQ3ZjbDdkL0ZDWENSRXp2WG9kdWhESWdVNGJWNjFO?=
 =?utf-8?B?V29uQytpekw3bXFTMHlMUExLMDdFVmlmV0RmcE9RUFFZbVhGajB5dE1ZRGFz?=
 =?utf-8?B?SktGOFpITStXdVR4N3JTK2FlK044UTBYQnh1VEJMNjAyMk1ucFQ1MlgveWdr?=
 =?utf-8?B?OWpBaTMvWHg3ZWI2YWJsZEhNS2RrZzBOWWF0bjB0Z1pseDJLOFRMUVY5dXFr?=
 =?utf-8?B?UG8wemZYNUFHcGpUWTk5UFd6c0JuNklwYnVqMVdpUTc1QTRTN3dpNHlDRXlU?=
 =?utf-8?B?ZjBEdSswaFRpSjdTV2I1bm4zQ0JjaVFBM0V0UDZNa2hkUERlcnZ0dnUwbmZ2?=
 =?utf-8?B?OXQvcmh3M0hUUmF1T1I2cEYyREw2endrOHoySHB3cFA1L3VFdURwS3FwWmNv?=
 =?utf-8?B?eG8yOC9CdXovc0MvaEZoY2xFT1JORkoyT1lPKy9MSFQzNE1sdXkxc0RLdnVI?=
 =?utf-8?Q?Rr6a6NFyBg4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0hCZTFnRGQ3QXZWaWZpdHdOMWpYSFpQalFFQkYxSWZmaktudkhuWjArNkhX?=
 =?utf-8?B?SHVEbk52ZlU1RzNOcUxkMG90blZ2Qm9jd291aXdydzFXRlc4VzdMV2lrTm9o?=
 =?utf-8?B?NGxsQWEyYnhMNkJQSFp4MmpYQmNnOU1TUEI2VWxCSFgrVU9KMzR1VFVVWnlD?=
 =?utf-8?B?eE90cDI4QmtxaVYwYlBGMDA5eTRzUWY4aW1XUHpndll6K2lmYVhRakNPSXRL?=
 =?utf-8?B?bkcycVVoWmpRRVJLeFA2cFpTTU13eEtyS2hYb1BaZXMxZTZNSXV2UEhpUGw4?=
 =?utf-8?B?bERLOFZxMmttZzJkS0tBUGdGaGdGaWt3ZFF0S09sblU1aVpJdVltZGxtUjR5?=
 =?utf-8?B?T1pjNDJsbC9DMmFGemVTU29VU0VOVVNOVGMrU3pjT3RwNzk3Mld5cFozN1B5?=
 =?utf-8?B?V2lld2wzdTFjUWVyTWt2eHpTbC9xcUtwck5xeC9pS0VoWUcwSGU5cEllUGQr?=
 =?utf-8?B?eTZlUzRxRUhoTStjVU9rMHllVHk4WUJCVk9jUXp1SHhxbEJPNDVPS3ZVeGE0?=
 =?utf-8?B?a3hCTk1GRlpiVVhhMzh5RmdSY1FRRVk3NTg4aVVDdWc5eFZZcExFekZYS1VK?=
 =?utf-8?B?Snp5RzUrUkNxTVpHWmUrbVlhWjdBNlh5SkRqVWhhd2JhWHNjVzdud1BpZWlh?=
 =?utf-8?B?eGZzc0xubktkSTNTeHRQVnVBZDNaek1semk3THl5NGYyd2tBQTgzNzJjZEsy?=
 =?utf-8?B?Yjlaa0RPcVVkaVpuSUhoVnZkTmx5SWVPa3N3RnBTSDMvbkJCc0JNeGYvTkkw?=
 =?utf-8?B?dHdTcVZWRUppTTU2bGVrTkRvcVBHRUdCVW1LK0dOQVRBQTBXMnhKN3JQUW8y?=
 =?utf-8?B?dTROYzFPSGtNOTlNck4wWUoyODFSMitQYzJ3NmpSV3d6bU9EYzNNUGMvRWRM?=
 =?utf-8?B?QzlKZVlMdWtuSVVoZmcvakt6TE5HSVlkS0xGRXBHZ1Yyc1B3d3AxL2czb1l2?=
 =?utf-8?B?NXBPdVVGSVRUMFFVYTUzRER2dmhyeTRScFQwcCs2UTVYc1ZUaGpqWW92OWYv?=
 =?utf-8?B?aEszLzdiQ1RoUnZJRm0vditRL0hLbzZkQ25xKzNFa0ViVUNnSlJaTytJZFJJ?=
 =?utf-8?B?Z1hZajBOUFVUdzdNNHc3ZHhrT2VleHh1NktUdkExV05iTXM5dGd3bzh0c3dP?=
 =?utf-8?B?OWhuWVh5SFBYK2ZrVkxweWdKQmFGMzRqekNyTzdISk4xUmRyd3lWeTJVZENW?=
 =?utf-8?B?K3pFc3kxZXZWOFk3VGtKQkdRZXI3VmNEZlByM3pGd1hpUEFkbTlweUVBd2ti?=
 =?utf-8?B?cmE0dlRnY1lTSmdMT1ZlZENGMDFibXFTdTdiVnc0OVdnbWI4M1VlODRTR1VH?=
 =?utf-8?B?ZFY3aEZsdC9rVWRDbVg4Zm5STnFFa1lJU092YXc2ZzQxaWE4M3k2UFhKc1FU?=
 =?utf-8?B?dWk3UStIK0xkV2lDbGNVSEhQWTVyZXhjdjBPSExiZWpNbDI2bmJLR0EvQkdO?=
 =?utf-8?B?UWt5K2JGOThMQ3IveG93N3R1clNCQXl5R1NhNFJMb21RR1dhTjVIRnVJUllE?=
 =?utf-8?B?enppUWNYUW05ODFjTTVEMUVnUzViZm5CanN0Um9rNnNUbFdQUXNUbHhvSUNE?=
 =?utf-8?B?VFoyRndEU1JscUlZck9zUVBnY3l5N01iRURIMlBaUERscHl3Um51bVNvWW1x?=
 =?utf-8?B?ekFRUEgrWllQZk1XejUzMTZOOCtBVDJ0L2xmenFNTWVxdzlCZW5UbGZJUyt0?=
 =?utf-8?B?WkdqWFExY1hNQmpzVERORDRsUHVpcG9hNGJNNk4wUUY2MUxMRFlQQVBJWFMw?=
 =?utf-8?B?NmVSSTNUUEp0TkdwaGt4N1NiMHJiRWcrejRNZHBoSUxLcnFVbEFVNTJVdWdH?=
 =?utf-8?B?emNTRWJiWDZCMkM0QnNldjJmaWJuanlnMWl4QW1PLzFVNkRXalgzS2VtbWE2?=
 =?utf-8?B?eVJIbW11TGNIU0pnN3NnWHNxZW1xaUlPQmdSNlpKN3hKeWlsc0YvYUVDYVZY?=
 =?utf-8?B?c3U5TnFvMU5MR0p4V3RIdlhZSkcyNTBFcHMxc1k2d3lMU0JMWG1sSHdDd240?=
 =?utf-8?B?YndYYXAxSlhGWm45ak0zc3A0UUZwUkpVVUlPb1h2ckloaTl3ajNvQ3RaNTlv?=
 =?utf-8?B?WExjUitITjFtazJucGRPNGRuY0VKbGhBSEE1eVk3VVdROXQ5RDhyMVpoTFZl?=
 =?utf-8?B?L3RjMWZqbXNoQkxPSzE2YU1KL1l5elFhMU1JK3F6aU5JRXpleVRuRkswTkEr?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8907b958-7b74-497d-9d49-08dd7b8285a9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 18:31:07.6760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dvYOKFol4gHBldsTWkcJoChJsqH8LEVWnG7Xtw3gU2jWX4oulF/tzIyMCInS/lRfkIDUv3lq+1tzE3TyGTSgP8Kg/52feCF0I44BAiv7Z0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8365
X-OriginatorOrg: intel.com

On 4/14/2025 1:23 AM, Ingo Molnar wrote:
> 
>> Chang, mind sending a series of the latest version of all the pending
>> APX patches you have at the moment (and any other pending FPU patches
>> you may have), with Reviewed-by tags rolled in, etc., on top of:
>>
>>    git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/fpu
> 
> Note that this is now all in tip:x86/fpu, alongside with a rebased
> version of Chang S. Bae's preparatory patches for Intel APX:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/fpu
> 
> I think we could now start merging the rest of the APX patches, for
> v6.16 upstreaming.

Thanks for the update! Finalizing a few minor changes based on the 
feedback so far, and also refreshing a few other FPU patches that are 
considerably worth to be bundled up. I’ll post them in the next day or two.

Thanks,
Chang
