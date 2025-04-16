Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915E518D65E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744808880; cv=fail; b=MKz9bcI54X1U3Oj7HhTAGL6IYd4Bs/1iUU03WIx5l7/zhpsbb59wmRciKaClv81yE1Tf91/zfhTRgwZjTAwg19P8ckyFf6ZyR0OHm69ikrGKaFY37N7j5hd4p/xErMffnjfwn8+ZYueLsCjpIOVGdnK10BEBxd901ssK0OTiz4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744808880; c=relaxed/simple;
	bh=EbsweSxAgA3T4+T+K1eCrSqeAC8lvehrmlrej+MVjJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gh4qHz0wByDxedKsVIe2EJ5QGLTsi83+Q7ZJZIpZur7NWDY4SfNJdPFmSTat+L0ztoPlu87d7yHRuOzQ5cbpFDuo8BwtMFdRiMpU4Rxo+BAksuTWVkWdcGS5g+RBvAvrkkbqqfuAjgdpDHzGX3ziJ/f/fdqUIm5KA68b/RMhWpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Q9Fr3lfZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=A598f15I; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Q9Fr3lfZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="A598f15I"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GBTIOl024545;
	Wed, 16 Apr 2025 13:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=4RFbeyIu2yyHpzHRUg
	zapKgd0JGvdGOGkg592Gk0S0A=; b=Q9Fr3lfZT0Monb1K6hxJLgGeKfRm+pK4wR
	rlYZ8SDQptoSM4AWc7lmGNBsx10+aSxnQjnLp7AE5bRcElRhOXnqNTrXzbQb0t/y
	HP5ouvDjzYVAsxZzFKn2WLVOFvC4NFpS//ciWOkKXkP+5slIF4JFGjL40AtgYBoH
	Z7j7jeKz3j8bpf3ezKqQ/m703SdokcAg4VNlXoVm+HvyfTQAys9Glo9Hde5dYlWl
	UojpG+Z7DuirBq1z97qUKIB/oihq1vBOiz8zhEwXZFAQD2p5Ezs+FgNNUJFpgkPL
	04aelDCreOoTNecHPwZ7s7QKSUnIOlqaEPeUSCkSr+awCkuQepbw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4619443v0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 13:07:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53GC0Q8k031334;
	Wed, 16 Apr 2025 13:07:28 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460dbc4034-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 13:07:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJodJVmTxuQY+R6gBf/NM216zO0vvQOyiQ7GEkVzvl0Bk2tHtH1CkUclhcNgBjYGUZvvUehdEwrw8AegNUkqe7Il77cTQs7mY0oWMqc/MhbMawfs21iqy2fPwRA83l3hZGrCiQxhQLz8dR40O2gQ+VzqA7wgKPZH/5rnD9LsFrUFyW2QD61vrqy5PCs0gKaMMJBkdvmwsQhKqQ30UkuHqdq6BKezou67ppm5r8YrJTUgbCSnf4zTaj+25BVO3zvA/tZvO7JX55VpM4Qe7DfGoO3qYIjMd4l+VW5SbRwcoBCOBxHufNuiyX3DBM3v1Tp6giI+jKP41j17Njea1dXcBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RFbeyIu2yyHpzHRUgzapKgd0JGvdGOGkg592Gk0S0A=;
 b=ieqg4XvFhEqUZSjXfolzrvDtxK9hmq4akgblat67On820BrfKfDJYxDqhYSXw2FOLX7vn7B9NpMJa0nUe1+9NexQpTPX2FcF7JLHj76dL6VRtJJw0ABOMFuwCEG5cAD4Dm5V8KRwnTc/XGs+S8gzpHxKc4PFGpnbqfF0AGEQiW0ocjgoXDLv2Hz7ibOAEiJyOBn3NeIhCwPuUHJwLnW/BLgtHtlUQoVHuQmQdrd3dGtWy7tMbn2qkdOEy2hyHhVZdeNL4tnonUd4VsSDs/6bYXh26uVUJIvSZJkj3cZo8uMWdLXrypHbJUBj5JRYfm3TitRlPtjOFh/CDwhmZdwsOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RFbeyIu2yyHpzHRUgzapKgd0JGvdGOGkg592Gk0S0A=;
 b=A598f15IogeV1WPQas6HxmR7xnTKVRTywww/LrtFGP/b2nVM2pRG+XGrzHeQ+yQzLhDptdLfPU0GC6z4LebyDx3G9p5tSsRVLHJZlF0x5QGQVNxiB48QNihYlH4fakn2IoxBKOkdejUiHEITtmVvjVUiTPYGfVyXUHussfBT/Vw=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by BLAPR10MB4881.namprd10.prod.outlook.com (2603:10b6:208:327::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 13:07:24 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%7]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 13:07:24 +0000
Date: Wed, 16 Apr 2025 09:07:21 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Vlastimil Babka <vbabka@suse.cz>, Matthew Wilcox <willy@infradead.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        SeongJae Park <sj@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>,
        David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH v2 1/2] mm: move mmap/vma locking logic into specific
 files
Message-ID: <2x7whirgbvwzpm6iy2pnh7pqhnjgpvoxpo526nxifryizs7bsn@wpxu2d77co4n>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Matthew Wilcox <willy@infradead.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	SeongJae Park <sj@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <cover.1744799282.git.lorenzo.stoakes@oracle.com>
 <bec6c8e29fa8de9267a811a10b1bdae355d67ed4.1744799282.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bec6c8e29fa8de9267a811a10b1bdae355d67ed4.1744799282.git.lorenzo.stoakes@oracle.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YQBPR0101CA0166.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::9) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|BLAPR10MB4881:EE_
