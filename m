Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F34291177
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749047797; cv=fail; b=nexkgEzCr/l6+ocsLbyLfS7e1+fFXvoJofLvXpkD5WAhjYU7P06OaiC4Bwo6rIpRrviizSIHQVeKnPUgrV0dMA69oWMCTgHLqGLmg0j1pTPTFMngaXEenqVorU3WS0Z4D4ILeHol3iuWZyaNE65nEShclPWtpesiYnYbo+4HWwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749047797; c=relaxed/simple;
	bh=D0p6dCQ42HaoN9nRHKKv7Utx1zeErDfG1O8RKeb0FF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HvgTF40G5CrCxFndWkoyWsZv9tdg5xJcrUD2T+qak2Y4Bw1SnwTkav/13UHSemEYz03oIzfB8lo03i73k4E4RvkxPeSJOQPl3rd3WP3MT5YKEqbIvEJZECnEgQ/KNuiEtvUTZNMK4K+0CBy+yZJPCyKWVG9VA6m0i5Bc5veH/Nc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ferO+Drl; arc=fail smtp.client-ip=40.107.93.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ferO+Drl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnzbV8cI9LpgBK+UtQY/qxL4R0P1+pbQaAd55swlcG+SyrD9fMhD2qdLgHlliLQeRjBt+cir4VXiM64jQFjvFjA/cipcYhEKNeZpnYz0Ycuf2bIw/FjqBRTXPzvBPHqf9O0CeqAwgXh4RMiO1x6sydTcroLQUA4i50CcvNjLf8bH1JoXKf5ZY5mS2HkSD7sV0CdKiL30bORLIArRH40+XCFKkDfSNVtT+LjTxZ2NPgoW0Zr16BfbqhGqIAAN0IGVJN3Gt2cJWcIpNlSxjf0clHIcmRreRNyGzuGuf4fMb/R+pRatNK/LyVlxV+3hkgrE87/emBFTUzerAdqnnRDgRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/BVl2Dnm3KNJS0XaYfJeboM0+w9wUcov/Cww2p+26E=;
 b=Ehsm2aFjXXKpsQiZfu3VwfdWvn8drw4fA+PxH/SBnmPJX9hFVFMSkjgWfvkNDhy+GeF5sDkhE6qyGVzRXNwp+lIGdf6/EQBG0GfSJcbObu9Ayfr+zF6d/267X34TxssXAlE8CHiTIyqfg+x6o9tM8PtBmyw7FMOqr7NM80/J1nS2CuKHNDwPt0WvuWmLGNZQVmRYNV1l2cTQlze2N8FM1HmioaK2MR1REV/vuSkB/iJXW7HzGcOsKYdlTaqT1nCaxb2aZSAg1vL1N8P6cBv6gFQShGgVDcNgPjUqems1tcRsmx5M+CasJLTC0wBIejmiLyifpmq0QF5Xe0PaDm5zPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/BVl2Dnm3KNJS0XaYfJeboM0+w9wUcov/Cww2p+26E=;
 b=ferO+DrlBeYTMFK1W9QEv7je8K43jsp6xAKkjlOyVeLvQ9CX2XMwHnNI2lCm44iM1DJ7WPPk4npiPLEmbtVUTs5DXD1K/bWLnYM681Svqg9i5t2b30G3ZTG9cZRsdXPNVFZO7ONEtQXjVEaKDjwB8BhqvGpIHuQrihgR4D7/HcqtzJ8HcWROkpJNKGiJYS+wiHR8ol+yAoQYBKptqrwRfgsBhhimKFP2d/r055Kfo/ajL8/vdMLm5YeDIjhNNwHY/G87JSVcjBNZbF3y0XKmBE3ogtlnNaT5EZ9X4Sdloo9V1gXmF1OaxZwlxTYqRRaq33POfk4xJrTmbmfknxEelA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by LV8PR12MB9270.namprd12.prod.outlook.com (2603:10b6:408:205::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 14:36:32 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%5]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 14:36:32 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] sched_ext: Make scx_rq_bypassing() inline
