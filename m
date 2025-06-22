Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC1C1ADFFE
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 09:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750583685; cv=fail; b=s0OOQGgrp2j6FiBqGztmdIF3TS8azIL5SOGkBu4aUk+B13r9QJ1/66Z/5M9G+UkAlDMpAlmow6xtx7fGdr7PaGlRkGWbeBVB+uWSx/AYG7/RDhO00XQS+tw9jJ8WAH1GCIQsDf3HQ8ne+xQfQ8TwkNRCu95wIr0q8o5Fpt7mVBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750583685; c=relaxed/simple;
	bh=V28XdQC1WGPHgxsqHuFxzXrbjV8b3F13TFJpkdG7axA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ndbXmxAe2oCfYzad3NXriE/l9t43C0G6YLe6apopKxvz3GrOPi1z34Q32s+3ufDGiiz5S8EZJMEAFE2VwPua8xz+uobMKYl8ou0WzOmxLj9Nb33FDt5k0X5w3lTSou7Dq2O1aU4nMGkY9fW6M/Lzwcxudv3tLS7fj6ocn/SMyo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ngd5fHCM; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ngd5fHCM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750583684; x=1782119684;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=V28XdQC1WGPHgxsqHuFxzXrbjV8b3F13TFJpkdG7axA=;
  b=Ngd5fHCMY0FSycAHWmFdKkUqKN8r9MHrUIUfaGluSfN4W0qHO3Vr/mT0
   XRNtxc2/O56oFpG0HYULNfYXgHwowM2P0VGIXKY9HEI+elTpE4vU55gkf
   TX2cPhi25VS+XmQaP2SuFwLsLp5WZkQxfEogIVhPPVEB8cHNA2wX8RuTd
   MCKIT2p6ahM8r+vZ/JZBnl3fnvdVvDLeMvkX6coIeMrm75lAotmfWM6Qx
   807nmR3JEL/sb67nNamVdlyWF6NIp9JSXxPZ5/z3si6hLU7ZUnnFQPvKZ
   H5Z+HCXWtroWhIrAL52/31YrZsuARP+XuoWpFQ6i16ReND3l+Zpp1B4/4
   g==;
