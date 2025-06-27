Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5FD3C2F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751009627; cv=fail; b=fafPirQplVM/YW8zPbDav1CwFBsXrNB8wezdsCVus3QF2FPNihdE9Pq4OSXZ050oWcXw9rxmw3uCcah8SPs5IWme3tqxqQOyRV/fnYSXtZWhdA/lOqllw9K795wT/xiAgNN9eYoE/3OYJyyn8C8iIRy1YpH3sKWVswuCgxebieg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751009627; c=relaxed/simple;
	bh=G1/eKVRfUZ0AhMM4Ewg9odkHpNi5ALuhoV5l72HwNeM=;
	h=Message-ID:Date:Subject:From:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A8K7Rx3j+/V8LMPFztlz+ACzy55AfDgPBLnOdKPcWm1OGuisCpTnmv1uM0b8mXiYKgCqSQ+hW01gaBHdEDvA9E6gBtOrc1/oDu5wOwXRMfWZ+gHmk5sHJEnIaFU3hVL509QWCFn+nR4FeAq24WN5BqPh+qTcoF3fBIvXGuJSHrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MS3fDUU2; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MS3fDUU2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751009625; x=1782545625;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=G1/eKVRfUZ0AhMM4Ewg9odkHpNi5ALuhoV5l72HwNeM=;
  b=MS3fDUU2Q09lp79uC4I/UaA+rztQtiedNM4T/6E/U7fAdQ05CsuhX3nl
   dsKmRC2FrQb/hHqD0yIeVWc4RQr7tUE0mgcbifn5Ow/gI75/l+BDYeeiX
   vBx94m+xfLqGaiiRgMTaxscD7ohBidwKSYMUZv86nIkkSu0CuAE/momCd
   E/85drq+rni9FK9yQ9l8/4K54mXKVW7BPqdYP5tZ2TRYaTAc+ctGZNKLm
   iSm3W1IP5OBLSe8UJ55kQz+2YEzndgFycga246cbVCsf5Rzd4sL5dwaaM
   PLdEY3GAzP+YqT//nen8moIL2MkW4ar6kf2foWWbtRwcFi8N+kfC8PM4o
   w==;
X-CSE-ConnectionGUID: UiailZdwTJ2dOK4lG24x9A==
X-CSE-MsgGUID: PgouJql1QimHhRQsqX97Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64377522"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="64377522"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 00:33:44 -0700
X-CSE-ConnectionGUID: uQUkxjkiQsOOtxf0oe+WEQ==
X-CSE-MsgGUID: ochMPXkhRne/Acs9L8slKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="157123589"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 00:33:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 00:33:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 00:33:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.58)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 00:33:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eEcVMwZjzJWPcnRjkX4mYEF4GbZbKHymukD3ohmiNRG832s6N52hpxYrkF67LaoZpdq9T9bRUYiCx0B/vodV1vlX+26h61EEshiDjpXG1LLSAdu2alKWS6/YnIcFyGTV/I5wstqvqokRELUQl6XPt44mCHvIiorRzHwpjf6330YyX/VA9ErYFFcxQefQkZ/ZQtIyBQwVnDRdg3qwqBIKdTz0TwmNSfnYvYZZxblQrjZ+6y62n5j22hT1E0yUuQ2YTy30d1IxkYwOywikmaPBhReFkpYqbn3nuiu2h78DjhWTpYnobchJUMge/TZ8jV8VvZEwSpxIjbcADS78PTPl0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCuTYCcNLnt8wdMIJZKMqHmu3y7Dib7lp8e4nMh1p6I=;
 b=EJxUblj3Ydq1KyTEAtj/+Cmx8QTtPfIlhNhw6tAidjirgEaHpY04UqeATv8TqOW6W5C0hnTfp0UGvW6LhfAaHjYNke06GEd8gcRGxEStg9V9CTikjr9p/Jr+1Hoftq6pZQxGv4cD3U29dRhXsOXr3+4bwD8BKe7F7ixBS0O08HG3UXB7sXNFJyhctFP9JGWd9EKiTr+t9j3EPlWvMyUxUp7lgM5ulyyQRkpp7QQ2zaJTBBOM0S4MJPkpJz2BERRWJJneNaryJB+Kio3hGRnenwmR8nGxtnsQNXUlPtSaLiZYbfxrj19MAoyXttm+V8ffMk+82F9gjwVU9ch8ulMk6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 SA2PR11MB4826.namprd11.prod.outlook.com (2603:10b6:806:11c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.30; Fri, 27 Jun 2025 07:33:36 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%6]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 07:33:36 +0000
