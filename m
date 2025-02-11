Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210B3EC5;
	Tue, 11 Feb 2025 01:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739236615; cv=fail; b=E00sFjxc5Ygy9Tz7C6XfHY/1RLvKpFbnCRSjCTTf6sRvjDoao27pN3qPCN9X9AlLIZcHxOWcm8Bsx3RRe3xP4G+LVgZuU1Wchd//ih6WcSSol/k0IZYfJq24BKAQ5Z1UgCThL5iCxIGqnAfcDbBtW2NAL7bpXc8iV88h5m8sgz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739236615; c=relaxed/simple;
	bh=fKGgM8I7jx6MvusNfUseFsfzJnWbdjaOYIDnNxzWabw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EiUAPS4DabSQvgdMEnc8STk0ooCQj8b9mA4HHvIZgbDshWB/dYQwaO6hepXTfo9KKxvQb3VSVg4tPrTjOcEFbZ+WVLiULK9Jl6aNXKWkrO03PqRm88UwT2/knLWRkxUVAaxAZZH+sY96kwr64s4vQyo8uyvwm9YNMuHPPF0VhMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=gVlM8lH2; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=bg/2iNy+; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Wk4bpWUB reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gVlM8lH2";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bg/2iNy+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Wk4bpWUB"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ALe3D8004335;
	Mon, 10 Feb 2025 16:22:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=fKGgM8I7jx6MvusNfUseFsfzJnWbdjaOYIDnNxzWabw=; b=
	gVlM8lH22pd9Jf6wr/cYXNhHTi0HcanXobDgmHbXlKl1664CpElnyKrEUAGTr3lD
	QbQWJ3nUWsUs5cMjqJRFVTk53ntBFarwdls0Rxxs4m1HObAuz2lB3mE1HWz8a/Zu
	5gA3I/70wf0MeBNX4EzWirFIreCq2rHU93HLlm94rpehyJGxF/RjcuAf0zM0kCzO
	7D52T4QCGibX44g0fiLmuNUIQQzT9v8tGVbx53Rm3WKo+FTKy8W04bo3S0k5LYmn
	o8/tJa2S9R6iJTxkzXCPFI2LO+AeFLI8cLhJ0S1vcbJf+6ILw6u4u1ZyWaD5g1R/
	Th43/AIsRCJc+3TkjKFQMw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 44p75t29bx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 16:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1739233337; bh=fKGgM8I7jx6MvusNfUseFsfzJnWbdjaOYIDnNxzWabw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=bg/2iNy+i36ftYKsSAvv8Cb8qx5khXUQ1BX5f3Fjpb6k8x9KTv/EojnGL7uluOMyM
	 eCTZQGyhC3IAwaRPnFgimwDIaCBjA3Il016NNDz7+odh44+NZIB9Kc9iL8XKM0L6oo
	 84LCU5MN+gQuIzmjVTPulv1LCLvVJjLShmSsio2y9v66Ds2Uh6pH3LiTzgcb6To2Zg
	 hZpGbtrzHo2RPSYC8SOMhr5KXhKmzGKpTMl3rS2KmLYMqsi8auPjpXmPE5vogkZXFC
	 Hr0q52p2c9sFZ55hpTsNA6yw6cPtbJKiQW7oHgRvI+6tuAqk04VAcdnhxume54REg8
	 eL5dM6/R1en7Q==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 07AED40143;
	Tue, 11 Feb 2025 00:22:16 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 6B690A00D9;
	Tue, 11 Feb 2025 00:22:16 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Wk4bpWUB;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id F08A74035A;
	Tue, 11 Feb 2025 00:22:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jt2agjceaEC4lx1cGdRqHCG1CFwK9yPYsX18r1KkPX7sf3E34PSURkNJC9KdCuw0H0NdF3ERK+66lB2v9BCMhChqtoghulc+VhaWBGrlA5JNHVmyGi4mDAafgovALoBGU217L0KSBX1Y7CGsv/nRnIYZdx89NY1hmAuDJif6atboF/So1wGdfh1y8FKqZFTPJeuTgiWlMxdh8Bpy/1JTgvad4PtosfjC0EDOz04+p1OzX/yOaXqTanyenxaiUPtHeIfVeENJBRzB3jbKkKjTgynlsAdXV9cL8O/uIDwCfiQWIO55bCIwZ/Sgpl2iuaG/mfo1PY+SgiJL+8542iEWWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKGgM8I7jx6MvusNfUseFsfzJnWbdjaOYIDnNxzWabw=;
 b=Oxuf0683cJCXDlPxyG+nBVGoFmCBKXb/mVrQQSNwvu7D0hvXIq4qo5iJsISZwAlqud8y5dD1pCYa1OtC842KAxo+t2mYXX7BFSYtRvc5nuypvulgoaW6w87CrH/xhCNxIWvgQBuqx5RsFAxhdOqJkcWGcUXWembbTMcHvKfgBuDdF6yNEzdyPYzH/fnaEezWXQscI08Ewau1VJt6hmw9uCzS9P52ui65gZ9KERQtYdXSgs9ScXVQWFfSaCTHxghkUDnybw/0hhAdEzyAItUsbojlsPObc9mFVBIaiEkYMsKhqSv9TW/c3AXv73FWeuhiceazBK+d7BU1yT14ft2M6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKGgM8I7jx6MvusNfUseFsfzJnWbdjaOYIDnNxzWabw=;
 b=Wk4bpWUB1bdSwI5gXNsGqlwxrFBKBam/9C1kSMJ/3N6bujnUzvY7cLgcVhRD/bDFa5VPG9ETQme2b6gMJ+y5FUsx+p13x+CjZfFEqo7eCzuLhRHpjgM07rp8wke9jZdw5/2KiMODPKvreM5vddrRq9azqPmcvv8aC3YiHiZhbQw=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS7PR12MB6240.namprd12.prod.outlook.com (2603:10b6:8:94::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 00:22:07 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 00:22:07 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Badhri Jagan Sridharan <badhri@google.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jameswei@google.com" <jameswei@google.com>,
        "stable@kernel.org" <stable@kernel.org>
Subject: Re: [PATCH v2] usb: dwc3: gadget: Prevent irq storm when TH
 re-executes
Thread-Topic: [PATCH v2] usb: dwc3: gadget: Prevent irq storm when TH
 re-executes
Thread-Index: AQHbedn1961r6ZprVUadJsXbsNP087NBQjWA
Date: Tue, 11 Feb 2025 00:22:07 +0000
Message-ID: <20250211002155.62lyfqjlygod7cdp@synopsys.com>
References: <20250208033129.3524423-1-badhri@google.com>
In-Reply-To: <20250208033129.3524423-1-badhri@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS7PR12MB6240:EE_
x-ms-office365-filtering-correlation-id: 48fef3e3-a840-4570-fa94-08dd4a321e25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZkM0S3g2aURDOS9HK2lzREhPdndSRVdlbVhDcjJSczBUR3R1bHhucGpRL1dj?=
 =?utf-8?B?MnJIdWc1S3RYdzZQd2pITFg5UFkyQVViSEZtZ29BSXZKVy9rZ2pPUVBJN21U?=
 =?utf-8?B?TXlZZ2xNN3FGSHZRdFYzdjFOcjN3ZEZTcDRWVVRHV0VOV01ldExCcmhMaDBr?=
 =?utf-8?B?VXZPRFhHL0pFOUl5SldtcGlIdW1tdWx2WlpxSHpvUC93am50eHFLZTVwdjNJ?=
 =?utf-8?B?bG5pcVFmd3RMZDd1c3hURXlIbmNOa1lVcVYzNlZOVnJNU293UmlFakZ6MEd3?=
 =?utf-8?B?QmJOSkdLTVUzSVZDMDBkUDl5TWZiMFVkeG95VFpoMHJtclptZk5yQlBRc0Fa?=
 =?utf-8?B?SHROVmM2MHZFa1JlYWFVdFhQbjA5dXVQa1oxMDFmNkJWYTRKZnNVZlBERThS?=
 =?utf-8?B?RVZoVWZ5dFRXdkVPU0FXUS8rMG9yeU1VK2tyVlBSQXJRUjBNTFVOR1REUEY3?=
 =?utf-8?B?aDhpaVE1VlNWOXJDUXM1MHMwSXlOT3BZVk4wY1lKK29heS9TOEZKMFRvUlM5?=
 =?utf-8?B?UUh4Yno0TzVTb0NxcllFZVhFSHpGMVhIWXRYUUNEc2pTenlBNE02NzQrUHNm?=
 =?utf-8?B?dWxoSzRkWlpodWxXdXBqZTFaL1JHZW1CTWQveTdTY2JsQWVlQzZlSnc0SEN3?=
 =?utf-8?B?eW5UM0FnaG5vcUR1U2NJanZWSFZSdnl1bk1HeDlxblF5S3JWL09TaXRCR0RH?=
 =?utf-8?B?QkFHOFdjeHNjRjkreGNvbjZ6YUErUWtPYmF3bTdEeEZXVDJDYjRlajZYSzd2?=
 =?utf-8?B?bDJtZlBtZFUyZHpycC9WMjIzZjNuU1diZURYR0ZTajJwWGR3eHlPSzUzdmYw?=
 =?utf-8?B?eXR3ZThyY0Q0SG5NaWtMMXFiUmNyMEM0eVUxK2IxTStWTWpaY3FjelFaYjRG?=
 =?utf-8?B?YkdxL3ZMRGdGWUY3OE1NMDNnakI4ZWN5NlFiUzZyVVUyZ0lOK0V0N3dFSFpx?=
 =?utf-8?B?L3ZzNVBMNHF5NFJPVE1XVVhEK3F4Z0pEVytxTDNuOHVqQ3poenhXU3l4bEJE?=
 =?utf-8?B?dU4zRGNnMGZabEwrMWxVM3VBRVcxeUNKVEZ4NlBYZUNrV0Y2Vy9yTUZRZUs1?=
 =?utf-8?B?RmtpMmxUYlN1c3p1K1pPSWRCOHhUd1dvTEw1WDZqaUQwSUdTdmVjS0VmZGlo?=
 =?utf-8?B?aWxEMERzRzRwYUJSQVhnekhpNlU0VXZTMFhEZnZ2a3F0K2YrNzVtNXY2aTlp?=
 =?utf-8?B?QjQxbDFBczlQNTZCN1pRMVlzRk1zVmlSWTZrbVJIMG14YnY4U0JuckkrelAr?=
 =?utf-8?B?MFErNE1oK3FCbFhYbUlOcVdsOWRrRGRHWFBja3c1V3hMczdzaC9YbVU4N29l?=
 =?utf-8?B?azFKSXg1YVNCVWpzZEozbGhqNExweTZNRmNadTBtWkc5TFB6REpVQ3dxd050?=
 =?utf-8?B?dXhqNFBNdkdOckE2UWhRaHZFTG5xaHcveU1qaHRZNEVETXNYaERkWHJSbHJR?=
 =?utf-8?B?UndCZEZUN1ZtTGlUakFmVVZkNjBRWHk1MlRMa3ZWQ3lvakxPKzQvZUFVY0Nk?=
 =?utf-8?B?eUxmWXVjdElzZlcxTklnM2xrSjZCVkxpNHlNUE1mQndPWlZQNnVUam8zUEV6?=
 =?utf-8?B?Z0lobXQxQld0cFRHNlExMTFsVlJUU2FLclFlajIyZld6UmErRkpPZnAzU0I5?=
 =?utf-8?B?VFpIOWxxWlRBQW5sZjVUR2VaYmtDT3l3YWlPNDVkV0FPWHJnZWdXQWhFK3NZ?=
 =?utf-8?B?T09YVkZNU0lBalByZVdmcHo3RTE2cGhVNFZPSXF2SUVMRkRNYkx5UXJ5RGFX?=
 =?utf-8?B?ZU9DNDhvOWNZS0FjblVSWDdFazE2dzQ4ZlF6c1VuSnlDZlhCQ0VJQ0QyMFV6?=
 =?utf-8?B?TGxsVUpYK00xTjQwb3dQckpkQ0tGRTUvUUVCN1drTmpoMHpydjlFYXFQQXp0?=
 =?utf-8?B?QTROeEM1aHA5bU43aFNiUDFaVDZ0bU9JTlRFeTVybm4yamEzWFBkSCtyd2pY?=
 =?utf-8?Q?kuDFV3EG6mNj23Zm+nOB1mjnY/6m0HRZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d0diZlA1ZGRyVW1MNDFDYkNyS1JMdE90anFGUkl3SUdHYW5WV3p5bjJka2E4?=
 =?utf-8?B?eEJ4UDZ6ejNzUG5kc2ZWVnFQRmRtbk1rWGRVbDdGUWV2eG1iNVFFd1lpM3d1?=
 =?utf-8?B?L01GNGpsc3RpUW5sMXAzZW5nVGpWUU5MTzdFaVdkSWUydHY2WXhmQitnV2tY?=
 =?utf-8?B?WGtVTmkza01ybDBrUlZrMGZtazQ5WjVLelZ2dlRNMkkxQURxVzdranNOcnE2?=
 =?utf-8?B?MzJCenk4YWFSVzBaWXNRNWNqOWp2NmlwY08rWHp0ZTMvQS90UjYyS0M1VkZq?=
 =?utf-8?B?ckFCSG9kOWpIYjJ0ZWhhL1J2WkdHc2hRSXUvVjZSbnRpSzFDclVBT1NsYVY0?=
 =?utf-8?B?M3VDRFkrNzhMRU5yMlFET0R2ZUxqNVh4dVpqZ1Q5UysvdWhTamZBRXRCSnp3?=
 =?utf-8?B?YTh6bjB4UEZldHRmSEJuTzQ0VVp2c0JEUkZXVnhlMWFYWElybkFLbTFQMFNt?=
 =?utf-8?B?WDRMR0k4VXNmVlBMYUVqN050YUFjYWg1T3VzTmFadUZ2VTN6MVZCM0ozbXcz?=
 =?utf-8?B?ZlJEYjQ3QmVRd2JGRzFjSHFueXoxWUFnMURlWGlJNFJ5eVNtQlZBV0ZJc3Ri?=
 =?utf-8?B?VGJFKzFKa215c0NhdjFwei9QcUdTajk2MEh3ZUN2WFpPTElPZ2hTcDNMbTJ4?=
 =?utf-8?B?TXd1bnBscG5vTWs0U3kyWFJMY2daS3BCaDRmMmRZSXlwc3VpdG84M3FsSHFR?=
 =?utf-8?B?ZEh3aHlNdXcxckVZeGwvL1g5ZXI0TUxIbnlVVWYzRWl4clIxVGhaSzNtZzNm?=
 =?utf-8?B?ZVB1T0Zpb0t6RmFvOGZUZjZwY2RHRGtQM3dkRVNkUFhLbDJsVzh3YXJlVG5L?=
 =?utf-8?B?aFB6MlU4TFRzSWo4bjBBUXJJRDhsU2dRdVFwWEhtWlRLL2w4V2wrSmkyWGRR?=
 =?utf-8?B?elpxbFhDU1FDYVErelBWZS92UGhLMStGUVFBeDJ3M21WME5xN1VnV3FCN09P?=
 =?utf-8?B?VDhWVGlJYzRLSGNaN2t4b2pJMDdlRGQ0Y1IyYi8yeURRTXR6N3BBc254Ulcv?=
 =?utf-8?B?REJOeVBOUFMyNVhPVWdjQlA4SmJEMmlhWWdrNnpHNCs1U2JxRTNFU2o2QzlE?=
 =?utf-8?B?MDY2OFhKTmc0ZzZpQnNMKzd6WlZ6OG1nd25Jd3BSVjBTc2ZoemxzaUlDcm1L?=
 =?utf-8?B?SXBwTEtTOVVVVkNJek53ZVJxaHZhTlhxNEJveHRDNWNUWUFVUVZpeExtdlh5?=
 =?utf-8?B?c0hQejJZTHVEWTBTOE8yQ0hzYWxZb2w2WHZ1endDa3pHWnVoSGkxaHRWQUtJ?=
 =?utf-8?B?Mms4M1p4ZHNoNHR3ZU9maU9qK0MvTjAzRnVmejhUNXp6Q2N0U1pGZ0wxTGpQ?=
 =?utf-8?B?YjluNHJ2KytLN1RuRFJSTTYrU1ZlR2ZILzI2VmpBR0hpL2pVdXNNaFd1cTlP?=
 =?utf-8?B?Z2dWa3VaQ240Q1RrWjNlUzN3V2Jabi9VSjRCMXNZR1MyeVhYV25vOStKYlNu?=
 =?utf-8?B?NnQ0MGtDRWFrRTlwVmdJWDl5MFNiOHBhYTdhNlRsSDlrQkdUb2lpSmdodS9S?=
 =?utf-8?B?aTVXTG9NWFFzcUtzd3Q4MXhkalpyaWJoNE9BVVdoZ1IxNFY5bC8rK0wwREJZ?=
 =?utf-8?B?T1lCTDlvUzE4SlUxWllUVUVHa2d2U0MvRnl5ZCszbWl5MGtlaXBEOFNUQWhR?=
 =?utf-8?B?RFRRZkFKdzlTMWEveXJoaGRoaE1qeDBwcWpjOEFrUU5QczRUVTN2VHhKSVpj?=
 =?utf-8?B?UWZFSjBPUHcwTXpveThLYjRMNStjUW9UY3FUOGlGaWxISVZ2Qk9XNWZoZzZ2?=
 =?utf-8?B?dUc4YmFOTE5nTGluN1VqYUp0VkZPZnJzSTBHRGlVVkdTSHZibzF5d0llc1l1?=
 =?utf-8?B?NW5lZzRrTDdjSDR3QU1PZkkxMEFCZDlrZDNHMkF3Q2ZBbks1L25WNjdXcW1M?=
 =?utf-8?B?eDVQS3NlWDFCZHYyUFV6SnluRmJFTHdObm1lU01oc3BUNUtpam90ZGNiUFVv?=
 =?utf-8?B?S05RcTY5YzROQUpXTEtkUEhEdTVpbEJZc1FhcDVDaGlCSDZ2S0g0aytkd3Nn?=
 =?utf-8?B?T1F6MlU2M0JmSFR5MlFhL1VuTVR6cUdjNkdPcnljYzR5aXZXTndGVXlyVzE1?=
 =?utf-8?B?K3RUenJOUnFKNDRuOVYyeHk5SjArWXREWUFtdGJFbFU0aGxDZkhpVE83VC9z?=
 =?utf-8?Q?KqzbHuPumvFSjIVunFNTwTSMY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <721618F0E0693246BF6C3CB06AA704B0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HlD+9479xfcqltANiobRh37YsIjC3VBOoZU/HQjMtZR5CiPdphN1IDiLflcVLT88aarL7nbbggr/X14QhCdRnQ2aaG0HE4W5+xnufnJnK/VqhwyMi3remy0eSeC+M0R9IUzItZIK101zEUZx67aWxtsI/oGVFt+N4NfrAbRKWZsEodouWzCvWrYzABFGEj1f7AdISIFcyUQNDMHoXI1IeDbt0r1XaldTToL0hdgv2fpkUvK6DbVFrUjxdnnAVZZPNir33JxlNqjAmYl8Hm8dVga9tBeweSRDKIR8eUx/wn4qJ1z0M2RW3ReOj0wUM1yz4ddoDxwEmyM6IUlrmU5UlfWgm9f9+nkJPBoq3jaDP1Ur2d489r2rOR36+btrUCbRkki+l8cDIPrS4LO5G9MMquT7W2iam4pMnIe5Qv0R7Dvn62HaYeBnlBMvs4EyCadurngAqx6Te9gQmxRUn+wEZYkLUcKexyDcfKoXYVKNLsuumn07PMlXWIwDeeoHTvDb33vkpRGnUVY+Y33ZcEY5sT+oXSpLqOXj+SRS9qlA9bbZAbmBkELX94ZiYcYWkxlHvCoJrMAwWhRD3yXM9Z2ljJDMqZYE5xa2fersyXtL/7Mo6b3OYFUPmTMOlWCG/5jjUFLvVdK5vRENAB8UBcaD3w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48fef3e3-a840-4570-fa94-08dd4a321e25
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 00:22:07.0484
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G31hb8wCHxR4UkGhekeKR1NJhALsgRnUCsRq+IDjm7oQZJNf3mpzq5SKhXmMnhH3/BHVXsU+/TwZmXBa423hRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6240
X-Proofpoint-ORIG-GUID: hgVrrs9cjWyM5XdT3EL81R11BqADCZAB
X-Authority-Analysis: v=2.4 cv=NJEv+16g c=1 sm=1 tr=0 ts=67aa983a cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=T2h4t0Lz3GQA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=jIQo8A4GAAAA:8 a=1XWaLZrsAAAA:8 a=CNmMPybmIQZq2W8Lc3cA:9 a=QEXdDO2ut3YA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-GUID: hgVrrs9cjWyM5XdT3EL81R11BqADCZAB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_12,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 mlxlogscore=974
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100180

T24gU2F0LCBGZWIgMDgsIDIwMjUsIEJhZGhyaSBKYWdhbiBTcmlkaGFyYW4gd3JvdGU6DQo+IFdo
aWxlIGNvbW1pdCBkMzI1YTFkZTQ5ZDYgKCJ1c2I6IGR3YzM6IGdhZGdldDogUHJldmVudCBsb3Np
bmcgZXZlbnRzIGluDQo+IGV2ZW50IGNhY2hlIikgbWFrZXMgc3VyZSB0aGF0IHRvcCBoYWxmKFRI
KSBkb2VzIG5vdCBlbmQgdXAgb3ZlcndyaXRpbmcgdGhlDQo+IGNhY2hlZCBldmVudHMgYmVmb3Jl
IHByb2Nlc3NpbmcgdGhlbSB3aGVuIHRoZSBUSCBnZXRzIGludm9rZWQgbW9yZSB0aGFuIG9uZQ0K
PiB0aW1lLCByZXR1cm5pbmcgSVJRX0hBTkRMRUQgcmVzdWx0cyBpbiBvY2Nhc2lvbmFsIGlycSBz
dG9ybSB3aGVyZSB0aGUgVEgNCj4gaG9ncyB0aGUgQ1BVLiBUaGUgaXJxIHN0b3JtIGNhbiBiZSBw
cmV2ZW50ZWQgYnkgY2xlYXJpbmcgdGhlIGZsYWcgYmVmb3JlDQo+IGV2ZW50IGhhbmRsZXIgYnVz
eSBpcyBjbGVhcmVkLiBEZWZhdWx0IGVuYWJsZSBpbnRlcnJ1cHQgbW9kZXJhdGlvbiBpbiBhbGwN
Cj4gdmVyc2lvbnMgd2hpY2ggc3VwcG9ydCB0aGVtLg0KPiANCj4gZnRyYWNlIGV2ZW50IHN0dWIg
ZHVyaW5nIGR3YzMgaXJxIHN0b3JtOg0KPiAgICAgaXJxLzUwNF9kd2MzLTExMTEgICggMTExMSkg
WzAwMF0gLi4uLiA3MC4wMDA4NjY6IGlycV9oYW5kbGVyX2V4aXQ6IGlycT0xNCByZXQ9aGFuZGxl
ZA0KPiAgICAgaXJxLzUwNF9kd2MzLTExMTEgICggMTExMSkgWzAwMF0gLi4uLiA3MC4wMDA4NzI6
IGlycV9oYW5kbGVyX2VudHJ5OiBpcnE9NTA0IG5hbWU9ZHdjMw0KPiAgICAgaXJxLzUwNF9kd2Mz
LTExMTEgICggMTExMSkgWzAwMF0gLi4uLiA3MC4wMDA4NzQ6IGlycV9oYW5kbGVyX2V4aXQ6IGly
cT01MDQgcmV0PWhhbmRsZWQNCj4gICAgIGlycS81MDRfZHdjMy0xMTExICAoIDExMTEpIFswMDBd
IC4uLi4gNzAuMDAwODgxOiBpcnFfaGFuZGxlcl9lbnRyeTogaXJxPTUwNCBuYW1lPWR3YzMNCj4g
ICAgIGlycS81MDRfZHdjMy0xMTExICAoIDExMTEpIFswMDBdIC4uLi4gNzAuMDAwODgzOiBpcnFf
aGFuZGxlcl9leGl0OiBpcnE9NTA0IHJldD1oYW5kbGVkDQo+ICAgICBpcnEvNTA0X2R3YzMtMTEx
MSAgKCAxMTExKSBbMDAwXSAuLi4uIDcwLjAwMDg4OTogaXJxX2hhbmRsZXJfZW50cnk6IGlycT01
MDQgbmFtZT1kd2MzDQo+ICAgICBpcnEvNTA0X2R3YzMtMTExMSAgKCAxMTExKSBbMDAwXSAuLi4u
IDcwLjAwMDg5MjogaXJxX2hhbmRsZXJfZXhpdDogaXJxPTUwNCByZXQ9aGFuZGxlZA0KPiAgICAg
aXJxLzUwNF9kd2MzLTExMTEgICggMTExMSkgWzAwMF0gLi4uLiA3MC4wMDA4OTg6IGlycV9oYW5k
bGVyX2VudHJ5OiBpcnE9NTA0IG5hbWU9ZHdjMw0KPiAgICAgaXJxLzUwNF9kd2MzLTExMTEgICgg
MTExMSkgWzAwMF0gLi4uLiA3MC4wMDA5MDE6IGlycV9oYW5kbGVyX2V4aXQ6IGlycT01MDQgcmV0
PWhhbmRsZWQNCj4gICAgIGlycS81MDRfZHdjMy0xMTExICAoIDExMTEpIFswMDBdIC4uLi4gNzAu
MDAwOTA3OiBpcnFfaGFuZGxlcl9lbnRyeTogaXJxPTUwNCBuYW1lPWR3YzMNCj4gICAgIGlycS81
MDRfZHdjMy0xMTExICAoIDExMTEpIFswMDBdIC4uLi4gNzAuMDAwOTA5OiBpcnFfaGFuZGxlcl9l
eGl0OiBpcnE9NTA0IHJldD1oYW5kbGVkDQo+ICAgICBpcnEvNTA0X2R3YzMtMTExMSAgKCAxMTEx
KSBbMDAwXSAuLi4uIDcwLjAwMDkxNTogaXJxX2hhbmRsZXJfZW50cnk6IGlycT01MDQgbmFtZT1k
d2MzDQo+ICAgICBpcnEvNTA0X2R3YzMtMTExMSAgKCAxMTExKSBbMDAwXSAuLi4uIDcwLjAwMDkx
ODogaXJxX2hhbmRsZXJfZXhpdDogaXJxPTUwNCByZXQ9aGFuZGxlZA0KPiAgICAgaXJxLzUwNF9k
d2MzLTExMTEgICggMTExMSkgWzAwMF0gLi4uLiA3MC4wMDA5MjQ6IGlycV9oYW5kbGVyX2VudHJ5
OiBpcnE9NTA0IG5hbWU9ZHdjMw0KPiAgICAgaXJxLzUwNF9kd2MzLTExMTEgICggMTExMSkgWzAw
MF0gLi4uLiA3MC4wMDA5Mjc6IGlycV9oYW5kbGVyX2V4aXQ6IGlycT01MDQgcmV0PWhhbmRsZWQN
Cj4gICAgIGlycS81MDRfZHdjMy0xMTExICAoIDExMTEpIFswMDBdIC4uLi4gNzAuMDAwOTMzOiBp
cnFfaGFuZGxlcl9lbnRyeTogaXJxPTUwNCBuYW1lPWR3YzMNCj4gICAgIGlycS81MDRfZHdjMy0x
MTExICAoIDExMTEpIFswMDBdIC4uLi4gNzAuMDAwOTM1OiBpcnFfaGFuZGxlcl9leGl0OiBpcnE9
NTA0IHJldD1oYW5kbGVkDQo+ICAgICAuLi4uDQo+IA0KPiBDYzogc3RhYmxlQGtlcm5lbC5vcmcN
Cj4gU3VnZ2VzdGVkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+
DQo+IEZpeGVzOiBkMzI1YTFkZTQ5ZDYgKCJ1c2I6IGR3YzM6IGdhZGdldDogUHJldmVudCBsb3Np
bmcgZXZlbnRzIGluIGV2ZW50IGNhY2hlIikNCj4gU2lnbmVkLW9mZi1ieTogQmFkaHJpIEphZ2Fu
IFNyaWRoYXJhbiA8YmFkaHJpQGdvb2dsZS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdj
My9jb3JlLmMgICB8ICAyICstDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIHwgMTAgKysr
KysrKy0tLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgYi9kcml2ZXJz
L3VzYi9kd2MzL2NvcmUuYw0KPiBpbmRleCBkZmExYjVmZTQ4ZGMuLjZkZjk3MWVmNzI4NSAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gKysrIGIvZHJpdmVycy91c2Iv
ZHdjMy9jb3JlLmMNCj4gQEAgLTE4MzUsNyArMTgzNSw3IEBAIHN0YXRpYyB2b2lkIGR3YzNfZ2V0
X3Byb3BlcnRpZXMoc3RydWN0IGR3YzMgKmR3YykNCj4gIAlkd2MtPnR4X3Rocl9udW1fcGt0X3By
ZCA9IHR4X3Rocl9udW1fcGt0X3ByZDsNCj4gIAlkd2MtPnR4X21heF9idXJzdF9wcmQgPSB0eF9t
YXhfYnVyc3RfcHJkOw0KPiAgDQo+IC0JZHdjLT5pbW9kX2ludGVydmFsID0gMDsNCj4gKwlkd2Mt
Pmltb2RfaW50ZXJ2YWwgPSAxOw0KDQpVc2UgZHdjM19oYXNfaW1vZCgpIHRvIGRldGVybWluZSB3
aGV0aGVyIHRvIHNldCB0aGlzLiBPdGhlcndpc2Ugd2UgZ2V0DQphIHdhcm5pbmcgb24gc2V0dXBz
IHRoYXQgZG9uJ3Qgc3VwcG9ydCBpbW9kLg0KDQo+ICANCj4gIAlkd2MtPnR4X2ZpZm9fcmVzaXpl
X21heF9udW0gPSB0eF9maWZvX3Jlc2l6ZV9tYXhfbnVtOw0KPiAgfQ0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4g
aW5kZXggZDI3YWY2NWViMDhhLi5mYWQxMTUxMTNkMjggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
dXNiL2R3YzMvZ2FkZ2V0LmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiBA
QCAtNDQ2NywxNCArNDQ2NywxOCBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgZHdjM19wcm9jZXNzX2V2
ZW50X2J1ZihzdHJ1Y3QgZHdjM19ldmVudF9idWZmZXIgKmV2dCkNCj4gIAlkd2MzX3dyaXRlbChk
d2MtPnJlZ3MsIERXQzNfR0VWTlRTSVooMCksDQo+ICAJCSAgICBEV0MzX0dFVk5UU0laX1NJWkUo
ZXZ0LT5sZW5ndGgpKTsNCj4gIA0KPiArCWV2dC0+ZmxhZ3MgJj0gfkRXQzNfRVZFTlRfUEVORElO
RzsNCj4gKwkvKg0KPiArCSAqIEFkZCBhbiBleHBsaWNpdCB3cml0ZSBtZW1vcnkgYmFycmllciB0
byBtYWtlIHN1cmUgdGhhdCB0aGUgdXBkYXRlIG9mDQo+ICsJICogY2xlYXJpbmcgRFdDM19FVkVO
VF9QRU5ESU5HIGlzIG9ic2VydmVkIGluIGR3YzNfY2hlY2tfZXZlbnRfYnVmKCkNCj4gKwkgKi8N
Cj4gKwl3bWIoKTsNCj4gKw0KPiAgCWlmIChkd2MtPmltb2RfaW50ZXJ2YWwpIHsNCj4gIAkJZHdj
M193cml0ZWwoZHdjLT5yZWdzLCBEV0MzX0dFVk5UQ09VTlQoMCksIERXQzNfR0VWTlRDT1VOVF9F
SEIpOw0KPiAgCQlkd2MzX3dyaXRlbChkd2MtPnJlZ3MsIERXQzNfREVWX0lNT0QoMCksIGR3Yy0+
aW1vZF9pbnRlcnZhbCk7DQo+ICAJfQ0KPiAgDQo+IC0JLyogS2VlcCB0aGUgY2xlYXJpbmcgb2Yg
RFdDM19FVkVOVF9QRU5ESU5HIGF0IHRoZSBlbmQgKi8NCj4gLQlldnQtPmZsYWdzICY9IH5EV0Mz
X0VWRU5UX1BFTkRJTkc7DQo+IC0NCj4gIAlyZXR1cm4gcmV0Ow0KPiAgfQ0KPiAgDQo+IA0KPiBi
YXNlLWNvbW1pdDogOTY4MmMzNWZmNmVjZDc2ZDk0NjJkNDc0OWI4YjQxM2QzZThlNjA1ZQ0KPiAt
LSANCj4gMi40OC4xLjUwMi5nNmRjMjRkZmRhZi1nb29nDQo+IA0KDQpUaGUgcmVzdCBsb29rcyBm
aW5lLg0KDQpUaGFua3MsDQpUaGluaA==
