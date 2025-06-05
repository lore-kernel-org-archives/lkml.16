Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4BA1A275
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 14:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749133276; cv=fail; b=KzrM8rgRmWNAznPlj+pxR9tu4Y0/K+kTDwIHRkR6ss3ARKVJYRJHzkoEvil7RpqD7Jdxn3La7K4DriWjjLNm1OPBqT0iIfNFa4zHfv/yX+0XCys6jcCusEeDYsSs0q2fFHh8aBjJnzb0PGjt02NFtQGTTv0RaEANW5Rx9k8CQrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749133276; c=relaxed/simple;
	bh=+Ud+25wFocE9ul1/rgWcT/+ao8NfkcgGeFPfXBY/SS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FnxljHojpW62Fg1X18E/1aSzdlAtuEVH0MwF6MpilO55zAiWO9tu7UTToAsg9/ifn34uDzM+v2Sthsh5OcyLp4bmCwXKpC2tk1S/heUcdqYvtAm/ag4vUti8nNl58dlrO+QvMFrX7klmq7DH5lYKlRLoIn65edc7FcnKCMzfkAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ecK5Jq/j; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ftaX4sdc; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ecK5Jq/j";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ftaX4sdc"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555AuMeP028033;
	Thu, 5 Jun 2025 14:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=KDK17E8lajsOJNmbTu
	0qE7byRUdyZ+K30ueEaph10yU=; b=ecK5Jq/jY5MyCf+GNHCpvyG9SphXWJmSqh
	QM+9SV1/DMrBKhIgzwYa+UCy/3LbKAGHZuMqDyzmfYScupWct9ga8QydF5auHf80
	Z5IpsE2VZYRV3yLfw3I7YzTmqIlXbClVd5c6KIVk1jxO5bQE0u/TWpvxf9HF6XgO
	YSWiPh7iQXrVW5AWdcX27hLQ05KOyihfrxYCZIsOleRsI7aQsLYPoZYiZ2sjr9dn
	vcn02sSn5ptCH2FrYufWjBt3aT855jM8jzt3kFi9956hRPue3m8bAqqKWcVAGSrd
	qX/I/Bg9eayC0iJnc2ehwO9AiK/7TUMMDah0CKtXBR0MdOVnDMUw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8ke98r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 05 Jun 2025 14:20:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 555DLShG034498;
	Thu, 5 Jun 2025 14:20:51 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010025.outbound.protection.outlook.com [52.101.85.25])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7c4q49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 05 Jun 2025 14:20:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UM7WGzRZKCNEhJPdBn3lgJgrkjNzmMfDf04F+vX0d8dsuI6NsmcK4L30q67igb951phqX0tVYwDr0xgIThr0bFWy6w84n8tj30fHFF0CjTQdV8TXjTb7DcXeIrHP6PJTELE+NcCxggvsmYYIZu2lvFKTqOJ2X90YCovZeBtpyawNhsiQ2pX5co8koN7LsoCQajxWGr9YZmhtqcRSrra5jpwhteDzehZ9gmUqvh2N2QDePPXcp+BhL3mH5y8kwqRP7L37F+nOPCZ0CwDRZke93CxbpimPYJ7IH2RhbALoj5M4O6DYXofjAG3EWtid6OUkOy+OFi7GHfSqUAbYndQvGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDK17E8lajsOJNmbTu0qE7byRUdyZ+K30ueEaph10yU=;
 b=Rlz/8h/+TaWjAvnARNM/lu/mYlgpl3H8YvmMUBny3ZEkpEkriyFGtuBqlgHPGy7g1FpPu7JLKFn2s6eBHl4aRSpAnZzVBcf1eWeVcHN0GgQghjJg2zhDnp6YYQhjKL8+xZ2GvHEYwQ2uGOTQYVfeG1KdLSkVfwBFfyXh3GwQ88qwq4/3mPLASNpqk8WJ7imu74fvF8CAe1ScpTXQyu5lZQyE5XyZuwL1U+CkHyapdaHQJSwESSIc+chMWqxN3mp3bhKIgtXE8MWHmjbpYppezOKejM0fOTvoYqShnHktR4nf4bPT29c27np9ogC2SuPNhNJrxSAizMiNdZk4FBd9kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDK17E8lajsOJNmbTu0qE7byRUdyZ+K30ueEaph10yU=;
 b=ftaX4sdcf3czwLyPmHSk9jRS2tL8Nd9I/5pidGkqfOnMoryJi3QNqdxDnRAqWYgRbyRDxNyatURr2GvFKkmujW24S/hVUlSpMO3cuwnW4bqaW3do4gX4tI7BAroQdUrx9BXd5UBKKTxPLKs6JQbENOIfclqIfPWxYrkOnuOA2ZM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH3PR10MB7763.namprd10.prod.outlook.com (2603:10b6:610:1bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 14:20:48 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Thu, 5 Jun 2025
 14:20:48 +0000
Date: Thu, 5 Jun 2025 15:20:40 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Barry Song <21cnbao@gmail.com>, linux-mm@kvack.org,
        akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        Barry Song <v-songbaohua@oppo.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>,
        Lokesh Gidra <lokeshgidra@google.com>, Dev Jain <dev.jain@arm.com>,
        Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH v2] mm: madvise: use walk_page_range_vma() instead of
 walk_page_range()
