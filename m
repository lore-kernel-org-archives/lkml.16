Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DECD442C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745933211; cv=fail; b=Bb2avg/Idlh0WXQdB7gC6nrRMYcwFR5kUMhH4L457rugC4zJ0Lh77r6/K9KD7onehtjNFFWpkw+ERbE1OGMZPbTRC5Ew9OpcnNYCiH6xoCSB7wytDsFEN5V0au74aqIc5l+u5m0bUj/XAQug9Le/cClO88xEzN/RBCEFxZaV1sI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745933211; c=relaxed/simple;
	bh=pGqg+fGix95ypcYT7ZdY9o20JpUFhygQW4tRr/TBJVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r8Z5/Z/Q/kPadKZo/Uslr4KH7AiRFjF/25bEAmUbtQ1OgHaUpzgdibs6YKjLNwKZwtcNtRQwMuoR2inKbIpadPXwHjDdGwfGjKnym+84K7oPC/4mpk3GkRlbMw6yMPIC8MOb73MOgiReLYcEPqmSYuCmYwLPdonrbCd7jk8IkYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PxHOw5fc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qhsv57jo; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PxHOw5fc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qhsv57jo"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TD2DmK008950;
	Tue, 29 Apr 2025 13:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=t/nIUKdN+9cQ1TBpDt
	THMuck/Gy7s+UF8ZkWmR5rvOI=; b=PxHOw5fcokTxaots4kkZdda2hvjQixPy7s
	i5AvfOQdY7H8qqo3cJ/E3tONOLKK3qh5bwm8lAAj90+svaOGazAujLuj9YSSmpsr
	gMyJX2W5CZL+qGB0eQXaNYmD3VuIzfssMCwjLbLxG08rigzv2VK99AZOh96pHElP
	gGaPwv0ocSk7dPxsBHPqHmwC3nXMfBvIU+GPvxehLkTvwEzn7J68X8qu7X5HJGrb
	onAEnRkEqljZ7GycMg4YF8edERwSRn/pKV43N6QJZk6sTyb+3vAps1frdsc1QAjE
	LKrw3sTdG2gBVAkuXPGsi58YR7ZXY74043FgJeo+kYsKduYdrIzw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46aya1g1mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 13:20:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53TCG4xp033502;
	Tue, 29 Apr 2025 13:20:06 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazlp17010002.outbound.protection.outlook.com [40.93.20.2])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 468nx9ugsh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 13:20:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UlOTgvHQGbM+tRyAjNmaxkk/tfaWW5var6yUaTNzjrKc/pKEx6GnTz2ESyyPw3x6elnItCjpuI3Z8K+vZRBEO1kBGA7Ft09z6qjHb9SA2EJi4p0yzv+Mr8HBs2ojvwILmgfn64R93/fh2sy/XkTPdZVrpOzgJKolUCgzSKWRCeuZ/ISGm7L60SiuHrPTtbbEP529wpDKSMT885PaINkqauTkw05akaHoWmq5EqIlijMFM3A4REQYrh9NUTNGmaS/RSsIgACsJ+4Dy7VmXcyzOT/wgpyme8OrVkOvgYuAlB93OTP0wwvBgZ+OhdYECA6HPCULkNzkOgDEpK0JfJd8IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/nIUKdN+9cQ1TBpDtTHMuck/Gy7s+UF8ZkWmR5rvOI=;
 b=b8A6cXrLSgQYw8cEPSSbqIY+ssVKEAiWCP9JanbPdLAi0gFUOzK1lHKXUt69qyOBrFPc1C0m14QMrCeT1O0mLb4Sa6jNrzZ6bFut1wvcsd/GNwg6HtnOra13H/AM4jIDhdxGdLTPOpnhI2DiS2ChcwPvRvEPAZA8Jr3DLkZMn6kjjit8wV80sgfRXMbgh3MHNZ79FQLkxkQIcrYvsVymhZl6rHLrCo+Q9ZXALHI9TqT0KUVUGGvTN6JoFCIO5Ml7ue57k/BY+9sw3k/peqkl9/w4xSZQ2mQO48Kkl+T4koIJYUFfSYJOv2X1b2MxXCpMa+VpaCyL8MEGqKA4ozIg0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/nIUKdN+9cQ1TBpDtTHMuck/Gy7s+UF8ZkWmR5rvOI=;
 b=qhsv57joAp/tRvjl14Y33PNXw3JtSdbw0sZ7W7A4fQnO55SBD94BLo/gYZw5hFzdAwU0GisIe4cafDS0LCGXCYd9ReP0mUQ9YUDoSG7eYo8kTjtb3JwANn7RoDteU7SYod7ad8NXnF83EUS+JQNz+lA3GUs1BmRrwIG9qIbkRrQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB7756.namprd10.prod.outlook.com (2603:10b6:806:3a3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 13:19:49 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 13:19:49 +0000
Date: Tue, 29 Apr 2025 14:19:47 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
        willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
        peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
        baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
        christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
        linux-arm-kernel@lists.infradead.org, namit@vmware.com,
        hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v2 2/7] mm: Optimize mprotect() by batch-skipping PTEs
