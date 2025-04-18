Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F4320A5C3;
	Fri, 18 Apr 2025 13:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744981426; cv=fail; b=NeDchzjmmPzR5X3WzH01fevj3+nHUkgCwrqeOC2vLPXWl8ZnnimeYI5D1i1p1DcAvXHir3WS2oF13vP04l3PdxEZwqsRXdkcSjnsZ+5/U9XMjS94f2zagc4Qd95+RyEw8NyPJA2hxgB5I5jz6PGIGzFgzrflGsZqcfqGqa9POFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744981426; c=relaxed/simple;
	bh=5VQJLAOIUVeQMCJvyYotwUl6dxx7bFGTLjmyZ8RUAsE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FjwPs6+MRW/MU8712Prpcg1F+4FWn+JvMZacFzA7EZ8zstcaaWlNDtUrrYxaICVhoQou6TF9VqP/pp6t9AaY1OFOQQhmQcbdWszbPFic9dqfbJecT1dcQ1nJuSOX8vffddwDcmPsrolsNWVT+uKpIaDQCqpkSLfnwwv/FMqlA/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=SbIiJoyu; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=BYzjpjMa; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=u+v+K56F reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SbIiJoyu";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BYzjpjMa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="u+v+K56F"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I63gPe019396;
	Fri, 18 Apr 2025 05:26:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=5VQJLAOIUVeQMCJvyYotwUl6dxx7bFGTLjmyZ8RUAsE=; b=
	SbIiJoyuUaPvi1OBFULMJ35bxrK0bhgZ0ubKaGXXL23sLRFQQ9SImmc+rd/erFkH
	AglRr2bRNGYYxDXQ9dmMJLOky2lfjBK+ATzBwkJzop0DtQsO7segaAshIZv6DlXX
	dyrPJYr98UPNu+DCsij5QfqBw9Recbi1VZkpSXxq7+req9htakmWFGStobafiVUx
	YkdFuK58oEJ7H3Q1yf50oWW1rZyC+9S5W0jYH0xKhmUlC6hN0tqbfYuAR41Ig74s
	eFIShl9au5oqOVQTZP3ftoi38Nam+Oral4X1XfMKC8fqz3+7E9WWt9RJAtoYyGoW
	uNUZ8qrcK+H/vV2yE3AKTA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4602t8ysw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 05:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1744979163; bh=5VQJLAOIUVeQMCJvyYotwUl6dxx7bFGTLjmyZ8RUAsE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=BYzjpjMaL/fmrCjybdPUrljs/OPH3ZH6i/i//T9Lj5LVv1Z9todpTiumNFR11kzHI
	 vIpcWPEFemqbVOO1ASfb+QGqtReE6vvzBok61cCGm/9GHaGSIacSZG0E3Ak4SgBzXw
	 n/q6g+dRuKCDef3Emi5mINt2+5tBbZljqQrnW8biKW5l8p12PGpFCBD+BnlvEAfefN
	 0kolovTLJh2xltRv1kbpMTGY2eJf4TjePScJXc9hbJl7GO7v9Qzq23nsQvjpfokdbX
	 crwYtN3U4lWVCLggyGq2iCCO6YrwzxV+FA6MOMygN2o2qWPLzmQykHLJA3OsD/FrFC
	 z38Ga0P/3WPZQ==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A73004013B;
	Fri, 18 Apr 2025 12:26:02 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id F0EE1A006F;
	Fri, 18 Apr 2025 12:26:01 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=u+v+K56F;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A92ED4041D;
	Fri, 18 Apr 2025 12:25:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VXRYulif7XHvgq8Z0CKV6tcXQZC9UCyfYMnvpPjbYedtQsF0vty8xwoJEO7LCyTMZlGPjQUV4NMsNkDN3XsGurNodm7RlnAMK+tSTGsZCLScQWsFmH0u45qh8vAErpcltGQNbOVXBPCleSleq2B8CvtFthxdRVvy79mnkZTU55MJzRZHYt5COi8hIaIwD66mgXw42CK8IevBbaDT/YohvH8REmRslAR2cMNLJz3P1k6LVJ8PZRnisx+J8xVMoGyrUx2BLCil3km5R7qVTnaS+Jkk7QZkcxJ/NhDzNTr5tSuNPjKxOiHtCe9qN93pMOVqaOLxFLRVnRKuON/u/gfgAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VQJLAOIUVeQMCJvyYotwUl6dxx7bFGTLjmyZ8RUAsE=;
 b=eS91IlJWGunBWOy5nMaWuoKnNQrI5iNVx5/AbXzFobjV77xZ0MMFTNHNYvVfxxjGFQC0GQGdPaWZIHVxHWC2CWBuWPqw7Xkju/6DhoG2YFoimKJB4fYDue/JpgA7wwZW4KOzi/mn8chJXsg/7ByvRwTiEszQ9sM7WQbBzOO4ZIg7zTWKT1Y1LAAJG9OjwvsFYkQ5s1JC4cUPRStqis4yU3HqtA0xh/AMCUdvzVWvhF67RFEj1twXbXBqGf8u+hq0DHDSzh9EH+KrTYNpU1UFUKux9fiowRGRTU30p9bdtEpdelufUYCDpADCoDQ04SmG6oH7xrzdVxn+Db77poYCIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VQJLAOIUVeQMCJvyYotwUl6dxx7bFGTLjmyZ8RUAsE=;
 b=u+v+K56FOxMZdc8jQ5if028z6mQB6nMUTeq/C7wO5FB7lgZSTm6VDsZSk6Y+L4vcwPa4GdVTkTUPcm4DI+cxme5MyvFzhsm04a4FdrAGn367Lrc7hzn5Y+CuFV+CAzEyFJdyy+2ldstPuxmkdtSGlmvet6oCW7IwSkb+CmPrFwE=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by SA3PR12MB8803.namprd12.prod.outlook.com (2603:10b6:806:317::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.25; Fri, 18 Apr
 2025 12:25:56 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::910f:c354:ea0d:1fd]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::910f:c354:ea0d:1fd%6]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 12:25:56 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH] usb: dwc2: also exit clock_gating when stopping udc while
 suspended
