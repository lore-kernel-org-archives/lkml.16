Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42324211C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 06:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748844099; cv=fail; b=DuRzf0ne2iyMlyXhif33CAak4idQAx+d/z4PkWUlrNMmdi7GLaztcySifhpfFifE6msqQ/mInDOU46i0droLhxa5kxHn6PCUW8XIMTP5xjUWVb/3nL9uckaJl7XNX4RB1/jdz4wp8xw0Ck6A4YSK0iXUBplXFXlP0jhN8KEFEd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748844099; c=relaxed/simple;
	bh=P2FzhEfdB/K13XJMcr0Lh8KvCea542V+tmxLpqVsoNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dhvnTmAVKmF5tNwvu9k+yfJ8bVXZwgazXgaS8ffbZoyRV/Yf0PTZgfRaFuStUeZLKqCai0o2CCM728xHaW6T79/Vmj1t0RFJA/JwM27e8DtBqRRBuQV3moqrPHL2WMAtlwUS2jgTQf2p5ioLUKnLxkLcvddn12XdxcoenLLR23o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DNVXR96i; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=l8M0S6cL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DNVXR96i";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="l8M0S6cL"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5525uc61010880;
	Mon, 2 Jun 2025 06:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=sS7N6TVUS3nfleZm86
	My9e0V9XZfswcmG30Lscl1HBs=; b=DNVXR96ilVsEm8PyWannCcUE5BxCPvo4l8
	z495P7uWLnOJhqCfeCVOc7xvoHbvuS1o+CmCXnQUBJPOV0RsSnghRVyht5qVr0Cw
	Kbg2AdT0XlR1SOkUi6rTnV2tEYNPgICOqsK2HIhN/JkbHEPArjcWqPVqIW1JTpkE
	JyZBhQxc0PgPYkgtNkqO7sUkpUbG2wU1n25joWmU8rj8b0pkcf/GY0Kz4x+yMfR1
	9WLhDyneTtNNkYXIy55XPRwaYWQUeBJDlbh8kymXIH1EuzjRsRt4xZAoZalFKkVQ
	LjYVaUlsP0xpzkb8ZsZt/44DsGxylhbaI5tNlXmHmVE739Vc23fQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46yrc41ve4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Jun 2025 06:01:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55252YWb034843;
	Mon, 2 Jun 2025 06:01:19 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr77t018-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Jun 2025 06:01:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2iFGXT9OXB28wnVgxGAEw+5GGWJXiEMYexapFlCUUB25nVrAMe7FgwekEeBH0pHRjzoeDniWVQik3YyFpgMxQkAlJ5w7Cjm6IrnaJLGZfGcod0d06M5JLU5xiG2ZQWNUGXihrBenKH4K3otHRviyDhEwg2Va8D3W8hoMwWJjFNpPix8NP1iNHTKzM/F2DuBw8vGtKDqhVR6wJkWsiaMpdQujYykjLhYTa0BBYrOlWqTN0Y6aDq0naIAK4S7ofzhRlx+xDHPq+M1MCBGPr3jUumGo+VVTnpMB9iVszB9tQCuq3YXEpp7XYvkAAVEOv+nVuLNyNEQmYMhgMKA44T8Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sS7N6TVUS3nfleZm86My9e0V9XZfswcmG30Lscl1HBs=;
 b=tXSLzlAhfEmHvSCTPJRHbWycc2dgs/nxHll7C1H3i/QBl1D//sXGfVcUlYl0fhkydMD47I9rzerRZT9HF68eQNCLQq5LEI61Eacp+g0o0jbM3/vL50YKI8Tk5uQxBXqFLAwQGOO1Pf2XL1WATX7e/JkOuyhAsR4q+fLq1sGKVONFXR+XVEqfBAxL98i6r8tN81g01RmJmT5qEKPvQz5piNYWl9NSLsXoX6v1+JDDqsdjMcZXuRRQRrPySFhynbb6a/Oz2rUxDSLs9B6RQ7XE6DnUxaC5AXSmhuVOKUY/+UTuGxk00XNSo5jTbbpTIlY8WbaSkrKDXEKDnAigyQoMAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sS7N6TVUS3nfleZm86My9e0V9XZfswcmG30Lscl1HBs=;
 b=l8M0S6cLHTuyYYYm0ojA+BD+DRIS1CnWNMPudBKnIEtgY8T4/9cgl0/jGdGVNNnCz0b0bLgdLBJLHknZPO0t+c63HP15xdlI+llrCJqSHQd5YRONLgnAymuJXUdjJ79FXZSyskGnJ33vM281Zgkfkf313kRMaRUuxo7QK7xt2VI=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by BN0PR10MB5094.namprd10.prod.outlook.com (2603:10b6:408:129::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Mon, 2 Jun
 2025 06:01:15 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%4]) with mapi id 15.20.8746.035; Mon, 2 Jun 2025
 06:01:14 +0000
