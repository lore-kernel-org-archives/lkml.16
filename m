Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0B729AB0D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 21:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744408660; cv=fail; b=ZierXS4ChRMmjRHKgY8JhonSwEUIACCW6NoJ++SddiJzaOlWxf8sqGl5QzwDXZ5/8qkjDPDjG34ZbEC88CkgjUOuETUNgQmng8ziBWAk2jQtdLge7gK+bEJ11wAGe097HoKTL0GynCpZROPcK55bgtTvP6fT7LkrQEFuAAsvLQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744408660; c=relaxed/simple;
	bh=yL6lBKqF6jPucwFCgVeZL7Nj8AXYNvohwGnHtvGMMJA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YCGwuQvC0KlItriJRZiyo4Wor4iPB6dSjIbfAfnG3rpPhVkyKHB2lhGdySgcN/jvYkCs/j5goO75PGWh8/QkOCRuiHHhLdBd8sURNzzcSz8xxGOCa3mOU9SBR4u5DP6W0nE/O4QXNc+9oTapi+Qqeko2yvB6PC795eyvC2nhlhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AKSF08SO; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AKSF08SO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744408659; x=1775944659;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yL6lBKqF6jPucwFCgVeZL7Nj8AXYNvohwGnHtvGMMJA=;
  b=AKSF08SOdVJy1o+GThxBpn5zXd+IaOlGzVTHcfpBLVHCQZW6eA+cdSnQ
   FI/cFp4yfWupgpjJ23m5IEsDBcNinjav4WxrDCCbxaZy1B7e/FyKTQX7P
   cD6XdgihqrSkLnJfdH6B8KQ1DX2NFOS+ypLG3wHlxqflr6Q8iaTFZTdA/
   p8tjPBcw6W9YE3Za8b8yY8gdx9F50DgJ0O1O53HFgiPs8zK2B6hmFcqlw
   +kpqBxAbuGQXKLcByczQfRVbr6neygZwxTbfzFteNHjknjbykuGSt8hyx
   qZMNFUqLs+67p1rL35LOOUkN80TNcRIgyr81OmfAyTNTm11DsaG7Vpwk5
   A==;
X-CSE-ConnectionGUID: qODm3BoERu+4FhsXP+Rtbg==
X-CSE-MsgGUID: XP+lRn9cSm6/TScT8eVKOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="45107827"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="45107827"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 14:57:38 -0700
X-CSE-ConnectionGUID: f887l+VrS5OX08P/cCv6XQ==
X-CSE-MsgGUID: 6qf+3k2DRt+2V7YInRQlrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="130290272"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 14:57:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 14:57:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 14:57:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 14:57:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyTpT5iMcJXK7o4YKrX8w+iHVoCYmOs+37vzryoBgSAyXNsV3akeXfUFL4PnEutatvUeJEoZFbv1pjvOl7LbgF1r7AKjhnZvLv9gdOXgorpRKHp4PBd6GEwybti6oyL1xGRvHzXZm2ph03GXISGvujDc4vweM8wyaqy6XHVO2EFP5J5rXT+MjCDnY4OmcCW+ND9v16mNPSyIeRdYkIO6KzM225gKuL/zzNbV74m7cLbVJWcC6kfpDSP+mWSifAihH+rejbKDBNm36Jc82qLAb7+izPczp//HJrYrjxkzO1luzZXQnPgAlrFi47JdhUYJuDDDsQ7Q0b/9odvCFXRPmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQC3+plNXfYe42EMh5U0/A1Y0MxCddx14wfMPvYzyK0=;
 b=lAcALpFFSMM/CVV6h+6Lz9Zx8vTRSfsP/LAGzqAl1TGSzyGK6NjUUYOo66KQhneAgk1bLwE/FS+21v94OWAyytbQmlibKRSsUMYRZEQbL6Yqz+8I5Rx6loc3mR1UOjcFLfpAysgYrcEU08Gs7Df9ShiFpYnTDAZN8stJCoCR068ZhTbGbqOeZe8kxDZEGtFwUu+daqIPht8PuwzEOhuHV9gJqw9kHv11l2SU4UzjCMbwOISpLeOxoPXuBdzDJHz948PE9C3n3tW0RiDnoHBz79I1iXa7MGnV/QjXEuv8wh5As0KjUFY0GgJZJHZp5KFH6TwPUOj/O6zcsHDrxo28Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by CY8PR11MB7364.namprd11.prod.outlook.com (2603:10b6:930:87::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.40; Fri, 11 Apr
 2025 21:57:33 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%6]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 21:57:31 +0000
