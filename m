Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E512155C82
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744970469; cv=fail; b=J0a1BeTIwSjanXIQSGOvggZspKdC0h1nmmkwcRl3CJQaI4fEor34Bb+Ws2uMgxtTgvz++EsLv47msAucdAHrVTR0M/6xB1UxI57ag5Kx8AMOLau0bTdRlONX7wCnrerEtn0VqNk3Z0diKmzb1BkevWYHVIIZqAUdKi1SCqhOYkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744970469; c=relaxed/simple;
	bh=U90XNaPBofLkuXtHcKl+RqMy+H8vs1v2cc91gj6YNXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BKYGu8V2obBxYwLaWH3qnnzX91eLPCc9tTQxsgf4twM7oNT0OeKY+m2I5GFje7SW/cABkCXRJ0Tqk0qCO81m5o8s32MIKCrhqVEtffWYOd1fVSGP4vjI1TcXLWNvD5T8JH7scIq1Wm+ryygrvGgnyqdZ19agyhOU05pUcR26QmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fhg2DZSN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aD0s1ba1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fhg2DZSN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aD0s1ba1"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I7tvrX007316;
	Fri, 18 Apr 2025 10:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=CMgPvv7+D/X63gMuQs
	14Nh1G3eqBNhdts9uYlKfqABE=; b=fhg2DZSNqtqtpelMz1lA217rhWvvYwRhgU
	GK14DImzxhPm+dwTxU07/nSf/Q+lCXz42o9U34E8wJVo6poLg943yA0HSBlIkoz8
	WgUpiVmYnObvifARsbsIRK6BA6E7tc3SY5HSgftWgolNuhgzlhMuMqmDQljhf83E
	vwdIwZGrL63v9gNDGvzqe2ALiYDMIW9dBeqQCDzRQ8k2tcfQ+Ps6lN/rJg1Cm4SB
	S2CzmoowQd1Tvw2QNF5uN+0vIWjw193gBPPIG+8evyaYQabv1NWrB4QrST/Mtnm0
	LjO5yb1PU1wqxqipP8GHuAVuesrG/HUiQ9p6Kd2kT6NwbuVJ89eg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46187y01x9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 10:00:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53I7WHPD030979;
	Fri, 18 Apr 2025 10:00:21 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazlp17010006.outbound.protection.outlook.com [40.93.1.6])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460dbeysn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 10:00:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rr2ukKpVphy8T/NRFAvOOJb1tAnwekJZZ68LYHI7zv9+47sm+W5l2NJ0BShT/YsbEmboN5zegz1v7Yynjta7xRFXjJ2h86mJwWpvGp0LJ9tLCOJ7xvwb9dXFOF+7QRKC3HbKzkq8C/BDUFXJypJERWmVn+/EmcU8qpXvn5r0fwilJywaUpO9S8AW3ufCCRPy/FMvg/ophKSR/EaO/jrmxsBI9wV9YMTTvBMFeq7l5Hd2sDldQdGC0Di8vGnYbd4Pikp4xjyYudHvmHxpeo3KVRZOBzuyFwp1mRQmA6txUX+v/TNjQj6+WQp4hu3RpUnvfcUjOTEfgwgzhYjQtfvq1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMgPvv7+D/X63gMuQs14Nh1G3eqBNhdts9uYlKfqABE=;
 b=h2tE0LRHI9VM1k+PGhD7EhJIeZknhMZSTpYXY+Y+RfnN55WXftGkv3SGZMHvLFHoCP7l6URw8im+tiUD5/HCvk2cpgXXfMG+x1DOSfbTDreAN7maA1DuEuxaNAX/dmcueS3AJNqapZ4thB78TbaO+9UssGEvguTLyVASlRnb8pZcFc0wkarsOmdBzuFtcYKa/vGFmB96nl2+6H/1F0xiMWEZCEk4hEAPXP5zVqF19/fX2XP6bILl/UBMwKArzKYZi+E2GTL1se2gyVu4HBPRsjPDlcIEXQdcMKl3g0+4SludZVsNWHDnbnXq2rXVGYQ+7KKJBu/qCmbEOt3AR4Ax1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMgPvv7+D/X63gMuQs14Nh1G3eqBNhdts9uYlKfqABE=;
 b=aD0s1ba10aGQIvuCbysEGLOZ8WQ+q7aFoDbMztS9OzTuKIQXoy23+F7VN5OEFxQT4S7m7/WFn0F1yAsYb7/I7jvGFCas1Lk0Mbc9/o+RsrAVSxgAN0xphAmBJPwIQy8BhhqjI+D8D3iW9lAeLmUbiwI35n0Ii8hY3XN2EC8DZWU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ5PPFD1D499C15.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7d1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.25; Fri, 18 Apr
 2025 10:00:16 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.029; Fri, 18 Apr 2025
 10:00:16 +0000
Date: Fri, 18 Apr 2025 11:00:13 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: akpm@linux-foundation.org, nao.horiguchi@gmail.com, linmiaohe@huawei.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Liam.Howlett@oracle.com, david@redhat.com, harry.yoo@oracle.com,
        riel@surriel.com, vbabka@suse.cz, liuye@kylinos.cn
Subject: Re: [PATCH v2 1/2] mm/rmap: rename page__anon_vma to page_anon_vma
 for consistency
Message-ID: <7ec4f1f3-a059-4be3-a02c-81281daa18b5@lucifer.local>
References: <20250418095600.721989-1-ye.liu@linux.dev>
 <20250418095600.721989-2-ye.liu@linux.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418095600.721989-2-ye.liu@linux.dev>
X-ClientProxiedBy: LO2P265CA0305.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::29) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ5PPFD1D499C15:EE_
X-MS-Office365-Filtering-Correlation-Id: f5be4215-0e21-44fe-2b34-08dd7e5fd1d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6O5gW2cb6ggHz/NBlZxjCEdr0yjmQ2f38KyJvbYWkg+KgGjZs1VALPHH80iH?=
 =?us-ascii?Q?+VraKGoirPwMArooKTmguAh3hjcXImaJlmn+hyuBlpZnpKYDSGVy0XGIzpLO?=
 =?us-ascii?Q?ADlUNe2poWohljmnIcF8ZJ8boerkZlGMF75JlnSYVbo03lT6Z0ZuOZ6J5hRn?=
 =?us-ascii?Q?9mZZ868eeBM9JTTlhxuQ2yvXpvkqs4G6g4ue3u/ElPH0NwcxsXVn8sCgpeUw?=
 =?us-ascii?Q?9F/wOenQUuMT7RrBqQFxkD27Yxx1nIiien94Rrr/rcLCHW106VssOAQaDVRO?=
 =?us-ascii?Q?XheRHGzkd9Ie4Ezy8Orq+FbRJ27PSqtAiz0Fa3fNpoIUzyX5QJ+vo8nLBPv3?=
 =?us-ascii?Q?YpVMvBTczlzxeKQwhNeLMjwv8ijzp4MYt1OWDbUFSoBKtFTMnL5S66AFaE+9?=
 =?us-ascii?Q?JV0ieW4gTTznvaDDpaJX8Y4CHMmM39An1v3SIFiKrf1N0KYSW7efI7KLlEV8?=
 =?us-ascii?Q?473DKGI+VVE+WphRlhs/BttjAzZ3cz+0K6VW0rB2DLR7r2loql1QcbcLB9Vk?=
 =?us-ascii?Q?PYXUm3KKcayhrjif9bsCQeF9v8ayJvf337VuEFdWF8VTte231ITGDoZxkvZr?=
 =?us-ascii?Q?k5aj9dIafzy0jKhG3JBI7NKJeTAkiFMPXFaU+KtRgit6/l+1uTZBZcTXcXQG?=
 =?us-ascii?Q?jlxcjD2uAsYsl67J8y48vB8i9gCWqg8Oo0oSjz142k+E+5LP446zssd2d+6z?=
 =?us-ascii?Q?eOqDQU24aRM/rIKkmnzW0qV0Nplp5XO+zbs75nmDkYLD4McweFH3J2zv9lii?=
 =?us-ascii?Q?hCarOf5rl7hapuj1Fb/u9qYCUMQtR+QFsrSguWACzCbmXV4vrc9oSyGSi7R8?=
 =?us-ascii?Q?+aksHvc0A3rVqocZLw4Nl5rsqNAD19O0Cs55lazQIooi3M+vTHy2/1sKP7Ay?=
 =?us-ascii?Q?kwK+RuNBCt3cLjzE42Ge9Fx7UHVmAUWLhciQqG1ooQ9S5PvFMbMCCIVAb1XH?=
 =?us-ascii?Q?H9CMDoy1vRNvTK+v5MSBXILrcxH1B5wle7LexXYHsHkNByXw2PLBWhaDxQIy?=
 =?us-ascii?Q?Yp0gmZ3JiMPXBXYndSzHL4ln2ATarWHPeBQjtsPIiMJEmP2AMAB2j7Cz4i85?=
 =?us-ascii?Q?rZNlS5yMYPIK6lELu/rPdwceEQNyt5yk/JD6JEadKw25lmBQdSp7pUPWeMmP?=
 =?us-ascii?Q?ar8e0riT1Cq2Ws9ohLI2+I8r/hllS3/FQwqMBQ1n7aQWIZacchs7t+PZQtJT?=
 =?us-ascii?Q?8UkKSvVdbcBPFRxZ5ytQIy6b6Ds0vUsOlnIXSbBy9och3DhwzCPwaGdfVBk6?=
 =?us-ascii?Q?pjWNtJhijXlfP6a12IXQfp0oMBYgPyyn6awqO8dBCgzEYc0vh0AftMWC9zVk?=
 =?us-ascii?Q?hWY8JlzWrP+8eEKvUJSdhn0R0eCZSit6OTf08xEdGIRyhHtrD8r3pspVOZue?=
 =?us-ascii?Q?ZHHxdETEgFKDH2F/lLeoUGvZtt2Sjis/fXJFqqKg1Y0jrgZqbA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uq492fIw7mMlP42SvZSVZGwRWUaOx6LZxvoXV+QE7A62uc1ib5Qx/NWQpoPB?=
 =?us-ascii?Q?l3f/AqeuI1EVw9b8h0X/tqnc6w567eQwWpN64zN1ZwIJNs1TcSiOVtTudcHC?=
 =?us-ascii?Q?1Nqx5zHfw4eVQGqTqVcQT5Gd9nzutpRU5+dOhkBn+bdG9W5CoczzhuWVRF+5?=
 =?us-ascii?Q?0ag7qv1vxCc2I6AH4kH5V0ORgtrDcPZUd3r6rvtxhG2V8e4LWcWZv82ERHav?=
 =?us-ascii?Q?HhVIpo3IXJy0rQmwroETeAGGxv1hYCcfauE9S6kSAjn/kGXqbZvphN5jGJzA?=
 =?us-ascii?Q?KA2XIKS1/V+OjVy1GxOZWkEm27qXUkcMlVxT1Y/g8d/+nsDsY/XrinhnUSOQ?=
 =?us-ascii?Q?hk5uaVdmdib9Y8B8y+VIk7tVYoQ/e2608+Iwp5Mrl4D1QRUWyO0CR0f+H+T6?=
 =?us-ascii?Q?ND8a/FTC8EOTvHgxiPO0U30bSxZiwFhejel8p5rmp2THrhFIqnQSr6/d/8Sv?=
 =?us-ascii?Q?3KiYWyB2Ur+CdTj/H4BhTYIIVKL1dPgbDWJmL1BNwRab+xdKL/7sO+9fKP8f?=
 =?us-ascii?Q?W/WTODCSFGEj7nGaCV1STxivOx7HHl/5nbftPWN25SwXmPOigMwMiJIFe4Dv?=
 =?us-ascii?Q?XbqcNYf54Un/2JhyZaTWd7J20c5hMKr52epQmpT83gedWd20CpSPWAYWbKio?=
 =?us-ascii?Q?gCf9UqVK8nsAdkyVfW/n0PsfBlV0/sxZoDq3+tGzNPFnNQGY6DBetcPikvYB?=
 =?us-ascii?Q?Sp5GDIyRV3F/iwNll5vVGZNvbhMmSpVdGzFRwiWnh+MnLCqTlro3WUg7Qvha?=
 =?us-ascii?Q?es0n4c4pShh8pn7GvKVr7E3QgNNrjqekkBIJnby3BOs5wV7I3ejxM2OGvxtZ?=
 =?us-ascii?Q?M+6pMScZ3WbHPSXCi28UUB/xc4n8mLONrc2i66FaH9Lk6JV4N2RQOk4tKFZM?=
 =?us-ascii?Q?4LOA5lhirjgVBxiryWlpotqqQnAC1yDbkjVAamBPvQmFglRo0Hw3JylpDul8?=
 =?us-ascii?Q?9L/YI+9iE0P4ozFvfqQ5vu5TroDrbRbz7ATU4zr7DHISoPlYatzp3d5LAux1?=
 =?us-ascii?Q?uKj3l+FT/KF7ahoqR77FDCUXiAuQsseZALMDLSeytIxoUT25MVSPfq6PYRRV?=
 =?us-ascii?Q?FpFLeeMwi5mdDVgnyPoc51npOt67oMlagetY//NX5dSLB1r6jqNWg6SisJ3O?=
 =?us-ascii?Q?VHVTpdD5zEdGBJzBAT+TKRpmwxAMh0yY1nwPoZVSngM30vbG+o+47rxm4CUP?=
 =?us-ascii?Q?PC5weNBCvnZUAOX+79nIMEyL/9bJS+KNNfBguwxYdxcTzxC5jCdSFVxawboj?=
 =?us-ascii?Q?aoo+4yepZTwf+crPwWZNPS1WkdW+HXPhvZ1Tifb9OxI67GHOM1+LnCkwtaCW?=
 =?us-ascii?Q?X1iR+71i0gpK2i5C64WF/d4GzK9DHxkThr/gBMrisU/tJYtukZ1l486lQmE2?=
 =?us-ascii?Q?1tGzAiMdrd2L9pvelOvVVHTxyJqMuBIDKpvjdt2Yf2nSvs7zHenF/Rx3bELE?=
 =?us-ascii?Q?DJ7ANXyzD0VY+ccfKYNw57UCvXIp/Bl+K/3b4sLE5CUGMXE02OQeNo+xrcAG?=
 =?us-ascii?Q?2fGmkHQtRUojny9SGWi9bqYzTRpfvHW5yG7sY5Zh0ThnmhNCvVOXCnX1n1KK?=
 =?us-ascii?Q?c//OBC+uvi9hlLO1h0Gv7dkkAw+OkPsLXt1NiX2vMuVsZpLmHdvJJ8rJ0Zdb?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kIsMr65LnCuFv831euN5o0liZM1QCY2IdnRL59GlDNUwA+xJ76uYc0oLZ/G+1ClKHQ/W/Y4yTgOOF8RzGANF09evoYCIAacbvuuBol+L8Nr7g6d6LGaRaHgiLm4VTsol5AFymuMn1Wr95/MvWxuR3eBKkpoQV13LyFyqSQ7OlpmmdpZ4oeBbPi18gXsQ6/n4bksWCONp7XZpaBBcRA0B0Fn/z9j6aghirV++09NHNZnPE3x1s8GK9q4FIWiLonNmxfTcDRMRaKehcxzlIw7XlaO25ZNKQPjggxOsa59prqhmFUeijXSOL+c0Xf6+sGo8IE3rC1tSBgAEDt3DOPCBkLTW4pNNfj0IJoZCkktIK2R8wz0FJ3lvGfe5YL/PTCr98+xLtdQgleMCLq9aQ6gK3xeA120VuH4RRjNi7u+nOFt2cAPnH1DjaO/ThPHVDUW7JMteNwn0/OlGPItRQkZKENXyQvNtoVf4yMg9KoVqkc4VOztrleZCDbdyKFjBAJ0aBvUwxf9e9cUyviC7S1fKt32qNYHOOB2khcrBhkln1F8d8y1f1zqFZKaPuDDAIULTu5A0F+8iZwMoi5S16qKykFU4elrkYjesH7aWIryNETw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5be4215-0e21-44fe-2b34-08dd7e5fd1d3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 10:00:16.4433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPMrGc1KNz/s07LkDyvFXpfTVGjCpvDwqhMSM+wNEG23HSz2n12nGLcB3N5wbRvRjQZe0IoF/tQYip3X4f73MebqR6b2iFObsCfx0+TPbsg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD1D499C15
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_03,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504180073
X-Proofpoint-GUID: 9V5k2qvdFlARYfSLsS05-qONTXbT00C0
X-Proofpoint-ORIG-GUID: 9V5k2qvdFlARYfSLsS05-qONTXbT00C0

On Fri, Apr 18, 2025 at 05:55:59PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
>
> Renamed local variable page__anon_vma in page_address_in_vma() to
> page_anon_vma. The previous naming convention of using double underscores
> (__) is unnecessary and inconsistent with typical kernel style, which uses
> single underscores to denote local variables. Also updated comments to
> reflect the new variable name.
>
> Functionality unchanged.
>
> Signed-off-by: Ye Liu <liuye@kylinos.cn>

For future reference, if you don't change the patch substantially, it's best
practice to propagate the tags you already received :) that way it should just
get taken!

Anyway for avoidance of doubt:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  mm/rmap.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 67bb273dfb80..b509c226e50d 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -789,13 +789,13 @@ unsigned long page_address_in_vma(const struct folio *folio,
>  		const struct page *page, const struct vm_area_struct *vma)
>  {
>  	if (folio_test_anon(folio)) {
> -		struct anon_vma *page__anon_vma = folio_anon_vma(folio);
> +		struct anon_vma *page_anon_vma = folio_anon_vma(folio);
>  		/*
>  		 * Note: swapoff's unuse_vma() is more efficient with this
>  		 * check, and needs it to match anon_vma when KSM is active.
>  		 */
> -		if (!vma->anon_vma || !page__anon_vma ||
> -		    vma->anon_vma->root != page__anon_vma->root)
> +		if (!vma->anon_vma || !page_anon_vma ||
> +		    vma->anon_vma->root != page_anon_vma->root)
>  			return -EFAULT;
>  	} else if (!vma->vm_file) {
>  		return -EFAULT;
> @@ -803,7 +803,7 @@ unsigned long page_address_in_vma(const struct folio *folio,
>  		return -EFAULT;
>  	}
>
> -	/* KSM folios don't reach here because of the !page__anon_vma check */
> +	/* KSM folios don't reach here because of the !page_anon_vma check */
>  	return vma_address(vma, page_pgoff(folio, page), 1);
>  }
>
> --
> 2.25.1
>
