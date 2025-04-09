Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C351E7C1C;
	Wed,  9 Apr 2025 21:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744235548; cv=fail; b=WOmwxg5YnzZSIVFk1aNpkCXTbpYhWQTGOICnai9mmKzqM0My3lc4rL230jwFctLrQSE8+vsNhR3FQ4G2bjp7SenHlMhzDKOdHQ0HgROjbh4CLXwdnA/AQwbug2AKgYOlETqjAbudD7oqdVgtH+m6uo5jQnxDQWNZXBHKXwkE3SU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744235548; c=relaxed/simple;
	bh=a42Fi4Z/agbE/RBHbJslv2RFyeknCYi2xqAqnigmFZQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h9UbNanWfJ9buO7lXd+0oMgXx/Jcg1JAc2q65gJPoD4CtGEIEcpP7dKdYiCKSFJiZ5k4cbVVVMgwI8cAkYBrOvYD6g1HJq6Ejn442IlSAA9JUx6sZiKqqi50XUpRfesUriQRNf3E2K8RXm3yb0Tq5JqAw/CTeKhXU31mPYycKy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GgiQOKlZ; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=gjRjiJ9X; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=SOt4Wj55 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GgiQOKlZ";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gjRjiJ9X";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SOt4Wj55"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539KD6AT013391;
	Wed, 9 Apr 2025 14:52:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=a42Fi4Z/agbE/RBHbJslv2RFyeknCYi2xqAqnigmFZQ=; b=
	GgiQOKlZJo8EVZREJClFKy8+H23XwFHsv+ZMhN5JB/AIiEhptMRgEF4++XpjU3NC
	G/hPwHXWwgihUE54nAEU/see9gNez2Y3GucAoQscR0pN69lcFgma8d1LpZ2wUy6T
	mdzzCnamGyQhaixs8laaytCuJ9+jSuKnpxVZ7Yca0IckHnlNjg15MMORc8Zd1RKt
	GGDcVMkDopNK9V0ZxZT510E8naFBrp2cZr0Mi1WEYFz9492waA3QPOnllqiGPl0D
	PM6DCDv/7+G/w+oKma7IHPJ8C7zVrMqIYaBJ6L8dhfMNjT27vaF3eVwLeJJ2WlGP
	q25qlgjNwaPaFpTgYJKr0w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 45u3hprc33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 14:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1744235521; bh=a42Fi4Z/agbE/RBHbJslv2RFyeknCYi2xqAqnigmFZQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=gjRjiJ9X6MculkGBzZOc8fwG9iKuOkftSKDrIW9+u55JLvSgGNTbyzvoUazx/ZZrI
	 iUfVvFjFLNHLBRUVMhOgfWIwTf/WRmFX02EK6Inp4HbFnyajnSCvebtWPbIIwb2+C+
	 OfnezMrS8G859AYwdITHfNyaWR83UVGX/RcYtPDZdEtr2ajHqLL8j5Dz4qy/CfvtdV
	 bTCDjqewScMBuhUfvQmo1DekJi8+NuxnCk35hsXBqBK4EA2czjBMGG0KpFG9M9UNwk
	 Wh8dOB8f3CFHgeLLQssHkuWpLO2XaKxf3hZDwTgnji7Na9+8LAdIO+q/VNBh2RhXc6
	 l1zGjLDUmqu+Q==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0C1184035B;
	Wed,  9 Apr 2025 21:52:00 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 3E966A006F;
	Wed,  9 Apr 2025 21:52:00 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=SOt4Wj55;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id ECB0E401D0;
	Wed,  9 Apr 2025 21:51:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMS5CxX3wR3tqNbVl+N+bJf/bYG9lpP5+3+YhlT7O/xdvKglpAE2Q4XNx2CLJfLGYpoHtqvyoCBeSZptWeZfeKSNoB06OFmwVzUhv7J1r0EEcmNjCJwPo/EpTLarZNOCLpczcHmV7pT6Q7Cog9tfmaJrpXjr8gRIY0p81diwAflM9ON6pIzZq+qT8MquxVV+tyzQ8yQKY/PgFqqRHQEpFSNahyHiYqgqo4oPVo9yfKf849cUvW59ibyrkVggwRbxFne+z85H/lXuoAs9EJoMQJkrCrxosXk2M5lhnrvBCg9oTtSQmIW7WTHiOCAHKo/HIB4f1D+F7NKhVezRL2oUpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a42Fi4Z/agbE/RBHbJslv2RFyeknCYi2xqAqnigmFZQ=;
 b=whGoK3/eJE71j1whkI4RDgA90/A2uVdBMa5jRmhxbO0XnY77VEDHkowO6IP2VxH3pil69wgYqfM4EWY8pVXnwtds4cEoseMUZ6z9WOA3XOcFMH6KVUOPDVkDI3860AwhFWKB1omibG7LgmgnEn5vMYxk36IkuuCMhRep5D/R0GsSYnAc8M6Yvv5hGT1lF6bVOPtZqqG2bw4MLfP6M6ubWoMfR3FfMtqrrLRN7SwXnk+GbS6mnD0dCb4zIiYJ22wYRxICtUlepUMnmF2dep1iCGpiZiQRcu5Bq5oMCvZKrIr3VC1RrIS4MOWC2gpH+w8NFV4MyZJ58segkefz8+mIkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a42Fi4Z/agbE/RBHbJslv2RFyeknCYi2xqAqnigmFZQ=;
 b=SOt4Wj55xYDh0ekPd/jkT+m9iOKUUrnJugcoWpTPNI5ylldBehAAyiXiah/JNZ/A2JByiXtIkRlB5fvAylNZnHhxmcdbhYAxPGwOXlwAtFe38Rx8M61izL/sDN+Hm1b7tLlBvzDD5PrNLjM4/N5BheBHmI/SNd94HIqt9Lyg+a4=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS7PR12MB8084.namprd12.prod.outlook.com (2603:10b6:8:ef::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.34; Wed, 9 Apr 2025 21:51:55 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.8632.021; Wed, 9 Apr 2025
 21:51:55 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Bakker <kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable@kernel.org" <stable@kernel.org>
Subject: Re: [PATCH v1 3/3] usb: dwc3: gadget: Make gadget_wakeup asynchronous
Thread-Topic: [PATCH v1 3/3] usb: dwc3: gadget: Make gadget_wakeup
 asynchronous
Thread-Index: AQHbpIi7c9+1pUhKXE+zN5SY3VBPMrOY4xyAgABjf4CAAUEnAIAAOxcAgAEnSIA=
Date: Wed, 9 Apr 2025 21:51:54 +0000
Message-ID: <20250409215151.thkmgzyeohyxhslh@synopsys.com>
References: <20250403110805.865311-1-prashanth.k@oss.qualcomm.com>
 <20250403110805.865311-4-prashanth.k@oss.qualcomm.com>
 <20250407233757.jmtohzgm4xebjndn@synopsys.com>
 <10bf04c1-f040-4646-9484-70827db36d27@oss.qualcomm.com>
 <20250409004330.iflfdxabodalsmox@synopsys.com>
 <468898dd-8b57-4fb5-bef1-d47ffbc38846@oss.qualcomm.com>
In-Reply-To: <468898dd-8b57-4fb5-bef1-d47ffbc38846@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS7PR12MB8084:EE_
x-ms-office365-filtering-correlation-id: b9414f8f-01b0-4076-0a5e-08dd77b0be77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NXJnbUFFb21wT2lIQW9UYkhIaGxHeFNiQ0UrRDBJOEY4NFE5cGtGL3JsNTJn?=
 =?utf-8?B?S01ITzdDYTFlRUtpdVVNa013Y0VTVFhsbndnSHFPMndIYkhNcUFPbDVMMXgv?=
 =?utf-8?B?SkRqcDdiSTFrVVl4QmNUblNyMzUvNEpuMnB6QkFzVUg3TDBMSWNrb2hQaUlU?=
 =?utf-8?B?dkxpZjJQVjdjbWFibEdiNHBQaTRwYmRVQm5BQXRXQnpMRkxFWVFXUjBxdkIx?=
 =?utf-8?B?LzF5aU55T1dLaVZWZkJ6VzEyMDZpVGdoQTErRVh1VzNrRmgrYVo5b29RbU1i?=
 =?utf-8?B?QkMyZjNyY04xUFhMMnFKckdKc1FGeWhiRCs2VUNPRGQzMlpCRGZOdE1BdDF1?=
 =?utf-8?B?dXV6enZpdXJvWlRJdkFSV25lSGJaNllEZ2kvbDNVWGJxOFhyQkIweXJsM05M?=
 =?utf-8?B?My9DbWhGaFBxWmNaT24xdVVVa01rMEVPZDVXdmJhWHVlV0pPR3RtVVZoM1JK?=
 =?utf-8?B?MlRRVW9zSGJQZUFBdDhWR2xUYldtSXBIYi8rNDk1aG9ZZmUwVE85Zkh2dnpJ?=
 =?utf-8?B?Mk8rZjNFMHlFOWZhN1VmUDV3QXE5ZThKVUdIbjRpdGt0Szd0cW83dUFMZUt0?=
 =?utf-8?B?TGNncVhqWEtwdTlvSTRXYVhveG5YZi91Njg4VFEzSUVNa215dHJXYk15QVdu?=
 =?utf-8?B?RTZaQ3JTd1FlMUxCMERaWS9jbHo5Nnd3Z0o2WjY3bENJTTQxQlhXcUpDdXph?=
 =?utf-8?B?UlU2VXBDM2RrVEdlSjRiS1VlbWJXRHNmbGF3czBPUG92SmJvOU9lNUMvYVJq?=
 =?utf-8?B?Ny9Ja2kxWUxqZnl6QWYzeW4xNjVwSFV4L0ZXZ21SaUZSQmxMRlZQdWRNV0F3?=
 =?utf-8?B?U2NFOVlvVTlwWmhTaGJWWmtOT1IvYVVzRWpWcm8wMllTTmdsaVNybCtLTnQ4?=
 =?utf-8?B?M1dsOHAvVzQyNzNHbmc5U2pqWDZ4cVdZTE9XNVpUZGZiSzVEYkhMMjJhZGx1?=
 =?utf-8?B?QlhlaHczR25TcFY4Y05HMEpNbURKUUtVdHVJOXdlU1FDeExOWlU1Qmpjakt2?=
 =?utf-8?B?dk1XdXFiM3pDeUljc0dHM1MzMGUwTEtjZGcvYmYxb2xWaFlKTjJiSCtkN2Fh?=
 =?utf-8?B?NmhqOFdZYXQ2ZEN6V2s3bG1QM0wvK1NqQllta0ZHVGtQeUwyK0JFU2hSZnRT?=
 =?utf-8?B?ZE9RSjQ5VnViNTZvdnRUUzlUSi9Hd3ppRnlhTzJMVEYwekQwbDJoZGVENzVi?=
 =?utf-8?B?ZXpGSzc2NjhNT0xObWl6YXU2cThqb01FcDJpbnFjYzc1K294MU5DOUpyN0pY?=
 =?utf-8?B?Z1lSOGxFVUFxY3RuUkliNDJIUHJLcFpZU0NRQTBwN2dlbTI5c0xxczBUcjZS?=
 =?utf-8?B?UUpYa1JQbjR6SXlHcE9PNGtkYTNnZHBKVjhxNnBXUmVISWtKMzl1bjJDK1I0?=
 =?utf-8?B?UG9wajdZQUV5Q1JmT1JWemo5VVZMUkZpb3o1WHNJL3NrbjBqR215UlRLcjZw?=
 =?utf-8?B?T0NxUjVPZkNSQzlpWlVtNDJ2T0VNUWRTK09qY3hhZGFZTG1obEJYajNPbWpZ?=
 =?utf-8?B?RitmZnFLamduVE1VRDNYMTNxamF6MHQzaFJoNmpKLzVnQkFaV0xDbllGdFNz?=
 =?utf-8?B?Ni9LV2hXd1Z2VkE0WHFldGFlMUxKZ2t0MlBsNmErZ2RKQjZnRW5TU1lkUjhS?=
 =?utf-8?B?MndzaG9kUExISmkxM1E2Uk80bmpmM0IwTG5idjJjUGVWdDlDN2dRV283WVNY?=
 =?utf-8?B?MXNSZlI3OXJBZ2V6c2tVUlkvcVU1aXNmUFlrRmVJYmdYQzFCaGZmYmJSbmFm?=
 =?utf-8?B?Tlpmc1FncU1MUzVqc3plbFNqTUFGejR0RDN4Y0FLeWg2b0dqRjhJK1hydG82?=
 =?utf-8?B?cEFUampaN2RBcjFrUG84T3NxWkRXOTlWNzdIK2RSM3lhZ0tPcEppUUgrRkNa?=
 =?utf-8?B?ME4va1R4REJrMEF6R2JjQXY5TzQxUUh6bFhQOXBXcU9kcXkyOEx4ejgxR1Yv?=
 =?utf-8?B?bmZSS3ZFK1NvRk0wemtMWGxobjFUdEMvZWxIMnBqK1pvSGhScnpuS3Z2cGpC?=
 =?utf-8?B?T2tiVXVKRkF3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZHQ2TFpaN2Z5RlZGVnFyNkFYclg1aHB1cWxvbE5zc0RQLzVESlJIVEJUVGJl?=
 =?utf-8?B?Zy9NUmY2WGxnVVcrdUR1Y3pVQzlFOURUMmlDYk9nVmJWMEdNNys3Q3d3WHgr?=
 =?utf-8?B?TXBuWEZhOWVCV3lnNWNxNis1cjJpNzRNQjZ5dmw1aGhVczgyUUpkZFJGV2Jl?=
 =?utf-8?B?cnpkcERQaXN0VHFLSWhRc0E2bTJZYVZicGdiQmZEYVE4dGlNUDZkL3N5ZnVQ?=
 =?utf-8?B?aUtpRWxvM2k1ZXNpUkwvWHdraWxXdGN5NUozT294QW1HeGhGeUhuajZNbUVT?=
 =?utf-8?B?NFE0REhxZE1sbkVmUXB3T1hwNWhXQTRYSC9wY2grRmExY05QdjJWeFM0MTl2?=
 =?utf-8?B?OHFYS0crdjQrdGQyVW01dkp1MDlydnhrM2N4d1kzaXNMQ29kQ0JhbjdHbVBK?=
 =?utf-8?B?Z2tkTGRCaEhEay9xZTgrRTBrNitJU040WVAybDVlM21Tdy8rYkZjdFNLMEow?=
 =?utf-8?B?MWs4b2J6NGVpNEFJUHVzR0Raa0tmcnlNRXFwUlRPV3lacklHc0QzS3M5OUZh?=
 =?utf-8?B?K2ZJMEkzUVM0Zzg5TktNaFRwYjRTRW5jbU9PMWUxTVNBYVgvSHZobFc0bWJJ?=
 =?utf-8?B?M1J1ME56eExySUxiL3JrUDBPd05YTU1ZVk1SbzU0alA1dlZ1UmMzV3hXVU5s?=
 =?utf-8?B?YTRiRUIyajZqQjROOWNqNjBLcW92N3k4V1JuRmgzQjJIcGhJaHkyVGpjZHJQ?=
 =?utf-8?B?cEJRbG41OVZleThGd25yZVVFNGtVNjVpOGJ0cGlLVWx3bXd5OFhjTEc1Zldw?=
 =?utf-8?B?Yy9LQlBUNC9ZNUZvb09uOVFTRVBzdmNZM3MzcktrcG10SkZ4eENxT3FNWUho?=
 =?utf-8?B?QjFISHlHd3F5aStPSlJCcmFxRUM1aS9MbGh0MkFDbXBJUytBUDkvd0JCRDZa?=
 =?utf-8?B?TkNEM2I0QmtzUUFxVnJ0bllodDB1UlB2UGhjQ01SOVJXVi9qVDNYdVhVYy9r?=
 =?utf-8?B?VEM0Q0NranZhSmZidms2aVdibUxPYzlaS1pyRDhkMWd1OE8zbjdON1IyRm5a?=
 =?utf-8?B?RkV2SW4vME03NU5IdWI5RUkvOVdLd2ZUS0RzWVMyR2ZFSURXRCtySUFpa3dM?=
 =?utf-8?B?bXZUZjlJclJHWFRsVytFeDF0ZEhNQ3V4dnRZYTV6WEtmeFk0dkJ6WjBtVUxq?=
 =?utf-8?B?bHdSNkZMeWExUVdSNm9EU1JMb1o2MGtEM2c1aXJjZ0RPeW9rKzFLandHbVMr?=
 =?utf-8?B?Z3EwREp6eGoxNVg4UHhLTzE4Wk9wSW0zWDZQcjQvSkF1Vm5tclBKQjlIRHMy?=
 =?utf-8?B?M2haZ3pPcWxWemVwQk4vNGdTcjVBMncvZFc0WEgxRGRFM3pyRDhRUlAzYUdL?=
 =?utf-8?B?VXl5cVFXOC90MU9NWEVhT1RONlNaWlBqbC9LN2ZhNFRpWTN6cE01Z2VFakpR?=
 =?utf-8?B?SnppMWNJR1JnWG1Bak4wWThnMnd3K1pHTFA5dDg4R0ozcGg1U0J2emtHMHZu?=
 =?utf-8?B?Q3MySW1YTjlDS1JJL3dOV1huNDNleGdWTE1PWWZydDRUaU5hVWx4bWhxclpU?=
 =?utf-8?B?MnF0SENLN1RnVWRNVkRaVW00Qis4d2xsY3BXdnY2RnBISUlPUSswOHRHRlFN?=
 =?utf-8?B?Q0Iwelo1VkV0Umd4U1hLMHJVV3cwbFdodFp6RTlnbDRpc1diM2RYZFdoUitE?=
 =?utf-8?B?Q000Z1Z0dEdJa2JUdy80c2JpTS8xVjFtSEF2UW9qMzZxZzlyVlJ0dlBqU2pt?=
 =?utf-8?B?NGlIOHcwblhmd21mN2R1MmI3UDFkZjh3akdNRU1DcmVqV3NaTmpjN1dYM0Nr?=
 =?utf-8?B?VEMrQ3dpa01TaGlFYXBjTmJocHNxb0g0L1ZDaUJ4NW9mR2xYcE1QaFowdTZI?=
 =?utf-8?B?djhkcHBlWVBwNENHY0twSTNVd1E3amJ0Qi9TWUNRTVVNOTBPaVlIRHk1bXh1?=
 =?utf-8?B?NUlmSHoyUFNMejlVUTFxekp1em1DU0M4RndYdnVMeXlkd1pTNnQwTExVM2Vm?=
 =?utf-8?B?S1FIdmJEajhvRUtxTVo0bnM4L2V0ZkZWdlg4RmlCaW1pbld4R3VGQUhLd2cw?=
 =?utf-8?B?ZWQ1RmhNcnJKUEZ2VzAxSndjaEh4REcrc0t1aThjRlRIMDQwbXJFNStCRDVp?=
 =?utf-8?B?WDVqZDlEYlQ5WVVZQ0RPVVVCeEIvdGxWdldtZkZiU2ovY1pOSDE5MkFsNEo1?=
 =?utf-8?Q?xSRph4cjbeQe/xK2Ci1+b8GAs?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <916EF8B40BFA784F8A85E928AA63D9BF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	a9/1atip4esLrnSArxyu5okVIHeuRAtyVl3TudnfQgsYt70XscmQT/7i+9dRFRa7sQbilb3+kAM7DTQO893hQpQEtA0QPlXQ8Iqd4wBjB7zslZXcsUf1Q6piQdwncsimR6ZkPKMrQsd/Hdbwx42kqgCl2sCpbdD2lNII9KHZgoOwJELkhsZcTWWhdVFrHAQm78W1hQncZErTX5AfgkfuqHGonbLb6Twt5t83rvB75IakHxXI5zEmFPNJ/RtsoECxQHgKgWxFnh0vuvczKWAQrcOlqlWlJMIsnkRsjvuDvulTS2I/XmHhQ43qANcn3csbJW/GR1f2cqtYR+I+EDlsVjnIdeQ6/ow3sz3aUqsx7d8FqcEaMhkhhLL8lhX3UU8HHibuKgJ45k4fxXO48zG5IPdv17f0/ghLwQ3tqAHsfRuQxwsMlPBGVSTRDt7cEOOTuLsF+SbUVlihCsTBjEKlnmjUleHpb+o7T66C6Cpmx73uywAYhcnN1Ejo8OHRVeyVmWS8VwVRGJDYtfRpY+xG+bIdf8MOsh/CtF4uNwPsVaQOqinTDa1rmk/QEqIcVLySHDZlyY8zbxOnLXWUvjqlxfId+cF9ekr7ZYCpLfQmCm/83qSKIoVYPdIqIDZt7foD9ZY32ophHzGn98C4IrR5QQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9414f8f-01b0-4076-0a5e-08dd77b0be77
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 21:51:54.9781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OGQgs7ydaCiBc/SbNFZ4hw1DT7ZTEsG2JbVaYGhpVVw6nEyyJt4VJ5tYs/tQjXxs4V3P6vYgA6EbcW8APUBQLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8084
X-Proofpoint-ORIG-GUID: LbYPj62EzEYnO8QL2SAJbWl-7L1EBXoc
X-Authority-Analysis: v=2.4 cv=XIAwSRhE c=1 sm=1 tr=0 ts=67f6ec02 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=BXmYnPJBBapHJng30vgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: LbYPj62EzEYnO8QL2SAJbWl-7L1EBXoc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504090149

T24gV2VkLCBBcHIgMDksIDIwMjUsIFByYXNoYW50aCBLIHdyb3RlOg0KPiANCj4gDQo+IE9uIDA5
LTA0LTI1IDA2OjEzIGFtLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gVHVlLCBBcHIgMDgs
IDIwMjUsIFByYXNoYW50aCBLIHdyb3RlOg0KPiA+Pg0KPiA+Pg0KPiA+PiBPbiAwOC0wNC0yNSAw
NTowOCBhbSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+Pj4gT24gVGh1LCBBcHIgMDMsIDIwMjUs
IFByYXNoYW50aCBLIHdyb3RlOg0KPiA+IA0KPiA+Pj4+IEBAIC00Mzk4LDYgKzQzNzEsMjEgQEAg
c3RhdGljIHZvaWQgZHdjM19nYWRnZXRfbGlua3N0c19jaGFuZ2VfaW50ZXJydXB0KHN0cnVjdCBk
d2MzICpkd2MsDQo+ID4+Pj4gIAl9DQo+ID4+Pj4gIA0KPiA+Pj4+ICAJZHdjLT5saW5rX3N0YXRl
ID0gbmV4dDsNCj4gPj4+PiArDQo+ID4+Pj4gKwkvKiBQcm9jZWVkIHdpdGggZnVuYyB3YWtldXAg
aWYgYW55IGludGVyZmFjZXMgdGhhdCBoYXMgcmVxdWVzdGVkICovDQo+ID4+Pj4gKwl3aGlsZSAo
ZHdjLT5mdW5jX3dha2V1cF9wZW5kaW5nICYmIChuZXh0ID09IERXQzNfTElOS19TVEFURV9VMCkp
IHsNCj4gPj4+PiArCQlpZiAoZHdjLT5mdW5jX3dha2V1cF9wZW5kaW5nICYgQklUKDApKSB7DQo+
ID4+Pj4gKwkJCXJldCA9IGR3YzNfc2VuZF9nYWRnZXRfZ2VuZXJpY19jb21tYW5kKGR3YywgRFdD
M19ER0NNRF9ERVZfTk9USUZJQ0FUSU9OLA0KPiA+Pj4+ICsJCQkJCQkJICAgICAgIERXQzNfREdD
TURQQVJfRE5fRlVOQ19XQUtFIHwNCj4gPj4+PiArCQkJCQkJCSAgICAgICBEV0MzX0RHQ01EUEFS
X0lOVEZfU0VMKGludGZfaWQpKTsNCj4gPj4+PiArCQkJaWYgKHJldCkNCj4gPj4+PiArCQkJCWRl
dl9lcnIoZHdjLT5kZXYsICJmdW5jdGlvbiByZW1vdGUgd2FrZXVwIGZhaWxlZCBmb3IgJWQsIHJl
dDolZFxuIiwNCj4gPj4+PiArCQkJCQlpbnRmX2lkLCByZXQpOw0KPiA+Pj4+ICsJCX0NCj4gPj4+
PiArCQlkd2MtPmZ1bmNfd2FrZXVwX3BlbmRpbmcgPj49IDE7DQo+ID4+Pg0KPiA+Pj4gVGhpcyB3
b3VsZCBicmVhayB0aGUgYml0bWFwIG9mIGR3Yy0+ZnVuY193YWtldXBfcGVuZGluZy4gUGVyaGFw
cyB3ZSBjYW4NCj4gPj4+IHVzZSBmZnMoeCkgdG8gcHJvcGVybHkgZmluZCBhbmQgY2xlYXIgdGhl
IGludGVyZmFjZSBJRCBmcm9tIHRoZSBiaXRtYXANCj4gPj4+IG9uZSBhdCBhIHRpbWUuDQo+ID4+
Pg0KPiA+PiBZZXMsIHdlIGNhbiB1c2UgZmZzKHgpLiBCdXQgSSBkaWRuJ3QgdW5kZXJzdGFuZCBo
b3cgdGhpcyB3b3VsZCBicmVhaw0KPiA+PiBiaXRtYXAgb2YgZHdjLT5mdW5jX3dha2V1cF9wZW5k
aW5nLg0KPiA+Pg0KPiA+IA0KPiA+IFNpbmNlIHlvdSdyZSBzZW5kaW5nIGRldmljZSBub3RpZmlj
YXRpb24gdG8gYWxsIHRoZSB3YWtldXAgYXJtZWQNCj4gPiBpbnRlcmZhY2VzIGFuZCBub3QgcmV1
c2luZyB0aGUgZnVuY193YWtldXBfcGVuZGluZyBhZnRlcndhcmQsIHRoZSByZXN1bHQNCj4gPiBv
ZiB3aGF0IHlvdSdyZSBkb2luZyBoZXJlIHdpbGwgYmUgdGhlIHNhbWUuDQo+ID4gDQo+ID4gSU1I
TywgZm9yIGNsYXJpdHksIHdoYXQgSSB3YXMgc3VnZ2VzdGluZyBpcyB0byByZXZpc2UgdGhlIGxv
Z2ljIHRvDQo+ID4gcHJlc2VydmUgdGhlIGR3Yy0+ZnVuY193YWtldXBfcGVuZGluZyBiaXRtYXAg
aW5zdGVhZCBvZiBzaGlmdGluZyBhbmQNCj4gPiBvdmVyd3JpdGluZyBpdCwgY2F1c2luZyB0aGUg
Yml0bWFwIHRvIG5vIGxvbmdlciBtYXRjaCB0aGUgaW50Zl9pZC4gV2UNCj4gPiBnZXQgdGhlIGlu
dGZfaWQgZnJvbSB0aGUgYml0bWFwIGFuZCBjbGVhciB0aGUgaW50Zl9pZCBiaXQgZnJvbSB0aGUN
Cj4gPiBiaXRtYXAgYXMgd2UgZ28uDQo+ID4gDQo+IFRoZSBhYm92ZSBsb2dpYyB3b3JrcywgYnV0
IGFzIHlvdSBzdWdnZXN0ZWQgSSdsbCByZWZhY3RvciBpdCB1c2luZw0KPiBmZnMoeCkgYW5kIGNs
ZWFyIHRoZSBpbnRmX2lkIGRpcmVjdGx5IChpbnN0ZWFkIG9mIHNoaWZ0aW5nKS4NCj4gDQo+IERv
ZXMgdGhpcyBsb29rIGdvb2Q/DQoNCkl0IGxvb2tzIGdyZWF0IQ0KDQo+IA0KPiAvKiBQcm9jZWVk
IHdpdGggZnVuYyB3YWtldXAgaWYgYW55IGludGVyZmFjZXMgdGhhdCBoYXMgcmVxdWVzdGVkICov
DQo+IHdoaWxlIChkd2MtPmZ1bmNfd2FrZXVwX3BlbmRpbmcgJiYgKG5leHQgPT0gRFdDM19MSU5L
X1NUQVRFX1UwKSkgew0KPiAJaW50Zl9pZCA9IGZmcyhkd2MtPmZ1bmNfd2FrZXVwX3BlbmRpbmcp
Ow0KPiAJaWYgKGludGZfaWQpDQo+IAkJcmV0ID0gZHdjM19zZW5kX2dhZGdldF9nZW5lcmljX2Nv
bW1hbmQoZHdjLCBEV0MzX0RHQ01EX0RFVl9OT1RJRklDQVRJT04sDQo+IAkJCQkJCQkgICBEV0Mz
X0RHQ01EUEFSX0ROX0ZVTkNfV0FLRSB8DQo+IAkJCQkJCQkgICBEV0MzX0RHQ01EUEFSX0lOVEZf
U0VMKGludGZfaWQgLSAxKSk7DQo+IAkJaWYgKHJldCkNCj4gCQkJZGV2X2Vycihkd2MtPmRldiwg
ImZ1bmN0aW9uIHJlbW90ZSB3YWtldXAgZmFpbGVkIGZvciAlZCwgcmV0OiVkXG4iLA0KPiAJCQkJ
aW50Zl9pZCwgcmV0KTsNCj4gCX0NCj4gCWR3Yy0+ZnVuY193YWtldXBfcGVuZGluZyAmPSB+KDEg
PDwgKGludGZfaWQgLSAxKSk7DQoNCg0KU29tZSBtaW5vciByZXZpc2lvbi4gSG93IGRvZXMgdGhp
cyBsb29rPyAobm90IHRlc3RlZCkNCg0Kd2hpbGUgKGR3Yy0+ZnVuY193YWtldXBfcGVuZGluZyAm
JiAobmV4dCA9PSBEV0MzX0xJTktfU1RBVEVfVTApKSB7DQoJaW50Zl9pZCA9IGZmcyhkd2MtPmZ1
bmNfd2FrZXVwX3BlbmRpbmcpIC0gMTsNCglyZXQgPSBkd2MzX3NlbmRfZ2FkZ2V0X2dlbmVyaWNf
Y29tbWFuZChkd2MsIERXQzNfREdDTURfREVWX05PVElGSUNBVElPTiwNCgkJCQkJICAgICAgIERX
QzNfREdDTURQQVJfRE5fRlVOQ19XQUtFIHwNCgkJCSAgICAgICAgICAgICAgICAgICAgICAgRFdD
M19ER0NNRFBBUl9JTlRGX1NFTChpbnRmX2lkKSk7DQoJaWYgKHJldCkNCgkJZGV2X2Vycihkd2Mt
PmRldiwgIkZhaWxlZCB0byBzZW5kIEROIHdha2UgZm9yIGludGYgJWRcbiIsIGludGZfaWQpOw0K
DQoJZHdjLT5mdW5jX3dha2V1cF9wZW5kaW5nICY9IH5CSVQoaW50Zl9pZCk7DQp9DQoNClRoYW5r
cywNClRoaW5o
