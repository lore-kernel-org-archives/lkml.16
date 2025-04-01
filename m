Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2123.outbound.protection.outlook.com [40.107.247.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E9B1A7253;
	Tue,  1 Apr 2025 05:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743484407; cv=fail; b=c3UMZrdiclTbeMd0sGwrSMvApvCxR8YB+t8QZ3MiVEBGFMJ2lyNpr5m48Tu1UQNxYKUTxRj+6ngioJobL0K8KFNmuuM5bRmewMcFjluwI8dYeFqPBDh/X51MTXFdz508N9/W0ex6SyBIwij0bKwZUNt4BcWb/1qMWwCWicxoC9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743484407; c=relaxed/simple;
	bh=affDgBmvvzLr8p69OeU6QPpnKYGXX6aEhE7bfinyj9Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QT4Y9e1YqUTl4fYkKK2J+ZCinhEtO2pLNBwDAfxtVRz1CNLIhiiFqjvMSLWs3idSszncKHfQxuXO9aF5BJw3Zjj92v47S4MVoFJCVsIMtCttZncCHGWzOcxlPtgqLVkAA5npUsZQ1EfK3mZnlypyzwV0K93HJObEBwyxbRLWzS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=VOaAZqOb; arc=fail smtp.client-ip=40.107.247.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="VOaAZqOb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jPGvkD8yHH3Pk4+fyuJVztiSfQx3Phku9jTjy1RW+FP4Avvm/VymhOHEE7kyUs8ApMUOIX9MyFdOa/XnbgJJEPnuTzwT9e1hzvFUz8AJKlAnJV0u+5mKviPQlPkHzc7bAXxXAiGLgemTA5DJKsZ3G5B1geMtyAMedaUVzDAS5RiTshZubci1MHUHNzMtXb3g1JUSnvuaFK7ug29GLpbEkrMhBlWK+Gv4HuRD7xGxaR2oAFMgwXyKOtlJ+Wi4M5JwbMxezBkT44/Xk5F7xgKpsVChe8NWcCsbldlJ9x3AGRpK8m4MEoL2dftYKtZAymBy76UfILB9hrf6IyOnkT3xPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=affDgBmvvzLr8p69OeU6QPpnKYGXX6aEhE7bfinyj9Q=;
 b=V0ARs2gqdIH23nCMk9Se+2x4GR1QUkfaUDTcmDh4WNZ+lbH+M8HRiK6/gEyhVvjA5aYPj6I2mSSS/XHVndMBx4xtCSykxxsvfHN6+Ne4OfvZjXOjKU+hBXw31dYdvVsurtpur6EDrdvqacT6YH2SrXhNehPIgk7kuc0/RNG+zQ9Yp5WnyfaP5/jl4g1bN71du7JjZGpCy1X73Wzk6gbVmGWUeNytAsp+NAgFiqfAOPUVcmD3plE2nL9fyf5AB4vxIfLK4W61vSq+uJk37lvF0KMpTPf9Ys6X09lj+xgEYyTPZNXbjSF4b24lUhyQDVXgS+sDpAGB10qOCQcUlc6Djg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=affDgBmvvzLr8p69OeU6QPpnKYGXX6aEhE7bfinyj9Q=;
 b=VOaAZqObfIwMIVap0XXSeCyS8fSvcyr3VwLfa2swSpfScAbtQ/K6NBAFA+cMGSB1g2urmR1/76w14nhyI24t+feLj+7dtnq4INsxBGvmz3dzN8kT5EFD+FwhqLPxIwQgEIWI8uqUqQAzRCq+V3BOVe/5OR+8issvL0GpAtdFlLaXQcc4tOk7wZYY4Fz7t2SVGrDiv0SEcKsLtKHb61hUfq//Wz28Q+nVcs0M2OgibUKAQGqKR4VUjGlxC7eKzuI1/E24H3Gpc71gOJx4Pj/Z31v+AH4ZgThr436i3pwptJWDUpeNg62TMynGr9U3YHPOU+8aIBJowk35pT3FUMU2Bw==
Received: from AM0P195MB0386.EURP195.PROD.OUTLOOK.COM (2603:10a6:208:b4::32)
 by AS8P195MB1655.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:523::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Tue, 1 Apr
 2025 05:13:19 +0000
Received: from AM0P195MB0386.EURP195.PROD.OUTLOOK.COM
 ([fe80::3f8f:9315:c279:d35f]) by AM0P195MB0386.EURP195.PROD.OUTLOOK.COM
 ([fe80::3f8f:9315:c279:d35f%6]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 05:13:19 +0000
From: Yannic Moog <Y.Moog@phytec.de>
To: "Frank.li@nxp.com" <Frank.li@nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, Teresa Remmet
	<T.Remmet@phytec.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, Benjamin Hahn <B.Hahn@phytec.de>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, Yashwanth Varakala <Y.Varakala@phytec.de>, Jan Remmet
	<J.Remmet@phytec.de>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"festevam@gmail.com" <festevam@gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: add imx8mp-libra-rdk-fpsc board
Thread-Topic: [PATCH 2/3] arm64: dts: add imx8mp-libra-rdk-fpsc board
Thread-Index: AQHbn+IYkrwuKgSG0k6wm9yLMXMpFLONUA+AgAD5uwA=
Date: Tue, 1 Apr 2025 05:13:19 +0000
Message-ID: <9dd51df2a8a8c914c229991cf1419983c9cbdfc3.camel@phytec.de>
References:
 <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-0-28324c7f81fa@phytec.de>
	 <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-2-28324c7f81fa@phytec.de>
	 <Z+qkcZOv09roa1v4@lizhi-Precision-Tower-5810>
In-Reply-To: <Z+qkcZOv09roa1v4@lizhi-Precision-Tower-5810>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0P195MB0386:EE_|AS8P195MB1655:EE_
x-ms-office365-filtering-correlation-id: 57f1d6a8-bf2c-484f-6dd4-08dd70dbeace
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?R1lCWGx2NEt3RVQ3WkFlbU5OVGxFajY1aElZODFrRUNjNVkyWnB1U1BlNjNm?=
 =?utf-8?B?WWIvOVhwVnpxQTNDeEFiSmN2R05oQVZjMHBub3BVTmlZeWttTHNRK3g5VFMy?=
 =?utf-8?B?UVlHSVhWTXB5Z01tdkhwbWFVc3h6WTdCNFpqSXZvUllsUmRMd1UzYVptaXNw?=
 =?utf-8?B?N1JCUjM4b2Z0RUgwSVdiMFI1ZXJDdXZiQ0RsbVJ3S244RExTSk91N25DYUY1?=
 =?utf-8?B?b0xvTFJORlBnWEloZTh4UkR2b1V2YXR4bHJCMkJYV0I3eDVRRG1mRFNuSlZ1?=
 =?utf-8?B?WXhVSXJ3Qy90c21SbWlYcUlVc1MrK0tRTUVERWpLTlM0YmEvUzBaU3JTUVln?=
 =?utf-8?B?ZHhLdGtvMEhwNGRJNU1mV0ZWa3BUdzE3L2xsVjBhTmo2V3ZobjFNVmxKUmZT?=
 =?utf-8?B?L3M5Qi9DMDdJTVA0Si8wK2FxeUlTZTlnblNCMWdaMWhxeWZUWEh3SDVBNzJy?=
 =?utf-8?B?b3R6dlRCNXRKd1YrWEtWMnlqd2tvanhlVE85UVRjWWJQMFVCOVNvY1BGaVNs?=
 =?utf-8?B?bnhIMHYza2xmQzJ0LzhTOGZ4U1J3aEZJazJNQ3pibVI0MFNVWWJpM2k5clBn?=
 =?utf-8?B?ZkNUOXNiUktzODAxdTRBa0t0L3dEbzN5b2ZyODc3MjJpVTlVTVlsWUpFbEpW?=
 =?utf-8?B?V3pQVFNDMWkxVEp2S0lkSUFHOHNkamI0ZnJJaTRzK0JsYUhNR0YxWUNVQ1lH?=
 =?utf-8?B?Y1hTSjdVRFh1RWFtcVJwREg2OTFDall3QUhpSGhQaU1KK2JsTVVvcmp2MEl5?=
 =?utf-8?B?LzRUSGZtQ2lMVmUxZWp4QjFhbW1ITEJjR3V4Wlg3WGVBZjBySitoNitHZ0FR?=
 =?utf-8?B?ekdWdTc3eWdCYWlvOWMrcFV3N3hjbHh0T0ZYOVIxcGFkdjZuNXAwbHhvM0Mx?=
 =?utf-8?B?dnFyVytweUlhL1ZpUjQyWGZZdzRUZXNxczMzM1ZtSC93UGNSQ1B0SllBYTB4?=
 =?utf-8?B?WlpYeVRWZ2FYT0dGdnczOGJGUzlMQlJwMGlncm52enR2amVod1l3SU1JUm1N?=
 =?utf-8?B?YUc2YWZSWWIxY1dwaUVxbnRjTi9laXdUK1JWODhmZlR2aUtlQ0xwc1Bnc3Ay?=
 =?utf-8?B?bmZqdThjampuMGU5b01xMEFrYWFPSmhmbjg4RlZDdVVHYzJJNWpubkNPalh5?=
 =?utf-8?B?YnhPMEI1cklDQ0xpTHNZNzQrcGtvaDlDY2YwZVpkVnd0SHRXcjBaYTZ6QWF3?=
 =?utf-8?B?V1ZrSW9rRVN6a3d0TWdwaE5ERlZTOGJDWjUzNnpiZWVOdXhMYzdza3NUWHMx?=
 =?utf-8?B?ZFA3V3RJMld0NCsxenNjdHRmdW5pbXJBMXAwMzVSN01NNTFxSnpGRUs2ZEZv?=
 =?utf-8?B?bkhVRUwwUEVqM3FjQWVFYXA0TkFnU2NxMzVPUWpsa1NCaWlPMEZFYVdPZ2k2?=
 =?utf-8?B?QmczSFdnaWRRR0JaWE96QUIwRVg4Z0hHRVEyZGU3eGFLbnhkUEFyUlNJL3BB?=
 =?utf-8?B?SkpIQW1sTVF2M0FUbWw1ODN6Y0xaL1RlS2todmtwV0l4MFBzKzNqZDlzZzVT?=
 =?utf-8?B?b3hLK1RLcEU4U1ZMMlY2ckVSRW00SzEwWFNpc3VEY0tSUTZvS2JTUStTSU1T?=
 =?utf-8?B?emtXZ0RMU3dHMjJZd1JFMlJOdG51MGgwUVVmZm84cDF3N2w2RnNEZGlzMVE0?=
 =?utf-8?B?YzdKQkZYNHJKbmhRMEZPc0xpekJ6UytWZUp0ZzdJYnRobzcwcjdIbGFxTjF6?=
 =?utf-8?B?TmMwT08vdkVHd2Jlc08vUmpPM3VHd1NwN0Z5V3I1enkvYzlqVzdIZXpSbnls?=
 =?utf-8?B?QmRHMGVaMXpnNGxCY3lyMDN0d3NMZXYrRCtjakhVR0NlZGdhOGM1SVc0Tm9i?=
 =?utf-8?B?NTZQM3ArZENxckJockpvYUlZTjdWcEJ5ZGxubjBKTmpRWitVcHJJOEVFV290?=
 =?utf-8?B?ODRuWVlLVHNkR08vaWdVMUtNZzRZWFczWlNlT0w0d3J4d3c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0P195MB0386.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Zktka1hlZjJtWVZtRnBqTllna1Rwa292U1R4c3RnbVdxei9MTzVSVjRHeFdW?=
 =?utf-8?B?d0pvYzg1MGE5V0NnZFhFRlE5clRSNzZ1a29kZGxLaHlJeG9VeHVhRWdJN0Q0?=
 =?utf-8?B?NVN0czV3Z3U1UVZhbWoyUHBIRDQrSU0wMkRNYjJuMnFndlpmdFdkWTNQR1pV?=
 =?utf-8?B?NC80Y0FHb3R3THpLTUlhSWV6cFV2bXdjeExjNWg5U3dWZFV6emsxeDlBMklG?=
 =?utf-8?B?eXBIUEcwUTB3QWJaL3YxR0JGcDI0WTh5VE4vZk5tS003TFVEOFc0ZDRiM1Bz?=
 =?utf-8?B?U01EZ0JNa0prOEtCSW1KaXFsN3lBVjZheG9vTWZkRHRUYXdpaXJKdktkdWV2?=
 =?utf-8?B?d2ZDZTlma2MxQnNKOFFnUnJwbFI0U3FLaUJrSWtjNkFXMWV5U2ZmOGpwVmRZ?=
 =?utf-8?B?ZkVnbzNmc2JwSHZaQk4zcUpVUityL1FPNFZMRXVNckY5Q00ycFVub3BoM2pj?=
 =?utf-8?B?a0gyWU14QTNCTjVzVDZqRU5nL1FVNm41cGRtdmIrQWwxQ2h2R0J3Sno4YlFv?=
 =?utf-8?B?eG1Ia3ZRaFM3VU9ZQjM1d0dvZHEwYlR0bkFubzcwR3ZneVE5S1F4OUgvY1ZG?=
 =?utf-8?B?KzArNGxscUlsSHdNTzByQzl2QUNmbUNJNXhOci9YcHdBcHZGUVl1QlRqQjFN?=
 =?utf-8?B?bVczbmdPeDl0YkgxSVlTUTlMZklHUXllYVU2V2cwckE5cnpaWlg0T2t4bXlp?=
 =?utf-8?B?SlB0SXcvOXJRdjBaVnNOR3lDbUZDaWpvZEVIYlQ3d3NUZllqc0xyRExOOG9k?=
 =?utf-8?B?RHZ4N2M4Tm5uNk52WVpQdC9OZzR0TitGL2ZPTkZ1Mi9zY0JBTUNGY2RMVWNv?=
 =?utf-8?B?bXpsSTQ1L0hKeDlodk9xQ21NYTBHZEpOeDBsdlR0bWFtR2g4NzlwQkFPVEtN?=
 =?utf-8?B?d1JrcnFKZ2llQzN0dk8rQ1RrZHRHL2RIdDdoUGRRMnpxWjN2MW9RcVpTRTdM?=
 =?utf-8?B?R3M0dld5ZHgzaFkxRFhBQzBsRlhLUmwwdDNvQVlUMkh3L3FqaEt0MlBXNVNK?=
 =?utf-8?B?ejJRZUFTZHFtYmw1eElBaXR5Yks5S2xMUHpUdGtnUEtTbHFJTEJOY0JIM3Zk?=
 =?utf-8?B?NlF0M2RibDlFVmw1UUlRb3Z5SUxicDh0SGFsREw4RC9PQVBTZmUreUQ4Ukds?=
 =?utf-8?B?K1ZDeThZV1p3VmdmNTFZdTF3b3lRQVpWUFpEM3BSbHI0dGFPRHJjY0pBNGFO?=
 =?utf-8?B?WExlYmxkZHhDSlM4QXo3Ui9JNHdSQy8zbWt1OU4vYlIzbGs5UWNDNlpSeVpo?=
 =?utf-8?B?QUQ3ZXBIUkR2TktPLzNzREFUZ1BkM2UxcHpTSnByK3h0Uy9JQkVtWGRZTHcx?=
 =?utf-8?B?MVBwNTlVRmludDZ5VHlsZmhjb2RqcEltZDNwMTRMSW1IRGVzeThselQ0UlN6?=
 =?utf-8?B?RVRTdEJ4bVJCY2lPc3lqY21LZkZLczhQM1l2NWV0MnN0Uk9xUEh3b3RYRUxQ?=
 =?utf-8?B?b3pXMFR6VWc0aENseUpwOHE2RTJUejhUekZ3RGtDbEJaUVBoMENCMzB6Tzlt?=
 =?utf-8?B?REx5RERYMnR3QkhSRnNGWWQwOTd4dWtZQmFHZjg3VEZvZlM5dzdDK1QrVFpM?=
 =?utf-8?B?Zy9sNlVwMVNVakd1b2hnQjQxK0pzT0JicGVkQWJXbXdLL05LVmRWMjJDNHY5?=
 =?utf-8?B?WWhPM0pldlE5cmtFUjI0QW40ekhscEF4TXpHMVJPMDFNbmJ3NkNiU0dCeEFa?=
 =?utf-8?B?bVhqUFo3TmhEaTZ0YVVnY090TGx5NG94MWI0YWVsalVxSndGZVpwa1BkUG5R?=
 =?utf-8?B?OUMxVHVTWG1kc28ycDdhMHh6T1ZocjE4ckRldHFZdWNZTnUwcXRFbDEzZlUr?=
 =?utf-8?B?TzJFWU9oMXdCQytwd1VLbTJaY2lFTFVoSnUxL242Z2Z3alRnNTh5NWordWg1?=
 =?utf-8?B?TEozTzZocno0ekQ1dFZZR0FORDBSNWFsVWJ6cGJhYlhmSXpNWnlCZG5kZFc5?=
 =?utf-8?B?QVRDNXBCamlMWUwrdXJjYUNqb3hTZnVOS0t1ZWRyTjk3Ung0WmN0eGFvYm0y?=
 =?utf-8?B?a2ZHSjZnczhuZVB3MEhGb2NCWW9jTXNtcURhcjNtaFllL3ZiakN4LzN3U2s1?=
 =?utf-8?B?TzF3ZXlYNHcxUUJUWlFxQ1Z1U1krUEJoM1ZsQnQzUExObi9xVjZQcnVGcXhF?=
 =?utf-8?B?cmpEVE1XR015ckU3cmNpbWliUTlMYWVhSjA5RmFGcW54RVhWczFHTzh5aTUw?=
 =?utf-8?Q?fjNojUG9AwXVq46xmq+iAlDDG+e6Xcrb20m0vhRaWpgC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1EF9B1B322E2554BAD58A072BBDEFED3@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0P195MB0386.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f1d6a8-bf2c-484f-6dd4-08dd70dbeace
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 05:13:19.5801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aZw0Yoby3qs8AA6gpQPKMjfxo0PPjJHBw7B7d4laq8yhOkGaxyhKK4Y7TnS350nK1nqzGFUjcgSV/2N+GsWsew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB1655

SGkgRnJhbmssDQoNCk9uIE1vbiwgMjAyNS0wMy0zMSBhdCAxMDoxOSAtMDQwMCwgRnJhbmsgTGkg
d3JvdGU6DQo+IE9uIEZyaSwgTWFyIDI4LCAyMDI1IGF0IDAyOjA0OjM4UE0gKzAxMDAsIFlhbm5p
YyBNb29nIHdyb3RlOg0KPiA+IEFkZCBkZXZpY2UgdHJlZSBmb3IgdGhlIExpYnJhLWkuTVggOE0g
UGx1cyBGUFNDIGJvYXJkLiBUaGUgTGlicmEgaXMNCj4gPiBhDQo+ID4gcHVyZSBkZXZlbG9wbWVu
dCBib2FyZCBhbmQgaGFzIGhhcmR3YXJlIHRvIHN1cHBvcnQgRlBTQy0yNC1BLjAgc2V0DQo+ID4g
b2YNCj4gPiBmZWF0dXJlcy4gVGhlIHBoeUNPUkUtaS5NWCA4TSBQbHVzIEZQU0MgWzFdIFNvTSB1
c2VzIG9ubHkgYSBzdWJzZXQNCj4gPiBvZg0KPiA+IHRoZSBoYXJkd2FyZSBmZWF0dXJlcyBvZiB0
aGUgTGlicmEgYm9hcmQuIFRoZSBwaHlDT1JFLWkuTVg4TVAgRlBTQw0KPiA+IGl0c2VsZiBpcyBh
IFN5c3RlbSBvbiBNb2R1bGUgYmFzZWQgb24gdGhlIGkuTVggOE0gUGx1cyBTb0MNCj4gPiB1dGls
aXppbmcgdGhlDQo+ID4gRnV0dXJlIFByb29mIFNvbGRlciBDb3JlIFsyXSBzdGFuZGFyZC4NCj4g
PiANCj4gPiBUbyBiZSBhYmxlIHRvIGVhc2lseSBtYXAgRlBTQyBpbnRlcmZhY2UgbmFtZXMgdG8g
U29DIGludGVyZmFjZXMsDQo+ID4gdGhlDQo+ID4gRlBTQyBpbnRlcmZhY2UgbmFtZXMgYXJlIGFk
ZGVkIGFzIGlubGluZSBjb21tZW50cy4gRXhhbXBsZToNCj4gPiANCj4gPiAmaTJjNSB7IC8qIEky
QzQgKi8NCj4gPiAJcGluY3RybC0wID0gPCZwaW5jdHJsX2kyYzU+Ow0KPiA+IAlbLi4uXQ0KPiA+
IH07DQo+ID4gDQo+ID4gSGVyZSwgSTJDNCBpcyB0aGUgRlBTQyBpbnRlcmZhY2UgbmFtZS4gVGhl
IGkyYzUgaW5zdGFuY2Ugb2YgdGhlDQo+ID4gaS5NWCA4TSBQbHVzDQo+ID4gU29DIGlzIHVzZWQg
dG8gZnVsZmlsbCB0aGUgaTJjIGZ1bmN0aW9uYWxpdHkgYW5kIGl0cyBzaWduYWxzIGFyZQ0KPiA+
IHJvdXRlZA0KPiA+IHRvIHRoZSBGUFNDIEkyQzQgc2lnbmFsIHBpbnM6DQo+ID4gDQo+ID4gcGlu
Y3RybF9pMmM1OiBpMmM1Z3JwIHsNCj4gPiAJZnNsLHBpbnMgPSA8DQo+ID4gCQlNWDhNUF9JT01V
WENfU1BESUZfUlhfX0kyQzVfU0RBCQkweA0KPiA+IDQwMDAwMWMyCS8qIEkyQzRfU0RBICovDQo+
ID4gCQlNWDhNUF9JT01VWENfU0FJNV9SWEQwX19JMkM1X1NDTAkweDQwMDAwMWMyDQo+ID4gCS8q
IEkyQzRfU0NMICovDQo+ID4gCT47DQo+ID4gfTsNCj4gPiANCj4gPiBUaGUgZmVhdHVyZXMgYXJl
IGFsbW9zdCBpZGVudGljYWwgdG8gdGhlIGV4aXN0aW5nIHBoeUNPUkUtaS5NWCA4TQ0KPiA+IFBs
dXMNCj4gPiBTb00sIGJ1dCB0aGUgcGluIG11eGluZyBpcyBkaWZmZXJlbnQgZHVlIHRvIHRoZSBG
UFNDIHN0YW5kYXJkIGFzDQo+ID4gd2VsbCBhcw0KPiA+IDEuOFYgSU8gdm9sdGFnZSBpbnN0ZWFk
IG9mIDMuM1YuDQo+ID4gDQo+ID4gWzFdDQo+ID4gaHR0cHM6Ly93d3cucGh5dGVjLmV1L2VuL3By
b2R1a3RlL3N5c3RlbS1vbi1tb2R1bGVzL3BoeWNvcmUtaW14LThtLXBsdXMtZnBzYy8NCj4gPiBb
Ml0gaHR0cHM6Ly93d3cucGh5dGVjLmV1L2VuL3Byb2R1a3RlL3N5c3RlbS1vbi1tb2R1bGVzL2Zw
c2MvDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogWWFubmljIE1vb2cgPHkubW9vZ0BwaHl0ZWMu
ZGU+DQo+ID4gLS0tDQo+ID4gwqBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9NYWtlZmls
ZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsNCj4gPiDCoC4uLi9ib290L2R0cy9m
cmVlc2NhbGUvaW14OG1wLWxpYnJhLXJkay1mcHNjLmR0c8KgwqAgfCAyOTEgKysrKysrKysNCj4g
PiDCoC4uLi9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1wLXBoeWNvcmUtZnBzYy5kdHNpwqDCoMKg
IHwgNzk2DQo+ID4gKysrKysrKysrKysrKysrKysrKysrDQo+IA0KPiBOZXcgZHRzIGZpbGUgc3Vn
Z2VzdCBydW4gaHR0cHM6Ly9naXRodWIuY29tL2x6bnVhYS9kdC1mb3JtYXTCoHRvIG1ha2UNCj4g
c3VyZQ0KPiBub2RlcyBjb3JyZWN0IG9yZGVyLg0KDQpUaGFuayB5b3UgZm9yIHRoZSBoaW50LCB3
aWxsIGRvLg0KDQpZYW5uaWMNCg0KPiANCj4gRnJhbmsNCj4gDQo+IA0KDQpbLi4uXQ0K
