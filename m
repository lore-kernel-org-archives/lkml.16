Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02321D5143
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 06:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745823460; cv=none; b=fv0/D2Xdg2sYLCC3cFr11PtcJorHAewSsRMTorxc0W4YZhudHyAdjnTQOwyNOfNkFLKCFHWygYoDJ8HPH8S1KxiJtNO8UsliIf8G7+ceW9Lg4LqzDtA/+URv/uA7xWnaYS0WuqWelvfS7aMXxGlRpMggKZqJwJxy8T29WgR9pzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745823460; c=relaxed/simple;
	bh=d4XFv9AM2KzoklohKn4qQQWEUfY2HK2Ojc07GQWCCU0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GbgolUx1LJ180vqyxFd/rwlHSrb7FnEcZBq7U1GGgH3X7Zni/XKc6k4WWU6bzcYipEwmw0rqmK9NSEEtMIapMc3lkanqhIvcr4GzDc0xvkERFvMYSQrYCGB4slJKiyxoszaEHR8vS2p2WUcrz4nuEN7q3Fc5VVvPF5wj9hlfWGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BTMUUgkd; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BTMUUgkd"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5f801baf960so16325a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 23:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745823456; x=1746428256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+ortHNrfOvVi3JtuuibxSl/bmwTJ5xWjzQLpGiIwY0=;
        b=BTMUUgkd+v8IIPzvt+5P5kyH2sC5Igo2jIQ64GKuejDk7mQjFMKzsZbGHUlTLLTMNn
         rqtb4zkYLhASdIiNvINmjR4kRCAmrSSTM19m39Zjkx2BkU2zIWYO3Ji5fsGm6ujWOfjZ
         5+JpEIMpF780H0bapcyC5NJlnM0t5h6jm4iAhYH2RCmFz1kADG4r24Ig2GObHkmPdWAr
         pB7VoPdfwXZBDNm3gOTmS+q+Ik/7FmpIehiOXiHOL1SzanL5NkwXNX3y8ceolyHSbHQw
         vtFjGkdgIpSVytA7f9O2F9yB0OkKDSGTV6NtBTm+jUSanjSfbHfzbH48frpyn83wCFgb
         QiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745823456; x=1746428256;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+ortHNrfOvVi3JtuuibxSl/bmwTJ5xWjzQLpGiIwY0=;
        b=mECo0gshRDBLoQcVAju77NYNXj4VpYhcc+cu0KvKVqN07VUrWN1TfXECvGmSjHPZ8A
         PGWxA/CpJEn/96KsmgPuS9jDD+l2Zk+M1iVmHWP/PaRx7Kf9AwTV+Fcvn9hxLgyzV2Ax
         Qtqa4ZcYhZOgq7tof7Mf/aoMJPQ6tEKN9EVuagdexcHeYJ9/nB7AVpIMu4fQag0nX+6S
         PlO0dK9pLU356gBzxn7KHYePjB3gJfO8/ntCiygRQjVgW7vOe4EqOGhzJnRVo6xLHnii
         lI6xkKOOX9Xsag91PcWzWoXMkeeeui3DRSDCBT2W6rBRi5m7klv0F2+XoHiRjLxHnTP4
         kM8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUf65EhQGz7M6DX0mLoplhZo3PbJaPWV/rs1NyawJjqLVEm7ffccW5uFWuxKEwaF0oslkUA85pOPYVxiBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEXP+NjNTOtWYLpPmdiXeQE1rw8G7InN0CH0DLgxWp/TDoOO80
	dPe2FjyjyW6LZ68qPbyiDSxDuq5pcwai8mDGshCI/6AkLB50QYMLZKxEIK3py0izPNw7N8Bx46Y
	O
X-Gm-Gg: ASbGncu6gfwWze7G6afAcGFWeRjLkkUtqhZO3Z3BrYkvMNIdJZ4hg6JXQLErvsVm3+2
	Z1JWDOmZnTm5bZVg5I8C4g9NiCl1fu52CPvU98lBNkoxikLQzcfCt4Dh4TfN81pq46ef9rTBrak
	PfX7xmBuwnUhWSbsA7cyZM2LLD5DzfxSGUb44iNAwXWwa2iMHSGi8gJ1GluuBIIL/rYsJyH+pP3
	kHQx4xv40NGBwwf4isucFqPEqyQofA3Dvrjw4Vio3yTLXDO+cq1olDoDWxNJMnm5BrEv4pB1Nmb
	Wtv6w58HP9MW/elyu0stDnuLDEG/n2SI5WgrIHtUUy9PJXwF+eZ6Y9l9row=
X-Google-Smtp-Source: AGHT+IGPXwdKcilrH0EaY87ltjYS5IfxJmMxGOJymVoJWkuZjfIeQ+m0X5W+e8qJFuxvTNyVzNvW2g==
X-Received: by 2002:a17:907:2d94:b0:ac7:2aa0:309b with SMTP id a640c23a62f3a-ace7102a77emr346405166b.1.1745823456326;
        Sun, 27 Apr 2025 23:57:36 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41b2fcsm569109166b.26.2025.04.27.23.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 23:57:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexey Charkov <alchark@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20250425-apc_paper_binding-v5-0-3aef49e97332@gmail.com>
References: <20250425-apc_paper_binding-v5-0-3aef49e97332@gmail.com>
Subject: Re: [PATCH v5 0/2] ARM: vt8500: Add VIA APC Rock/Paper board
Message-Id: <174582345507.19754.6996971204397782519.b4-ty@linaro.org>
Date: Mon, 28 Apr 2025 08:57:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 25 Apr 2025 19:02:21 +0400, Alexey Charkov wrote:
> Add binding and DTS for the WM8950 based VIA APC Rock board. Paper
> is the same board for all intents and purposes, so reflect it only
> in the binding description.
> 
> Split the series from v1 into several chunks by topic so as not to
> spam all the subsystems with unrelated changes, per Rob's suggestion
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: vt8500: Add VIA APC Rock/Paper boards
      https://git.kernel.org/krzk/linux-dt/c/5ff150fc3755516937e7b1747722687ad4f75eae
[2/2] ARM: dts: vt8500: Add VIA APC Rock/Paper board
      https://git.kernel.org/krzk/linux-dt/c/927e1b7ac361fa1a76fb29caa21853c9d8ba315a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

