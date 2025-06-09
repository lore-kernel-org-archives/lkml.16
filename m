Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1877849625
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 11:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749466841; cv=fail; b=eL40CSUBn3bUImVd+tkydmP/FZOQMshhz4yMWDt9BH80xBoO67qul3RfFzHdmp8MRBt5HluhFtL+GadeP34iwe7ZiEwsUu4l8GfKBHCV7mkbxZmVgr+FaTu1FytcszyJYhyac6FL98K/vVDwrhExDVz+it24PqplX2lgm1n7ow0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749466841; c=relaxed/simple;
	bh=+In3zsva5ioMWTDRAV1Z/M81RNpPVIo41irLFqiq4ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z6ijZRQJdXnF8FmpYrDZQfBvRAqrbcBD8L+43WGkCiZpgwkf66kT0+V3M5GwuPyoTowdKpreCowqxn6DBYlba4G7CMvnibE00RxYZ4tsV0fCV0SQ0EkPWHuo8Ib6ZzBwtQRJOiru7TM2W9EFg3JnaPIkQliJlCOrHtD500H1JNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=duSAXR/Z; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zHiKtUVz; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="duSAXR/Z";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zHiKtUVz"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5593gBV5011098;
	Mon, 9 Jun 2025 11:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=pyQ1DcKtNYQKpTNU1H
	zlDro4WxhI2ETTW+dPl8NmpNI=; b=duSAXR/Z4F0drCAOGv12WyJLL+Ai1uwCtm
	rGGCbAtMe9DFMivAL8yqLQSX+qsPG4WSNDjtnvkUqp21vzdz4Azdf5/cL/a+P6I2
	FoiNwEaRtDBB3Chz4OpvP1MKU7HDd2WxkPErtWQjMQxwhqBwlURdFcRYVEOWh8U5
	6lPPDrXRjFDzIF+RjbD0jYQuwl7FzNL8UkCoribd7U2zsF6EsKh8UdcX8YyaUfE2
	PDT0yJEG7SJtmqOEnQz0bIXXJ+EZjq2st4mISS0tB32wXDNHqggpuhbMlGPBy43U
	5z+UpCRaU30TTAyfNWn7BJCTxQr/tJoTNkBYzUniNG7/MXrNugXA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474cbe9x7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 11:00:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5598o5HW021009;
	Mon, 9 Jun 2025 11:00:08 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvdj4p3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 11:00:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOkpN59NLz9q2Zx9X9tVoQLKsMGftUBhn6myqblc57ip0+KIaVSOW1FKnPTlUZrRDHIZ092deEn5fpRw9FSooXOUhzXQig76oM9nd5o3CjACJkHis9J4froPnBQY0Vy1HHKP7fQXAEtR+G/ggHMgO5goEN/BY4t8oz05FHw2fMTR01AM+3VN0sDh2h+dNGB6zKMtbNmEYwL0uuekc1/SdmNIVrZ0mWNQe5Kn+DUPeYgcV9lNKZ2crNhkwjShMpaouPY0Ohi3RyufirByT/YvONEOYQrUYAeglWGKmbWtjAFdBW7XvjPIPZXVynAs4PnnYWazHvJkgks93SBDu1vWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyQ1DcKtNYQKpTNU1HzlDro4WxhI2ETTW+dPl8NmpNI=;
 b=t2Z+xJ6EHY2RB1+jnyEVhy5wR5B//eWIf3wV/PgQ+8sRze3ro2nYJ6gT1GUFjY5QcBZoy9XRpN1kWRC6XwvjI0dV0NkGAkLtRb6adGW7YklmdtjXq1TQBs6LNgIlFkK7G1DAorFytpizea8kRadsd+PnJB0I4/z6wduAM20qqZt9nhG4x7321CB0gT+hj12bMWFImSZ8bj+j9LHflqnVFL3YXCiTCVbKfBET/TpT6FrixzcE+/Hr1UPIIQF1J+t4Dvo15ulby9YcJRslCAsvmrVLqmgzu0/0nTsouOICVk2/KhDaRYJSYasz0juiGTCGWuUepo2oSfZVTMTeyFFOZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyQ1DcKtNYQKpTNU1HzlDro4WxhI2ETTW+dPl8NmpNI=;
 b=zHiKtUVzdNMpAC9cVlPA+xTA0zqJWGOI3CfGch3zBYBYT2Vh7fO+zSwLUKwR2JPqamh/gbWoHKYYlXEQtU8ds1TzszWQA/R6oMqQBRQ2eI4onAaAVPlu7Ok5imoCE3ivcSnh6a+CbquJKsY6zwPC+wZlWjYkhQeXpBLvih113LY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA3PR10MB7022.namprd10.prod.outlook.com (2603:10b6:806:317::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Mon, 9 Jun
 2025 11:00:05 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 11:00:04 +0000
Date: Mon, 9 Jun 2025 12:00:00 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
        will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        rppt@kernel.org, surenb@google.com, mhocko@suse.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        suzuki.poulose@arm.com, steven.price@arm.com, gshan@redhat.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: pageattr: Use walk_page_range_novma() to
 change memory permissions
Message-ID: <eb0b075a-e6f8-4561-ba3c-3019710847d7@lucifer.local>
References: <20250530090407.19237-1-dev.jain@arm.com>
 <20250530090407.19237-3-dev.jain@arm.com>
 <f528506e-b04d-4c80-93c3-93ba4ca385bd@lucifer.local>
 <58d53c0a-1b61-4276-bdd5-9eb2e583f865@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58d53c0a-1b61-4276-bdd5-9eb2e583f865@arm.com>
X-ClientProxiedBy: LO4P123CA0039.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::8) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA3PR10MB7022:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c68c61a-e1a1-4299-fab4-08dda744ca13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GqSHqMy3J86yVTQNFDnKAccH6FtsfxGGmFLZzvg/5LVOXGTi0Zx2Y7M0JkX0?=
 =?us-ascii?Q?w+XjIYtXxWBW9xed3grFyout7GIr6XaT0EiX98z+eH8uQmxnZ5+SN8aFK5gt?=
 =?us-ascii?Q?DxJx6Fyp6oWho+uVioMbLrDNAJDvKQ/q3Bv6CAh/4URUuf++ZNFgMiSBiE/A?=
 =?us-ascii?Q?AqcztnefMq1z1kb0phGZdeJLP9ihVtSut2A4ylqFLXY3G/VT+11Y0OKnZ6CY?=
 =?us-ascii?Q?6j0UmKjdYkdwed+4YYZ1V5pRB+WCpU8+MyrM1pT58ynfvtQUtlC2h9JODeJU?=
 =?us-ascii?Q?9mt2bSPg7NkrxWHsMjS/XdyLGNi1y+oQbroQ/gTtyUVpMJYPko1kcWIRdEYh?=
 =?us-ascii?Q?BkqnszFnxbih3pFs8Vn/eJoud3ciBgBCDi9ECNM6knbUV1NKZcjC1tfcqPh3?=
 =?us-ascii?Q?eQzpdTlNxDaGNtcfUt2DNCeX8Rh/yFajWz7qdphmAorIzdBRkChAwy0w/Vkr?=
 =?us-ascii?Q?A9OMKpftLp06EdFr18YLStyD3N3uNgwIalg2YYsj9ykxRYK2ryY90nH7sZd0?=
 =?us-ascii?Q?st+W+yPEfMeFLwXEDibfcdEY2CvnpXe/dyYAqIlpQU9/4LR5N40Pcf3jMu2h?=
 =?us-ascii?Q?9NCpSWi2TYLGbLRi42dqNQhe3X2TSHm89jew9IHkhhjwJcvfJU3kJVqQxU8b?=
 =?us-ascii?Q?ttaWKczHV3l56gJyfwV9MUC/37DkGvXOlZRREHKODHsTqZvUt366Q0ZMbMx7?=
 =?us-ascii?Q?f/GW3FneUILIodF8HGS/4iyu3wuZ3ogKlTG9psSIpm7R6lNdfdqNYvapHE9D?=
 =?us-ascii?Q?yrrhEJDlL0l0WF1xlzM7O5R4H9MKQ9Xy7x9p4jjkIHl4hoVrMa0T1x1F4+H6?=
 =?us-ascii?Q?pzVHebfSaVOwVBUB8iHoB9TMmdMYkDS12QNZXwk65cLCaBRsGSbUUg2qCR7H?=
 =?us-ascii?Q?QjpG2MgoIV9NzyhKEZb6rfNBah0HwvTAs+3BcJyNsttJrx2832oh2Pg0Lam1?=
 =?us-ascii?Q?teBp29npQyFO14Bk+9MuanCmScON6Ak9n8Ix1U/DZ9IDQl4xAJVtn87NpGeC?=
 =?us-ascii?Q?9EBjbCaDHLhSp2kQG4qeHWj0XEZR7akpmERLeVep6Vvly7uO2IBr2GCOAu0h?=
 =?us-ascii?Q?lJ+3H9cqCWeEM3BNzU2qIKTJjEv3Dez8l6h5yBHPykbS5REb+/2NVEhI3M4J?=
 =?us-ascii?Q?XhIB2eByhYjToDvaQYkuSHlBfCYYChrC6g3ChWEOUMXPi/6PbrBBrEyvpPcd?=
 =?us-ascii?Q?j5JzirAU3ELcEXNPUrtxyHDHMM2+QHS1jUhwXp375gP5NfsrIzrxmkJfZr8Y?=
 =?us-ascii?Q?ZjLQMjbm2049A6AXBy424Uz4DTck/sXeSypzfaj0r4iBYGpcpw/uDtiDAa1H?=
 =?us-ascii?Q?gYOs8A4j5gr2RfYYpOKECKrrvrR3OZgKQNLVwHuuVHL0FZeBgUtM4V8IF85H?=
 =?us-ascii?Q?2KBmlavC7bABekRrvMNBkDEHsgSbJaQ0sEq+ppZ7u/6+bOGwQugcqd/Opxxg?=
 =?us-ascii?Q?57GYLT0J42M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bwD3SjQlw9nCHUxSlbvX3XCCbFzKXf0qtfuLDWU7I7aSZ5/OjuOW0ayhvNwz?=
 =?us-ascii?Q?IQrbQKiX0wAGhi0HlexXgBMfbWyzf8XLo8Ctbvn1axqdLmpt39DjQNSlMdkb?=
 =?us-ascii?Q?OSkf/G1Wzbb2lgY+Dgu6CCqb1lcUawfqTYl0gwv+7p1n+v8jxJlHixd0ZF93?=
 =?us-ascii?Q?FR32G6cepppnA+JLFfCplOmcJhCpj3tUtQ0tBAZwiblZTZv6wt+6K/Kb0Sw3?=
 =?us-ascii?Q?pBCtFCPFKxofasSOs4p1kE0aWBDxPINQ9TnIJb++etOmY0gUgZk45hEOHAC8?=
 =?us-ascii?Q?rqMFCDY57WHn5pXcizhcmDGf+t3x8OtT5ru1xurp5QW4ztwZeXudZZAJrH7y?=
 =?us-ascii?Q?SAR2DnjTQmBhya979bTp65v4NDecEnJU7ZXfwHjjqf/n+QXtrfEhtTX07gao?=
 =?us-ascii?Q?pqnBThct06YwhQKXj/mBpflv2sa1v41LYbT4TvyUshIUFLqHmsu5cZ0FEN9z?=
 =?us-ascii?Q?/hGIf613JJupd453HZIrb1yamKoICvAgnSRQoslBM8h4FagygOM41oFSb46B?=
 =?us-ascii?Q?09ipMtp/1PW01Y2F9QAG+CqbbjaoFTDuYw1omp83qkZ4YekUvQ+P3e+itdVE?=
 =?us-ascii?Q?ObOPXY4iNVlyNOrc48q7W5glS9YC/rSJiaY+SAgrWht3SPS5H1dfXZM5h+Yc?=
 =?us-ascii?Q?N5lQYR5HTWnkqujVkH4C7jH1BOOtdmZcS58cZs/pPqhrRgVm5EsKJRiLU1Tv?=
 =?us-ascii?Q?9SbjKzGyHQIo6lCmDBGND+UoNX5yzujlsD82aGiFRtkqdqpj1s059KW4YU/8?=
 =?us-ascii?Q?CbFDpAJvbePbolJQNAlN9KyEWRdAjyK4bXmGKMB6PXeU8MpD+Nl6aoEGAeJe?=
 =?us-ascii?Q?X9di6BmriCbRCHRoASP4zP5l34qhqZWhkNSrcR5fS8/MYoQ3fVyYyJA9NC3X?=
 =?us-ascii?Q?NbUyUSrZ6qtimLe1pkJvIHRlouAB5dPaz7yrUgKvsEWYrqPA9hLxQBsNrM3U?=
 =?us-ascii?Q?oPOKwpOf8DbeUjO+NdSQ/kIPRZJOu2MVRwGtrRL+9JPpOZtb8aO8csFTYM7I?=
 =?us-ascii?Q?CyJOA28UBpRzEZr/uap8pGdGHKK6h5gmprQlOyiqZ62JdpwI3bp5uKCvQVJw?=
 =?us-ascii?Q?1z0FM5tReteUo6bEatFn5vE7cfz83W/4wtK10hPFcuBdCM5JDSqdom4hqBKJ?=
 =?us-ascii?Q?xFAhuoFjMUFtMKBXJdgO9WbBtgYm1jm2R3v74AlQ73eFxFfoh9B20HPZCvbz?=
 =?us-ascii?Q?x7RK/ObZtc19ytdvvgDdfK4rMLARs50dxREDsObw1BmRa8ECQjl73ckfyGlS?=
 =?us-ascii?Q?RnCkTZ/pR2PQiKBaJiJ4ZnYHP/r8rnDMH/oG1zo+Rk4ZUQWbHjx2khxgUgdS?=
 =?us-ascii?Q?86fJLCZKT8dOCi4V2A25J6zJ0FpVOUsevumJ8XyEdZgjY5kOD68QdV0CB4pL?=
 =?us-ascii?Q?dBkFz+DTs6rn1ywk2dYkFkKQkjg88Wzfj4VnR5yOHi1rk6tLdRC5v8A7ioN4?=
 =?us-ascii?Q?qYgmIV1QT0Qx/rE/LbtNDcF31H3HBpQuiyciEWCgqu1bbpoPnNKVsPud7Vr4?=
 =?us-ascii?Q?lUzbEbo3lKeXD5jAwOGzvBh2T+O0sZEIFR3i5S+SF1k4HKiI4w0D/DjOl9pl?=
 =?us-ascii?Q?aO1N6QTiXaJF84/gcPlzjVV1/JzZMsi9vJFLZVEqtf9indbFmvhJWhRcDS8c?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XdiTBwkdZIMlwB2ulImCj1fwVg/GG5mbUmmb00F7NmFhNNl4qEEAF6ELvQEO9jhCqPbDi++OdwXCHcmsAZvMvVOQjQSXOZ30pgCj/ELlxyfRKQvlmWyzMu8TuwrAf+3YFLXlfoKYYll/22gz/z80IakJGfk0CSsLkf0NbFVL3WZ0WcroIBTBrV6BlM3uvPCdPIVekalwJ0uF+yBoIgxNYn2qXzkMEb42QWdxv5jCIG0EhfoOdRcUw5kqSg4QNNlcH6rOOz0Fg0BnMYZiiDt/kC8FGEaeo6T/BzttpLCEPhrKe4qKExPErTuwIx1SK/uqdyMfidFFCqJvy7kOe8BM1WH55clnT3m62UedfDRrRnlJYE3KsDhs0aM9gBjC/J5D0cnLIj8sJMAtL+vp14ZjOY/l05WIUrfJYEJTcGP14mVz2Xgtw/dZraxgD4VMzP1C/V8iTBpQ71fMttadKJsL0il8m+FepvAse73YOpNqr9wtZVHp6kE8sHaPbrszKrF4bXTvpu2iYg+5ihdGIRtwdiUw+XVEge074pQbhxr2yskbRvXbK8OmA3Ls5xMbMKtDS5DPy9jSSp1B9FbiYPiwpohuBTfCU3gcaXwP7KSdeHg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c68c61a-e1a1-4299-fab4-08dda744ca13
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 11:00:04.7879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ztrS97AC4hOxl+tWNvLFJO+36sIUfNNPQ2lQbL3kGyYbRbwAAJXSj3/t5wjeyRj9xKSx4wKg78AGz+HEKoQfodzhzZWJSFIS2y9qBIZtWrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7022
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506090083
X-Proofpoint-GUID: J-BVAtEQf_C_wQAc5b7lhpS5grG5XLQT
X-Authority-Analysis: v=2.4 cv=BffY0qt2 c=1 sm=1 tr=0 ts=6846beba b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=ZikaU0_y-LY82XPYkCkA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13207
X-Proofpoint-ORIG-GUID: J-BVAtEQf_C_wQAc5b7lhpS5grG5XLQT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA4NCBTYWx0ZWRfX3/wFD5rskQQi dbPvonjSafMamPukRQAZr6d7JQoZFTI/tkWI0dmWd/4hwKxuTvng25SJcF/C8YFT510u69BlMXj mtzICXN0FsLw4swiCx/qyJiwLYP5asoCidfoRGCNJThMqpXh5oSf+kMGef8GO+bBH6hbX93o9FG
 j0zZMK6ga40J4qoRhcOXyI9s5NIB888TT9WkTTzBkVJjwVEMJs2odHBZHPag0yzyHgkwKIvhHlr sFBFUHQ3d1x6n1TuU4/hOkr59kkj4jGrFQDuugsrsFVncCBmMm3m5zan/+x8sH5ewZpOwA+dfZW sDO6aUgjO/WJmnb3odV3Gr1V95UcwkdVDXP7QMRfjfzGf5yttL07/UNce7UFqwaqN6YN6Rzu+9V
 Cmguxqdn/2T7vFuB1xffmdyIAcE0PdC94gfXMEE0TfowxBoH0Wcdw7jq3ERTsgggfbp5Rhnu

