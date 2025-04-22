Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702FC184540
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 05:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745298178; cv=fail; b=BfV5tBIWp8T3wwUj8JBICxHIHXOxihegnVo7M6JJr/lnZFordi4zAapMbkfZAGS5S1w6bV5OfFo8m0+UFKqyQm2qhAZUKzHMITEnrkS1QspPJfdN5JHoZt/uwE1euIfKlF/shv7dm3QfYDQ92Wzd9kpXvtv4vW7f9k1iU23NEYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745298178; c=relaxed/simple;
	bh=k6HDLOF9SfW9E4zYCdc4qbk5dFkiflgvzo+Wvd5bfI4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AQFJnLNOFpddIC3p396vf5wmJh3tuAcDZc41YQ+IEIL8piTqLmBijsuWCV0sLgfuGMLeI5+6ftfQD9VzPplhPcQYj+EKVJNKSRzCK0t8GahnzW+c4daxz98Mc3U0QqJkKOopbQ0ldATCJKOMgkBC88bKY6j9N1M0cE4u4uKkReo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJPdESst; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJPdESst"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745298176; x=1776834176;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=k6HDLOF9SfW9E4zYCdc4qbk5dFkiflgvzo+Wvd5bfI4=;
  b=lJPdESstqZWd7SJByaKQLqbLWh7hdHiPX/Z5JoxnuNsDnuC+BmeXvywW
   /KQBSveSnxbZITWza2uFHNfN+VOIKKkafZJUIE7jAsV83XmULQYAoEgPq
   AE0NCLc4aWs9swG7UBKnDY4OZsQn2FlRSGDNji4Eb1AnBWWY0qCk2Wzgb
   yfrImJ4CroGprTa8aMLKTsEn4+mTyz5rdA/CIQNwcDdd/iYXN5V/q81Ms
   rmdSZDLxW1k7GFAXYTd/OYtoydX65qFV0Ait4oqdnv5H1oipS+e49r6jX
   zWoZRrTkyXv7UgCPPI5kNAJI++IvrJxUjXBNUx4j1Uq5vdg8yRViKTpN/
   g==;
