Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8131C2550B9
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747031907; cv=none; b=sIiqa4puOngTurAbISXMjyNMkgwQc0tB+c3snl4D2tXGfWTUswT1zVgFqcV1nP0b920Ef5pQwVIRfQxMlxM/uCnqI+/USNJipL9OVQq20TMHtH5nnGwF/QbECBP0WQXAKGvaLu01kgg21LIljR5otGEH8MnCN2CtGIpqiFv8/hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747031907; c=relaxed/simple;
	bh=k6nyCIyilz7zfov4OFEUENE2DGQbjDDdPx3tbpfgW8I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AcBknk9Lkf+/RuHLPRgkJ1FXpM2HkEXx10FH9a2OaYtwBde7uAAnJfzXpKDe5lcJj4kh+4WDQlKOMMTRx26ahO6727Ec61E5Ep/lvPCRHACjrlOrYlPPAP582vlyGNmBg/un5MxpsUZwS6NuT9wQSP4CWvrsKSUUfaSVNe5pjKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vi1ZC6bg; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vi1ZC6bg"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad2407f6499so37296566b.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 23:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747031904; x=1747636704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gs9qjJWfXtPIqCNTFhtaejIkA6pnbjDMF0lYDQwceAc=;
        b=Vi1ZC6bga6JNi66kFjfQkulQJxezhF7ZoHiOllcNF8kI/aKLTyf87pw59iwMXXbKQw
         RcRc8OXBu5LN8u29i8PxqRI0TETmyvxJ1HinuDAYXAcGmN1qx0pl+BzKevgqtT0DOOJw
         crU8uyi5/+67Gqzk9edMcwvsBO2P5SR48n0PVJsB37mgFgn+Fr5t0mLuS2CRrH102vra
         Fj2u7+2/HVxkfFV1Ejaw7+KTKFvbZEVsSIb7DlKGai2rziERt/UNwKzxXAUElcULa4GT
         6Bwj3BxeYC5GcnknKU17LpSwyvX2+tJnU8BnYH6s64LpemCKNGdN8qiahykoexxXLWA/
         BzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747031904; x=1747636704;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gs9qjJWfXtPIqCNTFhtaejIkA6pnbjDMF0lYDQwceAc=;
        b=HqN4qMVza3+YhSetW+CnVAKw+DwZWGbqWHpyqq/9ezj4fdl1qZ4oLR6KAyA+aBoOQc
         Kaw2v071Ll6VmnOapYFnnLu10UjVYCTeWUbtRaoT6f3Hx0jJFT3J1OdE9UmqJc5Jd25A
         VxQalXUW6k38wVHVVMCQ0rAeCW9KIzxus/TNmdSRlNdXckrknlA3XgcI/vAGHEf5Li5m
         wDKX9PtYERxrmQE3+BEIpckoc0URDijqa+X3ILs1MhFl/ep/vHHiScxKh/36tMBaHv70
         Yb3V23g48GJnSQ6fSr+C0yTadWgDfisiu6zwp6KBNrE5FOxOmkNvZXuh1ro1+yBJ/QYr
         VWng==
X-Forwarded-Encrypted: i=1; AJvYcCVzTwy+cqpKpaW7Mahz1Eg0uKyjPjovA7VHCJ10v2mBher/XW2ZWFJbMK7aPYFJf5K7ySMLHZGDiXmMwuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD0sc8Q35CeKNMbWXzxObfm8u9kfzHTbdj0B05pv6hTX+8jfNH
	UWWI7HJxY2AALWJQM0TAPQ+yHXsmOg1NjnkUZSpyhH18ZvIfQhJDjbdPsaUtLW0=
X-Gm-Gg: ASbGncsc+aNKxAa2V/m1agy+qafgRehNmFZm7vRNJTeBeZE/adVSgz03acj0rzqhKhf
	7fMKTQm0HVWgAmLostUH+3zIwmPZZ6kSGKKU+Pg2Zxgc/VWGICsSSanMSkgzlPArlj4qb5Q/K6X
	fjHGP6PFqtTmUWDby1AY6JTL2RMapk9ghJOHR18/WZ8F5wS3kjV4hMfRgspih0Qj1FDXIXl9wuF
	3V6rT8W/xQ4yT1rLaF45zNxD9xfI3yBoP0Z8T8EJ+2w6uYxMGrzFDt/zNz8ibUpe9f0AKaLYbqO
	QPevbpQ9mLvceL1OvaVhnXiJvCFfz8xaOFm2o7hbPxeE1In3eJqAgXbWrn2d+FwXHQ7ZGlmqKRz
	GIy9EHg==
X-Google-Smtp-Source: AGHT+IHvnruoQf/zsWKz811qCbdXO6vDPHDtBmgtxIKDoHCWYrcOhWQOhDK0kiHkWvqsK39CY/vV6A==
X-Received: by 2002:a17:906:81c5:b0:ad2:20bb:1cf4 with SMTP id a640c23a62f3a-ad220bb20abmr329227966b.15.1747031903658;
        Sun, 11 May 2025 23:38:23 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.234])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21985342dsm560597966b.169.2025.05.11.23.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 23:38:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 sunyeal.hong@samsung.com, Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com, 
 stable <stable@kernel.org>
In-Reply-To: <20250506080154.3995512-1-pritam.sutar@samsung.com>
References: <CGME20250506075413epcas5p2ce0db6da9f359e9c3bb16b03c1a5eb4f@epcas5p2.samsung.com>
 <20250506080154.3995512-1-pritam.sutar@samsung.com>
Subject: Re: [PATCH v2] clk: samsung: correct clock summary for hsi1 block
Message-Id: <174703190180.30824.7869810440516124016.b4-ty@linaro.org>
Date: Mon, 12 May 2025 08:38:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 06 May 2025 13:31:54 +0530, Pritam Manohar Sutar wrote:
> clk_summary shows wrong value for "mout_hsi1_usbdrd_user".
> It shows 400Mhz instead of 40Mhz as below.
> 
> dout_shared2_div4           1 1 0 400000000 0 0 50000 Y ...
>   mout_hsi1_usbdrd_user     0 0 0 400000000 0 0 50000 Y ...
>     dout_clkcmu_hsi1_usbdrd 0 0 0 40000000  0 0 50000 Y ...
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: correct clock summary for hsi1 block
      https://git.kernel.org/krzk/linux/c/81214185e7e1fc6dfc8661a574c457accaf9a5a4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

