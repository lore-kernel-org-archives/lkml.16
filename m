Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C3C145B3E
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 07:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748156752; cv=none; b=E8MSRx5kmKJCGRRmbZTzPHppng4y533u5gfDdMOEvolaULW4Z4B5VRSvhv463PON8eAzxhQJsPf6bjOvPYAODF3x/G2kha+7Yhl6L9aghKLE7CdpWgF84eaKv+sqyL+dMD4AX8digpy5KinP0vMmN4PhzlTUReIAXYHwU7t35Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748156752; c=relaxed/simple;
	bh=jvhoBaZylv5JALI+/bZ2X6Rv5t1lsNh1PTJCaRNalmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cle7ES8vwAnBTtMYJMTWe/xYLdwFDT02nwTS15f8as7HY3tt+usrXDbMg8kCrjC1wb9DABdu8acla/Z9/Qia+1Aeayqokf3a7Ke8yeVCopPk/9aHQSikApNCE5Z16JVlzojqcUcXWb5zUHNudCfJxaVjY2K+Gcg4qwveINFfsHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zMcEloKP; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zMcEloKP"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6066c02cd92so611926eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 00:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748156750; x=1748761550; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvhoBaZylv5JALI+/bZ2X6Rv5t1lsNh1PTJCaRNalmI=;
        b=zMcEloKPiYVWgdWwOM8+4IfmGknQltM4azGGIxnUZh0tpXmiO3BJtLilWCovoKF7QN
         HCqa2n6yjEZxUg9jIrPl84EHVWA9SKjMI3ZxEHe85vObwZb/lBWHPwnxkzb/XNlIaxxP
         iDvieoc3zjU/D9TPuKANDNJrgLcmVSfpi8YjAzQ8HWB8dbCekc85fZQHszb6qXnxkI5p
         HZjecqkrpQbqS8uomjeDJWfhIv7AccpilQUx0I9IYBr/9KCDArm2wOAsSjp40m3AZoVJ
         lBWQ+Y39GGmH4DZklc314dZmkO4JCo0iK3WbyB+SAlqvCoMtMkVik8BqY4A8EPnnNzQE
         VwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748156750; x=1748761550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvhoBaZylv5JALI+/bZ2X6Rv5t1lsNh1PTJCaRNalmI=;
        b=sacx3/aLtliXD3ebFYAg8sGyxX1XZkp1U0oJeA5AKJe6N5NVVRrZxxTsougTZdPHVG
         QX15b4HUUThwhrKIgrR97VHnlvv5YZLyxLBIav/Eq8DfvwM8vwr/3i8l2D9uts+8hcWr
         9Rmf9qsRjl84AwZ4FFev5/wVtXO8zEhmhbmFiWl99E8Tit2JjMzr9DnsIsj7FdjafQGE
         l+zFmtQNZe3362BtPWDbdZ2lV516pCEM3F1DNV0saILkkgEmJZ0REj2TPytyd+kKt6MN
         oyID0YbwDiGd6tUN5/36ablE4UbjPk8Z4AsEleOmRewCrnd0mixwLFDqpMMht4BED2EX
         5qIw==
X-Forwarded-Encrypted: i=1; AJvYcCWA27SzZqHv4FhFCMHbGi+mRxBaaEXjTEA5XtYFwICSzdgpqc+LbThCPAxP249y8DlmsFVWZ3t9EGrrkt8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNcaolXvdZ9H7kq9KbuhlbEO9CjWu4MWwZITNu+4Lbd6Y2rZMX
	BE9yHRBFRUbGLjhFDIdlpnmtD46GEzEqfZJ3D1ubiD7akIb0QkKIZrjPvalwkyVrkLUrxt7Ga8m
	AcbwT8db59chxIK3VwuaUyhdOpcVcmvA36g4n/Dizmg==
X-Gm-Gg: ASbGncv4TbGeuLNEx2n+3q/xVrsbbVvBic5qUGPLlJa30l7wEF1J3htQtJ8K/b948bu
	ak9h55i0R2dkLSY3A5yGIkfewVMJDd41PNCexKO5u3kyTFzOHMTbdrsS1bOKN/on5lg1cwfu8RE
	GZxrF7Mz7qXaSHgGg9MxWSCayKuESj67AWXpUDQ/IWOZQE8o2jwXfFq1Q2hhMl3FjTTA==
X-Google-Smtp-Source: AGHT+IGPkyRDJYTnbDg706EyGxrFrSBuZIpU6gujwRJ5t4G9MskZVR3FMKn2gTUYPOf5EomM6pt3h4XtTjZNiHOsagk=
X-Received: by 2002:a05:6820:1b1a:b0:604:5e57:80ab with SMTP id
 006d021491bc7-60b9f8ac9dbmr2898191eaf.0.1748156749921; Sun, 25 May 2025
 00:05:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org> <20250524-b4-max77759-mfd-dts-v2-3-b479542eb97d@linaro.org>
In-Reply-To: <20250524-b4-max77759-mfd-dts-v2-3-b479542eb97d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 25 May 2025 08:05:39 +0100
X-Gm-Features: AX0GCFuYwVDbJuGWCNZYKWJexcFUkr6L5u2qT_trsMWFdA8H8nt3PvddMdXZGPc
Message-ID: <CADrjBPq9jzuDKXE1++ds=q85eOFDfBQ2VizjE7GX9t24wMsbtQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: exynos: gs101-pixel-common: add nvmem-reboot-mode
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 24 May 2025 at 06:21, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Add the 'nvmem-reboot-mode' which is used to communicate a requested
> boot mode to the boot loader.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> ---
> v2:
> - add dm-verity-device-corrupted
> - update commit message slightly
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
