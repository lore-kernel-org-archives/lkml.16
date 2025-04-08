Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BDB2063C2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 20:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744143712; cv=fail; b=bw0lFzlojKsiuTLDFala0v9+9XcqeUpB+V8CV+ovMo1zn0BfA1af85EHZyRIHDP7MV+SUYMkwf2xkSIqArlkbpILndhWZ9atWQh92oPpD1vSfJ24IFIsgEj3Yw+8t+Glb1gZjsW+OK2GZNhXuCGpulK7qObxeoKo2mC2ScqNIvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744143712; c=relaxed/simple;
	bh=pp4o+Gs1wwEABHBwHxIfs4SBYNCdJllq0sMgXKH29Os=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Om92blVLUZQa+NO0x64785lsMo9XXHw6+NXSqXrMO8Iqlp/6Lzdt1Qt86rH0EN5kvmmmJZ3rmN4GXnx6mkvzMU6ACwXu+lDq/HiblHSLMCIC5MMafxtR8yQ5FbowmHqnJ224XiolhLUJz70dEQbUhF/BBpTM7GtLWGXIQEYlaY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eohxYGeO; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eohxYGeO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744143711; x=1775679711;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=pp4o+Gs1wwEABHBwHxIfs4SBYNCdJllq0sMgXKH29Os=;
  b=eohxYGeOCzR/BTsl3NiWU9WoOMcrDKxb0+xqEdqFI7T1I88HfRWqSH34
   RWZZcOx2RUAmZwlvbmJKdUXEg1hGguflAoEjt959qIV7QMfJLji6K+sMz
   GIOLUyC2Rmc/bIj6Feptkw/QziHUmSbBlVh5VPVXSbEktrsTBu0hYE4/m
   jQudGUk5twN46fMVXGEYEGOY0PLBa9GMrRHQYgp/3N+ZD0FfWNVGMlPRz
   FeA8ExDkiL+2abO2L2lDSo5ZIesyPriyoON+g6/FZat+PJu+O5JilbobF
   Bz4esOsY1mUQuMNlzxCMv0YqN8R7ZrTh4FECFpx/O9R9+9rP/bopnix//
   g==;
X-CSE-ConnectionGUID: +6kklcGySQC4CYXCz4w23g==
X-CSE-MsgGUID: /vrn185RSWy3nIyoJ/pygg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45609246"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="45609246"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 13:21:50 -0700
X-CSE-ConnectionGUID: vbw0O2RESa2sw6TZga3m8A==
X-CSE-MsgGUID: zh3EnmfARj6rZw85aDHZqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="128909899"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 13:21:50 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 8 Apr 2025 13:21:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 8 Apr 2025 13:21:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 13:21:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/TkcGyHXv+qjZrH3VSA/S5M43tOaG+LAiHHTKaiGk3DIyJqdi1FlIklz6ujkIR0dZOzZqE7zG05sxUQeEwdHWsebTgyjL5fpXRMAwBDPTpSAuSoUoxdo/pwZNYivNTGquGuW9KsjpGxxIqDGiFADCVXQCwzpzWtwagPpBBo5ERnu3AckMs3UYJuny0OsX8Cmw+rKaQ7Tf5i2uDFGLHRQK3YKa8IfTRu5Og0A/USn5LbPVgyxzyKC1Qi6+oIe4XNhR9+K+hd4WG56civK1J4MUlL1ui8bGMbeMAecGNXquXw9srG0mZVHQIvhk925ezKDkSDzkff2xWWdvoah8B76A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HxwylEVoZ2y0jQ5exhxhUZhYPqH8fMZUVQcADZo/ONg=;
 b=eqsalNWqmCdxFgQj4Fz6+JB5ueMV715FKUGFErG8jGhXOzz/KvP5cYvlOYjbmiUomBTgXrb8861O75boSuP+RJpmeT91yySC3PntYGjl4LrcsEhiXhszPa5mf4zw0zR+9J5tMEOPPLx9D3kIptClQpHfPs9VLOWiglMnzKIoBa7WfiQ69zWsxxE6epl/tYPQfiBd2O5nlydlBmviVelr1uY0M4kC/FZ7EsMm0jyuYf4gIDz/J/LJCahDnCvTWWf28o5Kufn3vuzqhGCQDloRZ8MaAT02OSFkcumEv7yjSdzRIfeiTHiUkberhDzCY4j5GEk9CPUKbnELaKdvfOGEig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH8PR11MB8105.namprd11.prod.outlook.com (2603:10b6:510:254::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 20:21:46 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%3]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 20:21:46 +0000
