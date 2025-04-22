Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201541F1534;
	Tue, 22 Apr 2025 22:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745360138; cv=fail; b=QKFDhtiPeGxKZWSisydDFSwfl82m1TH62h5Y6T8Hn0Xj5ZVCUzd6jKpx/GKkAQuK0yq4l7nl3eAWKvZuRzoCjjlmawv1bdN43uBX9FBTJTwlp8Gb//Ro4HKmxlpDl1wWqZBALhWucMfXQKhtxjrrGw4F9skA1Jlk4rh6IOi/OvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745360138; c=relaxed/simple;
	bh=YnPVvZz3NF6SwEHE6Fqn4eamYxj+V06oBD0ro8JbkJw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kW9rLTmxIF72zlhZHDQwSXTOyAn17c9jar3khkWucUAUe/uGQUu+eEd+P2KKgsOsrngqU8CPTTKRayUSmiI/o4Bgtojv4CvyLo09/liw+iBIkeqsnDfrx2xdroGeJSERsc2lwTrQBVg1VTt9n9LQsQyXSTzgfHu8yVJVPJKfI4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=I/gmbLXk; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=QxW8ROVc; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=TnUTBfRY reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="I/gmbLXk";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QxW8ROVc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TnUTBfRY"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MKuQuS020938;
	Tue, 22 Apr 2025 15:15:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=YnPVvZz3NF6SwEHE6Fqn4eamYxj+V06oBD0ro8JbkJw=; b=
	I/gmbLXkEAPb9TmU2k+PJYehTKAXQ8v2bd1NKeaLokCljfzqrZ+tInO7nWa8zVwo
	71ICWjfXGBO2D1zGCu/c1+SmuC/xJvcu6+wb4yxTgwbGGZNHQtsiZ3r9ly1jq+HZ
	VBv2zKmfxHUNL8BcMYAtIb9dUj7d27/EiCpDIaLGs/7MTCmMooQQI7JkG0XDWwvs
	lgmiGQD9LX3VJHV/RKNRoz34D603HQBplTz1we5m8NcDcxCu8q+16xRfxpVL5Q26
	qfPphoPuUC4m1iwTemtQ+IQXAXORTvvOxWosHWsPVrck1iadL6n+R8iFVfKF2+in
	K0C7Mjll0xsVr4h6g3CM1g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 466jkdr8k1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 15:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1745360109; bh=YnPVvZz3NF6SwEHE6Fqn4eamYxj+V06oBD0ro8JbkJw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=QxW8ROVcO+AnQhj+/PRU/FGu228NesIT11Auv9DuIEqaaGbJNwHbaegTuw41Kdz+y
	 P67+4+g7lOTK4CxtsG+wenYIKL2kNSi4rAY6YbZd1RrHt43NNzec4JYwdgJgC1rHEX
	 tu3l40Iob8cprAz+9uAqPTwrK+xDoCT1OY0W4ClWtqHXWM2DzmMrZjF3rFCs+kQdJy
	 JKVYF14AHbsz2lKt43Cdgaq6FVoIoPeiH63OJ+IscMUYvLJituqM2KGUjbIbNBvYnG
	 l7wVpvCOBKFS5saSGTfsGwF30eQPi4Pqwk7HlrqaPIVY/QGBkkZTzp/aBySAFT0fuE
	 8oZ2B84byOlgQ==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 46AA84035B;
	Tue, 22 Apr 2025 22:15:09 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 67486A006D;
	Tue, 22 Apr 2025 22:15:08 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=TnUTBfRY;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2048.outbound.protection.outlook.com [104.47.51.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3E5E5401D9;
	Tue, 22 Apr 2025 22:15:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTsOQQ9K90RMsUBP7VGExmj/EWG8SXT9PfLa4P1cKIZ7vAJ3VQxb8Onh5nadM1ZUgybiAUwSmMenB7TCO9Vb9WbQHFFm9sINoi0ZV72AATngxq2suRGAzbihLm6YRU/Ci3CwRxRivwrzX7QtCPvY6z2bktk+cO4IyBCkPsU9ojQ0JYlv4tBel2qn70Fag0fVQaW6LFfFdXNyThOmT424fr0h/kftFbOErQ2xnROJilspYs+ts0iQNlqDoJEgTlHW0KWu0gSb/0soPJpY5Hcxz9bEV01sg8NYiWeQOdODGBc8kMMfZWjd6QsMb7cRtW6gGSnLkxq+IbvbRjmAqCvzyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnPVvZz3NF6SwEHE6Fqn4eamYxj+V06oBD0ro8JbkJw=;
 b=ed3u14tKBl8TDG1mUKW9Nul7U5zI+FsAkw2lYAFwXxuQTdYUhTh5weDVDq3NvyWtm6EExHynEsx8hfMpmR+WD7Jc52ca+2ans6b9Wn/3SPg/zhA2+nCkyR79RmACNzzuduNHj+uH+OUJEtYZ4hTcuCfXM2N8ISuDnFhwOIW5k6EOSu5JwqgsqccI2o0hPza1VCgAeQmBX0e0hCgl3XFHKLwVpKYcrTe+Kgn3MJERUn0agxy7Xhcj+qtcMrZT6rQzpeQQ2O4/Dd/8wKhjLsy+gay8TuFIAFfPr1WVnzIFUCB1FfAXJtyu5el5S23Gi/cpuC2pX/wNU9M3q8UVA29cNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnPVvZz3NF6SwEHE6Fqn4eamYxj+V06oBD0ro8JbkJw=;
 b=TnUTBfRYHHZN3doUNaX9BWMUQGEedyjqIrQ1x/FZvH+sPYFpxMpQvBNH5quQ+ALx9lqdA6DuYFks5rm8+KvkoxjqwALnH//i35EO/7Cs7W2aIeyIZPyLPT6YmosFAXrV8AdN03K/VHreK3CWZGrGzcvvk8qTwpmOIX4bgl/KWCo=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by BY5PR12MB4033.namprd12.prod.outlook.com (2603:10b6:a03:213::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Tue, 22 Apr
 2025 22:15:02 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 22:15:02 +0000
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
Subject: Re: [PATCH v2 2/3] usb: gadget: Use get_status callback to set remote
 wakeup capability
Thread-Topic: [PATCH v2 2/3] usb: gadget: Use get_status callback to set
 remote wakeup capability
Thread-Index: AQHbs3HnTwTLCCv6IUKdGaXfAvEVWrOwQQ2A
Date: Tue, 22 Apr 2025 22:15:02 +0000
Message-ID: <20250422221453.sjbgkhr7yuegvmu5@synopsys.com>
References: <20250422103231.1954387-1-prashanth.k@oss.qualcomm.com>
 <20250422103231.1954387-3-prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250422103231.1954387-3-prashanth.k@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|BY5PR12MB4033:EE_
x-ms-office365-filtering-correlation-id: f3b22aa0-7121-490e-86fe-08dd81eb210d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TnlBOXdwNWVkdkVvME5SZVFoYjM3aXJLMnZCVFptV0lCTnNkcWtVcW5NQlY3?=
 =?utf-8?B?emRVc0VtQTA3a2dvbFVEdTZhRnRtSFNUNjhxWFdSYmlLQjkrckp2UjM2Z3Zw?=
 =?utf-8?B?SWJjZnRkU3NmMFdhZGlIMzJIdUszVU9GU2VtMkpCVXR0cUovSTdrYWRRRDZr?=
 =?utf-8?B?ME9WQWRpMW9sZTdHRGcyU2t1aUtOWXVtcGdJSmhucFozd1ByTjZnSzBNVlpQ?=
 =?utf-8?B?K25oQ29HbGFqdU1zd1FZRllaNHlLbENZckJ3QlJrUzRCUmlFRFJqQ1ArTW1p?=
 =?utf-8?B?SGsvYU5jMWJWRk4xTkhmY0lwc1pISmVBRllwd3lOMUJDVzJaY0o3L3IvbzA4?=
 =?utf-8?B?ZWFCZ3VEang1QVl5MkFvWkJLVXB1ZDZCVUc1b1ZpL0hPbVFQMHg0MnpndENI?=
 =?utf-8?B?UlFCZnpoY3JRcTBERjVEMVF2U01jaTg2T2xNekt4S1RGaHFJbHpUd2tGWUs0?=
 =?utf-8?B?NExVY2RzQTZ1dXFlTXlvZ0M2aXNwTnA2Yjh5YmFsVXBIYnlMMENqQTNvZC81?=
 =?utf-8?B?TzdWVTZXaEJDSFpDakw0Y20yWkkyRGdTQjdiZjFDY0JoaXRZMEkwVGRvMmdy?=
 =?utf-8?B?Skl4dDNRS2VUeGpBa3ZNRHdWTW1FOHlzSC9qWTZpY2hjeGV0blorR0svTUhM?=
 =?utf-8?B?ZFIyQmtVaTgvL2wzZm5Pem93OTd4Z091ZjY4VlRFRFJkbjVxT1k5SEJKMEx2?=
 =?utf-8?B?Y2sreDNlakt3VkkxYnRCTXVIdGtReXhRSkFqcDN4V0x6bjJxQUxDVjFuSlp5?=
 =?utf-8?B?ZHZBZWYvNzM2Q0VYczF2eldzZ3lhcWVML2NhU3VXaTdMMTdQZTA4VjJCY014?=
 =?utf-8?B?MjVUcnhWNjBEcTNNaUJGdFhwbmJXdG84aUZTRWxGOE45dzlHL2p0RUVyVkhF?=
 =?utf-8?B?WnhrRHh5eTBzdXllZWdwaWluRnpXY2lBZktFU0dKVlpiTTdpb3pMN1R5L0s3?=
 =?utf-8?B?VGlCTmdjUURwY1dEdklHY1RIcENwY0VHNGc0dEZSUmtxcGpPVEZhVEIzQVFm?=
 =?utf-8?B?bUlUdWJFZGMrdWRHTnFpbXh3dWNaeVBjMTQ4V09DSUZvVnBuU3NKcjh2R2cy?=
 =?utf-8?B?cGNrRUJDb0FuVkd3RUJUaS9vbUNQUkh1MG14alE1RVhsd0lLbHhMRlArZjBh?=
 =?utf-8?B?dzZWRndyYmdyc1IyUkorNW9WUDRicEcxNDBmUEVjMzk0bEZWMi9iTis0SDVY?=
 =?utf-8?B?RnhlcEJJdFFIcmRCMVgxUnhZczhtMWFDWEt0MzQ4STJKZ1B0c20rMVpvS0cw?=
 =?utf-8?B?bExkNmxtN2h3a29BV1kyWE12cHBFQmtSZkh6L0lOMXZsOHQ1bHAwVDk4bUxy?=
 =?utf-8?B?a1JlQXNOZHhWVFYyNFlmZHdtTnhvSFJlL2o3SFRIWU13SDlNQXhxb3FFcHVR?=
 =?utf-8?B?QkQyUzVuR2hnK3JGbjNzbGo1czZxOFdhSDRiVTdpZXM0YjBwcmlQMkdvL2hi?=
 =?utf-8?B?NVpGcVhsbFJUMGx0U1QvSXZhaTQxeklyR0xrdTR4b1ZGaHFhVUFTaGI1Mkc2?=
 =?utf-8?B?UkJBdkxBaGxteExlMzBTMFRFNjRobUw2RXFBY1NzNjlUNFh6ZTdWUEhEcC90?=
 =?utf-8?B?QUlRNFNqL21ieUtQdVYwMVVHTEFDaHVsSU9qMVp1b2w2UzJxWUFKTFlEd21N?=
 =?utf-8?B?Rk0wZVhNUmlPMEpkd3RoTmM0ajBOcWZLZXNmMGxNWWwxR0tER0FwOEVCdnhH?=
 =?utf-8?B?Z05pdFh4WXBUTEE5YnNGbStuVVNwVS9qWXZmYjVBbGFOajFVUThiVUdTRUR1?=
 =?utf-8?B?QmJBSWhCY2h4MkdXaHRqdVZsNFJ0Skttd0VBQjh4b3A5TjVQU1lYM1lJSDVs?=
 =?utf-8?B?R2x4WkYzSnRBVmxGME8yUGNsRmUxRmsrYlJEd0dKYXByYnhxNStoMmVHYU10?=
 =?utf-8?B?eTFOZUFDL1czaSs2NWNLbVZZZzBocXIzSFllVHpWQVJmQk56WHlhU1RyUXZZ?=
 =?utf-8?B?QnJ0Qm9FaHZIa01GMXVYSCtBK1VKM2VzSUtiYy9UVHg0bURGTFc1NHlKK05H?=
 =?utf-8?B?VEJlZU43WTNRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SEhkK2x2NzFXcnJ6OTMwVXAvdlZsR0VWYkxScDY3bmM4TGd5R0hqblFGU0pM?=
 =?utf-8?B?MnpOWkV5OUtreVNBbmptZTVDeUdhR2t1SWNMZDRUbURHWVFLTG5henBvNjFQ?=
 =?utf-8?B?Q2tlbmJ4NDZ6T0FBZ0ZEUDduUE9CQmhadlROc0xrTG54OGF0U3h6SitZeFYy?=
 =?utf-8?B?WUI0UkZLNUQxRkVKK1FHVTdVNCtJam82MS9ObmJiOW1Hd3dJb1dmMS9SbU43?=
 =?utf-8?B?L1VDeE1EZlpMRE16OVk2U3M0dURRQjRPZER1QXBIY1ZoK21lUVdWc3poOUpI?=
 =?utf-8?B?RSs5VHZUUnBHbHRNc045T2NDMjBlSzBQQ2Z6aGY1V3I4ejhNa2ozUHRTdGtv?=
 =?utf-8?B?WDZ4aXFtS1NuaEc0YXFWL3UwSWxOS1c2VzR6S2ZqKzFVZlpxbUR1dDFWb0Qz?=
 =?utf-8?B?V1lGZllQbVdpM2p0bVBhTEU1RHJvenBMN0NoY29WZ2E3RVdOZDRRYmdhcjFQ?=
 =?utf-8?B?NGZiOGx4djFrdHBLV3BkanpQeHdkSThqL3ljRGxWQytxVFdoSTIwdXZZamtR?=
 =?utf-8?B?RzBXay8ybjUvNnlOS3VNMk9lYjRpRStybHV1cTV3Wm02bjZCcUp3UlFnVDNH?=
 =?utf-8?B?cTVJK3RBaHlBOG9QelJuQWNnQWNNWVg5c1A3UXJLTW1oMHdLSGFFMWFUcE9S?=
 =?utf-8?B?RzBWOXExZ3JIY0dyWDZKWnUxMmMxTllkTitoMFl6WFVMclIvRjdtZkhmakVx?=
 =?utf-8?B?VzF0YlhlK1RIMUpldkdsN3VOeWNkdHlxTzQ2Rk9qNTUzcmJpWjR3czVLQUNt?=
 =?utf-8?B?RVh4U0xQT09uRjhYOG0vdnkrdzJoSFVaSHhDMWlhbERUM2VkaVJ6RU0waDlN?=
 =?utf-8?B?K2IrK3lJanM3Tjc0ZXhCUExsenYwQTljZWRGWkZxbVlZYXNDWHJ1Q0VjS0dh?=
 =?utf-8?B?K2lBVVlIRXRzR3RXNUYrUk1ISFo0THMzeENZcDFZcnNqUVpmOFVFMi9ITDhl?=
 =?utf-8?B?Z3J3dmZzTUJTOGFMaGpFclpCUFdsa29FaHRRN09yOVFZVlhIRVJjSWlydnZl?=
 =?utf-8?B?QVY5aC91UmJLYjlDbldVeEpkTzVqYTRucHQvSzlkWFhBSHIyOURoYi9ESUI3?=
 =?utf-8?B?NkF5Mm56MC9RTUx3MEh2QUxBQTNITC9zNi9GdkwwdXl6ZGpyK1lITXRPYzZa?=
 =?utf-8?B?ekVid1o4ek1rYzdZZWtUOUFhQ2syRWlqSk05NTJQT3BnLytoa214U2pUMm5R?=
 =?utf-8?B?cUlaOEhpTXQxYTMrZjlTVTdHK1FxWVNYcWphOXppM00wWWtkd3lkR3BIWHlO?=
 =?utf-8?B?dHdYZXlLN3RNdHVOMnZhRC8xR2ZBMmd6Lzdmcm1RbzNiTkxTazIyd2R6VzBG?=
 =?utf-8?B?bHF4a05UWmdWeWo3b3RqVmxSa1c0a1ROL1NlTlorZjFJYUk5UnZQSXRGUUF3?=
 =?utf-8?B?NVZxUmVGbktLMXR6VEsvc3BqOVp5YlRMR1d0b3VjVko0ZUNVempnNlhaNW44?=
 =?utf-8?B?RVpncHBoeElOQ2NMS2NLUFNkNTRwak95MVFnTVVJOWVkRWZWYWtVWWdQS3Fj?=
 =?utf-8?B?MGMwWlNPcWcrYzYwWkJmeW1pYzIvZVIvQ1B6eWZ2cTJNcjB3Z1NMZElna3pN?=
 =?utf-8?B?Q0VIT1ptdDYyZGdaZ1FjVnVyeTE1RnlYOER2K0swaXFTcFJrS282eUNwVGxM?=
 =?utf-8?B?eHhRRm40c2tQKzZEbTlGbEFRVW5RY0tEUU1pNDZRdWhZc2hYR05SdllZM0lT?=
 =?utf-8?B?a25UZUZGYnVITit0OStMNUxQbzB4QWtEUFBOQlMxVEhjeXpHdGpWOEQvS1F4?=
 =?utf-8?B?QWZWUjFNU1pyN0dqN3ZCS1Q3ZHdsWG5KS0NDYW8vVWh5WW1sTlVYQUtIeCs4?=
 =?utf-8?B?MGp1bExQWXdUN2hyNkxQK1JmdmhSZWtYaG9yeHRFS1R3VEVFQ1ltY0tqNTU4?=
 =?utf-8?B?NmdNbkVDTzZUSUpKY091Vk9oQjRjeSt0bElKQm02WVZOWTk5N1pBUkJDU3Q2?=
 =?utf-8?B?K3lRckJxbVU0U2ZnM09Qbm5Qc3hQOGJLTzZYK0dIVTUxTlVlRzgzdEJOV1Qz?=
 =?utf-8?B?a3hvMXNxTXpCQzYyS1IwNU44NlRLaGVwMkpqZVNyS0l4QVJwd0lmUHpDbDRv?=
 =?utf-8?B?c3FtdkpVRm0zSjdyMmcvWEpOR2hBQW84SlhsbUNUUnlPZ1RpZ08vN2xvLyti?=
 =?utf-8?Q?pTEzKOEYJB9pNt8K7IB9OAOkF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEA2A779F9688D4B80EB12DB404BFF6E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Nh6HU9CLoK8ZWnGOVXnrHbdeSjoConKCM2T0NRjFkJuFwHXwpj4L9Xyazixsf8N3bfi/VD2Zg5bkum0ez/i5hxC+A675Xq2sRhfPx1u6b842DYlNU9ElHVao9y54SzULSo8NK7G+NKIb1o9rebiSujPuyeWvC/YV7DetLKJg8i353VgEkWx/vD/vuanYVc+3j3qs/1Ph8e6EMTZe0EAdoQ+gXyjwR4rNSyP8bjqabPz+NL4njmupDn9RRetXSCwNy/cLRQbBW166EHk13JjpVwq9uyWmqokxZTm9ckVh8YgFysv9ZsXY6zD55YA5+3Xf4kJ7t8foOxzAZEKSkeuX1oO+PK0jSPLiqV4IHhItassRtytxpfI2hsc1ERt/k9vQZCwcLyZYfYdYk1XwHsXQm3sgekjxFwF+fxbh3dkfuCA3lMpfXWf4b9ZQnM+4nAHGjL9D44B6rULz06oB7f5fjMU/AMJbZfRnCOtz2IZorhI7inYKGT9osnKXS6C4zfSAg0xJzp4B0WE11uwO4fDeDi4f2yCiMjDmu0c2/Df+RYpXiVg/6pNMpdOxF/rELTg1DdwdJB1KwbMCPJEh0oLWAYgDZQm56c1v/uOvuNlyzF/fhjdMeW5xKV3qDOiP9HdjOZF3uxYR+cyfpECsY0NiQg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b22aa0-7121-490e-86fe-08dd81eb210d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 22:15:02.8048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vgVt8ejlkX5Q57QxMmv/hg7UqerEls+k1RthSoxuk3/ScDKeRUN77PvC+4HmSA4LwsJg3aC5QwicPcumIfbnLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4033
X-Proofpoint-ORIG-GUID: EqjMCwmozZDtKDDNoa56WMj0WschDGdq
X-Proofpoint-GUID: EqjMCwmozZDtKDDNoa56WMj0WschDGdq
X-Authority-Analysis: v=2.4 cv=QfBmvtbv c=1 sm=1 tr=0 ts=680814ee cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=4caDJoMH4mQy6gY4304A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIyMDE2NyBTYWx0ZWRfX10zHJf6gJyIf dlPBEB+WJvwYO7oGamzcjfxoI/94gQq6TwE0ZqF/nqG8hgmgv3rzOnTT7cct6zcK9NStxj+B9hT bRlgVEgd9gg03Ot66Uk/P8xFB2y+Bqk62sFQ9FAiWUB0pm4PN++1hy1+bbvgwQfXbMRAQYcKBA2
 R/Zbr0Gz+1+pybgI6kAmoAPr02xvcxI4fhY/iioP5ZcdIaMBwbeXc+oW3Fak/WpPnVrMrk8lcAe CaiIWidS0U3YjbqYstN2BpeASUNZXVoz1jxl2WDUrKejvyY3+CDgq9lvQ369Tm9U78j7g0UyvE1 5HOfh/oZTNlc4Te2i7QTjFXJ2JHcTjCgvWVm/bh3jbMpucZaGWESOraxB4+3sxqDUUMfn0B9ECB
 aUALklGmxMViX895X79Z3pR+ILG9uTR7fSpIcdKI9fR4k8APX+Hx2TQje+CfvHImqwgXSrS5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_10,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=933 spamscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 mlxscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2504220167

T24gVHVlLCBBcHIgMjIsIDIwMjUsIFByYXNoYW50aCBLIHdyb3RlOg0KPiBDdXJyZW50bHkgd2hl
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
KysrKystLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdldC9jb21wb3NpdGUu
YyBiL2RyaXZlcnMvdXNiL2dhZGdldC9jb21wb3NpdGUuYw0KPiBpbmRleCA4NjlhZDk5YWZiNDgu
LjhkYmMxMzJhNTA1ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0L2NvbXBvc2l0
ZS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2dhZGdldC9jb21wb3NpdGUuYw0KPiBAQCAtMjAxMSwx
NSArMjAxMSwxMyBAQCBjb21wb3NpdGVfc2V0dXAoc3RydWN0IHVzYl9nYWRnZXQgKmdhZGdldCwg
Y29uc3Qgc3RydWN0IHVzYl9jdHJscmVxdWVzdCAqY3RybCkNCj4gIA0KPiAgCQlpZiAoZi0+Z2V0
X3N0YXR1cykgew0KPiAgCQkJc3RhdHVzID0gZi0+Z2V0X3N0YXR1cyhmKTsNCj4gKw0KPiAgCQkJ
aWYgKHN0YXR1cyA8IDApDQo+ICAJCQkJYnJlYWs7DQo+IC0JCX0gZWxzZSB7DQo+IC0JCQkvKiBT
ZXQgRDAgYW5kIEQxIGJpdHMgYmFzZWQgb24gZnVuYyB3YWtldXAgY2FwYWJpbGl0eSAqLw0KPiAt
CQkJaWYgKGYtPmNvbmZpZy0+Ym1BdHRyaWJ1dGVzICYgVVNCX0NPTkZJR19BVFRfV0FLRVVQKSB7
DQo+IC0JCQkJc3RhdHVzIHw9IFVTQl9JTlRSRl9TVEFUX0ZVTkNfUldfQ0FQOw0KPiAtCQkJCWlm
IChmLT5mdW5jX3dha2V1cF9hcm1lZCkNCj4gLQkJCQkJc3RhdHVzIHw9IFVTQl9JTlRSRl9TVEFU
X0ZVTkNfUlc7DQo+IC0JCQl9DQo+ICsNCj4gKwkJCS8qIGlmIEQ1IGlzIG5vdCBzZXQsIHRoZW4g
ZGV2aWNlIGlzIG5vdCB3YWtldXAgY2FwYWJsZSAqLw0KPiArCQkJaWYgKCEoZi0+Y29uZmlnLT5i
bUF0dHJpYnV0ZXMgJiBVU0JfQ09ORklHX0FUVF9XQUtFVVApKQ0KPiArCQkJCXN0YXR1cyAmPSB+
KFVTQl9JTlRSRl9TVEFUX0ZVTkNfUldfQ0FQIHwgVVNCX0lOVFJGX1NUQVRfRlVOQ19SVyk7DQo+
ICAJCX0NCj4gIA0KPiAgCQlwdXRfdW5hbGlnbmVkX2xlMTYoc3RhdHVzICYgMHgwMDAwZmZmZiwg
cmVxLT5idWYpOw0KPiAtLSANCj4gMi4yNS4xDQo+IA0KDQpSZXZpZXdlZC1ieTogVGhpbmggTmd1
eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFua3MsDQpUaGluaA==
