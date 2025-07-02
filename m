Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D338C24DCF7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 23:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751499021; cv=fail; b=iztFwidCE/9tOVeFJgyeNIpRjuHPxJ1krYCtmkf0bCzIdIDN4IB+WgzZzJl4PGuvaopAOGAnxob9ZNfslYdJsgfKvVlyhWkCRm4Bzv4nOpgUZ77wbKhUsE054AqOS2+CL0KqKnGL3o8G2tQoLQRdaMNtXBL47dO6OXqQESbxi60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751499021; c=relaxed/simple;
	bh=dx2qd2N6vXy8Ln0zl0hedDnbBFz7S9ktaZPxWmXyEw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NiikddJTYB07YNJJI3xtXI6IRlVE2sOP3l96gRKxcmimN8TrR4EpnLmH7fJ4Iizu8ZiRfxIJlB79WxwBcMwzLD1BZqNWKz3AIB57rUjGkaGLoYwE43tBtb7RRqmJU/rdsszgk1P5Hsl0sqZbb3B8zrjWdfQ7ekR6neGZrz2CJxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FW9xrS4h; arc=fail smtp.client-ip=40.107.223.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FW9xrS4h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=et42PELQElF6CLcDmV4ZuuhZx2InwODRZGLPYwIk5I2uvPlvwmjLFDpPg71texzPPThyn5StL1+rdf4LuxBlJzI1O4n3nvV2xdQwfm+UyjC2aUGNn5g+43OgGZC7P4FnjQfycEeazgTA0MrjV9de2+M60MkXkiVfagsUem1Kpo3fLWl7JPIBlYC/tVYzUW1xwMd4wvFjAAKbUBWHXG90mfIp/7f/M/viPt+3I+G9PcajZJoO6RH2G3mjONZA4Tm+II/EBycDagLrH3Vc0YdjwrTS4aO68Sg0RMRLw0AeAeeGH6SQ3ZsvuFRwkGy00IM9FoIAjNeqMzxuNY9Q3tcOsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEnBqv2LQ1qGVZj7lybCtlQb2+soYleZwctmioifFB8=;
 b=C3UvZraQCTbivaINMXQrajaf7d8uuUVSN5jEH89mXbAP+oUWGKEn7g3DblAZV6GxspIRWPKciCV5v2VQ6aGGmdQ0PFDMOozx7kZtaba+wuZTKFBz8jgmLkn8PntyPqusMrQ4pJyznPtqGrOiklFaOGdVTSInr6hi94BVypYgrT+e/peSYnwwGZtpuuRF43bjMqMFfIyTfq0En8nDvsPBaE6JHOHluLwsPwOSn+pOk0vxHN0XUNMhwRPc635ANSvq0vDwLPeYHEj+LsiaWDCKrrabw82QxiMGAXkgGlrccBWqh055Lje58rDY6bt2viiTk81w5LVCnPQ8X1V2DTLu/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEnBqv2LQ1qGVZj7lybCtlQb2+soYleZwctmioifFB8=;
 b=FW9xrS4hHlv2uVCTCXOBhRBP3YOOTIppivUaF1aIpOekH5LI3QQHzWGU+hO1xaj/DaBU+WKejB3W2IU1Q5Rt5udEFn0Ms056KuoJAR9fU3GoDdx2wfRmGBjHWVJ+SI4+jQ2TumXT2Wuj6RGA0JHHLjL+X90fmpRiSkmMfCVQ2rLz2IdMtglBp0IYyRG07rXzmnj/K32gE+nE4sOC82CAjVXh6SYPseJLzZ2qZhjXHfp7eg7H+PtO2eIiG+Koz7PVhq6Ezn5lXnbLi3BU1CI0FIkq1sw7yY2B4w6Y6l5iLcUqvlgoQ/1HI2nD9e8XTbwoSis6gOeWayVeUgA0h5R2Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW6PR12MB7069.namprd12.prod.outlook.com (2603:10b6:303:238::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 23:30:15 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%7]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 23:30:15 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v6 10/14] sched/deadline: Add support to remove DLserver's bandwidth contribution
