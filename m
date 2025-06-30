Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBBA2AF1B
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751279401; cv=fail; b=rbeRy9YhhZc2vwmnc4zP/uiO0o09VHnYd/9y5WHVOcS3VjM1BeZ92Xga0dr1Uny6gEK9P+BgcVywUM4gNxFEzU215nyaYTD6Vz0YulcU+SqutII1Hbt9mZcR1Gr5XogV6iEHNiSui/wpxLSVu55eLpuTiTOBWgWSJe9Q4NY8CI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751279401; c=relaxed/simple;
	bh=x92CLUnxVifhP+z85VH4dv6cix5Nurkw+AefIYpLIlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ilRpMJP7RFrrD2ThQeUDxO3RdJGOLvEa5rxNTr/dDXVC3MV1NQhyDnvWkF1G9bMGriGlK6YzuqIGrQXCumhbCmSUT9NyHmBalI98ihbpPbe7aikaic0HW86qr1e37xmTsWadDDrB7c8tvVZ4Em6BzCwOFgspHzUqCj9Y7JA3A9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=l9TV66V3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Q3nQEEd7; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="l9TV66V3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Q3nQEEd7"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U84gYE005038;
	Mon, 30 Jun 2025 10:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=1/fKpVdDgC1n3U3WFq
	CdcrTao9T5z/0br7jDGvMK4pk=; b=l9TV66V330VnawW783qTlotR0WLlNIMe6+
	X+NSXVcZjek336n6RWYXI6N+YQRKYx1CaUf09Pd2wv1imXccSmLvyqxq33uG1P2R
	Zl9jFVIMdiaOMG9oo48QOdmeBSMEi2e0CJ/3e7/J5xpTdc1phBKg4UFFisa3fTac
	kVmwfEPf+I400UisfJ3mPIdYEylLYTLb0YUFvyeZZzEpsrHNIGA3IB5kADwdle1r
	mmkRC79lHFspn/DcslU6lQKlwbx7MrbSxf+WPZFantGg+E8aOMYWQQaMGZmynIMr
	gidDWsymPjzZZ2IwxjRh1qzsCza6NpdyDprQmusym4bzeb05uhKQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47jum7shp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 10:29:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UAJFGj021404;
	Mon, 30 Jun 2025 10:29:36 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47jy1cw7m7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 10:29:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTCKjvlizByrxwg+1Vf2A7lxFJsHzY2mViA/xffLd2pBEHLoVYFJP7wDf7dCg0doJbkw0sji/bkWouo/Ttq0Yinj9QxCndt65EfJqChwdSmKlfby3mDHjNm9/p+TE0d44OynYrBllzvVvMa98bRhkYcFevtgMQoGbOHLusxN8OdvaSWnwrYNHX96I6xscHayvaoUbmmbSf3uSwwmz8n6+udFg3cuuV7L1CYQdw6Eg1bx/MOkN2rH68QvnyeicVlI8Pnx3IomREViRtR6cVyvMXhoO3GtsddDAquYMLhRsc4dfIUlxD2YsGGIND9APvmlBheVr0dVVKoOFzyAaXU/zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/fKpVdDgC1n3U3WFqCdcrTao9T5z/0br7jDGvMK4pk=;
 b=bzEEjBqIfaHsGfu6zmaSLfTvJJLgDwPZwy3lzdAqWZJ9WU5cwqaH73r+aUyVT1rLml1r0N3UDWAq3ugFoHeOPJc3LQUyNOaFdfVO8WocQIZKaoBrpY0y4pPhQUAwIecVEkA9urvaFPgDWWggLjAxdi1zODFtCksFgOtQwCkqCJC1qB0I0o8CwKEm3lgTKuODWhfZU4+y+lnbOCcyFm1jHLGJ0Uwab+f9hX6KFNacIMi6z2ojx5HYvC/JBrscCzuhyQStTkjcn6StHXE5TdDeUo6xjiD3LI99PPF5LGcQhFmJRKvth75b1T+10RK37tegplxJYOGb9AVcBgw0FrPKvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/fKpVdDgC1n3U3WFqCdcrTao9T5z/0br7jDGvMK4pk=;
 b=Q3nQEEd7laUHlRvBz9YC0iowp27/bupKZPaJ1tnlyzVPjlFgYJkshHlAxsJiRScojqtjOesX49KGFP4hPBxdYYCicAN4nShkoVgrG2QgeR2Uf15moR45X4HDw6TzFJ00d0iEiOQWiclcI+14XlWl80+273B3TVMbVxOIE0UYKzg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM6PR10MB4314.namprd10.prod.outlook.com (2603:10b6:5:216::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Mon, 30 Jun
 2025 10:29:33 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 10:29:33 +0000
Date: Mon, 30 Jun 2025 11:29:30 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Peter Xu <peterx@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>,
        Muchun Song <muchun.song@linux.dev>, Mike Rapoport <rppt@kernel.org>,
        Hugh Dickins <hughd@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        James Houghton <jthoughton@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nikita Kalyazin <kalyazin@amazon.com>, Michal Hocko <mhocko@suse.com>,
        David Hildenbrand <david@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 0/4] mm/userfaultfd: modulize memory types
