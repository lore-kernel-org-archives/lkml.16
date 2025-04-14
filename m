Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73F319F130
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744645302; cv=fail; b=lQBJlahyahrAbMKSauk3E38i8k1tJr0E1PsYj64JcZuvwFFpH20k8yw2G5eoB1M9mQWBJ7Fn3GpY2WVLlOCN21GqqACfQR8yFJvwiHP3XX6oriiTaxkbNiZ6Rw/PbEdSpgwrCpc0/xQ3794aRCWV82Pifxrz0aca7b+7eO16p4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744645302; c=relaxed/simple;
	bh=lKTYxQP6rYCBrOw1+2r9xf5LknaiJb1YYmopI5Igl6U=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jiOul2BowyLrO+O7vVLkaF48ZFDC4d10H0Qf7Nh1XuZt4iuSaLoSUDlFCj4nywZGWGWKguHWj9Q+Nq90KZRnVNjtD5DiL3cYCvyh7wUMV7RRh721wh0qpUR1O23KCIAxKsTeFw/do4WCzUbN7AgY23CuuqXDLUycx54kJL8WOVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IOC74na/; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IOC74na/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744645301; x=1776181301;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lKTYxQP6rYCBrOw1+2r9xf5LknaiJb1YYmopI5Igl6U=;
  b=IOC74na/J5MwsKJpBRksVX0AOASL/lS6XBjuECVirEJe3enhJ8v3dYgB
   yshNeGAhkJXU+X+6nQL7in2U0BsUnBNu6cX+ItbKhFNiMGUC2tpkLWFae
   Pxyx+8+NsDDx6+p3n/yFzpn8XLBzpfXuKTyHRcyfx9R9CykTI6WFjtFo3
   aj1dmMxFVEuUwk5DVoJ4wmWL06bswyBg3OCn7ivJQIEv13MnrgfjXoZUu
   2suwhFLJNwDUtRlfe0BmPdn4uw5MS2DQVi4kgnJ4M94fQnzQ2Opg3ivTh
   5c5fomKnsd9DodDyX4qp6rI0fhJ1YqkOFHtkEJ+r7smSM1Id0PabuWyk2
   w==;
X-CSE-ConnectionGUID: 8cyocYsqSDGH1gmsbdx1Hw==
X-CSE-MsgGUID: fJiSJlNCSnuJpUfFjPErEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="68612201"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="68612201"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 08:41:26 -0700
X-CSE-ConnectionGUID: 5yLnAyjVQT2YBGHU9mrcFQ==
X-CSE-MsgGUID: L7rvweSdSxGdAKM+8OUyZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="130727178"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 08:41:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 08:41:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 08:41:23 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 08:41:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5D2FA5ZQTf1LzIw0h1waKXwUjcrXw46dBw55+VhRiP+Vp7qjLmfmkA0Uec69IR4mb6lHPFtSSqgH/lFVs64wphj/sedWSMzd/AnXXYMvseLFrvSmVHq4EKPGyWb0bz+h55yBNnW+D6hktj2jyzeordv+cM1/ENZjLf1J7tnCnPtorJCzwnvCnx0G78D4h2x/f7/M5A1mvKojrjvYlx6Fyzyk6vxmhpMjEZnxNIXXKLTZSv1qP9YVrf/PhNqjBT/WXzmST0fmQEPJ0gVL4kL8XnZJ3NY0g/+i3aqIPmdYnoZrGm70lvBwZJ/9IPAVtbSS4BRAQGagWXlwjPoCORJZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qvkris7q+cRLgC/HjwxnzvOlFbgt1qPS9j29fM1gnp4=;
 b=EAUnxddHTqb0wMURqjx8uA0J71IkjcrtLy4EG45XUo2Ep1194+lAo/kUt4YGdElJ07TCqCtmOYt54BVfPy3GweF5A95Up7SUradrxB2VTO+EBXrA8/nBamy34lxI+SJcvrspXOILsvssyRXvHkGhJKmztHrEB3HCNwTWoepILUrDHbEy5q8CLLBS9QFX9/95TCya/n3JHr0EV85LHyQjHd77UG/lSfCMyB3LjFWUspdKg6O10mMvlS4kjpp0UZZ47uEwlu96j3qp20HetwJ1Zdb2g6t7gk+OSV+3w4DvQutqu8+DNoicjYT5nMFEkFaJzUDyoYEAfLcj/WOepdkqfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by PH0PR11MB5126.namprd11.prod.outlook.com (2603:10b6:510:3a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 15:41:20 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%7]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 15:41:20 +0000
