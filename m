Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AD0264FA4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104661; cv=fail; b=aG8qy5Dxei8ks4CJC+RrKRR7qBGlS/PTabzYs7dLzhIM0szt/WY5EFNFosPmEProCcrjcWKr3/a0HWCMQmNiT+8a58sv3OjBPa9MKyuAHrUx+/8MLMNvUzD1Slt8LPXBglGCXe3EJcnt9rLMvAZZimyxNvFVJH2Pt5HzTwILCfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104661; c=relaxed/simple;
	bh=pdHgrcuwOwe/gxpz/tEDax+5tQ2O1PaCgalKVjdwRrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tVyFB1VfdLAGvRr2dqcwJ3wK4uC+yqNkiyvTkuAQ3DaiuP/NJ1cMuioGPmHKinGQkjwew8coXJVCxAfKOge0G/LhKsvFAfLf7zVtDHWWiCl+L+NpfbfKwYoHVIX+3OII3pKSezzvxAjNlB0BkP2ccEKUduyep1mBkyONJrurIYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ILSkmcvv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rQSr8DQz; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ILSkmcvv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rQSr8DQz"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5381uW0q008063;
	Tue, 8 Apr 2025 09:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=bxQwPc40CICtxcwyaEH/9fV7AeAA8SSgF1epD5ig1fM=; b=
	ILSkmcvv2R+R/OM9NCU7eJDfR1nwXUkOyNwJmZqe+vTXeY8r8k12CdJbatSCZDav
	YSx+iioZqG6hHVHobHuX5KVpkg+AOgWQqEcoy61nUhMB73091fIMlOrsh2Whe+Li
	TCfIXt39SLs6y9bUTJND/9H1wGgH5EJnjJvdwsLZcuiEy9jOUmQD5aXtgUhTSBWy
	Y9GxVPwYSi4ZBN+3KTP3g22cXkiYxuVv7P5EwOPljvYlVgdrrqgQ3ffRCmCMga2Q
	K/ZGwI0iOPkOk+ZoFEglW9yzQeDbTEmzKHv2OTnYUCjMyXF18VEtB+Mai6bjVvnY
	i5ivYp3Olu/8VtebX728sA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tv4svcja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 09:29:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5388OCId022634;
	Tue, 8 Apr 2025 09:29:47 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazlp17012035.outbound.protection.outlook.com [40.93.6.35])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45tty9rn4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 09:29:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOnJLKsMldjI4T5G8ZNxlwnxHmEnzEl0crfuJA6rBAKa/b6A1IqwcDezc9kCCS3IWmSb0+SsfwVdkGI7cjRQjnlaO2O0R1+NPDcUIvkjWN4gUYR1ac1Px8F/azHQfKWfWe8wu6FUGri4uA53w7x7oU9f11oAGHED1HizE1uISLEF5DAeDlB73Jal5w7zMviHludA3u8kli06fUi0MsSOcnslbfuVzveVjM3F1g+Gn9ED9w2hWBh+SUd2LdaRaMgp5KCUZs97vDDasjuMS3H7z/Onr/MMcOZ6E+AY6IXSrDK451QHDIrsPOQime1jesvXsAvUqosb0pNhTrLTolvjZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxQwPc40CICtxcwyaEH/9fV7AeAA8SSgF1epD5ig1fM=;
 b=PQqB7XmRf3M7q7TPZhAOCTXIW2F3VDOq5II1gJHA8uPtPj1yjTWwA0rqio0k3rZYIQ6t1DCswnyuWUGm3fi72iuWjP8C9/1Ry2L4XYlbgw8UeBb5tRkLpPZ5v3I6UcMJDCSnI0x1K0fV8r5bS49u96QElFYqibSQ/a6qDNkADK1SObKVWNbDVA72l1hPNlJG69j+mdn66pyc1hOjZWCIb1ctYXIg4v4tuYSQBFT7OAap+diRjgKdB16swD2+veFx5UlJfwq9E0FhKHbnJdOwi6kTyJ1GeouOOG8hw7OnLEuY7dzDU7f40x7lQ0NvUOu8WgNIUNMMfIuCvEDw2sCHBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxQwPc40CICtxcwyaEH/9fV7AeAA8SSgF1epD5ig1fM=;
 b=rQSr8DQzg7EJXhtOEC0N7y9uWv/rxX7Ov3ZobWa4C6zcRTiIAq6Jcqz+5ycEqrgNQTQ0K1Jgn0/FlCS2UCbjpIfIdhX3qdX7OebUxzSRX/DmBbWtHnM9ysgFBG8rHmTYqAeuPeNThivkV1Epvm9mCMNRpybF70kZzsHmvsLjSlo=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY8PR10MB7244.namprd10.prod.outlook.com (2603:10b6:930:6c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 09:29:45 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 09:29:44 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        David Hildenbrand <david@redhat.com>,
        Matthew Wilcox <willy@infradead.org>, Rik van Riel <riel@surriel.com>,
        Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] tools/testing: add PROCMAP_QUERY helper functions in mm self tests