Date: Mon, 2 Jun 2025 15:01:08 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>, oe-kbuild-all@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Gregory Price <gourry@gourry.net>,
        Huang Ying <ying.huang@linux.alibaba.com>,
        Honggyu Kim <honggyu.kim@sk.com>
Subject: Re: mm/mempolicy.c:3719:1-6: ERROR: invalid free of structure field
Message-ID: <aD0-JNr0Z83OpXg4@harry>
References: <202506011545.Fduxqxqj-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202506011545.Fduxqxqj-lkp@intel.com>
X-ClientProxiedBy: SE2P216CA0201.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c3::9) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|BN0PR10MB5094:EE_
X-MS-Office365-Filtering-Correlation-Id: 1738557f-7cb4-44c6-0b26-08dda19ae226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8jNw2+k6YMWE5KtMAxwLBxT1dRXS7fflDQ/fCEgEZ7v7rg2pDSHT31lu/fGk?=
 =?us-ascii?Q?Qa4PToULIM6HVr3QF0+oscTpjX8wJu1J7gGyMuKSnHY6XK6Shdf0nj881zZp?=
 =?us-ascii?Q?wUPCYNlh3eoLcsNHFn+4ZV72DH4s9ljuSs3WCECkNi4PtNyChD1y3c3FjwVF?=
 =?us-ascii?Q?bimOA/FuIVZqRGc2e1e0m7YaKHuYv3f2ea0Ds7ZY5EwbfN67Hyn2j+tAHFpG?=
 =?us-ascii?Q?x1uT2zOaZTsIhhQfNDtcMSS7fA4+q++cATgOqxci3fxOLs6AeaX2bqvAZSwo?=
 =?us-ascii?Q?B4u6XBBDk85oIHkatt1HYtOCuKSpv3Y0z1O5dNrU8+2KegaMbMyUC8aCPbNU?=
 =?us-ascii?Q?/puBJj5Tz9YXsSIqdIj3uvRies7rr8aB0tZ5FuF5RG/RwNpmxnreWJy3amv9?=
 =?us-ascii?Q?t6DN4d/7+Pqi2CQwa4aOkVY3rt7nJ4L2zTx67482YnsjCZ1OAQ/Q2WVoDgSf?=
 =?us-ascii?Q?mDPFmghUZoHruu1NC4ngj7ntTLhzcyIriyj9BlwTXMNH9u0B4QqyOB548cPo?=
 =?us-ascii?Q?3i2r8skRQ4JK2kd78gvMvwFoc8/KSTeoOsv1jcaaJ49N9yDfxX21JUHXYqtU?=
 =?us-ascii?Q?VGtbGTXCN7O3n6Q0cngFALTgf+aA9zRHdNX3Xwc1mlJfNbYskcvpkC7GS8eB?=
 =?us-ascii?Q?Out69115Kg+V7uYp+Fs7WRsR/QwPtWls0V8Y5qLGJMWHRj/Fi0rbLmbBDxhg?=
 =?us-ascii?Q?rRFBmhu9YF87euP/45r6m1jqZZCOdmXE97X7Uj1WD+A7j+50FW5qtPqR/nh0?=
 =?us-ascii?Q?kms7KDebuuPga+sUnSAacgXXkHIs7i5FwPTrnMloeS3/jApV8RVsgOP1DinT?=
 =?us-ascii?Q?JI186kv2ubwGdNE8Vr7lUR2EvNU5fTYaUfYc/5nwjuZyjc3g6ibvzo7Fkx6U?=
 =?us-ascii?Q?D+NlET+OzbtdXtsxoIeRDpvfR0V6GfGTlwSxtuzXd2g0oMbZgvTu2EKlazWM?=
 =?us-ascii?Q?PTP7FOV4juw25lvouuVYCGRoQ0PeW/ghDTY6UegQwhdtihtHt5p2NkDUpb5J?=
 =?us-ascii?Q?65wSalClWo/mbQLq0XfXCTq7Ixfq9hB34nGf+SO3R656JpTA6Dj1LYaKP23f?=
 =?us-ascii?Q?hYrJ2J3uMZ/m//lOtcjYMbSUg1SY6MuXdup/jwh41D9ehnQgbulSIPHPtUvV?=
 =?us-ascii?Q?KPO25krF25Qg6JV2FglZ/8OEuGvxrJub3TTM/VrVVLgd9GsTj9czqA4borQQ?=
 =?us-ascii?Q?csMwDdc5OxmaQy9KaIkBUnc9R1Ngfkicvrr4Ud+fRiQluYztVxxo4D5zd7yB?=
 =?us-ascii?Q?2ofJ+OonOtrCuOjlr+lCQK3DTP+N6+P+J45OQqujcS1boBAti/pzNM8urSxm?=
 =?us-ascii?Q?khHX5TlYz4NOhZXv1SUknYPoL4CBeDBIRJOHr6XoaYmqj3RXTBUHYGOLPbCM?=
 =?us-ascii?Q?QLR5fZZAuuGf3sqQw6Ou/7gnkCiUH4EoiAgqoSz7SHrXrFpIhm9Z7rC5V16e?=
 =?us-ascii?Q?NlEvFcHRuls=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4kao/R7D0Y7Iitb6Bq5/q+WKYqiTvTmuzYcZRZtZ4Oyz+dn07DmyoQiP6oD1?=
 =?us-ascii?Q?J7tOgCtDi+BYxOZoP8POVyNODcpilWSYiqkdYP3xh0bB4vv4qWnOzYTVgK1Q?=
 =?us-ascii?Q?M0UEJ3v5M7WkaVNlEMxQwIGqKIcZNtHFDUloZBZWI1IiAsdDyuP4KgttZmdD?=
 =?us-ascii?Q?Jx5DndokaqqUR7HFWGJyilvoxf8xOq9Fo9GZ9Kobt7uxrj/CBOnQewwetz4t?=
 =?us-ascii?Q?EM9FZcVjFZxx5/BtrNmEP30F92Wj3SJLvSkxrzrwaqL4qd3oUxp9KxDKCHXK?=
 =?us-ascii?Q?mwG3ZsEqO+UIX14g2h/v77m5ur+7smFVNaiUaXcqmLb8N94KJFGusEigJ86O?=
 =?us-ascii?Q?HkRlwFy4cGTDRZX5CRqymBeHWQ5qQX/BKL2beJrFgJ/WTa9lejM9PnKMuTOt?=
 =?us-ascii?Q?wDyK22d7fTUkztWt4erZ583ZirC3gkyi2mFlhRq/80+I+37lVWPC7TCQUcce?=
 =?us-ascii?Q?R0Xcj9BDTrkjaUSpEbpOfVBTpSjbXAGUDk5KPS1WcMK3Wkj4QIKQ/qFqqnDj?=
 =?us-ascii?Q?v10hR2GguX2SQl7NSIRfEQFzKf0KzZ8ORUSKbkACdmjia4xpkmEmX+6vIqn8?=
 =?us-ascii?Q?ssZ4Re/1K/1FCiHA4WJCxEYVwI1Nv6yY5UVsQ7cwqJ0Slz1HXfdKHQ9VtWBa?=
 =?us-ascii?Q?fQbKdE5ao4axbAsodaHD3l/O1yzUuycKpp2pOcV7r42LK14HD13eD4HiuPsZ?=
 =?us-ascii?Q?agjrLRFMOim9OjvSh6Cw+dp5zFwXF8MeZ8oxRqPSoyZgEqTyHqdKu19Pkq8v?=
 =?us-ascii?Q?kj26r0R+ltWrXIgTjUrwJPwOLYQERDMMVHAp8yd0Gs1otsaWjGbLZKi5k45E?=
 =?us-ascii?Q?gbBuecOcYx8AVu1qzFEQcl4K48pdioxDvtEbSZOLDqAIQEypSFv6z3VIYol/?=
 =?us-ascii?Q?9rZFMovh1lIvJPwmUQIrugwCKarTQaoCapBW9UkNqz3IhZNVJjpmlEYBnDYO?=
 =?us-ascii?Q?D8M0hJI6/2DB4PyFIobrtl2xwhYnxQDVdGbG6I97rPkZs/5N2TUvzT03SOBt?=
 =?us-ascii?Q?Z+niAmPCqEJfu90WLPc9B+zHYl65A+NOtcFulKCLAUdMMkUA0CAd0gTruk6A?=
 =?us-ascii?Q?62Aggc1tDiM7SJF82pIkzRYp5Fzr/ua2diZ1kEBE1U1+XilnIz9aW78y7NFM?=
 =?us-ascii?Q?GNJh+WJy+ZAn4ZiRdFcGXt5xG+tSczBCbtlsNVphAxA12x8N0X2rwEHuz6mq?=
 =?us-ascii?Q?849u3JVNjn388bINaeLZcVZx3qVs12/+GmJkZ1S99KvtjVprlXgQVUD6EdaU?=
 =?us-ascii?Q?lH5tg3PJsS6TWk2tceJ2vEqD2QcS9RlYtv8eQxDgTAkGXiMnkSd14tPcWBXS?=
 =?us-ascii?Q?DGZ+AHKejWR2N+ru8D53JS307p53GEzN3qEMUvfpaWczg9jpPg+SBQIx9+bm?=
 =?us-ascii?Q?r/QUiQ6zFMBLt0jsOeMcqh2qj96dfR+1NYlmVOiubWcislZANRsUkZKYipir?=
 =?us-ascii?Q?f+9/PE6K7KeD4K2gyiGzSslu+qCJdxkA+wXwUUMksvUgv7kPnHwphV/BMbB8?=
 =?us-ascii?Q?ZepPk0AqC6u4ysVv5suoLBAj9hX6xY7eKcphyWVlosVC0VlSEjjM8qw5Zl/h?=
 =?us-ascii?Q?MeggLhTUuGfbZi+rDcl96YdZSGCpODmKbkQnlggZ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+bYhKRPJ3h9ipikZKmM5QH6Up094TERrLMlh+NX3qQ9G6burO/7FdXksKylmWhFEenC8PeyO7kNEhvkzhWZxNg1iQtu1FFFrcDp/uehqwoigz6onokWudZALJMpOnECFHWB+pC6WoYZE7102bd5YJd+RiqyIstgsP9jaYTtP8hxVwKr1EO/U8aNesYiJL7b4hakZUgJwNC+LybzsnaTpZM21seqDqg/07hbIDKYQW1xgqyy5MJrQ2efDVigYFzVo+kMcf9a2y/fE2vLCEEdz+ZY4LW1iGHV2K+7rAWgoKewMA8oRNpkT+fRFTq9U8ftVmTlLqlzyP/boCgKoUA1FmBGqMHhAI0PpdholwjIFRbxXn4kzVhw7sDR3FysUvejTLBw9z14tepZ6rKvFMNU3U7v9cWACcZSOn2rR32gld/4LkOKP8sLi/1vhUYbXuHimJp5gYIXvqlrcDmXC8Zjwpv+2zlk7KwmpeA+/6Y29D2CBXYOBBOL/fW0I5jkylVBGdIF4O6mM5T6J6+l7Wy15pZlhOEjFlhZaR8cUEzpdVbHq1ES7+Z7tcUIW9DgBxMo8ZEXADf1ev3rDXB/sMcjMeiHLjy+zR8Q7lwAarMMfBEE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1738557f-7cb4-44c6-0b26-08dda19ae226
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 06:01:14.9159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FrqAENZaDNwPX1K69GejqUu+6sI28tEXzvMqLMrO9XyzTAQzKdo1tULQTeh19Tffh+1nFynpJAicR11V6zvq3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5094
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_02,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=958
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506020049
X-Proofpoint-GUID: NPGYWFho-YoPxyln3RAObJmlzIPx25pb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDA0OSBTYWx0ZWRfXzKcYeIwxCTBq iJOw/5ue2t1PYHZobqI1IMtDq3k085A8gArpPE7ZFGBegI97RAdyInwJzpKYmYco0mhr4+SBF39 u4tTpyjGxs3jwTh+M5lh28Ll41D0AYeG4K2uBfpnZZFOxKKd7cGsaZzX6IzfxmJhG65Ct5UJR7H
 P34QG6onoH+awtA2zJfgI+46Jh+LQoHFWH7qlwxWhbEF7s/AiP/zo7nBQd63R+bDK1ZyrGhJm2B JANsKKuYuoiEU7y4oicp4d2l0u9qAZiOqIDDISotuyJcY7nTdIdaPH8veptboOmF7Ee049YR8x3 Z53AcVjlzUiPpEpSSNfFBcpLt2v6aiHQhlPD57a6jg4+6i2ANCH45WqrtGpytWdaz8jQDhj+/jW
 N+sxOy7zuJwBApCbIKzVT5cTxvmoX3JpCjVZIvFX0qbDwc0BfIRS3wwCpFy65XvVcFyxueDx
