Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864054CE08
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096877; cv=none; b=gZ94dTeCipoQJYZWiEqkYSE2ckCMZvAT1KTRSHB/fvl3o7syuZw3r4Dt/iB/MFT6swItNus3XMGr+is2TjyDAbfdCjWyqYZ4AlG5f7YcRTA40+nrlbkrEC3oxDEO7v57e6AfdG/n/SoIGB7O8xu4P6bk5+DFLMOLiF9g+l+xHSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096877; c=relaxed/simple;
	bh=rCa8o43PCU+Q3/Q8/g6YbDCo6E6p7FBCgwy8cSfadu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gjMwRhPtvEnZOZqX84QspyTMM43q0aC0vUj3XBH1+1a/DOnWs1mTOwkdcAmep7eOaPHIybOMdeUcQDWQ4X79qhYs/VGBy+CME4VGoysM9URzlS7aDzxKTFmab2hWoBN5zozsuXk+Y20LQLGTOlbpJsCoRw8Q1lI8zELJoqWqZLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=n3GEVPJ6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="n3GEVPJ6"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso34152425e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096874; x=1744701674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6wE8TQ/kC5Gw6LravAsHxdU7HVea2/Xz35EGN35IBRE=;
        b=n3GEVPJ6zWSCmcsYKx7yLej8EQLOsVJ1OFIGsodl1geSBYtnTz+TbKqFFYAw2eo7E6
         sIx5VA5k9uWxHq6FzpW6jxcBrK4nmyjcWvx+R1l12q33es+X0IKys66J7tTU50SrhIVF
         ffnf16Q6vnPh0+0tYS2VgR6RtwAbLuFm0EacMrejfEaGURpasFX+M9hhqi5wQ+AnFd2s
         pF13QydxKwOLhT5rAFAGXRRJBmrdf9bfucfHGAVMdVa5Yqi69TW5yCBdJ49IeQhUuRvW
         A26hLoax+dqfDbO5l1Ri09GFBwhV0l2bIWMjLElGbgg9OSwG078Qy/cnfxLpv0m47Lk2
         92Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096874; x=1744701674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wE8TQ/kC5Gw6LravAsHxdU7HVea2/Xz35EGN35IBRE=;
        b=LBMKHurW3Obqj2XU7S4qD/dwWK+xssrNt++RL+obZXHan/vlGwL9H+4cMcVuYVTG2/
         dnY2l/ofWAqyvUWKCupWb62d2UDDbT1P78kEj41Xwc4UiZmiuqS2yA1i0uKE4WcDzu2A
         ltACKvjn68JbVWxav+IbECuLfiwWOg0hyfHHfoSRccoN9wqNk5EiRPQkpA/8x0dF3m6L
         NQyHZlKxIlDXalfzDR13C/KWMN9rnrer7AKnyhBtimvyrBNu//bwauaD5lExncy9QxhU
         axgx91ycSFKS87tbgusIK2HlSPOPs9bkxj9b+y+xs4yJtiTmrahiiY1cDIGOKWRypBSU
         5ZOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp6qWdx8lY+/8vsqPMUuTBfYuI/3P2tZlt712h4/qJnVLQh2Lqbud/JGhDNLu898B9g3zgrUGZITfXauI=@vger.kernel.org
X-Gm-Message-State: AOJu0YztKuiGG01CZdrtTuwzLHwqZeQZmyvOumiHpWmgetIpu8CHEJom
	ODxHIUeg1kQw/EMeANrPTC9KKbDSi6Y1JO0vLc9wlYYr6FiUqKWbRFaqb9cTOaU=
X-Gm-Gg: ASbGncujzsSpBBsrEd1Q4bewadWSbHJshx0GN6jqQyUMf0yY0u4BDT60xbAxglcsdYy
	U8H5MRtevg4EronIDUPPrOdsh4xACivmAMAOF4YleecsA7pxxo561SPqGx0tN3o4bFlp1ijXoWh
	5QCGJJjzhE3BqnTwKSn8pCFMJraAn4a78Moap/g5gOgu3P3Cg1852xENBbvmxWhI3K9uuplpJKf
	1y4xSL2n7We7/Ndg20XL7lesnBygOhMprZcqbv0purvDS1aFg1HGWNTGSVyW9q1uSu+aFMuzWEf
	c8pDCdAYCMio5r6oLGLh2vx6YQAhdLlk0kR0Ww==
X-Google-Smtp-Source: AGHT+IGlERrHqVi1qC8FfhdvuV397D2yqL6s1YKuhUH7GEN8bWhP/1UK6ZgmfnUxwxq/O6rNRgufNQ==
X-Received: by 2002:a05:600c:198b:b0:43c:fae1:5151 with SMTP id 5b1f17b1804b1-43ecf9fed70mr120686755e9.25.1744096873779;
        Tue, 08 Apr 2025 00:21:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342a1fesm154404135e9.3.2025.04.08.00.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:21:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:21:09 +0200
Subject: [PATCH 1/5] powerpc: sysdev/gpio: use new line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-powerpc-v1-1-73dc1ebc6ef1@linaro.org>
References: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1582;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=i76qJt+Prqn6FRHBSKnAuC1THRUFVaV9XqqCXjg0eY0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M5mUvt+4lLGPJCp7pGcUJyi3hfa1RzNMiZSk
 SZvUFz9DguJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TOZgAKCRARpy6gFHHX
 ci49EACpix94RiRhas3jBzoubO7P2DaiD1iTemCLusg5lAl2gI8c3y5nVaHmJL1Gjj6vWvQI4Fz
 ifbjRgY/H3TcJ61f9NDS+Rg0PZgEUGamwwyBaUHwh++ghPvV2TQk7sgh843biDJ/svliUX41LFy
 cAWB54sEvynIQ6XKNELIZvx4CHHm5oUdJmLRkRS+EGbcWmmzQMF+/wH6YuZ8B9u4zuGqhuJvyk0
 ygvfj1ao7GWWqOIWex+pJNBhid+tra5Vx8RboCWRFNhS0F4BHjEsin/gCnZNYq3EHfMBEwD5VPs
 qYm1w/Mp0Z/RpgVtT8lj4s7O9BzPRlvbKkqAznjKaS6m0O/8h7WnJMlThB27vCy6FBimgXKax34
 5aDjK+GalcUNKpJDuYQ+2+MzSK1n5X8X+tBBYF4FS7u0UOFIQISgZJ5NcGaYcOgXTww6OSV6EoV
 ryoVFRuGfFpuaA+H203Rq11yvGzYQFUAJPDOkUrzGrLV2aUcahCv+lAXTpwsKn1yuw8YBrz4eqr
 1RfGYuIXMZHdLm01+nyz1/6pFME3V3KXUej4ekjMPuqk9imHyOnFMcs0dQG2GhtBspFHtUNhKO/
 9hy2Ub4uqPQMlrUaQmBxun1yvG/j+y2es37MygmZzk2V+4WDnGOV1S4IatJqadFXi9zc2SQaCxm
 bEe9bf2DxYVQy0w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/powerpc/sysdev/cpm_common.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/cpm_common.c b/arch/powerpc/sysdev/cpm_common.c
index 47db732981a8..e22fc638dbc7 100644
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