X-CSE-ConnectionGUID: A6hT5ypJQWaM9N6kqWiBgA==
X-CSE-MsgGUID: LVNqily8TGyWiMHczWGCGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="51911011"
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="51911011"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 02:14:43 -0700
X-CSE-ConnectionGUID: m+QFXNN/Q8uEBCelsslC6Q==
X-CSE-MsgGUID: aJiFri4/R0CmC+fLN7s3xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="150793875"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 02:14:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 02:14:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 22 Jun 2025 02:14:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.86) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 02:14:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+i9cfhuykJZjPGiVSeyVL1b6YokNTtN6JbTzFjcM2CzjG0sUfqxvFX9UPhZwBM9OOsOxUU+7qMDaLG4SfU67bwgZ9oe5f7zcaQpHT1GI1kNH0JO6VWwEJ0drFTPyQLzcwN90CH983iDBvbUsvm2aHie6W+3g1tJ6+87UmCvo0HzLcD+VjiDeqtCYVH1OKBvJhMvjfRFPHx4yX4qynldLpkOt3nrtcm66NT2IPG6Vh8o/h8JVU1CX0EoZY95tRly+uQ7yyaCThCmNUzjzks5Y8TjpYxmzCfCc4ZxEq9wRrA7bdbggYzmwqqU5EGkQ8PLiDvzhtEwfMxWG9y8GshZCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V28XdQC1WGPHgxsqHuFxzXrbjV8b3F13TFJpkdG7axA=;
 b=qL+EU/1gW4dEY95m48tdoJ1rNbyKbyXNcfpsTqSFnobUFVrXQlpOI7mghtvfPAigolhyemuXeQBQ2/VKTuVX63BtIA038DlHY2drovSAjm6jIj0W3nXWfqbSwGYl6omlDsaB/QFaRjPXYZVo2+XEXq4WEopykOzyYIvSLyf0lil5a9Ca7+LRD4uhWhpd+gisHnnkgLZFzECw8FpguHWgSKSQB/2EnaEVUyIZnxm9NzpsCawt+72YAyvQ6GVnjdgDK7Yky/8XaQLLH10+08/64UeTLku26huV9QQm9aKWDZ70zfb59h24U7tkmCCj6peDprjCS+Ple6+PrH1LwgEuOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SJ2PR11MB8451.namprd11.prod.outlook.com (2603:10b6:a03:56e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Sun, 22 Jun
 2025 09:14:11 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8857.025; Sun, 22 Jun 2025
 09:14:11 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "Abliyev, Reuven" <reuven.abliyev@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [char-misc-next 1/3] mei: refcount mei_device
Thread-Topic: [char-misc-next 1/3] mei: refcount mei_device
Thread-Index: AQHb4DjtsAlmUQ2UdEacm6P3PI3Z+bQNV0gAgAGD1gA=
Date: Sun, 22 Jun 2025 09:14:10 +0000
Message-ID: <CY5PR11MB6366721138AC774A10698250ED7EA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250618095433.3943546-1-alexander.usyskin@intel.com>
 <20250618095433.3943546-2-alexander.usyskin@intel.com>
 <2025062107-riding-stress-48a4@gregkh>
In-Reply-To: <2025062107-riding-stress-48a4@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SJ2PR11MB8451:EE_
x-ms-office365-filtering-correlation-id: 096c0fa7-770c-45d6-a767-08ddb16d2668
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?N2FaaGNwcEwvN25MVlJvQ3VFekx1aXZhUkkxVFVVNFE2WXR6Q0g0d2ZrMkcw?=
 =?utf-8?B?VEVzNkJJcGF1elNmZXIzU2lDN3kxR0YrOFpZb0dFWUtkZi8rQ3pFMWJjUmw2?=
 =?utf-8?B?c2pXMVJEbjZCTm84WGdNVjJyblFEOHlEdkpYa3BJU2h6cnVsY2NYeUJjem5h?=
 =?utf-8?B?bVoyNmRFbk9QOUNiY2pZQjFadk1pRS9ZcFpXUjRYMHZDaFpRRURlQmo5bjJW?=
 =?utf-8?B?N2s3Z0dsOWhiTm90dmpNY1hUOGdNUTRUOWNaSEY3a09jNWwxTnl5Snd1c2Np?=
 =?utf-8?B?bTJVZVN1UFg4VjJreHpyVGIzSW5DSXRVMkZqTXpZQkl0WWpXZnRkSEJUOE5L?=
 =?utf-8?B?VW8vb3IxVVI1T1JpVllCancvejFCZmJMdkdyLzgzOHNqNEFSV0lvSmI1akhS?=
 =?utf-8?B?bWtyeStyREptc1VHUnZQMTJmNlVqYmk5T3FPdlZqUlE1VnJteEU3N1NVbUNx?=
 =?utf-8?B?VkxNS0FNNjJITVNTK3RtT1M4bDBsb25OTXlsRVVzbnJMOG1IMHBQdFFCSEF4?=
 =?utf-8?B?V2pwNThWZXNaV2J6MmlMeDFRYkFHejl2WFNtMytUTG5NT3Q5NiszMlk2QWxQ?=
 =?utf-8?B?ZDhVeGo5R09UNjMxS2Rma1hYamt2enNKc042eFJqeWJVMCtBZHQxaXhhVlQ4?=
 =?utf-8?B?WTNXSFVDdU1aMURuVTF3ZHMyZkVNZEtNMFo1NGwzSGtQMHBaK1h6ZmovTmht?=
 =?utf-8?B?YmJoZU1SMTM5TjRWN0lLU0dqd29HSnhPVERlL2JKbmJ1MWM1TzN4WkxtVXZX?=
 =?utf-8?B?Q1dpVGd2bU5vczVtdFhYY21FQVprc3ZzVVd4Qi81bGYwc3ZZVW50VkZTZ2tx?=
 =?utf-8?B?NzhiVGVaVGMxZnhSMnBNVUc0dWhmT2xYQUdlRDFMdkdhU1g5ZHhNWmFjTm9T?=
 =?utf-8?B?WFRyU0ExM2NiSDl4L09HbG5rbDJKVFlVdEVIUzdsakIydFladE1rVCs4dDVk?=
 =?utf-8?B?dGxwYUY5TzhCakR4Njd6SUNVZnBiSk8xUDg1eVA0dmdiRzRibTN3cWdVYlkr?=
 =?utf-8?B?VHA0a2JFOVZRQ25nYXVwNnF1QmVtSmM3cXliTy9kWURROEdCak4wSEFUVHFY?=
 =?utf-8?B?VXo0cHNlTk85Qnl5ODBJang1UTUrcTVBVUpxTjlSNmk4bVU5TzB3aVhndC9t?=
 =?utf-8?B?Q24xMHhJcVg2YzM4cG1LZFc5S3dsK0tXTFJLQ0EvemFMYW83RjUwcnB2UUg5?=
 =?utf-8?B?akkyYjFkMWI3UG42b01XQW9zcm41QkNJNHBKNmxST1RyL0g1S2N1MjJFY1dy?=
 =?utf-8?B?dm92R0diamhLNWJ1eWJXcDhKSllKVUZsSlMzWXlSRXJpZ0dOUmdvU2pBVHlp?=
 =?utf-8?B?bCtidkxqVlBkcXE2VzRvNkh2OXExT1BHUWlNbjBaMW5VL1JxMW5GZGpxb2hR?=
 =?utf-8?B?cjhId2pNNWE0VzhSbE9rLzhhVFkrREV0Z0RLclIyRGlTcHQyYlRyK1JiUEI1?=
 =?utf-8?B?dDcwRG5JcnJaVDc5ZTZzeTFScUtLVm1PSSs1WkNZZkwvdEY1Sko2aWc3RDVk?=
 =?utf-8?B?NXdLc2t5eWdaem9GK2tpamlHRTFzRnlBOTh5dllaeVZpbGlISWhUY2c1SGRK?=
 =?utf-8?B?a21UM1pURGdSZDd3NFB4dm5XQytSRTZZTlJZQ0NsLyt2M3p4dC9RRXk5MXNO?=
 =?utf-8?B?cXB5NFNBZEprZjJEQm9NaU90V083R255Sm9XRE1WQ1ZTMXRDa1hESGdrYWNE?=
 =?utf-8?B?V1RBaDJ4a2ZJUFZRV3VXNDdzV1V1UUdBeEt4eFdJaEtXcklnQnE3SkxZMUpv?=
 =?utf-8?B?WW40YmVOYzE0bmxENDM4c1UxVkFqMkxpY1h4UEVQaWU4ZVJGL2VGVm9KY1RN?=
 =?utf-8?B?Z1YvUkNKSUNjdm51cXMybEc5cTM2NjRTdDdreG5BNUY5UFJnazYwcWJsUjdL?=
 =?utf-8?B?ZkJhRW5kWnZ4a2kvVTlIem5oYTRvTjJqdFIyMzlOMnFXcXdFZHRKQkhsL3M1?=
 =?utf-8?B?cWtYN2xEc0ZxRFVnQ3Nua3hlci9xRzNPbDRLNURIUG1HTWpSWkw5VURaazhG?=
 =?utf-8?Q?QGr5YIpfbDFb1k97KqX37aUPgW7Tss=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmU0bnhlSXdJbXB5K3EyMFNROVlVUE5yUHRJdW1Cc2xDTk9NQmJkUExNZGhI?=
 =?utf-8?B?TU9OTnVCUzk5cUxpWUlvYTFNd1kzS3p2d3J0RUgvbW5weXlJUDlrVVNNTVdr?=
 =?utf-8?B?TC9zMmRjZHZ6clZialhMaG5oRy9LWGhKanVRS2lLdTdsdU9yYng5ZExCa201?=
 =?utf-8?B?eW5TS1YzVTM4Ym9LRFhuMkdmNmNmZTVsY2dkM2pNeEdSeVA5MkxnWXpjN0xG?=
 =?utf-8?B?N0Izbk9MdEdFT0JyQWoxZXhUeXllUUFuNElGY3o3c1dZUG81Y1dDNjRja21M?=
 =?utf-8?B?bkM5WWRMQWt1U3hwa1oxWXJ0eU96NEZVZUl0WDV2Wlh2VlNLM09sUUIvcTh6?=
 =?utf-8?B?MjFpcnNZc0lOSW1vbkorR2dwZU5Ia3diU0JoVllldjNsRGRFaUpybGEvSG81?=
 =?utf-8?B?cldaWEgwbzdGdWQwbDYzbnVqdFF4VHU1emJ3NFdNZWxqdHBJMm5JamM1ZU9z?=
 =?utf-8?B?VjUwT2hnWXpuV2RlUXEydGdKSk1rZ21nWGs2ME1pMmZ1dnJsWERwS0I2a0xT?=
 =?utf-8?B?UUNzYXlEUnhQM1JZYzNFTUp5VGJveUxPWmpjeThWQlA0UmQyMnNHSTFRdTlE?=
 =?utf-8?B?S3d0S2lCSUEydkFBZDMvUXZ3NnJEdHR6ZEJWWHVqMzRlR1kzN2d0UUlYcUdM?=
 =?utf-8?B?cnRuZzFOL0thUFRIUE5ha1hNb29QY1pSdnFNM01DOFU3M3ZyOStvRzBabS9z?=
 =?utf-8?B?WWh3UENjamErQzU2c1B4SEhBamZBdlphTjB3aEJXK0U3YXVxL3FpM0JlUlNL?=
 =?utf-8?B?UVlqS2tGajRmZytJNFpydmtZbzFVYmRHbTJtT3FxSHRRZ1ZtU1hLQjNsZmFn?=
 =?utf-8?B?WVZUeHdISWRhM0lMQWdrTnV4Q0RZTVdqOWI1bjFsRjJOMlc0VGYvVTR5Yytx?=
 =?utf-8?B?c2xVVFp1Ym9lMlJaUWRTOXZueFRTYVFkTk1qczZNa05oY1dHRzdtSkMzUU02?=
 =?utf-8?B?WTJGS29CV0lRQm9yUEtxZFRhd0pia25sSzZFZy9NQm1HS3ZXRnRaM05vYVB1?=
 =?utf-8?B?bHlTd1ZaR0xTM1JNSUR4Q2pQb0Z3SU83R0dtU21paHJRYlBoNXBvdElVbDd5?=
 =?utf-8?B?Mm1wc3B4RHdJd242cHNaSUxzemNJQXVKRlBiU3MvamZIV0MvcjhTRm1GSUI3?=
 =?utf-8?B?TXhxYTFGUWpNZlB0T3RLU2MvWkRXWjhQbTUvUmpRVkI5UnFMRU1TdVdobzZR?=
 =?utf-8?B?Y2NRanI2alI0S1ZGQU5XQTBEaG8vcXRoUjNBVXhGZjVWK0JDZ3RsME9zQkFG?=
 =?utf-8?B?SFdpbzhWVUZvZ28rRUM5VWRWWGxhNTUxN2pCdzNPbzFDU1Y2RHloZ2dZSm13?=
 =?utf-8?B?RytBdmxYaXpSRXIzS2NqeE1kcDhyeEJlNUNDaVFwY2xjbXlBVjJwSm1kZCty?=
 =?utf-8?B?dzhvTVZpSWYrQ3B3dC9EWStrQUNod1p6alNvY0xXWkxsM3hjbnpmcXJoQTE5?=
 =?utf-8?B?bGRrRVNWT0R5S21QSTg4NmxzaVFleklTRHJBeFcrVWtrSEcwa0NCRUdNZTdX?=
 =?utf-8?B?b3I5VGdDTmlta05PVWgzWHhrZ0ZjUUczU0xJQ2paSmNVdU50elNJRlN1dEVN?=
 =?utf-8?B?MGt6ZGdCaWs5TlhFSkJkTnl1L05tS0lBbWtKdnBVcURDZzhKUW1KWnQwYmZF?=
 =?utf-8?B?TnYwdVBGUitNQ01CSDJnZ3Vodm5SMlRPZFJmUnl4Si9uNTRIblRielBNYURT?=
 =?utf-8?B?WjN0a1NRalRBUjdPRVJaZitRdEk5K0ZoYTNDNDJCUFUyYmZ0UUo2TEJpYjdv?=
 =?utf-8?B?aUlZZW81TFdlc1BpSUlZM0tBWlFMdGVXYzNCR3hweUd5QmFkT2NtdlpwOGhr?=
 =?utf-8?B?dit0ZWVwSWhKR1JzRzd2WkRPZWJ4c0FqOUNjNlZPVXFjRXRLTEU0eHdvRldI?=
 =?utf-8?B?OHNOYzdod1BHYUhNNVRZRmpKcjJUY09BUUhxMERtWHhrNTN6cUpSbGFrWG9v?=
 =?utf-8?B?UXV6NURMNTZQVHI4VTBlWEswNVBYYVczZ1Z6Qnl1blNaMHM3VE9QOTdvUzNR?=
 =?utf-8?B?YkV5bHlQWkIzWXo4azNEK01SUHpLVkhwRHQ2RFlldStBMHQ0N05UdCtEWWVl?=
 =?utf-8?B?QzRVUUxuRytuWFlrc3RGNytydWVDZWRVakFzZFR0L05tYWE3V1l4VXFpZnZ1?=
 =?utf-8?Q?6s1qGS0qtAcDDz6ZpedIkxNfc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 096c0fa7-770c-45d6-a767-08ddb16d2668
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2025 09:14:11.0022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3CyK19HwZ1Hi/VT8c5vhDCtdMyb4z7gohQV1413FBLnQDr3xFNsga1vxIHYWWhEzRQ337vbhjjW4Ccs4umzPSDQtVV2tjQD97Bke4L88kLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8451
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBSZTogW2NoYXItbWlzYy1uZXh0IDEvM10gbWVpOiByZWZjb3VudCBtZWlfZGV2
aWNlDQo+IA0KPiBPbiBXZWQsIEp1biAxOCwgMjAyNSBhdCAxMjo1NDozMVBNICswMzAwLCBBbGV4
YW5kZXIgVXN5c2tpbiB3cm90ZToNCj4gPiBtZWlfZGV2aWNlIGxpZmV0aW1lIGlzIG1hbmFnZWQg
YnkgZGV2bSBwcm9jZWR1cmUgb2YgcGFyZW50IGRldmljZS4NCj4gPiBCdXQgc3VjaCBtZW1vcnkg
aXMgZnJlZWQgb24gZGV2aWNlX2RlbC4NCj4gPiBNZWlfZGV2aWNlIG9iamVjdCBpcyB1c2VkIGJ5
IGNsaWVudCBvYmplY3QgdGhhdCBtYXkgYmUgYWxpdmUgYWZ0ZXINCj4gPiBwYXJlbnQgZGV2aWNl
IGlzIHJlbW92ZWQuDQo+ID4gSXQgbWF5IGxlYWQgdG8gdXNlLWFmdGVyLWZyZWUgaWYgZGlzY3Jl
dGUgZ3JhcGhpY3MgZHJpdmVyDQo+ID4gdW5sb2FkcyBtZWlfZ3NjIGF1eGlsaWFyeSBkZXZpY2Ug
d2hpbGUgdXNlci1zcGFjZSBob2xkcw0KPiA+IG9wZW4gaGFuZGxlIHRvIG1laSBjaGFyYWN0ZXIg
ZGV2aWNlLg0KPiA+DQo+ID4gUmVwbGFjZSBkZXZtIGxpZmV0aW1lIG1hbmFnZW1lbnQgd2l0aCBy
ZWZlcmVuY2UgY291bnRpbmcNCj4gPiB0byBlbGltaW5hdGUgdGhlIHVzZS1hZnRlci1mcmVlLg0K
PiANCj4gT3ZlcmFsbCwgSSBsaWtlIHRoZSBlbmQgcmVzdWx0LCBidXQgbm90ZSB0aGF0IGlmIHlv
dSBqdXN0IGFwcGx5IHRoaXMNCj4gcGF0Y2ggdGhlbjoNCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9t
aXNjL21laS9tZWlfZGV2LmgNCj4gPiArKysgYi9kcml2ZXJzL21pc2MvbWVpL21laV9kZXYuaA0K
PiA+IEBAIC00NzQsNiArNDc0LDggQEAgc3RydWN0IG1laV9kZXZfdGltZW91dHMgew0KPiA+ICAg
KiBAY2RldiAgICAgICAgOiBjaGFyYWN0ZXIgZGV2aWNlDQo+ID4gICAqIEBtaW5vciAgICAgICA6
IG1pbm9yIG51bWJlciBhbGxvY2F0ZWQgZm9yIGRldmljZQ0KPiA+ICAgKg0KPiA+ICsgKiBAcmVm
Y250ICAgICAgOiBzdHJ1Y3QgcmVmZXJlbmNlIGNvdW50DQo+ID4gKyAqDQo+ID4gICAqIEB3cml0
ZV9saXN0ICA6IHdyaXRlIHBlbmRpbmcgbGlzdA0KPiA+ICAgKiBAd3JpdGVfd2FpdGluZ19saXN0
IDogd3JpdGUgY29tcGxldGlvbiBsaXN0DQo+ID4gICAqIEBjdHJsX3dyX2xpc3QgOiBwZW5kaW5n
IGNvbnRyb2wgd3JpdGUgbGlzdA0KPiA+IEBAIC01NjAsNiArNTYyLDggQEAgc3RydWN0IG1laV9k
ZXZpY2Ugew0KPiA+ICAJc3RydWN0IGNkZXYgY2RldjsNCj4gPiAgCWludCBtaW5vcjsNCj4gPg0K
PiA+ICsJc3RydWN0IGtyZWYgcmVmY250Ow0KPiA+ICsNCj4gPiAgCXN0cnVjdCBsaXN0X2hlYWQg
d3JpdGVfbGlzdDsNCj4gPiAgCXN0cnVjdCBsaXN0X2hlYWQgd3JpdGVfd2FpdGluZ19saXN0Ow0K
PiA+ICAJc3RydWN0IGxpc3RfaGVhZCBjdHJsX3dyX2xpc3Q7DQo+IA0KPiBZb3Ugbm93IGhhdmUg
MiByZWZlcmVuY2UgY291bnRzIGNvbnRyb2xpbmcgdGhlIGxpZmVzcGFuIG9mIHRoaXMNCj4gc3Ry
dWN0dXJlLCBhbmQgaXQgd2lsbCBiZSBhIG1lc3MuDQo+IA0KDQpJdCBpcyBhYm91dCBjZGV2PyBC
dXQgc3RhdGljIGNkZXYgKGxpa2UgYmVmb3JlIHRoaXJkIHBhdGNoKSBpcyBub3QgcmVmY291bnRl
ZC4NCldoYXQgaXMgdGhlIHNlY29uZCByZWZlcmVuY2UgY291bnRlcj8NCg0KPiBZZXMsIHlvdSBj
bGVhbiBpdCB1cCBpbiB0aGUgbGFzdCBwYXRjaCwgc28gb3ZlcmFsbCBpdCdzIG9rLCB0aGlzIGlz
IGp1c3QNCj4gYSB3b3JyeWluZyBzdGVwLg0KPiANCj4gQWxzbywgd2h5IGFyZSB5b3UgdXNpbmcg
YSBrcmVmPyAgV2h5IG5vdCB1c2UgdGhlIHJlYWwgc3RydWN0IGRldmljZSBpZg0KPiB5b3Ugd2Fu
dCB0byBoYXZlIGEgcmVmZXJlbmNlIGNvdW50ZWQgZGV2aWNlIHN0cnVjdHVyZT8gIFRoYXQgaXMg
d2hhdA0KPiBzaG91bGQgYmUgaGFwcGVuaW5nIGhlcmUsIHdoYXQncyB3cm9uZyB3aXRoIHRoZSBz
dHJ1Y3QgZGV2aWNlICogdGhhdCB5b3UNCj4gYWxyZWFkeSBoYXZlPyAgV2h5IG5vdCBoYXZlIHRo
YXQgdGFrZSBvdmVyIG93bmVyc2hpcCBpbnN0ZWFkIG9mIG1ha2luZyBhDQo+IG5ld2VyIGludGVy
bWVkaWF0ZSByZWZlcmVuY2UgY291bnRlZCBvYmplY3Q/DQo+IA0KDQpUaGUgZGV2aWNlICpkZXYg
aW4gbWVpX2RldmljZSBpcyB0aGUgcGFyZW50IGRldmljZS4NCk9uIGF1eGlsaWFyeSBidXMgaXQg
Y2FuIGJlIHJlbW92ZWQgd2hpbGUgZHJpdmVyIGlzIHN0aWxsIGFjdGl2ZS4NClRoZSBkZXZpY2Vf
ZGVsIHJlbW92ZXMgYWxsIG1lbW9yeSBhbGxvY2F0ZWQgd2l0aCBkZXZtXyouDQpJIGNhbid0IGZp
bmQgYSB3YXkgaG93IHRvIGtlZXAgZHJpdmVyIHByaXZhdGUgbWVtb3J5IGFsaXZlDQp0aWxsIGxh
c3QgcmVmZXJlbmNlIHRvIHBhcmVudCBkZXZpY2Ugc3RpbGwgaGVsZC4NClRoaXMgd2h5IEkndmUg
cmVzb3J0ZWQgdG8gbWFudWFsIGtyZWYuDQpJJ20gZmVlbGluZyB0aGF0IEknbSBtaXNzaW5nIHNv
bWV0aGluZyBoZXJlLg0KSXMgdGhlcmUgYW55IG90aGVyIHdheSB0byBkbyBpdD8NCg0KLSAtIA0K
VGhhbmtzLA0KU2FzaGENCg0KDQo+IHRoYW5rcywNCj4gDQo+IGdyZWcgay1oDQo=
