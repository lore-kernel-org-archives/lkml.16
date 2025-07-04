Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7924B2F9483;
	Fri,  4 Jul 2025 07:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615716; cv=none; b=r61rJENKxbgCKtj2DwXjsr66AqTfMKjbasYCZ2W6fkgPO1V2ENzdpoG7OZ7zqoGFcfAc59ry1CVrXw7K4CXC6+USA2dic7XGwisHJ0FU53Z37zNzIqrhGc76rkQa0XvHRdU8p+ouiryPXMuXcPuTmEeEM3Xdhc6Vx2QdB7bP9CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615716; c=relaxed/simple;
	bh=/sdRjYxfS+XsY+oFUi9LbPiw9xP+mi2C4Wu33DXiipM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z8Uam4+efft0DQjCliCIqTtDdvNNubLmxXMANPXgeoRQksLbjCC1ilPWe2uzN7ybq2ReBl/XWcxffcapmPwhKQSTaC+e9AF5EbwBpO27GeKL1aQkAIfaXtHDtQ36mMnmZxwhFqkI/8t2Zw3MSKm0Ql8vCyZnGXK9SRI2PHc9pZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b71O0mqt; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b71O0mqt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615715; x=1783151715;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/sdRjYxfS+XsY+oFUi9LbPiw9xP+mi2C4Wu33DXiipM=;
  b=b71O0mqtj6gM83eomGve+rmuB61X5brZJRhVDj+SYddzBmmu0QEsiohl
   rD1+qG+FXeBeAsp1IevXg85yroBpgfevCr3XfdEsFiHcDd2CU+Rx/htF4
   XZ8M/xCU2Bf+OpHDEEZDz+iLcOVZK5o0qQy8IntV5VErCth0cYctFgZvv
   aJRLl1sLWj/p7/HP073AFqoEgHx8g3Vu7g1Cx2fN2CNsx4N9FvrtQTxnQ
   U1OclumaV6Pdx19caoOCGcV4FI7r22hYbataEwbk7jOZbIfvd6CteWCu0
   GFMh/h6Drgj9m66voEwuvoby2H4Gj/q68e8Npy2QNXBwPzPWWi7XJIa/q
   w==;
X-CSE-ConnectionGUID: vBlivEolRFmd3WcWZfXKhA==
X-CSE-MsgGUID: TFueOom6QVqDzh/TLvxKYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194346"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194346"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:55:04 -0700
X-CSE-ConnectionGUID: VMyG7aEjR4iffiOzvKpwyQ==
X-CSE-MsgGUID: s7YHK/SnR1ieixpXxymbsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616694"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:55:00 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 9EFFB44433;
	Fri,  4 Jul 2025 10:54:58 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 73/80] ASoC: component: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:58 +0300
Message-Id: <20250704075458.3222817-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 sound/soc/soc-component.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 25f5e543ae8d..65c495094024 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1278,7 +1278,6 @@ void snd_soc_pcm_component_pm_runtime_put(struct snd_soc_pcm_runtime *rtd,
 		if (rollback && !soc_component_mark_match(component, stream, pm))
 			continue;
 
-		pm_runtime_mark_last_busy(component->dev);
 		pm_runtime_put_autosuspend(component->dev);
 
 		/* remove marked stream */
-- 
2.39.5

