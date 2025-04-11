Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FE81F151D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744347564; cv=fail; b=M/izsMEdZXlgbfjez1pA0CUovoCoJ7bJAwJ7dxojWfGpYHkyFXy0p0ZmMpMPOw3N9g9X9zdEMl3J+EegEvseWhKdkcxjvOS938bp4l9yfW1VLgODaZj+h+T18obRZde7Ou2lBdYKEsp09AZsjeJ7701HZjPrLErmrcF82dYGChc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744347564; c=relaxed/simple;
	bh=8CBvlHzWTpVHElEG3HlgcAgSxDXqCMnLryfhT/k0JVQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lz6CVdqKJAAccbOVlzIz2mbL6zp4p4RbTi6FiJnLtk/vnW6RY3xxfq3/HbvweaBtCL9srGkCLtouXFj7jOVfAGMf1VIXSVTJfno406BKETQW58gTLUjqW3vP+HSoPSEmK491K5kENUHdZBJIJrxgBWWmT76UO+2DiMjbO1zb7ro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ac4dQj6+; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ac4dQj6+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744347562; x=1775883562;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=8CBvlHzWTpVHElEG3HlgcAgSxDXqCMnLryfhT/k0JVQ=;
  b=ac4dQj6+CQIkvjobI3o62ktz0PlXpHwoY9cCmPiXdTTKLNArAdF3obqg
   hRmm4FcBZ7ORl+wS19q58Iq1l1jsAejzhH7AYWEBPjiE0ckBpUxEFY+s0
   Jo3tNNiz9y3R0NYC1Y85XnvcK8/+406KlKclKq9j6cyLJzDrYvI5f6yhZ
   XeEh8kEyXwC4/56u1uGbdN9UkX7N4azwiFWiFQc7vGzMri5VHM8Yw8wnj
   NrLTFg8XNyiSKMuex0s4YXRtnErkgC4LNtYhpz5rWXO1po9zL1DYmiiPQ
   rtNOzk3LaPtrcAOTxhwKoiJhSuve5GTye/55D+GuiNX3xhvMdufJWJDUE
   g==;
X-CSE-ConnectionGUID: e8LbeDojSG+I4htDiag8ow==
X-CSE-MsgGUID: XHJAIRPvRr+ZIVLlsOYwcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="49691205"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="49691205"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 21:59:21 -0700
X-CSE-ConnectionGUID: Gk9LN2NmQb6qHuPFjgOpog==
X-CSE-MsgGUID: hb8qhQ1ZThiXYHwUtk0BKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="134259345"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 21:59:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 21:59:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 21:59:20 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 21:59:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dPYhzz6yvC/cT04glkHNn6lX8SOqOjHtz4oNQ/DvGVitg12dzXe9j+n0bgt5bPXhfyJ2t5M3xrEs1WmKw7G1zkCIjmuoIpoWZZRqdwtaoi0mcxVFNm/DppFWXkb5V2WZzWV4n2hncEsP2JggiWT4rTs0mpYAqDMvOZokYcQZ6UkYQfne5PTzEjhVRzVEcVaeAivZz4QgitYWgf6AvMN4HBxky0MtGRZ1fFeeR1yapklZIERqcbHIDmAtyt6gcUbOKCL59ZWvv0/fgcBx1mweyof9NHgLyKHlxGaUNZWUSUM1YsuvsJ8WhO+yOfn3kJTDlCMOp+tQfajUChkETP8WPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MJmvUzGLD5TRG8wMVJ6fhrZaKbrnvHA21+6FmX+FQo=;
 b=uFmvcx18/Pegxz34jjwP8vg0zpX0JHkajXvd4y2NSXyB884lfvCf99TRSTGo+lbK3ZJCpbsOdNZ/oM/WlUh3ltWkoYRyOKTlahKH4m/v1/qYUpG1/OBS3x/ihEUISADammsynCl9HM15WtReg2cAWvxalSOSBvO0buhMaGF4lzZsZchqW4Kp8tqEHvuHGX/iOoyaf8ngVf9InPuAnYxESX51/zth5bx73aamnuwYxsGzjmKB2P7pvle9MCbqTH0Cq6M0vi0M+hYcId1Cq2IUv0xBuXx+nY90nq90XHN35IXHNSgjtIkgdPR7CtBFcJQiMOFic+rVeizjdK3PdY07ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Fri, 11 Apr
 2025 04:59:16 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%3]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 04:59:16 +0000
Date: Thu, 10 Apr 2025 21:59:13 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Kees Cook <kees@kernel.org>, Dan Williams <dan.j.williams@intel.com>
CC: <dave.hansen@linux.intel.com>, Nikolay Borisov <nik.borisov@suse.com>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] devmem: Block mmap access when read/write access
 is restricted