Date: Wed,  4 Jun 2025 16:33:13 +0200
Message-ID: <20250604143547.708202-4-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604143547.708202-1-arighi@nvidia.com>
References: <20250604143547.708202-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0216.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:6a::7) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|LV8PR12MB9270:EE_
X-MS-Office365-Filtering-Correlation-Id: 192dc0df-c81b-4ef3-1295-08dda3753364
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F5dT70fNOetRtTXe0wOhkg8ph9TT6hZCSZoFQntYz6DVDvp985vpYfwgv0IJ?=
 =?us-ascii?Q?T6LrW9Pd+M2bvf2K4MA/N8JlE02yX8sp6PdoZ+727sxEBl6SuJ0fa34UNjrE?=
 =?us-ascii?Q?c0SOawlDL9YNPNiSvZ+CuoqPSh1uTGI3g6BT8P8TmX5iWM6hi7fi03BNIwME?=
 =?us-ascii?Q?CIufOcDt8FzHqRIAl+ETLwHL2kZa/UD270yGyj+7Zue2vuFrLmI6WQ4SHIV+?=
 =?us-ascii?Q?ykgQHnjIjzsWB5gWrUXaAmGj2QDMdaYaVhRV3BmIi5rn5SnkzOTmBPiR0TCl?=
 =?us-ascii?Q?lBUmlthkqjv23zHEM706HvgJEx+7L7pzTcKt1WL7kDIo7d6nnXqpqp0gmMJf?=
 =?us-ascii?Q?Nu2QKx5jIeohtcdSSjEOEdR+S7WbqMw2i5f4IZgyG4KbIznOh8sIeNR6gXFQ?=
 =?us-ascii?Q?9uCBJl0U7KWtKl+sLdJ4iqYv3cIlItjvHrjGR9bHpo/J2fROQG5NVuOde5xV?=
 =?us-ascii?Q?C75XgAir9u5DEQq6+7+o/KJ+WLp/fq+bM45TbKSK2N2r3CSUiWh1JmZYvMIX?=
 =?us-ascii?Q?LKQSSKsulBaqD4m2FcFMFNrdOdhmF23M/o7TWiQOCTsrHvh5BVzNnvgQjkuk?=
 =?us-ascii?Q?wmOdoF6SkO3eRlvgWb/XJxTs+zN9AVw6JXwhlAIQLEuJS4Gjp8f3ich7JrJi?=
 =?us-ascii?Q?ggyxrSCV5gmI9fHASSngBwT/GZQjaP714+dRZ3AW21IdxFzannmm+dJ0YyqX?=
 =?us-ascii?Q?wmD/YDScUmLAIK98rjxDKUMg21qPMEDs0rADOCok4INJgYNSNvfoNMpwwW66?=
 =?us-ascii?Q?xj7TwhF5/uparuKJxENRGjsaK8j4+MU73kTfmpZQCO2709OmTTqU5wyymbAN?=
 =?us-ascii?Q?2sqPQtnOl0NvCc01ow6RbR4qz5AL1Rc64Y0LIRpDgF5DCSCW/n291Lv1h7V7?=
 =?us-ascii?Q?5axgqJcxqsnF42IFCseDJlNaG29EEe6drhHDFvbUd7dC9r0WjN3+InOLYUo2?=
 =?us-ascii?Q?CCW01Ix264Z0nJfUPLvRpIeKJH3mjEEJxYzZZ0Vcqf/7mIXKZf3+L4z+Txtz?=
 =?us-ascii?Q?2s66H7mmrkAP68xnjOrrkWm6ERHjuyI2Lekk/IRUtq72yokrQbritp6KSTlY?=
 =?us-ascii?Q?ApjJin1yXIB1tE5Se8FooytO/ksWNgSkrSlMfYevxlWdbjPk/5WNwfkLMIk1?=
 =?us-ascii?Q?mnyecmUAxm1fymBlnUwlEQFY5DiocykcCV6m3Rd78NbJdfbSNHMcZCyVLOpA?=
 =?us-ascii?Q?ymC51XC2PTYxZtZVmAe1Q7WDg+WY4ZtCKURCRpNvm32KDZ2zFnj7kp0QIkgV?=
 =?us-ascii?Q?nJ/avtCX2xaAnKJORzhHoNGoYaqQNMVeWznAr+mH/yvjJ9ckwtroAxYjE/aS?=
 =?us-ascii?Q?/V0QX+VPgYVwc0MYiPkAvqRFmT871EDrOKnqpAmbvxU4V1xO0ETiWPt16Hti?=
 =?us-ascii?Q?gaugEilzbiBaXLLCU12xZqctzYCtGtJUGR9LbudKU5sJSlHB9w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8myrZtMzDTDThob9KJXqbzRbB9TeGPtuAnlPWb5KCjFcde3Zyi4DUQmqwJV9?=
 =?us-ascii?Q?R7mD0CuReMb4+FQ5Am8iTfFYj8ELbEohVO1Owaj/HozjV0CebTs3qbejB3VG?=
 =?us-ascii?Q?PDCHVa8FH8AvS55lbi5H9C40Bf9paUmbrLL5RqJM6CGZbVWwy7cd0BLSmv1F?=
 =?us-ascii?Q?1G34IMoG/mfuPWOCtwH3SA5WTlBFzwgUzFc7i+Xeab2r8jiwOhRJdn1nvAym?=
 =?us-ascii?Q?a7cpZl8ZSMVUfoCG5xAbWVm0rWJRoAY9TzUZwbIBrDNBbkRatWLQhVLsj+2H?=
 =?us-ascii?Q?hTYOZqVNSI1Oa+3Rn4IJibts1TbbU8sdtyGwps1X00DRAG/NSQbhFa9at305?=
 =?us-ascii?Q?vrV+bmY3hhayh5JojvIsWDqZHsApypKLUZbvlhMy4iOdWpLFh6/w1DqOUX9p?=
 =?us-ascii?Q?DjoFD8o53NG6wKXWq2IEB6QiCUngs5zmXSRpSUNkMAHY7FPdLVedyApI0/y1?=
 =?us-ascii?Q?uNdUkiIJh6/iWpwx3LPUBzOAqlG/nRvNs2nId5PNWo0ScKW1EuNmKA4ootPf?=
 =?us-ascii?Q?QLmwGdoGJadp68FRNfJKEYqIWFh7h9lCo8+ip9EL3GWiX5sCstR/UBX6DtPT?=
 =?us-ascii?Q?LbAZfT64S1dCeAKuua30apm0y7/mxV9eaIPbxh3uJk3GAtAZ2zY/KzC3NjH6?=
 =?us-ascii?Q?qBPP5uSd5WHrneVmhGtCBvfBDYiDHQ8oAKRV+GlTlLqFE/yttKIc8ft+1ale?=
 =?us-ascii?Q?0/CSbAVA37oQMMHRqq1ED3S3hjgw4o1u4uPc2e2b1MThS3SCB0qofjQ0KeLe?=
 =?us-ascii?Q?Wh5VAXHikR6Pi+cnFUuEIdI/nbh2rWsf36hoeZGRin62UHnAB9kD9YydGDgL?=
 =?us-ascii?Q?cZNob+5doiaIJK7H1cYQ30fumGvxohmbNn5FQfBzgvbtkqu/OzeEPpC1WWNq?=
 =?us-ascii?Q?QM23fMemyDGIXiwDnEKYh9IXdPQ9XmL3BW4pNBLV2NEpm0y/NqjGeJqPjOuZ?=
 =?us-ascii?Q?+gqtNhWyxoGKy91bR8HI4nguF7wU5TttgMaPddqA7sA9mfJ+BspJRnPNPcbm?=
 =?us-ascii?Q?8mWrqDT8ywP4PfYmTAugmKEI58yHJGaPZ9fC5HCRHDfPGa9wRPvYlxmDncM2?=
 =?us-ascii?Q?+683xq5zPS6VziRsNNP+ZbHKzoJ1rWWx0q6IVjRD+5a3wLYutD9iq4GIPt/j?=
 =?us-ascii?Q?wyRJgHmtDp2xORKQlyFa52k2enzeTR33sObUjYh1h3FOH+L1qPfG+ko0y0Fh?=
 =?us-ascii?Q?2GIS+Ml+fwOWR7Qc3LGtK5qBf3GrerQgrJ1LrMfrpUybaxn+LJEy0wR3WV1Q?=
 =?us-ascii?Q?LLmgJ+r/m/yI0yHEvbsPy0wh2YtRrbDYrA8ONjE3Vb+iHLIGnK1+pNtJ8JPp?=
 =?us-ascii?Q?obR1MpyBCQ7uOacodqeD/+2Drg3dlm2EMx637Lb2uD6wTldDdBUzqtt+Jo4P?=
 =?us-ascii?Q?tuEJAbNr29tVgLD8yeI9IlI9xk/Kmm8h6FAGdCwuYHesznzYxGiC/nUTshPx?=
 =?us-ascii?Q?dJSwCnaKRmHYPcTBLW9FfWDdlt8r7WqST3r9qIbqbTEbLbSPO0+BhYlPI3i8?=
 =?us-ascii?Q?ZLy/KZf8ZhLNm3VoDdx6VDRFdsshj8xZ9k2zymOHS/api+NDPcNFP7NeG79T?=
 =?us-ascii?Q?xXgNv+Voj+jgv/Os9+q5TqQf540UcLhcUXAakwP9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 192dc0df-c81b-4ef3-1295-08dda3753364
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 14:36:32.6282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iI0t8ifT02FQdxXQ2jyE7myICyzS9eU/mjLbtFWLbgSCo5HK6zVPfAUvBwwU9DUBQzlvgbo3CnxG7ytRMmdgLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9270

