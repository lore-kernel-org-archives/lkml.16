Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6422B674
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 20:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743625500; cv=none; b=KhfTgDSy3qcqQvy0A+L0RMLITGWLeS2dEvMwJQ0vvDwLgpw9Yv2bikYVQbKqRoSqAK8Cjk81jzF8nWHsZrauQy56ga+jXlJqxz2UPrvskBzc8h9EiibrjyT0KyuOgKEoPqjCEFSC6qlOXRjFlFpQ11MLSJYmwAVOBixnqajqy18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743625500; c=relaxed/simple;
	bh=3wiNHrGJCrOQUSc/gV7EKEKCVN+ZvFLYbqcNYBD/b/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YJbO8G1bXjyXYJNnDRz2T6PRPzgpGLRHHKYCaYI67lTHCxRPGhBt/I7xzxriSCyVSzUS0UpPYbm93SXm5+GqqtssHQj00dEn+TPMcQTMC18hXtn3T3zJJYA03/JTuF69xG7RMmSGTsyzOOQK/yFsSm0GNy1GvN3GFxxcaEzro1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pU7IOxhs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pU7IOxhs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCEBDC4CEDD;
	Wed,  2 Apr 2025 20:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743625500;
	bh=3wiNHrGJCrOQUSc/gV7EKEKCVN+ZvFLYbqcNYBD/b/Q=;
	h=From:Date:Subject:To:Cc:From;
	b=pU7IOxhsePyUaf6+Fuogsjeg+KqzKCCCI44RFWo+NH34KvsW/CKXAwHawHM2h8kl5
	 3PnhHZS4seV8kxtRrGgBPypZkfcwHeHWm5hwVpUDQFo1fRn1WeJcN5O6D3vHKkSaSe
	 xvHkp0NDkD8oL/KV957plkrfTgeK7lLhP7szLdSsEL6LxuupT9uTuSBAZd6kaXPpEu
	 JADKRcwpBJGIwOHIrn53+Tcs4A90gjwttYZdtdgDIFYIZMMeA6cqXn3f387fwf2hQL
	 UgFcLc8Q3AZkM1/Sd+d3DLg4Gve2nqhndtTYab9josbCjeWKjZCKzgWt9V7bVCaKMe
	 b3Nra0VryBggg==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 02 Apr 2025 21:21:57 +0100
Subject: [PATCH] tools/include: make uapi/linux/types.h usable from
 assembly
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250402-kselftest-vdso-fix-v1-1-71b68f1c27e3@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGWc7WcC/x2MSQqAMAwAvyI5G4hFcfmKeFCbalCsNCKC9O8Wj
 zMw84JyEFboshcC36LijwRFnsG8jsfCKDYxGDIVlWRwU97dxXrhbdWjkwdtW7upmaglQ5DCM3D
 S/7QfYvwA7UJCAWQAAAA=
X-Change-ID: 20250402-kselftest-vdso-fix-d97fb8b09020
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1883; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Nkt5GR0WOOcCXmdD6PdanESRtWi4YNRoSchI0vF6bhQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn7Z0ZBKu74myNZqTNWaq1ueGrMW+h9+KsIf+JQzhr
 urtJv5+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ+2dGQAKCRAk1otyXVSH0Kb4CA
 CCqDdFle4UTGPJJQaYR3wI2pTg81Uakog2U4PN8pcmZDzxxdv7p6FBgWSwkq33YwGA+wZBc38QUCPw
 wkzncGymNL9zpNlj1H5FYzv83/dMd18GXyS30u9KIdwqGQUjbNaCGQd5+92fXzJh8C/xYZtYhoe2Jy
 sfqjLhvbTfOj0xAGkJ786B4Qlhi1v/sYvj5Zbw0YhJJ2uXcnaIT6l00lEGgQ52VQ7VcKbnDumtzjuu
 ogElYNICDgtewsBCLXdixMN2wzcd3OMrPoSGk94wsx+sCtKQLn2Zs8I4rJWD8SrCKFh28kEZB6khmu
 eyEh8DjsEyY/WIcZo2bV8ffiuRBmp5
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

From: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

The "real" linux/types.h UAPI header gracefully degrades to a NOOP when
included from assembly code.

Mirror this behaviour in the tools/ variant.

Test for __ASSEMBLER__ over __ASSEMBLY__ as the former is provided by the
toolchain automatically.

Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/lkml/af553c62-ca2f-4956-932c-dd6e3a126f58@sirena.org.uk/
Fixes: c9fbaa879508 ("selftests: vDSO: parse_vdso: Use UAPI headers instead of libc headers")
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Link: https://patch.msgid.link/20250321-uapi-consistency-v1-1-439070118dc0@linutronix.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
This is a fix for a build break in the vDSO selftests which was
introduced some time ago in the tip tree, Thomas posted the fix on 21st
March the day after I reported it but it's not been picked up and the
issue is now in mainline.  I'm sending it directly to try to avoid -rc1
being broken.
---
 tools/include/uapi/linux/types.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/include/uapi/linux/types.h b/tools/include/uapi/linux/types.h
index 91fa51a9c31d..85aa327245c6 100644
--- a/tools/include/uapi/linux/types.h
+++ b/tools/include/uapi/linux/types.h
@@ -4,6 +4,8 @@
 
 #include <asm-generic/int-ll64.h>
 
+#ifndef __ASSEMBLER__
+
 /* copied from linux:include/uapi/linux/types.h */
 #define __bitwise
 typedef __u16 __bitwise __le16;
@@ -20,4 +22,5 @@ typedef __u32 __bitwise __wsum;
 #define __aligned_be64 __be64 __attribute__((aligned(8)))
 #define __aligned_le64 __le64 __attribute__((aligned(8)))
 
+#endif /* __ASSEMBLER__ */
 #endif /* _UAPI_LINUX_TYPES_H */

---
base-commit: acc4d5ff0b61eb1715c498b6536c38c1feb7f3c1
change-id: 20250402-kselftest-vdso-fix-d97fb8b09020

Best regards,
-- 
Mark Brown <broonie@kernel.org>

