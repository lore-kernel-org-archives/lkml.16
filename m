Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C380919A297
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749654751; cv=fail; b=Aalq+9BhIft9bRb39d+maxEcQpK8Ni1ziOm7ickIU37+M5+E4Sqid3M/k49j1oTTLfKYuik/EQVQgK2EZOQOoYAWuY68ikl4jCdWhZGH1JMwtbotFNKyKfSA/agUKSK+/qUKZdPRN0nAZhDL3gUecT9Cdljothw1C3oJ5nxHCV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749654751; c=relaxed/simple;
	bh=Fa4zrgWpZKodkZvHHHMnxsBTHHRLxYhwRdVkFIFh/O8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZuegotBqcaRGrC1Xqq+3eJBWEKxpXdWZTGR2Ie9YQ7okNyqy5BR0FnF9RZfyBD/mKT5C/8/YY1C77vwQRjf67FCaca1CIv0BD+gRzAQKT5jV1nteBaHNcZ5vywVMfanl1FdYpzcec+J+6M3EmZHh5O8MgJxZyTYaVukc4j7xE7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=H6RsdcIP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JDrK97Gu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="H6RsdcIP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JDrK97Gu"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BEfX31000308;
	Wed, 11 Jun 2025 15:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=KMqkZ9gQuQpnsR5TNOaYqgIbWHVESxdGGkQMcmghdi4=; b=
	H6RsdcIPTy+XrIMi/gQFHspv3xufnORUZUy7Mrq6kSWjFrJjXzMDfzVjyoJyb+xp
	34vMmL6u5RyFhgJC5JMj5yKCsUHuRAKn9M7YXeZShEPWziWK8hhUKI094gt293zv
	p6J26B4Qoc6szve3ZMQsBLTXmwP6DMTeDq5ozRsgtsEY91XX5VXnXXnxmiJc/7ZF
	p7aAPJVzvev7pQL/7hpdUTFPsBHelLGRLbB+wZ3TEj02Oxs0/MOzOxVaC8b2szLB
	GcGVHCoOLWJBOqkzB/u+7jffAuREVFXm1I+W2JKIjXueQURNES+t9R9Y750OJBvP
	Czx3NOn0usPpm79i/vovYQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474d1v7u0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Jun 2025 15:12:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55BEXMKP003302;
	Wed, 11 Jun 2025 15:12:10 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvab09n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Jun 2025 15:12:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O19YettGEklJfBTJ2jQv9W/WLjhtmzQS+mLY6H2sbx9wUR6hWyhnoU+715cL15MFpXexRApOcn5EFMP3sK3fUXocVMI7itYbJTf0KHoh9X6GQJht5Boo4hEWbScsyxzu8wr0abAqu1V/aAumKzPqY9IH8Nd5np1SKhw3Kdi5Gye6VTu6kk50veizWBFZcfCv6YSRDxkPzKQvbGMAxjNr0Fgzl48/UN7tmfvqnurWM/8T0u6W35VSbkvqv3f4jOQHgd8Sv3lAr5fPfAt0yK/Yclz0Dk8RlgMgjoxX41Qq7WBeyTM6ZRxdZHfFU8UjXMVMM4+8opMGaRgq9DyXpcqyyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMqkZ9gQuQpnsR5TNOaYqgIbWHVESxdGGkQMcmghdi4=;
 b=qk1b/+RF3wnhFMEcsl05Q/JmfVn4Ua5ta3CjU4n8iorzKwDsgqXM3eNAfw6LB1Iik1+f+JbFWeYvGh+MjnY3TJhwRl6LRU4Ruy2q2xBg5orc2FsgpcLaUiw7NSFpJk1JF8+svMfhjl8k+NMHGM213I5GvlhLTNuQZ34/vJ3AzPj8FzyfagNf0BGh/waqhKKX6S50Su+wk7ApI3EvHcZn8PazbLC5qY4PzWSfdc686enOJfjk+MZ4EWBdL4vu2Cmde2ZQWWowVrzIme4llD8uCqmHq0w2mwkkKpUJjdh8/TG+A79iO+M7O/FF9N7vyP6nIP0fejbIWw6yndKyU9ZgNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMqkZ9gQuQpnsR5TNOaYqgIbWHVESxdGGkQMcmghdi4=;
 b=JDrK97Gudt2IKIbTZhWlLagxoybFvUD1whcZVtEU6/ZLcYkArlLBgxOur2GABm1KXVoySjHHujvnbworQu+matvGT6tjIwDBqqBIAaBcpwYciXUe79/aWFAhc4Mpl1RYZPqzAkEPrlTeb5lBQ8YaAxhdlpRm6H44Kx/8bS0/6Mk=