Message-ID: <f4a90024-3cc7-4536-84b0-665021d96125@lucifer.local>
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-3-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429052336.18912-3-dev.jain@arm.com>
X-ClientProxiedBy: LO4P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB7756:EE_
X-MS-Office365-Filtering-Correlation-Id: 6947d026-2e7e-4f1f-1493-08dd872084e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fUvqCF38ieGOH/V6aSSpG4eQwso1V5JUx2jXM2zf+2iPI0H494KI1a0uDryX?=
 =?us-ascii?Q?z1US7idaWOmPsE+uPONhmc3GsE9amdxrAha5XpjIuDdZ9N0HfxW4PLaCr/8O?=
 =?us-ascii?Q?+PjtAKyi+qFQhkyqT3tVvAuugYC6nSW5TbD0IiVQyNGCGDYdfsWv7xjcqjyS?=
 =?us-ascii?Q?baYn2/V+tYkOCy3BcTYHOxmirNiib3O1vAvqMuE3ARLiFd1Q/fnCGh062OKa?=
 =?us-ascii?Q?AhfdLcgLp7u04nxxEq3WHGiLWMAR+QYRcHbaQiPTzcEkjuedG3L8GuO/Kdgl?=
 =?us-ascii?Q?dPCx4uGbQ5v0+hP2wDv5mcMTk97bOgxrlcHdNqNptHHgQuLbCIdM2T+SCbUg?=
 =?us-ascii?Q?uwJV0rdA9h9wdwXkDEQEGGHMoWkM6pPa7AIbhyKxSqSsrSL3GIRW8j7yRMeN?=
 =?us-ascii?Q?zWAkI0jur8KYGXHO+rDcu9eko9VpcA3YcZGObpwLxfQat9O7Rxg/Eha5vL9a?=
 =?us-ascii?Q?9hLtuYDNMtoPG5ReDbHnciWUGxI6PKlA0sQ8rzxiOQNLYt878d8nb1QqR1a4?=
 =?us-ascii?Q?8ceHF6Bq7dHOuvrIT4kjiMTVxaBcCoYV50tBqKZ3taDmyF/vi279sdPUmTBR?=
 =?us-ascii?Q?ewxTMgKm/u1ZQTP6Dxkh08ijHIabsC5RHc7IumBCu7Ew1lqU5b5XxwErGr8F?=
 =?us-ascii?Q?ignkAbvP1H1/o1/ZurSoJ3ZL1DM6RYrB1YWf9Qcpo6Wve31uyErX5HQSpJQa?=
 =?us-ascii?Q?e+/hjBnuGSVXmxoOiJg8nPKSkoRo0vwN83Nm331mxzpJW6Dsnws3LltslgkJ?=
 =?us-ascii?Q?66BlXlOlN0+yTO7xdVqTDoGA/htKKSbeACQm8iQ7CpwsUEFvsufJvSXxizfz?=
 =?us-ascii?Q?QRDJH8BooIxKUXkJEyv4cObLxALgc8RjwlsuPnVJ5nBMzTOQxayHjQExle9R?=
 =?us-ascii?Q?RewfHmbXHtWNG/8BlqyUHXJbuAG7K2CUXpYo5ocF8p6frPLhapDyKGtDXoIb?=
 =?us-ascii?Q?VRYvD/ybldUf/HqTEzlkHmUbyR2kQvTXMxxdSmY/Cq5lVNa5ij22JiAwNlq5?=
 =?us-ascii?Q?dX1SuavQBScVfZpx4Auzrfgb71CfTVYq2Ry5TRXZThkaf5oUX0WlZDwGMKTd?=
 =?us-ascii?Q?HBBXBriLfzQIPtP18+4w6H4xZjdVRYuCo4s9OPR8ltKYuxP0Hyb6gaFpMUV6?=
 =?us-ascii?Q?L8cag8I40lvZZ5YXmtSEbtXxZNRFGPtS+GwgryVkv59vX4xl8Qi/ES7zZJdC?=
 =?us-ascii?Q?RsXVAhY+Qj4fjli6LlEKOo1j2etLKosU81HQ2YfgCerZDxy0Jllxbcdt8vXp?=
 =?us-ascii?Q?5WhnsKjpQNkxa5ZyDE5ha9x5BTNUfl+rVeNJW5mC0PGsUMi0zd0H2QRIxJyE?=
 =?us-ascii?Q?NjvhVIJNketAibR78BZgfcp/1rC/i5NBGpq5LfgRyoHEeO/235X0Y3hnT01G?=
 =?us-ascii?Q?7mpR+dpEgfs0eQcRLcFunOfIUzRgqWmE2ZoZCwKOiGN0vv0k9A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Yr6NSJd0tsNwAGlk5b+n0fDJVIt+qL6Vnn1Rxntv+XDcLAwWyj/M4L5xINq1?=
 =?us-ascii?Q?IiOaTP/W7SMYv2aORwRIriSMJkScn6AYrPSu0rE1RCOWJQ1TXhTqKC5GZgBW?=
 =?us-ascii?Q?AITlrHJyy9uL6lxEj+wsmaLtm4N9wegYf2oKu5dCRAMu/tKjV/s2/OepA3aQ?=
 =?us-ascii?Q?z8dPEHh3hCQW/5kbgeFUlrUA/vDkMX/jz6gBlISTKMyc/E8KDxdIDtbLK2lq?=
 =?us-ascii?Q?lmPm1copvlH819hBDa3uFtX8JAPH1UsCH8UGbOl+LoXolvSFNr4mezjqx23U?=
 =?us-ascii?Q?D1ssB7n3cbl8cx7tyGUqcRqKIe32nO55GAhpvpIRhGhXuFr5MwEBRtDR7M/R?=
 =?us-ascii?Q?PthnuksJKtUF46Ft9EMHE1eS+Tnz6Au0Sqdif4M39fcFq5ct3pz07T2fa+I9?=
 =?us-ascii?Q?hpT4DdjXmVzumbLbITWzC+L8ZBBwS1nEHSo57yQ1sLALQfRFPgUcTQq3Nl4L?=
 =?us-ascii?Q?yKo3433hHduIUVoR0FnOtWxXQno2LSpPj9qsSmtwqL4gMYUXX17hK0WEsUcW?=
 =?us-ascii?Q?Y7njMMlGa4jEiHPXf7Sl6AjrYyJTzK6IpLczudAJnBeyhZjBYpMuzaa+pKCS?=
 =?us-ascii?Q?z9DzYbh5hSkMtiHK/FAwZKaeV6tmqjtFhXIa+eq443bAtoBenrZyc/GfnGFL?=
 =?us-ascii?Q?5+E+Olfi48Wz6N47SR6Cw/k/SHSoB4zyWrUNjHBI9nET1Hwtu6oR9ic12vTq?=
 =?us-ascii?Q?kWszveYu4gqLPchEq4cBnDpu2w/EqNeT65H/GyTOxFF6qlItijgycC806l8i?=
 =?us-ascii?Q?XPsKOc6AzYmx58mY1dxMyhMdMut0hbT+uyiGWtucoWRVdaeO7KotlMaVGfJb?=
 =?us-ascii?Q?YxqWLAedMlaD7utNV1yAsVbMvhpgiKDkr8JnR8GKTZcazclay4fLaUWaXlWg?=
 =?us-ascii?Q?Y/aLrEgDHODvW7a+oUspHDqVUmmrCg9TL6f1Rw8f+KGQuTWeKxz4/tlgmgTb?=
 =?us-ascii?Q?/n6p5GnzzOSzyh8IAiSpRdptqwxPMqwlW9s6ipWe/Z2dWuUifb2jvLu50DeG?=
 =?us-ascii?Q?gSt39pUFdPXFo7QraDxdi77PsOIeWnXlzml74gG2rJjVDTeRtZqDu/VoBgUN?=
 =?us-ascii?Q?IOMO5dA4mD6i8VTW2DYXBrSVco7Arrqp8SdLu4tWtL19bo25wux58RkQU9Qb?=
 =?us-ascii?Q?1EYWJIAB6iNLWoHL45iSMIoaIVMrlu8UuOIKQgk1AYvNUYLmXOUVH/WzReQc?=
 =?us-ascii?Q?zoZcDVYKgfJ4696pbWSlMsywc7tOTeiEGCZaERVKzx6oMWHISq6a36mNsN9i?=
 =?us-ascii?Q?FP3lnxYaOkJyRumkutz9T/muNQLf8c35Mbx68oxbmbH09xpdndl9X7ftENm2?=
 =?us-ascii?Q?Kq7N9Ak/E2C2Bu1RlX183fls/eiv6qHvxigVROgQ8jqga6UKmaAgX0SXxtfv?=
 =?us-ascii?Q?tplxFOpyoFRI9piNGtOLGWui8oQkwg40lFfjDPr5UzUuUNiN+CylPWGPZ3ya?=
 =?us-ascii?Q?zgDiNPw3O8gwv96+PUgt2few8gXy0urEZUVxopN39y5ty9JMSVYqeNtXAbe5?=
 =?us-ascii?Q?Nf1a5uNuwQu8881WGwBH053fir3GEaiVGiM+TnfRCO3Jh9zhHHOM/bCcA8GA?=
 =?us-ascii?Q?o7A7zOEhEnIRchLxoUYVWO/s0vrblA0MROL/xbFzzliod7xCEEsOo9jPNiG4?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HlZbviax/h9DaSgpf5eOA7fKKSsR1l+eeZjZaOB+VDuQAjV2eawZyNzhRaVtf7jIFEFr8PgKgP6TvBptgEwwAGx2ERD6Ee9Yhz9NNPO8jnx7Sn21bGdOlTdUu5O9jGt/4egoQ5rVfbZE2TS2oT2brrwoqfNYhArlrPrLxae3aacKmva97jNen3OUgTa22O8ZwizI+w2osNB1yvIdmM79OuNM6rNLV1kXP37I7gdmh6LkknKCHCKtuafiW1yq5j3XmIKj8zOmqQSX9KPRh6pqRHMxpwmPqxi1augPXWzZPF8X2RWNp35os3S9ME8lIi1psbfsdYh0ygnHQJGwFbhJLLq+j8Kk1a6TFWK6Ay7J3TizXbN39rEwVqL/3mgFzUfeaqitHCuFZ7JIF3t8iuUd6+LlEH8jIVw75nlbdWjZC8AWdcRZOE0NHNzwu2QThGe2GdQ/eY1SoVBz6RUmGKpwmr13cCAS86d1+1sKqwAsajGXDenbB9JwEUDQ8m5ABnDGNbcTnChGUbdu29EW7uO9v8ojvcxF3/gD8eqJiDI1hZ3fv5WEA7JAeSAB13ZSbHZpzRbSaXE5rCsV9iHROxuaLCvNxuaVL9ZDjaS2v4YQ4FI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6947d026-2e7e-4f1f-1493-08dd872084e5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 13:19:49.6040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vgfHstBMp9ApSUSGxY4JET0HR3TnIiMlIO+0vMehSnL9txug24HPC9lMfE5L6vPsH03V3x7Q7+OZofwiVm7hviFFY0UA7Xk83ZQ91tjSnvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7756
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504290099
X-Proofpoint-GUID: iutjPHL1CAmrWuiXxwWZl4KbiDetK_Vf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5OCBTYWx0ZWRfX0LEyu68xul2q oHeSqoBSCDNA05GwLT7LiJDRIon7O9OWYOX5SjIw1YZzZHjFFvu5NZg3UFImk59D1i4txcRxtlh 3xIXhrAEVwvxfLIxg1nofcINSVqxIo7cf17GBg2s2fXAe7hYujfin4XP0nqELnxTzdBsQgp0wuE
 xJsQBtrup3ajJ++1kBnYpWTImqeGp5BGYaj+kgyCL69bXMfPopZBhLE8rgHPyyMJCqpnRZ3U5wa GsLZMGA8ylfVJDD99qS+JnD0CdL0NPGo95Gg2RnsTrNcuvIjKCgacau1GG5vc61VJlQhTaGctG+ WqMaxH3a0RNDOskVO+NQz0TBsQyBZu0UaTlTWrjZsQlp4xouEpvA3EE6Y5NMqoPmiB7X8piFqbl UA0/uCUT
