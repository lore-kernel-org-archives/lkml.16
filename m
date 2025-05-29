Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE11B67F
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 17:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748540267; cv=fail; b=dl37qO7PD77M6frrpaAVCYeSuue9fq4bG0xj+7F1FTxdGfXjI4empPUtXD08yebLAlUCNQ8FWLvuW2jrYbsqzOe2N8QkJnNXnkYGgaKp0frnj80bZaXm3etJIp1Uj6dn1is3vrGi+ZTzBaZyQTcPax4qfTIFXkQ4zwDLnZG9Qj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748540267; c=relaxed/simple;
	bh=+SSNaFbXEDjAOtRRtDIxDqH8Zfzch+/V3zIR/3Gkdls=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jbpcX5Uj0ubFJaAQfI7GcRU+WOv5tfo/0/a1quN/6TRKjhdssJ2qQ5N8Kd24dGz4THd+E8XtKI/GhfQeJtvVHPIFUmDVXXxkVvzKUdEW6AaVV4WsZt5OCXlUdif6ND2170ESwjiGjRxpcSyn/iK1ib4wN1aIwAali/EUDveswSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bKow4X1c; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKow4X1c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748540265; x=1780076265;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+SSNaFbXEDjAOtRRtDIxDqH8Zfzch+/V3zIR/3Gkdls=;
  b=bKow4X1cTMX5lpEjC38c5OtaLWIBa/ge4HMcNfvABlsxmZ0WgAGFuNc6
   R7VVcqVEZaBVNqBirdEk1egr+fF3PQd1OlnBzg4JTtd6+cfM228fJlrsJ
   DGLQhz4lTk3LKEb3OJpneCnuwnWjcApOeJKFmmmzk7AY7rNdstXV3MDP1
   xZkFJ/1HxrFEMOe9xamuy6W3n9gKajtMmaKf8V6d8rMZ5en4OPy+40SlL
   Iwfi84WcG9ZSnAvAOdwHxUn/LobZXdZwQCDT5Z3RWw8SXxpYnL7/i0sZB
   wkwduc67PlSp39lEucqLJmq/DDZSrQjKjETSwEcyMA2pnbSQ+L3KbiniL
   w==;
X-CSE-ConnectionGUID: mtTGnkXqRqGpDc+vc9jzFg==
X-CSE-MsgGUID: 0BvAzL6SSpO7Q51bNk10vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="76009645"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="76009645"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 10:37:44 -0700
X-CSE-ConnectionGUID: sWqaS7fmRBmGqG0ASsohYg==
X-CSE-MsgGUID: xhyD5+veS7Od+PU7nrHiQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="148415523"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 10:37:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 10:37:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 10:37:43 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.59) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 10:37:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPULlT7kVNtT3TkQEOLhV7yxCyc993q5tojvcUKAzlc67dfduNk46QMdvNA1Eq1Zk63HGwylbMATJ0jyj8YMo8JmUCF7/GWRp/767JuOvc+zKepGXo3/AhRTazBcujbpI7EDa82FBtqA+GnE3uShKc7Ue2UnpcDAKXoRv7rb5Q0GLVnooQiwpVhwqxNFoxzQMlo5RPpRWtnOJF5V/l+hA6xnpFQb67LGdpfXkKi7ze/7pW+k0z+Oy82OQ/Jre0hCU3cvT8YMzUtQuqxP9YAnkmrw1Y/Z5v52YuvpoXs15LZwj3BvzQ5c0Nw9bogqQdXTvLhixjUPMVTq1crUrelipw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrlpC32G+vwh/Vau0sC9hIgJ/pF9DUwPJlDu48JPq/M=;
 b=tvObiS60iYLl9CvR9H/BQaRCd6fBKobXtgP/TSswNga2JZXQ9l7qgVly2O/zw5AfCz05aM9SEmp2OSGLPOw53bmBaQORrrEZx+yBceqe59jtQry3WOfl9wr94U8rHeoJyA1OUOLFWNZhz0zTutDHKy+6RNxAtQB8Y/8JBvMEwXZPNNzFzu/dEn0buRJxsWxN4lUjMISr0cV5lWRkoHB6/e5x8DI/GuZE/Xj7hFmqCwQlb+0bnjkmTFtOph9ArTCkY70Qsv2mGQaILaPMXtVAX40YgzB1fRN5hkLGw8JBy56A1wWZuyrSW9RqJnl8MeGPteX7RpqvpB9NhSeWAKoRIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Thu, 29 May
 2025 17:37:35 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8769.021; Thu, 29 May 2025
 17:37:34 +0000