scx_rq_bypassing() is used both from ext.c and ext_idle.c, move it to
ext.h as a static inline function.

No functional changes.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext.c | 5 -----
 kernel/sched/ext.h | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 2c41c78be61eb..3e483138dff60 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1701,11 +1701,6 @@ static bool scx_tryset_enable_state(enum scx_enable_state to,
 	return atomic_try_cmpxchg(&scx_enable_state_var, &from_v, to);
 }
 
-static bool scx_rq_bypassing(struct rq *rq)
-{
-	return unlikely(rq->scx.flags & SCX_RQ_BYPASSING);
-}
-
 /**
  * wait_ops_state - Busy-wait the specified ops state to end
  * @p: target task
diff --git a/kernel/sched/ext.h b/kernel/sched/ext.h
index 6e5072f577718..d30f2d1bc00d5 100644
--- a/kernel/sched/ext.h
+++ b/kernel/sched/ext.h
@@ -13,6 +13,11 @@ static inline bool scx_kf_allowed_if_unlocked(void)
 	return !current->scx.kf_mask;
 }
 
+static inline bool scx_rq_bypassing(struct rq *rq)
+{
+	return unlikely(rq->scx.flags & SCX_RQ_BYPASSING);
+}
+
 DECLARE_STATIC_KEY_FALSE(scx_ops_allow_queued_wakeup);
 
 void scx_tick(struct rq *rq);
-- 
2.49.0

