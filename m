Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF05288C10
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750099677; cv=fail; b=NooIdiHicaMKxXtXqEQuCzYtRLD05HiG9qLy0/ZDFXw8D4144VBb8Cu7DcOLO8Jp4e9Xxg9I4J0tErjO4de4QisI6eyD7F1KnP8bL/SbSuwxYAbsdbe1S7l8YYS5dw761iDJYa58E7dxny9Wxj83VolJ5mVCSJYnujWTUoxFmeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750099677; c=relaxed/simple;
	bh=R0Y2/Nl8RMr+rRspKNAZ6n/g3WOndrbn6jDwSb9USYU=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 Content-Type:MIME-Version; b=mo7TD0ZvkfXT/oO42dwdaTnpWUOd0Awi5VRQoMW0mQ/nOwdKNvw8p3qEXtULyIeqZreC1UtIWpofIRGV0KAULAHcvAegUfUznpRFNCkPHznkfAQhOrxTcHeqHlNk8uYl1i/MNubLh6uh32XQtbogQyLYeOpSLy9J57Tsdn4WzZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XqLXhhQW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=z7ofv3Zw; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XqLXhhQW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="z7ofv3Zw"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHuStR017361;
	Mon, 16 Jun 2025 18:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=R0Y2/Nl8RMr+rRspKN
	AZ6n/g3WOndrbn6jDwSb9USYU=; b=XqLXhhQWiC4fhSdd4XZbDtk47bziLjQi2/
	iWarNiC1NTR1lE17YCDjKmEq2849Uq4R+NtjglYqlyCYGXxNEeH7uc7kMgSGllZx
	S3sy80ZExsaMdXCDhN9aBnZ8Onl3evqxv7EfP2sc0AqeHIRE4QGy40R7M+W1Ov7A
	popqIzAr2pQJo78DqPJTanpWx0bKxe+KE1wT8HECSh/gRqj1RlW0CFeUR26AieH/
	tbc4+SpQDmES1qT71IuiKFhGxyLLyYSOpzeI0ZxmzzAA75tIfSu0tediSSXqrLsz
	fUHryRRqSX/nd6gQhj6ReuH3SZiqa80WWq0xSSF8e4CkT3LECMIg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47914ekgk1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 18:47:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHsUQf031662;
	Mon, 16 Jun 2025 18:47:29 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010004.outbound.protection.outlook.com [52.101.85.4])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh820ym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 18:47:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOVPN+VkLwLiABRIu0/xAS27TBKpkksjiYw3Yy8DzHrokGM/g0sWRJd3TIIlAmNp6axom/hSCIeyKaaNyOFkGvATuJ23vWoSkolM46537jEO+ruhdnaTEIPzDsFpGVhfbw0NQJEY1pdJGNJHH4jnLWqlwO/+NQ21F9s6jfn6vXwp8nrljTnLhWLApvfUgCS7d6KksSoYmJh4KmZsIcOtd+kb+nBawqJjR1C0wXVQMU00q6n3Y5HozArv/XqeXj09V3WYVz3HcWdIgxOdYenw5gDmc6w+x1Rslq7Y+mFgjlOPTgTa7n3GZ+sLkvUvRvXqefJaas9giadPGWgR3USwvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0Y2/Nl8RMr+rRspKNAZ6n/g3WOndrbn6jDwSb9USYU=;
 b=fUJTo2PJKDrVCVRVuJ+IXKdh9vMtAtTltRm/4mzRsqlSOpqmWgtgWzEY5XTgUA0rY7syTbyMODVTUyBVXeZwRrzw1pKrz7PwqVB52fYQE1fDi7bwCJbwU367ow4wHUTWyfQUyQ+ez65fzuIGbLv2uSHa+ceILnAQR/vqk3587CaSGQ4tc5UvMTqtxQdeQQHie8GSJpUiT7+67v3xLlpNfBPaXO5lFwgdIXi2jtjGFtP0KTJYovq/W9jtK59TaNt1u4U3H/xux+prhMnRM9Jo4+8f79LdWF3pNArZs4v4cnTggazIyM79NrRyVrKQiFwOeD87suo/suA4akEIW4SCWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0Y2/Nl8RMr+rRspKNAZ6n/g3WOndrbn6jDwSb9USYU=;
 b=z7ofv3Zw1s7QQnGAJGt3bgOx/zZw4XO+6cLbYWAxCa4U/r8YIzfJhQ/R+u5qgPd9VvtAKbywLKnCGFiqt25yOLIuiSUzoEoNw6Kf7Bf+rOMOrSw+VCqqfhy5C1u5zdJfhhFh6ZdEDKRV38bDGcdwDghBZIo8byub5aKpHRll1ZY=
