Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205CF19004A;
	Wed,  9 Apr 2025 22:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744236752; cv=fail; b=TvrVTy9KkWkslIYXMbt/MVYckk5On273iRQC9htWBxpFnrU55KJHUKingG8wVeQ/Dky9t/Sh+Hp6xkiRGNlowKxOGIvHeOPCVAEMOhNb7f1sZyV443xKzqX8ZbzjoWLcLlB9o//1BixM06xuaIQqBqAoEbS2EXzY5vlSJbDl4/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744236752; c=relaxed/simple;
	bh=BCKsX9Rqosc8jjkzTBRRZwyFy8UjHv71B7QWz3KcCFI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=daYJgIENjbNVoimnpyWxAx4Wd+3R0kgjusZMOO6tDXftxVjp/ji35qjJTLL7LX9sRCU4bm5dT4ODfeykqKFmAoMzyk6YtzE0ANL4ZDaJW7YBDohM3A2DJ7zUeSDGr0/eyOJDGHlPQfmL6Qp+t14GW1yHL5nFegLXfUX0NpK4MX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=MVCw81NU; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ciAhgkI3; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=YVD5Nsz2 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MVCw81NU";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ciAhgkI3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YVD5Nsz2"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539KD6R4023759;
	Wed, 9 Apr 2025 15:12:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=BCKsX9Rqosc8jjkzTBRRZwyFy8UjHv71B7QWz3KcCFI=; b=
	MVCw81NUC4Iac03a++NM+lGB1hSNnfK0TXmW1wgnGe0daCVzF9yZeuUaowdNUIEl
	a2iiDtC4KAXHKTHJRocCdIqbJK3QXiIU5IBRvkumtNcPJH4esZPcKvdIHqZ/+GLK
	vMqmjYeMl+CGmqui4G34hgGXN6DiUCe1tGry6fRtvJLsLzH0zB/2Aocch0wtAV3U
	jIOLU8w3OZxQeew9GBZ+E0NKdI1lNvour1AqsOMa599EThxWt3gsjPFzjQL7lFKv
	kUqK8qeVsPrg6ickWXglj/5GoGFeOSG6RD/TSeHqZola+NFFfem2nN5yYgZqk9ns
	vFL0JS+pvomXX6NBSYVgow==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 45u3evgbmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 15:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1744236727; bh=BCKsX9Rqosc8jjkzTBRRZwyFy8UjHv71B7QWz3KcCFI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ciAhgkI39NfmVLkUP6W1l/bQ96mkWUHndY1VLmdX+UPoFlMUMYLMuTgYNylFKksgO
	 qMtSb1uykh0NeH5Bz15lxTuuQELtpBz+bKxUypHqZ+eTaAkUJrxehifZj3OtKeDmsF
	 4zTmA6V322kRk3hv1NJ9jeudYp9LM/KHitdZQZzTCL9F5VS0LgkbfTTswg5aCfaNzH
	 6bTYWFm26qDVAI6+DtB080KjpxDkfCxlLxWPOHfX5dbtZtWtPfvsTm3VJg2ZSCCZ/4
	 Wos94U2VYX+lZFOil91tRg1BfY8oYBfHV3ZRLfI3noqW08OvO8MXT9y3ZR9o06zw6g
	 5Zz6R9JUwujFw==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BB0F64045F;
	Wed,  9 Apr 2025 22:12:06 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 839F0A0070;
	Wed,  9 Apr 2025 22:12:05 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=YVD5Nsz2;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8D33840124;
	Wed,  9 Apr 2025 22:12:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y40Iqbury6xp7VT+Uz5Q+/lZbH6cNolXQMXbjDuIqdQIbZGxCXDCAu6H9Cqzp7pJLyqng2OuzUH4GDsLbs/c21z58VH925ySdnRZHY4wrjSVrhvjvYpcTMHcUZFWQaF6KXTaBhRshJKaC/CiJYDGHHdo0vVvDTGAn6Z/45Kp1zJCa8I0LUrpbzr3/CWFbFn51NoE3KpPoxZIJ/XtCGzDcycBN7pG4108idjjIiJpVQu/zmvl3N0pC+MXnzOoUpXdiej1diVuqdl40vYS10U00cbx5tZoEWuweaFP8rQphz0vqI7k6/3ql5eYETvsRB0Q/ElsRS6h6Y4Z4++opjgKDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BCKsX9Rqosc8jjkzTBRRZwyFy8UjHv71B7QWz3KcCFI=;
 b=v2qs4YeUyzQfniqt6N7bu0q6EzDTBGXSP/89voLnAADK6+SAboDwbLb+fgL/2Y8+q0KK50r3z2twUiywVMPuu9GKaAOi7XswI5foeMzfR5EPdRE+jTpZ/28X0ViU/yXzDaaK/7RsE6+9J674hezlRrO+4u1pxKNdCQTGo8LWYFn2D8xjit8u6RSMljavK3UNQ/DQvXZ2KczNGiFX98C65/Sk2CfW+nMeqaoQmu//r50LzcdP1wHgw0k7pbpHhPMOm65AreX8gzAbFB2A+aRilA5F4/hWfu9B+MqQolV7sn3RndKoKYcYlgtNpdzlAzOLTBo8iTZm5F6ZeGSTqqdVQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCKsX9Rqosc8jjkzTBRRZwyFy8UjHv71B7QWz3KcCFI=;
 b=YVD5Nsz2WkljvTCgBrUMFFIJkzrvDHQYge1HSklkq2PQZJsFk9fL/FQo65N40aNwhaHBLMm54ZJ//iQJJcriNKWAMePlTQcC+NJeJ3QrISFppJyOjZIxlQfQKceyOOY1Jj/GNvAQSETy2r/YFQBXEiLdgLi3l0HcsMtbD78Jh3E=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA1PR12MB6114.namprd12.prod.outlook.com (2603:10b6:208:3ea::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.46; Wed, 9 Apr
 2025 22:12:01 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.8632.021; Wed, 9 Apr 2025
 22:12:01 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Bakker
	<kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek
 Szyprowski <m.szyprowski@samsung.com>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "stable@kernel.org" <stable@kernel.org>
