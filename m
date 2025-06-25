Received: from esa8.fujitsucc.c3s2.iphmx.com (esa8.fujitsucc.c3s2.iphmx.com [68.232.159.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB99211A11
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.159.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750837211; cv=fail; b=QtlzWbNQ9uKacU7SoohbfPNIK2sbwqVZ35ETe8hgqCjdRvsrN/Hhb9y6jKijtANswFYQgjM4OQYSepb0HAqjvSHQARfO33Blz1bS59r0+HvsPlOWDhRWWKKgYDTAbmV4lP0CGAv9GONKit7P/3U94J6/UL2+dRRSnPEQWSoPYU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750837211; c=relaxed/simple;
	bh=S2oySJ9xMvJAruPC5c8MVweGNHAw7orA8N7RCVMAqRE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MOYxp5q+Uh28GIExwVGBv84zFEfcMbbK3uQEp1aiVGJlCWkttHT/83P8mjEe9ypNuF+v4wYu9qXG7Kx3wwXZZZHSXnWJUWDvschtoKEwo7SnKsVwKuUtcVzzLtbk8iMdsxdsDdpgg1D3+ZZIo0NYqUf/oHTtCT9E3h/LOXmS03I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=Xf5+JwOr; arc=fail smtp.client-ip=68.232.159.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="Xf5+JwOr"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1750837208; x=1782373208;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=S2oySJ9xMvJAruPC5c8MVweGNHAw7orA8N7RCVMAqRE=;
  b=Xf5+JwOr+Tg2+Rit8Nou6ObQPXOyMGld7eWngDedNf2oscjpf9hGSr9/
   Iv854MRHdQEOmrjtVLiYHhTrj1LGEEbudswY8lMFyLjTj2CCQBDGXmxld
   9uioMSGKqf4Lc+/SgzHS4E/lmtzRQpxPNdEbTqiOFZ7UiaEaMyRPTwtGr
   6/9RYy8uSIseVoS4ZE0G/ffe8bHJJvH/FqIK6S3emAdPy4Hd3nkvsiI37
   Y5ks4bidbxZx9vuxAh+r3EVWgOhhWGDmpU7GD4X95rChHDUUnAHNaAggS
   1IUKNi+o2XWxelJkWtYJdx4+ppysw4SeTXjdNUMJ7xA3IK/crpfIZEHlR
   w==;
X-CSE-ConnectionGUID: kdwLh90NSPKze6H1qESU/Q==
X-CSE-MsgGUID: q9t8XnePTdK6EcIYrDHcrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="159658424"
X-IronPort-AV: E=Sophos;i="6.16,264,1744038000"; 
   d="scan'208";a="159658424"
Received: from mail-japanwestazon11010059.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([52.101.228.59])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 16:40:01 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EVNuMvuKiY1F/ojyYijtfKCZtLJAu1ljdUqGcevQHqbDAIwbu/pF70dP7f6n9U1lzp/uqKzyxbYL4jzDOxtDwYh0Pk+fforcRhP6zGUpzgEaPOQNBj+j4V2ph257mHrZ1yjjrmEC6hs2/U/kQweAevAgJyRyIsctxw3XItdNZT92+hgv/xYDHiSJneQgcwkTcoPPxD2BOxkZXsIhkEbscang8D7hnpHnYyrt1iJO/Ni5qBzg89T9sYUNd9txzaqlRmpeM0zAHv334GdSj+JbPfY6GM/AY93Jc7WaKJFctmlU+EjAn350I5zP8gRSAps/4wsjKXWePRC6UAD5oZn/jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2oySJ9xMvJAruPC5c8MVweGNHAw7orA8N7RCVMAqRE=;
 b=cXlCBzysAjIMzujqFbjRSH2hAzHJbfeCfoHEUJvO8fNYfs3MBrupaNBERr5t91zAfdbxqDIX6xt4mz4S/MXolLHstc2Ttjwiu/NTn9+0sxQ89ERiOvK4c+4uikxt0UBWmzffqwvEMWWvF7Ue5DVNHiNViQzp85es+6wCa+ZKYh/DXj/a5UhAfP03qDObF1/vHsAAEEvG6wdPIds/C1oMUqynVQqcIoarDs+b+COI8azk2Dn4BRePtI3hcakrjaDA7IYJN4CpO8SG/BfkBdHaty8GuSZ05kbnc/afjIU1X2DnXDkpB4NQ9O9u8M1IHKPFIfJGMThPvfuFaZiFFGXHGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSCPR01MB14468.jpnprd01.prod.outlook.com (2603:1096:604:3a3::6)
 by TY4PR01MB14320.jpnprd01.prod.outlook.com (2603:1096:405:23a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 07:39:58 +0000
Received: from OSCPR01MB14468.jpnprd01.prod.outlook.com
 ([fe80::5078:96dc:305b:80e0]) by OSCPR01MB14468.jpnprd01.prod.outlook.com
 ([fe80::5078:96dc:305b:80e0%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 07:39:58 +0000
From: "Zhijian Li (Fujitsu)" <lizhijian@fujitsu.com>
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
CC: "linux-mm@kvack.org" <linux-mm@kvack.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Yasunori Gotou (Fujitsu)"
	<y-goto@fujitsu.com>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
	<peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
	"lkp@intel.com" <lkp@intel.com>
Subject: Re: [PATCH RFC v2] mm: memory-tiering: Fix PGPROMOTE_CANDIDATE
 accounting
Thread-Topic: [PATCH RFC v2] mm: memory-tiering: Fix PGPROMOTE_CANDIDATE
 accounting
Thread-Index: AQHb5XbVZg4Ev2RiYUGAscIFS7XkjbQTZR87gAAYZgA=
Date: Wed, 25 Jun 2025 07:39:58 +0000
Message-ID: <a2a57ee3-949a-44d7-b564-3236ac9e3f8d@fujitsu.com>
References: <20250625021352.2291544-1-lizhijian@fujitsu.com>
 <877c10mju3.fsf@DESKTOP-5N7EMDA>
In-Reply-To: <877c10mju3.fsf@DESKTOP-5N7EMDA>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSCPR01MB14468:EE_|TY4PR01MB14320:EE_
x-ms-office365-filtering-correlation-id: 273bd42f-3065-49e4-2143-08ddb3bb7c53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018|1580799027;
x-microsoft-antispam-message-info:
 =?utf-8?B?KzZsOGhDaHN4L2RBeGZja1I2Q1FlSEFHNVJDQlY3TnM4bVMrUFkxVUZSeXZx?=
 =?utf-8?B?Nm4wdG5PU1dHVXhueEJHQUcyQ1pvc3R4cWk2TmhZQlhLU2pSSjAycUUrWGRM?=
 =?utf-8?B?MGgzcVhUdzBxZ3QxSmJnRklGRko1OEdUK3VhT21aK1BwSzNMY0VJZkNIaWgv?=
 =?utf-8?B?V1ZPeHA5S3BlVmp1VlVBSUwxVS91R25TVnplQW1KZnhzTTNaMFd6eWp6ZlNl?=
 =?utf-8?B?OUJZZzRHQnJDY0wzYWRjd3FRdHd3S3ArYnB6YWdVMzlJZjFqazdOM21nSXNh?=
 =?utf-8?B?VDhuNndibjkxU1pXdFZIUkNBVTN6TFNack9Yd0c4a2xkaWkxcnJQeEpnMm0z?=
 =?utf-8?B?VG5lUjNJTDRQWFQ0K1RUQUdib3d5aGd3bVZ0VnJNdEJ3VjV1SFZTZGJuZUty?=
 =?utf-8?B?TnVnVUd2eXdKRGk2dFlsVEsyaW5XWVBTM2xoQmVhR0FBTEM3Zkc3bFdKRjVR?=
 =?utf-8?B?ekR3V0ZPdkxVYnhwdml0OWpmV2prdGpHRHNYaTlhRDJtU1R6UTVPVzkydFRq?=
 =?utf-8?B?TFE1cTZ2WUMwUEV4ek5ITHhhYmhCL0hxMWtpNVVXaDJUY2JGSHZXUngzN1dq?=
 =?utf-8?B?WmlyQTdDcHkxaXQzQkhqY2V6U0FTdTZxQlo1VzI1S1E2YU1PYnJlUzN5eDVH?=
 =?utf-8?B?eTNyOXVvcHlDSnhlRWQyeVY5cG5XZnM5c04zY0lvVGthejJFVFB4ekJkYjFn?=
 =?utf-8?B?SitnUzBUWDNRSmhwY1kwLzgvQndyb2J5cXVhb05XKzk0QzVGSHN6WGtTU1Jn?=
 =?utf-8?B?VzBNcFg3Z2t2eVpVWWIwVGppNDBzZmNXUnlOUERnRi9lWUdYSEJZK1JzSFNh?=
 =?utf-8?B?MFFaa21xVXZNVTQ5anVaN2RuOE92VmpYZzQwRU1nWjZDQ25OeDh3QWxIcUcz?=
 =?utf-8?B?dmdKUXY0SXFvSHg3UlFKaEE2bXZJOGJiMzR1WU1FbVc4TXZPcFhldmhDSE96?=
 =?utf-8?B?SlNwN2Fnd05uUi95ZmJhUlZqc0lTVmE0aXlJcFBqbCtUWlRCTWZPck44VFQv?=
 =?utf-8?B?SGt6UVUrQTFQMTEvNmFqRHkxUHBMZ2tENDhkaEtVLzVzdnJJazB5ajQwOTcv?=
 =?utf-8?B?Mk16ZDgzMGhCYTZJc0IzbGhPWHFvMkxTUE96SEJwZlc0VlE4Z3ZrRVRibHBZ?=
 =?utf-8?B?UXR4VWQrUDlQYlRWTlhpVlVHQlhPMFpYeTdrOWFEOWQxcDAyV0xkV05saHNt?=
 =?utf-8?B?OEhmcUFEVXFaRTA1R28rZllBVll3SXNmQ0k4ejkzTnFjVTl1VjJYTVoxejR4?=
 =?utf-8?B?MkcvTDVtWktyWXJWVnVvYWhiSUZEN1IrcDdUUXBDM3Q1Mmt3SXhZVkJWVWV6?=
 =?utf-8?B?alJSWEF4R0NCQzhJUFdCQjRET1VKYUtyQUZ6TUJEWEZ6S2prQzJYZkRBaHRo?=
 =?utf-8?B?NmFyNUNFdmwvWEc2bVQvdzVwaXFuWURrNFVJSVVVZjZzZGlOVTJEYTVGMVp4?=
 =?utf-8?B?enI0THpQbzduNEV2MEVNOUtJVFp6TWMzSlFwNzNwY25wMUV4WUp0NGh2UFpl?=
 =?utf-8?B?WWIzZzFWVGVjdlFPUUJUUUJxWU1lUnFjL29ma1JYbnJSNHE1TG5mM1RKYllB?=
 =?utf-8?B?cDJ1aGw2R1ovbEFEcGRQaFBMWk9PNWpXK3lVeCtZa005bDFHaW5uSUNMcmQ0?=
 =?utf-8?B?bVYvWnpTRklERGRoRWR1N1h3OVd6cy9mazdhYnJ4T0ZRYXI3cWhWYWNWQWhh?=
 =?utf-8?B?Y3hSbStpVnF0RVYvT29oWUplVGJjNllxTldwaXdETlVrT3ZTeU1hbnQvYmQ5?=
 =?utf-8?B?ZzRvRWFUbTR6NXcrU1JqdUJEdEwyUFRYbFZZWnBjUGdJdS9md1pRdTlqMkFI?=
 =?utf-8?B?dnFoZC9GUEtGcHcrbzR3Y2dsWTlxU3BoM01VZGttWVFZK1VpTnFuOWM2aS93?=
 =?utf-8?B?WUVKNVhXWXBLRElrcEVLbEdWYlBFTVRKWlN0WUtKSFNlUldSWFdEMUp4N3ZV?=
 =?utf-8?B?ZnJNOE0xb095YUVQRmNKeEhYT2xyREhBWXQ1bzc4MDU1ampUU3pYTERyN1V4?=
 =?utf-8?B?aHhiUU5TR3BBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSCPR01MB14468.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QTNaVWVqUTU2dkVIcWtBaU5YQnBON0RBTTBYd0w3NHpSNzNzSDhrSThQU08z?=
 =?utf-8?B?WlZLajRSYjg1Q3RQR3oxeVBudmxBcTBtOWIyUDNVT1B0a3FNWXpwNzFlMEJQ?=
 =?utf-8?B?LzZKaDVDNk9NOGNoSmJ4VEdzQnVzUEZqcnNHNkV2UFBXVWhaOVlEc0cvUTNW?=
 =?utf-8?B?M1FGSUxETm9xMmlYT3FFREpVM3VwTHZSWUZOdy9YSG41NTJwZWM4UTA2OHRm?=
 =?utf-8?B?UWhBZkpQRTVRSEN5TXZ1MklCL2Q0K2JnS1RlN2xZR2VJdGpTQUVTc21mTEI3?=
 =?utf-8?B?eFNXWnlteXY1MEExZm92TnZtenY3TDFwTXJIeXhrY0RIVGlnb2haT1plZ09I?=
 =?utf-8?B?eW9JSnVySTBMdmFCaHhud1hrOENYWjZzQ3FTSWdSK2ZYeTlBQ1dCRzh6cXl3?=
 =?utf-8?B?Y0gyV2tYMk4rb05NcUx4L25jUzVwc1ZKZU9xSkFZVWwwcWhSNmM0VWtlQnd1?=
 =?utf-8?B?U2NLcjYrVkdWY0ExcENncVVOdUtOTVFxVU45THh0aW4xQXRoTXZEeDVyM1Jl?=
 =?utf-8?B?cGovT2xZWDd4MktQRW9zV3dZZ1djZHYycTN6VGxxVHc5dUhBa25rWFBCMGsw?=
 =?utf-8?B?a2lvWHJubU04WXpUcGNSN0FEUW4rZ1ZDNnZDcmpPTWtxdFBKMzNmZGYvWHRq?=
 =?utf-8?B?a0h4V2JrcDh1Sm00S3lnblk4a1hlMVZ3RXFBcjU1L2hLekFBTm91QnJSUngw?=
 =?utf-8?B?TzRiMzlnZHJwNGg3ZWQrM2FRRlVMYkFLc1ZBZkNYOG9idGh4QjhOcFhNeEIx?=
 =?utf-8?B?eWowU2l2ZEpQaktueGVRa2J0QXozdlYrV09TNFNnRzhJODdES2J6b082azB6?=
 =?utf-8?B?UGFFSm1FN3RkZGs3bFYrT0lKWGJDRlE1Z0tRNXBXVnJ6NEp6Qk1zblo2dDBE?=
 =?utf-8?B?RmZDTnlNelpQVUczZDdicmFmdDRYWXkxU0ZkTEs3N2FZQWpFRDN1aHNGd0Vn?=
 =?utf-8?B?U0p3VURiN0NLV05ENnB3WllRamNaYUxnTCtPZ2p5TC9pUldJTXkwVkJlRVVs?=
 =?utf-8?B?S256bU5RRG84eEJRWlBkRElqbU9LMGlpZG14UUFUWnJsTzBNbTEzK1FnR3JO?=
 =?utf-8?B?M010QnhrczJ5cldIT0Q2RjlnQUVpbEdCRVJkeWg0aXVOd1JxV0NRbHpheEVs?=
 =?utf-8?B?Ung5ZjZ4alIrYkVRUTNLOFlUSFJmcEdkSkdLOExjUU5zaUNlRTR1L2JsU1lE?=
 =?utf-8?B?T1daaEYxWFZDRGNTYU1Vemt4VDhrbmhjNzlLTi9SNFF4NFRBL1RWc2xMcWUx?=
 =?utf-8?B?TVFjNEY0M0p6SmphTkRURlBpR2NWVWU4RFV3Zk1LTXd4Y0xCSFoxR0EwK0wr?=
 =?utf-8?B?YTVhbXhaYXhMOGxpQmdaUVNCZTJxRkFqWmZJaVIxWEc3akROdi9oYkc0dDJS?=
 =?utf-8?B?TTAzblYxenZ1bC93NU5oUmMyY0VWWnY2YzBrd0xQRS8zK0RJWm5rYUpMcWI2?=
 =?utf-8?B?RStDNzRmMjIzdHM4WUJ2cnJTSW84MUN2MHQwWXo3SXZ5NU9PZFRDaXhGcGJ2?=
 =?utf-8?B?SDZOWjEyY1hyNnBBOFRFWVdMRk5Qc0E0MGFLS2RZUTZYNktoNkhNSWl3MWFM?=
 =?utf-8?B?QmNoY2J3d3RhT0Q2eTlUYTdid1J6TmxmbHUvYlcvSE9TNFZMQU4vbDJUNDBu?=
 =?utf-8?B?WEttUzhkelFLMGxUZmdOenBpMVAzbTEyYTBVZEtQSy9UMXVkWWNzTDNVOU5E?=
 =?utf-8?B?TENIVFZHd2FTMHJFdFdkTmVMcDFRSnZlTUs2UXo0K1RrNmZxaGxlVHZwNUN2?=
 =?utf-8?B?bW1JRmdXYnJ0KzhnNWRGak8zaHlqZStVQlhYcGFhSUN1dnYyUlRBUHVmemVD?=
 =?utf-8?B?T0p3L2JQZVBLeDVoamxjaEZFZ3JOVVZQZkdpS09hVzNkSjQyWDZOeCtYMytp?=
 =?utf-8?B?MElCenFnWC9mWGphSi9HZFhuMnpjSFpTdEhBaGQ1Ny9sWURHdFpFOElEc05l?=
 =?utf-8?B?SVB4bTRyQ3NPUXVZMlV0Vjk2aWx4T2dTYWljNzBMVUJ6NnJkWkNiWHJHY0NF?=
 =?utf-8?B?Z0l4T0ozUyt4VVRkdFA3N0ZUdS8xWkFJbWdWM0I2ZVNDTmNvcVZhMXYyR0Rz?=
 =?utf-8?B?TVVCdnRKamhFL0xzcFp3d0J5NE9icFhrRUlvY05EUi9yS092NlhvYTN6Zk5B?=
 =?utf-8?B?UG9PYWluR01qMU5tL0FBQ3Ixc1RBQWtaTzdPa0kvVmFrUDdhQUZpem5WK1pw?=
 =?utf-8?B?d2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6AE2DFDD5F5FC41A8D067CD8941760A@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CBpb01q1FZdZyAzUCUmsvDrv+yhI/isqcsrdDUFiqkqEbtAtoihPkEEQnoIpFezQw0ynIeX7DCfOOc9f80cMoGPnlsfVL+IqZoQwPTUhKDRKVl7WjGMBWvfkNRxipB/eosF2zJOX4yyqb83yPhy9qoERoC/Lm8LrrNaEUOmmk6t/yEto1ESEKznPrxm/6snuqv2MH6tZdc0CxiKbGLt95ajnE+NW/iZIHJDWnkg9MyQ0PhyyrrbwbYgZcCsrqGjKWOR9MfLHgAt5uq85WEmNLyEoM6UClGwBBzuTsdo4N9ywTOn4rGy8G4gSx+SVWeP9oChV5VZs4KjBOxKRGFd1zlxLF34v8fGwZ47jJbz/tCjLolE6CPppoTuiFYmdmjfFjbDpDeWz4kQytWz7y9+SYA0/xP8cLN5J7229D+32kpd7pwKcp9AFNwejLbtgrXWZO4Sm7SnEUaFHSa46FtIa7RfB6+QDoaLL5iSlHcRTGoNjhDEqMK+W+fYfR4quubztIIWxVCVUIRw47m0B7h5CJtMiSa3l29uhoXgW5JHSixVs5wyfKVTcGBZvq/+3OXObJirp5Cue+rd9Bp4Tewo9hZB2IggzZVbgbmCNRxefVlTfVqwk5/Z5DzZl0FCNDgpu
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSCPR01MB14468.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 273bd42f-3065-49e4-2143-08ddb3bb7c53
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 07:39:58.2378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QTBUDsLrobkOaicMv3v9WWRyEMZQj64AJGVODxdfwePmlSCLIezl0cPFyw6NOdxtHQN3om11k86hXFx3s9y+sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14320

DQoNCk9uIDI1LzA2LzIwMjUgMTQ6MTEsIEh1YW5nLCBZaW5nIHdyb3RlOg0KPj4gVjI6DQo+PiBG
aXggY29tcGlsaW5nIGVycm9yICMgUmVwb3J0ZWQgYnkgTEtQDQo+Pg0KPj4gQXMgWWluZyBzdWdn
ZXN0ZWQsIHdlIG5lZWQgdG8gYXNzZXNzIHdoZXRoZXIgdGhpcyBjaGFuZ2UgY2F1c2VzIHJlZ3Jl
c3Npb24uDQo+PiBIb3dldmVyLCBjb25zaWRlcmluZyB0aGUgc3RyaW5nZW50IGNvbmRpdGlvbnMg
dGhpcyBwYXRjaCBpbnZvbHZlcywNCj4+IHByb3Blcmx5IGV2YWx1YXRpbmcgaXQgbWF5IGJlIGNo
YWxsZW5naW5nLCBhcyB0aGUgb3V0Y29tZXMgZGVwZW5kIG9uIHlvdXINCj4+IHBlcnNwZWN0aXZl
LiBNdWNoIGxpa2UgaW4gYSB6ZXJvLXN1bSBnYW1lLCBpZiBzb21lb25lIGJlbmVmaXRzLCBhbm90
aGVyDQo+PiBtaWdodCBsb3NlLg0KPj4NCj4+IElmIHRoZXJlIGFyZSBzdWJzZXF1ZW50IHJlc3Vs
dHMsIEkgd2lsbCB1cGRhdGUgdGhlbSBoZXJlLg0KPiBJIHVuZGVyc3RhbmQgdGhhdCBpdCdzIGhh
cmQgdG8gaWRlbnRpZnkgYWxsIHBvc3NpYmxlIHJlZ3Jlc3Npb25zLg0KPiBIb3dldmVyLCBhdCBs
ZWFzdCBkb25lIHNvbWUgdGVzdCB0byBjaGVjayBzb21lIGNvbW1vbiB1c2UgY2FzZXM/DQo+IA0K
DQpZZXMsIEknbSB3b3JraW5nIG9uIGl0LiBJJ20gY3VycmVudGx5IHVzaW5nIGBwbWJlbmNoYCBm
b3IgdGVzdGluZywNCnRoZSBhcHByb2FjaFsxXSB5b3UgdG9vayB3aGVuIGludHJvZHVjaW5nIHRo
ZSByYXRlIGxpbWl0Lg0KDQpBbmQsIEkgYWxzbyBob3BlIExLUCBjYW4gcnVuIHRlc3RzIGNvbmN1
cnJlbnRseS4NCg0KDQpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwNzEzMDgz
OTU0LjM0MTk2LTEteWluZy5odWFuZ0BpbnRlbC5jb20vdC8jdQ==
