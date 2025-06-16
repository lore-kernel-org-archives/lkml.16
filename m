Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E572957CD
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 20:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750105049; cv=fail; b=uZopFxIeMLpm5ReuS4t+If175gSYjSDyu9r3Bpm7GZOj3svnLNB5ICGtn0KzQV4VzQep8b0tJ6HEIugRR8pB2SMyGLtnhl+0eWanAtX9JOHM6plkgkobzybkBeqZMgezSlTg7/R9Pc6rC/NA1yA7zR+lCi5gL/NV/+DPhLeEB/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750105049; c=relaxed/simple;
	bh=/tavST3apWzU6UUJ6z0HeoTpq4i5IOmEBWmR/GOfXtM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ThhFYD0lcKgPn70LI2v2cr2sUupTi6YYpVPWx2z1XGMksq6xyWIQZWbMNeJnJSo+Ex1BoSy3j4qpiU22/vrRNbP/C3BE8f3dniFAMlFO/OilcTQu/yVe1ih33+LfIwUM8RwsXICWuodCe2m7N+24o95Z4geaQxzFGWM9lZd1Gpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=X+SnNP8L; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DEhUjDYT; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="X+SnNP8L";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DEhUjDYT"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHuSuF015739;
	Mon, 16 Jun 2025 20:17:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=KlI7ZTwTeGU99YwU
	7MkG1vcCN5uPdUDrNiCwUZ3epfM=; b=X+SnNP8L/EAFimEo3xpVh37zTCcrpeDC
	hX6bsf/3TqnrJX7rnYL6CXaFvEDbQMwV2olgDuhYZjcqUB6YcGsAZ0p7mcoQguHQ
	dzzzCUkSgJFdgOkHqqeYH+fQrsGTWuwoO5v56lgSDD3d4HvIrqRH6XRNVT+cMsvp
	26jYRVJNEE9tLaDJzlfqvRWhpMkbUsn9wds1BT8zDY09aMrruR341eHZevb/3Vmw
	1BYdDEbahTTrj/zpCNbeDOn41Y6HDe/FdxVy/UX1KPwJ9GIpp+su4aWsWFOXq6Vg
	bWwGNYAumfnKLJw0f10X8r+xgI3u1ORorB7z2Ot4RD5+pZCSxJWb3A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yv53ru1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 20:17:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55GJNIqd026106;
	Mon, 16 Jun 2025 20:17:00 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhen785-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 20:17:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipf1OZLczGt04SwWv7ZvrZ1G+08rUBp8MjfPRyzRZ/5H8QiHYPLXemqQKJHXrz4u2mJzaHsTIHAMXyx5lHUmoKi4jXGxq7uyqi+OYUHTzKUGx/Tf0ql0dWYUThPqtTslQV9tYyLD6/cCAb3t+sw4yMghxSf1dQOBa6uV11JI8TYe4/Lfdq8cLjeLXh/eGwUazKzVt+Qhm9nLHSnAK4yk5aRu16LcTj1nk/aGUIYwQ1ARiw9nPhCaYp38lQoV3cLon/VQjRRf3s3caEBp+3FuglcWcfOvegxTFw9MyowHJnobL6ZJHy8wEUzr1zePfb8KfjDdhFsiUNLolc7TTDQavw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlI7ZTwTeGU99YwU7MkG1vcCN5uPdUDrNiCwUZ3epfM=;
 b=kZ8pGgpexb7E9fKr9CF032nsuYeE55IQNquukNjqyZ7OXsF3ufwVMaQseAheEHQEFomZGCwCp26ylEC8CUvBqbcJOIu2KZqd3JXMhtbU7DGTwALhhetrAztsbb/2goABEOC9kBX6DtQwVYuiOjK1y9my+FP29zTC8ovJtfLyi34gpDjofXKR4TTZWVXWlQvO/gXB/NwVkQJ0j68+8BVMUKXRCt3J6MDJAwu0+P4kgJnly2TghBq7JOcrgR4yQpnbwsb12TKQ++tqag/rgYYzWlofQIJQKZSIMjT7uXx1qr3eg7aKOdFvz6QYfe8SK88fx/bT8ofzKeXt25bcMz4I5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlI7ZTwTeGU99YwU7MkG1vcCN5uPdUDrNiCwUZ3epfM=;
 b=DEhUjDYTYhv/zqQVQgGvpRLi29IfXG7y1Y5rgU/FjBqVjbi4Kn7NIMs3/qCUAwwG22VXAwOjFzRfXgwSuCPT6KLwffeII8R/lGkMhOsqC6FrvBn0e7SO7TkHXuv8/jgQekXGpgiPylJ07pl8W7ln8xE/LDKJ8qNAK7QHGGgW7ow=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BLAPR10MB5201.namprd10.prod.outlook.com (2603:10b6:208:332::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 20:16:57 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 20:16:57 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@redhat.com>,
        Michal Hocko <mhocko@kernel.org>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: add missing mm/workingset.c file to mm reclaim section
Date: Mon, 16 Jun 2025 21:16:43 +0100
Message-ID: <20250616201643.561626-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0460.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::15) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BLAPR10MB5201:EE_
X-MS-Office365-Filtering-Correlation-Id: ce3ff779-7b07-4c5b-2d1e-08ddad12beb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QPje5An8lTGtvEYBzhtu+vQ6sy3/zlt2+ZUjyBphaRawRiKJ4VDOmqA7FK8c?=
 =?us-ascii?Q?KMj2/HG1Ed6fFV2zPdl1OS6Z8H1OWMCizKv4V9Rgb4w+lK8LvootPU+2F9hP?=
 =?us-ascii?Q?qmxCTeldEnt9RBakwSRVZPwOYE50VzIKscFwrfYhGztNIfG6BAVih1JlsYzb?=
 =?us-ascii?Q?KvbsTofnMmBI/P3kUuOcox4XwmqYt5TZLDk8WFQJZ8dgK3X0he7JOMKMwDuf?=
 =?us-ascii?Q?ddrS23GjNdryeKpEgxNSFIMz6MP653p5Cari7YkwZimOAulRU0ySRYkV5mQO?=
 =?us-ascii?Q?4uAV7qBcMYdgmLB3gm7mX1pz44GmQ1mtPTB4CA41Vxje11Xsau3pGV7R99uL?=
 =?us-ascii?Q?TGNXZlRLWbZiRCWiauxZ+q0j0qNvnhK1l40eDeERl+REwqkEqnRgUMcveASm?=
 =?us-ascii?Q?t6aTxYEmHHP4XTnC6SYawmg8y/T0cvzCbYWHmjoHw6hx2folme3W4DWvTrrZ?=
 =?us-ascii?Q?qJI3arjN4baWmP3xtW9BjsdO+scvwGc5YW1WwdL//TwMdWxzMxHfL72AncBR?=
 =?us-ascii?Q?/SOkIX+7uzKSHVCcrPDgbpVEX080oFbNf41WGgZe9YNYb9IechUFP4h0//Th?=
 =?us-ascii?Q?zh1VgFn/3A8+B2pKcQ8R6yJM2WIb5ThFSEVPjL1rgnj8THzfHNr8glNPJ4Mv?=
 =?us-ascii?Q?thiqDhPck6Dy/0UCkj3gcIZys0hSiqtnX/naOQQ/iGs2QC21ItHoI+WbK7Ey?=
 =?us-ascii?Q?bVrqXzTAjLi7PyPLREOVv/XfxDct2D4KtYJ3WfhoSWuYwz1IMXP2C6Io/ytK?=
 =?us-ascii?Q?V1H4GFxG7SNgA2vcx0/bHhtlFtBXH7xlmCSta8oHCAhoeZ8BuaudRsdof2E2?=
 =?us-ascii?Q?/aP2d4ApdLGhWCMsoKdLFGqPd4q7iGfAgNkmLASeRL1n7oFVc33mZeUJiTo6?=
 =?us-ascii?Q?mINz04q10nhAXDeUB6jlJT6ymoW7Glk6aPRHNR0FUF8U4ktkvJC3Zl5pCqYP?=
 =?us-ascii?Q?kvr0VQpoN4bYMh4s3PdfImrMdZZAReCIJ/uFJRwhMXcvkkCliKomtDXVIDJy?=
 =?us-ascii?Q?9prO1WxIzJVlS1Fvlgp47Xy1auN6o4y84/GBJNaBRnLQxf9hMwx7X7E+EVxT?=
 =?us-ascii?Q?kgUQ4kfeuBalyv9GhlOlYm+U+0YJpcpsbpKEpsT8ygrbDVvffCK5UA+/U8sk?=
 =?us-ascii?Q?o2Oo1mNr3t+cXIEYoVApvWZ36YHoZEOVFDcyvPYQb/qE3V/mAQGrH84YTIDy?=
 =?us-ascii?Q?3vH21ECGHSoxf54b+VNy9qCVatPYNOcS1J1QBQcyAqGoIfnGuEHaFSw97vKd?=
 =?us-ascii?Q?2fst+nRCPQ+y9SfYZK0gpiyhKV9I3rqYNX3K+A92WTP2Dso3iguz11IEcAHR?=
 =?us-ascii?Q?bhLNcsd0tcoxBcUVhtrymgpE1G7YLmRgwgh4TV4EwVW9qsjIJEyitYaazcn8?=
 =?us-ascii?Q?b0deWvLhqSB7r9UvbXN7LDsa+OBub1mBTVUmv3DvTGom+gBwa/7K1ad5yWUs?=
 =?us-ascii?Q?Ad5Bj0mqKzE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KuImEpbrqNURfcZ3HIRZ67EArE9cJUPPtF94NFxbgDZp6kEu4rkLIiOd6xqn?=
 =?us-ascii?Q?80omAzhlKGp4WKf8gcGIbHDOOfXmhgyut+c0QPd595yS1vTbTwUJu7Li18rk?=
 =?us-ascii?Q?3BqCH9dwk6NuLUP0dPHX1MRiwdoO8EEgkjrebz47KuPjFPwp4mq3oDDbraWk?=
 =?us-ascii?Q?MVa8ebMxx8dsXxvgvL1G8ZfCxTXa5SVJtTDm492S1JcGlBHTibEeAzqYph8f?=
 =?us-ascii?Q?gwXxo22gOedPMbXdL5HNGutGZ3myMxvWnWqrWRd+v/BGOr6oH3AngPEyBmTH?=
 =?us-ascii?Q?k61VvWGctYbOz0xY4bQlhCs+jBfr4hA94+xe2dXynUKMeWDs8p2UfZ/d213l?=
 =?us-ascii?Q?2NXf93H2fhDIk4VLUHh1+ecNYTl1ziZB5dfCWvWmq/7/FkICwv33Z67o8XVu?=
 =?us-ascii?Q?5KUFLe7yf+Y9IvJBvvh68vOqXnI0w5hPOTFZ6PoRfui+7PA9+H8DDeyEIrQv?=
 =?us-ascii?Q?hPn/MltLXeKLgSqkyruQgHLS5H7Ib3+XUhlSveadglc59460tXl/ZWOrtw3P?=
 =?us-ascii?Q?x+7dVbZYJ9RSMGelxVelsp8jZV73YMZp5zMTd0zHyeM1ZMHg7smOF6COvqs7?=
 =?us-ascii?Q?TjrUt3+JuOtA9k94RA6VGmz5vTu8LVQ2oyO199vQHynzgVaTKHUF0iBdT9Oa?=
 =?us-ascii?Q?XcOyDrsWMcBgzi/PHBlTTF3aLTFRz1GfbJH0rBBTpZwHJFt7m8rxhz2xEJop?=
 =?us-ascii?Q?QZ1pGGIzoidzV03ZiymISqrPIOi8GDkims9Jf0X0PNOIy5jcxFn88Et5GmBW?=
 =?us-ascii?Q?i4B4FPHKp04Jj1fdiiT2iead0dDJRX2DkTfzabgWjaL/FJYGrwEYK5vT3x+R?=
 =?us-ascii?Q?8AwMzVfzVSkcaWgPRKs13VPoWGkblQ85fgF7pm8pRpVN5pAyP81EIrMxA3F/?=
 =?us-ascii?Q?OQvEPAqS2RjSf77TrmGYfI6fYCh3H4I0Hm/eIZsU7la78g/1ajQ/NRBKWmAN?=
 =?us-ascii?Q?+Yk32AkheayExZfUh7NiL0dlyBpaYGo1RJtM3pa+BNYyJHlENiTUZ2JYwjPZ?=
 =?us-ascii?Q?tNP1q/gU3wI0U9qofJomkxiYE6GvzJXTwnJ1X0TiDlmnhtchtAVi+QljIXqq?=
 =?us-ascii?Q?FmspTc8Ec1nmK3IA3mxs1RlpWbu9fSbmxmdhmonK1PodzB/PD2A1NaJBYk31?=
 =?us-ascii?Q?y4+LS2UtQaFPfR7HsVGJrlKk20PXC1IBQ0xH6+ev/YSWL+3b2bX2NdQXjgWo?=
 =?us-ascii?Q?fzekLPdqHYjAhGiGjLQp8qgFdyvtHTsqNs2FG64FkTQOYwiCpN0YNl7rWWNf?=
 =?us-ascii?Q?+jeYa4xyFWMymQh483gXJ3w8kitsvak0vmqMDZ+O/CIw0Ok9Gt6emtnzLwhO?=
 =?us-ascii?Q?hCzKOoTeNTBlqChapl/CgwEg+Lnnz7Rbt7GqGNdsg/VxbzWpRd2suvMQ7InI?=
 =?us-ascii?Q?p0Ph+artuRgwpEaRv1NVUJ2s9nJNLcC8JOsb6df7Ia8t+RCE9Ts6T/is2yxc?=
 =?us-ascii?Q?jFxVrNO/ZZoo1GDqSl3/fpRGjBL4jZl9Ok3e+KjXQw4va5fgTMAJn8eieO6t?=
 =?us-ascii?Q?OmOKSyF2E3pjxE/1lpwt6ImrCuHy9Rc9+ZzQtavxd7FapcxeucpFWHXggCsg?=
 =?us-ascii?Q?HbfAbdZ5wYGbAVXPHG5lUeS954RNaYjJ3XINPWvRNCYizYykL5ogLTmX2gXZ?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ErNwyaXDQ0UGtPiD+Aj+17oAp2CBQU2HgwmoWX3TbYfAFpq79pCjMdodgO5ovKUqw5fOiMuiAx5ME1M/pGu4OK/L1Qjos+mYbAb2zI0esps30FaWtQRbW0pJIBWy+qmXSQjREPkFZm2odg/MqaLPBVU8+4Nnpdyv9vphmJxESTkD0eRdhkMne2MAWjhtwP/xKvKH/RRvxlQTKsOHQrogx2CTKUs6aQv+vV1FRZVe16JlYNw8EKcm/G7C1CrAcA3485wisO0xW5axosiGP6r8TjLeyzaXHao3RaYlfPP/emY/oUwEYh4tsRvrFNGYZZayAl2OyK1u+SmnfRPzWBxmjQm6F5C4SwFh+8GBwKaovLCO5XcpUzSus74dp7bjEGVqmydl7g0wfZnsjBH+xuUYQuchzmu/0ZogFblEjP0j3gHsl18IBJSGuR+1Yej0gxqHdp4U2mnbrU32LArLQQkPGtoO5zrsjCeUypIiQ4CCJ8K95mgRtUrwirRIRunu8s26SH29HjP2Q1+mOeGI0zX4bawShPAJNBGuakE68RgEh2LCIOsrVatI68UfZTrUBrzcUlcLoY1MtyEMcAxPnU0/X5SqZ7Da3RKzGbMZjHzepUc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce3ff779-7b07-4c5b-2d1e-08ddad12beb5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 20:16:57.7863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPx9DBpPXa3rQJWCwxFGISbgENH0uu+ytg9Hjzpr3whC/zhMpdIzMsQOwk9MPkSfwd0mR+6GNok0yJk8wQoMu8hWuhlENqdXRtyYgXqlGR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5201
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_10,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506160140
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDE0MCBTYWx0ZWRfXy3kefG0QlePu DwvUxlu6/i8SSG6U2CzyyugoNflWG5OiPdfScWd1bGBdDVIp02DNamgsV8Gi2oRWfOIGs6SzO2T 5Xbl5V+9nNTL6mIxnEJ/VE5FfjWplm7z9SIoR6erzLDCV335X6U3C/xI6HUsQzpU13ZCktkcZyF
 i1EOef8nInJGzbyGcwaGDj9ANePbtGbUwTbfgifK51fON5MzP5eZ/JQ7uADFjwAZAPQ1WfA2c/V NWxgyLB0JnuqNwqG92jX7wtGrGpJNVHCVXHj91OXe7AcVXPwT1v9+f/XWf1W93a/lJxlEH5ory5 92XC9Y3psQmX4hJqt5FyaiWGn7Udr2VCyklf2bePvc426YMoZzH08mILI5r7wUJpRZU8hCw+qYO
 e5398ATdpy0vmnEyMU07uv96z9qdZeY4+yMSftCZnqI/kWSwBYVfqILPy39mYRwFYGSXCXbm
X-Proofpoint-GUID: 3Izv1umcm7z7m-7n1NrpMDwv-ZVIegt3
X-Proofpoint-ORIG-GUID: 3Izv1umcm7z7m-7n1NrpMDwv-ZVIegt3
X-Authority-Analysis: v=2.4 cv=W9c4VQWk c=1 sm=1 tr=0 ts=68507bbc b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=37rDS-QxAAAA:8 a=Z4Rwk6OoAAAA:8 a=X_A0HuMmOjI_-msgzz4A:9 a=k1Nq6YrhK2t884LQW06G:22 a=HkZW87K1Qel5hWWM3VKY:22 cc=ntf awl=host:13207

The working set logic belongs very much to the reclaim section and is
otherwise not assigned to any other MAINTAINERS section so add it here.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4523a6409186..f28f7625723d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15871,6 +15871,7 @@ L:	linux-mm@kvack.org
 S:	Maintained
 F:	mm/pt_reclaim.c
 F:	mm/vmscan.c
+F:	mm/workingset.c
 
 MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
 M:	Andrew Morton <akpm@linux-foundation.org>
-- 
2.49.0

