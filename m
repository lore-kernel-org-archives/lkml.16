Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1354204C1A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750100090; cv=fail; b=VGO7wmUvmd4m1ND1jfs3auy6DmeLoJZ9XK66EcSGqJzVEGg1DoUFhYlhgen5jc9ZnLq+dv7l4lshbeO3A6qa8B2CrWmO02U9m0e1TLCA8tydcbpqVNAxYWxvVWRDHpxbIFxmVD9FTnO4LsZNwe1hQ9KsOwCRK8DvcJdlADJCI1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750100090; c=relaxed/simple;
	bh=fgb7GXIBbXQELJm+6W+JT+RTgCqQkAqd2h2TaRXgnsU=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jcHmkrO4wlQUsVbESu9usqx81djPuZWoVO7k/s6A3jkA5oCxMxyHmDVumbLmDPobsfgJqmdsQMcjd9TEtAUDvXctARPJgugif+m1Jlj1cTCx3i75828d3rVc1oQfDPPmCUtp0X8WQd6W04bZSGcScPssZe9q3A7SzU0/hBJweXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VKopVp0M; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VKopVp0M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750100088; x=1781636088;
  h=date:from:to:subject:message-id:references:in-reply-to:
   mime-version;
  bh=fgb7GXIBbXQELJm+6W+JT+RTgCqQkAqd2h2TaRXgnsU=;
  b=VKopVp0M6Ev4rzMf69eJECDm8uDBGmR9kYEc8Z1FZhSIXEe2sGBDFYfI
   W/8vwhE0/ism+EWIm5uVxN0vd4JNIfR+7utq3lvES/VEQmGWKddR2ms/D
   kSm7ERiWRYyxi5v5czsPUiChz7WdbjLk44iENcYvNBKCSn3Rxe19zYa1a
   g+9etnbLMpw8FvRWE2bsQl5YvfsPpYXNlIwJvamc1zrB0vgVHVOx8pPur
   LXKBWUtbghC9/nW7qY/759fjptmsjrhD3POWctYbkBO/hLOLp91WMeeXq
   yR1XohfkRfLq7RBWMWqE3PjHZdnTrdOGQ2xGJrP0GiX0cUuMyqMO9UZYf
   w==;
X-CSE-ConnectionGUID: 0lhpPRNdQpOD5O7Ym5RSxg==
X-CSE-MsgGUID: ci4gRwutSueInJ3DVkqb/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="39861257"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="39861257"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 11:54:48 -0700
X-CSE-ConnectionGUID: 0NTBWG8oT8O04sC/v+CjTw==
X-CSE-MsgGUID: Rxk8r3+iSauyFHJeCKqNbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="148388714"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 11:54:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 11:54:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 11:54:46 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.60)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 11:54:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xqo1acxog/nHEHMkxfRrJiB82DD5ZYcv1g1dtJMZZOg99d+Knp93lhrBZUzxpA5UStj3FIFveGHmHFTh0tm4mczOGeRPEayVOAiUtsxC6eZvtT252wF7wgPAnVl0KsEop5fwk0pk75EdgA+B/nzBqtmk/HvYW2liinWCMQorYW4qb4vdpAbt3fHFPSd4lc1uEuRW1ziQ2CrutH1rmRQNAZOJ9TwxY6W9/+nAGHMW4HKOrQyzwwAaSKsNDzoNopned/DTAXBIw7U7xOpH33x5C9VDHmuv7yoEfKvk38YUmjMqA0tfhGNw97l30njLXgyX8ATsuY/pssimUH0ZbhA3XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDO1kFMMO6Tide40dXj4TO6lFh3byE+7a+KFlqr5xsY=;
 b=QaVjxrOjicHCry5k6u7POVu38iDvpp6xzZxk4PYOuC5Atk6SHkoPorXfkfRsqdueq3jr9bGJsb9s2TjLXdxcH5W3Avc7fR9EtA7OfkXzSO8J3PUCKxOOk6S07Ii1/wzdnwb93VQajBTTa7G88mg/CgQHTgv+XS+5BdZcjEK9U0Pu3MvFsF7rV9q2qQd4LA7gidre7J4L3Jby0Hye3KX4xD/DsLQdXwoXNklxqg1vFx0qS3Yrf7EFu2HmGmsV9CrKafx8lp+SlhD5eg7FVTTKL6VoxVJ5lRcEd6aGMbr6wfKvKg837apON42Z557CdQIrmA/1RWfNDGGHcDRYOl7EOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SJ0PR11MB5200.namprd11.prod.outlook.com (2603:10b6:a03:2df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Mon, 16 Jun
 2025 18:54:43 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%6]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 18:54:43 +0000
