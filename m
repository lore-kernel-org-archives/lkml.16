Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200DF278162
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744223984; cv=fail; b=IR4FnYsN2gp34QQANEqRD9HsPNrGvXFtF6uq1KK+S/KP/vyvpcjmuDI9Pe2Foqa9/cWuuyTNrQOkdPL5OAuyhSLayXBXO47Qy8nsRy6M+2pD7zpMXmQvhM3LBWAIu+Uvd8xLBMemOunamVsNz995rb5pY8iKdNVHlFiMvFsYUfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744223984; c=relaxed/simple;
	bh=iYwRNrp2NFVtFyfTZnXsTiTeSl8MdFuiJhtuJ2hjW5o=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=d96ZW+0aTpnbsUwvb3AXUGBsji3P6L9fUWa1c29OuYTQpe7gLQCOk4Ez1pjjJl5hPocpksFdiZN2Ck/IwG+eFtcdtOVZ+geXEV0/WF4l6EKDD7c8GKzv2YLumwzBfuBjgqaCT70Ydveqaa4qmbrik84p83MNUlHfEk+MZx65oXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bd3Sq/90; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bd3Sq/90"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744223983; x=1775759983;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=iYwRNrp2NFVtFyfTZnXsTiTeSl8MdFuiJhtuJ2hjW5o=;
  b=bd3Sq/90bCsYiTY5TZu+kR7AnmyfwHTBvjQxF00Yat1fHcjV+j5jQP10
   e2yEvRdUuaoVdrk6boMHw6uX8z5BhtJ360Bsp2IeukkrNoPA9kZFW2SqB
   mIz7g9mgf7IHVAbMmzuSfx41h4KJ2JmzKo1RT/rtMfvCqrI+dmEvkdSV0
   3zpfPwQ7MaGoIZl58dWjouuT56nRnJibXGeyO2mmtpYg+BVlZzkTpuVft
   rZzkARi42XpJjcCh4sqvIJBlcT1oNjBUdMQNViMeD8P51culYGHH0i7Co
   3sJ+qMrmlJnDBs0KTD4lgKP7CgNhCI7eC4VmeFsCyEKdHj2jqtzovO82G
   w==;
X-CSE-ConnectionGUID: 8hwIIEZpTOO0cX/zAcqu8g==
X-CSE-MsgGUID: lryeRygJT6eYMRXP47Pn5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="49515637"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="49515637"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 11:39:43 -0700
X-CSE-ConnectionGUID: +XOGyg5dRQS7XE38Fc35Pg==
X-CSE-MsgGUID: Bm+IP0MpTlqgm6qcmBSdWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="128649866"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 11:39:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 11:39:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 11:39:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 11:39:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDZQC1fq7qRGLCEPWcK1PEVdjxnHFwuDqA83a2tituiGpeqojJKhnh27effQ7tp032YmDubWu88y9UkuTPieF+Rgp01lDoufasSZYjyuavkLF5Lqybi5Y07D/5+7TDOOsfAwZkZt4JgPkPUh6/GmWS4tDN9mtqdpC9vnQK/vBMSyq88v8PxD5wMADNbJAaASxHIJnSx0wyYY33B4nhR7IE8iSAkRAI/XQTvpQhBizFDgLOxy2R/TCXMh3T8JOaK4D0bABMDAXIZCOZANx3DNAXb/rvPWcjbqp5UoGjzKdnY33YXWA5Gwnu3zdJq4KpvWMw+NHpYKTeYWtaIHvpsAAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NConcj6AgnVVq7GFzMDOzvh1VGiKkOeUT1SafE5T9qM=;
 b=cuZzuc+gC3aqQMHoF8HmoS9c3Mi1TTvA5xwP5q8ruhd7oXSvswFOUVcHLy3iYmARhPI9rzLXtAVrn64Hui2Si/cytUGM2+g6YXB4oUJ52y+k9BqH72+FOeS9gY/htwVLxB13rlj9iy16/c5TftQG3wwU/TnDTUQ9sdLmD90EAcmmejevqBsRlMYVvx/hLXycpXcGLMgc+vYLWp4lElovd4cUhp9VdxrrdQmQPRv/Rgs9nJoDCeagTSf74jC4QgLdiAdifPY/5Y7l7ha94rSVsEDFqQkcNEgDLSHPAcd4Ml/EtRgEPjvavUigGBX+3ONxCxBjtu3Rz6L1QbkLGd6e4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by IA1PR11MB7368.namprd11.prod.outlook.com (2603:10b6:208:420::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 18:39:38 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%3]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 18:39:38 +0000
