Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483F526CE35
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750780139; cv=fail; b=LmrAJ1oaKxTaO/w4bkoFT8zWe+slth9SCwLqojWztO+EiuPtCUTZNQD2rhcFKi8Uoxwfd6H1qCFkCyhweCxajKbrsjHAfVVvXbVXzmmWJQGubXGqxwKsuPNihpe+VqWEp1pYSkCn7MU3ODhKzP/vBQMSL2Usd/TXUF16mNCBu00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750780139; c=relaxed/simple;
	bh=/5Bk0dA4mRIFPdtGQuRCoK3YSffdL8ViYWxWZGnRWBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O7+qKe5DENmJY9ha+Y93zLFBO2ltc3OuxfwGrGsAk+aOLKE+aJR+l9DlJ0mNDiVTdeqMijimu/3zkzH9nOT2/L59cgqWejCkZZ+JCDbbfxSEznZPa1Npr4ahuTyd8o0QEAAe6Xe/Wg2YM4XB6K0J2IeiQHJw8ASQWV3DD/IwGuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fz+G003m; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=I2zEKhd1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fz+G003m";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="I2zEKhd1"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OFMkKd007398;
	Tue, 24 Jun 2025 15:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=NvMwHR4SueEPfnNeTzQd/gLRhjAz15SM65PWgHhtggs=; b=
	fz+G003mDMg8fkimvJrDgj2du/8X10Tx2woJ9uIUpLjxmXheZT186zC2Yunaa+dg
	iF8Yr8Xj2eO/EikKKZbHoJwd7VhfdsNnPewYEx7Rg4X+xIOLXAPB518sIvfVe7Qs
	Vp203F86R0MLzBELHKa//VVZYTye07uh9ORm60S2E/btvyAZIp+bKIt9hx2gm2hD
	MP+gZT9+Lfqa8CBOW2sCutxNm6UwSdV4gBSIjGNuRJ8+buy9UkwBjWUaVshYiTbj
	0F4syCdbppy4dQqnRcp+nFL0BYYr4rteqBywtqZYrO5zABBPvt3RnA9X3dRt9ZJj
	hxB60zy6GBATQP6rWJ2Y6Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egummds3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 15:48:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55OEKVOc039375;
	Tue, 24 Jun 2025 15:48:47 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehr4t4b1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 15:48:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ye4fv8oOl/u7QBVtL6oholOKZk8C+fDVdWXRp++XuAH0yxJ07kNa7du4sCCDB7n0AvayUVWTA7XvYYw5BTmflTe4ekADMbPfVI0oT/y7MyOHgyz9CJ7xhIeViVdDWoaGke0nYaIuxS8DWcoi7ECyN890tKHILpw6uSoEPGDfvpmg1IqXUk4eljBsJ7O+T9wvD31Ws/S/Mf6HmWGGdbNQhczf2oZ9PG7JI6moBrX9jOOPfSU9FyCs8R1AFRdQgEFYiu7VBbEJ3zJuSw/s/bK7V1XQQOb/TtVkujGMVHvCFlMFc0P0s5nyCUfPpPoOHYxDY769TOVLKkXs3C6FVHnEpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvMwHR4SueEPfnNeTzQd/gLRhjAz15SM65PWgHhtggs=;
 b=BK9swaVXpumo6eSZsN7tk3epi71cmSd/mOynlyJIyBM1MPqhqd+R+XDk51WIMAI+FVWoB4FDOvjyW80T3pcCdLJOPzhyLZDDwOKjEZ2O/RmlIs7C5Js4Kpb58E6R2uX4UuRoLmoX7OeleISOVyVLAhUCpOHhr1RA4DJtPutJglrUE6LPs3KZd1oERhtMVpUkccAKP6nMh3O0Q1kktbQf3nPkouAnaGtnMPV8Ev8V5VwQ2auB3NgJEC8K74sud22vlbqWTyEJX1+yHwAVRdblpRHXOjTst9szjFrUdr7e+6v9Mjvb9gMfrs25IEecSCbmAb0/B2/iXw88ZmuZy8h2mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvMwHR4SueEPfnNeTzQd/gLRhjAz15SM65PWgHhtggs=;
 b=I2zEKhd1SOOyPRiAiPWLQ/nsi7A8ArkywCKf/ghu+P+JO10qDzgLelCQWjGF8+R7GKXbmLcUtn1L9M+5ADK2AlHcSKRsPJNNoOizA9BiS7JGlIV/zwB1aN5AvpN17mxcqxyMhMGzrw/RgDWAOgLFJ8rUKsfS+URLI56FWjF4PjA=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SA3PR10MB7024.namprd10.prod.outlook.com (2603:10b6:806:318::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Tue, 24 Jun
 2025 15:48:45 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 15:48:45 +0000
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: maple-tree@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>,
        kernel test robot <oliver.sang@intel.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH 2/2] maple_tree: Add testing for restoring maple state to active
