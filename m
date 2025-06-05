Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D0E6D17;
	Thu,  5 Jun 2025 00:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749083028; cv=fail; b=HCrwXDDo2JC6awCSTsHX6KUVy4ZHKklsqCnr1BC2TinF83Op7s6WtGcMQtsw0fGBtTDujWviY2IlSB843rMAkbZCndz//bfphOc5t9hTW5vnacgH1NsyftzWGsxhDU84Y9EJyZHQBM4nrUHX9ROQiXg/lETGAjxb8gzcK6idOeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749083028; c=relaxed/simple;
	bh=OswQKrCE9D6qAZBgIWjtvOXURUJM0UB9/JRrFHSSnNw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EN9fGm5wdSlvWVvpuvxkIhywbjTsJuZflwUicbl2DisFVKUnuy3BLlXVCusSWTu+LPwSY08bC/kzI5rfxoCW94nyQTYOpNvPza+x0Se+xUaSpBDtedgRiX6VlCUwH5H9Wh/hOVdjuoEnW14GYHOLTqJsbfu+RZqCpdmQuW8nmPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kwXHm2FN; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Exl2clL+; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Oaf64Kaf reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kwXHm2FN";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Exl2clL+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Oaf64Kaf"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554Guv5I023707;
	Wed, 4 Jun 2025 17:23:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=OswQKrCE9D6qAZBgIWjtvOXURUJM0UB9/JRrFHSSnNw=; b=
	kwXHm2FNiq52rQnmtR+XMxk5gdfo8QCNpYvX0VCJE/5z9UmhNH/6e4TcB0KgN9fg
	CWq2Iv3paZpKsUUQsfj1rWqbb+5v7BjCMvZJxACYk/xhWkn6wyaWPUlSlSeQstiZ
	m8R0LGw5PdtP5l7Z/WD0x6K+4KL6V8ZNxANRoMVF3Y+jWFPZNvjq6Fe11uCBYx4X
	zx1ai3JVnza8hRnJpplebZV8dB2XgOiavrkzu1ADJVQJpz9P2Bnnd2tIYZvm3GKN
	BXZBAa9RtsIodlr+7aodrG7ll6SBCS33nzwErBzKcYpbxwYCv7hR9XkGi15656dM
	evKjIIMdnihd2XWdcc0tQA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 471g9mcr0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 17:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1749083019; bh=OswQKrCE9D6qAZBgIWjtvOXURUJM0UB9/JRrFHSSnNw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Exl2clL+Lw+znjZsO+og263qcFBHs3zfNBrUgEc8T+4zF3CM4ldumpe2Zd42NxtCj
	 aQwSKAT75u49qFIKQiuxP/mV83U8m63ewdOAb3cp89ULQfHav/QBYvXlW1jM5NOFwj
	 qP6+MDxJ5d4TUBB1j2MkbJS3PfTOuRZDqzEF9KMwvquyKjF5zS5Koqjod5gLfosnpa
	 989Tz6kXKRK6JV7ts2hdIucyKX7S68w4kJF4CyfzuuPH4FOH6HgmQ+Me3+frYDGHCb
	 eBAUl+QLDRp1R0WzK80y+BajNHERoBHj2UQOVPH8+8QNMk6yjfnMoaUY0GFtLCdw1x
	 CsiLapbE8PFfA==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0F7A5401D3;
	Thu,  5 Jun 2025 00:23:38 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 49D5FA006E;
	Thu,  5 Jun 2025 00:23:37 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Oaf64Kaf;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id AFB7B40115;
	Thu,  5 Jun 2025 00:23:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pz8KOxx06OsSHL2tkpvbGEmn1jhDzp0guMPNtf9RyLsmeovtscjlAY6m5GulT6b7qam9JbPOIU5e5/kAoO+YAINObaayPNFHlddHof/kBmPXDUhdQz/yzwmFJYaAEg8jP5F3HbqC4g5qXrSCAVMxakwBZYDJyfD3uJcKCq8e/itY7yU4NnqqNRUkmFn812QJwm1r5ne47+q9B2UhJ/SLEkWL+9o6m6S2uQHCu3GTpCzR29gJNMaDOhM2M7x2LO07Tlifn3KW/g1Zgmdi0nfVA4FwosRwBYV/chXH20sHXmSC4Aj2Nf+J+RUTPc6UO2GHtrb0gA03b0gS3ol/x20ENg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OswQKrCE9D6qAZBgIWjtvOXURUJM0UB9/JRrFHSSnNw=;
 b=S3lHM+WBJkrTPOVmfJLzS22SOA76Q69BteuxxP0R1FWT098vlzEEgb21dzRaYTd9MSkg8lPD5wSaoSaJHz3jIuHlYtBxYmWqKSUOF8sZY+6nopOSza/r1WYrq6wUZapMRRZznEGCsOWmoFzZ/YDQ9hMcEYXiVVrOGxj+q9BfZxnnFNWnuXzZ/Sw5VXqVtLdySC3IVkMpDYhTMMno7nPBQBz1ahHRHLQcklLpivqYzry78WU2P6Z6Aa6Gg5ZbyftRccvaPxlY/vBDOThRLhZIEr2p9vby5XQebZA/L51l6uAUO4jOZ+RKwBbEe0l1iBzQ1BEN8PyXKcQ517ZRCqf9gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OswQKrCE9D6qAZBgIWjtvOXURUJM0UB9/JRrFHSSnNw=;
 b=Oaf64Kaf50bRYQcs6k58eAguXX9ES2H1EC7VCIE6Nc+y62D3JpwwQr0HlY3vQv1blPoRU4RZqgA4wgXYaezlLZWxjch7o7mDsf6AJQcRWG+FzM4IPwThBNuDbPXjo+WGzcTTP7nJXBT8b1SLnJ/kueP17TtAcqPsY4DBlhXRiXc=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ2PR12MB8977.namprd12.prod.outlook.com (2603:10b6:a03:539::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Thu, 5 Jun
 2025 00:23:31 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8792.033; Thu, 5 Jun 2025
 00:23:30 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "michal.simek@amd.com" <michal.simek@amd.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "git@amd.com" <git@amd.com>
Subject: Re: [PATCH] usb: dwc3: xilinx: add shutdown callback
Thread-Topic: [PATCH] usb: dwc3: xilinx: add shutdown callback
Thread-Index: AQHb1Lsg783Hy0cMI0KtXijswhyhF7PztqUA
Date: Thu, 5 Jun 2025 00:23:30 +0000
Message-ID: <20250605002326.lbv2ltj2nfqj7s3u@synopsys.com>
References: <1748977771-714153-1-git-send-email-radhey.shyam.pandey@amd.com>
In-Reply-To: <1748977771-714153-1-git-send-email-radhey.shyam.pandey@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ2PR12MB8977:EE_
x-ms-office365-filtering-correlation-id: 1360fa3f-d169-473b-e4d2-08dda3c732df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L0hVZk40bTlKWC83Y3RwdWpxUVg1UEluK3l2a2F1SElVK0szN1V3bDJIOXBW?=
 =?utf-8?B?dFg0OXJiakhQeGlVbExKWEdDZXVPdXNZTmdib1pCbVErT0tQbU02RWlqN2M4?=
 =?utf-8?B?M1B6MkhTMzdIUXcvT2traTJrc2V2M0c0Ym5ubERYenI1L0Nid3h2WXdOVkUr?=
 =?utf-8?B?b3crZ3BpVzMybU9Fb0hwMnRjWk0vcDl0bmh2Mmt0RlNybUVkZzNCdlhWbk5n?=
 =?utf-8?B?aXQwU0hhdUs2N1JYcUMzRENUbFF5TEgyR21zdUhBMzNoU1Y3cEg3aUtKUDRw?=
 =?utf-8?B?dHZIanFLZENGbEJndUF6cFB6dCt0dG02Q3BzcGlIKzhUSnNCeHpvUTgrSjR0?=
 =?utf-8?B?OXN3dUNWdndCbnR4T0o2TXZzOFJtTVRFeXB0c0lUTWpUbUNsWkZ5YmViRzV5?=
 =?utf-8?B?UFk2UG90NEMrRnRvRmRaaHZqcG81ZFNtQW0rVHVHT3dDelNQa1RDNVRRTEFW?=
 =?utf-8?B?N1dQaDdrVXF3MVRSd0w5S3d1NUJtTE10Mk44dStxQ2VORkI3TjVYQlJPYlNt?=
 =?utf-8?B?WnlmVXV6ZDhOL2E4OXhMMEhaaGVqRHBtbUpyMjdNSmlJR011M3JqM2RFR05s?=
 =?utf-8?B?cGhzbXJnUW9obW1LZVRnaFFYa0llajJYQzNlSVBSWEJaUmhUSHk5S2Nydmcy?=
 =?utf-8?B?NUlpd2NBMS9TZ3hSNGdObEpINmJVVlhFNDZYcjUxcE52VFhpOCtrbHNNWHQ4?=
 =?utf-8?B?WjlPcjZkNDhYOWhsQUJTcXZXbHdQb3dWTTlKaG5IcWcrR1BRcmJPbzRPSVdB?=
 =?utf-8?B?R25tNEc5YktRS2dicFVVK0syT0dLbVBhdmVMRjJNejZ0dkdjMUZYNUpoTjdV?=
 =?utf-8?B?VzJDVllONGFiOHR4aE1PKzgvN2JHTk13VGtCM3g5emFGckxDbXZBUlRrUmpl?=
 =?utf-8?B?MUZkdjlXblVvZzlSelowOG90SldzNStkYnM1QWs1aWZEcE5tZGF6WEZKZ05r?=
 =?utf-8?B?bDB4cTVDbzhzLzd3MUd3NVloRllZd0JJSnJBL2ExazJmemlkY010czEzK2VO?=
 =?utf-8?B?a3hYL3lSSlFRZ0RweTVUM0RvUElDNThpWXc3UlJ6dmVxVVJzc1pZNkg5ZG5l?=
 =?utf-8?B?Mko3TFF0aVRXaXUydFZySWhzblRWVDN2RkVjTXZVa1ViNCsxSE9yRWd0d2h2?=
 =?utf-8?B?NzJjZG15a1dycmtOOGRLRjl3d2lxYytFUUpnK3BpbkRyTkF0OXhFTmdlYkV5?=
 =?utf-8?B?M1VYSFdpUkVIenVSekUvcXZTbGpoWnh1UXNKNXNZK3NNZzMrV1IvL0hVcGts?=
 =?utf-8?B?RDNVU0h6T1ZCcDdpL2h1VC9wN2lDeURwczd6QjhtdDdCQlNTSzR1dWdNZVV3?=
 =?utf-8?B?R0N0Ym5KTEtxV3lPZWZ3QThaN0ppVFlYRnN3cWZZUU1INTA5N1RLTURPTGRQ?=
 =?utf-8?B?YlBEb1VmUEtFaFlXNmJBMm5yVlJtaGZRQ2wxMlNvaHc5aklZSVp0MWtEVTZ6?=
 =?utf-8?B?RytQVWRlb3JYbWFhWklzaFZ3YTcxb3ozT3N4OWRWczFuQ2haSGNFYzRmUWJp?=
 =?utf-8?B?LzlPbWh6ZHRwTk52VEtiVmlRbGkrRWZVNGZ0emhleWZHM1V3bFBlRkNoZFFR?=
 =?utf-8?B?MndPbFNaa29raHcwV3RUK01RbGxNbjl3Ymw4YXJqbWNXcEZTUi83Z2tPbHZL?=
 =?utf-8?B?VVhwZUVZL3p6MUg2dElmcUFqYkFGV3d3Zmg0S1djdTVDZDhGWTJkRTY1Vzkw?=
 =?utf-8?B?VndVMWIwRiszWFAyVEhlQlMzSmxody9hQjR4QWtMK3VPaGJ3TWpSVC9qT3dN?=
 =?utf-8?B?NFgrT1ZwaXUyL0FZcE1ZZVpVYXpjMlUxMDFucDN5K2dPRzh3QXhsYyt6RUZP?=
 =?utf-8?B?VnIyZzFoYXplVHJZODA2SXZnNUc5TGJ2RjNEUk5WTFVQU3NPSGFxbUwwYURi?=
 =?utf-8?B?QjM3TGJLVnpKTlMyYTBWRGRhTDJwQVdkbXRKMDZjSzVtbGRFckVsQ2NiVzNx?=
 =?utf-8?B?cTVqcmY2Z0wxbzlrTEpRaFp2c3BxL3VadEU2czZuYkpBUjI0cDNEampyZlFT?=
 =?utf-8?Q?1IaemTWGnHkw+XgtHBk+S8eK/pLGt4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cnovY0ZMV1BQNEJQQmFaSWJWTkdKVmpGWTFldlVlZ3RhbmYzdHg0S2JvUkZC?=
 =?utf-8?B?U1g4aVkrOUVJOHc2ZnhMVExXTlRLMlV1MkZoMWpJaUthdDdZMDRaUjZlc3Mr?=
 =?utf-8?B?WmFnYVhNRGc3d2FOYXlxb1Z3VHFMMTBPREdZTDF3Z3BFWTN2Z3dsUWJ1T3R5?=
 =?utf-8?B?VUNuL2gxWnhucUtCZDZ4OXBaQjY0aUlFaHJPbzg1K1pPUE9adlFZT1Z6WlJy?=
 =?utf-8?B?QW05UlFZTnRneVBBU1ppaVNlQ0UwWFZaN1hXbGM5OUUzSmFsN1BiK0xMSGl3?=
 =?utf-8?B?VlBqaktYbE9hR1F5N2ZyUFdjNXBZQTljaFBSdXo3R1dIcUxjTkY4VWJXWTN3?=
 =?utf-8?B?dG1henRCUVVsR0c0N1RZZ1hUdy9RM01DNDVSWUk0VjVOaUxFRUlSTVNtSkVa?=
 =?utf-8?B?eitLeEg1TnlTdFhrVkZGeXkyTE5keUZ4MTcrbndzd2J2d1VxaTRSZUFmTTFD?=
 =?utf-8?B?eGkwM0k1Y0VjOUlldXlSbExaclNhVjdZOXpTT3ZhRXV3RVZoREV1M1IvWG50?=
 =?utf-8?B?VHBNSmU1R1FLM21aTlB4VmRiM1FibEZBbm53Z095elpja0JpbHhpaUF1TEVI?=
 =?utf-8?B?WlFCMzF6SW5mbjNJT2hWdkxZTk02STNkamd1bno5T2lEQktyY0E3YUMxVXNH?=
 =?utf-8?B?QVFtcitkTVJYbmxXT25BWXlpL0hFaVFWTSs3T3l0Yk1FRkNaV0Viek14aG5V?=
 =?utf-8?B?OHYwa21Cc3F0ZjYvdkhkWSttQUd2dlBrUlpidnp0MFhnNkRMNUI5anhKQmpN?=
 =?utf-8?B?UUVSb3JCNUNoNnh4MWZqY2U1bUw2SHdWRmpzZFBKTmxZc05rV013KyszN3VH?=
 =?utf-8?B?WTZMUjZkOXc3Z2s3SEZCVkszYlhOY2Zmd3Rmc3NEK2g1ajJBNDJjZ0xvUmRO?=
 =?utf-8?B?SGIzRnY1cTUyR29zNFBQeGE2RUJXNU5IYUF1SGF5bzVEdVhMR2p2Z2NycEd3?=
 =?utf-8?B?MG9JWlN0SlJnV0UvajNxdG5vaUs2d1gwUFQ4V3liOEdCaUJYSHA4dDZjWkRH?=
 =?utf-8?B?QXNQUjR0YVZvTnQzOS9MWFhYOGJqdXdYeGJNTUdYaHBVK3lxOEdRODBHaTVm?=
 =?utf-8?B?S3RPVS9YRitYUE5GV1BmRHZtZm9KNitOVXEzcjdCOWhCSHZ3L3hMc1dvb0dk?=
 =?utf-8?B?NkZ5Q0tVdndXbGtMSCtCMjhISDBsaEhsQlp0VTArcnZCWkxUTmRxT3dML3JO?=
 =?utf-8?B?Qno5MXRLSUNLMmJPak00bk94N3BzQVp4UDZFQ3p0dlh3ZlFCOWZtd0xHODEy?=
 =?utf-8?B?TTB2d2JEeUNkRy9xeXBBckdtL2NxTEM4bVNjYkl1MVR3WGZ0THFtU0pwQXA4?=
 =?utf-8?B?S1FNQVlzd0wwTVM1WStXcnF4WEQveXJkV01xQURUS2tTWENGbHFISUtmcHJr?=
 =?utf-8?B?SUVXc2dlWi9VU1drUExEWk9aTTBwWEl1Tm1PUzYrbnNOTEdEays0Rm1scDdk?=
 =?utf-8?B?eGJ4c3B2SnVQU2VNQ29xa1BhOWlmbTR2RittT1VrMTlDenFsVkFqcUhnYWo5?=
 =?utf-8?B?VXBSTk5JeGhJdjNUR3lYcWY2NHRqYlppZGpKM2dlRFRFUWM2bUFKRm82NjZs?=
 =?utf-8?B?M0xMaGxDaWRTUDdSdzJvOFJpc1dmTUUxcTF3L2tvb1dzWjA1NXhVRWx3aUEy?=
 =?utf-8?B?clI0SFlDR0tCS0R5VFVjUC9YUmExOTg3Qmppc2lzTWdPMzlOa0wxRVpzeTda?=
 =?utf-8?B?WHlwS0FaNEZxaFRSVTlEcUxoTEdJWWF0WGVNUFc3L3hGMHBocnNaWVlRd0N5?=
 =?utf-8?B?UzJBWEtmUVN4dlJndU84OWJVUmZkWVUzako1MWYrbkpRZXcvU3lQemxtYWhV?=
 =?utf-8?B?amZhcXBpai9OelF1aXZ3T3c3Z1BvOHNYck9EMVc0a09JZmdDS3VkY2VIdXRE?=
 =?utf-8?B?d0xpbTB5L3ZqY3RBb0I4U204WEJtdmVxOXRDamlYYzlKQkFWblllNHZNcHly?=
 =?utf-8?B?ZlJVWGtLZFFML2R5eC9kV2xxN2IzS1QzclNjTFFDOS9ZOGQ1bTA5SDd4WEpH?=
 =?utf-8?B?aStIUnQ4QUlGcXFBQm5RMktHMENKOXlNMGZwa0dnRnEvZjBCZzFVa1lrMFhU?=
 =?utf-8?B?VTBuV3A4N0h4Vm9sbjdEV3Y5MkJzYms2c2FKWnFvbE14TDY2VFl6QWFqVXZj?=
 =?utf-8?Q?xKoFlokoJruY3znJxuMrVC19H?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EEF109EA1E0C3E42A63B7D69EAC92BF3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	b5NgFdy4VwyreMCE3F+kF6Y0u0vHx9QUf8nFUtgb5lNNexhGkbbb5S2S+yHbFxlLOPNM0rDjQxwNx5Q52+rdGr/Lb0rVo/eJfvh1iZ9dhRHa6nLbidrszxJWLM+bgqT4vv3UrswagznkY4/F4YeJuJjPXnFEq6azIGffIOeUBG7Etu0dQwjVX58i9yzCgkQuJYOJ5Hf/zx3+z1OQBRA+zTRcJtIjRKdspnchN+uWeME2e+1kRijxZRCVULhXwW/Mjvfl7HXlUl7Bsiwfq+sqLARrFGUt7mNZ9S+KSBtVGwo+iwLrSDyCx/bSdZGsCr0GM+Zsa7/vHm+Jnnx3+ho9+zeU3SIj/Nf/welnkyXBh7MO9jgHXht5KOd2n3u53UKOXKTjuvKCxMmqNd8ullZ9a3tJFPdywKUef2WJo773rvBsgGCWHt64K0/NeiM/F8Ms3iVX1v22uxxFrtmC/MwU2MKFD3Mc44QicJR5sp9kerZZpZXlcRDHcavPv6xy40FDryWaJ5lRf94FIfc9QqceHMNX7QJlpUAR8OwcITrl8kvs4eh8esyiCsnqfC/OP3rB4tcm20IemrulMXd+Knhy0wI+YlXQamP7dTYbJNQJmoSpCmAXRrl9m1M9NBK81aNIAcbb2PTp+N3xMZ+tM9Zu/Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1360fa3f-d169-473b-e4d2-08dda3c732df
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2025 00:23:30.3539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sWMQecGgVW8/ONWNU9rsHG/FQfxpwu6miEC7gGJoEqW7aZEj77N0fV5et1pkiPO3eEM9Oe1mYAX/rvEMi2NF1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8977
X-Proofpoint-GUID: 8UJMxUwDJh-MxDX7sZxWWO58SX8STKjH
X-Proofpoint-ORIG-GUID: 8UJMxUwDJh-MxDX7sZxWWO58SX8STKjH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDAwMiBTYWx0ZWRfXzFGbRGv/Uykt
 7zJOa1DzhftldpVU9kTfoqx7xZWZawqRTUavBLooMd65kOTnhswmt+H7eNM1BLsiiS5RoYisy7M
 9QoeVES0IkGVXMd3He4KP2pMmTMXn8bq3IgGQrZGrYhWCGDSD+2pZjy1RueESCphHje+lzzWlFe
 bOs47Tv4tVix4dDu/tA+OhqxpHENKLOt+glGLTuP9HnOX7i/QJ8OqnQarrfMekdCJGwQaTei3Ao
 yTt+OYrOeISK2WY1T3fBbjW1+iuQuoHIvXtrbai23Ul5wRCvzMwtKLdOtUv0uGyLmhbiWGkRwNJ
 cTBY28mwdQMKlTPcqheuC3dMXhl9lanpMEcYfIIzZlx1YrAvFJwJPH5vf5VbCL09koWktt1wwvZ
 yWYcO9wHuxX1VlQZ+tEH3ZTH/lvMqI1DeuU7kp2XXG1GeNxk0OdnC99ejyghmKh0xRvSgUqX
X-Authority-Analysis: v=2.4 cv=DuVW+H/+ c=1 sm=1 tr=0 ts=6840e38c cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=qPHU084jO2kA:10 a=zd2uoN0lAAAA:8 a=jIQo8A4GAAAA:8
 a=SUxv-d2Kt1moWgga844A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_05,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1011
 malwarescore=0 mlxlogscore=981 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000 definitions=main-2506050002

T24gV2VkLCBKdW4gMDQsIDIwMjUsIFJhZGhleSBTaHlhbSBQYW5kZXkgd3JvdGU6DQo+IEFkZHMg
YSBzaHV0ZG93biBjYWxsYmFjayB0byBlbnN1cmUgdGhhdCB0aGUgWEhDSSBzdGFjayBpcyBwcm9w
ZXJseQ0KPiBzaHV0ZG93biBpbiByZWJvb3Qvc2h1dGRvd24gcGF0aC4NCj4gDQo+IEluIGtleGVj
IGZsb3csIGtlcm5lbF9yZXN0YXJ0X3ByZXBhcmUoKSBwZXJmb3JtcyBhY3Rpb25zIG5lY2Vzc2Fy
eQ0KPiB0byBwcmVwYXJlIHRoZSBzeXN0ZW0gZm9yIGEgcmVzdGFydCBhbmQgaW52b2tlcyBkZXZp
Y2Vfc2h1dGRvd24uIFRvDQo+IGVuc3VyZSBwcm9wZXIgc2h1dGRvd24gYXR0YWNoIHRoZSBkd2Mz
IHNodXRkb3duIGltcGxlbWVudGF0aW9uIHdoaWNoDQo+IG1pcnJvcnMgdGhlIHJlbW92ZSBtZXRo
b2QuDQo+IA0KPiAkIGtleGVjIC1lDQo+IA0KPiA8c25pcD4NCj4geGhjaS1oY2QgeGhjaS1oY2Qu
MC5hdXRvOiByZW1vdmUsIHN0YXRlIDENCj4gdXNiIHVzYjE6IFVTQiBkaXNjb25uZWN0LCBkZXZp
Y2UgbnVtYmVyIDENCj4gdXNiIDEtMTogVVNCIGRpc2Nvbm5lY3QsIGRldmljZSBudW1iZXIgNg0K
PiB4aGNpLWhjZCB4aGNpLWhjZC4wLmF1dG86IFVTQiBidXMgMSBkZXJlZ2lzdGVyZWQNCj4ga2V4
ZWNfY29yZTogU3RhcnRpbmcgbmV3IGtlcm5lbA0KPiANCj4gU2lnbmVkLW9mZi1ieTogUmFkaGV5
IFNoeWFtIFBhbmRleSA8cmFkaGV5LnNoeWFtLnBhbmRleUBhbWQuY29tPg0KPiAtLS0NCj4gUmVm
ZXJyZWQgaW1wbGVtZW50YXRpb24gZnJvbSBtYWlubGluZSBjb21taXQgJyA4NWU4YTIzOTM2YWIN
Cj4gKCJzY3NpOiBscGZjOiBBZGQgc2h1dGRvd24gbWV0aG9kIGZvciBrZXhlYyIpLg0KPiAtLS0N
Cj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy14aWxpbnguYyB8IDEgKw0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9k
d2MzLXhpbGlueC5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jDQo+IGluZGV4IDRj
YTdmNjI0MGQwNy4uMDljM2M1YzIyNmFiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2Mz
L2R3YzMteGlsaW54LmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jDQo+
IEBAIC00MjIsNiArNDIyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIGR3YzNf
eGxueF9kZXZfcG1fb3BzID0gew0KPiAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgZHdj
M194bG54X2RyaXZlciA9IHsNCj4gIAkucHJvYmUJCT0gZHdjM194bG54X3Byb2JlLA0KPiAgCS5y
ZW1vdmUJCT0gZHdjM194bG54X3JlbW92ZSwNCj4gKwkuc2h1dGRvd24JPSBkd2MzX3hsbnhfcmVt
b3ZlLA0KPiAgCS5kcml2ZXIJCT0gew0KPiAgCQkubmFtZQkJPSAiZHdjMy14aWxpbngiLA0KPiAg
CQkub2ZfbWF0Y2hfdGFibGUJPSBkd2MzX3hsbnhfb2ZfbWF0Y2gsDQo+IA0KPiBiYXNlLWNvbW1p
dDogYTBiZWE5ZTM5MDM1ZWRjNTZhOTk0NjMwZTYwNDhjOGExOTFhOTlkOA0KPiAtLSANCj4gMi4z
NC4xDQo+IA0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMu
Y29tPg0KDQpCUiwNClRoaW5o
