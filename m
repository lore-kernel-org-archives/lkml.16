Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1EF21421A;
	Wed,  9 Apr 2025 22:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744236363; cv=fail; b=qHsWfskPLZ62+tRRQE44zB+Yf39Lf62i3nZw3l/0VUcd5g0mTPSIk4TSJq6Pbuc0q/SRMFDTT2i+EyTREMc33N39l6fnMCVwtIcJJywGeAdSVtlGTg53u4Je5sLB4+OoYq+lRSPHtP/DRgBfN0h6+sD/3vk0M6zx7F+gHFhaNTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744236363; c=relaxed/simple;
	bh=PiU3a5/NiezaBLxrZ/gg6TaYPiavy+iAxxFjuZHKKX8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KGQwuSUeq4r8xk9rze7PkMalFpshCwpZdpEowCwUVxkMgjZeI0gr67+/rgOHpCluEye0KJP+R2veiIinOE/3mpd3qIAVp/7kJmjhBpK2UPVN8kRispNNl4L3F9BrzlePDl55X4hY91TdeiXWQornrm2xNIZLSJSMn/C2SUTCAYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=mLRi5/kE; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Q5nZd51w; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=elSOLeqM reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="mLRi5/kE";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Q5nZd51w";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="elSOLeqM"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539KD74M023846;
	Wed, 9 Apr 2025 15:05:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=PiU3a5/NiezaBLxrZ/gg6TaYPiavy+iAxxFjuZHKKX8=; b=
	mLRi5/kE9xH/PvohlYooR5UQs/8CyOjPMQ9pisaJynNA/IV955J7XbC70ZqWHHey
	AwH6JPxH7G8hEHc9rCxf4r+RyjNRtnn/RNP9FQ0T4lZjDFW2Z2e1STnPK8zmby7N
	tU6gniIBjEo4jUS43u3adCK24ulzjYPQuyE8XRrt2SVtEljEdVly+91SsdeWvVZJ
	/oPDW5IHa3qMT2wr5Dq6DlXGVP7E9YV7CWTlDKawIitWjTahXrjzEiuWqOQrCDl7
	RO5LEMFjBs5WnTEO21YZ9VnUb5Jf5eFJLRlvkd9RTU9dAqv7nkG3gC+3gICIhfVO
	e88cvywEbgKaIe1eWTbKBg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 45u3evgaxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 15:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1744236325; bh=PiU3a5/NiezaBLxrZ/gg6TaYPiavy+iAxxFjuZHKKX8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Q5nZd51w3TnrSdXNUdRL3x+xCK19eB2XmiGWLdznlNaoNPqvhtCN4Vgoo80aS0+oC
	 /Mzj2sp3oNLUQK6HiKAJwMfwQ0XS9IaUGHrtEjwqyiK8j70SbkcCox2nzj9LpegV4S
	 SM6wwRqNQhweaPvNA2Et7Mzd7gwOEnQz9muMpVgHogAfUpynTuQqZSJD0ZUtRQbH+O
	 G0RcWDwNEJ4wXmocs2Yw+GJ3jK7jACUHJXQkj0YxAe7ktSKiNafrh4uivlVG8URwxp
	 S8nmvIAPiDykTJDlW8O4cUtZfD4nn47ZJBsodtK3rihhKs2tdaLFROMGKPENtEI+Gk
	 RAM/Ok0f4J+aw==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E10354035B;
	Wed,  9 Apr 2025 22:05:24 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 2C431A006F;
	Wed,  9 Apr 2025 22:05:24 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=elSOLeqM;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 58BA74034D;
	Wed,  9 Apr 2025 22:05:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vdl+xCWh3KdjlEsf8zckTghfp3K64G24XNB54ixFF8vEm0HMjz1hCF70qOhd4k13nDlUFH63XwJhi9UF9LGvRrg15p1kEwHd2QBTZ2rnbzp/tRXRWpXe/Foin8obiQwXVM7D6QYynrxWwJdt+syIE8MIGE0+YndBMHPpIqY4eOkhr/MIIsZ5YzVO2qcE4b8tivqh0ZVmH8NlBxx3VPcGneFIujZ0VBB0dApKBhaGpJ9bW+QzAJlNH8YdKTK45J1VcW8iDM5giiPBuuZ8EGyAqjetDa+KChCmCKSy7TqnrP984yND9l6OcVcFN6Je0wtwzVHA8OWgQKZfcG7tKF49Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PiU3a5/NiezaBLxrZ/gg6TaYPiavy+iAxxFjuZHKKX8=;
 b=pmKrkkqxfzr6Z6FsgPs6BYsY+iO6+YuQwJ8Mpkk5ByPwnyMPOVOdL7QookV2lfKCPhRlxq6neRCva7KwfRk/gm9Z9W3aexzjTMcJVQq42bPwPJY1jMDHb1XpcbDlpzLIc7kbuEWzetElI/eaIoMcyrfBQd1alXG2eArTwQtdN7BbjRLzndYu/Ec6THP4hIRxRbHwfvSiinB4/60L7GR8q+2fza1yssis3UNmdbe1NRcSf+CGRKDY3iHrmTktPAfIFSIADcxp7mE2+aEsbi3BEQ11Bq5EkyMl6TcbRgCVOa5aFmyWZPkCSnKvM+gbEljM/eD13bZRvdo7s3sCfjnzCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PiU3a5/NiezaBLxrZ/gg6TaYPiavy+iAxxFjuZHKKX8=;
 b=elSOLeqMWf3pEwE+PL52aBHLTgmuhYxFBqNIJnF446oBs3/6YFPE8yZTQ7Nu2Shcg0VkkHBZnP7oL54nxRwmehlfUvMKzgBJpQz7ESgyqfJrpFfFX+dgZJl0t3xdAe0I0qEj+32dc1d+DrmMWtqoFgGUNE7yOkdwniKr8UWiG5Y=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH3PR12MB7596.namprd12.prod.outlook.com (2603:10b6:610:14b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Wed, 9 Apr
 2025 22:05:14 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.8632.021; Wed, 9 Apr 2025
 22:05:14 +0000
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
Subject: Re: [PATCH v1 2/3] usb: gadget: Use get_status callback to set remote
 wakeup capability
Thread-Topic: [PATCH v1 2/3] usb: gadget: Use get_status callback to set
 remote wakeup capability
Thread-Index: AQHbpIi63HPVwLvMQEOG1YCtYDqZc7OY/w4AgAA//ACAAUwLAIAAOb2AgAEpCAA=
Date: Wed, 9 Apr 2025 22:05:14 +0000
Message-ID: <20250409220510.eynefm7fesydagpz@synopsys.com>
References: <20250403110805.865311-1-prashanth.k@oss.qualcomm.com>
 <20250403110805.865311-3-prashanth.k@oss.qualcomm.com>
 <20250408011758.qfdflgrrmahwmfqi@synopsys.com>
 <4d68cb04-377f-4ebf-99c7-c63b68aebf60@oss.qualcomm.com>
 <20250409005524.fbehw2gonv3p7j2v@synopsys.com>
 <a4cc6d1b-4925-4b57-ae23-fc1e23c5efde@oss.qualcomm.com>
In-Reply-To: <a4cc6d1b-4925-4b57-ae23-fc1e23c5efde@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH3PR12MB7596:EE_
x-ms-office365-filtering-correlation-id: 208be315-9cfa-48de-a1ee-08dd77b29b34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cjl3MEZMM0dIQmFMWXpOK0d0Yk5OMHJxRWJMc3pCNk5lTXlOL0NDVUFBaW9t?=
 =?utf-8?B?SmJ1MkpqcWV5UkZRaEx4cWdWY29HUzdBbHNQUHc0WnhIUk5Ed05zb01ZY0Fh?=
 =?utf-8?B?OURKSk1jdk5pYVkvVzI1QVJCVGsyRlNJckpWZ3NhbEZPYnRLcktEWmZSL0w2?=
 =?utf-8?B?NkMxTVZmcCtrQ2c3bnpqcTI5eGFra0QwT0FZamRYYlUrQnJyREM4ek5ZdVJ0?=
 =?utf-8?B?UUhWd3ZaQzVYUXQ2dTlLM2E2R0U0MURBV3VINXFlYTdpQit5NlVDWnJQWDNH?=
 =?utf-8?B?YkcxTlE2T3dRdDRNdlluUzRzWkdEdCtiT2hxRXlsaG1kWXI0M041aEpkWUhQ?=
 =?utf-8?B?TzQxRk42QnJHQkljMkJoUjR2VmtCbWdndVE5OFd0aVFFNllLK0hEQmQrS2VB?=
 =?utf-8?B?OHN0c0xPWG1rNnRNMHVFbEltdHlpblJHUloxS3g5a0JDQm56aHp2VnRrak44?=
 =?utf-8?B?Q3dZcE1qRm9EWXF6eldUYkY0TnVZK3VvZUlvaVMwU0d6b1J3NnRkYjlJSHJ4?=
 =?utf-8?B?OWYwRG5XcGw4a0RSbFNMaXIxOTcvd0Npc3BUMjdPcS9DN1VLZnE4UTBnbi9N?=
 =?utf-8?B?cnRXTW1Ib3Rxei9VT0NyTkx6Y3JYZkh1c3lhajFUMVZLQk4ybEd3d1daeFVt?=
 =?utf-8?B?MlpNeiswS05rK0lLdGY3SGJBS1ZnYUkwVGN4Mm1ER2xIanRPbkV4ZllkOVF6?=
 =?utf-8?B?Uk5MR0YxVDFBQTBjVXFZcms2RVI3aytaZHpPTHJCak1Wd2tZVDJMdGZvK1ox?=
 =?utf-8?B?eUFTeUNmWWJNT3BxMVFHVU5Qb1E0SEpqeTdwQkhEb1lnY2N1WHZ2WktMOWcv?=
 =?utf-8?B?T0tTcWxnWU9aYXRWNEZUUXMzVWNTME1KNThvdzI2NFlhZHdoUnBkc1BieXdZ?=
 =?utf-8?B?TWJLNFBBdm9vVzV3Z0cwR2VUVXY3RTI5WDhJL2VXbTZDM2M1K0I1QXZGc1JE?=
 =?utf-8?B?b09QaHVwVXluNld1ZWJBQVZuZkQxU2dTbFdkMFUxTTErRHlxTlBFTiswcWt2?=
 =?utf-8?B?d3VHeW9CMlN4NzR1SldPdFNya2R2NENzWWVhVGJQQzlMNFYyajBzT0FkSDg5?=
 =?utf-8?B?V0k5SFNlVnVJY2RGRTNsWFFydU00cFRlRUdCaVVQQTczaklpaU9OK3lXYmx0?=
 =?utf-8?B?VWN2UEZxRzRpQ3VPMDY3Zkp4Y1NsbDN0Ly9RV3ZkSDNnV1FlSW9FZ0oyTVQ0?=
 =?utf-8?B?dHlkRmMzL0VtV3ZraUs3K2xxci90Q3BDd2ZrelUyZ0p2ZVZSektNT1MrMGZ2?=
 =?utf-8?B?Y1hvTnNzZVU5bWZSR0xPdGJtclR2aHVsamNOMnRhbUxPMFBFcmlqYXdZeUFy?=
 =?utf-8?B?N2pINlJmdU1vV0lNendpenBIR2NEcjRtKyszaWZ6YXBucDUvRzJZVERucjRT?=
 =?utf-8?B?aTFidHFMMnUzWUVNQ3hGbHh1SDVMdnhzVTErWVkrZWlWVGlmekNDK3NhalN3?=
 =?utf-8?B?N3VjM0xIVVFYZXZ0dHdLRmsvKzRhdTJyeEJGWFJJK0NIWU9aOTExWjBMS0tV?=
 =?utf-8?B?cEEzbm5LNXlhZ29SY1M0SmVLUHpYeElyYXl2YUl1R1IzV1krbVRvTzdnOUhO?=
 =?utf-8?B?MWd3RE15SHo4T2xaY1N2NWFDZDRuZlVYYnFUTVhBZlI2TnNUWWxvL3hVYm5V?=
 =?utf-8?B?cjJOcElqZVdTSEdMcDVqWmpaZS9GcEIrZTFxU29SRVptU0Y0U1RDRmQxcGF2?=
 =?utf-8?B?NFpQdE9wcG9QOFBKbVV1RG9WRHJ4M0hQUHdRamhGVnlPYVJ5S2ZGdFhaazBS?=
 =?utf-8?B?Y05kNm50Wi9kdUVxd3NieHlzdVdUL21GY1pvQ1FVK2E4aW5HWW1WM3RLVm92?=
 =?utf-8?B?S1laRlMwUGxvS2R6by9QeWIyZTZFUk04eldhKzJPV09kUGFWNmIxZG1RdndN?=
 =?utf-8?B?ZjZYa0JIamZmb2NTYUdBWTh4SDk2R2RnWnVtSWtXTUhDdlRjdG9ObEhsemcv?=
 =?utf-8?B?d3MzYTgwSUtjdTg3R0RSWEZDS20rdDZjbmszNXloMm9QdDNUWUErZUV5VE9J?=
 =?utf-8?B?NjdWelJzbGJ3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dWJZZU1veXNlY1R5dFRvckszNjdmSTB0Y1kzWkdpMDVLWHVyUE03Ulh3S00y?=
 =?utf-8?B?QU11VS9Pd2FzK2xlOFdwcFc3MENhZjFqTDN3UmRqMjM0TElrcDQ0THROWHh5?=
 =?utf-8?B?a2pqVWJsM2xRRjVrTkFDNWFJZlUrZEkvaUcyRVdqUU05YVd5cGJSdXdzcUg4?=
 =?utf-8?B?aDBDU0o0emRPOFp2dk9CaEwwT29NdGE3UzlRSHpEcGpSaVQyVnJtOXlvMGdp?=
 =?utf-8?B?Q0ZPSjk2ZXRCVS9lVm5sbk4zN2s2UDFuWXpOOXczTUROdTQweDRXOWVVUkg5?=
 =?utf-8?B?KzQrLzkvempZd2ZRY1BQRWN3cXJhek9XZWNGMGNkbjNOd1JSOHpDaG4vU2Fz?=
 =?utf-8?B?V1k2TlRJODlHaHNYTTgyK3FadHBpVFdtRDBFR3kwZlY4cERDelBtYTNrMjVK?=
 =?utf-8?B?Ti9XdjZyc0pPWGVYUGR0ZTFoMHg3bXhNQmdGTkdmYlRiRlg1T1NvTFhrV1NJ?=
 =?utf-8?B?cm13RHNRYlV2MnFhbURYMVRrM1BnVU1WWno0bjYzMWpIbWZyNUtSQXUwU25n?=
 =?utf-8?B?cEg3NXhaOCtGWXZtR0F3QkdlM0V3Q1Q2RjMxbXhVVlNMTjN5UGZMWnRzdGg1?=
 =?utf-8?B?b1crMGxxbGJkRG5GNlRoYUxUZG5iYlpjQkIraGV2VVp4ajRzUnJsemZFdW4w?=
 =?utf-8?B?Mk1Nc2hBZ01LODB5b2pSWHFkZGxrUFNmOTN2djJwOElVYUd2bENoMUZXUWpp?=
 =?utf-8?B?RC94N2s1SzgzT3hXNko4RVdQeTQvSmMzQlZsR0trN2s2NWF2aGJGczZZT0di?=
 =?utf-8?B?OENxeVdWbjJGaDF0T0ZxM3lvbGQxTE1yWFZhT21reTVnelRGQ3poRDRmampX?=
 =?utf-8?B?UXVFY2xJYlk1elhaTFppUHNZaVJEc3kvZ1BzRnoxSHpCSVlKQllHYUZKbGtZ?=
 =?utf-8?B?NFE3UDZ6VGs2cE5BdDhnNVN0NkVlL3oxUjZuVkI0TFVRVTlwMUhkc1pYR0FG?=
 =?utf-8?B?Q1RFUytpeWZwVUNDak10Tlp3UUZLZ1pucldMWnpPRXJPSkFhVldhZFJGdDdZ?=
 =?utf-8?B?bGtqS1BEM3N6cWZrdUFoZlB3NGhrWlcyY21ZRmhXUjlYeFovVENLNm1IOWpB?=
 =?utf-8?B?VDZMQ0RadVlib283emhjQ2tVZ05kWnBHM3FRcE9rNmFlMWtXVDJBVDB4bnA5?=
 =?utf-8?B?ZFMxZ0sxMjIvTWRrUE8zYUNkazVCRGU3Z1FtOERwQWwzMFZYZGRPZE14UENk?=
 =?utf-8?B?akx3QVEvaEJhQ1R2VXltMXMzOUx0ZENiWHRnSlhrakRqOEJxSVlQSlBkZGl3?=
 =?utf-8?B?RW5DcERNcHRCZFNld0M5Y1ZST3BpTmJBRTlVTE40SThBMjlJM1g1Q0Joanpi?=
 =?utf-8?B?c0lKN2Nib3NBeTRwTTZINmJvcFhaRlFEMi94R3V6VEtEYUhvb3BCT3lQSUZk?=
 =?utf-8?B?OUhRNDdYQjBpRjQ2dHR3RlYwSmcxdjRSNmJQZm50WTY2SkkzWitvYkxCcTV4?=
 =?utf-8?B?RUcwekdzY1FlSjI2M2VIeTlFL2c1U3QyYTNncEduWUNlbUU3dCtCTkRObXpC?=
 =?utf-8?B?eTQ4REN3TXlRdy9lSmdVeXpQVFhDaVVQTDU2ME43cWpCc0V0REIxQlhEbWZU?=
 =?utf-8?B?aUhFUTdLV2FlVi9Tc3R1eEtoTkZuYmk4S1p3SUZVT0hKL1h1Q3VGOUdlcUZU?=
 =?utf-8?B?YnBTQzY5THlMUzU5b2d0V2FYell6bytNQTRjdW1maCtudTd5eDBwbUZEc2Ey?=
 =?utf-8?B?SDVjN0V6WXZBczZoYWhpMlFmUEtyQ3craXFjMUFNdXhSSkNyR2U3USs5NmlH?=
 =?utf-8?B?VXpMNU9za3VWL3BEOVVvaTlMdUNLd0xHdDdWRFRHV0YzNHhQZEpjUjNBemw5?=
 =?utf-8?B?VmdQMERWa09obmZ6UFAvdm1DMEJhM200dlNkbCs3dGRXVlJhK055UTBhNkl3?=
 =?utf-8?B?L25HNy9MSjV2WXFpN2RZSEJic2VjRFNqaXUrZW9Xa2lIVkJvUW8wcnVRUlRs?=
 =?utf-8?B?OW93N0svYnNGbG5GMU1wakdoK3pQbE1OK2c5Tmt4WTdEY1gxU0pWSzN3Wkh1?=
 =?utf-8?B?bGl0SkRWZHNDZUxQYXdlckN1aDdPTHU3dHZBejlBcmZvdkZTUE9TK2RXVHJm?=
 =?utf-8?B?SFNEVm9rcHdWK0FGclU0TjFKSmFqbTVMVHlUejdJY3l3QThCZUpIOGpVbXA3?=
 =?utf-8?Q?6M0ZFs31g4vztwb2EJn1mAUiS?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <410943F7C63E9C49BEA270149248FF3F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JzgALISEp7sdov/mkZGPkLUpeQwWr2KIJ6NiiiyWG53WjbhwCB1MKuagBkRBnWAOCSWo2doESV6OfvnNyO/QlbqqT7+qge9PtKVsNcRGJZIaf33fua4wFVEWCBJ9lrWb8XsikhvAf1ZZylgkWKIDy+9CeXx0RhtZ5dRNAHhOmqU2l+8FY4e4JHhdfoCZS3SsRGiZ2JZ2mVclqg1mYzEK+GIFtGjevQozLM9xP/W4RuOJXgCHCkudIcDaIp/2/UjzNMCADQbs3kdI8Ic5qJR53MklB1dGOi9U3hxpvwsVCVDJY2A+eYLkVSmrzGPBFTsOwsoOW0xYM1HbP80Q1mrQpnryf0h6mBSx5Qe/INQ8VtxoLyuyVPSGyfzyP+BWFve5rJ/0tHQkYmIhR1b03w43bfpAJMApW0YoRsZjRDJj5ZCJfsCgVRuthj5i8u/3nQQKLyblLPcvuapkfnZMAMk9wjpwUY49OAbROxOMhBLveLLNOnRBckI0e18HHJhhncUEwoMNW9hGGdWpvZERig5vPqHdlRZQ+FQlHrWpYJjwHAJy8LEm05ms9UqW2dMGnKBuRwuNb55sLGUKQ16+PFk8SqFOe74xXj34lNgDH7+yZYnn/Y++9NB9Ych/RL6UBikPDROgsSCc50qOBdtMy+BAXg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 208be315-9cfa-48de-a1ee-08dd77b29b34
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 22:05:14.8022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A24i0v1nggueVBdnAd9obmPeATZ0+71u9wdzM+xFafnGSFZx0tP+UU3cI+05uk7debcmnaR0FF414twtFmlQ5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7596
X-Authority-Analysis: v=2.4 cv=L9cdQ/T8 c=1 sm=1 tr=0 ts=67f6ef26 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FCtmeSNm1ujRskSre6AA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 6riQaKHK_YEis4rdZN0ZPjtSoI2uVpUs
X-Proofpoint-GUID: 6riQaKHK_YEis4rdZN0ZPjtSoI2uVpUs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 mlxscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090151

T24gV2VkLCBBcHIgMDksIDIwMjUsIFByYXNoYW50aCBLIHdyb3RlOg0KPiANCj4gDQo+IE9uIDA5
LTA0LTI1IDA2OjI1IGFtLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gVHVlLCBBcHIgMDgs
IDIwMjUsIFByYXNoYW50aCBLIHdyb3RlOg0KPiA+Pg0KPiA+Pg0KPiA+PiBPbiAwOC0wNC0yNSAw
Njo0OCBhbSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+Pj4gT24gVGh1LCBBcHIgMDMsIDIwMjUs
IFByYXNoYW50aCBLIHdyb3RlOg0KPiA+Pj4+IEN1cnJlbnRseSB3aGVuIHRoZSBob3N0IHNlbmRz
IEdFVF9TVEFUVVMgcmVxdWVzdCBmb3IgYW4gaW50ZXJmYWNlLA0KPiA+Pj4+IHdlIHVzZSBnZXRf
c3RhdHVzIGNhbGxiYWNrcyB0byBzZXQvY2xlYXIgcmVtb3RlIHdha2V1cCBjYXBhYmlsaXR5DQo+
ID4+Pj4gb2YgdGhhdCBpbnRlcmZhY2UuIEFuZCBpZiBnZXRfc3RhdHVzIGNhbGxiYWNrIGlzbid0
IHByZXNlbnQgZm9yDQo+ID4+Pj4gdGhhdCBpbnRlcmZhY2UsIHRoZW4gd2UgYXNzdW1lIGl0cyBy
ZW1vdGUgd2FrZXVwIGNhcGFiaWxpdHkgYmFzZWQNCj4gPj4+PiBvbiBibUF0dHJpYnV0ZXMuDQo+
ID4+Pj4NCj4gPj4+PiBOb3cgY29uc2lkZXIgYSBzY2VuYXJpbywgd2hlcmUgd2UgaGF2ZSBhIFVT
QiBjb25maWd1cmF0aW9uIHdpdGgNCj4gPj4+PiBtdWx0aXBsZSBpbnRlcmZhY2VzIChzYXkgRUNN
ICsgQURCKSwgaGVyZSBFQ00gaXMgcmVtb3RlIHdha2V1cA0KPiA+Pj4+IGNhcGFibGUgYW5kIGFz
IG9mIG5vdyBBREIgaXNuJ3QuIEFuZCBibUF0dHJpYnV0ZXMgd2lsbCBpbmRpY2F0ZQ0KPiA+Pj4+
IHRoZSBkZXZpY2UgYXMgd2FrZXVwIGNhcGFibGUuIFdpdGggdGhlIGN1cnJlbnQgaW1wbGVtZW50
YXRpb24sDQo+ID4+Pj4gd2hlbiBob3N0IHNlbmRzIEdFVF9TVEFUVVMgcmVxdWVzdCBmb3IgYm90
aCBpbnRlcmZhY2VzLCB3ZSB3aWxsDQo+ID4+Pj4gc2V0IEZVTkNfUldfQ0FQIGZvciBib3RoLiBU
aGlzIHJlc3VsdHMgaW4gVVNCMyBDViBDaGFwdGVyIDkuMTUNCj4gPj4+PiAoRnVuY3Rpb24gUmVt
b3RlIFdha2V1cCBUZXN0KSBmYWlsdXJlcyBhcyBob3N0IGV4cGVjdHMgcmVtb3RlDQo+ID4+Pj4g
d2FrZXVwIGZyb20gYm90aCBpbnRlcmZhY2VzLg0KPiA+Pj4+DQo+ID4+Pj4gVGhlIGFib3ZlIHNj
ZW5hcmlvIGlzIGp1c3QgYW4gZXhhbXBsZSwgYW5kIHRoZSBmYWlsdXJlIGNhbiBiZQ0KPiA+Pj4+
IG9ic2VydmVkIGlmIHdlIHVzZSBjb25maWd1cmF0aW9uIHdpdGggYW55IGludGVyZmFjZSBleGNl
cHQgRUNNLg0KPiA+Pj4+IEhlbmNlIGF2b2lkIGNvbmZpZ3VyaW5nIHJlbW90ZSB3YWtldXAgY2Fw
YWJpbGl0eSBmcm9tIGNvbXBvc2l0ZQ0KPiA+Pj4+IGRyaXZlciBiYXNlZCBvbiBibUF0dHJpYnV0
ZXMsIGluc3RlYWQgdXNlIGdldF9zdGF0dXMgY2FsbGJhY2tzDQo+ID4+Pj4gYW5kIGxldCB0aGUg
ZnVuY3Rpb24gZHJpdmVycyBkZWNpZGUgdGhpcy4NCj4gPj4+Pg0KPiA+Pj4+IENjOiBzdGFibGVA
a2VybmVsLm9yZw0KPiA+Pj4+IEZpeGVzOiA0ODFjMjI1YzQ4MDIgKCJ1c2I6IGdhZGdldDogSGFu
ZGxlIGZ1bmN0aW9uIHN1c3BlbmQgZmVhdHVyZSBzZWxlY3RvciIpDQo+ID4+Pj4gU2lnbmVkLW9m
Zi1ieTogUHJhc2hhbnRoIEsgPHByYXNoYW50aC5rQG9zcy5xdWFsY29tbS5jb20+DQo+ID4+Pj4g
LS0tDQo+ID4+Pj4gIGRyaXZlcnMvdXNiL2dhZGdldC9jb21wb3NpdGUuYyB8IDEyICsrKystLS0t
LS0tLQ0KPiA+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9u
cygtKQ0KPiA+Pj4+DQo+ID4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdldC9jb21w
b3NpdGUuYyBiL2RyaXZlcnMvdXNiL2dhZGdldC9jb21wb3NpdGUuYw0KPiA+Pj4+IGluZGV4IDg2
OWFkOTlhZmI0OC4uNWM2ZGEzNjBlOTViIDEwMDY0NA0KPiA+Pj4+IC0tLSBhL2RyaXZlcnMvdXNi
L2dhZGdldC9jb21wb3NpdGUuYw0KPiA+Pj4+ICsrKyBiL2RyaXZlcnMvdXNiL2dhZGdldC9jb21w
b3NpdGUuYw0KPiA+Pj4+IEBAIC0yMDEwLDE2ICsyMDEwLDEyIEBAIGNvbXBvc2l0ZV9zZXR1cChz
dHJ1Y3QgdXNiX2dhZGdldCAqZ2FkZ2V0LCBjb25zdCBzdHJ1Y3QgdXNiX2N0cmxyZXF1ZXN0ICpj
dHJsKQ0KPiA+Pj4+ICAJCQlicmVhazsNCj4gPj4+PiAgDQo+ID4+Pj4gIAkJaWYgKGYtPmdldF9z
dGF0dXMpIHsNCj4gPj4+PiAtCQkJc3RhdHVzID0gZi0+Z2V0X3N0YXR1cyhmKTsNCj4gPj4+PiAr
CQkJLyogaWYgRDUgaXMgbm90IHNldCwgdGhlbiBkZXZpY2UgaXMgbm90IHdha2V1cCBjYXBhYmxl
ICovDQo+ID4+Pj4gKwkJCWlmIChmLT5jb25maWctPmJtQXR0cmlidXRlcyAmIFVTQl9DT05GSUdf
QVRUX1dBS0VVUCkNCj4gPj4+DQo+ID4+PiBXZSBzaG91bGQgYWxsb3cgZnVuY3Rpb24gdG8gZXhl
Y3V0ZSBnZXRfc3RhdHVzIHJlZ2FyZGxlc3Mgb2YNCj4gPj4+IFVTQl9DT05GSUdfQVRUX1dBS0VV
UC4gVGhlcmUgYXJlIG90aGVyIHN0YXR1cyBiZXNpZGUgd2FrZXVwLg0KPiA+Pj4NCj4gPj4gQWdy
ZWUgd2l0aCB0aGUgZmlyc3QgcGFydCwgSSBhbHNvIHdhbnRlZCB0byByZW1vdmUgdGhlIGV4cGxp
Y2l0IGNoZWNrDQo+ID4+IGZvciBVU0JfQ09ORklHX0FUVF9XQUtFVVAuIEJ1dCBhbnl3YXlzIGtl
cHQgaXQgc2luY2Ugb25seSAyIGJpdHMgKFJXX0NBUA0KPiA+PiBhbmQgUlcpIGFyZSBkZWZpbmVk
IGluIHRoZSBzcGVjIGFzIHRoZSBzdGF0dXMgb2YgR2V0U3RhdHVzIGZvciBhbiBJbnRlcmZhY2Uu
DQo+ID4+DQo+ID4+IExldHMgZG8gb25lIHRoaW5nLCBJJ2xsIHJlYXJyYW5nZSBpdCBhcyBmb2xs
b3dzDQo+ID4+DQo+ID4+IGlmIChmLT5nZXRfc3RhdHVzKSB7DQo+ID4+IAlzdGF0dXMgPSBmLT5n
ZXRfc3RhdHVzKGYpOw0KPiA+PiAJDQo+ID4+IC8qIGlmIEQ1IGlzIG5vdCBzZXQsIHRoZW4gZGV2
aWNlIGlzIG5vdCB3YWtldXAgY2FwYWJsZSAqLw0KPiA+PiBpZiAoZi0+Y29uZmlnLT5ibUF0dHJp
YnV0ZXMgJiBVU0JfQ09ORklHX0FUVF9XQUtFVVApDQo+ID4+IAlzdGF0dXMgJj0gfihVU0JfSU5U
UkZfU1RBVF9GVU5DX1JXX0NBUCB8IFVTQl9JTlRSRl9TVEFUX0ZVTkNfUlcpOw0KPiA+IA0KPiA+
IFllcywgc29tZXRoaW5nIGxpa2UgdGhpcyB3b3JrcywgYnV0IEkgdGhpbmsgeW91IG1lYW4gdGhp
czoNCj4gPiANCj4gPiAJaWYgKCEoZi0+Y29uZmlnLT5ibUF0dHJpYnV0ZXMgJiBVU0JfQ09ORklH
X0FUVF9XQUtFVVApKQ0KPiA+IAkJLi4uDQo+ID4gDQo+IFllcyByaWdodCwgd2lsbCB1cGRhdGUg
aXQgaW4gbmV4dCB2ZXJzaW9uLg0KPiA+Pg0KPiA+Pj4+ICsJCQkJc3RhdHVzID0gZi0+Z2V0X3N0
YXR1cyhmKTsNCj4gPj4+PiArDQo+ID4+Pj4gIAkJCWlmIChzdGF0dXMgPCAwKQ0KPiA+Pj4+ICAJ
CQkJYnJlYWs7DQo+ID4+Pj4gLQkJfSBlbHNlIHsNCj4gPj4+PiAtCQkJLyogU2V0IEQwIGFuZCBE
MSBiaXRzIGJhc2VkIG9uIGZ1bmMgd2FrZXVwIGNhcGFiaWxpdHkgKi8NCj4gPj4+PiAtCQkJaWYg
KGYtPmNvbmZpZy0+Ym1BdHRyaWJ1dGVzICYgVVNCX0NPTkZJR19BVFRfV0FLRVVQKSB7DQo+ID4+
Pj4gLQkJCQlzdGF0dXMgfD0gVVNCX0lOVFJGX1NUQVRfRlVOQ19SV19DQVA7DQo+ID4+Pg0KPiA+
Pj4NCj4gPj4+IFNvIHJpZ2h0IG5vdyB3ZSdyZSBub3QgYWJsZSB0byBjb25maWd1cmUgdGhlIGZ1
bmN0aW9uIHRvIGVuYWJsZSBSVw0KPiA+Pj4gY2FwYWJsZT8gUGVyaGFwcyB3ZSBuZWVkIHRvIHVw
ZGF0ZSB0aGUgY29tcG9zaXRlIGNvbmZpZ2ZzIGZvciB0aGlzPw0KPiA+Pj4NCj4gPj4NCj4gPj4g
VGhlIHJlbW92ZWQgY29kZSB1c2VkIHRvIHNldCBVU0JfSU5UUkZfU1RBVF9GVU5DX1JXX0NBUCBl
dmVuIGZvcg0KPiA+PiBpbnRlcmZhY2VzIHdoaWNoIGRvZXNuJ3QgaGF2ZSBSVyBjYXBhYmlsaXR5
LiBJdHMgYmV0dGVyIHRvIGhhbmRsZSB0aGlzDQo+ID4+IGZyb20gZnVuY3Rpb24gbGV2ZWwgdGhh
biBmcm9tIGNvbXBvc2l0ZS4NCj4gPj4NCj4gPiANCj4gPiBOb3QgYXQgdGhlIGdhZGdldCBsZXZl
bCwgSSBtZWFuIHRvIGNyZWF0ZSBhIGNvbmZpZ2ZzIGF0dHJpYnV0ZSBjb21tb24NCj4gPiBhY3Jv
c3MgZGlmZmVyZW50IGZ1bmN0aW9ucyB0byBhbGxvdyB0aGUgdXNlciB0byBlbmFibGUvZGlzYWJs
ZSB0aGUNCj4gPiBmdW5jdGlvbiB3YWtldXAgY2FwYWJpbGl0eSB2aWEgdGhlIGNvbmZpZ2ZzIHdo
ZW4geW91IHNldHVwIHRoZSBmdW5jdGlvbi4NCj4gPiANCj4gPiBXaGF0IGRvIHlvdSB0aGluaz8N
Cj4gPiANCj4gPiBUaGFua3MsDQo+ID4gVGhpbmgNCj4gDQo+IFRoYXRzIGEgZ29vZCBpZGVhLCBp
biBmYWN0IEkgaGFkIHRoZSBzYW1lIHRob3VnaHQuIEJ1dCB0aG91Z2h0IG9mIGRvaW5nDQo+IGl0
IGxhdGVyIHNpbmNlIGl0cyBiZXlvbmQgdGhlIHNjb3BlIG9mIHRoaXMgcGF0Y2gvc2VyaWVzLg0K
DQpUaGUgd2F5IHlvdSBoYXZlIGl0IGRvbmUgbm93IGZvcmNlcyBhIHVzYjN4IGZ1bmN0aW9uIGRy
aXZlciB0byBpbXBsZW1lbnQNCmYtPmdldF9zdGF0dXMgdG8gYmUgYWJsZSB0byByZXNwb25kIHdp
dGggZnVuY3Rpb24gd2FrZXVwIGNhcGFibGUuDQpQcmV2aW91c2x5LCB3ZSBhdXRvbWF0aWNhbGx5
IGVuYWJsZSBmdW5jdGlvbiB3YWtldXAgY2FwYWJpbGl0eSBmb3IgYWxsDQpmdW5jdGlvbnMgaWYg
dGhlIFVTQl9DT05GSUdfQVRUX1dBS0VVUCBpcyBzZXQuDQoNCkFyZ3VhYmx5LCB0aGlzIGNhbiBj
YXVzZSBhIHJlZ3Jlc3Npb24gZm9yIHJlbW90ZSBjYXBhYmxlIGRldmljZXMgdG8NCm9wZXJhdGUg
aW4gdXNiMyBzcGVlZHMuDQoNCj4gDQo+IFdlIGNhbiBhZGQgYSBjb25maWdmcyBhdHRyaWJ1dGUg
dG8gZW5hYmxlL2Rpc2FibGUgRlVOQ19SV19DQVAsIGFuZA0KPiBmdW5jdGlvbnMgY2FuIHJldHVy
biBnZXRfc3RhdHVzKCkgYmFzZWQgb24gdGhlIGF0dHJpYnV0ZS4NCj4gDQoNClRoYXQgd291bGQg
YmUgZ3JlYXQhIFRoaXMgd291bGQgZml0IHRoaXMgc2VyaWVzIHBlcmZlY3RseS4gTGV0IG1lIGtu
b3cNCmlmIHRoZXJlJ3MgYW4gaXNzdWUuDQoNClRoYW5rcywNClRoaW5o
