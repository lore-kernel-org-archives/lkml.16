Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB42F222575
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739201017; cv=fail; b=d8Kn8pvM8rdlpAzYlQV1zRBX05OtvNStInoF1dfNXMfazvCR0cLIHanstadPdZ1hyVbgpA89PTK8cYmb5jTreAY5nIlnn7GPz7OKtNStBsBFtrddPtGRLcXrEWrdXXjJ9z4rYC5k2iL6NI3XemQi8lMfdsGPARgusYN/jScxHEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739201017; c=relaxed/simple;
	bh=RFtyEfznSa/0DXHZAdDKMUF/Sv99eZIaRNeOelW+BIk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hY2MPCZydSsZ8VoWDUrut/M1wXn8+V2+RwEhkcZQI96gON1xuvdzA5ORxGlPyxuwVLhCIGaEfKwdPnUn7qVQrQ2y/A4BOJD6V6xuRaBtPUU2be3dxpGhhqYizV85xQyMdOinjrH5/V1vrCD5bSlp3SXfcrCdXh3WOqH1GyP3Mrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=adowa6CN; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="adowa6CN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739201016; x=1770737016;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=RFtyEfznSa/0DXHZAdDKMUF/Sv99eZIaRNeOelW+BIk=;
  b=adowa6CNZT8WU8h5dpRJx6W5szM835XaKBWWmFmJDiiSvN/ZeHVtw1N+
   NMZkSyvB+SEnCa/tipuRkANiuz3BBtP4ve2kGbNWdcy0rSzHMV6jQBpM+
   opYb5DIGB62a434OLW4TbieWPchzKFuJCqsDIoGLB7eMYMxNifbUxsaw5
   Vk2cefIatPxAI9a6eVYJjluPCYbUgSPnLVL+Kz8VzFaeVNM14qy8kc6TU
   0Q6a1suNtCnnc/RYbJZEsVaQqopZTIlsFbyY+hcG9SFz+UgH5LA6vu7mY
   K8v9nAZp4GPL7smRhbG7gaPKJZAfD3XsSrnAZ8fYVIJA5bG86tA9oXRsj
   Q==;
X-CSE-ConnectionGUID: 8bkO2jPsTH+FGUppj+VHjw==
X-CSE-MsgGUID: 9HSDg968QxG22u8gJ0Dygw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39700042"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="39700042"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 07:23:34 -0800
X-CSE-ConnectionGUID: SL112yZNRDW9ZCRDKUIS+w==
X-CSE-MsgGUID: SUzTqhCZRt+0T6jzQwaZVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="112169206"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Feb 2025 07:23:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 07:23:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 07:23:31 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 07:23:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZfNz/tpp0PDt3D8H1qqYJ/mc2C1iH9Ag31ByTDQc3LmityqR4HFm16ohuibLy3j0QGW/7ggEuXNFda5Q790r+HkcDbiGcMZYZ5xFYllgsxKi63cCXvtO4iLhIEtD7O6vhA0SvJCm9xSmucJE67swBnsjsm4ODJBqgeR8iAdK3fN97vwjVrUXFsRslZi80asqaY9PetYyCdiZ40mNbiNk62OGJUZBdE989dmnD0jmJjBKOqhAlKgNUpJYisv3vDePdIZ+/PSIYByz1lexk30QNTuLTmY7f8DwooebA7dwLRpxg8rnZG2Q1+ML4d7Vuja/shNWyI7wx9GwVE6KDm2mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHyHuZ+A8N1s48feZVsRvxC0J9JrnOpJ1SDsyjoWO08=;
 b=BC06CayGkIvJKeEuB6jZ+H9YiHYCg5ij/xl+VaofNQ6D/KMgG3IozkhC4gDEPLmeLTYohkYL6BZVGhPnWsuvCJeBVjf3E9f5DytLNJgUeRHBvu5oQM6M+Bco4xVPMR9banToq+8R/quaBdMYecpqEEq7M0ntuwBOr06OIaYjUYe1gddNZssyncWopSCU8+6F46tqXVhy5cN1VP7wRvpsy4dnB+MtqLNXqBj9LlV2J43NNEhoFNGQS33qPyi2xYj2G4w+y2mYXzV2Zki0rzfB3103f3dg0NHwL0FgeA+QM42NGrDqHLwwcPzycI+DfxiQSFIaPP2p8UsCnb5X9QF7oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6231.namprd11.prod.outlook.com (2603:10b6:208:3c4::15)
 by CY5PR11MB6257.namprd11.prod.outlook.com (2603:10b6:930:26::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 15:23:12 +0000
Received: from MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4]) by MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 15:23:12 +0000
Date: Mon, 10 Feb 2025 16:22:41 +0100
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Andrey Konovalov <andreyknvl@gmail.com>
CC: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>, Andrey Ryabinin
	<ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, "Dmitry
 Vyukov" <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
	<kasan-dev@googlegroups.com>, <llvm@lists.linux.dev>, Catalin Marinas
	<catalin.marinas@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon
	<will@kernel.org>, Evgenii Stepanov <eugenis@google.com>, Andrew Morton
	<akpm@linux-foundation.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/9] kasan: sw_tags: Use arithmetic shift for shadow
 computation
