Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56ABC38FB0;
	Wed, 28 May 2025 14:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748441364; cv=none; b=g2ghpjxhFkoSDwbIUVQN6Luq1Ycr19maFfUCnaTPeAtlWTV39JGBVxsQbjIS9an+LN829KvjgE1JbbGwSxizAzOnr5CPC9wSW2i2p1tbyRELglyaz4nUcv5rdNQ5jVRjXSyNdLCMaozAHGix+cEyqvBJb0Y/bdHWV26izbPmzKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748441364; c=relaxed/simple;
	bh=PNNjnY8qFFr8VVPEB1+kvLJElP/RtVTkzjXbyUtYBzc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kz/TL9qigXdrTFgzL5d8FarK111N6Fp902Bt/jRv57+ph5gcWydMezIbv8G4hICjF0ud3T2IoiuDRiQ3/FoTGG3kiH9d0NvOqL07R7drEmDqiGCGM5I+c/2UAuX7Tvm2RdvgMMDIE8Ac7Nd5P6IYU0904w1ddGovz5r7F/JL0uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=caebcaXG; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="caebcaXG"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553331c3dc7so611829e87.3;
        Wed, 28 May 2025 07:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748441360; x=1749046160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xde3QcEaLdUdjjxYrQVArbtAlmWgNtbJbn/lPMARRtw=;
        b=caebcaXGuhB+eG9mJPMgFbZCfTtE5/FFba2klC+tR9rklzafywSR6FOQOBIWbcWSPD
         LSC5rFPSLvdVmoGprnQUgRJBAICjNX3j8OhfJE/HvD/H3XFWikLxknr3EUc8ZWb9gVtw
         88XyU3KNtUjTUD1v800LyhXDBK6LatyhQkSp95XLLC1xdxfWviObXXVVqyPaFJpb2oI5
         Yhy/3turAmpn8WjsbmYIbYLjWgCfnUQ3p4YB1PkT5nEyR/NECn+fSokcV8hN0ZbuuEem
         tFZgXXwVXDe2t6v3Sv/R6DtXCraR5l+TgLVzSDV0mddwvFVbiBCoUFhI17ZSXQyj+4jF
         kiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748441360; x=1749046160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xde3QcEaLdUdjjxYrQVArbtAlmWgNtbJbn/lPMARRtw=;
        b=A7SKswLLWL28Z350RlYQx34faroG+mJzjhtHEnyH182V0Yaex/ERgOhDw3V1l+0c25
         4v09iOiutgrUk7uxtvnBLLYI+nMB23V9FQ7ME9Z588JVQ4l4otceb6cG0JOihsai/t9l
         Jo5YOYukTXIfClupt6pnpQKZ4wLoTdZBMat2ZAslRekUoZFsx+QTNMprvR3wPEj3xG7s
         hbwaUeWnoUP7WK+EKM6K/hjGWnsALijqyKyFDf2cwJLnhMIKvaB9AGIp+o95vfgFGBdu
         e0BJej6JHXLP3FRDavxMTvcKU8OvuWasMoERT9Z4vp9gFNGgX5UyYBzDtTcVTFx7gYAr
         oBLw==
X-Forwarded-Encrypted: i=1; AJvYcCUF4newc4GfZqwa0sH+hvommM8f3tOyjAGomz0N+UsVIbIN+0Fg49vw8mNUbLArJ10gipTDnORzBuPX@vger.kernel.org, AJvYcCUVFTAsUMcOiQbqa/Gb+FIdg0WvtwJFMHHzz9r1ribY5r797nSf5CzqtbUfoDQi4DE5c4fQInAIxK/uOyYB@vger.kernel.org, AJvYcCXuqmxt39eqUY8WpNwF98SBgW5t/YeQvHik0VZSHb/UkMh7Z4qDbaH4R6yiA0Co+wAvStdfXu24Sbl/@vger.kernel.org
X-Gm-Message-State: AOJu0YztyM83mkcpqHR7AetuB10klJr4a4c5zsgadZJ3zgXsGFCT+nOH
	A0eeBcH3ZrGOd0QQTaFGpr/1tECfnrT84IDzmMjLlCjVRJoY0+v4o4jg
X-Gm-Gg: ASbGncuNohcu7oIuw06mFJsfW988AnqjtdaQdPZ3ARBrFA5k/IwRltsh0S7h+lzFQ+c
	sPP+uNJvKliocxpCDI/p/JSEtOkXkIOtCQ8l6GyWccndWMLDgFKq5jg2OwcsFruJ9V8gEOI6wwx
	JSqqRUPqH6qnbRksyO6jUc7Y1QVOJSpaaAq/zsXZyHcYclHyvCEDhhZPKn7LuBDvcnz0qhe0Chn
	NmBLFJujJE+CLOV6LputeXmxTimHHCOIJzStmqfUVdQWd003uTtSWRoyuZfx02lG3u86pXIuh30
	WX/VkJ6MJC/voK828OXxWxw8Lkih3I1OIv4xOLHdJYQCYbWFpkDx/ATHU0KKYO8vahTybnnMMPe
	Q+Z5CH7xIJ79O8OhoHLGNgJBhxGWURAvOdA==
X-Google-Smtp-Source: AGHT+IHfnh9vdk+RemNz3ZB0OBfCZjiGqQpUV6d0Y93UkvUovkg7i/ks7VL90KlEwuCeuKiWJ5b3Qg==
X-Received: by 2002:a05:6512:1304:b0:553:3407:eee0 with SMTP id 2adb3069b0e04-5533407f3cfmr590221e87.4.1748441359957;
        Wed, 28 May 2025 07:09:19 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f61c4b2sm298226e87.45.2025.05.28.07.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 07:09:19 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jank@cadence.com
Cc: edgar.iglesias@amd.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] clk: fixed-mmio: Add optional ready registers
Date: Wed, 28 May 2025 16:09:15 +0200
Message-ID: <20250528140917.876453-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

I'm not sure if this is a good idea but while doing some stuff in emulation
I had a need to wait for a fixed-mmio-clock to go ready before using
devices it drives. I figured it may be useful to have a generic way to
describe a simple polling for readiness.

Cheers,
Edgar

ChangeLog:

v1 -> v2:
* dt-binding: Add unit suffix, ready-timeout -> ready-timeout-us
* example: Remove unused label and renamed to clock@


Edgar E. Iglesias (2):
  dt-bindings: clk: fixed-mmio-clock: Add optional ready reg
  clk: fixed-mmio: Add optional poll for clk readiness

 .../bindings/clock/fixed-mmio-clock.yaml      | 37 ++++++++++++++++++-
 drivers/clk/clk-fixed-mmio.c                  | 35 ++++++++++++++++++
 2 files changed, 71 insertions(+), 1 deletion(-)


base-commit: feacb1774bd5eac6382990d0f6d1378dc01dd78f
-- 
2.43.0

