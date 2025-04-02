Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3A81F4162
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615756; cv=none; b=jzYs0WOp9y5NDpBGRtZdHl4qJ3wuAu2yit9g1MRHO/ZoADPZ/KFe9QeChPKI0VMSS1Ew5pPd/q4QSLlhv2ZdfMPqKM1ZqFqNpQzN0LlUqC5ducMjU7nkxCYtD8yErFe4Kc3NjNUwv7Cnteq3JlpyftQ7gxLQTNKh+m5SuUtAwY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615756; c=relaxed/simple;
	bh=4x0AmnugP2XdYTP9rmlwEA8OspxOy380YjN5Bs+XZ+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GZEkB6FexpOdwfXoVHU1vGoCuLqWB10EMFcqdbaxlH1cVf4csTYxcgE19X/r9i/7C7E5ADnuQtdiq9YX9YCxcdrlL7GnPmlsCiOVbDbq3My45z85KTuOZcw5fkj0ssbUj/9/Ig2cOhkWhV5rWWWldldMMxyypQNZZlkkpEm0jyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPXG5sGP; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPXG5sGP"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-854a68f5a9cso2531639f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615754; x=1744220554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYc+j5mBJIrHD3rqV3hAaVU76cL8/yuTOYYx1NhhgTg=;
        b=gPXG5sGPyq8XawuujOn2Kg1HhezKPbAGtsxlpN/TqK1u4ryYv/rTYmaBGYq93N3eaC
         eaunXIB8vjYZSHusgvWT6JAMgXl7KfixlB/59xyK/pmxjGEseLD/N3ZH/n5nbejMdxKf
         WquFMpvdiXcqMvTX3w3EYT61OuLJHThc2fbColiIVnuS/SHhthT+4JGoOt7vjXFmm255
         /oKroKyl2kkxudsmVUJcsKjc+k+dJO5hSqlrCcMsNQqFIBUjToaXucCjBkVWI9S4XNjn
         EKzU0vBDlP6q9w1XO5q63VgVloHEcbnf5ET8CmLGxExCoeU5YuJpxiQDROAnrZIRSiJg
         qFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615754; x=1744220554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYc+j5mBJIrHD3rqV3hAaVU76cL8/yuTOYYx1NhhgTg=;
        b=o0tuIE3Vzy9/hmkLFnc+q4NF3q6nSXhQ7VkJhI0ThSXYMCSmXOcGkasmHmi3S6geWy
         5ThWs6fffm3qHJmAbRbA3JzkfGYwmM6/NlgvRXKOLE77pNcg5OaD+hz+dob0ZFRCgZeG
         Iuzjevbl+GLZAQBjdO3J+nVflupxzAY3gEaP6qfhZBs2cG7r02bFqY+Ue5GGVxeUAtLY
         VLK1O+rrc+CQKoon9HKErDiiIkcNxeOsIuLfYw4bAeAIkDIASgJSRgVoSLQ0YdZ50H50
         OsK3Mb81bNHk3dYzc6EQeiEyiR4BqiSWLBorKDW7wBRkNqojKQw1mjiI+e8e2QGARy/H
         5Dfw==
X-Forwarded-Encrypted: i=1; AJvYcCX0EUFlmfGvis/76y1o7TMnOtKEv9IhLqnEG6IXui/8Dlxba6Msx4LBd/y0rdDa0bOnX3d5syPDYPu9Xqw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywde3dh+FDa3c+ZwriVNdLWpFcXhi2rrzc5wVPKFbY10qryqxQ8
	RJBB4BXrSoBa38ThfSrB51YMFfz9YPRlVCgqyxsETuuZKEUU1F1O
X-Gm-Gg: ASbGnctLNnwJm/fK1qOhsoK5VcZleJr4s2re/rCXansjlmykFGlmc3j3uYt0qwme7mz
	o7kxBE03QuGZVEOtF5PwHnvSbJYgia9tDIo/MqKQltXmCtb/Is0DKHvQSwEeAcIFCe6CsrD5KLt
	TaCLWVlnZ6B+wNNa/Vcn4tGAF4yyRV9wqInnqETH6WM+Xh5TbUlzMYcP/3Wg8VT3CjgdVC4Bwdm
	7juUzhxMTOz/dQuMN53dgjIBug95esKxi09rHx28Pnzn7PSD6C+RNOegur1ekQEta53Kq0XoLLc
	9/KUVluVXy4ORSmMXNrCtsMjz1HxrIFupz+hfzlTWwnLZJf/sTyp+DKcji/A/Op7/ARjgm79XZg
	fPNWHnAek6mQZ
