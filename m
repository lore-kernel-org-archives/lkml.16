Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939B62746A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 19:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749236644; cv=fail; b=J6HjKBpcVFE+CFN11pLKc4jtFJdDDWtbAb1EX0IJobMKXy64AjEn96wiR3m3kc60/w3ayD2nnSpSBwF/B/UWl1gZLS5iDqoqBQlHJ/fNHQrjA658pE3ip8a6Uk5CBzJX9C34DkfMf8oovakk4hFUbwRy/7LGX2E6SoiirueUos4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749236644; c=relaxed/simple;
	bh=ywg134JQ9TlLbxbLIJ9ZwUO/5x9+RtjkTHU2rQQMAxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TFSBBQP8PYjUIvvwQBN8LMfE4IrdQm0FwzshKX3DGKIa/CU/x4wjF49AdIKL4sqasvtRWsUBKCYTFGMfUwlJ3kHEsdL+C1xAmxwuJ5kJltw9WkatWBOuzjP0RP6eNyX3TTt2SyThPzC5W1J9DSLg1f9Dtoyh8njAxNH56qiJPfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hi1jxUwS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BQgddrt3; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hi1jxUwS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BQgddrt3"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556IMZDR022910;
	Fri, 6 Jun 2025 19:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ywg134JQ9TlLbxbLIJ
	9ZwUO/5x9+RtjkTHU2rQQMAxg=; b=hi1jxUwSo/weSyYViFsRQuQqrDvMtQ/KpL
	bS3SeS6FB77Et4Jt8xT0SculMycXiky4BX0gBdnTWcjUSCqozkhrKZt0+21115FX
	0JsPOwHQnvFZZmnExG9FBnLD+7BjQGqhmKB4PV3cOpFNMJY+tToGdfxdxR4hHKSC
	pMVNlTvU9jf/gWfon+M4zycr5Oik6cWkEbuJPxYiK7kLM0XZCUsXQRW0aYRVTu9d
	yQO73rODVkqFuJdliXBrhUAEZ4PASl6D1b22zdbOyBP3bon0B/KMDcsEtpb8GWXI
	+1e8Qc0ZDJ/gLiSxTd5RNq/yC7/fvOKoQ4+bf9t/x5fOwF+QAr1A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8d0hsm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 19:03:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 556J0Qpr040683;
	Fri, 6 Jun 2025 19:03:44 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2049.outbound.protection.outlook.com [40.107.96.49])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7dun2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 19:03:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vz8jjn/hTaQZHDC4XAq6sZ6mlU3qN93zUAtdumOlDFfQ6pKiPag2O+lxz3UJnUMunhjgJw3zn9qg9A9wDQOvJZpm4nxi4B+/1TZn/zl8eQh+cFAg8/3oDdjJozC/n8fB0In8AJDY1k0XepxZ6G/SW54EbUOy+Pne5dsHgVfaPQP5x/mg1eeTQSsaVnlBRaigCwGFxxiTDLoh1kV2LFNBiU0VPD8VFMXUpJpF0xja0c9RNp9D7xscwNY5aN9q7mq9OXJtcb3lL8bsw+7MrxnTKu3ZkNJpp/jj9NO08Q+7zaDE7eEJUe4RuW4LX4/cJlrI8TDk/MTADSLvXHD4LETk5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywg134JQ9TlLbxbLIJ9ZwUO/5x9+RtjkTHU2rQQMAxg=;
 b=FXHdZWmA2m9EyALfdoyi1QUctLQrDwCt0/rWDf5WRPp/5SYeKftTcY7XePNU41NCIyO/PN68KBY1P7B2H7ZTIa/IPOCIL2ak3zMznd1SSQGxfjIB+Srq0564o6WIRyRkFvKuot+43Xr0/Lcv/855H2iOELl/ZhfhdAphxEKeTvB9FChpFz1LtCyYt1tqIltz7IUX3sZ+eCBenLRqBpuVQZ38SiGNxXw6ejNaGq6cHo5DDwOTMSpzM8FfDxiVVPCu7aN7RWlzwLt1Hbj5PjS0tAAtdU6UpUxj7Ukf5nQuayux6j00ALmT7pplwDvibj+puiyk2IRT10AXHpqD16Y/mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywg134JQ9TlLbxbLIJ9ZwUO/5x9+RtjkTHU2rQQMAxg=;
 b=BQgddrt3yn85MW9OZOv52B3Vv1RG/8M9b7BVY0go3tzMl53KNr1jjuUnw79ApOjk/fl7X/IqSPkWv4YjhyrhK8mKSbxE3zgK6hg81QmpmYCYx74I269vD1jbsd7Y1nISNpAj+9PeDVKcfyPCR/JDSiiP4xN713a9mMblOdwzEMo=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA4PR10MB8256.namprd10.prod.outlook.com (2603:10b6:208:56c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Fri, 6 Jun
 2025 19:03:17 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.022; Fri, 6 Jun 2025
 19:03:17 +0000
Date: Fri, 6 Jun 2025 20:03:15 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
        Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
Message-ID: <e5e88da7-d7c5-4a10-9318-76c1e38dd0a6@lucifer.local>
References: <50ff9149-2824-4e57-8d74-d8d0c063c87e@lucifer.local>
 <e5fa4a36-2af8-48e9-811e-680881c06b86@redhat.com>
 <1a7513cf-4a0a-4e58-b20d-31c1370b760f@lucifer.local>
 <e898e52e-a223-4567-9514-b4a021b5d460@nvidia.com>
 <72bb36f2-65b6-4785-af9d-5b1f8126fc78@lucifer.local>
 <2f866f12-2aa0-4456-b215-08ddc9b13b1e@redhat.com>
 <3dfbbd63-697d-42aa-8906-539d74df9123@nvidia.com>
 <44af8f5a-2d94-498b-a3e0-31f5dde74538@redhat.com>
 <20250606184212.GB63308@ziepe.ca>
 <f2d8febc-cf95-44dc-9f01-b28151fe1282@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2d8febc-cf95-44dc-9f01-b28151fe1282@lucifer.local>
X-ClientProxiedBy: LO4P123CA0502.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::21) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA4PR10MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: a4794d2d-676c-4fde-0bc3-08dda52ccc11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w+Ua6jz5bld/s711SJ1i0+REQDIx0JXubpaeYqDfRX6T2oSbkNY+adB2yUge?=
 =?us-ascii?Q?Pxpk0zzylYk1+gGYbdp9pF74e4bu7sqHWq1fQoEKtNix73i3cGpK2DH8OByz?=
 =?us-ascii?Q?pqypiE15rWY/0Grh9KhsnDWCZTLX5JIkqTjum0Vjfn4XFcjlJSmizAsOQgqh?=
 =?us-ascii?Q?pMUKMEhDybOYrLpMfN5RT9mikdG23GuAtWj4Ds0lCLIUv1jfhVjCF6LZxr64?=
 =?us-ascii?Q?cCc6UitQLNtzYn/Q38lZUouhShsYTk9O2yVccbOixGwHFM0g8KKNmKr7xTys?=
 =?us-ascii?Q?yyiBj/oMTUhNVH6XAEMWvfT1jos8PXBCQlULtmzcKHQ4WrH16u02bQSlj4QR?=
 =?us-ascii?Q?cgCqjpVoYfdB6eyYzSpm5m0NWQ5+10j1Q0qMCtYiAOWlh9xKqzuiT8d/d3K1?=
 =?us-ascii?Q?Y3EeJMVWlBJ4Kp2k2SgBsc5P/WbrH5m917MaTet6vj68yauamBhtNFEPb9ZW?=
 =?us-ascii?Q?8Jhpf42nc6RJZuImIb+KJr6ErtucGD9uKe5XjiPKZhZiwTcc4Yo4f+owXeo+?=
 =?us-ascii?Q?wQarCnOTW/KB55S+rJdTj+JOdijR9SApoElfISJ68bUabLQUBUfceOoazT0O?=
 =?us-ascii?Q?bCTh5uSFO1vctSp7zzTCXXhRlq8FysDqrTDgzhnHKXmxVhz06znuuc056Gh2?=
 =?us-ascii?Q?rd2kiwz3ns2mTdw4xhZpT8eknbluKNJz08nyY+K40Pw81yd/gEthVMkBQ5CF?=
 =?us-ascii?Q?eYu3f6uTgwwU5A+eVYPeMMQTqWq18r/56JBVPN/HO9mSl4uyL+yP0uUVYLPt?=
 =?us-ascii?Q?yY1dtDifCn4jTxQ5cfSkoUZjjI2EG2l+U+QtEY1oDrBQkqJWwut8904h5Bs3?=
 =?us-ascii?Q?1Jg1pahiaCTzGW2stNHxM8bAxUvE6HKA0fHwBcAbOsNVb7kga5UNTdtfaiDs?=
 =?us-ascii?Q?Pp+UTbXnyW4rx9DDx74ZJBd8wh5nhSmme4UQN/CzkM7vlaEoisxrP8RgEh1D?=
 =?us-ascii?Q?C1gEd+IfWqeVnPBcjn31SXy+REMtWJpwhuiu2i/9/aavJgj37LLfNL5GfZ6k?=
 =?us-ascii?Q?FtBw14BvljDf7L50f2RT3UbHOixgqVuw/5ob8io93zV0uMe4eySBYSZm+7I5?=
 =?us-ascii?Q?8RLlCrJI7BS7z4eI9kgKVsFHETwFxNAKPUSjcQKTsunFI9Wmk9IK7wB6SN/0?=
 =?us-ascii?Q?zld6zB1wfmmct5HOr2LgEkNkz20Jopyw0znFBs9NKCxtSHanZ/FsA6WoEki3?=
 =?us-ascii?Q?V/6ekhFFG9Hul5GtdnFrJpt0PguApwVSjX+b8uyY1zjWD0AzN5qVg7LLXkPJ?=
 =?us-ascii?Q?UgiezUayq8MQdKcNw8DT+MkTBi4SSuV0Mjjz2Wmp6qKjdoPJqpCIAKPn7yUg?=
 =?us-ascii?Q?LInmDRh6ezH2gv7McIYSNPluBSJp3TpBwQlrucM7JdhQ1sTL2g38rZTwmpeD?=
 =?us-ascii?Q?xW2THZVFZjSwGAb0DBMPKlKWP/5ogEsdNsqXqfqkqP3sXXwDrQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QJEmNRE6jELX8HXx2Grb4HVTCvH+rhcLqlL+9/RU22t/rujQPs3fLS+PXuwH?=
 =?us-ascii?Q?pVD2goUsnQ+pVTCLqR4PRbsC1SCXi3vWFyq8bye2xwwR5NJcGDT7TAH7d9ac?=
 =?us-ascii?Q?vY672MpPdootlqDm6ZKYk8E0s+fSo7EdoGVbKU6h7wFDmuujExzfp+Mf7D+J?=
 =?us-ascii?Q?J4AvpETGYqhLW156s24visJ3nLwwE1jFp5CbwI7PFmNc8OLjqf4SMwjR5jlI?=
 =?us-ascii?Q?qKxZY3D0ktJ1KSEy37wKGyM9vQHPnYr8KHyG3WLo7ns/5IieJQ0lrUUEpq+w?=
 =?us-ascii?Q?MM8fWU1MU+LbQFuaC5poVYCaZZ80Q8eWM8Lkx/I3aZ5HH3Xbi2wM06a26mdX?=
 =?us-ascii?Q?0Yfc4xO3ucr8bXHZK8oEJnagDA6XjGHDgodGlvc0sImY9Ih31OBWj+t19PhP?=
 =?us-ascii?Q?BgvTVH7CKV1f+lniV1piepLSRMKYG7C/3GWGB2J6o2brqU1Q9oOVZFprL5K3?=
 =?us-ascii?Q?hc2xb3uXS4A/fk1pMZO77s4n8Xo+fyZVGT3Yy5OaNzU4MT+i8+jbvXai4xTJ?=
 =?us-ascii?Q?NowS2DlJooM8hY7NOyuZFw3AkLmB3ctc+WTE9l2NIlQN0MOkFO/Gpz38uuUK?=
 =?us-ascii?Q?+Wkh6DV34dZWvZH4rox7GPcFwhOh5rTdfoy7GTMZ5Rq4NaglK04MyNAAO4b2?=
 =?us-ascii?Q?RlgLklvcg1AV/8H/XBUniK7QwKMx1HC2wjsUjp6abT8JzeOLyDIdubU9TuKZ?=
 =?us-ascii?Q?rCTVsZTWWBIg5QTCQ2l19ZBk/jBiWGIDYVUuXV1XtnTNSDUWYBjMClfTsSn1?=
 =?us-ascii?Q?CJwgkUvBsSR0UhF1Wvejcn+M8rMXJ+tBLTdECfJOHmiu5n3BQb3X5JQm/kq1?=
 =?us-ascii?Q?bEoJLgPbpbyvvyzZmFfkbkKKbs+LEfyqPsabHe6u/kQb0ohKkwOR6oY047vs?=
 =?us-ascii?Q?LvTVeA6duLM99uWmh0IN0Th9ID2djH497OyOnqPV+p9baZK4dcTvbWr7MVqk?=
 =?us-ascii?Q?HPJGxyMX3QG+peQAuCrY408Nw+psFzV2SVXzvuaMhrVNt4pFPMowvsfBZDYO?=
 =?us-ascii?Q?rHMaxyhLh9aOuBD68OPioeXhM9a2b9vWGM6GyTofWMEg44fnOfzQ61HYGltV?=
 =?us-ascii?Q?/epHir90I6739pPiY1kziG66LsBVCmshpLiV044KYcipQMeZkSx+CoWrp1E2?=
 =?us-ascii?Q?ek+4hZpy/OtlPsRZgXA0X2I/NcrFaOYs5jFsZTEqA1JBFmVMMXuvweV7Xj/d?=
 =?us-ascii?Q?Dwbamx0nIYQCDMRgbRmP+94q439NeUGACZva9s8VA3auys/NHDYS5a9MczEA?=
 =?us-ascii?Q?XF0ixGp82O7VeNo5JfbPq2x25GDHIXq8O8iWRZTuQfHfW2FSms5lnmGoMXxK?=
 =?us-ascii?Q?fr/NjaLdhybWeTKqPmsAFJP196AldhcwZx3hZvjpVvOL0/JgR/i3ITuq8NIp?=
 =?us-ascii?Q?yxbmQpViPEgi4Cu8N62Gj/BzQPk8c/jxQjMG3nV623X4NxhtOkgA4s9G9Zrq?=
 =?us-ascii?Q?RJpx57aOgWgnVHoQr7ihjuDHnn+Cwulo91de7KU5BpMV8I+50JgDX3kck9Bj?=
 =?us-ascii?Q?UaZcDBwpwS69Dp5CdbrJRYNWVB0mtyTxAYlyNCiZnp/01bLRKNuHistz6WGH?=
 =?us-ascii?Q?1xI5D6A4ZWY/s7ztGN7iYobPmh/31vCLOJqCaBMxNf+dhSufFcLreLZTLV7W?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	z+BTBfmpsLNrczI/s/mW3eg+kExxXh+qTw8EkRaVRqlTfynQ/xld3UfQRyP48QLibxAThsEu5UtPjbD/Sn3xzthG2GMKVsTLUioVib1gIHP0+oZOyYvTA64BPIRYUlRPcxu3SYxbrCl+Gm9H7XXSH00KANKXxtsdxUp6A5qb2glgWWvGyQPp6D7o92DbwBgptI9JPKQKx8eqdW8pLsr+QcBdr2JIHfBLdcoGUKyW/2dU+MnFLJOP2kL+xtO1IAj+bIiUTIo4GjdgjKTualuJe2wPvfpuG/0Rwi2pXzdozAuJTdJLDBFSwk0+Ypcdd4N21gj44HhZPw0fhO155SrvbFeEUQFa5kA/sRXz11w3Jqk5B8xyrK0KMZ+JUuAF+t1wWu/Kpd1WqaEc0q0fRwNP/IhsrHDojL53oBhAac/g7cz0L0/yJ5lqz/MvOfO+lVuD6zMTeohPnFDh/3SAWhMgRAnwYmDISw9izrqhdNxPo+RqyRGx1idLoVmq0Ma+6OlNIVbMICQhyD3/Iwsqd+Ax0Dq0XX3i4eFd/spVBnlFSaZTLvZKiPRYQRLusMIN3sPOAJjVd4XP6IfidMwuOdLtUIGId+alyYPp85gGoQgFcq8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4794d2d-676c-4fde-0bc3-08dda52ccc11
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 19:03:17.8372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ug3tcxW3bFicABnIcJ/WaHMuyM4XMtIdhrKl+2CGWmGx8T11HQg0xXUOdczYIp3JRCbHNbh9StvdMxdlkfoTBCEbOPs85BUleeDaC6svzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8256
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_07,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506060164
X-Proofpoint-GUID: kMmV5z_KwSMTLU_hBjs9My1m2GnqoJ-f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE2NCBTYWx0ZWRfX4luD8Fj0GgAS /jQS+A/G/laeZEcuvZyx6psZ3usIPXnVpQ8kNJ1bAHNGcMJWEnDGbMQFVUKsQAuXkRCvy+m1bDt 4Ip5t0QPzLh08uv1aRajjNWVkj1kifdfynxcsKqrTC1whFsH4dtKBVsFCfrp/pZhp5X6w+W7/mp
 Sk1xy4/DcpQtSiCxJiGX2i2thoveO03bRqFblMU6qzceKuD59PKKb7SLwLDsvzM+ALzjalCLCYi U/eREivO8zvqMLYS+KuZfLJlwYKy3ysl8bQAgf1Y9vxsp8AT7a0W/rssGZ67fizKA+eRjZ7XtaC hibNH+BVLtTquYCZVOZdhhjKe3B+89v8jWxXuCCg7CLO1cnJ2x3/KR+Q96J/PCLR4gWJJLXy2wX
 zi3j/FIsWi4e2h7GkvCmUK6s1Qm/3Fn2mFqZnN0E7F85C5P7/lLA5MicNmOHp8sT1vY0MF32
