Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E887253928
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744904597; cv=none; b=chjOcqrvTcv9WoxQDCKbOZzsA1g+X0HbBzbUwX937FeqwB0V+O/3lruSH2Lt6AaHMs9LpjLSw4nXgpKvqCZaVE9N8aYeuddXvxUzTHckJ1CfDVbM0V0PMADrd1NRAqG4rlU2wDUlS7qOf27QUI8m3JsA3t3Ja+5cUXs80NNkC28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744904597; c=relaxed/simple;
	bh=JunynEHKwcDuDA+6MH8FuW3dXFyO4ffcAIP8h6y2R7I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iXb0Iwu1Uxqz1nWanNrNpQ9vb2GJdUBpQXHrtP5XiwmQ35e21Wgueex2yjvCCAUr2qZ5bUab/jWcGE2o2BRF8BWqwfVH0RrHmwMAguxHiV2B51Q/2G1pUegB3mkwrID43cFd3cPs9jcEyzVgrPulpiXz+ZR9/WurQUvoB6Muul8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VEaoxotw; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VEaoxotw"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so8035775e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744904594; x=1745509394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiy6O1+ukmiBCdmursvfIZ1ixOUonC4Bg5yCWPYc6cs=;
        b=VEaoxotwSMEhos2MmPbRtrImMDPjXI6tlNJebUk1aR5YidNAr30HPuTvNV6Ujk4pqE
         L31v2Hyk32J19Dynt7Zp7im8yeOGjO5WeK5i0jdXw06MXRk6VNR+72pvvNvWjXDkgkvk
         xzWn8Dbw0hwQQkbdza9pNDyaOG/XMBy0oc5YuSaB/dzBOBx77LVIEaS1+qZXvXFGiLVF
         Zvwi5hfoBcvxKow108xycpmQ/Z//mq1PEVDrYpC28z5bSXvj+pPqKnBvx8Jx2ls7M2C+
         4UZCa1+Arfqt4GIGIm8rtfauzXN4zVhkmnKMpae2q0/dqcuvD9ZPfFV7IYoy767jj9/w
         E6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744904594; x=1745509394;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kiy6O1+ukmiBCdmursvfIZ1ixOUonC4Bg5yCWPYc6cs=;
        b=iAtCn+x+r/4JN+ZCOGA6znyITToqC3DUljrgR6CYeg+TNO3+iHweWtXnsa7XzbgAKQ
         0uHGhZzY6xfFZYmHMjcyYCQw/RIJdYeLU4BGNE/cZ8DwzbbK1wgTxe1yo6bWavljrbDv
         sG27UO+sZE3i1K+LeBHaSDqGwH0D3eONhJ6dmidWJJe+MDeGrs77ZEzzxFCL5jDrnSoE
         Z4wMAX4VwwtQTRocIjEpTv9p57iEEHrCvXgkrB6HLcPiGoL1UfWCvfeY+EbP3uS6AFuo
         gkuO4T9A8bv70gHXdkhML/9yAR09TU9YzNsRg2IEYAPHbcxrGY1XyR9T9DAuqF+AvKJt
         68gA==
X-Forwarded-Encrypted: i=1; AJvYcCWoe1gAokAQN3oRbp10vKSsPbHLgRdImKyedqCXOAm/Ql/G1M5ACD6LuFMDIbH19d6/qabl39F11/jKzPA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5owD8HemyPiVYLoVr9uJSz/2j3vAr2afqPIzFZ32iudLTIfGN
	DiflQ9R7YKHB+ephFkHVxvcSwfJ0fggZMapylQ3e+VlUePwI5HnJLTsLiyxBOGk=
X-Gm-Gg: ASbGncsAHT0aoEML3YTXz3vyuIic2z9YmaS0GNF1aEapAGdXPLWs6/ZwKId7LbeVLf2
	7cd2k5ix+EdeZ6uIsR3PAeWEhLo5ovexoSvf0SvLilALK2kgPpLQFpRYgB1njjrEKa/Inn9+UqZ
	Cov2/2VE4+YtVEGChfN2NX5rrBODEndyKRmycNebar3/uH0Zla0osPpmmOIUQMQnbyiojgN/f3J
	z+mFG9Lnwo+/b3mtpiEZ3yr2Q36o3K1Cc3z5AeKUSazaJSOTEa2FFp6U7AX+aPRMLcVXMlU3fTe
	ZQhxwY52KHE5XFoE0lIWmss+gLsSKaWVVBtlNGEae5Fjb22zqoyqvYsfdEJ26Q==
X-Google-Smtp-Source: AGHT+IGul/ExpZp37TdPvsaZIQLJkYja32KQl4f188bFltaB6kMTGBke5KI4F7K8YdebH3KDbIM3SQ==
X-Received: by 2002:a5d:59ae:0:b0:39e:dbee:f644 with SMTP id ffacd0b85a97d-39ee5b8954amr5771154f8f.46.1744904593983;
        Thu, 17 Apr 2025 08:43:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf44577dsm20773640f8f.94.2025.04.17.08.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 08:43:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 "Pu, Hui" <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org
In-Reply-To: <20250411-tianma-p0700wxf1mbaa-v3-0-acbefe9ea669@bootlin.com>
References: <20250411-tianma-p0700wxf1mbaa-v3-0-acbefe9ea669@bootlin.com>
Subject: Re: [PATCH v3 0/3] drm/panel: simple: add Tianma P0700WXF1MBAA and
 improve Tianma TM070JDHG34-00
Message-Id: <174490459305.1152288.16433755651449379930.b4-ty@linaro.org>
Date: Thu, 17 Apr 2025 17:43:13 +0200
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

On Fri, 11 Apr 2025 21:19:43 +0200, Luca Ceresoli wrote:
> This short series adds power on/off timings to the Tianma TM070JDHG34-00
> panel and adds support for the the Tianma P0700WXF1MBAA panel.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] dt-bindings: display: simple: Add Tianma P0700WXF1MBAA panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/12ad686ffdf51920000e7353351b163f3851c474
[2/3] drm/panel: simple: Tianma TM070JDHG34-00: add delays
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/716c75afd83c837f14042309126e838de040658b
[3/3] drm/panel: simple: add Tianma P0700WXF1MBAA panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/178ac975357e9563ff09d95a9142a0c451480f67

-- 
Neil

