Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2083.outbound.protection.outlook.com [40.107.102.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B60829186C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749047804; cv=fail; b=ogJXjVY7zz5nwl/npMyN0/TEdO3U0BiOWZCkm+vLaa1ooO0bP0SbFW9TLMDNsP8/hCTm5K6zRu1PjYuLx47UrN+4yQ6qaNmhVDgPkftgZUiihpd9yJ5RbsGFzBMH0BMrdrOFtn2CvyawdZ0WP8BURsx9dAKiuNrVz31x9U+g1oQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749047804; c=relaxed/simple;
	bh=G8zNB8O1+kYAvu2z3FbSFqYqbFcWb+L6HvcWZpI2wFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qAS93/nEgxH0nNyCtopGpE8eSrhvNe0J27I/XRkUwqj0stpcQsKCAmel5sxAfizTOy2D4FWcFlV3eIIfZIspasBfYl29JNKky2zCDiWebpJDmSwCpd6OrA12JiYXx3E25G6mb120AFmJcQGBcYFsml6gmqBCbdjh/h77U2BpUXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NcrLOKyl; arc=fail smtp.client-ip=40.107.102.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NcrLOKyl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxIb2GOZxYO11pjKlOKiJJk0lv00yAd/seNrY9vDuQF+yWNhQyH93V3kwVp1tx6m42ye5v8CL0PbSwMbpw5z0jcD/eio28XtDyau7B43vUROxdLp0ZNpaJEqVDuOTBxIR6kxdkcmS4NvBwHLLljuwtXmrQe1THpvdVQJL9mMBhjda10WjGhnFv5o20rUZFzsN+FELgiG0x/s1F/rXQoKKvyeCVjKPH9mSf62KQnHsAsyrEj5AHZDYDwGRlO2SXJ1B0K4IQyu3halRdkApLYUwWkPLH0ZAjpKDzX3Fvj29hsDxsydAQELn4WGFDlreXG/Ik/MlQLCAd8ADzLVCqWQpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXDuV1StvkJPLlEurMdWF1Zi96aeqtjpbwlAPy7wywU=;
 b=CaqauXlwrnkKTOA9NQHIJnZ/+n4KGuaSKUHvlC17oPrjjOBWWkBE+zgwqkqYel68cvWvQDQlHvQwlti8FaZEnrOr3e74a0OK4ySTYsEBqSdTuhywikGNc6miKHh23/bYPeQeBWmPNu51LArCiPnO3aGCW3mkPvluzSnPgwslRHrUb9VEM7Nx8RIeMOcAx0CM0H3RHkvbkiZvmKFBadcCpuVwzZ9rgEWaxX/ZKSzUidaPuMNvt68i/kkaGpMPZqg2OWsPPLDBK7YjzvrhbSBPDe9tX9PPPPeuKV6IFA9u1a/Dfcf6MMPye7mEyHqoDkqhCefZbcM0rA2jnoLE8lDqYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXDuV1StvkJPLlEurMdWF1Zi96aeqtjpbwlAPy7wywU=;
 b=NcrLOKyl98CoczzopN6D6unGrHY+5HGjvbzMz+r1ksQuzP6+LnEi/+zyYavCP81beYqLilmVIEK3iPju9tISV7sA0NgAj3VYHRXyQ8POSVpnGWTnUf9Tngy+BcIJwXWre64kuQvHque8uJxqhLmWbigHYihVz12wiRMs6su50M90JpwwktZpT9ruiu7GXJT+DmCg2F9U4FvSLtvcBoSV1pgtfu8xEODUqUbBVonAvueDETIRzeRNJ8XUVZKVjtiBezvCXjRF7DPygcd5D8TWb0lwfMzYRHz59p0IGS7aJaYkQWt5Xjyx1nDDAJTW0L8kuPZp+EjOHpLBfSfAbaFZ8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by LV8PR12MB9270.namprd12.prod.outlook.com (2603:10b6:408:205::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 14:36:41 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%5]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 14:36:41 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] sched_ext: Make scx_locked_rq() shared