Message-ID: <b0b3e665-4c4e-46d3-aae0-37853482938a@intel.com>
Date: Thu, 29 May 2025 10:37:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/1] x86/resctrl: Remove unappropriate references to
 cacheinfo in the resctrl subsystem.
To: Qinyun Tan <qinyuntan@linux.alibaba.com>, Tony Luck <tony.luck@intel.com>
CC: "H . Peter Anvin" <hpa@zytor.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>
References: <20250529031650.63880-1-qinyuntan@linux.alibaba.com>
 <20250529031650.63880-2-qinyuntan@linux.alibaba.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20250529031650.63880-2-qinyuntan@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0026.namprd10.prod.outlook.com
 (2603:10b6:a03:255::31) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CY5PR11MB6211:EE_
X-MS-Office365-Filtering-Correlation-Id: a6ef948e-6fd1-4581-9938-08dd9ed77f25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0JrV3dUMnY0akVNaktIYlJ3TmUzZ1hKY0RncEZ0VC9FOGYvNE8vZFd5VHMr?=
 =?utf-8?B?V0Z6VUZFSUJBVWtDY3F1VG5IalVyNXVXdW11eXBlaFBKSDZjeHg1Z1UwNThC?=
 =?utf-8?B?clhzNVdFNTEzQVlFY0ZqZlh6N000WHlaVk1SM1BMVm1YREJTbFZZeTUwU0lB?=
 =?utf-8?B?ZVdaSE1FZFFWZmorOEt2UFZURVlLSTRsT1hpUWUvU0U0aE1oZDRNUVNQWFVp?=
 =?utf-8?B?TXVkbnNSOHlxSk9xdjVHc0VPc0M2bm5TemxVTGRxbHZWcVFuNStBR1d2N296?=
 =?utf-8?B?OWNPNkd1SHVkU1NsM09HNUtseWxpSncrRmdsZTU3YTNpWS9wSENCcG5XUCt3?=
 =?utf-8?B?Q2FlRXJaN2VyR1dyeVFJcHRRbjRVUnA5Y3Jvc3B5WmVjbmRDbUhCMUJSU3oz?=
 =?utf-8?B?MWppaW1aT25XdHZZYzBva0h3VlJ0eFVJaUE3VHEvUk1ienJtVG1aYnFBcEpr?=
 =?utf-8?B?cGxHZTRDVlBibnE3Tk1xejhSR3RPcE1IWFMya0ZIYVVGRE1hdzdldERZY3dl?=
 =?utf-8?B?d1pYMG1vZUkwRXZHWDY5RUg5SVF2dHdmbXNKUC9sMjJRNG5wVWJPektGaXFC?=
 =?utf-8?B?aGsxZnRYT3VsSHNaZVFjVEVrZDVWWDJwc01vSUY4M1liOFFVRFZJTWdVM3Rn?=
 =?utf-8?B?TWtTUWo3V0Z4Yk5nM2t3bjNYL2VJMEJaOVNXRDh3UkV3UExVWGp2eWs0WWRp?=
 =?utf-8?B?cFZ3NnJxRjcxU2RmV2ZsWUp6bzdjZEtmL01jOERhYklpQ0d6MnhoYzFpU1pz?=
 =?utf-8?B?cVM5UEU5TnR3d0VOd0JNRTRTMUIyNFc5U2c4NzlBbURvc2UvRnhwZThNTGR4?=
 =?utf-8?B?eElIZjJRb1F0YWZpdno2eE9ZUEgxUHRtK296Tk15UDBXQnZ6eGZON241TEdQ?=
 =?utf-8?B?OEx2cFdta2hiWGlyZ3R5RCtFK1hBem1VbFlyQkpBMGYvK2RQdytnTGN0Q3JQ?=
 =?utf-8?B?RlE3YlUySjdCbkRCSGxoQ2pRQzFmMlJlUDVua1I5a3g5TDNKVlVINXVaL1ZU?=
 =?utf-8?B?b3lnb1YzODgrV0xudlUwNlUrYWFzT2VNRy8veUJsUXphcWt4RndYVGhrNzhI?=
 =?utf-8?B?NHlDWlg2TDJTUGVjakVwMi96KzF5WG9QWWlDOXhmZGNCTUZzZndDWnU2RWF5?=
 =?utf-8?B?ZXJwaXpkekIrNndjcVdRRmlMRjhhcXB4NVpOTHNMMG9kcDJBcXh4MWJNNGM3?=
 =?utf-8?B?K2VjUDJUclVITnUrV2t1Qm4waTlMZ3owQkdzZk1pSEtsWFhMN0QzMjFlVmhu?=
 =?utf-8?B?OTBpSDR6TVVLTENwbUpNcDhzY3lMWE9tYkZ1R1l6bkZOR0dtZkhpOUdrcm91?=
 =?utf-8?B?NEloS1IxcElGd2F4cXdxVU9aMmVZSWVIYk5DemNLSElYUis5ZXVVZFBpL1pM?=
 =?utf-8?B?aHA2SkVpMXBueVcwM2l3TDFCMTFoV1pURWUyTWtlV3NWOUtIS0JmWGJzbDVE?=
 =?utf-8?B?TVhYQVpsNmhrTjNHYXFSeG1iaUh1MzZiUzNOZXlUMnREQmd5YTFNV0RwOVd5?=
 =?utf-8?B?SG94cGd3RjFhczg4OVJrUy91NDQ0WEozdG8ybWtsSHZtRE1xbU1Sd1ZzdVQz?=
 =?utf-8?B?NlN3UTVxL1RPS2JhS2c0Y3FveDJuRDlPR09OZHdlU1lOYW81b3E0K0pqVVRP?=
 =?utf-8?B?b1RuLy90cys1NjMzM3Vod25VRS84NEM0SDU3dnBSVWtRVDhVYURtRms2b0Rt?=
 =?utf-8?B?Y2NpbTNCamJhaTgvWFJEYng4bFBGMGgzNm5GNzhLREZhZng3ZzAySVYyTTFQ?=
 =?utf-8?B?M0k4c1lUWW9teTFES09Jd0RSMEFNZVZSTU0xR3MyVFdNSHJobU54cldFeDMz?=
 =?utf-8?B?VXU1a2N0NnR2ckF0RG04ckxzNTFjcmVxcDZxME1SZXkzeVdVTlpEZlRhNXZn?=
 =?utf-8?B?bHJwL1FGR2c3RXlqTjVUN3ZvM1FsNE13YlR0a2E4N1pmaGh2a1kwR0d3UE9i?=
 =?utf-8?Q?dE6YUtY3bvk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1l2QlZpWmZqL1RLa25Nc25odWw3aUlKMDY3aHZhMmVBT1hPMGU1VDVUK3ds?=
 =?utf-8?B?TUpoSFNtTW10QXFwb0J4WXpKb1pCRURWODhHWmJ3ek1VUFRoT3lNalNyVkpN?=
 =?utf-8?B?Z0UwYVF3SHpaQTBsNkJJMlptc3ZXUWZmOEtKNmx0dHBQSUIrN0svVEZFNldR?=
 =?utf-8?B?QnFDTXBrUWdjeEhtNVU2NlJtQ2tKcDhvM0hTdDlLN1gzRDZ3OWRMUGJwek0v?=
 =?utf-8?B?SXhUOVZnM09hNUR3anlqaXVhZHJYMk5xUHRzaHdNRGRNOHgwZlRmWG9kT0tu?=
 =?utf-8?B?bWRoQVNJRG5DTlhNTXhUYW1qNHFMNHUrQ3ZCTStWTDFKSWFDQ2xhNmRTKzd0?=
 =?utf-8?B?L2JtbUJMOVNvV2YybFUzbUxhNVlYQXRFQzYyZHlqbEQwRG54RjcwUzZVSXdG?=
 =?utf-8?B?MzBibWdrNUtoVERZM0JRdGxsYzRLOWNOQ0tNaFd4L3dxNlBSaVFWN0p0Vklp?=
 =?utf-8?B?OTNJNEczVXFrWVBwaUJsaU5ZSmhQeEttL0U5UHJ0dFhUSW1ZVHlhZ05yaXRs?=
 =?utf-8?B?eVY2NjVFU2krTlMvcy9xWFplaTM2V3ZDWWY2UXc4U1I3Q3NmOUw4V0QzdkVD?=
 =?utf-8?B?bXFNYWJtaUhGbXRFbUJGUWk3UTMzOUhkbXlrUWl1QkQrUHdXYnlKeXlBZ0NP?=
 =?utf-8?B?eFAzNjJkMU16QzBoc1RZbWxYdG40Wm43TThuRmZaMnl2WlF5SnBFSFdoVi94?=
 =?utf-8?B?c3owR3V5OU5Qa2o0UEVHc3VUVjdRdTNhRjZQaCswQ1V2Ymh0WTdhT1kzME0r?=
 =?utf-8?B?ZGZ2am9BQ3dZYUtPVTNPNmE3M3lialdzQ1BtbmZHQUR0d1ZSUDVkaVB4Y0xn?=
 =?utf-8?B?M2JOVFk0N3BzbGZjamViQ1plRndkRHNxWWI4WkFucnJaNHpTWkxnOU5XcjVW?=
 =?utf-8?B?VldxaXc5T3dEZ1RqZlN4REZBT0RUTWt2VENzK0RFaHVJOWgvZzlRYXdIMXJH?=
 =?utf-8?B?bXo0REpOTDVMQmgwaG1vbTA4b0Z5MXdmOTRtWkk2Rk90Z1k4SEM3MU1qT0Rh?=
 =?utf-8?B?a0taRm5FdzAxWkxIanJnUGN5K2VCNUxVVnhwMlpSakFpcjNlMkZWY1RGTTdh?=
 =?utf-8?B?UGllSkZ6b0lMeC9FSGxlU05zQmRONHh6TFdrMnVScW1QbENialdlNEltNHFJ?=
 =?utf-8?B?UFdYb3g2Q2tLZFlSelFCU1JnVE42VTU2Z3d3SkFKQUF0d0cwbWdwZ1VZNnRo?=
 =?utf-8?B?aXZhSVlNd1AxcDVNalVxKzJjcFJXYTVlcG1uL3VBZHhDdy8vNTZWbVN5ODhF?=
 =?utf-8?B?SENERktJdEVmcFdNWGZ4MndRaWpMdVp6YXk4RHFyQ2FKWGhkeUFsY3FIYnNH?=
 =?utf-8?B?Qk9nUERGeXVRcno5b2ZmVEs4cWpiajFud21obk8ydEFWOFNuSDFlai9yTVpa?=
 =?utf-8?B?Z1czUDJyVWYwb3JMM1FLT2UxWEc3VE5ybWdENGMyS0txWXVYbTJick1xUTJ2?=
 =?utf-8?B?QlN5OUgvcXdaMVcwaEJITFZSR0ZiWWd0bWRDTGJ4NkRmVE9vYkRuSzhFWHpX?=
 =?utf-8?B?SitaSi90SEc1THlELzFpclVyRklGR2swYXlqdllraVdwYmU2MlE2US8yVkI5?=
 =?utf-8?B?QkNFRWFmZ2NBWW0xa1F0bkRQR05ya2VGSjhUK0JLVSs1SjhraXVqWGx5S3Ar?=
 =?utf-8?B?aFpKMEJ3THM2QjJVL21aMElDSEo5ODlyakk1VWhvZTFCRndRMDFyVnFwNXRV?=
 =?utf-8?B?NzI3dnZBVjBkWWRlNnZLUUJNWm5LeXhBNDZQaVJpYmFZQXZlZ3hNcCthUmpn?=
 =?utf-8?B?dXNhb1ZRUHhNdldGMFJYTVNDYjl5dE9HL1phZ1c0Mld6U3JFVmhtbU5zYTJj?=
 =?utf-8?B?WnVKQlVQUitoN1lZT2ZMU3JPVnJnOVNQbkpveXdTMFB2eCt5RFkvYTRLZ3FF?=
 =?utf-8?B?N3M3NG1jb2lFSXIvdXFQelNCR1Vycm1odFZYckJyNUlkY1RTSk5Kd2NweGRF?=
 =?utf-8?B?WTk1eHZ1MDRseFVGMnAwOFh3RTdBcDB0NE4zZHpuOWpLNjJiM3BrL1ZQVnN3?=
 =?utf-8?B?VFZGSk1NWDVHSFNWRkp4RkRYbkhjenZ0SERCUG9aV0s1K1JyT3pmQlVnTU5p?=
 =?utf-8?B?eSswdUNaNlZLeTg2b3RLVElOdUpnUi92eENHbTVOWkcyV09yR2hYSlQ1YXhR?=
 =?utf-8?B?c1cwMHNrZ3dRMVBzemZVRUh4c0d5bnhLd0dubVVCaGhRejVXZmFiVVZKREZr?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ef948e-6fd1-4581-9938-08dd9ed77f25
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 17:37:34.6761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9f8UG4y5Cd2Jz56Y/UJNgwn99aI2slMeOjH55BpVY2iCfkQuLEgXZQOgHLuyaE5Q/WDZRO5w7/rZUNd+IwAJ8YKXJdqINlWkgg96pmLyyXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6211
X-OriginatorOrg: intel.com

