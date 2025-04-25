Received: from esa1.fujitsucc.c3s2.iphmx.com (esa1.fujitsucc.c3s2.iphmx.com [68.232.152.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50A214E2E2
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.152.245
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745549853; cv=fail; b=qO0T/cCbfdi5GXCM+ckgcecJTQpqBIrycAcSwZO1gxpiTPu+SpkwYIRykuLjIbL8v37RN7OpRmA4cWcYTbsX7FfLPaQL8rSpRkyWDachRPYXiMD53eaPpNrUOkqegasuow9Rcj+swlAa4Rq5ROzedEDVbfumDulaX7esTVBrETM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745549853; c=relaxed/simple;
	bh=6ldgwmM30Ltp02ZBf63AqvbsRpBbrtyQYYRoT51hVPs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=li2jh03FzAu8F2ZxfVStmTgu0Pv5Him2QU0tXb2TlN+wbT5UHKaG7TVvOkrej1tAzTH74z4OIzREn3slL9Tp1Pa/zp/bh0teI0KMCNEkjo5aRGHa37IdpMuBWS42L9AyOKnCB6L9O/MxipM/NgEPFiIR4fkLaxS9H7Br0zbC5Io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=PcbE3IHJ; arc=fail smtp.client-ip=68.232.152.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="PcbE3IHJ"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1745549851; x=1777085851;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6ldgwmM30Ltp02ZBf63AqvbsRpBbrtyQYYRoT51hVPs=;
  b=PcbE3IHJml0u1Jlsl7Cxbj92mfrLfNf4gJKo6r0dRU5KQZ3Nwa1yrmMs
   jPSSL1gbxjx7yihryQKdQfIafFD/P7hQJn0QeAR0+dh0H5gW66+RE6Mkv
   UX7V6lbqype0q8u28fH2+l/3GyYhz9RQSSALuzlJmuNhMfVNqzMagnv5Q
   txgERqT6J2d41gmQSxFabGQRlORyAsLvMIE8oM2UPVErGrKZloAGObBmI
   mzCszUrKuctUcCpkBKnDUddomLV7SBeLB+7JSiAvkbKlYxjRV8PV/dIvr
   eQq/KCToxXEt364rSIKRtQ4MXBkV3rLJTCC0qWi9gdF0f5VR2/G+HZjSZ
   A==;
X-CSE-ConnectionGUID: WSHU5VkuRNqJ2pQo1hBUGA==
X-CSE-MsgGUID: 4bUkS7aOQMK9R6BQNfkPnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="64944425"
X-IronPort-AV: E=Sophos;i="6.15,237,1739804400"; 
   d="scan'208";a="64944425"
Received: from mail-japanwestazlp17011027.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.93.130.27])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 11:56:15 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDHr0e7GR9KeprvEQI2SHoumbOzlPCoakhXmWyvkO47kvAbWO5YLIaJRsAT7XHqbu1sSA8HI7dHWVuQdh42ED8euAOutjCqhhma7UsXkTfkzDiNc6KfL1Vr8uyUFfV8Xp2/1Cq0R1k+mRe1/UAQX+s8ilgUvZCDZC8GFZE0bSTt3HeBqjPgY4FCr0GfgBvrPOUES0+JA8dB3okTMfatTB51ynUq3dYBC3LFelc7Sfe3uWuBJhbXzn2pZWh0PZ6J0/164wzjnhNm+5p2/hW4GON/78gQkQfGyy1Vi0dBSzXgOfCsWhfWOiiC/vnQaJrU3cR9mdljfoWmT3WhQ2MmfAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HdYZLnczcGqt4KItRm8uszh46ZezloDQPWDucxtDCc=;
 b=BKrpy4FA8wGRHd7CCgZNJNxBk9y9ld/d7VL0C2FEiYZ4Gv+tbM3UXBwWTEtkkyBVlEWYdnJiJvNoAs3CNPpfUde6HFlQh/VoKf6mXO71BOLJJzLNdp4hrZpsboJfdZrip//VGXFU9E0Mxmzd3vIaIujjo+0Sno8uqsUwfx3ds3tCZSGL7oAoBXpUHqAODp9uu5TATMJWbrevuAk//RTvfjuO7fmhkLBw8zFeu/5CyXRPgIVsDo60S3Qc3mlnckBEYTSkJhJ3i/mt1PwgizT14nWzYtAvF5L3G/DXsOhS2szW9tYO2gVDM+HlLqAooENLKjrAeV2cyemMFOSCFAetcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com (2603:1096:604:15f::6)
 by OSZPR01MB9580.jpnprd01.prod.outlook.com (2603:1096:604:1d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 02:56:08 +0000
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::4344:1f7b:e34d:c672]) by OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::4344:1f7b:e34d:c672%3]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 02:56:08 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: 'James Morse' <james.morse@arm.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Reinette Chatre <reinette.chatre@intel.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, H Peter Anvin <hpa@zytor.com>, Babu Moger
	<Babu.Moger@amd.com>, "shameerali.kolothum.thodi@huawei.com"
	<shameerali.kolothum.thodi@huawei.com>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, "carl@os.amperecomputing.com"
	<carl@os.amperecomputing.com>, "lcherian@marvell.com" <lcherian@marvell.com>,
	"bobo.shaobowang@huawei.com" <bobo.shaobowang@huawei.com>,
	"baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	"peternewman@google.com" <peternewman@google.com>, "dfustini@baylibre.com"
	<dfustini@baylibre.com>, "amitsinght@marvell.com" <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>, Dave
 Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, Shanker Donthineni
	<sdonthineni@nvidia.com>, "fenghuay@nvidia.com" <fenghuay@nvidia.com>, Babu
 Moger <babu.moger@amd.com>
