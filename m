Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6808E1B0437
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 20:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749500891; cv=none; b=YeB4oQjYhvYrXS11j4J7memwOdIW/PGHucSEbva+mY/BNQ0Iz7J6qLTYT+imUfMnGklVgCt3CbGe4XJ9ikyUkRrRVYTGgdDVSJ2vhzouh7ibGOxItu8X+T5LOas/nY5nH1m3NYmumlewpZSldBbSnn2KwCGYs7884XZ43/Ldosg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749500891; c=relaxed/simple;
	bh=II8PZUW5ORAzjioZRa3MpMJ9qwbWDlJsV6RVgKU4sPI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BtJzZdNVDFrxVWB0tiDsxy3+3cG4+Sg9AHuGp+QSip1apQrbyGuinoayQgE6LDQOUnmVK9+9BiASV6ZnDZg0ELL9xC7S5HwbFiwHW8gvazmh34FWlf4w0K2DCYncxFFv3EHGGrOGXBVHy0+viOjjy50a14Uu5YsKKEsqMI19KRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=CxSV32uE; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="CxSV32uE"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so5201302a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 13:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1749500888; x=1750105688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1YNdkh4f50qGj4udq9yd9F8fSqQokpTZY+wMNIaqBZU=;
        b=CxSV32uEPhy/Kh1hJCqie5ujyXdlPXcb51Tjfxqm82sIh+y/AL1vnfrUeQHyTHYQjt
         hoUsnthB86w4hq+PzTDBb7uUOXUaBRQniTLq+mtDZA7QIwjMuY3lVZ/o8M7yk0T9z7U5
         92IXK38RtOZWhywlHCQ48wGB+3x8xRzlg9SSZI84XJvM7EVHZIvC1S489lTssiDijGht
         soNBGANSrzol2qBpRCfhXoo4cMUZmMs4kFkh0IYPQyf3h4/j2lTmGecz0b175QBT8o+q
         omDRY/TwnONCfcocH3sx5rMpFQ7rE0Qu8CdOOHvdn0DE7D5+0pOeSZV6oDLKsK6uEoHI
         cJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749500888; x=1750105688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1YNdkh4f50qGj4udq9yd9F8fSqQokpTZY+wMNIaqBZU=;
        b=muOlFkv+z5U+IIqevn+euxHULg9tQQ7OoHZYX2JHIoFt7icxUIAWnYFOAJrVxiWHlz
         EmtDedU95RByxuZipPyIz6equKxsLght5vKFML+0nB7Cr5jGOLbsNXvBsjzFEJOzJ3yE
         HodxgKaq8jXYo7Xr0wLFjFcYq+/kZnIgWZ76Svh6ADLI+y3lpz5yauwwZVIjXNpBDqjT
         eeER7BzgwjM6bei1fn76ybNKpbKiLO4yIU9e012NYunm41ZWRzlcW0IKd6588lFCH87Z
         YWZVaI4KNPeZYN/nTYm6tplN0Ljry50wP6qGU9pk1y3rqCLJ+OkZmU9D5mH9VBESnp40
         XKdw==
X-Forwarded-Encrypted: i=1; AJvYcCVaod4kjCuR03JrK7dOp+bf5L74A/HEs9GEy+mJ2F4Wu3+Rhtw5nv5p/mRP2oHM/bUyLGB2KBcPF0fcb6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRBR+TkqK+ZKiLCS1ETUX0ALkBiq9Gk9kdedTaVhbdEC7b6IN0
	lC1ho1oYxf0BMtP3ywWAE2MsUht9n+pk32jpYkcB43vSfszFlfsMM0CagNemVg==
