Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9D242065
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750748481; cv=fail; b=A6U4V3JFF4d6QbyzMAIMKfAaH7L3BaTkp1RErUyIHnOEbYdckRMdMcfekaTqmoo11EXp76NjsD4KsJzcRELNurh4MA+sQ6LglGbvZYtXMFBqVDKFB4IZl2kS0P9W5B8kVnOS5Lll3J1gYwMCLTQV1sd/ZAutsTkytarZFuShaYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750748481; c=relaxed/simple;
	bh=739iXV3xzuk8ZBjHREtGp+OnjMMIYC5G/9LEiNYWtaU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WmcA5PHg29Ch3QhnykYwuRFpH81CJn42Pd4+ZAHoseC0toPEjOyVHotD17XZQzh9j9WmsHOLIcO3OebHAuz0bqdAbSQSq3qu7hCHB13/uDfCrc+xUBWa4V59uoAjwjweN2jbuq6qu3nr9k91dvQNpDtVvhpH4euYVCPOTEYxC2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yi73JRpO; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yi73JRpO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750748479; x=1782284479;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=739iXV3xzuk8ZBjHREtGp+OnjMMIYC5G/9LEiNYWtaU=;
  b=Yi73JRpOWoHIXKisf6ITNvgOzqv9xzlzE3ojOQAEJLf0PjayiEEZqTa2
   8Zzs9F+wufoktxAC6P00EOfZzU1XBPcR2DGopMNyoGj/5zd8F/DjJ8gOg
   eY4LgtPto02dld1igPABw9A/MnIvSQ1L10yiqjHewb6PECvzTzjVWB+Uc
   fwzTYyWRG2AhWQaiRRxv1yWbfef0ydcQk3JKkL4sjVsqeMF6TkQlaneLH
   I0XCK86WpwWRKDQpYLtB3tYT8Fy7deKWr6BDngLZrXxr5GV0U/qfNp+7B
   QE7lKaR/0PLdx0111F/1ouWT86WIrQgCCeVHw6CUZrsJfl1Ffv5x5Zy8F
   A==;
X-CSE-ConnectionGUID: 4RfUjCJVS/2WR6c9TCXkjA==
X-CSE-MsgGUID: NV3MRvAhRl+j5QW5YUEscQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52094224"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="52094224"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 00:01:18 -0700
X-CSE-ConnectionGUID: enj/tQqMT8uwM7EqNvmvqg==
X-CSE-MsgGUID: 9mhxAVmHTM6ylXKxEercVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="155844136"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 00:01:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 00:01:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 00:01:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 00:01:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hj2T7auy3MYXzlvAL8cbXMp8NaCvZxCWpWqffoFt7W8765T3xSjYl70+BnWP+QXM5EF2SVWiQCSxKc7QWu7NjMbEVj6u6deW5YxyXG3scUGa+KXSgPyl2hsp0+L3rTzjpSePCju8/U7Iyk+yEWCMKJup9EOXrSbujFg6gX2aBysYDAMP/owlf/4FGm6MHw+SHPfxJIbuaoCc8q3Jb9n56jVqNa0b1hfD/k7/MLLNh8JW8tRY3kkWPLwnGWQS8/afiHmnZcfhgAu3dCXinP7zOAmnMKOByMxFrVYsktYfA39Gakfdh6fsttXu7x51tJzxb7qIH99bMTgmZDa+J99ocw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=739iXV3xzuk8ZBjHREtGp+OnjMMIYC5G/9LEiNYWtaU=;
 b=nZOeD8LRoG4QKDaFNOk169LEc2AU47kE9/AEqcfGOLxmtsykt0Sfd8QuRQMGvGt6qO9z6XuH6Yv1QH8XGU3idnA84YdpXSMjgz/NiXYH8CmIFewSWvnKUnK22s1MnQUm7TDavmaPiRuW7mNHvgbh2pKQkV2VUit4VJIDe9M0b9hRB3v+ZUv6j1l8CEKcwWkeay2p5jFmThp3T89FQc0SU9ZK23R/IUnT/Bt9spwjbWL8vI2SxMcYx9wkdRCnMpnlmtZhoHZglx3SaOVszk+iYUn7q5AMKk68MEzNdxTC8rKWrz9Iau9MjwllvwOnUGVZGCsVKvEoQbyl3uow8DML1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6370.namprd11.prod.outlook.com (2603:10b6:208:3ae::8)
 by SJ5PPF1EED2E381.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::817) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 07:00:54 +0000
