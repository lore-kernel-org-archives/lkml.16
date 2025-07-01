Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322891C84DE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 19:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751396669; cv=fail; b=WaAnFIyFx8uphnQWXxi8BWr5o3uY8VmSyCxkjalX2/7pnHeLhMnKQQZRVMah36mlPQKjKMPwPxGGeWo3rWMHeO2m/KjlDw+m4qNfRskGnLrpILzEao3VmVJIncyxiu8CBc6Vj60fWPzGmlm9SdOAxPtWSi+jWmTqshWMTqACxlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751396669; c=relaxed/simple;
	bh=dKUY1jY7H8Km/pdciHnTXxMeECZqkEvCWc1xH2En3wY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FsNEt7anh/CE6OxuTz40PY6sF49OxbqDNQ3/JCJSGiJ5U1Agp5zesuYTSuVDb263Cjx8NIkrruHRgfKVEg+BdRYYoHvf+dwET3bFpKmMliLf1m0cbR7Lbt8KQoS6oItMv9prWuyMxUVFRmu66kJ/2kc2Kel0NyiED2ju1R0uC88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gb7/w9Zt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kAY54vwI; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gb7/w9Zt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kAY54vwI"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561Gfd6p026017;
	Tue, 1 Jul 2025 19:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=dKUY1jY7H8Km/pdciHnTXxMeECZqkEvCWc1xH2En3wY=; b=
	gb7/w9Zt8h8ONz3CKBUSyrCcDoBBBobsXVjQ0QK9dBjaqNUVpmcZxQwCZwJJHb3w
	QpN9MMOiwQ9IJ7JWk+/sP2Y5GvMIDuLYXhyCWfvIUMOKVmxNiUrJWigLhVouq2Eq
	l4B+paxRT/7d111A1Dun8cUEL1YVh6uRRgAwiDBrDgmlOVpPkxIg2XC2FdnUp8PT
	n0vlcdRlATZCqoQ/ggp8F8WAyrbBQX3vVKbNIZoM6PI3Z/kpBdcp3XjbQrf1e1UA
	4ueiaWFniNi6zsD61/cXkWgyBDkqqNPPyg+eZDJsQaf6aVbKDe7TxCsUvS9AWKws
	2KLA1Us7Ric2F+3VZlAygQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j766dgf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 19:04:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 561I11i6019579;
	Tue, 1 Jul 2025 19:04:15 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u9yhtc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 19:04:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C43likCND7aBF/sTjvDIOfD3cOzcWdUwjM+LywG3rT7mvhVgtGOMIJZdiDV8BqNsp/PVH7a4w5ACygMrk9hoZwzexN7WRbHQ2YMpmUGs28rkiWFKdmVTENvd7ZgJvqvFQ6IsV+rm8YRGTNgg5wUJnhv8iScZqNAsxJ9bFlv55bDN6l3m8wY6spxcufTwoRYXWy+5EFKiYBC43/LsaGPGcUr687Wr9BmJQL5yhG6ncsXcxrAC+zivLNrW/2tKp4EsXc49twpIt0v4EUYHHf77MvgA+WLSfo9bSCnWBlSIa6U88m+JhIY6cglhK16IuHoaH8nAsnc5WshFFoQWd8gfVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKUY1jY7H8Km/pdciHnTXxMeECZqkEvCWc1xH2En3wY=;
 b=Iq4rFIKbKJcpWT9F9TQ0AvwRXAAJ7q/+clWZB/zMfonYXwAM1Z2rbSZfkmHHG7LnJOBp5udU/2mkkmsUs2Z5KvEthh9Z6hXCtBPVi/hXoifnRR8HXAQYggOvtu028uFUKBx3IEqq2bGKNno8wzQkQ2siJYxhhZWBHaYki/EfUmQxVilZdoJni0Bm7xBQGse2JQCI9HceqD5MvlDwEzW91p8+GgaXNW3v+wVIykBxy/p+MxvI90LCBoHZmgLoheV78dpCj52tRGN/e/C6aWHOweljmH/hNf8rQhVD/Pz0SD1rqAt7QlswX5lrDPyrBM2C5Gcjqh2rLaxSilKOYW9xbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKUY1jY7H8Km/pdciHnTXxMeECZqkEvCWc1xH2En3wY=;
 b=kAY54vwIEjwmdbHBts8f5GYXLFb6SpnY7cFfLP8p+aTTucl/FkujeaGePnsO9vEllw8g18KQRl8b4xS8ohsoZI1WVGb2zznCoi+TqHS65p2RxEOqEADpAD3pVojI05E5fHTA0oEUJvdscBX7hUmCxJTlfeBCDTe8ga4bpp7M3oc=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by PH0PR10MB6959.namprd10.prod.outlook.com (2603:10b6:510:28f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Tue, 1 Jul
 2025 19:04:12 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%2]) with mapi id 15.20.8901.018; Tue, 1 Jul 2025
 19:04:12 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "rostedt@goodmis.org"
	<rostedt@goodmis.org>,
        "mathieu.desnoyers@efficios.com"
	<mathieu.desnoyers@efficios.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "bigeasy@linutronix.de" <bigeasy@linutronix.de>,
        "vineethr@linux.ibm.com"
	<vineethr@linux.ibm.com>
