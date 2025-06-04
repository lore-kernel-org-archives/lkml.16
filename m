Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CA11DC9BB
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 23:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749079676; cv=fail; b=BgDEyPVgs+PCXLKH4UG1voNn2XFgrfDBPtKs6lxtswVQgR6tCQ5RJOjXkHE/Oar99RtAs+AT8tCDveIXLZzAqpncltPzRJvnfSBLpG/+vZEmBaHey1B1sfdlcZLKqI24Gv5sYI7s8UxxUf3CC3j3kCEsrRyXXnHNWf7qEK1+y9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749079676; c=relaxed/simple;
	bh=GAnAxkrb9GoQQ9MGhiOJVfXuLt4hta/zxfwnnFOGRg4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Zk0KCf+JXuQkx0qVEA96NgIIaLW3/NVgxT4h/8OceGXO8DhjIckjLHcXh6d6w2I255+SVpRgWfQjAbWGW/K1VIS5ymQ7SrDaywPXmE0S5tXGxZn2ItosQxbpL9FP7FjutM1qS3KdUGSbtNOjLF8/B+LArLRHik9QGR9Gg8gBFGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IksFLUhi; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IksFLUhi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749079675; x=1780615675;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GAnAxkrb9GoQQ9MGhiOJVfXuLt4hta/zxfwnnFOGRg4=;
  b=IksFLUhiMT281jaUCDRuUrV5WZMyjjUiqsmLBrldq33QOJcPkKN3RAFv
   bqmOJcI9HQVXTGDnKMMJKnu4YfXuse3ZIMfp5XBGsmjRD6t2Kuk0VVbgS
   jhvmhQRFMBNgYpdURiePoEAI6julY8vYskzdEercTIGaG6+K7vuwxtY1o
   6uaTVyk9zwv4M0OoB6OruZcSPjDtMFfLZAIc7qRBfy1IGiF7Iu/r7/xJk
   xpJyQ8sswsSGzL1kBEVfflDGhuYtjzz4mHksJA9qCjeb6I7yZlviJ9oL1
   QsKzvxYTA/LI2b01v8r8NKbq8YgGQmYQj6vSUYURO6W2Lwc08RvwWSFgz
   w==;
X-CSE-ConnectionGUID: DalZ2zlrTkqPaBSAocoqsQ==
X-CSE-MsgGUID: H7Y5t9ZvRKmUunXMsC4KfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51099816"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="51099816"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 16:27:54 -0700
X-CSE-ConnectionGUID: 3t1sOcLFRCaSHkWw6eIthg==
X-CSE-MsgGUID: m74nkcP0TjyZa/KXYjDFXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="145818854"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 16:27:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 16:27:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 16:27:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.83)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 16:27:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPfCQb2wKL+aC9AoWHcNOGRYp0sxgPDfpeFolLuWmAUovNQ7sATXXtYD2NBEnwY9+zWpC6GYvFVboU28DN0rud7ctziPRq1ttFV50CB/nFDImnRzJyQhyKt3s/WfjhIBRhTwU5V8j+6ds1K8Ia1f1J+qDOpw8/8ambIbC0VJZxTP/sq7JdscXXzVNOarDyLMItXoFh0DGX7SSNRGPlx01reY+2aArjIT+bO+HfErek5GmwsLLg4nf13B7kTrb+rRlekxF8CvPqxAsV1C/2seCUMPOEjx3mr9JF/ye+cM6ULMtvVOmHiGx8wtQbrA38KfKPQBEbV0uvoU0CyYd51SEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAnAxkrb9GoQQ9MGhiOJVfXuLt4hta/zxfwnnFOGRg4=;
 b=xWZWqbJ3bG9D0M+E7Pbb9y3fvbcmo1v8IvA55i/P+t9BGlgrbi7zqsWiERpFM/hJeL+MxrXus9FTI1NxaaI7crf06UvsoLCzrgYhaTls/yFJosneIsVQeg3CEqwz0vQASIgwnPhGwJyUpekW9AOU95n2j8Q5Zj3hihfOjvglOj6IcVzh6JK/KMDrS2ARdhG1PN0zfDpwoz9DR3zG3rpwSfMrgV+A07wrGCUynd6df0YZ2DykixurVPmw3uBDS0NUgYEHDc0toTZdrb5tEgph1WfG12JVBOH5lXxb5VJmgmza/qvjAXuxjxiuEbzMn79Pk45jcWroVBP0d46j0irCSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by CH3PR11MB7275.namprd11.prod.outlook.com (2603:10b6:610:14c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Wed, 4 Jun
 2025 23:27:50 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%5]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 23:27:50 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "tglx@linutronix.de" <tglx@linutronix.de>, "peterz@infradead.org"
	<peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "Hansen, Dave"
	<dave.hansen@intel.com>, "hpa@zytor.com" <hpa@zytor.com>,
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
	"bp@alien8.de" <bp@alien8.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"samitolvanen@google.com" <samitolvanen@google.com>, "Edgecombe, Rick P"
	<rick.p.edgecombe@intel.com>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH] x86/virt/tdx: Add ENDBR for low level SEAMCALL assembly
 functions
