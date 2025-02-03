Received: from esa3.fujitsucc.c3s2.iphmx.com (esa3.fujitsucc.c3s2.iphmx.com [68.232.151.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B201DD9A6;
	Mon,  3 Feb 2025 07:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.151.212
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738567266; cv=fail; b=Z52sTMrl3gkKyPLutp3a++wIPywzmuCqunjA84H1TzPi8AxVcRdofA1nJmnTEY4gTgy7yibnOJo0AtwZHt0iwtB4/f2G+Jlr1C3+5BVYxsME/MdJ/v7/zuhuTNo7FDPuxXIV05F0f0lxurZAywOiFjlgBBDwGk+8oHJqhD/wmag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738567266; c=relaxed/simple;
	bh=zdg+6bjYMFtRke7B/U+zrpmuoFJ/ZgHaz7zJW2cfles=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kMDw5ToMRHA/lGsC3f7jn6Rc73aNXbTEGsFwBWY57EkSVmhIVUQUitOQRY9uRwVYPdAGYFPiDQx8QgHMjDesxFS8fqqAqbT4AZ1XmQDVlLwR07YoyjMKZqiAx1KckHG1xdJbknlMsZJfRZ05O3a3FCVJojgi/Z5PFT8s8dtQt4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=KGXUXfuH; arc=fail smtp.client-ip=68.232.151.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="KGXUXfuH"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1738567264; x=1770103264;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zdg+6bjYMFtRke7B/U+zrpmuoFJ/ZgHaz7zJW2cfles=;
  b=KGXUXfuHiCKby2IENgbLYk9Jkeyf7+L4CxhJJdg1T/0rnJaqg+/sg+Pp
   urpW0Dg9n8/Zkli/4bqmfD8/aRxKvTGmdirxkcKwUcrH7XDoLVLYL0+M8
   f0V5PHO0gMoVDHe/7WGdHhZ4BkrTYjWs+1fuqiGzGAxJcKY4whUzboeC/
   iKASL16hPI+V3URSyhEtARxI+pI5ltTGij4oByYHA7o5cJsoTOx8u8iRk
   0fViXQIQpJzv5Vgp6r92qgDFdZVib7Johiq2hkEC75WfjxeUjCsu4KLPJ
   9cAD0OhuMqqMtKxIaVR3sChj1Xa1/H/O+VSsKSr6KqmBYohQsf3P0p9WP
   g==;
X-CSE-ConnectionGUID: yzJn4B9kQuyXTBkkEC3zgQ==
X-CSE-MsgGUID: vp/GLgLtQuKtd38dP8e0dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="56394830"
X-IronPort-AV: E=Sophos;i="6.13,255,1732546800"; 
   d="scan'208";a="56394830"
Received: from mail-japanwestazlp17011026.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.93.130.26])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 16:19:47 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDb0/9u1+iCcwqE46l89lp6EHYxq6LDTvqUJFl9xZ7oJVHH+707LM2qnRMsu3+B1FOaPnQYk1mh9CwHkZlq+ZUJ71qUAxSIHyXGNtX4F0rZTJvtpUOhPxpiK8WuLiEFxH/3oPB7+ePyZjjSaOd/IgT8WRPbQvxux+TZycuNbeW7u/r1QMDSjnb81dBFOewD2GKY6yzPGmKIWPKBw4cs/leiFq2DIKf/lq81XaKkZFmiPcD+B8qas6hR2j410cStJ1VyZLC2el1aqVuLvpdlYNRjwP4bAeod25XCAo23lNO4WnWbA08JkgrkvGavRpPLFFukdhOlCLY0ov0lGirLPiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdg+6bjYMFtRke7B/U+zrpmuoFJ/ZgHaz7zJW2cfles=;
 b=Rt9UrRSJVapiomNhh7B8HcyqOHzho7v3ZPdUc7xNPFQuV3GlVqvWUgmYim+sD81SCplC/NaN2+0X3AlBclNHIkWVIe2jHn5b0xNjNN2FUkMr9mcS3LgaDrtKu8aULWzo7cVYahwIY6iPFyEXZUD6jYPbqNL3HH0DbLQ23Y3IKx7xbEokOJ81x8xyNO89OknbwmvooFvWJTUsa5LKEqbWw/eFL+l7PMgUqfo3oM26n1ieVPKrnccSigczejelNjfdfUgD3yDOo/YoLKOgce4MxI++0mS59wjy9K9EUgqWuVbGb6BXVWtW09nVXQhEOK4MgWs8znnKbSn0sIJLQBzoHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS3PR01MB6903.jpnprd01.prod.outlook.com (2603:1096:604:12c::9)
 by TYWPR01MB8901.jpnprd01.prod.outlook.com (2603:1096:400:17c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 07:19:44 +0000
Received: from OS3PR01MB6903.jpnprd01.prod.outlook.com
 ([fe80::df96:5745:d1b5:cafe]) by OS3PR01MB6903.jpnprd01.prod.outlook.com
 ([fe80::df96:5745:d1b5:cafe%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 07:19:44 +0000
From: "Yoshihiro Furudera (Fujitsu)" <fj5100bi@fujitsu.com>
To: 'Jonathan Cameron' <Jonathan.Cameron@huawei.com>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Bjorn Andersson
	<quic_bjorande@quicinc.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
	=?utf-8?B?IE7DrWNvbGFzICJGLiBSLiBBLiBQcmFkbyI=?= <nfraprado@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 2/2] perf: Fujitsu: Add the Uncore PCI PMU driver
Thread-Topic: [PATCH v4 2/2] perf: Fujitsu: Add the Uncore PCI PMU driver
Thread-Index: AQHbZ9NtKAz3yQpZFk6cW+YLnrCtVrMvo38AgAWklbA=
Date: Mon, 3 Feb 2025 07:19:44 +0000
Message-ID:
 <OS3PR01MB69039267F97E630023563FCCD4F52@OS3PR01MB6903.jpnprd01.prod.outlook.com>
References: <20250116045911.3382537-1-fj5100bi@fujitsu.com>
	<20250116045911.3382537-3-fj5100bi@fujitsu.com>
 <20250130170826.00000299@huawei.com>
In-Reply-To: <20250130170826.00000299@huawei.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9OTQ5ZTg1ZmMtODFjMS00NmFkLTkxYjEtODY1ODY0ODk4?=
 =?utf-8?B?MWY4O01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTAyLTAzVDA3OjE5OjAzWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?Q?81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB6903:EE_|TYWPR01MB8901:EE_
x-ms-office365-filtering-correlation-id: 19c0b659-78a7-4a10-d448-08dd4423225a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018|1580799027;
x-microsoft-antispam-message-info:
 =?utf-8?B?amdrWU0zdk5DWmMvYUg0OFIwZXlkTGFlTk1iN0dhSW42M1FLVkdPc0VkOTdL?=
 =?utf-8?B?QWhJVnNvZEZJMnByMVVrYWl1WUJ2Smd6b2NNdWRiQTUwZFJ6VlNFMkE3UEk5?=
 =?utf-8?B?R3l4cHp2M0hpem1RcE9Xc2QzR3JCYmI1SmxDalBqcnhOOVpHaXIydU9Ec0Zt?=
 =?utf-8?B?TDFOQ3VkUXc3ZFlqQ3NXckZmOHB4L1pvMExTamhESFdUajJNSFJEc1R6VXRj?=
 =?utf-8?B?VE5INzFvZkhkQnRlMG80eVhrenhicERYWExNWUdQK2ErZ3hQMGhyQTE0YUY4?=
 =?utf-8?B?ay92N2xBNXdFVVljQXltdXBiREpBby9sYlVCd1pqUjg0aXBkYzF6S2xoT3c5?=
 =?utf-8?B?NnRQLzZaMnRpNEsyeXRiMTNIWE5POFdnUmZNNEJSVjN2OHRvSGljMG85aDdN?=
 =?utf-8?B?amNWbmVyM3krOHVvRDF6S1NabG1XZEFuNUFralRQWU0zbHFVNmd3OVpkdVk4?=
 =?utf-8?B?YU03QVRtTmFKbmtNbDhZOG9NTnVla2NSeFV4SU8reGFJYXY3VnJqZm5aMnRz?=
 =?utf-8?B?VndsUXlGdXFsMENBamt0Qm9xeGF0YmN2MndaVTBVQ0NSKzNpWHB3VW5wZ1dW?=
 =?utf-8?B?bW5ORGpYSTA2QVZhQjZmUzQvWG1XOXNhTVVCd3pSVk9lTkRDSHR0V0J6N1g5?=
 =?utf-8?B?cllhc1l4TGFHNDFscnBLOHYxQi8zalBmZW9OdE9CVm4yQXZpYWwwRC9GN1NX?=
 =?utf-8?B?ZHpaaHBPODc4RW5hZjE4RmtEZFhBV3g0Z2lFSGxWV0xQMS90TW83QlFzVGRo?=
 =?utf-8?B?b0E5amk1eGZPVm5PNXZIanpWLzhFN3NqRk5HMktyRTNKV0gwa0loNDRGUGcv?=
 =?utf-8?B?dDlhRWVmVE5aNkNUditSdml6WGEzMFJNdnEzS2xPcGVzbGlsOUNIRUhNa3RX?=
 =?utf-8?B?SlFNNUw5aGVOUTVYaVpCc3NIenlidno0bW1YYkhjOTlVQnhUZ0pFaXlyaks1?=
 =?utf-8?B?dS9pL0F6RFd4eWwyWmFFN2trMW85SVNwdzh2RlloL2k0cG9sa2NYVGlFelBw?=
 =?utf-8?B?cjZqWjFhZWlkQUIzWjAxMU5MRWVWTTFmUElTK2MyTUU5VW00TVJUZFdEbFox?=
 =?utf-8?B?Mm05RFhwUnRybThGR2RjOVYxV2hxOERPRzJ6ak1pTkh0OEhFVkJTOGxRTG1k?=
 =?utf-8?B?VHg5OVhTOFVCRDROcG01RHBuL0U0RTdURnZlaVdDM2g5clVYc0oraTZOZVB2?=
 =?utf-8?B?ZGdLYndWZXRYbUF2bmNxVU5nZ1NHWVRwMk81S2Ywc2JDdmFXWXZ4NS9oWTRR?=
 =?utf-8?B?bzMxaEd3RDVMb0x4Zi9ud2E2UzZ4M1hkQzJ6UU5uelJzN2ROTTNjM3JhcVZK?=
 =?utf-8?B?NlBuc0V4ak5xeVpsRWxQb3hHa00xL2V1TnFGOVE3QXhiVHFDZStKTTcyM1ZU?=
 =?utf-8?B?azhNU2haeGtJMlgreHByRkcrVkRJSEtObXVQL3YxaVF0a082cjlzNlF1S2Rn?=
 =?utf-8?B?MkM2WUZpZHE3Z0VBdktyUU1nQkdGRC9DVktyQjdZc2svUzByYktYRXhLZzJ3?=
 =?utf-8?B?c3R0MDFNT3lSQWVhTFpTTTN6MTc2MVU3eEQ4T08xRXRKbm5aWENpMU0vRzdu?=
 =?utf-8?B?bTVLZVNxSGJQRm1LdWNIc0FzMjJHNlQyRzcwMTBJeGVkU1JUamtibFRMUnJC?=
 =?utf-8?B?YW5wUVQvUWUxNm9jaTg5M0RZM3N4SFFQRGNjdWhFSVZsaWZrNlRvTDdaMDVp?=
 =?utf-8?B?RS9EVDFOUGpkdUVRUHZLWG83NUJzeHQ3TEJHejIvNUNtVXhac2U2aXRTUlpl?=
 =?utf-8?B?WkNZNHhURit1TEZ5RXRBOFVQQnJ6L0lnSTNFVUlCZ1g5RmpWQlYvN3lBenZt?=
 =?utf-8?B?YytVNHRaZWVjRzBlRjVtVmIrNnNvVkhJV2pMU0Vpc2RINXhGQjlZM0IxTkEw?=
 =?utf-8?B?cHl0MmNuZ3d0dmxjR1M1Wjc1ZFU2dSs4T1BEaXdFcGM5TUVpZEFWei84NmJp?=
 =?utf-8?B?d2Rzd01ZbVBIWFVSQnM3U1h4UWROZnFPbXgvOW1MVUZrd0VDVVpMbEt2Y0xW?=
 =?utf-8?B?eTU5Mm1UWmdRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6903.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YUpPeUVKSGxMUTdidE9FVkU1d25BcnlsMng4bFN6T2dUV09zUStobU9JdlJx?=
 =?utf-8?B?MW5TcUw5QzN4bUhHTnBzKzlkQjZzN0NFREFJcVZrYUVnbFBBSVQrL3ZwMmxT?=
 =?utf-8?B?Y1pVRVdPRmtSUzYxL0FNQ2ZxbFFNZndpbGhudUlMdWJLWFlvVUdLcU4zblJT?=
 =?utf-8?B?cTY4bm1FbFF6aDVQd09RVk9pdFZWMjRmT0NZR3BwWlFYbDdPWEZBdUxPeFlp?=
 =?utf-8?B?dG9YZFFGNWg4N1NxTkZjTVFoRDZqbUpnNEVaQS9kNkJabllVNFpOZ3R2S3Z1?=
 =?utf-8?B?Tno3UER6SnlwUE9FVlRVUE5vTnZmZ3ZpU2FIQXFVbitFUXR2QWJSTDZOVXcr?=
 =?utf-8?B?OHBOYk8yN0wyZWtEYWZRTVpQUXd2TVdVbVB3d3hzTHJDcUlJSnl0ZEkyaUZK?=
 =?utf-8?B?RmxyUFBsZVJrbDhOREJ3TW1DbEZrM2ZzNi9lUWxEUHU0VWJ1T1FZeDI2RlBo?=
 =?utf-8?B?RTkrNTNXZy8rVUpOZzBZMzNMbENIU3lkYlJWWG9tZzhpeXdWOXQvK0Rhd1dL?=
 =?utf-8?B?WUhWNzh3MnZsVi80aFh1NHZmKyszOWFSa2tzdlV2cXQxMHRkKzJFSzFkOUtV?=
 =?utf-8?B?dzNqbEcyc01TMUFZOEkxZVo0TFpHeGNNUXF1MEFhRzNaNUpjdmxpUkttc2U2?=
 =?utf-8?B?RXdCUG1obmFVWDE5c091MGVSMUpVcGN3N09WK091NU02STlOZHZqVmc5QVBF?=
 =?utf-8?B?dFZ2cndBWHdpUUpzVlRJU2pPVEpIZmxUYko3c1RObER6TlVTV0Y3TUxoSWlU?=
 =?utf-8?B?NnYrUEtDWXk5OFl0NWMxUTk0cjRNQTJKL3krRmo3cXBHNE1XVXBSQzd2NEdj?=
 =?utf-8?B?T3d2U0tXaHo4cU5DZmlQMEJZcVptYkd1UGg4NlZhSVdicmFNcVdkcTJFVU1W?=
 =?utf-8?B?ZDV6d1JsbHljOGN4UW44WXF6aVFINEVaL0wvVmpoWjlIN1JOenRmN1JBVXdn?=
 =?utf-8?B?Y1pwRk92NnZlek1SMlRLM0ZqdmdRbndzU3JnNzhSNFpmQkVKd0cxYUdpN2JX?=
 =?utf-8?B?MjBOWGlEUWJyeGRRRTduYW5CYTJzSW1oMWZUTmUvajNBSWdJb1VUaTExcWZO?=
 =?utf-8?B?YlFKQTVORDk1ZGhiY1RyQkcyNnFZeGlhNjR1VUNSUXV0dURqNGRCdHYralZQ?=
 =?utf-8?B?UkhDZmpuSUl5NEFvcDNMT0RTYmJnQk1CdTNNU0ErOUlOeUdIeGUyd3JiR3kw?=
 =?utf-8?B?Ulc0SzN6VkJHTS9Ic2dDU0RLdS9rNllvTDFoVmxtQkNVSDlLWVQrSW8wWXRB?=
 =?utf-8?B?SHVJdyt1dURoTld2KysxQjAwczN5NjM2UkQ3dVF2L1k0dXV2VjI2V2ZhNm1q?=
 =?utf-8?B?TjFwZ1lqQzAyeCtPU0g5MmxUeEsxRm0wc0t4cDdUd3VySXZrTnFoY0FMS3Qx?=
 =?utf-8?B?V3orbFNYejRIWnJOSXUvZmFrZEpuZC8xU1BZZ3VwT2laK2RuRmhHTDUvMUQr?=
 =?utf-8?B?T2xjOW9oWFNjUUZhN09GejIvN1VsSWI2dkhvSWhqTGFFN0lackdzNFJOcWpS?=
 =?utf-8?B?L3M0MjNyTk9IYTlJOUErVWtmRCtsRWo5ZnIwMVpoeUNQR1JOWlVoSFJCUGVh?=
 =?utf-8?B?aGxUeHhKT0NPRG0xYmNPM1NQckZnMzVybnF4NWVtaTFON0ZwMFFLWnVpc0FR?=
 =?utf-8?B?Z3g2Rlo4ZU82Zzc1a0NEay9JU1d3QUdoMkMwZUdkT2VSUU5yREpuMms5MXNk?=
 =?utf-8?B?NWNabnBUeC9YYmFORlRqQURBZDVmUDdDeFlFR2VZZWRzZ2NFa0Eyc0xoR3VW?=
 =?utf-8?B?QTFkaVFnTjNSdzFvaml2VFFUNkdyWG9icm1ZSTJIN0FJSzh5Y2NtaGxibmgx?=
 =?utf-8?B?bUtqdUNldUdlblFEeGh2NUl0QU5JMGV5MUMwbkV6dVQvaHRYdGN6YXcvMTkw?=
 =?utf-8?B?Mmk0K1M1cFJHWEtFVS9wNndndzQxaXlHMmFMOGlkMjRNQVd2R01wRkxiQ0tR?=
 =?utf-8?B?UEx3R0lheVRmc0N4N3NUd01DNlgrQmpsQWgwSU05NnZlOEN6cFAwM3dJUEZJ?=
 =?utf-8?B?SlliRG5QWHlqYTdYanhDc1NLS256QkxCUDFyYnBiM3ZYT2VrUVRlSkszMWJy?=
 =?utf-8?B?STJRSTBZMlJJd25IMVM2UWVqbXhWVmhZY3lEMU12VnRKTnVZOVE5UFJja2xy?=
 =?utf-8?B?RW1YYmZzOWZPT2dBVnJaU0ZYSkpKZmZ1ZW1mWFI0NlZLaTY4b3o3WkhKbDBl?=
 =?utf-8?B?Umc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qInx6TAfxK6j7Pevvl2w4OKbgKk+ARJSWE3cauSPmqpgfZkx4Bg1B9PIRbGR7sAKTYOGafhPslVae3mE7kc8jy/O6fCuEIwWyF5LeXz/QWl17ul7sKWeKnOv8zKCaqnZ9+fN0ppmnui/iGU1PDDUHhCP24Ez2A3kcfFz24gRRdOg5KSA9QM6IMfWzg/JY+z9/FYLaoXWh4LOvyL+8uovAild3+ob91g4lj4l4USj/XlZJemU84/8eIMxBr26fKWQvCqW6OF/8D9j39TDw5sTvCHF23m0HDr9Qbzp2KEcHB5AE9fJAaxX1up7h//lP88RdUA3zC8dR9ZIWxi7oUaA5k24Ru9Jk29hYg5660vRWzGJkIXzXzALqkltVta6e2cWCQmbvWyHRGJa2ZJwNBzumX8omi+4Y44M8WxQ2IzRCd/uoRXiJ5rXbBhHHN2+HmvRTJqejKZLp5XGFpnJ7oOJnknFHTngX5TtlBF4gey2pe5pVjWKiuHSCXbI15dA9iGHEc4Otk8AQPZwlxfVvSoault3Bg7wu7IDVMhAw7fF4AhQRd0lYf9ajhHWV3jxjefJrUpz4VTuqyyy3MEuW5eKKCDEOKkelMskN02oKZLgGaQ1guLHaJb5UzapfCsm4W+G
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6903.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c0b659-78a7-4a10-d448-08dd4423225a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 07:19:44.7278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f3LMJCgC5F0kpFsaGAhixcmH0yUysgK4OlKCbxTOvjhKpTeEJqfYOe+cDRkWE1lomBaEIIo//7Rc76c/RNz1KbB6XrbKPnbyIX87RgNzGHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8901

SGksIEpvbmF0aGFuDQpUaGFua3MgZm9yIHlvdSByZXZpZXcvY29tbWVudHMuDQoNCj4gT24gVGh1
LCAxNiBKYW4gMjAyNSAwNDo1OToxMSArMDAwMA0KPiBZb3NoaWhpcm8gRnVydWRlcmEgPGZqNTEw
MGJpQGZ1aml0c3UuY29tPiB3cm90ZToNCj4gDQo+ID4gVGhpcyBhZGRzIGEgbmV3IGR5bmFtaWMg
UE1VIHRvIHRoZSBQZXJmIEV2ZW50cyBmcmFtZXdvcmsgdG8gcHJvZ3JhbQ0KPiA+IGFuZCBjb250
cm9sIHRoZSBVbmNvcmUgUENJIFBNVXMgaW4gRnVqaXRzdSBjaGlwcy4NCj4gPg0KPiA+IFRoaXMg
ZHJpdmVyIHdhcyBjcmVhdGVkIHdpdGggcmVmZXJlbmNlIHRvIGRyaXZlcnMvcGVyZi9xY29tX2wz
X3BtdS5jLg0KPiA+DQo+ID4gVGhpcyBkcml2ZXIgZXhwb3J0cyBmb3JtYXR0aW5nIGFuZCBldmVu
dCBpbmZvcm1hdGlvbiB0byBzeXNmcyBzbyBpdA0KPiA+IGNhbiBiZSB1c2VkIGJ5IHRoZSBwZXJm
IHVzZXIgc3BhY2UgdG9vbHMgd2l0aCB0aGUgc3ludGF4ZXM6DQo+ID4NCj4gPiBwZXJmIHN0YXQg
LWUgcGNpX2lvZDBfcGNpMC9lYS1wY2kvIGxzDQo+ID4gcGVyZiBzdGF0IC1lIHBjaV9pb2QwX3Bj
aTAvZXZlbnQ9MHg4MC8gbHMNCj4gPg0KPiA+IEZVSklUU1UtTU9OQUtBIFNwZWNpZmljYXRpb24g
VVJMOg0KPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9mdWppdHN1L0ZVSklUU1UtTU9OQUtBDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gRnVydWRlcmEgPGZqNTEwMGJpQGZ1aml0c3Uu
Y29tPg0KPiBIaSwNCj4gDQo+IEFzIHlvdSBjYW4gcHJvYmFibHkgZ3Vlc3MsIHNpbWlsYXIgY29t
bWVudHMgaW4gaGVyZS4NCj4gQXNzdW1pbmcgdGhvc2UgbGl0dGxlIHRoaW5ncyB0aWRpZWQgdXAg
ZmVlbCBmcmVlIHRvIGFkZA0KPiBSZXZpZXdlZC1ieTogSm9uYXRoYW4gQ2FtZXJvbiA8Sm9uYXRo
YW4uQ2FtZXJvbkBodWF3ZWkuY29tPiB0byB5b3VyIHY1Lg0KDQpJJ3ZlIGdvdCBpdC4NCg0KPiAN
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJmL2Z1aml0c3VfcGNpX3BtdS5jDQo+ID4gYi9k
cml2ZXJzL3BlcmYvZnVqaXRzdV9wY2lfcG11LmMgbmV3IGZpbGUgbW9kZSAxMDA2NDQgaW5kZXgN
Cj4gPiAwMDAwMDAwMDAwMDAuLjJjZTJjYTE5YjVlYQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiAr
KysgYi9kcml2ZXJzL3BlcmYvZnVqaXRzdV9wY2lfcG11LmMNCj4gPiBAQCAtMCwwICsxLDU1MyBA
QA0KPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5DQo+ID4gKy8q
DQo+ID4gKyAqIERyaXZlciBmb3IgdGhlIFVuY29yZSBQQ0kgUE1VcyBpbiBGdWppdHN1IGNoaXBz
Lg0KPiA+ICsgKg0KPiA+ICsgKiBTZWUgRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9wZXJmL2Z1
aml0c3VfcGNpX3BtdS5yc3QgZm9yIG1vcmUgZGV0YWlscy4NCj4gPiArICoNCj4gPiArICogVGhp
cyBkcml2ZXIgaXMgYmFzZWQgb24gZHJpdmVycy9wZXJmL3Fjb21fbDNfcG11LmMNCj4gPiArICog
Q29weXJpZ2h0IChjKSAyMDE1LTIwMTcsIFRoZSBMaW51eCBGb3VuZGF0aW9uLiBBbGwgcmlnaHRz
IHJlc2VydmVkLg0KPiA+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjQgRnVqaXRzdS4gQWxsIHJpZ2h0
cyByZXNlcnZlZC4NCj4gPiArICovDQo+ID4gKw0KPiA+ICsjaW5jbHVkZSA8bGludXgvYWNwaS5o
Pg0KPiA+ICsjaW5jbHVkZSA8bGludXgvYml0b3BzLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9p
bnRlcnJ1cHQuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2lvLmg+DQo+ID4gKyNpbmNsdWRlIDxs
aW51eC9saXN0Lmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gDQo+IG1vZF9k
ZXZpY2V0YWJsZS5oIHByb2JhYmx5IHNob3VsZCBiZSBoZXJlLg0KDQpBZnRlciBjaGVja2luZywg
SSBmb3VuZCB0aGF0DQpsaW51eC9tb2RfZGV2aWNldGFibGUuaCBpcyBpbmNsdWRlZCBpbiBsaW51
eC9hY3BpLmguDQoNCj4gDQo+ID4gKyNpbmNsdWRlIDxsaW51eC9wZXJmX2V2ZW50Lmg+DQo+ID4g
KyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4gPiArDQo+ID4gKy8qIE51bWJl
ciBvZiBjb3VudGVycyBvbiBlYWNoIFBNVSAqLw0KPiA+ICsjZGVmaW5lIFBDSV9OVU1fQ09VTlRF
UlMgIDgNCj4gPiArLyogTWFzayBmb3IgdGhlIGV2ZW50IHR5cGUgZmllbGQgd2l0aGluIHBlcmZf
ZXZlbnRfYXR0ci5jb25maWcgYW5kIEVWVFlQRSByZWcNCj4gKi8NCj4gPiArI2RlZmluZSBQQ0lf
RVZUWVBFX01BU0sgICAweEZGDQo+ID4gKw0KPiA+ICsvKiBQZXJmbW9uIHJlZ2lzdGVycyAqLw0K
PiA+ICsjZGVmaW5lIFBDSV9QTV9FVkNOVFIoX19jbnRyKSAoMHgwMDAgKyBfX2NudHIgKiA4KSAj
ZGVmaW5lDQo+ID4gK1BDSV9QTV9DTlRDVEwoX19jbnRyKSAoMHgxMDAgKyBfX2NudHIgKiA4KSAj
ZGVmaW5lDQo+ID4gK1BDSV9QTV9FVlRZUEUoX19jbnRyKSAoMHgyMDAgKyBfX2NudHIgKiA4KQ0K
PiAoX19jbnRyKQ0KPiANCj4gPiArLyoNCj4gPiArICogV2UgbXVzdCBOT1QgY3JlYXRlIGdyb3Vw
cyBjb250YWluaW5nIGV2ZW50cyBmcm9tIG11bHRpcGxlIGhhcmR3YXJlDQo+ID4gK1BNVXMsDQo+
ID4gKyAqIGFsdGhvdWdoIG1peGluZyBkaWZmZXJlbnQgc29mdHdhcmUgYW5kIGhhcmR3YXJlIFBN
VXMgaXMgYWxsb3dlZC4NCj4gPiArICovDQo+ID4gK3N0YXRpYyBib29sIGZ1aml0c3VfcGNpX192
YWxpZGF0ZV9ldmVudF9ncm91cChzdHJ1Y3QgcGVyZl9ldmVudA0KPiA+ICsqZXZlbnQpIHsNCj4g
PiArCXN0cnVjdCBwZXJmX2V2ZW50ICpsZWFkZXIgPSBldmVudC0+Z3JvdXBfbGVhZGVyOw0KPiA+
ICsJc3RydWN0IHBlcmZfZXZlbnQgKnNpYmxpbmc7DQo+ID4gKwlpbnQgY291bnRlcnMgPSAwOw0K
PiA+ICsNCj4gPiArCWlmIChsZWFkZXItPnBtdSAhPSBldmVudC0+cG11ICYmICFpc19zb2Z0d2Fy
ZV9ldmVudChsZWFkZXIpKQ0KPiA+ICsJCXJldHVybiBmYWxzZTsNCj4gPiArDQo+ID4gKwkvKiBU
aGUgc3VtIG9mIHRoZSBjb3VudGVycyB1c2VkIGJ5IHRoZSBldmVudCBhbmQgaXRzIGxlYWRlciBl
dmVudCAqLw0KPiA+ICsJY291bnRlcnMgPSAyOw0KPiA+ICsNCj4gPiArCWZvcl9lYWNoX3NpYmxp
bmdfZXZlbnQoc2libGluZywgbGVhZGVyKSB7DQo+ID4gKwkJaWYgKGlzX3NvZnR3YXJlX2V2ZW50
KHNpYmxpbmcpKQ0KPiA+ICsJCQljb250aW51ZTsNCj4gPiArCQlpZiAoc2libGluZy0+cG11ICE9
IGV2ZW50LT5wbXUpDQo+ID4gKwkJCXJldHVybiBmYWxzZTsNCj4gPiArCQljb3VudGVycyArPSAx
Ow0KPiBjb3VudGVycysrOw0KDQpJJ2xsIGNoYW5nZSAiY291bnRlcnMgKz0gMSIgdG8gImNvdW50
ZXJzKysiDQoNCj4gDQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJLyoNCj4gPiArCSAqIElmIHRoZSBn
cm91cCByZXF1aXJlcyBtb3JlIGNvdW50ZXJzIHRoYW4gdGhlIEhXIGhhcywgaXQNCj4gPiArCSAq
IGNhbm5vdCBldmVyIGJlIHNjaGVkdWxlZC4NCj4gPiArCSAqLw0KPiA+ICsJcmV0dXJuIGNvdW50
ZXJzIDw9IFBDSV9OVU1fQ09VTlRFUlM7IH0NCj4gDQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3Qg
c3RydWN0IGF0dHJpYnV0ZV9ncm91cCBmdWppdHN1X3BjaV9wbXVfZXZlbnRzX2dyb3VwID0gew0K
PiA+ICsJLm5hbWUgPSAiZXZlbnRzIiwNCj4gPiArCS5hdHRycyA9IGZ1aml0c3VfcGNpX3BtdV9l
dmVudHMNCj4gQXMgYmVsb3cNCj4gDQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0aWMgc3NpemVf
dCBjcHVtYXNrX3Nob3coc3RydWN0IGRldmljZSAqZGV2LA0KPiA+ICsJCQkgICAgc3RydWN0IGRl
dmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIgKmJ1Zikgew0KPiA+ICsJc3RydWN0IHBjaV9wbXUg
KnBjaXBtdSA9IHRvX3BjaV9wbXUoZGV2X2dldF9kcnZkYXRhKGRldikpOw0KPiA+ICsNCj4gPiAr
CXJldHVybiBjcHVtYXBfcHJpbnRfdG9fcGFnZWJ1Zih0cnVlLCBidWYsICZwY2lwbXUtPmNwdW1h
c2spOyB9DQo+ID4gKw0KPiA+ICtzdGF0aWMgREVWSUNFX0FUVFJfUk8oY3B1bWFzayk7DQo+ID4g
Kw0KPiA+ICtzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqZnVqaXRzdV9wY2lfcG11X2NwdW1hc2tf
YXR0cnNbXSA9IHsNCj4gPiArCSZkZXZfYXR0cl9jcHVtYXNrLmF0dHIsDQo+ID4gKwlOVUxMDQo+
ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCBm
dWppdHN1X3BjaV9wbXVfY3B1bWFza19hdHRyX2dyb3VwID0gew0KPiA+ICsJLmF0dHJzID0gZnVq
aXRzdV9wY2lfcG11X2NwdW1hc2tfYXR0cnMNCj4gDQo+IEFub3RoZXIgdHJhaWxpbmcgY29tbWEg
bWlzc2luZyBoZXJlLg0KDQpJJ2xsIGFkZCB0cmFpbGluZyBjb21tYS4NCkknbGwgZG8gdGhlIHNh
bWUgZm9yIHRoZSBvdGhlciBOb24tTlVMTCBwYXJ0cyB0b28uDQoNCj4gDQo+ID4gK3N0YXRpYyBp
bnQgZnVqaXRzdV9wY2lfcG11X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpIHsN
Cj4gPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7DQo+ID4gKwlzdHJ1Y3QgYWNw
aV9kZXZpY2UgKmFjcGlfZGV2Ow0KPiA+ICsJc3RydWN0IHBjaV9wbXUgKnBjaXBtdTsNCj4gPiAr
CXN0cnVjdCByZXNvdXJjZSAqbWVtcmM7DQo+ID4gKwljaGFyICpuYW1lOw0KPiA+ICsJaW50IHJl
dDsNCj4gPiArCXU2NCB1aWQ7DQo+ID4gKw0KPiA+ICsJYWNwaV9kZXYgPSBBQ1BJX0NPTVBBTklP
TihkZXYpOw0KPiA+ICsJaWYgKCFhY3BpX2RldikNCj4gPiArCQlyZXR1cm4gLUVOT0RFVjsNCj4g
PiArDQo+ID4gKwlyZXQgPSBhY3BpX2Rldl91aWRfdG9faW50ZWdlcihhY3BpX2RldiwgJnVpZCk7
DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAi
dW5hYmxlIHRvIHJlYWQgQUNQSSB1aWRcbiIpOw0KPiA+ICsNCj4gPiArCXBjaXBtdSA9IGRldm1f
a3phbGxvYyhkZXYsIHNpemVvZigqcGNpcG11KSwgR0ZQX0tFUk5FTCk7DQo+ID4gKwlpZiAoIXBj
aXBtdSkNCj4gPiArCQlyZXR1cm4gLUVOT01FTTsNCj4gPiArDQo+ID4gKwluYW1lID0gZGV2bV9r
YXNwcmludGYoZGV2LCBHRlBfS0VSTkVMLCAicGNpX2lvZCVsbHVfcGNpJWxsdSIsDQo+ID4gKwkJ
CSAgKHVpZCA+PiA0KSAmIDB4RiwgdWlkICYgMHhGKTsNCj4gPiArCWlmICghbmFtZSkNCj4gPiAr
CQlyZXR1cm4gLUVOT01FTTsNCj4gPiArDQo+ID4gKwlwY2lwbXUtPnBtdSA9IChzdHJ1Y3QgcG11
KSB7DQo+ID4gKwkJLnBhcmVudAkJPSBkZXYsDQo+ID4gKwkJLnRhc2tfY3R4X25yCT0gcGVyZl9p
bnZhbGlkX2NvbnRleHQsDQo+ID4gKw0KPiA+ICsJCS5wbXVfZW5hYmxlCT0gZnVqaXRzdV9wY2lf
X3BtdV9lbmFibGUsDQo+ID4gKwkJLnBtdV9kaXNhYmxlCT0gZnVqaXRzdV9wY2lfX3BtdV9kaXNh
YmxlLA0KPiA+ICsJCS5ldmVudF9pbml0CT0gZnVqaXRzdV9wY2lfX2V2ZW50X2luaXQsDQo+ID4g
KwkJLmFkZAkJPSBmdWppdHN1X3BjaV9fZXZlbnRfYWRkLA0KPiA+ICsJCS5kZWwJCT0gZnVqaXRz
dV9wY2lfX2V2ZW50X2RlbCwNCj4gPiArCQkuc3RhcnQJCT0gZnVqaXRzdV9wY2lfX2V2ZW50X3N0
YXJ0LA0KPiA+ICsJCS5zdG9wCQk9IGZ1aml0c3VfcGNpX19ldmVudF9zdG9wLA0KPiA+ICsJCS5y
ZWFkCQk9IGZ1aml0c3VfcGNpX19ldmVudF9yZWFkLA0KPiA+ICsNCj4gPiArCQkuYXR0cl9ncm91
cHMJPSBmdWppdHN1X3BjaV9wbXVfYXR0cl9ncnBzLA0KPiA+ICsJCS5jYXBhYmlsaXRpZXMJPSBQ
RVJGX1BNVV9DQVBfTk9fRVhDTFVERQ0KPiANCj4gQXMgaW4gcHJldmlvdXMuICBBZGQgdHJhaWxp
bmcgY29tbWFzIHRvIGFsbCBzdHJ1Y3R1cmUgZmllbGQgZmlsbHMgdGhhdCBhcmVuJ3QNCj4gdGVy
bWluYXRpbmcgTlVMTCB0eXBlIGVudHJpZXMuDQo+IA0KPiA+ICsJfTsNCj4gPiArDQo+ID4gKwlw
Y2lwbXUtPnJlZ3MgPSBkZXZtX3BsYXRmb3JtX2dldF9hbmRfaW9yZW1hcF9yZXNvdXJjZShwZGV2
LCAwLA0KPiAmbWVtcmMpOw0KPiA+ICsJaWYgKElTX0VSUihwY2lwbXUtPnJlZ3MpKQ0KPiA+ICsJ
CXJldHVybiBQVFJfRVJSKHBjaXBtdS0+cmVncyk7DQo+ID4gKw0KPiA+ICsJZnVqaXRzdV9wY2lf
X2luaXQocGNpcG11KTsNCj4gPiArDQo+ID4gKwlyZXQgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYs
IDApOw0KPiA+ICsJaWYgKHJldCA8PSAwKQ0KPiA+ICsJCXJldHVybiByZXQ7DQo+ID4gKw0KPiA+
ICsJcmV0ID0gZGV2bV9yZXF1ZXN0X2lycShkZXYsIHJldCwgZnVqaXRzdV9wY2lfX2hhbmRsZV9p
cnEsIDAsDQo+ID4gKwkJCSAgICAgICBuYW1lLCBwY2lwbXUpOw0KPiA+ICsJaWYgKHJldCkNCj4g
PiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgIlJlcXVlc3QgZm9yIElSUSBmYWls
ZWQgZm9yIHNsaWNlDQo+IEAlcGFcbiIsDQo+ID4gKwkJCQkJCSZtZW1yYy0+c3RhcnQpOw0KPiA+
ICsNCj4gPiArCS8qIEFkZCB0aGlzIGluc3RhbmNlIHRvIHRoZSBsaXN0IHVzZWQgYnkgdGhlIG9m
ZmxpbmUgY2FsbGJhY2sgKi8NCj4gPiArCXJldCA9IGNwdWhwX3N0YXRlX2FkZF9pbnN0YW5jZShw
Y2lfcG11X2NwdWhwX3N0YXRlLA0KPiAmcGNpcG11LT5ub2RlKTsNCj4gPiArCWlmIChyZXQpDQo+
ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJFcnJvciByZWdpc3RlcmluZyBo
b3RwbHVnIik7DQo+ID4gKw0KPiA+ICsJcmV0ID0gcGVyZl9wbXVfcmVnaXN0ZXIoJnBjaXBtdS0+
cG11LCBuYW1lLCAtMSk7DQo+ID4gKwlpZiAocmV0IDwgMCkNCj4gPiArCQlyZXR1cm4gZGV2X2Vy
cl9wcm9iZShkZXYsIHJldCwgIkZhaWxlZCB0byByZWdpc3RlciBQQ0kgUE1VXG4iKTsNCj4gPiAr
DQo+ID4gKwlkZXZfZGJnKGRldiwgIlJlZ2lzdGVyZWQgJXMsIHR5cGU6ICVkXG4iLCBuYW1lLCBw
Y2lwbXUtPnBtdS50eXBlKTsNCj4gPiArDQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KDQpCZXN0
IFJlZ2FyZHMsDQpZb3NoaWhpcm8gRnVydWRlcmENCg==