Date: Tue, 24 Jun 2025 11:48:23 -0400
Message-ID: <20250624154823.52221-2-Liam.Howlett@oracle.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250624154823.52221-1-Liam.Howlett@oracle.com>
References: <20250624154823.52221-1-Liam.Howlett@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT1P288CA0001.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01::14)
 To PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SA3PR10MB7024:EE_
X-MS-Office365-Filtering-Correlation-Id: 45afeca0-90ba-43db-07ee-08ddb3369a4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?po9K3rxo4YD+LUnqmqZclTGTxpXPL7OWBWKTp6Gx0mEJDOUsfSJLmpgcdRVZ?=
 =?us-ascii?Q?FAE9gj6OYSmvHcV5krGM43uE3AG2nL7VIdMtK+GgXsT1cHGQ7tysQNZH1vk+?=
 =?us-ascii?Q?Y4ev2ftF3AOr820H0hl5QP/hiyTr7QL1klB4pzvK0AeXlCvjG8c9FkJE5ln5?=
 =?us-ascii?Q?FUIlHMzvIYUtFPNc6yJzSQAExMLXgsRwEK1Bk68CuYkZoFXH84zfE/ytVcy7?=
 =?us-ascii?Q?FkZz1IxHl59tZTlpWP1Rxf47VENJgL5IwRSeUQGZpgxafeG6L3EBt0TOY7X5?=
 =?us-ascii?Q?yRX5IqWB6dJtm4UsQvgUwIdE6NhOBQz1kUgnzB04bo1NBJyuRErJFWnTDPDC?=
 =?us-ascii?Q?M9BkYqGXbmiQ6GUms99hqge/HIw3XQtpaLwBuXo5ulj7vV7HA+9z9jpND9/j?=
 =?us-ascii?Q?gCgh4i6Aq8WaV7zAUPQtedvxn43sFXACTsvB53An8PoLlm1GdqhrbwslYgbn?=
 =?us-ascii?Q?rFO8cSBtD1tSCUx4twezd3WGiv4tPJO1beFmhU//mPXTT1+y6XJeCeXGCkDj?=
 =?us-ascii?Q?OppAVaLVZuHn7gpgeh1YBO1O1fOHxKQhYcCtaxpCrntokg7u5U+yx47qdE65?=
 =?us-ascii?Q?Aa9Hl+pjILm9QhkC+x3Uf/2qJC+etZuZGUlKgqXR44dPeNw3NHiZ6jSADzfC?=
 =?us-ascii?Q?BtP9sH72bddDbEAEgOxDV/qdM9rMmOsvnthrPNfAHzDA3eexObPJ+Uetnokw?=
 =?us-ascii?Q?XluV3rDCua0GH7xT5mjo5OuiSYm7+mpzIe3V8VI/36oqHd2E7TvxDPhaPQM6?=
 =?us-ascii?Q?CUvRoLnA5BWUm8WBg5IOswQltdTlm3xsOhAUl8rTYMDmOait1nPPvQF9XJG3?=
 =?us-ascii?Q?A6jYlbAowxF8823nK6fHgbP82TAPlztg7kibOmXfgDfEqXpVX7a6xAZhD+Ww?=
 =?us-ascii?Q?KQKzjEXLP+bs2zUR1+yMzktlseM7GSPnzOqYIZ+BkxoTWeM4s6Jya69YpV5m?=
 =?us-ascii?Q?jzI2aYQzFI7LXJuVxmZuahd9oGfmRkZh9LTnju4edSPsw4y32W4DVbLLAKiS?=
 =?us-ascii?Q?ZCN18EB4d1l3YK7nMqIi86IpAwadfn5T7uyEhAaz4OQzzSdAWrF0TCPiVBFM?=
 =?us-ascii?Q?OqDRpWBKcZpqYRiZqtPW91cuY6rjCbM6LP8AKaKnu4/bEdLkt6NmEe4ANIPz?=
 =?us-ascii?Q?zBu6IDHzRTp3NWHQxHuxt4WptcCpPuoV1DCTymINBVayLmlDtDO0pZOrPVW4?=
 =?us-ascii?Q?HFkVP2Xj9W+60WZepr7CMs4tGMUdgqnCFggC/nWRGRXEeUVdefryRmMfoz6Y?=
 =?us-ascii?Q?qomi/B7pCt7BnV4KJ5hMUohwmb//YySAasq8Pk/Zg4PtIvZcVeyC8kaSZxne?=
 =?us-ascii?Q?qwsicS9Oh2YYXSrvP34Rj8PFOejlNv9seWYOj8IQKWOcu6VNWgGnZEfb2jyx?=
 =?us-ascii?Q?hazsIfyatfq7SfsPF8XF9mN1o67rXi//blY+VdlVS8YCQs0p2g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PCuJN7qwc/Gns2I5wrAeylW+oI5v/yC8fIwCwKsHnOcYQihM18/Y0Wb4PdKC?=
 =?us-ascii?Q?mJKl971KJ214ZDnQgpHCh9bSlJQD2c71catInxa5PVSGVMfJ807n+wxBBmv7?=
 =?us-ascii?Q?z5tjK2X62JMrzp4KNlag/Ob+y72WW4e2Sqt0P3bCA3sJqor0sR0xSjNFdEzI?=
 =?us-ascii?Q?1Kx9QJu2YrUJab+C4krAZmB5+CGmKtZAvFS6oJceTXZrDDyUelB8yeL1kKmi?=
 =?us-ascii?Q?9pZjOjvV9eDnxh8V0SGRYu5L1lRv2/GIR4DmPn0mEWc1O2Aq5fj6hbhig5yo?=
 =?us-ascii?Q?yl8BPT5q5V9QwQsyrF4s/dtI4oGVZ+FOWgNcx5+OyszwZgENL5nq5nNwPNHm?=
 =?us-ascii?Q?C+Ly4Jz/gKTJ/71Dy+Q4d+vaItCtDQyBIyubtxcWkwgw/EpVu8HntzFw0Kvr?=
 =?us-ascii?Q?tckrodpFqPyh8OBEMTXpx+WQX1pXff2ffxIjG7ge2thRVYpW4TGagQHB4OFr?=
 =?us-ascii?Q?ITh/aldgZgUNBqTUk6ZSLvg1MONGH20fYqcJrM5n4lCN/MM6MyOtuNgutRvt?=
 =?us-ascii?Q?osHv1JiopoGe3IpAsKGqn8Y5srH7KXbD1tWU17lGjU2m2WGSVVVHSmq2eXV4?=
 =?us-ascii?Q?stLNIEKHyl0/UKK3XqNaa5A/POpLoYEzSU66TUlY90hTdz9tMZQjWQVrtKzj?=
 =?us-ascii?Q?XB1EfiuCoyXgF4IoO6tjxr//Pjd+OF1PveCcZDm1YauwmTwij+F1ldolTEW0?=
 =?us-ascii?Q?WcH6b4L2JfYhcYqv/K7stBN/TPaMLBQs2uS/oDqecPCJImj//A62tVv5dCz+?=
 =?us-ascii?Q?DHj2wN5UHuQkoqY1SHs/VqjUG5p2TOoWzcF92zQqMBTp+tcXHq51ZPtyY+66?=
 =?us-ascii?Q?fNos9bMoO+VsXu4+oLzdCc/kLZgVYER24U80/1oZ+R9fjzgpwEUcWm7wf8nq?=
 =?us-ascii?Q?8SpKujpTYb1LBWgX8c3sxIleNVjWRkXn+T1KM1bZ8i9Mcfi0/hFXlvqofFhl?=
 =?us-ascii?Q?IV8ZcFhvhSUQ8bIYfPRWAa3Z2DKrAfwgIH1w/Z6DPWUfAYAviV+8w5+UAhMp?=
 =?us-ascii?Q?XAGH7lgCegdVi9ctk5bQd9VBZUzhc/SRoh33IcdaYULFh+eASHYa1ydDjpBb?=
 =?us-ascii?Q?nxKA2imz4yIyXKqkkPMNDigyj3wUkIqtH8+8mTcjKFzSAMSZdDanti6qP+l3?=
 =?us-ascii?Q?fso2sbYi4Ncg5tS5hOHyO5ykvAuiHS+vf48xJbhzp/Fc3ECN+YXdUEkV4GBi?=
 =?us-ascii?Q?q4rUd45cahiKZIjSrP2Y0lCJGwPp7esLInQ/ylU9KD5hkky68mAWv6s1l2Aq?=
 =?us-ascii?Q?eIirq30DOpND+RNiBkvioQ0QEQwfkPad4ZIQ0fjBYqUb2U8eZWR3LRhwhdGc?=
 =?us-ascii?Q?TSXUmEJEVR4Eyy/UdPyr1IqUNeYnPKqpZF7lLGZ3EYaB2c6B6RjqcjgU/f9B?=
 =?us-ascii?Q?A/iedrc4/AspP6UUi0f8I7xSapGSH8BykbVvbeppCwIcQkg/PglCbSyZGni2?=
 =?us-ascii?Q?TxVqRehYYHecCcARPSeYL6siIn7Je5NR1slIf+dffvwZ2slwUoHgHiOMzUjn?=
 =?us-ascii?Q?6a9pdrI92ZYJaSS+wXTwQ1p06ItUYqfKX9NLsGjE6/dr+EErb8e5NFVnt983?=
 =?us-ascii?Q?RHSdDeWJYjWrv+b2uNOfFQjpx3tyme6DgBSAYZgvDkiC0D6ePVKZIJD2OasK?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+DNgKodabtw0CfjK7KiSBB6E7wr3LT3RhCk89fQNwPe42hcfpKLZBFUJO5TdAGplOfNLwP3aml10R4SAKvsHObKGgeFz2Fp9/PxuktGkscZ/TXZm7+XjqsjXmI/1kkECu21SfMJzilK2hStByAeDA51k+A7NnZJRARRE/j7qEB2l97ZKi9X2Sdew62eYGgynwEXofPU7rsZIrWV94k68F3Y6tKtqnJTc/sAxRyAj6TKSWV7wLOuIFkqV1Y/gV/KzodHPJK8Hq/PY9/axyaa84WatyUcrR02LQD1p3Dbk5ZthtQE9QSePY9jQ+xWaOvLXaEgiFXf+1ltDH/maYMmbB3T8fq0wNjzKoDKtCpv4mZQkQpOcL2UNeoEPpJAhiDiShv8KlwOuY5NaqvNbx6FhYiB9hgY20PqxZU34T7hmZRuBc9akLxkcryih7k6UQzt/tr1pUOhXkhBorqvRl7m4SO6D0rkYe5xIkOr0x1FKLyaApqI1F5uH+zwKJt+C8baGDM7M3JPheMdmaetPhDWFF3RmUgcKsMXHRCCHKHoH3fikc33YMu6ayhA97LblEsYb67rp0vhHAyAxgUGp2e4ibBxOKMU5h/f/VvBo0slqqWQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45afeca0-90ba-43db-07ee-08ddb3369a4f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 15:48:45.6092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YqxtorQEw03d4BW1BWFEiE9UP/LHSI2DTKalaoSBkVjjO4Bwk9yeguVRATTsJtXjCbPIVeWX0ct4TJM2bPd84A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7024
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506240132
X-Proofpoint-ORIG-GUID: IPYq31Ie6zG89ZANiu8DqxFBXVPQ5S9W
X-Proofpoint-GUID: IPYq31Ie6zG89ZANiu8DqxFBXVPQ5S9W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEzMiBTYWx0ZWRfXwIXje+kLGWNG 1b9XjCgEs8wWYJmexHxMZX9Qai7dg2vAmmy0tqtF/zggalpXW2EsBiS//jOEwOcIgAeQ3JnMbMD QNge83c5byzeA3znj7dY/7Arx6t3GGXVUCy1Qx1fivEQwmH892z6LzmBSzJ/7S6BED1/qFSVMTz
 fxeuH+HdWUh6GYD7uXov2dppo6aAMF6004KMAPBtcrGlM1f2zvAS3hw1N+U0Q5tFQOyXbnAGhet 5vJe3WJGbOCOYnaEM4ezlLo5TmEERAmhzlumNq1abMO+dPwA44KO7gqz/CS4Af+MYshM4Klitl8 BtZGs9JYWXTc4UMtW48cen0//b//5et5oDRZBuFkP6Pykw3HI39uBEIz9zu56M5TdSVJgtGA75J
 AJkcVBZTPtMrNYrSnVVTHzvk9PntjPDqIuizbbfvhMNVnDlM6laTcMsbBzsCH0Z2b5SDZWPV