Date: Mon, 16 Jun 2025 11:54:39 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Jemmy Wong <jemmywong512@gmail.com>, Peter Zijlstra
	<peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Dan Williams
	<dan.j.williams@intel.com>, Christian Brauner <brauner@kernel.org>, "Jonathan
 Cameron" <Jonathan.Cameron@huawei.com>, Al Viro <viro@zeniv.linux.org.uk>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, "David
 Lechner" <dlechner@baylibre.com>, Przemek Kitszel
	<przemyslaw.kitszel@intel.com>, Ingo Molnar <mingo@kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v0] [RFC] cleanup: Unify DEFINE_LOCK_GUARD_0 and
 DEFINE_LOCK_GUARD_1
Message-ID: <6850686f3088c_2491100fa@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250616111436.665171-1-jemmywong512@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250616111436.665171-1-jemmywong512@gmail.com>
X-ClientProxiedBy: MW4P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::19) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SJ0PR11MB5200:EE_
X-MS-Office365-Filtering-Correlation-Id: 4da856ea-91bb-4381-1b20-08ddad07418e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q+yPJx/BH90IPFOr6b+evIaimBJPvENhex34I9salGG0gyTACKdBDc2AeMqq?=
 =?us-ascii?Q?rwR3RfFZbQnvYceM58K0+OEBp+7MXI5b8VY6xkT3zxspquvRkAG/9wn/buXg?=
 =?us-ascii?Q?Mn/I5ebEisK0WdXyfztEsp3d6/rR2XWS01+ULB12OQzNJgYHitHVYHT1lXDY?=
 =?us-ascii?Q?cW3w5ppJqKT7K7flnAJzuEyegkBR+tyUDf8Fsv6sV8zqVtySF6XZZxVHtJcq?=
 =?us-ascii?Q?i8m0OuF4VGHLqovrFowChwhcSx2K056HKEvujT/gnsI+H02AYYwzVrGDeJc2?=
 =?us-ascii?Q?xfpaSd7kAPaiwtKYxZ850m98SIolfYd7EpY5OokBOSEjRyQ6gQnjpt+xc4yu?=
 =?us-ascii?Q?mguvMV7ZVfo7JWKLIeijEkrEEcw7GurLgbE3dcY+jrlSYEpZHF4YO2OANMs2?=
 =?us-ascii?Q?FaGuNSWDEfqplYplDl+oDr4qRvKt5GcXDo1VlE+K6Zc1bnBSyUZZGmTB7uLG?=
 =?us-ascii?Q?CsydRbgOeIzUWG8MYzjEiihvvOUtpao1Y7YJ6mSh2uoTvK15SEosIOtWNdyf?=
 =?us-ascii?Q?3WgBGlBInLvG9GcxxLFT6lgwix3BZHxEk2eCOWL4iu4TcvoVuibz71z/bRJE?=
 =?us-ascii?Q?vtOtEbp4DjV+GIGHqgJTft7BQfKsiq+ObpHVgwWUlMdPJoHH6VUgzBq58x3z?=
 =?us-ascii?Q?JHqWDoGFQnHW1Jq5HfliR6A4GbzzA84AhkO/Qc4dmjXKYotgfynaWsp+xb4j?=
 =?us-ascii?Q?FIM/JOnD9K+8FOCKaMfShIxyzWHYuuVXcnUN/0rhEXEaGYphsg2WLqTyu30q?=
 =?us-ascii?Q?SiGq5YCuqMXWzVTd6KzLwO7XSlitztodkuFMG6c7SY1t80XmWlYiEqD27EpU?=
 =?us-ascii?Q?cYfU7zgfs8qielH04DP9FQN210jD64H4Pl6AcVW3SI33Gih0MYXTUcm8IFBw?=
 =?us-ascii?Q?koez3m7zhT/KZVjfU5QJJE+Z0VjGE57BUk+SZQBvuXJSXRf11LjTsOnKpaGt?=
 =?us-ascii?Q?9aLkiJJfzRkwZAzClLRKghGDAkRMIt2Ag3TbXvXYpji9xhD95ZNrtjfBYdSS?=
 =?us-ascii?Q?BQVv6p3G2Ga3VoTF5FqM49GBH8mdAZqMRvETJlUBUlZ01jn2KtmF+KbPa9k3?=
 =?us-ascii?Q?qM7HPCcxAd9bxZgJJhDF88S1E54RaI9T+Q64IjpydNTNr1DAxabFg9PeJoOh?=
 =?us-ascii?Q?+b84hcUJf/lrRavEjROP/JdckVGcv33WltfpcdAnqQ62gq0ctKSe7ckFROlQ?=
 =?us-ascii?Q?veLJfRigb9aHEWGK2Radc79nmI69rxZ2uOil865z53sgX6Bu7UXlPs2oULZF?=
 =?us-ascii?Q?c2TaJNNl0dz8qKCA5n4GI14pI4KfOuipDlCulpiNkX5A1ysOP297FbrS1K64?=
 =?us-ascii?Q?05NZUv0edVhn2EnHDVXTVt8F9PAyzJVruVuDpB6MY0nchwpgyFhZJxdz6CqD?=
 =?us-ascii?Q?aWsv3wNMjo3dEn9D8IgKgyWjAeNwk/pxLQ10FxncE6jn45zqoahVX+WTmuCs?=
 =?us-ascii?Q?knVDu+gTsIYXmkNYUoaykKKNzn8KnvGoHw09KhvHqON1pqRIKvYVWw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sf7M0LySO93l4WsMrxiYTRG+xNJoeCDNG+seqkTcx7KzDR1XQuRINoYjmNKu?=
 =?us-ascii?Q?Vb/Kjuo3XmnOOaqOodSYMJqMFscLHqEEuABpzYfNp7ykGyB7bJwXLxwgNfVF?=
 =?us-ascii?Q?IzEWhVtyFIj7s2geq5ifAqK2Dcs0vyeAei0kR0RRqZPzhxB9fZaUKnVPZDGe?=
 =?us-ascii?Q?oz5EmYZf2G80Rk6qnM7qe/YaRjtgreXEn07feQ6Mu+uZC3D3B+pl/IIA5ipF?=
 =?us-ascii?Q?MKquYB2DXj0uoHxQfDzDghml9W9qHbvDOjwY0uBaBcOzLT43WOSih4WnbD5g?=
 =?us-ascii?Q?mQsWJTOjKPnRGVuEYL1M/EFmtQnrFMP98D0XhRsiZU75KBAhafsTJxbmb1CJ?=
 =?us-ascii?Q?CH2Xn6jQWPy4U7tuNDqY73PJP0Hat6DC5ld1Z8Rg5udDkTJdpuZHVL1lZPlS?=
 =?us-ascii?Q?/JUD7uxCoeg3ZVNqMFiyC7Yl0ObI1nopB2cB+AqeWO6dbf153sjoVq30OIG/?=
 =?us-ascii?Q?/eTNrtwuFn1za4JdLmNDgNiiEwKHh2XibQ0vE+kpd7OzNK8uPHRSFDxylF4U?=
 =?us-ascii?Q?BC6b0MiGOwwAg5mZQ40cFUWYHqZt8EWNMVUcUdhJy+BRalfyvwkBVeFcGrKX?=
 =?us-ascii?Q?wDQFfpagbtEcY7kOv7GiU41cpootHEfIeCbeaRnayy99HTfa/cshJdLYPszy?=
 =?us-ascii?Q?L0r6uRB+UkkHXyKUt9x4xif8Mbm6kP99lf/GaCLHi8o/T68UL26bST3o2Z8K?=
 =?us-ascii?Q?iLGtqjzwZJSdKmPBvNa3o7dS9pG5UUNVfE3QQmSUTBMdOc6EEiME87wwhPFS?=
 =?us-ascii?Q?Ad1Hqa/5vJzOcxGe6S/Ns82olz1kThZISRt2rXtDKbqZYAGpR6FUMaTTeNKP?=
 =?us-ascii?Q?RCn3yWfemveCpZ6qXThX+ItmyduQWZ9/ay1Bq5W3gek5pFRua+s8OsxE764T?=
 =?us-ascii?Q?VRG7pHsl0UQvfMZTWKz/RzzwvLvsTKpkurVWlCoX0oIw+YW+1asdqzGzYCKS?=
 =?us-ascii?Q?v/C2MUOCG+aRyWHbY8zFHlvPKfV77o8RQHhLoKMLZQaAwoWbkrfUOmXFlt7y?=
 =?us-ascii?Q?5+Rsrtw9P8XMZhCmlKdniEGi8RiJr7WOadMX+TWKb2mrJjjcRNkA9NovTAMm?=
 =?us-ascii?Q?I79Ci0fAfpw/Y+V2rs/QZZDjD8HlNZrD8RYdCCG+bA0K9hZE5LuEyk1tg+Or?=
 =?us-ascii?Q?RiGdu82mV/sCbhBX+aSYQKlavHyL09YTNw53jkqBvDqX927duqExxLgWd2iK?=
 =?us-ascii?Q?6dQ9mT4XFcIevA61znenAzf4fg0I4QP5g+mgC00FB40P14RcEn1CIA2oWXeW?=
 =?us-ascii?Q?KyY8sGF8h25o20b9IGQrHMjMaIopMVgu4J7J94WrNVrJdkFxAk+V6OM5n7p9?=
 =?us-ascii?Q?dAOxvz39EBhdAy+EMlFUxYr8n1Hp4zAL7DXKv/BI1U8aXRCHcYz8hDvXPzhk?=
 =?us-ascii?Q?U3G7kwxbmk4mIC2ykqs25aShT1i06k7OqiC3TuGMWLx50Msjkh6qOmn7ELsL?=
 =?us-ascii?Q?+9/3wEY4MaBbGVOBfzesqiWRb5cyy4f3MebWrsokswX12tjKBN2ZRHAOHAcz?=
 =?us-ascii?Q?o0hpeUPw5rX/Dl44YPAUNksbLAWpOtnh2zYeR8qcGIOUt/rmfrrWsNQfgr9n?=
 =?us-ascii?Q?YrscDRPx4j/rRF3uWzZykBmYbcPDuf+6193DBPE5phV+5nLq1bw3nRfpeVIR?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da856ea-91bb-4381-1b20-08ddad07418e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 18:54:43.4813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zLI9Ik8TbyVHXhqRhmOXspvM7U/2C/OGIwBE3ZoOHpCF0Yd/UupJKVyS+FsbTqnCSgn2ikO1fi+0z7zIRX/pzP9G9ew+1ie+w6J4IgputPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5200
