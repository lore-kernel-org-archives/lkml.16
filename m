Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E56C1EBA02
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738345667; cv=fail; b=IzDTSl1z2aW6Z68PPowv9HHDJdMv9lSv9sFTo7iQQeowJTloZX6mqf3jmy1YCGE9qGj5Fg4UCh4bqZPifRrsmQ+i6pIhjYDM1CUWMtzqwQE1ZxpWUabOcb7K3Kea5PzK6p+7WR0fD12e4qmxS2rea3VraQnY9QfIsXL+BZMFqc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738345667; c=relaxed/simple;
	bh=YQ7KxkE1afEZCUFj7LhSdBuezWdDecZeMc4nOMXYVG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aPqoYm++vm2IuHSnxZsmIiR+0/dlR9mhVkyU9GNYgQMlVxCLmrXH34kEHAUoLxHow2w0ARcQBctUGYZWhC6UQAcaSS2lAaKeH52ebssXts23es9bdokTAUADOOi3Hi4aJfEZTBMTBIjYwjT2KqL+9ODXbpMumjwKClVKRhA7+PE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=js0mY7nB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GpzjCv98; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="js0mY7nB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GpzjCv98"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VHBmaO022165;
	Fri, 31 Jan 2025 17:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=QY1AaRUWsEUdCXIoPp
	ndBRD6bkmJRPNcOcozCY6/Tl8=; b=js0mY7nBshNN8Fe+fkOGL0L/edhFySst1l
	7hkGxVgpXJ04s+ZsyPp369VgT2ZwangROp+c2ROxWLSTMiKyL/1qonTcuL/pDX8C
	0OqwtqDVFe3bVsKYtcrb36Bd/wNbEWskfl4122E+9xGXLheqETzE/obdAFyWKn0E
	NeBRKKOAGCO0d4lFYWth8VdK9hGVXz14O241H8J37i/GM8R1yQ6FEwr9k6sUflm1
	ChgFlIUwwAxybEko6rw1U+oLiMo9Ae3DJqL2RJz/hP1TyydO1YPaNz4V7NzfmWAW
	fBaAvje7QLvkz1u1HpEyKRwhn+hJ3kpXfASETVtLZZMM1PbZZdcg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44h15t8atm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 17:47:30 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50VGnwxw004260;
	Fri, 31 Jan 2025 17:47:29 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44gfe57u17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 17:47:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+yDPjwWXxf55PH0jYGcccDU3L8pJnc2ACjgbs+gDoF/+wEgBghP8QIiojvzczwoMtarOS9cIA/39/eBMHpX1VbEvTGLzglaOumSTg4NHjOsLEXlbkLlk5waa3TYmil6dhTveUj/6BihykNMJmFg3Op8U0ocMns92o69lIz6QqXjFITQB339ZIrq68i35dWEf+ZU+11PyNXjuSQG/RHSribqvr6EkEFIseevDsZGy6JGlxNrVtYgdtXG8Poz+upS5B/K/30+Iwq0RcKUgptVEhdcJjYOC1fXDgv1TmyWUfAZdRS1ObiKO7aM/4qLvG2txwWAWwmlERaoPfau7I6qMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QY1AaRUWsEUdCXIoPpndBRD6bkmJRPNcOcozCY6/Tl8=;
 b=ncxvwjAVQhLqVOfIm5CjNZxSd3ROC8lvIbb5n6QCi5T9dux5oPF2+sEeiFqStUTnnjx3IrdAXityTzNKI6LTIU7o3Caoqnw7zRsvh1CY/uplNvF7CIojLnSGcWLesohRI6k2gGDFIGe2h1Kd5NkbBwRvgH4xTniOUPEBtG2NjZ/YKUcykyMyXtEURIBkRE3x4Su1tLLiil6HE78Ruaq5ruQ191FpdaDLM+4C7VlG1N3ZN7aFf2XvPIi88/qOhZYRHa4KzyVGV1PbuzSy71CRD7WPLLb5teM6ZtivnSiwnIMfRkTvhYvu/79V4rd4+LOXHhY3SgfubwrnH2SLoQZeOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QY1AaRUWsEUdCXIoPpndBRD6bkmJRPNcOcozCY6/Tl8=;
 b=GpzjCv98nXUixZfNVIcIjbBE1bHrX41cb6Jwe3iDewUy85dc47TUfKtxD3aUyTT/q1umIdNJPoTV9iJYLFzp0ZJY6Qv2fe+l3K86wcG6Fk2n9nZZOPhOYHqX4jrb4eEQMAfnygGXd6B1synZawLluCKc6Hz2ReNYRQYDaA0yXuk=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by PH7PR10MB7694.namprd10.prod.outlook.com (2603:10b6:510:2e5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Fri, 31 Jan
 2025 17:47:27 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 17:47:27 +0000
Date: Fri, 31 Jan 2025 12:47:24 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        SeongJae Park <sj@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 4/4] mm/madvise: remove redundant mmap_lock
 operations from process_madvise()
