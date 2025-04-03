Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1026C288DA;
	Thu,  3 Apr 2025 13:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743685382; cv=none; b=c3qppMZcPGli1T6swKlh3urVFKugZv26F3YoS4TfOdf1Ijni+Q8bk8UWl5+/g8mH7yIPcZGljucSYTqtmNHdVhxHcG0zNCgVqRlGSwzZ73/XhqChEGLLABZcFULIwYh5trdiMfnDvrr5AcGAGThWEeaVyZJrBGCa70hvKFPHJ3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743685382; c=relaxed/simple;
	bh=UYFibFRYxKeXkK6qk5jWiYYiIva2k/ozd9NglR3yXEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CG/ivdMXE0XgSZHOsaDPe2g5JqxrsS9mqXx8vs59/1UUUqKrflIc5wZu4uIpLX0Oi3RhmgRnegfvizDXfpGZsuPisoazLxnz7h67f3mXTTCcgDHNdJ70uQjtrFNxsz63sufPgow8zz0V7aC0kpgqmShr/hhJ/6ilJILnaZLLGqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=favBmOZj; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="favBmOZj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Ursf88wNTOlmX3oAtm14m6ADoChpf6AmAUtfT2VrvPI=; b=favBmOZj/bNEAuN1Q7/JYLmq/I
	iz5m3uxCJZev4m8QY4WguqLvzwW4rl0rrb7R9KZ5+jT807YHJ1xyYZQmYK9UrZJ+Lx0RMMpAVYOGt
	nN/9mpn/3PBYb6f+Hv0SgrpC3p5WQB0yrPw1wdSdTKvbNR9/1pZ4ggA/4p0odn93+Ais0fyWhYDe+
	Wfj0LvqMqOEfGGcmdEvHy1EBYuFN0loFtzdmUHxOtnfBZOQrbLM7B7rjFd1KPTyTDT+cAjHVZWdJo
	VZipIuax3wXCme37Rr5TbxF55FtHeC2I7rsu5S6s9JY/BvY9rk5HHV6h+5F0XWZ4+OvCBWZ6197i1
	noIh7y2A==;
Received: from [177.134.103.112] (helo=ginger..)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1u0KDZ-00ApVU-Ku; Thu, 03 Apr 2025 15:02:50 +0200
From: Helen Koike <koike@igalia.com>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	cezary.rojewski@intel.com,
	andriy.shevchenko@linux.intel.com,
	broonie@kernel.org,
	yung-chuan.liao@linux.intel.com,
	brent.lu@intel.com,
	pierre-louis.bossart@linux.intel.com,
	kernel-dev@igalia.com
Subject: [PATCH] ASoC: Intel: Remove unused SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
Date: Thu,  3 Apr 2025 10:02:42 -0300
Message-ID: <20250403130242.1227770-1-koike@igalia.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This config was used by bxt_da7219_max98357a and kbl_da7219_max98357a,
both were removed.

Now it is not used anymore, so remove it.

Signed-off-by: Helen Koike <koike@igalia.com>
---
 sound/soc/intel/boards/Kconfig | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 9b80b19bb8d0..2df7afa2f469 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -252,14 +252,6 @@ config SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH
 
 endif ## SND_SST_ATOM_HIFI2_PLATFORM
 
-config SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
-	tristate
-	select SND_SOC_DA7219
-	select SND_SOC_MAX98357A
-	select SND_SOC_DMIC
-	select SND_SOC_HDAC_HDMI
-	select SND_SOC_INTEL_HDA_DSP_COMMON
-
 if SND_SOC_SOF_APOLLOLAKE
 
 config SND_SOC_INTEL_SOF_WM8804_MACH
-- 
2.45.2