Message-ID: <92265a41-7e32-430c-8ab2-4e7680609624@lucifer.local>
References: <20250627154655.2085903-1-peterx@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627154655.2085903-1-peterx@redhat.com>
X-ClientProxiedBy: LO2P123CA0090.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::23) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM6PR10MB4314:EE_
X-MS-Office365-Filtering-Correlation-Id: af7d7aa0-c4a2-46ed-8178-08ddb7c1012c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CK+pdm+WNpiVKoKPetupm0t3nfRyh/Xd+EvqYUKBLBzcV45TzmGf9FRPqnk6?=
 =?us-ascii?Q?sui2X1BSv2Z9IFEYHoibHzBqS46FM+nyDv4m3cTcKnHapsGt/PypsSh/5wfZ?=
 =?us-ascii?Q?dV17v8y45DHkVMco0UJkjQYkaCSX26SZH0GYlIesXTwAp2R1DMSm4i11KNGT?=
 =?us-ascii?Q?A+/IkJ34cHnj4HfSFnRo8D0C79ja+vgsvKf9ClaEiMHOhLuis5ukQka9AfAI?=
 =?us-ascii?Q?a9pno0aV/FoOpafUY0ygdHXwSR98mykrrV4LTKCjx7no8PQbi5I54SqhuNAH?=
 =?us-ascii?Q?hQ7ZhBEnPkcAbW/H5eTC+P3/AjOrhTnceJBWLzefJopzJK6Dv+hljGe0YtIM?=
 =?us-ascii?Q?bR6fnRgypSN4aW+MHQGRuRBxUV4l0T+9MrG33RxLrAk4MWtuWRdLBp7Wi1XM?=
 =?us-ascii?Q?KL1tc2C2CSyH59SsuhP3rfhHW+iRM1qw36AKrsgddVoy4IfDKHmqt7lBP4er?=
 =?us-ascii?Q?V7AtPSfSccvOycDltnhHFBd+vPQq1m06hv8uQiCn9IOeTifDgx7L6Ug1vWu0?=
 =?us-ascii?Q?cL5ufhSiBhtFOgojka7AWoje/Jv3nSJUo+b6aOpiG5yFZ+ApEK6VJ+/8y5MN?=
 =?us-ascii?Q?mBC9ECW6clR7lj/pW3pgFBDTyhMeH4O6RiOFy4/WxC4UhryOCtkfwclaheCy?=
 =?us-ascii?Q?tOtFahhaX0MHqBUrn18GtfT8S4xJasp6w1MNGPxJkjCIra4XOKf6/aIhZpzg?=
 =?us-ascii?Q?5xNlSlif2TTdc/xj20Orsh4f/v/tSoKLWPJ50TFQPCF6dS5CZ+6CQa3GthKQ?=
 =?us-ascii?Q?+mjkne6L+5HhrwPLS6ajsRQaL7kfZBKDlkzg+3YQrazsjSsqLPMger6F7YUt?=
 =?us-ascii?Q?WGWi/ruztb5sZ+LuMLstnTKqSaA2BD+Bbkvwq24r15WV/YVxkVEhuGdSXnL4?=
 =?us-ascii?Q?mKicisiETmYgbCFieHzaDZCrSzsLYjk2+KOjx4l9gilaNrClUtz9gikWH9DI?=
 =?us-ascii?Q?kPliaFkLe1zufGW/ajtNCj0Z+9jU6SSu+OIYk1PJvWwBqBGiBsUYH4YlGd81?=
 =?us-ascii?Q?XZM+KhXhzfz3KnFjrndNuzsao68enLu+oJz5uqR9e+CSgyFARdChrp/Iy4Oy?=
 =?us-ascii?Q?G1GX1C/kOpt7/oMW89PWFRR9LrNNG3+5ewq2eC0IaO7vdjKtQSPkB8Ys8QQM?=
 =?us-ascii?Q?MMOfUWVrgrVFSieuXTE/22EQ1Nq2MuB2yRccWFjAgdLN1j6SeFFXICwWAsF3?=
 =?us-ascii?Q?EzjrjeCMxRF6rglpB4uCxS9QJfDTFMVoqmGsquz6kou4Lln4kFiqQeEhF0Wa?=
 =?us-ascii?Q?y+X+GkvC3bbloTvwG0kt5C5kYS/moVl3vgjJaIprEJ6jPHu3q+MM3+j8JVai?=
 =?us-ascii?Q?RpQQjie2tQgOcLIdOQ5JkPJ+S+zGgvMKhVuI1YW08TAvTF6EZPby/zPNrAqw?=
 =?us-ascii?Q?O8o+hSmSY/jQsdwFnRgwIMH5kbxQ5BIL+1TPoQD0rlZ9GlykSJZBcqqxV+HC?=
 =?us-ascii?Q?O5PrytEKcL525i1fd6ad7ZzLZz6vpbyh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g4PnTcf6NSF+2Kc8pZUm766caNRJdeNvet3QTPWFaqPwo93hIsHiiOt1/VdD?=
 =?us-ascii?Q?fhqrWnMVeZvGclkdEmgoJPv+fQRx6kbx9STihEKZQbKqfuXnhqGwSXbRbWVM?=
 =?us-ascii?Q?RcSWl6JdxdceteoEqYeHkaFKiWT/zon8BMbVn4hbR3pKgTCSIwUPFpqwi0yP?=
 =?us-ascii?Q?jx02GOmQ/CarnE4NePRXhyMgR5SymeBYtmxQzcm6D+up1qk3/wtwGsq7x8vC?=
 =?us-ascii?Q?+qskIi+WUrlKuL015ZpZXSkmOLaQyjxTfbWEq481/22M+IIqhNCj/R8RXfy5?=
 =?us-ascii?Q?fOr8MH5+agzQMpCU1FUpnPjc4UUPvmE2Dut17HTcGHhvMVmMwzzDkrPuek3t?=
 =?us-ascii?Q?r48sUCdyZ/CGomrJyXyq+6WnUWlApFwJnur34byICFUtUS4NF3O1ULqqBoWS?=
 =?us-ascii?Q?I/gLyAx9Y3lqhkN3XgGTEitvbFdJ80BTw+cTN65I7lJtMnGZSL4X3su/iz3x?=
 =?us-ascii?Q?H7snWr6n7ckdqhtqJqchLnxOzVvOJo3f1fZrhoH70FrkjH5gFHRALNyzWnv8?=
 =?us-ascii?Q?CueZB8YXOVXdfeBzD0UVpdYGSJLpJdQ4hu6ke2J3NFg4M79RWicVNdVHqRIp?=
 =?us-ascii?Q?M4/I3F3uBCT3yCb0cZtTu09dM5BC13p5JsBP0koQJvBD3GPjJggycBcHUenw?=
 =?us-ascii?Q?EQIdtZgejaQmaho1wIJk3NWsKSMSeMNlHlavyXJfJ6sPFh4NJTxlICbCM7if?=
 =?us-ascii?Q?WLBz9mm9DZURhvXJ9f54IngAo/JywgMoPe7walJngX5rScuXP8laINsJPpTi?=
 =?us-ascii?Q?DbC+UOTC7imnPw+fTArWD6j7SVz5k+g/XkG6k7xt6rctVbQK8OPQeYrnNGcy?=
 =?us-ascii?Q?Ma7yYii5sR7IAzySHx20jsg2YD986iUlBrgNfq1MvnE3tuPxo5b1cQS2ZWcM?=
 =?us-ascii?Q?Nn9LnWnc1KGVnGyLNoNhHaAUKx/5VVGNw59LxVayfDp4T7NxXiBp/U+9FKDj?=
 =?us-ascii?Q?M0PSLJMMHt98wHgLhfWlZQa2/XgFGFkPWfn7Dgo1O0LNH4yAa3FnsA9ko4+c?=
 =?us-ascii?Q?d/GStaRItu2cTJ3QpJf5N4rKV3RNV5CbqaweIC68iL7UJq9iHj6lFDsOtpi8?=
 =?us-ascii?Q?ZzsXwcySydEF3YU8yYMs4gTy28DddooOBSrc5+Hm3Lt32zu4WEG0GVFFKal9?=
 =?us-ascii?Q?sHeQWMOdV54F1lttW2RON+NXwqHD3oMr8jfcMEMng6p4/tUbOpfF5lLWcRXw?=
 =?us-ascii?Q?zqXIhuX5MkILZjA9cLJdMvo9GTXuRwIx1/147+4S+z2HRWYF/rcIU0YB2Hya?=
 =?us-ascii?Q?OzYXR1dV6kYbh+x0PtOk6QOMChHrT9FMJHmlI5kkWjdgah9Pep5dsQJExG/k?=
 =?us-ascii?Q?LfK68zR25NdYBtT44gdXKvU1pQ7MaEt7WMFvgOJwfrXqT32jArFfjTxdAFdr?=
 =?us-ascii?Q?CsJcMyL8ML2Iax/fk3XeGhGdVMq3/s23oXfhHj3uVkBI5E5rpOk21J7xLxIy?=
 =?us-ascii?Q?dpBRrGehz2kdx55n0frxZkdwAYlDx4BWR0byosrTUbQbtFD9zMVHc9TOV8NQ?=
 =?us-ascii?Q?w4wmxnVbGHExVa7a1zXN1Mk51VlQ5jcmRqCp0KKM4umdWZ4+s4FaCzuBpK+X?=
 =?us-ascii?Q?NyO6uOJ2UB3s8fW+dYqKXQKOhO0FahLz4NGGTg6fswRS8RGWDsEUU0DCAUlY?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yb581RRg0scjblLJ18c5l3+WvBpI2O16gBp5WyGaBtdH8+XYraVftrq1knyylhnmkyRb+fLE59LV97FKbmJovU08J43IeOzsIM0pc9e+yvJ/kqXGqK/RcCsySi2xO5VqFU795wVcFTgUYQji8aNq+n3I2QaKIx9sw8Uily2++JnY85f510KlNm5G73TtZVVUMKrWf4RLV2ns/acJU+FD3SzA94p+s8GxAQzFghyUddvPaqCIwd+4aB65LvwENU/uxlq6l9iQ8mYm0TXuFubZPzCETyXlCRxZSn4NQ3shtwD0IEdmXEAwv1KVlXluFkidhz6HsiZxHisLDaFFExWqMFBVSDSPkGmbK0EcuYOyQOUOU2Q0br4EKPp7W7F00eiFPe2dr4EEtlIfECtAURLZAm7JNQ1X/HaVNIt8PuYhL9jspE1Zsqsl2qJzRiI2A11SRkoUxv3uSR4KSiYiKotlgX13FXqeXmAkAQaKUKmwrRwqvhJPtHOn9eqJ4AUylIiA4l8Z/HbF0HbxfxKzPSNDR4swT9Nhivig3Bo+4XX5/lrTx+fIMKwKTpCZbRD6Y36+74fMJNEPSPh51SdFE1JsCaTuRBYgRpfa28EDkUxr7e8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af7d7aa0-c4a2-46ed-8178-08ddb7c1012c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 10:29:33.3419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xm+Y3uNKpjttJwqTjDiBTJ7m97heFoUqYk5SCrftC7zBPQuv5XNnuxqW7lB54tElJ3/qdyJd+qdhJ+q50ty/JkZ10N7M8tFy2oz7TGzFfnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4314
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506300087
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA4NyBTYWx0ZWRfX389gIS1/gEPQ By03rT4tz4JxzqyicQvI43j0yuY1PDBwsVSA3KvHuoWB42uOF5fOZbdeAL4bj5f5AOtUvKju9cc zbtOUWQGflp+N9b7TspY5Q0JcdGWVLK6TcHVxWbduluUkab28kGj6fRSYX2aWZNL+P2qrBdXDSe
 4zgucCkdakhnuJKwWwMzO+YuLaukEOsh6IX5vR0uBIXikRo/VpY6YKA1HlD7dfsa/YPe433/kD4 l6vwxgSt0Ky/P8EOVQLAL6M3Yg2iS2kGxLSyZiQ/ZqyzZ74H/U1md8ub5PnhN0OfX32gD+wwQGp vFviJE3uo9Ak50aeAyzgBB7AcrSozFqZRn7kpxxCgqj5mnAk5mW/k36qxX6kSs1FhCsugh7z7A5
 pBnTR7HGy2Dny+CJQeq83aS758i+uGv2W4KV4sqm2VtFTadf5qocWRZPCeHHDsVBjxNf0oKq