Message-ID: <009062d3-d4db-443f-8337-ae4223efffa1@intel.com>
Date: Fri, 11 Apr 2025 14:57:30 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2a 5/9] x86/cpufeatures: Add X86_FEATURE_APX
Content-Language: en-US
To: "Chang S. Bae" <chang.seok.bae@intel.com>, <linux-kernel@vger.kernel.org>
CC: <x86@kernel.org>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
References: <20250320234301.8342-6-chang.seok.bae@intel.com>
 <20250411161250.14662-1-chang.seok.bae@intel.com>
 <d076ee8c-0c22-4e99-964c-5ea254f5be14@intel.com>
 <7b91d929-fe97-44c6-aa94-05417bce1014@intel.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <7b91d929-fe97-44c6-aa94-05417bce1014@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0093.namprd03.prod.outlook.com
 (2603:10b6:a03:333::8) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|CY8PR11MB7364:EE_
X-MS-Office365-Filtering-Correlation-Id: ce7288f5-0a27-4138-dcb3-08dd7943dbc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ykl0YzIvTDAvZzhjRHl5K1U5RzlpMEh2b3Q2K3pSQ2dkWDlsNHhWcGh1RWVz?=
 =?utf-8?B?amFqbTVwZUhXSkgyNXZ1SE10VWpoRDNld1RSM2wxcEJZeGR3SjhBRXRZS2pV?=
 =?utf-8?B?MVJYNnJpQ0xVTXF6U1F5RTh3NW9xeVNjbm40T3llb2FKWkQvUUVEazNoUHJj?=
 =?utf-8?B?NUpnQWI5cnk3RWl3ZWFOSStTNENWWndFMlllQTY2SlhMMDQwOUF3dHh4Tngw?=
 =?utf-8?B?VWE2RWcwZm5tcGN6NXhmL0x0TjE5cFFoYkFqMXBzZnJBWmROY3dDVUZiT1VL?=
 =?utf-8?B?YWZkZHl0NU5ma25YaUxMOGJTOTZNb3RiVHhPK3I0WHU1cFAwcUFkNzdzTkt1?=
 =?utf-8?B?bmJicEsvbG5LeG5lN1QycEJidlUwUit0YVZ5M2F4bmlnaFhxUnhWdGtoRXpV?=
 =?utf-8?B?WXdRcW84RHBhZHAxMG5uUTdUTnd3dWZrTUlJckZNWGhQbXpYNWVDclc2UWg4?=
 =?utf-8?B?eDM4UmJjM2pYNndYR1RQajJDWWdCcDR6YVp6WGNIeXJFVC9nMVhFTXVYOTlR?=
 =?utf-8?B?K21JV1NIaW1lZjVPc1BQR0FSNzl3VXFhY3dpaHdkTXRzeFV6Tk9OSXRjN01i?=
 =?utf-8?B?Vy92OXc1R0pESjNyT2hSQU1KeEJGcysyeEVRSWpGM21mcmduSE9mVGpwb0lN?=
 =?utf-8?B?cThxZUhIdlUyYXEwcXNQWmZRdEdrQUJRcm0wRG84bnFVYlFKNjFzaXdRUXBr?=
 =?utf-8?B?K0xMY0U0UmFGNDZUS0h5cXZCQVY4ZkQzdDdBSVpEcDNQeWpSZnRNUFpMeElt?=
 =?utf-8?B?TytQZTl2aVg3a013aWtON2ZJaWd2aFdwenlnZldRd0JDQk94WGtQa3pwTWRR?=
 =?utf-8?B?aWZKRXBHU3BaRzhwMnNXdGozK0htSzBjNFFNaHl1UzFYMGJRU25IdmpuSVc3?=
 =?utf-8?B?MzhIak9tNnlTRTIxelZpNCtLUTI3Q1lPZ3lJQVYrTEtzNjhUaUVSWVczNHBw?=
 =?utf-8?B?WlgzM29Sck0reWxUOGdxVlRnREdSMWJTYnBaMEJVSHpVR2RUbDEwNnZkMWlH?=
 =?utf-8?B?bzRCZzlUU2Q5T3F4NVhTSEltcTBKaVhYQ2x5aTJndlNIWVFERVFKazIybERM?=
 =?utf-8?B?bXB6OVVZbDVKODZPaEhLL1lpV0FldXBpOG9VQnpnR3BZcFVnTnJtWWlhWjNK?=
 =?utf-8?B?VkN3cW5lNW56dThEWDFPV051ZDFIR0U4eU1zaXcwM1BVL0NJNitoMFd3QTZr?=
 =?utf-8?B?MStoa1dOTFByN0MvcnlZb1V6eWRYYUl1Qkl4aHBGM3lIam0wMDN1bDZaZndp?=
 =?utf-8?B?NThFZm45NFJwRGo3Z3dDek84d1o4SkxiOW9OcjREbDZWcHU2WkY5S0JESXZo?=
 =?utf-8?B?WjVkVFJtUFgrMWJnNnNmOXZabisyUW1TYXlndjFieXJTWkRIVmNEL3pyVkUy?=
 =?utf-8?B?MkU0eXVDQUFqUnpscGk0NUlQQkcxRHRhV0lRMlRYV2JVd0lGc0UxWXBJWkow?=
 =?utf-8?B?VHZaR082dFZIVmlCUDNWa2hnRU5sYml2aFBXRkZaSTZYOVNIRmtiWTRRUC90?=
 =?utf-8?B?RkRyNVA3RVJXWXRsRkZha1Uydi84L3hzSE1BaFR2dldITVB5WjJ2SWhpcHZY?=
 =?utf-8?B?aTJYNHJHY0lVemZDMExuZjJFeEV3c2lSRzg3MWc5TU80WGF3WFpsUThxUEFK?=
 =?utf-8?B?TWFGaS9OS2RyVlQ3NGhqdTM0cGg3ZTdUOEg5N3ZPeEJBSGtaYXZLNmhaV3hS?=
 =?utf-8?B?WG5EdkxJeEpnNHJIUHlZbTY2TzdDMFhqOEpYVkFsTTRXbzBTNHpPOGllOC85?=
 =?utf-8?B?MTdWSTUwQnBNMG55Y2dxRGpLaW9iSUNjSzhaNDlxeWFzaktJVlpvUklRck5s?=
 =?utf-8?B?b0tZWmhscTYxRnJzSTdDak1zNzNVMjRodnVxY1FtbkFUeTlSMUlnWklkNitn?=
 =?utf-8?B?cVU0WUh1eUhxZlM4T0xYTHZKb3RlT0ViM0xSOUhiWlBYVWh1Y1lPM0l6RVFK?=
 =?utf-8?Q?iVfnMilc/4M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2prZW5Bbmp6QUZGKzAyNElUeGRoRHVBc3UySk9PdjdEbGJQMmZtWXVVZFJG?=
 =?utf-8?B?WTdMazdQYklleUYzc05ndTVDTnlOZXRUYXNJQTlqYzlXQ3NNamdtelN1d0xM?=
 =?utf-8?B?eFc2ZjhyNG95N3VRbzIwZ2tRZ2tEeVdocDRSUThxMFRoUTQ4OTYwS3hnWndu?=
 =?utf-8?B?cDNqQmc2dlpIMUdtSm9qM2JkTlN0MmVUOVhiTjM3Z1JWcXpLRzZpcU85UHdO?=
 =?utf-8?B?Nk14dEtycmhkRmYra05ZZ1BYU3lVUjBXNHpmZC9aSkVXN09lYWp4czdoMC9H?=
 =?utf-8?B?SE1vZy90aEVyNFNWT2VxbXoyQm1oT3kwTWtySld2cDJKRVlxUzdzb0daK2xM?=
 =?utf-8?B?VUpBNjlaL2ZaZVc2elpBakVuUnBzWlZjem5NOUROemdFeVN1b2xtYnB6WW9p?=
 =?utf-8?B?ZHpMeXo4d2I1NmJtZHFXOVpZQ25pT3h5bkFIZ1FHTzVrMFlVZUhiSmdqNEtx?=
 =?utf-8?B?RS9OdzBFMThKUWsrRjFIb0VNSmRvektoR1dVRXkyU1Z4ODk1RHdaY1VjYVpk?=
 =?utf-8?B?bUF2cWFYOTExQnRnSG9pdXlqWVlCNUoxQ1dUZjZFZFRkUWY0eTBIaXV3NTNM?=
 =?utf-8?B?cldpNlZpL3ZyV1NoUXF5eEpyVzVORVlMVkU3NDVtZHIzVmdYTit6MVVIRUJF?=
 =?utf-8?B?eWFXVlRuSjRBcDBsMkJIaGhIaGhGWFl2TkZHUUh3RDlleDFiMlVRYktQdVo1?=
 =?utf-8?B?bWp5VTl4eEFESWZObkk4ZTc4c1JuWE90YjhlczloekUzd2NKcUo4R3dVVDl0?=
 =?utf-8?B?ZnBCb2VKUDRPbi9ieGF2d1FnTDBWR3NPWElNWVlKNkdoNmZoUWNvaEVXVnZu?=
 =?utf-8?B?ZXpkVUdSY0p2dUJnZ0lTWDQwekFkVUlhTlgwRmtsQURHZzBFMTJRNEtBWW15?=
 =?utf-8?B?WG04a1dUd29mM2lsWG1oaVdjTXV1UldXQnV1NWlEZUVqUklYc3NqUEJBWXhE?=
 =?utf-8?B?Mk1HbENHSThocjh0cVFDT3A2YkkyR2RWRGcwcVg2c2lmRzBteWlIcHU2MXA0?=
 =?utf-8?B?emFFQ2lFR1F3cWFFbk5NOStseUFka25iZ0NlSHBxYkhMcXo1b2VOOTZpbk1W?=
 =?utf-8?B?K3d5UjRid1hzdXBqM1VQK2k5ZHpuZzRJMkNidXNOZjZJc0RCK3ZWMWprSVA3?=
 =?utf-8?B?LzQyZUdEUUVmWVRSZnpqUW5heDdseXFmOU55TDZ0am9LRlBCbFc2dElQTWFs?=
 =?utf-8?B?bFV6UGpreEpObExpWkU0YTdMdytOK3JhWHhCOUw5SGlRV05lbEZXallHRHVV?=
 =?utf-8?B?ZEVGN0NGeDZoWkNuU2U4cWZHYWVaTTh2SExDYWRPelFDVDZLdjdwQVM2REhL?=
 =?utf-8?B?QmwyVWZzTnpOSjZhckd2LzZEOVVZYkt1V3I2R2krejlVYmFYb09ReXVVMC9S?=
 =?utf-8?B?a0tDVTczbUVPbzFzUlV0L2xXa2RMZ3ZmT3Zia1Q4d3pYc1NWZG1RNFFycUZP?=
 =?utf-8?B?Ky91VkJNUjhqOUZMbXRUb0NQbExKMlJ6aDdjbHJpMGVyUkMwWTZpUjJ2ajN3?=
 =?utf-8?B?Mk1pWkkrSnJoc0dXSkt1TDJkQlZvZmJOYjZXYjhRT1hCQk5RTHFUL3JQQ0Ji?=
 =?utf-8?B?b0QwaWNPSDJhbklzd0c2Wkc0RmlNMXl6bjdEc2NKNXlPQmpiSWx3bUJ2a0pw?=
 =?utf-8?B?VEIySUhFNk9kdisxaEtmTTFUWnk4V3Nsc2hQakJmMWRjcktnajBSZmlROFcw?=
 =?utf-8?B?ZGJjdjJrM0phTXN3L0NldlhTQUlPSDByVEpQakRVWEswblpUVHBrd0h0RnVQ?=
 =?utf-8?B?WkJYb3BGeFA1TXpkR0l6ZVlUanVnaXlOaE14bWRYTklLd0hHTE4zcXhtOEtO?=
 =?utf-8?B?VXJkaUNLK3E1Nkw2Qzg5L2lZNS83ZmNxbWxxcDJQem1kRzEzM21QOFlYVTRX?=
 =?utf-8?B?elk1blUwb3ErWnVhZWxxK0VremxZazE3ZlR0aTIvR2hNbllFNEJ0Y2NYdERM?=
 =?utf-8?B?VFRXdU0zdzBsZE40b2JFamtiNUZlRDcvYllITHZvV0t5bmp4aFE0V2J5SzVk?=
 =?utf-8?B?bDd4MFdRSnZpK2VCK1N4N2R3RXFmNGFXcFBoR2hOTUNBNmx6U3U1VDZ4TjJ1?=
 =?utf-8?B?T2JDOTNyUzM2TmZNcGNQWHlRVFo2dy82aTNkY3h6cE5XYjJmbEtGQUU5NjZv?=
 =?utf-8?Q?JzBSpsYWDKVSLTnG6msvnc8gL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7288f5-0a27-4138-dcb3-08dd7943dbc1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 21:57:31.5539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IDowMESnOUyg6mQ55QLVFI+8ZKlnkac/smaK5iZl3dSqrlhP3S1GsHEXk2Ad6OOqKLTPu6cxKLHydmDvm87M9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7364
X-OriginatorOrg: intel.com

On 4/11/2025 11:23 AM, Chang S. Bae wrote:

> I've attached the patch revision.
> 

LGTM,

Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>