Subject: Re: [PATCH v1 2/3] usb: gadget: Use get_status callback to set remote
 wakeup capability
Thread-Topic: [PATCH v1 2/3] usb: gadget: Use get_status callback to set
 remote wakeup capability
Thread-Index:
 AQHbpIi63HPVwLvMQEOG1YCtYDqZc7OY/w4AgAA//ACAAUwLAIAAOb2AgAEpCACAAAHmAA==
Date: Wed, 9 Apr 2025 22:12:01 +0000
Message-ID: <20250409221158.n5duanv2gmctrr64@synopsys.com>
References: <20250403110805.865311-1-prashanth.k@oss.qualcomm.com>
 <20250403110805.865311-3-prashanth.k@oss.qualcomm.com>
 <20250408011758.qfdflgrrmahwmfqi@synopsys.com>
 <4d68cb04-377f-4ebf-99c7-c63b68aebf60@oss.qualcomm.com>
 <20250409005524.fbehw2gonv3p7j2v@synopsys.com>
 <a4cc6d1b-4925-4b57-ae23-fc1e23c5efde@oss.qualcomm.com>
 <20250409220510.eynefm7fesydagpz@synopsys.com>
In-Reply-To: <20250409220510.eynefm7fesydagpz@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA1PR12MB6114:EE_
x-ms-office365-filtering-correlation-id: b1902b7e-7ffe-40ac-5532-08dd77b38d93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?clRZREU2VVIzRE5IeDVYeUJwaDVURTN0ekpLZkthTHdhTUg5TmZweWlQS3ZK?=
 =?utf-8?B?V05YT0Q4Y2lzQjNIUHkvTnBDZE9FNE9ONVFsNUNKRlJ1V29oVWg4SGNDdVo5?=
 =?utf-8?B?dzRyd3U5V3lXcFZCdHhnMms5MnQwRWM4NzRKYm9IWUxNRER4eXhQZ2txaGZN?=
 =?utf-8?B?SVZSOG9HOVMwMTlrT3JJQ1VPNlMrd2VMNUxPbUR2UGd2VjVHUklzWTkzTXJL?=
 =?utf-8?B?OVJYWU81a0tUazB2cFNNZzBkYVVOVW9oa2haU1BPeHBRVjBURzEzSm9BM2Nn?=
 =?utf-8?B?N1ZoZU5LWjJybERTV3pQQytKZzdxK3hyQkNIU0wvNnh4TUR2dkhKbEpwWmx5?=
 =?utf-8?B?dERYVEMzbTg5cU1hZmdiZzZXcCtjVDgycHRabHZOK01SanY4ejZQSk1MMHFi?=
 =?utf-8?B?dHJQOXlteEJOK0FCeGV4dFV3d3V3OGNCREdycjZzbUdnOHI4bGRkNXBhSzhF?=
 =?utf-8?B?M3paRUJCT3hCZkRySkdJVW1NT28vNzBHYmUrQTZ3akJiU2tsTFJEbEVkZ044?=
 =?utf-8?B?QWdaNytwU0h4b3ZUNC84SmdkWXh3bjJEblpsUHVhc0kyL0JSdGllMXdTZ3Rw?=
 =?utf-8?B?eHcwOHFEV0RBSk1YL1NWb2JjL2xEcjdxNEVUbFAwZE9aZDBibm1BYXJ5QURR?=
 =?utf-8?B?Yzlnc1dmdmdoZnYwU0FxWncwbXFOVXJ3Y2kvYTlaQi9vb0lCWW5FUG12aHZV?=
 =?utf-8?B?MnpRSzB2NE9ZUkRRcVdTU2t3dGNkcWI1UU14M05VYUN0M1ZBT0tkSzRrV3hH?=
 =?utf-8?B?QnZNWXczTTJXdGxBeDd3YUNDb1BOUmRtMWhhanBSMkJzUjVRWE84dnU3TlB2?=
 =?utf-8?B?Y083TzBoRklJSmV4YW9JTXk2ekRrTjFxVHNwRXR5aXZzak4ya3V1NU1jNHU3?=
 =?utf-8?B?WWtyc3NxTnAzMkJoL3lwb3BHZktrNVBvemlvK3dMSll2RmlFWDkvOXdybXE4?=
 =?utf-8?B?V1FickQrU1JiQnlZZGd4WHNDaktEb0NBK05MWG52YXpCeThNUzRGN3VoMUZz?=
 =?utf-8?B?SFBXRWVNS3g0T1M0cHMrdG5CY2JqN2VVNmxKL2N0N0pESGR0NHhZaG1UTDF0?=
 =?utf-8?B?b2ZNM0lmcThvazJTc2VGYTZ6WlNIS3VUSGV0NVB0a0U5Q2ZFeC9lWnhPSklq?=
 =?utf-8?B?V1A3aEdvc01lUHlwOWRTSURhWHJqZXg3My9VMytZcmtuNHEzdUJ5Mi9IL1BO?=
 =?utf-8?B?ei9QTTNwQVk0VlFKSFI4SjgzeE9qRVIxWlRTSmZTZmdjM05TcjVLK1Z4ajlC?=
 =?utf-8?B?SEVXMmZnNGFGTVYwVnRWYm5WYXpoUHhUSFY2OG9wMTJ1Zk8veTJkbkExSzZa?=
 =?utf-8?B?QWR3dG96V1ZKKzJXeHZ4SW9SaUZYTE9UZFlHSG1iVzE0bVk4RSs5ZzBEbXA2?=
 =?utf-8?B?YVdTazNYSmUyUGhQdEpPSFJDeDdNSkZsM2J4aVhIbmpOaG9yU240eVRWMXBK?=
 =?utf-8?B?SVlmbGVTYzlmM09OL3N1aFhLdXdHaXFCSWlFNzdyUjVPQ3hOdkhwTldRb1dq?=
 =?utf-8?B?Z2xsRnh6UmVleC9ZaGMxTXpNQ1NqUGc3Qk5kWFppOWFiWVpsd0U4YUpyRVF0?=
 =?utf-8?B?SCtPeForM21OTE5teXBKZllxMjR0V0JZR1VJWkUrYXBXelhEVlpVb0tLc2RF?=
 =?utf-8?B?aGtZWFIvbWRoODdGZGxmSmcvenBhYTZNaTB6c25mVWJlTnJoZVE4a1BVQVMr?=
 =?utf-8?B?ZGNYWFNRU1V4OE5CWkFHMTVic3Z5SW14YllMVFcyOXpQQW1oRU1scHV5bUhZ?=
 =?utf-8?B?Rk5DNWhNUGMvdjJDNmpacTMwbHVobTBXQ3BhKzlFMnh4RlRIMHNZbTBPQ2pt?=
 =?utf-8?B?V2QwZm9SNkpENTZnN2dvTThiQTZjN1BtN1l5OU1pR2ZvQ3lHSmU0MWh2Wi9r?=
 =?utf-8?B?N0N5SnR6YTZUNUNDSFFTT0hUaForTnRQL1ZmMjFSVnJiSFdacXlQbi85dC9R?=
 =?utf-8?B?cC9jSjMzMXhQVnVoT0dReHlQNUIxekNnckZNQlRYT2kxZUtzSEZQbjZDNDE1?=
 =?utf-8?B?Y2tuSXJzRFV3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZTNLd2ZVcDE3WlgyTnpVdGlnOTJYNS90Yk1GcHMyTUNZcjhlVVd3NzM1UlNY?=
 =?utf-8?B?d0dpVTBMMUdiMWpMVjJTQUF0ZCt5aVAvVFU1bjNkOWFrQzRUYkk5WkJFcEtt?=
 =?utf-8?B?WW9pYVozMzNINlA0enRaTUppZnpYdGQ5QU81TUxmSmNLTEJVRU00SXlyQ3Ir?=
 =?utf-8?B?M2FIS1BCZHhUdVpPRE1xVTQwNkUwOFlZQVJ1ZlhDRTB0d1F0Mnp4S3pudzdx?=
 =?utf-8?B?Y1BDTExQZWZKYTNpalErNzNjYlROUVZ6cWxia1h6RVVHOXBzZlZjQTY2ZCtG?=
 =?utf-8?B?dHhldThONWt1SmdPT2hxbElxTmtXSWFWc1NlWFBaa2dQYlJudk1XRVNwOHlS?=
 =?utf-8?B?cG9VT0JpYVloKzV1dlRpV3dQNzNnRmNLYWdSeEVtWUowakNaVmdPeEMzVWNr?=
 =?utf-8?B?RWoxbzhVbldlYWY1UlYvZ3RPRmE2THdoUGtTOEFpY0FpZEhic2ZHUmJMeEoy?=
 =?utf-8?B?RWd5QXphVVdsUStLdy9LV2Vib3FzSXppM29HQWJtY3RVUkpsbWd1VUVKUEhM?=
 =?utf-8?B?WlJuNUZrdXJTWXJOdkxRb293YXU1Q3NzemNCaFJlbTk3WUtpeHVxYzRrM2lx?=
 =?utf-8?B?dlYrY2RrWkpKOTJHTWtNWG1pcmRiSEk5enhQdUFIUHFwWVpzVXI0WVYrSE05?=
 =?utf-8?B?cTAyeHZJeHlNYkJpVlU5SU03d0tFOXdheUIzSUZSTkpCaURyUDNqSEU2ZXFo?=
 =?utf-8?B?Wjh5b1NhVnVub1ppeG5ZQnB2QXBhVzU2aXZIYnF0QWgyVEpRVmV4UmUrZEo1?=
 =?utf-8?B?MUNUa3NZUUF3QUFFaXAzVWNYOHJURUdFVWlUbG9LbytJQ1lvNkZ3aHA2RS9E?=
 =?utf-8?B?UkJzaGVwdG1nZitkbzF4QU5XYW43TUF3YnFTbVdUVmhYWTkrNkd6YjFsTDA1?=
 =?utf-8?B?cXZGbzA3bEwvQzdjRVBoZTZqVHFDWjRIOVo0V0VPdklYZjFRKy9WMC94Nm1i?=
 =?utf-8?B?SU9RWGsydGFGcnFvRTNGdE4rOFNDdE8xbHd2QXJ3aFdMVlZ3Mld4S1p6ZUl4?=
 =?utf-8?B?MnV4blRFN0ZOSnZBZnBEdzRyeFpYSWg1Mjg1bklUMDNjMFZENWVCRG5wQnJ1?=
 =?utf-8?B?Z2F0ZEtuTWVpSVVDdDlHWW80d1FDbjlDV1lDV3k1c1N3S1pia1h5d0V0ajFL?=
 =?utf-8?B?ZzJkSlBwaUtkeWh0NE9TRTFSYUgzdi9FcGFaTVdXTGp4Z3k0dUJIV3FyY05i?=
 =?utf-8?B?Um52UnZsbmJyQ1pGS3M3RjBBWmN3b3ArYnBpK0JSeEVzeEVLdEUyQnhVQ2Nl?=
 =?utf-8?B?M1AwT3A1cElzeXBqYnJ6STFrQkdYcjJLRkpQaDdIdVk3SUIrS2txYXY2NVNl?=
 =?utf-8?B?TGlxbzJORTZPUFFWNFZZeU1RbDFQN2hSQVlsQ0VMMXlvQU01a2RxcDVlZkh0?=
 =?utf-8?B?NzkvT1lrSER5S2sxNDNHc21HRFkxcXhhUFFmNkZ0c0ZGSnlCZ3kzZE91ZHY5?=
 =?utf-8?B?NjlTYnZNSFc1YTE4cFA3aVRqUVFibjA1YkNXSFZvV0xWTmZnSzhvSFFPdkNF?=
 =?utf-8?B?NDBjM1Vob1VFdGpTUVZpQkNxWlpBME80czdRdmphUzcwMWpHcFdYMlZvSmc0?=
 =?utf-8?B?cXY3SmFPM3NaNFFQQ1h2Nmk1ZkZoL2JGTDdnTnF5b1ltNWRDTVlaNDZVS0My?=
 =?utf-8?B?MllGd1h6RGlsdW9yS0tOdEpXcDRQZGpFV2txcFUxNDFnV3JJMldOMDhidDB5?=
 =?utf-8?B?S1lUNE5saEdMenMyVFM5ZTlmeE95M1JzSDN3RFpvVktqeFc2RmFQbGtUMWFy?=
 =?utf-8?B?OTllZkc5TXdwWk9zQ1RJZEs2U2V6UVo3MnF4a2s2cXRoRkI3VTcyU0xKRWNP?=
 =?utf-8?B?bVdGQUJuOS9zamdKUVVFVjg4TjE4YXd1K2sxWkpQV3VlWDlwdFhuaHFvbHdX?=
 =?utf-8?B?cjhlTStNaHVkRW4vTkd2T2RKY2RhcVlqR1dtTU12Yy8yamR4TU9Nem4rRmIr?=
 =?utf-8?B?Vk5PR3F0dHZ1LzZLN3ZGYUdGMW8xL0xndzBPRm41MzJDOFkySXk2WWUva254?=
 =?utf-8?B?eWdtd3c1VGdJMGxHc2JlNEVxMVNOekFjUFdPcnY4SGhzajJoMTZ5SVc4U2or?=
 =?utf-8?B?OGZtL3hCS2xEMmphMFk3ZzNHSk1WelhHSGQ0dDhXdjBpWXFkRjltWFVNQkNq?=
 =?utf-8?Q?WSpo8q7/H6J96PWMvTgkbNwzX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6057D896830E1E4B9216CF2CAA943281@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	C+8l+gGhBiWlcJjstVKTut1YP+Ib8rLtFgIxnFsY1FDh50xvgJWePxfrV25/eK+SYf7RxvZFqXojOLx8BR6LOUj/ewM2birlBBBvebcdrsJ1SJm4gz/lcDnIuJIqnbHw9tBcodZY62CL/yEz3Px9IjQBnYxjjOUsn5PUUF+L6LcyBNbhQZy3ZIcg3tfSlLwh3MivC3rOvjcJHPM4IdoneY78Y5dBi9C3GcOh47m/iagzuirbboRqI417IvZo37NJo61O5y2CwtJTUjkJM3P3JYxE6CJFrM0f2Uch/Ee0f8sZvakLSCtzorRW+QOldFtiz/zwR4mjF8knin5EyHMuIXQGZ5V2AJEDeqwdL5RtfBtwjdJSNYgBZIFgT4AAX4IZpAQNT7/rbhpOAiREE26fwbFNjdgF66kk3bywNDnHdWNGzuPqLQ4SIQNRTsnHkOpAjCAFxw1xWFX5ukqRVqvmd7pwzV/sZ6VeQ1P0YWPyebGoO/FiLLYO5LaPyKPO4F3PTun1MprF9myauT7cMdSVqmzS359FfdNossgpR3eqyLrjQ/FVGHl/nM1Tvw5jR+xgXZHu+IHzys/jzdlk80bqHZSt7XgTrWEetHzD1DMG42g5xgTcMhaQ/ehjY32UARybX0Bsb4drRMZDm8Jo9dGtTg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1902b7e-7ffe-40ac-5532-08dd77b38d93
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 22:12:01.4320
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bj/zp4v06DzVGyrAEdzHuJyxsebt2vHVWPx2yaAm/0SsrMvzuorYp7lifqe0lWvYXpYjpQt/LLWqh4QscrASOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6114
X-Authority-Analysis: v=2.4 cv=L9cdQ/T8 c=1 sm=1 tr=0 ts=67f6f0b7 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=2VgnOU1uVOFPi6FzNhEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: k-psjtlrwLiIVZauCPIjvA5nPmvEJjhb
X-Proofpoint-GUID: k-psjtlrwLiIVZauCPIjvA5nPmvEJjhb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 mlxscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=615
 suspectscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090152