X-Authority-Analysis: v=2.4 cv=S5rZwJsP c=1 sm=1 tr=0 ts=685ac8e0 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=yPCof4ZbAAAA:8 a=Kd4apdZO_V0ONr1yY9cA:9 cc=ntf awl=host:13206

Restoring maple status to ma_active on overflow/underflow when mas->node
was NULL could have happened in the past, but was masked by a bug in
mas_walk().  Add test cases that triggered the bug when the node was
mas->node prior to fixing the maple state setup.

Add a few extra tests around restoring the active maple status.

Link: https://lore.kernel.org/all/202506191556.6bfc7b93-lkp@intel.com/
Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
---
 lib/test_maple_tree.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/lib/test_maple_tree.c b/lib/test_maple_tree.c
index 13e2a10d7554d..cb3936595b0d5 100644
--- a/lib/test_maple_tree.c
+++ b/lib/test_maple_tree.c
@@ -3177,6 +3177,7 @@ static noinline void __init check_state_handling(struct maple_tree *mt)
 	void *entry, *ptr = (void *) 0x1234500;
 	void *ptr2 = &ptr;
 	void *ptr3 = &ptr2;
+	unsigned long index;
 
 	/* Check MAS_ROOT First */
 	mtree_store_range(mt, 0, 0, ptr, GFP_KERNEL);
