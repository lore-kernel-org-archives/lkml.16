Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B294E1D7E31;
	Tue,  1 Apr 2025 17:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743530275; cv=fail; b=jW38yFFS/Zqrbv1JOOxwpyHkgPyE788tSlePGovbJZwjsGTapdq0Amor20M9LVj8NTaR0/cGHxe2eK5UZIsGoi9r0lHfbVF/MaiBwMLbPju2KuuSjSnkVs7yyiY58CgGVz8hWnfKtP9J9aZMkWdTRJ0g64cPv1QZJBl45lCx4qM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743530275; c=relaxed/simple;
	bh=QHtYW9Kld5FN0ynXHekM6UuopXK0XTLv4/vVQEkNVaM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QEWQdGinPTDS05WP7Ju46OcMON7/kZ5vnExelCfTsHUgW/IJHrHZy6A5aeCv7U7XMmZh4GMhxXv88WgNMiFLjyci/5Qqt3Frk3FhEDeABZ8Tjla49ihEGHk00Zqy2yvZqwBnAF2gsXeYEshZjAH2pDvIrb3D2gnpzj3StY1pH5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=A0Dl6Xtu; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="A0Dl6Xtu"
Received: from pps.filterd (m0209327.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531HXl0F009633;
	Tue, 1 Apr 2025 17:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=0TDuDah
	qvEXeK6TZ+//WVzHOnW81E8V7Z9eLU4yX1lA=; b=A0Dl6Xtup9UYe1rKUdC3PX8
	SW0LgrAVcoNlcwX54IYEw1maPYnJGJ1MtcxgwIcExEJuMjsa5tVgSqIYZeD4VXuQ
	wYfrj9UDyPmAh+nhRME9GofQdc1dMvY3V4AavveiFQjeK/3vjSuUyBmQTfyG1+DY
	Qe/lqYCZoolySdKCEhV6KP/ADrubnJgEGAtBg5HUfdFKkLIeRpFXmEtMEfMymz0E
	C+ECEoEDjT0RnXyyS9xcqZ3APg9v1qkPzaF6pRbtpQ/atPeGJzuR0oHYYqJ2Nws9
	UALbxRGDVYU362Kz+w3k/7dEnjkXiKMBeCHu01HbwifW7pa8gNb/hutJzqql87g=
	=
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 45p7qxk6ck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Apr 2025 17:57:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGtuEZQFAeJ9HHy8ghy4IG6xNhaz6oEb/OShSKYTkOZNr1oplyR+0CkMvdHmOxEgePTOYVb+XMBNlMtZ0R19ivyQUAuAGiq2uL+z0y00DdEvYRuKOImUjJA5DxlcwpyTVKz2uCw3YwZYdyRD07h0U2YdOBqGm6zLNKTfmpkhuBotscQ+bY9SpWeYJl9vnGMx140j32wd02C+8p23E4zwPMiVZkCI+2cNLGwiO5u4GZyRhqQC5Tswz0sdg+DnQo2KgrfnNQsIa1NojLjhnFzn7aqAWIdex+QeKeyOzu3PXWP7wCnbvU20Jh+oNVsHA8Etc/e0zTImNVj6vls+9+H4xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TDuDahqvEXeK6TZ+//WVzHOnW81E8V7Z9eLU4yX1lA=;
 b=HZHXcisFXDYJYjprqYyNhH8Pd5g1NWIF6kK+PpuoAh92lGSJW7a7BPgsctXMo3GJZq82en6v8F5mYh1toraUDGhWPA85a4pcGXVuKQVGpJFR1BgO2tDbXdtnxfeDRqE3nshWP5WK8sV5KOHpaPCaYZlf249q4194zuwlRWRO+NYBHsJQ12T2rPw78Bb5sWHt4rxdPcEhzVXN3QROh/+5+jq03iP113rrBnybJmsgYH3noXOBfqib3YjLNrX0M6x9rQgtzh2fOAxa4cnW+z5MuwMb/zG2kA+SrSe/vNevncJ98YVQuCIYa5N3IyJgiNxqmmpr0dQtaufbMzUVP6LscQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by BL3PR13MB5241.namprd13.prod.outlook.com (2603:10b6:208:344::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Tue, 1 Apr
 2025 17:57:22 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%4]) with mapi id 15.20.8583.041; Tue, 1 Apr 2025
 17:57:22 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Francesco Valla <francesco@valla.it>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-embedded@vger.kernel.org"
	<linux-embedded@vger.kernel.org>
