Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24382AF00
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748957228; cv=none; b=O60B4mEH0PdO+sIZBxIU23t4GaVIeXYIie6hkuXeztWR7gwwWHAwvgOcpkZpWDNzdNw0rHD+bijfGF/gz822cDofGCHnZn3D9DGEULRMw/bKk3huh78pn28H41UnLZuEVi5PWjCjyQa58Hmddang6mbJgB3JSiS0G8pz/gXZDG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748957228; c=relaxed/simple;
	bh=oCJK7p/BlKZRpWnLoHe83P+kE08K+tutSYOVgN67ERM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=q21Bo5AFc0BMTv2KnprNIwt5UCFgzWobrsWJsM3QGYEogt6DCHnS458LengJ5P3K8FIGY+6TDf/8sdysoepR9hkScolqW5qzM7g6W8z9CiXDohfTeL9tGIWb5zPP4il0k/TPZyUU11knxUu8i0rlBJBVaBu0m016ecllC4ykg7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vd0kow07; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vd0kow07"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so35920295e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 06:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748957224; x=1749562024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oihVtB+1SEPxR6wMy6kxrIZOmkj3G4LorB9xvDbO3Qs=;
        b=Vd0kow07jWpWm9OrR+kOmMj4JwX6c2asw2TIz+rKMkV8ihKiTEPxhhqKXZBXeqLj/5
         gsDlZnXnXWjm4uj/r7J35vDyqvTi+qHx8MVspblIbQcGNj4CaZIoDVNAOUe26YyX/O4T
         0jNoe23/nnSv50e8bF9NZLKNPPio063iH0QRrZsRKo9DuMuH+vMl3FIAAqClbXQzrf9f
         6wyqEm5wIQIw+snLkO7ioRIWuCl0ZbOpwIS0MBsQjlS1E9PSKHnNQYJFvq+6Fq2zP/Je
         qQ2a8ug2lKuV2usMvbprGiiEo/2i/OxT/COhnWQp8hdv8D+CutXhF7YXgxBE+2TfIi8Q
         mj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957224; x=1749562024;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oihVtB+1SEPxR6wMy6kxrIZOmkj3G4LorB9xvDbO3Qs=;
        b=iaSPdeMOLbThVvHVBgyEhX25QQslzVDSFZ+ksVgEH6f/27pMQBl5+IOKfQZ/XHPGL9
         uwicSXKnAVAe/CFOBAd5ck5C4iBlhVAEWHoFdXERI8l8KRF9w2je8bK9eBXEbGq6Ch0a
         hKJr0bqBqM//lxoGwU/wyJLq1EkOJ12/hlUsG2BR2vJ9gM6nRRCRF4jzFRlRd315OxvU
         FnX6NYnA5PeTRTSEBDKETFDERYWa7S2kiPCgNhU7nl/3axQ/IDKjIz+x+DEgV0CUactP
         cMMEmKKYuiCZf2t6j+JsMAJgdoheL7bpVjottY3UxoPNT0fPDXr4xen2P+GyVxfWiFjr
         /lWA==
X-Forwarded-Encrypted: i=1; AJvYcCUc0ad+WH1qm6i+o1xab/KMjFacgFsxUZ5xSyqUDOwRVCOzZT6RfKYhHo5z+act8j5pug6JGx5tGCbsENs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5F1sKBLcalce1/pdD6M0TSV6D9fSg4a8NcOGrGJDxWeWuyUBO
	ZtvK+ZO7B7wLWqTjm76rAM3nK9APyk6kp+r+CXULDOaFB+DJo92qWbGTxnCkyelzQby5yp8OHD+
	vuzfb
X-Gm-Gg: ASbGncvotVhDJYQnrDzvqLPZBxvLaX+blV9/7TBudvK3EXDUUd4SezD+9hxvSq93xhw
	u0c69BYvPvyC6F9V396NSG2lfo3xEn1zM4RHO/wdy1yvsUXKxpntLfm83FDrSKW3bx45wNBSYDr
	iks7L1Nu/0zyG16opRSPamNI+QXtEquX7pHuOpgs6mVZm7omnJ/9JzqVBkqQ5+iq5YujVRjXusH
	CwoksIU7dRcxnzvPsk/EKUQYLCZ3Ikwf9gIbh1lSQACHupV2pcj2q7q1eXm3pe5ec68s11k7aIL
	uG57a3cZl4Gj70QOaeVSCGf+cjmcNoI0oXRmbKvblasjxejKc6F5CAbRRzviuIebJ0IhwCT+G7y
	3vRPyyZs=
X-Google-Smtp-Source: AGHT+IGa7mbwcZXtdjmxN4fEKLTzriqSJh2XpWZKE/sUSl2iqQEeeTppliDDInLxLyB5zAkgBnX6bQ==
X-Received: by 2002:a05:600c:4e0b:b0:442:f4d4:53a with SMTP id 5b1f17b1804b1-450d64c322amr189283025e9.2.1748957224078;
        Tue, 03 Jun 2025 06:27:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8000d8csm161701305e9.24.2025.06.03.06.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:27:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250424084721.105113-1-krzysztof.kozlowski@linaro.org>
References: <20250424084721.105113-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: Align wifi node name with
 bindings
Message-Id: <174895722336.2922018.7146209463305009352.b4-ty@linaro.org>
Date: Tue, 03 Jun 2025 15:27:03 +0200
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

On Thu, 24 Apr 2025 10:47:21 +0200, Krzysztof Kozlowski wrote:
> Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
> wireless-controller.yaml schema"), bindings expect 'wifi' as node name:
> 
>   meson-gxm-rbox-pro.dtb: brcmf@1: $nodename:0: 'brcmf@1' does not match '^wifi(@.*)?$'
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.17/arm64-dt)

[1/1] arm64: dts: amlogic: Align wifi node name with bindings
      https://git.kernel.org/amlogic/c/117993fc40d96ee3a7697d916a2a0424467e9dcf

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

