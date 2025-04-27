Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB800190057
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 05:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745731899; cv=fail; b=DB4p9J0/oBrq0borgEIlJIefFIuv591nmEmzk1XyiGAQwrViS+cNFftquG8Ubx25PdUrSZM4YqE8aJQb2NbVxH243r5J255Gy993QwtDhulH/YcVwqesIXk9wEndb+RzxRx/CgcxRBzwdIhvKRKMIlVo/BFrlpNIAxzzTaGXRto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745731899; c=relaxed/simple;
	bh=bwNmfU4/9lYS7uQLztHmjsIzSraS1LfbV1j9SC9L+2g=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tGDdCfFoEmCVMDFh3dvhEK57oxoGghRFxtqLDDl5/wLS6EUAs20agRbcsgjJcw2cpbxrdwhZsXNYeWUXB74KpoWtJFqxA14002WwV2Vlux6Pvtm7o9JX3cN2EY0AzLg2Ekaeinse3HtoeCjiAzmb9icDXnVLNHaCBOx1XpFb2Uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oBAPk1dF; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oBAPk1dF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745731898; x=1777267898;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=bwNmfU4/9lYS7uQLztHmjsIzSraS1LfbV1j9SC9L+2g=;
  b=oBAPk1dFS7C+fAnfAJzHZ+h/bUxGVfsaFcp21jkBKBhEEX/24d/N4oiL
   27ScqOq1/mXdiTlVnfTVXucN8eleOF73MsNRrI1FGxDS1nfq7VJIFyil4
   /UTD6SoWXcqJg20IceNayMHFSqtrysZeKAcpVtWBRqcT6XkDlOEcsnJeI
   SrgLKw1Mi1KDnpraOlvM6pBpoKfTtqJPEBc/jbwFlaFTWxKDpamfblf8K
   IQn4kuL4C9DfAaBR5LMO6NyCmU+cNhjqoSrHNerJhiXWRF6mw8IAi5VfD
   Rwgy1UdSw+frlB98UHcT6kF3PsCf7pJpdNR+VitzdsORrCA21wSEIde0P
   A==;
X-CSE-ConnectionGUID: VD+q65sLTWy+WmeolOV/4A==
X-CSE-MsgGUID: 8EMdNb/zS0WuGQEVrp9POg==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="57537493"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="57537493"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 22:31:38 -0700
X-CSE-ConnectionGUID: I9GZ4fW5RduTSgAKYisb2Q==
X-CSE-MsgGUID: W1FJfFy6Qt6zLBTUwmZfOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="133116142"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 22:31:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sat, 26 Apr 2025 22:31:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sat, 26 Apr 2025 22:31:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 26 Apr 2025 22:31:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SpkG3HafEmBq/NK8sb2oubBXwI8KTXz+rlMKPwkmmqpsyM5TVZ3NelJy/WHIwG1kYxIS/ILG8LqepOobuUUSJBxVj0egQ2igqz/p5+IDWqxgF9HLS4kZ2p/1+uAXOXjQgrI2m9B6WQV1Rdw+n5QGQ6MJ0gJKfKPZV1raFnTK6L5rFrgj7Ugwi8GzVsGVAKmOhf9aHcVP3rdEX6GE+N+mI4qwHUWUS3XGzcEa4XK/qj3n9vpa9TmCP5DMGQXxcQFS+n5ZePLK3PNYW3vukX05FoyfcJO5hI1EsVuBBBnFlTZ8Cc6Vt6IC/NanjpISFD2MD/oWLmZcCmk6F9JwM4XNKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvGhm8e37fG5ceRYUC5KSP0p2tb64R8reJsB18kbWuk=;
 b=mevHrJIFJGR1meLwg/Mut8+rGnk0O5Abf+EoX0ajadfSsD8lhYe00gTWhNIOXPiV5oCN2OORsGVbvd7FJGFgEI0feml2e0EmPM1v46j4/WHfPtnYyernwXhBt3uXOYD1Mund/9VH/Li9PvKoqda2InC5u9WmpDrvdXywzgYLSpFjvDYzfV2q7VkMxCZyt7Wm5nuYMJL8UWljbDtvnddcOtqThX+eI1hCxK6AOUQIcYExOGeuwCJYrL224oFu7DbENXNqrECdFCEgbSzoGt+2oEVPtt+Qx4RH2fHSp+YepMH1AUteQ+e/ORrxAj20ey3n7GuNBrpHJY9aqCJLXQzIgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ5PPFC15A51B16.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::851) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Sun, 27 Apr
 2025 05:31:19 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8678.028; Sun, 27 Apr 2025
 05:31:19 +0000