Message-ID: <67f8a1a15cc29_7205294d7@dwillia2-xfh.jf.intel.com.notmuch>
References: <174433453526.924142.15494575917593543330.stgit@dwillia2-xfh.jf.intel.com>
 <174433455090.924142.10859114556652046264.stgit@dwillia2-xfh.jf.intel.com>
 <202504101926.0F8FB73@keescook>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202504101926.0F8FB73@keescook>
X-ClientProxiedBy: MW4PR04CA0296.namprd04.prod.outlook.com
 (2603:10b6:303:89::31) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CO1PR11MB5154:EE_
X-MS-Office365-Filtering-Correlation-Id: 7df610ba-151d-4efd-f4d2-08dd78b59c52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oUifEEE+VrgTHVQaoc17ODMDk0nRY5bdJqibClyvNWXoW8XPZqV2+3SmxuMI?=
 =?us-ascii?Q?/ZNxZ193CAhBgLgBsERl5R6g6c3lwVYfWxoIkGXVUlAbWKB0SM4eoxuZ0pUe?=
 =?us-ascii?Q?wZoifWinAeemGgffNrIO4+JGUbkBkh6utbhq6SfgsV9kdzjKaqmNeIz14iPV?=
 =?us-ascii?Q?CiFffumsxZMvm55/KbhFMyDhdJ2wZD5OOWELDtqUFAk8KW6TqjLsymE9PbXa?=
 =?us-ascii?Q?Oxvu6n8QsWyAi4Fiw5vuJPnbo7K5g8Z8f/mSskh3Lq2LB4NI23OgHUgj+M2e?=
 =?us-ascii?Q?7poygdbA/ecRqydCZlKaswRENSikQkUZwi6DUz42TY218HqMBk8uYuszfOMl?=
 =?us-ascii?Q?SV8ki7/PQJLtNYhcAFTg5NCmxKUkiVsH/otXtWhEC/Fp2A2lfejHFXrsij50?=
 =?us-ascii?Q?GsoSStbX5UdBf9G4I8ohFLliSmZM1Lv3MJ87hCBaPvMngwtr4YHwsnEoXbc8?=
 =?us-ascii?Q?L0pDF1FWqfK/S0rJwAXXJOwum6IU9PNYYoOtmwphrt95oYdg/63xnPANOb0s?=
 =?us-ascii?Q?44LTvaxMgaJOyvoDboS4XM/iuZSpo9C+GaZ6U29/iU0veqfpGeRZI1Sxsm8P?=
 =?us-ascii?Q?4ZEMbqEEsOkM3AtcyMwAQIZvg/YDO9JsHuzE1vjRXf3mpa962VDKpRZHrVZa?=
 =?us-ascii?Q?OLG/7qCWbHnxB5aRea/eMO3/pEUvaQfY6DAuueZXb7Vx2Q1Jg0hN2sS9GrVQ?=
 =?us-ascii?Q?Ayf5i5x/90KBeelWYUP0WHSmJm851VzpZKaU5nPTP6vjEGiPOI3WVIN7g2Ws?=
 =?us-ascii?Q?EEz5DykKD96j+SqvkW6lCo9ake8GsV2gmBenumssnen3l3izpFeoBd25Zb38?=
 =?us-ascii?Q?PPJ2HUOn0Fsxsis/8BTibNINnk5mutkTaFB9lrr4gF6fzGe+P+NnZsa4WRJr?=
 =?us-ascii?Q?9UXpnx3/RQWQ9P04msb6ahaZnCji5aGlyeMA8oobDj83HVMkolbyvzoB7wFR?=
 =?us-ascii?Q?1DDs5zSmo1i81njFi50J9pDFgdc3xYiCYQGqxGkv0liNSKoeq/yM+3nyN5wn?=
 =?us-ascii?Q?bm3xSPcnp0P3KV2tnrGmO/nE2CPgtH7V3Cfhojt7ZW24OfS2Y6kYb3hIViug?=
 =?us-ascii?Q?YeA7/7fqWr5NJFP6KrFgsS4m+Qn14ze3MXXO9gkA4S+nZC5KizMtSDrbW5yg?=
 =?us-ascii?Q?NJ7QaomOJbIRs55HEXDBC36Dc/MKTjq5EYd6PINgPPxHEwqpvRzmR+HGMrMg?=
 =?us-ascii?Q?EHFYaP2BcU6GNAi5n2P3aMYV1sPdNscwFajw0N8wepdUYfyhwU+mOyZrHB9q?=
 =?us-ascii?Q?7qmM1US5kmG/V8gVeQUVmPlmHbEZx/OUN+tZ34VNOnU6YpgYSNJUCponhTmk?=
 =?us-ascii?Q?G4Ox7vzDWm45zVv5msQNSAy2DsyFBWh83HNCWisEp7hZG8jizAMGkP1k8REx?=
 =?us-ascii?Q?LtjXGqn3QIRqURPLlTVGNPoTLn+1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A5ZeGUi42SaWTBQhuZSGOsDiRx2/NLcneazlNGmwh7DaoH6deMphPi2/owdE?=
 =?us-ascii?Q?dxsDKOjhgxtax68HmcZrWBP6O+C4FwM0WGpzzKEnxc2xSwhj4cpFVrMQYWVW?=
 =?us-ascii?Q?fQd1VCxNyKh3SmYJ3Z+5EWOvkx40vVmvJ9ngd6Mctq2ZI44cmxCdOEtjZeCh?=
 =?us-ascii?Q?E2VzzyPSe9XVKFCfg6/98aS3BdIgQaISb3qP2VP/V6nuWE73ZKsweDej9Hu1?=
 =?us-ascii?Q?1kSQeGyZUI24EKLmE6ULOVYeF7sBnTIneHzgXkDVAfbvOWeWlxxgavQOvfuV?=
 =?us-ascii?Q?wX7HQEXaZjuBMqEDM96i4x7nYlOSJqAf87b/YchVhqJIs1SHjafBQEFIkYsv?=
 =?us-ascii?Q?LZVXhw2mrJnz6UeOHOvEnnJeSvTMpqOVYGHbahgWrmkK3NRikhsF+H1xnYWr?=
 =?us-ascii?Q?tZ498TaWcGHZcZVWaDaIoDjxg2+TdnYeh2L6aPgbLZDiFo+Xhfg2fINpcgqZ?=
 =?us-ascii?Q?dG0jy5Mvab8JgP/hyr7L2XxsJtusBFuytDkbdwM6wd5iSXToxAdfQihGbrsi?=
 =?us-ascii?Q?S7q/ztJCNYTfkOwCODpG5sgm6DjPqYL9sQc0Fp+eyKWg50UfPOLSMJ3vTLli?=
 =?us-ascii?Q?DXOCzycJkl1Qo1twBECeZOPSB4J5olovcLmUWeS2ioDUGiNYd+pE3dvG8mus?=
 =?us-ascii?Q?RKNSsJkBP1Khs4fhUTApP2dSSVnj01nbhZs1vR5xWc1FZrw0vfzvZJoflDkE?=
 =?us-ascii?Q?HAGbvXI2srR4GYTKUTtrYTgoVn9ICP+g6sLMyABeUes220hM6K48ETTvuAXm?=
 =?us-ascii?Q?tDdxnvtWm16jGbm8UHr1opJulQTx61c6zlUYgNFvsytXSSJVwbezbx2Fa3Ie?=
 =?us-ascii?Q?ihP68DyUoUiRuU132JxuqqPnV5H8Ykt8pTIO9EsV1LFzJBbskOSA/tWIknyC?=
 =?us-ascii?Q?l/NxjiQXE9eYKVXzeROx0RY4EmjdhyVA8Us06GcyU4s8ED1XAoP7Qq6YaX6T?=
 =?us-ascii?Q?5WYlJ5tgk/Jb3n1PmyQrpQ4gstZEJSNB1AceVUZAVtBDquyprdAB3hJPXt7U?=
 =?us-ascii?Q?YC5V6T+P8SHawleF43b6IisYFDyu1f4iAdbWdIleGtsd1zAu++xnFd2W7HuE?=
 =?us-ascii?Q?jFp1FFjS0HOlNE/awgH5kJBuarI8+KXyjlf4froE2UzkuXF+MXYQ9vQTpLY0?=
 =?us-ascii?Q?wQjncg3Bcy9QHSHPFn/kg48G7cNcX+aZgmgNJsEW5HqtgD1Xs72QXMyjQ46l?=
 =?us-ascii?Q?D2EVrzfxT32DsCGWCUu+EUB7kT09WQK2A+680PMIEMeVsps1l/7pk2q2dsmU?=
 =?us-ascii?Q?cvnutdv3jw/Ck+I0OIBXWsV6ytufcaafFnWDZiV/+wmygYNueYTBKgOSm3wh?=
 =?us-ascii?Q?P4ZiC6pXTRV5KF/3tYyHak/Brf2f9e6GaUs2ExnjnhyGsbiM3zW8i6TrrfLw?=
 =?us-ascii?Q?Iq6CvCLLcvMmJHr22boxEsSjj+NQOjkEtRGBAKhxSQHTiJmzElUSrWsW64oV?=
 =?us-ascii?Q?0zEJgS+877JAxHQElvrpYOtj7izLImvKyrCdptFhbcYRNawnhtzUhmKeE8dp?=
 =?us-ascii?Q?AW7v5jN/JTuOPwa+DI0yQ0mNhKPWg99eZJomuxF1MUD+TyMtGlcSZCWcSYPp?=
 =?us-ascii?Q?t6btJqMq1GBnbyqOC0DFhcvAWkzzJkz5vMNNFVxGlofqdIHJhruwhEWnVxtr?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df610ba-151d-4efd-f4d2-08dd78b59c52
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 04:59:16.5065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3QsqHmDr064ra/D+bk7LDRRmT0xgRP8Eq6FlURUMfVG7awoWW4TZ14GRbB0IciJdoE8IKpTUai4OiGalzmCJgeQCDOPr6xDdqesFN82EowU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5154
X-OriginatorOrg: intel.com

