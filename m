Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DF9746E
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 03:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746329718; cv=none; b=SxBX5Xu2La2BjTlao45sJNULw6it/K3eGLmq3VfXEGZO/rV1hWDtw961yAQ2mlOItr45N1Tj9ktxrcXsUwKHsSjUFtV7De8ZO2PpzLYUIzplOe99820c60y7B+FjRZACbJYxHUVYN+ecwihVmNv3/abCa29DdOabSuN92LxA6/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746329718; c=relaxed/simple;
	bh=G38Y6ejHHNy25foI2rFjn1QAdikdVwNhEtaER9WcXtc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ToUoVbKefhBlf8Q9v4wIfVeHfZHGo1K2oTfgVxOy3cu1T4JxgbbXXGw/QYjzSbrda9tFtBjY/S/hKj4KCfedESfE6PmKltsfRpscj2Curq+emtj1ahSg8pkwOZ1em+y9Xhhaas56TG3kj/aBIJdTy3uxvVD2aZnzWKDOI2o/ztk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X9/ng8x1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X9/ng8x1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746329715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0v/OjtH+AYMPDo4HyiUOT8RSQOKjvKJRz99zAdE5I5g=;
	b=X9/ng8x1a9PQetQzlDtNOAbngFfFYnKKgz3DyHJPAfEDkgu0f3MTA3C/glM5kJQtnaxVNk
	Jt3FJ6f4yYIw6Hym0FUj2pAFRS4og5l3NiZO1NDaptMdoBSbKi0IgSabPxjhWueoO/71KP
	9cdlj52j6FOIbLoGhfQzoOJJZHzGVnQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-2TiYaD6vOlitb4OMxNFNyw-1; Sat, 03 May 2025 23:35:14 -0400
X-MC-Unique: 2TiYaD6vOlitb4OMxNFNyw-1
X-Mimecast-MFC-AGG-ID: 2TiYaD6vOlitb4OMxNFNyw_1746329713
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac6ef2d1b7dso314264766b.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 20:35:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746329713; x=1746934513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0v/OjtH+AYMPDo4HyiUOT8RSQOKjvKJRz99zAdE5I5g=;
        b=EvTeJ7RoxjT6joXquMbK9UfAImRc0g6GJJaW+qgeBQCv50TjVyosZ/nnHoPWZVT1sY
         5YCHzPy4uk4UvnQIUUsIe9Vi8nh0E4aChW09g/aFv25Lc6weAx+AnX++T1M6PBsLtsrk
         nVUKJEHipd5kJJFkrdfcoqwQVCm+HioGejeFcGjd8xtlkVzqKZAT4/P3UMJnxMVG0Rdm
         2Rd/j8xM6qaoC/5MKhSWRVdbaPyCTLdIXP1+hp+1WSgHu4TE/PUX5LpiAaSsqraOb8NI
         hdak8mgWwjS2MdljAY1mDdqxwWiXdwk5uWPWPAlFGe7afHJVS48hJmWFUkA/wjhTt2BL
         WVOA==
X-Forwarded-Encrypted: i=1; AJvYcCUzj5RrQQEwokzXpP4Mn6NTDH26s6XZOWIuiSvvo7dZGlzPZuIM3vanrgcK09JHIRaA5yO5IbEUImsvR9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKRvVenoDteFZ9uGmfe8VbTG9EGMJ55PInuPC8uYUBt0w5HHqc
	4TEXwXA8xke8kqvf9xbmj01oLg+RRp07yGvxs9nsyIzD/FRjN6vYsly/GO0dog0FRcqyHDzn+w3
	EadLalboDLpeaZWKHJEA3vWKhcp0PjU52uIbnmOio52asqk2UD8fBrL8L4QALwQ==
X-Gm-Gg: ASbGnctqgtB+hEmH4gC7xQBJLcWHHeyKefMALqMHYFGkZzJKgggeQe2JpXrhil6ngIK
	GR+0AFO/O/29L1FjInvK7X4j8OlJaG9MM/RXk66XOyWJ4ThHcbQw+NYjT6Kf65oLNgGe0eiNygj
	2GiBrfnnH7j2I4HfUh8SRhClo0tFaoEuzTlwaNrZZw2/uKYqQKWxBuvpAVpJUsw1c4ZaVxAh0Ut
	vIUnJywE4t+2VNb9na1e/oD6aMCNrHD9OJu5QOp/B6m/wwi0Mf8Ow5GpL2RXNVBizwL3oQw7GC3
	21khO5zsr1JBCQuGVCELK2URDq91irpJI4NsAboypZNZecxW/qKiDJeVKw==
X-Received: by 2002:a17:907:2d07:b0:ac7:e815:6e12 with SMTP id a640c23a62f3a-ad1a4a09f38mr245224366b.33.1746329713061;
        Sat, 03 May 2025 20:35:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3DPNJBEfULAFRQwM0mCppaXVmV0b1Gm6boTIP80Vx6UREkQTGIelmuYJ6z6ENgBGk1YNm4g==
X-Received: by 2002:a17:907:2d07:b0:ac7:e815:6e12 with SMTP id a640c23a62f3a-ad1a4a09f38mr245223866b.33.1746329712719;
        Sat, 03 May 2025 20:35:12 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189540751sm269222266b.166.2025.05.03.20.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 20:35:11 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: David Heidelberg <david@ixit.cz>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in OMNIVISION OV7670 SENSOR DRIVER
Date: Sun,  4 May 2025 05:35:02 +0200
Message-ID: <20250504033502.37809-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 59b24c0047a2 ("media: dt-bindings: media: i2c: align filenames
format with standard") renames the files in
Documentation/devicetree/bindings/media/i2c/, but misses to adjust the file
entry in OMNIVISION OV7670 SENSOR DRIVER.

Adjust the file entry after this renaming.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7b78a98d1f42..78872ebb1aac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18163,7 +18163,7 @@ OMNIVISION OV7670 SENSOR DRIVER
 L:	linux-media@vger.kernel.org
 S:	Orphan
 T:	git git://linuxtv.org/media.git
-F:	Documentation/devicetree/bindings/media/i2c/ov7670.txt
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov7670.txt
 F:	drivers/media/i2c/ov7670.c
 
 OMNIVISION OV772x SENSOR DRIVER
-- 
2.49.0

