Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DA928B419;
	Tue, 10 Jun 2025 09:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547663; cv=none; b=S0Rg43UlzxNYlAPXTKGn5DGPBb16xoKQgEbxOM68o6kPh9s88i9miQk/gD1EzQVrtkGe1YvbS3U/JCnA2MaXUfItD9oHY4hqRwGV2tn2TS142wKL1oQYfFI2qCLR91OdsWVKzor+iCtlm7C2O6jJzhJpGC7vCIxXwR9hI2327/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547663; c=relaxed/simple;
	bh=lfBamJGxY5k+dFxogqH5eoJqA8X1z7zpTPGsxWnNEMw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qyWN9Tq4V6r+VSci17TsOjhRj0GTZ3KrSppfeVdwHDpAUMIA4/eZHnMUrGCR5ghoJiFSOUkdYz7OiN+GYzc06g18yZnjUX5Rl+Kd+jq1qMyLeMlpFMoh/EmXWp+b0Y7/vsdphQVliocwoOXQsmtOAkAiYmiepNWmzOVGi/LW0xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DbRw67rI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DbRw67rI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44959C4CEFB;
	Tue, 10 Jun 2025 09:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749547663;
	bh=lfBamJGxY5k+dFxogqH5eoJqA8X1z7zpTPGsxWnNEMw=;
	h=From:To:Cc:Subject:Date:From;
	b=DbRw67rIApDToeSQaohj/IYtUXaxmet2X06VVVtEMc/pzT7jP+Esfx5dUB9SwZZdt
	 Kf2ARcaInme/RHykD6bXQ8QmRpRe4kMJ5teA4TWVNKvWdNib61o+tFjJ7PxEGnPesw
	 7fbXg+IPCGHYW5CGjr3TqupIMgeHaLHp/1n6q5zxdAA/BE6uXjfP+QKPXqWCiqlGe3
	 7Qw0Seh6l3DB3BsSfPV+nXzO9u/v/x1zdx+F6sx3p4sagQctSj2JRghnEaHSo2UArn
	 HNedLWqE2GXk2Va58A52uzpxXsmD0lZ2dy7/Q08WWanoscB0TqsCPMJqaNyOqZSgPq
	 YlBZHY3yitH/w==
From: Arnd Bergmann <arnd@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] drm: omapdrm: reduce clang stack usage
Date: Tue, 10 Jun 2025 11:27:33 +0200
Message-Id: <20250610092737.2641862-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The thread sanitizer makes the stack usage explode from extra variable
spills in dispc_runtime_resume:

drivers/gpu/drm/omapdrm/dss/dispc.c:4735:27: error: stack frame size (1824) exceeds limit (1280) in 'dispc_runtime_resume' [-Werror,-Wframe-larger-than]

I could not figure out what exactly is going on here, but I see that
whenever dispc_restore_context() is not inlined, that function
and its caller shrink below 900 bytes combined of stack usage.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/omapdrm/dss/dispc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index 533f70e8a4a6..cf055815077c 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -524,7 +524,7 @@ static void dispc_save_context(struct dispc_device *dispc)
 	DSSDBG("context saved\n");
 }
 
-static void dispc_restore_context(struct dispc_device *dispc)
+static noinline_for_stack void dispc_restore_context(struct dispc_device *dispc)
 {
 	int i, j;
 
-- 
2.39.5

