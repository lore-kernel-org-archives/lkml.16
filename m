Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4B3610B
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 22:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748556120; cv=fail; b=sAs8Wzt0cdamvj6lukxi43YwDDf7BDxb+tYTMZC6Gr5NfYLhiMQc9N4rwzEwGfsj0jsDKrt/SiRvUYCOBCwkcUS1v98uN3kL2pXlBJyr8MojGbIPyVNfQ/JfNByeqa3TyOBedt6vzbOfKXEYWmkj6RrH2s+RYPzkhjQcaiQK7Iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748556120; c=relaxed/simple;
	bh=J3XiSK/7/YuTFf7f3vs3bsIKeye3Go4uuxaPV6f2Mbc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H/d9IlKySlJnvu4f9FSEOHtaNtMFZ1NJYGRN6GuiG7zyHH24NO/z6VUO4RsIrNGWO+s7Xz3dfD+C+mdN/8eZmUcHbFeDwPbD2s3cUEOVFudc9udpUm8DKd3RXegido2EJ4Y4kWXVTTdCjXfZzbwgBz0vFjxfP41G2LQOrPSsEn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VDfydZ+d; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VDfydZ+d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748556118; x=1780092118;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=J3XiSK/7/YuTFf7f3vs3bsIKeye3Go4uuxaPV6f2Mbc=;
  b=VDfydZ+duCHZz8qyTVODBDNUxd1bC6l3GJE5yufT2EF6HdwIOM1tlrDP
   UCKo8bUNQD/0Pk3c526zRfT2CexzH78C1LCHJWad3R4AW1manZdio1Zto
   i/vuwCJqPPjnVh8lt8aoCh1Gav8keIv7AZqu+NxrueIMJDFBa7DnOsBUc
   an4+6RSVv63b987EinCDWZwwAdbS002kb2yRlTuLrBUY+PNLmBksLtR6E
   RAX1yKQ9JhFbyMF46YKggyJthUaZTBYLeccM56lJJm12KPjyXt5FTC56t
   gaEsU1AYrPxg+bia35Ie0NMF4xhvDz0MEOWfBOwUs2tez7Dfy4uiFI5io
   A==;
