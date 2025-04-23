Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092CE1F585B;
	Wed, 23 Apr 2025 12:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411640; cv=fail; b=NwTxU/1XFyOvBS+Php5Bid33SlTJem6ZnpRzcsy0YaBM6AKq+086Jv1dHn/flIUo+5JMsCTsZQsKuVAM93q8Nbf9Tj3TqHrPtIDotuD1qk84ZZENZCP6hkvrKWR9sDd78r+hl3HjgoSdVJPrwwvpqDjy8izvXRG2Tp9IW8snCbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411640; c=relaxed/simple;
	bh=K49v6UsqbpNF+Bi4lSKQpcFFVD2bUyF6RbGqFyENOn4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=q2CZ2yZmAAD1kUWhJ07C3FCJ0W8nzbo+c0ejkQsmpqy+TQ+PBoVYwp5Fx8RU0Noanmm2Vt4AB39PumXtb65E0qtWNSP500+HJNf3xW0RX9tHMJyPgG4zFK8b9WSApWTNy54Rgusce2A/NMh2fy/9LRCF+N8PvMzfYEOLxXDyabo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QvjPc4J/; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QvjPc4J/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745411639; x=1776947639;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=K49v6UsqbpNF+Bi4lSKQpcFFVD2bUyF6RbGqFyENOn4=;
  b=QvjPc4J/NlebOWhhJFHF/uhVW+b9bWcMvgNgIYAp/ULklzLa+5ybwBil
   Q+lj12DS6fiQ75jyoPNJPBJSRoEaSGIDGxQ2E4/2ZFzMF4bO494WnqdNF
   we3+c/LpjiiBIAczTj2S1Nkaeaqnlw3bYkRvh8XniTyhRIm+6aGuV2ReS
   p1gjeJHHlXPUmebdbHeXmLnF0NzLI56T2JQ8QGlAyrMmj1peMh0a0sbzJ
   eY+LnditfGE9pm7IZ2x7o/4tQ5ELrIXWHVKpsYKdlh+/03Dgrq8SJ6/3t
   6CJ++STj6cgWQN5YlKLO54LPnq4mhktmN4twNOkoB30BFhPFG3sblA/Dj
   Q==;
X-CSE-ConnectionGUID: TUtIxg4tQKCVJrjLC2fmmA==
X-CSE-MsgGUID: vm4XnpIVQSec5Vdd9tYxag==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57991677"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="57991677"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:33:58 -0700
X-CSE-ConnectionGUID: LslGLvXGQT2Ol9Ln5ZUaDw==
X-CSE-MsgGUID: twMRVNE0TYWk9Al+wDsb/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132223617"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:33:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 05:33:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 05:33:57 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 05:33:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALa570EDCWZ/38lhQHZJANKvv5kcZQQmPR5pcuogWsIekPwpQVPufzeziETXPyLLxbCVHj2qZiKmbkhaXCWQ17BA6p2/xHLMAyyFD0j5olJpvbIXJmkxnPDVu3oFaB0b/Ai+y23ns/tanAb24NHL6mPlsUg8zwmFUbg0wtRE6QH+P6q/2vlXl8Oc1olgrpB6/B41X5gaN3FfwM1EU66BtwwsqLauLNYI8tPEcoIhNA7UbDPhbshRzSDwGz7PF3AY7OWKQ5/gUZQvZQCLFj+/X21zUWhVEbOTnR8YmY1Jsy0xx3YmextbfjfZ7h4sjUCWx/11THSbu80XTzeTMuYIGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAPsZEiEBczrVvwg9eo+7GkOCk1HZ86zVrjp+/tL2rs=;
 b=eIU2pVWTNBsbD1DFh532KIiVBq1H45t5ee8ubbovLPAWYbV1NMcd2FMKJ0+N+5I9YCvVGBDcgypa0YQeJQkk9A1opyfcfXYIrFQniXz0uhO1ItrK/2a3r5zznkACyOPlv9WO8uVIpE4Zej/t0MYUPtrlJZ9z+au7L16h+kNYBf/fF7iDG04p7TtfuomiUQ+G/LZ35pAtmBfHjTyXUGbIoOD0/imULpPJElGip7RLd+UexguH9Skp4bw+h74FuKzeSPpgSFqIKtWMLzoKjldb++xKajyzZ9IZ2Zfi3lOaqaNW+L+K29IZMimn5j8xoQ181Oh2RvNqmW7Hu2xb4TmVGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 IA1PR11MB6073.namprd11.prod.outlook.com (2603:10b6:208:3d7::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.35; Wed, 23 Apr 2025 12:33:42 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%6]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 12:33:41 +0000
