Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCAF293C5C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152428; cv=fail; b=hlZOAbNs+2EFYkT9FGbccmitGFL7VLPvlu6h7xi1Eqc17YBRj0codqHdKVJg4Ofm4DJqFSdL+EnOPk5GLTkcGx2922ezYZqUHakysZAxvM3yVB8BQ17JE8JwblSM6BrVTuAO0l64zZ1kMj/6+oRRwd4ZgKa9Q4SHELjuPlxVH0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152428; c=relaxed/simple;
	bh=EPVwuG/60GyLzaaCQdiZjeN7UZRSk5edxzr2umdDg1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VBLHqIWTcTc3Zg+GnWiAJqYxuO1vRkbZTjQhWFqg3yTv/qp99Pid+CvJwjlYRw5DMpyVS18znqcKZihq9tGNb5MUFFNu6MWougzIYdg5N8h1qE4xdYXPB861DTuIF+GSQQraro0z7eNnKfMycenvdfunugmj261fUz7ltZx9up4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ipWRwtJl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=z1RGbo2K; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ipWRwtJl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="z1RGbo2K"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H8tgeB000589;
	Tue, 17 Jun 2025 09:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=qqiiaPmNxi5ELoc2vS
	eVnArSanZ3yhN2ISgtALTxwro=; b=ipWRwtJl7pFuSRMzYUj9UrSOEm9RdGX6FI
	gdKrOGmjk/Isv82Z6z431iRwAOUpBgJhNNimg/6de/Vrzksa0hlSiSlODRcr4wPh
	FCmE3nVXu4Dpm1OCcNyg2un1VonjeB4KBOo/4o1iChNWI2gZZnIfT8f2ZFrrXHV0
	VwK4juKwrrKXu3pZADabSS6kiZcwjp4Cu1VLpYnvDLzSRE4dr6KyM8NYAvG7vTZ4
	Kf4wYkpEshaly3VKAY2Eu2i1L1DDFk6A3nkGtl3NKuSzCA5SoLfsfOoH4edDNyyM
	T9HMxQ+X8yUkEEhrDXZrv3q9obOtzwD9c/3J9FpLkomIC9WeJtAg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790yd4wfv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 09:26:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55H8VAVI025944;
	Tue, 17 Jun 2025 09:26:51 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011046.outbound.protection.outlook.com [52.101.62.46])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhf8pgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 09:26:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KvOcr9RgO+eUbVx1LkhdZOKqvQ5U1ilM2ixfZNUMAMydpgXeddnB+B6Km/ARbtaFK7TeOXaodynMtt2GQeR24Mbh6PqRAWwZFwBgBT0eJly/CTV+HYZ32cDFx6qMva7ax3O5s5TLoCQyiScg4VoMwDkzHhOQfq2S9RUtikR2dXQKB49bledyj/8bCrLnUWVOwYNJKsDAd9ukuGSmT4AkdtaZ++4CAr/De62lHFa+fjO7BoBF8YWgN9UrDvZhO/gtcz/zTwFBGbfzpc/SjReFwBKSTuD4sonWdyG7J8H/ot2nAXmyMogqxBSyxRK/y9+qY7HJEBlxPx2PCUsio6HfQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqiiaPmNxi5ELoc2vSeVnArSanZ3yhN2ISgtALTxwro=;
 b=UgPoUQF7brHSaSt1S1TcaR3COSGKxH5Ii5WdJZa2ZaWQB45gU6dbWbKtGZ0zHFay0YVtt0UjJuyexczngn/bL0H2RQTzQP7PcJY11R95xdj8TF8j3nrZT2MIrLsrZ73RcJSMFcAG4WVYfu5m+HSKqdaq9Q8AjmWKyRZdX9Dca+wfsB5ftOFd4Vi7B/miGRlLdsoYQC2NFGTN1qdKV224ESy1quGgYD5u8xODigkK1OtbPSImxUUWYF67qajhVba0DNbvzm9zTb4R215IdR8D3eKFlj3Nwp/Im6VpqTmm7LLaUX9Ho/UDsyXDvFPl8tUBJ7BUq65fhHLEe+EZ6HDbAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqiiaPmNxi5ELoc2vSeVnArSanZ3yhN2ISgtALTxwro=;
 b=z1RGbo2KmIRe9D59ZFCJ9E+NJZF9JFUwRNwBhKj31vEtpwo5MbQoSg0UFghT5WbWMu8B+Wh4xSAO3QsNvVVLfd+VhBIyewQFKu2jst6vDxRElqa37VRQ76LrNVKBf8e985ROTzYnuo6jsl+bPjm01OPp7mhH0/Mj+M4nF9r51yQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA2PR10MB4796.namprd10.prod.outlook.com (2603:10b6:806:115::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 09:26:48 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 09:26:47 +0000
Date: Tue, 17 Jun 2025 10:26:44 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, 21cnbao@gmail.com, david@redhat.com,
        Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Lance Yang <ioworker0@gmail.com>
Subject: Re: [PATCH 1/1] mm/madvise: initialize prev pointer in
 madvise_walk_vmas
Message-ID: <251d9ab2-96ce-47e9-9766-82a2eaf6196b@lucifer.local>
References: <20250617020544.57305-1-lance.yang@linux.dev>
 <6181fd25-6527-4cd0-b67f-2098191d262d@lucifer.local>
 <142cb257-6c04-4a8f-9153-4759c50aff4e@linux.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <142cb257-6c04-4a8f-9153-4759c50aff4e@linux.dev>
X-ClientProxiedBy: LO2P265CA0429.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::33) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA2PR10MB4796:EE_
X-MS-Office365-Filtering-Correlation-Id: dac6924e-c125-4dd5-4c1e-08ddad811546
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A5I2FsZ6oyZENGxP5BPaXCUkSvFTx6kbenDAXGIm1g8oW9zdRrL94oKA0FA2?=
 =?us-ascii?Q?vLgDcyj4Oxp60sXKnuVQIoVJzHw9rG9QC6xwJ1JGVK1pbutn2SlJD1AS5Shc?=
 =?us-ascii?Q?jW4PskYiuIAcqgp1Dou1R/54hQKbngUHAT+V9ZSh7WAedKyvzIlqINdlmrLA?=
 =?us-ascii?Q?LWBYfZ/tdUvnDOcn1M7jZH1zfoTfFNzPRKGP15NJAAjyXLrcv6MAakLGRwbZ?=
 =?us-ascii?Q?fR0BSBaeQPtpCDib9WGBieobeAFifDOP1EmFn3tzTyAEVpGYq5XEu/M+2cvx?=
 =?us-ascii?Q?t4+RH8pJnIHxebtSCNIz+zpNH/N6qNxCHJK96lJPtCsJY9qgLu6uWCc9xV5p?=
 =?us-ascii?Q?sXf76DqcDV8WbUPloHQGY1V+ImlP387wSoR5rqxapNQO/yTS5ib3CpZOZrD7?=
 =?us-ascii?Q?U/EnG84JkjfmC3evujUPC1aPD6IzDRd6cpWf6cAV3ravSO+ensHbcRQrdxsL?=
 =?us-ascii?Q?x5UxMmE0CcFhdiwinzddmTE4OwIYZBUhicjl3U3Pp0XBWbIVYuOyMrjK00S+?=
 =?us-ascii?Q?+uwDEJTjMQa6KMJHZZojMtNJUvBTMUu3JJpYm0ak9TLa89BaZ6pZ45X45yf/?=
 =?us-ascii?Q?+nyo0VX0lhMOkX7RxLJSRdDoeAjA3XAyj4jG97rh3B4CNW1r9z5agGM4WNi/?=
 =?us-ascii?Q?TAewa3mSQopapvJm2AcqmDQZNzNYe5lexZMd73Y4TDB+sUiPa4bXKwvgEwRh?=
 =?us-ascii?Q?0lc5DfQpsckBsP9HfH9BJ0yg3/sxZ6bDSNy2E4sG5GQfgaKpUQRmnLeYKe2Z?=
 =?us-ascii?Q?Q/KlZ/0oZKQmnIVuawZmNsqgClVqvLagjf+TED/Ya05uCoQqxRuOjWyDZ396?=
 =?us-ascii?Q?EkrUgc4h/6FpQQy5EPrgbRlUvhdzoJpGU/DZoBo3GSn8xn2qqHf3JL599uGt?=
 =?us-ascii?Q?mg2XlGoQT73wh3xims5s6RId6w6BsVdz5LS9yB+P6Ikfe+Nt4TTXHs7TnbqL?=
 =?us-ascii?Q?FIszv/ktI+2rbuLFaxX8KZqJMt8absPUfMSfrhtqXHM5VZmuB6cvIHef72ol?=
 =?us-ascii?Q?7U9fIPjaGO+6zgpEO1I4iGyshz2bFjBRFAEBGlXYmnSpIo75SuTNDuhdLuaw?=
 =?us-ascii?Q?WXYKoHV3cdC9VPYVIj3cL85zmEpsBRWWZ/lvyB1wo8+UNbIxkgpHW0uJxruw?=
 =?us-ascii?Q?efHXzCpIcYhpTiV+VfskTnkT/S4nt4kbxD1gFB0ImePwVHZeXJtyVbd0WIrS?=
 =?us-ascii?Q?IRyY5ktyplE5esclfRTIkUQnPuilEXO1TeaIA3+ngEynxTr7SEDrZ5U0ZBY2?=
 =?us-ascii?Q?9mpMOl0AhQfSqg0CbujQ0A7OBPojxtfWWcV6FArYOQuP+mZUp0Ce9pe1blDK?=
 =?us-ascii?Q?dTjUZ+hNnL4JWHm3gQpQyekL0cAy9NNrqlU40lgMXGzFXrE9La1KLyCqOaRl?=
 =?us-ascii?Q?beRJq5YhBRasmPEfvvl4ZzQseO+gurc2qiMQcQ56kZ10RCheWqQLgSr5t7/B?=
 =?us-ascii?Q?x5FjwBOC3RE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FOqkMAWWQaybeOYhdjLlVosU4xEUptMccmLViD8NSvVN/AQzAiZEHqbpoLZ4?=
 =?us-ascii?Q?m6nlOlcTjb5/mMeczXrasa3pb/d1vpQczVd4APswVqlbSHxATAyStdq25whL?=
 =?us-ascii?Q?h+GUhRbDpLsn+sy0exbls7PI6UsU5x+BzEX4YhVRrAvjdjz6AxxiACCORw0Y?=
 =?us-ascii?Q?ZhuEe3qfMK4JggUoJONfmLuQ0xxSu/eFTlmbiZTWsoBgusArNIBhF6j87k69?=
 =?us-ascii?Q?4uoADFK0jdMe7kXl1tBnHCFAZYXeq6JhDO/B0s3yxYWSYjABjlZJeZoARG+L?=
 =?us-ascii?Q?Tnw2QaWYFyEQtN6uIsyxx1zw/QPKo6Ax2S61czsk4zFontraPQxfavOI43TB?=
 =?us-ascii?Q?h1JQ9Uc1k75a8eLQ07j/JAG4GA9afHMvci1RSDpoN39UMvq1Jg5DyQmjUp+S?=
 =?us-ascii?Q?TzSF6YfAVanle2wfyWCUarrOJJINs4U27f6pUh5DIhIeTsfKmHGKHQS0Fdr/?=
 =?us-ascii?Q?xzKcXYdk+wyKtlfapKdSXkIam4G+ur1jt2TqeHCp+Ak+tF6A4mL+wIFZJNMD?=
 =?us-ascii?Q?I2HXCajbOYGi6x49okNU+MoCOHvensfUJExENWK6bCaQ4g5QnoICPTjEp1/J?=
 =?us-ascii?Q?dBQaCj7MtINbdIgUsHVk3jS8xZLdickYKODp6jhpFXEZVIrlYSAZuzpoUZ2X?=
 =?us-ascii?Q?1oE6uw3YHLF1BSPSaKMx3oBQN23TciygGeh2Jq6l2lzpqS3LCvr06nusrAe7?=
 =?us-ascii?Q?nRuF3wxVa4/rfhezXxxl1jSh2/w8B+bsZZqqnobQ8I3rocp7VGHS1oHXVknz?=
 =?us-ascii?Q?sotcyKVulUfiTfuBS2PbW9sl3HHm6t20mfMn2dlaV/2l0z+p5TMb/pSn6NMK?=
 =?us-ascii?Q?moi+7bkbcO7f9h/D2hO0xE8/gbcmCZDs6x7InzgdumzNl9Pb8CT/omrNCEg0?=
 =?us-ascii?Q?LA9XC9LkjKxLudkhlSB2gTQ8cBOjV8Kj8jgJd6YMUiWSiyCAVGjo+tbbE7eV?=
 =?us-ascii?Q?DVqYlRyCknm7kHrYwVttzBb+aqt1uEUzswUTF5ab2rfC+vbF4qfjo9T++ngY?=
 =?us-ascii?Q?jxeRQ9W4JJZuVZYVXllxvvPgnL5IpanB6XWRC+1ydXPp4TEmmCiBDlfP+hU9?=
 =?us-ascii?Q?Y8qqLbNfoGoN91ma29gIwv+4VzyFjpnzr+vUMuYBFWElhboiIPyZmsGb1Z1S?=
 =?us-ascii?Q?ZNJNNMRaBEWXHbLxQ7rVt8+fa0iZJz4PizfcFRDqqUrWDhD0RmKllNVnKhrS?=
 =?us-ascii?Q?NsQOnylzFvtg0BN1uND33svi3qIVx82QYbmdqUnpW9UgEzO1fjrnyOXCychy?=
 =?us-ascii?Q?xzHiZSU5gL+9z0GdAF+1nqoYHnvSAGWHB+IthOGo7zW4hXA4Y3PfaPfSPci9?=
 =?us-ascii?Q?YzTvIYiU43sD9SdqdBtyX6JGPmt8IVbtkXQGOGnUSXRRIpzr/1ZWisuJUMXn?=
 =?us-ascii?Q?xD3lhPZdduPD32jwS4KpMPz+b7yLHdi7+qt/SAM4zZjTPee+4+S0leojbYH2?=
 =?us-ascii?Q?2TAyXmLJv/5Nhhs+om1EhjW99v8FQ4ImHDX9N5MsU5Ny5JXZKb1hfAEMDH5W?=
 =?us-ascii?Q?sInemJRANvIryn/qJrNi7IeOvBp2AV6mK+ji5pHlMtfIdh8ipgIO8ngw1nWJ?=
 =?us-ascii?Q?APw8e62xcT00YxObYx3vGTtmjQIpqNXxptgJAkHTq8H30sie9iO/03ePkFkz?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wXfFEFyxXonJDmy8KfUihBy4AzU4GTTgeZBq9qnKEdefVnMo+NnN3JHXSQ8JwGQuIx/SLdzszS2ithmGvRv3n2DvlOLuIMl7xxn33o7MECUJ/OuKRqRHtjegWVlCXLPzpEnuG20wLUxTBpldfscNYRC+9rnUZE5DnWCjy2OYS0Ec50DBJTgKWqR/+7JJ9roAIkSDRVMWp34jFl0DZVbvGuJghq2h+ZKUmTDRWqg4ICl3LpljklqBuCWoJLUfmvQfOAnMJfozs/N4/W9vYzOgeHyqs8IuuDJmw/Xo5nqdP33By3ynUvzr0ZixdzkWo+9lRZ7gMfzEYY5lZ06bRJaBHi4rVn/DnSnwEB0yOQOx4ZnajocDRrSUvMV83m7uSvxNTZ8awow1XL1g1/vrkJmsNM0Y37pRviUixgdrc4Q8f/SRxEiPWaoCoZOPSjr9dJIBdodvvm5bSaJdRqfu3Eje2CMy3WAqYKRWnew66fx/23bzcBeqsHcmI7zbLNnSkLuk1hE+iffftT0CU5WWT1O9oip7axccv/dZkY5QossfiP9NeD+SvnkS8wTmd6DsYqxyN7WWy9gJfsqjMTckh2R/qpAhXeNtD/6QkIKkSV7dH84=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dac6924e-c125-4dd5-4c1e-08ddad811546
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 09:26:47.6466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q2kC68qAZCEqT5VgFdO/Agx/62Y8iwzp1EiVm1KUzA/pQ/O8qrTXTXrOp2ysRTErvzr6CR4uHW3CHmodsklkj9H+OLn5qP/cksifqMfFgis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4796
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506170076
X-Proofpoint-GUID: I0AJSMzlnRR6HruanLZwxkHdqMe_npdI
X-Proofpoint-ORIG-GUID: I0AJSMzlnRR6HruanLZwxkHdqMe_npdI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA3NiBTYWx0ZWRfX2E702FCm97jY XWsHwgfG4r/zRe/Ks+7RsaumFaC2f2dGNjsMONmCESLSHtrsrLGqU3Fr3R5ZbXms5VC21fPVe9Q 9/dWbfTaPrUN5jObO+yoLFUC2DfkePSmeI0JbpyNfmAj4rlaMD8pDEhmnCpoQNVYIIFAHeLWFMF
 vsyF9ymNWpnIpAAFltgKYRfk7Lu7eH0YK301KTnyrO8OjtPZTqQmt64iFXaX1us69JxKW3frlNg cD3g/V6u/k3EMbJGOxY8ARgEXjXzbbhMUrJdJfYrH0ZiItY/M1iYtOVEiRyiPxBUzfeDbbe8UqK LWV1+jgCOc0qOmNOfyvkoBpHBPLq8arAQ4BohcMhAjDzJ7YbkyvsI7ySKMKKsDyp1D5KARBkMiy
 xQyK3/4Je8PMvZSkZ5tVta8H1XOYnsX9lZpVJ7XqtORW/NRU4fbiAeNkERQnnbFyxBfHwQkv
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=685134dc b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=yPCof4ZbAAAA:8 a=qcXbOfmblXGkhcx2kHsA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13207