Date: Tue,  8 Apr 2025 10:29:32 +0100
Message-ID: <ce83d877093d1fc594762cf4b82f0c27963030ee.1744104124.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744104124.git.lorenzo.stoakes@oracle.com>
References: <cover.1744104124.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0186.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::30) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY8PR10MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: 361da53d-3de6-4b41-d37b-08dd767fe5f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?O3T0aBPlRrm5AKg2k0tF3OBcc5UlYMHFIENWeODVTmVc+iWat0zZg/g3i8ze?=
 =?us-ascii?Q?fKe7m/kfX31JCZLysyw7bsmsVL0UkkLNphggrx8Kr76ylNHf2BxNOfuOJLlU?=
 =?us-ascii?Q?w6o3nYqV9dgrUs/i83iTn5WFdMnlsajuz61c5oHw+mZDXI2cWZ9VOxa03+89?=
 =?us-ascii?Q?Q6KyX3gk5dX4CByh9WE7Bsm8NI0rlnsuXebv4RomPXaqAJ7JU7AIYnYVJXDU?=
 =?us-ascii?Q?2KIbcNftZuaeKQodtnVvKTHOOLMnWghExWadeGbGorGN4BYFJqS0nFlY5r5j?=
 =?us-ascii?Q?0I4/v3suaHJbvyEklF/zUZs8XfK+ck1YXAhbovQyAUSlta1SfFb0ixqU5rBs?=
 =?us-ascii?Q?QTy8i2l8SLQ/3TVr7+VSNYiL1n9oQ2/MAGQNGdNPD3G7cwINeG1gUXxqkkFd?=
 =?us-ascii?Q?fJQgWXlEwLA9rpK68zXEulSkvhoRIqtIbPDXmc/+VMeC/lMq5qa4oORg8RAq?=
 =?us-ascii?Q?aB2A/4cHSTkU5ugcjlSaChnTducLfTt+j/qkZdzBazKGvBT42jeomqGnh4BM?=
 =?us-ascii?Q?MyiN1nBp40nkVVJ84n4mDF8IUZaec1GvIu9Qpqc1kR4wELMeYljtyE5BgiLU?=
 =?us-ascii?Q?QWlHoKthM0r93HUlRv0paV0hVVREmzC2yvCPUly824QKggw/IW+QfVJuHJVB?=
 =?us-ascii?Q?fJm9PsJPDdQYJYYgIwTdHzQvzNi+2EmEIrWYvYhmnDhFxyqfxHzoJwRHX/JX?=
 =?us-ascii?Q?yfD2s1cKU2bnn82Eb4eweLQnFTYP6QZk2N5Z4FJwlOS8l3amZjggmCHV2qQP?=
 =?us-ascii?Q?or7HK7m2jLuUvpwp7HPO11Z9z4I6EaYeoPAhywIC4haNs/Vambmvhpludr01?=
 =?us-ascii?Q?HDl3AwSZTgwlPfIkTx7j46jBUNkhGyPgt/rSJ3izlT1OSfxuNJosDLCVI8DI?=
 =?us-ascii?Q?43lKlhnaRHMedfZqxnE9ipB7qJtVYpSlZtJVyq5Mq+FC4XliNlg8erWjV3ff?=
 =?us-ascii?Q?ZkqS7Y5PcOvibMjbBA2tjCx/cQd0QnoUtYFwcfW9lvMxPkO3UEPwqqcZi2i9?=
 =?us-ascii?Q?GdH5eO/I5D8lZoqFVg/aXhHlpQKNkyuFsZA6Pzf+MaXSQ+JQsaoqloQxCdC6?=
 =?us-ascii?Q?EG9ZNY5dsS4xsxcnhx9Ie23MAyBjnthRNpNt0J/6zjUUIz0Z393AYXiW69fr?=
 =?us-ascii?Q?xhTlnYtljXIWhkmmBhFtG1gqRyeAahrDoz2fVspO7SfeUuUI74spF2VQbLoS?=
 =?us-ascii?Q?1kEG1xelPEZ81tlmbE4CLv0Mr0G5bACV8Z0bZo2Smiwl1J9QDtW1KfQzQ30I?=
 =?us-ascii?Q?jjvKY9nZ+o6on7LoEheNDE5t1CLAtinz+RN4IMHx3CvAHvsEsHAWAtiNy6La?=
 =?us-ascii?Q?TkDLezBIuoQMYVeLg/vglrJiCnE7mhq5a3HGWSYpeL8+oNBVvhtoKUb69VR9?=
 =?us-ascii?Q?pFlRMh/kiTd6hDdyV+BV2qtxBZ5k?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+vsLlA5Y53YlIsp7lGs5myukyFreowIF0SWmQfOKqvxIqdD0OKEuockUoa6H?=
 =?us-ascii?Q?ZLFLdo/tFW6Qr7VVLhAKNXreRl7hOKZIHYO7MAP1kj4z3cF+064DV89NieoX?=
 =?us-ascii?Q?vq3ZjgiU6ylh4FW7e+OIHrLHDs+gtwV4u7rzIRjo2W/LPLtGMX7BbnWAtOic?=
 =?us-ascii?Q?3YsqzojMoSvPP/4nNwa51IVq24brlFW6G1zlbubDRaoI+YwMjCAe97B3yCkU?=
 =?us-ascii?Q?CreaG9ZuW9f0f33fxsja6lynnf6AR8yQiX7AnK+Y+xKMeAeriL8mJHVDUTNa?=
 =?us-ascii?Q?7/Fpq7p9SDRA2aBjlfVFGeLftXBD7gTkVHNww3NMRa21NJ7KMjHommKOgEbS?=
 =?us-ascii?Q?o3fFuFNIKfEgrNLu1rI/nHJpKaFjhssBRT76/+vKEjUHULUTHALVTt77v7st?=
 =?us-ascii?Q?0z/ZktiujvXD1+7L3GQ/pxFlynMQnwr7+eEmhEwvAE/fnWQvQHnUeXOYhvIh?=
 =?us-ascii?Q?5ekkmB/suN8Rm4XrPs5wG43xceVSpQmuR3BMftIcXHw9Kjm3WoIblFZQ/FoT?=
 =?us-ascii?Q?anJ9MTURexiRjiTQuqQpmUqijfYfOW0qcZIIvQql1E9rLytKKJloExfrOzZ1?=
 =?us-ascii?Q?XvUlWdJ4NOFoRVBmF6DXPyrApfVRwGOqBUjLUtoar5Pn/Eb0h5YgVNbhFFjW?=
 =?us-ascii?Q?EFe6dGECq6/xq+JgZUHdyNasr7Nd0XxsFNSfhtZzbGPqUKkPRrIHJYoVrC7W?=
 =?us-ascii?Q?0tbujXU/zMjHDSlp9wuc/I6eKS/ZNVxJXngMzekNYMjwiVN6J5250w118jsZ?=
 =?us-ascii?Q?Pst99XuvhVyhZNnUkeOc0dqLLQkZHMq4faledBcgV1KigITGqm+XtyZC70+a?=
 =?us-ascii?Q?5VtsaXPV7uNyq/F1Hb1z6v3tS9AtkpF/Q90UW5aM7uXHxydZ9ZE8EH/u9eNa?=
 =?us-ascii?Q?FcQzYD4t/bcu78isCVaDQsXbAo0+mL6eRZe1G64e60oLqKMy4+fVDD8IAY8i?=
 =?us-ascii?Q?da4k0u5utRehPQk1eYSZ3Bh04PolB4GF2DDcAxauwuDIps0lz6IDS8SgTuUQ?=
 =?us-ascii?Q?tCJF9SmmBuUN9rPQXLcR2F3uEH6HDDrKN7Q/QWOf/66IszC5HQ3CMULcX1t3?=
 =?us-ascii?Q?gkCc5wXTTyrddUJ9ge6XMZItvghjA3xk22m09RBxZdRsPR6hEDX+N8kju7bz?=
 =?us-ascii?Q?tdSOhcqW5pALy+4Vja2o/tryqZKTicb2GoTwMdarwjS4KmAzfx2y4i70mZuN?=
 =?us-ascii?Q?4NJ7clSwqbUsRAbCd+Mi4wYCAyVQk6W4QmDiibB9qkhBGw2k9Xs12cIYT9ku?=
 =?us-ascii?Q?521ZcIZ48ZBv+g2UhYpLFZte1+xKxvKtgJvqSXzn/HVBKrgVmr8avgftk5oL?=
 =?us-ascii?Q?cOsy1nfAO9tBvaP5mLNb6vEmBIdderYJGTxkxv9K4+jdDML1zusdAKS2ZHuU?=
 =?us-ascii?Q?HvQ3m8p0QjMnGuzVEZ+hS5FIK4h8DIGZq7l0R1lROe+VRBu+Ol3oIxvaqh3a?=
 =?us-ascii?Q?pmHBu0cwm9XUkuEq/UbgYATVN89IBJZ8X5GCEYr0NLB85vkAA6XXx/vRhW+W?=
 =?us-ascii?Q?Y+MpnpgcUqP0fDJXUuDzEN/EPi3FwqgYyzMbRiERwVUcEOven128YTE6Ar8p?=
 =?us-ascii?Q?KKsfXo/zCEBylbLV6wycCDrbDT+k/C/k8bFZaUarxFooxkqensjKBwI3ZLYF?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	a9zeQYxtRWvLqLvIhQBxPe2b3L7ztX7y2z5cKX6fj8rJRWLWabRubiWqIfU5YISGrOouItEwDiuHMPT5/BP83DHTqbtFkKBp+r6z4mR65fDfZidrnOdMO80HO+g1qTDvRY1N42KgvcAVIZ3V+azVCqd2MWGZvJohZ8q+DZkzowd543U5jMnPhg8XlTh1egCgUw0t3747H6cQ051vhDvVWd9ejEXL5kKpTJx8LFvDIdhsM8tttvM5uHrR5DNuMpVHDTFMzI7runYn8qaMBksHwEvAPG9JEdhVr7r2R8uqtJslSm3GJhcaPuG8uZLYdk+0IXqjmGy+ZXn/A2pMj4P8KVqwS9z5aQvP25u+9D1prYvijNWW3StuAKEBRr993BH1Jx5N5BWDNC5SmSa7rqMqU/XqY7ALasjl431rygOSQtw4vcwB65Q9tCOV/o+Qpx8seHvcOZqs0irXZHJCa9nsNhoq5L5mS14tzxgzCPn3MQQ6ComIk1DKC0WzDSjlDJIhikOTkInMenMgFXoY1HIJ3pJwhsZjJefg4v8O0TWUReAJvfJlXwiuBZHkeOfdA0Z8BwgKwsc3P4nvZazQbIzR492fspJbjaSBolXVhCiAXqI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 361da53d-3de6-4b41-d37b-08dd767fe5f6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 09:29:44.9256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lsD7hbfK6FikBXaCT4uV4+iBNtChascQXDAMaNYee3f87xCvJYw+3Z6c7Lyy67CLSku6QVOuExtsL047AQJ42hi9WE6qce+x5znt6+UVo+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7244
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504080067
X-Proofpoint-ORIG-GUID: KO3q-jddX1wW2W8Umr3N6eswnuW4UI0X
X-Proofpoint-GUID: KO3q-jddX1wW2W8Umr3N6eswnuW4UI0X

