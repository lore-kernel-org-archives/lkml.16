Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D457D2AF10
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743437830; cv=none; b=PIh6NulIYuO5rIsbC5DbRI/eeah7sg0WqquJPz7RvGOhvywmvpWqcIbdYgYYOJn309t7EZHR/E9sKOtoHslAHInXymCP8EC0XS5ANtT3qpJl+vGi+KXfSAcEizAQ1bPSGTbyWpNxARAvrLUZ2baJ1Rlyetix9CX/I+Ss0tlRPt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743437830; c=relaxed/simple;
	bh=lScma3WC78BAb8OJv/MHz+La2UQ8ibAnbgwMH2uJn9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ttLj/xkwiv0jBAC/tQof5BvzV/Z1W0fPpbvh4xfhFI/CNbVkQytu6BIAigrnfnkMp4pZz2mLOO05D8r9rljCaxTMuVkUbx4Csmo0+z9aqOH09a65RjZZPjllJcZcRghqhFGVgWx0FyB8F8dNyS5N+K+W8zTeag4nIJfnuIPBlzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jWThbAH+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jWThbAH+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743437827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e3bGbAmmjU2Q7nMUr6I9h6/rTkXSzTezZzF8OLBQQIw=;
	b=jWThbAH+GVglTDmvVzXPJwnzV8bbe6i/09BPi8/GwbTOhceAShfQYG6P2GPC9b9SOYIHbK
	+KXh2TT6xS6pOnqEMENg4YFNoCz4TM7ZzvBZWvt36w9CBZDj1Q9jXIcbakToA9pUI9Kljn
	q6A8scyzr6t1J/chYebwpKWad7DzDT0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644-JV226XT9MwKY4Ex-eTrjGg-1; Mon,
 31 Mar 2025 12:17:04 -0400
X-MC-Unique: JV226XT9MwKY4Ex-eTrjGg-1
X-Mimecast-MFC-AGG-ID: JV226XT9MwKY4Ex-eTrjGg_1743437822
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7B7471809CA3;
	Mon, 31 Mar 2025 16:17:02 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 69E1819560AD;
	Mon, 31 Mar 2025 16:17:00 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Mon, 31 Mar 2025 11:15:27 -0400
Subject: [PATCH v4 3/4] drm/panel: deprecate old-style panel allocation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-b4-panel-refcounting-v4-3-dad50c60c6c9@redhat.com>
References: <20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com>
In-Reply-To: <20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743434129; l=1187;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=lScma3WC78BAb8OJv/MHz+La2UQ8ibAnbgwMH2uJn9Y=;
 b=ByBbgmWB86JZYt/bHu1LZ7RyJZP2Ae45qmWc32Tke83AF2YH8w5l26zp0EjpXPk6MyrJuZ/s6
 jljX5aUN49JA9JWtIRQ21+uuk8IH5dotY/Rnm0WxDR1zxbCUTZ5MTb7
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Start moving to the new refcounted allocations using
the new API devm_drm_panel_alloc(). Deprecate any other
allocation.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

---
v4: none.
v3: none.
v2: make the documentation changes in v1 more precise (Maxime)
---
 drivers/gpu/drm/drm_panel.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 7b17531d85a4dc3031709919564d2e4d8332f748..870bf8d471ee9c5fe65d88acc13661cacd883b9b 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -74,8 +74,9 @@ EXPORT_SYMBOL(drm_panel_init);
  * drm_panel_add - add a panel to the global registry
  * @panel: panel to add
  *
- * Add a panel to the global registry so that it can be looked up by display
- * drivers.
+ * Add a panel to the global registry so that it can be looked
+ * up by display drivers. The panel to be added must have been
+ * allocated by devm_drm_panel_alloc().
  */
 void drm_panel_add(struct drm_panel *panel)
 {

-- 
2.48.1

