Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AE51E32D5
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 14:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747060354; cv=fail; b=rrVtK4HYX1gjEfPKmCpYt4gm2rn0tR4FpY1tp8qN6bTzhQwZxaviDtzmg9R3UODQslZPNISZu9rlUZgG3YYgywBhPEtJz1j032M4bjtmNyMZ7WcY0tTzCOeDlamHNiHi2JvWik3B97E0KkegUL1unaW34dFf8gaTZ04LG39Xif4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747060354; c=relaxed/simple;
	bh=Ez57LlqcR3CALHtkItazKZvDikGYB4Ezwufg3nI8LTI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kPivBGhEbGF8DquygzI2v4llskPTwUyuiLXw4I0LTOfeQTia1cCIerOZtDIM3/SmROZbjATZrdokRlN9YQDeWt94/OPaHnvu3UOt41on0rO505zmQpDwitkjWFg+yGTRf5c+no6xq49A9tjfoW6YytVe5Z9XIwnA2VS4kqchQjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iEfwIfY5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JMJNbknP; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iEfwIfY5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JMJNbknP"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CCAA49019736;
	Mon, 12 May 2025 14:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=mR+WP6ZImPNbTBmV
	edFEoqBffKSP6CfS8WErmXxOFaM=; b=iEfwIfY5HtzBTw7VTShvTruCqiKJxR5e
	RJeY8goR+lRlz/5FSt2JdLjwInsiqX22pZnN4ezM0ZEoYYE0G+67/5vs14ETz61b
	oCzTCR8dDV0J7BxWUf/4T6/Irvq9w3IeB0KVnddB4Opmm6gJfxoXiNwUMOYZwJbV
	iT/2UCoa/mou9w4KQofBtGkvVhqsvSqYK0eyH/al2eHs/lAUAvnTGNWUVAduyIW1
	FYi/VGmunAhE30qy0wb7K6HL0z2ona6WS/CJSBCnNhxu3T+NozCg6gRrO6xCnWah
	T40TwOhgMDbzCEoboE7ICoAWQyK2WJ/HW3kjW7+jb6iH6KHkeBgPWw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j13r2mec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 14:32:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54CDFdWi002712;
	Mon, 12 May 2025 14:32:03 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azlp17011030.outbound.protection.outlook.com [40.93.12.30])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46hw8dy749-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 14:32:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGy0ps0Y4a/CQO4sMw9GQ08vInELC8YqY6Xmq67dZOQavLH63X9F2xesQFVsgVYCwdhXroovpfzv2KU6TtwqZzeUCT7ztkJ2y6xokm78fi8MYaC4FJ3sbzCkcfXl7+lYM3geyt1+q5gc2XXFi+J6xoXdoImMelsTOEgD51X+hYBN/q0b6p/u9kqn6ITYJjViRvkJ0M7IGmCaRPX7JefydQ1nGWqnEuBirKVMiqp/8JlgRgkTm89KVGH8YaQwH0hbEO3rAW+afP31Fnz9WU+rYkyVXZGnws+HYuU4c6TB4moTkTNed0U2FX9kg6JnDlbEaAuvPGTAYy9Fyp9bImudkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mR+WP6ZImPNbTBmVedFEoqBffKSP6CfS8WErmXxOFaM=;
 b=EHQc8X5yighGB7wQaFe+rjMCwwoC2ZOGTqDgQm/6MErPC6+9tsWhk887mOZa87DjnAQu8Dw8nAaXHUIhRpX6S5Mu91nNA5Fv5EMB00x7CPmhgmusP6YUYQpN9EeZIUcEFjrG6uA3ysE2zhE9sFdxWmrfAKOVCWU6hQ705I9B2G58TW+tIkXgbpmvKJXl3qXIl64FBsA7IiPQwv8Qzeyd03x9q7RwFRMym7DWjb78l02SIlYfVkiypiuwatsqXZZ0RcBBKAx23dgwbX7S/Dbph2pWZ9kPwbjIKkcwmPQuEjkzU+UfdSHhVxVFxKtvOp88N6GGszgnq7MtW/86kjEbiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mR+WP6ZImPNbTBmVedFEoqBffKSP6CfS8WErmXxOFaM=;
 b=JMJNbknPU6qgOksPXcM01SUptcSCE7GUubV9G+KxAzeA+h5lrHb8Sc5+cfZfbz3mTavdG+EtlqtUJoBo4BAnW25p/exg2jFLXcVHi4xw/c26wkYO+WFS4XpKHuoaM4CxHZJoV8em6VmKsB9nRKRs1e/zq1L78T1zQ02zFFXr9dQ=