X-CSE-ConnectionGUID: dELySwEORqyfoPCn5MnPNg==
X-CSE-MsgGUID: Gu/JRN0JTJOvU9bxd/i1aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="58208101"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="xz'341?scan'341,208,341";a="58208101"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 22:02:55 -0700
X-CSE-ConnectionGUID: A3h580c7TM2mylVXoj3gxQ==
X-CSE-MsgGUID: g95IvikHR8mk8Pr7Fco4Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="xz'341?scan'341,208,341";a="136699417"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 22:02:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 22:02:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 22:02:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 22:02:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDu5Yyj1GQuu6vPMdKny14gnsM3Fj6zZoxqMyW9bkLjwWC93SpcqbIBKeaAf/UK03Pm2ygkQfey5iZ59foYZWL6qoHtIH9LcF7oATDwuKtpOCPIneW4xnldCQNX93Dlpq0OtAw75d2aHfLALINlMTdr5KjFiBnIzaRg4vEa5cbaGfZ1Bn+L2CTe4i1uHZb087cETj5cHyRJzfBDE0z+DZvFvIiu60CqpKHHdUewtATBGNDHABIjXLDf96T4tqrR7TvcfNxo8fCZ243E96w17KajlvvH2I8PhPD9LNkhTL9dPrcUQ8R30SQ3OEFatj1QqJBLIBl1YahRJfA48Bs98aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxC1+eLPICsZw2UDLWX5sIQHHMVm/sujqbwT6ABgbaQ=;
 b=DPk58ZkK/q0LfR6vjyIH/uziCr89oJTcoC/h6JgmLhFja5QPmWdwPjKKw9yudOqcjBNi6I0Tg88LT1Dz0iP2dLJ55l4+sfapuFeQIrDFCUHK4Y1hr+gbjhtgpmu1Rz0JjvnXMR5t4xYrVBAIFThCsc1nR8NSjFpA5l40v3H3s2AhCBcr/qRsnhPqI0k4mD+fFIbGzs4KTdgFu4nyu6IuZEQcOkKTV8mBpsIMLnSBHuqLYOT/nTnRgta84iP80Mlmo2CwjrExwiL/pY9Ou0h0ki2F/AO8LFHubqpHaj/j1PMNtGYz+sg+Pi3Yjsb4DgGl0qOttASnfr5zwBnM05mdZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ0PR11MB4798.namprd11.prod.outlook.com (2603:10b6:a03:2d5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 05:02:07 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 05:02:07 +0000
Date: Tue, 22 Apr 2025 13:01:58 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: Re: [linux-next:master] [rcutorture]  ddd062f753:
 WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_updown[rcutorture]
Message-ID: <aAcixqijvHL2ihHS@xsang-OptiPlex-9020>
References: <202504211513.23f21a0-lkp@intel.com>
 <9db0175d-eb50-4534-969f-35afaa677927@paulmck-laptop>
Content-Type: multipart/mixed; boundary="srN16yveDzkTptRg"
Content-Disposition: inline
In-Reply-To: <9db0175d-eb50-4534-969f-35afaa677927@paulmck-laptop>
X-ClientProxiedBy: SG2PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:3:18::33) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ0PR11MB4798:EE_
X-MS-Office365-Filtering-Correlation-Id: 100fe82e-827d-4461-60a7-08dd815ad4d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|4053099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I6F6K7URkPb0ZqOItOH0lpKoiUTo53mFwJ5N1ilUNyElbof3Z5Sn6zGEQ1Y/?=
 =?us-ascii?Q?ImESLMK9R4r8tnzv53lx5IUhV4xuLuPVKV6NkcCkiJRhZKVmlXKkjFUKJ1g1?=
 =?us-ascii?Q?IPE3yVysGc+zFS1fLg1IeuG/HgK6VqdguuaooNLz5RYPmdfQuDhe0lt0zKnM?=
 =?us-ascii?Q?7j0Szu4aI+ZnKzIDBaS8bnk/ah9sUXCpcV2TV/0wF9jxzS65QWKWyVvQ0ooG?=
 =?us-ascii?Q?YTQcwHdk8SAGYx7vw7ymMZPwMDaulPspHovC9V3LdlREw0p9aKuWYSqca792?=
 =?us-ascii?Q?ecIZ9zThi2pzlk5ZqqNSiUH0/gtZ4jwA+9zCgTFBjwQ1oPZRUaOAUiFqS5XQ?=
 =?us-ascii?Q?Ikq7xLbPamZuSrZryHJZ5gbz/iR9TskLhg5EBSw85ujKa44i8Z9nuticuET9?=
 =?us-ascii?Q?E234E0e76K3a39IIrZG/cob+vc3BYz7pF6MBd32ADIPpB20E1COB6LxyAsDa?=
 =?us-ascii?Q?rNSilJU1upoczzJBHL3+HDm890VuAXJiaC31uTAt/oRP1efXuW5cOIG5rUGZ?=
 =?us-ascii?Q?nWH5fvnhlvmDwDjmYQp3hdjJKAgPbRM8qgtFjZxngLl48vLuYRy36DNYHsS7?=
 =?us-ascii?Q?VPrkOLmimwABBoIeLdTR49bHNWDbxQIL+SX5IiCToSF9l+rRp9+6SFOY/YlS?=
 =?us-ascii?Q?Xgp0wy3sBmISIey9tKLAMHZ+p4SxBP8ysvYqAnAaeeKelbqwp2P25BbDw/sJ?=
 =?us-ascii?Q?FFifp6o7jztoYhZHOiUz7TAi4x0G++ZjDTKcO4s00kVl2TMJ4QK4Ub0JR0zS?=
 =?us-ascii?Q?zxSqK+CCWe4IgoIOwyc/jIYkhw5tMgkkut+nJ1WEfe4pRPCSoa8X7+EJEtZ1?=
 =?us-ascii?Q?8Fksqy6LE1MGEdYrVBWU6nzTrtg53ibPmZmQsjTWII+yMnWwabv+mU30eQJ3?=
 =?us-ascii?Q?7Xq9Mm4NqBGE9XExNiluFLd2dGKKvTp3/Bo0s37JQ4u+uXpx0biFG9dS4lwX?=
 =?us-ascii?Q?xqma4H1/Gj/aUjpW+I/wfkLbxFTuFDPXaNGnlG3YNPMkpH6TH3uXNl7ERzRX?=
 =?us-ascii?Q?v44Xd6gpnXSQn/f9MexTgCMg+9DMPq83LHipUzdkdfEzx9LkFA+fSuHo1QHx?=
 =?us-ascii?Q?BHBt/9MCJvVqf1mYmS+2xtwui4nMKbI+266JMb1EuVf9+B6L1Rhy3vfu/Mi4?=
 =?us-ascii?Q?ZtSUiz4FHqbRqFJZo7Z4harQ7IA+ub4gN03Y/iPPkE8ay+JLBgNIv7MrwJzW?=
 =?us-ascii?Q?vPV19CW11p0m/Zyvb72Tqv1O29oT9Iw5cgGbpWqKuu1Zyx0+91OCwv3q3Xjd?=
 =?us-ascii?Q?kFLW6f6zehR47bsQtjodyl3MV4HJdklakYZnQ/0yPx55i1hdY+QACquEN+Q3?=
 =?us-ascii?Q?H4jQ8FguZxGywlo++I/uZdmvdwJLJ4Hgs4TrxUzrD2n8XFW241oJiGpG5spF?=
 =?us-ascii?Q?GgF9FKWGdyhMmuXEDd3gg1Fps+/o?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NqSxGkfYWjZLzkVV7pHkKjNK+84AlwKa9MmeG53Zha0TGVWt9C4L4G3ry83C?=
 =?us-ascii?Q?9lUQ9BalOo2o5dKAIoPXkdwYlQ9BfUn7OxfcTMIx08beQZpPR3lgtzwAu7/7?=
 =?us-ascii?Q?10p/pPijANgrMU6jzs6a7GPAyIQ8XnXTm001Bx3pF2dsP37o2CpZAEscuB/c?=
 =?us-ascii?Q?UN0S+4UvYaZPYxxJadODAZsMcPkMu8HYXyAH9CVf8d0+Z0Nqbp9IZHbxHqty?=
 =?us-ascii?Q?FQZ8F8gBnZdwYKyAETXF1Wwcvs6qtnvK4woZ2H4hFTmLkQGKnqzVKzP7Sd1A?=
 =?us-ascii?Q?RIc4oS8MFB8lUY8ibf3vp8mKsXM7s/kmrau4FW1qaBS0YPUcpiFhLXyUvAnW?=
 =?us-ascii?Q?YtqOPVlzIPMOOeo2GaKGYIfx5wt35uNhHyyZQJbnQUQWKNCJnFa1u5MsxMFm?=
 =?us-ascii?Q?n9jV8WQoapem5tELue4z9WqvqZ1DsvqpDGkQ0VXtDv1K8T+Acxh+Okfu6C+e?=
 =?us-ascii?Q?6k7RFknwCqk26K4zUgy6mY23cszff0rz+C78O3wPpDPfBK0KosqywfDmbwWE?=
 =?us-ascii?Q?mNl12NAPU84fuiKE3Hjw+ORqD5wvXiDD1ZxkRAG5taZCAIs64heO/eDgvp+s?=
 =?us-ascii?Q?KRPVMUsrvXrg5ynDhDmHr2QyRnovv/IzxzPN4patAtGpFEMNK8V31YFQalfE?=
 =?us-ascii?Q?ObYcalhr49/DebfIVj/mOHtqceAlMJIOhEoodT8BqHFQrdnIldCLPb1yjrlz?=
 =?us-ascii?Q?NUn3zHh3uh6ZITfeGtrI6P/+SXvPL8RU91zLlpKJhemKt400SCLvjrmMXjB5?=
 =?us-ascii?Q?xhwBlj2npbveiLNB3W7T7WGqrAvrdYrUbmD2acKE+Txfj7FPiLEY/n0CZhQf?=
 =?us-ascii?Q?/j9sMcdB1iwIbPpAlRyOJeehHlNY/ETAP9H3OrBL4LE9kmuWydW7FKTWGyhJ?=
 =?us-ascii?Q?Atc6lq8Bf7RAH62UOSS9v32u4EcIKd5zgHYBizQ6zQgY7l7O6ACUKAbDgUsC?=
 =?us-ascii?Q?PZKMWs0vOgi6JKQwc1aZst5fNYhiyjjvpngjX2K3WNh/fFSKMeo48EOmSGQ4?=
 =?us-ascii?Q?rMubQxqC3HIVMUP5De7F7xnYdMz9CkKVK2eve01i/lcD7eJjXJJBTFgP6G89?=
 =?us-ascii?Q?ClD1xal+pd0lkdrC58WijQn4uhnDqQ6iJZza8KaZeqm4En6BkQLiouQc3U+T?=
 =?us-ascii?Q?EToHlS/x/zrGPG9OyrGBWVn+kA1b5RGMHP7ZjFgq9Lsnlrywi8NeoVGNf7IC?=
 =?us-ascii?Q?HiRugdnWe4+DnHqMk1FWZ/QtS5tTAqLgzVMPBr8MuZvYqquDwdUz9LGE0A48?=
 =?us-ascii?Q?eukz9l1vxtsYNp2XubU9+ElzleuTc9qLe+Mn84LJgCgHT12R60cCdhUryqZA?=
 =?us-ascii?Q?UiPaauL5GSJbH0NcpUvJ8cncjh0xkyDws9wGHp8EZfl3pNrlWXqZ9trH23hX?=
 =?us-ascii?Q?6EN00RXIVaCNMvpp0JXGvO4Zrha3acblMufp66dlml+2C9B0tLk+KSD9w095?=
 =?us-ascii?Q?36l61Qy6yQn/tpQyr+Ab9GhOspW8qXo0DfQCqi8U9v8mACj6UmOQax3XGGqR?=
 =?us-ascii?Q?QhqksV4OSbbBn/L66i7Seq2zjUmAKaSd8paFvx22oHe7xHA1G7E0dls+bLuM?=
 =?us-ascii?Q?2J4nkUwnPWvDFwyLUt8tyAJtHQtnWBWE3QWDGcJS/rnX1XgBdsUSTmB20/+s?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 100fe82e-827d-4461-60a7-08dd815ad4d6
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 05:02:07.8251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1xey5GwaZ86sut6skc8wKaLkxRGyDK5QEg7eJVt6kR3cmLrE4ORqA4uLnIQxizf16X3aRO4HW901mpru7A6eQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4798
X-OriginatorOrg: intel.com

