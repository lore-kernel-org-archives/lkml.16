Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA1428B4E4
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 18:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744654377; cv=fail; b=nnAs+XrxHz9bUj1NJF1rHENqyQMXul669LaBjuqhDiroX21nGKJMLYNygun09thEB9c4DLHx8H05zxdLfsPbuXf1M09lr5exJobZpznn7KP7Z6pLyp4IGvs+x8cgwi5nHAHyir7d3GnNoBapB+bSewmpKscVT1rwFT5zZiDedLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744654377; c=relaxed/simple;
	bh=/h4RnR8EJELy1/1ohcCA1bKKBQTGj79Hd0c2HLqnvgg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FpCHak8vqoL0KabwJttvN47WjUccNul47adOLm+H+13nzJZ0fiGiVQQeu1q/DzcYT2KAhZ212mInQ120ZphIuHWTRFqecModPTkJoFpAbymPMoyh7d/yP5yNIVL6OcuCh09kDGdxT/6RGkRSOkJ4T/f5vwH3WA8GQrRgXxUzSFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X1TZ/iXZ; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X1TZ/iXZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744654376; x=1776190376;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/h4RnR8EJELy1/1ohcCA1bKKBQTGj79Hd0c2HLqnvgg=;
  b=X1TZ/iXZVkotjZC8eeNhhSOlUyXT4F6A+IAW7mdhN4GqmnkDrgODqgu5
   wuqpfqJ98KadFKrw5GZTf/iJhAvylBKxYA2pw6DQLouxEW0YGejBfaqFY
   BSSls7Ehwn55cxAC2QgmbucZLnR58tyXEFiB5mvUGxcORHuHoCh+VQkUr
   rG2DGwEd8x+YqtTjpwhIxG1uCqquyd/YdVAwpFO+CMLA0GGkt0n0Fq9Fu
   WNiZR1VWqLRiZvnk/7Mjaslmxq1Hz35pSDduuA0c3C4PlD+drhEYp41KR
   8482jNAP1vEe7he3g45u/26uDxoyNHWdbiYnN6JKXEHcMAwnMqoNhb+A6
   A==;
X-CSE-ConnectionGUID: oqsMz3MhSgq8V/g/XKHEJQ==
X-CSE-MsgGUID: zBSV3wRBSySEPA8q8FcQsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49971227"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="49971227"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 11:12:55 -0700
X-CSE-ConnectionGUID: AXVuovbKSrmrcijeW6H1dA==
X-CSE-MsgGUID: GlcsXTr6TrW2CDfSwHMQsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="130424752"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 11:12:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 11:12:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 11:12:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 11:12:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fy22wS86cRnsEfgm+dS/rinRf9Oogs4UZOWtw/K66YYv/hW6/5zsxTSyt62FbgflW1Gz4EicpFq5DJrTXKujd5RAA9YJo7THkr0Io01fowV3IubA+for+eANf6qry7KiqoDR8O2mTKyQ0ug/ip2I5A36KFDAy+zwj9IB83kCuK5BGk26FIDjCZnViNqjnfliWHW5WzVi1tgxWVqfAdJt1oZuxOIiud67+7hJ0pzzdu3bD25yJFd/aPPwhAsZLbfzU8eI2X/r9Yng6XdLdOf3OEPzVxZ2jGyz3YX54p5M+WDeVeuJNac0nlpZG4f2vOF8jMPFytn5VOoLAlHfnE/9XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgCQl/1a8GI0fAHofdBw+tm1PaBYmO5+nBn8RkgUx+4=;
 b=I3F8UwbRdEM1JgFIY0Vzbkw8/X/ke6w9dILpMw8thC9KWqH2TiSpraM9v7GlPdBIFlujO+XvaeHc49s1xsCwtm1Cdw0NM0AWLbHwdp6Yd3t3NqwX6TM9dBWzq0OeIuNQkdLyyKcR3Fa82GvASQv/AJxEWL278UpEOFSt88wMrPV+/uvgq0Proryr6uShpE16IJLpAlq4f626YTx2kGs7yMMDPm3u8PIXhsesC7aGCsKtAjRMH8fmMrQauatb1lJE1Oqn1DC3m5b5RlmjLraNckIBv8+df7GLXtpCOXX0IYG6PS6FNLnA73jZwWo/N/qSfzhhvTNrR0EhHxJ7JMuRkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by MW3PR11MB4716.namprd11.prod.outlook.com (2603:10b6:303:53::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 18:12:51 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%7]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 18:12:51 +0000
