Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7172147FE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743439128; cv=none; b=OBsnGcK60wlpb4D/L0PdTOQ1Drgj6ijxgV22YjXkcFTNzObWL/JGe1UxqIFPihkvrocs75mXxUYf08Butv8Vh7kLDnHnw0lepgkBAle+oQma8R2NUHvwCU4KHamZrk1EFPx/voLj6xoeGs8mjUV0hFRVF3qdKxsPAu0agkOza3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743439128; c=relaxed/simple;
	bh=yUQjN5KrxuKptMOriL54MdCLqGINX17eabOmAVDJrrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HWL1joAruX4ZHRLBQlqU7sA7FtLpQk2tB1kZ0WF+BV6OBnKIlAqxd0TUfoxZNPY5CjZNIK8JSFntD2Zi2bhetgIH7PA5EOiYt3PRxZLsBdyzLP2pd0mayo6UvUnU2xZk8sXUoSFU4yHFM940hfWbug7Tnzj1X953Uhx5atXHYII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aUaH3Enj; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aUaH3Enj"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54af20849bbso3144207e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743439125; x=1744043925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIVGQ0u30Cds/QcwRGX6gsTWFhIPKgE+VrlFy9b//yw=;
        b=aUaH3Enjdl0kwVuv4ZMoqjza8y+bIztUs7Cv4ocP+GP+Ds4sZ3vqjr1AYRr0mm2rAO
         Gm8dpevidwfIJpagEdMJXcaaR+63oWe3hXg4cX3cnKdkTIbu6kD0j0mFQ2mL1opkmTon
         a1HLxSU2ZQZHcbE8wuZdqS+e49XcnI9oSppQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743439125; x=1744043925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIVGQ0u30Cds/QcwRGX6gsTWFhIPKgE+VrlFy9b//yw=;
        b=qaVHO+TFnvdjT9tgIIP5bxAxs+G0DAnfFUW67UT/P1+W+n39fVepwUpczB7fNe5VWX
         Cdw7HnKZ81LAKjoNC5KH8XWuHswLNl9e8KACRpr4FpDdcSt+2K7Vh7itbkqXlqFCSdWP
         Fi5GaB21cLWl4mU1G53VzlIbX9BkXfZpdhHVd6svwP2LAxReEZ4qDF6rAe+uQtylTJxo
         SLEzFlFu/Os9ahbYZlvtbixjWHZXOzr0lHlsWUdVDC2a+DcAPNeUMxDtzqQjqN27t4Oe
         Me567ihp9HbVPP/ydBHNto4GVK/ehYxOfXv795GouPB0YzcmK7PQeUHfIUAlwpde8vQd
         IDtw==
X-Forwarded-Encrypted: i=1; AJvYcCU4ZekKz4n0opJV+j6oxUtPpofT04C/47UkauxNWEOwflf7cDf6JJyljloA++3pOPCsvRZUe5eL/973IeM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK0ELxgf3E5jeNgknogm1SyDJ5xr9mnLoOmshIq+4Z1kTaKIBt
	LiL0pHGuEdcIyGO5Lust5jUN0JEilgznJgpPiyqY2HZavqEx0PE2oJO/qp/LaQ==
X-Gm-Gg: ASbGncsQnbOegs0fiVXjwIwWCQEBJbNPrDtN6/HuhmiR36E2a+3cu0GEscPISfPcY4l
	GCue38ciA2MhRRage9rcQKVid2oBH7UiINvxwfU3H/zFvfonm9Wt3GawlagyUjfkYpPWzhrI1Gb
	9UfjzbJHlom69uQxpATSAM7lplFpkLc9ES5bGmGhpbQV8nBfbkdJ3zfeQDtC7Sa5am41ME0MtfG
	bVdnhlrjsTflJzv01YxN64ONq1lWAwFWx3NlXQcm7JuphtxBeRNSkuOobboYEb7j7pYlyaTvjLj
	4mJcgWEWAs3kOMPKjHxhO5UMgQGe7D6/wU1RP0s+PdEeIYOEjeuO06FgXQlmryghzSrFFs9ov1X
	VHxgrEWHdDNTZk2NPahq5aTYa
X-Google-Smtp-Source: AGHT+IH4ThQvA67GMn9BBP+BpW9UKkqL1n9PxtnEWwkqY1wfdsPSyC6iLFZ0LnE7iFq1L3YeQU9DMw==
X-Received: by 2002:a05:6512:3d0b:b0:545:d7d:ac53 with SMTP id 2adb3069b0e04-54b1100eda8mr2784360e87.34.1743439125136;
        Mon, 31 Mar 2025 09:38:45 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b09590fd3sm1151796e87.188.2025.03.31.09.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 09:38:44 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 31 Mar 2025 16:38:43 +0000
Subject: [PATCH 2/2] media: atomisp: Fix Wformat-truncation warning
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-v614-v1-2-9bc69a873720@chromium.org>
References: <20250331-v614-v1-0-9bc69a873720@chromium.org>
In-Reply-To: <20250331-v614-v1-0-9bc69a873720@chromium.org>
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
Extend the variable 17 bytes. It is just used for debugging.

drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1336:9: warning: '(pipe' directive output may be truncated writing 5 bytes into a region of size between 1 and 74 [-Wformat-truncation=]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 9818771a35e550c0ce98da826caff5f834867e7c..45af23f09c0ae67a2dd62e79457b548831b8c21e 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -121,7 +121,7 @@ static const char *const pipe_id_to_str[] = {
 	/* [IA_CSS_PIPE_ID_YUVPP]     =*/ "yuvpp",
 };
 
-static char dot_id_input_bin[SH_CSS_MAX_BINARY_NAME + 10];
+static char dot_id_input_bin[SH_CSS_MAX_BINARY_NAME + 27];
 static char ring_buffer[200];
 
 void ia_css_debug_dtrace(unsigned int level, const char *fmt, ...)

-- 
2.49.0.472.ge94155a9ec-goog

