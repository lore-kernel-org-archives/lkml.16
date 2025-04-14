Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578E223D28D;
	Mon, 14 Apr 2025 14:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744641532; cv=fail; b=JbPzQgtvXQ3VooRc5p90QyoOWOLXFkT9GpuQ30NdwuKMTt5u7ktjfEnGqhZyM8IJcqSIm4egRoHkG1k3A7+CsiBoAZ7mOJlesh2xehEGhx8Q3XMDdtVjHFECgsDHy2g17t1uo7NBDXyKfB+ME7S+n4GL+lix7qcmnwp+88Omtu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744641532; c=relaxed/simple;
	bh=kilbH/qJepP3f+y5FNa9ZKblef/qL+wyY+94xrrPq9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Xm70WbdTzaZL7G5DiG9PON4K6McQmDjzy1swiCIBwudhvy5D/0OROvoG5N28s+Ks2VygsEeMMQQaz1aMr9LX5MTLv1ftJtCqI+UzvZLYOhQoheQ62e+LnQcu2+3HMR4c6pLW1vE2IB7Nvr060yafetwhsbEs8sAMHDdjwGskQzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YXACKSO+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QZk57MuM; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YXACKSO+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QZk57MuM"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EDux0r009089;
	Mon, 14 Apr 2025 14:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Yii44AUfNmlvXFLAwv
	4tJf2uHC9RSqd4MU8f00jfzOg=; b=YXACKSO+Gxo+6pDCDHo+HF1f0VUp1r4DAx
	s2MBPpUm1NTONP9fCO2l5enLfLq8YGDdoNvwwfuMAH8VK9D0Bkhs/oihKDkoY2MB
	SBl0dKv9aW32s29lCOXjrdGEleeY3cKx00J/uwW3zjtV2ifCGB3OjTLv38FBFoZ7
	hCg9FL4PxYkbVeO3U+7nQhaqywnpCt1RV4wTtftZ2GGFiB7VtV+TpFKrPScNOdTA
	fewQlvtxv+A17d7gl/F2zbgb++YFyeeOhLqScSsGtzbEMS7RT8CyyEdHgNrxC83C
	LF4XKc2rmauHCxJnq0f1NLGa3sCa93Frq1Y2YcioTEzZ4Dv4UGMA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4613pp03d1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 14:38:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53EDqgJM009163;
	Mon, 14 Apr 2025 14:38:03 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazlp17011030.outbound.protection.outlook.com [40.93.6.30])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d3gkpdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 14:38:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQdBlXEQQWPFNOGJFQbCwzvJznPneWpPLobFHfzvT4oR8/huNoM/X9bvwAMdZWvtQUrznBK61Js5dzQUlfFoc66229Iirffq9tp6/gDbWBNxy5PhOFaGjg4B6lZ2B8te8QBKG9NZNbzCto+e4Twt/FT7lzc4G5nRSBYFDpzS/9yekozMSx4xhU1XcbbWoCc0yYTQaKZ1fZKZCIsluuAtygC8hXnHicT9VH2GiRAtgzkdPk0hMYui5wobSSI7e8gab6fBFtjd9h4eOzvocXahyh2XgGkB94R/tIav271ESTC1kbWavugXsmUgz0hnufvw+ZowF9JdIwP4HC+DMiBO/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yii44AUfNmlvXFLAwv4tJf2uHC9RSqd4MU8f00jfzOg=;
 b=OCxK0tM9LvvQ3jpy+n2abhYXFirpJMaNFw2dgvgN8qscVfm+uTiScfKCCyiFGbFT5xaZJ0gtX/jsBv/bR2bZ5FOn2vqXMk+Kdq1jyY43A9nJMMrSuHgVi+QbgXR+w6RQC/OGYa3mu6HyWuVmTlZWDYYaA1l61nzhlqxIrSo6zZFsCKb8Z2PuYJN9oHp57xDzVtznRQiz5poB5O5wA3zB7dnXF5cIqDP6P6tSzcQ51BFagSU1edMeeNApUb0pBWYYw165ZIOeRNODAkAQnFO7H/yz6e6NXaBgcj8oW0aHtPzSodlMDz2a0CqiDsjjsveKcZB2bQrnq/lsi16V28L8KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yii44AUfNmlvXFLAwv4tJf2uHC9RSqd4MU8f00jfzOg=;
 b=QZk57MuMGk3zl9NoanOH7KaiH6yA8aMaHOtN5eFMWY0PatazIW6rt2iMi6sISvMOCouQPTdn6UXmfnCX1MUtVvD0qEKeGrB4spnudF0VOlrnc1CLehQGXvRmHW3AwIbzPp5k1f2NLClLnKqgBT77rbFuJQ02h1I37idSEDXDH18=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SA6PR10MB8160.namprd10.prod.outlook.com (2603:10b6:806:43f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 14:38:00 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%7]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 14:38:00 +0000
