Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D5D21C16A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751008595; cv=fail; b=qUjKjFOr/cC6Qf9u5Il62LjXUe2P5M9QAGYqV5v9uxjpZtglbt9F1h1rlyziVcC/G+f8AJ2JliyMSyy+YUoFUu+dUAMHUqGPmx2E4PCHpJVggTcS5KY1LM8N7AMOoW/IQxoyhlssu4ZHl4twRWo2mgiso5v79ICsYljjLAyxh/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751008595; c=relaxed/simple;
	bh=0jzD8PlM3uI9XBiil1EQmEVamREVEx9K+Qcs78GKw1U=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eAO2TY/CQgam4/O8u8YY+iQTAoxySw5jY8HY4IJgfGimC3LxB9ytfp+MA8+O/hs/KuigN0QQbT0UB7ej8+wZjX6LZhV7jBTh70PedmNgtfIRFybAYjvFbbIxUtVhWy9wZjupUX+pizspSgHDk8qW4KPhmsTT0r7ZC/y3ODL4SgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdPx0kpu; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdPx0kpu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751008593; x=1782544593;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0jzD8PlM3uI9XBiil1EQmEVamREVEx9K+Qcs78GKw1U=;
  b=fdPx0kputK8hzWRImJ0/vWOrf+tbZpbXDlmkNyqCxkYS4qdG6g6J88kG
   3bfCNOxPFPKi3oqcOQf0/Pl5Us2SzT0dvUxbkr6jEz/vqRKPPVdT4rKPO
   5JkmL/r7v19jqJBZ/4ZMZfSXFIwQPH0A7av5/U6wPUz95D1wkq4TONDIi
   kJyzFO1vTV3Kip0ErL3gC29sk2oeAANGUQinWaNAhP+Yyb9B+ssDqtRVB
   2h+Vd+k7q+up7CXPU5xMMUI2V+uTKfqOqWuiNiCYVT4uiowvlm29EeD1b
   Od1fEpTajfPETYqxas2ZUx0OzdD7ShQHMfmwsXTXUR28Colxga+jZfFnN
   g==;
X-CSE-ConnectionGUID: /kb5jFehRqimHWGBMJwPdw==
X-CSE-MsgGUID: qdYJB0LaSKuuWXn9zbIBqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53189393"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="53189393"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 00:16:32 -0700
X-CSE-ConnectionGUID: YnPHUOBFTLKtfGCKh7qCdg==
X-CSE-MsgGUID: c71sIkN+RvyylGGdhoUupA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="176412664"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 00:16:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 00:16:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 00:16:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.48)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 00:16:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BikoswGLmLPz26HAPgEDMtp2Iy0g7mhNdsrCdr3yOiYWKZ7ZYAqyvwzrGvaxgfxzbz1bT0ZPIxz4UYEpGIx8DETm5dLbjaR+OIfFX+UTTmcFCB7qxf7pHM2QXdA6HksQnOVobmCMWZOUsgVMdLgLe3zdMYTroloZt/awnuKDFK7chkk+TR9xlIvxn8qAuIF2A2hmvwBS4YIU1OQ494c/rpEABEq8Gphf9DQH7P9z62ixavJ5z6A3Ky5W0Iv58BBZHPksGh0qTiykY7sb7BS9QWEJ18zfCql6cahrXXySeAuUR0uUd+UXKOhF2Ffj/mliZuRtYQqvQ8tENor71jch9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRPByWe22AQNMumiEqg+G1gc2kTT+ZR+KEHWAgs5A4Q=;
 b=b8bJu0US9w584PspqMNipjWyiVI9LaR48F0ZPo8uV2dFUlGUxP1tnZIUe1Oo5ey7/honRzXqqoV80S50KDv7pjzlIH35+iHaF/46irQYCRHGsSiux07n2YjnZWYkuk8iDCINrjjlVcxw2k+yB7fs9oE34y5XilyVP2SAlQaxc0uBETjW0LlLqSo+BGD+A1Bxk5httcxnWtsABzQhElasl2kuUXgXgAzz8oSDOILwiH9cmQzREZY7bi2Lt/A/K2nQjBhWedIsZ4yQCvziNDDFq4HK8zwGNpV4jTgrUpldFG8nbV2E3TdnjP7Vb42aCxVpy9WmOleql1RAbgmGhu5PYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 DS0PR11MB7531.namprd11.prod.outlook.com (2603:10b6:8:14a::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.29; Fri, 27 Jun 2025 07:16:14 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%6]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 07:16:14 +0000