Message-ID: <0abf8a75-24fb-4bce-8071-6ae654e62451@lucifer.local>
References: <20250605083144.43046-1-21cnbao@gmail.com>
 <452a0296-7cdc-474b-b751-0c6c498e4190@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <452a0296-7cdc-474b-b751-0c6c498e4190@suse.cz>
X-ClientProxiedBy: LO2P265CA0167.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::35) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH3PR10MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: 945c9df1-48ca-48b1-7e13-08dda43c2af1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RKLmcoOjVepOV4XrdqSaVQTTQ+uIXa9DdXnCLa9HBiczDV6BRLamXhUjgy7a?=
 =?us-ascii?Q?IZQkpVy2phGHQJfAbZmQJ4uBlvqGZ/galmkNy+oj2NNuvuVI2Cwf86Bcd74m?=
 =?us-ascii?Q?/+pWwmBjN9kuFIS5xX2u/ErPDKod8Pceys47+p3kNjPxBnkj4Z6HLiN+S97E?=
 =?us-ascii?Q?WDf7zAIFuSzfllcAotYWBHiZTVUuhtAMQYUp6/PbbXJeSnkYSdOctDKSgLmH?=
 =?us-ascii?Q?Ss1bFCURezHmcydfh+HSdMgT7clZXrT2pE+aSFRKRNFw5gfTbXk7e021VE+q?=
 =?us-ascii?Q?EQQz+ZAAzaVmK8mf1FjVNvvBxJK3tGCg7PhAjiqoo+yzJ++q83lFN3KNOxPp?=
 =?us-ascii?Q?hNDglb4TpCEmrswr7zgkE7eJedB0LFkaGMIguK7QF14iGNdTf4DFxKI2Gbkn?=
 =?us-ascii?Q?Unuc5zjUvt0XeNA5gSN5zxKsf+KxCgkmKPihAGg9l2qsTwnSiC5Q423s/UZy?=
 =?us-ascii?Q?SMtLhKDKgcMH35hXqn/xOHiqaZWtQHZm7PYc9uN5akRWw9liBcqn3iEz1YNQ?=
 =?us-ascii?Q?IUYeiOIBa7w+qvONrQl8KXLHUwHzAPAwXnuec/8uyBxMviL0AXuyd4XK9CxO?=
 =?us-ascii?Q?+0B1FFA8Oi+LcOeK3Q2Pig+w7YuaLhNKuUPjBAyGDfodUZhBki5DMLteuRCq?=
 =?us-ascii?Q?HLRKeY8DpaeSm3XolklJP3IXq7jdBg+tjZA+yNdzIaoe9mJ+AXaK0jpO0oml?=
 =?us-ascii?Q?3HHJGjLkYfp3oUThmg8NqoDa1PmiU1jW/Qj7zva8rIg7/OABjpjD9M9MnQMk?=
 =?us-ascii?Q?R6/0E6iBA/BqSFEl7L/u4DTwsJpeSdEDbw/+t/6jflFYgrZi2nV6TAZPKbQm?=
 =?us-ascii?Q?2tvwLcG2XrbBziIB16o4c4t3J6QMPT9YygHkZy3M80EMcEIm5/J9TLGk2303?=
 =?us-ascii?Q?0hCSZ/uCAjwXQgmdGdbVeOUbz7vqQOCwtEzZzxKhcBwRPtUbyBnamakKqpF+?=
 =?us-ascii?Q?SIuq94IaPpVUC2bZJ+u7OkCzne+EURrCbOFuADbSFtTD/QqblEJ9UPtGnKFb?=
 =?us-ascii?Q?YtkCSiTRIUMhdRbKcbBynk77P62RGfwEAvACjmKzhbcZZpgYS+HtUgjC7sa7?=
 =?us-ascii?Q?eDMoJZkYEPe+vrmmbSmFEf4iJ5ApboR+IZkdXfaRhllaBnErTobgnXo+vma0?=
 =?us-ascii?Q?nS/PbDrYE2OPMVH0XzZnuGK8Zf6VUW+OiN753AZq0VYo4y67eoMJrTu2+b00?=
 =?us-ascii?Q?QwhUiWzExTDxC4S+uSw6WhidSClARQftX0XG4w4wuegxq+D2sNMmafJ6j+dR?=
 =?us-ascii?Q?cDMG6JTf0B4zrFv1NTdC7EMpg/bJo1R4Qww7UWShu3DDrfgqwyPUCGte5EjF?=
 =?us-ascii?Q?YSCZ6ekzl10R7C3yncIWNTvl6VYeYpipI4899ndC0Oc5ngYNrYIE7zrt6/mz?=
 =?us-ascii?Q?glSdRMSvGiI40lV6DlSgOX7QaPMGhla+vOzctv4kN8DugWC8JaGDT+Dr+V56?=
 =?us-ascii?Q?xT/PYT7fuGk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5p9xV7zu7m/i4uANuVJ/+yvVOmAc+3ChNcGcTwT3SePd4pylhHgMgZppbdJD?=
 =?us-ascii?Q?aqsa5JWORACeX/ZoB31a/diwytECP8B8XegtrJa1j5UsgrARAcRaM7xGC2if?=
 =?us-ascii?Q?ctHraZURIyebNVGF62DxOG+ePL88Cr2zo0vTANAslO7+9D7quVbxWqsCMaN3?=
 =?us-ascii?Q?WQYTPsPaIzxJegADFvsXgq3avYqwQ8nkYyGk6JKJ7Z9x5UpgeXqFcf/6K/QM?=
 =?us-ascii?Q?a/eBXlB483jdw0XUPULeb2qj/J4RudlaTOnEc2ktSC2Bmfqu3JCIw8XS+WTl?=
 =?us-ascii?Q?mvbRSYY9ThJeTKCnPcLfsgthpw09WXYCdXqBnI3I+nmhfs92u+SGXb+QG3Pw?=
 =?us-ascii?Q?uJtZ9XYXVa9G/tBV2R/FQ6qIdwzK75dYzBQQOeLmj/R+x8Qrs/tDKQb8C52x?=
 =?us-ascii?Q?IUKBoEE0N+CVMOwLXEDJ4dBltINd/uTdKbUrC0pIW0MlsdLEmtwv6JqFfcQp?=
 =?us-ascii?Q?Ygwzw6YJllVPQNLgvkuLUz0idRuMs42BApBglFfmqW7ohAexwrTQ+CACZ+6O?=
 =?us-ascii?Q?Hi+cVX+MZo9jX2XzO4HIibSe4cGJnvLiZtZkJO7+cup+TH2kGPo7orHkSeNN?=
 =?us-ascii?Q?ugo3i5YxRodjHHtBjKa04ew31GVpoibczL4i+EYVzstaQqB9PHKCBOWC+o6M?=
 =?us-ascii?Q?8UDapeOnZM8PVeQtphye31YqmiQMNXPv4N4mRsaXsrEGK5nvDsb1ebIRNWsW?=
 =?us-ascii?Q?G2zcQAiVFYAnFo4Y2arHXPUURH0GM5kuoIw1kgVIynhkmpeEsGZCERccYx14?=
 =?us-ascii?Q?sFQodGyCjLfhb2XZnYlBGZvKArRAOvzqtPOg9ZH9ml6K9+ifmfcTQ4HLLUZI?=
 =?us-ascii?Q?Dv2h945nwbw6V1j+3Toos5XTSsvXjzvOG7LvxbxKswiphihMLJQ9upcbnJxW?=
 =?us-ascii?Q?QfCQ90PGeOTIxCKEWc0ktDoSFfaHd/6rpheTFC29pUcwIZc1JtAJ9ga+NNnK?=
 =?us-ascii?Q?Gpj2AtrhoZAn/6/7O925f05ex4tJbcCKtFPa/6rDgeMe9EaM78OSlqHd3VHI?=
 =?us-ascii?Q?AVZJyLWHiSSyJRmbSuR5FBs+0w69BfdgSMeDzPeNpVhiD6VuqOYRVKcMQVZ6?=
 =?us-ascii?Q?6jv3Lt56AgPA7zTOAP1L1Q/LHmDfZyvCqqL12V6BZ5DNOJ1BhUO0daMEbxqE?=
 =?us-ascii?Q?zN8DXKaBw/N0hgr1CENQhPkd+QE5RAWYy78teJYuIskHUvM5doQiJ+0hn5nW?=
 =?us-ascii?Q?jpvwl25s3GVRG2gY6yVb3SqJnoqh4MroiXiYpME8enyBonto9xlVcLdtf+nu?=
 =?us-ascii?Q?m7S5toP/XiYe93icymiIR46WdyUOEFPO3bhPYThhmn/05gTzb+S6T7Vck2x6?=
 =?us-ascii?Q?/pJGkFlsJ6znDGKnSO4hrY5bYciMHcA3txTl5mEoaCO847gVQDtA4S6WEWbF?=
 =?us-ascii?Q?/beJxEsPamrRlw9RrwNhfT1FoNwNLILHZ9sS4CxALvD0DRoApJTtP4IYmWYI?=
 =?us-ascii?Q?1K3lJlg61rWgh9aHekE/gMQqJv4aI37/I6qwCTLwVPe1emcNvogYOR9xAXZt?=
 =?us-ascii?Q?Dt3bHXZnkChQtGxYLJXEoIHNDHaIVW/AlEXGogj1lSohR7ZqYrPLtnl+tWIx?=
 =?us-ascii?Q?OuplnQ2GZhAOnXRV6Ss6rYHkfYi9JOV2HfbbP7IVjtjhyGwx8EKnm3FjTmxf?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	V+BeYgUZFmKPAXojMvCu9UpYy9McEWbuo660n8cq/pDPuo7zFD8qt5R/H9EVURmGAu6FNEZdv9aJttfHOWRFaRhIVrsQN44BY/4odgkG4cgKFsKUqnvTR3fX0s9ivAtlbrVNKnrqEcamZkUd7FL1NkfqqOL46Vj3uQFQejgRiup/qEo9v3VhGnX+PBO/9lxgK7Twg0YIhSqq65BcDxso3cUQULN4b6SZD88yxXSsRvRAl/ddMuVrQ6yUidgTl9ncn3vdDWL7i5pYKTZKwSQOH3zcyreWv6h6/xGXbnqxnTLFRaWz3ZyMGN/m+nVMnwUCIBa5Ct0eLaEnONcHtsTMmJ1TbwGI7XDY1yUCcGCkLQ2WYLwd1nC84PSE+tE70VgRRQqP1/kzRMGth9BrYiMd1F6HlBB9g+nQOJlBT8Etf2uJdvHUpdAHs7ohhJFwilp9VGN+Z63AcqrNuKuFhKMp8JBUFmGRklbsZivhxOVYOnZ7RyP6wf+kBZMo9CiDpIUZutfVLzGAH6NWVYyI/IHZTsICXA08qanHiKeQ42Frc1TrKBaX55aD4FQSY9TqhxMf55ecrnfhmaOTDZG18RAxwtb5kZWIHYG32PRkT7aGgPg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 945c9df1-48ca-48b1-7e13-08dda43c2af1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 14:20:48.2795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7N6xB7FORz9V9jLt5rRUL/jo3j0gaW3/dpJAv0frYXIxrFb40ruWOqjS6QRmDag/SLgxedqahIRFKJGtBW4Fdld27dcrnHdg9oFvVZT+AZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7763
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506050123
X-Proofpoint-GUID: wIUCNYF_DgbgNsanu2lQ0tgWrUVvuIw6
X-Proofpoint-ORIG-GUID: wIUCNYF_DgbgNsanu2lQ0tgWrUVvuIw6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDEyMyBTYWx0ZWRfXxjo0XAMB7wUZ PacBROQ6Ha9AI8mWMgb5EgRbnps9iL3hkJ6pGCEfULASyOhsKy2e4aFiWTjYtzTWF5NWQG45jOQ Msib1waLJYU1yv4TpKaDNE8FngAhlHaHYdv2Y8BCjjoUHKVuzirtMxbd3xkCQxpiPd3ubhzQv8S
 TvTSiqB+xt/Nu5cZyOin908qnvywCtWz3Lr2057x+FYOVkFBh03S/gQhv4t1bmHFV1D0ygSL0tJ xuoPGkKdqtKBmzekX6AdQORPQy0aQerSSdOqsA1NYDTzaWCfMLbJWUXmkIDG/TwQu3AYd61Ioce V7zG0/mzoF7qhmNfSADWDMKqr1gArOAS/OoApJbVphTZqE5Uk2w3tz2yCpVx40IR1i/jy4ZycNt
 S7FNzSSm2S6n8RWyjDd7qPyU58c6cuCMQSUMUZ/ZlAoXPZ8qVAI05XLF8j1yhtMQccLxLL0L
