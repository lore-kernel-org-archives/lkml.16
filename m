Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9071C13DDD3;
	Tue, 11 Feb 2025 01:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739235730; cv=fail; b=ar/qxS1IJipllvK1SoSY6yemuner/12pEjiplTqidX2EAS+rPMz6SvL1/p554nIWFuAqYSoj88o+psLPk9BtKXQFCffGrnpjIOSUQm5/CIc3kINhpCu/QvL+JWf4bwiaVkm3+Np1wma7tQaq4RjYbYowaALy10aUcBQ9PSwQG00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739235730; c=relaxed/simple;
	bh=fy4HhIZoE3JNGxl9t1BzQsnoWruENBTq9yp5C3kfHfs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X+cApDjfmAOTQRn730ufrCyLfOMgGQwV03cU5O1p1R9Wr7spXSbA47bKw5byIWOcx8+fzurHColFnXuP0ky3Ok7UHbC3mAc3V+f5lNaHKt56VyiHqiU7fLA9CsoeFXp2BGDUf+mhj4o5GZcgYzYZoLfnyfVNln2tZeHhyRrNNGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=vcCP2/oB; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OcR7Z6H0; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=nzBRkt3t reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="vcCP2/oB";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OcR7Z6H0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="nzBRkt3t"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AJ26oP001389;
	Mon, 10 Feb 2025 16:23:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=fy4HhIZoE3JNGxl9t1BzQsnoWruENBTq9yp5C3kfHfs=; b=
	vcCP2/oB9UENz3hcBq0HvQiGBG7woPk+kTkquWZQL+0L8I+eVXrG0eLgyNt3JVTj
	SiZrSqUsRcEwK7Wxkg3PsaYNRfqMcxIuyroML7KIBeQpeqWT3q6EAAS7kJ7EayLX
	ggFH2HTaAPiwKyrv6revJNjMSaZXiaHh6utM2DfP7ycBbZ+HqeRFAGJI6GlBQ8K2
	bsfQ/YM9KX8EJnP8UnyU6+czYafyI+RroxqmqbtpY9qnK09qQyNAheARyJulZFKX
	kQ91iOy7fR1C7jWgoQFYDIxj4DYjRPx/vX0uYenpOWjhjn6qDiHW8EhRnqA8nY1F
	Xp0Oqp2o0/wCuEo0Prtiow==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 44p6sjapnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 16:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1739233429; bh=fy4HhIZoE3JNGxl9t1BzQsnoWruENBTq9yp5C3kfHfs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=OcR7Z6H0G5puwy1ltgSmc6cfdc+N6nkUY7cPNnTFnltihJjWtZipC0vrnBPGbHAxg
	 Vj8LNVyI6Mq6ypgTQlNzVhYP6Vs7VGkUxGd4zkh9Tg3ZAWPXz4iSJtdYKSqg7D4tKf
	 dbdBsIksayoZ/fS9Qv4xImhFMfU6oXKfveRA3SbaEO8F1Orz15S7RCW1l285VBMMX3
	 Jra1WeuAkhKBQ7gUKhYXP0QeV/oqe4+hdUyAz4wE2tGZ8qv2kJZXGAZkCb4R5uvQmx
	 3pwIKXWoTmK0+0lCZhHc0PZ7o4BeGrZqjvib7QuIYC+INavOabdZ3F+m7K5KTCm36u
	 VI4IkbVbR4i6w==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 423CD40105;
	Tue, 11 Feb 2025 00:23:48 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 9E244A0085;
	Tue, 11 Feb 2025 00:23:47 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=nzBRkt3t;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id EB6954048E;
	Tue, 11 Feb 2025 00:23:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+YniJT+g92g4P4HOSOfuQGfgsYSZzCH0AXLbxYH03K0avxO7aE2Prlyulab+pX9+S523Y2Ra9LyusJoUbqNlpHuLHEuM2lVsQd9U+WehkmwQLWVxroZnlFdUJEwGpI4w/RUu1OWLtF0SZqm8oYHkh0IcG/6/yr3J46/2UJXfCO2JE8hQaB/uXfa5Vvv2SNr+8xvU6Df3+eOVjQJNychs9UdCxhE2kmT/iw/CRfelIbXr8kkvJG1TxKNjGBuaAH0sRd0lPnNqIsEClgykmrkVQkhWJu5i3WApHCPH1lEdSdL43h+kwmGqVSWtn0zXOz/Mx5C9+YqZSkbCvGEETR0sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fy4HhIZoE3JNGxl9t1BzQsnoWruENBTq9yp5C3kfHfs=;
 b=wYn8/UH4aFTEnuvHew5B1Oxmds6JZaUNabQ/YarDtBN0lIOAGVvshykslDhhqN6ZV8Wn79l1EqjLKgUN5YgwMV9Lf+BdZ52B15l9Dmm8K+zKGwjiiI3OfbZ3ESXAxvo4yDX91wJ6gYs+8sS0oFW/U680qfzLXB0MS/XrrQ02hoNiS2trZcUZBwrDNOtAvTFurhWe1zf9195+S8uBIujbUl8ios9XFYw3mQUp/jpXy0AY9QVc9KyGRj5TpBnhWinjrvdbm1JbIYeatJyZJDJefn0ie3r7r4tuK9M9IOsQ/331N019gPdga4h/KBFS/ibP3dsYieQn+5gaJYFl1vNaAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fy4HhIZoE3JNGxl9t1BzQsnoWruENBTq9yp5C3kfHfs=;
 b=nzBRkt3t+j/kix4jFtLgZ1O4czDvkvNVX9LzFyJrT0XpIqylhyWXJizrWCkcums0vvWN+611XAiEmWMKhoq//Cxf/NvvP/Zn16l7IGTJYfSR234uF0Lvrm1LGdq1z4Unb+qu20HZaFmHOfAicjDMPjAuqeiKqDjA1MS3gXCj0zM=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS7PR12MB6240.namprd12.prod.outlook.com (2603:10b6:8:94::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 00:23:43 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 00:23:43 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH v2 3/3] usb: dwc3: gadget: Avoid using reserved endpoints
 on Intel Merrifield
