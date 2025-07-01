Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D65C4A0F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 17:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751391455; cv=fail; b=q4XXLQyp/FJdmEqUDj2jrw39KYHej/YGsCofjCHjVQS8Ny4JQECsK/VEkB25UgWyYqEw8XeZWG12Lo/g5Mup5Bb/qs9cnFCBnGnaBBb+AFetnpKny2GK+4xaN0fXPjk5yPL5jHuFsb3zUX29ROfiwvD+vqt+G+ncbcFx18RqX4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751391455; c=relaxed/simple;
	bh=zLEgTxIWzA15nusWjaNnSpxpyIvRd9kXH8jGOOG9kF0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=D8lRXL0Vzf8qhuwO3ctZgoI63NWGp5NUZt1vd7c+DmALGyOFImW9NEIdQeStb+INp9NfZyPiTGO/0lrZ4cjyHb4uOLHO3bGlXdg+5KxyBfLCxTKhRXSdlgTYFEB2LpxRM1jd/6EhQdGFPVr7uDsJ6KLVbYqkdF4P+e5okFL815A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ET09gHei; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ET09gHei"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751391454; x=1782927454;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zLEgTxIWzA15nusWjaNnSpxpyIvRd9kXH8jGOOG9kF0=;
  b=ET09gHeiO0Cg/vqdrLh6GHdn1yCGhJQwurMywWhHJrlYidok4WSk6zmC
   u1dvQUa6yXna7RQuhw0HctXjEN/qrjsPtAxiHT3/OW1c51SKFECjr447T
   79jTprI7GYGQ04PdRJu44Hdb20phd9VrG4aSKIjdUa6g1/ipyiuKe1YqB
   RDpcUpDsCnqHjC0knwbu9p84LAqxO2xE/bV3M3Zbl0LilgBz2mi4SodK5
   QaeQxnONbiBjhMes840jfOlpDejLwzxMTmH/1HrgpPukp+3QFSI4bITm4
   UT3BB0lzTFgJQx5jqqHzUjFPvFXa4jb2L1KeQducYryQ0kHzeDRLNZdzc
   Q==;
X-CSE-ConnectionGUID: g9qngA8ZQlGYXYQB8b0eMA==
X-CSE-MsgGUID: S0T0ZS3bTXG2cneQieX1sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53813686"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53813686"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 10:37:33 -0700
X-CSE-ConnectionGUID: C+tJWUz9QGOcMf5lbVwkUA==
X-CSE-MsgGUID: aJC8WJj4RE+u3xQsQztRwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153300945"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 10:37:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 10:37:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 10:37:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.41)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 10:37:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kuWUg2Zot0/MRhJgwHdXqmQSmBFC5nCGNrwVYqi79dvgQIb+P/6oJO3p7SqY9TyUXqOwuVfwrKEFQlVCa/6r7EsZ3KYaYP+lHsdByjF3J1Y37eBNlbaOY/ml5E9z+HFIQQAqQ1SbzVIMrIDaV09lpzRmaLA5L5trGdAkSnkbGbXZQ5wt/3HcR6qEaZ5fMHqWvGAZeYYtBZDOaVgrlFqbnnIj5NVnsRbUdwYIqf0F09PJbw3/QPn0YJOB+70MrnvGu0zUTaVEZRuCR/BegzuC6Zx5jxBxTWyLnHQAxmGdiR5r+MbHUn0zlBexu08Eer1zprX5M/H2d3IaEMRW+Fbbkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2VvMjprdESqbMs4RySGqnDU1yLvcVwX7k8P3d9t3R0=;
 b=aKdvFz4g5znpzWBXqhMPq86X/yK6blJqfXO1tWW2PjJ5XFTeBTZhgdQCPJfhXSK8Hdw+AEhX2qb/u7o5FOhK29hVsumMB04EDe2WlPaBLeRqMPzkSSC8rHtGTqE4LHmdUepz/r+UbuyFCPupR6H103bBBe42+l8ShBejY1vKSNaPXtkv8aM/CyjOzsgB4Uu5Qz0rBXB7WDiN6yLJrRXGhQTjQvYas8r3Vm/ltnnvbObMeyM4cGpLTuyNw5x08qZbndmvdmk6PDSMRp1scg8bH87voPEUpujRdV35QX2mlGhgZF4ORAr8kcodzvFIqcGVu101QMd9+uX1kzMwaA4ECw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by PH7PR11MB8477.namprd11.prod.outlook.com (2603:10b6:510:30d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Tue, 1 Jul
 2025 17:37:30 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%4]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 17:37:30 +0000
