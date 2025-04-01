Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D4520E01E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523915; cv=fail; b=e6Vpd+ZGePHMx6y0BQmrwstaPZ3+9uCC/uqwNp5fcGIny82GcnyjMEesksyQtFRulGp/Oy86wshhMII8JXeqJ0bxx2z/G3TmXxbxQWy/99KVv4+3mvOyloXbAwjXUmFIA3wGQ+1Qx2wNnFinkv57vui4CWHdpEe6VrvqibY7zYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523915; c=relaxed/simple;
	bh=DUHnnrPvdTq3rYOWVSHjMjlAm7jO0jQ83vPco0SyHf0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cozm7WtTA/7mWXT/tHlaaIk2661dbwMZb/jntbuixdxyBmSvsfHzH1brrGOyfFlsEJpTuB2D24d2Ye0u8P0hjtOJN5Mv0BhzN2ztM2o1T/RvpHZz6D6+uBkAGq4uYxplGwtsBXT58XPWY/3slSTdwbdZcFmikm7DgiFE1pFmzaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DCvB5yB2; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DCvB5yB2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743523913; x=1775059913;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DUHnnrPvdTq3rYOWVSHjMjlAm7jO0jQ83vPco0SyHf0=;
  b=DCvB5yB2K48CGRV5LKyVW++wSBqHeu5u7Y22RDPIWLQ+ERE36/SVRKHQ
   x7U1SlfcoHTTXG6neaiPv5+gJe86k/KMHE0BN8Ziy3oD9aG7a4dRoDozO
   mPliiZAkLaEV/ivMXEgK0Fj+leQTqRb8I9FrYq6sKp79jWcShsLzlJX2N
   qtXM7U7QhWjAyi+/iV/VqockfrzLCpvB2eq81xQZKvXMJTkG515T10mMX
   lS3DocKpOY9zK8szYe5iUMEqzPKSMetPByJJ+fd8zNOgC9b+cGPX/98fV
   jhsj3eVW/5jBZHY1OJt8KXRuEwD3XQ50+UKH3GrafbMB31+ZPHr7Wj6xE
   A==;
X-CSE-ConnectionGUID: wsmM9YLFQJiM58j1Z8x/MA==
X-CSE-MsgGUID: 6ExmNZ5AQFuUr08hKLfVjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="70214853"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="70214853"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 09:11:52 -0700
X-CSE-ConnectionGUID: ZSiQxWxGT1SvkFa4dQhhOA==
X-CSE-MsgGUID: 0grMTio3RJWo00nmTwlV1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="131299178"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 09:11:52 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 1 Apr 2025 09:11:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 1 Apr 2025 09:11:51 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 09:11:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obHDpb9ly+5aRU5cWu89udK1WoAGlmBa0gHRseb7qLtvIe+IxhcFiRo4XsGPp6TpUPONlasgsKziegT4cHWJ4gtZVG0AXT52K/vQPUBzBt5Tk725gIF53jgRKBEkY1KTEOg99HaB2xmDp659Tjh6/vL2hpKFf+94t/UTQ51q4mi30KmILEfDgtf7WgiUzN5p/VucNblXPTtKdLlAJyJ6DSmq4uMoO0Q7P8tIiqYdoIs+Crx9ZvNDGJWDuAI+6BSttMN522pXdPJs2x6J7JtWBpydNLv1bTKaGu73FoAbewtW2jkQUyUJIbNfSOeCeRWuq3BCAFwXRAM4py65+87jpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7uISJwFS4DzcPGQv7g0lEeOfvnndjuRpnz/pBmQZ9o=;
 b=TzNHbpbdN/ac4ud+vb8iLbS4Xp2pLymVeISoOfaHRhlnr42LMUmDmhJMeS0VGm2wrvpUl9lldFO5ceWrVZd9ooK7oYAfqYwmLXQyBJB8PB8P40/OcThQhI22S087QDGN5Lp/npyX6SNYFxhTsNfe2b1Z2WDtWVgdboc/OBEflhSGs8II7RKH07+DaZCzVaWWVOH5pIs3mLdtmTUpN2LymHptmJCvAcRRtwmwGvY8KaQsUCxBRLDwkUPPiEWcgjqYB/CM9sDGyB1JwqemUpmhwsX5EEOkCGAodhtQOXhx3G7PHcCfHP4iDOI9mB9Itraw5lC15mrR7wCPycpPzqlW/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by PH0PR11MB5805.namprd11.prod.outlook.com (2603:10b6:510:14a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Tue, 1 Apr
 2025 16:11:46 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%6]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 16:11:45 +0000
