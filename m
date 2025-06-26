Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCC8239E79
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 09:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750931575; cv=none; b=NnylIdauwLY2fJQ2Ubh0/tpKwfmZMzdkD4RwjZy3nxCVakKsxpHVu+bIbuNUfQMnISAwfeOuZnnYm4me4MqmzJsXIUcnHsOLKamk4o30LIbb/L+eCWNiSw3eSiJLlKt7zwZkTyg3Iuv50ifJ2WY96djyjhSjMYyxgHv/HCd6Q9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750931575; c=relaxed/simple;
	bh=2AIE+LkdiujG5ji7loxoRS9NHD2gQlKzMyQaLL826Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P6UMBax4Re+0rRKLtTWYzJScHnhm3I2zWbcQ8iXWTa0HMIQ5t04cIL7sV0QPdAPC1DXjOfbki7RriRpc8e4c42fbUNwTgHdis26FoxzJ0ogkYzSx4Y6eKS0VTppqBHcDVodnjyCFpfnIxkSUMC4tDNH4WFGvW0U5zTWZPdP3k0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BB+VHb9g; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BB+VHb9g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750931572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=maigbIGpFa40uB5iR2z3omILy1pW0Pv0zv0NfF/hTkQ=;
	b=BB+VHb9g/Gqd6cUpbViUIXRg3C4ikHW92Ji/sx8K/DPBJ+agHVHif9wpUGFxDmo9cR0PNp
	HBOrU38jPmcf1VdlQSzg5LwV5LB+pwEs/JbYKBDDMR7Ta3PlyXY/QJ4/AoqNSYPKVN0D9C
	+wL8DZL8dhJuekd3BDvTAHq+nampYw4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-211-LeF5gsmwOrK0kvTK3vRPQA-1; Thu,
 26 Jun 2025 05:52:48 -0400
X-MC-Unique: LeF5gsmwOrK0kvTK3vRPQA-1
X-Mimecast-MFC-AGG-ID: LeF5gsmwOrK0kvTK3vRPQA_1750931567
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2FCD118DA5C2;
	Thu, 26 Jun 2025 09:52:47 +0000 (UTC)
Received: from gshan-thinkpadx1nanogen2.rmtau.csb (unknown [10.64.136.50])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 971D630002C0;
	Thu, 26 Jun 2025 09:52:43 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: james.morse@arm.com,
	sdonthineni@nvidia.com,
	rohit.mathew@arm.com,
	carl@os.amperecomputing.com,
	gshan@redhat.com,
	shan.gavin@gmail.com
Subject: [PATCH MPAM 6.16.rc1] arm_mpam: Enforce to recalculate mbw_min on configuration
Date: Thu, 26 Jun 2025 19:52:08 +1000
Message-ID: <20250626095208.1008871-1-gshan@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

mpam_feat_mbw_max is exposed to user by resctrlfs, but mpam_feat_mbw_min
should be recalculated based on the maximal memory bandwidth in every
configuration, which has been missed unfortunately. When a new group is
created, the default and maximal memory bandwidth percentage (100%) is
configured, the configuration instance (struct mpam_config) on the stack
is updated, including the minimal and maximal memory bandwidth. It's
copied to the domain's configuration instance. On next time when user
tries to configure by writing 'schemata', the minimal memory bandwidth
isn't never recalculated because mpam_feat_mbw_min has been seen in the
configuration, which inherits from the domain's instance.

For example, the value of register MPAMCFG_MBW_MIN is never changed no
matter what configuration is set.

  # uname -r
  6.16.0-rc1-gavin
  # mount -tresctrl none /sys/fs/resctrl
  # mkdir -p /sys/fs/resctrl/test
  # cd /sys/fs/resctrl/test
  # echo "MB:1=2" > schemata
  MAPMF_MBW_IDR               00000c07
  MPAMCFG_MBW_MAX             000005ff
  MPAMCFG_MBW_MIN             0000f000
  # echo "MB:1=100" > schemata
  MAPMF_MBW_IDR               00000c07
  MPAMCFG_MBW_MAX             0000ffff
  MPAMCFG_MBW_MIN             0000f000

Fix the issue by enforcing the calculation of the minimal memory bandwidth
in very configuration. With this applied, The register MPAMCFG_MBW_MIN
is updated with the expected value in every configuration.

  # cd /sys/fs/resctrl/test
  # echo "MB:1=2" > schemata
  MAPMF_MBW_IDR               00000c07
  MPAMCFG_MBW_MAX             000005ff
  MPAMCFG_MBW_MIN             00000200
  # echo "MB:1=100" > schemata
  MAPMF_MBW_IDR               00000c07
  MPAMCFG_MBW_MAX             0000ffff
  MPAMCFG_MBW_MIN             0000f000

Fixes: 75f4101bb338 ("arm_mpam: Generate a configuration for min controls")
Signed-off-by: Gavin Shan <gshan@redhat.com>
---
Appliable to James Morse's latest MPAM branch
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git
(branch: mpam/snapshot/v6.16-rc1)
---
 drivers/platform/arm64/mpam/mpam_devices.c | 27 ++++++++++------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/mpam_devices.c
index df8730491de2..4845dcb8e601 100644
--- a/drivers/platform/arm64/mpam/mpam_devices.c
+++ b/drivers/platform/arm64/mpam/mpam_devices.c
@@ -3192,6 +3192,9 @@ static void mpam_extend_config(struct mpam_class *class, struct mpam_config *cfg
 	u16 min, min_hw_granule, delta;
 	u16 max_hw_value, res0_bits;
 
+	if (!mpam_has_feature(mpam_feat_mbw_max, cfg))
+		return;
+
 	/*
 	 * Calculate the values the 'min' control can hold.
 	 * e.g. on a platform with bwa_wd = 8, min_hw_granule is 0x00ff because
@@ -3211,23 +3214,17 @@ static void mpam_extend_config(struct mpam_class *class, struct mpam_config *cfg
 	 *
 	 * Resctrl can only configure the MAX.
 	 */
-	if (mpam_has_feature(mpam_feat_mbw_max, cfg) &&
-	    !mpam_has_feature(mpam_feat_mbw_min, cfg)) {
-		delta = ((5 * MPAMCFG_MBW_MAX_MAX) / 100) - 1;
-		if (cfg->mbw_max > delta)
-			min = cfg->mbw_max - delta;
-		else
-			min = 0;
+	delta = ((5 * MPAMCFG_MBW_MAX_MAX) / 100) - 1;
+	if (cfg->mbw_max > delta)
+		min = cfg->mbw_max - delta;
+	else
+		min = 0;
 
-		cfg->mbw_min = max(min, min_hw_granule);
-		mpam_set_feature(mpam_feat_mbw_min, cfg);
-	}
+	cfg->mbw_min = max(min, min_hw_granule);
+	mpam_set_feature(mpam_feat_mbw_min, cfg);
+	if (mpam_has_quirk(T241_FORCE_MBW_MIN_TO_ONE, class))
+		cfg->mbw_min = max(cfg->mbw_min, min_hw_granule + 1);
 
-	if (mpam_has_quirk(T241_FORCE_MBW_MIN_TO_ONE, class) &&
-	    cfg->mbw_min <= min_hw_granule) {
-		cfg->mbw_min = min_hw_granule + 1;
-		mpam_set_feature(mpam_feat_mbw_min, cfg);
-	}
 }
 
 /* TODO: split into write_config/sync_config */
-- 
2.49.0

