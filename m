Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A92A31
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 20:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749242260; cv=none; b=Otp7Jz6TfQ9PxA4gWbgzNg5Ik+OQuoeJn9i8abXcNzdkHCxX7c+bj0By2mzWnVBTiog16t4bgZ0E/aw4MrHnX0U0ruKKbxLO9GKBVS7Da+Yr0zTtQNDQeybrGlKRuzuUiB00p+5cLseMCDFJUze0WEl6o5kR52YLKbRdhG7RNhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749242260; c=relaxed/simple;
	bh=Ye3sO/o4+ObzwtcTvbSnxEBgJQcMTxZpFCntcYqtcEI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CVasB8pp0CJ/7zXwa6MYXKSeLbXYyBRCbdAgZnSlbC45h02bQdJX+m2gXJkYNi81cAnWS36bbg1ddqNO2zLHXjZ8f2I6kXgQuVzGp+eUyy24SlifEBj+BqKvUeNWpveFzsV19YgR/b83RS62pmACDcjBKAzQc2iTnfwhWh+lGLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Vco7xuwS; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Vco7xuwS"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ade33027bcfso79641866b.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 13:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1749242257; x=1749847057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fTnbotTKBrDuh9yFMLlTHsKfcYmOYKw+giMri+h4htU=;
        b=Vco7xuwSd3X71jcRkTH/c7H9I4DYAuTSqEb9xk5rvdaESKgXaJzznvKqWWut1smVcS
         TnRsOPaRK1GNj2jtDBTSbmBbl9pLjvZlAjFnD0vbD7lGDAxXMywTPPxLuPPbLDngO+xt
         dQOFwRrD7V6gUbrZlrjCtGJvKI2gTR4qPDBjySru421CvLhhyfg7K01wjvszWKvcOxLo
         G+TVYODl48OT8tp3lLyh3q2Ed6XNqeZZsYKwXGZXyctG9UaeP8/P7TNhV6D49VDU2gWe
         g+Y4kwNPCA1TP4qvrW7I7XjkfY1RIKHV0lGC1z8W+ct6bTPwOQo4yD6ITBESUCXiidLU
         BWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749242257; x=1749847057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTnbotTKBrDuh9yFMLlTHsKfcYmOYKw+giMri+h4htU=;
        b=nN51SzWLNLRC3LyHRG0FQ3uV4zxlySL2304efCsx7rWxdl3y0PNeDU6Cm8VbnpqR5E
         t2xkvm+8mdocUkl48LyFZqjH1e0xUeEU478cN+L7dECtmb98M6E5OTimOjii6YYm/uVm
         G/2NDnwUEtPk2Wi3ck4huSxtRhVskN9EM0HzcqGf5QN9iAuaB9c+1i5veyvBjcV0f/bu
         TQSXg7frfgyPwwj6qhAmySV/56vZNrtzhfjy1yBe1mrQNZqu/K50JIoE65UV6TF8O0NE
         vn7tbc7jg3kPiWD0zYm/h2ucbYxdDJ+kTWfsOD4Yr7OfCgFq68EmSDGU3KB4G6QaMmoR
         2y6A==
X-Forwarded-Encrypted: i=1; AJvYcCX+1IqqB3f48adIHo1fPjqSx9WuPQ1+mV1xQMBnlTY9BGS8uzQ6fS27r1atJB+Gh+Z6As6Eq7p4w9MgGs0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7rTnl9DVYoUOjhYR03ofzSimOYPihuI639CVlimZC7MVmSMdD
	n6drDt1vWA437r/fTVrld3y+mYb3vWoKg724lnedtjy4zCz6UsOpeRNZ
X-Gm-Gg: ASbGncsypKEPccKRI8x/fnt4TFmTVAt8nd2yqI/5tgP4gLAUM8W3LshvrE+KZu69CJ3
	pQmeZrEHTtVt9rBsl84nbZ3SmU8V8yXQoMLxG/z/E/jkTnQPvvNKhJgwOHhw0Ve8cqEw+iKrsEM
	XWMUS8B+LVfEYzY9wb8At9StHQaY0q93Z8oQ5dweFgtFCYZALRRZlOsAKlz5LOnGtr2oHd1D5Ym
	JwisE8yhl02qyaPPGc7kiK29+PbRySxcWMiTK9GV+6TcYsCrDLmrqjuMnL1x6rRpxKi4Zf1N90u
	uMxminfv56DPr40k9o2mQSKD7G0c8QEeTM7ToOYHu+LxYpk4nZZMpwkIVMqXcDRcpucbUQA/WjS
	u61T+ucaT3Cl63Q/JmuoP04tMBX1htiuxDUIRuHiAx2Gjyu4wfNxi2kbQfPa4I9gR2WBFjVd/Rg
	8n0EYNGnKcbRXwctJ5bhZykeocWnD4vQ==
X-Google-Smtp-Source: AGHT+IFdovf47zA5w77hCKENzRX0iCD+h8wdbY0d2TkUMANo/kiX7t5oGgF0SPw/Z8mbPgOCYyvO0Q==
X-Received: by 2002:a17:907:3f95:b0:ad8:9811:c0c2 with SMTP id a640c23a62f3a-ade1ab2b859mr396798066b.61.1749242256967;
        Fri, 06 Jun 2025 13:37:36 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a016-f000-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a016:f000:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ade1db55f3dsm172072366b.60.2025.06.06.13.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 13:37:35 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] drm/meson: fix debug log statement when setting the HDMI clocks
Date: Fri,  6 Jun 2025 22:37:29 +0200
Message-ID: <20250606203729.3311592-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "phy" and "vclk" frequency labels were swapped, making it more
difficult to debug driver errors. Swap the label order to make them
match with the actual frequencies printed to correct this.

Fixes: e5fab2ec9ca4 ("drm/meson: vclk: add support for YUV420 setup")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 47136bbbe8c6..ab08d690d882 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -109,7 +109,7 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
 		venc_freq /= 2;
 
 	dev_dbg(priv->dev,
-		"vclk:%lluHz phy=%lluHz venc=%lluHz hdmi=%lluHz enci=%d\n",
+		"phy:%lluHz vclk=%lluHz venc=%lluHz hdmi=%lluHz enci=%d\n",
 		phy_freq, vclk_freq, venc_freq, hdmi_freq,
 		priv->venc.hdmi_use_enci);
 
-- 
2.49.0