@@ -3706,6 +3707,37 @@ static noinline void __init check_state_handling(struct maple_tree *mt)
 	MT_BUG_ON(mt, mas.last != 0x1fff);
 	MT_BUG_ON(mt, !mas_is_active(&mas));
 
+	mas_unlock(&mas);
+	mtree_destroy(mt);
+
+	mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
+	mas_lock(&mas);
+	for (int count = 0; count < 30; count++) {
+		mas_set(&mas, count);
+		mas_store_gfp(&mas, xa_mk_value(count), GFP_KERNEL);
+	}
+
+	/* Ensure mas_find works with MA_UNDERFLOW */
+	mas_set(&mas, 0);
+	entry = mas_walk(&mas);
+	mas_set(&mas, 0);
+	mas_prev(&mas, 0);
+	MT_BUG_ON(mt, mas.status != ma_underflow);
+	MT_BUG_ON(mt, mas_find(&mas, ULONG_MAX) != entry);
+
+	/* Restore active on mas_next */
+	entry = mas_next(&mas, ULONG_MAX);
+	index = mas.index;
+	mas_prev(&mas, index);
+	MT_BUG_ON(mt, mas.status != ma_underflow);
+	MT_BUG_ON(mt, mas_next(&mas, ULONG_MAX) != entry);
+
+	/* Ensure overflow -> active works */
+	mas_prev(&mas, 0);
+	mas_next(&mas, index - 1);
+	MT_BUG_ON(mt, mas.status != ma_overflow);
+	MT_BUG_ON(mt, mas_next(&mas, ULONG_MAX) != entry);
+
 	mas_unlock(&mas);
 }
 
-- 
2.47.2

