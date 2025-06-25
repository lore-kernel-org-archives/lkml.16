Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716BC2F363E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 23:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750892830; cv=fail; b=I2WjX07IkMwH+ia5Afwsm39SYcG01PLnadjsB95FmlPUBM2lIiUwH4wBKAVGTjizWsmZsQaLKKkn/kXqJZHdR2UVKPOLGndkKkCWmk/bGR/lM6zGsfNPaH9C3+XAam3+QYFNgNsRpr9XlzZCOQEoCmRYC0imk8HPQ6iWZ2WuEOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750892830; c=relaxed/simple;
	bh=X+0eEsMP7uPiDmERftlx1KNN6wlHuTcn3yV5J372HvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iiLGrhpYkPIpyq+B+RFg/Zz16Tlf/hnf6ZEmkUwLjgLSjFjmV35t1tQxVg6bV/WMP7bz1Ekm59EtsBsTKAMQdNFFMCOKDccOFax84eAjeeyk4dxNKDbrdzbkMZVW2lqj8BaomuLgFOivFuvoQGbrdeQ0dz1NmdCWQFp5cVg+hZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=S0+pGOGH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YWDNnup6; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="S0+pGOGH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YWDNnup6"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PLBgGh026323;
	Wed, 25 Jun 2025 23:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=RilHBXzLQU0T/ouwxz
	ig0QnaDgUZuHs/NtZbEfZEDb4=; b=S0+pGOGHKfFNovwaRPWeiMuBkMAMxNFDns
	YfHUfLgzE4s7qxtCET/QlO8iH2tZVHnZP6+m36sqpZVxwOqYu+/EsCBhqzmxwhxL
	7OFaNuRZ8XPR1RFvBOEtYiD5myO4jo6IooPXWnNtPEY4TykATGGzjwQkiHadGT3H
	kwyk5PrxCyzy+pQzoF1601ueKWkhMJP8idLP+jVGKTyvrNvBpNTT+bsBNZdNgTEW
	s4u77L20TAKjLa72JWZka1sx9mBX/pvPbXhIKe07wHhIkn/9Ewo4GTrpqPeP13Ey
	tHlCkuKRZRoBGMqG7sPVAvGcxN4PHXfxxJvQB/4eW/ZfVHX0glbw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8y8q1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 23:05:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55PLhjX1034431;
	Wed, 25 Jun 2025 23:05:53 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehksr1uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 23:05:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aiyWLYWRnJqK8J5IC3kuP7GIABifA8MnhJoTTqKDEVg/hv4atMMe4ZZwn6FmU3+98oSI3X8MSqYti5l05LsTKhUA7ANSG5VV79GdVU34qu9a1qAWhu7g+Su7Svo2g4m6EuvpdPJiofHaRfE2etsA2vILmO3EIdms83GKHM5eshs8Pf3a8FYAW1h8ikM24D+XDXZEOjVmY2bTHCqQWadaIRbxXl04b5mwgebV8cmqvbUhp4p3JV70ruRATtHqq8X//GP4t69yFtxrYaFarBcF/W3Vuj8V1Q8MSFQu/Sv/PSUPEK5WnxDu02gNLSiNxkY2FIwDmqkPntGAjEcqZUXuXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RilHBXzLQU0T/ouwxzig0QnaDgUZuHs/NtZbEfZEDb4=;
 b=fSkuO5gZ3348FAoc9Utly37Wx+Bsoi4iPfa1mAAmw10XEUjDVTwIYFdT4gIKNAwUrCGAudEQqfKx4iH98PB7Wn97X0pc0Qb9H212urDTg3N8F7rcqFRSrcKhOmLUuT1zmeygm/CCxxf4FeNEwcHmhqP2gFT/5fGRTIgxgCEd7fQmQfMNqNZ9Zd3SO29Rfxr5oB3KP2Ur4/+R6PYdH24OEbcl1pmycFERYuStQe2jZVSUCHMHIVj5GRbPlJthmvOBybxYQFw4NyhDBbPYplj0MkeLkAFL2OcXqrw/xXsxhWql3mUc+ieYwtEhVtiD3gCUyQ/RJzfQ/vB5MtaFQFg3Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RilHBXzLQU0T/ouwxzig0QnaDgUZuHs/NtZbEfZEDb4=;
 b=YWDNnup62v5EvGCnGzh44oErazjYMQiV2Srwg9AayByakyVVXTxYrHS4Hn5jrTF3ly7PwCTRcXaNRqBN090xRMFGIh3whGhGNfHz2wanaVxPgvMuXxXPIW9o1lrgPNODhm5xJHd9DC/fS2nZJ0bdpxNf0rTskIbu1Tosd5U3bnY=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by SJ0PR10MB4751.namprd10.prod.outlook.com (2603:10b6:a03:2db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 23:05:50 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%6]) with mapi id 15.20.8857.025; Wed, 25 Jun 2025
 23:05:50 +0000