Date: Wed,  2 Jul 2025 19:29:35 -0400
Message-ID: <20250702232944.3221001-11-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702232944.3221001-1-joelagnelf@nvidia.com>
References: <20250702232944.3221001-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0191.namprd13.prod.outlook.com
 (2603:10b6:208:2be::16) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW6PR12MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: 6147de9e-94a5-476a-12b8-08ddb9c0663d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sViz5eD+a0v0c77xYaBIBPlMypyoI+0EwVLSh6vJsgIZNXp+XIjfMvUEK48h?=
 =?us-ascii?Q?IDTE/hLYUmycxfpjdx1PmFRls13DX6XN8JnfOSsRoXIXbr9cNDAp3m888eLo?=
 =?us-ascii?Q?KMgmO2rlSpBsGGxWPY2go6Hhhj0ISkAOgTJJlCiom+gDc2HolFqNyML3SH7t?=
 =?us-ascii?Q?k6AjbIUWky547TlLJ3fINouGgMh8RBic6SCj7IQqIOCqBFXeIq7sLytwp2/C?=
 =?us-ascii?Q?NS1C7WqVPZVnAZpSU/3kfGMs6eF5Jc29PbmqBSagdsG1nysiFxEPMCwOGUu/?=
 =?us-ascii?Q?hLCVaeaPZs8I5yxPugrtYntI2ecifH5ap+b2cQQ1LCZuNgKLzXQH1XkXUoVT?=
 =?us-ascii?Q?xnQ9TTR3Kbp6TJ630SG/nrSMhauRtprO3P2oTtYD97N2fIkZMnBFO2fBEJDY?=
 =?us-ascii?Q?rMeMKGJUwyjEXMfzm+lOOuWNb3pfdxJCNlEjeVaObpd5J5UD0kGtxqxgq49M?=
 =?us-ascii?Q?FfG5ZNRbtgenT7CAY6D229HuIx3r4FmML+CqmdV9D4I/D1teZ1Tdj+XYUSDK?=
 =?us-ascii?Q?xN4nBv9GGM9lFOsk0tYzt+oht4+amSnzE1Kk4xpmy0DaAJqM7nBJ8k/+I4Av?=
 =?us-ascii?Q?OJ3cC079A39yI9v+sxb83o3d8TH7j/fGXQr/0Gl5vVxoiVtfhzReeOavS9Dc?=
 =?us-ascii?Q?FnTzXVmSO3UpTwrtYNFOULuTYDAGGBjKzhGNnUkEv34hZeMl9b6hc2L2Bbtt?=
 =?us-ascii?Q?KHD47XRHMCknd14khMbpMiPuT9amDPnwSIIWO9FXJyPBWjtk1HO5VHSdAbXb?=
 =?us-ascii?Q?o9k4XcNIXgO7oBMxeY5tGv1j/EklGDUvI1Y1bJ1d6M6uQvKPZOMpz/boPCfR?=
 =?us-ascii?Q?Vtvbc8tbNB9jsjETYjJ0BnZhZrNsdDl9DLIEAJBXuLFVEY3ojBIimX1xC8Zl?=
 =?us-ascii?Q?8QwxCWqUZbadH+imSZ6YBEkyAvR2PiZctC1/3omJui0IHGKbXEFN41z9sQhi?=
 =?us-ascii?Q?NFkYAeBiudEincLHk7Ecb6xE6oPw8AjI1vVuImDwf0L3UoqtwfBjrRZfUPSe?=
 =?us-ascii?Q?V++WQ/K+lhvnB025r8PbG0kGxSGae5s6rpTnJvCeWjAegl8ApO/VDIH9ht0J?=
 =?us-ascii?Q?MdLMTXtNW46ef3fg22WlQ5FCCxaTwPMx700Ev58i6HWyjh3V8yuZppMwHZjC?=
 =?us-ascii?Q?eWa2287aNYEcB+oLck5sKffiN4Y4DbJBlXRBfjpLkT8US1hs9aiKyeXNzlGP?=
 =?us-ascii?Q?wR1nTv6x2x6/ssoZTW4KO80aMiVCteggtHEyDyCNwS/YEwojFHRW0F36GqCl?=
 =?us-ascii?Q?z38z5E0Nmckvm851lBIYy4CbRFPEF8A6Yp19uXpSl1z7ScLNIk3ryIPENscc?=
 =?us-ascii?Q?LsWH/ePO7LZyoE9BGyqtomzGQEsvsst6RqY0B9Vk1OuqmqrKleRtWxtY1F4Y?=
 =?us-ascii?Q?AJp5NsmBxfvqP0rH3iYArETjIEK78qabgBXhoI3rAMSVjBpiPoscGLt4m9wI?=
 =?us-ascii?Q?SvXgHwj2+uvn4K9u4ELUbQCD9qmsG+V2Fhr81+byxMEXSG5xe9X2aA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OHUgVy5Lynf4MmXlaeyQbK9yfn10pWCEVnQ1lxoIs/zJRV3P7u3oSRHF6Dq4?=
 =?us-ascii?Q?NVLu9sPOd8YH+k1r4IpjQb9N0xVKpFLXk9A27j31O/Vf8+CplI4QPdmyGqEo?=
 =?us-ascii?Q?9Gk05cL8ycadMh64JnJ7o0RVeinC92XqX3NFNGEdEUNWHYawZjj5BFy3Xf4M?=
 =?us-ascii?Q?pATq4+lQvnVorfdYB7+be1ERgkCIJ8bGh6Z63dSr0b5sbGz4fJw1ZpuJry1E?=
 =?us-ascii?Q?beVSpah17QeP/1Cf7dJ8emfV706IL63+vr4oKUPIDncPo3rb8Uy0bt7WTKOB?=
 =?us-ascii?Q?sF2SijS20EQ54EML4DJXfqkk2wpUew/emfpSIgSy+KhMojC47ImhvlfZDNuy?=
 =?us-ascii?Q?Gvvqn7eXrijNzMyKbv/A4IabKIE2kwkwxEbNDSihfXE4NRnLC62+HAXfojy5?=
 =?us-ascii?Q?caiaZ2wEZ37/N/8yNuMoVYev33AAmXQKFf5/e+g6qcZMpN4yiLE25bApZdUQ?=
 =?us-ascii?Q?ySt/EwzirgMoiGtbfF18sFvcu8/tCgzLVSTGa59L97yauVebKeyZMwvVs60N?=
 =?us-ascii?Q?uS0tEOh2r67YKzj1touxgHDvVPascrBYK1oq6X3G1U7x2Vl1chC42ksXyoB1?=
 =?us-ascii?Q?8U2NoqV9xe98omftbEHXODVTrcT98F2ivsyr5fVYyZCdhqTD7TtKIirPjOwB?=
 =?us-ascii?Q?LXKg3Uuah/tnviITm3pIgFnZj5Wz0cQ9PLY/66VDvv4v1l8WGmDWknzCqUYv?=
 =?us-ascii?Q?v5EYyfrbR/mLdb89ms5L2nhTyybxwVlB8TMF0CUBxlC2soNqGeO41/2zQdSX?=
 =?us-ascii?Q?c65ovqvrcEkYRhcNvHlHxIXGiT5h8FKb2F8iB7dNAqduxftIx25h1BNcLOJG?=
 =?us-ascii?Q?JAOdGEmKrPgfml42W4E4LOkdSX38Rbvkoop+t+CeWMUy3qO6jt1KY4m4x62x?=
 =?us-ascii?Q?V/Bz3W/HL4bdguTiFkyOJGQoTFkbj7wvMlFqB2lzsUz3bAvd+iALLKgjunYX?=
 =?us-ascii?Q?h35ZJ+qKKkEJ+8KIYUJlpH41zCCwIDxwCqg5OnpepIV0yU/tjQX6u2A/YUZW?=
 =?us-ascii?Q?WTmZXzvudrCQ3T17lZc9epPSg3lN3kJoguuBEQ0DYbjgr/ntFl2cGoFWjG3L?=
 =?us-ascii?Q?rUn1/Bxla8t/OvJwxf3yS9PCJiWlKpsDv+orw/M3l7+6yqMjYbRN0LIDS8bM?=
 =?us-ascii?Q?iWJ0pHDiPIufiywzwb6wDQNi9q9ZqOLUGwOQ3Egqf84fZBDDIO56bbZUkA8T?=
 =?us-ascii?Q?5N/DX+fJLFMgoOms8Zt70Y2P1sdys9elPG9XyL/ldg2NzlbV96DM502dXwym?=
 =?us-ascii?Q?dXfNWXdpdQnHoHtaihX6CUgQs1Kq6Z6/37Fgldot7hOy8fZxVuAoe57re0gD?=
 =?us-ascii?Q?Zpo3HErB/B1PMAOy4LpWzkXbafT+5EDlJ8TUh1j0CP0eIW1X2T5t51ZCVeMD?=
 =?us-ascii?Q?aI3lXcH2aNC7wIx21u/V0Z6cJoJAZ60W9TUCI/almT/o11VHGLxf0YmHHIOR?=
 =?us-ascii?Q?X4JkWLoNatNf6Kpxq4oWfRmlQLrDpGU9WePjtckPicq+fzpc8Ti6rmsiYcft?=
 =?us-ascii?Q?TFZ3qmbgch9OpVnEFb+37GnLoi8eLWRG7OD5or5b2s18lnJsvatl0qCs8Z4Z?=
 =?us-ascii?Q?Azl/YfPrnXKqg17wzf9EQCvy7NFveht1+iQLtDfy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6147de9e-94a5-476a-12b8-08ddb9c0663d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 23:30:15.8153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jawcTvc/YiK4n+rFGG7Jm292QoebL3yxwUmIs867bM4YkPA+9yCMpf8smgOHT5Jcg4aDilqm4zv74wttSFwR8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7069

