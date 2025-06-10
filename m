Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC47481CD;
	Tue, 10 Jun 2025 09:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547891; cv=none; b=bMDfTPSzWgURKuw7h0BeNs6uJAs/KLHQDUo+PMO3wKjRWUkl6a9lJfLV3oAqWUwdgXvTVyAIqYsBupg3uT6fDlVcTv0KXxUiF1YdRo/76MOfU3uQfLnARlp1P74zSeNlB2kdkY8BrTvpR3bpinhSLoBLYwOjTZasxxmMDxT07Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547891; c=relaxed/simple;
	bh=BO97OAsXfqwgbvY0qB23trz3Pz5fZ7baV/z18Q+sb08=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=W2qrSaWoGeWOprXVIIH3Fo5EDXuBBCd0v2frlWPwxh9EDeNQEOn2ZeW3EOX18WQ+wJXOqbi332leT/iXuNkPzZhUGUkUXanbnDTSKOBzQKqdJtG7hUmwFQZaQoYmPT9DHOynBn7+JfWT7WoTn2OijY83B5qCdeKD3IvZqrpWfeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDj5OPeL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDj5OPeL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48CD7C4CEED;
	Tue, 10 Jun 2025 09:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749547891;
	bh=BO97OAsXfqwgbvY0qB23trz3Pz5fZ7baV/z18Q+sb08=;
	h=From:To:Cc:Subject:Date:From;
	b=oDj5OPeLTOFcf0lt91d44gt25Q8AcRpd+Oo2/BmAXQb43RYIF4uNEcTO/0xyOd14q
	 k/+5qVX72XAzp/PF9G5XWDmCydbl/O3Y4GQhyvKaJnYdSwVN6/q/zX+BJhQ69MIOBa
	 gygex0aNnTwmLcCjJb/2K89AQouE6PZWuUFBErR1gD4G6O99Cn2v3bUobGtRs+aaYD
	 so3eoflcorpSX7m+phyhHlWDm3/6AncLav0598+QJ/crj/KGaMVIY7G/23EV5e9H5I
	 T8ayfw6e2DaY7nRCofVNM2tdsr+mUUrAaLA3xfsfmgoFoN4vqLDoAH7I7cutS4iGBd
	 aT2VH3LnWqQDQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nathan Chancellor <nathan@kernel.org>,
	=?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] drm/radeon: reduce stack frame size for radeon_cs_ioctl
Date: Tue, 10 Jun 2025 11:31:20 +0200
Message-Id: <20250610093125.2645138-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Clang inlines radeon_cs_parser_relocs() into radeon_cs_ioctl(), and
since both of these use a lot of stack space, the sum of them can
make it exceed a limit of 1280 bytes:

drivers/gpu/drm/radeon/radeon_cs.c:669:5: error: stack frame size (1328) exceeds limit (1280) in 'radeon_cs_ioctl' [-Werror,-Wframe-larger-than]
  669 | int radeon_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
      |     ^

Mark radeon_cs_parser_relocs as noinline_for_stack, so clang and gcc
both behave in a consistent way. Calling into radeon_cs_parser_relocs()
still uses a lot of stack space here, but this is not any worse than it
already was, and the other code paths are better now.

Fixes: c9b76548899c ("drm/radeon: validate relocations in the order determined by userspace v3")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/radeon/radeon_cs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
index b8e6202f1d5b..220a9b107b15 100644
--- a/drivers/gpu/drm/radeon/radeon_cs.c
+++ b/drivers/gpu/drm/radeon/radeon_cs.c
@@ -78,7 +78,7 @@ static void radeon_cs_buckets_get_list(struct radeon_cs_buckets *b,
 	}
 }
 
-static int radeon_cs_parser_relocs(struct radeon_cs_parser *p)
+static noinline_for_stack int radeon_cs_parser_relocs(struct radeon_cs_parser *p)
 {
 	struct radeon_cs_chunk *chunk;
 	struct radeon_cs_buckets buckets;
-- 
2.39.5