Message-ID: <31bd3395-cfe3-4af5-bc1c-fa8d26629b93@intel.com>
Date: Fri, 27 Jun 2025 15:16:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Kernel panic in __migrate_swap_task() on 6.16-rc2 (NULL
 pointer dereference)
To: Jirka Hladky <jhladky@redhat.com>, Abhigyan ghosh
	<zscript.team.zs@gmail.com>
CC: <linux-kernel@vger.kernel.org>, Chen Yu <yu.chen.surf@foxmail.com>
References: <CAE4VaGBLJxpd=NeRJXpSCuw=REhC5LWJpC29kDy-Zh2ZDyzQZA@mail.gmail.com>
 <07D9F8BC-47A7-4E87-8655-C978C056E308@gmail.com>
 <CAE4VaGBQnMp953tsv13s=CiaaiW+EZNuvh6dCuRA7MWbyU_Hsw@mail.gmail.com>
 <CAE4VaGAak=U-oLwXvPZsiNRnRvNL_ROKL8AJCSkCm+zPOjf2qQ@mail.gmail.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <CAE4VaGAak=U-oLwXvPZsiNRnRvNL_ROKL8AJCSkCm+zPOjf2qQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0158.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::14) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|DS0PR11MB7531:EE_
X-MS-Office365-Filtering-Correlation-Id: e6403fca-f4d3-4cf7-980e-08ddb54a803a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eE10SFFzM2ZZTmVWYTdrazVhUzk3eE1ab0wrYjlkUXJ3OTg2VFhLeEJuSngv?=
 =?utf-8?B?bHllbWtNdVJva2MyOGZNSGdMdm9IYVdqcUhRZjhXOS9lSFB4TlBXVUc0VGEr?=
 =?utf-8?B?ZmFDR2h3YUNVT0J4ZE16a1ZreW5YU1pYS2ltcTVZbnY3RVlJZ0ltL3VWa2d1?=
 =?utf-8?B?ZnJPcVJLV3NicWZvdE5uTHQvZlhJaXBaVlFkM1haT0toUThYTThtU1BrV1lK?=
 =?utf-8?B?SW1mY0pWZjk2VmRpOGxGM1dPRHR2ZzJqUUZBZmdWZGJMZVlEWHJwd3JxZk05?=
 =?utf-8?B?ZjRRYkY1SDJGRndFN3FOeEpoZ2F4RWM3bW5vVDd3Mi9ZRjJkYm5tU2FBOW1I?=
 =?utf-8?B?QmhOalZOK20rekFScTQweElURlJYblpQWC9MMTUvL0g1akE2RWpBaGJYbGZs?=
 =?utf-8?B?ckJUNHg2dC9Gc0gwK0VjZUwwc050aFlVeWhGekE2WjRDRzBxYWhwQ1QvaHhl?=
 =?utf-8?B?U01maEE1Y1VnMnkwRDNuMG1uczA3NTNmOWZZYWZrU1JUYmFhbnJ4YVl2eWpI?=
 =?utf-8?B?ck84RGZlci9pZG94eDFwcWJTRlYwTTN4ME9CdWpkbnZEQ0lOUm9PM3g3bHdO?=
 =?utf-8?B?dGI5bGZwTDdub0V2RjI3MmgvSklkRittYmtvT09nZUEyQ2NHd1lrSkttNTlW?=
 =?utf-8?B?SE9Ja2s2Y2Z1VjNPQVpRWkFnZWtGcVhpN1dXQW1KK1A1K284UGpOaEVGS3Rs?=
 =?utf-8?B?YThoR3dLL1FydTZYTzVBbERYSU1mMVR3ZXd1UkdDN2tjV2UrdkY2UkNrckpX?=
 =?utf-8?B?eFE4RTNkRXpxcWVsRnRQQzdOTExlNnJnMTZ5QXkxT0RTZnRQNG5rSFFPbHpz?=
 =?utf-8?B?OVo5bmR1Ym1oTFR4WU5RTEE3MUp6Y2tjaEhJYUV5aXN5VEFRSHZTaXJjT3V2?=
 =?utf-8?B?QWpHL3dUMVdEa0RRUy9CTVhuWEdybG02RUJmSVNOS3lVMzJZb0tHd0ZTZDlX?=
 =?utf-8?B?QWEyQkJKc0tDMmdWMVlrVUpVMHE1dWxzV3pobENQaUg2bHVXK0hPNkVvYnQ0?=
 =?utf-8?B?RWdpWkxlR1cwK0xaRERXdUhDeExtaGowelBkaXI5L0lMTlVhM1pRVWROYTBo?=
 =?utf-8?B?TEcxcnh5dlNiZzFiMTNMclVpTXBMYjZRVytNVkxPMk42bjgwbUlObU90dUt2?=
 =?utf-8?B?ZUpURTZJajlZeWxnV0lkUk9DOElvZGNzWXdMVkk2Vm1EYnVFOEVpdldKM05t?=
 =?utf-8?B?RnA4clYvcXlSblR5VjMwd3lVWjBRNFV2V0lXUjNlVFRjWEU1SnBlWlVWMzY4?=
 =?utf-8?B?czFHVFBUQUVRNUVuNnhGOUhiZ2ZJL3E3emtEcHAzdkNvVEpIUzVLeGc0MVRJ?=
 =?utf-8?B?R3E3S3N0YW9jdE9WM1E4N3RJQ3ppejllU2FCZWplUlJoV3lBZ2U5ajI4NVhE?=
 =?utf-8?B?VW1lUFg1WGZWbTZrQUFWSUZLT3lLWXBSclF6ck1uT3ErUEpDSnVSTE9PM2Y1?=
 =?utf-8?B?amVpRzNETUljenBPZlFUQ3JhVmR4eG5aY0RSejdSclpvOGI1ZTlYYXBpQWRG?=
 =?utf-8?B?NndEU3JNQVpUOUJtcXJDSGdrTDhFVHVLOU54VFZVTmloT3dvcDBCMGNKWUJt?=
 =?utf-8?B?SWJ2djh4MHBwU2ZiS0J5T01TanRQejJaMEtiS3c0TXgrejJzUU5tNnFMczl5?=
 =?utf-8?B?aHFDSXljemhSVXJsb09DL0pHa2pKQzNHRWxFNDRzNStSa3VEUkFBZUxiaitu?=
 =?utf-8?B?aTV5Q0Z3YzBrTDBETTVPRDJraFpjWlFocmppM3JCNmtTdjQ2R24yREloL1d3?=
 =?utf-8?B?WCtpWUc0SXh1YmlYU29TbzBLWGNBS2pVRHNPdmtSM2Qvam1XME1kd0pZWHFm?=
 =?utf-8?Q?j2zmCC9m8sihzA+R6ViUkgx+q0GaQKZHMm0AA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTFmVmltdGlUc0pQeDA1TXZ6T3pEUjdFT0MwNEFsd05Pbzl2TVY3RENRVjQ4?=
 =?utf-8?B?RWVOUk03YlhWVFZLTmFxcDFCbUhjdzNsU0FiQTQreUR0OWgzeExmTGNFUmRO?=
 =?utf-8?B?TFdxUHhidlN3dTNwRGlNZFhRTFlMeThuRVRUM1FqdUswdmVHWWx5T0RwbTM3?=
 =?utf-8?B?RzdJRnNCUGZCUXpqRVlNSWVPWkNYSDU3MG9PKytvR2NLRGF1Y1doamJKQzF3?=
 =?utf-8?B?RzhGK04xNE1YUmpxVlErcjJXMHI5TjhJT1ZKZWxOazVFRnc1OHNEUE8vUmtq?=
 =?utf-8?B?VDhTN1VzeURpNXRIMVdxS0pPdm0rLy9ySnd4VVpBL2ljK3d1aS9DU3V2ZytJ?=
 =?utf-8?B?M0R4ZERRdS9kR3Zha3RMKzlSMHNtTS9JSnc0ZmJRbzRBWXdzUVhocENsNUJ5?=
 =?utf-8?B?eEt4VkF6aTBodUpOUzRjYnVpcmVkTWdldlF1aVhWcjJ2aWtYeTBBSkxTZDFt?=
 =?utf-8?B?RXU1TFdCamJMSGMzL09hT3UwZmlvK3pKREluSDVWSEhxS2Z5OENWZkhOMUov?=
 =?utf-8?B?Z2NoZ3R5ZG9zQ1VBS09TdUFxTzhUdzA1N1owWU80OHozaDlJdVBnc3padkxV?=
 =?utf-8?B?bXJmakNPVWRTc2hDSFdoUFM3aFJMSEdsaEZHTEEySjhvV1lQUjFzeTRTbnBC?=
 =?utf-8?B?ajZSZHluNnM5UzZqWTRDUWErYkFJMEs4OGw4cVpkbDRQY2MyTGdnV2JqeG5Y?=
 =?utf-8?B?cktVUENjWUs5ejI4K25TcFpQTXVhY28zWWE3U2N1elF0T1lveFljcTY4NGhv?=
 =?utf-8?B?bWhDWVpCcHFOWVFaYlBwK2Y3SWlyNjBmR2hzSkpqSUtLUkJMVTV4ZDJPUVdT?=
 =?utf-8?B?N1BpQTkzWXpiS1pFZkVEMG9HVFliTjNOL3diNDl3WFJPVVFUakxPbHp6R250?=
 =?utf-8?B?Nks4VWtsQnUyM3FsNE8zMmN3eTNIRWM4YTBqRjZ2YnppbnY1U0dCRGVVNUw3?=
 =?utf-8?B?QmpRZTdQR1QyaVJ1TEV3MC9LSHRwazJkNGpCTFZTQnllWjc2Wng4WWpiZTRy?=
 =?utf-8?B?Yk1ITjh0cTVPL1JNR0ZkQU5MNnNGa3Vna0VYRU5vemhHYWtwWDk2MHMvbzlv?=
 =?utf-8?B?cXdnaVhhcU92M0tqZmxaWXROS0J3TkowelhsR1cxV3VBTWtpRXZDWmZteVFz?=
 =?utf-8?B?cFRPTUZnZ2JWZUNiTVp0cWhmSHZRbStjamxhR280RGxWSFZUaGFmbzR4UWta?=
 =?utf-8?B?b3VyYi93K3JXN3lkVGJNd1FIN0wzNm4zV2FMbmp5Q0Z1M1lpSkttRzRSRWxJ?=
 =?utf-8?B?Q3FDbW5KZlZ2K2doYXpXcHFPZWhlamsxN3ZDT2NieVJMMDJHU3lhcGVFbktN?=
 =?utf-8?B?N0NmSVpqMGZzOWtsei9DYkcrUEszck5KTzBmQ0lYQlhXSWE4MExpZGpFdGxR?=
 =?utf-8?B?NHdNVDFybTR1YUxMREYzN2FLbitRZy95WjBLOHFtTGFHdHFpRDBJVmRKTnpQ?=
 =?utf-8?B?RXFKODkreUlhTXFtV010QTRXNWlxcnVwaW1TdWNCVmVkbDdQTE0zb0dTVEtQ?=
 =?utf-8?B?SmdhODRvcjNsZk9OTmJKcnBId3NzZzNUUnhFTXR2ZEFjSTY4U1hPVW14dXZ6?=
 =?utf-8?B?Nk5zVmtnc09SMmhkYnRNYkp4L3VLbVUyYnNiY3d0eklFZUNwQ0VnSTJwSmZJ?=
 =?utf-8?B?ZWFOZWpTd0MrWjMxOVkyU1BoSDNFRFpmOUU4cmpBWG9GNTJFRHRRNTFjWWlm?=
 =?utf-8?B?Y3RmU1JVaGpONm14SUw4T2JqLzgyK0lnc1RTTm1vbmZybHFHb09hZkxCcEFu?=
 =?utf-8?B?YjRDNlZoSVE3MkdVUHNOZU9GTkE2UldwS3ZyNEtrUmRYbGRmRkxodStwc1B5?=
 =?utf-8?B?U1lyVkdhWkd5SUd4ZE9aaEZ0eU5uMzh4emJuVG9zSzlQUkt4ZFVwR0pwT3Ez?=
 =?utf-8?B?S1ZiaTMyNlJTVnlTYi9HUUNveGpReUVlcFl6TlZCRTNnQkJFZmIzRHp0UElS?=
 =?utf-8?B?dmkvSmNDSHA3MFlBbHlnMy9GdVYwV1g3Z2lER1UzdjB6a0Fsa1QxaFVXVk9u?=
 =?utf-8?B?WkphUHkyaDhkMkczSjFMbWFjaEZNK3g0a1B4YTdiYUlLVU1SRHdibkRSVk5E?=
 =?utf-8?B?UzZzTjhBcTdad1kzMXNmeE0vcTE4OXdnR0V2NmlaWFVQK01YRmQxaGtPOEU2?=
 =?utf-8?Q?N217WCcwe1uLTahlzCaTqE9K8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6403fca-f4d3-4cf7-980e-08ddb54a803a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 07:16:14.3666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BKObD2fkX2qqz+j+GXdTBueyTEQlRN7fHdbcICJn/KmTyzZhbVC9vNj0V2RL8Gb5Hc9BVA4/qlbGSh3w8rLeqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7531
