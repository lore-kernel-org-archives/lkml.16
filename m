Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F3135970;
	Thu, 15 May 2025 21:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747343093; cv=fail; b=lWMPVTSG4tTlBEYiQ5EOXVIDLx2MkZ/iVMa8tor6HxS1nxEgDCZ+ERM8XeKJuL52SK+DfH4RmSN8/KkFJSCzmrkAsC5r6wTxOKLXylKolR/cCx/nUJ3d0qS4pS+c+tyCF2rLzw2TsR9nGKiUox1UBU+86PJ1FE+bIdMR7iBKgT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747343093; c=relaxed/simple;
	bh=LUx6QGkokNyhqypY+WLJ4s5qXdTxeu4Ufjd1LVv5CQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gPpSBl598ml2FapZEhzOyH2I9dPAaE3jSMLkYpOYCJVqlHF7lxCcwmxM6Bo5MsPAONBpwr1+bkZcoTuXLZlyTgbuKb4kHLaQkqscNRT2/MMsPqXkt5vV0uCnQrp3D2ey2VQN465BanWpRBNmQbY6/VR7MGuKuBQ0hRjk7VKa6WE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ipLQPi+A; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rHiSgrA0; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ipLQPi+A";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rHiSgrA0"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FJBQAu023103;
	Thu, 15 May 2025 21:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=BtSr68FGzjUypJ8Iml
	JPYHnpl1+T2LOZ9GQuheOMQ+8=; b=ipLQPi+AiDd615WiY5DXV6ca/r6WhXTDmq
	DSd14WSq1AEvk4ww4doWPTMJYId0HOfey6l6RKdRA+ROEoVLHvICKbpUMiuF+UaB
	lTINjvAIn0YW8EE9pqVDhaDkeZKgZFXXn1aTeQxFvT/r6Gr95J/cjBg8oMlQDzZ7
	EF/x4kQq1oUSjIA5f2Bm82Akrpci/9r+PY1fd+0PYufQfMW2JIPkqd6jPb/BE791
	GjNl2Eo06KLUlhKgUltweBe0LHS8MAiGzyF4jN873l262ZW9jv5GtwZ9//TF8ckf
	jrKpBWZwdHcJdULcdsjBy2o1pf77EzC4e9VObSLVQFVsrLzFXTZw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbccwg0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 21:04:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54FJk5Tx016764;
	Thu, 15 May 2025 21:04:10 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17010001.outbound.protection.outlook.com [40.93.6.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46mc35bbqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 21:04:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bAJCZUMDc8HrHIs0Yq/icrqCd1zZGz37YI42PnaPp7ezLrBswtGkWeP/NvE3Ww2dyiyIs8pgdK5Zm0cSEMw+Wo9QdxLfU11v/0NEYuoOlIY75onw/jqLT4d2B2eXloqP+ATLbzUIBsDiT/qXKT4FeUasZuZK85K56DfKk1q5txNzOkFnqPAi7neZDirac3vRb8Fva0lPbh8NBxAfufJqnyHSydheuJ5k31XdO+9lIj/w1CzBRMDY2izpAoRnDcwm2tT653Nh7rGx7HJegGORytXTF0THFF6ljXkwshboLzAzsLChGWl/OhVyjFkjHkm04oUrdiFi2ujn6zvXWivOBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtSr68FGzjUypJ8ImlJPYHnpl1+T2LOZ9GQuheOMQ+8=;
 b=rycf7BV7caHjwOIyin8+Ttm8rPDhSWAwANmLd6dkk1JyMlUkxjq56VsHxo3T2aFljOaPF02gSIw8NTkTrwLxW/FkimESIRKrjLqL0N1A9ikdPiQi41W83OwRfSnz3SpQ6KL/Tg9KH5966R8popUY36NB5h/kiIIptjJ4zFbS5zbACBy2J7qNOTNUw+uavlm5fIMKKd1ZF9KWjhHVLBNNP7fnH0L3eJ1N6EdVWpTQ1fQOv+z756jVaRKejWPHgVF8HFxWsoQxB6RflRV4CxDt+o5wGqXPigDcNNiR1h5/52X8BaAyWRuY1n4Yb0TJRuNLDRramclanOVD0y8MalF+uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtSr68FGzjUypJ8ImlJPYHnpl1+T2LOZ9GQuheOMQ+8=;
 b=rHiSgrA0eyAm9O+dTOfp/edpHrVLGWmXCKyCRnlgel6rQDAr2PvpnvoLr/7m0NcWipwqdk1iCFvL7TRpjioqQ3OFplgIyP6CQR75lnurG8QBJtRtkzIX7HUUP04t8OVheqpSiNDGnVTgqnDUZXAhuvLgKx1cF0GF1v3sxWZKdio=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA6PR10MB8085.namprd10.prod.outlook.com (2603:10b6:806:43e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Thu, 15 May
 2025 21:04:07 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Thu, 15 May 2025
 21:04:07 +0000
Date: Thu, 15 May 2025 22:04:05 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Zi Yan <ziy@nvidia.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>,
        Usama Arif <usamaarif642@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
        laoar.shao@gmail.com, baolin.wang@linux.alibaba.com, npache@redhat.com,
        ryan.roberts@arm.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
Message-ID: <b29f98c7-ad5e-4993-b98b-2b3e62c952e1@lucifer.local>
References: <20250515133519.2779639-2-usamaarif642@gmail.com>
 <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
 <2d30bcce-6f80-468f-945d-b63eff726db5@redhat.com>
 <kuxzxh4r6fapb5tjbhvm7fsw7p2g6vlasdv46j2ggedmbbsec2@zgt445q4oob2>
 <360bac52-2cda-41fd-a674-89b113fef918@redhat.com>
 <7a255984-7c9b-46f1-b73b-f85b5b571a92@lucifer.local>
 <c3c264fa-b74c-42ba-a3ad-615715c8fa80@redhat.com>
 <yec4eqg73qejlnmtckwjiexelswcxf3l5ctoaphq6ugyp3tu3e@vmex647zbp52>
 <3635aacd-04e6-4873-961c-0b1fc09d2353@lucifer.local>
 <EF16AFD9-DDBB-4FB0-BF70-B7282159EDB1@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <EF16AFD9-DDBB-4FB0-BF70-B7282159EDB1@nvidia.com>
X-ClientProxiedBy: LO6P265CA0023.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA6PR10MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f08b457-5e16-44eb-910b-08dd93f40856
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/5Hm1UMwgICJk8Ev0PWQAehpRALCosvfq896QOzfYzSWBOT/e7flHM0vvGKW?=
 =?us-ascii?Q?xEWuR5WWulK/vQ5OYgJ4rXwPHlXpxs6CNF71LKAHU+lNOTSYDEjcX6/p649Q?=
 =?us-ascii?Q?K1NlyO7mS+R283y5TlrsNViUAfeF/NThxkqoLwtINSc904K79LM5bqmK9YH9?=
 =?us-ascii?Q?V4GJKJ+SsM574eq2zKsmbZ84SiJXI1THb8QqXzWGI7Z0VOQczDIeqpp88/u+?=
 =?us-ascii?Q?/lxmJsg635IqQ4Hx0Vt5YQe1UVDREDS1txi2mljXAMAmdGdJVyB43j4fjYZR?=
 =?us-ascii?Q?HCaKJMptPeDBXHAJq1JiyBSFTV4VPMmjMMeqzx/qgesWD7tREzazVpy5xq5i?=
 =?us-ascii?Q?e37znadKtk8jJ0HyZtGPEI8cSjzDsWO2qLGxjfld0k6olqKpWthegTDjGG0n?=
 =?us-ascii?Q?oej1fs/wTnuIjezP/rySJhbV0aDlT809cWTMkT5M0tPJis4RFIA1SC8SBdGi?=
 =?us-ascii?Q?mtTR2eeIBk6I/XHeOYEoWnEsRHwh7hKzHdXzAyQ5rvYV82A6jkNAu5zO9eCI?=
 =?us-ascii?Q?BXvLx8SqMuVKchjGGo+HLHlPyd0XmCRWgGeqhOw1g+BqUYxdTH3qiDMcCPNy?=
 =?us-ascii?Q?I6t5bAy5/vPxn0Wu4O+4+gYP3HZc/F1AXQCdCXenQvZCdwgjz7txJeDjJi1f?=
 =?us-ascii?Q?1RVPmU1OlBRHm7u46pMR315FQ/UN3/GefhmmedK5LvjgAnqmxHZiorFzMNv7?=
 =?us-ascii?Q?JriTfH16fb0v1i/g8LfuMxqQ1CkVznRPt9xKhyfR+dpR6ohx1ikvUPqVLqAq?=
 =?us-ascii?Q?OFvkDIf0suCVzyjU+KUmLtRC82bDnFJnD82Kv9WfM9FW3As2UOxyVur+7kHI?=
 =?us-ascii?Q?mxipEEvKdMV3KkYfSF6IwnCZBOBinPvhyzC4veNCzrx4XnIgDiYYjxWjpsRE?=
 =?us-ascii?Q?nh7Wjra9DhrwynvL6sGBHrQ7cAD4BDRcTfOj0xsn261hFD8H5boOYZjeoG34?=
 =?us-ascii?Q?H9bFo7K+q+kamnCM23Oa+vsgz5sqnR8UMU1b6wi6+aGpdcNt6IYWHslitjpE?=
 =?us-ascii?Q?DQIz1yyyhuN0+WsMUWoQ1Selg2sHzJqKO4+mpNUMkzbBEne/HKF/hSuTv5Dd?=
 =?us-ascii?Q?/TY3IfTqmmWFq2Q//giUfIf1WIUT/KySDdzsqJGxiaD0FvBcgbneFY4yVz5j?=
 =?us-ascii?Q?bNoPea+3EacEsa39rwLNwTG4YGPk2lULMZAF31c/mbzbCZlsWYIwPwYf0RlA?=
 =?us-ascii?Q?wuka1G1XUpLa124YNlb8op6JiLdm6NPEWt45Xejn3GcQZTMCWU6C5ENQ3lKu?=
 =?us-ascii?Q?wPf6rK1vDd5uiujS9hSsTfJlo/rMpZZ1cSEJPWk/1qVET/i/4/yvqH/Zmz60?=
 =?us-ascii?Q?roDquiLyBpf5ZlpHPRVx/Qj1P24jnGrHxhCie6bl7Kax0TrZ1j0QwXN6m4e9?=
 =?us-ascii?Q?pHpVm6j+3vwPNLBexmZFhuNGu86Mws0i67SZD7hDlaWCQDHuOlrCK3qKwce+?=
 =?us-ascii?Q?xJZZHdCY5gU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QmisnMjE5FQxTYZ9TWVWB6GO67qsgxitthnNRS7KMRIuBv4X/i72UzE1OuS+?=
 =?us-ascii?Q?EBtVlVQJjOL35FKmRdFHPRuARxW80SK9JoPV/Vea0qfmMy9/A0fjWoQIuQlK?=
 =?us-ascii?Q?v/L9zjDperjS2pQNi7UTCyeBVh9QfVDXpsrIx2xzIACh4EglGCX5FxGN/bEJ?=
 =?us-ascii?Q?8twQpSeSKDP1RkGusZv7lGIPl7TuYz3gpDTdZTOGELGG+ZAntYMiSYYfM5I8?=
 =?us-ascii?Q?ljv0208RuQrWp3DAUiZmmuyHPHHh8BO+MzGWYgV/11bRtpjc08T12yxJgIvq?=
 =?us-ascii?Q?qpWv2owgVPaH6DEqeZKk8/ufY2WlhO1fP/lda6WhCGImDHuKFEEThsR/i3tH?=
 =?us-ascii?Q?2BfVWLqol5+e5RvTlEykaFwJF4Ia+9N/Fw0yEveBdWoKenhT8/08hDINTVdS?=
 =?us-ascii?Q?m2JVYoeRJTHnP2uNF4iKlB9eNdwsuB3ajeUMepEyktJwMedtonAYnQ+zftqq?=
 =?us-ascii?Q?JVcLUHm0oBhnIDe0DIYzARjxLzVq9o4eo42Lp3o39qXCBwme9avnANe+3RC7?=
 =?us-ascii?Q?gMkCjg2I2faS0I6U5w6fK7maKL45UtmUT8d8/JSBq2zolhjZY3x57gQFF/J0?=
 =?us-ascii?Q?wxcU+ls/anlzADyW6URp4gLJODz+AwRaF3HjTWUurBxdiCyLSOQpIAAZpO2X?=
 =?us-ascii?Q?sS5t8/EOBxrTrA4ekgZm373c0LHi1RrNw13ytVgKxG+YqrCoIChvGI7U3e5G?=
 =?us-ascii?Q?gBR2DZA0ENQaeqmoWt1E1haELvdj3J/aiAMR8DPXFbdhzYfsfbrV2DEEM2BD?=
 =?us-ascii?Q?VZCjEcY/bF8Cyhxg0Xh3c5IB+BobWLmlTgn20Q89AgaErsHQTvp3Qve3Egge?=
 =?us-ascii?Q?nOZI1tfnYCLohHChTeUXWZGA8F3tFJ3DYPu3i1wpJqf6vn1t5nfNYLV2N1eG?=
 =?us-ascii?Q?azydcoaDl17DEdVeG6skN95FHqzCnnan1P0r0KsI6F0b0TPVLieAjk7lZD8A?=
 =?us-ascii?Q?XmivqYcAbTcR7suMw0P2cz4J58h5UaiQNdhIoq3LBtDNi6hv9AWFGw1fMoDQ?=
 =?us-ascii?Q?DZF5UK5iTYZ2GySS8EL6QAhlCcXoIPdT02+ya3Dn80pSGOu65gjnVBKVee08?=
 =?us-ascii?Q?1S5KicbycSFep767luqsqj7XwyliOoC9UJqSAGQVuGxnunRnScjKC/fbuNaL?=
 =?us-ascii?Q?BNeG0g5mzepwpvlEp6hcxN9vqCcrYDe/PVk4hCKp+nVHCfO2SPGp8Zlh23s5?=
 =?us-ascii?Q?j+JGYyuiWXzrkJVhNmYcQdHTzmZ0ztYzbjiUISyQqjTscv+Fq6THEM7hjx2v?=
 =?us-ascii?Q?nBzD0Pmj9x6o6Ms8BlSwYy+fFpf9pxDhoDm2nRm8g3bvw1WwYlc2QS6fPUwu?=
 =?us-ascii?Q?gA21+/88QvR8iwu5G11lseusS4xHL9SaMFFieRaDS0rqLwkqept28zxLl0JX?=
 =?us-ascii?Q?PbJKi4JvzRQo3WHrQlocvm3rAIcKsp45ZFY6A7/m3BHg45Qk4EPG15GRTuax?=
 =?us-ascii?Q?FMa7qbuAbewBs6UaLXEKI+K4ICNgUq1XA5TauqSR2ihCUCQPpZCg2BAQQSiC?=
 =?us-ascii?Q?1AG+S3j/wRR3lR/E0lRx188zppdbFVNWawr7bYB+DSGCyMAqY/pIx0GirWV4?=
 =?us-ascii?Q?ikq6fsAMCIPwJRpidO+7CqjE4buTUnJpVcueUOJVkTFg/irzJjcH1DgET3Qb?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7gLFnlh4ktxLPeT25DqdT+tiCz2ezqTL7zzjCQhnRqULPSMiMyImAWqFig03p7jl6DK2cNQYrF04/DK2ahw1kSvB0ULrBXLqF6nYAmWag215j577MrsLPsG0HTaaWzxX+qCh9FDCpg3bki3rbOIaRqmKSZ1vnOlH02MjgwVhYZDnUs98jL1Y+bbkoyiuOpcGrR59ZELvfaNPGAQEGELCcEx/MPvxJ3BA0ABl2szhatPudD0cNHjAEvFxRgzr8OOljg1xtSS8Te2v4NTiK38XUHMz82V86O03D3XbPLXftgj07U//VETqwMI46syxGj3Y1MvotwHV++30kQliraYCoDqwjB4iUyKEXC9mm5Tr9y7JPL3+VHJ5+cC7AlPn+tI3zWIyPME/N4yxtO8zmv91noJtmUrRkeymkzOj1bZvm6rDlDYyZC608caqojmuACLxLaHfPfZcROIZJKmBOpA+iHEPnl4zYZ99PqDVqGidMAwES5a9YQV5nUWTLjn5iFw5mvsAGlQ38rvjEkcnxvB4firJhcCxgbtKj50S/bLRdj8gdidqAJPnMatA+X45oDuJqj0MK5NLWGSNe+hGuS+2vV9jz+4aZU6xn5fRAZtVIxg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f08b457-5e16-44eb-910b-08dd93f40856
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 21:04:07.8568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DqYZXqnFCjKB5Xo/XpIKHo0fyii8wKoRwr0nSe0GdHZRRb6C15zy9lKUJkFIV4ZZQ/OUgoJ/rRl3zIShqycT9Nl+UlBDljOV4FeDGmzub44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8085
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_09,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 spamscore=0
 malwarescore=0 phishscore=0 suspectscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505150206
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDIwNiBTYWx0ZWRfX+0IE60sKc9G/ JBaUoGD0TIw7SQA4jWjlsTjbTvjnbGCKWoZ/QUqDcJGuqjoaQfmfP2AsWvqmyEprlTORyq9D4eN 9dEy7UAKZGgc1HpPgb6u7j8NsAALnHaH0WwxTz4d+Fd39B856qazwQZ6mZns2/qFuZx3IJEhr/9
 5Gr3qGS/vMll1D07WKMYe4ti0M3teI6J7OMgH80g/lqGGe+8I5aanS3UXdrV44NBt1ageLPV6vR W9NlF8fx+rWRJqksTcd379vwzA4xb+lzLZUt1ume1R0Ph8UlnsEWfJQAMcCHmckReOiLQ6i96I5 hG/d0JRDpfkgOjCEBezgkgsOhprRChsXA57EMgHdxAK1vyfRfwBSBMQKL4teO4ZdasaTZ84FXKG
 +p/jAtRDVUT49LcIL7bhCHyGjRemohXOqtEIVkGVO2YuhbKHao980nO6sJJilyjIk5MnZs3k
X-Authority-Analysis: v=2.4 cv=Y+b4sgeN c=1 sm=1 tr=0 ts=682656cb b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8 a=vuf-WGh2GqnUp6MNLDIA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13186
X-Proofpoint-GUID: Xfh-6c0hEQkmFZaCUvqHhh0X48PMEABu
X-Proofpoint-ORIG-GUID: Xfh-6c0hEQkmFZaCUvqHhh0X48PMEABu

On Thu, May 15, 2025 at 02:42:02PM -0400, Zi Yan wrote:
> On 15 May 2025, at 14:21, Lorenzo Stoakes wrote:
>
> > On Thu, May 15, 2025 at 02:09:56PM -0400, Liam R. Howlett wrote:
> >> * David Hildenbrand <david@redhat.com> [250515 13:30]:
> >>>>>
> >>>>
> >>>> Did we document all this? :)
> >>>>
> >>>> It'd be good to be super explicit about these sorts of 'dependency chains'.
> >>>>
> >>>
> >>> Documentation/admin-guide/mm/transhuge.rst has under "Global THP controls"
> >>> quite some stuff about all that, yes.
> >>>
> >>> The whole document needs an overhaul, to clarify on the whole terminology,
> >>> make it consistent, and better explain how the pagecache behaves etc. On my
> >>> todo list, but I'm afraid it will be a bit of work to get it right / please
> >>> most people.
> >>
> >> Yes, the whole thing is making me grumpy (more than my default state).
> >> The more I think about it, the more I don't like the prctl approach
> >> either...
> >
> > prctl() feels like it's literally never, ever the right choice.
> >
> > It feels like we shove all the dark stuff we want to put under the rug
> > there.
> >
> > Reading the man page is genuinely frightening. there's stuff about VMAs _I
> > wasn't aware of_.
> >
> > It's also never really the _right time_ to do it - it's not process
> > inception is it? It's when the process has started, now you suddenly fiddle
> > with it.
> >
> > Then relying on mm flags being propagated over fork/exec is just, it's a
> > hack really.
> >
> >>
> >> I more than dislike flags2... I hate it.
> >
> > Yeah, to be clear - I will NACK any series that tries to add flags2 unless
> > a VERY VERY good justification is given. It's horrid. And frankly this
> > feature doesn't warrant something as horrible.
> >
> > But making mm->flags 64-bit on 32-bit kernels (which are in effect
> > deprecated in my view) would fix this.
> >
> >>
> >> but no prctl, no cgroups, no bpf.. what is left?  A new policy groups
> >> thing?  No, not that either, please.
>
> BPF might be OK, as long as we provide right functions for BPF to manipulate
> system, process, MM, VMA level knobs. My only objection to Yafang's patch[1] is
> that the patch adds a VMA parameter to the global hugepage checking functions.

Yeah, that was a good point to raise :)

>
> My take on BPF approach is that it does not add new APIs, so we can change it
> at any time, assuming people is willing to accept that the functions instrumented
> by BPF can go away at any time and the corresponding BPF programs will not work
> forever. It allows us to explore various huge page policies without the burden
> of maintaining APIs. Eventually, huge page policies become transparent after
> we learn enough.

Yeah I am quite worried about the consequences of infiltrating BPF that far into
this to be honest, and we do want to get to a future where THP is something
people don't think about but an automated thing and this feels like we might end
up putting ourselves in a position where we make that impossible?

It's interesting but I think needs really careful analysis rather than 'bpf all
the things'...

But we do have these awkward 'not really sure how to do this' scenarios that
fall between the gaps like the one here.

And I guess prctl() ends up being the catch-all because it saves us having to
create a new system call, etc.

>
> [1] https://lore.kernel.org/linux-mm/20250429024139.34365-1-laoar.shao@gmail.com/
>
>
>
> --
> Best Regards,
> Yan, Zi
