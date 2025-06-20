Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB0528C2AC
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 13:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750427517; cv=fail; b=OpfNnL8IXylz/POfIxV74vvQlvQB2AJ8clRhILQbAj3/ZdrUKqpn0c4HFxr+9GdJGfgHKoI6TAKRaX5IlJ3o1J5GS4ZdkJaJU3PAtDdo9sxi8h+V/rejiMxPF1ojnOjAj2U6wlw+SP2aVIjX/+46PdIp+0RMktY3jfS5YBIkj/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750427517; c=relaxed/simple;
	bh=FQEpt3G7wfA2cAhc0XO6A3nKISpZOTx91zqFsNwZQz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GCei9RNbjBxYxM+ZWFC/RMPFkVfXmJxRI53Y8vbsDT+fnHN0xm85EVL3crDGDFZ7Tadwv0ypEM3XTWKN33PxyQG4TcLmrQP3ZjSxDYNGFTkZsU8A19yqpZcxg6u32dmjCMbHoUvhsH+dg8gasuaxn1Dj0BXK9+iYbj3ANijRCiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VjFX9DNp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZH1qUg22; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VjFX9DNp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZH1qUg22"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KDWage012678;
	Fri, 20 Jun 2025 13:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=h7c5ShxJwLRmRtaAk5
	EyByM6vKNSOn2wfjFpAjtTSDM=; b=VjFX9DNpXFMKIEsEDuFMwS5mNL8lpTMIIL
	fLzbTn70R5GwZoncvlI6yK4fDubjashHnTNmhJ759KSPZsmxMs6ye2fKaHR/JQLB
	IKugK5gZizXFnSL+IlFuSPaRISB8rJTzk4jiu5XZbqO5giQizM9dIzdJ9qnXLMyr
	DRfbjpXgvemQ/4Y818yTXi1P4zitPBrhzFXQuqIf1gHS3wythVYgqCSflxWZfvVx
	LHHPGvapWbptwNk1orKLXcytw3X99W4LrnYV+acwL0RIZO+wCa8y+tbMCym05h/n
	j2BVUKe13xagXZxmiCwVWJ2sOY0soCkb+RJofTZPz+FfltcAvYSA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790ydbnnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 13:51:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55KCUcOm021712;
	Fri, 20 Jun 2025 13:51:30 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2071.outbound.protection.outlook.com [40.107.101.71])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhcq3ch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 13:51:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Igj7bsGnnCIiltXb+jrBiucZxOoJCOzcX3oTSIIYYQGbvo5MnziQHpakL2XLm9QhcpfzgmgnYOMsnt6AQmN5QNqrPFIS9yzBfW04yNcR/qyrfrN0UayakjU/QWo+JA/vUTGWX8auOTin5P6zmItTcbXYlz27Ks/ZvPLNpBGwjHaVGa+92u7PWkTQqxb9Z4XvGLzTKnEU0/TeTWWJ2GKxKGUZIfAukVyT/nwzE1ruQSorVLkbXObLMhTlsJ/CSr81LqAJQa5Ngw2ytrnV1dEX8eW4ybvcJyrRSxl3rfYDlVgA63K8BU3XZAjtiQuqY0T8q7fwNV5EUwtffOPuyDU5HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7c5ShxJwLRmRtaAk5EyByM6vKNSOn2wfjFpAjtTSDM=;
 b=Zkkrcrt80Tm9p8SJGnAXki51Dn8t35o3r2JhDjo507187dp8XIlAbZG1E7cknNw327uTZlsoVENKYIGcOSgQ0a8jePlWZwcWyHVNGyV2gf0UF/mMjdmvsiDrvueq1ZJGsQUaJwt066qa/DD63Q3bdZNi2NSqOgDEHG2cEyotYPSSnQkxCAJbo+hMW0sYRtZFQ/eQcOuH24WZUbdPorM5xYZqBWKAiEcCmqn6SSp7UyDY5xOObBxEj6wiY0Kq6SBuYoTD/poogNpUMFq3kYI2CRJYjlG6RS1yIS57GLkBygaoSH7rQYEMjB1ahl34elOCTADERYWeMCtEPuSPWnDoeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7c5ShxJwLRmRtaAk5EyByM6vKNSOn2wfjFpAjtTSDM=;
 b=ZH1qUg22gTPwL34elemUyvavMLvxmPpBOjPpCapndVVta0NXDHuf+aPTGeBTiW4tnFCQjop46Gtbs2Y6JvvtQaRPnZNZSiWGfWi75UWBAlc9D6iIFcIxsAZnh1Dx5o7qnVKbDz0rBybJAsB/+Jqzwq5emZR8OE5Eq0uMCiFG0Eg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS4PPFAEF42CAE1.namprd10.prod.outlook.com (2603:10b6:f:fc00::d40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Fri, 20 Jun
 2025 13:51:28 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 13:51:28 +0000
Date: Fri, 20 Jun 2025 14:51:24 +0100
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
Subject: Re: [PATCH 3/5] mm/madvise: thread VMA range state through
 madvise_behavior
Message-ID: <af38005f-b726-4ff5-8d6d-a69175cc14cf@lucifer.local>
References: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
 <a520417243ce7f8122de05a0420f964a922e392a.1750363557.git.lorenzo.stoakes@oracle.com>
 <7b08cd65-6797-4678-9c24-a3ffad7acb53@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b08cd65-6797-4678-9c24-a3ffad7acb53@suse.cz>
X-ClientProxiedBy: LO2P123CA0088.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::21) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS4PPFAEF42CAE1:EE_
X-MS-Office365-Filtering-Correlation-Id: 84d7db10-e5fb-4206-4b99-08ddb0018df6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ec3k3iWwJY4dQwQi2is0F2RnmLJO4J3Q8Ubuc/szeizssGwya4tzORgS8sSI?=
 =?us-ascii?Q?3zivPqtFmTpXv3sw361n1t4K6XCCz+bSe/zacSUjZPJm2DDsoTwS/rCmCi0e?=
 =?us-ascii?Q?yikvhI5dHLC780hX4SkI9Qev6tHTnN1cAvgZyC+iBmOi5StNICADQxdYI06M?=
 =?us-ascii?Q?0UZ61P8fGpQcMcYHnSJMbxY+8At9zx+vHBXmr+myuFGleZ2yuGzVhgjqyL1V?=
 =?us-ascii?Q?jJ6PDSK/ZNYb13JKjNLIGmAOt2DYHPKhkQoxhXV+aNVc3FEWxYp0zBkFBMM1?=
 =?us-ascii?Q?1Uce6HL0yQ4eIe2fEyAD0AfP/TM3IkEn5w2makH06oZH/9ZtCQRQpX43jlRB?=
 =?us-ascii?Q?khMHMu6qE2Vpv0nYDVReHP5eluGu6A37pkLz/Ku49zTjC4bxs86K7gSy1TKG?=
 =?us-ascii?Q?CjKV30RFXk6zClxKcfIHUFDxJnzKTI/tdJ8gy33sgbOHFNz9zdlmZloQdzwT?=
 =?us-ascii?Q?GsrWWdNopLz5CwvARbq3mlinLSDJJSwLleqx4nZJ+pAQbRSbAlf/6l7CW8qV?=
 =?us-ascii?Q?+XbGq0MfdpKLcQ9eU7hLFkK82QE5wb7TcV71idb4h3QcQnwKDkqI+k2sgOYL?=
 =?us-ascii?Q?zisXHpZi6jJxSlf5JCdUmfqiVOLHqOEd7fiGc9mWlzDXJnrrtz9c8AcR8XWO?=
 =?us-ascii?Q?Csm3GcwesBDhUSBsDR78PZLdy+0TXFNnI9Aq7l7nC9iPCJTcRax7g37PgxZ5?=
 =?us-ascii?Q?WdCkd30/tK9MLd6bJe8KYVyQyc1O2MCWOXDOWJaxACjUo0nNzgDlVXKEP1Mx?=
 =?us-ascii?Q?J8Y1nSbKe80IiOxw94hqpG3qvSMcUVuIFLYOjMd48Fv6EkSiPdJ8kDGafWCl?=
 =?us-ascii?Q?mXgJLgo+5iBVXIY1FVQYYMSBsbpnK/WIkFfhrLTGGVoTNC55OhD7E/Jv1PIh?=
 =?us-ascii?Q?wkpuATETwTT5SzQhFP/XsWo45aArrM6PDmtMiP3roMKtIxgOXnlARPzPT7Ik?=
 =?us-ascii?Q?fCYItZXOZ66WKSs6rDyYKDEk3XkLHJUl31MOE16tdISuqwHk464dV7YgV22Q?=
 =?us-ascii?Q?bV5ZW5AmL0CxqNC1Jq93lqAEew0Y2k0vZvFWKNffEAKZZCYVQKFob5C+TPBb?=
 =?us-ascii?Q?cCiB+qcH9C7kVv/HE1i3hhHlO3L4TWcxNzkb507da91+lgfG04s9pB4GWs/u?=
 =?us-ascii?Q?J+twpvZKMFU1kFJBi6/WfOBuZGL6zowNLBcW0jC3htsVHakGXV57ieL0gn5I?=
 =?us-ascii?Q?fX9RDusvEf6woW6mKtgnpnhv5XWF9eZ0jzTBfsvJAaSgth/GdYJAz9fDulOt?=
 =?us-ascii?Q?hs/cXAVkiTdp6pQRxUspIjV8/SnqKiL6U4kzGX+p1XCApJ0XMHgoZN5/IaUy?=
 =?us-ascii?Q?w4OfiGDtq+8mVp6PFFPEh2D9phRhlsgNGw8Tfk71aMsvLVXFPAZo/3A6VLRc?=
 =?us-ascii?Q?YELuxR73BnAdheBgQsvewJXmCKc+8iTQRGVvBnV10DwXS4xEyZZ/UuoaZVRk?=
 =?us-ascii?Q?MGUce85zqvI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DqUpq/4fA5BMBZ5N2ciGYulUh6Z3OV2E9qqOYYYB6DFvMWUYaG7JCHsB5P1U?=
 =?us-ascii?Q?to4qpsEM0gzsmsdVz/O+2XlgkgkZMxswrA9X84H3/3Q5LmnIso+Vb04Kqlad?=
 =?us-ascii?Q?AxjjKMs19t725d8ks+U3w3tBswx6fPRj1nsb+TbvWYAhO3O+/1MK3h2+I7vz?=
 =?us-ascii?Q?shgYzU9XP1zK/IZOU2pXEeMgrYob4GgJMmfX3mo9sJ4HZghsVGZ/HZNNb0Yh?=
 =?us-ascii?Q?m8Pz0Wg5RWFiPNTqe/3HSoOXJQ50AeJ3fXdAbKfHYbVh4yD/HvXzY+Jdv5wN?=
 =?us-ascii?Q?fgn8PWe4xaL3CjLHh4WnsEIJDiTYd1tCTRKIYAPcjJwM0JjSZoICxprecU19?=
 =?us-ascii?Q?bNB5HZIac4ddeQ04OPNKHirDA2yjn8OftEwMxN7xKPm60Dj9OonFqg/l9rml?=
 =?us-ascii?Q?BbXfmsPBqj/VI67g1RLT+Qy5pB+wrCfuJ0IhgdZj/ou67fis2BraFPG9pV+N?=
 =?us-ascii?Q?V/lgBUWBMAROvE9NqJNTMbv/I95q6WwPuDnD37ef+jCU4BQlVAH+4cHMUSLs?=
 =?us-ascii?Q?LBSnSk/zDH19M7wZkJaVAmrFek/4FctKza+/0/jpItIxgzSuxMsSyk/PXQBA?=
 =?us-ascii?Q?Om1SBVqnKxIhtDzOfyccKn23DxQ4lVvap3+U4kg+i/G54gopdOtifgUpKQPa?=
 =?us-ascii?Q?muzJ6Qq7+Lijhbl3kxqtmkj4+jy4+FUUdQaDdhI+/Nby5Qw4friLKO4zZad1?=
 =?us-ascii?Q?HX+E9il7W0JdcGm9E9QMLlX7XBa5zIm+WGfkO3pdtK7PC3rwGG1CexO7REp5?=
 =?us-ascii?Q?5EAnTqW8gtkjsrZ0zHrGPK50mqgdprl7hs0SMN1AwTBlXejC3OBCpo8yONNR?=
 =?us-ascii?Q?miACEB52S2K4B9prGwWRODL3so6I/9kHaaxUI7vdhPxR43uO1u354K2AsNFp?=
 =?us-ascii?Q?n9+5tvpWeWxWjSZ3sMECVa7p5x7AdcnBRd2A+8w8pompp654EJINrly9XJ9n?=
 =?us-ascii?Q?Q5m86QAEfgMYBUEbQek+rBIwHowQhWFwv7x4uTCaRzFd0U/1cveTzemWNekz?=
 =?us-ascii?Q?4CJRBtv/ecceifqhFDu6TnVtKHBRgxGTf+sEu06cGWuCQ3DEJ3HkqtKZFtvR?=
 =?us-ascii?Q?KnO4fOXfTEDlSKR3qUJ6mRkcuDM3RPD4f7mHTOy+6OMCNklR+s1oED2RqXst?=
 =?us-ascii?Q?k9COIYjFdOyyRAvecSdtib0fxlpd1Qz1UQyJVN7b6RL5BUVKHjwrMV3YfIqe?=
 =?us-ascii?Q?u8NFIF31DnvBfzp73N5ORWLL7JAg104OSDk+t3RnGo7K/qQiqkrL0rkm1RYV?=
 =?us-ascii?Q?ZEIJOUUdL28wsggqEGlDQ8FuvHfUU6S1Xa4dmCA/eOabnCVVQ0pi0RKbHlly?=
 =?us-ascii?Q?L/7Ev/9TvizeE3iQtmySETyJ++NX4iuZy6iQjvIzBeXwwVLP2xh35srXoNBf?=
 =?us-ascii?Q?n30zsy1s4iC9pLP4LABRai2C6X4KymRvrBLfug6dJvgv28cayjvr70NLAyxp?=
 =?us-ascii?Q?Q7RB2QMQJIR9ZtQ52Y4MindFZZT4MIlcRjRXZvl7hsTLY5kjolL+01kE+POU?=
 =?us-ascii?Q?Ev5VYM5/lwVUsCz7YFSf6zVaZHYri6RntQ5dP+N3geFvXX5QkvXPxbe2AVW7?=
 =?us-ascii?Q?56GXPBaM4NJbVqn6ibueqX+RTUrItRzmAMe9qOK9W1qDxeKu0X/d0KW4vX+w?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yf/zncclkJlf7tJwJIWN3GyAw/FqNUjksmlyUdto//sKf3S90kMMLdGsJRlCa5rM9K2nC7II4EYxb6bERPD5W+yv3EyvXkQGGhK3KamAmc+RQf4l5oyh0gLy3eJ7IZz0vH4kpUNDpmOBTzFdW+uwKc7R0cmQ589U8PXu3iGTsWK4Uui81DTU5G1srhR2YtrlqRAWwR37mteJMzJ2m2cqzdoKuyNgmKRo9xkOLKTivGPwfU4WAMFJ6YhSayCbiAvGboKWSdHn7meomDoaY2fVSK5J87TeajUJOYloLGxaOKv1c0NUqwWRSf66biz8mPk9cRNjR6hVrRFrSfUk1C3yojUFsRrzMNIXq49Wr1zwAG/6pJAnIc3Yz2dy3ONHrW55nOZEzo6qKYJRjzkIPRIfoFnj1zIWS5Q9FwtlaLmfnRYEe+fP8kyIwTdqcbfVXA+568romYKULWX1PhT7F5v8J2NQ17Ga5jkH+cDk1drFGsqnhsXBJ9YAEP1W58yyxP5Y4+j126DiDI9M1QnZnH3/0YBL3i6GXYgDPQYIznKTdEafqG5ibzJYbygfcgPxh3hwNxCBJDg4CTOvqkASACU1Bwz6YAglhwnxcmuuPIHQDDQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d7db10-e5fb-4206-4b99-08ddb0018df6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 13:51:28.0453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2SR/38zc+bBbpWlGVKhIhASqSdNJXBr/imqwELBv1z68KgipSVsjF9Sf5b3T7Pye6/0vovaCjg18khVOMuicB3jXdKnG8XzsWCpLlq+w/Hc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFAEF42CAE1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200098
