Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A64720A5EA
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731847; cv=fail; b=laN2v2Jrt5nRy47LNKfyQYNOxySUCbLX+BFzNSM65B+2K1LqHVuln2Or0vY5i6Pi3X+Bt3WK+uXI7nXlGx2a9wTxBPe0GALkYx4ni/sa1v0oSYawMV+Tj5TlJ8MHrLb3AN+rbQ6T6lgCRBT6/jw0dDW4FWetCWq4DCHdLaTrB1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731847; c=relaxed/simple;
	bh=cguVrF9Lvekb7SOk0lBFVc7fpPI27NDBwK6zXDBMWU4=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DRHe8RgoWcUkj+AxQolITpCnZ+ghvKiH5QZVrrnjWeS0gR5oAf/r8bP+viHDb4KakBrbHEZMruEIdiBviQxRUmryQ75iZvUjNQbygAZQVe3r3yXdw/+CuLk2Ee8XB8sL6Xi9rlb954P6pUUe6lGx1ozTT03Qw/xVtlzpu/3wKVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oyMVdCrJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Reay4pIf; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oyMVdCrJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Reay4pIf"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FFMfDQ002560;
	Tue, 15 Apr 2025 15:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=n7Rxlcsra7YPNAvTXt
	JawSBmgmLqaFHSn+oHn8IU/BY=; b=oyMVdCrJollljuB8IOyLrHa+W2QsSiy+NP
	qz5FyUhjhTxJvZRIwH0KlaeIa9mkpaMVlTojn/hhnKL1ppiZZJrNIaTXp8cMaxVX
	mGvZQDhQDbEWQgFF/hPDHUGoThSAmWWc4IRVZXqiFXYujgBSDMyBXYCus9IoiIh3
	AfvtyOzVZyxve9yyrPo2osafrhcFKmADrCJLY0cj+bxcnFqeTG9DtmM91kdrFDL7
	XHXgjBqd6jthep0QU3CAFvHvgRehM4fTWvnbvvVfz0dbYaEkZtsgblc+heCWkmcr
	8c5kMSKRiYNVEbp79MwEC+cbLUQ+FL0rPSYHLYd/4h9SDapUD+qw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4618rd1wnu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 15:43:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53FEdoY7009247;
	Tue, 15 Apr 2025 15:43:46 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazlp17012035.outbound.protection.outlook.com [40.93.6.35])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d3j8gu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 15:43:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VW3F1fNUqhwunv8IX6tcVhdIdp/WXuIfaoPQy2MiIoAUmkULFmoqk2SUtVP12herH5tpfG412tgkYBMz6sg4EdtsxCcNDPWv3Fxbg/dnWmwXEqbU0hVDVtGlEFov30And/oYsQKWiX43ZBJPDEMccv1PzJesbQktP2T0lt/fqFo/1f7TtDdKql86JucHapLV7lGm/okgA9bp+pdKduqTDQhMarPX+JEbfppwQKA8pQnEqE1Bb9/LUAnYGzlelUItLC2AUnx5dK9z8ZzDlDPbamsyPxm6czIJRLi4n/ff0aiPFeBOu7JKzfP/Y9cQKO0NGSqZfBsaVZSptRegJjEtVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7Rxlcsra7YPNAvTXtJawSBmgmLqaFHSn+oHn8IU/BY=;
 b=LJHf7+Gd1SE0eqrlKJd9ghMfpw7GcUQNMZX5DfBBleCnWaZ+TSrB0OzJ3nMuR1d4ovHfuzeP4B0O8GvUSpCfVwUU5euR2cpwO3Pg8XMSz35TQZkrqr9NXQvsFebJLR8xtydENrJ083x54hsN0mVPDe+BLIy1tljTvBExu1HfJqP5TrRrLJfsxR+BgaSWF72yxJYGDoPbVkHzl041y1pDBA1CSNe9z3H2Tm+v93FL4j9T755XZLL5lkg8pwKF7RB3ERywgRLeFwXKwzHCMnLOXveD/6jloAM3VhQhB5PsjhxU/M36UkdHyjuErZkBm8y6aF/+fSvu1S8Xxw3dD2V6aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7Rxlcsra7YPNAvTXtJawSBmgmLqaFHSn+oHn8IU/BY=;
 b=Reay4pIfniqxAX0aPjm5Tm13NvqjO3ujMYiHABLkprPmsmTSf2LoJ+GsZrp34hrXtDZIuHU1kDm+j5kgyOfnp1Ujki91d+4fbim9zDJ8+3aDEN8Q+GYQtFKg5rZqddlhxt+a5F3y+DpcRlpVNYPuuXyhkehAIyMk9HiNGwkIgfU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS4PPFA043F25E4.namprd10.prod.outlook.com (2603:10b6:f:fc00::d39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Tue, 15 Apr
 2025 15:43:44 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8632.036; Tue, 15 Apr 2025
 15:43:44 +0000
Date: Tue, 15 Apr 2025 16:43:41 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Shakeel Butt <shakeel.butt@linux.dev>, Jann Horn <jannh@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Vlastimil Babka <vbabka@suse.cz>, Matthew Wilcox <willy@infradead.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        SeongJae Park <sj@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH 2/2] MAINTAINERS: add section for locking of mm's and VMAs
Message-ID: <0e796032-4f6d-4b7c-9ce6-6519f8f245af@lucifer.local>
References: <cover.1744720574.git.lorenzo.stoakes@oracle.com>
 <0722c3fe0cb4c1e54ce01c7689ce4615ecc87e16.1744720574.git.lorenzo.stoakes@oracle.com>
 <bxgksbw7qplw3pp7gpve2ir63oyds7mxsnvprz45fj6oadotm5@syvchqjd2n6z>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bxgksbw7qplw3pp7gpve2ir63oyds7mxsnvprz45fj6oadotm5@syvchqjd2n6z>
