Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339CA28F530
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557837; cv=none; b=l9RCoQ2HEatO2bUy4tqIYm0bpYNsd8wQJ1pMdxbAXOuW/SqC8QnxT/k1NuqvhnnqroiN30YUjix2sohs6QmqJZSWRVb5osR4MV9AVR+jcZ80QHBeQNKMdXLQ7zND+qJ/V5LUidwTX+EW1NITZWxKATwUs3CsP7l9S0Q5aCNlSz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557837; c=relaxed/simple;
	bh=elK/jHGeft2s2oQB4fs7zJRnEpuALrjqHNniC1+E794=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NTEunTiD+yXdCNVzupWaxIynVVBnBjSV01JCYWtAqtEIJz59S0aW45hyahwuFsbStQmEdlAOPpU3W0TsGuctCTznVqvvxEARBblWTxJiqJ6yWu6oQYrHA8/GPQBZrhMw1sdlcvLHK5c30+vU5SNUfPyr7F0eC0ia9N7v3diQHMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iUGXLjqy; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iUGXLjqy"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45305c280a3so9478315e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557834; x=1750162634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XF/JYDT+HfRIqV19ilVNVcOBNpam0ApFQn/xVxr2toE=;
        b=iUGXLjqyS5XiUMTGaq2x7zQYBka23RH5lDUwJcN6RdR4p9Axks6Bn00T93ZibwHkVX
         fDF6YpiaC9Nrsux78FtYjpIjvarl3bEnGsxo1FiIAJz8Lsskl2PZzucagUGFYuXysKKs
         pWQVHFXkq68yPLricQ7QA4ZRxo+bETSMVpNpAv7L+S/FY5N01T+Jz1GeN4egnha5atFJ
         uDa6tGsYOhZOjBxlCF+C6upmV7PDcJWvZui7vedFibw2dTxlLR+Ocmr13METX6w1R90j
         k2AuhJStxchfsPE3i5J0ILQxJaX/ez6zD5039ru4ljB8DDuwu1q6ncaVZ/ic2ip7bbgG
         44Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557834; x=1750162634;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XF/JYDT+HfRIqV19ilVNVcOBNpam0ApFQn/xVxr2toE=;
        b=dfqQ8bOtHXYGMEOEuruKtcFtlQBJkWRz1FQ6i8nv/UjqG30qdujuJf6mFSc+2j9xcw
         /jJtT693V3o1c0JFhiWiHsMIlcoWDwzJvOLcGbTnl53Frn3rDQQBVjM+uKCikIlGsoQ+
         iEemwdJZtLeKKrNHKfscjZ88rMi3xvzJflYAhr0bZAAHOMyI4ZR2Jp87YED8aCIgLmUa
         iVQW+SjvzDybFxAapWz/AruWUgr3OGezGHAWgbwsNvRTmhCpGwFedDjOYDF1yL4luT2/
         /Lpb4BvYFnSpp8TrWwZ1EWX9v4/0G/ZrPB6o7kFva4j82V14FogYg7CAo/RWKsp7e27J
         oyfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzdHhuOVEIkiEI+8/RHf4YVdGVWGcO4RRtf9BmHORPhkQ4bE6JaZSziTd5ZNR8FV3QIU06etW/UFVxGLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPrxSljV4vb49xNFoHPFdmjjiwVYC+G9AFk/UdQ7YCAO8dBkTM
	jbZSh4W/lxM9Gog7MYQ+S1+ShMyOJ2y2MgV6+zu689vepfB4Cwfg5t2sEzqe3HzSEIc=
X-Gm-Gg: ASbGncuORNWPGKNBM2/21a9lG9AUu2KTjJ8zIS2GNgdxKhIuA6IZNANowY5L0skSmzG
	XCW1xSBhCwpUouamOeak1Cc5cFNKXKebyo4L/2q1pnKiiaG6cY/uPcenQ2qrSP97tYjPDQJYX12
	RuTjCMhTsHLmkGIPmoump2HtpuRo2WLm4I4d36hI/JjOm5iMG0hxsV92iXT92MkFw+ahhdizSwQ
	8FbvA1j/Z/O0hov4ZE5SNZkv9QgP+EN4u2HER0LCy5fNWCzjP0GNmD51QwmHAREoq+SS7wE1acP
	Dxsx9KKzjfmXawx+1+mgd94IOIsQaXIv1A6L17cJZB+X/bCCdHHJkgE0e+cevJM6Bih0Ejwim/4
	hG+srr94=
X-Google-Smtp-Source: AGHT+IHQU4XWWHJiWTg8y6CtfrBTe2VJBO0sJZQtUeiV78bAOi8lkD0/5F86KXtfRgGuN6NBeD7Q2g==
X-Received: by 2002:a05:600c:54e6:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-452015feff0mr108984005e9.4.1749557833882;
        Tue, 10 Jun 2025 05:17:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e1595d4sm136313625e9.16.2025.06.10.05.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:17:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250606221031.3419353-1-martin.blumenstingl@googlemail.com>
References: <20250606221031.3419353-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] drm/meson: use vclk_freq instead of pixel_freq in
 debug print
Message-Id: <174955783340.1721274.6476762839589523329.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 14:17:13 +0200
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

On Sat, 07 Jun 2025 00:10:31 +0200, Martin Blumenstingl wrote:
> meson_vclk_vic_supported_freq() has a debug print which includes the
> pixel freq. However, within the whole function the pixel freq is
> irrelevant, other than checking the end of the params array. Switch to
> printing the vclk_freq which is being compared / matched against the
> inputs to the function to avoid confusion when analyzing error reports
> from users.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/meson: use vclk_freq instead of pixel_freq in debug print
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/faf2f8382088e8c74bd6eeb236c8c9190e61615e

-- 
Neil

