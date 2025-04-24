Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A427317FAC2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745502468; cv=none; b=lotRlL2/+iAaOR1ZZk0dgZPHiZPVdqIrv7TbQWYNLENiYcKkOORWGnYX4FyYWpVboxTe0XmEw52eiU5XhaYqbLeZ9lQB7kQkU7rr42LCRaYcKCeHZeO0yISKgNKDcKj0Ag69is6gd6h/rPwKO89fzmAFMgM38Dg+B6BICOUJ4Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745502468; c=relaxed/simple;
	bh=e8tbn6z5Wzsvp7tPLqFuVaLqmzq6ZAwM8Ecg0eO97Fo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RkQCg01yruWPjWxgPi/1h4oVH6yZWnvHHPX2RwzbeT/qQyh41CJTwAJHpmERUnwVEA2CLUzHvtOZUu8sZ1BZi6ZFriafXkN1zWlotZYPy+ppw4dzBdQPTblGjZxnFxnAbcJ5o6Bo3oPhSSY/Z33YTHltuyYpkdmU0TzkQzOkIKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cbb0+Xfe; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cbb0+Xfe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745502466; x=1777038466;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e8tbn6z5Wzsvp7tPLqFuVaLqmzq6ZAwM8Ecg0eO97Fo=;
  b=Cbb0+Xfeb8iiuV1Z9Fku8x0+jSPCJvXLK4vy3R2LQOI/qBipbv4Mt0y8
   b1QkZgzvgtEE5XXVcjX4A9Aty3iAoAnrZxNl9+wuhQMFOathJ56QOllTc
   CuktOBDPh9s/w+u9Mqe6QRQkBSyCJyOh3Dw+GltpCG3yg03mhjdEE3Lcb
   jwa0hXJB2+7jno9wRWhmlDoUtA1tygpCyEDjUKZ8xor7Q/RFSTyU47Zc3
   sGPBaOZG3IHJcUqHoMXnVb7UeGeNftMPn9ZisI2Z0CRY21JLR2S9Z/8W8
   dP7QIAT5iZFYRg6ewf5GQrQThzerRgq9Jc2qayYg5OCWCAISdI7kyMvbq
   Q==;
X-CSE-ConnectionGUID: DiC64V1FRyqgI4P1TVOY7g==
X-CSE-MsgGUID: 8ah2dR6AQSGKnVPfUi/k5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="58508208"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="58508208"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 06:47:44 -0700
X-CSE-ConnectionGUID: eEJ7OrSaT0ea8OUV7Prh9g==
X-CSE-MsgGUID: 6/Ui7NI2QR+uSegqm47ZuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="137718963"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa004.fm.intel.com with ESMTP; 24 Apr 2025 06:47:44 -0700
From: kan.liang@linux.intel.com
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	irogers@google.com,
	linux-kernel@vger.kernel.org
Cc: Kan Liang <kan.liang@linux.intel.com>
Subject: [PATCH V2 3/5] perf/x86/intel: Check the X86 leader for ACR group
Date: Thu, 24 Apr 2025 06:47:16 -0700
Message-Id: <20250424134718.311934-4-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250424134718.311934-1-kan.liang@linux.intel.com>
References: <20250424134718.311934-1-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kan Liang <kan.liang@linux.intel.com>

The auto counter reload group also requires a group flag in the leader.
The leader must be a X86 event.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/perf_event.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index fd409d70e568..bac252ba3da6 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -129,7 +129,7 @@ static inline bool is_pebs_counter_event_group(struct perf_event *event)
 
 static inline bool is_acr_event_group(struct perf_event *event)
 {
-	return event->group_leader->hw.flags & PERF_X86_EVENT_ACR;
+	return check_leader_group(event->group_leader, PERF_X86_EVENT_ACR);
 }
 
 struct amd_nb {
-- 
2.38.1