X-Gm-Gg: ASbGncuTpXKjPNjoy9zzFDd9CCBBupRRk3WxMOPO2gZtiC3nIC1Xm74ZydMdvFH1HCh
	Pg/AQ1pgsjrmeYESk+s57BNABBv6cQCyWwaEQQJ1rXE9hDVtx3em5ZFqATuqpS9K+PK3jOxIXpq
	gxinT4PWN3iEjHEw2fKMJkZofH8yBeasD2ICRqlP4OCYN6pYzfxoEAqIF2q6EmdVz5fPwedK+9X
	MqQSBh0PRjZLUs1jevHXkxll1SPuQzSpj54PN6jjZKPUkWQDDyQcemtHvPwziuQVOyLCLVz5tlI
	0TmDDne4DGHKDhlttLhAkd+RcNUrYqQHjYT4dm8lkLzlCr1TKIF2cKxKel3Ciq5Y3ZdeUjK2AT8
	EHBJbwLpKV5E5ReiE8miefypRLctvRByRtvyzZg3llr6StAexOO9QziKZwCpgHaoN8TQsadHj/B
	wG6UT2sR19NW4RJTVTMw0YjQd7OXxfdcc=
X-Google-Smtp-Source: AGHT+IFi7MkYch5ZiIQCrja1K+1GnPJzZYyvzsdQM08R79bAjY5eVBMgahZGzkClFbVhMfH45r3M0Q==
X-Received: by 2002:a05:6402:2693:b0:607:f55d:7c56 with SMTP id 4fb4d7f45d1cf-607f55d7cedmr4103975a12.25.1749500887401;
        Mon, 09 Jun 2025 13:28:07 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a839-7f00-f22f-74ff-fe21-0725.310.pool.telefonica.de. [2a02:3100:a839:7f00:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-607783e654asm5021219a12.69.2025.06.09.13.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 13:28:05 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v1] drm/meson: fix more rounding issues with 59.94Hz modes
