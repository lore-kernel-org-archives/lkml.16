Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B244D259C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 00:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743380420; cv=fail; b=VFp9wbBtHzepVbMETLwCmQfmKcXjL7DbHQWhPgaO8bidkUCGJLfXK4do6XZY8PkFE2mBnhph76ass5e81xNCrl1fTIVoEbFt9daAoYqklLd1qgB1/jnMb/K4IMjpX8Zi/5FhMi6nYwDVtsbqpDGmcV7fiNpm7mWrcqV/gl6NsV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743380420; c=relaxed/simple;
	bh=RFfRFGMN4owMaECT0EK+rlbtyvy50v7KZvXSO+JYOwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YSHYDva8uy0Pmev9XYwj96mVFd3zcCx0XImrwnDAYn6vrlneaiWQXWEe2H4AsbHxmCFcHODNUwORUoFBpK0f8BzROsG0j2gUptQfn1Dj5n+OHgpWxZqgNOkbQrtd0eyQArNarAMQCiGPjuHDJ8uoDBUA/w8v+As8I0kqtQtud+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oMdIoggC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=S+2dvgdT; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oMdIoggC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="S+2dvgdT"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UNhWDH025373;
	Mon, 31 Mar 2025 00:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=lh21obEJKmaA3iH51O
	gVZGV/nLT3VHpIEcTzos5mD6E=; b=oMdIoggCdk3zZY6TIV3Mhe+whRQC+MbGyx
	87SrFWPIcb+mHEqV6fipXmEUxZXJXnhDa4PYkRPakOZBhfJ6Oao844wN8Nku+r8K
	e3JF3Qerb8bxWu+bSUDK+4QzL6mN19xCGJ7IwNsNrf0+BVO7eUOSbVXHaYF8yNlr
	qejF1rQoiuqIgbIGfosHwWStrfcOkMfeBVIy8Pu3yAp6SgWv/oc6OovGUw8ZWwaO
	vc59OY4renXARCM9bKmGr3aIto3ckCDsy/7oWZzl+96fmZH5Q+qIgEPNZbYJXj/z
	C24JX3jpFv7N6An/FrxVBUogfKMQVAkAwZ/9HkZJEIhPy/ynrd4A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p8r9aawt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 00:19:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52UMeaTM003274;
	Mon, 31 Mar 2025 00:19:45 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45pr8n9sw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 00:19:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOQ+cPxfkASb4tWJaGs8Hv72n8TEYQhab5WnMIponoBJ5l94SC9FAGKVcOiQ9THrglmKK4/qBZHdNOE6L5DnW7bSZhnfiXhva1R1KX83LntrAoSMXLK03WtMQ5CTz4vXeyVMKlPGXNrhtoEr4XQoDkcBNJThkGTpKcAxiwVu6/kQoa3CG+cdvNfvR9ZGEK1A9v8QTQWJ2njeosBlPycrA1WBiD6eeAnoUyIqpTVF6MRiGPJ3uLOLGLQ3Zm3pANcPIwz3WCM5I75guyOKdY1CK7Lf/vdpu4D1XUS4bCD5e61Dk7ni6jRZFvp+6ecCv/BdSTMKvX7PjRpQOjM2gYzVCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lh21obEJKmaA3iH51OgVZGV/nLT3VHpIEcTzos5mD6E=;
 b=JZILBR4L2IXOQ8x6pmPJXvL6f+OTljQnwlAYnuUGHHXO/yCbOfyHzIhT74w2IdFQqQM9pWJLXrP06DLmvKQOLNp3D7iImf/Bbxc9w5Jo1cXRW1WexOcy8nJp+oeptgm4/PVd0NQq5CbNQmi7n1xLEKiHJtpqgkdDio2zh5UaKufJ0WfHjHjDRs/FtQqp1/HLddmsbqRNkAZcOGpn5aKPN4KZs2w4ymkp3dqNuZNg3+uxhAD4speaFZ6wtjf+a9CuikH3AdPKGOJSrgv0JaRw44HG62ifIMYWNIi59Jw2GOESQGysFzL5tPgkEZ9J9XfO+i3/0RYss5cm9QfNFsR7ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lh21obEJKmaA3iH51OgVZGV/nLT3VHpIEcTzos5mD6E=;
 b=S+2dvgdTyqFG8yW10cJ1OpDAuvBrOPx2NIOc6x9BJ/iGQhH7zFID6rjvUTQtkoQwQPjeppC7XwBKFQ83G0SghJiFzdP09mQdBhtnmsXgzJvlJrMasVKFjR7aCtOtWWNLutNT6Ag4cwiPlsX6/GokV8S4U+uKOdf5wn6Q0jM4rco=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by SJ5PPFBC9E970C5.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7c6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.29; Mon, 31 Mar
 2025 00:19:43 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%7]) with mapi id 15.20.8583.033; Mon, 31 Mar 2025
 00:19:43 +0000
