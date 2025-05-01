Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CA5223DFD
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 19:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746128193; cv=fail; b=ISRcvV0rJBN9cY3jsYtgg9lXc/yig9usHnJxZpnsBuBbTy7YD/qgQdoHpkTcMBOANVi2RA3mB1D6VCbMxHsRcAmez9T+gJb/L0HE8RxxpeM+Ocjp2dp8Ap5/kUaAB5qp0wF7pFXTqTckq03HkKqXaJzRT44m641MNdGy0s3ZknY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746128193; c=relaxed/simple;
	bh=Zt+gts4ErqExsnctZUVyVPuZjtDv9AI8DIMFV1LaYNc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KQ3PK5DqIcjrHgBeXn97Fe5BO0c6wTi7YZ5UpNuzLPW0udxGe1CGsZEISyR2szxYOB67HkJsZBl/hvRhIgWHbU6BUnTAECbjZHyjMzy88ijNr61UZ3BlHEs1TlJL+WglAUVpQO7HrTvjpw2+uQ0WqqKvJLO/96leUFS9Z4CZWgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CXroTTWy; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CXroTTWy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746128193; x=1777664193;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Zt+gts4ErqExsnctZUVyVPuZjtDv9AI8DIMFV1LaYNc=;
  b=CXroTTWytMta+FzceD9acz0AXMBMDeibYb9ojYF7T7W4zhmmoYTsZoPA
   y6Ugq157jbmpmoe4CTzZuvrYSq2N9982gdh6pjElSvdSdbmM0IgteycNT
   UL1QW2VxGjiHlAV6cndP6Ht2JzsSgO4EbZbmXFtG+Vw/hVONQwBsT1xW/
   7PtlR5Zm2SpeNhRtUCwjr/nx3+ck2DptUQc5dIk+AKXhxpoj2b63dWwDR
   cJYJ3jeuCe9asbMOz0adbM9TPNQQxl6icVLrspD7i3cZOWxnb8roNPK+d
   HUjSPdcm2ilr2B1BXLDFlBndjPaicufkAA6PuKPV/0+iBBPUMNLDhc2fv
   w==;
X-CSE-ConnectionGUID: qpdmDWvuTICRi/S/j2JCkg==
X-CSE-MsgGUID: /z5K+HxvQ/Kt9V0Dyp+jwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="58019179"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="58019179"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 12:36:32 -0700
X-CSE-ConnectionGUID: UpQBVRIaT024/7uRhrUo3A==
X-CSE-MsgGUID: 7gsih0zvSZ6+zU8NP5ZPrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="165518865"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 12:36:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 12:36:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 12:36:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 12:36:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4Ldb5/u/NhaCioZeGvMRpIe+DYhlBMEu3gUXIOnTAS3YEO7aum6+Pd8ovK69iPE6D8FeY3JZRkRnEHEIGei6KTRxi4U+p6K/Nhf8WYOtUYITznL66VTwEuMterm2MqZJg7XhOlsVD5WW5jWz4vbUiu7WsR3HLwgoCNJRcT5axzLY4X31oe48UCPDebaZ2EhiygvZHLwQwzN7a7nC/TUD992WkGSef4BNwCRcRASElFrhERKTUxHocNq7pjtcQsE/WAXpjW1Iy9Qwcwv/x+RB5vw4mf64eST42cU0s97uMpj7iPkL8mR/nVn0L03hXUMp4s085pQXA12CJPNvAbDmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPOCmDmmt7eqIK3CuEOw35Z8ebqXuLj/4S3vftA3BNk=;
 b=d531GpFK08ChWYrbHBEHuR/UkuXVPqkKnAGDzvUrtxMaPrz/adIRx1rxnDthLda8X+rLts9Ru+RtMc33h56OKZOuWuZjqHACglGRG2Td8OItOQPdNZUry/mx1Fsaxcxhko9rOjt/XeIjoQdgNvsoQXogaz1qop6mDnz0wc2fc8fIeK4mL14HAC6tNttC2qZXxgPeAYIu8H7e+IdghbuKP/hb8Q4VSI9/w//qGh1e4bSCGrZB2X7Rc17T7teqr8YHEKf9B4zrqj1A1rxsLXLuSb2d6L4GAM1TYjFAA5eD8ObGRrsTzn5IXinYi7Yf3cOjI+DY6yROiAPWRmGeiRGteg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SN7PR11MB7706.namprd11.prod.outlook.com (2603:10b6:806:32c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 1 May
 2025 19:36:22 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 19:36:22 +0000