CC: Steven Rostedt <rostedt@goodmis.org>,
        Andrew Morton
	<akpm@linux-foundation.org>
Subject: RE: [PATCH] init/main.c: log initcall level when initcall_debug is
 used
Thread-Topic: [PATCH] init/main.c: log initcall level when initcall_debug is
 used
Thread-Index: AQHblrUa+g81JSpRmkWD0ynSE1//mLOPLrMw
Date: Tue, 1 Apr 2025 17:57:22 +0000
Message-ID:
 <MW5PR13MB563289C2D6F95091501E017AFDAC2@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <20250316205014.2830071-2-francesco@valla.it>
In-Reply-To: <20250316205014.2830071-2-francesco@valla.it>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|BL3PR13MB5241:EE_
x-ms-office365-filtering-correlation-id: 49254564-eaaa-4a25-6caf-08dd7146a76a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?u4LewErTg/4yvvpZ1zjLWy808knyc6Mm1xFX8sLqYRVwcC+92QXQE0ibpMUw?=
 =?us-ascii?Q?VJ4ZQiOB4UajdRtImiLewQoXXaDK/9hVRAztyo+wDWRNtE3rreAORBDn/YdR?=
 =?us-ascii?Q?1ccrCsXkswpfnPmeFHXqCe/BYdowJO/uc/0vFxWu1DKeeZJIlZMP6NoUzYnq?=
 =?us-ascii?Q?SzOYAx6A5YFQDG/OhMVrDlWWUfKJhIiDCqi317xYZ6jStGNUzHPj42yG/sUS?=
 =?us-ascii?Q?QiGUYxElkcrH4AMpnKaFDMl0Y6yGulHl0bnAryhXK+L/PhxkQ0JDsHFtsacJ?=
 =?us-ascii?Q?pDpsfNGqjOXR2f1XUVTHpe54fqY58GukDhGzmBAGOf2IKtbddTEfK/5RNLhL?=
 =?us-ascii?Q?ZD5z52DXEqMnIB+R8gydP4lUCTeFeOYUiOuVFHngrgqZTNkHSkJ5HC1Mavum?=
 =?us-ascii?Q?QgvPmSoidoMAH0TV07ctVP8Bhc8YdVJ1ANtJ2rXvKGTSly4Q465P3iLKlo+b?=
 =?us-ascii?Q?7Mo1GWQNJ3ulck322QP5oT3bZ/kn5nFa/FlpHr/8E9CnGc1rYWVu/lq6gRFs?=
 =?us-ascii?Q?a9P3m8CU+VDlMbnvU37qjUTL5NOCenNuPGKJO5Bg2pum5gYXVUPtdibuMsV2?=
 =?us-ascii?Q?hcNboGpSjvhC6lqNBxPwtbtDoKDqx05snrKHjNN07TaNGK7VqWUnFsA2ngLe?=
 =?us-ascii?Q?Pl1OKcpcKsnQI2PSwqQMRka+BiX3x5TVj5Ufg+6Pg/qLUsTEpfyNDZPVO91B?=
 =?us-ascii?Q?qPyvviHZ4GPpPjW0OSk63Sqajz/u4AdW23/9beXsFYfaBVX4CimdUXYSzM6T?=
 =?us-ascii?Q?u7mtWVItPSk5CCA/yiWqEgqU4YzsBa+CXu/1KsjXETcrEMdeSWKlghhfzjAb?=
 =?us-ascii?Q?TbIfwR2DO39K+rwaMBgkA/vOUS/qBGMPic6fgKsUOVKdCyMScPjW/SVsq1yy?=
 =?us-ascii?Q?z9G9NfJJaUwb8lvLU+I3VgmAAlMVMskZWiQ2j2T6LKObsjqQiD4Q/ayiyajA?=
 =?us-ascii?Q?uZw61IHhouMMFS9+HSwHcVusOp8dbrI3IKSuQEKMQEdoQWqKoTnhZgb7WBhU?=
 =?us-ascii?Q?Fp73tTy4fxsne4uj+K3C2GqKqzyIEKIHn6BDS3xw6Uq9PpR37pNQcL2INwCq?=
 =?us-ascii?Q?dZSbkIx2MJ+awYljlPqEIr/+cED5JjKF8kN2NvySCBhczMWXo+qlBm48M2qw?=
 =?us-ascii?Q?xLn0KKiN617jb77mhiU3wgwGunOusUoRg7L9V+qPiA65XtZLulMB3+WNqVHT?=
 =?us-ascii?Q?n38M4rpeY10Azo2+JSS0mdTegopfD2eZwwtbmcQ+0q0L45xCMal4Q5NtB4Cv?=
 =?us-ascii?Q?udYndZR/I/j8B7J0FJBtFokXFKN6Oeao2pEroOJgIUNRyfrFxRfhUzg/MSOa?=
 =?us-ascii?Q?2LzY0qDNvU8pZFumeFvJ3XoH3cKGzCotcFB0ofkDJc8ELi8d3jjrNfEMS7mj?=
 =?us-ascii?Q?nB51dhuwWhbi4sQxlv4DJP8L7K8bVjYwi9FAelb54CR1+e3wywMRzv5hFTMq?=
 =?us-ascii?Q?a8OKcGx8pfo9jVkPIlji7Sb6YQvJQUTx0Yp6RtIcAv6Y3bDkCfWh+w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rqTrqsfRNMG5YG1m/zrVNv+fxdk+epLzLTe783Ik0zE5q9j/4tjvkU5JhUNz?=
 =?us-ascii?Q?rVvVdhokWSJd9frcVnUca+y3pNuMGbOys1vDN+3cJWGUiq3yXxbAY2VKEd2z?=
 =?us-ascii?Q?e/l9kCtdiah/CsZ0GbXDthvS2FTdmmGG/9+6QnfuXXdR2kEraL8LKZwnKQlc?=
 =?us-ascii?Q?T8xMpf3zbWCMy+r94F1cpvnJm5xtgDSdJw/RVmZKnYceE4psnvUVw6KY3WEe?=
 =?us-ascii?Q?oVT8xqRBy20PfVLqtaGcDJWgVNhOMpdUNQV2+4HQ/4J8AtKy0SWkIMPRD1xx?=
 =?us-ascii?Q?yeKqLg4itcJO3o9IgjKdaeADcv4Yt/BiJpyA+31KfxmEQzMDLpciGbfhW1ns?=
 =?us-ascii?Q?7eammPcp2tn7PZJIVCkw9P/2HGcMEQHGqnoOKgs3JrmKuDKMPeeRqR2s2pQ5?=
 =?us-ascii?Q?YWCnBsGuC9lpUguzbEspB1XiI1sOFrtGiBufw9l34wkDafKHm0PAsZR3Myk8?=
 =?us-ascii?Q?zcl0l4eYyZyrFY6lXAVbAkpIV7M0UAXSfYRSiSGjsRWOfou6wlLPJjK9+nsp?=
 =?us-ascii?Q?N7eeEhSCni7tkt1Qo0ZBDQQcAg7GZJ4VW/HHSBwSTRulangG4r5of67xTf8I?=
 =?us-ascii?Q?B80C+dVCRcmN/qItF/krFveW/ZHZxVolf7iGZMiIqDTU8irPFThE/hFCe73x?=
 =?us-ascii?Q?5rOoYUxr/jiawe3ZEue4g04vFMbY14KC3z8gnAHZTZO8LduTjjW2FpnMLFaH?=
 =?us-ascii?Q?Ng5nJhdeYgZmQpFxbUe2CSCGvdnNwmI2vApaQyBAZLGgVFzQTPr4LtzdLOGQ?=
 =?us-ascii?Q?0mY11vtwR2YHqe2u8xYx04Uea+s0OnWmzgtcCk9p95ri2zgq7beHYULui141?=
 =?us-ascii?Q?UzWfSkDuWTf4zqbW/j5Ib4PTLyxucW8vxXB9ksxsfDoUIOUdBQGcIVat8/sL?=
 =?us-ascii?Q?sCwz2DJ7FBYpP19yEy4Rm8SANbFdZ5WjaCSBNPNcehuajEA5jNgb5TN0sbnP?=
 =?us-ascii?Q?MRvsAdt+DW1vWFElPb8nKbHeA/Z3jBeMHuNt9xhgfsG7n6l/OAgjwnXJFzau?=
 =?us-ascii?Q?rV6GNvWcsy6tE1grufDezhda08AWBrpEjWxyKPw+KcOMq/U1V4ld3Bm1mryq?=
 =?us-ascii?Q?Eufz6Xa8aeKFWVdmk9cmOWyeKQiynoC6OG/EHvQSdG8NUjhtEJfTYZjXWz+O?=
 =?us-ascii?Q?YR4JArXW1rF58N8SqTJMNnQdAA+DXM14L84iiatpomUF5cwY2eYkFVQKZK0B?=
 =?us-ascii?Q?dzchwVaEnGk4SF3jNhcFe1RToiimXHC0knAjuIqEuQdbqNhgw4wG0niUP1X4?=
 =?us-ascii?Q?HsxzEUnGef4/JNSIuwIwGvjP5LjpOQJ+z56LMBzugToQGCdh3MSRlfBKhN5g?=
 =?us-ascii?Q?YA/MuzmFOeOtDAJNQ2XBAuBsXedCgQ9gseyuMjYPiH/AWGj5qMSjIt+Bs23p?=
 =?us-ascii?Q?bRbb0nzk6TlfWECPykv7bOBUJ0QFs3ISbTXdROqpHunseLhapX5LN6eqTwbX?=
 =?us-ascii?Q?dn7KXxy9wJ073uzy/F5/HQydGPLAnkk1lVgSdC0RIWlDuT+ERCXE6e7hDprW?=
 =?us-ascii?Q?uLE+VF/x2+URPu4EdAt2/yEbLA5TslMHvLTaBGXBduOwQqOmfLk4bQaU2mf1?=
 =?us-ascii?Q?NLdl5MRUxmDl68uMNfY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	I9T/2nQXN2WCtOKDInbhpQfAKu28G7FoQfPmFqY61t+/Hm2AsG1Ss7t9zsKQOm2mIUDP09eK5PKoyktOG71KOXKdLKLXcPEVnF5dNXBXqHMGpJ69GajW36/9nny+BTyUgmHmL3uQhnd59/w5YU8mJjeuxCIzZS3Dbd68NVPhd/d7glbAJGgn0G1xwo/97A2+EqHM8rNEsiAnpThQHi1NNTtZ5ehuAvfFQW9yQ2kCVXUIkyvVd02BBwiL9vrr86vjcy8YeEZ3nYKlsn2MsTKqI9qYVpWDfe5rSR9rTsJXd3JkChKJx0uFlT+xfMSNsQ3+lqu/1N0pXYd2s04UbXM0EcJ1hxGsna9srz2HNMM6/q4/vsMl52ZUJoy+idlc8X94+PwerJQthsbI9DJHQhWgaIbMTpQmwcRMyI0bNKZ/FmbksIpR8Po3yCRzrI6Kv+th1PdC4TB4aR+As1GP9yQPrVHa0SZ2kraTkDPMe38ccRl1ppehvcYOm4tQl/0IpXINCTCafcHUqNNj64TBO5eyGMZvesKtCZmaIvjv+Gky8LWJwun/lVG2Vn3d8G+cSqIFQk6dywWarbUI1SwSytiqJYorWiuD/u2lR4iZn/ZSXcB3p4yDLqQzcTfXQ2YQ+twp
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49254564-eaaa-4a25-6caf-08dd7146a76a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 17:57:22.6737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AxGDNqs1aW3/7JD3y0yddV9i8KEE5GsadcQMO+JVLSHQa5mqRFwn3QLbMQ2Q6E8OpJHnInOET0HAJljlgDrTVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR13MB5241
X-Proofpoint-GUID: YsZyBqO_e8hLannXPTOHozVN1OAbpaK4
X-Proofpoint-ORIG-GUID: YsZyBqO_e8hLannXPTOHozVN1OAbpaK4
X-Sony-Outbound-GUID: YsZyBqO_e8hLannXPTOHozVN1OAbpaK4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_07,2025-04-01_01,2024-11-22_01

