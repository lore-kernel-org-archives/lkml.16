Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7EC286D49
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288318; cv=fail; b=nhyyzPau/GYIpX+F4UYubXrI8coQObIwylmJ3bYaLtXBzweNuPQ5YPO9knenbBz60x9+GiPpx93gwGzX1GQ3rbbOs0MluLLW7kYv+foFXpv8SrSyqvbL4diPex86jYADOSYLTnK0IBzeG1hU813dPPcgN+3kBcEuxZNsXcl1Hic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288318; c=relaxed/simple;
	bh=tZfAEmBvKqtSmU9KS1Px5X2eGB4zOpfNa62rHWRXPk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Vh0wBOFWkIRKxp8uoirdjJC6WTIwJFmzv7mElYnITGSrweLq/FD6XPh4eg+8OKUo9Ll2bYYn1tulOgCKNM2wceGpPeE2PmNTUG5SODXcKwpt+5trg6ZJg3IpOLlytdnlUCJ6u/zf25Hhrb4tq6KkKFKu9WySjqlv8d7lZGDhaAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mzq27uWd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CE7Hx/6R; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mzq27uWd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CE7Hx/6R"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UCff1L018968;
	Mon, 30 Jun 2025 12:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=A3HNQmtWjmVKe4vdhL
	ywD8Rz9TldFNLcCYF+0dyLYBY=; b=mzq27uWdet672+J+X0e6cXoa9iXfK/OFPl
	eajL0xEsf50tBkCmB1YcEsj7bqYYAwWhG2eT28EnZ4MaLPu5QdMDUbYQKRMo47J+
	K+lDLj8QEr1ZKD+G6/DmMn3tXh/O0cwZJdkQev1ApGKeTqchO8glHsjBgqn0hFQU
	wnoZK0UFY/imQvkAYXMrqsJ/HkJj0vJ7C5GgNmjx8ruAzfmRKUgAO5CktCL+xM05
	Mm1HKLGNqkL3aSM88zYsquSjHlDpSV7h2nOT7ftTLufRMxq0pj8G2/qF0iVOdibK
	vMHTeLxOMDs4aGL7SzE5VLXEJNMOhmT4WMC1FDrYWGl2RSlsdxvg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j80w2e4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 12:58:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UCE35v017471;
	Mon, 30 Jun 2025 12:57:59 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47jy1d1sh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 12:57:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sfvdYFmxnkeot8H4nfZwRTMwlq5rdydNSaqlbcuQYeXW6Y9wZWQMZ1UWPQNpkV25Qgt4IBHI4hTYsCb2nIat2N/kbqwwPAqLwxs1sGNArtAiWybaDJFCiSagiA11Aw03ZgRqksLcO7cPVu9jQyPStBfZTlmF+sAIDddIX3x1/IMn/Dn5Mw/19/EWjkpE+F7eRDtZU9uWEUSSR0h7NKhZzi+35kZ5yo0gcdLviP2ZNB6KwhqpPd5mnMWlenyMpWYWGLHcsYk+jsh0lqUhsGpiHjsN4KhawCaIbueIM0rw9L3gOsLZxyHo5VFa7qgcDbsSLxxSNRXuGlU5xI9sEIf2LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3HNQmtWjmVKe4vdhLywD8Rz9TldFNLcCYF+0dyLYBY=;
 b=Hr6Bk1X5Do+N4rt9ny/6b4GDWpMq3HgeDZpEtNQxUBCroYeQV44AXJiQVC6UYlXY6VmwPK0IgT0l9mrT7JdVrCZGEtBhsxkup3/CP0puoN0UfZTaXUntkqsHQGM3nC/+sx/Xo8Nmqp543EBm+XSYdbxLh3tGroxXU8tc9yu79ZX1lqfu5LrbM0HSTHW4l2j/aM6XMvEdzTRWXHGJSvQB3ExL/mOXqpoK/5VHGM2hfObHrVroqPcwiVPeIFzWLNPMhsMIscZu/l0V5/MWdtWVgnebY0Ie5YjT5w3eB7txvpRzgM0r7aWQW+52jmkUTeLdFUiEzdOyWtuz7/P91Y95gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3HNQmtWjmVKe4vdhLywD8Rz9TldFNLcCYF+0dyLYBY=;
 b=CE7Hx/6RdjtmaEDZYhZDSCUUQ8aW/mfC4FC2trcX/iMRsWDIBRrhSQnU/CJ7G9q2uRa7WETvf244nPx7Tb2lcGRaF6xzBfIRJUIrwgOU43VxYg/kFW5PDTdzeH2B36fMJ/CApg4XNyoTiq7ZhGwZAzzZFwggEw7O0/jJCfMHuqY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS0PR10MB8176.namprd10.prod.outlook.com (2603:10b6:8:201::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 30 Jun
 2025 12:57:52 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 12:57:52 +0000
Date: Mon, 30 Jun 2025 13:57:50 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
        willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
        peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
        baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
        christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
        linux-arm-kernel@lists.infradead.org, hughd@google.com,
        yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v4 2/4] mm: Add batched versions of
 ptep_modify_prot_start/commit
