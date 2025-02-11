Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BAE1FBC89;
	Tue, 11 Feb 2025 12:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739276344; cv=fail; b=UXuetkz0URnP7CurET5O3ICLs8tpK5IS0Pks/zhf/env9A95Ur0opW+VgPlfDD+DfGSwQPS9pQGRwZMNKouIsXrMe/CyUQbu94ucceQIv3JE7SCilSZE7H30t57GiaPaaqSm2bFCj9rCPHuCXtczL1f6pUK/s8nU10mM0q4IPWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739276344; c=relaxed/simple;
	bh=PecZw2XTbbVf3vpykq9j7T1d/OyhEsmdImM2PyxFmeU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mfmtgg0QlqP93BsrU899iJibZJR+kIWe1rEVyHkOOPHbGXX46lwUR4yUDQ+bFeOw2wwIaF4fnz10LdVyTDS5H++S57TgSqyARnuGn9phFEKxIFy0LHxZuR+3mMoQGzFoyac5kzjh9msum4GUCKIvunuLIDlY8H55L3LubHdI26Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CWk+E2WV; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CWk+E2WV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739276343; x=1770812343;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PecZw2XTbbVf3vpykq9j7T1d/OyhEsmdImM2PyxFmeU=;
  b=CWk+E2WVkepx2Hv4QIHTfSy7I1phK1YYhX38YHRL3SEeL4nMoX2bwJQM
   Ri7JC6OG6ybEAWQLKfcjbx3RwIipJl+43bQ/Ws0qGuRbNl37uCOMiLiXy
   qVKC5Nd7isYCUD6oH0Wfnr/3ApVcZxw/LRSRAD7msEIVcCo3Jxpc/a4ZX
   W6HXLR+915a3f0ePaZCQuoPTnLH7wvjlNGw5SAlCaz1E/qF1vBK7xlDCG
   R9afOGleGglWlye+jaA1Qhi6k/pfcgvNeZrq+mBMxXqYI0SRVar5+eLWk
   3qkIF6+QT4fiNkHT04XwwGMh74QRSIE7g2gIX2XTYTbjB4lhDqFHvRYj/
   w==;