--srN16yveDzkTptRg
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

hi, Paul,

On Mon, Apr 21, 2025 at 09:34:34AM -0700, Paul E. McKenney wrote:
> On Mon, Apr 21, 2025 at 03:39:41PM +0800, kernel test robot wrote:
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed "WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_updown[rcutorture]" on:
> > 
> > commit: ddd062f7536cc09fe7ff1a66816601984bc68af8 ("rcutorture: Complain if an ->up_read() is delayed more than 10 seconds")
> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> > 
> > [test failed on linux-next/master f660850bc246fef15ba78c81f686860324396628]
> > 
> > in testcase: rcutorture
> > version: 
> > with following parameters:
> > 
> > 	runtime: 300s
> > 	test: cpuhotplug
> > 	torture_type: srcud
> > 
> > 
> > 
> > config: x86_64-randconfig-123-20250415
> > compiler: clang-20
> > test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> > 
> > (please refer to attached dmesg/kmsg for entire log/backtrace)
> > 
> > 
> > +-------------------------------------------------------------------------+------------+------------+
> > |                                                                         | 1b983c34d5 | ddd062f753 |
> > +-------------------------------------------------------------------------+------------+------------+
> > | WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_updown[rcutorture]      | 0          | 24         |
> > | RIP:rcu_torture_updown[rcutorture]                                      | 0          | 24         |
> > +-------------------------------------------------------------------------+------------+------------+
> > 
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202504211513.23f21a0-lkp@intel.com
> > 
> > 
> > The kernel config and materials to reproduce are available at:
> > https://download.01.org/0day-ci/archive/20250421/202504211513.23f21a0-lkp@intel.com
> 
> Good catch, and thank you for your testing efforts!
> 
> Does the patch at the end of this email help?

