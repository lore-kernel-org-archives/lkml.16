Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB73528B4EC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745428842; cv=none; b=qYlF/riXG4YpbZ1PwlZVElRYoLGCR1xKCDQx2uWnQdB8Zbv2Yh5RJsAGv2Vj0LADCcYk12a8uMq17uNA+PWh4ltzD7OS1hA023IGdrVkv57+NTVPVI6WUPu7qByJNLO4MOoCF8owONWiVmjH1pRgnjYLY7tNaxTPHBgmcEBZzOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745428842; c=relaxed/simple;
	bh=wMlOFTd70RMJCXwC9bQyxic8c20g9i+LxAT9YJ/SitA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LFgJfY8SvKgePGQKywtTDEWzCBa/I8wkkezkCHrdDTHt19UWeStr2lBHmxOaIvXRQG1Dy1YFCBMkVS0AGTuctraNK+C+BUQVKnTPaYfCO5DmgAtxOpNO/wUXCrg3hkL92I9XipNXTyrk+eGGSYhDHrI644La2A+8fk2AamQSmkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=c8L33zSM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="c8L33zSM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so600935e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1745428839; x=1746033639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4rqGU6lspHQHS3YtpHeS52QHTuXwrfXzLgazS3+iqpY=;
        b=c8L33zSMO7eBTCkikx0lf1XRNoJbXj03CtzDDctCMwcHc3gjFSli27MkySsPCTwO/G
         GdDN5t8RFhw7R2mT8qbZHB+Rm7q/1d9/3+zMSLd7Ty8907C2ceGVEQAR3JUKhZzRBXR1
         EoLsrgd27v6OWh4MOI/aY7PFpxDFdZmRsbA3IVhMoRlFDdPbaPvBd0qQCX2zEAn7m/7j
         xDzCPmVU+liM3qrOuNIpyndGW3Cz7VaL4LzgFyCYPuQMs+Rw7w3ixTm4Z8rRP+RO2xH+
         tdwtQuDU3u3Cp3a3eRtjH114oisIiOqGUG7FmZ89dT743bwSlA/iUSI7KOEaAcxCX+Ae
         b/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428839; x=1746033639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rqGU6lspHQHS3YtpHeS52QHTuXwrfXzLgazS3+iqpY=;
        b=ZuQ7tgOPpUq0yUQ6lDfIka9yMAOFDmzANQ7ftsnx5cWP2LD0iTJAT2hQwsoUr7psfe
         00nUCCE5x1MXI8pwLnyi6J8UbrI+TxVRzkMlmJ1VjSHNRlPQWiKBao7BOJasajsB9Pyh
         qiAHg+C+0y1CAgmpObhQjomo9ZiYQz7ev8zRE8Hre7yzW0FSAQOo6/8p3xlhcmvHvMW9
         Qu5EdiC2sEjWjsDQUQ+sAxoiYQsXuHeImRrgnNsSCEHtsbc5UCM5vOSF1ktgNtPahmoW
         g3pFkiVbZwBbL4KoYLHyOBMirzS9fg0aBFckoGoU/P6gUwUJuE1d3WB4jXf/n8w4iRwJ
         C7mw==
X-Forwarded-Encrypted: i=1; AJvYcCVPj3y4fjKAJsgH5W6+Vu8jGumS8YB2e1yWgIkO+nSEKi83NLP+6J9vjeghEZw8WIE4gDr0bUoGV7CuiPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnrNAfsx0FA/PLzBoaD3JKdc6fKPNUBdEK7XwIaJTNpjo5a6PC
	u5HoYzsdpc5KV48hbeiP3pcsfGN6xvcblKpImTWCLNpQc8SqYXla33ANCg2I8ys=
X-Gm-Gg: ASbGncvY/7wKQk4pjc1M+a4Mey9KXa7DWbpqY2NzrA9b8CMjTmksBWqBHhp2NwSEEjy
	qg8XyVhOxHHN+CxPtJkIdlQ7bK/GB0/odDyWuNd4Kynq1DM8FgdGtMoBwPIX9vqgP5xkdoQlib3
	Kq7bIIWj2qqE0gxL+cfinQ7bNYwUBrGhqQBOqRpJ6Pa1dEWfxYGrSs44mfhHr4i1NYlfGUlre/k
	nZn03uXrhdGcTa4OUJZjmDSx6sWkPoMFfe1qM95j4g/kox+wX6c1u6XaLjWQGh4vGRkqslQ7ZqK
	SAOU9VfQV4zC5ZlfXGbDwoyW9l1ntiP4
X-Google-Smtp-Source: AGHT+IGrixIUdFwDqxJsP0Mh+PleUdGsoK+ZibZSwUPFmb7HHGdjv1z9p7Q1wXmc1rZnucAiLmqGBA==
X-Received: by 2002:a05:600c:34c6:b0:43d:209:21fd with SMTP id 5b1f17b1804b1-4409a1c4da7mr3750025e9.30.1745428839115;
        Wed, 23 Apr 2025 10:20:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-44092d18433sm32940945e9.1.2025.04.23.10.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:20:38 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Apr 2025 18:20:19 +0100
Subject: [PATCH v3 2/5] media: ioctl: Add pixel formats NV12MT_COL128 and
 NV12MT_10_COL128
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-media-rpi-hevc-dec-v3-2-8fd3fad1d6fb@raspberrypi.com>
References: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
In-Reply-To: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

Add V4L2_PIXFMT_NV12MT_COL128 and V4L2_PIXFMT_NV12MT_10_COL128
to describe the Raspberry Pi HEVC decoder NV12 multiplanar formats.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
 include/uapi/linux/videodev2.h       | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index a16fb44c7246..9405e1391617 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1379,7 +1379,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_NV16M:	descr = "Y/UV 4:2:2 (N-C)"; break;
 	case V4L2_PIX_FMT_NV61M:	descr = "Y/VU 4:2:2 (N-C)"; break;
 	case V4L2_PIX_FMT_NV12MT:	descr = "Y/UV 4:2:0 (64x32 MB, N-C)"; break;
+	case V4L2_PIX_FMT_NV12MT_COL128: descr = "Y/CbCr 4:2:0 (128b cols)"; break;
 	case V4L2_PIX_FMT_NV12MT_16X16:	descr = "Y/UV 4:2:0 (16x16 MB, N-C)"; break;
+	case V4L2_PIX_FMT_NV12MT_10_COL128: descr = "10-bit Y/CbCr 4:2:0 (128b cols)"; break;
 	case V4L2_PIX_FMT_P012M:	descr = "12-bit Y/UV 4:2:0 (N-C)"; break;
 	case V4L2_PIX_FMT_YUV420M:	descr = "Planar YUV 4:2:0 (N-C)"; break;
 	case V4L2_PIX_FMT_YVU420M:	descr = "Planar YVU 4:2:0 (N-C)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index c8cb2796130f..fbccb471e3cb 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -687,6 +687,10 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 16x16 tiles */
 #define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
 #define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
+#define V4L2_PIX_FMT_NV12MT_COL128 v4l2_fourcc('N', 'c', '1', '2') /* 12  Y/CbCr 4:2:0 128 pixel wide column */
+#define V4L2_PIX_FMT_NV12MT_10_COL128 v4l2_fourcc('N', 'c', '3', '0')
+			/* Y/CbCr 4:2:0 10bpc, 3x10 packed as 4 bytes in a 128 bytes / 96 pixel wide column */
+
 
 /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm */
 #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR.. */

-- 
2.34.1