X-Authority-Analysis: v=2.4 cv=FM4bx/os c=1 sm=1 tr=0 ts=6841a7c5 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=A2pY-5KRAAAA:8 a=7CQSdrXTAAAA:8 a=yPCof4ZbAAAA:8 a=20KFwNOVAAAA:8 a=1XWaLZrsAAAA:8 a=Pd7rdqeV-RPrXnWbpJAA:9 a=CjuIK1q_8ugA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:13207

On Thu, Jun 05, 2025 at 04:12:48PM +0200, Vlastimil Babka wrote:
> On 6/5/25 10:31, Barry Song wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > We've already found the VMA within madvise_walk_vmas() before calling
> > specific madvise behavior functions like madvise_free_single_vma().
> > So calling walk_page_range() and doing find_vma() again seems
> > unnecessary. It also prevents potential optimizations in those madvise
> > callbacks, particularly the use of dedicated per-VMA locking.
> >
> > Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Acked-by: David Hildenbrand <david@redhat.com>
> > Reviewed-by: Oscar Salvador <osalvador@suse.de>
> > Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> > Cc: Vlastimil Babka <vbabka@suse.cz>
> > Cc: Jann Horn <jannh@google.com>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Lokesh Gidra <lokeshgidra@google.com>
> > Cc: Dev Jain <dev.jain@arm.com>
> > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
>
> Thanks!
>
> > @@ -1160,7 +1160,7 @@ static long madvise_guard_install(struct vm_area_struct *vma,
> >  		unsigned long nr_pages = 0;
> >
> >  		/* Returns < 0 on error, == 0 if success, > 0 if zap needed. */
> > -		err = walk_page_range_mm(vma->vm_mm, start, end,
> > +		err = walk_page_range_vma(vma, start, end,
> >  					 &guard_install_walk_ops, &nr_pages);
>
> Nit: breaks the parameter alignment. Do we care? It's Lorenzo's code so
> maybe not ;P

OMG!!

Nah it's fine leave it as-is :P

Can always go fix it up at some later date... or make it more sane with just tab
alignment...

>
> >  		if (err < 0)
> >  			return err;
> > @@ -1244,7 +1244,7 @@ static long madvise_guard_remove(struct vm_area_struct *vma,
> >  	if (!is_valid_guard_vma(vma, /* allow_locked = */true))
> >  		return -EINVAL;
> >
> > -	return walk_page_range(vma->vm_mm, start, end,
> > +	return walk_page_range_vma(vma, start, end,
> >  			       &guard_remove_walk_ops, NULL);
>
> Same.
>
> >  }
> >
>
