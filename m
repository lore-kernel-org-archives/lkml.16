Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD3A23FC58
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 22:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738882122; cv=none; b=I5MN274oKAfNnh2MD7gUS0Bi5JthpLZwz87s/IKr8SbOzurLedM1s0wsAjvn2/GoL4VgqeDoirJZCIhYgCptnsymRJAouEmQqqvWOBWfmWKpcWLI/KF0Z4Ab6ym+zhfY4Nt5cJAElgx8XAPj9MVDzyt87nrBNkYSzLIfjpaB//E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738882122; c=relaxed/simple;
	bh=SREiuK3L9rZlfmn2CRPkgp1zixwI3ho4VDIygOej2Dw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=djSdRIriz5xqG7dGmT+HXZMGlylmdxajitBKXlyBZjCmYbeoQLLe/SZa8mCQsR9ZPc88xDwccoqS7Uq4mG1XJAdYWeXMnh52N+XTqFvX1ZaWK4ns2cGEa3jbTf5IxqvsE6DI5E5JdIf8hiJ+jJ0jJH871Sea+Jimo9h83K70gG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3d8s6bOu; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3d8s6bOu"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-71e10e6a1ceso461106a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 14:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738882119; x=1739486919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zrl0lG0s99SDBuGZ/+AcMLJIAJmPLy1NCd/dBoX8jU8=;
        b=3d8s6bOucWMdaoYvNt0o9ANhpGoZ8C427iKTKgI76bTHXp9+xlOcMknn6M9/irBoHV
         nksFkUy5g7dk2r+aT8r5Wx15FhnIPzzraKfbBSWHmfzbJ+eUY3B/pY56TQU2xouTA2LN
         Vr+dhX50lwrQrCydJKGi0eQuZXeXfCm5BYc3W/Cy4BvTMCozQ4iImUZ5VfL403WpkJmG
         +eUzou/GvavA8Zh2VtAQmAtBgduaJd9HFjMyCPE9Fm6iy4wic4oDzhZJC14LWYjdn/Qb
         JFVxWz21CfUGF6uZwXo0357IZHuLwyMGehza6M1gc5KXCv6L1kz+rrw+kJrP0vLjxP0Q
         3TUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738882119; x=1739486919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zrl0lG0s99SDBuGZ/+AcMLJIAJmPLy1NCd/dBoX8jU8=;
        b=obUss9TP9gawlK40/uqsE0NfroXYyQTPMNTbqsExp7IPs8Tk2khb/qRYx9zzv59heX
         oYkgAVeMRtkHafXYxHwopU3dZtkDUoK/hU6pJxfFr1KY2UgBpjPQvCfrwHFNyr21tcLH
         H2O0t8nltOutG6jVPfTDnGopz0XGt0DW3nVZgTbjvm2+htzzC2wvBnlu6iMSw2Z9AHdp
         OiGFTrVFYx2uaOK60vqzpxkjok/YUuI/OEpJ1C4Beg2uVZjU66Ah+g3y1fr9FmHpZimR
         Ih+FKlgPN3ONCyjnBpeBvm8ltQ0pOar9bs3M/r7kc8nQUnNJsj//gAXCsfWlsYLMhdRc
         vC4g==
X-Forwarded-Encrypted: i=1; AJvYcCXsx+KEYm3RZWHkyKlY6qEmY95bvVymrJVsUH09lHFsOu0uJfmPYjrogov9IxPC5mjvJw7JHueSeqkZP7s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwwPwYph12sCJEeMdoCmahyo5veZoCScsolS5O4Rip/oMDj1gx
	NjewyBahH/UnAzwnELywU53/LOMazL2c0swUk6c62NC/8IpMvswrpEqlgALnkkQ=
X-Gm-Gg: ASbGncsU+VyYC/DlvxEZBufABn+9nhk3UNoCUOJQDu3Qn918JZHqiUpp1G6Gpt+8dlH
	gXMV1g++wOOOjcaZd2iuyRjmUMQH7SkNfuJBbdWn9/jZ4/+UC6z6CUbyMGK2SkgCABB2GxH1VyX
	UaAFknqY6vayrqmU461z4mAUk2HTrTKiPu2z8EZI9W5YmMUoxpeurLG6m0NwxPzf/F8l0PDkh/s
	8+7/b2RCmUFxYuL1Q0KwSwmyEGRNb9zIf5qbmybM9FyNpaRQOi4G6uUogisrXPqGiFyG4dqe+K4
	0R2Fx7LYWPIHt5j/O43Rg1Bs8p+UgY4/AEFZ58GEvlDjzm4=
X-Google-Smtp-Source: AGHT+IF6EkhBBGtZyNdnec2UQucqxt5fakVdlz2IO8AnBCKVXc9lOTpKIIPxZD3f0MWNAAb4im2E5A==
X-Received: by 2002:a05:6830:6819:b0:710:f38a:191c with SMTP id 46e09a7af769-726b87c732bmr566366a34.11.1738882119510;
        Thu, 06 Feb 2025 14:48:39 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726af95bbb5sm510986a34.41.2025.02.06.14.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 14:48:39 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 06 Feb 2025 16:48:27 -0600
Subject: [PATCH v2 13/13] ASoC: adau1701: use
 gpiod_multi_set_value_cansleep
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-gpio-set-array-helper-v2-13-1c5f048f79c3@baylibre.com>
References: <20250206-gpio-set-array-helper-v2-0-1c5f048f79c3@baylibre.com>
In-Reply-To: <20250206-gpio-set-array-helper-v2-0-1c5f048f79c3@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org, 
 netdev@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-sound@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2

Reduce verbosity by using gpiod_multi_set_value_cansleep() instead of
gpiod_set_array_value_cansleep().

Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 sound/soc/codecs/adau1701.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/adau1701.c b/sound/soc/codecs/adau1701.c
index 291249e0a2a32df7dde81904dce2f6be143fc2d7..6876462d8bdbb41d551f776c2d7fe6ed46115fa1 100644
--- a/sound/soc/codecs/adau1701.c
+++ b/sound/soc/codecs/adau1701.c
@@ -325,9 +325,7 @@ static int adau1701_reset(struct snd_soc_component *component, unsigned int clkd
 			__assign_bit(1, values, 1);
 			break;
 		}
-		gpiod_set_array_value_cansleep(adau1701->gpio_pll_mode->ndescs,
-				adau1701->gpio_pll_mode->desc, adau1701->gpio_pll_mode->info,
-				values);
+		gpiod_multi_set_value_cansleep(adau1701->gpio_pll_mode, values);
 	}
 
 	adau1701->pll_clkdiv = clkdiv;

-- 
2.43.0