Date: Tue, 8 Apr 2025 13:21:43 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Cedric Xing <cedric.xing@intel.com>, Dan Williams
	<dan.j.williams@intel.com>, "Kirill A. Shutemov"
	<kirill.shutemov@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>, <linux-coco@lists.linux.dev>, "Dionna
 Amalie Glaze" <dionnaglaze@google.com>, Guorui Yu
	<guorui.yu@linux.alibaba.com>, James Bottomley
	<James.Bottomley@hansenpartnership.com>, Dan Middleton
	<dan.middleton@linux.intel.com>, Mikko Ylinen <mikko.ylinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v3 0/5] tsm-mr: Unified Measurement Register ABI for TVMs
Message-ID: <67f585577f3b4_7205294dc@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250407-tdx-rtmr-v3-0-54f17bc65228@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407-tdx-rtmr-v3-0-54f17bc65228@intel.com>
X-ClientProxiedBy: MW4PR03CA0291.namprd03.prod.outlook.com
 (2603:10b6:303:b5::26) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH8PR11MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: 421bc0ae-f38a-4346-ea88-08dd76dafc72
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p7rezo2trGILburuUriQ/w9eDRceWAcDUrgQbGLhMzh5L0stPlbzkVNOSeYn?=
 =?us-ascii?Q?ow9KLncUAqEh/R9HA+bnlZfFhvfLwu6lchwxRSGiuzps10EOELWH1K/5iK5K?=
 =?us-ascii?Q?17Q6LibBwb0f4wPf55zHyaK2ELiccWyJyZgi49Ov2OlPX5wDcBfOaQMw0Vhk?=
 =?us-ascii?Q?YSk5c/YWQhOVstHtzpW+qgV/vtLHZYQY+sc8ckhFo4UiMnR/UFvu1YGT4kI4?=
 =?us-ascii?Q?iXsTm5JAMmqB3/NP1DUI8wBosX3QueHwWMy0oFWz9e3GqwcJY43+toVWnesX?=
 =?us-ascii?Q?78PeBE9gM26HPR3acJG9rWeeaRrJeVtmpWFQ4AIrnoytL0aFk8bIxrR5+sX7?=
 =?us-ascii?Q?oLNZSeasSN2M8AjaEcGnvaioInGp/6OENCZ4S4fPjLc4V44Jwbqyl/vcUSnx?=
 =?us-ascii?Q?D30BPW6I3c/xomHcWP77u5UOl+de9KbF4PS56CmT1n/a4xXCizheUwjSG8wm?=
 =?us-ascii?Q?Xw/E9mxM+Mf9457tsG1/kMOldUMrEAbIeBzV0N9QKIKE1L//JrlnRlQDK25/?=
 =?us-ascii?Q?2SH/4KCtqIQqi0jCbyIT3GmuMXWykB7bMTWZJpAGweDfOn6ctbDXJbL7HBfL?=
 =?us-ascii?Q?a90AKmcofuEIDzzR9cYvU0/xS/A9W6P9na4g2Hqc91qyac7kKpMzf2LCMRsy?=
 =?us-ascii?Q?kBHTxJz3xBK8VDyn8lHtTPyEUC9k+ZdMI3pZvZrCunmQc+JkTBDPdzGkFBDh?=
 =?us-ascii?Q?nty6cQcc27enGLjrTYv8Lrez61PKSap5SXvgn2JrPzyX25ACw8Mm4WNaGoKj?=
 =?us-ascii?Q?tyhfhkZ76Ptg/aL0CS9wEqwQ6vWK6PtJCz00CxbP6o3bVACTFZLlXZmzTa3E?=
 =?us-ascii?Q?8oRaQ4GVvBwtYUvaHP6R6RVOWiYD6EbQmhb3rBlAis/PCC5z6oytwiGjsbv0?=
 =?us-ascii?Q?pMIAs5at/nnLZF521HAKml9aSOQYTxmCVTFAHv/CC+Mb7NDe8MA4yCiyB4vX?=
 =?us-ascii?Q?si6KZCoTDJ9ZZqvwBIzAC4vy/3GPy2caQx8tZVfDq8V0WB+cUMXEnzQq6sc4?=
 =?us-ascii?Q?UWnswcIffAZHfE8m54QHiX2qyvx/f8B1PUJVcGLGj+lODQ5GFlks3Z9qbtFB?=
 =?us-ascii?Q?cSXTSVbpAKZO3/ZazUYEzKb5FwrQ3nuSJ7lO7tHnVGbMLnYG6JN2msm2Df+h?=
 =?us-ascii?Q?rEN5aZ1cOEbhdCAb3/ggRNHnu+wSY0NpIiPGxtG45otglbBfnfcvvVrTub4b?=
 =?us-ascii?Q?D10wh5uHcF1kjSg1/fN6k67N0UhY8e5aUDFNk3g32PefPMPbMQsw8Dez+8z/?=
 =?us-ascii?Q?oc8dgJwOXbdpzVH9fH7rFoKSLgv2zPXgRoDPOGOAPfuIryzVt6kn4LyGHHBG?=
 =?us-ascii?Q?j/SSZ7y5cNmipLOO59paCTaK3MehfoQO0Q7hRdGT8pDyHpK2FhpienpxBD1U?=
 =?us-ascii?Q?nqrhzffcqNP634Xu0GAM/yaWPIJy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+HRxC67f6MmjC2mSvtz4HVhoXaUslkYsM2nVKpEHM+AK2OjSpp4V1AfN8Xfn?=
 =?us-ascii?Q?b5ECAHsMEn75VHPxY0rftB/hbtOShsFMU2/LzV1LMrE3ytUKThUKaXK9Sbu2?=
 =?us-ascii?Q?ZOB35jUE/oI/+YbkS4cajPTOwqXD7nF7UN/scmPqkan5qMQOisV7lo4gXfkT?=
 =?us-ascii?Q?B0nCP2IVcJ333qioyMxY+QbFYPpwtIAMa0aoiEMiuE3fEAovam/OpX4t9Twz?=
 =?us-ascii?Q?2tEVM9xuxxNnhLR3+To7O14YctExCNaaq/lCsfoS49vPeZaZw4CoUOsfyRSw?=
 =?us-ascii?Q?cH2dkkERTroA8lBqjNh63Nq28BE9fCWRE2i+7yZ2XU0Rf6Kr3SEAJlR0lYTY?=
 =?us-ascii?Q?kCCNtEZMbDcsOAtjLyFXRJFyZPeUUFlBO0Ax2h7IsNQfN2sYGoeGTnXpvvUP?=
 =?us-ascii?Q?/UsCBZmEGpKc9rEMYrW4hjQRlbeszXWctcP9M54L/5zCyriK4RWq7Ru10Or4?=
 =?us-ascii?Q?phHVqhdDTPPzkvJ0vHop/C+I7Us5dgffeJ48AaSBum9ylXSJ9J/CE9HVDvPN?=
 =?us-ascii?Q?wPlWP8PTSURBj/NiIJYWcWK4PL4voGomBOsiEAT0gXb58t/sT4ujyN5f1u7/?=
 =?us-ascii?Q?31RcpC3vaOA16anQF+4ym0tJmbbtnJWddZO+lD7RaeIBxEDosd/LnbyShXDw?=
 =?us-ascii?Q?8f7dkBbZ2oPrqwFMpWx+kVA+XYa68xxE2fECo9qSZepkUuGtNcH9A8uO5g1O?=
 =?us-ascii?Q?OP+O0ay/2UbFWD+aNAQSn63X1lv/hEE1ozWOPmaxhGZKPmrpg4lqBx+jkqJM?=
 =?us-ascii?Q?vGg3dYc6eSt+JZm57heMwmo7b9/7B6PEUP9M0FoL3cHIXmQbuoEfrPEfU5vY?=
 =?us-ascii?Q?KeWEoSLhtFIsuNgC7Z/yXSujdTScZCqUexTv+svU7rGcn683h0lzZxaXdC6X?=
 =?us-ascii?Q?BHtgQ9i0FZp0erQJEz5aUvjBGy4rZ09q+p6+ldApOv5jXCzE6D20DrXBKAzZ?=
 =?us-ascii?Q?h5Gu7zgz8y9dphKPBOnnSPk4ZQZI12UP70bCEfJgIFK+Hxn3J/v42CGnVxy7?=
 =?us-ascii?Q?sLUUiXzmZg9DF37TVjNwLX2lcTykCGURp1l7DX/l67RMXHHl17b9qOZEXEOf?=
 =?us-ascii?Q?OS/t2JUdef3XBo4dNOaxGaxnwVbZ4R/Ggn7jvWgPfUdXPmj5rJ/W2TKpQFwo?=
 =?us-ascii?Q?40MwQfnkSGC32ObLmWR2v5eWa/zS6gmIcpJzRA52WhpPcHp6LJnXt/SBxbAb?=
 =?us-ascii?Q?oiKIdrhUfsnWquV5mM+7lyNc5LYaOsBiAHhBg4lk2AVq8OX+vXkIycXEm0vp?=
 =?us-ascii?Q?gfcPYfms4n8GeNUkALHrc6WXtADL6sMe9C1umX8Z6d3RNKkc8S6oeziwJIQu?=
 =?us-ascii?Q?ZYdq699LB/NF2iekQbVFPm5KaMiemHtRqEpx5zXWVBrSBKH2XMn8eLrkJe/o?=
 =?us-ascii?Q?vOToOVsIrF1ql1TA/BHneSAOGk268fN46Hfr3gz/Fle751T9eZTXnvx7nP/g?=
 =?us-ascii?Q?AH0ffjFNMZ9GFfJpBsp+rLM3/7vbk/hwCJ39XjvxfODDNwsoHQOltWnqFlXe?=
 =?us-ascii?Q?gadTtDfQYJgsNPvkvBo9BUOQM26w569TEPF1f2ZDGZb04AN6d7Tkpf4t2zH6?=
 =?us-ascii?Q?j37qY1FcBi5AaQps5I8hIHRb07EXLq3KrFDZJW7mtCqBmbo/dTXWN8RAkUY4?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 421bc0ae-f38a-4346-ea88-08dd76dafc72
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 20:21:46.8335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L1KsL+/3bo9tgPYvWD+OsdE3xPH35WXeaG/AcTPsdRuP1dq6MvEHYYUwdTLe31hcbgxIz+51OLlL/JN7zx6aU+Z3afq9HGvGt6wuK8V6Dwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8105
X-OriginatorOrg: intel.com