Message-ID: <c395a18f-0aa1-4400-80f0-517acd10b21f@intel.com>
Date: Mon, 14 Apr 2025 11:12:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2a 5/9] x86/cpufeatures: Add X86_FEATURE_APX
Content-Language: en-US
To: "Chang S. Bae" <chang.seok.bae@intel.com>, Dave Hansen
	<dave.hansen@intel.com>, Ingo Molnar <mingo@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <x86@kernel.org>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
References: <20250320234301.8342-6-chang.seok.bae@intel.com>
 <20250411161250.14662-1-chang.seok.bae@intel.com>
 <d076ee8c-0c22-4e99-964c-5ea254f5be14@intel.com>
 <7b91d929-fe97-44c6-aa94-05417bce1014@intel.com>
 <009062d3-d4db-443f-8337-ae4223efffa1@intel.com> <Z_onl1QbH9L1-8dq@gmail.com>
 <Z_zGCCNE_Qt3IlMZ@gmail.com> <eb33f181-a89f-47a9-ad98-f5a079920950@intel.com>
 <d6d19e39-2749-4d45-aeab-a209a0ecba17@intel.com>
 <10032664-c16e-4599-ae10-3d2b1aef0265@intel.com>
 <a218888a-fe10-48c4-a61d-6f1a93da5a06@intel.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <a218888a-fe10-48c4-a61d-6f1a93da5a06@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0167.namprd03.prod.outlook.com
 (2603:10b6:a03:338::22) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|MW3PR11MB4716:EE_
