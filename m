Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBDF2BE7D0
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750153991; cv=fail; b=TFLVwuzwtRRtrMxW42YzWLnGpST8VpnEybxcgo6Uy02svr8XBIILNiJBtyDRNZY0vebRIbBmTXJ4n0vkOvGpuACIN1Q0gAaV3wEOPWeXzL7aVeCLLENYK876QafYElOzGg2WU3zycld+Qcw+MUm/qmzupgDgOPtNVmHSK9t4wSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750153991; c=relaxed/simple;
	bh=hoJ0Mu+HkLxhCZb+UF/DtJafZKK2i/VMErQ3jefZAYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FzI4/Fzn5jamIueXMXBig2/m4FmdUZyx1lLUmjMWRFJ6qyzoYdu/bVfh+NBWWyN1vuAxnvUxoK5Nmah2QfctDzKPVaVklt20ptWeoDOhFVMlcCb22VQ28UAPHKoY4o416JacLhan8wUQLi0udpDqdE7NE916jgsjH+dElyNMyO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PUkCVUYs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fwiXNbz7; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PUkCVUYs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fwiXNbz7"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H8twiA023672;
	Tue, 17 Jun 2025 09:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ksfkbwkkzfr2wqJbkT
	W2gs9BxdZ9o1zTOlFYKyPTTo8=; b=PUkCVUYsyXCZojccNELwbvqqunEA97J+M3
	2R6reSZ+urw+f9IjufIrTJTdvMnOWANwaXPd9zOyXMmmjL+KJeRJ+warCQM79M4Q
	NTvgdFww6uuX82gyO3pvTIYecP9Z4fy10oTtZfOQ0Se9E91pzmSv9zrDMdu5++5h
	m6VkZHikvmU60YmQM4KsA9nUTZ4Uld2u+EzDif9xtXnKZGZnBvygVX6lVT9NwdQ2
	5WPfdxBd5C7zXXj9DlW3Ti8573ylQbxPKCFAE80KBxHHSrZQy81sCLn1RFhaOIG+
	SBPfN4HHwmxqldIxHe887E+ohd/i2YrTI8d+97th99czL1hFR5DA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4n0cn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 09:52:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55H8jjNi000878;
	Tue, 17 Jun 2025 09:52:19 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2089.outbound.protection.outlook.com [40.107.95.89])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yh917m6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 09:52:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+GuRJPwiJYnbrnGnYnIYYF14scaGpJU0aAzAj93cMWeT8O+N2B1ufKDHzbMP1PABqnhMpJ0Im2X0sbPEvSBayvDCgWy9Ghd+GwvoMnDx4ahqe4u/HtPu9jwizupM8BmMRuW8b/KWl1f4kx7DlmQbrqEHZPnWtJ6NHJ0LCLoPeVrWsD1M9ykTwbsR8zvbnJw6rT8TIem49sLy7D9qxcKx4cHjqnZ2MTsyVv9JGKFYFg/V6viT+fpZF9ezDDiYIIeZNXcJRKHNxIN0w7fy3ky2k3AKnLXY9hk0BG1kP64TQkGlIAO4UyUREE2Ma+AY7zxUQEkAn49pGvMbBKtXv4JJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksfkbwkkzfr2wqJbkTW2gs9BxdZ9o1zTOlFYKyPTTo8=;
 b=MSMQhbRwNJ72D3sOanQvsjzsjckGaKroR+437Aq5ovzwsdXgH/Onv9X510Db7usmUCCioJ51ew0WYE+yoFtjuBF36K+Bj0mCKaawiFEpmGgA48rEXT6nTV308AmaxkCETRPD0MooAVjpldecIOR3TceC71tbJGw4/pMAuOMaGD1AzO2Q7o8dWFNuggJpe6jkTqa42EN0/K9qpisi2BrpRCS5UjrDCiL/DnStGsurtCUOcQGKqOVUXxBBJ8JA2XZd2bqFmwOfyOEu/I9YVAHHEGJndVpZiUSuHDoIBLNLkH2f+UHTBB4iOB0IArR0XVDHiif2Dyu99v/ZFVWYtzQ8Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksfkbwkkzfr2wqJbkTW2gs9BxdZ9o1zTOlFYKyPTTo8=;
 b=fwiXNbz7SgPHwAlih0yHth3KZXeH5H/1fgUjMLFcqH/oYssO/Jw80ex6WZ3beb39b00ItJBThsLGpA+xfsg/YxzbjSt4IIC+3sJSDbsZDB/zUmdghZPwQ2IlU7rjyDKCo/fdEwFeW6xIsnYcSiu9Y86dlRje5JLMerhH3tOImnA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA1PR10MB6170.namprd10.prod.outlook.com (2603:10b6:208:3a6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 09:52:17 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 09:52:17 +0000
Date: Tue, 17 Jun 2025 10:52:14 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
        Wei Yang <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
Message-ID: <b6ba1a37-e26a-47d8-aa56-91b8bbc70220@lucifer.local>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
 <22a80f22ba2082b28ee0b0a925eb3dbb37c2a786.1749473726.git.lorenzo.stoakes@oracle.com>
 <f24dd244-f188-4804-981c-8b7560e5a26b@redhat.com>
 <aFENQMQUDx4GeMuc@hyeyoo>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFENQMQUDx4GeMuc@hyeyoo>
X-ClientProxiedBy: LO4P123CA0219.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::8) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA1PR10MB6170:EE_
X-MS-Office365-Filtering-Correlation-Id: bf3285cb-80c5-4d83-d38e-08ddad84a4db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FEq8cJg74NFBxxkIqIOJm+Xwc05HMAK/0tzrw6b1z9Z/dXT+bNWH3FS2wQNe?=
 =?us-ascii?Q?iSH6t4zN1q1stfCZTBxSgm7bYfdCpRN/f88odOpPwFP+O1O4Aiiso3OFJwXS?=
 =?us-ascii?Q?vkkaC3VmuKZu3A/nFsk7dXRuhlERe+QQJKGmDA7eKoo7XdNgVUVbIakqEXu5?=
 =?us-ascii?Q?sahRYL04M3NsTVElRCYYajgmCxljLiLGo4AdZEdTTb1U4/EfhzGeM9uaJV1L?=
 =?us-ascii?Q?LjhzxoaQCRW7FLk96ulIQuCzCsMA6ZsIOfpw9wTkbJlIsGYaC+OswevAR80u?=
 =?us-ascii?Q?l3pYipUY4yPqpqg6fXNqgKuFinRyEwiJj0EcoUdLnoSVT3daeRk3+FhX7EAB?=
 =?us-ascii?Q?D1yJKwmj8tjzVjngxwuBN/Ki2PcDO2ogOkCMVD+LC9IbUfcs0pbtzPYRV9Da?=
 =?us-ascii?Q?+ABwkwDpKc7YLK7+k9COK1fhE84uAi++5ZDikf85hsjqWFV/K+dB4Dn2jbv/?=
 =?us-ascii?Q?RarnQTN2DG7wglWLA9xDyovEAAyyFVhAJWtHjctxSTlCHRNyiI3EDn9g8QA2?=
 =?us-ascii?Q?gM1R3iTob82EzW350ker/7113y9ftcOX5tHVnNRXo7t5BVV0ggfUgykHfEkR?=
 =?us-ascii?Q?S1Sb+hd9VE8alwbnFvFXrOPhvmJ3zZTrT/ZfLQ2rgCaf8ftZaVOoCnHUMiyQ?=
 =?us-ascii?Q?CPV1ZyBs1aSFyrvBeGX0gXxW1FW98MD7zJUMxfyoQ8HzmMbXtpiyyjuuuxs2?=
 =?us-ascii?Q?QV/A4FlMp8xTUW7wlyHUYeqszrtZhgW78T1YMmSqBIngXzaLvBqU1/2sBiUC?=
 =?us-ascii?Q?AnpUQfCHIgphlIKOhiUqsI8InhTDPvmNAf2cDn4E4Mp5mTUOB6Ht3VlI2QVH?=
 =?us-ascii?Q?Apq44znO0SLZ65opZyXSePjXnuA2q1yMrKV4MnY8EMsPGfTl1Mlq8pWYKexf?=
 =?us-ascii?Q?b+e7lNTbJZcUbhGEtVD7h5CXQD6X+BJ4YNYYamD41hEymszuK2EFRsMMQ/x7?=
 =?us-ascii?Q?JRZeJTV0yhQFsDwiOHfVmVCEd6FfIVcV0vMLV3Z+kPS3rDgCBGKdJFP4DlE/?=
 =?us-ascii?Q?vCByrhU/EuFS1KskAoUv8pr5i7+0qT3NWwfoFE9ybPn8lxdDbReKi+WjrqVS?=
 =?us-ascii?Q?VbEZg/w61hzazDjmJdSSHo2IAVZvxfamy/58+9/RcWbJc6pN/FZpWTpPawx2?=
 =?us-ascii?Q?XGV/CYFBDQjpegAqQsByBIAlS/3LPdZYBhNGi8GrR+e4GUN1GEIZLT0OXXJb?=
 =?us-ascii?Q?4zNBkM88X+gmzl1aFGchKWHKYAgVlX1WlUcVvQY3Bq2A7NEDKeGVoKIBQ9pX?=
 =?us-ascii?Q?BzXnykdi7PuUBwq7u5Xk9EtFuHa7RF2RwYUlL9aaaoQ4UBJLEZFR1PCUbLc4?=
 =?us-ascii?Q?rWRRje7qCc5thnEzCkopk5RAiR5LPQNAOwKr97uAqPBLrWhUje4+nKBJ8bAe?=
 =?us-ascii?Q?hhV9AcEmcfX0FIK1HTRrVy6tk6skvamt6qVmqsyoWesCrImbSUM/9o+N6q6E?=
 =?us-ascii?Q?KjEAJlzxwgE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PHHehrHyV/O6UbHU0ZixDdtt0aFvvVicSUn7HAusqoZP6r0UGNr3qZtKq8gC?=
 =?us-ascii?Q?GaNsBa1kkj3L04EMweNxIsaXuUqYi0cDDTJGc/d4v/aUh2MB89YkneTwcWUe?=
 =?us-ascii?Q?pUB40yA24n/p4kKJ4d8FIPlK9XQObU72lPk8FRjuKAJgt4dLpxwkP5xP23dg?=
 =?us-ascii?Q?dfsu1SL/1uGNRw5nXfBellrWbM6U5/Ov9G5f0ecKQlTEQJ817Gr/x3yRmbmQ?=
 =?us-ascii?Q?xdKpCNPvyGyP+n2/GeDh8c8hYURzFM7n4RY/vgdlYcUlOw1EDWoMzWWprfDH?=
 =?us-ascii?Q?/iqww/ClzMRBV1plPVjB98Q4c9i6zf19EqalERjw9qDnYcE/gd0uP32RCRXS?=
 =?us-ascii?Q?dnl5bQU6dXAUI3xzHCTM8RcKvpxjDaScEsTzGxyeMSFuRwK0Kvf4vERDOja0?=
 =?us-ascii?Q?nUInhjv8yjrvPe+0BFsBYwyhklpECBXcXsQz3MUpt3qgK92UCdVv9TRwoDaJ?=
 =?us-ascii?Q?q1yu6ki+h/gsXlu6VjHZZWpavGPhQ72g8USMJ/TdV4XhPwmTof6EYYLmJrBq?=
 =?us-ascii?Q?ZUrs1fT+0F6k///JwIUE7TsZwB3kUvI5Q4paa2u4riAtf4Lb04dq45NwGr0m?=
 =?us-ascii?Q?eSIo0B7mmJuTIe5L61TaI45WZqm4nkLbUIvYxl56X43weQAM/Zr5/wmxSdj7?=
 =?us-ascii?Q?ES8xivWs7SAUPwQ6BVjRnp8pp4chIEYtdiIjgBUaN9Y1xRCkuCelRxTa5a5Q?=
 =?us-ascii?Q?1w8BOAH2Kxw+4txO3YYIJqgcMc9z4o9ZcAX+uJMKRuaivpjGUo6jr0Vf3BB4?=
 =?us-ascii?Q?YhyqAGYzdrglY3Ej+DxuFNnW5J5LivrBNxFVmb3xq96Mdg8BaawRKTJqpCyF?=
 =?us-ascii?Q?CNlKNWk9cDdZaHMzOD1JK+1rClSlYPnejrYcIAnuyMVqCI2vOKTghY5zT3Cr?=
 =?us-ascii?Q?xS2R6qI3drxIfEcfVg3pD2MRe5rFWnATLoOD2vEO3Inw3HPh66rHTgNhvnry?=
 =?us-ascii?Q?1QE7lQ+5t1wvF95ejeGcSs3cdj2YcF6ET2beHDMMp3N6Z3nMqR5W/QtRSraL?=
 =?us-ascii?Q?zeY85b5YaHN29X//jAW4KPDEe4jVQ96UrDnSTdZ1LJjmtMUvt7cS0PENXeDd?=
 =?us-ascii?Q?CDKWhXO8FCN19XljF8BPf7Oi9eIA3P1ZPzJTleD5NAzPCS3Oat7pqkvLrHAz?=
 =?us-ascii?Q?c/SxbZYRwzRLhQ9h41Z1zPXJ+E2bQWOODxaYnO1d3DHSa3JOmbjhucYMmlA4?=
 =?us-ascii?Q?tAu8tByC470EM0jM5UrAas/hM3iUL8lOv/oMwdAU3TdRT3PWaX2NQISphRaL?=
 =?us-ascii?Q?Pw2CRBGhEUkTYu6scvvXE5mXXRQMWIwzQ0cJ4bVI6kN9KwP1kitFZAKE7RoY?=
 =?us-ascii?Q?2cbHpHRhIAa7svaGcHb9/uvDCD/x3Xtvq5XSbtO5L/k8qyLnpoF4erHMCZ5z?=
 =?us-ascii?Q?2QUf91z1nDn3uU6m/qteoWkBJYEa35URO/xwXGQynxAb8VJLZXOMFe/L8kF4?=
 =?us-ascii?Q?Bku7YJj5/q1KF8PsisGCFqS2AjWgVscyx8S6CeRKpt70gtC01ux+2vKF2qc6?=
 =?us-ascii?Q?jka+kJC6Tz+4QlUhWKnD8VqGJR+ERhpm6o06ZHzW0eRy8l4fIGlO447QzmN3?=
 =?us-ascii?Q?6jKovWKKzhwxky3tdIp2tCbvOlFtYWFPSKNXgTYHKXiNFzVDlW8P7OB2BFsP?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TpqKY58O/3mVolZEQ5o26pUwFUuSkhORWKQJsGjED3EIZ8yWDiaOUevUsxxZAONWFwdZldfjyzuQt1S5jpbWW4hziTC1aHW5sle8OVnevhn9wtNIBw60EH/PZqD4PSY9AJ+1pCa5PMlDu5mpfqrdK7DLx8kcZbmTOEv6rEJfnxZ9+78k/6beR2m1Xo9hJCpD8xXIgkRM49rKFRCOgIcoP8QMmJEgISi6RccRBEoy61+PmhpsnTr/7TuYOFwEWDv7Z46xglzvnmyI6w3GAjVtmoM7oWRv19w/bTKyBVQJOdsr2vVleWVc1HGal3I9VHflB8kf0CgdUFiR9K0C6OwfHi32XdQWNoqqNbQSNlbLUb11/2fFo/9jWom4mtITWdZ1OPvQXOXZ430a8HYsvfaXo0KC7H+FTD0tCu5c109/2JdDeaYSGHuuxx3+Q0aQF2wkoqIUdWBZBoziGuDGjV5dTgiPwatyVcDT1LMxDpawV1Nor7tocOt7US3b08v29gXe8NUbqqIKuQMZY3mOWgyt1MfDmTNm7Rr9ghJhjnURGiE3wjNdyBRZDqu0wlkpr5aZjNshV9kYJI718YZ9flp8mY905tOOJtTPLmTFoHkj++U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf3285cb-80c5-4d83-d38e-08ddad84a4db
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 09:52:17.0354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6pksVLB5tvFxvSzY6JV6rKinWr4obGuhvsCwZnDKVvWB75h4AjT8ABPytfafnP70iLlQcHxcmmaXxvmagVtRw1jXVdPbTlbwHZ1hX8BU29w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6170
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506170079
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA3OSBTYWx0ZWRfXzIaHsyv2gF34 wPOodrqrD1DV0CT7VX7qxTyo7x6bujKY4JJikedFkLsTupgsq9zpG/F43l9zOZMA3vM50ECAzA7 4O71z0Okau+VmHe3JgGIHZtnQKqZ/U3lR7QdZ97EZKNd2tW9Y+vs/QaI+OnG98UHHx2SOVKjwhf
 8vvho3Z18XauF1/97XS5Dx2u+9aGLauxdqrO9lSlguBP5QoUhck0YzRDzO/GsUR5r3zreBcwYpA bONQkPC3NcVDmL2nl1zId3cuxCk0XY57Ab3xfZDjJTvEYwyEmvN2EOdEzzRLKVyDvmfGCpXWEsM 1FdaE8sZfQHDpOXGHmCKxINTQO9OYstfTvVXUff4BLFfGQDc3oNdezud6qynAKVMmezdYbOGfm0
 LBXNlNTmwjePRbNgAyyMk9AtRfE6ySDxqG5A+tbj2JNHO5iEMR69rvzWd+Jbde5M8rQkrBn0
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=68513ad5 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=5IBsgrqq5S8k4FeRuVIA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206
X-Proofpoint-GUID: -fUV9k7yu2W03o3YZ0yH6HKCttII1QGG
X-Proofpoint-ORIG-GUID: -fUV9k7yu2W03o3YZ0yH6HKCttII1QGG

