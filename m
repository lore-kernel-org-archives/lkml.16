Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED212836AC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744285349; cv=none; b=Wnpmuinn4LfrYhQ5UMyO1BGkpAeh7Z+sh5G6lsmoYROkSwCAs7icwUqZZPNUM2HzwmDvKgXBN7ArmB8Vk8ZjZUMOf9WQ+uFAUe2yMehf7RQEDR1Dx2DSkY0jHidO4o3kaea27znEMCzT7aYwrBWSi/DoWpdbQLWa5QY6V+nr8Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744285349; c=relaxed/simple;
	bh=R0hMK9DsiRGaPebkDok1b4twK+6uJYRkaiPTvhKn9CM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GLCzLyNjL3Vd8DPXdvzN4UI2avdGCLEM6bYXxpTSr49mRHCjYDGWi7nf40Oo6a/xRrOytj2D8ZZ1M2pxgMLiE4LrK4oqWs9K4h6qQ/c54LJ4Q3pzRCTvZYHu8V+zXNKIBXURzKpepuZ/8SeXcAqyj/R4pwsqkpDPBsZneSsvzrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bYUjG3Fc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bYUjG3Fc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C14BC4CEDD;
	Thu, 10 Apr 2025 11:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744285348;
	bh=R0hMK9DsiRGaPebkDok1b4twK+6uJYRkaiPTvhKn9CM=;
	h=From:To:Cc:Subject:Date:From;
	b=bYUjG3FcjSwYngfEEi5Tw0cbvHgGog6huPyer6YC8/Dt3PLD+bOa9yLTUhhFFrqoZ
	 8WKYJv/EinYOQ+9eN/aqgD4xq4G5zkQu/rzzmAYYHyUaDHcv9CXjHH/gbWAbOx3kBP
	 +hep9kSEbbmXpuZNL/TVewB7vDmcbz2x7K8W3kkMDKKvY+pkCZsZ7dQfRJehAleFiH
	 IHXVAbEAD90iBCDcR9WvyRvw3ScyiEkSc+KDq1H67M9OeHE7nproPFYUSzD4qp59Su
	 FFBLB8t8v0jHfkS5Ymc/GsyDelt8uwsqbxrU0OBFF/b7ioedL+RktVTi3nyMn4WRyv
	 DXbhtbfHqsDRg==
From: Borislav Petkov <bp@kernel.org>
To: X86 ML <x86@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	stable@kernel.org
Subject: [PATCH] x86/microcode/AMD: Extend the SHA check to Zen5
Date: Thu, 10 Apr 2025 13:42:22 +0200
Message-ID: <20250410114222.32523-1-bp@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Borislav Petkov (AMD)" <bp@alien8.de>

All Zen5 machines out there should get BIOS updates which update to the
correct microcode patches addressing the microcode signature issue.
However, silly people carve out random microcode blobs from BIOS
packages and think are doing other people a service this way...

Block loading of any unreleased standalone Zen5 microcode patches.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Cc: <stable@kernel.org>
---
 arch/x86/kernel/cpu/microcode/amd.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/microcode/amd.c
index 57bd61f9c69b..2e67adaf1caa 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -199,6 +199,12 @@ static bool need_sha_check(u32 cur_rev)
 	case 0xa70c0: return cur_rev <= 0xa70C009; break;
 	case 0xaa001: return cur_rev <= 0xaa00116; break;
 	case 0xaa002: return cur_rev <= 0xaa00218; break;
+	case 0xb0021: return cur_rev <= 0xb002146; break;
+	case 0xb1010: return cur_rev <= 0xb101046; break;
+	case 0xb2040: return cur_rev <= 0xb204031; break;
+	case 0xb4040: return cur_rev <= 0xb404031; break;
+	case 0xb6000: return cur_rev <= 0xb600031; break;
+	case 0xb7000: return cur_rev <= 0xb700031; break;
 	default: break;
 	}
 
@@ -214,8 +220,7 @@ static bool verify_sha256_digest(u32 patch_id, u32 cur_rev, const u8 *data, unsi
 	struct sha256_state s;
 	int i;
 
-	if (x86_family(bsp_cpuid_1_eax) < 0x17 ||
-	    x86_family(bsp_cpuid_1_eax) > 0x19)
+	if (x86_family(bsp_cpuid_1_eax) < 0x17)
 		return true;
 
 	if (!need_sha_check(cur_rev))
-- 
2.43.0