Message-ID: <e7t5yzfw3dq5stp5xjy5yclcx6ikne4vwz7d6w2ukfw2b7gr6t@oomoynf3b2jl>
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
 <20241022015913.3524425-2-samuel.holland@sifive.com>
 <CA+fCnZeBEe3VWm=VfYvG-f4eh2jAFP-p4Xn4SLEeFCGTudVuEw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+fCnZeBEe3VWm=VfYvG-f4eh2jAFP-p4Xn4SLEeFCGTudVuEw@mail.gmail.com>
X-ClientProxiedBy: DB9PR05CA0027.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::32) To MN0PR11MB6231.namprd11.prod.outlook.com
 (2603:10b6:208:3c4::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6231:EE_|CY5PR11MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: c1d7d9c2-63aa-4455-1d31-08dd49e6d502
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djZvMXFsZmdETjlMTVFCK2JkUHdWemxrNndLRXh2ckNoVE50NWhYWGhycFB1?=
 =?utf-8?B?Q090cjNzSHFkWVFCSWwzalZYSkE4aTh3aXR6RUkwaWM1UzNBY2hvN2huWGJz?=
 =?utf-8?B?RmNFZE9reTl6MC9MQ0VtbG0vQlQzdGRyQkJVMG4vazNtbVB0V0Q5eTBzNWda?=
 =?utf-8?B?eWlBZ2hDTTg3a1IzelRhS2R3VDBtTEhPU1dlUU4waGJvdjJUb3dkNW5EdWZE?=
 =?utf-8?B?NWE5VXpuSzZyODRQQStzbWd6cnRWdnFQQmRKL3pkYVdjU3ZYU1o1MG9FeXJR?=
 =?utf-8?B?d09XVnVBYVdGeHZQQ0FiVGlaeXBpcFpEeG04ZDZOdi9BQjFoUE9KRVNXUGd6?=
 =?utf-8?B?TlNUb3BydzllK2lJRlo3NHVpa2NidkNiOW0rODJiazF4R3ZaMkF4MS9oYWFs?=
 =?utf-8?B?VXpyeHRyUVhjQVVVbTNFK0dvMmxXNXA1RVZSNy9QUDhFQ3djdGZJeDVhT2JK?=
 =?utf-8?B?NDgwM2hDaUZmeEd4ZkJhdjRIdFNTM2JkcDFoMEFyeGYzTkcrZmxOVGdjV282?=
 =?utf-8?B?bWpYYWJMT001SGhBMzRQT0JscHZ1SGJJb0EyZzJLditaU2pLZEVabjREMjY2?=
 =?utf-8?B?VmFDSzU3bzJ4U0pnVFVWak9zQ2lsQmgyQlY1R25xc3k5UW9GanVuenM5RVNS?=
 =?utf-8?B?dlhPVmVtRnZ1UWhqOHZzNTFlbUlDbzNtb0M5S0YzbzVQQ1Q0Q3lVUFRnNThz?=
 =?utf-8?B?dlFmUGtSWkNvY2M3UldNWC9XejlaVE05VnBUbVIzTlkzd3Z2cXpuZFRVUGt0?=
 =?utf-8?B?SjNEVXRRNk9QSDRYS1Z2dW96RXdRSDUxQnVrT2Rlb0s3ZzdHSW5rZ3F6bVFu?=
 =?utf-8?B?OTJsbThJdHlxNnRSZDFrRi9tSDVMVUI4S1RQZEpMRWYra3dibllqNWpCeWJR?=
 =?utf-8?B?eExpTy9DbE03RFN2b2owODFocUN6YSsyVWZhcmVqNEl5TzhPR3Y0bWdYN0F2?=
 =?utf-8?B?cHJDS1VmSVJFdkRyZUNhT1NQbW1WQU10SHVEck9vSng1UnZlb0huSU5XUDlZ?=
 =?utf-8?B?SityV2ZNY05hOHRlUDhDRWFJc2hWK3N0N0VtbkpHMTFCbW94c3VBNnNsK0Na?=
 =?utf-8?B?bTArVzRSZzRzS0tnTTNOVFppNnczWlR1QWdrVXJnNUJzalJ0R3pIc2xNQXFv?=
 =?utf-8?B?bWltK3lLVVVWQnVnZWh1d0hGVC9sa1k5WkRYWDV2REFKYTlZeHc1UzIxbHdx?=
 =?utf-8?B?NmxiV0lVazM3Y3kxdHRWU2dhSmNlSGNzaFpBR3pXTGZxK2s0SzhtUFBnUVNC?=
 =?utf-8?B?VWM5K1JWMjlYVEVCb0wyUk9ES3oyZ29ScldrMFNSZDlTaXFXS0lpWWhlSnNq?=
 =?utf-8?B?TnBQNXNuSmJLc2QydTZYNGlJejNGSzVKbnhXTEJZM3RPZDVxNXd6QzRxWTI0?=
 =?utf-8?B?Y3FiNi90YWNja3pJMFkxK0tQWXMxN1Ixa3Rtblc1VE1YVkpqSG5PODg5dXow?=
 =?utf-8?B?V3BuTUp2SGJmVmx2SzA3SGxWRm05K0ZFYlpudG9yYXRGb3ZLYXhZM0MyZGFY?=
 =?utf-8?B?UTBqZk50cm1XYmRDajhCZXQ4NjUrSFN5cVRyUUxzTDNuV3NXK3MyUmRYTy9W?=
 =?utf-8?B?a2pRdHg5UEt3aE94c280S2F2eE1TbU0yRFBqb0dYdlZaMUwxUUpwbmdwVFRu?=
 =?utf-8?B?RzdrVjdrQzAyWjNuLzNMT1o1VEVWNTVydzhRTFFyWjZyUlBtQXYxb2RYamRY?=
 =?utf-8?B?YnVTLzZLN2tySXg4L1JTbUwvTm1FMU0vcUtyT3ZLQ3MybHBGbzN5S0RsS2l4?=
 =?utf-8?B?eUJSZUlLQVBGS1B6UVkwdzhGdFR3VjJWTkRPYm9VaHBIY2ZDWTBOYm1tWlJ1?=
 =?utf-8?B?RERSbFZGTk5jTTFXcWkwVGg1VUdLY2U3dFVZQ2l4SUE4ZTRadmt3T1FXZ3Jj?=
 =?utf-8?Q?NNR1Bj5wwn/kU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6231.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDh1cDd0THJ4VUFFbmFEeWdPcDZiajhocnBYaTJvQUV4aWFmdW5ocUtBUzVj?=
 =?utf-8?B?am9uWXFxeDdVNy85QzJ0SVRTYjBNc3ROZWhqTTdZOStOOW1BNExmcWNyMEcw?=
 =?utf-8?B?Y24xMkw4RFFNU3A0ZjhIVFFYb0VuT1NkcVdpNkNLd2Q0Q0xuSnZDdDFOU0Vs?=
 =?utf-8?B?U3BMZWJCZnhaS25vWlliRnVDbktWNkRUU3IvMXc3N0REaFhwNElBMzFFaFY3?=
 =?utf-8?B?aFVDeGlnc25yLzNMb0lyNGVPUWljcHhSVnE2QVJxWUw0S0lPVnVlQzVHd0tH?=
 =?utf-8?B?RzlZcGt4NjFnZnJ6MUNRMzZjSkY2SkgvdnZGa3Q4YXprS2tXakIzb3pZcTYv?=
 =?utf-8?B?QWQ3cG9jWWhTNjM2RGxrSGtmRWF5QjFKUGZtcmlBZm1VY2plRkhVMUVjTlBt?=
 =?utf-8?B?L002Mld0dUZVSkx0UUpPN2lwbzRicnpaYjRIWXRRS2g5MWcxMUQ4Vk1QQVcy?=
 =?utf-8?B?RnBXSXh2UVBrODdkZEx6ejgyMTJ3aU5aK3phZ0x1bHFCWnVwNGZvallBbjNV?=
 =?utf-8?B?K0orQ29BVUVMc3JuZTFxTTRWbHllTy92WEF0amZVdjNjV1ExNGlkN1Ayb2tW?=
 =?utf-8?B?S2oyTC9UOVRvWVJvbjVNbmE5MUc5aldPRy9VV05NYXBjZjgxUEhVTjl4OTVJ?=
 =?utf-8?B?SzdUemZCQ2hhTUZKTlRTQ21lSFZMbEo1ak5YRzNoTWlMQzFFUmh0dEtTbDJa?=
 =?utf-8?B?R3piRUNETzlyWWRFUU95NTRHRFRmTTdRUG5zZVZYOStIU0E3SjI4NjIzTTNV?=
 =?utf-8?B?T2ZOTnUrRWlLZTRWdHk3OXJjaDBEaktTTzlpWkk5T1NHdEtHRjVRNTNCV1or?=
 =?utf-8?B?d3UxNDRnZUk3SE9sNSs3azNOSjRQOHlOOUMySWhud0w2K0VQaVliQVJkV01S?=
 =?utf-8?B?L24vWnN6UEI0cDE5bk9KaDI4RmhreDh3K3NFbm1ENVNIRDFsM256Zm1mMGsx?=
 =?utf-8?B?aUJZb1lJSG9VSHZUOE9FSzBZRk1hTDRXZ1hkSDZ6YnB1QkwxcFYvWDRxNTZD?=
 =?utf-8?B?T2NEdzBGSnJteHBVQ0Z6YVZCTFNucC9UTnNmSmRpVy9SSnlMcTJUc0tmUUZK?=
 =?utf-8?B?MHgwVEU3dldZM2J5NUdxaExUV1RjWEc0c1I0Y3FvME5zUGRtNWo2TG45VFZm?=
 =?utf-8?B?K1h4Q2JlandwZURBRytPMVdnZGV3cVFXZ3BLNlgwUE9IMWRNQVVwYzNRWk14?=
 =?utf-8?B?TlNJM1VyNjdCeFkxK1d6WlR0bHEybmkyRU5YckF1amJKM0xsQytkZ1kyVGQ2?=
 =?utf-8?B?YXlOTVdqZEdPUTRjN3ZTWjRiTWRjNllCb1RDVTFsOHdpMVU5V2N0RE5sWUZL?=
 =?utf-8?B?MFd2QndWb0szWHJkSitTNE1adGZvYjJlblRJS2xxTEV1bnk2ZWtxNHNTdkVu?=
 =?utf-8?B?TUtWQmg2SFhsT2lGY1BIMDFVaFJiSnNKSC9XV0g5bHJKYXhIYTRQV1B1SmxH?=
 =?utf-8?B?cVdIZ3lPQXEra2dZM2ZBaXZPVXd4c3RQR3NPcTh6cWVhN1FJMGdmQzhvQXFC?=
 =?utf-8?B?R244aVh4Z0hwMjJvclRaTVRqTWJLMFFoaGVSNnRWTnNMcFF5Lzl0dDU0d3dL?=
 =?utf-8?B?MXFmT093ZG5YbVE0RElhMG40TXZrR0J2ajlNSVA3TlpldjhjVnpnSTd2RC9n?=
 =?utf-8?B?TFNWUFFLVnQ3SDRUU2hlaS8weGhEczMvZERYaDBjcHNBcVJxSE4vVUt6dUpS?=
 =?utf-8?B?UHEvaWMwOWkwYWNiUW9EZUNyN09yNUJEeFU0OXA3YVlKZjJXdlBjUnJCcW9x?=
 =?utf-8?B?K2pPd0ZoKy82SDVtV1k4T1R6TjkwV0hHNStqRkNhei8wSHlQdnpEc1VyaTlt?=
 =?utf-8?B?Q3VRbGRiU2ZLYURHbVRoQkI0NkZ4SE8xeWcxdlh5R2UwM285R0VLcEI5K2hi?=
 =?utf-8?B?ZjZseUtiR2tISkwrZWhEKzh5TjdVSkhTY1ZkOVlJajlQVGlTTDhSN1pBeHdD?=
 =?utf-8?B?aExrRHc2YU1vSHRQNUR4ZGFndldKcmlsZHNIalNpWS9DMEV5UThhMmNNOVBC?=
 =?utf-8?B?T1VadDEvTkJGU0w1N1lCRDdlczM2QkJYNlJRQ2pZZXBjZTljaHcvZjRyWjNX?=
 =?utf-8?B?Q05TZmdvWU91SjBZSnRBSXVZa0tpakNWRFg0VVU5YlBpdlVXeW02bHExUnA0?=
 =?utf-8?B?Y1pJaHczMDNieHB3OENVVkh2TE9mVTFhQXA4OEw1S2MvRmsrVkRJQWpQSGJK?=
 =?utf-8?Q?j0hNqp8spRQfF6EFFA6+2vo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d7d9c2-63aa-4455-1d31-08dd49e6d502
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6231.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 15:23:12.4401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ll196ZK8u1OAxVtdGC+oyBfK+UZmWP3yOSmWS2BJ5l5Ip4d9txHr+SMKeo3lerMjJw5bVHNtxXaDVdMbSj59sDLybwKz5+cOvAvvSPdDe2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6257
X-OriginatorOrg: intel.com

On 2024-10-23 at 20:41:57 +0200, Andrey Konovalov wrote:
>On Tue, Oct 22, 2024 at 3:59 AM Samuel Holland
><samuel.holland@sifive.com> wrote:
...
>> +        * Software Tag-Based KASAN, the displacement is signed, so
>> +        * KASAN_SHADOW_OFFSET is the center of the range.
>>          */
>> -       if (addr < KASAN_SHADOW_OFFSET)
>> -               return;
>> +       if (IS_ENABLED(CONFIG_KASAN_GENERIC)) {
>> +               if (addr < KASAN_SHADOW_OFFSET ||
>> +                   addr >= KASAN_SHADOW_OFFSET + max_shadow_size)
>> +                       return;
>> +       } else {
>> +               if (addr < KASAN_SHADOW_OFFSET - max_shadow_size / 2 ||
>> +                   addr >= KASAN_SHADOW_OFFSET + max_shadow_size / 2)
>> +                       return;
>
>Hm, I might be wrong, but I think this check does not work.
>
>Let's say we have non-canonical address 0x4242424242424242 and number
>of VA bits is 48.
>
>Then:
>
>KASAN_SHADOW_OFFSET == 0xffff800000000000
>kasan_mem_to_shadow(0x4242424242424242) == 0x0423a42424242424
>max_shadow_size == 0x1000000000000000
>KASAN_SHADOW_OFFSET - max_shadow_size / 2 == 0xf7ff800000000000
>KASAN_SHADOW_OFFSET + max_shadow_size / 2 == 0x07ff800000000000 (overflows)
>
>0x0423a42424242424 is < than 0xf7ff800000000000, so the function will
>wrongly return.

As I understand this check aims to figure out if the address landed in shadow
space and if it didn't we can return.

Can't this above snippet be a simple:

	if (!addr_in_shadow(addr))
		return;

?

-- 
Kind regards
Maciej Wieczór-Retman
