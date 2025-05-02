Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9BB22D7BD
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 08:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746176396; cv=none; b=EqMpVfYv9bYLZ5513+osJzuPVt+7rcDdzeiutpc6mrw//y0Lu3pafGf4yfxm9C7zmoibYD3oltiPGJs1SjBM5WlgiXPu9U8Uy8O17JMa7T7fMAH1pYyltseo8Qg7nQMzkyXTB5VGy1JccFNpcD2AbW0TTn8XQ2V3Mhca/w6WkKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746176396; c=relaxed/simple;
	bh=L7vO01waMbRPHY4cHTagsznknnmWs3Tw8o+y1YlXx0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BeG3b1e+iqNw9cHRjXeiRMde/DI38eq1UXm8aXqTp8qeqoDCpcSrmAZdqFtFKJslhA6T67KqRYnftqZbJDiu0mzDbhyXEkTdJD8IH/W1KlVKZA42QxPipUvbn16fvA/TK9bV1yj4gEDZXGn3ajfIjJ6CVFIYLqVJFph5aPp1P4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=u9byflc1; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="u9byflc1"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so1254315f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 01:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746176393; x=1746781193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ctFdlWFJvdPBkAi1+fMGSkHP97NEJ9/Q0ezwvzkbus=;
        b=u9byflc11xgdqRwpcfjJ6WBP0Wbr1kDAw2d/FF1MlnZHQKO0s03B+02hjIU4HJRd0S
         +GTPZIfvcMu35DPMf89Cd2r7DXqZuBMa+AWRPKmnBKAXaR9j/uCLjhiBH6NvjueujpnG
         Yrl/HmvhAc0DIseGZqcYsVO7sYoLVa5j2ZvZwommfjuydUREyo8/8fw8zEM8nFpPlN1P
         TDRosZueAMXfRZUCLCMmT0f/1vv7rtBCyAnr+9t0daq+TW/sKSAvofll/98jo7MaoSAc
         bxWBgttzN89/LKZOrOt9JlaAPd0d6RGu03ErPVpNvPxSzqFtOz9sJrDakF8FZwBBfOWy
         SOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746176393; x=1746781193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ctFdlWFJvdPBkAi1+fMGSkHP97NEJ9/Q0ezwvzkbus=;
        b=CzVxyJ0Ij39XAdtZYcN9z7X68LuCMgH51MSvjGgjwZunsR0ISguHBqbcSEIm+RUXgE
         IYOHzLyXnCZVAOVjnEjBLePdKcvyGK7Djt9Nx+rsQ8SpKkDYUB90XN5TR4lInrIUejcf
         NyEZCo6GVTb6yUTueRzNoORY6MNaKDCkTCSG8rC9ih8ufxxx+l6zn8FP3czsov7w9sR2
         +ZmDijwt6IdKtKbzxlMf1uXpPRcL2WGxYjQu3Eu/LC0LFU3e3KBk1VqkuZati2gSenJp
         eWwyFMYdgNS8i7jnrrpW3ssVs/clw73b2NK3TQH6qpSQhGV+aIvBHl7L0Hy2v6/9uVKo
         vTIA==
X-Forwarded-Encrypted: i=1; AJvYcCU5t+DoCOS4a7l8QPFOqij8nYzTdqyA2ZLZ1vmckGW2meoRGrNqH8J1+K73QdQc14sLgIeb8sqrbtOoY3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKrn5QkRW8P/5b7hKOsPgJ5mm1ZzZgAC/V8Qat6SEixfsZdlMv
	iICUUe+3htRQ6ATudKgqa4BkVUXCsE7sG7tZ6NGcYIO/ipD/ibvclDuIH3Y9Cp4=
X-Gm-Gg: ASbGncsExMb+Uv2uAMgRJuUYAeevBQLGK924uQT/bxu3LtwYV+aG1DyYBn/VOTa2abj
	pxd2CLykDARaU2RgJUA4eRjjwFSR/29ZuFyUcS7cEqnawy1gNRt5hQPdlZWAQxJfc7yBK5//8A6
	il2Sz5l8zGmc31T92pUfro3KGoV4/xP5sq6O4z1iKeTKdyBSCwEuAqW++SnFdfCB92el/YJnbt0
	kvKmNTLArGIS35aretiPV5kVc54Wxv3nstau6piyPgGhAHnTP4H3oy9zsLS00sJf7ieWml40d08
	8aygeH8FcRe6R2LDiTfzdiDrFXWm+F1ah7s=
