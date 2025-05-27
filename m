Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B478F58
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379356; cv=fail; b=pfSE5QlZlGPpTFAwA1I996Ia8+mu3epGXcNMFaRDeMhJw4CTg31LJ/TT21oE2fK/nF8Js9sYeOgqM9FGKzQskM6lCPXXh2Y+NZnFKEOXIs4lg+qFvD7Y37WpNhAIpEIXIdPFG7waF+k4Iuc4RkluEe/MVEdiej00aQpEgR5C0vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379356; c=relaxed/simple;
	bh=xWxW6Cwsvay8XS09dlMAMXf280Twpynanr4mw0eX8qI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Hv5srFGRdFUUcxnDC8XjSVlCpSQ+c5CwPev2bhgEY/90S4yS093x2mkLtWtvE3kziDnOmStIW6LWer5MInbcRtBcG5trbpv3SzYy/8Hph0GnUUBYlOHgA4pnUBDXhj1bXRfYCzGyj2qz6tZ0GTq//ikoMevgQj+HSCh+xC3t5PY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BVbxFIVb; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVbxFIVb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748379354; x=1779915354;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=xWxW6Cwsvay8XS09dlMAMXf280Twpynanr4mw0eX8qI=;
  b=BVbxFIVbdSnEfYcyXEaOrOBg+PfP7X6VSAZR9zm8Lqs1KFT+XTTcZQh+
   HNuRB2RuJbWthSLothAY2v6yvU+Gken1mGfa/38UgnUA3h53q2r1HgKFi
   aWraOV9Yd46XaeP2L8sk/wgi1zLTaQBqAmO2NsNPlfBgQr7mL2jzz9HuG
   sCY5O0Na73XFflGqdVHpPmRJdVps4Oy2YUXQUYtbq0lvRrHNa6i71lF2O
   vHNJfOML3qf6fCSxASkiv/2ejQqFVnLksBD/bmaUEK3j+WVj4T+DSu/NZ
   cTU6KeaaFZkoCtO20kMwTjP4YlHbnizvwiHINpvQqeXFVcdWbQuqnup/2
   Q==;
