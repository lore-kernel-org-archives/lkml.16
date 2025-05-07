Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358E5292091
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626095; cv=none; b=jKiV+Ba81hDBy3Ft5k6n7wr8GtIxEpt71gr7dTMjHbLryux+Yn9PqVQ7HcokStsmXBP7cR7l7EQuXuGtkrmyK2sllLS5kTmfJIHIF5UbMT263aV3HtZuiB4YfDcJb8QzkERyv/zAn0rt6EjK5Gg430lHG9OxbhhAK8HZ4s0VUuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626095; c=relaxed/simple;
	bh=stU4SlJE3RLyCC7kwW+mbu8c88TRmxZxd8UjPZ5iwT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=im7vC7LhhrgpaDFqKGUtloe0eqcyK++hobBmzdoVcZV3I2ytBbdUG84xkLHWF5gHYm54/KHF9fiu/OE2sxDFd+R96hAHj7cIXsLhU374nwx9ercdc0hvlRFFSBlRCGKrVFKUY2gq85RdKzTAbgvZ62OWXPvawEb6JYlt3FKROkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jjowPfjw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jjowPfjw"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so28917095e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746626091; x=1747230891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWqR37aI5twwZSWILXuoPG0kdPMC1+eZgCLJxtlievw=;
        b=jjowPfjwK0EGU7HtOUsC0NItoEz//FHbbfbJeZweGZlK1IWwzDF7ScDk2XbNjhrQnW
         jJXmiWeOrFGXjErLqh4u6i0/k2x73Pl2WGcwxuaGMbwYVFpWJPEhlvhk6YLOpajlTz7G
         HdQN02VGn58nI0oTlOvi0mpJxhc4ujemnefZLE6BfSACYokwGLxByddzJLxwYL1u5LLr
         0AIYFb974mJzzTtICnxkZUsW0MD65Rgq6G26svC9UPMQdFMB2/1O5IOQ6jc7sL8pnbMF
         gnB6n3tUD3aOIshQ5Yo4JLiLbVJUa8PpcZS2M4y1WuN6k2kC9ROsWuACAQiPU48kG8hn
         eQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746626091; x=1747230891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWqR37aI5twwZSWILXuoPG0kdPMC1+eZgCLJxtlievw=;
        b=rmTup8DxUKHMO++cy01AmNcpiSSHv6AVNhbnRWgljmC82p3fuyqNs4GuOTz2mFSUO8
         QO3rv1xE/x9C4mdpQhmXFlRJrhciQPLODXc4y0R8VUlKzpIn56xFGLhxEwWijt2cS9up
         1PSF9j5zoSmI6RlgXixR6y/LHWvojoboSfBdwXhe7VoGwxJt+1mMYQq6QSFLA2mGasz/
         1R8P/diom4eCx1fL40Pg5kLYyGjAu1sBXJeIfmkh9W8upHmmH9dBrolTWf0mEqT+krIo
         ub7qGCPUbHbFx8Re1yTRR13OYGiqdD/mDJomRY01EA94sZnVnaVJfbztlzbjPmHdDdkS
         DRfA==
X-Forwarded-Encrypted: i=1; AJvYcCVzu1dyga0eOz0BcDbHXrdbPlz50Z4gxrTvqWXq3WO/Ph/qLJmacpi0Aaq2X0YXYmXUOylcQf7w2RpAafg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV4Uk1uTh4Ctfto6Sh2xgqx6zvCSiKSGlSUVkzzh6pJZL7bIMd
	X4/SsipE3iQ6ZBU7NqwnpPRPWR03yaSa8lYKIil8QfI55fF+l/eM
X-Gm-Gg: ASbGncsWLBZJq/SvvpAamhHM+NDrAKRKSH9J+mS1OStPNv9srbCnYsGKGSGa6OjMOr7
	DpaxU+eZbqDvKQVyXdARBOHz3Yy3DpAYJ+bak7dU+otu+Svb2E0U8zrcAc9NduUfLYVB/p5K4nh
	jB1CWO/SXTqZrGoh/whTYKhprzyE3GMAzXopyGGo3Q3gpgCdr9J2dHsWSAF3QpFrQ3R8JzSBrXy
	bD0XJt4bdyzHPO4R9S41UEA6f/IIOyA+ppjgCZfos9Kkq04qOqXlr3nMBTMP6TkhBZwDDQtANcr
	SiaP2Q3a6XY2KGgI1Z6BVX8wBoq6lWY57NQKIFG9zQqu3T6uQXkc
X-Google-Smtp-Source: AGHT+IFyVtHmGEduXkwjzUmI++R00Dm3LiRIVnkrJLxWB8zjNqD0zZuy+Z6OQjmVFKKegfPZ2AaplQ==
X-Received: by 2002:a05:600c:4454:b0:440:54ef:dfdc with SMTP id 5b1f17b1804b1-441d44c27d0mr25577365e9.8.1746626090964;
        Wed, 07 May 2025 06:54:50 -0700 (PDT)
Received: from fedora.. ([94.73.35.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f1eesm1894295e9.9.2025.05.07.06.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:54:50 -0700 (PDT)
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
Subject: [PATCH v5 13/16] drm/vkms: Remove completed task from the TODO list
Date: Wed,  7 May 2025 15:54:28 +0200
Message-ID: <20250507135431.53907-14-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507135431.53907-1-jose.exposito89@gmail.com>
References: <20250507135431.53907-1-jose.exposito89@gmail.com>
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
2.49.0