Date: Thu, 26 Jun 2025 08:05:30 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Raghavendra K T <raghavendra.kt@amd.com>
Cc: AneeshKumar.KizhakeVeetil@arm.com, Hasan.Maruf@amd.com,
        Michael.Day@amd.com, akpm@linux-foundation.org, bharata@amd.com,
        dave.hansen@intel.com, david@redhat.com, dongjoo.linux.dev@gmail.com,
        feng.tang@intel.com, gourry@gourry.net, hannes@cmpxchg.org,
        honggyu.kim@sk.com, hughd@google.com, jhubbard@nvidia.com,
        jon.grimm@amd.com, k.shutemov@gmail.com, kbusch@meta.com,
        kmanaouil.dev@gmail.com, leesuyeon0506@gmail.com, leillc@google.com,
        liam.howlett@oracle.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, mgorman@techsingularity.net, mingo@redhat.com,
        nadav.amit@gmail.com, nphamcs@gmail.com, peterz@infradead.org,
        riel@surriel.com, rientjes@google.com, rppt@kernel.org,
        santosh.shukla@amd.com, shivankg@amd.com, shy828301@gmail.com,
        sj@kernel.org, vbabka@suse.cz, weixugc@google.com, willy@infradead.org,
        ying.huang@linux.alibaba.com, ziy@nvidia.com,
        Jonathan.Cameron@huawei.com, dave@stgolabs.net, yuanchu@google.com,
        kinseyho@google.com, hdanton@sina.com
Subject: Re: [RFC PATCH V2 03/13] mm: Scan the mm and create a migration list
Message-ID: <aFyAuvE-dksvHqlG@hyeyoo>
References: <20250624055617.1291159-1-raghavendra.kt@amd.com>
 <20250624055617.1291159-4-raghavendra.kt@amd.com>
 <aFxzEFhTDOyL4y0e@hyeyoo>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFxzEFhTDOyL4y0e@hyeyoo>
