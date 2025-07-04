Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75C35FEE6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751641883; cv=none; b=m8lF/IRJ21W54s/B40qGSJkRIduGzgR25ytB38mcOLBO80vNhHfYkiCI31QVzDarNE2VBOAUPlUM00NcIP9uiRhpztvfPNG4A69tWKB4b3fYTDZxAO6wTsGAOAQsAJHFOYJXfM69WpIpXDMhHjCEClzaNxSOKr4sqRlL8BiMVq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751641883; c=relaxed/simple;
	bh=2minLDyG5d0VogiZ/Ke52L2s1w2fOZUyNC6Repf/8Yg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Dw+PrbqhCkckCu52KGQFsWuOCq56ZgyK5cskecI0H4UNQzF6v9eB/6wrvm9QTk3p/LQt9LR089fXSYXKEaI2hjHeCRk38sHmbmoe4+ASWyweZJmIVQA8W7jA1BRXBxpRG1kuprtmgDKs7I688fCkPNdnTSLbvAaI+NUHyALPxPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AM2+kpb6; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AM2+kpb6"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so771200f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751641880; x=1752246680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoEspbh1eRKE7g7m7KXe/ScKkbCYU5aYNDNwW3OSB14=;
        b=AM2+kpb6WSatxQN9kZtzec+9cZiDo6vbdgKH0IwaJF5XL221H0yovD2t26ZynvooML
         1h+17ffkoi9HSZHBNy2B2DWGc3JpVXXjUXIqt8apDbODB6uaZJiBL2UKKG9mYCxI8q1u
         oANS00dBhe/+sDiac+3s/G4Y8qdU6Swl5+ziT2Ubm3bsWbZf1SGZqMnMv2y2irblVJWg
         9DP6Vz1Q9I4ooEM9BNs5LdO/mnCsBbrm1JIYI8tGMBs3d06gV5EuntmXWr5mpIccE13b
         ZFiGwglYzLukMjOgEV6j/CyN754NtJAUUvEj+vGJ1CVFsGeMrFrUyJ59gLTY0TKk/pPX
         eIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641880; x=1752246680;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoEspbh1eRKE7g7m7KXe/ScKkbCYU5aYNDNwW3OSB14=;
        b=oq2DlqaH8HHZROjOI4DDHuQNkbPEDDCNgB5u4BSa3EKM3/mwWFZWF4Nsy/pgGMTmNq
         wvuku2zdoT6hkJF9bRhJf2rLo0khKtTcXA18Yd8egNWFqsJW4KnETfJOsa3zxjQkSouV
         qdg9UPF1jvYrf/MgeZvOHeWhpo7fzEIVZXnnRrcjCwgZZ/wf5nnnb/pYAQAiCFjjSq04
         tPNw5pOcZZRIc+S3BrQr5IrulSaQFqSJeELVquZ7Ijr9hfPnasS2jYCL7EZ2uOshH/Gn
         H45xvD2Xfb+Jo+f/r6bIrhQJDpJrz92yHhGIbsB7Tf8lWcZwgjGTzsBeKYFhGPaOu07X
         pxQA==
X-Gm-Message-State: AOJu0YzLVME4yuWYCnC167ZQLW+etBI6lc7ZO76zEEc5lRX6OlFp7S/d
	qto7i14Po89ZSpzIa0glbr2ZT4WQiKbO6GdiRFrF8LWoY1SQWGF6GLwkO6Pnp78/UtRN9tfdwd6
	6rEtnsr8=
X-Gm-Gg: ASbGncvmPVsS0BnMytw+/qZfRWLBQYR93H4sxWSd/XYSjTqWkyBhIYs2dR/B8GKGUbA
	pTZLFQjhdRqrjGKe+5gQc99gFfBtHHtnKF3DdQvG/erqljHDRDnm8PU23/POujvQ8X/+efwoJY0
	foIM+DECFgV27C+zHjBDAnl1MnVYR42CDAoktVrRuuFWXO8sZHWJ4x1vwINIqHa9idgkmM/JrVl
	QlHFS09P9SLTaVpBJTPJrUA+c8zNS5cXKZSlXOiPft7Mifmmm/D5J0iVu0yTOFc9HHXfa90bRfv
	fBjfzOy8iKvGA8lcIZbrVsbq/ULUzObKVJJ6kbujrmyZPzDOyTOC00BIPg4pbhNzHn1TSrdKwdl
	LoL5Q8sMTJjM6NTt9YA==
X-Google-Smtp-Source: AGHT+IGJq4QH4n1fa8cinoR1z+3JkFuWIr6OSpZpSR6Ueat01j+mEIj1olmOHplIEibyLWK0AicYSg==
X-Received: by 2002:a05:6000:250f:b0:3a4:ebc2:d6ec with SMTP id ffacd0b85a97d-3b4964f8b3cmr2987717f8f.14.1751641880123;
        Fri, 04 Jul 2025 08:11:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b470e928aesm2675416f8f.44.2025.07.04.08.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:11:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-kernel@vger.kernel.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20250522092940.3293889-1-tomeu@tomeuvizoso.net>
References: <20250522092940.3293889-1-tomeu@tomeuvizoso.net>
Subject: Re: [PATCH] arm64: dts: amlogic: Enable the npu node for Alta and
 VIM3
Message-Id: <175164187949.2868628.8689971906930320435.b4-ty@linaro.org>
Date: Fri, 04 Jul 2025 17:11:19 +0200
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

On Thu, 22 May 2025 11:29:40 +0200, Tomeu Vizoso wrote:
> We now have support in Mesa and everything is ready in distros such as
> Debian.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.17/arm64-dt)

[1/1] arm64: dts: amlogic: Enable the npu node for Alta and VIM3
      https://git.kernel.org/amlogic/c/587c1c00f75565567d1f26a333a3392f7a21c28c

These changes has been applied on the intermediate git tree [1].

The v6.17/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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