X-ClientProxiedBy: LO4P123CA0431.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::22) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS4PPFA043F25E4:EE_
X-MS-Office365-Filtering-Correlation-Id: 71bad1da-d1ef-4fb4-89ea-08dd7c344d77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C6JS+u45w6oBtchJgoRQRNbQfXLmqp4IEJ0+D+vBch02xZjJPBunCw1mp5Xz?=
 =?us-ascii?Q?qut3hxe7n3jspojcACtRXqRPQd6Li0QXFO/mK4WesiwdBut5lD6ZF3Mlzse5?=
 =?us-ascii?Q?ENJ824DSUt7xBq2bCwDkqS0UuS7ATBRlXUgJAP2t2smLTm/F+etRi6cH5nRt?=
 =?us-ascii?Q?9MtDgt0Nw6RYwccLOzRkoGYJeTPg/D69NreegPznpILpzzGDcMwg/2hkWKcc?=
 =?us-ascii?Q?meYwq+ELFRv6vYjNfRnruJYpDFuy5WU0FuBcSeT3prZ1m0BInX0T4812hr+D?=
 =?us-ascii?Q?GtKRru2fiBxSGeLLW9LbjfNdygQ16ZS3iRMTJ1NaONI7y4J2Sa27IEhBbDkV?=
 =?us-ascii?Q?mbytTjXaRrH/bDEf2MiDIfmNpqAGfgQ+4JOW4ZDBrX74QF8Png8h4euyRMFj?=
 =?us-ascii?Q?jmBbnM3e5QydVLVWmob3OCDkiik2ZHqhcUUmcLKCQ2nPs7zx3M8LGO9TcFHp?=
 =?us-ascii?Q?Or/5XSIMVgzeqJZ4fUiui0HnPpKxBjzlnW3otIn6JNnrQNlbckwQ6WGYi9w9?=
 =?us-ascii?Q?bOlEWPS2K3r6o152aI+3Bpm0FhhTwGFADx5Z4HExFkmqaAmnlNenDb93X/JJ?=
 =?us-ascii?Q?sNs8r8NpdLc0NlemM/FF1oC6lQOMfBl6jpRNeN2qeH3RPoCMZM8i/nwZfxsW?=
 =?us-ascii?Q?ODjBPfKzc2OpGrZz2FqcACmGzo3fkOIfkLsgoZ/syQQ5aR7l2jNK/E3EDAm3?=
 =?us-ascii?Q?PzRA/NRM3mEQ+1HUTRog3igcaj9iK9vr9nEtHLv0V0IOecyzztJYCWsc7SBK?=
 =?us-ascii?Q?Z95Ti+yoUnVmGyRN+itIS9a4XfKL8ROmMK0Njt6ECQKp2jvAnMdicD47ZMAO?=
 =?us-ascii?Q?11REMBD65KNePYgRxRdgeDH3nTxpd2keKQHHzrID7l6EjJJGPG/ePRWHd0RX?=
 =?us-ascii?Q?JtxEi2cjzx7rRGoKL1jXMepXXyroe/o2OsHuGjkUIag6Cx0iw/7ExFjN9GDv?=
 =?us-ascii?Q?XTojLWn1WBsaBG0SQfQMJpcyq0rZAGdg4DQPpDJlSYjQ4uhF6VXko6sur/My?=
 =?us-ascii?Q?Ok55+CBaVowrSscXb9TqX7ViB4sLqBu5sB7edHk86Kbv+/yuov4ZEy4knQU1?=
 =?us-ascii?Q?IeXGuH6RLp3LYK+RJ3fjQ103q2wMVwfNjFIoscq98uYWh37RT9lYt9BkXB8K?=
 =?us-ascii?Q?ICgMZ6hlBcwyni+SaY4jGD1es7iefEUrKxUSyo07CqCeGU1hL+J9osHWYgpX?=
 =?us-ascii?Q?92oFvbstCnDJ8qK61HhsVpNIIB8VFfH4NGxuWlIu1sJ46lLYV1HofDBKxZ29?=
 =?us-ascii?Q?BuWha+6Lqww3IGXBAT16RW68mKc6+iXEEuXKav0ruPnc03IgmR9zGtsAurDG?=
 =?us-ascii?Q?hIEd/JOCkM3VVFKNppthsbQtzyEAozHetrktDd9WpPVFJvLYtWiFNN5BQ+Z9?=
 =?us-ascii?Q?1AgFgTVx4JttMeKphFmjtQoJ27hmtXyUP/zkQHVNfwCwrNHu3g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q3zUVoFLS2nisJ6ahMLopb5bngtYxrmWyKEj8C5JKzjRYpJu125qPqtkBUYw?=
 =?us-ascii?Q?7rn7CrNfVPGQsH/fTpy2VQQLVnrHgjQYn+BOraHIqAii4EnJLGbrHuEASdc7?=
 =?us-ascii?Q?bBNQQxTW49wK481CrlcVrOnkKrj2fG3PXwtq0A3B1Uha6WQGnzcgy7Ph4BCU?=
 =?us-ascii?Q?sjzDDbssgkjH1JN/w6Poi9oSuIaXP8GYp11MbPXoK1iIKwlgxwBzvccZO3m/?=
 =?us-ascii?Q?aos3v9lx6NLvCcubvHsMQRVwXJd6HHbwXglCZ8isvVLaJ/aGc+oXAtlqke+M?=
 =?us-ascii?Q?9SwPGC+8iGYx7LTylJTsiY6thZFh1UrMbJ2qGWQtu8jsghYgkYY01DO1IhSM?=
 =?us-ascii?Q?KAsp7owyjg6ewqXdOw6/ZlZwgj4EY34xejySE4m172QibpMcVK1bkGhDP8Jr?=
 =?us-ascii?Q?kdu6Wj1KqsRi9398Tu6mAPYclI+PrbwuZQhp2G7YOki/vlJ+ck9BzS5qSYKc?=
 =?us-ascii?Q?YWfrwvnuHSllbL7EMbjZUz+/BIzncS0xKFe0rUR/Z9GNMrSleiq3p+Bie49O?=
 =?us-ascii?Q?HwibfIlYaYffsGWc9vUTTddFF9Wh9hXxaYHJUwaYs3N6aUvue+gpivJrLQTW?=
 =?us-ascii?Q?foI5FdLI141R8CFXqkUaNE8KnO5ZMuJTkFpH5Ic/QRW8r1lj1rS/hTyoMHVv?=
 =?us-ascii?Q?vHZt/2Pwku0UxywF9l1hoUbPHJDVh5H+Jm3HfvCo/DBE6LQnjK4gykmdYa/v?=
 =?us-ascii?Q?w4lKsMq7a157BLopiN6I281u1F7vflKbijqIMgA9GADu/ZDwkVb/cQ6Fl/YZ?=
 =?us-ascii?Q?Fc/Dbb3CxjAvvuimauoGK2y9ZL5VT9R6xbrl8zaBzZZuHJ47KQ15Cff6ziGU?=
 =?us-ascii?Q?Ffx+VwA5Anm9VZ/uFNUCOsmolHB2cMX9d+3QGzo24CihOJTiadrRkXr00X9V?=
 =?us-ascii?Q?3LzX6nP+GTD9IjLmXwgB5wo5VCD0Gu9m5AHD6rjtaiNQnsh2N/+U666ubPau?=
 =?us-ascii?Q?8xPg/V6p9xrIQHOJxS2McI2UnVgG4OKDptDbcJrNZ1AaHef1rZNgWxFBNd98?=
 =?us-ascii?Q?xNZqau1+qEyuesFDW2D7TZz1Z/ZBrIVMV0L86F4/PRfEkmRE+Yh3KFamrJ33?=
 =?us-ascii?Q?gO8XLPBV40JCcXRrKj/qFpyKkPNJAOHUBiCbk9vnawYjBBwq4iuPVzSei+DO?=
 =?us-ascii?Q?f3/n+VcIxpDZhol+qZJ6ZShv0J9AKxHhsEY2DhfH3aGHUpuztUKnb/Xf79VP?=
 =?us-ascii?Q?r/iI6izaAYTLuMOFp7UjJA17M0yHJzpJl7aEFq+dQ5mXS8i2F2WDvDNk3Jf3?=
 =?us-ascii?Q?ony6TxdVkQAUf7z6ZAdl1aFLgTQ70BmwwakG1lNdQgyAg9cdpHlYSLkwIRtb?=
 =?us-ascii?Q?TBrRqZoirsIttgQzCq0sK1myyYi0YLmgEEXdokNR0o1qh0DMKrb8qHE0+3tz?=
 =?us-ascii?Q?WoYtzx3DxT0CJwmOzSHdpbTzeWUtTTQ+0pEk+bf/zPkjaRWZZnecGrftZu69?=
 =?us-ascii?Q?UhevUp4HOm8rmlM647bRAI+yw8l/KoxN0FUlemjLJV6eVYdb6aBfiJl7SewY?=
 =?us-ascii?Q?HhBL0z+pTt/KBYjfENtYWmHAp3I3taPWFNmc1kDjBqJRUqK48VHmZjRgJOez?=
 =?us-ascii?Q?+llEfC0yMUcqQ3uAlCvzaOSqydDAY+MoX/crp5u5j/F3sRl+5wkHSrEwHAVK?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dzPGixFSzbLGYJWCcDkhuKVGFgy1xHbzel6SrW2tgtwi4TjQaPYwYI4PmnsdTKmqiAWabaHLToIuGFSdriJ3a0V8I4OYs5C9q/dMiNFOzY3BmGTP6xm1XXiGGPp3qV4vBPs7OEovI7FrJjQJ2lawCj+7Fry5jvGGwipH1kVWd8nqCOWRzXOlNI+jYgcJg7ConrJRZTKfI3iSo1bcto978uYUfMvFUzmOLjSitVrbnfy9VJWMjIbAsg8kWRF17X9QUfE6SKjeVK9XznPvCXWVL+cuAAachH9MjwCAWB9gJn+0p5X/+oXGyTS8R3tjGJtHZmdj58JmQOW84PDNbMKWONHmmbhRiNGkE5S9Qn3wM6aoc8AcMJKQEcBT5L8+IEUjTDLtXxsK0SmgrO+y55hM7riJ2Y/p3H/IvQY/ldjB1jsr9cWDtQYQeDzTSkv8e/SCnZE6Qjgc4XF/es1RgbovLhnbYSdgxqJ5NPS8Aym6XOtRS+4BBgUYy8Yg4F/joJjNcF4jPBvEw86nX+XO3rgQ2zpR1csjoNz5YFb4WuXvWYOXGxFncDCZfGqpbkh0M+4ucQUdKy3aJdeSrw+ixY9Z7NpIEjzvtcl9+3g9z3M5wDc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71bad1da-d1ef-4fb4-89ea-08dd7c344d77
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 15:43:43.9749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aplCGp3PUmYWxxRZlHZJzeuWCBe5d9emDezdYap2Ne+IjRvIDHy1Ke2E5EU/QNvqVHElxtMISOgz3ozDRl3W81MjdDhcdJSWqI9+qVbgiOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA043F25E4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504150110
X-Proofpoint-ORIG-GUID: 5HLASJrYQhJ-aGI-XNiYXQ7E0CpC_s_7
X-Proofpoint-GUID: 5HLASJrYQhJ-aGI-XNiYXQ7E0CpC_s_7