Message-ID: <403db8f0-afe9-4a3a-bd39-ee3ba782e7b4@intel.com>
Date: Wed, 23 Apr 2025 14:33:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] AsoC: Phase out hybrid PCI devres
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
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20250423082858.49780-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0036.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::9) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|IA1PR11MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: 95eb2bbc-9591-4055-8d1e-08dd8263148a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUNvblhVcVhhRWtCKzRWRGZZV0ZVTlhKOXBlZmtLTFY0TCt5SUFoMDBxNVhv?=
 =?utf-8?B?eTQ5VUFFSGlVRGlqOXpzdmlHcmY1S0x3MGxmRWN1R1YrQW1xUDMyaWNROVZZ?=
 =?utf-8?B?VWNxWnR1eDFhUFdkNmxLM1hSMVFGZFZCS1l1dzdURWVkWitkSDJLMldPSkFD?=
 =?utf-8?B?bndNRWlNQWxQRFpXYzVNR01CMGZWMldLYm9hSnhMSm5wQk8wNU8vVFFyRm0w?=
 =?utf-8?B?ckpUUXNvUXlITHpsQ3F6TjNnQmlzekFUdzFLWE01YUltVU42UThwU3BUVEhm?=
 =?utf-8?B?bnRLdVZGd1YyanY4T24vNEt6RUR6REFLN1N4dmlEdWc2MXdwWjMzRWgwMS9Z?=
 =?utf-8?B?M0hDNmo1ZXdPWENFQkFpQk14MERDbGI3M08xS2tjSW0vZk50bkUxb2NZYmdK?=
 =?utf-8?B?OGtzdHArUWltN0ZUNUhRczg0cytHaEhCS0NaOWNTNEMzSlM0bkpxOWZtUVoz?=
 =?utf-8?B?WnI4Y0NmQmRDczg4MFZUQU5nQmE2MmpQRmdvQnp0R0xmRGpqeks0Um9kdmF2?=
 =?utf-8?B?Z1VROTBaZVc4ZVJsVE9lenNVTUlOamp1OUZFekg2dkxHMXZOQTdGeHRKRTZw?=
 =?utf-8?B?RUswdk5JdVlxUnJSL0dIZk9Tc0l1OUp5VDMwcUR5dytIMnBnYy9IR1N0cWlS?=
 =?utf-8?B?ZUZ0aXBGWlhpTWQ5ak15ZEI0SFBnQzV4RFdJR1ZmaTNvU3dPRGVzV01vQ0I5?=
 =?utf-8?B?WWtnMTZsL0Exb2tXWWZLSEJtRCt5Vmp6YVNScGZOMmtnb0dVTm9KSE1MYzZU?=
 =?utf-8?B?emZGNHVLV0lVemhIUnRBWmVMS2lJejhsM2VDeTIrc0ZsNTM2cy9jZ3JGaXM2?=
 =?utf-8?B?R0VlbDQybk1mWlBEejZYMGpCNGh6RzRVMWVKMHEydlJ4c0RISDI5cUNaVUJ6?=
 =?utf-8?B?VzR3cTdmWlFWa2pLT29QV084aTBJQmR4dmF3cG1mUDVMRVRhUmJrTEY3dzJ5?=
 =?utf-8?B?eVZRaGxOYklzUkVIZUFyVDM1S0prWENDZVdNWlZMQlF0UlJCNnFNWjZYTTFT?=
 =?utf-8?B?WU9sNjMxb2lpOTAwZGdTQUhGMTcvRm9wSEw4N0FDUzdPYzVINGl4b0JCeUZp?=
 =?utf-8?B?VDFPcmJ5VkxiT1NmMmk5NzRsV2xlNzJCN3oxd3Y0RXVYc1hLSnVPV0J5TkRF?=
 =?utf-8?B?dDRvY3ExdTF0U2VPYm90RkRDMTJPL1ZBQkdxZGM4NkdMVGhwdTV4WGl4VTh0?=
 =?utf-8?B?UTB2VWJMK3p5ZDIvemNlUTJRMDZhUzhsbUc1ZW4vTHYvNVA0WENRK0ZFb3lk?=
 =?utf-8?B?UGI0OUR4TmNzS0NEN2F3QXhIVU5lMWtRSnhXaDhVYjRrVDBMWXk0bStabDM3?=
 =?utf-8?B?WWhKQU5tN3lRT3hQZ25TaGZrd2MxNWR4TjJQQzF2aGdTaE1NMjBka1RGOUVk?=
 =?utf-8?B?cEpSWko0RC9nUU5ENUhxc0ovakQrZEgzOUJkdyswSHR6YXVKSSs1c2pmSm9h?=
 =?utf-8?B?UWhGR0Z5c1FMallRa0pyS1ZSc1Y3akdJdGtJeHh2ODVwL0dKMGVXck44OU9R?=
 =?utf-8?B?azJhZGhkYjF0aEVJQkswUGlWYlhTY2gyN0MvZUdSenlsM3ppTWpZeGlaTzZs?=
 =?utf-8?B?Q0I2ZkQwWGE1QjlPcVlpakliVzQrK3ZoSmZEZDFubEZFYlVKMVBXb1Z4ZDRI?=
 =?utf-8?B?OFZ2Nm5jVWVPZk9rbXRIVkE3TjFTZHRVVHJHemQ1cnFDdXRKeU5zWHVPKy9a?=
 =?utf-8?B?dmI4cHQzMzhQTCtkYUNjOFdPQlVBSDhFVnhOMmpkRkxWdUIyNGFLcGJtczJi?=
 =?utf-8?B?TysyQzdLMDJBd0tEb1REcnNMcGxQNGplVGdEMmc3a2VPVCttMVdEMnd4Tlpr?=
 =?utf-8?B?a0ZkeXlXcWVtK2dCVWR0eE9pYThIbFZuUk00bko3Lzhralc4dks3aXhFTnpH?=
 =?utf-8?Q?PoOr3GKh0ITnv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anZ0UXV3TW4wNWJ6YkhOQ1hCNTFxRzgrQ0p4a08yN1I2c2pQOHZrZ2NPbG50?=
 =?utf-8?B?Y0RKS2ZUZC9vUC9FeWhyQVErNDFRRHIvTWhkS1hYdGRQcE1EUVMveVpZenFW?=
 =?utf-8?B?cnVIcXVnczBKWlJsYlN0RitDbHMyT3hpcjZLQUQvWC9LMkEzR0JXdVVwd3ZW?=
 =?utf-8?B?N1VFVXVLVGNoTjFkTDhFUmhod3V0a3VxY0NqSndHeFU2eXFQZGZTemZER1pY?=
 =?utf-8?B?c0VDUHpVYXM3M09YbWFCUTlJM1JGSkw5TkQ5QVBvSlE2bjFCUVp2MXJZZlJv?=
 =?utf-8?B?VkZHZElJbkNZWjhYdW9TWEVrc3dWekl0c1FvVzhBbzdYR1JZTDhEM2VEaTNO?=
 =?utf-8?B?V1o4VUd0eXJBS3NTOEw4L0UyQjhaTXZyeXVoSjFrU1k1M3lIaThOSVNoNnNC?=
 =?utf-8?B?M3VkeXdrYUozcTVSNmhWYm1Sb2JVN2RIcmNsMllOeUlJVGhTdW5KTnkwN0hn?=
 =?utf-8?B?bVEzK2ZWcUtzcWpSRTJSYVp1ckNTU2hWWGtXRi9lYXFDQ01pYUhLb3gvVVJT?=
 =?utf-8?B?RjN6UzR4a09VR2pPdFdvRGNaMjlCSzhnWEtNaDYrS3VwZ29SbWdvWEsvMnhV?=
 =?utf-8?B?bkpaSHJKdHUvRmJ1M1dEakZITlkrV1VCMDZSc2phZUhOTm5nMm83d2ovR1Bq?=
 =?utf-8?B?TFhDR21oOG9MQllkNjRVaUFDK3RCWU9mQU5RRDhLMjNVemQ4SEJtbUFWek11?=
 =?utf-8?B?V2FFYTlPdk1GdGJtOWVtVXZUZjdieGdrTVorWncxbWlYdU5wOW9SOWZjQmRK?=
 =?utf-8?B?cWExSC9sQjNjKy9LVGNTWU5aNElnQ2ljcjViSTBDWjl6MzVDY1pJSEtZd2hj?=
 =?utf-8?B?YUV6VzdHVGh1ckFrSmE3RmdFZk1tSEFLTXM0WmpaVDkwL0xsNW9pOHdSN2Zp?=
 =?utf-8?B?clRIckNQa0FVdkxPTkNHMm9pTFFVWFZBSGVMbXFKbDhtY2tyYmp1bVVXMllw?=
 =?utf-8?B?dlhSVnNtekQxSTIycTE2QzkxbU43U05LNWRBb1ErQVVZRHdoTCtqVlBZVFZU?=
 =?utf-8?B?aVZiaFNlUUVtM1NDcEtvWUhaa1pWL3FXSFVjSzBHVFp1RUhsbXdoRU4rQlNI?=
 =?utf-8?B?VVhJZHMzdVduVDBYVmxHYnJNUUpwTWxHOVNKZEMyQkR0RVNqdTRHNmVJOUEz?=
 =?utf-8?B?dDQ4UHEyMENzY3ZpVVliTmhCVm1ucWd4eXNTNzlWMVQvRzczYTRiMjFJY0Zz?=
 =?utf-8?B?eU1GMHRqbVkxVWF1SDY5emtPV0VwY0ZOR2t5ODFLMU5EYlp4dzVmWUdqSlB6?=
 =?utf-8?B?Nmw3L3EvdjdBZVEzd20razdncFhUemZoVWdna09yeklRSUxGWnBhcVFQRDdW?=
 =?utf-8?B?Rmxsa3lqYzZxL2p2VzNxaXBXaE1sTDhDZmErOWJzZXdGTnEwR01IRCtoQ0Fp?=
 =?utf-8?B?RS9JWWJpVUNkZW94UktGR1NBWktEL0FMYlUyU3I3T2Eza1BDeEJlTVUrRHlh?=
 =?utf-8?B?aDJtRjNCTGt4SVRRNnYxbE9MekZRcytabDRUVy9YTktVcTduS01mMS84bVF4?=
 =?utf-8?B?WWRHSjBBQ21GZHk0cWNndHdPMDhLVi9hcmU0WERIajkxSDF6bFhDdlA1OUs0?=
 =?utf-8?B?eU5nMVNVMlVlNnJNcXVXMDJ0YXBJd3BEM0lsZS9vRW5wMGV5UXpNeVVUWm44?=
 =?utf-8?B?Z0doQWlDWHF3SElqZUdmeThyWVBraWNWbmlrMUJ6c01mQWpVVnJmU3MvSGRE?=
 =?utf-8?B?MjgveitaVkpRRkJpWmVzV3lJbWFNM1hTNzhoMGJyeEduekZFbkFvam81Ukpi?=
 =?utf-8?B?dVlzODYyVTF3dkpFUFMxTmdGdHNPMHA2RjZKb2RPMlNSa3RlNGpzdFRIdGx1?=
 =?utf-8?B?UHVFalNaL1cyRlhObFdVKytKVHBXVjBOZlQyZjkyTDhGWitQS2hoeWlEMGEy?=
 =?utf-8?B?TWw1TTN0SFppVmJtZmZGbXVURGxabWd4QnZ4cnVZNTRVTTRRZ0VOalN4M2cx?=
 =?utf-8?B?aGNvYWlGOVB3eS9yeXNDZi8vOGFIUnY0RjhYRnh5eUgzSXpBTkVRaGQ5Qm1Z?=
 =?utf-8?B?YnZDODA2QTRBcnEwbXd4T3JZTkZpRElqOFVzcm1FZEMycXp3V1BBY3pFMGZU?=
 =?utf-8?B?RFlxM1prby9RVzV3N0EwSks0TmxLS1VtcWtjTHB6STdzN0xBeWJMdFhKQklw?=
 =?utf-8?B?bEZ2bE5TOTJQOWlLVE5vUG5GMFdXNXVnYlFXQmhoNE5mTWxrQmhUNXpia2dM?=
 =?utf-8?B?cUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95eb2bbc-9591-4055-8d1e-08dd8263148a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 12:33:41.6988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +eol+i9HCf2+x5o8K0gbK8fLVCcStppqINB+90oYEPt/BJo+YZ7gEdAuFPa4I0Tmej8FUZVu79xV3XagHndYIiBrsjmd5CBxs0OPjzMWPr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6073
