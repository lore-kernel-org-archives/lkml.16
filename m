Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B925A7083A
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 21:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746134626; cv=fail; b=oYiQOaxNg7gyqAh8PQ4uV8cBpFgn/949/bH9IiNZpEMJHC8L521hZzlPcgaA7lzZXqOw++B7XKvqND0WUo15GOMzA5B/XQroODh7cn9SwyS4HP53YrLRGj9Ynr1KPYwNz0+WJ09FQ6LZUcAaY66W6WRN5RcW4AuD6ecJ4w3YvS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746134626; c=relaxed/simple;
	bh=U0HM0obVqRPWfW8BucaYtW98B8slfTpAe8muOdoL0js=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=If2M9HbeiiwkCdLt35r/lkcGLaKfu/qv9KX1/JZ5AkISveu9aTx+BnkJjP4qPECnGz4M2dQBq44R4KpHl56+bYM4piB+rM+0w/4R157DaN0g8bAq6PLUQ1uk9XRc9oG9+yIsUke+plZxv1pnxqDPWJYOnNh3hcQUJ2CGQPNy2KU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JNtxZOZ4; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JNtxZOZ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746134625; x=1777670625;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=U0HM0obVqRPWfW8BucaYtW98B8slfTpAe8muOdoL0js=;
  b=JNtxZOZ4Qt2HhIPC2O5dbQksRZDV/rmkfmorAafvARkVnamLMYoO0Ecu
   zNdihbiHO9Wx63O2FlBq+FcmfmLAA7vl6i5lWOCbIhiwacCVN5/f6fn9k
   IglrG+niBH6q0lDHQiCoT2C852m/TqctufDrnrDRylC6qFtCEAYJ/TycI
   g21aEFCKn0gk0mUYt2HzCW9RawzUhE6wpmIOqdbcyHPEsiFEXuk52AYJO
   KpH5n7NWOfWmq5LZSv1hu9KpmOJv0DFalu21OSAWJp2Q2QKMmoYZrO5x7
   e4vrF2iX1DgvNn9+Yhd5EwdL8SYRruPEi4+O5Bl6nQ39GDa8PGJpWvQ3o
   A==;
