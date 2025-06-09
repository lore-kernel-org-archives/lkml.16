Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E480DBA36
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 13:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749476152; cv=none; b=aB6QG/2hI2dGLaG7TDr1eqj+aFlGTFj57C+4oUut2VOOtGW9LMzu3GqxcQFKmBxhZPscdmu+ILqyEnR5mOSk8uKbfpOIPVxamF3i4zcHeSIbs26y2Li/q7wAmcAL0wJElcmXPrLZBz6gDUUdfGJggWE4pJfeKFxv0t5bXUki77U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749476152; c=relaxed/simple;
	bh=N8bYO7LLQ632cobaTZybB6HV6H+J3kJMUJqYn5h+hTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VLO6lBYNtUN1eNOhRxSX/B4zOECbdRNj8OBf8zfx4chOuFqIsZkdPNkD2bkH5g/u+cPpKIrIy7Fta5X0QzRxnWnpveVX9wAxXAq5t45vSMOyoCc826mxDyIDrZp73slDuKrHZ0CwUR25kUzD9re2ZZCXfh2VpsQWgOUvWoofSpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5EhKjwr; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5EhKjwr"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so1549442f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 06:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749476149; x=1750080949; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yjjPZ8IQoCrPDiUSgK7PqlqTNZ9ZsE6eNw3NT1KnR6c=;
        b=S5EhKjwr3BmMBiPWpLKkdg8DPKZmlXzbs4uFUu158B8RSKZ/eTRSZq6+1L/O/Nklki
         W0Jmz4L9225RQigkw7pdvgtffNriuFLOGjdoGJohpyRKCi/xEGZ874bqIEFJLS3uqU3T
         aFztZWn0NjZpku9HtUFATTCMoOHOtAOpTj29oOTQugRIehUhAl49fgYPNbb81JuilGbH
         bNLwS3ML4N1xxUBGmBUcrnsAVrxTcqUPJ7pAz4GA5l0/Mxw1KMRRrdgc0BS4B2Dcrj50
         v7dgPqtwFDUUGg697vG4RAuHy2l95LCYDJoVSrlbZOWa7G8UW5yp48Ynis/scuGl3Zop
         sKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749476149; x=1750080949;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjjPZ8IQoCrPDiUSgK7PqlqTNZ9ZsE6eNw3NT1KnR6c=;
        b=wJxmEn1uePSwNKQQVsXK1WUnWNtFJxXxz4XpyVs/xiVpRHMXgJ98197WP4PJ8xoJEm
         YfiFqNJGmYeted7xsaJNa8uZzsnwVd1mRpQnaSrTOOSXFtysSdYsM20kf4J04br9gFEG
         h6aWlQMWECqhE4RRZiRPoP3JyuhNOomAvuU45MZqNthe2fP52S7r0KUMbR5nxfQ7vOjT
         N4zIDSIHxXfkBKE6ibBQKhuciLvzHgNg0QbmuAoIQVj2wZMl6064zQY2oMurTVjuRK19
         XhAczzWb978Sflt3vmO7OsnVzgKc+XDKwDFAbFe6a7bQTl8G6UVFMha6plpHUcZ3uQcV
         tbjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlLm78jPTwfh246GSJL/32hhA26Ggr8iqaHGPXqKVQjY7gv6IzszAwGGbxjQHHWJyjBkH+d9PRHQnxt/I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLKSs0XNRgBnnT4NE1+r25orq244UjflSw1EpMJDzfMaClAFtR
	An/Z3WJAi+nntjRhcwdHRTTspT5DugizvBS7D4O46Wy6XXuFZ0isA+9RKiOBpA==
X-Gm-Gg: ASbGncvC3HGFrKG/FWDlbKshjITjGfBfOkiSiuWGR5UwbHU8Ud/wRoj1Hm4HfwlcuPl
	QS39Y6l3ZmbcjDNES3uR6psW4P9q2eqOgyMAhXHGhqVuZyFgrP9slTl7wGSRHGLdbJFVZbB2Mto
	Fhtl9wc2HKJ/6BHo4TAssCooYVb42VAFsgrTl01QH/zpLr0x8Id5r99YhU1GqTGUQgvwMS2af79
	IiUro2zHmBM0Ncvjfb/pRRy6r6527m8WBSHQ9Y3HMnw5V7212ceW6FCo+csfLmnILa8YAANQR1z
	lT6KFp4/x+XqOe8wDy12Elr4HT73rZrJgGy8q4IddXT5oXMg+a0=
