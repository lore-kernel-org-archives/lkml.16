Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AB0A47;
	Tue,  8 Apr 2025 01:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744074587; cv=fail; b=M9Pbutx2dfgcZ0IB3iBrsZ9ZVy8nD0/6q3ZWeHvIQJUOQVZAPh1BnFhi2vuVvs/cw79n9oh4NJTDN9dJiz8YpGRlHxFn49lXvmDvHXlhtMg3wpNFMFPBwryN21KMOM60ZLOulohgr9v1G/6H298wJNSmltW7+d0mJHLFndrHNgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744074587; c=relaxed/simple;
	bh=ufeGkgxPqoNgbJufKAzDGGtNYVUXVQ4A+4dwHq8Ckdo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=smt/CaY2aA3q6wbL2V8tgJDfKt3P1TkubJ2b1tjlmEIJvnzxQ0yvinsdcp20FpyKGwlZCvqC+QIo6tYB0uKIYOm9PcwbFMFjlpHLEvlGIKfzgp09BGFtQLqz4MTD8/U8xZeSjMh7sU++SL9P/NrDfiSxvoS/FeBOCuVDOpWlGNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=hLVQVD6h; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Qkum0MwI; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=nSLtEgfK reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hLVQVD6h";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Qkum0MwI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="nSLtEgfK"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5380CKsW003054;
	Mon, 7 Apr 2025 18:09:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=ufeGkgxPqoNgbJufKAzDGGtNYVUXVQ4A+4dwHq8Ckdo=; b=
	hLVQVD6h56W55u3tBdpenYpAqn2JY/uqUZ7q7ATh7RIIeBfIP+oJv8oTr3R5K1PA
	VsxwQH2uTw5rfembrKxvgRJrz26ZsjzeaWy/bKMFM2YDapT+MCiXdPsUK/QDS6Ir
	plhphhDq2MYiao2fiOwWaQcaimjM82T2qTE7bAgyuH3ZUdMAKInxb2fAn3io1ViA
	nFCW7IaU5M/mEoPJxOW9YUo0pXoHkxRBBPqDl8B55BlNm8lwxTuPLaIePvsQoKWA
	z5RAQJrtTBW7JkatUVBchYOrzPteKzVj6KxjNG40oMEJuuZSC4wphGx2/uHwzby9
	NolV9JEG8fdZsLeyacgefw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 45u35ffr8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 18:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1744074540; bh=ufeGkgxPqoNgbJufKAzDGGtNYVUXVQ4A+4dwHq8Ckdo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Qkum0MwI021iIghLn9U+GCBWCK7wYUD7H0HtSGAcQdc1iCnuAxJHErKGS+RvI3yNq
	 kM8D7w3ToIXLS47oepKPCo57LUe9YrtsIlcjzSR0gKcgJCSCHPTr0UKCdyRL9V/Rv9
	 ZhhWxdvmQkPmSpWlJh/kSY1CCS/X2jcWD9OTmLi+xD+IAlK3sSlHD9W8btTm3eNZLn
	 RM0Z8js8uZHEeuxt53edi4TKx29zEO11xoXOGYbidiTDt1pr6oSP4jbv/V7xtBT5B0
	 TXV3BKv2Ej71zylM3/TK5FbAAKVJmm00sX4h5FAPfM+bBwPy0prDAScKac80ht6UBT
	 8ufyqI02nEemw==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6111A4052E;
	Tue,  8 Apr 2025 01:08:55 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 4A972A006E;
	Tue,  8 Apr 2025 01:08:52 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=nSLtEgfK;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1559640359;
	Tue,  8 Apr 2025 01:08:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6iH8CMohip/EBuIwSxx+LZyVQsfCrRxbDhVvpHycKdUXY9451fgKSxPiCiK9z8EkXczg1Dc7mnLAGPrUKEC2eiLlCRP3tkOyUPNzkUiA+RhYLwGfYV7VTDtCHO/A0w9WFtoh7SNSbuN0xY/exh3BQPQlsez+OB5jDhDzm14wkqt0CPQx0x7iSlIk3sH7vMuP7mvpAoEjadITGHPibcoESScw6y5HF4oGHV1c104XgYSjdy/gKIc7XbNnj9beY9CStCh9uU4SSjoRnPa0ngnyAhwH7L2n6AGKLnpcc9WkouaMI/jnj4IOiiSHcHfHr5hDnRtM7zf0dTzNbWSpPtVAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufeGkgxPqoNgbJufKAzDGGtNYVUXVQ4A+4dwHq8Ckdo=;
 b=YzjQuTYK+A4E7KM2Len/xSzhEOCDgDKT8sIAlCUqvrT71nFxRPg8xv7Pgez6XSTz6ZJN7mW2vKAwnfLI8SyX2ARZJjC0aI7mwQsBB1nQyHvCv+EkSBjd8O7t7rVkiYDfcp+2NSATwOOVevpAheYnUE3l6ljFpzcRBK4QyNmjDwfk5DKCGRCrhFoQeEZz3gsoc5YGZbUfNHm6lfHIUIn7/4aucdtV+JKptc10fnqalmUeP/0+2JmJ9XL3FGZejPrF+KYDovmnhrM3YeZ86L/5nHVFRC4fYwnBzAVOHYeQCPCQ8kok4+NQy8NuoGGehVRXa9tC7kU5SaPrAQ/agQ67Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufeGkgxPqoNgbJufKAzDGGtNYVUXVQ4A+4dwHq8Ckdo=;
 b=nSLtEgfKYi1/gcPjKe8bWBS7ZAtFPf3uSBtEN1pOL8HvCFyoxMT7JaEkQIRCyuAidRU3I6GYFcPgHT2oPOmSkSNsNd4hfdeRaOgrmzCAgT+SuO43qIwU+hNbbPrmGCCLH+SmxWwL0aSj1du1HNKhZ+ylo26aFyv/z3TX8F9TlAA=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by BY5PR12MB4225.namprd12.prod.outlook.com (2603:10b6:a03:211::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Tue, 8 Apr
 2025 01:08:41 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 01:08:40 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Kees Bakker <kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable@kernel.org" <stable@kernel.org>
Subject: Re: [PATCH v1 1/3] usb: gadget: f_ecm: Add get_status callback
Thread-Topic: [PATCH v1 1/3] usb: gadget: f_ecm: Add get_status callback
Thread-Index: AQHbpIi7X8UMKq4LUEK5WxlPW1wHoLOY/FQA
Date: Tue, 8 Apr 2025 01:08:40 +0000
Message-ID: <20250408010812.qcgvinzqghrpyuly@synopsys.com>
References: <20250403110805.865311-1-prashanth.k@oss.qualcomm.com>
 <20250403110805.865311-2-prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250403110805.865311-2-prashanth.k@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|BY5PR12MB4225:EE_
x-ms-office365-filtering-correlation-id: 390fc2fd-e39d-432f-de58-08dd7639e668
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZkxrSFNEK29obXZBU3RSZFJjU2UyMjh1T1hvNFhGUFRJeUQ1Tm9LRXYzRmxM?=
 =?utf-8?B?Y3dnLzVoaHRFSGhlajRadmpVckxBQzdZdUVaWXJwMnpsL0tRbW1RT2hsZWpo?=
 =?utf-8?B?aE9GVDlyaWZaTUpscUpydHZ0NmNyVCtOK2ZTcDB3aUhaclRQVDUrejJSYmVE?=
 =?utf-8?B?TlB6WVBqVFdWaXlXWUZrRS9lMXpkNFprQ2VrRkZDZDByNzRkM0psak91OXMx?=
 =?utf-8?B?ZVBHMWV6SE5DR0JKTlFEUUpXcHJjdm1KTzAydTVQZFZsNWRJajQrUDlxY3Z3?=
 =?utf-8?B?SXdTY3J2YzNzemQzUTlZaXJqN2NvdVFIaThZajJaNkMxTjdqK0o0QU1PYzM1?=
 =?utf-8?B?ejZ3N1h0NCtURjI3MTNEUUZzWE9La1NYd0lxZmZNNjlEb1A2S3B2T3ArUUlm?=
 =?utf-8?B?ZXlJSlNqKzFMNTlobG5qTHZONmR4ZzFKWGhFMDFKWWJrRU9TQ2Zydno3dXVq?=
 =?utf-8?B?R0ZpbCs5MmtVVWhHVUJLbkpEeCtkbmJ4RUFSSzdvVENaNkhBT3NzSXRLbnQx?=
 =?utf-8?B?TGZ2UWhsaGYrSHFQK1ByS0o4WWFCMEtoVmRKVEZTcmZ6VGFRL2FWSEE0Zzlk?=
 =?utf-8?B?K29sc1hKbGxVZXZzQjIvUEY5WVpEZVhJT1RnNTA4YVNiR1ZDTmNxM3h2eTI4?=
 =?utf-8?B?b3NDajF1MERjd1l1UWJIWXl0OGh1WVoyMTJ5cWJvOGZETVJEeEFPTEM3ekJQ?=
 =?utf-8?B?cmtDVk9jcENIZisxWTZ6YzdpY05lYU9meGozbUovaGVqU1VxQURqMzFEZHV1?=
 =?utf-8?B?VkFVU01IUlczcGQ3NjMwem9sNXRYcUdIQjY5Y1kvMFlYNEFtV2JlOEt6Q3pu?=
 =?utf-8?B?eHBBeXRUVGdCam5KQ0ZKZWp2VTVMcjRBZmIvZ2pDZk8wSmsyVnhOSGE3S2dQ?=
 =?utf-8?B?SjJXcFlXTkVTNDFwRTJiOUY5dDViek5lMVQvMGdXRUZGV1pUVk9JQUY0SzBr?=
 =?utf-8?B?Zmw5RFpBZE5VQjQvN0JFaWx0VjNDSmlrS1lnTjNLaFEyM0F0OTBhN1FkOVJl?=
 =?utf-8?B?SWovS1d4VFZsaFRmaXg5M0REYTlUZFd5bEtyMXVZb29TVURwRDBteTdoYndm?=
 =?utf-8?B?WGFTZWg5bHE3b1lBckdLNG9OZm96UXNLQWxldUl5UVQ2T3QxZkRScEd2MmNG?=
 =?utf-8?B?Vmp1WVI5b0xqV0t0N3BBQkUrWDQ0Sm1aUVVMR0ZkRXVDcG53SStQVjdCdkdD?=
 =?utf-8?B?ZG52OGtVNldybUdjZkhWTW9CM09KSHU4YnZiRTkzUzdlRnNYMmUzN1BhRHdQ?=
 =?utf-8?B?dEFLa0hsUFRzcVVmNnRSL1FMc09RaGhZeWs2MDM1dnFYdTJuQWU3NHNjSXB1?=
 =?utf-8?B?YWFpUVczU3dYZnlRcXJkcm1PZ1lySjJLa1kxWWx1cXdmbnhpNmw2eUdxTWM1?=
 =?utf-8?B?M0x2aDZ2a1RTOG05WjB6SkVKWWxxOHZLeWljbzhnZjhaUThsYkFSUzJyRXN0?=
 =?utf-8?B?clFXYStnS3B3cXFLVGppRER1Q1hBZDBxYVlSa2pWdjY2clRtMVRKczJQM0RE?=
 =?utf-8?B?dnBKeC95amxpRlFtWURWYzJOeXlXTm8wdzV0cHNudmllUGN4TmI4M2V2MVI4?=
 =?utf-8?B?WVRhTGp2VGpMektXQmNoQ1I2L0hOL21MT0hZNURJYWxocXNLN3c3aU8xQ2Z3?=
 =?utf-8?B?eGRkenNHMHZSRUJicmdVQUxJL0xQVitiUERWWE1MeXZrOTMxRGNPVFU5U1Zp?=
 =?utf-8?B?Z2w3bTNqMzk4UGZVK1lieFI0OC9hbVJIYTlYS1NqbXF0ai9JQys0d25YZE83?=
 =?utf-8?B?SGhCRnE5WEhpcjBCdElIYUxmTkkrTk1xU3BCeWJobjJqY053OFRJbmdNWmtX?=
 =?utf-8?B?aVVLcmw2TW4yU2hqMUkrM0ZzdzlQbHFxblhaQ2tCYklKM2x6UXdUU09kb0lD?=
 =?utf-8?B?bnlYOW9sZC9ZaWZjSTFiUlQ1LzgvWmlZeWp6cVNIb29uT3FUMXNmWWpNTUZ3?=
 =?utf-8?Q?NxS5ZuYiVnCnAzDMVdfwY+Fg+3joxsod?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NU4xYzdESXl0QzF4ekR1WGdmak1PcUtEWjRNeFhFN2ViV0hKMlNjcFRVVDFt?=
 =?utf-8?B?NWhTd0Z5cEhPc0grZ1Z2ZVJRNzBQT0FpMFIrNS9yeHBBNjJsaWVSLytuTTlE?=
 =?utf-8?B?U2tGQjQ5VUI5cEdPVDU1NEd6bVJCS3lPNWkwWmhsaHNmcFdnMTVnU3FVQTFu?=
 =?utf-8?B?WUx4NHdWYVoyVENuZUxrNjVsVmo2UXQvUUh6SCtHalhGRjlTLzFrb21Nb2x4?=
 =?utf-8?B?T09ZcDJ0ZTR6UDRyTFZQNlhibnJBOW1SOHJYR21QUXhibHVtRlZ1enM1b25G?=
 =?utf-8?B?Mm80NFhKdEhHRXVCM1dZMjFNeGFuTzBhT3kxZWxydXJiU0RiYm0valFpNmJu?=
 =?utf-8?B?Y2toai9peTd0eFF3b3hTZGdrUlFmOEZmTmE1ZzNRc21TM0lEeGlzSzFSbVJZ?=
 =?utf-8?B?SmQ3QTlYWWVPVkM0dGxsVURFSUdsclpGZTgzbDB4cXBpK2ZubE9tcmpCMTI1?=
 =?utf-8?B?Y0RyWXdWcGUxQWVrTlpqOFZialplc2x6N1hER2ZjQzI2MG5FYmUwenNMQS9s?=
 =?utf-8?B?V0lIemp1WHZXL2RQSzNBdGxHTng1MHREQWRIVHl2RDVXTWp4amt0ZHA0NlFF?=
 =?utf-8?B?RlZaZU4vZnFERVBId3BnL29mNkFGdnk4R1RwM2JVTSt4VmtydytWRG1IMjhP?=
 =?utf-8?B?bFpUdlAyU29YN0xaNUYzOFdWYzNWK1ZhVHkzeEMrbXBDbzVFd0R5QU1oeUpq?=
 =?utf-8?B?OTVNT0RtUkYyTkVhOURxejBZeVRnSnlzbTdrTnNzVGxJY0toS1hZQTdGdkVP?=
 =?utf-8?B?ZmVHUVpJaDhOU01wQlcva0NXTWwzWFVsSlMxYkNWMGxEYTh5TFUxOFhEMkww?=
 =?utf-8?B?WGhyNDUzaE0zaDZUcTVpUW1jWDBqSkdNUDhHeGUwaDNlMmtpSktRbW5aZWtS?=
 =?utf-8?B?VzhRTzVGbTEwWm5OWm5UZFZuQmJQcExxSWdyekMwbVN6aGtQOFBjNVNRZU81?=
 =?utf-8?B?RlNPVm5KTGZ2eWIvbkFWcUJjS0NVNjYvNGgxeHBnbm1xa3VHeC9aekxNRzlH?=
 =?utf-8?B?QldwOHo3ZkZSRHlwSmN1WjB1TlpiMnhIbWF2NEg0M1d6aGlhTU52VTRIVkRL?=
 =?utf-8?B?TmJmY2d4WHB3MU1DZlNwNldZUE5GcExrN3cwM3h0QUNjeVU0Q25XdlROeldL?=
 =?utf-8?B?cE16eHJjN1VXMkh3b1pVYUZJM2Y1VmVreUVNNWZxSnk4SDlPeEdjazlpTlMw?=
 =?utf-8?B?V2pmY2NFL3BvMmk0bFNETXppM2NYU0IzOGcyYXZRaURXQXhJWFIzaWpzTm5l?=
 =?utf-8?B?K29oTFdEekFXSi8rQUhsaEVWcy9QaGl1WGorNWtJcytGeFpEci92VVJTbFhI?=
 =?utf-8?B?ZEJHY1dYbWFTWHlwK2VNK21GS0xYNTFMK1RJZTlvNGM5SmJiV2ZKT2x1dWE2?=
 =?utf-8?B?amx1UzRzNEZrdC9VTWZ1US9iWmxoR3RSelo1TDRqRUlIdm1HaFVLcXZCLzI4?=
 =?utf-8?B?d3ZWMTAyejBIdEpKeVZmNU5LblpGcjFyUnB1ek5ScUc1U0pjV015UHVUL1Zj?=
 =?utf-8?B?aUlSRXo5UDNiK2F1bXNQRDhhRlFjWHJUOElHMUJCZk05WDNoYnM1TDJOMUZ6?=
 =?utf-8?B?VVpvL3hHSEVuemNkZWl0TG1RK0s0Ujg5aFVEU09TSjQ4RDFMSVdXRGhpWHor?=
 =?utf-8?B?dmVkbkFSa2pleVBoa3VVS213UXMvc2M4b2F4UWVuNW9OdFRNMGFmOTRaZEZ4?=
 =?utf-8?B?VkZUVG0ycG9lSjdGOXZrc290OGdRT3BvR1F0SHpjZkJmWUtjUlQwY0k3MXRq?=
 =?utf-8?B?ellWTS9GVnVsN0FKKzFuNFVxakF3aFlsN0ZQcE81Rk8wRFJ4UzBROHhnd2k0?=
 =?utf-8?B?c2Z0VHZXSGc1N0Z2NmxFcFhBYk5xODVmN0FaUGNlZS9nYkdGQ3VORFhjRC9L?=
 =?utf-8?B?MGNlajlCLzI0T21BZGp3a0RYQmQ1Q2NTVi9NZFVnRkFOSjJNY09CcFJha0wz?=
 =?utf-8?B?Zi9hVm4rOEZ0QjQ0KzNSazlmVTRmUFBhR3c2UDk3b0loT2g4YTJmRDI3SlAv?=
 =?utf-8?B?Zy9RZ0JNZ3dFbGo5NEJpR0J4azIwVC9XOC9Xemt1Y3hmbmp1YzZIM2RLdDlX?=
 =?utf-8?B?YmlIb3hQbGRzZTludm1IS0tJeEFURCtGdkRxQ0VOaTk4UVBlaXlqQ1FoYUc1?=
 =?utf-8?Q?qaSbbPAcT8OBNJN0j2mLwXK2a?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E45361947B519E4E9A83136004C886E1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	W9ixtTJf+w/whxz9yTBAzcVppgHI/DPhw9xMeP+l+Eh2lPRSu98Tb+zMRevYQWkWQyXCN2xmnv8rlAoCnnvlqHKuTt4HmP5ttmqdpHwlUcFOCyym319ruZlcuoWfASs5WGIZ9YaFkKT2WFTE49vXkI7FdlsM6vCtTdHrn3buNNexP9rTQxDGqxGZ+GuI9kDRVk66ShShKp3AcvFvOc9aASuB/sjcrv5j1FRUjdJxbd9O4gxmBx/RzWeNDN2vwFDJH8ilT2m6tsSA0XBgsj5KzzEEa9P9fA9GkHeDB4JXZVXviVK7vi5OX3cbsq3Ps3+sRv1kPLo52GtPW1hrZKppjPGDOr0xozDdNEokmhgBe+8N9yMIqCZEvNKBbtJksw+RuIoA0lq6g8o1hz/HhUXheGna5hqijZLN3Wsd3gcU78ePUAT9oIi6x7bum1KyGYp9C4YJinPHTPIr1Bqnp+tLAomQ5hPYedGBinT8FSvIuddeylBDQu5vt5J9JaDZ4c97CBzhQ8Vb1jyXE34xzdSZPwv3Uki/zYEkDaFVUG1gDPIFPXFBDb9kcj4LP8pqorZa8yy3Fc/k5nCKKiXtVIPTMjd/VBXrZ2BwVVox4HAZfmIZujnlWBPHtLFntLmt5q+nb++J43RRXgdutwdGKwd7hg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 390fc2fd-e39d-432f-de58-08dd7639e668
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 01:08:40.6715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lgQwUdNh2nzffwftoWEEYxLas1yluNMernQgzl+fm1TXhZLGj90fkmO/ZfCiSlJtqPsgCZAnyj8cqf1Mxd0ZAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4225
X-Proofpoint-GUID: M3pA6z9Roc3SJVsQY7X21nrPd2N3u-IB
X-Proofpoint-ORIG-GUID: M3pA6z9Roc3SJVsQY7X21nrPd2N3u-IB
X-Authority-Analysis: v=2.4 cv=FZM3xI+6 c=1 sm=1 tr=0 ts=67f4772d cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bsfne1i3uOOM5u9VnPgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_07,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=795 mlxscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504080006

T24gVGh1LCBBcHIgMDMsIDIwMjUsIFByYXNoYW50aCBLIHdyb3RlOg0KPiBXaGVuIGhvc3Qgc2Vu
ZHMgR0VUX1NUQVRVUyB0byBFQ00gaW50ZXJmYWNlLCBoYW5kbGUgdGhlIHJlcXVlc3QNCj4gZnJv
bSB0aGUgZnVuY3Rpb24gZHJpdmVyLiBTaW5jZSB0aGUgaW50ZXJmYWNlIGlzIHdha2V1cCBjYXBh
YmxlLA0KPiBzZXQgdGhlIGNvcnJlc3BvbmRpbmcgYml0LCBhbmQgc2V0IFJXIGJpdCBpZiB0aGUg
ZnVuY3Rpb24gaXMNCj4gYWxyZWFkeSBhcm1lZCBmb3Igd2FrZXVwIGJ5IHRoZSBob3N0Lg0KPiAN
Cj4gQ2M6IHN0YWJsZUBrZXJuZWwub3JnDQo+IEZpeGVzOiA0ODFjMjI1YzQ4MDIgKCJ1c2I6IGdh
ZGdldDogSGFuZGxlIGZ1bmN0aW9uIHN1c3BlbmQgZmVhdHVyZSBzZWxlY3RvciIpDQo+IFNpZ25l
ZC1vZmYtYnk6IFByYXNoYW50aCBLIDxwcmFzaGFudGgua0Bvc3MucXVhbGNvbW0uY29tPg0KPiAt
LS0NCj4gIGRyaXZlcnMvdXNiL2dhZGdldC9mdW5jdGlvbi9mX2VjbS5jIHwgNyArKysrKysrDQo+
ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfZWNtLmMgYi9kcml2ZXJzL3VzYi9nYWRnZXQvZnVu
Y3Rpb24vZl9lY20uYw0KPiBpbmRleCA4MDg0MWRlODQ1YjAuLjAyNzIyNjMyNTAzOSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfZWNtLmMNCj4gKysrIGIvZHJp
dmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfZWNtLmMNCj4gQEAgLTg5Miw2ICs4OTIsMTIgQEAg
c3RhdGljIHZvaWQgZWNtX3Jlc3VtZShzdHJ1Y3QgdXNiX2Z1bmN0aW9uICpmKQ0KPiAgCWdldGhl
cl9yZXN1bWUoJmVjbS0+cG9ydCk7DQo+ICB9DQo+ICANCj4gK3N0YXRpYyBpbnQgZWNtX2dldF9z
dGF0dXMoc3RydWN0IHVzYl9mdW5jdGlvbiAqZikNCj4gK3sNCj4gKwlyZXR1cm4gKGYtPmZ1bmNf
d2FrZXVwX2FybWVkID8gVVNCX0lOVFJGX1NUQVRfRlVOQ19SVyA6IDApIHwNCj4gKwkJVVNCX0lO
VFJGX1NUQVRfRlVOQ19SV19DQVA7DQo+ICt9DQo+ICsNCg0KV2h5IGRvZXMgVVNCX0lOVFJGX1NU
QVRfRlVOQ19SV19DQVAgaXMgc2V0IHJlZ2FyZGxlc3Mgb2YNClVTQl9DT05GSUdfQVRUX1dBS0VV
UD8NCg0KQlIsDQpUaGluaA0KDQo+ICBzdGF0aWMgdm9pZCBlY21fZnJlZShzdHJ1Y3QgdXNiX2Z1
bmN0aW9uICpmKQ0KPiAgew0KPiAgCXN0cnVjdCBmX2VjbSAqZWNtOw0KPiBAQCAtOTYwLDYgKzk2
Niw3IEBAIHN0YXRpYyBzdHJ1Y3QgdXNiX2Z1bmN0aW9uICplY21fYWxsb2Moc3RydWN0IHVzYl9m
dW5jdGlvbl9pbnN0YW5jZSAqZmkpDQo+ICAJZWNtLT5wb3J0LmZ1bmMuZGlzYWJsZSA9IGVjbV9k
aXNhYmxlOw0KPiAgCWVjbS0+cG9ydC5mdW5jLmZyZWVfZnVuYyA9IGVjbV9mcmVlOw0KPiAgCWVj
bS0+cG9ydC5mdW5jLnN1c3BlbmQgPSBlY21fc3VzcGVuZDsNCj4gKwllY20tPnBvcnQuZnVuYy5n
ZXRfc3RhdHVzID0gZWNtX2dldF9zdGF0dXM7DQo+ICAJZWNtLT5wb3J0LmZ1bmMucmVzdW1lID0g
ZWNtX3Jlc3VtZTsNCj4gIA0KPiAgCXJldHVybiAmZWNtLT5wb3J0LmZ1bmM7DQo+IC0tIA0KPiAy
LjI1LjENCj4g