The PROCMAP_QUERY ioctl() is very useful - it allows for binary access to
/proc/$pid/[s]maps data and thus convenient lookup of data contained there.

This patch exposes this for convenient use by mm self tests so the state of
VMAs can easily be queried.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
---
 tools/testing/selftests/mm/vm_util.c | 62 ++++++++++++++++++++++++++++
 tools/testing/selftests/mm/vm_util.h | 21 ++++++++++
 2 files changed, 83 insertions(+)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index a36734fb62f3..1357e2d6a7b6 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <string.h>
+#include <errno.h>
 #include <fcntl.h>
 #include <dirent.h>
 #include <inttypes.h>
@@ -424,3 +425,64 @@ bool check_vmflag_io(void *addr)
 		flags += flaglen;
 	}
 }
+
+/*
+ * Open an fd at /proc/$pid/maps and configure procmap_out ready for
+ * PROCMAP_QUERY query. Returns 0 on success, or an error code otherwise.
+ */
+int open_procmap(pid_t pid, struct procmap_fd *procmap_out)
+{
+	char path[256];
+	int ret = 0;
+
+	memset(procmap_out, '\0', sizeof(*procmap_out));
+	sprintf(path, "/proc/%d/maps", pid);
+	procmap_out->query.size = sizeof(procmap_out->query);
+	procmap_out->fd = open(path, O_RDONLY);
+	if (procmap_out < 0)
+		ret = -errno;
+
+	return ret;
+}
+
+/* Perform PROCMAP_QUERY. Returns 0 on success, or an error code otherwise. */
+int query_procmap(struct procmap_fd *procmap)
+{
+	int ret = 0;
+
+	if (ioctl(procmap->fd, PROCMAP_QUERY, &procmap->query) == -1)
+		ret = -errno;
+
+	return ret;
+}
+
+/*
+ * Try to find the VMA at specified address, returns true if found, false if not
+ * found, and the test is failed if any other error occurs.
+ *
+ * On success, procmap->query is populated with the results.
+ */
+bool find_vma_procmap(struct procmap_fd *procmap, void *address)
+{
+	int err;
+
+	procmap->query.query_flags = 0;
+	procmap->query.query_addr = (unsigned long)address;
+	err = query_procmap(procmap);
+	if (!err)
+		return true;
+
+	if (err != -ENOENT)
+		ksft_exit_fail_msg("%s: Error %d on ioctl(PROCMAP_QUERY)\n",
+				   __func__, err);
+	return false;
+}
+
+/*
+ * Close fd used by PROCMAP_QUERY mechanism. Returns 0 on success, or an error
+ * code otherwise.
+ */
+int close_procmap(struct procmap_fd *procmap)
+{
+	return close(procmap->fd);
+}
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index 6effafdc4d8a..9211ba640d9c 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -6,6 +6,7 @@
 #include <strings.h> /* ffsl() */
 #include <unistd.h> /* _SC_PAGESIZE */
 #include "../kselftest.h"