> -----Original Message-----
> From: Francesco Valla <francesco@valla.it>
> When initcall_debug is specified on the command line, the start and
> return point for each initcall is printed. However, no information on
> the initcall level is reported.
>=20
> Add to the initcall_debug infrastructure an additional print that
> informs when a new initcall level is entered. This is particularly
> useful when debugging dependency chains and/or working on boot time
> reduction.
>=20
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  init/main.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/init/main.c b/init/main.c
> index 2a1757826397..80a07563036d 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -1214,6 +1214,12 @@ trace_initcall_finish_cb(void *data, initcall_t fn=
, int ret)
>  		 fn, ret, (unsigned long long)ktime_us_delta(rettime, *calltime));
>  }
>=20
> +static __init_or_module void
> +trace_initcall_level_cb(void *data, const char *level)
> +{
> +	printk(KERN_DEBUG "entering initcall level: %s\n", level);
> +}
> +
>  static ktime_t initcall_calltime;
>=20
>  #ifdef TRACEPOINTS_ENABLED
> @@ -1225,10 +1231,12 @@ static void __init initcall_debug_enable(void)
>  					    &initcall_calltime);
>  	ret |=3D register_trace_initcall_finish(trace_initcall_finish_cb,
>  					      &initcall_calltime);
> +	ret |=3D register_trace_initcall_level(trace_initcall_level_cb, NULL);
>  	WARN(ret, "Failed to register initcall tracepoints\n");
>  }
>  # define do_trace_initcall_start	trace_initcall_start
>  # define do_trace_initcall_finish	trace_initcall_finish
> +# define do_trace_initcall_level	trace_initcall_level
>  #else
>  static inline void do_trace_initcall_start(initcall_t fn)
>  {
> @@ -1242,6 +1250,12 @@ static inline void do_trace_initcall_finish(initca=
ll_t fn, int ret)
>  		return;
>  	trace_initcall_finish_cb(&initcall_calltime, fn, ret);
>  }
> +static inline void do_trace_initcall_level(const char *level)
> +{
> +	if (!initcall_debug)
> +		return;
> +	trace_initcall_level_cb(NULL, level);
> +}
>  #endif /* !TRACEPOINTS_ENABLED */
>=20
>  int __init_or_module do_one_initcall(initcall_t fn)
> @@ -1314,7 +1328,7 @@ static void __init do_initcall_level(int level, cha=
r *command_line)
>  		   level, level,
>  		   NULL, ignore_unknown_bootoption);
>=20
> -	trace_initcall_level(initcall_level_names[level]);
> +	do_trace_initcall_level(initcall_level_names[level]);
>  	for (fn =3D initcall_levels[level]; fn < initcall_levels[level+1]; fn++=
)
>  		do_one_initcall(initcall_from_entry(fn));
>  }
> @@ -1358,7 +1372,7 @@ static void __init do_pre_smp_initcalls(void)
>  {
>  	initcall_entry_t *fn;
>=20
> -	trace_initcall_level("early");
> +	do_trace_initcall_level("early");
>  	for (fn =3D __initcall_start; fn < __initcall0_start; fn++)
>  		do_one_initcall(initcall_from_entry(fn));
>  }
> --
> 2.48.1

This all looks good to me.  Just to clarify, does tracing have to be enable=
d to get an
the 'entering initcall level...' printk message?  Or will you get a printk =
message with
tracing disabled, but initcall_debug specified on the command line?

What do we need to do to push this into mainline?  Based on our discussion =
in the SIG
meeting, there's no official maintainer for init/main.c.  I recommend pushi=
ng this
through Andrew Morton's tree, unless we can think of a better tree to push =
it through.
Since it does affect a tracer, maybe through Steve's tree?

Another option is for you, Francesco, to become the maintainer of init/main=
.c (!)
Let me know if you're interested in that.  We'll likely have some more boot=
-time
things to work on in init/main.c, and it would be nice to have someone mana=
ging
this stuff as it comes in.

Thanks, Francesco, for proposing this patch.  I think it will obviate the n=
eed for a portion of
my Boot Markers patch, that I suggested at Plumbers last year.
 -- Tim


