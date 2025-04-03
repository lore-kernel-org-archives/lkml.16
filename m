Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4FB26B958
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 19:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707202; cv=fail; b=M+1WArkbFY4Lab2SEMKfvnm2yuIVSB8keHrl7vRaGDLZMR3PIT7WgdvMWKwfHLcugKpiuSnklrHklsPuiXuzX0K6iuUA7U9HxdiDcKwHvlazSBaTEJ3LWDzS7izzJe9ND/ZTIxQeSMEX2dCjy1rPreZROobxi/oAJuxs50RrXvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707202; c=relaxed/simple;
	bh=fRRoTIs/bUruAvHa5EhysrQrkM5kNy5LPvA5T6o5zeo=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CXpdajSQQKNLQKIzJRC5oOPD9SqlR65qlsH9ZFsTonisoEXX9EMXzFoYPdoluj26JokXqv1eZfwlI8Z70IaaEo+xkJcCOTZpu2raexT+UenOniW1d6S2SrmmPRVCeV6Xf6Au/9FwQ4DS4EkOUUVXgykOlnQsiMNWCZz/H0pJVMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XWeJ6oip; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XWeJ6oip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743707200; x=1775243200;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=fRRoTIs/bUruAvHa5EhysrQrkM5kNy5LPvA5T6o5zeo=;
  b=XWeJ6oipSIl8RjVlUqUpoVr6avYp50C7/8E67u9B4fJK0fhsw3I2bFso
   6JCztdp+NlI1x9C6xS1kJu+8t5mhnjMNPWcQTcYCCoOQbKGKLYuh2C4Yx
   8EoAvdGleGid64zaRXgqrWykoOoX0I7Zj+KI5gnt8LTghoWn/V6thK42n
   UcPNYzCPNZ7MWuP97igSoj+yPTsg1ug3iYfC791ZMkfXaKKHbfFOn0dKL
   anKThq+qHJFPxI0gcTsBpC3qdF6/Rd2peC5ugiqhPqmlTn1yYWIQYO3jI
   67D49Os/DImnf+zEEQEwN3YIY9/n78BpFMm3e5JDAYCzXzL6CgN+HMCsM
   g==;
X-CSE-ConnectionGUID: Uj7SAIHbQCuEb9ivELgJlQ==
X-CSE-MsgGUID: kvuyQLHESb6Jk1WBxd2bMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45019083"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; 
   d="scan'208";a="45019083"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 12:06:39 -0700
X-CSE-ConnectionGUID: 0dgNA+IjQJq5OaY8PQ86cw==
X-CSE-MsgGUID: VpMeisjwTvmKpEHb4k6vPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; 
   d="scan'208";a="128018454"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 12:06:39 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 3 Apr 2025 12:06:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 3 Apr 2025 12:06:38 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 12:06:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oBR6g5AeOUEBs0BFcIog2KqixQiNqBqy67eQ3YWbi7gtc9LdPeRzgzdPliAnIVRJqAW+bNqqZPIo57L0b1KnwqTMN4QGIRABS1FgAPJ4fuB2KvI0m4EfBMN55fSFVUTiHfblLNpyQ3YWTQjSzCO9BfpikhjOpQ5tGoNMXezQ19aoUohb3jb4ogUpQahp5uBeKIQfFFyPT31BNoJZtPXczKgUt6fVIma2iJP7qHGk+p77I4J8bb9fMSeiW08fx9RReMD7IJAC10T8VwuR6sbbTfCf0M7KyXPQHdE0IQjml71zEaBd13SzxC2qhXE/bUPORHK41MQogT2Hjff3MSK63Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g3yW0LWLFKuyDUDAijQDrhyN7VXdPlKy+aHa0Lcq7ls=;
 b=H0Pm1hZos1gNRhYnj6/7B3/MRd1dUG3wUSnzf8NCDeEeSEVXEb7Bjo0D4UNikWZZPKG6c4Sr4ZKlAzy5KJXz8YU9nhpJxUbQx5Af1KC2zLwMiL5xhSANqXPuA6c6h++sVs8IyzKisvsIxmKutsJfgyP5XaHdO5OPOX3vQvhGlCv0IEaofzjYglxL8wQgdR4wmx6oaTv67tUSKRxIHZnMvFdcopvUJf78/oMpBQUzuoYOQdV5nYooc9er0rEkc18baZDbG2Ss/fZ2Ckv4Fcb9lshZBkuoKQT1Z1UJlxfMV4sUDnglgWmpQMGjCWDHTQy6uPJsfT6SU+4dTUwTU95GRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CH0PR11MB5265.namprd11.prod.outlook.com (2603:10b6:610:e0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 19:06:34 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%3]) with mapi id 15.20.8583.041; Thu, 3 Apr 2025
 19:06:33 +0000