X-CSE-ConnectionGUID: Aoli+i/2Ql2W54jRSC9CCQ==
X-CSE-MsgGUID: IkhRi50XToyJVxKlV8fXxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="40160050"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="40160050"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 04:19:02 -0800
X-CSE-ConnectionGUID: Hr/3GmQDRtugckQoOk491w==
X-CSE-MsgGUID: B9kF8EmAQgCQ4vtuw7zx+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="117522413"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Feb 2025 04:19:02 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 04:19:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 04:19:01 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 04:19:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVHnoYdRTgbMJyVKmGNrVIXe+aFDsTwVvmi1YBVPMYYvoDs/tTThzHnpBz3Rt+at0ySJ1iSREp1A/MUa4wAGpdMbYZGXwqkyfUj3cj07bxggLYETbiPJS3RejleisHw4pu6mMP9A33pBPPARONadt7zMSGqNXoM/YwT4lBSNwbDiJQH55235UP98C23WJ8vGCRLUSFKQSiTb9LP52xymhGlkjpSlabACRit/17Ob0FoWUoZi5JTSXWwgs2HcpNFPdrS6mh4bxTqPwYSnlUTZQAYn4MLEFVEM86DQ3ihPWpNJ2kX53FxPjrAud2tRxEiP4F3GU0OZmrpCm8GfroLK8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PecZw2XTbbVf3vpykq9j7T1d/OyhEsmdImM2PyxFmeU=;
 b=QDWZTuk1reHaaZrwtRJOwuWuYyHUI7Qxexkdwr3XyXgIO5It6bIz5V5FO7ml72o2tbGo85JcUXk6xVMHjTGuYk9t63Mo4rCy5BtBAmvt/SY7BUXXSU1KC28OAMwu6hqWt0661+SpUSdA5U8tktLTvtxe6RE/sPrtn0InC/LHcYdkwE1yBfqsVHQEvd3AbTALWsoLnTq9YR3Lap1BPl273MKzxKg/XqWfSsZ1hJb30TIlY6MI8jSt0UYl80CgyCq43ZvqYSRYNRwCTZjKuRDlz/WYCosmV68mPWfGuLK2BXIgDsQBfaqyKbnntoapLw0CAL4uN0JxCsDsrrK4O1OI4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6532.namprd11.prod.outlook.com (2603:10b6:208:38f::9)
 by LV8PR11MB8677.namprd11.prod.outlook.com (2603:10b6:408:1fa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Tue, 11 Feb
 2025 12:18:31 +0000
Received: from BL3PR11MB6532.namprd11.prod.outlook.com
 ([fe80::2458:53b4:e821:c92f]) by BL3PR11MB6532.namprd11.prod.outlook.com
 ([fe80::2458:53b4:e821:c92f%4]) with mapi id 15.20.8445.008; Tue, 11 Feb 2025
 12:18:31 +0000
From: "Rabara, Niravkumar L" <niravkumar.l.rabara@intel.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: lkp <lkp@intel.com>
Subject: RE: [PATCH] ARM: dts: socfpga: remove syscon compatible string for
 sysmgr node
Thread-Topic: [PATCH] ARM: dts: socfpga: remove syscon compatible string for
 sysmgr node
Thread-Index: AQHbaPbzWg4D8Cm6jECFhWM3cdrsNbNBRJcAgAAbKACAAC9xkIAAFdcAgAB7G1A=
Date: Tue, 11 Feb 2025 12:18:31 +0000
Message-ID: <BL3PR11MB6532F03C63BABEC1DCE50964A2FD2@BL3PR11MB6532.namprd11.prod.outlook.com>
References: <20250117154244.4079614-1-niravkumar.l.rabara@intel.com>
 <45276881-11de-47c9-aa9c-488df537a596@kernel.org>
 <d78ae428-6139-426b-bde9-e3ce5a4008ac@kernel.org>
 <BL3PR11MB65325F279FEA579D19EFCF7AA2FD2@BL3PR11MB6532.namprd11.prod.outlook.com>
 <32563a12-eba0-44b4-ad53-e69c6a4962cb@kernel.org>
In-Reply-To: <32563a12-eba0-44b4-ad53-e69c6a4962cb@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6532:EE_|LV8PR11MB8677:EE_
x-ms-office365-filtering-correlation-id: 3c064179-93b7-4909-07fc-08dd4a963297
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Nk11RUJqVWZnaDMrWjZNcjRvaWRLZUVReGlLTklBT2VIcnlxRmJidmNvZjQ2?=
 =?utf-8?B?MTVMbjUzejBtSUhJREpQUHAvUUxuVnA0K3hOODRrZnlYMHJ0RXJwNURxL2g2?=
 =?utf-8?B?SkhZZkxTYmNzck1DaXNEbTd6VVE2d2wyWFhKVG5vUGxhRndycHRZM2VidnA0?=
 =?utf-8?B?SEpwNU9RSytkcG4vTHJzRENrK3RJNDdIbUo2R2NRYVR0ckxtSEVVTnh4c3Ux?=
 =?utf-8?B?QTdia2VNWEk1bEZIdGtnc0tiR0dORXd1RHh3dzhld1N4eVJ4N1JtbTdvbU1z?=
 =?utf-8?B?QkxFakZiN0hxdW1jNHNOSXVGYmxnZzNCQ0I4U0RSZFFKV1NjNVNWdWlNQ2g1?=
 =?utf-8?B?cFU4cDhkdkVhVUpxNTg5Sk5QbFlwOGVoVWsvVlE3MnVPN3RSbzErTXpka1lv?=
 =?utf-8?B?bElaTEozRERmeUdYVWJrelM3aXBBL2E5bkNuQmJJbDJzd2hmNkRTNGFSL2Nk?=
 =?utf-8?B?QTl1U1poNGw1b0pmWXl2UE1Xa3I3N0Nyc3FqRFNlVzJoT0VIQmR3RjFrbVh4?=
 =?utf-8?B?UTRDaEV1Ui9IMmptMHR1Zlk1VVVjQ21iRnFNNnp6MkVFTExXSXg2WDlDYjBB?=
 =?utf-8?B?RmZSV0tRR09sNGhXSWg1Uk9nL0hEK2JYSUE0ODByOTRBWkRQajN2Q1ppQ3ZQ?=
 =?utf-8?B?MEdiQjR2NTZrU1YxTGo1V1RDNlVlbEJwWk5MWkcxR3JxLzRXN3M3dkJJR0FG?=
 =?utf-8?B?QSt1Ylk3d29ldGQ5Sjg4T0ZmWCs4R2VRRDRkTCtjaGZLQlROZUpvVVR6cjhr?=
 =?utf-8?B?c09vcE1Db1E5OHlNc2hkRHJLcHZUNEtjWC9ZSUxaMG5VbFYxa2M3a1lZMm1L?=
 =?utf-8?B?WFJJNDRzaFBhNVRKWWt4bjJOclgzb1lLUzZtQVE0N3dHbWlOamt1L0Q4RzlK?=
 =?utf-8?B?c3J6UDNrUzZjem11UUtETkx0VXhRMjBMNXBUQ3hYZHdoOXp1RmUzZDFIRW83?=
 =?utf-8?B?UEJFaFhKa3VaVXY2RmFQUWs2R1RKdzRlT2FmMjBMd0JIb3k1UEcrREhOWVRl?=
 =?utf-8?B?UHNyYzJYcWdaWklTblRwU2dPMlQrckl4a0thS0Izd2ovT25SSkpHdDNWQUJU?=
 =?utf-8?B?dU93NS9BUnJHeTdSWG5JN2RXZTMwVHhHUFd5UWpkcFdxTmZSZXNPT1JjMXIz?=
 =?utf-8?B?Nndvd0IyUDM3dFB2bExUTHlydDVweEtmY1pZMmU0SHBOWHExSHpqNnlvbXdz?=
 =?utf-8?B?aUVIT0FzK0NOQWRkb1JNeUdJdzdjMnJzVU5qejN4b1VYaUpzQ1JIaTUwUXM5?=
 =?utf-8?B?RjN1Q2hEZnBJOEhsRElpeUtvUEZMdVlHU25SSXpkSVNWZ2N0cXAwM2g2WFF6?=
 =?utf-8?B?SG91ekJaWHQyZ3dhT2hIUFN0UUpIWEQxNDhQc1hSOWhYaXdtNzRjOHRLc1J1?=
 =?utf-8?B?TldteTdvS3dEYUZXclg4RUhRV25zWHBvb2Y0OU5HVlpwTmxoSnNJVXhXYmEy?=
 =?utf-8?B?aE5mZFdsVXlIVWp4L2oxcERZbEM0VU8veXkxemRBMXBuVGJRZlJ3UUxuZDhB?=
 =?utf-8?B?MTFDVDB0bEhsNVQ1UlFrWEFBL3VTRjB6WlVvZE1aYXUwS3plL3F5dlNzZmla?=
 =?utf-8?B?QmN1VXl1M0Z1c0YxZkwxb25ZT3AraTB3dVM0OFloeHpYMVU5b1ZnTy9lbGVT?=
 =?utf-8?B?NERUTDZpM1lnT253U0huSlJuRFVuODNBOWtvMitUenVoRDU5QjNGY2FlRWV6?=
 =?utf-8?B?bFZBWVlmQzNwS1VJMHY0YldjZjl4Z3l6NXlwNi9XV3cra1FOYlQ0aDhQb0pi?=
 =?utf-8?B?TGI2YlBxVEIvQURpT1NwOVZZcXQvZkx4aDlhVWc5ZlJsMlZzUm1kRWg0TFpv?=
 =?utf-8?B?QVVSMGVPK3dodXBGK21jUTY1emVDTVV1WWREQzlzL0lkRkxNV2pPQ3owdm5y?=
 =?utf-8?B?cUJVeGNrSUJIMzBMK2JSUTlTTVFGczJ4OEtUdWtpN1FVakNqb1JLNURaNG1O?=
 =?utf-8?Q?R694kPmqH8yP5T/3u/StBNdbAwEEj1tR?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB6532.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eE9tNktsVWNSMDg2eVNqelpPeGlCVnlKcWVLLzhacWZNTStIQ0M5NnUwdFJK?=
 =?utf-8?B?d0dXb3JqZk9ONDYrcXI3akJETXU3M2RDQU43TjAzdWpJYkU1clpQRkVCL1Fi?=
 =?utf-8?B?OElFakRxbFFRUGlZWWUrZkxPU2k5VEhZSGo5QkxSd0FySVhqTUNiR3Y2UktF?=
 =?utf-8?B?RHVhVHFwYUw1c3JvM01ORTdQcng4SEJ2c1p2ZnZDVlk4Y21BMHZFeGNLRnpr?=
 =?utf-8?B?SExkVDBrNkN0WGNVWTFFOHZ0WGJSZWNFaXBzVWV2VVZzNGlTemg3akw1dWF5?=
 =?utf-8?B?UDFXN2ZXUWpvUXNrNDA5QitBaVpHdGJIak55MWxUcjVibmhJSUlPSjR6TTFr?=
 =?utf-8?B?dTRsSjRGcFptSmp3MXVld1A4bWlJbG5nOW1JZ0xaazYxUWhObGZMbER1Qnp2?=
 =?utf-8?B?SC9tOE9vNzZibDhkTXBVQkJOUmdNTStjSHF5bUN4ajJIblFFZEVBT1MwNm1Y?=
 =?utf-8?B?TW1mZGJGRmNFK3VqN3BlMkZ1ZFdmRnRlR25IVnF3SFNERHh0N1FINUZXSCt5?=
 =?utf-8?B?MWIxd1BGdHlVTWpVOTRmcnNkQkRycnRJMHJtdEFrcVI5SjRCSm9vRjRPMkt3?=
 =?utf-8?B?S1dpNFpiSXRZS2g4VEN6RTNlaFh4V3hRbzFTR3FpYndHRnV2bmRaMzd6S01y?=
 =?utf-8?B?ZlVBM081QTNkYnlhMW0xZWJwSmxrNDdsb0s2S3Z2dVJCWktRV2lSd2RMU3M5?=
 =?utf-8?B?NUFxaGpjR1JGZmtIY2FNNStYYldTMmxWMXlDWU40WmFSY1FMMmMrNTRaZDZE?=
 =?utf-8?B?Y0d3Tlo1ZEJHVXZBZElGOUtlR1ZJVytpdmZaOGNGVjYzcmxIcWZjUXNPMlkz?=
 =?utf-8?B?UTlMUm9FVHZreVViYm9xUi9HcjdWd3dDc1FVc1RMMHp6WW9KQkpyR2ZuRzZ2?=
 =?utf-8?B?clRFU1RVZlNnd1UxZUZvNFo1eThSN0w3SGVEVjlHZk0vUUV6eWh0cS9waTJh?=
 =?utf-8?B?Y2N5VXNLN29Tc1hoeDhOeTJKSS93eUFPa2ozbmxQdlBOSjU1anRUMThNZHZ0?=
 =?utf-8?B?NU53SlFiMXhqTEsrd0dBM0JkL0RUUXovcDR2NVlrWUpHOWR1SWJCMWdDLzBQ?=
 =?utf-8?B?ekthbWZSNlFVT1grU1AraEN5OTJZOWFpOGVBamJmMDRUNFVaTU9aSkc4b0Iy?=
 =?utf-8?B?bTBCYVpqK0lIWXJ6aHlyUVpnMmZXek5aWUlKUVJTSnl2K0dScjByQ3l5TUZl?=
 =?utf-8?B?R2RXeTViNStmRjRNZE9LaytMMklDNDlRWXNnOWJqYlY0bWMwNjFta3l1NDBH?=
 =?utf-8?B?SDBkek5KN2llVjlzWkhDbDJ0cFlHNEtOaGVUOEtBY3NyZ2xWUnU3Z2dKVExG?=
 =?utf-8?B?VHJ4VWgySHFOVFE3enpMTlpGK2t5MXpsY3R6Z0RhUy9hS0lqSFlDM2pZbThm?=
 =?utf-8?B?YnJ0b3hYUGVGc01XcFdoZFBrSk5sczNlU0xxWitLU01ON04vbGI1SnJWVy93?=
 =?utf-8?B?bzZWY3VBbHRPVUVtOERnTjJIMkRBSTdaaHFVclhYam10Nk5XUGFnSVlHbWhI?=
 =?utf-8?B?TWdVaHNpS2VjcVZLaGVsN09naUlHT09NWmFHb0NrUzk1eFFHVkNETTQxa3BG?=
 =?utf-8?B?RXlJL05MUFd2eWdmRWx2QlpoWjRGemtoUEtVU2ZzUFozS3hncFllQXRsOUM4?=
 =?utf-8?B?cXlUTHJJWGZlVExTWlFMOXFqMDdRdy9wUDRhMkJKaFBVWGxLK1NjS3E5OXZm?=
 =?utf-8?B?T0ZrSlZGK0RIc09oNmVUUDhrOG44RmpDZk56NmM4RGN3VVRtVURlMHgzeXA5?=
 =?utf-8?B?TENYT1pwdkhXdVNCaHhsVThTcHI5aTRSYkg4R01FajYyZm01ZTFmRXpRcVFo?=
 =?utf-8?B?ekV3YmFrRVJMbEhid2tRbWpVVG55ZWxqSmhLejFYaDZyb3FkSk53YmdLdWZK?=
 =?utf-8?B?TEtvWi9WblZnMkJyekRVbjltcE1WMzlsZ2E1RWVpNWMrdGpIcWEwTzFsU3pn?=
 =?utf-8?B?eXRVMEJ4VUdiUHo4QWRnQkZDYmxFN0NYcVBoZGVVZkErN3dtZ0VWNm5uNmU5?=
 =?utf-8?B?WXRzVmREWklXR25oeEFBTGhPZEttTDNlZ3R3aHROQWF0elhaazRqRjZiSDRK?=
 =?utf-8?B?N3dPM2JaUGlzM1N4bVVDeGVvL3ZYaHlNTVRHYzRIZ2ZFTmhNQjFHK1FrR3BM?=
 =?utf-8?B?Ny8wZ1pjZm84ekJzb1lUUEtLT1NvM0dhTzNyUmkydWg4aTMwN2t6c2ZHT0Q5?=
 =?utf-8?B?UFlqZ0RycmNHK0c1OWlzNnZWWE1yK0VkZ05QeWJkSnQyQkw3azZSbURaY2N0?=
 =?utf-8?B?TUhnY2ttL2IvS0V6SW9wWCsxZWZBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6532.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c064179-93b7-4909-07fc-08dd4a963297
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 12:18:31.0715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gPDtOUqAewXlOH9+OJjYomlf9uC+Uj/BN1Ej+YxyUSvUN9ZWPpMKEE4s72mEbdW9fWet4pMITzVm0/roIdVnRQ0KoZYD5V9Cp+uPrK8ZvAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8677
X-OriginatorOrg: intel.com

SGkgRGluaCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEaW5oIE5n
dXllbiA8ZGluZ3V5ZW5Aa2VybmVsLm9yZz4NCj4gU2VudDogVHVlc2RheSwgMTEgRmVicnVhcnks
IDIwMjUgMTI6MTUgUE0NCj4gVG86IFJhYmFyYSwgTmlyYXZrdW1hciBMIDxuaXJhdmt1bWFyLmwu
cmFiYXJhQGludGVsLmNvbT47IFJvYiBIZXJyaW5nDQo+IDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkNCj4gPGNv
bm9yK2R0QGtlcm5lbC5vcmc+OyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+
IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxrcCA8bGtwQGludGVsLmNvbT4NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSF0gQVJNOiBkdHM6IHNvY2ZwZ2E6IHJlbW92ZSBzeXNjb24gY29tcGF0
aWJsZSBzdHJpbmcgZm9yDQo+IHN5c21nciBub2RlDQo+IA0KPiA+IFllcywgSSBoYXZlIHRlc3Rl
ZCB0aGlzIHVzaW5nIE5GUyBib290LCBob3dldmVyIEkgZGlkbid0IG9ic2VydmUgYW55DQo+ID4g
aXNzdWUgd2l0aCBTRC9NTUMgZHJpdmVyLg0KPiA+DQo+ID4gPT4gZmR0IHByaW50IC9zb2MvbW1j
QGZmODA4MDAwDQo+ID4gbW1jQGZmODA4MDAwIHsNCj4gPiAJI2FkZHJlc3MtY2VsbHMgPSA8MHgw
MDAwMDAwMT47DQo+ID4gCSNzaXplLWNlbGxzID0gPDB4MDAwMDAwMDA+Ow0KPiA+IAljb21wYXRp
YmxlID0gImFsdHIsc29jZnBnYS1kdy1tc2hjIjsNCj4gPiAJcmVnID0gPDB4ZmY4MDgwMDAgMHgw
MDAwMTAwMD47DQo+ID4gCWludGVycnVwdHMgPSA8MHgwMDAwMDAwMCAweDAwMDAwMDYyIDB4MDAw
MDAwMDQ+Ow0KPiA+IAlmaWZvLWRlcHRoID0gPDB4MDAwMDA0MDA+Ow0KPiA+IAljbG9ja3MgPSA8
MHgwMDAwMDAxYSAweDAwMDAwMDI0PjsNCj4gPiAJY2xvY2stbmFtZXMgPSAiYml1IiwgImNpdSI7
DQo+ID4gCXJlc2V0cyA9IDwweDAwMDAwMDA2IDB4MDAwMDAwMjc+Ow0KPiA+IAlhbHRyLHN5c21n
ci1zeXNjb24gPSA8MHgwMDAwMDAxYyAweDAwMDAwMDI4IDB4MDAwMDAwMDQ+Ow0KPiA+IAlzdGF0
dXMgPSAib2theSI7DQo+ID4gCWNhcC1zZC1oaWdoc3BlZWQ7DQo+ID4gCWNhcC1tbWMtaGlnaHNw
ZWVkOw0KPiA+IAlicm9rZW4tY2Q7DQo+ID4gCWJ1cy13aWR0aCA9IDwweDAwMDAwMDA0PjsNCj4g
PiAJY2xrLXBoYXNlLXNkLWhzID0gPDB4MDAwMDAwMDAgMHgwMDAwMDA4Nz47DQo+ID4gCXBoYW5k
bGUgPSA8MHgwMDAwMDAyOT47DQo+ID4gfTsNCj4gPiA9PiBmZHQgcHJpbnQgL3NvYy9zeXNtZ3JA
ZmZkMDYwMDANCj4gPiBzeXNtZ3JAZmZkMDYwMDAgew0KPiA+IAljb21wYXRpYmxlID0gImFsdHIs
c3lzLW1nciI7DQo+ID4gCXJlZyA9IDwweGZmZDA2MDAwIDB4MDAwMDAzMDA+Ow0KPiA+IAljcHUx
LXN0YXJ0LWFkZHIgPSA8MHhmZmQwNjIzMD47DQo+ID4gCXBoYW5kbGUgPSA8MHgwMDAwMDAxYz47
DQo+ID4gfTsNCj4gPg0KPiA+IFsgICAgMS4wOTU3ODRdIG1tY19ob3N0IG1tYzA6IEJ1cyBzcGVl
ZCAoc2xvdCAwKSA9IDUwMDAwMDAwSHogKHNsb3QgcmVxDQo+IDUwMDAwMDAwSHosIGFjdHVhbCA1
MDAwMDAwMEhaIGRpdiA9IDApDQo+ID4gWyAgICAxLjEwNTY5Ml0gbW1jMDogbmV3IGhpZ2ggc3Bl
ZWQgU0RIQyBjYXJkIGF0IGFkZHJlc3MgMDAwMQ0KPiA+IFsgICAgMS4xMDgyMzhdIGF0MjQgMC0w
MDUxOiBzdXBwbHkgdmNjIG5vdCBmb3VuZCwgdXNpbmcgZHVtbXkgcmVndWxhdG9yDQo+ID4gWyAg
ICAxLjExMTgxN10gbW1jYmxrMDogbW1jMDowMDAxIFNEMzJHIDI5LjEgR2lCDQo+ID4gWyAgICAx
LjExODg3Ml0gYXQyNCAwLTAwNTE6IDQwOTYgYnl0ZSAyNGMzMiBFRVBST00sIHdyaXRhYmxlLCAz
Mg0KPiBieXRlcy93cml0ZQ0KPiA+IFsgICAgMS4xMjkxODZdICBtbWNibGswOiBwMSBwMiBwMw0K
PiA+DQo+ID4gLg0KPiA+DQo+ID4gcm9vdEBhcnJpYTEwOn4jIGxzIC9kZXYvbW1jYmxrMCoNCj4g
PiAvZGV2L21tY2JsazAgICAgL2Rldi9tbWNibGswcDEgIC9kZXYvbW1jYmxrMHAyICAvZGV2L21t
Y2JsazBwMw0KPiA+IHJvb3RAYXJyaWExMDp+IyBtb3VudCAvZGV2L21tY2JsazBwMSAvdG1wLyBy
b290QGFycmlhMTA6fiMgbHMgL3RtcC8NCj4gPiBleHRsaW51eCAgICAgICAgICAgICAgICAgICAg
ICAgICBzb2NmcGdhX2FycmlhMTBfc29jZGtfc2RtbWMuZHRiICB6SW1hZ2UNCj4gPiBmaXRfc3Bs
X2ZwZ2EuaXRiICAgICAgICAgICAgICAgICB1LWJvb3QuaW1nDQo+ID4NCj4gPg0KPiANCj4gWW91
IGRpZG4ndCByZWFsbHkgdGVzdCBhbnl0aGluZy4gVGhlcmUncyBhIHJlZ2lzdGVyIGluIHRoZSBT
eXN0ZW0gTWFuYWdlciB0aGF0IGhhcw0KPiBzZXQgdGhlIFNEL01NQyBjbGstcGhhc2UgaW4gVS1C
b290LiBTbyB5b3Ugd29uJ3Qgc2VlIHRoZSBmYWlsdXJlIHVubGVzcyB5b3UNCj4gZXhwbGljaXRs
eSBjaGFuZ2UgdGhlIHZhbHVlIGluIHRoYXQgcmVnaXN0ZXIgYW5kIHRoZW4gYm9vdCBMaW51eCwg
dGhlbiB5b3Ugd2lsbCBzZWUNCj4gdGhlIGZhaWx1cmUuIElmIHlvdSBsb29rIGF0IGRyaXZlcnMv
bW1jL2hvc3QvZHdfbW1jLXBsdGZtLmMgYW5kIGxvb2sgYXQgdGhlDQo+IGZ1bmN0aW9uIGR3X21j
aV9zb2NmcGdhX3ByaXZfaW5pdCgpLCB5b3UgY2FuIHNlZSB0aGF0IHdvcmsgaW4gYWN0aW9uLiBJ
ZiB5b3UNCj4gcmVtb3ZlIHRoZSBzeXNjb24gcHJvcGVydHksIHRoZW4gdGhhdCBwb3J0aW9uIG9m
IHRoZSBkcml2ZXIgd2lsbCBmYWlsLg0KPiBBbHNvIHRoZSBldGhlcm5ldCBkcml2ZXIgaXMgdXNp
bmcgdGhlIHN5c3RlbSBtYW5hZ2VyJ3MgdG8gc2V0IHRoZSBjb3JyZWN0IFBIWQ0KPiBtb2RlIHRo
cm91Z2ggc3lzY29uLiBJIHRoaW5rIHlvdSBuZWVkIHRvIHRlc3QgdGhpcyBwYXRjaCBtb3JlIHRo
b3JvdWdobHkuDQo+IA0KPiBESW5oDQoNCkFsdGVyYSBTeXN0ZW0gTWFuYWdlciBkcml2ZXIgKGRy
aXZlcnMvbWZkL2FsdGVyYS1zeXNtZ3IuYykgaXMgZW5hYmxlZA0KaW4gInNvY2ZwZ2FfZGVmY29u
ZmlnIiAtIGkuZS4gQ09ORklHX01GRF9BTFRFUkFfU1lTTUdSPXkNCg0KU28sIFNvQ0ZQR0EgYWx3
YXlzIHVzaW5nIGRyaXZlcnMvbWZkL2FsdGVyYS1zeXNtZ3IuYyBmb3IgU3lzdGVtIE1hbmFnZXIN
CnJlZ2lzdGVyIGFjY2Vzcywgbm90IHRoZSBnZW5lcmljICJzeXNjb24iIGRyaXZlcnMvbWZkL3N5
c2Nvbi5jLg0KVGhhdCdzIHdoeSB3ZSBkbyBub3QgbmVlZCAic3lzY29uIiBjb21wYXRpYmxlIGZv
ciBmYWxsIGJhY2sgbWVjaGFuaXNtLiAgDQoNCglzeXNtZ3I6IHN5c21nckBmZmQwODAwMCB7DQot
CQljb21wYXRpYmxlID0gImFsdHIsc3lzLW1nciIsICJzeXNjb24iOw0KKwkJY29tcGF0aWJsZSA9
ICJhbHRyLHN5cy1tZ3IiOw0KIAkJcmVnID0gPDB4ZmZkMDgwMDAgMHg0MDAwPjsNCiAJfTsNCglt
bWM6IG1tY0BmZjgwODAwMCB7DQoJCeKApg0KCQlhbHRyLHN5c21nci1zeXNjb24gPSA8JnN5c21n
ciAweDI4IDQ+Ow0KCQljbGstcGhhc2Utc2QtaHMgPSA8MD4sIDwxMzU+Ow0KCQnigKYNCgl9Ow0K
CWdtYWMwOiBldGhlcm5ldEBmZjgwMDAwMCB7DQoJCeKApg0KCQlhbHRyLHN5c21nci1zeXNjb24g
PSA8JnN5c21nciAweDQ0IDA+Ow0KCQnigKYNCgl9Ow0KDQoNCkV2ZW4gdGhlIHNkbW1jIGRyaXZl
ciB5b3UgbWVudGlvbmVkIGlzIHVzaW5nICJkcml2ZXJzL21mZC9hbHRlcmEtc3lzbWdyLmMiDQpu
b3QgdGhlIGdlbmVyaWMgInN5c2NvbiIgZHJpdmVycy9tZmQvc3lzY29uLmMuIFNhbWUgdGhpbmcg
Zm9yIGV0aGVybmV0IGRyaXZlcg0KYXMgd2VsbC4gIA0KDQpkd19tY2lfc29jZnBnYV9wcml2X2lu
aXQoKSAgew0KCS4uLg0KCXJjID0gb2ZfcHJvcGVydHlfcmVhZF92YXJpYWJsZV91MzJfYXJyYXko
bnAsICJjbGstcGhhc2Utc2QtaHMiLCAmY2xrX3BoYXNlWzBdLCAyLCAwKTsNCglpZiAocmMgPCAw
KQ0KCQlyZXR1cm4gMDsNCg0KCXN5c19tZ3JfYmFzZV9hZGRyID0gYWx0cl9zeXNtZ3JfcmVnbWFw
X2xvb2t1cF9ieV9waGFuZGxlKG5wLCAiYWx0cixzeXNtZ3Itc3lzY29uIik7DQoJaWYgKElTX0VS
UihzeXNfbWdyX2Jhc2VfYWRkcikpIHsNCgkJZGV2X3dhcm4oaG9zdC0+ZGV2LCAiY2xrLXBoYXNl
LXNkLWhzIHdhcyBzcGVjaWZpZWQsIGJ1dCBmYWlsZWQgdG8gZmluZCBhbHRyLHN5cy1tZ3IgcmVn
bWFwIVxuIik7DQoJCXJldHVybiAwOw0KCX0NCg0KCW9mX3Byb3BlcnR5X3JlYWRfdTMyX2luZGV4
KG5wLCAiYWx0cixzeXNtZ3Itc3lzY29uIiwgMSwgJnJlZ19vZmZzZXQpOw0KCW9mX3Byb3BlcnR5
X3JlYWRfdTMyX2luZGV4KG5wLCAiYWx0cixzeXNtZ3Itc3lzY29uIiwgMiwgJnJlZ19zaGlmdCk7
DQoJLi4uDQp9DQoNClBsZWFzZSBsZXQgbWUga25vdyBpZiBteSB1bmRlcnN0YW5kaW5nIGlzIGlu
Y29ycmVjdC4gDQoNClRoYW5rcywNCk5pcmF2DQo=