Thread-Topic: [PATCH] usb: dwc2: also exit clock_gating when stopping udc
 while suspended
Thread-Index: AQHbr7/U+18DnlzetkmtZbU4g1CqU7OpWpCA
Date: Fri, 18 Apr 2025 12:25:56 +0000
Message-ID: <add96b11-ddec-84b9-c17e-6dabe0dd8ffd@synopsys.com>
References: <20250417-dwc2_clock_gating-v1-1-8ea7c4d53d73@pengutronix.de>
In-Reply-To: <20250417-dwc2_clock_gating-v1-1-8ea7c4d53d73@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|SA3PR12MB8803:EE_
x-ms-office365-filtering-correlation-id: 18723c93-78d6-4b58-3c81-08dd7e742b73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bWFGWCtmRXd4TlJiMmxjQUwxMjVWczhsRlV3Q2E2bWlLTHQ1cERidGxlMnU2?=
 =?utf-8?B?YzlIdXZ4N0pISmZ6cVN3Z3cwbnpSL0FLMmI4M25BVlEzaXVlTWg5V3EvcWNH?=
 =?utf-8?B?QlZwSFpQeDM1dGNFbjhQdVQyckNKbGgwVWRrR3hmYnJUbjFFdXFrMVEvRGxi?=
 =?utf-8?B?ckxRRnc0clJKL3JoRlhtekV3Qm1HM2ZMMm9CLzE2cXEweVhEWXFSMjAvVXFa?=
 =?utf-8?B?TWwvWSs4ZU84cFpsYmtxUlV5Y0tpVzJic0tUcDArL1BuenFOd3JSbHJnWDlQ?=
 =?utf-8?B?TDNSSlYzSkFlVlp6RVFQUWFEb0JOUEYwR3NxS2JtbTN2Y2pRRVBVNU15d3Fj?=
 =?utf-8?B?OE8wZmxjTE02TXhzaGVMNnI0RmRPaVNkOFJxSFlWN3BGdkpZN3JyOGE2TDVT?=
 =?utf-8?B?MXhWUEgxMVZkay9yOFZrMlppYUxOSWN3RTFYU0tOOFR2dERsd1U4OWoyOWhq?=
 =?utf-8?B?aXQ4TjExN1R4K0FDYlVQdzdWVG1VaUZDNkdaZ1Y5OGpoNm9SUTNYU1FVOXgv?=
 =?utf-8?B?dFZsOEZWaDJyUHZ6cU1JcS9KR25BdnBYb3IxT0ZvSC93MkxNeVg0UmYyUWtn?=
 =?utf-8?B?cXJ6UHlWMzVKcW02OFRySmROelpNOWVCTGpKR3JWdXZXemdNNUtwZ2RENmxm?=
 =?utf-8?B?TlV6eXNUbEE4Ry9WenlPdXVGcElSemxidnFiL1c3L2VTbmJoL0pmeFJIYmFW?=
 =?utf-8?B?Z294WXZoMkxmUitYSGpDSzZEdVFUUG9tSXhiVWtIUHdwSHFXNTZiRFk5M2V6?=
 =?utf-8?B?WFJQWHkwOEN2VEFtS2kxQjhxREtUUktwLzF1Q3pHV3RsSjgvM090Zko4RGIv?=
 =?utf-8?B?OWtsWk1KcXlhdjNiSHRZU3FzYm83L1laK054MlhjL0Z1MVk5TzhOY21wREFX?=
 =?utf-8?B?eTl4bWVka1JTRGc3VXE5M05ZQWxvRUZoNDM4VUFhTTV4eHVuUEZYZG5jaUt5?=
 =?utf-8?B?MEFrZ0tpa3pwbUxsSVhEaGFmSWJ3Tk1ZOVUzVWJVZVN3K1NuNEdHOGYyV2hX?=
 =?utf-8?B?NlhiM2g5MktGeFkwUkdpQnFMUFVWQzJFTDVDQUViSVFtZnNrQVFVTVlOTklz?=
 =?utf-8?B?U3Y4ZzNUOXNkcWt4aStjdXdiUi9tcUZrdXo0a3k5YzRwbHlUOEtqQjdvc1pz?=
 =?utf-8?B?cjlHYnNiM1l3aVlHMGV3SEg1Z0REZ1FQeUx4V1QrSnU5R3JVMW5LeXNYOVdE?=
 =?utf-8?B?YW5xWloxM2crZ3lhd3h5N2N1bFV4dlpsQ0l4Tk14WkNFMkk0YlNCV0lLaDRK?=
 =?utf-8?B?NXJvRHliajdYOUZNSTd2VExzeXl1Vy9HTWdqVWxtaHA1dkE4Wktlbm9hYzdV?=
 =?utf-8?B?Rjg2ZzJQU205NFIzSUhQeFF4d0o3bDdSRDRpOVVPbWpoVThmTFIvaUFNSFFl?=
 =?utf-8?B?cUlRZHk0NFlxN0FzMmVIQzZHakFReVZxUE5aUU1LeW9UOW5kR0ZDNHFiWnNZ?=
 =?utf-8?B?WUZjVXA4RWNlZW1kUzdwQTBNNzFXc3V2dGJsZVVJMVBzVmFycUpWNTV0bkxS?=
 =?utf-8?B?K1lKVWlySlJxMFhRM3k5ODZ2WnlTbXIxQjA2WVNQTmZkZVpvWmxPaURrUzJR?=
 =?utf-8?B?TGVZK09LMm15Vkg4Y25QNy9GSmFIdFVNeDFtRWxUWkE2Z3F0alFIR2prQXY4?=
 =?utf-8?B?cFNTOExVRmFBZjBnT2F6NDhFNzF4NTJlY3o2YlA3bXRqMGtuaWdqT2xsZGcr?=
 =?utf-8?B?M3VENXhEQ2owSGpZSFNaeHdaVHV2NENTVGswK1BySFZvMGdVUDg1WkNNbTNt?=
 =?utf-8?B?SWY0Y20vWE9YSElxZHJleFFpazdETjd6VmIxUkVGaE5VUXpFcVFNbUdpSzVk?=
 =?utf-8?B?T2UrdnJsZnNyMjNBNnp6VUx3WXA0enRhaUZVb1BVMW9uZUJHRS81bDJIUnVi?=
 =?utf-8?B?SjZJaVptVmxkOUZXVXNpenVxeE9SVkNiL1prY09SZ0xhN0N0VysyU1ZHdU1Y?=
 =?utf-8?B?U0xaOGtDKzIzZUpkNWxKRE9GNjFKMUwwSEhXZFUycmV0U3lIdldQNEFwZktE?=
 =?utf-8?Q?rbYoxvDiz6xm47uSxHljkq5GRopV2w=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VEtrT3lVZ3JIcmYxNnYrbkorZzhJZ3BpeG95a1JjQXZHeW5rbWRNeXdVM1ps?=
 =?utf-8?B?VUhrczJubCtzckVFc2xWSXZRVVhmaEZRZzZXTGpmYjQ0TXAvOVJBTDJib0Ro?=
 =?utf-8?B?R1VsU0ZnS3VLZEFKYkZ1NGJJTWl5RkgxVGlDS3owYjVjamZiUVUrWU83c1BY?=
 =?utf-8?B?UEFCc1NhYzFjdTFvOFAxYTZFZVNVS3BGMXo3ajR4bU5QZ0xncWFCZ3p0amdv?=
 =?utf-8?B?MStYa2hVd01oOVpibkpsS1JLcjQxRmJ0aG1sMHZWV1BpallQenRqL0ZFRTN4?=
 =?utf-8?B?eUl0cS94Tmw4TTNxQURHRGxDeC9LQytQdkVURjNWcjVGNWdscUFGYWozMGZQ?=
 =?utf-8?B?cGV5SHNlYXAzeFVFeVBacm5PdDZ0cjVmZHlhTmNlV01LQnlleVlKYzJxVDJS?=
 =?utf-8?B?RTFEVDVmQi9zZkt1bU5ZbTE4NVR3V215SmFZMEN5Z2pVU1lYNUgzTzJyVExu?=
 =?utf-8?B?bmJWNFJoMldVUVA1MUhXaXIwTFZzY3ErT2V3b2VRN2VsL3FFeHdaVVhhZnNx?=
 =?utf-8?B?TWgrQ2VTVklCNFkrS2xPNEFveWN6Y1lzRFdYa0hXQlpYcHFNUVE4dGVvaUFM?=
 =?utf-8?B?ZWdtSjBxbnV6K2kwdlVwYUlnU2RhTHhZbnNIYVlNUk5HQitZYVJzZWNKenR5?=
 =?utf-8?B?QklDYkpCNWY0cmNVSkR4anl0aGt5K3ZMd2RKWG9ObENXVllMREVDZExqVG5H?=
 =?utf-8?B?bnFPeXZ5VURZb2pBMmxmSVFRY1RJejYxVmhHemVSbTRBS2J4MnQxb21Qblgr?=
 =?utf-8?B?SHhmUkRVcmFzU0ZyUDc5T1V4cTRKeEN0VVNWOVlCejdtWkVNMUErZlpxVElR?=
 =?utf-8?B?a3dkd2kwajRVSUNlSVFYT2FBTDRWaU5rRy8yVkdnSEhKZmYrclhQUlZJOWJB?=
 =?utf-8?B?VTBQazZVZ2lxdWZqL2xNRDQ0bFU0c1BUSGtyZStJS1MxZ25QZWRNYXVPT0s4?=
 =?utf-8?B?K25vVHVGMWkrQ0Zwak9BT2ZJY0lOQVh1ZnhySkwzS3VFSHJlT3JGdWlVNEcr?=
 =?utf-8?B?dXFaRmtsTlNjb3JPQS94aEFpdU9pQlVCZHNCekVKOGhvNnhCYStUdXA2QnYy?=
 =?utf-8?B?WFhobHZPQW9BaXFJaEJldjhCS054ejNib3d1RXhVRm1xZVFUcWVnQXFTYU00?=
 =?utf-8?B?VE9XNDNpVTNkbW5zUnZyZHdML0FmelpldXYwMlExN2p4aE1FZzN6SWxqcEZN?=
 =?utf-8?B?YUU4eTZ6emE1c1ppWkU2a2M3SnhpMmRlQXRHdzJIdUYyMTdqWlZQdS9RNk80?=
 =?utf-8?B?SnlSb1VLR21Bb3BSWXRydG9pN2R2YUUrR0F6eWxTSCsyVnU1b1ByNmFkUDFy?=
 =?utf-8?B?d3RudncxbVhDWmE5bzRMcmxGSWl1b0k2QVdsY0VaLzZ2cmRCeGx4cG16QXBT?=
 =?utf-8?B?Um12VUZhck0wMkZnNDhlOFRrbkJvTUc3YllCTVFkSXVHd3dOYlAvWkcvUlZz?=
 =?utf-8?B?U0xNRDcvWFluVk1iV0xQajdraWRMbGlVSktManNDendmQ0dtU2ZHV3VWL3Bi?=
 =?utf-8?B?Sm9PL3U5MlNERi9pRVRlOHRpL1QwQ0RPU2Vha1N4cXVrenR2UmI3NTR4dWlD?=
 =?utf-8?B?ajJITkNxV0RSeG5hWEV5OUZ2WC9JSTBrMHluWExmZ25iMnVlbEIycmtyQlVm?=
 =?utf-8?B?SGdvVDhET3FYdm9mMmZnR2k0dmh4OGpJZU5UNDFGNlZtOTJncndYek1pekxS?=
 =?utf-8?B?Wk94TTZNRkhQeit0bHRHQVNpenE5V0xpeVVPdDhUNWNuZWc3eFRrVnJxcXVZ?=
 =?utf-8?B?bG5VWVVsTmUrWXFqdk1xclR1d3NkVjVlUkVySDZ4MWxlSE1UY2xYZGNCZHhR?=
 =?utf-8?B?dVNQN0ZHdVlFWmZmaHNyRzZ5bFc5WnVYU1hOMFNManM3ajFBT0VDT3RPUGRi?=
 =?utf-8?B?T0tudjdIb3E0aTBuSVMwNUs5OXpOR2R6Vml2MTZhTE5VNjBoVDM3STlUcWZp?=
 =?utf-8?B?bW12UWo4SzZQSTU1UVJicjFyMXhVTjJVYWtVcnMzSzJ0ZHpmSW9ia3lWcnBi?=
 =?utf-8?B?Z1F6NFE5NnZDY3prRDdzbTdQSFNFNjdhTXUyaFVOQzhvL2hIZzQxZVlldklz?=
 =?utf-8?B?MnB1WlhORzh3eEFrakZLamFGdjlKby9kZUg4UUFGcmY2anlXSkRQejNyVFRN?=
 =?utf-8?Q?9hCJums+B8mADL3135G8SpPga?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <769A488CC1BDA44F8CEE1CEF5650E56A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sbxDuyvmUm0vvFjRRZ0u9zSKtFXyVN4kyj8pI98Sf9wdW+SpHiYH80zUugFpHwTGV8mnENRvm2C8cee59McrD8FbM6kEfU/13E0VFbBCiTDw9aEqMp+fxcTQhg2kwmIGAVO/L3rc6NB9F/0Yoq98Dc4GjMPHfQr88I+XpgULCef4clDjitT9VzRlr8V9wqO28ZgLSf1hwVLM2NM/PKIw0sG1Bac1oSuU2J20gvEl7W97peOqXeEcHiZ5eciyClFekop1elT/Z66yTjpaNVk0OoIDTmuQOA4WGYhyWDlaf4COmHH40llNEVAx4IeUwbpD/dYLED5ujDArafwh2lvXwQy4ZwjipL/aMWQmqn71KEjQ2ZXc9DvP/bMhBaAyQGsGL6LmLTe5Jrsb/vnJbcnu+SsL3fuvnwmYLd87cXL35Z9T+oaM7RcvB2pWGoAw88rRwr4jvXF/gp8mfNEDFLY5CatnORRZghRznMy4DG2IS3ytLizadeQZpWwdIOOoO7AvlthmrafNpHcsFcxhRWvPbmHqQe0/2luOvxnyPwxFRyRz1xDJVngtsJypirSNx9yrB2Vn3ZGrM/Dre5iiHHZ4YSkpI8oH+KH5HvdU6BZcRTx5kbssed6KYn2r6tn+77HaPFoXqV+ck+Z3kmscwzbXww==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18723c93-78d6-4b58-3c81-08dd7e742b73
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2025 12:25:56.6539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t+5a7kEjQO6e7x66Nav+bOA2YaPIJwXbs1x36RA4qyh0oKaCAGvJ4JHdAVld1FA+/OteVqeDZJfgmMgfuopybA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8803
X-Proofpoint-ORIG-GUID: 3O0qo6fodQHA9jMm-JvR2q--yc_PyrbB
X-Authority-Analysis: v=2.4 cv=Nt3Rc9dJ c=1 sm=1 tr=0 ts=680244dc cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=INp6KNVOiCDLbWJpnEEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 3O0qo6fodQHA9jMm-JvR2q--yc_PyrbB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_04,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1011 priorityscore=1501 phishscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504180092