X-OriginatorOrg: intel.com

Jemmy Wong wrote:
> Hi,
> 
> This patch consolidates the DEFINE_LOCK_GUARD_0 and DEFINE_LOCK_GUARD_1
> macros into a single, unified 'DEFINE_LOCK_GUARD' macro to provide
> a consistent and simplified API for lock guard definitions.
> 
> API changes:
> From    DEFINE_LOCK_GUARD_0(name, lock, unlock, ...)
> to      DEFINE_LOCK_GUARD(name, *void*, lock, unlock, ...)
> 
> From    DEFINE_LOCK_GUARD_1(name, type, lock, unlock, ...)
> to      DEFINE_LOCK_GUARD(name, type, lock, unlock, ...)
> 
> From    CLASS(name, var)(args...)
> to      CLASS(name, var, args...)
> 
> From    guard(name)(args)
> to      guard(name, args)

No, I think this organization is instructive for understanding how these
helpers work. I.e.  that the macro is instantiating a function with an
automatic variable result, and the arguments to that function arrive in
@args. This becomes even more important to understand with the ACQUIRE()
and ACQUIRE_ERR() proposal that instantiate different functions to
retrieve other properties of the automatic variable result.

> No change:
> scoped_guard(name, args...)
> scoped_cond_guard(name, fail, args...)

Effectively these are not returning an automatic variable result to the
current scope and the different calling convention is consistent with
that difference.

> ---
> 
> Deailted changes:
> 
> - DEFINE_CLASS(_name, _type, _exit, _init, _init_args...)
> The void type for _init_args is not required when the constructor takes no arguments,
> as an int argc is implicitly inserted as the first argument. (int argc, void) is an error.
> 
> This patch includes only the core changes.
> Follow-up patches will be submitted once the approach is accepted.

Appreciate the RFC first to avoid the thrash while deciding on the
format change, but it is a nak from me.
