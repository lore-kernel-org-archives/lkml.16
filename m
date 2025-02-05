Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E781FDA8A
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 19:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738782003; cv=fail; b=QYZRByd+U3nsMeJ+JK7fEpz+NOBIUPV06pPXwdpReTC15IxAHQBo9VW3hPSpa03hfC4csE+RyoTlO51r9w+sHYAESJC0Sxsnn0IOiVlNh+6F1aX19C4Ew4ccbW3acoGzIEeHWYVGyksGSb2wQrHUYnRX7wxju10VyM4i75cB3+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738782003; c=relaxed/simple;
	bh=iZZfzFRFRWw+NjYH2VQmj1kkjQH/Uku7RpSS8ankAAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oCsQxVUdsoZKkh8HsSI7oH66bmb8ok0DciSz7Ag89KYsufDy0TDS3XzwRhTQ2lFywrUw/9h5m4lFSCz6ylNr5OQJvekoyRUwJK1kuP+0/GN6ykA4v6pHgFrVqVNk45OMEu6381T7XXvFIfTZk0rGqGTAUnWPtKyYY2oiyhDX7Ec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UWRgpkVF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aOjk5kwW; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UWRgpkVF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aOjk5kwW"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515GflCb032250;
	Wed, 5 Feb 2025 18:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=fnssg/ltq5MIMI1G/s
	HZYVxxwfhQzLfEML5bcL/hd7Y=; b=UWRgpkVFLCW1OlzWZGX9nab6VY1ndOuTrN
	GZr1Gw+K9TkbwJ7wT/zO6ey1H15xn/7Fdl4Yt1TQSOkxVmdrFXX1DeENRxUB/XyR
	0rUA/scAlOJbe3BxPyQcFjttMCYMAviHn+up0sUO6lt8dTa2g1M0g5sZH9IJjd9o
	CBd/TlYV6EO0XYAGgraqwn2VqJePrlrjP5Wt8GA+9P6rqMEpdcAkb18CLOt0hy3S
	q8hEZ++l+trRPITwcsTz7OgZnA+XCBX896zpmHEXJpcAzDcB6TOXc4cHK3LnolpQ
	oQQQQkfCnAHpB1smQcDGwxWJ794rP5WBgVWT7NUigtXCXWCgRq0A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hhjtyt6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 18:59:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 515HxLg7027814;
	Wed, 5 Feb 2025 18:59:45 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8p4sytc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 18:59:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Op0uTthFG2TfAc/vG1BdN4JTDU+FS4v6PaCOZYYOdm8LWkiGBrhtf1Fwf3ei3hgetchBJZSE1tN3i5TWBZcSqS909mndGkRUYN08qV/l/HhsdcL3HsJwxOtrQVVZGRBMl72Sb1Qh9m+AtK6L/OOIsF17B/jCc2WWN9GyPYHXBFAewddUXYnENrWQYrEwjufGT7Rya77r5DPCjs8dnmY8mNZqJXriYfsgm/4oAXPUfNZfjKckOySbbxeKL1F0vNe2bQZJ/q669fSosjZ0hUs5qVHiUrINfE1BeGoEDVzhhHJJnGAExbp4swt3MGLCX2gMDe9uT86TDUg8HMJjL/v+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnssg/ltq5MIMI1G/sHZYVxxwfhQzLfEML5bcL/hd7Y=;
 b=UronSb2oKR4mycTLDmLGecRknC69ousDS117z6dZpOlb74Uwsva9jZ+JIf04/A7uj8P1VgL3os9HUiuIdsU9gxDy85QwvfpwbuSssAaNJ96nQ81vx0ZkM6ojtkcCZ2bPf1Mf9SeK9o2T8GjkIbsUwEX9ZNrQ/Fg6D46Qy3V1CtXHAv82/wV/o2Ai3o6zagXAn1iE4L3h0LMTkyk7WXMTgaPEzC6OfCbfnDrnzV3SRXkBubFt3Y6mtDHhathBWaYuzVHzyEv7yycj3H/puh4Pscf0aUjYcxUBkEcOWUfENNzuF/DsvAToPDicVALIM+pPuUgJbUgshPdqZFNZsIxQhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnssg/ltq5MIMI1G/sHZYVxxwfhQzLfEML5bcL/hd7Y=;
 b=aOjk5kwW+theFYauuJQvPoShVEwvoaYD2axOjoLn2Ty4XDOVKC2D6AT/Zrn/GL4UszEIG7JxVDnY0iG/nny3Rkjeth5Q5f9bMXN/k4iFIIzmnQ0cIJ5gNjATtnezoNJjLJni38sraNYSgGxj25fuu7aRuBd8DpKgqG6XqBw3/I8=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DS0PR10MB7271.namprd10.prod.outlook.com (2603:10b6:8:f6::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.24; Wed, 5 Feb 2025 18:59:40 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 18:59:40 +0000
Date: Wed, 5 Feb 2025 18:59:36 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Marco Elver <elver@google.com>
Cc: Jann Horn <jannh@google.com>,
        syzbot <syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com>,
        Liam.Howlett@oracle.com, akpm@linux-foundation.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz,
        "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [syzbot] [mm?] KCSAN: data-race in mprotect_fixup /
 try_to_migrate_one
Message-ID: <e00b6466-aa24-42be-b15b-cd0857054d23@lucifer.local>
References: <67a34e60.050a0220.50516.0040.GAE@google.com>
 <CAG48ez3KKEYRU+-Mkk+tq1Onv3QWg0jP6fEKYjNjRS+ziP5dAQ@mail.gmail.com>
 <13bb4bbf-92e7-4c45-a3a8-a52312015f92@lucifer.local>
 <CANpmjNNeXjtatBD6Lrz2-1jiqLkpcuk0Ra-6uJKzz3=y86qVuA@mail.gmail.com>
 <097c6249-e86e-42c9-9f43-bb9f8a865ce4@lucifer.local>
 <CANpmjNPzQBvHrGGLwtCrU8iLUz2tppGie=_ZkuYck2fgN9Qr7Q@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNPzQBvHrGGLwtCrU8iLUz2tppGie=_ZkuYck2fgN9Qr7Q@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0111.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::8) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DS0PR10MB7271:EE_