X-Authority-Analysis: v=2.4 cv=MvBS63ae c=1 sm=1 tr=0 ts=68626711 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=vggBfdFIAAAA:8 a=bNV42xP5Xkh1hk3n-ZMA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13216
X-Proofpoint-ORIG-GUID: 73rsLb-4THjPd3eTyz-5tCAwYBgg1CAH
X-Proofpoint-GUID: 73rsLb-4THjPd3eTyz-5tCAwYBgg1CAH

On Fri, Jun 27, 2025 at 11:46:51AM -0400, Peter Xu wrote:
> [based on latest akpm/mm-new of June 27th, commit 9be7387ae43f]
>
> v2 changelog:
> - Patch 1
>   - update English in commit log [David]
>   - move vm_uffd_ops definition to userfaultfd_k.h [Mike]
> - Patch 4
>   - fix sparse warning on bitwise type conversions [syzbot]
>   - Commit message updates on explanation of vma_can_userfault check [James]
>
> v1: https://lore.kernel.org/r/20250620190342.1780170-1-peterx@redhat.com
>
> This series is an alternative proposal of what Nikita proposed here on the
> initial three patches:
>
>   https://lore.kernel.org/r/20250404154352.23078-1-kalyazin@amazon.com
>
> This is not yet relevant to any guest-memfd support, but paving way for it.
> Here, the major goal is to make kernel modules be able to opt-in with any
> form of userfaultfd supports, like guest-memfd.  This alternative option
> should hopefully be cleaner, and avoid leaking userfault details into
> vm_ops.fault().
>
> It also means this series does not depend on anything.  It's a pure
> refactoring of userfaultfd internals to provide a generic API, so that
> other types of files, especially RAM based, can support userfaultfd without
> touching mm/ at all.