Message-ID: <7k2gs6xmx2q7la6kle5xpn2p2f6bccbiv5lrdowp5hnecxpijx@rzwxdhcl6mc2>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	SeongJae Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250117013058.1843-1-sj@kernel.org>
 <20250117013058.1843-5-sj@kernel.org>
 <aeeac6f3-f828-4bee-966f-c8df41df30bc@lucifer.local>
 <20250131173132.uqjwrzj7e5vx2sbv@offworld>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131173132.uqjwrzj7e5vx2sbv@offworld>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::19) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|PH7PR10MB7694:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a78f176-be9f-4b2f-7e23-08dd421f53e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kqiZysQvbwwdwPmdqCr1yNOzNnHJwfc8u6WnbU3hHMfzGyy3U/wCYEG9p/gh?=
 =?us-ascii?Q?ewiqXWTCem5vMsERrjziCgejbUc+N2mVHs8GHD0FF1BJotrBl27B1EFNwqIF?=
 =?us-ascii?Q?KWoPmdEIwsvbBMaid5r6RurrY+wNcEa66cQuN6vH3Yx0WdOV6O7hFOXJpfIK?=
 =?us-ascii?Q?fJGC1KVqPffLiEGaeeLZbA3desb1AQxpfa1uejY/LVQlrXbMGnmgkiNjmrHf?=
 =?us-ascii?Q?qRin0AGmTz+CDrls5LiLuKI9Zp5/NmuutPFcpbMG2y9oQp+G6M0gmG5xHFnN?=
 =?us-ascii?Q?rhnzSBTwUNRjwclC630O2la0qvgxpvTT30WNhY6ph3/0zm5bfOjBodq+TyZS?=
 =?us-ascii?Q?FhMfx1hiHMnrjcdF1tP0D7RNR2Jc1Ap1Nctfx19I8oFxM6n9f2Qb70Rd03d+?=
 =?us-ascii?Q?i80y/v6WjQ+EW5PJ9UnHe8M4BrJRkqEpF/gPcVl1NIFnRdulqkIktpeWYrZF?=
 =?us-ascii?Q?H6v47+E/heD/8NOOujHPdBapZhP7xLX0dyeArvazn76pSiWpmz9/ld7ZhiJg?=
 =?us-ascii?Q?+BhZFbj4GQ3HauwqZhbqfBMaia5+q/WpNJ0y0gMIX6j88ClxTLcju8h7zY6U?=
 =?us-ascii?Q?pWH3VFWWiQb3aBJ9Q7DewmNqVJjQ/GMHNFDaFTFpflwOXO6ZWG7IoevYB/x/?=
 =?us-ascii?Q?BXElwMyYoetTySWYZg2V937Y0f7DoN5xO89eGVeC5/Sk+mA6dCZ0+TCzjQLQ?=
 =?us-ascii?Q?8O+BjC33MZcAbGcL+lA2n/o3thxrC35P1EOdRGds41HyBh1yMRc/ofSzHNL2?=
 =?us-ascii?Q?Zllm3Ob0J1MViYTh5ijt5XBdDlBgrcMK90zM6dFnmyNZ/fFEb84Ak7746QJf?=
 =?us-ascii?Q?PXZtGXKtCZ3+GQj6CyapzRU7M0QOo+pMpLi01S6lW2Ccxj+WTjLAF+BqY7YT?=
 =?us-ascii?Q?k2vBQeUbMsOhEPjcIoAtP2RDYVKEjNnr1bItC8L+n48Ba8X/fAFDGqQf64TM?=
 =?us-ascii?Q?orlgyvv7mn/Lr6oPLNEGF5aQSg4bsI3Eie+ulfdOSe84tkQo0C7SK2BBSED9?=
 =?us-ascii?Q?0M7IGxc7Cgu71EXj0sIbxcEEnI7nk8njGO+lBHAirZpE/0l9pZNUJ1ejZziI?=
 =?us-ascii?Q?M6YZtQiagythoKkUC1YysljpQSrRGB9fd0CzBSz5pciFBL0Q02AhbfwucBNu?=
 =?us-ascii?Q?irhGjWR2LvttZiwUYk+XrWN1E62NFIx2hF0jLZCeJoMGCe8As1yruVZgqcbG?=
 =?us-ascii?Q?5klL9qoNjLuZ0Swdzzmw/b7a2f1t69LApH/BTdk+SetWuZ52f+GRoLg32mj5?=
 =?us-ascii?Q?RoPFcXPNsgJ7Tprv2Z6nw4LwZb1KTnLww62TDY6m84v69GpPXy5ZQ8TdYcQr?=
 =?us-ascii?Q?6Me+ME7joEXnPUUjFiZNXb59KtRo2aY6BYT0xU3431gmaTdEsuw9cJbu3LZd?=
 =?us-ascii?Q?a8FsAcOKEAc1oxAZidbDBv36EZAq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/nT7rTsXK76AzgEGDAiR6IaZH/R5Upe18gRqvv/zipwrX84bhlrKsp0UCvig?=
 =?us-ascii?Q?8v0B/Y8QeFuYxsAfvEuuMPxBbuMBuS6uYQobZiKh9jXXJXFRCWgKfVwy52f/?=
 =?us-ascii?Q?JuWVHKgIedok8xTVue7SAOI/kjXtWAzJldKrxYTSa59kwI5cVc4A+k13mxee?=
 =?us-ascii?Q?+rV3q2gQJhRSqamsF8IkMA98Lepd4uXJk0I7liJRse5EIjgCNrZ5Zhg0qpwF?=
 =?us-ascii?Q?ZHNkzP5+2xilnpoMvenr/q/jkbmCGCT+C56PkKQcQq5BJOT8/o6BpezKDsvK?=
 =?us-ascii?Q?98t63mtdzChKqSR97mcs/Cx6cYMPug0nKWCgWNZPNcOPkOBNloPUZZBccC7U?=
 =?us-ascii?Q?D8LPPPOQJzYCybqc4KA3oVaqt2y/3B9W6iasZVgeVMhXfnK0buJzlAD8ihOY?=
 =?us-ascii?Q?2vRnPdqAIn/dcbaANrV5FARlSNEE/PjSG0PzL4cOROIw6/S18UKRbJVYN/Aw?=
 =?us-ascii?Q?lwILhJ2xoWpsNjAcmNo5XnhhBRjS11lsfOdrYygwCP/bt+A4rGJui6ZSpOOY?=
 =?us-ascii?Q?02bIHjoHm0WRshhBB8AQ8061AWwL45+WJnmQe95zKEVoOeoyrA30RDgmK5A3?=
 =?us-ascii?Q?LSHBvqLQtxgP+LzXrUmZxftl2NT9ZspiTFsLHcoXXjGiVU5J3e6VxZBRnxVK?=
 =?us-ascii?Q?lRQWrOwAvN4tCQo92LcOdCJAQVqUTPtxPDXrKZtjmHZkggXK7DgoDjS2lfhK?=
 =?us-ascii?Q?PXk+7ulg8J4zx5GwcMBjnR4IYwzDfqoi6i7yo6BGkHz+4Zb8tpdmGBYbmUAa?=
 =?us-ascii?Q?yof+aFQLPgZfxxJdEzxoADaNDrp3yx+rQsxba3zAsXzXAEUyXIcGX+L74FNQ?=
 =?us-ascii?Q?CqbOIAo5U4hPkGSAhx+4ciINlQ8zhmq6QoXuRlBtHwCTCOPYAOBN3MOy9+GA?=
 =?us-ascii?Q?VaZVyszF3rihQTVHHIA+FE5S+dSeYIXHmtLl5pC3rUVsMwmwx14JyAvmKhv7?=
 =?us-ascii?Q?OY/R8TA0ucfpe1vfH7cksIviXViKcTHy3I3wIyKvL3affDFmoaj/vLWoKVqV?=
 =?us-ascii?Q?RDPZYf0jP4sdLvHy5U+0B76a1SkD6a8DCrWzXcOm41S50mX63WWxcIHQxUqQ?=
 =?us-ascii?Q?c7yggf4BJPd+J+W3xOJ3kzVHtacGw3WavYTYWop9QvXKxBTGXzWlomdea/OJ?=
 =?us-ascii?Q?US/bP40L1aLRBF31QgxAyAJpgi+31PFfH4kPWv4yT4ErBjL+L3ynWutsS5VL?=
 =?us-ascii?Q?+GVOumirn1G7R3U7sKxyppksvEgIqOORIkmTMaUbMef66D8U6yBPSIObnu95?=
 =?us-ascii?Q?NArLs8sKd1vs9vSbnq1PB7CfL3M8+txxRgy3OwOIIzTBrOqnZVmEk5oriLJ1?=
 =?us-ascii?Q?jL69e88JkLGKStDAl7453PwAhCF4+vlnYBgzjtgtbTnFuuQ7G/oCkU+j4Hkz?=
 =?us-ascii?Q?H6GnRVbwvQ/0uQmli1L4cfR+mrgtPZWyfADyvUK1I9coGItwPB7LgtVRBhme?=
 =?us-ascii?Q?q/1LFx5NUTNmtY2zQkNrGiAedFbFpuP6Qx4RaPQOkwRAK9d3OXDC7lCA/iOU?=
 =?us-ascii?Q?JtUiQG7wxno6cag5F3Cwed4nEkTIPdlJYzE6F4CfjyFAX8O1rTTJOdWuOJBS?=
 =?us-ascii?Q?ChSwZ7DnFnn8ok3G080Y6Fl655ie2S/OukuxB9F1?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tm50Wx403Kv++PthJYHrz4hUyOL84EHmyS4vihTLm1tYKMRHdTMacmb/iv0m5EagoQzIc9oobOExaOHiuhd8UOHbA5EyCXVXnxlhDkFjWrfzaCjaB6Kwv8Dp9OIagNJZh5Wx4fg7t02zXaTEe1wR1FY9lFEU1XH25O78FLVEuOwCzKTB+n9czeIFCuRGV968+1fLIZ3LwB5jonnX6GkJNF0o/MEfwnhavXrb8JK7DdHLotVrmojRc2T7H+E7AUhX5XYxqvQ5fw5M0IR60hGSsV3ybwwIgUxPe89HmTZ6v8Rmb2f02Q6tyt7cr0W/ob7kznsVtNOlUVm26WD62fIWkacN5IS9MUgalJ+6brpSSD7CAV9fm/9A/WHlfbrzFtycmURVSsoHIb6nmTDNM356j4n+NRguxw/0daFQN0ZRUDkV85V3HMURwHM2iQuKBKxyIeCkADsig/eYRO5zarVwS0AIE1DzU0BPYq7m/8rxGB3QlVjOhnNtFQay+WEeT1AQdiNXEXZEDkgelp8fsAYQYdrerWakMSrBTmBZMStiozdUo5pBKaHik6FmIiO8xqhCD8Orqt1UvqmY1BsXUkKvy+1Q2qPRFJVMVemNKHlxVdI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a78f176-be9f-4b2f-7e23-08dd421f53e8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 17:47:27.7457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FbrT0XBmJPEv8NhMVw3GxMw9NgJ5N2rNvbqMTOd9kpVgHFTlS+di7uZzchYzDhQT3qVc0p2OzhUZVLbqf/xWYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7694
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501310135
X-Proofpoint-GUID: jtT3rOLJAH97lylBMH6N32ibkIWdGV0c
X-Proofpoint-ORIG-GUID: jtT3rOLJAH97lylBMH6N32ibkIWdGV0c