sorry but the patch does not help. one dmesg is attached.


[  107.907141][  T690] ------------[ cut here ]------------
[  107.907879][  T690] WARNING: CPU: 1 PID: 690 at kernel/rcu/rcutorture.c:2551 rcu_torture_updown+0xe7/0x440 [rcutorture]
[  107.909122][  T690] Modules linked in: rcutorture torture
[  107.909866][  T690] CPU: 1 UID: 0 PID: 690 Comm: rcu_torture_upd Not tainted 6.15.0-rc1-00009-g1539a7e7b61a #1 NONE  80728dbb8fc06cc6d40cbe8225bf0332ec562ffc
[  107.911393][  T690] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[  107.912576][  T690] RIP: 0010:rcu_torture_updown+0xe7/0x440 [rcutorture]
[  107.913397][  T690] Code: 83 c7 48 48 89 f8 48 c1 e8 03 42 80 3c 20 00 74 05 e8 fd 1b 49 e1 4b 8b 44 35 48 4c 29 f8 48 05 e8 03 00 00 0f 89 83 01 00 00 <0f> 0b e9 7c 01 00 00 48 89 14 24 4f 8d 3c 2e 49 83 c7 60 4b 8d 34
[  107.915455][  T690] RSP: 0000:ffff88814faffe58 EFLAGS: 00010286
[  107.916177][  T690] RAX: ffffffffffffffff RBX: 1ffff11029f5d0e6 RCX: 0000000000000000
[  107.917147][  T690] RDX: ffff88814fae8730 RSI: 0000000000000000 RDI: ffff88814fae8738
[  107.918090][  T690] RBP: 1ffffffff0e82240 R08: 0000000000000000 R09: 0000000000000000
[  107.919037][  T690] R10: 0000000000000000 R11: 0000000000000000 R12: dffffc0000000000
[  107.919951][  T690] R13: ffff88814fae8000 R14: 00000000000006f0 R15: 00000000ffffb465
[  107.920887][  T690] FS:  0000000000000000(0000) GS:ffff888424d90000(0000) knlGS:0000000000000000
[  107.921860][  T690] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  107.922580][  T690] CR2: 0000000000000000 CR3: 00000000074c7000 CR4: 00000000000406f0
[  107.923440][  T690] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  107.924399][  T690] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  107.930033][  T690] Call Trace:
[  107.931026][  T690]  <TASK>
[  107.932020][  T690]  kthread+0x4b7/0x5e0
[  107.933172][  T690]  ? rcu_torture_updown_hrt+0x60/0x60 [rcutorture c962c7aca4575a73724d201f7e88cd5b0e155a86]
[  107.935470][  T690]  ? kthread_unuse_mm+0x150/0x150
[  107.936721][  T690]  ret_from_fork+0x3c/0x70
[  107.937838][  T690]  ? kthread_unuse_mm+0x150/0x150
[  107.939068][  T690]  ret_from_fork_asm+0x11/0x20
[  107.939985][  T690]  </TASK>
[  107.940827][  T690] irq event stamp: 83209
[  107.941950][  T690] hardirqs last  enabled at (83219): [<ffffffff815a4e82>] __console_unlock+0x72/0x80
[  107.944134][  T690] hardirqs last disabled at (83228): [<ffffffff815a4e67>] __console_unlock+0x57/0x80
[  107.946289][  T690] softirqs last  enabled at (83174): [<ffffffff8148ecce>] handle_softirqs+0x5de/0x6e0
[  107.948395][  T690] softirqs last disabled at (83169): [<ffffffff8148ef41>] __irq_exit_rcu+0x61/0xc0
[  107.950232][  T690] ---[ end trace 0000000000000000 ]---