X-MS-Office365-Filtering-Correlation-Id: 51c5682f-db97-49d8-b016-08dd7b7ff830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmhFQjVNRlYzYWcyRHAwUmtzOFlFWGF3Q04wYlBPNDdDTUdaempjNjVhOXZI?=
 =?utf-8?B?NXJFTGhDSkpva0h3aThMRXdjc1EwWjFUbmpUaDV5TFFqbk91L1dzYVhsTDZU?=
 =?utf-8?B?cDBiNVVnN0VtK1lhdEViZllwQTlibzY5akhlNGdyWmxQemgxZXVBT3I3OUhN?=
 =?utf-8?B?azQ2U2JINFFEUGFKQ3RzbmRFOGYzaXh6aWNvQjhsbFhGOUFESlpZTlhNS01D?=
 =?utf-8?B?THhZbXpLN3VVTW9rdGxQTmIvUlZXMElkdFZoT2RCVkZsbTFDeTB2bTNvb29E?=
 =?utf-8?B?eU9iWnFOVnFnRVRIcFVaWVIrYnJFTHRpMjhpdjVtYzZUK2hZN3NjeGFyT292?=
 =?utf-8?B?bHl3T1RkT1RoYi9NcUt5S1dqVlJTelBtU2R6bVc4aE9uMm5xTDJZV2o0d3JQ?=
 =?utf-8?B?RlVUaFgvZitGckFnR0hUNUI3NnFHR2ZuV2xUSnRTc0tEeFlxQXZyVVdBTERY?=
 =?utf-8?B?N2g1OWpzYzZpMHBpalF1bmNWRW41U2ZOWXRYK25KSXZsUHhKSmtCVUpJK2Iv?=
 =?utf-8?B?endPRHZLaHNMRGJKeDAvTkZpdTlSZE11dTFqbXlpVllKK250cDNQNGJQd05l?=
 =?utf-8?B?M05qUk9lYWc4NGVmRDNub1VZVUxYd0VkRkNRdFdmVzI5NXorL1VuUnp4OC9P?=
 =?utf-8?B?by9oSE1ZdWxNaitvaE5iVi9MNXFjRTQvQjhDQ291ZitPZm51eFE1NWl5Rldj?=
 =?utf-8?B?eHNxZXpFWjVObEYzTk5hdEVvVlJLeHpmNG5PWnQyMjVQWDhUcEd6R2dQd3M2?=
 =?utf-8?B?V0FCY3ltWDlYcDR5a0syN0JzZmFCYUVvSXd6U0V4bFo3cHgwR3lDcFhlUTJO?=
 =?utf-8?B?T2tyZlFLT0lWSGJNc2szbncvb2VlVWo2QUxBOVE5RncyV1FZeWZUVXVEOUVa?=
 =?utf-8?B?dGd5Nk1Sdlk2dEJjK0NpT1RLMDQ0cDAzQldFR3dNeWxNNzlGYUQ5b1QzMDBM?=
 =?utf-8?B?VUd1NFpxNHlFZWlQcUt3Y3JBZVlVSkRuOFZUdVRxaStOOExLbFJaeXB0bFFR?=
 =?utf-8?B?NDg0NXk3T0tZNU83UWgrSUh5NkZOa1kxZDAvVGZNVTdGTmN4Tno5YnB2dDY0?=
 =?utf-8?B?UjVOVExvU1hYbnppb3FwVDBMNTQyUEdUbVN4VTRGMEp4d2JZZythUGN1ZGZW?=
 =?utf-8?B?NTJFeUtMR0lRMjRmeGQ0aTIzODJubWxCODRYZzhpYTdjcmlZbmRnMFA2ZXZl?=
 =?utf-8?B?U0VVV3p6TU9TalVQRW1SWTM1TmxMc21WY3lsL0wxSmV0OUI3MVdTdm9XNlJz?=
 =?utf-8?B?SjF6RCt6ZUllazVXbXFJZ3VLL1Q4MUNITTJvblNvdlVYMGQzQnkyWFVCUitG?=
 =?utf-8?B?QUhTSjZHTEJhRENPWmlCcTdBRHBqYW94WEx3bWwrYTFqTHdkeTRxOEtNb2xW?=
 =?utf-8?B?TDVMNDB0UmVyTTREbW8vb2o5L3kxcHNVS3NSaGd3bGQxZ24xVG9JUjVSVWdR?=
 =?utf-8?B?ZUJLZDVhR1dNVFRxUG5Zc3NGNlRkVzREN1p1Ty9yNys5UG1vaTVoWUdpSjBP?=
 =?utf-8?B?aFB0Z3RmQzNHNjkyNk9QOCt1M3FLZWFjREVQd3lLaTdBcFUvZzc5UjVRNkxR?=
 =?utf-8?B?ays5eXJndGNZeTNza2FJK20yVFdjYmZUU2lWZGhCek03dy9WNktXWGZzUith?=
 =?utf-8?B?bUNWWHB1ajBvTzNmc2tWRGlHZ25KdlRJRkxqQ3RaWTVqUGQwTWp2M0RUVCta?=
 =?utf-8?B?Z0NEOExMeXFrSmRCQk5UVUd2OGpwa1pzTDluQzJGQVVmSkdhMnY5cXNVbHcy?=
 =?utf-8?B?dEhBRUhPYUVDRG9PcmhsSDhVeTRJUlFyVUpRZFBWb1hJbHlEdjlrUXJVWHJ6?=
 =?utf-8?B?c2pTbkhmUytBWHhqRFQ1eWNiaks2RUxxK1U2bkFSN3Y4cFVTNGtRSGF0RmU4?=
 =?utf-8?B?OUZoSzFkaVZRdmNlbjhWbnB0TjUwNno4WDA2K0F1YlhVcFRZZE1xMGhKTllo?=
 =?utf-8?Q?8f/vxVdNrYE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGdBanZPOXVTYkVCN0lSeWsrMGE2bEhnQ04yLzBvLzBoK2hIS0FQVWRMdm5v?=
 =?utf-8?B?SGF5RkxnMUR6cUFQdk5qNVMyRjljeEZNSDRQQ1lxU3ZkK0dZbW1MNmlyVndW?=
 =?utf-8?B?THBOZDhlN0t3emhaUTBDMm1ZbGttditESTVpdlBDOFg4K0FSK0tneWlYYlpN?=
 =?utf-8?B?TGwyVDVIVnF6cDcvSDFYZm9xNkozWFc0c1h2b3lpT3UweUVWcXJmZHdjWEtI?=
 =?utf-8?B?eWJTYWtmRVRWMUlmRndFVkw0b3h4NzhxOGxIeDlqVzU1UVFBUWZnUEg5Szds?=
 =?utf-8?B?QW0wbGZZd3B2UlZ5T0liYjN6R0NMcGJ5a2duK1JVaEllSkhkZVBPV0M5K3NO?=
 =?utf-8?B?enVlSXFGWGk4eVE4SE4veU9VZWpLL0c2d25kUXVMRG12aVpWdWh0TWxiV1dY?=
 =?utf-8?B?emN0WUExTGRqa1puTUkrZW5JZmxvQnVwYzFQeWVwTEpJbmFoSk1hRnYrekVQ?=
 =?utf-8?B?aEVDLzlkOG95LzFaVVZtYm5UTk1hbTlHMnNMU3RYb2MweUljMVRWdWVGekRD?=
 =?utf-8?B?Y3MxeTlGUCtic2doYTVHNkdDNGRKMGxseVpLNW93elYzR2hLN1QyM29Wa3pB?=
 =?utf-8?B?RGUxdmJCTlYzcWdtWTRUY04yQUNodU9UUXFVTzVDRzJLQ2daUkdCeVU0WGR2?=
 =?utf-8?B?RFFJVk41WVVteWttR1FGOWFBOHdFK0dubVJQaVVWbXJmYU9IUVZ3M3hpcCtk?=
 =?utf-8?B?eWRNajFtNFBmM0NaMXNUZUtxQXJPNThJQ1RtcFQ0OEZySUxqZHZhRzBwUkQ2?=
 =?utf-8?B?QW1CWDI0UU1sTmxNSUFhWTc4QzlaUnFZUVhoSFpNbFVlQUsyZ3lqTE95blVz?=
 =?utf-8?B?Y2VtNWVwcHFMS2MvdWRMUTVZSGFRR1dYcWtoeitmL2E1aEdzdUc5ZnpEUzJJ?=
 =?utf-8?B?TGlOZmJLaWtxcjlScWwxT3Q5cDMrNGtvL0o1bVA0bnk5cjRFM3RmdkY2T3Vx?=
 =?utf-8?B?NWl0RThid1dkZWhCRVk4T2ozQmlneE5TT1BqYWtMM3hKeWw3azVTL0JUL0Vz?=
 =?utf-8?B?SVJIL2JGb21qV1VjZFpoU3pNNDh6em1LR2xRZlVSd0lCVHR1bko4OEhxUHo3?=
 =?utf-8?B?Qkc5OU9ZWjhHMGE2L3R0MDhGUU92Y0JvZFRrQXRuSThlUjFHdDZuRkI4TWZF?=
 =?utf-8?B?MnQrNks3YTYxODZJdWcxM3FGZyt5d21xUmlVa2lFbk9rN3hjYVNUMW5HcEc4?=
 =?utf-8?B?R0JxWWF0THo5MDFxTGpGWUZrc1J0MmtEb01MNmNGQ2N6K2ZVSitWbndORW0y?=
 =?utf-8?B?cXJ6ck5YOG5YM0pCQjVjSDVvT2VVNkoyVGpPOGp6V01SQmsxbmhuUDlDSEhO?=
 =?utf-8?B?QnhQN3hqQ1dBcEUrR2crUHhYalozWGF3SGZwRjRKOU9UcEZSMzgrVzJkUEl0?=
 =?utf-8?B?TDFXN0JBN3p6T0Y0ZmRqSEkrcHl2VGh5TmEvcFdNM0p3TE1DeG9JU0VlemZu?=
 =?utf-8?B?Q1VNaEVjeEVvdU51VmVaMDZaeW93SXJsU2V3b1JuU0hXUzFoV2NjUVZ6RFpz?=
 =?utf-8?B?ajBrTFRZK1JONVZnUURKMTJGOVNTbm8rL3VGSGF2K2lvTEJyci9GcGFnM0c4?=
 =?utf-8?B?Q1FWOXZLb2JVQnVqcndPR0ZJUnVxYXdEMHVQTWlKdTZaTkFuLzhXelNJVFZZ?=
 =?utf-8?B?RHVoTmluSkNSYXcrbFRUM3BTOE8vcVZGc0RVem9LbHljOW1Zakl1elk0Smp3?=
 =?utf-8?B?T1cvbytHUlhxaVB0SW9SeCs4TDVpanNlRHk0bUEyd1BXR3BzNnpYcjBLK0Vi?=
 =?utf-8?B?bEk1c0dOR2pQL1NZNkNKaHNPMEdXVFB5Zld1QzAram9ZcEJtRDl6aXZkMzZM?=
 =?utf-8?B?cWxpVUNSMU1RVXFZTFJRWEdiQSt0WkJjeUxiZ3ZGUklxdXFMODJ4dUN0SDhl?=
 =?utf-8?B?Vi9nR2NHRzJmaW9jdks1M1BTRU8vTyswdjAwR2J2Znduc0pRb3BIRm1Fa3Ax?=
 =?utf-8?B?QUhZUStuZlJDMmtNWGRwbGlybTJacE1rVmlCTmVMTmFPMXJtc3lXUndGNldV?=
 =?utf-8?B?ZTlpSGNSeHBpM0RRL1pxbU1CZFFZUGxvNXNyZ1RORWFVekZNWG1YcjFoTmhh?=
 =?utf-8?B?WFltaWV4Qlg1YUpWTWhMWmhGRWUrSkl5RXpaZUJLUWR4RC81aVpKc3lObmJI?=
 =?utf-8?Q?TEbUpY2uCneLmHE34zjTkNorJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51c5682f-db97-49d8-b016-08dd7b7ff830
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 18:12:51.4141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljR32uHhGfVf0u+Gvcj2YHHYsdO5HHMPNt/pLtVu1TMFAYkwSWnimz1e7mB+bK3bohb5UIYJztowwdoIkBVewA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4716
X-OriginatorOrg: intel.com

