Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6512DFF17
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750442591; cv=none; b=f0Uoi2Vg37E0ypVCdSvn6GX3H3VmyAe+JuX842Or5TAdQJxqyBLMAfUfLOO7+BlKmVa31vf3PXXYnukxOoquUN0R0ksinCFYhaGlWIckqwTTXYD58bHYVHcd8tzD+J8SaW7e3qnF5p/HwUroR5Sy5vCsJi6vIz8H0iXXKeNyy9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750442591; c=relaxed/simple;
	bh=jFX7Zn97NNqcIpZJHQJ1GlN7HXgR2NyfxKF/YU5EaSc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TGgOe6bhU3JFDeoUTg+MJb/rfZTOIswBEVoNss/5vSzLZnJsJpaxCvQEpgZ/sXwaDQhYcFKDveLlCm/tqMe8qUmjHDOf0F614fvGM1cq3EsCIbJYzi9S6q0tq6JxredYczvdx8L/benTsBZGaEbvSvi73nufUHIv+DHmpzhdMDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=OftwhLSt; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="OftwhLSt"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-748e378ba4fso2878786b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1750442589; x=1751047389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LASqD0oWUo5WFt/+IQjzZizw1Tgw6LTsbm7AdZ6Fm7Q=;
        b=OftwhLStxMF0iVL+ILcb4NxJj9Q7SNR/4Pt5EYD2GKlbeSkx51BDywP0b1/SY7lPpH
         BSIvg/MrEI8wI0Ly9vd36dYIbFC9vXKfFfUEuqUyr27Tnoft+19gWIiF1PHs3lXjr5T6
         1S3knnjH77N2/uNEsGsK1psEvdkEBgD7uwIlH3zgHoJWH/2HmsnwdgE7yREGELsi/mYT
         F+SaFBg8ZNchJI9E0kxrlGvquUfg8+EsAL+jfzdPSXejIbzs5boG2RXL77jwMJUITkeW
         4bVOTohjwUVSbW4EVrwTsrjQrXuFN4DDD2agedTQOkH3sa0gPGctnFgCyg4rEBg2VBQ4
         8AZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750442589; x=1751047389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LASqD0oWUo5WFt/+IQjzZizw1Tgw6LTsbm7AdZ6Fm7Q=;
        b=OlcYSt4vlF+8pPy1N0Ol50tg0at7Y1Jrik0DoyDAx4jLsIrWif0j8MhUEU9B0rbB+2
         epLA/tZmNRkGcSodnn9zk9Wxe/n9uCS+iJdOZ/uS+yhvJIBHs+keaGjF412evVWGYmva
         RwRBXahuWm1N5dX578KeeaUsz8+lLDNLaZ9RjQJO11ZUeifeHHAf/eRkBq6Fy3ENyoGj
         GcBiNzWrdiM2JkZcIM6b/yLJCQlANXUqqE3pD13QBv416sSbGsoK/mZfbHOQ3gXjW5N2
         32waFVjILA6FxQbYCAmfG2cxQO9E5Wd782gTYRw5oahwKOGLwXNYi1x1sEd53JIyU7ri
         luxw==
X-Forwarded-Encrypted: i=1; AJvYcCX+fledSF8l+5b0nAYIhlGbGfjX+y7T/e8bLewPUoDdYzAXgXcN3YUUk72UymY6MmX4UUDmW6K2qKYKhPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ0DGcmgGufQ3x1OeHYNTngBuZXAxsv6deNcV3xZ7hHxQQHbZq
	4DuUWgI4TUvLbvXVG5uxX5Ltjh4AgyMqVkhCQnjKE4pAkAvdkx7Tv0sTj8JNTW8t/zY=
X-Gm-Gg: ASbGncufemBguZHDpZWZ0EBLLaKkXlE9oWvgAf2I1GPTiy/cdWAhZanqh/MKrkDu4Mh
	69dytS+R5+v3i3ymUQoQX0QLMG1Wv/+uJ9/2psvsKZWk2e0e8yjflrgFO/eeoqL3Y6FToL/5MUH
	QqfVWAjGi3PU8bgU2QMEEhLQVukhsfe0TpAGTPIhTMrMz/P0t+vK61pVc2zTI/Hg8r9W9pOOE3u
	1NScdrLIK9ybClYCKldRM4thwCoEeysrHOVNLQV+2eF/HQ0uQ9SNL+D2tMZqPfLwucRwJw1cAgN
	fvGtsjgWULrC9lbDNjbRQ5oZ4UiNi7sAOWoIbvkBuICC0g8VFz7RWGVhiwjxlUUAVkI/VebNU9i
	rmE30hS/8r1xzK+VQkg==
X-Google-Smtp-Source: AGHT+IFlM8cNRiBkGT187wOeWcfkfeb30/gPkHi7Ft0d5GjTVFgLhRQpzSohSUSYFxFeTwX7y0TLjg==
X-Received: by 2002:a05:6a20:72a5:b0:203:bb65:995a with SMTP id adf61e73a8af0-22026f007fcmr6414483637.30.1750442589385;
        Fri, 20 Jun 2025 11:03:09 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f1256f03sm2131724a12.51.2025.06.20.11.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 11:03:08 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH] Fix typo in drm docs
Date: Fri, 20 Jun 2025 12:02:58 -0600
Message-ID: <20250620180258.132160-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typo in Documentation/gpu/introduction.rst

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 Documentation/gpu/introduction.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
index 3cd0c8860b94..39b4c943fa00 100644
--- a/Documentation/gpu/introduction.rst
+++ b/Documentation/gpu/introduction.rst
@@ -32,7 +32,7 @@ member, only the structure.
 
 Except in special situations (to separate locked from unlocked variants)
 locking requirements for functions aren't documented in the kerneldoc.
-Instead locking should be check at runtime using e.g.
+Instead locking should be checked at runtime using e.g.
 ``WARN_ON(!mutex_is_locked(...));``. Since it's much easier to ignore
 documentation than runtime noise this provides more value. And on top of
 that runtime checks do need to be updated when the locking rules change,
-- 
2.49.0