X-ClientProxiedBy: SE2P216CA0162.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::7) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|SJ0PR10MB4751:EE_
X-MS-Office365-Filtering-Correlation-Id: 8624b230-1936-4e0b-1909-08ddb43cd3c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?avjtINYVX06wvVIK5lHvEyNGQGQaCSo4rL5SA3qMhVtnQzOzG/bqHrikCc99?=
 =?us-ascii?Q?Q+Fr7ZmyX1aECoRCTChl9xKmqrzlDVGX34Wa6gvvrlNPf/CA1tpV9PRD+8y0?=
 =?us-ascii?Q?RnL1rrHk3GGmqbe9DgM9dcz3wvBuNjtmeRazvMdYa3wM6oxaJiKAkNU8o2yv?=
 =?us-ascii?Q?hg0daY5habcVCrlRmdvQHdBlkbCZj+U5Ywh/iuleKvW3SQuAB4/7FxKNddDi?=
 =?us-ascii?Q?LM9tTZAUv0nREjDS2YCntxR6IsPAdo9IniK46yVVoyxe0lRxAlbM/P5l2Umx?=
 =?us-ascii?Q?PzVqH3aNDyDolm+ONhI0JH2gNxPZPyhbQcvem8xe4qRVAXVoW0TpX9rtfV/G?=
 =?us-ascii?Q?pyqtyVFDWWFV4ZajC6cCemDGi7KgkFdeX7lkBkkCWNwo5c+te3J2vAdjP2U4?=
 =?us-ascii?Q?cWKHZpJknN5xewjfHXPV1PUBBhIkDIYVfqoZnqi08Bxve/mtzlf2DPf83+sM?=
 =?us-ascii?Q?j1PfwNsFykkitWssg2cJQjwM4qNNTzRiulE5OVNPRS287yAjqjIdYtBkR/cw?=
 =?us-ascii?Q?L67IjB4ZaD8e2NoHZUZ8fmzdyFIUVBYxUWuOUShySw7vQ27SmowxkAURs3eF?=
 =?us-ascii?Q?Or+/489a/aNFuHwrPTmkG3dmTXexCXwCpmi6uB7LDgcwKuJeY7nlZCVTf2vw?=
 =?us-ascii?Q?cljzHMDo5pgE1gMyQAmgQvYqgMa0+/5F2HFMlWtufBfjKYOJMs1/Km6Nuh50?=
 =?us-ascii?Q?8CDAcgVc3rUk4jwZtCIolUjs8lq5ZeqTFWXMCaDnKC/k/F5VFhwkuuZI59yi?=
 =?us-ascii?Q?2FpbT1Jx3l/CblKNCB8S/BmZVykMEykAails6W9lLAx8B6JC4eW/GKOaj79m?=
 =?us-ascii?Q?//gu2Gj52aVfefRS7Cg/EmP9wTUdt6PDJxcNyV02CN1s/5phNOOJnwIrkL5n?=
 =?us-ascii?Q?D2cq3pp/gchqK6i5414xNxEok9LjYMbtNBnHQ6lQ3EB0fmwdRpDSNI0uNiCr?=
 =?us-ascii?Q?/Qs8Kvi+u54U2969CvU/diQVVxTg57eJfbp2Hql1aReu4NU5nVg7zsWz+DB0?=
 =?us-ascii?Q?X5XKdD5YmVXLiwB++CDMVFzKJUg9DdENcKNndi6lwlmmjUOSJXMEhCYWXXHa?=
 =?us-ascii?Q?90+11UqEqlX2SO1nqBXew5HjMaGxuBn3FM9w53NxuysgoyoCoK95vAOqgOnd?=
 =?us-ascii?Q?MQvw87JNsH933nT2TnmT7n0uSCWkBnQidMGgLVs8ZFDZE8H1X9dgDtKlmSpy?=
 =?us-ascii?Q?EI5aCAbSWMYwOx6WJbWx4CCb6OCCqJqWe0rnkr9Ggao2bu5jQyoFMsrW8h91?=
 =?us-ascii?Q?xLmoqbfJdnCk4mYaV/FXCf5MjMe5tjXOELfQqEUGG6wNnSoD/WNeBfet1Pfm?=
 =?us-ascii?Q?ilXqjZtQbzpXZVY0ROphfCMT1MUUQ1k+/62s8/P4R3vkonhG1tX5XFBEF3sT?=
 =?us-ascii?Q?oEwr00Y1OsZrKV9ktHflIyUwflSQKCUpZMzmjh08Pfz7/qn53aCNYXGiMBcZ?=
 =?us-ascii?Q?R9ZiWSIZ0Vw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T/po8k4RM1AgpNJCHagv0Rgj7CveNgVyG2qciGAvZvnMXvwrZQw/XY3KlLM6?=
 =?us-ascii?Q?J61QOG6fOEupJhYWh6wwO5U0Fx1FHtC4RPuMv8Nq+8it8HnQlgwRjsWiJu4Y?=
 =?us-ascii?Q?mhFd2D7PHKi15cTVxoqmGw5NZK2J664NaI8mPQs0BVDkL5i2shsDANbrK3B7?=
 =?us-ascii?Q?EEzOZyRB/7mKsYYxi0iHx1UwwjK3NpURq1EMdUtmYyLKZVa2Pi56dGLEmiwq?=
 =?us-ascii?Q?qnufJ2cvD/7IbGZdvgdOuKkCBY2LFwK9NdmuJMUNZkpdO9NRIMPl3Ux+qsA4?=
 =?us-ascii?Q?tKr4wLqBXDaO4OaNCKIDuWivtDQ3RXuPSWSgIAnJpfkX0SKq8tWvjGSsbiXN?=
 =?us-ascii?Q?EwVlLpi87pjBomMYU5HOEENJpL7r90g2KTL8fU36KjyI+3trkvHbFhFs7Pka?=
 =?us-ascii?Q?2ZktG2+30OuitFv7HsDw/nI4OOBjtMTHNJPp1Bv9DKbVSgCu2zT46HWhx8DB?=
 =?us-ascii?Q?niXVEa1R+fNny7RqfwZdey4tUS99mxKXBICpVRIKdFXYQKCfExEdfRpJemGe?=
 =?us-ascii?Q?6W3hkfZFiJdFFmg4Y9O5nhIECFU5OzN/cK4JzjZU98VVKdSC8mYbII4iab+e?=
 =?us-ascii?Q?oQi2SnPtvQs5CKF9YHobmlBWSdNY77ZcF9OR/2r4PkhSYZMbw1sYUoRyyiYL?=
 =?us-ascii?Q?Buf5PL8BFUMYoBfU9qA3ZTBLqzX3KYw6I52kFr1og6pWp7ds9gyvQKuZ9I3s?=
 =?us-ascii?Q?X8GUbs5KlIPGNbLvanHwSJhyc+4vs/mW8IrINRiIfQM/9pWXRxX5PCFTIqO/?=
 =?us-ascii?Q?nL9jsBuiC/E3rwjZMN0unxx2a5gOp4+rqCptENpAevui7HcKUH6nmqUMZx+N?=
 =?us-ascii?Q?AKJ9PXcr7XYeCSPe/IZAUhoQMd7Errq/slVhw1qnVuO+aD2ImxpOvX9PuSGL?=
 =?us-ascii?Q?Dde+HXqbjY4cDUnR23zKpNsCyebW4NxMZVdYzGC1suBj6hFKGx9BRiwkSdah?=
 =?us-ascii?Q?QKx3kj3FJA/JuX3ad1KFUNN3uJqLpeyLAMQjlJqyDnJMjMCAU2jAKByV7y14?=
 =?us-ascii?Q?gq/+ac5xy07uIUNOQPdq6GQCuVJCZsAS1htKCRiR2vGAnt1uTx1yrud2Qzac?=
 =?us-ascii?Q?24lqJMgeODEN5q852/s4oahveCrDC9Ia+91kwxAK/tEVXl0XDZRm+79u3Ovr?=
 =?us-ascii?Q?4IVUwxcMOXbrVNOCs1thfTTcj6lhZtV8mqIULZ81+CLHgnxygrOkWh/xqS0o?=
 =?us-ascii?Q?tQXBoSlm8tBMwMKXsmKGsZQX8AHdUwDPBDWAK74/sjb/S+8rJJJDhfUDyfWd?=
 =?us-ascii?Q?CTZZ6Eh0su8LzPAsAIIp8QOa++43NwKjSrhexvtsCVzY8UuQ6rKjSbjgPjhT?=
 =?us-ascii?Q?3A+4NfI54cBFlVdSE/LKKU16KZnWldkIUYnkqMrIYFWekGN2gTtlJQ0rZGFW?=
 =?us-ascii?Q?zG53QzY8xgmK9aXVI5PC1lTB6lSON7zr9o9zSUBOuIe15T3K7IIyc5GEera4?=
 =?us-ascii?Q?Zr2CAmFcsYavmnVLlIYKQDFQY2BkaDV2zh2MhgJ/QWvPPyyN2CQiU+fkgVLS?=
 =?us-ascii?Q?vLaIyAnCSQs1DUUsQdNXY6TUxhAX5WVSTIITK4bnWhB3Ozcfq9XxoKY8Ygy1?=
 =?us-ascii?Q?ElqbmzSfgqbt824G9GqtqgeaS3t+R22D0BWpStZM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kuPpoNQH3b/13cwaeLHmK+JhtiDgYWkZXN+5GWJoaKhbnR05J1Vd0e4JTt4WzKMfQowgGyFBlX9KMq3N/M0BEv4yz5coHJHJB3ALsR9biOd+gcl65+ioNsstxGS8DHnqwNp6KjWHP3s6YqjWI2uHV5e6YmheGoo601O2UeQJY5p0yhVjf8oT+eGx+Cf8LLs8PkcZcAtkx3lsqbBsjPpUcscT+/IurRP3Os8eZY1ECEp2dHXfTqfsAAZrtcC/F0vYGgq5Spqg2DeIS2B6PykQ7dEKyzyXUDkiba9yhYYRzg/fOzZg56r1Dl8/WNXRQzaI3XoNseKjp+eEoPSxhqE5xeyMCbrfe4GRQYHkjrFBtaH8zciaQfwwP7BzQniLoSt3GupCh21Ih5eOcYc5htqeMGM/PTsyp4SOK3upMxpAianmDHuptYUuODCnzAlk1s+ODkv+ODxoy6xyok0LZRRKnIhTRPvQpCewaEfl9YCnb1k1nQ/i7tTy4TnI5WALX/d+q7QmfmbsHhNqYLtofFVzQVNmNUWCjuurlqH/eVtpjGeNc/eShW7fHLLdXy8I74IpEnnvn42v2XpACE+UcPNYoXve7Om3JRE8PMnvSwub3Dc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8624b230-1936-4e0b-1909-08ddb43cd3c5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 23:05:50.3578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uyvA2mFwzhzBMAsfKgXsWSVi/eRvNGPJpBWWj0pNjDttphgimyHEbm+ERE5bfc4xxa1h+JJeCwO7uO6tnXzKZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4751
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_08,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506250180
X-Proofpoint-ORIG-GUID: f49K_CCtsH5cm02klm9waJmCwEHByWbH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE4MCBTYWx0ZWRfXwierBMEBoazI TtQP4LcbFIwJitljvcXognnuk+mRnEqgEtZxZwttIYhNECNA8Z5NDJ0Qv7rLDCo2xy2q8BrahbJ DYZw8YJVRaVePggpsibAVOiYcgxZdFFa7dRUfGwuMV47St+4hmzfsPsQV3PkxoBBoV6BQWQ5GZg
 gaWlbrc19Epb4bUVKbd0ST94TAePL1OQV45dMhPHnsForpfYgEKCt8cGfoSYEsHtlyHIyMT0Lwn rW8MMNlXVsocprFnVm4sH1ruqazbnlSfcdcwAONt4TSS1fAwVIao2sjrXlxaTqQGDdyL1bWuTeY DbUmuT8nkRptk0WPVduHM5IXtaRLsz6vNCxcV06nW/U2xbmPncUpIzk/ihRu7SUmyS2vN39N+tB
 SLNomppf2rVeXrRYMcHyyzjUW46EKCoDSVj2aCU/Il23iX3Sh4TK7Xd+YzJbQ11WCMfWCuzm
