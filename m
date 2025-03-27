Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AF020E01F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070392; cv=none; b=ZC8sKmMIJmFuXeJe/k7xXkaCRd+Yy71l4AVUDv5EAOw0RItA86aghqoHZQLF3ho20Mkb/xF1M6NXax1o/v8NJINH+ggjvkMzPCJ4QU+hG6QkHe0MEbiNIZFGNezSs1G+KhxNtEYHnfXO72BId8Kxxi7V6OairOLuZvwIw3wRqWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070392; c=relaxed/simple;
	bh=HqYxxVPtZO6/vDTNll1yUhXaMFK80Ex8e3/ECvl+j+k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PTdk/ZrSmx3E9loI+KWt+WoY255PobYCtIljUcwFxAdfEkXyMutw6OA2wx5jnqYY5nqat8hCdl/BNSYSLnqsXY6tUYjiYZHaOgFK5WthqSl2LxmuRjqu/Es1CP/JUaW2p5GuoUP/4Jqk0ltWSje6pfpOD0X4SPhVfZfKuwXs5a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ne0uzD95; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ne0uzD95"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so4724965e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743070389; x=1743675189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xo7iAv+9nI2kaufsKds/53FFNGXfbLXPYtYZ+pjxKuE=;
        b=ne0uzD95tEg3U35XZioP51rXJr9xvpWc1veQT5lh0ufoVKFXwQt1zn0aBDMrJ/qt8q
         4Y22Y0MkyFC3TvDfdd0sJaMTRvOOjdJq5+Rd+xx9inNYv8gzHHxMYKV4kVyN+CncnH+5
         wfK0z3eNXdIF2/jor06yFkFmo3YKwBy3Gt0a+PW5MESvDkVHFfRHsqBhgOtuq7Ww9CDs
         m0YotQKa7fgQ2IoM2JGU6T+ekVca45FRg0SqixFDxxfPwwFeNZo6hGl6y48WJX+cTpWh
         eEdZtnW1MYxZnpNlr+7Y1Vube28p1UyrJFLPTUoIjH022a+OoTQc66cg1lmKu0GFDujk
         Ej1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070389; x=1743675189;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xo7iAv+9nI2kaufsKds/53FFNGXfbLXPYtYZ+pjxKuE=;
        b=c8shiqkfhsZa/W3nW6Dgw5UK+r3D+PxAgB1azQ6QS2gnpR66Cn0d33NbUHBURm01Pj
         q8Fz8ycisWvmWIOzZ5XdWjl+D6DXdliJylhQeEJ5OOAIoO3HeDedSzjuyluqYCUS7SFn
         kYJeK/ass4sjnq29deHEahzAaSMcZ+yWtUGBJjyf8Jgr53Sifbrt979Qz6OUdMevOjQl
         WZ5/2fFg+3DaTL757ZPTwvJxfVi9CYVdqT9eOlnzOji5SUUN+H6AceKHmXPv/8SEtiYv
         pM3CIxP1yi5wSq0HDHz3f+d6r7v2dgow6bzIPn0Uvdgb/3v8p33cRPBma8GQedy09nYb
         +dsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZXv2bUc0Vc68eVcYdcHoBZ76I174GkjaC41ZSeNtXYpb7LmUnCQzu4AxnrXZbb5pBoT5604fJbeVKN4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhZpyIe1LbkR+Xiby97DliDDFfdbvQFf39hsqTA4KSZPd/BR52
	iHZ6VfY7p1dC2RVA7q7Ho49+jAoO/zXsDtfXui8yKt5KWztQsB2sJGGdO3M2OXM=
X-Gm-Gg: ASbGncvD8knFHmLGQhqVEFavARJ8a7wq7I6Zyet+7a6tE/X38PrDVVnFG9jEv9+FQle
	hBQUWVm4PPHG3ePb3++grdSFQDiyPGJPh7FKbdCs5szn+MNwlxKnuiIuGQglmTQwGlO7+GZTsxH
	J8VSM4lLzNbXXEyFxkgjUVP+gFwdn70cKVIIKJODgHxeW1fTfLceeRucuQYOY17U2eZALnQUK46
	5lY30Gd8D37iN2hX4IL32dbxw0Vp4srMLmq5TLAvohSSFOqpPMZo5eUxq0UbXMbpIArvbsCFITM
	few9Gz8NLEhnp3HygCsYCcsTXU9/XVTHmvkthxp+MQZuZztz+WxSX532P6Pz1qNNLQ==
X-Google-Smtp-Source: AGHT+IFz+YPLrvTgN7jlfBOiq8HZmmXGzvYjXvGO0VPFIOTzfMvVnsPizrlTsSXhwRlZyW4HwIgm6A==
X-Received: by 2002:a05:600c:4f0e:b0:43d:1bf6:15e1 with SMTP id 5b1f17b1804b1-43d8465f999mr27131955e9.1.1743070388941;
        Thu, 27 Mar 2025 03:13:08 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efebc2sm32345205e9.21.2025.03.27.03.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 03:13:08 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250326-pinctrl-node-a4-v1-1-8c30639480f6@amlogic.com>
References: <20250326-pinctrl-node-a4-v1-1-8c30639480f6@amlogic.com>
Subject: Re: [PATCH] arm64: dts: amlogic: a4: add pinctrl node
Message-Id: <174307038828.3221991.15446720184220513001.b4-ty@linaro.org>
Date: Thu, 27 Mar 2025 11:13:08 +0100
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

On Wed, 26 Mar 2025 13:17:16 +0800, Xianwei Zhao wrote:
> Add pinctrl device to support Amlogic A4 and add uart pinconf.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm64-dt)

[1/1] arm64: dts: amlogic: a4: add pinctrl node
      https://git.kernel.org/amlogic/c/77fd52e77d325aac301601a18f7cf06de1565a72

These changes has been applied on the intermediate git tree [1].

The v6.16/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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

