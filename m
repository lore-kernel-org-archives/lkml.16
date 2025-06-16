Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41D61C5F14
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750051403; cv=fail; b=JJvfwz0exBUMouV5hUviIpJBG63RgGhZzKzuSwWB62T6wfjEU/aERLHpHLMCJEUJBZ+eW7vbXa9J943gsq10lsoBZRGXyGsAB0WS2ic1qb1VBxBzlerTHjeCltfsTN87RnFDTvSd2hJHxWWWZDlX89mvovynwLi+AhukR3d7Fic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750051403; c=relaxed/simple;
	bh=jZqpjWTXucMbuehADeJWoIUu0agOBD6xC6tkW6p64yA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sEGMjgFt5yk6D1yhYS/gjdfnPYtLIOGOfWuGFRQx9o+OaZ32PbEl4Th1BBaqIqg917RpWyycD/HMuoSJdOdnDvTwg+UT/ztgXKSkEWV3/AkfttNwF/7izlGO1pEYngoi0QQhox7JkUgXDdxcQ07gUUs7AFU+UPkqRIAKZ2P7dow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HRy7RqVd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=T+liLB3j; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HRy7RqVd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="T+liLB3j"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FNKtba009840;
	Mon, 16 Jun 2025 05:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=liFSurFzbf6KkfM+zT3JPUTcKm9ufYeytyUW8dW9EW0=; b=
	HRy7RqVd+YivGmdelUXO+s+lUOmDF8Hb109SSymnHEDxjTxDxFzDpTF+w0AUxxkF
	7/6VAEafnh/3BLas/Hgz1wkvMrbDj7oMR+NDJG9peK890URlys+LrTL3jax1JqAv
	LDo3h4GM4UBfPCb0O9ucLIqKtcIlRuwafqNaQ98Q1bG7THHQMSZ7TjD3kYS1ns7Q
	QddfLbsruXDGSPrJyw7RE8uF7Y5jwfNyNiIG9uSPoTCQYjdOCU7jZJZm7kMM3842
	uR0PgAqpg+3Hz7SehAEIyebRxcvEkDg/DA+tMPHMqrwdUlhfTmyHB3RcCfw4iOBd
	0SU4goRw4OSSH9FVhrfvNQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790yd1p5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:22:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55G3A3eT034385;
	Mon, 16 Jun 2025 05:22:38 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010007.outbound.protection.outlook.com [52.101.61.7])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh777be-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:22:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=il2A6NoPzwXWOAmndLN1aDFPHHbenQjIaCI/mXMbz9MvGapHPg8meY0lBCTF+W7BGGHQs+ZJqw065PMvW47rimL8HBeCKCbxU6LHy868uS7ELoS9a3WxXrSMkrbB0abpLRhOe7xuCUcnv1f+k1qtdM8J63aZ3IdlzKwlJMw9fO0Rg/BW287dpobray26CeCRE3LnS0ahcdMj1cruzsAFxnHSp2XkggnaPg66AIJMFeIFq+33PO1fV5K+Z+rCUSJ0RLnGVSCJdEk5H5XHWi6cbL+unmT0knk661ISB0JC9WT00ZHzHLFdbF+LznvhdQt5mYZY6hgeDcvuS5dvR017xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=liFSurFzbf6KkfM+zT3JPUTcKm9ufYeytyUW8dW9EW0=;
 b=CbJIcIEviJ/YODG2k57lA7L7n324hCAkdAwE5ZDIJXez09AsVn/F/MKiHr+5D+q7aN/NgcFlape4XyvEEPsoD+qnu/IEDbSQVWM9kURPr0sSsgodWq+IxFyCLclLGhdeqCHOHeBN6KIxT+hLhM71FCOTKjdZnY2yOsZ2MnN/dCzXbs+KczmpmCRK4qC4ebJ9FD1Yfx6JdFIXYO8r9dRAsxduH0R6a4Vjgk0PBLGSGu+eRPdlBnnxk27dQlHN/giV73bRGdDrLe9lTS9ZYiN5dCCfRYMFpodI9fzEYrBxr/RfbA0GXe7EIl+T9aTm1qTVyH+nYaRitEJUlgEHzalSyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liFSurFzbf6KkfM+zT3JPUTcKm9ufYeytyUW8dW9EW0=;
 b=T+liLB3jE7Rjlpoa23cHDoB84EVHblw5GdcqFnIPiQ/o54st2qOWvsQV2Io778SRf3GlWFiGlIJtxeO1oZBfSBSXOtZXLFTxVC7gmwyEbXpGWUc+Stw7uX4QG2Jh7DzJdBhAmJXe+N6/PrOt+IeBCVDLCDkXBCQd/aFgRfeKLEw=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by SA1PR10MB6389.namprd10.prod.outlook.com (2603:10b6:806:255::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 05:22:35 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%6]) with mapi id 15.20.8678.028; Mon, 16 Jun 2025
 05:22:35 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Cc: akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, mingo@redhat.com, mjguzik@gmail.com, luto@kernel.org,
        peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
        tglx@linutronix.de, willy@infradead.org, jon.grimm@amd.com,
        bharata@amd.com, raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com, ankur.a.arora@oracle.com