X-OriginatorOrg: intel.com

Hi Jirka,

On 6/27/2025 5:46 AM, Jirka Hladky wrote:
> Hi Chen and all,
> 
> we have now verified that the following commit causes a kernel panic
> discussed in this thread:
> 
> ad6b26b6a0a79 sched/numa: add statistics of numa balance task
> 
> Reverting this commit fixes the issue.
> 
> I'm happy to help debug this further or test a proposed fix.
> 

Thanks very much for your report, it seems that there is a
race condition that when the swap task candidate was chosen,
but its mm_struct get released due to task exit, then later
when doing the task swaping, the p->mm is NULL which caused
the problem:

CPU0                                   CPU1
:
...
task_numa_migrate
   task_numa_find_cpu
    task_numa_compare
      # a normal task p is chosen
      env->best_task = p

                                        # p exit:
                                        exit_signals(p);
                                           p->flags |= PF_EXITING
                                        exit_mm
                                           p->mm = NULL;

    migrate_swap_stop
      __migrate_swap_task((arg->src_task, arg->dst_cpu)
       count_memcg_event_mm(p->mm, NUMA_TASK_SWAP)# p->mm is NULL

Could you please help check if the following debug patch works,
and if there is no issue found after you ran several tests,
could you please provide the
/sys/kernel/debug/tracing/trace

BTW, is it possible to share your test script for stress-ng,
stream? It looks like the stress-ng's fork test case would
trigger this issue easier in theory.

thanks,
Chenyu


> Thank you!
> Jirka
> 
> On Wed, Jun 18, 2025 at 1:34 PM Jirka Hladky <jhladky@redhat.com> wrote:
>>
>> Hi Abhigyan,
>>
>> The testing is done on bare metal. The kernel panics occur after
>> several hours of benchmarking.
>>
>> Out of 20 servers, the problem has occurred on 6 of them:
>> intel-sapphire-rapids-gold-6448y-2s
>> intel-emerald-rapids-platinum-8558-2s
>> amd-epyc5-turin-9655p-1s
>> amd-epyc4-zen4c-bergamo-9754-1s
>> amd-epyc3-milan-7713-2s
>> intel-skylake-2s
>>
>> The number in the name is the CPU model. 1s: single socket, 2s: dual socket.
>>
>> We were not able to find a clear pattern. It appears to be a race
>> condition of some kind.
>>
>> We run various performance benchmarks, including Linpack, Stream, NAS
>> (https://www.nas.nasa.gov/software/npb.html), and Stress-ng. Testing
>> is conducted with various thread counts and settings. All benchmarks
>> together are running ~24 hours. One benchmark takes ~4 hours. Please
>> also note that we repeat the benchmarks to collect performance
>> statistics. In many cases, kernel panic has occurred when the
>> benchmark was repeated.
>>
>> Crash occurred while running these tests:
>> Stress_ng: Starting test 'fork' (#29 out of 41), number of threads 32,
>> iteration 1 out of 5
>> SPECjbb2005: Starting DEFAULT run with 4 SPECJBB2005 instances, each
>> with 24 warehouses, iteration 2 out of 3
>> Stress_ng: test 'sem' (#30 out of 41), number of threads 24, iteration
>> 2 out of 5
>> Stress_ng: test 'sem' (#30 out of 41), number of threads 64, iteration
>> 4 out of 5
>> SPECjbb2005: SINGLE run with 1 SPECJBB2005 instances, each with 128
>> warehouses, iteration 2 out of 3
>> Linpack: Benchmark-utils/linpackd, iteration 3, testType affinityRun,
>> number of threads 128
>> NAS: NPB_sources/bin/is.D.x
>>
>> There is no clear benchmark triggering the kernel panic. Looping
>> Stress_ng's sem test looks, however, like it's worth trying.
>>
>> I hope this helps. Please let me know if there's anything I can help
>> with to pinpoint the problem.
>>
>> Thanks
>> Jirka
>>
>>
>> On Wed, Jun 18, 2025 at 7:19 AM Abhigyan ghosh
>> <zscript.team.zs@gmail.com> wrote:
>>>
>>> Hi Jirka,
>>>
>>> Thanks for the detailed report.
>>>
>>> I'm curious about the specific setup in which this panic was triggered. Could you share more about the exact configuration or parameters you used for running `stress-ng` or Linpack? For instance:
>>>
>>> - How many threads/cores were used?
>>> - Was it running inside a VM, container, or bare-metal?
>>> - Was this under any thermal throttling or power-saving mode?
>>>
>>> I'd like to try reproducing it locally to study the failure further.
>>>
>>> Best regards,
>>> Abhigyan Ghosh
>>>
>>> On 18 June 2025 1:35:30 am IST, Jirka Hladky <jhladky@redhat.com> wrote:
>>>> Hi all,
>>>>
>>>> I’ve encountered a reproducible kernel panic on 6.16-rc1 and 6.16-rc2
>>>> involving a NULL pointer dereference in `__migrate_swap_task()` during
>>>> CPU migration. This occurred on various AMD and Intel systems while
>>>> running a CPU-intensive workload (Linpack, Stress_ng - it's not
>>>> specific to a benchmark).
>>>>
>>>> Full trace below:
>>>> ---
>>>> BUG: kernel NULL pointer dereference, address: 00000000000004c8
>>>> #PF: supervisor read access in kernel mode
>>>> #PF: error_code(0x0000) - not-present page
>>>> PGD 4078b99067 P4D 4078b99067 PUD 0
>>>> Oops: Oops: 0000 [#1] SMP NOPTI
>>>> CPU: 74 UID: 0 PID: 466 Comm: migration/74 Kdump: loaded Not tainted
>>>> 6.16.0-0.rc2.24.eln149.x86_64 #1 PREEMPT(lazy)
>>>> Hardware name: GIGABYTE R182-Z91-00/MZ92-FS0-00, BIOS M07 09/03/2021
>>>> Stopper: multi_cpu_stop+0x0/0x130 <- migrate_swap+0xa7/0x120
>>>> RIP: 0010:__migrate_swap_task+0x2f/0x170
>>>> Code: 41 55 4c 63 ee 41 54 55 53 48 89 fb 48 83 87 a0 04 00 00 01 65
>>>> 48 ff 05 e7 14 dd 02 48 8b af 50 0a 00 00 66 90 e8 61 93 07 00 <48> 8b
>>>> bd c8 04 00 00 e8 85 11 35 00 48 85 c0 74 12 ba 01 00 00 00
>>>> RSP: 0018:ffffce79cd90bdd0 EFLAGS: 00010002
>>>> RAX: 0000000000000001 RBX: ffff8e9c7290d1c0 RCX: 0000000000000000
>>>> RDX: ffff8e9c71e83680 RSI: 000000000000001b RDI: ffff8e9c7290d1c0
>>>> RBP: 0000000000000000 R08: 00056e36392913e7 R09: 00000000002ab980
>>>> R10: ffff8eac2fcb13c0 R11: ffff8e9c77997410 R12: ffff8e7c2fcf12c0
>>>> R13: 000000000000001b R14: ffff8eac71eda944 R15: ffff8eac71eda944
>>>> FS:  0000000000000000(0000) GS:ffff8eac9db4a000(0000) knlGS:0000000000000000
>>>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>> CR2: 00000000000004c8 CR3: 0000003072388003 CR4: 0000000000f70ef0
>>>> PKRU: 55555554
>>>> Call Trace:
>>>> <TASK>
>>>> migrate_swap_stop+0xe8/0x190
>>>> multi_cpu_stop+0xf3/0x130
>>>> ? __pfx_multi_cpu_stop+0x10/0x10
>>>> cpu_stopper_thread+0x97/0x140
>>>> ? __pfx_smpboot_thread_fn+0x10/0x10
>>>> smpboot_thread_fn+0xf3/0x220
>>>> kthread+0xfc/0x240
>>>> ? __pfx_kthread+0x10/0x10
>>>> ? __pfx_kthread+0x10/0x10
>>>> ret_from_fork+0xf0/0x110
>>>> ? __pfx_kthread+0x10/0x10
>>>> ret_from_fork_asm+0x1a/0x30
>>>> </TASK>
>>>> ---
>>>>
>>>> **Kernel Version:**
>>>> 6.16.0-0.rc2.24.eln149.x86_64 (Fedora rawhide)
>>>> https://koji.fedoraproject.org/koji/buildinfo?buildID=2732950
>>>>
>>>> **Reproducibility:**
>>>> Happened multiple times during routine CPU-intensive operations. It
>>>> happens with various benchmarks (Stress_ng, Linpack) after several
>>>> hours of performance testing. `migration/*` kernel threads hit a NULL
>>>> dereference in `__migrate_swap_task`.
>>>>
>>>> **System Info:**
>>>> - Platform: GIGABYTE R182-Z91-00 (dual socket EPYC)
>>>> - BIOS: M07 09/03/2021
>>>> - Config: Based on Fedora’s debug kernel (`PREEMPT(lazy)`)
>>>>
>>>> **Crash Cause (tentative):**
>>>> NULL dereference at offset `0x4c8` from a task struct pointer in
>>>> `__migrate_swap_task`. Possibly an uninitialized or freed
>>>> `task_struct` field.
>>>>
>>>> Please let me know if you’d like me to test a patch or if you need
>>>> more details.
>>>>
>>>> Thanks,
>>>> Jirka
>>>>
>>>>
>>>
>>> aghosh
>>>
>>
>>
>> --
>> -Jirka
> 
> 
> 