X-OriginatorOrg: intel.com

On 2025-04-23 10:28 AM, Philipp Stanner wrote:
> Changes in v2:
>    - sof: simplify return. (Andy)
>    - intel/atom: simplify return. (Andy)
>    - Send a separate series for AsoC. (Andy)
>    - intel/atom: Add another patch that switches EINVAL to ENOMEM. (Andy)
> 
> Hi,
> 
> a year ago we spent quite some work trying to get PCI into better shape.
> Some pci_ functions can be sometimes managed with devres, which is
> obviously bad. We want to provide an obvious API, where pci_ functions
> are never, and pcim_ functions are always managed.
> 
> Thus, everyone enabling his device with pcim_enable_device() must be
> ported to pcim_ functions. Porting all users will later enable us to
> significantly simplify parts of the PCI subsystem. See here [1] for
> details.
> 
> This patch series does that for sound.
> 
> Feel free to squash the commits as you see fit.
> 
> P.
> 
> [1] https://elixir.bootlin.com/linux/v6.14-rc4/source/drivers/pci/devres.c#L18
> 
> Philipp Stanner (4):
>    ASoC: sof: Use pure devres PCI
>    ASoC: intel/avs: Use pure devres PCI
>    AsoC: intel/atom: Use pure devres PCI
>    AsoC: intel/atom: Return -ENOMEM if pcim_iomap() fails

Nitpick: the scopes used in commit titles do not match recommendations. 
Below the suggested ones:
	'ASoC: Intel: atom:' for the atom-driver
	'ASoC: Intel: avs:' for the avs-driver

>   sound/soc/intel/atom/sst/sst_pci.c | 58 +++++++++++++-----------------
>   sound/soc/intel/avs/core.c         |  7 ++--
>   sound/soc/sof/sof-pci-dev.c        | 16 ++-------
>   3 files changed, 29 insertions(+), 52 deletions(-)
> 

Hi Philipp,

Thank you for the contribution. I do not see any major issues so feel 
free to add:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

Kind Regards,
Czarek