Message-ID: <bec4acd1-8a97-43e2-9119-f0874d2f3ccf@intel.com>
Date: Mon, 14 Apr 2025 08:41:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 8/9] x86/fpu/apx: Enable APX state support
To: "Chang S. Bae" <chang.seok.bae@intel.com>, <linux-kernel@vger.kernel.org>
CC: <x86@kernel.org>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
References: <20250227184502.10288-1-chang.seok.bae@intel.com>
 <20250320234301.8342-1-chang.seok.bae@intel.com>
 <20250320234301.8342-9-chang.seok.bae@intel.com>
Content-Language: en-US
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20250320234301.8342-9-chang.seok.bae@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::6) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|PH0PR11MB5126:EE_
X-MS-Office365-Filtering-Correlation-Id: 03758627-6b65-4b0c-1d8b-08dd7b6acd19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmZrYWJoVlREOWJ2bmNoR0FoTmlVZjhTeGE5TGlVNUUvR2ZaUnhBL2tRWnVT?=
 =?utf-8?B?MDJBenRzTEl1VENkZEZURmJyVzB4RTVzVGNlcFhJSENJZ3VwNGgvTyttRkVV?=
 =?utf-8?B?aUUycldXMXlNNGZhTVhJT2xsQlFzSFd2Y3Z4YnRBWm1KWjJvYVpyaE82eGN5?=
 =?utf-8?B?dE5qVWVOU3ZGWXQ3cS8ra2tPT2JHTkxGdzBDVU1LelNSajhrQThEa2V6ME1y?=
 =?utf-8?B?N1NRVXV3ZGVwYWY5M1czQkgzb0NtSXdad0xQWG1aRndwL1pIVHdyaWlXcjJi?=
 =?utf-8?B?ODMyVFhnd3FhelBueWw0QTNUd0xSKzlMbVFFa2p2czl2OVJaNWNWU1NMK211?=
 =?utf-8?B?SkEvT2FqenY1dmZDZzV3djh2Ui9wZFFXNHNLTzhBUzQva0owenlhc1BKa3VO?=
 =?utf-8?B?cGZpbFR2ZmxrN1VnNitwN3JiNGd2ZVBWaHlqeThWNGNKSVpRVVFYYWFxSVV6?=
 =?utf-8?B?blJobUxiSVgwZG9GSFpBMFVIVzhDUVY2eGlyYVROL1c3dytFQUNZS0UxcFgz?=
 =?utf-8?B?QzRZeHdjdVR5K1VuOTFreStjaGtaVjY5Q28xNjRrbmIwR2gzRHBjdC9TQm9p?=
 =?utf-8?B?K1JVa1JzakRVS3NTQnJ1L2E0VTJsaVB3elY3ZGJLaWZQZDZ4QVU1eVFjaGFJ?=
 =?utf-8?B?VGZHbkIxeFV0blZGYjZ1MldGL2lRRktzak9hVUt0bktFMDVob28waUlJSjdR?=
 =?utf-8?B?bzlyVFRkakdJL0NaeXRKV2crTWhjRTdIMnhiMytTdU9odUxoU2FpbzRIK3dh?=
 =?utf-8?B?K3NaK2dqdVF0Ynk3V0pwZWdUZmdSdmIxWjhkZnE5d09acXRnd0hEdnZ3RmZL?=
 =?utf-8?B?cUNmbmJCZkRyRUJxVG5ORVl0N3ZsR2tMeE5IclBmVmpSUTdQcFJyZDZqdFBs?=
 =?utf-8?B?LzZ4WTFsZ0RSTEdIY2VyNVhJcXc4RVYwMVlXS0NvUGQrQlJXM0Voby9UZlht?=
 =?utf-8?B?OWN5TTEwNUxqK0pDL25JOVY4cUFaamVFN0VWZ241TkhrYWhLMFFyN1BTM2hQ?=
 =?utf-8?B?RmQzRlFrNkVidGQ5bmluMGRtUjlmM2NWSmUwazFsU3pWN0NOWkJrTnhIN3hk?=
 =?utf-8?B?Y3lQVWc3Mkg1WXJVcnBUZHlqbWNTVHNqbENVNjc1L0FGNlRONzZzME9JZVAx?=
 =?utf-8?B?b0NaV3A4RmUyM3lHcGk0RTVMOWFTS3FoOXJacm9UWUFSbU5OeldGaWExMmZE?=
 =?utf-8?B?NldKbEp6cyttNlBZenl0a3BRODJGT2hGSUkzclhvVDZGOXUwQnJJWEdoTnJ2?=
 =?utf-8?B?amZtQmFXelpKMXhZNDYrNjRHK0VIcEFJV3l6bXVJMDIrSUEwdURDSmZrR2tZ?=
 =?utf-8?B?Z3E3RGxWK0grMTg0eHdWSFU2QkdRWnZVY05TczVHd3JBOUZPT2w4Q25YZ0hW?=
 =?utf-8?B?T1FqdGFaZUttZGcxMzZnbVErVG5PQ0R0NGlqYTNlUmJ5OGdoYnVUa0dXTWoy?=
 =?utf-8?B?M3FFd0w4VHBieXR1NEdIRmpzdGI4YVErWUpiLzZSK1ZtMDYySnZVeDk5c3V6?=
 =?utf-8?B?dWxWMnlJM3l5OGp0aUt5alN6RTZVK3lNNkpNdi9LRDFmbzkxQ1lwdUdEa3Rk?=
 =?utf-8?B?Nk84ZDNhaDNYbWk4V0NCZ1RjQ0xseTExcUh6ak9Wa1pRbEl0UEZWU21HVTZw?=
 =?utf-8?B?MHVGWERNZTF2dnR1Z1BpQmZrRGNFSnN6SW9MRFZtcEM0YjAvZ1F3N2dtL0pD?=
 =?utf-8?B?T00xSW42WnN1NHVNVFdOVWZ1MWdic0ZrN1ArS0ZIT3FGYUNISFhaUXlNekxW?=
 =?utf-8?B?YlVsUVZqVVdSaHJ4YmZuaXBYWHFUbE8zRUp5UUNLa2E4SEV0cnVpaHFndENB?=
 =?utf-8?B?d2lqMlFCTm4ycjcrMmIzSVUzaWp5elRVZGx6N2VEam01MVA1Ukh0UWVZbUdq?=
 =?utf-8?B?dzFYZnhmaW4vazVGaXVIcE1nZjA2Q01YaHZmQndKUFZNdVN0VWZIRHFOcW9N?=
 =?utf-8?Q?FHhOdmgoGIo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEJMN05MMUZHWWUrNGU0eTNvbjhZK21WbzVscW5ZMThXSlFaRjVuanVKa3lN?=
 =?utf-8?B?a2xKM2dlNURmTmU4Y04rTWdZWW5Delp2a0wrUlcrQXZQNzhBT3U3RTN5Lys0?=
 =?utf-8?B?eVBQcW9tTVlZRjlzMHEwdGZPWnBOdCsyNGRKNXpmUGVhVG9pREFQeGhrSGNy?=
 =?utf-8?B?MWdvOFRPTGFDTVFFYnMvem5VaDF4WDcyTDZEWHFRL3JpcENtRzdOeFFNcmxn?=
 =?utf-8?B?b2NoUVF0NGtkUVdNakR6QXBMaGRlcEVkalRKbU5ObWRoQ3hLa3ZyaEh3L1d1?=
 =?utf-8?B?M3dScGErUzZjTmlZTDFWbjNSejhVOW9JOWw3Q0RCYVJBMzdIVkhQajFld3pp?=
 =?utf-8?B?YjQ0TnBtTmE2OHFRNUM4MzQxTCtkT0JQUUN6RnR1V2JpZHpKc2h0anhRajRv?=
 =?utf-8?B?WWpqVHMrQWFHQy9OaitVeFlyV2xuNk1qWXlHdXVuTWk3cjNoZFZ6V25ITFAy?=
 =?utf-8?B?V3JiU1hQSXUwTnZvbmlJNkFNYXdxY3o5YmhZeHQ0YWRkU1FlK3YrZElscTRm?=
 =?utf-8?B?SDcveUdWUEhrdSt0NWZwRWVOamlCY0M3VDNUVXgvZkRUclBROVB4dnpiTnJ3?=
 =?utf-8?B?Um9zYkxxYzlybWdLNkgraG83cmpPQ3h5eGpFMXdMbmhWNEhtN2pjRXVHQi9I?=
 =?utf-8?B?Ykhod1VRdFZ6TzQrN0t3S3VxV0YxZ25KaGFpd3hwNm9jbzhwT1o5TjQyeHF3?=
 =?utf-8?B?UDg3OERydmJJb0l2cWYwdXB0NXNFYzhGWUFLa0RTOWZCVXk1aDRiVkttSlRO?=
 =?utf-8?B?NzZtOVA2MHlMdFJmanBLNFVsRDN3VXNFT3FST25OeVZma3paUkYrQ1FRdnlw?=
 =?utf-8?B?Z3BNUGRXWVNyR3RjazRuYVNoVmdMWFJtZ21YVkZNNTNmc01HM0tPMVRoSmp4?=
 =?utf-8?B?N3VjM1FGQ25GSE5qMm42cVFyN1ZGYXVERG9waFVYQnkrZEdoTXRqdGlaYmVa?=
 =?utf-8?B?YXRsQytsMHAyajN4d050NGZoeWFiYnJzSUo3UjFxelFiaWtJRVc1Q25hcWZy?=
 =?utf-8?B?U09LSDhvZ1JweENYZGVuQnVheTlkclRHYWwzM1lOK2hpdldQNVU0aXBvVHVh?=
 =?utf-8?B?Ynh4RURYNHlrU29hM29Mb0tMdnVwb0RJZDNFZDhqMW5TR3RkdlJmSlRPbFNK?=
 =?utf-8?B?akZLUXBVNHlFN1R4VVVTd05tYXh0dE9JVUFjdS95V2Y0SGNLQ29HbGl2L1A3?=
 =?utf-8?B?NmJBTUl6QXF4anhuSkFDekNHbkx5MCtDNHUwVEx1Y2xnNXBnU2FXSXpmQXU3?=
 =?utf-8?B?RGpmeXpMZThEaVhKTURoNjY3M0dlTnJRMmR6Um9LQm4zUHArblBwV2luWFpO?=
 =?utf-8?B?Z3RGc1E1ZThKcnJkNnQyKzRKODVpWkJvWEQwZlpSeHM2dlFmMGpJN2VYN3VX?=
 =?utf-8?B?RkJ5ZFhMcDlYOTFrRG51UWZZT2ljUzZCTVdzaXVOZXBRZWVaMy9HOGF6Mk9X?=
 =?utf-8?B?OGkwano3NmVLVndqa1U5SE44OTVlb3RNcmVrUUJ1M0VWSVBoTnNuMS83TWV0?=
 =?utf-8?B?RnFIeFI4dTN0YnRXeWF0d09DV2JvU2szQWVFaDI2K0xjVXlqeXdwOWErVlF0?=
 =?utf-8?B?NGhtSk05TU5RcDR4TkdHbE1oUmZSYUNhZElYNHF2SmUrdXRZMk9WMzJhQjhJ?=
 =?utf-8?B?VjROaWZEaFB0V1VDMzZBMS93NmUybWExS1ladlp0a0R5Z0JNV082c25nR29Z?=
 =?utf-8?B?ckZQNGp4NmQzNWwzdnlKY3g0QkpPZUFtd2c5d2h1eWNCY0xjL1lxTFFDQlp0?=
 =?utf-8?B?SGxGbDV2ZTVhQ0kzQUhFSHdCOEhDbDExc2tsaU9BNkEzUXppQzVCU0U0eTNs?=
 =?utf-8?B?RUYwUkhIaVdVNDhLa1p4SDhGYVFqb3VzVHBMNThmVUtCT2Rva3d2M0ZUZGds?=
 =?utf-8?B?UEtWTTFCa3VqbjNXbWZYVUdvODFWZEpraEhtMGhMNkZZQ0Qrei8yYm5KYm43?=
 =?utf-8?B?YzBJdkhGQVRaajZWQnhzL0JIb0NJQXJyU1MzWE1GL2NSK2NvWkwzN0dNeFhp?=
 =?utf-8?B?ckRsaE1UZWdoZThTQ0d0eng3RjRoaG1xb09VSDJxaGdRSitlYldxenlqNno4?=
 =?utf-8?B?WU03NDFwMHl2cDl0bzV0YWNiYmV2SXhZRmd3MUdvc09IYVRXMmlLeGdvUGVi?=
 =?utf-8?Q?Ge3zQSGOCSmnP3MT/pD0UnHuq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03758627-6b65-4b0c-1d8b-08dd7b6acd19
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 15:41:20.6709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YtvlSQJkmnwRE0uWV70EwUtoHeZWIGzbjJdr4/1A0zkqQdgQtA7ytE1tvhZyN4fN9Vv35p/YBNMzPqAgaXh0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5126
X-OriginatorOrg: intel.com

