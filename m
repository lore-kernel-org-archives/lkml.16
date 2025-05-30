Received: from esa4.fujitsucc.c3s2.iphmx.com (esa4.fujitsucc.c3s2.iphmx.com [68.232.151.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122201E519;
	Fri, 30 May 2025 09:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.151.214
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748596684; cv=fail; b=UCe2Kixx9iyktQgY9D7whX2kEacG0fRL74zVdJMq0n7U9RVtmQeWSTfmppufa4t3HYCTYDWTEUW/Z31xigZYHzvdgQLLmEDOGM4EGH6x488kOmX+xQ9HFakPjTMu0iFKUR1sAp5+bamZH0X/7i9KYzELd7gkoiGLZkQOmn+5NEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748596684; c=relaxed/simple;
	bh=SKvxegT+PyCyvoStONhOhNJT+7/LMJzlqPlHEv2Juio=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hscF56mKtMRRhlBhCqIBfIDKxzK2UC4ybSTtAKxS4EeWFUIClItvP0/hnmec4Y8FtzCtua+YG+xkxCBoDwTYwmv6X6JovcFIBjXS/4eo6in08+eLqATu6UoBb/8auvKF6bh2lp6ZbAJKC2aCm8v2GKi4t7n7dzcaY8cCrMVG2pE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=ZWmw5mEU; arc=fail smtp.client-ip=68.232.151.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="ZWmw5mEU"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1748596682; x=1780132682;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SKvxegT+PyCyvoStONhOhNJT+7/LMJzlqPlHEv2Juio=;
  b=ZWmw5mEULqRGVVQV3y6OgQ/gWTn1fzs8LVwKRhAYASzoOG+Dobw0KupJ
   1HsghB94W31nvSs2Hnmjro8a70LwlTUqifMq8KGxyeUQLrOY9sYDaPB/D
   lFkWUIiUF3azid75i/u4RPPTCHmQ9qVefJ+K+9aoDi1QKU480dTnMczCI
   jYnpYYF7hip3rvTywo3bSwVWQkPXrdWhEmsuTqapr2TquwQC3Fl7aOvoT
   K7/dqmlErV1jCWCN3j64pXlwXgfdkTjbE1z3VbyMHDTAqe5yOmsTaW720
   AgIs4ZN99JjcljBc4DaRiGBEpfCB6jLfAbXsgFCluTMKFdyF5GHhlcbl4
   A==;
X-CSE-ConnectionGUID: 6IrGqsUcQPuknZREzKicnA==
X-CSE-MsgGUID: 4cbDbAJITx+Rj592nBykeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="70040803"
X-IronPort-AV: E=Sophos;i="6.16,195,1744038000"; 
   d="scan'208";a="70040803"
Received: from mail-japanwestazon11011011.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.107.74.11])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 18:16:44 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5IEIhzdkbp9sS8ZeyIU+Tg89Xc1KDypCrELRMs/W+GCu4WFFo0jLv2CuaCAUoFOolpWMRopo9crk4h1Bvx77JNgAjmtLkwJeKrid6+0no+MDBqRC8gWt+qiCIzdha80gmATncpfB+0jq8AMK0/eB3Kn0XkNeOAnZlBNFXU8H1XYJwrm0rrZuE9SXD80BN7ztnIRyctkOsJF7neFTl8YOEnjkOS8jH6NOZqZt3M0jIHp84eQ7dRo/wXoGNru1NHVsR6YHTqJ11GUpRmi58WBjLIO7LUQUXPqLySkUtI5WuEHr/OK3XkaKz7TMl2GXh8CctZfUwO4/jkeve4lOX2cMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKvxegT+PyCyvoStONhOhNJT+7/LMJzlqPlHEv2Juio=;
 b=qNEuEM0YYmxNgCU3tQlescjxqHhB7wSC7bmxi++x9UTKyydcW/hJVfWMpOxswfaB1ZGQti8qh1zfwDiv85rb8IRAwZtWcYqGG4lpHFh7bBQzGAPY/wruSwAQtiRGJRKK2DVz0HeGIXl90lMLF3sGp5E7zX0citXxzWG/DncwZCKVn1zRHNW3jio1PkKiIuiCtU+PRJ2kfx7KxkOya1xPEesQXk2Qi3q0LOKHTOPX/WNkcBX0Ng0wx3sXPveIM4y+xdlk3zRhzk7QlkQMlC/voiXS2+xKRgW7bqrg+VEuIJyPnqAY/Iit+wfCN0YbrI3V7Nhr/ydPTA2KjgQPdosGdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYYPR01MB6715.jpnprd01.prod.outlook.com (2603:1096:400:c4::5)
 by OSRPR01MB11520.jpnprd01.prod.outlook.com (2603:1096:604:232::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Fri, 30 May
 2025 09:16:41 +0000
Received: from TYYPR01MB6715.jpnprd01.prod.outlook.com
 ([fe80::26fa:7a5:1339:e98a]) by TYYPR01MB6715.jpnprd01.prod.outlook.com
 ([fe80::26fa:7a5:1339:e98a%5]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 09:16:41 +0000
From: "Koichi Okuno (Fujitsu)" <fj2767dz@fujitsu.com>
To: 'Jonathan Cameron' <Jonathan.Cameron@huawei.com>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Bjorn Andersson
	<quic_bjorande@quicinc.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
	=?utf-8?B?IE7DrWNvbGFzICIiRi4gUi4gQS4gUHJhZG8iIg==?=
	<nfraprado@collabora.com>, Thomas Gleixner <tglx@linutronix.de>, Peter
 Zijlstra <peterz@infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 1/2] perf: Fujitsu: Add the Uncore MAC PMU driver
Thread-Topic: [PATCH v4 1/2] perf: Fujitsu: Add the Uncore MAC PMU driver
Thread-Index: AQHbZ9NsO46uwuCehEGOGiHfWDaHmrMvolwAgAWk0TCAaP36IIAAYTcAgE0NuEA=
Date: Fri, 30 May 2025 09:16:41 +0000
Message-ID:
 <TYYPR01MB6715C2B9828B7921933C64B2C161A@TYYPR01MB6715.jpnprd01.prod.outlook.com>
References: <20250116045911.3382537-1-fj5100bi@fujitsu.com>
	<20250116045911.3382537-2-fj5100bi@fujitsu.com>
	<20250130170422.00004c6f@huawei.com>
	<OS3PR01MB6903DC3738709A4536A62613D4F52@OS3PR01MB6903.jpnprd01.prod.outlook.com>
	<TYYPR01MB67157AE764B00DEAC97D4EAAC1B62@TYYPR01MB6715.jpnprd01.prod.outlook.com>
 <20250411092332.00004b73@huawei.com>
In-Reply-To: <20250411092332.00004b73@huawei.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9NDQzODQ1MTktYTYxMS00NTk0LTlhZGYtNTc0YzI1YzA0?=
 =?utf-8?B?NmMyO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA1LTMwVDA5OjA3OjM1WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?Q?81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB6715:EE_|OSRPR01MB11520:EE_
x-ms-office365-filtering-correlation-id: bc7cd9b8-f5b7-44cc-9e03-08dd9f5ab0a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|1580799027|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dURjR2k5QnR1cjBsS2VhVXhGdzB5Um1UN2hDaEZNeWwrbzdldWpFVXl5K21F?=
 =?utf-8?B?eGlIVjJvbmdyVWRtdE93ZUJhYVpvMERudno3aStFY0lkVC8ybFhsSlR0aHMr?=
 =?utf-8?B?bTV5M3NtZ0JYUFpZZ0R0ZW9lcnM5TUZzbW4zV1cwa3FUcUttNGNVN2MzSVdM?=
 =?utf-8?B?VDVFYldVTEc4QjFtbjdqdGFBM0dLZnRLUnVFbnlNcEFjN0RTK3J1Z3dQcWdr?=
 =?utf-8?B?ZnQ3bWd5eTFYemRpOVUvRi9qV0F0eHl5dFh6ZitIMk0yYm9qT2FtMmZadldu?=
 =?utf-8?B?NHFIK2JheExLckZVNmxtWFY4bGRncUZLZktNdTdlUng1TmpEdFZQMlQrWHQv?=
 =?utf-8?B?TVkySmxKNnZNT09CU2g1TlBYcDdVSExOR21LN3dWaFZhOHM5ekZrWDNvTXd6?=
 =?utf-8?B?UUxnTGovUWovUFB5Z0l2WG1CZ0YwbnExcXNZU2Q0U3BrRTFyYmJYdWQ1T0Q0?=
 =?utf-8?B?cVVFRVpFVmdKaytYV0VqR045Q3hoa0VVS2llbExqWm01WkpPdjNRMm45TXRE?=
 =?utf-8?B?akNyaWFrYVU5S0cycFo1ZnZFeU9uSm9WU2ZPcHdLendUWlF5VmtBdGx6T2Jv?=
 =?utf-8?B?WXdQc0RBN3BZQUhOSHBJQTF6OUVuUGdaZ25HL1ZrMG9PeEdsakpvV2lhdFB3?=
 =?utf-8?B?WVl3T05WRlNpK0gwRjVlaGVhbjN2bzBhdXRBQmdMb00rNkdGenJ4K1hWMnRa?=
 =?utf-8?B?Y0x1bzdSUndoR2xxMFF3SERBKytRMGJhUVNvM0FHNmdtMm1qT1Q5SG43NlJS?=
 =?utf-8?B?eWtMaW90VzZrRHZCTjNxVDc5blRKdmM4dVBQcjF6b0RHVHlMMlkxTFR6Nlph?=
 =?utf-8?B?V29qK0FrTGNrazJyMHNDUUFnalJEZFZHNmhsdmc0WkcvWGVlalNuK2l3N0R3?=
 =?utf-8?B?NFZyTjMvcUYzVkVVK1RPeGN3amE3UG52a295eWd1bUtxRFp5RkRtZDJ1SzRv?=
 =?utf-8?B?NXVnMkxrdytCNUl2U21iR3BPczNOMTJ3NGFTZHJhZkRWSEtocXVETkpBSndX?=
 =?utf-8?B?UEJ4VjVIVVV4OXdqWkQrU2hOSnNiR0ZxTWthWFMyZFBnTFlhUHcyeWdmclQ1?=
 =?utf-8?B?KzY3dVJxc2Vic2lsTzRVaFJjb3A0QjZObkhkR3I3d1NyaFF4aXZKWGRFUlc4?=
 =?utf-8?B?QnUvL3Ywa2xEbzQrK2dZWno4SG04bVZ3YmdIV1B3bnU1dmhFeDhNM0JybWNE?=
 =?utf-8?B?WHVsMTBnK3FUZHZxMXVEanN0QmRWTnR4c0xrSzQ1UytDMEN6d250VUpwdmFy?=
 =?utf-8?B?NldxaHNkd0hlZUlCRkR6ZitSa20wWWdDYXFadm13ejRIcG1tcTdJSXA0Nktu?=
 =?utf-8?B?T21lZ2lQeC9BZkhKdTQzZXVHWWNaaW90NlJOOHkyRmpBL2E0SjhDVURpWkdw?=
 =?utf-8?B?ZU5lYWc1SWtXdENlcGh5WUJLYmVUOG5yckR0MFJNamo1dWFjR201MVVBckhU?=
 =?utf-8?B?VUhNNWdER3F4RS8yQ0ozMWhYbjZ3aWI5Q3NSWG96MkN4UWpDVUJDZ0tlM3Fr?=
 =?utf-8?B?MWV0N2E0Q1Z6RzNuNjVod2F4REtlMllzZlhLaldXd1FKbnJwa2kyQWlkRmRm?=
 =?utf-8?B?enZDSnBSZ0xRaEV4Sm9lUGdSWko3cXJjbnA2dTdSSGMrZ1h3NEx2aDEzSmVL?=
 =?utf-8?B?M2RjTTRXSlJUN29Ddmxld2xXWXdFQVA0bjZaMjhGZ1ZkbXdWemJYTy8weXV2?=
 =?utf-8?B?cGd4SDRrRThEaGZrWnFvQVZuZnlxUGZoQkxQeWhJZHF1VmVZbVFkb09kUkNq?=
 =?utf-8?B?aGkySVJ5eGVkcVdZOHZadVFxL1R1VVdBSFZBeENwbjZzVWZiQWJwcUVBQjdu?=
 =?utf-8?B?Ulp6QVpYanRvTXNIRzJOaVdnbGVoeHZONlpmOWlpUzZvZUJpY3V4THJRMzl4?=
 =?utf-8?B?aXVVbjh6bkV1VkFhTUoyYlJQblZVazJ6UWR4c3g3MFBBREVvREhmUHR1QmRr?=
 =?utf-8?B?U3VGMFZlaXdZRFpVZmsvRVNCZDMyaU1qbDduaGlLdnhCa1VwNFRoQk1KMFpv?=
 =?utf-8?B?V3ZDL2MxKzhibEhXS1I2U0RRV0M3ZWcvUWw4SGpIYjNkUVByUzdzMlZEUnR4?=
 =?utf-8?Q?ds4v3O?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB6715.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QXRlYm5LRlFBdGxzdDhZWmUrZHhqMHhua24rLzV0QWVWUVQ2R2FuVzFOVFFa?=
 =?utf-8?B?NTZ6eWVUL01rSkc4R2pEYlRqdUVONUhGc3BtRk5nM2lnOXllb0VyTmRScGpV?=
 =?utf-8?B?ZUFGMlFoRW5XaVozN0VVQ2sreVJTKy9zOTc4eWpPQktMWUF3cEZvZk5QZnpE?=
 =?utf-8?B?Y3FWSEdzRTV2eWRxWFlTOWRnTk1qKzlKVWZoZ3hpdmZaYlMrV3FzcTFwL29H?=
 =?utf-8?B?OWN1WEFSWFBPTGZ2OVc3U0thTkZWWEcwankwMG82R0w2R0lNeXdMMkhzZitk?=
 =?utf-8?B?Y3ZnYjk3Z0E3Z0xJRFdUQ2lzTXdSYm9Xdit0aU0xNHYyK3RUdlA0Vjh4eVVP?=
 =?utf-8?B?SEZja3lFVjV5bUtXQ3IyanJMN1FhTmhSMzZKSithT3dTL29CV3pCdWZ4TkQ2?=
 =?utf-8?B?Uzh0MWxUS1RoL1VPaDJzWmw1dGRCSnl4bFVpN3pxSEpuL2lpUU5HWG0vUGc3?=
 =?utf-8?B?em9JZjlLeGs1dlhDaDIzbjN2MkJ0Q2JrK3k4K2ZJaHRmbUhxY2NuWEY3aEJI?=
 =?utf-8?B?MzhaWlVpb1JMcjdpRWNXUUU2Rlo1dThRTnNJUDBXelliYzRZVWh0dTZUZDU3?=
 =?utf-8?B?SU91cUlJNWtHNzIyWWNoZEJsU0luZWVjbkFXbDNjdVdObUFGWXRFZnljMkRm?=
 =?utf-8?B?aXFwcE9NT2p2cFFzdmpmSmJKWExISERkQWk2aWxuME5aYUQ0S0FoQjgzbHY4?=
 =?utf-8?B?aUxhdEJlWThoYVpzMHF1VDF2SU1jK29kamduQmlJaWpueHM2RHBIZ3JjcU5T?=
 =?utf-8?B?SjZwUkNESi8vdHZjTGZPb04xa0l4NFEvcXZlNFhxRTNweTRRL1BqZ1VMbW5W?=
 =?utf-8?B?aHlxYjBEUHVFN3VxOWJrZWsyUWVmemdkMGIxeGRGcDNraHdISk5iZnc2SXIw?=
 =?utf-8?B?U2FDZGhTbEU2YUpydzRobC92QUdnNnJKd2tOdGIrWVM1ZEF0R3BhRmhFVzQ1?=
 =?utf-8?B?WFFLcWIwODVFUklXcDJ4ZXRrb25GS3RBQ2luejl0SnNDbmw0dnVzTWVVUkN5?=
 =?utf-8?B?RDFrRGViZnQwYmVLZ2MydUhwWEFZSWhCRHJJQ3JyVFp4R0NXcEFsWmhSQWtw?=
 =?utf-8?B?VXN2aHQwNENBRnc2SWpyNnIvOURMbW92Z3hucmxmZFFsTlNCVFFnSXVLYmc5?=
 =?utf-8?B?RGZ1Q1g3UHhBS201MXZpdjNhdkEyRlIyaE1kTmhHYTZpVysxSWZ0WUdjU2Iz?=
 =?utf-8?B?SGNNZzFyT1N2YzJ1RnRSUUtUN3BHZTd2NHYrUHdWWkYwa2lRRzBialgxcGc2?=
 =?utf-8?B?WUg2K0VvNDNNbVg5cVg2V1hiZFh4dkNobjh5NFcxRTY3OXhGcmxnL1dlaUFR?=
 =?utf-8?B?MHpZTkwwdzlXY1p6NGlaMGdKd05jYnU0MVZnYzM5dXBTWGIvcmJ1QjB0bUZ3?=
 =?utf-8?B?UkJoaVR0SXh5RzRyQ0xZbnpOdWVQUkRyZmFnU0NXZ1p5bGFNVW9mZ2dOYVVO?=
 =?utf-8?B?Q00vVDM2RytPcERpQ1dFdTJCUGRtZmZ6RTYxWjRrVjh1T3ZIQVN0THVMbmtP?=
 =?utf-8?B?aFQzQkU1YXRzQ2pWT0tzanVrMFNON243NnJCZEhyckUwK1N1Nk1VWGNFU2p1?=
 =?utf-8?B?TXArL24zWTA5dnowSjBzS3pFL3NDSjJERlAveTF4WFQ4cW5jVG1DMlhkSUs3?=
 =?utf-8?B?MUpISFpwYy9YQXFpRlMrUlVOeXF2dTBYa0hEcDJGUmZabkZySjdRSTRUQzhq?=
 =?utf-8?B?cUVCTVFHT0tkVW1xUm4wcVBqRFc5TllKSWYwdk1RMVlmaDVMcitmN0ptMDBv?=
 =?utf-8?B?RVVaQThnOEdiK0pQbFJuUzlaeXZpMUVFMGFkaUU1SEM5b0toMklTemNFQnFT?=
 =?utf-8?B?Rk5RQmJXMDFoUHM2TXkrUzB2ZHRNeUFocTNLOWM3a241QnhkNEtLMFF3eUt6?=
 =?utf-8?B?WjdhcjVVN0luTEpmUnF6clZwbS9BNVBURyt5c2NLclFMdmgwVHFxR3kvZHYx?=
 =?utf-8?B?ZnFvenVYWHNBY3kxRXlFR1REZzBJMDZ2YlJrcDJzZEZGVG9SeWpLZmc5VEov?=
 =?utf-8?B?UmJ6Tml6VFp0MUZlMXJTNWM3VW5pNzBlZDNzcWNleW5seHNaaXNhOWp2SkJR?=
 =?utf-8?B?TDYwTFUxY2s4RnBLN1U3bi9hNXo0VkUzWk5LNlBlRTdwVjFxenFZQ1ZLMlZJ?=
 =?utf-8?B?SzF1UHhMSTZUb3JkaVJhb1JXaUlkN3grdk9zUnJ0amxRbDZDdUxHY01pWGxm?=
 =?utf-8?B?dUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	I545gwo3tTW7o3BCkJP48ThX6q92kSuPwUQ62DM+3Udnz4T7i0pDwaDMw4OIQ+XRvx3DYMT7SR9NGRnB2B2aKAYIQEv6wpjjK0cS7e6k60Z5tHQSM2IOezPkdlAg87yL9h6v5deY06CspjRSQHbIW30DE1R9j9zvmYnUdDLEDTzf7UdtyCh9reulYdKpCNTzuBQWsXukayknGy0qDHLRrLEK1dehjt6RgkLv7JTJ4kB0D1Yizbbg3MetbVYbrEIgpWmNoxmYlqUlTGbxJ5wxXu+yLhGreQFU7YyICo4IdsyvCKlh8qDPgmqpCcO0BFo0M1yvxKDOSWDabZ4irmXwDr3onRHxe5xisheTw5IXXCYxVva16GjmnrMEXKE6ShQeg0LAFpZpochtB9dwiDJwTr7pk/oXjXkuPuaoVe2UpTQj6Go82xign+akc/jYvKF79IvoVbMJaiRpRLROGVTZAPK3xNLXg6G6o26xuzIRXC9Dl7tXG1e7VHYAyXhQfK3EsIgoijEYRUeH72qhsc1W+i04FZhjDAzIiTaxI7tl9J/OeEzdzwM085cTOF544DBpvZS15M1w4RPpYbs842BnsZHceyYFSo2xUGfzFIz4j49WSD4GBu3rWnWlm6gE9dIh
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB6715.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc7cd9b8-f5b7-44cc-9e03-08dd9f5ab0a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2025 09:16:41.5741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qw7acpajw+P4WunBKdYgw/CqNjGG0XR+X3K1PyZIRcVFjEFnnvO2pUcmwWmrDMlA7/ikC8exLmnK8rXixmtbLNDQ44mriKnN8bGbFW+dH6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11520

SGksIEpvbmF0aGFuDQoNClNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseS4NCg0KPiA+IEhpLCBKb25h
dGhhbg0KPiA+IA0KPiA+IFNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseS4NCj4gPiBBbHNvLCB0aGUg
cGVyc29uIGluIGNoYXJnZSBoZXJlIGhhcyBjaGFuZ2VkIGZyb20gRnVydWRlcmEgdG8gT2t1bm8u
DQo+ID4gDQo+IEhpLA0KPiANCj4gDQo+ID4gPiA+IFRleHQgaWRlbnRpY2FsIHRvIG1lbW9yeS1w
d3JpdGUtY291bnQNCj4gPiA+ID4gd2hpY2ggc3VnZ2VzdCB0d28gdGhpbmdzLg0KPiA+ID4gPiBh
KSBuYW1pbmcgaW5jb25zaXN0ZW50LiAgV2h5IGlzIG1hYyBtZW50aW9uZWQgaGVyZSBhbmQgbm90
IGluIHRoZSBuYW1lICANCj4gPiA+IGVhcmxpZXIuICANCj4gPiA+ID4gYikgVGhpcyBjb21tZW50
IGlzIHBlcmhhcHMgd3JvbmcgYXMgSSBhc3N1bWUgaGFzIHNvbWV0aGluZyBtb3JlIHRvZCBvd3Rp
aCAgDQo+ID4gPiB3aXRoICANCj4gPiA+ID4gICAgZW5lcmd5IGVzdGltYXRpb24/ICANCj4gPiA+
IA0KPiA+ID4gV2UgYXJlIGN1cnJlbnRseSBjaGVja2luZyBhbmQgd2lsbCByZXBseSBsYXRlci4g
IA0KPiA+IA0KPiA+IEFmdGVyIGNoZWNraW5nIHdpdGggdGhlIGhhcmR3YXJlIHRlYW0sDQo+ID4g
dGhlICdlYScgZXZlbnRzIGFyZSBtZWFzdXJlZCBhdCBkaWZmZXJlbnQgcG9pbnRzIGFuZCBtYXkg
dGhlcmVmb3JlIA0KPiA+IHJldHVybiBkaWZmZXJlbnQgdmFsdWVzLg0KPiA+IFNpbmNlIG1lbW9y
eS1wd3JpdGUtY291bnQgYW5kIGVhLW1lbW9yeS1tYWMtcHdyaXRlIGN1cnJlbnRseSByZXR1cm4g
DQo+ID4gdGhlIHNhbWUgdmFsdWUsIHRoZXkgc2hhcmUgdGhlIHNhbWUgZGVzY3JpcHRpb24uDQo+
ID4gSG93ZXZlciwgd2UgaGF2ZSBkZWZpbmVkIGRpc3RpbmN0IGV2ZW50IG5hbWVzIHRvIGFjY29t
bW9kYXRlIHBvdGVudGlhbCANCj4gPiBmdXR1cmUgZW5oYW5jZW1lbnRzLg0KPiANCj4gQXMgYW55
IGZ1dHVyZSBlbmhhbmNlbWVudCB0byBtYWtlIHRoZXNlIGRpZmZlcmVudCB3aWxsIGFsc28gbmVl
ZCBhIGNoYW5nZQ0KPiB0byB0aGUgZG9jdW1lbnRhdGlvbiB0byByZWZsZWN0IHRoYXQgZGlmZmVy
ZW5jZSAoYW5kIGhlbmNlIGEga2VybmVsIHBhdGNoKQ0KPiBtYXliZSBpdCBpcyBiZXR0ZXIgdG8g
bm90IHByb3ZpZGUgdGhlIHNlY29uZCBldmVudCBmb3Igbm93Pw0KPiANCj4gT3IgaXMgdGhlcmUg
c29tZSBvdGhlciBzdWJ0bGUgZWZmZWN0IHRvIGRvIHdpdGggZ3JvdXBzIHRoYXQgY2FuIGJlIGVu
YWJsZWQNCj4gYXQgdGhlIHNhbWUgdGltZT8gSSd2ZSBmb3Jnb3R0ZW4gaG93IHRoZSBkcml2ZXIg
d29ya3MhDQo+IA0KPiBKb25hdGhhbg0KDQpBZnRlciBkaXNjdXNzaW5nIHdpdGggdGhlIGhhcmR3
YXJlIHRlYW0sDQpkZWxldGUgRUEgZXZlbnRzIHRoYXQgc2hhcmUgdGhlIHNhbWUgZGVzY3JpcHRp
b24gYXMgYSBNQUMgZXZlbnQuDQpDaGFuZ2UgTUFDIGV2ZW50cyB3aXRoIHRoZSBzYW1lIGRlc2Ny
aXB0aW9uIHRvIGEgZGlmZmVyZW50IGRlc2NyaXB0aW9uLg0KSWYgdGhlcmUgYXJlIG5vIGlzc3Vl
cywgV2UgcGxhbiB0byBzdWJtaXQgdGhlIHY1IHBhdGNoIHNlcmllcyB3aXRoIHRoaXMgZml4Lg0K
DQpCZXN0IFJlZ2FyZHMsDQpLb2ljaGkgT2t1bm8NCg==
