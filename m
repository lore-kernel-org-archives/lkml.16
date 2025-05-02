Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4965E4689
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 01:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746150369; cv=fail; b=MaalkwCq33y0sbcEP1l5E/QOU2uodJ11N9gbk/8tgTx67JUR+7GPYFWeQsdgvSE3W7F5PFVQpuGM7nhfC2v0RwgdsPjGwQ3UctHgAydkzrSpN4c6bHU2K6qq5uQzZ0rqTNk7bjx0ut040mdUoFxdPAzddRMN6nOIZpNyoGMEpbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746150369; c=relaxed/simple;
	bh=S+WogmcpZIxpcKxeUqK48JxNBeIIuPy4qgWaZvc+x1I=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kYjoHO7qTUofJxP0mHB7O3KMhChD1wUHJHeKwOPaTCjl/qzn8YAVIfSY4oxBbavLY//8Q1Qz9ogUBvIPuLDzwQaDKP9WYjpb1N4Y7U6dIXbisjJTPHu0di034WVEyYvYSIHQHfkCA02O3Sp04G+8uGr9qRTM216IKL+LOna0p/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gxAq/fLB; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gxAq/fLB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746150368; x=1777686368;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=S+WogmcpZIxpcKxeUqK48JxNBeIIuPy4qgWaZvc+x1I=;
  b=gxAq/fLB3Xb2L1yCqbwzWq9Zwt03Ym6LNczYTZwBCfwl7M33tn6Zeho4
   xr3trSHww1rrC8iYrEzgUtMZT0Mnt1bMtL7gdJJ6WMwkPPeSnDC6GvIDb
   QYEqzoGT17ednLXidtxKjtl8cnSLFPMhl1p1BDqBRuUiv5PAfGRK1pKpd
   MweNzbHPoX+Hm0NEAqAxMZ3QNTbj2rSREqbQrG6L8XCP78HpbD5tPzyLK
   mO5uiZ7PtRCCerbbCjtpXDvQMCe6w2KA+jNDncrVoCyHliFaflXGfgBNj
   Qj6j0yDedsPyR9Fodz/8N44STQ0zlUGusr0GQjMVoCGzqgHnlVLvXf09a
   w==;
X-CSE-ConnectionGUID: riDx/JSeSF2GpunvsWv40g==
X-CSE-MsgGUID: 25YJkGKUQ82QVbDTMii8Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47975617"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="47975617"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 18:46:07 -0700
X-CSE-ConnectionGUID: ZDnvHTO8RnS+t5y+VwmhKw==
X-CSE-MsgGUID: blp3XqUsRU2diCtbuQUXEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="134477563"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 18:46:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 18:46:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 18:46:06 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 18:46:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X9BsAmCBmoRe2OiXE61m7dbiKcK5Nt30ArRPbNxESbE3k/VYLygRjSnHaYVUXAFc4OrZ3lgkK8YYq/AEhdXRtU0AdoMaIVl4zletCeFlx+mQuYGOrH+aJfi1tWjLoTfxnsdZ4lASvXb7WP8xfmyv5IMFkv9VEFAQMUMDDepyAiQU8fwsBUJpUI4Ni5Qmdor67YL2hXNO5+TJ/xEfcOlz6/BFNLA4svKBvtf64QeQmi63TDtwfWj0x3jQb/zfa3aHBUwbH9LbYnZSzzjTMmB9X4aC2bf9pRvDIz+R8BhLI2bcNArKEYFhCr9xHM/CLGOMDz4uxZpcWS1ec/Emelig0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrfeQ5x/713rs5HFLWyxcG3mvFOy2Cfu2nA8QqP2Pc0=;
 b=tzJHIXvtwsJvXjU0KR8jTwZ3r3trVP+RMy3yclZ3L53sR3P0PXUwbL4Qach/c1KPk/2R4a4Oo714d5j9suY5J6z2iqnV3Fjam6THcgrCdloFLhi77I7KFYxSmjmp2UkZImGTApiyjbgEhABzTI6Z/nhXGvXfF9j7S1aiVHSYNKXckPcYdemzg+X2UNl5ODCpik4pPkpuAmXWXhnqYjiuu7nK7D4LuJpGk7w4JUmlp6NtaQyFnm728KbmSJW3FaTGEJ/gtYJn3TeZBC78Xt0tooAKcsCxy7XAyjJvR1WFcRO3JpEiDrytvo+bZXaaQCfXQAJpO1Tuke/iIlZ+34zybA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 2 May
 2025 01:46:04 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8699.012; Fri, 2 May 2025
 01:46:03 +0000
