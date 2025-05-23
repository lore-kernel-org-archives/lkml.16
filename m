Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366822DCBE6
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 06:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747982463; cv=none; b=fce+35gUuy6YP7JMPC34Tm356aqqtJ8n0KYuIuSFrunU0nkllToMTFB3aWvRCsVocBgj+9FJlzLTlnOOgNqrzju0T2ia1Vxpn588++Pa8eRMytmylOanP42UVRnWkH/LYz2G7im70L4+/Uk+PPKwUEOWRT8w5kbdQbi9xIILZh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747982463; c=relaxed/simple;
	bh=+zdqApXgqYiXy7sxtgfCxKqzLaoWEekCTjp5bYrCWeI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ERsIUCdwkTV9bObTn4bW3Y+AIO3HpYRxodRtCW844LUq8Gy32tLiZuc9oI93A03hDIHGWSLm4M89SThjGtErb2p/bpeZj+m8UlMyK43XvEbguT20EezJI45I74gx+N/ZRFKesNlK3y0Rt15lYq/544IiLi3NcXUqTyNT/e2R9LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=cHvtKRQd; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=rkrx2fJy reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="cHvtKRQd";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="rkrx2fJy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1747982460; x=1779518460;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2ba/0s2zFjBwwDkrqACm+IAKb2aRWgGWa14NBTiYnyo=;
  b=cHvtKRQd6arlyArz/INWqVBZ1TEntHiTtpRGBSt/kCOqXyD3M1RR30ZX
   +WwUtpbnnzvuGvT4BGoRNm7llarrz1nZYVyvTiWfq5eOWkLXayzBeDMaH
   q8X5Yii02eSOok0KVMGVEMnTBae1/4R6EZ+r2knJpC28qmGYSeFtMTSHM
   OxiDX+sKXnKSu1wmbsUVcp/QdiMQ0frNJur2IX97yGGrBsR6ukIRepRVC
   NxhUej9DJ9R/EUdmgdUXtP4nHjL8Xch2EdVQEd8N6Bwjj+52O7h7n1hPl
   lk4wXgapTrcPbKQPYX8+auQXKQRl6exCtPhl28ie2wvV6NjHRJLxp7WwD
   A==;
X-CSE-ConnectionGUID: Bc6uYe24Q1axwAqz6lju6g==
X-CSE-MsgGUID: zmRHm4bBRAqJfuYF9TVn8g==
X-IronPort-AV: E=Sophos;i="6.15,308,1739833200"; 
   d="scan'208";a="44249799"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 23 May 2025 08:40:51 +0200
X-CheckPoint: {68301873-11-C7E25413-F4312D34}
X-MAIL-CPID: 171ABC288E9D9E5597BFF0440F2CF286_4
X-Control-Analysis: str=0001.0A006368.68301888.007D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92EEE160FB1;
	Fri, 23 May 2025 08:40:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1747982447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2ba/0s2zFjBwwDkrqACm+IAKb2aRWgGWa14NBTiYnyo=;
	b=rkrx2fJytEk4czfUkL69PwevR4A+69LLk9RAnojbuVnur1H8md5HjciRHBAxlBC57y8/yb
	SwSq9e5VSiO4R4pFE3uSpPzKKY/8hAVECSPylZe6vtuEkobFTuhPRf2F44cgiBMR8bbuF5
	TybSU9hdrfqB88FyWMlCLu3JvSYWBaOXZvkHmWHW0t6FHP4X5oORRbiEMr1maz2cqxxShO
	+vhGcbfFvLjnqSSE2Wq48c0HcY/Ve4hc5jwyxqbdVizv3DhfHNDaNAsKIQyaZe64JfbMSk
	UV7yIFJ4D+LClXrZkzJ9d6a7jUtlhKy1X0duqw84UgvUTTx+xKTBONedBICCBw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] drm/arm/malidp: Silence informational message
Date: Fri, 23 May 2025 08:40:41 +0200
Message-ID: <20250523064042.3275926-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

When checking for unsupported expect an error is printed every time.
This spams the log for platforms where this is expected, e.g. ls1028a
having a Vivante (etnaviv) GPU and Mali display processor.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Every time glmark2-es2-wayland is started on a downstream kernel raises the error:
> [drm:malidp_format_mod_supported [mali_dp]] *ERROR* Unknown modifier (not Arm)

 drivers/gpu/drm/arm/malidp_planes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 34547edf1ee3c..87f2e5ee87907 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -159,7 +159,7 @@ bool malidp_format_mod_supported(struct drm_device *drm,
 	}
 
 	if (!fourcc_mod_is_vendor(modifier, ARM)) {
-		DRM_ERROR("Unknown modifier (not Arm)\n");
+		DRM_DEBUG_KMS("Unknown modifier (not Arm)\n");
 		return false;
 	}
 
-- 
2.43.0