Date: Thu, 1 May 2025 12:36:19 -0700
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
Subject: Re: [PATCH v5 2/5] tsm-mr: Add tsm-mr sample code
Message-ID: <6813cd32e9603_1d6a2948e@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250424-tdx-rtmr-v5-0-4fe28ddf85d4@intel.com>
 <20250424-tdx-rtmr-v5-2-4fe28ddf85d4@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250424-tdx-rtmr-v5-2-4fe28ddf85d4@intel.com>
X-ClientProxiedBy: MW4PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:303:dc::29) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SN7PR11MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: fefc6387-1961-4268-9432-08dd88e773d7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmcvYVo5d2Vha0xDdjBuZCtCTG9BT3VTWEhDbXJGb2VIZmtqVXZNNncvZWpi?=
 =?utf-8?B?Sk1XUGVTNElBZ0RkT0pYUlVmb2NKb1hSbDZDelJjWENGbHdqTnZCUk40NGV2?=
 =?utf-8?B?aWJwUVpGZ0toa296RWovOFdxdmZhSWNTU2FtczJRVFVSNTQwS1NxZ2FENG9C?=
 =?utf-8?B?R1lBeWNINWcxOVE3dS85aWwxQUJHVGxYd20yNFpwR0o3WnVpMHdMak5IaHQx?=
 =?utf-8?B?UXNGSVZmSlAvaDlnTWNzZXExVHpUUzRhL1FHYjEzWFpXUDFzRXVRTlBHN2p1?=
 =?utf-8?B?dHZiYlU0Mjd4MTZwdEo2U3hYMkdzOU5uVDJ4aG52Ym9vYzJBS3RCT3B5UjhV?=
 =?utf-8?B?c2wxWmthRjZ3TlE5Q0d2cHNYNE1xYUpPQXlnT214cm9aS3pPakwvQis5MDBp?=
 =?utf-8?B?SDRaSm9RU09tUHJZRUI2aENCYmVlRk03S0l0TWg1Wi9JVjY0cklXbGRENUVm?=
 =?utf-8?B?OEhhanZYUTVCSXJnRG9aNVhnVFpzcERJaHhzaFRQTkpvY2NERGhFYkdiN0Yv?=
 =?utf-8?B?R1BNNUkxVkZFckxRcnFsOTRBMkRvZkZUcWxKcWtMZmNNR1NEOGk1K2xpRmFr?=
 =?utf-8?B?N2NDeElub0dpdTVmeVFValFQN1RyYXVnSVphODhtRC94QzdKN0JLSEpFb1hW?=
 =?utf-8?B?VTkrU3h1SmRXdU0ySjNzRlNwUnk3Zy9kc3hxZGI3U0wveVd5eExSSDdyZlVr?=
 =?utf-8?B?aFFjSWVzdEltVDBZbHVCenErKzZKTlZiTlhOM2QxWmEveFBHaFN3c05GVzdx?=
 =?utf-8?B?djEvR2tIYU9QRlRQTjV1QWVNaUVsamFRcFpWY2lxQmxDWVNGcUtxTWRDRkxl?=
 =?utf-8?B?M0tzRkRRaUZtNkpiWE1sSHdWYmFKK0FkTjdtWnpFY2NmZ2pGOXU5VER4KzZR?=
 =?utf-8?B?S1l2UXR0M3ptQUMzTHMwMVZ1M21nd1lNWXErWE1UUWEvTXB6VzRvdmhUcHEx?=
 =?utf-8?B?NXdkOGVZWmIrNjlQd0xnRmMyZExoUWoyZ251SGc4SEFZZzdBTVM2MldlK0xM?=
 =?utf-8?B?QUJ4N0dVN05XUmtqK0hPS1o0RXdtdm5SdzJMbmVZSUxXbHRidXk1WTBBQUo1?=
 =?utf-8?B?bU0ybFJtMnBGY2hkeXgrWlpwVU0yTTE4QTlWdVIvSk9lc1J2Nm9OMjlBOGQ2?=
 =?utf-8?B?bEhNb2l6VVJMUXZUbURRWkxReXV6ZTVIY2VKb1Z6MVBzRmpPYVR2ZlRlZjdu?=
 =?utf-8?B?anZVTnU2M3lHNFVYanFNRUxEd0JscHJTSXB3L0ZsazVRMmpvTFAybE5WZ3R3?=
 =?utf-8?B?TjdpdXRWSStkdFROblltRG8wOHFUSG1HbUJzK29oQkI5dlRGMFpiaDNTZzZT?=
 =?utf-8?B?dU54KzRGL2dBUGw5RXErK29yTGRJUHA2ZnV0ZjVwc1p0ek9TNFJsdkZNK3BG?=
 =?utf-8?B?c0NLSU5xL21mQWUyS1hVbDFhZ1dobFF2SGx0QzhrbkRkL3hXd1lNU3JGcjN2?=
 =?utf-8?B?cDdUOTcyc0Y2QVVLTWtZNkQ3Q0VQZTd3ZHFVRGovOEdxakdxMGNUR2Y1QWZ2?=
 =?utf-8?B?bTZzd0hUclNnRm54eFNoL3ZhRjBSczMrNzUrQ0pPN04vNHQ1NG5Uc3RYMllZ?=
 =?utf-8?B?ZWpWWjdkMERmMWtoQzhsWWxLV2xMV0FFL2FXMG1EaHRVMjhDY3E0WWhmYU5w?=
 =?utf-8?B?Z0ZscXVEVXBGVFJ6SE1WMWFNekJZU2ZXRC9YOHl2aTlob3F3NW90b3FZclpi?=
 =?utf-8?B?OWNHcVJvMkVUd2RjbnZUdmt0Vm9WQjI4aDJ5YklQYyt0YkZBcGp4blZiUksx?=
 =?utf-8?B?K2F6RzMwRWxwWmF0Z21iQmVrRWlzR2psZXR4dDFRSU9BUG1XakFWb0NFRGRH?=
 =?utf-8?B?ZnltNmNCNEg4VnYzR1AxNzg0Y3ppcDhZckswaUEvWHJ6Z2pQamdrVlhEK25F?=
 =?utf-8?B?eUpBWWpMSk5YMDNDSzJFRTE5Rk84OG9SSEIzeEt4UnFjU3VNWVlDdXZ1aVRZ?=
 =?utf-8?Q?zjMafQ8GK7I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGE3OHRZaUlGUnZPMitObWhIeVBsbU5MTWhEMURkeTBmT0U4cndzNzhhZFlv?=
 =?utf-8?B?WWRnWFdocklYUCs2QjRhQ09qcTRvVlQwRmxyVWJYSy9EMTlTeTMrQlp2TXNn?=
 =?utf-8?B?RjA1eEplV1J2bHF6TkQvWkVvWG1IUFJ0UkFDYmxMN1EvMmNRZ2dZcGgyalNG?=
 =?utf-8?B?MUlEY2JHUUFMbEpUcnpsQTBUR0Z1OFoxdHZTTk5ZdzgwUy9LYk5YbU9Yak1v?=
 =?utf-8?B?bUxicGplK1RKbWlvR0hYTjkxM1cvMGZGYVF6Y0t6VkptZjQ4bmVwZzJGanND?=
 =?utf-8?B?dFVZd09VOXdmL3ZJQ2I1WjBVUWdCblVqd3phM2NVYVFWVWxqUHN0T01zMUJM?=
 =?utf-8?B?b2s5MloxMVVONHpSTEduOGhZUHh4RmNDS0ZEYTZJRjV4Y05IclBnZTVwbVZ1?=
 =?utf-8?B?NGlEQS9oYW83dkl6bzhMRkpKblRIY2IyejJYSnJlTzFxS1ZYL1dCbTBmeEFX?=
 =?utf-8?B?T3pkVFNDYWVWQjZnT3lKbkI0dlRxVTJFL3IzMkxLWXFzdWZBL1pzcGJEWU1a?=
 =?utf-8?B?QjVnZElpMnpRQldzT0lHdzl0c2QvajlkS0dsa3o4NWZCd05mbWVyVjRkdDlS?=
 =?utf-8?B?akNRQUovajJtRGVZMVIyNVo0bzJYVnF0ajdUOExLMzBoeUVidlJJZ3RreWtM?=
 =?utf-8?B?akQ3MEJxQkRPT2EyTlFLQXlBcitTWG5HdmhiL0NyRGJaM0pvYTdINnN1Nm43?=
 =?utf-8?B?S28yYW9ieUFTdjkyQ3lFSEJ6NEg3YTJjYzVMb2tPK0diZjNVZXFuTkFCY1ZT?=
 =?utf-8?B?Y0d5eFBtOFZOMXlNRi9VZUtBL3kvVmltUnVNZlhjODE2WC9adjlUU3BqMmo1?=
 =?utf-8?B?RHFhT1N3T2FDdFlqWHRGdnE3WDdvdVNSSlY4TTlQZ08yT01aemlMT01tTlA4?=
 =?utf-8?B?ZndOWTRBeXIzbHRudWd2UzIrQmRqY3Z0a3F5QWpaTzNnSDhjQStOeGVBQmhr?=
 =?utf-8?B?cTBZV1dQdklybHRHQnE0M0ZCMHRXK1BMUkUvQzdxVGgwZEJzWE9Ddm4vTHZs?=
 =?utf-8?B?TTVGM0dJSjhnWGNtRFRDcDRmU2RBa3RUeVhqd2hOWHdZVnVQR01aZ3hJZU9x?=
 =?utf-8?B?UkNCdlVwUkdwOURKbHo5Z3JIYUxXc3dVUVBxS1kydVJjSjlOaFMzS2NVenY0?=
 =?utf-8?B?UitjUkdKc1Bkc0JjS0RkdlUvMENGWElFQVFmRHhMaXU4eDNldUFYb2VHZGtH?=
 =?utf-8?B?UHRuN1VYNDY4SDBaTEx6V0NhMG9NNVd2eE9ubnpxSVhGOFZ4L29LWjBndXRv?=
 =?utf-8?B?bkVnQXErVnNmd1NFMzFGeHRja0NSL1pKR1RFZnd6WHJrSkkzOEFLbXJKY3Vi?=
 =?utf-8?B?a1kzcExPSXlkeUFrRkgvcVovNjdOajhZcHZqQ2JDdUJrRVhwcnFjUzZkSkZY?=
 =?utf-8?B?S05QeFM0dFFyZHFwS1ZMQmVqZEdRVGlPN0puMElLYTB6c212eWFPbkdVMzln?=
 =?utf-8?B?QTV2Q1h0ZGRpWDdieDU1RzdZeDhyK3I4Z3Rja0NuS3QrT2h4TW1rVk1nYU5l?=
 =?utf-8?B?NFBOS2pSZndjSnVLUUFWV0Z0S2NURW1GNEcwK3NTZm9HeXFzMmpDZlM2U205?=
 =?utf-8?B?T05PTFVQQWZja3orV0NZeXBkZVJ2cUo4eW5zSjFZaGxuS3dFM2x6RWRVZ3Bi?=
 =?utf-8?B?UDkxZEw3d1hPZ2FpeHQ3SlIxM0w2cHMvMURhR0JmeHhrRFhsa1lmdUxSN1Uw?=
 =?utf-8?B?WitnWFNuYWRYbXRQbHpneVd6T3BuSEVTQjRtMzJIckVHbDM4NmVVUTVGaDhB?=
 =?utf-8?B?LzZIdXEySVptK0FHaW9GTFQ3emwrbkFDMmNiYzZZZGxHTUF2UUlzYUhWeVI2?=
 =?utf-8?B?bkRVOUVGV3JLWmxrbHZYeXZYNzdPRUJRcmpSUlVOM3Z6VW9IbWkwNHNQa1pZ?=
 =?utf-8?B?YzdaYmZRMUlRQWRsOTZIMzR6dHhZcmhFdGtFb3NqNUZ2SVFoUVhLWVZpMU1H?=
 =?utf-8?B?R0drTk5mTFEvbVEzTlhOR2NSZ21tTjlMRFV1RWFuWng0aFJ4R1FKRVVNR2hS?=
 =?utf-8?B?eFdZeFBsRWlLUDBGMFRZZGc1ekw0T1JYUGhPWU5Wa2ZYb25hbDFIV0x6Qmt1?=
 =?utf-8?B?clRYamgzZjRKcWF2R1N3eGRvNTJ6cWw3dlBUTTVtcXZUTzhSMStaaFZ6Y20w?=
 =?utf-8?B?bFVVbythTFRLb0VQSmdpbDJCcGFDeHBqU0lHZXFEWUpxSVE2bEpFejNuMXF4?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fefc6387-1961-4268-9432-08dd88e773d7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 19:36:22.0560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Up/dUPMmJRIJE8gy95lAJXRpYvhmt1eY0BlysWHuBeBCaf1ZHtDCep/iYPpHUpKz2+VhC+TVSyyk24PKKuYT13ZWPxdGeqeL6OzsR6hR5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7706