On Tue, Jun 17, 2025 at 03:37:52PM +0900, Harry Yoo wrote:
> On Mon, Jun 16, 2025 at 10:58:28PM +0200, David Hildenbrand wrote:
> > On 09.06.25 15:26, Lorenzo Stoakes wrote:
> > > When mremap() moves a mapping around in memory, it goes to great lengths to
> > > avoid having to walk page tables as this is expensive and
> > > time-consuming.
> > >
> > > Rather, if the VMA was faulted (that is vma->anon_vma != NULL), the virtual
> > > page offset stored in the VMA at vma->vm_pgoff will remain the same, as
> > > well all the folio indexes pointed at the associated anon_vma object.
> > >
> > > This means the VMA and page tables can simply be moved and this affects the
> > > change (and if we can move page tables at a higher page table level, this
> > > is even faster).
> > >
> > > While this is efficient, it does lead to big problems with VMA merging - in
> > > essence it causes faulted anonymous VMAs to not be mergeable under many
> > > circumstances once moved.
> > >
> > > This is limiting and leads to both a proliferation of unreclaimable,
> > > unmovable kernel metadata (VMAs, anon_vma's, anon_vma_chain's) and has an
> > > impact on further use of mremap(), which has a requirement that the VMA
> > > moved (which can also be a partial range within a VMA) may span only a
> > > single VMA.
> > >
> > > This makes the mergeability or not of VMAs in effect a uAPI concern.
> > >
> > > In some use cases, users may wish to accept the overhead of actually going
> > > to the trouble of updating VMAs and folios to affect mremap() moves. Let's
> > > provide them with the choice.
> > >
> > > This patch add a new MREMAP_RELOCATE_ANON flag to do just that, which
> > > attempts to perform such an operation. If it is unable to do so, it cleanly
> > > falls back to the usual method.
> > >
> > > It carefully takes the rmap locks such that at no time will a racing rmap
> > > user encounter incorrect or missing VMAs.
> > >
> > > It is also designed to interact cleanly with the existing mremap() error
> > > fallback mechanism (inverting the remap should the page table move fail).
> > >
> > > Also, if we could merge cleanly without such a change, we do so, avoiding
> > > the overhead of the operation if it is not required.
> > >
> > > In the instance that no merge may occur when the move is performed, we
> > > still perform the folio and VMA updates to ensure that future mremap() or
> > > mprotect() calls will result in merges.
> > >
> > > In this implementation, we simply give up if we encounter large folios. A
> > > subsequent commit will extend the functionality to allow for these cases.
> > >
> > > We restrict this flag to purely anonymous memory only.
> > >
> > > we separate out the vma_had_uncowed_parents() helper function for checking
> > > in should_relocate_anon() and introduce a new function
> > > vma_maybe_has_shared_anon_folios() which combines a check against this and
> > > any forked child anon_vma's.
> > >
> > > We carefully check for pinned folios in case a caller who holds a pin might
> > > make assumptions about index, mapping fields which we are about to
> > > manipulate.
> >
> > Som quick feedback, I did not yet digest everything.
> >
> > > @@ -1134,6 +1380,67 @@ static void unmap_source_vma(struct vma_remap_struct *vrm)
> > >   	pmc.new = new_vma;
> > > +	if (relocate_anon) {
> > > +		lock_new_anon_vma(new_vma);
> > > +		pmc.relocate_locked = new_vma;
> > > +
> > > +		if (!relocate_anon_folios(&pmc, /* undo= */false)) {
> > > +			unsigned long start = new_vma->vm_start;
> > > +			unsigned long size = new_vma->vm_end - start;
> > > +
> > > +			/* Undo if fails. */
> > > +			relocate_anon_folios(&pmc, /* undo= */true);
> >
> > You'd assume this cannot fail, but I think it can: imagine concurrent
> > GUP-fast ...
>
> Oops, that sounds really bad.

I don't think it's quite as bad as it sounds. Let's reserve judgment until we've
fully analysed this and considered different approaches :)

>
> > I really wish we can find a way to not require the fallback.
>
> Maybe split the VMA at the point where it fails, instead of undo?

I don't think this is actually possible without major rework as we've separated
the VMA and folio, page table parts of the operation.

Let me put thoughts on this in reply to David so we don't split conversation
(pun intended ;) I think we have other options also.

>
> --
> Cheers,
> Harry / Hyeonggon