On 4/14/2025 11:02 AM, Chang S. Bae wrote:
> On 4/14/2025 10:45 AM, Sohil Mehta wrote:
>>
>> That way my initial inclination as well. My suggestion was mainly to
>> keep it consistent. But looking more closely, there is mismatch already.
>> So either of the options work for me.
>>
>> "x86/fpu: FP/SSE not present amongst the CPU's xstate features: 0x%llx."
>>
>> "x86/fpu: init_fpstate buffer too small (%zu < %d), disabling XSAVE"
>>
>> "x86/fpu: xfeatures modified from 0x%016llx to 0x%016llx during init,
>> disabling XSAVE"
> 
> 
> And you also left this comment in patch 7:
> 
>  > It might be useful to add a "disabling XSAVE" print at the end of this
>  > statement, like the other error messages in the same function.
> 
> So it sounds like you were suggesting something along the lines of:
>    "x86/fpu: Both APX/MPX present in the CPU's xstate features: 0x%llx,
>     disabling XSAVE"
> 

Yes, this is what I meant. But Dave's suggestion to add a common print
in fpu__init_disable_system_xstate() is fine as well.

> If so, I see that as an improvement to the error message rather than a 
> functional change. 

Maybe functional is too strong. I meant a minor code/message change.

> But I agree it reads better and more in line with the 
> other cases.
>