X-CSE-ConnectionGUID: uZGok9wZQAqn0ntrIr3bjw==
X-CSE-MsgGUID: 5wuxBoKTRJe8yy3T5tO85g==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="61269470"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="61269470"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 15:01:50 -0700
X-CSE-ConnectionGUID: UyDQKqJATc6yFZ/+miAVgw==
X-CSE-MsgGUID: yABG0IwaSQ6HMDwDQ0etUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="174683240"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 15:01:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 15:01:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 15:01:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.77)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 15:01:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O8ZWFhxCG8TZoPs/AbUNKcyKwMumaT8xyweKmbUKHmtcs0Rq8yudmRlNd1iQ/wopob56GuZMUsgadwFykXnepdXkaPEPIKjdlLzYpu405tlk9b6qFfwIpsQEiHARVC1hPnyQAVeBKulwDGgHehoWJjRSwa/KuA5TMoI26buLcyriw3OzPZVwpS1d4SsfB9bZRprFqgAqrmTfqSlWkSv0f85RDrTrlsw9KYOah5oXK3Wh5iubrmQOttMWsTzhG9YNcwhPfYR9Y1d91oxx1L4A5Zh2vTccdXiZQ6ky2RQntsIWTegRVHxW20BBcTZWuth+vppE95fZcSXXw6RfOk2XeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZ4/SrmCOxkHkLflh93TMjxZ3MFLmlmUwa6Kr6ai5OE=;
 b=A9xRXe53j+8XmkpeDMm99Lvqysl5MRgvwAfT/bcNXM82vb4WSnzdqr/9gIB8P0qBAAHxzxiLVt9DP/dhpL7Ak/3UqGCyCLO9UUT2JWFP2s+LztUSiljE6Ov1zQ3ouPJnjTlXKrMKO7NPUrTGBPAGu70QCREWz9mkgcwbzmMrk7YioHt9KUJ+qKFYyX2zdpePFWcRGOnwRV7G1Xvq6ZRUZk9r/JGwDZY5pv5B7iYv8CcDS0vmpxiPr1302nizfmHiPl2Pt+OQgI3xuueXt3/IKbA6tuxy2WrHXgumdlxAzsQ2Ba5Rm7bzujv04SWjOt1zPcbaD8R6RXGKmy3jHeVVJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CH2PR11MB8836.namprd11.prod.outlook.com (2603:10b6:610:283::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Thu, 29 May
 2025 22:01:42 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8769.021; Thu, 29 May 2025
 22:01:41 +0000
Message-ID: <44a4f211-6723-4fde-822c-d739fa2d603d@intel.com>
Date: Thu, 29 May 2025 15:01:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/resctrl: Restore the missing rdt_last_cmd_clear()
To: Zeng Heng <zengheng4@huawei.com>, <Dave.Martin@arm.com>, <bp@suse.de>,
	<tony.luck@intel.com>, <james.morse@arm.com>, <xiaochen.shen@intel.com>,
	<fenghua.yu@intel.com>
CC: <bobo.shaobowang@huawei.com>, <linux-kernel@vger.kernel.org>
References: <20250529113353.3275066-1-zengheng4@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20250529113353.3275066-1-zengheng4@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0217.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::12) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CH2PR11MB8836:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d049c1d-d244-441d-846f-08dd9efc64cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1NOcGdITnBIVGZXQWpobERjTHozMm1mUlZ6YVZEQno2blpyOWU5Y0pZbXhh?=
 =?utf-8?B?UnZkV2g4YWo3YkQ0V25POFZmUFNBN0NGUmVka0Z5QjVyVjhWU2s1OHg0L1VS?=
 =?utf-8?B?NHBIWXA4eGhMUTB3c1EyeTAvaVNMaE5wNHdZTEc5SlhrNHdvV2tOZlBXYURJ?=
 =?utf-8?B?dmkxdkJsTWdOQTJhYVdUblloU2dSdkczOXpKTHh3YzZhUG1Pa2wzTWR0WDh2?=
 =?utf-8?B?a2tHV1AvQmd5UUFGWk1MQTZsN1VzdklZWDM1bUJCNGtLOHJPZC9vYlZxalpN?=
 =?utf-8?B?WUxhZkkyczZQM1NrQ0Vyc0JMa2Y4WHlJMThaTWRYNndLV3BweHM2eU9yTDMy?=
 =?utf-8?B?UnJRUkNENFBqQ3B0TUtUYkszL05aOUt4cDROck1EY2o4bFRON1QyeGxTZExC?=
 =?utf-8?B?eFhBVkVEcDM2NXB4M1FUZ2xjLysxNC9XanF6ZWJSUy91anlubzYyVUpLTFVu?=
 =?utf-8?B?VUxzZzdpSHNLQ1BlUWtiOWZwQllTUHI5Y2tvMThObXg0Z0k4RXloM3B3UDZw?=
 =?utf-8?B?aGZSU2lvMUttZEF0THYyTU9HaWFheFF6b25OZm90dElMK3ZWTTJlK1VBa3ZX?=
 =?utf-8?B?WU5NKy9lblN4TE4vT09BZ2dvUWczNmcwTDUxZjJNbVBES0hhR1lCZWV5blhZ?=
 =?utf-8?B?TnY1Sy9xRks3aDk0dzVHVktRWk5aNFdXRy9sWTJMSlhFUE05Y2toTGRnZmlj?=
 =?utf-8?B?RWk2NGZVZCtRdHJQcUFiNFE0QlpPdjkyT1JkeE01bm82T0ZkcjU3blRlQWlt?=
 =?utf-8?B?bFdSWU45bzY5dVFTWEM4MlVJMm5KK2E4R0FpZnhoMm96bUcrWERvYmgrL0tY?=
 =?utf-8?B?ejNhU0tjR2hsZUhBalNBalYrUW9ZSk00UHNscEdMWnZXMjROZ1ZqeXE5U09N?=
 =?utf-8?B?d1c0V3F4L0p5NDdVQmRpVkdWNVk4UzZzRkFyYTYxei9pY3hsbTU1Z3h5REZK?=
 =?utf-8?B?ak5YYTRPcmQ5OXo2TUczdTBodzhYK0ZhNmFuTUxZMDZaWWhsRDBLVU1ucXla?=
 =?utf-8?B?em8vZnBWRGtWSkVKM2k3QlgzdEdxendmVG5RRjllMzMrZldjUnJTUGJmRU44?=
 =?utf-8?B?d0ViZnNOajdpNFVuaGZIMGE5R0RPbzJoZWVuRXo1RngzNXhKZW92UjRlbFVu?=
 =?utf-8?B?dmV2K2NVU3FUeDhmWkVZTS9UVXJHZ1pMNWZWRTNBYVdvZGRxYVU5SnoxaFB2?=
 =?utf-8?B?aVJsRThPakJsZ3FSYWRMd3BNZ24reTdTazBQTmFkV3JEVm5XeDFsaFZEaE5Q?=
 =?utf-8?B?cWluRlZwSE04Rk9TaVNrQkVtVU5HQ1hnb0VqcXUxVndiSUZ3bmFtVytBbkFZ?=
 =?utf-8?B?a0ZFM24wR2liSEpjS29IczJxemp4N0x2ekFXcnR2UGdCTDRCdVkyZ1VjOTZx?=
 =?utf-8?B?TkZBdTR2WmI3MUloZVlCOStIZm1NenBoNk1BRHkvUTlRL1B2YnBaalljRm9y?=
 =?utf-8?B?ZGJsRXh5cjNhWW5GMlBERkxmN1JpWXZ5SFE4Y25hc2VaelJwamdxaER3c3Bs?=
 =?utf-8?B?Zk90RFdVQVU0RktIOFhxdjNmSG9Cd0xKN2g4TEhUQUJXaVFrYlloZ2l6VTJZ?=
 =?utf-8?B?Q3Q0ekhWV09FOVFzRDdGeE4zSG9ycnJqY0FVMHZDZlVmY0Uzak9HOTlMZFlF?=
 =?utf-8?B?VnRmZzFSMERKayt2RHpJRUdJMUpoRlpZb0JJU05ITHN1SFVFWW94VGx2b3NR?=
 =?utf-8?B?aU9wTzBVc29BbGtPc2YraXpYelQxNGdXK1RPYzk3LzVjeTdHOWRxYmo4MzJj?=
 =?utf-8?B?ZnZqaUUrbW45Z2x1bzFsNHZFelNEZ3d3bVRmSkg2ajBhaGwremM0bUFLbHli?=
 =?utf-8?B?bDZIazN5UjdhSllyMjlqSUdOK0RjNFF4eUVuRlRVc2owQklsbERhSm83T3I4?=
 =?utf-8?B?NVJUR3RhVXBWcSs5TFp6TUtydXVvcjBDNk1ocW9yRklxdkcxcmpGMC9Lbmd1?=
 =?utf-8?Q?6wgiTKYURwg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODZCUkh3NEFyT3d5M2NnM21INmpNL1cvNkxQeHkyQ1N5M2d2dmRKK3ZkVHEv?=
 =?utf-8?B?NGZYVkt5K3dWaWhkaFJXeGY1RlFENUVaQkd5cUFsckZjamJLbUdkRmhjd2dt?=
 =?utf-8?B?bHFIUlVEWmlGWmRMWS96YUN6eEcwN3NKVTFPVE5ZYnhLWWFDNWNvdFVkcHpT?=
 =?utf-8?B?MWRFR3pEK2FKOHlKaW93WGhtMWY1Rzk4cGxZbm16Mm94MCsreHB1WStlaU0x?=
 =?utf-8?B?ZVFrYXNPMExJRDB1bjRIYzVEaG0rRzRxVXdmeE13NFIwSU5kdnZNc282N0p5?=
 =?utf-8?B?b3N3SVBPN25HQVhyK1JmS0J3SEdJc0d5VE41NHhlZHpZWFBBcUZzY0JicTdz?=
 =?utf-8?B?RkVZcGJFMzJaN0EySEdEbjFHaC9QOXBHOHdBb1k1aFFiNXB3NmhFU1FFWkI1?=
 =?utf-8?B?Ti96SVY5U2h4dDVwblBteEl6L0NIdENMS08zYm5HNmQvK1gzWkhYVThROGpu?=
 =?utf-8?B?cEt0SDM0Vi9VY0dQcElzVXlMU3NuSnN2QlhPY2lTVlhYR25hNTJGQlZRNFNQ?=
 =?utf-8?B?aEFBRUNBOUdXc2dIa1hlYU5KdGNSMThNT1dvSGJWUmx6LzR6dXZYQkduN2lz?=
 =?utf-8?B?ajFCV0V0MGM0VU5wK0NTZXMzclJUdzNrb0JTSW9SaS9WbllBRkFXd2oyMURY?=
 =?utf-8?B?aTc4S2dCZ3dwcThuVUJXaEdjMjJBdWRWUURoYkdsUlBKS2RHdFIvQkNVejVH?=
 =?utf-8?B?STJ3ZmRwNWR4Q3ozUFVyeEFTUHRMaHJCYkRoS2FUMHB0RXdrM2owK05FL1BD?=
 =?utf-8?B?UTIvTFBTY1dWcHBVVzExcTF2cStRR2s0YllxZ1hhdzVGQVRiV2g5TXI0aDhJ?=
 =?utf-8?B?eDdpMVA3ejN3K3dRZjdsNFRodFk1Q2lYbCtoNHJDU1JSaVJ3TGwzRWVzdXE0?=
 =?utf-8?B?MFlTbkliVzFLQWZNZUNWTE1xY3RCMDhUTmwwS3NHazdXZCtGTnRtTHZ4WGdh?=
 =?utf-8?B?d1BVa09aQ1FkN0lrQlN3MndnWDQ1Ykd1bVpiZHZQMkhrdDVTa3FnUzlDa2hw?=
 =?utf-8?B?YVk4VnFZMk1FaXdJM0k1ZkwrNHdWL3J3VmZFcUxOWWVLMjRqMW9MSzg5d09N?=
 =?utf-8?B?UEdIYms0WTNLS0c4MDgyN2lFSFFydWZUZmdPWkxITWY0OW53T3o3RjRiVnJs?=
 =?utf-8?B?UmUyNEl3OHJZUE9zWDlEejhKQy95RVMzaHRob3d2L3JadmtkN1RoSlZheHAy?=
 =?utf-8?B?ZGJjU0JjeS9QeVExS3NWNG5FM2hEa0lyNTRRQjFXMDRXVGVrQVZtdWgyYytY?=
 =?utf-8?B?UXZnU3prbjFPQUhlMUR1S3lkMUtLN2N4ZnBzZU5IUmszaTliREh6RlhSaEVT?=
 =?utf-8?B?UXU2bkpzRTY0WE5xL1lHVnVjWkR5cjJsMi83QzE2SDF2aGZGSnlzUVErdjVK?=
 =?utf-8?B?dTR1L3Bic1lQYnVNdVcxTWF0dE00RmZ2UTNkWmFOZmVySmpaUkNoRHlhcGdk?=
 =?utf-8?B?QXFtYzBiV2FvSDNBbGJaWkM2UDRZU1J2ZzA5WmJvVnFxVk9HMDFLNC9QZ3JX?=
 =?utf-8?B?aHFGbGFlc01yNUFJdzZHZWZKQmJhcWlQclBqNnpGV1BYd2tvVm5uOTJLblVv?=
 =?utf-8?B?M2NtZ2ZNVmNsRUFMOFUvSlVOUGRvdUlabTdOeUR1T2VVc2RwZ2VwZTBTSVV0?=
 =?utf-8?B?aURFc095bjZBZ28xa3ptU2xCUTBDL3ZlU0I0ZkFtOWFyeThnQnNDVlRySWh3?=
 =?utf-8?B?WGZiN1BybEN1eWRQK0FBMUFEc3dSZGxrdy9BSkxTV2ZGWElBcTdNVnpXRFVR?=
 =?utf-8?B?NjBFMDErdzMyNVNobUMzMVFLQVkvTyszZUR6dGc5N3FPVHh4THdLMEpmMElD?=
 =?utf-8?B?ZnVPTDVXUGticVZkWXNkZ3Y0MlJISG5BdDVIVTllNHlkTkVhVi9ZVlJYKzlD?=
 =?utf-8?B?K1pqVjBkamZQR0lSbFcxMnVJS1ZRZnlJbitJdGMwSEhVS1V5S2VSNUFsL3FC?=
 =?utf-8?B?WTdpUkQxQkJqVVZFaWh2UWRzTS9oTUh3SWJmTU4rU0czemRhNDNSTDAvQk1M?=
 =?utf-8?B?VkUxTXpQbXNST1hyTlJ3WkxyeGhCeUhHR0xYZi93cUtPZWw4UXFiSDZpVlFP?=
 =?utf-8?B?TFFMT216azVwRmJxMmlVNGNYVHhLOW4waWlMUEMrRThVMkdHOGpCbVE3ck9Y?=
 =?utf-8?B?dnd0VUhoaFJtQlp6QXd6L0dtZjdqQ1B5ZWxEeDd0UjNGaW95bXF5T3oxVWNv?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d049c1d-d244-441d-846f-08dd9efc64cb
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 22:01:41.8456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ozZuICd6awVNqgjYQcjWiCEJp/Ufd9/K+/xoZoJvKYKIYmqVvceTihfX+Cxv4fSUSxU//dDMhkhHDXQ0QmO0B30OkaFRYhOgMKPHfNquocc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8836
X-OriginatorOrg: intel.com

