Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392658F5E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750051402; cv=fail; b=GUOa/c4mTm3o+2c4zqrfXMhcaH2sESIYcf/0e/KkmKRiTRqpNRrlmyjfzyQJtOo9TNkmP6XRBp2EoykI1KxGagGpSfZmh85T1X2iMc3m+D6b5Q8DBzo+0NmAE3U4JescCeWtYJrXm9ZV2D1pj1MSr5MQptePDDkkVIj6T6wAHkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750051402; c=relaxed/simple;
	bh=eYVh5doYsz962ZOoymhs6Gvo9Fg5Xr5wIV4ZuaRIvsY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KbhzI6ZS1WL7hvSGW2f83qugnZHSpZih1GD1QYYfzz1uNLus7wRw0oD/i9VCPGM2/y/T+CplSPoV86+wlgPM7Z78af88FiQNI3+HAeInf7HCsguQDoUN3TurvjfvgVam4a5Il4cKu2rPL2tM+93k+BD0pBUiDUg5aQFuiuWtSZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BPlHBJ2P; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mQ1GsgU7; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BPlHBJ2P";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mQ1GsgU7"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FNGQpw011543;
	Mon, 16 Jun 2025 05:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=lGPlvjbxGa5eTNQvjkrGOnQai7O0omSNPrzXAbeYg5A=; b=
	BPlHBJ2PsrphJZ0HtpUIvR3m4O1ij6l0Epdb9GczkdICYI730M1wl4ODYAiRmeuo
	LKbcZDw3I66vFcE6a95jgMVNBHHFMU4dgBGhv8k6y8VoQIjEsJ6ycmfnjYxQyoqR
	YQRCcoVWGprOQUjzSHEuYSKYwsKPsGO6ShD47KGn/o011I1a9cHOL69AZQH0vfDV
	XwjgPeWWyFqOVF6SABU0Ia2s4+oL2jpQRhhHqA4F9Co15ZAtlGg5R3DTmPe6DhF8
	zcHB30sorQlwd3AEvwjXD7eadkBUarnPmVGl6EgbJOHPJ5D0LDcL0f+YHvH/CUK3
	m7VS9328iOBC/T1BICA5Kg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47900esqtb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:22:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55G3PkvJ036362;
	Mon, 16 Jun 2025 05:22:31 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012028.outbound.protection.outlook.com [40.107.200.28])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhdxw7p-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:22:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNVnAbGaEJCIw4JKjXjXTYj2vS98S3IsnT+KaYzBYQbLX+H4qALuudbaE/CtWkh27Z7gxvEXiZftPmn4rXVCh5H1I1/8o33eFbVWyj2gSZ6VpB4AZfRm5OyrLG0p7BFTFcVOKFra3lGUWBRwS/qeiBklNnMI3Ra9v/n/2t+P4YHvzFqK9EF4YV0EoaU3H4+7crlydEsBnQbkT4pmWZC/8q4ACp6KUl2jG4mxFqsUOBfEoueZTKmpH1u5FgqPFsfdFh+D2fBUVkZc6ywJvKYHpC2jEZjUSfcLkRSPuR29cFZtcTF+QPayPVeq7nLdobAtTVHrNszXjuA9kYcnNubxbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGPlvjbxGa5eTNQvjkrGOnQai7O0omSNPrzXAbeYg5A=;
 b=eEOAqwB9QaR0IcR4gg0O3k/m3lO9iPn07h5RmFhjnBV/oUhjvh8fd9VINKHTACJk+iMLZVHeNFgUtrnEUfauUWyAn0yCTLi0ZjHHKwQqWGxfCIwVd9UwOOWhkzNQMddWhUW/DCd/4PuWfewwBz2d5DZQl4FwszpTWuncLc9+FO3UsVpoJjbHEOOxV8zszj9/mZ6JrsAl4LQRuub6pw5O0UNZ5BRZ0uOXR3VDLqeB9jhYWvmGPA0ff/fhAlVJrnJ4MlPa4PWoxCGlfWWu4sRActiQwlpbowKmgsNtG99gua27BhijDDZ/x+7EYrKzJkVY9R7eqHP//20X6PM2tN55VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGPlvjbxGa5eTNQvjkrGOnQai7O0omSNPrzXAbeYg5A=;
 b=mQ1GsgU7s9DMgiPP8mf8UYWJQ4gHnyypGcOY7oR5AjpJCqyvBz99xWilm1JCXemVPHPpcezeSzgVhE/MkSsT4w6k98stLfmkVLRfSNmqvSeXsla8/DfRHvDtzreElqN0yXL3daRdwBhNfiuXFmKFHuUSbB6+aaJpndK1feCgu50=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by SA1PR10MB6389.namprd10.prod.outlook.com (2603:10b6:806:255::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 05:22:28 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%6]) with mapi id 15.20.8678.028; Mon, 16 Jun 2025
 05:22:28 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Cc: akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, mingo@redhat.com, mjguzik@gmail.com, luto@kernel.org,
        peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
        tglx@linutronix.de, willy@infradead.org, jon.grimm@amd.com,
        bharata@amd.com, raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com, ankur.a.arora@oracle.com