X-MS-Office365-Filtering-Correlation-Id: aa058f06-5f0c-491f-4700-08dd46173e5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?O4Hpr+Xh9uKwut4GzMnnvQn4i3y7PuBHKHcWD3cf3YlVuAcof69qyNO4uagR?=
 =?us-ascii?Q?WG/w6bxzr1J30aJoiqqwKBinU97+dDt3UE8oGWIc4J0X5iNBBWtJ97NIWtN6?=
 =?us-ascii?Q?S7izX/DDfapxCZx8MC0szglS91bl/fIILQnECTw//E1Aol1L3ggSQFP1qJNs?=
 =?us-ascii?Q?H3FWcDQVPQZY/atNLsO51HH6TQmy1aFKJQjzTrslI7zduuehIE6F4Vf/oOi7?=
 =?us-ascii?Q?dvfHUkB+jNrR5s30gZL+ryeCwRLtZ9Pl5cf7R/67EPRRKY9X3q1vHfa4ryrr?=
 =?us-ascii?Q?e3crRLPmXX06rxQ9HsWIKWAmBTXsgpYyMpsfXCsDy1qHex/vI5YmQEwKxCLk?=
 =?us-ascii?Q?tLWfi2+qmrn47f1kIG6n68cLcCANnf59ODfZz88cuQwKNE+H7R4SGJ92ocI3?=
 =?us-ascii?Q?9jcEn4ETWLOZnAhixO33BtT4P2WBh9LhA4VRPSsJNrsskSwPOIsKxytbwz6w?=
 =?us-ascii?Q?OLWF49/BhpudkeyR980AiB60ul26yMc94O1Ui0BSEO8frwtQDYxY1/fhmjNW?=
 =?us-ascii?Q?z2svzHSXHTIA6xMvVMzwn/bdmgcueuSmaXyt5IrFjw94IOTfUVlrAvsCN7UY?=
 =?us-ascii?Q?tWFrTxQTg52r2IcNadE2mcPkz09DHqTRgMvpx/79U7XKzNg/o3I5e62uUbSt?=
 =?us-ascii?Q?5y3SBMQlBp4LNBk7kRZu1S1XBwKyCkcgJgW1Acf3uXkHThk79wsn30hYQNwW?=
 =?us-ascii?Q?3myoaTxtPkbCXj26CiukjGpaxVNB6k7ztEigG/1mFPFVQVVxROBcfy+TBBu0?=
 =?us-ascii?Q?qNz3FYketb9tFVa3yevXsWf7s26zzH4wWgOQE2L0Oq2RI6RqWuJ5DrVQRoj1?=
 =?us-ascii?Q?Lae8ZUKnKsroESMPSjSiEH9bvh5uNlQpgGr/mAYh9xhC1tpPx6yPg3xsCXv8?=
 =?us-ascii?Q?XWuLYxCO/L/U9afke7txzRZcquhmCmzTgpxwxEeDDtsoXl5zyI2U10IBb1PZ?=
 =?us-ascii?Q?Ci1rQynnew/Yq8YstCC740mntTkGbRuiCNgHNcbTbADXjXB1KOr7KvEgPDXX?=
 =?us-ascii?Q?g10WrIMZtbjB7IxZ/LSEi+pSuPI2k4sGev9rWcVJl/3irIgeeMPfunOe7p60?=
 =?us-ascii?Q?rsPfNv3+fCKY67RwLJmRGBUaZ72ZeNdQUTGtn77d9rQ/87pxkHo2PUBMbDDS?=
 =?us-ascii?Q?kErcqwGxiUHYCoxYnR1NESut+k71tL8MD8zTt03TKe7Rusa5G3sjzS9IxRad?=
 =?us-ascii?Q?PEnRWsYgoblB4kIIHI86NPhND0zBrJ3lkaGFwXC6QRp6naHr3T36sRiKkV3M?=
 =?us-ascii?Q?RDqkdN4drVZePczFl88ZFCTYAdpSjDQNKdLGXBPlTY8Ly8XU2BCeUdK802TO?=
 =?us-ascii?Q?drhi2hRU3Ws1IGOquB9yEPQJcu6HLy+zOpmgAMBsqGrNIw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TnL/sPShbeDXy3wvDBwR5/Jw3KPuuBNcA+DfoSosvtWSi/VFxh37ZCV9CUYb?=
 =?us-ascii?Q?W2AtQkaXH5L0rBjNGRMe0Hs5Xm1hX6hNKd7VvFg7XT0ed6SBA2StO3CnyRFV?=
 =?us-ascii?Q?Ypr2S+ntoyJ2L0/AdSR6HYrOBN56MBY8quUU3b8QOFLOquE86mkaoFJ7cXBy?=
 =?us-ascii?Q?iDSBPl++ORo/0M5/GGb1MOEIAoYaOjioCl3QqBicgYGMGRalyvU12qdPCYyE?=
 =?us-ascii?Q?jm/T288Ho7G0kGF5MRaUV4Ra0PqJF4KeOqa5loZQh+BCdBtCaxGVtqD6YGw7?=
 =?us-ascii?Q?RdetqdhT/XzHHq6intyk/5w29/D0nun+EeR571WwJYVLxm/gY1SlRMXJFm0J?=
 =?us-ascii?Q?DOHqFpqdR+VI8DXjM2bKwXb621MHVL19k5Fvbu4sFg4QHOxvhCmkb1lgyEos?=
 =?us-ascii?Q?mL/HIwieEE/7hea0wTrq1qWEI0dJ7e77f6ztxVS/iE+V1y1YG37HJRFB+tEN?=
 =?us-ascii?Q?fEFg4mpmeId4AkIHcl02yy6B/v8pNfUN/8N9Lafltqhn8M/qlqtQdiD5bnro?=
 =?us-ascii?Q?ldUhvWGKtom8Mkf/HY8GuzEOktMKsJ95Q0viKq04OOhTS+kDlFL2yYYe0OFZ?=
 =?us-ascii?Q?Zq4OD4AI/EW29b8XA5yPnyCSpfxmDbTb7Jhe5VTDn9bM1dii46MPkki/kPOw?=
 =?us-ascii?Q?DtnZhvJxWkPaSwnZ7Oz3+BbHLmNgyofTNfktq9ygvbPBamv9nyNB6sp3VX7V?=
 =?us-ascii?Q?MRy3FauhAC0rFUG+VKmQR0KH2ZbAOTRJqUpCpXR6JxImauMimOlzlJNGw7ZX?=
 =?us-ascii?Q?IAIvsQ7J2VVycgpJxbbKaSY8l5Pjrhgq0UfCekwBVyjr+GGv4t7ePnYdDynN?=
 =?us-ascii?Q?8DhiB42nlqAfuf1siljtT4RxjiORWYFmJf5+sNOQRzdIf9BSOmWoj1hLLN1R?=
 =?us-ascii?Q?/mP+Psn96BKB7+Th+y780Feky3zl6Azvq4hwpYKGfQW6JswPeIRmxwcG3qwB?=
 =?us-ascii?Q?eC2j8iV6JIlJPl4solX04jzZVr/aXJ1oCYlO2QCQFooYSCocOR0+ki7yVt4r?=
 =?us-ascii?Q?ERcwpM4SfN07IPNUbLC8P0o0ckoK904yPQzmF4LPKZpjilbBTJzmWD6qQGHD?=
 =?us-ascii?Q?/BGK0Wkxb6mBdH0X/MOF/aLXZeGGn22lPna79BdaKnVE5J4SYVlXI2v/9N0n?=
 =?us-ascii?Q?XiKxXwux3hJ3+j9shQ30L4y56Oi7gHBarUU5DgPfAOjaVOWhY9Up1+3HEEZu?=
 =?us-ascii?Q?8TpX1kjD06OKnG7Pt84xOqPf2uI8xArQejfWA6/oyb94xfH2/rS+SYbccozv?=
 =?us-ascii?Q?uax9YnZseybMra5Ycn3ygj/rcbqNpKPw9A+qYYWCQvLxCRfvwLM/8FpUmaTC?=
 =?us-ascii?Q?EPlMIcgwBVtoQ/aZnCNfKRUobTEFCcLKmJ3yjGPxPnyOSIC89T1UmT9Ev+ha?=
 =?us-ascii?Q?Ph3scYYtLgKmaAJzTUkQdoa0rZM0QSPP8LNYHzQsAx2LAm61IMswl6/3mDaC?=
 =?us-ascii?Q?83GH+XOaviDqoy1m7Vi3aUWMktIMVmpnyST2aaKEZawgC5CWyW+o9Lh/2kJ8?=
 =?us-ascii?Q?mJaREYEZ0apRXMrBlLQdYxVNzwegXq+aEYe5WrklJ7uZ9Rprb5nNvttrVQ9D?=
 =?us-ascii?Q?DGR7KElBhr/5SIThkrwSvEVO324PSKuosR8ooRSIwcXxkW7uEDzAg1n/Y1Jb?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4y5Mn18O2ph+tKpkpJXwAvttzo8KzGC/EnIqKPs2o04VpAqKh1s8ElNQ0HQGawTQPrDI2M24iEF/elzBd7eOElq1kAZGGTj/EcXWdghRK2TQwVveOoi38GVT3v6bSRWWPV4AhHwNK6i3BKaXYjuMTbQxrMRd5+/4o87n7BFnh5r/7A3NzXgidn5BuQ4VFgWRH4CChblfmuWGEYiMCkj49GywRErj59mEKlNRCvrOiZN4k191dBUB5sHW0HMa2Mu84V7t3YJGgi5z7Avnyb++WRPyyVJCePHaujU0EYNdrYp5XwCLamnpIZ/ZPj+Y5UG3xWRNK+tMxH2nzAeRL6vAtJzWwwYeH/VKTXVRFo1mmtQi8MDoKRyRjCBkpWn/2lZliwJXd87URaqbvrktQ0F1fP8Cvx0T+mrJT5ixiYcm3HdDuPWjfK/Z3vKIMift9XA6TRHVrp0X6qHtPQBemAsb34CSPSfElblkFJqxbAyrxEqr3WD6sWDBBbFr9nRI2H4EA4IFDmBIh4KQzVmmZYBcUBPwIohP60TOkubg+h5mQMkLWPfoFOVpT8gNmtxYqIuasmQgN9O9gYVMX85tWlM6liO4EAB2O62A0Y0F6mFwmWU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa058f06-5f0c-491f-4700-08dd46173e5a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 18:59:40.3530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nkmzZWHgokE6cEGIskefz++CW6Ef1bBlHE+Ypw9g0g6wn9N7879ST7C45uct1ipLayapFbnuUZYDObj4ab542g6PJvHULNN6ZqchbjWVxs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7271
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502050144
X-Proofpoint-GUID: Lg9DGVxmGdZfdHolgmrfZErHJYCirrY1
X-Proofpoint-ORIG-GUID: Lg9DGVxmGdZfdHolgmrfZErHJYCirrY1