Message-ID: <d0b7b52b-c370-4ad7-8a03-d785f1505372@intel.com>
Date: Fri, 27 Jun 2025 15:33:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Kernel panic in __migrate_swap_task() on 6.16-rc2 (NULL
 pointer dereference)
From: "Chen, Yu C" <yu.c.chen@intel.com>
To: Jirka Hladky <jhladky@redhat.com>, Abhigyan ghosh
	<zscript.team.zs@gmail.com>
CC: <linux-kernel@vger.kernel.org>, Chen Yu <yu.chen.surf@foxmail.com>
References: <CAE4VaGBLJxpd=NeRJXpSCuw=REhC5LWJpC29kDy-Zh2ZDyzQZA@mail.gmail.com>
 <07D9F8BC-47A7-4E87-8655-C978C056E308@gmail.com>
 <CAE4VaGBQnMp953tsv13s=CiaaiW+EZNuvh6dCuRA7MWbyU_Hsw@mail.gmail.com>
 <CAE4VaGAak=U-oLwXvPZsiNRnRvNL_ROKL8AJCSkCm+zPOjf2qQ@mail.gmail.com>
 <31bd3395-cfe3-4af5-bc1c-fa8d26629b93@intel.com>
Content-Language: en-US
In-Reply-To: <31bd3395-cfe3-4af5-bc1c-fa8d26629b93@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGAP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::14)
 To DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|SA2PR11MB4826:EE_