Received: from CO1SPR01MB0016.namprd10.prod.outlook.com
 (2603:10b6:303:15f::20) by DM3PPF34F57F25D.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::c1c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.24; Mon, 16 Jun
 2025 18:47:26 +0000
Received: from CO1SPR01MB0016.namprd10.prod.outlook.com
 ([fe80::16ac:12c3:7112:db4f]) by CO1SPR01MB0016.namprd10.prod.outlook.com
 ([fe80::16ac:12c3:7112:db4f%4]) with mapi id 15.20.8722.027; Mon, 16 Jun 2025
 18:47:26 +0000
References: <20250616052223.723982-1-ankur.a.arora@oracle.com>
 <20250616052223.723982-14-ankur.a.arora@oracle.com>
 <1c0d3994-1397-4bc6-bb55-9c26acdcb477@intel.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org, akpm@linux-foundation.org,
        bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
        mingo@redhat.com, mjguzik@gmail.com, luto@kernel.org,
        peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
        tglx@linutronix.de, willy@infradead.org, jon.grimm@amd.com,
        bharata@amd.com, raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com
Subject: Re: [PATCH v4 13/13] x86/folio_zero_user: Add multi-page clearing
In-reply-to: <1c0d3994-1397-4bc6-bb55-9c26acdcb477@intel.com>
Date: Mon, 16 Jun 2025 11:47:25 -0700
Message-ID: <877c1bwmki.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MW2PR2101CA0007.namprd21.prod.outlook.com
 (2603:10b6:302:1::20) To CO1SPR01MB0016.namprd10.prod.outlook.com
 (2603:10b6:303:15f::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1SPR01MB0016:EE_|DM3PPF34F57F25D:EE_
X-MS-Office365-Filtering-Correlation-Id: d1c3a30d-0f29-4f3b-0f50-08ddad063d41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VWPGmP/MGMZ2jMmy5fZn4urSKNbxA9fXoJM0tZKgzqv5pl7DyKS5ojyhHscw?=
 =?us-ascii?Q?geFRkufaGSV7alyHKu66VHt3DSKBStoIpd/YYfD5QDPZQQ3/x+vCGSdMScjC?=
 =?us-ascii?Q?rIUBip4NzU214o29+cg6fk/iTicfUxuUVmKZLiOh8QjyyLkzCPpVp/GWDzb2?=
 =?us-ascii?Q?i02Ypmt2sfUFj8XgQx6tx6PE4Nfmy1txknEs1GLdaTFoblPAjFhOV8klVm1L?=
 =?us-ascii?Q?hzhwk3cPgP0h9i+aKToaMw5AB6muSm1E6SDCC48DdiZhBsE359SO+H1kHBuY?=
 =?us-ascii?Q?T77cawQABTeg9+PDBCXqj9qZvydovk54aRBKnzX5mmVxL2N4Zgaok/umU0hC?=
 =?us-ascii?Q?XuN7L9Y/wrSKwNVrB97lx6mavZWLv847TF2Wr7tRgYAZvVjRMmnZm5eRD1c7?=
 =?us-ascii?Q?wIM1nnHVIAtIwf0/21AiLydaR0k/ziGWASQBprcMXXZ47qvO4ugaQCTJABsi?=
 =?us-ascii?Q?gJ15+KKeet5AMtH2I4UtiEozhc7S6TR4lB3/wcKeNoCP3PkCVBqGnnBXuiMh?=
 =?us-ascii?Q?u62Klq27pByKE0uQpzUE+p+V8fvSoSJTlGIWV3RmizW0chmLXfNO3EbqM6NT?=
 =?us-ascii?Q?5NgwhkOxcCIzDDgcWWQKzuucWsjxLuwWh8W7cfxWScNiRzgx/DZ0TL94CQpq?=
 =?us-ascii?Q?93x+2t9KoPg3wMdN/a7VWdi4Pbtb1SE1HGadvwLYAwIyRIaX0ptXyRJVInTV?=
 =?us-ascii?Q?/OW/c7IkfMFA5jqwedmnOZCWhmUg62BHVgYOMxZI1O8A2u9kERFB4/xSIAGN?=
 =?us-ascii?Q?DW6Tf05pGBDBx4qNJpyiDYLexytypehSsVpWeTZrgFFIEZFpMqbEOKVWSdQT?=
 =?us-ascii?Q?iqwP5rvFIUGhcen7szNsAZF8ZXFzHcd/qJsg6Z9AcdcCfao0U6/3oeqisCBj?=
 =?us-ascii?Q?opuZP+PXR9fi6/5pJZvG7IuynD1Sk31/xxMqpph2qD3IzWVDj8a3/cGGAdwM?=
 =?us-ascii?Q?IAWw/OlzzxcsJWzQ0yjxNx7kVC2n9xIYLmlUEapdpJUJ7DHpTEg+5HwutnJf?=
 =?us-ascii?Q?eGAgFHUi1LC3oEK0/jRUVRgpxZNyya0gsvRbhmg1t28dtuqzBxWpKF8XPcF/?=
 =?us-ascii?Q?JwVakHVl8VnSK58RzfHi0JLxSJV4W8tb32ik+52Y1OihbqQeCI/dlYm3e32X?=
 =?us-ascii?Q?VzC/B2ZW1u3JWWLG657C1d/mmqc+CwVVr3R9ikvnkh19GMNMNCuGUJyy3cpd?=
 =?us-ascii?Q?vwxv6rRy6RG7aA690t5dEtvzeODbvo0b6TWmOGGPioGP5CIzPgiqOQTVluO8?=
 =?us-ascii?Q?jMcdT7gBWEG4obsjHfqeorkvJwViIrXcp5u5CETvtwiKOtL6ZntUg1h/uzth?=
 =?us-ascii?Q?1hwUO8iqKqAe3oqH/BOytiZgajmSeb/asp4KLW6K1vXnLOCMosjrR20hJ3fn?=
 =?us-ascii?Q?lM7mZUb2GHrkh45HLuDRO04HTJPG1pNjkBSvSQtRukLFXcl7y2p55z9qqtJJ?=
 =?us-ascii?Q?G6hzIcEPeGM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1SPR01MB0016.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YvfosyxkZR76X1y9QZ0Cl3wCZnOmLddX2GVOu/utQ1f3ahE1VWrIJS2MJCt/?=
 =?us-ascii?Q?k/ykK05DUWbyK4WDotFqULEmv5ARjq5DsNleHMCiHmZieCKze/GByxkGZ6oN?=
 =?us-ascii?Q?3Ki7412MpnoJ07KgvCW5wihlqJ2gewP2wJL6uLDWOE9i8pAYeXU57y5ezaGz?=
 =?us-ascii?Q?npDYlBv30msqE2fK3E5ZKat8vkGEzTv+qmOwmV8Bh1ND461Pr63IKtbTEslg?=
 =?us-ascii?Q?K2SX5el0ddOqjhsRV1Y0NzgtHm6686OkYZKrlwB2/oR5tfbNhsRzetgcmVZn?=
 =?us-ascii?Q?F5Cz4sWigCkZHMBZ7cLwat6Os8CB+HNgE+xyLwpsp9VAjbw8kWODvcvDaHn0?=
 =?us-ascii?Q?kehm7y8fxw2bsMUPItqrEmvtNOwTR3VO/7Cd8AQGuKa6Q5tUGRFYI6Q8hRdT?=
 =?us-ascii?Q?7Nq5733P879Pi3vq5bby3qqoNw/U+1i6ecEuyXyXB/aIz75MkgkspOTQ7hXg?=
 =?us-ascii?Q?NfszMDvfJGtP4hf1ozK4D8/Z3suY3M5hgPKapZltyAxefqG3HOZlAD7RBHQd?=
 =?us-ascii?Q?q1JsjaUU5DHs86R3lUhT9ORHg2Sje7i2/FS4SxbKiYVZIyGigSnSB3mGO/hc?=
 =?us-ascii?Q?EuO3FOmDnHjPsiuLVV2jQ809F94wadjoq224/RrRQzBci+GuIkyYBmzTdBVk?=
 =?us-ascii?Q?03XCfJd2mv1SJZK4AB47wQbtukptD/Ass3lwDS4IFgC/9TTfeFA+KWnQIW0v?=
 =?us-ascii?Q?LnThyp/LqDz7t1V37J2WgXzqWsH3ON5/jATzdH1NrgoNS801TKIoad2MueLf?=
 =?us-ascii?Q?esgjso08G6J1IBcIJ4xzB8NEpxpZRBZQ1XEvCau63TlJV6ERmitctqBRh66E?=
 =?us-ascii?Q?SgOt4+vrDRg9b4SiJ5ACundA3szPfNbwzTx6FtnkA78loglDpHRV1oqjCqSW?=
 =?us-ascii?Q?izbZwrmsg8Q3F+QzcY+8/RUMPckwTooXCkqXPNzIZt8vWJ+tvFB6TPL14Nfi?=
 =?us-ascii?Q?27nZXN2rx8sRewDCHdqapdej807WxtlP85G7TzNDoOMkoWoEyCeIFZCcWB6S?=
 =?us-ascii?Q?d++jV2y2+zkFanWoGxMv1I5cMtboNNBQMkqcy8ANsrBdOhe7TvSO9ZQLYvhV?=
 =?us-ascii?Q?GzcJ2KFzRxGNHaESy7elTY4MghROkzJIYwc7zkPce67KOvRkguMkw5H9AG2Y?=
 =?us-ascii?Q?/iezI6uCZ0xid875DothZvK3tf6MbwGHNh2wX3IGYgos7Iq5jFyKq7HSEsUv?=
 =?us-ascii?Q?m0fz7oiQpibsTtDM1H/YlYdE/tG3xEQBSjQO3dDKWnjpHBOjjNidOnjl9+bv?=
 =?us-ascii?Q?a9rJ+YLtZkayiznsx4IT7vEeTITy8YZ9V1gKUQ+rPPluiaNEdeT661xiPAGC?=
 =?us-ascii?Q?P9ypxqa+BA2GmjF2YSR3DpCR4SXC+cRuOR8ARXUS7kCPALSYMznyZuNenfeK?=
 =?us-ascii?Q?NvRSKJQoDTclV/ytlSAP1nflK5tKI6H5UzzRzgW0VMkcpVkPmn1VqYTRN0/K?=
 =?us-ascii?Q?pKrjR08H+9NEwG6C5cJLWxGHj6NOGbZB2ecZP5wE2ELZdFitIwFphauWZLBW?=
 =?us-ascii?Q?xbbag56cI1TJt1/UBHy+6JubeURTCHZA23nfyORr8DMb6GwPUsPzMxON8T0T?=
 =?us-ascii?Q?mX8bhOK3wjje0TPyM3csSFfk5lGGIYcdgl6EYGCaBMoTksXBTt6lhG1ssEVK?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8p0aJixwzxddcMxWlCPrCpNrgRY9jjsNbpWcO36Q+12fHfaCsHbxfinFFqpnuujSNnBDTq5a9wtrhVMVp1PtEfAcQ6OZvnZCpclDaAlezbxJgnha8DkGhj12EiO8cTvKC0aXaYGm+EVCorlotFRqM6oXmrJ34NZHVYic7TeIv5dxscbhTRjDDpQJWMX3yjsMRMy4ObZLroo+MOnh86dOIT9fyilrb45iKdGC+VodQp/Z/GvT8GDnm3E4OokoN6tl5LEY5t8S3n+H/CPrB4XeQ8EnBDBb8VGeFgUXyoQP/1enqjycJZPZn3Qa/Acy9wVGDNTvXs/bhKNC+DOHvSWodVA0gSuhiFpzDkXyzPaAS9wzo0Ldz+946j1zp8Vr1g4KTZzcpMvyaB4yQaRkG5JdiGFfEFy+GQHfrJ2l81aU+InAZpvSaVbKhsTBfStpdKtbFiPCxQZSmKq/+jPUilyRykL+/vWfuU/RS7ASheHx878MUlYfYZriRwRrdaax8K9+WyvcZJA9zzrwai6yvwvhSxaEMNlVAd9hdBZEljt9N3c+bYjGp/Ea6aMaOFNRectdIBCPAyuDcHa0Jmkn1Jw1Ul2t7rs6ZI6gGtXgcS7+bpQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1c3a30d-0f29-4f3b-0f50-08ddad063d41
X-MS-Exchange-CrossTenant-AuthSource: CO1SPR01MB0016.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 18:47:26.6536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /u7O7OTmKFywp6/jj2a5liTYB/Xehn2vDs+84yFOyj1hCmzA0PKsiF3yexpOtgg9Ors1eFcKUUVJb4vMll2/4R2DGg7/lBBVDU4Oix5Ez/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF34F57F25D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506160126
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEyNyBTYWx0ZWRfX8U/WwAiEa+Np kUHBZLBNUg1ni0Kt4EiJRE2A6o33j/JRq0MwCeIpmFpl0x14H4AgoPpK4SJMsx+q2nIe0Z6ZphV q1+ijzFQ+m3ty94oUVdJT0p7vW/r2FxqjLUQLBaEZAxDTslMz4o6w1TlgbaE2DJ+hU0Wf9404T2
 m3jEStdzpFGYiDoV8hN5sNh/Oulk959LPIArJVh2djH3XoDnEsGqioXxkPpUukzYoo4KDW6yiyH mARLxr7/bcy9fz93kZmBa4QAueyolEi50FyM8DfOX3Q1qaxmOswf4V9TYX5g+aUmXwqXN1uNT+v gXbQD5juno2yXnMToGAmgHFXFNpLG40pYMLJmwBcJ6lDdVJ1rruETjFY8g7WrPcaSrweM4cUwx2
 MonZboRuwzyUAvtbh5BdTfqxcsKPkuII3uLm45obkqroDxfeSTfhXZgZmjy2PfZ7tRLBVEct
X-Authority-Analysis: v=2.4 cv=U4CSDfru c=1 sm=1 tr=0 ts=685066c2 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=QyXUC8HyAAAA:8 a=FdlDP3qX-wF1dhuCipYA:9
X-Proofpoint-GUID: XQZr_0Sb9E3igMlefHZbZzsW2m2RY_iU
X-Proofpoint-ORIG-GUID: XQZr_0Sb9E3igMlefHZbZzsW2m2RY_iU


Dave Hansen <dave.hansen@intel.com> writes:

> On 6/15/25 22:22, Ankur Arora wrote:
>> Override the common code version of folio_zero_user() so we can use
>> clear_pages() to do multi-page clearing instead of the standard
>> page-at-a-time clearing.
>
> I'm not a big fan of the naming in this series.
>
> To me multi-page means "more than one 'struct page'". But this series is
> clearly using multi-page clearing to mean clearing >PAGE_SIZE in one
> clear. But oh well.

I'd say it's doing both of those. Seen from the folio side, it is
clearing more than one struct page.

Once you descend to the clearing primitive, that's just page aligned
memory.

> The second problem with where this ends up is that none of the code is
> *actually* x86-specific. The only thing that x86 provides that's
> interesting is a clear_pages() implementation that hands >PAGE_SIZE
> units down to the CPUs.
>
> The result is ~100 lines of code that will compile and run functionally
> on any architecture.

True. The underlying assumption is that you can provide extent level
information to string instructions which AFAIK only exists on x86.

> To me, that's deserving of an ARCH_HAS_FOO bit that we can set on the
> x86 side that then cajoles the core mm/ code to use the fancy new
> clear_pages_resched() implementation.

This seems straight-forward enough.

> Because what are the arm64 guys going to do when their CPUs start doing
> this? They're either going to copy-and-paste the x86 implementation or
> they're going to go move the refactor the x86 implementation into common
> code.

These instructions have been around for an awfully long time. Are other
architectures looking at adding similar instructions?

I think this is definitely worth if there are performance advantages on
arm64 -- maybe just because of the reduced per-page overhead.

Let me try this out on arm64.

> My money is on the refactoring, because those arm64 guys do good work.
> Could we save them the trouble, please?

> Oh, and one other little thing:
>
>> +/*
>> + * Limit the optimized version of folio_zero_user() to !CONFIG_HIGHMEM.
>> + * We do that because clear_pages() works on contiguous kernel pages
>> + * which might not be true under HIGHMEM.
>> + */
>
> The tip trees are picky about imperative voice, so no "we's". But if you
> stick this in mm/, folks are less picky. ;)

Hah. That might be come in handy ;).

--
ankur
