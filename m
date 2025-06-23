Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECF4AD2C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750677980; cv=fail; b=R8xZ7lJ3hjgK4N4DzsNzzzP9dJLAOnazf4vmwEKaAxDkB02NvUSc3o6Q0d8VUD8KpaFUL0wouWdiMzF/WYtmybgZXfXH6skaThVhkN8ZAt9dGGnNa8CUnuDh3OTNzCUqRseDJ8YBdcYbY5HfZlZgIxDdUVldaG5GNpw0/QEkD7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750677980; c=relaxed/simple;
	bh=AxBAj2VniFl4al0Ae62qR9q5PrUbSZv5bF5ax8GpvX0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lL9f1WixqT5b7tp7MypQ02Vk6sERO7w2iFDJPxkxW4858VjCM6zws0Pg8YhlrAq6bqJR5gX/UDL1J39WAr0PEbK9Ys++28hAoDqWtzT+st8Lzayt09KGnh3ExfZhdpEqZfUnb5qgl09Yd9tfkesgf+4Df53tixw0C1j0fFecp3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjyU2acd; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjyU2acd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750677980; x=1782213980;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=AxBAj2VniFl4al0Ae62qR9q5PrUbSZv5bF5ax8GpvX0=;
  b=hjyU2acdtyrBYkxdOog9rLMdbVrLpxQRDnsamx/ucxXQmlmsQhdWHfSB
   pg6d3FLFgySJKl09HrVImo5zsZHcuEL+e8tztHnY+T7xzxFiI3WL7QY9y
   qFOBHCwuBno6Fepf0agbrosrornzgAZ/pfy8nD3s9Bb5t+35rEREwxDxG
   UaWeesMergzlM3xkSQwv3AFmjqaiDv7g80MiC5LEXwgi8+wJWumJFmjTw
   tOibOfvCnR+ocqSggjuhjXLM3f3Y84/JjUDxDY8R4GC31ET8GHDBdJ41R
   P1Kh9X5L1SjGCyCUjT83zgFjS0y//7shgjKutirO1e76Pru6osoS5QMip
   g==;
X-CSE-ConnectionGUID: LJZ7GMF4Ss6wwUUwMZcQog==
X-CSE-MsgGUID: gCzaqtaKQXWa4UvJY2d+1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="56660300"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="56660300"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 04:26:19 -0700
X-CSE-ConnectionGUID: b0pUhwnlRBmK0oDNlcHAKA==
X-CSE-MsgGUID: ZxLWndsJQ3+upu064qyn2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151348513"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 04:26:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 04:26:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 04:26:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.89) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 04:26:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=krGMLbjgZQ7+YBxUFKyyPs7GckOkWskcOwBdcyP58u2o5DhyJZ8B7pz3wW5ngNtELLKJEHyoWZstaemz6RmbAxHxD+Mrx6ngVayr6C7pzc+nvcgV3QSzHPgi/WR6UVcb3Qp2eklAl+uuttkLndydTr2C49XU47r/zN+1ZBy8zMiKoocHVI+Dvi10QX2+s6i5uf9enAxOj5/KjOe6tDPvbi9shQ1qsIFLJVDBp+9HoyXDqVoOC3Q3VnrF2sfJgTOZMh4hihdOZsPNy9tQOCpWaiCuqeCpQWGsie7G703VAkNpf76LkK0a7u5pXv1sKi1uVYyJlVAaNtyrsjPgw75XDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxBAj2VniFl4al0Ae62qR9q5PrUbSZv5bF5ax8GpvX0=;
 b=aX6mVG6GSQVjL1IrohIYoaJtas35APczHgCpWRLZ8AGcqJLdCcws+JeyvVk2x3R/DWahLB+0W9jcqN6a/OtT2NCUBUKh0lHXBdSnruBRsIInA56bJ/IOc7lA0v+bHysJepEVEUQwtEuZJnfxpoTe1UuDj0b3L+9sLPEq0ZD8bx4vGobZ1EA+pAIXT4AptfxzVb26pwrsLRl8KUcDvPdldR5UtGuK09F+zBiJIGgQ4gDmlbpWthQPEE7WjXs7zsALVwZB79J1UImNIAQwra8CJyNWADNrMerErHihzZn3ZkY74aj5iUZIc97XDqdqrsKu8X2jeXJPktJNuyfw/GDxbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by SN7PR11MB6727.namprd11.prod.outlook.com (2603:10b6:806:265::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 11:26:14 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%5]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 11:26:14 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "tglx@linutronix.de" <tglx@linutronix.de>, "x86@kernel.org"
	<x86@kernel.org>, "khaliidcaliy@gmail.com" <khaliidcaliy@gmail.com>,
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
CC: "hpa@zytor.com" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] x86/boot: Don't return encryption mask from
 __startup_64()
