Received: from esa10.fujitsucc.c3s2.iphmx.com (esa10.fujitsucc.c3s2.iphmx.com [68.232.159.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFC420E032;
	Tue,  1 Jul 2025 06:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.159.247
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751350520; cv=fail; b=lw6Rudf+UdvQRqW9zxmsdmXqwCoiRBT+dOeCwK7b49fMr5v4jgvAtbCfRkNCiofMwzPgL2NIZEvR2bn2Jf/wdB0sKSQj9YFBmkojI4kacQgvF+ctpx0mGUDq3jQfkHDQSqgfn8Dh9rYVUaSxXcJ6wOG9xQyAmcb8/YlC25hOSsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751350520; c=relaxed/simple;
	bh=DKNardeN6uyGBjRgaSG//MfTiNLvWfVlBCj9wDcpg/Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DcLyIn14+G70oiJQw25J0x1AeoBOt/dxlB3lDrewiRX8C25s9XCT+peXqQCb8QX9eYQXL6w3LpBVRm6irEsLLv9iwpmlyiI9Cekzy55862FBTzqs3pEJq7GRZNpeWulDdQBEbQb21373Ra5kGPN5RxOMZR5ybmRX2Q9io1u9n8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=Un+H965S; arc=fail smtp.client-ip=68.232.159.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="Un+H965S"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1751350518; x=1782886518;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DKNardeN6uyGBjRgaSG//MfTiNLvWfVlBCj9wDcpg/Q=;
  b=Un+H965SKlQWnWDxFozcBZDyjsqFm2F6Suh1WIyvcKlLGF2HAlRPltOh
   i4AKu/NnAK4zpXJ4feaFIbIFKZwJl+hxPMIPmZNKChfB2r5u7b93n3fkZ
   ltbdzxRBefGvKtgevOJKRz7AllJT/vHbxqTEZbuAZLm/DIydFtykBSwzO
   ha24/KRZY+XOb84oYoi33omWyjs44hFjJ5igFCqoKxm6Y1idmbs/i+JxE
   93tY6PBvZjVVt2RCt0ZbTe4rjJ1380Q7i7okn1tNqcLhLETtdSKNN7GnZ
   bF8C6+ixrnSYZvgKSjXK/OJJh21OmycQS9bmiZgjljYTo8xHljBg95Gw5
   w==;
X-CSE-ConnectionGUID: rbaTi9zXTNGNQqUEaY+E6g==
X-CSE-MsgGUID: 4n8iOj38TueZVhxNMoRPXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="160312565"
X-IronPort-AV: E=Sophos;i="6.16,279,1744038000"; 
   d="scan'208";a="160312565"
Received: from mail-japanwestazon11010056.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([52.101.228.56])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 15:14:02 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i5AV3UPxUT8th95n1KhlYQzUHWLcpWq0USXJzwqDUcd8fsxCPJt5a2/8UsFyJFWVlY147uyAabIiidyX+cw427xvBT21xRQ5c8oUWz2wR7z7UYJhbequ7MtEYZHhG47uDFyeQ6VjtZwe0zaisvezrJQx5tqShyTQ0QLIRRlGV/twzuB6y9AWAAQsFgpj+tH5PXlaRg5iAJQdqyhP8PfmfWSQKD1vWfiPHyolKTWCxPTnMjjiaCxy7eWvdx1bbLbQ5zPwRmciwaQO+o4Nb29hZ2vf/T0u+5sopSJTundllXg8mGvfTw+mqTfeYnpPtAjpGydwrYeoT1sf5IaUNzBLDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKNardeN6uyGBjRgaSG//MfTiNLvWfVlBCj9wDcpg/Q=;
 b=eszHrKu/UIca6F5QTuF99zeJ8lhqePTAipE8MK9JL1ebthWViIete1yBx62UMxGTCWyJ4CYzImRG+TWpO/nYEEe1TVXTCJx7QN2K2z0Kw91OZIUaFatA5bDrKAbW9VNbZz6P2a7EiCC4Lo8f4STxvg/AvFNuP9V8A64ILlTq/5UsWlhCeAh+L032munpVPp5EtrQ0Cq+0777zimkglT5Pd3IYVsvLGwHOuGSaUcOL1DTqokPdJsU2B4WlrKEqXt+UsR8E0PYC3FeDC6wzVKS2L3tHXKhMGuOqdNR5Ye4pFlR2FXX6GVSy5OBGggWKrG9dVGkr2/x3Fubp298AFlXhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYCPR01MB6717.jpnprd01.prod.outlook.com (2603:1096:400:9e::11)
 by OSCPR01MB13241.jpnprd01.prod.outlook.com (2603:1096:604:34e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 06:13:59 +0000
Received: from TYCPR01MB6717.jpnprd01.prod.outlook.com
 ([fe80::182c:bcc4:3f87:81c7]) by TYCPR01MB6717.jpnprd01.prod.outlook.com
 ([fe80::182c:bcc4:3f87:81c7%5]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 06:13:58 +0000
From: "Koichi Okuno (Fujitsu)" <fj2767dz@fujitsu.com>
To: 'Peter Zijlstra' <peterz@infradead.org>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Bjorn Andersson
	<quic_bjorande@quicinc.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Arnd
 Bergmann <arnd@arndb.de>, =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
	<nfraprado@collabora.com>, Thomas Gleixner <tglx@linutronix.de>, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Koichi Okuno (Fujitsu)"
	<fj2767dz@fujitsu.com>
Subject: RE: [PATCH v5 2/2] perf: Fujitsu: Add the Uncore PCI PMU driver
Thread-Topic: [PATCH v5 2/2] perf: Fujitsu: Add the Uncore PCI PMU driver
Thread-Index: AQHb33KqFUG+lxKw4k6t4oMV/ko0g7QHKGsAgBW1nDA=
Date: Tue, 1 Jul 2025 06:13:57 +0000
Message-ID:
 <TYCPR01MB67177BF90FEBAB9E20463012C141A@TYCPR01MB6717.jpnprd01.prod.outlook.com>
References: <20250617102819.3685543-1-fj2767dz@fujitsu.com>
 <20250617102819.3685543-3-fj2767dz@fujitsu.com>
 <20250617103618.GT1613376@noisy.programming.kicks-ass.net>
In-Reply-To: <20250617103618.GT1613376@noisy.programming.kicks-ass.net>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9NzU1NWYwZDQtYTNlMC00NjJjLWEzYTYtNGFmNjY5OGVh?=
 =?utf-8?B?MmE1O01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA3LTAxVDA2OjEwOjA2WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?Q?81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB6717:EE_|OSCPR01MB13241:EE_
x-ms-office365-filtering-correlation-id: d8c98b9b-e679-4f33-d952-08ddb8667706
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|1580799027|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZWNaekcxWU8zeFJMVlhiVTdGNllBVFcwU3FXZUg5blZCcWg0VUVNdk5pZDd5?=
 =?utf-8?B?K2pkNTVtQ09NaG01M2xOaTRVOFovTEdQai9CQVpiMjBxMUxUeXVtVXlFdE1M?=
 =?utf-8?B?bVJDL0IvQS9HNUJDWUNKcW90enVRNTFiUVVUZEdPWWwvaGQ2eGxacWk5N2ta?=
 =?utf-8?B?ak1hTUFsa3dWdlk3UW5sc3NiN0k2bWMyYlBJUXhjZEtSbG9WcEdZZWozMnRJ?=
 =?utf-8?B?NmloWlYzcDc4Q0lJcEt6LzEyTjVlZnJBM0l6bGIwOTdWUEZ4VnI2Y2VyUTF5?=
 =?utf-8?B?dnNHQWVXWjcvamRMc1VGQ05jUlpHNlpnQUlvTUpBVGtvWmdpaFZqcjIyamdG?=
 =?utf-8?B?Q1IvQi95Q0UxWS9mMHhtZDBxcnVDM3ZuV21SeE5pZDZkbzFxK29VblBvS3Rr?=
 =?utf-8?B?TEVuMy9iRGloejZOYjRSVnlncDZSY0dHb09JWmdQcisvTFhLWXlNM1FBK0NL?=
 =?utf-8?B?bWpMV1Fsa2YvZ0VWMVJwR2ZaSHBQVnZ4YWhSNkhiWndLckNIamhMcHZ1U0px?=
 =?utf-8?B?SXhjQUhHVW1rMU1vWU1PdXQxRDN6ZkRxa1ZWS1hjWC93dTlnMHNCLzh6bXpZ?=
 =?utf-8?B?VnIvSjVtZWo4NnV1aGlxQzM2RzBadjltVXVLODdoZnRId3krbmxRTGJtRXdk?=
 =?utf-8?B?RHJSM2FjYlREVEdKdEpmN1Q5WUozNDcrQnBaMy9jZk9ET1l0djgxSjhSNjV6?=
 =?utf-8?B?dE9CbkRLWU5tZmNTMWJPc3Z4MUxnd1dxQVBEcmp6T202L2svelpmc3lSR1Zl?=
 =?utf-8?B?VkROWXdlNk0xdVFiQW96S2tjNUg0ZHRGUUtzY3k0dFpEUzR0UU8xRFE0M29z?=
 =?utf-8?B?Ly81S3dXK050MUVHQzN6OC9ydVdRYm9UaHhZSUE5QnkrZHk0T05lL2ZFQ29s?=
 =?utf-8?B?Nnl1UWZRUHZWeXc0blZsWVNDby9DSFFlYktQMjc1RVMrSVl3Z3BNb09XY2dK?=
 =?utf-8?B?Umx5bkpEaVhreTh3WHYwYi9KV2NUZHMraVJKQkp2aU9WaUlaSnlTOUUvaFVj?=
 =?utf-8?B?M0ZnVDNSN1p5TlpIUllPU2tZa0FRaW5ON01JZnJqOXZ1UEtkWGMvMjRLMVFR?=
 =?utf-8?B?Z3FBcGhYVmZMS1BTMGc2bTRmUE5sMnFLWWtmV2R5bTZ2eEp6UW1hQlpjZHVG?=
 =?utf-8?B?M3lnWjFoZE9zS3drc0JaR21ZcGp2eVNWQk9XSFNXdWVMcTl3bENiYnBXNGIr?=
 =?utf-8?B?dk42dVByd0hPd1hrL2E1TU9OaTArRVdOcXh1Unl3RjIzczNvL0tQZ2taQm9C?=
 =?utf-8?B?MEFsRzFYYmtsSURyamprc2M2L0pKMzYvVlZuL3ZjV0w2YUVCZzk1dk5VNFht?=
 =?utf-8?B?Y292Um12bW1ldUx2WUx1dVF2WmR6Mm8xY3lxa0RCdmdhYkRDNVZhMFlPcXZs?=
 =?utf-8?B?dG54djlhZ3l3bC8vMjNRamU4OHRWdTRSaGlQbzk5dGlqZ3NQM1YybHhkcUx6?=
 =?utf-8?B?R2tsZmdYVXRVOWJiSWdWV0tQekJDNE8yZXYyNXNDZFBCSE9TWW9oUUZETnBa?=
 =?utf-8?B?SXlVMW9WRU96Zm00VGdkYWFSQjY4OUZuL0JhZFRhUEdQM1czVXdJMGk3Tm5H?=
 =?utf-8?B?UytVb3hnb1JsWGlaZTdWQ1NpQmZzVzlRbjdPNFFrVzNGVEN2NWtrQ3RldEZj?=
 =?utf-8?B?WUFBVllLME5iWHNpMFNYVzJkNnR1UmJIM1lndmhTanQ0S3oxZDNxWVlzS3Vw?=
 =?utf-8?B?UDI3amFPM1p3RllSOGRQbXVKZGhBbmdMMHdLQlpKcW5XcTdCaEtGT2F0SEUr?=
 =?utf-8?B?a1FKQldPTnczZWZnKzIwWmNNdm9wWStuL0JzZkpnQTFmUEFpcGtBcTJudkFQ?=
 =?utf-8?B?RmE4UXRYT1BJcE9QelRuVUJkQ05YUFV1TG44NllLd0htTXRWcEsrZmJhUDVO?=
 =?utf-8?B?Q2xkUVVLem54RVR0T1dhQVJNVnJQWmpDeU1TTzJEWXNRQzdlTThDaTNDVTFB?=
 =?utf-8?B?czA5aGs1VFhEbUdWdEJ3a1Nvc3lFbytQQWtlRGxoQmpYU0hHaEloN3ZQL2d0?=
 =?utf-8?B?TjdWYnBhaUlIeGpuT3lueUJFWUlxRkcyVHVHY2xBK1NUdzBjUGl1Wm5tRWxi?=
 =?utf-8?Q?0ptpu3?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB6717.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L1Uzcm1IZVJsZTRSWlphUktmbUtGeDgwU2MxOHZ2Y1FEeGlUK2lHMGVsb2d4?=
 =?utf-8?B?RTlSMGZ3VmQrV0tiTWxvamNncGZsRW5LbjNRUEx3eFUyRmxCSytzaG9kWFBD?=
 =?utf-8?B?Y29GUi9MMlMwS0ZmakJ4bzZxaERFUnh6WWU2YnlUcVdkWncyTVdvNFI4NUpV?=
 =?utf-8?B?Q3RTSER2Q0JDbVJXZGVlYjg3c0h6OFF5d2dCVFlsM0tkVElTM1MvTDR3Ky96?=
 =?utf-8?B?RTVtV2l6RDBrT1hWNzg3b1YzNEYzZjBxS2NLRjB3dkhvU2hlRExpa2RhV3cz?=
 =?utf-8?B?ZmxEVGpTcG1zZ1NpNXAvVy83YlBtc3M5Z0JBakVWdzdXdWJYSHNDSjh6cjgr?=
 =?utf-8?B?YkNxMUFqYmFVdHc4aU0wYzJRY0FTa2NXZlBPYklraFh4VVZYSEk1WGg1eDlK?=
 =?utf-8?B?b1ZWYmNxMjdhL3YvTXdOQ0YxMU8vRUtraitnQ3ZFaUo5Zithc1NNTWU0RlNh?=
 =?utf-8?B?USswNFNyVGljd0tFeGY2NXdmdHQyVGk5V0pwdGlEU2E3SnBwb3psSjdNOGEx?=
 =?utf-8?B?Ti91NmhtZkU1RDRQVjJ2M042dHFhWTQ4cGJoaW00VjdSOVowVjdHTEw2bG5R?=
 =?utf-8?B?VVFnOTZ3S09mQWxnZ3FkV2QxYVh5YjBqRXhqNWF1Z1EyL1VpOEpOK2IrUStH?=
 =?utf-8?B?cDJmc29VMUpDeWtBV1NqV0k4azdKVXJmUi9LMTVCZ1dNQi9IdGpvWnNDQzFv?=
 =?utf-8?B?NjZhYkJ4cG1UUVFUWE5xNVpodHd2b1JDWHZLT285NUVRa0pWV3BrbFBpSzBp?=
 =?utf-8?B?cGJ3TUgvZkxEdjNpcGxjNEZPK0RFTlBwMlpaYVFtMFpoeU1KMDB2SUM5ZEMy?=
 =?utf-8?B?M0pIMHAwcWFIemtPYkRUMFNVVzVrRmJFNE5sclpsU1ZFUzR6TU54N3ZHbEhN?=
 =?utf-8?B?L05zZ0pBSXM5YVYzb0xSaWhNZCtNTGczVUY1NGVRTDZoVVczMTFnMm9GTVVp?=
 =?utf-8?B?KzYwVUd6NVFML0RlUmhzMTRVZGJxQStrSVFhcjM4ZmIyM0xaK2dVeVRGYytC?=
 =?utf-8?B?Smh1R2FVaytBMlNFWHozZlRYZWY3WVM1S1pYS1EwTzZoYThBekM4WUlKeUE3?=
 =?utf-8?B?N0dlK3VxMUhDV2dHYW9adHJWRGtxOU5DQS94TThKQ1RQL0pKc1lsMWFsVnkz?=
 =?utf-8?B?RlB6YTBXNlZTOVR6N0o5eDAwTzQvWUo3dzNmTlpuRFNzOHVMY0hGTjZjc21V?=
 =?utf-8?B?cXZzRmZGNkVBNG9obDFLMXpsRGdoVk82RkdObCtJb0VxSmQyL0gzTWlUNmJx?=
 =?utf-8?B?QlpGTjgvT05QY0tzTUNoWXA3TGltTjVHSHlkT2ppTTk0cHFPbHE4NUlMV0lU?=
 =?utf-8?B?dG1zUWFhbysrUU55UzlxaDhSK2tScStLejMzMkEzNldISjF3ZDNwNTNGSldo?=
 =?utf-8?B?V0VyTmF0dklxa2k4ODUyUjFUSWJkMnJhWGV5eEJwZHJYQ0ZIMXpHeFd5SHZS?=
 =?utf-8?B?Q013d2tJMGFZUXk3bFdIOVBEZW9adGhEZGU1MkhsMkVhbTkxa1o2OVlHcTFp?=
 =?utf-8?B?V1laNEdNVkZ5eHAyb0dCRG45RHo3dFYyR2FNcVBhN3dROUdvZGNVS3pkQzM4?=
 =?utf-8?B?R3h4K0NZUHYrZVZzMnFpam16aGVFTTB5OE50Z0JsSlo4ck9aZ2JoV2JGMk8w?=
 =?utf-8?B?ZnhMa1Q3V2VGZ3RWOWJFbFdFZllCTFUxM3djZkZiZTY2dmczaWh1R0RBUlpZ?=
 =?utf-8?B?TExKZU9jdlV5TFVka2xWejU2VDF1UGlhanhzL2dzOWFvZkg1Y2RuMTVmMjZi?=
 =?utf-8?B?VGx0QmVuN2c2QlVQR1RVRWQzMWZmL1FOdzRPN0cxV3BEd0tzRmJTeUhidmhB?=
 =?utf-8?B?TGI3ZnFpTEdJTUdQbEZhSTdTUUtRZkFkVkE5anl2QjdaY1laejYyejc4dU5W?=
 =?utf-8?B?NGY1MjNrYXNTUTN0VE5Ebmg2RDRFUFhIV08zRjVvZzZMVGE1Ym9hbDhLMGps?=
 =?utf-8?B?OGRUYTRDcVc4Z0pIeHhjdkFRWkcxZ2pHbXVSSXZuRlVxK2VnWW5wWmJSM2VQ?=
 =?utf-8?B?S01aeVhHV0tNY25tcjFISU5Bd3lWZXE4cUJJZEpPYmNnbFJZYzZaTkpQWU1I?=
 =?utf-8?B?bWlzWTZEemNQVXFQSlNyK1Jxa3BIbDNnaStNSC9vU0xPV3ZiZ0JiazhDY0d6?=
 =?utf-8?B?d0t5bWI2cmVyN2ZDbXJ6NlpoWE5HNjBiandXYlFqTGxCRENhU1VJalI0b3lV?=
 =?utf-8?B?bVE9PQ==?=
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
	B2+0XG4DWQZr52Mx9UtVBF+grW2c9ApHok3vC6QlYkE466LkzKuJfJGrseet3P6ZcVCm9U8+eHmna76S3DtNRkmsjnNnInIiV+dKDjbXj6+UncfChpsZQdpQECXVY8FkvrYyqb/B4K+N38nxjGfbmXRxgnSek1N81ud3O/cnsxNYVRPPilFyiNRPLfS+4HBaLj+eBhdoMJS7Hvxb3P7QZlF2PaqP6U2WIkbO+Zfr6oJu8voey/BN/cylTn0OGnRJllsbnBZmK4k7kZ0p9sbTfTpqUrbyZ+/8Lb+vs20CkFBHwADCuC3eRJ9O0N3OS3MWRhozjL4cp5ZyN78JTSuu2RZPPUzrRCtl2k58CXBlESjY3ZziJckkjXEJTLIk5XipwU0uqwRYYVuxyA3+LXS3UO6E83qcZymBMnuEdomch7p/AXnFVd/WLsjO4dN6wWOJgLx62yXFywZsrhptQ1/Kp8y19K01soIOIgHkM4I6aNjRZOVSLpOUy4DXnvTBtYwvU8hYYD7PKqcxYxP62e/FPSCpyHUnnlsdpnMl1/DZ65HATtG40hxs9jQsT588Uo5pnkek/RHGfrbUUCCBwqhGp5j36uMZKPkVmtIvlUa4YXxv4mQAEulQhwafx3luMEZG
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6717.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c98b9b-e679-4f33-d952-08ddb8667706
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 06:13:57.9163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sD4X8GpAkWDj6bJw7krSmRsqtsGfvadED9LfxFz8CxwpzVEm13wLEshQXv9qQ5wL89q+8GV2bY+NoOhJMkodRSY5lVdCgcZtLvvbMuJImvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13241

SGksIFBldGVyDQoNClNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseS4NCg0KPiBPbiBUdWUsIEp1biAx
NywgMjAyNSBhdCAwNzoyNzo1MFBNICswOTAwLCBLb2ljaGkgT2t1bm8gd3JvdGU6DQo+ID4gKwlw
Y2lwbXUtPnBtdSA9IChzdHJ1Y3QgcG11KSB7DQo+ID4gKwkJLnBhcmVudAkJPSBkZXYsDQo+ID4g
KwkJLnRhc2tfY3R4X25yCT0gcGVyZl9pbnZhbGlkX2NvbnRleHQsDQo+ID4gKw0KPiA+ICsJCS5w
bXVfZW5hYmxlCT0gZnVqaXRzdV9wY2lfX3BtdV9lbmFibGUsDQo+ID4gKwkJLnBtdV9kaXNhYmxl
CT0gZnVqaXRzdV9wY2lfX3BtdV9kaXNhYmxlLA0KPiA+ICsJCS5ldmVudF9pbml0CT0gZnVqaXRz
dV9wY2lfX2V2ZW50X2luaXQsDQo+ID4gKwkJLmFkZAkJPSBmdWppdHN1X3BjaV9fZXZlbnRfYWRk
LA0KPiA+ICsJCS5kZWwJCT0gZnVqaXRzdV9wY2lfX2V2ZW50X2RlbCwNCj4gPiArCQkuc3RhcnQJ
CT0gZnVqaXRzdV9wY2lfX2V2ZW50X3N0YXJ0LA0KPiA+ICsJCS5zdG9wCQk9IGZ1aml0c3VfcGNp
X19ldmVudF9zdG9wLA0KPiA+ICsJCS5yZWFkCQk9IGZ1aml0c3VfcGNpX19ldmVudF9yZWFkLA0K
PiA+ICsNCj4gPiA+ICsJCS5hdHRyX2dyb3Vwcwk9IGZ1aml0c3VfcGNpX3BtdV9hdHRyX2dycHMs
DQo+ID4gKwkJLmNhcGFiaWxpdGllcwk9IFBFUkZfUE1VX0NBUF9OT19FWENMVURFLA0KPiANCj4g
U2hvdWxkIHRoZXNlIGRyaXZlcnMgbm90IGFsc28gaGF2ZSBQRVJGX1BNVV9DQVBfTk9fSU5URVJS
VVBUID8gUGVyIHRoZW0NCj4gYmVpbmcgdW5jb3JlIHRoZXkgY2Fubm90IGdlbmVyYXRlIHNhbXBs
ZXMuDQoNCkV2ZW4gbm93LCB0aGUgZnVqaXRzdV9wY2lfX2V2ZW50X2luaXQoKSBmdW5jdGlvbiBy
ZWplY3RzIHNhbXBsaW5nIGV2ZW50cw0KYmVmb3JlIGNoZWNraW5nIFBFUkZfUE1VX0NBUF9OT19J
TlRFUlJVUFQgaW4gY29yZS5jLg0KSG93ZXZlciwgSSB0aGluayBpdCBpcyBjb3JyZWN0IHRvIGhh
dmUgUEVSRl9QTVVfQ0FQX05PX0lOVEVSUlVQVCB3aGljaA0KbWVhbnMgbm90IGJlaW5nIGFibGUg
dG8gc2FtcGxlLCBzbyBJIHdpbGwgYWRkIE5PX0lOVEVSUlVQVCBpbiB0aGUgbmV4dA0KdmVyc2lv
bi4NCg0KQmVzdCBSZWdhcmRzLA0KS29pY2hpIE9rdW5vDQo=