Date: Mon, 31 Mar 2025 09:19:36 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Ye Liu <liuye@kylinos.cn>
Subject: Re: [PATCH] mm/show_mem: Optimize si_meminfo_node by reducing
 redundant code
Message-ID: <Z-nfmId3foCVB26r@harry>
References: <20250325073803.852594-1-ye.liu@linux.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325073803.852594-1-ye.liu@linux.dev>
X-ClientProxiedBy: SE2P216CA0063.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:118::12) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|SJ5PPFBC9E970C5:EE_
X-MS-Office365-Filtering-Correlation-Id: 49db7061-3a56-4b52-fd9c-08dd6fe9bc37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lNSPMajvWuxMaM6g62ps+vTbGtErUarw9vQYRdeZwK0ilIi6v5WIhIODJ8mS?=
 =?us-ascii?Q?B5qfmM5J4aciKwrb6vDYVfEP6vGX7W8t6CRVL3h7H5k6rhkHl1zu0ZBZnyQ/?=
 =?us-ascii?Q?HDOduQ4wnPRt8cHfXPwcW9/T+irv85FayHk55BP4F4ACH+Gy4vRa+jsAcy3T?=
 =?us-ascii?Q?br7xYv8m5mu9cy6RsSfJmGK2rlfn48xDNDhTegMsD15CYGk/HWUFwV9NCLL9?=
 =?us-ascii?Q?a0vGNBnxUlAHhibkms3GoWbqZDG08m9hCtnhY41YYay9yx5uBQSVbgSoL4R2?=
 =?us-ascii?Q?OkQJrrc0xULzhg/23begef8kpxI89TIkGw/UavShWDHvXHIIt477WcweGura?=
 =?us-ascii?Q?tLz1yJeaEQO/Dyke/ab002y6lmdRMtBgWtlzwUTV43ej/oDM7ojemk6HtBlQ?=
 =?us-ascii?Q?8Gr8VNdpVzQtXYhX24zHJz0meighCM7leZypSHhKWH9hUgxFd8wdxSRVyJT6?=
 =?us-ascii?Q?agH9O3J3adU0IPIl6Z4ucDFhrnqTb9PZIcHGW74PNQteikkpX+qrA3tKba13?=
 =?us-ascii?Q?4LE0XjsanHlKNto7G8jajyFBFLjFEVlzjwdU7+p+3MmXJQLPR/OLPuYVHrt0?=
 =?us-ascii?Q?o1oREwy+wvz2XnAAQLfadwC3XHrNDVm5O4slXZdzP5HoG/oAbOIKJb4JmLOY?=
 =?us-ascii?Q?MrUrp+Q8IspjaFye6I8N1GuO6e4r8OU5AP+r3Zl2tuz6FevO/RwSEshz9jnK?=
 =?us-ascii?Q?BsD89+uiNmH+pJrh3Tg/phjyjRzwGWxh8hvT6YCSqk1A/0p1Lgldy2OAsx1e?=
 =?us-ascii?Q?jux63ndeX8kQo5dPGeeBVB7JnTdaCLCVFKWTDX9Zz5r6L9A+yC8ywI6RPVx/?=
 =?us-ascii?Q?MF88QRaZIOG2txaLwN1AkDxoudXUWNWrbvIDDu19UONVhoYZwiZKPzNSnLDy?=
 =?us-ascii?Q?0795Xt4v2BX3/pPU3Z3WG4mK1Nf8DDJZqABOjgY5963/fAOEWvBe2wo9/Mg1?=
 =?us-ascii?Q?M3+KMVjywMvhvO50e9HtcCXetPHYzi0xzTbPBVtNgJCdjGA4i9qNJLT12gRM?=
 =?us-ascii?Q?SKKsuS4GscxPMcWX6lPT8V/14yKq3HyPIN8pojCY4FHFW2p0aoY1OSz7rOMh?=
 =?us-ascii?Q?zv6M0bsnZFRP1y6NC4Q6p4vlPjoW7ajH5wykAxyOXLiGbx1kA6Rt5qDn5rGG?=
 =?us-ascii?Q?mFEfZlGRBj2534r9sXu5rvmmWIQjMb5S/2feabnDt+uxoSaUC5o0/R+EReUp?=
 =?us-ascii?Q?pc+riwN7Wl38eYvkca8MqyklQvc50iRonq5wRvoCOarhVXPcYj+a80a7d+oh?=
 =?us-ascii?Q?Lfmh2mq1MqikBUK4d8Hw0Hfh/gTscD1w7vSQIKVMuUntdjDaBHQyBMlIzRO3?=
 =?us-ascii?Q?+mIYtYyq0lbZjxj8HSHAu8dS3ICrMTPR7ZhJGZWn6tmyvIFX1pz32pWYTep8?=
 =?us-ascii?Q?k+MgBZfR34ZL1Rk9CJGPZw1jKOGB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hMaMeOSd9kkGDsuxbanzNvOgZsxS8W0+MhfBe9xrMRc9nVuo5cAIM8wJcWhP?=
 =?us-ascii?Q?9+OoZkCaKl1Ey6vwEG5Rqo3WQbw8W4H/CNllY3Ju+NPh4AhqXTCE3NGDheI0?=
 =?us-ascii?Q?8EZliyt+bcdnjQvJ1VusvoyMehxDWjy1TVxjOw7OLvUR/alJ/c8QfErFRye2?=
 =?us-ascii?Q?zSg2vUl/FBHSlsno4YPUsVPbB2a1398oqZ2brYJ+TRu2wLJeRCL2c/57RIo8?=
 =?us-ascii?Q?BxVpl3qwRaKuk2J7GNDgqJXdNvPTQ55/GUB+c3c6NVwJxsQ9y+oWWpuO6n9g?=
 =?us-ascii?Q?9puzV1y2pB9exepOWe6kqOSIMDs47ZZojrAF/EAFeoaOEhdsBwbMOK+nOpyz?=
 =?us-ascii?Q?kMiBw0o5fgpUfVssoQwXgfiCOQ0bWaB3ICvuN1Do6aI3ItmOit92eygut2Cs?=
 =?us-ascii?Q?UXt7fPjw17lc3modaWGhfvWUfN01EoQMAJhKZjz2MHkdYo09WHS4HU7crMeD?=
 =?us-ascii?Q?EjPX6TUvug/n8TZ4fkwj0whD57IIOwi8Kz/Y/LfieodWO+gZUsH5QV52ty4f?=
 =?us-ascii?Q?uDKsvrn7vy6sEPazc1Csv1TPy9xBxFuijA9Eaz9A2s1nXCirsGYfkKl7jJ/M?=
 =?us-ascii?Q?i/co9gTwqtEs65kOfm8LPZP8xSAcCmbkLtkWzb07nXNrdpGcCzBD7TKlO4BV?=
 =?us-ascii?Q?CdVmpXTY5g2dh6rFAd7RL2h2CSJ9VHFX1vUwlfYEOQAJVZ2FCaJtjtv3C9oS?=
 =?us-ascii?Q?EtNWcKC/EOLA7/SRZaYpIuv3qF32B4jQE4xrwxdIfYy5tbPGxzmNX26FRDq0?=
 =?us-ascii?Q?JosAgX7o68fjRN+5n6NV2fIdTBuVSO+ihcEIwvOIjyuOcQusqR0AsNOWoVdQ?=
 =?us-ascii?Q?UdAZoOpFieVHTtI5Y+dDThphVBp4kq7SpcIZ9z3kQHEQt9ZguA9Y0qYiIJb6?=
 =?us-ascii?Q?LB8l3LX8VAOkkx9Zix3ttE6eaCnLlGbrmU1L2nXt+1bp0+7EH90gqCD7PN1g?=
 =?us-ascii?Q?tBvkbxe4WX5ubvZCKC24UiD6CVClyVkhGK/DcNbj8dI2mjMHiXY7hwrtwZmk?=
 =?us-ascii?Q?g/kyK+5+rXE/JunJHvHFqnnnaUv+uH0QTGMK6diUC7n2j1rOFPDMuHqJYuwr?=
 =?us-ascii?Q?V9qPhIudIHmLepXwTWBoi+EEEI6zQ7J/NAjLpRs+5H1KlylNHOJPVUXhSN4F?=
 =?us-ascii?Q?AKedgrdBYA7GDjT6zzZLOV33X9nTVHolDwaZV0gmxAKpigO9nPsDYU/SMfMa?=
 =?us-ascii?Q?tFaQ1MsxqMcj2CEkBl3hM3rmSg4cE6dkQtfbZ3dOPXd6QcAMWIXujR3xUcsj?=
 =?us-ascii?Q?l62a7TkeCzKGfn1xArusDHBPUzSfHVW4BNliVM+4EC0HhfJYmEq+E82uOpLy?=
 =?us-ascii?Q?VL9cchqT713lqXcR5XQFUDgSKJgzTbpELev6JeI2fbb0wUo4NbElO3Hgc7Oi?=
 =?us-ascii?Q?BbVsYmVkLast+AwztXTjFZvPb4vvvjPwM4Y9roNTd/8PwtRgA8PoveEB+/hQ?=
 =?us-ascii?Q?Alk8nOffNC4VFFMr77i3qMQqc1v+Ul6+MF4jAd53jpuMfLaV3mY956/oQHHH?=
 =?us-ascii?Q?WlrsLk2lMBgmL4f2yfWLJ4dlcbjstrHowkgaPpu8SrS9dx05GBJRUWxSOCH1?=
 =?us-ascii?Q?P219kuP012Yh5ru2ynnoZU7iSY30Xl4H1Jv1CqaQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iCEujW4k70NdaPjiQu5oqxV/S4OON1zM6FyqgTU8gAZgaZm+iNCJoqhS5C5/EginG2PlhAl+244JXkezBnZlJU/BOLDZEdpqtxSpBQdZb+ZZG4nlpjrp4dq9hjgoWQev6zNmmwceYrFF0bsPYUjnBPG3Vi39XT9Jl5JDNciFPguxvE8wTJkZ/Jl/8iHaZYTdfMKOh/Iqnor4op6SqP+fVDBLABSajqV3BAJOZQaIr+ve4Ax5G9LA8vvuomyeFbP18wd7e39ieifeZ3IurRX6Mv/sHVSEtpgP/wo8PVSkGL7YL1Ov5pgdctbBY3McWzISkiSK408pdhp/P8Q8OgJlzCybSWWGoscxO7zDEptSegJGSqj9pDNYhXMksjzB+nAQTk+2hzdBWAf4b0Ad8lYnMd4z/Chrhf7cEZsaqasmdJSmTFiXL3+9IPHzRDz+eZxfBEUkBzgJ1ooLc7g+plinx85GA4za6JaiGI8Jhxyz1JjbZ/lcS08Xe6/gHk+lC++vhEaPtWrlik2gG4NwMx/gftZG7LcbfH12DClTfE+Y040hUJIM/OadG2yHStDs1brQ7WTHLbdF0n2tDgQ5KgQxeZqjmdt4oGTpj6EgipQf8lQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49db7061-3a56-4b52-fd9c-08dd6fe9bc37
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 00:19:43.5397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s8/FTnsn7f5olD93Q3c9+W3ZSynvA6i4e9c0t/OJvoJF7arl52SOV5j6DytBPXqBBcA7gUCSuahEqTIgga5FKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFBC9E970C5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_11,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2503310000
X-Proofpoint-GUID: vyd_3-mwtTZov7O64_aQWaVhCP7_od04
X-Proofpoint-ORIG-GUID: vyd_3-mwtTZov7O64_aQWaVhCP7_od04

