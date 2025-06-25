Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91F51C4A2D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750838562; cv=fail; b=IXDNLEhXAB8hW/JsJ5U5zc/t7nBSlrno8e2L6HSMlpkzMP3os/2sqgbMGZIb9x8TXH8wN5Vdf/1Iz7dqNPjnfPj4D2n01Msqp8Aq1mmcueiTGlNIqjqwf3RiC01sg9oi418nT5DWAukUHELbUQX64gcrDjqDVeH7Cpbqo3Uw6Rc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750838562; c=relaxed/simple;
	bh=5aqRru82GCHJQAa2Eoi92IRlAROicX09cXbOvKd1Los=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RydxgXqOuy3WFxrGiC8ty8VMoZ4r3JKlRxSgpoR4pz6jyFbUWWDaZDSEB9MFl3hQYPlpACynCZoSouTE8jCVApUbRHHD7MSwFt3FX+mNDmD1XQ5VwUnnbgm587DtkT/L2l/RywKXLBm6hZqdM4kSh9eJbSHRMwHMpc6MUxekShA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsX8yoiu; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsX8yoiu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750838561; x=1782374561;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5aqRru82GCHJQAa2Eoi92IRlAROicX09cXbOvKd1Los=;
  b=jsX8yoiuIjX7j25m5MBFPdMZtq4ObZYd1rU+fjIUHtI3Hz4QnqkgXo/Y
   KyHarVyFblQiLpkJqBFsd/sLyQwuuh7SVIe0QwR3aW9rLFsZB/pHBbVuU
   Up3Jsuc2a4oYaMkHOkBpDDK3g3c/wE4vrzlgJPao7ZtDHLcjeIVrmL/Rw
   rH3ibD3WIOUhv21tzrZz9cYgUi2WMN4q8rs/gJUVVQFW5FHgYyDWpc4bm
   wEja8/VWsQLdFowgB2rnYOa2JhTqOon5PTTQJvBX1X9JTML9K2J72tAJr
   hQiHCjIVpOJRqsobNdCVqqOet+obbGw1J3pLW8cYfwaGiPSIyEUUXhSb6
   w==;
X-CSE-ConnectionGUID: +O+SDzCiTqOt6M6wLPQXog==
X-CSE-MsgGUID: w0BWdDySQe+nncbME1DBgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56882687"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="56882687"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 01:02:40 -0700
X-CSE-ConnectionGUID: 1jdAZVrtSsmzk3X8qs66LA==
X-CSE-MsgGUID: UPw+4gARSiudNZmjxkAejQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="151755891"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 01:02:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 01:02:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 01:02:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.84)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 01:02:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LdPjnVjQYXsyK+f+a8jDbPpL1VKkTt9faHL8pUZ0QJhyLR4HhHNh/gFagAYHoLDYYmknEdwZuxTENnWtwfM/BYF+KZhzFRUd6HPNCWCyCNehokDqfqUpNT1ces9DGiDfvVr2BHvTFTt2r67VrZg4pGm0jZAx6Dm2LNRmLyQOS6YVGzTgyZV09hCMNmnKu12EmJtyPcJMfIS8T6fUFuA73WElNGfHvGdQtuHmERAJa27ap202slGsCG0+Ba5PeVjduUHpU+t6ykacRcpRl8N4fBzD3BA7K8VUYbT/TsLNFkqJgh/htpvX1/GUTZsv8dwhGdpBA39RvmeOs5BE2S64yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aqRru82GCHJQAa2Eoi92IRlAROicX09cXbOvKd1Los=;
 b=uFk6WKbJgTNexcSBs7e5paZChdZg8NYsNwZ2tm56+QEQRqW7bWxkvKjz7SS0jxQSace2xwflygnyUVpygSuPeRiKvEEPPgNbTU+qKIyGo0WhSqllt++Q7a0fTA5REE6ingMTiF0+F8BPabnenYCz06mxEU4s8dk0C6SMgYbdJ66SYYjcMOh8+kp69IrljEUWwldbzbCvCySs8nHl6pr4wi1HgfLXFmA+H39MVmJo/IIlUzGiz54+3PrXATUzIjjidHVEepaZsfKQ+YTMWPRgtF6DVSpmMgdONpzTSHJoR7cKr92gdVQRzCP0gfCb5IuvY36BCwYBCg+LYj0IgQHoug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by CY5PR11MB6487.namprd11.prod.outlook.com (2603:10b6:930:31::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 08:02:10 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 08:02:10 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Hans de Goede <hansg@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Stanislaw Gruszka
	<stanislaw.gruszka@linux.intel.com>
CC: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 04/10] mei: vsc: Use vsc_tp_remove() as shutdown handler
Thread-Topic: [PATCH 04/10] mei: vsc: Use vsc_tp_remove() as shutdown handler
Thread-Index: AQHb5Bv78ClZQmAhCUO/VFIPc+punbQThpkA
Date: Wed, 25 Jun 2025 08:02:10 +0000
Message-ID: <CY5PR11MB63668BA13FD499C2043DB9CCED7BA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250623085052.12347-1-hansg@kernel.org>
 <20250623085052.12347-5-hansg@kernel.org>