On Tue, Jun 17, 2025 at 05:21:03PM +0800, Lance Yang wrote:
>
>
> On 2025/6/17 16:50, Lorenzo Stoakes wrote:
> > Lace - To simplify and not get bogged down in sub-threads am replying at the top
> > level.

Firstly let me profusely apologise for calling you 'Lace' LOL! ;)

Busy morning and typos are happening...

> >
> > TL;DR this fix is incorrect, but the issue is correct :)
> >
> > So the patch at [0] introduced by Barry changed things in a way that _appears_
> > broken but in fact aren't, however we should do something about this, obviously.
> >
> > That patch added:
> >
> > 	if (madv_behavior && madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK) {
> > 		vma = try_vma_read_lock(mm, madv_behavior, start, end);
> > 		if (vma) {
> > 			error = visit(vma, &prev, start, end, arg);
> > 			vma_end_read(vma);
> > 			return error;
> > 		}
> > 	}
> >
> > And the problem is, in this case, we don't initialise prev.
> >
> > In all other cases, we do (under mmap lock):
> >
> > 	vma = find_vma_prev(mm, start, &prev);
> > 	if (vma && start > vma->vm_start)
> > 		prev = vma;
> >
> > The reason this isn't a problem is that the only madvise operation that
> > currently supports this, madvise_dontneed_free() will initialise *prev = vma.
> >
> > BUT we really shouldn't be relying on this, so I attach a fixpatch.
> >
> > Given Barry's patch isn't mainline yet, I think this should just be squashed
> > into that as a fix?
> >
> > It kind of sucks to do this, but it resolves any potential bug.
> >
> > I think a follow up is needed, as there's an implicit assumption it seems that
> > prev is updated immediately for most callers, but of course anon_vma_name is a
> > special snowflake.
> >
> > todos++;
>
> Ah, please keep me in the loop ;)

