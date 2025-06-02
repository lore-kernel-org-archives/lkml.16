Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA6920FAA8
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 11:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748865550; cv=none; b=YFWIE/HpimTwgE4MArIDORaWYidF8auMMgMVu5KpHxQNSDz8QQvvprvPthrm5kZM++Q1VZTpbfE+ckmWIAQ3vYrXmojD1ffIsb8Cj/PF/b3TC/VWecbJagq5zQDNUmKVf8SVQ9ThoQWagIscwKVGcB52OhbGkApxs5S7FMbbJ2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748865550; c=relaxed/simple;
	bh=csSdyBiGbdS0W1mFbOEKsySlk/j10aPNku7jHZHS66I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Jfr/ww6vpRL54LNG0ejWoFHGslhp4UTx5YyAae98jgGXPJoEzniyMjOByMhH7NTuv59YrAJSNswSrSzN2eCDxgL/aB1kkabyetxZEQvRCCl3r71wkV0ronWYxRP0/yMBx85+tLBIB8jHepf6uNfall4Rz4P3NnQkjWNFBJ9/pd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ppIH0tx/; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ppIH0tx/"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso280002f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 04:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748865545; x=1749470345; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nc1KW/2KV/6taVcMVu/ddDJOUA42qnSt0fYjiD5ShkY=;
        b=ppIH0tx/vYtlt5iK6w4qt3J6553kAD9vk/6Az+yAnoHVlKjygVvIPp96MDvu6Fs2+Z
         GP22fL0fA2FCoW8+vmX0xKRO8/PRK4UuVG6iZ7G398Pa+CSgeErIUXZ5A7NPtiMD/AcJ
         ZuVKtgNW8DCaRVDKfYYQpIp2tmHmslT0Y6s+mdfruBAWnueNbEh+s942XYk2z9vC5Iyk
         +/u+I7E9+JaGYl/J+/W5DULkR3RkER9XjTtVJ08PVEPw2aWGfYs0fu3cXDen2pmm75Jh
         8F80EY3d/XRhohH4XSzMWWir7T00PRP+sVlAyhO4tQwg1DQbJVpoocw8jLn8lk8Xioic
         vSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748865545; x=1749470345;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nc1KW/2KV/6taVcMVu/ddDJOUA42qnSt0fYjiD5ShkY=;
        b=f+TjSKzxbVu+11N8vouW04eqfdeToLTzA/sWDZ1FrjebDBwXcS11nDtLDdGZGqKsTG
         7Ks9qDhEpwaie3jAfRcl/F9nmfdwwCtdUwfNteHaywbJ9qlDEKelBqvItwjpOT/MzLQu
         XeO49xVK8GVtKmetIcHQZqA8cCRftU9Pavy3yEZCd56v7Nu4UAGZ74XwaAQFFT3hkvBN
         lQWE4/TyHo4aLQc/xnHxqFMHzg/+8gVAW1eP4EQpQJsOmUhEtDqs9JQpy2lTV/q7rw7g
         JnfNKyBfDT2PjcpPlBdFAW9uKJu/XB3DDyPumWVrH6QhLjzzD3a/sCearEV+fyl+lzIB
         GPAw==
X-Forwarded-Encrypted: i=1; AJvYcCUlwocxvYKxnkMVtbAUvHTTu/+lFEt+YO/jneNhT/09d9Gr0Zi8R88L5FPAZhAjijc5vI0Oj9glSkguYTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWOf7C2zmG0hUIIRRNmGK3oECLbZU1To6yq40ZIs4/jbUW/jy2
	x/O9ecg4Q8E3CJGpiExRcH7mcb86Tn+yhaOhKzg1k1Qe1y6vvkygkAYszb0ifYMAeM0=
X-Gm-Gg: ASbGncvxWJc9QyFmVfdJjPbYn5FESWwfmVBQVtbN748hMxpLa5j8Gy7WbtSJGjSnf3+
	m7c0mJ+zBxPZbNovlwmkPnaVaeN7vH+Y0tpGhkzsJHPLFrnhoFi1NI6m4z4c1VdocLLsKdt0m8P
	8ntBq4gxakoE0rE+LYC90rEsxZOhq+ZptzrXW3GUnQLQlRIFI5awNLgqPdTOEkCynQOZW21xvu4
	ndfW63/+qTIwYw5n1KpHOPwTdXXIB+hwdm6d8GixPZcIY9MmIwm4vLBa5hjB63N5T15T8664+gv
	jeL30CUc3e/1mWw/s2y11hBp9j4w99Z2FZeGzMvkB9FDDMd7mNU=
