Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92F521CC61;
	Fri,  4 Apr 2025 22:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743804619; cv=none; b=MnYCNpxeGufZgE0PoCODMz+kTvVdQReChTWmoXVkHTOUcJbIcnQxlPZ5QDMAJE8zPZD+gtljVaxlUqo6GFmmyYDRvd7wJ5RSyNxtFPtLk/1LdOn8w027HDRhp+6HpgxvNXoxIH2bJ2SJpYQUlX5E71o1m0oD5hgl9tLwLpJDdTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743804619; c=relaxed/simple;
	bh=y51MbOwVp4ryXyEx0xcKE1VjTtQ0uSDqTX4P6+px5lc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U7rmbHSQt76w7vk1KFcwuaG3JH3SgtfL7dh3sYhnLn5LMWZvlMesmx70Se9nuxnQWdIknBiCpR+uuA5M+vz8wFc7LaG1j8QW4Tk1i/SevH/DkjbKBi8sOv9mYukqGScyZs+tngu2lyLK/u78T7EAKGzbRqWpZnq1IslM0ENojrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ddlWi+xK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ddlWi+xK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7934CC4CEE9;
	Fri,  4 Apr 2025 22:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743804619;
	bh=y51MbOwVp4ryXyEx0xcKE1VjTtQ0uSDqTX4P6+px5lc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ddlWi+xKGujI3peJO5VM30nTC8X/J+slv0fz/1brWdy3SaSguLa+GV/WBj2r13eV1
	 WBm/+xuShjONq5LwT9pX4dfnTDwnCgWjdPQR13/nv1XQ0r6VKIfy8L7qGQKKfMitTR
	 /ldi8D1MlIHqeP6eQ3VNOIeI6gYmnpQEm7yZ3MkAAeSPKB3MVDmct3W71YwXxh/uyL
	 wI3SdDRW/M3ZXgssU0P4G3SDXYSzbMCMpG8ZhGfa/7YU0sygavjTqELVUo6qt4R61A
	 yVxsV3hbP0ls6gZw0gL5VH51z3uP52wQvu/AFhnpszJZipUNhtEueIZENZ4fovGj++
	 BJyJ9drfb8k1g==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 04 Apr 2025 15:10:02 -0700
Subject: [PATCH 1/2] compiler-gcc.h: Introduce __diag_GCC_all
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-vsprintf-convert-pragmas-to-__diag-v1-1-5d6c5c55b2bd@kernel.org>
References: <20250404-vsprintf-convert-pragmas-to-__diag-v1-0-5d6c5c55b2bd@kernel.org>
In-Reply-To: <20250404-vsprintf-convert-pragmas-to-__diag-v1-0-5d6c5c55b2bd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1108; i=nathan@kernel.org;
 h=from:subject:message-id; bh=y51MbOwVp4ryXyEx0xcKE1VjTtQ0uSDqTX4P6+px5lc=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOkfIo5FHfF4tbny033FTdHRfn3f9//6N3tu8971W4tD+
 J4r/Pn2q6OUhUGMi0FWTJGl+rHqcUPDOWcZb5yaBDOHlQlkCAMXpwBMJCWWkWHr1NM83qy/ErQO
 LRMJiVJVE/I5m1Dt68aR0v/SfPpScWtGhmmV+yRDgyVjd0r/zUiu+743g3fxJFV3j9VCMfNu9V+
 cxA0A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

It is not possible disabling a diagnostic for all versions of GCC
without hard coding the minimum supported version at the site, as the
GCC specific macros require a minimum version to disable the warning
for:

    __diag_ignore(GCC, 5, ...);

__diag_ignore_all() does not solve this issue because it disables a
diagnostic for all versions of both GCC and clang, not just one or the
other.

Introduce __diag_GCC_all so that developers can write

    __diag_ignore(GCC, all, ...);

to disable a particular diagnostic for all versions of GCC, while not
affecting clang.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 include/linux/compiler-gcc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
index c9b58188ec61..c75a222880f9 100644
--- a/include/linux/compiler-gcc.h
+++ b/include/linux/compiler-gcc.h
@@ -127,6 +127,8 @@
 #define __diag_GCC_8(s)
 #endif
 
+#define __diag_GCC_all(s)	__diag(s)
+
 #define __diag_ignore_all(option, comment) \
 	__diag(__diag_GCC_ignore option)
 

-- 
2.49.0