On Mon, Jun 09, 2025 at 03:11:59PM +0530, Dev Jain wrote:
>
> On 06/06/25 3:19 pm, Lorenzo Stoakes wrote:
> > On Fri, May 30, 2025 at 02:34:06PM +0530, Dev Jain wrote:
> > > Move away from apply_to_page_range(), which does not honour leaf mappings,
> > > to walk_page_range_novma(). The callbacks emit a warning and return EINVAL
> > > if a partial range is detected.
> > Hm a follow up question here - why not just improve apply_to_page_range() to
> > honour leaf mappings?
> >
> > What does honouring leaf mappings actually mean? You mean handling huge pages?
> >
> > Would it be all that difficult to implement?
> >
> > It seems like you're pushing a bunch of the 'applying' logic over from there to
> > a walker that isn't maybe best suited to it and having to introduce an iffy new
> > form of locking...
> >
> > Can we go vice-versa? :)
> >
> > Also obviously walk_page_range_novma() doesn't exist any more :P
> > walk_kernel_page_table_range() is the preferred solution.
>
> I cannot see this function in mm-unstable. Also, mm-unstable is broken - I get
> some RCU message in dmesg, and after some 20-30 second delay the kernel boots.
> So on which branch do I base my work on...

mm-unstable shouldn't be broken as that's what should be in -next, concerning!
Worth investigating... But rebase! :)

Sorry maybe isn't clear as we changed this recently - you should base all
changes intended for the next release on mm-new.

As I understand it:

- mm-new is the _rawest_ form of the state of mm, Andrew described it as
  the 'crazy' branch that basiclaly has everything.

- mm-unstable is when things have been percolating for a while and are
  considered reasonably stable-ish kinda, but most importantly - ready for
  -next testing. And is what goes to -next.

- mm-stable is gathered shortly before the merge window starts and is all
  the stuff Andrew will send to Linus.

To pick up on the most recent changes therefore use mm-new. Using anything
else risks issues like this where your patch will conflict, etc.

Another point to note is, during the merge window, mm-new is where changes
due for the release after the one being currently merged are kept
(e.g. over the past 2 weeks of 6.16 merge window, this would be changes for
6.17).

Not all subsystems even take patches at all during the merge window, but mm
does.

So especially during merge window it's important to base you changes on
mm-new.

>
> >

Cheers, Lorenzo
