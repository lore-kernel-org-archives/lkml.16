Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488DD111BF
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743046377; cv=fail; b=sUXlt4keisWkzl9v5nqfeYzDK105Nwtdeb63wprhZjm8ztjUkzqF1rDBERvjCEWWui4Sidnmx1vwCYdD2Tp7EsX+cATDYVnhKfDjODrBBnTwl+gxRMiKRP9XlzPm+uICCQ1T+Qe5Pwnfq5imsNUwHPV9oVi7ufJWrFs+g+s68OI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743046377; c=relaxed/simple;
	bh=tsVFrdXVsFw/8251taTQBWLbrQ1Qn+BRmvuIEclOkAw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OXcnJth8tIySNhtvEZiJq+T7iTYsF9hLagcxot05GhBZ87TV/bk7iVYEPV2jNhM+3gdzBJ/EqEf6vdPBOqEI9mAH3ILJjY709guFA+nXeDVCm20yFmmfYfSfpPE4w8wt7qvznXkbH1p5GVQaHU+pYEKnn75Ek9jO+uopHQgIVho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dDyqh6HO; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dDyqh6HO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743046376; x=1774582376;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=tsVFrdXVsFw/8251taTQBWLbrQ1Qn+BRmvuIEclOkAw=;
  b=dDyqh6HOFrNhKWXm3aGsFrtLw69PrUJeMOl8IJr6YxPmzP/m3OFaKX1a
   /WAsyB4/3VWvH0oP0KXC+N1G0PT9aidsiqBtWbnBY5BkF2UVCJ3/WRz00
   F3tMcIjgcNPvSJwqvrSykKdpEQjcx+WsWVljRRJa3bNqI4fz5T6ydyS88
   /zgXoaGMVMyLoiRMNCTkQXZ0fqzsf1wzyd6Ozw/HZ2Ep1903DOHPx6HHJ
   fLZu673z8bFtrLCjuX2oFoe890Qn/EdAS5PtqCEmIzF/tDa9s+OHJ72DT
   vYGY19SX24SCiOtwKpC4bDFRX1LCdW8LYLpy3LuD5riDHCYTaXBbzrzSd
   w==;
X-CSE-ConnectionGUID: A8Ce3ESKTKyf7SgflqYUvw==
X-CSE-MsgGUID: 2gIXIt0XTMmYVL4ChkJ+AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44238386"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="44238386"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 20:32:55 -0700
X-CSE-ConnectionGUID: fwWwcR1tQLaxA9psqQuRvQ==
X-CSE-MsgGUID: waPZZgS8QuCR7Pp4rPCRBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="155939989"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Mar 2025 20:32:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Mar 2025 20:32:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Mar 2025 20:32:47 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 20:32:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ynTU82nlMCSVv8Ta5s0Y7e2HYcKTA/D0acVCEg9RqIoTYq9mzqlX0UV8NItO6pG00YUsjzNKWfYwPhPs8LaiUUP5ZcoAO7wE1LvkiQdLP5DMyKjRRz3hPzV06p9UIx2Oeva+lg3QKncK4Jlym4cMTzwb1R0XVW7PvY+QkXyvsOrnsJhkjArkVaw2DX0ybeAm+mhjcuT+wg5AJEvtNkQ00i5dbCsUn91PfSYmmt5japjSIuUhzDWxW9vUMkuwJ+Zjt/Mn82GNctXN9GQ3Z/jL5IDhN+oHFQyuGO7yMPvQYFJ/uDxaD+WY10RqeIMU+Xx75u0PWZU1RQ0WZASJJEd39Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jygkMPpDlLZXHtXoBVGOm1I6lErrCI9j6jlgTnqJigU=;
 b=g4pQspmyFtSnjLda+UuqXKLZYtJwSElMWXnbLo7eAuQGygCYWXG5xbE38YNbBrbgpwCP2E8H+GM1q2dInIYKMslPJPyKkeZ7dPmHztfaMdjxirdjyyAPoYBBiKWLRf/zMWXE2mqZX4WoJREAULiYMSZq13bnD/2JDyGnMFpZkLALm9ts6XxFYTiGTW3GchqiCSpcdCxIf3WQrxmW1zM2f7KDSyvj7ArmIwSLVEPGqZ/IgpIg6rR5clE0aZ4qfl1jR+Q9Huvos94aZLDoc7IPVtM8qBNFbOuXk7u81klb6UOZBLtjmF6iqHMrT7mtHsmJfEFWhi126QN8fM7ZxNRwEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 by DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 03:32:45 +0000