X-OriginatorOrg: intel.com

Cedric Xing wrote:
> This sample kernel module demonstrates how to make MRs accessible to user
> mode through the tsm-mr library.
> 
> Once loaded, this module registers a `miscdevice` that host a set of
> emulated measurement registers as shown in the directory tree below.
> 
> /sys/class/misc/tsm_mr_sample
> └── mr
>     ├── config_mr
>     ├── report_digest:sha512
>     ├── rtmr0:sha256
>     ├── rtmr1:sha384
>     ├── rtmr_crypto_agile:sha256
>     ├── rtmr_crypto_agile:sha384
>     └── static_mr:sha384
> 
> Among the MRs in this example:
> 
> - `config_mr` demonstrates a hashless MR, like MRCONFIGID in Intel TDX or
>   HOSTDATA in AMD SEV.
> - `static_mr` demonstrates a static MR. The suffix `:sha384` indicates its
>   value is a sha384 digest.
> - `rtmr0` is an RTMR with `TSM_MR_F_WRITABLE` **cleared**, preventing
>   direct extensions; as a result, the attribute `rtmr0:sha256` is
>   read-only.
> - `rtmr1` is an RTMR with `TSM_MR_F_WRITABLE` **set**, permitting direct
>   extensions; thus, the attribute `rtmr1:sha384` is writable.
> - `rtmr_crypto_agile` demonstrates a "single" MR that supports multiple
>   hash algorithms. Each supported algorithm has a corresponding digest,
>   usually referred to as a "bank" in TCG terminology. In this specific
>   sample, the 2 banks are aliased to `rtmr0` and `rtmr1`, respectively.
> - `report_digest` contains the digest of the internal report structure
>   living in this sample module's memory. It is to demonstrate the use of
>   the `TSM_MR_F_LIVE` flag. Its value changes each time an RTMR is
>   extended.
> 
> Signed-off-by: Cedric Xing <cedric.xing@intel.com>
> ---
>  MAINTAINERS                    |   1 +
>  samples/Kconfig                |  11 ++++
>  samples/Makefile               |   1 +
>  samples/tsm-mr/Makefile        |   2 +
>  samples/tsm-mr/tsm_mr_sample.c | 137 +++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 152 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1d1426af3a68..fd5bbf78ec8b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24618,6 +24618,7 @@ S:	Maintained
>  F:	Documentation/ABI/testing/configfs-tsm
>  F:	drivers/virt/coco/tsm*.c
>  F:	include/linux/tsm*.h
> +F:	samples/tsm/*
>  
>  TRUSTED SERVICES TEE DRIVER
>  M:	Balint Dobszay <balint.dobszay@arm.com>
> diff --git a/samples/Kconfig b/samples/Kconfig
> index 09011be2391a..6ade17cb16b4 100644
> --- a/samples/Kconfig
> +++ b/samples/Kconfig
> @@ -184,6 +184,17 @@ config SAMPLE_TIMER
>  	bool "Timer sample"
>  	depends on CC_CAN_LINK && HEADERS_INSTALL
>  
> +config SAMPLE_TSM_MR
> +	tristate "TSM measurement sample"
> +	select TSM_MEASUREMENTS
> +	select VIRT_DRIVERS
> +	help
> +	  Build a sample module that emulates MRs (Measurement Registers) and
> +	  exposes them to user mode applications through the TSM sysfs
> +	  interface (/sys/class/misc/tsm_mr_sample/emulated_mr/).
> +
> +	  The module name will be tsm-mr-sample when built as a module.
> +
>  config SAMPLE_UHID
>  	bool "UHID sample"
>  	depends on CC_CAN_LINK && HEADERS_INSTALL
> diff --git a/samples/Makefile b/samples/Makefile
> index bf6e6fca5410..c95bac31851c 100644
> --- a/samples/Makefile
> +++ b/samples/Makefile
> @@ -43,3 +43,4 @@ obj-$(CONFIG_SAMPLES_RUST)		+= rust/
>  obj-$(CONFIG_SAMPLE_DAMON_WSSE)		+= damon/
>  obj-$(CONFIG_SAMPLE_DAMON_PRCL)		+= damon/
>  obj-$(CONFIG_SAMPLE_HUNG_TASK)		+= hung_task/
> +obj-$(CONFIG_SAMPLE_TSM_MR)		+= tsm-mr/
> diff --git a/samples/tsm-mr/Makefile b/samples/tsm-mr/Makefile
> new file mode 100644
> index 000000000000..587c3947b3a7
> --- /dev/null
> +++ b/samples/tsm-mr/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_SAMPLE_TSM_MR) += tsm_mr_sample.o
> diff --git a/samples/tsm-mr/tsm_mr_sample.c b/samples/tsm-mr/tsm_mr_sample.c
> new file mode 100644
> index 000000000000..3ee35d87d275
> --- /dev/null
> +++ b/samples/tsm-mr/tsm_mr_sample.c
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright(c) 2024 Intel Corporation. All rights reserved. */

