Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1DB2367C6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745306867; cv=none; b=cNMqf8tIyxtrqxK2ilapvOiuNjLme813cJahkVudgIKrEpSLfM+q0VFAjUORZbOp3bcu6SUOtJa3EJjz1eE8LEdQUmO2a8CHW0vx2duLSKPrvcUhQTdZw5ZipY0fX0dtnk9KVi98KqtPVuoYidCQmrExdxBXGWPP8OtU8aQKBto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745306867; c=relaxed/simple;
	bh=QSwQkdxEHDadVWYRWOGp5sINS/hCVTWyTbOnftCEV8w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BQN7Wl5I9A7QW+8NaSwvouZ7fbTJYtNkU9r0QxcWXg35U1g1UG9xHYV9F0dYqJZSy4i46NRYl+1kv9/o25S0iYXhNssndkU8Y0pAVYGozM5QexU6v0dTa8eDjTVccd3Gz9K2VCy53dpXHdwPNLFXGh2ja3PnllGAxVJJkbHFA/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KllpG6/k; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KllpG6/k"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf848528aso35854985e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 00:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745306864; x=1745911664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0X0JZ/sJPZkI4lLJkZG4Lcqmvumgx8c7FdFwse+1v8=;
        b=KllpG6/kovEGVL563S54LS/kaYsUY7GUgJD7CwLm0zAo3alDFtX0QI7Sb9NyqSkKrr
         1hIiWC3FeXnXbhf5pd9ZcOY3CT3+PqqrgpTuA0OKG94DOI255ZynAYAOIHrvwFzwv+f/
         EzaHKwCrQU4A9EhN5L9XC3uAp1mr5Igx3hnF53MxkqZ4mn2yuwU7K3vNh0xaIWYjrc5J
         SwEWQDYacV7/efE3+iesdhLLgSYq1++k5IHBi7tQp94Uo+Oh2FIkV0fvmb/EyAJg293D
         HH/5xk9C3M10l131XvWLTNZN62lcMx0a1UYbX2kPu6CjPnRZ/bjtqxGyr7dHlU0asmtO
         U3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745306864; x=1745911664;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0X0JZ/sJPZkI4lLJkZG4Lcqmvumgx8c7FdFwse+1v8=;
        b=KTN6/INcyCpy9SgKK1qOaLnAwA6PRVlGjgubws4GFJ9sjvz8BoFXwbaQ8Bna/eVr2Y
         PXLzNez1CJCUlCLKrLeldO1VSEVlpW2IvauHY7gRbOgW+AoiGISHCnYPQ7YkO5v0u+eo
         k21GHP31mz0TaX6VEArFHgvQjkBo5ksPCtA3jTElrHUbjROauYAwW5UWttGbhXJWmSXD
         3cUeZvwyFGDNg+6xlMwofphweozvICepi0Cto+D7d6VvW/GwTdWFPCZ4ReIxMVZ0DF0N
         vVNW8DgiYCFamyQcGKV4eQDee6txmPNDIsuX6iiWIW5umSPr9R1H1ACcTfEyOXurVUU8
         7oaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX11xuWLFWgHA45vwgt22VbP/NnyOPZ5oCRMsLw77RhT8RnMwhu5dNhNd3a/PhmM6mAQvbuUKRivnWM344=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyhMqG5q37aGPdvT/yrPiz3J6ks/u5b9S/NqBiexfSnegxGrbw
	3HsDcOWZnrRHyfEO0wKG8b01e++k4ZKcHDeZoEQWFScTG5T23eVvAh8xK0gsgVY=
