Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993B68BEA;
	Wed,  9 Apr 2025 00:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744160177; cv=fail; b=Hmv6wR2qTIGsWnTY6z27dW5QFLRzTYAaliFj4V6DcZpYS96ubPetU1V3bugPw3sJZ95zRs/wgb0WE322iTkE9KLpq+c1TgbeSziVpaYQHK2A6nBYyHrG9CJdavIXIjjSGcayIzRJgkVQYT9/GjQuLT4J1T4NLPJ3hEoHuqhGOvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744160177; c=relaxed/simple;
	bh=5un+OzMkI/ImBQaEmo904PhAaKRZJ6I511kPAYLJX9E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jmLGovxlS+yb+MEaxRMALK6AOvyR1V9dEsYGk+DWCX4pfcwZ/gvoe5HvM+iapolOXFVSHKFPQrt9IqU4wBW4Z8NQwMHhR+nLR1ziEOa2+KJJMRRNrefyRwh4F34sqbGIQNxKIGLSizVHZi/0g2CpAnMplJ7dfv3veD1so/CesEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=jiNHJxtq; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=HSAwb9lt; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=WT9sYdQJ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jiNHJxtq";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HSAwb9lt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WT9sYdQJ"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5390LtUP031175;
	Tue, 8 Apr 2025 17:55:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=5un+OzMkI/ImBQaEmo904PhAaKRZJ6I511kPAYLJX9E=; b=
	jiNHJxtqSXtPYnXS9G1x6MqE8C8ZbQO3KtiulHfAs4XfmDUpXM2evD2IyGCuWUcl
	K5Qy3erY7X8gIMFk+IG4zXYMS1MIEweW3SFHXxpUjggO3WHqFhRhPlrAVwrU1y+6
	xZ8LHFMpagW4CvsN4l+rqYlXqJDqX65VLiYuL/YdSdasKwt9VNEyKBshqQugDemO
	J+q5kZFyNOvp+esT8niK4CaWBVuT9/ofH0zo9XBZNA7TVwN0D8AyhQbxiuWlGciy
	3X60oc5r3DMZ/dC+0ffr4zwUhLq0C6LHo6w57okwFkCsSzIiyABP1aioHTiDaVNq
	o4zWQt+0vwxOnZ9RmqRcAg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 45u3hpj3qq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 17:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1744160133; bh=5un+OzMkI/ImBQaEmo904PhAaKRZJ6I511kPAYLJX9E=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=HSAwb9ltvG45WZKWZTPD9oUHWrQO1vsRNcf+bPKWq4bfPVtV5HDOPaoHpaWasKKX/
	 b7/oaEh1iYh4fyu2sLz8Ts47DeBZEM9NkyyjJdI5HRkojxICfpYvYQjL532ycU7Pul
	 AvXJrRcp4ZKXVXxdwRVmEHl//Owt5XVt0j6PW4xeFrqgly0XEBZnJj/FjVEQ+H9IqL
	 gjWs4t8a8ElGIRp8xZJy6fn4dCX6uQWm+aYsA3+/JzDHS6We1ycTVFoaspGmIxKebt
	 VhJWOiLY3osVJKsrJalR4nXo6ndszDfKPQbTlte6GF37Q89bO2xo+/TArUlUhrOQac
	 4NZKiUN4L1ELg==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 29059405E2;
	Wed,  9 Apr 2025 00:55:33 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E283AA0096;
	Wed,  9 Apr 2025 00:55:31 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=WT9sYdQJ;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id BCD0340347;
	Wed,  9 Apr 2025 00:55:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jefz36zUbaghsgBaQluSnth33xTPvaSdFlcSQnBM9Gsim+WWIn6yBOdpEgDkCUD/Pd6Gnmp++BWGbU0Qeh1bC+9EmOMjv9NBLUGMQo4rhCfaVlUiIE1N6lJISsTAey/iJSFwaWu06v/zwVZoKBzFbDM/zpNCnq0exwOELCmgCEMJcOY5vt75N45j39vmXqKDB/u8gMmjhg+hZE/dVrymLiWI2FeCw3+lLVQisws4Q4kmtb8MrIPnsiDJwpcEGJzXZ5rk0u32e4SefiapQloDtiIx6gO+t7YpY9QjnBh8ZMB95fKmI2BCH2Ui84sHRWjjdCsYQjTsp3l+eu9vtCgpMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5un+OzMkI/ImBQaEmo904PhAaKRZJ6I511kPAYLJX9E=;
 b=UNZeMf8IraAbCBJBLHXdBxgLKmnM04078p8rpVXdSAcyHTiSzWFZlHSsODhrhA63fzKw1KVX0X9vfCoKWevYh/zAlqnwm+H/Z0WJN8FXf/7LFRwfrec7KgDLbpt2Fv2T49+Zem7KWEA0CcpKxtbfvEzL3Wsxhe+1g3Tquz02AEk32qrzVSb1cT6IH8nfwQIqfJ6j5ijU2XH1fEzwXmyCO/5vLaAlmLblx3HGJrarz24UxeokvgVSzmwxzKbCwV9j9P2tXXehAnkymh9TIPrn+BewkXGGc3JTKuenxb+H5zE3YIcivEQ+OosTleSjaASJqjJ5KW8ygLyMQpVc8JCMeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5un+OzMkI/ImBQaEmo904PhAaKRZJ6I511kPAYLJX9E=;
 b=WT9sYdQJjVK4G8Qf+yORBXSngycs5ppLfXmnUa74L8KG7YofrnX3ff4XbpWCSK2MNMBQ3HaxZZ7bgehKvY9N6axi3jWmmZtklkkdbtXTPadRRjcfGrnDtjrMuPP2u8Ege//X4/xOn6zzO2rn8tUqaPmXCCE6UJ6DyZn3gIrgoPo=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SN7PR12MB7881.namprd12.prod.outlook.com (2603:10b6:806:34a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Wed, 9 Apr
 2025 00:55:26 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 00:55:26 +0000
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
Thread-Index: AQHbpIi63HPVwLvMQEOG1YCtYDqZc7OY/w4AgAA//ACAAUwLAA==
Date: Wed, 9 Apr 2025 00:55:26 +0000
Message-ID: <20250409005524.fbehw2gonv3p7j2v@synopsys.com>
References: <20250403110805.865311-1-prashanth.k@oss.qualcomm.com>
 <20250403110805.865311-3-prashanth.k@oss.qualcomm.com>
 <20250408011758.qfdflgrrmahwmfqi@synopsys.com>
 <4d68cb04-377f-4ebf-99c7-c63b68aebf60@oss.qualcomm.com>
