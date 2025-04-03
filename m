Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8F61F942D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715892; cv=none; b=CI75mPIkH07bUwCQL1QJmK/5USFQKzF5w9eGEKxSEWp8ULJvbgnAMu2RU/WuCd5bZ9kVmVA/vVzLdQnrza0NQZvJ9QaaKoTp7I9UI6sqSorDwV8bBho3YpteZe6qzC09zjySHa+BQCCS9ezdKZe+sIhpakXrAAs6TmVpH028wc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715892; c=relaxed/simple;
	bh=A+EYzZLGQHIPJ5VAoM/+3fe53Af6CgodqviiAM/ONBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VciQv3y5vwQKXM9tG1qOqHp4qRUJIZAskqkL8TBhorCNs2u/DjFzX674RgUHP8IlgdZcdYXJOYd42dz62qTi7nhGMaGI2fYC5mlcx5MGnT4ZP3h+G4Yi6v3aRANQQ6FBghF4u9917BurFCJRpH4K05DiFmryB0AkpAcBNjaK3pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RBoMnZZ0; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RBoMnZZ0"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54b10956398so1555408e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 14:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743715888; x=1744320688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAivlvh8Vrg1UGAUIkAMwQONWXUXc2TvgNk5knB4y0c=;
        b=RBoMnZZ0u/tUHLRK1bssySq5ikkgvf1ls37o0ILNW6qzkgKJCfIy5m1T8mjrpJotE3
         NavUwfK9degbloOOuf+jGgb+wbLb9w0pv7k9ZBX7JMIRwDaB1GjU6gxaIXe38C1uKe2/
         wLdxWcH0EJkncsJ5361zJfhfTtmF3J806HAqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743715888; x=1744320688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uAivlvh8Vrg1UGAUIkAMwQONWXUXc2TvgNk5knB4y0c=;
        b=Sat27Wasb26kEO/W5XoArCOEUmhU3O7W8GIrsjn/9ZiJL5Yxrtt9EWw+Db9QqxLbhf
         EFcflAQapS/hsEKdJXMKSHPAAocTy76l5VKZPPTf/e9IBU+loDbJWVwiJsViiDFRAy5I
         c2EEWV/HO6E/KyRnCrMmJA61JqB98+mvRvsCYlm7Lcp3lDJcLp5wevG1Y1xzkL+Ki0Ry
         +H2/W+OWM0dQzB3vF94lQ34Rq1wrLt6fUAulphOYq+x1P/zXjCtGlOD1tVBKAij2LH4D
         T8viSwW6FdPM2Tf9jXzT9XLsJciDFKbhCxTiICfvmtWiEvxoq4mfzJ93BWRMxZ3KKugq
         jBFw==
X-Forwarded-Encrypted: i=1; AJvYcCV+jM/UE4nuFFCdHpMHMJd21ngRT8hrdaolJ6LDey7JrtnEZ/aTaKjTQAdwaNIhY2Y5HiAexYHrf8e5tcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLYA3VDpufANBwEsiLf0P+oePEcfcjpcjxMKDY5JqctGyXWUzU
	ChPdueu4ZBe3YDpxnxpYJZsf1T8pKbO7GMDibnmOENzVEX7iLw8nsO90rwDEFf7Zea1yeYULwGo
	=
X-Gm-Gg: ASbGncvV+oz/B6u5/Xfdd7E0KXkn9F9Stw0JZSfYeLQZq/XW+egLtySUdkK3RjX75qK
	kJfQcqQgJdSDMM+RC5+MrVxnk390CehkLFow04Z8grl+WLcw3r5g5sDx623rYTAf7Vn2OBiAoTh
	jxbdwK72a5Z6E1fwz2v2HPQxnSVtblC8ioxTz84mcCH7pLV2cI0fK4JtheYCIJzw4bs0SHLxt9d
	TOLxpdL/ywplftmVNlhr3SYigH7EUI3Ca3N2lo5e92diy9qDMonIRQY/+ABMkoqhaa7R2UG2ORy
	UpdIzMW93asj04shw+QTvDz5N0XMNJT6HInRzfpf3eTgW6oBbQerJHTKvu3EJVEUMi7VMwO3MxP
	0Kg1rFD/lZ+QXzhLvC7HR+v0iCa7OGgefbpE=
X-Google-Smtp-Source: AGHT+IEgkYZflIY62I3D0j+z07leuEa6xOn//asxpOiQ1NhbRMdh9wxzWYxoJvi7ZlfsK+HV44q73A==
X-Received: by 2002:a05:6512:2c88:b0:549:981a:1eeb with SMTP id 2adb3069b0e04-54c1ca56dd5mr1924310e87.5.1743715888535;
        Thu, 03 Apr 2025 14:31:28 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d6d5sm252938e87.181.2025.04.03.14.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 14:31:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 03 Apr 2025 21:31:25 +0000
Subject: [PATCH v4 2/4] media: Documentation: Add note about UVCH length
 field
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-uvc-meta-v4-2-877aa6475975@chromium.org>
References: <20250403-uvc-meta-v4-0-877aa6475975@chromium.org>
In-Reply-To: <20250403-uvc-meta-v4-0-877aa6475975@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The documentation currently describes the UVC length field as the "length
of the rest of the block", which can be misleading. The driver limits the
data copied to a maximum of 12 bytes.

This change adds a clarifying sentence to the documentation to make this
restriction explicit.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/userspace-api/media/v4l/metafmt-uvc.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
index 784346d14bbdbf28348262084d5b0646d30bd1da..42599875331c0066cf529153caccb731148023b9 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
@@ -44,7 +44,9 @@ Each individual block contains the following fields:
         them
     * - :cspan:`1` *The rest is an exact copy of the UVC payload header:*
     * - __u8 length;
-      - length of the rest of the block, including this field
+      - length of the rest of the block, including this field. Please note that
+        regardless of the this value, for V4L2_META_FMT_UVC the kernel will
+        never copy more than 2-12 bytes.
     * - __u8 flags;
       - Flags, indicating presence of other standard UVC fields
     * - __u8 buf[];

-- 
2.49.0.504.g3bcea36a83-goog