Hi Zeng Heng,

Thank you very much for catching this and providing a fix.

On 5/29/25 4:33 AM, Zeng Heng wrote:
> The fixes tag patch resolves the lockdep warning. However, directly
> removing rdt_last_cmd_clear() would leave the last_cmd_status interface
> with stale logs, which does not conform to the functional definition before
> the fix. Therefore, the rdt_last_cmd_clear() operation is performed after
> successfully acquiring the rdtgroup_mutex.

I would like to suggest some rework to changelog to meet requirements from
Documentation/process/maintainer-tip.rst. Specifically the rules about
imperative tone and structure of the changelog. Below attempts to address
those requirements but please feel free to rework after you considered the
rules yourself:

	A lockdep fix removed two rdt_last_cmd_clear() calls that were used
	to clear the last_cmd_status buffer but called without holding the 
	required rdtgroup_mutex. The impacted resctrl commands are:
	writing to the cpus or cpus_list files and creating a new monitor
	or control group. With stale data in the last_cmd_status buffer the
	impacted resctrl commands report the stale error on success, or append
	its own failure message to the stale error on failure.

	Restore the rdt_last_cmd_clear() calls after acquiring rdtgroup_mutex.

> 
> Fixes: c8eafe149530 ("x86/resctrl: Fix potential lockdep warning")
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---
>  fs/resctrl/rdtgroup.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index cc37f58b47dd..4aae9eb74215 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -536,6 +536,8 @@ static ssize_t rdtgroup_cpus_write(struct kernfs_open_file *of,
>  		goto unlock;
>  	}
>  
> +	rdt_last_cmd_clear();
> +
>  	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED ||
>  	    rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
>  		ret = -EINVAL;
> @@ -3481,6 +3483,8 @@ static int mkdir_rdt_prepare(struct kernfs_node *parent_kn,
>  		goto out_unlock;
>  	}
>  
> +	rdt_last_cmd_clear();
> +

Could you please move this to be right after acquiring the mutex? I think clearing
last_cmd_status at beginning of a resctrl command's work is a good pattern to follow.
Thus a change like:

---8<---
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 7410321d01ff..77d08229d855 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3474,6 +3474,8 @@ static int mkdir_rdt_prepare(struct kernfs_node *parent_kn,
 		goto out_unlock;
 	}
 
+	rdt_last_cmd_clear();
+
 	/*
 	 * Check that the parent directory for a monitor group is a "mon_groups"
 	 * directory.
@@ -3483,8 +3485,6 @@ static int mkdir_rdt_prepare(struct kernfs_node *parent_kn,
 		goto out_unlock;
 	}
 
-	rdt_last_cmd_clear();
-
 	if (rtype == RDTMON_GROUP &&
 	    (prdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP ||
 	     prdtgrp->mode == RDT_MODE_PSEUDO_LOCKED)) {
---8<---

>  	if (rtype == RDTMON_GROUP &&
>  	    (prdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP ||
>  	     prdtgrp->mode == RDT_MODE_PSEUDO_LOCKED)) {

Thank you very much.

Reinette

