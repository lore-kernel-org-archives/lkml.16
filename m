Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A082459D4
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746448600; cv=none; b=jSILTMdBRKk1NgL4Q75ipTvS7PZPiAfJlgud7Pre23zuFOy7sQVdlOCZ3uMC0fi9dIhMB1ZkJfsVlnvIk/0MiaHJHd4hkOmerPf8nMNYnzX2vABdHrogvfCA3PLDa2dpwVB1Jud/a9PuxXT98zsUFrqQ0jEfNLJwLDUXrZRIqdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746448600; c=relaxed/simple;
	bh=JQDK5mEQSWgeOlkUAKNOWCkunwEuxlBFXlqCyDRLeXc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lrBYLW4gYcr7FZtKmIealaF/SUDgtoeZOm/KTRV0M/y4E5+sEYwfdEqQ/EgJxmP7sELqabqRx/kqmMWhZZA1OJIOMb+4BTrm4iseVZWJJQrh+lUM8Bl2Ba15jl7hVOBE2oq6EOoFG7aaYM44rSCUTy1w0q8BFR7J/Zp260F696U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mqdVu7EM; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mqdVu7EM"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso26473755e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 05:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746448597; x=1747053397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJalLmswOZQ1+I3caNB5vdR1vqtjSyhFatNldwOqsTo=;
        b=mqdVu7EMbM5BXK/gYaTl9Y28GRpvzPSDOBr2inz4QK/CNyHBV5PQbHTQwHoWi6YiSq
         dJv3hFNS+avCYSgk9ZWsBhFCqbwQ2ljXBgFqhciHhe+4evviAnZPQCUcwOHPFKKB05L7
         6BX2iW5Grhvv50hWgLevUlIB/ldv52jQ66wstClYKfVsepUrWboHtuRzPxBPKi1L2s1W
         tTV9GFOJfczDSPLH5fVvd8tHWcpGe87wwo0q2TEAyfGEq9hIHXuHtp5JCmOODs7GmV8L
         umCIELH/Rbzg24bFGisCaFX7n/EEfqKag8XTMFVRogafLASQbDJ+FGPZTFFf2P73Tm/u
         MUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448597; x=1747053397;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJalLmswOZQ1+I3caNB5vdR1vqtjSyhFatNldwOqsTo=;
        b=jEkGOzEN7IRf+I4dPXSO/H0gCV0SPxlmVvDsrp5cp6LNye2RXbUm1hWrz9LsG13BUx
         8dECxtglWGDvGwA4RhFjUy32MUpZ5LxmiqUtB+tBsYUJpw4YDN78wsGYLjBPjjMz/e9+
         jfICWgIG7DvBkrCeriWa8agbnWxmPYnAGzKYO2nFMYxfdZ4+ap/4Z6yI1kGLJ/1Hd3Hn
         jPlbJSHSMbJDj9xrHcg1uNHwkGHv06sOs7fkZevlMftsd/l105NXLPngPQIjjXjfUHSu
         3ozfHv4G/dT32ywt5p8krbAF5G+PNoVoWqoG+sQy5V8RJjC2f8QGp9RxtRD1vP7ffSn5
         xYkg==
X-Forwarded-Encrypted: i=1; AJvYcCUeYNvHInxQO0aC1x8vGpt6PHPkXwk6jXqINuBCYVWBcJpUsicqyZP2mbp2l/0hMFulH8G1Gm0KYNjx+LM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO3HVo2MiNNgk4Z6wJRLnhUaoAYpPRhJPs3KHlJkX6Rnb81yGC
	RoIz3vU2jKmIqDGL+D2b/GGAcithej9mHKIzzdXhEBf1i01mgsGVkKdVo5MjWK4=
X-Gm-Gg: ASbGncvGiQuBT76YhXCoxpTOf9wiO2RFea6acEjbdmdULnzzBseCbTy/65cKG114MU7
	0mjxF2L9f4IyYeIgDHdTC3uCwjdgHDLTM6jGOwFdJaIqFVVa9l2XUeFwcVUizSVWad18PSMtrEo
	4Qy/DckWMP+Yn1hij2J8Sj29RDJhgvdN6m7uPDrjEhvXxJ9LmBjq8PGq5x95iWmccc0deq5gevB
	n8/vQ+3+SafZRh3ChSZoIgcwO5azJQCO+lDM8vmk7VWINaFtPw/Yi4m6INZ2lN7Ksr7HS1Yc2Yr
	d7cpkiXsAIS3Gyw3mOEv3gN3yBjpD1BcixrogFxSAy3I/NDQfhtbwRD/REW7sXNU808UqG+9
X-Google-Smtp-Source: AGHT+IGrYbfIV/5LAwd8x3Ag4BU1h2NQrpJczDWD3n86c2dPS4oVyLjVkTxVfPE08xsZ/bSn/VTNWw==
X-Received: by 2002:a05:600c:3545:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-441c47d3cbamr52857685e9.0.1746448597366;
        Mon, 05 May 2025 05:36:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a286c4sm131072725e9.25.2025.05.05.05.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 05:36:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Ferass El Hafidi <funderscore@postmarketos.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250502-aquaman-v6-0-f1af347d9709@postmarketos.org>
References: <20250502-aquaman-v6-0-f1af347d9709@postmarketos.org>
Subject: Re: [PATCH v6 0/2] Add support for Xiaomi Mi TV Stick
Message-Id: <174644859616.1377721.12603834364011282059.b4-ty@linaro.org>
Date: Mon, 05 May 2025 14:36:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Fri, 02 May 2025 18:56:04 +0000, Ferass El Hafidi wrote:
> This patch series aims to add initial support for the Xiaomi Mi TV
> Stick.
> 
> Xiaomi Mi TV Stick is a small Amlogic-based Android TV stick released in
> 2020, and known as `xiaomi-aquaman` internally (in the downstream kernel,
> u-boot, ...)
> Its specifications are as follows:
>  * Amlogic S805Y SoC (believed to be mostly identical to S805X)
>  * 8 GB eMMC
>  * 1 GB of RAM
>  * Wi-Fi + Bluetooth
>  * Android TV 9, upgradable to Android TV 10
>  * Google-certified
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm64-dt)

[1/2] dt-bindings: arm: amlogic: add S805Y and Mi TV Stick
      https://git.kernel.org/amlogic/c/4954ec9300cfe7ab6f1de1c93c56c236ac0a07e5
[2/2] arm64: dts: amlogic: add support for xiaomi-aquaman/Mi TV Stick
      https://git.kernel.org/amlogic/c/f5d4227c6dcab047579cca7b8e31a476ecdebf7b

These changes has been applied on the intermediate git tree [1].

The v6.16/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