X-Proofpoint-GUID: f49K_CCtsH5cm02klm9waJmCwEHByWbH
X-Authority-Analysis: v=2.4 cv=PqSTbxM3 c=1 sm=1 tr=0 ts=685c80d3 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=zd2uoN0lAAAA:8 a=0-eWvFUawpPArURuF7EA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13216

On Thu, Jun 26, 2025 at 07:07:12AM +0900, Harry Yoo wrote:
> On Tue, Jun 24, 2025 at 05:56:07AM +0000, Raghavendra K T wrote:
> > Since we already have the list of mm_struct in the system, add a module to
> > scan each mm that walks VMAs of each mm_struct and scan all the pages
> > associated with that.
> > 
> >  In the scan path: Check for the recently acccessed pages (folios) belonging
> > to slowtier nodes. Add all those folios to a list.
> > 
> > Signed-off-by: Raghavendra K T <raghavendra.kt@amd.com>
> > ---
> 
> Hi, just taking a quick look...
> 
> >  mm/kscand.c | 319 +++++++++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 318 insertions(+), 1 deletion(-)
> > 
> > diff --git a/mm/kscand.c b/mm/kscand.c
> > index d5b0d3041b0f..0edec1b7730d 100644
> > --- a/mm/kscand.c
> > +++ b/mm/kscand.c
> > @@ -42,6 +55,8 @@ static struct kmem_cache *kscand_slot_cache __read_mostly;
> > @@ -84,11 +122,275 @@ static void kscand_wait_work(void)
> >  			scan_sleep_jiffies);
> >  }
> >  
> > +static inline bool is_valid_folio(struct folio *folio)
> > +{
> > +	if (!folio || folio_test_unevictable(folio) || !folio_mapped(folio) ||
> > +		folio_is_zone_device(folio) || folio_maybe_mapped_shared(folio))
> > +		return false;
> > +
> > +	return true;
> > +}
> 
> What makes it undesirable to migrate shared folios?
> 
> > +static bool folio_idle_clear_pte_refs_one(struct folio *folio,
> > +					 struct vm_area_struct *vma,
> > +					 unsigned long addr,
> > +					 pte_t *ptep)
> > +{
> > +	bool referenced = false;
> > +	struct mm_struct *mm = vma->vm_mm;
> > +	pmd_t *pmd = pmd_off(mm, addr);
> > +
> > +	if (ptep) {
> > +		if (ptep_clear_young_notify(vma, addr, ptep))
> > +			referenced = true;
> > +	} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
> > +		if (!pmd_present(*pmd))
> > +			WARN_ON_ONCE(1);
> > +		if (pmdp_clear_young_notify(vma, addr, pmd))
> > +			referenced = true;
> > +	} else {
> > +		WARN_ON_ONCE(1);
> > +	}
> 
> This does not look good.
> 
> I think pmd entry handling should be handled in
> mm_walk_ops.pmd_entry callback?
> 
> > +
> > +	if (referenced) {
> > +		folio_clear_idle(folio);
> > +		folio_set_young(folio);
> > +	}
> > +
> > +	return true;
> > +}
> > +
> > +static void page_idle_clear_pte_refs(struct page *page, pte_t *pte, struct mm_walk *walk)
> > +{
> > +	bool need_lock;
> > +	struct folio *folio =  page_folio(page);
> > +	unsigned long address;
> > +
> > +	if (!folio_mapped(folio) || !folio_raw_mapping(folio))
> > +		return;
> > +
> > +	need_lock = !folio_test_anon(folio) || folio_test_ksm(folio);
> > +	if (need_lock && !folio_trylock(folio))
> > +		return;
> 
> Why acquire folio lock here?
>
> And I'm not even sure if it's safe to acquire it?
> The locking order is folio_lock -> pte_lock
>
> page walk should have already acquired pte_lock before calling
> ->pte_entry() callback.

Oops, it's trylock. Nevermind.
Needed more coffee in the morning :)
 
