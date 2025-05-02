Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E66F255F45
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195908; cv=fail; b=rvZis1tuqn48DSoAbMkrh+BzHAABX1zP1ZzFBKbef7VzFBuM5r+PQtDEj3GxB4GHWAMztuPCiZSNvZJeAKry+2qYxmmBFVo6siihMlcTCXwjvRRcvDbRDgjYuBX5YN6IN+DSTxkPCT2fg1v3VLNrODnJ2KDd2cCYoXDkcIo7wOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195908; c=relaxed/simple;
	bh=00s+Ob7gDUUY88JYLc4W2SNOE8Ttu3dUSz5ifnGLPso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=trppzSjZGETBYhQGMy8bLPubrGl32VORqOX/YrWnpkFifyr3hQNN6I60PHUD5iTPKeBFcJJCZSRsjzcPZqa+PiaCOo2yDWupotDBTSiji2RtVx7HOWI6fIZU+feQUcDp4Itz2NXysbx6CBAPjiTlPqHP0Poo/F1i7A09TMzrnx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=V0UZStb8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gYwvK2QA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="V0UZStb8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gYwvK2QA"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5425WkmT032712;
	Fri, 2 May 2025 14:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=KAHemEVwsAjAVaQYti
	jA1wol29V/kSPenShV2aeqX9w=; b=V0UZStb8hGXUgCc8CSXzUjAtIo/vA5e+0W
	5wvVUBgrTWCKCmpWt69It6DBoAYHJwKAwdfYT5gZA8oGKpG8WQm/48yDpL2LVBNJ
	j/P1UTvmvMyJyL+NY/Dq7rXKkujWCrnrkJqbaZjRq9ppAksPVvKo7ZcZj+7pAH3y
	uQQC8YthiscTNkDiEI2KT3cQ/33wuhXjEqhpgF8qtSsrnYl8E6K/asKOAmQvt8+y
	q3D+LoeZbuPobvf48LbXJ5YHySlmNU2RZ7PD9Rq9b4UTFPKX5x5vErsby3LZXOBe
	YSLv9IA1IU9SoiMGMsi3a/tfstiJyoX4DoG9ekpxWOtLpdXBs+BA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6ucnf5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 May 2025 14:24:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 542DslFJ035359;
	Fri, 2 May 2025 14:24:54 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazlp17011031.outbound.protection.outlook.com [40.93.13.31])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxdm0fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 May 2025 14:24:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVoxptA32WV/oKoD0Qa5xEZZ4cO/1x6a6f5kMoUm+GwK09L4hiYlILOjbyyTDh99aXbpOg8WalRGeVRxssl68lYAi9D2kYdVBVzbljo9jEhTvRDMmAlJOB9MVqUN4cuB7rZhsYTrqNTVrfMHJ6VxOPrB4SZkCQD93EXMmTpJ4F2sE7pUuaTf+SfVDTOfhkih2Bdpwx9ZmDmS7uKyRkD+3aDeUHdL4M4wKKFlK+pmvnkhGWqhJqDPXCM2oKEBoHDlFqBoKEEv/5wAV9HIld1Aim9SnJ9TatXRSbikKbqhtpIzVeJ3ZryKW37tvxb7xLrAP/QL/BRJzVtlszL6N7fnXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAHemEVwsAjAVaQYtijA1wol29V/kSPenShV2aeqX9w=;
 b=FPOvchIgeaddzoB34Ju/zeg7mnjoAvodvLbfUwETVxKULljIAo0EQt53Bux4XB1BRQ8hCZYiIzXsuFyNLsfB+kZ/BOAWN9jqnmHzycXqeG3mLjIOw2XpuMI9cS0gKXAMSDkn1Ui2fBRY8H3B35CQCqSos/i6cPV0GqXHt8LhuduY5FeN87PjGxC3EQ5u+skjAiUymgEaR/P+s+V3D6Dj+Kk0/FK363Isw6miPfZI/no0ywjo78wi0/53CqLBsXwePueNbkl1eV0KKCBBKByCKv4wcahSrMZqEajrorLiuZazR9c5B0WqdBFZoYqCSmCThQjgMmkZp/MWxFiS+qW3gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAHemEVwsAjAVaQYtijA1wol29V/kSPenShV2aeqX9w=;
 b=gYwvK2QA49KycynEJdEH25LQAhQouwZKgs0if6Gu4EtUJ6xM3VLyF+Lc5ZlokjUIMvf5K8UyOQVDcqw7U+y6Z0RkwdLLSNGOkhjdgN4UMA1OokkDSWYs77Em6WkooXrsq8Qxhm8RRS2p6DdnlDR8UnhFs0STiXRKR7bzie011d8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM6PR10MB4169.namprd10.prod.outlook.com (2603:10b6:5:21b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Fri, 2 May
 2025 14:24:52 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Fri, 2 May 2025
 14:24:52 +0000
Date: Fri, 2 May 2025 15:24:49 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Ignacio.MorenoGonzalez@kuka.com, Liam.Howlett@oracle.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: mmap: map MAP_STACK to VM_NOHUGEPAGE only if THP is
 enabled
Message-ID: <8d859d39-e0d2-445c-a5a9-7f2bc99ddfb6@lucifer.local>
References: <20250502-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v1-1-113cc634cd51@kuka.com>
 <aBTCtOXBhUK_FLU6@casper.infradead.org>
 <3de8814b-9964-489c-8d13-feb319623b82@lucifer.local>
 <aBTT1JIz17g_2pM7@casper.infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBTT1JIz17g_2pM7@casper.infradead.org>
X-ClientProxiedBy: LO4P265CA0083.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM6PR10MB4169:EE_
X-MS-Office365-Filtering-Correlation-Id: 60266be0-3a45-476c-4846-08dd89851a7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6b62iyUoHxiqFKz5ZzDgqfq/uKaH4HOPBemfTg0iLpG9qdK6MfiMJq7cuYDc?=
 =?us-ascii?Q?3hPfQrIfThpFCA9z/debhsPs5fuNx1Dxunrq11+hF6YUG8eYv7RW4oEzCLHX?=
 =?us-ascii?Q?DFbEBlW2K7ReBwNXsZh1DchtBQwos3CVKJBbItHn+mrmA+/Eoa3DkWECDwA2?=
 =?us-ascii?Q?aPC4uUr/+jaozbq4jzL2WzXDpKRcrOkYDXJ/Pp2o+WXiIUCHoKt8A3nFJthy?=
 =?us-ascii?Q?var80UExS+G+oOYfyPTUTVkIxEASRWIMQZW5cQCW8cgm59VfOG3iQP1+ouUb?=
 =?us-ascii?Q?Njk8j9VPiLkhXrq+tnWdQRVR+evKvtWrLMRxRIrGkXZvia8zabbXoYirAqtW?=
 =?us-ascii?Q?TmclWYWLPOojl0p+kylxgL2hMFZdRWIU4I03BpHApsz0NimRelyr+9hU7t1k?=
 =?us-ascii?Q?3eAc+yHhQiCRwNxeHDGGfrXH5E8XA3/vvb8FijJZkdVmoP9hK+NU26FvxsIB?=
 =?us-ascii?Q?zm14oAp1TFhH5IZlz/OZU5e76utkQppLUkFek8NY/Gsg445+fvki2hoZ/Uth?=
 =?us-ascii?Q?W9vv1fusWAcZA3crhpCGf/Hn2iDM5yRy6AEJGgHyFp3AfnACof6V2zahaTiZ?=
 =?us-ascii?Q?bUMgHKr6Y1SsNAg0TVAt56j3ODgcqhx9LWcFzKDq3dFr7vStqNdEJu5B0zZQ?=
 =?us-ascii?Q?UH2hVjQsjG/fHRaCzjXYVb20S7NEbDAUyErX7twE4dOrb1DXWY1doz9dOWJU?=
 =?us-ascii?Q?L1bafucTKAibvPsT3mtSFg36plAbjW2WEEr19RmqhFFU7gD+Ni4c0FbMPOgi?=
 =?us-ascii?Q?gqbu6+MK7rfXHwz0qgziQkN/otL5t0zBZ1fbMCrCqH2pleUYAYSHWKbgppUf?=
 =?us-ascii?Q?nKWiSw48FR7DigfE7whtZcvVDkA3k0x2jM/+gjvnRsXosLMSeqWwvLI+O0zr?=
 =?us-ascii?Q?2DVVPGk/a3HKQoe32tB80PYjtMq+0ZQQtIRyNaWu3u/SvbG2slL7T5In6LIy?=
 =?us-ascii?Q?gZYUnGL8p98l74FzRZ8yWh9/adkeQaKcuI/fJI39fe2P82v4xvFL6KaEJoLV?=
 =?us-ascii?Q?uKwJvh5MGdE6AxGCe+BV9i95nZpVt/04EhYyORGxU4/gsZydF+FKAcA+vQi+?=
 =?us-ascii?Q?lVFD+RYw8F/NH+znttEstEePcFlI5fN2dIggVbiAJQ+SmjvH55z5yjL8CMgU?=
 =?us-ascii?Q?HKUX/HPeoxZK9sBJTosCEqCVcw/IEIfAKCK1KG3jr22zR/WEVJPKB4o3vHhL?=
 =?us-ascii?Q?1T+ruS++PQcxq830WI5/nnPVw/3LxI8bykHaUdxP1hiemylFLt7aLGc9lrAz?=
 =?us-ascii?Q?c8vP0ty8rbv1IeFKg4IQ8atXyJNu+PZENoJn7SGF6HgxiInXkH3Bnv69qK5/?=
 =?us-ascii?Q?JRGPxRBNXYbEXF0L5dmeRfqdkSXa7EAVZI3V2YTHWhWS1VcYxFkoST+qxq7s?=
 =?us-ascii?Q?Lb3Zdm1LOKjy3Bvf+XMSshCNrS1J9VNTU+i2c6V1CYZ7HC1RumJ6er8En51R?=
 =?us-ascii?Q?wWTP3H4Z6qs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?09hzleEPDpFcSkNKvZCAY6eUU5PfBD4i13jMji/ncfYFCVRMhDUTF/84/qiK?=
 =?us-ascii?Q?Ru01WeuRmpeZXR8pIQci+nopR+NSHWeV5MLSWvLFAtW0Bt7t+0AazxJN9lr4?=
 =?us-ascii?Q?t94bRjPhGIZ18aVIst8wslFK6cUkLc5pwjlMtUip1mg0WW1BDznd8dCinWye?=
 =?us-ascii?Q?nNZyjPiU3/L4NkfjAMtxZFTgal2tNjm7/JqUPnuawzXG3ZGygJz7inufn6xQ?=
 =?us-ascii?Q?3cDVfAhIiN6V5sSb/cQPlL24GMwDKLyp9HqDnO0dZuBJJh4q2h0SUoa4Mcjk?=
 =?us-ascii?Q?iaNqoQCzIHGyd15Yrt7i8XIc+2NfBTm7BAIrtNf12YpWakT8bcmuq9kJEkgK?=
 =?us-ascii?Q?42ihUxnY6uGy+/abF4/2WmDvi2i35NnNzKJ08utfJdybRDx1Knj5rXLXs72c?=
 =?us-ascii?Q?1BkUgWXww/IJes46VOGPiAPSsRCtY2CP3hbZy/fa1Cvya1U46vf3Hcliy+96?=
 =?us-ascii?Q?Gd97NaxwQMcOi3rDDEhVKRKz6GSUxQsRXPDIrrz2oy417GrlPZv8CF+sqrWi?=
 =?us-ascii?Q?AACiZj/MFuSNjRPQQkLUFU6gIkTfnS3rELuf9ral+9vh7qYn3KILx43uu71N?=
 =?us-ascii?Q?/GcDH5WfAYxyocZEDdQPhYS2mKwZC7yu9WDIHsLRZOxbRIPnx2ZrlteWC67v?=
 =?us-ascii?Q?HLyEmiVGBF/Mc/D89cWpaupiC3emhRmacdBmE3lumeALzThI2TXODRA7l0gJ?=
 =?us-ascii?Q?gun2aj1XlTWAVEAEiP2gY7gdrB2fXOGcBlH6q9lC8SLRqhNDIR6if11BT+eW?=
 =?us-ascii?Q?7sG091n7eh96sTVKxhEpjJ80pibZXPC+XIl3mYr+/B1AMeEM8ALU832cD/bq?=
 =?us-ascii?Q?bRtD7N0rJmeGNhK2BJFxBFrUsDDpz2/MAg3YTC6Hbb09OZTaq3lAyTSqNEKb?=
 =?us-ascii?Q?af3vMj3W8T2AmovtpUOxplYYuRwwnSxUJrCjkoVnjldeLlNXi8clMJJcnrLu?=
 =?us-ascii?Q?qjiUUbQCCR/BgqhelBcBkOeD8SebDWY398YlRH+KLKRmKVW3WqIasBpZMixM?=
 =?us-ascii?Q?/TzReDrjvx+TsyHXSzCfs+z9HsV6ZCmjOjcvvAp5dQYeBCV25AyxIvoJy5e/?=
 =?us-ascii?Q?c5jgtamM9tf/pvg01WATrYBusROMEHoPaIV6pzurVXqijSjdXGgDuyjRfsFY?=
 =?us-ascii?Q?gvc/MqxGtHZXM/+8eEPiPYXaTcM0eR83IAwW99phQ95XGwr2OVJgD0RuBRVQ?=
 =?us-ascii?Q?xhQ6aX79SWP2YBvu9al7Jme3Mw4elit9Y+bAsWHZns/vLcGZz9AjVDv8yose?=
 =?us-ascii?Q?uXK8POagpFmURH6D0jjTE8wLeg7b9t2e7EKagNH/6Mhmn0CBttTldRvw7E5B?=
 =?us-ascii?Q?GZHCT1mGJrxsDBZG0mSvOh6DlxHXQFWQKIEvvJjBXeb+26wuCruZGFEG+/Xy?=
 =?us-ascii?Q?yTZpQch5NLQ8Ns5ot5z7hyrzBjF9ph/fOwIFlgXFHd34Iw3ZylyVB5orad+c?=
 =?us-ascii?Q?SyucURappAAWuKmyMpvr96QNRhbRoPCnKRdyjQkx99uFJkwuuId1Xii+u8iU?=
 =?us-ascii?Q?5+tsUm2Oa5RZBTwECENwi+v1h0es/FsuprrUXcTAEtPiJGsMk/LpvlElFZK5?=
 =?us-ascii?Q?wnfpoBxjEgKPn+6e9gziKgAA9I4f2TBxEJO8Y80K+5AtdZ6/F2V4JC1f2Qsc?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XEVKSsyJh9NRel/pSd/sIODmiNSKI/SMKWBOcVRAKmGiIhObXeSgcYKvdN2ukIsnNtAOdPQh6OfHg5LgiPjWTHMaAUPUcME86zVaPlNKxvZihS7lSVxgZax1aN+MsoLQsbg7vX2FyGQtjcRwLHD8cCBKRxM8PiK5IwnhTYF6haCaIRHYSZiYXdqZ9LKIJUhBrqz+HYZ5BlXTY+zzePWzyHk2hmnYX/oPL0si9hYU90UnXBIvi7hay8v0NKUpM9iXpfl4hxkKI3F1Olbpy76LhCp4gYxohFUHWXSC1ny32/J/8hELr227CIA8AgOvFXj/nrZXALVi8/4/UVejdJKUUWR2yTywMyKZF/v+ur1Jtlccy2zzFmXqrp2BKOtxuD65LofnCXGlLCwKUokw15Ywj7SQYFFRg8MALATY3SmRRW/B7YEFaes7NAhok9+S1ZxgUm1uTGXHDwVJhe0GngoCem4uIu7DXhMDMqKNFlWoXppZIRWEIrbe3t0C5ljzrd00Uf/ZPyVB8lWBzCB3JC2BgHCovMb5wwil3g+ldlUrFRNaU5K7nmNHZAx8om32KdKUJ8eta4Uuo/fkwgVOUVntYWiuSiYKR4M1M3YWtTc9ZeA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60266be0-3a45-476c-4846-08dd89851a7f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 14:24:52.6259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sRzZRjO/Oej400VXTeGCawVTTrdXaYQp5mQQ1c/itD+oVWCd5ABu39/qvM15bYZd+vFJR9rSdD2ULul+xehvvPISKMFQBgXNeJZs0E+A1X0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4169
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505020114
X-Authority-Analysis: v=2.4 cv=ZsHtK87G c=1 sm=1 tr=0 ts=6814d5b7 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=TAZUD9gdAAAA:8 a=qVLtMKkeofEKjg3YDI8A:9 a=CjuIK1q_8ugA:10 a=f1lSKsbWiCfrRWj5-Iac:22 cc=ntf awl=host:14638
X-Proofpoint-ORIG-GUID: e1PO3ii6sBF1OEKit3qTImLqE73N2J9f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDExNCBTYWx0ZWRfXzPqYGA5WfiQg yk+kAEvLJeUGduoEq+cao2I2oBtRjW15pd9t8/RNdPSWVsTTvlMDqJy++UxiztjeiZqd9VnVUZ0 aYQ7rv+0LFHqWrz91ho8h/kIpR3CryTVQQKVt3SREo8w3IGkBZhOUnG1VU3YzCNRaJnFA/JEGXn
 RS73+OtdZnF+1d/OZKZ7DZPTPcRrOM8WSLuAxoSMXwAnXS2gTNf7bvkilJUm+vUdLsoisudIUA+ sARHeh1MZj7Ill2c7phKQlLv37Zke+fid7ph24Poa6TmhFyI0x4FDarri5jOBRswsB705fF2J/v ZOuNPNg+maS8LqNwLQsT5m8Q2Iu09sWIXJKeQgz4vjYBWo+81v0Py2oMj/HMwHNoO/BBryVWtd5
 be9m6yLLOEtK2+isdRlmv+6MMw8yTCiy1ikhJOmtyP3hz9nef7Ex+4hYIFRiwJq5hdedIk1D
X-Proofpoint-GUID: e1PO3ii6sBF1OEKit3qTImLqE73N2J9f

On Fri, May 02, 2025 at 03:16:52PM +0100, Matthew Wilcox wrote:
> On Fri, May 02, 2025 at 02:12:16PM +0100, Lorenzo Stoakes wrote:
> > On Fri, May 02, 2025 at 02:03:48PM +0100, Matthew Wilcox wrote:
> > > On Fri, May 02, 2025 at 11:31:41AM +0200, Ignacio Moreno Gonzalez via B4 Relay wrote:
> > > > From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
> > > >
> > > > commit c4608d1bf7c6 ("mm: mmap: map MAP_STACK to VM_NOHUGEPAGE") maps
> > > > the mmap option MAP_STACK to VM_NOHUGEPAGE. This is also done if
> > > > CONFIG_TRANSPARENT_HUGETABLES is not defined. But in that case, the
> > > > VM_NOHUGEPAGE does not make sense. For instance, when calling madvise()
> > > > with MADV_NOHUGEPAGE, an error is always returned.
> > >
> > > Isn't that the real problem though?
> >
> > Hmm, but wouldn't we want users who are trying to set MADV_[NO]HUGEPAGE to
> > be made aware that it isn't going to do anything?
>
> ... I thought the patch was clear.  Only setting NOHUGEPAGE becomes a
> no-op.  Setting HUGEPAGE remains EINVAL.

Sorry I"m an idiot, glossed over the 'if (advice == MADV_NOHUGEPAGE)'
bit...

>
> > And wouldn't changing this be a possibly 'breaking userspace' thing if
> > somebody somewhere relies on this?
>
> I don't see what userspace could rely on it returning EINVAL, since it
> won't on a kernel which has THP enabled.

I mean for the purposes of detecting THP being disabled, but I mean it's
far-fetched.

>
> > Also this will make this inconsistent with e.g. MADV_COLLAPSE also?
>
> Not sure how ...
>

Yup this was based on my misreading...

But I'm still not a fan of us setting the VM_NOHUGEPAGE flag like this when
it's meaningless and this is (probably) the only way you can do it on a
non-THP kernel.

It's user-visible in /proc/$pid/smaps (I mean, that's the whole problem
here right?) and impacts merging (though MAP_STACK you'd think it'd
probably not be a big deal for...)

Or ifdef the VM_[NO]HUGEPAGE on CONFIG_TRANSPARENT_HUGEPAGE?

So maybe, let's do both things?
