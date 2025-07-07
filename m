Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FC7286880
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 11:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751888217; cv=fail; b=aPCzCJ9NCTfPe33aMaVIQy9TA9hfN0/txMgiQZQRf80zEnIz4FuQ8KQrN7Jk8Rne56fIX0EB42nnKExwOz5CVh0KjlmehjIDYvDdzW8VXQTaFr0QvLkTx3EAO2mIRzJ5U58bL8w91gyBKKiTehWvK6gkG7TwwdFg2UeEq88MtJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751888217; c=relaxed/simple;
	bh=ll8QDG7e2J+BWHI/9Old2ZsJD9U9ej9AaU5vfGUXe9g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Oj1pLRjdl/+nF/yHI/U/mQ6CC96RhqdMaB+yK3xSj0BWi9ZmgdFUQ5d92uaudXo3xfZlIVGbtnP+nMkj8CwPTeMXa3Zm2AkSOHD96bsWkjz/hFOyetuvHF+ir44VsbWJCpl/Fvcw/up4VnHTKxV+sHLu4gMgRXghkAYz8y8Y4zQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BNrYSdiI; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BNrYSdiI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751888216; x=1783424216;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ll8QDG7e2J+BWHI/9Old2ZsJD9U9ej9AaU5vfGUXe9g=;
  b=BNrYSdiI1SYa3GQO7RdUWOxnXpNYjRDWiQoFDN5IN5tsKosriR4MzGnw
   ziwA6Ji3UY0ELWg5/+zHqPYVAbdS+uexTf2NbaTVPXl13Q3hMyxPliomv
   /2GfB+egIGr1Pl8awpXniznZ8XhdHhbhFNihHSxBYJN7/8Jgwuoo5hHaQ
   5PqLdpnqitD6Wva5Kw8QL3X1z5f6Tu1sfrPBYQS/laJg6XWFjJSmjd9Q3
   sPf7DCsqG4Ob9FU3tW6Q3gtKSg7G+RTVcOzV8W76Ip2BgqEh/1qvTYdqO
   kMV8ZFvHpMDiXDlTdCWxKbg/9v+KXrxUcy+AUcZWpGvuekmDQaKVwTgmA
   Q==;
X-CSE-ConnectionGUID: nDXo0dToRVGB3PPelqX7RQ==
X-CSE-MsgGUID: GpDWjmWxQ0qZEp9cvtP7pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="71685351"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="71685351"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 04:36:55 -0700
X-CSE-ConnectionGUID: 6BH+1LKHTmmcNNOIqttHAg==
X-CSE-MsgGUID: vILC3uPGRRuXLTK9cTgAqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="155777629"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 04:36:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 04:36:54 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 04:36:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.77)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 04:36:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3TKvjhX1dAnjCoxgKQ2GrzbV+I+jvJaDKmZHRcA5VDkyIPf3530lLQV53L/4MwoD+ZU0bp++rgyL9nWocGA2Y527YLeCmD3MdX5+Ovinm36kX50m44VQVZGyhu5b/HDkzyg2UQZfeNed/fF0g6FDhxCYiA89FcD6sBI32zIot79lrfAQ46sRpRNBTO219BL/GUEkGdPrMjpEmj01QZd0j9V2LmkG7xDgO3MD1HbTUHqqkUbKFeNFe4CxHnxbObg3SFNga9zQfFaC6Alaskd/hpJCqdB2VCOIeVGr7TnVvejvxmljqDjBirQy0aIdYHkOdDFX3T4JR6t+QyWInFvTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04TVNtrHREpM09Tp1er758FMK0Q9/4oy8Q2ExETh8Kg=;
 b=RaTn1LVASIUBwLBgY341KjSbTWqdAf9JQYvAOTELM979bSrmX6syb2aAHDLBvvb/iR4GFKqE9QKzm64q7R3luTU4K2cEnJzJ9TRsDokGmjec3UT3mC1DuKasmqNDrcEsh+svlXJrMxvqTr3wHNgrtMrHB63RddxDZ8hGiWtcWpoeD4/sdKtXY9jIRwcbVc5j0qBlrgiOjxBqmFyWLWq2Qr13xDHv+pQfTQGnk4gPceO3EX8QblZjWALWV3O3PhpNHAj7M805JvCCEZ/JLqrKG2BZF4V8iCQD/TjpHY+0gLybpkxYasabVQKGSod+vcmXWEvGgxTnKVdsNpfU5yVhFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB6003.namprd11.prod.outlook.com (2603:10b6:208:387::6)
 by SJ5PPF3D06B1BFF.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::822) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Mon, 7 Jul
 2025 11:36:52 +0000
