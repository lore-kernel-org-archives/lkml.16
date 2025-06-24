Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F3F202C46
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 18:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750788121; cv=fail; b=ngkn4dqWe6RGO26jmXkDyFoWFJCBqL7HLxAY4Ls3upWQcD65NuiC3CUA0fE4j1WQM6fPXrcDjNr5DJrgFYuZ8xuIlSZQhkrfNomTMWCtQcIVGWXtKwgyWsoCGnuPfNlGL/uoMaxWlCpZExf2iZ2k+Bwx2U5Txe76uyGtXrshKRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750788121; c=relaxed/simple;
	bh=GCJ2rMitoyHii96HrRgh2epMJXJeeNiQt0aSKC5eRiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GegGOpQ5d+EqgmfvcGTZH07QUtEA+raLSgJwwKzayBgZmv+oQP7gZK2BeNhCrH5BFMzAFmIMGkGT3awIpJlMibHUeYnKFKBu/BKL72SOzUYheKFbf5P/xVvO8GOtPVPCnQZHhqVRhLIaC6jK/NGcnUITJyIr82LZpjC7MR9Y6+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BkIO+iw6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vZB4yF3i; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BkIO+iw6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vZB4yF3i"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OHBfb6029073;
	Tue, 24 Jun 2025 18:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=GCJ2rMitoyHii96HrR
	gh2epMJXJeeNiQt0aSKC5eRiw=; b=BkIO+iw6+xFkS6fSAbnOcy0hKIOTkIaq13
	BvQpyZvUDPM/pAhQGZJisKLQBtTENCPWREsNGB/etY55nJK4So0QbJYbDh9Ptyl4
	hZFqov8fRt18OnUDrZveRDqDCM9nHoDtwrbmuVxYyavZfKH7XEnLyd6uj1z1d1Of
	tNzPNmM+PTT2iaQSKhkX87TkBnQdS4NVBSnJhGyd/GoEh2kimLrL3GdMcqUQrdrk
	p1IKEsA0IOzPhX1PGRjX6Xhf+U7qgaemFsDCH1iySovXqgGa5ZlHDFQunbOMWPju
	icoF2dtXoz5bpUMSYRxfw7N0VeQeTxWN9epeZUb82GHQtdoWxPhg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8mwpre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 18:01:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55OHRH2i007396;
	Tue, 24 Jun 2025 18:01:29 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq3yt57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 18:01:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJD+2xBvyw2SXpqffHICsTAeGgI9acFXs5H4TehqURuVjfnCKnykV3TcmF9mZhqN4LF4spTP/M0MJ2QLMPA4gd98MVCpewa5taEfHgj0NwT8HHc4eSUIVCZF0cUCHBnApFY+hJvd8O32D83wOH5EcMxRB1D04ygKixktoQafAenTcx2bYQSaBTWyqovt6awMW9Y5L4/0PUbMww7CMvX2QMQg8gkhY2NFk9jGVYXxpMwYY/0z7HC6AKKefd6m7ive84QTq8+v7C2tmo/QAkM0HnJ4rJFpxiY8PLz3Ts0/w5wAguH95k/B56crdCM6ycTEPzj25ctr8s4XzvQJHAr40g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCJ2rMitoyHii96HrRgh2epMJXJeeNiQt0aSKC5eRiw=;
 b=dZWj0Vpr5P5y2cfAF+lJfOmuytuum2Xhyl5ISejg6FMUVrXkyXHJroFGaAMyLvkKda+f32EGDEtA+rNWsjAje+2dclnWJ7YA6KLrfbotkXgBKQmsVkRw0/Da7C+gx8qwevQGsJUTghkl4lEbTmKgpQXpa2FMrNuB3MpUjCBdNACj2uxxckjfMefTPMCxCgMZUybKvDXdcA7Ic/ffgeYXUbJK3AUP5K247JODzmhd+bYlUePn1uzQ/ob9xcNzE7/YKnx/Htl9ZQleqGozlIJI8DTBoR2QaZD7yzj6CK/LkytNpYyLmVroLFKkRvX0AcTMTse5QyjZgN/aTssytFxVxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCJ2rMitoyHii96HrRgh2epMJXJeeNiQt0aSKC5eRiw=;
 b=vZB4yF3is4uNs7RGyGJIUnM6Wr5kw6pSIxapYKzdkizMejIpbGhjnbsS5SE3KduplxAUxBjSn3RLRfCGBcueG1Q1eAENs2RfQkWLmVHD0Zu95K4YA2pYCwWYyxrFHUXQIYxcLNFVP7ALJFowBlMPCy+UfbZDManS9rr0E/SbI1U=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BN0PR10MB4918.namprd10.prod.outlook.com (2603:10b6:408:12e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Tue, 24 Jun
 2025 18:01:26 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 18:01:26 +0000
Date: Tue, 24 Jun 2025 19:01:23 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Jann Horn <jannh@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Lance Yang <ioworker0@gmail.com>,
        SeongJae Park <sj@kernel.org>, Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v2 5/5] mm/madvise: eliminate very confusing manipulation
 of prev VMA