X-Google-Smtp-Source: AGHT+IEVAbHMnIO9dfNIpvtNs8ZLp2t2qagN4qTEja9BzZoYvl4a7Bc0A3a/xIEdjKgwP/E1I/zqhA==
X-Received: by 2002:a05:6e02:2606:b0:3d4:6e2f:b493 with SMTP id e9e14a558f8ab-3d6d54cde77mr38291795ab.11.1743615753974;
        Wed, 02 Apr 2025 10:42:33 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:33 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com,
	linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 20/54] dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args at compile-time
Date: Wed,  2 Apr 2025 11:41:22 -0600
Message-ID: <20250402174156.1246171-21-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add __DYNAMIC_DEBUG_CLASSMAP_CHECK to implement the following
arg-checks at compile-time:

	0 <= _base < 63
	class_names is not empty
	class_names[0] is a string
	(class_names.length + _base) < 63

These compile-time checks will prevent several misuses; 4 such
examples are added to test_dynamic_debug_submod.ko, and will fail
compilation if -DDD_MACRO_ARGCHECK is added to cflags.  This wouldn't
be a useful CONFIG_ item, since it breaks the build.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v3- $macro_name =~ s/DYNDBG/DYNAMIC_DEBUG/

prev-
- split static-asserts to __DYNDBG_CLASSMAP_CHECK
- move __DYNDBG_CLASSMAP_CHECK above kdoc for DYNDBG_CLASSMAP_DEFINE
  silences kernel-doc warnings
---
 include/linux/dynamic_debug.h |  9 +++++++++
 lib/test_dynamic_debug.c      | 11 +++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 9af825c84e70..4941ef2adb46 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -99,6 +99,14 @@ struct _ddebug_class_map {
 	enum ddebug_class_map_type map_type;
 };
 
+#define __DYNAMIC_DEBUG_CLASSMAP_CHECK(_clnames, _base)			\
+	static_assert(((_base) >= 0 && (_base) < _DPRINTK_CLASS_DFLT),	\
+		      "_base must be in 0..62");			\
+	static_assert(ARRAY_SIZE(_clnames) > 0,				\
+		      "classnames array size must be > 0");		\
+	static_assert((ARRAY_SIZE(_clnames) + (_base)) < _DPRINTK_CLASS_DFLT, \
+		      "_base + classnames.length exceeds range")
+
 /**
  * DYNAMIC_DEBUG_CLASSMAP_DEFINE - define debug classes used by a module.
  * @_var:   name of the classmap, exported for other modules coordinated use.
@@ -112,6 +120,7 @@ struct _ddebug_class_map {
  */
 #define DYNAMIC_DEBUG_CLASSMAP_DEFINE(_var, _mapty, _base, ...)		\
 	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
+	__DYNAMIC_DEBUG_CLASSMAP_CHECK(_var##_classnames, (_base));	\
 	extern struct _ddebug_class_map _var;				\
 	struct _ddebug_class_map __aligned(8) __used			\
 		__section("__dyndbg_class_maps") _var = {		\
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index e42916b08fd4..9f9e3fddd7e6 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -146,8 +146,19 @@ DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
 DYNAMIC_DEBUG_CLASSMAP_USE(map_disjoint_bits);
 DYNAMIC_DEBUG_CLASSMAP_USE(map_level_num);
 
+#if defined(DD_MACRO_ARGCHECK)
+/*
+ * Exersize compile-time arg-checks in DYNDBG_CLASSMAP_DEFINE.
+ * These will break compilation.
+ */
+DYNDBG_CLASSMAP_DEFINE(fail_base_neg, 0, -1, "NEGATIVE_BASE_ARG");
+DYNDBG_CLASSMAP_DEFINE(fail_base_big, 0, 100, "TOOBIG_BASE_ARG");
+DYNDBG_CLASSMAP_DEFINE(fail_str_type, 0, 0, 1 /* not a string */);
+DYNDBG_CLASSMAP_DEFINE(fail_emptyclass, 0, 0 /* ,empty */);
 #endif
 
+#endif /* TEST_DYNAMIC_DEBUG_SUBMOD */
+
 /* stand-in for all pr_debug etc */
 #define prdbg(SYM) __pr_debug_cls(SYM, #SYM " msg\n")
 
-- 
2.49.0