In-Reply-To: <4d68cb04-377f-4ebf-99c7-c63b68aebf60@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SN7PR12MB7881:EE_
x-ms-office365-filtering-correlation-id: b3f5a31e-a9a6-4738-50c8-08dd77013790
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?K3ZGZGNFUnBvUXdUclRzNTBRYVp5QXZFc3gxcTFhTnkxTTI5QlNHUjltZVNC?=
 =?utf-8?B?WjQzdkFJNlZrM2N4cmZnTm16REM1UHNlT1FDajFhZjJLck9TSlFpdURUQ1Iw?=
 =?utf-8?B?bFRmUWR0SWViSFRRQVNlQktqdzk0cnRiNGo2UGpmbVJTY2FYQVczelM3NnlR?=
 =?utf-8?B?ekR6TmhBODJqTFNETnBvbVpIalVRRVBZdEk1a2tUY25JNWNjQUVpZEYxejdY?=
 =?utf-8?B?eTY2bmtzVFZCZTdwVVlUclYwUVZtWDhCZVRSeUlFOEVaQkZFeW00TVhPMEJz?=
 =?utf-8?B?UUpNRStLYktaeWljbmRrdm5LREVOVVFDNG5DRlJDbnRsclZUMU1udlBUd1Y5?=
 =?utf-8?B?WGNsV0w1ajBvY0dPcDh6dEVDdG5VV3QxRnNqbmRYL1JSZmxQYVBTekdabGxo?=
 =?utf-8?B?ckpZL0xjeEtpcitQMjFpaUhPVVJ1dS83eDc2V2NEWmI3eFB1c3ZDcnFWRVBP?=
 =?utf-8?B?RWpvUHZ4ajd3UkhPNEMzY25TN1NwRHJ5VXg2Um9PVWdtL0xESGtVL1Vma3Ja?=
 =?utf-8?B?NTdKWW52YTEyb2JCTHF5Z250NWFLRHFvTVhKUDJMRFZqQ2RoRVg3S3RMTGoz?=
 =?utf-8?B?dkttL0pRamRzVzFyZ21XWC9Mbzk1aGVZTDEzOS83SGpHNWUzQ1RKZnRRVVRK?=
 =?utf-8?B?emFQT2tzYkJHVlRBZmlnM05MaktYRFZORG1EeS9hNThnNXcrWFhpUzQ5ekRl?=
 =?utf-8?B?MWh4Tk1DTHd3cXJjbnBOMkVoWnZuTkI5UHk3RWgwVXdGMkQva0N5MnhEbjdw?=
 =?utf-8?B?QXJIWUJLOHNTc1ZOVzRVaGxKTlZOMkhITmFCWTdBSHAyeE4vS0dxZUJ1T1Yw?=
 =?utf-8?B?VmVPandiY2dDWElEV2ZKdEhFK1BjSTF5QUFLMlJhVWNENk1yb3Z4UEg5S3My?=
 =?utf-8?B?eEViQzlNU01FYno3UGpGbEFWTE16M0tNdlVNd3BJZkNENVltZ1ErckIzeDFC?=
 =?utf-8?B?ODgyUFJmUzBCN1E3UW1ET1hkNmx3UTkrQ1dMR3VUeUgrNFc5encvcXFGOTdQ?=
 =?utf-8?B?VVl1R25mTEdIRmdmanVLeFdodjlPYlFIUzFSMHZFZS9UVnJ6a1cwQ0RGY294?=
 =?utf-8?B?NGpsdndZaGd2b0xlY1JzN25LUGQ1ZkJtUnJtamFpeXpzVEsrUG9NaEZ6dDkz?=
 =?utf-8?B?NmhXa3dwc0RrSFhnazVGT2p4WTU2d2Q3MzZSU0dBKzBjYThYWVpXZFVTTnEz?=
 =?utf-8?B?clN3Ulp3alpMdnlzQ2NSVFBBK3BTRDNQRVBmNFNVdWxWMVJ5SzdXcGdBLzMx?=
 =?utf-8?B?TXlEQmE2TXZhWjkwcUNSUVRsQ2tHVnpqZUlRWkVQREduQnFUTzJOUUJoaUd3?=
 =?utf-8?B?SFFqLzF6V01hWHNMMENXam56eFUvSXR0QjV5U2xDQjA1Rmh4bit4c3QxMG45?=
 =?utf-8?B?bXNvNEdkaVhQMUE1N2w5cmIvS2lKMXUwU01RdWJzSVZKUUdGM2lZZUVYaWM0?=
 =?utf-8?B?NmRBbTM5MDUrVE0wQUkwMHFmcDZUb1RBNmY2VmF4ZDZZN2VwMkxaSW9pQkd3?=
 =?utf-8?B?Um1EaXArMmYvekVndXphNVNjSklUTXYxYmhOT1hUc3gzR3ZVbS9hVk1LNC9Y?=
 =?utf-8?B?S3NZQ2RBWUxOblZTakVIZy9NZ2p0UmNXdzVrSVVxZEl5aWFHbE40WG45SWE0?=
 =?utf-8?B?Z1FUNjZHSk16Y01waDBmazhnSXl5cVYwZHMvbVdVVmcwdHl1UG9vZWpienlW?=
 =?utf-8?B?YXUyRHpPNTZtZm9rUnExYnp4VzB5YmNUbTV0QTVuWWVJY25uSTdNamZGL2du?=
 =?utf-8?B?bGM1alZFeFdtNE9mYUlXd0p2ZVJKNFFFU1grdVpSRllkWkpNNDRNWU9FMXh6?=
 =?utf-8?B?M3ZSVlhheDkxVVFZSUJLYzVrMC9yVWRFTTFZZk9DTmovU0JtbmZUellDSnI0?=
 =?utf-8?B?VHg3ZTBER0p5a0dkaW1uVHBIV0lINkdWMmhpYmhFSFo5Z09pZlZEMUgyMTJB?=
 =?utf-8?Q?6K5kcs28pAOdmMEtL5VrUaaQ4cLiqTzK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SW11aG5ha2hHdFY2TUZDekExRWNZUFE1MHdlNVZkZG5UOUpWWTlMVGFpSnQ0?=
 =?utf-8?B?NkdVeDh4cXhGdkFZMUMvUG41eXF3SS9hTTQwTWFjYkE0MDl6SzZjSSsvUlZQ?=
 =?utf-8?B?dkJUcE40QkxoVTAxcU9HRm9iRytMZmdnOTNWcDlJYWhqZEJWWmlyT1Jla1B5?=
 =?utf-8?B?cVlkNDNlSFRqWU91TFI3SE1WV01Hd0NFUm00Q0VkRmFNekRuZnJITzJWUlND?=
 =?utf-8?B?K3BLZ3pVbURrSDR6YVcrZWV3Uk1zY0FPZUc1cG83SVJzczJUWUxMUWo4M2Fp?=
 =?utf-8?B?OFJqU1F6R0tEeTdabDUxMitPeDVLbmFncWo5SzRKWmZBb0pQbytmaUFjSFBC?=
 =?utf-8?B?RnZuUEp1QTlzR3RYK01kbGJ1MnBWS29kZDhVZFQ5U3VwdlNlTHhqUXJITC9j?=
 =?utf-8?B?b2JrYTNhOFhFV01hSXdxdkxRcCtWTW5WQ0tLYmVUcnhqckF3Z29teHc3OWNE?=
 =?utf-8?B?WGk2djZ5NEhyaTVWekxxMXVtZTdhMElMQXYzZjdsU2c0MGpoWHZZeDVqc1dX?=
 =?utf-8?B?bTZXOVZzSk9qMjBEM3FKdFNwc1VZQm1BR0dZWjRxbmZKMjJKMW5ZS3lGWHd3?=
 =?utf-8?B?WkVXUGpFeHJJU2J0Y0tWdWpadkpmK1NzSTJ1MnFWc0orb3JQejFIT3VleDYw?=
 =?utf-8?B?RmloOGNhRUlPUUhBV3NtUlI4RE5DM2RUQlRoQ01HWkw0LzhycDJNMEVaaEhL?=
 =?utf-8?B?SmFQa05HSTBCaFkzbTNpVEVwSnYvaUpIS0dnR1dsVi85cmpwaER2MHNOeHdP?=
 =?utf-8?B?SzhiNUtESnBtd1pBeE44WFI2UmJTNWRvSElXMnpxN0dZMHc3Sm5qZ3BXWVdy?=
 =?utf-8?B?Wk9lY3FlUSt3QXpmTVV6ck5TaHJqVE5TMFRvaDcrRmlYU2U1N0d3c1JFNjdo?=
 =?utf-8?B?WVY2WDhLQ1lSZksvUi9hMXZaS01UbDZNOU1ic2Zld3JNdnAydlVia2ZCTzdO?=
 =?utf-8?B?WmZFb0NoaWZUcEtBcGlFNFIxTDUxdENtNTBGREdWQzRTZjVGbDZBT3FsRjRC?=
 =?utf-8?B?SEljUEFDVEthNDBXOHlJOFBPRjdnK1dJNWxNMTVIQTR5OG5nOWJlb1JvOCtL?=
 =?utf-8?B?RTMxanBySU9FaThzMUJpdXArVjJCcEppN3loY1ZLY1phRVNvaVhGNzVPcWNI?=
 =?utf-8?B?QjNZSWR5c0x6OUE1OHcxSVNaZ0ZqVFBBaU44Z1FUeEpQYWlxcll4ZWNONWtk?=
 =?utf-8?B?ejZmcXU0YkVJRmNHTlM5NlV1cWFCb1ZSKy85TVRBNzdEZ2cwaFNWeHlMOFRX?=
 =?utf-8?B?bHFUT3drZjd2RUNMNngxVjgzVnROUXRkV0hhcXBBbUdqNFFZQmdjTlBmUnhK?=
 =?utf-8?B?NjBVVnBiL1pUUGJCdnZpYmRXSzk4c1VmcUFGOHc1WjlyRjhqOHY0US9XRTNP?=
 =?utf-8?B?eHQvZUNWUHZ2b0tGdm5QekpkTzJTOXRMbDBaamVxSmhlQnd5QmROQkJBcnlS?=
 =?utf-8?B?d21JOUZkZGxFNlRzTFhQSTFFWGNRbGlDcmRwY3hQdHZqVHRWQTJyNUhYRTA5?=
 =?utf-8?B?N3NlRDB5cVRXRFNESStraE9SZ2dtUXo5MjRDazlYVWhraGk4Vmo1eW90czg0?=
 =?utf-8?B?TnZRbkRoSWEwZjhQa1BBdjFoYWpzdHp5K0cxdFMzckd4Qno2UUM2am81N3R6?=
 =?utf-8?B?aS9iSXJ2bGJjU0JDVW5pMzAyRlhPamhXWE0yQ3Y4UTVrZzI2OFNnblNzQUFj?=
 =?utf-8?B?VkMycWt0bTVRSm1VSXZJQzJmc20xTTVaRUdlSm5OcWxlTms2WnQ2cUtVaWNJ?=
 =?utf-8?B?MGwzV09PKytPQk9WK3A4QTV2UG9vYkpsRldJT1JpKytVWlR2aFg0R1grU2Ry?=
 =?utf-8?B?TnoySXdwS3ZOaUJBK05tVGZyeEdXR2FXZklpR3RIUERPUzhlSmNyTHAzcWxE?=
 =?utf-8?B?ZkdVbjlTVXA5S05vZHpUNEljejVFWDcwOGRpYnBzNHYwR3BqNXVyYUpMbXVU?=
 =?utf-8?B?a2tSdW9hbXpHZm51MmNYL01PeEx1K21GczhyTFIzcmJqMFJFdjJnanZ5UEdq?=
 =?utf-8?B?NkZaanJzZ1FkZ0l1Y2VOT1ducDVXZG5vSjdjTSsweTN0TCs2RmlYbitmVFVF?=
 =?utf-8?B?UWpyQXJTQUtLVzRtbjQ0cmlOLzhXTy9DZWs3dXpMNEkzRmVYK0E2YVo4VGE2?=
 =?utf-8?Q?Y0FCRYOULuVwdWX3mBSfKMXnJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <617372ED7C7AA2448D693FEB967506A6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2580/kd6IaEzHi4NMyTggZXPzYzRiHQC9l3p8F8A4wQlbCt8vX66e6woefiKpL1IvPaDSjn089dHa13eye3HSq3f2xr7DHcZvlwP8l2ilZERvKESdZT1L5wF0JX2U9cI1SHTyiYjdRgMtdwqAysGOylTeWB9XzCu7WfEG/FntAW0AhrfPb+Igyf7E7Rar6R/5LdpQky4Or027fnXd1pbLcxGlh5eC6pEZR7pqT4gRr3TbZgk5AlCbC13S68nd3OCXuQOAsr1Yzr7chpTLM4iPBpBYqFRbNLALf6xCoNC9wMr54HQZT4w6KGJf+Cele6yuMlT3Z9E2tXXiMrGzgSDjR8p/wk7ZH0uXXlXB6wetB7YgiOIq+xlXCs66+5gFvRIFzpGwU1CpGUoW9q85JzuVK3J/sfSrBl9tirKaYztRXvvo7ThypiCWGGynQ4aA+oG+bYvhEpPMqUiy5gWR26tLxnrtBOYBLDrszYfH1FLqfi/P3YPpZbuF1glhB1D+iVigzBg8HKQe3x9fb3kzCM74yQHuY6sC1BOLvlnD1stWyGYiPhIctq7PDSViWcd6M+yLuPjmy996FHQxYujvEAKhqqPJndk3r6JHpa6xxINPpmvKnMxYpCm28RgeBvkTEUuNl6eeRmLgBRUyHIeNEa2XQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f5a31e-a9a6-4738-50c8-08dd77013790
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 00:55:26.6910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u6IEsnn68t6htDT1MdPCEEGLyIwh43O7cnnejE2bAPqWDNxx1l0Fp3fMCki8vIgcvePI0I/2zP9jsvhRuhO3Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7881
X-Proofpoint-ORIG-GUID: 0U_84eDZ5vjNBNccLUkiAv4OB-8dktM3
X-Authority-Analysis: v=2.4 cv=XIAwSRhE c=1 sm=1 tr=0 ts=67f5c585 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5vFm9aiZLi7e2Jj7RoYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 0U_84eDZ5vjNBNccLUkiAv4OB-8dktM3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_09,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504090002

