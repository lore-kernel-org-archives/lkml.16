Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5592236F3;
	Mon, 23 Jun 2025 22:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750717935; cv=fail; b=KhVLGSI5TCupC/eLAqTXEZNYX+VW2vo5hCHjkDMAYHt+H0/EXydsCrltur2kHruobnsgniE1m8YnBrcrzPdOdUwyvN4WBQz1nggD8BncC0y9inJYibzKpHz5vDIumFgPmnJMFqzQOjBg4egDdYU44ZhcGueGuTjkj/AtyXPdaEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750717935; c=relaxed/simple;
	bh=rfU+1YkWmUad71NtzfVnMOzbfptPJYPg4zcfjH7aRg4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KWOB6I1v9gsvLuHcv7/ME2YOri80VsZxHsaH/yW6iHkEHeahrgFnSRwOQs+Gjlg22o70WLhplCWtuwd7UCTTNAxCjHliFwN0ti2nEfgWmkcLVAbA99wloU5MHY/245H0KTCq2x46UuRLav1efKYkUVaSmmmwr2uIub8uu1n9JTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=LB9wvA/1; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cNN8MINh; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dbTVfPzx reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LB9wvA/1";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cNN8MINh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dbTVfPzx"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NGWKAa024786;
	Mon, 23 Jun 2025 15:31:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=rfU+1YkWmUad71NtzfVnMOzbfptPJYPg4zcfjH7aRg4=; b=
	LB9wvA/1LR+cGgLSu4AKSq6ZKm9A2vCTbYHc0H48WDj5kBURfVAqCb1wCB8A8H4s
	rvKvhJQdGZgfBIjrgg/BdTk8QmNKi65FEWW4yczI9ZMUFdQ+S8EBwYX0TIR60l/Z
	xw1xuBe4iGCUegX/1o/I3camB5EpJszck8gMbDQVj7HgyA0cQL2W0dFyWKygF54k
	vCqRSz81UGIQkS5Gzg0FahkX8oClh86JLyXLETJLiq6TNDyb/pR6MhN5cCbrBrWa
	iMN+hWuFRlPUZaqxeKOAwHsJmbQUoIPOrWVHwKsfD9Evimb8IEzi/MZoSjCd23Fz
	ODLAwJf+8ZC5+n5QHJam7Q==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 47ducgfu32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 15:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1750717914; bh=rfU+1YkWmUad71NtzfVnMOzbfptPJYPg4zcfjH7aRg4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=cNN8MINh3ydBVuWi3ONWAwiJBCX/bxDicdIyXk660Sjb44PHIAz0oEEqY1rNQ72AM
	 7e2vxwg4VbDxb+nxNGYPPK0X05Po99ERTop117a1xPi6cRZIzp8IAVUaBu3HcSMy4+
	 RL4J4WitaGKOEGkv38SpF23/N5OnPHQV+z7OURIIojJTyKqmyUrmYr4PH4MsxsBtXx
	 tlV/jOSgdDlOA5Y/Q6c3FRLtSLaOJawKc5wAmQRwj5c/3kOy4keUd9tu36vdIcbb5A
	 lmcBa1nvrFp9YNpACsW29TG+v+CsvsJQ6NjY73ztRSEJfKMcqm5AXGQvgwDcNHG4bJ
	 JfYtpHwzpMdqQ==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 93B40401CA;
	Mon, 23 Jun 2025 22:31:53 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 243A7A006D;
	Mon, 23 Jun 2025 22:31:53 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=dbTVfPzx;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 286974045F;
	Mon, 23 Jun 2025 22:31:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q00vlh8deCPzkQR1LmHob3kZmVM/J7FGUMJ+7RZG/UMxkakgnKYVwXw8b0WNLPUrGF5GL/bPYGtOCQ4UqCY8+OqOID+YK20hxcA9O+JaYCS7KIvIQUm3dgjhcceXJ9ljKN79BbdQSeBLjQlBs89tpbRtPQyLsriXvSUwCLOWkuTTFUSDOPTEgWWqyGVxMMfml3LhBFtq6b3QiOKGDrxjkQ+0SZvUbFIkZ3nMFuDw5heP1tlBr4USyMkuGvbhol7qjUa5G5hqsETTQkp+yf/dh13FaT+AJLKxcYSyHIySn0WFyRoHJF6awmJhUnRA44KYp5yltyD/UlThHDV6xH6M9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rfU+1YkWmUad71NtzfVnMOzbfptPJYPg4zcfjH7aRg4=;
 b=hB72/H+he2uZ2FoVwHBDuMcDBOTfrCsoEzOUvfdrXl15cZdlQAArnyoC8/T/KZ+m7e7d2hxK/XPvezvdSaMhoUQALg1XIvHcdf2cNIsmO0qx/KNO04a0T4qjk9W3eIRY8OwRLHjN3V/MQ5cFISXRTSqMEsOsy3P+L6TnmHhrz7+uYDq3HL/Ox5mOHarq019b1o2SY/gAgd3J/D+ouD6Q6n/TOYFQSKpr2r1aIWHTbQoz1AdS8iX8kACezoAhrOqFvXJH5ZXT8cCtNoEMnmUaYlcds2Hzr6Rt7+Oktr3s9xmr4Q98AxigHfKR7tVm5GHs3QKBJmegr74glU0g0k9QYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfU+1YkWmUad71NtzfVnMOzbfptPJYPg4zcfjH7aRg4=;
 b=dbTVfPzxNTRAyKqmbPh7vBuDrb00cscPt+IiMGAnUyo8BKa4n9VOnx/RqxjdyHfDpJwxjaAo0dXVZP1s83b2vXwZElutNOJPQ1rBbAx8D3JfGKtrk7QhTHyG5gvqyAFK8VK5iyRaf5AXe2uI7moHkBT3QVUqZ11HmPvfRQOSnQI=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ0PR12MB6941.namprd12.prod.outlook.com (2603:10b6:a03:448::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 22:31:45 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 22:31:45 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Johannes Schneider <johannes.schneider@leica-geosystems.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bsp-development.geo@leica-geosystems.com" <bsp-development.geo@leica-geosystems.com>
Subject: Re: [PATCH 3/3] usb: dwc3: gadget: Simplify logic in
 dwc3_needs_extra_trb()
Thread-Topic: [PATCH 3/3] usb: dwc3: gadget: Simplify logic in
 dwc3_needs_extra_trb()
Thread-Index: AQHb4t+/0kSe+7riKkOESU9gkNcO67QRV2YA
Date: Mon, 23 Jun 2025 22:31:45 +0000
Message-ID: <20250623223134.mr4lsbrl73ita5gm@synopsys.com>
References:
 <20250621-dwc3-fix-gadget-mtp-v1-0-a45e6def71bb@leica-geosystems.com>
 <20250621-dwc3-fix-gadget-mtp-v1-3-a45e6def71bb@leica-geosystems.com>
In-Reply-To:
 <20250621-dwc3-fix-gadget-mtp-v1-3-a45e6def71bb@leica-geosystems.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ0PR12MB6941:EE_
x-ms-office365-filtering-correlation-id: 75d5da13-d9e7-42dc-3cb8-08ddb2a5bc46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?M2NNeUVOQ2RjdytpZXNxa3RHUDFFWWE2OVh1YVZWNnNZREZSdEtqOSt3blVv?=
 =?utf-8?B?ZERhTTVUNGpKaTJtWHRXU1BGWkFrZ3B1NklJVDRQQlRBS3VWK0RoalpvU1pl?=
 =?utf-8?B?OFVDYXNSekpQQStNRkI3eVZSY1lzaTFFdmZ0TEtWRUEydEw2a21Kc0VSbXB6?=
 =?utf-8?B?YnBtR0FBVWZXeGo2VlhwcER1cTMycEZJclhQNDF1c290TUNTYzRyS2xsUkNK?=
 =?utf-8?B?ZzVSdzVjWWJzTHVNMTNJNkhhNnZkdW42cXhaMWlicjNKOCsrcW9UbTFMZVp4?=
 =?utf-8?B?dHptRG9IU0EreXkzWXFpMW1BNWJSbnFiWkY2WHB0b1JiRTlDZmxzS24xbmor?=
 =?utf-8?B?eFJTeFN3NHRUczMwM05aemVKRFZvOSt2amFtZGhPczVkSmRTKzJ0ckVsM2o5?=
 =?utf-8?B?cUFhZ09CWlRYVlFsWEZ6d0NtSXkya2twU3lYNHN3YTlkeFIyVEdDQldQc2pY?=
 =?utf-8?B?RkNBb0U4cU1WS0w2ZWNpWDhQMFJndThhTDdpUm4xUTlIcGtTLzlMdzRTWUN6?=
 =?utf-8?B?endiTzB5eTFHRk1QeXBpZ0w0amIxVisrVitiOEd1OVp3MEVYVTN4ZDVKSWFE?=
 =?utf-8?B?bFUvTjlyWU10REE3OEE3QVlTNkc1U1V1RFk1WUx2eUxTRUVkUzc0TXVVekFY?=
 =?utf-8?B?UFp2b2tUcGhVak9kcER0QmNzc3dBUHN0bHVLYVJMcmpOSXhGbUdlU0RsOFBF?=
 =?utf-8?B?cFA2d01GN2dOaGVNa3drbzlLUE5CN3lLRkUrTlN1UU0xbDI3TG1XdXNsSm5S?=
 =?utf-8?B?OXRXbFhmdzc5THh1ejRoQ2FkUlBjbWFzS1lTZTQ5eXM1MzI4RjNaeTU2UmZt?=
 =?utf-8?B?UmFsYkM2bGRnc0d6VnpVWE80QlRrMkdsT2trT2Z1TExJM05NNWgwUlBaL25k?=
 =?utf-8?B?RkUrOGFOaURvbnF0SWZPaTNFRVdwcFV2NTZYTU9YWjMxeHRlbGY1UCtoY29O?=
 =?utf-8?B?dVczZ096eVo2SEFXWCszeWlCWGFRZnU0bjZoUnNwS0dmWkJKaTVoOTBiTUNw?=
 =?utf-8?B?L0daWFphckZwS00wVXFvM0o5aCtqMEtjZWQ0ZjhIOFVNaWhoUGJ1YjN6cWJJ?=
 =?utf-8?B?dWxZdFlsc2g5bjdyOGt1WDJUSEF1alpiRE9wRVJ1Q2lYYjZkQXpBenVVSnVS?=
 =?utf-8?B?Z2JMRlBKaTVQanhmRU5rZi93bXlMZk1hZTJGVnRGcmhhQVF1aW90V1RhZXRo?=
 =?utf-8?B?dEFrWG9lZEhWK3NsZzB2dElGVUhlZHQ2eWJiZTViUVZEUE5WdGxCbGdnQ09L?=
 =?utf-8?B?cGtRSjdNbXdRMk9zcEFJRlQ0aHhNR25rNFFJUGFwYmZGRm96Mi8vNGRIRjVO?=
 =?utf-8?B?OERXQ281RkQyOTRGSTVwaEJ2VVQrS2lsSmg4aVg4RWYzdytDZHc5N1VWU2tT?=
 =?utf-8?B?Ujc2NnJQSXVrTnFvWVo2VmhqaEZvRHZmTE9nbVZYc3dFMDIvb2RpbFBMb3RR?=
 =?utf-8?B?VU9idGl5T283TmtWNnZicUZvRXN1UW82MlI3RGpsUFNCM01HcTdPTURKaTR5?=
 =?utf-8?B?RzJEMndodDIyaHE4dFgrQUdLMFN0NFlDbSs1TXRxSXdyT3VHMTRnMG55Yzg2?=
 =?utf-8?B?TXgxeG1rVnVvSFIyS3FOdFc4Zys0SDV6bVFJTHlKODllWWVRREk3ZXRJMU94?=
 =?utf-8?B?aUZYaS9GN01JU0pjNE45djI3UDRpanBnRkRoTGt2YXFQdmxhWmEwcnUwdW9L?=
 =?utf-8?B?QklZSVVWVjhiVnJMdk54M3liVGNNTGl4MjkvalV1SlFrc2xtbDdKbGV3alhn?=
 =?utf-8?B?cHp2cThrMUt1VzFmR1loNTk5OWs2ZE4wS0FsY2JyWEczWFZFMkdJY1ZjNXFk?=
 =?utf-8?B?aG9UT0pETjh5L1FqK2pBYk5IV0tmSFJ6OFA2RVEzUHVsUkd3UXJtNlNGeTVp?=
 =?utf-8?B?M0VyWWMzZ1dCR21sYW12VHF6bjdOQlo1dmVIS1pIK0p2NHM5aVBkS3AvNkhr?=
 =?utf-8?B?T2hQVlphTjM2NjFBYzYxUEVuZTdwV25MalNlYmJzSTZYbjBwOXRzQ0hlNGdH?=
 =?utf-8?Q?r7RDWGRZyehmVA7iazYntpUJMj4+Gg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WUlkYXVoaTlhaWFlQ3ZDaFU3Z2tnbS9xOVdGQUFJdHpPWjZqR3duWTJUQ0hX?=
 =?utf-8?B?MjQxU29oaUg5TmJDNm5sZkY1OXUrR1RvMnFmRGVKbytXNVNTeGRRQml1WEZx?=
 =?utf-8?B?VUxUalRRSWlvRUdXamFiZDd3eWhYNDVtVkgxKzNEVVluWUVETnA5bEtSS3Rj?=
 =?utf-8?B?YnlRUjVQTXpHbDJucnozbHRKRXNwSjZLOW5OTGxzQmtPVzBiRHhtUUtHZGQ3?=
 =?utf-8?B?ZC9RZzg2anVCVjBqVGFRZGIvcmgzS2l3NUdtY0J0S3U4cERJa0Rlc3gyRWJ6?=
 =?utf-8?B?TFVncnZZam9MUkJoR010Nm5JeEpkNnZRMkU4alYrTW1rcTBCL0xoL3ZwRDc4?=
 =?utf-8?B?ZFgrL0xPL3hLMVRHM3hSZGNEU2VMM0Y2SzYybjhzOTFhbnUzUHpySVJTa0JJ?=
 =?utf-8?B?QzZueW5iQmg0N2gzbjlnZ3ljTmIrUS9pcmk5YnJWYXNkeURXbm1yR28yenJw?=
 =?utf-8?B?QVdmYmlUYjhqUlVROG5vZ2ZWeDRqcUZhVzNQUUQ0YkdXZ0xVSUN4V0lhcXNJ?=
 =?utf-8?B?bmxUVTB3MmlqVlFKa0lUVjV0MFRNRlN4ekJ6MGI5eWRtUkh1L00vZFNpZnFH?=
 =?utf-8?B?Ym52ajJCMyt5d2ZWR3ZscDErcTJOaWQwTy92b0tDRFc4Z1JrZC9UdnBybmEv?=
 =?utf-8?B?T0VHbzg3VVpMbHdySzl0VFk5VlRaVnBNbm9IYjc0L2RMdVZjSXk0ZjNHSm90?=
 =?utf-8?B?cmRSdHNZZGtPT3Z3dkhSTTBhMXNaQ0pFcGhnbGYxMU92ZnYxTmxVN2ZJS3R5?=
 =?utf-8?B?NFZDeUl0OSsrV0h4YmV6cHZPVTkvNDdtbE1qZkc4RTlNTmIwTGppQkJDcFYy?=
 =?utf-8?B?aWRRbGtvTTUzUktQWFloWlZsZTdENDNnRGlmVkh0Mi9qUStlSHlDZUFjbE52?=
 =?utf-8?B?NGZzVXFBaENNTWpOQzVOVmJ0L0owUGlTdDJGYUpxa2N3blRTYVM0enFpNU95?=
 =?utf-8?B?MEVoVDZ1NiszVENMa04xSXdZQ3pSK211UHRUdWEveW9xWENlTEtZWWFvVDhE?=
 =?utf-8?B?V09jdHBWM3hQcTRYU1MzQWlPbDF3UVNIOU5WbW1Wc25LVk81Tng4WE52cWVO?=
 =?utf-8?B?ZVRZcTdoTGc5T3prK3hZZW1EekI4Qm1jSlhDMU8yeExtMkhvSXlMVXUrL3di?=
 =?utf-8?B?Nng4dFIwU1VoMEg5b2FTK25ZRUhndGptTE14MlAvbEVJTEVZZnJuT0tTdkJN?=
 =?utf-8?B?Tm8zcW4rWkM1LzhxdG1aSTNkeitxSTJKWm9Rd1VpTlBCaGVaM0JzMEg3T2V2?=
 =?utf-8?B?VTJZK2lUYWxNMkt5VUljdFBlMDhOTi96bCtMa3RPa0lJM21pOTJnN2t1aXBQ?=
 =?utf-8?B?QkhocmZNYXBzM1JGR0xSZS9ySHFCd0orSWpKT09sZUp3cWpNcXBGRzdES2pV?=
 =?utf-8?B?MW90elRlQzlEbmYvY0JDcXlCaHJVaXBQV3BhdTg5end0ZXdTY1BFS25HOVJD?=
 =?utf-8?B?MHdMY1BJVTgzQjBmZURhSm5pa0VaRUxMQS9jeDZYUERRYndwVGlkdlB4L2h4?=
 =?utf-8?B?WWFuMzMvYWtWbVpMMEI0R3VMMlJKbVk0dlNQZDZPb3N2ZnhaL0w3T3NzSWd5?=
 =?utf-8?B?cmx1eGRDdVVTcG1VWEh3NUJFR2lhS3JteHh5TFUwR1ZEV2s1dTNYUnErcG5l?=
 =?utf-8?B?OFdIbEIwdjFWVUNjLzA1REtMRFRvakdaa1UwSEFQd0NSTUVTY2o0aXZPc25O?=
 =?utf-8?B?WjEzWW0vaWpqMEFXeFQ5TlZQaDFHZFpyaEFuK2YwMThtZmZuWFl1aXNBV1Bx?=
 =?utf-8?B?UUxhL2V3Q0xJUlExWTF3cWNtMnJxcEczMXA0MEh3WjJCc2liVVd1cUE1bDJp?=
 =?utf-8?B?NWVtUGdhQW5XVk5hc2Nldmd3TmtJY282TmI3dGNuZDJ0MDFCSTJYOHdLSWxJ?=
 =?utf-8?B?R3BuN0VzTFBNdHZBbnZRam5zRUJzL21NVGdxdVJXWVNUaGVYRys3endUNFln?=
 =?utf-8?B?L1pIYm1KL3pNT0xQSEpMZXo2SHgxc0Zud0RVYkJJU1VqMkZIL1B6aHRBY0V3?=
 =?utf-8?B?TDVEWG1UMVhxeXlxb25neEdHUVFsR2NMMHFPRXB3NXVYcHF6Ty9QV3NkR1pT?=
 =?utf-8?B?eit6bFpLZHhGcDBacnJndURlbFhCa1JTUU9SMSsxNUdZYjBlMm5xMWc3b0N6?=
 =?utf-8?Q?XaLHAok96+EFlrz0zqQsPhCr/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B7225F8C6628443B573BBACC36DF285@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hdRRLP0YHYRcE8qWHxxwJhc/ERIl3+w2BDKd3i1s47RevC5Y31sSTQt346AhuOJp0N08JPnQfrMwvhzvJ5fCCT5Fx0smlFjIO4Unqef7tQZvOAyF1sCuvf9enZl9sb1YB5WOFNdP79yBFHQDVZ2+ghGd0hzCPbaKGY+XY4P9StUUq2pIT/oy4hhAj7rWr5b9voDwEdghm/OTslYkpBTJSHOGQcxzjMS+WsLeeSCNaEcc965F51+hrQ/1aooXvYXIV1mxBGfgYMrUwaiIkjXPOh+9vPRb2R+vv0RH0K0DXWwWilT0sFyoaA7XjpKMzftHdQ+CzWi5BP2+KG0pVFVM0z419n9OHWvSimVg+eU3MyNmx/9R6Vw8H/Wey19jUK5sftSFUArldZVBei/kZDMjv4pTmrDGubQ8Y3bvqAfH2TjQ9ZIp9EOuj4SYmBpgfQlMdaSYZyvg1h6O59+G29U8bTU9egSuU/ey/ywl1Xph/AiTifaY8XoaHC18nJpbcx1ukOALH9425JxlbKHGODayE5J5ZopMDVSlzykCulUYrKE1Gtv70ZfMDWE0zLx//MTKSm8nCxoIBruRYEeWlpiyZvMk6POBCVWaMn8SjDPjRfiK9Za+/l+kozpqB1q6H+o8jtysU73Dbx5DfDliW4LbWQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d5da13-d9e7-42dc-3cb8-08ddb2a5bc46
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2025 22:31:45.4153
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WIyDKdDpqebP9Q0VVDyJG3NLP8FiJq0CnMYZkwvNYUP8xJINq8ad8NtouRr6+ocNnVrkRObauMWaT6xoVF+hjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6941
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDE1NCBTYWx0ZWRfX5OGFIkWwsyb3
 K7uHt0Ac++hon48jOBUuKn++q/8U45CW9pYup+xkDFp77WZhoukIWMbsZUtooAoAo7QFRNRZrbL
 wA0x+NhjpAZeQANfi3lf02cXJLa4ZvM2L8h3CymikW13fmneee8l5GycPOvrMACiiCwcsvhaYDs
 tTrQok7wKBYTL/f6VSLFSvvrEj0uoP3niyUOLLcHVcn3/zjrtLjEaT6I2tRHFBE6/wiaAyLk5iG
 zyzQbdLpK3X3fZhl3bIjcEFxjFV+eAiaMHGyqJfS86ciKgIo/hpxAdKhGje+G9oSVKnjX+/ao7b
 fyG7EafWIESK9q5PVKCsbRJlNN8zyMTVa9l8GN1c22aiEw43z/SySqd0ND6HClpJ46xOSWGfmSX
 Oh057AnFdEIi61tYXoLzo89rhgYvuEUs9OJm0qrBRfKBGrIaIQIu0KJ5DiAOVIyIhpf9lyxc
X-Proofpoint-ORIG-GUID: uNfZA63_m31QQLSCkqQb048yt8QKt5UI
X-Proofpoint-GUID: uNfZA63_m31QQLSCkqQb048yt8QKt5UI
X-Authority-Analysis: v=2.4 cv=KMdaDEFo c=1 sm=1 tr=0 ts=6859d5db cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=qPHU084jO2kA:10 a=N3aGF_hyAAAA:8 a=Uq5rCmFdMp0uIfYksugA:9
 a=QEXdDO2ut3YA:10 a=or5rwjIMHQalKGFFZql7:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_07,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1011
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000 definitions=main-2506230154

T24gU2F0LCBKdW4gMjEsIDIwMjUsIEpvaGFubmVzIFNjaG5laWRlciB3cm90ZToNCj4gVGhlIGV4
aXN0aW5nIGxvZ2ljIGluIGR3YzNfbmVlZHNfZXh0cmFfdHJiKCkgY2hlY2tzIG11bHRpcGxlIGNv
bmRpdGlvbnMNCj4gaW4gYSBjb21wb3VuZCBleHByZXNzaW9uIHRvIGRldGVybWluZSB3aGV0aGVy
IGFuIGV4dHJhIFRSQiBpcyBuZWVkZWQsDQo+IGVpdGhlciBmb3IgYSBaTFAgb3IgdG8gaGFuZGxl
IHNob3J0IE9VVCB0cmFuc2ZlcnMuDQo+IA0KPiBUaGlzIGNvbW1pdCBzaW1wbGlmaWVzIHRoZSBs
b2dpYyB3aXRob3V0IGNoYW5naW5nIGJlaGF2aW9yOg0KPiAtIFJldHVybnMgZmFsc2UgZWFybHkg
Zm9yIGlzb2Nocm9ub3VzIGVuZHBvaW50cw0KPiAtIFNlcGFyYXRlcyB0aGUgY29uZGl0aW9ucyBm
b3IgSU4gdnMgT1VUIHRyYW5zZmVycw0KPiAtIE1ha2VzIGludGVudCBhbmQgZmxvdyBlYXNpZXIg
dG8gcmVhZCBhbmQgcmVhc29uIGFib3V0DQo+IA0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZXMgaW50
ZW5kZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKb2hhbm5lcyBTY2huZWlkZXIgPGpvaGFubmVz
LnNjaG5laWRlckBsZWljYS1nZW9zeXN0ZW1zLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9k
d2MzL2dhZGdldC5jIHwgMTEgKysrKysrLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2Iv
ZHdjMy9nYWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gaW5kZXggYTRhMmJm
MjczZjk0M2ZhMTEyZjQ5OTc5Mjk3MDIzYTczMmUwYWYyZS4uMzJkMGZiMDkwZjRjMmZmYWI2MWFl
NmVlZTI5YTAyZWZkMzJlZDAzMiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9nYWRn
ZXQuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+IEBAIC0xNDIwLDEyICsx
NDIwLDEzIEBAIHN0YXRpYyBib29sIGR3YzNfbmVlZHNfZXh0cmFfdHJiKHN0cnVjdCBkd2MzX2Vw
ICpkZXAsIHN0cnVjdCBkd2MzX3JlcXVlc3QgKnJlcSkNCj4gIAl1bnNpZ25lZCBpbnQgbWF4cCA9
IHVzYl9lbmRwb2ludF9tYXhwKGRlcC0+ZW5kcG9pbnQuZGVzYyk7DQo+ICAJdW5zaWduZWQgaW50
IHJlbSA9IHJlcS0+cmVxdWVzdC5sZW5ndGggJSBtYXhwOw0KPiAgDQo+IC0JaWYgKChyZXEtPnJl
cXVlc3QubGVuZ3RoICYmIHJlcS0+cmVxdWVzdC56ZXJvICYmICFyZW0gJiYNCj4gLQkJCSF1c2Jf
ZW5kcG9pbnRfeGZlcl9pc29jKGRlcC0+ZW5kcG9pbnQuZGVzYykpIHx8DQo+IC0JCQkoIXJlcS0+
ZGlyZWN0aW9uICYmIHJlbSkpDQo+IC0JCXJldHVybiB0cnVlOw0KPiArCWlmICh1c2JfZW5kcG9p
bnRfeGZlcl9pc29jKGRlcC0+ZW5kcG9pbnQuZGVzYykpDQo+ICsJCXJldHVybiBmYWxzZTsNCg0K
SSBrbm93IHRoZSBjdXJyZW50IGZsb3cgaXMgdW5zaWdodGx5LCBidXQgdGhpcyBpcyBub3QgdGhl
IHNhbWUgbG9naWMuDQpQbGVhc2UgaGVscCBmaXggaXQuDQoNClRoYW5rcywNClRoaW5oDQoNCj4g
Kw0KPiArCWlmICghcmVxLT5kaXJlY3Rpb24pIC8qIE9VVCB0cmFuc2ZlcnMgKi8NCj4gKwkJcmV0
dXJuIHJlbSAhPSAwOw0KPiAgDQo+IC0JcmV0dXJuIGZhbHNlOw0KPiArCXJldHVybiByZW0gPT0g
MDsNCj4gIH0NCj4gIA0KPiAgLyoqDQo+IA0KPiAtLSANCj4gMi4zNC4xDQo+IA==