X-MS-Office365-Filtering-Correlation-Id: dbc2e0ac-9049-408a-87bd-08dd7ce7a18b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1Cg7vxBeh8UV3Ms2B6bTMEZcaroC9Ppvc0xdNKZ39ZmxiWk6YM+kxOVUQKLg?=
 =?us-ascii?Q?L3/ct+BowMvcF5uj8ZPMXbctrFQy+CBb4d8OxzmLSdSFiBgu3IM59KzqYZQw?=
 =?us-ascii?Q?5XnsDN7KfvF3sqg/TFS3WlqDryVZPgD2v1oHLMOfWZQQ6Tjtjquww5m90hM3?=
 =?us-ascii?Q?cpqaoxUAp39st6FcBWVDALpz0oxGmcixGH6+iKXwJbfJYaqUPfzKJE7MKq+A?=
 =?us-ascii?Q?j+ZXg9k9LoMlNchn8JuhhCq5Zc7PjOnbolXFU/y5+y7j3lyUTFy2274zyO7T?=
 =?us-ascii?Q?/iV4FZMRP3nFc/5OuLkedmRUX8wmdKsDDZqiUFh8JYjUDwbsFgQI04QmK6/d?=
 =?us-ascii?Q?vwz7qcotVgBeFv9EHlq/QH/ENXcaIrtFn4bthS/KxEGZrqSmEQ9q72oKlLIY?=
 =?us-ascii?Q?PeZjt2WqBLNKai/+3FYtmLOLal5Ax/+afO0IKYjj/szDRUWO4L823hdsyVVO?=
 =?us-ascii?Q?6zZe8iqRhvGaeOjFmHbAT+hmdumiJXzcpchYYY5/+GhAjbX2egcaAfbtF7sE?=
 =?us-ascii?Q?91SXhV+EC+vxENtJE5dsanoEV4ne+Bl8oRQWjOn5Tl/0HtsJXmcU8e8OYLdu?=
 =?us-ascii?Q?M9rQbeYhdI19yJCSUugThYAH86LPMPeN0nfSFjzMv5ZC1DXCgoNBSVglTxi9?=
 =?us-ascii?Q?amsuE4sRC/W6csnDReDOdZBPGQeuPkYwcwHjlYQS/oaZD5OK2BCgF2IuuqUn?=
 =?us-ascii?Q?n9tJUlpUjZg6yIPOgJnWz8fYLU6vpZ7RAwWmxw44fX5c1zV38d2c6PqLorvm?=
 =?us-ascii?Q?fugcSNlk3eXJPK61X73SOnKtp2rZo5eAJ+JZalgRlV48TX7Vqau4S0n+UE8h?=
 =?us-ascii?Q?0z1jQ8tpyzW7M/TFvlPCh1DTB+OrbPSd013TWViGtIBfXJv6FmcaVBduFtHi?=
 =?us-ascii?Q?AAZSiGzz7lr+H6f1IexkR3WmxaUuDSNWXazz/i+2TBl/EuW0nqH+7WdmUJ4Z?=
 =?us-ascii?Q?LqwbYCb3+Gvwunclf1s6EBQ6T+D0mYIcgz1P3Vd1cYbcI3XAIjcpPpKTSDXc?=
 =?us-ascii?Q?3Mgr2Q/zSyeWsn/4N0zkTpNHWDkqILzZjeb6TUZ5VYrAio1KHRRp7x8sII1q?=
 =?us-ascii?Q?CzYXmOi5hXUwXN54B12YcpgnLzjnBKYdKx+u+xpymJeEi5+MQMIScdgQvqHC?=
 =?us-ascii?Q?HcGWsDBtF3JgsPAZj1Rmb7xToKsrRs2d5DKIeWamoBiQErTABQiCq9GwTUPj?=
 =?us-ascii?Q?3tT/aNkZGzE/Qp2hJi27lhcvFDf3D4xk/tyWByrTu9NNhMOxmgFDY+2ypLdN?=
 =?us-ascii?Q?WQk/6ZZ3WuhvC61Jb4Xg9486H+hDYnTKZqMsF5r+AELYJ/FPgtgH2XQSeCTN?=
 =?us-ascii?Q?Ms7G0kaVlvwF3aIS3tq7zfBWqtbzUnN9y2Xwp/FjEJW4fg9wj1IZBL43e6dQ?=
 =?us-ascii?Q?Ik2psK5jSM1T6ZFCr3lSuvmJCfhsGJhVlMiL8DZtKlleVaFr/qB2B1GC6ZiB?=
 =?us-ascii?Q?E0/8r4u4nig=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wO2WdPQxfHFMrYEqxzWfXjvbT4kiSMuO6H/lJdqfGRt61V2DwiTIl6AsAYhE?=
 =?us-ascii?Q?h4gWWu8VieevY8dEJcmFM3UfmiBTpNKQA96yltOQadSkdfgjxKoQlkodDxms?=
 =?us-ascii?Q?GOnsv9u4UbLjmso6K87VXOk3bPXI0Nc81FjnehoKcdzquv4PHJe8vltKbE8f?=
 =?us-ascii?Q?iRFjh0m4ocWAPT/FzK362LH1M36XW0y+vDRak77I0d0uLhYcaqotexMjowg9?=
 =?us-ascii?Q?1PBCSbbBu6ZqLHqHJSTvZw3U9btqwZvqvQYCYE8R0YQUpSd3yiKV/gN1sqH3?=
 =?us-ascii?Q?dg1M66uDkt7Vvnqh5gB/Zp7wYs2ap9Ap3eRine5HPc3DSSbDQcPdH4N5t7Rm?=
 =?us-ascii?Q?tABOX7A3WPhMlRIDPTFwEbYT1klVSC1n3SlVoNpYlFcVznaB48x0Y9SWswyl?=
 =?us-ascii?Q?UakfYQZapm11a1zcB+sBjBeiggrW2cesGRvlM1v7V04SOmGD0vVyrqKtb5fV?=
 =?us-ascii?Q?LH+AaQbq+XS6yAV+Vub3sEPke7drNdkktRvxkJ5eFBx9Axb6G+pN0mIxdohl?=
 =?us-ascii?Q?1J4QYC37vnSNOYoTFffbwBplRhcOlwLB1DqdZi+8tCI/fjcZeOnRj1nmSVuk?=
 =?us-ascii?Q?5ozCy9nUX0+tuDAbG65FL2K38AE8MOtaO3/djO45eqSeNAwKI+n0nLtnaHal?=
 =?us-ascii?Q?pAaTH7310VexPXdIZNQVrtyD+CEcvTMRsYTpMuGoX+gG2Izrs1jYzFyuSuyO?=
 =?us-ascii?Q?ReZaW42Fu0xhtGUJQ05C/o8RPXoLSBHniV+uKtODh8WSqfHR5ZcfhiCR5ahk?=
 =?us-ascii?Q?GLwwcOLSgOADPjC3qUFzZ+S8E1Em5OuXNh/ovKYL3yyva9L24nWGHlipXxSo?=
 =?us-ascii?Q?M+C6PNcN/MFEsAq9MA+K6NwmeqXP40mMamkjdHK0d4uGQdrwAiRdYTWv41Tj?=
 =?us-ascii?Q?7x8v7jONykQfFhf2b5VxKz20aPUG3lBivMfvV/u1tGMo7DUzyWPAtGZUTk2I?=
 =?us-ascii?Q?J75+JKA0X5ZcfX5KsMkl9a0Cg8kduiofV1WYZmbygvPyQ1rxaXXnteUPClzZ?=
 =?us-ascii?Q?TtXXZZiSAwvs/e736c9EkyAoJSY6Tsh3xTOcfafNTarfs29tLlheCsDhGkYV?=
 =?us-ascii?Q?ppWxesiqQE9wSijh3zLqMXjWjRYhs1fGLB6guYfEUEbO1xNsXAxmGmPBHy6V?=
 =?us-ascii?Q?VrdWg/t0esbM2Fz6Auy3vfqm3RmImFklCBEDuNpl6A7ySuvXV6RJYf7JmFKI?=
 =?us-ascii?Q?XwhnuNHhwT1CFlGSqE6Bmt+0Xcjc8+T0+LWs3wGZ/C+Vho0bzsaUclBiPDgk?=
 =?us-ascii?Q?GgyiDJlsV3V5KlP2MEa8Ql+Gk8NNw1avJE34d5ZT6jOUX7ZCtFZ2KA4T55cn?=
 =?us-ascii?Q?Y2WRqUeIBwpQVvuEW2yd2HTCgw71WJltwiA1sMkSdfldb+wTCfAcfMPAg4qv?=
 =?us-ascii?Q?lT6LtP/ZmfxI/PwgyXOc38ph2Jy9vlKUKl1qfbbZLokdm7QMqi8/m45kKkz7?=
 =?us-ascii?Q?PDxwZR6GcOfL2YBpUS7HuE4DWXBq41CBQOlcLCLt5Ms88hme5zvTvacTNmdk?=
 =?us-ascii?Q?RtB1Qvuk8WLLxrRoTs8NTTrsKyximdk07CGiSjDHiL9JbbOAZ1gNXKFQkWHR?=
 =?us-ascii?Q?WfviKVmBt6LvmYGduv0ssnLn5ioLQicZRvoNGgzB?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	exSFfII9EZ1Pkfyhp7XKUeM/u4nfJsiBrXhNuZg8fiPjV16/GZ5m0g55YJatPmbtUOtk0aNmrGaCcIpTDX/g6+OqT2PNO+Go3Y+vv/Q+bP06r4NsY8XBnnqQHTglSuUS0g7oEsrcxHbN+pxw7KdopQMJjfw2odOIqf6kXwETAsvkeNPkORmR8ZAATWOzKv6CY2/09MK0jAadkxiFJEtBzUXn7VGtLGC61e3G1VvlGYRQVGLeonAG3N3ziaJGTzNesgLuI36FgFSOLKGvNuFJOC+vCJJ74sFjWUOoQRMBYZzFGuEAbmD3cC4niCsYqbtZFnHhrdUWeQjkGeS7KucFuF2loYOgmTC5699r3wAoteIO2HBEaepLyUMk0Mm17l4l4yyxU3t/6zHT7Jv8QG55kTYiUO+mZR+NNKq2YqH2gmY1lqVMkbXYlCQ7fRrAlFL7Cja7tNNi1A4gkcGHDbktrEMnBfIJZyk4uQxspXbHfQJ3HMxZcceO5zc/0sGNyaQ7NWueBsNpjmvOIj5kd9Meq+Nni0HI0Bhq+I21IuMyYwjt4/Oia54Z7DEoDReblH8gE+uGlLiB/Kjq4zPptESY3SvBw13o87FH/08XO3c32eg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc2e0ac-9049-408a-87bd-08dd7ce7a18b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 13:07:24.8184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+u8NANXtbv7ZQVY4yXhZvz81T56z5XrXgVT220//UfSpG9YrKo0GtGxeuc+zwsFHqdhvBvI7f197ehDgSeXfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4881
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504160107
X-Proofpoint-GUID: t-J88_yBvOgJyuuziOQg1Rpc4cH5jEfp
X-Proofpoint-ORIG-GUID: t-J88_yBvOgJyuuziOQg1Rpc4cH5jEfp

* Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [250416 06:38]:
> Currently the VMA and mmap locking logic is entangled in two of the most
> overwrought files in mm - include/linux/mm.h and mm/memory.c. Separate this
> logic out so we can more easily make changes and create an appropriate
> MAINTAINERS entry that spans only the logic relating to locking.
> 
> This should have no functional change. Care is taken to avoid dependency
> loops, we must regrettably keep release_fault_lock() and
> assert_fault_locked() in mm.h as a result due to the dependence on the
> vm_fault type.
> 
> Additionally we must declare rcuwait_wake_up() manually to avoid a
> dependency cycle on linux/rcuwait.h.
> 
> Additionally move the nommu implementatino of lock_mm_and_find_vma() to
> mmap_lock.c so everything lock-related is in one place.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  include/linux/mm.h        | 231 +-------------------------------
>  include/linux/mmap_lock.h | 227 +++++++++++++++++++++++++++++++
>  mm/memory.c               | 252 -----------------------------------
>  mm/mmap_lock.c            | 273 ++++++++++++++++++++++++++++++++++++++
>  mm/nommu.c                |  16 ---
>  5 files changed, 504 insertions(+), 495 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 5eb0d77c4438..9b701cfbef22 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -671,204 +671,11 @@ static inline void vma_numab_state_init(struct vm_area_struct *vma) {}
>  static inline void vma_numab_state_free(struct vm_area_struct *vma) {}
>  #endif /* CONFIG_NUMA_BALANCING */
>  
> -#ifdef CONFIG_PER_VMA_LOCK
> -static inline void vma_lock_init(struct vm_area_struct *vma, bool reset_refcnt)
> -{
> -#ifdef CONFIG_DEBUG_LOCK_ALLOC
> -	static struct lock_class_key lockdep_key;
> -
> -	lockdep_init_map(&vma->vmlock_dep_map, "vm_lock", &lockdep_key, 0);
> -#endif
> -	if (reset_refcnt)
> -		refcount_set(&vma->vm_refcnt, 0);
> -	vma->vm_lock_seq = UINT_MAX;
> -}
> -
> -static inline bool is_vma_writer_only(int refcnt)
> -{
> -	/*
> -	 * With a writer and no readers, refcnt is VMA_LOCK_OFFSET if the vma
> -	 * is detached and (VMA_LOCK_OFFSET + 1) if it is attached. Waiting on
> -	 * a detached vma happens only in vma_mark_detached() and is a rare
> -	 * case, therefore most of the time there will be no unnecessary wakeup.
> -	 */
> -	return refcnt & VMA_LOCK_OFFSET && refcnt <= VMA_LOCK_OFFSET + 1;
> -}
> -
> -static inline void vma_refcount_put(struct vm_area_struct *vma)
> -{
> -	/* Use a copy of vm_mm in case vma is freed after we drop vm_refcnt */
> -	struct mm_struct *mm = vma->vm_mm;
> -	int oldcnt;
> -
> -	rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> -	if (!__refcount_dec_and_test(&vma->vm_refcnt, &oldcnt)) {
> -
> -		if (is_vma_writer_only(oldcnt - 1))
> -			rcuwait_wake_up(&mm->vma_writer_wait);
> -	}
> -}
> -
> -/*
> - * Try to read-lock a vma. The function is allowed to occasionally yield false
> - * locked result to avoid performance overhead, in which case we fall back to
> - * using mmap_lock. The function should never yield false unlocked result.
> - * False locked result is possible if mm_lock_seq overflows or if vma gets
> - * reused and attached to a different mm before we lock it.
> - * Returns the vma on success, NULL on failure to lock and EAGAIN if vma got
> - * detached.
> - */
> -static inline struct vm_area_struct *vma_start_read(struct mm_struct *mm,
> -						    struct vm_area_struct *vma)
> -{
> -	int oldcnt;
> -
> -	/*
> -	 * Check before locking. A race might cause false locked result.
> -	 * We can use READ_ONCE() for the mm_lock_seq here, and don't need
> -	 * ACQUIRE semantics, because this is just a lockless check whose result
> -	 * we don't rely on for anything - the mm_lock_seq read against which we
> -	 * need ordering is below.
> -	 */
> -	if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(mm->mm_lock_seq.sequence))
> -		return NULL;
> -
> -	/*
> -	 * If VMA_LOCK_OFFSET is set, __refcount_inc_not_zero_limited_acquire()
> -	 * will fail because VMA_REF_LIMIT is less than VMA_LOCK_OFFSET.
> -	 * Acquire fence is required here to avoid reordering against later
> -	 * vm_lock_seq check and checks inside lock_vma_under_rcu().
> -	 */
> -	if (unlikely(!__refcount_inc_not_zero_limited_acquire(&vma->vm_refcnt, &oldcnt,
> -							      VMA_REF_LIMIT))) {
> -		/* return EAGAIN if vma got detached from under us */
> -		return oldcnt ? NULL : ERR_PTR(-EAGAIN);
> -	}
> -
> -	rwsem_acquire_read(&vma->vmlock_dep_map, 0, 1, _RET_IP_);
> -	/*
> -	 * Overflow of vm_lock_seq/mm_lock_seq might produce false locked result.
> -	 * False unlocked result is impossible because we modify and check
> -	 * vma->vm_lock_seq under vma->vm_refcnt protection and mm->mm_lock_seq
> -	 * modification invalidates all existing locks.
> -	 *
> -	 * We must use ACQUIRE semantics for the mm_lock_seq so that if we are
> -	 * racing with vma_end_write_all(), we only start reading from the VMA
> -	 * after it has been unlocked.
> -	 * This pairs with RELEASE semantics in vma_end_write_all().
> -	 */
> -	if (unlikely(vma->vm_lock_seq == raw_read_seqcount(&mm->mm_lock_seq))) {
> -		vma_refcount_put(vma);
> -		return NULL;
> -	}
> -
> -	return vma;
> -}
> -
> -/*
> - * Use only while holding mmap read lock which guarantees that locking will not
> - * fail (nobody can concurrently write-lock the vma). vma_start_read() should
> - * not be used in such cases because it might fail due to mm_lock_seq overflow.
> - * This functionality is used to obtain vma read lock and drop the mmap read lock.
> - */
> -static inline bool vma_start_read_locked_nested(struct vm_area_struct *vma, int subclass)
> -{
> -	int oldcnt;
> -
> -	mmap_assert_locked(vma->vm_mm);
> -	if (unlikely(!__refcount_inc_not_zero_limited_acquire(&vma->vm_refcnt, &oldcnt,
> -							      VMA_REF_LIMIT)))
> -		return false;
> -
> -	rwsem_acquire_read(&vma->vmlock_dep_map, 0, 1, _RET_IP_);
> -	return true;
> -}
> -
> -/*
> - * Use only while holding mmap read lock which guarantees that locking will not
> - * fail (nobody can concurrently write-lock the vma). vma_start_read() should
> - * not be used in such cases because it might fail due to mm_lock_seq overflow.
> - * This functionality is used to obtain vma read lock and drop the mmap read lock.
> - */
> -static inline bool vma_start_read_locked(struct vm_area_struct *vma)
> -{
> -	return vma_start_read_locked_nested(vma, 0);
> -}
> -
> -static inline void vma_end_read(struct vm_area_struct *vma)
> -{
> -	vma_refcount_put(vma);
> -}
> -
> -/* WARNING! Can only be used if mmap_lock is expected to be write-locked */
> -static bool __is_vma_write_locked(struct vm_area_struct *vma, unsigned int *mm_lock_seq)
> -{
> -	mmap_assert_write_locked(vma->vm_mm);
> -
> -	/*
> -	 * current task is holding mmap_write_lock, both vma->vm_lock_seq and
> -	 * mm->mm_lock_seq can't be concurrently modified.
> -	 */
> -	*mm_lock_seq = vma->vm_mm->mm_lock_seq.sequence;
> -	return (vma->vm_lock_seq == *mm_lock_seq);
> -}
> -
> -void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq);
> -
> -/*
> - * Begin writing to a VMA.
> - * Exclude concurrent readers under the per-VMA lock until the currently
> - * write-locked mmap_lock is dropped or downgraded.
> - */
> -static inline void vma_start_write(struct vm_area_struct *vma)
> -{
> -	unsigned int mm_lock_seq;
> -
> -	if (__is_vma_write_locked(vma, &mm_lock_seq))
> -		return;
> -
> -	__vma_start_write(vma, mm_lock_seq);
> -}
> -
> -static inline void vma_assert_write_locked(struct vm_area_struct *vma)
> -{
> -	unsigned int mm_lock_seq;
> -
> -	VM_BUG_ON_VMA(!__is_vma_write_locked(vma, &mm_lock_seq), vma);
> -}
> -
> -static inline void vma_assert_locked(struct vm_area_struct *vma)
> -{
> -	unsigned int mm_lock_seq;
> -
> -	VM_BUG_ON_VMA(refcount_read(&vma->vm_refcnt) <= 1 &&
> -		      !__is_vma_write_locked(vma, &mm_lock_seq), vma);
> -}
> -
>  /*
> - * WARNING: to avoid racing with vma_mark_attached()/vma_mark_detached(), these
> - * assertions should be made either under mmap_write_lock or when the object
> - * has been isolated under mmap_write_lock, ensuring no competing writers.
> + * These must be here rather than mmap_lock.h as dependent on vm_fault type,
> + * declared in this header.
>   */
> -static inline void vma_assert_attached(struct vm_area_struct *vma)
> -{
> -	WARN_ON_ONCE(!refcount_read(&vma->vm_refcnt));
> -}
> -
> -static inline void vma_assert_detached(struct vm_area_struct *vma)
> -{
> -	WARN_ON_ONCE(refcount_read(&vma->vm_refcnt));
> -}
> -
> -static inline void vma_mark_attached(struct vm_area_struct *vma)
> -{
> -	vma_assert_write_locked(vma);
> -	vma_assert_detached(vma);
> -	refcount_set_release(&vma->vm_refcnt, 1);
> -}
> -
> -void vma_mark_detached(struct vm_area_struct *vma);
> -
> +#ifdef CONFIG_PER_VMA_LOCK
>  static inline void release_fault_lock(struct vm_fault *vmf)
>  {
>  	if (vmf->flags & FAULT_FLAG_VMA_LOCK)
> @@ -884,36 +691,7 @@ static inline void assert_fault_locked(struct vm_fault *vmf)
>  	else
>  		mmap_assert_locked(vmf->vma->vm_mm);
>  }
> -
> -struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
> -					  unsigned long address);
> -
> -#else /* CONFIG_PER_VMA_LOCK */
> -
> -static inline void vma_lock_init(struct vm_area_struct *vma, bool reset_refcnt) {}
> -static inline struct vm_area_struct *vma_start_read(struct mm_struct *mm,
> -						    struct vm_area_struct *vma)
> -		{ return NULL; }
> -static inline void vma_end_read(struct vm_area_struct *vma) {}
> -static inline void vma_start_write(struct vm_area_struct *vma) {}
> -static inline void vma_assert_write_locked(struct vm_area_struct *vma)
> -		{ mmap_assert_write_locked(vma->vm_mm); }
> -static inline void vma_assert_attached(struct vm_area_struct *vma) {}
> -static inline void vma_assert_detached(struct vm_area_struct *vma) {}
> -static inline void vma_mark_attached(struct vm_area_struct *vma) {}
> -static inline void vma_mark_detached(struct vm_area_struct *vma) {}
> -
> -static inline struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
> -		unsigned long address)
> -{
> -	return NULL;
> -}
> -
> -static inline void vma_assert_locked(struct vm_area_struct *vma)
> -{
> -	mmap_assert_locked(vma->vm_mm);
> -}
> -
> +#else
>  static inline void release_fault_lock(struct vm_fault *vmf)
>  {
>  	mmap_read_unlock(vmf->vma->vm_mm);
> @@ -923,7 +701,6 @@ static inline void assert_fault_locked(struct vm_fault *vmf)
>  {
>  	mmap_assert_locked(vmf->vma->vm_mm);
>  }
> -
>  #endif /* CONFIG_PER_VMA_LOCK */
>  
>  extern const struct vm_operations_struct vma_dummy_vm_ops;
> diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
> index 4706c6769902..7983b2efe9bf 100644
> --- a/include/linux/mmap_lock.h
> +++ b/include/linux/mmap_lock.h
> @@ -1,6 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  #ifndef _LINUX_MMAP_LOCK_H
>  #define _LINUX_MMAP_LOCK_H
>  
> +/* Avoid a dependency loop by declaring here. */
> +extern int rcuwait_wake_up(struct rcuwait *w);
> +
>  #include <linux/lockdep.h>
>  #include <linux/mm_types.h>
>  #include <linux/mmdebug.h>
> @@ -104,6 +108,206 @@ static inline bool mmap_lock_speculate_retry(struct mm_struct *mm, unsigned int
>  	return read_seqcount_retry(&mm->mm_lock_seq, seq);
>  }
>  
> +static inline void vma_lock_init(struct vm_area_struct *vma, bool reset_refcnt)
> +{
> +#ifdef CONFIG_DEBUG_LOCK_ALLOC
> +	static struct lock_class_key lockdep_key;
> +
> +	lockdep_init_map(&vma->vmlock_dep_map, "vm_lock", &lockdep_key, 0);
> +#endif
> +	if (reset_refcnt)
> +		refcount_set(&vma->vm_refcnt, 0);
> +	vma->vm_lock_seq = UINT_MAX;
> +}
> +
> +static inline bool is_vma_writer_only(int refcnt)
> +{
> +	/*
> +	 * With a writer and no readers, refcnt is VMA_LOCK_OFFSET if the vma
> +	 * is detached and (VMA_LOCK_OFFSET + 1) if it is attached. Waiting on
> +	 * a detached vma happens only in vma_mark_detached() and is a rare
> +	 * case, therefore most of the time there will be no unnecessary wakeup.
> +	 */
> +	return refcnt & VMA_LOCK_OFFSET && refcnt <= VMA_LOCK_OFFSET + 1;
> +}
> +
> +static inline void vma_refcount_put(struct vm_area_struct *vma)
> +{
> +	/* Use a copy of vm_mm in case vma is freed after we drop vm_refcnt */
> +	struct mm_struct *mm = vma->vm_mm;
> +	int oldcnt;
> +
> +	rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> +	if (!__refcount_dec_and_test(&vma->vm_refcnt, &oldcnt)) {
> +
> +		if (is_vma_writer_only(oldcnt - 1))
> +			rcuwait_wake_up(&mm->vma_writer_wait);
> +	}
> +}
> +
> +/*
> + * Try to read-lock a vma. The function is allowed to occasionally yield false
> + * locked result to avoid performance overhead, in which case we fall back to
> + * using mmap_lock. The function should never yield false unlocked result.
> + * False locked result is possible if mm_lock_seq overflows or if vma gets
> + * reused and attached to a different mm before we lock it.
> + * Returns the vma on success, NULL on failure to lock and EAGAIN if vma got
> + * detached.
> + */
> +static inline struct vm_area_struct *vma_start_read(struct mm_struct *mm,
> +						    struct vm_area_struct *vma)
> +{
> +	int oldcnt;
> +
> +	/*
> +	 * Check before locking. A race might cause false locked result.
> +	 * We can use READ_ONCE() for the mm_lock_seq here, and don't need
> +	 * ACQUIRE semantics, because this is just a lockless check whose result
> +	 * we don't rely on for anything - the mm_lock_seq read against which we
> +	 * need ordering is below.
> +	 */
> +	if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(mm->mm_lock_seq.sequence))
> +		return NULL;
> +
> +	/*
> +	 * If VMA_LOCK_OFFSET is set, __refcount_inc_not_zero_limited_acquire()
> +	 * will fail because VMA_REF_LIMIT is less than VMA_LOCK_OFFSET.
> +	 * Acquire fence is required here to avoid reordering against later
> +	 * vm_lock_seq check and checks inside lock_vma_under_rcu().
> +	 */
> +	if (unlikely(!__refcount_inc_not_zero_limited_acquire(&vma->vm_refcnt, &oldcnt,
> +							      VMA_REF_LIMIT))) {
> +		/* return EAGAIN if vma got detached from under us */
> +		return oldcnt ? NULL : ERR_PTR(-EAGAIN);
> +	}
> +
> +	rwsem_acquire_read(&vma->vmlock_dep_map, 0, 1, _RET_IP_);
> +	/*
> +	 * Overflow of vm_lock_seq/mm_lock_seq might produce false locked result.
> +	 * False unlocked result is impossible because we modify and check
> +	 * vma->vm_lock_seq under vma->vm_refcnt protection and mm->mm_lock_seq
> +	 * modification invalidates all existing locks.
> +	 *
> +	 * We must use ACQUIRE semantics for the mm_lock_seq so that if we are
> +	 * racing with vma_end_write_all(), we only start reading from the VMA
> +	 * after it has been unlocked.
> +	 * This pairs with RELEASE semantics in vma_end_write_all().
> +	 */
> +	if (unlikely(vma->vm_lock_seq == raw_read_seqcount(&mm->mm_lock_seq))) {
> +		vma_refcount_put(vma);
> +		return NULL;
> +	}
> +
> +	return vma;
> +}
> +
> +/*
> + * Use only while holding mmap read lock which guarantees that locking will not
> + * fail (nobody can concurrently write-lock the vma). vma_start_read() should
> + * not be used in such cases because it might fail due to mm_lock_seq overflow.
> + * This functionality is used to obtain vma read lock and drop the mmap read lock.
> + */
> +static inline bool vma_start_read_locked_nested(struct vm_area_struct *vma, int subclass)
> +{
> +	int oldcnt;
> +
> +	mmap_assert_locked(vma->vm_mm);
> +	if (unlikely(!__refcount_inc_not_zero_limited_acquire(&vma->vm_refcnt, &oldcnt,
> +							      VMA_REF_LIMIT)))
> +		return false;
> +
> +	rwsem_acquire_read(&vma->vmlock_dep_map, 0, 1, _RET_IP_);
> +	return true;
> +}
> +
> +/*
> + * Use only while holding mmap read lock which guarantees that locking will not
> + * fail (nobody can concurrently write-lock the vma). vma_start_read() should
> + * not be used in such cases because it might fail due to mm_lock_seq overflow.
> + * This functionality is used to obtain vma read lock and drop the mmap read lock.
> + */
> +static inline bool vma_start_read_locked(struct vm_area_struct *vma)
> +{
> +	return vma_start_read_locked_nested(vma, 0);
> +}
> +
> +static inline void vma_end_read(struct vm_area_struct *vma)
> +{
> +	vma_refcount_put(vma);
> +}
> +
> +/* WARNING! Can only be used if mmap_lock is expected to be write-locked */
> +static bool __is_vma_write_locked(struct vm_area_struct *vma, unsigned int *mm_lock_seq)
> +{
> +	mmap_assert_write_locked(vma->vm_mm);
> +
> +	/*
> +	 * current task is holding mmap_write_lock, both vma->vm_lock_seq and
> +	 * mm->mm_lock_seq can't be concurrently modified.
> +	 */
> +	*mm_lock_seq = vma->vm_mm->mm_lock_seq.sequence;
> +	return (vma->vm_lock_seq == *mm_lock_seq);
> +}
> +
> +void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq);
> +
> +/*
> + * Begin writing to a VMA.
> + * Exclude concurrent readers under the per-VMA lock until the currently
> + * write-locked mmap_lock is dropped or downgraded.
> + */
> +static inline void vma_start_write(struct vm_area_struct *vma)
> +{
> +	unsigned int mm_lock_seq;
> +
> +	if (__is_vma_write_locked(vma, &mm_lock_seq))
> +		return;
> +
> +	__vma_start_write(vma, mm_lock_seq);
> +}
> +
> +static inline void vma_assert_write_locked(struct vm_area_struct *vma)
> +{
> +	unsigned int mm_lock_seq;
> +
> +	VM_BUG_ON_VMA(!__is_vma_write_locked(vma, &mm_lock_seq), vma);
> +}
> +
> +static inline void vma_assert_locked(struct vm_area_struct *vma)
> +{
> +	unsigned int mm_lock_seq;
> +
> +	VM_BUG_ON_VMA(refcount_read(&vma->vm_refcnt) <= 1 &&
> +		      !__is_vma_write_locked(vma, &mm_lock_seq), vma);
> +}
> +
> +/*
> + * WARNING: to avoid racing with vma_mark_attached()/vma_mark_detached(), these
> + * assertions should be made either under mmap_write_lock or when the object
> + * has been isolated under mmap_write_lock, ensuring no competing writers.
> + */
> +static inline void vma_assert_attached(struct vm_area_struct *vma)
> +{
> +	WARN_ON_ONCE(!refcount_read(&vma->vm_refcnt));
> +}
> +
> +static inline void vma_assert_detached(struct vm_area_struct *vma)
> +{
> +	WARN_ON_ONCE(refcount_read(&vma->vm_refcnt));
> +}
> +
> +static inline void vma_mark_attached(struct vm_area_struct *vma)
> +{
> +	vma_assert_write_locked(vma);
> +	vma_assert_detached(vma);
> +	refcount_set_release(&vma->vm_refcnt, 1);
> +}
> +
> +void vma_mark_detached(struct vm_area_struct *vma);
> +
> +struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
> +					  unsigned long address);
> +
>  #else /* CONFIG_PER_VMA_LOCK */
>  
>  static inline void mm_lock_seqcount_init(struct mm_struct *mm) {}
> @@ -119,6 +323,29 @@ static inline bool mmap_lock_speculate_retry(struct mm_struct *mm, unsigned int
>  {
>  	return true;
>  }
> +static inline void vma_lock_init(struct vm_area_struct *vma, bool reset_refcnt) {}
> +static inline struct vm_area_struct *vma_start_read(struct mm_struct *mm,
> +						    struct vm_area_struct *vma)
> +		{ return NULL; }
> +static inline void vma_end_read(struct vm_area_struct *vma) {}
> +static inline void vma_start_write(struct vm_area_struct *vma) {}
> +static inline void vma_assert_write_locked(struct vm_area_struct *vma)
> +		{ mmap_assert_write_locked(vma->vm_mm); }
> +static inline void vma_assert_attached(struct vm_area_struct *vma) {}
> +static inline void vma_assert_detached(struct vm_area_struct *vma) {}
> +static inline void vma_mark_attached(struct vm_area_struct *vma) {}
> +static inline void vma_mark_detached(struct vm_area_struct *vma) {}
> +
> +static inline struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
> +		unsigned long address)
> +{
> +	return NULL;
> +}
> +
> +static inline void vma_assert_locked(struct vm_area_struct *vma)
> +{
> +	mmap_assert_locked(vma->vm_mm);
> +}
>  
>  #endif /* CONFIG_PER_VMA_LOCK */
>  
> diff --git a/mm/memory.c b/mm/memory.c
> index 688f3612e16d..35cfc91d5a2e 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -6378,258 +6378,6 @@ vm_fault_t handle_mm_fault(struct vm_area_struct *vma, unsigned long address,
>  }
>  EXPORT_SYMBOL_GPL(handle_mm_fault);
>  
> -#ifdef CONFIG_LOCK_MM_AND_FIND_VMA
> -#include <linux/extable.h>
> -
> -static inline bool get_mmap_lock_carefully(struct mm_struct *mm, struct pt_regs *regs)
> -{
> -	if (likely(mmap_read_trylock(mm)))
> -		return true;
> -
> -	if (regs && !user_mode(regs)) {
> -		unsigned long ip = exception_ip(regs);
> -		if (!search_exception_tables(ip))
> -			return false;
> -	}
> -
> -	return !mmap_read_lock_killable(mm);
> -}
> -
> -static inline bool mmap_upgrade_trylock(struct mm_struct *mm)
> -{
> -	/*
> -	 * We don't have this operation yet.
> -	 *
> -	 * It should be easy enough to do: it's basically a
> -	 *    atomic_long_try_cmpxchg_acquire()
> -	 * from RWSEM_READER_BIAS -> RWSEM_WRITER_LOCKED, but
> -	 * it also needs the proper lockdep magic etc.
> -	 */
> -	return false;
> -}
> -
> -static inline bool upgrade_mmap_lock_carefully(struct mm_struct *mm, struct pt_regs *regs)
> -{
> -	mmap_read_unlock(mm);
> -	if (regs && !user_mode(regs)) {
> -		unsigned long ip = exception_ip(regs);
> -		if (!search_exception_tables(ip))
> -			return false;
> -	}
> -	return !mmap_write_lock_killable(mm);
> -}
> -
> -/*
> - * Helper for page fault handling.
> - *
> - * This is kind of equivalent to "mmap_read_lock()" followed
> - * by "find_extend_vma()", except it's a lot more careful about
> - * the locking (and will drop the lock on failure).
> - *
> - * For example, if we have a kernel bug that causes a page
> - * fault, we don't want to just use mmap_read_lock() to get
> - * the mm lock, because that would deadlock if the bug were
> - * to happen while we're holding the mm lock for writing.
> - *
> - * So this checks the exception tables on kernel faults in
> - * order to only do this all for instructions that are actually
> - * expected to fault.
> - *
> - * We can also actually take the mm lock for writing if we
> - * need to extend the vma, which helps the VM layer a lot.
> - */
> -struct vm_area_struct *lock_mm_and_find_vma(struct mm_struct *mm,
> -			unsigned long addr, struct pt_regs *regs)
> -{
> -	struct vm_area_struct *vma;
> -
> -	if (!get_mmap_lock_carefully(mm, regs))
> -		return NULL;
> -
> -	vma = find_vma(mm, addr);
> -	if (likely(vma && (vma->vm_start <= addr)))
> -		return vma;
> -
> -	/*
> -	 * Well, dang. We might still be successful, but only
> -	 * if we can extend a vma to do so.
> -	 */
> -	if (!vma || !(vma->vm_flags & VM_GROWSDOWN)) {
> -		mmap_read_unlock(mm);
> -		return NULL;
> -	}
> -
> -	/*
> -	 * We can try to upgrade the mmap lock atomically,
> -	 * in which case we can continue to use the vma
> -	 * we already looked up.
> -	 *
> -	 * Otherwise we'll have to drop the mmap lock and
> -	 * re-take it, and also look up the vma again,
> -	 * re-checking it.
> -	 */
> -	if (!mmap_upgrade_trylock(mm)) {
> -		if (!upgrade_mmap_lock_carefully(mm, regs))
> -			return NULL;
> -
> -		vma = find_vma(mm, addr);
> -		if (!vma)
> -			goto fail;
> -		if (vma->vm_start <= addr)
> -			goto success;
> -		if (!(vma->vm_flags & VM_GROWSDOWN))
> -			goto fail;
> -	}
> -
> -	if (expand_stack_locked(vma, addr))
> -		goto fail;
> -
> -success:
> -	mmap_write_downgrade(mm);
> -	return vma;
> -
> -fail:
> -	mmap_write_unlock(mm);
> -	return NULL;
> -}
> -#endif
> -
> -#ifdef CONFIG_PER_VMA_LOCK
> -static inline bool __vma_enter_locked(struct vm_area_struct *vma, bool detaching)
> -{
> -	unsigned int tgt_refcnt = VMA_LOCK_OFFSET;
> -
> -	/* Additional refcnt if the vma is attached. */
> -	if (!detaching)
> -		tgt_refcnt++;
> -
> -	/*
> -	 * If vma is detached then only vma_mark_attached() can raise the
> -	 * vm_refcnt. mmap_write_lock prevents racing with vma_mark_attached().
> -	 */
> -	if (!refcount_add_not_zero(VMA_LOCK_OFFSET, &vma->vm_refcnt))
> -		return false;
> -
> -	rwsem_acquire(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
> -	rcuwait_wait_event(&vma->vm_mm->vma_writer_wait,
> -		   refcount_read(&vma->vm_refcnt) == tgt_refcnt,
> -		   TASK_UNINTERRUPTIBLE);
> -	lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
> -
> -	return true;
> -}
> -
> -static inline void __vma_exit_locked(struct vm_area_struct *vma, bool *detached)
> -{
> -	*detached = refcount_sub_and_test(VMA_LOCK_OFFSET, &vma->vm_refcnt);
> -	rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> -}
> -
> -void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq)
> -{
> -	bool locked;
> -
> -	/*
> -	 * __vma_enter_locked() returns false immediately if the vma is not
> -	 * attached, otherwise it waits until refcnt is indicating that vma
> -	 * is attached with no readers.
> -	 */
> -	locked = __vma_enter_locked(vma, false);
> -
> -	/*
> -	 * We should use WRITE_ONCE() here because we can have concurrent reads
> -	 * from the early lockless pessimistic check in vma_start_read().
> -	 * We don't really care about the correctness of that early check, but
> -	 * we should use WRITE_ONCE() for cleanliness and to keep KCSAN happy.
> -	 */
> -	WRITE_ONCE(vma->vm_lock_seq, mm_lock_seq);
> -
> -	if (locked) {
> -		bool detached;
> -
> -		__vma_exit_locked(vma, &detached);
> -		WARN_ON_ONCE(detached); /* vma should remain attached */
> -	}
> -}
> -EXPORT_SYMBOL_GPL(__vma_start_write);
> -
> -void vma_mark_detached(struct vm_area_struct *vma)
> -{
> -	vma_assert_write_locked(vma);
> -	vma_assert_attached(vma);
> -
> -	/*
> -	 * We are the only writer, so no need to use vma_refcount_put().
> -	 * The condition below is unlikely because the vma has been already
> -	 * write-locked and readers can increment vm_refcnt only temporarily
> -	 * before they check vm_lock_seq, realize the vma is locked and drop
> -	 * back the vm_refcnt. That is a narrow window for observing a raised
> -	 * vm_refcnt.
> -	 */
> -	if (unlikely(!refcount_dec_and_test(&vma->vm_refcnt))) {
> -		/* Wait until vma is detached with no readers. */
> -		if (__vma_enter_locked(vma, true)) {
> -			bool detached;
> -
> -			__vma_exit_locked(vma, &detached);
> -			WARN_ON_ONCE(!detached);
> -		}
> -	}
> -}
> -
> -/*
> - * Lookup and lock a VMA under RCU protection. Returned VMA is guaranteed to be
> - * stable and not isolated. If the VMA is not found or is being modified the
> - * function returns NULL.
> - */
> -struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
> -					  unsigned long address)
> -{
> -	MA_STATE(mas, &mm->mm_mt, address, address);
> -	struct vm_area_struct *vma;
> -
> -	rcu_read_lock();
> -retry:
> -	vma = mas_walk(&mas);
> -	if (!vma)
> -		goto inval;
> -
> -	vma = vma_start_read(mm, vma);
> -	if (IS_ERR_OR_NULL(vma)) {
> -		/* Check if the VMA got isolated after we found it */
> -		if (PTR_ERR(vma) == -EAGAIN) {
> -			count_vm_vma_lock_event(VMA_LOCK_MISS);
> -			/* The area was replaced with another one */
> -			goto retry;
> -		}
> -
> -		/* Failed to lock the VMA */
> -		goto inval;
> -	}
> -	/*
> -	 * At this point, we have a stable reference to a VMA: The VMA is
> -	 * locked and we know it hasn't already been isolated.
> -	 * From here on, we can access the VMA without worrying about which
> -	 * fields are accessible for RCU readers.
> -	 */
> -
> -	/* Check if the vma we locked is the right one. */
> -	if (unlikely(vma->vm_mm != mm ||
> -		     address < vma->vm_start || address >= vma->vm_end))
> -		goto inval_end_read;
> -
> -	rcu_read_unlock();
> -	return vma;
> -
> -inval_end_read:
> -	vma_end_read(vma);
> -inval:
> -	rcu_read_unlock();
> -	count_vm_vma_lock_event(VMA_LOCK_ABORT);
> -	return NULL;
> -}
> -#endif /* CONFIG_PER_VMA_LOCK */
> -
>  #ifndef __PAGETABLE_P4D_FOLDED
>  /*
>   * Allocate p4d page table.
> diff --git a/mm/mmap_lock.c b/mm/mmap_lock.c
> index e7dbaf96aa17..5f725cc67334 100644
> --- a/mm/mmap_lock.c
> +++ b/mm/mmap_lock.c
> @@ -42,3 +42,276 @@ void __mmap_lock_do_trace_released(struct mm_struct *mm, bool write)
>  }
>  EXPORT_SYMBOL(__mmap_lock_do_trace_released);
>  #endif /* CONFIG_TRACING */
> +
> +#ifdef CONFIG_MMU
> +#ifdef CONFIG_PER_VMA_LOCK
> +static inline bool __vma_enter_locked(struct vm_area_struct *vma, bool detaching)
> +{
> +	unsigned int tgt_refcnt = VMA_LOCK_OFFSET;
> +
> +	/* Additional refcnt if the vma is attached. */
> +	if (!detaching)
> +		tgt_refcnt++;
> +
> +	/*
> +	 * If vma is detached then only vma_mark_attached() can raise the
> +	 * vm_refcnt. mmap_write_lock prevents racing with vma_mark_attached().
> +	 */
> +	if (!refcount_add_not_zero(VMA_LOCK_OFFSET, &vma->vm_refcnt))
> +		return false;
> +
> +	rwsem_acquire(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
> +	rcuwait_wait_event(&vma->vm_mm->vma_writer_wait,
> +		   refcount_read(&vma->vm_refcnt) == tgt_refcnt,
> +		   TASK_UNINTERRUPTIBLE);
> +	lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
> +
> +	return true;
> +}
> +
> +static inline void __vma_exit_locked(struct vm_area_struct *vma, bool *detached)
> +{
> +	*detached = refcount_sub_and_test(VMA_LOCK_OFFSET, &vma->vm_refcnt);
> +	rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> +}
> +
> +void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq)
> +{
> +	bool locked;
> +
> +	/*
> +	 * __vma_enter_locked() returns false immediately if the vma is not
> +	 * attached, otherwise it waits until refcnt is indicating that vma
> +	 * is attached with no readers.
> +	 */
> +	locked = __vma_enter_locked(vma, false);
> +
> +	/*
> +	 * We should use WRITE_ONCE() here because we can have concurrent reads
> +	 * from the early lockless pessimistic check in vma_start_read().
> +	 * We don't really care about the correctness of that early check, but
> +	 * we should use WRITE_ONCE() for cleanliness and to keep KCSAN happy.
> +	 */
> +	WRITE_ONCE(vma->vm_lock_seq, mm_lock_seq);
> +
> +	if (locked) {
> +		bool detached;
> +
> +		__vma_exit_locked(vma, &detached);
> +		WARN_ON_ONCE(detached); /* vma should remain attached */
> +	}
> +}
> +EXPORT_SYMBOL_GPL(__vma_start_write);
> +
> +void vma_mark_detached(struct vm_area_struct *vma)
> +{
> +	vma_assert_write_locked(vma);
> +	vma_assert_attached(vma);
> +
> +	/*
> +	 * We are the only writer, so no need to use vma_refcount_put().
> +	 * The condition below is unlikely because the vma has been already
> +	 * write-locked and readers can increment vm_refcnt only temporarily
> +	 * before they check vm_lock_seq, realize the vma is locked and drop
> +	 * back the vm_refcnt. That is a narrow window for observing a raised
> +	 * vm_refcnt.
> +	 */
> +	if (unlikely(!refcount_dec_and_test(&vma->vm_refcnt))) {
> +		/* Wait until vma is detached with no readers. */
> +		if (__vma_enter_locked(vma, true)) {
> +			bool detached;
> +
> +			__vma_exit_locked(vma, &detached);
> +			WARN_ON_ONCE(!detached);
> +		}
> +	}
> +}
> +
> +/*
> + * Lookup and lock a VMA under RCU protection. Returned VMA is guaranteed to be
> + * stable and not isolated. If the VMA is not found or is being modified the
> + * function returns NULL.
> + */
> +struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
> +					  unsigned long address)
> +{
> +	MA_STATE(mas, &mm->mm_mt, address, address);
> +	struct vm_area_struct *vma;
> +
> +	rcu_read_lock();
> +retry:
> +	vma = mas_walk(&mas);
> +	if (!vma)
> +		goto inval;
> +
> +	vma = vma_start_read(mm, vma);
> +	if (IS_ERR_OR_NULL(vma)) {
> +		/* Check if the VMA got isolated after we found it */
> +		if (PTR_ERR(vma) == -EAGAIN) {
> +			count_vm_vma_lock_event(VMA_LOCK_MISS);
> +			/* The area was replaced with another one */
> +			goto retry;
> +		}
> +
> +		/* Failed to lock the VMA */
> +		goto inval;
> +	}
> +	/*
> +	 * At this point, we have a stable reference to a VMA: The VMA is
> +	 * locked and we know it hasn't already been isolated.
> +	 * From here on, we can access the VMA without worrying about which
> +	 * fields are accessible for RCU readers.
> +	 */
> +
> +	/* Check if the vma we locked is the right one. */
> +	if (unlikely(vma->vm_mm != mm ||
> +		     address < vma->vm_start || address >= vma->vm_end))
> +		goto inval_end_read;
> +
> +	rcu_read_unlock();
> +	return vma;
> +
> +inval_end_read:
> +	vma_end_read(vma);
> +inval:
> +	rcu_read_unlock();
> +	count_vm_vma_lock_event(VMA_LOCK_ABORT);
> +	return NULL;
> +}
> +#endif /* CONFIG_PER_VMA_LOCK */
> +
> +#ifdef CONFIG_LOCK_MM_AND_FIND_VMA
> +#include <linux/extable.h>
> +
> +static inline bool get_mmap_lock_carefully(struct mm_struct *mm, struct pt_regs *regs)
> +{
> +	if (likely(mmap_read_trylock(mm)))
> +		return true;
> +
> +	if (regs && !user_mode(regs)) {
> +		unsigned long ip = exception_ip(regs);
> +		if (!search_exception_tables(ip))
> +			return false;
> +	}
> +
> +	return !mmap_read_lock_killable(mm);
> +}
> +
> +static inline bool mmap_upgrade_trylock(struct mm_struct *mm)
> +{
> +	/*
> +	 * We don't have this operation yet.
> +	 *
> +	 * It should be easy enough to do: it's basically a
> +	 *    atomic_long_try_cmpxchg_acquire()
> +	 * from RWSEM_READER_BIAS -> RWSEM_WRITER_LOCKED, but
> +	 * it also needs the proper lockdep magic etc.
> +	 */
> +	return false;
> +}
> +
> +static inline bool upgrade_mmap_lock_carefully(struct mm_struct *mm, struct pt_regs *regs)
> +{
> +	mmap_read_unlock(mm);
> +	if (regs && !user_mode(regs)) {
> +		unsigned long ip = exception_ip(regs);
> +		if (!search_exception_tables(ip))
> +			return false;
> +	}
> +	return !mmap_write_lock_killable(mm);
> +}
> +
> +/*
> + * Helper for page fault handling.
> + *
> + * This is kind of equivalent to "mmap_read_lock()" followed
> + * by "find_extend_vma()", except it's a lot more careful about
> + * the locking (and will drop the lock on failure).
> + *
> + * For example, if we have a kernel bug that causes a page
> + * fault, we don't want to just use mmap_read_lock() to get
> + * the mm lock, because that would deadlock if the bug were
> + * to happen while we're holding the mm lock for writing.
> + *
> + * So this checks the exception tables on kernel faults in
> + * order to only do this all for instructions that are actually
> + * expected to fault.
> + *
> + * We can also actually take the mm lock for writing if we
> + * need to extend the vma, which helps the VM layer a lot.
> + */
> +struct vm_area_struct *lock_mm_and_find_vma(struct mm_struct *mm,
> +			unsigned long addr, struct pt_regs *regs)
> +{
> +	struct vm_area_struct *vma;
> +
> +	if (!get_mmap_lock_carefully(mm, regs))
> +		return NULL;
> +
> +	vma = find_vma(mm, addr);
> +	if (likely(vma && (vma->vm_start <= addr)))
> +		return vma;
> +
> +	/*
> +	 * Well, dang. We might still be successful, but only
> +	 * if we can extend a vma to do so.
> +	 */
> +	if (!vma || !(vma->vm_flags & VM_GROWSDOWN)) {
> +		mmap_read_unlock(mm);
> +		return NULL;
> +	}
> +
> +	/*
> +	 * We can try to upgrade the mmap lock atomically,
> +	 * in which case we can continue to use the vma
> +	 * we already looked up.
> +	 *
> +	 * Otherwise we'll have to drop the mmap lock and
> +	 * re-take it, and also look up the vma again,
> +	 * re-checking it.
> +	 */
> +	if (!mmap_upgrade_trylock(mm)) {
> +		if (!upgrade_mmap_lock_carefully(mm, regs))
> +			return NULL;
> +
> +		vma = find_vma(mm, addr);
> +		if (!vma)
> +			goto fail;
> +		if (vma->vm_start <= addr)
> +			goto success;
> +		if (!(vma->vm_flags & VM_GROWSDOWN))
> +			goto fail;
> +	}
> +
> +	if (expand_stack_locked(vma, addr))
> +		goto fail;
> +
> +success:
> +	mmap_write_downgrade(mm);
> +	return vma;
> +
> +fail:
> +	mmap_write_unlock(mm);
> +	return NULL;
> +}
> +#endif /* CONFIG_LOCK_MM_AND_FIND_VMA */
> +
> +#else /* CONFIG_MMU */
> +
> +/*
> + * At least xtensa ends up having protection faults even with no
> + * MMU.. No stack expansion, at least.
> + */
> +struct vm_area_struct *lock_mm_and_find_vma(struct mm_struct *mm,
> +			unsigned long addr, struct pt_regs *regs)
> +{
> +	struct vm_area_struct *vma;
> +
> +	mmap_read_lock(mm);
> +	vma = vma_lookup(mm, addr);
> +	if (!vma)
> +		mmap_read_unlock(mm);
> +	return vma;
> +}
> +
> +#endif /* CONFIG_MMU */
> diff --git a/mm/nommu.c b/mm/nommu.c
> index 617e7ba8022f..2b4d304c6445 100644
> --- a/mm/nommu.c
> +++ b/mm/nommu.c
> @@ -626,22 +626,6 @@ struct vm_area_struct *find_vma(struct mm_struct *mm, unsigned long addr)
>  }
>  EXPORT_SYMBOL(find_vma);
>  
> -/*
> - * At least xtensa ends up having protection faults even with no
> - * MMU.. No stack expansion, at least.
> - */
> -struct vm_area_struct *lock_mm_and_find_vma(struct mm_struct *mm,
> -			unsigned long addr, struct pt_regs *regs)
> -{
> -	struct vm_area_struct *vma;
> -
> -	mmap_read_lock(mm);
> -	vma = vma_lookup(mm, addr);
> -	if (!vma)
> -		mmap_read_unlock(mm);
> -	return vma;
> -}
> -
>  /*
>   * expand a stack to a given address
>   * - not supported under NOMMU conditions
> -- 
> 2.49.0
> 