Subject: [PATCH v4 02/13] perf bench mem: Defer type munging of size to float
Date: Sun, 15 Jun 2025 22:22:12 -0700
Message-Id: <20250616052223.723982-3-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250616052223.723982-1-ankur.a.arora@oracle.com>
References: <20250616052223.723982-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P222CA0030.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::35) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|SA1PR10MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: 741e9123-df1a-4311-0360-08ddac95c91a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e7w90ADhmZvVr9is1EZ3FW3+yiYqqU1T1DrKkuaqWRmY3iCwYKXY47TlzepD?=
 =?us-ascii?Q?/fhri5l9P6uUz1GJyQ2PNtBTjQrm43fPT34e/e6ze2t8BHHq7KEESNi/d4Za?=
 =?us-ascii?Q?AlOrtZuWgGOEkwBQ60QEfUWNiWnXfdzbG2f62JxakOnzowq0mILhky+vrDIx?=
 =?us-ascii?Q?lDkkZluzMxJC8JJUzIspUryDni5zXnWMNrcKBUixyr4ZOlBPutwnwBQTEFep?=
 =?us-ascii?Q?aOfj6GsqeRgf+iCOnbc7hsbzA69/mIgvBfEqJ/EABQYNIWBjF2II+WjgazWO?=
 =?us-ascii?Q?sziNqz26F6FxkDo0Ze8JlSThqQl+NmmayEKcnvLs4WDG1C6gGArfzRaJPFVf?=
 =?us-ascii?Q?z7pXhl2LZgoMIum//sl6ZH3JhRhUCbICvQycj/DtAYGkWt0GvgZiP2HeBmjf?=
 =?us-ascii?Q?RlL+vS+BVY69Gewi5vBmhG36VQB3eLAIz2wYkZFHIcwtElFBsOLATg2uuYSI?=
 =?us-ascii?Q?WNuCLGoMqYDYizZ77E+NZ5HiHpeiFSiv98+RItud4GaTcJm3XbdFgkd9odt7?=
 =?us-ascii?Q?yG9gJXIRtIMM8jFUniT98T2Pv49SQUSy57p4LLxQGRLXIEmb20nx7+1VbwRe?=
 =?us-ascii?Q?G9FNRhgGalMpre8/VQEVnrjcJmgPbP0qj/mHoii97wTFxmWaT9CO8oL7UXuI?=
 =?us-ascii?Q?J3YHuIpcV1mAUB0ebsvQktOfsO60BW74Oe560Mk0nMaYI5J2Uix2X/iHcBrq?=
 =?us-ascii?Q?R+zWgXqaMqip42+n6wcaGZj92q/vJspaalImyAA1rnyR5Ne6tMtvKHetV7jh?=
 =?us-ascii?Q?4kJ+Ze7wVP2OiZQOUC0R+iIDDUPVQfNMpYxU0V0NqwHYzsAA5GrGWcLTrCb3?=
 =?us-ascii?Q?h3JwMwiCK0fpOodTYdra04erOlvlX9hDlZEmjSic8G1qM5r5zEUfWaQS/gDb?=
 =?us-ascii?Q?fRVPeiPEBUzVQ3SS0l+k/VCgXcseyztQijSLmyKdj55aG9O91WJtx6E2LMgQ?=
 =?us-ascii?Q?YhkTmgaWZOqTafcGkghVDN+7EW/MjbAVPFsUgkxjnq7n4rMnO3Myxp+l/VGh?=
 =?us-ascii?Q?gYRVLuzpZ/co75nNAQhGm56071wX+dZYsA5lmc3wEubbF7CLzEWRUG2BddD8?=
 =?us-ascii?Q?/fy2AUcXW5OLt1XAYXZDcPFC2P1HlpZzZ0rFwTT8JwNyCJJSxIdb6do4Lt9q?=
 =?us-ascii?Q?fhWifg5b7tSGtE4XceKxYSiaiW1FgwhGA4SPSEpuRj5b2jy3VhgSMAYjVotM?=
 =?us-ascii?Q?Z5p20thcSYlZJTAMpnQSqw0kQ+d24SAfnTUAmwa15yGeQBKXPcbQ9zVM5mrA?=
 =?us-ascii?Q?kdZQINmiNRg+MtOD+miJWw/szlkjYx478CNXPSG4lIiDqsAL6sSrwCN8gnko?=
 =?us-ascii?Q?RjcIY0a0k1894lMdIKrKIfRU6rEJYyeVNipFcjumztHImeXqfX2D3+jEhG9H?=
 =?us-ascii?Q?pB0vfBQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fqG/OwmnzTIXFS5UTbwgpL/JFleln9nDgGeBlbWxgYaIwV27WcpN1Quix92O?=
 =?us-ascii?Q?IW2Q5NF86RcB2BYv84J2MRHbfrIEomQnAlCIsLiKVZwLuUkwGSW8uqiDAzud?=
 =?us-ascii?Q?YAjdt1RhaiAr5h+8keyhIkpNnjiaWffc654r+iUeaHS2YtwrgP8U9bu1jjMy?=
 =?us-ascii?Q?XUZa/PQMWjFWrUejsgJswcGQaFd53g0jO0D8g8q66DIF5vD/ajMTbwtpjF3Z?=
 =?us-ascii?Q?Nkz4wBoUWSTwgqb7CHh2A5wE2+Vmte4t4ySHorzeLcZyhnlVePgrV5R3Fglv?=
 =?us-ascii?Q?uhNF9FfPIOvEtqUe3NUAFXougfeAS9/rq9/Idae0m5+ywSFBStlEzEoIdcDQ?=
 =?us-ascii?Q?XY6aR4jSisFMhqsVAVF7xX8xDCSfJtviWnQrfS48wdXHiTkg9KEEtxB4bBhs?=
 =?us-ascii?Q?pF0mfEXTayjkQBQV1f/YcA1AKL4SQOWaXT58bcZmSbFaZcciPEWKp4fhqmLf?=
 =?us-ascii?Q?Nn8pIXPDlQwFBPEY/ATyjH9oG3rzZrrSPNvw9V4U058Vo7oRxx5oSD6GUhJF?=
 =?us-ascii?Q?qXUE9qWDZXsgTayQ5nAwsMdYwsegbOJni72O2EbmK1V+FbcQ1xOnx2/IHy0P?=
 =?us-ascii?Q?df8jasppQ1/7poO9N1JnNyRgKOqRyzmbIimWqBsRfco2VMED1GC2g560F80R?=
 =?us-ascii?Q?XBraNHE9vGZAFbDAQur8l734HHgz+8Kl+uWBE5YdBFKtccq9wf/APgZlb8yT?=
 =?us-ascii?Q?RKDzrOvmYIgZAxxyfup+6hPaSTu56R8DEbQgPsGrl/tkOLMS88xzRMRrvXPX?=
 =?us-ascii?Q?+7l5Fqlc1mVtgiEPaPn99iJFDfjBfag0cilRQCcNNI93B36F2AXIvMeYPXmQ?=
 =?us-ascii?Q?KxkDVoFiPg2ckk3ts4yfNUdsRHQYryG2uN5V8qBEXoZ+Hb384OjL1WKVGFpC?=
 =?us-ascii?Q?yjYQYr4qN6IP5nnVR1zO1GIPoeZnLs8ZSsFHHyWDkuI/mS+9XUlc96Wa2TaZ?=
 =?us-ascii?Q?CO6cgB4v6joWU4ra/2f2aSpsTneWKiFqTcohv/Hb2mEnaOj1RUj3aDBQ8lQd?=
 =?us-ascii?Q?KcNUIog7PivKPnQNJMkCYbBZK1p0k6qt0uTS5fCo2ZY4cn+qQinPcJx9XJrc?=
 =?us-ascii?Q?k8DO0nrDLypGWlXPML1q/iH0a2UrcsIgacyQZ4kdBPa0D3/Ni1kJ/Dnehnn7?=
 =?us-ascii?Q?WDPktTQviFoLDZil5xIrEd4bk0FR5RixISxY1Oal+OI7tdUx9n0Y78aDtX9V?=
 =?us-ascii?Q?88URSFsV5B0ZYT3UzYjhR8S8nJi8dTxD89JLtMNTE+Ky7VM0qAqksUbOM+YY?=
 =?us-ascii?Q?TEWcpC9CzkXHfcfZ7Y1oWM1bMVzw048JmwpWeX3wGsI21ShLp5eYBlwYHxZT?=
 =?us-ascii?Q?6J2VY/9Mh4VAVg15wfo/6gcU8xEtnlE0o26ert3g+ZnHiI/7w3aJcIJ4ahZK?=
 =?us-ascii?Q?h4lv8FZDyyANWX57iS0ncproCVS3urJoolpewE2n5WSQPBm2TrdOQ60m9wlH?=
 =?us-ascii?Q?sn/sv/crNV1V2C5EHyJ1LfDra5dLrC3igaUJg9ciBjGP2UhrNEl+KTeeZyFn?=
 =?us-ascii?Q?TAmkPI1I9vNTD+okgdbsLg2B2i8YniHgdQrhHvgwks5PlLYzazFx/ZGwc/lV?=
 =?us-ascii?Q?2Bmzm20T6HwSLD3laORln1lXyCu/Q1MSI+RdfWCwvE4i3V7ClxEygiUxXtx3?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hQZwEkDa1KNFIbly6uhOnIDkrSQi/U3ddn0fKqUo5j+flYgHbBOAngU8cFMVM1+siNhWVfbU3t8vSQiDKVG184/XXNB3CQSzhd+C0XHfrGfcasOh6cDPD15kOPKTCr0KwCO186kQDTVs9o3zVNuV4Gam1UaLmwR3LAFI7bUKPokLZX3jNn4HBZfzngn5dLNUIxpzk9JtpXq24ECU97L393/mbt26DzOWGIAnvKyQWX4M324wgkrGHlMVBefXpzPKZfghKTvkWqHghL9ZCh1SF/ubW2B3rjUoWAotuWW6cxCUmTFek65u5stDOqTgL39dqVKM2QZFby/N5DL1hm1+1YYV4f9ZJ1sbWlaXbgwgCRfOuIEmoH90J32Ttsy8d/ksEamdrNvhQg5ZMyTbmGM3L/ps/je2tA97J6N142QJRIn/vSlGXc4bj02A5Ujqf6GB0o8cJyHPN5P4c4MtuPZSH4WuidpkcnJijUWsKyVPo3lh6E72ZiCotietY11fDhBWPZ6EUFYUPtUgpiqmDnd0tMbB72Q/qyl7z6HDsqYP/AsL+D2PxHcs0/yljlLAnrCa1pJ17j64MG7lTnhsGrEf1IeWNXi2jnr/Ev8DANdhrMY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 741e9123-df1a-4311-0360-08ddac95c91a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 05:22:28.1417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ctgQj+3AV54cDpeI2pm/p64Hm4hPf7wCyzmGhVQt/26oiLHHd7vgI/0Ho4sHe10ocGwb5Or7CiG9xMhfiO0VAHHTMmOLBNewuc6h4GWbnuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6389
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506160033
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAzMyBTYWx0ZWRfXyrlBcDJ+gSdA xQFuKussbSsoT9QX7J6LieOwd7E6y1NoY6ztJefb9tK/61wYtmd6/+fCNtrsjbcOO1f393bEudZ cvCLVERwTGb5U/LMRaEiMAbWqSIkQ9mS29pkyXjf0DrHUpLt0EGDoGA0tMsBKlezMo1P/nW36k7
 3qgvxjxSSN9cDaqZV86Mj2JxuX17p23FOh1CK8g+W4GjX99koGjOlPbso7oBBWhgKy36+M9cPRB 57vQohvahGlEYpHq7Su7MJOkteDLXPRD0+iKKxgtEbY49y09r3cXT7++H6igi5IabLGWiDoedoJ RgIzr5t/OP7iT0YTc0SKM/w8gli0hHsZxu+BLF3Uim0SHTnmd3MsHBhQeQM2dOeuVHpgLGrQreu
 vLpbQFDGFCD8pmUXkdY0AqARhQLDxwQH5LNeNDzRzSURKhG1VePJ3FQKa2on6OeifT6YO5e4
