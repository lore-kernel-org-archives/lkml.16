Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF22167DB7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744769893; cv=fail; b=ltXeaLRXHhvyIXKv4vIhXHtLYmc3l8+XOVrK3+92bMYWk6hMJaOviVyF55EvS2mlHOGskzu7hWLy3t/kyHAkuPtMea5gnyAZtRZXS5i3/G5jZJoF09vgv8RTp8pgCSYzL8qAgoNdUgjmPv2P5AF2O+I1lKEJ2W7yQZVcqWEt2pw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744769893; c=relaxed/simple;
	bh=GwKAaXIz2wPnoHbWMIuJqsvhaOwYaKzIY/dHdDTgEVA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZgMBaUmQmxjjR8JZFW3dueRJCvIa7VTNsd6Y5/loP1v2XNsiX3SVHO7rnHRPH+CM2H5BuJMikmKPtFZePlWC04ycnXf/u67WmlhZ3uMhyd8iVaHu1TgcDAFZGXZOYpxgxsazeQ/Sqm5NxCuPBil9uynRkDPY12imfEDK4oB0dHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OUEGAjhR; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OUEGAjhR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744769891; x=1776305891;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GwKAaXIz2wPnoHbWMIuJqsvhaOwYaKzIY/dHdDTgEVA=;
  b=OUEGAjhR5cb/ehnrqnRpf9rwhQzKvv1akbLnvyAfWsZf4h9Yyv38JT8f
   ZEBncSpPWfGuePZO4VIfNouE7t5tTsLiAZTCCT+KtojFAaChhG6BsvPbn
   3vXW2lLKvOh4wB5PDrxNPNdJ8E5E4JFpN0seL2ddWamr9KUanps2Ovalp
   1+dKPVuOClhir7+ha7DzPxvacxUpewvJdzHwGKZFSJmPVaFAv4MHtHKIt
   0Vuu8UQxUBxnR+UeRNWsWkHPPZ2/ffc5kmP4Fje/6XVKbGPhRh2EXGKlu
   LF9NC3M5gEWh6IDA2Oh1btvSXvdqFfU8O3ObiQOG+4ARuFYmM9q+TFsNS
   w==;