Date: Wed, 9 Apr 2025 11:39:34 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Kees Cook <kees@kernel.org>, Dan Williams <dan.j.williams@intel.com>
CC: Dave Hansen <dave.hansen@intel.com>, Tom Lendacky
	<thomas.lendacky@amd.com>, Naveen N Rao <naveen@kernel.org>,
	<linux-kernel@vger.kernel.org>, <x86@kernel.org>,
	<linux-coco@lists.linux.dev>, Dave Hansen <dave.hansen@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>, Vishal Annapurve <vannapurve@google.com>,
	Kirill Shutemov <kirill.shutemov@linux.intel.com>, Nikolay Borisov
	<nik.borisov@suse.com>, Kevin Loughlin <kevinloughlin@google.com>
Subject: Re: [RFC PATCH] x86/sev: Disallow userspace access to BIOS region
 for SEV-SNP guests
Message-ID: <67f6bee647aa5_1302d294f5@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250403120228.2344377-1-naveen@kernel.org>
 <67eedc35be77d_464ec29462@dwillia2-xfh.jf.intel.com.notmuch>
 <l34f6nqq3up23cvrgmebbufztqkvfil5eahecukw5bnqekccpj@6nbciquhwxxc>
 <1bc4c506-57ad-38aa-d56d-ed058f54708e@amd.com>
 <fd683daa-d953-48ca-8c5d-6f4688ad442c@intel.com>
 <67f5b75c37143_71fe2949b@dwillia2-xfh.jf.intel.com.notmuch>
 <202504091038.5D9B68A@keescook>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202504091038.5D9B68A@keescook>
