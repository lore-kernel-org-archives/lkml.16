Received: from esa10.fujitsucc.c3s2.iphmx.com (esa10.fujitsucc.c3s2.iphmx.com [68.232.159.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FFA8C1E;
	Tue,  4 Feb 2025 00:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.159.247
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738628632; cv=fail; b=tKfEfYQuwwRxvHYnyJ8V+5JXxemtRMeWEeBEDfbG7TCvqBL/NB4Yq2Wio0NdeHot7lNGbJZVgH49UMP5tgssyQb/2lSkiLhdIsQSWnli/ehEiZTY7MQ3joiWCsPAkxKVZWLX9qu774WhLunBO+SuVlXErTpSMhr9GtGyLbrMxYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738628632; c=relaxed/simple;
	bh=jNiDkIsP2h3j3FpPY5UH1p4cf0z6o6Mq/fGjTPXIGmM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DIav9MeXJBWH342yzXntxOmBjVDrw9melglfe9K7iaAtv9qxN4uTblCcuj1PrLljBX19BZ0mQGw5fn+Lzjh5NfImDzerYEnGsarIt7/hnMZf03Ve5zuc4h+lIdVpH7J+EOe5hiI11LzZPhhi9GaQfZegp1r0ZTME4FSL+zGaxfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=PagsYfvO; arc=fail smtp.client-ip=68.232.159.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="PagsYfvO"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1738628629; x=1770164629;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jNiDkIsP2h3j3FpPY5UH1p4cf0z6o6Mq/fGjTPXIGmM=;
  b=PagsYfvOYp6LOfzrOerb5ynCbDciUyHPKT+6TKZGbZGLXwcNftQpWGcS
   NEGawCWsqLT81JyYjxv6i5xw1yWkmKN5fCMJkPKJqi1HcnNujnODLtweP
   tklHjuIS9JB9I0Qo2IncxqmHq0S4p030Jla6EnNzobbc6ItgmVtujZ4c/
   V0IvCfL9qkScbtZ3cfqoc4Qv7E2QcbOpqrMsbFCC9rL7ujL7+dQwY40L2
   pAi43HUwj8IegaPSA5uV1G46qUE55pHlkA+XX/B2lZ/FuRcokQc+Rs2Qp
   x+PY5Z0vx0IjB+OIXyx93ZJKQmISGICYTtLJ3lUIjsGNE5B9JXmeVlMCK
   w==;
X-CSE-ConnectionGUID: BptvsNI/QxCll3rmVXWEqg==
X-CSE-MsgGUID: Gswnl8/eS62gTDiNVCYUtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="145323876"
X-IronPort-AV: E=Sophos;i="6.13,257,1732546800"; 
   d="scan'208";a="145323876"
Received: from mail-japaneastazlp17011029.outbound.protection.outlook.com (HELO TYVP286CU001.outbound.protection.outlook.com) ([40.93.73.29])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:23:42 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iB8aSXEXWNNCk++HOKHKAzjJ285uObpDiWBNRGhmf5NGwsE0D2w1gvYiCSL08eO2KPR7Djs5E2/+Ueq8vjQh4YDDdmT8snv8nTHUHStA4x2DPHdDST61LMfq36l3Av1LUrMSbP0IvX6KnCCpua9IwUB40pnuLhiIpE6EOJhWGnUXano3gcycmWt/BIugrOw9HdpBJ1qGAL7lCiTqFxE48SF8egMbzeqCCrDZc9vATRdEGlmIRqpyY5zZ5h/hELfGLL1bSfrrclPgznwI4RiI9f2+K55grneDSQDcclY0xJrsHmEVO1WF9H1OdPPhFKkDNMSiAbG3Vsh0tlFjz+1rAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNiDkIsP2h3j3FpPY5UH1p4cf0z6o6Mq/fGjTPXIGmM=;
 b=MsVs/eUXkfzQp3n0LA/orFCoxhhYsAUDMQXj+7WLIkRTJwEWf41NEzS94/l83qgoXEZICsSk0l9VMmuNzHW15d+VrGo4l/Jon9u5s9/o0Jon2eqk0cJs3M+Ez6JuIpDI+tzwi4imafXV4zYs0AjiFxZMaaTcJ5ic4W8mJsuDXMkDWKMunM9Xn2Apt8wmXDAwegKkTzo9YLoDdvJAV7O+ydCPRjfycDB0ZqKhht1yJoSKhuIC9p6SDF8flVeoSjJ8pxMIb6/8uVYU9faqmhmy1YOnjqSGyEtSr9Z2t8xYAHp3sFK9kjy1aiLx16aL7Ogs+OdOODcqaYd8lHHfAUKjVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS3PR01MB6903.jpnprd01.prod.outlook.com (2603:1096:604:12c::9)
 by TYCPR01MB6142.jpnprd01.prod.outlook.com (2603:1096:400:60::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Tue, 4 Feb
 2025 00:23:39 +0000
Received: from OS3PR01MB6903.jpnprd01.prod.outlook.com
 ([fe80::df96:5745:d1b5:cafe]) by OS3PR01MB6903.jpnprd01.prod.outlook.com
 ([fe80::df96:5745:d1b5:cafe%4]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 00:23:39 +0000
From: "Yoshihiro Furudera (Fujitsu)" <fj5100bi@fujitsu.com>
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
Thread-Index: AQHbZ9NsO46uwuCehEGOGiHfWDaHmrMvolwAgAWk0TCAAEA7gIAA3QdA
Date: Tue, 4 Feb 2025 00:23:38 +0000
Message-ID:
 <OS3PR01MB69032C6E06A7535E848CDF69D4F42@OS3PR01MB6903.jpnprd01.prod.outlook.com>
References: <20250116045911.3382537-1-fj5100bi@fujitsu.com>
	<20250116045911.3382537-2-fj5100bi@fujitsu.com>
	<20250130170422.00004c6f@huawei.com>
	<OS3PR01MB6903DC3738709A4536A62613D4F52@OS3PR01MB6903.jpnprd01.prod.outlook.com>
 <20250203110527.00006747@huawei.com>
In-Reply-To: <20250203110527.00006747@huawei.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9MGNjMGI0NWQtOTI1OC00N2ZiLTk1NmMtOWE4N2ZkZjE5?=
 =?utf-8?B?MDhjO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTAyLTA0VDAwOjIxOjQwWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?Q?81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB6903:EE_|TYCPR01MB6142:EE_
x-ms-office365-filtering-correlation-id: 9511664c-aa52-4934-c78e-08dd44b22bdf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|1580799027|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L3VFaGJRUTBzUmxJSy9IWEg1NC9iQXp0RG8rNHIwUkZ0dnRISWVaQURqaTc4?=
 =?utf-8?B?SmkvZmN5T21abzg5bzg0bmlGQU9XbU1WS2l2aGFLdThEakhxU3JtUEx6ZHZG?=
 =?utf-8?B?cFMwYzR0TWVnK0RzdWc0MUFjODVJbm1ISDRzYW1sbVc5WjkzMFFFamFKUDUx?=
 =?utf-8?B?S3IrVzlTZ1dxeXJ0U0RjWnBobXM0Mk1oZzhOeElOY0R3YTRSc0N1ZGRNaE5m?=
 =?utf-8?B?dWI5bDdtQ3FFcFdsSEY4VWJBU1JLZHVNSnlkMmtlV1AvQVZYVWM1WWlObFgv?=
 =?utf-8?B?L1YvSGlWQmFHakRKMFhLYTR1VkR2Ync2UWxJcTVSdlUxY04vTWJzUWxib0dQ?=
 =?utf-8?B?OStCNmNSOUNJL09zSUFUZFJOTXR6NjVNQjhyYlF2UWpadFVqMHk4aUlqY0d4?=
 =?utf-8?B?RUVYK3Z5SWtxdFQveXVkbHVKczFVa2hVQUdyQXFzZzlNMXlESkFzUHZ3UWh6?=
 =?utf-8?B?NjhORUdTdnRYZ05uUTE5RUJmYVRwZGhpWndqQ05vZXljOXZzcERRZXJ2QkhP?=
 =?utf-8?B?UXFJT0xQVmNWcGNYU00rd3lQOEFxV0xRaXdFUTAxQnloeGdNYVRSZk9jcFcz?=
 =?utf-8?B?ajE3MTl1MmtRTmxRdSt3SDJoNEhrUTdKeEVXcXJSczJzM2U2YTI1ZzJRV3g0?=
 =?utf-8?B?MDlBbzFPdXVjL0pRZFI4Mk1kKzZRZWUwZENWdXYwVjFObGZSSzhhRDdiaE5q?=
 =?utf-8?B?cS9penRrd2RSakY2cm5vSE5YWXhWM1RMdWI0TldMK0pxMUVONG1XMWh1bDNu?=
 =?utf-8?B?Wkh0M0Z1Uno0R0FDck5USTFYYnZUMGxrQUJSRkd4WERsT2dkUDV5aFliMHN6?=
 =?utf-8?B?bDY3aHRkc01LTWxNd2xyaCtoU0NqRWFiL1A0YTMwdVAzRmloWmo0OUk4RTZK?=
 =?utf-8?B?SFlVczQ4RVNXY0xqeEg1SndtMVNJcWt4RC9NdUZsU21VQUIrS2ZHZ3BoL1lI?=
 =?utf-8?B?M1NpeXQ4ODl6U2NhRUVKYm9EWnY3Yy84M20zcGU2cDRjWDJnVGM0U0hyM2JB?=
 =?utf-8?B?V2V5WmxQejJNd1pBTWpHWFo0eTdvb0xkbjZnV2FNTnNjM1RpK0pnR3p4WEFs?=
 =?utf-8?B?QkhuaDRkYUM4dDBoUjY0LzZ2aU40N3RGVktlUGRMSWZadHBNYTc2KzY4UnEr?=
 =?utf-8?B?TmE0S2l3UGFPMDZweWRDQktaQU12TWo0Q3hJWFBPcncxTElwdXR0a2lDKzYy?=
 =?utf-8?B?QWtxaU1YOHhkQklGWGJKUjBDRFM2bWlqUkt2dHBsd091bnM3QmhEZjVFaEhT?=
 =?utf-8?B?WGRQNXdiNkpwSGorcmRBZUZBZERDTFlNVG5PeUsvTDdsaUl6M2lPeEh1amZk?=
 =?utf-8?B?SWtYYWtsS3hyMXhqdTVFVy9yYy9rVUpyclFxdmkrbWU2UW10MitZNFRtL1dJ?=
 =?utf-8?B?bjNLcUdCbUx5Wjd5MjliZGpvdFJLUVN1RWlDcHRoZTdNbWVydjBBN1AyTVJZ?=
 =?utf-8?B?UlFMZjJDNUJuUVRVYjdpb0RFZGkxTUllMFVsYmZreWZSQTdsSmNRU1pRMCt6?=
 =?utf-8?B?ZjZmMExvMkhWMlBWSzNYSkJEY21NUmhyeU54VEZkZEFveXd5eGpJeFdxa21V?=
 =?utf-8?B?WDVJMU1TTUtFTlJWMzFPWDBHb2Zqd1NMMkVoOXlxL3ZkZUhlU2FOeU5QWHlJ?=
 =?utf-8?B?eU1Jd2FJMUxyWndmMlkrcHcweDBZR0R0M0o5NURWKzZlRzRPR3lWSk5rd2lF?=
 =?utf-8?B?d3Z0REFLRXVhOWt1dWkyWWROTExoS2ZqVGdub1BaU01XZ05uM3FNd3FKdjN2?=
 =?utf-8?B?aVRqaVBPSlJjTUZsUnhCRlNNN1Qzd2xkdmcrT0VIR3EwRk9oNHNlaVJ2VHow?=
 =?utf-8?B?UHRuejBJemdwL2lDampGdjVJbVZyRTFwNVFybXNDSDB0K3lQZWZnZ0FOUG9D?=
 =?utf-8?B?R1AwWHd3U1ZJMVYzd1FRQytQaEFJZGxpNVk2ZHRjNkhrcUZLQU42L0h2WlRo?=
 =?utf-8?B?bzg4OHdlQmFtUVgyVlZwVWhlbncrbklNakpEb0ZXZFFWZ0YyaGtIdC92NHFP?=
 =?utf-8?B?QTVOS3kzNk93PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6903.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UGFFenRQL0ZYcVJyc09sd2liMW9OcGhnbUdURHRrVEo4d0JaL0FZZHEzNW4y?=
 =?utf-8?B?a3c4K3puaFZNZ1FTNVlMRzN2bEgzT1ZiY3R1dkdodjNsWWpOditRMEJGZzVi?=
 =?utf-8?B?V3FwRUNhZGJhRzZ5YlZCdzdaQVgwSTRYMGQyRFFaWnhQTS9uKys1SVUrUFk5?=
 =?utf-8?B?MDVNaTQrcnZSUm9ycEY1cmtNRTBPWXF2S2FJUEVMMU1mZldSems5TENQOGVu?=
 =?utf-8?B?QXIwZUxyWUMxNGJ3czBBQnk1TXBOeVZXTXJHQURXbzBiZ2NVQWdad21pZGZq?=
 =?utf-8?B?NDJyNURnTFBoSmtOTnZTMDgyVHYyZkVCV0FEVnpQNlgzOW9RcTlFajFIck1V?=
 =?utf-8?B?ZFlGd3BwNDVyV29XNFVBay9BM3Z2aTZ6eHZLcnJCWlM4RXZzR1Z3alQyQlJI?=
 =?utf-8?B?RE50d1pVUjJrWmlQV1RUK0ZhVEU2UmsvdndhWDVnUmVtczlWdGgvRnczZmgy?=
 =?utf-8?B?SU1pZ3JwLy9rcFRpVHhvWHQzeGZFMHRrMENSdkVFazU2K1RpaGJhK3dIVFcz?=
 =?utf-8?B?ek92dE9nbFhGeDdwVW5wamQwVnp6UGtwKzFESDBNdEFsaGdnTlRXVDU2WVhL?=
 =?utf-8?B?a2o3RjRwTjc4c3c0RGhjS3lNbi9YUGF3UW4vR3Q0cVRBYlB1a1RZZ2RPUEpR?=
 =?utf-8?B?T2dMNGg5UFo1K1laMTlnU1FKU05qQmwrQnJRbVE0dEZBR1lTajc0ZjFZMDky?=
 =?utf-8?B?Mm5sVVhEaFkzakp6cUUwdjlQQlJURGVFdDRzRzE4dGpmaDZ0VXlDLzdrWFNX?=
 =?utf-8?B?MlVzd2R3RVZuYVQvNlhhODZSM2xQVjhWWWhLbnpKUEo0Q0NndGxYblZaaTRJ?=
 =?utf-8?B?QW1aQ3JxSVJQbFJmQWN6c0ZWOTZycWJ4eG5OWnV1R2FmRXc3cGtHT3UxaFk3?=
 =?utf-8?B?U1FRdTlYK090d1BMOSs4QkJlUGFJYVA0eGsvVU5HUWw2NzRRQW1JS3BDU3lM?=
 =?utf-8?B?RG8zay9EZEZYWUFSUHJWL2tVUllUbmZTL0Y2aG5FL3RGRFFjK2srS3FpNXFk?=
 =?utf-8?B?ZUhZcVVuRldpWTh0WkZqbkR6TE9nTEdOdUJiL2pEWDNEc1hBSFF0U2Q4WWI5?=
 =?utf-8?B?bUlaaFRmUGFoSThzV0JTYndOMm9PVDNKQlFLRnhwWDNkYVdzeWZyQW80S1Rp?=
 =?utf-8?B?WjhNRlhFSVJCVjk2L2JGQU1XQ3RqQSttd3NMOExIcWVodVEySVhvOWRLcXBQ?=
 =?utf-8?B?V0s4TGhpS1loblBEUlI5SFlEYXFIZXZySFdOSWUyVmxzakR2WjZ6OHBpbkRJ?=
 =?utf-8?B?VWhyMitQRGd2UEJKb2dFd0t1R3VHMlczUVQ3Vk9hNTUrQkJZSzAwbUpRV202?=
 =?utf-8?B?RTlxdjNhZm12Nk5xU1BrWEQ3QlgveUhLOUpQbC9qUlg1YzdUT3pLSFZUTVp5?=
 =?utf-8?B?bzlNcGZiV0ppeDZrei9LZXdZK3p2TnNtb3UyaGhSTXBtcVJVdHVQUS9rdVhG?=
 =?utf-8?B?TnVoSGVJdDRCU2U3RFgrWEZxaWdkdVFNY3lnR2FJeTNDdmh5b1BSbnFqYkdY?=
 =?utf-8?B?Z25SQWphZzlRL0xYWTN2bnp2V3BxTHBBR0JIbW1hS0F6OVFaYVNEN3Y2NDRO?=
 =?utf-8?B?UTdSeUl4enZPSHdOT1NNNEpJMUUyWGVEd0dra1RzczBCRXY5TTF3emFrM2pn?=
 =?utf-8?B?NTdCakYxbzVWcDBENkw0TG9ESG55YTFQTGJBbU5xRUdnVVovcW5pRDE3Z3dy?=
 =?utf-8?B?eHZnRVNlWkpQWFR4MzlKNnNYRjZBTmdLelJ3ZzhQL2cxelNCVTNuQ3hTR0NN?=
 =?utf-8?B?NC9vQzZ4VDVSWXZ4TVJDVXRreDlsSTI0bnlLZ1hRaHVHSGJXbWZJVlQ0cmtS?=
 =?utf-8?B?RDN2NjFwbE1vaG4weEhEYzVETElkbXFIZjBsaWJYd0pVTzdpWjM2d2xpbEhH?=
 =?utf-8?B?amRSOFErZ3RXUkxYYUxRbkRSQjl6enhvRUcwZVc3d3plVEVKdkZCN0wxa3Bo?=
 =?utf-8?B?aFQ2OWJjenE4VVdNQXN5U2Jlb25ZeVY5eGhLSUN5TzJscmlTUXh1bmFLOFI5?=
 =?utf-8?B?M3Y2OWxHcGJ2R1BQTW5wQnJreS9MdDhHalVJUDJDZkJUV0ErbzZZendBb05T?=
 =?utf-8?B?Y3k4VjAxbTM3cXVMT3BFVUdiS3MzcDBwYi9qb2c2TUErNWlYOVdobm9oWVB5?=
 =?utf-8?Q?wLuXXk44XTzHBvYw3O/VF5B5s?=
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
	cxGAnPpQW4YvK/R1237W99G6gh6x2pI3ZH60nAsZcPfByHnlIO7s3SUqqGwCxOtdehQY0a2xcCe9tIgO6FGDgU/Hqq3NyLizqNFopWrNrCfgnVq97rcsxxyfH9fhOd58YtqwmOvUWhHwBtXA1m3Y2sppzohvysPK6Da469EhlylWRCxLlsipgMCbpEk/a4fFuOwE2fRFJgabbGdbOV8O69MoMdhU44gDfq2rNkhfg41pCy8Wo/rd90+MNrKL9y0PPZiGI1A2l/5PjcDoMV4aV/gEQaTOGIZeDWFUJvJseoyYx7e+3AqPAsYy7yDnXQdChTra8M+9Y1niTDWgQW/9nT57yYzciMAWhtMKpVBwpifkWKm9W1Qwk4OdqzJEKNaCJplQ6jj6+o6iH2LGIk5lp1Lp1MZdaBuv7cJO9eOw/iGFpIT0esVoTbV4q91lcSDJyA6cs1INfsS1gHjpSMQtuWUX3iXcNfQznpclu/974DJVeoVj+x0MNr1Y9Fx7YdhBqqZwgKF+ArInSaL64u/gQjQ0kvyih24D8YFI4Pv0Jzm0FXtBJh6+HzE1/lk3VZLhhs1BUtCrEaOluR8KY6wvAtH7HccG3cnDiRv0k/HdJ7tLGeEf34ZVu3bolDwtJSfR
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6903.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9511664c-aa52-4934-c78e-08dd44b22bdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 00:23:38.7153
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m+SaXe6C3B/IS24p/9rfhrUspFvDWKMXrx4WdDnkl03qxtT1RXNOTZH32egFsjUqnqy+MijN1rJhZwTbC/yJoNxa2NpqWwlvjlaopKQast0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6142

SGksIEpvbmF0aGFuDQogDQo+IE9uIE1vbiwgMyBGZWIgMjAyNSAwNzoxODozOCArMDAwMA0KPiAi
WW9zaGloaXJvIEZ1cnVkZXJhIChGdWppdHN1KSIgPGZqNTEwMGJpQGZ1aml0c3UuY29tPiB3cm90
ZToNCj4gDQo+ID4gPg0KPiA+ID4gbW9kX2RldmljZXRhYmxlLmgNCj4gPiA+IGZvciB0aGUgYWNw
aSBkZXZpY2UgdGFibGUuDQo+ID4NCj4gPiBBZnRlciBjaGVja2luZywgSSBmb3VuZCB0aGF0DQo+
ID4gbGludXgvbW9kX2RldmljZXRhYmxlLmggaXMgaW5jbHVkZWQgaW4gbGludXgvYWNwaS5oLg0K
PiANCj4gVHJ1ZSBidXQgd2l0aCBhIGZldyByZWFsbHkgdGlnaHRseSBjb3VwbGUgZXhjZXB0aW9u
cywgbm9ybWFsIGtlcm5lbCBwb2xpY3kgaXMgZm9sbG93DQo+IGluY2x1ZGUgd2hhdCB5b3UgdXNl
IHByaW5jaXBsZXMuDQoNCk9rLCBJIGluY2x1ZGUgbGludXgvbW9kX2RldmljZXRhYmxlLmguDQoN
CkJlc3QgUmVnYXJkcywNCllvc2hpaGlybyBGdXJ1ZGVyYQ0K