Date: Wed,  4 Jun 2025 16:33:14 +0200
Message-ID: <20250604143547.708202-5-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604143547.708202-1-arighi@nvidia.com>
References: <20250604143547.708202-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI2P293CA0003.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::16) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|LV8PR12MB9270:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bc32ace-3a3c-40a5-c2fa-08dda3753864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2GhQyfFRq9k1gdDtSbywwQvDMEXe+zP2zkL+4ShpS8p9zax485JzqBcy1qme?=
 =?us-ascii?Q?2swtBMoDT1y27vnMlb/BiGP61MnXXL2+YpmGWeQ8PnL8VAPe5hzVxBuMnIV7?=
 =?us-ascii?Q?UjVxF5Tho4wl+wWNq5xk6LgX2kYEjm4VcSqVcxEymS5tJLHQHC4zb1TvyICC?=
 =?us-ascii?Q?gl68tuKw5P7Q2saU/gGfe8bTE09YPjVIMGuGZvBXK4YjS9Xpq2VulaRgwaqE?=
 =?us-ascii?Q?9jpPA3vkh/JeU3+ls0g1o/renpnyEuoTHHcjOzdzpW5eo6GFsOxUrvV46OjZ?=
 =?us-ascii?Q?EvEtxLiZwHrAK/n5GmXU54yNSnpMXX1s/YwwrPFEUD6qB6YqlOgly38bJHpK?=
 =?us-ascii?Q?sv2vVMB34EpmU+tSQ+7ZlBdvWEpUnZSzstPkre1PzTSBL0VTVCHgde6i+nRY?=
 =?us-ascii?Q?oLxRjZmgEunoO5YF9xdrcJZkdAswRbF/sMakm95mwRriUJjejx0Ni/UaZwAF?=
 =?us-ascii?Q?GkXm8Y9zPT5f+iLdwCDO8ZEuFe4lJG4y2VGOZvYnnLzP6/6PEt7ZJdowrvBK?=
 =?us-ascii?Q?FKkHbleCZliTkSKkuZ+9eAb0ClhJw0BRoY59DnJuyvQnwg2BxSxzUiX3UnCW?=
 =?us-ascii?Q?tzqMfirfCfqQB3sJ9jI35+5LNcMBP0O1pYelQwzQE0pDL6qkoETGVdQ2VgrD?=
 =?us-ascii?Q?3ul1NMpBqxFazox+8eEyJlha5P1NaBxamvyoIqb3/u8B4gXyubWiX7FFOHhG?=
 =?us-ascii?Q?jgwNVRv7pKue47Kwwlx0Pl7JAIljflpiP1dnKL2T37IKijxkwtFTJPxKySIC?=
 =?us-ascii?Q?HNT3Z3fKmrOQll86Hx8J/TaxdBqOlMkqwaQOUmasm663aYZH68U629QN8Qek?=
 =?us-ascii?Q?cu19NhGWqerctHc/5WJgg8c3z4Dxi28AW+lzGXL5CjjwKkVFnI2zvFYOZ08w?=
 =?us-ascii?Q?vIXaVldf/4FtKRKaFvwOYcH3qd1cQIJqEbqP6AUVatT95vgix2SKsWhsW76m?=
 =?us-ascii?Q?3UKJFa9pUPzZQPlfsg6VvOyjYoEJ1RJwJDNa8YnsEQMiSL0HJRhtGzwu98SR?=
 =?us-ascii?Q?IS8h6zr/I0AeuUpx2gIda93qKIcX7TQ5a6uym34Q1YboRcWr0R7wLzwOluER?=
 =?us-ascii?Q?thq8ErAj3suL7dZWTxfOeI+ulKtsUCVrlYv4xn5hzPkeXYoxg4fiHVsknwck?=
 =?us-ascii?Q?/kp00wvfeFTDQ4h6W3Lu9gOuenVXiaV+z1a3da7hpouXIZYqmX/GOAEk0pRz?=
 =?us-ascii?Q?SF1Zw6SOeaC1WcAWTxK3nMfURwAanGMQ8wxSJGOfIBIB7UNAVtiODlViiX6B?=
 =?us-ascii?Q?w3yWIgCqju4HJx2wsJlyMsoTq7V9Jy54SQEzJErdMkwkKTqbgzfSd8cExltO?=
 =?us-ascii?Q?xxyASPp0o3t96+l95+Q4uSLrDWazuwAOGBD4W9gfeZI5uo8nl39VFw+KdL8t?=
 =?us-ascii?Q?J1f7GQ6nTZsNtd/D6qGB8Pqfvoy7Q6gZ4qHu3nUFyLhiNBv8og=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wG3PTHcUQvzc7pvLBpr41Hd+IKizvfbMnGqUQ+N3MVEzuvqNXUCdcbL3mxul?=
 =?us-ascii?Q?x0fdG6psVQ4WBvO1/PJWDrV6VK/R1laiLmdrJnHhWqkCvu7ubmi205mKx1hr?=
 =?us-ascii?Q?bXCk8mDz/k8dMNNu1xOER/ki5YBOBhY8uV5boI64T9NDoC03tivcrwXTgEFU?=
 =?us-ascii?Q?AT/jEBzO166+SXdiIIGHSJH4OxyfsEBszenyE2XbgrPaWxhiyLIFeaatJoPU?=
 =?us-ascii?Q?0BLjmMRmqwt98ZQ1cCxQQTkHwtr5scFIA+RrdKKPncdWRCQ/JEhquDX4vb6Z?=
 =?us-ascii?Q?DICG2Fsh2ikFwI7vR78H9gcVDqtzLxjgAhmfQX7ebWKFr+x9WQKML5VISglF?=
 =?us-ascii?Q?kJkuwQuOvdLxElW7t3VaV1ZLv+sfKwYqWg2Qr2Kkfg8J1MHhzdkvk/dH5rHR?=
 =?us-ascii?Q?zfnU5rSSeTGP3MVRjitFGrrbgA3zuj88gi4p5KBYaMOBqIZ5XBlJnP0G0i+U?=
 =?us-ascii?Q?tIz4LuftPm40SYdrGHYHWHTSrGwYa1h/V990W8irq6izmMs6IW2fhzZwNhQc?=
 =?us-ascii?Q?WCF8zwExVzS7QValLw+NFZyZ2s6SnirCm/fsildY18BPsgmMwdUEqFsJHzu+?=
 =?us-ascii?Q?8EvLczgVkI1wJr5Ujn7tj9sfeRKqO07gxcjHAjA2CQWJOnh942H4kqQw5I4O?=
 =?us-ascii?Q?4VdZTvnDhX5BWNq1RJ6fVCiFZLQIFtOTsa4lmH1EdOcuoXQTHzPlcauCZYha?=
 =?us-ascii?Q?NaKyHIK1RGokp83WrnTS69AcgtNe7mzwktZsGrs8bQM5OgVxy+TVEP9Wz9cr?=
 =?us-ascii?Q?WBIMY0ZUUvK4ZYw+eWisICCUMyXyV5zHjJUL8nPYYhVDRwgrNL6QqkdZlA5t?=
 =?us-ascii?Q?Z2FYt02dCcJbNs3YrjWEnagQysTJN6aRY1o9TFxbhUCHhLb77X6uWO1tZVsQ?=
 =?us-ascii?Q?b0+J7KVQKHXyDPws5/81HOCQ5lX0+aiurn0q24UdlGsqNXlnZeJGoDaUgBrg?=
 =?us-ascii?Q?4nlW0KljSvcVOhREE2QSoNL0pnFbi0XRJGD2qC5uEjWE9HYTRERK9NlCa7Fm?=
 =?us-ascii?Q?2ssTUwHFW/CItGrIdNTz5ZAUf/w97bDwcYJpKEkmzgDlDjyw0/y2Tl1jT/tf?=
 =?us-ascii?Q?5/iD1f52FZoCklRsBgJwpiWD1G+IXshVs6mnbofpjGuA2wMcfH9wlTGG0sIt?=
 =?us-ascii?Q?6CkLM7WhyPM6ICVyuTN9f1FbCNtrGfmcw+/rwAwN3tzLbEFBp1ROJV7q3cyW?=
 =?us-ascii?Q?HOYfcpcET0wq8ZApo+N4ufV5BlUdICgUeWiOnPFBRvSB3X/SA+WMifbuSntC?=
 =?us-ascii?Q?wGGgFz94BzB2h+PXy1eXwM3nLLNntFejgsOYWpakhRj3O8bMixLzPjQKCA1K?=
 =?us-ascii?Q?wZz77svovg8Wjr4L8YdzZDpMjcGFbL29w47rkCEe/YVdA0tB4bj1AodyWz4k?=
 =?us-ascii?Q?oCqKWag4Aw4P5dWRu+It9e4UFYAyX1jK5tCBjJk9hwRyORu1Z9ZxAEvlekAH?=
 =?us-ascii?Q?xIj4nw26o6mt5LgDvUCpMfLGDe9lxpnexJeaNs1wDkm8bWdBTCMlyd9k49l8?=
 =?us-ascii?Q?kUQSvkT6kKSCyH2LBKboo70vfwfI9LjuANI2EJmtPS7UghtvDDyw9Ddh99a+?=
 =?us-ascii?Q?MMPH4nwAMprwvmnPQ7g5DCndlnugThKWkTaEH6Ov?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc32ace-3a3c-40a5-c2fa-08dda3753864
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 14:36:41.0132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qtTfIq+zFSHzKfFNFVjyM7RDl6ziNcUiP8XdwcUidzGsCiys1v7ruenySDcv7r7G48otjrevXR4q38FMOU+FLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9270

scx_locked_rq() is used both from ext.c and ext_idle.c, so make it
public and declare its prototype in ext.h.

No functional changes.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext.c | 2 +-
 kernel/sched/ext.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 3e483138dff60..941603ec67e27 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1265,7 +1265,7 @@ static inline void update_locked_rq(struct rq *rq)
  * Return the rq currently locked from an scx callback, or NULL if no rq is
  * locked.
  */
-static inline struct rq *scx_locked_rq(void)
+struct rq *scx_locked_rq(void)
 {
 	return __this_cpu_read(locked_rq);
 }
diff --git a/kernel/sched/ext.h b/kernel/sched/ext.h
index d30f2d1bc00d5..cda5dfa4dad09 100644
--- a/kernel/sched/ext.h
+++ b/kernel/sched/ext.h
@@ -18,6 +18,8 @@ static inline bool scx_rq_bypassing(struct rq *rq)
 	return unlikely(rq->scx.flags & SCX_RQ_BYPASSING);
 }
 
+struct rq *scx_locked_rq(void);
+
 DECLARE_STATIC_KEY_FALSE(scx_ops_allow_queued_wakeup);
 
 void scx_tick(struct rq *rq);
-- 
2.49.0

