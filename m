Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDC51FF1B0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615777; cv=none; b=u2gy9tU6AZs1sNeBVMZbsf80Pxfox/Gg3gMMt91pg8MAMzCIRoNYKId1fpxyj7dzVVA1qlZ6FSlBxLT+41gfC4pPyzr0lLGg4VQTGdX+w08FJnpYNMgSKFLl71/dz5Apqi4wcUC+snFuXD7lNPefgX9ikQkujbTvbBcN4W2Hww0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615777; c=relaxed/simple;
	bh=KCHO3lLH7dI4RY8+BKa/OQC7CPvk4Z4wABHEVsW8A4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QNMomY9M/EFhORwE+JX65TzituFnRQBePSQLKYJONowoE0mwrjiYh7ulfQdD8ZhOcV6BMBtybZcDx+eBHBcqWv5dMlNNfTumeNREiW1Btg7/RfTMNyPAMSDNvhF/VyEJKbbRJkcTBMIleBdxkz4FXd3lDgbLYvb3VqG73ELZMf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gyPJo6pI; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gyPJo6pI"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-85b515e4521so908139f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615775; x=1744220575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ck+/k2kUl1gxvAy57O83XENj4jmXSLh8yxG6/aZ/GV4=;
        b=gyPJo6pIIDoiogYhQiGc0ImL3tcvtBayqtMuHLqZCdcFcjcTAOFoJOaq1fPTy1ySZZ
         aWc/cj6Gn7p3EDvGNz8MeSsse1+KCwkjNZr8BP5of8cNvduphbwrbL7iTDU/0m8deqe0
         UtD4h+7fLcrWAARF9JWWZS8NBmeutZWEtf0ZK7oyF+oxUAhAh6QRVQNU9oa9CBREOjg7
         yoDmRdwCVU77rfmx3UkkGtNKMF5MX3XUKmGNgl5tOH60UhCZ2QqM6qLxxzyb/PoixEYL
         CvordBiKHfCI//V+GuTyCDyIEpo/IQ+dfs8nybMX/XHgLg8oJw3eYdhoCleBbs8tV9US
         ArrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615775; x=1744220575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ck+/k2kUl1gxvAy57O83XENj4jmXSLh8yxG6/aZ/GV4=;
        b=TJ9nRLDirUac/T/f/PWvzbKEhJsA00E6KUYdsERkKcQ9fJwygnJ3rvhiRZfwVHddv/
         vhkg6DneAlCUjYFXtGXdPTFq5wxq/VMKpjY43fpLPGhkeRtjZHfSxv4Cf/FGiwenjRpg
         4pg7xS7WV+2vmqGNqw9wuz6WC+kyKlkpN+CTyS01I5cmQV2LmsgIajbvhsff7BXQdJjx
         jKSOWle8wHlaPp2vN2WfG5JbLDzhQXDtoi5N5yuNva2K2vXrGBXd6YTwQ18dBHftFm8O
         Jz/ZqxwUo5CMWsmZd3OUDF5j7bL8xZW8shRcb61QWJ3Ab+Lf/ZKK2kaYEOalcC6NyrI3
         e8Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWBbSQXdKjBeS1xEswjgnHzE/qDbfO2oNXIpBMN8yo1A86jlDdkiaXa4hiaWE+tdHUgzxrs1wRHfiCDip4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxe+fTM24jUCkuqz+PQ2igA+FzlOgJmtG3YF7Grv/cqF61nn+2
	dU4OHMNvJZqBkdWwK+JwC2E80GUHAif21ltE+bgcybpBF8+IQ7iC
X-Gm-Gg: ASbGncuzX+BzvNdjdgyLVKF4z+pD/fvnooOkHrjP4q2sUHkIcSP5YNGD+EdYU7CckMM
	gV84j2Ecx3UuNYwqg013ZwQj2uIb09J4p2qusasBELDs22Njyx+Uk75FhuC5PNI356eV6ZG1Itu
	gk+P/V6vQLqJKPW8JaFYAd0vcM0HA9PGCfS09xIyD26kbfDDv55qc/hpF32beh4P9kCRL4wR994
	8R+NhmHV0U/Jw7FE53sZiCt8Utb8b4w7BZM3BaCbHZ637VpfDsjilGpLkwvSmZm3wvmKUhOYV+v
	iqW7OGbYYHhL8W4Iz2jgjDUe13PRtuI2tbDJDQYpX1QikHlpZ9bjo8vZUSOaRYSgXqgHWlTuoYM
	akA==
X-Google-Smtp-Source: AGHT+IHOrTfoglNfhTLG8b2lwZ1DeIxr9/rPRHu/zfzN/2T0Ub79/SVMCDvXhpVtgwBAHBV2XSusPA==
X-Received: by 2002:a05:6e02:1a67:b0:3d0:21aa:a752 with SMTP id e9e14a558f8ab-3d5e08eaf0emr82506525ab.2.1743615775316;
        Wed, 02 Apr 2025 10:42:55 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:54 -0700 (PDT)
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
Subject: [PATCH v3 42/54] drm-dyndbg: add DRM_CLASSMAP_USE to bochs
Date: Wed,  2 Apr 2025 11:41:44 -0600
Message-ID: <20250402174156.1246171-43-jim.cromie@gmail.com>
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

tiny/bochs has 5 DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/tiny/bochs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 8706763af8fb..dbcc8ba70dfa 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -59,6 +59,8 @@ static int bochs_modeset = -1;
 static int defx = 1024;
 static int defy = 768;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 module_param_named(modeset, bochs_modeset, int, 0444);
 MODULE_PARM_DESC(modeset, "enable/disable kernel modesetting");
 
-- 
2.49.0

