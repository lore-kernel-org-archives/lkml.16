Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABB028E609
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 12:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749039369; cv=none; b=OKmFHJADUXe/CMlCDUn5DntCK92P9ADg9jOC6BWO+U43b0qJVwIFR1uj0TozYrMeMGyqJ4sv5T7GC0jcMaKKfUCAIoWOMdo3NKyD2Pxm5UynBBnonOCaJI2xg2QTUy1FC47bG9GsG/B9nFOS9FubmO7k+TLK2SHA8cuFhBT4cQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749039369; c=relaxed/simple;
	bh=R9poar0IHwcvjb7X94DIxPbqfZnQbM35tbbAXoVZYLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A6H4Dxix4xEiLxR+ZG2tdh8hvkRHz6+EgRzXR6axVg/ljZ4AfABCqc7+P6r7MNgiJfuCDEoywqxf0HoFIKEp5LayrUqCn5NIa9epaNAaccUi/AyqVXR2Cr7C1JoNc13PWGjUEVNVu4/coC63eaJSb+vwxkfbnWmxLQ9c3Kej95E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Vwhzcscz; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vwhzcscz"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5533303070cso7514288e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 05:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749039365; x=1749644165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U65dM4LWKHoC7xW4BA72z8M8lPtxis+hazmUzV/TgxQ=;
        b=VwhzcscznEi8l5eb9HAbb9nZZHVFk4PLxSHZ9FRj2276NlAmZm2eh+1kin53N0wQWR
         ofixgFEZeSMUls7eB/6jRB8duaVLT5hQM3ZKM928w8WCmzuQdS6sePdC1FmULqA7c5km
         ZluFNFVRGJCc1wD4rx4vDV6a54n+6VY096nuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749039365; x=1749644165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U65dM4LWKHoC7xW4BA72z8M8lPtxis+hazmUzV/TgxQ=;
        b=Mv7EX059iqX2NQM1h9NuFOP6U1rczlOR0fVHZEf3gt/xfc8wAqvxN369bUCLqSs3F2
         i9TpNPVcpl+fSA0mjL3cusrMshD/pyLpp7AvYxBu/ksnggXKyFfcGoqDeOc7/2df0BGK
         c1n4zfys2f+jq6Wfb8qKN0XgUcMHETVJlp6qLJQkRw1El0HKPq44DBZSuPn4oqEL0Dca
         yTiaXd11yfA2etFEFEF+3dzDJAfl7AMCnbSW4/MnONLal4/jbuh+j4shmZynvQ1S7Biu
         KqtaCZHLJJjcZcFKEQcKSEiFfKyI6jVwwmLKLdo/1tCc5xQuDg2+HDVerChSBKaKjKm+
         QGrA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ6Yc8W9oxPnloBaEGqwkeAuuUH5hzZLkuXiPCS5PW3gEW+RZuAPlaTkCk/Mav2fvt8HDk2D5J2rUGRPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ4P9pSkqD/baWMwxsd1UVXZYC+uq1C+fy0CdYpoZTaDV9PAbN
	KfIlawEGsEyfSJ5zCyy/7Dsd0JyEClmePaJD0jBrTTEzO7WZFxThmx6HO9y05582tA==
X-Gm-Gg: ASbGnctME1sYDCkBh40G2tUEqVjmfn4Q6v33LfYgdeDpKpbVYiOcPbCSdMqEjFbMkMK
	4eCQ+w/TOgu4biB/0/e+QBxZ9F1av5aV1kVb5nREUcY+ldeYm1FMBJnfDvjRn68Pgkuf3AjxAh4
	6LfRz6tbbqQkQhLdmsRPaM9N/fgxxi2NoYAmTLq3kbKziKv/5Hskc2+F3p3HeWoycIxR60U1Eyx
	UhWwH++G/UrEn7wXIYRzqVGe80cM2XWjT0lm+QyLM048vjQCCvHlPYBtKp0LTZjmbdJeL7ndIRI
	EZiMafdFWRrkkVzkATEsKIx1934rrRT/D/7/3/u3JUsNiwIj7AK06NI5S5LAYqn/Tui9KhIyUOr
	GDKbCDltowm8pKHqJTRh3Qb3LrLF8nGx9Fq0i
X-Google-Smtp-Source: AGHT+IGBrBRDYdNS9IdYcZYK7RO2DqQLHlV/qfBzNERuIj/o5XcOQ3QVU/1bYU8eKuGEsinUybydhQ==
X-Received: by 2002:a05:6512:3d9e:b0:553:2e42:fffb with SMTP id 2adb3069b0e04-55356bfb72cmr664186e87.33.1749039365318;
        Wed, 04 Jun 2025 05:16:05 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553378a12ecsm2289134e87.90.2025.06.04.05.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 05:16:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 04 Jun 2025 12:16:03 +0000
Subject: [PATCH v6 2/4] media: Documentation: Add note about UVCH length
 field
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-uvc-meta-v6-2-7141d48c322c@chromium.org>
References: <20250604-uvc-meta-v6-0-7141d48c322c@chromium.org>
In-Reply-To: <20250604-uvc-meta-v6-0-7141d48c322c@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2

The documentation currently describes the UVC length field as the "length
of the rest of the block", which can be misleading. The driver limits the
data copied to a maximum of 12 bytes.

This change adds a clarifying sentence to the documentation to make this
restriction explicit.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/userspace-api/media/v4l/metafmt-uvc.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
index 784346d14bbdbf28348262084d5b0646d30bd1da..4c05e9e54683a2bf844ddf26f99d0d9713ef05de 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
@@ -44,7 +44,9 @@ Each individual block contains the following fields:
         them
     * - :cspan:`1` *The rest is an exact copy of the UVC payload header:*
     * - __u8 length;
-      - length of the rest of the block, including this field
+      - length of the rest of the block, including this field. Please note that
+        regardless of this value, for V4L2_META_FMT_UVC the kernel will never
+        copy more than 2-12 bytes.
     * - __u8 flags;
       - Flags, indicating presence of other standard UVC fields
     * - __u8 buf[];

-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

