Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628C92BB04;
	Tue,  8 Apr 2025 01:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744075148; cv=fail; b=WWz40OZ4yhVa3Gs3t/LC6FiIzzNI9/fVY2/+vx1hPcoDTXMd0ijQ1EN93ysOdgDsk/cbrRE9unSTaql2dFPFbSYAhQmwK/7L/0WXbrFBQOmTzaS86rwLn47Yu/nHlQI1YBXxcVRwsjA9kDpT6XfOcoOtbjhOiqulHJ6qs41vHUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744075148; c=relaxed/simple;
	bh=vJPMnUORAlQPmk81w24JQv4puFJD1PIKvrxJYoK8Yn0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Rp0i/z+rfYvxekb9F9IIS5EGLOqA10/SLXkebNC4nYIw1MDh83hD31OrVQiN3lqDX8bcehbCT78r8Z7alvBpBlKY6MD/Q+/iVoajaxRgIPbreZjax5GGfF5COBZg/PXoLNc39OeTsGwugtrH3vNkhbsxqV59p+h067f8RtZ97JQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=VdRwbw2n; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=UD01AQrN; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=EikoCuvB reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VdRwbw2n";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UD01AQrN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EikoCuvB"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53801Zod015327;
	Mon, 7 Apr 2025 18:18:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=vJPMnUORAlQPmk81w24JQv4puFJD1PIKvrxJYoK8Yn0=; b=
	VdRwbw2nUhFICoQgQx5PFf2pO1CbtIhKSaiQfn2qItyq2lc2HecBvd/zqLfPE8ex
	I6TuBxwsoDhPx2/NSdMLJR7N9yseibFebSk0Q31lvGGewD52b7Q6I6pbd91ZqwXp
	vAbolow01MFxdAon3IROTL2lWiQJuNKpBv7E6Nu9wgdOjM9MuapXSkAkooSEmtgC
	Mn/SewwQIJynt0LQwLtg0OMuKuWnYR5ecwtjK1MJImS9+yZk2mXinkjXK33Cw183
	0cMMu4kvgtpRq8p9MoCIueSTeBm4EIePpkLXVq2eachb1mBZVfkxgZ9Eh6P65JO1
	WppCUUkl/3BmjpVlaf7MyQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 45u3hp7q2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 18:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1744075117; bh=vJPMnUORAlQPmk81w24JQv4puFJD1PIKvrxJYoK8Yn0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=UD01AQrNBfGxpNhSC8iovJGA1wjpEPUpdlKlbnDTpBZOfDuobxYLzkxaLdp3VVF8m
	 k5XuPSQ86lwn9oatE0DbGGy+r4oBy1WHt3X7W8b9fx8qKLVF1hfj7P+BWj4fNgqrzy
	 baSyQnOjPEGnGBkvEhhC+hYaBj5RIlK+rlceV/UE4Pg8Ikc7OB2ycE1cxXYf7Nh1+4
	 v/eGF3C5hQMJKXeqM8XaKQ9scX82FQGH3mGTxKXWArCGjwtCdA9b1LyvaRkodRtlJR
	 311ST1nBYbGkjKcZ1/GURwRd9gaV166JzrsWHrGaGHSqBFhN4xBZxzBsJNNyWgabbj
	 MqG+795+hEB2w==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4A025401D3;
	Tue,  8 Apr 2025 01:18:36 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 43EBBA0085;
	Tue,  8 Apr 2025 01:18:32 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=EikoCuvB;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 41F8F405E0;
	Tue,  8 Apr 2025 01:18:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALNGqSfhij0N2Q8ZBPsLcixeEmVSCk9k2s4PhZdiC1CSJz3f07MYSksZQSVBnpKYD3yUMMszIfcZPuHUN+ChEHnH90CjDpE0MBo6e39Y4QGSfLXDjAspktMyQGSPPO7Na7L+gag/S8XDS2D/B/i2pyPUVk71XO8ktLO0WOhIBSKe+xJIbIe7z2y3NmPvYAf0cpfhZgOul03t+g0qRD44zuIeJl17bfwQG4rjWekm7a1xViLinr8lt9eE7cen896jabXaEV+F2xr4d5gEshrkqGuvl9bRSZcXttMT/sYIYCoilubwNpu/y++cmh1Zw+JkUGez0/kzY+NPxebJW9Xl8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJPMnUORAlQPmk81w24JQv4puFJD1PIKvrxJYoK8Yn0=;
 b=Q3wi+EgPz5P7lNSASErPF/OLNbALD6j3nC8Z3G+A9wmAVSmdal2jPoXjYcObDV/N9A/kiNpRPovmL8BiB+JdOCIuqb3ZPa7Umc7H//TH6Vl/cg+ee4ec1qQnR70ns/Sc7Q1qlS31t6Sy5HU3K9ctDnYUrppeFdDuzvO6xkVFvmZVZhl/X+CvlRmFlVPe7W186iYpJyqUNHPnlYRshJrIP0oTRYmYa7wk681fxDVCgWgujNqAvG2/hSIoLyV5r7aDKcsEj19CPo/JFCX8tYoHVRCqm3trL3UYeBd3Wlhv6K2BHRs9m8aa+VLd99NnhxyIswWw29seGHVSKmqhXFFlvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJPMnUORAlQPmk81w24JQv4puFJD1PIKvrxJYoK8Yn0=;
 b=EikoCuvBBi9KpoyNp2QUqL9CP/Z/aa2eiN72GxpzrnOjQhVKhoSl+TZlMGi6+BN46Xx0ziZ6kHdCkgWK1W/0aUZXXg9Vrx83YDpBBp7V/8MJNM1dbCIywBt3IVaby2qNrxl1TkbPURNZbD0TdhZpaersstzA2Eyl0oK8snCczAk=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH3PR12MB9023.namprd12.prod.outlook.com (2603:10b6:610:17b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 01:18:26 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 01:18:26 +0000
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
Subject: Re: [PATCH v1 2/3] usb: gadget: Use get_status callback to set remote
 wakeup capability
Thread-Topic: [PATCH v1 2/3] usb: gadget: Use get_status callback to set
 remote wakeup capability
Thread-Index: AQHbpIi63HPVwLvMQEOG1YCtYDqZc7OY/w4A
Date: Tue, 8 Apr 2025 01:18:26 +0000
Message-ID: <20250408011758.qfdflgrrmahwmfqi@synopsys.com>
References: <20250403110805.865311-1-prashanth.k@oss.qualcomm.com>
 <20250403110805.865311-3-prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250403110805.865311-3-prashanth.k@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH3PR12MB9023:EE_
x-ms-office365-filtering-correlation-id: 72aecb1a-efde-41cb-7b1e-08dd763b4393
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bUJaREVnKzlodHEycGFENU8rNGpXWkZBT1I3ZVJtd0VTK3lvdnlCWmdza01w?=
 =?utf-8?B?SmRKWDdaOUxrTjVoYVN6aE1Kbk1wUkFJQ0JCZHExQ2Q0eVBSV1JJU2dKL21K?=
 =?utf-8?B?VmY4aUtxWnN1SFlkSE00NWo0NWdwcVErdSt0cGVsNm1hbTFsMiswaWVXekZV?=
 =?utf-8?B?aW1Fa3JybmgvaHdpaElESXhXaXhIaUFuY3lNdGlhUk5IWmw4Wi91eWhqTmll?=
 =?utf-8?B?aEZydW5raTRwRGhIWDBvK1cyQ0R1cDIxcWY2VDFNemJHeHVIdkFnZndyY2Ny?=
 =?utf-8?B?QjVmTk1VS096WXR1Q3lTMFJMdmRmMkxZVHU4WCtmYVoxMUNnTThsM0dwZ0I3?=
 =?utf-8?B?M00xeXZxV2V6bDZlbE1zckhYaEloQzhWV0tUN0pEQjk5NHlEM05OaUxlYnlM?=
 =?utf-8?B?WTFueXhNeHVQL0MxQ1dRdHJsRXVpeGlLczZ4aVFKeHduL1RXdkdVdG4xZHRH?=
 =?utf-8?B?ZzBnbndXeFdqMGo3UjJnT2tuVnRKSjJ0TnFTUnY5RVVnM1lGWWdQZzJuMWxZ?=
 =?utf-8?B?YWxKbWt4OTBNSjNGUE5WQW93RE4zRnFBUU5abmFBWGtyYWhNRWZCZmloVmEz?=
 =?utf-8?B?ODVrR3pGRlZybUQrajQ2Wks4dnNnNXYraVVJVWQ0MUMxRmpSME9OdDg1blBr?=
 =?utf-8?B?c0srd0FlWkwxV2ROR1hZREtZa0ppNmd5ckM4V3lncTNnNGRzN1FoTUF5Zkt5?=
 =?utf-8?B?RjZHL3lBeVU0U1cvN3lmWm1oTWFjNUplam1aWXFvcU1rbk1DNVhka0pRbkha?=
 =?utf-8?B?eVk0TUxybnhUZTNWUnVOa1hGRmNiUEw3L2ZxYTZ2eEVkbW1jNjVXVDVyM1E3?=
 =?utf-8?B?M3ljUFRpSXlMcFpYKzVLcGpXeVJaWEtZRTFJL01hNEFkQ1FDUVE0OUZHUWpr?=
 =?utf-8?B?d3haRE5lV3MyVUE5U3lmeGdxOFNFUkY0anl0UUVIbmFGc2VNdjhpVzRTUXJR?=
 =?utf-8?B?U3gwNDQ0cGdtY2xISHNrTTZIcndqRnZ1Q2Z2RmtYYWVxbHpCRU9KRWxuTGVL?=
 =?utf-8?B?bUFvOERkSU9BZ2VVdTRweHVGNThTNmg2cGdERFVJeTlxcVlIYStEL1BTWjN0?=
 =?utf-8?B?RDZGOWJKU0VLMDErT3JyY1FjTjJhSGJnQnIybm9PdUNyNVNPVk5pYzFCVnI5?=
 =?utf-8?B?OWw2OUNnM3FNbkRPQVU0ZSs4dHpuZ2ErS1Z5RVhqOEljSWFVYjg4TURVbk1Q?=
 =?utf-8?B?OWYxRlczMFljZjRiai9OMmVzaVNzRkRYbkxHWGg5T3RkdThBa2p0T2tDbFU2?=
 =?utf-8?B?L2gxbit6MzZPNTVjUmZXaUFMOE1FeUN0QnNkV2ZFTVVVczY1OVA2aFJJdHVP?=
 =?utf-8?B?a3p1SDhJMEZUR2MyeTY2M3JLQXBoZ2gxTG5sSHN0T1Z1S0FZRWl1RmtsNVF5?=
 =?utf-8?B?NTdtS3dwUTV6Qnc3VVl6cEs0MitSODU1NlUrU01EY2FldDhQdUpoRjRWb1lv?=
 =?utf-8?B?dnZ0cXFDY3cyTFM0V2VZTGxhSjd6TGpneUdNVWpzZnBneG9maWJhVzRJcFJC?=
 =?utf-8?B?Wk5aZ3M2MGlSMkhWOU9RL2xESzZsb3JZQ0g1TFAyR2h6ekJTMjFCWTJNUFht?=
 =?utf-8?B?NngxNGFYR3BESjU1a0F2ZEVZMVZhRnF0NlJoc3hvNnFjU2pIbHUwYUtCZ00x?=
 =?utf-8?B?Rzc5RHdrbzJicEg3Ykt2djBNenBHTGIyc2JuTFNGdDVnU09Qa281QU1qV3RL?=
 =?utf-8?B?KzBRQmtyWUlOSUthck5Jem9PZmY1aGRaN1hSZEJ1S1V5Wi9sUDNsYjJEVS9R?=
 =?utf-8?B?cjAyZGFkb0YxTG5rZlpCTmtKci91NU01WW1rUTc2LzNVQStqMVFjRE9uNDNT?=
 =?utf-8?B?OU1JU2VNSXdxbW4zSmxxRERMM0VBN2pma09CUGxoRWp3UzRwNUxhUWVuZGQ2?=
 =?utf-8?B?bWZyd0pVT2dqclRMbHJvLzcvbUpaaE9uSk03dHk5RkhqV0pwNXNHNkFoSVZ6?=
 =?utf-8?Q?Uipd60B231VlujJ8w9sAUuTA1glQcBv9?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bWFpbm9uaGg3dzlMY3kzWXFBRU5OTDlLcnhndXgvUm0vWE1YRTBaamp0a09h?=
 =?utf-8?B?UVBtc0hkODlKMEx4anlsT3B4dzdtMVJMQmhEWjlKMTBCekoxTkRwMFlKWG03?=
 =?utf-8?B?SmtxcXRsMGxwU1YyZXZTV2RtMXVoMERDTm1yTE96ZGlhLzMyQzRyaDVWQ1FU?=
 =?utf-8?B?bmxBaDE3R3htN2tLTlllb1RFbUtmL3VCMDZVUGFheWxNZHAvMkxqbVFjK3Rn?=
 =?utf-8?B?ay9oSkhsbkw1aWpUYmVyeGhWdmdHWnNFeXdpNjA0L3ZwMVEweEgxeEpzWHZV?=
 =?utf-8?B?TmV5WWRnTEdFL3RyV2hxcW1KNWFOWCtvNy9tVVc0OUNBMW5FTmI3dC85Rk5l?=
 =?utf-8?B?NVplbms2eW5WZVltUWExMkFlMG00SzRFaHpoRS93UUZwTGJqczZ6ZnVPUkxZ?=
 =?utf-8?B?OXNMaUduYzRyQ3MraXpnOG9TcURHR1BEMzJSZCtBa2tkZERKMkoxZHlIamRp?=
 =?utf-8?B?Q3FueVgwbERkanJQMUZBVFRTVVpxWW5mOGhJL0FtNXhRbVBFNm80T3Zldjc4?=
 =?utf-8?B?bFJ0NEdWa1BZNWNwSHVaWEtZRmczUUk3QUFuV3RaRG84MXJlVXRhZVpTWFVt?=
 =?utf-8?B?ak1yLzBMbHN3Rkw0UmVPQ1NhTDNkWGMweDVZeGFHVFVRMi9WRzRQS3J5Wmpq?=
 =?utf-8?B?Qk1kL2pwQU1FRVpUcFpibzlrQWVTSEhMMnE0WFVIY3F6S1hJM0k0SXVMai80?=
 =?utf-8?B?RFpnanVsVXBaaDJJc0VnQVVNekJPOU9aMHZKKzVHMlc5SFZWRStSN2xBYmQy?=
 =?utf-8?B?ci93aXFoRHVoQ1ZTQnBtN0FzcnlpOVpBNDAyVGpnd3JrVHFDNUwxbFljUW03?=
 =?utf-8?B?K2ZvbXFHNHBoK2ZxeUliQktrTEhYREFHU0dscmVZU1Q5QWluOG0xN1NQZlNG?=
 =?utf-8?B?SVd0R1FKRzI1M0E2d0M1UUtCdUVXV0dibEl6ajNwbzVRQmREb0o2L25QR0NC?=
 =?utf-8?B?VkptWjczVzZtTldXZThBb3M4aVRKc3JHb1dkcGhsb2EwTTdkWVhHTUt1VVgv?=
 =?utf-8?B?MVJEUWxiY0FNcXhYRFRyM2d2NDhvTWVBRHREU3JOVlBXK1dRSG92VmpIeXZE?=
 =?utf-8?B?d3JKTkExMmlkZnp5eERvZXFpaXhCRld2cWZxYnZCQ0VwVHplZytDV3c5RnM0?=
 =?utf-8?B?aEVsR0xPZnVZYlo1d2FCY3VTZGJUOWd0b0hXWERjakN5V2s0UnIzdnd4aldv?=
 =?utf-8?B?SnJOSzBsQnpheVYxbFJVdUtjVkdFQ1NhU0VUbUZFWkxmZVRYdVpmMkNOWHl0?=
 =?utf-8?B?Vkd4dVI0S2FaZ0NFRDBwS1VrTzBtbVJVRFpBazFtRURMK3BDeC81N2JIcDBY?=
 =?utf-8?B?QStmMjk3dUZVWWdhWFpDY2llUy91bVJ0S0pCY3RKaEJOeWxPM0pvRWo2bWc1?=
 =?utf-8?B?Q3BLa1kxYUZKTXYrdFJHTEl4ZlZXYURjYzZvZXBMRWlQMlJIaStpT2UrYkFQ?=
 =?utf-8?B?WFNSWm1nd3Q3VWxBSmoreHk2VUdEMFhCUVhXakpxRUY1eG4wS3hHajJNcjFJ?=
 =?utf-8?B?TXBTVnk2L3FzTGVNSkNhWWRVb1k0RHJXSzhjcm5OTUFOZEV6QUEvL3dXZEc1?=
 =?utf-8?B?ZnllT3hmK2Y1RytjWC81ZzNpVWl6c2xndk5QNnRIQVhBaEpiU0FPeVNUR1BE?=
 =?utf-8?B?RGtDekJXYkRhUmZrL1lidXJxUGNsYUs4TUlYQlV2aUVBNDVsWFArRzh6dGQw?=
 =?utf-8?B?cTZ5QzhWS2JnSnRVdUMwbE5Rb085TWx2azlocmZIb3llYkJlSUFSQnBna0Mx?=
 =?utf-8?B?Rjh5NUVWLytXcmNmdFB6c0Y3UFg1QWEza1F4OWhaUWszYXI0VnVIbW1rUEpB?=
 =?utf-8?B?VXgvd0UvRExtS0dKSmRKOHVhVlpXNVovWVBqQml5Uzc2Ulo4ZE5KM21ZaXdZ?=
 =?utf-8?B?ZzFpZnpoOE0ycUY5eFdkckFpR3RBdGJ4YjlUL2d2VDl3UW1Wa3RyczFXRWhu?=
 =?utf-8?B?VUw1UnEycXA0M1VpOHJZQW5Jdk9oSTZnY2xIZ2xDQlp0RmJXV3IveEh6SWVn?=
 =?utf-8?B?Yk5Md3cvckJ1a054RU1GbVAzUm9FMWlmVzMrSENwekVINmMxZnZVaVdvZDVm?=
 =?utf-8?B?R3hpTEp1SWxkSFo5U25YR2VIOVNEcElZa1F3TEd3WjlicE41QVV2Y2ZWTzBu?=
 =?utf-8?Q?MOJw5uvtPSGKtM0WfsdLYJ8sT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <452D93A72FBE334198CA83C91BF226B1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rvrRiwX9oB5vknDaRyPt8SHKzw+9HM51Xqsg76trERkmQ+p3Bmu51qD9p+RU0GBlGO7WKuSQxmsCnL7WYgKWHgBaxkOPEViFyJO84eebYuH4psGCOENA+WbaYnsyAX2L1LcEHSZSQSDGPH6GghXadhSTMOgAO0ZaVF0Rk7NEP5rRhrcb8ys/naxlSfkIoODuge0ufepFotwFRU3EB7bpx6n+Y4RfBZgQUA9Di65tFIovNVPpdianQftU4V8q/wNIGLNTg6G3sl6qRZbqcj6YDyBOYhkYG3tHocWN3SjwyIw1ATv+lVfIHZHNPrCYIEBBJ8k82DzAAKjJtTUJitYthDRijPrAMyzoSiskLa/dwdZ5wOu7RCCE8g2U/GsPQSNe5mODQ4uJayTysWZDxAETENc34PeuilvY2lTHuevv1D0pk6FbC5YYt+4S34oOFnnfNRvZD/q9R2//cOkgW8PKbxMdQjdg7mMrXZ87toeMGJ89YNaEhf3yYlNYYanlT9r+QfOZkzjDGgMl3JVlQQnuv0JvP6uoBeHiWajizzbFkea3IGzguGk8aREOAjyK83XKq6tc4Na6Qu+dIoZLxj5BWHGiUxYWm3ZAIejFKFdC+PJNyuK0/Co4Fp0EiXKTDxE3O2/oBdGwkQ3NDRdZG2KMQQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72aecb1a-efde-41cb-7b1e-08dd763b4393
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 01:18:26.5298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HedlTTpzm1IrDiXICoJMyHxv8FWGwZw8njy450iee3usxp/tjmp6AcmDMh/L0fD0eklNVkp0c57UCKlJfg0EHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9023
X-Proofpoint-ORIG-GUID: 4WO7gWkdy5W7tzOW0V5HdCFMDM1qHlkW
X-Authority-Analysis: v=2.4 cv=XIAwSRhE c=1 sm=1 tr=0 ts=67f4796d cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cIFrHgAuMenwNpB8opMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 4WO7gWkdy5W7tzOW0V5HdCFMDM1qHlkW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_07,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 clxscore=1015 mlxlogscore=890 lowpriorityscore=0 bulkscore=0
 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504080007

T24gVGh1LCBBcHIgMDMsIDIwMjUsIFByYXNoYW50aCBLIHdyb3RlOg0KPiBDdXJyZW50bHkgd2hl
biB0aGUgaG9zdCBzZW5kcyBHRVRfU1RBVFVTIHJlcXVlc3QgZm9yIGFuIGludGVyZmFjZSwNCj4g
d2UgdXNlIGdldF9zdGF0dXMgY2FsbGJhY2tzIHRvIHNldC9jbGVhciByZW1vdGUgd2FrZXVwIGNh
cGFiaWxpdHkNCj4gb2YgdGhhdCBpbnRlcmZhY2UuIEFuZCBpZiBnZXRfc3RhdHVzIGNhbGxiYWNr
IGlzbid0IHByZXNlbnQgZm9yDQo+IHRoYXQgaW50ZXJmYWNlLCB0aGVuIHdlIGFzc3VtZSBpdHMg
cmVtb3RlIHdha2V1cCBjYXBhYmlsaXR5IGJhc2VkDQo+IG9uIGJtQXR0cmlidXRlcy4NCj4gDQo+
IE5vdyBjb25zaWRlciBhIHNjZW5hcmlvLCB3aGVyZSB3ZSBoYXZlIGEgVVNCIGNvbmZpZ3VyYXRp
b24gd2l0aA0KPiBtdWx0aXBsZSBpbnRlcmZhY2VzIChzYXkgRUNNICsgQURCKSwgaGVyZSBFQ00g
aXMgcmVtb3RlIHdha2V1cA0KPiBjYXBhYmxlIGFuZCBhcyBvZiBub3cgQURCIGlzbid0LiBBbmQg
Ym1BdHRyaWJ1dGVzIHdpbGwgaW5kaWNhdGUNCj4gdGhlIGRldmljZSBhcyB3YWtldXAgY2FwYWJs
ZS4gV2l0aCB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiwNCj4gd2hlbiBob3N0IHNlbmRzIEdF
VF9TVEFUVVMgcmVxdWVzdCBmb3IgYm90aCBpbnRlcmZhY2VzLCB3ZSB3aWxsDQo+IHNldCBGVU5D
X1JXX0NBUCBmb3IgYm90aC4gVGhpcyByZXN1bHRzIGluIFVTQjMgQ1YgQ2hhcHRlciA5LjE1DQo+
IChGdW5jdGlvbiBSZW1vdGUgV2FrZXVwIFRlc3QpIGZhaWx1cmVzIGFzIGhvc3QgZXhwZWN0cyBy
ZW1vdGUNCj4gd2FrZXVwIGZyb20gYm90aCBpbnRlcmZhY2VzLg0KPiANCj4gVGhlIGFib3ZlIHNj
ZW5hcmlvIGlzIGp1c3QgYW4gZXhhbXBsZSwgYW5kIHRoZSBmYWlsdXJlIGNhbiBiZQ0KPiBvYnNl
cnZlZCBpZiB3ZSB1c2UgY29uZmlndXJhdGlvbiB3aXRoIGFueSBpbnRlcmZhY2UgZXhjZXB0IEVD
TS4NCj4gSGVuY2UgYXZvaWQgY29uZmlndXJpbmcgcmVtb3RlIHdha2V1cCBjYXBhYmlsaXR5IGZy
b20gY29tcG9zaXRlDQo+IGRyaXZlciBiYXNlZCBvbiBibUF0dHJpYnV0ZXMsIGluc3RlYWQgdXNl
IGdldF9zdGF0dXMgY2FsbGJhY2tzDQo+IGFuZCBsZXQgdGhlIGZ1bmN0aW9uIGRyaXZlcnMgZGVj
aWRlIHRoaXMuDQo+IA0KPiBDYzogc3RhYmxlQGtlcm5lbC5vcmcNCj4gRml4ZXM6IDQ4MWMyMjVj
NDgwMiAoInVzYjogZ2FkZ2V0OiBIYW5kbGUgZnVuY3Rpb24gc3VzcGVuZCBmZWF0dXJlIHNlbGVj
dG9yIikNCj4gU2lnbmVkLW9mZi1ieTogUHJhc2hhbnRoIEsgPHByYXNoYW50aC5rQG9zcy5xdWFs
Y29tbS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZ2FkZ2V0L2NvbXBvc2l0ZS5jIHwgMTIg
KysrKy0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdldC9jb21wb3NpdGUu
YyBiL2RyaXZlcnMvdXNiL2dhZGdldC9jb21wb3NpdGUuYw0KPiBpbmRleCA4NjlhZDk5YWZiNDgu
LjVjNmRhMzYwZTk1YiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0L2NvbXBvc2l0
ZS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2dhZGdldC9jb21wb3NpdGUuYw0KPiBAQCAtMjAxMCwx
NiArMjAxMCwxMiBAQCBjb21wb3NpdGVfc2V0dXAoc3RydWN0IHVzYl9nYWRnZXQgKmdhZGdldCwg
Y29uc3Qgc3RydWN0IHVzYl9jdHJscmVxdWVzdCAqY3RybCkNCj4gIAkJCWJyZWFrOw0KPiAgDQo+
ICAJCWlmIChmLT5nZXRfc3RhdHVzKSB7DQo+IC0JCQlzdGF0dXMgPSBmLT5nZXRfc3RhdHVzKGYp
Ow0KPiArCQkJLyogaWYgRDUgaXMgbm90IHNldCwgdGhlbiBkZXZpY2UgaXMgbm90IHdha2V1cCBj
YXBhYmxlICovDQo+ICsJCQlpZiAoZi0+Y29uZmlnLT5ibUF0dHJpYnV0ZXMgJiBVU0JfQ09ORklH
X0FUVF9XQUtFVVApDQoNCldlIHNob3VsZCBhbGxvdyBmdW5jdGlvbiB0byBleGVjdXRlIGdldF9z
dGF0dXMgcmVnYXJkbGVzcyBvZg0KVVNCX0NPTkZJR19BVFRfV0FLRVVQLiBUaGVyZSBhcmUgb3Ro
ZXIgc3RhdHVzIGJlc2lkZSB3YWtldXAuDQoNCj4gKwkJCQlzdGF0dXMgPSBmLT5nZXRfc3RhdHVz
KGYpOw0KPiArDQo+ICAJCQlpZiAoc3RhdHVzIDwgMCkNCj4gIAkJCQlicmVhazsNCj4gLQkJfSBl
bHNlIHsNCj4gLQkJCS8qIFNldCBEMCBhbmQgRDEgYml0cyBiYXNlZCBvbiBmdW5jIHdha2V1cCBj
YXBhYmlsaXR5ICovDQo+IC0JCQlpZiAoZi0+Y29uZmlnLT5ibUF0dHJpYnV0ZXMgJiBVU0JfQ09O
RklHX0FUVF9XQUtFVVApIHsNCj4gLQkJCQlzdGF0dXMgfD0gVVNCX0lOVFJGX1NUQVRfRlVOQ19S
V19DQVA7DQoNCg0KU28gcmlnaHQgbm93IHdlJ3JlIG5vdCBhYmxlIHRvIGNvbmZpZ3VyZSB0aGUg
ZnVuY3Rpb24gdG8gZW5hYmxlIFJXDQpjYXBhYmxlPyBQZXJoYXBzIHdlIG5lZWQgdG8gdXBkYXRl
IHRoZSBjb21wb3NpdGUgY29uZmlnZnMgZm9yIHRoaXM/DQoNCkJSLA0KVGhpbmgNCg0KPiAtCQkJ
CWlmIChmLT5mdW5jX3dha2V1cF9hcm1lZCkNCj4gLQkJCQkJc3RhdHVzIHw9IFVTQl9JTlRSRl9T
VEFUX0ZVTkNfUlc7DQo+IC0JCQl9DQo+ICAJCX0NCj4gIA0KPiAgCQlwdXRfdW5hbGlnbmVkX2xl
MTYoc3RhdHVzICYgMHgwMDAwZmZmZiwgcmVxLT5idWYpOw0KPiAtLSANCj4gMi4yNS4xDQo+IA==