Received: from BL1PR11MB6003.namprd11.prod.outlook.com
 ([fe80::4584:bb9d:44c:1bff]) by BL1PR11MB6003.namprd11.prod.outlook.com
 ([fe80::4584:bb9d:44c:1bff%5]) with mapi id 15.20.8857.026; Mon, 7 Jul 2025
 11:36:52 +0000
From: "Deng, Pan" <pan.deng@intel.com>
To: lkp <lkp@intel.com>, "mingo@kernel.org" <mingo@kernel.org>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Li, Tianyou"
	<tianyou.li@intel.com>, "tim.c.chen@linux.intel.com"
	<tim.c.chen@linux.intel.com>, "Chen, Yu C" <yu.c.chen@intel.com>
Subject: RE: [PATCH 3/4] sched/rt: Split root_domain->rto_count to
 per-NUMA-node counters
Thread-Topic: [PATCH 3/4] sched/rt: Split root_domain->rto_count to
 per-NUMA-node counters
Thread-Index: AQHb7uc5O9mVovvEEUe6nrCYlBc7+bQmOcWAgABNbnA=
Date: Mon, 7 Jul 2025 11:36:52 +0000
Message-ID: <BL1PR11MB60035E71ABA41C3F26D7B212964FA@BL1PR11MB6003.namprd11.prod.outlook.com>
References: <2c1e1dbacaddd881f3cca340ece1f9268029b620.1751852370.git.pan.deng@intel.com>
 <202507071418.sFa0bilv-lkp@intel.com>
