Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8930C78F5D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743404504; cv=none; b=IWlkaEXxgfieV2b/hlbhtS3StQk3pnZHhfIeT3Nmg1vCF4U+fAWk53NRw8ldEU/TbVj0hV4YADiI5HxIg91VBIW/AWfG2vvijulzc1G2RuaocGHDtDBbrSeUmdKFyMpOBvYqZYKnIYER0qqQ3e7M8d0BwYrULAeXrNuGRqXNzH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743404504; c=relaxed/simple;
	bh=543M49XeqGOfZcRi6NSF1klnW8QrEIqd95CxRKny8I4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NDkm2TIiDRHGvAboZkJv6YGMhUuoA/hpkZezU5ROLuBkCT68mc6jE6YBizMR+ZTwIjmi7pZ1LCprXsJf8qvCYUdckdDTgXcq1wDocwyoezrQLPxwY/1P/pPVBkne9g2TfimcRQudADIUZx+Eg5RNt4lwelH2/NWxA9fmxex7+jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iQtazVZl; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iQtazVZl"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c1efc4577so82939f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 00:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743404501; x=1744009301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0EIRXaMi7x8XYwlCWwiW2XCs1AbE7FrNvdFZNLIYyY=;
        b=iQtazVZl6xN00XD2F6omLg9PY1ovmTWfZufPKBVq+xGw4VLnokIbYmgYuFPax9sO1x
         BIbj+P43jm2d72Rh32ZG1Q54iaC6GMyuq6sskx5r1AyC6x5LEF9L82J692G85y8eOzWj
         JMgk54rbE44LZRUUoP48ZumtxqUSI18mHj5tGR9dKcAAGFlq3D5Q0huyLwUdm+SUXzCy
         gDzcg62bJWqeRsVGh9KnwZshWoVtCNHAuGzl+ATSgBS89BqJUzbDnxx20Wfx4UNuXHYT
         dYL2cC6JwgaBlfPTaVG0Z8eB3THiFZhQ0AteH6W29dVukBOuUphUSWxVQJVo0W8KwyyF
         V66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743404501; x=1744009301;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0EIRXaMi7x8XYwlCWwiW2XCs1AbE7FrNvdFZNLIYyY=;
        b=Xk97K7lKMPZAL8p1xPed+uLSHbEeBDZC+lETmcfsQXdOguJ0Lg1XmkV5zPLrOhp9qH
         X9kHlLHnJyMA02tNQjy2o1C/87+5Yh8HGu9pBV4Rdze/5BbU4BLO+kEmVJP9mAKkAmH/
         cPEil0MW0Gk1JlcgG2uv3mokYASWPU1kn/+og81lAQ5G2HN0OA2CEwncRuggaoH+ff/M
         IV8G6hD3X1LAD3ogILauaky7WeHTSx0et0UZ4u/udmQkYKB2daMD1QkTSHyh0ueYy/kv
         YPs6VMvSYgdcgdwUmCHhRwGp2AiXKxfRVAlqhmPbxmR2l5+NKb7eZ4Z2Jt5HCv3Q/BjU
         bDxg==
X-Forwarded-Encrypted: i=1; AJvYcCWCsFgIYS7irBem2Zj9nhg7SRzqYx2JqtZLhfjb7jJFFeBLbjX6di7Jyfs0tmfTQ24MoDp/BFPf3JhGtaE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRsAHCAWwbPwAd5ertjUK/Ns10YyYSWmm1RQiLIvceFezaIk5f
	sJNOA1nfIdvs3oqe9Wx7CAK5rOLDubYuKA44sSS+UV3WusnuSkmDKRPPxmFsdR0=
X-Gm-Gg: ASbGncvFvQ/YosU5C7QtBS2X2UToDY+TTXpoMwG4UZkZ7dkdTaYORPmuovFdmhubZP+
	AHcXms/GYmVCz7JTbbwclXHA5goSGewm/xKN/4Tcnl72Now5Cw5wVpPmEXjhFQ0E/p/2ggOaS4b
	8kcZuw08xFx8yj5XmE5I0nSQ5RdfdbZ+g5ZhwUj7b8W8X9A+OY6fiVJHyZ1xLGW7qFVXpOahOni
	9YmptRohf1sqX0RrU4q7/X/iKzInqhsmSEHCKzcvnsvAziyjIpA1jfHY7OztTDi8SeAB6jZS8q7
	ucA5lP5vZvWhDw3jDcA9pU2CUUAbfxi1YTuNVTpXaS9yZ0wigCUsvv1Rz5UDY/WDuA==
X-Google-Smtp-Source: AGHT+IEeWSQJLYKN04bNEh+7lHsUNrdL5zsVbpE6bLIsWK5/LcK1CEV9vqu2gqFuUvmhYfQrRpRW/g==
X-Received: by 2002:a05:6000:2183:b0:39c:1257:febb with SMTP id ffacd0b85a97d-39c1257ff09mr4622649f8f.59.1743404500748;
        Mon, 31 Mar 2025 00:01:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82e6ab48sm158442325e9.10.2025.03.31.00.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 00:01:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, jbrunet@baylibre.com, khilman@baylibre.com, 
 christianshewitt@gmail.com
In-Reply-To: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
References: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 0/7] dts: amlogic: enable UART RX and TX pull up by
 default
Message-Id: <174340449998.221709.10827817044945834716.b4-ty@linaro.org>
Date: Mon, 31 Mar 2025 09:01:39 +0200
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

On Sat, 29 Mar 2025 19:58:48 +0100, Martin Blumenstingl wrote:
> On the LibreELEC forum there have been reports that Odroid-C2 does not
> boot when UART is left disconnected [0]. It turns out that this can be
> solved by enabling the SoCs pull-up resistor on the UART RX and TX
> pads [1].
> It's not clear whether that specific Odroid-C2 board has a broken
> resistor, the resistor is not populated (either by accident or on
> purpose) or if there's another reason.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm64-dt)

[1/7] ARM: dts: amlogic: meson8: enable UART RX and TX pull up by default
      https://git.kernel.org/amlogic/c/cfd9d2466ed2891bacb6319bcf9af55f21d0263e
[2/7] ARM: dts: amlogic: meson8b: enable UART RX and TX pull up by default
      https://git.kernel.org/amlogic/c/7374b06e8099ce7345ff3afd4bb756dde25971c1
[3/7] arm64: dts: amlogic: gxbb: enable UART RX and TX pull up by default
      https://git.kernel.org/amlogic/c/b00fe005612080772fe4f00c61e2fcdd2dea18f0
[4/7] arm64: dts: amlogic: gxl: enable UART RX and TX pull up by default
      https://git.kernel.org/amlogic/c/bbeb3017f1596a0551ba0ee40866f8b4e0ca2d3e
[5/7] arm64: dts: amlogic: g12: enable UART RX and TX pull up by default
      https://git.kernel.org/amlogic/c/867c3760da4ebd760115f17eca0b4bd3b668941c
[6/7] arm64: dts: amlogic: axg: enable UART RX and TX pull up by default
      https://git.kernel.org/amlogic/c/48d5da715331f2fd5e17e64f9e75e74248223b66
[7/7] arm64: dts: amlogic: a1: enable UART RX and TX pull up by default
      https://git.kernel.org/amlogic/c/b85aae3714e65d7b92a6c2c28f62cf66393dfcac

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

