Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39D62367A9;
	Fri, 11 Apr 2025 12:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744376159; cv=none; b=tTzL93kMd/pdh1QiKlv0tfCbNe8sXdXUWtZrej/6YZRMg5TP+xvg+aRhFMWPFP3f2pQVnsGQ5Yp0od2eKQ2mynkbgUC+D7lQBFPO6AebXAJ78128DqjZWAteW3R9IXqzoQDDJqIHz3vhISZ5mxajAVeyTmNsOYfe/W2dKiWTDXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744376159; c=relaxed/simple;
	bh=J8M4JFYmx01LcRK9HJDdbXvbwf2HzJiX3Z3XXtkSQr8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RCI4YT219B6t/f3QGLwv+A53YsFPqxpxEEaH4RxMotQz2ouIZeiR/j5qmuztw1LtMPDrha1np4pYMPtkIUa18i8kRjQ1Oj3yHDX4ylt0VYBx5U/lCh87sz97WM5urjvNZfVJFIH365vHYuAntQff5ItTyYm8rZByNBc++w/L+pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BO8//cLj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BO8//cLj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7C9C4CEE2;
	Fri, 11 Apr 2025 12:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744376159;
	bh=J8M4JFYmx01LcRK9HJDdbXvbwf2HzJiX3Z3XXtkSQr8=;
	h=From:To:Cc:Subject:Date:From;
	b=BO8//cLjkefWqDPBaOYYzaBs71e92+rxyxiFbhI/6h3L9sOghR9Txdhd+SmP5Xt+u
	 d+F5LUAM1gllmAdwOTybG7XaOggqi+Sd6r2IvfkdL4qny08kF/+5SU9OQ05jNl5WTt
	 BtdaIjXaLNC0xv53CxHRDBWZ/4xPPxah3fktyXJV5NuJQ1ESzbJHh7zdJGdf1BnhEm
	 S+GaK3iBO3zLyezJdKzE74bOZailuhsriasp+sPbRZrWW3REfwmvXSECP0Yr1avZf8
	 0t8Vl/elrc7yWxWD8NgEDXBZKT4r+0VWP0lN+ZHlSL2mrLcP414MQtzuFqbqqHmbx8
	 ZlI+SAN9h7M0g==
From: Arnd Bergmann <arnd@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] drm/efidrm: ensure screen_base is initialized
Date: Fri, 11 Apr 2025 14:55:47 +0200
Message-Id: <20250411125554.1453825-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

clang points out that there is a code path that leads to undefined behavior:

drivers/gpu/drm/sysfb/efidrm.c:353:11: error: variable 'screen_base' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
  353 |         else if (mem_flags & EFI_MEMORY_WB)
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~

Add the missing initialization.

Fixes: 32ae90c66fb6 ("drm/sysfb: Add efidrm for EFI displays")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/sysfb/efidrm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/sysfb/efidrm.c b/drivers/gpu/drm/sysfb/efidrm.c
index af90064a4c04..85fc37c1e87a 100644
--- a/drivers/gpu/drm/sysfb/efidrm.c
+++ b/drivers/gpu/drm/sysfb/efidrm.c
@@ -353,6 +353,9 @@ static struct efidrm_device *efidrm_device_create(struct drm_driver *drv,
 	else if (mem_flags & EFI_MEMORY_WB)
 		screen_base = devm_memremap(&pdev->dev, mem->start, resource_size(mem),
 					    MEMREMAP_WB);
+	else
+		screen_base = NULL;
+
 	if (!screen_base)
 		return ERR_PTR(-ENOMEM);
 	iosys_map_set_vaddr_iomem(&sysfb->fb_addr, screen_base);
-- 
2.39.5