Date: Mon, 14 Apr 2025 10:37:57 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sascha Bischoff <sascha.bischoff@arm.com>,
        Timothy Hayes <timothy.hayes@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, ast@kernel.org
Subject: Re: [PATCH 20/24] irqchip/gic-v5: Add GICv5 LPI/IPI support
Message-ID: <4vtbkgtp5c7vdfdzof46l3fjwwsd66j3tynxub4png57zcau7h@k2treu5vgn42>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>
 <Z/jgL52ZVdcxTEkP@lpieralisi>
 <87plhjrpit.ffs@tglx>
 <Z/kM/+uBsD9DAGjF@lpieralisi>
 <mcyioyevok6tixna2xwk5q3d6x5b5spyucc4fiiy3h4v5jwxbj@bw6ewonqm2ks>
 <Z/zGzjyrEMYMd8cI@lpieralisi>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/zGzjyrEMYMd8cI@lpieralisi>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YTBP288CA0031.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::44) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SA6PR10MB8160:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a34486a-4e5f-4534-0c68-08dd7b61f4a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?z5A8e/JzPYNbYRJ5rC1C2Nr5L48KSLELk/vkSpFldi5LNU12BArBgNujFT0m?=
 =?us-ascii?Q?nGtzeRlTmLXBzT+fTUodks0La8ktjkZ0dBXcANjvS8p0bb70RkCmqGI0lwTM?=
 =?us-ascii?Q?iSTvY0W9xW0OpFlMKR/ThaE+iu8xN3aMW6LM+X0wMC/Y/+1NViJ+mUh1UvqZ?=
 =?us-ascii?Q?daTbTB9MEMVrPjR2ogXKLDELxmH7q/U6E9SEqobklWvhn/rgjFDX2rWzealP?=
 =?us-ascii?Q?fbKjeT7CA82JK0/a1cOIw/Kf2FXByyNGKnBL3iETseXgS21Ndts6WVUXo2o7?=
 =?us-ascii?Q?VAbt7Te0VLt974QWXGiR5cFfeU1SuZOkAqoTkcWwHlXfOnVx9nIXB1nL22r/?=
 =?us-ascii?Q?9igWBn8RmYu27eDL070OWKH3H8dBe43TnTWD+/68sR0HVweGdHaj+u6136ia?=
 =?us-ascii?Q?k5lIrLOYeSqT2VcMZFceHqYS/V6NpE1ibgDNQwg6O7cP1Mkmwei7NrelEvxQ?=
 =?us-ascii?Q?bBBH9lmLG7mbxbkSz8oSIY5lfjF4qlJ/Uujl/Slx5WSH/uEgNUO5al1TapB/?=
 =?us-ascii?Q?/Rg+wP8ZPGEGNfEd3HMrHvzUJcXTYCf2hl6q3ul5bu+0vyWnRbHIsalHFLzf?=
 =?us-ascii?Q?q5na+Y7WJkzYbtxr6x+W2KmIbcJDF9UdxEOmrD+JGGnJ+lsD4B7dvfFE+VeG?=
 =?us-ascii?Q?IR2OA242h3MkJh7ONI7G5szQ52dpDorExmA42UDk7COW2SOqc6SLvk03f9K8?=
 =?us-ascii?Q?uZIM36CY/zpTIxAcR53ycE3f0EfH3BuuCRUARr3+4ezeqwleKKT2FR3GLQCm?=
 =?us-ascii?Q?1HKPL8mUkK8e4m9NlSwpxYPx0qIxSobRy2zd1PBQlzEMR4zE/+gLrknqdKh7?=
 =?us-ascii?Q?MR8eIM5XPSIBRMrIP+TqqCUthhgkNsPLaZvtJ3ztD+pDZid9TMrWoeV/Spj5?=
 =?us-ascii?Q?kh2FBfExTvla6gvbaXL+7+aQLiy4YhaS8x0WwySWHRWlPZEFt9S5jPuJ1s26?=
 =?us-ascii?Q?p/Gy0DLcAed/HM492Lb8ViQ6T1rZd7EaVf28ZRpMzyBXXdvMQuC+GxV370tN?=
 =?us-ascii?Q?Ydg7yrrwtre8ZrV3GJQGhzgWbS/iKMdlkIbxDx80Oo+wAYzaEgGKwtqQ0rGE?=
 =?us-ascii?Q?obzQZp+meeYrbCtHhwE78LjGGpBcBXrvrP55V0rGkopLs4oxvWqTUZVSj1uJ?=
 =?us-ascii?Q?Bdq5W9SmgxOmplfKwJR5g9xydUrq4pAJ+45dE4gMw83Tzf+7wiAU4A03n7os?=
 =?us-ascii?Q?Nuzh93okMy6CizATjxNGXt87bGX4uK5terkAASSuLjn5SCb/3529PfYVUDK3?=
 =?us-ascii?Q?/cKdgwFSpB2LftF058dBFKZZSLTzAYB1QhqFf15tsRqCYkaeACrNHdKYf7rN?=
 =?us-ascii?Q?eevZXilS2qRqQomxQNNNCechscbg0cb/63SHFR+Zoj/Ax3MpXZIDsxqunO9R?=
 =?us-ascii?Q?r8vgRRtfXzbV5NvqEthwLb6+y5nMyDEpKjykdQhmDgTDZWuoK04Hnx2ne3n1?=
 =?us-ascii?Q?olttW5ykcEE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZseWihWU/W6j0QXlTlarIaL1z8Q2kcLhGOSUaOCEXXD8lQfiQiAAaKhZ1qxC?=
 =?us-ascii?Q?Bb6Md5+DiFnFQMGP23mfAIu4FI3sRD0QUjjONHOxlk4d0q+9OYchMpw9kMLH?=
 =?us-ascii?Q?hcJZ5Jp2P/LSWvN2wisvcfrxe8p3FAwbCS7B7mE9P5thLAp7slOV1dav+zUS?=
 =?us-ascii?Q?YRSn5+yHoSyUDbVJF8P+sC01Zy/+GaGOlBKkjEaGcuGZ5uaaCl7nlcku+RFs?=
 =?us-ascii?Q?9U2mFyyFkxLpPgbTvWE3DpZJ1KrJaeKOXXEjN9f20D6C4ekrazSnvxpdrLwN?=
 =?us-ascii?Q?XJm5RFbLHBwn+NwCABJvnlmdloxVH1MwBdvgw97aQSMfjJgwEPrJe4zGLB5g?=
 =?us-ascii?Q?eu9x613wZECzCzjBNanvSAaQ/oN7mLff1Igh3VpX8T/egURPvmx09HEOxAC7?=
 =?us-ascii?Q?+0Z9nMiN86rXOjZXiE5OTPTrl7lK+AoT/zTnLqKnPCAu1FIcB/bSZliXKaKO?=
 =?us-ascii?Q?mnQXTFXUtwn3dX/A2et4ug8ZcdqeJVtpcqdkyAKglQuNx38rsTebTLik1Oak?=
 =?us-ascii?Q?WnEZGbQPxeV5nF1i8mMS4E+keiCF+9A5XwsM9B0zO4l/gJbEGGIIZit++FYX?=
 =?us-ascii?Q?M9/B6mFeWjWlVxe1KTvRmrq2gM5yqNYnsYmNgnh9ChW6fiyGn/pQZ7r/Ee4v?=
 =?us-ascii?Q?TCa19nfWfiD41W801YCZNZd/Yz6rO9f+IZbBvfnGn47r4WEVl/gHBnRkVug9?=
 =?us-ascii?Q?wDbSiv/OjvWDSgnzraXJGwRDnf9p0ilCnHrD+zp1qcXfe28krRkM8C7XW2bz?=
 =?us-ascii?Q?FUB82eFkKMRXSTqvZ19s70yHCXQClZJJKCf73mgjzBHGrhEvUsC4BZhTHA21?=
 =?us-ascii?Q?zVsiSj+X1jliq0XCclYeqdEoYkXdDiqNHCzdsNEML+sFT/ISyzshjdxonj9i?=
 =?us-ascii?Q?e/3xuqgNnLBmw8hhzjkZWqBetb1y0JCLEbT2JMEvjspjWurj1s/D5XwFeJd0?=
 =?us-ascii?Q?nMg5DBAc34NgQAG2vANOneJIpnA6w7COoSeaFqNE6a06929ptHhHCasIjbpu?=
 =?us-ascii?Q?GDVqeFrE3JcTXmxaB61/cyBbp4MIerMZZbOyqu3P/UYbIj5ZGV1J20h6X+yc?=
 =?us-ascii?Q?8t8N1jhr0jPPTs3fypLUT9xpKXTRHWiPRIwBkaZjZgTGqlzux17mEZPoGaX9?=
 =?us-ascii?Q?4dIYLJABRpg+QYCOo8/hxrYiC/+ZEHsnHM/oavOOBdS1XjVqaRb9ODgZ4qjS?=
 =?us-ascii?Q?ELP/Knemvp0pfdFNQEVzQAIdtQW++qYgaHVEpggZPawpn1V0YBDzwBsJrdx0?=
 =?us-ascii?Q?YK6sf62+fPpgvCaduWBwEHr+2ZtG/b7TpDECY3qalXlUmjMU+cPmm2d2+iL3?=
 =?us-ascii?Q?HxHADkznMQFrZswfek5HTNP1kvuSaUCE2WMY7pYs/X6CYqQVjQ1bChtacktm?=
 =?us-ascii?Q?Q93CLHnStM1LGhl7Pns7NyAPh3OohXQaQzZcVRtSEat/5DA9BQAEtJo1o7ln?=
 =?us-ascii?Q?pSM09x3kkJpdeHv6sfRbl4ayzws9vTpoxqM+AbeOMl196YMKLz6kjDTvN65S?=
 =?us-ascii?Q?ly6861JlH0Lo1eOeuW0c0Utd9uhN3h5TGdOP/DN+7zipU05NHPc+mJSiFEvm?=
 =?us-ascii?Q?GYislXo977yNxsCCqSS9mpW7/p7DDlN7InEEwWpa?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XphkdMBUzAsQf/4nJmgUzT0jRHt9csLkcpAS65dp8ULKimCYi+LBG+x/z1bMnq9GwAMr65Bg7U6EJuvTFTz6fKA3KH+tQivmZdkZHCeNcAkVI9q3fsGBp4X6Y+89X143+shdnYhTEXYUlUG1B6qvSYKa25uCrsUTi8efhzQeXYDbDcsuL+sPHYku/eIFUBBxP9TXUECthEHMTqVlbqh7EzGEIqjGPDDFqSMD0tROjl9mCBziUqaolSSUaui9xAJ5HJyQxaLq+SpIJ6yT5+0JA6/4nb4e3Szt6VkqLnshENTgPuLGb3FMZ+Cz7AAMRPAvujKqrUYvBQZle+tyu8IZu9Isn6vBdu9QKA+EAsVkv1hNmnZyVgndJdkVWPODQKTkdDO5MbfjjvupKm5h9oBF1hPy7Hi/Z74aA8uj+uZH1JewID+axyDl8hhh9p69S7+W9NMhVEIKSAq8PabKoXslmjD7eMm/wjS1hEJknkLDQ7GF0FnyulV5/OpdBGMsk/UZEIano5YkuRAfDNunPtihRF+ZSsGNGrG6mRkON9OJ+D9dOgbuQvHi7P39rTT/dvcvmaqdh7E42t05PsUS+iC91Dg8AG2imh1HklKNI8T+YG4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a34486a-4e5f-4534-0c68-08dd7b61f4a6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 14:38:00.4491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSjfAkWs6tYWk3mHWCwU2vKlXt1Je5BGIBQGIgo1efn5VE5HbjqXTlKji/E2w9/IzI0SExDugxBiNVbCFu/fzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8160
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504140106
X-Proofpoint-GUID: cKa-OK5OxTDBt0RNGttc-TV7TlQ11XWO
X-Proofpoint-ORIG-GUID: cKa-OK5OxTDBt0RNGttc-TV7TlQ11XWO

