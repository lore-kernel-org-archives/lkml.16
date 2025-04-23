Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D179B20C023;
	Wed, 23 Apr 2025 12:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411316; cv=fail; b=RTcGgxvTldh5yPTm8P5lNQlLELWdhO6toVenmY/jWHYFaSg31/F0OMx5T526LFKXcCiEWoLS80lLHhj6nSI45Ly1/mLinR6nfwI4yo74y0mv+XW6KT7z5XxMu/+PzdxBPcDNWNM5nZN7887GCgUQtnDRs3PFbIaECXMMDGx+aNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411316; c=relaxed/simple;
	bh=0YBSMYSuCm5/xLWGHte+76HMdh8MCfsBKJXnx+U4PGg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qQ729ot+qdZRSaHfNyH+SFkS+uxvHpZmyUAqudCsu3/8zo3VzUA0FSKFW0Tnut94IsVsYN+rlcVQHC3fWxb4i6Mhb56EOQA6JEifBca0Lwh3Xd36lEhoAfofYNWYgDMxuOcRAu/Bli+7A1XYVsNbYrMNBNkzS617jQUKa51fGk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QX1C0s7R; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QX1C0s7R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745411315; x=1776947315;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0YBSMYSuCm5/xLWGHte+76HMdh8MCfsBKJXnx+U4PGg=;
  b=QX1C0s7R6JjP/7V5bRBiPGmVE8+wcLW2doMd7O1LgIiGpWGdydkd6L7j
   ZxNChRk96yNPDP5ZhcdsAcFCCV9Gylr5aX0C/wCr3WDRIjNmCa9u8v6RB
   G8jMISzsDLtMBmgVdKUfeeWu5LsKN8Gu0Bfj6nV1U0DMQjfzctp5YCZL1
   ERHNhxa4xADvhf+MGrn2RSnGjM+uEhqwpJMJhVAFY8aq/FHq2ko/fSv3L
   gl0Ba2enKT04X+pW1Qb8M3WBr1+FM+36ISKwApcWrWSfOl5Y4c9r+jU8I
   IJSKKFkxwF71blVnSGWpmVZSWpho6qy9S5G3ON9UzOsBh+0tyzCMd0sGn
   A==;
X-CSE-ConnectionGUID: 02hUButwRY+LmZDiIwqgyw==
X-CSE-MsgGUID: AZBNHu/KTG6n2u1JRwkQYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="69492288"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="69492288"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:28:33 -0700
X-CSE-ConnectionGUID: ReyHpt3MS5iN9rQKolTcUQ==
X-CSE-MsgGUID: SCGuZLs+RpOTJJekkrafzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132292414"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:28:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 05:28:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 05:28:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 05:28:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyVqhkgswm00Nti4hDoLkJ1+Qt7hsmMnILwiiadNIM8zXZAb2bymBqDinv53Wk5J8IAmhc+R5rJT1guV7V28/cZYvVlwe0DaDO1Rs3oWoV9mMIa7fCB0w/3Y64WEXRKWDdQrKIQlNyTxOfal72TWqfVjseyZw336pg1CEh9Ny1BD5llbTJRm22e5aaFS6g5wIrL3CaJVQI8ih6K5gbLMRNtOhtMBcC+anGZBQZKEkwWwuzPZpC/PyUUTebbI8taF6mLk86YhWlCIH4qjJ1017CRkhYRmy+9Fs04Qb6dCoX2lPb86oEAXn53UcEUhm6SmOCnB7R0R1uhJqzK/HTI0QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NeuXlR52KcJfBXvGhr4MdjVWsu5OE1LcOw2E5v97vlM=;
 b=WSEpy9FF3rs2Ltjgd8DgRcfQ1IY6dlHxNpQc4U+ZQ+plnQXlCVrCRQ7C7rmKfQfb4CWJDX3UWeox4gabNT2oj/FV3dBTmaaEjiAz+1KEucUx0XufQo15VA2BT17fM4Gp2mXS8xq4tVMDAlW3b3xYm3OdQfl5fbf1E4dA+Z52iwL9+5Gp4Wi+f7a/hWvdVVQ76nbA9DTnqktUqVlhUwiZOwzwtDZl6iOk3qVAsRvUMJDHsvEMKmtQ4C+jdYQ/DtATfeNHzlSIC7xdYOmdPrgo0877q8IMWJdUtEWM/PtYYY8HCDorHnhjf7OqNBehP0Xam+vcZWOcKl3sDZsXKaY2Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DM3PPF807974CA6.namprd11.prod.outlook.com (2603:10b6:f:fc00::f33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Wed, 23 Apr
 2025 12:28:30 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%6]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 12:28:30 +0000
