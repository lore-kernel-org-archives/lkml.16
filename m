Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B0F2686B7;
	Tue,  3 Jun 2025 07:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748935106; cv=fail; b=GOSh3tc2Z1FBe9ZQI27AqqMDfCJNPihmlzif92uTo/fV2tCbn/xEbD90jQFNpAMoUiaEe5WKzJ4LDnBmQuPdB1xyMxmhuVFy7WhQwB7+Nwm5cKXYHQNfSTrozbYHhxT3TMh35QkEwIf4KmBpN0GaP8o598ZedgqeyBYyg64Gj6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748935106; c=relaxed/simple;
	bh=lPO6Of0IHx/kpCbjRobhMoqIEw7aDUJgpeyEzWJWH/M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nsDXzOv83LI4b/8qvmu2RAcRCrQ4ihISU80x3clu/VN7feSzycqMWEhbIivg1r2Ncngg9v+l+lGCF4pcW4CktYoNLKPswGZPGwfZ2V7mwMdKn5cci5Da3F89qGdMYu2DN3+7P2ikhULH7HO5FmaIRM/MHMBJWZ1thmy7rk+b1Io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=LC/2MUNw; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kUDdxs23; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=AXwzWVGe reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LC/2MUNw";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kUDdxs23";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AXwzWVGe"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5531BM4m012975;
	Tue, 3 Jun 2025 00:18:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=lPO6Of0IHx/kpCbjRobhMoqIEw7aDUJgpeyEzWJWH/M=; b=
	LC/2MUNw7kbEM6yuQR7kCYeALsHMk2SSya0W5nqAtTQmcjRgeePRKWO12A1DDVcd
	BPhZx0sbBJij7mhq++m5bXN+3XPgZAowvr1KOSC0zKET42Gsfct8OMk+9vj2YNfl
	DzJmx8YSA2Vi+5GITtNdpV3RM5FGh9o7gBwJ73vI+doONrT2Hc0xD0vENKahG2ke
	OURh5UjAYg5LgXbKDlSMjjzi0lp5v2LPQgC4sIEqrM1YPKO62ei3rr6dOtP1z8NO
	y0PPQKuoliEUImxfckSci0ONTFV9QX7fwAYrqvCHIN1CL3tmLLus4QHjcJeU2XEy
	Y05EWhHFupV6tWotH2dzaw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 471g94asdb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 00:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1748935093; bh=lPO6Of0IHx/kpCbjRobhMoqIEw7aDUJgpeyEzWJWH/M=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=kUDdxs23DBrt6XRcYi4lq4jHeCgYiT3ie0eU+LMSnXh0c/gaV8eIrLxtlTusjn9E5
	 9WvGS3nQ3KAkUgIj20RNPP/oChTO3KcqyLLarSgj76W2D7OYeho2U1g8p5KpjMLtNp
	 pO/F2z+LI4MmPGcDOIjpPhwaob/NdciXi3M7ajODGV7NdwB65WfOHxt2YHiN4/wC/o
	 Ijx20tAhBuC5RYFB7P7dNf5x4KKQXFRcVKuwHSpjEpTfvMnv/TyNq6XHVH6nE/egtS
	 IAXNxdCz0bTvpOQNhytCVYaN8YIcJW+hdDLPUi6Cs/cfpvP6xzdYXhgeTbtv0K44Gs
	 AvBq5kwd3R3KQ==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5A1A84035E;
	Tue,  3 Jun 2025 07:18:12 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 90B17A0072;
	Tue,  3 Jun 2025 07:18:11 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=AXwzWVGe;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 01B7A40112;
	Tue,  3 Jun 2025 07:18:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZk9XkMr4CvzdPP5zIeh06yL2/P/m4znsqprHiJuuEsBN9V458QLFKi6GuKWQ8V23Yf49NHig/XDmR2U50mTVbNU+8XrI9CAxmmsLfwqkfs4HSn2CYPv/PFwayMowo5VuIrCH99ivcZz7LTroWvFH4WYkHmgQSuPSSOmJvQn6yo7kekw6++ABbaQOlEx/fgQ4FY9DeIbWlCrCK96Oo7m7UlNGSt5Oe+y+1CiNe5prUxZUd0z14e14mCfsYp1HntZBlPFZ9BaliS0LsjN4fKULqATcOzCi4omnJC0e+g/57gncE/kq/63cGV6YqrGBSyTTgJdO8RoYU0Ry+vnrAPWkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPO6Of0IHx/kpCbjRobhMoqIEw7aDUJgpeyEzWJWH/M=;
 b=fZFOWAAozp2zRWoblwFLW5xUfgrLHBlFSV/3RpTFCoAbw3w+9dDTmyNiKKX6WMxdQhXfHfKqNoqz9WrGRl4CihrsZiaVKk78UT9vmtcRLM8Lgr/t4s2BFyXwTNZt2BNlyCW2HqFrNlr1e/ed7oqvJpnswz8zr9skMiuGaUT0wKMLY0a9AVAGH0zDIZHyOPPTotnCfFDxQmzXjvAEU7I6ccV/FjQCshJHLWtPjSeN0bVgjfrhZ+JJMrlmNeBOj0w2XwdsXe6mvKPOJBb+Q/nHq23Oc+zIjxmQ6+HlhR4CAhGaamUNlrcORQlQhUgNUCsYUCV1DRGaUdOMIGTTrMNacg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPO6Of0IHx/kpCbjRobhMoqIEw7aDUJgpeyEzWJWH/M=;
 b=AXwzWVGelO3Zk6yoU42PDZG6+HbyWMsXThzvX2CdVEW0IudvWLdkFnj1w3XPhVjK2d4Fd0DIhwza1PzoFZs4lFJjMSDEkMX+76dGMOc65xoi+Ma4VpCS9PxQ3YmBrqE0UIRokGo6Ou4tapmgtQ1I6g6l2pZDcQX/ZLIluOTHL9Q=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by DS0PR12MB7777.namprd12.prod.outlook.com (2603:10b6:8:153::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 07:18:07 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::910f:c354:ea0d:1fd]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::910f:c354:ea0d:1fd%7]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 07:18:07 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Chen Ni <nichen@iscas.ac.cn>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc2: gadget: Use USB API functions rather than
 constants