Subject: [PATCH v4 05/13] perf bench mem: Switch from zalloc() to mmap()
Date: Sun, 15 Jun 2025 22:22:15 -0700
Message-Id: <20250616052223.723982-6-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250616052223.723982-1-ankur.a.arora@oracle.com>
References: <20250616052223.723982-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P223CA0017.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::22) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|SA1PR10MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: ba2c58d4-d845-45c7-cc24-08ddac95cd3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rLTUQVmJ4Drg3TL9v5iVtwAFti1HFOdKgLIf/YbYcRtBD7DEM20Z/ZKgQbUj?=
 =?us-ascii?Q?L+olcIGmYT6ciOJ/TYBxfpEXoylHfwJGL4rHbP7B9ROZ6Qll+mqgbciWp50d?=
 =?us-ascii?Q?Sf70wkZPV8zdSNPdxWMgRA1XuBg/WnrVyomFZKx3cFFxuNq9sYdv+F4clvSI?=
 =?us-ascii?Q?BevKLztq7WjSs46RN/Qf92OoAPw/9wDguC1wdsUbsCL2CMIG67R1pLNLzyWJ?=
 =?us-ascii?Q?M5VBjS7MjMD1jg2W73mLGe6fx1GB8NStLjBZv+WM1mi59rZihdksp/jyojzP?=
 =?us-ascii?Q?zjF5D8crRg6FxFcPdLX/x/x68bhjFXxKlCrCXhuktE2eG5pZFRf1VpjkuQHn?=
 =?us-ascii?Q?I/z5VQc1RMGHJCZigHFVOMU0dNrC7A7130vZlsisI72YX7bHCDMVeRNCgoSa?=
 =?us-ascii?Q?bwW8Gw1ruLHkyPEWhR5Cz8XoJHdy3J2NB1lHgMxOPNyB4t53+TXeiPAi4RG5?=
 =?us-ascii?Q?oVmTK+CLUYjoedD8UtpxkrbHw7BPoqzbnKEjfuHWgccJIO+pIGMhJVIEn2py?=
 =?us-ascii?Q?AgsyM1wdMdpsJPVpOUxm6rA5paHDwXM2DkYLrkdrT+aohYxfG6MeUXNrF+zb?=
 =?us-ascii?Q?YqTmLMl7vmrC4uqlMcooiy6Ade/Vh34zLfolL1ry6OuOPm6XAtTM7rfG/jgj?=
 =?us-ascii?Q?Gbu46QOOB3OpgtjT12cJjq4ozV+ZG8JlbKocEJZOe9w9j7hEYsV9EhMAgDlF?=
 =?us-ascii?Q?AdfWCVRu+VKSKv3dkZTWzjslEvDYylshUeRsg7/O7DICuHN30F1FtuA5dPSo?=
 =?us-ascii?Q?OttZ0rs+N5uXQqCPEbAhcb/dVodLeI6xzzxM8rnmTsQi8yPxigZZQ42Kh73W?=
 =?us-ascii?Q?3PpvftR7SroxAbSmqFmr97FF5a+KT1NJdEqTE7CZ9DIZBzvD35JDI3NAIVm9?=
 =?us-ascii?Q?E3WguwL2RUd08P828eg2H5zqapnlaxqw7TK+7DrWYtnTE1W6whxUJAds7yi5?=
 =?us-ascii?Q?9M2uhddBjK3/OmUVvMhtwzW2shRA8mrXPJg0SdmlaahtprG49KW1/KgNxthL?=
 =?us-ascii?Q?nHBCU/aL0V/NaIWJ8uyZe26UhHp2q9qNqpGSbP8xmaaBF3M3iWmo7xp5JykM?=
 =?us-ascii?Q?geQMRKfmJ00QWUsVZRfx1gdJKqnV397hvVYAWijeDAS2uu/sqgTeJJcmoe9A?=
 =?us-ascii?Q?7jLILqSeh2jQlbwNr5hjzedONxHamR3serU51Z5tNNY0N7lRO57CpoDSUtwY?=
 =?us-ascii?Q?16rF/UupNw0YsL84DmbpEbIClkGZe3xLo68m3Wu0yOPfVOxM/3kv5MgFCW22?=
 =?us-ascii?Q?WtTs64KronkJv5MBRXoNCjkRWkWTBpa72q8KPcQnQkJbt0bjOUPkViYwDYvs?=
 =?us-ascii?Q?HkmUXW5mv7IL/ySywVVMfjsz5y1fRKz2ezKyEioQ/dgHSSZCK4H6a3ncEq8y?=
 =?us-ascii?Q?1RebD+HVeyTqgMMrDm5kfH1EM8BmkYLsq0uNf8rmwHUERlFUJgiuoKWbwtgL?=
 =?us-ascii?Q?7KilkWCsekQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t+sTw0L0QZmHHsIzejNzYOIxFgpdb4i5Z9yMIDeqEEKOgNmNjYl29CoUBx5v?=
 =?us-ascii?Q?e2UGgm+n52FQ9IGM2TC/pSkyuKQYLdcj+4tJkaudXQzIqVvRAGWngvAIFcPF?=
 =?us-ascii?Q?wOLA5UzTFlAKHknDk8kgBayfykQadqkFSXuGIwWMPlD8LjkYBwlW0DhVmgz8?=
 =?us-ascii?Q?GrtJeqNiES6UcgTwjTDPPcKUnofHP/hexbjayz7/9k3VdG/iMkX/9gv63aBK?=
 =?us-ascii?Q?Icutkch/WzrpCF6AR95TzMYV309VkiH03m7R9M0G7TmF4teyqa09lmI9UQmQ?=
 =?us-ascii?Q?UxWsa9JVapafCXczabaIr6709qCvORjSoBXbAGZ8zyUiXu84gnM2B+fVP3QW?=
 =?us-ascii?Q?1M4J/Euy4VEO2opjnwSk38YfZGtzVtBbJ/md13H9cLt7d/SRZCyT01zkp/Ij?=
 =?us-ascii?Q?nXhZa4TVAiU+WeWnUhbal4Cq8OC7KJoDStVVgKxw2R8SwcUPpVzkjR/7u3iF?=
 =?us-ascii?Q?/JpPgzwQG7l5OJwlS8ZZVBy4s3xRe0yPrvdU8S1ucaqaPMdBsGkCFEZqCYtF?=
 =?us-ascii?Q?b1DZc63EB5t5mTlSRS/06DWRc9vySrYFZWnZBAuOvN/OD32Pq2q7f9dBdUk9?=
 =?us-ascii?Q?GIcDiSEjmMU2JIElACV4n659kLnbWLox22evbeVfFEFYaK3W8q0Frz7H6dQ/?=
 =?us-ascii?Q?SwbsMd+gRHOs6n1PBeYy9mhYfW2pfoPjvl2HOg/P09CC+4x2hxcEFdmQ1+iu?=
 =?us-ascii?Q?g2wDDfnJSQ0B3uQMA+b95NUAz6d0dljevczNYjVjXEGHlyIauJRh8n3N2qZM?=
 =?us-ascii?Q?73uxMNP9fsTz5CZ/ij01i0gIS0ttfuWLDfuYSvEGqlWCCmcKOWiOiNgKPzYr?=
 =?us-ascii?Q?XZD6JnWs3J0xuBk8RmD8DNO1HTGKLm9Woud6R/F8KBXUYywSaw8Kv721x+Yn?=
 =?us-ascii?Q?YZKhd1DE6SDArD2hm8HFTXIzqtDHNj8+tD3XC3bJFkFrggfDEudWu9Jf9WgG?=
 =?us-ascii?Q?mpc64QtbSm8ow/S6BzNr9eURA6w5MDa/mszrGAKMk8Y3mtQ5rz7HkCvwmnwJ?=
 =?us-ascii?Q?3iNsbwF8PNoGzwBZ1eXbQygYJxwVmtb2/6YlMapmcY/RWOh0+Y/0yxh60UnZ?=
 =?us-ascii?Q?uvlrvUAQN3ggdvW7JNT7IDPzTsfeXVI/l78EvjlQR3ru7f/g5AXwOnLrfEYI?=
 =?us-ascii?Q?vW6aPyzuXa2p+OUA49eFIhdpF17ra4pSgqVqhiBMwugJi+5IfgIfJ7fNCUhv?=
 =?us-ascii?Q?L5n+Njs9uF9zKbVcMiaIRHYfnak86YU5+r17R3OC0QR93yII+UK2ehRY9hGf?=
 =?us-ascii?Q?mNvuJuZF9bMMt9XLicgo0y5l7weH1F2HbOJMGlUAt50SiwgyBWIPte4uUfDl?=
 =?us-ascii?Q?TtVMEHa1oFjEHCZHt2KctPtYBuUllrloGmRu9F/psrHMXmZL7pkApFHRmdec?=
 =?us-ascii?Q?0eiFgoM2ijFepIEBK7yQy6yMpMqbHpV1TpWB5JOiXVCZ2CKWyunhgO/vWLf/?=
 =?us-ascii?Q?j+6XuAdOTylJmMpp2EzG8jd9RRxMbA5uTCXY3cgWtgDXZ9tVEFx8SOMTkO4W?=
 =?us-ascii?Q?GlRy9KuztOx1K7MCeRSyZLJ7IU4lkgGAsFzDJLMQD77p+/VpVmREW7MaUXCp?=
 =?us-ascii?Q?//a8L3MeY2pIxzZTMRdIqZrX7+k3pjF4dRU+Aq8U57k/G1s/Nu6X2cKpPtiQ?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5oDbbjvG8ypUuo3s8tv6jOJg6uQMd2Ra0e9xBAH3MWw0qh/TI+jmfTgfhRQfr0Z1SqitsgXipyDfoyno8tVMI2UNHZ3f7tC0JBUtV22aPiRjLpyr0u2/cOKR/mRWGk3Q2qrhvB66QVEcmMB57AlSJdccj3WMm0eFsvQa89vsOtQS4Ywccn3YllgiVs/QjfckvQBqoYs0QC0/5iYzC1bvRBNR0Htzg/eKdCQC5wRo0+fPAy4zrMU/ejktOuK6Ay7DVB/Fhk9V1kF8G5xht14D8b92/Iji4DLw3K2sgalYhszLhPkVNNAJSsAGhB8eB4YDUrboUl4WQu4lPqaFKOVBnPVFNZFJl22feZcY/xPtMzgjMYiVvkqJRpPEfCi0irMMjdBy5O/0pHnm55a5n5oz16DxmU4JMIH7xpNoc1kMFkwZtHVKB4fWGtk4K48KN2+jQBg+VBFrkUT/Gybj1dRuTUpaBywL7ZLEOlc3k7LQxzHJdWf5hyrWww3or7kEqOD4JQB7TkwBreKT+glqWHmx4mck1oMWomiD5ZoP7+QMeSnP39rzemclTk3KMWTGUO3xomVt0ymmROK60h2MZSiskzhopnT4tu9HW74AUmzwDAs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2c58d4-d845-45c7-cc24-08ddac95cd3f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 05:22:35.1027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ylWx/zuq9/QAoAPJcsEieeqjjIC0KeSPnvukDQisrWINshz20DJV1Wy4fI4QcyBMhtQ2Lg6b3Fww86m5xNis0i1ZPvlqFgE4nTqXYCC7sI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6389
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506160033
X-Proofpoint-GUID: ZaKjIIJJyLh7w4SDtDqr58nYz8rKdD1E
X-Proofpoint-ORIG-GUID: ZaKjIIJJyLh7w4SDtDqr58nYz8rKdD1E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAzMyBTYWx0ZWRfX29H/0wdy4ZIL NOTJzcFZFCPI5WCQZxJXewDPZheZliFIyZzg2bd+SwjwFxHnyGFBaT0h7UNRfJpMaB9+ofUzSKf oUu+2uXLOOQ6RUG0gHelYw82L0NpJmq4bE2/3IiqyRYjPnvMtPojAgmjqCsriWVAYJcKBZrwD4p
 utvc+Sfupryo72s5g8QqgQLL64ewOnwjEXk8fSBOQNoGIr4+crzi7rBaAPYtpKxUSHRI/0QBcOv PFvzp6g/alkXCRLsGVgHMYyz03syCgvpKRfe8K0TmjRWmyu2s/kBvC8WFFeosN54+dZwJkSBOJY sR/bwycxZ18YeLsy5cF3fCIYTgtV/7NBhsEuqtHKFVKxoLg1Ut8eArZL/4kLI7iX2ghMLUDWLLN
 KaROhJuYxkhB9Yo6Hka93WVSzmVi9GDBAsMRVJ0IrK7h6REdqikAJ/tMORdfb7fga7iFSaC9
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=684faa1f cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=cBhH-oFK0cR11e0Nsv0A:9

