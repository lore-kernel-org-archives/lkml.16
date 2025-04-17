Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A8424339D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744903868; cv=none; b=OZj/HyjAHDcJAmpzLYDsvbcj5Uvg8cb0D+vkLSPmmY/QWvfdyJFbWVUR1oftzs1ILqZL0lE3qyuP5ZnTEJQUaBZZffObMbil2cZoZkHuNe/09K08Q7NXXOmaEeaob+2ZzhdQvsAT8WKAOsXyrSAvDFvWyp0gKuUI2b8G1aJghIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744903868; c=relaxed/simple;
	bh=3MTw73aWbpQzR3zLxh074LLgFqiSGsDZ+BvoCWuIAxw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YtesPWM5zNOQQiSAPUryZE3nbGv46DGrL1FRbIx55eeVN0xlRB7Ake0WhAFmOQQZpciVX/qDD7l2S9FbdpPIztaryLdJ3y+L41HNAaiTTVyZbrer6KqkE7aKbvB5nLAAqHrWACYL2fstLpLkI+7V86LCJsiLoFeX44XCzDkNGb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LODFsi85; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LODFsi85"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-736b34a71a1so1109936b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744903865; x=1745508665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XXwpinCtXrQvhLFQnEd9La7w+QdiN4cwUhD38eo9LNI=;
        b=LODFsi85tgbMUDw0Nm88zSqBmx4rhswrQ5H3rnffDWhkC8FwJCJNf/KU09sMzlfl4I
         ooXGUVsxGPjX/DaioXghsBFB64lfTq31M5DYP3h25iI85UFVOlejufZrw9qUEQ6ggjHD
         Ac6/BQ6UVcp1feoKUg++oJ1/MbR2ovQj9BygmXufKO8moH80jAAFGJfsw5eWzFLzgxrl
         F62TyvC47wxwU4rzn/LCCN0Xq4rd8LuPh/iYwCFGq3VG3gq6pVU3CVHHMw7glDQUg4re
         JHC0yXuwp7/Qkeswsxu53kVGoKoKBjLghuN5dZnxWY7A46Bf+OhqgA/MmGLexs9N6SVS
         ogkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744903865; x=1745508665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXwpinCtXrQvhLFQnEd9La7w+QdiN4cwUhD38eo9LNI=;
        b=f0TPvynXscHaRucXWf85WjqqtxHX4WmFep+IQSEF/vX9wRWLRLtk939ZMW9vnx0xeZ
         7rwXTHp6gr98gE1jpMZNvBmK9IwmU5U18D6mGtmFEGFCTnIMEKLLyNN+4x1qSpzWpo6p
         9aTKcPLpo4smjE3LTMUFt04hCRyo0N0wDvudxTDflQKUzXR+XkxB+yV3vd5pm9IgC2mF
         V0Yc8eHVsjR360pY0INW+bEiRYPgG85UcdYtbN4A51WcRPiSQSyK6W7NRumUp2Kgb5wY
         RHSdrwBmbNP6EHQBcW8zg9h57IKLkW7CudWUEUC3ljWTE8QBGjBaC2G7GxOZ4Oic7wvc
         A/Qw==
X-Gm-Message-State: AOJu0YwwTn6K1fmIW2CXUFA8yja88cQoRsdKKgTjACEg9G2sc9iPv6Hz
	GS1DqQ8WD+R8zA3OKankypuxr9a1i6i/dTKISpboxnvVznefd8fe+N3mhQope68=
X-Gm-Gg: ASbGncutx/jgVWy2Js0oYxd98ph9+9AZkavTjsOt+hKlynzuUdkWNRfyVpWmTC3hSar
	jjMiwQWmtTlcet0zkvCidnnRUBJyD0Wqt+8AsgAoRtDf1ieL7OeGR+VNPwnMo5fzx1rt7VqDHR1
	Dm5HHBPjfqL/Dp+R+fMdzbSbJftUJZYYJMch7KQw2tBZlMtvbXqaUPG1w8tuTUFeOFv4zahvmsT
	0WuUn+u2I93TBLe27NCjLq8HPM7juroJyQ70mQqxvPxbhMz19ojquUL+T0I5xAmUvWPlefHLYMd
	qu3NyPR35tKjow7eM8zWd8Ivk/v1HxiT4uY9P0HCYxBXT/fqvg==
X-Google-Smtp-Source: AGHT+IE0sBXnqQrNTr8mqqzWhCy8FSHFzIaWJzOqJ+xuokGfrBfxkKaNMG2Iw9cpsrZlSEbD0KDPbg==
X-Received: by 2002:a05:6a00:198c:b0:736:a638:7f9e with SMTP id d2e1a72fcca58-73c26700979mr10339783b3a.8.1744903865528;
        Thu, 17 Apr 2025 08:31:05 -0700 (PDT)
Received: from localhost.localdomain ([43.129.202.66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22fa730sm12829030b3a.94.2025.04.17.08.31.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 08:31:05 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
X-Google-Original-From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH 1/1] mailmap: add entries for Lance Yang
Date: Thu, 17 Apr 2025 23:30:41 +0800
Message-ID: <20250417153041.38977-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I'm moving to @linux.dev and mapping my old addresses to it.

Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
 .mailmap | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.mailmap b/.mailmap
index 6efaee6537e4..52571145a869 100644
--- a/.mailmap
+++ b/.mailmap
@@ -447,6 +447,8 @@ Luca Ceresoli <luca.ceresoli@bootlin.com> <luca@lucaceresoli.net>
 Luca Weiss <luca@lucaweiss.eu> <luca@z3ntu.xyz>
 Lukasz Luba <lukasz.luba@arm.com> <l.luba@partner.samsung.com>
 Luo Jie <quic_luoj@quicinc.com> <luoj@codeaurora.org>
+Lance Yang <lance.yang@linux.dev> <ioworker0@gmail.com>
+Lance Yang <lance.yang@linux.dev> <mingzhe.yang@ly.com>
 Maciej W. Rozycki <macro@mips.com> <macro@imgtec.com>
 Maciej W. Rozycki <macro@orcam.me.uk> <macro@linux-mips.org>
 Maharaja Kennadyrajan <quic_mkenna@quicinc.com> <mkenna@codeaurora.org>
-- 
2.49.0