Date: Thu, 1 May 2025 18:45:59 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Dionna Amalie Glaze <dionnaglaze@google.com>, Dave Hansen
	<dave.hansen@intel.com>
CC: Dan Middleton <dan.middleton@linux.intel.com>, "Xing, Cedric"
	<cedric.xing@intel.com>, Dan Williams <dan.j.williams@intel.com>, "Kirill A.
 Shutemov" <kirill.shutemov@linux.intel.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, <linux-kernel@vger.kernel.org>,
	<linux-coco@lists.linux.dev>, Kuppuswamy Sathyanarayanan
	<sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH 0/4] tsm: Unified Measurement Register ABI for TVMs
Message-ID: <681423d71d60_1d6a29488@dwillia2-xfh.jf.intel.com.notmuch>
References: <be7e3c9d-208a-4bda-b8cf-9119f3e0c4ce@intel.com>
 <015cdddb-7f74-4205-af8a-b15cad7ddc22@intel.com>
 <d8f3eb33-d902-4391-adc7-005e4895b471@intel.com>
 <c7894df2-2b27-4f67-b428-3eca312503f9@intel.com>
 <c2cf2184-7753-454e-ac99-8c4f3c9c3d16@intel.com>
 <01fc0997-a0e7-4086-b0aa-67b4a51b328a@intel.com>
 <12ed2ab1-e97d-4a20-8370-8c60cabffc77@intel.com>
 <ab2036d5-5b6f-4fa9-995a-fba63c0a5209@linux.intel.com>
 <f4d344de-70c2-4fd4-bb18-2912cf0f3f98@intel.com>
 <CAAH4kHYq7_3vLXQaCA7iKF+mC5Pg0cn-1FsB-iCbN7Jim9a-OQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAH4kHYq7_3vLXQaCA7iKF+mC5Pg0cn-1FsB-iCbN7Jim9a-OQ@mail.gmail.com>