DQoNCk9uIDQvMTcvMjUgMjE6NDAsIE1pY2hhZWwgR3J6ZXNjaGlrIHdyb3RlOg0KPiBJdCBpcyBw
b3NzaWJsZSB0aGF0IHRoZSBnYWRnZXQgd2lsbCBiZSBkaXNhYmxlZCwgd2hpbGUgdGhlIHVkYyBp
cw0KPiBzdXNwZW5kZWQuIFdoZW4gZW5hYmxpbmcgdGhlIHVkYyBpbiB0aGF0IGNhc2UsIHRoZSBj
bG9jayBnYXRpbmcNCj4gd2lsbCBub3QgYmUgZW5hYmxlZCBhZ2Fpbi4gTGVhdmluZyB0aGUgcGh5
IHVuY2xvY2tlZC4gRXZlbiB3aGVuIHRoZQ0KPiB1ZGMgaXMgbm90IGVuYWJsZWQsIGNvbm5lY3Rp
bmcgdGhpcyBwb3dlcmVkIGJ1dCBub3QgY2xvY2tlZCBwaHkgbGVhZHMNCj4gdG8gZW51bWVyYXRp
b24gZXJyb3JzIG9uIHRoZSBob3N0IHNpZGUuDQo+IA0KPiBUbyBlbnN1cmUgdGhhdCB0aGUgY2xv
Y2sgZ2F0aW5nIHdpbGwgYmUgaW4gYW4gdmFsaWQgc3RhdGUsIHdlIGVuc3VyZQ0KPiB0aGF0IHRo
ZSBjbG9jayBnYXRpbmcgd2lsbCBiZSBlbmFibGVkIGJlZm9yZSBzdG9wcGluZyB0aGUgdWRjLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBHcnplc2NoaWsgPG0uZ3J6ZXNjaGlrQHBlbmd1
dHJvbml4LmRlPg0KDQpBY2tlZC1ieTogTWluYXMgSGFydXR5dW55YW4gPGhtaW5hc0BzeW5vcHN5
cy5jb20+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy91c2IvZHdjMi9nYWRnZXQuYyB8IDYgKysrKysr
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdXNiL2R3YzIvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2MyL2dhZGdldC5jDQo+
IGluZGV4IDMwMGVhNDk2OWYwY2YuLmYzMjNmYjU1OTdiMzIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvdXNiL2R3YzIvZ2FkZ2V0LmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMi9nYWRnZXQuYw0K
PiBAQCAtNDYwNCw2ICs0NjA0LDEyIEBAIHN0YXRpYyBpbnQgZHdjMl9oc290Z191ZGNfc3RvcChz
dHJ1Y3QgdXNiX2dhZGdldCAqZ2FkZ2V0KQ0KPiAgIAlpZiAoIWhzb3RnKQ0KPiAgIAkJcmV0dXJu
IC1FTk9ERVY7DQo+ICAgDQo+ICsJLyogRXhpdCBjbG9jayBnYXRpbmcgd2hlbiBkcml2ZXIgaXMg
c3RvcHBlZC4gKi8NCj4gKwlpZiAoaHNvdGctPnBhcmFtcy5wb3dlcl9kb3duID09IERXQzJfUE9X
RVJfRE9XTl9QQVJBTV9OT05FICYmDQo+ICsJICAgIGhzb3RnLT5idXNfc3VzcGVuZGVkICYmICFo
c290Zy0+cGFyYW1zLm5vX2Nsb2NrX2dhdGluZykgew0KPiArCQlkd2MyX2dhZGdldF9leGl0X2Ns
b2NrX2dhdGluZyhoc290ZywgMCk7DQo+ICsJfQ0KPiArDQo+ICAgCS8qIGFsbCBlbmRwb2ludHMg
c2hvdWxkIGJlIHNodXRkb3duICovDQo+ICAgCWZvciAoZXAgPSAxOyBlcCA8IGhzb3RnLT5udW1f
b2ZfZXBzOyBlcCsrKSB7DQo+ICAgCQlpZiAoaHNvdGctPmVwc19pbltlcF0pDQo+IA0KPiAtLS0N
Cj4gYmFzZS1jb21taXQ6IGNmYjJlMmM1N2FlZjc1YTQxNGMwZjE4NDQ1Yzc0NDFkZjViYzEzYmUN
Cj4gY2hhbmdlLWlkOiAyMDI1MDQxNy1kd2MyX2Nsb2NrX2dhdGluZy01NzlhODdmY2RmOTMNCj4g
DQo+IEJlc3QgcmVnYXJkcyw=