* Davidlohr Bueso <dave@stgolabs.net> [250131 12:31]:
> On Fri, 31 Jan 2025, Lorenzo Stoakes wrote:
> 
> > On Thu, Jan 16, 2025 at 05:30:58PM -0800, SeongJae Park wrote:
> > > Optimize redundant mmap lock operations from process_madvise() by
> > > directly doing the mmap locking first, and then the remaining works for
> > > all ranges in the loop.
> > > 
> > > Signed-off-by: SeongJae Park <sj@kernel.org>
> > 
> > I wonder if this might increase lock contention because now all of the
> > vector operations will hold the relevant mm lock without releasing after
> > each operation?
> 
> That was exactly my concern. While afaict the numbers presented in v1
> are quite nice, this is ultimately a micro-benchmark, where no other
> unrelated threads are impacted by these new hold times.

Indeed, I was also concerned about this scenario.

But this method does have the added advantage of keeping the vma space
in the same state as it was expected during the initial call - although
the race does still exist on looking vs acting on the data.  This would
just remove the intermediate changes.

> 
> > Probably it's ok given limited size of iov, but maybe in future we'd want
> > to set a limit on the ranges before we drop/reacquire lock?
> 
> imo, this should best be done in the same patch/series. Maybe extend
> the benchmark to use IOV_MAX and find a sweet spot?

Are you worried this is over-engineering for a problem that may never be
an issue, or is there a particular usecase you have in mind?

It is probably worth investigating, and maybe a potential usecase would
help with the targeted sweet spot?

Thanks,
Liam