X-CSE-ConnectionGUID: W4Sh09F/R9idm0GQ0MwdpQ==
X-CSE-MsgGUID: 5WytgiDfRRKFOfWFk40TsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="57293702"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="57293702"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 19:18:10 -0700
X-CSE-ConnectionGUID: kLvUT03aQQCov7VN4cVfaw==
X-CSE-MsgGUID: 0zPArUAATlqo+7/Gz7qOtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="135457959"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 19:18:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 19:18:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 19:18:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 19:18:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ux7yLQzjFJjQUBNdq6aYStbGBLNMFTzj4vXpQLqZh40IufQOH9ns71TH9lpcSGevprcru4humPf2tpq/UGg/I9f/5kZN4HrIoamj2kk6bvgZ8A5bk6fEjr8aJCdRLRpzhmbocsDoNf447CRpIAd4sY16vTGhffVDt5E2Z/MTMkqCEEgo5rdJGR0vn8g9EYaHUGyJoMqXBP/cmUcuImYnN5+PHbAJrFdm0/Ow3T04XrB5gaJFYe+eT8DImgohzTfyIHV8pVlRtO0b2K693fIEfA/faBfkkPtdUwdaJj+GnR1BXMX1DE03KEta3R3t5QfNFzizwAlSY+ghZsWi4FJ0Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snpc2Ntat0ZTtRnapdzOEmtRRpWVuJywdIuGTemeedI=;
 b=AqFvxRiH1KHMQFaagKI63FeGu6+5sDUWgvj/NHRjYgcZZCCKKeEmxEU3d9wdDJrVt2i9guO8WfgesDas9M9DMkvhpBJb2c0S5p2Nzlh+QO+nRt8TUmlC6TCwCBp4ZSq4TGz2IfjlqlOhMgJLxENV3Ao5AApVjf71yAwcC2OVT3tW5sGUqQ8SkBql7QM7Agcjn2IcnEPsMup3Gu3Zz/kzg5F8645eXEOVrBCxBzEM2/xPE8R+UwRBqxR0TbYRJYbJXuBxtNrs/5+Kk3eXPxsCWgOL/EVu7xFnlSrsivg2p28SpM8rGCBgpyazOZF2SKGjOjAifzZfu0HJwF+cvw8mTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by LV1PR11MB8789.namprd11.prod.outlook.com (2603:10b6:408:2b4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 02:18:06 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 02:18:06 +0000
Message-ID: <373c32c1-3f8e-493a-989b-9250e939adf2@intel.com>
Date: Tue, 15 Apr 2025 19:18:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 18/21] x86,fs/resctrl: Remove duplicated trace header
 files
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
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-19-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250411164229.23413-19-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:303:8e::10) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|LV1PR11MB8789:EE_
X-MS-Office365-Filtering-Correlation-Id: c5bd4d01-5427-4030-a6d8-08dd7c8cec57
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VW1zMVg0c1pFUFBsR0ZURi9tbDhUNjNyZ0xpaUFZam5RRG96RncyVTVaRmZ3?=
 =?utf-8?B?WXJMKzMxUHpTSzl3L0YyTTV3c0NISEk3dUMvUlc0bHpPd3UxOXE4UVdjWksy?=
 =?utf-8?B?ZHNFcXo0cUpZWG1kMFo1YTVBNlRGV0dTMlNUUHNrRDFobjl6V3AyWUdiRzJj?=
 =?utf-8?B?VVZjQ09Iay8wR2VYVnZ1cGNOR2NaaG03Zlh3eW5LODIxdWNVbHpqN1BCdkg5?=
 =?utf-8?B?NU9pZDVrZk8zSkRwZDJ0RllpQ2ZtU251MW9iWm16bGZvNmdQbjZmaHNkVzZH?=
 =?utf-8?B?bWtML3V2a25QVUJPNWFIcFZiVkFrbGVFcnJPOGFYeUhCa3hhNDFFUXBlQ2kz?=
 =?utf-8?B?QTJxQmxVOG4vRFZ4ektPMFpEU2l4RVlFU25Ib051UnNyMEM2VFV6RU54K0hw?=
 =?utf-8?B?OS9uL09HUzR5TVlMUHdOSno1dVk0SXYraVVaMDRXWDdEZ3lEYTNWV2YxZ25h?=
 =?utf-8?B?R2t6SEJMb09xeEFJMG9ITCtiL3g5M2pxeldnU0V1bk5mejIxL09zeHluNHhn?=
 =?utf-8?B?OFpFZEJaVW9GcjE0cFNQU2JwOEcwelYwemQ1YWtueVdXRjdHV3dtenNXVmZH?=
 =?utf-8?B?OE9sWStBQzhrRnZYNzdEeURzUzkzMlRBRlkyNktiamhicWNrK2F6ZytCTDA0?=
 =?utf-8?B?NXRLN01rMmpXbGYyYTFtTVYxSStHYjU1L1cvTGlxMHMzbUdRUlFOaDd3MG8w?=
 =?utf-8?B?N01iWVpsR0p2dFhDakZ2K3RqV2FkQndsN3R4MVRteFQvM3BrQVZzV2o3OFBD?=
 =?utf-8?B?Q3UvcStrUkhPTmFrQndmVXFmajhIQ3ZGWTdVaElQT3lVYW9UUlpWUUlHcXVK?=
 =?utf-8?B?VitoZEtaYTR1RTdXdG5pMlNibERHeldhSkszQ05Wc1hCd1cwaDk4czZNSHRp?=
 =?utf-8?B?ZHJsUUIwaW5rczFRdDZpaG9uOFo0WVBtdnZBbHVaS1NlS2puNEdSdHl6WW1u?=
 =?utf-8?B?MGRvZ2tNTkx5L3M1RG5RencxZGVDSzhURjhteXI3WGoreXcxL3Z4Q0FERFBK?=
 =?utf-8?B?MHZGTk5IQnNkWXByMjh4RE8vVWVySWgvc3RUaC9aUWdLZjVOeDU4WG5xS1gz?=
 =?utf-8?B?STdaSUhwYUViMmIzSDhBUGVUNVc4bzZ3MGZrZ3l0YXcxY29oLzVpOTV6SzFy?=
 =?utf-8?B?QlhCcS9tT25Xb25Ua21yazhZbWNmdmFvQm1aWWI5QktrcG9RcU5OSDNERWFa?=
 =?utf-8?B?aUpJRE5CeENYd2NrZ0FMVzcyTWw2QWRHcnhSUllEN2lBZTlONU1DYnplNDY5?=
 =?utf-8?B?bUEvVUhVelU4SW5zaHlDSmtEeW9oVWdJaU5lT3NEc3lhQkxBVFBOdVZ3ZEJT?=
 =?utf-8?B?UjAzc0JDbTFHbGdGVFhCbXVTYU9qNVcyd3I5Rys0TGV1UnY0Z0M4Ly9CcEMz?=
 =?utf-8?B?RSsxdWlmNFhHMG8wQ3lKejFvUzVZQ01Rem5Ub3FsK3oxOHg1aUdrVURKaWJV?=
 =?utf-8?B?R25aVEtXZ0RaeHo3N1B6QVpodm4wdm0xSEp5OFFSYldxSXBwejVyY2RUamgx?=
 =?utf-8?B?dEN2WXFwYlFkQmdqcW56VE1nbEFISEhrb0xoM1FlNTJyMWJUb2NSZlVoS2gz?=
 =?utf-8?B?ZGZuMFY4NTZGRHFOUERDdVhxNnUyVGVVNW9NMUNEV1Z1TkttQ2ZqRUVzT01x?=
 =?utf-8?B?eDlRZFErdktodjBnaUJycUtmVnlaQ24zVDRtam5UaTllS1ZMN2lxKzVuaXNY?=
 =?utf-8?B?Y3JhYkI4NVR2bUhtbnhlZnlQejh2TEdTcm1SQjlwS2JTVjE2TjVXSVRESnE5?=
 =?utf-8?B?VmlYbkp5YytPRHdVckJ5ZnNwWncycXhSemNyZ3htZDNBMEZSeGNYbFNyN3VV?=
 =?utf-8?B?ZDJFd0l6dmJFTWRsaGYza3RhSEFycDAydklOcTFSWU9vdFh6RmsraDdLZ01h?=
 =?utf-8?B?VEJNb2VxNkh5c3JyeStOaGZvT2JYM0I3U2VodVpHUE1yN3R6RktBdGdad3Nz?=
 =?utf-8?Q?7ERNMVr4RAw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aG1hbTNxdS8wSGFCcUp2Yk83T1NYL3VVMUl2c0R0UFdwQTkzczQzNUdQZzIy?=
 =?utf-8?B?YjVFb2RHZ1pmako5U0Y3NmVSU2VwbmlQY3N6V21QUmhZZitRZ280MEF6WGMv?=
 =?utf-8?B?QlZuL05Ic0hqbFo0UU5wNnVDNUdoSENzeDJBeVdQVDNKY3BqWGtKa0NxTyth?=
 =?utf-8?B?a25KYWJMRThPU3dHVVE2QWFEd2JjLzJ0cFo4MUtjY1VuV3BkMWdSM2ZMTkFK?=
 =?utf-8?B?VEl2UUEyWElDOThVMk1EZDJRVGFCaVhCSWNWNkUyMnNkanp6bldKbjhZSmVs?=
 =?utf-8?B?Tmo2Tkc4dUd5OWtvSXhIRHhxdWtnMVVSU2RJeFRLRk1ZZE8vUTQzYWZuZlBJ?=
 =?utf-8?B?dFMrVHZUcTdlMWhZYTZ4LzRGbU82em9haENHcVhJOTFpNnpqdDJoNkpnNzZX?=
 =?utf-8?B?dU5PVWFEay92Q2pmNnFsYkpzV1phQ1RMa1FnZmRvOGZVUTZSTTdzMldUL29k?=
 =?utf-8?B?aUxhRlJDamQvOVNNWlUyeUp6NzV0TGRnd3J5WTZzekVMdk43RUlBazVhcEVM?=
 =?utf-8?B?dmtCOFVwMDZ5dXF4Zzk5TDM1NEY4V28yalhNaXUzaVd0dTdrU2tWUndyQ1d6?=
 =?utf-8?B?enkyeUw0ZnZNQjg2Q2dJUWlwNmRxSTltcC9sdjUyWVUycXd2eTl4dHFYNm5R?=
 =?utf-8?B?S1hLeENSczc5TC9CaFVWbWxkNUFNMmhjYnZhWlFKTDRmSy93NmN3VGx4NWdo?=
 =?utf-8?B?TEprbWpMWkJOUThDKy93WElmaVBGcnlSNHJ4ZjE5S0EySnd0cXpiNWRpd0o3?=
 =?utf-8?B?WHJ4WjVITk1xTUdrcUoydU5XYU1VQ1h5TEpwbkxKNVorRTUxT1o2L3JtYVdS?=
 =?utf-8?B?dTlLc2ZhUXBhMnNCeEFSOFpvaHBFb3ZFbkVIblB0RmZrT2lCUUNCTzdMOEVy?=
 =?utf-8?B?WFlqb3ZMSXVzVG4xdjFIcXgxTGtqYWgyV2p5TDgwNDlFMGgwRWhFWDIxYTRP?=
 =?utf-8?B?cGlEd203M0c2UEZFUkh1eGxOSHRBTENaeFUzVXE3NFY3S1VQSHFZSTk1ZjJu?=
 =?utf-8?B?bXNOaWsvdUpoUjAyb3Z0MmlrL2w4aHFWTEU5Qk5GaDZnRklvTko0bU5uaTBE?=
 =?utf-8?B?RmNPY1luY2lyd09RSEdsbHdveTd5WHBXYXpPVmZValgwcEErbVdKRTdQVnJl?=
 =?utf-8?B?blN6UVBOaEZhU2N6eTYzZDFXRXZtV0tFSFlUdkoyc0h4QUw0bG9DaTlXTi94?=
 =?utf-8?B?bldTMkUyVWRCYllPYXd6aWU5eDBXS0h0NVFCRWNFQitUdnIzdGZKOVlqY3Bk?=
 =?utf-8?B?V0lSY0pLbFQzN2RTVktYWUJjZ0RHRFFlUnAvaG84RW41eEZjQitPc21vcVo4?=
 =?utf-8?B?WjNQaFNNamE3OWNGeUhwbDE2TGJ1dW9PU0ErZDVBZ0FYSWlKZHA3Y1NNVkp5?=
 =?utf-8?B?Z0owcU1adDhmc0YvV29vcnJzWW9DUFROUTlDZ2xLSzc1SDdZNE5ZMjI0RGFk?=
 =?utf-8?B?ZGV5d3JOWjZsaHFuWlc4TXkwVmRYdlBXQk92UXgrbXorOThOdmd3VWNJNzlw?=
 =?utf-8?B?V0NkUDJNQlMvKzhDblBUYXpNNUNJZXY3VkRodUJPZUI4ZjdhSG1UWXVLZ1Rn?=
 =?utf-8?B?N3RTODA3czNweVgxdW0zVHFZODRIK1VPbzRhYmVuK1h5TmE0ZWRpY3lSVVVa?=
 =?utf-8?B?UnFuc201QUZJTkVYc1ZBYkh3eFJhNytQVVFnakFwWkFGbVZ4WnVYVHd4a3V4?=
 =?utf-8?B?Z3FScWpqb0JCR0lrYzBONUd0QzZmRjNlcFNueFRBcjFTV2hNVHdaOFAzSHFH?=
 =?utf-8?B?QnBIc2p4dmRwWjdsSW1aVzZGNkpuN3d3ckNVRDhKenNNTzEyMHlDNU14SC9D?=
 =?utf-8?B?VTBldGl6aWJxWTJ4dWNycE9kSzlwUjlFaWpTMHBpR1pvYUp2eHBwTUxacnRw?=
 =?utf-8?B?MUdWekJqYWx3UzF2SWZpS055K0tTV2h1UGNaZ3JoVGorM0IxY3NXTEgwYUsw?=
 =?utf-8?B?dTFDRUJFVVZaRndJNjh5QXZxU25LSXQ1NG4ranVPSHFPOUo5QmFQaUx0YkM4?=
 =?utf-8?B?SzhWUXM3L1dKbnBQYnR1MElvNWtiVi9lSWtjUFY1UktFMDFZRjI2akd1Q2U4?=
 =?utf-8?B?SVc2dFVzVWZOT2pxMmxKdlNFdzBNNzJjTVNtL2ViSHdTS2U3RnZmMFA4TnVZ?=
 =?utf-8?B?NXRQaXJPSWFCUnlua0tzSGFhOUd1Uks2NjEzaWxmeHIveXdLMTlRMUMzQVIw?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5bd4d01-5427-4030-a6d8-08dd7c8cec57
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 02:18:06.0147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ro9Wak98/+2/RgB6D5EI1GhITYIbwgjiygluUlDMjsjmGtZteazVBFmJf46UdARXTGCLHjHpxUUUAeJG5E3UgB33kpP7V8M09rYnvUnguec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8789
X-OriginatorOrg: intel.com

