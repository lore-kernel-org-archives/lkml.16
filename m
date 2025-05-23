Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5061A288517
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.133.245.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747987026; cv=none; b=j4nWMDMS9Mz4GNxEvIONffretipLQkdfu4aFWhk9Hag3M9L8K/0aO1NXszNLqMWAIww5MXWBzy4pI3T+uc+xOMqD1OCTgKZOy+0Hq0SixVZM1Oekuj1JYmm1JbinQCUnG5AjAY96bQWvsMYi6GTQ+R0gbi9E2o6aO34q/tl073Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747987026; c=relaxed/simple;
	bh=rR3vPAPlUJEfRssL5GiwmgHjwvovtafRJtml2i1CacQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pz9iBV0dIR0abBMgI93uVxysWhnNasMSDtxwKobVMLLCEcGm46Ztiwy/WP4wXaUv0tS+8FrtKt4lgS9K9S1w+cWGYZOvQaw0xYh6V8jdV3QYbACRGH8JQ4Otp7a3mMBlTFbfooILyUpHmKG67xnNF/piY/Cp2tCsyoIXW7DXrzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nppct.ru; spf=pass smtp.mailfrom=nppct.ru; dkim=pass (1024-bit key) header.d=nppct.ru header.i=@nppct.ru header.b=TLxqil1W; arc=none smtp.client-ip=195.133.245.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nppct.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nppct.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nppct.ru header.i=@nppct.ru header.b="TLxqil1W"
Received: from mail.nppct.ru (localhost [127.0.0.1])
	by mail.nppct.ru (Postfix) with ESMTP id 45AA61C118E
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:50:24 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
	reason="pass (just generated, assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:to:from:from; s=dkim; t=1747986623; x=
	1748850624; bh=rR3vPAPlUJEfRssL5GiwmgHjwvovtafRJtml2i1CacQ=; b=T
	Lxqil1W0wc6J8ZbOZNvlAt+gde3rmNzxtgsGs8bQjb33Y4axC67muacweDXiZIbd
	Tr68qhQFQsJHFcZFbhDDODtFjXagIdYmfIc2PzkNZSurjYreYykl4AyGWxzqrGKD
	IkmcQe/Ymm75u0KFRyry0Lhg/wnOQeYySOIBPpFQt4=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
	by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ExOGWsjwMiPu for <linux-kernel@vger.kernel.org>;
	Fri, 23 May 2025 10:50:23 +0300 (MSK)
Received: from localhost.localdomain (unknown [87.249.24.51])
	by mail.nppct.ru (Postfix) with ESMTPSA id 91B471C0DAB;
	Fri, 23 May 2025 10:50:22 +0300 (MSK)
From: Alexey Nepomnyashih <sdl@nppct.ru>
To: Lyude Paul <lyude@redhat.com>
Cc: Alexey Nepomnyashih <sdl@nppct.ru>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH] drm/nouveau/mmu: fix potential overflow in PFN size calculation
Date: Fri, 23 May 2025 07:50:14 +0000
Message-ID: <20250523075015.884716-1-sdl@nppct.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On most Linux-supported platforms, `int` is 32-bit, making (1 << 47)
undefined and potentially dangerous. To ensure defined behavior and
correct 64-bit arithmetic, replace `1` with `1ULL`.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Cc: stable@vger.kernel.org # v5.1+
Fixes: a5ff307fe1f2 ("drm/nouveau/mmu: add a privileged method to directly manage PTEs")
Signed-off-by: Alexey Nepomnyashih <sdl@nppct.ru>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index 9c97800fe037..29da1acbe3a8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -1383,7 +1383,7 @@ nvkm_vmm_pfn_map(struct nvkm_vmm *vmm, u8 shift, u64 addr, u64 size, u64 *pfn)
 			 */
 			while (size) {
 				pfn[pi++] = NVKM_VMM_PFN_NONE;
-				size -= 1 << page->shift;
+				size -= 1ULL << page->shift;
 			}
 		} else {
 			pi += size >> page->shift;
-- 
2.43.0

