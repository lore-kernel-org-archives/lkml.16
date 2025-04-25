Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD7423C368
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576905; cv=none; b=T/YGUOxCwyDCuPwa3QhHzUp8BP4T3ud3gFb3pBKzTBeOsvtK7/15teCkzU43Z6LVbH7yfujMy/uWRpWDukrCab23jrVzGZ0dqoQa289mAZmF/euV+sAUPHwXUZgt3s+EUWZXqcCHF/KkisEsUA120CRef6llvIln908/nr75ekc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576905; c=relaxed/simple;
	bh=RlyWP2QsjTsHxaZYoCMc/KglO80bh7kVFpo7Z2MtuMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OenIpf6Plajyn3/Zhpj9oSjZlk6LWsv19k5mvTyNuWSo7pB3XJ6EYXEEqfYNyZdPRhGxEzYoj9Chaz8Kma3BsKgE1sjzVKir00jX8nzAxSxejVTevNqVKbXvxV3+GyF3bnThIe6SG41IsSsLAxXPddm8CDRmRDsholnliwJGnoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eW8/xhNL; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eW8/xhNL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745576901;
	bh=RlyWP2QsjTsHxaZYoCMc/KglO80bh7kVFpo7Z2MtuMo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eW8/xhNLt2VJCGIs0+YTtaGjdo4XZrQtwE9PjWT5VstPCpbMMKrU7aFEu1yHbyq8d
	 WIgVz+Sj94TSfuCYKYO37Ss/OUMVViUxrkZW9VLJVxfFuDUBYLBmfgxrZ+j08nMxEu
	 etQFVvA6cOLdXKQ6GTv43K0V6OcCzZNS+pZBTt6TRj0MCpoUmYH0zIqGd2VGoz1l1k
	 XEGqmdoYyImVH8+Qo9p3BWLEbe2Xd7AqSBQ9SsnytsBeV+Q1JLuhfg7JQMnARPbgOp
	 XeoSlpu96V+zPy55ymQ8ATCBo50KOeAFtz2lLR1w94/nRdraY25nV9G9Oxj/iECMJZ
	 cBLIFirJn41TQ==
Received: from localhost (unknown [82.76.59.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 51DE017E36BD;
	Fri, 25 Apr 2025 12:28:21 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 25 Apr 2025 13:26:54 +0300
Subject: [PATCH v4 03/23] drm/connector: hdmi: Improve debug message for
 supported format
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-hdmi-conn-yuv-v4-3-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
In-Reply-To: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Add the missing 'bpc' string to the debug message indicating the
supported format identified within hdmi_try_format_bpc() helper.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index eb284032ea794838f333ce639243540fca91dbdb..a0cb3163f457635cf27e53b009bd83f85eee9336 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -596,7 +596,7 @@ hdmi_try_format_bpc(const struct drm_connector *connector,
 		return false;
 	}
 
-	drm_dbg_kms(dev, "%s output format supported with %u (TMDS char rate: %llu Hz)\n",
+	drm_dbg_kms(dev, "%s output format supported with %u bpc (TMDS char rate: %llu Hz)\n",
 		    drm_hdmi_connector_get_output_format_name(fmt),
 		    bpc, conn_state->hdmi.tmds_char_rate);
 

-- 
2.49.0

