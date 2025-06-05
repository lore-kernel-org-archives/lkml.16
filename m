Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4589D2FB;
	Thu,  5 Jun 2025 00:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749082850; cv=fail; b=SN4B7q6fZ0j1P7LL7n4EAcPk/M9a8WA7u1JY0yOsyutdV0Ii/oyhoU8FA/WGMwIK2GZjI+Ph/Cp2CF0fVwsJnzZYHM83nP6OeagxF0XMIUCNoNQvXEAfaOt5sHPFiBupfvDTqvBCF2vYv5UGgrP9rO/rxpOqujj0H/lbJkRqwK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749082850; c=relaxed/simple;
	bh=WP24PW9SpHTDP6D/lgPqAvzQBeZFhXfllulT0r44P6M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OFU+aUezWQH2HJ+nYmOeCnM60Xcdl/twkeTYhWAbuaeJwj5/UGS06a44wBlbzPq5QTqbPD5czreEOJKPL6qeO6nOetFqbKWTuBPFEQKVzG0BWMU9zpbTHBHnqDbyt97wqv9kjs+V62osHCiFFM6Lv8rAVv/AVkvzCELey8GitTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JO0BD9Qa; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=QUwIZTwg; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=wygaMb/j reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JO0BD9Qa";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QUwIZTwg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="wygaMb/j"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554Gv0mL029727;
	Wed, 4 Jun 2025 17:20:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=WP24PW9SpHTDP6D/lgPqAvzQBeZFhXfllulT0r44P6M=; b=
	JO0BD9Qad4IQLpighN7QSDV3WpYGuh5XLF8zw1uAWtM0GmvgRxr4YqHyZ6CotnI6
	jj1yHDPiGx5bTSN6dTqlZIfTa5ot/hgjD2kdv1y97w2fInxTW1vW/lVDN7MpWgJM
	8gbJB3vgxfTW6ORfKXfiqdWCWECjQuwyR5x8sYaLsM2ffhuaH0N9kZWPemI/gCYs
	l0UfZa16Gt2gSsSJkIDOuECoUwFryoBcrPPKvT2sp/vo9M1OCIMbHtyxq3c3Dkn0
	bpw12vMpiyUn4RWb440WxceyFEwu5bNQSjv+B4eSc1pEp77aizY38kR486RaBlsM
	QAFiMIM/6IHy53N2HeWFQQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 471g94mx29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 17:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1749082822; bh=WP24PW9SpHTDP6D/lgPqAvzQBeZFhXfllulT0r44P6M=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=QUwIZTwgenwJLkWdTFTKBWyRpUjZGWt0hOnrhel+gV82bbgku9JjqS7jTJq0qCWNl
	 BGz3+2cOCd0DSIljFMhZYbOlztNxWdl75Wcf3BaVxBy4/TNRluKRsOBoyGw121/UQf
	 PwUCM9bRfO7b7z81Hfii2jGMeVNrAHt6htQsPHBNQvh+AcZtFNznsofW0MdBGdzdNB
	 nJYNoZU0EusS1jjQe+JdU1m5P3sfLc0/Yf86o6x2ZwsRrkDZ8e9P5lhYcbYFoMOF5K
	 byaFgdd1lA8G1GBiYXtaSLsr4zFQCbqZ/yA1cTy2oTn8AQL4qRzfigHnSTVcGeK3Is
	 wRgYqZnRToB4w==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1F42840132;
	Thu,  5 Jun 2025 00:20:20 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 9863CA006F;
	Thu,  5 Jun 2025 00:20:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=wygaMb/j;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 85CA940127;
	Thu,  5 Jun 2025 00:20:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KnkuN9MFKVjhZsUNAdvY6WXGi1U7OPWsuPWTRMtmUg3VXPFiUY0c8T5RcgD4yAwKROJ3NmkNiG5KLSz8rGhuWCO35SDO5Gt5aZ8QjQWbLvoCl8sabvIrx5Q/+jzD7VGSN0KSERYBNNvdU8KCGLAmfrb0NilfmyG3x51o2qdJmgCV5ZMGAJ4ouaj1RC4LwR3iAlb9USUiia6DjqDejaoOkVke3AL5QyHv2QMiubV09vKIiJ0gcipYUU0V3RbM5XeKxB5nSsn+RyRDypQ+r53nHQvRS6i2JecPiVZkqSjcC2Z9hth34QEbnEqh/GOBZ5GE6/uTmPVUIKggK0pKOaWYsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WP24PW9SpHTDP6D/lgPqAvzQBeZFhXfllulT0r44P6M=;
 b=MEi//QV/mvsDL7p8OzOaa65ONAyOFUsTp8WZclHjgOB+/PcN+Y51LlZ6CP5h+SoOM3udNXpAUHemGaQUzv12XoxMIlYl/61/8kl34kDruMpOga3SVpwGjrSNMvVbl1PSrbN3/AIckgmzvs71w4Sq04YkDz5dP4CoHRcPHTmp0QMClkc76hcju+dnxCqSoiuQvTiNb/VXoKLf0e6i6atvAsM4Tk9uw5zcCzGgGNOyiyxu72ybAuMGBzEE7YwEcthYtHsZhXnfA7uoHrZLXA3o2+DAPlB8t/RU7eIbnjUip09HQssRf+JbiKbgb8POaHPGqo9Qfvbr0h8CFH3bdPykiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WP24PW9SpHTDP6D/lgPqAvzQBeZFhXfllulT0r44P6M=;
 b=wygaMb/jbZQuP0LFk1+ESwQ82bx1d65kaU2eHq2hHAYVAmp2MLZ09YjWRvaYSTrhQuhAjvZG5l//4K0IFoqAjSPzwaInw6J9jiSvnalwcr61Yli0xvkirhemJYJ2HOFwSGhzm2Z0/mPLITf12HPNRxLkzZk6IwBOzkVAnWtf9iI=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ2PR12MB8977.namprd12.prod.outlook.com (2603:10b6:a03:539::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Thu, 5 Jun
 2025 00:20:15 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8792.033; Thu, 5 Jun 2025
 00:20:15 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Frank Li <Frank.li@nxp.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "bjorn.andersson@oss.qualcomm.com" <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] usb: dwc3: add layerscape dwc3 support
