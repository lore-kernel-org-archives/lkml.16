Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C20D433D9;
	Mon,  3 Feb 2025 23:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738626872; cv=fail; b=fuSgEsxL95PS9CXp6q9VwH4L2YbYj9HU/IJi71x0rZC4aBbTt2UB74tQbIVqE3CuQZVuuuMg8LXNbW/vI0kFyHRbP54p3WLR0jTCXGhwyg2kE9qSEHqkBLTLPs36wjtirLB/eW0VoNCiRRRGqDy4qGXoFTFcYvMnTUD0F8e+3B4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738626872; c=relaxed/simple;
	bh=yMaVinHziZbd60db6MVgVU2KTzguAa/dtl++/2Bi0Ww=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fOSqykD0IFegbGvcyguxxvRIF4u3wKHDGnVN2JS0/bZMhUnQg8vwxw1aeDsDg76SXOoz5gL/fQdif6+HrtslYqBaiTkyjS1ivNZPxWYr8FGFmfJ52iNhfPscHy2TCQ5kr6/Yzu7J2oRDOEefs3GCefy/cblrsXaprB1puoVVRak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Rwa5ZQmc; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=CxtIraBl; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=pTt2Idf1 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Rwa5ZQmc";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CxtIraBl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="pTt2Idf1"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513N5VU1020218;
	Mon, 3 Feb 2025 15:54:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=yMaVinHziZbd60db6MVgVU2KTzguAa/dtl++/2Bi0Ww=; b=
	Rwa5ZQmclEwU+iPyW1G2uUJP/F7mYk1JtTwnRrGFYoe0FutSFIH0Qr5vQnKAvDPZ
	P17SeB8BmsVLWflaOqmxyi4aOV4xHG27BwMHyV93XQyRC2cKky4F/wp1g2ybUUMW
	SGwYaWqlb/+nqkfSZBXWkvu+xD9zSqP8sUAJs+bZNE2x/eyGDc8ovi/TPdBZAt2a
	F5+Rmv0cWFBbWExIWVs+TE+Mwvj6k8zYSww7XzXcuTrkWw8u7wjlPNM0O0AQYMeA
	JFBHvx33IVJG/Qk/yCCWcGXs9tWWI91cZbslpbIMtDhKm0/FL6mWtf7S8cC4ROlM
	G07HFa9fAV+0Uurdolc3nA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 44k2qps8pt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 15:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1738626859; bh=yMaVinHziZbd60db6MVgVU2KTzguAa/dtl++/2Bi0Ww=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=CxtIraBlK6gaz+IgHCsyHrGfsN2cU1tDdIUsmB5Zntk0lU1R49Bpct/+/uOEECuxi
	 TBIQxprt1skpDUpaI9NCoGTLLeYmnjWf2sS7MmPyFylofRKLWs2u27Fl9sidHXaXhS
	 FCcnLzA4/dmD1C3qVYOoyYWk+w9XzNXO+AKYlOCCSAD/2DvuwsAwmB16e7H1Dl4/L2
	 xiTIkgcIW168NWQtY2TIEMNIT+rq4eCcxbWyjd1dIiJn5YcA9tDBBNz7mL7aBqwmAH
	 B09YG66R8D/LuVQSB4rEfxsjUAhU8uS59AJKvdFrc8JCke+TVPF8jibDkcFK1lY56E
	 9VUCsjHbVtLOA==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9C1BC4034A;
	Mon,  3 Feb 2025 23:54:18 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 350FDA0077;
	Mon,  3 Feb 2025 23:54:18 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=pTt2Idf1;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9A1C74052E;
	Mon,  3 Feb 2025 23:54:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cK4T3gjDGUPm7fmfYyOEbklkggaa+3kP0dDpwSzHa2JKsFbkjWqHGciy1Tf77I9oFbUa1ET6nGBJfQFik5rrVLhkbUydcODtqmTB2zM3O1EN7OPwWSvnPFAPEuzcI4Ov2WouG7nxVbLHsO9nKh5pj4is1Yw0JSuFLLjMNwMfKPC/2K3VBPI9ISD+5mP0z/yZTO+o4+nE1M7Hu5dR6WiSGS0i6nX9B39IE9/yXugKHZTkitFWeyRcvjKd2xq5kXnWmInsqR0osfc6vvCYBDm2SAUZ0Wjk2sUhaxGc0saYDSssk3aB/VCT5OhldMv9Eo5DEmYldErHX5wL3AQ3K1vFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMaVinHziZbd60db6MVgVU2KTzguAa/dtl++/2Bi0Ww=;
 b=GXc5Xj6PU/k2wq0BvUirQFIGGX6rslgAFgBDag7LKC7ASovxnGTQ9Nw6wEgUxVaCNNhMrfPST1pWcFyX8Xwy5PE0nvQdMS5wA6ew/DYEopA9T6Xa2Ii8b9rRKrhSK+qp8lMW7BenZU5GizD2hKR1piApK8auERXvM2FQa/kovxmfAYQb0snGVRn35xZ1jDGNyxeFgxrK+V8zhTBibMV4wKn95w2aqMkgxpQeFaM9ojDod31JKoKhLt9wVw152A8SI97vs65NVWNLATabNyoRwJq5UDSFYgnncECPS26Dz66q8VM16DMmOPP86+4aGtuqIUSI+6WKUXg59mIThVr9Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMaVinHziZbd60db6MVgVU2KTzguAa/dtl++/2Bi0Ww=;
 b=pTt2Idf1c8on5yuKNXrnct/afcKKMGZLYKkV3+R1KPEOsgkiCpxSNE0iKLeHkZpBXXpxwrnM2KDupyY6LBB6FRy2xJS5E5HDcfBA/PX8jFHl3mK50Ee7J4AtExNnBMTcODdkp5YDQ0fNkJ1t1MUzgPhfdFFdN248y5xn3fpIGw0=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH3PR12MB9169.namprd12.prod.outlook.com (2603:10b6:610:1a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 23:54:14 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 23:54:14 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Roy Luo <royluo@google.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "andre.draszik@linaro.org" <andre.draszik@linaro.org>
Subject: Re: [PATCH v1] usb: dwc3: gadget: fix gadget workqueue use-after-free
Thread-Topic: [PATCH v1] usb: dwc3: gadget: fix gadget workqueue
 use-after-free
Thread-Index: AQHbbHehrFLU9nYZxEKMjqWESLja9bMrc0UAgAXvSQCAADiLgIABH0gAgAOajQA=
Date: Mon, 3 Feb 2025 23:54:14 +0000
Message-ID: <20250203235416.nkhxutxywzu646kg@synopsys.com>
References: <20250122024452.50289-1-royluo@google.com>
 <20250128014400.7jx4segwn53vjnb5@synopsys.com>
 <CA+zupgwLfzDvVF+5psdbuUgZb_mCNqXtxS5=b1RtTAjQKq6AuA@mail.gmail.com>
 <20250131234407.fyv4iu5yadp5xeg2@synopsys.com>
 <db8819b7-05d5-468d-8974-3dfae25bbb2b@rowland.harvard.edu>
In-Reply-To: <db8819b7-05d5-468d-8974-3dfae25bbb2b@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH3PR12MB9169:EE_
x-ms-office365-filtering-correlation-id: 0ccc0938-5f7a-4d5c-b994-08dd44ae1049
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aDMxQ3p5OVFUdTZhVHMwYkV0YTBqdmkwcnJ2Sjc4cUR1VjRqL1B5OHlqZHJC?=
 =?utf-8?B?ZDlkT2ZrLzVCYTNNd3IyZVU0SGh4N1lxODdpVVk5YkwyREd1bVNNSnU5aG15?=
 =?utf-8?B?Q2dvai9wMVcyM0RCWDVIdFI1ejdFZklBWjJRS1VnNlduYW4rZS91Szk4bHRW?=
 =?utf-8?B?bmRTMFJvazFjYUJCeStUejFyVmJZUkFrQ3BBNE5zNzVCVjlwWTM2R3pJNkk3?=
 =?utf-8?B?eUF4MVo5aWFDb3BPVE1Pc2RpSGVQK1ZJeXVYNWJRZHFLbGhoSDhhWkg2Ums0?=
 =?utf-8?B?enN2YUdpQndRTlNsZ3dZTERIOHNFaDRBOERtSmJRSUJNZ09lMTZyYWxMV1VK?=
 =?utf-8?B?Z2tFOVJpb1pkazhycjdtUXMzZDRlZSt6eEkweUNiL2d0NmxHRDAyVzhETmpG?=
 =?utf-8?B?ekpzUVRtMkFNRDdaRmw3dzRhYmtELzRnVGNvcHd2NFBycVVNbVA5Y0ZIbWF3?=
 =?utf-8?B?S2kwdzU0OXdWeXpEbWQ3TTF3djdZcG9ET1JMMGMzbkFhVythOWdHU0JHMnN6?=
 =?utf-8?B?N2hsMUJCRmFFbHdJV2prbHJZcm1WUHdnREZsSGFHUVF2SnVIVDlUS2wvQ3A3?=
 =?utf-8?B?SVB2NllKcGdqU0gxUGpLcGJwTzROdUh4SlliVGpueWNJZVZlUFd4V2x5R2hH?=
 =?utf-8?B?RXVWQ2FIT3ZlYzd5Uy9VTnY4WGZVdTExcFBKU0xhSW5PcHJDRU5Eckx5ZGFN?=
 =?utf-8?B?Vy93YjY5OHVLdTVJYnZFS2dsNDAwMGRKZWR2YzZ4UGc2RTRuVm5oYUVWTFJ1?=
 =?utf-8?B?NTRHMGZwSU9zTFRZN1EwNTBqbXhlTTNzNmppSWI0UXBjOVV1UjVKdkQxSmho?=
 =?utf-8?B?aDg1a0t5eWIzV3p6L09BRFRFYU1NSnhRbmUyUmxwZTBwdE82cDlhTVhZVnNN?=
 =?utf-8?B?aW1FOThrNDJ0bm8wb0NydnluZ3NXOEhIa00vUThYSVcyUWF0ektJelIxM2w0?=
 =?utf-8?B?VHcrQ2tjckxhaDJrNjhGVVRVUzNBVGduRjUvdE90NzBWS0NCeWdxWnRYQlNC?=
 =?utf-8?B?SjlKY3Y2dS8zN0pSeGJoMnlRT3lYMW5WRmVIYXczNkxFLzZZd2d1Tks5d1VZ?=
 =?utf-8?B?dWx6dE9OR1g0OERJM01KY0Vqdkx1azMyUkxOa0lneG0yb1dqazYxZlZOVVVC?=
 =?utf-8?B?NVUwbHQ1RjY2SEY0R2pBY1JHMVhRY3J5RHNqQUY1d04vTXdCWGdEYWtkeHRp?=
 =?utf-8?B?ZmlZMXkyRUhrVGx1aDRDdFJzYkxoc21UUjVaQy9NcEZxb1Q3bkhUMVpZMFZ6?=
 =?utf-8?B?Ymkram1PalNhQVREbnVWRlFrd0JtOTRvNU9hWFBmTFhNUnhjZzF6UEcxY09a?=
 =?utf-8?B?TU9QY3pQUUQ3TE1XUTJRRFladUcwbmtXbkM3bWNWOTVBSlBONFllbWpyYVdH?=
 =?utf-8?B?by8rQ3dHK1ZHc3NlL0Y5aXR5N2IvY25SU2RFZkxsK1VPeE9PSDUzQjc2Y3BB?=
 =?utf-8?B?UGl5cXd6V1pvRStDZFA4aE9KTU9mRmN0RmxYWkZweGUzczlNMnlvMDVSSU5M?=
 =?utf-8?B?OEFPUkpXTXRrZkZyeGkvRStXbllMTnppZ2xVVE5wamhwOTdwVURIZ0hrS1RG?=
 =?utf-8?B?N2h6ZE9VdTU2U3dNUXdicVgzNmgvQ0pSVERFQ0NWRnNLcXgxUzBTZUpoZEVr?=
 =?utf-8?B?M3lEdjdZY2loVlJyNVBLYVNJTEhlZ1ZzV2VoUmRDcjJ3aVlFV3B2SHEzZ0Rz?=
 =?utf-8?B?NndFK0wzdkFQWCtQZ2VSeXR3NzhzOWE0a2pJcWpKNGhiS2lQVHRjK2lHTENw?=
 =?utf-8?B?SzFDWTJJellYcXBVOTVyR1dMQUx2dUZKaVhRbjVpMjNVRW1GOEFrMW1LRVFY?=
 =?utf-8?B?NHZOZWo2VXNyanRuZzhYRVg3OXFBa3Bnd016QWg3M09xODRUQ2hCWXgrb1hO?=
 =?utf-8?B?enV4OVVaOHllM2RaWmxUODc0TEI3RjhxTXRxK3BLVFQ1dGU2UnNHQTVtdkw5?=
 =?utf-8?Q?iIjgloVHXgFhoiE/gJWDpUyxaOtt8tJp?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SWU0RE1jeE1YNFFkQXpMSXJUNTNVV21EOHNrUFZMdDVCTVo4U2JSNVpVN2hH?=
 =?utf-8?B?Z0NkS3QvYU4ybkhwQkhWSmpEa0xRc05YY2laVG9WYUkzVHNFUnBlNEV4Uk9h?=
 =?utf-8?B?TGtGazYxZDJXVXNPUGlzb1ZMNUI2U0xMcEpaVDk2SG1XQzFGc2prcUdqeUt1?=
 =?utf-8?B?bVg1S1h5eWpodW53MS9CSnZpWVdTNjUxbFR2d1ZobUZEOUFmQmxTTmRlajlO?=
 =?utf-8?B?eTBZZVhJc3JDaXJEYTg0Mkh3UW9rRFFlcHhHa09zZnpTM2dRYlVUcnJIdEtu?=
 =?utf-8?B?dFVsd0FNZDcvUE15NVpESUV2RkhHYnZvRDRTczFYTGZhckJtdEtTQXRPS0Ux?=
 =?utf-8?B?d0hUZStxUlFrWERBYzB2YXRQS3lOd2lVTlUwOXhMM09keis5T2pkbUtONVBC?=
 =?utf-8?B?SEVJbGhZclJtczhyaUNpRjJQNmdsR3ExSkxLMHlwak1DUXIvL1kvSTY3Y2Vz?=
 =?utf-8?B?Zmp6TFh4RFI2L3pXQ3dhRTR5V0w2bU9mdW10RnZ2dWxFQXhob2NGME9ORkpC?=
 =?utf-8?B?VUp6M2NwWHNFSjFadnBGdzBuaWY0UGQyalg0eXlSZUUvL2dzRC8yTWJDZW9E?=
 =?utf-8?B?QzROMFFZYzdrUk5KMWhsZ3lhcGYyaWVINXpudW1VU2xEdGw3UGJ4TlRGL3U2?=
 =?utf-8?B?VUQ2OEN0cFRWSjhib3Q1NHdieTdvV3loSXFDUHVUc0FlQkZkWCtYUndEVElm?=
 =?utf-8?B?Z2d6c0hpSzFnNm00Zkx6bFpyNDdzS241OTdMVHV2WUtQU1pBSG1TTEpGWTZn?=
 =?utf-8?B?czROd2lXOStmWFUwRXFpd3lNc0cvWmQxUTdCWWFDbGUrVEplU25RWUwwYUQ5?=
 =?utf-8?B?OGtvQnVPT1lEbXF3blJsWlpZVENxanVDK3VoZHVEMmMzdHJpZzhVeHc2Q3cx?=
 =?utf-8?B?Q1pjOWtRUUl1MFo5Q0tsVHZRdlQrWGVGc1FpK3VVZGZpcmJ6NjR6Wk5Zditr?=
 =?utf-8?B?U1lEdjFhTWc1S3ZzSWdVQmRJeGhpemh0azhRMy9MWmpxaU9LQTRkbVpUcm5O?=
 =?utf-8?B?YzdEL1Y2WFJsRytscko1dWpoWDlXcFQvZXBqV1I1bzE4cXA5bWovODVzbFJO?=
 =?utf-8?B?ZFNKOENjSFYwciszdW9wZmNJTTQxa0VyR2xONFl0NUs4TXBJSXR6UjRPTFc5?=
 =?utf-8?B?ZklmS0FVRVdjMzdDVEkyRHNsRXBOemdTQTVub3hPalRrZGx2TlNNRTBKa3Jm?=
 =?utf-8?B?bWR0aFR2bCticm1hSVg4anNCcGlYdzZUQmJOeWg2THdjYU1ta3VUL081ZTln?=
 =?utf-8?B?UzRXbUFTclRsRHpHVEpXbEluQ2dWZkljVWRhRTJHcXFWenV0SnIyNlJ0RnRE?=
 =?utf-8?B?VmlYYytwUWtUbGZsanN1cXdJWFhTS3FWcFJNenRma1lKUXJwdllUSExNa1F3?=
 =?utf-8?B?ZTZmUVM2dThQcVJ5ZHJES0ZZVXYzdytKY001Q1pkUVJCSkJTblBoalJLUEdU?=
 =?utf-8?B?eld6V2pLOGxmbkJPTDQ2R2FiN2lycVl4amx2cjRzRXlXazdnS005cXpQSVpm?=
 =?utf-8?B?aVMyT2Y2SFdYNlhHdHdYS2F6NU8xZGlrQjdaTnRONEExRkloVHlYWjRWZ3hV?=
 =?utf-8?B?MnhOV3hXWmlkT3VXOUYrNTduQ2w5bG1YNlM3Q0VwTEs5RWtyR2NRS2hsejlF?=
 =?utf-8?B?TVFOUWs1V1VubU5LMURWOVlHWEJVakoxV1V5UUgzTURYaGUvSVRYNVlwNlR5?=
 =?utf-8?B?d0xYTjBaVDZMU3RrdE5EcEdlL1Zoc0hEb0tDQW9uc2lGekJJbUZhUUZleGN0?=
 =?utf-8?B?c0FyYWpOYWhVVVpBeWsra0R3OUw3MTNNa3dsS1oyVXFvN3kvNFFUb0lDcDNp?=
 =?utf-8?B?em9HZUxCVFE2djBCNyt6YnZWMmRjb2ZSbnVQOWI0WVU0WHl5VmpZM29JbEpr?=
 =?utf-8?B?R2dyWTN4clBHZGpLTjd0RmtKNHZYcndvZGxXeUNYbm95aUpCaHhyUmFYUmVs?=
 =?utf-8?B?c3c1QWtiZnlXUTloT0tnek1KYVphUG5yTk1qQjlHL1hJMnY2dG83Qk5hbjJN?=
 =?utf-8?B?T2NJMHVKK3VJY3VqNTd3KzAwS0haUjVrR29KYVhLeGhGdGdtMTJRTjJBVUF5?=
 =?utf-8?B?ZjZZYzZxWllpbXpkRWZ3eXB0Mmx2SVNzUXZBZElZMmNjRkh5RzR5TGExblpB?=
 =?utf-8?Q?aF2AfaMK8EEAD0kbCCG4G3+ho?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31055D590B87E4499F374F98A2A9975B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	y0uirvYrrWQjsnYttiK8h0AOma/7zn7pnH3K/sfFwZIpvUoEnbL1a5bxkyad/sdORVo3nM34BhZsAuHw2ZFeBiry7K1xd+GdwbunTzncv4M8cPChBYYBjZVWPJUjQNu3T5FqB7UGIS9Q7VdLzCuemF28/5K1CvutjBNzJO9fFjO99XopId25qGYpyBmAxu8B8upcOXR4REYG4+/XOCTB7Nn5WnJ9I4YTYdp6iQWjxpn/yTxdy1mPAz6VhgPlIymELSn/F3on1FeLLy27SYGlcLQD94VKWlyOSTJak8teKcwwU/nDBY7tR44K5ch2/iG8TBkYctrwNUNDfgXFv4hyJrN7+OAPeZiH49yhc36J0Q+5bsqmvlnlHEcat08CGknZZBHO7HglVC2r9fmFjfociFtXEqx5LQNVmOusBj1QDi/NSxnJSMaADpgVvdKzmfIDAayIhaawLaV/k+aIQkzLRG+U8M/+B/1grZ2L2RpNkg5RVK+ggZ1fT5nh/PdtbHrP6ySHj0/uNZdGDryYo+ilV851iDd1ceVwhs/UA7o41rJPFPTM3DXphKULom05QUl4Du0HOdh/jHW5YTR5ySCD35/f/U0BUGW56nswbITZloKjVJluTsTMOGsqhcxTIrjIcIh8ABiJ2LXni+JNxBTNUQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ccc0938-5f7a-4d5c-b994-08dd44ae1049
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 23:54:14.4345
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vU+e7Fj09BwMe0h2Hrl39b0EaG9oGGOVJOS5qnwYka/czBnhz5J5ZFMMiVBAFYMk3OwrwSrtwDNs2ekTYFGudw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9169
X-Authority-Analysis: v=2.4 cv=LP2cQIW9 c=1 sm=1 tr=0 ts=67a1572c cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=T2h4t0Lz3GQA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=7Uc--OmgfkIaqXzkg-QA:9 a=QEXdDO2ut3YA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: FjP15-AJMmrsRzPS1Vo93d9oO0n_L7MD
X-Proofpoint-GUID: FjP15-AJMmrsRzPS1Vo93d9oO0n_L7MD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_10,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 mlxscore=0 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030175

T24gU2F0LCBGZWIgMDEsIDIwMjUsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+IE9uIEZyaSwgSmFuIDMx
LCAyMDI1IGF0IDExOjQ0OjE3UE0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBDYyBB
bGFuDQo+ID4gDQo+ID4gT24gRnJpLCBKYW4gMzEsIDIwMjUsIFJveSBMdW8gd3JvdGU6DQo+ID4g
PiBPbiBNb24sIEphbiAyNywgMjAyNSBhdCA1OjQ04oCvUE0gVGhpbmggTmd1eWVuIDxUaGluaC5O
Z3V5ZW5Ac3lub3BzeXMuY29tPiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gT24gV2VkLCBKYW4g
MjIsIDIwMjUsIFJveSBMdW8gd3JvdGU6DQo+ID4gPiA+ID4gYGR3YzNfZ2FkZ2V0X3NvZnRfZGlz
Y29ubmVjdGAgZnVuY3Rpb24sIGNhbGxlZCBhcyBwYXJ0IG9mDQo+ID4gPiA+DQo+ID4gPiA+IFRo
ZSBkd2MzX2dhZGdldF9zb2Z0X2Rpc2Nvbm5lY3QoKSBpc24ndCBkaXJlY3RseSBwYXJ0IG9mDQo+
ID4gPiA+IGRldmljZV9kZWwoJmdhZGdldC0+ZGV2KS4gSXQgc2hvdWxkIGJlIHBhcnQgb2YgZGlz
Y29ubmVjdC4NCj4gPiA+ID4NCj4gPiA+ID4gQ2FuIHlvdSBwcm92aWRlIHRoZSBmdWxsIHNlcXVl
bmNlIG9mIGV2ZW50cyBzbyBJIGNhbiBoYXZlIG1vcmUgY29udGV4dD8NCj4gPiA+ID4gVGhlIGhh
bmRsaW5nIG9mIHRoZSBmbHVzaGluZyBvZiBnYWRnZXQtPndvcmsgc2hvdWxkIG5vdCBiZSBwYXJ0
IG9mIHRoZQ0KPiA+ID4gPiBkd2MzLg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IFllcywgaXQncyBh
IHBhcnQgb2YgZGlzY29ubmVjdCwgYW5kIGRpc2Nvbm5lY3QgaXMgYSBwYXJ0IG9mIGdhZGdldCB1
bmJpbmQuDQo+ID4gPiBMZXQgbWUgdHJ5IG15IGJlc3QgdG8gZXhwbGFpbi4gSGVyZSdzIHRoZSBj
YWxsIHN0YWNrIGZvciB1c2JfZGVsX2dhZGdldDoNCj4gPiA+IC0+IHVzYl9kZWxfZ2FkZ2V0DQo+
ID4gPiAgICAgLT4gZmx1c2hfd29yaygmZ2FkZ2V0LT53b3JrKQ0KPiA+ID4gICAgIC0+IGRldmlj
ZV9kZWwNCj4gPiA+ICAgICAgICAgLT4gYnVzX3JlbW92ZV9kZXZpY2UNCj4gPiA+ICAgICAgICAg
LT4gZGV2aWNlX3JlbGVhc2VfZHJpdmVyDQo+ID4gPiAgICAgICAgIC0+IGdhZGdldF91bmJpbmRf
ZHJpdmVyDQo+ID4gPiAgICAgICAgIC0+IHVzYl9nYWRnZXRfZGlzY29ubmVjdF9sb2NrZWQNCj4g
PiA+ICAgICAgICAgLT4gZHdjM19nYWRnZXRfcHVsbHVwDQo+ID4gPiAgICAgICAgIC0+IGR3YzNf
Z2FkZ2V0X3NvZnRfZGlzY29ubmVjdA0KPiA+ID4gICAgICAgICAtPiB1c2JfZ2FkZ2V0X3NldF9z
dGF0ZQ0KPiA+ID4gICAgICAgICAtPiBzY2hlZHVsZV93b3JrKCZnYWRnZXQtPndvcmspDQo+ID4g
PiANCj4gPiA+IFRoZW4gd2hlbiB1c2JfcHV0X2dhZGdldCBpcyBjYWxsZWQsIGdhZGdldCBjb3Vs
ZCBiZSBmcmVlZCBiZWZvcmUNCj4gPiA+IGdhZGdldC0+d29yayBpcyBleGVjdXRlZC4NCj4gPiA+
IC0+IHVzYl9wdXRfZ2FkZ2V0DQo+ID4gPiAtPiBwdXRfZGV2aWNlDQo+ID4gPiAtPiBrb2JqZWN0
X3B1dA0KPiA+ID4gLT4gZGV2aWNlX3JlbGVhc2UNCj4gPiA+IC0+IGR3Y19nYWRnZXRfcmVsZWFz
ZQ0KPiA+ID4gLT4ga2ZyZWUoZ2FkZ2V0KQ0KPiA+ID4gDQo+ID4gDQo+ID4gVGhhbmtzIGZvciB0
aGUgZGV0YWlscyENCj4gPiANCj4gPiBUaGUgVURDIGNvcmUgaXMgaW5pdGlhdGluZyBhbmQgaGFu
ZGxpbmcgdGhlIGdhZGdldC0+d29yaywgc28gdGhlDQo+ID4gZmx1c2hpbmcgb2YgdGhlIGdhZGdl
dC0+d29yayBzaG91bGQgYWxzbyBiZSBoYW5kbGVkIHRoZXJlLg0KPiA+IA0KPiA+IFNpbmNlIHRo
ZSB1c2JfZ2FkZ2V0X2Rpc2Nvbm5lY3RfbG9ja2VkKCkgbWF5IHRyaWdnZXIgYSBzdGF0ZSBjaGFu
Z2Ugd29yaw0KPiA+IG9uIHVuYmluZCwgdGhlIGZsdXNoaW5nIG9mIHRoZSBnYWRnZXQtPndvcmsg
c2hvdWxkIHRvIGJlIG1vdmVkIHRvDQo+ID4gZ2FkZ2V0X3VuYmluZF9kcml2ZXIoKSBpbnN0ZWFk
Og0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2NvcmUuYyBi
L2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvY29yZS5jDQo+ID4gaW5kZXggZjhjMWVmNDY1ZTQ1Li45
ZTRhYmQ2ZTQwZjggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9jb3Jl
LmMNCj4gPiArKysgYi9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2NvcmUuYw0KPiA+IEBAIC0xNTY4
LDcgKzE1NjgsNiBAQCB2b2lkIHVzYl9kZWxfZ2FkZ2V0KHN0cnVjdCB1c2JfZ2FkZ2V0ICpnYWRn
ZXQpDQo+ID4gIA0KPiA+ICAgICAgICAga29iamVjdF91ZXZlbnQoJnVkYy0+ZGV2LmtvYmosIEtP
QkpfUkVNT1ZFKTsNCj4gPiAgICAgICAgIHN5c2ZzX3JlbW92ZV9saW5rKCZ1ZGMtPmRldi5rb2Jq
LCAiZ2FkZ2V0Iik7DQo+ID4gLSAgICAgICBmbHVzaF93b3JrKCZnYWRnZXQtPndvcmspOw0KPiA+
ICAgICAgICAgZGV2aWNlX2RlbCgmZ2FkZ2V0LT5kZXYpOw0KPiA+ICAgICAgICAgaWRhX2ZyZWUo
JmdhZGdldF9pZF9udW1iZXJzLCBnYWRnZXQtPmlkX251bWJlcik7DQo+ID4gICAgICAgICBjYW5j
ZWxfd29ya19zeW5jKCZ1ZGMtPnZidXNfd29yayk7DQo+ID4gQEAgLTE2OTQsNiArMTY5Myw4IEBA
IHN0YXRpYyB2b2lkIGdhZGdldF91bmJpbmRfZHJpdmVyKHN0cnVjdCBkZXZpY2UgKmRldikNCj4g
PiAgICAgICAgICAgICAgICAgc3luY2hyb25pemVfaXJxKGdhZGdldC0+aXJxKTsNCj4gPiAgICAg
ICAgIG11dGV4X3VubG9jaygmdWRjLT5jb25uZWN0X2xvY2spOw0KPiA+ICANCj4gPiArICAgICAg
IGZsdXNoX3dvcmsoJmdhZGdldC0+d29yayk7DQo+ID4gKw0KPiA+ICAgICAgICAgdWRjLT5kcml2
ZXItPnVuYmluZChnYWRnZXQpOw0KPiA+ICANCj4gPiAgICAgICAgIG11dGV4X2xvY2soJnVkYy0+
Y29ubmVjdF9sb2NrKTsNCj4gDQo+IFdoYXQgYWJvdXQgaW5zdGVhZCBtb3ZpbmcgdGhlIGZsdXNo
X3dvcmsoKSBjYWxsIGRvd24ganVzdCBvbmUgbGluZSwgDQo+IGFmdGVyIHRoZSBkZXZpY2VfZGVs
KCZnYWRnZXQtPmRldikgY2FsbCByYXRoZXIgdGhhbiBiZWZvcmUgaXQ/DQo+IA0KPiBUaGUgd29y
ayBxdWV1ZSBkb2Vzbid0IG5lZWQgdG8gYmUgZmx1c2hlZCBldmVyeSB0aW1lIGEgZHJpdmVyIHVu
YmluZHMgDQo+IGZyb20gdGhlIGdhZGdldCwgb25seSB3aGVuIHRoZSBnYWRnZXQgaXMgYWJvdXQg
dG8gYmUgZGVhbGxvY2F0ZWQuDQo+IA0KDQpUaGF0IHNvdW5kcyBnb29kIHRvIG1lLg0KDQpUaGFu
a3MsDQpUaGluaA==
