Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B7B21D3F0;
	Tue, 20 May 2025 11:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739080; cv=fail; b=I9eRyS8FuoK0A0RCpi1P7xAvoF0VnGnGhZN2tAJgt9JqeXgIjYSqGTQaIcLez5M6uMdAryDjX822uWXpIuiqdNdVmnQJcqdjhYtVaEzpiRkjUuPPABnq7Irt6X4U1E0JPyRorQI+Ub8B3v2Vfxs9FvRsN4aV5P6J06zCcZqaMSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739080; c=relaxed/simple;
	bh=Ojy9t7Io6Rpwq9oH4TYUr/FWCP0e0Jjy5Sc9FGWeFdI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gtAm4XZyFeJ4Kbaw7XWQvYZnTmoFBANQvRHCZ2wk+DiWiPOEkI/M3JAs53AIAJrrdTVNU34c64JZWIZ1US2vkjjAwz7wP/54KMcZaSPWap0w/QaCYcgZiIsiIcXOpwvpFU6sPC8kGL4hPKQ9//F/LBkGyZ6CyQgD1Y2E8wZO928=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c0qjT0v1; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c0qjT0v1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747739079; x=1779275079;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Ojy9t7Io6Rpwq9oH4TYUr/FWCP0e0Jjy5Sc9FGWeFdI=;
  b=c0qjT0v1XC4urAsjaAL+UXk8VBNUZLUYrOAiF52pKgFxXEKLct4BOnWY
   9tdehB3rmAQhDockzH2UTb7zt9izDWJeLbFX62YYVP2THVYo1I1CMf6Eh
   8Fx6TBdvjcOOcccKR3Itc2VW9qXgWnCio/geK/GvZeC2f8Ezdec/ujBv7
   otr0oDLJtsM9qOA3KW9vSN0CxBPp59BE65Bq1EeiJ3BLbpoYCPU5u7g2/
   z3keriXilgH6b11+leAMO9LW7h8pquzwkl4Q1mWDgs3vuFVi0od5/Y5o/
   xDPOC00X2myJ6UuUxzfXA83WxDxpi17fTHSihXBb0j8aUTWWcDsAC7zs6
   A==;