Hi Qinyun Tan,

Thank you very much. I have a few comments about the changelog that
I think will help explain the issue while aiming to have it follow the
"tip" rules documented in Documentation/process/maintainer-tip.rst. 

On 5/28/25 8:16 PM, Qinyun Tan wrote:
> In the resctrl subsystem's Sub-NUMA Cluster (SNC) mode, the rdt_mon_domain
> structure previously relies on the cacheinfo interface to store L3 cache

"previously relies" -> "relies"

> information (e.g., shared_cpu_map) for monitoring. However, this approach
> introduces risks when CPUs go offline:
> 
> The ci field in rdt_mon_domain is initialized using the first online CPU
> of a NUMA node. When this CPU goes offline, its shared_cpu_map is cleared
> to contain only the offline CPU itself. Subsequently, attempting to read
> counters via smp_call_on_cpu(offline_cpu) would fail, but returning zero
> values for "top-level events" without error indication.

Last sentence of above paragraph can be modified slightly to keep it in
imperative tone:
	Subsequently, attempting to read counters via smp_call_on_cpu(offline_cpu)
	fails (and error ignored), returning zero values for "top-level events"
	without any error indication.

> 
> To resolve these issues:

"To resolve these issues:" can be dropped. There is only one issue and the custom
is for the solution to follow the problem description.