I'm very concerned that this change will simply move core mm functionality out
of mm and into drivers where it can bitrot and cause subtle bugs?

You're proposing providing stuff like page table state and asking for a folio
back from a driver etc.

I absolutely am not in favour of us providing core mm internals like this to
drivers, and I don't want to see us having to EXPORT() mm internals just to make
module-ised uffd code work (I mean I just will flat out refuse to do that).

I think we need to think _very_ carefully about how we do this.

I also feel like this series is at a really basic level and you've not fully
determined what API calls you need.

I agree that it's sensible to be incremental, but I feel like you sort of need
to somewhat prove the case that you can jump from 'incremental version where we
only support code in mm/' to supporting arbitrary file system code that might be
modules.

Because otherwise you're basically _guessing_ that you can do this, possibly, in
the future and maybe it's just not the right approach but that's not clear yet?

>
> To achieve it, this series introduced a file operation called vm_uffd_ops.
> The ops needs to be provided when a file type supports any of userfaultfd.
>
> With that, I moved both hugetlbfs and shmem over.

Well as you say below hugetlbfs is sort of a stub implementation, I wonder
whether we'd need quite a bit more to make that work.

One thing I'd _really_ like to avoid is us having to add a bunch of hook points
into core mm code just for uffd that then call out to some driver.