X-MS-Office365-Filtering-Correlation-Id: aa702c8a-5496-4cf5-87bb-08ddb54ced66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2k5b250eTFxaEx5eHZVclM4THBwTGFGZzVPVW00Y2RoM0Z1K2R2TkN5dGN0?=
 =?utf-8?B?cHJhRUhhekhYc0twNk9xRjIxL0FqZm9CaGxuY3VKVzF6M1YxVFk2Ky9RUXZP?=
 =?utf-8?B?L2RzRU0rNldCS2p5VThCTnYyemxHTmY5SU9oNXEzaWMyY25jQ0g1QmRuTDln?=
 =?utf-8?B?WU9MN2hhUWVJL3VVUnVtNGl0V3YxUW0wbmVHT05RbG45Y0lwMkRCbG5xSnR1?=
 =?utf-8?B?Q1dxdjdHNGMxT09ZL1U0dVRyRE5RMTI5V3NYZ0VCR2dxYW1hTkp2ZjJUNWln?=
 =?utf-8?B?NDIwL0lCeTdzR05yc3h4VHdzdUZRSUUvSEZWUWx6bnNNdzJVbmZGWFVTZVND?=
 =?utf-8?B?Y0Z2R2F6a2oyOStPN29rbWgydUtaT05wZWIwWDR6Yk5vV2tYa01yZGxKaWpU?=
 =?utf-8?B?L3BaRUdHZERwQzlZaWNGS0Q4K24vdGNQUG9Oa29ScldVQmFYK2w3Syt3eHFm?=
 =?utf-8?B?d0lQc1pBc0t6VGtiY2pIcExXejFRT3FiZS9zSlhIOUJRTUpySFJnR1BCeEc2?=
 =?utf-8?B?b0ZxMHQvT2h1K1lQVlpWaFFRditCUzhHVTUxSVkrQzlzNGZ5S0RkNkZjMm91?=
 =?utf-8?B?Y1NEMmlzK1RDdUhWd1Y4UVVJUjd6eW9vZzBKL2hKUjZnaWhxTUM1NnVqeG92?=
 =?utf-8?B?NEpoWFR6OXk0dVAwck9jUk4wQ0Y5L0VpR0hmWUozdE5EZ2VpcTZMZWhrVE5C?=
 =?utf-8?B?eWpQaXNJTlVDenZNb1RsVEdDK2lmMFVGcVVEZnlkc1UwWUUrY2sxTlgvVEFR?=
 =?utf-8?B?UDNvL3dZVVlVYzBIazY0UUdWWEtLMEJhdnRXYWlIRUxHcVpjciswR1FYQlZW?=
 =?utf-8?B?VEZieXlRR1B3c2xWWHRsWGE2dGg2Sll5QlZPNy9NWjc5SnlWN2tQVjN2R05q?=
 =?utf-8?B?aTc4U2laQzdySS92SkQ2YWxZdnF5dDFZUGxBUTluSXdldGk3TmoxeTNZVjc0?=
 =?utf-8?B?VmNVUzNOU2JiZGFJZkcxN04rTUZTUWhDeVRjN3A2N0JtblBmQTJYdkV2ZXB3?=
 =?utf-8?B?SUdOdnVuRzhDRU8zNWd5b0JCMjhjN21WV0VMMElNYmFaZEx3VzltT1QraUtR?=
 =?utf-8?B?d2N4WVlzK3R1b2tVSG03ZmJpNGx2b3lXVEdaSENxVHZvWm1ScEtWOXpKdWFP?=
 =?utf-8?B?dnh5bmNQMk1LR3NPZm1wNGt6dGpNb2pucEVhUmlsZUtEVCtqbmg5L1BlcHNH?=
 =?utf-8?B?RElBVG5CSEZnRE94bi9WczhQS0loRUVTaElmTGgwRU5XK01XQU9hREFpOElU?=
 =?utf-8?B?NFQzV0dTaXZMWXdnSENRd0RPSU5sNHk3Qmx3Z0N1L09hamlaRkw0dm92UVJK?=
 =?utf-8?B?Vm90UFFuenJmd3ptKzNaN2lFZ2d4bEYrbjltbkxQajNwTVdOYldabmlpRWFH?=
 =?utf-8?B?ZUNDbmRIdFJtenlQb0xoTlB1OUEvOWJoZGRyUGpYTWhkblV2bVlpa3h2TWw0?=
 =?utf-8?B?aFZHZUgxQkFNTXhrb2owaUVaajhieE1JVTdnZC9sZ3ZRQXJyakZtNkFBQnZ3?=
 =?utf-8?B?QmVJLzJSOGdnbll3WXZnTkFQUG9NZ0xQcWZXTG1DcG1FaVBvSHJpS3hzVFZj?=
 =?utf-8?B?dllRZE9GS09ucWJJMEMvSlIvL0ZVelMyaG9tNy9OVFRsZjRUUmJNU3M1aGxU?=
 =?utf-8?B?U2p0NHJTdVBVY0tmRjBnb1JGL0NDbDdkWStOamFYZkVXeU9UcDVKeVhlcjlm?=
 =?utf-8?B?WlNXUWlFN0phd2doYUM2U2gzRnBmeEF1WjZMbUhnbmlLTFZJeFkrblhEQktq?=
 =?utf-8?B?WDcxYTFyc3dMT3JzdkRpdDlNZ1JqbG9ETDBNWnJyWm5FbDRQcTlnZ0ZBU2ow?=
 =?utf-8?B?NGpHb2R5Z2tuSU5CZkVyM3BXdW51NlUwQnpmcy9PTlMxdDQxQm1jdzNucGFJ?=
 =?utf-8?B?MExaai9xalZzbXdPeFpLbWZNUFZiM2s0a1VDL29SMUtYRnpGRlBNT0pZRjhY?=
 =?utf-8?Q?8JPkvr2sz/0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzlPREpLVXE2ZDVrMmNBWWpxRzBlYUN0blVwYUtSTThDOFZUL3BsYWlBZTNG?=
 =?utf-8?B?bHNHdTIxTUJ5MkxhcWk0aEdvb2JNSzFNRFBENHdNQVp0QkhHcVBRT3p4dDFm?=
 =?utf-8?B?RWVLaElSaUlDVmNBcWlEL2R3YmtQZk1Bak5YTEZoTTFFVFBYbFMxOWpvNE0y?=
 =?utf-8?B?U0IzeXNDZ3JiVXA5ak5abTdaaE9NVTR2L0pYUDlMQnBrQVFldFRLSjNvejU4?=
 =?utf-8?B?NnA4VHFLcUlma1BhajJkeVVZaStMMmdJamZuNHdtc2NCdmlpWkdQMUw0dkJD?=
 =?utf-8?B?Vy92NXdBanFackdxeVhCNTVyMVZWaWNGbFFsZGZIRjBGNS9YUzVDcHNTcjdv?=
 =?utf-8?B?dlliQlhadDBwTUZxdHQwNkVkaURWZU1LNDBqNWFTWHh6azVnUXk4ck9KNkdS?=
 =?utf-8?B?ZjNNRXJONjd0QU15dVdxMCs5NnBldlNNamUvOUlhTHpoMnAzd0lvdEV1eFpu?=
 =?utf-8?B?TGlodGd0bnJwSnd4aldNaDNDTWlJOXg1enJpOWc3Ujk5UHM4cDJVQUswcGNE?=
 =?utf-8?B?MGtCNDU0aHFadVdTdjJ1azBtbTBray9ZMGZCN1BwcFBwVEllYzY2Z1J3UFhD?=
 =?utf-8?B?ZDNWb3J3M3ZRTk9uWkppeXdNTUsrN21OOEtIL2tZdG5FNUQ5M1pBWnF0RDFQ?=
 =?utf-8?B?cjltRGp6OUVDUTRaeUYyWk9YcmlIa3JYYjVCRTNaaURya2J3Z1U3OU02citP?=
 =?utf-8?B?emdEN2VUemsvTTBmY1pTRlBvNDNNcFNzYktDRTI5cCtKdUp1cGZRa2FXdmJo?=
 =?utf-8?B?SmNjVEp5ZXFLL0VHeEh3ZTRsTVlJS3RwSXJLN3lwMGNQUnI1VnMvMDF3VUdP?=
 =?utf-8?B?MitRV21sZS9XdW9iNXovMksxNFVNb09hRzFGVXoyOTZROHVLUDlmd2E1Ujhm?=
 =?utf-8?B?K216SjYrTG9XRUpocXdLRU5KMzUxclJOWDNiL1JjMGV1ajcvQXZWMnVmMi9U?=
 =?utf-8?B?SE85VVlrTWluNnFhOUgyZGxpV1pBanhWQjE1QjJaeVlrK2dnZkhEOWZobDlG?=
 =?utf-8?B?SkttVmpVZy9td0JOVER0a2xFK2NZRVRwOG5YV0ppQXNUMXpvZEdHbnkwd2xr?=
 =?utf-8?B?N1p0a09TRy9MOUFNUm91R2U1WExFUDVyVW9RRmVCOFpjaEtITVhpa3RkOEV6?=
 =?utf-8?B?RTA0UVphVFdxRTNTblZRQ2pEdEJPS0lqeUZyV0laSDBFNkREUzArdEFzd08r?=
 =?utf-8?B?dXlhc2YzTkhNdmx3RUF3akNncGwxQTZDZDIrM1FWZUR6bjhaT0l4ZTBuazRJ?=
 =?utf-8?B?cmxpQnBWMUdZSERLUVFrbnJkUlhMR2dEaER3UCtMS3puRi85dElNZ25MS3Vx?=
 =?utf-8?B?Tk5sdXRBZW1WQUF6a0hQWWcraXVpMUNPMjY0b1RqT3haOENXM2ExM3dHc0ND?=
 =?utf-8?B?dW9xdzJCWDREcHRPc3RNRHRWdlNURHVsR2pyUnFWdXZncjdPOGtKWGhncEhO?=
 =?utf-8?B?dXk5MjMzNUR5M0FRUGtWWkVuTmtpWktLOEpDakdUNDdJeU1hbnFTVGU1RjU5?=
 =?utf-8?B?dURyQU5QdmY0OXg0WFhxMUh3VVZPM3JFSHlVN0kyVkhMZ3VTRjhGMms2b3px?=
 =?utf-8?B?WWZkTGZheTBLOHRGbW5WSTBDUzRnSkFYSS8veHIwNEJkeUtPM1dnVG5iQWxl?=
 =?utf-8?B?bzVsL3lVREFuUE0xUG81dGNMZkkzbXc1ckxkV0hpYmN5UmFZS3loNW1wekY4?=
 =?utf-8?B?RHdQN1ExS0dVQ1lyUGFEa0t3Ri9yUXBlWmFXN090cmpuRStCOUFyVS9DQkdG?=
 =?utf-8?B?WFhsem1uSC9FcGgvUVdTZ2UzQXR1UjIzN0tYeC8rNXMrS2toUlpYY2NPVG5T?=
 =?utf-8?B?VnJlNVFDdy9kUEtHaXQ0cVkxWUdJaEZKcHoraGVra2kvaEdRUkkxd0NKZUU1?=
 =?utf-8?B?eG5pVDNKQUkwaE5pZXd3T3MyMUtvRUhYSHVmSUxYYTNZOWIzSjRWblZZaGFy?=
 =?utf-8?B?azVZUnpqaCtDUWphMDk2VlM3WjVaTWdzeUJYY3BvU1F2ZjVRdkpaeDZqQTBa?=
 =?utf-8?B?VkF1YkIzT0htVTBvbUQzSE8rSVV6emo3b0d2c0pxY3M5NVNZS2JjT0ZGSGM2?=
 =?utf-8?B?MEE5WEFCSzRsbytDNDRvWHQ5Z1RXYU5NWDdaemdGT3Z6K2I3andQWkl3VW5v?=
 =?utf-8?Q?Lj0kvP/qZaZsTf9NhknkTzJd+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa702c8a-5496-4cf5-87bb-08ddb54ced66
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 07:33:36.4771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AI60n/KQ5UIAB6Pb1DVjqJMxtKWueJo6KdBL5EKcwgcf5QTv1xZlMHdjAWryN3gWf/lX0wTGeyGXH4LG2G/+Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4826
X-OriginatorOrg: intel.com

