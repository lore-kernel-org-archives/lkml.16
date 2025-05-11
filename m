Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6D91DC9B5
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 11:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746963020; cv=none; b=GtbnBIquZB4JSnqeHaoyDsnnmlProbsDMsH7thaFo+9Z92BktOopzm1N3HelkF+Bq39WCnc+4m5wq14TEaX68NqHI5SBlkeWo3PtvgeW1++CqGiGJ/7pdy6Yl0J0Y28d7TeI9fO47yyunZHnbDeqLpNV+fG7KTMuGlEZIH+sK1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746963020; c=relaxed/simple;
	bh=+OeCdGeJpLODqGo5xITfIxosQaHmRQG782TvW3Rx91M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=etypio7NrhYAQ5iwjXEhSWQTTCBBUrRylLMa0aCJieXvOr95x9abFE0TsRhENq43WbptF6cdss+WZdxzOTVhPXlh5DRUJ6PkJtONhWAax4LMvO3yj+Lygao1bUnLZZfVj/zOTaqWbCIXZK64abAJ2f4TQmpXZWqktXHTPYtlUpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7423fb98c5aso1604104b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 04:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746963018; x=1747567818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dAWgXd10woF6tGateM9qIPHOps1YIfwoETiHUY/GHrI=;
        b=l5d6R18oDaAK0L/9OWgq2yXPMrRdskTlmCf6+0fbUrDKeSgmlpX0dZndTkS1HQ7RYd
         Z3GacUfRpk+//bAir11Yd6foXDVuxHRD1omC+Kr6Ncrjag3qSpYcabobpUz76tAojapa
         mP92viK77G4TaW86NYewzoXRmmN668J/GdbW9Ey/l96L+asQTr7qSfgzgUOOGNPpWaJs
         eX1slR4u9PCRseVWJ7ffB30WznWIvkzMqMaSMRKS02bKUQ3PqERF3A2JUaAmCqMzsW30
         +P8iMXcnKK1a05xbX4bvXpqiw67nuE27vb8IUflsbSqUWNkgNnf40Us4VOvBmnv2cQt9
         tKRg==
X-Forwarded-Encrypted: i=1; AJvYcCVSGc09Dmf4kLYjTAGMyCei5TuTJTNfiMU7gFRhLWna3bymynVYcMEq1kLmXhlv5zdHvCSUSv1FSqhUKvY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwujUmEd9+BUN/BtJtlZvj8jfM7COp2Mb2SNbraNZFjPs7v8qHy
	5HBofbHxiQOLRwIZcSgdLSX2FD32KgCV1QFNTtHakSrV9NP7YdMq
X-Gm-Gg: ASbGncsCddM5UrOaHc5223FTYRH3r8HxXl/rC8zF3oDzMJCcsvSX4jXUDXGx0N5U323
	j9r0Zzo8yfLCm9rybtGaBrv/tM9DlSU7obw+ftus86zA9Mxb149aANTpPlcxSPZgSm2yrYs2nRa
	NaxOgPjpC2Mq/s1x47HM+wtBq49LTBGbeHQVBGaf/PZQR5uEGzrx6ziL1/D5acP/0tDBKNQUPYi
	8WGvT0FWGotAN0dhap26qYQ2a6bKIe/8pZbNoXkRi1yJHu4BSpOeWp4EsDsXoqxX//u7RbUlZLz
	HV/THqGXFrwqQgzPA/206hx1GMQD1yw=
X-Google-Smtp-Source: AGHT+IH93Jmjp5u+rJnqqD6t9rGcNHBHAKl8ENOicWrZp3u0OqIM37d3cNzqX9X49U5fdTYqmHNMuA==
X-Received: by 2002:a05:6a00:a83:b0:736:33fd:f57d with SMTP id d2e1a72fcca58-7423c055aa5mr13231077b3a.17.1746963018197;
        Sun, 11 May 2025 04:30:18 -0700 (PDT)
Received: from sami-laptop.hub ([115.131.45.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a104e7sm4442952b3a.104.2025.05.11.04.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 04:30:17 -0700 (PDT)
From: Sami Uddin sami.md.ko@gmail.com
To: mst@redhat.com
Cc: jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sami Uddin <sami.md.ko@gmail.com>
Subject: [PATCH] virtio: reject shm region if length is zero
Date: Sun, 11 May 2025 21:00:00 +0930
Message-Id: <20250511113000.1894-1-sami.md.ko@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sami Uddin <sami.md.ko@gmail.com>

Prevent usage of shared memory regions where the length is zero,
as such configurations are not valid and may lead to unexpected behavior.

Signed-off-by: Sami Uddin <sami.md.ko@gmail.com>
---
 include/linux/virtio_config.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
index 169c7d367fac..f4fac027e830 100644
--- a/include/linux/virtio_config.h
+++ b/include/linux/virtio_config.h
@@ -329,6 +329,8 @@ static inline
 bool virtio_get_shm_region(struct virtio_device *vdev,
 			   struct virtio_shm_region *region, u8 id)
 {
+	if(region->len == 0)
+		return false;
 	if (!vdev->config->get_shm_region)
 		return false;
 	return vdev->config->get_shm_region(vdev, region, id);
-- 
2.34.1