Received: from CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::cfad:add4:daad:fb9b]) by CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::cfad:add4:daad:fb9b%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 03:32:45 +0000
Date: Thu, 27 Mar 2025 11:32:35 +0800
From: Chao Gao <chao.gao@intel.com>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
CC: <linux-kernel@vger.kernel.org>, <x86@kernel.org>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<colinmitchell@google.com>
Subject: Re: [PATCH v2 5/6] x86/microcode/intel: Support mailbox transfer
Message-ID: <Z+TG04nYo4SaRDmw@intel.com>
References: <20250320234104.8288-1-chang.seok.bae@intel.com>
 <20250320234104.8288-6-chang.seok.bae@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250320234104.8288-6-chang.seok.bae@intel.com>
X-ClientProxiedBy: SI1PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::6) To CH3PR11MB8660.namprd11.prod.outlook.com
 (2603:10b6:610:1ce::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8660:EE_|DS0PR11MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: 49728210-3868-4d04-bce9-08dd6ce009c2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AaPYADGaBdHW2ypdeut/Zpt/BszZ7GQYJsbstuqsz4cyWFIlPE5CVqLW+idN?=
 =?us-ascii?Q?AXx6EfSHa3XqYHVUtMX6KGzhMa+QAmTacOCbdPBeUr5UhVZO0p9Vf7hAv0Eu?=
 =?us-ascii?Q?FlLInaRmOeA94ZoaQewm7aac8SuP7KQ485QDC6BczMow654//bcZu04NGBTd?=
 =?us-ascii?Q?D2GszvdzS3yCHJK3mrP8H0T0FQmcQcJhHVZonkxbF0jOaz0XaXjU/2BvyrQ1?=
 =?us-ascii?Q?1rA1TXKpr9yYYmju4dbN9QiMqCbG3oiPiZpLlNfVvOLkB30cnMpdirovWtO6?=
 =?us-ascii?Q?JwSKM9EtNX6PuOYn041N7doiPdKHEp7BIkuMkskaszyT7OyFk9T4mtspbB7Q?=
 =?us-ascii?Q?4iA/6BP+sC+faTcdkGeqB/2PkmYaimqTgCoQ33bN8LAQCBff2tBhDXWfDSra?=
 =?us-ascii?Q?Q3lAS9Y1c+N8RSoHFOXhIRPKfbMG/4FCbWU2C3aeuiPxMCZsBphqHj6Lls/S?=
 =?us-ascii?Q?/5FxEuBtlt95G0lygt/q4yDtVebqHOJ5AdS2F/gE4yQHVe09l4mZ/akFjrjI?=
 =?us-ascii?Q?DHQkfU1k0YKlmd2MhGofQyRBvjnXafakJv17ER1H+6O6WGw5M+rcSebVK/lY?=
 =?us-ascii?Q?tl9Cy4KUn7dFdCGuYu0bKuZbOIvmQNXdG4VQ37NIr3GNfABJh41GJar93Ddx?=
 =?us-ascii?Q?Q3LSPQsS5a/NXId2CiBjMlnyCuwf3hShia+BCv4I02KLBAXNIC3v9rtaQJAi?=
 =?us-ascii?Q?z4feNyn19sfG/K3b12yUntaEqacCxfV4lfJBva/Oy7j9AGtksoy0mj3ymTpu?=
 =?us-ascii?Q?cnABjok7WP0Jxfo57Kzqa/HCQatpZzf10hokZPBm3TJ5FkwCv77vg3vWWdzw?=
 =?us-ascii?Q?OvP1+NqxedgGIKDS6IelSRiOC10im34Z33dE3eeeWZL+fGa6qG+1GIlvxGIc?=
 =?us-ascii?Q?J1dvo4iBEJ2HR+KQe0My5XnoNRctAjrqX5IV/K6s76xRrllgQaPJEvqqJi0V?=
 =?us-ascii?Q?e9CqSEmL6kH7jiE8RsBv0mrhEFVICgOUmdw/JEZaTwW4AwaZfUweeIvOP8SC?=
 =?us-ascii?Q?jPyP0dHJBpvCUnESh5hgHQTt8ICA6ij0f/FZdhv2R1DoxIHaYTRq7TRifDoO?=
 =?us-ascii?Q?UF1aqypTR0GPqunP3XV0EYw9c3MXf5kdw9ruUznxZFqi4Kz8Aj0m9w5kaSd/?=
 =?us-ascii?Q?ZZu6vm089BOFTDlEeEW3IzhWAv7wVGO0hpjMDIcPsGB+rRV/x3zweF2Ub6kr?=
 =?us-ascii?Q?UgfQ85Jv/hhI42DQNVADrhIFwQqEhkPX4xjO0dGH5ccoQ+cTVD+sUYSTeUoy?=
 =?us-ascii?Q?xCY9N+34piLMZbQBdhQBLpdowrDF82KHOcYiA7pB/5gglrQKiehbwGhY+FVs?=
 =?us-ascii?Q?5TpWYXfGbFTTdcfta9Sf/P57Ldy/SA3oSsUuPL7SPeNrhGV8bz5j/yBpjwzP?=
 =?us-ascii?Q?x52KIWVaLwbua7PH+F5Epgi0MNLf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6VmjPaDzyGKR2UTmpAFOFyRl2z8tGriXOa7/VoiPVqDJ+nqel33g4MdtLAJj?=
 =?us-ascii?Q?YkHuDggivoE+PLMKjDWcy6+EwxuDj96srdrWFk1fp1+RS3rkZIfHUrMVOH2f?=
 =?us-ascii?Q?dupaGboCyCiEhWEqKJ1VqZmQUmDapmxtcTMcp0VsTLtseT9Ws6INwYHwgSE7?=
 =?us-ascii?Q?CNXolfKhI/s4fKihvny9KAkt2AU6dVbCdQO5cVafw7Am3oG4QKsn8fvetSVp?=
 =?us-ascii?Q?F/lolpUIbudWmOHRem4PDwPs1Ok72Q4aFUpLOibh4u4e+oTbwv67rtUIdkXR?=
 =?us-ascii?Q?CWViSbdO6Pila/dAZ5wFl62r5XeO4M5n10PzVBanif/FLGSmF02tB+ySHtip?=
 =?us-ascii?Q?sORni9/gzkI+vgvXBWLadm92VY1QEqK/ctWuW2I892AdwT7WQgsiUTRfYq7J?=
 =?us-ascii?Q?VWU9aEC7AELCGWlaX5HxluMLJAy4JiJiO0a9sjA4jS/lmjA+qAWYi+N6+/td?=
 =?us-ascii?Q?I7QfPTwJcNe69qatWHRxSrshGxvuD+pXVvotIUBI709BHI16eSgyfQvFTtXe?=
 =?us-ascii?Q?PRprxWddF6vnPj3KFYrLM2/Ia5PabovDXzux+t9LVi3MlYbP4NSVFGqlELPJ?=
 =?us-ascii?Q?HBH2fzMJFdYtfKUPmDBcvDHvvHAnFGrQg+SajCBpWYnE0RgHUaZzZ4cO5w1R?=
 =?us-ascii?Q?n7prkKKKpfcz/LwsC91b6Bg7bP6ZsedXPBFFhM+PB2o/b7rTRAbz6fvQoopU?=
 =?us-ascii?Q?D4qJ6pmdBI+g4TEtet7NEvigDNtyggn1nKJzcPbVBYbWYNmScwJBQ+mjOixQ?=
 =?us-ascii?Q?wk+S4bhI2z4HOpd2C1EE35nQpWtGU91iWKOZ0IyuUoBAwqGxYNmWIw7e+FQm?=
 =?us-ascii?Q?hP7XEIoExAxshcYFvgJ0ip3j0zknz8+rvKqQ/HoVZ9vEk3XGaI7O1WPU21YC?=
 =?us-ascii?Q?MXTq8Fvk43JB9fHkbJAeZxlUf1s4dziAif++9j0xoUokYu37677g+x+V/t+b?=
 =?us-ascii?Q?8KZbpzoC68vWIzso3gJikI6aZEpACJKMAeInU55iobIGZcZXHNbeRygTPesW?=
 =?us-ascii?Q?6IxMTsYhxr8CURSzYv7CIWcbvK7DzTl01gDevQNoAiL/VNq6InFf+v4MH4yV?=
 =?us-ascii?Q?clTSi3bdIz9X8ilocRimy18gxJwUZHjdOs/4m+MuqPa50Edu4KSRqHa5NrwK?=
 =?us-ascii?Q?XpRjnKG97TBIfNNREstmfVIMGVX0lATORQglc6wrfr5WBaGMAjVSs9tKHSl0?=
 =?us-ascii?Q?nqTuAjGIeyLhCP3WwcNSxH26XORYm8d3/TsJl+J1c8ccCiOI4avoSd/5CmQk?=
 =?us-ascii?Q?1CYFhL8a5S1S0D706CC2gOFf7etOPRz9AEgEmtQGT7eUT2l+e1V8vQ4/AtYi?=
 =?us-ascii?Q?AxQD0K+pvqUMpnJEyxFUPOO9m6M9VRUzvL+rqmCXFOw7gRY7JuKyYi1MmCJs?=
 =?us-ascii?Q?+TrHhgTGDfjingeMGLW+XLQzlC8xpqrKZLs+NbGA6rYqLmo8rkb2DWyG8H/v?=
 =?us-ascii?Q?sGum4THp0dqT8N+uHSa5b1chQ4OxJEdtHeBwoDa8rGvCJ2ZAYTNiWkmpgdUP?=
 =?us-ascii?Q?bYJWioN8okoffzQvw3ZXt5dRPoziWuwEZT7ecN2WoQqreRE/2O3nXMcIpeVV?=
 =?us-ascii?Q?faZATPBgxjCn0bwbBSdXHY8b3/jeCuaWEQ+24734?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49728210-3868-4d04-bce9-08dd6ce009c2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 03:32:45.1703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: exLO+YfCu36dp332lgmbDUoTLgXF0Jf0mXGXl1wJCAxOpDxGRXLWY36dBw6DsSj2qOOlHH59MXBuXBDiOKrxsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8208
X-OriginatorOrg: intel.com

>+/*
>+ * Wait for the hardware to complete a transaction.
>+ * Return true on success, false on failure.
>+ */
>+static bool wait_for_transaction(void)
>+{
>+	u32 timeout, status;
>+
>+	/* Allow time for hardware to complete the operation: */
>+	for (timeout = 0; timeout < MBOX_XACTION_TIMEOUT_MS; timeout++) {
>+		msleep(1);
>+
>+		status = readl(staging.mmio_base + MBOX_STATUS_OFFSET);
>+		/* Break out early if the hardware is ready: */
>+		if (status & MASK_MBOX_STATUS_READY)
>+			break;
>+	}
>+
>+	status = readl(staging.mmio_base + MBOX_STATUS_OFFSET);

why read the STATUS again?

>+
>+	/* Check for explicit error response */
>+	if (status & MASK_MBOX_STATUS_ERROR) {
>+		staging.state = UCODE_ERROR;
>+		return false;
>+	}
>+
>+	/*
>+	 * Hardware is neither responded to the action nor
>+	 * signaled any error. Treat the case as timeout.
>+	 */
>+	if (!(status & MASK_MBOX_STATUS_READY)) {
>+		staging.state = UCODE_TIMEOUT;
>+		return false;
>+	}
>+
>+	staging.state = UCODE_OK;
>+	return true;
>+}

How about:

static enum ucode_state wait_for_transaction(void)
{
	u32 timeout, status;

	/* Allow time for hardware to complete the operation: */
	for (timeout = 0; timeout < MBOX_XACTION_TIMEOUT_MS; timeout++) {
		msleep(1);

		status = readl(staging.mmio_base + MBOX_STATUS_OFFSET);

		if (status & MASK_MBOX_STATUS_READY)
			return UCODE_OK;

		/* Check for explicit error response */
		if (status & MASK_MBOX_STATUS_ERROR)
			return UCODE_ERROR;
	}

	/*
	 * Hardware is neither responded to the action nor
	 * signaled any error. Treat the case as timeout.
	 */
	return UCODE_TIMEOUT;
}

and in send_data_chunk(), do:

	staging.state = wait_for_transaction();
	return staging.state != UCODE_OK;

It is simpler and requires less code. Even better, send_data_chunk() can just
propagate the ucode_state to its caller.

By the way, checkpatch.pl warns that 'msleep < 20ms can sleep for up to 20ms;
see function description of msleep().' This makes me wonder how the 10ms
timeout was determined but not precisely enforced. Is it arbitrary or selected
for specific reasons?
