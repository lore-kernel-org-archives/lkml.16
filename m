Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB9B2CCDE
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171321; cv=fail; b=nQeQkkBnUyC+iVlz5bqfSCbJQXarquYTOYL/tO9Ott/KSfyo67xKRvbpLWpvgibVqGaV5QBReglx8a0kJtMhYCxIBYrxOglVmXrTcIZbpeg5se+dH098UoGUWDwjUxYqua57xuKh9Quqe2AeLbhp1+ORd5vwRc0ryCWiLY7eaCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171321; c=relaxed/simple;
	bh=MpRzh1uIwme0fZqf/FA0qrtY6DsJhSnZ4m8HHA+61o8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=akoXvLhfsvvTDFZIrnqghTLhstXNTclp3oo+799JcHrD2OL5giBg+Tay3LXrtVBUi4OWYTP7etk86jpMSJv0dxA4gpP5P7OwOEN3VQAJX759VzzM9a4WVUvhXOU5jP7RubQqK63FWErxd4C386NheGe/2zEMtAuefCGsPe5OJRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=n7AVDenA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WXWARNqu; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="n7AVDenA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WXWARNqu"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HEXDfZ013192;
	Tue, 17 Jun 2025 14:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=BrICga5yPLX1BVaK
	IEDW+eZeNbNLOuPeL6trDWC6Q/s=; b=n7AVDenA+h/UfvnirmwLlkSKIgBYRi5x
	St1+D5vEyO65aWdvSg0WM0teBJ3bRKIjNd6cXFHm3c3fdtFVjfJUi7y2qDQ6Bey0
	YZW4h6aHAGPW9JK0JdXlUZtlzMrBm0H8fWTZf4C5LNqX9SP3r6CelJ36Opsu6r+B
	2LlPG6Mtsae7tn/KWTNrPKkaCpuqcLxvoBMArdQDq0KLDrPakbtlB4fU1BSVY4I9
	GvvmvugsNYYL0FyVXXy/mS3OTZBuHNy2KM7ZbcpaqStk2+PxT8cZyn9VV1tSKuXN
	ulwK8KFT0xQKRX2JvICW9TMNCAs5A5TZv9cX8dLMJ+uXTDe3TH9Udg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790yd5fcd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 14:41:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55HERR1k036275;
	Tue, 17 Jun 2025 14:41:44 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhftu65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 14:41:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nw4fhbnNg1JOXQrt02CFfLLhUS0GaFCRpDcsxBpZicN/Vz6Q8edhLzLM9kipKFPhbp5QN9806geoJ5DIXKZi/WpQAOT0pfKmGHGX7RhngtUknrB0upLX0Z3WWD9MPSIaUamtCiamHebKvuZcDOkY/g2sl29I0Ny3n49LQipcytp6qUBQzc6lXPSN4evntM2tknjz6Xpn/1R1pCQKJCpckSASJhq6nyns3FBXMJgkCS7JiHCX3I/lVnGZJEFFlz627LAqI2dBovfdIjPYbGRP8X4UKwQ5gVuFEJioHR1hT/C1xX9zgx0zU5naxCvY9a6SlvfKildTQqglU2+xUAIC3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrICga5yPLX1BVaKIEDW+eZeNbNLOuPeL6trDWC6Q/s=;
 b=luZpgr+bU9+VMadcStKVYU88BG5eAR+GsxGnA0nXAmUxahqvGBqY0aTpGIf1q0lJOYShWqjR1n5gTGBSRLeDprgP/PK+9gNp3WfwJW3pVSQUo9Lg3ksB0jdPIkkaQBr0ZES63rybuwp14nkbdxxGxLi9kWXZIxiiJIoyTqIdUV/1dnNVTsVzvVRvCCemKHs0GFk4eAnmaDbPQIj2rBYuy5noVHQ2vGtpdKEnzWDQ+uoc/NgE/fTgbaO5e10otKtyk8FV4xSHHleriTMjwpDeVwsSgXMBd5+ozoRQE6qfV6bWYdmq8exxW/kJyAClCc3KRNe0UbPGzvjPiSbm+WNt6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrICga5yPLX1BVaKIEDW+eZeNbNLOuPeL6trDWC6Q/s=;
 b=WXWARNqubt6ZWxfVdEZ05cfsBzY/MrgPGBukoZbh24UVTbO69yyr0yB0YVSZ8sbtUxNLlTdPOfWPd2BoRRRfsL47yU2WrUhV/r8SInOCMBO4c1S9GjEGSt6g0UeQUIofthC+AWuGHmPGUxVlBQaF8rbiN0BlSdee0ByQcqZ7XWs=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH2PR10MB4294.namprd10.prod.outlook.com (2603:10b6:610:a7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Tue, 17 Jun
 2025 14:41:42 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 14:41:42 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Jann Horn <jannh@google.com>,
        Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@redhat.com>
Subject: [PATCH v2] MAINTAINERS: add additional mmap-related files to mmap section
Date: Tue, 17 Jun 2025 15:41:30 +0100
Message-ID: <20250617144130.147847-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::30) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH2PR10MB4294:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b02d974-dd84-4268-3313-08ddadad1354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FHD7oWxYBvdHWhO3GcpEY1ME2yMJrwDPW/loxMUMJ1MqhgblQVf33OMxKshs?=
 =?us-ascii?Q?DEYK7oSQsRlLAa7g+2VBjo4BL+/sRTBhNgGLdQLu1/NMr9YZdh60lPAjNfW0?=
 =?us-ascii?Q?bBech+pY5kj+ldbjCvgPBUGvrjNe7wXTrIgw/XaUBL6x62vh5XJAqvfiTn2v?=
 =?us-ascii?Q?j1qO38HJP6ubiP6BMfem7c/bBBfoUQhYa+p6Pk11Ud6TcGHvxmr8IWONjJ4E?=
 =?us-ascii?Q?BitEX3UcKpJK4xY+yP/JoNwur3HC4W0jqz+c+sLQWkjvd0KgP2x2uEEC0LnT?=
 =?us-ascii?Q?wcbJim/a7/k9Pw60mCOzAz5yCH8WUnsgOcH016lSfs+tqgJ6YkWy/z3Oceh0?=
 =?us-ascii?Q?tGMQKVybMdkv4v0r3QfeHzbL6Zxwdkvhg/GUAeQDkeGzD/L1df/txizogMrh?=
 =?us-ascii?Q?Fy4gJM+OsVXylYFaHG7z59n+ehgt848hk31vuJTseeELFqkWok/Wz6a6vl+v?=
 =?us-ascii?Q?liELTOjTPD3W8qqhn41lP0CcESeb8CQJNiGz4uKdROs0z6jsucF9wSvkN2Ut?=
 =?us-ascii?Q?NPqHciFwIfulXe2axyfMIIa9LACxbxQ/xwJ4Jtj0DwPFZB/1AcfENZafpLEU?=
 =?us-ascii?Q?TZ8djW6lRS/FeM+T6XViwk7nPALo3XplGoVaMRMRRJ/DKLvwy8tAegGbSZU9?=
 =?us-ascii?Q?RbI3DWWlfHZZe+K3xAEnEbwtbaQxWihFg2qn3J6bM8c7Hn+U7nxMNWOPNbSt?=
 =?us-ascii?Q?fOL0Gksu6X4MN2YP1gdurKMiSWytR1rmTvtzpSA8p1C9QEgbp5OCeN3/pbhp?=
 =?us-ascii?Q?tkv2tIA2lY5hL5Z34MbeKvyNYjxyhgBxJTqbCNbbFQDOJ1GYXp6g1svvSuO+?=
 =?us-ascii?Q?UhT0zIDySnhKBWc6rvYEBgumI6NuUQn38iz8f77nJMFCPwm0tcWlPBjoES+c?=
 =?us-ascii?Q?MFqY3MemzQZkKWEGGMazOIuRXX6JYfNmSntFtRxmSgwYDKtEPtOfEsiboVv6?=
 =?us-ascii?Q?pf+s8RcvAa0uytdPCjGF3KGe2bWqZSDfsf+dRgUVcq25k2Zrp+HH3PAkAaQy?=
 =?us-ascii?Q?D0MnzVOLEjI2OMqugS2Aw7hoUmNFJEfhaNJkbvzkPeKPIVOn6ma6Sxw1GKeR?=
 =?us-ascii?Q?1yb8u82THTkLxYg70RamMj1m5jyhZEu+d0fkayJSDhjL1nC/OwV9c+wJATah?=
 =?us-ascii?Q?K5onOavAJF5MPKJmewkEFH63vpAeJ7WDrNHXf7pNf/f4QXp7ecBqHtALXnoZ?=
 =?us-ascii?Q?6YcxTO6kXPMYHRqpq+83aLZulZIMchXomFMdY5TQU2BilfdIjaOT891Poo5O?=
 =?us-ascii?Q?dhgROYFzUf9CwsXl4cuVeYh46GDXsyvhtQH6XjkVfZenkfZORjuPp3uwjQ1p?=
 =?us-ascii?Q?OJD/lUUy6UhFKjt/hqFvin/fZMioBjM5gIclhAkZBCOzMLbW6S96qJ9+NSpc?=
 =?us-ascii?Q?9oVa7g2SFnTxkn36Tu9hxYx0NFa7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OksuEVC7tqyPM9xSF5EgfEq35TzVV27J2xK4wMH4YNd/Q00/kqXf3Jd/c8pD?=
 =?us-ascii?Q?AdXma9H3ic6uYm4war0AZHdWnHWtjgc8yAyq6GwyHnEaG1ub6d7fV++nNxNL?=
 =?us-ascii?Q?k3ffJevp26kUMLFpp0o5HY4nAkGck+1s8d8J1L2/3Z+hWwkXjVGprZ06/as6?=
 =?us-ascii?Q?bg4e1B8wXxUTw4thxCjDqwhp6pKhTuc33v9zSMkl/1gUhA128Bnv9bvOOuqq?=
 =?us-ascii?Q?zvxfQlo9ATBVzRjBbQFIeZHSH/85I2nhtHiinMg+fI3mhaURw2iOUnt6QIoa?=
 =?us-ascii?Q?D9/hQ+r0KvehIyHlBrBpDkb33uX0UXhohOKueMINMMyc1sQ8FiJDF8qpuhO7?=
 =?us-ascii?Q?7o74lQhf50q0gmwJYppfk9bGllQXU8gaIS0Glx2L5K7PNX76OLdwlt79b2oH?=
 =?us-ascii?Q?Wk/5sT9HUwxH8DRPeI2tpW7Fnkn5RFMbvSbaFnQkL2s/uQhd+l/oye2Qn3Y9?=
 =?us-ascii?Q?kYJ1FQT8inGmSv76mjF+gmV4biOkIWGElT8Ss/CIF8tzkbTmZ1U7vPJUiZgR?=
 =?us-ascii?Q?yPKpPQCjDW3OVqVWMFs2l6Z4ZTitc3BYta174qqBoux+nEUt7MR++aGPi0f+?=
 =?us-ascii?Q?QZnHJSaXf1gZRFs8bTt18WzjXrzfhTmINsiKWH2rpOHY64C9ErrpoYJ1iRmA?=
 =?us-ascii?Q?8dPbRLCuCO5JLYO0NMgowX2/FEKA/sjKVqBGZlDSeQrb0PHggo876BZLN0Ex?=
 =?us-ascii?Q?1XJSYJXYVkdE/Zcd+PQZDKV6tQiPpoO5qyxPiVM009aHtoEI4GnKz7CBqMLb?=
 =?us-ascii?Q?SNtSDrzGVQidyG6ucWAYRoYAYxGxZTYprDxg0lLSB6Wsjp4ax2JU6YndWCdF?=
 =?us-ascii?Q?T7EqVyVTUWz3ED0l5xrAMq6TqYbj7QD+9GVFC53nUK7JGygD4Xdt0tQyK2v6?=
 =?us-ascii?Q?Z7l++9kfPRNYIFfyBkF+4UGwoid2kb6vycT7d5YdWg1RPhGV4hjOS8Xzd6LT?=
 =?us-ascii?Q?mi4yWaIl6y5BQ4w2W/wfyoqerV7YuRvJUQwFOxeSilHEQNcWUnFwsKP/KM/u?=
 =?us-ascii?Q?Put/SzcZrgREKg1H9dN7m8D4NV4R2EL3arI4hx1Ji2UAgnqt5VgnlBgD+zxh?=
 =?us-ascii?Q?mkDEJ1VlL0E1UEFAnx6YIDRjOnG12cmY1BidQIcSwhsnyaQV820huGMy/Tws?=
 =?us-ascii?Q?HAvfkMQf8f2kZhphlyaBMRDTKNFt0AIVVnwP2liGUFcpbNzjiM7W2FNcX5ds?=
 =?us-ascii?Q?Mz5NKVaBUtbC5QzO3e4gmMLiJrKee7CN1w1qGrEg9d4k266a+O9Sh0fgQCnh?=
 =?us-ascii?Q?xfeJcC5ORijyD+0Ej6yerk1Z/oX7HC7pWF81eaL5/ie/7BM5Dt0dSgxw6iF5?=
 =?us-ascii?Q?7atd32ARdrghPoQcpizy9ioTNDKort/h/Khwf9NCYjn40IWX9Cf4KHPLAkYI?=
 =?us-ascii?Q?d4WVFnL7i6XlKVe7Aes7EnVNRkjFFLV6i6Y5NCvuZ7H18uoIjSeFQfJsQbow?=
 =?us-ascii?Q?wRz81Tkbm7bIgYZz8hqk72J8J+t2+rLYSnweI3Q6ZoI2R4+CIUGNO//cylIL?=
 =?us-ascii?Q?9K0Bp+7MFV4FYHAG90giL8Gs4xexg/0S1R+KJfqEqbKVTtY6lgD5ctxbuxg0?=
 =?us-ascii?Q?r74JqwPeD8UvHc23ggcpiwDKk2+7wYYgalTCYEEAWPbzm1riLqngCJm+aOu2?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	56x4z64uMXZN7kq2KU6lo+PSBCGEo+BRgkOAdm9CTcoQvQXgkInCku6h17nA+JmZ4/mBKZhFtggLqIdlztnOjs6OLW5AiSUKJ9AFPR1I0UMvdDHq+rcG7xkHu9foJJbFmA4z4clKS/HGxdL7tZLu5/5L+qFBjEwaieFWkb2stOsPceraGV3Ee5z5trW3bf4O3klU6guGmnKkssUEBo6EnWIbFKCRu3d9XhrNQeovoaBPpJAN0nbmCL3naJhxw0tYDgSwuiWSgWOgVjsU5ueGo0AzG+QK4rOormxtt0zROc2BtRIR4vBpwRM6SHoPLec2lwgB7iZcjEzMrB9rEsgrESTKuXGtuLtQuWF6qxLLqJs1lEkZv5RDUGiWJq8Hl5JL7FESQnqX60b9gMesr3lxPwmGuA0XyW0mnwbllI7gFA+zzukCCZHJi3tZpIFhBW0eMLXedw3ohmiXUwXonO1+i8FrUlXe41jtdKwt4QtBCiwYQarQ76K3/pUmyReWD84D79XaU0l9nypOwlj5+MO5k5AdcgOr5Ftr+KCYK5nyIStFQc0y4vbVl6iXiqolt4OpsKx6eHBqc+/C/PUN+xqoD2fhRKCGweyEiA0E275M3iQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b02d974-dd84-4268-3313-08ddadad1354
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 14:41:42.2361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bBLBgHW2gPREh7MZ2MFnObnfkzEAODCX4eruzTnwYyH6kX65mTTe6xR/8XjmIECUA0Zp9WEaPr4ckHvPCh4eczH4M4VzaUTxCinyrQuo9sY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4294
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506170114
X-Proofpoint-GUID: sfTP-tAx8YL_1e6zp4tBJ0QkIya_l9Dd
X-Proofpoint-ORIG-GUID: sfTP-tAx8YL_1e6zp4tBJ0QkIya_l9Dd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDExNCBTYWx0ZWRfXyEXVmw0youQv hL63yj/O9hSwGziTZYciqOftNngwEVlWxo10r6/2d9J0XS8dhZuTYkrJ8AFOxyuxBVgHnj9JGBA TX2kBKa8NfYgoE3M+ZkJ0utie6viBDcMzog1FFwfsICYc2padhLyUdOfMMl1oAMtSDB4tWdHGYg
 nDZkFy+pUgTUtgHKnkxeXomxe3UGAd9bE7/8f3yN1pogl/7v+q1i8/PN/Im+HeM4lGT3VbUgCu8 1XIqv7nHqAHO0ulj8seWumbM1zQQJ5xwmLofyEriHXjK7y92DNBFydVyxQhkogE4o/7mv6GCK5k S3J5+lE9BzH8SOYCu9KILjquCcvN0VHuweotIXj2CcZAAFWdHMaOw+Q+ZANwPIn0w/NSltosE2Z
 09tkyTUkvLWpqUiBTrSQoD/EIT7DvyhfjpH34y84upffMfAFr9OkswpEhOnKiedDUh6y1P1T
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=68517ea9 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=1-S1nHsFAAAA:8 a=4-ROijVuOV0Q71OCtNgA:9 a=gK44uIRsrOYWoX5St5dO:22 cc=ntf awl=host:14714

msync and nommu are directly related to memory mapping, mincore is less so
but all are roughly speaking operating on virtual memory mappings from the
point of view of the user so this seems the most appropriate place for
them.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
v2:
* Drop memfd files as suggested by Pedro and David.

v1:
https://lore.kernel.org/all/20250616203503.565448-1-lorenzo.stoakes@oracle.com/

 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 08045f9efadd..2df3e05bf8a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15980,11 +15980,14 @@ S:	Maintained
 W:	http://www.linux-mm.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 F:	include/trace/events/mmap.h
+F:	mm/mincore.c
 F:	mm/mlock.c
 F:	mm/mmap.c
 F:	mm/mprotect.c
 F:	mm/mremap.c
 F:	mm/mseal.c
+F:	mm/msync.c
+F:	mm/nommu.c
 F:	mm/vma.c
 F:	mm/vma.h
 F:	mm/vma_exec.c
--
2.49.0