+#include <linux/fs.h>
 
 #define BIT_ULL(nr)                   (1ULL << (nr))
 #define PM_SOFT_DIRTY                 BIT_ULL(55)
@@ -19,6 +20,15 @@
 extern unsigned int __page_size;
 extern unsigned int __page_shift;
 
+/*
+ * Represents an open fd and PROCMAP_QUERY state for binary (via ioctl)
+ * /proc/$pid/[s]maps lookup.
+ */
+struct procmap_fd {
+	int fd;
+	struct procmap_query query;
+};
+
 static inline unsigned int psize(void)
 {
 	if (!__page_size)
@@ -73,6 +83,17 @@ int uffd_register_with_ioctls(int uffd, void *addr, uint64_t len,
 			      bool miss, bool wp, bool minor, uint64_t *ioctls);
 unsigned long get_free_hugepages(void);
 bool check_vmflag_io(void *addr);
+int open_procmap(pid_t pid, struct procmap_fd *procmap_out);
+int query_procmap(struct procmap_fd *procmap);
+bool find_vma_procmap(struct procmap_fd *procmap, void *address);
+int close_procmap(struct procmap_fd *procmap);
+
+static inline int open_self_procmap(struct procmap_fd *procmap_out)
+{
+	pid_t pid = getpid();
+
+	return open_procmap(pid, procmap_out);
+}
 
 /*
  * On ppc64 this will only work with radix 2M hugepage size
-- 
2.49.0

