Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB11202F67
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 13:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748266103; cv=none; b=o30ZfKreIBnbfQJPnTuEA9H9k7U853cZrV7+PNguh3EsjaNiGHrK0bcBCyB77aiyGYMcGCVYUeNZ9MSGqx2TYC1+xgSJdVdZ8oBxpa+QGvgyeSYE52B8b+jUnKyihup9BeFEJHms3CdRrpKoXPuJcJkBuQv09iueEQ+IS2yY+AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748266103; c=relaxed/simple;
	bh=+87yx7PFE+dmNd8ZWYDr1ls094OuOxH6ApcNFb2s70I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-type; b=mgO+zCsc/qSO5iourAWJjKxc2wW9+BXnE7SOgTMd0H/iIUlVV2fohPTO+ftpvD+qBjqAgnEF1lfCTryggj3wjZYAUlpaMAGoATk1m5ftz4kolOnNokYj+RBWHxw0NAH1wEMJ8/L3xhGQR+ZZXEjSuKug/O47nWHwqzDTpZRmI3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MGM2s/zs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MGM2s/zs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748266101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oPlt4ytZ6F2hvn0V4PkuFNl5i8ajyUihcCaYhF+iFpQ=;
	b=MGM2s/zsTevNq8B8sZZ3VvKz82NEU6wxR72R98BbGILdveJGHj/JDHLrtWgvmT5WKlX9fe
	0j6CycVonIilZSOlblfJ28TOUsfvvJviU0C7gMPMF300AtRN72EyPpGpBLl40zik2M4Lxl
	3fOqZySjlnLayf9GBLuBnOm4y1SP+24=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-pQQ1tvU0NpqjZFOWcvbg7g-1; Mon, 26 May 2025 09:28:20 -0400
X-MC-Unique: pQQ1tvU0NpqjZFOWcvbg7g-1
X-Mimecast-MFC-AGG-ID: pQQ1tvU0NpqjZFOWcvbg7g_1748266099
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a375938404so1493694f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 06:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748266099; x=1748870899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPlt4ytZ6F2hvn0V4PkuFNl5i8ajyUihcCaYhF+iFpQ=;
        b=QazP3E0hHrb/4rpM9Jr42iKjrjRqO6F8BjlWQ7MxdfQ0uGQG4an4+7PVc42M6KCOct
         c0jqB5Ig2MXilFkU2H6T4vlCSAyaJS5S+ogo/dOuHy8T5F434DIjVoBnHanGohQNi3GC
         dA6Gt7zMDVi4E1R/ICKvYmNgSnrCHgd1UiovpFoW5pc6Wj/5e3afYcyreKSs6ZxeFige
         xBecCSUdaSXuGMDSMyWC5ypewvlR9UJIqBr00Dodec2AF6/kWxh0KycdLfP5oelxgJZ2
         r5fQPkj/0qi/VO33Ny9CFVTeqepxIR1D2PmetJgD+xLPxMKY1MhKutODYrLVS2B33CsO
         z3tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbFx87HGe0+jE1HTLxM403nV7WiMRFOr9/NIRAhJZsogmJNHIwhZaw/4NLniGPgfyuMc7KIll2xNKZluU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfIZyUH/fJODGLORaJ628K8cigj8FLAWCNQza7FvsgG3O8T3iz
	JAyx7+ajATlQRfzyGV3L8yuufNViskbE7P7DzfOvZMJphE4G9Q1DJkWW34o/BHAtY0yfsJdrmb5
	Tv9dbldvOt4L83GJjR8ONtaxfjnBq7ewvjfJlsxvYxcf79t55mvwc2lMzzHxUFSarHw==
