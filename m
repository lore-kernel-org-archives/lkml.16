Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1878D23B626
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750416111; cv=none; b=uloclTE+zFLxkdsGKfom2S757ockhV9i4ibQLMUUvTaJeeldinUD70HjjlJhvib1Q8q/EmskSpp1BUepSZo8cbHdDpaFoyO++IupoNfYNaBOhUpzxyz4ZHJ5BiuBOfHwVS37DGuZ0IxoOG3yft7RktGde245E+vkz5jDGWIkp6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750416111; c=relaxed/simple;
	bh=q7jUaZeCrfpBs43z9Hy7QBXglV4bT2WecERgxgwdQc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TBxckCzx5RegM41C+mP7KBPt2KKmQqqJY59qEwJXLVOLucMcR7gnimEnvZeTk/51X01XE8be8EPpjJn6MV2vySFvancnYNg7GypVBSs2HP2WxMwmSPrbAlBR5SfNqAWRdEsB5s/1jvUYcjc2guuoXVbXE4Ndq24h8gLwDlrSg8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mOGYRu+B; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mOGYRu+B"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso1805654b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 03:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750416109; x=1751020909; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lfBsCz2FCCDcQNBUcihjSy0xTy3M608ho2jYmxxH2PE=;
        b=mOGYRu+BL9MOqtNolhYvfz9FPpJnt9lK/ETlVNm2UO8Sl9MWlVsfHyZHOzZxc/iNfx
         KYbz5yx17wr9DZ1O1Q50wJ359EMZT4nScuptntpqO8vLKFtKcsh1d2PEcZAixj5XkmMv
         daHUCHwKFZqZuIHQT/tDmTjJpD4B+UsFvWhjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750416109; x=1751020909;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lfBsCz2FCCDcQNBUcihjSy0xTy3M608ho2jYmxxH2PE=;
        b=M2KMuMEbSakdSnezfBK87XRnLx4JfqZJa2tsin97S0LXANOzDSa7+0aiO21uaXBsS+
         Dit9tuQxeMxLgJ3SDK1sutv6gf4crXGN0JTtYiZbpM5V8AoVgeIlfktrfbZGlsW7jdoI
         j6/Mz1iYjesXpnXnQsKo19nn92Vrld/1dC5U5oqj+dF+nzOscqT6l2MALM4XjBU/TTGC
         RNdXS3nIdhr+o1/4FeNOjDGNGj/+WKcjtLogSohSiaPBCa8CwITR+qMYvd6Xj07kHC2Z
         JeMGQslXVV70nORrYuCJfY2A0YYbhxtKshP4TPnw7wSo8klcTCPbLP5eHK7RtTFi4I5h
         o3sQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUX9LpbP1DG5lXi6tMABYblJMtnbgmc0cP4Yg+BUflzthHL6G3zYgiTxV3n2ebm5bs4CDNPYuruBbUZ9o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3ORlga1zddnrd3zHutFjV0MELfQ1GDK2YoQwjoNdQhjUjagel
	4YTlWdT8HJEP9t3nI3E+sGA+SKOXFikPT2F5s60XM2OKUw85j7P66sriLlIXt0JCbQ==
X-Gm-Gg: ASbGncv/v5Irn9tExypo59Er//+rMbbMI+1l5kcwutvX6xCzbxbVYr+Gkf/kqu9Qngv
	TqtjTXgWtv3HI3btlK4U4JpZ/ZSNsZWw9OcPOFssK+3TuNiSiktAhg8yJtdSm+YCyl1v7X6dpKd
	usQRzmXaW3hpEEuLUdRqGo8dFy/D/AyfHsb3JeBiVQlO+IYeidEnMRgUC+dv+pFnjdC20ggnSO/
	PY1BpYxLVRPpVqz+AcrtWU8mlTzGQdZk0KJWMs2Phs4O8EKwk5TpUfIggfN7wk2XU9n3A+i6BaF
	3eT0j2E4m9PwnMkhh8KeMvTqRh98bnkikW/TkWwjS3z7CT+5vxS+Ru5ifUnw2G5PxEYKAxJmGAD
	p+Q2qINuS0ebYMwpY8i3zMe6aU18ZhwYiut7D0EctCSsDTpLHyMfgKgvNbge6
X-Google-Smtp-Source: AGHT+IGnMQSZOCLVg5rJlh2wQDEMq63wQi1fyNPC8G0fdeVlnF1TnRsHCW3F6Zyk5iZTU+Ts1fj2OQ==
X-Received: by 2002:a17:902:d581:b0:235:2403:77b6 with SMTP id d9443c01a7336-237d9ad2891mr28004285ad.37.1750416109370;
        Fri, 20 Jun 2025 03:41:49 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (243.106.81.34.bc.googleusercontent.com. [34.81.106.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83936c8sm15444775ad.7.2025.06.20.03.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 03:41:48 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Fri, 20 Jun 2025 10:41:43 +0000
Subject: [PATCH v3] thermal: sysfs: Return ENODATA instead of EAGAIN for
 reads
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-temp-v3-1-6becc6aeb66c@chromium.org>
X-B4-Tracking: v=1; b=H4sIAOY6VWgC/12MQQqDMBBFryKzbkoSjWhXvUfpIjqjzkIjiQ0t4
 t0bpVBw+T7/vRUCeaYAt2wFT5EDuylBfsmgHezUk2BMDFpqIwtZi4XGWZTUoMotSmwQ0nX21PH
 7yDyeiQcOi/OfoxrVvp4CUQklapvXCqu2lB3e28G7kV/j1fke9kbUf88o/fN08mRRNWQqstaak
 7dt2xeFbZ/R0wAAAA==
X-Change-ID: 20250409-temp-6ebd13ad0dbd
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.14.2

According to POSIX spec, EAGAIN returned by read with O_NONBLOCK set
means the read would block. Hence, the common implementation in
nonblocking model will poll the file when the nonblocking read returns
EAGAIN. However, when the target file is thermal zone, this mechanism
will totally malfunction because thermal zone doesn't implement sysfs
notification and thus the poll will never return.

For example, the read in Golang implemnts such method and sometimes
hangs at reading some thermal zones via sysfs.

Change to throw ENODATA instead of EAGAIN to userspace.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v3:
- Refine the control flow and optimize the success case.
- Link to v2: https://lore.kernel.org/r/20250512-temp-v2-1-048be58eaaa5@chromium.org

Changes in v2:
- Modify commit message to make it clear
- Link to v1: https://lore.kernel.org/r/20250409-temp-v1-1-9a391d8c60fd@chromium.org
---
 drivers/thermal/thermal_sysfs.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/thermal_sysfs.c b/drivers/thermal/thermal_sysfs.c
index 24b9055a0b6c515b865e0d7e2db1d0de176ff767..d80612506a334ab739e7545cdfe984ab4dffab7c 100644
--- a/drivers/thermal/thermal_sysfs.c
+++ b/drivers/thermal/thermal_sysfs.c
@@ -40,10 +40,13 @@ temp_show(struct device *dev, struct device_attribute *attr, char *buf)
 
 	ret = thermal_zone_get_temp(tz, &temperature);
 
-	if (ret)
-		return ret;
+	if (!ret)
+		return sprintf(buf, "%d\n", temperature);
 
-	return sprintf(buf, "%d\n", temperature);
+	if (ret == -EAGAIN)
+		return -ENODATA;
+
+	return ret;
 }
 
 static ssize_t

---
base-commit: 75f5f23f8787c5e184fcb2fbcd02d8e9317dc5e7
change-id: 20250409-temp-6ebd13ad0dbd

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>

