Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B271C5F07
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615733; cv=none; b=UNJmnKVBw3E19/N0q6hAwManWJetcRRU974XHeayC3IkSUtEV5LJ/eSUL8H3pLVYeESK9xpbehPDm1mxKc6EjCSLcA7E4sC3w7rlR+QM2Mlmh+lfbA62EURcHPqwXlanJhHivRlue10aUfyxOj8CzewAyYuyObQLjkL6oK4oqzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615733; c=relaxed/simple;
	bh=4AJQ9/fTZnBfTNmr54vZ5hCXDEoIiB04E+EP8sWh27c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lEm6rZMgs1QlKSu3pQSwxbA7Tl9Gk9QfIzxYZoqcMtZ4ZKLeawgFoYZ/Qs5zYQ2ZZvFoPGGtnfGLA69pXc3419k1eNi0r0NksExym3KaqvEdu2g3TGitS4H0egJ1ri0gabrSHDK46nNTBq1PauhLm4zjLn89b9z3+EVFkHbhVew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VmHcxBcr; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VmHcxBcr"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-854a68f5a9cso2501639f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615730; x=1744220530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcpeXIgBKTB5NFbofa9/asJwSsA0oVZhqq9QNH8OPg4=;
        b=VmHcxBcr2hZ01NnTR9xBZIntoO3yIRGKdmyRXhAMjUpxTOTlMC1Q0SaCYwE/ulz4aq
         IEsIbctePD1/UUxjqpFsEAZhvaJYyQYJiDg39V4/kVUnESvv1VSL202iYbt6xAKXQtlL
         KrgiluG7sRFGY2cABh6LKiZloecwiNtOSPRYc/D3sEwvjVB4arWhKSh7R6vBrRE8EqZU
         suegwG9z/Z9dJ7+VNGkeK3ie4p3pyq9931Ys7coBHbAKWPUcOwr6Pb3EgC7YOMZ3sWXN
         5EYA8ncLUuLG3Utyc3Q3wb5bxTXlX53Nyedjqslt9EIH/lheF8F5q6MguSHSOCcZrDhp
         6KZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615730; x=1744220530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GcpeXIgBKTB5NFbofa9/asJwSsA0oVZhqq9QNH8OPg4=;
        b=E0KlpH8uqyZA0Y2SA2x8KGmDhJE2FQ7wNuhsaMDJjrJqZXIlyeeiVjvMbxxq3Ky18q
         CBRjLpf7/n+D4vrzMKBWaYE5eHDAa3/ckBXgBgxAi6JFhlwJAKIWETopXLovxbeMSZj5
         /RGCwAGPP5Fl0FMICqdxNhqPPYGYwL13bcfMs0v0iZB1D8iHaMVx37nplG1MKZCcQXL6
         MQxKa5psF3ASmTsgPpUSi5i0ryZLu1zYQT0cAWeX7x8xRtzYS8Ubh7JU9fudcJMTpPZ+
         EmWlxeZlssiOvTuEVQSl95EfxOuifCkNyVxenQYEgxtMH+Tv9cE6n3WfRtkGvmgMAOls
         yrxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3TnaqVrnsX3Rnd8lxTLEhzJyiKcwEYoiodzx7etu+vOkeJQB/qogwtZGjYBx5Nrl3LIjFThqYt+V5VAo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj32wiiko4bpq6dwbz6njoZepxYd6nyeAYBWZZLDPRsk6grQ0x
	Pn5bujBqRnmurwb3R4UvHe8kVI2ASSK1TytWL0szvjmokvLtODI7
X-Gm-Gg: ASbGncuTW6mszbYfowo2qrwuAOKOvd4AfSwhh2cx05ZPTawv382oDI4ajR+ICmhJnYx
	pdZ8wnvHlV1zwxSH+EwT/iLQmXK7g18vJTWjtRsxq5UNpakulVP+CNHocdog+qYY04bkE5oBnEC
	bOogKKvx9I33qexvkq+7y+br9CSbRlDAfjikt1XISWPCh0Dfg8m1gpCMTteOxbVBiMxobzrMlHR
	u70/xggTryCe58BFG1pe+Lh6o9S14pOcUtf34jjeH423Kt+dLP5sOvH42Zrl4bh4PJSHgTYuu6y
	Oz0+CasFd6g7gPXzpQpfXlgHC+AThzlkMnDq6H60AMRQLTgSgK2fAEbWYCP3Yywn96Y8ZZrleiD
	BFw==
X-Google-Smtp-Source: AGHT+IG7YC+Vg8rHRD/pZ45k6AmgmMsM50hI2xsY+GPn38wgc2sLRnIWJcTpkNONdPZL6YQH7t5jCQ==
X-Received: by 2002:a05:6e02:3006:b0:3d0:4c9c:965f with SMTP id e9e14a558f8ab-3d6d55761b0mr45283835ab.20.1743615730610;
        Wed, 02 Apr 2025 10:42:10 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:10 -0700 (PDT)
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
Subject: [PATCH v3 01/54] vmlinux.lds.h: fixup HEADERED_SECTION{,_BY} macros
Date: Wed,  2 Apr 2025 11:41:03 -0600
Message-ID: <20250402174156.1246171-2-jim.cromie@gmail.com>
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

commit 1d926e259d8f ("vmlinux.lds.h: add HEADERED_SECTION_* macros")

I flubbed the defn of the outer 2 macros; they missed the extra arg
needed: _front/_hdr.  Fix it now, before anyone notices.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/asm-generic/vmlinux.lds.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 0d5b186abee8..c9c66089ea2f 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -219,10 +219,11 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
 	KEEP(*(.gnu.linkonce.##_sec_))					\
 	BOUNDED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_)
 
-#define HEADERED_SECTION_BY(_sec_, _label_)				\
-	HEADERED_SECTION_PRE_LABEL(_sec_, _label_, __start, __stop)
+#define HEADERED_SECTION_BY(_sec_, _label_, _front)			\
+	HEADERED_SECTION_PRE_LABEL(_sec_, _label_, __start, __stop, _front)
 
-#define HEADERED_SECTION(_sec)	 HEADERED_SECTION_BY(_sec, _sec)
+#define HEADERED_SECTION(_sec, _front) \
+	HEADERED_SECTION_BY(_sec, _sec, _front)
 
 #ifdef CONFIG_TRACE_BRANCH_PROFILING
 #define LIKELY_PROFILE()						\
-- 
2.49.0

