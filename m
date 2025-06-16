Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310A120330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750056624; cv=fail; b=r4B2S9w0u8BX8MKauNOr9funTfwP8zay4ALsSkqwtkhCtp20e6OVEy2mvkBuwRPzNvviUzGfCfQdY/gYHENsnZaWev7VF1HYjCDJwLNqNIoh9+7mctDNFB8FsF1kytvjCFumpU2OsN/UN+kAkfcpIYBfBE59HrxWEq8917yMOAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750056624; c=relaxed/simple;
	bh=sjO2fpvt8o65DYBfTWLWwR5Rl8yvbQrxs2ExX6DTDtw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Vjl0LeR0IWTJ8w/QXyrrXxdO7qKjUwj8EWL/5Dv40LJ5cH5bTy0tZNyXbjmKWSjkWIrltu/xWsUGUCF0m723PgzmAW+mNXFXTdNFdsy0fI2UIYMSj6gsBBG9fLgaSoYxVCqZYQkYRQOalwHEN8dW1FjFmd9QunmpfUw+8k7V0Sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GpB/Mw/e; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GpB/Mw/e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750056622; x=1781592622;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sjO2fpvt8o65DYBfTWLWwR5Rl8yvbQrxs2ExX6DTDtw=;
  b=GpB/Mw/e18wcXt9aM1ChvDASvJsFDvi657XXtGoCd3MZNt9+0Sszs50m
   qBPIDRDbaLUtDRUjJ+ukvkK0KbGMONiDxD87w9d50fQK1J9mdSZyNJOzx
   FsFolgx1bRt3WiZAtiQRb5Z8965f73G6deC21EkHvZosMR//BBKKPQYWi
   KTK0sqUOzzYfPL/H47AqQF5IX34iK4z5rfJWemenceelDm5H2Ep3QJJGB
   fk0EkFk6BMf/viYYYJOBJP89DKXzQUYtNA/NTrg2L04zuWknEo9lyqHeP
   Dh5lX0SkCYgvgt/Bxt5Eg/ZjwfG+dEDdmPXePugcRdJESYsjHNilALYvp
   A==;