On 6/27/2025 3:16 PM, Chen, Yu C wrote:
> Hi Jirka,
> 
> On 6/27/2025 5:46 AM, Jirka Hladky wrote:
>> Hi Chen and all,
>>
>> we have now verified that the following commit causes a kernel panic
>> discussed in this thread:
>>
>> ad6b26b6a0a79 sched/numa: add statistics of numa balance task
>>
>> Reverting this commit fixes the issue.
>>
>> I'm happy to help debug this further or test a proposed fix.
>>
> 
> Thanks very much for your report, it seems that there is a
> race condition that when the swap task candidate was chosen,
> but its mm_struct get released due to task exit, then later
> when doing the task swaping, the p->mm is NULL which caused
> the problem:
> 
> CPU0                                   CPU1
> :
> ...
> task_numa_migrate
>    task_numa_find_cpu
>     task_numa_compare
>       # a normal task p is chosen
>       env->best_task = p
> 
>                                         # p exit:
>                                         exit_signals(p);
>                                            p->flags |= PF_EXITING
>                                         exit_mm
>                                            p->mm = NULL;
> 
>     migrate_swap_stop
>       __migrate_swap_task((arg->src_task, arg->dst_cpu)
>        count_memcg_event_mm(p->mm, NUMA_TASK_SWAP)# p->mm is NULL
> 
> Could you please help check if the following debug patch works,

Attached the patch:

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 8988d38d46a3..82fc966b390c 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3364,7 +3364,12 @@ static void __migrate_swap_task(struct 
task_struct *p, int cpu)
  {
  	__schedstat_inc(p->stats.numa_task_swapped);
  	count_vm_numa_event(NUMA_TASK_SWAP);
-	count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
+	if (unlikely(!p->mm)) {
+		trace_printk("!! (%d %s) flags=%lx\n", p->pid, p->comm,
+				p->flags);
+	} else {
+		count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
+	}

  	if (task_on_rq_queued(p)) {
  		struct rq *src_rq, *dst_rq;
-- 
2.25.1

> and if there is no issue found after you ran several tests,
> could you please provide the
> /sys/kernel/debug/tracing/trace
> 
> BTW, is it possible to share your test script for stress-ng,
> stream? It looks like the stress-ng's fork test case would
> trigger this issue easier in theory.
> 
> thanks,
> Chenyu
> 
> 
