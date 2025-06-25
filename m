Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A412877F5
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865839; cv=none; b=nRw1t+IrGxmKO0Rzcqv1mSnh63c9tIQ1x0wXZPeMLcRKOIJJ5ApkTCzXIrf+Yat7cBQjmd8QBqtmtEjGTWxjzlfxLYiObyd4/9+sEHijXo7NsUiDGZpNkYNuLFydtI2Rmoid3BSYAORkXicj2uqRFsJGiJWPOo+g386qa5vg2p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865839; c=relaxed/simple;
	bh=yjqVnElvLhbz4DdRAKnBfuhl/bLIZJAgyllx9k9B5Rk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f3Wy72X5Fiwby5CawSTct4JH/MnaNGq34vK/exVu8of25Ib7m7Xgi++uBkWPRziA751gHhHgGu69w9dOD+nRgzdSnEGyDUDJaY13lTVoEGCLBboA2eeS8fh/vwNMaV5f4XRY7zGwJ4+o2qLEFL2+E1KezhtgW/Bb6ayPqqPC43M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qVHkq5Ux; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qVHkq5Ux"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450dd065828so15341215e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750865834; x=1751470634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hMA8eNGz9CmY37K3I8dXArzy1BZrOLOrsNjDvA/YF6U=;
        b=qVHkq5UxLPh9tLIKe/24+eU2pmTaWyfSY/MPJ/wiDj0ZzTZu2AnUzRG1ppFrAt6hq6
         btwr2GCqhMa+Ve2kVQCTb5Or+45mGKr2JAfHKqpqlXhNElMvkyUlPk2NSgJjzU5PwH0Y
         8FwgfunRqU/dqlGixBHNMOR9qBsf1ZQ0pNs9a27CQoGwjkL9VKA0hV4O4e6dt8Tqo1jn
         aDsj9HWF/9gxCxSMFcgxQNWpTxc8UCnAHE2tWeSIRB4izLJUEO2yq7Z3DClKgjLL89Im
         GQu9DotgsN+L+aERDqkTb3ITe10F/3ixkh0QEw7Y1DwQqJIo7bihhKCJt2KuyW57JRoq
         9rGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865834; x=1751470634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMA8eNGz9CmY37K3I8dXArzy1BZrOLOrsNjDvA/YF6U=;
        b=t5M4jpMtUB1z07j7YT1XnwWeQVu2PNZB3lMO6Wo/57h8GioQx26zLrIRxaPexYWDHC
         d1lPYjyeMMhrDfti6NwYcikST9wiLnnYPV8WtlqgKZ6Ax1aOzK7Qqw/P0iA3KHMzo3vv
         BiudNilBjesgeJfl9bfqsyIvgW2voSBPBzePlW1n4HN0fVr37fElfteWPfVLhhMEPS/q
         V1i1bKZ53Qlm/UjarmEA7Y7EbVvGGHNPDZ51k8HCrGgWC1MIezfjF9CH7Msh//kMcU8a
         hPshVlvQlkSsiZFL9xP3HAUpciUTYul46YQ+PnR9efxCsP6OTHZR/JH72Z/Q/fvd63/S
         F8tA==
X-Forwarded-Encrypted: i=1; AJvYcCUrzc9/LLRWDXRRjzynqjf1y8xzVh3bCavJlkrkxbCbRNKqDUNFMjbGw5sX040QEblWKFFLZDOv4dcyaKE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWprtatdahwk+4xtm5FXpO4PbfW+OAhMCCcPalEFjc5CU5n0Rt
	GVUqfTG9l15WiCHoivugyMyIHur6ouMQATlWR1FBM2a00s/zJ1Mvgn7miQZbX8mLL1Y=
X-Gm-Gg: ASbGncuV8TIn5hK2dQXb10vrP9sk42nfNp9JGzGH5RJLg7fmSkQt2Nu4z0TfY4QGbMi
	vQjEcOLHI37uCk+b0LksNmqTpSZu6QO4jHL2MHDzegCWyYyOZONPJynbWKX5PmGSz3yKfYV2SkR
	qBQIGGia+rdK4GYigoHlsaZWOBcodNNO7aNkiF5sFQn+61/ZhjcPOi79TrhULn5xLk1sdnJsZOO
	KjbmJspoMUCtR6AEOIrv4t6DCvThvYwETpkwStC+ujEAQUsz+7prHG+/++9RboXU+7X3cH3hFsC
	wb2Lv41NBm6JQy3euoTU+cJPSYuotLEAMr/omtlfpxxlZGilUpzkB9Pcny4ti0Y=
X-Google-Smtp-Source: AGHT+IEyAQy2Weocb3F2gHn0O7zMxxg3OozuxdDTX/kVYZzfMZiMFU7kb1Dl+HGzXGygVB96lY2BQQ==
X-Received: by 2002:a05:600c:1f91:b0:450:cd50:3c66 with SMTP id 5b1f17b1804b1-45381b06235mr35839895e9.29.1750865834126;
        Wed, 25 Jun 2025 08:37:14 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45383576716sm18793245e9.12.2025.06.25.08.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:37:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH RFC/RFT] pinctrl: qcom: make the pinmuxing strict
Date: Wed, 25 Jun 2025 17:37:11 +0200
Message-ID: <20250625153711.194208-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The strict flag in struct pinmux_ops disallows the usage of the same pin
as a GPIO and for another function. Without it, a rouge user-space
process with enough privileges (or even a buggy driver) can request a
used pin as GPIO and drive it, potentially confusing devices or even
crashing the system. Set it globally for all pinctrl-msm users.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Having discussed this with Bjorn and Konrad - it seems the consensus is
that it makes sense to set this flag in pinctrl-msm. I'm marking this
patch as an RFC/RFT as I'm a bit afraid existing use-cases could break
with it but I suggest we give it a shot and see what happens.

 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index f713c80d7f3ed..b78492dc05adc 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -293,6 +293,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
 	.get_function_groups	= msm_get_function_groups,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
+	.strict			= true,
 };
 
 static int msm_config_reg(struct msm_pinctrl *pctrl,
-- 
2.48.1

