Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD5A2248B5
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746805105; cv=none; b=H1Xvt54TPbwZFUMHRM7WekY/OGnQgR4OopdKYC8VibzAVfuUO/qGLfGs/nAJc9wYt81zIE+w86m/CG9gwDAbiTDZX9tQZe9rq6eVYB9+Rqbe6nFpJp6x2nOzNO2R23oXZXo8luXNKJoWE7TUtyBofOMAYPBZ4deoC4w/9Ob9FgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746805105; c=relaxed/simple;
	bh=noz0Li/huB4LRgS81b/FMznl0BJ4hfLjaKLd0QhACsA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=B8S0ug8iv8BBeKzBmF6fYkpiwzFpd8neJUtfG0I62a8FvO7twQI4I0jFxKpZkH6cAN1P+Ti5NQ1ecgvxS/pkyPFQasb2WvQDbJ9VPBZWoz14ht515iG/VqkNvEoZHRyQSA39nrNLNVp6XdiT2gw0ywovxdWJG/5L5KfwYF7meWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TQcWVgYa; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TQcWVgYa"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so14412145e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 08:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746805101; x=1747409901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBLBH35fihBkmIGbw4EWVRYhi7XRZ3Q7hPPc7aK4Fu4=;
        b=TQcWVgYapErxyiuiUxkCA4XgilRQIRMsIfFJ7HMCzVSqg5dHLK7NqWLK1vBcy1M9Tn
         ToD2KP+NREE7/M8+hyG9WgEiLWBZZdc/C3cNpj2RKXPb1FKvVkWkqhgp06Ka4k+Hr0ep
         a/q3ZVWQEvXfoM5+s+ZPRdC11qy3S+AwCtsfr52HN7+XM3s5VdxHppkd2GOdqhjQbNZl
         1guYNN/0+7UCQUXJfXUsr9rd68E/NRzXlm52L1GBzhoAnfdGOAEDkHe2PFz4hGMcy4fe
         cQKaG81hVZyR78zRcCWCU4sR/UHrsJW1xVeia9MfFhbGohuwboJkeY2+8sfYRNJEVMhJ
         00EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746805101; x=1747409901;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBLBH35fihBkmIGbw4EWVRYhi7XRZ3Q7hPPc7aK4Fu4=;
        b=dTou0E51TEmY68EBPT3yzTxB238FmAm0H1DDXXc/1fDbBV4GEo8sJvwFNbbo29kPnZ
         eDKIEqW7H3ak9pZmN5YpUBB7iK09MXkguRjhkZnXN8T4NxyJQ9DPDpFE01Aq8qs67tHG
         ZL6hoy6iV0vKHYeveEto4jGn8HUFflcu/hoQ0IsiP/hhGncTX7wl4qGJYkC3p1YDyT9l
         YtimcqIJu3T7fjU3VOiiD6UONjHhCgEAy3NjcvEng/lDe4CKwQuRbsJokMde6ETaKLoI
         FAWJby09qvhW/u6T4+e5fLbq8ajf4qPeV3/GUh5s6LbM8QwDaTe5iAtQMJ4eVj0ooG/O
         FkTg==
X-Forwarded-Encrypted: i=1; AJvYcCUGlUAlTnHw4mGP9bjgalYygE4wLZsSuZnxdm23yoYDvalTAqsnSDcMuxP1OdKC9y6mx6vykmk5N+QuE5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfrzxoDTigb2x+3KREeM0tP6GEOjuvQP/GuwWLOLC4+TbsTyEm
	ihXLaBvGHrpzKrjR81JMmU3sM4J61s5AYx02uIkE8VD1jBtkpBOlRO3+XyuLLfI=
X-Gm-Gg: ASbGncvckQnmTSlJePcek4kp5DzLqq4FbbXdwQm+D7SazZd+zYX43yoJjpeEQyRycIR
	WIqITnaAp1znT9Uclvcukml9Ku56EYD4b1cP1Z/oSgKaI7dZ3TyF2Zg/mfISwqI28GcEuKAoPWB
	lRoMfL9BgwZoXuoELxa+XxrLN2tHMdhal5hGKdAbJiGovT7D99jXVgqxrrpyBnxDqABILJmZtMg
	+t/xpX5Tp0r2sjcN65oAcPQlHTNoVALadOhFsF8l2wzoER4Nwx5SP1Gak6aowcHescwWOetPNto
	zvoaZKjtr51kN0ZCCu/wMpBQvyDaTu5/gDN791VpvJBmU5QVBI1ZQX91K9nPBY+Z1O1oti3B
X-Google-Smtp-Source: AGHT+IH4IMLRaSDitW8aRp2/HH30bVFdM1w5jTbdL4Xe/FdZrAqsFjuKiUSdh0mozDMKtmaE8Kz62A==
X-Received: by 2002:a05:600c:8205:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-442d6d98a88mr32790695e9.5.1746805101395;
        Fri, 09 May 2025 08:38:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ebe4fsm3663912f8f.39.2025.05.09.08.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:38:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net>
References: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net>
Subject: Re: [PATCH 0/3] Board support for Fernsehfee 3.0
Message-Id: <174680510066.3108291.15538800849859736861.b4-ty@linaro.org>
Date: Fri, 09 May 2025 17:38:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2

Hi,

On Sun, 23 Mar 2025 13:37:49 +0100, J. Neuschäfer wrote:
> Fernsehfee[1] ("TV fairy") is a family of set-top boxes marketed as
> ad-blocking appliances. This patchset adds board support in the form of
> a device tree for the third generation, Fernsehfee 3.0.
> 
> [1]: https://fernsehfee.de/ (German), https://www.telefairy.com/ (English)
> 
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm-dt)

[1/3] dt-bindings: vendor-prefixes: Add TC Unterhaltungselektronik AG
      https://git.kernel.org/amlogic/c/40f983aa2d809b4934a260c76b82e9ff19c09a88
[2/3] dt-bindings: arm: amlogic: Add TCU Fernsehfee 3.0 board
      https://git.kernel.org/amlogic/c/eb7af1268e0042e83607918229cd62c3669cdcb8
[3/3] ARM: dts: amlogic: Add TCU Fernsehfee 3.0
      https://git.kernel.org/amlogic/c/dac928757928a8ea06eaf5694d5deae53a21616f

These changes has been applied on the intermediate git tree [1].

The v6.16/arm-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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