Message-ID: <7e856661-e7ad-4571-b033-8aba83239a78@intel.com>
Date: Wed, 23 Apr 2025 14:28:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] AsoC: intel/atom: Return -ENOMEM if pcim_iomap()
 fails
To: Philipp Stanner <phasta@kernel.org>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>, Liam Girdwood
	<liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Daniel Baluta
	<daniel.baluta@nxp.com>, =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>, Charles Keepax
	<ckeepax@opensource.cirrus.com>, Damien Le Moal <dlemoal@kernel.org>
References: <20250423082858.49780-2-phasta@kernel.org>
 <20250423082858.49780-6-phasta@kernel.org>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20250423082858.49780-6-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::6) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DM3PPF807974CA6:EE_
X-MS-Office365-Filtering-Correlation-Id: 67562fb1-2c70-40a1-f77b-08dd82625aeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1ExMUo0ZGVxRytzYkh5NUt6dnJib016S05lR1lHY0tFSitoeGhkb1dwNXpv?=
 =?utf-8?B?cEZKKzlVR2JhYWhnVS9SeDMwTytKYkhBTFdiUFZYSGplZGlxMjl4cko5OThY?=
 =?utf-8?B?WTZqTTdjVTRCUGRaaEJlMk5PYlo4VUZ4cDRZYlR4bDlCSVVuV3JtQ1Rvdnky?=
 =?utf-8?B?dkZHcVhhaHlHR3pGL282M0lqZHVBejFBZTI2aDhwVlBaV3hSZFRjR2ROM3BQ?=
 =?utf-8?B?dTdjYkwrM3RldW9YanFKOFk2YUR2c2R6T0p3S2ZTVC9iY0dqYXk5VTRpR05z?=
 =?utf-8?B?YUk2M3laTE0vQW9rS0xBUm1Oa3pKWmFnRDdsOEZBTUVRWWd0UmVvT2RkYTR2?=
 =?utf-8?B?S2pCd1V2R3dnaXJlbTRTVmJpU3lpak5DUmh6azNCZTUvVU94M3VzSVIxMnUx?=
 =?utf-8?B?aXFzUFYvNTluN1Rkc0VUcEc4b2o3eE5RUktiVFFPcDdBcGhYU01BLzVzdnc1?=
 =?utf-8?B?K3BmVUpuMUNtRHJBOWJ6Q25DZU5wcUI0TU1xS01zcEpjbVcza1hXRWVOOVdl?=
 =?utf-8?B?UmhYRkp2L3hMazBmcEdpZ3I3N1c3S3FKT3ZvQy9NMEVnWmhKUnVHeDJHSVli?=
 =?utf-8?B?aXN2RDJkOC9QT2RQTHpDTlRvMVVLc29sNzRKbmw5UWlhSUt1MU8wSjN4alQw?=
 =?utf-8?B?M09adEpuSmhucXZjeHNldEhhNWFXVHlDUmVhYXBGYTY3K09Gc2VyT1hPc2hh?=
 =?utf-8?B?RElrQld4Tkg3a1JJSVdTQzI2N242UjcvRitsdWVWdTE5RGtVclMzL3NUL2ZN?=
 =?utf-8?B?bHc0aU02VFN4OEpCYkRGUE1HMlBFaGo0M0N0WG5PandwQUd5RHRmUEVLM09y?=
 =?utf-8?B?ektFZzBpL0xieVZ0QWxxRG9ESTRXUEQ0dkdCa3pGSFhxV0dTK1dXb290N1ZX?=
 =?utf-8?B?Tk9KNGJ6WWdoeFhsSitXSnprSlB2U3BTeG5WOEVqeDNBNWdxWU9UL1pEb29Z?=
 =?utf-8?B?L1JGRWRwbG92OVVmOGVNUUlVZVpSZGgyajNad21JZC9JWERXMDFsVHU2K3Z3?=
 =?utf-8?B?RnJVSXlGMkxuckR0TjBZVHBrQlEyVlhoV0ZBOW9tWmZBNlhrZTJWandBamV3?=
 =?utf-8?B?U2ZITFVPaVNwc1JJb1R4VVdCZVR5NS9uOFRwNGhTVDM3azAvM2xJT3ZGVkZx?=
 =?utf-8?B?Q1ZKQkhOd2tBZTd5ZDFKaWFLQXE0aDk2MXJONzhFVHJWZUNZdkU3WndGQ1Nk?=
 =?utf-8?B?TnZZTE1OOFBUS1pVM2dnZlY5Tkk4amxGVlZxRXphUS83OEtTTGZIVE5Sa2Ni?=
 =?utf-8?B?UkVkNkdvTWxUK2VLYlEwRk1IWjNGYlo5N0VEU1RQTXVheWo1aVpPUXc3N3VU?=
 =?utf-8?B?MHNNN3VveFBqT2JvZllsVityd3FHQzlRQWNoeVE5MFcrQ1d4RDBBTEJkRi9J?=
 =?utf-8?B?ODQ3VHh4UWZjQmRIVVlqRXUvei9FMHY2ekZ1R2F6T0RycCtGVEk5NEtscWtl?=
 =?utf-8?B?dzI2WXRTa3Q5b0xMa3dwS1c3TFdvM1pabHF1VjJvTXVoK3lSNUZHR3hhbWxE?=
 =?utf-8?B?NjhyMlZJc3poRklXNzRQOEQ1K2dnRHpZdzZWczlvQVNsRWRqeTZqTEFjRzhl?=
 =?utf-8?B?cWlpL3RieVJ1T0t5eCtoVlYyNjB5YnNBMnhVUEROa1FxSmNJWXN6cTM2aSth?=
 =?utf-8?B?SVFKNGx4QVVGdldmWUUzd1JnSGFkalU4Q0ZxR1lOam9IM0U3d0FBUTBzTmY0?=
 =?utf-8?B?a2ttTXJ4RUlnZmdWdVlGblFMcmxyUjR1QmsrR3ArL0ZoQW1wS0VWSnBiTlJC?=
 =?utf-8?B?NTNsOUd4K2Y1SWdwK2Q3UU5VczlLSG5LdFRDSTV3Wmt2ZCs0TklHcmFLT3Mr?=
 =?utf-8?B?T2ZBS3c1aW9XZW50UmgyTFFpVzJGZVcrYmtaeU9EQ0NPWEQ2dzhQRVlJNitK?=
 =?utf-8?B?N3NpR29vcXVISk45YnRmUG1tclNVblVHNzd5R3ZwSTAwTndLTUM4QUZRbDBt?=
 =?utf-8?Q?3N8LSBjXlfw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGNWWC9LNXk4NHcwRTIzYWUvb3VGekdNbmw4UWFoWTJXanFaSXlpQXZBUVU3?=
 =?utf-8?B?c1ZZS0I0WnFhblltN21MNzd3b2dwYWVRWXEyUGZYN1RGU1ZzRWdKUHBubWto?=
 =?utf-8?B?ejRkUHFFTTFnQks4VHJuSTVuYnQ2MFkzU2JxRUFxL25hNUxPNVAzeFRyZmF3?=
 =?utf-8?B?TzhMUjZCN1RYbkw3ZDRRYkJxMDljTzRaQ3d2L1VPZnRsRS9OZEJiYUtyeEh1?=
 =?utf-8?B?RFdqOWVacVV4cE44cUpPYXM5ZHlsVEJJcW1oU0duaHBGWVdGY3Fnc1ZGZ0xq?=
 =?utf-8?B?RVlBRmJTOTM2OXNoeDJlQ1FDKzlnZllKTVFEWE5aU1EzYjNEaExLSS9qRTV5?=
 =?utf-8?B?Yjg3bmhJRi9xRDVCVWNoSVBhdnFwNDdhdDU3OENDYUVxblFpZU44dHBCYUVT?=
 =?utf-8?B?c1dycHdBdDJvczZUY01CZnZFWVVpTjRneSs3ZHU1M3RsckNSaUlUbW9sNGdQ?=
 =?utf-8?B?d29Qb2xBYllXVW5waWFpMEpQa09HODVVUjltVUtMK1hBeFUwUmtSTkcrVmw5?=
 =?utf-8?B?ZXozSHM3ajJjZFF2T2RsbDRvcEw4MHdlK2pFMjg1ajBzWVhscmUrRFAxbFRp?=
 =?utf-8?B?b2F2b0tEQi9xOTdlUXJNOFU3NTFMUWYwTHdLcUZCcFZVdmEzak9NY1pRZmdi?=
 =?utf-8?B?ODlaeHhJQ3BxRUJIajFKdDRuYWt6SDRLYSs4QWo0bWpXUUk0YkRqWlFLdk1Q?=
 =?utf-8?B?ZHJNSGtBV0R1dmVadFZaWWpEZENtYktHbU45RDRlSm1uaHVoVFFRRW9oUE1B?=
 =?utf-8?B?eHZVMkt5bitBOGJOMXl1ZlBtbnMyVFBUajBiOW5lUnR4OE9tak5lRVFDSERI?=
 =?utf-8?B?Z0VtNGVGaFpISDhWcjRCMURCUDllZGNFWHl5S0RCM016akRjWnh3YUd1Z3NE?=
 =?utf-8?B?c1J5RjBWeU9sU3BYSGtFVU01cVQ0RE1TRWFqTS9EUXFDZzFPdEpwLzl6NlB4?=
 =?utf-8?B?cWpVVHRUNEJhR0swQWlDNm52SzVFM2I1MGtpa3dFVEhwRndpeXVOZml0aGtY?=
 =?utf-8?B?SCt1VFhTN3h1Zzk4ZDFZdU05NFAzMkM5MXFCSzV1Qm92cW9QUUxkOVEvdGx6?=
 =?utf-8?B?eEdyRFB6SEdzTXZsYVR0UTErL0lKKzErTnF4cVFRbXNtS0EzcGhkOVJKYlFN?=
 =?utf-8?B?ZlBrd3ZiTnVDd2Q5VmRmL3dnaGlSeUh5NjN3SnkrbThrTHRYUkhjNWplVURu?=
 =?utf-8?B?K2Z2TlZ5QjZ3WEFTZnkxVldmMGREVTZiVFp1UWFURnlpNERkUWhLNk1WVC8w?=
 =?utf-8?B?S1RXV2lkMHVwM3JHZHBqdWNCZXF4NVJVSWhPeUtrT1NWTDdTOVdPZDFmOTVX?=
 =?utf-8?B?ZVY1ZExjZzQrWmxYcXFBVzVtQWk4VlUydWxtRWNlRERtSmVGQlhvUVdJVFlD?=
 =?utf-8?B?WnlnZGJhOXhSRlY0d2dIcEVLdVFNRG03czR3Nm1GRWFGa09xbHUvZGJCWllP?=
 =?utf-8?B?RFdacmN0TUxwZ3JKY1N1cVB5M0dEYnpLSWdFUzlRVzl6UHVmV2RxRlorUC9O?=
 =?utf-8?B?cnNlc3RjLzFyUEV4WjRNbE44SHdGeHU5ZGZwZ3hXbzgwM3ZqdlFDcnlCRCtx?=
 =?utf-8?B?V25aN2F2RWxIbjlERGpxdnM4NE5lU3BGSEFwZGxCYmY0eUJTdlV0R1gva0Vl?=
 =?utf-8?B?Zy81OTlKdTdsdTZoc0lEaEFtZ1prODhXcDNQWDdXMkFvbG1yMWJDaE1xOURI?=
 =?utf-8?B?YVZBaXpQL0J2NlpJZWZlVXE2Sk91U2g4aVhQRS9MMitCeGVMUDgzQ3VhMjNr?=
 =?utf-8?B?ejFacDB0U2N1MU93UFpBMUpXcURpb3JVWFZhVDNWRGtGSHQ1OHMvb00xTjdU?=
 =?utf-8?B?NDNlQzBSSlpqNTRnVEFBd1JNZ2hjMXZnOFVubVhYZERZOVd0aEJOQXRFeVlM?=
 =?utf-8?B?SllUWkFXMnpmN1pha0dmRi9DcGc0b0pETmVSRXpGVzl3TmNBWGFnWEVRSWlI?=
 =?utf-8?B?V2szS0hhYTczZys3S0RreGh5L3lzZ21CUzdDSXFmMnB4ZytLeEQ0dmxZZWVV?=
 =?utf-8?B?Um5XSWkyUzFrOGhXVkxwNjJ5dU9rbGdPSGVYZ1RaeDVKTHZwejlFZXRnL3Q4?=
 =?utf-8?B?SlUxRC9XQUZ4Yk5vWm1NcGkrVVpWOSttM3pOcWxYQTRRQWhWc1FqYklzd0xS?=
 =?utf-8?B?c3d2VEQ0Y3JTZmFpQXFmc2d4VVNnNjk5Y3ZjNW1yU2NsaVIzYXJDT2Z0MCtQ?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67562fb1-2c70-40a1-f77b-08dd82625aeb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 12:28:30.3199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuUd0jTzH3QFi5DyE+fFSZBdaisUhbjH0s5J56+QFGkS0aL5Uqx2lwF4qpbI0fJgmrzeV5C3UpTEog4HgVRT3bJ+UMPdVYTdwanXQj6W3Fo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF807974CA6
