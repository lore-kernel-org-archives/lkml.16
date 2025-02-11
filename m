Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E451EF0AB;
	Tue, 11 Feb 2025 12:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739277454; cv=fail; b=ZRNN8kE2Py/h8SpciQsXk5qUHzhX6wIOHDgJWDHKGfYkB+H7g9Mgro46ZrvP49waMU/huZd+I1lW4+pAsLIt8M1SCnPc1q6g/KwXeywMC3v/Zv51YQ6L0wxL345tOKqT1GJ7Bs1b/IXJqZ42sB6L4+L1MQdPqen2M9oCe7M7ctQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739277454; c=relaxed/simple;
	bh=BtS78GTAsGuQZE6dj0RLDgNt/x2VEfcBDJi1Y/WEvJg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Gd9TQwOWcT4rRUQi9s2wSCCgJtcOAPgtH9wq717PGlgms9p3BIRDDXtF9yf/de1behmEFveR9DYcH0qSbDSN1Yff45TdeUxdk9NZQBPoW4seKwaWcjxpB/Y4rOAnrQbKD8m4hInAol46lv32BpiU+pg4O3Kd8RvssNdVr7C/eQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FjM/+c8U; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FjM/+c8U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739277452; x=1770813452;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BtS78GTAsGuQZE6dj0RLDgNt/x2VEfcBDJi1Y/WEvJg=;
  b=FjM/+c8UUwFAuEfCtCDCPUD7rguqJWikVCosN/pfz5HAb+d1hKOW3Pwi
   G6STcGBLbJBvljjqBFrgKR8dboldCe6Qmf3vBDuEie8AhWZtfACqZNWYu
   f+qDjc5ETF4cpN8BwJZt8M+uyuBTIU0u+aWNSB8/NUWdCi+RINcGKsJei
   WlCuDza+Ty8xldUghceI6kCLsO3Z5hLaeFZuhWcZi0ncSCwoYFBoLG30h
   H//HKUClSNo6SpvTWhTGJLTN5eJfrXD+1KdtLSvpi2xVj4ZllwuXxq8ra
   00OXG9rSqnkABx/Nkd0V0HhZv7Ftib91CyhBx2OJGIMGOtVlL45tuTky/
   g==;