Date: Sun, 27 Apr 2025 13:31:11 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: Re: [linux-next:master] [rcutorture]  ddd062f753:
 WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_updown[rcutorture]
Message-ID: <aA3BH+UzbypCXaDZ@xsang-OptiPlex-9020>
References: <202504211513.23f21a0-lkp@intel.com>
 <9db0175d-eb50-4534-969f-35afaa677927@paulmck-laptop>
 <aAcixqijvHL2ihHS@xsang-OptiPlex-9020>
 <4d8dd409-259c-4775-baf9-e272cc5238e7@paulmck-laptop>
 <aAmYzAsE6fPz5uaB@xsang-OptiPlex-9020>
 <5863ed5d-81b4-452a-a929-d68c26d6d028@paulmck-laptop>
 <7f32b085-c9e9-4686-9a93-539080cee9ab@paulmck-laptop>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7f32b085-c9e9-4686-9a93-539080cee9ab@paulmck-laptop>
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ5PPFC15A51B16:EE_
X-MS-Office365-Filtering-Correlation-Id: 6782e0ea-e2ec-4491-9566-08dd854cbd09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5CmkW4q1oy9YEma8ebiEPMpBx+4aL6jawtKLpiE+66ZGlppaAnG1RcRoNjdS?=
 =?us-ascii?Q?hJUGJC6zLm66ty6+rXNtD0SP/9yySfI6H5uq2Ozo+vL5+cNkfKHBI4EhTd7L?=
 =?us-ascii?Q?gJ4+Lfj0sPTjFHJ2nYjyNPgKdnYKlW7zRO9ItDS25ukaK4dbZEsdkwdSdsVV?=
 =?us-ascii?Q?CCYYgvgHE21QVCdtzp6zOWjsJLZUJMVQ8mUGr9gUb7T0SfG3QZNnEeBjMl1z?=
 =?us-ascii?Q?BIqrMpzeugL5MBrRGgh6liPGldSRb1HQs2MrAtZM3xfb8vnhK+6dEmXh6Bk9?=
 =?us-ascii?Q?7Nt+nn2DONIwQcBwM0ptn7UlkjETx/3bzs3m/pkDtHMe8XvSB9ZcrFqEozl5?=
 =?us-ascii?Q?L4TIwCob1zWMruI9DrwdLD1P8nPP6YNd/7ZeGTwfqbsipH+yrHqiy5rLZinh?=
 =?us-ascii?Q?QhjwOXz2cSB8kJ9SwdO1ItSzASHcK8FlFVUy0ykm9M3fcOEa1q0g1Ph2C/I2?=
 =?us-ascii?Q?XxacFNvtGyEbiDQ6X7n+qbIsDHkSrj9WkobhhUcn5+I9Y6RcAoTO6cy0+33Y?=
 =?us-ascii?Q?YZfyoN96DiGr0KPMfzZwYUgXehUQTaoWQZRzIvdy8s8oruiAko3cwY1hSHxk?=
 =?us-ascii?Q?4sJZM+GJ8odTVJyKmJsIa3/l7AMucf2rN4Rt6fc7Tl/aXgycG4WahYQGTxCk?=
 =?us-ascii?Q?zNwOqpSQLnzUnvwoQcH6ElIjxIHePI5IRKrB8l+l553oBB8P4Wer/xc75qXQ?=
 =?us-ascii?Q?t5UA1d9ImPVjFd9aMQYaPxMBpbU6tW75ucGU6eJbueMXk57e6tMx2p87SlvB?=
 =?us-ascii?Q?Odm1UgTRdr5fNy46isLt/StGZBQ8b8ISxItVueBSmdNVm27bPbw9P32bcTHS?=
 =?us-ascii?Q?kO8ePwayJYxSz8HVnAwx0xS+xyS4mxY2Y6Hs30Pm2D9D3RtZBZqO1MSYAt2y?=
 =?us-ascii?Q?wIvsDfYf4/VjPTBzt5uvf/X7dwvxV9LrRNv4zfe5upL4hkE5kfCBRtSN1c1S?=
 =?us-ascii?Q?6ImGtWwLuJUM7B1BvUoBjg6Bd21fR6A9DQ4mQmW2p6UjH0qLrYFy72TOh/gG?=
 =?us-ascii?Q?vqtvx4wd80U6mVNeTPpmW8ozwNJ6gqVYl9aDdeku9UFavVFErFGLqwUqXJeH?=
 =?us-ascii?Q?m8g280K5YrEzf3F8wjlbG4/sSHREuq8sx/vYQJClxcD4CRpVwq9g1q1dxFai?=
 =?us-ascii?Q?+/uO9VlUzpsddcJfx2JhjWjAnUdhMTSBUo8D96IPs3FPSqjc62rnn/qHZq8O?=
 =?us-ascii?Q?048f4kKVgWa56p3953fhcMYmMLvuqw0HGFFED57hBwndV4DusehtshMJK6MU?=
 =?us-ascii?Q?2G7CAFwAXHKxsai8mKNO9zrbgtiQdockg+PXXm0AFKs5YUTM1478txBrovqn?=
 =?us-ascii?Q?5HyixTZLZF2ljweFydeeTkPLZCTrcEaBHXE97Q1wME+PZU7Ob+smvxZ91IxM?=
 =?us-ascii?Q?VyMLjH9D8JoNO13oj3FcEugy2ZPE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Fj1gzaM5aHiv9qX7CmAOhhULnrnqIiZzRe8LYAwQbWOyqrX/hScd2uH80gH?=
 =?us-ascii?Q?SLXoD79+LfumAP2L1Ej5dfRYSaaMhF4Bh1h4bdYWu3mq/c0GHDMWn/Q1SeG/?=
 =?us-ascii?Q?b94FzlKbqihTgcwTeKz9Ltm7jhsvw72K28JXSxpxuMIuJULrGKulbaBqJEDI?=
 =?us-ascii?Q?0+G+o+SpkhoUym6KQgHfVBRMuhCEO+VLTXekLbYjJb4Dbn5XEePMR08SbxPa?=
 =?us-ascii?Q?AGqauzNJsDhsJQ+A97FtQ7QGLsylV7VuAX67R2NsYKLMq3vidLFeqR3SawaO?=
 =?us-ascii?Q?kmWZ4LwL4R2D6gbcWJR6hBl3t7pR1U3I/r4mHDzMH/TwUv08BuVi/X92aARk?=
 =?us-ascii?Q?+RkaepB7W3BlzYQ9sme+H5zYRBlOVKjTVVlcGMMGMAI0gR5BqmwVxK3L2du5?=
 =?us-ascii?Q?Ic4Ki26YZ6TLXXappYzV+4yoCVSrxD98avTgK3X3+EQ8ocQREWOB/0yfsd11?=
 =?us-ascii?Q?PQ/pH5o8YoCln8rLXBu1TBnwRpG1+hcVeW/1la4df4Tz4FwpDVUhFfqa5F/Z?=
 =?us-ascii?Q?ufzghVCsqQ6u7IaQrePYKNGIEgG4vVuA28k4aLTzct9kw8yY3B2swlqMaRE9?=
 =?us-ascii?Q?EQ9ClH2zmUQdFdMYpRntbOrBEoMRu0KTbVa8JsJlkcbZ5EzkpQ6wBxAHuEZH?=
 =?us-ascii?Q?LWVDeJIOpeky4DYqsVUr09c8ttyNrHBrH5t/TiRAzaFGnFlqpRKjZ+fWYDuI?=
 =?us-ascii?Q?KB7EPL3cFqKZS0H2sfOAtNESsrPAFTuEyZjkovFvfOGvb69/m9SSc3GoC9SQ?=
 =?us-ascii?Q?OCnRgRrtAsZs6/ayrS2kl6gT1C0eJH8Dc4aL+2RNw7zSA/X/UyJU/3TF7ZFn?=
 =?us-ascii?Q?KCTNeM5HamflojPdgeujKsMGfVxbcD8QJdhqayTRTMesbDkqKSz3eE5HsTvw?=
 =?us-ascii?Q?xuE0wjNLt/nkKnrpuYWTzCnF/GRWxnPBXAia1vkSd5kUbtbsSGjF3zUiq7wl?=
 =?us-ascii?Q?yuV7G1ItqDldA2zuPl5V3JGGZXyYW2KuQxAqg3ztBG0R5aAg32i8Q6ZLcTvg?=
 =?us-ascii?Q?uHyF3Gbz+XjZJ5sCictgWYsCvJxe9heEHUwDihEWf3gIVNvsfb7GlpYx0sOR?=
 =?us-ascii?Q?BwXMGkqx0aUc+NbppFVYYBgy/whRzX8GsO9kofzrB0dpMEHwQMiDORGkq3MB?=
 =?us-ascii?Q?TbiSBIf2FhvfHzhlXDgzZjBmSCJdmg8Jsd9sHkyLHC+0hkMbCAs9BZLMiyK9?=
 =?us-ascii?Q?qPenS3NikZqgLGEndIC7nmC70CkPTg2/wqdI5Ot+DeUMVgGl68oNt/Xer7Jm?=
 =?us-ascii?Q?YBb03u1Uo6Du8XEbl6Hmd6939dZgM53xC3HqXCOao4IrDLCRv8eWeUJsC69w?=
 =?us-ascii?Q?YEQWlvEw6oSo+dlDisF0p0oOHCuMh1x4u3o6MVUVeHqBYTMuqKxtm8g58aJk?=
 =?us-ascii?Q?xX6ksIIS97q/SAhsGR6C3SyIxlQOAXRAd4OayycjBE/UwAveH4jsbBj4qEtm?=
 =?us-ascii?Q?LGgqBwXDjWigzUSSgy5FsQIV17PZgXjp8o+M1hjR+48hW6RgQqbNu4im3maQ?=
 =?us-ascii?Q?4CLC68L9FbgNk/Xj6EphYfh+XHypdL24jxTHCLi5p6XjudurRkPKsN20xCOO?=
 =?us-ascii?Q?IMCl0tVJYRCYMLV89/T5I0C/HE5Bei76MKTs5ZlgiX0dyiA0ji7VnXAqDoCu?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6782e0ea-e2ec-4491-9566-08dd854cbd09
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2025 05:31:19.3745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eR2hWhWOt4IAjb/I2c7/6Qveg4sOQoz6KmhJp5Ws67seuQUcjIMRI6Qtn62m7AyQMHSBO2kyFF2PYWJVfAchFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC15A51B16
X-OriginatorOrg: intel.com