X-OriginatorOrg: intel.com

On 2025-04-23 10:28 AM, Philipp Stanner wrote:
> The error checks for pcim_iomap() have the function return -EINVAL.
> -ENOMEM is a more appropriate error code.
> 
> Replace -EINVAL with -ENOMEM.
Nitpicks:

I believe the last sentence is redundant, the title and the message say 
it all.

Next, the suggest scope for the atom-driver is: 'ASoC: Intel: atom:'.

> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   sound/soc/intel/atom/sst/sst_pci.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/intel/atom/sst/sst_pci.c b/sound/soc/intel/atom/sst/sst_pci.c
> index eadcf24cbdc3..edc86519816d 100644
> --- a/sound/soc/intel/atom/sst/sst_pci.c
> +++ b/sound/soc/intel/atom/sst/sst_pci.c
> @@ -49,7 +49,7 @@ static int sst_platform_get_resources(struct intel_sst_drv *ctx)
>   
>   		ctx->ddr = pcim_iomap(pci, 0, 0);
>   		if (!ctx->ddr)
> -			return -EINVAL;
> +			return -ENOMEM;
>   
>   		dev_dbg(ctx->dev, "sst: DDR Ptr %p\n", ctx->ddr);
>   	} else {
> @@ -59,7 +59,7 @@ static int sst_platform_get_resources(struct intel_sst_drv *ctx)
>   	ctx->shim_phy_add = pci_resource_start(pci, 1);
>   	ctx->shim = pcim_iomap(pci, 1, 0);
>   	if (!ctx->shim)
> -		return -EINVAL;
> +		return -ENOMEM;
>   
>   	dev_dbg(ctx->dev, "SST Shim Ptr %p\n", ctx->shim);
>   
> @@ -67,7 +67,7 @@ static int sst_platform_get_resources(struct intel_sst_drv *ctx)
>   	ctx->mailbox_add = pci_resource_start(pci, 2);
>   	ctx->mailbox = pcim_iomap(pci, 2, 0);
>   	if (!ctx->mailbox)
> -		return -EINVAL;
> +		return -ENOMEM;
>   
>   	dev_dbg(ctx->dev, "SRAM Ptr %p\n", ctx->mailbox);
>   
> @@ -76,7 +76,7 @@ static int sst_platform_get_resources(struct intel_sst_drv *ctx)
>   	ctx->iram_base = pci_resource_start(pci, 3);
>   	ctx->iram = pcim_iomap(pci, 3, 0);
>   	if (!ctx->iram)
> -		return -EINVAL;
> +		return -ENOMEM;
>   
>   	dev_dbg(ctx->dev, "IRAM Ptr %p\n", ctx->iram);
>   
> @@ -85,7 +85,7 @@ static int sst_platform_get_resources(struct intel_sst_drv *ctx)
>   	ctx->dram_base = pci_resource_start(pci, 4);
>   	ctx->dram = pcim_iomap(pci, 4, 0);
>   	if (!ctx->dram)
> -		return -EINVAL;
> +		return -ENOMEM;
>   
>   	dev_dbg(ctx->dev, "DRAM Ptr %p\n", ctx->dram);
>   	return 0;


Hi Philipp,

Thanks for the patch, this is certainly an additional effort, on top of 
the pcim_xxx one. Couple of nitpicks above but nothing major. Regardless 
if you decide to address them or not, feel free to add:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

