Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B423D3B8
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756529; cv=none; b=ogyVItr5OsCfFJVY/rWiuDgzsLi0sYpwj/Iu4jHsdguL5lNDsRZMCnC18aCKAl1IKRvNwelHx5BlDu7EnKy+qUUR5THyKx9fWXbqz/aLkM5gREXxYu1chnWEgFEgofdLrfnIycdhqa1pvYRPEloIPQfV8qRb/OslW1Eq/Z3he/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756529; c=relaxed/simple;
	bh=w4DlBS740f36wje1cdOalN6Pq2yDbv+aMS8kLGs1coM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O5c9qfZ+F3lDgLBe02737XzTiCwOp7ZS7ltjyQBp2xAPwv3EIL2hvIB1Xg6tRAcFJgxeOgI5JfYVIl/3gTnySW6l756oA2ksLb9xtIJye6ZN2mBQyL8wmWfxgw7pStBa6K3HIXyClsy3hapqsrCELB9UwWmg31qP4zaxaZunP5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aHZX/G3F; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aHZX/G3F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750756526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jg05gLn4LYp6QB0cNwt5RW/tA0G9+DCBeUGxTXSbrQE=;
	b=aHZX/G3FxzCMQqbGT0+DbJ8+Lt1PWlhEjATYsvvTnkBxq+eOGaQ3tiWKn2OwJASr7f+7f6
	AeZNqdhexmCE44RHaN0Vu6yhaFWZb67FEZEm+RLi7RYRj21kaAGdNwjtOQ8CjPJ4y96gwF
	fsroQiHJ8Ljl3b599QU1Klqdq8m9ReE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-610-6R_CZHnePXm5C8zAnVxr9A-1; Tue,
 24 Jun 2025 05:15:21 -0400
X-MC-Unique: 6R_CZHnePXm5C8zAnVxr9A-1
X-Mimecast-MFC-AGG-ID: 6R_CZHnePXm5C8zAnVxr9A_1750756519
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D6D6B1809C97;
	Tue, 24 Jun 2025 09:15:17 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.224.209])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EF4A618002B8;
	Tue, 24 Jun 2025 09:15:11 +0000 (UTC)
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v11 01/11] drm/panic: Add a private field to struct drm_scanout_buffer
Date: Tue, 24 Jun 2025 11:01:10 +0200
Message-ID: <20250624091501.257661-2-jfalempe@redhat.com>
In-Reply-To: <20250624091501.257661-1-jfalempe@redhat.com>
References: <20250624091501.257661-1-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

This allows driver to set some private data in get_scanout_buffer(),
and re-use them in set_pixel() callback.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

v10:
 * Added in v10, to avoid static variables

 include/drm/drm_panic.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
index 310c88c4d336..ac0e46b73436 100644
--- a/include/drm/drm_panic.h
+++ b/include/drm/drm_panic.h
@@ -72,6 +72,12 @@ struct drm_scanout_buffer {
 	void (*set_pixel)(struct drm_scanout_buffer *sb, unsigned int x,
 			  unsigned int y, u32 color);
 
+	/**
+	 * @private: private pointer that you can use in the callbacks
+	 * set_pixel()
+	 */
+	void *private;
+
 };
 
 #ifdef CONFIG_DRM_PANIC
-- 
2.49.0