X-Proofpoint-ORIG-GUID: NPGYWFho-YoPxyln3RAObJmlzIPx25pb
X-Authority-Analysis: v=2.4 cv=RPSzH5i+ c=1 sm=1 tr=0 ts=683d3e2f b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=SY-sqf6-JIv1a26OW44A:9 a=CjuIK1q_8ugA:10

On Sun, Jun 01, 2025 at 01:34:46PM +0800, kernel test robot wrote:
> cocci warnings: (new ones prefixed by >>)
> >> mm/mempolicy.c:3719:1-6: ERROR: invalid free of structure field
> 
> vim +3719 mm/mempolicy.c
> 
>   3700	
>   3701	static void wi_state_free(void)
>   3702	{
>   3703		struct weighted_interleave_state *old_wi_state;
>   3704	
>   3705		mutex_lock(&wi_state_lock);
>   3706	
>   3707		old_wi_state = rcu_dereference_protected(wi_state,
>   3708				lockdep_is_held(&wi_state_lock));
>   3709		if (!old_wi_state) {
>   3710			mutex_unlock(&wi_state_lock);
>   3711			goto out;
>   3712		}
>   3713	
>   3714		rcu_assign_pointer(wi_state, NULL);
>   3715		mutex_unlock(&wi_state_lock);
>   3716		synchronize_rcu();
>   3717		kfree(old_wi_state);
>   3718	out:
> > 3719		kfree(&wi_group->wi_kobj);

Hmm maybe Joshua meant kfree(wi_group)?

Anyway, practically it's the same as kfree(wi_group) and something strange
is happening there.

in add_weighted_interleave_group() (the only caller of wi_cleanup()),
kobject_del() and kobject_put() are called after wi_cleanup() freed
wi_group in the error path.

>   3720	}
>   3721	
> 
> -- 
> 0-DAY CI Kernel Test Service

-- 
Cheers,
Harry / Hyeonggon