Message-ID: <43c1faec-8813-42a4-92db-023e7c878300@intel.com>
Date: Tue, 1 Apr 2025 09:11:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] x86/nmi: Improve NMI header documentation
Content-Language: en-US
To: Ingo Molnar <mingo@kernel.org>
CC: <x86@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, "Josh
 Poimboeuf" <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Kai Huang
	<kai.huang@intel.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Mike Rapoport <rppt@kernel.org>, Petr Mladek <pmladek@suse.com>, Jani Nikula
	<jani.nikula@intel.com>, Tony Luck <tony.luck@intel.com>, Xin Li
	<xin@zytor.com>, <linux-kernel@vger.kernel.org>, Nikolay Borisov
	<nik.borisov@suse.com>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
 <20250327234629.3953536-8-sohil.mehta@intel.com> <Z-py21rwghagQDEI@gmail.com>
 <4e9bc37b-34a2-4d5d-ab14-904ff2938292@intel.com>
 <bbd417f4-b165-435a-8bb8-f90e42f0eb16@intel.com> <Z-ue_rSKOAHSnfNI@gmail.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <Z-ue_rSKOAHSnfNI@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0025.namprd10.prod.outlook.com
 (2603:10b6:a03:255::30) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|PH0PR11MB5805:EE_
X-MS-Office365-Filtering-Correlation-Id: adb6bdba-6f8f-463a-d525-08dd7137e63f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2tRMHMrbGdDUWM4WjJjaHM5WGlKbkdEWGdIaXhOaTVIYVAwZ0ZkUGdlYWYz?=
 =?utf-8?B?bVZiTHo5RFI0clhpZXJEWXJKRGZ5cGhvdDV2MEFvb1hDMmJRNkJTTld2Vk1E?=
 =?utf-8?B?YkdDTFBxRVJhZ0xxdkJ6M2I1ZFZ4R1pLaFhkZ3VrdURVSU9JRkhFU05NZlFP?=
 =?utf-8?B?SDNoUVlnbDZFdXRjc3NBTjFzT0ljU2ZIUkcyb1JDNUVNeE9QVFo4UnR1Z1dm?=
 =?utf-8?B?Y3dxU1ZUL3cwRjFoNElNYU5tamVwYmE0NnJmOU9tR1kzVWNYOFd4MllIYTFY?=
 =?utf-8?B?QlMvYUlIR0g5dEh6b2gwTW1jZ2xVRURObzhLS1M1WHRhcGRONlcySG81eDQ5?=
 =?utf-8?B?Tk5RWU5mamRYUm9ySzhXclBDcFFIWmZCNUlwZzd5ZHoxOWFYTFBpSnYxcVJ2?=
 =?utf-8?B?ZFdoajNHa2kvZFdxTnFLSE9rSE9TWTZRL2EzVEQ4V2o3OWtPeHZ1NG5vdlQ3?=
 =?utf-8?B?SytXRXlMSE5kV3dpRE9TZ2kzYkhRWE85MjVlMUlJZ1Q4N25RVnpJRk0zb0E1?=
 =?utf-8?B?RVZLUkgrVjNqK2pQWUlST1lBakFUYXJTUXZWcUZGZVk1dzBxVFE3by96RTZY?=
 =?utf-8?B?dE11Rk5GQ2FONjhRTUMrYkoxMExaa2s1Z29idy9GN2dwQTNqNnpsUVJBaE9U?=
 =?utf-8?B?cFZMVUpwVGoxZDNsNXQ3SWlrYU51Z3pjYTQvTFl2VHA3cmhBK3RiTE4xLzlo?=
 =?utf-8?B?NGdoUWhWOWFaR1h1alQrWEVWOUkyNG5nWXRJSVVPeXBsZnhGNlI1U2xtZ0E3?=
 =?utf-8?B?ZklqNHVSMHBoUlhjYW5ORXpzcGFvTnd5alZBdm9QNHN2dEU4ckZqQWRJY1l5?=
 =?utf-8?B?ZkU2ZFVQZ1FMWWhsQktoMFpITEUyNU1CQ0xwaTJmR2JmWFVkejgyaXFwTE40?=
 =?utf-8?B?cHpBMDBkUXRBdmNYZ21OTVpzUDJFYkh5MDB3KzEzbVNaL1VRTjBIblRPbGx1?=
 =?utf-8?B?Q0hCeFR4Y1VsRExNRzMxL0xSVkxOL3dyYlNQaTlEOEQzWUVjcmZrRHczRHBH?=
 =?utf-8?B?VmJsbENUT0hTMGhDNlhxSGMwZjZyYTZOMnQ2bE1aT1VtenBKWklSSWVKdnZF?=
 =?utf-8?B?SXdlUUhjUnl0NHhwR05Xdk9QV21ySG9GVFd5TE56cHQ3UlpJNG1KTUZEazE5?=
 =?utf-8?B?blQ3MVk2b1BPM3RlRC9YQ1ZCbTI5UWNUMThSUkxpd0dOeEJ6ZXhrOXJ4RGg3?=
 =?utf-8?B?SzBOM2xsTFREbzZ1ejFncGxEQVcvbmk5ZnpDYzZqM1M5L3hmK2lZRmRjZUZi?=
 =?utf-8?B?L3NXVzEwWTFJUlR1amNnR2ozYzhFWmtwaDBmRDJBR0QvS1JURjhrYmE0TlZI?=
 =?utf-8?B?eHh5NGRIUDdhci9VYnhRUWJZYi8xcFJGZnllMEJjVU0zSTBJZzRja3daTkFY?=
 =?utf-8?B?WS9Ca1BIbitzVk9Wb0tEajYyR0o2cHBGaVY2alpUY2drMm9QRU1sQTQvZitC?=
 =?utf-8?B?L25mblFNN2oxcURFclhyajVXNHJ1Ynh3aWx3aTVUN1JxTEVrVjdTZVdVbEd5?=
 =?utf-8?B?c1dhU2Iwc3NNbzEzWXdiZFNyanY1WG5MSStGcll4QStCcnQ5dmF2VnM3TjZQ?=
 =?utf-8?B?aU45YlltNXNnM0tBdnJYN3MzQlNEejkzbGd4WkxYQkh2Vi9WeTFSN1FmTU1X?=
 =?utf-8?B?WnNCYlYrZ0R5RGFidjF1M1hDL21UT2EybnJaaXJ4UTUzd1RtZ0dnY0VyelJq?=
 =?utf-8?B?T3ljcGEyZVFZWkFkVkoydE1hcWF2RGQrVTlGZGZKV3NxT3hJT3d5V0lMWnk4?=
 =?utf-8?B?MUFlMjdkajVwSGdvcUpWUWRoVVBURXBVWU9KRWdsSjZSelVkM3A4VWdtZFVE?=
 =?utf-8?B?UWtzYVRMMlh4R0NIWG1ZclJpS3JRd1A1d092K1ZzbjRuY25Bck5FU0ZMd012?=
 =?utf-8?Q?zAwQNvQ1Q/TvZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDlTQ29nZDJRWjVSM24yVWFFN2dNemdNS3RQWmY5SmVZZXpKbit5YlJkVEZI?=
 =?utf-8?B?SGp2c0VJekRDTDJvbnM0NW1MQnN6K2dRaU1JdnJORlRtbk5wcHVpMThOdm03?=
 =?utf-8?B?NGpKR2wxdzNlSUxndjZRZkprNzlPcVM4K25oemNTOFJ0cE9EU0ZkcCtkY1V5?=
 =?utf-8?B?a0pMUWNBU0tteVBBcUJXWHo0aXF3dGFpQnVWdE1qalQ1WTgzSDloQ1dMeTQ3?=
 =?utf-8?B?aDk0QW01eWM5aG93WWZjalJORXp3M3l0dE0vSWR2Q1JodW5NRVc2QjJ6azho?=
 =?utf-8?B?NEdOZm9POGFaaWZyYXNOZVF2WEtoenVhQllDSlZjNTZsRUhKdEV4VFFIc0JL?=
 =?utf-8?B?R0Jza05ZUit2enIvWXlTeVVVV2s4MnkzV3VVZmtUR1hyMHZZSjdCVFQ0ZjAw?=
 =?utf-8?B?ZXZOcFFjRzhObFE1WXgrajM0bms5czUyaUQ2QjZWbllZODhMUmhnV09ST2g5?=
 =?utf-8?B?N2tNRXVDQ1dVZmo0Z1YrbDdXU05ucitEbnFKSHBMRHBEMVNSTjNYNEVKTUp4?=
 =?utf-8?B?R05vOXNpUm5XMmg5TStpN3huNm82c3NUeWpCZzU0SzdxdWJNbnYvc3NHQy9C?=
 =?utf-8?B?dTRLVTU3RVJTb2VlcXpGaFVlSGVCWTRtTmVHTS9NTWx3STlXNUpTaFNWKytT?=
 =?utf-8?B?alg4QVhpZytyRjJqdVJjcW9GTlBMbDBmVHJmL2VmTUN2UEJTOGpNbkx5TEFw?=
 =?utf-8?B?em12NFg1STVxbkVxTU9TaW5DT0lPYmxGRmdVdWNHRE5uWnpkRjFMRGVlNlFn?=
 =?utf-8?B?dzJpTDRsRm9OUGR3MjJOMkppUndtUzZ3aWFRNDZCOG9qbFh0TUorTkRMaVBD?=
 =?utf-8?B?d2hPak16UjJyTm9TQ1pVN3F4czlHY1RodFdzU2pxQmRDaG5RU205YjR6TFhP?=
 =?utf-8?B?NWJrWDlkQWZlU2FzYlZERm1pK2FXUlJOVTVVZS9EalY1SnZuL1ZaVEVzTTk5?=
 =?utf-8?B?MkFsOUhWZndlSmNhcGpNYlp3VDl4ZldJOTROVlFNclZBQ01nMHFkMTJJQkYv?=
 =?utf-8?B?RzhpbGp1bk9ZeUswS0FOQTd3bzhFQTc3bnpvMU5KQkM0U0JSZ2Y4bHlOY2xv?=
 =?utf-8?B?SXlkcEY2TkdZZWFTZkRpY1d2Mlh6RmZySjF6Y1A2R3pGWngwQ0FSRUs1azcv?=
 =?utf-8?B?N2RKM3lLdkdxWXJhMFNHNE9PQStvWHI2VXV2aVJYODRNWi9tWGpQVU9SWnVU?=
 =?utf-8?B?RUpLRUJDTmU5cTVpK1ZmTUNjOGdTVGo0VVM1RDJWc0R4MTZIQ3hrNnV2QW9Q?=
 =?utf-8?B?OThPZlZKQWVkYkJZSmZVUXhsWTluS21Xa1NodUFZS0tKbkw2dm1JVXVPWkxw?=
 =?utf-8?B?Q1R4WGwrTWJwcEpyOXJtMjY2YUkxclJaZlFkbmczSnF6U3RGbVZOa1Y5ZnE4?=
 =?utf-8?B?TXREejZONnNSU1Q0ajhjWHg4aURRZXdsUHVaOGp6Z0E1UURTNUo4bTJkUTdw?=
 =?utf-8?B?TjA2bDVZWDNVUnYzRFFTQUpmSU5TU1NoU2xLSFhWOE0wdzhMTTRlR0JOcnR1?=
 =?utf-8?B?c1RKK3poTmZOcU9nYU16YlZ3SEdMWEN1Z2FSMVNiSG5UbkVsS3lhaVVSY2Nr?=
 =?utf-8?B?TVpIOEFwT2RBOVBpeTA5WDRiY0Q1bnZaTU15ajJrT0ZuWUovcDMwSFpGVTBz?=
 =?utf-8?B?bXZ4eFBnd1p3cWxWQ01GcjBSNk53SGVDTVJ0TFlmeUxYTTNhMmJTU0lXYmNh?=
 =?utf-8?B?MG1BSGJXaUNxUU15ZzNNSUpyM3NXNlA5MmVVV0pCa2JQSlNsdURrQU5vQTl2?=
 =?utf-8?B?aWxjc2NKSnRqc3RuMmZETS9IWWI0RXhyQnpzNXNFenZwODllYmtVRUlOM252?=
 =?utf-8?B?cytpbm5Ldm8ybTMxaTBrU0NWbldaVWMzdnR5aE1IRUdnU2dqcUw2MDlESXBT?=
 =?utf-8?B?RndaazhNV2d4eTE1NWdITmsrRUVINlN6a005blY3R1RadnpQMU9UZ1AzbGpL?=
 =?utf-8?B?dEhRVE1mZFNaZ0p6Q1o5aFFRd0hoeFpIMVIwaEluTnRvSEZPOVhNUXIvcVBy?=
 =?utf-8?B?MU9peXp4N25lUVRPRXg5YllKdnNONDJSQWxwdXUxMVFEdmlScHRPcnFiWHBR?=
 =?utf-8?B?aHlhMmpsNGU2OWNOOHNURU9HVjNuSHdhS2ZTRjBuSDU4SEd2TGhkK0k3YzQ2?=
 =?utf-8?Q?vS/vA+TP2/9ZY8XrZOtiyijpn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: adb6bdba-6f8f-463a-d525-08dd7137e63f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 16:11:45.8017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ntq9+HP35XZOY1/bWGwqcO9IIMljWEkGrz5qdtVmlM4HeJu/qnQa11sIhqOGBW/M4uXUfAqiRrO1TlszBGKYng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5805
X-OriginatorOrg: intel.com

On 4/1/2025 1:08 AM, Ingo Molnar wrote:

>> Upon closer inspection, I realized that the commit title for the new
>> patch is incorrect.
>> s/x86_hyper_runtime/x86_platform_ops
> 
> Yeah, the git patch context threw me off: I fixed the title, have 
> included the other review feedback, and added the Reviewed-by tags of 
> Kai Huang as well.
> 

Great, that's awesome! We now have ACKs from PeterZ and Nikolay as well.
Thank you for the reviews.

I haven't seen the tip-bot emails yet. Just out of curiosity, when do
the tip-bot emails get sent? Does it happen automatically when you push
the patches to upstream tip:x86/nmi or do you trigger them manually at a
later point?

Thanks,
Sohil
