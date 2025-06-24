Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F72538384;
	Tue, 24 Jun 2025 00:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750725280; cv=fail; b=gwUvdZHyr3IL+hcyA6jzf08MJLYPz+agiaBCdu2/fX4KVj1CNPwl153MbWAJTXHnMtslLh/fVZZuSDe9hLnbzBhKgwtoxZXrwYc2uwJmE4rZKZx5A2Qx4TkomxgpZZuDx7XyrrejFBv9lRJVAhUDDK5YwVA6cLNvSB58+Tc4kVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750725280; c=relaxed/simple;
	bh=0QUZoursRtCHTMK6f+qH92t1Wc6XRfBiDKA39ZjmYcA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ggqREna4QW1QtJNKyCQ9saja7RrBVP9PGNmXfUcMLs0kqNCUrPIW6QeAdco9ZT8av8WX7NdrRDQTpwrXomSL4sj3Ve0yJAXQcOcMsGNyYuDaWLlXRjn3yiidqI/y3/l7RtlxzyMDAW+krnYBVy0l67CGPrsruWuZngV41Au4XMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=gf5miIdG; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZdbZTv9B; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=AdcvOxiX reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gf5miIdG";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZdbZTv9B";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AdcvOxiX"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NGWB9G024204;
	Mon, 23 Jun 2025 17:34:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=0QUZoursRtCHTMK6f+qH92t1Wc6XRfBiDKA39ZjmYcA=; b=
	gf5miIdGTZ4VBYnkOVp4PgqrFj7HMZSOF2+XAIphIMfnmRxEkJxPRDMkQGo/T1lh
	TsYJG7X7GkyQkZJX2XSpw35Ey+3JmWEEaQAFibpkO4mxTXDpl5+elqEJ4cjxmCZe
	j8n5uPSr/Ky4qrHhDTThjsnSW9rvyoRSjJQKV6czZv9/sDusGiK+9ukTE9fBWo7g
	IifTFRTHpimwvObNfqtN9Wg3G1pnjBZERx19B/a97s6GGywuYUBO6fnFvWdTHRl6
	H66Vg3vcK8+WMdc6ic/7iVrIX73igrcveS2cyE6yjSXtAi/75Wrw/A2IIm4Vn0Qk
	wrqq7oOKYtE0e1YuxLjE5w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 47ducgg6jb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 17:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1750725266; bh=0QUZoursRtCHTMK6f+qH92t1Wc6XRfBiDKA39ZjmYcA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ZdbZTv9BovZ/ARpdGayfeLLyvIQ7GZfc+TmCS/kRDHeGmdREitQfm+sGvmU3MzdcI
	 fW6I9FaO55f3EcGhmNxzAPLAHugT3gfN9ZAsIUhp7LpWDyAdYbWpDnk/zWy/7xXFaK
	 qhMWSkclfrcLZDMYYCsYOmZjcYozCTKlvrMpDFbN2wmG//t/j0DWXDOXWNPc0iGyOk
	 jLXKOs0ILRyPLwDiZpqtJ4S75eJ0sHQSWGkYLZCzEfZvu9vFlQhHlqzeY6zJ2oH+vG
	 hEDqYqb1oM2vaEFgwifnNqpDWFtd0BqehotxEhuzf7ty4XUrByZbcrtz48QnXiE0Sh
	 gW07K0So5NUSA==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4AA6740148;
	Tue, 24 Jun 2025 00:34:26 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 1AE7CA006D;
	Tue, 24 Jun 2025 00:34:25 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=AdcvOxiX;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 768DB40467;
	Tue, 24 Jun 2025 00:34:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phsc0+A6aKW1K0eBAGVNJohfR2iSy3mBJ4FE4sbCKguddJqf/67oa1EUIHE+mjlh3MMNFpX62HbzGEgR7etrQ28K9kR2+wZ8+ryoSVyO5kXwAC0YwsoA65ZwlPQVNQzuT2LUBLo3StH4esDZ4z4hGwIPOEND5QW3uN5EiJEBSm6S4l3PlbOwffJYQfs0FJEdEF6FD+LdVQcRS+459Mc6IJ5XdVgNH68lMkyKD/9OeVKnLaijwUMc18JD3tJgEy7HNIlVxEhNZHg78CCoGPYy7qL4dehzi/OF6CwTuaVqmVq8tARMvSZSwKuRvFv1NEPslghW6Xc4gLoOnLSGAiOC9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QUZoursRtCHTMK6f+qH92t1Wc6XRfBiDKA39ZjmYcA=;
 b=zQzhA+1o6BediLjhN0ceHxR3YRoDZJo2zzD/sXFEibn1Gyp7vWXzFlRSuS0rDn4v5/B32toBjrpU96q4HCRsOD46yYVTc6BEXC3r3nFtMj+KKDb8c0SQEhWnLJ2dCtKZcYl/gnZGkORxZNTlf37yrTfJxnYRw8X9gMhuiFTXRBW6pKMlvk0K6+mxRDep5ZtureohjhiFMOabHgOSl9OlFjMio4d7UwAyFh0FnN8KAdmFUHNZ/Kk3r35XCsHgEkMFTZ6ZyxumASH253OQXSEI8dxHmK/aKhXcBENDkhO0ZLeEWQyi22/l44Nl6DYl/kT6sdwQLVKLyefkEbWItFjUTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QUZoursRtCHTMK6f+qH92t1Wc6XRfBiDKA39ZjmYcA=;
 b=AdcvOxiXghN/R/BmzZaLxgUHJTCWqgfqq/ldehQJiAfs+dFnMueT456ep5oYijEvY9ahFNBr0gF+oH0Qa1xUcqAwfo3VwHG4MGotDG7vjuutd04uNw2nRk58wRzu6JQxhPy4sT8cWuIGU4igt8J7cvTrOV9vW7BaORqLcukwIRA=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH7PR12MB7139.namprd12.prod.outlook.com (2603:10b6:510:1ef::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Tue, 24 Jun
 2025 00:34:22 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 00:34:22 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: gadget: Remove duplicate check while setting
 xfer resource
Thread-Topic: [PATCH] usb: dwc3: gadget: Remove duplicate check while setting
 xfer resource
Thread-Index: AQHb4RI+APKkyq+vuEixjtH3NLQjlrQRfUkA
Date: Tue, 24 Jun 2025 00:34:22 +0000
Message-ID: <20250624003416.ao7wwnkpe5lkai4n@synopsys.com>
References: <20250619120339.847708-1-prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250619120339.847708-1-prashanth.k@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH7PR12MB7139:EE_
x-ms-office365-filtering-correlation-id: 7c2d860c-2883-42ce-af01-08ddb2b6dd3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?c3QvR3RBYWNNUS9RcnQrTFNOMWVkUzBUVFdvM3ZsVDBzeGxCMXVTdmtSNXZ0?=
 =?utf-8?B?eU10em1zekNpRnpoL0U5VWVpaTRabzlpWi90aERkVWZBRWNkWnhEU0xaK2NT?=
 =?utf-8?B?VnRlQjJlcFRLejhlcEg5OERNUEJIODJodmhBQW1OTnBUdXNrV1JNVHUvRE9m?=
 =?utf-8?B?RWhKL2lwcXh3WmNQS0xYRHAzNFd0ajhBbU1nOUgwcEMvSWxqY0V5dUNRU040?=
 =?utf-8?B?SkpFR1IwUUpvQnlDK08vaXZsaUZsYWFaN0ZWSWdweEdUL3hlditWMGJWOTd0?=
 =?utf-8?B?OVdYTzRqWXBVd1ZSdjFRMmFqd3FkUnpMM1BqVndpdW5vMXJpRm5aRzl6aTVn?=
 =?utf-8?B?WTlPelNOanRNZDJ2UjU5YnVPRitGOGI3Q1Y4alJvbkY5NVh1b2srMmFjUUJR?=
 =?utf-8?B?WDNSL3hBWUd5cmNtNXFHTHBwSlB4QnRuTU5kR1lFSWlnL0NzanFHZ09DZFdr?=
 =?utf-8?B?SjVjNW9ETmhHTEdVRjhqMlJhTWdhQlVidGVEanZWY1NQL1lzNVpWQitRUU9X?=
 =?utf-8?B?V3BuU3Q3Z05hV1JzUlhtQlB5bjdqRGtOTWh1L05KOHliWFJPUnN2KytJUUZy?=
 =?utf-8?B?S3YvM2lKWjRvKzU5MjRGNDREQzBNc250a0d5ZVZYcDczT0tMNXJQMzlSSlA0?=
 =?utf-8?B?T3A3UlBBb0FUNmZId0tUQkYwN002aEgwa0hkZnU2dm8xSUExbXU2d0FpN2tH?=
 =?utf-8?B?MmlRZ2NMSmlPcUM5ZThoTnp4NlF6N09xdXZRc2g4eUxETld3andiNTdCbXFQ?=
 =?utf-8?B?UmY4dnAwSndWOGxlSER6OEdPU0FEaWl4eXUrK2VFVlA3aXZKNElXUlgwdmg4?=
 =?utf-8?B?UjcwYmtlRUpzV1RzaHZybWYxTDBSVnhRTGE0U1JndnZ6cmYwWmJraXdJdVhM?=
 =?utf-8?B?QWc1L1AwclhTcE1nZW0wQzhGRXdUWGN4VDNMVnhQeEhFdkxBbmFvZ21JeHJj?=
 =?utf-8?B?bXNCbXRSVVFNdVhxUXo4TTNxaWo4K3hqK3J1akhUT1R5Wm9XeE5oVStZWkJw?=
 =?utf-8?B?alpNTnRCbkY5VzFkRkVDVjlRdzM0U0I4c0I0UGd2UGRmdTZab3Joem9HbDJl?=
 =?utf-8?B?YmpyR3UxU1A0Wnd4K1B6ZDcwUlJ0MVN4ZXU3bmJGY2J3U2tUYXJtZEorWUsr?=
 =?utf-8?B?TEFZbENoekJwWXNBSzRoRm1yd3Npa0dKb1NMOXJqOVEzV1BBdm4zcnJlcXU4?=
 =?utf-8?B?K1lUeStFRy9Dd29HOVZITnpBTy9VdlgzZ3hzZXZDU2NBcUpVY2ZCcFVQdklr?=
 =?utf-8?B?cVlaRHRZRUNjb3lSVWdFUVZwRXdTMzZlS3F1Zk9LUnB3b1NVUWxTbkk4bXBF?=
 =?utf-8?B?MVBqN0VCamF3bWhLMVdHakJiZjZZdEdJNU8vTTVEZCswM2ZvL1QxM29lM1ZY?=
 =?utf-8?B?TzJUUGlWQlpyNDVITmdKQnJxSDN3Vys2aVpsS3E2TGo3Q24vWlVYOUlpaFp2?=
 =?utf-8?B?d3hzbEZ0ZnZKWHZDemlsK0tsa1h0QW5WZWZDNFhnSHBTTWZ0TGhFbnpRSzBR?=
 =?utf-8?B?eHhyeFZ1RE00eERtTEthTkhidWpXckJTcjFtSUJvT1FOVzV5N1VDUHpHVk5w?=
 =?utf-8?B?OG5qUm4rSDlkeWNLQnhDQVJ1QW50UE5NNmZCdFAwbTlZRWZzU3hGWVNLMWRx?=
 =?utf-8?B?NWRPcGNHTW9NL1h4NWkvd2UzVzhTVXRMNTUrUjVjVEFFeHpxQXpHa3pYVzBi?=
 =?utf-8?B?Sy9kQUF2c0o3VFhrZWpWMXNqdHFvMlNBSkJkS3ZnUHdROG9iQXZBQTBMV2RX?=
 =?utf-8?B?WGh1MzhORnl3SWc2WDF5R0ltdE0rQStIa3FFNm1GR0dYeWt2cnZtRE9sNEsz?=
 =?utf-8?B?VS9zT1VVZDlGdlF2R0xKVko3ZjZ0QUhoYk10b2tuNXFDNWFmOEd3eWo4TG41?=
 =?utf-8?B?RXZJdDVnNjltb3p4aTU3RnRldWR3RVZIaytrMmpLSmZiRjVWUW1MNzZPZUpj?=
 =?utf-8?B?bnRmWDFCd0wzeFBCcEZqbWwyMWR1aGhIaTIvZ0U0OVE5VW5WNjFtK1VOZmNw?=
 =?utf-8?Q?RJT/u5YWWTKClrozWlGsVO3Vu23P14=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?azgzNTluZ2VsaEZCeStDUTB4WEJKNTFWNkU3MHY3ZExUZnd5a3dLQ1RXZWNM?=
 =?utf-8?B?RzlUVDNrNnFIOWNSQnlSV3M5NWNmbC9UNlErNGZkZFRKUjllRkRJV1pvbG53?=
 =?utf-8?B?cnhVS1ZkdWw3RWNwWXZJME1kRXhoa21VMHZpS2RjNCt0UzlwNWVvUlQ0Umc2?=
 =?utf-8?B?Q2dHSzdYTzNNbkttWnRuTGpJWVdZWjRPVThUUVhvNURRUldCS2JQVXpxMG1K?=
 =?utf-8?B?T2NjRERDMHFzSWJiK0lIdkFDalIzdzlZTjREVG5yTm1TVXNkOTBsQjI2WTlZ?=
 =?utf-8?B?ZnBnMUg2NFZwNHBQeG43TThjM2lwM25VZnN5M2d5UzdOckNhVW83aUF0NHhI?=
 =?utf-8?B?N0Y1UmswVFRlV251d2Fwd2EwR05XQ1hCR0JVTng5QkxicW5uRWVrbUJzNkl5?=
 =?utf-8?B?T0pMZktWZkpEaEVYNS95VXA5b3dYdzVxMlVmdkpWbmVpM0NDRDFWc1NIVWVK?=
 =?utf-8?B?eEsvV0VZdTNQTlBmYWNuOE5WK3ZIekpuUFJ5R2NkSitLU3B5d0JDZTltZHdi?=
 =?utf-8?B?YytXVEo0RlN5TmNwNjByMWtCekZ4QXJyazFjbE5seE11b1JkbnVwWmM1TXc2?=
 =?utf-8?B?Q3d4Y21aaDFXKytTQ0VjKzB1R0pLM3p2NVVKSzhuSW9CSU5Ock5UNjNUTEJH?=
 =?utf-8?B?aEJXU2paMExGMkNMQkVjTVA3cC9GUnZPeWhWbzQzdG1HaTFWeFBZSmlGM1pD?=
 =?utf-8?B?MmtOelFtYXdaNzlyMTd5d2pIdUZmWGl4eUlLc0x4NjVlWEp4T0hQNHE2VnBz?=
 =?utf-8?B?VDNYbWFJSGpwd2xUc2lBL2x3WDhKNFI5b25ja1gvV2RmWDhsZU5WejFwWjZI?=
 =?utf-8?B?RTA5cWExb0dzMVI2bVlyOXI1djNNR1BSQ1pWZk80SXhhM3pRT21lL05kenJn?=
 =?utf-8?B?d2JteTd2UGFqTTRFLzhtdzQwQk5VRnVQamxRQmhYVkoxMmlFYzVXL1g5N2Vx?=
 =?utf-8?B?UTA1b3gzOFJYK00rd2JCd2kwdUFGUVpuVjR0L3V0QjZDUDZuZDJEdVBkVzhO?=
 =?utf-8?B?MUU2emVwNUdKU0NFRFpjNkhFWkt5TlRrU3FZc3NGVXgvUXBBU3g3TkNyK0Nj?=
 =?utf-8?B?STJxckxmT3FJMGNMMUE5WXAzOER3YzBoTmx4dlpNZ1R3dU5ZbHJxT2pWSVgz?=
 =?utf-8?B?aEQrVGVDSmNPZTBDWVBvU1NxQWo0Wk9Ub3dDdDZRdTlkczdQelVlMDJBU1c3?=
 =?utf-8?B?ajFsRFc4cHRWSVFjYXB4OFN1UVdaUEpYRUE4QmhxeHRxR2t1NjZXNXhwbkxE?=
 =?utf-8?B?WHR1blhYOFZ2SVFxK2tNOC9pWkNXUDYvWTgyODd6QSsyOExXMENRU2ZNdytx?=
 =?utf-8?B?M3FXU1Q2RnphSUpuYUwrN1ZzZGZsRjFWdjluRllWeTU2cEtGVlZZcnBFR1JO?=
 =?utf-8?B?Q3F1bHVVRGNDRmltSVB1TEUxS2o2TnUzVFJVV2FBNlFDVGFORXYwNkI0cUU5?=
 =?utf-8?B?NWJpaCswMUZJYTVpU2JoT0JLQmdpM3loTVV2RndIV2JubVVvRnd3SFM5SlNU?=
 =?utf-8?B?Vko5UGsxM1l6WXlLOGJML2lBVXRHNG1hNS82TXc5ck1SR2wzOWRiamZBMnFy?=
 =?utf-8?B?N0UwUnVnVFZJTG05UW9ZZDJhM012dHZEaHNJTktVczRqRU1mN3E0MTU3bGJH?=
 =?utf-8?B?UnlzT3JmSjY3K1hLTFpWbXV3SGxycXNUUkc0ZzYrMXcrYjVyc3FIRFg4anZU?=
 =?utf-8?B?ejMwK1RrT1lHY2lzb2t5eDUzNGdIQ2VjY3VydEVicGtHL1dUMUl3U2NSQzdj?=
 =?utf-8?B?YlhHaGdlY25RNHh0bnRBOGtrZC9SQ2czVHNiT09sb0hjcCs2VTdEZUxkd1JG?=
 =?utf-8?B?aXFCZW1DaTF5eVJxOEppN2tHU0d5ZHJ3YW9mVWRIK3JsM2JTOGJReVd0Nk9p?=
 =?utf-8?B?eXBKR3hzL3M1dkpGREtNL05rTlU0NnkzR2ZBbGZKY1Y3ZkdjSEE2dFptaVJq?=
 =?utf-8?B?SVNMTEg2aWMrbExLU2oyWE4zOWhtR2tub0pjcXFyU3JmZVhlL3J6RWJRUUhW?=
 =?utf-8?B?QmhOMmlQc09pRUkxdzl2eDd3bHQ2UUNNMlBHUGg2R2NyUzhzNVZMNlJ3Wktv?=
 =?utf-8?B?SGZEVGpRc24rakh2QzQxUTFXVEpVYUplTldLZXkwMU5QRGtMcExDV3pSWU1S?=
 =?utf-8?B?Y093MFlIYmVPNGozTi8wbStmcFpieDEzN05vVGVZZ3ZEZHFWWUtxbGp3cFY4?=
 =?utf-8?B?YkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B29BD3F20ED4B4ABCC8FB67A9B13A4D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UwToB83yXSiAWDnYHFOAh+PRIpqcoiDQZGVFH83N+8SIOxacXfbO+fbLtVqPopqUArtWzjvqyQp9nZWt4pZFhzbZpDF1MfLzttrZlXb55onx7ArzhXT0GfpS7Dsed8JFcOBopq26UiTVCYRyp6jwplpY8Wcb4xikiGEXJCBNBR5ApBrMcSKQeCcykShMTZfyEd08axb3Q4LMr855UHy0yQzOnP8ObP1AfbaNlnyKLMrdFktFJfWPqRBEfwErYsBjDtikPi4/T58llx3CZknhD1XC0LIHpCCZmGc21RoZmJ12i2aIRYZxBb8ZWfs1gMAY3ijAmrnZIbRjOvbfvDn3Kfocj5kdIXC0fP2DKZnJnz83urHNOQ2JthjFollVj9git5EOcgj7tCDMzsjS0BohPxPTwiZx7SEg+ez6r7n55jidxhnSoY97NHuAjoB5o2U83Rg78nNMslDpmiUtb1oI1C7h7Q2+BawM7ARg/qgFLUuqFhz545yEQ9zslLnvNxYjmT5TGOOsBzeFbPY3Ke3kd13xjF+3u1RFI+fDYNk0JT7dIHgJZjXetS1Xxj/fYxZVcvuAKEAWoqQs5wxEuwUXXT4vM+WpZISI96siJ03dgkOJBzG5EzhQNVlyEno+sdaO25Xww9KH7UdkGfWl/ixofw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c2d860c-2883-42ce-af01-08ddb2b6dd3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 00:34:22.1555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9LnmQC29Gyw7AN2IwGs9CHs+5C8aKv7Yv7DqqMiWRst3Hh6XX/ttGV5tX0W5p5d93IgbQQUmJ3sAkYt/cin3Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7139
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDAwMyBTYWx0ZWRfX6Uw04j6ufOSs
 HsEx1B7E8thD38rT8v6BeCEjCIyLd84jree2Hf78KpR5lOhKJYNY9B1m5I2Lh6GXF5Mu8E3anLp
 CZuZNiEKGHXU6CXYsu0GRrARdEHIevu6Bx+OJ0vjBPjpKRO90ND+2mUpmpycQmTHFoRfqvfeOZO
 2H55I8ICdGfWWEitrXU2JsyAxpi2Z2BUhxK7Jw50cPM8OcRBkurKh3dr/rebaOdWO7UGoQL0RCd
 slfAJ2IEVurakeH7jtdWmLBkBwwdzO9Cape/oJKFpAR4ErWqB5sXVjqRh8hEuNHIa87eo++jJD/
 9JQ5ze2tf08CSTu336KQegV98f7MsYgTiPVZ0TSGHmrQWsrVhQLRTMr0tjO2uwJFdDogkgaRWah
 QT6UiVt77irU76cajsU3Ofd9Fvb3+kIYyxE8xS6UFMqA4tzbuQCnT4HxGFURd6fbhvCAYUbH
X-Proofpoint-ORIG-GUID: dGedJTbGha8zkBJdw1v0cy-hq5aj0rJe
X-Proofpoint-GUID: dGedJTbGha8zkBJdw1v0cy-hq5aj0rJe
X-Authority-Analysis: v=2.4 cv=KMdaDEFo c=1 sm=1 tr=0 ts=6859f293 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=qPHU084jO2kA:10 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8
 a=e8CaUJmD8Ta0SuDp1v8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_08,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 mlxscore=0 malwarescore=0
 mlxlogscore=819 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000 definitions=main-2506240003

T24gVGh1LCBKdW4gMTksIDIwMjUsIFByYXNoYW50aCBLIHdyb3RlOg0KPiBSZW1vdmUgdGhlIGR1
cGxpY2F0ZSBjaGVjayBmb3IgRFdDM19FUF9SRVNPVVJDRV9BTExPQ0FURUQgZmxhZywNCj4gYXMg
aXRzIGFscmVhZHkgY2hlY2tlZCBpbnNpZGUgZHdjM19nYWRnZXRfc2V0X3hmZXJfcmVzb3VyY2Uo
KQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogUHJhc2hhbnRoIEsgPHByYXNoYW50aC5rQG9zcy5xdWFs
Y29tbS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyB8IDggKysrLS0t
LS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyBiL2RyaXZlcnMvdXNi
L2R3YzMvZ2FkZ2V0LmMNCj4gaW5kZXggMzIxMzYxMjg4OTM1Li5lNDVmN2NiMTdkNzIgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gKysrIGIvZHJpdmVycy91c2Iv
ZHdjMy9nYWRnZXQuYw0KPiBAQCAtOTI0LDExICs5MjQsOSBAQCBzdGF0aWMgaW50IF9fZHdjM19n
YWRnZXRfZXBfZW5hYmxlKHN0cnVjdCBkd2MzX2VwICpkZXAsIHVuc2lnbmVkIGludCBhY3Rpb24p
DQo+ICAJaWYgKHJldCkNCj4gIAkJcmV0dXJuIHJldDsNCj4gIA0KPiAtCWlmICghKGRlcC0+Zmxh
Z3MgJiBEV0MzX0VQX1JFU09VUkNFX0FMTE9DQVRFRCkpIHsNCj4gLQkJcmV0ID0gZHdjM19nYWRn
ZXRfc2V0X3hmZXJfcmVzb3VyY2UoZGVwKTsNCj4gLQkJaWYgKHJldCkNCj4gLQkJCXJldHVybiBy
ZXQ7DQo+IC0JfQ0KPiArCXJldCA9IGR3YzNfZ2FkZ2V0X3NldF94ZmVyX3Jlc291cmNlKGRlcCk7
DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gIA0KPiAgCWlmICghKGRlcC0+Zmxh
Z3MgJiBEV0MzX0VQX0VOQUJMRUQpKSB7DQo+ICAJCXN0cnVjdCBkd2MzX3RyYgkqdHJiX3N0X2h3
Ow0KPiAtLSANCj4gMi4yNS4xDQo+IA0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5O
Z3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFua3MsDQpUaGluaA==