On 3/20/2025 4:42 PM, Chang S. Bae wrote:
> With securing APX against conflicting MPX, it is now ready to be enabled.
> Include APX in the enabled xfeature set.
> 
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> ---
>  arch/x86/include/asm/fpu/xstate.h | 3 ++-
>  arch/x86/kernel/fpu/xstate.c      | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>

> diff --git a/arch/x86/include/asm/fpu/xstate.h b/arch/x86/include/asm/fpu/xstate.h
> index 7f39fe7980c5..b308a76afbb7 100644
> --- a/arch/x86/include/asm/fpu/xstate.h
> +++ b/arch/x86/include/asm/fpu/xstate.h
> @@ -32,7 +32,8 @@
>  				      XFEATURE_MASK_PKRU | \
>  				      XFEATURE_MASK_BNDREGS | \
>  				      XFEATURE_MASK_BNDCSR | \
> -				      XFEATURE_MASK_XTILE)
> +				      XFEATURE_MASK_XTILE | \
> +				      XFEATURE_MASK_APX)
>  
>  /*
>   * Features which are restored when returning to user space.
> diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
> index 0d68d5c4bc48..a5e3954dc834 100644
> --- a/arch/x86/kernel/fpu/xstate.c
> +++ b/arch/x86/kernel/fpu/xstate.c
> @@ -371,7 +371,8 @@ static __init void os_xrstor_booting(struct xregs_state *xstate)
>  	 XFEATURE_MASK_BNDCSR |			\
>  	 XFEATURE_MASK_PASID |			\
>  	 XFEATURE_MASK_CET_USER |		\
> -	 XFEATURE_MASK_XTILE)
> +	 XFEATURE_MASK_XTILE |			\
> +	 XFEATURE_MASK_APX)
>  
>  /*
>   * setup the xstate image representing the init state