X-Proofpoint-GUID: YjpfwAjUTAGiBdCVdzvRygC4Zd9s9T3V
X-Proofpoint-ORIG-GUID: YjpfwAjUTAGiBdCVdzvRygC4Zd9s9T3V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA5OCBTYWx0ZWRfX0stm3zTowOfP QIUut3B0d7RDGsQfGO3jDISifDGNQXhOX/SRP8OHkcdnzNNC3d5T+5mg9FzClil0a5SCyM08RiX 64/ZMl9IYiGgRsNuhCHkTvE5QAIGzztgbhqLsd+z/QyNZdQwvKBFBQe7EQGbfxJOfA/bgSq6BRp
 ZqKzU0nhdcL5Qz9RBaCG9zOz1mV7mRt0Zysg9+YVhJIDvFOSq1fzIcqO28OpGbGYAyocNvf+FQa HThXIkXNVw9FGl2YweqbEZKz2+zYID+AbqFXpt6oase6I7bqE5s+zb+YJzPCT0fo9Ql50dTmh03 SRzl+qRIzqVM3IdJRN1ao6au0k492MA2VR8ZqftpNI+Cn1AQgi5/2LxnHi1RrLUrDVZSJJsWBlq
 8qu8aEj0xJ7g5dAgZJAurfhl0AFcEVTd2aCjgK5DTwW42+G+uAJqJvMddOupGv/Fe/Wl20uX
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=68556763 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=g4uJDPAaVEB87dgUTR0A:9 a=CjuIK1q_8ugA:10