Date: Mon,  9 Jun 2025 22:27:51 +0200
Message-ID: <20250609202751.962208-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 1017560164b6 ("drm/meson: use unsigned long long / Hz for
frequency types") attempts to resolve video playback using 59.94Hz.
 using YUV420 by changing the clock calculation to use
Hz instead of kHz (thus yielding more precision).

The basic calculation itself is correct, however the comparisions in
meson_vclk_vic_supported_freq() and meson_vclk_setup() don't work
anymore for 59.94Hz modes (using the freq * 1000 / 1001 logic). For
example, drm/edid specifies a 593407kHz clock for 3840x2160@59.94Hz.
With the mentioend commit we convert this to Hz. Then meson_vclk
tries to find a matchig "params" entry (as the clock setup code
currently only supports specific frequencies) by taking the venc_freq
from the params and calculating the "alt frequency" (used for the
59.94Hz modes) from it, which is:
  (594000000Hz * 1000) / 1001 = 593406593Hz

Similar calculation is applied to the phy_freq (TMDS clock), which is 10
times the pixel clock.

Implement a new meson_vclk_freqs_are_matching_param() function whose
purpose is to compare if the requested and calculated frequencies. They
may not match exactly (for the reasons mentioned above). Allow the
clocks to deviate slightly to make the 59.94Hz modes again.

Fixes: 1017560164b6 ("drm/meson: use unsigned long long / Hz for frequency types")
Reported-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Special thanks to Christian for testing (off-list) and managing so I
can do better testing myself in the future!

This is meant to be applied on top of "drm/meson: use vclk_freq instead
of pixel_freq in debug print" from [0]


[0] https://lore.kernel.org/dri-devel/20250606221031.3419353-1-martin.blumenstingl@googlemail.com/


 drivers/gpu/drm/meson/meson_vclk.c | 55 ++++++++++++++++++------------
 1 file changed, 34 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index c4123bb958e4..dfe0c28a0f05 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -110,10 +110,7 @@
 #define HDMI_PLL_LOCK		BIT(31)
 #define HDMI_PLL_LOCK_G12A	(3 << 30)
 
-#define PIXEL_FREQ_1000_1001(_freq)	\
-	DIV_ROUND_CLOSEST_ULL((_freq) * 1000ULL, 1001ULL)
-#define PHY_FREQ_1000_1001(_freq)	\
-	(PIXEL_FREQ_1000_1001(DIV_ROUND_DOWN_ULL(_freq, 10ULL)) * 10)
+#define FREQ_1000_1001(_freq)	DIV_ROUND_CLOSEST_ULL((_freq) * 1000ULL, 1001ULL)
 
 /* VID PLL Dividers */
 enum {
@@ -772,6 +769,36 @@ static void meson_hdmi_pll_generic_set(struct meson_drm *priv,
 		  pll_freq);
 }
 
+static bool meson_vclk_freqs_are_matching_param(unsigned int idx,
+						unsigned long long phy_freq,
+						unsigned long long vclk_freq)
+{
+	DRM_DEBUG_DRIVER("i = %d vclk_freq = %lluHz alt = %lluHz\n",
+			 idx, params[idx].vclk_freq,
+			 FREQ_1000_1001(params[idx].vclk_freq));
+	DRM_DEBUG_DRIVER("i = %d phy_freq = %lluHz alt = %lluHz\n",
+			 idx, params[idx].phy_freq,
+			 FREQ_1000_1001(params[idx].phy_freq));
+
+	/* Match strict frequency */
+	if (phy_freq == params[idx].phy_freq &&
+	    vclk_freq == params[idx].vclk_freq)
+		return true;
+
+	/* Match 1000/1001 variant: vclk deviation has to be less than 1kHz
+	 * (drm EDID is defined in 1kHz steps, so everything smaller must be
+	 * rounding error) and the PHY freq deviation has to be less than
+	 * 10kHz (as the TMDS clock is 10 times the pixel clock, so anything
+	 * smaller must be rounding error as well).
+	 */
+	if (abs(vclk_freq - FREQ_1000_1001(params[idx].vclk_freq)) < 1000 &&
+	    abs(phy_freq - FREQ_1000_1001(params[idx].phy_freq)) < 10000)
+		return true;
+
+	/* no match */
+	return false;
+}
+
 enum drm_mode_status
 meson_vclk_vic_supported_freq(struct meson_drm *priv,
 			      unsigned long long phy_freq,
@@ -790,19 +817,7 @@ meson_vclk_vic_supported_freq(struct meson_drm *priv,
 	}
 
 	for (i = 0 ; params[i].pixel_freq ; ++i) {
-		DRM_DEBUG_DRIVER("i = %d vclk_freq = %lluHz alt = %lluHz\n",
-				 i, params[i].vclk_freq,
-				 PIXEL_FREQ_1000_1001(params[i].vclk_freq));
-		DRM_DEBUG_DRIVER("i = %d phy_freq = %lluHz alt = %lluHz\n",
-				 i, params[i].phy_freq,
-				 PHY_FREQ_1000_1001(params[i].phy_freq));
-		/* Match strict frequency */
-		if (phy_freq == params[i].phy_freq &&
-		    vclk_freq == params[i].vclk_freq)
-			return MODE_OK;
-		/* Match 1000/1001 variant */
-		if (phy_freq == PHY_FREQ_1000_1001(params[i].phy_freq) &&
-		    vclk_freq == PIXEL_FREQ_1000_1001(params[i].vclk_freq))
+		if (meson_vclk_freqs_are_matching_param(i, phy_freq, vclk_freq))
 			return MODE_OK;
 	}
 
@@ -1075,10 +1090,8 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 	}
 
 	for (freq = 0 ; params[freq].pixel_freq ; ++freq) {
-		if ((phy_freq == params[freq].phy_freq ||
-		     phy_freq == PHY_FREQ_1000_1001(params[freq].phy_freq)) &&
-		    (vclk_freq == params[freq].vclk_freq ||
-		     vclk_freq == PIXEL_FREQ_1000_1001(params[freq].vclk_freq))) {
+		if (meson_vclk_freqs_are_matching_param(freq, phy_freq,
+							vclk_freq)) {
 			if (vclk_freq != params[freq].vclk_freq)
 				vic_alternate_clock = true;
 			else
-- 
2.49.0