T24gVHVlLCBBcHIgMDgsIDIwMjUsIFByYXNoYW50aCBLIHdyb3RlOg0KPiANCj4gDQo+IE9uIDA4
LTA0LTI1IDA2OjQ4IGFtLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gVGh1LCBBcHIgMDMs
IDIwMjUsIFByYXNoYW50aCBLIHdyb3RlOg0KPiA+PiBDdXJyZW50bHkgd2hlbiB0aGUgaG9zdCBz
ZW5kcyBHRVRfU1RBVFVTIHJlcXVlc3QgZm9yIGFuIGludGVyZmFjZSwNCj4gPj4gd2UgdXNlIGdl
dF9zdGF0dXMgY2FsbGJhY2tzIHRvIHNldC9jbGVhciByZW1vdGUgd2FrZXVwIGNhcGFiaWxpdHkN
Cj4gPj4gb2YgdGhhdCBpbnRlcmZhY2UuIEFuZCBpZiBnZXRfc3RhdHVzIGNhbGxiYWNrIGlzbid0
IHByZXNlbnQgZm9yDQo+ID4+IHRoYXQgaW50ZXJmYWNlLCB0aGVuIHdlIGFzc3VtZSBpdHMgcmVt
b3RlIHdha2V1cCBjYXBhYmlsaXR5IGJhc2VkDQo+ID4+IG9uIGJtQXR0cmlidXRlcy4NCj4gPj4N
Cj4gPj4gTm93IGNvbnNpZGVyIGEgc2NlbmFyaW8sIHdoZXJlIHdlIGhhdmUgYSBVU0IgY29uZmln
dXJhdGlvbiB3aXRoDQo+ID4+IG11bHRpcGxlIGludGVyZmFjZXMgKHNheSBFQ00gKyBBREIpLCBo
ZXJlIEVDTSBpcyByZW1vdGUgd2FrZXVwDQo+ID4+IGNhcGFibGUgYW5kIGFzIG9mIG5vdyBBREIg
aXNuJ3QuIEFuZCBibUF0dHJpYnV0ZXMgd2lsbCBpbmRpY2F0ZQ0KPiA+PiB0aGUgZGV2aWNlIGFz
IHdha2V1cCBjYXBhYmxlLiBXaXRoIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLA0KPiA+PiB3
aGVuIGhvc3Qgc2VuZHMgR0VUX1NUQVRVUyByZXF1ZXN0IGZvciBib3RoIGludGVyZmFjZXMsIHdl
IHdpbGwNCj4gPj4gc2V0IEZVTkNfUldfQ0FQIGZvciBib3RoLiBUaGlzIHJlc3VsdHMgaW4gVVNC
MyBDViBDaGFwdGVyIDkuMTUNCj4gPj4gKEZ1bmN0aW9uIFJlbW90ZSBXYWtldXAgVGVzdCkgZmFp
bHVyZXMgYXMgaG9zdCBleHBlY3RzIHJlbW90ZQ0KPiA+PiB3YWtldXAgZnJvbSBib3RoIGludGVy
ZmFjZXMuDQo+ID4+DQo+ID4+IFRoZSBhYm92ZSBzY2VuYXJpbyBpcyBqdXN0IGFuIGV4YW1wbGUs
IGFuZCB0aGUgZmFpbHVyZSBjYW4gYmUNCj4gPj4gb2JzZXJ2ZWQgaWYgd2UgdXNlIGNvbmZpZ3Vy
YXRpb24gd2l0aCBhbnkgaW50ZXJmYWNlIGV4Y2VwdCBFQ00uDQo+ID4+IEhlbmNlIGF2b2lkIGNv
bmZpZ3VyaW5nIHJlbW90ZSB3YWtldXAgY2FwYWJpbGl0eSBmcm9tIGNvbXBvc2l0ZQ0KPiA+PiBk
cml2ZXIgYmFzZWQgb24gYm1BdHRyaWJ1dGVzLCBpbnN0ZWFkIHVzZSBnZXRfc3RhdHVzIGNhbGxi
YWNrcw0KPiA+PiBhbmQgbGV0IHRoZSBmdW5jdGlvbiBkcml2ZXJzIGRlY2lkZSB0aGlzLg0KPiA+
Pg0KPiA+PiBDYzogc3RhYmxlQGtlcm5lbC5vcmcNCj4gPj4gRml4ZXM6IDQ4MWMyMjVjNDgwMiAo
InVzYjogZ2FkZ2V0OiBIYW5kbGUgZnVuY3Rpb24gc3VzcGVuZCBmZWF0dXJlIHNlbGVjdG9yIikN
Cj4gPj4gU2lnbmVkLW9mZi1ieTogUHJhc2hhbnRoIEsgPHByYXNoYW50aC5rQG9zcy5xdWFsY29t
bS5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgZHJpdmVycy91c2IvZ2FkZ2V0L2NvbXBvc2l0ZS5jIHwg
MTIgKysrKy0tLS0tLS0tDQo+ID4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZ2FkZ2V0
L2NvbXBvc2l0ZS5jIGIvZHJpdmVycy91c2IvZ2FkZ2V0L2NvbXBvc2l0ZS5jDQo+ID4+IGluZGV4
IDg2OWFkOTlhZmI0OC4uNWM2ZGEzNjBlOTViIDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL3Vz
Yi9nYWRnZXQvY29tcG9zaXRlLmMNCj4gPj4gKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0L2NvbXBv
c2l0ZS5jDQo+ID4+IEBAIC0yMDEwLDE2ICsyMDEwLDEyIEBAIGNvbXBvc2l0ZV9zZXR1cChzdHJ1
Y3QgdXNiX2dhZGdldCAqZ2FkZ2V0LCBjb25zdCBzdHJ1Y3QgdXNiX2N0cmxyZXF1ZXN0ICpjdHJs
KQ0KPiA+PiAgCQkJYnJlYWs7DQo+ID4+ICANCj4gPj4gIAkJaWYgKGYtPmdldF9zdGF0dXMpIHsN
Cj4gPj4gLQkJCXN0YXR1cyA9IGYtPmdldF9zdGF0dXMoZik7DQo+ID4+ICsJCQkvKiBpZiBENSBp
cyBub3Qgc2V0LCB0aGVuIGRldmljZSBpcyBub3Qgd2FrZXVwIGNhcGFibGUgKi8NCj4gPj4gKwkJ
CWlmIChmLT5jb25maWctPmJtQXR0cmlidXRlcyAmIFVTQl9DT05GSUdfQVRUX1dBS0VVUCkNCj4g
PiANCj4gPiBXZSBzaG91bGQgYWxsb3cgZnVuY3Rpb24gdG8gZXhlY3V0ZSBnZXRfc3RhdHVzIHJl
Z2FyZGxlc3Mgb2YNCj4gPiBVU0JfQ09ORklHX0FUVF9XQUtFVVAuIFRoZXJlIGFyZSBvdGhlciBz
dGF0dXMgYmVzaWRlIHdha2V1cC4NCj4gPg0KPiBBZ3JlZSB3aXRoIHRoZSBmaXJzdCBwYXJ0LCBJ
IGFsc28gd2FudGVkIHRvIHJlbW92ZSB0aGUgZXhwbGljaXQgY2hlY2sNCj4gZm9yIFVTQl9DT05G
SUdfQVRUX1dBS0VVUC4gQnV0IGFueXdheXMga2VwdCBpdCBzaW5jZSBvbmx5IDIgYml0cyAoUldf
Q0FQDQo+IGFuZCBSVykgYXJlIGRlZmluZWQgaW4gdGhlIHNwZWMgYXMgdGhlIHN0YXR1cyBvZiBH
ZXRTdGF0dXMgZm9yIGFuIEludGVyZmFjZS4NCj4gDQo+IExldHMgZG8gb25lIHRoaW5nLCBJJ2xs
IHJlYXJyYW5nZSBpdCBhcyBmb2xsb3dzDQo+IA0KPiBpZiAoZi0+Z2V0X3N0YXR1cykgew0KPiAJ
c3RhdHVzID0gZi0+Z2V0X3N0YXR1cyhmKTsNCj4gCQ0KPiAvKiBpZiBENSBpcyBub3Qgc2V0LCB0
aGVuIGRldmljZSBpcyBub3Qgd2FrZXVwIGNhcGFibGUgKi8NCj4gaWYgKGYtPmNvbmZpZy0+Ym1B
dHRyaWJ1dGVzICYgVVNCX0NPTkZJR19BVFRfV0FLRVVQKQ0KPiAJc3RhdHVzICY9IH4oVVNCX0lO
VFJGX1NUQVRfRlVOQ19SV19DQVAgfCBVU0JfSU5UUkZfU1RBVF9GVU5DX1JXKTsNCg0KWWVzLCBz
b21ldGhpbmcgbGlrZSB0aGlzIHdvcmtzLCBidXQgSSB0aGluayB5b3UgbWVhbiB0aGlzOg0KDQoJ
aWYgKCEoZi0+Y29uZmlnLT5ibUF0dHJpYnV0ZXMgJiBVU0JfQ09ORklHX0FUVF9XQUtFVVApKQ0K
CQkuLi4NCg0KPiANCj4gPj4gKwkJCQlzdGF0dXMgPSBmLT5nZXRfc3RhdHVzKGYpOw0KPiA+PiAr
DQo+ID4+ICAJCQlpZiAoc3RhdHVzIDwgMCkNCj4gPj4gIAkJCQlicmVhazsNCj4gPj4gLQkJfSBl
bHNlIHsNCj4gPj4gLQkJCS8qIFNldCBEMCBhbmQgRDEgYml0cyBiYXNlZCBvbiBmdW5jIHdha2V1
cCBjYXBhYmlsaXR5ICovDQo+ID4+IC0JCQlpZiAoZi0+Y29uZmlnLT5ibUF0dHJpYnV0ZXMgJiBV
U0JfQ09ORklHX0FUVF9XQUtFVVApIHsNCj4gPj4gLQkJCQlzdGF0dXMgfD0gVVNCX0lOVFJGX1NU
QVRfRlVOQ19SV19DQVA7DQo+ID4gDQo+ID4gDQo+ID4gU28gcmlnaHQgbm93IHdlJ3JlIG5vdCBh
YmxlIHRvIGNvbmZpZ3VyZSB0aGUgZnVuY3Rpb24gdG8gZW5hYmxlIFJXDQo+ID4gY2FwYWJsZT8g
UGVyaGFwcyB3ZSBuZWVkIHRvIHVwZGF0ZSB0aGUgY29tcG9zaXRlIGNvbmZpZ2ZzIGZvciB0aGlz
Pw0KPiA+IA0KPiANCj4gVGhlIHJlbW92ZWQgY29kZSB1c2VkIHRvIHNldCBVU0JfSU5UUkZfU1RB
VF9GVU5DX1JXX0NBUCBldmVuIGZvcg0KPiBpbnRlcmZhY2VzIHdoaWNoIGRvZXNuJ3QgaGF2ZSBS
VyBjYXBhYmlsaXR5LiBJdHMgYmV0dGVyIHRvIGhhbmRsZSB0aGlzDQo+IGZyb20gZnVuY3Rpb24g
bGV2ZWwgdGhhbiBmcm9tIGNvbXBvc2l0ZS4NCj4gDQoNCk5vdCBhdCB0aGUgZ2FkZ2V0IGxldmVs
LCBJIG1lYW4gdG8gY3JlYXRlIGEgY29uZmlnZnMgYXR0cmlidXRlIGNvbW1vbg0KYWNyb3NzIGRp
ZmZlcmVudCBmdW5jdGlvbnMgdG8gYWxsb3cgdGhlIHVzZXIgdG8gZW5hYmxlL2Rpc2FibGUgdGhl
DQpmdW5jdGlvbiB3YWtldXAgY2FwYWJpbGl0eSB2aWEgdGhlIGNvbmZpZ2ZzIHdoZW4geW91IHNl
dHVwIHRoZSBmdW5jdGlvbi4NCg0KV2hhdCBkbyB5b3UgdGhpbms/DQoNClRoYW5rcywNClRoaW5o