> 
> 1. Replace direct cacheinfo references in struct rdt_mon_domain and struct
> rmid_read with the cacheinfo ID (a unique identifier for the L3 cache).
> 
> 2. The hdr.cpu_mask maintained by resctrl constitutes a subset of

"hdr.cpu_mask" -> "rdt_domain_hdr::cpu_mask"

I do not think "rdt_domain_hdr::cpu_mask" should be defined as a subset of
shared_cpu_map though ... especially since the problem description highlights how
shared_cpu_map can contain offline CPUs. How about:

"rdt_domain_hdr::cpu_mask contains the online CPUs associated with that
domain. When reading ..."

> shared_cpu_map. When reading top-level events, we dynamically select a CPU

drop "we" (no impersonating of code)

Considering the context it may help to be specific here:
"select a CPU" -> "select a (known to be online) CPU"

> from hdr.cpu_mask and utilize its corresponding shared_cpu_map for resctrl

"hdr.cpu_mask" -> "rdt_domain_hdr::cpu_mask"

> to determine valid CPUs for reading RMID counter via the MSR interface.

You can highlight the motivation for doing this. For example, "Considering
all CPUs associated with the L3 cache improves the chances of picking a
housekeeping CPU on which the counter reading work can be queued, avoiding an
unnecessary IPI."