2024-2025

> +
> +#define DEBUG

No need for this. Either the person trying out this sample driver will
define DEBUG at compile time, manually add this line, or otherwise use
dynamic-debug to enable the pr_debug() statements when loading the
module.

If you put #define DEBUG directly in the file then pr_debug() just
becomes printk() which defeats the purpose.

> +#define pr_fmt(x) KBUILD_MODNAME ": " x
> +
> +#include <linux/module.h>
> +#include <linux/tsm-mr.h>
> +#include <linux/miscdevice.h>
> +#include <crypto/hash.h>
> +
> +struct {
> +	u8 static_mr[SHA384_DIGEST_SIZE];
> +	u8 config_mr[SHA512_DIGEST_SIZE];
> +	u8 rtmr0[SHA256_DIGEST_SIZE];
> +	u8 rtmr1[SHA384_DIGEST_SIZE];
> +	u8 report_digest[SHA512_DIGEST_SIZE];
> +} sample_report = {
> +	.static_mr = "static_mr",
> +	.config_mr = "config_mr",
> +	.rtmr0 = "rtmr0",
> +	.rtmr1 = "rtmr1",
> +};
> +
> +static int sample_report_refresh(const struct tsm_measurements *tm,
> +				 const struct tsm_measurement_register *mr)
> +{
> +	struct crypto_shash *tfm;
> +	int rc;
> +
> +	pr_debug("%s(%s) is called\n", __func__, mr ? mr->mr_name : "<nil>");

With dynamic-debug the function name can be enabled, so no need to
include that in the debug statement.

See "Decorator flags add to the message-prefix" in
Documentation/admin-guide/dynamic-debug-howto.rst.

Other than that this looks good to me:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
