Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9603515687D;
	Mon, 28 Apr 2025 22:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745879755; cv=none; b=NCvFpxw2n8akpKUi+qdJt1gW1jJIuDS+CT1npe228QZfjlJXSQDn+ahuL+LVRJuBqdsSOpt6Xe8oY0STpmjTE8jvLb8GQsa1IyyuMsa8hnYamYI53lGY4pWnNPvZVolnBeTHC148OeHL4BSEx1DQ3YXRj7Bq/o1ZtY4zBAYPQKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745879755; c=relaxed/simple;
	bh=dsHMaLy+Slj0qyE+mOUjzDl6VBT8UBQJQxWjTqxbQxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VB7C6S8tZ7sb/5EGahopXi+P8pU2oC0TWCHzXNa9zWVu6oBA/1Um4W3TN4D9BXmiIfXtyVXYcfBAxHHuxCn2FuvA9ACulEM9zB4poUWIExvxFva+X8+TEBy9N4/cNlvrXYAVEGvtXav2t5MGCPydRugOVpa6dp/aorhsAt6BMkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbIA5FGZ; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbIA5FGZ"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-47663aeff1bso54707921cf.0;
        Mon, 28 Apr 2025 15:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745879751; x=1746484551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X/kdZu5lZfOsUl8WyU/NEfAG1LYXxMtniBa4sTIJjM8=;
        b=dbIA5FGZ3vPvb9TFy6eTKwh352MKjaUR6QlNh27qSeVtjzfkjw004h6T6NNsdvUgXq
         e7vhajplE/FKSjr5neNZQS9JaoCxRJrZpWOsCcavgAt26xCcThlAN4htJ1+c4sWzG7FP
         oTI+ngO8D0cpgKRv7ByLKeTQKZknYIUVtSz+U34jt+TSqnDb0NfcaLGGtrSc2OtsEH7l
         x8iixfnLhLE4oedup1IslAms2bwvqAOa8exFQrJW8hwQ+rw5BgAxvsCyyGgr14m5sov+
         ml1V5oDTLVqCYdhLjETPZEWQTsAoSfTAjN2bgocUNAZFoGO1NjzuzbulI6FW5mWkkHN1
         h+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745879751; x=1746484551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/kdZu5lZfOsUl8WyU/NEfAG1LYXxMtniBa4sTIJjM8=;
        b=hVHWC/SB3/vfb+0Toq/+8xV5qRaGxpr2opPs3fX7alM5UQmJKwb/SrFULShmPQKEsN
         lS3IlrBEKCN7ACTNS6Jbps+csyzpkTVMns8N2X211XOT5mnP93FLrGdc+duoUqjL6rld
         VB6kZQDBlZ+h7stAp+vgu+be0Y4Fjt9lKw+VCzfb/JsRTMVMP4nBokTyUOcTEwLsUiwq
         hFoReSygQq17ZYvRsA+rZFPYz8jzOjfLff9aWys+4ZWbBOaNyT3l5GKbBOaH/FiwGJ8J
         F0fJUPhYPTxBvtcsnTqeKkHnbpV+oybLLnPxMbRWVbvJdQqKlWr3GNQrlixR+54fM0SR
         qoRg==
X-Forwarded-Encrypted: i=1; AJvYcCUAwAeJY5ejGnGuwt08Qh5fDO0+VcjFKlONxcTOiexg4GkvQd/RYP2EQSucDDEFoFQ2AL2Oy7AN7Jsv0rZQ@vger.kernel.org, AJvYcCUK3XY4wpX9clJb5xECdU2KXmBq+xeMY01cy+PCJTvG+upKiE9p/IyskNya/jaTLOaQym6p36Y1Vzfb@vger.kernel.org
X-Gm-Message-State: AOJu0YwVZum/hcEtT0k5FmPF3BFDH2CbbPaOMXPuCRXP8FnEyNOT+bMe
	Q44oPhF594ELBseE7a0WD6Ag+0hfijPU+hyPjyhCede/h+svchjL
