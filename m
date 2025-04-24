Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D295A18C337
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.148.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745501865; cv=fail; b=OPW5OxPolUH2zrmTcMzWXgxxnAOvKDD5Xy8764ORMGpsSBs1gTbAbUTh8g/X3LHogjDPaHzH/0NAKcRVX5t/ohqcLZot6rneGq7TozztlijcAHYVvZB//0wNpWhfL7zpeh1Hjx4tY0mCwu4i4XtiimayQiQE9rTokYyfd/9lc9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745501865; c=relaxed/simple;
	bh=zmaXe37/qs8xySYLPkOODrTZeGORdKNELze9e7VVIIU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WNzTges2DF+Yyf/XShWYEkPL6W42RnMmmjhY32YIMBVcRakjr0ts28QjDhilzj71RvSzvWIdqcXs5iJ8B8DL/g4GUiz9qr9ebV3R1gszy9hx7hs/eRPOgMuTu/JWKUOLCuF57hrnAJY7e7Lfu9QlcJja0GlmD3lOqiOSrhlqiX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=aVCQ+ena; arc=fail smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="aVCQ+ena"
Received: from pps.filterd (m0355088.ppops.net [127.0.0.1])
	by m0355088.ppops.net (8.18.1.2/8.18.1.2) with ESMTP id 53O87F0t014794;
	Thu, 24 Apr 2025 13:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=VRZZ6vvsjraXLh6nC0iR1wXZR+bdc9BGoWquPUQ/kbI=; b=aVCQ+ena4GYJ
	vDgBWzJicpLCJcq6tns9YUdjZfp/vTM2jonMpkK3RfaKCoy5U0ciu8cRu7SpPsgi
	0UmDa8To/zns3UYzRsUDdVAC6Oc3D8I2T/uXzstshb0H/ALZHhlY1drIPgMUYQWX
	NhzY497TZlp5OR8FWB/hSH12UOOl60F1J1xwLDu2DxkTk9yqyaqTN55hyovm4qXx
	MQPNA0qES/5pwk2Y05tji3yzqXYQkXUV6nRLjt3V5DagfjJF73QLLliCx/J/wgzr
	YwkEB62Cpi3kfmNia5SjDunGuVwoeg5ra/c/pQfAOHeVmEd9m2QoCw7eRUr4Cics
	PlriKadzfg==
