Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F8B2686B1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 11:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744111669; cv=none; b=epDozOYJOBs4Cdji1Ss2xcxArpd7B36+n5ckGTXfJHdO20wvnFCGAd3VzVAghhB0OuVJdOL9UxF0HViK2J96oqUMdhHizb+ONlvGQ6eh/4DqAumNUEOJCcMyIhbXDlv0YCvVnKryeGvR4c/lNSV0cQiWPnHWPUa6l0xQuE4OXbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744111669; c=relaxed/simple;
	bh=9/SI4TkAJnViIG+zH8NnrAYsWGamcMlzfn1L2zXyGUY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Fd4XO8BW0CbX8xB8od2v96oNr5Bnx5yM5nDc5PUIcnqZH58wrZIMSLu1fOJhjCUW2TpaQp1FSAxuRZ4yQpVdnZPPKQT8SCdfdw5NGP/4sK+TFRbyOuclFyAqUhhx72BYn2HyFdLtA2N3TPvP1XxfbMIPBE7+LRjJsaBLXQEufmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22435603572so51108545ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 04:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744111666; x=1744716466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWNuU4PXGcFFUxJOOD6+vUejwIulJeOU2+PZK360UKs=;
        b=OdxcOt2K5v+kCcBAv98UVNfDb8ctAAsMK6qnHxkfDshLrNw5HJxX+ByfjfXdbom//z
         QFQ3znXpcmh1CGjeOvBVsNkYstak5kZMBFgazOK4+8sxy7IatrX1v7ShfOdrWvxUrgP4
         KEBO+Go29EVpkzft4KZSK3SuXQZeXKpC7y4QgaEM0EWa7NDLjDrY+e3fSoLQrSvb24sI
         tlsS965doan++XDd5qwH9k2diCh9/Y5y/z7Hn+2x18KrTlR8KeAcnYdWu/rE+IR6WkmF
         i5C86QwFcMOzMvr5dkaI6ghz8xSaJV685wvZTJMSM0/wtsdpevC5B/bMHztUPoKUFneQ
         t9SQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6iBnuBjb01tnjYIssxffHQIgczfdR7GrhKBx/u58VL5e4nYc8IDsDdmLUNQFfelsWm5103THUTdIz5YM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnNiHHmqljUwKdImf5YWeZUQcL4B3HMoJ/N3Mfe0GyGq/SJpNP
	fktr7cpX+m7NS/vNhs3GOPVTv4Lus97F7KehZca9Ne/JzmVjgwP/
X-Gm-Gg: ASbGncuShDnF6FD0nKKLtbP9yyNWoMXxJq42DCmNsPVGQw+1ZkjJBeBjKk8LbVopYG9
	0QI6hXvVb8t1Fd/T/RZ66wq+6wDdIfntf+Si4lSl7I2gUu3C85MI/SJEYHacXH4TpT3dvaeQfLc
	Nlr7/575DntR0BNmp8/4Pm0sLIo+5OddBd+2bFuC7PX/Zy2xCAOc8+l9+fF4kpGeGj7r1s7lLsB
	9HsWgO1OMlz8FmG3PqQzHgrLxxHsthN6Xd3dTqlLUkq+QI/z4UrCgumLi8+hyF13X59qYq4bu1k
	YvIrNqIGbp+XffqBbA8FtZxF8j7xgkz6zlO2tkgU0dAu0mbXjsF4lcnhcsXj
X-Google-Smtp-Source: AGHT+IHq28UvQIqWAknFOlE8tIbb/hwfHmeUHFw2eZnKNEbxo/0KO+z2EsthClTeQucSfsOEE2tUVw==
X-Received: by 2002:a17:902:f684:b0:224:2a6d:55ae with SMTP id d9443c01a7336-22a8a8e44camr224245775ad.48.1744111665988;
        Tue, 08 Apr 2025 04:27:45 -0700 (PDT)
Received: from localhost.localdomain ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c0127sm97708895ad.91.2025.04.08.04.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:27:45 -0700 (PDT)
From: jiangfeng@kylinos.cn
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	rodrigo.vivi@intel.com,
	christian.koenig@amd.com,
	raag.jadav@intel.com,
	andrealmeid@igalia.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Feng Jiang <jiangfeng@kylinos.cn>
Subject: [PATCH v2] drm: Fix the length of event_string in drm_dev_wedged_event()
Date: Tue,  8 Apr 2025 19:27:28 +0800
Message-Id: <20250408112728.244146-1-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Feng Jiang <jiangfeng@kylinos.cn>

When calling scnprintf() to append recovery method to event_string,
the second argument should be `sizeof(event_string) - len`, otherwise
there is a potential overflow problem.

Fixes: b7cf9f4ac1b8 ("drm: Introduce device wedged event")
Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
v2:
- update commit message
- keep scnprintf() as a single line
---
 drivers/gpu/drm/drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 17fc5dc708f4..60e5ac179c15 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -549,7 +549,7 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
 		if (drm_WARN_ONCE(dev, !recovery, "invalid recovery method %u\n", opt))
 			break;
 
-		len += scnprintf(event_string + len, sizeof(event_string), "%s,", recovery);
+		len += scnprintf(event_string + len, sizeof(event_string) - len, "%s,", recovery);
 	}
 
 	if (recovery)
-- 
2.25.1