X-CSE-ConnectionGUID: nIHUmT7vQMe1e1QUO5hxyw==
X-CSE-MsgGUID: akYiiHatRo2ugPOqfI0yWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52333561"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="52333561"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 23:50:20 -0700
X-CSE-ConnectionGUID: i3OkoPRjT/KSM3yhqXCpPA==
X-CSE-MsgGUID: yTdAnyfQRRStbpouwYG1Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="179393534"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 23:50:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 15 Jun 2025 23:50:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 15 Jun 2025 23:50:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.63)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 15 Jun 2025 23:50:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AnW37xe++9/AuyWstaWXBYDlSk0pAQ0jYz5eEDX47ktlRjkeYRYzu3z4LFyWDm4zVyOFyaaKKXoO6odOyMyuaT8i2WtH8/hwh2iCVH5APzHqBmJ31YxLBSmkDhiFqwWvE18Pl6tkMlNuwUXsdzmAf4pkniaLVY3URX/I7Uf5jd78NaPBEZR+3KSk7j5b1jrOVZYnl6sImOK2HdSre/jVtJMTPYuTocBsQINtHak/nmBkPVviLKWOXC8kxbBnCibAU/VNe5wQIEBiETlyYrIGvaKlqzbhvXpBaumaK6081RKfH6AvIgecEYxMAaRm6DMUZtssqLTmaJ524oMoDFykXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjO2fpvt8o65DYBfTWLWwR5Rl8yvbQrxs2ExX6DTDtw=;
 b=ICRbLh660YnV4Aw3H30VcUjsnRMfuqiuuMh/0j/rFOD3UGzxy91fZssyJY1ib1HBLGhHoktgS6bBk0nr8CSxbmcSr5qft5rpRiZpXilrMQt0TZdcXaFMyy/lP7BlcN7pGETLh5BQh0J8kNJJj05SJqu/XVEFW3W0SwH51K4BY4sSVpeT+CkcwGSplUlFPvQJjj/F2c6I0bPGpoSXDx2jCkRg+1KwFBtk3AJztfWCW6jV2vljk+aqja4FcRcekfYSgS/g1JggJhJRSSGpJtTHrOHbZFcfk+ODKk3LjB3DoON0beVM+OkIWKnn9Tp8hQpHGUgnjU3beK24xIDCH7gbpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by IA4PR11MB8964.namprd11.prod.outlook.com (2603:10b6:208:56f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 06:50:18 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 06:50:18 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Dr. David Alan Gilbert" <linux@treblig.org>, "wentong.wu@intel.com"
	<wentong.wu@intel.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: Of mei suspend/resume unused irq code
Thread-Topic: Of mei suspend/resume unused irq code
Thread-Index: AQHb3kaxuv66rW2c002RFKF+Wqbr3rQFWN3Q
Date: Mon, 16 Jun 2025 06:49:58 +0000
Message-ID: <CY5PR11MB6366E9288400660CC23AA8A8ED70A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <aE9MIykCS71RFnA5@gallifrey>
In-Reply-To: <aE9MIykCS71RFnA5@gallifrey>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|IA4PR11MB8964:EE_
x-ms-office365-filtering-correlation-id: 3d68245d-2627-48f4-9e6b-08ddaca20287
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RXkrZHRUenY0UXM4TCt6RWNrUHprakFtcTJ0WVBKMzcvd09ZMTJkbUtBRDQ0?=
 =?utf-8?B?d3gweUlVS0pibWY4MzNsN2g4Nmt1ODBUMmNJME05cUtJaXFWNDVtMDEwYkdD?=
 =?utf-8?B?a20vOEpySTdQZW1lSzZ1R2psTVhRL3Z0SmxHSi9IZUFQcnhVVnc4S05EZ0NI?=
 =?utf-8?B?OUliTXRsVHR6SXNubExaVURFcUZCUDkwcVcwL2pJT1JxWVhIUGpNZlN3S2hO?=
 =?utf-8?B?Q3FETGRNaWt2U1QxUi9hUzhhMWVvc0QxNjd5YzJjTUtBREdDYUkza0grVnZw?=
 =?utf-8?B?Wm5rbDVyM0s5WVo5WFJobnFONDQzMDM0S1M3RzZsd1REWFpTaExwVGRUTTNk?=
 =?utf-8?B?OWJVUXE1RjFrNzlTbDJVdjgwTmE2TTNSa0ZET0w1Unl4L2FSM0YyNFY2RGZs?=
 =?utf-8?B?ZFY3aWkyM21HQUhGdVZ6RmUwejNKaGdvN2hZQm1VS3lJVHhtOXJkZzJFejhr?=
 =?utf-8?B?bWtxUEJtYXlhU3lyN01yeXFWa0I3L2ticnpCcmFtVU1YK1YrWTArWUZTYlhD?=
 =?utf-8?B?a1cyaS9lMVVMQXhKc3hlT0gzd2krZ3JwY1hFTWxZMmdycFlxeHFVM3ZIVEx1?=
 =?utf-8?B?V3FrOTdOMjlxSWVXSldjUTBvRFpqWWdiK1ZubERadm83d0xzMVR2ZDE0YWNn?=
 =?utf-8?B?RlVQNGM1S2NHWUZwdkRJWm1lY1RXTVZRWUpTYTRmZk51aWx0NVRiTXJzVk9M?=
 =?utf-8?B?ejg1Y3ZVb2p3WDVZK0N1ZHd6WEV4MW1BTndnZ0hjWm1qZUpuUjRmTDFRblBI?=
 =?utf-8?B?aVB0V2RnUkk4NzVTY1dkY0lES2RUZTRDbUVod2pqdWVtRWRRQkZUYktDWk5a?=
 =?utf-8?B?dnBOVWRySUdzdFNBYnN4ZjAzT2hURHF3cStUVHc1ZWp4VFJvV0FpazJ3cXhP?=
 =?utf-8?B?VlY4cXNyTU04anU0cXNNOWhQZlJrYnZ5UnhZaG4rbVNkYzBGMjZKQUZ0NzZV?=
 =?utf-8?B?cmZFQ1dOdG9SVVR4bUhtKzJyRHl3bk9DemhBWEtKQlpjMmdPaWhoNnc0ZFBU?=
 =?utf-8?B?d1JHNUN5TjkzSmZpTk1xb0ZJUzJUQWk4S0d4NCtNcXhTZDN4OHVIbEtLelVz?=
 =?utf-8?B?RktDNTE0MlBSZ3diVHFqR0tNaFN2R3ZpcmRrZG9vd1ZjNmRBTlllaStiVXky?=
 =?utf-8?B?dlpHOGFGZjFyQ1h5NWpzcEZpSk42NDgwQzAvd0pHYTdhTENxcU9Ma29LdEk1?=
 =?utf-8?B?RTRjcVI1WXQ2TlRXY2JoZ3c1TDI1WXIwZkpwQXd0dTJBYndBNHE0c2xZT1hM?=
 =?utf-8?B?WmZRZytSaS9Ia0lZU3V0QXhZMWxYaTRiR0o2NGhTQUVFbU5uSmh5cTVka09B?=
 =?utf-8?B?UnhBc0UxZktWa0RhOVZvYXh5NnpMTUwzdUg4U3oxMDNvSERWRG14dTY5WXAr?=
 =?utf-8?B?Mnl0MmxTVVQweFl3eFdvb2hZQ3N0UlJHOStoSXQrVTZiZWgwaHdIbUFjeDZV?=
 =?utf-8?B?WFl3L0NMeFdaUURWN2Z1cHFuQThaY2lyQ05ZaVRWM3dXeVFCSlFTVDBzWmx4?=
 =?utf-8?B?eGsyakVnYUVsalBOdVAyeVRQek1tNzRiYnRFdjBJQ0UzRlA4N3ZGZ3JSRUZH?=
 =?utf-8?B?WUIxYWlGSzV6TWNIUVQwaUIrRmoxMmFKaWdSVGVIMHdjSE1RVWlUWm1QaG9m?=
 =?utf-8?B?ekF5akszVHBPYjBxM1F6TTR1WlEwVXBIODFlUlBETDA4MFFxNEJYNG5wS3hu?=
 =?utf-8?B?TVRINHF1UWVpRS80dnBqVVFqTzMwTzJYNnNkQnZZOGlHMDJUWHNmeXdxaGFl?=
 =?utf-8?B?eTRESGgyNmprMzQvUVhaOXp5OThnODZkdXU0WUFqbTMwT3YwVU1wMEkwT3Za?=
 =?utf-8?B?UFh0cHhzdm9qSHRCWXdveXhpNEJNcVdZWUtoeVlISVJZK2twTi9BOEN3ZkF2?=
 =?utf-8?B?a29oZXBUbWpHRkQ1NTZYQnZZRWlCRExUVW9YNXBZTGdacGFFbVBMMjIwK3FC?=
 =?utf-8?Q?jpSm/XjrlO4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3dUQ0tzbU5OcVhYZ1d1S1h1eGxqK202K0s4Ri9yUVFlZkYxamR0b0FuaFBw?=
 =?utf-8?B?MXhaQmRaUHYwcWhINmhoN2cyS2tFNmtGSnIvUGJ4SkZVbTNxQlJvT040Ykxa?=
 =?utf-8?B?V3pQTEVsUFozdWJtemRSMlJkZ01Dald0MXhzdFdwcldmSmJ5QTZra3hDclM2?=
 =?utf-8?B?SFBGRFRKOXpadHhUZWZxbDdFVEgyZHQrWElRSEh4RUNFZklNVWhaZDlENmhJ?=
 =?utf-8?B?THRUeWJqRVV2QVF5eER3cDNUZGNTQy9uQWkzTzlFZVJNOXdYZWV3dVN5emg2?=
 =?utf-8?B?ZEJxVklMT2tSWEJoQzlod2VRaTNBZElBOHhTeGw4blAzc29QakluK0YvN29q?=
 =?utf-8?B?SjBoeTBCK2wxcVBKaitLRkZUU0VYTU1RaDVRWDRvK2hhazF0eVRhRHE4cCt6?=
 =?utf-8?B?ZkFQd3BOblRFbktLTW1JQzZBV2lGajZYdHQ3ZTg5V2ViQmpKTm9yejlEMFNy?=
 =?utf-8?B?NmhwSHA0VHNOQmNPeU5GMHM3RWNENDFjRHBhbWVoMmdpRFVwc21VdlUzeGI1?=
 =?utf-8?B?OWw1aHlhbFB4bmI4c3d6bWhFdUlqS2xSZVVVNFNxS1NMOFFlTm9QTWRFVkVn?=
 =?utf-8?B?Z0JFVjFseElFZVJtMVVFSVlOMHhZVGp3b1VtQ2hQM2hNdzhIM0Y5a29TTjNN?=
 =?utf-8?B?MlkvblpycXhySFVveTR1ZUM3L0RUeTRmWWNnOVZiSmRtWkc1Y2s0WEcvV2F5?=
 =?utf-8?B?YW1uQmwybVJ3OC9DRnhFYnEvYVlRQitVWHZ2NVFJajQwMXBJd2RlS3VJWC94?=
 =?utf-8?B?UjZPdWJxbFBuRERZVFh1WGRHZi9BSFE3cVFFNzJpVnM0dTNYZVloTXZYbVgv?=
 =?utf-8?B?cjdYSlprY1N0eUdCcURJMVNxUjNISUFMSlJCbi96ZDhGT0lySjZQQnhucCs4?=
 =?utf-8?B?YzNRTXR2UXJURVk5WVp1L2NlM0o1eGF2Y3I0Q2JnQUNuYjZnb1pvRkExNDh0?=
 =?utf-8?B?c1lBeW5ERkxGeXdoL2V4Uk5LS2VHc3BpSHQ1L3Bra0pLU0dtMHdpWEY2K0Vx?=
 =?utf-8?B?RGdyc2hUNVhsNmFZTU9FWk5PeFplaERPM2hNV1c4aVMwaFpKdktTQm9uSTJ2?=
 =?utf-8?B?V1pGODNjZGVPalgrMmxtaFZ4OFZBZ21qeGl3M0dKekZvU1ZROURwdGxCL25r?=
 =?utf-8?B?aE5BbnE0UDlYKzd6NzBrbFVDZVVSdTcrUGs0ejZQTHkwc3piZWkzS0N5eXJo?=
 =?utf-8?B?ZllqYnV4NjN5cEw2YWVmb2N4SzA3YzFjc0dEVURSRmU4eEw4VFBGdUpqZDJI?=
 =?utf-8?B?NG8rcmxUdTRxblkxTC9ZYzZ5ellvZDN6WmxFemdVSmRvWkVRT2hVbkpkMVhj?=
 =?utf-8?B?RmNiU1haZXd5alRTMXlXVlU5SHl5QWdIRUxMZHd1aDUveWpjZEk2OHpqY0dp?=
 =?utf-8?B?SmhQVUdGbllua1lNWFhYWnEzbXNsd0dyaEpTcGN6ZUVtTVpka2FCeURidkFJ?=
 =?utf-8?B?K0FmSmZSdzU0czFmeHl3bmY0U0ZTb0FuU3pWWmtPWnpUdlVhTmFtRWcrT1Jp?=
 =?utf-8?B?aDZDMm0zYW45djR6VHJ1K05uY1pMcTgrN0J1VlBnL0R2clZwYXJxcUNiQW9G?=
 =?utf-8?B?RGFGRWNrVi9pcm9FRWVpcFRSY2tEN3lXanZueEJWUWwwN1hxUlNjODdhSzd3?=
 =?utf-8?B?cHB4YU9wSG1hdjZid2JvTEd4U1k0ai9TcldlNmR3Zm5jZTAxVmJBNFRuYThU?=
 =?utf-8?B?VzFXT09uSDJTUzNLdlZKdGtwMXNMSnkyYjRCRkRHakllYkhPeVdtRjR0c2NS?=
 =?utf-8?B?S3o3ZVJVRUdqb1RodHBEVzU1dmdKOGgzNUdoY2dNeGRqaHFlam1xSHNobjZZ?=
 =?utf-8?B?RUs3NXNDSURIVXRwWFphVkxvRlB3TE5EdUVyNXMwVmY4bXpUTmpiRHhJcTIx?=
 =?utf-8?B?bmlqSVgzN1lXMTVqMW5SY0NzTmR5a3didkVMYmY1b3d4QkhtM2dTN21xTjBZ?=
 =?utf-8?B?Wmphb0xnWFptUjliallxM0pDekIwNk9DRGwzbWROcDlKd3BhVFhWVW1LOVdQ?=
 =?utf-8?B?U3k5SGlCMUM4WlprbE0rSTBGMHU0dy80TFdGNW9SZVdVbU1GQjNiRlg4aEpk?=
 =?utf-8?B?N0ZDUXlSdXdJOFJBcCtjVVZOSzJwK1hPS2wvSXRueW41VUVSblE1dzdFRHZQ?=
 =?utf-8?Q?viXGdRRI8Kkb278KHOOo97kCy?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d68245d-2627-48f4-9e6b-08ddaca20287
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 06:49:58.3333
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oAyx4HiJLeMIREdqPg7UUWlJ1BGsiKX7K9qFPd/xBwyoVFqxy2+E8AkA3CHMQx/dib+Yae1fi0+bkVoSDXRKGYONP07a4c+Z8SM9Bo/I40g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8964
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBPZiBtZWkgc3VzcGVuZC9yZXN1bWUgdW51c2VkIGlycSBjb2RlDQo+IA0KPiBI
aSwNCj4gICBNeSBzY3JpcHRzIG5vdGljZWQgdGhhdCB2c2NfdHBfcmVxdWVzdF9pcnEoKSBhbmQg
dnNjX3RwX2ZyZWVfaXJxKCkNCj4gd2VyZSB1bnVzZWQsIHNpbmNlIHlvdXI6DQo+IA0KPiBjb21t
aXQgOWI1ZTA0NTAyOWQ4ICgibWVpOiB2c2M6IERvbid0IHN0b3AvcmVzdGFydCBtZWkgZGV2aWNl
IGR1cmluZw0KPiBzeXN0ZW0gc3VzcGVuZC9yZXN1bWUiKQ0KPiANCj4gdGhleSB3ZXJlIG9ubHkg
YWRkZWQganVzdCBiZWZvcmUgdGhhdCBvbmUsIGluIHRoZSBwYXRjaCB0aGF0IGZpeGVzOw0KPiBz
byBJIHdvbmRlcmVkIHdoZXRoZXIgdGhvc2Ugc2hvdWxkIGJlIGRlbGV0ZWQgYXMgd2VsbD8NCj4g
DQo+IChJJ3ZlIGJlZW4gZG9pbmcgdW51c2VkIGZ1bmN0aW9uIGRlbGV0aW5nIC0gYnV0IGRvbid0
IG5vcm1hbGx5IGRvDQo+IHJlY2VudCBvbmVzLCBzbyB0aG91Z2h0IEknZCBhc2spLg0KDQpJdCBs
b29rcyBsaWtlIHRoZSBvdmVyc2lnaHQgd2hpbGUgcmVtb3ZpbmcgYWN0dWFsIEhXIG9wZXJhdGlv
bnMgZnJvbQ0Kc3VzcGVuZCAvcmVzdW1lIGZsb3cuDQpUaGVzZSBmdW5jdGlvbnMgY2FuIGJlIHNh
ZmVseSByZW1vdmVkLg0KDQotIC0gDQpUaGFua3MsDQpTYXNoYQ0KDQoNCj4gDQo+IERhdmUNCj4g
LS0NCj4gIC0tLS0tT3BlbiB1cCB5b3VyIGV5ZXMsIG9wZW4gdXAgeW91ciBtaW5kLCBvcGVuIHVw
IHlvdXIgY29kZSAtLS0tLS0tDQo+IC8gRHIuIERhdmlkIEFsYW4gR2lsYmVydCAgICB8ICAgICAg
IFJ1bm5pbmcgR05VL0xpbnV4ICAgICAgIHwgSGFwcHkgIFwNCj4gXCAgICAgICAgZGF2ZSBAIHRy
ZWJsaWcub3JnIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBJbiBIZXggLw0KPiAg
XCBfX19fX19fX19fX19fX19fX19fX19fX19ffF9fX19fIGh0dHA6Ly93d3cudHJlYmxpZy5vcmcg
ICB8X19fX19fXy8NCg==