X-ClientProxiedBy: MW4P221CA0008.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::13) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|MN0PR11MB6135:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a3cf158-96ce-4452-cdd6-08dd891b18d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmlpS25xY2FCRXFjZlg5V2hkN2RvVmxxS0xIVmxFd1pPZmVHN2svUlpTblgv?=
 =?utf-8?B?bGNuOURqTXZuYlJjcElxSjR2eU0wMnFoRkRIZlo5OHhRQnJ5YXNxRVZBeE43?=
 =?utf-8?B?MEVoWkZPN29wdVdZZk03alJDRFlMMmh1TlQ1MElMS1ZYRlYvNHVVRm5kR3dR?=
 =?utf-8?B?TGdmTE9IMHJUYnBiZmk4RWd2QWxsMVRNK0JjeTd4WEFvbzFDZHpTS0NSbnVW?=
 =?utf-8?B?emwxVXF3ZzBIY2dCK0lqdkdYRnBPa2E1VEhxVVB4cStRNmExNzhTYmU3U2Jy?=
 =?utf-8?B?UFdLTGJ1b0xSWG55UXoxc2FMODdmd3Y5bGRjRi9MelpWNnlYNVpXTy8yMkV2?=
 =?utf-8?B?NkwrOEJMMWZidGxka0hKcytZNkZoakRWTHFYYmZrS0VhVWdTWDlNaVUxTkF6?=
 =?utf-8?B?M2hYUkw0eVpxYmNkai95RGxRMEtLdE5zTFRNd0trUmJGNEVPT2dhMGJRVXdP?=
 =?utf-8?B?WEEycE4wWC9DR1p6WTIzY0Z6dGRsL0dDSERYK0pwU3BHUWNpcE0vZTJLYXgz?=
 =?utf-8?B?dllQV3JxaFAxdE5aNHY2TkR5aFIwZFRuUkpIVXRUMG9QZU5Dd2w3KzdoMFpi?=
 =?utf-8?B?bDIwZlBPOWF5V1QrRTZYVzc3VG8vK3U5NXhJNE5Sejc3allXamlXcThnelM3?=
 =?utf-8?B?VW5wY0s5eEJ3by9pNUhKcTVCOVhiQmhLVGF1ZkNjRkl5VXhzdDJtaUIwMGpW?=
 =?utf-8?B?TG5iNWRsVEpFNFo1MGo1Z2MrRFQwN1FPT29YK3VENVo4VUlwL2xkSkU1UWxY?=
 =?utf-8?B?cDU4eXd1c0l0STY3UzNOa2NGMUorOWkraDRXbURiaHdwMWpGUnVsR1Q4c2lL?=
 =?utf-8?B?NytvNGx3UU9pQ3Z6b1luNHFVbnBKK3RTZyttSGVHd1BkUlhUV2h6V2tiSGRV?=
 =?utf-8?B?NFNEbWhqMFR2MFlvU2srWncyZWxJQVdwTTdha2tZWGxBMEgxYUlUUEUraVhk?=
 =?utf-8?B?eXRhZFZ4ZUVRek5IeHJ4UXdOUGNqUTBBUkVHVStMMmo5ZFQwYVJiZ0FpM3d4?=
 =?utf-8?B?S3NSM2JNdWdCUzBMbTAvL3hJM1BIYXBBMDJSYUFqT2prQWhDRFpoejhrN2Zl?=
 =?utf-8?B?SHVWWlcyVUkvZk9CREh6WVM1a3d6RElsb1JrNk4vQXBFOTBXbFpvcnplUWth?=
 =?utf-8?B?TTdqNWVpRUFpQ0Y0MVBUdGRQT2tBeFF2SXAwY1V5K0RIMnpYNGpld2RUZm5u?=
 =?utf-8?B?UzFYS1BKSG1XMUdLdnZxeXplR0R2L3ZzWXlTdDIyVHkrNlhMYlhXOG9nYjlL?=
 =?utf-8?B?NXFKQXU4MWlRQnhEYUROWUhYZnlNNU8vb3FVUWdQb29tU0c3aDE5L3cyb0pY?=
 =?utf-8?B?WVdXT1ArWklnRVNzY3lSdlRTRkpUdmw1bnZYQUVNQlQrbDk5RmRnQ1VSNnN1?=
 =?utf-8?B?WEUySVBOTVZpd3YrMkFWK1BTN1pZZUZCZDgrdG4vUUhpL1VHTWw4bEp3bitJ?=
 =?utf-8?B?Y0JBZjVJZTd2VzVoUDVwOTFFZ2xRNUgrNDdrSEhOUFErMktXZFRIZkNjd05P?=
 =?utf-8?B?YzNRVXBmZkhQZFFMMDg0cEkvMWVXZkRYdlhRZkdBMXlrVHRNMTFOVEhyemFT?=
 =?utf-8?B?aVpuNmtZZTRoMU9XYjAxVE16UjdYMmhXVFhlVzQ2b0xEUFlNYkZvQWRWUFow?=
 =?utf-8?B?M0hxQ2xLMTliWW5kTVVXTlBZVGhZOFpsSXBIUm40dW9nOWhXanFIbEh0Wkt1?=
 =?utf-8?B?ejFRcVRrUFhKSXR3M1FGRGhpMTZqY2YxVHRlcTBZZzZlU21OcHh1VXBzdEtD?=
 =?utf-8?B?bVBoY3gvdjBTYzFUUitKUVNHQk80Z2xvUTZnMWN4UmhqNnB3Vmdya2dnUFo2?=
 =?utf-8?B?NFo2aFZPUnQrRkNFU3l4Q1lIbjZCTnNYSVYyUnlyS0w1Vndod0txUUl0R3g1?=
 =?utf-8?B?bWFnanJiTi91dmhjQ0poYWdieVh5bktJaW8yQ205Q0lFUm9WNHlhVFZZMUlI?=
 =?utf-8?Q?Lp/cAGtWApFUMDqnVnWne7liMh/UeayA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWluMTloaTF4eGd5NnFlV3liQ1BHNWwrbjEzeGJVRzRWdDY5MlpZTmpSaklN?=
 =?utf-8?B?NE0rVVVOcFlhWjBGa253cmtGNkQycStRY1RWM3NKQytpbW9PdnRKYzl4d09N?=
 =?utf-8?B?d3NNRHErLzJuaEhlOVZ5U0djbTU0ZmQ3RXNObXpMcUIyNmxaQXRESjNOTzRI?=
 =?utf-8?B?NnJFMlM0ckNHVm4wZUUvWmw0RTl5dWZ0MHdQREhWd0h5Y2ZzcVJ1V2w2VHp6?=
 =?utf-8?B?K21zbHJqQjc0TGJFWnM1bFlGLzRqSzl5b2NkLzloKzdMWkNQMlNlbGp3d0ZX?=
 =?utf-8?B?Wk05UlUwRzF1QXBDZGwySlFOQVhicXRaamxIek0rcFFjMnBvbnpMSFRHTFJh?=
 =?utf-8?B?aVk0NzZtU0wwYVV4ZzdIcWMxK2FmSFJRTUgyYlFqc1ppVCsvRk9RYmFPSHhl?=
 =?utf-8?B?QmpSSFhhVmlmM3hTTnlIWGJiWVNtaXY0UGh4KzUwbmR1N0pRRzJ5LzVNREVi?=
 =?utf-8?B?MWt2Ykh1ZFNUYjNtNDV1UU92RDNrcDVBY0Rrc1h3c3lUMGE2TGNmQmRoZlZR?=
 =?utf-8?B?SFE0TnZwWHNxUnB2UUl4RjNRVXhpNFg2OEhING9MR0VjeU0xMHN6a013VEpi?=
 =?utf-8?B?aWpoYnNhSTRqaTVTNjczc1ZvSE93eEdpSHFFdmhHa3VxalFzR0QwWDk1TTRT?=
 =?utf-8?B?TXE0SjF1QjduTWF2cTFUR2VJbkJVQmtIK3VZL3h1SHFYMG54d0FwM240Rzhp?=
 =?utf-8?B?V1c0QUI2Nml6bzFIUW0xSGQ2OCtGdWVST2dVWUpobTM3MTV0Ti8vMXVncCt5?=
 =?utf-8?B?TWxjMmNZUnI2YWVGblRJN2h4NFlPRTFCVVJHNHJtbHBGY2IvRWQyV0RNeVBB?=
 =?utf-8?B?Vk56WUc5VnN1TjBtNUFWQlVLWVZISWZHcmZHMXpOVlV6REJ6Z3hyaTdWRm41?=
 =?utf-8?B?NHdNMW41aUMwNUhIVmg4VERFMkRaclpJUXZDa3FiaGZ0ZkpTQyswQ2V2M3Vx?=
 =?utf-8?B?a0NKbHNqU1drZmhxTDJLUjBtVDErTFdnY3ZlNUV0OHUwbWtreXoyM0V6S25Q?=
 =?utf-8?B?WWJrTDZUUUpjc0hwbGJLeEpva2YrczNBcTRrUDVhTUFsVkJuUk00MGJDREUv?=
 =?utf-8?B?c1lJVzdwaXUrb3lPSVBEQitQblA5Q2lIa1UzMUUraTFaekpVbjQ1YUh1cUdo?=
 =?utf-8?B?WlltNEYwNnJNSVZsOW1SdGRtUnJsdjI4U0pTOHdBZ3pCLy9ET25VWmNCYXZi?=
 =?utf-8?B?N1daY1hYMUFJZFAwbi9xS2c4bkFzSzQrbDIzejBoWmNYVnJtak1KN0VJTkZ4?=
 =?utf-8?B?TXRNSlhXczFNd09OL25mNUVVb3YyalV6MjIzWW1vLzc0T3dINFdGVms1c29w?=
 =?utf-8?B?TlNoZzdzeWh4Myt1TGFKbzdyMHprdnpnVFRqVTVsTHRaOGphMHJRTE1UZkVL?=
 =?utf-8?B?ZFNmNWF6bG56YUhqSTJtT2M5bjhwbE5mdDFaa1Q3bHNPd3BjVmtlK0VJNGND?=
 =?utf-8?B?RE5IU1lYQk1RVjdWV1UxTC9UanBDTnV0b3FyM2NhbHJRcUpIbHVKdDA0cExh?=
 =?utf-8?B?OXhuQ0Q4RlpiTjh0QzhqVEl5aTlMYUtQdS8ycUxRT2lwYnUrWnliQ054d0du?=
 =?utf-8?B?N0lLejFHQXVTWkpLQVpNVjd0eVlNQld1VzhaQmVJMFVaZU00TGYzdVd6dG55?=
 =?utf-8?B?ZTdCeEUrQ2ZBRXlkaWZ1aFJpQUFsQ3k3SjY4a3ZiRnJ3Nk9FSWtQZXFpWXhl?=
 =?utf-8?B?ODd5S3o3WU1tT2ZWVGFhYmVoWUw0T1cwYm14c0xGTDdkWFVCQjJUMFEzLzVa?=
 =?utf-8?B?azdBOWpHM1diRng1KysweDM3c0RpWDdEUFJwL2VoQmlzZ0w5dHBzODVCSG9n?=
 =?utf-8?B?NERtaTNMYU1vL1BrTkZZeGpab2plZWgvQWtBL2k3ejZuNEoyK3E4OGo0TVRk?=
 =?utf-8?B?M1A3ZkRjZkhjOXkrMm12QWpDNVpIaVNySHhUVmNEVUFvSmFkOVBHbTR0S2Qy?=
 =?utf-8?B?RS82TGZLWGJWbFJUaTM2R3VsZldQZlk5ZDRNSVNwYlM5eVk5eWZjM0pRcExC?=
 =?utf-8?B?Qmo1SGI2ZmpKa1o0c3ZmMU9ra2plbXdrWmF1dWxYYUhWZExTQ1ZjSnJjZlhV?=
 =?utf-8?B?eXA4QWozNVVJQnR3bjlhQlduRXhCalgvay9Lbm53eVZpQ25uY0lJYWMxSFdn?=
 =?utf-8?B?YlF6TU5EZjROemlvVzlOQWJPeHJMUmZCZjIrbFJnUVpHT3Fnc2ZpYkxuNG51?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3cf158-96ce-4452-cdd6-08dd891b18d0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 01:46:03.3133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vNgD2I60wiAIhUjJmmebIjYPxLjgrgn7SSe6AGw1xlPnV1+Z/+YJp/mkXZ7Tbjw4P/pppRE7SMg2DEBzND0O4JxnqgdjEM8xHuHaX1fb/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6135
