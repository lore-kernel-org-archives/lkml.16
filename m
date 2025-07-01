Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579382749D9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381967; cv=fail; b=IxQRLO2nVA98JRquD+/Gvpz1cn+C7Jk43WBn9R3Y2eRaPdFHUGMjuj8xgR0FTBDmy1y3zHhvylD6mADHs7BZ8PJbeMFYmv1n4bCKwasyyLG5ZYJWZEWKruT5nnwb4Z6t7lMmtBITLSa1r1F3LcdJU1QardILysi5zyvvgTj90E0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381967; c=relaxed/simple;
	bh=YsNO51IziPAP42QMq0XQ+dvvybVMdXWzAGD8TX9M7jc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dQge17igwmnBy0ER6AURA0ivNkcA4C5MZ+yqRXfL8IUtCDx8zPRNhPTmjduHC6M2ghdOgdR5TVpuB5Tk6yOXpCFR8P55f/oxG4JxvfN6OIxfRSWp1nnppXOX2CmBCAm2fWbfLXK6CoyY5/YRvLt6RmeBUO4P/0DQF3736zCj08w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lClOhWSJ; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lClOhWSJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751381965; x=1782917965;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YsNO51IziPAP42QMq0XQ+dvvybVMdXWzAGD8TX9M7jc=;
  b=lClOhWSJBdRXs+BUMWS5VgcZPNS9WBsxVD7Ngl5ocV1ly7VyoDRC+TyE
   wH3/VAFoH7X57KPBBT7HeRGpdWgFgqtiP+PU4ENUknfT2fgIIcDeptFEl
   YHws7ypobD4dBGSkmLQDGxFbLq86CiiPWU51MQHoo0xDIbsUzIgtosYlC
   H4G4D8vNKKirIsujbFa/YPQwjOs5+4/OLvjnTo6Zu0eMRRD84umVpDW9T
   0aw8GVHEeJb27y78Dth7wO7JEqc8lO+izPXxo/4izjoGxvN1wfw6Jc8RJ
   2FRIKs97VY7QZvi7nGn/4yY7CbjXAZlc5facI9FneW+yCdx5fWJFONCX/
   w==;
X-CSE-ConnectionGUID: VMYz0fSEQ720pi1w6HlHrw==
X-CSE-MsgGUID: pO8DlDRrTxqHx1C6HUaZqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="71214287"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="71214287"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 07:59:24 -0700
X-CSE-ConnectionGUID: apyIVcuHSGWc7cyi4j1L2w==
X-CSE-MsgGUID: P/dMMI4ATQu6b6a5pxxCkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="184840583"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 07:59:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 07:59:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 07:59:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.74)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 07:59:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYXvMP6URGYBrWjmtb3eUt84jfxMIPlpbUXumEbL9O7uek6TVeY5Ry/fOhJagMM1IKnKCGiQtf/wmbFY+1iRf3lhhlsBQfvh9tJNmE+14flklnHCc7NPx5LirFay6znJx1wXuq/ITdMG0RxhdPeSXfWXzwJhVkc8qheaCGWiAFre6F1R60NkLkHIpsB9+ULW5pj9RBXWK/uAI73YNQfqt6Q2/pAzLddM4ZFxJeCVXfLTrQIcoLuy7iLDCbyCx9nZZ9Yk21nxKV7KSTXF4W4YXcR/8QiBRnE0nJm94opoejyYJC7qJQ/Zakz1C0QfFMpytSizzzIk1ad7w+h8PZWswA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9XmK1RkIh7mzNmKeuwp4bXmcDSgivzNy0MH5HBirAI=;
 b=EfZHpfYzdXGbWOa7ptmNWZvcg4u3Qx4T7sFrjOIST8J1OCwp/fQGDEGQMqvYYWdPNDb81nCSdTQGTYPKTW6EeYSiW7808qrXFq6IVI34Fax+sJq3SZGBXm4UypGwoK7e0WzPp8OILBOxoNsq1QYQXXg69h411W/B2SOLBxZbtIwfetZnEcTctL8cOmrXjxSkVFAxB+irUkXv1ZezxAOLFeoxwqybrE+rDbAuw+atQpuyqRx1ekpF8ZvLta17bvUdqQIXwZts1ufYuPvz3ar5NoNew+invKMbDGWsf2qqAym7JUI+CtpGN3/u3sTdpDgIsEDtbWBV27MY8pk5q9/B3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 SA3PR11MB7525.namprd11.prod.outlook.com (2603:10b6:806:31a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Tue, 1 Jul
 2025 14:59:19 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%6]) with mapi id 15.20.8857.026; Tue, 1 Jul 2025
 14:59:19 +0000