hi, Paul,

On Thu, Apr 24, 2025 at 03:56:09PM -0700, Paul E. McKenney wrote:
> On Wed, Apr 23, 2025 at 08:05:53PM -0700, Paul E. McKenney wrote:
> > On Thu, Apr 24, 2025 at 09:50:04AM +0800, Oliver Sang wrote:
> > > hi, Paul,
> > > 
> > > On Tue, Apr 22, 2025 at 10:54:10AM -0700, Paul E. McKenney wrote:
> > > 
> > > [...]
> > > 
> > > > > > > 
> > > > > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > > > > the same patch/commit), kindly add following tags
> > > > > > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > > > > | Closes: https://lore.kernel.org/oe-lkp/202504211513.23f21a0-lkp@intel.com
> > > > > > > 
> > > > > > > 
> > > > > > > The kernel config and materials to reproduce are available at:
> > > > > > > https://download.01.org/0day-ci/archive/20250421/202504211513.23f21a0-lkp@intel.com
> > > > > > 
> > > > > > Good catch, and thank you for your testing efforts!
> > > > > > 
> > > > > > Does the patch at the end of this email help?
> > > > > 
> > > > > sorry but the patch does not help. one dmesg is attached.
> > > > 
> > > > And idiot here failed to check for the exact same problem at the point
> > > > where the timer is queued, so thank you for bearing with me.
> > > > 
> > > > Does the patch at the end of this email (in addition to the previous
> > > > patch) get the job done?
> > > 
> > > unfortunately, it still doesn't fix, one dmesg is attached. part of is as [2]
> > > 
> > > but I applied your two patches directly upon ddd062f753, like below:
> > > 
> > > * 1c91d0bd4809f (linux-devel/fixup-1539a7e7b61a9) further patch for ddd062f753 from Paul
> > > * 1539a7e7b61a9 (linux-devel/fixup-ddd062f753) fix for ddd062f753 from Paul E. McKenney
> > > * ddd062f7536cc rcutorture: Complain if an ->up_read() is delayed more than 10 seconds
> > > * 1b983c34d5695 rcutorture: Comment invocations of tick_dep_set_task()
> > > 
> > > 
> > > I noticed there are some conflicts while applying your second patch, the
> > > 1c91d0bd4809f looks like [1]. there is no "int rtorsu_cpu;" before line:
> > > +	ktime_t rtorsu_kt;
> > > 
> > > seems your patch has a different base? I worried if my applyment has
> > > problems. if so, could you tell me the correct base? thanks!
> > 
> > It looks correct to me.  I will rebase at my end to make it apply cleanly
> > by the end of my tomorrow at the latest.  Attempting it now would likely
> > just make a mess.  :-/
> > 
> > And thank you very much for your help with this because...
> > 

