Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDC822F75E
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 18:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748542484; cv=fail; b=lJLh0+dEQu8vZzRryD4l+cioRBm84aeuxExXOfANmOZH137XrtykFWRAlRXN5FpYFvH4WZ3ewvyu5MAq3Q1oeawEGhq3H2bFS+7XMSa20QsBQNyTH/fwAso7Br+dz7SIsbWrzIQWQ11i3JnCWj8JALlohqQ9rW7zVjZkcj/oMFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748542484; c=relaxed/simple;
	bh=wj2vtsYYxi0eCVuUKYLyUdQSz9t5UbZZ7RguJDtKKHQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iWAnhKmJE0RfdjYmXoK0XURadQMqV+/m6EJjhdvyT2tbJU14mDHxW/+xlZBtO7ZpHohlYU4LPewSrEuw/UtKcKSKWCCzUUukp9eTBWXiIzhuWnzF2oK7C9Z5qJCJeHTyh0ZiNnrUpoOHbjA57KcnzmM0EJjB7na85WhUMK271yI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgxV7qf6; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgxV7qf6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748542482; x=1780078482;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wj2vtsYYxi0eCVuUKYLyUdQSz9t5UbZZ7RguJDtKKHQ=;
  b=hgxV7qf6EjmyUtXVGNkkA32vk3argExIxxo2i15gikasrRrELeStkS3V
   eGLTgHeyvOStrbMJUNkBPz7uzHxvPpiat6z13gwRhQakqYYig4wtx48da
   vor0Sp2LKSFh9gJI3PKyLOKKADQLI6Aq8zpiZdvzR/ffvYgGXs1Gbpeyr
   7eZ7GDbH1EyqL6Wc7sPGj+mcEbKAve3cwRSoRhk93JJUwSvTC9/Z0eUdu
   jb+se/53odu7fTztmrptPWUK7hIm1bwIes6Dt1D45Hdzp0QXLsoobuCb8
   0W+ubh83z8S3cVnFjoVLMc89325GEOJ1ZtwC/RB32EaG1qurWc81myVa9
   g==;
X-CSE-ConnectionGUID: Sy1YU8nvR4y2hepOasUadw==
X-CSE-MsgGUID: +0ieTdh8QrmZjODMj213RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="61968469"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="61968469"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 11:14:41 -0700
X-CSE-ConnectionGUID: YKWXh1caTvSASWM0b5DRqg==
X-CSE-MsgGUID: cnazzWGHR/epBm/ehCL2TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="166813855"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 11:14:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 11:14:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 11:14:40 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.65)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 11:14:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nK4U/LWgr9ZI/4cdpa7RMvhdBRqdt5koEELP2IcH6PvURiT8dbRMn0Way1R0KNtl2AJfGpa/2dMMk+V4ZPRRrYwwAqI7VemBgiu+xxxyTTclzgv5DtBDIqs1W+nuQirqiSsC8Q0c4XbPKpRCARdtr6smSzn/bdMco+tMZEgOLVLGHL/l3HhjvnS9NE+3Ve8uYTSq0mp+PXW1ud2ioo7oXeAz1as2Foj40zVzlLPW3XKKuZf/3MjQ+NdMiDn4xb2me3RT+1zLXnSPu85BTzXKcaCgB36v2LZGmUAPUb4AERbEP70A7jcEP6OR9CGr9Ij6exGn3XBSEEw09fwJtuBkqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wj2vtsYYxi0eCVuUKYLyUdQSz9t5UbZZ7RguJDtKKHQ=;
 b=vCsk4kojZxud6a+yIyupZDgvdE8qyjXjQzGsdNokDx1nakVahm1hZqWzQIaSiiEFM8TFlLyHainsLvalJ4l7ReXwroaCTGgdBqRm2fB0Pllm4yXeqqs1N/gR05WI15NC70xTs3F8U3fGNq54EGbeqraYjUx1QiMRObJFKJy4coQcbTiVv1k72TbTMmTOoy7QmQ3javQDRzjO2JXgwLn0v4klN56fAfK3kyKVWxQraqgTTVBExCOOVmGIeLBjeux1g5QSCklJlmwl3AzMUwUAgZdaiL5nSy10fDgkvDvejc2cwgpRSlCqG++ZvVnEO2jfqMHGeuVaFUARDK2GLN7LtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by DS0PR11MB6376.namprd11.prod.outlook.com (2603:10b6:8:c8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Thu, 29 May
 2025 18:14:24 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%5]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 18:14:24 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Qinyun Tan <qinyuntan@linux.alibaba.com>
