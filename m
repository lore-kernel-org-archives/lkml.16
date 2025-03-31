Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896ED21D004
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 22:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743459983; cv=none; b=gbTHSezxaQF3kD6DzEnXYEU+AaqvNRrzN0tZWsGRznFDkGRgcauuSAqRIAhSG647p2xRUZXGl36oiwcCxDJEDjDyKd6IgfDGU1TOzTFfDqF+x3uZpOEBqNk4pBpBXt8hFF74H9FtVqkB70p4vOGt492ogm+j+Q9bm2RgeedDXhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743459983; c=relaxed/simple;
	bh=G+h8Vv1nIonXTEqmPG0VP5c6zXmyRBtxfLm0szpz5h0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mIEIRDFdW82qSwcbUlAXP+Ewy337iJu0erbiIOH0OBtCRZGaDtROY27ZzlrXRxmsjLvcy5BoxEn/3FFjLt4eTNIza+2Q5U/2qvuo2uaKxyLz1WYh7FCxe61VHDIN/4P9RDHCGAjzgaOZ49JGMQKooqu/njzGaQtUhobITePeN3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gASujaQr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gASujaQr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743459980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vazbmnh2p/8Y/HbtcgJOPCDcyzzw+Nh7b3+HJoKIob0=;
	b=gASujaQrGD4Uy9xW1irGmHFMKD7TI50u54sSCF42SUzX2g+coSG+8V2HfnI5xJObxBG8Nr
	aCZGak8CLskykKA1uwbQnG5F8awgKtNmOII6FULZCrUEr+SlUkxEISVTsCOBQr03xoUYV7
	cSc/1DRMvUn+lzM5fMuSF9pPm65m0l8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-650-ZpWkDCeVOua9RMSeiF1dew-1; Mon,
 31 Mar 2025 18:26:15 -0400
X-MC-Unique: ZpWkDCeVOua9RMSeiF1dew-1
X-Mimecast-MFC-AGG-ID: ZpWkDCeVOua9RMSeiF1dew_1743459973
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 91DA01800260;
	Mon, 31 Mar 2025 22:26:12 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.80.91])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A09B7192C7C3;
	Mon, 31 Mar 2025 22:26:08 +0000 (UTC)
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
Subject: [PATCH v2 2/2] drm/mode_config: Make drm_mode_config.(max|min)_(width|height) unsigned
Date: Mon, 31 Mar 2025 18:23:55 -0400
Message-ID: <20250331222556.454334-3-lyude@redhat.com>
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

It doesn't make much sense to allow devices to specify their min/max
resolution as signed integers, and in Rust with CONFIG_RUST_OVERFLOW_CHECKS
enabled this provides us actual over/underflow checks. Similarly, it
doesn't really make much sense for us to allow devices to specify their
minimum/maximum resolution as signed.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>

---

V2:
* No functional changes, just update the commit message w/r/t Thomas's
  comments.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 include/drm/drm_mode_config.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 271765e2e9f2d..4b8f0370b79bf 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -532,8 +532,8 @@ struct drm_mode_config {
 	 */
 	struct list_head privobj_list;
 
-	int min_width, min_height;
-	int max_width, max_height;
+	unsigned int min_width, min_height;
+	unsigned int max_width, max_height;
 	const struct drm_mode_config_funcs *funcs;
 
 	/* output poll support */
-- 
2.48.1