X-CSE-ConnectionGUID: UeUEKG4sSv6/F098nIFIJA==
X-CSE-MsgGUID: BQVrsEakT2C90OR+VJnlWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="65248400"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="65248400"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 04:37:28 -0800
X-CSE-ConnectionGUID: tiUH971xQMiBIhPbIIQkFQ==
X-CSE-MsgGUID: X+x+ULRbSQ+b8W1HqkVuyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149683220"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Feb 2025 04:37:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 04:37:26 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 04:37:26 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 04:37:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gffAYj99G2OCiO8crvbcDYUhj2GNWwDPHtB6bUdA2Sv/2qaY9IA3jsbY1XVpnJRPYTUQgywPGDUrMkazWFnMES+m7mxF+MlTTqLAn+d8oMtjPWVMKPwXDXKV7Z9ilhCtMtW5jm4I2Xz8Wwj3mcmAcOBT2hWxKSOe9/bKzrMYAdhH7S7StJkcbqAocwwsatXBBn27MjmvP7J+oo4U+GLZ78RDuOapOqiEsniZXSG8taLzUh8hOn6RN+ot1NWdzV9vVENrFWnL/jaVdXWbJnqy600N9rMYQG8dZSDTQGOAtf4MivmTJUoFxX+55QE5LxyxkCA1rjZIPbCWZzaALnwyMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtS78GTAsGuQZE6dj0RLDgNt/x2VEfcBDJi1Y/WEvJg=;
 b=I4e16AN/FK6DXDKEON8XrW9eHt1H1F4GOJieTieqeJgvMdWB30FRnBgqZsjgv0WEFqWXPQB6w8A5joSUYL6vgk6yTEcBcUNQn+ifLkZz8G/95FLe87ZRqUxHiGWbSQ5aC3hJBRrUifNBC0z0of/J8Od8KoQcOFgD/fcw0bb9VgnYouDHWuS7h+aU/UgU3SKX4UseH9Mnaoq/82Fu+mIG5d2iRTXha8UHN/mt5R00xrJQo6ErXgVHrOJ0JTEBbf+a+OId9y/aTw7h9KUucLXU9EfZ4L0eSt78jB5wqrYHQwRZvP0i6V+jn3+YYsKF4yuhwDNFTUWk1RXNHxLXMUja6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6532.namprd11.prod.outlook.com (2603:10b6:208:38f::9)
 by SN7PR11MB6775.namprd11.prod.outlook.com (2603:10b6:806:264::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 12:37:23 +0000
Received: from BL3PR11MB6532.namprd11.prod.outlook.com
 ([fe80::2458:53b4:e821:c92f]) by BL3PR11MB6532.namprd11.prod.outlook.com
 ([fe80::2458:53b4:e821:c92f%4]) with mapi id 15.20.8445.008; Tue, 11 Feb 2025
 12:37:23 +0000
From: "Rabara, Niravkumar L" <niravkumar.l.rabara@intel.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: lkp <lkp@intel.com>
Subject: RE: [PATCH] ARM: dts: socfpga: remove syscon compatible string for
 sysmgr node
Thread-Topic: [PATCH] ARM: dts: socfpga: remove syscon compatible string for
 sysmgr node
Thread-Index: AQHbaPbzWg4D8Cm6jECFhWM3cdrsNbNBRJcAgAAbKACAAC9xkIAAFdcAgAB7G1CAAA3cgIAAASIg
Date: Tue, 11 Feb 2025 12:37:23 +0000
Message-ID: <BL3PR11MB6532473C345BF326F55A4CF9A2FD2@BL3PR11MB6532.namprd11.prod.outlook.com>
References: <20250117154244.4079614-1-niravkumar.l.rabara@intel.com>
 <45276881-11de-47c9-aa9c-488df537a596@kernel.org>
 <d78ae428-6139-426b-bde9-e3ce5a4008ac@kernel.org>
 <BL3PR11MB65325F279FEA579D19EFCF7AA2FD2@BL3PR11MB6532.namprd11.prod.outlook.com>
 <32563a12-eba0-44b4-ad53-e69c6a4962cb@kernel.org>
 <BL3PR11MB6532F03C63BABEC1DCE50964A2FD2@BL3PR11MB6532.namprd11.prod.outlook.com>
 <9b4e50cd-abab-4f3c-8450-d721bac5db17@kernel.org>
In-Reply-To: <9b4e50cd-abab-4f3c-8450-d721bac5db17@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6532:EE_|SN7PR11MB6775:EE_
x-ms-office365-filtering-correlation-id: 39f4dd5c-1ddd-4296-c270-08dd4a98d560
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Q2NxVm5tWXR3YVUzSlpUM2NiSm0rRnpiVUNiWlFtSk5rWllVMjdIUnZFd3Nx?=
 =?utf-8?B?RW1CYUcwQjB4a1l3dHVhNnZRSzYrWE9sMExwdFB5enlnVEU4UllvOS9Iamsz?=
 =?utf-8?B?aDd5a3BJZmNhOUx1d3N4OUk0dDZxdkxqK2d2VVNlZkxHZ2xYMjVPWUpia0Zx?=
 =?utf-8?B?VEt5Tm5kOER1dDYvZEV4aDg5QUhWZFQ3R1NCMEx0ZVJYL1ZrZWpwRnNDbm5t?=
 =?utf-8?B?bGUrNGoxNjBEcnBIbndlWEJiczhPbjhRWWFyY0lvcUgzV3FvenJpSjFtVStW?=
 =?utf-8?B?R1VnM0FZWHZaVklGd1lXa2pJbUFFVVpPUXZmNGFRNTZZN0JvbWVhN2ZuY2Jx?=
 =?utf-8?B?Z003ak96dXZmYkh6VUdmU2RnQmF2R3NwSTNuWk14MTlLRVNSZWpaU2hOM2d0?=
 =?utf-8?B?N3RlRVFNTzE3MW9MRHhtUXluVFVXcTZLSmZTYlEvdlhRamdmVzZoNlJhOVp4?=
 =?utf-8?B?bkZ4M3ArbWJwODBiYUxYeFJSZXdlVWtWd1MxeG9sK3kwY1dBYXJWVnJCU29Y?=
 =?utf-8?B?NDBPem9Kd1VXcHJmcTVQYUlQQXhtdkJqRy80VzdLajdvanNabzhSN2JNbXdU?=
 =?utf-8?B?Qkx4OThLUXNGR29oU3grUytNbWFPQTVqeDc5bWpUTDdRNDlzbHVnWlM1cEFx?=
 =?utf-8?B?SXdjK3pBVXYzMUNFaUxXdUZ2K0M2dytnNGJLVlpsQnlTcHBibGNQdldsQXJW?=
 =?utf-8?B?Ti8zQjZIYzd6UG5FeHhhd3A0RGtFS04xVzBVTVBTV24rRENCV2NSdk9jTGlT?=
 =?utf-8?B?YzA0UXNRcTFtZCtTUGZLSW9WbEtzMnNrTDQzZzlURkNaNktxaHF0Nm1BYmRZ?=
 =?utf-8?B?b3pmVGk1b1VIbkdySDJucDMyMGwvNFI0ekFMa3hyNytOc3hUSjdaRzJKZ3Zo?=
 =?utf-8?B?MXh0enNRYStiVFdFVmtPbjN6NTNrb3duZGpyQWdJRXRTSHBJYnRjRDhSUDV2?=
 =?utf-8?B?Tnh2ZkVtdFlMcXRZdlEwWS83U1RZR1pYVmpxQkZJN0JPYXpMbVJKaXlKejR2?=
 =?utf-8?B?QitQcFhoOVlKQUFzQzFzcmxmSjBDd0tkSlRRdlc1WnY1TGdqRXZUNXRQMjFz?=
 =?utf-8?B?RmQ0eE9vNVMzdTltTXA4Z0MrRFJNR1ZHVHRjT2ppU0FEQ2FpRHB5VENZdjBG?=
 =?utf-8?B?UjZLT1BndnJ0NkRFNUQ1MTNNcTkwNGN0US9mL0MvSXFCZEJTcUh5TVA1QnM1?=
 =?utf-8?B?V3hJbGpaUmFVSDVENm1kRDM3ZDR3QzhPang0Q2dVQ2s1V2VFaUltaTFobEVZ?=
 =?utf-8?B?UkRESHUzWlhSb253N1o4TUF5OFJnbXQvRWh2ZXFrTncxQ2VHR1EzazhlQm9a?=
 =?utf-8?B?OHUrY3EyTDZwQTVtMjAySGd2VTkySW1qdlVhQWttMFRZWVhBQUs1VTIyWHdG?=
 =?utf-8?B?NzN5RURqaStqbTIxZyttZC9JdVRrclVpZmpaYU5SeGlYMDNzS3dlRDV0M0JN?=
 =?utf-8?B?N0djSlpTbkZZekh2dURXc3M2UmZBdnpTdTdnZTBSb2FqTVVMSERuT01Ib0NO?=
 =?utf-8?B?VFNLMUdTZG5PekVDM3M3eXFkZmllZi9YWHQ3WGI2WWw2aFZBUUJ2NXFJSUUv?=
 =?utf-8?B?UWYrVHpvV0lkVGtaL2ZPUGRZeUN2Mzg3azkwWGtHck51SU5kdTR1c2Uvei9h?=
 =?utf-8?B?MXE0VlUvQkNTbHVxZGFONjJBY3JLbnlVVTJVakxKdlZsaWhiWEJPdFFIL2k4?=
 =?utf-8?B?OVZaSW82UEx5OG83MVdwUVFuckhHZlJlMVNoMkd4OWhlQVF3WCtQREN6Z0pY?=
 =?utf-8?B?cDVEYTdRUExqU1phZi9mRmFmMy9EaFhWOHZGWGw5a255KzRRMEQrWlc1NWdw?=
 =?utf-8?B?MEFGeUFVQ3MzNTloMEVKQ3NlaXdBYmtyM0JtMlM4SStld1BwdmlqU0lkd1o5?=
 =?utf-8?B?VGJXdUt4MklPNVF1ay9JeTNlOEFsQ0JSdEFrSDhMem5xdVNxZ2JDSk8yaW95?=
 =?utf-8?Q?w7xuT/s+offkKX6ZSK3V2TJYtYy+YdCC?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB6532.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TklVY1VhQVhPQWQvUGRlRXI2NnZvWk5uTWtTUWQ4ZkRRYkZDSXdzMzJuR2hp?=
 =?utf-8?B?QVhzVVpJeFFZT3p4M2hwZDQzemlQZ3BYSFIydVJRbitwTjhWNGd6bGtiSFMy?=
 =?utf-8?B?U2s3YzVIbDZKT3RUYWNPbjFUWmQ2Yk1nTlpQd0FaeW9FR2Z6NXVIQ1NSbDdy?=
 =?utf-8?B?Ni9rUmJZZHB4WkJManF4NEJQSmI0d1NxNUc3RVc5Zkk3d2FKbVBSajNHSEN5?=
 =?utf-8?B?YnFUWDBhbUtFT25HNld1VGlLYzBaL3dscENKb1BhOFEwRjlYTHM4THNqekI5?=
 =?utf-8?B?OU1OOUYvRzdESU1vMEwrZnR3UXFVTzBMaytuVjhJZDE4ZVo4Q2tMbERDWjN5?=
 =?utf-8?B?YXZpNitqSURGdmM0SWNJTnZYbWtwOXhITXVoNXBvL0hQeUl3ZG1oODRyaVB1?=
 =?utf-8?B?WmRaUi9SOEh1cEtjeXl1b1NHTEMwWnVQT2pKNSt2REcvRnRmKzJER3RjUkN1?=
 =?utf-8?B?eDduL0paUnRBdFRyVndVVmppaXBDTjRUWUJld2pPaHdxUmFSYTZWeTM1M0ZO?=
 =?utf-8?B?Y2xWRFV2N1Z2d2g2K09wblF2bDNxZWsxNzhUc3JrT2lzcUU0MjN5ZnNUSTVo?=
 =?utf-8?B?VXFHNW9FbHdYbDhNTFl0TThiRkRmL2wwYXZhb2N1Zm5mNzhkb2tBekFmTU1R?=
 =?utf-8?B?VFl6REwzS0xXdFF3dkVNOFFiSk9BQXd1Z2dMUU9XaW1uY0tPZEhhdmE4TW9a?=
 =?utf-8?B?VlM1UjRSSkJaaHN3elNkTlUwZGN0Ykd4YXpHMDkzTzB5YngydW0rWmtwSDM3?=
 =?utf-8?B?M0xCd0hzU09sRTliRG1WMmw4S0ZUY21YUDA4MmNqOCs2YmxXd1ZlUVNJbGRn?=
 =?utf-8?B?aUpmQmhIc2F6cFQvRm94UndHZlErbng2Z2p1dm5Fb2hmUEZXZ0N5Uzk4K0oz?=
 =?utf-8?B?cmhZdmg2ODJHOS83bEhoVlZFZnZvL0xsL2ZwUjVxQnN6TktYcjZZMndZU3Rn?=
 =?utf-8?B?YVpJVG1sVEo3UlpmVWdtMnNOMVVNSU9sS1Z3SmRNWVlyU0xESWYxZlROY0V3?=
 =?utf-8?B?WTA3aCtUdjh6b0dZVTVYaTBkLzhYbk5PMzBuU1pDUkxOSS8yT0hWMmVLSDdp?=
 =?utf-8?B?dVF1UXduUU56aVp3RjM4U0NicFI4K25KSFpNTzlmYmI2R3hnbUxkYllwNzQ0?=
 =?utf-8?B?b2cvZndLMFJsWTU5M3VBQkw5clU0K1FJOHNQRklVZGdIcnE0Q2xybHgxVmcv?=
 =?utf-8?B?U1hlaUVNWXA2dVpnb0NoY2RKMXBCcnEzMVhsVVJNZCtjamZwUnpBZWtQTk10?=
 =?utf-8?B?a2NUK3BZREZmVlpnVmtqQnI0MGJET3FObzI2VFZ5Z1dHdDN2WG5Nb2JRVVBv?=
 =?utf-8?B?UkpQdVhYdHhsVEwxUW1oOU1QSXJOeEFZODBhcTA0MHVVRDVYNDMxcXllTDFZ?=
 =?utf-8?B?ckFnZ0ZpVkh2OEtjRThabC90UkRiNGU3bFRyQ2hLdWgxN3pIMUJrVUhtRER4?=
 =?utf-8?B?L1hmVHJlZ2YyMlhuTXZjcUxRK203ZmtvSVNiQzhEaURJZ2FYVEhDWGw3S3hu?=
 =?utf-8?B?Z2lzRjU5ZnRhQ25qZ0NpVzlacmhra1dQcy9MNmN4L1Z2RVRRMk1lRlB5QU5I?=
 =?utf-8?B?eXlZamFDQmt4Vk1HWUxrM0E1QUQ5MDBYVlMzMGloQW1Fc0dHU08wamwvMmFx?=
 =?utf-8?B?UTlpcjBQM05EaHNyYVRsMmJGdEtuZCtLcUJybGtVMm9SNmhSZk1kbTVlMWRv?=
 =?utf-8?B?YzVla3Q4UitiNXBIck9ZNVBobmRhZVJpRnNndU8xS1dzd0UvT2dYS3AzcTM5?=
 =?utf-8?B?Rk9yOVVyYjR2cHovSEJxL0FhN29zaUpJSW1vdkNLRkcrL0RtLzlZRkRWSFRk?=
 =?utf-8?B?TEt5dHo5TU9wSWhSaVllalB2VzltT3piL3hkYjhSWnVKUGxhTVFIektGL0ll?=
 =?utf-8?B?SWZzVWN1Q3RLdUJmVEFpSnl3N0tnMTZBenNXQkg4NFJjODRJUnJlZExrbllp?=
 =?utf-8?B?c0k2M1l4dTc2L0Z3Qjh1aitjNC9rZ0FyaUZEekorUzFjcGhsMnBXV2IvcFRs?=
 =?utf-8?B?bzNKNDdOVCtUbWNWNHMrYlB0ZlZwUHhvVFBzZGdVd0tzamYva3RsVVNTT0dw?=
 =?utf-8?B?c3RrNUZzdWkzK3dSTTUwS1cySEd1TG83cklIY2ovMjF6Ull2K0Y1R1JWUXlp?=
 =?utf-8?B?eWpYRFhoZHJKaVZCNzhnekZRbENlSTErNy9NSTREZEx4bXR2QmpOeVlPVDl1?=
 =?utf-8?B?bU1EN1NQVVBnaVp4WWluL3UrQUlOalhLV2dTbGVzOUJTNHhNZ3gxT1l5Lzlz?=
 =?utf-8?B?OE1XZWNtT09vcXF4QUwzbHQwQ0ZnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6532.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f4dd5c-1ddd-4296-c270-08dd4a98d560
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 12:37:23.1770
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ATUwdZBIi/wMdJmQxR87+MsS9j8rN/sOjDfmc1rlT+nsa/xYhe7KMcpJGk3ZHLVxSmb7+7yQN2apnIsMdvoMldS9V0sekedtKj2iVSNF874=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6775
X-OriginatorOrg: intel.com

SGkgRGluaCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEaW5oIE5n
dXllbiA8ZGluZ3V5ZW5Aa2VybmVsLm9yZz4NCj4gU2VudDogVHVlc2RheSwgMTEgRmVicnVhcnks
IDIwMjUgODoyNSBQTQ0KPiBUbzogUmFiYXJhLCBOaXJhdmt1bWFyIEwgPG5pcmF2a3VtYXIubC5y
YWJhcmFAaW50ZWwuY29tPjsgUm9iIEhlcnJpbmcNCj4gPHJvYmhAa2VybmVsLm9yZz47IEtyenlz
enRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9yIERvb2xleQ0KPiA8Y29u
b3IrZHRAa2VybmVsLm9yZz47IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4g
a2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBDYzogbGtwIDxsa3BAaW50ZWwuY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIXSBBUk06IGR0czogc29jZnBnYTogcmVtb3ZlIHN5c2NvbiBjb21wYXRp
YmxlIHN0cmluZyBmb3INCj4gc3lzbWdyIG5vZGUNCj4gDQo+IE9uIDIvMTEvMjUgMDY6MTgsIFJh
YmFyYSwgTmlyYXZrdW1hciBMIHdyb3RlOg0KPiA+IEhpIERpbmgsDQo+ID4NCj4gPj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogRGluaCBOZ3V5ZW4gPGRpbmd1eWVuQGtl
cm5lbC5vcmc+DQo+ID4+IFNlbnQ6IFR1ZXNkYXksIDExIEZlYnJ1YXJ5LCAyMDI1IDEyOjE1IFBN
DQo+ID4+IFRvOiBSYWJhcmEsIE5pcmF2a3VtYXIgTCA8bmlyYXZrdW1hci5sLnJhYmFyYUBpbnRl
bC5jb20+OyBSb2IgSGVycmluZw0KPiA+PiA8cm9iaEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPjsgQ29ub3INCj4gPj4gRG9vbGV5IDxjb25vcitk
dEBrZXJuZWwub3JnPjsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiA+PiBr
ZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+ID4+IENjOiBsa3AgPGxrcEBpbnRlbC5jb20+DQo+ID4+
IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIEFSTTogZHRzOiBzb2NmcGdhOiByZW1vdmUgc3lzY29uIGNv
bXBhdGlibGUNCj4gPj4gc3RyaW5nIGZvciBzeXNtZ3Igbm9kZQ0KPiA+Pg0KPiA+Pj4gWWVzLCBJ
IGhhdmUgdGVzdGVkIHRoaXMgdXNpbmcgTkZTIGJvb3QsIGhvd2V2ZXIgSSBkaWRuJ3Qgb2JzZXJ2
ZSBhbnkNCj4gPj4+IGlzc3VlIHdpdGggU0QvTU1DIGRyaXZlci4NCj4gPj4+DQo+ID4+PiA9PiBm
ZHQgcHJpbnQgL3NvYy9tbWNAZmY4MDgwMDANCj4gPj4+IG1tY0BmZjgwODAwMCB7DQo+ID4+PiAJ
I2FkZHJlc3MtY2VsbHMgPSA8MHgwMDAwMDAwMT47DQo+ID4+PiAJI3NpemUtY2VsbHMgPSA8MHgw
MDAwMDAwMD47DQo+ID4+PiAJY29tcGF0aWJsZSA9ICJhbHRyLHNvY2ZwZ2EtZHctbXNoYyI7DQo+
ID4+PiAJcmVnID0gPDB4ZmY4MDgwMDAgMHgwMDAwMTAwMD47DQo+ID4+PiAJaW50ZXJydXB0cyA9
IDwweDAwMDAwMDAwIDB4MDAwMDAwNjIgMHgwMDAwMDAwND47DQo+ID4+PiAJZmlmby1kZXB0aCA9
IDwweDAwMDAwNDAwPjsNCj4gPj4+IAljbG9ja3MgPSA8MHgwMDAwMDAxYSAweDAwMDAwMDI0PjsN
Cj4gPj4+IAljbG9jay1uYW1lcyA9ICJiaXUiLCAiY2l1IjsNCj4gPj4+IAlyZXNldHMgPSA8MHgw
MDAwMDAwNiAweDAwMDAwMDI3PjsNCj4gPj4+IAlhbHRyLHN5c21nci1zeXNjb24gPSA8MHgwMDAw
MDAxYyAweDAwMDAwMDI4IDB4MDAwMDAwMDQ+Ow0KPiA+Pj4gCXN0YXR1cyA9ICJva2F5IjsNCj4g
Pj4+IAljYXAtc2QtaGlnaHNwZWVkOw0KPiA+Pj4gCWNhcC1tbWMtaGlnaHNwZWVkOw0KPiA+Pj4g
CWJyb2tlbi1jZDsNCj4gPj4+IAlidXMtd2lkdGggPSA8MHgwMDAwMDAwND47DQo+ID4+PiAJY2xr
LXBoYXNlLXNkLWhzID0gPDB4MDAwMDAwMDAgMHgwMDAwMDA4Nz47DQo+ID4+PiAJcGhhbmRsZSA9
IDwweDAwMDAwMDI5PjsNCj4gPj4+IH07DQo+ID4+PiA9PiBmZHQgcHJpbnQgL3NvYy9zeXNtZ3JA
ZmZkMDYwMDANCj4gPj4+IHN5c21nckBmZmQwNjAwMCB7DQo+ID4+PiAJY29tcGF0aWJsZSA9ICJh
bHRyLHN5cy1tZ3IiOw0KPiA+Pj4gCXJlZyA9IDwweGZmZDA2MDAwIDB4MDAwMDAzMDA+Ow0KPiA+
Pj4gCWNwdTEtc3RhcnQtYWRkciA9IDwweGZmZDA2MjMwPjsNCj4gPj4+IAlwaGFuZGxlID0gPDB4
MDAwMDAwMWM+Ow0KPiA+Pj4gfTsNCj4gPj4+DQo+ID4+PiBbICAgIDEuMDk1Nzg0XSBtbWNfaG9z
dCBtbWMwOiBCdXMgc3BlZWQgKHNsb3QgMCkgPSA1MDAwMDAwMEh6IChzbG90IHJlcQ0KPiA+PiA1
MDAwMDAwMEh6LCBhY3R1YWwgNTAwMDAwMDBIWiBkaXYgPSAwKQ0KPiA+Pj4gWyAgICAxLjEwNTY5
Ml0gbW1jMDogbmV3IGhpZ2ggc3BlZWQgU0RIQyBjYXJkIGF0IGFkZHJlc3MgMDAwMQ0KPiA+Pj4g
WyAgICAxLjEwODIzOF0gYXQyNCAwLTAwNTE6IHN1cHBseSB2Y2Mgbm90IGZvdW5kLCB1c2luZyBk
dW1teSByZWd1bGF0b3INCj4gPj4+IFsgICAgMS4xMTE4MTddIG1tY2JsazA6IG1tYzA6MDAwMSBT
RDMyRyAyOS4xIEdpQg0KPiA+Pj4gWyAgICAxLjExODg3Ml0gYXQyNCAwLTAwNTE6IDQwOTYgYnl0
ZSAyNGMzMiBFRVBST00sIHdyaXRhYmxlLCAzMg0KPiA+PiBieXRlcy93cml0ZQ0KPiA+Pj4gWyAg
ICAxLjEyOTE4Nl0gIG1tY2JsazA6IHAxIHAyIHAzDQo+ID4+Pg0KPiA+Pj4gLg0KPiA+Pj4NCj4g
Pj4+IHJvb3RAYXJyaWExMDp+IyBscyAvZGV2L21tY2JsazAqDQo+ID4+PiAvZGV2L21tY2JsazAg
ICAgL2Rldi9tbWNibGswcDEgIC9kZXYvbW1jYmxrMHAyICAvZGV2L21tY2JsazBwMw0KPiA+Pj4g
cm9vdEBhcnJpYTEwOn4jIG1vdW50IC9kZXYvbW1jYmxrMHAxIC90bXAvIHJvb3RAYXJyaWExMDp+
IyBscyAvdG1wLw0KPiA+Pj4gZXh0bGludXggICAgICAgICAgICAgICAgICAgICAgICAgc29jZnBn
YV9hcnJpYTEwX3NvY2RrX3NkbW1jLmR0YiAgekltYWdlDQo+ID4+PiBmaXRfc3BsX2ZwZ2EuaXRi
ICAgICAgICAgICAgICAgICB1LWJvb3QuaW1nDQo+ID4+Pg0KPiA+Pj4NCj4gPj4NCj4gPj4gWW91
IGRpZG4ndCByZWFsbHkgdGVzdCBhbnl0aGluZy4gVGhlcmUncyBhIHJlZ2lzdGVyIGluIHRoZSBT
eXN0ZW0NCj4gPj4gTWFuYWdlciB0aGF0IGhhcyBzZXQgdGhlIFNEL01NQyBjbGstcGhhc2UgaW4g
VS1Cb290LiBTbyB5b3Ugd29uJ3Qgc2VlDQo+ID4+IHRoZSBmYWlsdXJlIHVubGVzcyB5b3UgZXhw
bGljaXRseSBjaGFuZ2UgdGhlIHZhbHVlIGluIHRoYXQgcmVnaXN0ZXINCj4gPj4gYW5kIHRoZW4g
Ym9vdCBMaW51eCwgdGhlbiB5b3Ugd2lsbCBzZWUgdGhlIGZhaWx1cmUuIElmIHlvdSBsb29rIGF0
DQo+ID4+IGRyaXZlcnMvbW1jL2hvc3QvZHdfbW1jLXBsdGZtLmMgYW5kIGxvb2sgYXQgdGhlIGZ1
bmN0aW9uDQo+ID4+IGR3X21jaV9zb2NmcGdhX3ByaXZfaW5pdCgpLCB5b3UgY2FuIHNlZSB0aGF0
IHdvcmsgaW4gYWN0aW9uLiBJZiB5b3UgcmVtb3ZlDQo+IHRoZSBzeXNjb24gcHJvcGVydHksIHRo
ZW4gdGhhdCBwb3J0aW9uIG9mIHRoZSBkcml2ZXIgd2lsbCBmYWlsLg0KPiA+PiBBbHNvIHRoZSBl
dGhlcm5ldCBkcml2ZXIgaXMgdXNpbmcgdGhlIHN5c3RlbSBtYW5hZ2VyJ3MgdG8gc2V0IHRoZQ0K
PiA+PiBjb3JyZWN0IFBIWSBtb2RlIHRocm91Z2ggc3lzY29uLiBJIHRoaW5rIHlvdSBuZWVkIHRv
IHRlc3QgdGhpcyBwYXRjaCBtb3JlDQo+IHRob3JvdWdobHkuDQo+ID4+DQo+ID4+IERJbmgNCj4g
Pg0KPiA+IEFsdGVyYSBTeXN0ZW0gTWFuYWdlciBkcml2ZXIgKGRyaXZlcnMvbWZkL2FsdGVyYS1z
eXNtZ3IuYykgaXMgZW5hYmxlZA0KPiA+IGluICJzb2NmcGdhX2RlZmNvbmZpZyIgLSBpLmUuIENP
TkZJR19NRkRfQUxURVJBX1NZU01HUj15DQo+ID4NCj4gPiBTbywgU29DRlBHQSBhbHdheXMgdXNp
bmcgZHJpdmVycy9tZmQvYWx0ZXJhLXN5c21nci5jIGZvciBTeXN0ZW0NCj4gPiBNYW5hZ2VyIHJl
Z2lzdGVyIGFjY2Vzcywgbm90IHRoZSBnZW5lcmljICJzeXNjb24iIGRyaXZlcnMvbWZkL3N5c2Nv
bi5jLg0KPiA+IFRoYXQncyB3aHkgd2UgZG8gbm90IG5lZWQgInN5c2NvbiIgY29tcGF0aWJsZSBm
b3IgZmFsbCBiYWNrIG1lY2hhbmlzbS4NCj4gPg0KPiA+IAlzeXNtZ3I6IHN5c21nckBmZmQwODAw
MCB7DQo+ID4gLQkJY29tcGF0aWJsZSA9ICJhbHRyLHN5cy1tZ3IiLCAic3lzY29uIjsNCj4gPiAr
CQljb21wYXRpYmxlID0gImFsdHIsc3lzLW1nciI7DQo+ID4gICAJCXJlZyA9IDwweGZmZDA4MDAw
IDB4NDAwMD47DQo+ID4gICAJfTsNCj4gPiAJbW1jOiBtbWNAZmY4MDgwMDAgew0KPiA+IAkJ4oCm
DQo+ID4gCQlhbHRyLHN5c21nci1zeXNjb24gPSA8JnN5c21nciAweDI4IDQ+Ow0KPiA+IAkJY2xr
LXBoYXNlLXNkLWhzID0gPDA+LCA8MTM1PjsNCj4gPiAJCeKApg0KPiA+IAl9Ow0KPiA+IAlnbWFj
MDogZXRoZXJuZXRAZmY4MDAwMDAgew0KPiA+IAkJ4oCmDQo+ID4gCQlhbHRyLHN5c21nci1zeXNj
b24gPSA8JnN5c21nciAweDQ0IDA+Ow0KPiA+IAkJ4oCmDQo+ID4gCX07DQo+ID4NCj4gPg0KPiA+
IEV2ZW4gdGhlIHNkbW1jIGRyaXZlciB5b3UgbWVudGlvbmVkIGlzIHVzaW5nICJkcml2ZXJzL21m
ZC9hbHRlcmEtc3lzbWdyLmMiDQo+ID4gbm90IHRoZSBnZW5lcmljICJzeXNjb24iIGRyaXZlcnMv
bWZkL3N5c2Nvbi5jLiBTYW1lIHRoaW5nIGZvciBldGhlcm5ldA0KPiA+IGRyaXZlciBhcyB3ZWxs
Lg0KPiA+DQo+ID4gZHdfbWNpX3NvY2ZwZ2FfcHJpdl9pbml0KCkgIHsNCj4gPiAJLi4uDQo+ID4g
CXJjID0gb2ZfcHJvcGVydHlfcmVhZF92YXJpYWJsZV91MzJfYXJyYXkobnAsICJjbGstcGhhc2Ut
c2QtaHMiLA0KPiAmY2xrX3BoYXNlWzBdLCAyLCAwKTsNCj4gPiAJaWYgKHJjIDwgMCkNCj4gPiAJ
CXJldHVybiAwOw0KPiA+DQo+ID4gCXN5c19tZ3JfYmFzZV9hZGRyID0gYWx0cl9zeXNtZ3JfcmVn
bWFwX2xvb2t1cF9ieV9waGFuZGxlKG5wLA0KPiAiYWx0cixzeXNtZ3Itc3lzY29uIik7DQo+ID4g
CWlmIChJU19FUlIoc3lzX21ncl9iYXNlX2FkZHIpKSB7DQo+ID4gCQlkZXZfd2Fybihob3N0LT5k
ZXYsICJjbGstcGhhc2Utc2QtaHMgd2FzIHNwZWNpZmllZCwgYnV0IGZhaWxlZA0KPiB0byBmaW5k
IGFsdHIsc3lzLW1nciByZWdtYXAhXG4iKTsNCj4gPiAJCXJldHVybiAwOw0KPiA+IAl9DQo+ID4N
Cj4gPiAJb2ZfcHJvcGVydHlfcmVhZF91MzJfaW5kZXgobnAsICJhbHRyLHN5c21nci1zeXNjb24i
LCAxLCAmcmVnX29mZnNldCk7DQo+ID4gCW9mX3Byb3BlcnR5X3JlYWRfdTMyX2luZGV4KG5wLCAi
YWx0cixzeXNtZ3Itc3lzY29uIiwgMiwgJnJlZ19zaGlmdCk7DQo+ID4gCS4uLg0KPiA+IH0NCj4g
Pg0KPiA+IFBsZWFzZSBsZXQgbWUga25vdyBpZiBteSB1bmRlcnN0YW5kaW5nIGlzIGluY29ycmVj
dC4NCj4gPg0KPiANCj4gQnV0IHRoZSBhbHRlcmEtc3lzbWdyIGRyaXZlciBpcyB1c2luZyBzeXNj
b24gYXMgdGhlIGludGVyZmFjZToNCj4gDQo+IGNvbmZpZyBNRkRfQUxURVJBX1NZU01HUg0KPiAg
ICAgICAgICBib29sICJBbHRlcmEgU09DRlBHQSBTeXN0ZW0gTWFuYWdlciINCj4gICAgICAgICAg
ZGVwZW5kcyBvbiBBUkNIX0lOVEVMX1NPQ0ZQR0EgJiYgT0YNCj4gICAgICAgICAgc2VsZWN0IE1G
RF9TWVNDT04NCj4gDQo+IENhbiB5b3UgbG9vayBhdCB5b3VyIGJvb3Rsb2cgYW5kIHNlZSBpZiB5
b3Ugc2VlIHRoaXMgbWVzc2FnZSAiImNsay1waGFzZS1zZC1ocw0KPiB3YXMgc3BlY2lmaWVkLCBi
dXQgZmFpbGVkIHRvIGZpbmQgYWx0cixzeXMtbWdyIHJlZ21hcCEiPw0KPiANCg0KTm8sIEkgZG8g
bm90IHNlZSB0aGlzIGVycm9yL3dhcm5pbmcgaW4gYm9vdCBsb2cuIA0KIiBjbGstcGhhc2Utc2Qt
aHMgd2FzIHNwZWNpZmllZCwgYnV0IGZhaWxlZCB0byBmaW5kIGFsdHIsc3lzLW1nciByZWdtYXAh
IiANCg0KQWxzbyBJIGRpZCB0ZXN0IGJ5IG1hbnVhbGx5IGNoYW5naW5nIHRoZSBjbG9jayBwaGFz
ZSByZWdpc3RlciB2YWx1ZSBpbiB1LWJvb3QsDQphbmQgdGhlbiBib290IExpbnV4IHdpdGhvdXQg
InN5c2NvbiIgY29tcGF0aWJsZSwgYW5kIEkgZG8gbm90IHNlZSBhbnkgZXJyb3Igb3IgDQp3YXJu
aW5nIGFuZCBzZG1tYyBhbmQgZXRoZXJuZXQgZHJpdmVycyBhcmUgd29ya2luZyBmaW5lLiAgDQoN
Cj0+IG1kLmwgMHhmZmQwNjAyOCAxDQpmZmQwNjAyODogMDAwMDAwMDMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC4uLi4NCj0+IG13LmwgMHhmZmQwNjAyOCAweDAgDQoNClRoYW5rcywNCk5p
cmF2DQo=
