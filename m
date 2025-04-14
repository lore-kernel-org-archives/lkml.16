Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1F92DFA3B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744651853; cv=fail; b=NdsedgfqsCuUNPg3FxBtikaN6nIp2jclpDAh/1RmsaeV/VEfk05S5fS3bNdjnFO8+MLZh6pw3Eoj8EdA6rg65jcWNMV/6sT/k/8KXM59CRCgiu6myRooXVo24o+vycv1gr/Hz2P/KLaD/kLFL8loDZyco9jk+78j05bM3DdM2mM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744651853; c=relaxed/simple;
	bh=cnpWsDYD7lOx9TFu00f75wV0g+VPx0QKVhYeU//hp3c=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NZUFSWmVG9t0h+B7B6lfEncMBfMSsjm/b+QxtXsrsw2Rpd3VearjxK46/XiEUSfHkuIvBrE4JaTsKi7zczQSYfhWSsb1xpFT+18T3aNhChC1QwV7+rzwtZdAJ7qojQG+2cQw4pOSsii+JymKlIvcWVVmcGOcNA+gDyyTbtlC3bA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eaYbe3in; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eaYbe3in"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744651852; x=1776187852;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cnpWsDYD7lOx9TFu00f75wV0g+VPx0QKVhYeU//hp3c=;
  b=eaYbe3inGS0vBYQoWqc8W6sQNmP9iKSt4VXVi2WaLw6ojob78k3zOKtA
   MP2bTFdPsQSUwSxf5Py3fexa+/tpdPOd38QjDAGHFL5FnWEFkS5Xz7PXU
   enb75c766C9QErIayNA8zyJ51RGK/s87NV2Iq2Kn6DtPaWjcT0r7lY7AZ
   k2ImFmyAwlqV1FeP1f1G9RCXS/8v0hybKoiEAciVYoPbhQ/3oElnBWgtw
   P6Qaql0qL0VOPpufD6Wqo9rJpDE30xYkVLDmGse24/FMTeFPLDNe4zXKB
   Zhp1/OVsdtrKb+B5iVK//1JhVu31J/J3LobAA9FeUFAHUpHPiL9Gu9HIp
   Q==;
X-CSE-ConnectionGUID: j33KruTwSReKeH9jo4ziCA==
X-CSE-MsgGUID: a2O9zAbOTp21q9NEK9euLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49789602"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="49789602"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:30:51 -0700
X-CSE-ConnectionGUID: LTmPpGTySYCF75/3Bm63qw==
X-CSE-MsgGUID: UfbKXp1NSHOStuJ5Hwmbfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="129837781"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:30:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 10:30:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 10:30:50 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 10:30:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dafY6aHtBq/b/EvTKGgeGNboKaBEMqwlPGilwDXqgeuaqmv2i83UAfpfL9VMWqAzCNjZUqFPsoeGW49U5Sv66BCa3wKBbItl1PrKR01Vtqe8wznMP3BzKDXJRpwOmkwSRuFfDL9Rte4t6z6UA6lVew1Vcw6KD/UhmbXiJwtxgcmiB346+qmhisipkaWgz44KHiqamErk8GTyJdVS2k5YWllfKlUsY93hTrNtym6jnaWUHn5bQcDVgiOaB20PeotFW65Nap61A04/4qZPlF84clROf6C+NidYb+8I0BMuAzE0mHCTOPkcN8d/1hJsyLtE61lCcU+v27TcVGipKNEnGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hrN+cWmu39Nf73elDJf3eItS8WxZfm0cu1G4zXHgUV8=;
 b=WILiBX7zow/5S6YopA+tJfIqar9aC8xMkZBng6p9KF1ZJvxIT7Iilmm620dKo86muCohIlsp1S5zrW0J7rpiu1VbdX3yISw0x19YH8Jy3gbD/QJpW1QqDn2vRHE4QRt4//DEdH+ExO/doXuIQDjkCZcQLUxIDRzocc297YDXqmXuHIYwRmZYKOLg4i1qMIuuyVgJXKeciuJPApGZ5IgF34YMy6wxtH60n7jmzb23b9o18W/BlAuiLwW+dpX+qswl0ay9woXA5gEXtrZ4I6r2CLcmb0v3h3bi20xO73PbcviYH86MCA5dkmpgZXP4uaUqxptuA/j9hoDP/GdR8cCOxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH0PR11MB5015.namprd11.prod.outlook.com (2603:10b6:510:39::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Mon, 14 Apr
 2025 17:30:20 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 17:30:20 +0000