Thread-Topic: [PATCH] usb: dwc2: gadget: Use USB API functions rather than
 constants
Thread-Index: AQHbyIZ3xngFymgk30aT3MbtlRSw6rPxHkAA
Date: Tue, 3 Jun 2025 07:18:07 +0000
Message-ID: <fcf9ac38-e2be-4fb9-f91e-c4ff358aa6a6@synopsys.com>
References: <20250519062229.724664-1-nichen@iscas.ac.cn>
In-Reply-To: <20250519062229.724664-1-nichen@iscas.ac.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|DS0PR12MB7777:EE_
x-ms-office365-filtering-correlation-id: c3c44c95-6b2c-40b2-9b04-08dda26ec9c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?amtRcU8zeklLa3lUcGlvZnJ1ajV3dWhuS2doYTNKZ2xPUUNzY2F1TUU1aVR1?=
 =?utf-8?B?dmhsSHp2cUYzbGxzRjBFNXNxamZZMjdQY1kreFBqUDZERG02RExrVFVmNUJ2?=
 =?utf-8?B?aFU4SVlPR1ljcWtpNUptYmhnZWY0ZnRSNWNvM0lBcEVQZTgzc2VCR3E5WUNs?=
 =?utf-8?B?aW9NU3dQRzRlbk8vejdmQTBralBhWml5ZERPeDZPY1BSaE9RK0FGOW0xNjE4?=
 =?utf-8?B?SnM5ZFNwOEVnSUNkbmt3dDlvMUZNdkY2Vm1LVWxhaEpvNDZybUNhVFhPbEor?=
 =?utf-8?B?YnZHb0d0UzEwdGZxbnhsZitsNnlkRGE3RDdnVXpuZFozVytXckpxNGtaWnlo?=
 =?utf-8?B?Q005WTlyYkNLRGhXamgyZzhNUVhQVWNTQ21qazBRQmMvRWRLNUF3bk1OR0F3?=
 =?utf-8?B?akFkSkRpNTgwd1RjUjZycnU2M241NFp5dmRETmQ4elJ5QmVuOG1EQmNkR29u?=
 =?utf-8?B?b1FuMmNzRzlmUWJqS3lBNll1WHRoSjhUaEtnb2lzS0NvNDVmMDBoQzFZd3VM?=
 =?utf-8?B?RXcvbHNnekwwaW5hcFhDZzB4R3Q1ME81RDFtYmdvRlE5R1lGc2JXOEZnSWcz?=
 =?utf-8?B?QllZcWE5TkdQRjhHNWlZTlJUU1hQbFBueUVaTUVMN1B2ZjNQSURBS1ZUaUhL?=
 =?utf-8?B?d0NPbVBwS2JneWVzcW5oNlUrcnd6S2tXc1lhNCsyMVhCa29JNlAzOG5MYlZY?=
 =?utf-8?B?UXkrV1RScjgxSHZmdCtHRVg0RHpLWkd4dG1XQkRWakVyT0VDN1Z4YXQvTGp1?=
 =?utf-8?B?dFUybEJOWHVrUHNvMTJpMjBiTDU0TkhjWlQwMDJuNVcwWEVDbW8vSjV3OVI0?=
 =?utf-8?B?V0lTMVJnMVYyOSs3RFFIajhoWk5SVFEzbDZKbjFkcTltZ2dJYzlNRlhIbFFq?=
 =?utf-8?B?L01PMDF5S202d0ZhVlVXb3d4MEpnTzg3c0p2Q2FuWDhCUUx4UWc0dmgwWUNJ?=
 =?utf-8?B?Q2FsR0FMQytCVWoza3pnaU5oa2szY0lHWHp0R0U0dkpaaFljVWZoK3VMOXln?=
 =?utf-8?B?K3AwR1JWYjJ2aStOaGt5bjI1T1cwNkk1TnQ2blR5ZTlORTJ5dHJXd0ZRbWdm?=
 =?utf-8?B?V25HME1jVktKeityWXRnc3daNmhyYXNwcW9uRXYraFlvamEvdFFLOFV3WVJ0?=
 =?utf-8?B?eDF6T09yb3MyRStpMGhDMUVEckk4SW9SdkhRYjZmclZSNXlKN1ZRaDZKSHc3?=
 =?utf-8?B?eDR6VkIwWHFQVnFWazR3b1VOLzF3VERmRnlmbHBBRU5qc3pjaFpiU3J6bXBi?=
 =?utf-8?B?WVVaYkRvR2NHMlhmT1BwOVhrM0ZSd01QRmVyODlsc08vSDFSRElqQjBFdjdS?=
 =?utf-8?B?dER4ZWI3b0NtSURLMlQ4azIzNWp4Z1F3NXhmZlhTZ3p5ZzFLTWd1eWlBOXQy?=
 =?utf-8?B?S2loUFRSTnZDZ3h3anhlcm1aTTFRRjNwOHVTK2llWE8yWjNNajB1TmRkQW96?=
 =?utf-8?B?T0NDSU5IYkgrUkkrUmhieUVlTUp5QWs1dXh5UGs3OEFldnlBZWlxVkNhMU9w?=
 =?utf-8?B?Qjc2c05jQ3VZR3oyMXllbFFmTVg5cngvQjBDSXBzTnFpZXNGMjlXWEJyVmhr?=
 =?utf-8?B?Zll4M2lwd0svejZadTJTRUhsdmhPd25rM1pLcXFHdTJOTGR0YTY1dTNkb3hv?=
 =?utf-8?B?WEZFYVJPUFdqZjJzSnkzUnU2aXN1QXl5MHU4ZkU2UXhRS3ZhbXFXb0taTDVn?=
 =?utf-8?B?U1dBYWRUTDMrbGVUOFhOR25ONnVBR3FBMTV6MmROeEFxanhxWlZTNFU0Z1BL?=
 =?utf-8?B?RVllVFFlQjJtNnBSZ0pGbWZjTGRQSFAzNGFOVUtWZHFaNnJuSGp2MUpjNWM1?=
 =?utf-8?B?Mm1TQWdhNTJhTmltUnJNWllXQlo3azVvei8xNERWQ0VUMVBwVUgxK2wrY2po?=
 =?utf-8?B?T0dodkxnLzlIdGFXV2thWStyK1VRYkJiUnRCZWJ1RFh1bEpuWU96L2labG1E?=
 =?utf-8?B?MmlnYzlEUEhCbVQxdFlDMzRkN09UNG4vTzV4aTBhZ2RibkFmUW5pL3E5NEVQ?=
 =?utf-8?Q?FGq114MQmodqG54MeZTyiETA9313Z8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dVVxTHpJamptajBPd1BHU2pweE5pckVoWFJJY0VEbTJCc0w0VDlJYTlpZjlJ?=
 =?utf-8?B?Z1BrU0g2aXU4d2h3bnpWOU9JTjRkZURJREl2YjZmRW4rMEZGU3NOaGJKVnZu?=
 =?utf-8?B?V09YUC93dnE5ejRjcnpZcDFiaGh0UXFkZ1owdDl1aVQvK3Fpb1ZYT2JYVHZj?=
 =?utf-8?B?SVFwU01QMSs3NkFZVCs1RzJPa2ZoRitpMU5lQitBVE5QSWtwUTJRUjVhTnNF?=
 =?utf-8?B?TGhjVE9wLzJCWDZyZ0Z1N0s4aEdUeVMyb3BzMnZoT0FaL0ZYL0xOYTN3R2xk?=
 =?utf-8?B?R2lPV2NCMTdoY2lHeHNYNzZSdnR1VUxXREtCQTRDRWN4RG5tVnhTcDRiREI3?=
 =?utf-8?B?ZzBKRmJJVFRMWnAvQnYwUnJUYndROWVZa2xPY2kvTlVkYllTTnRERnhNMTlM?=
 =?utf-8?B?SVhYOGM0OGVMaWN0MzZCN3RGTnpwN2RuNGsxUVVhOVh2eVlzNVp4OUVDMDBS?=
 =?utf-8?B?UTQyaVVhUVFPTjFGWEo2Z2JJTmI0eURoUHAxOTNSdkk0eVRZM1lhdGw1QzRq?=
 =?utf-8?B?YWpSKytTMVFLOTkxa25pQmE3K0p1bHlha1BDNmtGL01BN0hsMmttNmRpT0E4?=
 =?utf-8?B?SnBwUTZnSFJySExFTkdCaHRlZjZ0YS8zRGNES05pMVh5SGpJeS9uVm84NVVM?=
 =?utf-8?B?MHhZQXdLOGNLTHQzSldnNUJrS3U0VFN6OWJYRDJCb0s4cU95VUdqN3RFRHNW?=
 =?utf-8?B?MXltYSswMHltN0hQc1BLVHB2aFdnVFhycGdhY2NCYVRGUjR3WGRlN0hUQmlo?=
 =?utf-8?B?OVdTN2R6OW9TUXNSaVRPdjN1THlVeWRmOWJDME45RlEwTXBpZmI3ZjZ6M1oz?=
 =?utf-8?B?eXVqTjlQZjE2b0tPakhqYU5vMzJLV0YyUEZBblhkWnRVU0lRdmhZNnpXRzJK?=
 =?utf-8?B?dkk3L0NncVowd3FMRFh3Nm5DTUlNa08vR0VhRkZ0dkZ2eVZ1a2N5R0VCNmNv?=
 =?utf-8?B?RGMrckFGWWZ0K3pGK3EvS2JGNElPOEdjbllxeWZNSlNVUy9kcVZzK0VKK2Vp?=
 =?utf-8?B?TVJqVUhDVWtOUmUwM1h5bmNOMmxKb256YktDOStBWkdzSU5Wd1VBRmhVMWdx?=
 =?utf-8?B?aVZvQWk5bWdJTFBobEhRRE14Ynl2eXhCdlY0WVNSMHJBRmtVY0IvVnRnVEhD?=
 =?utf-8?B?NE5ITVpGbERialR6TlhOdmFVdVpsRUVQUWtNdWVpQ3hjSWsyaG1MeTJwb0Jq?=
 =?utf-8?B?ZFMybDk2dGhqazdINVppZnEvTitPc1ZIZm1tb2EvSzZXMWxRNjkrUkg0Y0pB?=
 =?utf-8?B?eDNGT0V3VWR3c0R4WVBJR2wzZm1nN045NnNPa1NVM2QrWGRDUVBlRTJzYlZF?=
 =?utf-8?B?QktJRXJhbEs0TWRZY1ArNnNLQ3NHR1Zaakp2bmtZMmVFeDRzWHNGcSs1MlVD?=
 =?utf-8?B?bTZPdFMxRGFGNS82a1M2ZkR1L2RvcGlxY3FaSW0zN2ZNRDBudm9aZkF0eFZV?=
 =?utf-8?B?TEM1dE14YjhVNkhBajZWbkNXVHVFZ2dENG1MVnVHTlEwUG8zWUtuY0dYUkh4?=
 =?utf-8?B?OUNtcFlRRXYydHhHMHJxUVZwZE1aTHhUVzRoeFByV2NaMllWZ2QrK2taNzVl?=
 =?utf-8?B?N3V4dkpFdHYwY2xyZ3FLS1dKQmMvUEdnRndGYWpVNWRwZ0FmUStaUGVmekZO?=
 =?utf-8?B?bEttdWs4Zm5xSTBWbElkYnQ4VEhpaGZMTjB3MzkxaUxpdnUxVzVnNXVRV3A4?=
 =?utf-8?B?V21DMjlIR3RBMDVEOCtDYnNHK2hvNEJtbXU5YTVkUDdHSjR0ZytBYkNteU10?=
 =?utf-8?B?eGZmNWd5dGtnY2o0L0ZyTEY5WlFyR1N5M0EyKzRoWmxUTjFpanBuMmJ0MDB3?=
 =?utf-8?B?R0pCcFFMc0JtZzFkV092aTBVY0d1MTArd21XY0I0ZnRXZGJwT3FISytOenMr?=
 =?utf-8?B?ajQvZWNzSzczYkRsaGRtSGllWXRJQWlkNXVpclBGZXdSNDdHS21IY1NFNkhZ?=
 =?utf-8?B?R0NEOXZRREdOcnlCN1UvL1doRnZ6QncraEdicis0aU1BQ1AzeENCUnZVSWNN?=
 =?utf-8?B?YVF1NzZUSnhZdklpeUl6UUlnVnZqeE93K0JVM3hmQ1gwenRLYVhEbG1Nazgz?=
 =?utf-8?B?bFd5cG5NYXhQZlM1L1NiRDJKZlZnMXl0M0xYSlFsYWVxSFJRRFlhKzdnb29y?=
 =?utf-8?Q?WIMmBBIHgCTEZENItpeYO6hsA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E34A4B405DB8AF49988C1422827EFB5A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JS/OlAkuvQd9tOiSIekY/tSmi0jYSlS9GeGI7IuXhmq8glBJ4xwuuEJia1Pctr/uerMPed5U0EPzcmW+f4gmzIlaPI0zJ9t07SwiBweW0MXT9aURxDzoETy51Ge4e/ZRFQW5eNGC+HUN6JWZnJsNobk3UJhItHVOXJRiayKm/BX7a5yh3xF+/oQQLj9qq5fV6kITZ3kt8eejEe967YBBEnGhFYL3y8xlqCMirJbZMl7XzlkD+NG+eVU4D9s+KGGWSGY1rbrxv+Rpiv4zSe+ajqEhmBI5MMzjmbN7iPFfxYV/LrEl6AvKUhVfMiIg9/akpvYmib2X8QrypVfhO21ADI8rV3Xg7xASM8l5//jP3LjojRNr/DnUnHIAYR5ebMWBGiCo8qh5oBQpqxpDgY1Fu7NdRcbLRyal8gPM6U0wyFkfh+BJE+qTyMm8fGNR/KAn7m3Lq9TJyLNGsvZnzE49+zc3RD3hCLe3beN6B56lq4xjVPb4rLzjykYBC7lKj+oETi4Yr4uyDhKhzI2FpLdd2hU2m+2NjQllVeriFsiGOssfG6/WyZHMAUT+hRCDC6iFpaZiYjBzVX0Sxr2ULxw676fwCvzY9sZGBk9CW1ZwxWwYfW/ZcDntHiit208u2jcOMcAjKjg1Mf3c3Sh1IBw9pw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c44c95-6b2c-40b2-9b04-08dda26ec9c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 07:18:07.1443
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lxlc36wtXzwFCL/Q/ayQueVUs8QSRkKtNnStZ1VOnTEzqtQcvgndsaY1v0aLr/QDJ2YhtV1h/Phx+2oxBXp3Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7777
X-Proofpoint-GUID: _nA8IIS74JQMoAwbWurMw0gUBUK0WRlY
X-Proofpoint-ORIG-GUID: _nA8IIS74JQMoAwbWurMw0gUBUK0WRlY
X-Authority-Analysis: v=2.4 cv=a4Yw9VSF c=1 sm=1 tr=0 ts=683ea1b6 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=mswG3d5QpGxhx9yvyLIA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA2MiBTYWx0ZWRfX93IKzCBvn1A8
 Je1lKi6+QgIToXBBf0t2fb7oq8zunw4DMdh+NCRNjaEiJBOU20UTlr4/6Kn9KmtmN9erhT5FXgS
 ky7TrJFUtaewaDLM1G6qd9inCf7F7iOUvgmwUGvoZ/RE/cM6lsk15Rjtp+67O9rbOPqdrPL4US1
 zOqjny7+NYqvp7dspV0B8gafU5mnHMu+50LBoLrIrUwTBmrEW9rXjuv9/DliV0j0BI3jmp+eelQ
 uj7fOSPCoYIcgYcng6zRSUwmRy3fMNvKkislHfvWudJPgNjhbFeP6aPVB7OCSwKFyKswinsvGBk
 pOgidPkoMe68JEFW8sRj9/LI1/8d2W8watRqsaVsyAkn8WyO9lOGC+rXNXCONIEKe4hxFPSPmVG
 qyb7j0ZxEpQcHKNPcsSPwcEC6KW1FiUuNaT1+ctJfryZEIuP4dW/DJOP1ITu+A4WJGc9S4Qr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 phishscore=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 spamscore=0 adultscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 mlxlogscore=885 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000 definitions=main-2506030062