We've encountered such a total nightmare with .mmap() for instance in the past
(including stuff that resulted in security issues) because we - simply cannot
assume anything - about what the hook implementor might do with the passed
parameters.

This is really really problematic.

I also absolutely hate the:

if (uffd)
	do_something_weird();

Pattern, so hopefully this won't proliferate that.

>
> Hugetlbfs is still very special that it will only use partial of the
> vm_uffd_ops API, due to similar reason why hugetlb_vm_op_fault() has a
> BUG() and so far hard-coded into core mm.  But this should still be better,
> because at least hugetlbfs is still always involved in feature probing
> (e.g. where it used to not support ZEROPAGE and we have a hard-coded line
> to fail that, and some more).  Meanwhile after this series, shmem will be
> completely converted to the new vm_uffd_ops API; the final vm_uffd_ops for
> shmem looks like this:
>
> static const vm_uffd_ops shmem_uffd_ops = {
> 	.uffd_features	= 	__VM_UFFD_FLAGS,
> 	.uffd_ioctls	= 	BIT(_UFFDIO_COPY) |
> 				BIT(_UFFDIO_ZEROPAGE) |
> 				BIT(_UFFDIO_WRITEPROTECT) |
> 				BIT(_UFFDIO_CONTINUE) |
> 				BIT(_UFFDIO_POISON),
> 	.uffd_get_folio	=	shmem_uffd_get_folio,
> 	.uffd_copy	=	shmem_mfill_atomic_pte,
> };
>
> As I mentioned in one of my reply to Nikita, I don't like the current
> interface of uffd_copy(), but this will be the minimum change version of
> such API to support complete extrenal-module-ready userfaultfd.  Here, very
> minimal change will be needed from shmem side to support that.