Will do! Thanks for finding this issue, is appreciated!

>
> >
> > Lance - I suggest you reply to Barry's series with the below fix, or I can if
> > you prefer?
>
> Sure, go ahead!

Thanks will chase up!

Cheers, Lorenzo

>
> Thanks,
> Lance
>
> >
> > [0]: https://lore.kernel.org/linux-mm/20250607220150.2980-1-21cnbao@gmail.com/
> >
> > Thanks!
> >
> > On Tue, Jun 17, 2025 at 10:05:43AM +0800, Lance Yang wrote:
> > > From: Lance Yang <lance.yang@linux.dev>
> > >
> > > The prev pointer was uninitialized, which could lead to undefined behavior
> > > where its address is taken and passed to the visit() callback without being
> > > assigned a value.
> > >
> > > Initializing it to NULL makes the code safer and prevents potential bugs
> > > if a future callback function attempts to read from it.
> > >
> > > Signed-off-by: Lance Yang <lance.yang@linux.dev>
> > > ---
> > >   mm/madvise.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/mm/madvise.c b/mm/madvise.c
> > > index 267d8e4adf31..c87325000303 100644
> > > --- a/mm/madvise.c
> > > +++ b/mm/madvise.c
> > > @@ -1536,10 +1536,10 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
> > >   				   struct vm_area_struct **prev, unsigned long start,
> > >   				   unsigned long end, void *arg))
> > >   {
> > > +	struct vm_area_struct *prev = NULL;
> > >   	struct vm_area_struct *vma;
> > > -	struct vm_area_struct *prev;
> > > -	unsigned long tmp;
> > >   	int unmapped_error = 0;
> > > +	unsigned long tmp;
> > >   	int error;
> > >
> > >   	/*
> > > --
> > > 2.49.0
> > >
> >
> > ----8<----
> >  From c8dc9f5b2929e389cac44b79201fff43e0ab8195 Mon Sep 17 00:00:00 2001
> > From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Date: Tue, 17 Jun 2025 09:46:27 +0100
> > Subject: [PATCH] fix
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> >   mm/madvise.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index 267d8e4adf31..45ea4588e34e 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -1549,6 +1549,7 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
> >   	if (madv_behavior && madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK) {
> >   		vma = try_vma_read_lock(mm, madv_behavior, start, end);
> >   		if (vma) {
> > +			*prev = vma;
> >   			error = visit(vma, &prev, start, end, arg);
> >   			vma_end_read(vma);
> >   			return error;
> > --
> > 2.49.0
>