Thread-Topic: [PATCH v4] x86/boot: Don't return encryption mask from
 __startup_64()
Thread-Index: AQHb4O0iNDlRPtaf1kqawGy7DXFv3LQQoWOA
Date: Mon, 23 Jun 2025 11:26:14 +0000
Message-ID: <f81447e67af13eb211ddb97511657931cd95f2f4.camel@intel.com>
References: <20250619073652.719-1-khaliidcaliy@gmail.com>
In-Reply-To: <20250619073652.719-1-khaliidcaliy@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-1.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|SN7PR11MB6727:EE_
x-ms-office365-filtering-correlation-id: 3839ae3f-7211-438d-7105-08ddb248c35d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WTQzdERzYllwVmkzYjdWdWc4QURSei9Rdkx4V3BmVFZIcTAzdHN4R012bGFV?=
 =?utf-8?B?U0x2VjE3SE9SR0ZDM2Izb3RPeVYxY2NDUDVUTE1Bc0VsYlg5TjVrZHJXbVk5?=
 =?utf-8?B?QkplTFZpUVRLUENJckh0OXg4RzIxVGdNMEh6eXFDZ094K1ZQZ2lFSkxtd2Fr?=
 =?utf-8?B?dWRoTFV5MU1WUDh3ZVd3THF0eklHbjRabWo1WG84a2tWV0FkVFZQRUN4bXM3?=
 =?utf-8?B?VVhkajZrbWNLdmhaK0pYdW5lWFJneXRiOVhSeVh5SVpXSmJ1TDhRZVpLS2l3?=
 =?utf-8?B?SGhGM0svUnNXWDgvZmVkUjNhY2NCa1dGTGdmNVh1eWh6OHd3UzVtU29DK0xk?=
 =?utf-8?B?L29heUxrZmN6Z1R4TnJwSGtmeXJtMVFZNDFkZFdqWTFnUXpiZExXU0w5SGJm?=
 =?utf-8?B?SURzTjZZN1pIQlBLN1ZQZ1dJSkd0a3YydWl3WmJHT2dvRzlTdEZ3UW1PSHZu?=
 =?utf-8?B?UG5NZGdGcjBOSS93SzdMd0Q4aGl3VTFPUG9GSnRuTHdCZTRvMlhDakdrZ3o3?=
 =?utf-8?B?ZUQrRUVJVUxRdU9EcVJSeTNyb2JWQ3liVFV4NldjTGtVK09RSmtqbVNUVjBC?=
 =?utf-8?B?MHNGSWE2cHBVUnZhdWF4d2prNEdERlZQT1pJL1VqbFFjbXNTYmlNM0dpL1Q4?=
 =?utf-8?B?QVRVaFA0QU5WWnRIcGlqa0FIUC9ON1orRCtsMmF4TEFNNEphODFIaTFSaWVj?=
 =?utf-8?B?SnlQNEtwSnVESVVXcUhFUDhueksvMmFROVJna05kSVEwTmI2aTM0VWxDZktl?=
 =?utf-8?B?UFM5UmJEVzNYL3JySFNRTml3SHNzckpNaXNpRDJmRS9WOXAxSUlqL1NCVExG?=
 =?utf-8?B?WVkyUXprNHRsSU5wczBlT0hNQUoyTFZmZm9QTEdINkx2QzQyeG4vTkhMVm5M?=
 =?utf-8?B?RWptNGo1ZzEyZmNiNXlNY2JiSXdYeFJxdGV0MFpqVkk3MGExL3d1dnpwenFk?=
 =?utf-8?B?YTZmbVlHR0Z4Q1hTWVBjQ3QxU1RUelhGTExyTExRS2J3SklxdGlxRXhnaGEy?=
 =?utf-8?B?ZllnYjJ5WGYwS2J4Q0t3K016VGZoVW5LUVNOV1dtcUpZN0diV1BQZE02SFhL?=
 =?utf-8?B?MjNXdkFDRlAzMnBCMHhmYVBOb3VGMmNROU1GQnR3bjkzTnFVM0hvSnJzMnNW?=
 =?utf-8?B?dVZnb1QweE5ZaU9xbU91TEJPWDl0SEVqdytYQUVpdWZCZjlmeGRUV3lUWSsz?=
 =?utf-8?B?SjE1SC82VWdUMTN4K3VxRmVCZWZzdXAwUEhiY2MwbEtOVXlVYkl0MmRwRG5U?=
 =?utf-8?B?NzcvM00vYkROcGplbXpJSzU3TGJqdFlPeUNObmFIRjhLTURVc2hIMmlZNG9s?=
 =?utf-8?B?L1d5MTVvT3ZFVEUyUWNyQmNITDQrMEhrdWRoZjk3TFUwcUZwSHdUN25MaTZO?=
 =?utf-8?B?NU41UENOUXVYaHQ1RGJ0Y2FBQ3FENXl1QWhNNWlOMVB3L2tkd0pTWUwzdjlJ?=
 =?utf-8?B?Sys4bzdLa1lWT2dMNU92S0NBQnNRaTluSUdsSXFYK3BZeHJ6cHRtRThFdUdw?=
 =?utf-8?B?MHN3NmlEMWZrTUhCNXE5Q040Vnk2Z0RIRkNwK25LZGxzejFPM0U0SVFJcDQy?=
 =?utf-8?B?UlhHMjFGREMrOTRnM3p2U05iMzhheEhSbDA4SEh1cSs1bFovSEwyZysyR3Jx?=
 =?utf-8?B?eUpISVA5L2xtd1dKMEpyM25oSTUxQ3hQeVBtbGRnblpncFMvb3Zxa2o4VzF6?=
 =?utf-8?B?TUJhU1N5azVnQ1RIcVlxUzhQWGpHRDc5djhmQXM4OG4rM1lxaE42Q3hKSXBs?=
 =?utf-8?B?cmdHNVQrYmdMSmk0cVlQWTJXcFh0RGlZQ2NjbXdmOXppb05CM01IT2wxY2Vj?=
 =?utf-8?B?eVJwWmtiTTRQQnJHelVDVjVzUXh3THBiQnBtZk5UNHVlSXpSOEhKcmxOdUJQ?=
 =?utf-8?B?eEx5a2VVZnpOb0MzRDdySnUyZzJkdDFuMmJIWVRTcm9nNEZncEJvdkg3Uk0x?=
 =?utf-8?B?cmZ2N3c4bGRTUHlLRmdGTTdaYnhkV1dJQnI0N0Q5by80VTFDNk8vaWo1SUV5?=
 =?utf-8?Q?2oI+arLONpXh8eB8USmuMXA+ixPjQU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjVEbE5tMHZGUHFxYzhlTFVaamxWQVNnQVI2NFVOdHpObGQveFRVcUk0S21l?=
 =?utf-8?B?QU54ZzR2L3ZjYnIyWDByNjZyYUl6T0ZjemxQRU85c000VFJIL1I5SW1tT0E5?=
 =?utf-8?B?SmoyNTgwZllSRm1QR0wvamZoTHhTK3lkc2dhbklGQkxqamhBeVlwdFBvdk9w?=
 =?utf-8?B?UkN1Mk5ib1creEwyS1JSYlkwNHBGTkdTTTZkZy9KbU9DYXlKaTYyaU9YUzhJ?=
 =?utf-8?B?U0V2ZXh6S1pTclNCVHR0NC94b29BZW5oM2ZCWW9PNzd6OEJPblJCS21lb3RI?=
 =?utf-8?B?dXYzQndNelhnLzF3N21GOS9DSmxWdFJjWmZIb29lMEp5eEtqdHdsS0hkWGpv?=
 =?utf-8?B?ZEZrV2hmWi9QZGpyencycTlyUEkybWhrazFwMFV6ZWlWYndDUzZhU1hGSkVK?=
 =?utf-8?B?TjRram9nYTFiM0V2dUo2WHVLTEF4eVhBOW9DOGNpNEY5ZUFrcDBiUWpwZ1FC?=
 =?utf-8?B?cUJLU0dNZXEwY2VEU2wxVCtpbHhzT3NicGorYVR2QTJKeEVEbnNpNzhPRnBn?=
 =?utf-8?B?bFVKUTJQcDVZWDR2S2pJU3dSVFFIM2VIWmVyYUcxbjYwaWpaWDA5U1RQdnJz?=
 =?utf-8?B?VFcrbkNmc01DZXcwUkdVQU0zcndVUUFwYVVTZGJVbU1RaEVZTmRCMDZsZXQx?=
 =?utf-8?B?UGF2YWk1NGJrZWZUQ2tFQXk1UmU3VE8zV05MLzE2dmZwbTdJZVllWTFnT2RM?=
 =?utf-8?B?aVVZVE1ZUWZHeW5yM0tmTHJzRnF0VW5qdm5wc2VBZVJTQ29jMkxNVTYvUlY0?=
 =?utf-8?B?N3lhMm5lbEh5c29RODloOEE3VG1nNysybGtYVi95U3FBQUpsRnNLT0FPOW1P?=
 =?utf-8?B?UGZuVDNsS1BOdlpBc2lscXUrUjlrL1oweTJ5Z2ZWek44R3IvRWlaSjNyT3Zw?=
 =?utf-8?B?bDd4MkNRWVBDTW5LWTVpbGh2NnVzVGVvMkkrVnZMT1R0S1huSVdMeU9La2tw?=
 =?utf-8?B?a3Vnc1doajFGVHZ2VzllSFpkODFKNkhrd3BVbENFN0xVUk91VWR0dHVRNlg3?=
 =?utf-8?B?QWd5amwwY0xPL3JCdFFHUTIvaUo0OVcvVmlXRC8vSU96WnM0MWp5TnZzK3dq?=
 =?utf-8?B?bVBwNHJaM3R0OHkyTkUzbHAzeVNVblhOK3dGUllCWWJyMDBvbUxRemYwRjQw?=
 =?utf-8?B?S0g0OFlzeTZubDk1ZWdVNVpMTDJ4VXlsN3hOYlhGdDl5OWlwTFlQMGZFSHdP?=
 =?utf-8?B?bmZtcytTSU1uQkRHOWFmaEZ4Y1pJd2dKSDkvN0MyTVU3YU9SdkVITEpmTmNB?=
 =?utf-8?B?alJrNHkzcWk2R05DM0xzdG9qa1lINTZnMVg3eHBoZ09ROHFIallxemVnZS9r?=
 =?utf-8?B?MHVJNDFsVWFwakxubjNXd1o3YndqeXg3RzErTEpMN0ZENGVPT0hjcGlxV2U1?=
 =?utf-8?B?U0xoMktWSkIvS0dyTTdqRTB5bVBOMTFRMDExVHl5cDFWcHVRUEE3c05QUzQw?=
 =?utf-8?B?Z0l3b1dhdnZubG1JelpkaUF3RU1lRVhrREt3azBCSTF3Ny9JMEVLVkNnQlJK?=
 =?utf-8?B?TE1iYlg0UTFVb2tDb09uTGRGbytRTHpva0o1aGtONmR4ZWx1enVGN3ZhVUls?=
 =?utf-8?B?dFVMUWoyeWdlTmR1UlJQYkFqKzRGU2UzSUk4VkV0cGlETWRjcm13ankza3Jx?=
 =?utf-8?B?eS9wd0ZjR1NiZGtrQkkxTkgrUFd5czRyOXV3emtRRWxvTEp5b2VxbllwVDZo?=
 =?utf-8?B?MWhmMTNFYWw1YkJNR0tUclowdHZ2MU5MRXVDcllZSWV1ZWFZc1JUTUU5UWhr?=
 =?utf-8?B?WVViTis3akh1aWY4QjNlUjZrVXFrSWhGK2JTdU9zclVGZ0M3My9rQ0liZDR4?=
 =?utf-8?B?TmNlSzEwYkRTWXFhS25RZXNLZzBTem5MOFk3akhNa0svbzViUU0yejZNZi9w?=
 =?utf-8?B?Qlo1NU9LQ280TENEeVY5aVNWcGRDM0doS05RL1BOWVRyNVI5TzJ3cUM0bElH?=
 =?utf-8?B?V0l1SzFEMVR5Q3k5d2VVZ2FjR00zZE9HMmd3SmdaSjY3ZUNyM3RiRWhEbHAw?=
 =?utf-8?B?OUFDL2RIVi96L2hWQVRqUitlMVdRaEUxM0JxUHpjTDN0d2R4KzQ3WVBFTWtW?=
 =?utf-8?B?cnBteFpEaU9ZOHlqVktlYTMyWXo3WTI3dzBxTitaemxCVzd1U0FLMmlCRHJk?=
 =?utf-8?Q?uDLSIhczrN8kpk7u3vNllKVAW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D30A41B1AEC43448A7F5F0E122E74A84@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3839ae3f-7211-438d-7105-08ddb248c35d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2025 11:26:14.0970
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VX0h454yxo9FdJTr+fawuhszocYvQHAIeIEXy1Ar5FUaVjB/Zwlwj1bbQqDpUn7+PlS/cvfaclryMP/EYyyMJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6727
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI1LTA2LTE5IGF0IDA3OjM2ICswMDAwLCBLaGFsaWQgQWxpIHdyb3RlOg0KPiBB
dm9pZCByZXR1cm5pbmcgdGhlIFNNRSBlbmNyeXB0aW9uIG1hc2sgZnJvbSBfX3N0YXJ0dXBfNjQo
KSwgYW5kIGluc3RlYWQNCj4gbGV0IHRoZSBmdW5jdGlvbiBoYW5kbGUgZW5jcnlwdGlvbiBkaXJl
Y3RseSBhcyBuZWVkZWQuwqANCj4gDQoNClNvbWUgbml0cyBiZWxvdzoNCg0KInRoZSBmdW5jdGlv
biIgaGVyZSBpcyBjb25mdXNpbmcsIHNpbmNlIGl0IHNvdW5kcyBsaWtlIHlvdSBhcmUgcmVmZXJy
aW5nIHRvDQpfX3N0YXJ0dXBfNjQoKSwgYnV0IEkgdGhpbmsgeW91IGFjdHVhbGx5IG1lYW50IGl0
cyBjYWxsZXIuDQoNClNvLCAidGhlIGZ1bmN0aW9uIiAtPiAidGhlIGNhbGxlciIuDQoNCg0KPiBU
aGUgZW5jcnlwdGlvbg0KPiBtYXNrIGlzIGFscmVhZHkgYXZhaWxhYmxlIHRvIGNhbGxlcnMgYW5k
IGNhbiBiZSBhY2Nlc3NlZCB2aWEgDQoNCiJjYWxsZXJzIiAtPiAidXNlcnMiLCBzaW5jZSBvbmx5
IGZ1bmN0aW9ucyBjYW4gaGF2ZSBjYWxsZXJzPw0KDQpPciBqdXN0Og0KDQogIFRoZSBlbmNyeXB0
aW9uIG1hc2sgaXMgYWxyZWFkeSBhdmFpbGFibGUgYWZ0ZXIgc21lX2VuYWJsZSgpIGFuZCAuLi4N
Cg0KPyANCg0KPiBzbWVfZ2V0X21lX21hc2soKSBpbiBDIGNvZGUsIG9yIGRpcmVjdGx5IHRocm91
Z2ggdGhlIHNtZV9tZV9tYXNrIHN5bWJvbA0KPiBpbiBhc3NlbWJseSwgaWYgQ09ORklHX0FNRF9N
RU1fRU5DUllQVCBpcyBlbmFibGVkLg0KPiANCj4gVGhpcyBjaGFuZ2UgYWxpZ25zIHdpdGggaG93
IHNlY29uZGFyeV9zdGFydHVwXzY0X25vX3ZlcmlmeSBoYW5kbGVzIFNNRQ0KPiBhbmQga2VlcHMg
dGhlIGJlaGF2aW9yIGNvbnNpc3RlbnQuIEZvciBJbnRlbCBDUFVzLCBTTUUgaXMgbm90IHJlbGV2
YW50LA0KPiBzbyB0aGVyZSBpcyBubyBuZWVkIHRvIHJldHJpZXZlIHRoZSBtYXNrIHVubGVzcyBD
T05GSUdfQU1EX01FTV9FTkNSWVBUDQo+IGlzIGVuYWJsZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBLaGFsaWQgQWxpIDxraGFsaWlkY2FsaXlAZ21haWwuY29tPg0KDQpPdmVyYWxsIEkgdGhpbmsg
dGhpcyBwYXRjaCBtYWtlcyBjb2RlIGxvZ2ljIGNsZWFyZXIsIHNvOg0KDQpBY2tlZC1ieTogS2Fp
IEh1YW5nIDxrYWkuaHVhbmdAaW50ZWwuY29tPg0K