Thread-Topic: [PATCH v2 3/3] usb: dwc3: gadget: Avoid using reserved endpoints
 on Intel Merrifield
Thread-Index: AQHbdnAs0zybOBVA70GZZhi82A27hLNBSYUA
Date: Tue, 11 Feb 2025 00:23:43 +0000
Message-ID: <20250211002340.25miqmaafdc52g4q@synopsys.com>
References: <20250203191524.3730346-1-andriy.shevchenko@linux.intel.com>
 <20250203191524.3730346-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250203191524.3730346-4-andriy.shevchenko@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS7PR12MB6240:EE_
x-ms-office365-filtering-correlation-id: facbc635-e4c1-4cdc-f854-08dd4a3257bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VTNmTGl3cUdSeWlPdTM0N1d2Z3V2OURwYlNFcWZydThpZHZyVDdoTUtDTEV6?=
 =?utf-8?B?NDl4Zkt4TUVvdnFpUldkUHZWZ1RjWDEzaTB1SHBoaHpoMjdGZ0tyUDhsWmVz?=
 =?utf-8?B?ZjNQWWlybEw4TEFRY3RNWlc0UFQ0Z0ZiRUdZaWVQZURpckt0cFZ5cTFEQS9D?=
 =?utf-8?B?c3B3bjAwckZJSWVuT24vNHFkdTYzNDZPR3FUdmprcmR6QWxYTTVrUkdBdDlo?=
 =?utf-8?B?WXFQSS9sM2hoWktua0cxSmREdTJPaTNZSmFad1ZJSElxczJZNXNBUEtvTjcx?=
 =?utf-8?B?QzBvSzRKYkVLMWZLSlJSbXpGb1p1cE1yK1VYaThPSkQ0T2dsRUljR1V1eXVm?=
 =?utf-8?B?cTdSOUgvUnN1UTFWL21hTGlackNqZVVkd2Z4U2wzNytKUEppK1JsVW9yd0ph?=
 =?utf-8?B?ZkRQUTUrSEdGbzB0QWpBVlhGczZaZmdCVmJnaFRNVFFEZHhLQ1N6bmZ3dld3?=
 =?utf-8?B?OEN2QXoxL1NBbmFINUpJRE8rTW01R25WRVpVV2lGbnFheS8wYUtvSEllbFlN?=
 =?utf-8?B?RHQwSlVJdE9ac0ZQNXV5Zjg1VUNQSWlHRzFXc3B2VnZPVndLQkFxQlNyeWQy?=
 =?utf-8?B?c3h0S293cXFCYWpMNmlCSXN1VWlXRGNZTzlxZzJUdHdSWWpadVU3TzBpODF6?=
 =?utf-8?B?ZU4xdXJyMGE3a1RiSmhEU2ExV0tPUjZhRHZMYmpRdXlpcWJJYno5SmR5d012?=
 =?utf-8?B?OUh1TWZzMUdSTFIzUXBjSFlhSmozeXg5ZkpFaktpaktWdkJLOCtuZWY2OFZB?=
 =?utf-8?B?RlBMUjFnZjgrNDJMVmtlUFp6ZDJFUTdQMWVma1d5VkFIVXl6TWtDQWJJMndN?=
 =?utf-8?B?cVJJNGsrTFd0V21ZblJ4Um4rblJXUEJHMEVRdU92MkRneWg4eWd1dlpOeEVT?=
 =?utf-8?B?WFJRSUJqamNNNTQvNlhwUmJhNFFZT0xhUzZyM1JpQTl0Z3RMSktXRTR6Z1g5?=
 =?utf-8?B?ZWtpWXpvRUpXQ2tkMjBOOVNRQkpPVXJnL0F3UHd5WWgrSUJBT3hjWW9oQ3M1?=
 =?utf-8?B?MW4yWGdMalpiMWtOQ0JhU3plcXNFazVXS1dCYzRXcGptV1cwTFcrUzlrNk9J?=
 =?utf-8?B?enl2TEs1ekZEODBXK3lWVkYxbnlEOFlhZFpEZVRPa2JRdjhsV2RqU21sa0l0?=
 =?utf-8?B?akJiTElRbis5aXUzL3grelYvVmNVaUJaSVMvbzNmK1grajdFQ2tiWTA2ankx?=
 =?utf-8?B?THJTaWNzVmpiaHFhMUp2eXdKRUhva0s2alk2cy9KNndJRlhJTTRjMHU5Ukdm?=
 =?utf-8?B?bEFhQklCY29WM2w5azdFUkFNc2lOWU8rUzJVcU1OV09qU1lUZ3FxSjVVdm5N?=
 =?utf-8?B?b3JjZEsrVHR1S0RlaExGYjM3UkJYb1RwakxOeTdJS3UxaysrNFpwUHdKeXdC?=
 =?utf-8?B?S2J4THh2ek1SdUdaZ09va2hPdE9tdUdnTmQvaDN6ZkFVQ1gyZ0phZEdxbm9k?=
 =?utf-8?B?MVNWWGNwUENvU2RJclBJY3ZDRG1jRHNicW1UUThkbis4U005Y20zWTJURnJq?=
 =?utf-8?B?U0pkTFVGL2lJdjZWMVBRVi8yWVNhb09FU3VTRStqWlNRRzUrVFdBblhObEM3?=
 =?utf-8?B?YmMxdUxWOWJaZTgxZmNuV1Qxb0luWXRuQkNzU0pMNDdocndYdzV3NHh5NkZE?=
 =?utf-8?B?NmVOQThrWjczUlJlMTFVK05ZSkNRckViREQxazhoakRYcDBTRm16MFVaOWJ3?=
 =?utf-8?B?czRwVkFXbGpqUzJ1Y2VaLzliM0dyNlFjNGM0RnFXWU5GaFhEaWpDRlRJaGc2?=
 =?utf-8?B?QnZaZU5IcFp1S1V2RGRQWmNYdExhaXp2b2didzdSQ3hDTk1oaUxrZithTm1j?=
 =?utf-8?B?bjI2M2NGR3gwd3JYS0NScHhVNUZwVEZaSlZoSnNFVHRCQm8zYWRRMXJHNDFv?=
 =?utf-8?B?ZUhLWnBnY0tzd3J3TXRNc0p2L0taRFlRTUc1L0pabCtVQlFRSWtCajI5dkV6?=
 =?utf-8?Q?xHZ3qGtIWQgWAGLJyC+e+R3lzSvwPCDJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WFR3WVRwejg5bk5obmlYUFNubk1wK0ZqbTVoWkg5RHdabTBMVlZOaWQwZmg2?=
 =?utf-8?B?bE93QURrVVZlSFdTY0tNR0MrVU83MytDZ2pEN1Y3V1hvbmVFYVlkYUhRdXpJ?=
 =?utf-8?B?MTlZRFZNN0FOcXI0OHlBUENFN2lnTXJ6VlJhalpCc1Z6dUpYN0JrTmp2OU1X?=
 =?utf-8?B?ZTFaUzY2dGw4SlRXd1pjaEtPaFpHc05kaEVtUGx5bFAxajJhY0hyVE02OVJp?=
 =?utf-8?B?TTBjQ1MyWTVJbldVZmJXTU9HeGhCVVNVQkgwSU1GTE9LOHV2bEZSSmtXVTlk?=
 =?utf-8?B?M3hXTWZ4cDB2cm0ybkgrTi9FanZOZVdPaGpqQklhTm9vQkFGSHdLZ2RnWW1w?=
 =?utf-8?B?V0p2T1dkUWtJMSttYnhDTG5TVEVaRUgwejR1bi9saE53UUtIZno4M0JiT29H?=
 =?utf-8?B?dVp0aFRGUXhsK1hISnVjVU9YZnRjOWQwTnVKQ3ZDKzJxeVphRjRUTDYrdUZO?=
 =?utf-8?B?SUF1Y1Z2WjB2akxGcXRHa3NIbHRwWmw1YzJqblhkcEF0Kzl3alMvWmwyRWpZ?=
 =?utf-8?B?M05rTVppZVl0cGlCb2hMeXN5c1BpelJqNHN4U0J3TXorWWwveG4zaFJlY2RO?=
 =?utf-8?B?ZVRuOUE1NndhQno4Y2ZDSkh3ZDVSclRHdHpKaTR1WnMvdFl6T2RzczNPT3R5?=
 =?utf-8?B?UEZOVW1ydUx5V1BmOEs0bUlpaWt1clRzQWFpRE9hTmREMmxHbzhyTHc5ZVlv?=
 =?utf-8?B?blFoMGR2VEYrbDVSQ0d3MXFETzJ6dndzVUszQXdjeWVKbFlVVmk3TVhaUzVq?=
 =?utf-8?B?NlhMVE9BSk5lbFUwNlF0MENUNGNZN3NOY3p0Mk9IKzlqMkQyTnhyWHI5alRk?=
 =?utf-8?B?bVZrSytUZjROditHZFlyUXZ6VW8rL0tkeEV0T3d1UkV1WkR5Q2tucHBmZlA4?=
 =?utf-8?B?RmRiVTRobzNGMUpKb2FrOFpScStFWWpKalQzWkh6cjRMTThZcFMwQ2pHTXEv?=
 =?utf-8?B?MmQ3YlJZWG9hbkZNR0oweGhtdEExcWNlNGtNbGFxTG1DZVdienNZWlZhY29M?=
 =?utf-8?B?V1F2c3FTQ1poOUFOOVNVaSs3NG55MTFCaWdaaG5wRm43dmovaGZ5Mis3dXFW?=
 =?utf-8?B?V1BLUDROZTk3TGYyenJkdHlQRFZaY0FxenJWcWRISDZEai9XaVQrWWtNRnl4?=
 =?utf-8?B?UlFURG5icnB5RStLVmdYTEEzMGhXblBOYUdlR0d4aTdzdThYUEg1UTRGQlYy?=
 =?utf-8?B?Z3FabFdId0dZQmo0RXg2ZlV0TW92WDJYSFkwbWdTYUt4eW5tZENVU0tJRnRM?=
 =?utf-8?B?Z00wOGhHR3lFMzhKL0dWaTNDQUpWclRkUjYvRStOai9sQUoySEV4SE4xdmQv?=
 =?utf-8?B?blRlTXF4Y3dzVElrYXRzZldTRVpIZ01neDFiTXU5eW5hMFhEL3BNVjZSa2E1?=
 =?utf-8?B?WVVqK0tEeWkwNHJnU2RMSVcrMFJPMTFHRzBrbGs0QVc0ZnVNSzVJY1NuMGgw?=
 =?utf-8?B?M2RyTU56QkVhT2ppdGwyQWF1TWh4RGFJeG5LY0lqTHhVclVVYTIzU29nYk8y?=
 =?utf-8?B?azVsRzQ5bjdLMWFDclEvRTBaT2lBbEppd0hlSVZHVnlxVm0xNWVhWDVuRHA3?=
 =?utf-8?B?WlpOd2dvdmJMZS9KYW5Gd0U0aE5TVTVzVUJXL3JNNmRlUXcxRTQzUXBpdGxZ?=
 =?utf-8?B?amswUU52dXpjMEZqVHFGRFJSUXJUbUV2M25KOTVMc2t1V2RGRjZCU2E5MWlw?=
 =?utf-8?B?RjNrZSsxZThvZnF1REUzOGlOZWM2dVNYdERCNW5aYnp4YTFUQXFNQXF3am1Q?=
 =?utf-8?B?c0RjclA2UGcvNlkvcUhpc1NWQVJEbXY0OWtEcktJZFUwYnZOK1A5RkZqeWRF?=
 =?utf-8?B?THhyMjJCRVZ2aWdHRVdhSEZlemp0WkNjR1hTUm15alBjMmdlSVhkMnZNUXZZ?=
 =?utf-8?B?RHZlcmN5TVlGSFJ1UGxrT3ZpQmtwOVZzY1ZkOXM4R2gvbTBrcGlqazhRTVlL?=
 =?utf-8?B?bzB6N05nRGluRCtLTjIvOFB6QkhBSjFiNFpOVk9ZbkJsU29qcHRFQ2FucUgz?=
 =?utf-8?B?bzZlaWJoalROeVdoMW5QQnRWMkRHS0M5dlFjbjhlcFhEek53US9yeHdWRGVh?=
 =?utf-8?B?Um1oU2NCdDI0S2dBTmJ4TEMyZ1ptNysreWJyNDhsYWFsdDhIcG4vSHhGR1Jx?=
 =?utf-8?Q?soYMGCQR/rVkDG8uvZC8gutAK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D91A4AC46D2FAB40B72D1017ACDBA82E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BD+VZdlVoBvatBNgr99puX1WNTAu91NVUPIWdS7q7uznNl040COmOp8PzBermxAFoNfGAKVmY7hBzK6SXLfIeQiZyqiIOdisIR0r5Y/YzpF1F2JMk2AwlI/7MtvjPScEk/fJnuGSfMYpx6lBwTSfGQbV42mcvYLUvWaFtWZjk5HIWrd7Zt/VHMSsTszvfE7dNWO40en2HjA7rgWGsbeXBIYuB6ySn9J2xdg10zZ3J12nKYmOLHiRnceG/n+9HU1+izBjfDNg3IX9zuGxG3dcbXINegfZPj8DsBn3E7T65JwIzazIcXsM/7J79VBAxDXNMgB5viPZ7ck6dt4ovHllNDhmIJBm/Pre8Dssl6QJpKMkOV0idlfbqfHVUvhOEPOrrXPDMUDvOPzTRvKQw2G593UuIPog+iwo4O3efVQNIjemDpiRuA2mplYmxCfALDcQJV0A87Xr5SdXogrodak+/QA67qm/jUc8BSS29DKWauUKUDBiWeflgoIt/G9EGa6a8SM73yp5Op6z73NVPEv+NCLwmkdvLUaTL47pPuLh2UyTIsvACoiDQhd+s7RSsyAbP+Lf1YJPe0BhV6Pwe6wg6Y9T6HRSp1/YexmRmdqbDY2oEG2typcK97i3OXMRPigb6Vj5sLla0K+ZpJlbZuIwSQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: facbc635-e4c1-4cdc-f854-08dd4a3257bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 00:23:43.6788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U2LR9uLfkmqaTrf6wTnBWyQaaMRasXUoOIrMxRGQ/AMIjhE6bleRywGjlvaO35n4u5uRo6OmBgKgvkkBGmXATw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6240