* Lorenzo Pieralisi <lpieralisi@kernel.org> [250414 04:27]:
> On Sat, Apr 12, 2025 at 09:01:18AM -0400, Liam R. Howlett wrote:
> > * Lorenzo Pieralisi <lpieralisi@kernel.org> [250411 08:37]:
> > 

...

> 
> > > Yes I can do that too but to avoid fiddling with alloc/free ranges crossing
> > > bitmap chunks we need a single bitmap, AFAICS that may require realloc+copy,
> > > if the need arises.
> > 
> > That is the advantage of the IDA or maple tree, the expansion is handled
> > for you. I'd be inclined to suggest using the IDA, but I'm not sure how
> > important storing an entire range is for your usecase?
> 
> The point is, IDs represent interrupt IDs. We allocate them in batches,
> whose length varies, it can be 1 but it can also be a larger vector
> (ie 1024).

Ah, that is a lot.

> 
> It is obviously faster to allocate a range than allocating them 1 by 1,
> that's the only reason why we have not used an IDA (and also because I
> did not know whether an IDA is recommended for a larger ID space > than,
> say, 2^16 - but I think it is because it is designed to cover 0..INT_MAX
> and I noticed that -mm folks may even ask to extend it).

Yeah, I see this in the doc:
Some users need to allocate IDs larger than INT_MAX. So far all of these
users have been content with a UINT_MAX limit, and they use
idr_alloc_u32(). If you need IDs that will not fit in a u32, we will
work with you to address your needs.

