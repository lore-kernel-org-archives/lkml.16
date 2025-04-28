Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B201D6DAA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745826118; cv=none; b=i7umv+s79/TY+QaTDMsgfhJyanSTkDXZ8sDZMy5LwBlQEYF80Znr2gyY/xkiL7SfdqsqqWrvfRdviODnDAO1fVElVkn/QM/C7l+LXL1ggbIWgNN13qD5qb56v9Lk6EAKSUCgAc05kKr9lm2Oma2q7vmGuF0yZl2ofwmj2IrpjyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745826118; c=relaxed/simple;
	bh=oSqIkRupR8TYRhDce+2kE5eyvj9Skfdy3j9c3wxau/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pemIEouDKjWb77sRSuj4DccphPTJNnYA/lXJmjkzULWAwj3fMXFBvYWB2HlKJdFUnr9OcgeuBet+aichURWZnXCKTaVxHMWNnPifnb+VGUyIIRGmqVTtyDyHqMiS4mLgFaCQTXEXTWP3+cV0Zz/GlsCrbvZ9Z87GWvS/j0jn2t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jvpMGZMu; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jvpMGZMu"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d0782d787so27297685e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 00:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745826115; x=1746430915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gtXe3DJwZopbQ1jjaiS1Q49hS2sBgO4tG8niY++hBCc=;
        b=jvpMGZMuIBW5Fes64T4SrkieG/tEKaG79TtuznW4p5qUYTocF1nEtwoDeXyfWwBqsM
         jMAumiskwWveynJ0T4ZkV3goSx+0w+qu/f2lHUxorFMgvEmn5dImP613X9CI8f2nabX9
         YSdVBDzwJyBjgTnhuP0B7uM6YXJym/1FjyIoxRLxgXwNusXPS8Cn/1TsWNVJK7Fg47ZY
         5zU24DOnhlDZHY6l5NdP2NQ1vSE+g51sd7uC6XtPCzj/QidBiqecrhD82bJhLXtgzq9u
         gsHvjzqh4DGAut04sNpKWbn+rtDCY1oLkYzdYs5PhxhmosFaPrcm3N1/8VuNEHeObmYr
         /5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745826115; x=1746430915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtXe3DJwZopbQ1jjaiS1Q49hS2sBgO4tG8niY++hBCc=;
        b=ak/LG8O3Mr7U+ngtqxl/mx6k6Dbz8In4R9Ly8kq5eTxntF3tCXjonNsyfEErvpgUEZ
         umnMed7asoLV3kyV9e9NVCQetBy4iVlMThLVa7EHbywGey5aAyBNSE5/dy3Ix2/CVQKe
         9Z+KA32hxs1+soDYa+9FKmMQ/YUe+tErCRjnUJhMTIFDFOrl4PUdnU9ArpPOGgYq17gd
         mCgqmLkavJhPMsyWt6fG2fgYgBujVNF0NvqNBoSFlEaVNMRjB9ywS+W0QH5s8yIajbd6
         7maGeS0rEsZEsSLGNgUShsYwLN8ujYE1kDleNzdvwdwglRVzU9rKObNq93Vr7f46TWyM
         OeQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWE6675vmHxn/HolsYchkr1nwLclbBYEH0/QxDRWaaAUQKEHJnDJJz57Jp0CTfeG/XJo0n9nIzCn+c87mE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLlo72GL7z7w7fL8ULt0LLO7+a+bc6FWGR+nqvBGE+3LsD0bvI
	n9xAUGq0nOhDui3JlVx7T+vMMxlnyoEkgYOpkD8el4jAqJ2bFwS++dRZfeAKud8=
X-Gm-Gg: ASbGncsV/coTd3tSddTQ3J1tRwbA/kicBLWFi/LAb/R9PeIoGjQjiIMkga33K3FXoGZ
	pmMTj+TEB9Nv/T2l2F6Z5trbodB9foSrq5Bw1hrDNM+v/WynWhml1eKCEZAfShaJmoct/49z9Rz
	y8QWMAXCqubn8ycDQC1jdvPqPCEKmKKpqLRe5qy5KAxaouGeNXKuSazOdnkxYl37abSlmnS+u6s
	OkrSv+4zhcWqhESqFR9Lxa9b9ezqGFB6Orho1tCYiCGgcOyiImiqWR/F+i6XEFJ82zUPjWfER7e
	B9TmmCqsXXl5Qd+py6QHuO4hfeI9AzQaD60JBWeM
X-Google-Smtp-Source: AGHT+IG6vJMcPDbbB8aJXp4GBvSvxlx9tDVNz+S/2DNAZ5R+nMzSTlCe5ma26a9KdD4uVH3db2JQjg==
X-Received: by 2002:a05:600c:a0d:b0:43a:b0ac:b10c with SMTP id 5b1f17b1804b1-440a6699e8dmr82436405e9.26.1745826114893;
        Mon, 28 Apr 2025 00:41:54 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:96f1:a768:3c75:f123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408c7d6ccdsm130656105e9.0.2025.04.28.00.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 00:41:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Raag Jadav <raag.jadav@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: (subset) [PATCH v2 0/3] gpiolib: finish conversion to devm_*_action*() APIs
Date: Mon, 28 Apr 2025 09:41:52 +0200
Message-ID: <174582608319.15717.12211907178640999391.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250220162238.2738038-1-andriy.shevchenko@linux.intel.com>
References: <20250220162238.2738038-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 20 Feb 2025 18:20:25 +0200, Andy Shevchenko wrote:
> GPIOLIB has some open coded stuff that can be folded to the devm_*_action*()
> calls. This mini-series is for that. The necessary prerequisites are here
> as well, namely:
> 1) moving the respective APIs to the devres.h;
> 2) adding a simple helper that GPIOLIB will rely on;
> 3) finishing the GPIOLIB conversion to the device managed action APIs.
> 
> [...]

Applied, thanks!

[3/3] gpiolib: devres: Finish the conversion to use devm_add_action()
      https://git.kernel.org/brgl/linux/c/d1d52c6622a61a0ae8dd2bd2097b25c0f553d2f3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
