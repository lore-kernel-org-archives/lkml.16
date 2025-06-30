Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AEE28F1;
	Mon, 30 Jun 2025 06:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751265640; cv=fail; b=sB///D+gzvBmxIk3iATOqX4yul80SGJ6glCiRAz7bzYIseLweWtrvWuIX1DD3WOFJaPae3HmZ72i2+DV1rj7b/8/CJGB6WWt/xt51jpFfLLAaAHFMMOsn6bOmBY9XQovTKhX3F2RrF8pscnS6QYJD97QzW7tYNpT/7hCzmteBfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751265640; c=relaxed/simple;
	bh=U22yFgRSio1ChSKx0tIzABPMn0gCmv1DWAcEmsWG+r0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RsO4WHNWNg1+UT6yg/Gek5uxfQlpNiFpuvq8eNOM0xIGBVoCUybl/vPiJ2WTJv9vC1rNWfyvlUHA8cgRCHbNjrODU5Dybn03avaL7MvpyRuH6YoZ7kAJ+f2yW6hXZN9IBIi70LHx+EZmrwcJ7A05aPfECnXEQ0lSFBR6FdRotLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=BIrBbm3K; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=S3Z/d4/m; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=pmfNhNB/ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BIrBbm3K";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="S3Z/d4/m";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="pmfNhNB/"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U69163018603;
	Sun, 29 Jun 2025 23:40:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=U22yFgRSio1ChSKx0tIzABPMn0gCmv1DWAcEmsWG+r0=; b=
	BIrBbm3K35k4of7qN5oU+OGTlJ2AesS72JU971xPcWjR8IVvx9DCpc4ughRwwODn
	ODRkPHFo5SxG2V/2mY5tvzkPwyubAwo2uW9kith3YeHae3uVvkKvr4EHXBzFdZMD
	aQ2p2Rent53dFlWUukuAb3ot6qvbIC44f2Zu+6TsxmZoMOtIa90QEi6pz6BB/z0u
	4U0LH9tIxIMZv3H+yrj2iZ2w6qsQwXnc3TEV0BuOmxYPBQQau+tABABxkMWnyYYo
	2fuVImx2fF0CgAXtStSMvJwQS7SOyeAk9en+qoia/3OJqSI3xkpWV1s1w5kz7Wy2
	nWn8QHzby8wxbNGI+NS9YQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 47jfaw4j6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 Jun 2025 23:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1751265609; bh=U22yFgRSio1ChSKx0tIzABPMn0gCmv1DWAcEmsWG+r0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=S3Z/d4/mlTTS9eZkQnQx9wqNfAeMq1fmICGwYj9x8eI1LbC5Olb2RqDIjJZ24wkQT
	 osaEnUeVmBrLoEBP6ujoZJkzv+Nu/3PFmXlo6uArjWdG73p+jiqrvebyO8AoW3jVkt
	 rX4EMDSKDj2yERSXVmyvIIIxHQLh1GBJqb6oS7hRAf38U835azV+cmo/9hqjA8fss4
	 grXLrM8KIRRKNm/ELyiAbV0OFxH4xUOwpiL7JzNivBYcBFG+GhSbns1ApfBLfzcb6A
	 znxp+V5SfhrKLcT9lhbCJ9NUGvsErVzVPMAjqKovPX6Hrh/JRyJkTPlQFxIT6DkeZj
	 a8SPdBs3WZFLg==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6E63840107;
	Mon, 30 Jun 2025 06:40:09 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A7127A0070;
	Mon, 30 Jun 2025 06:40:08 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=pmfNhNB/;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id B691140467;
	Mon, 30 Jun 2025 06:40:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dk9v2aWGoU8lPM7jjpsbmHE+xp5TU5srnLPsPVB8D+y3ONcvMSDflJGEeVt0xRi3pAsrVK3XY/wLTuuGMvXRNfWqcd3dYxL6FiBZylRwFK98Co3RlthtRNm0cECtbMPZmn4iwPPsIXAKthastubTBrfWc1VObBIuEaYm+o1MQwBV8foiy7brpAzg//rySOz2jn1pU/mic96p837ueBV4BxGvcMi0imOy0DcXHplaquRTkf3Vr0Mxtg5nD3lMhcQ1AP2hCygDagomlbpnCOfhupfbTf7bmBRcV7/DHLEPB7qmioCbf53+j1h4mX0xyRzb7dRMCZDsIDcWJMXyI3TTbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U22yFgRSio1ChSKx0tIzABPMn0gCmv1DWAcEmsWG+r0=;
 b=eD1AmIjEMtzONJPFzwxLIh+j7U0cWsivnEQ47DwHE1dVGTOMBujQdPbXRwR2r2Gy1eZe3A2xlEQDVu7KcJl7XxgPrt50L8pWl0yFKRX4cs8bASNxVdaERam5gf1l0IcF1JVhqv/X+OwbLdEveFnO2MSko29TIeOH7TD0+d5tjF6Eg8OMhr8sZhElWTGvCyXwebt8Ndegt+qhkhXZ6n009/SaxzjE+6WcTafSLwIYobievP+47yOvpfZT1hT90X5/Cx+ZXMZvUC+7kDQYLUPt7vJAcxAoUAUYi5dU4+Jn3IxX2JTtWLyOQD4yhbvaYffjCbVVPAyKp84OCncd1Np3JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U22yFgRSio1ChSKx0tIzABPMn0gCmv1DWAcEmsWG+r0=;
 b=pmfNhNB/15+N/dJxiswfDzF5WhqrVwww5aUf3Thq+WlkTf3cs6pVkiGugeDq6rAWpmABzHgzDORhHW77O/ag69Ocp9JLk0cjk2h8JKRB1ttJi4kRRExob7qUYsvqA/995JFo8SSFJvKbJ9u1GlOpG0JuzSSZyGCnXmr6ij+M0js=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by MN0PR12MB6128.namprd12.prod.outlook.com (2603:10b6:208:3c4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Mon, 30 Jun
 2025 06:40:02 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::910f:c354:ea0d:1fd]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::910f:c354:ea0d:1fd%7]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 06:40:01 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Jisheng Zhang <jszhang@kernel.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc2: disable platform lowlevel hw resources during
 shutdown
