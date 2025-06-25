Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1D829ACFD
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750846407; cv=fail; b=F4pIwM1dWQPxyUEVuwRXI/idbkyvIY8quGzi+Z3XMwuRnngk8opflMP4gj8cawMFAqvkCrCIy8Xj/eLiCmekmNF6ADZ2kE+IklWA1b/Hy0u+Jt4PIrMum6Wr88FV4JoHJdXJzRDurBChufaNQqnQeWlYKrTaZwGHHJf3XYv+fkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750846407; c=relaxed/simple;
	bh=s4ELyGT+I6OCqms3OKW8eZP7GnJrwjgW0L/Q1wz1WOg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lh1yV4qsiRzQJJX4Q4lKY2f+rOPO1kTZfM/EbNSZmWGGZuMCJ6HiRocQkzEGu56Id5hRGAgYj203TBQjr+f2vGkDxl9CvEzML/BparV2sJOTDq1qAHj3PFBnfk9ZfQmrOvzjVQRgPphLCxtsHjhDpitsPE42kZpjpRScxhzWSD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X4QfGP5K; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X4QfGP5K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750846406; x=1782382406;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=s4ELyGT+I6OCqms3OKW8eZP7GnJrwjgW0L/Q1wz1WOg=;
  b=X4QfGP5K02Pppfy5P6/VuK94d3wrLMjI9w9fHxl0tdSbO6QQlUEDMPth
   SuQt019Ulil7QMvUEiIG8pMfZz0g4xcGNiB84huHBX4wPgtHTvK3un7Ue
   OfaZl5MRs0UXYBz9L7sz1ePsyfBsE2vWHa+AYwjnY+LcfhPxYhKwJr9In
   yOP+Em7mGoY1kR+hFLVSkgDnXj3yVo6g0CAcK8RJz81nA9CNSRel1/3vy
   wQYfH7dezevcFFAYXQqhdX31p2TaflGiEUWca5c/erAC0g/LrSDbP3+UV
   Ha6/SE0/MneWoL8DJ7cUpLZstjfAfVb0fem/DjFwGzYed94sX2CSfscZN
   A==;
X-CSE-ConnectionGUID: 9Onhs0p5RcKenXV6DqfV5Q==
X-CSE-MsgGUID: QD91L1wWTbKzR3RuZ/Wb7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53244924"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="53244924"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 03:13:26 -0700
X-CSE-ConnectionGUID: L/ncX42eSym4fWgLtoUVWw==
X-CSE-MsgGUID: QqsV5Af8TrqGhZcA3HlBRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="156454310"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 03:13:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 03:13:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 03:13:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 03:13:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R07aGu/terG3nfpmbmVwAmOfVO+FhDSA44FhpK+VNlDzrNu9QrnN/3H6m8+WY+PYuOmbbJjipWUG6EUyuBLv5OsYMjTajcZ5mNyX2RURrKWR6Bl9IMVxpgQadbZ6z/qzayYT2Y8MGR99dQmf2dJL+XlLyEeEqT2D/GwM7ffqIKF+xq59v33Xl2J2i0T1D2rnUMlmdBsxmfMMj0YZZmTLcPBDmoVA8syBXbpDEE8v8EJ2jx/0H0i1/5rPTt7mWtV/VtRwIsXjqwmK9Lo9dctFUxGsP3obsubEqDVNs3ZlEIFePrRliOTUC3E9MoUGOBRJ8XfoapzT88Xc1u2UKyp4nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4ELyGT+I6OCqms3OKW8eZP7GnJrwjgW0L/Q1wz1WOg=;
 b=TWj8ici9DlIo5w49ofo87cE2dKtqK3qVsngaYtHkK8J5+3rUm2biuKlcj1HbnCZH0Xv1Z4ZvOwexwyr+F05mGm10Mruoj13JQx3Ei1j//aXo6XLKWu3kBL9XmnBv0wd/DWJAuasbKp8Qk/oV4BB89owWi29sK7//nqpn8RqIGqQtoyPZa091r6OjLdPOUGZgaEV707YB2RN8g+fbjYKn468Cgxiur7e/QZ4TLg3J+kaMbfvl9u9rB+vMpAg9YSE0xKjCbSnW9FXXv7Mf7d/uDAfVVaN5VpSVAr8txQgwzov5kzNNpEwBYUCdvf24SdEzFgUNpt9P528G+2Bh0ZgG1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by DM4PR11MB6166.namprd11.prod.outlook.com (2603:10b6:8:ad::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 10:12:50 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 10:12:50 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Hans de Goede <hansg@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Stanislaw Gruszka
	<stanislaw.gruszka@linux.intel.com>
