Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7A41E5B6A
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751267483; cv=none; b=in356KfuAyZ9a7j6Qog1BcysblmzFRBsaDGIIeFvhiHMQ8MZu+Ncr4J196IB4xRBXi9msO8h5tMe58ENghFs2Yd61QcXnkmOdDMvzefWv4CAfm02opX/sF4JeeU8jVFuHkHEs5iI9bfr85iGwD7Kgeegll/lRdqGll1gaQdPjOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751267483; c=relaxed/simple;
	bh=BbncrQR33gGTRQBqxnEXDNwRGG/SDwVRLRNPyxR0KV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KOQA7jC7h8cm97RIBMbWyexlTu8TPdGZjZwyPhR7NswUREznaTH6kBxOvA6Cqo/pFNy8lQaVA7xLTpXTS5MPBT5ma06SQK9RHtOxvJg4bmFADCe9gpYTF6PrQf0nNA1JHaGR7zyh0k4sWCAG3l3BEe5kw/635v4lF0a4WK0WveA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bA5XElZ3; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bA5XElZ3"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450ce671a08so10327055e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 00:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751267479; x=1751872279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3M33IweNKB23NoNM33aEFltvshX1Eakka7go5CXq6iQ=;
        b=bA5XElZ3m0oMh5IuOdlH3O2a7rjarrGAbkbNrOlqdzzUVAwctLK2lkZb89fN0uwU/b
         jdTwzQJ+NjWeFOLsF9vxtipMGQC/6UVTYDN8tb+NsFdzw+bhW37ZpmNfThi+nkEfoJL/
         Fc13NAnjDreKGAjbYzFwOdwGLrStlZu0eeVPmi4JxT8bSoC2CYCazveLyGjKsK/drgYZ
         pWGw85AscU6RlbOkQ2fP+xrDBvbIbXivklI6mIvvzLxmDxG9Mg0SOQfupIV0TOuAL6nw
         YRkkFy/EotCqx8qS2MlBBKRUmD5B/7CNCoLS6LTd6RAdKiliOOTnngTGilYZv+RZ0Xyg
         1PWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751267479; x=1751872279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3M33IweNKB23NoNM33aEFltvshX1Eakka7go5CXq6iQ=;
        b=u1m9h3GAI9Nhk4zyRavXiQpeADajTFHYE65iHBgwNAWNHmcSgYo3rOd3yX+VaE7Emq
         Nc7AVhuGZtoPrd5KKFl6iqTMoRU4aYEKLXlgTMSYe7JtIZxcXbOug8XdVRXiaHptYgen
         ATJNicQN8STP7XwouoHwD0jmrTCmMGR56KYePp5k0YMuYCRuXW/t3ZUMJEOPXVd8CoJZ
         oRAD3bPeogcfLlBDYy4daTBcEG8twatYcHZU59z1Gi4ZIkxT/nFWEMZCZeUPdzdSJ+UD
         ZLLxGxyJvhqtKVfLzvlcu5xQ5p3nYGfqi0+6mejjZx3KY3lDUuWJUffU4YNQV5pdUZu0
         Z2Yg==
X-Forwarded-Encrypted: i=1; AJvYcCW+UcBwkVLLys6JdQiqjHeaH/SyzUjT45PPJ7qkbDnBVH9RPph/MkOaTF3ASHKyp0Ab5892rHEzsPzkqNY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJQei0AYZZka3TnEUFXwL82jWclbwGVzTHatbK4tg1j+J25ECI
	8/AlQ3mR3MUPVpVloaH3jBQBMmlxQ2WyCnDqEOrrm/25STg01b5Lh3tP10NK19dwmX0=
X-Gm-Gg: ASbGnctUGlNey4eI7pBFb/N67x1boJFlcmIcJ7vcrOteMk3x/iUvMglYMB1fWzdPb4b
	jp5c4SCjPJUNa2Lei52DpTg5wneerhjAMx/d+ltnkohhBuuzYen09YuAqLvx+QCXNqKJwjTCGLO
	GT1Cm9JsP38Mav+66HoEIVjrz5Mlgt4q5mcmjldM0jLPGN5XVPzW5siwhztGTaHEJlwRYPp2BVI
	Wt4fyK95668UDPLfzI8TYeypTUZX3R4vKfTISRnpONu63wmV5/jfzWd7gFHSQulzMsQYXPIMc1o
	wMyorUwp1F4cdJO3Si5jVBlhk54sLp9vfSf/L+ifhdm8fyn/K7WhrX5Mm7R8nK0=
X-Google-Smtp-Source: AGHT+IG/R7CC+U7ZRabx/kXZa5HP+oumZGvsCP9NRHqQD9Rwf30kvmvGtsy7NTEikbNMBjYRtI/+qA==
X-Received: by 2002:a05:600c:1389:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-4539b3f67c8mr54429725e9.16.1751267478977;
        Mon, 30 Jun 2025 00:11:18 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:19e3:6e9c:f7cd:ff6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c5fasm157989535e9.8.2025.06.30.00.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 00:11:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Drew Fustini <drew@pdp7.com>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] pwrseq: replace magic numbers with defines for match() return values
Date: Mon, 30 Jun 2025 09:11:17 +0200
Message-ID: <175126743944.9502.1874026392338721581.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
References: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 24 Jun 2025 16:32:17 +0200, Bartosz Golaszewski wrote:
> We currently use 0 or 1 as magic numbers returned from the match()
> callback. It's more readable to replace them with proper defines whose
> names indicate the meaning. While at it: fix a build issue with the
> thead-gpu driver I noticed and extend build coverage for the drivers.
> 
> 

Applied with commit subjects tweaked to say "power: sequencing: ...", thanks!

[1/5] pwrseq: thead-gpu: add missing header
      https://git.kernel.org/brgl/linux/c/5bcfc4ef40dabcd16a0b736fea7f0d00a9efdbfb
[2/5] pwrseq: extend build coverage for pwrseq drivers with COMPILE_TEST=y
      https://git.kernel.org/brgl/linux/c/1a7312b93ab023f68b48a1550049a4f850c2c808
[3/5] pwrseq: add defines for return values of the match() callback
      https://git.kernel.org/brgl/linux/c/62b5848f73dd4f8ae17304dae54562d0c9ecdd3d
[4/5] pwrseq: qcom-wcn: use new defines for match() return values
      https://git.kernel.org/brgl/linux/c/f698155029efc708349126c8944fa8c95b28098c
[5/5] pwrseq: thead-gpu: use new defines for match() return values
      https://git.kernel.org/brgl/linux/c/385b735c90ae44dbde65fab76e356a96ff8f67be

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