X-Authority-Analysis: v=2.4 cv=K87YHzWI c=1 sm=1 tr=0 ts=67aa9896 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=T2h4t0Lz3GQA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=QyXUC8HyAAAA:8 a=jIQo8A4GAAAA:8 a=GgoY5xHB6-PSeDZeo3kA:9 a=QEXdDO2ut3YA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: Yuhsv5InbX8DKH7zafNyQgjzMHXGCir7
X-Proofpoint-GUID: Yuhsv5InbX8DKH7zafNyQgjzMHXGCir7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_12,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=821 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100180

T24gTW9uLCBGZWIgMDMsIDIwMjUsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gSW50ZWwgTWVy
cmlmaWVsZCBTb0MgdXNlcyB0aGVzZSBlbmRwb2ludHMgZm9yIHRyYWNpbmcgYW5kIHRoZXkgY2Fu
bm90DQo+IGJlIHJlLWFsbG9jYXRlZCBpZiBiZWluZyB1c2VkIGJlY2F1c2UgdGhlIHNpZGUgYmFu
ZCBmbG93IGNvbnRyb2wgc2lnbmFscw0KPiBhcmUgaGFyZCB3aXJlZCB0byBjZXJ0YWluIGVuZHBv
aW50czoNCj4gDQo+IOKAoiAxIEhpZ2ggQlcgQnVsayBJTiAoSU4jMSkgKFJUSVQpDQo+IOKAoiAx
IDFLQiBCVyBCdWxrIElOIChJTiM4KSArIDEgMUtCIEJXIEJ1bGsgT1VUIChSdW4gQ29udHJvbCkg
KE9VVCM4KQ0KPiANCj4gSW4gZGV2aWNlIG1vZGUsIHNpbmNlIFJUSVQgKEVQIzEpIGFuZCBFWEkv
UnVuQ29udHJvbCAoRVAjOCkgdXNlcw0KPiBFeHRlcm5hbCBCdWZmZXIgQ29udHJvbCAoRUJDKSBt
b2RlLCB0aGVzZSBlbmRwb2ludHMgYXJlIHRvIGJlIG1hcHBlZCB0bw0KPiBFQkMgbW9kZSAodG8g
YmUgZG9uZSBieSBFWEkgdGFyZ2V0IGRyaXZlcikuIEFkZGl0aW9uYWxseSBUUkIgZm9yIFJUSVQN
Cj4gYW5kIEVYSSBhcmUgbWFpbnRhaW5lZCBpbiBTVE0gKFN5c3RlbSBUcmFjZSBNb2R1bGUpIHVu
aXQgYW5kIHRoZSBFWEkNCj4gdGFyZ2V0IGRyaXZlciB3aWxsIGFzIHdlbGwgY29uZmlndXJlIHRo
ZSBUUkIgbG9jYXRpb24gZm9yIEVQICMxIElODQo+IGFuZCBFUCM4IChJTiBhbmQgT1VUKS4gU2lu
Y2UgU1RNL1BUSSBhbmQgRVhJIGhhcmR3YXJlIGJsb2NrcyBtYW5hZ2UNCj4gdGhlc2UgZW5kcG9p
bnRzIGFuZCBpbnRlcmZhY2UgdG8gT1RHMyBjb250cm9sbGVyIHRocm91Z2ggRUJDIGludGVyZmFj
ZSwNCj4gdGhlcmUgaXMgbm8gbmVlZCB0byBlbmFibGUgYW55IGV2ZW50cyAoc3VjaCBhcyBYZmVy
Q29tcGxldGUgZXRjKQ0KPiBmb3IgdGhlc2UgZW5kIHBvaW50cy4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPg0K
PiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1wY2kuYyB8IDEwICsrKysrKysrKysNCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvZHdjMy9kd2MzLXBjaS5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXBjaS5jDQo+
IGluZGV4IDA1Mjg1MmY4MDE0Ni4uNTRhNGVlMmI5MGI3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L3VzYi9kd2MzL2R3YzMtcGNpLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXBjaS5j
DQo+IEBAIC0xNDgsMTEgKzE0OCwyMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHByb3BlcnR5X2Vu
dHJ5IGR3YzNfcGNpX2ludGVsX2J5dF9wcm9wZXJ0aWVzW10gPSB7DQo+ICAJe30NCj4gIH07DQo+
ICANCj4gKy8qDQo+ICsgKiBJbnRlbCBNZXJyaWZpZWxkIFNvQyB1c2VzIHRoZXNlIGVuZHBvaW50
cyBmb3IgdHJhY2luZyBhbmQgdGhleSBjYW5ub3QNCj4gKyAqIGJlIHJlLWFsbG9jYXRlZCBpZiBi
ZWluZyB1c2VkIGJlY2F1c2UgdGhlIHNpZGUgYmFuZCBmbG93IGNvbnRyb2wgc2lnbmFscw0KPiAr
ICogYXJlIGhhcmQgd2lyZWQgdG8gY2VydGFpbiBlbmRwb2ludHM6DQo+ICsgKiAtIDEgSGlnaCBC
VyBCdWxrIElOIChJTiMxKSAoUlRJVCkNCj4gKyAqIC0gMSAxS0IgQlcgQnVsayBJTiAoSU4jOCkg
KyAxIDFLQiBCVyBCdWxrIE9VVCAoUnVuIENvbnRyb2wpIChPVVQjOCkNCj4gKyAqLw0KPiArc3Rh
dGljIGNvbnN0IHU4IGR3YzNfcGNpX21yZmxkX3Jlc2VydmVkX2VuZHBvaW50c1tdID0geyAzLCAx
NiwgMTcgfTsNCj4gKw0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBwcm9wZXJ0eV9lbnRyeSBkd2Mz
X3BjaV9tcmZsZF9wcm9wZXJ0aWVzW10gPSB7DQo+ICAJUFJPUEVSVFlfRU5UUllfU1RSSU5HKCJk
cl9tb2RlIiwgIm90ZyIpLA0KPiAgCVBST1BFUlRZX0VOVFJZX1NUUklORygibGludXgsZXh0Y29u
LW5hbWUiLCAibXJmbGRfYmNvdmVfcHdyc3JjIiksDQo+ICAJUFJPUEVSVFlfRU5UUllfQk9PTCgi
c25wcyxkaXNfdTNfc3VzcGh5X3F1aXJrIiksDQo+ICAJUFJPUEVSVFlfRU5UUllfQk9PTCgic25w
cyxkaXNfdTJfc3VzcGh5X3F1aXJrIiksDQo+ICsJUFJPUEVSVFlfRU5UUllfVThfQVJSQVkoInNu
cHMscmVzZXJ2ZWQtZW5kcG9pbnRzIiwgZHdjM19wY2lfbXJmbGRfcmVzZXJ2ZWRfZW5kcG9pbnRz
KSwNCj4gIAlQUk9QRVJUWV9FTlRSWV9CT09MKCJzbnBzLHVzYjItZ2FkZ2V0LWxwbS1kaXNhYmxl
IiksDQo+ICAJUFJPUEVSVFlfRU5UUllfQk9PTCgibGludXgsc3lzZGV2X2lzX3BhcmVudCIpLA0K
PiAgCXt9DQo+IC0tIA0KPiAyLjQzLjAucmMxLjEzMzYuZzM2YjUyNTVhMDNhYw0KPiANCg0KQWNr
ZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtz
LA0KVGhpbmg=
