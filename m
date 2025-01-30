Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E729C14F102
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 20:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738267279; cv=none; b=d14LBacvw33XiErmi2Ryk5u4crriKR03b+fonyVj6zuQPV+Qi9ok2bvmz+xQ9XZkqYD6KG0YybsVbaUMQFRB2XiSt/Z7BmU+M4Yrv40bd1oVOMRi1wbI0tjjscYNIahb/1SRkXR+oA/tvBQJJhPT/mNnp+S8wZ/6RnKxG1jwyC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738267279; c=relaxed/simple;
	bh=j72SbzSvOGMJxJoQNxbERw8rJQAq8FYGiP1zq21fHI8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=leelWirjvydAQLAFyMYr1EbRWY3XGXTACdiEC+/UUiLAETfV76CoJI4PZarcpEyF8ejWkvoT0MCdqbOQxnN80ooDhzhdM/WqDy425h/jjTjFG4x7Q1dzP08IhNlrkwz6jzHi5KMd2ET+79YkYJE4QyN7fMjCQzXB4ywMDfmll3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDO0M4rW; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDO0M4rW"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385e0e224cbso758022f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 12:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738267274; x=1738872074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfOmM15t6GCi/gXpOTSAQVn8+bb5YsUyZ8MqKExsTSg=;
        b=bDO0M4rWUHHsUWnG/JReCVnuQyNvEBTPeSIWQ4eBtsKo/cYPw+K6bfpu9HyQQ/3Lyz
         TLpdi7zrV1v7Hw7YuipoYuVo2LhA2cp6o3yvHonfhNSF9WUx0+dT7JEHxLxRY/Kt5su3
         ZTLKKo+dyZqjpKG4L1tOsFMkzRKATvRIFusnTI3veHywxoSVE9t1/y7WJHyGIA4NpWP/
         2adF2E/o+wy/yT10rN3lHfpGkGI/Vj3Bhp8Sjiu97HM8sbCg8z0scE1Xnqx8pCrB6Bza
         Z36CoLAhj61oVX2571q8GSdQ9wb4NW+H4NieyHmEtDmw4eJfcXYHXfg0sFPyleL65g9Y
         nxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738267274; x=1738872074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfOmM15t6GCi/gXpOTSAQVn8+bb5YsUyZ8MqKExsTSg=;
        b=KSysfvG06meHxb0EY9NrLaHGWHFYzw0ANcK7LInfwBCagT0xMs+1cYM1W0lQU7NeG/
         IrTHUC08iqszXTsf/w6NUUI/YDLcM2FB0ZPvPvVhBX0fR7Ni3XnpYxWSyozVrl2r+x92
         mpbuGc8V9vM+LhgnYsbhndIzm+fsaDd8AdBcUFw7mkFo16MVBfZ92sb3jPS4Mf1KCu0c
         88iOYfy+u74WVLPr7Tz5HXTfGWOQ8XbD+Sk+5VTm5IM/s/JNPKpF7FzJwBu7NpD0yxYj
         WCPBSyrwUdjLwlbivGVSSwgPZMvrTCH0UegswHY5O3u/KlX/8dn3By0KzQtYuchHXH1k
         CslQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkvKkUzvI3UFKYUjYlE2IpTQN4a1pS2b7MCUliANnvR4ZVqDU7QsaBnQE3YqKSUGVg3B42yaCL5zQ8NKc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3QvX3RQQqqVw6LdaYO/vlyh48mF6ZrrSF47YMwi1/2BQyoYl0
	QlxqyknXofImLcWMwiTa4P3bZeuzNgafDzqwCkPsk306Jz7dejah
X-Gm-Gg: ASbGnctjvDJC5qVAFBIikxYbCr16fuqWJje6Ohy+usbQp4DuLMmr276B3vyYafJgl60
	lvYJC3KsIJ9KTAHqM+JE7OKUuDXgAOhWVwIPI7NC7ZD/x65gfdSEl2Ng+FmIAxGE94ggjlc6p4h
	nRJaQDkcTymRqDyRVTmR5f2t9m7qzBiqGEpwKUFLm2KAM3D4sbZuzZRzLHNuZJRs+F9irbllce4
	O41sw41jNAwjlj3EP5LPFW1c4bO3cJu2VTFaEaPOA0r+BhoMRmd+GFsxrTxtXVKyBsJ5+6Jafhs
	YPDXpWehVShLF/35uKWkhyWYwa1wfygr8QTyllU9u4LDn26xteZG9A==