X-CSE-ConnectionGUID: Fe7KPrNXSJS4ypAYNcKUSQ==
X-CSE-MsgGUID: AACoQtEDQTytjx9aldmn1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="61009691"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="61009691"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 04:04:38 -0700
X-CSE-ConnectionGUID: Ul/bFJkwRYmATAeEfY266w==
X-CSE-MsgGUID: msuBt75PTQuRpIu88by2eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140578810"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 04:04:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 04:04:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 04:04:37 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 04:04:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kI7J+cdFmq/0XOimzAZbjdkCyNMcO6bV5jy63U6l3MdMDqiJgKlFAJN/KdCWxCw5AKv98nzvs4fCMUpALL3ZPQXGJsz8UfMMUVzTlqIDqaBBIxYyE0GuAQU5SCIcIzb0qLfXE2f6QbM/NBlIG+QXiEsUTPfYEWv0FAOv1dgTkyhR9kFBP9LKBVNNQJYu2yuBN1U7qhtD4abZjoEDOGsvPd9fSuXQy3Dc4gmjR0tTlX6LVxSO2xpV1KfXw2+5NxPkofVxRCOy/EhBlF7jqNBQeBbW4j5C1cAuoV7qbwS4KHfch3Ljc1nvxomhRR5v9f5/4fx/tmUI3gcA/sa6VZoHuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ojy9t7Io6Rpwq9oH4TYUr/FWCP0e0Jjy5Sc9FGWeFdI=;
 b=jSQtqyTaNplQDpnOMqhqXnA27JLSjHcBF7K009+RwpPBdctecO+EcGXgLDwpp6E9pJQAlBrzSUlTLGGMwZUimoW5vJSueGc2JZ+iKhGxQvHWW3L7Ou0HaMdZ1aE/yynS56r4xwWj8fMdVS4rEiJIwQiJj6UsE+XeCDkwb3EWu3+xqvrOc+dmiJ8v7X+5ll+orn9d5UrhYcXfc3B27FFMdA/Lhl6jFNRB2ppXF0wf2OnSyZSs+oBpFnVo5eAnjFt8TageMD/f+sHugkaGHoplG3eLMKEeOJCm57mdpLONV2J8fJs8OYKWtgOOIMq4yMnY5chyVsYC6U98GMJwjCpUkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6267.namprd11.prod.outlook.com (2603:10b6:208:3e5::8)
 by IA1PR11MB6514.namprd11.prod.outlook.com (2603:10b6:208:3a2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 11:04:33 +0000
Received: from IA1PR11MB6267.namprd11.prod.outlook.com
 ([fe80::30b6:4b51:6cde:faa9]) by IA1PR11MB6267.namprd11.prod.outlook.com
 ([fe80::30b6:4b51:6cde:faa9%5]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 11:04:33 +0000
From: "Brandt, Todd E" <todd.e.brandt@intel.com>
To: "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>
CC: "xi.pardee@linux.intel.com" <xi.pardee@linux.intel.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] platform/x86/intel/pmc Fix Arrow Lake U/H support to
 intel_pmc_core driver
Thread-Topic: [PATCH v3] platform/x86/intel/pmc Fix Arrow Lake U/H support to
 intel_pmc_core driver
Thread-Index: AQHbyXRiUO4unLNDbEqYn1tMaxiyK7PbWFKAgAACsYA=
Date: Tue, 20 May 2025 11:04:33 +0000
Message-ID: <ef7c13efe46aff5d23e2b4196b6dee608eb2603c.camel@intel.com>
References: <a61f78be45c13f39e122dcc684b636f4b21e79a0.1747737446.git.todd.e.brandt@intel.com>
	 <360ee90b-c83a-b4de-f864-88ec90cb0648@linux.intel.com>
In-Reply-To: <360ee90b-c83a-b4de-f864-88ec90cb0648@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6267:EE_|IA1PR11MB6514:EE_
x-ms-office365-filtering-correlation-id: 0b9c45e3-1344-4d43-6ae8-08dd978e19db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QmgyRU9NUzhTK3hUYVM3aEFwNlJMYVhoOWpzUmMxUExVUUtWU1Bxa1VYVEky?=
 =?utf-8?B?U2tjN2ZpNTJhVjBYei9qNkdPT0FyVnpYdnJhdmdJYjJFTlVPNkhmMVkrb3V0?=
 =?utf-8?B?Wm54dFY1UUlCbkFPRTZQa3Rzc1pDQ1lHUnpHT2xhaTM2WnBuWnorT3E0RU9R?=
 =?utf-8?B?K3B2MGxJWjU2NUNEOUNQaW1OSURKZnVVQmhINGRWTkVkZkNPc04rVW5yVDlP?=
 =?utf-8?B?eGp1QWJvZnVuTnFwZ0l2QnMyV0k5dlJDU0dONTlsY0NPdCt3aHhaM2RYRC9N?=
 =?utf-8?B?UzFlMDZiWVFGTnlZdHY3YkkvZHRPSElRQ0cxU0JwcFRtbmZ4VFpQbzNuQjQz?=
 =?utf-8?B?ejFRTkx5aGFIN2dDYWpVR1ZUMkFTUm9qNHJvTjI4TXNTNy80SmxMU3Vwd1Vp?=
 =?utf-8?B?aGNmcnJyNkhidlZhT2dpVVNmSmNvYkt5K2lOWWZ6OThmcjlTL05yNGZYbitE?=
 =?utf-8?B?N2MzY1BFazIwaUZVSGtTOTdjeUJHK2hWcXBJUWh0Si9SUHprc0lRa2c2YllH?=
 =?utf-8?B?M004dXRYUkRmYVI4VnNxdFl6bmlOdHQzTHZWZVExOHk3Q3dXWEZGOFpybStk?=
 =?utf-8?B?ZytlSnlGeitiVm9va3hFMmFSSVVSdDZGTHpSZVJyOStSMTdZdmhSWng0VDN6?=
 =?utf-8?B?T2dMZkVKajM1YkZjaUdzZE1GbXBwZmxoaHBoZkpSTk5GZ3p6TytWcmptQWJP?=
 =?utf-8?B?d1pweGRiUXdadmVnQWNJR0RDMDhOOEZlb2VWZUdGQUhydUJ3M1ozcTZYNlBt?=
 =?utf-8?B?aXFnUnNVOEdFYjE3WGdoK2s2dzJHb3NiMlp5SEVMOTFKUXltTkg3ZVBHS3U5?=
 =?utf-8?B?eFF1L2cvampjb2FPQ3Mra3hGaUt4M1BPZ2FBeGlwWHE4STRRKzdXdy9HdUhk?=
 =?utf-8?B?M2dGaVJDdEJIM05adGl3Q3ZyRzRnc2pSL2dDbW1JRXhyTGNDdFlLcVpIbUhv?=
 =?utf-8?B?R1Jlb2lQbnArQ0xrS2RheFFMNnJmQ2lUdThDT3RTQ2RhUXI4U2JoVU1DVm1n?=
 =?utf-8?B?Q1Y5Q0FKT0ppd0J4RFBJeWt1VFkzT0UyeElxaDdqTEhmOTBPd2xzTXhUVkZP?=
 =?utf-8?B?RGtNa2ZldmgySzBoQ0RJUU9FbG1BQTUzSlF5S1pBUFRKU3g5ODlpYkFNb2tO?=
 =?utf-8?B?SjliaTFJc0dIWFJ1bXJBb2I2dm1ScUI2eTUzTmFQbWRubXFwVE5OU3Z0TnNO?=
 =?utf-8?B?ZUpKK0hzYTZ1V3dRVFU5ZkgybldTbWUvNnZiSzlHcHk3a0hOZVJ4dm16VG53?=
 =?utf-8?B?MFh0SjBMeGJJY3pHcUxxSkZQL3IxVkdsTEc2RHFIL2ZORklsZVNHUXNrZ3Rt?=
 =?utf-8?B?Skh6WXBPNFpOdGR0VHQwd29uNUJBaGJrTlRuY0xrS1BCR245TG9WczBSVFBC?=
 =?utf-8?B?OHVxeUpmaGppbG4zN0E5Z1Nac3NOUFVlc3ZkQXpQNmlGRTFFQmFDdHUwRDdE?=
 =?utf-8?B?Q2F5WVpRUG1QeDdNdzFqcWxjMTJTR2VRMHR0a0QvZ1QrclJwM2xVZ0pnYzI2?=
 =?utf-8?B?R1RmQ0trMUEwUWxZYXMrMFRvOWlxOFprWFZtNGc2TUIzTmpQTTJlcnQ2WUkv?=
 =?utf-8?B?Vi9sNis2andDakwvZ0FyUE9GNVJua3I3ZjI0N0tuemtNMllKMDdCYlJoUU9H?=
 =?utf-8?B?dnFSOW5QdDhzeENSTitJeUZIN3pVTUVLSXhRQWlpbVRDeGVLdGN3dGFEcWdD?=
 =?utf-8?B?VzFocUJoanJORFMzYnlFTFJTMzFtOTI5cjlTaUVoK1RhQiswVEhaTDB5WUFO?=
 =?utf-8?B?aWViOUVQMXVSbG05bTJVa2ozL2hjdUZTRDU2czNJR3FwR1IxcmJlK2IyNlNr?=
 =?utf-8?B?YXptMjdld0ttTUY3blgwa2FqaEU2MFVaMGxvTzZOU1BQZ3FONktEY3REZW1C?=
 =?utf-8?B?UkY2dlhHK0NnbWFnQlB3dGRJV1NUeWtJRnBYOVMxYXBWcS9wejdiZUNvemVh?=
 =?utf-8?B?QTFBbjh3WUVzczYwcTVYZTN1UStuV1ptaGNad3VMVmhXVDUrRWhYL1czcnpt?=
 =?utf-8?B?OVJVUkZvZ3hBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6267.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzcwNXN6dk1zSDNhOUlMdFJHSjFrS2VlQ3ZQL2RUMnRSci82TEpMUUw4TDNK?=
 =?utf-8?B?YUZGRmpOeEtEakJBUktzZzNud1VrcW5oTnJIVWVFQnBCYUcxOU9BR1RIVEtv?=
 =?utf-8?B?TExwbXRYQXJoYWNVUmRSeEFMOGtFMUk3elFPVXVsNXBCeEYvY1FvS2czdGcr?=
 =?utf-8?B?K1Ntb25LejNLdlZEU3BxQVhqNUN0SmhGMW9ob1lvMURLWjRSK2FQZ3djZWk3?=
 =?utf-8?B?dzhJa04vY0xIRmlQYmRhdkhHOVNhMHBBQlpNMXVlUHl4NE9Ud3JwWnRYRkQ1?=
 =?utf-8?B?elg1L0NFMkdNZGc5KzZJTHVLeXZCS2dMNEY0RHY2R2xrUzdjWU1xSDhQM3k3?=
 =?utf-8?B?d1g4bGRPQXlURzBURnM1TE1WN3UyNHRHSWVPUXc0VElvUCtMYk1IWEV0UDBZ?=
 =?utf-8?B?ekxyNDFDYlZRRU1vcVNPdGZBR042OHB0RTlidGpvQzBsNS9tSUtkM2RTOXQ4?=
 =?utf-8?B?K1lEOVJmMFV6NEVjRUZ2ZGl2bFZvRTkyUGRybUM2TEU2c2RzVXZrY1hjMmc2?=
 =?utf-8?B?bGM2V2lKbFFxSkhUejE4a1VraGVCZllydkU4MURrdUhwazFYNlNGOXAvY0VN?=
 =?utf-8?B?ekhrbU1NeG9ZbmxQT1RmRFR4T3p0UXlkTnBQOGd0T05WWjVldTJSTEdZRGRz?=
 =?utf-8?B?dFhzQ240Ui9PV3dyYXdGemp0c3kwRzlBTmE3Z0wwU1V0YzE5ckhoWks3Q01r?=
 =?utf-8?B?STR6MjNsWWpVaHlibkFyVWp5a3RuVlhLeWs4di9zck5Eb29FODUyaXRmR3Yz?=
 =?utf-8?B?WHZNcWdUWTE2VEJhc0dhMmxwdWEwMEJDRGlWd2FZNFEwcjJtck5hZjROU1N0?=
 =?utf-8?B?NFgxZ2VMREFUNXlDcDlROEhWU0poRzNUMWdnNEVLcTUwaDJUcmlYNUpFNllN?=
 =?utf-8?B?cm1RUXY2WDFPOVUvMmRxNnVBMmk0NjlkZU1UYVJ2RWFHZWRNaVdxeWVrMTg3?=
 =?utf-8?B?V2JXWU5QcllzRndNVEJPUUNjc1R5bTJqcklkN2ZmdFN1TUlTVjVGYTIzWjZ1?=
 =?utf-8?B?dUQ2cGpTdmJzamhMVkVrWExvVGdqaXB4WGd2WDYwU2x1clFDMG1UQVRlbVUv?=
 =?utf-8?B?N2d1d1VoemwwcUxSRzJnY2RzbmZYQjVyNUxUeE0wMkRzc2tHcm1mVzdabjRw?=
 =?utf-8?B?WjNpL2w3N2g4NGVxbGRoaGhsN1VDVDZRTW9HYUU4TGt3Sm1ITHFOZnBFVm5y?=
 =?utf-8?B?bTd4Zll4SzVodW1SSUpldzc5Vy9FYUVZN1RYY05hRWpNSW5uOUdtSkhZWGhU?=
 =?utf-8?B?cXlZYTM1eUJZbWxodkRwWDMwdk4yQXhpUUhDRXJFcFpyUkdBM2UzYllKNGp2?=
 =?utf-8?B?VC9QTXhmaWwvUGsxUGQrV2lzcncwQjV6QldRR2laM0ZmZEhPTTNiNWVXQUI1?=
 =?utf-8?B?Y084UzVMSFphckFKQ2NLSVNPdW5WMjJKNmhreVRDNk5xNVJJMU1tU3lKWmlZ?=
 =?utf-8?B?aDRBT2ZLVitRTjdsckdBRFk2YmxSR2lMUHlBaTNwRDVOa0xRcnVpbGdzMXZj?=
 =?utf-8?B?SFJyRlFFSU5pcjU2Y2w0S21nb0tYZzBIWVNJUURSTk5lV1ozZGEyRlN6eXQy?=
 =?utf-8?B?SWZMVzhxNlBOcUVIbDRXR3N5S3BlUGlJOVpHMkw5MFVwZ0UvZ21NY3JvN3N3?=
 =?utf-8?B?L2UxcS9hTkw1T2JEQXJ3QVZib2tWN1dSVlNDT2kxZ2RXV1V0TU85Rk9FY3Fa?=
 =?utf-8?B?bWZRTGE0SFF6SmR2djhwWjdRVy9uWnVYS2xPeSthRmdkL09BV1lSOFVWUG82?=
 =?utf-8?B?NVBVNS9ZN284cjRtcm9xTmtWbS9yMkJMSGh4VVpWTkFxY3VxekEzUUY2a0ZD?=
 =?utf-8?B?SHd6UGpHS1Frazh5UGRmazJrWXAxU1Q1Q2ttQjNVbTBrNVArQnNEektPNC9N?=
 =?utf-8?B?VThKVE1MYXViU2xacDE5MTZQWHJONk1US3g2U0xCeDVXdkMyS29DUk9WUS9V?=
 =?utf-8?B?Zm54MjRFSnVTZ2tJc1hKZ25CMHp3UndkVVhQNjZCZXlBbTQzUDArR1RlOWNx?=
 =?utf-8?B?dkVlUDhIejNLSVluZGRoWS85S0E3c2Nja3Blc1dkOVFoYVBQcmFvNU82aS95?=
 =?utf-8?B?YnNENlNuUnpiR1VWclNWdmtVVFNpWm9lYWVDN2JEM1dBbVMwSFBtNEZOTGlJ?=
 =?utf-8?B?TjlYd1JwVDMxQU8rSDY2c05YU2cvdHdWbFV5bVhRd1JSVmNRVlVic2hldTJT?=
 =?utf-8?B?NkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <284CE91D0690CD4597A7600974A5689D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6267.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b9c45e3-1344-4d43-6ae8-08dd978e19db
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 11:04:33.1126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2BRhdUfXHO3GXoaedxsAL5bFNbEzpRR8zUbF3HYg1a5KtNvFRR3QLZU/51ijD9UOzNM4RT3fn6PmwUSeoJiiQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6514
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI1LTA1LTIwIGF0IDEzOjU0ICswMzAwLCBJbHBvIErDpHJ2aW5lbiB3cm90ZToN
Cj4gT24gVHVlLCAyMCBNYXkgMjAyNSwgVG9kZCBCcmFuZHQgd3JvdGU6DQo+IA0KPiA+IFRoZSBB
UkwgcmVxdWlyZXMgdGhhdCB0aGUgR01BIGFuZCBOUFUgZGV2aWNlcyBib3RoIGJlIGluIEQzSG90
IGluDQo+ID4gb3JkZXINCj4gPiBmb3IgUEMxMCBhbmQgUzBpWCB0byBiZSBhY2hpZXZlZCBpbiBT
MmlkbGUuIFRoZSBvcmlnaW5hbCBBUkwtSC9VDQo+ID4gYWRkaXRpb24NCj4gPiB0byB0aGUgaW50
ZWxfcG1jX2NvcmUgZHJpdmVyIGF0dGVtcHRlZCB0byBkbyB0aGlzIGJ5IHN3aXRjaGluZyB0aGVt
DQo+ID4gdG8gRDMNCj4gPiBpbiB0aGUgaW5pdCBhbmQgcmVzdW1lIGNhbGxzIG9mIHRoZSBpbnRl
bF9wbWNfY29yZSBkcml2ZXIuDQo+ID4gDQo+ID4gVGhlIHByb2JsZW0gaXMgdGhlIEFSTC1IL1Ug
aGF2ZSBhIGRpZmZlcmVudCBOUFUgZGV2aWNlIGFuZCB0aHVzIGFyZQ0KPiA+IG5vdA0KPiA+IGJl
aW5nIHByb3Blcmx5IHNldCBhbmQgdGh1cyBTMGlYIGRvZXMgbm90IHdvcmsgcHJvcGVybHkgaW4g
QVJMLUgvVS4NCj4gPiBUaGlzDQo+ID4gcGF0Y2ggY3JlYXRlcyBhIG5ldyBBUkwtSCBzcGVjaWZp
YyBkZXZpY2UgaWQgdGhhdCBpcyBjb3JyZWN0IGFuZA0KPiA+IGFsc28NCj4gPiBhZGRzIHRoZSBE
MyBmaXh1cCB0byB0aGUgc3VzcGVuZCBjYWxsYmFjay4gVGhpcyB3YXkgaWYgdGhlIFBDSQ0KPiA+
IGRldmllcw0KPiA+IGRyb3AgZnJvbSBEMyB0byBEMCBhZnRlciByZXN1bWUgdGhleSBjYW4gYmUg
Y29ycmVjdGVkIGZvciB0aGUgbmV4dA0KPiA+IHN1c3BlbmQuIFRodXMgdGhlcmUgaXMgbm8gZHJv
cG91dCBpbiBTMGlYLg0KPiA+IA0KPiA+IFt2MiBjaGFuZ2VzXQ0KPiA+IA0KPiA+IEFkZGVkIEZp
eGVzIGxpbmUNCj4gPiANCj4gPiBbdjMgY2hhbmdlc10NCj4gPiANCj4gPiBYaSBhc2tlZCB0aGF0
IEkgc2VlIGlmIGFkZGluZyB0aGUgYXJsX2hfc3VzcGVuZCBjYWxsIGFjdHVhbGx5IG1hZGUNCj4g
PiBhbnkNCj4gPiBkaWZmZXJlbmNlIGluIGZpeGluZyB0aGUgaXNzdWUgb2YgUzBpWCBub3QgYmVp
bmcgYWNoaWV2ZWQsIGFzIHRoZXJlDQo+ID4gYXJlDQo+ID4gNCBvdGhlciBwbGF0Zm9ybXMgdGhh
dCB1c2UgdGhpcyBzYW1lIGZpeCBpbiBqdXN0IHRoZSBpbml0IGFuZA0KPiA+IHJlc3VtZQ0KPiA+
IGNhbGxiYWNrcy4gVXBvbiBmdXJ0aGVyIHRlc3RpbmcgSSBkaXNjb3ZlcmVkIGl0IGRpZG4ndCBt
YXR0ZXIuIFNvIEkNCj4gPiBqdXN0DQo+ID4gc2ltcGxpZmllZCB0aGUgRDMgY2hhbmdlIGFuZCBs
ZWZ0IHRoZSBmaXh1cCBjYWxsIHRvIGluaXQgYW5kDQo+ID4gcmVzdW1lLg0KPiANCj4gT2theSwg
SSd2ZSByZXBsYWNlZCB0aGUgY29tbWl0IGluIHRoZSByZXZpZXctaWxwby1maXhlcyBicmFuY2gg
d2l0aA0KPiB0aGlzIA0KPiB2MyBwYXRjaC4gVGhhbmtzLg0KPiANCj4gSW4gZnV0dXJlLCBwdXQg
dGhhdCBwYXRjaCB2WCBoaXN0b3J5IHVuZGVyIC0tLSBsaW5lIHNvIEkgZG9uJ3QgaGF2ZQ0KPiB0
byANCj4gbWFudWFsbHkgcmVtb3ZlIGl0IChvdXIgdG9vbHMgY3V0IHRoZSB0ZXh0IGJlbG93IHRo
YXQgdHJpcGxlIGRhc2gNCj4gbGluZQ0KPiBhdXRvbWF0aWNhbGx5KS4NCj4gDQoNCldpbGwgZG8s
IHNvcnJ5IGFib3V0IHRoYXQuDQoNCg==
