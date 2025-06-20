Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD8C280002;
	Fri, 20 Jun 2025 11:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750418053; cv=none; b=jIcoUjryhv1ZG/xnri1yeplSZLig/ZA09RTt+ExMMsifXwfIJioI8BLZM2vyuFLh10ug3lOowtIe5j0kXeJfquOfYPwLu5J20eCpG72MFhC5arlSwD4QALcFTNW8Sr+R/J0XQaRCLKumdo03rKqQCbnpzqYka4YRaR7SDyHGUog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750418053; c=relaxed/simple;
	bh=jcA+Zct8W1MISYPhvbSTyXKBludLCkQw7lwTdHRqiRE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KP9ZxF9aIIj9vy/pjytj++UvyxhlZAJnEMR6rYpkylcV04OW5jSBzIq4KYo08WHNFgoojDFuQAecDbpUa7MuCPOL5c7HmfgRB9CYxOknTk74zadwWM6wL+/s22aX8dPw0n07ZYto0+rKxyVPkVjRUmmjf+D7caRi4mBKGTiqGO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CaJyiUKk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CaJyiUKk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D387C4CEE3;
	Fri, 20 Jun 2025 11:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750418052;
	bh=jcA+Zct8W1MISYPhvbSTyXKBludLCkQw7lwTdHRqiRE=;
	h=From:To:Cc:Subject:Date:From;
	b=CaJyiUKkHQ2S/mz8TWUCSTDPnikGud2ZP9KwyGXNEN5BUrFYIRFDk/hSGKV1wW/Sa
	 FtXiEPKz73lPSQSsqkvWKh0kSdBXAbYgcOAo+C8AYugPbmJaOonT+PXmqz0PniVoKV
	 NOt8wwCgF+iz7QxSwlpNlj9Cs+i72vg6HWwHK/0DYQ2mZW5BzKjNUTu+mKLyHNOMx5
	 T434gJS8/4VhcjLSKUf3CvD/Bs3bJCCc0jPWqMvxg1jCHP0DMzSUqjO3QLE4PqfgaL
	 mOkgRq3w3Q2cicuWTATXHXK23IcXjg32p5qJ1ttqgQrW0sAdoVLqlrL4t4PNOgmcVn
	 LI+jOEBRI/yOQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Tony Ambardar <tony.ambardar@gmail.com>,
	Daniel Borkmann <daniel@iogearbox.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <kees@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] kbuild: change __retain macro for gcc-11
Date: Fri, 20 Jun 2025 13:13:43 +0200
Message-Id: <20250620111406.3365763-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Building kernels with CONFIG_LD_DEAD_CODE_DATA_ELIMINATION using gcc-11
causes compiler warnings:

kernel/cgroup/rstat.c:65:1: error: 'retain' attribute ignored [-Werror=attributes]

It appears that this version reports __has_attribute(__retain__) as true
but doesn't actually support the feature.

Fixes: 0a5d3258d7c9 ("compiler_types.h: Define __retain for __attribute__((__retain__))")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/compiler_types.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index 4684277bdd3b..c295b376a305 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -153,12 +153,15 @@ static inline void __chk_io_ptr(const volatile void __iomem *ptr) { }
  * being optimized out, but operates at the compiler/IR-level and may still
  * allow unintended removal of objects during linking.
  *
- * Optional: only supported since gcc >= 11, clang >= 13
+ * Optional: only supported since gcc >= 12, clang >= 13
+ *
+ * On gcc-11 the feature is reported to be present but causes build warnings.
  *
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-retain-function-attribute
  * clang: https://clang.llvm.org/docs/AttributeReference.html#retain
  */
 #if __has_attribute(__retain__) && \
+	(__GNUC__ != 11) && \
 	(defined(CONFIG_LD_DEAD_CODE_DATA_ELIMINATION) || \
 	 defined(CONFIG_LTO_CLANG))
 # define __retain			__attribute__((__retain__))
-- 
2.39.5

