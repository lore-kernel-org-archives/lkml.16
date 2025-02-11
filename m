Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B99A256C89
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 16:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291815; cv=none; b=TLDMgcEl6KdheDxrNzCskV1tnZuSrEHHGMsf5f/4XEQewZW5mx4wlWtbPpQCxHib5TfRlkMNG3MbXIVNUFxqyFRnsFAzaaFlabA7Tdw3jc7Y80uSt8pIKLDVPs1a9+/W2JvzaLe4txbZm3QLnljQVIv/vpWEcxU76ZqKeYkO1Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291815; c=relaxed/simple;
	bh=Xzv2Idcboi/8TyI9SKYnRnJkKusnSgH6ZxaO62tE/HU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jen61VUDJqvd9Q7RL43wJ9lQHXfQQq8/FhHj/vJ5kn7X4RDWlUe3I5yVpmcw0TAeB6lmyA/gvSLCyE6bYcOYUaaGWOSdniQxGN4wWK+99wBXEJt63B+qO+gKsZU0ma8vM94+bw/gdTcXY2AZUkfetFHJgkzXaj8+q8dfAvpwiuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ION3maPw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ION3maPw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7041C4CEE8;
	Tue, 11 Feb 2025 16:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739291814;
	bh=Xzv2Idcboi/8TyI9SKYnRnJkKusnSgH6ZxaO62tE/HU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ION3maPw6zJtMYtXXs9QSzU8e9ecIOfwaSBtwT8WFFMg/Q5aqJVzx0dkeTdUpjARV
	 5C8CrPpKXOT4I12VbojMMQFHZDepQaKmKcmiwIPW+u/ADogzK+0qQJHlJg9f47j0H5
	 LjAqyc33NKQI0a1fKX9sik88IqNZHcWXUlA4NiYMytOHGRWj/5TVm/aeEqfQ3RG2yS
	 Am4ACfPurge/yxpRURPnW+RtfaIw91zb9JzBCL8DTSSIrz2Y0EcC3vm7qvfIo2He5P
	 /jGBwKpZ9qXh9XjOZKzmR4mAx151miiESkvB1xAcCK3xorPboic/n8ZWvfhUgZuVsb
	 C1F2HzPejp+CQ==
From: Borislav Petkov <bp@kernel.org>
To: X86 ML <x86@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [PATCH 2/5] x86/microcode/AMD: Remove unused save_microcode_in_initrd_amd() declarations
Date: Tue, 11 Feb 2025 17:36:45 +0100
Message-ID: <20250211163648.30531-3-bp@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250211163648.30531-1-bp@kernel.org>
References: <20250211163648.30531-1-bp@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Borislav Petkov (AMD)" <bp@alien8.de>

Commit

  a7939f016720 ("x86/microcode/amd: Cache builtin/initrd microcode early")

renamed it to save_microcode_in_initrd() and made it static. Zap the
forgotten declarations.

No functional changes.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 arch/x86/kernel/cpu/microcode/amd.c      | 2 +-
 arch/x86/kernel/cpu/microcode/internal.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/microcode/amd.c
index 4a62625c311a..f831c0602994 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -517,7 +517,7 @@ static bool __apply_microcode_amd(struct microcode_amd *mc, unsigned int psize)
  * patch container file in initrd, traverse equivalent cpu table, look for a
  * matching microcode patch, and update, all in initrd memory in place.
  * When vmalloc() is available for use later -- on 64-bit during first AP load,
- * and on 32-bit during save_microcode_in_initrd_amd() -- we can call
+ * and on 32-bit during save_microcode_in_initrd() -- we can call
  * load_microcode_amd() to save equivalent cpu table and microcode patches in
  * kernel heap memory.
  *
diff --git a/arch/x86/kernel/cpu/microcode/internal.h b/arch/x86/kernel/cpu/microcode/internal.h
index 21776c529fa9..5df621752fef 100644
--- a/arch/x86/kernel/cpu/microcode/internal.h
+++ b/arch/x86/kernel/cpu/microcode/internal.h
@@ -100,14 +100,12 @@ extern bool force_minrev;
 #ifdef CONFIG_CPU_SUP_AMD
 void load_ucode_amd_bsp(struct early_load_data *ed, unsigned int family);
 void load_ucode_amd_ap(unsigned int family);
-int save_microcode_in_initrd_amd(unsigned int family);
 void reload_ucode_amd(unsigned int cpu);
 struct microcode_ops *init_amd_microcode(void);
 void exit_amd_microcode(void);
 #else /* CONFIG_CPU_SUP_AMD */
 static inline void load_ucode_amd_bsp(struct early_load_data *ed, unsigned int family) { }
 static inline void load_ucode_amd_ap(unsigned int family) { }
-static inline int save_microcode_in_initrd_amd(unsigned int family) { return -EINVAL; }
 static inline void reload_ucode_amd(unsigned int cpu) { }
 static inline struct microcode_ops *init_amd_microcode(void) { return NULL; }
 static inline void exit_amd_microcode(void) { }
-- 
2.43.0