X-Gm-Gg: ASbGncvKXWtypgLXSaVDKF/F7EAPxkKTn0Ex1c3WhGL/CPoqF2RRI/h+d3ysOkJ/sLE
	UQtVxPeHSzeQow3rOinXvd50LTos0EUKp9N3eyclI3XCm1X6KWET4SETJJk4lbo2Lm3AY8GIIoI
	jhmVETzdVkBRsVJdtkV4buMOoBSlKqaxFSmz1iUfg4+mVe29VfbfblDT0yw4HYmIgL+Y99GHiO3
	wf0/bw2WK3d0qJTbxhLVB+wK+5nXJjJxKRQisSXfOfK3A2981qflh+/GqmSSR9vBTGEK+eJ8hl2
	BLbdA7OMGO4sT8uw
X-Received: by 2002:a05:6000:430c:b0:3a4:dd63:4aec with SMTP id ffacd0b85a97d-3a4dd634cfcmr1564326f8f.48.1748266098639;
        Mon, 26 May 2025 06:28:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfQ14aemGGVrnyyULM4fmrilLUTKS/3ULR87fBB6DJGO5nAXb+suetmJzZdWhNA46LzsMX5w==
X-Received: by 2002:a05:6000:430c:b0:3a4:dd63:4aec with SMTP id ffacd0b85a97d-3a4dd634cfcmr1564292f8f.48.1748266098242;
        Mon, 26 May 2025 06:28:18 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4c8455e7dsm8836663f8f.9.2025.05.26.06.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 06:28:17 -0700 (PDT)
From: Alessandro Carminati <acarmina@redhat.com>
To: linux-kselftest@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville Syrjala <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	dri-devel@lists.freedesktop.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v5 2/5] bug/kunit: Suppressing warning backtraces reduced impact on WARN*() sites
Date: Mon, 26 May 2025 13:27:52 +0000
Message-Id: <20250526132755.166150-3-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526132755.166150-1-acarmina@redhat.com>
References: <20250526132755.166150-1-acarmina@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