Received: from CH3PR10MB8215.namprd10.prod.outlook.com (2603:10b6:610:1f5::7)
 by PH7PR10MB6202.namprd10.prod.outlook.com (2603:10b6:510:1f2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 12 May
 2025 14:32:01 +0000
Received: from CH3PR10MB8215.namprd10.prod.outlook.com
 ([fe80::e4f5:cb34:9b58:be90]) by CH3PR10MB8215.namprd10.prod.outlook.com
 ([fe80::e4f5:cb34:9b58:be90%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 14:32:00 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@redhat.com>,
        Michal Hocko <mhocko@kernel.org>, Yu Zhao <yuzhao@google.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: add mm reclaim section
Date: Mon, 12 May 2025 15:31:22 +0100
Message-ID: <20250512143122.87740-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0350.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::13) To CH3PR10MB8215.namprd10.prod.outlook.com
 (2603:10b6:610:1f5::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB8215:EE_|PH7PR10MB6202:EE_
X-MS-Office365-Filtering-Correlation-Id: 61e133aa-b511-496d-ec06-08dd9161c196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?auLsy6lbwQhak3Rjru4+D42JFLeteq1yUFSNa6wQUD5SoKNnv6Y8MFIzfuTg?=
 =?us-ascii?Q?/NWWO1WXtYH2oVuhOEZosi1qejh6i+s3ruWrx+YwGvLI5nzrZKMqfCA/Yq+K?=
 =?us-ascii?Q?GGTX5t1ydCf52i9u8gjbLgX/O1Rs8Yuwgy5gSHxLpRjX6H/3tHuBQ/xwar2k?=
 =?us-ascii?Q?draIAlI2pRXnXyL4sOHvQZ8CLMb9q0eIQuoEAn2aAPh5yIjDnr/nlQBHaVdD?=
 =?us-ascii?Q?yC4IS+CD3Jq2Ci6sd7OWWsFdKhdsAOQ9SjyhkN4rLQVEUKUj8KwE9dzeqsqN?=
 =?us-ascii?Q?wQ1BtVDb8OsJwy+LtAmR6dfzwxSCalPZj6llbNqKdvaKwig7AMy3alESHi2G?=
 =?us-ascii?Q?VYgTps2tmv4yg0S2TZNUVSftSpVTj2KtJZZCHh1198G0LDjm/8lVEMCXWhmh?=
 =?us-ascii?Q?5KUz9uEq7LNwq3VuiSVPe7Zdp87k53xPt4WmhDUGfRU0D8xDCKGHv+s44WqY?=
 =?us-ascii?Q?5O50ggpwjBx+VELGP/RbA08zsNpL1sCMfDnApyjUIxRX8x8pdLNcp8Lwp5ma?=
 =?us-ascii?Q?cVheZfkdOuESTVIGCa6YVBjLEqzjVK5jcvOWxysVB47LTvA5Tt+ZHzX08DqM?=
 =?us-ascii?Q?THxgTmRCajKVVg2P5S1dKr4HjfBufICxr8b7VSZgYrMuHbEGTe/Y0TX/GvzY?=
 =?us-ascii?Q?Gb0BF+983eWQ2xSkH/EPVnLJgz+BonGmdWP3vVhwX4TQgNLcG8echhUwS65a?=
 =?us-ascii?Q?5slpKk4qyqq6oWyCshf1sZD5n26Z5Z08VNUzNHN5dZ8pZQMtB+1EKFDEKpPX?=
 =?us-ascii?Q?XKgwOiBlTJ1g09WnuHhkrDJYWbdAg+jttQJRbrNhZ3PaS4JEC/9HjXtMvC3o?=
 =?us-ascii?Q?aWW/VIJFgWvMDMsv1gtAsdb1fgePbHBh/HdOrj3/Lz3Jhhvrk34EfU83yalF?=
 =?us-ascii?Q?A1mEa/C5FX5tHyk8BQIsk/5E3eCYA70Voe0ltR+LqLprKx9a5xIs+OVqobwm?=
 =?us-ascii?Q?N4Xg/EC9fKqakQPNzWtaMj/NPxflnxDtd5v2HGFo6GdNeVRQKxVgb7/UkviS?=
 =?us-ascii?Q?H/sgmmMpmrJwYBjXfCHACzkhoCyFaKtu4BICm729dYvWJUJUWX/+MlNIvppE?=
 =?us-ascii?Q?TmGc5iy3bVdGwhgx8XDHTVcg0OVTK61yutdknrwQzftjzE7ps0fuuz4LCDUa?=
 =?us-ascii?Q?w0dJLnoSjC8AtzXGuO2Szce3dDm/dE51gkP0X7TwckCuRBTJx/8hjVXqpEZS?=
 =?us-ascii?Q?kmeMKf0emtzseHFfWxHfViVKuo9OObtuJHWYQB2uOaO9S2b5Ja8PydsujS9C?=
 =?us-ascii?Q?+MFbKWH+zTwrYemOQDMTjDldiQVGlS0lD38gu2PfrVYRa43GVnEEpefQy6Ht?=
 =?us-ascii?Q?O5N3isjYJwph9J5R/2YMDsT1qzC7fNeJpwnYCYteL1JQa4Crf87Hjgg5rKnN?=
 =?us-ascii?Q?PU8lWQUqoKVgNPGEgTSpDeaIRsTFhp5b/RFOQLiTSzJeaQqo4TChb+JFzhuq?=
 =?us-ascii?Q?vd+AQfW+c34=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB8215.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MNi56rdYDSb3hNagXBnX9hUCwZEGjR5uW61owTSmQTVdn+Zh84ATil2e0xsH?=
 =?us-ascii?Q?WbZxw2964kLsuLZp1AN0CMDGQHyeYaoU8wslxIXdHfMgNKwHTerbYvTturxT?=
 =?us-ascii?Q?bctkGWLYZ6RqwfQAEgILo8OAHrAsCq9JvroHMcvbWW7bGuwWnVmDWkh8IzQG?=
 =?us-ascii?Q?MyyTqF/trpUDW1fpVfIeQDeMjZpPHx+kGPGlVqnQG7k6AFdNjrVds8CYCktU?=
 =?us-ascii?Q?Qn6W3gQmOkpEZWmlurKSz7elW5JE2wt+No8F4CDZ6BZ+qT7SO5jbqo/FyKOz?=
 =?us-ascii?Q?SDf1AQznME+jO/VPUVO/tEk7LRETE+nbL3W5HpXQc3Z48KAPmN1hURjyOtCz?=
 =?us-ascii?Q?mU97ZYBm0fifzOF89zWm0+jttLbU1LhVeR+NrH0kNnyx/r5gd2UL7s1FusBx?=
 =?us-ascii?Q?Zjd5axUViqmBoEU06IC6lYFac0Bv2JmPOnTumS+JRGCDbME9llgNF3VOu0ll?=
 =?us-ascii?Q?YoQO7eJTjRr2cBp4si2IFPFb5mx+/zY8ijdIjFyotPCwq6DfuJyjmx8prjQe?=
 =?us-ascii?Q?lQNWq7QmxKJ75SD6puJH8g9IEzdeWxbQb07b1He2s+SvPGW7N6fkiq7VNNz1?=
 =?us-ascii?Q?MPH8HsWwUWF1qjDyDKbpg5qcP+2pyC1fJeOFMyc9LmkRRG7C+c2s5Kl7fAtL?=
 =?us-ascii?Q?h91WzaMK/qdCUUQKJhhTD/7lmbf1jO8P/3vrTEMdS6aAvpTEPGeFvkNG29mD?=
 =?us-ascii?Q?LwO0+2CAwoW5/WA3pq9SG6fvXEtlqwebZDx4UeVm+cpcyE50V8Ny3/TxOJ1k?=
 =?us-ascii?Q?9wJxxfFBMPUyXZ0Tn0V1ZeLP9PJS01xHItB1LM7HndecYJ9rHLA9a8+1y8/i?=
 =?us-ascii?Q?VHTBqVcsIpqsK2XboynpRZ9AfUCvHEboFOC2HH/HhbqQBSes8hXzqHzmBGqv?=
 =?us-ascii?Q?8Bamo+vSfCj5Rv6e53ourOG2gY34KCFw7+eJuG4untn6QYPIYFVUe5VxH+HN?=
 =?us-ascii?Q?G0zdgbfwvAoJ1SUwHtY+W9SSRud1Gwn2g1MyQ1gePYoda7wYHFQ77wFPkW/z?=
 =?us-ascii?Q?jDQszM4n+DpD7a1ZJipe873S00v3GfIysVy0wmiZlP2w43cAWkre/zl0LEk7?=
 =?us-ascii?Q?f4I2OaVi1EiQYRxv3zAzMG6FzYcHfFi84O7K/as8vEeXUz7V4g6NK0KUWIGt?=
 =?us-ascii?Q?yINfIeJBROT5+Zaj8YU9GMfjf41Id2cx7kyqtDHDTbHT7rfPgLoGvhUCApJA?=
 =?us-ascii?Q?oe9EdyvRaLu2iVPy4Dp/tm9BiyFxbM0r54Pt5x3i6yOQ295dq+okJX61wrny?=
 =?us-ascii?Q?T1z2lljKammZOG8tpChWPf1on1/sySuLMILLIRbLbr7dhT1++0dwRdi8LrrZ?=
 =?us-ascii?Q?lCGJ1mVrh4TvfOQXcxdshG0/jtLYjqY0NhIHuZenbVH4/haJcCDXCNcArO6q?=
 =?us-ascii?Q?BtJ8vUr1g828pHkMRLVq2o7MjAOhb/fl6EZ0gofnSoR4RP6Kvc573D4sM5re?=
 =?us-ascii?Q?x/eB5vvgFbf6dOW0PIaSW/8NVNovaRtcicLBqJyNe7BNK59fFIceevlCNMdR?=
 =?us-ascii?Q?cy7olKMKz36AOk/KDtZxVr0lKh279AXpHYw0BYMC4SzvES6VGPMIbiTE4fFR?=
 =?us-ascii?Q?DdfM2yzWyxs8x74BqUsV1fk7gL98Y4B1rFG/1mpnszgb/1yaZK7HX6SXvK9O?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vW2H6aYZsqAF3Tm7t5EQHbOoOdT2KBRKxne34kFBKgB+v+ZmDSFi91oLTTziJbv1A6BpAIMtVhnLwp2awrO8cwT6HKefnJUBapPJJTh4v1DcYYGfqnXPaRIfx7y9/x/onBuET9TbtyGSE5BqEW/R2TgePA7uduePCSi1OIz/vIGsAm8uXpLU6GZlx4+4TLAbsaEP7C3NEAUNGcZ/mmLJUwVOmTBG3VuwJHCVYKEUYBFgVVM9zjSpCJb9EFjoRa96qh/PcsvvM3rg4K0lbXQy0meoZd9iho+Jy+OviG5NqZQgnlyAQM7/RtT1PrIC8eS7kOX2hX5oSox0/hWYNSqSaMCo9H2ebF6cHeTxvsPLHEiVKl0wD49Wi4Fefxn47lTspCpOIcncFE1ME526DYMgOkweLJUyaGWaYaNEJ9907rR1L6fOGzGskxihD+hKwjxn9QPFls8gfcnVOALFyzrfubvQ64LGINKLr+4RoLbI36IJisMGSxeGdSOSMoaDMbPLYUzp/cT/Qg3jtl1MobukUSLzsrQs8/8LUTvwlOuOaITfhxfKUsO6fpTORcgQtHw5eepCeJwJGT+99G34HC2YKGm+Czygs8iZrnFHBFhGUOA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e133aa-b511-496d-ec06-08dd9161c196
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB8215.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 14:32:00.3117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SBGRaLwnPNUsj1BaM7Z6NBDyzno28ekhsbPF3xY1vjjN47qqVKQ3rlOOfKwm4TuQh+//tP/vP00VRt0TvBtJ9SbaCSsQeLbi4JQA/Hgp0HY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6202
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_04,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 mlxlogscore=974 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505120151
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE1MSBTYWx0ZWRfX56w/2/LuDI7u MJ4rJvKvcH6rKhkUCjYUYDEqiBJNOa7IONGPdf2JuT6JNRCQzMaNE2CDdmSalfr7aBc92wUbfqf aScqv4yQZJ3+ZxixzYQ6k5pKbXxMOHRG5Cik76p1OwAQWhZZ5U/QwE8DYmyM0vzcEJJaLX05Ij7
 HCo4rzwLTS4BBjYSVSzO0rRv+iYZuWA3TSd3UvHUoOYak7Os/vgLKa2X3id4s5jgsZeom6dk0vs ADoQKrdL9/MN0dS3ZUMzfgQxf+FwiwIdHFGW0hzPwBfSE1qqjgPVq5y70cOY5zcqW9xC032ncVc aMDcdRd2UjFOQdGjHgsVQkeAIX3KYzTHJKNM91uFR0EL0pfdXnZjSxph2aubDo8Z3hV1grDRyCt
 WLzqLb+qubP4NKn8k4J3vsrqd8o15JGMdfgu1bGOGLrl1pq3S9s6DqikJp0u4h9EWNY1Y/mM
X-Proofpoint-GUID: SL-XrO6OtZK5KnEPot_ZQSVb7KPjGb5y
X-Proofpoint-ORIG-GUID: SL-XrO6OtZK5KnEPot_ZQSVb7KPjGb5y
X-Authority-Analysis: v=2.4 cv=M6hNKzws c=1 sm=1 tr=0 ts=68220665 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=968KyxNXAAAA:8 a=iox4zFpeAAAA:8 a=ufHFDILaAAAA:8 a=20KFwNOVAAAA:8 a=Z4Rwk6OoAAAA:8 a=37rDS-QxAAAA:8 a=b6DAsu_WYAUdAcEJPFMA:9 a=WzC6qhA0u3u7Ye7llzcV:22
 a=ZmIg1sZ3JBWsdXgziEIF:22 a=HkZW87K1Qel5hWWM3VKY:22 a=k1Nq6YrhK2t884LQW06G:22 cc=ntf awl=host:13185

In furtherance of ongoing efforts to ensure people are aware of who
de-facto maintains/has an interest in specific parts of mm, as well trying
to avoid get_maintainers.pl listing only Andrew and the mailing list for mm
files - establish a reclaim memory management section and add relevant
maintainers/reviewers.

This is a key part of memory management so sensibly deserves its own
section.

This encompasses both 'classical' reclaim and MGLRU and thus reflects this
in the reviewers from both, as well as those who have contributed
specifically on the memcg side of things.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Qi Zheng <zhengqi.arch@bytedance.com>
Acked-by: Michal Hocko <mhocko@suse.com>
Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
Acked-by: David Hildenbrand <david@redhat.com>
---
v1:
* Made Johannes an M as agreed by himself and everyone else :)
* Propagated tags (thanks!)
* Dropped Yu as he seems to be less active on-list lately, can easily add him at
  a later date :)

RFC:
https://lore.kernel.org/all/20250508173735.173502-1-lorenzo.stoakes@oracle.com/

 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ff5d3c40e749..572fb63e2e25 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15591,6 +15591,19 @@ F:	mm/page_alloc.c
 F:	include/linux/gfp.h
 F:	include/linux/compaction.h

+MEMORY MANAGEMENT - RECLAIM
+M:	Andrew Morton <akpm@linux-foundation.org>
+M:	Johannes Weiner <hannes@cmpxchg.org>
+R:	David Hildenbrand <david@redhat.com>
+R:	Michal Hocko <mhocko@kernel.org>
+R:	Qi Zheng <zhengqi.arch@bytedance.com>
+R:	Shakeel Butt <shakeel.butt@linux.dev>
+R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
+L:	linux-mm@kvack.org
+S:	Maintained
+F:	mm/pt_reclaim.c
+F:	mm/vmscan.c
+
 MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	David Hildenbrand <david@redhat.com>
--
2.49.0