On Wed, Feb 05, 2025 at 05:25:16PM +0100, Marco Elver wrote:
> On Wed, 5 Feb 2025 at 16:51, Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> [...]
> > > [...]
> > > > I hate that we have these landmines waiting for us. Be good to find a way
> > > > to explicitly annotate this, or at least comment somehow.
> > > >
> > > > But agreed, probably adding a READ_ONCE()/WRITE_ONCE() is appropriate at
> > > > least for the proximate thing.
> > > >
> > > > It's a wonder these things don't trigger more, except you need probably
> > > > very precise timing to do it...
> > >
> > > They do trigger, but we don't send all of them to LKML.
> > > When we first introduced KCSAN, the notion of "data race" was still
> > > poorly understood. At the time we decided to pre-review a number of
> > > them (but our time to do so has been going down :-/), or let willing
> > > maintainers deal with them directly. A number of articles followed,
> >
> > We very much appreciate your efforts :)
> >
> > We are definitely willing to see these in mm, and as you can see from the
> > discussion here, the interaction between the rmap locks and other locks is
> > complicated (see also the docs I wrote on them at [0]).
>
> Tangentially, I've been trying to work out how to bring this [1] Clang
> feature to the kernel: it's more or less a simple "capability system"
> [2] to express "acquire this before doing that / don't hold this thing
> here / etc.". Locking rules are an obvious application. It's been on a
> number of people's radar over the years, but nothing materialized.
> Sparse's locking analysis is much weaker, nor easy (i.e. quick) to
> use.
>
> [1] https://clang.llvm.org/docs/ThreadSafetyAnalysis.html
> [2] https://www.cs.cornell.edu/talc/papers/capabilities.pdf
>
> The current work-in-progress is here:
> https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git/log/?h=cap-analysis
> It lacks documentation, and proper commit messages, but is otherwise
> usable (see example enablements for kfence, kcov, and stackdepot and
> lib/test_capability-analysis.c).
> An official RFC will follow, but the hard part of writing
> documentation is in the works. ;-)
>
> There are also other questions, such as:  can a subset of the analysis
> be applied tree-wide (vs. current selective enablement), as it would
> help find more bugs faster.
> However, the reality of it is that using this system would be opting
> into a "dialect of C with capability analysis" with its own set of
> restrictions, and I don't know if everyone is willing to pay this
> cost.
>
> What I'd be curious about is, if some of the complex rules you mention
> above can be expressed so that Clang's "capability analysis" can point
> out some bugs. I suspect not everything can be expressed, but even if
> we get 50% there, we could catch a huge amount of bugs statically at
> compile-time.
>
> I let this cat out the bag, because this thread seems like a good way
> to get super-early high-level feedback. :-)
> It'll be a while before the first RFC.

By all means, let cats out of the bag, I am a cat enthusiast and prefer
them loose about the hoose :P

It's interesting, and I'm a big believer in declarative means of expressing
attributes like this such a preconditions. I mean we have some sparse stuff
for that scattered around, as well as lockdep obviously, so it's not
something that'd be crazily out of line.

It'd be nice to have something to say 'when we access the VMA this is the
VMA under an rmap lock', perhaps a means of casting a VMA to an equivalent
type or tagging that somehow.

I'm not sure if some semantic means of saying 'we must have the rmap lock
or a VMA lock here' is useful, as this is implicit with _any_ VMA access,
and perhaps anything that'd ultimately be all that useful would need more
complicated semantics.

It'd be good to explicitly pick up on a lack of READ_ONCE()/WRITE_ONCE() in
circumstances where an rmap lock could be involved, but again I'm not sure
if we could express it this way.

This is one I need to go off and think about, but I really appreciate the
suggestion and I for one at least am very open-minded to any tooling
-whatsoever- that can help us document, express, assert on and manage this
complicated locking logic.


>
> Thanks,
> -- Marco
