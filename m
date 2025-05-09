Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E35722D4CE
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 18:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746816965; cv=none; b=Cl+OOcUuzeGwOVEcBwtx2fu3090VFWwvKf0djZeUgRmPwSRtzYjAJu1Yi6MarZccFBecq2nawFRvehthiMgB51kw5N9fuM6LnP/RlbLXz0YACyfgyFvr0XYYWSK67KxcSPBgkOD0Agu/eIgkAufAjnhbRCeM7iSbUUeRbffKBAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746816965; c=relaxed/simple;
	bh=QuCYiFCKlJouVpEM+mb+CLCrMpmauHRnutNo7XMBzmI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nrlvW/i4z1F6UklybyAQTUXkIJcIhGkk24JFy8w01lilXMBBVVIQXUzEnhEKWwve12+t6GZcQ2lJEyhkEavYJLlOSu+jOGb4Mb03w1iTmEVSzQkIKNVfKnD/t80jKhEsrXk/YXL1D8aMeh/3hJTRDbWSbvLujtlMqSqzfGW7O7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fe8v/2IC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fe8v/2IC"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso16362525e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 11:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746816962; x=1747421762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbxtS5yi/0Srg9MgfDGhVG9mOHgxoToLsBc2u3rrXu4=;
        b=Fe8v/2ICHuDgN/Hlfkrf8s4G93uq55ioshfw2fOzs6mlFczResIC0n2IYZlGe/D+Vv
         cUXxDScQ49syLdjCl1GDdj4s52xrmP9EspuoflMb0rQTnZyxPeqtRu8Slc+41iX+NZPH
         n7pFZIQFMYvF6rWB89/nxVFCCEEpoGhaNkyb2XwBaezTLUS2FxEM2EBsn0Fsg80a1u7q
         Sft0i5t/VT9cD5bqfVBk24NazR4GUFZ6/Mk85rIhGZJC0XwEvjK2pR3rZb0ih5QIRhgV
         eCxhDQQijzeyC8+hRDftVtXPaQAI2FAJCFNmBR79g9Q1Is8iuzMZ8bB7dAxvDKUMrutH
         CkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746816962; x=1747421762;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbxtS5yi/0Srg9MgfDGhVG9mOHgxoToLsBc2u3rrXu4=;
        b=eYe65xr58InM2p5pPEII0+uEMcMHpBKSlVrSi6QPRxppCUQ6WhhF2uAxvwDLw3yhNe
         Dz+0kVRHGZ+BWWZT9YX482rHMFFTok3ZVeabwV3zorOptJTlzMNqleftyE+9aJ7f27Qh
         9OIoay4kNgkjIzIjhQQuMSO3RARvqFeTYHewCXHq+AZm4A02ipLuwgu28VJtnnIcsYJP
         OSWB+YKhO1A1qdBFPLDFXNpu3JT5bRaa8zeoTRqfzSHZRQtG4HYmoU3FKdsPy3QYrJKV
         QKGzJRgBankQm5d2IgfiyBZDmUHtxu7ctER2qN35donKqxlhpqos2GJno5kmrHlJscOp
         4L9g==
X-Forwarded-Encrypted: i=1; AJvYcCWIKfNsYkn/8DptQ0g470f9UsttgHOxbzQlcFCa2+t5ofSWbrOyiMxNngLyehyjfg2CpzK/DGExHnzglxc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDcb730ZEyDtLaIWojoXlf+poa6als9Se+D1cIBSAs59qmCylX
	VXrC/Dn1aEgNUMLeEBQi7Ra4yhPziFXmxHzT4tDv1zAhSh55ELOWaJ/1Xh9RSR8=
X-Gm-Gg: ASbGncsgtKGYRkAsmHqbDTDxYqEMx1zN+y/S/OjHDcdm/7UmD3ukABrBZpT/bG3Ruq0
	393EHwAkwpo0aAzGliLBt49nu17qeYdRJ+6W1Cvef45qiKl5ZU4NQnIEuELs9jXs5o5TiCmj3RE
	wIVouIAySJbmF8bivUNQvdSsX+yLHe54EJJuc3JslVgot6NlLgQ2NyuNrsRQztFPjSXFIN1lMMW
	LwflvJFLcqJkg3/5bqwetL9ywwOqs5Jh31xYgI/NLuj7A3UTow/L1d+x2b+f4GiJAbdV9v2wClP
	DjV83qfcaQsvDUpDi7SeLQoFQneh0JiaSY1lJybnbbyElcko7i0npcqt0uawIyPCFAzRPzVg
X-Google-Smtp-Source: AGHT+IHYQkpkKi8CkEHzddCWOZceMUv66ifC4WqdnYwF4TBNK6QI+OtfU0ViTWxy69iYNRZgfgnN0g==
X-Received: by 2002:a05:600c:1550:b0:43c:fabf:9146 with SMTP id 5b1f17b1804b1-442d6d6abfdmr45281565e9.17.1746816961791;
        Fri, 09 May 2025 11:56:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ae10sm38009955e9.37.2025.05.09.11.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:56:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, christophe.jaillet@wanadoo.fr, 
 skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250505184338.678540-1-richard120310@gmail.com>
References: <20250505184338.678540-1-richard120310@gmail.com>
Subject: Re: [PATCH v2] drm/meson: Use 1000ULL when operating with
 mode->clock
Message-Id: <174681696108.3272668.11983752901167871124.b4-ty@linaro.org>
Date: Fri, 09 May 2025 20:56:01 +0200
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

On Tue, 06 May 2025 02:43:38 +0800, I Hsin Cheng wrote:
> Coverity scan reported the usage of "mode->clock * 1000" may lead to
> integer overflow. Use "1000ULL" instead of "1000"
> when utilizing it to avoid potential integer overflow issue.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/meson: Use 1000ULL when operating with mode->clock
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/eb0851e14432f3b87c77b704c835ac376deda03a

-- 
Neil