Message-ID: <6bf68fb1-32c2-4beb-b012-149947dd2002@intel.com>
Date: Tue, 1 Jul 2025 10:37:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] x86/microcode: move away from using a fake platform
 device
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	<linux-kernel@vger.kernel.org>
CC: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
	"Ingo Molnar" <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>
References: <2025070121-omission-small-9308@gregkh>
Content-Language: en-US
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <2025070121-omission-small-9308@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0339.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::14) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|PH7PR11MB8477:EE_
X-MS-Office365-Filtering-Correlation-Id: 9346fb1e-3100-4600-867e-08ddb8c5f3f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmFrRFFOS3RTNFdtRXY4bWFlT3JCd0o5bTdwakkxbE03T2FHK3FJSFVTS2M2?=
 =?utf-8?B?bUJBL2hoM3BMRE5JQitqRTlZbnVseVFjK05ITHNiMDdsQ080bk9FY29odzBK?=
 =?utf-8?B?T2ZDYmtrTHFnVmhZcHJNM2tYeXgxc3diWWdRYjJpQ2toZjRaVit0em9vellh?=
 =?utf-8?B?ZEEvT25LTzE2V0tOUDN4Z3hITWxBNklCU0E2akwrVWltQ1V3NHdYdnZacTJT?=
 =?utf-8?B?dUw4TCt3NGovYXRUWG16YXJUMjJZYnZHaVV4eFM4a3VQeDhzcnVIYlJ5RjJW?=
 =?utf-8?B?U0JVUGZwTzU2amk3LzlzcXNoK2cvQlNEdmNsdTNFRkZ1dTFRazVCcDkza2dq?=
 =?utf-8?B?SitiYzBDNzVsSWhlODArVDg1Ylh5bE4vbmdzbGluL0hFbzZsa1l1WDNmb1Ns?=
 =?utf-8?B?M0QzVytTQkhYMFlMdGRZTXRhQW9ReXZqSkFtVDRVRjdQTEt1Y2M1eGliUjdZ?=
 =?utf-8?B?eDU2M3JuRklVUC9iazdlM3JmZjdFaWxQUDA0YWlyWHZRNk5uV2FXL3UrRVN3?=
 =?utf-8?B?dTNvbjFMVHFvRmhhOW9HbjJFdU4zSkVPNlRnOXRCUkYzYlo1alN5VzJmdzl0?=
 =?utf-8?B?SHVkN1ZqR0VBT3hwMjVnbEpGYWV2akNCNnJMQVlSeWdQalJXOXZtdS9pTVFl?=
 =?utf-8?B?ZXQ3WWMyOEU3QVREMkJoU2xDdDdaZjVuamp5WmVCb1VSUytEa1lMSHk4SUR4?=
 =?utf-8?B?a3RZYzh2bWU0K3l1Z1pwVkcvdzNNclhDT2h5M0EreEthY2orNjJ4TDZzcm1z?=
 =?utf-8?B?UmVBbHJnYjFiL2RzWG0rZDFoNnhsbXFkWUgrc0EwZmVwV3JiNCtCTWM1WkM4?=
 =?utf-8?B?Vm02c3ZUajdpN0V0eW8xSFZvSUNXNWluYUJYZWxWU3F2M1FzYVNJQ2s4b3Fn?=
 =?utf-8?B?eGxNenE4SnV5Y1RCMmg0YnR4czJEbzI1SHRHK3ZNZWtNNC9yR213YTJ0akdz?=
 =?utf-8?B?K3VnTWRrN2VtaGNHNGZRWjhmbGtvWHVxU0ExL255YnBvdU9mS0FBa1AyTUlS?=
 =?utf-8?B?enQ5SmJMa3RHNFllZ2xCUWJJSFlVS2YybzRrYWZBeE5zVndtdTNpU3ZYcytZ?=
 =?utf-8?B?M0p3eVRjbEEyMkIwUk01Nlp0dlpGSy9HVVBKeWQrcWRnamFLTHhCUU84NHJ1?=
 =?utf-8?B?Ly82L1h0QUJOQllEQ3ZXLzFsNURqVWVzVEkvQ2ViR2ZXVGhwTUlCRVBLVWo4?=
 =?utf-8?B?Y0ZJNmpyNlJkRXFmdFovRTdmbkF6dWZBd0hTeklON0krOUJsV01SRjdrOHA0?=
 =?utf-8?B?bU1hclhKclRxRFJxZkZXTS9wY2cvbGs2TzJoS3dtSG1xalE2Wkg0TUg0YmZu?=
 =?utf-8?B?VGkxREU3R3lHMzhzZlY5UXdiZ0xsbVNCNjRaQ0dwMjNQdjdnWXJXTlc2NVpM?=
 =?utf-8?B?dGpsSloxL3JnQ1pqMTY3elJDbDkwRWJjdkZmY0RHUmJ6ajE2T1BLbk5CWEFH?=
 =?utf-8?B?dkdSSmFGYys2aFBCL2ZmUnVhV3lFdTJjcXBxR24rZWpsVTJCK3NrWVg3WGt1?=
 =?utf-8?B?VUNXVGJ1UUdHTkFIRW1ONXdTcHNtcTI0VlliYUt6aHdsQy9naHdJOXJCalNo?=
 =?utf-8?B?blpPWnErYjBZakxxRG1DMmxneGJvV2Z2UWx4K3prYS9OSDhTZHN2V1daU0xP?=
 =?utf-8?B?am84NHFrTG9wR0RpRDZsUWJxWFltaDJOK2NIZGdBVFFJcEo3cFJ3S3pYcE9z?=
 =?utf-8?B?c1gwcG1HSDBBZVdHUFB0VVdHS2JmS1pVUnhpQUErT0xFSFkvd2Vvb3hpQ2dG?=
 =?utf-8?B?RzJQVjdMZFdPTVBQbHdIa2Uyb1dqRGFkaVJLOVVjWmVBRVVJdFlSRWJqSXps?=
 =?utf-8?B?TDJoV3ZjOUwzaXJMM0JjcUhPbVROdDFiV0ZWUnpZMTREalM3bHFNMUkycEZR?=
 =?utf-8?B?YkpPYUEwSVBnb01KQno2OHZMSlFYUkp1eWFNUkZBUXZpMkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXZRamVyYkZZYmNvbHZTZDdxa1U1a0RtYTdoTGlSVWxYQTRYdXVhWE9NN0hn?=
 =?utf-8?B?alpJeUVhSHRZVkozckM3RUJGN3UyeDlKVkx3anFYZ0dTcmJqOEpWOGQ4T0tQ?=
 =?utf-8?B?L29jc2lnZUpaRkJZa0VMZGRDQWhKMkZ0ZWZhcWtwQk5qeFpiQURqeS9HdkR4?=
 =?utf-8?B?SG1IMnRUcWNBRWhycWkrVHBnU0p0RW1MQXBmbW13bU02UWZwMTZHYWJWNkhr?=
 =?utf-8?B?WFdKSnZ0QkJEQzBIVGhWelFlTVJwcTNXNDc0OW5ZUXlUVVdsNnRRMG1KVkJh?=
 =?utf-8?B?VnFMRytzN1ZMZzIrQm9LVkxnc0tYeFE5MDRjNGZvYm1oTm1Xc0wrQWoxK1Nm?=
 =?utf-8?B?Uy9jOEloSWl6ZUZWRjRmMmt2NEl0aS9XVDRaaWVLWFZ5QVlMOGhtL25UcS9x?=
 =?utf-8?B?NEp4WTFRSWpoUm9IRVdSRFpZdm0zS2N0ektJQy8vVXJubk9udU5uekZjYmRN?=
 =?utf-8?B?MGo4SlY5N2w4NUJ1L2N1TER1UDFlUURockpSdU9OZnlRSHp4ZEtSb2pMWVN5?=
 =?utf-8?B?Z2RZL2wxTFJ6NHNSakdjaVgzNzVCcmdVdjQrNzRCTk9jNGszTzdvVDZhY1gr?=
 =?utf-8?B?QUZ1Z2lMbmZaSGdTNSt5UFpNNXdhR29mUnpVdG9veUFLZ3BRc0I3bnFMRzl0?=
 =?utf-8?B?VXQwRU5rdEN4WTlESElKMXpYSXVmUHBGMnZQNWhlU0MwWFBPcTUzOGtROG1z?=
 =?utf-8?B?eUtlZjg5N290Tm1LMERmRkh0WjU4US9ycEdDUW5XTG1SUktmVm9sSm1VQVNk?=
 =?utf-8?B?LzZnbUJXRzRPQmlzajJtazRUd1QxUjlONVIwMFB2WlpYbW1KYzlFS1ZQbDVD?=
 =?utf-8?B?T1o3Szd5Y04wZW5xN09qTHRQcjU3K2djOFZUU2YzUlAvOFROODE2UHlnTVNm?=
 =?utf-8?B?STY5M2dPY1V5VG5YNzRpWlZJdk11K0Y0dDdoeHRYQ050QjhiQzFyOUNnSVY4?=
 =?utf-8?B?bUZuR2k3azdKY2dqU3QyRTdyZVU3UGo0dHFaSW1tdmF3Y0VWTitlUWxWckRq?=
 =?utf-8?B?MFpYWC9EcnlmQnBKODVXeHZYQitrK25hWCsrb1BZdzNodDhtTmhOL1ZZWktV?=
 =?utf-8?B?VWIrMHE3ZjFxWjdvMDMrMU8xdnpJRUNvTzlidC9SMzV0S1J0NXZlVTlzZkFU?=
 =?utf-8?B?SVduRG5IZWlaVzludm5sSVUwRlVoVVRaSkwzVFM4TFdSeTBTOEcvTnlkSHp5?=
 =?utf-8?B?UmRGWS9vRnRMQlV3SHBFM1pHOWRIQUJZdFFMTFFYWmFYNnN4NUhLRGozWnR3?=
 =?utf-8?B?QlhaZFdVMVhEU2hNc09nQW43cFp3djlKTFp0VEZXeUlZY1B1ZnU3bTZGMmZr?=
 =?utf-8?B?WXFyYndvbktHTTZsSGxobnNqL25PYVZXQTdqeXBqdjgrMWlhNDNxaDRqNWk4?=
 =?utf-8?B?blVORHFockRXWVFqdHVjNXhkNStaeC95U29FdU5lcFYvSHdWcGVXUzJFWXo5?=
 =?utf-8?B?bDJteFkwN0ZBbHh1S1l5dmloRExTUWhRMU51aEFEbGIvdEF2V2QxQXFHRlZj?=
 =?utf-8?B?cnhIOTFVTGNqY2QvSUd5RmJnbFRSTmNFOVcxeWtDeEx2OTJSOGdSN1k1NUli?=
 =?utf-8?B?MUFNTkNEcXA2eTBpeEpodFBlQ2d1bkgvN3k2NkRKbFRJL3h0aTdvMjJkWmwz?=
 =?utf-8?B?NVhYNGovWnhhSXZWSk9FRkxacXhEWnNSSnQyMlpGQWZCQ3VuQ1R4eDMyazEw?=
 =?utf-8?B?M0tCeW1wVHl0YnRzR0txbC9xMm56NllFOFI2V0xIRi8zNWc0QXlOOUc0cFJz?=
 =?utf-8?B?NTM2RTQ3WGNzNkpnNzhBQzcwb0dZNmtVbEtKTllxeGdidDNpSUhrRUR1cHNy?=
 =?utf-8?B?cWZndEoxUkFpWTZBU2MyYWNrSEs0UVpGSStWZm1XQ3BYZmprNUxkaDVyOXQ5?=
 =?utf-8?B?OHBIcFluTFpSUUYvQWNwTkZjOVp5b1NKTHJaV3k2bVJPNXhyek55bFBNNWUv?=
 =?utf-8?B?SklpQ2ZucmIxOThXVklucGZsQTI4TFgwalR6aWJ6YU1vUWxZYndYZ2xBSHJo?=
 =?utf-8?B?V0tsQit3K0pNOSthcWU5Rjgxa2M0NUZTUnVUandwSGZXMGI5azhMRWdxRU01?=
 =?utf-8?B?K29mRXhSWENiNXF4NmRGajVHYWxRL0VELzREcEZPd0VZaDhWazVuSyt6eEht?=
 =?utf-8?Q?db7GSbdCcEyHwg1WLY5MzgoTX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9346fb1e-3100-4600-867e-08ddb8c5f3f6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 17:37:29.9142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9y+haDBCJq39DQTF5UrgAt1Cc5hwjhPvn0yByXNp7uukKym3ZACzRMWR+6xYF3HepQ3TLZFvA/MjNI8xf8aI5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8477
