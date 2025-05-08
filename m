Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BE31805E
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 00:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746665181; cv=fail; b=bzUKHTUr9lOAGbKWLx4iG4egEGf9hVxB8SNz+CZRyCaApP38dRcztHgJBKuqUzuQbzvrO6+QxtlvCTcQGQU7uSmDL6w+Ntyjl/4kZoSbVekzOUhk2KSlXSQrRI1ThHr+MrkFDFnIKdjp64eGuMWjVZGXvCZ5pcCsuuQaaO1X52o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746665181; c=relaxed/simple;
	bh=UDK0fGmW+JoyAh1gP/b4M7yDLnq5KAx8dDvEGEHXPTA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Wy/7apti0dpKaWTBdS1W112gViCHINLSrBoNKDypQxpx4qUKTV6UyeufAXP7JeBP4Lmpb2w7aW55+pKQ2lKdtlIsCHW6+J9cJSbaGVf2piJlOXHfI+EkA/JRwhTeUMaq4ZCMj9R1hy4knWCI2FYzFlvTrc80LmfkR0iCsBsrc2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PLGQ+B7w; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PLGQ+B7w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746665180; x=1778201180;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=UDK0fGmW+JoyAh1gP/b4M7yDLnq5KAx8dDvEGEHXPTA=;
  b=PLGQ+B7wSkn8g9phlikW4hFQE7jdXcv80FncshpXgpbtdyLKJbhooNMJ
   jmacBGNCBxhTojJbPS4l1yiPRpu57zj8gpo9hrCtH68O5MjhrO4WZfI3I
   K3Hbzh7lxlJ3YsWEzjUPPVwHlxEiLFH1aTxQNviQYlqJ5DSLNUiL15/xs
   EoWKNs3nVnU4zXE2wTi8LtwzKPEYV3DZiUkEAbYumXxZ9T3nQJ2rn/5Ow
   yfMkxP2VfciwRWSjKS5Fp9sx9+98IouVj2Qn0yfoP2XmqFIHIdu2N2dod
   Lcv8/4J0Jq5tee1bsBk2Ouwv6wV/G+V2aCEQvqs587O/3gjdK8QIAxzTj
   A==;
X-CSE-ConnectionGUID: cBlrH7tGTgG3T8PlmEAr+w==
X-CSE-MsgGUID: +Dyp2TVxSwSPlMSbg2NGRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48588441"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="48588441"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 17:46:20 -0700
X-CSE-ConnectionGUID: Rca/mx+TSbW2ysKaWobHiQ==
X-CSE-MsgGUID: 2wJE62PWSditqgKqpbosMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="167175598"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 17:46:18 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 17:46:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 17:46:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 17:46:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XgPMY0RuVHa5X1vmp0Hn52fMnuMDPWiqdGONo0LItZA0/ExvtOBGgwWyAv3IQpjYbJaZqxiMdgVCFEE9Zsu002tn6MFGNANWIKG5UfyLEsw12YxY0ZneTExYseuXgEGEbUtUX/EAl9Kz5PPq6uWBlFWUtxnXlvSVfti7DtYhyCNVZlOLHGP24+ERRDeNNLtuHjejmdFejz9lAkoSyVqoq+UMw1jCzmszJRZQ1YBCO6+qk+MbFTyizRiiWKo/YEJTV6/kG/iaySnqnOpd9c28yomkQMyjmr4G6CeI/Qugf35y7PLkwLbtifVsPpZFDcAs074Ia0yvUWZImKSoRf+ZtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9qaurCtGfLFJZIhNytD9oNzqCa2BfgN680tILEvplc=;
 b=DtvVkybpLCOp5e1KAc5yoEVe6hsQmF11vreQjhBSpeo9vfZYOQeY5H3i0mYbyHJPasFdrw2NxDs4rc71kN8fDqU/fmuZDxBrB9KHs+HRkpIzecJ1luxKAI44L7H36UENTMAEZNKyNnuPSRnDp6CIbf3G9130Ox/cz/Y52phy+CfEhj0vqFtCNBhneuwdBfpt+PltmThpI+XeCFRYCGyucYiMLvcLherVXGOdREm8aRm7mv9SwFTs02FSjy6DLbxwIN0qIRO5GS16s4Lf/lL2DCcBR7Pc1btbVrkTy8rqKQy04rdBIaQNK1ik0PprRJUJqfUhKqav0BH9Px4Wb/HOfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SJ5PPF8622363CD.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::83c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Thu, 8 May
 2025 00:45:19 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 00:45:18 +0000