X-Proofpoint-ORIG-GUID: iutjPHL1CAmrWuiXxwWZl4KbiDetK_Vf
X-Authority-Analysis: v=2.4 cv=ZYodNtVA c=1 sm=1 tr=0 ts=6810d206 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=7nvsWNAdb-K4Q0DI9IIA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22

Very very very nitty on subject (sorry I realise this is annoying :P) -
generally don't need to capitalise 'Optimize' here :>)

Generally I like the idea here. But some issues on impl.

On Tue, Apr 29, 2025 at 10:53:31AM +0530, Dev Jain wrote:
> In case of prot_numa, there are various cases in which we can skip to the
> next iteration. Since the skip condition is based on the folio and not
> the PTEs, we can skip a PTE batch.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  mm/mprotect.c | 27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)
>
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 70f59aa8c2a8..ec5d17af7650 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -91,6 +91,9 @@ static bool prot_numa_skip(struct vm_area_struct *vma, struct folio *folio,
>  	bool toptier;
>  	int nid;
>
> +	if (folio_is_zone_device(folio) || folio_test_ksm(folio))
> +		return true;
> +

Hm why not just put this here from the start? I think you should put this back
in the prior commit.

>  	/* Also skip shared copy-on-write pages */
>  	if (is_cow_mapping(vma->vm_flags) &&
>  	    (folio_maybe_dma_pinned(folio) ||
> @@ -126,8 +129,10 @@ static bool prot_numa_skip(struct vm_area_struct *vma, struct folio *folio,
>  }
>
>  static bool prot_numa_avoid_fault(struct vm_area_struct *vma,
> -		unsigned long addr, pte_t oldpte, int target_node)
> +		unsigned long addr, pte_t *pte, pte_t oldpte, int target_node,
> +		int max_nr, int *nr)

Hate this ptr to nr.

Why not just return nr, if it's 0 then skip? Simple!

>  {
> +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>  	struct folio *folio;
>  	int ret;
>
> @@ -136,12 +141,16 @@ static bool prot_numa_avoid_fault(struct vm_area_struct *vma,
>  		return true;
>
>  	folio = vm_normal_folio(vma, addr, oldpte);
> -	if (!folio || folio_is_zone_device(folio) ||
> -	    folio_test_ksm(folio))
> +	if (!folio)
>  		return true;
> +

Very nitty, but stray extra line unless intended...

Not sure why we can't just put this !folio check in prot_numa_skip()?

>  	ret = prot_numa_skip(vma, folio, target_node);
> -	if (ret)
> +	if (ret) {
> +		if (folio_test_large(folio) && max_nr != 1)
> +			*nr = folio_pte_batch(folio, addr, pte, oldpte,
> +					      max_nr, flags, NULL, NULL, NULL);

So max_nr can <= 0 too? Shouldn't this be max_nr > 1?

>  		return ret;

Again x = fn_return_bool(); if (x) { return x; } is a bit silly, just do if
(fn_return_bool()) { return true; }.

If we return the number of pages, then this can become really simple, like:

I feel like maybe we should abstract the folio large handling here, though it'd
be a tiny function so hm.

Anyway assuming we leave it in place, and return number of pages processed, this
can become:

if (prot_numa_skip(vma, folio, target_node)) {
	if (folio_test_large(folio) && max_nr > 1)
		return folio_pte_batch(folio, addr, pte, oldpte, max_nr, flags,
				NULL, NULL, NULL);
	return 1;
}

Which is neater I think!


> +	}
>  	if (folio_use_access_time(folio))
>  		folio_xchg_access_time(folio,
>  			jiffies_to_msecs(jiffies));
> @@ -159,6 +168,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
>  	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
>  	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
> +	int nr;
>
>  	tlb_change_page_size(tlb, PAGE_SIZE);
>  	pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
> @@ -173,8 +183,10 @@ static long change_pte_range(struct mmu_gather *tlb,
>  	flush_tlb_batched_pending(vma->vm_mm);
>  	arch_enter_lazy_mmu_mode();
>  	do {
> +		nr = 1;
>  		oldpte = ptep_get(pte);
>  		if (pte_present(oldpte)) {
> +			int max_nr = (end - addr) >> PAGE_SHIFT;

Not a fan of open-coding this. Since we already provide addr, why not just
provide end as well and have prot_numa_avoid_fault() calculate it?

>  			pte_t ptent;
>
>  			/*
> @@ -182,8 +194,9 @@ static long change_pte_range(struct mmu_gather *tlb,
>  			 * pages. See similar comment in change_huge_pmd.
>  			 */
>  			if (prot_numa &&
> -			    prot_numa_avoid_fault(vma, addr,
> -						  oldpte, target_node))
> +			    prot_numa_avoid_fault(vma, addr, pte,
> +						  oldpte, target_node,
> +							  max_nr, &nr))
>  					continue;
>
>  			oldpte = ptep_modify_prot_start(vma, addr, pte);
> @@ -300,7 +313,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  				pages++;
>  			}
>  		}
> -	} while (pte++, addr += PAGE_SIZE, addr != end);
> +	} while (pte += nr, addr += nr * PAGE_SIZE, addr != end);

This is icky, having 'nr' here like this.

But alternatives might be _even more_ icky (that is advancing both on
prot_numa_avoid_fault() so probably we need to keep it like this.

Maybe more a moan at the C programming language tbh haha!


>  	arch_leave_lazy_mmu_mode();
>  	pte_unmap_unlock(pte - 1, ptl);
>
> --
> 2.30.2
>