Above is quite a mix of changes. Below aims to put it all together while also
adding more modifications as I am seeing the full picture. Please check for accuracy
and feel free to improve.

	In the resctrl subsystem's Sub-NUMA Cluster (SNC) mode, the rdt_mon_domain
	structure representing a NUMA node relies on the cacheinfo interface
	(rdt_mon_domain::ci) to store L3 cache information (e.g., shared_cpu_map)
	for monitoring. The L3 cache information of a SNC NUMA node determines
	which domains are summed for the "top level" L3-scoped events.

	rdt_mon_domain::ci is initialized using the first online CPU
	of a NUMA node. When this CPU goes offline, its shared_cpu_map is cleared
	to contain only the offline CPU itself.	Subsequently, attempting to read
	counters via smp_call_on_cpu(offline_cpu) fails (and error ignored),
	returning zero values for "top-level events" without any error indication.
 
	Replace the cacheinfo references in struct rdt_mon_domain and struct
	rmid_read with the cacheinfo ID (a unique identifier for the L3 cache).
	
	rdt_domain_hdr::cpu_mask contains the online CPUs associated with that
	domain. When reading "top-level events", select a CPU from
	rdt_domain_hdr::cpu_mask and utilize its L3 shared_cpu_map to determine
	valid CPUs for reading RMID counter via the MSR interface.
	Considering all CPUs associated with the L3 cache improves the chances
	of picking a housekeeping CPU on which the counter reading work can be
	queued, avoiding an unnecessary IPI.

> 
> Fixes: 328ea68874642 ("x86/resctrl: Prepare for new Sub-NUMA Cluster (SNC) monitor files")
> Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>
> ---

With changelog polished:
| Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette

