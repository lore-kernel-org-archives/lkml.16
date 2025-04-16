Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455C92206B3
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744788765; cv=fail; b=P4vboPpafcmpHXMZksJgdji/CBs0CJjF4qjTbbHSkLe5TpEP3jEreK19rhswE3RI0GOSzrJNmpjFbluxYNKufSU5fL5Grrinfo+WbGb8M1FrVgyHWlscinGJGC+R4gjb64jgCNEDmM1YHJXdnQQvjcMWoebgFbeNIBT1pXU4U4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744788765; c=relaxed/simple;
	bh=LJ5iX/MJLfw0gcJPowNAmKOC5Wjr77tbM2Btz/OnnDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=i3orEJmFv13xEk05vnoa0pSdorJvTmZ+Bu3FmirDapAdwT500Cs3O3Gxt03eow3OO6RMS/tbBaY66UPjBqQzNu3KTWSYIkW1a4cIs2YckzjYH2nITfIaycnR/YDJ6BqHwjIL85M/kfHDHyG8HJ67q8cs5IHk6ajdnrVOb9vzXWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=neSg20pn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oPAvWh3i; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="neSg20pn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oPAvWh3i"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FMMpXo003105;
	Wed, 16 Apr 2025 07:32:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Q8bZ1AMoxRkVTlFpqU
	Fxt+zlW+IOi7e+N9n0DU8rDbo=; b=neSg20pn9SPkbZ2k4Spa7ZxyYWsRh+3vNc
	hsW/H009otp4ZfSiLoUmWDMQjnbPWx2e8s0ka8x11cVEeuchZpInwAhpJkQwTiD9
	eDewWdGKoLFw2QnMb/xT0Fd2NgM1NzgAmQ7UgMll48RRLJNlcP5JZVUitGZbAn1s
	bK0JswKNejkJztw1omRMnYObHd5qsT47nIjyYI7uUwJJzQACiSn6ato+0JmJ8ydj
	M59rmzWXP5gAaVcN30Q1q4L/AMmfBVJVqilZoFQ3RNU2RGwJPgIXxpZzGo0Jhgaj
	VeZ1F6Cp4beXVnN7EFUaBpqJwspji0nQcohXQFd31bM5lYDV3kEg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46187xuch3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 07:32:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53G6UnZM031010;
	Wed, 16 Apr 2025 07:32:31 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazlp17012053.outbound.protection.outlook.com [40.93.20.53])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460dbbrkfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 07:32:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sNwhWScQfQn54KBjX1+6mYthrs+VTBhLaALUzMqsxy4Ndlb376zLP3cSQYvafcOd7m4LqYtQex0t7TvpHgxdb/WyX9Xea9CLkt1RSdKR1uTc8w46W/AMfKq/gl4P9gvqbJKKwCEuh0cu4ay21ZKrFL/bZ+nKKxhrcqJVpZUTJnHxTj9CP6aumal6ZFfLOl3dAyRSZG26NjJvFVV3o5L/dDDBiWo1wACvU8obyuYjji6MNOshE7xxDl2NgZFuY+YeWtU6ei/YgN5LFlGA28Zmp+Dn8dzDys7+w8g5P08zFMYHD/ZSBLkh5r4dJTLUofLf94YuriZLWbWdrTyx1Tqaqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q8bZ1AMoxRkVTlFpqUFxt+zlW+IOi7e+N9n0DU8rDbo=;
 b=Mpo6NRxZ4b54VUkFnf140l+VBL6JXubskxccwdp0+0RGACRhq9u5IQhX2mxSB1nR5+xwbzgSuYxf7ERHcNgyS2O/47RTkqxwRCIWi7fA6rKyA4dkcdJ5JcsEGcoy+DjnDH3RN5SDsLGE/ngAmUSwQgJsjQQKdbT5iaKtba2yQmQCKX664MCx6Oxpso3BjeqdcWS29WjCnSINannr1Db7I12FpoYtrjFalhXoc3Q0PEZanBLVFPTv7mfr3xwuxlrfctxJTFZwmR6bo3VDa4d2LkJmGTUq95Ojwf93EbnTBlta8kP/Gs4sLldNgBBPPnIu32Iay2CiN2UL3KehsDtmpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8bZ1AMoxRkVTlFpqUFxt+zlW+IOi7e+N9n0DU8rDbo=;
 b=oPAvWh3iDuB2KdvGqBU7tCmCoo/8ReGgpZrxi/rVock+jmPI06mIhiZgd1u/etvJCmY2G9smynyoEZzasAie30FMu5lWRd98Wh9SJouGkIqGSX7Sr65UPEAwf6/Rq41JvlEDSHQEF0Gw8PmsYapO4wxx643U2f0n2PI1JPLy2FU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA1PR10MB6219.namprd10.prod.outlook.com (2603:10b6:208:3a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 07:32:28 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 07:32:28 +0000
Date: Wed, 16 Apr 2025 08:32:25 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Matthew Wilcox <willy@infradead.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        SeongJae Park <sj@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH 1/2] mm: move mmap/vma locking logic into specific files
Message-ID: <e98bfbad-2aa5-418d-b3ca-019a3f509afe@lucifer.local>
References: <cover.1744720574.git.lorenzo.stoakes@oracle.com>
 <acd557ff58c49aec6a83955b62de026687a79fa9.1744720574.git.lorenzo.stoakes@oracle.com>
 <CAJuCfpHg8ru9a3jQFaGRqJA0hpTODXXstqbLAJqy7bH9RfpE7Q@mail.gmail.com>
 <CAJuCfpEEOh3igTGir-UxJLfKr+y2p5xDinZR9JDLg6AzO5Dw8Q@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpEEOh3igTGir-UxJLfKr+y2p5xDinZR9JDLg6AzO5Dw8Q@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0179.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::22) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA1PR10MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: a9aed9a1-7de5-4943-3232-08dd7cb8d77d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l7moN4NMp4Czkrudd8a2etYgNeIc1rYo7DrjGuX19s8SzuEINhnQLeslqEDo?=
 =?us-ascii?Q?7HKf5w2+3tbWME5BA5PRjnVGEDm8N14XXFFR0pBBpEu3SmHe+9qsZWyDsAgN?=
 =?us-ascii?Q?C8CCmAkpqSilf5PKDG6+pRYw5hvu4tfUPgW1ECEVcr8QWNQ7CaORzmImZhXn?=
 =?us-ascii?Q?8jqKOcnWlvAMUrRD7KgAP+YRGB90H3wO+6T4ChCJXSu8ZWqOCvd63w0B6Lhe?=
 =?us-ascii?Q?l37EigbgwEHEDZ+IyxGxHiIuTb8DkfnU+9uH/ElUsa0uM0t/TNZMTDSetYqI?=
 =?us-ascii?Q?Q9B+cP4gcb4jdhM0UnkHepM7TkpP9SUttdJzGIssN/Lwq7HTG6njZfy4gQMG?=
 =?us-ascii?Q?9/NvzekdAK5uIZgk4A++3azNbhsLqyGwQe5DcB4s0gWBQuDyk7/4wgOfIbDZ?=
 =?us-ascii?Q?xVzy2LSNj7Wm092LmWLgzRRifFfonEwJdAAPZ32b8/p4hnoQYob31BEmzXM8?=
 =?us-ascii?Q?+yTSvIkYSzLzEIoa/EOvLSa/1xJIJqL/7pPfIpQWGefSyB5yE51iMYkIKx9K?=
 =?us-ascii?Q?8/A25eUfm3HNKw8Yq34sFKYtAlfh+v9y9DOiN8RORGU7kfguX1NFoJ2d5w6V?=
 =?us-ascii?Q?GTjknfzlhSfCIDOWCcmtuZu8w4oNbqMG4e66bdE0Qi587tb36+Z/DQQB5DTn?=
 =?us-ascii?Q?VCSLf4NcUvaoVljKM+0Zwn/ct6iami2U9kQ2Fgd43d5TrFAVJZHULO0fsgSB?=
 =?us-ascii?Q?penBPtaPvI31DEyneSvNp3Rg+9O16uI/rcTMFt2AHTKBWJyNiLL3OrnK5uPV?=
 =?us-ascii?Q?5WdzRL6iII+7M6LHBwhgrfuklXOzKxhm+1Yf53dw4opRR369gksEkKdFBYV7?=
 =?us-ascii?Q?SoXoAcQimRuPs+AhR/S/MYhrXzb3OmEF6JUFaJgW4P4dZmcquCbzQKUDatus?=
 =?us-ascii?Q?v00aEjR0Cd6lzlIuLMvbb8LVH4SfAJxlxnm4GwLbD4MBzm1ngFHsb6O4KttB?=
 =?us-ascii?Q?VMr6Cf4Hsudf60JOhQ261PqoszYn8uo7qEPJPfaJJOrLDxyiGpmIzgdORdMU?=
 =?us-ascii?Q?llp7GiFK+Id6pmjSBElwpkW8G/hPysVd4iWBlsityS3RlY9Te2grQf78ydKH?=
 =?us-ascii?Q?qExpVaoZKWCEm0C2iHRh9NOb/girKi1l0HFRBK2NBdBkPfihPv6LAt/ToVoI?=
 =?us-ascii?Q?PSaJ14jlpKAW1Xn8DUlu+KRORUyiQ5P9h2ZquGHVRhQs7dvBn0YfIwJRssP4?=
 =?us-ascii?Q?SNk/kBiMhB7O8buoYeF6fIyg/BdetgCCYUKROFjgl/VMyg0Tf6ttG902yFxm?=
 =?us-ascii?Q?lT4vn/Zx2LhDXmikTTVqRF/PKPFPRRGDjsLBbW8b+d+WBTOQ7DF30QZuk/5c?=
 =?us-ascii?Q?sJYe/VdwX5TIw+UsqcPjJFIaEZBL+Pojh9ODIpUgClFl1RIsXCosCQd/nikX?=
 =?us-ascii?Q?s8Yt7asGim/OW4GhmrE8RkxEa035cI9qBUQqK5uaVG2tcgy9qQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MksafGWcgoLTm+1O+3Mf/eS4L7GO2O9SoJD65uMQKQ9AmL1Cp56LOePQKFPf?=
 =?us-ascii?Q?PV9fZ2e0S3TZgpN4P1Y+qebV75xW+cCUAkngx9mLZVUFeyRds0QzLgSGbF+b?=
 =?us-ascii?Q?nJVjilVqdIpR3+OZ2r1A/8p5CbC2wI0Vg38PdEbv2ks3XHu9ScfmCUcB9CPW?=
 =?us-ascii?Q?NUuwbV3IrvZSneQSw/mF1xA9siSxeOdc2abXi5BWgUtjwcSIKNnf6evTJ5bj?=
 =?us-ascii?Q?uNv4zuQ6uNmjPMSPBPwym6ijCoj6e2w529ZnajPW6Vlv2Q5mTIFE4690bJ/T?=
 =?us-ascii?Q?ohGoVty4H9Ub1EaZkmaECtqB+FmKfcPExIkYV0wjNg9ECRXiMfDOUfclW0Xp?=
 =?us-ascii?Q?xr/iMDUp7jkExKlzLT87mtfeaW4k1xXrxBQo5Qkf44e85g5EuGFLV8Q55dH9?=
 =?us-ascii?Q?F084vssX6BcNiPDpMe0rvJqa8QIWKbej11oC19N9rhQNaAKB5lTLF/L9DwWv?=
 =?us-ascii?Q?0biPwnZvZV/vKevyt5mRAoKrWzOmuYVc0oR8WlLYuSI/sN5zrKXvvzfGgIQk?=
 =?us-ascii?Q?Bk2eiK+rDvMrutErIBdsRhB0dVtIsfScyAQSQy8wlVy8Iz8aoxqq6PTPSwqZ?=
 =?us-ascii?Q?4shvwsa2474P43hYQxYHBmUOtxzUvUgac1NS2X9UV2LQJ/zig5TEP+O6LnKz?=
 =?us-ascii?Q?vA+mK4uodb5aDDSIsyR1ATyqTcEcBaKHJYmgH3kLiCNjP27RKq0hxfI4Rb20?=
 =?us-ascii?Q?Cqj9QWnWtmsWKmiI7nDnn9uI0bnd7+8XjTylMn2NH4W3ka9KY++L7I1R618e?=
 =?us-ascii?Q?HjFLcmyDpSOw0NnRZZFMmqGn7WiNLKjXSJ+uWfEy2LIFPbn6DGtdPEmNCEDL?=
 =?us-ascii?Q?o5mlgWUV/7n91wyPfSRHqwcFf+HMp/PSoW7G60+0okrX0SL16q1jkEjUXckT?=
 =?us-ascii?Q?6aP+9wh1Ar04iL4Jj1tixGgars7b1ABJk4xdhRkY/qZugQ76uz8xVY5D1Ncd?=
 =?us-ascii?Q?rkbTLnhRMUstriN/gzafHrlCNwH6akChGRDhZTWLSn58U+bMZiNYR6z0UzOj?=
 =?us-ascii?Q?cW1oo0i4gYEue2q5uNhHAfNDL0XoQxRxSdJw2/1Vdz6lg96H8rz5gyej1FU7?=
 =?us-ascii?Q?AaI3j7OaO5iLphAL8JRQbFn+bKe20f6EYTeU6nGpGveApuE/knemUkRDHIoe?=
 =?us-ascii?Q?0q9PlnMNsmUV9x8lJvSzSRvuyMCJ3jN9zOyGu1RVDEutJMs4HtbzNl2djrdO?=
 =?us-ascii?Q?tXFrO6m0Ch3SYM5aYywa+e9zTO2Fc/DvtrmKgv0H5K7mw2OEL2m7LTt61YzZ?=
 =?us-ascii?Q?O4TaJxwOZZhnp6+1y1VTHndVJtA1pO0SORrzIw3khsQ2Vn8n4BMfQf7AX+CY?=
 =?us-ascii?Q?mF8Uf9WEVGobGapvCjmKB6BsMa64QOzedG6NbbSdNg7ygloneDndILJuml1q?=
 =?us-ascii?Q?UYt9VN1U+YHyu3HuexgmjuTPrjQOnPcbNbyUXLwcp3DQBSgx5QLC7TEnCYV0?=
 =?us-ascii?Q?0ZwjV3iJhn8Te91MdBPEhIArj9lwsLSonZR/iSZ6RiL0Ipv2ylFkM8NeLuJl?=
 =?us-ascii?Q?tb2F8as9jpthad3z8XbiOr2E1m6PdSdm2MYJXjLQFPy4AV1jWCULuLeAq9+s?=
 =?us-ascii?Q?lIaul/T/FBfNpA1UmwmDt9cpA9iLm9XMzYHieg9WgN/J2X7z5twW0PqlynXN?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AsvhTJB/Td1MNWdmj2+jv5uETVRXpulX2PkQtqu9k/Cs5U6252oOQxZSjFByG0Gf3O0UlkNoeKmwZYI5t2NaM3GowZ40t8Dqazml3WVu5R6Ak6j3VfY1DCo+lGd7feI+/GGl1Owzu93EszuvC6UOTSkSzw7GRy7OVKpoNcQWclh7DsEiXPKkDHTDoY8WP+akLvXQz7TMOHsYfZDi6C+LjcDq14fnHeRYZKSsDfZ8GWWpvJTe+4ME3Q2aCJTA/1ZMFeZwPboxc4bKgfUm5wrB3j6ZxrGBz4WI4v9KuElZqNo8kHH5WVtpziFjq6k+TlveFVZLb+Oz0A2U7TQyiELPlhTjXXhMHLrstgQMAWmJOH8Al3bgkQYqYox8APgv4l+xQi78Oh1gZyXOEZPIRwBHkkyHefq/gufvPOtavolGBj1CPYhBzhUIOWQoQEFeKBOq3gDaoGsoKWcKfAAFkd1uAJJMfRysC6l3QngzhF8uJoSKEi7g3p/Qjhr9WlVQX8TAJi9algVvxOCJWjGg3TR+N1ljda9sRjMQ/EVndiYD5f/seClO8lBjs5RjbsbCsQ3vi5/WhRbCEBBBCNEtcVoSfv/NrI+TZRBrXDpMGhGllFw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9aed9a1-7de5-4943-3232-08dd7cb8d77d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 07:32:28.8711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qtUB2hCw+CxJUG2cvThcaK9WL+4ju9bWCwBIB/YNgmJsCqYw1Yz6xYDvF5ARpVJKeNuWepPTMRrQTvw9UC5G7q76UYSWwaQjQfMl9Mxkrr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6219
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_02,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504160060
X-Proofpoint-GUID: YyuwHJmNT1B-_0_Ei2Fk-G2B4cBTlA2C
X-Proofpoint-ORIG-GUID: YyuwHJmNT1B-_0_Ei2Fk-G2B4cBTlA2C

On Tue, Apr 15, 2025 at 09:07:54AM -0700, Suren Baghdasaryan wrote:
[snip]
> > #ifdef CONFIG_MMU
> >     #ifdef CONFIG_LOCK_MM_AND_FIND_VMA
> >     // MMU version of lock_mm_and_find_vma() and helpers
> >     #endif /* CONFIG_LOCK_MM_AND_FIND_VMA */
> > #else /* CONFIG_MMU */
> >     // NOMMU version of lock_mm_and_find_vma()
> > #endif /* CONFIG_MMU */
> >
> > Note that CONFIG_PER_VMA_LOCK already depends on CONFIG_NOMMU.
>
> I meant to say CONFIG_PER_VMA_LOCK already depends on CONFIG_MMU :)
>

Haha ack :)

[snip]