CC: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 09/10] mei: vsc: Fix "BUG: Invalid wait context" lockdep
 error
Thread-Topic: [PATCH 09/10] mei: vsc: Fix "BUG: Invalid wait context" lockdep
 error
Thread-Index: AQHb5BwDdiqExHSLlUCA0/llPqls/LQTqxaA
Date: Wed, 25 Jun 2025 10:12:50 +0000
Message-ID: <CY5PR11MB63661FD883CCA8A286CDAB3EED7BA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250623085052.12347-1-hansg@kernel.org>
 <20250623085052.12347-10-hansg@kernel.org>
In-Reply-To: <20250623085052.12347-10-hansg@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|DM4PR11MB6166:EE_
x-ms-office365-filtering-correlation-id: 9db40232-9ad6-4d03-516b-08ddb3d0d765
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?a1QwNzFDd2pxeHhiWDQxVi9WN3p4SG1FZDNjYXJ2WnJ0UjV3ejh0bUFBalJi?=
 =?utf-8?B?SE12QS9GK3lncmJINngyMTNRY0x3Z3E2UG5zT3BLMWtNUEl3S3NEVklHUFc1?=
 =?utf-8?B?cXljbExQZU9oMHFnTnhIS3BKUmtUWG8rcjZyd045NW0rQmJlcDk3SjJZM0pR?=
 =?utf-8?B?eHMzR1RQSTNoT1hwL3prT2p0cjk1eGprUEEzbkNFRFRrY1NiYktmaGdOSmc5?=
 =?utf-8?B?ZEdkRzhlSUNkRlVTeUZOV0dOZWRmK3BQdmhBR0dCays5a2JOa205dDF5QnlZ?=
 =?utf-8?B?bkU0Vk5yRW9jcFluN3pvVGhTUFlpekhVeDJaREl5cXdBejdBZkFIbjk3WUQw?=
 =?utf-8?B?VHRmbzBHYnVmaElvZ0NHc3RrbllDbEdDMXdpb3hWOW4xTjcyWWRkTTFXWlpt?=
 =?utf-8?B?d0dzaUpDTTM5UnM5SzNhTExFVFM5UEFZRGd4SHpUYTlvQWZITmI1d1FqaWxq?=
 =?utf-8?B?UU1RWVdRc2k2RUo4eFZmeGdYY3FmNTk4cUhsbVE1bDYzb0gzeXJrVjFCRllZ?=
 =?utf-8?B?Rm1FKzRCcTBhWVNSaDRVNGR1VW9pL0wyRkwvTTN2NkVQM0E5ZGI1eEJVS1hZ?=
 =?utf-8?B?UzI1NUVOQWswUXhlVGYwRWRhTVU0cC9wRHRReGZoVjB2N0wremhBZkRwVzM5?=
 =?utf-8?B?a0c3V05WcUtwWTJLaVd5Ym0xRkRvVlNqZU5GUnlnam5mKzJRbHYrWkpFdVlB?=
 =?utf-8?B?cG5QQXhWM2o1THhDMVVVZFBiTStYN1Z0Qi9tejJKbzR2dFdLVWRxRThuampl?=
 =?utf-8?B?WmNhM0ZlQmUxcXd2RHp3aFhDblJvRUhBY0dlbm9vK3dhZEtaT2dXZWg2aFRo?=
 =?utf-8?B?YkM1cTN5ak9vUlB5OHNVaVpTWjZ3d1crQ0lQQ1V0bVcrQm51czRjK1FTVklo?=
 =?utf-8?B?Tjl4bnhZSWhnZjJENzFVa1UrV3V5UkNUSHVTR1pmOXAwZHpLTk54NEZHckx3?=
 =?utf-8?B?azVhTmhLVE1CWTNXZVV4eGkrNmZMUi9wdWtLeVcrNjM1dVV5dFdCMEhkTDJs?=
 =?utf-8?B?cjBFUVo3SVl3WVp3K1pUZ0dRNFFrZ0xYR0VtOGJBVDlub3lhblY2U1Q1QUNa?=
 =?utf-8?B?OUJEK092N1hLc21mQk1XdTFBbjVnbGdZV2Jjby9KcWY3dXhKTTVrL2VUY3Z1?=
 =?utf-8?B?Wmp3NXE0MFROdjBjTW51NzE5M3lZVjg4UVFweEc3Z1Q1L2xMVGMwUjB0bGxr?=
 =?utf-8?B?cndHOFR1M2tVY09KL3d2L3pVRFlMZmtYeUJ6akRURG10djlPREFMcU0wVnlk?=
 =?utf-8?B?b0FHaTF4NXVsNkN0TnNIK3JET2dYSUVpbkZta3B1Rnk1ektuT1hZSDVhRmNQ?=
 =?utf-8?B?RE5ieERiUUZMR3MrenozTXA2emtOQ29YOUI5UmxjcGlUY0hpZVQ0ZFpxL1Nz?=
 =?utf-8?B?N1JMa3pPUnNjeTBrOE1QQm5oY25UZEZMeUMzdERrTUhoZ3pyWUZCYS94aGZ3?=
 =?utf-8?B?STU4eUV4VFY1VnZzRXorYWZWTDZZQ2piQlloWUdKbWc0SVVBbCszYnJJaVBx?=
 =?utf-8?B?T0hHd0JEZEc1MS9JUzFnSEJKaVNGSDVELy93WTg0UTkzTVFNVDJGZStiZGtw?=
 =?utf-8?B?NWZWdk5ETGFjanF6dVJGYTRhYUVLcDc0aDd6U2I3N0paZ25yRndrbmFzV2JU?=
 =?utf-8?B?MER1dTBWeS9ZTWlYdWhRSnBZc1lrUDlCNUFjUFp5QzQwMy9rNXc3b3dZeDlp?=
 =?utf-8?B?S29yKzAvR09ySmhDb3Vod0NEWDFYQjJ5MEFYN25ENVY5eEQxRktvOG1xaWp5?=
 =?utf-8?B?RGJqdTZjc0x4bkRCWlBJakRaYjB4cHJDSU91dmpIVnlKQUNhQ1VyWndxRkdr?=
 =?utf-8?B?UzcwUlB1cytRYXJjRTR6OEZ2aWNlTUFkTkhDdldJanhCaVZNVGczdVJwL3BI?=
 =?utf-8?B?TjNndktiSHdoUjlXVnNYOWhKMFZaNCtrWUphMy9sekl3UU1iNFQ1OW5JOGQy?=
 =?utf-8?B?ZGU3SWI3QjVMK1g3MHhIMklpQW1yZkdGMi9BeTlCZG03eS9mZXI5SFFWNDFT?=
 =?utf-8?B?SkE2MC9CeUV3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzhHTkh5Z2JUNWZ4Nm5RTmFmenZwbzZZdnNHSGhsMDlsSFNod2wrSitDaUZ6?=
 =?utf-8?B?dDQycDh0VzhPZEhRa1NFOTJoRGFac296bHN5UDhUQmd3MWJxVnpyUnpxUCt1?=
 =?utf-8?B?MWVVUnBleUExY1N3YjREYVIrMk9QemdCTmlHZzR6eGc1NFA2VnNQWUJaaFBy?=
 =?utf-8?B?czhVT2gzTE1LTUtUa0ZaajYxaUxLOTdDWEE5RUR4MVkzQnE0d01udnppS3VK?=
 =?utf-8?B?L1NHRDNZejRyNWN6YnkrMXpudE90ZkxDMlpXRUxHQnpIazV1Ulo3cTNKNFhv?=
 =?utf-8?B?RUhzKzVCOW1OY3Q5Ump5ckpNdnE5dnVyaGZXbHFrMDhza0gvUCtsT1ExSFNi?=
 =?utf-8?B?bVludmNibnc1dWloVDdTL3NCUGwra3h5Njg0c1M2UlBqOW1BdmE5V1RtN2pW?=
 =?utf-8?B?M0t5WkRiL3pnYzJhUFN1NEg3OXFJVEFKSXE1elFuaW5NSy9xcWZQTjNYaStI?=
 =?utf-8?B?eTFhbTZRYWpFb2RIb1hra2dJbnprWDA0QWlrSXA1MzF4Y1JHYjFsdG9rT1pk?=
 =?utf-8?B?MVhTVndEdnBWTTkvMXFzUDRBL0FLb2J0d0crdk55OVFkREV1WG11RUtVM0w3?=
 =?utf-8?B?aUFGSGszZ1l6NTZPQXJDUHMwbm1Bcm8zOWovUDZjQnFiN2g0L1UrM292SkZx?=
 =?utf-8?B?S2FBaS9hZm95WHB4eVVOUDVMcENxNzBjT1d4S0tSV01oWlF6cTg3d2tZeXhi?=
 =?utf-8?B?R1JQUC8wR3haN3FIY1ZZcUFsaUVHZ2tSV0lWc0lucGJVdzYxTXJjbVhBaGty?=
 =?utf-8?B?ZDZ6bUw1VFRCb2hkMDB3R1U0a2JKMHBZVThoS01jaHV2MXpBK1pVc0RQSkFN?=
 =?utf-8?B?bEpjcXo5T1hYeWpTcE1GMGRzWXpUMjR5WHlWNTZpWWFTV3Z1QjdDZWNra2sy?=
 =?utf-8?B?RG5DUWJKSS9MSnNqSWJST3o0Vzh3SDVKWDNSNHJCSTZYYXNJRTV6UGZsVCsv?=
 =?utf-8?B?K3Y5K3VZaDJlaFBYREYxeXZCV2YrNU1hY0dVeS9uamhGR1NGU1MraWN0aGt3?=
 =?utf-8?B?MEFjbEhWN0g3aHZWOE5TVFNEZkJQZnpKSGZEcDdrMW9tYTdlb3d4ZFUxS0hF?=
 =?utf-8?B?MytYR1M2eGJUWVdOV09XdURHeEgra1hMcEpGbnV5N3kzUWl2ZDR1R1RLbnJ0?=
 =?utf-8?B?SkpWbzBmTmhkR2pHckZxZE1ySjh1bzRKNklFMHdkWVZxQmhWa2I4Yk1rN24z?=
 =?utf-8?B?SVVVNnFEQUlXRG1EZ0h2bHkzcThYUUZSa2JXYkUydFdXb2JLWVFTWmZxQ0JD?=
 =?utf-8?B?YU5qSC8vTldiZE53R2d3aS9HeWRLcklYVDhEMkxPUWpURnk2aDNNM2xIb0lP?=
 =?utf-8?B?QkZOMklDQ1JBWnRFWUdrMVcxeGFvSXAwcnNaQVBRU0taQ3lndXFvVUU5dzFh?=
 =?utf-8?B?aGlmR09kVy90MzNSYWpnRUxyVks5QUNqK0lOaitHQ1E1d0pLTDQyNGFYTmR5?=
 =?utf-8?B?dGZXZ2t6N284QUcwTlcwUktWYWtZQU9iM0hQWlJEREJtajQ1MlBkTnM3cTlB?=
 =?utf-8?B?RFZ0SVJObXpqcTFWSmVtOUk2WUdsYUZqQVlFV2pVWlBzRHFSZlZIMmhpSVhp?=
 =?utf-8?B?OG1uSlZ0eU5oeldvanZTVVdzZ01ILzVSUjcwcFQxbDJmbHJZMHo2NWxQcXF6?=
 =?utf-8?B?RnFUTVNjZGFvSDkyanNacHhrb0ROQ1NTVUZwWmc3YU5CRjhTSENkR1Z4bitG?=
 =?utf-8?B?cEZJUFJnMUlpTXJrSitxODVBUTRQdUZBTXRvNVRTWVVvcE9XYlBUWE1GR2FQ?=
 =?utf-8?B?VVorcFNPWEdsTXhqRjAxOHhjMUZFZlY0ZVZPVW5lRG03SHdxbE1PZHZOZld4?=
 =?utf-8?B?WitBMDhLRFUvY0pJcE5VUzZ4SnhmcW9DejgwUmRtM0xwYVpkQlg2L0tzK0Y4?=
 =?utf-8?B?djBRRC9HUW9jczBJd2RYRGYxdUIvbDVuMjVSUDVWVFVQS2VPS0ZWRTZWZkox?=
 =?utf-8?B?UlpBeTJzczJpY3R5ZlhaZ0JUUmJvalpVN2dKbWZFbUlUVkN1R1c1YnZJVEMw?=
 =?utf-8?B?UlQ5aTRQV0N5cmduNEMxZi9iTTdZNjJHTjBUZE9WVzQxNGJDenVmQXp4SWdz?=
 =?utf-8?B?dTVCTHU5d0FBeWpYcGFQdkluSXlocWtBcHZsaTZZMHBseFI0cjBIM3ZpRXJI?=
 =?utf-8?Q?oc/gf3eC3+kelr/6fsFhtN9Un?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db40232-9ad6-4d03-516b-08ddb3d0d765
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 10:12:50.4702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R6UdyKvpU8OI1fRVOcBoYQNzkSjIC3CGiBSPHxRfLUA5jacGUmu8JQP9tgB6kZWyrcmlDgst4RaxNULiOo/92aaJAqKcy0x+PUTICOdcnb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6166
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBbUEFUQ0ggMDkvMTBdIG1laTogdnNjOiBGaXggIkJVRzogSW52YWxpZCB3YWl0
IGNvbnRleHQiIGxvY2tkZXAgZXJyb3INCj4gDQo+IEtlcm5lbHMgYnVpbGQgd2l0aCBDT05GSUdf
UFJPVkVfUkFXX0xPQ0tfTkVTVElORyByZXBvcnQgdGhlIGZvbGxvd2luZw0KPiB0cC12c2MgbG9j
a2RlcCBlcnJvcjoNCj4gDQo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ICBbIEJV
RzogSW52YWxpZCB3YWl0IGNvbnRleHQgXQ0KPiAgLi4uDQo+ICBzd2FwcGVyLzEwLzAgaXMgdHJ5
aW5nIHRvIGxvY2s6DQo+ICBmZmZmODg4MTljMjcxODg4ICgmdHAtPnhmZXJfd2FpdCl7Li4uLn0t
ezM6M30sDQo+ICAgYXQ6IF9fd2FrZV91cCAoa2VybmVsL3NjaGVkL3dhaXQuYzoxMDYga2VybmVs
L3NjaGVkL3dhaXQuYzoxMjcpDQo+ICAuLi4NCj4gIENhbGwgVHJhY2U6DQo+ICA8SVJRPg0KPiAg
Li4uDQo+ICBfX3Jhd19zcGluX2xvY2tfaXJxc2F2ZSAoLi9pbmNsdWRlL2xpbnV4L3NwaW5sb2Nr
X2FwaV9zbXAuaDoxMTEpDQo+ICBfX3dha2VfdXAgKGtlcm5lbC9zY2hlZC93YWl0LmM6MTA2IGtl
cm5lbC9zY2hlZC93YWl0LmM6MTI3KQ0KPiAgdnNjX3RwX2lzciAoZHJpdmVycy9taXNjL21laS92
c2MtdHAuYzoxMTApIG1laV92c2NfaHcNCj4gIF9faGFuZGxlX2lycV9ldmVudF9wZXJjcHUgKGtl
cm5lbC9pcnEvaGFuZGxlLmM6MTU4KQ0KPiAgaGFuZGxlX2lycV9ldmVudCAoa2VybmVsL2lycS9o
YW5kbGUuYzoxOTUga2VybmVsL2lycS9oYW5kbGUuYzoyMTApDQo+ICBoYW5kbGVfZWRnZV9pcnEg
KGtlcm5lbC9pcnEvY2hpcC5jOjgzMykNCj4gIC4uLg0KPiAgPC9JUlE+DQo+IA0KPiBUaGUgcm9v
dC1jYXVzZSBvZiB0aGlzIGlzIHRoZSBJUlFGX05PX1RIUkVBRCBmbGFnIHVzZWQgYnkgdGhlIGlu
dGVsLXBpbmN0cmwNCj4gY29kZS4gU2V0dGluZyBJUlFGX05PX1RIUkVBRCByZXF1aXJlcyBhbGwg
aW50ZXJydXB0IGhhbmRsZXJzIGZvciBHUElPIElTUnMNCj4gdG8gdXNlIHJhdy1zcGlubG9ja3Mg
b25seSBzaW5jZSBub3JtYWwgc3BpbmxvY2tzIGNhbiBzbGVlcCBpbiBQUkVFTVBULVJUDQo+IGtl
cm5lbHMgYW5kIHdpdGggSVJRRl9OT19USFJFQUQgdGhlIGludGVycnVwdCBoYW5kbGVycyB3aWxs
IGFsd2F5cyBydW4gaW4NCj4gYW4gYXRvbWljIGNvbnRleHQgWzFdLg0KPiANCj4gdnNjX3RwX2lz
cigpIGNhbGxzIHdha2VfdXAoJnRwLT54ZmVyX3dhaXQpLCB3aGljaCB1c2VzIGEgcmVndWxhciBz
cGlubG9jaywNCj4gYnJlYWtpbmcgdGhlIHJhdy1zcGlubG9ja3Mgb25seSBydWxlIGZvciBJbnRl
bCBHUElPIElTUnMuDQo+IA0KPiBNYWtlIHZzY190cF9pc3IoKSBydW4gYXMgdGhyZWFkZWQgSVNS
IGluc3RlYWQgb2YgYXMgaGFyZCBJU1IgdG8gZml4IHRoaXMuDQo+IA0KDQpSZXZpZXdlZC1ieTog
QWxleGFuZGVyIFVzeXNraW4gPGFsZXhhbmRlci51c3lza2luQGludGVsLmNvbT4NCg0KPiBGaXhl
czogNTY2ZjVjYTk3NjgwICgibWVpOiBBZGQgdHJhbnNwb3J0IGRyaXZlciBmb3IgSVZTQyBkZXZp
Y2UiKQ0KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1ncGlvLzE4YWI1MmJk
LTkxNzEtNDY2Ny1hNjAwLQ0KPiAwZjUyYWI3MDE3YWNAa2VybmVsLm9yZy8gWzFdDQo+IFNpZ25l
ZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhhbnNnQGtlcm5lbC5vcmc+DQo+IC0tLQ0KPiAgZHJp
dmVycy9taXNjL21laS92c2MtdHAuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWlzYy9t
ZWkvdnNjLXRwLmMgYi9kcml2ZXJzL21pc2MvbWVpL3ZzYy10cC5jDQo+IGluZGV4IGY1ZWEzOGYy
MjQxOS4uNWVjZjk5ODgzOTk2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21pc2MvbWVpL3ZzYy10
cC5jDQo+ICsrKyBiL2RyaXZlcnMvbWlzYy9tZWkvdnNjLXRwLmMNCj4gQEAgLTQ5Nyw3ICs0OTcs
NyBAQCBzdGF0aWMgaW50IHZzY190cF9wcm9iZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQ0KPiAg
CXRwLT5zcGkgPSBzcGk7DQo+IA0KPiAgCWlycV9zZXRfc3RhdHVzX2ZsYWdzKHNwaS0+aXJxLCBJ
UlFfRElTQUJMRV9VTkxBWlkpOw0KPiAtCXJldCA9IHJlcXVlc3RfdGhyZWFkZWRfaXJxKHNwaS0+
aXJxLCB2c2NfdHBfaXNyLCBOVUxMLA0KPiArCXJldCA9IHJlcXVlc3RfdGhyZWFkZWRfaXJxKHNw
aS0+aXJxLCBOVUxMLCB2c2NfdHBfaXNyLA0KPiAgCQkJCSAgIElSUUZfVFJJR0dFUl9GQUxMSU5H
IHwgSVJRRl9PTkVTSE9ULA0KPiAgCQkJCSAgIGRldl9uYW1lKGRldiksIHRwKTsNCj4gIAlpZiAo
cmV0KQ0KPiAtLQ0KPiAyLjQ5LjANCg0K