Message-ID: <393a693b-f33d-40ff-86c0-b621fb166daa@lucifer.local>
References: <cover.1750433500.git.lorenzo.stoakes@oracle.com>
 <63d281c5df2e64225ab5b4bda398b45e22818701.1750433500.git.lorenzo.stoakes@oracle.com>
 <dca94cde-8afb-4eab-8e57-3f508624d670@lucifer.local>
 <89491be7-a480-4692-a6cf-ec54e02eb684@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89491be7-a480-4692-a6cf-ec54e02eb684@suse.cz>
X-ClientProxiedBy: LO4P302CA0044.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::10) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BN0PR10MB4918:EE_
X-MS-Office365-Filtering-Correlation-Id: b19bbd20-38a6-4ea5-9c7e-08ddb3492341
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l1gl77+kHcBkpict1ThmdKDoBxPvB6RsV2GnRF4iFCSDKOxAzlacyQGtWX2r?=
 =?us-ascii?Q?vuMytHBaiBJLj9Wu49weynqsxNDyvp0iJd4VL2GjOn3skpCV84V+TgSYQvPk?=
 =?us-ascii?Q?g0K0tQ9d5zbcvugu/uEFVXrK8VqYWHs4jX/ZCQkpKimHpIk4YV3tvOA9VhCf?=
 =?us-ascii?Q?c8mfkKomGBBxXpVvJ1M3mqA4zui6nM9ny773GnksD9hBcdf140h0Wo1zbL7h?=
 =?us-ascii?Q?KpzMsCoHj4zWIUzcgxGX0SnHVumooQRy0xTRrAmzdwLFCbM2cCtMAkJyggew?=
 =?us-ascii?Q?m4wSPo7fA5Awvrc7k6tAgEbE0BJScBWoyuPq6CsYGT7MxhZE1GuO9eLyyLqz?=
 =?us-ascii?Q?ZxHc4dLhFeNRkD6jnmVAS3sPBCO+rqG58uMFAvHjjbf5dFqQx+c+nTdG3OQy?=
 =?us-ascii?Q?DB4/JK3aeGPfOs6a5/K7wWDwFMCfZLdsiKR0NaKItMUQBWcR7nyeGzuzoKRP?=
 =?us-ascii?Q?KDsfD+2k421O2xVBJZbtY1OWDOqkvI8ZyhMJo3BYL8OCulJc8JmDuytN5gLF?=
 =?us-ascii?Q?ZydFP/ARP2/LWNj1mFox3wDOwP54mLv8XkV3UGZ4ooMjGYzcgd/iSkqoLAdK?=
 =?us-ascii?Q?9CTVpLsvzWQAloR1tEdVDt5fi5S/8aqfPg0P4mE3iH+855pBLSya/ENQFay/?=
 =?us-ascii?Q?62cxqCKvU6IGwa6qA/o8YZu1fc4NahJTV03KLknY6845bpCifs5TKbrDp3Y6?=
 =?us-ascii?Q?x0l7/nPsNfcM/m7DAmyKTMSXQlvfQJMI9HQZOtHCiN54YFh3bAQpiXLnEj0N?=
 =?us-ascii?Q?NTXU6ZP71BIEydkVvGiR7k3t4ed7dvzbDoVT5hEGTOcPvOzcc+zho1ZJJdM1?=
 =?us-ascii?Q?gCVZkTIxzdwoZ5s7H0dFIPDr514eDjBoaBPE3TMhPVPIogX+DJXy0apeIJhm?=
 =?us-ascii?Q?iJXlYaZuqR20cdRCtx3ty1XMenx0Dc/+wF0MY07eQCkVf3Ct6+YdRWLvhkcS?=
 =?us-ascii?Q?G7X5c4yj0bcU0CsCqBJWKlrRcsOtoMOsSzSau1Hec8PjdVqR5Kwd4hoN+USE?=
 =?us-ascii?Q?ifylamWwG+bdSJh/tEM27rlIVvP27qMXOSLwyW3xNc7xnabx3RK931wiHTIo?=
 =?us-ascii?Q?JKlHvAbWIIk7AaiQtQzDlXzX7OxtuJTt9ffPxuaM3SilscXZeZXVqu0PgXpr?=
 =?us-ascii?Q?iMJ7mQVPX5G3j2ll0lSW/cH3IwwDJejCxUFHhNFVcz+N1Vvhdu5DXFJrYaYj?=
 =?us-ascii?Q?2xBPaGDtqIK4s54ZBypxOT+JPe8jN6iCGN/XCWfl+CP6hgGbquV4C4WobyIF?=
 =?us-ascii?Q?c+KDW92zqCaRtYQC+OCSAzyL3avzaiveSXj0N3zqDVwR/lRqg/Wpt37Sosuo?=
 =?us-ascii?Q?H129Dxei1xvVHOqz52V875FOGzGW4R+ENpeCetYt6+amFIpRYuJ9NFZUQRc+?=
 =?us-ascii?Q?0CVXxvn7/xTZxZ/4CBv8bT0zwuEw+93Lb2iwnlKou4kcpZFDWzTqExVta6fd?=
 =?us-ascii?Q?AZKBDiIs5Eg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YY8he/34PEYghh2qF9E4+t9p1b5lKpZkYCp1QAEj9IfeaXMWDCEvrdISu/Fq?=
 =?us-ascii?Q?ZcL2L399skkMdX/nJvJBhe9N2ribzJ8JOrVqS2e9czt6VGQ/hqZ68HRrxkpl?=
 =?us-ascii?Q?gLQLzgVd0GSPZ3ODqsT+Flj5Ri0/bmAlvZlmbVnS2eD08mP+aIt4fR783gbS?=
 =?us-ascii?Q?pdEBL5QIgt/F7UZvWRSt0TMl5ggrRfEA/LiKMg26/xDDmWNrabEZsTXMtu3q?=
 =?us-ascii?Q?tNKHjinyTY9NJww883cqpSA3XLGDf83vh+vaaHx2BHXFofaI55WmxuufgVzC?=
 =?us-ascii?Q?WGrsL9SrEp6oXfdmwdP6RfaX52wAdv+PGIK+ByMG0T+QseYvJztBrfK9JKiS?=
 =?us-ascii?Q?stpcfmDrGnOEnArRpX6IBnBBQ8TVOugeJUXj+bXu1HpsXlXoKSUs4G8n3122?=
 =?us-ascii?Q?Er/phqU+096kRpVhRErDIhUcUtybe/AT8O51LaLxCUXOVlWtNjN5lQX07syH?=
 =?us-ascii?Q?Nk2uHDTpEtVx1JQXX/4gAeNgcVRQehmd4+wr2dlr5AyNxzuH3sOp/1FECADo?=
 =?us-ascii?Q?o7aAtH5Tr495MZnV5UR4oSBLqYXu2E0rmBxhUYRgzG0d2Yppn8cw7PfQzUI7?=
 =?us-ascii?Q?LQMh5WYi+c+F8AsAP2cOABBAlyoRWer/8pkYjtluoKgidEXWzKfZR9ZCvFmG?=
 =?us-ascii?Q?+P5ljTkX0ri9YE36u9bH/hmj5rGp4KrS4nPELYA40JKY2rs8wV0l3UV7CwYv?=
 =?us-ascii?Q?6nkMW63POSpLS5e3wFvYAp3nZ5GV2kYKL1+C4JGilzwZLHRMpoFPLInkdKmo?=
 =?us-ascii?Q?rR7hcC0cQdHq55aYyq1cL6RDR6iM14B9Q6sndu4S4cY0abt5UGl0IyzLTUGT?=
 =?us-ascii?Q?dups8ujxwhxRuM9oij3DWt90e5yAvxU4WS3tcbvUtlTxA/MjdU85xzoIrOZd?=
 =?us-ascii?Q?r/7FLGZODS74KLsKW6nS4ljPVJPcVfq88Q5exGR0N9bVgktI5lGiNYXhaOD3?=
 =?us-ascii?Q?A025Vr4EAFoUW2ITmNdzH3A8Fbuf6ilqCPWocSEoEJV1NEWFNgYat/xS9LR+?=
 =?us-ascii?Q?8nPtfKJD1HSO60ShPbrwcKlnOqciZdrBafJnU017+w0FnRwGUy+rpbfW86kT?=
 =?us-ascii?Q?UbYHpUF9JwNGK89d0tqvywEwn7gEBBppj3HsUbNFTgmft3xaLCEBsCgZVp0t?=
 =?us-ascii?Q?XzLfgfv8oGLM9ufcKTs0sOCfZM27q0MoEnYsXOxSwq5urFF0nX+DVne7xm1K?=
 =?us-ascii?Q?kTe4SvALAXLoKgvWc9XrU+SeyMj2JPrDcSwOMe+E/PAID+S0vEjhk7pYIxfS?=
 =?us-ascii?Q?vPO7zV84t2772Y9Iyz0mKd/LrL0mV3jSDxEoH5OajqJuEAYDF2QckYQXDU0A?=
 =?us-ascii?Q?VZiGr46W0q4qlhM1Hp5ydx9yykJXyAPHlg83x4v1mQLoRkoLsjGwhIpEK05a?=
 =?us-ascii?Q?s/9WKKqJK1cc6wRUGSBCZarDGqGGvXMScS7Byc01Aif2QJr2PIvIijjAkC77?=
 =?us-ascii?Q?y+nEgcXl8oZpWznloW1XLosJAR9aamaQv6FtBuYVpXUMD0xiFODaZXpl0kQw?=
 =?us-ascii?Q?plmrAZpR8pnQ01HVtf/dkX5tCGwGAYQUz+TTPmT6I5kCga+n4h6fZ3ne3u+f?=
 =?us-ascii?Q?LPAQLwsqH4EWEWpQd5CTjz3/jtl9DTFe08UGU2TGZwxUcO4boTumKr+VuXf8?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JdPFqHh1x5q5CbyG6sMrgoeqxo8EBWIxkTNqqyOPzslB/Z3A1CaKEPL4u0msqrr1hOSzHdCuFMeBOqv7zenFqMZFP8sottG2kZ90HvtF7mefxQhhArVnQPy1pLoU+Uocgy6YiKijIY/4W5QkDVI2HjUPA02exklrYiduCcalhpixdeLw4iR61EPUcvL5iDl0SXC/JSyvTmrwFPvhWGMQzzSOPjoPbyGiURfO8dK1WkcnFcMlJxuPuEfs9PSKE/fw3NZ1S/zA44c3nHDRLUbldeamPwBbX0zuZGogef0kYQiBNLUrRIGqzXYCFjiqkp7e4O2aOwAKYp+dh5gMTEzkyqwA7BNFXwpUMcBRKvPUg/60h3WRNCwvZDTmzaopK7mg6z/iTECuWDnr9lCpe2Q5yE9/lFjHSAPp2FZu857xsBdVUxgn9Wrt6co3d63ZfIyHqGnt4ntx0O8VI/3thzZJ7JrfqfUveLkmSzz03rqPvf1WHr5hB899hTA+V7Yngix4YBcn3gX0OunWsEjJUnJqGZdrsK9UbkFC4c5pS2oagpUO2yRSaoPf3EbcVEqRovo2nezprOodLcgPLNzWxQUwmQf8AW5BhkhD/hOBKudLkZs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b19bbd20-38a6-4ea5-9c7e-08ddb3492341
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 18:01:26.2741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8LN48Qp83xzAYXezgH/mSSmoghtXOZwB5YXKwXAgvnLjiqGYOev4wACrmjui18URqAe1OVuICrnriUtaFHR6rN+FBfrMSHND3sJqPZGQVu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4918
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=768
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506240147
X-Authority-Analysis: v=2.4 cv=IcWHWXqa c=1 sm=1 tr=0 ts=685ae7fa cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=W_nm0BWW3L9N1SOaIGEA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
X-Proofpoint-ORIG-GUID: QAsXXfbB5abcudNnqPnNTb7Fs8buOC14
X-Proofpoint-GUID: QAsXXfbB5abcudNnqPnNTb7Fs8buOC14
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE0OCBTYWx0ZWRfXxUV+LKwsow00 srBt+u0mpg8in1xW4CWX2EasyzgCQhw4ha1jEKgiFy5rir9dbB3UkEU+WdBVHfvWMCV2qL4oREu su89RKExsWfns602Y8qw7hvvF4YNvnnd299HNlxpmnGX3Qryq/fil23l7rioOxJYV9Samhj20Kk
 nv163PlHUfAx/2aZL9GLX73lhPLQA9/a7fSShRICci6+YFTLJKQf5dByF42Vf/JUI1jTGGyvxnG MBpKYgQb2UIvdmeoLcgs5Tlc2Wpj6eU0+JHCgFDRKcHymDiM3gjesmZIokwrhZIS2CkCajkTKGQ SBYTx6r1+qst6Jm04Qnh2AIa8dcCHl+hw/fQBCGE+mSgZaavbl2ZIaXnGjsmBRhV7agywiodM29
 w2KpzyeySIxQPCYjAo0Jzm1TWUa7239vZ/x7tMKj+l/4VNnSHk0fgqh5p5Tj+kAhqhE+AJMo

On Tue, Jun 24, 2025 at 07:57:09PM +0200, Vlastimil Babka wrote:
> On 6/24/25 15:16, Lorenzo Stoakes wrote:
> > vma may have been updated (in the modify call in madvise_update_vma()), so
> > we can't assign prev = vma, we must first reassign vma to
> > madv_behavior->vma to account for this, before setting prev = vma.
>
> So glad we eliminated very confusing manipulation of prev VMA :) sigh...
>
> LGTM (not worth much it seems...)

Appreciated thanks! (this was really quite subtle and we all missed it, so don't
worry :)