> > +	address = vma_address(walk->vma, page_pgoff(folio, page), compound_nr(page));
> > +	VM_BUG_ON_VMA(address == -EFAULT, walk->vma);
> > +	folio_idle_clear_pte_refs_one(folio, walk->vma, address, pte);
> > +
> > +	if (need_lock)
> > +		folio_unlock(folio);
> > +}
> > +
> > +static const struct mm_walk_ops hot_vma_set_idle_ops = {
> > +	.pte_entry = hot_vma_idle_pte_entry,
> > +	.walk_lock = PGWALK_RDLOCK,
> > +};
> > +
> > +static void kscand_walk_page_vma(struct vm_area_struct *vma, struct kscand_scanctrl *scanctrl)
> > +{
> > +	if (!vma_migratable(vma) || !vma_policy_mof(vma) ||
> > +	    is_vm_hugetlb_page(vma) || (vma->vm_flags & VM_MIXEDMAP)) {
> > +		return;
> > +	}
> > +	if (!vma->vm_mm ||
> > +	    (vma->vm_file && (vma->vm_flags & (VM_READ|VM_WRITE)) == (VM_READ)))
> > +		return;
> 
> Why not walk writable file VMAs?
> 
> > +	if (!vma_is_accessible(vma))
> > +		return;
> > +
> > +	walk_page_vma(vma, &hot_vma_set_idle_ops, scanctrl);
> > +}
> 
> -- 
> Cheers,
> Harry / Hyeonggon

-- 
Cheers,
Harry / Hyeonggon