Using mmap() ensures that the buffer is always aligned at a fixed
boundary. Switch to that to remove one source of variability.

Since we always want to read/write from the the allocated buffers map
with pagetables pre-populated.

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 tools/perf/bench/mem-functions.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/tools/perf/bench/mem-functions.c b/tools/perf/bench/mem-functions.c
index 06d3ee6f5d69..914f9048d982 100644
--- a/tools/perf/bench/mem-functions.c
+++ b/tools/perf/bench/mem-functions.c
@@ -22,9 +22,9 @@
 #include <string.h>
 #include <unistd.h>
 #include <sys/time.h>
+#include <sys/mman.h>
 #include <errno.h>
 #include <linux/time64.h>
-#include <linux/zalloc.h>
 
 #define K 1024
 
@@ -285,16 +285,33 @@ static int do_memcpy(const struct function *r, struct bench_params *p,
 	return 0;
 }
 
+static void *bench_mmap(size_t size, bool populate)
+{
+	void *p;
+	int extra = populate ? MAP_POPULATE : 0;
+
+	p = mmap(NULL, size, PROT_READ|PROT_WRITE,
+		 extra | MAP_PRIVATE | MAP_ANONYMOUS, 0, 0);
+
+	return p == MAP_FAILED ? NULL : p;
+}
+
+static void bench_munmap(void *p, size_t size)
+{
+	if (p)
+		munmap(p, size);
+}
+
 static bool mem_alloc(struct bench_mem_info *info, struct bench_params *p,
 		      void **src, void **dst)
 {
 	bool failed;
 
-	*dst = zalloc(p->size);
+	*dst = bench_mmap(p->size, true);
 	failed = *dst == NULL;
 
 	if (info->alloc_src) {
-		*src = zalloc(p->size);
+		*src = bench_mmap(p->size, true);
 		failed = failed || *src == NULL;
 	}
 
@@ -305,8 +322,8 @@ static void mem_free(struct bench_mem_info *info __maybe_unused,
 		     struct bench_params *p __maybe_unused,
 		     void **src, void **dst)
 {
-	free(*dst);
-	free(*src);
+	bench_munmap(*dst, p->size);
+	bench_munmap(*src, p->size);
 
 	*dst = *src = NULL;
 }
-- 
2.31.1

