Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CEB35977;
	Tue,  3 Jun 2025 01:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748913811; cv=fail; b=BKjia4fs0OU9YRRr11Nw2+VcOKI9XLu14Vqp1HGjgKPANVvXLpB7YJ+NPE2O9tJWiJBDy6mOr1zqyu1enrnLMgBRyol8N4hNIV2E+Mwhi80ixzhEKCSNGOa+v6zXu10HzVNZI1lCJUG5DPBTXEtl55xq1E43pseUF64PO1y70OM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748913811; c=relaxed/simple;
	bh=F53Om07gH73Szbpr6a0tn21w5hSOrC/YuDAFxKkavqk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DnjEz3SYsQy5qaDGtBG21Vsy0puJlL5NtOsxEUa8s0RaIDr/UdXfXbP3LxtEOUFduO6mY0wwhoBXlChd+i+qS7yL4OYDHVNkYTtsJvDoLrcXDi1VnFZbmCwudPNgGQYGquiNruP0w0aueG1jwWbSfTJMULrLr4tgRJpj+Dcng+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=KHRcXRnc; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=WFbO4fW7; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=aqg6xY43 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KHRcXRnc";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WFbO4fW7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aqg6xY43"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5531BTW8013135;
	Mon, 2 Jun 2025 18:23:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=F53Om07gH73Szbpr6a0tn21w5hSOrC/YuDAFxKkavqk=; b=
	KHRcXRncby12exgL0E/cLrevE888tZVv39b7u6a8VHPcDwlSPd+XIwRVN5kvBE8r
	KT6nhyNkzBtT1tW7PHdjAbFndySz/r9cHQl4ty2Ttu4CTxmBqmHmBM6l3i9QMAHl
	4ZMADY+68DxWtn96tdtgEfXLExuzt+LSLjNW5lPPnwtb2BqWe8ePEmxp0kj9FTDr
	0Es+CCwiwSJcTdYMdN86sRCBqCf/HjlHhKs6EHa2MY7z4A7eADlGgBkLCtA6Npk9
	WJvRvHSe1y2xHZQbKFsAVlMKVO0BYUD+eKiF6ZDCiUjXg1A6aUhsVzaliTOw/Zv5
	9SkcrAM53urdjF3thdlLkA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 471g949mqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jun 2025 18:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1748913790; bh=F53Om07gH73Szbpr6a0tn21w5hSOrC/YuDAFxKkavqk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=WFbO4fW79DQ6gN3mYBe+/n9IflUN+Rwy/lUyPGJshOHsrn2sm4d+YCWxqj8+sIkjf
	 II/1WvbqXtzhQm0PouOGHkeA68yJcesA3o9B0mnEcAT/NAyf2GpLCEKVw8GmWe5ouC
	 lms44lDhrbjhveZDap5KN5FzvcPvwQrOiD4mG+AgHUfr5q2Ch5+EMoO7S2KJHSVVy+
	 mc190z6sE0kvSO1DNtnLVwSXwl73kg3+unoNrpviV8UDx3Ig85ppDSTtYVwu0D/X43
	 RoRLc9hp8YYx/tIgIWpJQhl2M5SgEf3QhLgCdTeZ7Q2WkV8zQ6rdS7H9fMevEefs77
	 cac+SSRpMpveg==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 040904013E;
	Tue,  3 Jun 2025 01:23:08 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 1AD23A00A0;
	Tue,  3 Jun 2025 01:23:08 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=aqg6xY43;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C168440528;
	Tue,  3 Jun 2025 01:23:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZkB8s7GAyNRLj7OGwrC8WTYxPqERUjoaGtfjsUZDvhoEeySAYgOvKT2wzILzkcZLIZEJwglRCAeNP+2pqLff4/oPAxg1W4K8kFcAhcinltIZrvCMVv6mu6ZeSinT+bqvE/tYkFUINnXeT6kh1bZNI6ANrOYFxOKbgyyOwsnTbna6NEqRRkarXTk6gG/iAZFak3Mw4SFkxHLyUqQhH1ACub9R6Pe6v4HV8CuuuWzQxk5hJnT4EkkgHiTPXCe0S8PynBh6UcaSWILjb0TaGTuMFGnUzFInTWabGtm/P10rCeeqRAY3Ufnx+U0RoiioSN+/BCIq+VHojN8G1Qk8CkMTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F53Om07gH73Szbpr6a0tn21w5hSOrC/YuDAFxKkavqk=;
 b=xtA3jG/kWCBshpMjNH2CzyhunSTfGkn3qG3Z9mnigaqTkZgCAJ3EMfeLXUwtqUe2DmfE6QPA0u/VJU1JrE3ysUdCB4NfOLn+7OBMq35ILTYsx3tNCrBglHxx2j/w/FdfuxhG0gK+N4jqjcrYWnebmVspjf35eeStImkfBTRZNDB6XDup/q8ekudzjzZr3bPkXqt/g8lrJ/e3Knk+dcBvasm027vYkeABh9zXYb6rzp7WT8CL/3NJIbvuN2zqFa+/BzqB5hHvkbkT33cQrRTJ7Cc32d9BEzip5fbAai+vs0YHtpW49kwKXkFyDztqjinUTCgIQGeLkMX0cQhdbyHT7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F53Om07gH73Szbpr6a0tn21w5hSOrC/YuDAFxKkavqk=;
 b=aqg6xY43+mAzkCh6EKY/3G+TjKfk7gM4IvK9YxP6T3p8J1SY6U4v92QOaYW0fbH0U1UNgnD+jcu+nI0vSRFVvdkJHWI84p0rd1WhwSR4k/mjGadCBY4DUuC5cfEGoDnwl/AxNVnJuUjbnnn2udvhkfICiDB9L+6YtLHXtV2NbfU=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA1PR12MB6893.namprd12.prod.outlook.com (2603:10b6:806:24c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 01:23:03 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8792.033; Tue, 3 Jun 2025
 01:23:03 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Frank Li <Frank.Li@nxp.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Shawn Guo <shawnguo@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "bjorn.andersson@oss.qualcomm.com" <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] usb: dwc3: add layerscape dwc3 support