Message-ID: <fe225d57-f1a7-4b54-aa09-6efbc11c9a0c@intel.com>
Date: Tue, 1 Jul 2025 22:59:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Kernel panic in __migrate_swap_task() on 6.16-rc2 (NULL
 pointer dereference)
To: Libo Chen <libo.chen@oracle.com>, Jirka Hladky <jhladky@redhat.com>,
	Abhigyan ghosh <zscript.team.zs@gmail.com>
CC: <linux-kernel@vger.kernel.org>, Chen Yu <yu.chen.surf@foxmail.com>
References: <CAE4VaGBLJxpd=NeRJXpSCuw=REhC5LWJpC29kDy-Zh2ZDyzQZA@mail.gmail.com>
 <07D9F8BC-47A7-4E87-8655-C978C056E308@gmail.com>
 <CAE4VaGBQnMp953tsv13s=CiaaiW+EZNuvh6dCuRA7MWbyU_Hsw@mail.gmail.com>
 <CAE4VaGAak=U-oLwXvPZsiNRnRvNL_ROKL8AJCSkCm+zPOjf2qQ@mail.gmail.com>
 <31bd3395-cfe3-4af5-bc1c-fa8d26629b93@intel.com>
 <d0b7b52b-c370-4ad7-8a03-d785f1505372@intel.com>
 <b66b4e76-f07d-4067-8c99-55600bbd2556@oracle.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <b66b4e76-f07d-4067-8c99-55600bbd2556@oracle.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0126.apcprd02.prod.outlook.com
 (2603:1096:4:188::11) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|SA3PR11MB7525:EE_
