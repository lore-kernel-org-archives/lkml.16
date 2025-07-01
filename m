Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0AD1DDC15
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 16:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386170; cv=none; b=P8DKlic5caop3fX7jC6OEwa96hqckwyJoENLlXN7A7ltOiFy4gLjg26GAoq+1Ku6UI35xmUK4yTTkRkChvPWV3HF7OQB4B2sTt4EWebNy3iAgs71PTevvIRnnLVKKx5yAbtSCF95VPfVNjxKNnGr1g1vl7aIS/q/n1UMHwZ1RGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386170; c=relaxed/simple;
	bh=K+T3bxWVYyQAHRzTQeHYUtnchpuJpUJu3cF0vJ5GJo8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=joT0Yz0rRlK6nBJfuGUzsMjeUE+AJpnUwiVodNQzcoiHuBT3ohy+jr/uLR4ZESvJ7Rn5xqFXNc81onIm9eG5NU72gXZ87wr7Walfkuyr/dOJjGOwmvCbY4bZ6jL+gxj9jXGohzTmuKj2UdiUkcni2AkVTECrqzYR63dkD0/xxXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MhYX+q9n; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MhYX+q9n"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so34699485e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 09:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751386167; x=1751990967; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+T3bxWVYyQAHRzTQeHYUtnchpuJpUJu3cF0vJ5GJo8=;
        b=MhYX+q9np+J49Jz5gXvsgQvnVqbBR77ivy0Bz9ZerHvjDw0M2fB3S4TzhCc0hwXUNR
         MFgCf6ehHYFyN2ryJOGP2TpdAeoTMSbjEtVuiTlj3ftvfsJJ3o5E0A2tkrK4Vd2bHf+x
         Z8X17WX+QBC/piMrfIbmrCOmhVtHAceF5NQKvv2Bwqw6CBczVlaGLHx29XFB2XOk5YyP
         PLZkjAsKcWXczrXia4K/BzrVRoX3kKGARQoiEgkzof1JVOX9sPtZRxZy1Yvcyg+DzwVv
         UzVSDmrzsRmEPjcb+w4Cbdzle0IYOcbBNhfzhGc34Z1/eFscSRvvafdqeIfXHKVS+4nJ
         3dsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751386167; x=1751990967;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K+T3bxWVYyQAHRzTQeHYUtnchpuJpUJu3cF0vJ5GJo8=;
        b=p8Pmu3LH4zOKWIJhUxBKGtMdSulw6dMiVCZ2ZA+3t0wN5iwj9KJV7YkB5F13F32dXa
         K3yUkhsNg8JxUL3o3AkRhCQuyJ4xs15U0Br1D+Rl7H0YLSLtdMegabt6TG/myH0EGsOx
         yjTn89mx/UvJSY/nW/z86gO3XWakRsFS0luo3DdtK2FSUocRm5c0LoLAtHs86RthbLfF
         s9N3Mfv46ZB/15mv1h3BAf6bkL/ZKzZMVqESNVYB519a52c+r7CIvjoctRPon545fdRs
         KI82pIQVTRAz2sGuSuzz9L46GG35755QBpB/REJDUXMbDpG4VzBj6ZR58CNQJfBgGrlT
         Yw/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1OoQS4RRS7KwhzHhP0NotcHXJnTGrY+HZTSWn0ctxhvzr208RYFZXET1LSMqQ+lib8riJ/Vb7mQZ3xYM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKMgsGo+BgWUqLDHqDctDYM/UHfE3eSoE2yWRz4mbA95Zj0YRd
	j1+s546jaFGkUxUgzMEmEqx7isCrqeNQA7SkGliKiBbX24jI8k637g98eGlFqSWxxDE=
X-Gm-Gg: ASbGncvuO+3XlmTHe4iSZcV8+5yvnvodXFmYMI4zCDmDY9mMq09I1dO0bL4MTvGqc/V
	hMJzxYIh9l0GxCgkzl2D3sMUqAQIceZnwlWtSJlwSAixCzmcvVWyqfK4X8ERQ3jJi+NscrxktvC
	dA9YjlNwIJOMjEbs83hGVOlk6V96mwhLFjxHmFRmVHeekZZMECRnghbe1tW04dovHYmDrdqUd+H
	jlLDJuVghN0AS+z0W8FY2sde/sCEoU21R2BWnUi8HpaYZED5QqcAtV5itU2VxMh/48IjThUrT14
	tlLoH0piZA0PBPap1aqGBNuktpgTAXOkTQMK95hD4/uwm4S3gz+mt2FeCAW6BFmsKvGb
X-Google-Smtp-Source: AGHT+IHvqdlgw5S2/7qbCQGfsKVz3OrH4Z2eUt1+67soqrLzTtti+1/X6TECdPtw6LHSo1pw9uflxg==
X-Received: by 2002:a05:600c:4e09:b0:450:c210:a01b with SMTP id 5b1f17b1804b1-4538eeb8e0amr212563805e9.17.1751386166493;
        Tue, 01 Jul 2025 09:09:26 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:4dad:b69a:9c81:2e57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e62211sm13761854f8f.99.2025.07.01.09.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 09:09:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Jul 2025 17:09:25 +0100
Message-Id: <DB0UKX1N7VZ5.VYBEG94Q6Z5I@linaro.org>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: qrb2210-rb1: fix GPIO lookup
 flags for i2c SDA and SCL
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250701-qcom-gpio-lookup-open-drain-v1-0-9678c4352f11@linaro.org> <20250701-qcom-gpio-lookup-open-drain-v1-1-9678c4352f11@linaro.org>
In-Reply-To: <20250701-qcom-gpio-lookup-open-drain-v1-1-9678c4352f11@linaro.org>

On Tue Jul 1, 2025 at 10:01 AM BST, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The I2C GPIO bus driver enforces the SDA and SCL pins as open-drain
> outputs but the lookup flags in the DTS don't reflect that triggering
> warnings from GPIO core. Add the appropriate flags.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This works on RB1, thank you!

Tested-by: Alexey Klimov <alexey.klimov@linaro.org>

This also should be:
Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
hence Cc list is not full.

Best regards,
Alexey