Subject: RE: [PATCH v8 02/21] x86/resctrl: Remove the limit on the number of
 CLOSID
Thread-Topic: [PATCH v8 02/21] x86/resctrl: Remove the limit on the number of
 CLOSID
Thread-Index: AQHbqwDY7hvE2CTg8kKi46En59zFJbOzwMHQ
Date: Fri, 25 Apr 2025 02:56:08 +0000
Message-ID:
 <OSZPR01MB879824B7EBE583C7EB4EA7128B842@OSZPR01MB8798.jpnprd01.prod.outlook.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-3-james.morse@arm.com>
In-Reply-To: <20250411164229.23413-3-james.morse@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=dfbc3b35-2949-4d8b-a564-c7ae1d64478a;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-04-25T02:40:18Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB8798:EE_|OSZPR01MB9580:EE_
x-ms-office365-filtering-correlation-id: d6c483b5-a086-4d73-4680-08dd83a4ba6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018|1580799027;
x-microsoft-antispam-message-info:
 =?iso-2022-jp?B?WlY5NWtBQnFnVlE2YmErQWxFY2NycGdiR1ZxbUVLb2dhc1lMVEI4bjRG?=
 =?iso-2022-jp?B?dXFpa3dpTFQrcDZjQTZEeVF3K1p2MHEzTkVqZHhkVzB5cldVcHZPcWhD?=
 =?iso-2022-jp?B?c09lVmtkQkJNY3VDNVNudkxvZGd2QUVZOWFya2szcEhYMnRlTktkVElD?=
 =?iso-2022-jp?B?SDJ4L2VSWDZ1TG83cTM1WkttOFlIVHB3Syswdlk5ZUJTOHYra0lISFlS?=
 =?iso-2022-jp?B?K01hb28xOW0yU29qKy9CU1haalBkRkxmYm5Wb2tIMnZkbFVPcnVmajQv?=
 =?iso-2022-jp?B?anBpQmh3VzNPZEN4SjZxcDhadGh4RGd3ei85NHljMFlFRTNmV0NkQlk3?=
 =?iso-2022-jp?B?SjU1ZVM0QkRnZzBqaHlOZ2w1bDdMeUhmM2ZFM3k4QUx2cUxoY1NET1pt?=
 =?iso-2022-jp?B?U3U4Q1JQV3VNN0o3YWFwSlZpV3l4ZTQ5VDltUzJoUVNIL2xhdmh1VHky?=
 =?iso-2022-jp?B?NWljYTgxaFFzeTJQVHI1T0Y0dW1DQmdDSW9sZDMwM3VqOXdGUUNWdUFE?=
 =?iso-2022-jp?B?b3FDMUgzSmtTM2MvaCt6RkxKZmtIV25OTDFSbGRKOHdtUWE3Q21VUkw1?=
 =?iso-2022-jp?B?OE1NZE9iWS9ZbDc0eWR1cTlOUG5La2lEbSt5NjZ0TmlHTDE3OUNLOFZk?=
 =?iso-2022-jp?B?M1oxcmdXbEZOR2NYVC9Qd1pIMFFQcC9xMHlWZ09jUWZ4b0NIMFNDMzJK?=
 =?iso-2022-jp?B?MTQ0U2ZpZGxpZkE1b0IwSmtOTW5FUXZoTGxBVTR4ZklSK0FITHVzbjN5?=
 =?iso-2022-jp?B?ZmptNGN1QXZkVVVRaWM0Nkt0SkpYOHlZU3ZhWjQ2bkxqYWNQaDhlOUpZ?=
 =?iso-2022-jp?B?bkFwdnlabHk5Mi9jQWIxQmw3aFFkT2FKRmxpY2RNc0cvVW8wUEVCdXFm?=
 =?iso-2022-jp?B?M2JsS213bmdkTnVCSmxHenJHcWhpZlZ5QU9sNzFpZlBuVkxRazloM3hF?=
 =?iso-2022-jp?B?djZqNXFJWDNXNW55eHNSeXdHaEpvVk9Ick9TMldhTVVkYWpvS1dWdnBn?=
 =?iso-2022-jp?B?RU01M0l3bTRKMmplaGg0Ky8zalF5V3A5Z3dYT2hHN2xtVEQ3T2o5R2dC?=
 =?iso-2022-jp?B?WlpBMVZxanArbkxma2hNaWhqcU80MGczTXRDVk42Ykc4b1JCUDJ4RW90?=
 =?iso-2022-jp?B?bXRzV0pKeWhFY2xuVlFsSFZ3YjRkMm5VeDNDb2pyTVpBU0hHWnNzbEhW?=
 =?iso-2022-jp?B?QzRacldpK1Jqc3Zwd0s0Qk5RSkNOS09kMnNpMDZBUThEVUNBV1IwOG9w?=
 =?iso-2022-jp?B?K2ZVb2VMd25MOGwrekVxMVpVOHVDeUdMMHJ6ZFZITVordTFtcFFwUE1Z?=
 =?iso-2022-jp?B?T2FOVU9CWFBYT2ZzY3NkUzh4RlF1ZDkyVm5mL1NjYmp4MmZzMkVXZW9y?=
 =?iso-2022-jp?B?QjIxMmNFUzJtNkNaVzc4QmQwbm5yUUs1RTlyWmUwTmYyWGV1RlR6Z3BK?=
 =?iso-2022-jp?B?NjBpSFg3NU5XM2R1ekNwZEx1NlF2VW05cXVLa0hWcklqU2pLRnA2dm9w?=
 =?iso-2022-jp?B?U0d6VFVjcW9KMkkxZTVNUTJOemNqZkNYcFFpMGNIRWk0MTlwWHBnWW5F?=
 =?iso-2022-jp?B?RC9nclZRT0FTV1RoMjlvaW9DMnR5RDJtaW9oQ2FRMUZCS1N6YWthblcz?=
 =?iso-2022-jp?B?TzMrOXhZdS9YSDViZEltM2hYRnpMWkY2QnR6VmU2U2thbmxMV1NDbVpm?=
 =?iso-2022-jp?B?Y2lxVVozSytvQi90QzBDZzFWVVAzTW5POW83SVQvR2F6N0cxbHZIUXdU?=
 =?iso-2022-jp?B?MEVOMkFacDMvY0NURk9zWTl3UnVBRzJMa1N5SlpESG9NampTZHdCQ3N2?=
 =?iso-2022-jp?B?aVIyeG8zcUhFWXhGaFVLNENRVkNseHFlVGZ0VFpqMnU5b1hxdXJZYWoz?=
 =?iso-2022-jp?B?TEtkVXVQKzkxVE95eC9kaHNxM0hoZ21QTjZ2Z24wekJ0YVo5K0pHdExY?=
 =?iso-2022-jp?B?ZlQzNTE3V3dqVzI3RysxdWJJVjVlTGFKbjRwckM2a2R3d3AyZE8zQUJI?=
 =?iso-2022-jp?B?MWpVVlVwZTZTb0hnckNyM1RlT0RxMnZsOFRaSnRZV1lmZ3pyWXR4OGpS?=
 =?iso-2022-jp?B?djBxSnhDZzJtdTVGZ0hOQTV4M0ppa3JrT3Y1RUh0QzhzODhhc2NzbmlB?=
 =?iso-2022-jp?B?VkhVNzVGVjZReTBhYVdNZmplVEw1dVFWcHNHbjlwbmR3VitZS0JxT0Y3?=
 =?iso-2022-jp?B?Yzl2Ujg5YlBBbVlwbnVXZVpSMEh1MUFO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB8798.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?dGRzNnVleVVzYjJlQ1lrWGdERDg5cTBIYVBEZkhVdk5MSFFpYVcwM0p4?=
 =?iso-2022-jp?B?UTFuRXBoT3JRMUNBekJJbUh3S2JYbkJEaGhuV3ZZaEsxSmJSTzREb1ZN?=
 =?iso-2022-jp?B?LzdSRThaSFgwTVVLSWdwalBXellXRk9uUzZKaUZuTGJSaGdHU1k3bktp?=
 =?iso-2022-jp?B?RmJQRU84OXJ0SXh2NmFpN3hvNjBlSmZLZG56aEFjNzJ0NGNXejhZZ1Vk?=
 =?iso-2022-jp?B?NXVyVUNTZGo4dFRLR05XSldtNlpOZy9zZjd4T1FmVDdKbWhqN1BjVkhn?=
 =?iso-2022-jp?B?bmgrS09raWY4OE0xOFg2TTQxZFUwNUQrZEx1L1FMbENGcjErTG82Mllz?=
 =?iso-2022-jp?B?MGQrQUtSa1BQc25jcVJiSjhYaENWa0V3emVOcGs5N05FdXVNOUNlSXpk?=
 =?iso-2022-jp?B?QmtUVTIwNFVxQStsb2p6aWNDM0F6Yk4zNGYzaGRJem1MNVNvZW9DMjFz?=
 =?iso-2022-jp?B?OVg5V1BiYTU2UnZjdUpFM1pPYThtSStxbncxMDNMZVZRa1BveFVLR0U2?=
 =?iso-2022-jp?B?MHJFekd4Z1gzTFQvNjV2dERrakE1bitIRklBRVJrVkViTFR6cC9GbzRR?=
 =?iso-2022-jp?B?aDJQTDdnMWpkcFNmVkpOMFI2c3JiSUsyMkJaUTFnTkRCMkJ5aktWNFdR?=
 =?iso-2022-jp?B?dmxTeWRPVUdKdExIY1pIMkNJeFU1VjZDY1lhVm43RkZqQmJ3MU53SGFo?=
 =?iso-2022-jp?B?TXZFOExQVHZkdW85cWpmZmoyOFhGSm9mQSs0ZnJvVEFYQnNOb3loVTg5?=
 =?iso-2022-jp?B?OXBVZ3dxanpDSTdGT2Zsc0tCclNqMDRSaE4zR3JsSU84NG1UWXNrYStz?=
 =?iso-2022-jp?B?Tzd2SlI5T0x3cis5YWk0RThYc0QzVSt5SzAxTFd5RUhZa3h5aERSRStR?=
 =?iso-2022-jp?B?UTB1TTA4NUFQbDhjcUlRUTZxTmY2MzNZWXpJOWxDR1djTm9WTVVqcUJS?=
 =?iso-2022-jp?B?Wlkxc0ROZFhTblRWb01zcHVqb3F1bGU5OWg4cVk2cUdpVlYxNkhqUEVz?=
 =?iso-2022-jp?B?RWhPZ2pUNEhlOGEvd2xZdUltY3FpVnhiWm9ibTRkOHBVdGpKazhOUjJE?=
 =?iso-2022-jp?B?SGVHamJUc3dmUUVIMUY3OXhEUlgvYktlY3MzTDZldmFkSmFNVXVBaGQy?=
 =?iso-2022-jp?B?RFZGSFpjWkw3NU1CU05vUlliMWZHQ3o5REJ0SmlqaEFKbDZTcWM3VWMy?=
 =?iso-2022-jp?B?UitvRHhlcGM2eWJoZlhpWU9oSjZ5ZVhTM3liWGxFVzJyd2wyOUxZVVZ1?=
 =?iso-2022-jp?B?RXN4SXF2RkhDNy9UVjBFV2EwdW90R3YwMDBKdDB1RmRuVnhCMEtTRmtX?=
 =?iso-2022-jp?B?MUdXMEZuajdzaTdBUHh2RmVnSlQwSzVLbkZBMWU3NWlZRklCWjFWT01w?=
 =?iso-2022-jp?B?b0FFNUwxaWxWMGdwZENLczNEVjdyeHdsQUtRdkoxMUpLb2NyWi9Vbk9z?=
 =?iso-2022-jp?B?OUlaUGFJU3BDTGZNa3FkaVhpMWh4T1ZvNVB6VitTdHdEWjNRVmhySHVX?=
 =?iso-2022-jp?B?UU9SYjJpZWRiZGRQbXpGVlFZK3d5RFp6U0ZySmhncWExS0U3RnFYTEMy?=
 =?iso-2022-jp?B?Z2lHSDNpL3REYllBS3hsQUlGTXF2TVV6L3cxZ2RwUnRZTHFFVWhJTVVr?=
 =?iso-2022-jp?B?LzlFQWdFdFN4SXpMaGJSb1BVQXN5UGtldkRsSUtEWkVoa2VybExqRG0z?=
 =?iso-2022-jp?B?S3doMVFEdEpqSWdJWTAyYWRyVlhsVVZ5aVVlWUVCY0ZaNG9PL05iNVRB?=
 =?iso-2022-jp?B?VkZlUUsrWWdveWhsU3RmWEM0YUEvbGMrUFUvT2hPbndyc2lnWTRiN1Z1?=
 =?iso-2022-jp?B?akN1MW9SN1pqNDRpdDZLSkc0RWpscHlWU1d0a0lqdmtVK1ZUTHVMbjdS?=
 =?iso-2022-jp?B?TnlrbXUwU0NObVVWM0FDajh2R2ZmVVdIbEFWd3BvaG0rN1N3Y3Jma1VO?=
 =?iso-2022-jp?B?WC90TXoxNVZEc3NHdFRjNzRFcmpCcTRuZWVqVUVpN2Z5Um9kcHlKcTAr?=
 =?iso-2022-jp?B?OFNxMnY4aTVNNWM3Y3RkWkNFQWhwdEVCc2hEV0FCcytMTjlRdzFoa2ZI?=
 =?iso-2022-jp?B?RlRRdE1GSEdFcHpuZFkvekFiaTUwY1c0cWlYb290NGxBSy9IdG1TZGk2?=
 =?iso-2022-jp?B?SzdBRDgwSVlFQllDcDRkbnRLOUc3ck1JaU5CRjV4bUM0WXdmUFJXalQ2?=
 =?iso-2022-jp?B?cW4vNVdHVkl0WSswUFVmRmtIT1RFTFN6aHM5YlFYN3ZPa1ZpUGpadERh?=
 =?iso-2022-jp?B?K2gyOFhkRWZXdVl6ZFJZa1RNVzN6aWx5eEgwZkxpRHBTRk1naWMzOWxp?=
 =?iso-2022-jp?B?Mlp3MFNHdzFUOTlxNFhPOHlNMlJkWU5YUlE9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VJ74jqAcgRBdsKBPJA/eNi5xlLFjbAVRCMQNIFb2dPk0xM3qvkdbnwp1YzwoTn1VI+l81cB//dv535A0h9p5ndLGs8JZ8JK/fDWLZ97k1/DF73hx9hnjhjTSEqpUuZvGvxlU0JGAGKP4tpekhkBixVNNh/NSIv5BGWwDRa0SMo8Sy+JxAhGPCCz2ZV0sggn0D+aHcU7ev+Zc7VOssag5irfSzdQ+sysLg2Qn+eu4+Qa9kOCDeeayzVLDkaX63wpsEFPkPRWlJcrNlFp5GRPxoEGkidBhXutndWSq8QZ14c5im+WuwA/9xvhOhddu6OHBoMQfKDmaIw6hIIc1fZyIH2LwonGaRqDj8bWqvtY4EHwVy5NykJtb2yciZCCHhkPX3h64zjeCCAQqCH+UeEJYhjdTJZ5qAp+gURvll4YORHCJW1wNOKVhkIFUf2Ib1/Jm5ag7QxP+EiRZ1Q7X4YBfYeTARfgEY8qos6GDT3jHON4glXgQ5qp3NrpwouJ6EU/CdZ66ItG0hQrD1PD/LiZsrnQSLbnnoBWFccRWPnSOPGacSHYv6YVtXNpVkC+uY1/lFr8lbck5nHJZjD2xBuGeJkafL4kM7lBUDHiWRGAw7ympDxPodXu9AvewnMb2gTAV
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB8798.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c483b5-a086-4d73-4680-08dd83a4ba6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2025 02:56:08.1514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4/N4oDFoGZQZUXk8IBsbljxu0Vyzl3Fttrs3R5m97yUCcDcyFSDSHnw/u0pFWY73mEesh4j5pQCnD9ztpKSH70ln+WDkEG6e8DxOOeGeFQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9580