Thread-Topic: [PATCH] x86/virt/tdx: Add ENDBR for low level SEAMCALL assembly
 functions
Thread-Index: AQHb1OklVaYPTytbT0efy84CnI49T7PzaN0AgAA6oQCAAAIvgIAAAQ4A
Date: Wed, 4 Jun 2025 23:27:50 +0000
Message-ID: <5ebc8a6497b7dd7029fd45e7516228e65eceb6ab.camel@intel.com>
References: <20250604003848.13154-1-kai.huang@intel.com>
	 <55e5b3f8-3e17-4962-af2f-75c98ccd414f@intel.com>
	 <f442380c2d8cc51b38105c6316cbe224a248fdfe.camel@intel.com>
	 <5876fb5f-dc8c-401a-833a-a33265ff1fc1@intel.com>
In-Reply-To: <5876fb5f-dc8c-401a-833a-a33265ff1fc1@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-1.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|CH3PR11MB7275:EE_
x-ms-office365-filtering-correlation-id: 7afa0a34-4c44-4ee8-faa2-08dda3bf6c5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TElSZjFHTVNzSTZkU3ZGaERUMVdMOTkyWkx2bU1sOTYvcSsvTk5Rc0NDRXFV?=
 =?utf-8?B?ZjREMXNSc0lsZkNidXF3aU9xOE15WXhxRUxzNm4zZkhRMTNSSGpZcGI4NWF2?=
 =?utf-8?B?ZjdJZXJNRVNPRUV6bW4zSnV2UmdjMytvNVV4OVZ5MXRESHlsUzJ6QWNJZm1o?=
 =?utf-8?B?c21YaDhlT3ZiaXVZTzdtRjlwZ0hFSGFUVU44SlkyY1NZb0l5RGtxcWN6QXhX?=
 =?utf-8?B?bkJMNmMzWWZ2VSs3cVQxRmRibTltUTZSa0pxb1B1Ry9hVWdmWDBCNGhnR2kz?=
 =?utf-8?B?SU9rVVlWZHRIYjY2Rkw5eE5mOTVNOVk0ejJjM1Rna2VXc0ZjZ0pNRXRrL1Vl?=
 =?utf-8?B?aGFuZVdGbGlFYUdCUlFOa3czM3JLYlFNYXlXMy9IZG4vRjJKZ3NjcklZOGNr?=
 =?utf-8?B?NFB4OERNVk5yTlEvUjlZR3hpQ1JxM3hoVFNhZ1oxcENoaDR4VkJtQVhXVmlY?=
 =?utf-8?B?VStiUzBoTUx1RXp3QUNQQXd4RGtRQnQwMXIxcXdRL2JnRXpmdFdVQVZCbmxl?=
 =?utf-8?B?UVMxOHpIR1ltRkhQSkE3K2VuWUxML2k3cHh5Y2ZRVGUwMC9TZ2VET0J1Mm9j?=
 =?utf-8?B?YkliUHV4b2R3Y0t6Y3IwelI2VDJQVWkzNkRnU0djUkpQeGo4dHlXR3F2bjIx?=
 =?utf-8?B?Zk5YQkdlT29saGU4VVRxYk9mTEEzSHFTa29WMU5CczMrRTBhZk13L2s2bnEv?=
 =?utf-8?B?RmVEcmZYc2RSUnpGS0NBV0RkNHF5bFZ2bEViZFArWWpISzlkMUF5aTlEc3lW?=
 =?utf-8?B?Rkc1WGNnTzJtOHVFTEU1R3RSbldKZmtZVmpyclM1OFlpRTUvVU9RK0I3Y2tD?=
 =?utf-8?B?RGFEQkUwZWlkWW9lZVpUS2FDTjBQWDJGUGRRMFJZenpIYnF6bXgvR1FPWjI3?=
 =?utf-8?B?UkhYTmo1Q1Bram1rcGxpY25xR3N2TSs0RlJoR1pURWlNL1htaEpLKzAwZGdm?=
 =?utf-8?B?WnFrS25KMXlhTzhDM2NuZldFa0luc05Kay9oQUQyWlNQOEVyYTM2R2Y1YnhI?=
 =?utf-8?B?bk1IZFdLdWlPZ00zZGpac04ycnhEVlVBUnZlT2dsU3FjaXN5cGU4WEwrRXBI?=
 =?utf-8?B?TkRDVStnU3lEcFJFZUMzajVTYnJIRnZScUJ5U0wyR2lhajdFQTNZbXlYRkZ4?=
 =?utf-8?B?ekhhNzVObVhLd2o5aXg1angzSFdUbHRSN3Jqc0FYVlBXYzl2UnNSdjRVTVZ5?=
 =?utf-8?B?Mk5zdlZpK0NJVldDNHd4aWVQdFl3cHlJeXFrNCt3Y2ptQnNwRVQ2NlF1RlJB?=
 =?utf-8?B?MTlsYXFRM1ZwWVBvOVhrVmtIRTREays2M0djUVFyemRBcjJYVktxU25uK2xQ?=
 =?utf-8?B?TzdzUE03bGJCckVYaFp0WVMrUXhncnRkUjVTb0xYY092cW4wRVY1VmlqQWtu?=
 =?utf-8?B?TmMva0tKak5iSkxtbHBoOVBCZVFKZ0pLbVZlK3ZpSDczdExQM0tGeG9JSEQy?=
 =?utf-8?B?Z0VmS2ZTRDl3K1ROa3FXeTk1aU52MFVqY20wN0FYS0N4RUJRaGg5aHJ3dnRJ?=
 =?utf-8?B?N0s0TGt4K2pQUStzVWVLUXQwRWxrZkUwelJoWVRCdFIwMDhOZ080bkM0MUR6?=
 =?utf-8?B?anBOUzF4OWRwcURBb1k0Vkc3U29md2RHMVNKMzJKN2ZOZHBPc1RzZU14VHVq?=
 =?utf-8?B?VnNpMmN3MUFzOHdZMGxGSXNQTUx5VEg4ZklpYmJvT1VJYWFRdVByWEZVZ2JB?=
 =?utf-8?B?TS82NWZDeWVKRDByY1ZsdHk4Z1J1SXEvSHdNWmxVYWVuUWFrSmdWT3FMVmxF?=
 =?utf-8?B?WWxNcTdWcFI4YndhK29ScWtCS3NrRlVVemk4RlRkK3M3R3VaVjFuK0FMOVNN?=
 =?utf-8?B?bElZT3lKWExEa1JWVzM1Z1g5cjZOZlBVSmxLMExERlE5akZka0srVVBOQ3Fn?=
 =?utf-8?B?V3VlRWhPYkdqNSt4cFJoMkFZdk9tcStkWDRjNVBpTGY3WDJkbDE1QnlwdUwr?=
 =?utf-8?B?RXVXWWRMSk9DRUFIeEl0b1RkdEZBZUU4Mmw1QnFsVDhUVmxiaGpnVDhuN1Qx?=
 =?utf-8?Q?i0chSiQb4/0xiWqjPJw5tK1IPxDeSs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDhWUXpnckxqbUYra2VBOW5aQTV1ZzI4ZG01cy8rYlFEUnlZZlA3RkxocnRM?=
 =?utf-8?B?MmxNRUQxZzdGa3gvRjVxYmlKcUtFNCtrMm1RajlNWnUrL2NTWnhxT1g3VzN3?=
 =?utf-8?B?NkRNclRNV0Q4VFlkNWFLWGJybmxDNzhvWGg0RmhVdEFZakpVbWEwcEkrbWdT?=
 =?utf-8?B?Z0RDd2kvQWpTeFAySnNMUUpCWHd0bzE3M2lmU1Y0aENyMGt6amhOUzhEVU9M?=
 =?utf-8?B?cXFHWU5DQjdnM1U4UXM3TXo0Y1NSNklUc2ZOSnhPL1RLUUpkTUY5ZjlHaEpv?=
 =?utf-8?B?bWZsTDB3aDdDMnBudW4ycUZrbGlITndMUytlM1N5WE9hazkzODRSOUpTYlBT?=
 =?utf-8?B?Z3BIT09pWURXY0xLZnJZaUpwd2N2ay9wa0ZQazlFU1p3dDlrdFlJd09KR0hI?=
 =?utf-8?B?djdTaDQra2hqTGdyNExtSU9wMW42UEd2KzMwNEZrL1MvWlh0bThoUFEycjJZ?=
 =?utf-8?B?dHpRbmtBWXJxSFRGWitkVURSMjI3blVXcW42K2xvZjl5MHVBKzNKVHJ5amla?=
 =?utf-8?B?M00vRWlWSUxybVhEVk4rYStyOHZvV2RSL0ZaMEdqZXJvTHcvVlBIZDZUMnRQ?=
 =?utf-8?B?Rm03REJVbDBqYzZpb1VUam9vbGNRMmc5cGVaRmxoZWpXL1c1d2t5OVpKaVp0?=
 =?utf-8?B?ODE1YzN3K29uRzZDOGtQVGw1dW03MHBFSVBBdWdUMUhIa1JvQzNsQWgzbW1l?=
 =?utf-8?B?UGpLd2ZzcjVra0psUGVIREpFMklja05JMUdsL2NTYjE0QzRIZm5NMGtWT29n?=
 =?utf-8?B?cklyTWVVNy85S0pET2pEeGliS00xa3QwbjduRldJMlE5QUdwYjY2LytpNjV1?=
 =?utf-8?B?bnViR1RlL1ZBOTBabkRaQjZvTWttdXJqRWkrVDUxNjRVamVOWlp5WDlBUk16?=
 =?utf-8?B?anFKdFJ0K0JiOVUzSjdiczhPYmw4TnVYYU1VNEdDdVZyWCt2RitycEpzQmtR?=
 =?utf-8?B?bjdFRGpmQ25PWGI2b0UrZ05QbTN2VHY5VldNUllPMFZFZUhuTVpVSXk2S0Fk?=
 =?utf-8?B?K1RYQU1haFJjOEwraXJNdTQ4WkVZMkZMekVWZVFPZGtzekpvMFY4d3l3MUto?=
 =?utf-8?B?RkFCRlh1WmdDTUp6ald3di8vSXM0bUN2QnA3LzFGMWFtZzM2bDg1cUE1N0lE?=
 =?utf-8?B?K24rWElMZ0FtVVZVbkhNcFl6UGJVQytjVko1Mjh2QjFtVUFDMjNkWHpscHVF?=
 =?utf-8?B?TEJ2VUNPY0NjTFNBVDdSUEdkYmNJVDU1S1pZK09HSHRURTZ4L2JpZzRMK1lK?=
 =?utf-8?B?dHVpT3V3djk4NmdBVXZOUDUvaHd2TS92WTZ6SEpvNmtiUlUwMlhEaFQ3MFdJ?=
 =?utf-8?B?N0V4MDc2MnF4Wkx2R2VXSytGK0ttbFVqYS90R0VNc2tKRmVPSWVnOS80emY1?=
 =?utf-8?B?MExKOUttZWFrN2h6L1BFeHVjTnM5T2lCV0Rwd2FFSE55Zld3VFo5WGljL2Zz?=
 =?utf-8?B?cVB3UUFyYkM0bkh6V3B1ZThpQ2JBa3gyT2FhUWRhM0xkSFVadWVudXFlM1h5?=
 =?utf-8?B?aHhDUXlUeHk3bk9oM3F0cEQ5QXBLZTU4OEgwbXM3NW5Ra3g0amlkRGQyUm1t?=
 =?utf-8?B?dTBFRUw5SGxtcWtTUjkxQTZWdWhOelQxS3R6ZTZ6V1ZWcm9FZG9UNWI5T3NH?=
 =?utf-8?B?bHJack9OV0JuaUJEckZNY1V2bDZPYjN5clBTcmtocE5zWHBSQTUzemRUT01t?=
 =?utf-8?B?ZzRVRGRwWVlTeWpqczRCbWJRMlBoNUtQOVZuM3kwdHdPc3FhcjRMaktiNzlp?=
 =?utf-8?B?NmdHTHFKM3d1OFpSc2gvV3RicW9KalVoZzVFWDVXSDNkTGZLUHpZMHdTZkN0?=
 =?utf-8?B?dlFYV3FLR28vdDNScmY3bFQ0R1JmMGYrWEJRbDBsQmpPd2lqMFhIcFU3dW5D?=
 =?utf-8?B?RktpWnNIWmdOSWRuVFdOT25CVVZKU0Z4Y1JXWkd0bnZuL1VpR3NYU21oWjhJ?=
 =?utf-8?B?VlZMRFhKSTdNdEdLSlB0NjJnZk9iWXhoVVR3YytVNzRGYktLcEs2QTZYR3Fj?=
 =?utf-8?B?eUxwZjlyR2ZUQWM1RVAxV1lMWjZUeTBVZlBuTjgwSlZrVkUvWi9tYVFlQjJh?=
 =?utf-8?B?QTJUYjF5T2ZPd05wVkZNZmpGUTY4VmNrODJwdlU2N0ZLbDNQWEFoUXNhb2x3?=
 =?utf-8?Q?XuDQxDTeHp/FsW6Fe0JIaD23Q?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D70BB71DAFD29E44BD775B34D0C5CCDB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7afa0a34-4c44-4ee8-faa2-08dda3bf6c5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 23:27:50.8514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dooEdKyIom9+tsZCrSmEm+oUockrKqR9wylxWwqMdXivAYz+0GbiHhHu0LL+EqphQ4ri76yTQqaSW2ldJEZ2Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7275
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI1LTA2LTA0IGF0IDE2OjIzIC0wNzAwLCBEYXZlIEhhbnNlbiB3cm90ZToNCj4g
T24gNi80LzI1IDE2OjE2LCBIdWFuZywgS2FpIHdyb3RlOg0KPiA+IENvdWxkIHlvdSBhbHNvIGxl
dCBtZSBrbm93IHdoZXRoZXIgSSBzaG91bGQga2VlcCB0aGUgRml4ZXMgdGFnLCBhbmQgdGhlDQo+
ID4gaGlzdG9yeSBpbiB0aGUgY2hhbmdlbG9nPw0KPiANCj4gWWVhaCwgSSB0aGluayB5b3Ugc2hv
dWxkIGtlZXAgdGhlIEZpeGVzOiB0YWcsIHVubGVzcyBJJ20gbWlzc2luZyBzb21ldGhpbmcuDQo+
IA0KPiBBcyBmb3IgdGhlIGhpc3RvcnkgbGVzc29uLCB5b3UgY2FuIGp1c3Qgc2F5IHRoYXQgeW91
IHRoaW5rIHRoYXQgdGhlIFREWA0KPiBjb2RlIHdhcyBPSyB3aGVuIG1lcmdlZCwgYnV0IHdhc24n
dCBjb252ZXJ0ZWQgd2l0aCB0aGUgcmVzdCBvZiB0aGUNCj4gRml4ZXM6IGNvbW1pdC4gVGhhdCdz
IGFsbCB5b3UgbmVlZC4NCg0KV2lsbCBkby4gIFRoYW5rcyBmb3IgcXVpY2sgZmVlZGJhY2suDQo=