Date: Thu, 3 Apr 2025 12:06:29 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: "Naveen N Rao (AMD)" <naveen@kernel.org>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, <linux-coco@lists.linux.dev>
CC: Dave Hansen <dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>,
	Vishal Annapurve <vannapurve@google.com>, Kirill Shutemov
	<kirill.shutemov@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>,
	Nikolay Borisov <nik.borisov@suse.com>, Tom Lendacky
	<thomas.lendacky@amd.com>, Kevin Loughlin <kevinloughlin@google.com>
Subject: Re: [RFC PATCH] x86/sev: Disallow userspace access to BIOS region
 for SEV-SNP guests
Message-ID: <67eedc35be77d_464ec29462@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250403120228.2344377-1-naveen@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250403120228.2344377-1-naveen@kernel.org>
X-ClientProxiedBy: MW4P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::22) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CH0PR11MB5265:EE_
X-MS-Office365-Filtering-Correlation-Id: 749dd24e-4d2b-4ba5-253b-08dd72e2a636
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0IP/JSW/8bvPpGGCxwIyQGPwQds/LmuQs0u+iSO7cda40RlsRiAU62i4gTZZ?=
 =?us-ascii?Q?NoWGtrLpRpskJ3qbj37OlsOLmF2YGZA3XnMQAd3Hns3GUJFT7A6C/FIAqSzU?=
 =?us-ascii?Q?mfzhJSfOp0eiKZuJGXBlcMtq/pPZvqV75jLMSXMH/mVCe1Sp2yBXyNoYY8uk?=
 =?us-ascii?Q?zzC4kK18APcgAZ0/fXCuWSnDepIys+fD3ApI2qx+YeE7tnZt1cQ29ZZIc51H?=
 =?us-ascii?Q?Nff3JxWTM33rotg5cVXVRjkgwJZH5cGTVGaQz8J8lu5Mt2HRv8mZn/1UBwfP?=
 =?us-ascii?Q?zi/9jfI6gHWzAco+okmPzoik5jh05CShqifongtEkRhRljuZ3O17JwKi+tvk?=
 =?us-ascii?Q?YeMhsbvTlPwWzaPdWZ0+Kjco1oOkG8fjlX6ts7wImhAtr9nCBuBK08FSkclu?=
 =?us-ascii?Q?glVoqbZwVQMvw7p/WuCRCAuXyPOJlSCGjpr0E9dG33GYgLbdNRIRzBDSCclt?=
 =?us-ascii?Q?SNbird7PXGXIclQHyVcTOZdRhtvYgmjgfXdhPIaq/M53bgNA0hfkOq4psO3b?=
 =?us-ascii?Q?nSn4zxzgakEe3E3Q507setSO1SNoVWoANY6J2RExXuew56cMblL+PJrR2gxl?=
 =?us-ascii?Q?0a/GFRAs+gQwTsj2qHJm/0ypMS3524UebnGeWS6ZtYIY68umpODDmCxDkUPz?=
 =?us-ascii?Q?ruV64YtTrTSPsI1FnB1d18I58UrrEkB4OvpaOB7FzkTwO86rML5KHIqDpO9U?=
 =?us-ascii?Q?1RXAn9jBuzC1q+4hnf/CaFmRPHroaokAcc9Wwf2iLNmVv5qp9UhHWtk5n3DT?=
 =?us-ascii?Q?tnauKcg1UAmKLmNPozvnt55G3XhEAdGqSOq8IbpIFgSRm9rMsVD6K7sTYCrJ?=
 =?us-ascii?Q?Rv7XhzJmqKeq0Vi59WzOYTLoP+pqAjiac9fD8D8AcYiuOjmjcgpFpJMR3V6E?=
 =?us-ascii?Q?/Hot3bQBN3tiemhqpuq4QJk+o/MAvfIpLFwuItdP4CisODBF9k6r+BdWYiqJ?=
 =?us-ascii?Q?XLg9oFUHWqWgxEuB4XVwwPj+5z2fJ+78d89QdkK67oJQMeyRyMsUXNfKftYG?=
 =?us-ascii?Q?KIDmV5vqzFn6Gboh9cURMYDNn1Qc1eMoxGxF3PiH2GwqBZ76osJnxKme/xOo?=
 =?us-ascii?Q?wMPKspDajPoVRZs2GLFTMgK7vtvXYlrtl5UZvNfnO3PBuFpuyTmJtbRM//bJ?=
 =?us-ascii?Q?wu2ecZMBYfTjq86H6D/9U/WjhBhZjAmLoueahzMHrCJHR/kpdSVYcUP8slrl?=
 =?us-ascii?Q?3MmrpTAugRWpOySExbE++u7Ep4IoyqXwwC9KDYBTaROVLxiZ3KUDKgWyptJo?=
 =?us-ascii?Q?66Cx7lWvO6D/SroaAptAZZt05uPsIV2nQxd/TMCrl+a19FJpgjcZpDmO6NJV?=
 =?us-ascii?Q?iy4Azz6juzso2ppno0yCpm6/Ft+aXX9oBasOLVls/32tD/jQitrX1lQwOOQb?=
 =?us-ascii?Q?+7X7CMzmEJR8UUNOzjHp4LSwgJBv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PuWDsD6ksb+zz89bQQi9c+Ml2jNcvlXakpzxtQdznPArs9yA0tz8iuPfiwEa?=
 =?us-ascii?Q?4Gn+6D7zvVwEaJrZcKQe3k5t6UVz3K8q0l+GTtLPAPlZrmaQk+wsJvj/cz1D?=
 =?us-ascii?Q?w3l79fCrVFhAaJ4TZKOzEE18jhl91HB+VYckbbAoE6tSNm4Wsr5+gizfm5/2?=
 =?us-ascii?Q?Nw1duszZZ/EcnWDQyjP8EDSK1wFrjirXJeLcz1pBD7J8B6ylXJFBoug9Po2q?=
 =?us-ascii?Q?9ZpEgZI6QFGh0cJOeVmtVTSlY+EAVB7kUqk934ev7LVO3PAI8zFBNx3UDtts?=
 =?us-ascii?Q?rQr+eHMQnZumY9AFwVduta0Er3/yEEIngulluP6DgtUjacaVs7853+FxompF?=
 =?us-ascii?Q?4U0IPXRi9zGLiatxK/O6vIgcs4KSQhd+r9MN9TRgWiwqb/GrC3VAk40AKGl1?=
 =?us-ascii?Q?al5QyBYExpLLOxtytukZY7pI4vQ5XyAJ2Oyl7Hj/9GwZOs5wfnBjs+u3oggW?=
 =?us-ascii?Q?qQx87wGJSg1ec3uOEecvZzFVyxUpRrCKnyRF8od19XAlVVhnSsV0kNXuMF9E?=
 =?us-ascii?Q?9e2WiLIL4aqCBRl+CpAVkfjkrOWJI7vtYJq0A+z3aGekIcprhQC9ghJg+2Wp?=
 =?us-ascii?Q?l7NDAxAAdqe2hnlZdwSeYOGp6lR6o1NwdgAsraStnSTbF+YXGwWaMKgf1deE?=
 =?us-ascii?Q?Bbkc7fVQQJABZ19sIV972l2yn7bcriFPbaVHU6hN79hdjcsXdZY4oNe+Pmcx?=
 =?us-ascii?Q?VjfezLC5jUKJ8N3tVS7ayuoghJPzMCWRzvHrK2BzPJibkhLydxUvVxAQ8sbO?=
 =?us-ascii?Q?IM/ruMKkQHsGNyGuz4UmjUrEPw/+YTELp0nvKl7tTW3v8GyMJLJpewc5pQwk?=
 =?us-ascii?Q?pm2aB90gWLzZMLAud4ER6xdxMXys9f6hLU1/AToc9aTVObQmyuklWzDhz643?=
 =?us-ascii?Q?Bf/89GPqgHYe5P4GQqhMS9P507tqUSNyDFtYSryFeRN5ZylPFE4C4FdkUVof?=
 =?us-ascii?Q?3xQcLhH6iubx19L4lBH/ev7OidajgmQlstMoesEnUs7z1jHemZmB7tEq4tmo?=
 =?us-ascii?Q?k3LEXgBhvBy9/zBW0+Oed2H+EVKGkJAU9mQ4B978RKkugeQFpWgLW9prP8c6?=
 =?us-ascii?Q?mHLRXzvTbud0cG/jr3XKpGyMGH4LmAufDLRJhWnb0wCYPB8Q6lXHzAa98odG?=
 =?us-ascii?Q?g/tUJfmDhBI6uVGpUWo17zg2Knr6UIyQeFw5uuROC19kqB8p2epJ7R44+0vf?=
 =?us-ascii?Q?f4tp2nFjYI3Cl5q0YPRXzUA8v+Mx1aItIbcsLBf0fjODwqOsOBs/dKSmDZNw?=
 =?us-ascii?Q?dSxqPjboFABbhB/2qk53yMYXD2ouxamtDuMWGLM7TbIDw+tQ7/awp/qFZByI?=
 =?us-ascii?Q?KHvKC0PIBSH/SWiaMZyPjsMCC8k4XDz/bRpe96ST+Oh6milIZ+320ZT7iJRB?=
 =?us-ascii?Q?5CWQtKxjOzTpwkzWMP5IltFm4WnuxvEUKmd6jDjoTKTs8ykdv/86YVtgRFef?=
 =?us-ascii?Q?V0EKQRJzQqWzERE4B/WmA7Vi8rqiWg67bJeH08IwBhU7KMytZpL4XpVstbQG?=
 =?us-ascii?Q?Dtlw5Pb1UQ7f61uclFh/uZjIy49KJNgjEpnAy6bmMjI3xpjg8PGvs+IFUtNd?=
 =?us-ascii?Q?SNWx9MW66oMAjp25aMcpbtdnaRQcvWeXpc0DcUgEyxvwBqMgxgtbPFGSIgm8?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 749dd24e-4d2b-4ba5-253b-08dd72e2a636
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 19:06:33.5426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RTork+Cho8eoE93o577xSmhGniHs12PBPMmP69Tb2SSaHM9yg8mVzgFg1Y4yw+FVHjt37Z7qlklPnlg/JoW/yE7IQczg8I+ArPXYIGCxzjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5265
X-OriginatorOrg: intel.com

