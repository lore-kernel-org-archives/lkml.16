Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2B3BA53;
	Tue,  4 Feb 2025 00:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738630020; cv=fail; b=DAgaFj4Q76JFGi4rKdCkpw6CsfyEsbCCziOfaWyxdIIE9JJcZGCGatbhbLjEqLG5U/JPzSUidh4oRhtRxn7xxrCfMQ8Rmrms0APSnObx498KnCyO0EVLNwe3ghwstCvXiG6BpYXAsYOjEw07RimXJ9sDLFKNW4XRUJg8OdWA4Zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738630020; c=relaxed/simple;
	bh=wF9R4jfvOjtfG6PPaksyTXfjo7NsyUi9ldYV35s4PqA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qniEwtR+bAMAmRLKCw+WBFRprmGsIp5gNux8d0WDibLkf4hRG0lz6VKMqvJzjBcaahcGyHLZ1ykSXRXuDXACCdnG//pVoc/MXWpRGUWdPfxas2nGp5qZyzT6xNLG5uVv1sHlaqcVNGB7NJEZXKKlIdjDXYZC4XXuId3MJO+aUfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JIzT/fhB; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=RQQMUXHf; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=T/wPdgiI reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JIzT/fhB";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RQQMUXHf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="T/wPdgiI"
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513N5Zgd008316;
	Mon, 3 Feb 2025 16:46:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=wF9R4jfvOjtfG6PPaksyTXfjo7NsyUi9ldYV35s4PqA=; b=
	JIzT/fhBQO60xmLMEUQWbDBVxGv9bYyGntMFP9qDMzw6vP6LzQfHvYhY9FM0GnRC
	sWgQLLGtvdDmrtgXZczp7RdvR6wijZqSj/hpVm2gpcYKKK/UDiIzAGcOiMY+4rQX
	PNIlJG8s4avTrpuunGGr27HQNqAnoRiXF2BODFmJcFeEINN2+h+mczHijCoKisK4
	z4hfmoaFR5XlPk32aGy88alKmVaZO/dkrL42pVLhHq/lavQs+/ciKHRHZC6OJj5s
	MxIyvhTYYjo91i6/bh30m5oT3CakXHunmazRzIdQcvJEuGx4VsPUCgyXXcM3DjFZ
	pn6aw+qeODHlfpkpvzjY+w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 44k2wnsbpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 16:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1738630011; bh=wF9R4jfvOjtfG6PPaksyTXfjo7NsyUi9ldYV35s4PqA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=RQQMUXHf9Y1RW1K6IkjxqJEfn2O0Eg91LIg4+R5hg+wCdhqx1KnwI3nZnsfWr01Aw
	 paotfmKpjO/bFcmSchw1ZgLSUE0E+20HZg8XBwcnOvA8jmx+W+tS0b/mx8gOmTkFuM
	 rO1oSGnOckUHYELmzwo1ypMHYrRFG/K4CnXvLAriYZFOjhY7eQpjHsGOc5RT24htZ9
	 sq9ltuVhM4S+l0H74xbB2Dv3InBleHSBvVFE3IrLljKH+qrPY1Vuka1cN907OvDKej
	 JR6eaDrXCCbcGVopB8lsD2Mgir03380cE4Q9h169NgTzbuH5TlppXBPNToAnZYznM6
	 bwoDkQcEtXgMA==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8135240517;
	Tue,  4 Feb 2025 00:46:50 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id C9C99A005F;
	Tue,  4 Feb 2025 00:46:49 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=T/wPdgiI;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 62B8E405AD;
	Tue,  4 Feb 2025 00:46:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jHrXbEhvD46fIjmKYEmcFv4lFsrdszNYXpSp/E8R1F9B9IuisLrFrVj9HudFNprOe0b0M+dtHi1H5Ae+OAK57n9GLTA0b6e7LwRARopQ/utdYsBVf05WPpHKMXO7CcDfsQiUk2CraYVu97Djr4vYNlp0UpP1dpBaA/sKunBI+xFNBcinhzEsoUjQYw/eb02zyviYrJ50q380haPMjSxqWlFPuDEYVpcFtL9XWuYib7AaV0ew3l04Z4KtsIwGWs0/x8M6pVo7U6NpvsZHlSnPhkUKavam4iaAJ7CV02d5WSYothtmPyAyRcqbgr04bO76lUxrrPwoe5JxyXC70PimYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wF9R4jfvOjtfG6PPaksyTXfjo7NsyUi9ldYV35s4PqA=;
 b=eLO/5GnAL89R0OBj0ewkbuBGgbMP9CsgM5XOq0ICpzJAtVfgx2eudfpibJLc5MfsPbrQNu9rqKvld75VaMK+iVp1mN27hG+zSITOyOro8dkbxcWO1UrYJ3VA0HMEsUqElWTuvLdKTHTNJrvcAWqDJ8QpsTR3+KPL2I+220GhbjyOZoQ/gbDRon5Uc7KxIxPvO7hKH0sQTBUUpb5WZ+xh/TWXZfFXPo21q5oydg6stnRUg2q1BN4dVuS05Fb9JZdQaapCfJktdQe8buWjLkzi+/BvxDnsGac73tScHv5uWda/4cm8A16qmxRRRZKT/nnsbcR9mIRJ95sNy2C/Z8a7cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wF9R4jfvOjtfG6PPaksyTXfjo7NsyUi9ldYV35s4PqA=;
 b=T/wPdgiIZiX16skXZsnDzPvzQxhCKwoPTpZh6nizJY7WkHute4z+/e0dFM0EruOr4WhqV/TW/dBhEXNlxXYHXfPnOWvCoETsEgOtY7MvnZk++BY1U3CsJff/zYtpv6I3zB6I7O16IZilXN6ei+5rN7GV6rxejnPJq7fccRe9WOs=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA0PR12MB8280.namprd12.prod.outlook.com (2603:10b6:208:3df::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 00:46:45 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 00:46:44 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Badhri Jagan Sridharan <badhri@google.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        John Youn <John.Youn@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jameswei@google.com" <jameswei@google.com>,
        "stable@kernel.org" <stable@kernel.org>
Subject: Re: [PATCH v1 2/2] usb: dwc3: core: Obtain imod_interval from device
 tree
Thread-Topic: [PATCH v1 2/2] usb: dwc3: core: Obtain imod_interval from device
 tree
Thread-Index: AQHbdSW18aZt6xat9kivw7+sU/5hBbM2UjMA
Date: Tue, 4 Feb 2025 00:46:44 +0000
Message-ID: <20250204004638.cacmapvsp5vlewir@synopsys.com>
References: <20250202035100.31235-1-badhri@google.com>
 <20250202035100.31235-2-badhri@google.com>
In-Reply-To: <20250202035100.31235-2-badhri@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA0PR12MB8280:EE_
x-ms-office365-filtering-correlation-id: 34279bce-b9b2-4d24-e367-08dd44b565ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MVlTRHBPNHJGVElDa0NuMjVHcVJaZ0JqWi9hajFOYzRKcFhDajA1aEptRjN0?=
 =?utf-8?B?QUF4ZzNLamhkeFozdDg0VjZubWg3MjZHOWdTcm9nZ04vMmJLZWd1cE1JSzda?=
 =?utf-8?B?MWhXMW8vUEZVZ0pYdndvOUVndEpsUC9nR3lIVHRhTVgwbjNsVjE2ZlZwK2gw?=
 =?utf-8?B?OHlhTC9jZWFsVTVsMFM2Q2pTM0ErVDBqN2djUmUwaVA5cVhGam5XUitXQnRy?=
 =?utf-8?B?YjNDa1pCeVdtTzNhaEdMZVRZNGd3SWZMb05ZOC9xU0x0Yk9wbEsrQXd0MG5Z?=
 =?utf-8?B?VlRCa1ZsOUo0aGc4aktaaEJnRll5Q2FINXVieW9JZ2FnQnNPVUxCRkpHWXk4?=
 =?utf-8?B?UDRvayt3R2NmTmZCR0ZUWWpJQktORE0yU3d4VjE0a1BlTm5FQ3MyVHNWSWlk?=
 =?utf-8?B?T282V3VLdUxyWFNrREo2TWM4WXl6VkZUaHdxWW5kQzl0NHlsMGNtV2wzTjZO?=
 =?utf-8?B?ZWx0dkFkaHNWWVd4dUVuNUt3QWVKejBKMWdkVkJabkM1aUw2YXh5NFhIekFC?=
 =?utf-8?B?ZWNrNGt3YWxnbmxZMFR2aFVoZ1lVN1l1ZHhZZnJ1SXN5cmZZOVY4L0EzcGZt?=
 =?utf-8?B?RCtXNFBXRGd0TEZ1WUpqOXZjbFpUWUorNVRvaXZQWkk1V1FsZUJPb0hWUkdO?=
 =?utf-8?B?ZlcvV2h6Ykt2WmZCYWx5WlJqMGxUYzE3TXJpaldsTnQ5NEl6YmFqL2FmZVZs?=
 =?utf-8?B?Mkl1Z1B2M1Y4VmpEWlM3cURYc2YxV2laUGluYXptais3TnBiM3ZpRlpMY2d4?=
 =?utf-8?B?UHN0RUpCTmtBdlJmRjR3NlFPYWM4T3JNNUx1WENJTGxSUHY3VmxaMUYrWm1p?=
 =?utf-8?B?Tm1kUmRvMnZCMVlmenFrNkRQYk9vOEplT21ZRC93L1drdkRnek9lYkdVODFi?=
 =?utf-8?B?QTE1V1FicWxDK0Nwa3BER3RMVGtzbGFIL3JDd0dQZjJSdDJ0bDlkckdjaVln?=
 =?utf-8?B?NUpNK2tvZnRxRzR0R1NtQ2J6L0ZadEN0SWhjcUoraXZqdzFJR0dMQWpXVFgr?=
 =?utf-8?B?SFRMMHo1OFBSVytkMy9lR0xkWUJHR1NCZm50MVlVL3l1ZXgxcVhWN2lqaVlX?=
 =?utf-8?B?WWVlaEZZeWJhcThpTFBHbDhCRnBHR3hFYWthUkMyRFg5a2RObmt1N0EwZ21U?=
 =?utf-8?B?WGp6MERjRTA2em96N0tSS2JwdkVtb2NlYTdaeHNWU3RsYU1EZWZXQUJZVHB2?=
 =?utf-8?B?ZkNsS0dtbm1aQnNWa1kzUlo3R25YUkNIbjNlYmd5K0JJblRXOUx0Q0IveWgy?=
 =?utf-8?B?V0ZaRkRLbEtXcytxS2RPaFIzcXlIandNSTNFdUwyei80SzN1TXVGTlZDWEY1?=
 =?utf-8?B?TzhxR3BtNHh3ME1vNVlJNzBZeWJsbmU0cDZ5Y24wcGZvMHAxZ2FHU1FOWmV2?=
 =?utf-8?B?VDM3U1kzRUhHdFVZeHBsMWlMVitxRVh2bm9BL1JZS2hoek9hRUlTYWRhNzJP?=
 =?utf-8?B?RUdEWE1OMDZGTktpbTE3bmlSVVFoT2czZnFac3MrditpYzBhQm4xd3FhRlhR?=
 =?utf-8?B?bkJUU1pkZkorN1dJcWwvUXRhUkxQS0JIYUlWR0R3Mnk1cmZ5NEtMUnRBanJF?=
 =?utf-8?B?M09jdUkzZGFOcVYwc1Z1R3F4U1A5Wjgrc2FrbEd3N1VYV2NtQlZFZlFrNmt1?=
 =?utf-8?B?Vm0yV2M0UlRUSFdNSmZKRXV1a3pydkRZR2xjRzlBcFJNZHRWSHZsa2RKbCs1?=
 =?utf-8?B?V0Nnc0FjL1RubmNsK1NuSjJod2pleFV5cS9pL2U5eGc2TTZNb2NzZFE0eGdE?=
 =?utf-8?B?WDJRd3kvc0pWQkN5eGtFNXUzZHFtcUNGckd0TDg3dVJ6SkVPMHZ2TmZCSm5k?=
 =?utf-8?B?aElIbjNQK1pTRE1JUGNDTHdsZG9Vbm5maW44T05LQmpHSC9ySHJrcTZlTTJz?=
 =?utf-8?B?Yno3ZzFtR0p1NWNHeW5LTnlUY2N3NHRuUkpvUE8zWmZGc1RpRDRzZW9uenE0?=
 =?utf-8?Q?vn2e1NLFMtSsOMVMIml4kTlPwtWvXuzI?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dE81MC9oTHc4UURWc05GRngrdFRJSHFVU1N4cmRaVG1Hek1vU0QyK1lvOTFE?=
 =?utf-8?B?cDZPWjduTHlpZE1sUzk4OHlJQjhaR0pQYXg3cTk2azRlQWRYdVRRNGQyMzNu?=
 =?utf-8?B?ekQvTC9ZS213elZ5Qlp3dCt3WUhjZWpLeC8weFd0SEpDcnFORWhCMXBVejJO?=
 =?utf-8?B?bk10dnlTNUpiQktWc0xEaW9DSVRtaTVmdTM4OVZ0MjRORXd2cTJWMVhmQ1FS?=
 =?utf-8?B?Tmk0VE1JeHNkbGl5dHAvUXpVeHFCUG11YVRQRnZGN2pFaXg0Ri91VkJsQWJU?=
 =?utf-8?B?K005a2ZuNVpVLzErZXN5TWxsdGhlWlUySlJhWkYyQWl1VFlreC9CN0JCRTFo?=
 =?utf-8?B?bU5jSjRUUlZPN3JKL2YrbmVSdG5UdmpDcGNObkxpU0tOV1QrTWZNV20vd2Jw?=
 =?utf-8?B?cGhLdWlyamVXY2Y1Kzc3bTJHQzR5RW4wVk1uWjZhOUx0M3NIYUNWNkg5T1ZX?=
 =?utf-8?B?NURvM3ordGFYa3MzVGtmZlcwZElhT09YV25TMUtaN3FUZDdUQk1qb2U0Qi9N?=
 =?utf-8?B?K1RKNFZFbUR3b25VbXBuc0tBWTNUdCtUWFRUSERsYTJJQlR2MHRCTHJiUGU0?=
 =?utf-8?B?YUFGMnRpYlhkQjFqY1dlcEtkYysrdFVwUFFqWkJGTUVMZXBCK3NGNC94R2hq?=
 =?utf-8?B?UGNiSjBkcWhlYm01Q1FxZkxJd1R3T0pOTkZvU2JwTWx2TVJ1bHZMblRackZa?=
 =?utf-8?B?VTVIUGEyNW9xVmJ1ekQyZVlIUWgxR3ZoYVMxNHRpeGg3T29sTkJHQkZJbldK?=
 =?utf-8?B?b0ZhVVZwOFBDU0Q2L1RsWmd3QjhXbGdjTjIwQjRvdE51bGo4OVlNZm5TMU94?=
 =?utf-8?B?NlFOa05RNVMvVUVPeWRDQXA0SWxlOWgyM1dkWG93WTNjZGtwOW1ib1RvWCtv?=
 =?utf-8?B?TlFNWVV1QWw3c2pFRlNmS2MzWCtpV0FqTEdsQzlIMnZQQ3FzMXljZzhHMmFL?=
 =?utf-8?B?Q0R1SDVrMjBTK2V6Vk9XME9mVnVRc3c3bC9sYzhxNnluYWdWVzVBRTJpRUVp?=
 =?utf-8?B?ZjJTUFJIa2VadTF5MjRrNE5UYWhKYWozU2NpUkFKa1ZwcWg4NVpjLzJJa3Zv?=
 =?utf-8?B?QXpKTG5KWlB0N1JmQ1IxSG4zL1J2QkwzUXBteHgyeldVU29yeENqL0RDNmRq?=
 =?utf-8?B?Z1VtdUExTmVOaW8zYjFiN1BMVWY0c1dGZWxYamx4Z2p5QWluZUNyTFNta1Ar?=
 =?utf-8?B?MWZwd1JyWThKdXZiTWNuUmJ1ZDJoaGVqdktWUnpKUU5CbEkwMGYyNFhPQ2JE?=
 =?utf-8?B?ejFBMzlDNUZSNTliZ05OcExSd0cyT1NGMmY4dC83NDZmVDdNdDlNZ3RoaGlE?=
 =?utf-8?B?RlRSREhXT1dUTkwyZFFDTUF5UzVxZDQwK0plekJ4dHhiNzlrU0d6c2g3RUJ3?=
 =?utf-8?B?cm9FbjZwWkpFc0EzUk90azhFSWhQWXU5ZWMzSWlxcCs3blRhRitWS25pNEla?=
 =?utf-8?B?SFlxcC9qbkozT0lsRmJLOHd1d1prRzdVZkhXVE50Qkh3TUsxczE5OFpmVEVW?=
 =?utf-8?B?bTRwMlBRd2dTZkUwbmtjZHZqQWd5V0U1SVNhTWdrdVJKUHJUWW90eTFDTHpL?=
 =?utf-8?B?emNSaU05bkpNdmRFSTZDMURtbFcvcTA2NW1GV200ZlZhS2VrM2UyeU5wdC85?=
 =?utf-8?B?clJ6YzhsdHJUdkZCaUc0REhHOGM1b0Y3YlRKcTdvK3lCc24yR1BKU0x0Z29Q?=
 =?utf-8?B?a0J3TzBCdnNyVE9iOHNKK1p0WmpKS0RwVWFycUFzOWpXdUhhNTF0N2hZQXhz?=
 =?utf-8?B?ZGwzNGY0emViYlg0SmdncjFkTk9uK2dGR1lyTlNqblM3SGhYcGMrd0lWdWhU?=
 =?utf-8?B?TlYyWDB1WmlzRjdPYXJjNlV5eXh3Ky8yTk1TcWxsS0FXT09GSkNDSlVQbDN3?=
 =?utf-8?B?cWpQY21SODFDL2FiNUk1TTZhczRTM3U2RW9FQWFhcitYOFBOckxEaDZxWEF2?=
 =?utf-8?B?cjF6Tzlkc0ZlZEVKRkdLQ3BsWkNpWkI2VFc2NnlqS3NBNHVPUW1nV3BqeWNl?=
 =?utf-8?B?RDUrOHgvTzR4VlEveVFmZ3AwbnVIWnN1cmFWMkxubitBYnNmTUZwWWNFTlZi?=
 =?utf-8?B?dXdwcHBCQnViT1JIVFRxZ2J4YVFGKzZ0L09iVmp6ZHRyT3l2aFRzaFJkL1BO?=
 =?utf-8?Q?Dn1fDQguksWc3iv5+YPfVfIYn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <822D0E83463FF64B98F4289DB7764821@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2t6ZxN4jf+5GjhD1ABhVMc3YXk/eJP5cf5XhI9H/0GQnbdp1E0+FpQX7qlgoL3oHNo9M1cAnQ9UvEaOgA8YoBASXwEmMK9JrbLZR+jl39S74uswwAdpADNQ/7DN+2WpOdVuU3a6hqwGyvNZSi1WLlBazu0wrmmhHLDZeMqj5wvslQ8LkpoWIwnuxTInQIXF9NHquZaNZWXKgtxAhvF4GdnoN1zoVtAtdroJ78VLYT3AQX7GoJNU6wbGFzKisSQX6kkm/jex/fX2zi1GN6qGFfX3LACQAcmpqRwha7grzvxWFPdhAHu6Cmzlde20QfZ0DMl+lByP6P2p6D1/gVVBerHjzLShr3BjKtsAcZOvJgaGvFOeSGI52yhtHm1/pWaVeLsrgcAPGejx3rGbYVOGDa1kOWWE0x0IQg1GiHgSd0pSOlR+bbrP6FHCQl96T4TV/knvtp9YHhZhzNokk+51NuLBZWLv59C7qbOmBg5IImtqxeu2gw/Z/fwmqM4UlW0+8ee8Hi6AoE0sOtMTPJLUsTOLU0dBksb9syUtGHrSIGj6g/ZE56WBrK5J93nxIgyIGcbCtDa9dXP68DjAt0Tp+b649U8eeFM8CBzjN/RKOS4xVv3Dwl53WI4xNJDdR5U9g15QrZuBPV7oXSrG0sLZ6Xg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34279bce-b9b2-4d24-e367-08dd44b565ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 00:46:44.7025
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BMJq9vMR6c5tb1Dh3YDd/c23DTt2ZjRMOG7IWyzh3WxnnM4eSSrKIxqA77c77mx5lbHe3Ii2U7uNqEaoPQpxlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8280
X-Proofpoint-GUID: pLVGn1knEsvoZRJnpU7B-6FuMs3KgjKG
X-Proofpoint-ORIG-GUID: pLVGn1knEsvoZRJnpU7B-6FuMs3KgjKG
X-Authority-Analysis: v=2.4 cv=HeXuTjE8 c=1 sm=1 tr=0 ts=67a1637c cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=T2h4t0Lz3GQA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=q6Qy-rcuR8Mskm5bIeQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_10,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 adultscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040004

T24gU3VuLCBGZWIgMDIsIDIwMjUsIEJhZGhyaSBKYWdhbiBTcmlkaGFyYW4gd3JvdGU6DQo+IEFs
dGhvdWdoIGNvbW1pdCBjZjQwYjg2YjZlZjYgKCJ1c2I6IGR3YzM6IEltcGxlbWVudCBpbnRlcnJ1
cHQNCj4gbW9kZXJhdGlvbiIpIGFkZHMgc3VwcG9ydCBmb3IgaW50ZXJydXB0IG1vZGVyYXRpb24g
aW4gZGV2aWNlDQo+IG1vZGUsIGl0IGRvZXMgbm90IGFkZCBhbiBvcHRpb24gdG8gZW5hYmxlIGlu
dGVycnVwdCBtb2RlcmF0aW9uDQo+IHVubGVzcyB0aGUgdmVyc2lvbiBvZiB0aGUgY29udHJvbGxl
ciBpcyAzLjAwYSB3aGVyZSB0aGUNCj4gaW50ZXJydXB0IG1vZGVyYXRpb24gaXMgYXV0b21hdGlj
YWxseSBlbmFibGVkLiBUaGlzIHBhdGNoDQo+IHJlYWRzIHRoZSBpbnRlcnJ1cHQgbW9kZXJhdGlv
biBpbnRlcnZhbCBjb3VudGVyIHZhbHVlIGZyb20NCj4gZGV2aWNlIHRyZWUgc28gdGhhdCB0aGUg
aW50ZXJydXB0IG1vZGVyYXRpb24gY2FuIGJlIGVuYWJsZWQNCj4gdGhyb3VnaCB0aGUgZGV2aWNl
IHRyZWUuDQo+IA0KPiBUaGUgZXhwbGljaXQgaW5pdGlhbGl6YXRpb24gdG8gMCBjYW4gYmUgYXZv
aWRlZCBhcyB0aGUgZHdjMw0KPiBzdHJ1Y3QgaXMga3phbGxvYydlZC4NCj4gDQo+IENjOiBzdGFi
bGVAa2VybmVsLm9yZw0KPiBGaXhlczogY2Y0MGI4NmI2ZWY2ICgidXNiOiBkd2MzOiBJbXBsZW1l
bnQgaW50ZXJydXB0IG1vZGVyYXRpb24iKQ0KPiBTaWduZWQtb2ZmLWJ5OiBCYWRocmkgSmFnYW4g
U3JpZGhhcmFuIDxiYWRocmlAZ29vZ2xlLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2Mz
L2NvcmUuYyB8IDUgKysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMg
Yi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiBpbmRleCBkZmExYjVmZTQ4ZGMuLmJlMGQzMDJi
YmFiNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gKysrIGIvZHJp
dmVycy91c2IvZHdjMy9jb3JlLmMNCj4gQEAgLTE4MTgsNiArMTgxOCw5IEBAIHN0YXRpYyB2b2lk
IGR3YzNfZ2V0X3Byb3BlcnRpZXMoc3RydWN0IGR3YzMgKmR3YykNCj4gIAlkd2MtPmRpc19zcGxp
dF9xdWlyayA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LA0KPiAgCQkJCSJzbnBzLGRp
cy1zcGxpdC1xdWlyayIpOw0KPiAgDQo+ICsJZGV2aWNlX3Byb3BlcnR5X3JlYWRfdTE2KGRldiwg
InNucHMsZGV2aWNlLW1vZGUtaW50cnB0LW1vZC1pbnRlcnZhbCIsDQo+ICsJCQkJICZkd2MtPmlt
b2RfaW50ZXJ2YWwpOw0KPiArDQoNClRoaXMgdmFsdWUgd2lsbCBnZXQgb3ZlcndyaXR0ZW4gaW4g
ZHdjM19jaGVja19wYXJhbXMoKSBmb3IgRFdDX3VzYjMNCnYzLjAwYS4NCg0KPiAgCWR3Yy0+bHBt
X255ZXRfdGhyZXNob2xkID0gbHBtX255ZXRfdGhyZXNob2xkOw0KPiAgCWR3Yy0+dHhfZGVfZW1w
aGFzaXMgPSB0eF9kZV9lbXBoYXNpczsNCj4gIA0KPiBAQCAtMTgzNSw4ICsxODM4LDYgQEAgc3Rh
dGljIHZvaWQgZHdjM19nZXRfcHJvcGVydGllcyhzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiAgCWR3Yy0+
dHhfdGhyX251bV9wa3RfcHJkID0gdHhfdGhyX251bV9wa3RfcHJkOw0KPiAgCWR3Yy0+dHhfbWF4
X2J1cnN0X3ByZCA9IHR4X21heF9idXJzdF9wcmQ7DQo+ICANCj4gLQlkd2MtPmltb2RfaW50ZXJ2
YWwgPSAwOw0KPiAtDQo+ICAJZHdjLT50eF9maWZvX3Jlc2l6ZV9tYXhfbnVtID0gdHhfZmlmb19y
ZXNpemVfbWF4X251bTsNCj4gIH0NCj4gIA0KPiAtLSANCj4gMi40OC4xLjM2Mi5nMDc5MDM2ZDE1
NC1nb29nDQo+IA0KDQpEbyB5b3UgbmVlZCBhIHByb3BlcnR5IHRvIGFkanVzdCB0aGUgSU1PRCBp
bnRlcnZhbD8gSWYgbm90LCBqdXN0IGVuYWJsZQ0KaXQgZm9yIGFsbCBjYXBhYmxlIGRldmljZXMg
KGR3YzNfaGFzX2ltb2QpIHdpdGggSU1PREkgb2YgMSBmb3Igbm93LiBJdA0Kc2hvdWxkIGJlIGdv
b2QgdG8gaGF2ZSBpdCBlbmFibGVkIGZvciBhbGwgY2FwYWJsZSBkZXZpY2VzIGJ5IGRlZmF1bHQu
DQoNCkJSLA0KVGhpbmg=
