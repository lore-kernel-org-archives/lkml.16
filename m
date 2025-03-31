Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A076221ADC5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 22:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743459980; cv=none; b=uB2+8vrZEmPWi95eJkj3zX+3Mh0G2sf5YPHBHrX9pni5Zodd5pdL8dni9jra6ks7Z0mr5hudcw7KkHkgm+bGBMOaPRejhHfvpXzOospAWHLCCfge/Xw8eskq8M1zO/Gw+M0NLYbUZC3TuYBjVbtYSplM8OgSmmGMh4efeeHH4PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743459980; c=relaxed/simple;
	bh=b3NZd8lRjWdgZrRMhVMlVR9D82eGDjxo/v7uxmoT7Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mlmEGAigToSr207fFG/H+7Sf3Y0ucHctG/3tzzRLRuZU3WOimRlrSrdTzgALfABNLrWANBXZoJthshfGpe/NbPA8erEvaz8IPCSg7vdOdJiJoCxSGHeYTxN6sdxf4nOSjchyrtOpFBr270aY/OTeorW1QXnph2QR78TNHoVxIro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZMECZZ52; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZMECZZ52"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743459977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oL4VgFunpcFWrKBnGaiqT7XEJDD7E7ONd4E7vrw+V2I=;
	b=ZMECZZ52bKfsKMqKqwcDEJFlU7KixfQ/WQg1A7lkDf5bu245HhRAiaVrHuxSQ4SxxqSXtQ
	IE5XbjD0nQSHyt3Ht1cCmKYPKGtzl09Q6fIyXZ2U+Ne4EGyGBZmca1cUCiy06FzJBwenej
	a9OBCInQFxtreVMsrr4v1mUedYKgcWg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-681-IeKpkbiKPMyI3CUGjl4DMA-1; Mon,
 31 Mar 2025 18:26:11 -0400
X-MC-Unique: IeKpkbiKPMyI3CUGjl4DMA-1
X-Mimecast-MFC-AGG-ID: IeKpkbiKPMyI3CUGjl4DMA_1743459969
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2DAD2180AF50;
	Mon, 31 Mar 2025 22:26:08 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.80.91])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 102491955D81;
	Mon, 31 Mar 2025 22:26:03 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: Maxime Ripard <mripard@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org (open list:RUST:Keyword:\b(?i:rust)\b)
Subject: [PATCH v2 1/2] drm/edid: Use unsigned int in drm_add_modes_noedid()
Date: Mon, 31 Mar 2025 18:23:54 -0400
Message-ID: <20250331222556.454334-2-lyude@redhat.com>
In-Reply-To: <20250331222556.454334-1-lyude@redhat.com>
References: <20250331222556.454334-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

A negative resolution doesn't really make any sense, so let's make these
parameters unsigned. In C this doesn't make much of a difference, but Rust
is stricter about signed/unsigned casts and additionally can check for
arithmetic over/underflows if CONFIG_RUST_OVERFLOW_CHECKS is enabled.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>

---

V2:
* Remove h/vdisplay < 0 checks in drm_add_modes_noedid()

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_edid.c | 10 ++--------
 include/drm/drm_edid.h     |  2 +-
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 13bc4c290b17d..1e69326283dce 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -7099,18 +7099,12 @@ EXPORT_SYMBOL(drm_add_edid_modes);
  * Return: The number of modes added or 0 if we couldn't find any.
  */
 int drm_add_modes_noedid(struct drm_connector *connector,
-			int hdisplay, int vdisplay)
+			 unsigned int hdisplay, unsigned int vdisplay)
 {
-	int i, count, num_modes = 0;
+	int i, count = ARRAY_SIZE(drm_dmt_modes), num_modes = 0;
 	struct drm_display_mode *mode;
 	struct drm_device *dev = connector->dev;
 
-	count = ARRAY_SIZE(drm_dmt_modes);
-	if (hdisplay < 0)
-		hdisplay = 0;
-	if (vdisplay < 0)
-		vdisplay = 0;
-
 	for (i = 0; i < count; i++) {
 		const struct drm_display_mode *ptr = &drm_dmt_modes[i];
 
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index eaac5e665892a..b38409670868d 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -437,7 +437,7 @@ bool drm_detect_monitor_audio(const struct edid *edid);
 enum hdmi_quantization_range
 drm_default_rgb_quant_range(const struct drm_display_mode *mode);
 int drm_add_modes_noedid(struct drm_connector *connector,
-			 int hdisplay, int vdisplay);
+			 unsigned int hdisplay, unsigned int vdisplay);
 
 int drm_edid_header_is_valid(const void *edid);
 bool drm_edid_is_valid(struct edid *edid);
-- 
2.48.1

