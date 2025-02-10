Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5161A25B666;
	Mon, 10 Feb 2025 18:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211037; cv=fail; b=Kw11If9BJcSWw7qrPKmXYF/emeKIh6lSifHNuiakDffmOgj/BDd7raRwVvIgI3Tk3uGaK4y9rVm7VI7rHWPzON7rj1xynFuc1Xi6jtyXk5kyl5LN4OzMhHjLrfYPlwGayGmkWSKvxKfkbeDOpJqf/1Az5bl6bFMRHqByEIkf+tM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211037; c=relaxed/simple;
	bh=Y7gN7+nTGq0/2fjguPrTivrkKTuPW7nQ7F3rVem37pY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mclJEhD+nLje6CWFpoZxNii7gk2Su5O5aIBK2BNDnoWrduEU31F2R/Z/TYMuwLL0rdmQJHgQBls93ShsOBnBYKQD68bmaMJSwEV8quTgiqzjLQmALHg4YvLUO0LUpaWdlaf8TV6DQAkVMstBgKnRv264KT92eevBtNJFT+sRTvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AdDLHYBv; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AdDLHYBv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739211036; x=1770747036;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Y7gN7+nTGq0/2fjguPrTivrkKTuPW7nQ7F3rVem37pY=;
  b=AdDLHYBvE9NmDU/QRUjGvLhm5tfkvffKN6nX6yBmAvBGhyzMYoSDGDCi
   o6uzXku7BkkK6Z7ntP0f5R0TbKQEP7pGax+fMusNQMSFLmSnlgwxJxyqv
   fDrDxw33viquT/ZyUJKadH74ocxKSlB2RUBwmR+ltdp/9VmxW8sis+YMg
   uqsE2KJRwAVig0MXGUKdMMYIrBuEAS+iCOQsox/AEm81OhWhszlPrarpG
   NrEpbYv8tOvBwQYfzjLtiEJPxdYRPrAuzV4UCpaa3eYbC9UXz3QtTkehX
   rEzClYjUmhuiu+4Lt6ON5RFQjQwvqZRrg7dW2uNLlGyi0ukVOSTLt3Sgq
   g==;
X-CSE-ConnectionGUID: hERrdXWlSyeUiqLSzS/zng==
X-CSE-MsgGUID: kbX7ABX3RuS86s15+9JpKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="57219233"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="57219233"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 10:10:35 -0800
X-CSE-ConnectionGUID: QGUPdJRTQ72fg39JV5Dndw==
X-CSE-MsgGUID: jnqDtds9SwKASd0kvNkSbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116858011"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Feb 2025 10:10:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 10:10:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 10:10:32 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 10:10:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+xLCKhIqzb1bWoNSPvbqERgnEvZlv5Av+ADMOWoH//4b5d3K2pdYt1FwH25OTNxmTCokdhWKacwLax/xJbCtmjhN7TlYwhUE9dbtUmUznYV4hhkddrkBdydGh4Q976fdkrucVvD6SQikBCQpymrti4L8ENWanIGWa11RvyqHOl2pl8oBqXapCFofNRRTW5twSTHOdItqlVKPdMIAuJ1WsO+r7GCEdYSWTjI53Sr1pY1tDjeqHNP7Nzwu2820Iz6jf21QELV8ELJzxRz35sxFcmcUunoSyMZwMHUD6gf1BkQROgRRZj32RF5jiyUC6JZX0D7Behy33D4A24uWhCc3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qelyoZaGg+qlyCmnyhwp6HuTTmwAx2pBanDZoqqTDC4=;
 b=Xktsmz347gUt24Kq25npiiVMRO5i6huY1lXDnlzl868bYLrReoeRVuUkohtzfvm3ztcjOC1EuVdGvOJM6Q7Lob5OcCWS199GCP/PXC3XLi7UGrPT4X1zRtrkuQBNjnL+B9JLbCb1piGP5sEo4skWDuMPca7ejq5E0JDDILsCRxMExrzDNJoPnZaSL00ItBR1kFBkAxiwdlTk4/rWmfiF7qeLWGQFeRq0WKAaE+jokDCKZUJBMrRMg6U+xys5ZuD7s9uujapl4ANamq0TpR+0G/d2C4Dm0KzUjCh8jKaYtNXvBod0FQvrcfAWOPU+RV3V/A41w508AMhOYQx1FqcdmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SJ2PR11MB7425.namprd11.prod.outlook.com (2603:10b6:a03:4c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Mon, 10 Feb
 2025 18:10:29 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 18:10:29 +0000
Message-ID: <2f1d5857-7f32-4bde-9b12-77fb2b4464da@intel.com>
Date: Mon, 10 Feb 2025 10:10:26 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 11/23] x86/resctrl: Introduce mbm_cntr_cfg to track
 assignable counters at domain