> > 
> > Are there other reasons you want to use the maple tree besides the range
> > support?
> 
> We used the maple tree because it handles ranges, we have not found a
> sound usage for the 8 byte entry pointer (there may be some but it is
> overengineering), that's why I try to merge adjacent ranges on
> allocation, for vectors that are length 1 or 2 it is gross to waste
> 8 bytes for nothing.
> 
> Using an IDA and allocating 1 by 1 has its advantages (ie if the ID
> space is fragmented it is easier to find free IDs - even though,
> again, given the expected allocation pattern, freeing IRQ IDs is rarer
> than allocating them so I am not sure we would end up having a very
> sparse ID space).
> 
> All in all, other than looking sloppy (allocating 1 by 1 when we could
> allocate a range), using an IDA would work.
> 
> In terms of memory space efficiency, I think this depends on allocation
> patterns (and what I did minimise wasting slot entries for nothing).
> 
> I added Alexei because, memory allocation notwithstanding, handling
> ranges is what the BPF range tree does:
> 
> commit b795379757eb
> 
> the reason a range tree was implemented to replace a MT was the
> memory allocation requirements - they were using a maple tree before
> (with unused entries).

Interesting, Alexei uses the bpf allocator.

> 
> I can go for an IDA unless someone see a point in pursuing the current
> approach - that I would update according to feedback, at least with
> this thread you get the full picture.

Eventually, we plan to swap out the backing of the IDA to use the maple
tree.  I think we could add range support as part of this change.

If you were to add an interface to contiguous allocate a number of IDAs
by putting your loop in the IDA interface, we'd be able to switch that
to a range store during the conversion and keep the use case visible
during the planning stages.

Having that interface would make it obvious the change is necessary and
wouldn't be missed.

Unfortunately, I don't really have a timeline on changing the IDA to the
maple tree.

Please keep me Cc'ed on whatever you decide.

Thanks,
Liam