Thread-Topic: [PATCH 2/3] usb: dwc3: add layerscape dwc3 support
Thread-Index: AQHb1AnlUE7hkiv/E0uGFrAejSyRRLPwpAGAgADkEoCAAi8MgA==
Date: Thu, 5 Jun 2025 00:20:15 +0000
Message-ID: <20250605002011.d3qmst57d5zwtuow@synopsys.com>
References: <20250602-ls_dma_coherence-v1-0-c67484d6ab64@nxp.com>
 <20250602-ls_dma_coherence-v1-2-c67484d6ab64@nxp.com>
 <20250603012259.gyat6ungxyufhhbe@synopsys.com>
 <aD8NxfmJjSMeQKOu@lizhi-Precision-Tower-5810>
In-Reply-To: <aD8NxfmJjSMeQKOu@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ2PR12MB8977:EE_
x-ms-office365-filtering-correlation-id: a192b1ed-7dd4-4107-2936-08dda3c6becd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZlpLZC91WmNtbVp6QnZJYmZJZnVUcUdjSVdUSlh0QUVxVVdheVd1Si9XY2Zl?=
 =?utf-8?B?anJKMXg0WUZqdVJBZWQ4Yk94N1E3dS9uVXpra3lyWm9jaDlBOERSYzNtUXRl?=
 =?utf-8?B?TVVJSHQzZFFhTDNReE1INEJ4ZUcrM1ZhYmNRZlBnVVNZb3dhM3NiQk92Z1V5?=
 =?utf-8?B?Z0JhaTNIYkpzUlk3b3YxSkZZRkpoN1NSd3JCc3dhZXNuS3VTck9aaDl6RExs?=
 =?utf-8?B?dU9GcS9Fb05PTzladVlaYitqajBCSTB5bmlJbWtmcDFnQkxnMnNKZlFTUHdz?=
 =?utf-8?B?SUk5bktwTlp1ZVorSXpQU0w4UUF2Y3MvZlJtZ0ZnUlF5dmhSbDFwTm9hVThF?=
 =?utf-8?B?THM1R21qeWp2TVlBOXYxZEtVano4YlBmSmxMdHM1SmRTT3ViaGNSUkxmWUY3?=
 =?utf-8?B?djBHcmhFbFlwRDRoMTFDY1RuSmt2Ri9WKzdTRlVTa2NYT1pOV25Qb3BnQ3Ez?=
 =?utf-8?B?UTBwQyt2TGsyT2N5RXk0bEZYM251YnhpeGpLMG1nL283czltQXc1ck9GZ21N?=
 =?utf-8?B?MXp3SkY5WXYwUlJLYWIrOG5XOXRuYi9xaFhjN0g1eTJiNVZseWE2TzBFYjJO?=
 =?utf-8?B?UnRXdW1ROW1VTHpYRlpQaDVuNk1mbmdmOVdpb1dFbW1oVmppeGh3VERoTFdP?=
 =?utf-8?B?YzNUeTJ0cjlrWW9ma1BmbnE0TzlGUEJ4Q3ZOTU5lcFY3S2FOSXREQy9nck5i?=
 =?utf-8?B?NW1yUVNqZW8yeUo2QTdUaFBGMmhXSjJiNkllUEg1R2tDQXUzczhsa2FWalBa?=
 =?utf-8?B?b3VOUW9MTWN2cnlyakRJbzdMTU03dFN0NGVCZzFLa2ZyK2htblVHRFlUZUdK?=
 =?utf-8?B?bitpU2JpMGQ3LytzYmZKcGpWZ0I0SW95UFZpTmlpNlNEeXl2THZUcmZ6THJt?=
 =?utf-8?B?Y29DRUtwWGk1SjdaV3FucXRaWVZacDVkKy9tc0tLQnN4b3QyNFJ2UUxvamtO?=
 =?utf-8?B?SXJHbEhsTkFTTTZ1R05CYitiZ0NuSEtxaVpsbVl2WWV3WGcvdWp0ejZKV0Y0?=
 =?utf-8?B?R251MjNVbEk1UkZER1RiVmpEWFN5d1Z5OWMva0JTUE5CeW9MRERUU05IZEg3?=
 =?utf-8?B?akRpbzJxM05pUDVwTHM0WXJreFBvMVhIWjVIMW1yZVFwNjl0NmJ5WVBNQ0lq?=
 =?utf-8?B?WGxhU1p4T00rd0tPWnlXNVVQUEthTW13U1EwMHpWaFdxdW0yaEZ6ZmREYW0w?=
 =?utf-8?B?M29vWWZ1SUs4N25vcnBkZWhWdkFqak9lNWwyN0xjWGhjK0lUMTRxcVBIc25v?=
 =?utf-8?B?aXI5aU5peXAwVEp6VDdyQ3VTcWtWWVhiSWxQdi80b1lKM2ltR0M1MVg5Znpq?=
 =?utf-8?B?UzNMczZDSExNM2JaVnY5MmkxZDEvUnF3M3J2MitlYzRMbkhBdXUvaTB1cGhE?=
 =?utf-8?B?cm5CVkl2RktDeDZvV3dGZnNZalFiZzhKT2E4eGFWNU9ETUpvYU1iL2ZFRGhC?=
 =?utf-8?B?cTBHaGFaOWh1ZVBDSE1hZllMUU02NHNlZUdsUUJrdnAyK3VmWHg4dSs2b2tx?=
 =?utf-8?B?OHZsdENySXIyVlB5YlI5disvY1k4SjIrcFFRMHhEZnJzREFFY3BRc25QbHJh?=
 =?utf-8?B?NVJpOUhyM0tTdmtMNDJHK2VEWmFxRVZqcmptZFhJOTBTbHhzMFFKUW5SMDJp?=
 =?utf-8?B?UWxiQWhhdVpyd0VaOCs5MlU3TXlsQmRQYStrbWV1SlRLRUlsem1wVlhSUlhC?=
 =?utf-8?B?eFBIQVBaVmg2RGI1bWU3eHJNajNQbVlkVC9PSzYwWVExOGNpV3g5V3lNMUVE?=
 =?utf-8?B?R3Z6cWZ3aEZRVXcxTmhPMzdMczQzaFlNR3B6S2JkMDN4V3R3QXcrTDZTT0RB?=
 =?utf-8?B?RmxUVmphcEIrYmdyVXpSN1dmNWhEYSsyUG14ekt3WVZIMDk2RFhCMHk5QTIv?=
 =?utf-8?B?ZXV0YllJYVFBTTh2dVRtWXZjcVFqTk5oR1BUbXUvY1NOWE1uajlGRFArTlpt?=
 =?utf-8?B?cTZlc29jNzNBSWtSSzFYektYN3lHaENQVEZRb1U1QmJwQXRncHlnc3AxZWZl?=
 =?utf-8?Q?0oXImxntK2PB61bM656R/wm2Kbc9wI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TW5DM3h4cU5nQlhkaENORk02ZzlXODBIQlJ1WjhlK1ArbFpiTVAwbmZ2VXFi?=
 =?utf-8?B?anBsamFmMVg1VVd5ZGhRbWtZaExUaW5CL20wdTFveXJZUGpMOENXUWk0dHNz?=
 =?utf-8?B?eHpJbmwreEg4YjEzM2pwL2V5TXkrUDhqeU5pNWY5MEpnR3ZNVFJUYkZPVElY?=
 =?utf-8?B?NUdobENQSjdRZDBTNEJ1aS92ZmFMVDYrU0hYUlVIL29JazZOUHoxOFVjS3li?=
 =?utf-8?B?eXJqOXhsblNYYTdyMUdXNnI4SnZhbmtZc2hJL0tMTXllOWRGU2FKWTFxMGt3?=
 =?utf-8?B?ZTVRVWR5VlBjUXFxbkVBKy8xZ2MwMjFKUkNnM1pmbDN1STVROVFTOFlxNWlW?=
 =?utf-8?B?VFFOclI2V3c1dXJCS054Z2h6SjI3RXoxRytGYkw2UzU4MFF6ckROU1J0TEV4?=
 =?utf-8?B?ZXgxOFNNYStld0FzMnJKUnNJd2NlOGZMbjN3OE5IT21jSGlTQlNvTnpxNGVX?=
 =?utf-8?B?RmY2K3BqaHVNOTZ5NDU0c3AxZSt5U1ZTSHFYZkJmSFh2ZVEvTXdQbjh1MjM2?=
 =?utf-8?B?R0VYV0phU0JoZXgyRXB5WXYwK2N2YWNUTkoveGZBRjhpSnFkYUZsNE1rc0ZC?=
 =?utf-8?B?RDhodUFPSnhKQVlCSUlDUmx5US9ORXdTQm9zZ1Zoa2dFbVVIZmhEM0U1aExj?=
 =?utf-8?B?Wk1xdVlHSjhja2pHT3lFOHI2VWt4UStFdE0vWmNoMzFrUVZPZ1J3ZWNUaldh?=
 =?utf-8?B?cHNDa3o5R2RUVHBjYjUzNUEyR09pR1dOYWJta0VNRUxBc2xYSmNTZzBaTlNW?=
 =?utf-8?B?WitzQlR2K3NDY3NCVEZBM0ZaaVlVc3c4QmxGM2N4anQ0L0RQWUZUay94NHZG?=
 =?utf-8?B?QzNxRmZaYnNnaklWZndubnAxZFhpTUxoU21PRHFPY0cySGNiaG9XRmw2NVJB?=
 =?utf-8?B?Vk1SL0RiUERlYkx3S0ptV2VZa01abExUN0l6LzJUYlBWNDZyREFoZnRpbFdm?=
 =?utf-8?B?TjI3N2hhcVBWQmp2WlhKRERISjZER3JLdllCVFJMV0syQkNLeGdiSWIwUjlF?=
 =?utf-8?B?aU1yQndGRDFucUZySGc4YzF6M1BmL1h4MUxtemVPK2hmWEdrUksvK0NQVjcr?=
 =?utf-8?B?a2tLN0ZSVXNTMER2QnVIVWI0Tm8vN01hMVdLNHdzNGtnekIxWC9OcGt4UHdq?=
 =?utf-8?B?N0x5MXlCMGI3a0NaSS9JMytMK3BxblAxd1F2S2RNaHNoa1o2ai9UdXAydE9q?=
 =?utf-8?B?dWdPRjVvQ1lKSFpmTmVEWENsNUlTWE9LQ0NFcCtHMnNqWnE5eUQ4SDNJMWV2?=
 =?utf-8?B?Zy95d3l1NDJ2TW5qMGRiRFRycUZLbmtTSnZBWGp1Q0U1dmZieXM4b2JiREV4?=
 =?utf-8?B?RnFtM1Z6TkRUbi9tT2MzQTlRMmFVM1hKc3lIajMzQUZRNUdCSDBlNVJuciti?=
 =?utf-8?B?VUovL3pHRlRUM3QxU2NuYXFCSE0rbS83aG1EYU1OeXhod3ZrREE0Mkhxb2Yr?=
 =?utf-8?B?dFF0eFZPTUhWQXZMUUNDNXdPZDdnMzFBdncrb3NpcHpOaldWdlpYZk1YbGd1?=
 =?utf-8?B?S1R4YXJvNTRFMDcxRG9tMUdtRC9GYUZsMEhUaVdBNGxERUxoVUc3ZHVFZHVN?=
 =?utf-8?B?QTk0WTFUR0lwTlY4TTY0eU9OQ2VmOHU5RW9JQWl4bTNGd0tNb1hpLytzNG45?=
 =?utf-8?B?NnlGaG1uTDdUSmRiVnplemZYVUl4NkVXaGlDQ1BMbmNtb0RGVXR6aUVpRjVj?=
 =?utf-8?B?cTVOM0taaHI5d1BrOCtwZi9oWHFWUEtQa2FQZmdFK0hvTTk4QnRYUFZObVpO?=
 =?utf-8?B?ZisxS1VrRnJWL0xHV1BVZG92aUg2TVBaWVUzZVJKUjNWV1FRUWdyTTByUDk4?=
 =?utf-8?B?N1ptenhnNTRmQVA4U3Vmd2pDeEkwaFFiMTNEaC9pblp5NGszWkpGVXo0T3lG?=
 =?utf-8?B?V2RPTXJ5M1JyU0w4RmxrWklnNFpoMGdWTGlNYjBtR0t4bmE2R1ZqS2puK0V4?=
 =?utf-8?B?eFljQU5KRmE3Z3dLY2Y5a2FsY1laTnlqMDZ2WDJldEI4b0NBQWp5clBpSXBV?=
 =?utf-8?B?Y09icGRGWHNHOStnYXROdEJ3YkV5SFpVUGZDOEpUYjJKa01LTmxnVmJBQkEz?=
 =?utf-8?B?RjZTaEwyTnc5L25YbHhabENlQWRvd3F2UXRmVktDa1o5LzJtUjkvZ0lNOFVx?=
 =?utf-8?Q?3TcmpuAVLCKiSSAC8ldxrSLK2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DFFB22E2B5317F44BFEF916D7CD96624@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EeE4PQdidLdVOXeOqWtpJc46H9MyEDv8K4I/qHlGnw2N+N0YNbhWt0sfV49uvdjqOZNYb95v8149odooYZeotwVpICRQjA2qcFgpSZqIVRdGvBmK4dHxTAICzOkFfUjQCPtIsHv5YcmdFcYgy+6g8e/iL9ga1Fzks/sS5TrpQkxVfJckwS3XgQtCOAGepbGrUZw+8nhar6++qVRqqHN2DXYP8lie6uI+/KLs3VrsDPiM8TtrHcjLQ+eQOWPsWimR3RTriofRM3cX2ehbWE7ivIsBDDUv75ri0gAxwRHz5mtnsdKQIoWSm/CtA156EGmphP7McJXAXujMtAvDsOj+4eeHUkKJf/63wRCHXIPiAGG9C7SJhCqmSzhKTL178GtQ2DVHcKnkTEa/am73y4chWdwv/aDVqJlzzzu5X5AyUyf00XvpVMA3p3R/1lbDHIophQfMB1jLO01Wno5r/NEI9DpOkMhXmDAsDgO58Sq93sK2JTQj/eMxWUDndg0SsaUNiTcxKdLMF6ja/s2YpGpwE2RkNwfe5BxproOq5xyfOSTMTt0Td2HAJY26bgDJS7t7tzaCdF/PuC+ygLAO38fTCA2xPm8X4G6NHt9T5JZ8jo3xMaOcHE1B4wp86pBaIFtxCnEQVpFATN0N799tdG1Wfw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a192b1ed-7dd4-4107-2936-08dda3c6becd
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2025 00:20:15.5880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0DzyvvcLfPcaru6H1VhX+bfvNKfgXhyuE402pKAaBfaVCXuplLw9meDEipdaWeqLP3qtGDqXy7/Qf+bp7JtNwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8977
X-Proofpoint-GUID: OVxErVPukTdYsKGrI3GHH0pi6w_cN8qv
X-Proofpoint-ORIG-GUID: OVxErVPukTdYsKGrI3GHH0pi6w_cN8qv
X-Authority-Analysis: v=2.4 cv=a4Yw9VSF c=1 sm=1 tr=0 ts=6840e2c6 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=qPHU084jO2kA:10 a=8AirrxEcAAAA:8 a=UtyII3912bwPhzYN4sgA:9
 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDAwMiBTYWx0ZWRfX19JyzMB6RM+6
 81iXA5bfhgmInz8AAa3onjmCWqEyNf0wh3gBslP68jotfbog1vhaJ8Q77W4+1GHQ95I6Q9Xxniz
 shHOLZlxir9nY7/NkUsyHBfZX8pP5vQ/PJ2l6acRc+CbDoLAD7e3jWHuB7vCDgcPufGsZbrwChf
 m5x4r6BCMzNelrhX2le3NIxxPq58SMKTryzqHMvgVrkKVJ08pYWMasUM/24kD49ZoRpqlFU4WWW
 TT/D9zdQTVZYeiSjQazBPhzAo7wrK2RNRo8h1SSkoncHdk7P/WrP+tev4TRXnqJlAh+u9yYMh48
 2ft5t3YCiWLbvfPnzf2vAvECQsJZEi1tm0UwJAOVf8NfP0heNFmtfn56P41pEXwFj/dfD3JNvxh
 io2dI/ImYB6622fX7zhCxqmD7aPH8MeQ+iIUami3WKL2pNielvPF+rdT4oIJPk9zHGOx8B4J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_05,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 phishscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000 definitions=main-2506050002

