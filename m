Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97758748F;
	Tue, 13 May 2025 18:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747162111; cv=fail; b=O23G8p+Qf2Mgq7YUtbnn1FCbXGBoi5bQBYLpV+P0qrj6LuyKD7y1uHECN6orV7uVtPfiljiHIeDhbHqQuKIGJ63hvN7n+DOI14kPx3O1vUGmXLu4h/9isj/33PIlm3yk0+keYzneKp0YZXWQiwZ2Ah+hV5GOobrjLabZ792IoI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747162111; c=relaxed/simple;
	bh=J/Ccd0v9tl/VZTohw976vAk4J/Z4l80cRherhU9/rCc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pbh714u11IcIxdDk4hngByCTZPH5RxFyzzlXizfIx3J0QnZpHpKQB36KZvj8bUxtW/2Vtgj8ifret6bhJibU/jbEQNB9yRLbER/Q420ExQ0ApL6o3ecLw7zfh87FgdjljP4NBdj3UfXNlrDBfB+qhY7uzTl3WoYuQ6AH3V4mGbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fbgPcGYz; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fbgPcGYz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747162108; x=1778698108;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=J/Ccd0v9tl/VZTohw976vAk4J/Z4l80cRherhU9/rCc=;
  b=fbgPcGYzuzvK075DpH+YbzUqEBSrEAWqgfvxXiAMzwX6DO1pHYzR5CIM
   isjpvobz5uEIXqppqZvDbayixd8sh7m/YSqmCWjq5HVG5UXkipwfJTLJU
   L5mzKq+XcQS7ttiRfS9pvh7eFOLY8PjV8r68n1t02C5gQBnK8RIcQDHrh
   jJ0ZCiRZxMVw3L3HWfyGTGNgK8Eo3TzyamD6EfEzEeqXi0PwXib4RWZpJ
   RCkOBDmknk4Wj8uwryMEi1vFkZ2ekUi7DTvGifKFd1nMzrVPhhGA4V3Wd
   DpKobxVW0SHUTOVIWdBKgRYP86xCXQj+gFZCjkuG7RIDExv6MoV5H+kqE
   g==;
