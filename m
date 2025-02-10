Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4141F461F
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.143.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204091; cv=none; b=HvzCdxAaTPayyWAGtqMo2318sXuFKqzIoxv16El3IOdonlb60PG3/xeD0z1TjdQmR4LSMJElLEJ/ktW/qcIEypvtmrj7GUnkx8gUWqkILI/LnUpRJJ3vngMTtXYQCwKjpZP4aKQkLXSdxmwIat5JnD4V1+zQ5vJyEvUgC+X3WXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204091; c=relaxed/simple;
	bh=qwYTI557KQZ4vsq4O/7dfj22euJexVNTXxloAQOdXH0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qp3p3zyp06dcBllCS9ROlKrXwT5KREBFPz3pBD6ppJ/pt32PcROzna1y4C4lUQuSlxPbO+iQenIq2nJy7drpbv6nqSjZrM/cbl7E1JjcmbjdGrLZahn+T8cdRGApxYMwh6jIjtQS/WIK3YscKrrg70rLoVhf/T4IF6suqA/zUDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=c+CCF3O9; arc=none smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="c+CCF3O9"
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AFQZgF006794;
	Mon, 10 Feb 2025 15:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pps0720; bh=0Mc7n8wH7ZJROKjtp+CvE1//4XbuPoM2w+fQt
	IEyTnI=; b=c+CCF3O9ZMQGOqFTvakZDxOn9pAO6KtAdLYuBpJoZdBMVszh1edEY
	svXL0K+ZPLnrMgG7bfP0Tn8lDKZ1dZVaYcKi33nl5WVaMOqH16JrA7GBHOlWIBbJ
	UmejcwSquS/50JubfQWp0CKBCOtI3p5OptLcyaddpjPi96/0f4VYWHmJ0vy8ha5K
	AuRe52uESuV/5vR/jIEsMjtVkHcY9QxE8rC0+JZDxDUKA1CmVfvIjk1Y8WnwA/Uw
	9kKi7rhDRU2XOsWqwaxNPNgCJpAo7XkZYO+8Vvx3NM4V5BE2pyn2xG8n1oV7B7SO
	PSWqYaRh9wsG5zkSWWi8DxBTOBm7yGvqw==