Received: from IA1PR11MB6370.namprd11.prod.outlook.com
 ([fe80::401f:1d9b:38a6:444d]) by IA1PR11MB6370.namprd11.prod.outlook.com
 ([fe80::401f:1d9b:38a6:444d%3]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 07:00:54 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Hans de Goede <hansg@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Stanislaw Gruszka
	<stanislaw.gruszka@linux.intel.com>
CC: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 02/10] mei: vsc: Don't re-init VSC from mei_vsc_hw_reset()
 on stop
Thread-Topic: [PATCH 02/10] mei: vsc: Don't re-init VSC from
 mei_vsc_hw_reset() on stop
Thread-Index: AQHb5Bv5MJHcXv2QJka3zcpaX4AiorQR1Knw
Date: Tue, 24 Jun 2025 07:00:54 +0000
Message-ID: <IA1PR11MB6370F9796B6ADF1B765D05A9ED78A@IA1PR11MB6370.namprd11.prod.outlook.com>
References: <20250623085052.12347-1-hansg@kernel.org>
 <20250623085052.12347-3-hansg@kernel.org>
In-Reply-To: <20250623085052.12347-3-hansg@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6370:EE_|SJ5PPF1EED2E381:EE_
x-ms-office365-filtering-correlation-id: 24230aff-f36a-47e5-536b-08ddb2ecdce3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bW5vZzM1MnZWVUc1ejVJWUdWTUY0MnJkaldDUjFxZTRadWFER01INlREbGxO?=
 =?utf-8?B?VnpYVzFRa1pCc3dyR3J1Q1pmc0pLNlY2clFiY2VMN2hPKzFpRUxLWFkwTVc5?=
 =?utf-8?B?V0tYYm5NNVUwYXJla2hibXlmek50dUtWVDJSekhKaW04OS9jM0tnK2dONUxN?=
 =?utf-8?B?bkFBdmhTZWVxRU9ZYUZ5VFVoOExEVU5TbnRpcFpUUm9iVGFnT29Dd1pERWEv?=
 =?utf-8?B?YjhtMnd0THlDbjZiOFFyaG1GbTE5VlNweEtBNGM2VjhTRHFXVUk4SGpVZkln?=
 =?utf-8?B?M2Z2ZFc2bFRKWDJOOWNZQU80UHQzL0Z0Wk9MWXlnRWNIYTBINjg3bHVGMXp0?=
 =?utf-8?B?ZzczVEMyWkpKNEJIVVVBdVJlL0Q5djArUXdXUU9UYllQaFBEbm94Y2hSRDNZ?=
 =?utf-8?B?RVRJNkFXTExlRVdFRkpKeVFkNitRcDBQRVU5clo4QzY5ZlI4blFZOUFFaEk2?=
 =?utf-8?B?dDZ1SUcwa01wdHk5ZTcyVlY4Q3VnN1plRElwVno5ektqRTYzUExCeXBDMVV6?=
 =?utf-8?B?M3J0OHQzWUVkOHdnSFJaTGhHVGVWL1l5YklhbTNxdHFkeG1NNE1UNzZrK2pZ?=
 =?utf-8?B?RFgreFNlZFJGUWorRzRMUGdOaExSZm9tVXhkVmY1czRwOVlwempNYy93cEhm?=
 =?utf-8?B?VFdRbzVhNnlsNjZmcUhaSE5yVkdZUXlSVklUbHJTR0NPVndsYmF6VzhFcC9r?=
 =?utf-8?B?dXpMSGh6dHAwMGNkdFcrM0w1OWpERWRZdlI3bFN6bjZHNjkwMnl1elg0dHZa?=
 =?utf-8?B?MWkzcmRvVEpNU1JaNVRsRkRwV0FJS3BpUkk0Z3JUN0dwOE05aG1aNWhiMnlP?=
 =?utf-8?B?eEhRUDNwcmlwSFVYWkNTZVpxRDRrZ3lSNkVnZ1BqVWpibUhERWhTMG54VVdX?=
 =?utf-8?B?WlU3RytJTmM0TWNsNTN3UmQ1SzZtM2R0N1JlMEpxUVcxWFJqOUdmQVduMU9i?=
 =?utf-8?B?Nzk0QXhLb3haMEp5WmRxMmJ5Wm5MUEc4QTU1MFVwY3VCaWkwUnZSQ3RhU0J1?=
 =?utf-8?B?TkRpL0l1T2dwQTlMUng0S1J6V092QnpOV010aDl6ZkVoZ1ZsYUgyTW96eEMr?=
 =?utf-8?B?MGkrOTJ2NElFZ2pJWFVhMWtqbDRXelgrb3RZd3NGWG1vUHc0SWJSemlORk9o?=
 =?utf-8?B?c3k5aHU3bDRVdG9pTmRudnhNbHlNNTM1ak1wQWorNUdKL2tnbWxjT25tS3Nh?=
 =?utf-8?B?cWQ4bWFOYkgxVmd4V29ybGlMbDI0Z1dTaStYSnpiVnhnQTl4WTArYS9YYmVp?=
 =?utf-8?B?dk9yeXhndFJqdkUzOWxwN05tVlBGa3YvVXk3bmRuSXh5VEZDZFdEYXJVeEVv?=
 =?utf-8?B?SVRmRVJwS0NxZXJYd1lQU0xwaDN3ZHA0citFTzQrTXpVQm1xSllwZmVrY1BL?=
 =?utf-8?B?UUFWMWJrOGRKU29iTjhWM25jblNOb0I5a3E3ekFma3Z5Y0VNNXR3blk4QUZI?=
 =?utf-8?B?dkNSWUdhZzNLTlFjc2d5TUZDbGNOQ2dFd3EveVFLTHF1Tmx4U0x0ZFpDUnRY?=
 =?utf-8?B?Y05YMW9PZ3BRNTQ4dENoeXR4cWllZGFJSVJuUEZMZ0hud1lyNHZOK01jM0xW?=
 =?utf-8?B?L0prbHB4VCthTkdlM1VnTWU3MEtGZ0xxaytPdVpPNmpueU5RRUtwb1FQTDF5?=
 =?utf-8?B?OWhRYlJqK0pWU0sxeVpJVTRmNWcybkpsMlV2bUF3a0kwMGtYeExiNGhydWRF?=
 =?utf-8?B?ekNjVThOZXJXSEM2anFYRE9MV29MOFJxM1hIbGgxcktiM1dKUXh6SC9Kb0Uz?=
 =?utf-8?B?b2FDeFdkb0p2ZFNzLzY0d3ZXa2VFcDJWREV1ZVNFSGZlM0hJRTJySHA2M1Mv?=
 =?utf-8?B?Q3Y1QzhEMXptY3FMTXNONUZKdEw0czk2WVduLzh4ZzJ6eS9YOG1hU1g2K3B2?=
 =?utf-8?B?RjRSMkJ6YXRwanFWNXlOWDF4WlY4ZjRDbnZQVjZHbTRPRGZzbVJnM2pta0hS?=
 =?utf-8?B?dWovWnVNNlE4WUw4YU9rckhoQ3RVN0JoejYxcXJVRk94bGdmeVlJNEIvck9G?=
 =?utf-8?Q?DJrF4Te+EDtNUrHHq9EYBQsvQa57Ns=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VkxDYjZRdnZiUjVXSmFyaFZuVHJtb3dZMmRDNVJHMEhoS1RiWEdtcUduVTJj?=
 =?utf-8?B?aUNmMy9rVzEzbEVwNkluckx1ZnRnZHpvQ0VTMTRkSEZwR21kbXZKZGRtbDRN?=
 =?utf-8?B?UEhsYUpVOUd1TTd2NU1HSUVaejZPaElRN0JxakZwQXVVanQyZ3dya3Rma1hU?=
 =?utf-8?B?L3hEc1NDc1ZKN1FTbjBaUjhDckMyMnBsYjJLSFNBR1ZOS2JXU2dJdG56SHJY?=
 =?utf-8?B?Z2RET2c5elQrcTFwT0RJZGtUdEdPT0NlVUhLUmMxd3l1TFFSWXVFbzY0R0lz?=
 =?utf-8?B?SEZBZ2pCWVZSaG1CZmRVcDZXMXlhZ0Nkem1TTjlod0Nla3ZRT21lS1R0WlhG?=
 =?utf-8?B?Q2ZGZE45WnBnYkR4a1Iyb2NtR2N4RVdBQytIY0hPdGRHQWNRZ1ZBaGVVYVhj?=
 =?utf-8?B?aXFkaEI1Zmw3elZkc2pkT1BSSGIxMWZIRXR2RTh2N09sS2VMcVlveGt3dHhQ?=
 =?utf-8?B?bnhsYmZEci9IRFN2cWIycG5FU2hmU0l2c3pNN3pGSE5jVmVzLzRwcjZVTVhz?=
 =?utf-8?B?OExobTQ5dllLaGtzSTZRS0NLeG8zNHl5UVBqNXo1RTArNTkzMHIrOW9HWUFp?=
 =?utf-8?B?MnpCUlFKdGswWFNQcElrSEpwRkU2VFMxT2dnbGtXRWU3eDJjbUZFNXBoRHVj?=
 =?utf-8?B?QWZDd0MwS2Q5dUdYcXBlSC9QL1Q4ZFBuWWw5NzFlNlIxeVR0ZXpvRjlpc0dP?=
 =?utf-8?B?WHdsdlVnbGtvOGVnVGdwRFZTZXVRZThBTUdkY2lXeXlBNkJINWdpRkFXeUx3?=
 =?utf-8?B?MXF1WEpoczJ4NU1tM0JWSDU3emx4RXN5cGNQeW1yeStFSkRpU040M3hod0lC?=
 =?utf-8?B?cmlsYTRmTy9tWDgvdUpIRTF0WDJ0enVyZS9BbTF1ZGpDbUJvWUhqcmpTdERm?=
 =?utf-8?B?S0FYM2RxLzlGdFQ4K0pUWlpmMDllQ0ZFK1dtZHQvaWp6VUlJZ0l3aFBmTmhU?=
 =?utf-8?B?clhrVm5LTHNhMFNLWUpyaE9VdjMya0llM2J6a2VXMTFzNk5UUGN5N0lkZmE2?=
 =?utf-8?B?b2xoN0xSTnQvYTVDNExSd2JDQVNSbjZHSEdnR2puWXRWOUM0UktaTmtsMmZY?=
 =?utf-8?B?clByQ045c3d2MW92TlhDZkVoTHR4TGJDZnhoV2lLa3NIQlJqRzY5dE5hL3or?=
 =?utf-8?B?YmZxVlNkM2ZmVCtzTnNMMnU4M0JxWVU5d0NHcUtCZkVHMnA5M1E3QVBCaGpa?=
 =?utf-8?B?bUk5S1NsdWNDbGxPZ3I0MHJsNGgrRXFSbGZYaHBLcktMa1V3MEpWOXE5SDcr?=
 =?utf-8?B?eEJ5QW96NjNOTmNMWDdIMGVycHZnREVBOUJoMmtId1p0U1FjQnprTG5pblJv?=
 =?utf-8?B?cVN0cWxMZzJzYXp6MmlGNWp3dkRWT1IwSkhHRjRMSDJQdnUxRklGdkpDVFJY?=
 =?utf-8?B?TDM1dmhIVWNrT0N0YUgrWU1oenNNR3hTc0U2Z3FtMGovbUlDZmNhL1lZS3dS?=
 =?utf-8?B?eXNIT3M1WE13ZTBaTEFTL1RYOEYrbDVQc01wck9QcktaUFVnelR0TUR1enl1?=
 =?utf-8?B?aEJEZmNkRmpnLzU5MjdYNkNBdEJ0VURUTnA1djBnRmljL3R2YXNMUzkrNHd6?=
 =?utf-8?B?dVpxVFVkMk50Y2lBYVN0RldrcktrRjI3bVBjdHcxTkpmTWJ4QS9qRVpxeW1o?=
 =?utf-8?B?eUV6ZkV4aFdvTm9ra2VNdEllT1VGelJOT0ZvZHVrdXk3Q1N3Sk5tVXJQRVM1?=
 =?utf-8?B?a09BSUVGY0VERmk3M2N3T1J1OHRKay9jR3NTbXBIb2M2QmlRc3ZzOGcxeTAv?=
 =?utf-8?B?cGgxcWxCQ08vRTlvZ0RBSm5CenVxSkcySVZKc3NrWGtrbU9KSEZKci9lOWo0?=
 =?utf-8?B?cXhITVNrTGYzeXRzdktZUHdhQWtEaFFubnRueWhRWk5BWFFGblVEaThDL3Ns?=
 =?utf-8?B?VEVIQlpjVmZrM0VMN3Q0djB5VkdCUytMRFhTU0dSZjdvK1lyQ1lBNFhCRFJz?=
 =?utf-8?B?Vk1oMjkzcWtXaktzSkRUTFNHVHVJNWVFejZVKzlRSWEzdnZDK0lxbUlHY1gy?=
 =?utf-8?B?QnNPK3FhSXRITUF0bURTSHRtRXh5eEpJQ0lIWDU5Y0RKK2NZaTVnaHk2eVJa?=
 =?utf-8?B?YlpxSHlaWkFpL0l2cXBjMG1MaU5iWWk2TG1UQVRoNjFrYVRiWStyWTBaeXlW?=
 =?utf-8?Q?JOjZRVzsmRv8zsGlrxjvf1JOV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24230aff-f36a-47e5-536b-08ddb2ecdce3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 07:00:54.4080
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m2VSb8Q+57j/dXYHsmZWb6bN2H58tMP30mcuNHD4k48cJfzlKCvlliRQluNiH+aJlmzGkEH3GQVRFwV9O7HLznoFN+JiScucvQh7nFIL9qs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1EED2E381
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBbUEFUQ0ggMDIvMTBdIG1laTogdnNjOiBEb24ndCByZS1pbml0IFZTQyBmcm9t
IG1laV92c2NfaHdfcmVzZXQoKQ0KPiBvbiBzdG9wDQo+IA0KPiBtZWlfdnNjX2h3X3Jlc2V0KCkg
Z2V0cyBjYWxsZWQgZnJvbSBtZWlfc3RhcnQoKSBhbmQgbWVpX3N0b3AoKSBpbg0KPiB0aGUgbGF0
dGVyIGNhc2Ugd2UgZG8gbm90IG5lZWQgdG8gcmUtaW5pdCB0aGUgVlNDIGJ5IGNhbGxpbmcgdnNj
X3RwX2luaXQoKS4NCj4gDQo+IG1laV9zdG9wKCkgb25seSBoYXBwZW5zIG9uIHNodXRkb3duIGFu
ZCBkcml2ZXIgdW5iaW5kLiBPbiBzaHV0ZG93biB3ZQ0KPiBkb24ndCBuZWVkIHRvIGxvYWQgKyBi
b290IHRoZSBmaXJtd2FyZSBhbmQgaWYgdGhlIGRyaXZlciBsYXRlciBpcw0KPiBib3VuZCB0byB0
aGUgZGV2aWNlIGFnYWluIHRoZW4gbWVpX3N0YXJ0KCkgd2lsbCBkbyBhbm90aGVyIHJlc2V0Lg0K
PiANCj4gVGhlIGludHJfZW5hYmxlIGZsYWcgaXMgdHJ1ZSB3aGVuIGNhbGxlZCBmcm9tIG1laV9z
dGFydCgpIGFuZCBmYWxzZSBvbg0KPiBtZWlfc3RvcCgpLiBTa2lwIHZzY190cF9pbml0KCkgd2hl
biBpbnRyX2VuYWJsZSBpcyBmYWxzZS4NCj4gDQo+IFRoaXMgYXZvaWRzIHVubmVjZXNzYXJpbHkg
dXBsb2FkaW5nIHRoZSBmaXJtd2FyZSwgd2hpY2ggdGFrZXMgMTEgc2Vjb25kcy4NCj4gVGhpcyBj
aGFuZ2UgcmVkdWNlcyB0aGUgcG93ZXJvZmYvcmVib290IHRpbWUgYnkgMTEgc2Vjb25kcy4NCj4g
DQoNClJldmlld2VkLWJ5OiAgQWxleGFuZGVyIFVzeXNraW4gPGFsZXhhbmRlci51c3lza2luQGlu
dGVsLmNvbT4NCg0KPiBGaXhlczogMzg2YTc2NmM0MTY5ICgibWVpOiBBZGQgTUVJIGhhcmR3YXJl
IHN1cHBvcnQgZm9yIElWU0MgZGV2aWNlIikNCj4gU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2Vk
ZSA8aGFuc2dAa2VybmVsLm9yZz4NCj4gLS0tDQo+ICBkcml2ZXJzL21pc2MvbWVpL3BsYXRmb3Jt
LXZzYy5jIHwgMyArKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL21pc2MvbWVpL3BsYXRmb3JtLXZzYy5jIGIvZHJpdmVycy9t
aXNjL21laS9wbGF0Zm9ybS12c2MuYw0KPiBpbmRleCA0MzU3NjBiMWU4NmYuLjFhYzg1ZjAyNTFj
NSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9taXNjL21laS9wbGF0Zm9ybS12c2MuYw0KPiArKysg
Yi9kcml2ZXJzL21pc2MvbWVpL3BsYXRmb3JtLXZzYy5jDQo+IEBAIC0yNTYsNiArMjU2LDkgQEAg
c3RhdGljIGludCBtZWlfdnNjX2h3X3Jlc2V0KHN0cnVjdCBtZWlfZGV2aWNlDQo+ICptZWlfZGV2
LCBib29sIGludHJfZW5hYmxlKQ0KPiANCj4gIAl2c2NfdHBfcmVzZXQoaHctPnRwKTsNCj4gDQo+
ICsJaWYgKCFpbnRyX2VuYWJsZSkNCj4gKwkJcmV0dXJuIDA7DQo+ICsNCj4gIAlyZXR1cm4gdnNj
X3RwX2luaXQoaHctPnRwLCBtZWlfZGV2LT5kZXYpOw0KPiAgfQ0KPiANCj4gLS0NCj4gMi40OS4w
DQoNCg==
