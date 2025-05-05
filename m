Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B271E9B3B
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746448588; cv=none; b=Nc6lt2tHBsLdLnx/RLc3BGXcbjtmcI85ogKZirVqoObIq7QbXhNYrNfpKesibCvushAvUdMhpFoTN3kGnqOGMkNeE7Rf17Vgc80V0WeMnJ15y7VyNqlClXzRWRd53+6BddtMcaf/Kq3x5/vOvPAC/DFycxZ/kVMWzaM+UWnqtZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746448588; c=relaxed/simple;
	bh=LC3z7RCWc/JvyjQUbetuKHaUmEJ8vDFK9bVb7iQVdFM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GZBPVqT6X7GWRbyYCCdy+rDBwDQAHknxGpTnheXgj/QrcTO7i1LwTBuB7YIDbZSx6G9vEcMAD3Lha13wphDd3PczyxoZdqxncjG+cNRkRXORvp34IQoFjawAOiTfq8fleYqimbnw1ITtxGBwKiv2aoDJonRm4XlLvgNnd1ZnKH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ebwuewjD; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ebwuewjD"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39ee623fe64so4424870f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 05:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746448585; x=1747053385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pms5fvQ0dnJoBWv+1H4MBoKeVfIfZlhVgzVaTxFBOSc=;
        b=ebwuewjDjIQjexRgfqtFdaihjgh3tNgeiISAARecivYOz2Quacw0B67MEOFyoFAL1v
         jD5hoJIhEOt9zJb8shSBj1PE9+ouHRL0+HwtUtMDobUpXZ0xKChJKtfGLvATosVp2cXn
         /uvIJcfW2XHKJBC+5/VmS3BpgL2EmRJ7v289LP+z8xicwGmB/juYlezyuVgXXVFpi+bT
         mI2lnwZKw3KHXPw2gl6WxIxejXOEBiSEBCzfagLE5N8aMFHjA1JAjnJIF3Xy8APM8L7b
         ksU6UawgeAA2lOPZygd7r9O2qDINzS3GkzG58z33dnbRF0YqYhzl/P2yqVKoEuCg1/Uu
         hk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448585; x=1747053385;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pms5fvQ0dnJoBWv+1H4MBoKeVfIfZlhVgzVaTxFBOSc=;
        b=dCwUWViUiz/FJtseImSgFocYBwnj8QXg48bNBurZrXmEXGgOdIrpeLlUtXUuo9Cjez
         uImI3jL/kPixBeCbzzGUyJw3AaivDB+omyJfo3oTwsZxSdoLGsM56fSn2kU1/VRd1fPD
         nC+hlbdICxede0PpKNsi/hS65CvRNcZQUiXWPk5JWzBogTMHQbhCOI5Pp8kM9LWXLGhU
         ZMX/xxMHVWYkf+SqQpF2bV+eCXHhGr8JihJ92AedMkTPwOBPPsXETfksJbyh3wdhOFZR
         HwZBfj7FkSylEa/E6Tl5mQiwsdm8hxym2/69hlGBG3hpjEy2Q+Ai1SBn1SWzU0CW6a6A
         H8wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpYcBJnQU/COb3MZ1/kQOzwNV1eMO2S+in+/ttW3Bz/IMQFqKO+jQnLcBYPhS2xdVRm/PJwH1nT+D0Z9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpDz09UbZ9/X1z3GickdC0hIv8V3IIOX779JhqgAYEczS3d9Su
	sI/cjd6IColgQ8YJ5/b1y24413Wp9Y6uH5l7Nyml9XG11+DYiRgKF2LX5Tp7kIw=
X-Gm-Gg: ASbGncv4ZtZrZ9WA2u/6Fx6rns7Wm4M/QLIfmSsUG9nFvXLLnuBKcj4i3v8kWSy5pf8
	OgxHXtO2mgHdLUtRVFpp8g0181DSsrls2EWTyC1UEcz0XFgYylAR/OthCdAa1j/iocOJkhJjfY5
	9QA6c327qrt/1nx4lOJC4STCEeE9/BNqBqAAZS+iUb+gDCZ/qG+SgyNs2zTmNyCBq+XbBnNiaPO
	hGd12hQFhnNAqZtGAAm2U1wno455V7Y6XZy6KSo9bMV7YA49BA8xrOnywNixUKUxtF1LN4RsPJA
	+cZIU52sBMP7BdpW7xYesbCTBZQKUUiqy53mm+NRN2liO258bUXXO687OM5aeMf9y6SxjOJs
X-Google-Smtp-Source: AGHT+IGsEliGJnwJASNNzDOIlUfeubpmj2r4ysjGNDPlKRJUSM2MTHWLJu/fnMkKxMkulAhjanR1Kg==
X-Received: by 2002:a05:6000:1a8a:b0:39c:d05:3779 with SMTP id ffacd0b85a97d-3a09cf4d5admr5929318f8f.49.1746448585435;
        Mon, 05 May 2025 05:36:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0cefsm10434442f8f.15.2025.05.05.05.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 05:36:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Christian Hewitt <christianshewitt@gmail.com>
Cc: stable@vger.kernel.org, Emanuel Strobel <emanuel.strobel@yahoo.com>
In-Reply-To: <20250503084443.3704866-1-christianshewitt@gmail.com>
References: <20250503084443.3704866-1-christianshewitt@gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: dreambox: fix missing clkc_audio
 node
Message-Id: <174644858455.1377517.9885445879892405270.b4-ty@linaro.org>
Date: Mon, 05 May 2025 14:36:24 +0200
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

On Sat, 03 May 2025 08:44:43 +0000, Christian Hewitt wrote:
> Add the clkc_audio node to fix audio support on Dreambox One/Two.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.15/fixes)

[1/1] arm64: dts: amlogic: dreambox: fix missing clkc_audio node
      https://git.kernel.org/amlogic/c/0f67578587bb9e5a8eecfcdf6b8a501b5bd90526

These changes has been applied on the intermediate git tree [1].

The v6.15/fixes branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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