Message-ID: <a305816d-7770-47ec-bb21-1572c7c7783b@lucifer.local>
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-3-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628113435.46678-3-dev.jain@arm.com>
X-ClientProxiedBy: LO4P265CA0258.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS0PR10MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b2fea30-434e-4028-d13d-08ddb7d5b96a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Xy6LG3jYMr6/ATnJiBAyFut5nEKS/v1WOgWifXQQzYhxiYk+SVndTI9nFvZs?=
 =?us-ascii?Q?sRO53J3e4Jor3vQ6bNCOfLL0pgaM+v3YZBYNXFZg9e3EgQl2g5kAM+Jga+uQ?=
 =?us-ascii?Q?MmeudIBVeLa9afUs9bhNwiB7jNXFgW9cIEeo6dWc113DrSMJ2n7R1rS2KtlU?=
 =?us-ascii?Q?VL+LVHX8J0v9bg2YKnWbMKH1+uqgCSwDKZQcovG/2jtDQH121RFSci7aLNoc?=
 =?us-ascii?Q?KjVRas9YOhezT27rCu4WvFx/0tHRPDtRjxenHK9D0oE4wasw9DbHd++GpzIZ?=
 =?us-ascii?Q?uoyaqK8XKViO0r2PuAgkb0HirXsWJuBoapOR1h4WHn/NHU3LWqpXuq1mExNT?=
 =?us-ascii?Q?rX1pR113Wpu7pyKgPNbaGFDZ/qJs6/Og7LAGf8G+jwTF+bBByPTwq1wYCQRC?=
 =?us-ascii?Q?/2zHI0wQYxGBGy8PRtFB2VuaaTQlRRP8rDGEkJpnpX/RfFysT4gOCvDVwYRQ?=
 =?us-ascii?Q?Ovqk2h1emBrzvkbVyl9ohHLCRxr00fHgmVln8J2rbA82j+cIMQftEvwY14WZ?=
 =?us-ascii?Q?XnQAUACNl20fN1aOx68KotRxKm5Ip7K6UWc0oYBxGxhfmNVTI6z0lkSa3Mth?=
 =?us-ascii?Q?gWgUfnAyaKn3uhwEskgYXWIoueXsN4qu63Ie+iqLG85blTtwQhiy7awOYfDP?=
 =?us-ascii?Q?MdlDY2Y/A6EQyv6OOp/oD99GLZ0iKjOLpP2f6VwXOf2Mvzy94vfPcYbcDdx4?=
 =?us-ascii?Q?yF0mqnBKRzfhwmDAxA4288gQPM7lY9Vj3oBm94ZPMRUq1Uu6R1a/CAm5eC03?=
 =?us-ascii?Q?PEFcB+18Km2Ynq6TjCZA1TNt8wOS6AceU0+ve83jf2FV+gbspBNblyCgsr/l?=
 =?us-ascii?Q?5D25tSyB3woRpHFhnSu3wroe9YhAZFdUaM1fqHfc+XAC3wd+kOwgOCyEFAu4?=
 =?us-ascii?Q?4aw2KueUr3PuTbDpguiVOEAU6sB7dFVHzTcNxCuDNofEggbGZ0DGHme4Nn4n?=
 =?us-ascii?Q?W2m/I4B+8JWAwYKscgRpH1rNbyIgHoHiG1v8Hr+FWvM4fkoQEc/Gx5YSdK4c?=
 =?us-ascii?Q?lnhyOgjtY5I6PkY7b5c5Fcvn7pUfizIC6+reVmTJSIWNzG3KkROeN4X21gK8?=
 =?us-ascii?Q?AtGDpG0egUW29WGq1WH8QPZ7sZTkLKvpcJ3EMpKz6vUkSbnrsuhJEAhg8qfN?=
 =?us-ascii?Q?wXkayHy9c6RL9g1mKjgsBNEoABXhw1DxU12cPdphRkr3dGEX+Vxt/GooCs7D?=
 =?us-ascii?Q?QYhUcwwd4Q39bUfcqI1Oie4FONi7bU6miRBF2L4eR/BQKMjBr3j19aOBXDl/?=
 =?us-ascii?Q?+pEarn+AjFFp4liGm3qVSwiSrlUPP8YaT2Hb+C0CJ8FMEPM7Uf10a/A3FYWE?=
 =?us-ascii?Q?ALCYXRhx2vPHlUQFO61Sk4siIRfaSHMzHs+zAcQ9w9oMAPzhOVZqqaMKlQ72?=
 =?us-ascii?Q?rewTcYkJGcfziAkFzLugLB1t/N9k1ToqMajCXKpN4Z2CPm9nEQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jvZgrJbQycLFT/OsLjaCnbqa5dQq86ta7lLWxctOZphLqfQdQpj3InDv5ZgD?=
 =?us-ascii?Q?6SNq6d2I78h//kGBFFMFOYm5xUoFT94eJ+8iA8Y8VktzpH+m8rCBxxiVzqnV?=
 =?us-ascii?Q?NTzm3hFssfnQdz2QKKNIfaAxD30eYEwdCwFdwxsGMnXnEQkNZDGzb/v7NfIO?=
 =?us-ascii?Q?PZ8st5lV/DWy9s/UPB7lwqzKvEDPLK7ILMuJ3yih/Qo4oevJv+sh5Vs8OIfP?=
 =?us-ascii?Q?Y0XxXG7KqjY3xARO+uhJI3KrbAkPF7rQiTobZ9irHZHBVD+naZw2F5mGnifm?=
 =?us-ascii?Q?e9amfy+sWnrpL/LIKq36cQc0JBHbMrEgFp5JqPJ1WV96kUspCXMZ4BTggeVs?=
 =?us-ascii?Q?SRYgY2dgn5j8GQMluF+CFw5uJUXLEB5bDOe6xjE3kEV2tTyu9zZPzJTY+Zz8?=
 =?us-ascii?Q?gB+lVDV/60b1PSXlKzx2AowA2VRxXVmfa32m9A1e3C24esz6kv+6mpsmEUJ3?=
 =?us-ascii?Q?yygeiHzgMjZnHFy9nYMLSTrAT3GXaRMqA3ZyIv2EsJFWhNZmwAa22Az88XwA?=
 =?us-ascii?Q?8KE0JXcquw9Aq3S9j4j64xSaX1ddFB1KtjgMmom0FZXoJKiKfGQx3FOfMxqB?=
 =?us-ascii?Q?B6AIUuro7dQfTQaxdGuO8h7klkGdvyU3PE/bfzHMz6Di32Z1seCMuVNhRKuZ?=
 =?us-ascii?Q?G27WRWdx+UL8FUrhmNErQenPcQPf5ypQ93NUAcCrr0bwMomIujcFBVgwtKh9?=
 =?us-ascii?Q?3CsQyfF9hvlenI/YPVyyR/sOiCrjLIBkdQIN760aZzlrtRzKLZSk1vqkpjBC?=
 =?us-ascii?Q?971zOlcxqNy/xwgQEE7ai5ESfAGr9tKZuyKEcjrvYMrdY1ROpfv4lhZ3BjLo?=
 =?us-ascii?Q?FiAbE8vfpg9LwLRyAF3NhKBIbE0+0sW5ZJ8jZU4M5zyJpxDdYOoVKrkLpWwg?=
 =?us-ascii?Q?BltDGZf9tM/gopAMfRHPSctOCSo6LEJNT4wbDNM1MEVptkqhHHFS0TH4UTaI?=
 =?us-ascii?Q?kGdXeLtwtxprCvBQ+H0cK5FGOOjSmQeG9qI67CDf0lMFuHvZFn/Qi/4BiRjN?=
 =?us-ascii?Q?Ka0JUOWIMtKnWFbbycQVLuK0DkuuAuw/6QKejpoOkh52AfjIeVK9bKuvIvdu?=
 =?us-ascii?Q?cIbQyGIQ3LxFZCacDX2WRDW1vGkufyrW9LYYnBuVR5LWu4U0DWr3IM3tj0pn?=
 =?us-ascii?Q?nDM+O7/eS6C74Kg7tY4bl3GD14xgOpzfGZlrvZRBYLEHDVpJ8a6+l1gwzCml?=
 =?us-ascii?Q?f0OCnfi1WefZCqIcXVeVvZzxUX8u79yK8BMNYt+jEt5RnFAr2xDK+XBvEkTY?=
 =?us-ascii?Q?yDbOkNPwSp7SJ9BEP5I1HjRwGiUHQOGKW9LdwbvAKdvdYlr9GZ7UZ3/yvjOb?=
 =?us-ascii?Q?I7sKNHEIM1Tt3qvbMl5gDqgBBsfWHVuNI1G3H0YRYkqRMtlbVpJuZHyrMCSA?=
 =?us-ascii?Q?GJ4LIyvUq+KTst2VyiOQTL6jNjtQe0hKB37tpNk6koZZ9Re92OrJpSQFrwiH?=
 =?us-ascii?Q?7FE2pjQ3NLQzxzSCljaKOxKvTlcQY48UKelIfkqxYSC6zqB/1jXVa0iMeobe?=
 =?us-ascii?Q?ZipyrHzQR/21ZzjMWVC+IrFBP/q2MY1j6x2FqnK/WVOMqvXSZNKbDUBlVxFr?=
 =?us-ascii?Q?TWUzozA6xnalXDEAMm3UVJcCbAqIgWh6h2R1RqogM0rtF/7QfeJbov258KjX?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7rON74cil3plUfKYgl2RJtzpSgxJ+lmm4DWQmvl0vtsL2JOKlTEkpUTXJDflmLrDrfQbW/g8XfhSdyQu8QP89XvD8Cs9EzaIyEc2sQtq/DYiL4ceLEW5dDUhW/7qselAXt64b4dxcibv0dv/oR+nnBJtwGyIrkMjANId6P7lQuRRVRhqI8l2LP7pb2PeO+Tykg/vEi1tU+BdqA9c5Yoq06P+1mIIQ8e6KSdc7JwbfFwDR61PjnHUsqGKQc2jf0xGSGs3G+WM7Cfse4GpP+x+YZrn+aV/YcNEH8ga+O77bQEImEfWi4G5dAFaCnnWNJx0vAKtkSQKzs1RbxiiwCdbMbCH0qW/qNw3jksdjxec5rSgCBXOS0z0oumKth0Fmi8xyVnUWvw8hOcloCoCM7A01O5j5KpKOs5HIB3kbi4N6MktNxXBtcaQjq+zJW0t+fKjlUThm+EUrI38iZbI0r18rxTuWmUkUtoZfVfgiXaksj7XRrz4oGqg4C4HEpcLWLAzUMUCen9fdkN+BbyRiCjSe97wDNGLbWXwsH0CwXeiaCTqe0I5cW8zbeRQMKOcmc01UnuiS2fzgwrf08C1iL+Et4IcyVaMCeBmuG7jgXDnYmg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b2fea30-434e-4028-d13d-08ddb7d5b96a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 12:57:52.4034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rW1lL5PqqTOZVkMnohKxyJ/6/ZQA3HDwvxcUlOf3p9u0+tU02yTKsq2hTdBLkB/Wse2SiKquSuTwEEKAQGUkOYRwA7614DOkl1nMHkYUbTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8176
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=808 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506300106
X-Proofpoint-GUID: 3t_QXYFl2rmcXYS5NEv6tjGsqtgcNFUp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDEwNiBTYWx0ZWRfX8QKCR8i2y7o/ RbYYTIpNhhlTE0G0UFXuG3y2UP7bXp/jjoAe7MaLmA6GjvS2T9Q0RgDua4eTcyRNkMkw1yWnq51 MoaQNwKx4d8jtQ9pZPzQxRJHFziosBvXzd6u0xIbiFm6JNxFOSvwiEzut1c2uhDe3X2eEtucadW
 C2gRSHls1QvqN0Yo/nlj7mBrhG6c8dNpGRPI3ehPt+RAaiShhs2t4k1jxL5YDgUm4WzohZQqKi+ jjnaced9NWNrhR5AaxYBboqLFHJrZHTwLXYxFWUtt9CCegd2iodAjnTXD5A0Qsbz20dV0LIoSw7 l2ZDeW1K0RJ3F75dV8sPyURERzu05BcLUzFXH2dqwM4NVfqhb2cwp+iDLVEb6tFfiED4cLvGPaW
 cL1Y6GjI4pMLViLtc+UFqdRQ2aVgvwfZHuhb/kY0Gew8deDiYFPB2bLKgCmSDZ/+FlSJhBYC
