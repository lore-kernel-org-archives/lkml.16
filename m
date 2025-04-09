Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7ED43AA9;
	Wed,  9 Apr 2025 00:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744160210; cv=fail; b=D3+WsIRHgSWet96jLfz/C0wEFQKY0k3u6326ZouctEBWCFKP7Ma8w0tc8Pa+J68nV+RvI5jz1Ejb8EKoly0KYMJKiOStGrRYfiGQS9tb9pRWyUt4VY0OgGntqEkISnkkm/SPp/9u1ZfIx54/zvj+cZ4IecKKeIfXms20oGZll5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744160210; c=relaxed/simple;
	bh=layCsH5d1rQqV6Zq63NUsk1J8PxT4rL6j/KwpE33IvM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Iom51uejBlTbC+GoCd8NS4A83CoQ1yz5ysJP9WkkhEtWxtghXVH9ZoV8V15M1yPmuutWxkIW1QsBSKXXmsC2i32sjtFi6Cg8KfIiyoD5AiouM061efQe2pvXScH9Nj/dnAKo+MqnNSWTR0KYvUJ2S74r+2zSgGAm9jWI2cLidlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=rPB5mQaK; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=aYinUb+4; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=s/eDMt7v reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="rPB5mQaK";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aYinUb+4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="s/eDMt7v"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5390MIqC031725;
	Tue, 8 Apr 2025 17:56:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=layCsH5d1rQqV6Zq63NUsk1J8PxT4rL6j/KwpE33IvM=; b=
	rPB5mQaKp95rVzSmt9PmIwd7ksDaYWdOB3EnOhUjTCw+w8y3VieL5lXmj+klkQ3d
	PUKeLu2vgS50GPgNwNxD9XtPNh08aRMy4Ia1b4YNVOWKoBLDrOOjhKrq/OJdqa2m
	CKdbTcFHAoAKeAP7VmiiYlXm2w/quvwuj1kVwWPU2J/Y8eWXfeOT+43nR7eJlpPm
	Jxnn8uzeBcOk6Dt6MsZcBbh+LANg0m8qHcW5cIK1nKjW7opJQA9NV5ia5fJXBI0p
	dkPE3imwtbua3ZXal8X/CLixVimcPZloAIc7pKq8XCpMq9cfhZANl9vJRSdMfNMI
	641h8X/svbimpyHdEpKRGA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 45u3hpj3vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 17:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1744160187; bh=layCsH5d1rQqV6Zq63NUsk1J8PxT4rL6j/KwpE33IvM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=aYinUb+4ml6eWTIEpKnjLEPwAL9DtkIOgGgTQjfIpcQbdbxivTfAseQNqIukdMefO
	 y7bHYTNtEH8QS/anq07c5OOfjx5vwJOx2UNt+s5iTjxks0BM1/joH3fVrjfDEyX/f/
	 Z+lXlAGYU1PF+9oOTXpVTvljRek9oB7blGSjcxmeiDnDEX5gAI7gI/Z6m82t/Q93MC
	 22ojgiDWLT3XBIfOSMIQcv4MHw7JWlJMPLkWW1UGOaQ+THEoCb4LiRIpTABJy2od2w
	 EECDwntCYnyR4OL3A2/EpXI5ItCHgQocLWIWt5tRPdaIpBtPxJKOStAaNTBKUNR8WJ
	 cJiKN74nRynqg==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 986A74045F;
	Wed,  9 Apr 2025 00:56:26 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 2EB10A006F;
	Wed,  9 Apr 2025 00:56:25 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=s/eDMt7v;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id EA2FE40998;
	Wed,  9 Apr 2025 00:56:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUgjVdGnUH3h/h+kg0QdSs2c26uEHVUo94HqqzgUvXq3ri6Gu/FcuHgdbGs0hTfBxIhyr8n9L5YnjgaGfPM7Ez6ZRIB5DQzAM32fCzxLPAw9r9tqiMMz/mxdbwAfhzzDLBh4YcSWU/u4FhoJ46aEbL0vt+tftmvuYPf+89tip3+jMgwtzUD2ltqt4ArbUy0Lm/OX5WXg4Hf3YzkQ94uEZZMohSUCgRSQTUxRCXXouS8zS350mLvvLPnVUK4VIwriXivFvvKZt2eC2aWVd+7OT4MRLlSqQDJKXMSVg6H7dZvxCXAUOAWLZbCI372nkEKEKSHPmzRSzrw6D3KizHi60A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=layCsH5d1rQqV6Zq63NUsk1J8PxT4rL6j/KwpE33IvM=;
 b=Y9kGYl/Y8k9asrCm/GVMwqPG9gF7jR1wU98RoLU6Ck681X71jAsA/ADE8qpDktWe3p3gvmUc6hKiDLmA2gxZeNw4ziipD5ciLVUzKOseaT0Yp1FweK0lcliI5hMJUx5I92lv6dIIqrTMEW+odQPasi51/jH5WUxr3MVCnJ9jJc8gPA/DZGTTFqRTcQTb7xk9UDtHeoLUFw7MzMZScIDhlyKZ50Udvm3E/CyzAe6inM6lWCkjCJGLJcrrpmfq01ZQNL87rEZQuHL2FNQ+4YkZlWVoZZkPILbwEuM9sY09juCswc+gSwZ01d7BX4+YEqXOzb87CrDaSAJosw/BUPo45A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=layCsH5d1rQqV6Zq63NUsk1J8PxT4rL6j/KwpE33IvM=;
 b=s/eDMt7vtDvuf1+DerdrJijZc9cKV/bD0mQnW8kuGMBoCE/pnIF1D6IlZicl6CFniOxf1mPYQ/3V5FyEO+PALYaSFTbBu8JGdhMpj7IhsPz8IHvpDSuBmV8dxjVxYlSksFLp27wDsgprvvumXjGFgtLfaGSrbXL70Fdm1LQmTGY=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SN7PR12MB7881.namprd12.prod.outlook.com (2603:10b6:806:34a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Wed, 9 Apr
 2025 00:56:22 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 00:56:22 +0000
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
Subject: Re: [PATCH v1 1/3] usb: gadget: f_ecm: Add get_status callback
Thread-Topic: [PATCH v1 1/3] usb: gadget: f_ecm: Add get_status callback
Thread-Index: AQHbpIi7X8UMKq4LUEK5WxlPW1wHoLOY/FQAgABCPACAAUzIAA==
Date: Wed, 9 Apr 2025 00:56:22 +0000
Message-ID: <20250409005620.qdzbyasz5mpo5ok6@synopsys.com>
References: <20250403110805.865311-1-prashanth.k@oss.qualcomm.com>
 <20250403110805.865311-2-prashanth.k@oss.qualcomm.com>
 <20250408010812.qcgvinzqghrpyuly@synopsys.com>
 <0b210acd-9030-4038-ac7a-480dc2b5db0f@oss.qualcomm.com>
In-Reply-To: <0b210acd-9030-4038-ac7a-480dc2b5db0f@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SN7PR12MB7881:EE_
x-ms-office365-filtering-correlation-id: 10a7bb22-84d9-48b9-64ec-08dd770158fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RDlIRGxyYU93MU85MEkrdmtyaUVNSHNpY2VsYjdZTHVkbUZ0dzZOY0JUU0dI?=
 =?utf-8?B?UmZRLzdYOEY4cmRDVkhxWmFDbGU5VGJySDUwZDdaTzFWREhnblJxdmpxcTVa?=
 =?utf-8?B?M3RkUGJzQkFSWU83a250WHNmV1o4dHVEb2Vkb0k1dTFZQjRVMThqQzU1elNM?=
 =?utf-8?B?NkFRa1p5WjdlT241eHRaRmVuQjkxWW9uRVBjaXhxOFFlTERvMEF0RU14QlNT?=
 =?utf-8?B?bHFEeGxMVGJOYXFlTEtrTTV5VEZRSnh1QlBsWTJRQzVHYTMvSHQ2blBoSTVs?=
 =?utf-8?B?dzJHaUN4MGpmU1N4Y0NCSmFHSG42bHQwa0JQdWQwWGNGbVd2ekVFU0FGYlgv?=
 =?utf-8?B?cGcvOGNKVGlNeFhCS0liM3h5YnY2WTh4RVBtZFpCMDRnU2MxTFQ3M3ZZamxj?=
 =?utf-8?B?SzUvN2pPdFIvNk1UUDVTZVdKWHpTb3RNbnRodml0ci9HTzY4RjRkNE8vUEIv?=
 =?utf-8?B?U2VHdWNKT2JuU21Fc2FHMDVmRmRKN0RVVWFQZWN2QkVYeVFrV1hFQXFOemIz?=
 =?utf-8?B?aWE2OTFFVjE2TnlJYVhJUDFuQVdLVTM2elptaGJFUldiOEVTWmZScUtkdnhP?=
 =?utf-8?B?c3grUkwxTUx1RlNKYXFxaCtHMFd6d0NMMkhQMVI5bTFHdW9mR24wM1lvUERM?=
 =?utf-8?B?c0hVOEhCMU90SVlkeG4xOHhzaDYwSktMM1MvVS9DSXN3dTNNc01GUi9Sd2F1?=
 =?utf-8?B?RytwbVZUb3J0clhMelBpSTdldmpmYS9kbEI2RzJNOTVsdHVRWDZET2ZoUjhF?=
 =?utf-8?B?cVpBa2tUY0dobDFrazBRYkRlQ3FIWFFWaWphS1hrV2RTZHdwYVE0RXhyZmFs?=
 =?utf-8?B?V1BIaWRSQTlJSGdPaHQzV3NuUzNlakpNZldoQlZTYzQ1VVNMRWF4ck9hWUlh?=
 =?utf-8?B?ci9BNGFOOU4wWlhncTR3SGRUOVBFOFZ5U0M1VjFvV3Q5aGxqWGYzQm1sMkNG?=
 =?utf-8?B?SnV2Ulo3TndlZmZ6N3o5amUwbmc1dExEQXV5RlJUZ21tbEtFd2xtV2tFUWVD?=
 =?utf-8?B?UTZHcFRDVzJ4WEtCVzhHMW5jeWVTZXdrUGd1K0wxTmhMV0xHYitGRjNjMzF0?=
 =?utf-8?B?bzRDR1BldmVQMkczdlJqVEhJNzB5NE5ZMEdGK3lLeDNCM2VJSE40aDhQYVNQ?=
 =?utf-8?B?bHRjUnNFYzdGbnlDdUJkMVVYS0tIbkoxcDBhQ0UvUlY0NjJvVnVrSGFsNmI2?=
 =?utf-8?B?SkV3TDJHVERVb1hUdmFYVCtsZW93VERpWHhYeUw0eWVTSzdPOVY3L3VYM1Nx?=
 =?utf-8?B?WmVWTm40WlZQMDdmYzd4Zjl4WEduOHJBbkdWbnVYSTRuMTcrRUFMRmM2b1Zv?=
 =?utf-8?B?Tzh0eS9DZ3YvU1JuY3A3d3VVVnNhMmUxd2RNaG84TFJsblJGYjRiN2xlVmhQ?=
 =?utf-8?B?UUwzV0E3MUVYZHpjZlJhejRnUG1qOHhNTTFJWnZwQVVmemJYck9zT25tM3dI?=
 =?utf-8?B?ZlBtcm1uVHRpZXhXRCtuWVJhb0hXRG45cmxtRkRrcUUxVDh5TFJLRzIvRVF1?=
 =?utf-8?B?SEVuenAxanBXZFN6bXVwTWp6bXRTOElxb1M2SDVsaTVXRVJaKzJqZ2lQTXZk?=
 =?utf-8?B?eithUXp1ZlRycjg4NVhPd0N6NytBbEU5V294Yjdxc3pNUUs0a3V6SEZyanUx?=
 =?utf-8?B?SzhtdzJPYktEMWQ4RmVEOVdTTHFsTnphN3JGQ00weElQcDdDOTRHQnJiQkJF?=
 =?utf-8?B?ZE5XUk9hdGMwQTExdjZRZHRVYjAyWTJIb05OVzhxdkVRLzg1eFE3QWowUUlZ?=
 =?utf-8?B?WDBzMXBBdGdIWUdTWERZczlyb2pvcjU0aDNrME84UnVML0ZybVVyT1YyVng2?=
 =?utf-8?B?RzcvOUtMY2xLY1JYVDZyMWkxUzJqTjViQmF5cTZ1YkwzUVcxNStGSmJiNWVN?=
 =?utf-8?B?MkdwL0pNQkJKb1drTGxMbFA0TFlQSzFmT0JTak5iZmprQkV1ZW9YRzJWWEE3?=
 =?utf-8?Q?fDtbrYjHQU7fU+ogSpn81QtBc8sUl/i2?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OWd1VGxLZEx0bENaczRJSFg4V05MMTBtRDJhMC9zRzlEc2xjc2dhZE01ZFJJ?=
 =?utf-8?B?dmd3d2lxbkVqVWplcWdFd3RyZEEyYjVyU0dOSGNVNnZGVmRhR01QRU5oSHBX?=
 =?utf-8?B?V2w3QWQyQVl3MUo4Y3pURkE5RE1IT1poL3RtcVRzSEl5M01NZGpzQU5DSGZt?=
 =?utf-8?B?aEVJbDV5VWdSdVlwM1h1TWFRNWNZVVNWR0Y3anUwRlVic1MyOXdJcEpobDEx?=
 =?utf-8?B?K1BJZHl0VVA3Y3cwYWl3YlpVVzYxZDZsVEk5clZkOWVDOHpTVTlNQ2d6VmVQ?=
 =?utf-8?B?Y0oyMHFxSWs0N1FVZzRJYndJYTBEUXZqNVRETHN6Vy8vblhlRUo4andqSWxU?=
 =?utf-8?B?S1FSVkhXdXlacUlIQUNyUFdINFZHUGdwZjBUZ3Zia2pnRnN6Qys1MTFHTmRI?=
 =?utf-8?B?bGduRFhBOEJrNVhKRnJjcHMxb3NLYU5iZ0JrNWswamxkWmZJYmJ3UlA4NHgv?=
 =?utf-8?B?NVV6bFIzR3I3cEx4NEtUTlFQUEJLWlYwUVJPeTJuYXVuUzZydGxHUldLNjFB?=
 =?utf-8?B?MkQ1b0NrSit1SDJkMStoNnZMNFdzUGRVVTVLL3F6NnIwZUVZaGdsUUhjdmdC?=
 =?utf-8?B?OHZZZEd2UnVTWThiME10T1ZEVTJFK2kwb1ZBVHJvQkwrUXF3Yzk0dk9JV2hD?=
 =?utf-8?B?MWRtbXpLNE9EOTJTUERJMHQxRjBNVUdvWGo1b0VndjVrUlpvNVhGeTcwajFr?=
 =?utf-8?B?SlFTQmY4L251dHVjQzhBWURTMm9NOWFqTnNqZE9QZW5uZFhMVHZCMXY2TG5J?=
 =?utf-8?B?anRINWRxazNkNmpnVlhPS0xEZE1mSkhZdTZ6U3kzR0J6dWx6RFJLZUlHM3U3?=
 =?utf-8?B?eUJLMFQ1UzBGS0Y3VEk2MUxPM3hPYmlzSDVHdzN0QzZmOS91NWQ5RGJsdmt5?=
 =?utf-8?B?ODNPNEJPdVBLUjVYL054T1JPY1RXbk5YUjlacStDNUNWSitPai9IWWZWM2Er?=
 =?utf-8?B?aUY5UXhKZjFUTmNhQkdhdnpsOFhubk9ZOGQ5WTF3bmIrc3o5TW1hbjJGL2ZZ?=
 =?utf-8?B?UVpGNjhwZkhkWlpodXNvR1N3TW9QL05qUVhjdHloZ1k3WC83V2NObmJkemJ2?=
 =?utf-8?B?dHBOMzl3akZ4K0kralNHK0dzdVZtSGFiUEZudkl0ZFVuQlhnZmFmMVh4WVFH?=
 =?utf-8?B?VHJtNGIxTFRZQWZUTm9ETXV0UUl5aG5vUmRObC85WjBsQzdQcHJPamdETzB6?=
 =?utf-8?B?UnBTTW5PT3ppR1Z0U0cvd05KTWE1RSszenQ3QzBlSXdpNkxwRmtQOUliZGgr?=
 =?utf-8?B?aC9Dcis4Smhvb04za1FxcjQxL1hHT21BdTIxT2d4ZXNjTVR5WXgvNVRJdzVk?=
 =?utf-8?B?U01veGNQVkZSTWtQTWQwTm12MjRDaisvMG0xZitEbk1WT1p1MUQzY0x1cjRs?=
 =?utf-8?B?MzVuVEg2OG94MDZTSnIrcFd1K1llbVFGcEdBaE84YWEzRnljMkhycHlHdDNS?=
 =?utf-8?B?angvSm5zZHpLRCtwdXhkbnlicUd6djZ3SlhDYzhoREJuVTBwa3hRc2hQZDlw?=
 =?utf-8?B?aXEyOFFXTUQvVVVRU25ZaHlOcnNVKzNhV1JlTHdKcDhkS3ZiNWw5WTVTL3Za?=
 =?utf-8?B?cWVPZVBvSVlIYjc5ajlsTkxweHUyQmxuYjdwcnpRdTQ1QTFMcUJtbDBuODdz?=
 =?utf-8?B?cjRYODhWbGp3MHJqNlg2enJXbW9sRUJyNm56dFdOMVRKT1NWKysybFNuSXZM?=
 =?utf-8?B?Q01tVGNzNVFRbW5EbWtXMHU5RXA5eE44YmZvRzk3enpOckFCdUxUTkNJNE1o?=
 =?utf-8?B?MjB2KzdjRzc0S0h3ejJhc2JXSHhxMkpBOW5NM3p6bGpDY3BQbk04RXlhOFox?=
 =?utf-8?B?ZCs2eXYvOGFEWVVpQ01JZDBJVy9lNytDOEEwbXh4TzI2M3V5blBxZVc4dGxr?=
 =?utf-8?B?WXFtUWpRSk5BSXVoek9BeFFtRDhmb294ZnBvVDNOblowVE9Ga2IzeUlablVZ?=
 =?utf-8?B?MXFvVWhRd0VsQzBsZ25NM2h1TU9JUWM5dW9rUTlDWVVRdEJmQXN4VTBjemZC?=
 =?utf-8?B?cXlud1psZi9Fd05kVGtSeTF2Q1hFc0dWaGxFQm4yWTQ0akhsOVNUQXpqRkth?=
 =?utf-8?B?WWovdVJLSzk1TGNiRzl4ZHdWZkpZdDBRN1RUZ1dnZDZnTGt4eWQ3ZGxMenV3?=
 =?utf-8?Q?CJia75+BBxR28ehvQq1LlxQM4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF19079B207F5B4DA17253031004D532@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Xjm/WFtBTR1nMDwLAOn9Gr5maXQICIlhaGAGGqMjDHvD6aDeU9u3kRIVpgqYt5On9nchM62mqmPbPVXRXPK+SvHefmQinkGI7YJ4eQprC4z19NXyp1cY44iohTnxXyQW6AVkyiZGa7UyNOgNSa/3JZA/vUdkd0va60CXnXUs94IkhL2ZvVJFpd5ldP25vT2RhurTwawj9aInmKoZQ5aPKEWEj/uvV0E0d87rbSR4PIngzt/YVUhiU0ruN1GukF6YwD2IUzboroaKuVPG2qpLJ5vwdRU0CbsNcIFkZr9rywFzeGmJsjZwZIz6YHsDgbdOOIPo58UEz9lu/1LfbMjBFnXVkN9vez7gnkij18WIgZFYaL2x1KKZXo3/IYzYfF367G0gxGEw5X6IiY0dM3dkkNV0UK1hBPY9he7ii2YLM7BXZvAgxe20xiucAx+lcqvaSYSBXepMRqewY8edf9ky5olnnD23nkB7GU98kK/aFjAP/MQ7zaoXoW5i92h+6VmCxw6SEg5r8hLM4ylqI9h980Fk6NOho46A6UQb9h4U+0TnTvQiKUblV7A0y1u0fMAy/qENBFHAQYFPTsUHosSaMxjeCMyTmZ2MjVj3wFTmPM0RKdD+RwlqAfdXt3pRV6BgkjR4v6OWP7LotlDHCgDgYA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a7bb22-84d9-48b9-64ec-08dd770158fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 00:56:22.7928
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rVr17hZFnk/npvTFAdeZleoZondfZWgvWEhxfbEA9iQeOAJJZPVUK5Ohpc9AY2LjYL/0W34GuoKeZvTU90pjFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7881
X-Proofpoint-ORIG-GUID: 06Zzx9kggPpLyGEg-qItNIk0avBnISUP
X-Authority-Analysis: v=2.4 cv=XIAwSRhE c=1 sm=1 tr=0 ts=67f5c5bb cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sUieA0xXK2G4WRzN9doA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 06Zzx9kggPpLyGEg-qItNIk0avBnISUP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_09,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 clxscore=1015 mlxlogscore=893 lowpriorityscore=0 bulkscore=0
 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504090002

T24gVHVlLCBBcHIgMDgsIDIwMjUsIFByYXNoYW50aCBLIHdyb3RlOg0KPiANCj4gDQo+IE9uIDA4
LTA0LTI1IDA2OjM4IGFtLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gVGh1LCBBcHIgMDMs
IDIwMjUsIFByYXNoYW50aCBLIHdyb3RlOg0KPiA+PiBXaGVuIGhvc3Qgc2VuZHMgR0VUX1NUQVRV
UyB0byBFQ00gaW50ZXJmYWNlLCBoYW5kbGUgdGhlIHJlcXVlc3QNCj4gPj4gZnJvbSB0aGUgZnVu
Y3Rpb24gZHJpdmVyLiBTaW5jZSB0aGUgaW50ZXJmYWNlIGlzIHdha2V1cCBjYXBhYmxlLA0KPiA+
PiBzZXQgdGhlIGNvcnJlc3BvbmRpbmcgYml0LCBhbmQgc2V0IFJXIGJpdCBpZiB0aGUgZnVuY3Rp
b24gaXMNCj4gPj4gYWxyZWFkeSBhcm1lZCBmb3Igd2FrZXVwIGJ5IHRoZSBob3N0Lg0KPiA+Pg0K
PiA+PiBDYzogc3RhYmxlQGtlcm5lbC5vcmcNCj4gPj4gRml4ZXM6IDQ4MWMyMjVjNDgwMiAoInVz
YjogZ2FkZ2V0OiBIYW5kbGUgZnVuY3Rpb24gc3VzcGVuZCBmZWF0dXJlIHNlbGVjdG9yIikNCj4g
Pj4gU2lnbmVkLW9mZi1ieTogUHJhc2hhbnRoIEsgPHByYXNoYW50aC5rQG9zcy5xdWFsY29tbS5j
b20+DQo+ID4+IC0tLQ0KPiA+PiAgZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfZWNtLmMg
fCA3ICsrKysrKysNCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykNCj4gPj4N
Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdldC9mdW5jdGlvbi9mX2VjbS5jIGIv
ZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfZWNtLmMNCj4gPj4gaW5kZXggODA4NDFkZTg0
NWIwLi4wMjcyMjYzMjUwMzkgMTAwNjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvdXNiL2dhZGdldC9m
dW5jdGlvbi9mX2VjbS5jDQo+ID4+ICsrKyBiL2RyaXZlcnMvdXNiL2dhZGdldC9mdW5jdGlvbi9m
X2VjbS5jDQo+ID4+IEBAIC04OTIsNiArODkyLDEyIEBAIHN0YXRpYyB2b2lkIGVjbV9yZXN1bWUo
c3RydWN0IHVzYl9mdW5jdGlvbiAqZikNCj4gPj4gIAlnZXRoZXJfcmVzdW1lKCZlY20tPnBvcnQp
Ow0KPiA+PiAgfQ0KPiA+PiAgDQo+ID4+ICtzdGF0aWMgaW50IGVjbV9nZXRfc3RhdHVzKHN0cnVj
dCB1c2JfZnVuY3Rpb24gKmYpDQo+ID4+ICt7DQo+ID4+ICsJcmV0dXJuIChmLT5mdW5jX3dha2V1
cF9hcm1lZCA/IFVTQl9JTlRSRl9TVEFUX0ZVTkNfUlcgOiAwKSB8DQo+ID4+ICsJCVVTQl9JTlRS
Rl9TVEFUX0ZVTkNfUldfQ0FQOw0KPiA+PiArfQ0KPiA+PiArDQo+ID4gDQo+ID4gV2h5IGRvZXMg
VVNCX0lOVFJGX1NUQVRfRlVOQ19SV19DQVAgaXMgc2V0IHJlZ2FyZGxlc3Mgb2YNCj4gPiBVU0Jf
Q09ORklHX0FUVF9XQUtFVVA/DQo+ID4NCj4gV2UgY2hlY2sgdGhhdCBpbiBjb21wb3NpdGUuYyBi
ZWZvcmUgY2FsbGluZyBnZXRfc3RhdHVzKCkuDQo+IEhhdmUgYWRkZWQgc29tZSBjb21tZW50cyB0
aGVyZSBbUGF0Y2ggdjEgMi8zXSByZWdhcmRpbmcgc2FtZS4NCj4gDQoNCk9rLCBsZXQncyBkaXNj
dXNzIG9uIHRoZSBvdGhlciB0aHJlYWQuDQoNClRoYW5rcywNClRoaW5o