To: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
	<corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <tony.luck@intel.com>,
	<peternewman@google.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<xiongwei.song@windriver.com>, <pawan.kumar.gupta@linux.intel.com>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<perry.yuan@amd.com>, <sandipan.das@amd.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <seanjc@google.com>, <xin3.li@intel.com>,
	<andrew.cooper3@citrix.com>, <ebiggers@google.com>,
	<mario.limonciello@amd.com>, <james.morse@arm.com>,
	<tan.shaopeng@fujitsu.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
References: <cover.1737577229.git.babu.moger@amd.com>
 <30652061d4a21eb5952a1323b76ca70927412a30.1737577229.git.babu.moger@amd.com>
 <b88868e1-52b2-4a66-bec2-e0846394b74b@intel.com>
 <7375cacc-5800-487c-bd8a-7ea11e694598@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <7375cacc-5800-487c-bd8a-7ea11e694598@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW2PR16CA0011.namprd16.prod.outlook.com (2603:10b6:907::24)
 To SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SJ2PR11MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: ba6819fc-bedc-47c7-1fe2-08dd49fe33b5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXQ5MVFycWdYejdMZXBrSFJ0ek5pMzUwcDVvS1lXVUp1WUlCMFZDRjZGVXBW?=
 =?utf-8?B?bHhTdktkYnNOaFJ3RWh5NFBmcHY5VXkwLzhJSWFTR2ZFZW4wRHZJTWxObkNp?=
 =?utf-8?B?U3JvTC9XckduOEY5N25WRWlROGNjWnJ1SmR0NjBVWS96bmI4Mmw4V21QK1V5?=
 =?utf-8?B?T21DN0Z2SlhQZDRCb2ZNUmVPclZPV0duL1l2U3VNaWNhaThoek94OFdSSGF2?=
 =?utf-8?B?Vlk4YU5PcGhVVjVDdlYyZmJHUXZERXJzcDIraE1qUWlya29zdnFMS3hIYnpP?=
 =?utf-8?B?QTNDdE9PaUp4RDMxU1VZWUFkRDcvNzE4TjNQTTM1R3lONGcyMkFnYlZqVWwx?=
 =?utf-8?B?LzRLeXVscHg5akRLaVBBajVuQ2VVcHh5TVJtR0F6V1FJeHp4cG9OcERVSk9Q?=
 =?utf-8?B?dFl3cnY3MnpTZXVTK0l5Qm5sRlJEZDRBZithbk9Yd2VkZ3lzMmNXS3ZwVUpI?=
 =?utf-8?B?Y25mMlU0MGkzME10TTkvdjNTM25JbEVKZVRtbFVaZSs4dVdENEJPVmttVUpi?=
 =?utf-8?B?VnNYZFc5QWFaTWE3TTRaWk9iWStiY1E3VEtoNG1ndW45am45bDlQVkFWZGQr?=
 =?utf-8?B?WVh6c2xDUHZhSFF0dDJFNmttQTNPbkpjMG1sMm5lQ3BSVHUvcUd4YzRuUSta?=
 =?utf-8?B?bzhqSW1jc3hDNncxUUhBMHh4WlVvRmFqdXBHQ2RrcUx1TkthdlY5QmNPSlJy?=
 =?utf-8?B?UjZQYnI5RUpyUXp5MFZpUjVPWEpROS8wUFJkckNValdJYnZZNkdORm5DRWJP?=
 =?utf-8?B?T3FDNit1azRzM0NUNjQ0VzJjLzZPTmVFaG0wcExTMHNad1JsZ1FwajhBUGJK?=
 =?utf-8?B?dHBJbzdqMmtzekFTbkdEOUJ6bGhhQzgrWCtpSEdGL0RaUWxxUFl2SU9BanM3?=
 =?utf-8?B?U0l6dXcxcUJtVWk0Z0JGY3pZenJmZXRLaVArWGkzNWpwaWRMNG9OeTBQbkNq?=
 =?utf-8?B?TVRDbXo2ek9lVm9XblRCKy8vWDJ2N0UvQlIvK0ZlR2g4TkNaVVZSVnFnYlBn?=
 =?utf-8?B?dUFFVTd6S2dBSTdZSlhZbHlQY1BjZHZHZ3FubzAzSStIb3VaanZ3cE1URU1D?=
 =?utf-8?B?RHRGbDJQc2poTTViUTBRZjQ3d2JwTlNpeEdOelZWVXFQZEZucXBIT3pkWEhu?=
 =?utf-8?B?MGVXMzU3Z1M4VHBaQXZrWTRXblVZSkxtSFoxNFREakRHaFhnRDdmSnlqd0do?=
 =?utf-8?B?MnFPYU96dGRtQ0dqNUI4STdtRnpUVU9HR1kwWklnSXV4OEMzc3JzMkE4L3c5?=
 =?utf-8?B?cDJSUzBBNlNMaDZHaURJZnBpbm93RWtPSm40UjlYRnB2RU5lL1FZWGdrVUpE?=
 =?utf-8?B?TUZCeEZKVzhDemZVRUtIQzduYjdzaUV6STcwMXlEWHkrblpLNnNSV0x6N2dJ?=
 =?utf-8?B?L1FLejVRbWV4OHdXWldxalQyZXZ6MUUyOGEzeWVWM1lLeHphOS9wUGNTZS80?=
 =?utf-8?B?U25KSy91emdTRk5CZHJGRjBYMTR4MTVybTUxdXZmY29kS1l6dnQyaU9wSlNG?=
 =?utf-8?B?ci80YSs1MTJPRWZKbFAxQmZ5RUhVREhOaFRoQjVjd3BoWis4N3dQT3NPdUpG?=
 =?utf-8?B?R1gyZXRPd0dzN2R0NmVmRDhkejBHUDM5TFF4anZzOFd5L3AyNGMwQW05dzZp?=
 =?utf-8?B?S0h0UDl4d2xINXhXcjZLWW5qdDBqSmRWMzU1UDdMOHpYOVFZU2ZHdjNaeUtk?=
 =?utf-8?B?VzFDWERvQzVCRTNEaXovRk1icXpuRDA1MWZJamlOL3lSNmtlT21TUVJBYjFY?=
 =?utf-8?B?dXJyQjZNQkhyVFgyUklZSTJGZjdQYWdmOGgyTXIzZVRvMEZsZUV0d05vRmhG?=
 =?utf-8?B?QWZlMVFoWmFZTWUvWnpOZ2Z5RG91M0V0S0EzVEhHMnRiVFpSZVJZckp4UWFZ?=
 =?utf-8?B?RXA3Rk1GbjhybS8zaGJVd2hrTTJwNmVnQzJlRk1ac0tuRURRSmRvWThFcGNB?=
 =?utf-8?Q?wFeb/fbFS5w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXpYR1RBM21XSDVPYTYvOUpwcCtSOVlTaVBFbkR2RG51dXpEczJIZnBsb01o?=
 =?utf-8?B?dFVocFZpMUtYQTJaMkpmTXl4REgwSjFwTWhEdnNJZXBndHEwUXlPVkgxK1c3?=
 =?utf-8?B?NVdmQk9VbDBGR0dTWkJTdDhCUzc0NDd1SlVzUjc2MGJFQkN6ZGJqeDJWYjBJ?=
 =?utf-8?B?VVJrcHVsQU9zaExtNVJwc3RTdmFQTTkwczBXM0ZobCtocmo0N084Q01YUzZJ?=
 =?utf-8?B?dHkyNE9XR3ZmV00ra0h4T1VIRWtkYUlhNHZuaWFvM3BZcDBQNHBYQUZ3Ky8w?=
 =?utf-8?B?NXBmVEUvbFJHWTNQTElJVytuUjRGcE92VFFULzQ0a0hyLzVZcDZ6Ym85TVE4?=
 =?utf-8?B?M3NWZVVweXlLZVJJVmp2cTlUTFV1eEhNdEVid1ZNMTR4NVpQUU1CcnhkdlBS?=
 =?utf-8?B?Qm5PQ0ZDR3YwYktaem5jRUk3Y2cwUVk4UEZpZ3pQV1ZOaDZ4VXBBUmNHOXk5?=
 =?utf-8?B?VTlIV2puUzFUaDRCbWNXVjB3WkFJc0hoeHl0YWdkeUk5RGtJak9SSFowNjNw?=
 =?utf-8?B?UDZud0VIOVZkVkpBeVIwWGtBRWFJQzBkVEFuNXROdzFpc1dUVWMxSThybzc0?=
 =?utf-8?B?aGlHKzNYN211M0M2UXQvT0FZVkdXdGxBKy8zVi9UMnBDQi82a2JETXUzWlc0?=
 =?utf-8?B?N3NjbnFKMGFaZXNIL3Z3aW95SllIKzRRZTBwQWVFOGhQLzJzNXorWGpTbXBk?=
 =?utf-8?B?TFV5VGRpako3YXREZmdmSE92YjBQeGNqSlZ3a094Tkk0Uk9TVFRBc2JaUlZG?=
 =?utf-8?B?Q2FNWXRTY3lqOVFRUTlYUFlTbFJDQ1lMZVh4VE5pa1RjamJ2Rm9BVW5qdnR2?=
 =?utf-8?B?eGpxZlUvcmFNZ1RsVkFEN2haZHhpODJVVDdqK3Q0cHR4aUYwYm85QU54L0oz?=
 =?utf-8?B?dFlPTFNIeFZTbVpPRFVlSTE4cHF0c24xTDJSd3g3T0JxdHJXUkg5WER3TUJ2?=
 =?utf-8?B?WGJUOVNDYnVKb3JtNk5pbHhQdllEckhHcWlKNGhLQzFQVFJRUEJ2bHNTdUhu?=
 =?utf-8?B?ZXRGRW15ZEFjYmRieUVQQjErTUZJZE5PdWVwalcwY1FvZGN3Ti8xMGp1V2xO?=
 =?utf-8?B?cmplbGtsWDY1YTd6QnhrREdYWmxOSFlKdXcxcEh6Z3BMQlJoVUx3YnY1dTdt?=
 =?utf-8?B?TDRMMllibkdBOFlyYUthNE9WUFJSS01RV1IxdmplVkJFQUV2YTFhVDMxL1RW?=
 =?utf-8?B?NW0wdnpVKzBXcmw2WnVndzQ1ZTZIRFVDMU52d3Q1NU4rRVdpa3Z3elQvekFj?=
 =?utf-8?B?U3U3a2pXS3ZRMjVnR1lZZjVnQTU4VTVsekdRcElZYW51U3lQWWRZZVhGWXBY?=
 =?utf-8?B?d0dLa0hwaHlIdEZETXhzZG9Yb1VrRXc1QThqY0EvclVaSWhjQkFnMWMvVE5p?=
 =?utf-8?B?WUw0OUtjbE5qUE40T09rWjZKdGFGQWtMTlRJcDh2ay8rdURmOC9JUWV3T0tL?=
 =?utf-8?B?QzdqQy9ZQnBpVzZKd2Y1S1RodndlTGJOL3FPeXZKRlRpbm8vcGZwVFFYMWNZ?=
 =?utf-8?B?NkJPUERxRFZjbDIzamY0dEYxK1RUK2QyaWZoeG5KQ2ppZXBXN0tHaC82MEpJ?=
 =?utf-8?B?TUVHMms5aXBseCszV1ZMd0V2RTM2Y1NUUXdHUnRFb3JGQkh4SzRQRkl5a0h3?=
 =?utf-8?B?YW5jb3dySEFyS0xZOW9GTDQvNGhLUHB5ZzREZE44M2dCZlMzMktUU2xjRWJK?=
 =?utf-8?B?RjVGUyszY2s4QWVNd3djTGgzOHhYbnpoZnd2NlBSYzA0Yk9ueExPK3piYVdm?=
 =?utf-8?B?bGtCRW9JMG9xZXM3RjlmT3loSFhjTGhxcUNickFrL2NzVlY1VEZvQzh2RUVt?=
 =?utf-8?B?WldPbDlLQmJYWEovbE1OczdYRUVWK09vTWZzcVdQa3FhYi9kc2RrT05nREk1?=
 =?utf-8?B?TG5pWHVZUUNwbWk5V3JoMnJnd3N3NnZ2OFcxbW1MbW1ZdmdzcEkyRWtGeGNI?=
 =?utf-8?B?S1NoRGRIZURRVUozemVYRTFkM3pISkVXMTBqSFllZTRrWmxiZ2xJRUc0bW5T?=
 =?utf-8?B?M091L3k5UENMNmxPUENyRHpJOUc2aWV1VG1OZ0s5L256T244ZldzNVZYaCti?=
 =?utf-8?B?a2EyZUtqSE9Oa3RQWGdGZUdLbDJRUkc0akxkZUVpd0NuZzZlY0htMGcyZTdT?=
 =?utf-8?B?dmZZNWw1U3Z6OTlaMWthT3ZvYm94dllRZGtjS3YwVGFhSzByU1ovWC9XUnAx?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6819fc-bedc-47c7-1fe2-08dd49fe33b5
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 18:10:29.6305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hAiTvVIGBqwmX1idIB/VsmcyDbYnS5QxiAErb7n6ybSz2i4phzSJJichpbJpmUBOn9j45UdN2xJwavNoQo/uxY7jA8M6oevtkd43HVDDyrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7425
X-OriginatorOrg: intel.com

Hi Babu,

On 2/7/25 10:23 AM, Moger, Babu wrote:
> On 2/5/2025 5:57 PM, Reinette Chatre wrote:
>> On 1/22/25 12:20 PM, Babu Moger wrote:
>>
>>> to a particular monitoring group. Check every entry of every hardware
>>> counter    configuration array in every monitoring domain to query which
>>
>> ... one more \t above
> 
> Sure
> 
>>
>>> MBM events of a monitoring group is tracked by hardware. Such queries
>>> are acceptable because of a very small number of assignable counters.
>>
>> It is not obvious what "very small number" means. Is it possible to give
>> a range to help reader understand the motivation?
> 
> How about?
> 
> MBM events of a monitoring group is tracked by hardware. Such queries
> are acceptable because of a very small number of assignable counters(32 to 64).

Yes, thank you. This helps to understand the claim.

Reinette