Subject: Re: [PATCH V6 0/7] Scheduler time slice extension
Thread-Topic: [PATCH V6 0/7] Scheduler time slice extension
Thread-Index: AQHb6kD6hOmqXhhKOkWwa5OYSTwV6rQdoU2A
Date: Tue, 1 Jul 2025 19:04:12 +0000
Message-ID: <17F87304-7F42-4619-965C-D9771F167E08@oracle.com>
References: <20250701003749.50525-1-prakash.sangappa@oracle.com>
 <94190673-8978-4bcb-9755-bed718fa99ee@amd.com>
In-Reply-To: <94190673-8978-4bcb-9755-bed718fa99ee@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|PH0PR10MB6959:EE_
x-ms-office365-filtering-correlation-id: f31e3c04-4c5c-446d-b5ca-08ddb8d21122
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?T0plVXRhdzFXSGxEbHBYMG1rSkg4TDBqZFJhZnR2OG1ycjNOWExZdmtjWEti?=
 =?utf-8?B?RDR4eVBsajJHdWhtdFoxQ1k5MjlWekNYb2xMSzFIOW5oNWxDQkJ2TDZyV0xu?=
 =?utf-8?B?K3pia3pOSzlEVzRueUpHSHY4YnAzV3JyTXF6N3B4Znh5U3h0OFRLdkJhaWhT?=
 =?utf-8?B?VFkyUmw1dVFHWHRoQWFaVnpRT3hIbGpmS3VaS1BmbEJZbHBFdnQxL090bStH?=
 =?utf-8?B?TFR2a0ZucDhScEFEdm1HUHhBLzVXTGpoM296ZXBoNFQ2ZVlEVWhPVFM0cjd0?=
 =?utf-8?B?NnptdEdGeHFkL0dmNkNXVS9xT01Sck1jTElHK0J4YythUHc0emRPOFpMVklr?=
 =?utf-8?B?ZzRvS20za0pxLytMUTB5eWprbDRRdnRhYit2a1NwOEhDSEkwdkgzdEFpckRu?=
 =?utf-8?B?MHkySytyb0V6MFcrM1J3enZaa3RNUTZpR3V3NzBMbllBNlhXeWxXM3NIUXJk?=
 =?utf-8?B?eC9mT3BRZWRvY3ZmRXVlY09VeTB0SUpHZDlyWW9iWk90ckt3bzFSVjB6c0dm?=
 =?utf-8?B?d2FxeFJSekdEeHpabFdpTHJIR3lFVUFZOFBKdlhNc3RQTnFEVlVCa1lTNXpD?=
 =?utf-8?B?eFkvbFpLU0hxOHlOMndLWmtkYWZnWlZFUVRQSDR5R0JkS3BWU1A1czd0cFhR?=
 =?utf-8?B?NmttRXA0enFuT05ucU51MFdEcUIrTit6NDZTZW5JQWdSU1hHb2J0V284MUVZ?=
 =?utf-8?B?QUlKL3FraFpOdTBzSWxTWmc4Q2pESlBqcG5GNExuSERHeXQ3aVdsYTNkaU5K?=
 =?utf-8?B?QklVVHZMVzQzYWg4VzNiL2EvUW4yMWdZcklGOEFZUjlxaURlMlhWODRSeVcv?=
 =?utf-8?B?eTVlQU1CeXlEWVk0Vm5wWXJMYzBmb3ZoSVU1UkloeUhOUnpUczJxWUJmTUdV?=
 =?utf-8?B?cU9FR3ZqVEJnS1ZJMUpNbkpLaTRnbjMvemYxT3VuUkVXdmhScXhZUzN6VlZw?=
 =?utf-8?B?Y2oyU25iRTFDd0hETVR4UGdHR05LZTBKdGJteXMvNlJvSHZvOTJ6TTd4OG8y?=
 =?utf-8?B?U0xBZjNQMnJTbW93Vmk1RWczdWh2VjB6ZEJ0VzMySzIySFFDVmxFclJycUx1?=
 =?utf-8?B?NFRoS3N2NGpEK3VlNUhsNUFhdUp0Zy83bnlCT3ZJU0Y2eGhpWjFINkwzSzJj?=
 =?utf-8?B?S2ViTEFpb0RxTUk3dDY0V0NXeEpPdlVjbXFSbnplVXdPRElJSjdlOSsvTURH?=
 =?utf-8?B?ejRMTG5PWkpXa3U0b1VDWnZteGtmUkdUcysrZWJtODNKaEJpb2wzWi90ZE5U?=
 =?utf-8?B?a1Y2VTczSkIwN2k5R0Vvczc2cC8zMEdDdjNOeGluMHZBdlpQWHBBTUViVnlt?=
 =?utf-8?B?TjFIWnhNQ1diTjMwRDB4YkQ5aFd6SzFUdG9QTU1rUVVNbkl0UlZQZFdLQTBj?=
 =?utf-8?B?WVN6cEtWVkcyUTFoVytzWkdZMEx6aFVPTHJzOVd2TE9Pak1GZU1OSFd6aWU0?=
 =?utf-8?B?WVlXRVRpdU80Q1VuT0NYTXJHWFZaSVQ5bEJjcmhJUzVpZ245b3ZyQzR0N0pK?=
 =?utf-8?B?RVRITmdBK3lBenBDRi94MlBmNnZnTnBwSExaVFZHeHB1aExCaUNXUFY3bmpV?=
 =?utf-8?B?TUw2TGxKZG42MUFRWnkyTC84ZGNXRUZqU1FWNGVGYnNrZ2lVbVFZT3VwcUFP?=
 =?utf-8?B?N3kzQWtqUkQ0K0JMelA4ZUdDY2RuckEwYjBVNUJqbWlwZlNvMEovZ1lHNDJR?=
 =?utf-8?B?REI3TmJIdXhOVy9YcW5uZjZ2OGhvY1BGcm9CQWVDaUtVY0svNHR2cURCMWd2?=
 =?utf-8?B?eFhJUUZWTktWMjR4bTdqSit4YlY2ajhFWlBFUXpqYnZObERxWjRVSXQ0ODFJ?=
 =?utf-8?B?ODhjRDM5anhnWEhQOEo2a1VnU1dBUFRwRmJrM2h3UDVjbkdQUjNkQndjdnZB?=
 =?utf-8?B?dVhkODR2N1ZtQjJNYkt5aXpXL3lFbXpBTWdzakdNZ2lad0NMVEkrRWR5UFpS?=
 =?utf-8?B?eXZwblRnN3hqck45bXdwQUY3ZGJ2Q0QyVDJBR0hCYXp4SVBReEE4STlYMk9B?=
 =?utf-8?Q?eORo38g8y1ZnUjr3NcLbGLTd5xfSJg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WFdhSmdiTllTU2xtSk01aktrWTBEdFBHQisxYmNnUEErWlR2ZUM5OGVKL1Jq?=
 =?utf-8?B?QnZpbEhxT2ZuMTBLcEtXK0lram1vRk1sUjJTaHlzZEUzOWVrWmR4Unp4dWZC?=
 =?utf-8?B?ZnRHZkdaYWpudWh5UGpiMjM5UTQ4YU9CelRxOGl5T1orYUlydkNjMWJLeFRR?=
 =?utf-8?B?M21YRDRDWU84cHVqUHJSOUVnaGp5NFhRdWlwY3kzalNsaGdZUkkvZFFRVWE0?=
 =?utf-8?B?dEVrSTF6dkFvRU5Sc0dKN2ppMWFiTG1wY3JDSWZmWkJuNmhTcDhtTkFHMHBM?=
 =?utf-8?B?Nk5kSHFkRmRCQ2EyNlJESGcvNFFBbTZEUE9OMnJjb1loRWxVeEJoNENPWjc5?=
 =?utf-8?B?K3FvUWptUWhVanRNOGg2UjdFMEhZTzIzbkV3U0ZCcXIxdFFmRjJsYVY0dHg5?=
 =?utf-8?B?VzA3WHNvM2hnQnZiZFBwdEU1MitNM1psMm5DVzNWSzhrd01ya0JOa1FBbTBX?=
 =?utf-8?B?WDhDQTVFcml1NWpZRFlhSVVwYjRiY1hVSHUrSy9TTk9XTjRIVytvVGJ2dnlG?=
 =?utf-8?B?NVZxdE9JM21NWnU2Vm5pWWtMUFZSOXB2ZFFCd0g5SWxXTzV0alRZOThoK0Qy?=
 =?utf-8?B?R1FYRWFzQ1RabWNraGhqNkVaenltci8va0ZoVTVGS2tHLzhvQk9hMmJ0MVVS?=
 =?utf-8?B?YXRXVFprNlIwQTNES2FIMWlpQ0NsQ0ZySVB5MFE0K0I2TkErQm9HbkN0azRr?=
 =?utf-8?B?MkJ4SWRreXRCcGx1RjdtdWdFaVp6a3NmZllaNlM2N2FUaDZySGFIT1FFdUkr?=
 =?utf-8?B?b3NWRExsVXB5a2o2Y211cklQdkRubzN2OW8xYzhyY0hNN1Vrbk5rMDllaU5N?=
 =?utf-8?B?UWxqWml3T3lZV3grV0pTZ3pvRnVTZDBUTWpqSmpSeE5VbjZaK2VyM2luQWhD?=
 =?utf-8?B?SWNrSWhLempVTy9KaEE2NG1wYnp2MG5ocW5VTjR0MkJobkNFelRkY2RVMXlk?=
 =?utf-8?B?Q2FYMDhyMmJHTzRtMlZ4aldhMkhkakRLb2x2WlhKV1JGUGJRa1d3ZDBhaHRy?=
 =?utf-8?B?S0Zvdlk2SFFaUXBRb3dNQXdrZ05VUE5aZlo4dHY0ZlZwS3Q4WWRBN00veUpO?=
 =?utf-8?B?cTd3eUF0bURQUTBlcHgvK01HNmc5VTczYkRyR1NCU1IwT0R5U3NqcVN4cTJG?=
 =?utf-8?B?NXBrTjlBeWFrbTBOa2gxc1VUc2EvTUNtV0dWSzlaWnYwZGdIWFdicWxzQncv?=
 =?utf-8?B?Um1JYi9TWG1tRno2dWlvYVRLMDVyRnlPc0pqc3kzamZvMkwxcEtmYlg0ZHd5?=
 =?utf-8?B?aUwrTEVRcFF0eXczNlBBbTFwK2RBYm9DK2Z5Q2UyY1MwMlhkTnp0d2RteFRj?=
 =?utf-8?B?K3YyRnVZMFF3UDQzWGJHZWF3enErcmEvWWkvZ1JaUzFKZUFDdEVZcVN4UE1h?=
 =?utf-8?B?TzM2UDBkSFpHaDMzcU02Z0lMaXpSazdjVVNsSEJEV3hwQ0RFK2M2eDlSUnpK?=
 =?utf-8?B?OU95dHdsTjY4bzQ5LzEwUDNKYU9FSXR3NVliSlhRa2RnRjJtWFZXYi9MSkY0?=
 =?utf-8?B?KzFJazNacmg1UHdOZmxaSXliam9MOFZqYmFMZGo1MUViUGxIWndCL1R5QnpJ?=
 =?utf-8?B?eW9KL1l2YjFQSmxYUTVQaW9hYlA3dVZDSVp3T3RjclFVbGpBallTak1YYlgr?=
 =?utf-8?B?UlFTOUlpRE1yUmF5ZjJFM0xvSXdXYTN0MjAyZHAzNk5TM0ViUHA2dHExdUdK?=
 =?utf-8?B?ZkxIOFNHOStqL0tQR3FzSkxuS01rS2ZvY1cvZkgzTUh3aHhCbkEyQ1ZrVkxZ?=
 =?utf-8?B?dFdYT1dIYXI0d2tvNzJkdys2eUZjaDRhdll1aW9YbEZwR0RoWURxc3RaaER0?=
 =?utf-8?B?ZTNmdHRtUEhhV1kvZDRJcGJnV242OWtEeXFHbk9ZbzRwU2dMQk9EVnhsYTJu?=
 =?utf-8?B?OUZ0em0yOUxYVkdkUW9GK1MxSmE1c0VZaEtUYVNTbkxIamtiU0dSME1IMnJm?=
 =?utf-8?B?TXdRV1ZCaytSMXc1QTg2cWQzQTNVT214eWo3N2tHOEZNei9kbUNDNUM2c2VU?=
 =?utf-8?B?ZkVwdVdodHY3clNFcCsrcW96OGs5TmlQaHMzWmVMRUcrV2lWdHMyQVhwUTZ4?=
 =?utf-8?B?NzBCVUVJbjFnZDY5YnVXOGJCRlBudVpGWXBrWFdBZzdYM0cyRGhPSFFqUkM4?=
 =?utf-8?B?ZlZMM1VadEh2Y3RPMHk5eEJVZlpZdVVUVkFyNmJpZFVoRlIycWJDN2xWSHlw?=
 =?utf-8?B?K0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5CE0FBB8F936D40A05C9F251B70575C@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YkO/r16CG/+Y/pTCTsn+kY7ooh41DnDWvnrjvw21WsIn5+ojrUiKylfxDa0zqXoNUr6P8An3Fy9LSpC2WB9jCtGb08U7Hm0CrQmoSXnOSvTNFpk0MZD1D0qXLRXUb+tYb/FH2cpVqIsJya/OiFm39QSBcuDu6BsGoJrXAzAu9tCOhvjOaqkAeIFOmpnXRJaSkr5rFzs9c1DnX2zMc1Kc7XD5IMGLoG53qz2B6ODYI3QAQv9Qjhu+4Itux5cOj/8osD7hAWGz4t3zFW6+FvCtZ/K1bc07LrSpkorf0W7nAhLWIXgOju4inI7G7G2zf1lLnGmbMv22MbvlQfGYRjR2oz5T6M8z+YjV1ixsNOzO1K/4MrgunTnMjoSKJyR44HkKjbu6cL+Srbe5k2+NDIzFqX+6ZbhcZzWXlbzFXm7KO0dBprnTJPyM2fOmIgvbPnZ6uAAAVcsh/vYn4VDdyoJzdaqSdXnJXq5RhbiH+itWpAJcTY4MrEUdhls8XrG/6vlh/Q0gi8Md82XnaWnf//+HAPjVfbLEods4RY52awhmKTWOEpfnJDRYoP9j3u3GsLpC3bFbYANw/pYSnvoKOWhVPcwLicZfPGgKq9tQxFcdy2c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f31e3c04-4c5c-446d-b5ca-08ddb8d21122
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 19:04:12.6398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HDuSKXLA7aDm5jdsQhIiVwTwhGt5PDC3zI09s42XRF/CC+wLPXXTf7IEjm0N70Qoj0iqnhXzK+ma081eMZj8xyAKqWdBOYcLBWgublDel/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB6959
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507010131
X-Proofpoint-GUID: 1lNkLUqEINF2PaS_70ntO6I6qnhHTWsK
X-Proofpoint-ORIG-GUID: 1lNkLUqEINF2PaS_70ntO6I6qnhHTWsK
X-Authority-Analysis: v=2.4 cv=b82y4sGx c=1 sm=1 tr=0 ts=68643130 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=zd2uoN0lAAAA:8 a=5SNtn8otxdUn2iUHwkcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEzMSBTYWx0ZWRfX5nTbQJpDVRt4 eLL9bnciYiMoVyDARVnABGnjOc2ezVkeQl0YkvF/n91K2jCUlHeRVFt4DfrtZJryswCWtJn+xpL M7Nt7Z1NbsJTP+iIiYKSH2x2rigW5JQddyUtrT8Ej++TGLr0x3UQPhnPXH7rLdVz/FZ/f7bmy51
 3FiAkTEurs4GNKypmnysa2jLexOLllcnibN9OyxcT+gDrmEveIu1BVX1JWgZ6/vv68u/Enr6u7V qr8V2Rx37OPFqdNhZVOodn9GmEsv+Bjpw1wsAs94dPgQViC+GdHZj1VGyiQ5al1S7L13uHOvjt+ 71TRXyWFiq+bDTID+/xmZt0kaIwbxPrKqJ+2nAf/eNnrT0QxcrQrYnSAUQ/nwHN4zrzpJgekpkf
 2KJIpdBDmzHgvBLK4WxZBYnRmzvbLd+pXWthbEhVFyfLk/SfXaWGk/7UqcFqWZJ+Rj+bhgzv