X-MS-Office365-Filtering-Correlation-Id: 703d1c77-a3f3-4fb7-448d-08ddb8afdb44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVZGOFBhWkdMcDgzUGR0WG1uMUNaVTd4UUQ5WE00RGN6dHJ4U2JwRHVHMjU3?=
 =?utf-8?B?cUVNaFVocWNqNGtmRGhqZ01xbGs5RWRZaytnUlVRSFlCMHl0Vy9kL3J2eFpo?=
 =?utf-8?B?cmp0c1JibHNoaUUrbHpBbGZQdE1DbDFxSmZTWVNhSWJ1UldjdFNIUTNpOGVn?=
 =?utf-8?B?cGZaQ3RMMDVVVHNSNkNBaG1UTVd4U2ltenhtd0hRcjJUSXhaMDRlZEgxUDBk?=
 =?utf-8?B?cmMwTEJValZmT3Rpdk9UaVV4Mldac0NNa2p6WE5QaVRMUVc5NWVsNGtvN2xx?=
 =?utf-8?B?b2FhWUU0MHJxQjJoNG5FMlZxUWFyeUJ3QkhrNzl1eGR4TWxMaGJnb0syK2c2?=
 =?utf-8?B?N3ova3p0WGF1S0lJUUFHZWVqOUlwMVpCMWZld3F5Lzl2OGd1MkVoRkh5b1Bk?=
 =?utf-8?B?TG9vZklXUVZ1TmZNVnB4WE5WRlM1MFR0L2h6VU82a3oyTERLMnF5am1MVG1N?=
 =?utf-8?B?K3pOazdVNko2TnZkdnU3RVA4U1d6WVYzSG82Q21tV3p1bHJ0d2J2TlVmbG1u?=
 =?utf-8?B?RUhZUW0ra1NQVnBvUVR4ZTJON3lMYit2UGczSE8rQ1lZM0RaVnJjOXRDTkt6?=
 =?utf-8?B?aXhhVlFCVUhUNFl1RnpoSzl5TlVtMnJRSVZ6WCs4M0pqWUE0Z3FVbERSZDdE?=
 =?utf-8?B?c016RUwzTHJmcGw5Z0dySkd5cmZPTXZxR3hwenZ3TnBrMkpEZG9EdFdjUnhn?=
 =?utf-8?B?dWZzYzBtUmloc0hHQTN4V0E2amVHUWxtTmRyRk8wVGZqYUN1Wi9CMFBBb2NK?=
 =?utf-8?B?RzdjM291YTJFWldScEpKMVNEY0kxVHVEeDNWMHZPdU9nbU9XZHljU2c4N2VW?=
 =?utf-8?B?UENVVVJjVlJCN21NUWhWRnoyanY3ZyswckwxYVNUUTBOUHU0YStyQU51UTBp?=
 =?utf-8?B?Q0J4MktJLzRiT1l2TnY1VXd5c0JGVlJKTGZUY2REaVdLczBiT2pMTDJvalJB?=
 =?utf-8?B?OGlGU3Y2SkFpbndOeDJZVVhXeVIxQjJJbzMzK0hCb3VXL3c0QWFtd3dhR0J0?=
 =?utf-8?B?TnVBK0Zab3ZhSTBtdmFJV3QrakQ2ZmlwWUF5ei9KM3hXR01BTGV4S1MzTVlk?=
 =?utf-8?B?bmU0YWRhVVRsL3lJS1VpQUFOK0NNNWdpZ3M2WUpXSEZ5NkNWYTJJZVNiN0th?=
 =?utf-8?B?RmU5ckhSaTRHYjdpQSt0TGcrV2cyZVRIbjJSaFRSeDVFRks4UnRsZzNBNnBM?=
 =?utf-8?B?YW9YTU55UkgrQ2VtVi9hZ3dYeHNVSzdUUEhsbmlGbTlzVWVxL0I3NjJ1TkxE?=
 =?utf-8?B?eGMvN2d1UG1FUEVSenlDamQySzZsZ3VWZmd3SHgrbUNmWHYwanAzNEovam9h?=
 =?utf-8?B?ZGRqTUhhVS9tRWk3NUw2K2RtTE1tM3VRTEZSMVg0dSt0NzNkZWc0ZXBaWW5i?=
 =?utf-8?B?OG93QTkxSHk5V3Z4eWU5KzExeVg3WWVmY0Y0ODRXRjVYRENwNk9uMlNRY2pL?=
 =?utf-8?B?YW1lSVFrMmpiSXcvTWhucloweU9iSGxBVGVIL21kajVKcmhPckJ4WGZaa2RP?=
 =?utf-8?B?Qmd3c0ZNT0tEL1N0RTlrTnRSaUMzN2thTWVLWktKS1RyUlN2TGxXN1hXcnJZ?=
 =?utf-8?B?amxYQWVOb0RqN0kzYTVTMWdXRXZwYTIvWjV2QTNGZmlpZFJlM25YQ1dNaUJS?=
 =?utf-8?B?eFRlTWkzVE5uNkVaSXZkOGNsQjNtN0piUlpubjdiWWtmZi9GdkZpOEY2YmM1?=
 =?utf-8?B?UTAwejkvOXRTZFpkSzAzZ29NQjRiaExvSXczYm1wbFhpYytFMWZwbldHckw5?=
 =?utf-8?B?cHRsL1hjQWIzRVNWQ0dtN2dqRWhwdzNsMGNwUkk4WU53eDhqb0xhNWxQd3cv?=
 =?utf-8?B?S3kwT3doMHRCL0xUTFhnMVNPb056Nm1GNVVSMzk5aklEdi9sViswNVZTR2ZV?=
 =?utf-8?B?QnJ4cjAxTnRpVVNsYnVnRndVZUplTmFuaHpTQ0Eydk9WTmxZWUVnaks5WWxG?=
 =?utf-8?Q?5obzPjJwVxQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlMvM25YK2pwbjBXclFJVklTUjRaVFgzYlppWk1XZS9YSXg5aUR6Y0lzSlo5?=
 =?utf-8?B?QWRudjVIY2M4VFVpbHoxaHhkZENGWXpTMWJFTHFnL2VjamZzdzh1UEdDY0M2?=
 =?utf-8?B?cXFZL3FEZHNQVFkwSzFFZDNBN2lRRXErbnprRU5SbnJNKzZXUTRHUTVvNWty?=
 =?utf-8?B?bmtXanRZeFVKcWtjb0tXZ2ZqU2ZrSW9qWUkrQ2hmNktPM2pSdVIvK0d3ZXhn?=
 =?utf-8?B?ZzZhQkFHanVMNGlvZkM0R0hXUmZuQnFGL1JheTZLQU5McTlXMExldHpydXVj?=
 =?utf-8?B?cHZxYjZib1R3NUhkbUQvT3RBclY4cUdVT2gwNm43U05JN0NUOVBQaERPVWFE?=
 =?utf-8?B?RXpVZ2YwbEE0eTVKK24zRVlOeDZkQ1JKSFJvVVpOMUJJM0dwM3c0dmRSam11?=
 =?utf-8?B?V3ozMFE2d2F2bExrMU1rbmxRbWVLeDhBK0ZSQzVvVEdGalNWVk9JSldyL0hL?=
 =?utf-8?B?dWw5MEdnWWJTVTJ6bVN5TlN5VTdDMTJOZU02MGVaeC9UWGxGRUFLRGtCUHNr?=
 =?utf-8?B?UmY0TVZ4YVBxODNhclN5WkpQc2pBSXZydldSeHpCR0IvS0phYzJ0TTE3dThJ?=
 =?utf-8?B?VlI5bXdBaTU1QjA4VjFtWUcxaXo3eWRkeTljendwTVhoT1JnVC95K0dEQ0VP?=
 =?utf-8?B?ZTlzWHZPdmk2dmNFZjluV2EwTjV0RTh2VUtZMk1nbGkwZVJDTytOc2ZjRFZu?=
 =?utf-8?B?eE5URWozUEsrK3l1RTVYRUdTOTU2dUtXR2ZQSkZUYnFKTGR0OWlDenhndS8x?=
 =?utf-8?B?dnk5VVhRYmJMSjNqNXhRd2MzbWVOc1N5WVV4QlpLVlh2MkNOVVBoUUxuYWVP?=
 =?utf-8?B?bU1FUkNQNzBaK1ZhSVRudnJjTnpnTjdsTWg4dFdsT3hOSkYxbGJRN0RMQkdr?=
 =?utf-8?B?Tm1FaDc4ZzhteHBhTHA3aUdtdEcrOXBMRWl3akRkcm9aVVV4SzQwS3UvMHI5?=
 =?utf-8?B?c1VONktXRVN0aCtxZHZSWDVZTzVyN05VRjlWbktYUGRzWTFublJENHBNWkI3?=
 =?utf-8?B?L0hKTFBjbFcvSXR0UlpsV21ocnA5bFN1QVBjRGR6OHNEUXFzeDArWlFtZ2Rz?=
 =?utf-8?B?QjJEUnZPaHFxY0FnTVdSb2d3VzE4S0FHWEhLbllqMXlwdisxL3pHNVpIN0RB?=
 =?utf-8?B?VG5vOXZqdXh0ZHNOZlJ0WnlCc3RmYWV5cm1iSDNHUUZyYVlUVVJldkJQUWVo?=
 =?utf-8?B?ay8wbkZQR3h1V0xLNXBZRWczalJSS2VNbForWG53S2dBcjlvdmhVTVQwdnRL?=
 =?utf-8?B?QXcxYWxieE42aVdWYWYyM0xic3VzUjFZNTdNNUNOb3NMVFJGYXNZSEs1YTFJ?=
 =?utf-8?B?R29qS3FIQTByVDc1Nzg4VHU1bmtTcjEzWlRFUFBlckttOVpLenVtM3FpNE51?=
 =?utf-8?B?ekVwZVlnNmRxT2gvcHdUR3RWNGpmNElqN3Bha01hRzBKUkdRRmEyTjdhME9p?=
 =?utf-8?B?TUVmTzI5Z1ZhdnBwY3RYaU5HOGtSbGVPQjBKRksrcUJYeTNwR3dqZmZaVzAy?=
 =?utf-8?B?OUQ5emxjMm1LdE13b09XY2c0M3ZYbVBvWXZiM3BZa2Y1UHpkbUJaZWFzL0E3?=
 =?utf-8?B?M3g4UVZaN2NRb0wzaGxsTlN5cnhwREhBNS9SRHpJTGVwWlZ3M1lON3VScks0?=
 =?utf-8?B?Z1VUQkJPb0pBOEI2ZTh4RHJMSWFmKzZNelloQUhoRVU2QXhhRmk4b3k4NlYz?=
 =?utf-8?B?WFl4OW1GOTVQMVhkZTMwN3FYSHdZWGV2N1ZCRmt0NDF1a3VWMkUvL3JrTXJu?=
 =?utf-8?B?cWZCU3dzUTdjODJETTRFMXFmMmppeUpkaGI5dVhOMTNOMVdodHE4ZGZHZlYr?=
 =?utf-8?B?YmdQUmd3eC82eElUWlloSGwrNThMY1ZxOHJLMnVmeTZvbmtjemErMXVVMkZR?=
 =?utf-8?B?Qkd0bUdWcjZTdHA2R3hXSVhWY1FNQUhla2sreG5ZVFUzS1VTczdGc2tNelF3?=
 =?utf-8?B?MndsdzBJTkdqUVBqeGdZZVd1SnZVU2pUaXkxVjFVTkpUVUlFTUpOWkJ6aWxt?=
 =?utf-8?B?T2tOMkp0bURnaHNidGNCMkgwalJVOUNvWjk3Z3R6YlJWVDBINFgydkhsQzR1?=
 =?utf-8?B?NnhmVWFwSWltalFUNG5PZDBXVlZDWVcyYTZZWjlkc25zNkl1bE9qTmk4dlho?=
 =?utf-8?Q?kwz5qtAl1bbdCdYIdG1kMlYcX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 703d1c77-a3f3-4fb7-448d-08ddb8afdb44
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 14:59:19.6526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nzkrcHXtfcBrImiAdnvigxYeD9t8UHkxVuI7lMrlO4cV4BLHTARyudwy2dDrlO9AzpiltPn1E3uVKOVJZgpRAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7525
X-OriginatorOrg: intel.com

