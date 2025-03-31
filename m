Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6D81531DB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 03:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743391557; cv=none; b=Zsxh+WoGuww7DL25YHrTS3NP6xMYa+Dzkcnc9C/SHBWtam3eIvOGLJTDYxGr1lzT3WjOFjAQSzdIDU88zQsEM3IMvtBF5i4Y4GJ2QcWckkufGo13pibAwOBmzPAKm95SWUZZacJKfDCuvouRUgwvBQKWEr/RiUl7graJ10fJuTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743391557; c=relaxed/simple;
	bh=Twe1CysgUNTNxjLGPaIExyaLHYsOasZCKyjWS8eMjhA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZtorSOzIyt0tjqZ82gSbvG829qdUC78KrFqv1Qa7jMwGrusHoLMNTf5qfeFJmgTXpBO3cDqxcVIVuhfFSsXWH/Eyp0S1kTWWHjLDHLcg/gX9Q1kTIWQJhUV7blsdFYxcmZc3KsZtBljncO8F6oibFwoLrl2dRFDo15YsXSSYlxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SvF2wLuM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SvF2wLuM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743391555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EhpkmaQVIlApTG41YTRyXQK7jdbH/Wt/GFmqtV6AMfA=;
	b=SvF2wLuM2Adp655FSZXMgGs099EFVA7VNukkjgQ+ZZkCvCNtY5zSpRgerju6H68nONeV/n
	UmHfm3EIFoulyGUmNDaPYePtn+SRXLyERLpVUki/XpUWsDFKqq3Q192tP+WAKbw63iPybZ
	to0653ehh3Faz34CW5wB0EQbZTYm46E=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-482-2ryQG2YgO6qSpCCVuJHKUw-1; Sun,
 30 Mar 2025 23:25:51 -0400
X-MC-Unique: 2ryQG2YgO6qSpCCVuJHKUw-1
X-Mimecast-MFC-AGG-ID: 2ryQG2YgO6qSpCCVuJHKUw_1743391549
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5C508180AF69;
	Mon, 31 Mar 2025 03:25:49 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DDE99180174E;
	Mon, 31 Mar 2025 03:25:46 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Sun, 30 Mar 2025 22:24:14 -0400
Subject: [PATCH v3 3/4] drm/panel: deprecate old-style panel allocation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250330-b4-panel-refcounting-v3-3-0e0d4e4641eb@redhat.com>
References: <20250330-b4-panel-refcounting-v3-0-0e0d4e4641eb@redhat.com>
In-Reply-To: <20250330-b4-panel-refcounting-v3-0-0e0d4e4641eb@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743387855; l=1175;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=Twe1CysgUNTNxjLGPaIExyaLHYsOasZCKyjWS8eMjhA=;
 b=qPYwBUSgg0/FV4MK0h42rjCekrEsvS/zH6bc8ugbOnDVh6oEkGewYpYksG9LqvTAJnCne1AO/
 JaY6xXQXikCAM5NS8iXo9DIGebCxN5vAU2yzgaW5x8t0Vc9Pte4LtUN
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Start moving to the new refcounted allocations using
the new API devm_drm_panel_alloc(). Deprecate any other
allocation.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

---
v3: none
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

