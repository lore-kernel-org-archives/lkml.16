Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842C11E5B89
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 20:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745266398; cv=none; b=gTJvqWYVFe0q59wRqvLElXastEOY6AFqvd6y6tEQTR3Qch6uEBUmYKz9YpPZJMPk4MWfTaQMS/MgVHQjV17I5zCzo0PxTasP8hze4ShNmKzKUMvV8O1wE+6psrdWktZ6UI9O0h6Fi+L+jTW9NzOeMJ/6B7NHlgHxvACv7FTUcrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745266398; c=relaxed/simple;
	bh=/jot4spygDq6aFrjcdGc8ey22UJakZ8GONE+CcJB/pE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DXXrBQB4mNOV5lgLi6UDp1WqWVMnM0/j4IbG9wAe/tKXed2ZX5lWkZGo8ybRCObV3oDIypevxLdEnVPcsKKjIPO4WdlZOtHpPLWkduyyrT9eNAzE2HmQYZlcIVhvzz2YoOjt1xqyWSVv2e/vrocMQqIMslNQE4JwEmkfGQ3cv94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=kCAWLWCG; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="kCAWLWCG"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so7168347a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 13:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1745266395; x=1745871195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pPtaoI6utTrKKW12z4v7ojubkyOrmx1+ChT5b/t83TQ=;
        b=kCAWLWCGpUG852eSmfP/47NZizRiPPlq3YeFgV0kmLbmmFHv9Qkeqih2dGJkKsdaJ5
         D0xwKHERt23HfNj79yvCI2d659Y3TN0RbvYorVPBh+j43d44RGhCewRklxGLJq48p95M
         Oaspo2OYAgn1gVpHwKMi33OrTvrBYl325L3u+9gD9XfXl3odzmnB5mtxLBrMTdSlH0HK
         Zq49n0OaefWp/tMlt8SXhH78I4qWgUcyAfcS7KOszGdk1Kfs7l+KVvLMq4SNys8MbcXz
         76eQYJJvjeJJuNhrnqUqeqw3/c5bu723VsKnI621CGGCXLmbO6YDDI385YUCT4LGG3sz
         6RrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745266395; x=1745871195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPtaoI6utTrKKW12z4v7ojubkyOrmx1+ChT5b/t83TQ=;
        b=WOsl6MH1hLCNqze8UlAHBmZul2J5r3JEamQx3s+j2X8FJGEqaUVMcS/AtZOuPnIidH
         bGoe4KnOk938P3jtBcHAnE6hW+elYjNNfpOyeOI/zQjMt4vT/Gu374U1Z1gsAhM5fMYw
         FNY7e3g3hEzzLYqg5gu08xuXCIldT4iQ/YXQH9mzZSG8o3DbJLwq8RDfl79j7TosUlsS
         +9eG66r25gbNwKe16jftkg8h1XLVU9LS7IHWurQAHCt0VNKYhqxWHWu1Bha8NdLV2Xeb
         EvoeeEMFk6ZQAOhNP1Tx7QVAQEhDGbJ4l5b7YQ/vzZFSxAEgb+IsuQLwusIeb95RjaR/
         wK7w==
X-Forwarded-Encrypted: i=1; AJvYcCWTUzfZ+jjgDBkP9nbPK3AgylWVYo+JX4i7OXzoag548BUOWDITD3C3Yk0sqLzIbgvAg6mb5ZMj1Oq6BII=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHjMgf9HrFePkIGTA54x+JGcS9KHxSsNJ2ymJDn2/sf29iOqCv
	eEtZ1h1AK3BFOyQzMGXN+j8bc2adj2ucMJ8dJzatemCTHFGVk771
X-Gm-Gg: ASbGncvgwVoEMiDp+a9MqNLHFVvlKtkSwSPFaLV/Y4LaDmCMS4sUwmIGTd92znJ0xEu
	TGBz6DHJf7JQIrx8F1kdAZfVawguBITkrQoUEchMryq2DYEHZzOfQMDlIMRaT0EyUDYDxyi+b44
	z6KlCPSU//bwlf/KwUhgsDib9HYi3+6V3Hh0pF9yyQmG2vwEPOnS7/NYc+LfLt/jd6oONMX2GhC
	7PEEa+O2KwRW64SjNyczG86Dm3Lp2O56qYCK89muS2xsD3n2LaITzGzywH7YuGx2M3mWKvJpd9z
	pj7WG3t43heuOMnQD9N6uwJMV5EJ9qZVlohChqldEEcts3DrWDSVFL958AfXd2HQB/JabovGYYL
	sMK8zVXXZK9Gc0KUUEVKu+D7q8p6O509meEoTWR4D898s2PSXrmlnLJlIAuFiaTePgB28GNCqAH
	C/
X-Google-Smtp-Source: AGHT+IEO+r+TuKnbuDISVGRChkpOQoNFOMRtWzn2WYKsN7WzPIYIE4fyTgA9Q7GUCV45qkxbPx0NaQ==
X-Received: by 2002:a05:6402:529a:b0:5ee:497:67d7 with SMTP id 4fb4d7f45d1cf-5f62861bb8amr11048893a12.34.1745266394376;
        Mon, 21 Apr 2025 13:13:14 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a503-5900-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:a503:5900::e63])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5f62557a547sm4955447a12.22.2025.04.21.13.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 13:13:13 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org
Cc: neil.armstrong@linaro.org,
	christianshewitt@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH RFC v2 0/2] drm/meson: vclk: revert and re-fix vclk calculations
Date: Mon, 21 Apr 2025 22:12:58 +0200
Message-ID: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a successor of a previous patchset by Christian [0]

Patch 1 reverts a previous fix for loss of HDMI sync when playing YUV420
@ 59.94 media. The patch does resolve a calculation issue. It also makes
all fractional rates invalid which is a bigger problem.

Patch 2 changes the whole drm/meson driver to use Hz as unit for clocks/
frequencies. And importantly it uses the relevant 64-bit maths helpers so
the code can still be compiled using for 32-bit ARM.
Maxime previously suggested using drm_hdmi_compute_mode_clock(). That's
still something to implement with future patches.

Neil, I'd like to hear your feedback on this approach.


[0] https://lore.kernel.org/linux-amlogic/20250110074458.3624094-1-christianshewitt@gmail.com/


Christian Hewitt (1):
  Revert "drm/meson: vclk: fix calculation of 59.94 fractional rates"

Martin Blumenstingl (1):
  drm/meson: use unsigned long long / Hz for frequency types

 drivers/gpu/drm/meson/meson_drv.c          |   2 +-
 drivers/gpu/drm/meson/meson_drv.h          |   2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c |  29 +--
 drivers/gpu/drm/meson/meson_vclk.c         | 195 +++++++++++----------
 drivers/gpu/drm/meson/meson_vclk.h         |  13 +-
 5 files changed, 126 insertions(+), 115 deletions(-)

-- 
2.49.0