Cedric Xing wrote:
> NOTE: This patch series introduces the Measurement Register (MR) ABI, and
> is a continuation of the RFC series on the same topic [1].
> 
> Introduce the CONFIG_TSM_MEASUREMENTS helper library (tsm-mr) as a
> cross-vendor transport schema to allow TVM (TEE VM) guest drives to export

s/drives/drivers like tdx-guest/

> CC (Confidential Compute) architecture-specific MRs (Measurement Registers)
> as sysfs attributes/files. Enable applications to read, write/extend MRs
> like regular files, supporting various usages such as configuration
> verification (e.g., verify a TVM's configuration against digests stored in
> static/immutable MRs like MRCONFIGID on TDX or HOSTDATA on SEV) and runtime
> measurements (e.g., extend the measurement of a container image to an RTMR
> before running it).

What I do not see in this cover letter or patch1 is a brief summary of
the major assumptions contributing to the design for folks that have not
been closely following the threads. To me those are:

- Measurement registers are an architecture specific building block to
  enable attestation of system state. That can either be a vTPM
  application, or raw application direct use/extension of measurement
  values.

- By the nature of needing to expose architecture specific values the
  names and numbers of these measurements registers are not amenable to
  a shared transport mechanism like configs-tsm-reports, but the common
  operations are amenable to a shared library driven by a provided 'struct
  tsm_measurements' template.