X-Proofpoint-ORIG-GUID: SGkk7fAipHNYwNz_5P-1tAsHhC7fwuei
X-Authority-Analysis: v=2.4 cv=X/5SKHTe c=1 sm=1 tr=0 ts=684faa18 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=X4Au_8HLBps5sezr5J8A:9 cc=ntf awl=host:14714
X-Proofpoint-GUID: SGkk7fAipHNYwNz_5P-1tAsHhC7fwuei

Do type conversion to double at the point of use.

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 tools/perf/bench/mem-functions.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/perf/bench/mem-functions.c b/tools/perf/bench/mem-functions.c
index 8599ed96ee1f..b8f020379197 100644
--- a/tools/perf/bench/mem-functions.c
+++ b/tools/perf/bench/mem-functions.c
@@ -139,7 +139,7 @@ struct bench_mem_info {
 	bool alloc_src;
 };
 
-static void __bench_mem_function(struct bench_mem_info *info, int r_idx, size_t size, double size_total)
+static void __bench_mem_function(struct bench_mem_info *info, int r_idx, size_t size, size_t size_total)
 {
 	const struct function *r = &info->functions[r_idx];
 	double result_bps = 0.0;
@@ -165,18 +165,18 @@ static void __bench_mem_function(struct bench_mem_info *info, int r_idx, size_t
 	switch (bench_format) {
 	case BENCH_FORMAT_DEFAULT:
 		if (use_cycles) {
-			printf(" %14lf cycles/byte\n", (double)rt.cycles/size_total);
+			printf(" %14lf cycles/byte\n", (double)rt.cycles/(double)size_total);
 		} else {
-			result_bps = size_total/timeval2double(&rt.tv);
+			result_bps = (double)size_total/timeval2double(&rt.tv);
 			print_bps(result_bps);
 		}
 		break;
 
 	case BENCH_FORMAT_SIMPLE:
 		if (use_cycles) {
-			printf("%lf\n", (double)rt.cycles/size_total);
+			printf("%lf\n", (double)rt.cycles/(double)size_total);
 		} else {
-			result_bps = size_total/timeval2double(&rt.tv);
+			result_bps = (double)size_total/timeval2double(&rt.tv);
 			printf("%lf\n", result_bps);
 		}
 		break;
@@ -199,7 +199,7 @@ static int bench_mem_common(int argc, const char **argv, struct bench_mem_info *
 {
 	int i;
 	size_t size;
-	double size_total;
+	size_t size_total;
 
 	argc = parse_options(argc, argv, options, info->usage, 0);
 
@@ -212,7 +212,7 @@ static int bench_mem_common(int argc, const char **argv, struct bench_mem_info *
 	}
 
 	size = (size_t)perf_atoll((char *)size_str);
-	size_total = (double)size * nr_loops;
+	size_total = (size_t)size * nr_loops;
 
 	if ((s64)size <= 0) {
 		fprintf(stderr, "Invalid size:%s\n", size_str);
-- 
2.31.1