Hi James,

On 4/11/25 9:42 AM, James Morse wrote:
> The copy-pasting python script harmlessly creates some empty trace
> point header files. Remove them.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Amit Singh Tomar <amitsinght@marvell.com> # arm64
> Tested-by: Shanker Donthineni <sdonthineni@nvidia.com> # arm64
> Tested-by: Babu Moger <babu.moger@amd.com>
> ---
>  arch/x86/kernel/cpu/resctrl/monitor.c       |  4 ----
>  arch/x86/kernel/cpu/resctrl/monitor_trace.h | 17 -----------------
>  fs/resctrl/pseudo_lock.c                    |  4 ----
>  fs/resctrl/pseudo_lock_trace.h              | 17 -----------------
>  4 files changed, 42 deletions(-)
>  delete mode 100644 arch/x86/kernel/cpu/resctrl/monitor_trace.h
>  delete mode 100644 fs/resctrl/pseudo_lock_trace.h
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index 1809e3fe6ef3..800e52845b1d 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -27,10 +27,6 @@
>  
>  #include "internal.h"
>  
> -#define CREATE_TRACE_POINTS
> -
> -#include "monitor_trace.h"
> -
>  /*
>   * Global boolean for rdt_monitor which is true if any
>   * resource monitoring is enabled.
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor_trace.h b/arch/x86/kernel/cpu/resctrl/monitor_trace.h
> deleted file mode 100644
> index b5a142dd0f0e..000000000000
> --- a/arch/x86/kernel/cpu/resctrl/monitor_trace.h
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#undef TRACE_SYSTEM
> -#define TRACE_SYSTEM resctrl
> -
> -#if !defined(_FS_RESCTRL_MONITOR_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
> -#define _FS_RESCTRL_MONITOR_TRACE_H
> -
> -#include <linux/tracepoint.h>
> -
> -#endif /* _FS_RESCTRL_MONITOR_TRACE_H */
> -
> -#undef TRACE_INCLUDE_PATH
> -#define TRACE_INCLUDE_PATH .
> -
> -#define TRACE_INCLUDE_FILE monitor_trace
> -
> -#include <trace/define_trace.h>

Should the "CFLAGS_monitor.o = -I$(src)" be removed from arch/x86/kernel/cpu/resctrl/Makefile
as part of the above changes?

Reinette
