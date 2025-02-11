Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDAC1E7C28
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263546; cv=none; b=FQ8k3TU7r8tkHCJGejFrDUlq1G0fRoRs87DSKitiwm8In2RhNkmkG1UM+d93QaNiM5UjZpPl1iUueEfbxmr1WMcBGneNCG2sUtd7yf7ygwxoxkjQ4k4oQXt+LLesB2iE2ehIE4WlZDt7UiU9/NHeqHEG5MfLNZVN601rDOplJ+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263546; c=relaxed/simple;
	bh=81BIQZ+L2Ch4Nlpf2eDVFnu52Ewfxa2CaawfkZdW9QU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q7ZwFsJQHN125lOG/hyZ5yHb4f+LDTmgQ3R3X6ooHPM7dENu635sN8jXZa8fEdMGDUZFKa1/nJQkJz7GCOcwuGFZV/Z7WmeOHnlyMlM6+XYRoc7+08FgtcPwv1Vfrz/DlKjJ6pL9CIZnzDSJuMaMQ3//yTO0tBzWTf/agvBH8k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kkV2Oing; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kkV2Oing"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-439350f1a0bso16035245e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739263543; x=1739868343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9d7922w6HvmLNtdn/s3Y8OkZGdDlZZOo2h8DhGQAboI=;
        b=kkV2OingIFhU4n8O7bU/hNskzI0D+wK+SjMIk+lmrwaCgRQ7/EOfiI26zporbzBfVb
         DIXnfi9rYjVdjbiSoi1aKjCj2++m6Y+MBpsuyLsjsy8yq6tEGsy/oEhVVUhQ6sCC+t1z
         2wFwwwlosd29y9Kp8PhHwDe3b5FBz+vkQe0Dv+DoGsAdYec1NZ2QfyQyhgoquVfDoZ74
         7ZPEkOivx6znxUEMODXrdplXlOKzy+BmbUIvK16JzweAEHTxUGCJL+3BhhzwjD1P5ztF
         DlCjTfyeJ9bUly2vBk/Aurm3g/0Yl/PnVo7f+6foC3j/Cf6RcZ7nL2LPYYQzganQ5U4B
         NOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739263543; x=1739868343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9d7922w6HvmLNtdn/s3Y8OkZGdDlZZOo2h8DhGQAboI=;
        b=ezyQMb1LJ983v3yfPDTmxoIntOUpPDZHPSm9pHLWNLPsVczNLqwJoLKOQt9w1gSBOT
         WfLT+GSJVaDkW99KJE0NVeqIKG9GyOnHzueLCezYzgDpnngAvnBr4iTU8eKXKHlAGiRp
         fqBfhwQCoq4w9/sknHa06z9VGyoCf96Aa0u85Mw4fPJ8PpH40abUonKSlthIf7J5wfrd
         uBjpYMoPPR6V9lhYZa3ixC8QMHiRitpcUpBx84UivdJG5D5qHreap4BvXXxmA6VsKNf+
         shZBuhKcM7wcr8rklRwcCMohH3SroL3RrWsvhwe7cevPTjR5B2+VOls/tUvECXY9zsnZ
         XEVg==
X-Forwarded-Encrypted: i=1; AJvYcCVHveHrDintSW0HTGbD62Fps/Z9H5XBVOkK/mhORgYi1mN5wt6EC7dEn5B3VJdrCl0DHlzoOuVXQTh0JtA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSk0jq3wmVQVzek5bW0EDjqt9p4p24BNwPmvWXcFAUt8VsWKD9
	Dhe6Pi76v9KMwTTgy+uTBjezfVwYvFBS2SrnxZ6bRCrZ6OkmbnzFiQH1843CEVxpvKgLHKMJVG3
	xXtA=
X-Gm-Gg: ASbGncuOo0nuG3iCmdjH+kr9+6jBWMLbxD2bT/lXWEO2cQIPIpdw+1MSgoyl4pIjXLQ
	sayZ6SEdSCD9wm192I2x0hjFiCFI+aAQBiQbtJqJEgc/FwV5ZYVZs2M9O/3V0J3W3P8AtEl913/
	MIM7A6z4F6cMraBxtZEieGf+AA8G6/o0axzvN1/66j8IhxR3UPoxr3FtuVywYxbqxG4luYIyIFS
	RDQ3sSBz2Efx62FjbIYfCKkXh8vRDNaz2D7wqU2ekz/6lB6SVDVKYG+C9eoL6g7RNUkgEF3leLm
	429GQdJubII1vA==
X-Google-Smtp-Source: AGHT+IFXJ0r2yebE99B410tw3/63I9kwAbNgDKK2YOK7VmlZreYyxF70Qh69gndHZ9U2mRTCFlj+wQ==
X-Received: by 2002:a05:600c:3b23:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-4394ceb0eeamr20266405e9.3.1739263542886;
        Tue, 11 Feb 2025 00:45:42 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43946bff4d4sm46216755e9.3.2025.02.11.00.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 00:45:42 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v1 1/1] gpiolib: Even more opportunities to use str_high_low() helper
Date: Tue, 11 Feb 2025 09:45:41 +0100
Message-ID: <173926353972.23713.2175303106968169247.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250205112936.575493-1-andriy.shevchenko@linux.intel.com>
References: <20250205112936.575493-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 05 Feb 2025 13:29:36 +0200, Andy Shevchenko wrote:
> The one of previous changes modified the library code to use
> helpers from string_choices.h. Nevertheless it misses more
> opportunities to convert the code. Here is the second part
> of the conversion.
> 
> 

Applied, thanks!

[1/1] gpiolib: Even more opportunities to use str_high_low() helper
      commit: 5f05e9194ada5609edbefb542c0dbfdbae984958

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