T24gV2VkLCBBcHIgMDksIDIwMjUsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gT24gV2VkLCBBcHIg
MDksIDIwMjUsIFByYXNoYW50aCBLIHdyb3RlOg0KPiA+IA0KPiA+IA0KPiA+IE9uIDA5LTA0LTI1
IDA2OjI1IGFtLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gPiANCj4gPiA+IE5vdCBhdCB0aGUg
Z2FkZ2V0IGxldmVsLCBJIG1lYW4gdG8gY3JlYXRlIGEgY29uZmlnZnMgYXR0cmlidXRlIGNvbW1v
bg0KPiA+ID4gYWNyb3NzIGRpZmZlcmVudCBmdW5jdGlvbnMgdG8gYWxsb3cgdGhlIHVzZXIgdG8g
ZW5hYmxlL2Rpc2FibGUgdGhlDQo+ID4gPiBmdW5jdGlvbiB3YWtldXAgY2FwYWJpbGl0eSB2aWEg
dGhlIGNvbmZpZ2ZzIHdoZW4geW91IHNldHVwIHRoZSBmdW5jdGlvbi4NCj4gPiA+IA0KPiA+ID4g
V2hhdCBkbyB5b3UgdGhpbms/DQo+ID4gPiANCj4gPiA+IFRoYW5rcywNCj4gPiA+IFRoaW5oDQo+
ID4gDQo+ID4gVGhhdHMgYSBnb29kIGlkZWEsIGluIGZhY3QgSSBoYWQgdGhlIHNhbWUgdGhvdWdo
dC4gQnV0IHRob3VnaHQgb2YgZG9pbmcNCj4gPiBpdCBsYXRlciBzaW5jZSBpdHMgYmV5b25kIHRo
ZSBzY29wZSBvZiB0aGlzIHBhdGNoL3Nlcmllcy4NCj4gDQo+IFRoZSB3YXkgeW91IGhhdmUgaXQg
ZG9uZSBub3cgZm9yY2VzIGEgdXNiM3ggZnVuY3Rpb24gZHJpdmVyIHRvIGltcGxlbWVudA0KPiBm
LT5nZXRfc3RhdHVzIHRvIGJlIGFibGUgdG8gcmVzcG9uZCB3aXRoIGZ1bmN0aW9uIHdha2V1cCBj
YXBhYmxlLg0KPiBQcmV2aW91c2x5LCB3ZSBhdXRvbWF0aWNhbGx5IGVuYWJsZSBmdW5jdGlvbiB3
YWtldXAgY2FwYWJpbGl0eSBmb3IgYWxsDQo+IGZ1bmN0aW9ucyBpZiB0aGUgVVNCX0NPTkZJR19B
VFRfV0FLRVVQIGlzIHNldC4NCj4gDQo+IEFyZ3VhYmx5LCB0aGlzIGNhbiBjYXVzZSBhIHJlZ3Jl
c3Npb24gZm9yIHJlbW90ZSBjYXBhYmxlIGRldmljZXMgdG8NCj4gb3BlcmF0ZSBpbiB1c2IzIHNw
ZWVkcy4NCg0KU29ycnkgdHlwb3M6IEkgbWVhbiBhcmd1YWJseSwgdGhpcyBjYW4gY2F1c2UgYSBy
ZWdyZXNzaW9uIGZvciByZW1vdGUNCndha2UgY2FwYWJsZSBkZXZpY2VzIHRvIHBlcmZvcm0gcmVt
b3RlIHdha2V1cCBpbiB1c2IzIHNwZWVkLg0KDQpCUiwNClRoaW5oDQoNCj4gDQo+ID4gDQo+ID4g
V2UgY2FuIGFkZCBhIGNvbmZpZ2ZzIGF0dHJpYnV0ZSB0byBlbmFibGUvZGlzYWJsZSBGVU5DX1JX
X0NBUCwgYW5kDQo+ID4gZnVuY3Rpb25zIGNhbiByZXR1cm4gZ2V0X3N0YXR1cygpIGJhc2VkIG9u
IHRoZSBhdHRyaWJ1dGUuDQo+ID4gDQo+IA0KPiBUaGF0IHdvdWxkIGJlIGdyZWF0ISBUaGlzIHdv
dWxkIGZpdCB0aGlzIHNlcmllcyBwZXJmZWN0bHkuIExldCBtZSBrbm93DQo+IGlmIHRoZXJlJ3Mg
YW4gaXNzdWUuDQo+IA0KPiBUaGFua3MsDQo+IFRoaW5o