CC: "H . Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "Chatre,
 Reinette" <reinette.chatre@intel.com>
Subject: RE: [PATCH V2 1/1] x86/resctrl: Remove unappropriate references to
 cacheinfo in the resctrl subsystem.
Thread-Topic: [PATCH V2 1/1] x86/resctrl: Remove unappropriate references to
 cacheinfo in the resctrl subsystem.
Thread-Index: AQHb0EgpT37B8z+4HkOA6LdmA/EKQ7Pp6QuA
Date: Thu, 29 May 2025 18:14:24 +0000
Message-ID: <SJ1PR11MB6083BEDD3F7625B52E677647FC66A@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20250529031650.63880-1-qinyuntan@linux.alibaba.com>
 <20250529031650.63880-2-qinyuntan@linux.alibaba.com>
In-Reply-To: <20250529031650.63880-2-qinyuntan@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|DS0PR11MB6376:EE_
x-ms-office365-filtering-correlation-id: 0f03a985-e38a-4ce3-10a2-08dd9edca43e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?f8bYSqnbqac1UALgHDko3I+1dD8eZGR0HsK7K/zSpAPMDHyPX+dYH5WcFsis?=
 =?us-ascii?Q?4cNoLgnXADofiUCFtxGk8oPxNV7O+MYndOw8uvy+tQKFEtr9wQ6jbyN9KQPD?=
 =?us-ascii?Q?wONVuP1VHTS2aEynUd9j2jkPvMUZnPpqqoSkst0zVRScOIGbXo6fbIPy+ogf?=
 =?us-ascii?Q?UryH7EkoFMXyPxphGspukMW25mW9Tpu1XtG6z437Km0Z0iMvZN0km20fxSw8?=
 =?us-ascii?Q?YFXgHgvJLAEMelV+vBaGurg39PK8T/eysaXJ42sP2/mZlSDBn65a0IQ697bn?=
 =?us-ascii?Q?lNUn1xN7tgEtRUM6wg//BTVLbBHv5ZKS0lpj528rGgdKaeYY408E/tZjw1Sz?=
 =?us-ascii?Q?JClwkTMOK1loG3XoU8Cvm5YixrrOIVr/P01Za3dK6kle+RPtF0X/BhzDNiCX?=
 =?us-ascii?Q?Yiwq9QaupAwVDifO6A5a/VsJbit4FfTsbBTdZtJgwKaFECYIrxQ9H3IGaKdZ?=
 =?us-ascii?Q?kguzReikr4cAVXzibS48GNEu55yCP0wRX/me9wPG3yRpwp/AQq9lHmSw4ZHx?=
 =?us-ascii?Q?Cz4yjZ5te2/QojcYUtDuIeuEnKbtROxa1rnuU+xgWtIiMWujdHxyfvi6MSGl?=
 =?us-ascii?Q?Yp1ezmEbt5VGTT1fSAhNSV0UiCPpZbDFGlY5FxVj+0iP2n1xkfv+FDENRgxn?=
 =?us-ascii?Q?cNKVCteQYQ3DNHC0l14CRlt/Yp077V5VbJ4cg2c5HKPRT2ZABZTMXb103E2G?=
 =?us-ascii?Q?+qrDRR9kUPWMOn2v2rB06XOm8apaAMEUH0Mdu29Lw4qiGJLPcEuJfKV5qb93?=
 =?us-ascii?Q?AcaIW7BX5R75H8zhbXqbrE+MYj/0/UUWOndiLf95JF6hfVLTGybl1L82iW1K?=
 =?us-ascii?Q?dVbyrnY5eUsJYp3V289N2afZYyFC+2Yv4/dDxuRRO9VL5wNsKx5gK3/81eEe?=
 =?us-ascii?Q?qgzoUOT17WNISD3d34QiYKv07G/CdcgTxxt1CkYRQJOqdeCdmucC8UaZMm6m?=
 =?us-ascii?Q?7/xLn9U+A7IH0VjWaf8m1m3Vfb0Pxe5KI3p1GCQgoyTcxN8BU3ezRC4zxxgx?=
 =?us-ascii?Q?64Doh8+kLdmxbowKA/FlEnuSPJs028L6SrMkNddLlbw+C6JYD2XfP8rvp/5L?=
 =?us-ascii?Q?ZIB7lWjLLU/1BxLKv65i6tXowAVulTtzV+jHAgZUd9jUSw9kxzidNwRV+45G?=
 =?us-ascii?Q?XPfPQbpyHIy6AD24EzOx0bAo84ws7JSd3mNwM0R+93RrvOPa03cUEFUFA1ZH?=
 =?us-ascii?Q?bi4xt1f3h5pAUAHDyWFwfbBBce57wgvtmqJ3Ac++cTzXv7JE8W3p7ViEXY2X?=
 =?us-ascii?Q?3xE8NiljWsnKfRY8QRS6UfXjbNsmZ9wLsIkg1LD46z/gf7tj7aNMkD/6U5ur?=
 =?us-ascii?Q?l4QbguTOL9iJ6cuWx6JXzRhgJLPq8VxrFRC6LT4tWLs1HiCxpdh45LhwZXjl?=
 =?us-ascii?Q?6zFP96wxyvERsQfsgh0R6KOAYKVb1zYYxSW+nHFYqspLT6qXNc/8Yxybb6XL?=
 =?us-ascii?Q?ibJDkeOzheE1b6mY13RkSNvFS5rQeW/VAw6qenS6pum7E5TuMdbGeHoyallC?=
 =?us-ascii?Q?tAo43fEAmuS1XKI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nd6Bu/ZTYPZb+Ruj/JGf2pfiXrk+tZElBvTObS2T37elWlz9Ey0utMjmnp4X?=
 =?us-ascii?Q?O7z1XjLS1FYgGLIs81moqLMgAKC6W0HfKX6KFxQ4qTWX5K0BB5D5W8ZWniZk?=
 =?us-ascii?Q?dbPTmk0M/b1YaFaeGst64tgM7iAgTu89ro0oP/SNfREtY0pPlKzOxGoQvUrT?=
 =?us-ascii?Q?EeEoUWaPLFgTaUMbCA3LOzSz7iUQglmn+EyRC8klEC92eEaps5lalLUXfjba?=
 =?us-ascii?Q?eoQUDnV2+9OEQsPnwg2ayd8cH49iQ0IRvopRutR7G0J/LNBHV9Jo7WtEE2sA?=
 =?us-ascii?Q?gqK9jS8oSbGyS3Hk6DL2b07stUNkfSgdaS7EUxS3p4akypIhfprPQbJO+szJ?=
 =?us-ascii?Q?0lVs8nw3g9tcEV8l8UksYgS/k8SAg8jgw1L42DrXGgS+Oc23TjrgDxIippf2?=
 =?us-ascii?Q?G/x2LJrTkdxhOi6kB7tp+ZaksIME9d4I9bAzBjwScdYdJxoN9VGWTVhu1Ov7?=
 =?us-ascii?Q?mAMPVO8zgQHwFv/SJLw45OXO69beDAgW/l2tPDUndIE3uWLCg92EZLTbpl16?=
 =?us-ascii?Q?ZQ3BdBylsmvp625QWYMs/c1flm214N6l6ciki6Pu7ZavljzinWib1S9YD/oU?=
 =?us-ascii?Q?IJ5L6EjJ4rFS/YS+tAegAQ5OjgIJU4sfrCYyIKWrcWWZ3+vLlx/BBc3hBliO?=
 =?us-ascii?Q?rVQTPja3pgvX1EzAvqHQkoFM3Yjjr2pL77/RnZJA7M1Ev0bRk8C0GJwnqbb1?=
 =?us-ascii?Q?Y/fGSBpYRIpPOoDt8iRUY0cnrZZUOxuNtPg7pSFcbDPTGYRNyoV19LC2BfOH?=
 =?us-ascii?Q?CX4zfCmIMaxs0NiovKeu7p0pw7eiYuq3+yEQMW8OyFhRaY1bNQuKn0ll+99A?=
 =?us-ascii?Q?zE8SYeDQNMvkZN9UZpomrBynaG47+EIPLdDRx93m2nSk8s8OEQEAkrbVr82q?=
 =?us-ascii?Q?CRAqrsYsbCSA4ff3nJOKk3CVIhf0a89xHFXUP1IRYfeQII7k+bKNfMJfhv9a?=
 =?us-ascii?Q?wSqUQyeEHtiv/4qABSITFZj+apXBWQ/HJb9Y3XhJyXGVvDYQ8/ilI8eVnCto?=
 =?us-ascii?Q?BB2H/2zvyf/7bE5HD9lR7lrMv4kpTbgSBl2wUyJExLo39C7Af69Y6WF7xuc3?=
 =?us-ascii?Q?kUKiPowH1S7aiVUY4lCLHKA6hn50sxYW3rVW7CL1c8g3n6NdCZFSDASNSB4m?=
 =?us-ascii?Q?QND+WSDWEwTJLOEDbgOPrCKM1p5DEyzft3bXzgrwbESO3zbP1FgJKJCw4ihO?=
 =?us-ascii?Q?uOoa+dLSCzwMsRBW1eGRA6gAc9G24wNulF5wGfrH++dTpOM6aF+NHSf86msz?=
 =?us-ascii?Q?AR8nWaaQf+ZvCQnqFuoybNJIRCLa1GmaF3VIvlwf1Xd5vASEsjymAl87coGX?=
 =?us-ascii?Q?i+/OjhWjZeu/cH62UUIGTQMYoA9M0P6fswRazEo92UOGDR1KNrUKmLHxT3Ei?=
 =?us-ascii?Q?ID7PsJoV1HNvRAYAiurpzu449ACSUkVsdoONpqn6Cg2RV6x9+oMMoJeTLnAJ?=
 =?us-ascii?Q?LwehsO0XKwnfwLxjnUE8gXob3FXoufnltDTmjkGhap3Cb2/lLfokQIzor1Ak?=
 =?us-ascii?Q?qGfGLxJC7GQbRKPPJ8fEx2H0PJFPHB4oJtEeNnWCjPdeM3757PUfcpyYhDif?=
 =?us-ascii?Q?QK2SFf33DhO0STWMPtm49en6igNz8xzlu3/7Lxxz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f03a985-e38a-4ce3-10a2-08dd9edca43e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2025 18:14:24.1404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nKhOC/aH0FnEBTdYUJj2oUI9nwK+YsvOND8yJFVXjokQR+pCut8XW5TqP22wRLZBQhNFyGu0Et9emhm9Um0mOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6376
X-OriginatorOrg: intel.com

> To resolve these issues:
>
> 1. Replace direct cacheinfo references in struct rdt_mon_domain and struc=
t
> rmid_read with the cacheinfo ID (a unique identifier for the L3 cache).
>
> 2. The hdr.cpu_mask maintained by resctrl constitutes a subset of
> shared_cpu_map. When reading top-level events, we dynamically select a CP=
U
> from hdr.cpu_mask and utilize its corresponding shared_cpu_map for resctr=
l
> to determine valid CPUs for reading RMID counter via the MSR interface.
>
> Fixes: 328ea68874642 ("x86/resctrl: Prepare for new Sub-NUMA Cluster (SNC=
) monitor files")
> Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>

Took this patch on a test run on a 2 socket Granite Rapids system configure=
d
in SNC 3 mode.

While monitoring total memory bandwidth I took the first CPU on NUMA
nodes {1..5} offline. Monitoring kept working. Brought those back online.
Still OK. Took all CPUs on NUMA node 4 offline. Still good. Brought those
CPUs back online. Still good.

Tested-by: Tony Luck <tony.luck@intel.com>

-Tony