X-ClientProxiedBy: MW4PR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:303:16d::9) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|IA1PR11MB7368:EE_
X-MS-Office365-Filtering-Correlation-Id: d5219b4e-46a5-44ac-1d1b-08dd7795e1bd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IhbAwWeZfeEqDDqyP2sR7u48WJ+ehtbcBK1Xim6JhyRQzD5X6zEnHA49oqMK?=
 =?us-ascii?Q?P/tkt03FG65eDTNpo3EzSQ6eSUWmi9h32EpbWCHehi/M3zEB+uqp7bEh8WyA?=
 =?us-ascii?Q?aBl1T7wY++DmMmKHaZkb0x2Aw6Ef5MjHf1z69/vk/1DTfrNsPRlyiq4tPzie?=
 =?us-ascii?Q?dkn0Zt0iFtDUu9l/SO5rcUvp/xduXiebKF91I6LcRx9nyXUhDqc/FsfIlvTg?=
 =?us-ascii?Q?bAVCUpmdxEazgcIY4ixYATEqH31aRTv7RWr/b06p0EcdShakvHI2k9LxtIjx?=
 =?us-ascii?Q?UrWGve3TCWh2cGScLunzthax20OBnnHXDtI2h6aEoBKr5zzSdceglG2guSLd?=
 =?us-ascii?Q?XnBB9jnnQDrcUkYycPmnxW2TgaXxPpDGMz3TWzsFgISE4tPNXVZHegT9Rrji?=
 =?us-ascii?Q?q+LS163pIDnZILmcDNcHB1HBiOu4Uo0wHTpYk/HI294GJ1l4WqfZJbqTO/Tm?=
 =?us-ascii?Q?i5fNL4jZUtWZhcBtMvHs3kH2bAwP5x76EYkH5cacH7fLIi24ccrARZrhOHaO?=
 =?us-ascii?Q?VZJrsc47G40nVMQA/I7X48mTkejdX+wIO41+ehkYVhk27wIYODxO/oFItd39?=
 =?us-ascii?Q?7NKb9kYMlx1bTQDb7p/yVsTOci2urKqKcimuOLfaBIOzB9wPo3Ot5jAvpZYt?=
 =?us-ascii?Q?Y+Mw/k2kq8EExxnpPdUiMNB2lYX70rBsB39CDbw0S31obbTlceG5wWS2mw2J?=
 =?us-ascii?Q?2Voj9bI8o9ItpK7+S/B9X84TylMq3GiB1bIJzKicrZff7rkbru6k/ZNV7Wuy?=
 =?us-ascii?Q?VY1Tv6EparwFSOspl5B7rG8rFcn8D/ebAhk/m6UPMMI4TrwJbBZBVvS9XDQt?=
 =?us-ascii?Q?8Lwr/hZxjR0QT2cMq9blLoMTPGoeA9twxzXrlqiD+j5sP2B2c+AIv5PGWilg?=
 =?us-ascii?Q?bGhos77RWaxiPU+cMiTHB8Pw0A74o4qsIOdfultEUQyg2L8lWD3Vvj0CZ+oc?=
 =?us-ascii?Q?A8WfJi4YRTQlcfaZCKnaAOGlyDiuigQm2y5rJnWKPq+Mrad+lSGBWQS/4eRm?=
 =?us-ascii?Q?18VwG45Srs3xabW9EORHmxOL5KHp/jjr1KbAVgjG4Rg9Q9c9FVb/nJ7rWF2F?=
 =?us-ascii?Q?hdDLs9CKzfdiBi21wo2NYT9hum1NOZg93TyODPTXO4shC0csKNAxu49irLr4?=
 =?us-ascii?Q?HIlG+X9Q3FttlxcNJUbGEs/l9syCP75dL4MZC2sZ/EHdgfJbaJzw7Nv/dgAC?=
 =?us-ascii?Q?HXKvL8QLFPhJpgkEUq8aP/Anms0wpMr7Z8NYRUZ9IQJTMpyGvY5vTlBTrhxk?=
 =?us-ascii?Q?u2GvJcR9ECYmo9gpGVzUyMDpXQ1u6nN1XbmrdSAuHku/5SY03JKcTueKoHd9?=
 =?us-ascii?Q?30iC1sTFUnmMVIi1GtaB0lII9rOGXgHmWmrDD/Y28mGKhrhJSU+jlg6tRzr9?=
 =?us-ascii?Q?+Kv2fk2GQwQN5yiG1HLxs5h4z0N9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7SzAX7b6vUrE01mLatqWpDY0rvqldgPIr9jpLmQ0MO72S1StKWiguxd4XruJ?=
 =?us-ascii?Q?QyE44yfRGvuik1BADLmTOqorrn2LGBhYLktR32kjV/f4i6dF83DJwEfNaXrG?=
 =?us-ascii?Q?vYUoo1mSlr/I+J4fT1k4B+8D9A5SfQ1fsoa1tDneVf1e9Ly94GYDxs8w0/cE?=
 =?us-ascii?Q?2k3Mfpy0Y+e5WP1QSIvkkVzPHMhIRIDy8IqRNIhyAtZQ4tx+RpijlyQy8CXW?=
 =?us-ascii?Q?xNSQt8NsZqp1Tzixh4rOcNz2NkCXWPM2WSmL5drMjf7fK9Y6yQDWAfhEE3qa?=
 =?us-ascii?Q?lvdW2+gavcU9iZyPEEovHB2yjCpoSfR2Rbze/SJB0gSUirijEkd56QZyN10V?=
 =?us-ascii?Q?C6I4Qko5auPAG/dun4vkB+mheXhtNs+Xb5qEkfUCgL0M05FxIaOHLjwE1frC?=
 =?us-ascii?Q?Qg1i+VQsObomTqD6PU1CKUNeGrOBQw72z6OhenjLeJ9QPdE0n4b9mMttC2rd?=
 =?us-ascii?Q?qgRbkg7OIqJQM4r7Oq6pOoKB+MmuClPtjK1aJQniV7Ar5CEMDIMXiWCCpphf?=
 =?us-ascii?Q?e/B0W7Ra66d+TOnry7R2LxkYbaalawjtz2ppKCHM8ZGRlsM5DvWJYd4k4zfs?=
 =?us-ascii?Q?JmCAv/lTrDooN4x1pGxrmIJI7WiAGr391spXgVRT9Z8yTttjQxoK1xD8lNDg?=
 =?us-ascii?Q?afjVxj/cIqI4nR9vY54QaQzfTxb5qmkrVi/DFPOKJ2XYnlTE1bHf75fa4sDM?=
 =?us-ascii?Q?boH4oQ2HxG8kMky2ZnTvGIQOWHONacRTfRprwc4REVV8KI6R4CgK4qT8Pwd7?=
 =?us-ascii?Q?FPB7FWjtUluT43gBVNwNhos1UzwSoAHF4rPrPuvtL1stCZbaIUgHVspXPdnt?=
 =?us-ascii?Q?L50uN+U618sAUeDE4jXunrUS+SYQArR6HmiL8h5Vl7zSVesTgb1VXnkN0Krd?=
 =?us-ascii?Q?aVybBMdRfJP3JBIsPhDcqlqVmu76XHRhwquAo4dNHukBSEMxSWjRsOGFI6mt?=
 =?us-ascii?Q?uYkwRedpuhPYrUwEsAhXpMJ0wunUf0JMWiIJ3vJe9P8ijmMSa9wZwLel26yD?=
 =?us-ascii?Q?OOydsmCNUFRApz0j1rE4wqufc4FuXImRQNaauBl5WiFUWZ5as42uUUlMSFjD?=
 =?us-ascii?Q?famqEqwKatH0euRS1buAWBEL8Wvd4iZipSMFkO6W1THuUwFY7+kwO0EP3Iiu?=
 =?us-ascii?Q?NlDj/nt8nVm8N6r1qSXCoYIPijnew1J+9+j68GsjwJ9tMsDN1tdU+o8iC0L2?=
 =?us-ascii?Q?IKnPmnlaRQBtCqO/R6KLEN0TLh8Fnu8yNCs3nu/93118CXfBSERVdMrAv5M4?=
 =?us-ascii?Q?QRKLusRcl8BIKFUP6bnPtuS6yM4hWSwoezWbIc+5B3NqgMyM3vlMEAGP0D8F?=
 =?us-ascii?Q?vqEx0TE2m65ZbxA/gfzppnAihY/tniwSQzhSFSjU8EGLT5gZEuXJEaTMDAIG?=
 =?us-ascii?Q?DHIGrWpyvWVVEaZsqt5Na0EALzuqhMNtfdU7SphUWczN3+MPQpdqn2NaWbMj?=
 =?us-ascii?Q?QWG7qMj+70ER+YU0jJgIMUI6LP+7Oy8jqzeGJeQdpSR1dWUzio6yvNEHiSwz?=
 =?us-ascii?Q?bh6GtgcC7OgTkfm4EoyGfoWZfJ2eVHm6+VwHgZ6aoKteINEIepa6coAEsAMY?=
 =?us-ascii?Q?UFFOrshz3HnM4q8FyKssexEVgudGTXx1w11pnY4+4gsvXlYb3zXMXdE9t0KH?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5219b4e-46a5-44ac-1d1b-08dd7795e1bd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 18:39:37.9314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUGURy3IGVaXtxTDAKJ60c3cgkpeQXiL91o7+xURFi/YuesLcevAQeXU2urOWzFVBFzKDju/zKpvmGL83y09DKlZciPakgzE1Wu7JzNktMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7368
