Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394351A0BF1;
	Thu, 26 Jun 2025 06:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750918188; cv=none; b=rOsYywfgZjwAP/nkpKs9JfwdbTst1+ove21kLO9wiXya6FL0yMDXRA4AbGd6GKbLP1beS8wiAS6ytFA0/5HZ3hKbAZYbLH138Vr7EpuLrbBh7CZNvn9YtvHSG1YM9fU9J5J5BZ/y/04e6e3UnvcSMrWS78S1oKTBXaH3LnL45oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750918188; c=relaxed/simple;
	bh=5qQEo4cstz0NAMzDg6iNcA9J6qcGf1V6m+4GipjIBAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pZKCwX5cHWPGy30U6rkIWdqpBEQg/Mc3ZxTk8wmBn9T8otCo82kB96rMk5G6R+a/1Zd8ay9y+CZNTEs/bbDZOVDnfnviGgDIymnxr4Qqw0DBkuYpsEx5vmC+3c8p5W24WuSLOKLoSY7Qi3aAHXyWS4iDg0ZmyeQ6wDeMy3hsNVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VFJlowYK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VFJlowYK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750918188; x=1782454188;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5qQEo4cstz0NAMzDg6iNcA9J6qcGf1V6m+4GipjIBAg=;
  b=VFJlowYKfrrmza3xvtTdgb4tkiu0S9bpozMkLA9yd9473uDzXH1BEi3T
   JUoCRfWoyIf/qh5mqLIPuEG+mQuwwdMkielGgtkkplq9Qu1nw09XNH+UA
   2xDWb9CrrJoFQke+tBuPUjic52D7272rT8C1aV0Th8FUnTfrduNhVtLkw
   SKMbDyO+nOrr59S2ZG3+I42cExbz1RyyNg0vl+VboTmqZ6Wd1eDz3140B
   lD01szJ6AL2b137LCA33MeJchsV4jVK/m7B9reRkbfobeLh+/sqk0rMPZ
   37oe7K5OIde9o9l41JAS0VnvtOON9lECsc+KH/KsCgaPgzAFz4ec30k9d
   Q==;
X-CSE-ConnectionGUID: q8eK2wXMRJme+dpll0HrQA==
X-CSE-MsgGUID: wfln1RDfQv+a1a3ny0CjWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="64635353"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="64635353"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 23:09:47 -0700
X-CSE-ConnectionGUID: eXoEqP4iSxmN34FnAMWdFw==
X-CSE-MsgGUID: llWzoQSQS9yFC0nFDMokyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="152542072"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 23:09:45 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH] soundwire: intel_auxdevice: add rt721 codec to wake_capable_list
Date: Thu, 26 Jun 2025 14:09:37 +0800
Message-ID: <20250626060937.405978-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Naveen Manohar <naveen.m@intel.com>

rt721 has wake capability. Add it to the wake_capable_list.

Signed-off-by: Naveen Manohar <naveen.m@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_auxdevice.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 10a602d4843a..6df2601fff90 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -65,6 +65,7 @@ static struct wake_capable_part wake_capable_list[] = {
 	{0x025d, 0x715},
 	{0x025d, 0x716},
 	{0x025d, 0x717},
+	{0x025d, 0x721},
 	{0x025d, 0x722},
 };
 
-- 
2.43.0