X-Authority-Analysis: v=2.4 cv=KaTSsRYD c=1 sm=1 tr=0 ts=68433b92 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=AaM9myho8mFZwoBQzKwA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: kMmV5z_KwSMTLU_hBjs9My1m2GnqoJ-f

On Fri, Jun 06, 2025 at 07:46:52PM +0100, Lorenzo Stoakes wrote:
> On Fri, Jun 06, 2025 at 03:42:12PM -0300, Jason Gunthorpe wrote:
> > On Fri, Jun 06, 2025 at 08:23:25PM +0200, David Hildenbrand wrote:
> > > > One last data point: I've often logged onto systems that were running
> > > > long enough that the dmesg had long since rolled over. And this makes
> > > > the WARN_ON_ONCE() items disappear.
> > >
> > > I think what would be *really* helpful would be quick access to the very
> > > first warning that triggered. At least that's what I usually dig for ... :)
> >
> > That's basically my point, it doesn't make sense to expose two APIs to
> > developers with a choice like this. The WARN_ON infrastructure should
> > deal with it consistently, maybe even configurable by the admin.
> >
> > Keeping the first warn in a buffer is definately a good option.
> >
> > Otherwise how is the patch author supposed to decide which API to
> > call in each case?
> >
> > Jason
>
> To clarify - are we talking the first instance of a specific warning, or
> the first warning in general?

OK sorry I'm being dumb, it is -per warning- reading the thread :P

So I guess you would have the macro establish a static buffer for each instance,
and then some interface for gathering those up and outputting them?

Always output to dmesg, but only populate if not already warned...

Or maybe rather than a static buffer (as those will add up quick and you'd have
to figure out how much space to take) it could be some dynamicly growing
kmalloc()'d thing because how often do you expect a warning, but guess you'd
have to be careful to ensure you're safely allocating given warning can be in
any context...

Or maybe another circular buffer just for this... hm yeah I guess that'd be the
most sane.

And I guess we'd not want a new interface for this like WARN_ON_ONCE_STORED()
because that'd be... weird and how would anyone think to use that and nearly all
cases wouldn't.

So I guess you'd want to convert WARN_ON() to use this, and maybe WARN_ON_ONCE()
to also use it but just not output if already seen.

It is quite a nice idea. Could be a debug feature though as would we want it for
prod?

It's late here and my brain is fried so if this is incoherent forgive me :))