From: Andrea Righi <arighi@nvidia.com>

During switching from sched_ext to FAIR tasks and vice-versa, we need
support for removing the bandwidth contribution of either DL server. Add
support for the same.

Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/deadline.c | 31 +++++++++++++++++++++++++++++++
 kernel/sched/sched.h    |  1 +
 2 files changed, 32 insertions(+)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index b7f1724c54a6..aee1aa6c74e8 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1744,6 +1744,12 @@ int dl_server_apply_params(struct sched_dl_entity *dl_se, u64 runtime, u64 perio
 		dl_rq_change_utilization(rq, dl_se, new_bw);
 	}
 
+	/* Clear these so that the dl_server is reinitialized */
+	if (new_bw == 0) {
+		dl_se->dl_defer = 0;
+		dl_se->dl_server = 0;
+	}
+
 	dl_se->dl_runtime = runtime;
 	dl_se->dl_deadline = period;
 	dl_se->dl_period = period;
@@ -1757,6 +1763,31 @@ int dl_server_apply_params(struct sched_dl_entity *dl_se, u64 runtime, u64 perio
 	return retval;
 }
 
+/**
+ * dl_server_remove_params - Remove bandwidth reservation for a DL server
+ * @dl_se: The DL server entity to remove bandwidth for
+ *
+ * This function removes the bandwidth reservation for a DL server entity,
+ * cleaning up all bandwidth accounting and server state.
+ *
+ * Returns: 0 on success, negative error code on failure
+ */
+int dl_server_remove_params(struct sched_dl_entity *dl_se)
+{
+	if (!dl_se->dl_server)
+		return 0; /* Already disabled */
+
+	/*
+	 * First dequeue if still queued. It should not be queued since
+	 * we call this only after the last dl_server_stop().
+	 */
+	if (WARN_ON_ONCE(on_dl_rq(dl_se)))
+		dequeue_dl_entity(dl_se, DEQUEUE_SLEEP);
+
+	/* Remove bandwidth reservation */
+	return dl_server_apply_params(dl_se, 0, dl_se->dl_period, false);
+}
+
 /*
  * Update the current task's runtime statistics (provided it is still
  * a -deadline task and has not been removed from the dl_rq).
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 576b69cee6b1..13dc32a6346a 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -393,6 +393,7 @@ extern void ext_server_init(struct rq *rq);
 extern void __dl_server_attach_root(struct sched_dl_entity *dl_se, struct rq *rq);
 extern int dl_server_apply_params(struct sched_dl_entity *dl_se,
 		    u64 runtime, u64 period, bool init);
+extern int dl_server_remove_params(struct sched_dl_entity *dl_se);
 
 static inline bool dl_server_active(struct sched_dl_entity *dl_se)
 {
-- 
2.34.1