On Tue, Apr 15, 2025 at 11:37:04AM -0400, Liam R. Howlett wrote:
> * Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [250415 09:11]:
> > We place this under memory mapping as related to memory mapping
> > abstractions in the form of mm_struct and vm_area_struct (VMA). Now we have
> > separated out mmap/vma locking logic into the mmap_lock.c and mmap_lock.h
> > files, so this should encapsulate the majority of the mm locking logic in
> > the kernel.
> >
> > Suren is best placed to maintain this logic as the core architect of VMA
> > locking as a whole.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> >  MAINTAINERS | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 8d834514a047..ce55676a16a4 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15595,6 +15595,21 @@ F:	mm/vma_internal.h
> >  F:	tools/testing/selftests/mm/merge.c
> >  F:	tools/testing/vma/
> >
> > +MEMORY MAPPING - LOCKING
> > +M:	Andrew Morton <akpm@linux-foundation.org>
> > +M:	Suren Baghdasaryan <surenb@google.com>
> > +R:	Liam R. Howlett <Liam.Howlett@oracle.com>
> > +R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > +R:	Vlastimil Babka <vbabka@suse.cz>
> > +L:	linux-mm@kvack.org
> > +S:	Maintained
> > +W:	http://www.linux-mm.org
> > +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> > +F:	Documentation/mm/process_addrs.rst
> > +F:	include/linux/mmap_lock.h
> > +F:	include/trace/events/mmap_lock.h
> > +F:	mm/mmap_lock.c
>
> It would be good to have more M's here in the case Suren is away or
> whatever.
>
> I have worked on the mmap locking due to the maple tree addition, and I
> have helped with vma locking in some areas.
>
> Lorenzo wrote the locking document, which Suren pointed out last mmap
> lock meeting and does make locking changes.
>
> Are there others that could be M here?

I mean I'm fine to take an M here, based on having done _some_ work in this
area and being involved in the meetings and documenting, though I'd largely
defer to Suren who was the true expertise, and I also feel Liam has better
knowledge than I do.

So I suggest probably, unless there are other viable and active takers, we
should M myself and you Liam?

>
> Shakeel and/or Jann might be good additions to this list somewhere
> (looking at the edits to the file).

Don't mind R in these cases if Shakeel or Jann want of course :), though I
_don't think_ either Shakeel or Jann really actively work with mmap/VMA
locks (forgive me if I am mistaken) so wouldn't really be suitable for M as
I feel that requires some active development.

>
> > +
> >  MEMORY MAPPING - MADVISE (MEMORY ADVICE)
> >  M:	Andrew Morton <akpm@linux-foundation.org>
> >  M:	Liam R. Howlett <Liam.Howlett@oracle.com>
> > --
> > 2.49.0
> >
