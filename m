Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2124.outbound.protection.outlook.com [40.107.223.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F485A47
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 02:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751337986; cv=fail; b=gzwQxbu0EI0bKEBukSulSebHvOqFMDO4B1J1A/ZMrkWrOHwJqrj79kMuamAkjLfiqRQBJXa06i0AjntLqyp3u3Euzz+d3HC7z5MC2CgWLo6U2rXPDy5zKowtC80wDXVgOCn43PQy/q2uR1wroLb4q9d9noLrqe64hagcijtvRu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751337986; c=relaxed/simple;
	bh=lA2/1I7oQjreDeogfbY2WKgUKc5NAcpKx8SUelJKll8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=KPmyVr8/xtYJxBILnVklCizFdl5t+y7h7UycUUoYRkxjSZXBSoAMF9a4xod8CSzopHEwsOAXWK29CoBGfX0H/4GtWdGZCQmqzoVtRFej/p9JBIlFSSsbddOSGzWHn3Bj6mae5+6ud5QVtbMd/WTeUpPpicQn4CTq3JdS89SvnC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=ZFoBPC6y; arc=fail smtp.client-ip=40.107.223.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="ZFoBPC6y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EoyqA0EfDZGIEj8VtptwqENHabMfcdBw5zE710awIQb9Zmhfk0df7ZTZmrAu+Z08pCcVkEWUpD1wMcvqtlZtLG0voj848ivD9T1Q8y3X5LaZF0dTgNzt6zi5u8ZnOE6u0ghPASyKNJ1UivDKSv1e01KSCtXg742hmXObT9Lv/qrZ5fZkBcbs5Nl9VHllQH2jd9AKWEaEDnJjyUS5r3uePtzJtUNnXq7AA3PaVfHkveVGdO8VfVyyIco+e5KFzifgBbkfGhLoMANi5XJfWoJRHVF5Pp9tZbmWGKOJ8O2jl7DSJYUlelyjlFy2sR04Tk1M5tMk+re+yx9cHNaogY8oww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JeVXufRW+Jb2tat57D5gXs9TewLtjAiLy8cI/Z101eY=;
 b=PEy+WVKcJo5MYa2EFdTuds9Oz+/ndHlOa0Jwa9+wWnRTNxtx68lyCXq33cobdtyQt/LCYr5SVh/cKWVMdii0P3BRem6omhrxfWcEK5xauqD8th/ikPQvWzEqJqqdnEVJx/ZIEr5jJcbN5wkhmsAeUdYuHgiklkyfEo97bRZthDIP6mCCtpd7c4eIOODuhtnXJVn9EBTrpvcrislh9nPCBS05028gIaW19EGDOFoiK6vOVN4Wvy70SNADr6I5oDeukHroV0ZgUlJEbSFY1pW1sLLAignMqtZjsydFYUnOE6ZFrd60feFIqNv1Y4aH1oE/fFpOfla3xsUqn8hWebTMEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JeVXufRW+Jb2tat57D5gXs9TewLtjAiLy8cI/Z101eY=;
 b=ZFoBPC6yr5JGJDb9CLbkqkCTcIm7UhExiLQ/5yLErFbJhQ2bK9iRonIaB4vydrEAtG9z2txAwmKugQqqFA27Q+uPVsulztmCWXuCoCRHjRUQ6FgykxzvcJJ3vwlRM/AWZHc9KwWV2mIF+yPEJCZFZZKADTZKNu3yfo5bwVgh8AQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ2PR01MB8322.prod.exchangelabs.com (2603:10b6:a03:536::6) by
 SA6PR01MB8877.prod.exchangelabs.com (2603:10b6:806:42b::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.31; Tue, 1 Jul 2025 02:46:21 +0000
Received: from SJ2PR01MB8322.prod.exchangelabs.com
 ([fe80::83fc:f69d:1950:9f42]) by SJ2PR01MB8322.prod.exchangelabs.com
 ([fe80::83fc:f69d:1950:9f42%4]) with mapi id 15.20.8880.030; Tue, 1 Jul 2025
 02:46:21 +0000
From: Adam Li <adamli@os.amperecomputing.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	cl@linux.com,
	linux-kernel@vger.kernel.org,
	patches@amperecomputing.com,
	Adam Li <adamli@os.amperecomputing.com>
Subject: [PATCH 0/2] Fix imbalance issue when balancing fork
Date: Tue,  1 Jul 2025 02:45:47 +0000
Message-Id: <20250701024549.40166-1-adamli@os.amperecomputing.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::25)
 To SJ2PR01MB8322.prod.exchangelabs.com (2603:10b6:a03:536::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR01MB8322:EE_|SA6PR01MB8877:EE_
X-MS-Office365-Filtering-Correlation-Id: 57112ea7-9b2b-4e41-881b-08ddb84975b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?52cvtSzCJ2tNq3FmRdrKZjLUbH0DcRUd4cJhUsRRX9SExPE+QzNrmNJkXowf?=
 =?us-ascii?Q?iUsu3Zk1i2oJ2d2u8Jn4gv3z1XPOGA0U8DbSACafBcz5wBvcILHRUVnVOju4?=
 =?us-ascii?Q?lrbWKYRPjaDnD2sbApYLFrH2Rxw/Im2EKpqXrhhaQaf0ZVSHn+HDE1hM2lfa?=
 =?us-ascii?Q?6g6SRhMAg12/rGFtuXhOU+YVNvS9Ja165K6lKh2wbjjC9nlqscL+yjkTM91Y?=
 =?us-ascii?Q?Ehf9fOku0e6IXpEtJ6cM7FQgbHRreophlJoJDt9SLU7+eUGDJMcuyzaD+Mdz?=
 =?us-ascii?Q?mfzbxiXTVTxmfCTFqUMR9PjEj7tNz2WR4rO0R5jTwSSgR0w82N6JvosGECvP?=
 =?us-ascii?Q?PD+hzD4rhzW+Nbcq4wKsxu96xhpkEEJ2hcVZNA0HT3vP6ewTpKlid7cwlmN+?=
 =?us-ascii?Q?kgtZIqdOIu5MgsdNyW/WY+0CN8MViyNMxrJS3V5b2j9a47wJFPbrELBInHNQ?=
 =?us-ascii?Q?QDy1pFUI7oukAZ7qkFcmN5AvhnMreDUkbLuzZ5FdH/I2FM9oPAZeJPMjHh9g?=
 =?us-ascii?Q?r3QesKGYi3H2AxRD7qLr0QFHg5vt53wWZTcrLXOLoh2p+WciLBjUOMfjEuUU?=
 =?us-ascii?Q?31mp/Ht1rtBt8CQTbmdbsNR28qzCXaIFhz9cRzFkSelNysJqumY3XdSlnSYx?=
 =?us-ascii?Q?ZLgORA4Mo73aLZKkm38uSa8vmJO9B/Xbpg7/TMKoh3E7BR+/vo5OlpD/QI2I?=
 =?us-ascii?Q?+Z+g5yZb5tTIqlBx4efnmoKH56y6SHg1d4zKGCQATOjKc9QCd7hiPe/+9Tft?=
 =?us-ascii?Q?UNPC2mT4lN/4akK4GVOjCr3QtJi2EB9oKLT+xa7DXhWIbmJWandXidY73T4w?=
 =?us-ascii?Q?9R3vWWubH4LrzM6v7ntL1kPRmFKA9J5aAPK63mzPQ/jmbRXbWB3rLzUUJt+X?=
 =?us-ascii?Q?0XjnHo/2XOz8opWq/8GUVTFaa90T0aoEMTa4m8YwWjUIWKqKNgXsBcpSX8A3?=
 =?us-ascii?Q?rGhjOmGERJLdI+Xz4Tutbr+FbbTl65Sxfv9CE7ZyLrWH6U+n22dXVn8YnPiE?=
 =?us-ascii?Q?MY8YmwYMxsxw4lo2XVYzDSRxl+K/Fk0vg2DcecDhgdniJi+zjSEoT3v2QxJh?=
 =?us-ascii?Q?nOsv7ntNbGhjRun9NTySjZrOsEqXi2ZJoM+cThICc2z9zT2mpkWyNwzE/cQk?=
 =?us-ascii?Q?nnYZuPZMMeRYQkB3adagwy/F8JzsPfjE3DweAiAcoxW8z+2aS0kPzEzqksXG?=
 =?us-ascii?Q?UvWg6pUtVOezh7NQG+MMTKxPz4fnmjuIgYoD8EPs9khh/ogmgj8fC7bTqOwc?=
 =?us-ascii?Q?ZNFoLuTFfqyo/VLU56kSzPqmLDqIREEtWdvFx6OadUuPxOy3knQpATLTFDpy?=
 =?us-ascii?Q?23NmWGRQreeF2ypYE9Rk74ZvhMplSuB/fAet8bVff6cJgN1rrxNCQ3ayVZst?=
 =?us-ascii?Q?T33nO9eLJeM0FuUsRq+hSxQxVx0DtdeiHCtJLd+/b5wPhuFPY1SzkcPfycOw?=
 =?us-ascii?Q?Vf6Palu3nrPBaUQNIVqZe0eNcZzksy7hor19XmZ3G19c81pqCVOm2A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR01MB8322.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h72uHsL6a/D3HS0Fy5cdvRgr9URXeaY3J8cnYOoQ9NDLKsaBVOVxX0iaxjw5?=
 =?us-ascii?Q?OukI1qSOIxkZ7KldtDz2SFmhJLaCIgCJ7um/fyno9XxJJw+YWVeUjyjemJ+6?=
 =?us-ascii?Q?tA3VJ0iLrOm/VC2W6/6EPHXS1NCyx39M8/UOwRWAgxuqLoOaHq/59GKSxKRI?=
 =?us-ascii?Q?on2nLEWng1CpE9ZKt6yrPXeioq6bZj+OxydIyw4lf5RlxBkn7dvO7oLmNNoc?=
 =?us-ascii?Q?aONwyiymmVwDvfRnfF0oc7gQxKUOsplF075C+B6fxeZ6/cXN36KJK33BDv6f?=
 =?us-ascii?Q?/vSyP2AnyOvcmSNPUgk0I1ys6cZnIPN4nnFY6XOkUVAaQuCjuP3UxYwoiITN?=
 =?us-ascii?Q?NapWkrw0PcYKMdM+Q15q2iDhcCVTlDhpRkOE0cbEUz2O8/e5v2fSCnA3n6Wb?=
 =?us-ascii?Q?zItYYlpZA2/XiMt5mI1Lfkv34ZBhBDuOiyJOWclsUcGEwWYK56r8E6SVN3h7?=
 =?us-ascii?Q?iAWlvlqFrEW68SokW66ESY1tdQLN+qF0imTYqCaEHF1AhZgGE2Zlplzwfq4O?=
 =?us-ascii?Q?dd45PEFqjW+2wkz28aEsiy99hLWljU1ewHQsK9IaoyJ0miZJL3JTNVmRV/rQ?=
 =?us-ascii?Q?Mrkuj1Mzmi5ckxJUqQh64XCZxAhjCtk63wqiSuRkqkp8ylyVDy97R3UbIVpV?=
 =?us-ascii?Q?Dsn1KnWoJlOUQ6fINemSgVwSeh++1OcMRtcFhoYXvHOfopoi7slVCPlCxyHQ?=
 =?us-ascii?Q?HzvE/UOQ7GHU3hL39ma0wAVXKTXXUOBMtFD3F4tCjvuGPcjii/+KpkYUGKWI?=
 =?us-ascii?Q?CtJFl7VLwI9hfcZE4LyWmcxho3qK+oZTdTamK8HwlmsxGnNHXzLLwiwh1q5n?=
 =?us-ascii?Q?0E6JevCzmVSIi2ZAZgeu21Kna8ej4ZjNpfbDI7fOT2+fSQ8QnmfS8IivWk9Z?=
 =?us-ascii?Q?WxcEEtEQb6avA5lbiOSdx/jyo32G0lCHgAap4Bd/HC8Aze5fOCYY1IjrdVmt?=
 =?us-ascii?Q?XqRKqDKJ821vwZYwJV8Ust5aEjHAuK9aAjLFwvq8i0wQJWWXCBlcq1Zi/jj+?=
 =?us-ascii?Q?RygMaASsYq3Y4IlypA5dH2mpAwgNZdDdikA5o0jUhT4Bd3EUE4ZoEykQCrhk?=
 =?us-ascii?Q?S5ZTUXFQCx6XOBzMw/X4xXM2dqy3zBE4rEprrJf1nQiGY/UNZzTqvfNA/hQ9?=
 =?us-ascii?Q?GmABaTK5XMbcnFsXDencQOzXtaHDXTi/1dzAlJ+flCb18sK9iZsTv3w+OVc+?=
 =?us-ascii?Q?xkwgDAVETXawgDOzCQh+rpFxuZ62cV8IaIRW6nuNPfVxWWMPKTT9NpAlUdtM?=
 =?us-ascii?Q?NMycLnRLieSi78ZC9bIMjaZsB9hWy+5I1oysLjP64u7Xquq2QDoUsiZN9iKg?=
 =?us-ascii?Q?E9FC3YvD2sDGodeqhq8Bh3fnxtGLovNXPHDEz19nvk8VjvpGoeHnZSxMXidi?=
 =?us-ascii?Q?XwrYhiH1qndd5zXYSa0sb3oPhIH1qEOMA2jHMXDBhIY83iDZGMUhm4/I8074?=
 =?us-ascii?Q?wXZRDnto6NFtuw7cXVHb5Bt8/q1RGUpoBXgj2oFEsR2azgWbarqWPgnKRFw+?=
 =?us-ascii?Q?7PYIiTb4F9axBRvYLhVz4G0KvPsn7XWfKPUjqW4jXqc8q3BgFqZD0bcvTG5H?=
 =?us-ascii?Q?VAeL6T0AsYX+y9RpqxeH8+7FL6EG9bdRZj3bPQphoiP/JaRxtXYtq08tISd9?=
 =?us-ascii?Q?NYRCEZ7G+7lhOLbzF/QiYOw=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57112ea7-9b2b-4e41-881b-08ddb84975b5
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR01MB8322.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 02:46:21.0208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZ66/Rjxgp+YcQra5/KTes0xG6DSxD/E5Ds85UzruRmWT99hQ/9QvkP7xy+cmUGSFx8ra1RfdoGxe87ZCkVw0jOP1QeRKLhkH8zGf8RLdvHaCNdDZgHURa4B+hLgBLUM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR01MB8877

Load imbalance is observed when the workload frequently forks new threads.
Due to CPU affinity, the workload can run on CPU 0-7 in the first
group, and only on CPU 8-11 in the second group. CPU 12-15 are always idle.

{ 0 1 2 3 4 5 6 7 } {8 9 10 11 12 13 14 15}
  * * * * * * * *    * * *  *

When looking for dst group for newly forked threads, in many times
update_sg_wakeup_stats() reports the second group has more idle CPUs
than the first group. The scheduler thinks the second group is less
busy. Then it selects least busy CPUs among CPU 8-11. So CPU 8-11 can be
crowded with newly forked threads, at the same time CPU 0-7 can be idle.

The first patch 'Only update stats of allowed CPUs when looking for dst
group' *alone* can fix this imbalance issue.

And I think the second patch also makes sense in this scenario. If group
weight includes CPUs a task cannot use, group classification can be
incorrect. Please comment.

Adam Li (2):
  sched/fair: Only update stats of allowed CPUs when looking for dst
    group
  sched/fair: Only count group weight for allowed CPUs when looking for
    dst group

 kernel/sched/fair.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.34.1