Thread-Topic: [PATCH 2/3] usb: dwc3: add layerscape dwc3 support
Thread-Index: AQHb1AnlUE7hkiv/E0uGFrAejSyRRLPwpAGA
Date: Tue, 3 Jun 2025 01:23:03 +0000
Message-ID: <20250603012259.gyat6ungxyufhhbe@synopsys.com>
References: <20250602-ls_dma_coherence-v1-0-c67484d6ab64@nxp.com>
 <20250602-ls_dma_coherence-v1-2-c67484d6ab64@nxp.com>
In-Reply-To: <20250602-ls_dma_coherence-v1-2-c67484d6ab64@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA1PR12MB6893:EE_
x-ms-office365-filtering-correlation-id: 38b21556-b9a1-4f5e-d644-08dda23d2f98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UThKQU5rcUNvbHVwUUdpeG9mM1FDbXBmdzRnTGUyZjNJS1BIdWpqRFBwUXBZ?=
 =?utf-8?B?NEd2ZE84aHVsdkw0NTNTRHJ0b1hHRDhrK2FtMkpnSVUxQXd2M253V1Zpbm1K?=
 =?utf-8?B?NTgrTmY1RUZ4bGk5UzJhVGczTERpUnFxdlZvSytHb2JXTUh5UFpEQ2txWFh0?=
 =?utf-8?B?cytEbm1hbEJrTjY0U3NYdThnSmVMU05RT0dRbDh3ZW0zdjVGYXVSRTVHdTJM?=
 =?utf-8?B?azVuR0hyblZIazlZSHdRT1NYYUozWFZ1UzV1eEZHYXlNbUtNdTE3Q2VTYTRM?=
 =?utf-8?B?dVk0cnd5NU9tOTFwVHhISG9VL0hZc1N2TXIwbk9KVjIwVFluRGtUVFVFMlZz?=
 =?utf-8?B?bkxSQWRCRVQ1aGVRUjlpNHVBcFJxbDZMSVdmcndsc3EvYXdBS0JrZUw5ZUlw?=
 =?utf-8?B?cENGcjZVOU0xTXlYalFja0tkcWV1Q0tjRFQwS3F0ZGVaOU1tQW1GbmpScGpk?=
 =?utf-8?B?S2M1dGFEVE45bFZkT2w4WjFSWVBHVWRVa2FiY1lNaVYzSHdIUXZwUU5HTGFw?=
 =?utf-8?B?YnFobkRKWFJPS05YRUhQT3FMYlFUUU9NUDJhcXVPbCs4dThsYWRyNWVXRXU5?=
 =?utf-8?B?R0N4MlRKbk93Ky92STJVVmxrb3FKb0lram5YN3NHd1Y1VFBEWmZVelVadzhL?=
 =?utf-8?B?L0JiOFN6d3FaV2xXU200VHF1U0lMNDZIUnI5dEZDakFWMHRCTndlbWRaejJH?=
 =?utf-8?B?bk1SVk1rYm5LdnJCeDgvc1UwbzFZb2lweTZ1Y3lUbVVMM3hxUmdqTUs5Tks5?=
 =?utf-8?B?cUpIRFRJeUJIOTVkSDRqcjBzc2dldWpBdHpxcGhnMUh1NElGRjNEeEx1ckFP?=
 =?utf-8?B?YkZRNXNGYmJtVkdoMUlhNnZuSGRmZGJYVThPUXREQjQvWmlKSWppQ0RTVk1J?=
 =?utf-8?B?STVNUzVBb29IQkwxN1NweVBKMDJqRjI5VTdvZDRWV3lmTmh0S2I2OTNWeGo1?=
 =?utf-8?B?eWZCMmxnOWl6aFdRUTdPMW9Va0tCY3MzejdMT0hqRUM2THhGNHNXQTRrajNk?=
 =?utf-8?B?VFdleDA5SXM0dmhUVGRVTW4ra1B6TUQzWHhkdUFSTVFneW1wRFA0eUYremNz?=
 =?utf-8?B?Z3RDQXQ0TGhuVWdRRzAzUkQ2L042bDM5dElOUk8zTCs0Y0hLREQ4dmNZamFW?=
 =?utf-8?B?S2JneDRUR1lKbDNCNUwxdGJtNmVRc3NBbHJ3N0NTSi91WjQ5ZHUzS0cyS3Jq?=
 =?utf-8?B?RnFQRzZreHROV3g5blZQQmhick94UHJxZllPZnhQYjdLSU82OVpMM29jYXc3?=
 =?utf-8?B?RzdtZUVCeVQ3eVFjZUk3VmowNHdpNjhuU3pDRUhNUnBMVXI2Y3JoMjJzb1hl?=
 =?utf-8?B?bFRzYTFTM0Fma3ZUSnpYbFFkNEwvSGhYTFNLejJtcTFER3V3c0ZnYnRudm9Q?=
 =?utf-8?B?cVJ0anZxQy9FMzhOYXZ3YkVsbStOTXJRVi9LNzRCUGZrWVRQcHpHTE8vam8z?=
 =?utf-8?B?QkVXSVo5cE5rclR4dEkreXZ3Nk1NTGhQS2N0OGxDTUc0SUk5ZWZBTzlLRllW?=
 =?utf-8?B?WUx2OENudDhJbHJlR3NLZ2xoMW5DczA3TzkxQUJYU3lUYTY1WjBwZ2pFVTZm?=
 =?utf-8?B?L0RsVWdQUGRFSERRcmZIcTdMOVoyZlE1WWFyWSsrRC90VWQrRjlENysrM05l?=
 =?utf-8?B?SmtZYkZtd0paVEg1V0hrOU40S1c2OWlMSDZBT0lnZ1NzUWUrRXZxUU1iMmNN?=
 =?utf-8?B?QWRqMWJPNmMxVVhWRkp0VGcvenVDa3RmVWo4dzRZSUNzcnJXU0pjWTdiOGxY?=
 =?utf-8?B?RUlXNWRaU0VOQWRkejBaOGVQYVFYNFdNci9UQkZVeFE2VDFWMkdVU3VadzM3?=
 =?utf-8?B?SE1tNUI0a0t1OTlIWGpobytOYzVqUDNHYmFhQjJLbCtZT3hUSVJOYmZidE9G?=
 =?utf-8?B?VGZlVHlsd0hZWU4vU1JBM252bFdjcVU5Qkx5bTV3bVhMclh2dVNiNldjcUFv?=
 =?utf-8?Q?aKNfbHeKIlk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S1F3bEpScGlLYjR5ZVhJUmtiTjl4aFdHRDc5RWp6RUlJYlBXQ1pSODYwb1Vo?=
 =?utf-8?B?UVQ1T1l0akxKcG5VVkdNdUF1VEtkWHVvaWRxTHBKMmlYNmZ1T0Y0UzNHcHRL?=
 =?utf-8?B?MGUxTXdWZi9NbVZZRGlSSGF2NHI5TEp1MFpoaEZET2k2NDhVNGFFU2ljcCt4?=
 =?utf-8?B?VlZsczhZazFFa3EyNmlxS3E4eXY5SHEyVDlNTjBSc1lSZFpxRnN2VUxjY3pG?=
 =?utf-8?B?bWRxNTBNeUx3VS9KMUp4Q2ZQRnhtRzN3Z1U0NitUNzlIaEZOS0gyUEk2TTNU?=
 =?utf-8?B?dzBrQk1GU00rMlVmdTJiTmdiSTZrM1c1YmdidUEwaDkvTm0zUmNGMlNXUENi?=
 =?utf-8?B?eGxOZ1BodGt4SGV6Mm9iemxuZnZsYWN1ZjBkWGFBQlFaNUdTaytyZEFiQkJV?=
 =?utf-8?B?Y2xUcUUyM3l6d2tQZyswcC9iOC94WjhMdEFVeXpnRmx5bnpaNExIY1VNSDVz?=
 =?utf-8?B?UTF3SXdSVzNHUzQxNVFsZHlsb3o2aWZmaVh0RHZ2RjlWWDI4UnNjaW9LRlpQ?=
 =?utf-8?B?dElFNTA2c1RYWlo3V3lITXhBRHVkTGJKcnRLU0EyRnIwMVpMMXVCdlAybjNv?=
 =?utf-8?B?UGZGazJiWjZjTmk3aDZpV0s3UmFJUHhnQ2F4L2pTbXR6Qmtoek1nQitHZmNP?=
 =?utf-8?B?VUxqWEpZM2pvVmpWaXlCUDkvUkxQUHhocjgzRGM1Nkt0Y2RKMi9Fb2RYWXhH?=
 =?utf-8?B?cjB4b0tGWFZYRmhvSU5IUGF0RUcyUEpXb1hFYlY4QkRVWW1tTDdhTnBodlcy?=
 =?utf-8?B?YWtMaWlIZXJ4cVZhNW8zcVFFV0o1REhwM0lQNTk5MzE4aHlzWlp1Y2t5WVVw?=
 =?utf-8?B?eFRjalFzcUJ4Yk5sTEMwUURZZ2RRV1J6VzBUeE4zcm5HK1dKbFhkMHR4cms1?=
 =?utf-8?B?VExDTVZ2Qis2QXRndEdkb204RjRxQVZpcWtCUWVwaWhBdzhlZTloQnI1QmFK?=
 =?utf-8?B?QjhuTTh2QjB2Q2g2RGRTczVRSktVUnJ1Z0ZUdkdndVdFMmlzbDlVVEdESDVF?=
 =?utf-8?B?RzJXWjdmbTZzbGlZOHFHNHhmY2VDakxhdUJFYmUxbVZ6Qmd5RzhNM0ZQK0JV?=
 =?utf-8?B?RTJKcWZVM1dWQUx1R2twb0ZHOTBpVzJVWk1wb1VZU1VjWE5ZVUpMKzRRVGhM?=
 =?utf-8?B?V2t1V1JySlo0dU1BQjU5UkdISFBwRHhtNnIxaWFNc1BvZFd3NTRpYlc1SXhN?=
 =?utf-8?B?VVBCWWtPT3RaUUpVVVY4ZkRCUmpjRFNWSUE1QlNzMmtab09xSEd3SDRRRGtZ?=
 =?utf-8?B?S1U0aHBGeTR1ZkhaNjRBckF5VXpuei9TLzRpTDRsZlFhc3hpY2E3ckhkcVBL?=
 =?utf-8?B?YTBibWd0elRPU1pZdXVzN013VW9uMXhLSGdUS3h6Mjcxb3BuV1BxRGRpZ3lG?=
 =?utf-8?B?aUNBMmpZbFJJcTNsVjhIRnE0d0pvamY4Sjk2SWE4MnhaZkE4R3ZQU3BISk94?=
 =?utf-8?B?U3FYK1Ayc2VQQ0ZQY21HeUFDdnV5QjBOeE0xai9HK095aWlFWnoyanRxdmdj?=
 =?utf-8?B?ZUZQQkNUZkNYQXVUUHJVNEVhcVBpMnN1clpaYk85ZXFMYVY3K2VJN2RDZG45?=
 =?utf-8?B?NjF6OEJrRVNLYzAyYmV4bTJ6L2h0RnBlMzhKVGdFR0drR3BCUFNIdVRrTExR?=
 =?utf-8?B?WFdhOFZXYklHWUdtUTdjRzNZOVJoeVl6Ykd0WmJ0UTdOVVlmNU5mMVpqeHd0?=
 =?utf-8?B?ajVkSmdpQlNiWVZvc2w4Mk1KNXpiS3h2RGxqLzhiNi8zRkVVekZkQzg2U3lx?=
 =?utf-8?B?L3g3TWhLZkRiOThxc2VyKzFvM05Hc0tqQW9HMW5zL01DeFpzcFVhOWpIOXZt?=
 =?utf-8?B?a3BhMklDRDVKV0xDMTNpQ1VocW9pMUk1WXIra2I3Y0NpSVpZaXpOYUVhd3Ur?=
 =?utf-8?B?WUYwSG5yTDlOU0Qwd1h1L3NLaVo5ZEIvSjRwWVZDZ0lLVUFyS2p5TjBJbkRl?=
 =?utf-8?B?dENadVNpZm84T2U2clFSUDVjaENTUWpWZGxUTjJRQ01TTW9xSUdmV3ZIRVJR?=
 =?utf-8?B?ZU04ZmUrZklDRzJwQTFKaDBNSGhqU3U2R0NxTHJ1Qkp3SFp0cU16cWZ6QnJ5?=
 =?utf-8?B?MmtOU3pHendnNEtGWWcyUW9TWDU5UW9aT3hOa1B6MFQ3S1daNEtxTHlhRlZX?=
 =?utf-8?Q?d7M6yrhO+FhMvqQW69JaSm70t?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8CA31A39685AED4EA3281DC4C34428BA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kvjNGDMvb3fL1nP8AozMmP9G6+1dut5A8aFZYfDXPFwGz+UpMVZUXksWiSPrVZeqaPhZHxmBFsu2sGIKCcVFqY6s+kKXzQ3k/AR8bvb/hnagu3AfLNUXvQF5WnsERyNyr44po9htjuyTZ+afkp9yYa2hku9QY6VooN53tJ/x2F+n9byuiQoTHSGE7+xpkZktA2lvMyZTMZ05M/CUqHEuFIfXyB/WS5FuqNn1hVn7iOnNtE0RaTpjG76hPfEhggEenofPfCN6MpXc6473/4IuN9uTTsQd8anhko6OutZrLwrftot+eunS0rIcOtLJtg8LGwNI60hpKS6NuVfPgy+XMOLiLtt9UxcYMuIum/Nl9hw+Bcq6zDH06YnB9guW9dVW1kYT1lgDfTotF32wmadyj2VdnR87N0EqnSCCI9rphhqgXEBAeYAiGfnbN9u7x6PFHeRNGdvbVDiZtdKnDFOeJOWsAcpWTmpPZIPJ46SoEzQZsiKAqHWFrbApwNFtpTv8NFkot4nifZR5AJB22QWgD9b/ou8pr5A1zl9zqYiceTi2D5BqUEMovfQZ6nzPxXTwaIzBUGyT3h+IaMQnuZaf+Bd9YQHnUSAkgoLg/6k1p7RN19WYr0TlGX7IUR5hboQSjsoinQJHEstlIU0+jibmgw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b21556-b9a1-4f5e-d644-08dda23d2f98
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 01:23:03.1149
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1JtyRhxWD02w9zJ+vpuL+aTq8PWIU2qNYgkF+yVo/MdjPHWGL+hBLS+TSpzB+1yBnmt7fX3h/bSlCTfQ13w0Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6893
X-Proofpoint-GUID: O-8xPjd9rDv5tmD0bGuIg3YOuqHwqKqg
X-Proofpoint-ORIG-GUID: O-8xPjd9rDv5tmD0bGuIg3YOuqHwqKqg
X-Authority-Analysis: v=2.4 cv=a4Yw9VSF c=1 sm=1 tr=0 ts=683e4e7e cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8
 a=Ns5rG1Fryy6pZTek7GUA:9 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDAxMCBTYWx0ZWRfXyrDxf8Cg4Zkj
 rRPB4so0D943N2plAV7s/ldVDqFwdjtp+GeLvVCX9H8hcXDOJzqzomUvmvV7xo5Dql2F6MpomIo
 t7z65mTzFahj5dB/lG7z8SCRe3vg7IpXdGfxCMAVdUXcTVs3Ofny3TYXKk9Sf+mn/J51YDNR7E2
 Wb+A4+JUJDenIKfQyYb5jHkklc8ykvDaN6DTegD5kpG3HbfCGrFtdp8jY9AFSRdxOeREOyKBuJs
 S4iWaGRajWszKA5yr+vIbpqqSRS5GcVMbFBLmxTJoS4ZnWHrOtPBw4eLA3xTLyY0i1eVlj7bHOa
 s8VTDVYkBrYEV/JHB3HUbRN9wgeghgH/xIANWdvuySm2+3HCozXqzDnh8Z0gqElPbJaHxoL49fQ
 EXstDdI/5HR6OOxGstSodYyV4Ji8otxS2biLcS9IC9m0rR0oecD5kUtMJlqHd+8F9Q5efOfu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_08,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 phishscore=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 spamscore=0 adultscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000 definitions=main-2506030010

