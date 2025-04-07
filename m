Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9CC1547C9;
	Mon,  7 Apr 2025 23:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744069169; cv=fail; b=FoEQOXKGxm+txd9rtoSBLGCC73151CBB4S5eW86QaTC8VuM1ccorgaLBrvZAw2y38fw30nztwo4lIHYIiMhs8lDycwiIK1nQ44/hMbvkjsAe4m7/WTZ8x0kP4YeqEU+fP08j3m4EtxuGCbUdlaRQAAeQXrtKDuR+e2wAXTEAvf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744069169; c=relaxed/simple;
	bh=alV9aRA4U5AULbzMBej/crcfTdlB6+jAX8Z+5ZCMDJU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PeEe1ghqU5GGULEwkw3vVZqixtuu/TUxBUGD5Lw1Ks9ebSbBxUAGijb9KhVeBueDpOOEqC+aryZvOZcVp+zbxpVm3aUrepbkpwE1gx8FaqpxPDBm50gtftQNMOwL6PXX0jf7bltW9vA9Q2ZueXcayVTdAPgUnCiYg2RTOO9RfG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=c6aMUgW+; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=IzSPvj3G; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=tDUw5Gz2 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="c6aMUgW+";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="IzSPvj3G";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="tDUw5Gz2"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537NbigG015344;
	Mon, 7 Apr 2025 16:38:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=alV9aRA4U5AULbzMBej/crcfTdlB6+jAX8Z+5ZCMDJU=; b=
	c6aMUgW+QasShvB703Bzigu7mYNNUZ/ACD4TJCMVd7c4Fxv58NkawG9xqqlxMqOa
	eux2fO6OSB9rrRkl83Gv/mNgt44rwmH5nz0yxlWjMF+ozB/V1jCA6eWi32T1hDjW
	BGmNDKwojB6BeU4JDIAj8p9zHAExOvxdGgnnEs5kG/I75EeDmWQhrVndKGmKXP1d
	liRM8h3EjhRKvvDIhM9b8X6zJRUF1FEWV7ftIkB6W3VFttda4+maNN5GIGgRlBal
	e3P5V8GNAI9shVXOgm5cq6tgm5XjHGyoKw706Rbdh4uynXbdrV0AbRRk02qTPp7S
	277m8UyKmOXi8n+BGfmoZA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 45u3hp6xvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 16:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1744069119; bh=alV9aRA4U5AULbzMBej/crcfTdlB6+jAX8Z+5ZCMDJU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=IzSPvj3GWeUDWiuJRzyHnjGXgiga7vlAYbdl67tIi9ShYZPO/Vd1pgeOoqVNb1IrB
	 XJuSthvLiTgl9rjfOM5z+aZmc2HSjmDy3jgHO2FVvKx4lTjy032XLlvn33cHrlt3Ei
	 NYKVa3ksL/WilyUHq97y7MjnSEOESpo7PtCoXxdl920c378B6MRGM3B0pKW5f3EBY8
	 pj3qWroBz1yHfN+4mU8N4MquG3MHr+QtDs+pluaLYLVMnPpUjCKdZx8l6BiOLukmG+
	 rw1l3bKG/9Vs9JkVdMTc6FsddJNPSCCx8OJyXB01Sbf83gAvYFJuIySRBS6+jvFg9M
	 37z5tVaQUX1fQ==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A525740994;
	Mon,  7 Apr 2025 23:38:38 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id DAF57A0071;
	Mon,  7 Apr 2025 23:38:32 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=tDUw5Gz2;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2D7A940567;
	Mon,  7 Apr 2025 23:38:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCKC/p6mnmAZaQsM1klug4jMq+JKIQSLV/a8RCF3bjQWO6b0TEV2sKt+kWAHpmxBtk2ANA0qNOQuTFrgOh+GWuXYip0hvLR2pfkk/HF4navBnAarnIV5Sfun6x8pRGMTpSKxoeo6DYOCzD8bsZ1OmS1F+ktzv1J0IDiYfqeTk9/KCfX0pJhJN4Rotjhgrz+iOui9OlF0qAHghig28lBPsZqloxvHSQDvvNGmlPMjmMcT5pgg/vtlNjbOw/r1byUbaA6dsmc/CPG42vGxVtxgQktQjPKRdBzak3nNoMs2X6d7+Dl5EAk/N4MvJN802ORW7DiYM8Rwj1NRQSZ79Som4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alV9aRA4U5AULbzMBej/crcfTdlB6+jAX8Z+5ZCMDJU=;
 b=PbowwRFxP3sUc5PzkhkxG2JN6KlsfsGaStR2nSPBzmLjX/np781kOnHLiT9UL+XzSmNnrqYucWZxy20STwX6rIo0jHtxdkutabgECRFW0e56UC/1vLH+S+ISXh7/w7k4aCeVUbvf+Xd6GnB3lbUh+w5Fbl6M4U72vyPqQ8zsc/y1CShLbAX9ZLq8qBJosAQdyLLJ+nJ2p4NXraHmgBc46KV+xPEmmKwB2ghyY7FITww9Ee9s+LvaDcqr1MMYhnuEfpU/G4lUkdYqp9UoBCSkb8etbe9QcptC9GRM68ERIbVp/+MK6HIJymaAqmsFn1dmTOoi34kmERlVyWpFJ7RUmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alV9aRA4U5AULbzMBej/crcfTdlB6+jAX8Z+5ZCMDJU=;
 b=tDUw5Gz2T8b1EWHtDqDrUB4BsPPmZJ9IFdM5VCdgiLvBqSzZwfdajH4++2slS6r3/E6AZUBw9cod0CljYCdyBRzXAmwJ2KY3AMYDazD/muqHRs2C1u4/jmEqaYiZPm2MP26NakoCtNVk5il8n1wFIHXsclfdJgEG/XuMwGaH5bs=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DM3PR12MB9391.namprd12.prod.outlook.com (2603:10b6:0:3d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 23:38:28 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 23:38:28 +0000
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
Subject: Re: [PATCH v1 3/3] usb: dwc3: gadget: Make gadget_wakeup asynchronous
Thread-Topic: [PATCH v1 3/3] usb: dwc3: gadget: Make gadget_wakeup
 asynchronous
Thread-Index: AQHbpIi7c9+1pUhKXE+zN5SY3VBPMrOY4xyA
Date: Mon, 7 Apr 2025 23:38:28 +0000
Message-ID: <20250407233757.jmtohzgm4xebjndn@synopsys.com>
References: <20250403110805.865311-1-prashanth.k@oss.qualcomm.com>
 <20250403110805.865311-4-prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250403110805.865311-4-prashanth.k@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DM3PR12MB9391:EE_
x-ms-office365-filtering-correlation-id: 83dace19-46bd-4ee2-2699-08dd762d4ca1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WU93dFh0TzJ6N09JZWpuaFA5R09TelVGeG9ZLzJsTmdST0lQalBRR2FKTyth?=
 =?utf-8?B?bnlWQVJxVTdVL2o4WktxNE9rMmZRN0cwODVHNFZxbytsU1pyTXA1Q1Z1eVdh?=
 =?utf-8?B?bGJvTVdPd3BYQkxzQURUVW9pcjNqRk91S3ZBNFZlNVZvSGpBYy84ZE1HVWJo?=
 =?utf-8?B?Y2dTMFMvQ1NJM0RDZWxpOEl0TkExOVB4WW11N3JaTDcxNmJsSDU4SCtlOXF0?=
 =?utf-8?B?elhjRTN6L3dmQjdQT29YdDdkN1RkNnJpcHZmcVhUOGZ1RnQrS2hhaXRrTWhK?=
 =?utf-8?B?alVVSnl0RXlPVEVseGNuK2VqOVpzbTl0d3RqdHhEWmVvU3RoT3R6NmdQUE1t?=
 =?utf-8?B?STRVMXhicTlmenFnU3Z2cU5hd2V2L3hlczNsQkdlV3VyR3Q4dG5lS3U0L0pX?=
 =?utf-8?B?d2ZNcG1LWkFQU1g3N0JUZE9iVUJRbHBSTGU2VGlKTG5xeW5BdmZ1cTA2ZnZ5?=
 =?utf-8?B?WDZHMnoydVJUdy9vUU55QVl3OE1vN29LdDZvTXAvWEtOVWZ0ME1SdWU5SDla?=
 =?utf-8?B?ZWxpbUNDcDNFOFNVYjNMOUNlMy8rMHplMGQrWmNpNEhzZXhIUzU5UEZiakdF?=
 =?utf-8?B?amlrWUdtU0cvVUZmVEMvN09wcUtTMEhTVHdLRUZTOGViUDdQek9EQnZzSXdY?=
 =?utf-8?B?K3RmcjV4TnowVUhiOTF4aG8yakhRcUM5aDVvYkduNW9WOWVqS1ZWS3JFUWtV?=
 =?utf-8?B?YlA3Nk5GNTFaRm9abVJma1ROMUxNRHM4VG5HUUpaQkZZZitOZDVwMUVaWU4x?=
 =?utf-8?B?VnI3UVRDUGI4c0pocngyNE9jK3QyU0hnSXpaQ1o4elRwZDFLLy9ZSVVOUEU3?=
 =?utf-8?B?cW1BZEJySzlvV2xkM0ZvL1BqQWpVL2hEVVFtQnBHRHJkVTdCZlhjN244OGZO?=
 =?utf-8?B?Q2ZpZFFHcGdSdG5ob2d5elJqUE1vNjUyd0lPVnlEbk1PUFFzd1JnVTUybTdj?=
 =?utf-8?B?OEdEa2IxRTVaREFISzNNSnZQQ24vUFFqYXM1SjNoMllzeVJLcWc3eHhPSUJZ?=
 =?utf-8?B?Q0gxckxHNmZkMEcyUHB2SmVjdDFkRWg0Vm1yRUdFb0NRZDR4Njl3Q3R1d0l6?=
 =?utf-8?B?SDNYZ000TmpZZU5Nc0VUOWhQc3NoZmhKNlQ0T2hpUHlWR3dLbWE3dUlENzZj?=
 =?utf-8?B?VFFPdnFtZjViQ3YyZk5ORElSaGZOb1NiZVlnbTR3TUptZnhhNGFpZTIxbmcr?=
 =?utf-8?B?ZDFyaE9zc2s0dlhNVkRJbTB2TjhsRFRmY3p4ZFM2NkJhQkh4L1RId2lmazlk?=
 =?utf-8?B?ZU92R3hsaFZUN2w5cVZpU0poN25EQlAwK2xlbSttSnN4MG1oNGY3UnMvUkNB?=
 =?utf-8?B?aWhGUEdadndWWisyaWhEWXZKV1BQN251eTVNRi9aN3FYL1NFTU5xTmdnOStI?=
 =?utf-8?B?TVBwVzdDU2pvckw3TmlCRTFVWU40aDVDMWJKRmlIaGZDMmttMk1nRVI3Z21V?=
 =?utf-8?B?Zk5HS0RzY1dUNFJnd2cwU0FvU2UzL3Zka0g1eU1qK1MrM0RCS3E0emJqczN2?=
 =?utf-8?B?NjZ2TnBEYWNuWmY5dk9NSTJGaUZUcGs4UmRCSUszTTUzNzFXMlJDdTNIREFT?=
 =?utf-8?B?RStOOWJDc01hQ1dNMEMwSmQzT0R1ZVBVRlJOMlR1ZmdnWmN0RnB4bjYrdnZS?=
 =?utf-8?B?UHZqUkRqRVBjTHRtZkxCMnFTQ1VMZDkzL0VuQzI1R1RIb0tXK3kvajZyTTRk?=
 =?utf-8?B?cVl2MUQ2cmdBZWRNWjVJa25FNDVYYUxBa2VaZVBLaDRVV0ZQS1RTMVJiUVpX?=
 =?utf-8?B?eStaeHJhVFlWck5UV2hqaWZqMzlVNUhpc0xKbXVyVG54TjBjZkdVRVI0L290?=
 =?utf-8?B?L21pbmlXWEdOQ2cxSlpnREpGVmZ3dFFtLzZaTXA5d08ydzJ2TjB5VkRmZ3FH?=
 =?utf-8?B?R25KUnpWL3dZeENXK2Vvam1kd0VkVElwSDRhL3NGTFM2TlZRNkE3ZC9QM0FB?=
 =?utf-8?Q?lBWgyhi92Jq45dHazd9+beVDaXHhqAmv?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VElTWG5hcXJIUGNFMzdRbmR3NTJZeEQ0d1BBVVBrV0tpb2QyZDBUNmZ6YTRi?=
 =?utf-8?B?MlVhWDlYMXh3WUtQMm9KMlVSYTJJcXE5L2Q2STVXOFk2Q2hBRHdabWdnWjRh?=
 =?utf-8?B?TzJpVDBIcjJJU00xVURxVi81WXVIK1U0QUVIanZManNMZzBqbDlVQ1JOZ1RO?=
 =?utf-8?B?TWZGNk5mM0JSaklnMHJYWjRNbzh4eFR6RWwxYWFBNEVZejdtZUhHSmdpcUhG?=
 =?utf-8?B?LzlBYzBFSmJvK2VVNGFpa2lha21qWEFIczlXZEJNM2dBTHd2ZXRTYW9lMklv?=
 =?utf-8?B?aVNGV2U2TGphamFFaHVOMVRIZDZBZHJjWEZZMGJ2UWpVUGJrTjVPd2VsT2Jj?=
 =?utf-8?B?QTdNQUFJUHdDbjZtYnQ4WlZIWEZ4dEFKUFhxNC96aVhOczJoZlhQZHRiS3cx?=
 =?utf-8?B?TkhVZDFHZ2o5SHM5aklicE85OTNDeUdzMm5nUEZlbzQ4L0hlZXB0b2tvSjV3?=
 =?utf-8?B?NENRbVhBd1hPQ1VaeVF0NnRmLzEvenBhenZ5K2Zlc0ZpcW55NUFDT09NeHJL?=
 =?utf-8?B?QnE5NGIrM2lWelZpQjNlaTNQWE5aaGZBQ0pOQ0h2VFU2OW1FczhFV3pPNHhN?=
 =?utf-8?B?Q3pHamhiNldjZWpQcXRwSXZDQWhsSGN3V1g4S0hlNHcvMWF0V2NITVVsVWFu?=
 =?utf-8?B?SXByc0tpYWo1NS9KUjA3aXFlREpFUW5FZ1pnVWs3TGVEUExFb0VaZ0Z4RlNT?=
 =?utf-8?B?a3hCRExPakxDazBNdVFyRHQxek85MXFNVDV2QytDVzhFQTdhdTBYRzI0YW9i?=
 =?utf-8?B?NVVNS0JTNFlsVkhONlgzQklnL0pkUVBranVGT3ZhdmVWb2l3a01rM1h4QlpP?=
 =?utf-8?B?a05BYkl1UVVOZUpHV3Y2TUF3MGFpeFBMdmh5cFUzb090TXE3SnZWcFBUak1v?=
 =?utf-8?B?dWZ0SmhDOTM2MXp3MlZvMUtYb21WSjZaMVlaeXc4WW56R0FGblFBMUlRVU1y?=
 =?utf-8?B?SjQwY21sdkd6SE5QcERlQjZaMVorcmZYR25FMkprMlovTzZxMWVIdEE2elli?=
 =?utf-8?B?RkNIN3c2WHFpUzVmcllQNm81WTRNM2ppdXJ3M1Z0c09JaG1yOFpFTlpQaW5Z?=
 =?utf-8?B?WXNzamdEV3puNktsK0N5UXZGbFRaRzhQbUlneHdxTHQ5dmhsVFJaRkx0R0lL?=
 =?utf-8?B?Y2xaaW1FZXJYU0ZFcDRSQjFrQkdpT2NQU2U1T0VOZjFNL3ZhbWFtRm5URVVJ?=
 =?utf-8?B?bGs4TDNPeHNZWmhNY2ljY0kzb0ZSV1hZRFpCVjNCZVJkSU5KbXZLZTJKL3Iw?=
 =?utf-8?B?eE1NanBYZlR2T2JxNGZHVFhrdmMzQTd1QVRSbDJ6cnlFRURqNnlqeU5PQnAx?=
 =?utf-8?B?UTIrQ05yRXAraDgrMG1RVTZFSU0zS1dOTzJndVdKT1VidnZWWENXK3hnQlRY?=
 =?utf-8?B?NGpJN3FmUjU5S2I5VjVyQ0F0dzJXZHhjNTFzSHFKY01EZU0rNmg1aEV1WXZx?=
 =?utf-8?B?TWJjQUx5Rm9QQnEySGtKNkp0ZUx0TGhSU1Nha3ZzSGl0YkFwNXYzczJ4L2Vy?=
 =?utf-8?B?REJZRlFCeFdGK3VzQi9MSWxCOFhPMzFjN0w0Qlk3T0tEdFNuVlRIK01HZmdI?=
 =?utf-8?B?OUFaSFppMTJFNlEwcWVKRkVud3AweFFoZDlMQTBpY3ZKRnEvbWQvc1lqOFJE?=
 =?utf-8?B?S3IxZ2ZxWUJ4SnQyOFcyc2VRUGg0YW1BcHBaVzcvYzJMQXdiaFFsUUhrU2tY?=
 =?utf-8?B?MHc3a3Y1WVIzR1d3dkM4L1NBeGhiUkVPU2cxemtPZUg0YVlOTWpnaWRqcWZo?=
 =?utf-8?B?aDlVRW1MR3FNZHplUlM4VmtjZ0J0NDc0YUg5WXFJNGlBOWFoK0Y4MnlXOEJm?=
 =?utf-8?B?RjU1M0hxK3NvSVNhMEQvUHl4c0cvSXlzZU52anVlaWdreVdJVXJqTmZVWXJt?=
 =?utf-8?B?dWFURXY2YjRZWXRXY2R0S0Uwb0wvSmRYbHdTYWRXc1NBU3FEV25hNXlodWIr?=
 =?utf-8?B?WXRJL1lKeU8yNmRKT2xtN21RaU1QTXBJbUU4a0dHa1piNmlVK2tET2k3UFZ4?=
 =?utf-8?B?ZVlpUmluWGJOOUFkVUt1SS9QWHNDdDRTandmMHNPUC90eW5pK2NFeGNJUEJH?=
 =?utf-8?B?Q3FkVVRYZzhJaDhKZ3lqcGFnVDYwQWtzeEErYWxVSzRUK2JCbENMczlTV3hM?=
 =?utf-8?Q?/j489PVEOP35Tnawp2Vf2RUUb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B795BA5161A5E40855BC1B3D2B3769E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5I/BxM8Z1XMM5mi0gPHvbwg2WNxBs22fu6r4vtMdX/LChZ6Lfi4SGb9EA3TdG3p5h5rAHSi/pBbF/5WlULZyIjETYgi4MWKbSrWKq1Fvn5clWzTQ6c7a67T3p5I6KSW5d85VFyRHdlNYe2X2jMKK1hnxXmwt9E5FGAjQ4UGcUct+1RRCg884wXgujrzoqbsctuauo3kwzZ1bO1iJNfIDpZCiueKS1UNDVMDHpwohWtGmdW4SWxCvZ5MoBwihO2aN9sTn7OEj86qHgQ55+3gr295LCd7H/WsskG32PMAucmPkQ+RsDEGURW+sOVeUIPB4A+c91DTF1Qz/umJthKQA33TsIHZNAjhdHbiGQB6IVZF/0MzcfcZbmlc+CNEOxyhekvWRzAkGkm/czPhNQ5mVOdmSkvJjXKnI1XvxMPhVmfjuwfn2f/j4SsrKfuzg6l1uT2ttHREAgFDA10UPw3c7VB7dliuhDufMziFrTMb4GJ/Zua20EEo/2LVdE20J8WfWKYbYI7JHRGaiqpnS0Ym3fXJIFyr6oMwkcJAzU85IYIdNJgGRNQTawhNPmtmZPYLlYX6Aqamu+8S0r4K6nGH5dshHj3GXvX/Vi1urYHyI8paxP+30u+hR63hM1twMXUoi1X2XFq/yel1QPfy8PPGZ+w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83dace19-46bd-4ee2-2699-08dd762d4ca1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 23:38:28.7210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ERN0ZJIO9GOdZLqe5cCOBTeSGwJ99BFJXR3X5g+jN5Syjhok+Qa0ejUTTmEOW9+veJahmfpsP3OTpVU3FCk7AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9391
X-Proofpoint-ORIG-GUID: hOs3RLINsc65tahNqGqJDIvVGde_mXxM
X-Authority-Analysis: v=2.4 cv=XIAwSRhE c=1 sm=1 tr=0 ts=67f461ff cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GezzySmmNLRbnF6d3BMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: hOs3RLINsc65tahNqGqJDIvVGde_mXxM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_07,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 clxscore=1011 mlxlogscore=889 lowpriorityscore=0 bulkscore=0
 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504070166

T24gVGh1LCBBcHIgMDMsIDIwMjUsIFByYXNoYW50aCBLIHdyb3RlOg0KPiBDdXJyZW50bHkgZ2Fk
Z2V0X3dha2V1cCgpIHdhaXRzIGZvciBVMCBzeW5jaHJvbm91c2x5IGlmIGl0IHdhcw0KPiBjYWxs
ZWQgZnJvbSBmdW5jX3dha2V1cCgpLCB0aGlzIGlzIGJlY2F1c2Ugd2UgbmVlZCB0byBzZW5kIHRo
ZQ0KPiBmdW5jdGlvbiB3YWtldXAgY29tbWFuZCBzb29uIGFmdGVyIHRoZSBsaW5rIGlzIGFjdGl2
ZS4gQW5kIHRoZQ0KPiBjYWxsIGlzIG1hZGUgc3luY2hyb25vdXMgYnkgcG9sbGluZyBEU1RTIGNv
bnRpbnVvc2x5IGZvciAyMDAwMA0KPiB0aW1lcyBpbiBfX2R3YzNfZ2FkZ2V0X3dha2V1cCgpLiBC
dXQgaXQgb2JzZXJ2ZWQgdGhhdCBzb21ldGltZXMNCj4gdGhlIGxpbmsgaXMgbm90IGFjdGl2ZSBl
dmVuIGFmdGVyIHBvbGxpbmcgMjBLIHRpbWVzLCBsZWFkaW5nIHRvDQo+IHJlbW90ZSB3YWtldXAg
ZmFpbHVyZXMuIEFkZGluZyBhIHNtYWxsIGRlbGF5IGJldHdlZW4gZWFjaCBwb2xsDQo+IGhlbHBz
LCBidXQgdGhhdCB3b24ndCBndWFyYW50ZWUgcmVzb2x1dGlvbiBpbiBmdXR1cmUuIEhlbmNlIG1h
a2UNCj4gdGhlIGdhZGdldF93YWtldXAgY29tcGxldGVseSBhc3luY2hyb25vdXMuDQo+IA0KPiBT
aW5jZSBtdWx0aXBsZSBpbnRlcmZhY2VzIGNhbiBpc3N1ZSBhIGZ1bmN0aW9uIHdha2V1cCBhdCBv
bmNlLA0KPiBhZGQgYSBuZXcgdmFyaWFibGUgZnVuY193YWtldXBfcGVuZGluZyB3aGljaCB3aWxs
IGluZGljYXRlIHRoZQ0KPiBmdW5jdGlvbnMgdGhhdCBoYXMgaXNzdWVkIGZ1bmNfd2FrdXAsIHRo
aXMgaXMgcmVwcmVzZW50ZWQgaW4gYQ0KPiBiaXRtYXAgZm9ybWF0LiBJZiB0aGUgbGluayBpcyBp
biBVMywgZHdjM19nYWRnZXRfZnVuY193YWtldXAoKQ0KPiB3aWxsIHNldCB0aGUgYml0IGNvcnJl
c3BvbmRpbmcgdG8gaW50ZXJmYWNlX2lkIGFuZCBiYWlsIG91dC4NCj4gT25jZSBsaW5rIGNvbWVz
IGJhY2sgdG8gVTAsIGxpbmtzdHNfY2hhbmdlIGlycSBpcyB0cmlnZ2VyZWQsDQo+IHdoZXJlIHRo
ZSBmdW5jdGlvbiB3YWtldXAgY29tbWFuZCBpcyBzZW50IGJhc2VkIG9uIGJpdG1hcC4NCj4gDQo+
IENjOiBzdGFibGVAa2VybmVsLm9yZw0KPiBGaXhlczogOTJjMDhhODRiNTNlICgidXNiOiBkd2Mz
OiBBZGQgZnVuY3Rpb24gc3VzcGVuZCBhbmQgZnVuY3Rpb24gd2FrZXVwIHN1cHBvcnQiKQ0KPiBT
aWduZWQtb2ZmLWJ5OiBQcmFzaGFudGggSyA8cHJhc2hhbnRoLmtAb3NzLnF1YWxjb21tLmNvbT4N
Cj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCAgIHwgIDQgKysrDQo+ICBkcml2ZXJz
L3VzYi9kd2MzL2dhZGdldC5jIHwgNjAgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oIGIvZHJpdmVy
cy91c2IvZHdjMy9jb3JlLmgNCj4gaW5kZXggYWFhMzllNjYzZjYwLi4yY2RiYmQzMjM2ZDcgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+ICsrKyBiL2RyaXZlcnMvdXNi
L2R3YzMvY29yZS5oDQo+IEBAIC0xMTY0LDYgKzExNjQsOSBAQCBzdHJ1Y3QgZHdjM19zY3JhdGNo
cGFkX2FycmF5IHsNCj4gICAqIEBnc2J1c2NmZzBfcmVxaW5mbzogc3RvcmUgR1NCVVNDRkcwLkRB
VFJEUkVRSU5GTywgREVTUkRSRVFJTkZPLA0KPiAgICoJCSAgICAgICBEQVRXUlJFUUlORk8sIGFu
ZCBERVNXUlJFUUlORk8gdmFsdWUgcGFzc2VkIGZyb20NCj4gICAqCQkgICAgICAgZ2x1ZSBkcml2
ZXIuDQo+ICsgKiBAZnVuY193YWtldXBfcGVuZGluZzogSW5kaWNhdGVzIHdoZXRoZXIgYW55IGlu
dGVyZmFjZSBoYXMgcmVxdWVzdGVkIGZvcg0KPiArICoJCQkgZnVuY3Rpb24gd2FrZXVwLiBBbHNv
IHJlcHJlc2VudHMgdGhlIGludGVyZmFjZV9pZA0KPiArICoJCQkgdXNpbmcgYml0bWFwLg0KPiAg
ICovDQo+ICBzdHJ1Y3QgZHdjMyB7DQo+ICAJc3RydWN0IHdvcmtfc3RydWN0CWRyZF93b3JrOw0K
PiBAQCAtMTM5NCw2ICsxMzk3LDcgQEAgc3RydWN0IGR3YzMgew0KPiAgCWludAkJCW51bV9lcF9y
ZXNpemVkOw0KPiAgCXN0cnVjdCBkZW50cnkJCSpkZWJ1Z19yb290Ow0KPiAgCXUzMgkJCWdzYnVz
Y2ZnMF9yZXFpbmZvOw0KPiArCXUzMgkJCWZ1bmNfd2FrZXVwX3BlbmRpbmc7DQoNCkNhbiB3ZSBy
ZW5hbWUgdGhpcyB0byB3YWtldXBfcGVuZGluZ19mdW5jcyB0byBub3QgYmUgbWl4ZWQgd2l0aCBi
aXRtYXANCnZzIGJvb2xlYW4/DQoNCj4gIH07DQo+ICANCj4gICNkZWZpbmUgSU5DUlhfQlVSU1Rf
TU9ERSAwDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIGIvZHJpdmVy
cy91c2IvZHdjMy9nYWRnZXQuYw0KPiBpbmRleCA4OWE0ZGM4ZWJmOTQuLjMyODllNTc0NzFmNCAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiArKysgYi9kcml2ZXJz
L3VzYi9kd2MzL2dhZGdldC5jDQo+IEBAIC0yNzYsOCArMjc2LDYgQEAgaW50IGR3YzNfc2VuZF9n
YWRnZXRfZ2VuZXJpY19jb21tYW5kKHN0cnVjdCBkd2MzICpkd2MsIHVuc2lnbmVkIGludCBjbWQs
DQo+ICAJcmV0dXJuIHJldDsNCj4gIH0NCj4gIA0KPiAtc3RhdGljIGludCBfX2R3YzNfZ2FkZ2V0
X3dha2V1cChzdHJ1Y3QgZHdjMyAqZHdjLCBib29sIGFzeW5jKTsNCj4gLQ0KPiAgLyoqDQo+ICAg
KiBkd2MzX3NlbmRfZ2FkZ2V0X2VwX2NtZCAtIGlzc3VlIGFuIGVuZHBvaW50IGNvbW1hbmQNCj4g
ICAqIEBkZXA6IHRoZSBlbmRwb2ludCB0byB3aGljaCB0aGUgY29tbWFuZCBpcyBnb2luZyB0byBi
ZSBpc3N1ZWQNCj4gQEAgLTIzNTEsMTAgKzIzNDksOCBAQCBzdGF0aWMgaW50IGR3YzNfZ2FkZ2V0
X2dldF9mcmFtZShzdHJ1Y3QgdXNiX2dhZGdldCAqZykNCj4gIAlyZXR1cm4gX19kd2MzX2dhZGdl
dF9nZXRfZnJhbWUoZHdjKTsNCj4gIH0NCj4gIA0KPiAtc3RhdGljIGludCBfX2R3YzNfZ2FkZ2V0
X3dha2V1cChzdHJ1Y3QgZHdjMyAqZHdjLCBib29sIGFzeW5jKQ0KPiArc3RhdGljIGludCBfX2R3
YzNfZ2FkZ2V0X3dha2V1cChzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiAgew0KPiAtCWludAkJCXJldHJp
ZXM7DQo+IC0NCj4gIAlpbnQJCQlyZXQ7DQo+ICAJdTMyCQkJcmVnOw0KPiAgDQo+IEBAIC0yMzgy
LDggKzIzNzgsNyBAQCBzdGF0aWMgaW50IF9fZHdjM19nYWRnZXRfd2FrZXVwKHN0cnVjdCBkd2Mz
ICpkd2MsIGJvb2wgYXN5bmMpDQo+ICAJCXJldHVybiAtRUlOVkFMOw0KPiAgCX0NCj4gIA0KPiAt
CWlmIChhc3luYykNCj4gLQkJZHdjM19nYWRnZXRfZW5hYmxlX2xpbmtzdHNfZXZ0cyhkd2MsIHRy
dWUpOw0KPiArCWR3YzNfZ2FkZ2V0X2VuYWJsZV9saW5rc3RzX2V2dHMoZHdjLCB0cnVlKTsNCj4g
IA0KPiAgCXJldCA9IGR3YzNfZ2FkZ2V0X3NldF9saW5rX3N0YXRlKGR3YywgRFdDM19MSU5LX1NU
QVRFX1JFQ09WKTsNCj4gIAlpZiAocmV0IDwgMCkgew0KPiBAQCAtMjQwNCwyNSArMjM5OSw2IEBA
IHN0YXRpYyBpbnQgX19kd2MzX2dhZGdldF93YWtldXAoc3RydWN0IGR3YzMgKmR3YywgYm9vbCBh
c3luYykNCj4gIAkgKiBTaW5jZSBsaW5rIHN0YXR1cyBjaGFuZ2UgZXZlbnRzIGFyZSBlbmFibGVk
IHdlIHdpbGwgcmVjZWl2ZQ0KPiAgCSAqIGFuIFUwIGV2ZW50IHdoZW4gd2FrZXVwIGlzIHN1Y2Nl
c3NmdWwuIFNvIGJhaWwgb3V0Lg0KPiAgCSAqLw0KPiAtCWlmIChhc3luYykNCj4gLQkJcmV0dXJu
IDA7DQo+IC0NCj4gLQkvKiBwb2xsIHVudGlsIExpbmsgU3RhdGUgY2hhbmdlcyB0byBPTiAqLw0K
PiAtCXJldHJpZXMgPSAyMDAwMDsNCj4gLQ0KPiAtCXdoaWxlIChyZXRyaWVzLS0pIHsNCj4gLQkJ
cmVnID0gZHdjM19yZWFkbChkd2MtPnJlZ3MsIERXQzNfRFNUUyk7DQo+IC0NCj4gLQkJLyogaW4g
SFMsIG1lYW5zIE9OICovDQo+IC0JCWlmIChEV0MzX0RTVFNfVVNCTE5LU1QocmVnKSA9PSBEV0Mz
X0xJTktfU1RBVEVfVTApDQo+IC0JCQlicmVhazsNCj4gLQl9DQo+IC0NCj4gLQlpZiAoRFdDM19E
U1RTX1VTQkxOS1NUKHJlZykgIT0gRFdDM19MSU5LX1NUQVRFX1UwKSB7DQo+IC0JCWRldl9lcnIo
ZHdjLT5kZXYsICJmYWlsZWQgdG8gc2VuZCByZW1vdGUgd2FrZXVwXG4iKTsNCj4gLQkJcmV0dXJu
IC1FSU5WQUw7DQo+IC0JfQ0KPiAtDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+ICANCj4gQEAgLTI0
NDMsNyArMjQxOSw3IEBAIHN0YXRpYyBpbnQgZHdjM19nYWRnZXRfd2FrZXVwKHN0cnVjdCB1c2Jf
Z2FkZ2V0ICpnKQ0KPiAgCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZkd2MtPmxvY2ssIGZsYWdz
KTsNCj4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+ICAJfQ0KPiAtCXJldCA9IF9fZHdjM19nYWRnZXRf
d2FrZXVwKGR3YywgdHJ1ZSk7DQo+ICsJcmV0ID0gX19kd2MzX2dhZGdldF93YWtldXAoZHdjKTsN
Cj4gIA0KPiAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KPiAg
DQo+IEBAIC0yNDcxLDE0ICsyNDQ3LDEwIEBAIHN0YXRpYyBpbnQgZHdjM19nYWRnZXRfZnVuY193
YWtldXAoc3RydWN0IHVzYl9nYWRnZXQgKmcsIGludCBpbnRmX2lkKQ0KPiAgCSAqLw0KPiAgCWxp
bmtfc3RhdGUgPSBkd2MzX2dhZGdldF9nZXRfbGlua19zdGF0ZShkd2MpOw0KPiAgCWlmIChsaW5r
X3N0YXRlID09IERXQzNfTElOS19TVEFURV9VMykgew0KPiAtCQlyZXQgPSBfX2R3YzNfZ2FkZ2V0
X3dha2V1cChkd2MsIGZhbHNlKTsNCj4gLQkJaWYgKHJldCkgew0KPiAtCQkJc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+IC0JCQlyZXR1cm4gLUVJTlZBTDsNCj4g
LQkJfQ0KPiAtCQlkd2MzX3Jlc3VtZV9nYWRnZXQoZHdjKTsNCj4gLQkJZHdjLT5zdXNwZW5kZWQg
PSBmYWxzZTsNCj4gLQkJZHdjLT5saW5rX3N0YXRlID0gRFdDM19MSU5LX1NUQVRFX1UwOw0KPiAr
CQlkd2MtPmZ1bmNfd2FrZXVwX3BlbmRpbmcgfD0gQklUKGludGZfaWQpOw0KPiArCQlyZXQgPSBf
X2R3YzNfZ2FkZ2V0X3dha2V1cChkd2MpOw0KPiArCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZk
d2MtPmxvY2ssIGZsYWdzKTsNCj4gKwkJcmV0dXJuIHJldDsNCj4gIAl9DQo+ICANCj4gIAlyZXQg
PSBkd2MzX3NlbmRfZ2FkZ2V0X2dlbmVyaWNfY29tbWFuZChkd2MsIERXQzNfREdDTURfREVWX05P
VElGSUNBVElPTiwNCj4gQEAgLTQzMDAsNiArNDI3Miw3IEBAIHN0YXRpYyB2b2lkIGR3YzNfZ2Fk
Z2V0X2xpbmtzdHNfY2hhbmdlX2ludGVycnVwdChzdHJ1Y3QgZHdjMyAqZHdjLA0KPiAgew0KPiAg
CWVudW0gZHdjM19saW5rX3N0YXRlCW5leHQgPSBldnRpbmZvICYgRFdDM19MSU5LX1NUQVRFX01B
U0s7DQo+ICAJdW5zaWduZWQgaW50CQlwd3JvcHQ7DQo+ICsJaW50CQkJcmV0LCBpbnRmX2lkID0g
MDsNCg0KQ2FuIHdlIGtlZXAgZGVjbGFyYXRpb25zIGluIHNlcGFyYXRlIGxpbmVzPw0KDQo+ICAN
Cj4gIAkvKg0KPiAgCSAqIFdPUktBUk9VTkQ6IERXQzMgPCAyLjUwYSBoYXZlIGFuIGlzc3VlIHdo
ZW4gY29uZmlndXJlZCB3aXRob3V0DQo+IEBAIC00Mzc1LDcgKzQzNDgsNyBAQCBzdGF0aWMgdm9p
ZCBkd2MzX2dhZGdldF9saW5rc3RzX2NoYW5nZV9pbnRlcnJ1cHQoc3RydWN0IGR3YzMgKmR3YywN
Cj4gIA0KPiAgCXN3aXRjaCAobmV4dCkgew0KPiAgCWNhc2UgRFdDM19MSU5LX1NUQVRFX1UwOg0K
PiAtCQlpZiAoZHdjLT5nYWRnZXQtPndha2V1cF9hcm1lZCkgew0KPiArCQlpZiAoZHdjLT5nYWRn
ZXQtPndha2V1cF9hcm1lZCB8fCBkd2MtPmZ1bmNfd2FrZXVwX3BlbmRpbmcpIHsNCj4gIAkJCWR3
YzNfZ2FkZ2V0X2VuYWJsZV9saW5rc3RzX2V2dHMoZHdjLCBmYWxzZSk7DQo+ICAJCQlkd2MzX3Jl
c3VtZV9nYWRnZXQoZHdjKTsNCj4gIAkJCWR3Yy0+c3VzcGVuZGVkID0gZmFsc2U7DQo+IEBAIC00
Mzk4LDYgKzQzNzEsMjEgQEAgc3RhdGljIHZvaWQgZHdjM19nYWRnZXRfbGlua3N0c19jaGFuZ2Vf
aW50ZXJydXB0KHN0cnVjdCBkd2MzICpkd2MsDQo+ICAJfQ0KPiAgDQo+ICAJZHdjLT5saW5rX3N0
YXRlID0gbmV4dDsNCj4gKw0KPiArCS8qIFByb2NlZWQgd2l0aCBmdW5jIHdha2V1cCBpZiBhbnkg
aW50ZXJmYWNlcyB0aGF0IGhhcyByZXF1ZXN0ZWQgKi8NCj4gKwl3aGlsZSAoZHdjLT5mdW5jX3dh
a2V1cF9wZW5kaW5nICYmIChuZXh0ID09IERXQzNfTElOS19TVEFURV9VMCkpIHsNCj4gKwkJaWYg
KGR3Yy0+ZnVuY193YWtldXBfcGVuZGluZyAmIEJJVCgwKSkgew0KPiArCQkJcmV0ID0gZHdjM19z
ZW5kX2dhZGdldF9nZW5lcmljX2NvbW1hbmQoZHdjLCBEV0MzX0RHQ01EX0RFVl9OT1RJRklDQVRJ
T04sDQo+ICsJCQkJCQkJICAgICAgIERXQzNfREdDTURQQVJfRE5fRlVOQ19XQUtFIHwNCj4gKwkJ
CQkJCQkgICAgICAgRFdDM19ER0NNRFBBUl9JTlRGX1NFTChpbnRmX2lkKSk7DQo+ICsJCQlpZiAo
cmV0KQ0KPiArCQkJCWRldl9lcnIoZHdjLT5kZXYsICJmdW5jdGlvbiByZW1vdGUgd2FrZXVwIGZh
aWxlZCBmb3IgJWQsIHJldDolZFxuIiwNCj4gKwkJCQkJaW50Zl9pZCwgcmV0KTsNCj4gKwkJfQ0K
PiArCQlkd2MtPmZ1bmNfd2FrZXVwX3BlbmRpbmcgPj49IDE7DQoNClRoaXMgd291bGQgYnJlYWsg
dGhlIGJpdG1hcCBvZiBkd2MtPmZ1bmNfd2FrZXVwX3BlbmRpbmcuIFBlcmhhcHMgd2UgY2FuDQp1
c2UgZmZzKHgpIHRvIHByb3Blcmx5IGZpbmQgYW5kIGNsZWFyIHRoZSBpbnRlcmZhY2UgSUQgZnJv
bSB0aGUgYml0bWFwDQpvbmUgYXQgYSB0aW1lLg0KDQo+ICsJCWludGZfaWQrKzsNCj4gKwl9DQo+
ICsNCj4gIH0NCj4gIA0KPiAgc3RhdGljIHZvaWQgZHdjM19nYWRnZXRfc3VzcGVuZF9pbnRlcnJ1
cHQoc3RydWN0IGR3YzMgKmR3YywNCj4gLS0gDQo+IDIuMjUuMQ0KPiANCg0KVGhhbmtzLA0KVGhp
bmg=
