Received: from smtp-fw-52002.amazon.com (smtp-fw-52002.amazon.com [52.119.213.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED2E27453
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 11:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.119.213.150
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751886109; cv=fail; b=aeu2tdMlv90Kvu0x78UoyhU3f8GEcEFJL6PhCe9vjvO1KSJJrhy/Peuob3eUXSv46p3/p+IiuWrheG3sTes5RIT29a8GMCWfpiOXdDcfX4xDaLlikAXeT0r2yKYt9UOYp/MWUu8iY2K/zyVfDPzCT3J/cw2VkWp1q+XSqKcd2cE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751886109; c=relaxed/simple;
	bh=BY05jBB2k6O5lNCjNCFehkiAFxv3PNhtackP7hf9b1A=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=siHiYlBIGRTQZBZE/0NJ1grAEn5yaeAbvcLDcu7x4J6yzQMNRcalod5i5Z2Eq+PCcedOUbftCfERybEwKrPi9p2cbpTBRe5f9J/UjehFouGrM33INpHQ5iuOtRcBvXN9cj9phiQknhzqLvC8hI4sO/091vcWG70az9qntGX6PQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.jp; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (2048-bit key) header.d=amazon.co.jp header.i=@amazon.co.jp header.b=Ljm8LCYI; dkim=pass (1024-bit key) header.d=amazon.onmicrosoft.com header.i=@amazon.onmicrosoft.com header.b=NweBotXw; arc=fail smtp.client-ip=52.119.213.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.co.jp header.i=@amazon.co.jp header.b="Ljm8LCYI";
	dkim=pass (1024-bit key) header.d=amazon.onmicrosoft.com header.i=@amazon.onmicrosoft.com header.b="NweBotXw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.jp; i=@amazon.co.jp; q=dns/txt;
  s=amazoncorp2; t=1751886108; x=1783422108;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=BY05jBB2k6O5lNCjNCFehkiAFxv3PNhtackP7hf9b1A=;
  b=Ljm8LCYIF/g2kLifof3RrybcHh4wtMNy+tX7nTZO239TwDYFuElq3YLB
   b4ugr1MiFsRGUqbxTiJMBmJwrq/UWJt5dg+XQ8qljGTRxZPGfAJAXnAOX
   PfHje8DAPga8kwWaePm2PWEd3sTKMwvHEkSzACKPHT5ncvBS8tf2OljOA
   cXHzg1WeAjjqBIuUGQzPQ3ukKS/Zum9xijshw8Xt0KA/Lz8yO2JYXQVWx
   xLGYMic9KKcNkswdWbRyjG4wGlPAKqIgwaLyKafpJihozyD18V28uVJuy
   nNPV25/uCIplUJyBqnYa+sfiTm1gv4ZnHnhum5ASElg2gk2NHxd/rD5Sf
   Q==;
X-IronPort-AV: E=Sophos;i="6.16,294,1744070400"; 
   d="scan'208";a="739436074"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52002.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 11:01:47 +0000
Received: from EX19MTAUEC002.ant.amazon.com [10.0.0.204:4618]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.51.68:2525] with esmtp (Farcaster)
 id 0a82010d-95b9-44d4-ac84-e5098b3ea039; Mon, 7 Jul 2025 11:01:45 +0000 (UTC)
X-Farcaster-Flow-ID: 0a82010d-95b9-44d4-ac84-e5098b3ea039
Received: from EX19EXOUEB002.ant.amazon.com (10.252.135.74) by
 EX19MTAUEC002.ant.amazon.com (10.252.135.253) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Mon, 7 Jul 2025 11:01:45 +0000
Received: from EX19EXOUEB002.ant.amazon.com (10.252.135.74) by
 EX19EXOUEB002.ant.amazon.com (10.252.135.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Mon, 7 Jul 2025 11:01:44 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.252.135.199)
 by EX19EXOUEB002.ant.amazon.com (10.252.135.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14
 via Frontend Transport; Mon, 7 Jul 2025 11:01:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5/0TrfH15LQA1AuQpJyW8LTSxWgREvJPAfO1SV/Cr+i9L3kKL6JgW7H3qm9BjaEPB/aXM6hlUTLLdhDUoNnGOZN7hmF+TbtfFfrIBmAGBAjaz27xMLbWq6v/CdlKH6aYUpvXkvibGoYgM8mtnOEUp0r7vmbfEH8MddLzlPbhFmEn6dOOD1IWkc5UF22Ue4RER8wMNoiFvcuGIau6UJrPzVwBe5iEbbYPaqvubcMWprkiO5U6TWnJrZ/GTGNU8VrYbcXsFpzZ9z2lm/b0Mii8lgJN3LHIrKVxwpOKQxFZFEdZ9RTQUihkYIlNPauJddWDbVAm98MdJNOcSabW7qRPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BY05jBB2k6O5lNCjNCFehkiAFxv3PNhtackP7hf9b1A=;
 b=YaKKBScO9FesRO6Acafy0meqo52UjrikqaWdOeesebFJIeUVVnYctrvjPfXOWr8LTt8L38K2Z32TkT57Gt3ZlG3lT/8f+W96tlhb8BhfvTtaupjvanYf+kRf/6IefXUT7hwJQ2c2WS/9oGdfkHIV7i+R1ntFzmOewgPtqVHn/UVljYx7Nv4NJCMgYu7mHfK1ku0YqtQMM9SjjAyO55XLz1Gk6O8pjIdSjmGBn3x2Db4EtABm8fQq3Q7tdfh9a8CFcgCDmRwbqW5nCq/P+n16qSs/yZBA4+Q0V7YNVur9XcsxketO8+6GdxUavNG8m4MyAUjOGIHMkH3AbIF6S1OZPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.co.jp; dmarc=pass action=none header.from=amazon.co.jp;
 dkim=pass header.d=amazon.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.onmicrosoft.com; s=selector2-amazon-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BY05jBB2k6O5lNCjNCFehkiAFxv3PNhtackP7hf9b1A=;
 b=NweBotXwLtikzNKZ4jDkRxKsiahiGcbfc8R3TnIPxJqHAf0qtVA/MQp33nsQ97cLZsUMXq9JwxPw4cbrq1ifKa79PD5TzxDzrgpveimVqMlcrUMfhcjsm9loTgJe9vlW3EUA+G5Sx5JTwqGewv7+sBJ9LUnax9jnHXKNzariBlY=
Received: from IA0PPF3C73F5B9A.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::c16) by DM6PR18MB3524.namprd18.prod.outlook.com
 (2603:10b6:5:2a4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 11:01:41 +0000
Received: from IA0PPF3C73F5B9A.namprd18.prod.outlook.com
 ([fe80::962d:7805:484f:46af]) by IA0PPF3C73F5B9A.namprd18.prod.outlook.com
 ([fe80::962d:7805:484f:46af%7]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 11:01:41 +0000
From: "Enju, Kohei" <enjuk@amazon.co.jp>
To: Ian Abbott <abbotti@mev.co.uk>,
	"syzbot+c52293513298e0fd9a94@syzkaller.appspotmail.com"
	<syzbot+c52293513298e0fd9a94@syzkaller.appspotmail.com>
CC: "hsweeten@visionengravers.com" <hsweeten@visionengravers.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"syzkaller-bugs@googlegroups.com" <syzkaller-bugs@googlegroups.com>
Subject: Re: [syzbot] [kernel?] UBSAN: shift-out-of-bounds in das16m1_attach
Thread-Topic: [syzbot] [kernel?] UBSAN: shift-out-of-bounds in das16m1_attach
Thread-Index: AQHb7y6Eb47DFJTaYEGyOra1OkPpTw==
Date: Mon, 7 Jul 2025 11:01:41 +0000
Message-ID: <BEFE3A1A-63A9-46C4-A39D-8AAA791A9379@amazon.com>
Accept-Language: ja-JP, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_929eed6f-34eb-4453-9f97-09510b9b219f_Enabled=true;MSIP_Label_929eed6f-34eb-4453-9f97-09510b9b219f_Tag=50,
 3, 0,
 1;MSIP_Label_929eed6f-34eb-4453-9f97-09510b9b219f_SetDate=2025-07-07T10:46:50Z;MSIP_Label_929eed6f-34eb-4453-9f97-09510b9b219f_Enabled=true;MSIP_Label_929eed6f-34eb-4453-9f97-09510b9b219f_Name=Pending
 Classification;MSIP_Label_929eed6f-34eb-4453-9f97-09510b9b219f_SiteId=5280104a-472d-4538-9ccf-1e1d0efe8b1b;MSIP_Label_929eed6f-34eb-4453-9f97-09510b9b219f_ActionId=8a9f2e86-0594-4a64-ba07-bed22adb4f08;MSIP_Label_929eed6f-34eb-4453-9f97-09510b9b219f_ContentBits=0;MSIP_Label_929eed6f-34eb-4453-9f97-09510b9b219f_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPF3C73F5B9A:EE_|DM6PR18MB3524:EE_
x-ms-office365-filtering-correlation-id: 5c0accac-d0ab-40b4-be72-08ddbd45a769
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?M3J4bXA1REE2VnR1amRwSkRUdWVtTklSMUZIVjJoL29qTjBqaERqMVFVNDdo?=
 =?utf-8?B?N3ZjdXZQbVlubXdmaU0xYVp2eEc3dXNnRTFaOFY3bE5ReHJ0b0pzUFFKcGVT?=
 =?utf-8?B?NjBFS3NEVDZsc1VUY1JFeW85ZnJYRVE0UGFaczUyK0RwVlFoQ1ZyUmN5Ylcw?=
 =?utf-8?B?ejFwNjBrcnlydXdNNFZIdnhnK2hHcWx2SnFCb0RSd2lsd1BCakNGZXpDWENi?=
 =?utf-8?B?ODBwaWY1NTN6TWl5R21mK1JVd2QvaG1xY09PM2hORmpMcW44U3MySzV5ODJv?=
 =?utf-8?B?SENQZWFVV2FwcFZuTnFGZjZ2VXpIMldlemUvdGtDZm1oQlpWMklRdHBiT1hC?=
 =?utf-8?B?U3Zjb3Q0cjJRbEFZUjlKWEtrM0NCVHBKejVzTjJwODczM1E1RmVyMVhYaWg3?=
 =?utf-8?B?dFJCM0FHaUhJQ0NwakJlR0M3eEZta3JaZ3hHVjhpcDJNR01YNS9PMVpHS0Nn?=
 =?utf-8?B?Z05VQjd1NjM1bnhLYkJBN3B0S0VNdlVxN2hETkUvSWgwYmdBTzhXS2dnSGt3?=
 =?utf-8?B?WVZqUjBSZ2U5OFkxeFVVV3ZrbWlSQ2hBQjBvZXlxTHd5MzNTa3B5ZndEVW1v?=
 =?utf-8?B?RmtBMGFyY3BRTUw3L0o4YmUwOGVKSDF1ejAvM2RZeCtYbjNxSE1aYXE0eDhS?=
 =?utf-8?B?eVpSQ05qYUM5dXQvTjVBMlROcG8vTUVDd09jNTBQMXFCNnRiRzZ6a1djeWVK?=
 =?utf-8?B?NTFBWlZENWMxY0lXbFRyT09tYktxV0RGbHAxSGVnS3pjUmI1YnVmMnNLemh0?=
 =?utf-8?B?eVQvTVZ1bktmOFZBNnBlUmRlOHI2b1BFREdtOU84cjRxclZVY2tQVlNEVm1D?=
 =?utf-8?B?c3d6M1R0clFxK2pqUWxvMHNEcDJCZFJkM2E0bzd6ZjdieXBWMllpN1BPNC92?=
 =?utf-8?B?cDI0L2dRVDUwbkl2TGZhN0puck9OaSt1ZkE2dU5xc3NMbDRxa25KT2t3QWg0?=
 =?utf-8?B?WlhNRFFVRm93bUJtbFo1dHdITlJ3N0FidzliTUdLMStzTmp0dlMvZ1dscGdL?=
 =?utf-8?B?U2Rab0UzRlBJU2tYWEdSaTFuUk1GNEJYNkJVaE1DNldzZlFtSVJ1aFlORzEy?=
 =?utf-8?B?WTcvM3pYbHpqa1k4T3paM1dYVzBpRHU2R1FJR3pZa3Fka1UxSFJCZXVuNDFy?=
 =?utf-8?B?M0dCMkhwQVc2ZDVnTWpYa2hmQ3pDbVlrSm5SZ2xkSW9HZE54Z1ZrOFA3cVVy?=
 =?utf-8?B?Ni8xOHphM2MwUy9xcDVEbWt2MU1VaTNiaUZweWZlQXFUWDN3d2l1enViWnM2?=
 =?utf-8?B?SG1KTTMzYjdqWldhaFA2UWpWT0ZiaVBaWkRtUStWRyttM1FVdjVlc2NQbm9P?=
 =?utf-8?B?aHJqTTdxWUMwYVIybEpIYzM5aUV3VVlHc3JYeW54dzYxMWNGZVBTbVJJN0lX?=
 =?utf-8?B?eHBhRStGUURBaDFubEl5cXY1UjNXUW9tb0tNSzE3YkRTL1drYlh0Qk9uMDZW?=
 =?utf-8?B?amJtQUVpNnRaU2hvaU4yeUM0Z09GY0xhaDR5S0hXUFlzQTZzcmprK3F2Z3Vq?=
 =?utf-8?B?Y0hyK1Vsb3JBcGh6ZlJsbkh4SmpqMCtpZzdqS2VTN05SM3JjaHpyYlk2emhX?=
 =?utf-8?B?ZDBrM25UL2RXV1hHbWg3L0VLdVVpYVVjTWNQSlpSZlpWb2VWRmJtRHo2NHdB?=
 =?utf-8?B?emZGKzdHWUd0amV6aUxTNDJjL09wZmNDMHo5U28yWHpSaDhSdXZnS0pYOGZy?=
 =?utf-8?B?OFJKMGhEeGFlbVhTamRqNm5xK1BUYlJreDVhMHhXV2F3WE1Mby9ZS3BPVzd5?=
 =?utf-8?B?SjJNb2dNdmhweUYvVmh5ZnhCQmVSZEFIUFNod0ZnbUMzREJ1MkNKTUJML1d5?=
 =?utf-8?B?Q2NoWThsVGhleitSV1FWby8rVFpaNmx3cVVnUWtySGhZa01mQm00Rkg0dzlH?=
 =?utf-8?B?RlE0NEsvSThHeTU5c1o1RCtnb3J2STM1ejkyWTZjZzluOEhQa0I4M0ptWEdl?=
 =?utf-8?Q?npAVB11VnTk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPF3C73F5B9A.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?THkzL2dTMDFZNElMNldGZGJJQjlkc2QrcE41b2NSMXovTHZGZkdodW9mQ3Rz?=
 =?utf-8?B?UTdZbUFUYzJiR095LzlvNmR0QVlrcnV3SDBsQldsOTc1ZkE1OWdwa0pCMisv?=
 =?utf-8?B?eVhrZGRGSVcvWXJ5emJxVk5uRzJmMG5KRXlJZWd1cjRncEpDbjBtdE5qR0xK?=
 =?utf-8?B?dEFWMFJQQnFVVHpnR2sxeVRGQ3R6TklIdEE4OTVaWjdIMXhMK3ZKMzIzMjRB?=
 =?utf-8?B?emxNOVk2Mzd5ckMrQ1l3WUJWVjNzeW05N1dKditGN3JMR29IVW43Q1dYblZk?=
 =?utf-8?B?RGZsQ2JsV3I3cjhyeE1sUEJmRTI1bFY3dWM4M0NUbk9TdDA0SllvU3FyeC9o?=
 =?utf-8?B?TXR3Rndic1R2THZvK0NXbkl5S3VwYytDK1lZbTRMaDBzZjJ3eXU3Uno0bGlF?=
 =?utf-8?B?V2dnN1VyeWhiYU8xZk5KMWZ2c1RjQWYwZmUwcXBtMGVZUmViVTFkeWVqT1BS?=
 =?utf-8?B?aWxhQi9Ja3pWam9YSnVSUGxlNExwNzdRYjRLMnhGM0NDdE5QNDBXTnNjRlpQ?=
 =?utf-8?B?NnJCTHRucnVMWk9WVGkzRG5BZWV5Ylg4N1ZsSFFCdzlZVENLc2JxY21OajNX?=
 =?utf-8?B?RW9IN2VabXduNURpN0dBdG1XSGpIY0pjMHIwZE9SS3dwTThSQ1I2R2ZXSDJN?=
 =?utf-8?B?MzlQa3JRWHBtOGVWS1hNdWZObEV2eGR3UTFiV0lhcDE2b2lzYURKZ1FWeEVj?=
 =?utf-8?B?YjdVSmMrUUttK0FzclRFTW9HUUZpb0E2YU5vOWRBdDVBZ0FweUttN0JhWS9r?=
 =?utf-8?B?Z2JwN2RmSnJwNDl2WDVxL0R0ZTl5RVdOdWlzRGtWM2NzK2ZLNU95V1FFdlRW?=
 =?utf-8?B?a1FXd1lXSzNBcEIxeG5qSUJpaVBYVGN1cCtUaXRDeS9idFc1UGJSdDIzMGky?=
 =?utf-8?B?WnNHMHNnRU5Hb1BSWVZmT2FYZzZjVXI5SlZVdWV6a2lQSXc4VFZvM1ppWmpD?=
 =?utf-8?B?UWpGbHdCZUlIcTdlZll0TFdGNnVuTGJ3ZHNlUHUvY2pNZk80VE8zSXNyNkVS?=
 =?utf-8?B?dHVOYkxaS2FHUlhYMEIvdEZqaWQ3Zzc5dFlZY1REVEFIYmZmVWxpS2pvdkJw?=
 =?utf-8?B?Q3dBcTFxaTJiY0dvQXpxaVpyR201b1AvSVhGNlpsVDNXZmhVVFpJUzNldmNG?=
 =?utf-8?B?QnF0ZGJSYWlWSDNMU0RpbXZwdlc5UStSTmEvSHpnV003aDluRmVodWh5OVcy?=
 =?utf-8?B?ZTQ1WWhvZEtPVXh0Z1dyVjBJUWFIeVc5bUpyQ2kwVThqemk1RklnNlpJeXBa?=
 =?utf-8?B?UzBIK0lhaWF1U0dJb1V5ZU9tMis0UXVkcEdqZkNmTW1FQTNHYS9sYXU4TTNw?=
 =?utf-8?B?Z0txLzN4amVFNlRtZG5YZm9VSlBJdW93YUlyeDR0T3FmUTRhZzRyWjZDYUZD?=
 =?utf-8?B?SGd5QjJyVDd6UUJXZkJvWG1hdHR4SmppencyMUdlaWFIV0hCalhpMmJ3dnlN?=
 =?utf-8?B?RUxMWkZrTVUyY0l3ZEVQdzBSTk00U25vNTQySTRCWFpPNW85TWFqR2d0YkJ3?=
 =?utf-8?B?aHNOZVJCVGQ0WHdyd2FPTUJqeWthOXBvbUxDR01jSVFsdmVKYzhxRlZvNW1q?=
 =?utf-8?B?b2VQWFc0TU9aZ1FYUFZmcnJpbDFFa3VPUTdneXF6azVEWXJ3LytLOUV3eEFS?=
 =?utf-8?B?UGg1OEluenAwb2xyL2MxWjRnVjRQWUc4L0U1Q2pHajRERjdSWEJFR0c4SnB3?=
 =?utf-8?B?OTkwaVAvSm9NVk13dDlkZjRWTHRUY3prOGdyVHQvSUJQOXVnWEIwc08vc25l?=
 =?utf-8?B?ZEhzL2xNV3lWRG81ZTYvUHZjMkFsMEpNbVpPWkEvelQvMngwYzU4b2hZbjJO?=
 =?utf-8?B?SUJORFNGU2lVV2lSMGQwcmpPVHQwNHliVjBmWU8wdTZ4YUI4bExWZDQveUc3?=
 =?utf-8?B?WC9xTGJzdkZQSTFGUnBhTVB0MGtvdHlCQU54Q041OCtIOXM1eDRuNXhNdjJ5?=
 =?utf-8?B?U1NWd1Z0L2VjMlBna3p3TWFxTDhsRVlndW1rSEltNkZLdXE0aXhDVW1LbU1x?=
 =?utf-8?B?bXR4NUZjWnhnQ0JwRkoxNFA3RWgrR3VuZ0ZKdW9sUE1tRlNRZGxYTHdFMkxn?=
 =?utf-8?B?b3haN2psNkdWK3d4VDdGMWJCN1Njd3Q3cCtHMlVyRVkvZ012aVpJVmtBQlR0?=
 =?utf-8?Q?9AQLpD6aHbI9Fy8GLVZ9gfvzU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <072EDA508BC3D34883674110765B023A@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PPF3C73F5B9A.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c0accac-d0ab-40b4-be72-08ddbd45a769
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 11:01:41.5185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7sPNGqrwoR2ynphPL0gtECiz8J0i/5AgmHHqfFHtetXKGprmSq+fG5K02qreTXBtka/08uqfzKDToIR7iba0JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3524
X-OriginatorOrg: amazon.co.jp

T24gMjAyNS8wNy8wNywgMTk6MTksICJJYW4gQWJib3R0IiA8YWJib3R0aUBtZXYuY28udWsgPG1h
aWx0bzphYmJvdHRpQG1ldi5jby51az4+IHdyb3RlOg0KDQo+T24gMDQvMDcvMjAyNSAxOToxMCwg
S29oZWkgRW5qdSB3cm90ZToNCj4+IE9uIEZyaSwgMDQgSnVsIDIwMjUgMDk6MjA6MjkgLTA3MDAs
IHN5emJvdCB3cm90ZToNCj4+DQo+Pj4gWy4uLl0NCj4+DQo+PiBBIHF1aWNrIGdyZXAgZm91bmQg
c2ltaWxhciBwYXR0ZXJucyB0aGF0IGNvdWxkIGhhdmUgdGhlIHNhbWUgaXNzdWUuDQo+PiBJIHRo
aW5rIHdlIHNob3VsZCB2YWxpZGF0ZSBpdC0+b3B0aW9uc1sxXSBiZWZvcmUgc2hpZnRpbmcsIHJp
Z2h0Pw0KPj4NCj4+ICAgICQgZ3JlcCAtbnJJRiAiPDwgaXQtPm9wdGlvbnNbMV0iIC4vZHJpdmVy
cy9jb21lZGkNCj4+ICAgIC4vZHJpdmVycy9jb21lZGkvZHJpdmVycy9haW9faWlyb18xNi5jOjE4
MDogICAgIGlmICgoMSA8PCBpdC0+b3B0aW9uc1sxXSkgJiAweGRjZmMpIHsNCj4+ICAgIC4vZHJp
dmVycy9jb21lZGkvZHJpdmVycy9kYXMxNm0xLmM6NTI2OiAgICAgKDEgPDwgaXQtPm9wdGlvbnNb
MV0pICYgMHhkY2ZjKSB7DQo+PiAgICAuL2RyaXZlcnMvY29tZWRpL2RyaXZlcnMvZGFzNjQwMi5j
OjU3MDogaWYgKCgxIDw8IGl0LT5vcHRpb25zWzFdKSAmIDB4OGNlYykgew0KPj4gICAgLi9kcml2
ZXJzL2NvbWVkaS9kcml2ZXJzL3BjbDcyNi5jOjMzMTogIGlmIChpdC0+b3B0aW9uc1sxXSAmJiAo
Ym9hcmQtPmlycV9tYXNrICYgKDEgPDwgaXQtPm9wdGlvbnNbMV0pKSkgew0KPj4gICAgLi9kcml2
ZXJzL2NvbWVkaS9kcml2ZXJzL3BjbDgxMi5jOjExNTI6ICAgICAgICAgaWYgKCgxIDw8IGl0LT5v
cHRpb25zWzFdKSAmIGJvYXJkLT5pcnFfYml0cykgew0KPj4NCj4+ICNzeXogdGVzdA0KPj4NCj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NvbWVkaS9kcml2ZXJzL2RhczE2bTEuYyBiL2RyaXZlcnMv
Y29tZWRpL2RyaXZlcnMvZGFzMTZtMS5jDQo+PiBpbmRleCBiOGVhNzM3YWQzZDEuLjFiNjM4ZjVi
NWE0ZiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvY29tZWRpL2RyaXZlcnMvZGFzMTZtMS5jDQo+
PiArKysgYi9kcml2ZXJzL2NvbWVkaS9kcml2ZXJzL2RhczE2bTEuYw0KPj4gQEAgLTUyMiw3ICs1
MjIsOCBAQCBzdGF0aWMgaW50IGRhczE2bTFfYXR0YWNoKHN0cnVjdCBjb21lZGlfZGV2aWNlICpk
ZXYsDQo+PiAgICAgICBkZXZwcml2LT5leHRyYV9pb2Jhc2UgPSBkZXYtPmlvYmFzZSArIERBUzE2
TTFfODI1NV9JT0JBU0U7DQo+Pg0KPj4gICAgICAgLyogb25seSBpcnFzIDIsIDMsIDQsIDUsIDYs
IDcsIDEwLCAxMSwgMTIsIDE0LCBhbmQgMTUgYXJlIHZhbGlkICovDQo+PiAtICAgICBpZiAoKDEg
PDwgaXQtPm9wdGlvbnNbMV0pICYgMHhkY2ZjKSB7DQo+PiArICAgICBpZiAoaXQtPm9wdGlvbnNb
MV0gPj0gMiAmJiBpdC0+b3B0aW9uc1sxXSA8PSAxNSAmJg0KPj4gKyAgICAgICAgICgxIDw8IGl0
LT5vcHRpb25zWzFdKSAmIDB4ZGNmYykgew0KPj4gICAgICAgICAgICAgICByZXQgPSByZXF1ZXN0
X2lycShpdC0+b3B0aW9uc1sxXSwgZGFzMTZtMV9pbnRlcnJ1cHQsIDAsDQo+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGRldi0+Ym9hcmRfbmFtZSwgZGV2KTsNCj4+ICAgICAgICAg
ICAgICAgaWYgKHJldCA9PSAwKQ0KPg0KPlRoYW5rcy4NCj4NCj5UaGF0IGxvb2tzIGZpbmUuICBJ
ZiB5b3UgcGxhbiB0byBzdWJtaXQgYW4gb2ZmaWNpYWwgcGF0Y2gsIHBsZWFzZSBDYyBpdA0KPnRv
IEdyZWcgS0ggYmVjYXVzZSBJIGRvIG5vdCBoYXZlIGNvbW1pdCBhY2Nlc3MgdG8gYW55IHB1bGxl
ZCBnaXQgcmVwb3MuDQo+DQo+VGhlIEZpeGVzOiBsaW5lIGZvciB0aGlzIGlzIGFzIGZvbGxvd3M6
DQo+DQo+Rml4ZXM6IDcyOTk4ODUwNzY4MCAoInN0YWdpbmc6IGNvbWVkaTogZGFzMTZtMTogdGlk
eSB1cCB0aGUgaXJxIHN1cHBvcnQNCj5pbiBkYXMxNm0xX2F0dGFjaCgpIg0KPg0KPkNhbiBhbHNv
IGFkZDoNCj4NCj5DYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgNS4xMysNCj4NCj4oQ29t
ZWRpIG1vdmVkIG91dCBvZiBzdGFnaW5nIGluIDUuMTMsIHNvIGEgYmFja3BvcnQgaXMgcmVxdWly
ZWQgZm9yDQo+ZWFybGllciBsb25ndGVybSBzZXJpZXMuKQ0KPg0KPklmIHlvdSBkb24ndCB3YW50
IHRvIGRlYWwgd2l0aCBpdCwgbGV0IG1lIGtub3csIGFuZCBJJ2xsIHNlbmQgdGhlIHBhdGNoDQo+
YW5kIGNyZWRpdCB5b3Ugd2l0aCBhICdTdWdnZXN0ZWQtYnknIHRhZywgb3Igc29tZXRoaW5nIG1v
cmUgZXhwbGljaXQNCj53aXRoIHlvdXIgcGVybWlzc2lvbi4NCg0KVGhhbmsgeW91IGZvciB0YWtp
bmcgYSBsb29rIGFuZCBzdWdnZXN0aW5nIGFwcHJvcHJpYXRlIHRhZ3MuDQoNClVuZm9ydHVuYXRl
bHkgSSBkb24ndCBoYXZlIHRoZSBiYW5kd2lkdGggdG8gcHJlcGFyZSBhbiBvZmZpY2lhbCBwYXRj
aCBhdCB0aGUNCm1vbWVudCwgc28gd291bGQgeW91IChvciBhbnlvbmUgZWxzZSkgYmUgYWJsZSB0
byBoYW5kbGUgaXQ/IEkgd291bGQgYXBwcmVjaWF0ZQ0KaXQgaWYgeW91IGNvdWxkIGFkZCBhIGBT
dWdnZXN0ZWQtYnlgIHRhZy4NCg0KKFRvIGJlIGhvbmVzdCwgSSB0aGluayBzb21lb25lIHdobyBr
bm93cyB0aGlzIGRyaXZlciBiZXR0ZXIgdGhhbiBtZSB3b3VsZA0Kd3JpdGUgYSBzdXBlcmlvciBw
YXRjaC4pDQoNCj4tLQ0KPi09KCBJYW4gQWJib3R0IDxhYmJvdHRpQG1ldi5jby51az4gfHwgTUVW
IEx0ZC4gaXMgYSBjb21wYW55ICApPS0NCj4tPSggcmVnaXN0ZXJlZCBpbiBFbmdsYW5kICYgV2Fs
ZXMuICBSZWdkLiBudW1iZXI6IDAyODYyMjY4LiAgKT0tDQo+LT0oIFJlZ2QuIGFkZHIuOiBTMTEg
JiAxMiBCdWlsZGluZyA2NywgRXVyb3BhIEJ1c2luZXNzIFBhcmssICk9LQ0KPi09KCBCaXJkIEhh
bGwgTGFuZSwgU1RPQ0tQT1JULCBTSzMgMFhBLCBVSy4gfHwgd3d3Lm1ldi5jby51ayApPS0NCg0K
VGhhbmtzLCANCktvaGVpLg0KDQo=