DQoNCk9uIDUvMTkvMjUgMTA6MjIsIENoZW4gTmkgd3JvdGU6DQo+IFVzZSB0aGUgZnVuY3Rpb24g
dXNiX2VuZHBvaW50X3R5cGUoKSByYXRoZXIgdGhhbiBjb25zdGFudHMuDQo+IFRoZSBDb2NjaW5l
bGxlIHNlbWFudGljIHBhdGNoIGlzIGFzIGZvbGxvd3M6DQo+IA0KPiBAQCBzdHJ1Y3QgdXNiX2Vu
ZHBvaW50X2Rlc2NyaXB0b3IgKmVwZDsgQEANCj4gDQo+IC0gKGVwZC0+Ym1BdHRyaWJ1dGVzICYg
XChVU0JfRU5EUE9JTlRfWEZFUlRZUEVfTUFTS1x8M1wpKQ0KPiArIHVzYl9lbmRwb2ludF90eXBl
KGVwZCkNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENoZW4gTmkgPG5pY2hlbkBpc2Nhcy5hYy5jbj4N
Cg0KQWNrZWQtYnk6IE1pbmFzIEhhcnV0eXVueWFuIDxobWluYXNAc3lub3BzeXMuY29tPg0KDQo+
IC0tLQ0KPiAgIGRyaXZlcnMvdXNiL2R3YzIvZ2FkZ2V0LmMgfCAyICstDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy91c2IvZHdjMi9nYWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzIvZ2FkZ2V0LmMNCj4g
aW5kZXggZjMyM2ZiNTU5N2IzLi5kNWI2MjJmNzhjZjMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
dXNiL2R3YzIvZ2FkZ2V0LmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMi9nYWRnZXQuYw0KPiBA
QCAtNDA0OSw3ICs0MDQ5LDcgQEAgc3RhdGljIGludCBkd2MyX2hzb3RnX2VwX2VuYWJsZShzdHJ1
Y3QgdXNiX2VwICplcCwNCj4gICAJCXJldHVybiAtRUlOVkFMOw0KPiAgIAl9DQo+ICAgDQo+IC0J
ZXBfdHlwZSA9IGRlc2MtPmJtQXR0cmlidXRlcyAmIFVTQl9FTkRQT0lOVF9YRkVSVFlQRV9NQVNL
Ow0KPiArCWVwX3R5cGUgPSB1c2JfZW5kcG9pbnRfdHlwZShkZXNjKTsNCj4gICAJbXBzID0gdXNi
X2VuZHBvaW50X21heHAoZGVzYyk7DQo+ICAgCW1jID0gdXNiX2VuZHBvaW50X21heHBfbXVsdChk
ZXNjKTsNCj4gICA=
