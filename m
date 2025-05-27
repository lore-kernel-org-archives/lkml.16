Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C20165F1A
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748332817; cv=none; b=YcogZf4HVQfKKg5bgIZ45rITRTYTTCO2aeShlcDdlXV+hk7wCjhsz7oTgJMjixsgsntUpEnbBn1CbEX5c5LctmCA5FzeMiRxW+KqsOF/ZlO93pefup7/4Dgiy+2ofFHfMGFxZ1YMlOx/ZTa7beQzF8V269K6tt0dCOPdEK5oFQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748332817; c=relaxed/simple;
	bh=yEaq2AyzfgJ9c5t9b0CsXDMHvC/M3FL4KCVrex/8yZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oAALiA0FIoUmn9xDzPl1PTGGNvry0ZuS2R3YYvTu9kU9Lj1YuMDaT+azkGoz+F3PijkBMKudY+EcisXilWq7CpHrQvgQPygKDRW1FNEMV268ftOQCZuPV3wK3v9UhvIWUfrgwiPau60Bh9r688a9JIff8mGRvohmeUBDmffc24k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=03/rMuMk; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="03/rMuMk"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-23229fdaff4so33158115ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 01:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1748332814; x=1748937614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=69mSzDBjctUjkk/D5FpImgqRo3X987asQpikl13S/kU=;
        b=03/rMuMkaDdOVPrReoSnbmzgy2uJlFpvD3OpfhqUU9FUrYb33BkA+1t7ZNHdKtpSPI
         LEQvO8/YaBxACDFaeVlvty8iJQE8Yblo6w+C+Su8NOuvWdOOs2vLxKASLI+V+7RT9epo
         zX7Rr3cVeGj0lF9lwqgORUGFXgOPJFhuKDcfrI6NODjpY7AeTXq4bh5aE256wngCmhGK
         8chNdap7Gbvqk0GlNzgi/dnfS4zXfb9V+XxwnRe/SokOufWEG1BYNQbXFJGR7FOI3RDb
         sy+pkoyygO+Z3ROCewBrylFyGJaWuJJCfyyEragTOOFYo7LM4kqRdSH8astQOqL7y+J6
         P18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748332814; x=1748937614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=69mSzDBjctUjkk/D5FpImgqRo3X987asQpikl13S/kU=;
        b=FB17Ht0ZRCf9c6mk6pWccAKBwuBBBgRr6F5CK/d+9oAws00VpWrIUyVaKEeHIYQYz0
         o7D14P2hqkGInwWRGKB57FqCik695bKH+mJoQBMeTxdvFCN9chlx761QeSuuVa2Xc1aX
         PuO65YY2G+C6blIzSnhvwhpG31FmYI6SwSOggII3iGattaBPkwtz0VeS0WO4IEDrGmc0
         pT3AlOG/pIiSzBlPDC31+RXw8TZ22BLUswyDPzLk+F2M4Rh7LDRS8dyWjnaxyOw/tCUd
         EKt9W5fXgpwjX1gQ2lwFMOvDxfISYp9UOzcJ5QBOgX6OHz+hAiXHxJANfkHreOg/9tQI
         x10A==
X-Forwarded-Encrypted: i=1; AJvYcCVTwqGPxBK/oSi9rf1Pc7a72s7bMwxgxGtAIC93qwoHI2sEvxlJVkagyl8IIUHvHgkIV3uXtTzfQf+Wg6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEQIJHAznxKKNNP6WagN+P7W/zQ2awngTUFE/sire/ZN2nZik2
	mMHI57PkW9b6KV0OqEDx+7G58Z3U5kuo88mI75rQl5j8z1PtFVQy4FBHTlPwTUhGwBI=
X-Gm-Gg: ASbGnctZV9GrRwtBh5r/DgSlACQz9InaSrxeCBh/F2VXikcsZsbULVRlky2eaYsiyCZ
	DA8BZqiaOZ5cDH+Neey0iFinuTN1CYaoSV3aG4w+oo77sOo5htQRKBgsGrSxarYrkC75KoKLWK2
	lqtHolGUamklpmbjN02kE5rgb+ht5JY0KuslkC8lEtO7M7Z/oaRuLeeJWd+m8ZSUB6FxrGK6hGv
	qQMYDQzNneOkCGcw+JtDxE4EFd4q2GHWDgtbmUUC64paX/RLwSGYg1gjcNIc397eoRcaVAGLG2Q
	mv5JFiuydUhesCFkK3ENYUeULlrEo2x2x0yb2D9a3olSw065B0fOfqm01k4/WjjY1ULuC1Q/Nw=
	=
X-Google-Smtp-Source: AGHT+IG/9w9RYy8XeVSB35Aj2XQw0SQ1Z8HiupqD9XgJZnnAgEoB0hzA2HUmbCT1F6TH9+lzKYQesg==
X-Received: by 2002:a17:903:1a45:b0:224:23be:c569 with SMTP id d9443c01a7336-23414f80419mr226841935ad.22.1748332814563;
        Tue, 27 May 2025 01:00:14 -0700 (PDT)
Received: from x1 (97-120-251-212.ptld.qwest.net. [97.120.251.212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-233f8b2dc89sm65321825ad.114.2025.05.27.01.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 01:00:14 -0700 (PDT)
Date: Tue, 27 May 2025 01:00:12 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 5/6] riscv: dts: thead: Add PVT node
Message-ID: <aDVxDJi0KkWXiPCK@x1>
References: <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
 <CGME20250524211525eucas1p244963b69e0531c95a9052e4a7a1d1e01@eucas1p2.samsung.com>
 <20250524-rust-next-pwm-working-fan-for-sending-v1-5-bdd2d5094ff7@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524-rust-next-pwm-working-fan-for-sending-v1-5-bdd2d5094ff7@samsung.com>

On Sat, May 24, 2025 at 11:14:59PM +0200, Michal Wilczynski wrote:
> Add PVT DT node for thermal sensor.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index f24e12d7259fabcfbdc2dfa966d759db06684ab4..faf5c3aaf209b24cd99ddc377a88e08a8cce24fe 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -648,6 +648,17 @@ padctrl_aosys: pinctrl@fffff4a000 {
>  			thead,pad-group = <1>;
>  		};
>  
> +		pvt: pvt@fffff4e000 {
> +			compatible = "moortec,mr75203";
> +			reg = <0xff 0xfff4e000 0x0 0x80>,
> +			      <0xff 0xfff4e080 0x0 0x100>,
> +			      <0xff 0xfff4e180 0x0 0x680>,
> +			      <0xff 0xfff4e800 0x0 0x600>;
> +			reg-names = "common", "ts", "pd", "vm";
> +			clocks = <&aonsys_clk>;
> +			#thermal-sensor-cells = <1>;
> +		};
> +
>  		gpio@fffff52000 {
>  			compatible = "snps,dw-apb-gpio";
>  			reg = <0xff 0xfff52000 0x0 0x1000>;
> 
> -- 
> 2.34.1
> 

I found that on my lpi4a that boot while hang after applying this patch.
I think that it is related to clocks as boot finished okay when using
clk_ignore_unused on the kernel cmdline. Do you happen have that in your
kernel cmdline?

I need to investigate further to understand which clocks are causing the
problem.

Thanks,
Drew