Thread-Topic: [PATCH] usb: dwc2: disable platform lowlevel hw resources during
 shutdown
Thread-Index: AQHb6N0eY5dL/cwZQkithSNBsnvzKbQbQd6A
Date: Mon, 30 Jun 2025 06:40:01 +0000
Message-ID: <cd7a3c4a-13fd-c87a-e410-48927f76a7b0@synopsys.com>
References: <20250629094655.747-1-jszhang@kernel.org>
In-Reply-To: <20250629094655.747-1-jszhang@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|MN0PR12MB6128:EE_
x-ms-office365-filtering-correlation-id: 435949b9-6b81-47a4-1271-08ddb7a0f08e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?U1MvMWxvT29oeUxSTG1DMmlmdklaTDl0dmJhNXBYcFR3MmpucUs1SFVRekhU?=
 =?utf-8?B?OThoc1FJeUdoampRUHZWbkVRSWp4M01IMVBqdkRYWlJPS2JNay9OWjkzT2o2?=
 =?utf-8?B?bTV2aldubmp6QjlwSGpQd2tNRE9WemtTK0FLaWxDVi94eTJEZGdNOENTQ2xW?=
 =?utf-8?B?OHVWQTZmck5kdHFmYUNValg4c2ZRaGFjVnZ2bXZrK0ZFcU9aSjIrbnlVZm1D?=
 =?utf-8?B?bFJDbVZkYWlOY3lUUVpIVHlNV3NMWlpVVEZHdFlQQ0xyR3piMURsUkdYSEdR?=
 =?utf-8?B?d3BRYUxyaFRNZVV5b2VZdG96d2hER1dwbG41SGJNTS9YMUNHSUptK1NOaC9F?=
 =?utf-8?B?M2ROa0xHamdmUEx1WjVQd3R2bW1zUnJ5N1ViYmlmUVBPM1NTWCtFRVRXWGhm?=
 =?utf-8?B?NlZsb09HSDM2M25pSEQ0RXQwbTY4TTloWWVjMEg5QnRLTGpaUWZ5bklQZFJZ?=
 =?utf-8?B?VVkxcDJIWjhXMVY0VFRiTUhDUDQzTjZNaUJKNE82QW1LbjJtV2IxRWQ1Znlu?=
 =?utf-8?B?RFFLbzRaM2cxbWNkMDN1eFRTY2pTK1ZQekFES0dKZnVUWUJUcWFFLy9UOWll?=
 =?utf-8?B?eHZPSDlQc0lKWEdQaWxSbll4YmVBRG5GN0F6UnFrNEYzV3g4YU8ydnlIYkQ4?=
 =?utf-8?B?TUpNYTk0bUhNa1NIN0l6RU8yTlVnRWMwd2IvS09XL3pCNEVxaHAvZXg2d1hT?=
 =?utf-8?B?MnNRTHdnSlZqbFJueWFWa0htNHovR0E0UzRRTEZGQmxHZ00zdnJ6NnlEUFNF?=
 =?utf-8?B?NmpCZUgrdTFZUGlWdFM1S3JxREhFUWRZVXlSUCtsMjd2MDhWYWx5NnJ5SWYw?=
 =?utf-8?B?N2VOTDIvaWVCeGZoaXNOTFJlMHhDVHJ3V2pPMEN4NHE3clh1bmFBMHh6aEdm?=
 =?utf-8?B?SUdyQWk1WmZ0Kzl1ZmNyZ0dMTnh6b3E5T0krMlNiNFFGWEhYYmdXUjdIZnpF?=
 =?utf-8?B?eWx5dmtZVDErVlluaXlESnI3SDdJOFk5UjRsZk55dTJGVkMzRnh3V3N4Njk2?=
 =?utf-8?B?czVhSzZEQ2Yyc2ZCZElkdysyTk93RmdtSERjL3FkbDZmY29QeCs2R0J5SDg0?=
 =?utf-8?B?WG9kQk4xUmY3aWIvV3ExbFlXKyszWHdUNDh4VXJEMEhCNW5HdEJOaXNTZ2NW?=
 =?utf-8?B?NlA3Y1NUejhEc0hKa25MbGh2ZzNQQ1R6THFsVVc0VnEzYnJZL3AvRnQwanAw?=
 =?utf-8?B?dUZzR0YrNW5qdVlHa2ZRald5d2FqODNUM3RYVDhFcUZTT1doVUhxNFJGckRO?=
 =?utf-8?B?Wmp6bjVQMU1qaDVQR1Z5bFI4bEpsUGFaWmszbTVjcUZlcGh2MFBBKy9DTUZo?=
 =?utf-8?B?bSt6TnpSNUJmM1hJaUQ2U3l0VHNOVjBYcjY0elFIZ0pwaXlNUS9FZFFzNE9l?=
 =?utf-8?B?RW1wbFZYTDZPU0tLQWV1Sm0rLzdBSGt1N1BvQ2RLNWFQekNSUFQxS3ZiOUJJ?=
 =?utf-8?B?ak9razFsRkZ1UDk3aEQvVysrQysxaHBQZERTSytvc3lsTnhhTkoxUHg5NDIx?=
 =?utf-8?B?VEFIUll3N3ZwcUtITlBGR3ZGSTJTdFlQL2hGMko1bWM2SjhRdUhQeTQxR2hD?=
 =?utf-8?B?VFlpbjNUM0hxU3VISnQ5V3pIczJ3R2ltL0pVNm9YaE5oZWM2b2dnWFZrMkMw?=
 =?utf-8?B?ckR1TG1LdkhPQ3lSY3VuNkl1Z2dzSDhYckJ2c2J2RUtEVi8vZ092ZFFoQmRo?=
 =?utf-8?B?V09NYklvazUwQjYyYUowcnJNaUhKK2dBamRIOUhValpLWmUxVXN5bTRSWGhT?=
 =?utf-8?B?Vml2ZkFvaWpzSWxYQkVVbHUxZ3NoYjRQUVB0Sm1mdUVuc0JWempYNUN1ZHRj?=
 =?utf-8?B?U3Nvd2ErQ3hkQTliaG5FYXlRdUFUc2VJUHJwYk1EUkFpaHViRER2cStuWTVY?=
 =?utf-8?B?WlkvMUxBdDNNbGRZN3N1eUsrdDRlK1BzaGF4OGRsZmRwYWZMdnZXZlRNaERv?=
 =?utf-8?B?VzM3NnllbHhBYkpvbkJyVXplTXFMeE0rRExYY2NhTllLQ1hIZGNJVS9TN2pU?=
 =?utf-8?B?UHYyNzAwYzhBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T01YZHlobkhFK0IwVFAwM1VNckhWNE1wRSt2UXRwZGtiWnZRd3E4bWJiTyt3?=
 =?utf-8?B?R2J0VGRHM2tvTHdsZXc3T2dVQlRjV1BBakJFc0NQQmNvMjUyVkNxTXBsd09R?=
 =?utf-8?B?T0NlbTN3ZldldEhKd2NUMEVrTUJUVVJYWDNtVlRPNVVvOTFIMWJhZS9JYnFB?=
 =?utf-8?B?bGxDRTc0eWgzWWp6UzlZNWFqbzFDcG9OU1lFaEN3NG9IcXhIalVpaFVWMTJF?=
 =?utf-8?B?MWs2WVVvNXBJZmtvdTJlQVNkT1dPZVRhWExVTTdJSGhMcmJUV1lhbXg3aGEr?=
 =?utf-8?B?bnNaV2VYYlc4Q0srU0U1TXZDOU94ODBSMGJJSXp3dVdqa2hZd1QwbkNTM3Bu?=
 =?utf-8?B?RS9rbXJsS21zYjNpM1lidHV4RCtUcUVVYjhnVmRtbDBCUjg4NS9LMzQ0RGNL?=
 =?utf-8?B?QVYzMlBBbWJ0RW5VVHVEa2pLWmxNdTFYeXdWVCtISTQrQ0IzUUxleEg2WENp?=
 =?utf-8?B?Uy9hUGNPaG8yYVZ6dTcwS0I4QWRobUFVaUZlN3ZIUGhBS3FNeHg0SWx0ZjJj?=
 =?utf-8?B?NFdHVmtqR2pPOEIzWkhqb2UwaUFPT0JZTzBlNGdGZXA3RXBZNVNwa3FoTjE0?=
 =?utf-8?B?aGxHRE1WMWdYZ1pyRFJMR3pCeDdraXZtT0NZNXJzbDQ1akFhbitIQTJHZk5F?=
 =?utf-8?B?cWd6eVJxQ3dzYmhleVR5VnR0cjZsYytWWVNhNzBzVmJvSzV3Sm5vbEVCOW1F?=
 =?utf-8?B?ZXRBMm55dUMyZ0czTnFzL0pxb0tNdGVBbjBYQXQzcFo1MmdwcFp5UjJhaUZW?=
 =?utf-8?B?Z2RLNUZNRVV3OHRma1R0ZXhTQzF1SkVDSnpUSG1mSlNVVE1DTTNpUUw5S2M5?=
 =?utf-8?B?Sm1pNXhGTW5YVWw4WHlxTFJYeE54QVJUVjBFSitJeXZZY2Vtc0t1dkxnZjhl?=
 =?utf-8?B?Q0lualNtSDRDUzZsMVVLZ21BVUcrSDNkdDZLeklTci9DWmplQU92N0xGRHUw?=
 =?utf-8?B?RDJBUU9ZY0lvdnc0Sk0rei9VRXdBWTdCY2srWUZNZysybFJLRXJUbjBuVVpV?=
 =?utf-8?B?ZU82cEx4Uzh3YmN1MVMvb0xGTlgxRmQ2TkluQUMzTFZoWXNOSUVvTDZqdGVT?=
 =?utf-8?B?WHN0enpnY1dxc1ZkWnBYTExHM2tiQVFzWmxDK0Zaa2wwZ3JMaWQvZzQ4OUN6?=
 =?utf-8?B?bmp4NlNiTFVKSHB0cnV4emlmY3Z5MWtQZUhuTmtqc095ZjI0TDg5bWhPelZ1?=
 =?utf-8?B?V0h4NnpvMEJEQUgrSHpvYzlnQ3BmTHlCQzdKanNlQmVxaUhyUW5KQXFZQXpK?=
 =?utf-8?B?MlZXWmdMbURjR202ZWd6VlhqYkVHc1BaWXp5aGdZYkpNVGg2K2xEN1R2RTVK?=
 =?utf-8?B?WlVEeFU0dXZMSWZmKzhUZ1ZIWnhWUEE2SjFpbk1zeVRjWVRFMDhPZmZOUjhr?=
 =?utf-8?B?WjliQVl1WVZtZUhRSndIWjJXdy9vYTV4NmJRS0phc2xJRWdSRCtxRlAzVnVK?=
 =?utf-8?B?Z2JKY1luY25CL2tXZTBoWXFObEpNWmxxTlViTHlzOTg4dW10cFV6RkFjSTdv?=
 =?utf-8?B?RkFieUxUMHRZTTgzZkZhRGp5S25LS29lT2tKYWk3WlNpSHdxdGhmRnBWWndT?=
 =?utf-8?B?TFlhaTVhZkQyM3ZkRU0ySFZhNTdBYk1IdEdSU3pzc0JxYTJBMVVhUEo4WmVZ?=
 =?utf-8?B?czNZY2ZsNUFVaURJTCtmZG1EZkpwOHUxN2krdGdiWnBoK2ljQlNpT0ZyZFRL?=
 =?utf-8?B?Z3JVTEdvTmErMUtjRzlJNjJzZHpJUFhVeWhxc1ZnbldGbXhLZk1xclB2T0hQ?=
 =?utf-8?B?dFRIYXp5anlwSFVKMjc1YVZFNnA4MmpucGhsdUxxaUZqMEZObS9LVHV3QVM0?=
 =?utf-8?B?OW9Oak5ORHBrU3FYWkErb3NhNnFjNWdqOVFDb1JERnV1RWhLYmwwUUFUR0Rt?=
 =?utf-8?B?b2M1QU94Z1pYZU41YmhzMmlUOFVnZ0tsRDc1dVV0TnE4M2R1aC9JUkxkTC8x?=
 =?utf-8?B?QUhaaGxKOXVOVkJJelRHOWlaZ3lKV0ViRkh1RVZJSGlCTHJ4Y2l1ZkpuRSti?=
 =?utf-8?B?QUpRRnFSRmQyRSthbkVDNTlJaDdDeDhHRG5xeDJZeTFnbm92TTIvR1VTMjRS?=
 =?utf-8?B?czJ1di9mQUM4UmQvOEZWREpGbU9qRFl4akk5K3JFRFozYnRyM1ZsM1BqbG5z?=
 =?utf-8?Q?+Zzfv50yI5h4CLAF4eevLdZcg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <55E372AC3FCF8D4A88C985543E2EA30B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TglOBcUwo1EVHwpuCw2Q5fQwCpMiupgvGuK1PB2wqiXKM7U1ln6ecxlEshIgfRM/h6sxLUbWtPBHFY2JiTEW3U9fBCIZ7SjdIwRpkvHIlum2Q+aA5SS9Gb30bwLd4WnuZPSQJYPBWwufT4d04c3fTEvnIRQaBzYkvfGlM5Aj18rSdDBiyGmDuj870LdQhIDBgWXbmokXE4G70ehozdWq+atPGBzUp6byt6prU278p/Yr2r0pRHPsDMBbwWdPfUKQekcKccnkMeW+7otFrx1cCRBzesDjv8eWed4AcP7IzA/d6O9aSKLIOLwUJn3sJNjsXM1oDx3g2I9AXjJgHkLWrbCsaXj7GZkICVwassP6I7aVvk6Y+TAowH0hismPu41F4/4Ynx5L4xNcLuqjU7kRj0Pg9MKWjqrkzVhtOmqMq/fSCVJH1jpzfuvGhvdVUoMQw1hOEnzwGT39cgptXtL+W801wa83ft+PJ/91d77tj542U344xqPf9QDooOz7mntlVs2S76KyHb1aqU3VOrBctrDqy4Wjc4X0JOQyfRMh2iefeDf4umtsQzkJQP5A0sQR2dsCpBJdOFu2lCCde3oDul2jq0PnA6SYUHt1lfVWmU4WKqTdV9z6J46tBuIRKh5q1q0Q3tA/yCkTpIu0r0Bi9w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 435949b9-6b81-47a4-1271-08ddb7a0f08e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 06:40:01.4441
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yBbv/m2m7lGbAjHVEDJ2ww/sjsGxVl/f82Rxf97GCpcbYAgYOXFcrtKgY+yiOQTL8vQI0+j5SGRziinCandR4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6128
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA1NCBTYWx0ZWRfX7cSrV9MqsL8R
 RmQxccSKsTz46vgJAGN59iwAnDSi+zZmSJ5/3yxk/aIyhrn71nTrHLI87Gov+RqG/bVw7dcOMcu
 0dLCS6s172JCHV1baEOBVCXh2Ndcrup6+NBltBCcTR2sdBxbVd5iarb9gACyO7OnkBq3uVJk+UP
 hhsrWy595vE4uBp6seM6z5EKJBpj9MHJ49vjak406dGGb7ddVVMqipTEEVgZzfJ76MvDKsGwC+Y
 86J/oLnyyGdqDp+/XbRqwNTmEk5jhrybcN/fV6Kys5e70OV+X7uyoQFtgRcv2ff5odMFD9Gf/ys
 G7xF2KZ3/lDX3XrqEY+XDdKGqnZrCptaRuJPkzp3Hjwwi7RmpKKtlDM841C4rV5C81VHqU+DhiM
 pgxcLNPg6dxQR1XsdMeua0T6qHU+c62DphF8qdgAXo2AyDTy14rANJgP013WGjnq85ytpV2F
