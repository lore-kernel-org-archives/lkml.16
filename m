Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510D4220689;
	Fri,  4 Apr 2025 22:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743804621; cv=none; b=pztQGlxVoAQPCfYr7sBg7KXLNv8iKOCHbBr/1bsFl4VrKEd1R5fjXS3rEaXLF9wweWvZ4ATXqQNu9+7RGZi+m+1C0m9ZLl0jgYrAc3fJUsL+UDRv2+OACJAw+4uyxSzzHBqSrCaqzHE5+u/XNb9CSboiEoIBtGDt5nxW/8BuxvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743804621; c=relaxed/simple;
	bh=SZv8bDAjaPEtH77UYmR1l1sX7V/ZI3yF756TC3/s5Ao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O3cG7ymQROy0q+QdVv5gayp2Alkuxm7sKCqVg80FyrT6iGs1wbt1c4a1Ou1+jX3KAyvvy1KVb6ikEASTt3Jl1WduJs+IrxyG5DpZJk+LN6jqT63XrrNhushHUipFJptGLx1tid6nCJunOGv+NXloZeHGp1+/alNu91ND+f8MOJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0TJbaSW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0TJbaSW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84506C4CEDD;
	Fri,  4 Apr 2025 22:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743804621;
	bh=SZv8bDAjaPEtH77UYmR1l1sX7V/ZI3yF756TC3/s5Ao=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i0TJbaSWVkXRnwwQsbsIZFuBVRoqm8B59GfrjOn/pdwjPFrvT1YXSp3HVcC2Jkl/L
	 oHKNHwaNsSPKDNhTbhPGE2f87VKMqRmOUpRTq9wqfOFBafkPGd+hdNqJqOjMhpFCd6
	 ZZvtoFJZGy3lvL00rcJB8EI7YiBzOPTHWuaO2qtWoZP+NdtSDY8Bce/yuGy6oUK1Q1
	 c09p1AY7KC6joBWkmcBqb/F8LXs6gIml+BgvuF6M9jNnJaBCd2Lj+zDuX9LbspZcE1
	 ll6ggZrH6aMrTtZdKBH/gX5Nbbv03qpWOIOatLlPauTfargzr8B+cLC9//CLglc/Tu
	 qgDnIhghR4oBA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 04 Apr 2025 15:10:03 -0700
Subject: [PATCH 2/2] vsprintf: Use __diag macros to disable
 '-Wsuggest-attribute=format'
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-vsprintf-convert-pragmas-to-__diag-v1-2-5d6c5c55b2bd@kernel.org>
References: <20250404-vsprintf-convert-pragmas-to-__diag-v1-0-5d6c5c55b2bd@kernel.org>
In-Reply-To: <20250404-vsprintf-convert-pragmas-to-__diag-v1-0-5d6c5c55b2bd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1865; i=nathan@kernel.org;
 h=from:subject:message-id; bh=SZv8bDAjaPEtH77UYmR1l1sX7V/ZI3yF756TC3/s5Ao=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOkfIo5tnct/NsBR8dya6uq6I9Lq29+f5GJ9IXtz3/q/v
 S8+sk9e0FHKwiDGxSArpshS/Vj1uKHhnLOMN05NgpnDygQyhIGLUwAmckqQkeHWhlb/J59/Tyjv
 ETzt6/SlmVU/fkrIDeOU//eV2VLs1psxMvy9Ixrx+rDs2yXPu98kXXo/XUePw7lXOCpsadkJ2aO
 PKxgB
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

The GCC specific warning '-Wsuggest-attribute=format' is disabled around
va_format() using raw #pragma statements, which includes an
'#ifndef __clang__' to avoid a warning about an unknown warning option
from clang (which recognizes '#pragma GCC' for compatibility reasons):

  lib/vsprintf.c:1703:32: error: unknown warning group '-Wsuggest-attribute=format', ignored [-Werror,-Wunknown-warning-option]
   1703 | #pragma GCC diagnostic ignored "-Wsuggest-attribute=format"
        |                                ^

While the current solution works, it is not visually appealing. The
kernel already has some infrastructure that wraps these #pragma
statements to give more specific control over diagnostics without
needing #ifdef blocks for different compilers. Convert the existing
statements over to the __diag macros.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 lib/vsprintf.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index a2195bc81723..8a6cdee0d4ad 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1699,10 +1699,9 @@ char *escaped_string(char *buf, char *end, u8 *addr, struct printf_spec spec,
 	return buf;
 }
 
-#pragma GCC diagnostic push
-#ifndef __clang__
-#pragma GCC diagnostic ignored "-Wsuggest-attribute=format"
-#endif
+__diag_push();
+__diag_ignore(GCC, all, "-Wsuggest-attribute=format",
+	      "Not a valid __printf() conversion candidate.");
 static char *va_format(char *buf, char *end, struct va_format *va_fmt,
 		       struct printf_spec spec)
 {
@@ -1717,7 +1716,7 @@ static char *va_format(char *buf, char *end, struct va_format *va_fmt,
 
 	return buf;
 }
-#pragma GCC diagnostic pop
+__diag_pop();
 
 static noinline_for_stack
 char *uuid_string(char *buf, char *end, const u8 *addr,

-- 
2.49.0