X-Google-Smtp-Source: AGHT+IGGzUSDC7mIgTCMpDu41hE45aqKcJRnUYi9VdCFDGuv+PfFNnZPug25wJZHIWl7CUoxFqVFHA==
X-Received: by 2002:a05:6000:400c:b0:3a4:f7df:7564 with SMTP id ffacd0b85a97d-3a53166eb0fmr9297865f8f.0.1749476148837;
        Mon, 09 Jun 2025 06:35:48 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a5323a8c79sm9430096f8f.27.2025.06.09.06.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 06:35:48 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 09 Jun 2025 15:35:37 +0200
Subject: [PATCH] drm: of: fix documentation reference
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-drm-misc-next-v1-1-a17b11a06940@gmail.com>
X-B4-Tracking: v=1; b=H4sIACjjRmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMwNL3ZSiXN3czOJk3bzUihJdozSTlBSLNAuLpCRLJaCegqLUtMwKsHn
 RsbW1ABvbOmNfAAAA
X-Change-ID: 20250609-drm-misc-next-2f4dd8f88bb9
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1705; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=N8bYO7LLQ632cobaTZybB6HV6H+J3kJMUJqYn5h+hTE=;
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBoRuM07Mg0o4IBy816X2qh2A9uDfk5ipzShogqS
 x3ZxoozAbuJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaEbjNAAKCRDnIYpo1BLC
 tQbnD/9S8F4ANI3d+x+/W+0E5QFO2PJLsKHHW5GX+81D3Yf8WcrZ7cITBQCgDLAIOPGakjUgR+2
 6zWD/wLaw9y+SFjnufPc6LhxLjZ0sxWNfrZtQQjz5U4OcN77fhZ+i2kz6R3VYo3jTzUqCv9LvpM
 cAW0Rt8u4VsbIFi6AfUmDKsWTMO38ZsjCMNL9xe9LRy48jkIeZAPMdjwaL3jxOXDshXtVoqrsU6
 w17M2XMmjyLjZyKQNQfT1iGnlgtypiLkmc1GngBDiU5+kjQqVYn9kQCa6AqN4iOYqptKaXVKNj8
 7qyUzqbmDOAdIP2PmOFx9U1MVQxsxhxocfT9LzGGr6totlyweOkd/4ARw/K+/Tkz3vnVG1twFsK
 dM/CCJC6HG3wjaPM1tpTPWe2OaI0uzShSOOyrK7Bpw1+Cv9Adm4m01HVsf7IKU9yakZ48qoWeFU
 tu+QHwAU5m9mRRpXvR+fVg4XWAMlEF8keHkMcsaVrhuTY2jD6LOxwaCUegI/DQN8hb26Z3oBpUN
 Wz4GKXBLirAnvO4scDeOPBxSyNlUSkJ/IWpNHS5x3blrSfSiaTlIiJ3H5fnu3Uf0iK/4C3u4L40
 TvyOuT0OjklRukO4xY8McUFoIBz4uc/+BbzT+ezehvmYxO289zv739hlAOHlETbBlt1tC46XZph
 EwtuGxikw9MV7zg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Documentation/devicetree/bindings/graph.txt content has move directly to
the dt-schema repo.

Point to the YAML of the official repo instead of the old file.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/gpu/drm/drm_of.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index d0183dea770308e77f05da364ffe087d53f3be36..4f65ce729a473ec372bd76a60ac11a40ffb5df97 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -55,7 +55,8 @@ EXPORT_SYMBOL(drm_of_crtc_port_mask);
  * and generate the DRM mask of CRTCs which may be attached to this
  * encoder.
  *
- * See Documentation/devicetree/bindings/graph.txt for the bindings.
+ * See https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/graph.yaml
+ * for the bindings.
  */
 uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
 				    struct device_node *port)
@@ -106,7 +107,9 @@ EXPORT_SYMBOL_GPL(drm_of_component_match_add);
  * Parse the platform device OF node and bind all the components associated
  * with the master. Interface ports are added before the encoders in order to
  * satisfy their .bind requirements
- * See Documentation/devicetree/bindings/graph.txt for the bindings.
+ *
+ * See https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/graph.yaml
+ * for the bindings.
  *
  * Returns zero if successful, or one of the standard error codes if it fails.
  */

---
base-commit: 6f392f37165008cfb3f89d723aa019e372ee79b9
change-id: 20250609-drm-misc-next-2f4dd8f88bb9

Best regards,
-- 
Raphael Gallais-Pou <rgallaispou@gmail.com>