X-OriginatorOrg: intel.com

Kees Cook wrote:
> On Tue, Apr 08, 2025 at 04:55:08PM -0700, Dan Williams wrote:
> > Dave Hansen wrote:
> > > On 4/8/25 06:43, Tom Lendacky wrote:
> > > >> Tom/Boris, do you see a problem blocking access to /dev/mem for SEV 
> > > >> guests?
> > > > Not sure why we would suddenly not allow that.
> > > 
> > > Both TDX and SEV-SNP have issues with allowing access to /dev/mem.
> > > Disallowing access to the individually troublesome regions can fix
> > > _part_ of the problem. But suddenly blocking access is guaranteed to fix
> > > *ALL* the problems forever.
> > 
> > ...or at least solicits practical use cases for why the kernel needs to
> > poke holes in the policy.
> > 
> > > Or, maybe we just start returning 0's for all reads and throw away all
> > > writes. That is probably less likely to break userspace that doesn't
> > > know what it's doing in the first place.
> > 
> > Yes, and a bulk of the regression risk has already been pipe-cleaned by
> > KERNEL_LOCKDOWN that shuts down /dev/mem and PCI resource file mmap in
> > many scenarios.
> > 
> > Here is an updated patch that includes some consideration for mapping
> > zeros for known legacy compatibility use cases.
[..]
> > diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
> > index bfa444a7dbb0..c8679ae1bc8b 100644
> > --- a/arch/x86/mm/init.c
> > +++ b/arch/x86/mm/init.c
> > @@ -867,6 +867,8 @@ void __init poking_init(void)
> >   */
> >  int devmem_is_allowed(unsigned long pagenr)
> >  {
> > +	bool platform_allowed = x86_platform.devmem_is_allowed(pagenr);
> > +
> >  	if (region_intersects(PFN_PHYS(pagenr), PAGE_SIZE,
> >  				IORESOURCE_SYSTEM_RAM, IORES_DESC_NONE)
> >  			!= REGION_DISJOINT) {
> > @@ -885,14 +887,20 @@ int devmem_is_allowed(unsigned long pagenr)
> >  	 * restricted resource under CONFIG_STRICT_DEVMEM.
> >  	 */
> >  	if (iomem_is_exclusive(pagenr << PAGE_SHIFT)) {
> > -		/* Low 1MB bypasses iomem restrictions. */
> > -		if (pagenr < 256)
> > +		/*
> > +		 * Low 1MB bypasses iomem restrictions unless the
> > +		 * platform says "no", in which case map zeroes
> > +		 */
> > +		if (pagenr < 256) {
> > +			if (!platform_allowed)
> > +				return 2;
> >  			return 1;
> > +		}
> >  
> >  		return 0;
> >  	}
> >  
> > -	return 1;
> > +	return platform_allowed;
> >  }
> >  
> >  void free_init_pages(const char *what, unsigned long begin, unsigned long end)
> 
> I am reminded of this discussion:
> https://lore.kernel.org/all/CAPcyv4iVt=peUAk1qx_EfKn7aGJM=XwRUpJftBhkUgQEti2bJA@mail.gmail.com/
> 
> As in, mmap will bypass this restriction, so if you really want the low
> 1MiB to be unreadable, a solution for mmap is still needed...

Glad you remembered that!

This needs a self-test to verify the assumptions here. I can circle back
next week or so take a look at turning this into a bigger series. If
someone has cycles to take this on before that I would not say no to
some help.