X-Authority-Analysis: v=2.4 cv=Er3SrTcA c=1 sm=1 tr=0 ts=6862314a cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=jIQo8A4GAAAA:8
 a=SDlr6Xcdu9MZ9iYQTi4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: O5OIyJdKlqK6DP_ptnFkFV4rpiV2rKKC
X-Proofpoint-GUID: O5OIyJdKlqK6DP_ptnFkFV4rpiV2rKKC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 mlxscore=0 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 clxscore=1011
 mlxlogscore=999 adultscore=0 malwarescore=0 suspectscore=0 classifier=spam
 authscore=0 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300054

DQoNCk9uIDYvMjkvMjUgMTM6NDYsIEppc2hlbmcgWmhhbmcgd3JvdGU6DQo+IE9uIHNvbWUgU29D
IHBsYXRmb3JtcywgaW4gc2h1dGRvd24gc3RhZ2UsIG1vc3QgY29tcG9uZW50cycgcG93ZXIgaXMg
Y3V0DQo+IG9mZiwgYnV0IHRoZXJlJ3Mgc3RpbGwgcG93ZXIgc3VwcGx5IHRvIHRoZSBzbyBjYWxs
ZWQgYWx3YXlzLW9uDQo+IGRvbWFpbiwgc28gaWYgdGhlIGR3YzIncyByZWd1bGF0b3IgaXMgZnJv
bSB0aGUgYWx3YXlzLW9uIGRvbWFpbiwgd2UNCj4gbmVlZCB0byBleHBsaWNpdGx5IGRpc2FibGUg
aXQgdG8gc2F2ZSBwb3dlci4NCj4gDQo+IERpc2FibGUgcGxhdGZvcm0gbG93bGV2ZWwgaHcgcmVz
b3VyY2VzIHN1Y2ggYXMgcGh5LCBjbG9jayBhbmQNCj4gcmVndWxhdG9ycyBldGMuIGluIGRldmlj
ZSBzaHV0ZG93biBob29rIHRvIHJlZHVjZSBub24tbmVjZXNzYXJ5IHBvd2VyDQo+IGNvbnN1bXB0
aW9uIHdoZW4gdGhlIHBsYXRmb3JtIGVudGVycyBzaHV0ZG93biBzdGFnZS4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4NCg0KQWNrZWQtYnk6
IE1pbmFzIEhhcnV0eXVueWFuIDxobWluYXNAc3lub3BzeXMuY29tPg0KDQo+IC0tLQ0KPiAgIGRy
aXZlcnMvdXNiL2R3YzIvcGxhdGZvcm0uYyB8IDMgKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzIvcGxhdGZv
cm0uYyBiL2RyaXZlcnMvdXNiL2R3YzIvcGxhdGZvcm0uYw0KPiBpbmRleCAxMmI0ZGMwN2QwOGEu
LjNmODNlY2M5ZmMyMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMi9wbGF0Zm9ybS5j
DQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzIvcGxhdGZvcm0uYw0KPiBAQCAtMzcxLDYgKzM3MSw5
IEBAIHN0YXRpYyB2b2lkIGR3YzJfZHJpdmVyX3NodXRkb3duKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKmRldikNCj4gICANCj4gICAJZHdjMl9kaXNhYmxlX2dsb2JhbF9pbnRlcnJ1cHRzKGhzb3Rn
KTsNCj4gICAJc3luY2hyb25pemVfaXJxKGhzb3RnLT5pcnEpOw0KPiArDQo+ICsJaWYgKGhzb3Rn
LT5sbF9od19lbmFibGVkKQ0KPiArCQlkd2MyX2xvd2xldmVsX2h3X2Rpc2FibGUoaHNvdGcpOw0K
PiAgIH0NCj4gICANCj4gICAvKio=