X-Google-Smtp-Source: AGHT+IE4pjLyz8ghL0TgsAhNpn0Ghf0u7RoeYit5QqJnyA4Ap2fVk8z+2nDBKdd5+JiWOxBkr//AIw==
X-Received: by 2002:a05:6000:1449:b0:3a4:dbdf:7154 with SMTP id ffacd0b85a97d-3a4f7ab1311mr10695797f8f.54.1748865545440;
        Mon, 02 Jun 2025 04:59:05 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:f076:bb08:db3e:3647])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4efe6d0dbsm14317402f8f.40.2025.06.02.04.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 04:59:04 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: add a clk_hw helpers to get the clock device
 or device_node
In-Reply-To: <20250417-clk-hw-get-helpers-v1-0-7743e509612a@baylibre.com>
	(Jerome Brunet's message of "Thu, 17 Apr 2025 15:44:21 +0200")
References: <20250417-clk-hw-get-helpers-v1-0-7743e509612a@baylibre.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 02 Jun 2025 13:59:04 +0200
Message-ID: <1jsekicq2f.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 17 Apr 2025 at 15:44, Jerome Brunet <jbrunet@baylibre.com> wrote:

> This patchset adds helpers to get the device or device_node associated with
> clk_hw. This can be used by clock drivers to access various device related
> functionality. The 2nd changes adds kunit test coverage for the new helpers
>
> This patchset is the v4 of the series previously sent here [1], with the
> amlogic patches dropped for now. I'll resume the work on the amlogic
> changes when the helpers are available in CCF core.

Hi Stephen,

Gentle reminder.
We have been stuck on this for a few months now. Could please take patch
#1 at least. There is a significant amount queued on this on and it
would really help.

Thanks

>
> Added tests run example:
>      KTAP version 1
>      # Subtest: clk_hw_register_get_dev_of_node_test_suite
>      # module: clk_test
>      1..2
>          KTAP version 1
>          # Subtest: clk_hw_register_get_dev_test
>          ok 1 clock with device reference
>          ok 2 clock missing device reference
>      # clk_hw_register_get_dev_test: pass:2 fail:0 skip:0 total:2
>      ok 1 clk_hw_register_get_dev_test
>          KTAP version 1
>          # Subtest: clk_hw_register_get_of_node_test
>          ok 1 clock with device reference
>          ok 2 clock missing device reference
>      # clk_hw_register_get_of_node_test: pass:2 fail:0 skip:0 total:2
>      ok 2 clk_hw_register_get_of_node_test
>  # clk_hw_register_get_dev_of_node_test_suite: pass:2 fail:0 skip:0 total:2
>  # Totals: pass:4 fail:0 skip:0 total:4
>  ok 17 clk_hw_register_get_dev_of_node_test_suite
>      KTAP version 1
>      # Subtest: of_clk_hw_register_get_dev_of_node_test_suite
>      # module: clk_test
>      1..2
>          KTAP version 1
>          # Subtest: of_clk_hw_register_get_dev_test
>          ok 1 clock with of_node reference
>          ok 2 clock missing of_node reference
>      # of_clk_hw_register_get_dev_test: pass:2 fail:0 skip:0 total:2
>      ok 1 of_clk_hw_register_get_dev_test
>          KTAP version 1
>          # Subtest: of_clk_hw_register_get_of_node_test
>          ok 1 clock with of_node reference
>          ok 2 clock missing of_node reference
>      # of_clk_hw_register_get_of_node_test: pass:2 fail:0 skip:0 total:2
>      ok 2 of_clk_hw_register_get_of_node_test
>  # of_clk_hw_register_get_dev_of_node_test_suite: pass:2 fail:0 skip:0 total:2
>  # Totals: pass:4 fail:0 skip:0 total:4
>
> [1]: https://lore.kernel.org/linux-clk/20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> Jerome Brunet (2):
>       clk: add a clk_hw helpers to get the clock device or device_node
>       clk: tests: add clk_hw_get_dev() and clk_hw_get_of_node() tests
>
>  drivers/clk/Makefile                          |   1 +
>  drivers/clk/clk.c                             |  12 ++
>  drivers/clk/clk_test.c                        | 215 ++++++++++++++++++++++++--
>  drivers/clk/kunit_clk_hw_get_dev_of_node.dtso |  10 ++
>  include/linux/clk-provider.h                  |  26 ++++
>  5 files changed, 247 insertions(+), 17 deletions(-)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250415-clk-hw-get-helpers-c2344d404f3c
>
> Best regards,

-- 
Jerome