Hi Libo,

On 7/1/2025 3:32 PM, Libo Chen wrote:
> Hi Chenyu,
> 
> On 6/27/25 00:33, Chen, Yu C wrote:
>> On 6/27/2025 3:16 PM, Chen, Yu C wrote:
>>> Hi Jirka,
>>>
>>> On 6/27/2025 5:46 AM, Jirka Hladky wrote:
>>>> Hi Chen and all,
>>>>
>>>> we have now verified that the following commit causes a kernel panic
>>>> discussed in this thread:
>>>>
>>>> ad6b26b6a0a79 sched/numa: add statistics of numa balance task
>>>>
>>>> Reverting this commit fixes the issue.
>>>>
>>>> I'm happy to help debug this further or test a proposed fix.
>>>>
>>>
>>> Thanks very much for your report, it seems that there is a
>>> race condition that when the swap task candidate was chosen,
>>> but its mm_struct get released due to task exit, then later
>>> when doing the task swaping, the p->mm is NULL which caused
>>> the problem:
>>>
>>> CPU0                                   CPU1
>>> :
>>> ...
>>> task_numa_migrate
>>>     task_numa_find_cpu
>>>      task_numa_compare
>>>        # a normal task p is chosen
>>>        env->best_task = p
>>>
>>>                                          # p exit:
>>>                                          exit_signals(p);
>>>                                             p->flags |= PF_EXITING
>>>                                          exit_mm
>>>                                             p->mm = NULL;
>>>
>>>      migrate_swap_stop
>>>        __migrate_swap_task((arg->src_task, arg->dst_cpu)
>>>         count_memcg_event_mm(p->mm, NUMA_TASK_SWAP)# p->mm is NULL
>>>
>>> Could you please help check if the following debug patch works,
>>
>> Attached the patch:
>>
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index 8988d38d46a3..82fc966b390c 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -3364,7 +3364,12 @@ static void __migrate_swap_task(struct task_struct *p, int cpu)
>>   {
>>       __schedstat_inc(p->stats.numa_task_swapped);
>>       count_vm_numa_event(NUMA_TASK_SWAP);
>> -    count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
>> +    if (unlikely(!p->mm)) {
> 
> I am starting to wonder if we should keep this check and add a big fat warning
> like  "there is a bug here, please report it!" rather than brick the kernel.
> A kernel panic, for sure, helps catch bugs like this more than a line of dmesg,
> so it's a tradeoff I guess. What do you think?
> 

I agree with you that adding something like WARN_ON_ONCE()
could help, and it seems that the kernel panic is not expected
in this scenario because this feature is a statistic calculation
rather than the critical logic. Maybe waiting for Jirka's feedback
to decide the next step.

thanks,
Chenyu



> 
> Thanks,
> Libo
> 
>> +        trace_printk("!! (%d %s) flags=%lx\n", p->pid, p->comm,
>> +                p->flags);
>> +    } else {
>> +        count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
>> +    }
>>
>>       if (task_on_rq_queued(p)) {
>>           struct rq *src_rq, *dst_rq;
> 