In-Reply-To: <202507071418.sFa0bilv-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB6003:EE_|SJ5PPF3D06B1BFF:EE_
x-ms-office365-filtering-correlation-id: 3d5f67f5-beea-4bdf-7b04-08ddbd4a9180
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|13003099007|7053199007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?yEe0M0VnJ4KItfRn5rF031TEr1ueZ9aYVhCLPG/vWz/A+aV1T+VadH5SUOy0?=
 =?us-ascii?Q?oy07KB3/Phc2+BV2WmQWwIKFIwLByELtHsxwSYkuzSbwd9uax/jFR/mBsq4d?=
 =?us-ascii?Q?iilVtb+JBn2pGSZqcgmuFhcPFeYIG15ZbjfeGqZwIrPs0ezdhftGHkkOu6WV?=
 =?us-ascii?Q?izBIzhczcaM3/airoYEtFuncZ5PHhvrDeOGKyLsU5mP0Er7PuSDEP0mF17Ml?=
 =?us-ascii?Q?HgJEfbUd6Qvs3yNyYZBXz+O4UeIX5tlRnjCxLkSRCRySFzLozToBaB4Nc1eY?=
 =?us-ascii?Q?ID0tPpN90mgrA+OYxD5Ra7pcFga+pdakZyHfjB9tRXGzlWO6PS+Lv0YX/pt6?=
 =?us-ascii?Q?/BwPuOOcA6fcddWdcegDxAvU/XHPZp/jW+UKZC5hY2kZKuNkYjOCfoOIZZrf?=
 =?us-ascii?Q?gjVv4p2hO2v/nxQXYoKCdxLo8D2R1qtIvNIHNs4cN+bNMlRfm9RM+fMWsuX+?=
 =?us-ascii?Q?WKrMU4uVhxNxAYDiPicTcsKo8DFQjbZsen5Fw6NRCwdS7A+II0gVQvr2cUAQ?=
 =?us-ascii?Q?/2T2sJ+VCNA+f8MgTeg1r2JCX/NuJGVaK/yoJPCnnzl9bypdfErfYz1FjQoI?=
 =?us-ascii?Q?as0z7gSLVGiLChQkBy1f4pIIdkQVkj4Uubs75y6uh3wEGjl5lSr7FCdqwb3+?=
 =?us-ascii?Q?zS4Jr/WVeM6xbPKhWf7Lqwl/+HtAUX7Ztx8nGSKOHuD19MOwg4XLObfZDhVM?=
 =?us-ascii?Q?e4di6PPFeZaaXLfK8R6nhIl1s3/6uJY1229mfWbd/0hGWG4E3Y7Oz8Vjd62v?=
 =?us-ascii?Q?8S9Fu+cXCGaRP+6J7o9lx4mi0qG+Rtnc5zwt4AgG4nsJhS89xpBZW7OvviG2?=
 =?us-ascii?Q?De3R1bMq0WHSI0SOA6P525PwVDfXNv80yzaBob307MmjtJ27/Bd7lgb3/vZd?=
 =?us-ascii?Q?NDq0W9fZMyC60poHw5UH/l97K7H83BLEP45FOhqzmb04tsW/lINKJ1nmo3+V?=
 =?us-ascii?Q?R8Bunz3+ck3y8XHweGrJ1zwh4QdKEZRe7h4eVX6Cgirzxoe9ac+3vKTeWMyV?=
 =?us-ascii?Q?nlJRHuK+wP6yvcRCNJ5TkzVc5R3CUXiehMPqoasE4edqjTAqb8SXlfh/dR7z?=
 =?us-ascii?Q?iGvqG5sFyyu4exB6ngcrpzNw123bl7uopBiTKAI9/e5/tMI8T3c7l8D/3A9n?=
 =?us-ascii?Q?utcbQiB3KnKw6JXyAR2Rok6pbfhM+IghroE9fI/wtnAGmNQZT3jbjnNdWQD8?=
 =?us-ascii?Q?nSc+CSM6bTf/okfgAyUcPVwDIhrhJjbnQEpT4xKk6uVc9LW+nuvohnVxbHMP?=
 =?us-ascii?Q?4WKgjErIlGVcDspOSsViwPwQJ8t3db229eDYDBCJ33ZeMgukzqNI2Syk/1Wx?=
 =?us-ascii?Q?9R4WKknpJjrdiqc5FaVmgKSZ1gIyCo7wJBcE4Ynhtg+1MyzNDJjYdhcvbw+p?=
 =?us-ascii?Q?9LnMik6INhf9CWb1GTibnOR1Paa6UsRMkK8gRmtPmmNGUDnE9d6cPYRX/bZG?=
 =?us-ascii?Q?QZYcKMo5eGpkfrmgvkLbLa5ISZJb+XZF?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB6003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(13003099007)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1Gf1rP09LBR9Omd7aAWD+S9do4xJWqSdajCf1ulO6DREPQhk5L016VmgvBBD?=
 =?us-ascii?Q?nG20+kmco0r0BHUdSHrzqGKwgPcOZrhF3y/qb7uq3/Kv9LZRnEDLkWC/U2IF?=
 =?us-ascii?Q?Gefii9s4En3j2iQUOiPrJwMkEBqEdxkBIPyVkbuSOLNSsJnEOQPsfEqENRgm?=
 =?us-ascii?Q?TRxfNTPT6kkx/l/7f9jcbBXO4afH9MdDfnOR95R6Hwnz2vnppKXpg7GlvOxa?=
 =?us-ascii?Q?RomEpJbLRcy7kmkaUjec9u1urRdKeNgjdoOLAd5qP0tWp2KAzGEXK44mubOf?=
 =?us-ascii?Q?s3Qcqi2L8CMUB06AnGuR60gtukvFOS5PknL8fPDY/jzpfNEtwsc+PrzdAHrv?=
 =?us-ascii?Q?OxWoJVTPQq6bd6ZPji9+YnxNLbcVbxz4rcJIcsNEMEBOHt7ixtXqnOtWAGIp?=
 =?us-ascii?Q?JtxZrlRCD2TPegi48UW4IdNTOCiYjxwi+9fSEvChBHqU5Fz6iHWtElfI5UvO?=
 =?us-ascii?Q?DqG9/x4rKmYXSvjrXuwXa4jfhomBjeTLwYqKcfrl+XTv8FnhIg3qAlrPMWa6?=
 =?us-ascii?Q?l6tXR762QmXFFF411V8Mo1NPxTYM+SMnqYCc06TceB+mql7sKus1LC4MHWsN?=
 =?us-ascii?Q?+PXiYga4K6nUrbYXI2Qs2+mxk2cApD5Usi1AGfT0o9kiBeJnmYQzqgYfFpLX?=
 =?us-ascii?Q?8WO8anGolrah7uhI4rCrdjz1r3TGrg2pWNB23zl/0Mh/Oocw0vj/JTDoSIOC?=
 =?us-ascii?Q?+8bo6JuxqZ8mDZOZNYKeVXQZaegYniHjMupe1IHM5NV2hHrI6CIVwzuHudv2?=
 =?us-ascii?Q?f33Vzh4TYj/9YhiJ0WpKNkcKoMTPk3npJJezc/svAFZmZdkffwEMkXSdo8oI?=
 =?us-ascii?Q?L27qit9yoe+jglklsGyJEhiZ03+uVCxNlXL1A9ai12Bp20WOIQFiBFsnIbGb?=
 =?us-ascii?Q?BCYA+FWTHJQYGxISyEhnjVq8jYNAITF1cDK801i/LC/P0fVvo1yQA1RWkcWF?=
 =?us-ascii?Q?XHqXaWD83CbIC7Pip4oh6PqElva2QsOPDz61I5RcZ7o3yH5XnRfzXFAyPafw?=
 =?us-ascii?Q?ggkl9EhpAdI/i+/sLMBFrAtCIswLIRX/8HGrLB5S3OqFs2SpSEsmcezCtDZH?=
 =?us-ascii?Q?phfWFeNZlurLVL9ZyT38YAxXwDkJTCM34KmNQqizUA1Ih6Moc8x3WXINXcuA?=
 =?us-ascii?Q?HvhRPzg7CeLjWKzDOL9C39c7atogHvwHRHpl1FjFjhhTQpOKuE2LGSLGhQLF?=
 =?us-ascii?Q?+2oU6FjyAb8Knod8ebcWbFQ7eOReA59gRdCZApkpKuq7dYOHEOMwzwOTrM1C?=
 =?us-ascii?Q?Bnd8l4rQN+mSO4OiFpVr/IgnzrkjZ64GD2MAaMIKV14wVI/oVjYHIxZ8zi1G?=
 =?us-ascii?Q?HFdbCkBBvIfuCiopfAjK6tcQn5fQU3sh9Z81r3dsYgNUpWghBrxuGLdgPjLV?=
 =?us-ascii?Q?tvThTKmq7DRFTsmaIUQ4QNg0r7iCQyrCbXZcHs26sIAVgfuXqxZf/Eraesrn?=
 =?us-ascii?Q?jCliKvLgeG7+KqvG0YANPCbgqpuYT7xx7lU7VlXavQS1bwR8Qcg+Ar4KoV+e?=
 =?us-ascii?Q?0URSme4LXlVuVWuUsUBEUF5wuuswGgZqkhRe0c4EiCLDLBcIpZ66el+1+AyI?=
 =?us-ascii?Q?Ye7O9gMqc58ZmsUCwmL6B3YACrr7a6PZ9Lx38q1CMAOjF7xHUlVe6ZtFGVDt?=
 =?us-ascii?Q?mUxMl16z9Yp335acan2vwaMziM54cD29ZVsEsMX+kRnn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB6003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d5f67f5-beea-4bdf-7b04-08ddbd4a9180
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 11:36:52.2209
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /dohaVX+0UJWsvZcE7H7hJFWAdNMZGDK+t9c8lKyKviZ356VTQXbJYtEChxcVfYBj00lRjAKHcto+MVhFyCwfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF3D06B1BFF
X-OriginatorOrg: intel.com