Date: Wed, 7 May 2025 17:45:14 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Cedric Xing <cedric.xing@intel.com>, Dan Williams
	<dan.j.williams@intel.com>, "Kirill A. Shutemov"
	<kirill.shutemov@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>, <linux-coco@lists.linux.dev>, "Dionna
 Amalie Glaze" <dionnaglaze@google.com>, Guorui Yu
	<guorui.yu@linux.alibaba.com>, James Bottomley
	<James.Bottomley@hansenpartnership.com>, Dan Middleton
	<dan.middleton@linux.intel.com>, Mikko Ylinen <mikko.ylinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Cedric Xing <cedric.xing@intel.com>
Subject: Re: [PATCH v6 5/7] virt: tdx-guest: Expose TDX MRs as sysfs
 attributes
Message-ID: <681bfe9ab3090_1229d6294c0@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250506-tdx-rtmr-v6-0-ac6ff5e9d58a@intel.com>
 <20250506-tdx-rtmr-v6-5-ac6ff5e9d58a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250506-tdx-rtmr-v6-5-ac6ff5e9d58a@intel.com>
X-ClientProxiedBy: MW4PR04CA0385.namprd04.prod.outlook.com
 (2603:10b6:303:81::30) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SJ5PPF8622363CD:EE_
X-MS-Office365-Filtering-Correlation-Id: c83c73d1-a929-48db-9451-08dd8dc99b0f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dgWxNijhJOo30BdztXPiWIRsWiX5PxNqW7rRqI+QP5yzGsx94k3l22LBNbFJ?=
 =?us-ascii?Q?tDWUMK7FVd802sXKJqQBcfZgGbHCCxQ4HjI3+7y/x6jtjjTWkpfvxKcGhfdo?=
 =?us-ascii?Q?6ApP1um9E4Nh2EBeka2EnWBjdeN025LN4FiCvPR9FX8FdSf5RkSHNu/c65ui?=
 =?us-ascii?Q?s6zAiw1HvRu8TEmskSAboIhJ1WCIO11gQ29o9YFLYVT0Cc/hoURhPC85uTtJ?=
 =?us-ascii?Q?PEcq0f8tAGe4yueEMlMldSlh/Xtwx7w1jJFijbA8kmZ8mFCKF2PCPSUUpEeJ?=
 =?us-ascii?Q?3rEcofn7kia/cvPjHC2iA8BksvcZYY5S64lRAt9Cz6IqfMKpDKSjlTZAhGT9?=
 =?us-ascii?Q?gK7Ca9wUoQv8z4hjJNR8sCY/FSxJqnpabZFpsOeGxqzwz/Cl/p5JR65O+Lkt?=
 =?us-ascii?Q?9N0pZ7tJaEJw+oly/XXLz4TtDwmBqsEFFs9Wa49NO5B2CEpxEwSKg89Kj9oH?=
 =?us-ascii?Q?eE+UjdESWiRg+HxLKh3jd2kv/B3siaR4/vZAyM52nv9JTZOThg+9Y2/qaK1l?=
 =?us-ascii?Q?6tLCAZdm/JHn7lNW9igQKi3ssoQISFRiLwatP/RE7gC1/YUBVApbnSdWTlkY?=
 =?us-ascii?Q?621O5N+KyIfmY/7z/n2JHApVY48iWmRNg6Lo31C1lOnQMS7XCiSBDcrtIooU?=
 =?us-ascii?Q?IuF74ZRPozOFo2EyUsQt9oV77t0PSKtiawLTVDcvmOSWD4KpN0pd2uho567O?=
 =?us-ascii?Q?1ehce12bKgvmLncjj7ys0fvQRlyse7zCB1ck1k1DiqXe7KUZYn+mPwk8AA8L?=
 =?us-ascii?Q?+aR21q+SzL4SNjK+6nnGOD0qCMSjm8ZZRPhdw6fCDoEmmyaxiPtA+2ccGAFZ?=
 =?us-ascii?Q?/UZ8rEfB3HHSc5DgoMTVMTn5weG1qENZQHeem8z1q1yszb/rFV/mHEGU4QcN?=
 =?us-ascii?Q?CXx7noK4RAYhPsQZN1k/Mtj8aMO8Y2YzxafhUl3/pCZyhMneo6lM+axmG7t+?=
 =?us-ascii?Q?hY0UJXUw1gdIZNWAPu/kewVw8ObhZ44XtnVZ+JWX+82ht1uNYozzVaEfnJNC?=
 =?us-ascii?Q?XVXOPAG1UKMJkj18d5BTaNLAqKk6FsXPCYWMxgXu38cGdyp8Ir8sebWErl5/?=
 =?us-ascii?Q?Z2xBbfQHvEx9HXR/bYhy49zWMocM9xIXqnruATGvfSpXw4iPg8i7K03He4JB?=
 =?us-ascii?Q?rwtTUPf1ejh6raO6hhTYXdlqx9V5dQOS9l3SuxWKjnlg9XbSZMv3pDSDn+WT?=
 =?us-ascii?Q?ae3l9jAuUUL5XECe0n4y5GfqQAb8UqfEcVQcJwKZaN56ds7nFMIsz9MaCqmu?=
 =?us-ascii?Q?x5HHyZS2Kb4D9cXtrOolz1gVsAa4DLsCjHD6v5S17D22LyI2TlHQWRiZf+ke?=
 =?us-ascii?Q?60OpZNmSfEtBSbRaidOXbHkvrCURyMz+ablQjAslcYGKx3AUWUKYqnN4UvUC?=
 =?us-ascii?Q?dVkmATgs646bdLGFzYtHCtzIoTadl6VsmRqYggQ12JYJQzvj7g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P675PyUCrjfQ/etulLJEwj9Vv0Y4IJpr60JGsWN4G7xVkfCbkvpXAWmUCZlC?=
 =?us-ascii?Q?cJAl57h4WmCcm8BiMsSjMvTtylDKe1yRPhMef9KaaucGGE4Sx3AN0hzRZT+2?=
 =?us-ascii?Q?DMs2IyAMhDjDN+BzYFlHPlfi8wRNQVYAa7EoWZv/YGjwQfjid3IXRlkvarl5?=
 =?us-ascii?Q?JpeZPHTsuKkC2Ls1CT/Ti7todcvgQhpLOHs0hdo1Yvw7l8a6IY2Gpt2G1bsc?=
 =?us-ascii?Q?97YBK+3VWmt/+RTJ4XmUSPu61RZptI+vRJo286twP2oKvrmjidnzzw+vVqY2?=
 =?us-ascii?Q?IW0CWLIdU+e+36VuzIMs0EpY0tJ1uW05D+BoWaY60mRfeHjYUDKeGSp2ig94?=
 =?us-ascii?Q?Uuf/+iDPNXszsDvI3j1AUNIwNUVYbrZF7G5nJqYgXjRN9h9zpPhm3NIbo4ag?=
 =?us-ascii?Q?CdpsWhucZa3aJwqN80hGQqV78uaVxs1xweeFfcrWdkEAiKa3lxsSBuXXJ29u?=
 =?us-ascii?Q?Fk02YfLOzmArjYfdQsWmT0da0HlJgBwRMcNFa3fcKf4Ou+GOBHvtSM8ddslZ?=
 =?us-ascii?Q?VlpQleeNhyAHu+5hsekD78pT0VAdQsLSD0IYnE/h+eom/C0GaRtegG4a38g2?=
 =?us-ascii?Q?ekBRRThsxDaZND63NPfwEayxi4X3pg9mSww4XUxe3ghue4FHoWdKUqo/Yuf2?=
 =?us-ascii?Q?tIIvbU6zSr4cLUQ/7EJByHsTVFUuAtOWC6+d3JyWAj2A26XHtV/7VrRFno1r?=
 =?us-ascii?Q?r0Plui5MkPdn3Ke+1Aae3UHWkIPPA9KYvq1f9bD05SDnn9MCuScR5YsmyHab?=
 =?us-ascii?Q?JQTg0JBx/kywAJxHzmt0qJJNKsF+8gajSQTbIbL5p/2hNCn9qya6Mtn2quCz?=
 =?us-ascii?Q?XUqySOpU/slBI951bYaUVB/QR4Fc3U1Vh0U+ocfQk1Y3D6MIeEq3mYy/2dKh?=
 =?us-ascii?Q?9Qlj9M3x9KFrBJX9YVQqMCpUwhhJ/aFhCU/J3tf62jBz0YN2TzenBAhLDNii?=
 =?us-ascii?Q?ozDRx5mIft4gAgcocdzwbteJZq0EtR4MFE8Ms5YRKYWdqjt70RciKDnhNF19?=
 =?us-ascii?Q?/OYbuvJcsLmiyuheQXgdPI3eg4Jbu0DqSiK/e6l86cbt0XA22lTE1bcwW67J?=
 =?us-ascii?Q?EdpmDU2My8jDX6ZhZHbAB6RZVOnDv9Dzto/NWLE0yWwxaDY62C3lshVtkBX+?=
 =?us-ascii?Q?vjyEX/EIGySq9rxxmrZZy5v4+AUxsV200WSGg0r7+ZpXQFo7faDXFIsDQe0H?=
 =?us-ascii?Q?6geR1KbQ3c8ueRsSEfJRlb5/d0Bo386j585vkSMqIoe8Kns7+3q+qiJJNx11?=
 =?us-ascii?Q?+X2ZcFebd+TWzTCluAzhBkuByxfJWdQ2l2mYQmE6UFMOYiSvg9Cgbiwd8TpH?=
 =?us-ascii?Q?ymVxhNGlVu6kk8OYWiqCltM0EjXjEM4CHxlaGJWBo94FCxyRZldM99/Ft99F?=
 =?us-ascii?Q?wICxyCPbfaO7oRpZcpyo0fwz2GEM6ZkKiPwMDsVTU/Sk1urezVyvIpul2T3o?=
 =?us-ascii?Q?3rX95c2sjLU0q1SmWAf62dV4ONgBPgTC2xwPPQtgqpia6eY2OQYVU2Or9Gcr?=
 =?us-ascii?Q?0i9O2KMPjcV5wmMIaXmXDxz1NHmMeiVQv53xm8Hy7qUsIyYdpumhU2VM6GfY?=
 =?us-ascii?Q?XKrydP9ZqqP0BiwVW9mulCiGiHQSISbYsWppNHDniru5ZZElhX+/X+3+V51K?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c83c73d1-a929-48db-9451-08dd8dc99b0f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 00:45:18.8015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CuVHxdAQaUwHbnRjKHuXhxIZQDfTvH25LWYvUMVGXYhS+sQ0f/gwiYib1kdG/Egp5UdbfD7ZUaLfH+r6us1MW9eCRIKBioIcQOhq5F2ZULo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8622363CD
X-OriginatorOrg: intel.com

Cedric Xing wrote:
> @@ -339,6 +485,7 @@ module_init(tdx_guest_init);
>  
>  static void __exit tdx_guest_exit(void)
>  {
> +	tdx_mr_deinit(tdx_attr_groups[0]);
>  	tsm_unregister(&tdx_tsm_ops);
>  	free_quote_buf(quote_data);
>  	misc_deregister(&tdx_misc_dev);

One thing I noticed when merging this series for linux-next is that the
exit release order is broken.  tdx_mr_deinit cannot be called while the
attributes are still live. The order needs to be:

        tsm_unregister(&tdx_tsm_ops);
        free_quote_buf(quote_data);
        misc_deregister(&tdx_misc_dev);
        tdx_mr_deinit(tdx_attr_groups[0]);

...I will send an incremental patch to fix this up.