KUnit support is not consistently present across distributions, some
include it in their stock kernels, while others do not.
While both KUNIT and KUNIT_SUPPRESS_BACKTRACE can be considered debug
features, the fact that some distros ship with KUnit enabled means it's
important to minimize the runtime impact of this patch.
To that end, this patch introduces a counter for the number of
suppressed symbols and skips execution of __kunit_is_suppressed_warning()
entirely when no symbols are currently being suppressed.

Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 include/asm-generic/bug.h | 21 ++++++++++++++-------
 include/kunit/bug.h       |  1 +
 lib/kunit/bug.c           |  4 ++++
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/include/asm-generic/bug.h b/include/asm-generic/bug.h
index 3cc8cb100ccd..c5587820bd8c 100644
--- a/include/asm-generic/bug.h
+++ b/include/asm-generic/bug.h
@@ -62,7 +62,8 @@ struct bug_entry {
  */
 #ifndef HAVE_ARCH_BUG
 #define BUG() do { \
-	if (!KUNIT_IS_SUPPRESSED_WARNING(__func__)) {			\
+	if (suppressed_symbols_cnt &&					\
+	    !KUNIT_IS_SUPPRESSED_WARNING(__func__)) {			\
 		printk("BUG: failure at %s:%d/%s()!\n", __FILE__,	\
 			__LINE__, __func__);				\
 		barrier_before_unreachable();				\
@@ -99,7 +100,8 @@ extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
 #ifndef __WARN_FLAGS
 #define __WARN()		__WARN_printf(TAINT_WARN, NULL)
 #define __WARN_printf(taint, arg...) do {				\
-		if (!KUNIT_IS_SUPPRESSED_WARNING(__func__)) {		\
+		if (suppressed_symbols_cnt &&				\
+		    !KUNIT_IS_SUPPRESSED_WARNING(__func__)) {		\
 			instrumentation_begin();			\
 			warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);\
 			instrumentation_end();				\
@@ -108,7 +110,8 @@ extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
 #else
 #define __WARN()		__WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
 #define __WARN_printf(taint, arg...) do {				\
-		if (!KUNIT_IS_SUPPRESSED_WARNING(__func__)) {		\
+		if (suppressed_symbols_cnt &&				\
+		    !KUNIT_IS_SUPPRESSED_WARNING(__func__)) {		\
 			instrumentation_begin();			\
 			__warn_printk(arg);				\
 			__WARN_FLAGS(BUGFLAG_NO_CUT_HERE |		\
@@ -118,7 +121,8 @@ extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
 	} while (0)
 #define WARN_ON_ONCE(condition) ({				\
 	int __ret_warn_on = !!(condition);			\
-	if (unlikely(__ret_warn_on) && !KUNIT_IS_SUPPRESSED_WARNING(__func__))	\
+	if (unlikely(__ret_warn_on) && suppressed_symbols_cnt &&\
+	    !KUNIT_IS_SUPPRESSED_WARNING(__func__))		\
 		__WARN_FLAGS(BUGFLAG_ONCE |			\
 			     BUGFLAG_TAINT(TAINT_WARN));	\
 	unlikely(__ret_warn_on);				\
@@ -130,7 +134,8 @@ extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
 #ifndef WARN_ON
 #define WARN_ON(condition) ({						\
 	int __ret_warn_on = !!(condition);				\
-	if (unlikely(__ret_warn_on) && !KUNIT_IS_SUPPRESSED_WARNING(__func__))	\
+	if (unlikely(__ret_warn_on) && suppressed_symbols_cnt &&	\
+	    !KUNIT_IS_SUPPRESSED_WARNING(__func__))			\
 		__WARN();						\
 	unlikely(__ret_warn_on);					\
 })
@@ -147,7 +152,8 @@ extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
 
 #define WARN_TAINT(condition, taint, format...) ({			\
 	int __ret_warn_on = !!(condition);				\
-	if (unlikely(__ret_warn_on) && !KUNIT_IS_SUPPRESSED_WARNING(__func__))	\
+	if (unlikely(__ret_warn_on) && suppressed_symbols_cnt &&	\
+	    !KUNIT_IS_SUPPRESSED_WARNING(__func__))			\
 		__WARN_printf(taint, format);				\
 	unlikely(__ret_warn_on);					\
 })
@@ -166,7 +172,8 @@ extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
 #else /* !CONFIG_BUG */
 #ifndef HAVE_ARCH_BUG
 #define BUG() do {		\
-	if (!KUNIT_IS_SUPPRESSED_WARNING(__func__)) {			\
+	if (suppressed_symbols_cnt &&					\
+	    !KUNIT_IS_SUPPRESSED_WARNING(__func__)) {			\
 		do {} while (1);					\
 		unreachable();						\
 	}								\
diff --git a/include/kunit/bug.h b/include/kunit/bug.h
index 9a4eff2897e9..3256e3f2c165 100644
--- a/include/kunit/bug.h
+++ b/include/kunit/bug.h
@@ -23,6 +23,7 @@ struct __suppressed_warning {
 	const char *function;
 	int counter;
 };
+extern int suppressed_symbols_cnt;
 
 void __kunit_start_suppress_warning(struct __suppressed_warning *warning);
 void __kunit_end_suppress_warning(struct __suppressed_warning *warning);
diff --git a/lib/kunit/bug.c b/lib/kunit/bug.c
index 4da9ae478f25..5beaee1049eb 100644
--- a/lib/kunit/bug.c
+++ b/lib/kunit/bug.c
@@ -11,15 +11,19 @@
 #include <linux/list.h>
 
 static LIST_HEAD(suppressed_warnings);
+int suppressed_symbols_cnt = 0;
+EXPORT_SYMBOL_GPL(suppressed_symbols_cnt);
 
 void __kunit_start_suppress_warning(struct __suppressed_warning *warning)
 {
+	suppressed_symbols_cnt++;
 	list_add(&warning->node, &suppressed_warnings);
 }
 EXPORT_SYMBOL_GPL(__kunit_start_suppress_warning);
 
 void __kunit_end_suppress_warning(struct __suppressed_warning *warning)
 {
+	suppressed_symbols_cnt--;
 	list_del(&warning->node);
 }
 EXPORT_SYMBOL_GPL(__kunit_end_suppress_warning);
-- 
2.34.1

