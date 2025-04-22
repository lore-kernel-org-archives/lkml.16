Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601507DA6D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745307532; cv=none; b=qIviugwVZLKSBVKM/r+T0a7pFrzx82Nyyv9dCDBXF2OBJRHdsQhrH2MznSVE09lgqv236qvJ+iUno0y2E8LJDU1XjTTgHwSgEYclUw4rZfkIjPu23gLcImr58N8TqYD2pVj5gko2Z4AO3ja3lslBXUAZexjmp5ZAm82T1hynsqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745307532; c=relaxed/simple;
	bh=y3P/nqQhKnBslbYDLBhKvupPB7zLKtpJdNVym8Z99jM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sykExKqJOhMIAlAmiOcwpG6kTfU39P24CE3lg1rPa5ZHTjgiG6MuFrleyTtPYMAsKTN6E0sljyHNxYeDlT1zl9OeaTWjMR6t6fzquzs5Zl9TdCfS+bte6ygH8meuzIPC49nQA/2uLPbQnqyqXWiFNnwZhGmEttMDeHYOFbcC+QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iRin19v2; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iRin19v2"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso2894497f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 00:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745307529; x=1745912329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVMMGMfgUXdmB0Rj0WANJNXEPV7LIhyKRwGDEdU8v2Q=;
        b=iRin19v2HOzSCXPdT0u+9pxImL/i25ktdfUQKKV44SQ/bJe2B3vCVlETFXB/bUo+fh
         /VQWuykR7VZ24Sez8bZ6XhLO+/zAz+1SP+k4l09rVfeL0H54y//jbMTIXBwmd8mQjNKr
         0rJlhjsUH8rl6qVgBE7H/H81VOC9qxZ6yk3LPfsVeAD6hcWpBV8e1d/RvT/rRQV3D6QJ
         +KCVp1eOWOKmcGEskHP7qoBAEzWeuNEvTCIUV06dfy9mtckNMiVaiGq8XzwtyLnKyu7T
         LNbOjq3mU8roNa68kkxisrKED7+VW1vFgxxiogAOcCWzGgrXR2JHJLEhJYP7gFUADubZ
         6M4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745307529; x=1745912329;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVMMGMfgUXdmB0Rj0WANJNXEPV7LIhyKRwGDEdU8v2Q=;
        b=kQZnUXioiciQfb0srU1hr6m4PD/ETO8jVShlEtIe+RXH0OAIyMJRqD7iMbfyE1XQKm
         IDLbs2/4zdKz4HxS7qHKBnWxMooHmqmx9aTzMYXhVBIc+611OEYmkUXSeFfiAKn39+Vo
         Cvwgk5kVdbuS80ot+KZ6Mvwr+Pc5R8MLN2V8+VdHiJ0pOg+MuMo0kvLG0APSM1YFOTbt
         q7t0bLgSD1AS8XEnhWFuojfyl0m8ytCA/R5+he1kZ3k3SpoIttihKtcwaMK3OtI6XcEW
         I6QlTpHbAUu+L+4MMmdLzEGAT7dOTYMzPNqcXxuCCzlIiEWn8UZ/f5x1DgaJMcRbCXM0
         rsxw==
X-Forwarded-Encrypted: i=1; AJvYcCW4XF5C3OvRCe61mF8Jdyc8iaKCCWLM8o80O8bD89gCpePAMQuUu/+mBUBdOlqS07d817hakXxy1hg+pcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSjBX0uCwmrHZK+4yP0eLLANUcV77y9xOa9jlrWJlNliXiUnLZ
	uEV/AUz4w+KFJQgcCG9q7VdTWSRSlGW5k0TPDFLNHRPI+f77nvZC+8pQpW+en2LrZns8JR5hkon
	M
X-Gm-Gg: ASbGncstP8QlrFMUqzn22JONEuzRGY3znOvFynXL9YC9q/X9XNo3jVTQuEAB0aC7Gr1
	jvG1Mz0k6KvgizR9GTpTOxQhrpR8+2jjHOMdqIs8YhyuCX9icCdJcbW5ZH7jbxYMSOAsdSfcLMZ
	hioh+LEjKEWklCYT1cA2DMUK3WoxC+L55v7rPj8+ZqCV9ip0UuMVHokMPDAu26tl6FU5Sj+Dqp/
	2uqXiCzPuhmMm/ukSRMP14CjAQnNf3XPRihCMXBdLRGce1p5UPKAAse/3gtKFL/q0Cn/gpLEiNh
	axcegxNvKYRZ7JbvpcO1A9/Rm/RHaOsENyLf0PsDGgNUi7HLMjSASKjT2cP8Hg==
X-Google-Smtp-Source: AGHT+IGbeBQWRwaG2m6asWCEaYAvSZ4R6pE85vu6K4eY1q3+0LoQ37s73egNVq4Bc9Ij+D9CGjhy6Q==
X-Received: by 2002:a05:6000:2905:b0:390:f460:77b0 with SMTP id ffacd0b85a97d-39efba5bfe5mr10738632f8f.26.1745307528651;
        Tue, 22 Apr 2025 00:38:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5cf3a7sm163029115e9.32.2025.04.22.00.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 00:38:48 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 Tejas Vipin <tejasvipin76@gmail.com>
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asrivats@redhat.com
In-Reply-To: <20250419041210.515517-1-tejasvipin76@gmail.com>
References: <20250419041210.515517-1-tejasvipin76@gmail.com>
Subject: Re: [PATCH 0/2] Transition remaining mipi_dsi_dcs_write_seq
 commands and remove it
Message-Id: <174530752803.2829662.5162219952732867940.b4-ty@linaro.org>
Date: Tue, 22 Apr 2025 09:38:48 +0200
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

On Sat, 19 Apr 2025 09:42:08 +0530, Tejas Vipin wrote:
> panel-samsung-sofef00 is the last remaining user of
> mipi_dsi_dcs_write_seq, so mipi_dsi_dcs_write_seq can be removed after
> the panel has been changed to use mipi_dsi_*_multi functions.
> 
> Tejas Vipin (2):
>   drm/panel: panel-samsung-sofef00: transition to mipi_dsi wrapped
>     functions
>   drm/mipi-dsi: Remove mipi_dsi_dcs_write_seq
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] drm/panel: panel-samsung-sofef00: transition to mipi_dsi wrapped functions
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d6a4da523deba1814a45a593c271c32efedc39f3
[2/2] drm/mipi-dsi: Remove mipi_dsi_dcs_write_seq
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/61a0fc33b8538169eb30365b1598eaf33895c34f

-- 
Neil