T24gVHVlLCBKdW4gMDMsIDIwMjUsIEZyYW5rIExpIHdyb3RlOg0KPiBPbiBUdWUsIEp1biAwMywg
MjAyNSBhdCAwMToyMzowM0FNICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gSGksDQo+
ID4NCj4gPiBPbiBNb24sIEp1biAwMiwgMjAyNSwgRnJhbmsgTGkgd3JvdGU6DQo+ID4gPiBBZGQg
bGF5ZXJzY2FwZSBkd2MzIHN1cHBvcnQgYnkgdXNpbmcgZmxhdHRlbiBkd2MzIGNvcmUgbGlicmFy
eS4gTGF5ZXJzY2FwZQ0KPiA+ID4gZHdjMyBuZWVkIHNldCBzb2Z0d2FyZSBtYW5hZ2VkIHByb3Bl
cnR5IHNucHMsZ3NidXNjZmcwLXJlcWluZm8gYXMgMHgyMjIyDQo+ID4gPiB3aGVuIGRtYS1jb2hl
cmVuY2Ugc2V0Lg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFuay5M
aUBueHAuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgZHJpdmVycy91c2IvZHdjMy9LY29uZmlnICAg
ICAgICAgICB8IDEwICsrKysrDQo+ID4gPiAgZHJpdmVycy91c2IvZHdjMy9NYWtlZmlsZSAgICAg
ICAgICB8ICAxICsNCj4gPiA+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtbGF5ZXJzY2FwZS5jIHwg
ODggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiA+ICAzIGZpbGVz
IGNoYW5nZWQsIDk5IGluc2VydGlvbnMoKykNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvZHdjMy9LY29uZmlnIGIvZHJpdmVycy91c2IvZHdjMy9LY29uZmlnDQo+ID4gPiBp
bmRleCAzMTBkMTgyZTEwYjUwLi4xM2E4NmNmMDNiOTRiIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJp
dmVycy91c2IvZHdjMy9LY29uZmlnDQo+ID4gPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL0tjb25m
aWcNCj4gPiA+IEBAIC0xNTAsNiArMTUwLDE2IEBAIGNvbmZpZyBVU0JfRFdDM19JTVg4TVANCj4g
PiA+ICAJICBmdW5jdGlvbmFsaXR5Lg0KPiA+ID4gIAkgIFNheSAnWScgb3IgJ00nIGlmIHlvdSBo
YXZlIG9uZSBzdWNoIGRldmljZS4NCj4gPiA+DQo+ID4gPiArY29uZmlnIFVTQl9EV0MzX0xBWUVS
U0NBUEUNCj4gPiA+ICsJdHJpc3RhdGUgIk5YUCBMYXllcnNjYXBlIFBsYXRmb3JtIg0KPiA+ID4g
KwlkZXBlbmRzIG9uIE9GICYmIENPTU1PTl9DTEsNCj4gPiA+ICsJZGVwZW5kcyBvbiBBUkNIX0xB
WUVSU0NBUEUgfHwgQ09NUElMRV9URVNUDQo+ID4gPiArCWRlZmF1bHQgVVNCX0RXQzMNCj4gPiA+
ICsJaGVscA0KPiA+ID4gKwkgIE5YUCBMQVlFUlNDQVBFIFNvQyB1c2UgRGVzaWduV2FyZSBDb3Jl
IElQIGZvciBVU0IyLzMNCj4gPiA+ICsJICBmdW5jdGlvbmFsaXR5Lg0KPiA+ID4gKwkgIFNheSAn
WScgb3IgJ00nIGlmIHlvdSBoYXZlIG9uZSBzdWNoIGRldmljZS4NCj4gPiA+ICsNCj4gPiA+ICBj
b25maWcgVVNCX0RXQzNfWElMSU5YDQo+ID4gPiAgCXRyaXN0YXRlICJYaWxpbnggUGxhdGZvcm1z
Ig0KPiA+ID4gIAlkZXBlbmRzIG9uIChBUkNIX1pZTlFNUCB8fCBDT01QSUxFX1RFU1QpICYmIE9G
DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9NYWtlZmlsZSBiL2RyaXZlcnMv
dXNiL2R3YzMvTWFrZWZpbGUNCj4gPiA+IGluZGV4IDgzMGU2YzllNWZlMDcuLmNkNjM1Yjc3OTAy
ZmIgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL01ha2VmaWxlDQo+ID4gPiAr
KysgYi9kcml2ZXJzL3VzYi9kd2MzL01ha2VmaWxlDQo+ID4gPiBAQCAtNTQsNiArNTQsNyBAQCBv
YmotJChDT05GSUdfVVNCX0RXQzNfU1QpCQkrPSBkd2MzLXN0Lm8NCj4gPiA+ICBvYmotJChDT05G
SUdfVVNCX0RXQzNfUUNPTSkJCSs9IGR3YzMtcWNvbS5vDQo+ID4gPiAgb2JqLSQoQ09ORklHX1VT
Ql9EV0MzX1FDT00pCQkrPSBkd2MzLXFjb20tbGVnYWN5Lm8NCj4gPiA+ICBvYmotJChDT05GSUdf
VVNCX0RXQzNfSU1YOE1QKQkJKz0gZHdjMy1pbXg4bXAubw0KPiA+ID4gK29iai0kKENPTkZJR19V
U0JfRFdDM19MQVlFUlNDQVBFKQkrPSBkd2MzLWxheWVyc2NhcGUubw0KPiA+ID4gIG9iai0kKENP
TkZJR19VU0JfRFdDM19YSUxJTlgpCQkrPSBkd2MzLXhpbGlueC5vDQo+ID4gPiAgb2JqLSQoQ09O
RklHX1VTQl9EV0MzX09DVEVPTikJCSs9IGR3YzMtb2N0ZW9uLm8NCj4gPiA+ICBvYmotJChDT05G
SUdfVVNCX0RXQzNfUlRLKQkJKz0gZHdjMy1ydGsubw0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdXNiL2R3YzMvZHdjMy1sYXllcnNjYXBlLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtbGF5
ZXJzY2FwZS5jDQo+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+ID4gaW5kZXggMDAwMDAw
MDAwMDAwMC4uZDA5M2YxNzhlMWUzNQ0KPiA+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ID4gKysrIGIv
ZHJpdmVycy91c2IvZHdjMy9kd2MzLWxheWVyc2NhcGUuYw0KPiA+ID4gQEAgLTAsMCArMSw4OCBA
QA0KPiA+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4gPiArLyoN
Cj4gPiA+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjAgTlhQDQo+ID4gPiArICovDQo+ID4gPiArDQo+
ID4gPiArI2luY2x1ZGUgPGxpbnV4L29mLmg+DQo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L29mX2Fk
ZHJlc3MuaD4NCj4gPiA+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+ID4g
PiArI2luY2x1ZGUgPGxpbnV4L3VzYi9vZi5oPg0KPiA+ID4gKw0KPiA+ID4gKyNpbmNsdWRlICJj
b3JlLmgiDQo+ID4gPiArI2luY2x1ZGUgImdsdWUuaCINCj4gPiA+ICsNCj4gPiA+ICtzdHJ1Y3Qg
ZHdjM19scyB7DQo+ID4gPiArCXN0cnVjdCBkZXZpY2UgKmRldjsNCj4gPiA+ICsJc3RydWN0IGR3
YzMgZHdjOw0KPiA+ID4gK307DQo+ID4gPiArDQo+ID4gPiArc3RhdGljIGludCBkd2MzX2xzX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gPiArew0KPiA+ID4gKwlzdHJ1
Y3QgZGV2aWNlX25vZGUgKm5wID0gcGRldi0+ZGV2Lm9mX25vZGU7DQo+ID4gPiArCXN0cnVjdCBk
d2MzX3Byb2JlX2RhdGEgcHJvYmVfZGF0YSA9IHt9Ow0KPiA+ID4gKwlzdHJ1Y3QgcHJvcGVydHlf
ZW50cnkgcHJvcHNbMl0gPSB7fTsNCj4gPiA+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYt
PmRldjsNCj4gPiA+ICsJc3RydWN0IHJlc291cmNlICpyZXM7DQo+ID4gPiArCXN0cnVjdCBkd2Mz
X2xzICpsczsNCj4gPiA+ICsJaW50IHByb3BfaWR4ID0gMDsNCj4gPiA+ICsJaW50IHJldCA9IDA7
DQo+ID4gPiArDQo+ID4gPiArCWxzID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigq
bHMpLCBHRlBfS0VSTkVMKTsNCj4gPiA+ICsJaWYgKCFscykNCj4gPiA+ICsJCXJldHVybiAtRU5P
TUVNOw0KPiA+ID4gKw0KPiA+ID4gKwlscy0+ZGV2ID0gJnBkZXYtPmRldjsNCj4gPiA+ICsNCj4g
PiA+ICsJbHMtPmR3Yy5kZXYgPSBkZXY7DQo+ID4gPiArDQo+ID4gPiArCXJlcyA9IHBsYXRmb3Jt
X2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7DQo+ID4gPiArCWlmICghcmVz
KQ0KPiA+ID4gKwkJZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCAtRU5PREVWLCAibWlzc2luZyBt
ZW1vcnkgcmVzb3VyY2VcbiIpOw0KPiA+ID4gKw0KPiA+ID4gKwlpZiAob2ZfZG1hX2lzX2NvaGVy
ZW50KG5wKSkNCj4gPiA+ICsJCXByb3BzW3Byb3BfaWR4KytdID0gUFJPUEVSVFlfRU5UUllfVTE2
KCJzbnBzLGdzYnVzY2ZnMC1yZXFpbmZvIiwgMHgyMjIyKTsNCj4gPiA+ICsNCj4gPiA+ICsJaWYg
KHByb3BfaWR4KQ0KPiA+ID4gKwkJcmV0ID0gZGV2aWNlX2NyZWF0ZV9tYW5hZ2VkX3NvZnR3YXJl
X25vZGUoZGV2LCBwcm9wcywgTlVMTCk7DQo+ID4gPiArDQo+ID4gPiArCWlmIChyZXQpDQo+ID4g
PiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgImZhaWwgY3JlYXRlIHNvZnR3YXJl
IG1hbmFnZWQgcHJvcGVydHkgbm9kZVxuIik7DQo+ID4gPiArDQo+ID4gPiArCXByb2JlX2RhdGEu
ZHdjID0gJmxzLT5kd2M7DQo+ID4gPiArCXByb2JlX2RhdGEucmVzID0gcmVzOw0KPiA+ID4gKwly
ZXQgPSBkd2MzX2NvcmVfcHJvYmUoJnByb2JlX2RhdGEpOw0KPiA+ID4gKwlpZiAocmV0KQ0KPiA+
ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJmYWlsZWQgdG8gcmVnaXN0ZXIg
RFdDMyBDb3JlXG4iKTsNCj4gPiA+ICsNCj4gPiA+ICsJcmV0dXJuIDA7DQo+ID4gPiArfQ0KPiA+
ID4gKw0KPiA+ID4gK3N0YXRpYyB2b2lkIGR3YzNfbHNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQo+ID4gPiArew0KPiA+ID4gKwlzdHJ1Y3QgZHdjMyAqZHdjID0gcGxhdGZv
cm1fZ2V0X2RydmRhdGEocGRldik7DQo+ID4gPiArDQo+ID4gPiArCWR3YzNfY29yZV9yZW1vdmUo
ZHdjKTsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9k
ZXZpY2VfaWQgb2ZfZHdjM19sc19tYXRjaFtdID0gew0KPiA+ID4gKwl7DQo+ID4gPiArCQkuY29t
cGF0aWJsZSA9ICJmc2wsbHMxMDI4YS1kd2MzIg0KPiA+ID4gKwl9LA0KPiA+ID4gKwl7fSwNCj4g
PiA+ICt9Ow0KPiA+ID4gK01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG9mX2R3YzNfbHNfbWF0Y2gp
Ow0KPiA+ID4gKw0KPiA+ID4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGR3YzNfbHNf
ZHJpdmVyID0gew0KPiA+ID4gKwkucHJvYmUJICA9IGR3YzNfbHNfcHJvYmUsDQo+ID4gPiArCS5y
ZW1vdmUJID0gZHdjM19sc19yZW1vdmUsDQo+ID4gPiArCS5kcml2ZXIJID0gew0KPiA+ID4gKwkJ
Lm5hbWUgICA9ICJscy1kd2MzIiwNCj4gPiA+ICsJCS5vZl9tYXRjaF90YWJsZSA9IG9mX2R3YzNf
bHNfbWF0Y2gsDQo+ID4gPiArCX0sDQo+ID4gPiArfTsNCj4gPiA+ICsNCj4gPiA+ICttb2R1bGVf
cGxhdGZvcm1fZHJpdmVyKGR3YzNfbHNfZHJpdmVyKTsNCj4gPiA+ICsNCj4gPiA+ICtNT0RVTEVf
QVVUSE9SKCJGcmFuayBMaSA8ZnJhbmsubGlAbnhwLmNvbT4iKTsNCj4gPiA+ICtNT0RVTEVfTElD
RU5TRSgiR1BMIik7DQo+ID4gPiArTU9EVUxFX0RFU0NSSVBUSU9OKCJGcmVlc2NhbGUgTGF5ZXJz
Y2FwZSBVU0IzIENvbnRyb2xsZXIgRHJpdmVyIik7DQo+ID4gPg0KPiA+ID4gLS0NCj4gPiA+IDIu
MzQuMQ0KPiA+ID4NCj4gPg0KPiA+IElzIHRoaXMgc29tZXRoaW5nIHRoYXQgY2FuIGJlIGVuaGFu
Y2VkIGluIGR3YzMtZ2VuZXJpYy1wbGF0IGdsdWUgZnJvbSBaZQ0KPiA+IEh1YW5nOg0KPiANCj4g
WWVzLCBJIGNhbiBiYXNlIG9uIFplaHVhbmcncyB3b3JrIHdpdGggbGl0dGxlIG1vZGlmeS4gUGxl
YXNlIGxldCBtZSBrbm93DQo+IHdoZW4gaGlzIHBhdGNoIG1lcmdlZC4NCj4gDQoNClN1cmUgdGhp
bmcuDQoNCkJSLA0KVGhpbmg=
