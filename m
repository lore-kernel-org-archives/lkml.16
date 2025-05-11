Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C48325D540
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 22:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747002137; cv=none; b=Uz8WgNPkrSj1fh6B1KCEaHc0+fJo7+mifoePRIQHdZ9T3iIe/KcAG/Jr2Rf8ie2V+/M/o3kywnY5FmRXfiiQo9b34SkfPs90moqOihpsnRKPziDRbRXXah6kpTQiHiq9Czci6ufNAjXdT4GHWZ/O7zAndSW1gulWZ+5UebEGlUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747002137; c=relaxed/simple;
	bh=RfIn9bmSexrd7M7wBFF6Cbmoa+oKqgWiyHr0wJXms8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DtXD9q/8UG0oj3L+bo2L8uv1k2ZHT7JxeQmqB+6oQPzZt08ufqlCS6IjLVjG1KUZACZf6FHoNCE39N/onqxm0M9oz8GUk8JuByyzX1E9VjfquLbDUZAXKrjtE0t2PRAW6AO3n8QPkprlvXMB55WPVoQqLlfuhQcIktevto0rFc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso3656025b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 15:22:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747002133; x=1747606933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tM26XwnTvJOmDDum8lOjUHX5JW1MkKCMFnfkzUeSffQ=;
        b=KIyYId7HYOwuZJbgfDJ/yCcsEEPNMU7FFvoNiAWhcf7/ymhFMnzDb0Vz3wZH6Wek6y
         hTVyBvjbEKvNojm40VMxIstQScKpeNjwiktRTls5uiPbbAAsZPWiMNCCwgWQaZ3vTCbf
         9TaIeMOvfyLGBj+KhusWYyn8lJcC/vSI1tA3uXO1x8PuGLnjc/jzejZfQM66YTxuaZc8
         QEve3qEYL/IQW0Z4Swiz2qAjMFbmO+U6J6WbcEeGlrf7yF7DA32Z7cdrYoIo8uBekw72
         ESBe8YY7WcoL6cRcI4FkS98BuY97u9WziawjbIbOXmlq44n7FwX8DRtsfwFj6+bbFusV
         cRrw==
X-Forwarded-Encrypted: i=1; AJvYcCVXq9n1kRAljiexJ7wceWypdrM3ytWHA1Z8hvW1UiKtozENJHb3QcHETrt/lio0befar0bkjSfp0d2ILG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH8OEv3+4cuXX152JyWZiaXKZgM3R5m/HlKAKa+0cj8udjPfTC
	b2FgjkI/Y6xDAaEKAGwKiFXDqLBTZXlJK6dU7CQfgdReUfcWoXo66PON++zYF1w=
X-Gm-Gg: ASbGncseU2mKHHBPw28ARUfdHosLpPu57EW5Vtvxxnz+QrxozrJodB9skh/LR6S8oRP
	yCPIaQ/7Lqktq0DbLi4u+Z9iNRtMISEZEmyEqv41V0darGJpsjf3ipNOfl9NR1Wv8OYPd8NizFq
	JZ9bA8CHFp0vsF4XpQnsll97PW5X2GcAfjDGzMVsVXuGZ9P4dr601ED4Is9dO3N8b2GcyerLJZH
	GfWx8PQXFkgoDwAKB3fr66xo7QnZO7co7YJIQrZwpNQf4Bb4FA2rlLInb1f9zGIPK7bHbjvFtoA
	L2+xf+BbOPEO+nSET0MKQIrh0M2kMxM=
X-Google-Smtp-Source: AGHT+IGFNbZwi4DvSA8eMlnyQIuIaeH8HI52cSPd6JL+isEsuYfpi3ZXVI6HKyxijasigvaZvr3RPA==
X-Received: by 2002:a05:6a00:9286:b0:736:5725:59b9 with SMTP id d2e1a72fcca58-7423bc1d5e9mr13676723b3a.2.1747002133463;
        Sun, 11 May 2025 15:22:13 -0700 (PDT)
Received: from sami-laptop.hub ([115.131.45.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a10867sm4884425b3a.110.2025.05.11.15.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 15:22:13 -0700 (PDT)
From: Sami Uddin sami.md.ko@gmail.com
To: mst@redhat.com
Cc: jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sami Uddin <sami.md.ko@gmail.com>
Subject: [PATCH v3] virtio: reject shm region if length is zero
Date: Mon, 12 May 2025 07:51:53 +0930
Message-Id: <20250511222153.2332-1-sami.md.ko@gmail.com>
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
v3:
- Use idiomatic 'if (!region->len)' as suggested by reviewer
v2:
- Fixed coding style issue: added space after 'if' statement

 include/linux/virtio_config.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
index 169c7d367fac..b3e1d30c765b 100644
--- a/include/linux/virtio_config.h
+++ b/include/linux/virtio_config.h
@@ -329,6 +329,8 @@ static inline
 bool virtio_get_shm_region(struct virtio_device *vdev,
 			   struct virtio_shm_region *region, u8 id)
 {
+	if (!region->len)
+		return false;
 	if (!vdev->config->get_shm_region)
 		return false;
 	return vdev->config->get_shm_region(vdev, region, id);
-- 
2.34.1

