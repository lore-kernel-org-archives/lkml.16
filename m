Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CAE1DE3DB
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749106543; cv=none; b=V46a8f7L5kzg2+ZcLxsJy+5A+Tz5GlFZSFusllBqVGjymesHiOU4NNvc4aIzIYdq2ZMonVTG0YIrTY4TBwrLGzyCm7voDiNnlUTIOs+kUUkTUWxWSUV66sX1wdjTP5G//TttIYAyHA0sWMltz3yiEvK20QbVp2+cUpiplkutU7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749106543; c=relaxed/simple;
	bh=BNT2EU7DDjsNuCPdkeDmo7wds9jKjVE7XJWO06NNEcE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sisY+gKfyqb0rnqkp7jjQzQHor3hPsEeqq53jeIQd09c9QzmsdpOseVaB/tMj1/uMxVpmfg/nlbMpnc6vfzcVfKiXXIhtm4rf2SzwRCvibp1wmjGPi5FlkZJc91N0rlSuWj6qfx0/6QPcI8jmTq9rKQRgY9CbKTlDBCpCLH+Nqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TggLlj92; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TggLlj92"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a35c894313so519827f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 23:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749106540; x=1749711340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oyx0ftJ64FlzpC17BLoghE0ntQMOF4o150mtfRdZYiw=;
        b=TggLlj92uqBqazF7/rtmwKy1oGR0SpCXGIyEaSpGtM4LkAC7gyAuhOwMCukNjiV4JT
         1X9jyzfB6UB7GawCbfBH0aegxasemTQWvg7lKRgQpVGS8t1okCqvr0XsuWMz1UOAhQ4y
         PthPXrjS3whPb5iPG228PWER01oKKn1lGXDdq7LOsFIA4Yb0G3mRQZWr6HfEi7WeZhQn
         KLaNLaz8qt1e5uV/zg+FiNutqw6jj2xf7XmSOlIR9nT5v1hGhdCN3MRc6O1ZFBwlX+z7
         aWyNEBKqcICKwgdck32EKp/HtsVi4FBUZxYFoBmNDlOVntZzAsECGSANQTCh8OfbVDs2
         pKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749106540; x=1749711340;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oyx0ftJ64FlzpC17BLoghE0ntQMOF4o150mtfRdZYiw=;
        b=Y5mngo1SDoVD+ZiIa1zBGUj3lRRp4e9gH90Vlk/JgnJZQdMxhJTPeZ/sjb1FGM9vZX
         vciPqO2HV+v9yYJ+YxqfhONyI8CRTcIVgMU+cYUkxNHn05vLEy/dsM+Afcc6MFG6Ukba
         NWvqnAsXtZ/nAV+DMqp6aR/V6VLsg4YLWygzCTbS08Q15cDJ4+OToWglwpm7VZ6OKJuT
         9FJ4zXkQ3XzsUAPMt85Qz6YWtL7JBGae2qvGueRuJWAvhPihpqjvluKCnEILf6r6gXH4
         SSkOjt6EDY12AWqAETmCuOlThU67/+xW0ESP//50SiV5MjFR9HDEJL/15VcnlxJVlN/g
         0h8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdSxLk8RAW0bKX4Q5yejVINNq7Yy3ty8vUt8aAZ7VCgr3E3yiQcAkyowTIbwoMiDIrMmyzFcI92faP+jA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNzyjlBJcmgbtybA1Q+aV7MLAeXeETOO2SQgy73itxg816fe55
	8zf2w92nyKUHfWs1ryTxdVIKppMp5xkzkHKHXF+uqW9jaS4U6Hhst5fpgEMHzqrNAap7Z0C1tlz
	OIc6O
X-Gm-Gg: ASbGncswiiEcTYqf3kMWfwYpGrBizdYiW7USJkE4EDv/j+snr9YxajaaqOqcmqu0DA9
	PadI3iMeMDfUg/oDM0ibEcwDooG+W9UfwL+bZ/8OiWnG74U2ia940shem2aNo7AMPM7+7bJFUya
	qdg/aMAhumzyLN0Y6hBNNlGGoiV52qOjhKysMqi4SfOmH3X77O47WvY8Da2rs+675vqlhwoCXYl
	LS9eKi5jHxdLK2Nv46yUG9Po1r4+7xlTtDo15sOK1kJFkhLLV41DjWsLZ6FBrdQMAoSCn5Hbqrl
	pDAhng2N5W3oV8GXk1/++isasOeuLYszdNFtK1J0qB8MhJsPpLTSMgZTS7egORXJ1lM4I4Kp
X-Google-Smtp-Source: AGHT+IFrS7bC9yM6c1Umhr2I5M7bqyTsyWg+etIUGp1hD7NgyJNk9bH2qumwy99MkZcbUNMkog9zVA==
X-Received: by 2002:a05:6000:2504:b0:3a4:d64a:3df6 with SMTP id ffacd0b85a97d-3a51d8efcc8mr4223971f8f.3.1749106539874;
        Wed, 04 Jun 2025 23:55:39 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a526057278sm1910099f8f.63.2025.06.04.23.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:55:39 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
In-Reply-To: <20250519133345.257138-1-andriy.shevchenko@linux.intel.com>
References: <20250519133345.257138-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] drm/panel: ili9341: Remove unused member from
 struct ili9341
Message-Id: <174910653899.1422723.14584247273343467171.b4-ty@linaro.org>
Date: Thu, 05 Jun 2025 08:55:38 +0200
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

On Mon, 19 May 2025 16:33:45 +0300, Andy Shevchenko wrote:
> struct device *dev from struct ili9341 is not used anywhere, remove it.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: ili9341: Remove unused member from struct ili9341
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0f9c561a7a63ec0a7d69c227b090ee6defa45d35

-- 
Neil