[...]

> > > 
> > > [  168.048387][  T796] ------------[ cut here ]------------
> > > [  168.049342][  T796] hrtimer queued at jiffies 4294952214 for 200000000 ns took 1502 jiffies
> > 
> > ... I am quite surprised by the 1502 jiffies.  On a HZ=1000 system,
> > I would have expected this value to be at least 10,000.  I clearly need
> > to dig into this code much more carefully.
> 
> And upon looking at the dmesg.xz that you attached, I see that HZ=100.
> So there really is a 15-second delay, which is intended to trip this
> 10-second timeout.
> 
> So I guess is it no more Mr. Nice Guy for hrtimers, and therefore
> HRTIMER_MODE_HARD it is!  ;-)
> 
> Once again, thank you for your testing efforts!

you are welcome!

> 
> I also rebased my fixup patches to the bottom of my development stack,
> so the combined patch shown below should apply cleanly.  Here is hoping
> that the third time is a charm.  ;-)

we confirm it fixes the WARNING we reported. thanks!

Tested-by: kernel test robot <oliver.sang@intel.com>

> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
> index 88d9f5298c3d8..1ebeef8019b86 100644
> --- a/kernel/rcu/rcutorture.c
> +++ b/kernel/rcu/rcutorture.c
> @@ -2445,6 +2445,7 @@ rcu_torture_reader(void *arg)
>  struct rcu_torture_one_read_state_updown {
>  	struct hrtimer rtorsu_hrt;
>  	bool rtorsu_inuse;
> +	ktime_t rtorsu_kt;
>  	unsigned long rtorsu_j;
>  	unsigned long rtorsu_ndowns;
>  	unsigned long rtorsu_nups;
> @@ -2488,7 +2489,7 @@ static int rcu_torture_updown_init(void)
>  	for (i = 0; i < n_up_down; i++) {
>  		init_rcu_torture_one_read_state(&updownreaders[i].rtorsu_rtors, rand);
>  		hrtimer_setup(&updownreaders[i].rtorsu_hrt, rcu_torture_updown_hrt, CLOCK_MONOTONIC,
> -			      HRTIMER_MODE_REL | HRTIMER_MODE_SOFT);
> +			      HRTIMER_MODE_REL | HRTIMER_MODE_HARD);
>  		torture_random_init(&updownreaders[i].rtorsu_trs);
>  		init_rcu_torture_one_read_state(&updownreaders[i].rtorsu_rtors,
>  						&updownreaders[i].rtorsu_trs);
> @@ -2539,12 +2540,14 @@ static void rcu_torture_updown_one(struct rcu_torture_one_read_state_updown *rto
>  		schedule_timeout_idle(HZ);
>  		return;
>  	}
> -	rtorsup->rtorsu_j = jiffies;
>  	smp_store_release(&rtorsup->rtorsu_inuse, true);
>  	t = torture_random(&rtorsup->rtorsu_trs) & 0xfffff; // One per million.
>  	if (t < 10 * 1000)
>  		t = 200 * 1000 * 1000;
> -	hrtimer_start(&rtorsup->rtorsu_hrt, t, HRTIMER_MODE_REL | HRTIMER_MODE_SOFT);
> +	hrtimer_start(&rtorsup->rtorsu_hrt, t, HRTIMER_MODE_REL | HRTIMER_MODE_HARD);
> +	smp_mb(); // Sample jiffies after posting hrtimer.
> +	rtorsup->rtorsu_j = jiffies;  // Not used by hrtimer handler.
> +	rtorsup->rtorsu_kt = t;
>  }
>  
>  /*
> @@ -2555,6 +2558,7 @@ static void rcu_torture_updown_one(struct rcu_torture_one_read_state_updown *rto
>  static int
>  rcu_torture_updown(void *arg)
>  {
> +	unsigned long j;
>  	struct rcu_torture_one_read_state_updown *rtorsup;
>  
>  	VERBOSE_TOROUT_STRING("rcu_torture_updown task started");
> @@ -2562,8 +2566,10 @@ rcu_torture_updown(void *arg)
>  		for (rtorsup = updownreaders; rtorsup < &updownreaders[n_up_down]; rtorsup++) {
>  			if (torture_must_stop())
>  				break;
> +			j = smp_load_acquire(&jiffies); // Time before ->rtorsu_inuse.
>  			if (smp_load_acquire(&rtorsup->rtorsu_inuse)) {
> -				WARN_ON_ONCE(time_after(jiffies, rtorsup->rtorsu_j + 10 * HZ));
> +				WARN_ONCE(time_after(j, rtorsup->rtorsu_j + 1 + HZ * 10),
> +					  "hrtimer queued at jiffies %lu for %lld ns took %lu jiffies\n", rtorsup->rtorsu_j, rtorsup->rtorsu_kt, j - rtorsup->rtorsu_j);
>  				continue;
>  			}
>  			rcu_torture_updown_one(rtorsup);
