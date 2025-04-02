Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0237B1F418E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615758; cv=none; b=SBWDp4iCvdJ/qVCqetevBcSxgObFEeV8J1aOFdQ6Z8wNfecgxj/jkvj8xmV/iTAqXNkY+SutRUHBz1axp2rg7HbztxTbzAHn/lnzt3J3lCPkrif2xWvUEdzcgxwIOcXtNfzsMPsn77yqqaAYQDFTXfwjCRhHxIfrw4t4P4Q4Z9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615758; c=relaxed/simple;
	bh=qFRH4iZ1oCB5ctC6Y8JGf9ZepD1vxhdEIeSFsngeOBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ipKQW4uo18D2Pa2XILEW1bSVrEkmGHbKvwLFz8W2HZEWMRaAp43Z9bHhCob0yISxcXnqboCMpwhouHHldktqvq7c9CmqI/bJpBa4p9Cmz3nPH5HDEbixvGAN9LVsqsdyG9ejfsUt9l321FOPCo4dCHe8Lk+B68AKBGPPg2hiM8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VG60RjIY; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VG60RjIY"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3d43c972616so331105ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615755; x=1744220555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9crVnbk3XjpJrHsY0dIqQRNI8E7oyjJ17chOf0dhmBE=;
        b=VG60RjIYSKsVOqEYmy1lx9w52jdd9FtKlAb4YaH2zE5Ywp76NzyZWvV890OMfASTa2
         AqCpUicU+yfgkLQnT27a6IVk42JpAGg4HWICLVLbCOsyYEKhEA2sR/nwJBKjaZVIV27c
         S3rkrTyxjAk4tNlywEIw43L5gh38gGEiZYTMBUm/czmaQCXFhUFVnRZStKQ1JbKFZUja
         i4kWQ8YQKQkw/yHEz1w76nxSFDSe2qxUBjvudAEQQm/AG1Z3OELMyN84VhE4ylwJaOD5
         i8MxrtQrFx3fB5ZRXYc1q7wZBF+3M7i0a3tMRzPZm2xir13zvsbuAwrMJKv5r9e4ufqk
         zGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615755; x=1744220555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9crVnbk3XjpJrHsY0dIqQRNI8E7oyjJ17chOf0dhmBE=;
        b=QT+iwesMNDIc5k1Rh4t1pQbEgvDCvWFjb0mQ/wJujTFilUTsq8tw3+EoRaEehpYqRZ
         Q7aWQPH7H55/+fCMar6vuRazx6dCnpx8jDqrLChoX0oXcbwIKHDsmvGm9ct63u8+t62q
         Mm6719N/nk0ExAlJ/DlMVmDt4y2zWEvpwuMnX/9YzOlo5TN09IrdMwXhMfVDXbQXnhxs
         eh4QsXiyLtUNv98P/C2h2Q8bhYeru0vwfUAvbdG4RXgMrwPqmy3UMpzwsPqmOdoAspwe
         gqHMyPiFAzbn5ocHK3o6n/4v3/cTb/pBd4B5nI8SpvyVF13xgHlKX6kezy4XS0mp8dLv
         n29Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxt4ceTBtAKRquFh2Z8QYlT30ZZveLixEjJXQoXqiHk0f38Z0k6/ElHfaFEpyo1QLEmzM1CE0ZpuCg4xU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhNK5tGt1FGXnQXM+L+g2zDJTecb8pbwxu7t1ZmN/nakXwu2Zf
	4AT1hspd013vSYUrDYksQXoO7H4HDWcjc8BcO73IjdfLOlDZUcn3
X-Gm-Gg: ASbGncvoPYc5KOvv5+gXFUIACj01f7XROYwji+mwzpVpZBW0+2IwVMwwTRQuubsYJCv
	/RFrYLbLNok2bampPw3QuZqic0orlnESaifBv/43NrN2M9xZGtCA/BNrXV0YGSqohWzyrJotS2f
	efuChrzwJ9xHCiJRygKawJbfeUh4tLBrrogx/3M9G4OkZIHBvwT1Vm8KlPNIr2HthdVAfs7rNRa
	w8izZPDLvgatLAybEB/i/udHazomp0JluiCOX7K6KctccBFaS9mx6ZejzO/E3qKjUr68LXfim0E
	SqmpMk5mDZOFjk9JdBtEYKGsWogK8Xjeefg2r8tnpzsaIFZzQKYA/qT04OcP0W83y04HXJ4GG1H
	zcw==
X-Google-Smtp-Source: AGHT+IExGVMuJtN5hKLJ003ECDmgVw47CrV9YfzVs9KN7730OBh4HexWxFYIN3TSQJH5oTzEZWr1LA==
X-Received: by 2002:a05:6e02:4406:10b0:3d3:de5f:af25 with SMTP id e9e14a558f8ab-3d6dca86dfemr5222605ab.0.1743615755159;
        Wed, 02 Apr 2025 10:42:35 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:34 -0700 (PDT)
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
Subject: [PATCH v3 21/54] dyndbg-test: change do_prints testpoint to accept a loopct
Date: Wed,  2 Apr 2025 11:41:23 -0600
Message-ID: <20250402174156.1246171-22-jim.cromie@gmail.com>
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

echo 1000 > /sys/module/test_dynamic_debug/parameters/do_prints

This allows its use as a scriptable load generator, to generate
dynamic-prefix-emits for flag combinations vs undecorated messages.
This will make it easy to assess the cost of the prefixing.

Reading the ./do_prints node also prints messages (once) to the-log.

NB: the count is clamped to 10000, chosen to be notice able, but not
annoying, and not enough to accidentally flood the logs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 9f9e3fddd7e6..4a3d2612ef60 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -29,18 +29,30 @@
 
 #include <linux/module.h>
 
-/* re-gen output by reading or writing sysfs node: do_prints */
-
-static void do_prints(void); /* device under test */
+/* re-trigger debug output by reading or writing sysfs node: do_prints */
+#define PRINT_CLAMP 10000
+static void do_prints(unsigned int); /* device under test */
 static int param_set_do_prints(const char *instr, const struct kernel_param *kp)
 {
-	do_prints();
+	int rc;
+	unsigned int ct;
+
+	rc = kstrtouint(instr, 0, &ct);
+	if (rc) {
+		pr_err("expecting numeric input, using 1 instead\n");
+		ct = 1;
+	}
+	if (ct > PRINT_CLAMP) {
+		ct = PRINT_CLAMP;
+		pr_info("clamping print-count to %d\n", ct);
+	}
+	do_prints(ct);
 	return 0;
 }
 static int param_get_do_prints(char *buffer, const struct kernel_param *kp)
 {
-	do_prints();
-	return scnprintf(buffer, PAGE_SIZE, "did do_prints\n");
+	do_prints(1);
+	return scnprintf(buffer, PAGE_SIZE, "did 1 do_prints\n");
 }
 static const struct kernel_param_ops param_ops_do_prints = {
 	.set = param_set_do_prints,
@@ -191,17 +203,20 @@ static void do_levels(void)
 	prdbg(V7);
 }
 
-static void do_prints(void)
+static void do_prints(unsigned int ct)
 {
-	pr_debug("do_prints:\n");
-	do_cats();
-	do_levels();
+	/* maybe clamp this */
+	pr_debug("do-prints %d times:\n", ct);
+	for (; ct; ct--) {
+		do_cats();
+		do_levels();
+	}
 }
 
 static int __init test_dynamic_debug_init(void)
 {
 	pr_debug("init start\n");
-	do_prints();
+	do_prints(1);
 	pr_debug("init done\n");
 	return 0;
 }
-- 
2.49.0