Hello James, Reinette,

> From: Amit Singh Tomar <amitsinght@marvell.com>
>=20
> Resctrl allocates and finds free CLOSID values using the bits of a u32.
> This restricts the number of control groups that can be created by user-s=
pace.
>=20
> MPAM has an architectural limit of 2^16 CLOSID values, Intel x86 could be
> extended beyond 32 values. There is at least one MPAM platform which
> supports more than 32 CLOSID values.
>=20
> Replace the fixed size bitmap with calls to the bitmap API to allocate an=
 array of
> a sufficient size.
>=20
> ffs() returns '1' for bit 0, hence the existing code subtracts 1 from the=
 index to
> get the CLOSID value. find_first_bit() returns the bit number which does =
not
> need adjusting.
>=20
> Signed-off-by: Amit Singh Tomar <amitsinght@marvell.com> [ morse: fixed
> the off-by-one in the allocator and the wrong  not-found value. Removed t=
he
> limit. Rephrase the commit message. ]
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Amit Singh Tomar <amitsinght@marvell.com> # arm64
> Tested-by: Shanker Donthineni <sdonthineni@nvidia.com> # arm64
> Tested-by: Babu Moger <babu.moger@amd.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> ---
> Changes since v7:
>  * Moved closid_exit() earlier in rdt_kill_sb() to match what
>    rdt_get_tree() does.
>=20
> Changes since v6:
>  * Set variable to NULL after kfree()ing it.
>  * Call closid_exit() from rdt_kill_sb() to prevent a memory leak.
>=20
> Changes since v5:
>  * This patch got pulled into this series.
> ---
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 47
> +++++++++++++++++---------
>  1 file changed, 31 insertions(+), 16 deletions(-)
>=20
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index 776c8e347654..4e0308040c6e 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -130,8 +130,8 @@ static bool resctrl_is_mbm_event(int e)  }
>=20
>  /*
> - * Trivial allocator for CLOSIDs. Since h/w only supports a small number=
,
> - * we can keep a bitmap of free CLOSIDs in a single integer.
> + * Trivial allocator for CLOSIDs. Use BITMAP APIs to manipulate a
> + bitmap
> + * of free CLOSIDs.
>   *
>   * Using a global CLOSID across all resources has some advantages and
>   * some drawbacks:
> @@ -144,7 +144,7 @@ static bool resctrl_is_mbm_event(int e)
>   * - Our choices on how to configure each resource become progressively
> more
>   *   limited as the number of resources grows.
>   */
> -static unsigned long closid_free_map;
> +static unsigned long *closid_free_map;
>  static int closid_free_map_len;
>=20
>  int closids_supported(void)
> @@ -152,20 +152,31 @@ int closids_supported(void)
>  	return closid_free_map_len;
>  }
>=20
> -static void closid_init(void)
> +static int closid_init(void)
>  {
>  	struct resctrl_schema *s;
> -	u32 rdt_min_closid =3D 32;
> +	u32 rdt_min_closid =3D ~0;
>=20
>  	/* Compute rdt_min_closid across all resources */
>  	list_for_each_entry(s, &resctrl_schema_all, list)
>  		rdt_min_closid =3D min(rdt_min_closid, s->num_closid);
>=20
> -	closid_free_map =3D BIT_MASK(rdt_min_closid) - 1;
> +	closid_free_map =3D bitmap_alloc(rdt_min_closid, GFP_KERNEL);
> +	if (!closid_free_map)
> +		return -ENOMEM;
> +	bitmap_fill(closid_free_map, rdt_min_closid);
>=20
>  	/* RESCTRL_RESERVED_CLOSID is always reserved for the default
> group */
> -	__clear_bit(RESCTRL_RESERVED_CLOSID, &closid_free_map);
> +	__clear_bit(RESCTRL_RESERVED_CLOSID, closid_free_map);
>  	closid_free_map_len =3D rdt_min_closid;
> +
> +	return 0;
> +}
> +
> +static void closid_exit(void)
> +{
> +	bitmap_free(closid_free_map);
> +	closid_free_map =3D NULL;
>  }
>=20
>  static int closid_alloc(void)
> @@ -182,12 +193,11 @@ static int closid_alloc(void)
>  			return cleanest_closid;
>  		closid =3D cleanest_closid;
>  	} else {
> -		closid =3D ffs(closid_free_map);
> -		if (closid =3D=3D 0)
> +		closid =3D find_first_bit(closid_free_map,
> closid_free_map_len);
> +		if (closid =3D=3D closid_free_map_len)
>  			return -ENOSPC;
> -		closid--;
>  	}
> -	__clear_bit(closid, &closid_free_map);
> +	__clear_bit(closid, closid_free_map);
>=20
>  	return closid;
>  }
> @@ -196,7 +206,7 @@ void closid_free(int closid)  {
>  	lockdep_assert_held(&rdtgroup_mutex);
>=20
> -	__set_bit(closid, &closid_free_map);
> +	__set_bit(closid, closid_free_map);
>  }
>=20
>  /**
> @@ -210,7 +220,7 @@ bool closid_allocated(unsigned int closid)  {
>  	lockdep_assert_held(&rdtgroup_mutex);
>=20
> -	return !test_bit(closid, &closid_free_map);
> +	return !test_bit(closid, closid_free_map);
>  }
>=20
>  /**
> @@ -2765,20 +2775,22 @@ static int rdt_get_tree(struct fs_context *fc)
>  		goto out_ctx;
>  	}
Not relevant to this patch, but some of the code around here needs improvem=
ent. Maybe consider fixing it together?
       ret =3D schemata_list_create();
       if (ret) {
-              schemata_list_destroy();
-              goto out_ctx;
+             goto out_schemata_free;
       }

Best regards,
Shaopeng TAN

> -	closid_init();
> +	ret =3D closid_init();
> +	if (ret)
> +		goto out_schemata_free;
>=20
>  	if (resctrl_arch_mon_capable())
>  		flags |=3D RFTYPE_MON;
>=20
>  	ret =3D rdtgroup_add_files(rdtgroup_default.kn, flags);
>  	if (ret)
> -		goto out_schemata_free;
> +		goto out_closid_exit;
>=20
>  	kernfs_activate(rdtgroup_default.kn);
>=20
>  	ret =3D rdtgroup_create_info_dir(rdtgroup_default.kn);
>  	if (ret < 0)
> -		goto out_schemata_free;
> +		goto out_closid_exit;
>=20
>  	if (resctrl_arch_mon_capable()) {
>  		ret =3D mongroup_create_dir(rdtgroup_default.kn,
> @@ -2829,6 +2841,8 @@ static int rdt_get_tree(struct fs_context *fc)
>  		kernfs_remove(kn_mongrp);
>  out_info:
>  	kernfs_remove(kn_info);
> +out_closid_exit:
> +	closid_exit();
>  out_schemata_free:
>  	schemata_list_destroy();
>  out_ctx:
> @@ -3076,6 +3090,7 @@ static void rdt_kill_sb(struct super_block *sb)
>  	rmdir_all_sub();
>  	rdt_pseudo_lock_release();
>  	rdtgroup_default.mode =3D RDT_MODE_SHAREABLE;
> +	closid_exit();
>  	schemata_list_destroy();
>  	rdtgroup_destroy_root();
>  	if (resctrl_arch_alloc_capable())
> --
> 2.20.1