X-OriginatorOrg: intel.com

Dionna Amalie Glaze wrote:
> On Tue, Feb 18, 2025 at 8:57 AM Dave Hansen <dave.hansen@intel.com> wrote:
> >
> > On 2/18/25 08:25, Dan Middleton wrote:
> > > One common reason is to _identify the workload_ running in the VM.
> > > Typically a VM attestation tells you that you booted to a clean state.
> > > It is much more valuable to a Relying Party to know that they are
> > > interacting
> > > with a trusted application / workload.
> > > Projects like CNCF Confidential Containers [1] and Attested Containers
> > > [2] would like to do this.
> >
> > That's a _bit_ of a different story than the series author mentioned here:
> >
> >
> > https://lore.kernel.org/all/be7e3c9d-208a-4bda-b8cf-9119f3e0c4ce@intel.com/
> >
> > It would be great to see a solid, consistent story about what the
> > purpose of this series is when v2 is posted. As always, it would be even
> > better if it was obvious that this is not tied to one vendor or one
> > architecture.
> >
> > If there are actual end users who care about this, it would be great to
> > see their acks on it as well.
> >
> 
> We would like to have this for Google Confidential Space and Kubernetes Engine.
> 
> Acked-by: Dionna Glaze <dionnaglaze@google.com>

Safe to assume I can carry this ack forward to the latest iteration [1]?
This is as I look get this into linux-next shortly.

[1]: http://lore.kernel.org/20250424-tdx-rtmr-v5-0-4fe28ddf85d4@intel.com
