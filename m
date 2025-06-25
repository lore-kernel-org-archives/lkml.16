Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CF52BD58A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750846049; cv=fail; b=qcDjCHXMmw3HHbarl7ZVZEFh6tsO9zOMfCCItNHiZ3VfXj+gbRJZdmZqIOmRH2IezVNmymmo/GUn+zJ628VpaawBWe61tVNGE8+gr34BB58JcjbYWOgn5bfPtfLvRBz57lS2JJtU7eGUGU0d+1si+uzDowySB4wcwez+eATBvqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750846049; c=relaxed/simple;
	bh=CuXElK2tkBJNb/HbOgNfIh9hE6yesQJ7uS0fp3ai5SE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Wbi/lpaVyDx81NWrIqvLRRq0GYdNiW1KBfMNnE1hwfyocdslnLh+EprssVdQlC69S/U6mK1rOTANLkUp1W6fntTpvhN52cbCNPZM985ilG9ZPvSuexI3mM9TbYvHAbwz/5AkFBrZIXeZmTAs+mJZSOIEZQddVWnVk3QFYyV2ekw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g1E+hDOb; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g1E+hDOb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750846047; x=1782382047;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CuXElK2tkBJNb/HbOgNfIh9hE6yesQJ7uS0fp3ai5SE=;
  b=g1E+hDObsnid5BTbnvno74rYeiFy0N2Rv5p/MipRzAwYFjCUhsl0nwoF
   Y+GyOf2h+FnmZ/TdRI+Er8w1ufV39RqAIQVfkREWnwQ7RSvUSY8Y4LSPq
   ynv3WR1Jx0Is00xLA4mZ0HDnU1/8Xim1ZMsBtIW4gMQyCzgFiP7AYLFvD
   mWBavE1eY3YhTGDyMtILzDAvUEVxBOhFp09WEsqaqoS5HBK12Vq+9CpoN
   YxTlsXeKySh8zKpnY+8hZzHa9i55zemqlcCWceWVorjQCY8sEucdUk/Go
   s9UffXdU+5NAH8ZXId0RgMGDVhVt1f4ruzC2lY0wWgFu2caehzB2/van9
   g==;
X-CSE-ConnectionGUID: vMp6kzEoT2+M6EQ5McMyeQ==
X-CSE-MsgGUID: EZ/yEo1ORe6foJBZbUM0cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56789317"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="56789317"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 03:07:27 -0700
X-CSE-ConnectionGUID: ZsWYuiTeTSS48OOovibc7A==
X-CSE-MsgGUID: 4HV5N2cVRk6vOiwSynCoKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="156746153"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 03:07:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 03:07:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 03:07:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 03:07:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6TJJTO/tHSxbXOcAA2I08jZ/xUJJokUeoE826CpcVx1IPPElUJUecqD5VHUmrHctlG5TVypG5dMox5vmdkH9HVB0ASJUczaIvugPoGu2PGHu54//WpNQSymqThjY/EWcx7Z+bJ+dfsluisIQz14cvRkUwxWPg4/UIyHCUHxEXdJ0i4dT1N7ErlDXEx9kcDAZ1vLwetirQqq6vWhwvYRhk3b8VpLGWglmgYeOQDzo6+PlwGdeerPTzyg9e+0guSI8tzLZmciR2LLaNuP6PQf4xhejAYgXB0+6eqZCGgPmLcnL4qmcJOfJzromI8n7CMEb2up+04GyRlnL1KqearBEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CuXElK2tkBJNb/HbOgNfIh9hE6yesQJ7uS0fp3ai5SE=;
 b=fkpmyJl8XeHDANnwyQosxoUmR1XQ9dfk16V3wB2AYQZHjTswpyzMrHmyFE4g6TTVqmEdhPf2RTIoDoofkKM5EEcuDVoFSYieDWUOU5S3VAC+UaE/YFdy36uKfcRhCb87kVVlELJMcNsNBJ0BKYpeKB2PLh3pIIO2SiOvaMxcAx4N7ZeOS0eVCn/LOwo2xPrWZf/ClMm7yeuyuliZPtyScFEgJbWAn1o7CIVdJn+gjLF90Nau5GAgaR2JnBmSY/Ai1Se3BXx1d5FHU4x3OKwIY5QaEUS/2WPfTc+lwedt6EVFU/zxHZjIO8TyWhuE1XVfh5/Fp2OLDbSAbjpm7ek6wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by DM4PR11MB6166.namprd11.prod.outlook.com (2603:10b6:8:ad::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 10:07:23 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 10:07:23 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Hans de Goede <hansg@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Stanislaw Gruszka
	<stanislaw.gruszka@linux.intel.com>
CC: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 08/10] mei: vsc: Run event callback from a workqueue
Thread-Topic: [PATCH 08/10] mei: vsc: Run event callback from a workqueue
Thread-Index: AQHb5BwBsZuX8hDOKEG6gU8/FvmUVLQTqZLA
Date: Wed, 25 Jun 2025 10:07:23 +0000
Message-ID: <CY5PR11MB63663E1CC062DC610D81954EED7BA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250623085052.12347-1-hansg@kernel.org>
 <20250623085052.12347-9-hansg@kernel.org>