X-Authority-Analysis: v=2.4 cv=D6hHKuRj c=1 sm=1 tr=0 ts=686289d8 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=VoO9Cytc3JEJLQE9W3sA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:13216
X-Proofpoint-ORIG-GUID: 3t_QXYFl2rmcXYS5NEv6tjGsqtgcNFUp

On Sat, Jun 28, 2025 at 05:04:33PM +0530, Dev Jain wrote:
> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
> Architecture can override these helpers; in case not, they are implemented
> as a simple loop over the corresponding single pte helpers.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>

Looks generally sensible! Some comments below.

> ---
>  include/linux/pgtable.h | 83 ++++++++++++++++++++++++++++++++++++++++-
>  mm/mprotect.c           |  4 +-
>  2 files changed, 84 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index cf1515c163e2..662f39e7475a 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1331,7 +1331,8 @@ static inline pte_t ptep_modify_prot_start(struct vm_area_struct *vma,
>
>  /*
>   * Commit an update to a pte, leaving any hardware-controlled bits in
> - * the PTE unmodified.
> + * the PTE unmodified. The pte may have been "upgraded" w.r.t a/d bits compared
> + * to the old_pte, as in, it may have a/d bits on which were off in old_pte.
>   */
>  static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
>  					   unsigned long addr,
> @@ -1340,6 +1341,86 @@ static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
>  	__ptep_modify_prot_commit(vma, addr, ptep, pte);
>  }
>  #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
> +
> +/**
> + * modify_prot_start_ptes - Start a pte protection read-modify-write transaction
> + * over a batch of ptes, which protects against asynchronous hardware
> + * modifications to the ptes. The intention is not to prevent the hardware from
> + * making pte updates, but to prevent any updates it may make from being lost.
> + * Please see the comment above ptep_modify_prot_start() for full description.
> + *
> + * @vma: The virtual memory area the pages are mapped into.
> + * @addr: Address the first page is mapped at.
> + * @ptep: Page table pointer for the first entry.
> + * @nr: Number of entries.
> + *
> + * May be overridden by the architecture; otherwise, implemented as a simple
> + * loop over ptep_modify_prot_start(), collecting the a/d bits from each pte
> + * in the batch.
> + *
> + * Note that PTE bits in the PTE batch besides the PFN can differ.
> + *
> + * Context: The caller holds the page table lock.  The PTEs map consecutive
> + * pages that belong to the same folio.  The PTEs are all in the same PMD.
> + * Since the batch is determined from folio_pte_batch, the PTEs must differ
> + * only in a/d bits (and the soft dirty bit; see fpb_t flags in
> + * mprotect_folio_pte_batch()).
> + */
> +#ifndef modify_prot_start_ptes
> +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
> +		unsigned long addr, pte_t *ptep, unsigned int nr)
> +{
> +	pte_t pte, tmp_pte;
> +
> +	pte = ptep_modify_prot_start(vma, addr, ptep);
> +	while (--nr) {
> +		ptep++;
> +		addr += PAGE_SIZE;
> +		tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
> +		if (pte_dirty(tmp_pte))
> +			pte = pte_mkdirty(pte);
> +		if (pte_young(tmp_pte))
> +			pte = pte_mkyoung(pte);
> +	}
> +	return pte;
> +}
> +#endif
> +
> +/**
> + * modify_prot_commit_ptes - Commit an update to a batch of ptes, leaving any
> + * hardware-controlled bits in the PTE unmodified.
> + *
> + * @vma: The virtual memory area the pages are mapped into.
> + * @addr: Address the first page is mapped at.
> + * @ptep: Page table pointer for the first entry.
> + * @old_pte: Old page table entry (for the first entry) which is now cleared.
> + * @pte: New page table entry to be set.
> + * @nr: Number of entries.
> + *
> + * May be overridden by the architecture; otherwise, implemented as a simple
> + * loop over ptep_modify_prot_commit().
> + *
> + * Context: The caller holds the page table lock. The PTEs are all in the same
> + * PMD. On exit, the set ptes in the batch map the same folio. The pte may have
> + * been "upgraded" w.r.t a/d bits compared to the old_pte, as in, it may have
> + * a/d bits on which were off in old_pte.
> + */
> +#ifndef modify_prot_commit_ptes
> +static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
> +		pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
> +{
> +	int i;
> +
> +	for (i = 0; i < nr; ++i) {
> +		ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> +		ptep++;

Weird place to put this increment, maybe just stick it in the for loop.

> +		addr += PAGE_SIZE;

Same comment here.

> +		old_pte = pte_next_pfn(old_pte);

Could be:

		old_pte = pte;

No?

> +		pte = pte_next_pfn(pte);
> +	}
> +}
> +#endif
> +
>  #endif /* CONFIG_MMU */
>
>  /*
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index af10a7fbe6b8..627b0d67cc4a 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -206,7 +206,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  					continue;
>  			}
>
> -			oldpte = ptep_modify_prot_start(vma, addr, pte);
> +			oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
>  			ptent = pte_modify(oldpte, newprot);
>
>  			if (uffd_wp)
> @@ -232,7 +232,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  			    can_change_pte_writable(vma, addr, ptent))
>  				ptent = pte_mkwrite(ptent, vma);
>
> -			ptep_modify_prot_commit(vma, addr, pte, oldpte, ptent);
> +			modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
>  			if (pte_needs_flush(oldpte, ptent))
>  				tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
>  			pages++;
> --
> 2.30.2
>
