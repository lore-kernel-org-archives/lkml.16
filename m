Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1011E7C18
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739183043; cv=none; b=OAB1BxIiQLjjhn9i6nnsL7jSKyHSZKebYP2xCtgB+vF3VwY23GMXCKYHBrf7G3p9eb40Yk67oQtz2+SayZ2UcNqQQklWAs6nd+IWePe/+JqrEb19keLWfCGQlRyHazANTtnUCxlVTxuubKD50mZDfJid07x3H3T4rHyEtflAtEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739183043; c=relaxed/simple;
	bh=R/EbIe/Ut8zG0dwo6SVym6eFR34nXb/sZtcSXwfII9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MjYeKzp0wnDOGiN3jee4b/5nZwZQmtIUVg9nj890T1wF+LgeMDyE5xJThrWTkgpXOusEZ+cJZMsZ5nnQjgKGvHBfwwFdakUKfd2nJToA9I7Ld+PkAoOsIShBsfqOm6g0AxBXmDxwknDwg7oN0qDOsUvNzaUrb2U6/eNYvhKX/HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FyXGZ9p1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FyXGZ9p1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 832C4C4CEE5;
	Mon, 10 Feb 2025 10:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739183042;
	bh=R/EbIe/Ut8zG0dwo6SVym6eFR34nXb/sZtcSXwfII9M=;
	h=From:To:Cc:Subject:Date:From;
	b=FyXGZ9p1YF2amZZxLqgEb4S5KaZInUNus+jqTjbyZvnMCCP532CUx5C420lzCYtEH
	 ctsZnX75V2JhAiJhTBoGagRknLvE5FZfhUfJjpKRirvHN0jReAzQDQEBynC8O0IOz0
	 CszU0DZJ7UKixO5bCy5Xp81NayQegjo3oAWChYNlzl5fEe5qN5A3rBB5JooeistEMN
	 mphdrEovcIoEz/9oWE1VpV1+jGuTk47oeYZWah4VvPG2rIAl/tVWEAiLSC2lFcm1bn
	 NIm8d3H5Zne0Bp1F/yVBrAhk/3jHolVtGgOEUWuI/ADC3FhrJTvv1o+HcdO8nnds3B
	 y2dpLfIcalyRw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/imagination: remove unnecessary header include path
Date: Mon, 10 Feb 2025 19:23:50 +0900
Message-ID: <20250210102352.1517115-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drivers/gpu/drm/imagination/ includes local headers with the double-quote
form (#include "...").

Hence, the header search path addition is unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 drivers/gpu/drm/imagination/Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index 9bc6a3884c22..3d9d4d40fb80 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -1,8 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only OR MIT
 # Copyright (c) 2023 Imagination Technologies Ltd.
 
-subdir-ccflags-y := -I$(src)
-
 powervr-y := \
 	pvr_ccb.o \
 	pvr_cccb.o \
-- 
2.43.0