Message-ID: <4bec8924-6125-45ef-a212-f123ab2e4f5b@intel.com>
Date: Mon, 14 Apr 2025 10:30:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: Region aware RDT options for resctrl
To: "Luck, Tony" <tony.luck@intel.com>, Fenghua Yu <fenghuay@nvidia.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, Peter Newman
	<peternewman@google.com>, James Morse <james.morse@arm.com>, Babu Moger
	<babu.moger@amd.com>, Drew Fustini <dfustini@baylibre.com>, Dave Martin
	<Dave.Martin@arm.com>, Anil Keshavamurthy <anil.s.keshavamurthy@intel.com>
CC: <linux-kernel@vger.kernel.org>
References: <Z_mBcnAcGzMMvfxV@agluck-desk3> <Z_mB-gmQe_LR4FWP@agluck-desk3>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <Z_mB-gmQe_LR4FWP@agluck-desk3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0172.namprd04.prod.outlook.com
 (2603:10b6:303:85::27) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH0PR11MB5015:EE_
X-MS-Office365-Filtering-Correlation-Id: b79e7ff0-ed19-449c-f8ec-08dd7b7a078d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTcyczdaRUNZUXh4WDdzc083cWh3RmFPdUxyNjBMOEE3WldxMk1XaExwRXBj?=
 =?utf-8?B?YWF6dmI1OHRna08vMTM5VXBFcjVSSTY2a3BQNFRQYzhJWG9HdmVkS09LSVBN?=
 =?utf-8?B?Zk1vNGZFdUUxazdGdTZncllIVlJmZ0NOYThFWjJmNlhiS0lONEx0V3ZiR3Jl?=
 =?utf-8?B?WHBkbSt0RGFYQnNDSC9DY0E2cUNsOTBkbU5lV1QrWkZlVUFGSmV6WXdRZUxY?=
 =?utf-8?B?b3JNSGV6bk9wK0pCRGVvUkZXOHlJek5MRkdHcVdqRVN1T08yWlViQTl3SWxW?=
 =?utf-8?B?TUttOU45cFpnQWJGSXFaWXV2U3EyNFI0bDU4c2MwdlVCVU55SEJDdlNnOHI5?=
 =?utf-8?B?RktuSkZrOVV3WkdQbWF0ZittZGR2MExPOVpiNmVrMzNaSzhpcGo1TW43WEtF?=
 =?utf-8?B?ZzdyWTJYR1dSL20wbzY3c05maytvbFkxS2htUHM3YTVsQ05Od1hxOVFYclZY?=
 =?utf-8?B?STlwM2FKMDR4TjFPTVg0NFduNjF2eVdKTFE2N21pVDR2Ly93RG1NYTJkWHFm?=
 =?utf-8?B?MWhMMS8yU1ZmQlF1SjhIVzFmd2pHUnlBYlp3UGI2Z2VwaXRyQ1QwSHExN01D?=
 =?utf-8?B?cDRPVjFTNm55Y1Z0QzFpUHVhNmdURWszWXBtaDQ4UHgxdXJ2eDRTRWpQTXFT?=
 =?utf-8?B?S0FUTXVjZmNEKzdaVFROZFVPd3JVektRbHB1OTZXNmRISTNlOXR6cHpwbi9x?=
 =?utf-8?B?MkVlaDhxM2VpbUNvSWFBemVkS0tOS2FZQnFsVU1EVEl2MTBjNjFEZDdnbkp4?=
 =?utf-8?B?Qi9DZUd4TEU0MUhBdGtBSWpVakhZcEdscGNKWU1DTnVrT2xVSTBaYzExUHcr?=
 =?utf-8?B?MlhFMGh4KzlYRkdGYkJYT3RBdERIRGxTQWFkd01vaXB4Q3lJWGs4ZU9lc1NW?=
 =?utf-8?B?dFJ6dEVaaEVnMVoyaWJCOFluSm5wTUNDTE01UlZuWjIybk1pU0oxMDJPSlJv?=
 =?utf-8?B?V0lTZHZLV3ByaEdSU2U3em9qeS9udGhtL1R1Z09KNWlQc2FvekdHMmRPN01P?=
 =?utf-8?B?cHZYZzBFNUIyLzc3WlhQVmJxdW9meWRUdUlpdHdCWkwxejhzVHR2a3NEUFFr?=
 =?utf-8?B?NWt6Wm83YVJjZjE2SmFpZmlHd3UzamJuQ1ZWV3hhbzJ4Nk9qNDBkc1NVcEtX?=
 =?utf-8?B?dVNocyt5YUVGZEgwV2JlczRFV1JkaDdlZUF2R09EYm9zcmIycGpMUGlJR3Yv?=
 =?utf-8?B?M3Y0eXNxMkkzVUNTdGtoTCtjWFVrS0tTYkpvNWMyT3ZodStmTnAzVXNQOW1G?=
 =?utf-8?B?aExqL3A0ang0cFNIYno2dm95UTFEY3QxL1FTZlNPRmNVUVFDSjdKNDZUcDlh?=
 =?utf-8?B?UzMxNDBjM3dLa1owQkZ0V0kya05aU2g1U1F2MHBTbWlLd0RUTnAxdlJxVXFF?=
 =?utf-8?B?bmExclVnNHR0S2xLOFhud0I1VUVMc2hldUExcTZLSzUxRFh3bWNSU0RncUJ1?=
 =?utf-8?B?V0NhaENjOW0wZWtkdkNtMmVzSHdnbG9XZDhta0s0ZEFJZTdnaXpSZ2h5RDU5?=
 =?utf-8?B?VW92OWtrUjAxV0lOaC9kMFR6Zk4yVm1DMnAwZ3h0R01sQ0hLTlczSnhUZHk0?=
 =?utf-8?B?cjRWOUJubXFyMmNrcjBORHFkVlR5TmRxWmdHeGZBcUp5MlBpdVRMRHpYUnNQ?=
 =?utf-8?B?TWoxRUlBbkRjUmxnbitycUMyRndiTFpDMXIzZEIwdFY0THEwbnowMFg1VjYv?=
 =?utf-8?B?WklLUmNVeFlOQUVQaFJhbWQveVk0SVJlSk9vc0xkWitGN1BxMVBNRG5kTDht?=
 =?utf-8?B?VUZnUWF5VHRHdllZTlhVSFRvTlU1VlVjdHJBTmFPNU43Qmo1bGcrT3h2T0Ja?=
 =?utf-8?B?a3FZUjN1MDMxY0ZwSk9iOEZ4bElKWFVsYjBweWZGQnBDNDFyL2hNVnM0d3NQ?=
 =?utf-8?B?ZkJFNXQ2V2ZXdmpmT0xOVkVYbGpuRVQvTnd6RXhycElna0hnODdiZ21IYjVs?=
 =?utf-8?B?bUhRRVZzYjhLQ2FTTTJLSmNVeDlPQk15aXlXa01hVW83SmVsZkJTQUtxenY0?=
 =?utf-8?B?Q1A5clRHSHN3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SW1EM0pjRkZGSm0yTCtkcTZ6ZkZlRE82SHFzTHRDczc2SzNuYkRTaTU2SURQ?=
 =?utf-8?B?cjk0clpSQTRBa2pkUGkwOE05VTRrOEhEcVE3NjlrcjlHa0FnbWJsYTZXdGY0?=
 =?utf-8?B?RndhcVpGUzNTVUlQSFg2ZDFDVTFDRHBWQzdadHZubjFnaGFiUTQ1cDcwUlEv?=
 =?utf-8?B?TzZpbGg3YUdVN0RBYmFFbTgwYUZYQUVTRzR1dm5temhFK0FYdDRtSzZpVnQ5?=
 =?utf-8?B?RHZkeTlyK2R4YzFDMlR5WjhnTjg5RS9uc2U3OHFUOHFWYzlieDZFZlgzT0I3?=
 =?utf-8?B?cE1HS0ttYmRxUEpGcmtWaXVYd21mOHNXYUJraUxLL0VkSEw1eE1JejBubmRj?=
 =?utf-8?B?U0NyQXlwVzBneXZSTm9zRmhhVU9VR3JBUnFsajROQjJmL1hxUDZHdC9ST0pp?=
 =?utf-8?B?N2VzMjdhdG1Rb3VzRHJCSmkxVWROMDZOdXZCS0owZU53OWRSTjVLbHE1dmJR?=
 =?utf-8?B?R25PYXp2Y3V3a1ZxL2lhNlc4WXE3T2pKOVpjS1ZtbUFiZDYzb09NUU8rTmR4?=
 =?utf-8?B?U21TSmNNNXJ6Y3lERkNaOWk5cVpLQWVSYzFxUkZqL1NvOGlEcy9XZkxEQkY0?=
 =?utf-8?B?d3E3dXRsSW1URTZtWXBTTWMwTUljNHJKVUhXdE1nei84ZVF2SUdDVjJRNVRL?=
 =?utf-8?B?MlVLQVNQRnc3WW1RSGtpbGRjQ3NUWi9CWFI0YmpjcUhvTHAvc2xzUjU1ZlJ6?=
 =?utf-8?B?UllmTUFSTGwrTDdpTGtQK0pkaTZjcWoxNUMrakszeTZVdU1IdFIxS3lqSjFW?=
 =?utf-8?B?MHYwMkNPeHdUQ0FWTHBiMkxDS001WFIrTURwN2ZPY1ZyL0tFd3BXNmZQVHE2?=
 =?utf-8?B?dmJ6blg1WjNQUEhkejBUZTZmeVBkMVRMV29DdlpBcURZOG5IZDJDTEkyMmVm?=
 =?utf-8?B?a0xuTUFGanZpZEVNQjh0ZHByeFRybytaTnpDUnBRZlNNR2lqamIzb1FDNXJD?=
 =?utf-8?B?US9VNFdNWGZXS1FjeXRacythMGNuUlp0TmV0ZVRJUVhIRGg3WlJlbHRkZURx?=
 =?utf-8?B?azVHRFRWbExMbC9CRVpLbGo0R0ZqSGFpTjZ1bkZYbXNjcXpPYmE0eVNad1g4?=
 =?utf-8?B?M01ES0tRbVNwSEVlNThFRXVOQWMybDJGWSswZDBTNGc0WTgydS9MbkN6TzJq?=
 =?utf-8?B?Tit2RTk0cXFmdnZQOFhYUFJNZVJHR1hqZXNYdW1QbFE2MU9NRm5GZm0veEw3?=
 =?utf-8?B?TFFqZXoxT1hVdWFPZkEyVzYya3cxZW5mdFBEVWwvZk9FMkxDdWdQNFV4bE5Z?=
 =?utf-8?B?OTBBcmcvYWhiNFdENUJBa1dqVXpIYzliM0xqSloxc2VJSkJxL254TksrQ1ZZ?=
 =?utf-8?B?SC9DcVFZWXdFOGdsSFVQRENPNVUvWUVmSFl2a2RsV1EwU2Y0R0hINGo2NzJ0?=
 =?utf-8?B?dFZQTjJROVZVK21YRm1ERlhHSmdqNVVSK2k3aWhmRlhtd1JxUVQ2QXJneStE?=
 =?utf-8?B?blA1Ris3OGJIaEt2RlpSSCt5eUw4ZHpQWWhOb0t3MStJNkl3UFI0aDEzOWVl?=
 =?utf-8?B?a1M2L0prbjBjKzFEWGlrVkc1R0lPSDQwZ0plczNqNExRTlphTUt3MnVKQk1x?=
 =?utf-8?B?Q3hCTDZqSXE3WHlQbTZTQitVeVRnTVJKY1FUci85YWorcloralB3LzVLRlNH?=
 =?utf-8?B?VGIweUpkNnZjZ2pUenhicjIrcmtOOUpxdU1HODB2VFRHN2hFdm9ZOWVHMkpx?=
 =?utf-8?B?VEtSSklRYVQwL3BkdVNsb00zYU1XN0NBekx6WjNvWVg0OXIybHNvckg3ajlU?=
 =?utf-8?B?ZEdpTHhDMW5iWWdvTTF0d3NwNlZBUmxKQnpoRnNRR2lINWxxSmhnNTRYUmN0?=
 =?utf-8?B?Z0lxYlMrSHVOY011VHBXR0dLWEN0VndWd2laTFYwcVd2aW1XTXRPbmJLN2xx?=
 =?utf-8?B?UUJSVnJ2TGp1dStmY2VKcW95ZlVjT281Rk1id0ZpTjA5V0t1WGNlL09UNG1w?=
 =?utf-8?B?RWVSZ0NZVEZ0K1hUMUxQNE1Ub3l4SFJQQzZxUHh5WkJVTGVmNnY0Nys1VDJm?=
 =?utf-8?B?OXVKaUVKVGwyQWZ4TnhqZU83aXlSanFXSUdJQTlBUG01N2RnaS9idmJLcUh2?=
 =?utf-8?B?aXJBVnhUQU95LzNvNG5lSHZJS3EzaEVvWnZkdXU4cDRVcWJJU0lJSmNxdjdz?=
 =?utf-8?B?Yk4xZzdRMzZuMEhZWEtGME9pMS82eEpPbzJKVmhyL09nYmhDN0p0N0hGUkx3?=
 =?utf-8?B?VGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b79e7ff0-ed19-449c-f8ec-08dd7b7a078d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 17:30:20.1119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VNxFeKcsM0SruiBvSK8EwbrWd6Rf5FbY8OztLvzXhSU4xxHCvvWaoUqDqCuoDmhOEtLCAgmhaNfzR1Oiwnd1YkS5RbIX1Fh55HCRZDHTLhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5015
X-OriginatorOrg: intel.com

Hi Tony,

Could you please help clarify how memory regions should be viewed?

On 4/11/25 1:56 PM, Luck, Tony wrote:
> On Fri, Apr 11, 2025 at 01:54:12PM -0700, Luck, Tony wrote:
> 
> Add Cc: lkml
> 
>> A future CPU from Intel will implement "region aware" memory bandwidth
>> monitoring and bandwidth allocation. This will provide for more granular
>> monitoring and control for heterogeneous memory configurations. BIOS
>> will populate an ACPI table that describes which system physical address
>> ranges belong to each region. E.g. for a two socket system with both
>> DDR and CXL memory regions could be assigned like this:
>>
>> Region 0: Local DDR
>> Region 1: Remote DDR
>> Region 2: Local CXL
>> Region 3: Remote CXL

If considering an assignment like above ...

...

>> Option 1: Per-memory regions might be described individually like this:
>>
>> 	$ cat schemata
>> 	RMB0:0=100;1=100
>> 	RMB1:0=75;1=75
>> 	RMB2:0=25;1=25
>>

... I assume "RMB0" represents "Region 0" and so forth. In this case, what do
the "domain IDs" used in above option represent?

Thank you.

Reinette
