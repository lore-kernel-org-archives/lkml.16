Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA27283FD9
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543839; cv=none; b=sYfo7FtT6Oh+1v4f8e1QCF/ZxRpCx/4C/39yHXKJfuKsC0wflDS/Sfiq0dQ37fcudYLLdoviUHEyonD3ZONKFnLyOp6QqzT46jrqdxly5kdFvQX+HlLvXunYpGIV/vvyKGNSLhzRVS7bjiChJ0e3hY2R9+4V3TOEwo+NVJNzRDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543839; c=relaxed/simple;
	bh=yyhzPDdF8NeOOeZr2SZOX9HHHQ5D7bOqPKd37iQiSFs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qyilbDhysdE1VnggXILN4D1OcTzS4NOliXcMEre7FvHPwRDj4DB401oUgz10Z7ToQkGfdp8LBYrXFlG327+27qMjGmUfQLwBO+YVK/n8CJXdHV0mkyT2S521vOaPw19PiEvordKSD9TxW5NaKEFi2/TcuwmyL/6gVr0g0i3gaM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hEZC9Q1T; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hEZC9Q1T"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4eb4acf29so648479f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749543835; x=1750148635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9WGI4IbP//61XrnIlM+natAC7ecS9zG4vex6G78gZY=;
        b=hEZC9Q1TgiXTu95oc+6NtCo1BRbnOHrDqPXM+MQe97jPplFgtUdf13p/+l/jivtpqn
         AVEQjBzDe0FJXPE6Qt6a8uqrNr2fPd42ABmxo+Ea3b2F/O2bpgYVKdN+pbeS5ePPw1cm
         akKeS/vsivEpT4A4OhOoE989960LD37RLNNrych+3AkFBsAUaYDYEI8fWIB+kyRCdOYs
         LHNItha/qRFBQeNZEdhYjhtgiFYAGupfM9a1F8cMJL3gN3y8zWcjShQ6qS+/8UxWnLa0
         WdUy5IvMd8OPHPs55WlLsoulOhhLt1FIAQwpR257JdBImWFyg/7ZWBilWCccOvj0herZ
         M3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543835; x=1750148635;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9WGI4IbP//61XrnIlM+natAC7ecS9zG4vex6G78gZY=;
        b=hcE1uy0L4VU0OPvs8xTdmZ2fj04Fg/Bf4fjMy3+oqaIz1un4atl0GOv/HDd/+QSK9A
         /69aLTitmJMIqTsM8lh8RSEPCR524uQrSL62610IIOs+lsWuCJww9/zC1WW46wdJ03c1
         /fr+rDjEk8akiAyOLh2Xe/zfIeTyJZa8lfwbunzZKwraIJHQi/UShCqoodniYUrj62bg
         t82JFS29mijeNSr/Ievxln9t+0a43Omm8YQWdXbW/8WCz9Aw+2CC4IBNw7gK+WDPaNdx
         2awm/dG4KU6oFJmpMb4VJxVkIVv9bR+JBQ/UFYemEwtKT8PAw5AGzyWM9397ozBi7Uvy
         tDMw==
X-Forwarded-Encrypted: i=1; AJvYcCUq7YC6DYDiipNIXrs9JUYU+VaegerTWXduQGj1fpFvZPpmNH1hVKa7eIi3xi7UzzQEIubT8H0Xo+5A5qQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy53AEerXcZVlDAYQhIRHif2kzIeJEspQEnd0PoNQJmjbpsjeCd
	9TexqwbaF70uBsHKpxh3YUnPrM2VSlLsY8vR3KXmfMnZUMDmezV8m/xVKK/arH6wwxA=
X-Gm-Gg: ASbGncsoIB59ShcEkBdQdEYsxAcl5/4VIQ2nwgEa0YDzrtC8KQXNoBO1wxZsIyz8+Md
	IQxIZEMkSd4mL/oLj+OF+ZXqAzMdexeF5cLDcrEicdoHhirNYQWITVCN6MLAt+yNMdNJ/+8lf/x
	zTkfH3Z736besNsR/+CC1JhR/Eo5PdwbinWq9HuX8OECnaXbLxej8wpvsVY9pg7UEx4FOm343rF
	onXjlMkwTV+FNRZvDNlISuhYyxJNeFWWZ4XuUu1DIZE2cos83DjDUHEBnXBkSJZHNsDayt9cWbm
	pUE2MKg/80xGrSq7DBANDS53Yn9ZKyIm64NpwHJ9Drl4Qx3ujP+ADVrhUBURC4vjlaP436AzUeG
	7ygk+qQ==
X-Google-Smtp-Source: AGHT+IF3umgoC1MXVewYqSd6NXb0BxRbXdgsSHg+n+0cmqeui+0FYUC+7otmqctsYZrl7Ig6A8Aq0g==
X-Received: by 2002:a05:6000:2409:b0:3a0:782e:9185 with SMTP id ffacd0b85a97d-3a53313fa5emr4137414f8f.2.1749543835438;
        Tue, 10 Jun 2025 01:23:55 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532450b08sm11378980f8f.80.2025.06.10.01.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:23:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
References: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
Subject: Re: [PATCH 0/3] clk: samsung: gs101 & exynos850 fixes
Message-Id: <174954383375.117835.6950854237763688291.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 10:23:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2


On Tue, 03 Jun 2025 16:43:18 +0100, André Draszik wrote:
> The patches fix some errors in the gs101 clock driver as well as a
> trivial comment typo in the Exynos E850 clock driver.
> 
> Cheers,
> Andre
> 
> 
> [...]

Applied, thanks!

[1/3] clk: samsung: gs101: fix CLK_DOUT_CMU_G3D_BUSD
      https://git.kernel.org/krzk/linux/c/29a9361f0b50be2b16d308695e30ee030fedea2c
[2/3] clk: samsung: gs101: fix alternate mout_hsi0_usb20_ref parent clock
      https://git.kernel.org/krzk/linux/c/ca243e653f71d8c4724a68c9033923f945b1084d
[3/3] clk: samsung: exynos850: fix a comment
      https://git.kernel.org/krzk/linux/c/320e7efce30e2613c2c7877acc46a8e71192cdcd

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

