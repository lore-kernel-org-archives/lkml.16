Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F2C1B07AE;
	Mon,  5 May 2025 20:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746476861; cv=none; b=BOTInNqBfP8lf4AVD3cB5A1Amlbj+IPGDjvaUDKzpsJsoOWGAREeurU7bJnSlLS2p8IG9PqKXEeY/VXKJsWnhiah+2oVCKiRCuYc+AClM7X77d0gwKyAgnY/pVZcSvAp8/2v9P1spP5JmdbSIQKTdZN2YHYAB+OfEETHTFLccT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746476861; c=relaxed/simple;
	bh=GZI/2kXleNIKAhFS6SRpG5Ac7biLKJWtwxngru8qIYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e/5hxFlioBHIjtFMQWhvcibIZGjAMZjIQmq1bONgA0B60NQy4XkBt9RIYPB1BcnJUZihS9GmhNO1uhFDbZpsqf5TbR+tVn8XSwVmLIxGJnZq3MbtkYTYoJr4JfeXKWKyVaWWTWRvzCYZyptw7bB1CHguAeKPDb8M3Rt2ezqgovo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kmn94N9G; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kmn94N9G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746476860; x=1778012860;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GZI/2kXleNIKAhFS6SRpG5Ac7biLKJWtwxngru8qIYg=;
  b=kmn94N9GHfdRaMYP1LOoellP7lNAsMVMyHKcZxxFS7dXVt2QcfHwwJrt
   zfvdwQrOZx04604drG+U/SQIO/RwdrdM0r8pgA/eAl0Ji3kt3piCnJlFG
   c7PawjvUEJ5Iot0N/s8pHF4Xpmi0vqUIenkD7gu1gXqMOMJhVGrslVI9h
   iZjPMxxGNsHp2SlC+wGQ58QYw8kc+WMx7AZpx2A/ayiIxi3aFYZ+ctPSf
   C72gaucnazE3bKubVUm/G++8+B2y3FYq0wcHK3LPFg9Zutr6knV+KzEkj
   nJdOPRyWzDQOWFKIZCFFGHxYRValfoq3LxKZsoueTx2Hdgh9d7RFmBr3M
   A==;
X-CSE-ConnectionGUID: z1+8rSfSSAGQ68+OuiMZXQ==
X-CSE-MsgGUID: ZJ+bcq2kTBiTGabBiwAZwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48244513"
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="48244513"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 13:27:26 -0700
X-CSE-ConnectionGUID: hhvept1FQmqpbiyFFDwP5g==
X-CSE-MsgGUID: AfXkKI65RxyAUMgMUcnJyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="166429633"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by fmviesa001.fm.intel.com with ESMTP; 05 May 2025 13:27:24 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH] platform/x86: ISST: Do Not Restore SST MSRs on CPU Online Operation
Date: Mon,  5 May 2025 13:27:22 -0700
Message-ID: <20250505202722.1048675-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During CPU offline/online operations, the hardware retains MSR settings.
Even if all CPUs are offlined, the package does not lose its MSR
settings.

Therefore, it is unnecessary to restore MSRs which are modified during
the online operation, and this extra step can be removed.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../intel/speed_select_if/isst_if_common.c    | 21 -------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
index 31239a93dd71..3c4198ce17f2 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
@@ -198,25 +198,6 @@ void isst_resume_common(void)
 }
 EXPORT_SYMBOL_GPL(isst_resume_common);
 
-static void isst_restore_msr_local(int cpu)
-{
-	struct isst_cmd *sst_cmd;
-	int i;
-
-	mutex_lock(&isst_hash_lock);
-	for (i = 0; i < ARRAY_SIZE(punit_msr_white_list); ++i) {
-		if (!punit_msr_white_list[i])
-			break;
-
-		hash_for_each_possible(isst_hash, sst_cmd, hnode,
-				       punit_msr_white_list[i]) {
-			if (!sst_cmd->mbox_cmd_type && sst_cmd->cpu == cpu)
-				wrmsrl_safe(sst_cmd->cmd, sst_cmd->data);
-		}
-	}
-	mutex_unlock(&isst_hash_lock);
-}
-
 /**
  * isst_if_mbox_cmd_invalid() - Check invalid mailbox commands
  * @cmd: Pointer to the command structure to verify.
@@ -434,8 +415,6 @@ static int isst_if_cpu_online(unsigned int cpu)
 set_punit_id:
 	isst_cpu_info[cpu].punit_cpu_id = data;
 
-	isst_restore_msr_local(cpu);
-
 	return 0;
 }
 
-- 
2.49.0