X-Gm-Gg: ASbGnctbyIRk82/JuRoPUuwPHED56U6KFzk1m1lD3OE6A0Hf3R/DldLizZpHT6vyzfp
	vPtu6gzTy5Vu3MlQL1hs8w4ZCKuIbqM5+k07/9xHbEkorbWJ2MPfHcwqun7j01k/HCDrZKPrku6
	3S/8zL4Ji7OQz2731zuun6trzR0Yr2eXcWdAhkC6QD3JHIJxIbjurPbAzOElWeuX52qOWANeZbC
	1PKn/GabMap3ZZ7LFbYjJ+UcH+fzpNtofNT8JHmfQtgg+EdR4lM4T34S4WeQTtmxSCILBSLnLZV
	5u52nL4THxE9QubxA+J1igjP5rbdYZY9L6114fo8hmq79NMvM1nRU4zQutY6SA==
X-Google-Smtp-Source: AGHT+IHWhiVi1ueArODLM6UBb5a4IpmaUoKJy65slIk54wuHnzDLgvlXzR90XdNucBZm/loWgUlT5A==
X-Received: by 2002:a05:600c:510d:b0:43c:f78d:82eb with SMTP id 5b1f17b1804b1-4406abb2066mr131093765e9.15.1745306863720;
        Tue, 22 Apr 2025 00:27:43 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5d7aaasm160798255e9.39.2025.04.22.00.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 00:27:43 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: jbrunet@baylibre.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 christianshewitt@gmail.com
In-Reply-To: <20250420164801.330505-1-martin.blumenstingl@googlemail.com>
References: <20250420164801.330505-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v1 0/4] dts: amlogic: fix FCLK{3,4} clocks for new PWM
 controller binding
Message-Id: <174530686316.2776757.4066244887775087849.b4-ty@linaro.org>
Date: Tue, 22 Apr 2025 09:27:43 +0200
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

On Sun, 20 Apr 2025 18:47:57 +0200, Martin Blumenstingl wrote:
> Christian has reported Bluetooth issues on some of his boards, for
> example on a (GXBB) WeTek Play 2:
>   # dmesg | grep -i blue
>   Bluetooth: Core ver 2.22
>   NET: Registered PF_BLUETOOTH protocol family
>   Bluetooth: HCI device and connection manager initialized
>   Bluetooth: HCI socket layer initialized
>   Bluetooth: L2CAP socket layer initialized
>   Bluetooth: SCO socket layer initialized
>   Bluetooth: HCI UART driver ver 2.3
>   Bluetooth: HCI UART protocol H4 registered
>   Bluetooth: HCI UART protocol Three-wire (H5) registered
>   Bluetooth: HCI UART protocol Broadcom registered
>   Bluetooth: HCI UART protocol QCA registered
>   Bluetooth: HCI UART protocol AML registered
>   Bluetooth: null: hu 0000000023fa9791
>   Bluetooth: hci0: hu 0000000023fa9791
>   Bluetooth: hci0: hu 0000000023fa9791 skb 000000003f7acf2f
>   Bluetooth: hci0: command 0x0c03 tx timeout
>   Bluetooth: hci0: BCM: Reset failed (-110)
>   Bluetooth: hci0: hu 0000000023fa9791
>   Bluetooth: hci0: hu 0000000023fa9791
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.15/fixes)

[1/4] ARM: dts: amlogic: meson8: fix reference to unknown/untested PWM clock
      https://git.kernel.org/amlogic/c/3409f843c04df9434beb637602382eeee90e0bee
[2/4] ARM: dts: amlogic: meson8b: fix reference to unknown/untested PWM clock
      https://git.kernel.org/amlogic/c/a994b58f9d1163c4f559bd169721f0fc15866919
[3/4] arm64: dts: amlogic: gx: fix reference to unknown/untested PWM clock
      https://git.kernel.org/amlogic/c/511d388a4007ba580feeb2fd2e9ba35a614c093f
[4/4] arm64: dts: amlogic: g12: fix reference to unknown/untested PWM clock
      https://git.kernel.org/amlogic/c/a08b28c1ed454502abeb90ffa4a55445dae1d22a

These changes has been applied on the intermediate git tree [1].

The v6.15/fixes branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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