In-Reply-To: <20250623085052.12347-5-hansg@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|CY5PR11MB6487:EE_
x-ms-office365-filtering-correlation-id: a19d82b8-e592-41dc-901f-08ddb3be9692
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eFc4RmQ1dE5TL1VjS2w4Ry8zZjJRNmRxTWh5d2VSQkJ3T3E2UE5ubXVKMjZP?=
 =?utf-8?B?Q3NrWURyVjBNQUdlVWZqSklud2JFTldjNlhFcDh5eTZRRWNPUnd3c28rd2Nh?=
 =?utf-8?B?RnhpTVZCSmNKWTRkRnJ5OWF5akJEMTg5TGUzTk9ncG1iQ0lzcjFWRDN1TGph?=
 =?utf-8?B?Rnk0T3ZKL1NjMWJhTVpidFA5TnZ5ZmNkRitPTjUwTFBRRXA0NEsvNGhhYnF4?=
 =?utf-8?B?enZqVS9RdHNBcUQvdi8vMVlXUFRxcXNrRCs2clY1STVuUGp2LzlCaGhnTklN?=
 =?utf-8?B?UUorcm1sTWp5SnFZN3dNbCtDbzg5NzNTblBUcmw5QllZVXVUY0JYWGVTekdB?=
 =?utf-8?B?RThJeTBTamErRVJXMzg4cW4vQWlCL3Z2QUZhNWhMNHhzTzN5Qm52QmNkVGVN?=
 =?utf-8?B?L2EwNVhRMjN3VEJBZTF3V084Mi92STRhWFdKSFYvTHNPMVNHSHZnNDYvTUVR?=
 =?utf-8?B?M1RIS2d3NU9MaDJOazltcitOb3V3ZWVSMmt3WkdvdlZSdGRQUy9WcFA3clR2?=
 =?utf-8?B?aFdtTHdHYkZpaEJ2enh5MEJGUjQwZ1BIYVN1d0hMZ1phL0djZmRYclovbWlN?=
 =?utf-8?B?VGxnVmg1U0JiU2hjaHZmMEJtL2pGUStiVXovTFJLZkI5dTZ3MWdvZG0vbGtq?=
 =?utf-8?B?Rk5xZGVSL0pWNDdKZW9Ha1V0dWZFSkU3VjFJT3VtdXREbTZBd3pSaG5sMi9W?=
 =?utf-8?B?WW5uZGU0ZUtpclNXZGNOaVNEeGxiQ2RIcEtWMXRaaDlrY3luYXBhWkh2amI1?=
 =?utf-8?B?Uy9MeVJUa1I5ZnEzYUFWN1l4U2txSDltS2pENXZpeXhxeXJZZkRtU0JzZFBK?=
 =?utf-8?B?Zk51ZVY5eWtBZFUzSUdVZDEwN2xVWmswakNuTWl1SFJzaExsM1MxZEczQ2Rp?=
 =?utf-8?B?TnAwMS9kWUlWb2VpeE5raUtNTVFqaXIxR3pRSUFpL0t2TDhLcVh5L0NINnBH?=
 =?utf-8?B?NTF0dEIyWWFqNFptTEhYMmc4dkhCcHVWWUIrNFd5bkxENXQySjRuRWVlTWhT?=
 =?utf-8?B?OVRialRTZnJoSDJsckF1Q3hjZkY2SFFCRHl1cW55TU5VenZ4ZkpQWWx3RkNy?=
 =?utf-8?B?VldDMkZMM09WaGVuc2Y3SlFWMjZjZytITTNSK2xZZ1FIcmZad1BDdnlFdi9k?=
 =?utf-8?B?U2I2cGV1UHZ0SzhXZEZ2RllXVjlDb01VZ2tyVEQrQ1ZDWjZCUWllNVBwWHo1?=
 =?utf-8?B?YURDTE5vK1J5M2lZaGpEZFlVUGxUVVY4T0JTaUVVaG9SMkQ2SStaMWNpL1V4?=
 =?utf-8?B?RGpNR0xVTDlwYnI2WFh1RkliNVAzY0pKcSt0d05BQjRCZjY5Sy83RVVXa0pF?=
 =?utf-8?B?K0ZRQThTdFJLRjhyYVFad1lKaVY3aG1ZNXc5T0FiRm9BeVpzY05kcXhrQWMr?=
 =?utf-8?B?aGNxSU5iOXhtOGZaSTNneTRCZFRoSDVNUVp2QTVaQ2VEeE1zQzd5a0hHZExs?=
 =?utf-8?B?UFdPSHMwa1N1ZjROam5TVGh1TnNOdUdHTTFjVDFlalpVWDNyS3J3VWdCaEdl?=
 =?utf-8?B?Rm9QQjFrSkhnWk4rdC8ySmczMXdRMTBrM00vcVdRRXo3Q3VNcHE2clBRbE9X?=
 =?utf-8?B?NlVMdGdVUjVNY1JENUpFQmxJWVlLZGlqUWx3YlFPbmtpR3Z0VEpWaWtpRGNF?=
 =?utf-8?B?ZzhQM1RkWnA1alRvZklueFpNZTBpQ2RnUko5NHJ4eVRHOURnNUNkc29TVHhm?=
 =?utf-8?B?NG5Veit3R2RLaUJqYTU2bUhsMjZKdmpvamxlTHhVSWUyS3VSQjVMY3hMc2Fx?=
 =?utf-8?B?N09xeU5RejdMYVZSazNOS2h0L2h2RHdpQkZ3eUJRemEyMWY5c2VkNERCbTdS?=
 =?utf-8?B?SXhQMFRjNHZ5NFMrZmppcFpzeVlITWx3SElURmFqRlZjZ0dUSlFzbWVOZ3dP?=
 =?utf-8?B?LzNqcjRqZ0FLRjd3T3IrK0UzR0xjN1k1eU9PdTQrNTBDbFpSS2paRXp4RWND?=
 =?utf-8?B?MjlTYmZ3VmNFR2tocHBnVGdRNXdDc3pIUTNXazdxR09UdFNPQmcvR3NrT3RS?=
 =?utf-8?Q?xpZKT5vVTQCw5M1tJCEnPa51+Q0AqM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3dEeHhuTGszazZBSGVIbkhMYzZSZXBpNmxLRU0zYndnS0xzRWZMdVJjVjcr?=
 =?utf-8?B?bHJUUjcwZ1JOU284MExrRVVEejRzbE16OXdMUWd2bVMwQ3ViMFB2ekltY3Ns?=
 =?utf-8?B?bTEzRjM0RWZEa1QzQytuUmhheE1LdExraWVuaGxIMzc3ZlhOUmxuVHBPZTRw?=
 =?utf-8?B?cmZUcnIza2RFSXpoREh1bHovMG9Xa3ZudWl2MnpTTVQ3alhvMlJUY0NYekZv?=
 =?utf-8?B?eTV1U2IrU3A5VGYzT0twaHNWa29zQUcvbk1vMVRVcmpiV3hjS0dmSkhpa0lI?=
 =?utf-8?B?Nk1uOGt2VHNxZWFVdmJ2NWE3UmwxWUdLVTdDaXg0aVhUNVVKRzRTSjJUYnE5?=
 =?utf-8?B?d2pqZzV0WWNqRVc1UHptREF4M0swQnNYM1lXTldGbUdTQk05YzFmZlExWTVH?=
 =?utf-8?B?QzhERVRrdHJDYUN4ZDlsendCelBjYmV6Z2JLRE95NHVlL3VySGkzTy94bTVr?=
 =?utf-8?B?WW8vMHhVb2tSVHBZYVNFMFgvWFh3MzUvN2lZeUlERnNFa09zUXlkcDZSbWRw?=
 =?utf-8?B?WCs2Y2E4eEpreVdLMHJsSUlUdGxPQTBJSXkrYXNyeDFWekUxcEVCUW5mM1VJ?=
 =?utf-8?B?cUFLT2tzY2t1b2VUbDd0TjkrUWlBZ0daS1UySjJaSHI4L240UVdVRm5kMWhm?=
 =?utf-8?B?SlQ5UGlOeWVKcjQ1NEhZNlcvanZsRHdScnVLdS9ZdlhXU3ZKOEsyYndLclA5?=
 =?utf-8?B?NDdPL0FuL1RHbXpPejNZNlFZQjB6dE1SYkk5MjkyanNMcmd4RnVPdDcwRG1Y?=
 =?utf-8?B?aFl0QWdGOU9oSGZXSzludWp1NEZ6YSs5OWV1bktuSmpUYTAyWUFSYkpsMUts?=
 =?utf-8?B?Q1gzT1p1Q1JvOTRiYmxCR0dLZEZ4dDVCZ2VMOHJkTDdUbyt6RFVJYktjMU5D?=
 =?utf-8?B?bnkzSU1sUk1WU0dBSVlNZFFxVVZHMEZRY0dGelJWUGJqZ2paVmF6WDQ5MEds?=
 =?utf-8?B?UkYyQUhuL0hZSTRBbXkrcTI1eXBOM1M0MGp5cTB3ejQ0bkYxTFpNVWZhUEVm?=
 =?utf-8?B?WTBiTXhkTVE3MjczbjE0K1oyUHVrbElGWHlJMWwvdmgwcVp5dU95SVJXWlVl?=
 =?utf-8?B?bGpYZ3JGMG5ISVNmZkVkSDA1YXpiZ3JZQ2F1V3BoUTNaMmc5VG9seFI4TW9Q?=
 =?utf-8?B?RFdmZ2tEQ1hxUS9zQ1E4MHFBeHA0OTRXS0tyTDJueFdCMmRiNzNFaTFodmlw?=
 =?utf-8?B?Z3ZFazg4dWJwZ3JwOGs2aHhzd2VWU3NNUzE0aFFpc2FDdG5xMjQvUHJzN1pS?=
 =?utf-8?B?a1ZLcytoRHJORUZxUEZOOTVIOUhnL1dGZTRFS3pndUFOc1B5ZHBKNThKOWhF?=
 =?utf-8?B?VnAwZnUwdCtSTWlNd3oySlNnaE42ZHhLZUNZUXBFZDlhM0tBUE1ZY1c3MDlV?=
 =?utf-8?B?dG83YUVGVU1odWEram92aCtkS0FxOTlxTDUrUERmNHIrNFMvMHdueXd2Q2dl?=
 =?utf-8?B?dStmRHg0c2dKNVpsdUQ5U3hoaWtjbmVKVXJNMVc1cnY0US9PcjZzVkVOVktO?=
 =?utf-8?B?ODNQNWVUMS8wd0xiTUc4dXVKOWJ2cnF1dloraUdTWjBzaGtzbklDSTFPVFlB?=
 =?utf-8?B?SEdVeTdFSzFsUW9tOUhiZEFXUzJLd1k4MEtjMVNiRkY2M2x0UTFkSittTFFv?=
 =?utf-8?B?RUFqdzFPSVJCTmZFRXlyY2J2NjFsTk03bVJnZmJNZXVXcHpneFZwRDhxK3hK?=
 =?utf-8?B?Y29NMFJidDdIZW5SZzBoVXNPN29pbzVlbERDVUtpbVRVck1mMlVVRWdUcDBU?=
 =?utf-8?B?bzY2VFEwQnJ6ZzVPa0czSW1KblJTMUI2NG1pTnZ1OEs1TkNqKzV1eXNxRm5y?=
 =?utf-8?B?eU9majlpR3M5d3kxS0tPV0kyVjl2UFQ2YnVRV2IvTTdLRDNjaTBIYndGWTd4?=
 =?utf-8?B?bURtNFBQdUdXamtjKzg2dExjQkgwSEJCbTFRcVpLcklKZVB0VElIaDdDLzMz?=
 =?utf-8?B?MkN3TEVpVkFnYkgrTVMzT3phT2NaclRNaE1USlFyVkhaemZRZWRYUUc4M3ox?=
 =?utf-8?B?L1NMUVdJaXA2aDlwakt5RVpES2dnRzhDRGd0dllQaVJ6cDhUeGxxK1E5UUp2?=
 =?utf-8?B?NVE1L1dlWS9nTzFDNlVua1daYVZKMXU5QmgxZWFNWC9TUkk0cGRGOGNsQ3Ar?=
 =?utf-8?Q?/0s5yXtCxHV0qGWPlOhhFPL0i?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a19d82b8-e592-41dc-901f-08ddb3be9692
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 08:02:10.7617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y40oKE2wHGBjnizH32SC67XfQgyGRBwFrbMtYBPKw8zLxMdTL2B+lQpBE9qKbrY2OySobTSx7Ood5VHEYlIjw5NpwcmkeZnKPS6++zqG0qo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6487
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBbUEFUQ0ggMDQvMTBdIG1laTogdnNjOiBVc2UgdnNjX3RwX3JlbW92ZSgpIGFz
IHNodXRkb3duIGhhbmRsZXINCj4gDQo+IEFmdGVyIHJlbW92aW5nIHRoZSB2c2NfdHBfcmVzZXQo
KSBjYWxsIGZyb20gdnNjX3RwX3NodXRkb3duKCkgaXQgaXMgbm93DQo+IGlkZW50aWNhbCB0byB2
c2NfdHBfcmVtb3ZlKCkuDQo+IA0KPiBVc2UgdnNjX3RwX3JlbW92ZSgpIGFzIHNodXRkb3duIGhh
bmRsZXIgYW5kIHJlbW92ZSB2c2NfdHBfc2h1dGRvd24oKS4NCj4gDQoNClJldmlld2VkLWJ5OiBB
bGV4YW5kZXIgVXN5c2tpbiA8YWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tPg0KDQo+IFNpZ25l
ZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhhbnNnQGtlcm5lbC5vcmc+DQo+IC0tLQ0KPiAgZHJp
dmVycy9taXNjL21laS92c2MtdHAuYyB8IDE0ICsrLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL21pc2MvbWVpL3ZzYy10cC5jIGIvZHJpdmVycy9taXNjL21laS92c2MtdHAuYw0K
PiBpbmRleCA0YTI2MmUyMTE3ZTQuLmY1NDM4YTYwMDQzMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9taXNjL21laS92c2MtdHAuYw0KPiArKysgYi9kcml2ZXJzL21pc2MvbWVpL3ZzYy10cC5jDQo+
IEBAIC01MjgsNiArNTI4LDcgQEAgc3RhdGljIGludCB2c2NfdHBfcHJvYmUoc3RydWN0IHNwaV9k
ZXZpY2UgKnNwaSkNCj4gIAlyZXR1cm4gcmV0Ow0KPiAgfQ0KPiANCj4gKy8qIE5vdGUgdGhpcyBp
cyBhbHNvIHVzZWQgZm9yIHNodXRkb3duICovDQo+ICBzdGF0aWMgdm9pZCB2c2NfdHBfcmVtb3Zl
KHN0cnVjdCBzcGlfZGV2aWNlICpzcGkpDQo+ICB7DQo+ICAJc3RydWN0IHZzY190cCAqdHAgPSBz
cGlfZ2V0X2RydmRhdGEoc3BpKTsNCj4gQEAgLTUzOSwxNyArNTQwLDYgQEAgc3RhdGljIHZvaWQg
dnNjX3RwX3JlbW92ZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQ0KPiAgCWZyZWVfaXJxKHNwaS0+
aXJxLCB0cCk7DQo+ICB9DQo+IA0KPiAtc3RhdGljIHZvaWQgdnNjX3RwX3NodXRkb3duKHN0cnVj
dCBzcGlfZGV2aWNlICpzcGkpDQo+IC17DQo+IC0Jc3RydWN0IHZzY190cCAqdHAgPSBzcGlfZ2V0
X2RydmRhdGEoc3BpKTsNCj4gLQ0KPiAtCXBsYXRmb3JtX2RldmljZV91bnJlZ2lzdGVyKHRwLT5w
ZGV2KTsNCj4gLQ0KPiAtCW11dGV4X2Rlc3Ryb3koJnRwLT5tdXRleCk7DQo+IC0NCj4gLQlmcmVl
X2lycShzcGktPmlycSwgdHApOw0KPiAtfQ0KPiAtDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGFj
cGlfZGV2aWNlX2lkIHZzY190cF9hY3BpX2lkc1tdID0gew0KPiAgCXsgIklOVEMxMDA5IiB9LCAv
KiBSYXB0b3IgTGFrZSAqLw0KPiAgCXsgIklOVEMxMDU4IiB9LCAvKiBUaWdlciBMYWtlICovDQo+
IEBAIC01NjIsNyArNTUyLDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShhY3BpLCB2c2NfdHBfYWNw
aV9pZHMpOw0KPiAgc3RhdGljIHN0cnVjdCBzcGlfZHJpdmVyIHZzY190cF9kcml2ZXIgPSB7DQo+
ICAJLnByb2JlID0gdnNjX3RwX3Byb2JlLA0KPiAgCS5yZW1vdmUgPSB2c2NfdHBfcmVtb3ZlLA0K
PiAtCS5zaHV0ZG93biA9IHZzY190cF9zaHV0ZG93biwNCj4gKwkuc2h1dGRvd24gPSB2c2NfdHBf
cmVtb3ZlLA0KPiAgCS5kcml2ZXIgPSB7DQo+ICAJCS5uYW1lID0gInZzYy10cCIsDQo+ICAJCS5h
Y3BpX21hdGNoX3RhYmxlID0gdnNjX3RwX2FjcGlfaWRzLA0KPiAtLQ0KPiAyLjQ5LjANCg0K