X-CSE-ConnectionGUID: NTDO9LaXTMKlgrv0qBgF7g==
X-CSE-MsgGUID: lhN3e9UsR/KGoJ35/KGxsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="58026169"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="58026169"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 14:23:44 -0700
X-CSE-ConnectionGUID: 7/fxC2FhT/eCcPnTEg4qZQ==
X-CSE-MsgGUID: Wx3d+FkdRB+IwuCBIj9JTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="134379441"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 14:23:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 14:23:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 14:23:38 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 14:23:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hx0uc4hwC6AK0ZJgqYX7l8cVZpHlZQahKy8QGDG8fOWApcV6vhUFzjcw3SqCKQQRa5HielXWuBqOq3HSVTsupQ9iCErtsjD2d/qj3c6EZxl3REBE0UkFVQjQJeGOREngpPfMrsV+60X8hQkKLB8jEPAWJplrCq0tO2n8Yw0oy9jWve85DRJHZoz/7/XMsCHcvsVGPiWO/7vlETYGz352lWCcSnsgyKED6Re9uWscW6INB1QItMz7tOiJGl1DC2gqYYY7Rm6TUOCgGl1GXgmo4Tsx4NSd3YHBcv6GUbkK7Ss1BcZ0TOKi5685qMRLTYb1PlJSbRzjTkt1S+RrorrAkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOzoVjStQkHtpF5LoFr+Q0ar+GkCuKZDPOwNlRTo5XQ=;
 b=CCTUABk3UjvnR3EaZFXLTKJS7bGppvKiwDfR33C2u27lL7EdKuqU6UC7m1oH+OZUhGXlJRqbqF/lG3CEDBYffHzMa5G2O3JA8yJnYz94NQ/744XGr4dJCeFc7CeVq5E/QQhBlW+50hf27Rmgy5pmUpW4zKwXw16cbVB9tQ89crFGuslUaIOSXRdkuQudMH7NwnNdmSXDHmKEVUu+Jbb2Bu6XBw1F/ObXsDNGImIBKUoDANBIIQoC+IR7oQTtmsFJm68MiA/Msgmo42LltBQ0d6DX744DVmFhfxAHytQn5t8+kl+ZPEm1MaBWsqtY8Xcw2T53p+GM4XOH3C2cW7Q1BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH3PPFA07D87DA6.namprd11.prod.outlook.com (2603:10b6:518:1::d3e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 1 May
 2025 21:23:08 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.8699.019; Thu, 1 May 2025
 21:23:08 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>
Subject: RE: [PATCH 1/2] mm/gup: Remove unnecessary check in
 memfd_pin_folios()
Thread-Topic: [PATCH 1/2] mm/gup: Remove unnecessary check in
 memfd_pin_folios()
Thread-Index: AQHbuWuU8AQjbhXPNUiEX1eD6eb+frO+SNGw
Date: Thu, 1 May 2025 21:23:08 +0000
Message-ID: <IA0PR11MB7185E3BD6CC4DB1CF7F49351F8822@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250430010059.892632-1-vishal.moola@gmail.com>
 <20250430010059.892632-2-vishal.moola@gmail.com>
In-Reply-To: <20250430010059.892632-2-vishal.moola@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH3PPFA07D87DA6:EE_
x-ms-office365-filtering-correlation-id: 35642aca-cae7-422b-ed31-08dd88f65e93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?7q/16yRtHX8xmQoh3bKVGRN1PjdAgVF8S/ZfKM7r50bF/i2A9AN3husg1+c5?=
 =?us-ascii?Q?yBbBda2hxlaWRNP0SXahe0du8mBfjVGvAqnhe3duAbAUmWCVlRlY/bUXS84P?=
 =?us-ascii?Q?9KbwCphhJ1K5Hs7KuoZBoAwSkRz/OAEcBjsSjRqAc1gqdnC5IgVMjZbEko3R?=
 =?us-ascii?Q?xXtLzm6sfrc1uKSZz+xY4+VF38wu+fUfunaI8oSU6iwUcd+fBEpK1ZlClWMm?=
 =?us-ascii?Q?ORoFPYztxzkIWIYx7QPCS7mQX2rGVRrVS4c52NAbzRYT/2a/QhwexPnGnoZ3?=
 =?us-ascii?Q?3sRqNdhkH2hEFhxG8NrWP+iENarvXi+y91ApqoAJ7IvEAmzmp6EJtEmdephZ?=
 =?us-ascii?Q?9zzjGO4JHvfeP2S33SJvsVNQrheMeRtMC+fQdhZXZNLmYHSOG6mpqViE0tgh?=
 =?us-ascii?Q?wfj/EDl1gBQyfwAdtYTw8HliVdEAzUgjmr3KfC5TJ9lAJbBC9yZwN46EiLo7?=
 =?us-ascii?Q?QhhLS+DOiXhh68ZWVqMSkUkv4hIhy1WlDZ8xWQKotYHUQWfq546rA+xueBKH?=
 =?us-ascii?Q?3X8urhb7GRAqCqUFU6JpHuuICsXfLk1XtA71BieAcakJIhHRrhz+jaHwoCh8?=
 =?us-ascii?Q?HALwkGF8Dq74U6Kd4+HA1eLqth8ILfK5mznSzGH0NDXuqf9flJizkSMp65MC?=
 =?us-ascii?Q?74FVOQ/3IF3K7UopUHNuN8baWjfuRVYLW9CnW6aydPFLK8DbdBTKQCnhm58d?=
 =?us-ascii?Q?xzlHShV/cAIDY9JJXYAHlQApRgttwyheheTXgEdkF/OJNoMXJhmB6GxLncvd?=
 =?us-ascii?Q?PKVGfFF0YcGkyj8ePqUmdNjBqJS2ux4fMo/fvDpnMKC3llmFfdQqEQqzHA99?=
 =?us-ascii?Q?NIxGS1+Sn7iMHGrYpVRHWhQZHfTRqn09r4Z0KfAjoBcXWoDk3LKVayqgQCW9?=
 =?us-ascii?Q?PAp8XqjKEOAZ0RGL5dZdigecqyaYrWOO1WTXOZc5aIpxeAjkUeFOce/EXXzO?=
 =?us-ascii?Q?pmkPQfOQURKO1pTXaCVPw4lZ3Ojl6f2VOvpjhuOwng9UpYvFkalnZ6SjNuXF?=
 =?us-ascii?Q?ZyypX4tGBkIPFdRK5wt7PXPn+2diksp0ljSPwJeZvKFWYcm6Yn6Jas3IrT8j?=
 =?us-ascii?Q?R5L00Jg/cQB3BKfyKLGy2mUXK5vZfnhRd8kvaPjvVTcBQqN2PREiU0cR88Cg?=
 =?us-ascii?Q?ufYTkykCW82tTJ2k6ic2mEdoMxUQFddxKZ2PVHFssWoxQwDmJDpkYhgAlRvR?=
 =?us-ascii?Q?BpTgfZaVpQmJ39janqdF+pyhSPAH7mJWXZw8X8t9uFwiAKAfpPf32diOSUN7?=
 =?us-ascii?Q?voEgeTBY3Xz/exOnM8kynID98rp5eq+dxyKdKR8pVz1tZL2IhzztTHD+AYn0?=
 =?us-ascii?Q?O0D44TE1+5zpkdPZxtdwXN93ge2+aID+1eUjjpjQX7vtsuCrbMOIaydbn5mP?=
 =?us-ascii?Q?XfYgs+DcHBt4+kMSSYerPQiu1Zp2ASYDwd9aPw18Hva7SsCzaBKtomp2B84F?=
 =?us-ascii?Q?kFiCgPCMTJCAvr4+cfBNyCHgwoF7Od35DcrW8ZM/GwzRLiJ+pWMSSg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7185.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?b//1sfDBdHCs0wIYlFDpNR8OFwWf7+hHiXiIM4c7m9/6zPI3dTq90gUd3Dxd?=
 =?us-ascii?Q?wY1U4LKmcy+4jl4vlDISmrvcC6mdUIrwkP3oXnDIvsvtF/kEH+oxDbf47qy/?=
 =?us-ascii?Q?yKOfCn2bk/6yRCLf2aU1IHsmMEyG8cA6mbjRG8hJueZgpVKRLhTtkALZ72ps?=
 =?us-ascii?Q?sX57NM6Oldxov1j5HOw4j58ooFyRmOmhXlW4yQipiwo048b/G9SbZ38S4x/C?=
 =?us-ascii?Q?DzP3yHxCZnjl+WIWCVieacDZopFgfg8dpm5teMKqNxhTq2j2NXrcxntfz+qH?=
 =?us-ascii?Q?vC3fnZ1gWyQIZtZdKN/Jjg5jXdYGTXkVtKej6uSftL6kDQsfqUluyvlg0ZfU?=
 =?us-ascii?Q?g0rnNSDCDHatSuYffeD5kB8vuOcnBfVXMV8yE3tGptRXJjm+joMSFdpBFckV?=
 =?us-ascii?Q?VB/YddndQvR6abNsdFT2dqfM6FUUpKsPLOHp6Z2Xki34JfVu5gXVWM2V6SmQ?=
 =?us-ascii?Q?rf/HrIWLhecg5dhFG7iYBZvdRDNPCmDNGy2NtQT6s7isj87nQhwNHvdT7xi/?=
 =?us-ascii?Q?/+c5EdQNbrKXHV0Y6bRAzbHtNKJkkn+87EzVW5+QczihHUgTHvBQSNzEmsbr?=
 =?us-ascii?Q?8P6PuAu4z8UQFReWh0FlWO+MonXYpD4wz0yHWhVPmm+aKV66okNTZDzI+vsl?=
 =?us-ascii?Q?XqwCQTRB6DpexSd25BlZbWQ+2vT4KZwepFIkpm7sIx6eB26Te8SpRK4xJedV?=
 =?us-ascii?Q?gHxftZoRPr5jJKMtPokY7KgrodtmV5Ngdz2dwo+2DgOBa/P8k2lBzZj5xou5?=
 =?us-ascii?Q?9U3lSFE+ecK00yjeY/LuBguWasUEsn6yK7jDmFAyMQ2drDfreDCjTPV5ZXxM?=
 =?us-ascii?Q?hD6YOqoK5zya7RvG0Lh//Omc9q/rEC9z9lQa5oC7jeKN5iAxOPzUytw8qX/6?=
 =?us-ascii?Q?RghCxceTFKzH/8PKzm+pEvw735OOOHeK4plskc6wBctv/itoencL7uhANIa9?=
 =?us-ascii?Q?ONaIGaw8mSvOqxhpUWWQLssw5sZNPenhWAWcF4Ns8xtasF69bqtfFewMNq5G?=
 =?us-ascii?Q?IgZC8ThW3dnbrin0sEN8lyXLVUFtYoGjN4D+QbzTBBn+6Oslj60u6oRhD8Ev?=
 =?us-ascii?Q?Yvypc3kPgWzZPyy4PTVX7SkANftw9rZ2INJ0P0HUmJ1hgyJGAIBPusKprv3q?=
 =?us-ascii?Q?UC8V25u9PJGWZAApwC5uao8/9rmm2SwnbZE7b8Pba4EghJNsdcp2oiERftLt?=
 =?us-ascii?Q?zxB2cuulj6u37DUrP+taGye5f2CNIaDYW3W/zZbOdb6BMMKHacfdzEdcIrs/?=
 =?us-ascii?Q?BXMhc0fyuTPcIvK+9Pb4Aiux1ZmxMd0+sjyCDfVW2P6E/P/A88asGvmaC3s8?=
 =?us-ascii?Q?uxCduDBsWMXjqq+f4vsbKjPcdzhCqY6pV58crmnM5HdFR4AboyWAmzijNQlI?=
 =?us-ascii?Q?IMh0pFvgJl1BpzMQTuKw6OSie1gBKw7Xs+Lf8rE9qm5PiGB/vJ/BRYudYIvb?=
 =?us-ascii?Q?wwNoGqEDfwkormy5aQGTUvZQZjRsN2Bcf0n38MZgVCUWPMYmaBtkwLFKZRda?=
 =?us-ascii?Q?Sdt3ytrE7KDvmjmerNXd2IKR8jCGCtnp0wZUqy5a8QFEOxYrLCz/bfBCI9PY?=
 =?us-ascii?Q?trMPUYNU8jXLvSdZFtdYZk5NugCMre5tkSP+X1gU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35642aca-cae7-422b-ed31-08dd88f65e93
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2025 21:23:08.5967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L5IxDUahmXCF7J77YzWuY9IHs/4PGqNSb3IBTQTpAkTCC83wNbbI8CQ9PvR5HT/BrjnN6K7wmX+T1rGSWJ0fKCLO+3POpN0yv9B9cMcJGxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFA07D87DA6
X-OriginatorOrg: intel.com

Hi Vishal,

> Subject: [PATCH 1/2] mm/gup: Remove unnecessary check in
> memfd_pin_folios()
>=20
> Commit 89c1905d9c14 ("mm/gup: introduce memfd_pin_folios() for pinning
> memfd folios")
> checks if filemap_get_folios_contig() returned duplicate folios to
> prevent multiple attempts at pinning the same folio.
>=20
> Commit 8ab1b1602396 ("mm: fix filemap_get_folios_contig returning batches
> of identical folios")
> ensures that filemap_get_folios_contig() returns a batch of distinct foli=
os.
>=20
> We can remove the duplicate folio check to simplify the code and save
> 58 bytes of text.
>=20
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  mm/gup.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
>=20
> diff --git a/mm/gup.c b/mm/gup.c
> index f32168339390..1fb8f3b9a493 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -3589,7 +3589,7 @@ long memfd_pin_folios(struct file *memfd, loff_t
> start, loff_t end,
>  {
>  	unsigned int flags, nr_folios, nr_found;
>  	unsigned int i, pgshift =3D PAGE_SHIFT;
> -	pgoff_t start_idx, end_idx, next_idx;
> +	pgoff_t start_idx, end_idx;
>  	struct folio *folio =3D NULL;
>  	struct folio_batch fbatch;
>  	struct hstate *h;
> @@ -3639,19 +3639,7 @@ long memfd_pin_folios(struct file *memfd, loff_t
> start, loff_t end,
>  				folio =3D NULL;
>  			}
>=20
> -			next_idx =3D 0;
>  			for (i =3D 0; i < nr_found; i++) {
> -				/*
> -				 * As there can be multiple entries for a
> -				 * given folio in the batch returned by
> -				 * filemap_get_folios_contig(), the below
> -				 * check is to ensure that we pin and return a
> -				 * unique set of folios between start and end.
> -				 */
> -				if (next_idx &&
> -				    next_idx !=3D folio_index(fbatch.folios[i]))
> -					continue;
At that time, I believed that filemap_get_folios_contig() returning duplica=
te
folios was by design and not a result of a bug and hence added this workaro=
und,
which is no longer needed in light of your fix.
Anyway, LGTM.

Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

Thanks,
Vivek

> -
>  				folio =3D page_folio(&fbatch.folios[i]->page);
>=20
>  				if (try_grab_folio(folio, 1, FOLL_PIN)) {
> @@ -3664,7 +3652,6 @@ long memfd_pin_folios(struct file *memfd, loff_t
> start, loff_t end,
>  					*offset =3D offset_in_folio(folio, start);
>=20
>  				folios[nr_folios] =3D folio;
> -				next_idx =3D folio_next_index(folio);
>  				if (++nr_folios =3D=3D max_folios)
>  					break;
>  			}
> --
> 2.49.0
>=20

