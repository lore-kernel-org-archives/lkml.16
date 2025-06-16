Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3041E4BE
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750078304; cv=none; b=jHcFJh8dX+2xI8bDYainLm0EjOgpa7//PdFUrS7jWE8UGmgUIrfLPXK3L7NrJ/l99EzIRRYhAQDzWSE9Zm5GZK2opCOPtE2d5iAzLmsBpD5gXzTaQr5VA+LKknOFHvZ9lojVU6904NFeeSMf+f35BnCasurCMsScSwA731ubtC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750078304; c=relaxed/simple;
	bh=9k9Wh/NoYsqbKlKsFE6tFkqP7y1xy/55zKbtVtGtJXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ToHqQSKk7hxBQUfRcV9phJBsF4SLUrT5V0+1QBLmjpzw40e0Jsne1mTkrlN7jsX6STBZspR6MYmAz3u5xcIHMp5JkrsVDfBb1pnjwRluTlU5n3GLhSMCvCTzgJpQbnntUPUiDtZc6IhMCo+vS3CR6znq736i+sIBDTMVu0BLL9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=EdILSAIZ; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="EdILSAIZ"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3da73df6b6bso15888505ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750078301; x=1750683101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S/rRqga4nciTe+40s1lGUJde2Ttgzu3tg/+nM/gCFAE=;
        b=EdILSAIZjrQDawlMlERPytnM5jrP/lgXhVtRY0XasclPozbLQw8c033FbZxIYn4h8n
         5hYvZmkHxE8OA3GtOLSO8f0lVZCoVXQ5MCsy3JpZKtJn4cvFsBP/MMeKHB4Y1qkDiMFM
         87Q8QWi5SuS5DlZZDRHF0Ga9MPW/bFWlAWfzJl1/0j0hnnf5sxZaEBFNml2bBl1zbYRp
         CTqeZCENc3XTtQw/ctb3Jay7wLVKllLHOBeWPzL40EwdZJvnPcvMgL9mCZUVAz7uYmOi
         Z8QSlPYNvsFao4aokb8MT+OW4H+fhWl9vQ527iS7mI/z58LhgRs3se9EJjWrTjgb6+7t
         t8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750078301; x=1750683101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/rRqga4nciTe+40s1lGUJde2Ttgzu3tg/+nM/gCFAE=;
        b=Tv1Al5KbplvUH8IubPSAYzt+YjK5XK8Jbkfarc4OEDiqoeji8NIX+7IpD4VXAfXpwR
         O7Mp3JAOU31prIFbVpaplB9xCprcg8ruGvUt6FPjsGkU3idYY/iPMfCJjDT85M+YXkeQ
         2zVsnFCqy/9QtCCLE+N+f+mhQZRGNx8RHmbKoZNfYYPt0Eev/FDafKi856i3aGhCOYBx
         06+yFZZrhvnTZAe8BHMwtzyuO4S1tMGqJTkOztXZrfO72TSq9RQeDwMiAHmDLQFj0gXb
         kk2JpRU1oYNkVoOx0vVnYJUVhtLrNmB+zKMbkmUbTwiXDlyGHMYUtyfSq68HK45Fa+RU
         +T4A==
X-Forwarded-Encrypted: i=1; AJvYcCWzp2i08hHktnoLhZO5qfSS/3CF0noI7kNmr+E9sFnIFoN3bgVXs2cwRPFmHf+pe3R6/kBRJVC0/2hk/8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwpB2LXX4QSymt9QStA6zx0//2Q+dd+zjE5D/Eri8sQsyh1imW
	7FPNVqLZeMGW0jP9zxcIhJkBG18MZNt0G+fEgx6vGWSy4N5xG9Dcxt/PT2Vrmj53n/dlqH46pbW
	o9vfu
X-Gm-Gg: ASbGncvauy5xNlt1vksbp6drk+6kBZ0ZnelggTIzlr+NbawccExRCIyOFDVb3Yr2FXx
	9m/iLH64zyex1QZ7z20C/5KiYgIhfK8shs/FLm6I27ZAwUhXerkQ5UJbZHskDTdbsxzeCEf5UXO
	9k6su/+EMkpjS2dEDCCSWw2ia0B2q66mOqpSzIuMFp8CqmvzwClPTpmzqSEpPDXY/UGNc1uqHrh
	BGJm9CHpzal8xVyQ516mZymoQ+YK2DjaOldLbmsd+Q6iSEvZAP16CV/YdgAX6HlP0WIja4Me1Sr
	v3wUl6sNaVYhPOTi0NnFdhRw8wdOgHjhE2iRBua9WkUVngstrkwZZFPs5CyLBOW5MD4mXZaDH3u
	ndmVy6abxtttrICIl8CDwBjafjsHHtrk=
X-Google-Smtp-Source: AGHT+IGBM9IfcIVPXLIx3r77XwCbfXk8tkksQXCR2d/8SBqn06Uhn07s7o49RLoWiyjUv193p5+5QQ==
X-Received: by 2002:a05:6e02:1529:b0:3dd:cbbb:b731 with SMTP id e9e14a558f8ab-3de07c55b92mr92098655ab.9.1750078300563;
        Mon, 16 Jun 2025 05:51:40 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b442fsm20352865ab.2.2025.06.16.05.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 05:51:40 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andi.shyti@kernel.org,
	dlan@gentoo.org,
	troymitchell988@gmail.com
Cc: elder@riscstar.com,
	linux-i2c@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] i2c: k1: check for transfer error
Date: Mon, 16 Jun 2025 07:51:36 -0500
Message-ID: <20250616125137.1555453-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If spacemit_i2c_xfer_msg() times out waiting for a message transfer to
complete, or if the hardware reports an error, it returns a negative
error code (-ETIMEDOUT, -EAGAIN, -ENXIO. or -EIO).

The sole caller of spacemit_i2c_xfer_msg() is spacemit_i2c_xfer(),
which is the i2c_algorithm->xfer callback function.  It currently
does not save the value returned by spacemit_i2c_xfer_msg().

The result is that transfer errors go unreported, and a caller
has no indication anything is wrong.

When this code was out for review, the return value *was* checked
in early versions.  But for some reason, that assignment got dropped
between versions 5 and 6 of the series, perhaps related to reworking
the code to merge spacemit_i2c_xfer_core() into spacemit_i2c_xfer().

Simply assigning the value returned to "ret" fixes the problem.

Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Troy Mitchell <troymitchell988@gmail.com>
---
v3: Rebased on v6.16-rc2; included version in message subject

 drivers/i2c/busses/i2c-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 5965b4cf6220e..b68a21fff0b56 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -477,7 +477,7 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
 
 	ret = spacemit_i2c_wait_bus_idle(i2c);
 	if (!ret)
-		spacemit_i2c_xfer_msg(i2c);
+		ret = spacemit_i2c_xfer_msg(i2c);
 	else if (ret < 0)
 		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
 	else
-- 
2.45.2