Received: from LV8PR10MB7750.namprd10.prod.outlook.com (2603:10b6:408:1ed::7)
 by DS0PR10MB6797.namprd10.prod.outlook.com (2603:10b6:8:13d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.33; Wed, 11 Jun
 2025 15:12:07 +0000
Received: from LV8PR10MB7750.namprd10.prod.outlook.com
 ([fe80::29ba:4f0c:1a08:e3d4]) by LV8PR10MB7750.namprd10.prod.outlook.com
 ([fe80::29ba:4f0c:1a08:e3d4%6]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 15:12:06 +0000
From: Chris Hyser <chris.hyser@oracle.com>
To: Dhaval Giani <dhaval@gianis.ca>
CC: Peter Zijlstra <peterz@infradead.org>,
        Mel Gorman
	<mgorman@techsingularity.net>,
        "longman@redhat.com" <longman@redhat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] sched/numa: Add ability to override task's
 numa_preferred_nid.
Thread-Topic: [PATCH 1/2] sched/numa: Add ability to override task's
 numa_preferred_nid.
Thread-Index: AQHbrabQw/kcdGpt50+BsIplhbwksLP9EGeAgAFWtg4=
Date: Wed, 11 Jun 2025 15:12:06 +0000
Message-ID:
 <LV8PR10MB77501C85728C246911CFAFB29B75A@LV8PR10MB7750.namprd10.prod.outlook.com>
References: <20250415013625.3922497-1-chris.hyser@oracle.com>
 <aEh57Evd4WmrrvJx@fedora>
In-Reply-To: <aEh57Evd4WmrrvJx@fedora>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR10MB7750:EE_|DS0PR10MB6797:EE_
x-ms-office365-filtering-correlation-id: 1b2889d3-512b-4860-807f-08dda8fa5407
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?09vTpGK3TZjNx2FuSRzN5yaXcz1reJV6EyBt1mdpMtRtz6cRAqrAxFQV/y?=
 =?iso-8859-1?Q?rzrUTvE2i2JskotlYamq5d/NUBmd3eHE3yw3ycOYzwY+42FYIfbfUeN/mq?=
 =?iso-8859-1?Q?CZs83VSdLwskq6nupwgHNk5CRcJ2UcbU6P2n8gUrZHJMprDQ3swL7uyPtl?=
 =?iso-8859-1?Q?hvR+S5M+m1Cj20qjuFB/EeZ+EGdP1DRJ/OlSoCTxmQaPUTtv/w8GdC1N5F?=
 =?iso-8859-1?Q?C2ctzf2EhcLSApjCgdDbLUoX4Kt/hR70WPypezMAWJPRkENgtvw8KBAc4A?=
 =?iso-8859-1?Q?lZvMRYRsaH2U8VkmbHHcterS59c3DFo5NanapJAtleJOGqbmMztz6fnEEk?=
 =?iso-8859-1?Q?Ru/j6CUCAc/8ZhIveAkWMxyDT8kXRoOXKiO/GvxpUqJchl31HFurocrF4f?=
 =?iso-8859-1?Q?Q45+Kb0EQkhTxWvyZQDBNoghdswrxp8bm/k4WsIkzgrtGri/n1H18VD8Nw?=
 =?iso-8859-1?Q?yiGHyao+HCTY4DyTNoyUMLU8vsCiCj05fAuQNk2YgZPgWRJve2dwaTsZ+8?=
 =?iso-8859-1?Q?1J8ab9XaShJtv1HC4f1FV7ZTpuQH6q1phC1L97HwEml4wNW4CYHyv2qsGW?=
 =?iso-8859-1?Q?cx2LXmb3YZAU/K12O/9rMujXT2mIb6kGniSDNXo7J7qHexEeoAMmpQcnwN?=
 =?iso-8859-1?Q?wIxLxhBxMgL4gWB+QoI2AErWDWcsbZHxFiZ+cP1QdtYPWyBUFpQ4HSNav7?=
 =?iso-8859-1?Q?ecenlnDDXRBWg1KKug4njNmOgloogaPiP4jQlvw0d0X2Y1vpBzcGPmP8JY?=
 =?iso-8859-1?Q?dwygWH9LcXX0nta+FK7pN0haVXwXcqvkwk5PeVxjcYYXSRKW0b+bPFhuti?=
 =?iso-8859-1?Q?nCCKo7/CG8E5ZUfckn1hMg2jYiHgGQliviK1w792C5Jqsmz5qi0t1XNVX+?=
 =?iso-8859-1?Q?NZMfEa8QDsX3G7plNYkpeBWVzZHrfHgT8friVMu4l1p6ILmf5+Sop1ZhcY?=
 =?iso-8859-1?Q?mfgFVl4ztfCc9B3kuhqC/tl8WsuSwWQBYfhQ/xumEn/hcuP51ZDFgAVsmD?=
 =?iso-8859-1?Q?ljTLeXKS9TSJZR3gBnUfmzLpxjrN6zoeLGTvDcdk8CNl+NUOpwwYOyJ00/?=
 =?iso-8859-1?Q?Eu1kqMKlA/DEs3yC9lvaJVFa01/tOBvSw2KP+pASMNv0Vn/d8+SGXRYA7L?=
 =?iso-8859-1?Q?FVNZdDimZKDZpQtY7y05syA4q0Ii2jF39ns24/d9OG85PtMddLd77RsVij?=
 =?iso-8859-1?Q?WtDPKU7tZWW0eobhn+EpuSOVGq3ezvMiSI7NxgL24lhVOtVQWfYrElACt4?=
 =?iso-8859-1?Q?87LtqFqcRMZkfpntbTwTR6bT9Pf6LgCKCwBHAh0YjcNVPInVtbnpq1oHH2?=
 =?iso-8859-1?Q?yngwywKOScVP92gy1iBGgAPfVVmr7PxeaDm/woNFNbhmdbeQ69xMW96zMG?=
 =?iso-8859-1?Q?GUdkKB6uz7D3ga5HZ3BItLOkYSdy6bvGZEqB3DVuSYq6MVqzO1j0qFkIYh?=
 =?iso-8859-1?Q?JPdFR9o+fxiaTDm8RFMScG+1vLcR3MJiY0auCq6X8GBKjjMoPb2Gc4Q1F0?=
 =?iso-8859-1?Q?iXPbyZpCSYlIPnfcp2igFihdiTLflUsULjG0iTfSTmNA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR10MB7750.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?d4D4mPK3MJ8u0XC/J3l7LbhfM+h/371ZZwLrI/nbXqJ74Wz6WeF1iZpnjT?=
 =?iso-8859-1?Q?twuh//ATuAudzp2cOzpz51SNbkxKTQu+hwHLC/RzcutjO/PcYgDfmzN5Rq?=
 =?iso-8859-1?Q?SL8jHv6XE7gNJ8TYWlzab+ZPhQ5oWErgtR1bSwqETUKT8xDbdOOk2aDzvG?=
 =?iso-8859-1?Q?pduD8d7AqNTqy5FSour8Ml5efOrhyPhiYLzgw11tyM8s40EZFpgLkeL5lC?=
 =?iso-8859-1?Q?W6bfqELCMWJzcaWw3RblfEuF+cdt+oEnu0TmxlR2XZI0zDmSarWyEYl6jF?=
 =?iso-8859-1?Q?8xiMrEC6R+cE2SpsYMXWOXp5JNXllOxQb9KZtIp7KTTRRKonDXRefBCJen?=
 =?iso-8859-1?Q?MjZIT+bZV+3LgCDsUFJ+hFFpSbwdCAirbjj6TZQVGqZWeXybRBHz9jGyO6?=
 =?iso-8859-1?Q?RIAVoNj19VW8pDunAsSJKK3ol11JYAgrb2er+huNHpAvLDCBoqgzUkrL+S?=
 =?iso-8859-1?Q?haUCa/3a468/lMfQ31OHti+TAOvTBwS+LLvQuREGLE+VuaQ99m00pzpAW0?=
 =?iso-8859-1?Q?XWZUT5qIyBLOnUkW9RWT2ApketXQ+6Ng5VZKN2SNCgULKxevVfxvY2A9Rp?=
 =?iso-8859-1?Q?+rpVysHFLhAbiONkRQHe9DJ96D43S5weaMiXn/oDu6ZriArv0v+egkCn7T?=
 =?iso-8859-1?Q?wDrPV19RYq3Vqy+tNxBoZU+WrCcKiZbnQOq6VPSrh+sdvQcHqz7DsfHitx?=
 =?iso-8859-1?Q?KdYnFbnjwL9L4vUfZXIqNZ2i12JWfJzNPmCxZWVG1aR84pJITW5DYkVzJL?=
 =?iso-8859-1?Q?8GKECz6CvF6J36tsmKwK1CSUiJiMR5LI5FVbEK/w7aSPv2QIjc2/y5ZRcL?=
 =?iso-8859-1?Q?8u+iDYXLRC4dyc0AE1UqxAiG3gI5C1X/XMB87+iSeXIMaSgosmxlblLlUZ?=
 =?iso-8859-1?Q?+LRvChX2VqG2lyacYi7efcJNTrPB3OKeBiyGEVNSyQgy0zvbs+jW5zWyfH?=
 =?iso-8859-1?Q?Su0u9OhIutn0aVNJyIWFoKSYxeMGR/Wsokyvdrxnxrx6Yh51fXoV93iKnN?=
 =?iso-8859-1?Q?BFuMIblmNv/WdTvJDktQ9JRnRW/FrWig0hihpq6KbIrib/D3wY6ESd7+aP?=
 =?iso-8859-1?Q?U4OGi1diHcWCrmmT3ANnWrqfiu7xywE1D6+jobygYsA5sfZHZWWZC0KmLt?=
 =?iso-8859-1?Q?TnQ+/ERFlCJg0et9WhgjylYAOcZyWHTez1nd4uJgWN6wqKSLPHoaC4lW51?=
 =?iso-8859-1?Q?cuoBRzeUsxVGx5CscU7s33a8wex//vhaL1LWLfcsIc2mz9lXOG+FIsAvdR?=
 =?iso-8859-1?Q?EQaV2fqUBggtJTsoukKEcuaFlRKcPuP60L7B6KxL0EOo9DWr64g+KZ3pSY?=
 =?iso-8859-1?Q?kTcAqa2TcCHlt9jOYVyY5mZoOnoJ1CrLRESQksONH26LUNqfHyGpFHlFjd?=
 =?iso-8859-1?Q?XVEuQhEgncZgWzkGqa907cRLJ5C7gOg1UsAwMnw0chs6dtKbJEs/lqGX0W?=
 =?iso-8859-1?Q?qyvmgdqoM39G13wI+l4EDopW4m8CvbYt8gJKta6Qi5UC+OXc6EI0pu2mMM?=
 =?iso-8859-1?Q?8TdbXpWw1ZQ1gPCSgJejVWyl3RyPxyjvR/xdkaObe1cCjUyEbl9nju6GgS?=
 =?iso-8859-1?Q?GZxW7qBQGE5GyNW9npF5mT/Cg1/JjzN4FAX/x4AI7MyJUjp4fSQdHbePum?=
 =?iso-8859-1?Q?eYayOMHf+VSjI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GRHKSiSqpMyvx0JV9JvbZ12grWV9H6dOoFbU6vgdHVnc3SHcuHBTAKvxr8oMzvh/xGSJ/DBOqMijZrb0UF0sebTiQ40iMYvgdJTKYHJ4HnptVgR5C66NfXxivp5QbUL7BEG937YqIdk/b0vJQQqe7s5U0RrF7MXwVAGbocqOnYlk2dbLv00GV22/VpYDYZconjYzweySZsI194PPAR3q30RReLPBZEL9Ns260DFevNMVKVJSu9m9Y6uIpBPq3/oLXqXdYKC1OLlIi4qmJoXjyvJLfK1utnkCx+2JxcrQFR72csLksEcnD5gffL4+MuVt+P03ExHvLLC458TIrX4cT81JO37MkeBTwqEcjjPfj0iK52SAoEMPK4TGDF2Z0DpFb6ty5Wze15sEXdQm+RlWhnPzJtNFnoZn1vc9VXfRKRGd9MdpULNmgXujARkImkopC/gnDDpjXyDdSrt52z+diIIjKf2viUIZnYq5XrjypiUG946fd2K2OIsQAea5twt4c9jpDQKyj3n1gjErDvBJNfFoJ4ivdTBIZYSdjVLN1Q8XQh8J4R5quR64gGq0EJDnu6bUf6B+VCQq7zL5gDqpLRJP6PcOPM5l/ksUBll/pko=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR10MB7750.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2889d3-512b-4860-807f-08dda8fa5407
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 15:12:06.1050
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BCACTx7eRomLVaiD26TQVrfrZIj4H358UOdZY9Zud17IEsNWpFAwx8SCm1aI990uq8Suzno2fkXmdLxvCpz7uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6797
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506110127
X-Proofpoint-GUID: eFsscp3hYQSeWrAXBDJWHH-tV0Pc-eQC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEyNyBTYWx0ZWRfX2O2lgcovQUkc crJjZLZoGso0K+N2CoqW+n4Mhkg+kR6NNFTAt14HfgcGSGQ1Bm2PfKky6z5UE4e2jTyww4aCMV1 5kQLAG9TH8ixOpsO/BT8clXNibpW/Afon39Jp0hBhxl1pBeMzsjxZsD2EZQ6gbCn4V3LH6NtQQ+
 SO8i0MOolEz4Z3ZfrudV9Qb1JJU0//gsD88kUqX9izM/IbiYbeNKt3Mt843b0zFdnw+7ir7f2C0 fcvMpqEJF1hikU9SY1rhXhWen1zzZi+fOfq8rez8q7Xe27yxqTZjrsx7eWL+eKbQ6lL+b8mER1j WTASVEEv67jmyqRSChF7aKXMqJo4mWgicF/R5APMJEU8A61kbDf6vHAjm9Q3dtjRrNvr7G5APW+
 g3Sut8+PKkDA/DCqdVQI3nzhzXzU//nwpWdVJfb5IKYq+TAy93WwiO5LUmuJMtu0Iy4+Pc/O
X-Proofpoint-ORIG-GUID: eFsscp3hYQSeWrAXBDJWHH-tV0Pc-eQC
X-Authority-Analysis: v=2.4 cv=d731yQjE c=1 sm=1 tr=0 ts=68499cca b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=lUgs-vawAAAA:8 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=bEw1srbDHN52RG-8EvYA:9 a=wPNLvfGTeEIA:10 a=xL-1ee0MYBJLPPLh-8cM:22 cc=ntf awl=host:14714

From: Dhaval Giani <dhaval@gianis.ca>=0A=
Sent: Tuesday, June 10, 2025 2:31 PM=0A=
To: Chris Hyser=0A=
Cc: Peter Zijlstra; Mel Gorman; longman@redhat.com; linux-kernel@vger.kerne=
l.org=0A=
Subject: Re: [PATCH 1/2] sched/numa: Add ability to override task's numa_pr=
eferred_nid.=0A=
=0A=
>On Mon, Apr 14, 2025 at 09:35:51PM -0400, Chris Hyser wrote:=0A=
>> From: chris hyser <chris.hyser@oracle.com>=0A=
>>=0A=
>> This patch allows directly setting and subsequent overriding of a task's=
=0A=
>> "Preferred Node Affinity" by setting the task's numa_preferred_nid and=
=0A=
>> relying on the existing NUMA balancing infrastructure.=0A=
>>=0A=
>> NUMA balancing introduced the notion of tracking and using a task's=0A=
>> preferred memory node for both migrating/consolidating the physical page=
s=0A=
>> accessed by a task and to assist the scheduler in making NUMA aware=0A=
>> placement and load balancing decisions.=0A=
>>=0A=
>> The existing mechanism for determining this, Auto NUMA Balancing, relies=
=0A=
>> on periodic removal of virtual mappings for blocks of a task's address=
=0A=
>> space. The resulting faults can indicate a preference for an accessed=0A=
>> node.=0A=
>>=0A=
>> This has two issues that this patch seeks to overcome:=0A=
>>=0A=
>> - there is a trade-off between faulting overhead and the ability to dete=
ct=0A=
>>   dynamic access patterns. In cases where the task or user understand th=
e=0A=
>>   NUMA sensitivities, this patch can enable the benefits of setting a=0A=
>>   preferred node used either in conjunction with Auto NUMA Balancing's=
=0A=
>>   default parameters or adjusting the NUMA balance parameters to reduce =
the=0A=
>>   faulting rate (potentially to 0).=0A=
>>=0A=
>> - memory pinned to nodes or to physical addresses such as RDMA cannot be=
=0A=
>>   migrated and have thus far been excluded from the scanning. Not taking=
=0A=
>>   those faults however can prevent Auto NUMA Balancing from reliably=0A=
>>   detecting a node preference with the scheduler load balancer then=0A=
>>   possibly operating with incorrect NUMA information.=0A=
>>=0A=
>> The following results were from TPCC runs on an Oracle Database. The sys=
tem=0A=
>> was a 2-node Intel machine with a database running on each node with loc=
al=0A=
>> memory allocations. No tasks or memory were pinned.=0A=
>>=0A=
>> There are four scenarios of interest:=0A=
>>=0A=
>> - Auto NUMA Balancing OFF.=0A=
>>     base value=0A=
>>=0A=
>> - Auto NUMA Balancing ON.=0A=
>>     1.2% - ANB ON better than ANB OFF.=0A=
>>=0A=
>> - Use the prctl(), ANB ON, parameters set to prevent faulting.=0A=
>>     2.4% - prctl() better then ANB OFF.=0A=
>>     1.2% - prctl() better than ANB ON.=0A=
>>=0A=
>> - Use the prctl(), ANB parameters normal.=0A=
>>     3.1% - prctl() and ANB ON better than ANB OFF.=0A=
>>     1.9% - prctl() and ANB ON better than just ANB ON.=0A=
>>     0.7% - prctl() and ANB ON better than prctl() and ANB ON/faulting of=
f=0A=
>>=0A=
>> In benchmarks pinning large regions of heavily accessed memory, the=0A=
>> advantages of the prctl() over Auto NUMA Balancing alone is significantl=
y=0A=
>> higher.=0A=
>>=0A=
>> Signed-off-by: Chris Hyser <chris.hyser@oracle.com>=0A=
>> ---=0A=
>>  include/linux/sched.h |  1 +=0A=
>>  init/init_task.c      |  1 +=0A=
>>  kernel/sched/core.c   |  5 ++++-=0A=
>>  kernel/sched/debug.c  |  1 +=0A=
>>  kernel/sched/fair.c   | 15 +++++++++++++--=0A=
>>  5 files changed, 20 insertions(+), 3 deletions(-)=0A=
>>=0A=
>> diff --git a/include/linux/sched.h b/include/linux/sched.h=0A=
>> index f96ac1982893..373046c82b35 100644=0A=
>> --- a/include/linux/sched.h=0A=
>> +++ b/include/linux/sched.h=0A=
>> @@ -1350,6 +1350,7 @@ struct task_struct {=0A=
>>       short                           pref_node_fork;=0A=
>>  #endif=0A=
>>  #ifdef CONFIG_NUMA_BALANCING=0A=
>> +     int                             numa_preferred_nid_force;=0A=
>>       int                             numa_scan_seq;=0A=
>>       unsigned int                    numa_scan_period;=0A=
>>       unsigned int                    numa_scan_period_max;=0A=
>> diff --git a/init/init_task.c b/init/init_task.c=0A=
>> index e557f622bd90..1921a87326db 100644=0A=
>> --- a/init/init_task.c=0A=
>> +++ b/init/init_task.c=0A=
>> @@ -184,6 +184,7 @@ struct task_struct init_task __aligned(L1_CACHE_BYTE=
S) =3D {=0A=
>>       .vtime.state    =3D VTIME_SYS,=0A=
>>  #endif=0A=
>>  #ifdef CONFIG_NUMA_BALANCING=0A=
>> +     .numa_preferred_nid_force =3D NUMA_NO_NODE,=0A=
>>       .numa_preferred_nid =3D NUMA_NO_NODE,=0A=
>>       .numa_group     =3D NULL,=0A=
>>       .numa_faults    =3D NULL,=0A=
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c=0A=
>> index 79692f85643f..7d1532f35d15 100644=0A=
>> --- a/kernel/sched/core.c=0A=
>> +++ b/kernel/sched/core.c=0A=
>> @@ -7980,7 +7980,10 @@ void sched_setnuma(struct task_struct *p, int nid=
)=0A=
>>       if (running)=0A=
>>               put_prev_task(rq, p);=0A=
>>=0A=
>> -     p->numa_preferred_nid =3D nid;=0A=
>> +     if (p->numa_preferred_nid_force !=3D NUMA_NO_NODE)=0A=
>> +             p->numa_preferred_nid =3D p->numa_preferred_nid_force;=0A=
>> +     else=0A=
>> +             p->numa_preferred_nid =3D nid;=0A=
>>=0A=
>>       if (queued)=0A=
>>               enqueue_task(rq, p, ENQUEUE_RESTORE | ENQUEUE_NOCLOCK);=0A=
>> diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c=0A=
>> index 56ae54e0ce6a..4cba21f5d24d 100644=0A=
>> --- a/kernel/sched/debug.c=0A=
>> +++ b/kernel/sched/debug.c=0A=
>> @@ -1154,6 +1154,7 @@ static void sched_show_numa(struct task_struct *p,=
 struct seq_file *m)=0A=
>>               P(mm->numa_scan_seq);=0A=
>>=0A=
>>       P(numa_pages_migrated);=0A=
>> +     P(numa_preferred_nid_force);=0A=
>>       P(numa_preferred_nid);=0A=
>>       P(total_numa_faults);=0A=
>>       SEQ_printf(m, "current_node=3D%d, numa_group_id=3D%d\n",=0A=
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c=0A=
>> index 0c19459c8042..79d3d0840fb2 100644=0A=
>> --- a/kernel/sched/fair.c=0A=
>> +++ b/kernel/sched/fair.c=0A=
>> @@ -2642,9 +2642,15 @@ static void numa_migrate_preferred(struct task_st=
ruct *p)=0A=
>>       unsigned long interval =3D HZ;=0A=
>>=0A=
>>       /* This task has no NUMA fault statistics yet */=0A=
>> -     if (unlikely(p->numa_preferred_nid =3D=3D NUMA_NO_NODE || !p->numa=
_faults))=0A=
>> +     if (unlikely(p->numa_preferred_nid =3D=3D NUMA_NO_NODE))=0A=
>>               return;=0A=
>>=0A=
>> +     /* Execute rest of function if forced PNID */=0A=
>=0A=
>This comment had me confused, expecially since you check for=0A=
>NUMA_NO_NODE and exit right after. Move it to after please.=0A=
=0A=
Sure=0A=
=0A=
> +     if (p->numa_preferred_nid_force =3D=3D NUMA_NO_NODE) {=0A=
> +             if (unlikely(!p->numa_faults))=0A=
> +                     return;=0A=
> +     }=0A=
> +=0A=
>=0A=
>I am in two minds with this one here -> Why the unlikely for=0A=
>p->numa_faults, and can we just make it one single if function?=0A=
=0A=
A single if statement will work fine.=0A=
=0A=
>>       /* Periodically retry migrating the task to the preferred node */=
=0A=
>>       interval =3D min(interval, msecs_to_jiffies(p->numa_scan_period) /=
 16);=0A=
>>       p->numa_migrate_retry =3D jiffies + interval;=0A=
>> @@ -3578,6 +3584,7 @@ void init_numa_balancing(unsigned long clone_flags=
, struct task_struct *p)=0A=
>>=0A=
>>       /* New address space, reset the preferred nid */=0A=
>>       if (!(clone_flags & CLONE_VM)) {=0A=
>> +             p->numa_preferred_nid_force =3D NUMA_NO_NODE;=0A=
>>               p->numa_preferred_nid =3D NUMA_NO_NODE;=0A=
>>               return;=0A=
>>       }=0A=
>> @@ -9301,7 +9308,11 @@ static long migrate_degrades_locality(struct task=
_struct *p, struct lb_env *env)=0A=
>>       if (!static_branch_likely(&sched_numa_balancing))=0A=
>>               return 0;=0A=
>>=0A=
>> -     if (!p->numa_faults || !(env->sd->flags & SD_NUMA))=0A=
>> +     /* Execute rest of function if forced PNID */=0A=
>=0A=
>Same here.=0A=
=0A=
Sure.=0A=
=0A=
>> +     if (p->numa_preferred_nid_force =3D=3D NUMA_NO_NODE && !p->numa_fa=
ults)=0A=
>> +             return 0;=0A=
>> +=0A=
>> +     if (!(env->sd->flags & SD_NUMA))=0A=
>>               return 0;=0A=
>>=0A=
>>       src_nid =3D cpu_to_node(env->src_cpu);=0A=
>> --=0A=
>> 2.43.5=