X-Gm-Gg: ASbGncvPvMtWxaGHiYWt4QHGkCOo5MQoyh3UEcM+d83Dy9omZDhishipKzLleFkF0YH
	HMYc1niWcrhHiYRgmn24V8vqag+O9pcD8+fi8zp/A5OvPDSxtFM7wYKppruhL4AjbMN9uMo4WzY
	cUXILHwJMsUNbxoZrL+Z0agXVhdZZ4YOJsmZ0/RuEeP/npIOPEJHYNBAjUqir5JweMgQkugHUP5
	K9YuJbxAwR9iKALG2RVqhKZEtRkGt4WEUM7yJ29mKbdEX4p2J5kkImBTiqI+3qv8zzOuFu9INuc
	/0oCOhZ0u64GLMGS
X-Google-Smtp-Source: AGHT+IES8nRDFDh7fd98mGNj9hoSaWm8gTLVtNkYmiW/3xaJ8gUBVINczQj4gDLHG/EkZEFrUlpH2w==
X-Received: by 2002:a05:622a:1f17:b0:477:6e8e:138e with SMTP id d75a77b69052e-4886ff51bafmr17662271cf.2.1745879751334;
        Mon, 28 Apr 2025 15:35:51 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47e9efda2c0sm73859921cf.20.2025.04.28.15.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 15:35:50 -0700 (PDT)
Date: Tue, 29 Apr 2025 06:35:36 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	sophgo@lists.linux.dev, soc@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Jisheng Zhang <jszhang@kernel.org>, Haylen Chu <heylenay@outlook.com>, 
	Chao Wei <chao.wei@sophgo.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific
 part into SoCs' .dtsi files
Message-ID: <6wlgfvc3rkhv4s3ou67fjl6j4a26vocqck5727cg6muxlz2erj@kivndcjcqc7m>
References: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
 <20250316185640.3750873-2-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250316185640.3750873-2-alexander.sverdlin@gmail.com>

On Sun, Mar 16, 2025 at 07:56:31PM +0100, Alexander Sverdlin wrote:
> Make the peripheral device tree re-usable on ARM64 platform by moving CPU
> core and interrupt controllers' parts into new cv18xx-cpu.dtsi and
> cv18xx-intc.dtsi.
> 
> Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nubering
> into "plic" interrupt-controller numbering.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
> Changelog:
> v5:
> v4:
> - cleanups dropped
> - cv18xx-cpu-intc.dtsi instead of cv18xx-cpu.dtsi+cv18xx-intc.dtsi
> v3:
> - &cpus node has been moved into cv18xx-cpu.dtsi, &plic and &clint nodes
> were moved into cv18xx-intc.dtsi to reduce code duplication;
> v2:
> - instead of carving out peripherals' part, carve out ARCH-specifics (CPU
> core, interrupt controllers) and spread them among 3 SoC .dtsi files which
> included cv18xx.dtsi;
> - define a label for the "soc" node and use it in the newly introduced DTs;
> 
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi       |  5 +
>  arch/riscv/boot/dts/sophgo/cv1812h.dtsi       |  5 +
>  arch/riscv/boot/dts/sophgo/cv181x.dtsi        |  2 +-
>  .../boot/dts/sophgo/cv18xx-cpu-intc.dtsi      | 54 +++++++++++
>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi        | 91 +++++--------------
>  arch/riscv/boot/dts/sophgo/sg2002.dtsi        |  5 +
>  6 files changed, 93 insertions(+), 69 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu-intc.dtsi
> 

It is a hard time for now to do some change across the cv18xx 
series, and it has become a mess. Due to the fact, I think it
is time to do some work like split some device (clk, pinctrl,
plic, intc) from cv18xx.dtsi to avoid override, and make room
for arm64 device.

Since this change contains some change similar to this patch. 
Would you mind me to take content of this patch, and add you
as the a co-author?

Regards,
Inochi