DQoNCj4gT24gSnVuIDMwLCAyMDI1LCBhdCA5OjMw4oCvUE0sIEsgUHJhdGVlayBOYXlhayA8a3By
YXRlZWsubmF5YWtAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBIZWxsbyBQcmFrYXNoLA0KPiANCj4g
T24gNy8xLzIwMjUgNjowNyBBTSwgUHJha2FzaCBTYW5nYXBwYSB3cm90ZToNCj4+IFByYWthc2gg
U2FuZ2FwcGEgKDcpOg0KPj4gICBTY2hlZDogU2NoZWR1bGVyIHRpbWUgc2xpY2UgZXh0ZW5zaW9u
DQo+PiAgIFNjaGVkOiBJbmRpY2F0ZSBpZiB0aHJlYWQgZ290IHJlc2NoZWR1bGVkDQo+PiAgIFNj
aGVkOiBUdW5hYmxlIHRvIHNwZWNpZnkgZHVyYXRpb24gb2YgdGltZSBzbGljZSBleHRlbnNpb24N
Cj4+ICAgU2NoZWQ6IEFkZCBzY2hlZHVsZXIgc3RhdCBmb3IgY3B1IHRpbWUgc2xpY2UgZXh0ZW5z
aW9uDQo+PiAgIFNjaGVkOiBBZGQgdHJhY2Vwb2ludCBmb3Igc2NoZWQgdGltZSBzbGljZSBleHRl
bnNpb24NCj4+ICAgQWRkIEFQSSB0byBxdWVyeSBzdXBwb3J0ZWQgcnNlcSBjcyBmbGFncw0KPj4g
ICBJbnRyb2R1Y2UgYSBjb25maWcgb3B0aW9uIGZvciBzY2hlZHVsZXIgdGltZSBzbGljZSBleHRl
bnNpb24gZmVhdHVyZQ0KPiANCj4gbml0Lg0KPiANCj4gSU1PLCB0aGUgb3JkZXJpbmcgb2YgdGhl
c2UgcGF0Y2hlcyBjYW4gYmUgaW1wcm92ZWQuIEludHJvZHVjdGlvbiBvZg0KPiBDT05GSUdfU0NI
RURfUFJFRU1QVF9ERUxBWSBjYW4gY29tZSBmaXJzdCBmb2xsb3dlZCBieSBpbmNyZW1lbnRhbGx5
DQo+IGFkZGluZyB0aGUgc2NoZWR1bGVyIGJpdHMsIGZvbGxvd2VkIGJ5ICJyc2VxOiBBZGQgQVBJ
IHRvIHF1ZXJ5IHN1cHBvcnRlZA0KPiByc2VxIGNzIGZsYWdzIiBhbmQgdGhlbiBmaW5hbGx5IGlu
dHJvZHVjZSB0aGUgYml0cyB0aGF0IGludHJvZHVjZXMNCj4gIlJTRVFfQ1NfRkxBR19ERUxBWV9S
RVNDSEVEIiBhbmQgYWxsb3dzIHRoZSB1c2VyIHRvIHNldC4NCg0KT2ssIEkgY2FuIGludHJvZHVj
ZSB0aGUgQ09ORklHX1NDSEVEX1BSRUVNUFRfREVMQVkgY2hhbmdlcyBpbnRvIHBhdGNoIDEgaXRz
ZWxmLCBpbnN0ZWFkIG9mDQpJdCBiZWluZyBhIHNlcGFyYXRlIHBhdGNoLiAgIA0KDQpUaGFua3Ms
DQotUHJha2FzaC4NCg0KPiANCj4gVGhpcyB3YXkgYWxsIHRoZSBDT05GSUdfU0NIRURfUFJFRU1Q
VF9ERUxBWSBjYW4gbGl2ZSBpbiBvbmUgcGxhY2UgYW5kDQo+IG1ha2UgaXQgZWFzaWVyIHRvIHJl
dmlldyB0aGUgZW50aXJlIHNlcmllcy4NCj4gDQo+IC0tIA0KPiBUaGFua3MgYW5kIFJlZ2FyZHMs
DQo+IFByYXRlZWsNCj4gDQoNCg==