Kees Cook wrote:
> On Thu, Apr 10, 2025 at 06:22:30PM -0700, Dan Williams wrote:
> > Back in 2022 Kees noted that he is able to mmap System RAM below 1MB
> > even with CONFIG_STRICT_DEVMEM=y [1]. That is allowed for x86 legacy
> > compatibility reasons for userspace that wants to read BIOS data
> > resident at that address. However, the expectation is that when
> > devmem_is_allowed() returns 2 that the access is redirected to return
> > zeroes.
> > 
> > That happens for the read()/write() case, but by code inspection for
> > mmap(), there is no restriction.
> > 
> > Now, the confidential x86 VM (CVM) use case wants to depend on
> > "devmem_is_allowed() == 2" guaranteeing that no mapping to potentially
> > encrypted memory is established [2]. The options to enable that are
> > teach mmap_mem() to meet the "zeroed buffer" implication of
> > devmem_is_allowed() returning "2", or return -EPERM for that case.
> > 
> > Return -EPERM on the hope that userspace does not actually depend on the
> > legacy behavior of being able to reliably map the first 1MB of memory on
> > x86. I.e. that all legacy cases are using read()/write() to safely read
> > zeroes. If that turns out not to be true then either a "map zeroes"
> > scheme can be added, or the CVM case can return 3 from
> > devmem_is_allowed() to hide the CVM restriction from legacy
> > environments.
> > 
> > Link: http://lore.kernel.org/CAPcyv4iVt=peUAk1qx_EfKn7aGJM=XwRUpJftBhkUgQEti2bJA@mail.gmail.com [1]
> > Link: http://lore.kernel.org/fd683daa-d953-48ca-8c5d-6f4688ad442c@intel.com [2]
> > Suggested-by: Nikolay Borisov <nik.borisov@suse.com>
> > Cc: Kees Cook <keescook@chromium.org>
> > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> > ---
> >  include/linux/io.h |    7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/io.h b/include/linux/io.h
> > index 0642c7ee41db..564934f7e70d 100644
> > --- a/include/linux/io.h
> > +++ b/include/linux/io.h
> > @@ -191,7 +191,12 @@ static inline int range_is_allowed(unsigned long pfn, unsigned long size)
> >  	u64 cursor = from;
> >  
> >  	while (cursor < to) {
> > -		if (!devmem_is_allowed(pfn))
> > +		/*
> > +		 * Any restricted access is treated as "no access", i.e.
> > +		 * handle devmem_is_allowed() returning "2" to indicate
> > +		 * restricted access.
> > +		 */
> > +		if (devmem_is_allowed(pfn) != 1)
> >  			return 0;
> >  		cursor += PAGE_SIZE;
> >  		pfn++;
> 
> Looking through the 16 page of Debian Code Search results for
> `open("/dev/mem")`, I find a LOT of mmap() use. Some random examples:
> 
> https://sources.debian.org/src/i810switch/0.6.5-7.1/i810switch.c/?hl=413#L402
> 
> https://sources.debian.org/src/radeontop/1.4-2/detect.c/?hl=91#L88
> 
> https://sources.debian.org/src/libdebian-installer/0.125/src/system/subarch-x86-linux.c/?hl=113#L93
> Which includes this gem of a comment, implying that it uses mmap
> _specifically to bypass the devmem restrictions_:

Oh.

> 	/* Please note that we don't use mmap() for performance reasons here,
> 	 * but to workaround problems many people encountered when trying
> 	 * to read from /dev/mem using regular read() calls.
> 	 */

Looks like in that case it is trying to grab DMI platform information
and otherwise fallback to a "generic" system which I would expect wreaks
havoc for many people.

> I don't think we can just fail the mmap. :(

For the TVM case the havoc of failing mmap for DMI info is smaller and
the recommended fallback for /dev/mem being in accessible is
/sys/firmware/dmi/tables. So I feel ok making TVMs take the modern
replacement path which is what they would need to do anyway in the
lockdown_kernel case. Tom, Dave, what do you think?

...but yes, let's skip taking away the /dev/mem backdoor for the bare
metal case.