Right, maybe a better version of this interface might address some of my
concerns... :)

>
> Meanwhile, the vm_uffd_ops is also not the only place one will need to
> provide to support userfaultfd.  Normally vm_ops.fault() will also need to
> be updated, but that's a generic function and it'll play together with the
> new vm_uffd_ops to make everything fly.
>
> No functional change expected at all after the whole series applied.  There
> might be some slightly stricter check on uffd ops here and there in the
> last patch, but that really shouldn't stand out anywhere to anyone.
>
> For testing: besides the cross-compilation tests, I did also try with
> uffd-stress in a VM to measure any perf difference before/after the change;
> The static call becomes a pointer now.  I really cannot measure anything
> different, which is more or less expected.
>
> Comments welcomed, thanks.
>
> Peter Xu (4):
>   mm: Introduce vm_uffd_ops API
>   mm/shmem: Support vm_uffd_ops API
>   mm/hugetlb: Support vm_uffd_ops API
>   mm: Apply vm_uffd_ops API to core mm
>
>  include/linux/mm.h            |   9 +++
>  include/linux/shmem_fs.h      |  14 -----
>  include/linux/userfaultfd_k.h |  98 +++++++++++++++++++----------
>  mm/hugetlb.c                  |  19 ++++++
>  mm/shmem.c                    |  28 ++++++++-
>  mm/userfaultfd.c              | 115 +++++++++++++++++++++++++---------
>  6 files changed, 207 insertions(+), 76 deletions(-)
>
> --
> 2.49.0
>

Sorry to be critical, I just want to make sure we're not setting ourselves up
for trouble here.

I _very much_ support efforts to make uffd more generalised, and ideally to find
a way to separate out shmem and hugetlbfs implementation bits, so I support the
intent _fully_.

I just want to make sure we do it in a safe way :)

Cheers, Lorenzo