Received: from seypr02cu001.outbound.protection.outlook.com (mail-koreacentralazlp17013079.outbound.protection.outlook.com [40.93.138.79])
	by m0355088.ppops.net (PPS) with ESMTPS id 466jjd6rak-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 13:37:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N6WkJG25Jpcc/fJwzFwbLJg53dM5mmjSkNlH5sOi0xVS8PhgyMQ/gVTMsZOihIq/SLatfKlW7Y/S4aUFsAQP5ounPOeLIqGZKgYWXxJiICHTEWDYOjlOBXbxwbv3gx7LpL0daq2ccrHWB6wQghLEXpx6kLj6tJ1li+KyFpFdMY7cAz0XQb7E95sPBgHvaW2HwYtYOtqnk9vNTreEgz8j427dgLbrAVaFTiXdO5xZpZBqwW1m8ZAcZB+uNoDwuzx+79Blb6FpIBZFP6VF417xBTQTLOAPTwU1TG1W0ccdpq7bWJmk8G672Slpgl8pO6ruGPHcgFqQj0h/yN1AbSRPTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRZZ6vvsjraXLh6nC0iR1wXZR+bdc9BGoWquPUQ/kbI=;
 b=wCraFx+NUTmUMEqAKGjzNuyXHYTPYnWD08Ws410393gs16ew9XCumcC3rw4IperVVAL7c3/cv8i/0jgZ7U7kQeDHJbrYvuhx8/P7VKzTl5Xf6vFn+AGlzkw/TD75prZBziOKnIh+Y95DIs12mEOAb78Uw3RcvVPaUevnyIAu+g1bhSqtjyounFTJJerLb4nwsnTsZO12Z4eK7yi0Mg3U22Rlcp9l2ASHlYmepFUErx2eD2YKi9Kgk4ZsfZ/T/xkErD1e6xRLbhi0AkdwuorDz/2/vdD+shXrU4kGRhw0xaLNXvi90yxuzjiWEgcEJR6aluur4M6lVT6IEVk3Fk7Nug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from TYZPR03MB6192.apcprd03.prod.outlook.com (2603:1096:400:130::9)
 by TYZPR03MB7181.apcprd03.prod.outlook.com (2603:1096:400:333::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 13:37:27 +0000
Received: from TYZPR03MB6192.apcprd03.prod.outlook.com
 ([fe80::54ac:ace0:dab9:cf27]) by TYZPR03MB6192.apcprd03.prod.outlook.com
 ([fe80::54ac:ace0:dab9:cf27%7]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 13:37:27 +0000
From: Adrian Huang12 <ahuang12@lenovo.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
        Andrew Morton
	<akpm@linux-foundation.org>
CC: "linux-mm@kvack.org" <linux-mm@kvack.org>,
        LKML
	<linux-kernel@vger.kernel.org>, Baoquan He <bhe@redhat.com>,
        Christoph
 Hellwig <hch@infradead.org>,
        Oleksiy Avramchenko
	<oleksiy.avramchenko@sony.com>
Subject: RE: [PATCH 2/4] lib/test_vmalloc.c: Allow built-in execution
Thread-Topic: [PATCH 2/4] lib/test_vmalloc.c: Allow built-in execution
Thread-Index: AQHbtR4FifJ7R0sddkmbsH8fin3Z4w==
Date: Thu, 24 Apr 2025 13:37:27 +0000
Message-ID:
 <TYZPR03MB6192DABDDF6F9E7D333D54E6B3852@TYZPR03MB6192.apcprd03.prod.outlook.com>
References: <20250417161216.88318-1-urezki@gmail.com>
 <20250417161216.88318-2-urezki@gmail.com>
In-Reply-To: <20250417161216.88318-2-urezki@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6192:EE_|TYZPR03MB7181:EE_
x-ms-office365-filtering-correlation-id: 14530042-60f3-4b1a-1730-08dd83352792
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?B5CoZmfWaxUjj5z341TYFXS5/Tu+gZzkPYnKTyrsjjHR7jPvkN+NpdU56DKD?=
 =?us-ascii?Q?i5wAfCC6jkWDE/pNEqj6WtPBP5/gV8O+kzYqoSyVWNM6xyIPDjk9XMfphD1b?=
 =?us-ascii?Q?CKyHHtks5gW2qxpORhOfPshsNhgs/gnAh9V/NAbLqW0WfXSwIyN2JcjtNEVn?=
 =?us-ascii?Q?2TR7l1QYFsDsEPJG1rx9qlbK3LWNzYQrAbM9OLHWLjurs+3LhaF8BPUv70md?=
 =?us-ascii?Q?K8EQYKNP2oSZxGQoOXtM14FUC7tIPwARVjCqAzPFYWaAp0Q10B1cm0mVSZxX?=
 =?us-ascii?Q?dl0yPlFM+v95VLZN31ILH2g0rVvFUhk2DyYeTRPC6kBeeUJl9ELO+mXvsaiu?=
 =?us-ascii?Q?HGpEvBvCaJniyPssudT8pUTRUwwhEnsGMvNSgV1OllutQ+AGESb63OHkvFum?=
 =?us-ascii?Q?nh7lBg4bJy/PTCVfnfH8cQz7QoSuyboOvkRNokesLoYyQqVPqrLZ2TZoqVLp?=
 =?us-ascii?Q?PC6j+wnIZ+IeAXMJTqWP/WhPPaGu4t0xJOk1Dzy2IUaTcM6rln5vLNM/+ukW?=
 =?us-ascii?Q?nvkyOxhQ4fTI3ey/jckSHYvWQGxqROjFYXGJ0aLIscPa5b/xY0sCzINbl19i?=
 =?us-ascii?Q?kyk2gSU9VNqbuBXERqXXgsH41j/uJVPmGPI54fjMB/K3dlZvNXzcMaGYbD2X?=
 =?us-ascii?Q?4N39K0VnnXC87lAH59kOESZ+dbbejqb9Uzh9/AaB3umjA7maiEwO+V+nZpvA?=
 =?us-ascii?Q?0sJwa+a7prtH2bZYBElV+oPdj+J0e5cLCzjqoP1TE40XoW7ynItUFddYSS6s?=
 =?us-ascii?Q?LnPX3OvcIMH8BkJ4UvxE75LbbOBASrqUflMKCfxdKkubNeCH+XyApBJBXI2R?=
 =?us-ascii?Q?d5d2DiO/APJn00zUBWb1tpxyYT80hWOVpWjGrYDqU6oC+PQIl7aC4SXXuH/8?=
 =?us-ascii?Q?QStlq56DpZOBeU64nUr1d5ils6+KRIkEwmfer5cHkkXWuOm7HHjO4ya6uB+S?=
 =?us-ascii?Q?a1bqmiSWfiN90XyWUsAt00InAazQusEOKLPjJCDVyN3hDckxeRDyhJlprP7E?=
 =?us-ascii?Q?X3otrqp3OxjDB+rjSs0o0Y9CdSYrQjrw/T1VhbGD+L+IYQkvDyCNcsS6J3KF?=
 =?us-ascii?Q?eoWiaFvaTdU+qYDBDc5dEr+4Y8amPH5vg+OsXeWE6qBiRQF237bzcbjWNQs1?=
 =?us-ascii?Q?ElavTW4d7EfK3LSfmUSbVw2Lp0a626lExvfwQvRpBAOcthiDtH63z6XQfZtj?=
 =?us-ascii?Q?7NR8ahr6CszCRDZlzD6Toqfpn9sLnRWobkOzrargB9h50Fh06WUykv/ljZD+?=
 =?us-ascii?Q?6mcCPyffDTcrgZMYvruvNpM5nBSxSqtLlUswTLV0jrP1IbXvjusxOj1gSATx?=
 =?us-ascii?Q?9K0hLwd2k4eB3PwfK39x9MccpZUDk3wSm8j+RHKGMploX/Syg0WSsZSi/h+R?=
 =?us-ascii?Q?30fyfzMqP8ejaTOPRmiBGkd4Ddu5QXcWR4s6nOGfW6Q1oPPwwalJO95/NcfQ?=
 =?us-ascii?Q?83o6v/cOfIKTA3tH34qHpzmGO+JZXpwFcYpqo6POajBxPnC5Nmt2sex/GJOL?=
 =?us-ascii?Q?PLSr/seVAp+Zbzk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6192.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?sQlr/ztGruZfmvpsFv80WfTN77BSRraON9USd/q1Cak+nDjJnRNApG8unhb1?=
 =?us-ascii?Q?/1XhmpFLpzE9DYO5fLk/Uwrs3LXaf9vg0zb/emQMcdyBs9V2+1xBYVPlrr1R?=
 =?us-ascii?Q?7qT2tQ9B19Am4lsPQTUXpQAZE3AeWvCVZIynsH/uhvcTtFE/DBBPQTtb2Mgf?=
 =?us-ascii?Q?domovl2fX+0FGJn9Vafdz0Lz37fYRFzWuqtpFWBjYBfVayx4axDQqd/OA+Rp?=
 =?us-ascii?Q?CCJbzNQJOdI24EwORBulWol3tZ4dD8XcjvKBS10o7TRGOiBO1A7rSsBIpV2I?=
 =?us-ascii?Q?UU07pLwyuLY9jqUH530fSWNrygmA+lVYQzyu/DLQYqBuLFyUDDDXACj78lEE?=
 =?us-ascii?Q?BVqjbVc2HJYkMa1u6YKMTpae2qH4MxV6EimMGAxgEnds83tGuiFegp00W98X?=
 =?us-ascii?Q?xcaUGkW66dzsf/G7oum61OLNklSc7+RYaaEBiO8wDoPW+KHKej2W3W/dPibX?=
 =?us-ascii?Q?q1SEGtHkhWiNXoYnaLOZAvg1Hw6RMSxojsz5+CdvtFW1HJmPQ2OUVd0mL5mt?=
 =?us-ascii?Q?rAqLEhMyHgQ1f9g4s9FWKwbLCVqtDPCNQpQ8gNVKXsonk4m9eatq4xSEE4YW?=
 =?us-ascii?Q?vcdn7duXvQ8u3Kvb83YqVMVi2i7KBHWzGOvJx1k354WNgcPsZ9yNzkRsva+I?=
 =?us-ascii?Q?AHr88LNlyNtM9Ada4sTrOozYMqbmiAXokrP0Ym0AC3VWhT2/5aS2yCm8DgAv?=
 =?us-ascii?Q?y9DlTD3SBLvqXm8f2mIWUB6tU47VL19b4AKzvDkPK0tsPCz+lAgtZSQ0si2I?=
 =?us-ascii?Q?284kOZ/VBJaiDATLLT+bgpl8sf2EOj8LPAKmW20vz5K2nvH72Z2Fe7TJzUMD?=
 =?us-ascii?Q?GFkMbQUHSklxbBakhKGwe6u4xzfbsIuFygHz9F62RVDwj801rjrOm+0fRlzB?=
 =?us-ascii?Q?JY1UsfOZR3qFIvWgvO+AumzZlFQrAWcEN66NZ5WGaKhG8JXv4Xoi1nKXlySM?=
 =?us-ascii?Q?Ksb8cXZ6M6+o4XfA//FvVpeHsfHAM+XWBkrcLaF2yymrzPJZZUzWj3ZXZsAa?=
 =?us-ascii?Q?bCqjdMzgqiIbPyqRDrRsmNwgLYSpEIrm15zZTXvOXNVtV6QEexmEu8uknIIe?=
 =?us-ascii?Q?g+u5xtDjPCS/1YvchCnbxDk3CduAqtt5iq4XdREsNWjsodHrbRg2ryqegAOZ?=
 =?us-ascii?Q?1Q/mTM9wBBVJm4CzSlIgW0QPOxiCt9cC5x6F4fxKmtQu27Wk2Ap4Ph6G+nyh?=
 =?us-ascii?Q?LJkstvGZKlJFqvhYY11s+IEdFDANGJAakJCZH41sdYvQlsuZnac8tRxVEfBK?=
 =?us-ascii?Q?N18BhpPEtZz2aE9LliZ7UH4Sn0Dz5RXUY+YDQSSuTHBtV11M7D1qiqACtVLv?=
 =?us-ascii?Q?BICzD1HzZcd30ZfxS7gMVsbePp+zXNDtnUKfWDWGxEXK7jvWpqTjH0F0FysF?=
 =?us-ascii?Q?F7YvkhNBa8PvDYyqGrAYAGyzbOQa21oGH9jmK2mboZP21/I5Ibg8myV5FpXU?=
 =?us-ascii?Q?1wPyjydltwrnDUNaLdF3Wo2m3hMt320ZhVKSHkaxbLupoFXA1WNdSaxnB0Z5?=
 =?us-ascii?Q?WfVSx/bGz15RewV/Y7fNmEpWhpp55cFAW552mX5bpx4uq5/gO/P57jcPsRth?=
 =?us-ascii?Q?SVlD7MtZwWEItQAUK4fEixkjxQGaCso0TWqnX9x7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6192.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14530042-60f3-4b1a-1730-08dd83352792
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 13:37:27.6560
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FObYiZRjgdnPmiC78FlyEHeBfF2hThPRQRj9PM7DJNapkq6I7ZWhEZIA3U/1wmUp5c+C/1uvI1ma8gA3O+V/fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7181
X-Proofpoint-GUID: isSgrkqJ_TGvPwjHD6m-hq_8uiiHO79Z
X-Authority-Analysis: v=2.4 cv=Vb73PEp9 c=1 sm=1 tr=0 ts=680a3e9b cx=c_pps a=dYFxIN8x+j9v7XNjUYJS5A==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=37rDS-QxAAAA:8 a=Z4Rwk6OoAAAA:8 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8 a=z6gsHLkEAAAA:8 a=8k6WQxmsAAAA:8 a=FCVqZKk2aljoOxJBG1QA:9 a=CjuIK1q_8ugA:10 a=k1Nq6YrhK2t884LQW06G:22 a=HkZW87K1Qel5hWWM3VKY:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: isSgrkqJ_TGvPwjHD6m-hq_8uiiHO79Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA5MiBTYWx0ZWRfX92aAcKPqK/IM /X0V1u0ndtXcMRAvDaNglc9Hz7mBr2ydYMCCEjUuYEdvqupURR9wP3Y+YiSBs26IAyNHxOep+1H MdxKYIe2UNu57IcORxTHPzhR3vYYSiGbb9BT0dpNiKEjjCBbgGV8sKQvh31lwDeDCF2E9e9TxUo
 RH+tzMGGu07iZo0T68Z4wbo+jaSv7Lz8Ba0kAaoseTEa9lnlEdZfe7GnwuPew7QHIriqlte+VUe uCCQ/G1Q7MWO2BH1AlxZgRwGt/aHI4F5zcRjzF/fuw7r3dD9/UBv46fLmKOrjXkjkYD2f4Kc9MB XdxP1xMr9BUshXLVWDq+KwwUJ+reXD0T0JCgeJRGfYFTGRIUIXiHuLHTivmcQoCdQtAjVuba8Lo
 nF7ocICozgy4kb8X7xTziA40or+yQaAlarn6VOXviA1Akx4mq7FZOJmnGENiQwHS5KGBfKMk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_06,2025-04-24_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1011 lowpriorityscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 mlxscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=-20 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240092

> -----Original Message-----
> From: owner-linux-mm@kvack.org <owner-linux-mm@kvack.org> On Behalf
> Of Uladzislau Rezki (Sony)
> Sent: Friday, April 18, 2025 12:12 AM
> To: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mm@kvack.org; LKML <linux-kernel@vger.kernel.org>; Baoquan He
> <bhe@redhat.com>; Christoph Hellwig <hch@infradead.org>; Uladzislau Rezki
> <urezki@gmail.com>; Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
> Subject: [External] [PATCH 2/4] lib/test_vmalloc.c: Allow built-in execut=
ion
>=20
> This patch removes the dependency on module loading ("m") for the vmalloc
> test suite, enabling it to be built directly into the kernel, so both ("=
=3Dm") and
> ("=3Dy") are supported.
>=20
> Motivation:
> - Faster debugging/testing of vmalloc code;
> - It allows to configure the test via kernel-boot parameters.
>=20
> Configuration example:
>   test_vmalloc.nr_threads=3D64
>   test_vmalloc.run_test_mask=3D7
>   test_vmalloc.sequential_test_order=3D1
>=20
> Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> ---
>  lib/Kconfig.debug  | 3 +--
>  lib/test_vmalloc.c | 5 +++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Adrian Huang <ahuang12@lenovo.com>
Tested-by: Adrian Huang <ahuang12@lenovo.com>

> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug index
> f9051ab610d54..166b9d830a85a 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2574,8 +2574,7 @@ config TEST_BITOPS  config TEST_VMALLOC
>  	tristate "Test module for stress/performance analysis of vmalloc alloca=
tor"
>  	default n
> -       depends on MMU
> -	depends on m
> +	depends on MMU
>  	help
>  	  This builds the "test_vmalloc" module that should be used for
>  	  stress and performance analysis. So, any new change for vmalloc diff
> --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c index
> 4ab23e5e772d0..6d65ef725d42c 100644
> --- a/lib/test_vmalloc.c
> +++ b/lib/test_vmalloc.c
> @@ -591,10 +591,11 @@ static void do_concurrent_test(void)
>  	kvfree(tdriver);
>  }
>=20
> -static int vmalloc_test_init(void)
> +static int __init vmalloc_test_init(void)
>  {
>  	do_concurrent_test();
> -	return -EAGAIN; /* Fail will directly unload the module */
> +	/* Fail will directly unload the module */
> +	return IS_BUILTIN(CONFIG_TEST_VMALLOC) ? 0:-EAGAIN;
>  }
>=20
>  module_init(vmalloc_test_init)
> --
> 2.39.5
>=20