> Patches included in this series:
> 
> - Patch 1 adds the tsm-mr library to help TVM guest drivers exposing MRs as
>   sysfs attributes.
> - Patch 2 provides a sample module demonstrating the usage of the new
>   tsm-mr library.
> - The remaining patches update the TDX guest driver to expose TDX MRs with
>   the help of the tsm-mr library.
> 
> [1]: https://lore.kernel.org/linux-coco/20241210-tsm-rtmr-v3-0-5997d4dbda73@intel.com/
> 
> Signed-off-by: Cedric Xing <cedric.xing@intel.com>
> ---
> Changes in v3:
> - tsm-mr: Separate measurement support (tsm-mr) from the original tsm
>   source code. Modules depending on tsm-mr should `select TSM_MEASUREMENTS`
>   in Kconfig.

It helps to note who gave the feedback leading to changes. Besides the
small courtesy of credit it also helps to speed conflict resolution
(blame) when the parties are aware of each other. So for v4 please note
changes like this:

---
Changes in v3:
- tsm-mr: Separate measurement support (tsm-mr) from the original tsm
  source code. Modules depending on tsm-mr should `select TSM_MEASUREMENTS`
  in Kconfig. (Dan)
[..]
---

Lastly it helps to declare what you expect to happen with these patches.
At a minimum these need an x86 ack. For upstream merge these can either
go through the tip tree, or I can take them through devsec.git with
other "TSM" work. Absent someone hollering, devsec.git is my
expectation.