On Fri, Jun 20, 2025 at 03:49:31PM +0200, Vlastimil Babka wrote:
> On 6/19/25 22:26, Lorenzo Stoakes wrote:
> > Rather than updating start and a confusing local parameter 'tmp' in
> > madvise_walk_vmas(), instead store the current range being operated upon in
> > the struct madvise_behavior helper object in a range pair and use this
> > consistently in all operations.
>
> Yeah much better but it still took me a bit to understand that "end" is now
> the original range->end that doesn't change during the iterations. Maybe
> make it const and comment?
>
> > This makes it clearer what is going on and opens the door to further
> > cleanup now we store state regarding what is currently being operated upon
> > here.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

Thanks!

>
> > ---
> >  mm/madvise.c | 101 ++++++++++++++++++++++++++++-----------------------
> >  1 file changed, 55 insertions(+), 46 deletions(-)
> >
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index 47485653c2a1..6faa38b92111 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -58,17 +58,26 @@ enum madvise_lock_mode {
> >  	MADVISE_VMA_READ_LOCK,
> >  };
> >
> > +struct madvise_behavior_range {
> > +	unsigned long start, end;
>
> I also thought multiple names on one line is only done for local variables,
> but always separate declarations in structs. But I don't know if it's
> documented as such or if there are pre-existing counter examples. Consider
> it a non-binding agreement with Zi :)

Hm I didn't realise that was a thing at struct level, and since Zi also
highlights this I'll change it :)

Sorry Zi - my confusion, I was thinking comma-separated wasn't just for locals.

>
> Thanks!