The issue arises from redundant functions when CONFIG_SMP is disabled, it w=
ill be addressed along with other feedback in the next version.

Best Regards
Pan

> -----Original Message-----
> From: lkp <lkp@intel.com>
> Sent: Monday, July 7, 2025 2:53 PM
> To: Deng, Pan <pan.deng@intel.com>; mingo@kernel.org
> Cc: llvm@lists.linux.dev; oe-kbuild-all@lists.linux.dev; linux-
> kernel@vger.kernel.org; Li, Tianyou <tianyou.li@intel.com>;
> tim.c.chen@linux.intel.com; Chen, Yu C <yu.c.chen@intel.com>; Deng, Pan
> <pan.deng@intel.com>
> Subject: Re: [PATCH 3/4] sched/rt: Split root_domain->rto_count to per-NU=
MA-
> node counters
>=20
> Hi Pan,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on v6.16-rc5]
> [also build test WARNING on linus/master] [cannot apply to tip/sched/core
> peterz-queue/sched/core tip/master tip/auto-latest next-20250704] [If you=
r
> patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Pan-Deng/sched-rt-
> Optimize-cpupri_vec-layout-to-mitigate-cache-line-contention/20250707-
> 131831
> base:   v6.16-rc5
> patch link:
> https://lore.kernel.org/r/2c1e1dbacaddd881f3cca340ece1f9268029b620.1751
> 852370.git.pan.deng%40intel.com
> patch subject: [PATCH 3/4] sched/rt: Split root_domain->rto_count to per-
> NUMA-node counters
> config: arm-allnoconfig (https://download.01.org/0day-
> ci/archive/20250707/202507071418.sFa0bilv-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project
> 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-
> ci/archive/20250707/202507071418.sFa0bilv-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of the
> same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> | https://lore.kernel.org/oe-kbuild-all/202507071418.sFa0bilv-lkp@intel.
> | com/
>=20
> All warnings (new ones prefixed by >>):
>=20
>    In file included from kernel/sched/build_policy.c:52:
>    kernel/sched/rt.c:496:21: error: unknown type name 'atomic_tp'; did yo=
u
> mean 'atomic_t'?
>      496 | int rto_counts_init(atomic_tp **rto_counts)
>          |                     ^~~~~~~~~
>          |                     atomic_t
>    include/linux/types.h:183:3: note: 'atomic_t' declared here
>      183 | } atomic_t;
>          |   ^
>    In file included from kernel/sched/build_policy.c:52:
> >> kernel/sched/rt.c:496:5: warning: no previous prototype for function
> >> 'rto_counts_init' [-Wmissing-prototypes]
>      496 | int rto_counts_init(atomic_tp **rto_counts)
>          |     ^
>    kernel/sched/rt.c:496:1: note: declare 'static' if the function is not=
 intended to
> be used outside of this translation unit
>      496 | int rto_counts_init(atomic_tp **rto_counts)
>          | ^
>          | static
>    kernel/sched/rt.c:501:25: error: unknown type name 'atomic_tp'; did yo=
u
> mean 'atomic_t'?
>      501 | void rto_counts_cleanup(atomic_tp *rto_counts)
>          |                         ^~~~~~~~~
>          |                         atomic_t
>    include/linux/types.h:183:3: note: 'atomic_t' declared here
>      183 | } atomic_t;
>          |   ^
>    In file included from kernel/sched/build_policy.c:52:
> >> kernel/sched/rt.c:501:6: warning: no previous prototype for function
> >> 'rto_counts_cleanup' [-Wmissing-prototypes]
>      501 | void rto_counts_cleanup(atomic_tp *rto_counts)
>          |      ^
>    kernel/sched/rt.c:501:1: note: declare 'static' if the function is not=
 intended to
> be used outside of this translation unit
>      501 | void rto_counts_cleanup(atomic_tp *rto_counts)
>          | ^
>          | static
>    2 warnings and 2 errors generated.
>=20
>=20
> vim +/rto_counts_init +496 kernel/sched/rt.c
>=20
>    495
>  > 496	int rto_counts_init(atomic_tp **rto_counts)
>    497	{
>    498		return 0;
>    499	}
>    500
>  > 501	void rto_counts_cleanup(atomic_tp *rto_counts)
>    502	{
>    503	}
>    504
>=20
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