On Tue, Mar 25, 2025 at 03:38:03PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> Refactors the si_meminfo_node() function by reducing redundant code and
> improving readability.
> 
> Moved the calculation of managed_pages inside the existing loop that
> processes pgdat->node_zones, eliminating the need for a separate loop.
> 
> Simplified the logic by removing unnecessary preprocessor conditionals.
> 
> Ensured that both totalram, totalhigh, and other memory statistics are
> consistently set without duplication.
> 
> This change results in cleaner and more efficient code without altering
> functionality.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---

Looks good to me,
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>

>  mm/show_mem.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/mm/show_mem.c b/mm/show_mem.c
> index 6af13bcd2ab3..ad373b4b6e39 100644
> --- a/mm/show_mem.c
> +++ b/mm/show_mem.c
> @@ -94,26 +94,20 @@ void si_meminfo_node(struct sysinfo *val, int nid)
>  	unsigned long free_highpages = 0;
>  	pg_data_t *pgdat = NODE_DATA(nid);
>  
> -	for (zone_type = 0; zone_type < MAX_NR_ZONES; zone_type++)
> -		managed_pages += zone_managed_pages(&pgdat->node_zones[zone_type]);
> -	val->totalram = managed_pages;
> -	val->sharedram = node_page_state(pgdat, NR_SHMEM);
> -	val->freeram = sum_zone_node_page_state(nid, NR_FREE_PAGES);
> -#ifdef CONFIG_HIGHMEM
>  	for (zone_type = 0; zone_type < MAX_NR_ZONES; zone_type++) {
>  		struct zone *zone = &pgdat->node_zones[zone_type];
> -
> +		managed_pages += zone_managed_pages(zone);
>  		if (is_highmem(zone)) {
>  			managed_highpages += zone_managed_pages(zone);
>  			free_highpages += zone_page_state(zone, NR_FREE_PAGES);
>  		}
>  	}
> +
> +	val->totalram = managed_pages;
> +	val->sharedram = node_page_state(pgdat, NR_SHMEM);
> +	val->freeram = sum_zone_node_page_state(nid, NR_FREE_PAGES);
>  	val->totalhigh = managed_highpages;
>  	val->freehigh = free_highpages;
> -#else
> -	val->totalhigh = managed_highpages;
> -	val->freehigh = free_highpages;
> -#endif
>  	val->mem_unit = PAGE_SIZE;
>  }
>  #endif
> -- 
> 2.25.1
> 
> 

-- 
Cheers,
Harry (formerly known as Hyeonggon)