X-CSE-ConnectionGUID: /AcZU6JgR5+7s0iISU7QFw==
X-CSE-MsgGUID: bimeBgmzTVmwFmkljQOiHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48924355"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="48924355"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 11:48:28 -0700
X-CSE-ConnectionGUID: GkBJJWzpT0OSn8P84aJG7Q==
X-CSE-MsgGUID: SK92oXF5TgW9JtrVlqc7DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="137677945"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 11:48:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 11:48:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 11:48:27 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 11:48:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ol0SQdVqaDCnY5aa2jBCn9WVS8WEw5w9Q5j1TiBLeNqrXWRscYK99hRpFVWUCMPLnjdROWD3xn3vxDnMuG1f+wLYDT8IuIHY4m908u3gbRfhxFVSjc++JwAXaGXNpV6288pV/bKyRyboRnIYpNg6/E8RUR9Jxg1pGHE+BPLavw9hAFVBfa47pqpDn3QRvDf41BJ2a60HWW4AzlHTkx/p6LSr4B2ldCsvHdFYsfPbKrhPV1wQSU/12IN9Etk/7CZUgYrMRkQnW27Z7Y+1CFESYtIz7WMpLmJF+rd12MvsxbCdREykngNzO0S7wBUG1xm39Lg7Ddj13tVSGDW20hwLhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrnsib4rjfuVRJ84sJ4CIk0jZMFmvTGl3SYB2glzAOA=;
 b=V5r4g3+Nyd6Dawreo4zb+OEjG6SVu7q4H3jF9lu8Zs01sjXNpVrDTtJ1tR2Hccihx8C/YgplU6c6ryn02gDKYGIYLwT2JHVDaJxcecZLRKoCCUonP7FliV4jQpvY6s5clbEndbOdhUntDSCZ8gDSSPkFDK4vd7An1MZ7cZPskWJN++ZKu0RfzYp7yuIstbTwy8yC889BBEH4PPZgNq8L+FHIVbpjX3JJTgA7VfMXpq6L7Rxowv6OuENz3vCEERnzUk7bG3KDoKLOyVVlJIVw7WfKxqNV7S+8YRJQq0ONViO03+EvpoZiUXHXhG8bxWbXcdbffdHDFTdPBmsohiubWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CH3PR11MB7772.namprd11.prod.outlook.com (2603:10b6:610:120::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 18:48:23 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 18:48:23 +0000
Date: Tue, 13 May 2025 11:48:21 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>, Dan Williams
	<dan.j.williams@intel.com>, <linux-coco@lists.linux.dev>
CC: <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Lukas
 Bulwahn" <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: rectify file entries in TRUSTED SECURITY
 MODULE (TSM) INFRASTRUCTURE
Message-ID: <682393f526ec3_2903294bf@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250509134031.70559-1-lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250509134031.70559-1-lukas.bulwahn@redhat.com>
X-ClientProxiedBy: BY3PR10CA0014.namprd10.prod.outlook.com
 (2603:10b6:a03:255::19) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CH3PR11MB7772:EE_
X-MS-Office365-Filtering-Correlation-Id: 8158fd4f-658d-4b82-d8cc-08dd924ebcd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uxNAH7SsOtIGP1QIvsP+DmUhSXfLqys2iIPIo8UWDqPo8fUNEiBqWTavdYzE?=
 =?us-ascii?Q?+Ws2OtEzZVmWVDjb3CHugq6lIqyzW4rGCg7Wh5XR4ZxJMl76osqftpcHFouv?=
 =?us-ascii?Q?rjq/Km3YMkybxA5k6e/K36PBHF5UwEn5DGNDsLgHNeO9jZDtvn+Z6LeAtL/W?=
 =?us-ascii?Q?Xh3ik9lFS4qngqdy9NEhv24DBQFgDFTFZaUTvpSVdS1kqN+eEBcS+ambggas?=
 =?us-ascii?Q?AB1Ty7JUKgyoq4gyH7Z/d75e57ioKuA5HBIt96f2YO5FxEpeem65wD6K4/N6?=
 =?us-ascii?Q?DY4m+4qL3ksVPY3xXdhvdjnsEyHblhFamgRmn4+N+eeyjSJSMvfU12ih6adI?=
 =?us-ascii?Q?AFw6L6a35Zbzwm61m6Gj5ey/6lwMAhcWs37W+y8jAWS24r8xL586DkBLcRvN?=
 =?us-ascii?Q?3geh9Uqg4zO2U3EMl0shcZonoPKYpq7jBtHY3JpMLFUxjRf75RvG7edhsp58?=
 =?us-ascii?Q?cjkCXePz2/GksArzxbSlJWQ+3h6EMEGlJMcyBli24DKTPZJlT4nIo2Op8UXB?=
 =?us-ascii?Q?8OUSAGFAZn2Vu1MkyS/Tvf2knFrq2eP/Eyci9Bk8TlqXJ3inLFSj4u5c5HhC?=
 =?us-ascii?Q?74R+BazcUKOK2weic5Pmy1lVPnqVOoxnCgEQcJn6UJo2jv8izwEjyw/9t8qe?=
 =?us-ascii?Q?tLMPFZOMVs0n3dvwEp/JZn3Gj1wlk2h/Y7vBVmKdaesq5GBZcIWrXVMa4at2?=
 =?us-ascii?Q?GtUzytmsp7qmMKUmEpl0DoDdF85okkdcZmaKYZ3EPtPneTcj4YG/eRB/ofpS?=
 =?us-ascii?Q?0hPW0h6GgrQ3ZdknHYtT4G8MEDpySdYKdYY8YyWarQmG5sL/w0eyitUNHdRX?=
 =?us-ascii?Q?ZbmCn1HndhxCdlyakbnin+nVSEyqan60lgCkSKoAeTQpkowqu0WPFQ9uM7Kf?=
 =?us-ascii?Q?OkkAmCbmJJU56gCXm4Vt7zfI85MpNv/bSgszzOSbe6HpsR4BfHhs9U6t4S8C?=
 =?us-ascii?Q?K9bo0YHmkVpiWdxxU2gzp8RvlYMnmihKZXMSaEvjVCHWyDvr3jnFWurv5nVE?=
 =?us-ascii?Q?GQH0Ncx2ZmTbYgNOoieehDXWAPsK+A8KnxaT11QrGjjBaAaUhXEAiRfed27/?=
 =?us-ascii?Q?Qou5wgB0y2AlWp5Jk+4lWQ25bNwlDm4ulGhgwYWmnWx7Z2ptHSFevWVvjiQX?=
 =?us-ascii?Q?yEtkh09RzlrGiNur3nSbwrUtzUhKyKmvSwVf6NYRf5B/gJN/T7kGCFYi7U84?=
 =?us-ascii?Q?UNDK7iPDIztCgHyeoLp6jPIMu4ybUR2IFWHE9m+/d3CGT0sXTxf/7gOROgay?=
 =?us-ascii?Q?0AU4wSNQlBqkuss4t2JcWwQww/7z/m+Vf72KycqIakvMRNSiH2qI1H+zrFiQ?=
 =?us-ascii?Q?sy5B87tiVRK/2o0LWODlpQTHqJHVlky6tBhh3KPvlVe1LDsuK+97l+E5euLR?=
 =?us-ascii?Q?TzN6/tXyzUAgNGhKRZD3HKNl0MlHdvoaopYUCnOcjKHgrb/iRl4khWhbrVbl?=
 =?us-ascii?Q?DbL34poj798=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?brlO68RFrDRWBrt2yV27lqs8Nx+J1PObGmUn7Ajg6sXxg/PXFn8MT4b95lY2?=
 =?us-ascii?Q?9KNYqrFkHOnkD7aTAKhechA+UEdAn3z80C/+fi0elXYJxPuYbBvwDXFj4eee?=
 =?us-ascii?Q?6LjWSotJrX8uRTMtsaY2Z7oPz45DgdfnddC2umuaamLKcO3xMxIY9ysbKwt5?=
 =?us-ascii?Q?IHlwQPeb9La7Tu9nzRX524JXYUGfI7hkxcMWLIKziAiSilIic6vImMFGuyn2?=
 =?us-ascii?Q?pmVvJaIx+TdxvFG4lD45Pkma3UEhzx0IPl1wY2nrbJiqDJYWl887Q2yLonC9?=
 =?us-ascii?Q?f1pzPdLiLm3SaCuNhefXPzGBz+u/RNH+nCkBLaGOOpIf8uR+14t6nDenvPm4?=
 =?us-ascii?Q?eqWDL2RLACIkiVqCkFOWcZHYn3cHyrwCo6hZDdRe+cDhsj6ZBQ6z+lEJK9P6?=
 =?us-ascii?Q?i6V9f9XxwUZtabyXYyxHBedn/QC3hfgWB7w5eGK56yPFTv7jvUc4FV/zWpZh?=
 =?us-ascii?Q?p+VmvE/k5Zqff/LhyW7N2uwZF0llwPn8fEHlaQQV5yE5hn19hB3UQeWId2Ds?=
 =?us-ascii?Q?P2Inp43++25/UwNoj1zOZVi8B0m0VyL83q3jPfp9QeF9qsCgPJcj6B1KPM0p?=
 =?us-ascii?Q?goM1xaMuBGDPiuMH9IhQi4qlVtB0+H5IZBcg+Ogmsc5LfKfM35ue8UUao7IW?=
 =?us-ascii?Q?397FVMpoUn5mjHn+PSRb5IYyKryPjGMts99GZ1lCHLAJVT+45HrxjngPCRrc?=
 =?us-ascii?Q?RPVSwpCRFz9Rw6PBQ72XifFO7U50qUOASA+9Ke63dorlmAXmkYkf5dr2cNaf?=
 =?us-ascii?Q?Wd0vkuEEVelXQbY8iLrNo0cFE6OrEklduvvOAy71SBkiUqC+rf13bZqnAAY3?=
 =?us-ascii?Q?zKnorZL9uyEcSQB1cLcaRE7HDayqVyXEONXeD1igJphFb0XI3pPX+V/hutfQ?=
 =?us-ascii?Q?/8QGaMpwfc7drG5NOsz+0NZj7S3MmeyppoecZx5U0HIDAQaceKJg2I76kXWo?=
 =?us-ascii?Q?TrFzj3+VgtAUSOV5I/paaZzq75GG7wK9DdslJ5ivc1YCCCfWoT2j+SUE7B/c?=
 =?us-ascii?Q?WZHLnFR0KYEvS/hIBcOCz/vkhzGz02bMaf5vWv+FzllDVyDcR9jAnQrge98q?=
 =?us-ascii?Q?kgtZ3sekTq4ApL7jq75hzEZayp8qjWtMQj9WKMRu5qEK5Jh5wvEHQKkabdkn?=
 =?us-ascii?Q?MJ1q0tivSQCF6esiPnRrbo9ts4Z/HmcEhWrz43xMVxqrQYYRBXL+7Kq6cIGH?=
 =?us-ascii?Q?t5BuhnGr1C0cXkujhpUZR9Up3yEG3iOLd66EP3/4W+LDqbhDViuHvvSF/xpg?=
 =?us-ascii?Q?eHtmD6TQBqDRoM32JU1GLUtwgLEyX/6GLGA5xMgKDxa98SLtx0u3LWQ+3mA5?=
 =?us-ascii?Q?VOpBF+489kQnTGmei8Jw3T9ucphVYydQ1VjabtXoylb3LKWB+pmz1GEauIXh?=
 =?us-ascii?Q?DOmUMQ2cHFuYtqhDwzoR9o/mU4aaXCgEjnFj0e6UQwYOuSqsp1vOeOQVz3t6?=
 =?us-ascii?Q?pDXpH9AXZfo/uok1FtNMbrmH/uykUEnBgoFPAmyNnXab94bneEZuCG1sLBSD?=
 =?us-ascii?Q?GKWRMHbnUYnZoQ/FhJtjFg7TiFOutLAu6ATf75g0ZtTTMqQPXFf1p+xPkITK?=
 =?us-ascii?Q?qiRfd1QiyqaE/uZfyj/dRAu46YdBBZlGiMJBwYVjexcwqwAk9c+FWyu0bFIO?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8158fd4f-658d-4b82-d8cc-08dd924ebcd4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 18:48:23.1496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IzXv0XQnGZ+hL1VddLt0jT97QhvW8c5967XSSNLh34Lih4rkWeOE80Y47mg4OftDx6kBsakB+/Nfcrohrak6BfflDf93Fm/ecSx8pPUuwWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7772
X-OriginatorOrg: intel.com

Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 7515f45c1652 ("coco/guest: Move shared guest CC infrastructure to
> drivers/virt/coco/guest/") moves drivers/virt/coco/tsm.c to
> drivers/virt/coco/guest/report.c, and adjusts the file entry in TRUSTED
> SECURITY MODULE (TSM) INFRASTRUCTURE.
> 
> However, commit b9e22b35d459 ("tsm-mr: Add TVM Measurement Register
> support") also touches that section, leading to some unintended state with
> the two concurrent changes of these two commits, i.e., entry
> drivers/virt/coco/tsm*.c is still in place, where it should have been
> deleted. Note that the existing file entry drivers/virt/coco/tsm*.c is not
> needed, as the files are after their renaming in drivers/virt/coco/guest/,
> and there is already a file entry in this section for that directory.
> 
> Rectify this section appropriately.
> 
> Further, commit f6953f1f9ec4 ("tsm-mr: Add tsm-mr sample code") adds
> example code to samples/tsm-mr/, but in the MAINTAINERS section, it refers
> to the non-existing directory samples/tsm/. So, rectify that file entry to
> the existing intended location as well.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  MAINTAINERS | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6dbdf02d6b0c..e8a21d6f89f8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24991,9 +24991,8 @@ S:	Maintained
>  F:	Documentation/ABI/testing/configfs-tsm-report
>  F:	Documentation/driver-api/coco/
>  F:	drivers/virt/coco/guest/
> -F:	drivers/virt/coco/tsm*.c
>  F:	include/linux/tsm*.h
> -F:	samples/tsm/
> +F:	samples/tsm-mr/

Thanks, Lukas!

I ended up redoing the merge with this fixup and crediting you there:

https://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm.git/commit/?h=next&id=15ff5d0e90bb
