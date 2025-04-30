Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D159620F085;
	Wed, 30 Apr 2025 07:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999255; cv=none; b=Pmy9ydsFHHnvYgO2gtJkmprpliW6qKsel1ZvoUimhRnK6L9z/7xbzOFa9UqsyU+sNLI73PfHf11XHFQrvQDkNBgtC6aWorzHMn901cm9Hnj2FoDSkI11HafkTdKbdRuW/CvzQe5j5s+vS1gEhIIB2kv+2E2FrOABAHgpTum5EDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999255; c=relaxed/simple;
	bh=1/xCec/vmqhGSgDnVhBNUwFwfARiNGiIxOsSF83F6oU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQx8L3RUzXO9ilPRGKfoyUKNPjQiaGrkK4KcKMCeoi3W6AX0yj764RXIJq5bNXD1ipdpZXZx2VWYCBYM+PmVuKLgEvyF7e6KHVQEFgdkuyXuQ4jZiz51cHEABiHaR4jfst1lOKJy6fFuR9dxkWUsNWH4tLpBAOtqGpLyu6r27os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bmdS9pSm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bmdS9pSm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745999254; x=1777535254;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1/xCec/vmqhGSgDnVhBNUwFwfARiNGiIxOsSF83F6oU=;
  b=bmdS9pSmwm2af9NIAxzNIHXMo9I5siFxp/3JN/MLAy4Via64lyIYF3/i
   ezsraQ7nHsCaVln0SgzC+ZMB+Vh0e6wzUHAeee84oTN2fcHXjVxkSM6YT
   u9YnUp/CN1tGgd5SzCl632Wc53i3kXI/GaJ7YsE7ELH8slVPNXAG2UpOF
   AndygBUt2EMvTF+GnmLfnKZdHbyVc4pUEONFGLQ4VDXxC8UjqI1iPUzwm
   2l1T+5eLx2GSQ4d+9As9WMODwx8DI4oAwYZc2JHzRJhgSS+crrnYv/Z/D
   64qejV8RxSAy0qGOFDdV9ed7MpazvVkUQdamy7dpv6E4zkdBgSIBU8BO6
   Q==;
X-CSE-ConnectionGUID: Z/yRLIMCRpW3NRbOgqxH3g==
X-CSE-MsgGUID: 02Eei1jDSgC5+/QS41G8OA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="50304205"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="50304205"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 00:47:33 -0700
X-CSE-ConnectionGUID: 2dAcrXoLQv+cAoXNy5ZWzg==
X-CSE-MsgGUID: 4grBgcW5QkynlhAnxOjigQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="133994236"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.233])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 00:47:30 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 2/2] ASoC: SOF: Intel: hda: Set the mic_privacy flag for soundwire with ACE3+
Date: Wed, 30 Apr 2025 15:47:14 +0800
Message-ID: <20250430074714.94000-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430074714.94000-1-yung-chuan.liao@linux.intel.com>
References: <20250430074714.94000-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

The microphone privacy feature is introduced with ACE3, the soundwire
driver needs to know this to be able to print the PVCCS register via
register dump in sysfs.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index b34e5fdf10f1..510d31950587 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -192,6 +192,9 @@ static int hda_sdw_probe(struct snd_sof_dev *sdev)
 		res.ext = true;
 		res.ops = &sdw_ace2x_callback;
 
+		/* ACE3+ supports microphone privacy */
+		if (chip->hw_ip_version >= SOF_INTEL_ACE_3_0)
+			res.mic_privacy = true;
 	}
 	res.irq = sdev->ipc_irq;
 	res.handle = hdev->info.handle;
-- 
2.43.0

