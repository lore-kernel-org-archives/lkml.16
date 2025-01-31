Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD611487C1;
	Fri, 31 Jan 2025 23:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738367075; cv=fail; b=HHhIT5Ej/eB7FyQhRFHSQhcFNwaq+aezLUevQZXXpFd3ZnmhXg898ZbywmrJ7SGgeYtuMO3wP1qTJKD/uncvVnjVPZzA8QXEXFqYZfjMKUSFofv2ehXDm9eTDUSFgYYO1f7tiEnYkhDRP8F0r6jcbvxZq5m3S+mu/0sdtzndnVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738367075; c=relaxed/simple;
	bh=bBlu5j4Iw32rDRc/SXYTEDWORAcsOWCqeW1ozUQ5rkY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OtlylN4i4JIpxnX1LN1cqKdOiYUTDljHjlvL9enUsK/UDqwJOlicAaFC2yZ/7WfwdVd632xnu4ezK6o7S2xExvYnWbUec1oKX4DEZ2HE9osYjggWYGunm64cIRrX6WEHiLgJp3W7xOBTQoAhuWcgDciFWgq88Mxtc1DeCO0pWfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=IqugQQXU; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kc11/mbN; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=A5rEON6z reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="IqugQQXU";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kc11/mbN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="A5rEON6z"
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VI25GC001466;
	Fri, 31 Jan 2025 15:44:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=bBlu5j4Iw32rDRc/SXYTEDWORAcsOWCqeW1ozUQ5rkY=; b=
	IqugQQXUe1rjm8hK6ZgyryQR1bOMK+bgtkqcs0N40CjceBLJT8qpeACNjCAKpYMR
	MJ1UV7O+pKjx4GSFCSlN5cULu1Gw92mJbr0hOXjDbZhpn147dz5DfqiPMFWsB8ot
	CWf6jXEbTspMG+SIrkStcRsoW1u+UL0Ik4PADAd5Iu1bPCKi4XyN1Z0+xrwJI0NF
	5ST4xgGoEGRiI+KPIf0XIrvst1bXQpMXNNlgXttdFoW/JJeW7EPL+2kfwQ6qomuj
	Y5rC7a7iNRG3mKFoz/U1A6BonB/ChJk3tLq1KLJMC37aSD0ZEL6TuQyYwt2HsCtY
	gyVDly1LhJgWuPX3AifBTw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 44h3eph96v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 15:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1738367062; bh=bBlu5j4Iw32rDRc/SXYTEDWORAcsOWCqeW1ozUQ5rkY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=kc11/mbNdZHFvZJiV74FDUmlJEDF2AMG4lLeSSNw4YcNX0j8kv1XJlspAv+tLuHKv
	 vjwe+7GXBvaWhjQ/jbjCIAW4wy5lq9qCxZi95s3jyG/uNDHpJh/nc1YDmEKlhrnldg
	 f66FJ4XWrPRi5sJIVmQSBCKH5McbCJ2+jkxREMiUHA6WKUqH8b+X14R25EzHUmncdg
	 lwpG3GZjAsOHUlJ+HsxONeY+4NJSQle6WHsmUgN/Raja8NJjcqIeUzSSBaJnWcKj/C
	 OBOkcmIzAZMvfaFNjPME+8KFrqI7vBtoiMyTc8XuHAXfMIMn++5pvkiN0pXuVopovk
	 GvQ1hkirRy7xA==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9463D40519;
	Fri, 31 Jan 2025 23:44:21 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 013F0A0063;
	Fri, 31 Jan 2025 23:44:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=A5rEON6z;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id E86594013E;
	Fri, 31 Jan 2025 23:44:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqMei99JJD9dA/Ke1lezvAy8Xvlueys5hnyoL4NRPdRRHHK0BymLICmxvcE/6+aa4bS5n88DIRiBLVicPWpeGJ0z/c5io1hxahi85aZsYoGLld3cGvFeZERxrmVa6NqwahXRxhv+TD1s5zhH4du8TqHSFi6hulG4Q02CyAF/VKTzYSg7vN9kEsb3/GMBivS04fdnr7EX8nUoO3/kLsMoy0akF+OSgqlQzrCW4B80Sj82vYH9u3Znz+kWsjbvB7LpvlUEMGPADILLrtSeKdyisuLgP821Me6FUydFWaPmLAxyDj72N2SOSzNWeo5yMdwo1Y5COMjZXiKMmJz1itrRQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBlu5j4Iw32rDRc/SXYTEDWORAcsOWCqeW1ozUQ5rkY=;
 b=WtojRPjmTp9wmJNKFMAQ6kQWpCkNswxfPoo7MN2jK/773JCF9NAAMQQ7jbkJaGY6V/fFuy2wlX4D0MrN7zFFcWi12VrohdZL7wBVM+aQm8ZT0/uEILsIt7ftok7YRkDoWFp0dS+aTnrv1k2dDMTYVR1jibzmmaQmi5H3TqfzmZvEx/YDt4/TUR9KUlhO+BMA4gnEvjU9WgdDTtCfZSzt+ey+mMCqn8sjDL8FtIQOFNemD3NMFsIYS6RJliCy/XIYiz4koTqEQPiEEcJheuCtFygyPyyimR1PJcZ0RJWJUORf43vCz3qMW3dcQQrW7SyuqMpWdLeiNCFvLsoei44Zlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBlu5j4Iw32rDRc/SXYTEDWORAcsOWCqeW1ozUQ5rkY=;
 b=A5rEON6zgXm1yp2I8QTBEhrXaZW7XD9eBwARiW0xCrZptIZEGUAHvkJgnwzfhgMO3rwQSoTryoX0ckhwMBfoivsW6eFVwvy/x+vweZmZesx1ASNjoNjPv09DjRjLfNywY0q8e13GjCa9oNsARfe1LimxBEwzfltqCr+Q0Zh9ivM=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA0PR12MB7699.namprd12.prod.outlook.com (2603:10b6:208:431::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 23:44:17 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 23:44:17 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Roy Luo <royluo@google.com>, Alan Stern <stern@rowland.harvard.edu>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "andre.draszik@linaro.org" <andre.draszik@linaro.org>
Subject: Re: [PATCH v1] usb: dwc3: gadget: fix gadget workqueue use-after-free
Thread-Topic: [PATCH v1] usb: dwc3: gadget: fix gadget workqueue
 use-after-free
Thread-Index: AQHbbHehrFLU9nYZxEKMjqWESLja9bMrc0UAgAXvSQCAADiLgA==
Date: Fri, 31 Jan 2025 23:44:17 +0000
Message-ID: <20250131234407.fyv4iu5yadp5xeg2@synopsys.com>
References: <20250122024452.50289-1-royluo@google.com>
 <20250128014400.7jx4segwn53vjnb5@synopsys.com>
 <CA+zupgwLfzDvVF+5psdbuUgZb_mCNqXtxS5=b1RtTAjQKq6AuA@mail.gmail.com>
In-Reply-To:
 <CA+zupgwLfzDvVF+5psdbuUgZb_mCNqXtxS5=b1RtTAjQKq6AuA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA0PR12MB7699:EE_
x-ms-office365-filtering-correlation-id: 28948ad6-8af7-4cb8-0666-08dd42512d60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Tk9pY3lkTzk0WlBMN0VuMGVEc3pIMExDc1BxelY0MXdVYkt6TUo4bk1ncFVn?=
 =?utf-8?B?UWozekl4a2pkNHVQQkZoZXgzOHE2ZGFZemsrNVQwWjRQVHgrWnJXMm9aQktz?=
 =?utf-8?B?Y25TWVdUYU9EcEZHdWoxUkNnUHJnOTdrUFdlSGxpbkFTM1lzK2lua2U1d0FW?=
 =?utf-8?B?bDByYlpuU3dITW5nMzVVSG1yK1lGenFsTjg4blpINkN1dmJlM0laWVpKVmxp?=
 =?utf-8?B?Zk1SOEZIQ2NqU0lLVTFKTVZaamFxTUdXMFc3ZjlJVlZXanhyaXQyNTcxNThs?=
 =?utf-8?B?UXNJcjhxL3c2a1h1SHRiSnFHYmhZVFU0dUo3eGVGUjZhRkVaRXR4L3FLbk11?=
 =?utf-8?B?WFNPNkpqZXNYL3lhdU5pWi9rTGhZK2ZLQnZNMXNZaFlqYVJWaWIrQ25zbmNZ?=
 =?utf-8?B?RGs1ZWZ1bnhkbUdLWUk3NHFWMzZZSy92bWVubm5ad3FHbmtGZTNTem5DL000?=
 =?utf-8?B?OURwQWNpbm9wWW85d3FuajdBMVl0QjJmaUlNUnRCMHVobFR3TGZQWDhDSGdl?=
 =?utf-8?B?dnQ1VTJnQ2V4UmpUTktod1ZFYlRTWEt3OHpiTUczb2E4amtySkdQbGRhK1B0?=
 =?utf-8?B?ZTd2QlFwVFlzVHBqMWgwa2QzV0haUFZZdGRLOWZpRm9JRWJrUXdPd2FZUDFJ?=
 =?utf-8?B?UmNkYkk0QStJRVRMRHJtTE9IZlhQa2NDWStWbWVwUCtUUDg3KzhZUHVLc1NJ?=
 =?utf-8?B?WWtXRDl5ZEtmaU82ZWlJZzA0aW4wZm55dkxESlBIbHczQU5XeldJRmNjaG1J?=
 =?utf-8?B?Uk5hZzlvMVZOOStaaGVkZmkvUVZhelluSUN3dFBYWDd6SmRmU0prWkd2b3Ix?=
 =?utf-8?B?N1BJYjgwUVdNa3poNUVuZjhNRnQ1VkRzdXlaYjZ3c0dqWGJycHc4ZnNhQ2tk?=
 =?utf-8?B?aVlpOS9WbmoyRUl0TGxTK05DRUMzWW9vc3FkelJOc3FueGlGajY5dnhIUGw2?=
 =?utf-8?B?VGR2ZGdJRStneFZCMk9ha0h2TTJrZVlta20wblhaN3dIWlI4TFJrd0R5bFg4?=
 =?utf-8?B?LzFWU1RYeTdtbk1BeWVNQm13Y1ZScFRKUkJOalo4NzNTMWM5VHhGbGlZTVAv?=
 =?utf-8?B?Q3hHUktwSXVuVkJoTFdrSmlVYXZ3VFpxNUNwa25yZ3BzRjVFV1pZTEVBMTRD?=
 =?utf-8?B?Z2RvQ3h3MlZRQWMyS0lPaXlRTzhKbTRBQytOQ3g0aFF5Tm5OM0NiZHFRVXFN?=
 =?utf-8?B?SDlsYkhCR09oWWwyVm4wSWFrUTZZUzRSR1RrbEZyREQ1aTJ3ZkdzMDRYSStD?=
 =?utf-8?B?d3lPSmtkZmIza0dYNGJCRzFxbVQ2Y1JwUGhWUGwvd2pmV21PS2ZOdnhJeGlj?=
 =?utf-8?B?TjJEeU9iZXI5SktaY211dEliT29TVjVFRTBUbW9lY1lVZVBmYWtoUlJmeUl3?=
 =?utf-8?B?WWsrbC9XOVJIcnk4eUFJK2ptVVBPK3JCQmdhVWVycUxjNnZjNmZiZUc2ZTgv?=
 =?utf-8?B?SVpxTzIwNHd5RW9ONXpyV1l0YW5YWGlZYWlmQ29DSUtLcXRxNWh0bU1FSllL?=
 =?utf-8?B?U1NPTng5VjgzVitsdXloc2c1Q1k0UmRwWC9ZRmxQVEladktPa1NkbUNNNld5?=
 =?utf-8?B?MmJjem9QQmpxQzJpOFJIV2RvMm80T1BpTVpzMTFVSzg0ejV0VnFFanJ6b0Vs?=
 =?utf-8?B?N01tK1UrN0xzRmVPejlIQ3dPMjNGVytVK0hjeUtCcTVFRGVPRjc5dWZwaVdk?=
 =?utf-8?B?R0gwU3pKSEp3NnlXdTRUYUpYN1luSmhKbE90djJYSFl5N0Iwb013a0Fyam5r?=
 =?utf-8?B?bmlTSGZ6aXdObGhNV1NSWGdqWlUvNkxHOVdIQjg0K1o0N2NOQzltQ3pBZXRC?=
 =?utf-8?B?cHdNaVg1bVhvYzBGOVlmQWtGVnE2WGFoTWpKdTM3a2d1c215cUswVHR4MmIx?=
 =?utf-8?B?cG1EaC9MN3h6S2t4Q3JHZWdqNlpQVjBremNlVlZ6RlpMamU0Y0hsRHVZU1A4?=
 =?utf-8?Q?HJcJarpcSxSTGbDCBLkqh9IGWBl+YB/T?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T2ZSZkFWRSt5cTlqczZIalcwc2xSWlp3a2hMMGdqRWJiZDhQZ1BvTnZXbkl1?=
 =?utf-8?B?VTFkL0NWc2FSRmFIcit3TUpKVWNvZmRMUkNGRThsclEzc1dVdURJUmVsV0Nn?=
 =?utf-8?B?U1VJWnp0MGlSSitwVVhuODFnSXJpQStkOTRZRUswb2tPZVIzSGlwS3BJZ2s1?=
 =?utf-8?B?aCtLSG9PK25VTTJHYWdvZm9ObEtINitrVzR4bGk3RzNiMHBVMktWV2Vldkxh?=
 =?utf-8?B?eEJyOFpkM0trQUFGd0QydXZ4cUNVdDh5TmNMQWM0MTZ3bnlzOTVUb3hrV3Yy?=
 =?utf-8?B?WUlHWjFzek92bnlwRlpRbko5ZFZsczY0MjRJVGxLMFlaYUVoQVp1em5zb0li?=
 =?utf-8?B?anFGRWVaNkdiSEJYOE9BVW42c1dZY1cwMVVWcHFaV0JYOXBOV2lydVRZcFBv?=
 =?utf-8?B?U1VXb1R3ckFkcjAxUUhlODY2RGQvc1kwRXhxUk1hNXlIWnJCdGRTYWkxbWpL?=
 =?utf-8?B?bFBodVc3ZWlYUlFMN3N2RjhocVI2c1E2c1l0eU1kajU4VWUwOGNieXB6SG13?=
 =?utf-8?B?ZUlaenFHa0NVUkZDbVg2bDdzM2txQVkyVlZkUDlLODdKMldaRTRYNWI2T29V?=
 =?utf-8?B?bUlFa1FhbmJUZTRycmZIT1JMZTJBSXdDYmo0ZHJSa3pKOTZrSWpjZTdvZ1R1?=
 =?utf-8?B?UzJBb3hyRm9XbUN0a1QrakFPakhGeDQxRk9kMkhicWM3aEVZRW5yT3lXTjlJ?=
 =?utf-8?B?VWc3c2NyT3lkMnVzK2pJSDJOU3lNQUp0aHoxbnNkbFhZQ0hsWEplSWdzSG1H?=
 =?utf-8?B?eXJqNElxdlRRSXFQd1RnRE43Zi93Ty9JcFVHZkZxRXFtdUJMRUVSZ0ZUb2N2?=
 =?utf-8?B?elRtdTNCZ1ZqT3JFV25sNWdKc2FpcC9jcTMxOVFTVHgyVDlSVHRMSVpzNm5K?=
 =?utf-8?B?czV4NHNzQzdtNThPeU05Yk9VTFZrdUYzRHo1SVRCMDc4UDhKUXV2NjJiNWxW?=
 =?utf-8?B?cndHZlMyQTVpcXdpYlFlMWdzWkZUdG9jS1Y3RlhMbkE5ei9qMGpzU2MzaGR2?=
 =?utf-8?B?bEN1dUIwTnJrdSsralBkSnl1all2MlZhNGJKOVZCQWZSYkxoS0pCUUZNczNL?=
 =?utf-8?B?SVBTSjlpVkN5YUQySlpHRzRYQ2dmZXA4UjFGeDFCUHFDZS8zeFhWRnRHY2tL?=
 =?utf-8?B?ODRLSWRaQ0tFTzBLWHdsLzNNQ0ZjM3NPdThWWUphb2lML2g5UzE3WW9pL2Zt?=
 =?utf-8?B?Z1ZNaGlTbTB2Q3V4OGlHYTltZFNMcWFNaTdxdFBJYVdmV2VaWGhEKzB0UHEy?=
 =?utf-8?B?Z3NHMWt5OHNQMFBEWkZaLzVIbUJlazVkcFNrSTBhSDZMY0ZYcXFseGYrbGZq?=
 =?utf-8?B?U2dtb3dTTHRGZDZBVHZhYUdOMGw1UkVNNHdCeXVwYldFaU1mMEtaUEdNdng1?=
 =?utf-8?B?MWIyRXZ2TFk3Qm5reWNmUWU4TVJrM1JPbDY2b20xcmwrd3JaZDFTTDNVaW5L?=
 =?utf-8?B?QjFMSUIzamxQNjdnWm5QdlQ1YjhUajdlZ2FmOVNPbGlhTGJLOVoxUklESzJW?=
 =?utf-8?B?UFBtWmdtUjJQODJHdE9KaUwzelhZYjUwbGtDd252dXgyelp0QmdJTWFXVzA3?=
 =?utf-8?B?Ty9lUTVJTmxUQzFsMzFkWEJOaEl3LzZIR3BIUHVIUXYzbk14UVgwbW5IMksr?=
 =?utf-8?B?OFpHTXE4T2RuYzIxNy9CVFZWY0FwMVY4SFdYUWRIcGk2Yi9WOG92ZGNRM0lm?=
 =?utf-8?B?UTk3ak9oS25kREc4YnY2R0ZVSm5GN1J1UWkyYnZ4TU1PeXQrVStMNVdCdDl1?=
 =?utf-8?B?VHFqU3oxSXlJamtNZFJuWkkzVFp2TUFVVkNCVTdka2drc1ZGa3JqdzVOeWVR?=
 =?utf-8?B?c3dMM2haeWxrRi9DNnRwWXZBM0dTdWhrWkZEU3NUQU9oQjAvb3lmZ0FkYVFK?=
 =?utf-8?B?TUxhUVJGQk52M01pMDNzQzh4Y0U1bFJWVE9aYjZNdmFVUDlaVTJaOXpZR2NK?=
 =?utf-8?B?NUVzcG00RTFLZ1pQL0ZsRlVzZ0lrRk9GTTRjWVNBSFBDdGpDcVR5T1ZucGZE?=
 =?utf-8?B?TnV3V25Gc1N5NzVadWFicmlyUk9IaEcvY3dGRjBBNFRHcS9kSXo2djJGME9o?=
 =?utf-8?B?UkR3NWVwNFp0MmduVnBleHVzTm81ajB3UGRyYWRmbzFpKzREbklOYnhFYS8y?=
 =?utf-8?Q?+G2tIPX6PbQobHNsiRFG2yHYB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4F604CC7F01F443A1438236C516FA31@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tCWE6B1UZkmvF/pe4Rz7kWdbpUf1sRb1lvZNYiHRQUvy7GXYC+czpntABQ4YAPj4RrWZv6q2PR4TgINKqUQnpybtz28KGbc0hg20PSb4DFjppJih2Q3afALnQQkXHMVMbkKf8IobwKv+z9jH2gJZpVoi93IFPu9U2ptbsFhS350viyXHDsGnyhfsXW4phqxiPYPzIwtinkkh9MkGxJMqw2JjmipAtU8N9UX36xKrjN0RoUCbQQzvnhNHomckEoRUMlgOlhhXqAQeB1miLs7irwrEdfvIHpgO5dW4AKtBCcSRcEszKIY9g3dn5B1z0p2KCpFUhoeG4IRFf1jBFRWg+l5kDtx5nTNWGyzoLUoweaHydrVURs62keRGsnvgunYtpRGuMYJoVq3ArDDA7aDo3u9rlSmSX3b3X8BLN9wplV3Gi1fePkfmHeZpy+ZDcF0K3U6syIg0YAttinhgF6GPAPxFKdGI8rHsZ2pwf3VwBHXFNzeO3Ec4BNZMjZPOLEUuD+S4iIflw3M6yeMG+klfY0FF7p4ZZjt76ZWP/95Sa5tcKgpmlP8JZ9yVejnWVh+c/+tFeLcd1zydWARsB31Ifa3WQ7/WGWhM2aytvbHgbvoXS5d2yBbj5ea2AndaKkGgcQALb2Nbwm7QkV2HZLmfkg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28948ad6-8af7-4cb8-0666-08dd42512d60
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2025 23:44:17.7096
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SpA99+1leoHUaTTaeYvSQ/omyd0ACXSoz5tuVI9jAeNuTIVLd/HULBv3i+HkJrmRPLAFOvyCCY31XuaCHYhZFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7699
X-Authority-Analysis: v=2.4 cv=O6jDvA9W c=1 sm=1 tr=0 ts=679d6057 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdSt8ZQiCzkA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=yCj-F7uC5WQEmo-5GAoA:9 a=QEXdDO2ut3YA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-GUID: evEt4uMe2RlCqUQDItPfhru0E3M09pYZ
X-Proofpoint-ORIG-GUID: evEt4uMe2RlCqUQDItPfhru0E3M09pYZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_09,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2501310182

Q2MgQWxhbg0KDQpPbiBGcmksIEphbiAzMSwgMjAyNSwgUm95IEx1byB3cm90ZToNCj4gT24gTW9u
LCBKYW4gMjcsIDIwMjUgYXQgNTo0NOKAr1BNIFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5
bm9wc3lzLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBPbiBXZWQsIEphbiAyMiwgMjAyNSwgUm95IEx1
byB3cm90ZToNCj4gPiA+IGBkd2MzX2dhZGdldF9zb2Z0X2Rpc2Nvbm5lY3RgIGZ1bmN0aW9uLCBj
YWxsZWQgYXMgcGFydCBvZg0KPiA+DQo+ID4gVGhlIGR3YzNfZ2FkZ2V0X3NvZnRfZGlzY29ubmVj
dCgpIGlzbid0IGRpcmVjdGx5IHBhcnQgb2YNCj4gPiBkZXZpY2VfZGVsKCZnYWRnZXQtPmRldiku
IEl0IHNob3VsZCBiZSBwYXJ0IG9mIGRpc2Nvbm5lY3QuDQo+ID4NCj4gPiBDYW4geW91IHByb3Zp
ZGUgdGhlIGZ1bGwgc2VxdWVuY2Ugb2YgZXZlbnRzIHNvIEkgY2FuIGhhdmUgbW9yZSBjb250ZXh0
Pw0KPiA+IFRoZSBoYW5kbGluZyBvZiB0aGUgZmx1c2hpbmcgb2YgZ2FkZ2V0LT53b3JrIHNob3Vs
ZCBub3QgYmUgcGFydCBvZiB0aGUNCj4gPiBkd2MzLg0KPiANCj4gDQo+IFllcywgaXQncyBhIHBh
cnQgb2YgZGlzY29ubmVjdCwgYW5kIGRpc2Nvbm5lY3QgaXMgYSBwYXJ0IG9mIGdhZGdldCB1bmJp
bmQuDQo+IExldCBtZSB0cnkgbXkgYmVzdCB0byBleHBsYWluLiBIZXJlJ3MgdGhlIGNhbGwgc3Rh
Y2sgZm9yIHVzYl9kZWxfZ2FkZ2V0Og0KPiAtPiB1c2JfZGVsX2dhZGdldA0KPiAgICAgLT4gZmx1
c2hfd29yaygmZ2FkZ2V0LT53b3JrKQ0KPiAgICAgLT4gZGV2aWNlX2RlbA0KPiAgICAgICAgIC0+
IGJ1c19yZW1vdmVfZGV2aWNlDQo+ICAgICAgICAgLT4gZGV2aWNlX3JlbGVhc2VfZHJpdmVyDQo+
ICAgICAgICAgLT4gZ2FkZ2V0X3VuYmluZF9kcml2ZXINCj4gICAgICAgICAtPiB1c2JfZ2FkZ2V0
X2Rpc2Nvbm5lY3RfbG9ja2VkDQo+ICAgICAgICAgLT4gZHdjM19nYWRnZXRfcHVsbHVwDQo+ICAg
ICAgICAgLT4gZHdjM19nYWRnZXRfc29mdF9kaXNjb25uZWN0DQo+ICAgICAgICAgLT4gdXNiX2dh
ZGdldF9zZXRfc3RhdGUNCj4gICAgICAgICAtPiBzY2hlZHVsZV93b3JrKCZnYWRnZXQtPndvcmsp
DQo+IA0KPiBUaGVuIHdoZW4gdXNiX3B1dF9nYWRnZXQgaXMgY2FsbGVkLCBnYWRnZXQgY291bGQg
YmUgZnJlZWQgYmVmb3JlDQo+IGdhZGdldC0+d29yayBpcyBleGVjdXRlZC4NCj4gLT4gdXNiX3B1
dF9nYWRnZXQNCj4gLT4gcHV0X2RldmljZQ0KPiAtPiBrb2JqZWN0X3B1dA0KPiAtPiBkZXZpY2Vf
cmVsZWFzZQ0KPiAtPiBkd2NfZ2FkZ2V0X3JlbGVhc2UNCj4gLT4ga2ZyZWUoZ2FkZ2V0KQ0KPiAN
Cg0KVGhhbmtzIGZvciB0aGUgZGV0YWlscyENCg0KVGhlIFVEQyBjb3JlIGlzIGluaXRpYXRpbmcg
YW5kIGhhbmRsaW5nIHRoZSBnYWRnZXQtPndvcmssIHNvIHRoZQ0KZmx1c2hpbmcgb2YgdGhlIGdh
ZGdldC0+d29yayBzaG91bGQgYWxzbyBiZSBoYW5kbGVkIHRoZXJlLg0KDQpTaW5jZSB0aGUgdXNi
X2dhZGdldF9kaXNjb25uZWN0X2xvY2tlZCgpIG1heSB0cmlnZ2VyIGEgc3RhdGUgY2hhbmdlIHdv
cmsNCm9uIHVuYmluZCwgdGhlIGZsdXNoaW5nIG9mIHRoZSBnYWRnZXQtPndvcmsgc2hvdWxkIHRv
IGJlIG1vdmVkIHRvDQpnYWRnZXRfdW5iaW5kX2RyaXZlcigpIGluc3RlYWQ6DQoNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2NvcmUuYyBiL2RyaXZlcnMvdXNiL2dhZGdldC91
ZGMvY29yZS5jDQppbmRleCBmOGMxZWY0NjVlNDUuLjllNGFiZDZlNDBmOCAxMDA2NDQNCi0tLSBh
L2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvY29yZS5jDQorKysgYi9kcml2ZXJzL3VzYi9nYWRnZXQv
dWRjL2NvcmUuYw0KQEAgLTE1NjgsNyArMTU2OCw2IEBAIHZvaWQgdXNiX2RlbF9nYWRnZXQoc3Ry
dWN0IHVzYl9nYWRnZXQgKmdhZGdldCkNCiANCiAgICAgICAga29iamVjdF91ZXZlbnQoJnVkYy0+
ZGV2LmtvYmosIEtPQkpfUkVNT1ZFKTsNCiAgICAgICAgc3lzZnNfcmVtb3ZlX2xpbmsoJnVkYy0+
ZGV2LmtvYmosICJnYWRnZXQiKTsNCi0gICAgICAgZmx1c2hfd29yaygmZ2FkZ2V0LT53b3JrKTsN
CiAgICAgICAgZGV2aWNlX2RlbCgmZ2FkZ2V0LT5kZXYpOw0KICAgICAgICBpZGFfZnJlZSgmZ2Fk
Z2V0X2lkX251bWJlcnMsIGdhZGdldC0+aWRfbnVtYmVyKTsNCiAgICAgICAgY2FuY2VsX3dvcmtf
c3luYygmdWRjLT52YnVzX3dvcmspOw0KQEAgLTE2OTQsNiArMTY5Myw4IEBAIHN0YXRpYyB2b2lk
IGdhZGdldF91bmJpbmRfZHJpdmVyKHN0cnVjdCBkZXZpY2UgKmRldikNCiAgICAgICAgICAgICAg
ICBzeW5jaHJvbml6ZV9pcnEoZ2FkZ2V0LT5pcnEpOw0KICAgICAgICBtdXRleF91bmxvY2soJnVk
Yy0+Y29ubmVjdF9sb2NrKTsNCiANCisgICAgICAgZmx1c2hfd29yaygmZ2FkZ2V0LT53b3JrKTsN
CisNCiAgICAgICAgdWRjLT5kcml2ZXItPnVuYmluZChnYWRnZXQpOw0KIA0KICAgICAgICBtdXRl
eF9sb2NrKCZ1ZGMtPmNvbm5lY3RfbG9jayk7DQoNCg0KQlIsDQpUaGluaA==