X-Google-Smtp-Source: AGHT+IEEQYczV66unx0kPiJW+nrPEeBzFXGbGRagIzFOWe+h/OKFXs1Aax+0KalaeWUyKNcJAnCWjA==
X-Received: by 2002:a05:6000:1a8c:b0:3a0:8492:e493 with SMTP id ffacd0b85a97d-3a099ad2772mr1416698f8f.6.1746176392472;
        Fri, 02 May 2025 01:59:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f280:a08c:3f15:ae3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17017sm1552055f8f.92.2025.05.02.01.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 01:59:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 02 May 2025 10:59:47 +0200
Subject: [PATCH v2 1/5] powerpc: sysdev/gpio: use new line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-gpiochip-set-rv-powerpc-v2-1-488e43e325bf@linaro.org>
References: <20250502-gpiochip-set-rv-powerpc-v2-0-488e43e325bf@linaro.org>
In-Reply-To: <20250502-gpiochip-set-rv-powerpc-v2-0-488e43e325bf@linaro.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1700;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=unub8yX667IH17idZRyuiKjEw23zeZPtyjlcM+1WGx8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoFImEg2NIMAwbx3dl41TeaZx3sbL3vCBOIk0Gn
 +tM9lO2DySJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBSJhAAKCRARpy6gFHHX
 clAnEADEb6k81gHxYU30oVcF3o5XKWH5s1upUtZc76+5BwdbhRCyIYBnQ/QP3vpRCFKdaOvmHG5
 lVmTUY4I2EI68GzfZWu1nUzlGDpmHxrvFZUvrFJGy6L9vtcJARterMUF0V9Eye77Tp47QNN9Oyt
 AFchM5NCrOcqS2FGeBjEj+H5NBVMniaSOl1ANPLPGoUZgi0knV0q8VWAA9XIQagdBiVhePe4O9U
 pv0CSeY9toXhZBTawevU+L9OrVxsuraffDTIm5T8I/sdU808agYCxUb81VhEX4Xeg2VU2vbD19C
 wSb6b7QWwBxBbDm/9JDfM38Jdb3u5PqltOJuXIbFirTdrwuJbex9CoTrvSlLuyhVXLMDx7IriGL
 gmdX73bMQ1DyKDx4BPe6suEFXTUiVDG9xnv592SZHsYwZqi0TnXO2XpOHk56NMwcuIHi9DVhuQ5
 wRqNyGjx5EzAwS+A9tdt8KtTokNSfTjOqYWJBZMnmbdX4wUIZd9uAuRzeCJQ3n5x5ukITNUHY83
 +31cKS/MQfRt9UPk7n68YwazZrVqecoEevbiScE3zb4sbnKCZlGC+XEPG4rjMGBfbApTO8Z7Eoh
 kr54j18umaXDf6u0GTtw8EXpg1uFAgA1x5stvQMydbMTOdSOOXExCNO/HlvlkNjzyEGCnt/UgpA
 rr6ajzkeTTumccg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/powerpc/sysdev/cpm_common.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/cpm_common.c b/arch/powerpc/sysdev/cpm_common.c
index 47db732981a8b..e22fc638dbc7c 100644
--- a/arch/powerpc/sysdev/cpm_common.c
+++ b/arch/powerpc/sysdev/cpm_common.c
@@ -138,7 +138,7 @@ static void __cpm2_gpio32_set(struct of_mm_gpio_chip *mm_gc, u32 pin_mask,
 	out_be32(&iop->dat, cpm2_gc->cpdata);
 }
 
-static void cpm2_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
+static int cpm2_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct cpm2_gpio32_chip *cpm2_gc = gpiochip_get_data(gc);
@@ -150,6 +150,8 @@ static void cpm2_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
 	__cpm2_gpio32_set(mm_gc, pin_mask, value);
 
 	spin_unlock_irqrestore(&cpm2_gc->lock, flags);
+
+	return 0;
 }
 
 static int cpm2_gpio32_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
@@ -208,7 +210,7 @@ int cpm2_gpiochip_add32(struct device *dev)
 	gc->direction_input = cpm2_gpio32_dir_in;
 	gc->direction_output = cpm2_gpio32_dir_out;
 	gc->get = cpm2_gpio32_get;
-	gc->set = cpm2_gpio32_set;
+	gc->set_rv = cpm2_gpio32_set;
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
 

-- 
2.45.2