> 
> 							Thanx, Paul
> 
> > [  147.544571][  T727] ------------[ cut here ]------------
> > [  147.545372][  T727] WARNING: CPU: 0 PID: 727 at kernel/rcu/rcutorture.c:2549 rcu_torture_updown+0xe0/0x430 [rcutorture]
> > [  147.546643][  T727] Modules linked in: rcutorture torture
> > [  147.547462][  T727] CPU: 0 UID: 0 PID: 727 Comm: rcu_torture_upd Not tainted 6.15.0-rc1-00008-gddd062f7536c #1 NONE  0a926b04a3771ed2623ec5d12c96d338a637f034
> > [  147.549036][  T727] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> > [  147.550241][  T727] RIP: 0010:rcu_torture_updown+0xe0/0x430 [rcutorture]
> > [  147.551128][  T727] Code: 00 00 48 01 c3 48 8b 44 24 10 42 80 3c 20 00 74 0c 48 c7 c7 00 12 41 87 e8 fd 1b 49 e1 48 3b 1d a6 58 e0 e6 0f 89 84 01 00 00 <0f> 0b e9 7d 01 00 00 4c 89 7c 24 08 4f 8d 3c 2e 49 83 c7 60 4b 8d
> > [  147.553366][  T727] RSP: 0000:ffff888150ebfe60 EFLAGS: 00210297
> > [  147.554154][  T727] RAX: 1ffffffff0e82240 RBX: 00000000ffffc39e RCX: 0000000000000000
> > [  147.555179][  T727] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff888150eb3450
> > [  147.572489][  T727] RBP: ffff888150eb6bd8 R08: 0000000000000000 R09: 0000000000000000
> > [  147.573518][  T727] R10: 0000000000000000 R11: 0000000000000000 R12: dffffc0000000000
> > [  147.574582][  T727] R13: ffff888150eb0000 R14: 0000000000003408 R15: ffff888150eb3448
> > [  147.577955][  T727] FS:  0000000000000000(0000) GS:ffff888424c90000(0000) knlGS:0000000000000000
> > [  147.579066][  T727] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  147.579850][  T727] CR2: 00000000f729a000 CR3: 000000014d67f000 CR4: 00000000000406f0
> > [  147.580851][  T727] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > [  147.581887][  T727] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > [  147.582799][  T727] Call Trace:
> > [  147.583264][  T727]  <TASK>
> > [  147.583703][  T727]  kthread+0x4b7/0x5e0
> > [  147.584257][  T727]  ? rcu_torture_updown_hrt+0x60/0x60 [rcutorture 02ecf78e8bf32d7a769b787a1e354f19e873c8f2]
> > [  147.591263][  T727]  ? kthread_unuse_mm+0x150/0x150
> > [  147.591978][  T727]  ret_from_fork+0x3c/0x70
> > [  147.592545][  T727]  ? kthread_unuse_mm+0x150/0x150
> > [  147.593167][  T727]  ret_from_fork_asm+0x11/0x20
> > [  147.593805][  T727]  </TASK>
> > [  147.594276][  T727] irq event stamp: 340637
> > [  147.597624][  T727] hardirqs last  enabled at (340653): [<ffffffff815a4e82>] __console_unlock+0x72/0x80
> > [  147.598763][  T727] hardirqs last disabled at (340662): [<ffffffff815a4e67>] __console_unlock+0x57/0x80
> > [  147.599920][  T727] softirqs last  enabled at (340578): [<ffffffff8148ecce>] handle_softirqs+0x5de/0x6e0
> > [  147.601075][  T727] softirqs last disabled at (340569): [<ffffffff8148ef41>] __irq_exit_rcu+0x61/0xc0
> > [  147.602178][  T727] ---[ end trace 0000000000000000 ]---
> > 
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
> diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
> index 3dd213bfc6662..53f0860b3748d 100644
> --- a/kernel/rcu/rcutorture.c
> +++ b/kernel/rcu/rcutorture.c
> @@ -2557,6 +2557,7 @@ static void rcu_torture_updown_one(struct rcu_torture_one_read_state_updown *rto
>  static int
>  rcu_torture_updown(void *arg)
>  {
> +	unsigned long j;
>  	struct rcu_torture_one_read_state_updown *rtorsup;
>  
>  	VERBOSE_TOROUT_STRING("rcu_torture_updown task started");
> @@ -2564,8 +2565,9 @@ rcu_torture_updown(void *arg)
>  		for (rtorsup = updownreaders; rtorsup < &updownreaders[n_up_down]; rtorsup++) {
>  			if (torture_must_stop())
>  				break;
> +			j = smp_load_acquire(&jiffies); // Time before ->rtorsu_inuse.
>  			if (smp_load_acquire(&rtorsup->rtorsu_inuse)) {
> -				WARN_ON_ONCE(time_after(jiffies, rtorsup->rtorsu_j + 10 * HZ));
> +				WARN_ON_ONCE(time_after(j, rtorsup->rtorsu_j + 10 * HZ));
>  				continue;
>  			}
>  			rcu_torture_updown_one(rtorsup);

--srN16yveDzkTptRg
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

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
AAGI+wHmtQ6pn4tlscRn+wIAAAAABFla

--srN16yveDzkTptRg--