SGksDQoNCk9uIE1vbiwgSnVuIDAyLCAyMDI1LCBGcmFuayBMaSB3cm90ZToNCj4gQWRkIGxheWVy
c2NhcGUgZHdjMyBzdXBwb3J0IGJ5IHVzaW5nIGZsYXR0ZW4gZHdjMyBjb3JlIGxpYnJhcnkuIExh
eWVyc2NhcGUNCj4gZHdjMyBuZWVkIHNldCBzb2Z0d2FyZSBtYW5hZ2VkIHByb3BlcnR5IHNucHMs
Z3NidXNjZmcwLXJlcWluZm8gYXMgMHgyMjIyDQo+IHdoZW4gZG1hLWNvaGVyZW5jZSBzZXQuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4NCj4gLS0tDQo+
ICBkcml2ZXJzL3VzYi9kd2MzL0tjb25maWcgICAgICAgICAgIHwgMTAgKysrKysNCj4gIGRyaXZl
cnMvdXNiL2R3YzMvTWFrZWZpbGUgICAgICAgICAgfCAgMSArDQo+ICBkcml2ZXJzL3VzYi9kd2Mz
L2R3YzMtbGF5ZXJzY2FwZS5jIHwgODggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysNCj4gIDMgZmlsZXMgY2hhbmdlZCwgOTkgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvS2NvbmZpZyBiL2RyaXZlcnMvdXNiL2R3YzMvS2NvbmZp
Zw0KPiBpbmRleCAzMTBkMTgyZTEwYjUwLi4xM2E4NmNmMDNiOTRiIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL3VzYi9kd2MzL0tjb25maWcNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9LY29uZmln
DQo+IEBAIC0xNTAsNiArMTUwLDE2IEBAIGNvbmZpZyBVU0JfRFdDM19JTVg4TVANCj4gIAkgIGZ1
bmN0aW9uYWxpdHkuDQo+ICAJICBTYXkgJ1knIG9yICdNJyBpZiB5b3UgaGF2ZSBvbmUgc3VjaCBk
ZXZpY2UuDQo+ICANCj4gK2NvbmZpZyBVU0JfRFdDM19MQVlFUlNDQVBFDQo+ICsJdHJpc3RhdGUg
Ik5YUCBMYXllcnNjYXBlIFBsYXRmb3JtIg0KPiArCWRlcGVuZHMgb24gT0YgJiYgQ09NTU9OX0NM
Sw0KPiArCWRlcGVuZHMgb24gQVJDSF9MQVlFUlNDQVBFIHx8IENPTVBJTEVfVEVTVA0KPiArCWRl
ZmF1bHQgVVNCX0RXQzMNCj4gKwloZWxwDQo+ICsJICBOWFAgTEFZRVJTQ0FQRSBTb0MgdXNlIERl
c2lnbldhcmUgQ29yZSBJUCBmb3IgVVNCMi8zDQo+ICsJICBmdW5jdGlvbmFsaXR5Lg0KPiArCSAg
U2F5ICdZJyBvciAnTScgaWYgeW91IGhhdmUgb25lIHN1Y2ggZGV2aWNlLg0KPiArDQo+ICBjb25m
aWcgVVNCX0RXQzNfWElMSU5YDQo+ICAJdHJpc3RhdGUgIlhpbGlueCBQbGF0Zm9ybXMiDQo+ICAJ
ZGVwZW5kcyBvbiAoQVJDSF9aWU5RTVAgfHwgQ09NUElMRV9URVNUKSAmJiBPRg0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy91c2IvZHdjMy9NYWtlZmlsZSBiL2RyaXZlcnMvdXNiL2R3YzMvTWFrZWZp
bGUNCj4gaW5kZXggODMwZTZjOWU1ZmUwNy4uY2Q2MzViNzc5MDJmYiAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy91c2IvZHdjMy9NYWtlZmlsZQ0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL01ha2Vm
aWxlDQo+IEBAIC01NCw2ICs1NCw3IEBAIG9iai0kKENPTkZJR19VU0JfRFdDM19TVCkJCSs9IGR3
YzMtc3Qubw0KPiAgb2JqLSQoQ09ORklHX1VTQl9EV0MzX1FDT00pCQkrPSBkd2MzLXFjb20ubw0K
PiAgb2JqLSQoQ09ORklHX1VTQl9EV0MzX1FDT00pCQkrPSBkd2MzLXFjb20tbGVnYWN5Lm8NCj4g
IG9iai0kKENPTkZJR19VU0JfRFdDM19JTVg4TVApCQkrPSBkd2MzLWlteDhtcC5vDQo+ICtvYmot
JChDT05GSUdfVVNCX0RXQzNfTEFZRVJTQ0FQRSkJKz0gZHdjMy1sYXllcnNjYXBlLm8NCj4gIG9i
ai0kKENPTkZJR19VU0JfRFdDM19YSUxJTlgpCQkrPSBkd2MzLXhpbGlueC5vDQo+ICBvYmotJChD
T05GSUdfVVNCX0RXQzNfT0NURU9OKQkJKz0gZHdjMy1vY3Rlb24ubw0KPiAgb2JqLSQoQ09ORklH
X1VTQl9EV0MzX1JUSykJCSs9IGR3YzMtcnRrLm8NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNi
L2R3YzMvZHdjMy1sYXllcnNjYXBlLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtbGF5ZXJzY2Fw
ZS5jDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMDAuLmQwOTNm
MTc4ZTFlMzUNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMt
bGF5ZXJzY2FwZS5jDQo+IEBAIC0wLDAgKzEsODggQEANCj4gKy8vIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IChjKSAyMDIwIE5YUA0KPiAr
ICovDQo+ICsNCj4gKyNpbmNsdWRlIDxsaW51eC9vZi5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L29m
X2FkZHJlc3MuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4gKyNp
bmNsdWRlIDxsaW51eC91c2Ivb2YuaD4NCj4gKw0KPiArI2luY2x1ZGUgImNvcmUuaCINCj4gKyNp
bmNsdWRlICJnbHVlLmgiDQo+ICsNCj4gK3N0cnVjdCBkd2MzX2xzIHsNCj4gKwlzdHJ1Y3QgZGV2
aWNlICpkZXY7DQo+ICsJc3RydWN0IGR3YzMgZHdjOw0KPiArfTsNCj4gKw0KPiArc3RhdGljIGlu
dCBkd2MzX2xzX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICt7DQo+ICsJ
c3RydWN0IGRldmljZV9ub2RlICpucCA9IHBkZXYtPmRldi5vZl9ub2RlOw0KPiArCXN0cnVjdCBk
d2MzX3Byb2JlX2RhdGEgcHJvYmVfZGF0YSA9IHt9Ow0KPiArCXN0cnVjdCBwcm9wZXJ0eV9lbnRy
eSBwcm9wc1syXSA9IHt9Ow0KPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7DQo+
ICsJc3RydWN0IHJlc291cmNlICpyZXM7DQo+ICsJc3RydWN0IGR3YzNfbHMgKmxzOw0KPiArCWlu
dCBwcm9wX2lkeCA9IDA7DQo+ICsJaW50IHJldCA9IDA7DQo+ICsNCj4gKwlscyA9IGRldm1fa3ph
bGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmxzKSwgR0ZQX0tFUk5FTCk7DQo+ICsJaWYgKCFscykN
Cj4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ICsNCj4gKwlscy0+ZGV2ID0gJnBkZXYtPmRldjsNCj4g
Kw0KPiArCWxzLT5kd2MuZGV2ID0gZGV2Ow0KPiArDQo+ICsJcmVzID0gcGxhdGZvcm1fZ2V0X3Jl
c291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsNCj4gKwlpZiAoIXJlcykNCj4gKwkJZGV2
X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCAtRU5PREVWLCAibWlzc2luZyBtZW1vcnkgcmVzb3VyY2Vc
biIpOw0KPiArDQo+ICsJaWYgKG9mX2RtYV9pc19jb2hlcmVudChucCkpDQo+ICsJCXByb3BzW3By
b3BfaWR4KytdID0gUFJPUEVSVFlfRU5UUllfVTE2KCJzbnBzLGdzYnVzY2ZnMC1yZXFpbmZvIiwg
MHgyMjIyKTsNCj4gKw0KPiArCWlmIChwcm9wX2lkeCkNCj4gKwkJcmV0ID0gZGV2aWNlX2NyZWF0
ZV9tYW5hZ2VkX3NvZnR3YXJlX25vZGUoZGV2LCBwcm9wcywgTlVMTCk7DQo+ICsNCj4gKwlpZiAo
cmV0KQ0KPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgImZhaWwgY3JlYXRlIHNv
ZnR3YXJlIG1hbmFnZWQgcHJvcGVydHkgbm9kZVxuIik7DQo+ICsNCj4gKwlwcm9iZV9kYXRhLmR3
YyA9ICZscy0+ZHdjOw0KPiArCXByb2JlX2RhdGEucmVzID0gcmVzOw0KPiArCXJldCA9IGR3YzNf
Y29yZV9wcm9iZSgmcHJvYmVfZGF0YSk7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIGRldl9l
cnJfcHJvYmUoZGV2LCByZXQsICJmYWlsZWQgdG8gcmVnaXN0ZXIgRFdDMyBDb3JlXG4iKTsNCj4g
Kw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCBkd2MzX2xzX3JlbW92
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiArew0KPiArCXN0cnVjdCBkd2MzICpk
d2MgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gKw0KPiArCWR3YzNfY29yZV9yZW1v
dmUoZHdjKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQg
b2ZfZHdjM19sc19tYXRjaFtdID0gew0KPiArCXsNCj4gKwkJLmNvbXBhdGlibGUgPSAiZnNsLGxz
MTAyOGEtZHdjMyINCj4gKwl9LA0KPiArCXt9LA0KPiArfTsNCj4gK01PRFVMRV9ERVZJQ0VfVEFC
TEUob2YsIG9mX2R3YzNfbHNfbWF0Y2gpOw0KPiArDQo+ICtzdGF0aWMgc3RydWN0IHBsYXRmb3Jt
X2RyaXZlciBkd2MzX2xzX2RyaXZlciA9IHsNCj4gKwkucHJvYmUJICA9IGR3YzNfbHNfcHJvYmUs
DQo+ICsJLnJlbW92ZQkgPSBkd2MzX2xzX3JlbW92ZSwNCj4gKwkuZHJpdmVyCSA9IHsNCj4gKwkJ
Lm5hbWUgICA9ICJscy1kd2MzIiwNCj4gKwkJLm9mX21hdGNoX3RhYmxlID0gb2ZfZHdjM19sc19t
YXRjaCwNCj4gKwl9LA0KPiArfTsNCj4gKw0KPiArbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihkd2Mz
X2xzX2RyaXZlcik7DQo+ICsNCj4gK01PRFVMRV9BVVRIT1IoIkZyYW5rIExpIDxmcmFuay5saUBu
eHAuY29tPiIpOw0KPiArTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOw0KPiArTU9EVUxFX0RFU0NSSVBU
SU9OKCJGcmVlc2NhbGUgTGF5ZXJzY2FwZSBVU0IzIENvbnRyb2xsZXIgRHJpdmVyIik7DQo+IA0K
PiAtLSANCj4gMi4zNC4xDQo+IA0KDQpJcyB0aGlzIHNvbWV0aGluZyB0aGF0IGNhbiBiZSBlbmhh
bmNlZCBpbiBkd2MzLWdlbmVyaWMtcGxhdCBnbHVlIGZyb20gWmUNCkh1YW5nOg0KDQpodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC11c2IvMjAyNTA1MjYtYjQtazEtZHdjMy12My12NC0zLTYz
ZTRlNTI1ZTVjYkB3aHV0LmVkdS5jbi9ULyN1DQoNClRoYW5rcywNClRoaW5o
