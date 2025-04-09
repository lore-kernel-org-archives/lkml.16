Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1072AE97;
	Wed,  9 Apr 2025 00:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159452; cv=fail; b=TXOim3yH3IbFvWaljyegy2bkFzuSFwktETRHtKcpgVuAvzYMmVb/40aj1mF7qfldZUpUthk7DBCEmdMpqOU4aMYS+PIFLbDMKsO0AIfoRjWuUpt7xq+sTRZRA9heTPVXfjVQcQ+JPz6bOh5ZCEpsIiaQWR7DjEhC/0sw9q0K4KA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159452; c=relaxed/simple;
	bh=UpOHev+hxIU4aqaJRe29x1iLZ2QwN+leGS/9jlsckDA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KcPSX0ppz4jHc/Y9R8oL4UEuJJcLk/2K1AhgazJ+GzJSNcyARwLFC7N+IBY55r8++or6hlYCcyLt/Ph5XBLdtfVHFXnOF6FyZCpo6r+BFcDYTBtYwJz3rrG6wyKxrC+VuAEl3Qhs/gRu+/YXIrz8g8hP+pYIdtiqCvo6Gh1Unjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=m5RviQNi; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=XkxAISIm; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dU9eO4kK reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="m5RviQNi";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XkxAISIm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dU9eO4kK"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5390LsOq018133;
	Tue, 8 Apr 2025 17:43:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=UpOHev+hxIU4aqaJRe29x1iLZ2QwN+leGS/9jlsckDA=; b=
	m5RviQNiG9vlr3GdnsXxal12S5vX8T6i2lompU1aPq6eu7sqP6lxeEFERXmJcT+Z
	hqj1X0NP8j4CV5uT7VYWQxkG9vnmXPZ+qsk+ALCF4akRY+L4vrJJQLLxZFFhBJbj
	eoZUXKUPUTvpEnyhHreDUqf6JY9LBbX1hOkuY+B5lyLfVZ98LCjffUjhF1S1Z8Dd
	zx/oCQpYarHpTxz5TRwlaBZcbt8+xkKjNQGCOK+Oxd9C5idpnhdvdzpBhvy10b2u
	D57sTK9DFRgBUuiT5CeHdPibv0w9QGQfjpaK+MYk+WiSBadepUePKSnF9KHa/12u
	/SxbNbgLIHI7nabMw45hiQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 45u35ft3x8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 17:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1744159421; bh=UpOHev+hxIU4aqaJRe29x1iLZ2QwN+leGS/9jlsckDA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=XkxAISImsG6BNy0lyvFzeWgf90Vv9YxGjIqBnsqiBnCbLUj5+E+EKJ4daHUu+0jmL
	 wc8cr+t93I6Q0vQdZm1ONoycfSgLPIbNQn4WSLh5xO6SpjNvU+wjp99nY1GwG13ySE
	 WvHF3eeKOmMAkNGSm11absudKF+is+7v18ZBu1S2QueAiU1e0m7YcE6y8RyvnGArfu
	 MUB0hmwt3gzqTMT4eIhz0BkCvfWFZaw1wUSaL0CInVWV754VgWR8qzZvImHshsGelz
	 TTim3FE+BgiJXP3HY+ij/fWgilSF9yZE4W0E9yRduJETK6QrQFnLam+aRhwPCKaoIk
	 L9y1ZVZvVRPpg==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5BD0E40114;
	Wed,  9 Apr 2025 00:43:40 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 588CBA005B;
	Wed,  9 Apr 2025 00:43:39 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=dU9eO4kK;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4F9464048E;
	Wed,  9 Apr 2025 00:43:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i6IQR7jLKhCxrl658DEdC4h6EKoPpobftTUhw+Slmfwbgw10xFSgv7uZZPzD22mFfwpOgv2j6re1ttXaVhPpnIGMUZx3x8CCIXWgfbyjcWuIFjCpkDVgajJWLnkV7mYOYKW4wAIDGzqY4iXFE4DlT8LIqe5X2SVr1HBQzqnctboGZRUNVl4DL0dHZX581PMVSYcs2pndHrSLPB/wTYU6v0BMOfc6F/98+oWIH1OhaA2ZQT4gOfWCilDHfrhHMiQ3UEoPSycZA4WKi9/dlAmUvJKAwZTD/gvH70fsG0l9jJctm9OP3QoPHyxeKVjHVJAQunwq7kaBqWVDld8aMywqVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpOHev+hxIU4aqaJRe29x1iLZ2QwN+leGS/9jlsckDA=;
 b=k/Np66ieSOpCLDlcc8j4pRYd2ExU/4f5PkVGdxLmMoZA8PdYdLY8SK8cmUP+EGEQNKFf4HDUsi3RXe74nSBYLDJ7cOaMdqesTW45DwCaxGLTj04Rvg86gdPdkCt3Xl5clUUmrFG3lqzBpd1ydpYvDAngYeR06wfB6UnkoiHScuov9tY2+b54hauiW51ASXeMZ4BQZb7mlbPEyZTcT49luMV3JUp+4YQ/TgWl1StVJzXcfgbbjnYNo9ey+7R8xjyIPqlQEMtnaQY7Kx3lS/O3Opa4dNGzVz/svvK+d5lAPBh532jlEpRZilWOh9bz5fegRpV94oZAcNbHe+3+Csz5GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UpOHev+hxIU4aqaJRe29x1iLZ2QwN+leGS/9jlsckDA=;
 b=dU9eO4kKYY2k55kkvkyHotz0ylLc9K2Qa9bwd1IWwHRY03tKYGWC9o9ruSFE1eJ9AwV1ocEFvG2nMo6SeO+CXRm0JAZNk2eVGUxztw73jbgVkYce/rZl5dHqJi+U9I8qrYorH71xchI80wYDRNPGAfC9SwmXpYMbXLZB4ZJb4oc=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA1PR12MB8587.namprd12.prod.outlook.com (2603:10b6:208:450::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Wed, 9 Apr
 2025 00:43:34 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 00:43:33 +0000
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
Thread-Index: AQHbpIi7c9+1pUhKXE+zN5SY3VBPMrOY4xyAgABjf4CAAUEnAA==
Date: Wed, 9 Apr 2025 00:43:33 +0000
Message-ID: <20250409004330.iflfdxabodalsmox@synopsys.com>
References: <20250403110805.865311-1-prashanth.k@oss.qualcomm.com>
 <20250403110805.865311-4-prashanth.k@oss.qualcomm.com>
 <20250407233757.jmtohzgm4xebjndn@synopsys.com>
 <10bf04c1-f040-4646-9484-70827db36d27@oss.qualcomm.com>
In-Reply-To: <10bf04c1-f040-4646-9484-70827db36d27@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA1PR12MB8587:EE_
x-ms-office365-filtering-correlation-id: c41d7bdc-d0cd-40e3-3e79-08dd76ff8ea9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aFgycTVJOWcxdVhzTnRGNWNSb2cvRVRNWDRkL1lrbm52WWErM25hSk5oVUtX?=
 =?utf-8?B?enZPOVhhSTE4a0hCQTRiYlBtdnVSSyt4aUdXMmtYRXIyZ0w0MW1wdDB1K1lP?=
 =?utf-8?B?RFVtWEIzaGhrMEVLNnRwOTIrY2FkYktKTUFzUEFJdXYxOTdac3huckdnUTZI?=
 =?utf-8?B?U0dPVTIzT1ZJRllxOEhPVGFTOTFZbjJzL05uanp4RTI5Sk1kYXpkczdER0g3?=
 =?utf-8?B?VXl3WGRBcG9Uam5JZGN5eW11RnBrWGtZY0dVUGpERi9neUhLSnVseGlnRWNi?=
 =?utf-8?B?alAxVVphV2M3MVN0Q3RGOXR4d09MZkRMZzg5MDVjcjI0Z1AvSHpQdE12UDlC?=
 =?utf-8?B?UEdGVEM0NHNndEJlN05NZXoyZmRiOEVzK21Ib053TnVDb2F1U0IrdE1xT2M0?=
 =?utf-8?B?U05HK2dGYzlFYTVQSUREMkg3ajVlNnFSZCtDdCtsc2k0T0ZWUzhWZUtHaWxL?=
 =?utf-8?B?MlBrYWRIQW5SZEl4RUFtTm1rMElDbjdHWG5aYjlYYVlzWkpyVmx3OEZuNEhM?=
 =?utf-8?B?R3VzSnF3enhwQm01cDYyaHFGa0Y5Q09hVEZVVHduSythWTk2aTFCdEZiK0c5?=
 =?utf-8?B?TlBaZ1JBcFZMbncvbDAveFFlM0dwaEx0SlZMaVV0cmttMnV3TXMzQXByc0Ny?=
 =?utf-8?B?R25nOWRXWERCQ0hTQlRPbmxlNVBLS0tJaHVrSTB4enoyanFvS3B0TFNxeURP?=
 =?utf-8?B?VExkUHFYb1I4V2lKbi9RYTJsV3BYaHRNM1BpTXh2MEkvRjZZczFTblAyalg4?=
 =?utf-8?B?dllteGlQTFFCazJXaXhVSjlhYm5qNVlocEl0bVVwa0h4QjR1K2daV2JDb1Bz?=
 =?utf-8?B?WFVEcEVyRS9zN3k0Y0tPZkt2eVF2TWJydDhFQVA5b3dhVDBPZVVOR2hCazBx?=
 =?utf-8?B?MmN2RG1TNjk5TlkvOUtzTEJicTlkN3Bid0JQTW4xSEtpQzNVSEJrcC9FTnZY?=
 =?utf-8?B?TlJ0ZVhvWVdObGRLMk5SWHRzZUNQWUlpR2xUT2hCSzNyNXhkcnBOVXdLeHIy?=
 =?utf-8?B?WXR4NGxUMEx0SFdYU1ZDTERaZkx0elpZUTZQa0l3K3d5UW16V045cEluNGNS?=
 =?utf-8?B?RWF3TGZrN3B5YjQ3MjhSNVpyZ0wwNkJNTXN6cjArQ3JObHVrTFUzUGZiRU1m?=
 =?utf-8?B?dHRJdExzTHdSOS9lMEtSdERPc0FXUmdyUzlFbjNtNkVLT0dLRVM0bWFVSGRr?=
 =?utf-8?B?ei92NEd0WXJRZ2NySGdMSzZDVTJoVUptWUg5b3RaY01VaXNqbnl0SUc0U1Ur?=
 =?utf-8?B?Ky84TnptYjBOZTNTRVJkK0tYNnZWRnpqUUxoSytRQUtpZ3dmU1dUencrSy9Y?=
 =?utf-8?B?dlArSjJSQ0JvRjNuanJEUGxPZVFBQ3g4RzNRZ2NrQjNCUVMxWUZFWnBDZUp5?=
 =?utf-8?B?eEFaajk1eGNGUC9YVWpoNlhTS0VvTTd5RHlQak43RlhORk1qczN0akdYdWNo?=
 =?utf-8?B?OXdyWFR2endJKzNvN1E3Rmk4NGpYVEhucFJWUnNEODNCTmxEWmpuQXRzRExW?=
 =?utf-8?B?cURRRmZGZGZnTUszZXptVS9pd1ZlUnhMa2Y4SSt0dFpWcXFxT0I5YWMyTUtx?=
 =?utf-8?B?R3lqTXdNMkxqOHZWQWFTVGhPYWhWNlAvR29qdktQZkhncmZNdW9nS2VlZE5I?=
 =?utf-8?B?T2JpSW9MbXRqS01RdXJCZEQ0R3V0WDRNVTQ5R1FoaTVDcGxtdUdMMHByL0Uw?=
 =?utf-8?B?eEgzaTkrVjNKTFB1THc0ZWVmVEVIdXh3ckpRMzBLVkx0V3J5L1pIYVBIZWRS?=
 =?utf-8?B?TS9yZFAvRXcvdDQwckNTUHFySzBTaExOaHVwd05CQkl5UmZDTlpmRmRIWGcx?=
 =?utf-8?B?RExWWjFnRWN4RUMwbTRTaTJ4ck9qblBRRWVvVHZYVWdpMXFmdndyZVBDSXhR?=
 =?utf-8?B?TlhNNzVxS2llaTVaTDdkaHNNbW9valNoUEFHUGZYOGVmOGlZa0ZnN2JXUFlz?=
 =?utf-8?Q?1fioKx0WDBnYBgGb0ZWVfMvLY7Dl3wez?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RlAzWk44b3BXUjZNeG8yZ3RWQmlQSTMyNDZsL1dYd2VoZHZVZENsM1ZLSDNy?=
 =?utf-8?B?Y2w1ZllIMHpYMmhPK3p4Qi9keTFBeTJydDZBQktSbnhmYTV4STVmT1RGZHlD?=
 =?utf-8?B?bkZ6NEpzVWV1dWZEcjBpODQ5OGpBa0VQbXloZmFZUGVtTjF4VUgxMG9aQ29P?=
 =?utf-8?B?MzJPb3RvYTk0bzZ1SmxyVk5RNDJvYW9zdUZqWTI1OGNrcjI2TG5OUUZ6eVQv?=
 =?utf-8?B?c0wrSGpDWTFleUU0NHdWZWZicFZ3SFB6eEZpVnRCZGFPMWtKZjRXNGlqMldp?=
 =?utf-8?B?bmpjQ2c2eHcrYi9ZZWJlSjh5VmQxb0tMZFN4Yjc2LzdZRUsvb3pNU1dNQUI3?=
 =?utf-8?B?elJSRTVubnZaV1pUYWV6OTNIV2Q0Z0RlOUtwczNxRTJOWGQrWGR1TVJqY3pj?=
 =?utf-8?B?c2lHZUNkdmIwdGNHak5GNCtIS1U4alZzUHppS285TFQ1RXRMT2hhZjVWNEFu?=
 =?utf-8?B?M1BtNlpUUXRhNHRzaHgzYmxHN2pDanpjMGJscEFLYUlVWHJmdVBjSlhDd0VP?=
 =?utf-8?B?Vll2YXY0SGFxeEs1clFMT2JFSnhPTDN0cDZKSTgxOXduTjdSUjF6L2lLMjJV?=
 =?utf-8?B?QjQzRTNlN1RoOWNqd3RyOWpLYWcyQWhjNVJaZkZOdFZTYmMwZGhwWUVjVytx?=
 =?utf-8?B?WFdrSjByTXd1Ujh3eC9MSkxNS285K1pNb0lWN0d1Sjh1Zzdlc3h3cjJjUUFw?=
 =?utf-8?B?aFB5QlRKQWJOZHNwZ3NaNUZIR3BGMlJVVTR3bzBabjRHNG05Q21WeDVXbVpq?=
 =?utf-8?B?NjFRTThyL2MyRnBTSnZxNTVDWFhCekxWaENQOENscWU2VHRtcnJhM3hNdWdV?=
 =?utf-8?B?cVR2RzRaeEtFYlFnY2dnUEJBSkV3TGk5Vm5uNEthSDRxelArd3RlZmlNYitZ?=
 =?utf-8?B?VUxicGhEdmJHeC9oTWVwdDVrWk5aSnJka1VPNDc0ako0cmpSY1Bud3BTNXFW?=
 =?utf-8?B?TDFWVmlycGx2cDdnS1hpYmxCUXU0MTc0Sjl5N09KRTc5Qnl4NHpGNE54UUlr?=
 =?utf-8?B?ZlpKQTZkOWpZdm9VdHg5MlUrMUt6dmZ6WEQ5ZndkZ1c1SVdTWUNVTUhIVSs2?=
 =?utf-8?B?TkhMMjdEeW9VTTRiaFFZdklVeXUyTUVCamcvV244MlIzUzJPMlRadFMzME5a?=
 =?utf-8?B?clpBdGdaTk9tcXYxalFlem9LU3V3d0pXUFc5WG0xV0dDVTJoNXA5OHF2Y2cr?=
 =?utf-8?B?MmRsdXREdDVRaVRwWVkrdXVIc0hiczN3eExYbFlqK0tuMGYycXlJeXJpSklt?=
 =?utf-8?B?eVJQTHdVS1ZoM3BZbDBpb3VZeTJjVUcwczV1bWx5czk0RVFodDBFWlZmdHZj?=
 =?utf-8?B?anUxZGdiaXF2THdFcHl1TXFJdXVnMGRpaEsvemV2b3JsbzJzOStpUFYzblpP?=
 =?utf-8?B?cHdaQ0FqVDk1bGdaWFg2T0FnVHpEazVrM0ZBT2NPMElnWS9CZSt6dFovYTQ5?=
 =?utf-8?B?Qi9hUm9HNXJ2SXBkbXliWFE5Ri8ydlI1R056S1U0M3BrWW1OZWpOamFIaWpz?=
 =?utf-8?B?ckFweHRiTUI4ZnhSQ1ZYRlQzTWxER2ZDelFPKzd5aXRvT1lHWGp0Y0pkQ2pq?=
 =?utf-8?B?SWVodUtEOGx6RHorQ1YvZCtVK0hMOFBOSWg3a2tkVXF1N2RHY256U2Y4TzVu?=
 =?utf-8?B?OE5jUW9oVklrTm5tRy9YNlB3NVRmUVhnWmhXYUg0Tnlxalh4TGgwbXV4RzdO?=
 =?utf-8?B?dERZOHpLRm1qd0RFZEFjMTR3dFJXOHJsUkZ0ZnkzMGZZVnQzT1h0K2dpenpa?=
 =?utf-8?B?Ynp5Qlc5a210R0t3SHRkTStncytJVHdkR0pVNXNBM3FpeC9hUjJBWGNnTE92?=
 =?utf-8?B?WHFoOFlTQW1vU1RlVEJ2Qkx3L3U1K09kZWpUb1VqVWp6SldObTkreTNybWJT?=
 =?utf-8?B?UERzYkQxTGdTQ2tqdFl5QWtIZEFYcHhscEtKem5KNGFSV1YzOHBCVHF4NHIx?=
 =?utf-8?B?R1pZdmE3QWdJWmhBZmpwcDhsbkxPVzNlZHdWQnlJY01MdmJMdXFyQ2VhQlRv?=
 =?utf-8?B?eW9FNG53enBSdVJPUmgzUXB0SEJNWDExWGUxWmxqTC8rVVZVM2RLY3JBbzlq?=
 =?utf-8?B?NlcvUnFGMTdRbHdla1cyaEFSelpZd0IrR2tjL2pGV3ZWaDhsNzJiYitXNHA3?=
 =?utf-8?Q?dyoiccAdVtgx+NTvKe4NNjrxg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <501A652C6D2C5742BCF93D078B757DCA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VTbkqaRbT2i5n6nLNfU3TRcfgWcNCu1xFdxSjEONhoYix4CWs7TOkWrZdqx9OiLvWvzBgEqf4A3nQ+Umd8k2y/3bKEastGPKjXLizOswWjCyn8N0RqFR1TOt7GAip0Xp/M+gHhNJHSUbizTSsDy5ieVDZhxMNfnKZB0arH2HUjYQAlB2/16N0AYKAwU9PTwBLFkTlbvE+zvgYGgVEi+E6Y+NDomdWg5Gzwtv9rBaoShhVhxUA2L+GMEhXu6AkMEJ650cmCMLORx2WSEA02db8HG+cGFWQB31V4zLAJ15OcL3i8teokhXnyIroeO1JF3zsb4FCaWvQjRXijKcRnds8woUV1Vxipn4NcS7atZz63DNDrDYnBtcWi0b4XDUPXRk14xsOoHcx4DB7mTtF9OVpZfq4OwfD/zD8r3FBP5U1yUfAWumfUUMVjRAZAfYLo2zpK8slscm63s4+pUcWvKC+CnbhCMIVB0MIAiD9ub/B1peEoiY2JYko8Xxo4etHmOq1eJ+24VBGhb25C3HLcJfcFE/zmp/HcLfBUXtufFePcJIb55q9OvCtDl55i0nKmgvoyFXS+0Mfvcf+UIIUinK/bDD+VfJrWT0EOmB35+kibd7KSfbPZfV0fOGNra8DzhK+mb8g2AwbdJtYe3kkmt6wA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c41d7bdc-d0cd-40e3-3e79-08dd76ff8ea9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 00:43:33.8456
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AAkhuViDCIdetmIuh8MwpOJALU+2kQ8g/LkwNrTucbSAbyI8cpfmrRD7mM0Yc4ndWDyZdVapI+pediCnj2vx9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8587
X-Proofpoint-GUID: 4gybaF6Fj8d6eIh2WOn_nR--wOz1GsMw
X-Proofpoint-ORIG-GUID: 4gybaF6Fj8d6eIh2WOn_nR--wOz1GsMw
X-Authority-Analysis: v=2.4 cv=FZM3xI+6 c=1 sm=1 tr=0 ts=67f5c2be cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=5QSEJDsS4rB2Fa13zVgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_09,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504090001

T24gVHVlLCBBcHIgMDgsIDIwMjUsIFByYXNoYW50aCBLIHdyb3RlOg0KPiANCj4gDQo+IE9uIDA4
LTA0LTI1IDA1OjA4IGFtLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gVGh1LCBBcHIgMDMs
IDIwMjUsIFByYXNoYW50aCBLIHdyb3RlOg0KDQo+ID4+IEBAIC00Mzk4LDYgKzQzNzEsMjEgQEAg
c3RhdGljIHZvaWQgZHdjM19nYWRnZXRfbGlua3N0c19jaGFuZ2VfaW50ZXJydXB0KHN0cnVjdCBk
d2MzICpkd2MsDQo+ID4+ICAJfQ0KPiA+PiAgDQo+ID4+ICAJZHdjLT5saW5rX3N0YXRlID0gbmV4
dDsNCj4gPj4gKw0KPiA+PiArCS8qIFByb2NlZWQgd2l0aCBmdW5jIHdha2V1cCBpZiBhbnkgaW50
ZXJmYWNlcyB0aGF0IGhhcyByZXF1ZXN0ZWQgKi8NCj4gPj4gKwl3aGlsZSAoZHdjLT5mdW5jX3dh
a2V1cF9wZW5kaW5nICYmIChuZXh0ID09IERXQzNfTElOS19TVEFURV9VMCkpIHsNCj4gPj4gKwkJ
aWYgKGR3Yy0+ZnVuY193YWtldXBfcGVuZGluZyAmIEJJVCgwKSkgew0KPiA+PiArCQkJcmV0ID0g
ZHdjM19zZW5kX2dhZGdldF9nZW5lcmljX2NvbW1hbmQoZHdjLCBEV0MzX0RHQ01EX0RFVl9OT1RJ
RklDQVRJT04sDQo+ID4+ICsJCQkJCQkJICAgICAgIERXQzNfREdDTURQQVJfRE5fRlVOQ19XQUtF
IHwNCj4gPj4gKwkJCQkJCQkgICAgICAgRFdDM19ER0NNRFBBUl9JTlRGX1NFTChpbnRmX2lkKSk7
DQo+ID4+ICsJCQlpZiAocmV0KQ0KPiA+PiArCQkJCWRldl9lcnIoZHdjLT5kZXYsICJmdW5jdGlv
biByZW1vdGUgd2FrZXVwIGZhaWxlZCBmb3IgJWQsIHJldDolZFxuIiwNCj4gPj4gKwkJCQkJaW50
Zl9pZCwgcmV0KTsNCj4gPj4gKwkJfQ0KPiA+PiArCQlkd2MtPmZ1bmNfd2FrZXVwX3BlbmRpbmcg
Pj49IDE7DQo+ID4gDQo+ID4gVGhpcyB3b3VsZCBicmVhayB0aGUgYml0bWFwIG9mIGR3Yy0+ZnVu
Y193YWtldXBfcGVuZGluZy4gUGVyaGFwcyB3ZSBjYW4NCj4gPiB1c2UgZmZzKHgpIHRvIHByb3Bl
cmx5IGZpbmQgYW5kIGNsZWFyIHRoZSBpbnRlcmZhY2UgSUQgZnJvbSB0aGUgYml0bWFwDQo+ID4g
b25lIGF0IGEgdGltZS4NCj4gPiANCj4gWWVzLCB3ZSBjYW4gdXNlIGZmcyh4KS4gQnV0IEkgZGlk
bid0IHVuZGVyc3RhbmQgaG93IHRoaXMgd291bGQgYnJlYWsNCj4gYml0bWFwIG9mIGR3Yy0+ZnVu
Y193YWtldXBfcGVuZGluZy4NCj4gDQoNClNpbmNlIHlvdSdyZSBzZW5kaW5nIGRldmljZSBub3Rp
ZmljYXRpb24gdG8gYWxsIHRoZSB3YWtldXAgYXJtZWQNCmludGVyZmFjZXMgYW5kIG5vdCByZXVz
aW5nIHRoZSBmdW5jX3dha2V1cF9wZW5kaW5nIGFmdGVyd2FyZCwgdGhlIHJlc3VsdA0Kb2Ygd2hh
dCB5b3UncmUgZG9pbmcgaGVyZSB3aWxsIGJlIHRoZSBzYW1lLg0KDQpJTUhPLCBmb3IgY2xhcml0
eSwgd2hhdCBJIHdhcyBzdWdnZXN0aW5nIGlzIHRvIHJldmlzZSB0aGUgbG9naWMgdG8NCnByZXNl
cnZlIHRoZSBkd2MtPmZ1bmNfd2FrZXVwX3BlbmRpbmcgYml0bWFwIGluc3RlYWQgb2Ygc2hpZnRp
bmcgYW5kDQpvdmVyd3JpdGluZyBpdCwgY2F1c2luZyB0aGUgYml0bWFwIHRvIG5vIGxvbmdlciBt
YXRjaCB0aGUgaW50Zl9pZC4gV2UNCmdldCB0aGUgaW50Zl9pZCBmcm9tIHRoZSBiaXRtYXAgYW5k
IGNsZWFyIHRoZSBpbnRmX2lkIGJpdCBmcm9tIHRoZQ0KYml0bWFwIGFzIHdlIGdvLg0KDQpUaGFu
a3MsDQpUaGluaA0K