In-Reply-To: <20250623085052.12347-9-hansg@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|DM4PR11MB6166:EE_
x-ms-office365-filtering-correlation-id: 00e1f97d-9509-47c3-2063-08ddb3d01464
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?K20wNURDcUZpQmxrL0taZ2pJdk9WRi94bkkvK3RUVEVvODl1eXVrRC9zOFI4?=
 =?utf-8?B?R0djUUJSZUR5N3dkeXJPL1FSMVdTZlFxZVE4cTA0S0RXUm9MNlNmMkV3TXpW?=
 =?utf-8?B?UHBEU2M0TWRXaW95SEc3Q2Rsdm5VRndWYnNCOGRwY3ZSMExNNXZ6ODc5czhZ?=
 =?utf-8?B?WU5XYSsyQUcraXFCY2MzOEFkWVVJcHVVNFR6ajdEaHVWSm9SbWk4M2xYMnhK?=
 =?utf-8?B?Tlh0NDA5ZzMrbmRxbjZ6QXIzRHdXSzRrV20xd0ZJbUtwTXZISXVMdnhZNks4?=
 =?utf-8?B?MURVSVYzcXpNSDVhQi9HOXRJaCsvVFBTeGtZWkt6Szd0N1lJR2RRV3lra2Fm?=
 =?utf-8?B?WHdpR1ZnZ3RqaVMzVXhvYlMvZGdlcmFaa0dhQjNLM1l0Y01mc1BFN0ljd0p0?=
 =?utf-8?B?NjN0MzhuWERuK2s3VFhOV29LcEQ1enBTOUg5bVVmT01XNjFuNjF0dEFGdmdN?=
 =?utf-8?B?R0hoZUZjVlNycys4cFJXQXE0QjJCNy8zcC9rR2tsQlNqUVpiUGhJRGJNMHhx?=
 =?utf-8?B?VHdrSXA5TTVXa1l4RkdFNUtkdVhORjEvMDQzcDhiMzRZRzVqdjNiaEZBS2Fm?=
 =?utf-8?B?K3hKNEl0ZytvQUo1MVV0RktqTSs3SVNpbzBPVHM1Vzd4VlFRS3FhcEFEQjUr?=
 =?utf-8?B?NHF3QXZMREdVZTIzaUIybWFJVGJDbHRqd3RPOHpYQllBeTNuWW1UR2l4ZVhF?=
 =?utf-8?B?VjJBVFVCQU9BTTBmazVJTFJUWkdsMWRlTTdSZkVIUHBuajdFOWtFRlBMTFdp?=
 =?utf-8?B?LzJHWHJSa0dtZ0FpL3IrTnYyOWg1b3BDZHhkeVFlK01pZ0hObmxNQllvdUZh?=
 =?utf-8?B?YTZtZmtoRnQrZGRtM2F4bGhQNGVtbStPS0NNdFNQYUtRZ2Q4RWgwa3FmejBq?=
 =?utf-8?B?Vkg5cVEyQVhuQU8yeG9GSWw5Q3Vlak1hV0xlTHdxc3BVdEdzQStBNHBBU09W?=
 =?utf-8?B?cXFkSlNHdnM3VHFQSm9mblp2TnpCTWUwdkVLMHFadFA2TjNqREZXN0V3VHVJ?=
 =?utf-8?B?RUxyVDROaHM3ZG8yT084a1N2SVBsODUrQkNRb25XMG1qZURub0Z0eE92T25l?=
 =?utf-8?B?cTB5N3orQldCKzNZMlR5eVkzSnFZUEVYMkpocU9WNVRpMGNKNnU4eUtwT21J?=
 =?utf-8?B?eWRMbmhqVFhyeVZ6RHRXakwyb0RleE0yVkE3OHBlUmhnWlgzVEVnaEJ4NHo1?=
 =?utf-8?B?Y3NYOGtyM1E0WEdRbzBHUXJhQzIxN0FncDNyYlpXK2lSVVdmOHV3czJ6Qmdt?=
 =?utf-8?B?eDRtNFMzZ3Z3eXZZQmhSd2FrUnNseUhUU3ZFaTY0ZC81WG9ua2xtRW1QR3B6?=
 =?utf-8?B?VmoyWlQ1SWI1Z0d0THZoN1YvWGppblFUOEFncTFZenJ4ajM5cjZBUCsraXgv?=
 =?utf-8?B?Y1l0NWlqbFlWaDBvdEVwVm1QbnNHSjVaUzJMbDd4aDJDQ0pSNHkzM0tNMnJo?=
 =?utf-8?B?OU9KNWJ4S2FYczhsMlp6bXhGNFlDa01oclhLbWhPSTNuY1JOSXRhK3pqeDhC?=
 =?utf-8?B?M1F3eXNuMlhXOGp0bHZJR0o4K0loaUM3SkdLY3RoSzZycWZaaEMzS1JEelUv?=
 =?utf-8?B?T09hdkFYRzJtNmFNazBrNGE5R0VFTGw5a0tURUVObzcrUE9RZHllTWp1N2dO?=
 =?utf-8?B?bFdnR0VERTJVL2pyTERpNllqVUVZZFM4RmIvVXhNWGRVSzlyTE9CL0tTSUNp?=
 =?utf-8?B?dXJMOUEyV1BtV0w3M0N5YUNZY3kxdXBYVnRYSGVnTE43d1h5N2h2Mlk2dU12?=
 =?utf-8?B?OXNEK1lrbU9ZdnA2ekJyZ2FrazNjMkhqMnVqQTVsZk1qa2p4WXhjN2dVQUJJ?=
 =?utf-8?B?RVJiZmN5UEFGOFJiRzdiaXM5QXBPMzhSQXRFUDNSdmg4K1RqVzNWWXVTdXBo?=
 =?utf-8?B?Wm9HY25aMFpXVDd1M1haOWdEZTRzMGpGam15NXFJQVVpQ1psdDd2eHdja0lZ?=
 =?utf-8?B?N2Zrd2tCcE5vQUdJaWdaeGJWdnFacExmM3RySVRwRktJTUlLbEtpTDIxdDdk?=
 =?utf-8?Q?oyTH48+VjAQyU17NpAKiaMiWQSQzbw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2dTaXNTMURvTHFGRXJyb3c5SGh3Q05kUElWb3c0aS9UdjNlTlZDK0NOWmM2?=
 =?utf-8?B?cnNqdWNJSDNrVzJkTm1HcGV0VGZ0UjBLUFlPZmpZOUN5eFpTYlBxVHNTWWl0?=
 =?utf-8?B?emkwdkp6cURuL25weTUyejBjRUtmK1R5WGk4cFRpdEZ5TjJrVXdiQm1zNjhE?=
 =?utf-8?B?UkN0dGlTZG1PendKcCtncjRFak9adFlnc2ZiNWVoWjIwdnNuSzAwVUw5d25O?=
 =?utf-8?B?OHBtNnRZb1R0VWttQ3pLbUVEVzhFeHRORHh2SS9yMHhlWC9TcHJrRVk3dGtj?=
 =?utf-8?B?aDlvMzVNcSs2VklMNUFES05qVFZIajJUUjV3K0ZtdFpOT0VrWXhmdThrZWNz?=
 =?utf-8?B?Y3ljZlR0WHBKN212K0dZbGJFaFVLVFNlZzVXaUtyOUJNVEd4U3B6TnExNklu?=
 =?utf-8?B?bW9tSjd3b1pJTnNiZEFISTYzRW5YOUZkdFlyWDdFdGVsenVHRFUyK0FtQWY1?=
 =?utf-8?B?SHF3ZHlRZTJkQ3ZHdk83YzZySm9jWlZCQ2pGWG8zb0QveXA1TDl3clUweTkx?=
 =?utf-8?B?czllSmNoU0VzcnpMTFR2UGtSVk4vNGtmTlRTV1BQRmJsWTRYOU8wYXlLaU9W?=
 =?utf-8?B?S1pESThISFJodTl6SHZIaHJmZURiYVNjZDNkdVBrZ3FjZG13V3l1WWRWa2x0?=
 =?utf-8?B?RUdiUmFXVmpPWjNDN1AxaDR1NldPNWxsSmhEbGFSOEtyYWtRYUF3c1NBc3N5?=
 =?utf-8?B?S0tnblhLWmJZZ2NmaTNYVC8raE1ueGhKSzR5TitLanBZREt0d0VPTytJZTRU?=
 =?utf-8?B?a1VnUjcwdkt2UDVBUWJEUThHaks3ZVJmQXNhWDVwMnZBSkovOUNvYkZNRElE?=
 =?utf-8?B?elZ0K3lYK0FWSFFaTkh6cksySmRSYk8ybmhHOTJybkw2SVVGVHdaclJCQkdS?=
 =?utf-8?B?Z1d1Qk5ic0t1ejFja1pQRCtwWERFSStHMVR2N1lpM1k0cWs2SXhSTjh0S2h1?=
 =?utf-8?B?L0VFcWthV2tHenF6K0d1NG00MVQ1TVZxSm9xaGJZdGZ2Q0hMWjI3Nm9SSnVX?=
 =?utf-8?B?b1psWWhpbzlxenltQlhUZUFQRTBGSndrRG1sODU0b3EyeWl6ZW5wVGFPWlhF?=
 =?utf-8?B?YzdHQjQycXlockpmUjlwVlJMSW9qWHpxSDkzYklvS3M0Vkl1RXBFS05kZDBR?=
 =?utf-8?B?bHBqTCs2aElIVis3NFQxZ1BXQVc2YXpVOUgzVDdxR1J0Mi9nSkw0bEd0RW9I?=
 =?utf-8?B?a3pYWjJobGlYc1IwVitoQkNkK1ZoVEdHSkN0R2tVN1EvWGJtOERwb2NnWEZG?=
 =?utf-8?B?TGxXK1kwb1lYRFZZb3pwZGZsSDhWL0d4Z1RERHJjSDZ1encwZzRKZ3JlNWRy?=
 =?utf-8?B?a3lsNWlSNUowYmF5QlRKNHR4VlVQYzNaN3lpL28rRVhBZnpiNDZBSldETnJF?=
 =?utf-8?B?bUtSSER1WEZ3M3VicXlRaWMxbGJiTXRSQWViSElyakpkOGx3MDVnM3hQcGlu?=
 =?utf-8?B?L0thL0FCN2xLc0dTNXJKMmpsalhtZ2luZVJKTzg5WllMT2k2N0E4dER3N1RZ?=
 =?utf-8?B?ZVB1Q0t2L1FpS3VYZzJoYVc5SGtkTGRXV0dGRm9Nd25uUTRDK1VJcDZ1T0lm?=
 =?utf-8?B?dXFzSEl4Z29YaGpZalJidFVtaTJaSytmUklVVHRab1dqZVZybEpyV1ZubWFr?=
 =?utf-8?B?ZU92VjdoWG5hRmNjd3lzV1h2aURrWmg4T0xZU2xwSDdBd1VDekRQWU5WRVli?=
 =?utf-8?B?T1ZIb05pd2tubWtaNDRzbHdmY3ZOSkM0ZGVxMGNYM3NIem5mOS9yT1YzM1p4?=
 =?utf-8?B?QkF2UkZwUDdrQnM3Y1JMaWpUVWRVTTdWbmZxb2htVHVTU1BsVnpWQnhyMVNR?=
 =?utf-8?B?enlXTVRPTVJJYk91WVAvRkZrS28yQkIwOE1kSWxnaEFzQjZaZWs5UGtiNU5j?=
 =?utf-8?B?YzRqTXZZU1Q4eXYra0NnY1NBUWo0cE40dUt0Rm1QWlg4ZCt2L3Z0Uzlud0ND?=
 =?utf-8?B?d2M2WjM1WnE4N1EzeGVja2tXUGtmWXJ5YitzeURYUWh0Um9OcmtqaDliNk9F?=
 =?utf-8?B?SGVTbkkvV0VOcTJOU2dZckplUkxXREUreHltR3VuNHV3dEhrWFJ3NitlNjVM?=
 =?utf-8?B?T3YyL2FRNjB0SHl5U1VwZDZ0cTAyK05uY1lRZWYycDZwVk8zMjVmdGk3ZFlt?=
 =?utf-8?Q?+pxnK/QcjogX4FNh08C/EhQ/d?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e1f97d-9509-47c3-2063-08ddb3d01464
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 10:07:23.2936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kX5KcG+AiApjw2pqqI35vNWYP5HU3wM7PIBRxPlO06OeYYf54xYNCaKFCqPMy9t8G5O4YXTv25jtQOHiAiWSGvt5oNobBKbaJm6UsGkci/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6166
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBbUEFUQ0ggMDgvMTBdIG1laTogdnNjOiBSdW4gZXZlbnQgY2FsbGJhY2sgZnJv
bSBhIHdvcmtxdWV1ZQ0KPiANCj4gVGhlIGV2ZW50X25vdGlmeSBjYWxsYmFjayBpbiBzb21lIGNh
c2VzIGNhbGxzIHZzY190cF94ZmVyKCksIHdoaWNoIGNoZWNrcw0KPiB0cC0+YXNzZXJ0X2NudCBh
bmQgd2FpdHMgZm9yIGl0IHRocm91Z2ggdGhlIHRwLT54ZmVyX3dhaXQgd2FpdC1xdWV1ZS4NCj4g
DQo+IEFuZCB0cC0+YXNzZXJ0X2NudCBpcyBpbmNyZWFzZWQgYW5kIHRoZSB0cC0+eGZlcl93YWl0
IHF1ZXVlIGlzIHdva2VuIG8NCj4gZnJvbSB0aGUgaW50ZXJydXB0IGhhbmRsZXIuDQo+IA0KPiBT
byB0aGUgaW50ZXJydXB0IGhhbmRsZXIgd2hpY2ggaXMgcnVubmluZyB0aGUgZXZlbnQgY2FsbGJh
Y2sgaXMgd2FpdGluZyBmb3INCj4gaXRzZWxmIHRvIHNpZ25hbCB0aGF0IGl0IGNhbiBjb250aW51
ZS4NCj4gDQo+IFRoaXMgaGFwcGVucyB0byB3b3JrIGJlY2F1c2UgdGhlIGV2ZW50IGNhbGxiYWNr
IHJ1bnMgZnJvbSB0aGUgdGhyZWFkZWQNCj4gSVNSIGhhbmRsZXIgYW5kIHdoaWxlIHRoYXQgaXMg
cnVubmluZyB0aGUgaGFyZCBJU1IgaGFuZGxlciB3aWxsIHN0aWxsDQo+IGdldCBjYWxsZWQgYSBz
ZWNvbmQgLyB0aGlyZCB0aW1lIGZvciBmdXJ0aGVyIGludGVycnVwdHMgYW5kIGl0IGlzIHRoZSBo
YXJkDQo+IElTUiBoYW5kbGVyIHdoaWNoIGRvZXMgdGhlIGF0b21pY19pbmMoKSBhbmQgd2FrZV91
cCgpIGNhbGxzLg0KPiANCj4gQnV0IGhhdmluZyB0aGUgdGhyZWFkZWQgSVNSIGhhbmRsZXIgd2Fp
dCBmb3IgaXRzIG93biBpbnRlcnJ1cHQgdG8gdHJpZ2dlcg0KPiBhZ2FpbiBpcyBub3QgaG93IGEg
dGhyZWFkZWQgSVNSIGhhbmRsZXIgaXMgc3VwcG9zZWQgdG8gYmUgdXNlZC4NCj4gDQo+IE1vdmUg
dGhlIHJ1bm5pbmcgb2YgdGhlIGV2ZW50IGNhbGxiYWNrIGZyb20gYSB0aHJlYWRlZCBpbnRlcnJ1
cHQgaGFuZGxlcg0KPiB0byBhIHdvcmtxdWV1ZSBzaW5jZSBhIHRocmVhZGVkIElTUiBzaG91bGQg
bm90IHdhaXQgZm9yIGV2ZW50cyBmcm9tIGl0cw0KPiBvd24gaW50ZXJydXB0Lg0KPiANCj4gVGhp
cyBpcyBhIHByZXBhcmF0aW9uIHBhdGNoIGZvciBtb3ZpbmcgdGhlIGF0b21pY19pbmMoKSBhbmQg
d2FrZV91cCgpIGNhbGxzDQo+IHRvIHRoZSB0aHJlYWRlZCBJU1IgaGFuZGxlciwgd2hpY2ggaXMg
bmVjZXNzYXJ5IHRvIGZpeCBhIGxvY2tpbmcgaXNzdWUuDQo+IA0KUmV2aWV3ZWQtYnk6IEFsZXhh
bmRlciBVc3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+DQoNCj4gRml4ZXM6IDU2
NmY1Y2E5NzY4MCAoIm1laTogQWRkIHRyYW5zcG9ydCBkcml2ZXIgZm9yIElWU0MgZGV2aWNlIikN
Cj4gU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGFuc2dAa2VybmVsLm9yZz4NCj4gLS0t
DQo+ICBkcml2ZXJzL21pc2MvbWVpL3ZzYy10cC5jIHwgMTcgKysrKysrKysrKystLS0tLS0NCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWlzYy9tZWkvdnNjLXRwLmMgYi9kcml2ZXJzL21pc2MvbWVp
L3ZzYy10cC5jDQo+IGluZGV4IDc2YTZhYTYwNmEyNi4uZjVlYTM4ZjIyNDE5IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL21pc2MvbWVpL3ZzYy10cC5jDQo+ICsrKyBiL2RyaXZlcnMvbWlzYy9tZWkv
dnNjLXRwLmMNCj4gQEAgLTE4LDYgKzE4LDcgQEANCj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9y
bV9kZXZpY2UuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9zcGkvc3BpLmg+DQo+ICAjaW5jbHVkZSA8
bGludXgvdHlwZXMuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC93b3JrcXVldWUuaD4NCj4gDQo+ICAj
aW5jbHVkZSAidnNjLXRwLmgiDQo+IA0KPiBAQCAtNzYsNiArNzcsNyBAQCBzdHJ1Y3QgdnNjX3Rw
IHsNCj4gDQo+ICAJYXRvbWljX3QgYXNzZXJ0X2NudDsNCj4gIAl3YWl0X3F1ZXVlX2hlYWRfdCB4
ZmVyX3dhaXQ7DQo+ICsJc3RydWN0IHdvcmtfc3RydWN0IGV2ZW50X3dvcms7DQo+IA0KPiAgCXZz
Y190cF9ldmVudF9jYl90IGV2ZW50X25vdGlmeTsNCj4gIAl2b2lkICpldmVudF9ub3RpZnlfY29u
dGV4dDsNCj4gQEAgLTEwNSwxOSArMTA3LDE5IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCB2c2NfdHBf
aXNyKGludCBpcnEsIHZvaWQgKmRhdGEpDQo+IA0KPiAgCXdha2VfdXAoJnRwLT54ZmVyX3dhaXQp
Ow0KPiANCj4gLQlyZXR1cm4gSVJRX1dBS0VfVEhSRUFEOw0KPiArCXNjaGVkdWxlX3dvcmsoJnRw
LT5ldmVudF93b3JrKTsNCj4gKw0KPiArCXJldHVybiBJUlFfSEFORExFRDsNCj4gIH0NCj4gDQo+
IC1zdGF0aWMgaXJxcmV0dXJuX3QgdnNjX3RwX3RocmVhZF9pc3IoaW50IGlycSwgdm9pZCAqZGF0
YSkNCj4gK3N0YXRpYyB2b2lkIHZzY190cF9ldmVudF93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAq
d29yaykNCj4gIHsNCj4gLQlzdHJ1Y3QgdnNjX3RwICp0cCA9IGRhdGE7DQo+ICsJc3RydWN0IHZz
Y190cCAqdHAgPSBjb250YWluZXJfb2Yod29yaywgc3RydWN0IHZzY190cCwgZXZlbnRfd29yayk7
DQo+IA0KPiAgCWd1YXJkKG11dGV4KSgmdHAtPmV2ZW50X25vdGlmeV9tdXRleCk7DQo+IA0KPiAg
CWlmICh0cC0+ZXZlbnRfbm90aWZ5KQ0KPiAgCQl0cC0+ZXZlbnRfbm90aWZ5KHRwLT5ldmVudF9u
b3RpZnlfY29udGV4dCk7DQo+IC0NCj4gLQlyZXR1cm4gSVJRX0hBTkRMRUQ7DQo+ICB9DQo+IA0K
PiAgLyogd2FrZXVwIGZpcm13YXJlIGFuZCB3YWl0IGZvciByZXNwb25zZSAqLw0KPiBAQCAtNDk1
LDcgKzQ5Nyw3IEBAIHN0YXRpYyBpbnQgdnNjX3RwX3Byb2JlKHN0cnVjdCBzcGlfZGV2aWNlICpz
cGkpDQo+ICAJdHAtPnNwaSA9IHNwaTsNCj4gDQo+ICAJaXJxX3NldF9zdGF0dXNfZmxhZ3Moc3Bp
LT5pcnEsIElSUV9ESVNBQkxFX1VOTEFaWSk7DQo+IC0JcmV0ID0gcmVxdWVzdF90aHJlYWRlZF9p
cnEoc3BpLT5pcnEsIHZzY190cF9pc3IsIHZzY190cF90aHJlYWRfaXNyLA0KPiArCXJldCA9IHJl
cXVlc3RfdGhyZWFkZWRfaXJxKHNwaS0+aXJxLCB2c2NfdHBfaXNyLCBOVUxMLA0KPiAgCQkJCSAg
IElSUUZfVFJJR0dFUl9GQUxMSU5HIHwgSVJRRl9PTkVTSE9ULA0KPiAgCQkJCSAgIGRldl9uYW1l
KGRldiksIHRwKTsNCj4gIAlpZiAocmV0KQ0KPiBAQCAtNTAzLDYgKzUwNSw3IEBAIHN0YXRpYyBp
bnQgdnNjX3RwX3Byb2JlKHN0cnVjdCBzcGlfZGV2aWNlICpzcGkpDQo+IA0KPiAgCW11dGV4X2lu
aXQoJnRwLT5tdXRleCk7DQo+ICAJbXV0ZXhfaW5pdCgmdHAtPmV2ZW50X25vdGlmeV9tdXRleCk7
DQo+ICsJSU5JVF9XT1JLKCZ0cC0+ZXZlbnRfd29yaywgdnNjX3RwX2V2ZW50X3dvcmspOw0KPiAN
Cj4gIAkvKiBvbmx5IG9uZSBjaGlsZCBhY3BpIGRldmljZSAqLw0KPiAgCXJldCA9IGFjcGlfZGV2
X2Zvcl9lYWNoX2NoaWxkKEFDUElfQ09NUEFOSU9OKGRldiksDQo+IEBAIC01MjcsNiArNTMwLDcg
QEAgc3RhdGljIGludCB2c2NfdHBfcHJvYmUoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkNCj4gIGVy
cl9kZXN0cm95X2xvY2s6DQo+ICAJZnJlZV9pcnEoc3BpLT5pcnEsIHRwKTsNCj4gDQo+ICsJY2Fu
Y2VsX3dvcmtfc3luYygmdHAtPmV2ZW50X3dvcmspOw0KPiAgCW11dGV4X2Rlc3Ryb3koJnRwLT5l
dmVudF9ub3RpZnlfbXV0ZXgpOw0KPiAgCW11dGV4X2Rlc3Ryb3koJnRwLT5tdXRleCk7DQo+IA0K
PiBAQCAtNTQyLDYgKzU0Niw3IEBAIHN0YXRpYyB2b2lkIHZzY190cF9yZW1vdmUoc3RydWN0IHNw
aV9kZXZpY2UgKnNwaSkNCj4gDQo+ICAJZnJlZV9pcnEoc3BpLT5pcnEsIHRwKTsNCj4gDQo+ICsJ
Y2FuY2VsX3dvcmtfc3luYygmdHAtPmV2ZW50X3dvcmspOw0KPiAgCW11dGV4X2Rlc3Ryb3koJnRw
LT5ldmVudF9ub3RpZnlfbXV0ZXgpOw0KPiAgCW11dGV4X2Rlc3Ryb3koJnRwLT5tdXRleCk7DQo+
ICB9DQo+IC0tDQo+IDIuNDkuMA0KDQo=
