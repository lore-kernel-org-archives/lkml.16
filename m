Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF361F560B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615762; cv=none; b=uqzjcPTtdfo6e+RVMiTjdjh46o56JNmmypYzI6lyLWKQEAzSEpWHAdzmOoqV0WN8IzuioE10vn8EbmXeI9o3/i2af4mdV+F+XykCWCD6GC5l8ahXJzgSbwDOnVNn0t8v8Odxxf56wgZ+8b73R0mlYyV2L+Ly9V6qh8cxxmRKmX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615762; c=relaxed/simple;
	bh=sQ4kybNcwJB+GUc/K15VQFyoC6KPj1ixL6Y1o7WcqE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bs+JKbgVuhAUYmw2w5GxgBuLFSenAmGPl0EDs0ysrd1p1geE9AeS025ymGHtmxCgM5qBxN8SJP9ZtDZqdA+3PBFRpIfTfj8LfrY1Vj7W+LloZCthHVCmPQcDVgKo9zvA9UVxm+KpGKPqf43NUF5Wvt1B6hBY+Lrzk8lNqyWbLOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PF49KO6K; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PF49KO6K"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d5eb149914so755915ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615760; x=1744220560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/waPSOuN2eIL+7EriTAVG2KiDua5Tq+VfuPCwO/f/0I=;
        b=PF49KO6KxPibLyufRWxNUVmskRvlcSsUXF6y3QPjXZ42/+DSJz1TG2Ge0T7QWjacCB
         P2hRm3EYUvGCIzr6imV0mDFymy7woFwNoNzZXmy7l8qgsij3bVy4X4vxwsk+OXvFQNrf
         7Iq5J/F5tk8NRwB+Q2j0+d9oX3ZMEFWKcgWaynkAJl8Z2xLK1WF5hJZ5X7XZzOSCTwUS
         XbzJ5rs6uf9XKBht4H4zriXf6KKwP5uON4XCpWQQkGu2M9cV4Ovk/iRDHnxygYCijUcC
         wgjnwxu+HuU1fOADuBIEFAIQ0aATApUDoUBtKmK1zTcbya1in27seLFqIPqSK2ShWmN+
         ku1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615760; x=1744220560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/waPSOuN2eIL+7EriTAVG2KiDua5Tq+VfuPCwO/f/0I=;
        b=lciiOclJ05M47yx0j3/kSxBI94vOTvMWE2FusCqB+eTQGRhEhaTx3Mc7MOL/cbBscH
         SF2WsLkFs9vPUQHucMS5YDr9lyovGkvnam/sPkPt/i6HFBw0YmVqg16kFJOBfdbzvPsF
         5gW1u/1DkeZzLog1dNNu8wwg3l5w3eQLpbNj3j4dUspkjZBjyiffRH/gTKpz0WEgDHK+
         0zTq7uj8J+nOcibFbY21iSJ9dWN8OIWwZryM4vAYxN+uz3aIH/9wyQ7pG/RjdvBNpy9B
         9CBzvNUMUxBhSli3OI1cxfJuUowxTmpMf9HabhFmM5VZk1dDA1MXfekGzOvC1sJUDdUW
         ai2w==
X-Forwarded-Encrypted: i=1; AJvYcCXGxzsRx7oCSXRRzwwWUpZg9zkVyN19WCfoIEvhqkKaHjvf9dL7dU38LWGoO+SyY67yMKjdYApslj0E1g8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnwCZU/3nKuMwNLr4Zdu8JZ6xzTrrHqI3zSmx/c5ceGalwLQBi
	dofmr41t/6SiyPfAtyHQd2RqZ4cFpGnX5+kUEslxYYJbXfN9Unjh
X-Gm-Gg: ASbGnctYhJ0QUsxFGXLchQIns7FkUUAn5ss5k0fvnszUjCScXvus9T/t/aQIhnmfijU
	Rpr8in5DeAzojacac9J7l5UzYH2QZTh+GEgftcTfcra5zGORu++d1rowy0Q2c0qzWuf1bPVsZEE
	/hUoPHdPKCZwAwUrAjdrqfw5MkYolf9gEi+6mZxiztAlpiPTXsjfNJa8BJfGkaWU+EksvVcfz92
	2gX/CORM+FCw/BHKDYnOt5BwXQqrXZmcqiOtJeviwvDxTuLl34wTxt1lm4BZyA0BTt41MVdKImE
	WOo9dObIgbf4zQYs+oH7lVqzh+902u+NtHfzzaXv/uv9PPCaBZpqhn+xg6WbfDewaO7bEwoCJJz
	7bf0Fw1jqIM2y
X-Google-Smtp-Source: AGHT+IG19in7YD9+mh+jCwJ3JHA6ycW6ni6Gib0Ldr3L9sgEpAkmq214gUIhXmK9w5BqErQZ9ZspIw==
X-Received: by 2002:a05:6e02:2587:b0:3d4:337f:121b with SMTP id e9e14a558f8ab-3d6d54a305amr33630345ab.8.1743615759986;
        Wed, 02 Apr 2025 10:42:39 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:39 -0700 (PDT)
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
Subject: [PATCH v3 26/54] dyndbg: change __dynamic_func_call_cls* macros into expressions
Date: Wed,  2 Apr 2025 11:41:28 -0600
Message-ID: <20250402174156.1246171-27-jim.cromie@gmail.com>
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

The Xe driver's XE_IOCTL_DBG macro calls drm_dbg() from inside an if
(expression).  This breaks when CONFIG_DRM_USE_DYNAMIC_DEBUG=y because
the invoked macro has a do-while-0 wrapper.

   if (cond && (drm_dbg("expr-form"),1)) {
      ... do some more stuff
   }

Fix for this usage by changing __dynamic_func_call_cls{,_no_desc}
macros into expressions, by replacing the do-while-0s with a ({ })
wrapper.  In the common usage, the trailing ';' converts the
expression into a statement.

   drm_dbg("statement form");

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
---
 include/linux/dynamic_debug.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index ce221a702f84..2d87cca27544 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -337,20 +337,20 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
  * (|_cls):	adds in _DPRINT_CLASS_DFLT as needed
  * (|_no_desc):	former gets callsite descriptor as 1st arg (for prdbgs)
  */
-#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {	\
-	DEFINE_DYNAMIC_DEBUG_METADATA_CLS((id), cls, fmt);	\
+#define __dynamic_func_call_cls(id, cls, fmt, func, ...) ({	\
+	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);	\
 	if (DYNAMIC_DEBUG_BRANCH(id))				\
-		func(&id, ##__VA_ARGS__);			\
-} while (0)
+		func(&(id), ##__VA_ARGS__);			\
+})
 #define __dynamic_func_call(id, fmt, func, ...)				\
 	__dynamic_func_call_cls(id, _DPRINTK_CLASS_DFLT, fmt,		\
 				func, ##__VA_ARGS__)
 
-#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);		\
 	if (DYNAMIC_DEBUG_BRANCH(id))					\
 		func(__VA_ARGS__);					\
-} while (0)
+})
 #define __dynamic_func_call_no_desc(id, fmt, func, ...)			\
 	__dynamic_func_call_cls_no_desc(id, _DPRINTK_CLASS_DFLT,	\
 					fmt, func, ##__VA_ARGS__)
-- 
2.49.0

