Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017B822B594
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013691; cv=none; b=Ty0CjTVgUaxQg8LB5loPaxOEbdsrjC9buVTJ5xilZbbnwWyBvj8OG48OZdL+f7PMlrwRbJXYDpjWynmlsz8SDtVjRcyX6+FGRsqqMpdL6ar8iRpmCZtNnqoun3/3P+ejj2O/fKwcBgSrHk/ho2lnpjVpM0GDrZMHI3DOtZLj4Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013691; c=relaxed/simple;
	bh=Vi+uu/h5Zd8rK2aatFelcFPD2hYQTWMEmZWHarVSvJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eUnQrXSv4A4XVQYrOIl95OlcR4wk9AfdVI40bdYuIxT0Kwat1xYTHC1BIgIWKq81zhgezB46iWkrHI8fWc1eTCsQpXQ7t30qvXnc5Q8o4J8lsFgQ4l462ldNdojdRBkrtrVqASzBCPrdt4kMpmFaXhSXAYKT2X6tpTlM22Y7vyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anNqxzCV; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anNqxzCV"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ede096d73so13157295e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744013688; x=1744618488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2I+AKiUaGilJvwS/f5X1LlsvDutZk3cs9KHKo4vYS0=;
        b=anNqxzCVDij5BCXuvXsXYTi7KFbtszxsWLsEfKCvFsSkrL0EGZ3jnNBE3BQ+OGA4V3
         qRQlMvfwin5befSzQLUc20jI9yQnH4KTUWs+88qfYjtb0CeOYvzsUD3HTtB+YTIK98Zg
         AJFcEBE/0yr+Fz3GXUdoZ9m7pWtgsDWc4ynnDINiyee0YXMV4i9PU0k8rHt70lIvImd8
         wG2LpXauP1coA9YukSJN6k+rnnuxA7BXdP4ISoc52hrc15bpgp9jlmazqQFIso+DtaEN
         DYuldACXlOcTffxUKazKqnZSQ6TSpIgY99PWMbNbkQrUhV7MjVmhLNTqfZQJ5HEkhQnr
         /Tew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013688; x=1744618488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2I+AKiUaGilJvwS/f5X1LlsvDutZk3cs9KHKo4vYS0=;
        b=oDVAhnyM4PUhgSJo9nH346hBcbnZOau68FscSelifl1PcyiCAiO4LmGgU6Sf+yAE5L
         /3aTfnZj6+TEHNkCIFQJUJLQGvKal/oD19Wra6Njb7Sho+1hYf5tLu8HjQKi4HDK53yG
         mZyjNTOxpmitDV7vGmESIYhZmo9FsVe5AlGID/ZkD4cEbq0auhyXBvHgZUTjEWSe/RiB
         WHyhi6JPPuBVdMfpJoYLbSZFlKH9AIV1ruWpbyznVXZLWs4XbMprRtHTHBDgmmdDXCV/
         zrwOzrLjHHLmk3pDgoam6CyE6Jch1j+Sq4ZSHQqN8Vc8IKqCSY2TKv/SwdOQe3u2tHQ+
         +3Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUweORRDLlbh47+16Yx7enEil0/dEurVphtkC8AaTAXOK+EIcMoI2RfEQ5hU7pttFnxhK3638To5OYhmss=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc2IgEuSOZe8nr1/Qszb4roYrTkSuiyWUffGteO7asQ3C3bxnt
	eq79xF9xtaggpXL4wHTf+OJRosFLSPHVcfCTpL6Jp+mDFmcsOma0
X-Gm-Gg: ASbGncsqksyH8FDn8QO8uVgk2auBTZhTmAZ130ZbVe0kmP9yRPbMVWpNid4l4DI4OZ0
	JzPYxDdjMCPg+P7E6sHXeHPHYebZmf8n7/MUJVsM00Pfz9KMWmrbW1P2+kZzfCfOmWSZ4O8MAND
	9yS9Cq+6renTO3IewrUwdUWstKdLVUl7vQUk3epZSi2mcwuUOjn4OGV8KKcAtGNi7UU/Wmc+7c1
	3VAHZF7ESyuzBf+FOHAzM/Gd57SRg7ANnIG0izvyHeDNcQc33y/yVWn4WA+UqlaXaPLqkkv8cvA
	0yc1xFFVd4qcsenl3OThjhIxtj7uksFis5Z+82mjBK7T
X-Google-Smtp-Source: AGHT+IGbgQ//mAxkxBQPqRYYwqdydsPUaU2Ht9FH9jq4jjH4ZQzh906R4fJI7RwkRpSwroXoZXzckA==
X-Received: by 2002:a5d:5f96:0:b0:390:f2f1:2a17 with SMTP id ffacd0b85a97d-39d1466229bmr10501615f8f.53.1744013688359;
        Mon, 07 Apr 2025 01:14:48 -0700 (PDT)
Received: from fedora.. ([94.73.34.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:14:48 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com,
	simona@ffwll.ch,
	melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v4 13/16] drm/vkms: Remove completed task from the TODO list
Date: Mon,  7 Apr 2025 10:14:22 +0200
Message-ID: <20250407081425.6420-14-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250407081425.6420-1-jose.exposito89@gmail.com>
References: <20250407081425.6420-1-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the configfs related TODO items from the "Runtime Configuration"
section.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 74126d2e32e4..c551241fe873 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -222,21 +222,14 @@ Runtime Configuration
 ---------------------
 
 We want to be able to reconfigure vkms instance without having to reload the
-module. Use/Test-cases:
+module through configfs. Use/Test-cases:
 
 - Hotplug/hotremove connectors on the fly (to be able to test DP MST handling
   of compositors).
 
-- Configure planes/crtcs/connectors (we'd need some code to have more than 1 of
-  them first).
-
 - Change output configuration: Plug/unplug screens, change EDID, allow changing
   the refresh rate.
 
-The currently proposed solution is to expose vkms configuration through
-configfs. All existing module options should be supported through configfs
-too.
-
 Writeback support
 -----------------
 
-- 
2.48.1