X-Google-Smtp-Source: AGHT+IFPStvFpjNXZEIsjMW2EGJ5wmOm9EJKmDiXDJ+zK27gliKKYmMKFPf184s1pxPaWTmh8aGqGA==
X-Received: by 2002:a05:6000:11c9:b0:38c:1270:f961 with SMTP id ffacd0b85a97d-38c520b7c7fmr6273398f8f.46.1738267273958;
        Thu, 30 Jan 2025 12:01:13 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b547csm2880284f8f.62.2025.01.30.12.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 12:01:13 -0800 (PST)
Date: Thu, 30 Jan 2025 20:01:12 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: linux-phy@lists.infradead.org, open list <linux-kernel@vger.kernel.org>,
 lkft-triage@lists.linaro.org, Linux Regressions
 <regressions@lists.linux.dev>, David Laight <david.laight@aculab.com>,
 Vinod Koul <vkoul@kernel.org>, Adam Ford <aford173@gmail.com>, Arnd
 Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, Anders
 Roxell <anders.roxell@linaro.org>, Adam Ford <aford173@gmail.com>, Frieder
 Schrempf <frieder.schrempf@kontron.de>, Vinod Koul <vkoul@kernel.org>
Subject: Re: linus: arm64: error: call to '__compiletime_assert_536'
 declared with attribute error: FIELD_PREP: value too large for the field
Message-ID: <20250130200112.6ba7316e@pumpkin>
In-Reply-To: <CA+G9fYsHGrgZsEEVvP0XMcAhLyCYnrCPgZJ1puT6cfQBCGUB9g@mail.gmail.com>
References: <CA+G9fYsHGrgZsEEVvP0XMcAhLyCYnrCPgZJ1puT6cfQBCGUB9g@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 30 Jan 2025 15:22:06 +0530
Naresh Kamboju <naresh.kamboju@linaro.org> wrote:

> The arm64 build failed with defconfig with gcc-8 toolchain failed due to
> following build warnings / errors on the mainline linux master branch.
> But the gcc-13 builds pass.
> 
> First seen on v6.13-9485-g72deda0abee6 on Jan. 30, 2025
> Good:  v6.13-9338-g05dbaf8dd8bf on Jan. 29, 2025
> Bad:  v6.13-9485-g72deda0abee6 on Jan. 30, 2025
> 
> arm64:
>   build:
>     * gcc-8-i386_defconfig
> 
> Reported-by: Linux Kernel Functional Testing
> 
> Build log:
> ---
> ake --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=arm64
> CROSS_COMPILE=aarch64-linux-gnu-
> CROSS_COMPILE_COMPAT=arm-linux-gnueabihf- 'CC=sccache
> aarch64-linux-gnu-gcc' 'HOSTCC=sccache gcc'
> In file included from <command-line>:
> In function 'fsl_samsung_hdmi_phy_configure_pll_lock_det.isra.10',
>     inlined from 'fsl_samsung_hdmi_phy_configure' at
> drivers/phy/freescale/phy-fsl-samsung-hdmi.c:469:2:
> include/linux/compiler_types.h:542:38: error: call to
> '__compiletime_assert_536' declared with attribute error: FIELD_PREP:
> value too large for the field
...
> drivers/phy/freescale/phy-fsl-samsung-hdmi.c:344:9: note: in expansion
> of macro 'FIELD_PREP'
>   writeb(FIELD_PREP(REG12_CK_DIV_MASK, div), phy->regs + PHY_REG(12));
>          ^~~~~~~~~~

Yep...
Broken by d567679f2b6a8

Preceded by:
        /* Find int_pllclk speed */
        for (div = 0; div < 4; div++) {
                int_pllclk = pclk / (1 << div);
                if (int_pllclk < (50 * MHZ))
                        break;
        }
with:
#define REG12_CK_DIV_MASK       GENMASK(5, 4)

The compiler has optimised (pessimised?) the code somewhat.
If pclk is very large the loop doesn't 'break' so div == 4.
It then does FIELD_PREP(GENMASK(5, 4), 4) - which is an error.

	David