Naveen N Rao (AMD) wrote:
> Commit 9704c07bf9f7 ("x86/kernel: Validate ROM memory before accessing
> when SEV-SNP is active") added code to validate the ROM region from
> 0xc0000 to 0xfffff in a SEV-SNP guest since that region can be accessed
> during kernel boot. That address range is not part of the system RAM, so
> it needed to be validated separately.
> 
> Commit 0f4a1e80989a ("x86/sev: Skip ROM range scans and validation for
> SEV-SNP guests") reverted those changes and instead chose to prevent the
> guest from accessing the ROM region since SEV-SNP guests did not rely on
> data from that region. However, while the kernel itself no longer
> accessed the ROM region, there are userspace programs that probe this
> region through /dev/mem and they started crashing due to this change. In
> particular, fwupd (up until versions released last year that no longer
> link against libsmbios) and smbios utilities such as smbios-sys-info
> crash with a cryptic message in dmesg:
>   Wrong/unhandled opcode bytes: 0x8b, exit_code: 0x404, rIP: 0x7fe5404d3840
>   SEV: Unsupported exit-code 0x404 in #VC exception (IP: 0x7fe5404d3840)
> 
> Deny access to the BIOS region (rather than just the video ROM range)
> via /dev/mem to address this. Restrict changes to CONFIG_STRICT_DEVMEM=y
> which is enabled by default on x86. Add a new x86_platform_ops callback
> so Intel can customize the address range to block.
> 
> Fixes: 0f4a1e80989a ("x86/sev: Skip ROM range scans and validation for SEV-SNP guests")
> Signed-off-by: Naveen N Rao (AMD) <naveen@kernel.org>
> ---
>  arch/x86/coco/sev/core.c        | 13 +++++++++++++
>  arch/x86/include/asm/sev.h      |  2 ++
>  arch/x86/include/asm/x86_init.h |  2 ++
>  arch/x86/kernel/x86_init.c      |  2 ++
>  arch/x86/mm/init.c              |  3 +++
>  arch/x86/mm/mem_encrypt_amd.c   |  1 +
>  6 files changed, 23 insertions(+)
> 
> diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
> index b0c1a7a57497..4e10701536d4 100644
> --- a/arch/x86/coco/sev/core.c
> +++ b/arch/x86/coco/sev/core.c
> @@ -43,6 +43,7 @@
>  #include <asm/apic.h>
>  #include <asm/cpuid.h>
>  #include <asm/cmdline.h>
> +#include <asm/e820/types.h>
>  
>  #define DR7_RESET_VALUE        0x400
>  
> @@ -761,6 +762,18 @@ static u64 __init get_jump_table_addr(void)
>  	return ret;
>  }
>  
> +bool sev_snp_pfn_access_allowed(unsigned long pfn)
> +{
> +	/*
> +	 * Reject access to BIOS address range (0xa0000 to 0x100000) for SEV-SNP guests
> +	 * as that address range is not validated, so access can cause #VC exception
> +	 */
> +	if (pfn << PAGE_SHIFT >= BIOS_BEGIN && pfn << PAGE_SHIFT < BIOS_END)
> +		return 0;
> +
> +	return 1;
> +}
> +
>  static void __head
>  early_set_pages_state(unsigned long vaddr, unsigned long paddr,
>  		      unsigned long npages, enum psc_op op)
> diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
> index ba7999f66abe..721498c0a055 100644
> --- a/arch/x86/include/asm/sev.h
> +++ b/arch/x86/include/asm/sev.h
> @@ -454,6 +454,7 @@ static inline int pvalidate(unsigned long vaddr, bool rmp_psize, bool validate)
>  struct snp_guest_request_ioctl;
>  
>  void setup_ghcb(void);
> +bool sev_snp_pfn_access_allowed(unsigned long pfn);
>  void early_snp_set_memory_private(unsigned long vaddr, unsigned long paddr,
>  				  unsigned long npages);
>  void early_snp_set_memory_shared(unsigned long vaddr, unsigned long paddr,
> @@ -496,6 +497,7 @@ static inline void sev_enable(struct boot_params *bp) { }
>  static inline int pvalidate(unsigned long vaddr, bool rmp_psize, bool validate) { return 0; }
>  static inline int rmpadjust(unsigned long vaddr, bool rmp_psize, unsigned long attrs) { return 0; }
>  static inline void setup_ghcb(void) { }
> +static inline bool sev_snp_pfn_access_allowed(unsigned long pfn) { return true; }
>  static inline void __init
>  early_snp_set_memory_private(unsigned long vaddr, unsigned long paddr, unsigned long npages) { }
>  static inline void __init
> diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_init.h
> index 36698cc9fb44..d559587dee48 100644
> --- a/arch/x86/include/asm/x86_init.h
> +++ b/arch/x86/include/asm/x86_init.h
> @@ -307,6 +307,7 @@ struct x86_hyper_runtime {
>   * @realmode_reserve:		reserve memory for realmode trampoline
>   * @realmode_init:		initialize realmode trampoline
>   * @hyper:			x86 hypervisor specific runtime callbacks
> + * @pfn_access_allowed:		filter accesses to pages
>   */
>  struct x86_platform_ops {
>  	unsigned long (*calibrate_cpu)(void);
> @@ -324,6 +325,7 @@ struct x86_platform_ops {
>  	void (*set_legacy_features)(void);
>  	void (*realmode_reserve)(void);
>  	void (*realmode_init)(void);
> +	bool (*pfn_access_allowed)(unsigned long pfn);
>  	struct x86_hyper_runtime hyper;
>  	struct x86_guest guest;
>  };
> diff --git a/arch/x86/kernel/x86_init.c b/arch/x86/kernel/x86_init.c
> index 0a2bbd674a6d..3679a92a3881 100644
> --- a/arch/x86/kernel/x86_init.c
> +++ b/arch/x86/kernel/x86_init.c
> @@ -142,6 +142,7 @@ static bool enc_cache_flush_required_noop(void) { return false; }
>  static void enc_kexec_begin_noop(void) {}
>  static void enc_kexec_finish_noop(void) {}
>  static bool is_private_mmio_noop(u64 addr) {return false; }
> +static bool pfn_access_allowed_noop(unsigned long pfn) { return true; }
>  
>  struct x86_platform_ops x86_platform __ro_after_init = {
>  	.calibrate_cpu			= native_calibrate_cpu_early,
> @@ -156,6 +157,7 @@ struct x86_platform_ops x86_platform __ro_after_init = {
>  	.restore_sched_clock_state	= tsc_restore_sched_clock_state,
>  	.realmode_reserve		= reserve_real_mode,
>  	.realmode_init			= init_real_mode,
> +	.pfn_access_allowed		= pfn_access_allowed_noop,

Is there any driving need to allow devmem at all for TVM access at this
point?

I would be in favor of making this clearly tied to devmem, call it
".devmem_is_allowed" for symmetry with the mm/init.c helper, and make
the default implementation be:

static bool platform_devmem_is_allowed(unsigned long pfn)
{
	return !cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT));
}

...if a TVM technology wants more leniency, it can override.
