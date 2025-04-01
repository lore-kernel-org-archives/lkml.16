Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060A2203716
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517081; cv=none; b=JMNpZB7o1xo+OnNj/nils77bHHCnSThiYEUIPlapY67qKqKQOT1AM0uXVa7H5ri/+6e8vQPorXN7kxV2jNJqE76UNE7eN96kA9AeiqUNt7YXaSyQEnpuLGVGz0wUxYIqZEK4yqBJ66hm61Ilky7Tv/k828YtZ3jOK29Gd7QQNsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517081; c=relaxed/simple;
	bh=JPDmnKUMglz+XsRlG2V69K0PwK6vqRugnwv8vO6nGUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g0sl1lEiTm3BOHkovPhqF1ylH/UFCT6knqOwRl7dlYSCRqGk7CuNFCamVr4KPkF85Ccz30VCUqiAE3HAd6HV14UkKR5qOFrFvstq9LNCtI1TeQe9WS0jYE5fKX4jzVn8D8/DgXo+4iWcrWOJLGWzrQ3S1By12iVcOf+NgCA67gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GsDBJWo4; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GsDBJWo4"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso6868984e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 07:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743517078; x=1744121878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=It3zznYp54Cp1R2/qjZYQRWQWBFmdplnsGjJ5JvUQS8=;
        b=GsDBJWo4jl5luPbc6WnSbtNJmpdZggAoecUqPlXA8psNkJTktPgq8FuhCmacOuTyBC
         3yRpwYc+41o0MgjRfbYVt794JTIj9St1T1Fk0h+xVMYHtzw4xI1sklWqvBxnyPq+uZng
         aDagdRSc+xUs/gqBW9zj7q1Vd2EFmvVnBB1is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517078; x=1744121878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=It3zznYp54Cp1R2/qjZYQRWQWBFmdplnsGjJ5JvUQS8=;
        b=wItXR5mviimuRU+50guypVUUuhkW9K5wCXoSEml0FvZTMvZbp74S8JD9N6dKcRBfg4
         asotZD3SE5VUzx3GP3Bm/IdQSm2ORnuG2MWM28oIdSGCsi5Wt6TEHQHWE5XMapn9t1XU
         k7cwNAEkc6euvNwenaW1wh05ROS3HAMAVmxsw/u/qjLIky+zy7D0gBtf0pYcMJUej4Rd
         jZqGT5TF72GUtV9rHSmFF/c+yAGlgyiP20PoED23o0gUYlREcpJP2fr0AqjJnkRqaFyB
         HHdEbh3uFGn14GX0yL1UPWgey2uW7w8gZJpYh59fKo3itM9muKvsBqHFF0RPANhxU0Td
         iHxA==
X-Forwarded-Encrypted: i=1; AJvYcCXLE1gzxGusEgDcNxkasW0UBX4jdX1VRRk5+cC9bjgDMY2qiKrc4aRl6aTLNMNGK5kfSkrZuxWXQUjjD5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYr4Xi6QhQRh5/Z6gwOd+3IM/P3/ADOIDAl/zR2n2fiJL69HpF
	d9a0NBQX69zCJrtPo+OsoNOIJQ6mQazhF5UjqGh2IoauvNzaU2zqNqhKSjAlaA==
X-Gm-Gg: ASbGncs+yBEjhoQNxTixrTi30o9FdeefogSDyyLDOeUCviRNMnOXGaWlCJVZ29MPJsO
	0dQ4zsUynmp6h85gptz4L14lUhlf38a/X8SbaF80XrwVgK+9VCupxbjp4lcDaDqnT+xa4I9LWhJ
	l2RReNWJjOMdOZKTU5hdV/l/iSYQtuoBOXyKhUAEYRCANwQ/FfuWrmEGr46vsPa5MLoPgfFubFh
	s7nCivJ6p2VLrLTTQCnsdn7byXHrCDWH01fD56CUyzIYcsT/SuQ0LLqcSwQmdd2coZUs/ERj6yx
	iH2eiHFz/1A4y7/ZwTTG5b/yUxzyIwadYbUiFhuTA8q99IGnWeyzBUcurmnqWskjkHDgDf+XfZI
	dkq6UEWflt6nnvaEI9/9MHNb9
X-Google-Smtp-Source: AGHT+IFdyRka7MweflyBv5DeiJjMiC9PFaRXPwmxIKfE2/7XtM+eY+SzHCu4lHsET0WaqtAqx0xBlg==
X-Received: by 2002:a05:6512:3090:b0:545:2ab1:3de with SMTP id 2adb3069b0e04-54b10dc7b75mr3430994e87.13.1743517078196;
        Tue, 01 Apr 2025 07:17:58 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c19a3sm1377789e87.80.2025.04.01.07.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:17:57 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 01 Apr 2025 14:17:54 +0000
Subject: [PATCH v2 1/2] media: atomisp: Fix Wformat-truncation warning
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-v614-v2-1-53024c4fcdc7@chromium.org>
References: <20250401-v614-v2-0-53024c4fcdc7@chromium.org>
In-Reply-To: <20250401-v614-v2-0-53024c4fcdc7@chromium.org>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Gcc8 is convinced that we do not have enough space in dot_id_input_bin.
Extend the variable 17 bytes which is just used for debugging.

drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1336:9: warning: '(pipe' directive output may be truncated writing 5 bytes into a region of size between 1 and 74 [-Wformat-truncation=]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 9818771a35e550c0ce98da826caff5f834867e7c..84220359c9576b0021ea7ac7ba13548bd77e49fd 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -121,7 +121,8 @@ static const char *const pipe_id_to_str[] = {
 	/* [IA_CSS_PIPE_ID_YUVPP]     =*/ "yuvpp",
 };
 
-static char dot_id_input_bin[SH_CSS_MAX_BINARY_NAME + 10];
+/* 27 is combined length of _stage%d(pipe%d)\0. */
+static char dot_id_input_bin[SH_CSS_MAX_BINARY_NAME + 27];
 static char ring_buffer[200];
 
 void ia_css_debug_dtrace(unsigned int level, const char *fmt, ...)

-- 
2.49.0.472.ge94155a9ec-goog