Received: from p1lg14881.it.hpe.com ([16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 44qm3t0443-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 15:43:03 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 9378B804DF3;
	Mon, 10 Feb 2025 15:43:01 +0000 (UTC)
Received: from dog.eag.rdlabs.hpecorp.net (unknown [16.231.227.39])
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTP id 2D26F80BE3E;
	Mon, 10 Feb 2025 15:43:00 +0000 (UTC)
Received: by dog.eag.rdlabs.hpecorp.net (Postfix, from userid 200934)
	id 5C8C1302F4802; Mon, 10 Feb 2025 09:42:59 -0600 (CST)
From: Steve Wahl <steve.wahl@hpe.com>
To: Steve Wahl <steve.wahl@hpe.com>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        linux-kernel@vger.kernel.org, K Prateek Nayak <kprateek.nayak@amd.com>,
        Vishal Chourasia <vishalc@linux.ibm.com>, samir <samir@linux.ibm.com>
Cc: Naman Jain <namjain@linux.microsoft.com>,
        Saurabh Singh Sengar <ssengar@linux.microsoft.com>,
        srivatsa@csail.mit.edu, Michael Kelley <mhklinux@outlook.com>,
        Russ Anderson <rja@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>
Subject: [PATCH v3] sched/topology: improve topology_span_sane speed
Date: Mon, 10 Feb 2025 09:42:59 -0600
Message-Id: <20250210154259.375312-1-steve.wahl@hpe.com>
X-Mailer: git-send-email 2.26.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HsAcsjsZcTHf9YXSbGPsvSfeBKLbUVUe
X-Proofpoint-GUID: HsAcsjsZcTHf9YXSbGPsvSfeBKLbUVUe
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_08,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 malwarescore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100130

Use a different approach to topology_span_sane(), that checks for the
same constraint of no partial overlaps for any two CPU sets for
non-NUMA topology levels, but does so in a way that is O(N) rather
than O(N^2).

Instead of comparing with all other masks to detect collisions, keep
one mask that includes all CPUs seen so far and detect collisions with
a single cpumask_intersects test.

If the current mask has no collisions with previously seen masks, it
should be a new mask, which can be uniquely identified by the lowest
bit set in this mask.  Keep a pointer to this mask for future
reference (in an array indexed by the lowest bit set), and add the
CPUs in this mask to the list of those seen.

If the current mask does collide with previously seen masks, it should
be exactly equal to a mask seen before, looked up in the same array
indexed by the lowest bit set in the mask, a single comparison.

Move the topology_span_sane() check out of the existing topology level
loop, let it use its own loop so that the array allocation can be done
only once, shared across levels.

On a system with 1920 processors (16 sockets, 60 cores, 2 threads),
the average time to take one processor offline is reduced from 2.18
seconds to 1.01 seconds.  (Off-lining 959 of 1920 processors took
34m49.765s without this change, 16m10.038s with this change in place.)

Signed-off-by: Steve Wahl <steve.wahl@hpe.com>
---

Version 3: While the intent of this patch is no functional change, I
discovered that version 2 had conditions where it would give different
results than the original code.  Version 3 returns to the V1 approach,
additionally correcting the handling of masks with no bits set and
fixing the num_possible_cpus() problem Peter Zijlstra noted.  In a
stand-alone test program that used all possible sets of four 4-bit
masks, this algorithm matched the original code in all cases, where
the others did not.

Version 2 discussion:
    https://lore.kernel.org/all/20241031200431.182443-1-steve.wahl@hpe.com/

Version 2: Adopted suggestion by K Prateek Nayak that removes an array and
simplifies the code, and eliminates the erroneous use of
num_possible_cpus() that Peter Zijlstra noted.

Version 1 discussion:
    https://lore.kernel.org/all/20241010155111.230674-1-steve.wahl@hpe.com/

 kernel/sched/topology.c | 83 ++++++++++++++++++++++++++++-------------
 1 file changed, 58 insertions(+), 25 deletions(-)

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 9748a4c8d668..3fb834301315 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -2356,36 +2356,69 @@ static struct sched_domain *build_sched_domain(struct sched_domain_topology_leve
 
 /*
  * Ensure topology masks are sane, i.e. there are no conflicts (overlaps) for
- * any two given CPUs at this (non-NUMA) topology level.
+ * any two given CPUs on non-NUMA topology levels.
  */
-static bool topology_span_sane(struct sched_domain_topology_level *tl,
-			      const struct cpumask *cpu_map, int cpu)
+static bool topology_span_sane(const struct cpumask *cpu_map)
 {
-	int i = cpu + 1;
+	struct sched_domain_topology_level *tl;
+	const struct cpumask **masks;
+	struct cpumask *covered;
+	int cpu, id;
+	bool ret = false;
 
-	/* NUMA levels are allowed to overlap */
-	if (tl->flags & SDTL_OVERLAP)
-		return true;
+	lockdep_assert_held(&sched_domains_mutex);
+	covered = sched_domains_tmpmask;
+
+	masks = kmalloc_array(nr_cpu_ids, sizeof(struct cpumask *), GFP_KERNEL);
+	if (!masks)
+		return ret;
+
+	for_each_sd_topology(tl) {
+
+		/* NUMA levels are allowed to overlap */
+		if (tl->flags & SDTL_OVERLAP)
+			continue;
+
+		cpumask_clear(covered);
+		memset(masks, 0, nr_cpu_ids * sizeof(struct cpumask *));
 
-	/*
-	 * Non-NUMA levels cannot partially overlap - they must be either
-	 * completely equal or completely disjoint. Otherwise we can end up
-	 * breaking the sched_group lists - i.e. a later get_group() pass
-	 * breaks the linking done for an earlier span.
-	 */
-	for_each_cpu_from(i, cpu_map) {
 		/*
-		 * We should 'and' all those masks with 'cpu_map' to exactly
-		 * match the topology we're about to build, but that can only
-		 * remove CPUs, which only lessens our ability to detect
-		 * overlaps
+		 * Non-NUMA levels cannot partially overlap - they must be either
+		 * completely equal or completely disjoint. Otherwise we can end up
+		 * breaking the sched_group lists - i.e. a later get_group() pass
+		 * breaks the linking done for an earlier span.
 		 */
-		if (!cpumask_equal(tl->mask(cpu), tl->mask(i)) &&
-		    cpumask_intersects(tl->mask(cpu), tl->mask(i)))
-			return false;
+		for_each_cpu(cpu, cpu_map) {
+			/* lowest bit set in this mask is used as a unique id */
+			id = cpumask_first(tl->mask(cpu));
+
+			/* zeroed masks cannot possibly collide */
+			if (id >= nr_cpu_ids)
+				continue;
+
+			/* if this mask doesn't collide with what we've already seen */
+			if (!cpumask_intersects(tl->mask(cpu), covered)) {
+				/* this failing would be an error in this algorithm */
+				if (WARN_ON(masks[id]))
+					goto notsane;
+
+				/* record the mask we saw for this id */
+				masks[id] = tl->mask(cpu);
+				cpumask_or(covered, tl->mask(cpu), covered);
+			} else if ((!masks[id]) || !cpumask_equal(masks[id], tl->mask(cpu))) {
+				/*
+				 * a collision with covered should have exactly matched
+				 * a previously seen mask with the same id
+				 */
+				goto notsane;
+			}
+		}
 	}
+	ret = true;
 
-	return true;
+ notsane:
+	kfree(masks);
+	return ret;
 }
 
 /*
@@ -2417,9 +2450,6 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
 		sd = NULL;
 		for_each_sd_topology(tl) {
 
-			if (WARN_ON(!topology_span_sane(tl, cpu_map, i)))
-				goto error;
-
 			sd = build_sched_domain(tl, cpu_map, attr, sd, i);
 
 			has_asym |= sd->flags & SD_ASYM_CPUCAPACITY;
@@ -2433,6 +2463,9 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
 		}
 	}
 
+	if (WARN_ON(!topology_span_sane(cpu_map)))
+		goto error;
+
 	/* Build the groups for the domains */
 	for_each_cpu(i, cpu_map) {
 		for (sd = *per_cpu_ptr(d.sd, i); sd; sd = sd->parent) {
-- 
2.26.2