X-OriginatorOrg: intel.com

On 7/1/2025 3:54 AM, Greg Kroah-Hartman wrote:
> Downloading firmware needs a device to hang off of, and so a platform
> device seemed like the simplest way to do this.  Now that we have a faux
> device interface, use that instead as this "microcode device" is not
> anything resembling a platform device at all.
> 
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: <x86@kernel.org>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> v5: - rebase against 6.16-rc4 and actually cc: the relevant maintainers
>       this time, doh!
> v4: - api tweaked due to parent pointer added to faux_device create
>       function.
> v3: - no change
> v2: - new patch in a larger series
> 
>  arch/x86/kernel/cpu/microcode/core.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
> index fe50eb5b7c4a..b92e09a87c69 100644
> --- a/arch/x86/kernel/cpu/microcode/core.c
> +++ b/arch/x86/kernel/cpu/microcode/core.c
> @@ -17,8 +17,8 @@
>  
>  #define pr_fmt(fmt) "microcode: " fmt
>  
> -#include <linux/platform_device.h>
>  #include <linux/stop_machine.h>
> +#include <linux/device/faux.h>
>  #include <linux/syscore_ops.h>
>  #include <linux/miscdevice.h>
>  #include <linux/capability.h>
> @@ -249,7 +249,7 @@ static void reload_early_microcode(unsigned int cpu)
>  }
>  
>  /* fake device for request_firmware */
> -static struct platform_device	*microcode_pdev;
> +static struct faux_device *microcode_fdev;
>  
>  #ifdef CONFIG_MICROCODE_LATE_LOADING
>  /*
> @@ -690,7 +690,7 @@ static int load_late_locked(void)
>  	if (!setup_cpus())
>  		return -EBUSY;
>  
> -	switch (microcode_ops->request_microcode_fw(0, &microcode_pdev->dev)) {
> +	switch (microcode_ops->request_microcode_fw(0, &microcode_fdev->dev)) {
>  	case UCODE_NEW:
>  		return load_late_stop_cpus(false);
>  	case UCODE_NEW_SAFE:
> @@ -841,9 +841,9 @@ static int __init microcode_init(void)
>  	if (early_data.new_rev)
>  		pr_info_once("Updated early from: 0x%08x\n", early_data.old_rev);
>  
> -	microcode_pdev = platform_device_register_simple("microcode", -1, NULL, 0);
> -	if (IS_ERR(microcode_pdev))
> -		return PTR_ERR(microcode_pdev);
> +	microcode_fdev = faux_device_create("microcode", NULL, NULL);
> +	if (!microcode_fdev)
> +		return -ENODEV;
>  

I was going to suggest including an error print here, since
microcode_init() is quite verbose otherwise. But it looks like
faux_device_create() itself would print a message in most cases if it
can't create the device. Anyway, this isn't directly related to proposed
change.

Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>

>  	dev_root = bus_get_dev_root(&cpu_subsys);
>  	if (dev_root) {
> @@ -862,7 +862,7 @@ static int __init microcode_init(void)
>  	return 0;
>  
>   out_pdev:
> -	platform_device_unregister(microcode_pdev);
> +	faux_device_destroy(microcode_fdev);
>  	return error;
>  
>  }

