Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B0328C5C3
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751294541; cv=none; b=lwS4o0PvG86/QYh30QXv7wLoEyVoJXyRpuwhU9FPkiMdNOpux4pw3Awm0berwz8VwSGWuT889S8m+7pXowCiKdMLp1q30jq83xpWdryEc+kU67xE01sE8VMPDnRbHSXAz9q04FHNxtpvTOcOEg0tJ2Mu2hOz90dbjdpjCbDavtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751294541; c=relaxed/simple;
	bh=kziMulZh5c9qXWvGM+SCviDOcX1NicLvcl49xrOZqhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YdyERYgQMA3A6GBdM8Uc7IECb0IGjEvgnI1Cr6DI/huwhxL6bS/9iuY+yXeT4GuCeVuX7ghuojGv1zWvIpfxK+v5H3ChL/bb5CCGzfbFysFRgj4mfBauk2JM4xyFPWfT6YJORbkFU0YhNgEu59xj6xFosuyr7rzR4uFKbwxKQqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TMhmzEct; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TMhmzEct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751294534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WSmEPnYFlo3nEKMgNzDLaZnUOSU1hoz+IcjIPvr6Ofs=;
	b=TMhmzEctae8EQCQ+gCzw8kls8ar5N6dwxpdSaRtV2syi8ue37rfVIj3rvHg3R3YohVxjqf
	ufMKza11mN5aYqE3m0IeOBKbbudl0Ro6506eeDcIod3BzkvihLmTlhLbHLh6iy3HXsOeue
	oZG6SoG8ommUobkCiFRFaOski8BmxRc=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-502-8ST2s3RlM9mDsD8Auc01bg-1; Mon,
 30 Jun 2025 10:42:08 -0400
X-MC-Unique: 8ST2s3RlM9mDsD8Auc01bg-1
X-Mimecast-MFC-AGG-ID: 8ST2s3RlM9mDsD8Auc01bg_1751294526
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 919F71955ED4;
	Mon, 30 Jun 2025 14:42:05 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.44.34.121])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5F33319560AB;
	Mon, 30 Jun 2025 14:41:58 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Christian Koenig <christian.koenig@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/ttm: Remove unneeded blank line in comment
Date: Mon, 30 Jun 2025 16:41:08 +0200
Message-ID: <20250630144154.44661-1-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

There is an unneeded blank line in the documentation of the function
ttm_bo_kmap_try_from_panic().

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506290453.NeTXAb7S-lkp@intel.com/
Fixes: 718370ff28328 ("drm/ttm: Add ttm_bo_kmap_try_from_panic()")
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

Can this be merged through the drm-intel-next, as this is were the
offending commit was merged.

 drivers/gpu/drm/ttm/ttm_bo_util.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index ad95e8b9852b..16cb4065214d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -382,7 +382,6 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
 }
 
 /**
- *
  * ttm_bo_kmap_try_from_panic
  *
  * @bo: The buffer object

base-commit: d5bafb1c294cf99cc5991f7fdecc79898f9b8d0e
-- 
2.49.0