X-CSE-ConnectionGUID: u6tSibFaSqWs0giP2OeNyQ==
X-CSE-MsgGUID: rIDlj5gASH+pqZDvffjcig==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49501857"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="49501857"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 13:55:53 -0700
X-CSE-ConnectionGUID: ATNrnda2Q1qEWi8YEyM8fw==
X-CSE-MsgGUID: UCUZSe2ISsSxhEtVpUjd2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="146851610"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 13:55:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 13:55:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 13:55:53 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.85)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 13:55:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VNQnU5n/VXSydYugxla0K3LVKiR4YBsFKOEOmCXNQFZuejXWcX4OPL9q0fsutwcXCrQu+RkbDCsEhpwhY2/qgymHndiNdEuMMqitz//Jjq3WhRsJBuNZYK/BkTwYfAgcQd+nl6utfpw8/JUjRUY+1wyModJ6Tiptqy8flm7SpfP+z8skQtUiZY9S5O45nl76gvj++Tm1FCmSLHq8xPMIufSKr7JJUuxE0bLJwA/i075R/9032kUBVMFFZ66Eq5RkTcjsHMSrw16ztrMiXBPpCIhoSt8m0lu+Nx+xf3VPpzIMIMHZBBclBWOJfMMFtkIc4VscWV8Yenabzx6fvT0GKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhyqRwkwg27tbyCZXpZEXUoEnQqcy0IPuuLLwfhwJCw=;
 b=lFYCvIPu8EECymIQ03qJYZcK+yzx0IjJdblOXyGvVTUpgNccHlUEeHUFba0D0GovhFHODgAzfkuSJJsuYAY/AsuFDefIkl8WchbYghwgqkdhkdu6nI61ZmCXcGgzUuYZKqmlaWBLmMSiJVKFG3ewmGqFRJifHbmJt2KpII0riHqwppeFsGSRuPZLw+u4wsdVZ9dmMn0rmIaUBYfYltis2BMYUEyL2RrGdcjvXEoiPPKFhbucmJYMvL/RFU848QMkkMTJBuAUzIApL/diDlhK++TvJwbPZBUtGoOcY6Et4QlYAGfZtgmyC7zPb166uwaD5lywkTjkcpDDdmnZCW0SdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5171.namprd11.prod.outlook.com (2603:10b6:303:94::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Tue, 27 May
 2025 20:55:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 20:55:50 +0000
Date: Tue, 27 May 2025 15:55:46 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
CC: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Arnd Bergmann <arnd@arndb.de>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthew Brost
	<matthew.brost@intel.com>, Himal Prasad Ghimiray
	<himal.prasad.ghimiray@intel.com>, Imre Deak <imre.deak@intel.com>, Ilpo
 =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, "Michael J. Ruhl"
	<michael.j.ruhl@intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency
Message-ID: <j7yodlrk7wh3ylvb2z622ndlzm4guhahmakdb6l5d6qtv5sabo@w4bfiehtmaab>
References: <20250523121106.2231003-1-arnd@kernel.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250523121106.2231003-1-arnd@kernel.org>
X-ClientProxiedBy: SJ0PR05CA0101.namprd05.prod.outlook.com
 (2603:10b6:a03:334::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5171:EE_
X-MS-Office365-Filtering-Correlation-Id: b700dc89-c510-45c2-31fc-08dd9d60dc88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7F8bGHdH1kPrJnUjuYpccYXx81Hb6VPmXIlXLoLbvotMpEUg3NfOXdnJ7eEz?=
 =?us-ascii?Q?2BSD3A/gz8isBhgWLEDb7ldV6N/3tzQRdzFVyRYdc943scZwwbr1njWXO7aO?=
 =?us-ascii?Q?coB+3xDXQyMTB1gtNqi5BgiOx152Q3NcvUkppYxpWfVTMUMPBVN7VxVuK0kR?=
 =?us-ascii?Q?hpZjDrKfRcw+8SGY7XbKcc+TGTaAaEhpu4UjgVPKG6V12sl2aDMKm1bpKdU1?=
 =?us-ascii?Q?aZeN1c+ccK++oga+zEP34IDS3tLLPUP93Xh5PfhLnErtWDYT5socgZxkiRdV?=
 =?us-ascii?Q?1fZ37esJoFvSrCOC9wJ5T9zI8q4FFbcpModDpMUe79ghnhji/COxLLrpN1zv?=
 =?us-ascii?Q?sBL46IBK04y+MupCYTbz2CJrmhYbZ6ssHcSiw5tnzEBp8uHTRvdOWugXpwj6?=
 =?us-ascii?Q?VaqeiXFM1GG/AGigpfsUktVU5S/wdaQjHlHZOAC4sNQn5QJtIaaPLiykx9WH?=
 =?us-ascii?Q?xOxsqCuHJkNQqi8EkjCLHjp4Nd/28WRrFaMhabvFhKUjozIieZRTbqwMItdO?=
 =?us-ascii?Q?Vl0+he7XCiSI/RTamNMud0A4AJooIJ/PBnj9Q/D+NAghrCxKrmGQ65DHGMEd?=
 =?us-ascii?Q?PPASpxn9pKyCBaFfThSvz01GD+GwinD2pHjqk1FVE9hm36LtQbSGwshxHmzT?=
 =?us-ascii?Q?IMRP++2iLj+NzhWJU50PYNFFwdsaLEoBGSIE6nBIpQXcM/c2mBJ9HXJ61L8q?=
 =?us-ascii?Q?cfpUHpqEv21RDgs4CjP1GmxwQQJRg2CfCaqwILEQI5RJ1zQiOUTq6K9V3xqt?=
 =?us-ascii?Q?be6NLqaw8kLNUogsOJHESBKcPH4iFHTsKVYLq340UP/8DDZ7ugRuqJO0ida4?=
 =?us-ascii?Q?W2jU0RYRK04YtXEcoXAWX2hqdNaaVs/AwPZXuXkOVh5sO06uEQ7SR75twC8Y?=
 =?us-ascii?Q?VfTxfg1tdUVwrTK+8qLzSqWX+NqG6UBKoXN4apxyxKjLAOHnuw4MFLAB+3+9?=
 =?us-ascii?Q?kW62U/irKxIVGVgHC7GBAeNMVbl0imCZQk1TV1eQYk2q4NZJIraAWP9UYJiW?=
 =?us-ascii?Q?UmNbvzANgJiIx+hP5ppGIsb5OSRbDVxiLzxPS1M02ENlE1JLar47YkyPdBHn?=
 =?us-ascii?Q?pCtJVKwy63I8dBE+7XJ52KZH7z5co6bB787WbXjdD6ygJNFyd/Y8mgFhUAP/?=
 =?us-ascii?Q?EwDZC4THt2j7TpGMUi8gPTJ4dtwx+Qy17yEIZSObtI4xxR+fu87X5pt7izDz?=
 =?us-ascii?Q?NvyDRnZMT2Cdt6ydr+wUzWPUfiuXmb6IOdDVTgbBLaks+tNqzLHDf34/K7Ou?=
 =?us-ascii?Q?9YZVS2HCZ4txIphgkiKXuwOHu+5QA0o4OUxYpa8RYkmniNXOwYeCmNU5UmR/?=
 =?us-ascii?Q?9SpIah/ttlSADChjpiOwHrMYwexk4tdAvhjFE+KoITLAJG1RcxRik1qlm09x?=
 =?us-ascii?Q?SohBjusrRqV6abFJnfkPwSlD1DbEF+KA4vHH0EV0miIT0t3o0A6OOnp0cGh+?=
 =?us-ascii?Q?rtKLi1yHW/Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bwQQd5I9zBJfjjien94Wy2EhulHzR0YwuidqoG2QCCGSDoeqBhAA8kN/8GSQ?=
 =?us-ascii?Q?k4KgwnTm3WusMHOaKWi/sS54YGYShxTOsoCBOxwCOe64vNET7S726oPXXkUa?=
 =?us-ascii?Q?hskYscMRReFgJZVKolDg0bMnsopURT3q/q0NrEVf2AJBTE/zK7fA0O5y9gHU?=
 =?us-ascii?Q?5SZNB+PAzG1j+gX3gh+vOBYg6jY4a/EGnUjnlF6OarunubRJb6M88oMve4xq?=
 =?us-ascii?Q?TmOp3S0zUy4P5AdR5+hW/gprBhKxVZv1/8Qi1zTyNU4q/llJM7YArVbkz9S8?=
 =?us-ascii?Q?M6lN46P7fSxJEk7RT+Dt1QzeNkMFupSJqH0LmQHe5QCyDN902cYtP9d9EwJT?=
 =?us-ascii?Q?EGY7Bn2Y0xojgOX5hxyymy6pT5OSHYMN5kvefTWOn0C4R0SJ+UBmnX+q6Tu7?=
 =?us-ascii?Q?wls64+f5TiN8b3y3NOnodzQzR/hXdXKd9D3v31PhejeUkOZL67nL0lAZYuF5?=
 =?us-ascii?Q?SH9bZfMF94eHY6Q5oaj1REZa3P4dAfFBDDwt8plFyZUkTQkIZQMrliS6UL2E?=
 =?us-ascii?Q?8Wa2fwjiKEXv/9RsISouDemW6N3Pd+S/XQtxbgC240lon3mhR9CVux2GeUa2?=
 =?us-ascii?Q?wCHgNfJ/kP8sfbZm5eGx+UqAQt1r77pTvGEx3Fo8HuBOeKT6EgowAzyfOAQi?=
 =?us-ascii?Q?/TqWQC5KrIZpkqGUntu7QodowhTuvczQxPNu/NpGJ+FiepKJ9/M7il6WD3VV?=
 =?us-ascii?Q?pHgoFqPPbnIsejSyq+BjfFcyS5OYrq3Y/ach2vvH1Lf+LZrYpSd+PR1Tadhk?=
 =?us-ascii?Q?xXFcIvMY4TIrNvtRJsoQ0SlaX+d0+mOjQZcsudtn5DksRBAkDGxzaY2sjjSm?=
 =?us-ascii?Q?MHAlsjzNVpRRrVUn1528qG9hOURN57nBwECM4c2VDWc0ySFuiMbAWtOm0wEq?=
 =?us-ascii?Q?2WsFTX9dz48lI4FV1o3ur1bOAOn4fe1wptpWTkIO8Q4oXK5zyWGp0cUYaAmw?=
 =?us-ascii?Q?wt3KrKRXMissCFJHdt1ltTjtXJ7LAL6a8V/fne2nEf/keadsOaPZzQ9vOO9A?=
 =?us-ascii?Q?M48VOaSt6ROPnaIUf9aiPeXnNckddgLf7AKqtwi/KFOJk/VXycpM/ZAiFglt?=
 =?us-ascii?Q?aHfAqBF8xeSRnW/XvZYhIS80S52VoUY8+IepJ0tYwBrbyvMGmn34bsKehpyo?=
 =?us-ascii?Q?SuMOTVI2g/IUc5ymWhq3nSxuQpFFfTcs5JzyFTzZoMlUI5V5GYTCU8B0rScn?=
 =?us-ascii?Q?AZkzDRMcVA3vZmXsxDtgW8mWzircr77dJEVryZGlVMIhWPVhoe7dTztt+C9H?=
 =?us-ascii?Q?dy5Ip8mG75fnPj4rBUBvS/npbL0+qOC5rVt30K64CKHApwZ7IOEONtKqFhvS?=
 =?us-ascii?Q?rvbaaSkxxnr7b+ddjA1q5JI7L3KCF8Ns/f1iCDtL2SXinXQGjWjnsUYIMeF8?=
 =?us-ascii?Q?yt+lG2BuXYhETSSsHTcFesKIta7EIZAo3EJjoxtG4kNSzXhtYjxRRZp3MS9k?=
 =?us-ascii?Q?SBUBhZRYgUrzgoKj1m95dN5NcG/a37hz7lpgn1lMBfim6anesc4myaMOzn9p?=
 =?us-ascii?Q?+GlUGHrq0sEsJsVyg3x8dW5jbCnLo/LkSwNmO04jMxFgepMg8wnIBbEIx5VG?=
 =?us-ascii?Q?nv1abVzKbBOlK5D3TSUccSHIIoSHh8kxZO3NL56UnRgWGjxapfhP0JIwcH1/?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b700dc89-c510-45c2-31fc-08dd9d60dc88
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 20:55:50.1178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GrvxyHpvVQnd7w7ZgvdPUOyQEdeI+yuYsXGt52xhG3TlKiQaoc2NItEGeHeguINeZr38cglvWcf3iNcdTppfEGn9VTbT1lYxs5Ifpv0fhFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5171
X-OriginatorOrg: intel.com

On Fri, May 23, 2025 at 02:10:46PM +0200, Arnd Bergmann wrote:
>From: Arnd Bergmann <arnd@arndb.de>
>
>The XE driver can be built with or without VSEC support, but fails to link as
>built-in if vsec is in a loadable module:
>
>x86_64-linux-ld: vmlinux.o: in function `xe_vsec_init':
>(.text+0x1e83e16): undefined reference to `intel_vsec_register'
>
>The normal fix for this is to add a 'depends on INTEL_VSEC || !INTEL_VSEC',
>forcing XE to be a loadable module as well, but that causes a circular
>dependency:
>
>        symbol DRM_XE depends on INTEL_VSEC
>        symbol INTEL_VSEC depends on X86_PLATFORM_DEVICES
>        symbol X86_PLATFORM_DEVICES is selected by DRM_XE
>
>The problem here is selecting a symbol from another subsystem, so change
>that as well and rephrase the 'select' into the corresponding dependency.
>Since X86_PLATFORM_DEVICES is 'default y', there is no change to
>defconfig builds here.
>
>Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
>Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>---
> drivers/gpu/drm/xe/Kconfig | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>index beddd153c28c..c870b680431c 100644
>--- a/drivers/gpu/drm/xe/Kconfig
>+++ b/drivers/gpu/drm/xe/Kconfig
>@@ -2,6 +2,8 @@
> config DRM_XE
> 	tristate "Intel Xe Graphics"
> 	depends on DRM && PCI && (m || (y && KUNIT=y))
>+	depends on INTEL_VSEC || !INTEL_VSEC
>+	depends on INTEL_PLATFORM_DEVICES || !(X86 && ACPI)

		   ^
Did you mean X86_PLATFORM_DEVICES here?

With that, Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

I see several drivers selecting
X86_PLATFORM_DEVICES though. Maybe they should also be translated to
dependencies instead?

$ git grep "select X86_PLATFORM_DEVICES"       
drivers/gpu/drm/amd/amdgpu/Kconfig:     select X86_PLATFORM_DEVICES if ACPI && X86
drivers/gpu/drm/gma500/Kconfig: select X86_PLATFORM_DEVICES if ACPI               
drivers/gpu/drm/i915/Kconfig:   select X86_PLATFORM_DEVICES if ACPI               
drivers/gpu/drm/nouveau/Kconfig:        select X86_PLATFORM_DEVICES if ACPI && X86
drivers/gpu/drm/radeon/Kconfig: select X86_PLATFORM_DEVICES if ACPI && X86        

thanks
Lucas De Marchi
