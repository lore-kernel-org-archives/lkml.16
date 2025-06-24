Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6EE293C40
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772831; cv=none; b=PlbS8/GnOmMz4GIA7u1TohpgIexdv2iAdnVen94soeODS1oYIbEVlTQkKe7/2AqRDfCPP/05Ucphu9aVruFyOBU68+348Iqk9dw5h90ZRGb1WGqpXKOK4502btorBkeiosFIciW8eyXXrbMkiTJULl8eHbc7Qo8qPUDQDUiH86w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772831; c=relaxed/simple;
	bh=RdblSIpyqHIHC7x9AJFKZ4JmLneV50aZUMQcreRaw+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQP+aT+0SPuKkjtX0fT8HsvK1jiKtS0809nk7h14oc59EnChruBDFiBD1Jc4GH+xeAlCE0UhKzpPXjaAyeH1b1yIRIDsHQ1BAnMj903S79WfENTRc7jus6oEajT4Tpvnb33FY0GxRYwkZ/btt/TwPtqQihRNdQjLp1XOR3u0B+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=EZI/MrMO; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="EZI/MrMO"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a5123c1533so2767872f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750772828; x=1751377628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J8PCCubQNcr7nCZVM93eZuCGNtXLAAyFhXBC4cgzvqo=;
        b=EZI/MrMOfrsiutCQlqKQF3LLKyBKfuhHRsRdWvJXVXU3+VVNLA9lGijlbZXh4IcP7q
         QMhiRe0da/JI28r9VUf6UTG0LmkroiipoPkSoC1vElk3cMFz9w0K/l7hpOv0wJdG3aZJ
         kfYabCAlS6mdJDL9otZ2jz2pLC47PzTOktaFYKI1IZiM4PCASv3aTWRFIsOY+J0j6Vx8
         iwAF3t3lnzRdDcDuiBwMa3JDbOJJQMSVyz2ZIlMBLfzNBbKZI7/RXm1qmsAbBFZRmS/X
         uJraJVZzYs6Vq+WepBkLXfX7a1hKmVOwchRQMtxzAnXrZsfAtBbKXFhFmVaJUdOIP4Gb
         o1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772828; x=1751377628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8PCCubQNcr7nCZVM93eZuCGNtXLAAyFhXBC4cgzvqo=;
        b=OMVMCvAXiqJhxe/RTkyevfdUyoucX7vDSOncdbRVklGWMyvtTvUNZE+yPJbCBUsItN
         fChq57DMqw94Qz1hLaaIVRwO86zdm1V8+qAFYnxRXc9GxEJemLtXwd/bNRzis/O5JTBl
         uf9PLASZoFOlK0EJH2rWleR+UjSf6+rTcarHTo6iMqplDJVGZIBk5ipw0XNnPhIumFjk
         +xf+3yvklBMvc/2aLrzhKG2frtj2d8b/7dAd0iIqF31L5tY15lyE4iiqBqHPsXma9kGi
         uVV0mjFBr2rEB2v+Z/NBBysFUwC1A3H014PDv03W6odUqU6vdyyfrEGGSnvzbuCRFsy1
         J8lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcyNboAdIVz1CN57Y7wgaOK5JjfPZff4gdvnQkrT02OdHvTAeEjnlvJo7jwGC0jm3nNTG2xshAEbIeZMo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNGn9tN0CVla4nS0a77e/D9ss70PNbB4XQBZpF1CbUwOg/oZH4
	J0NWTps1iJDo243XfKTQA03OXF4qK22UQmQcE/duyeoVxdK8Nsh/hSypx2/UDaRqCL0=
X-Gm-Gg: ASbGncvyS6T4BOZVTxT7ef3dqN9I637VeI4RkwKqBE8QtYiRU4QKpTYBV9l9lS7URko
	3eNNSWgXwENvg/9qFoX+JBBeWklIr9+BJfcfvRHhjccAsQojlSB1awzwDdpp3FQPzB9seU7+apn
	k19opy9dxcadm0cw4O7tQ9seLFfwSS/IIGuPI4CPmzX85tUxX6gS/1xDtF3+RSwB+vL2m3hKMt+
	KXjleuEFS3f3juzH+oK/FSu3ECmnjrr84wYfnS6gCXlRQVC24Tr2svOphFPvjLr6at9K6baS0ld
	aABfKaqYdW/sGl79WynWGfpcM5vA52XrheonY6byynCRxWFlqg==
X-Google-Smtp-Source: AGHT+IHpMvNqukUYWx9oydnYOB85GNC6fRs2uW/m2DCi770l/WC1aWkrfcHX78PHUx/VK0Unvrw5XA==
X-Received: by 2002:a05:6000:310f:b0:3a4:e8bc:594 with SMTP id ffacd0b85a97d-3a6d1191de3mr11186332f8f.8.1750772827749;
        Tue, 24 Jun 2025 06:47:07 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45361461375sm160230815e9.14.2025.06.24.06.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:47:07 -0700 (PDT)
Date: Tue, 24 Jun 2025 15:47:06 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 4/5] KVM: riscv: selftests: Add Zicbop extension to
 get-reg-list test
Message-ID: <20250624-1960ad3d8a1108b04ea85d9d@orel>
References: <cover.1750164414.git.zhouquan@iscas.ac.cn>
 <3591f5aed544f9026d8375651936e006b57defdb.1750164414.git.zhouquan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3591f5aed544f9026d8375651936e006b57defdb.1750164414.git.zhouquan@iscas.ac.cn>

On Tue, Jun 17, 2025 at 09:10:42PM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> The KVM RISC-V allows Zicbop extension for Guest/VM
> so add them to get-reg-list test.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index a0b7dabb5040..ebdc34b58bad 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -83,6 +83,7 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFH:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFHMIN:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOP:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCRSE:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICNTR:
> @@ -253,6 +254,8 @@ static const char *config_id_to_str(const char *prefix, __u64 id)
>  		return "KVM_REG_RISCV_CONFIG_REG(isa)";
>  	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
>  		return "KVM_REG_RISCV_CONFIG_REG(zicbom_block_size)";
> +	case KVM_REG_RISCV_CONFIG_REG(zicbop_block_size):
> +		return "KVM_REG_RISCV_CONFIG_REG(zicbop_block_size)";
>  	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
>  		return "KVM_REG_RISCV_CONFIG_REG(zicboz_block_size)";
>  	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
> @@ -535,6 +538,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
>  		KVM_ISA_EXT_ARR(ZFH),
>  		KVM_ISA_EXT_ARR(ZFHMIN),
>  		KVM_ISA_EXT_ARR(ZICBOM),
> +		KVM_ISA_EXT_ARR(ZICBOP),
>  		KVM_ISA_EXT_ARR(ZICBOZ),
>  		KVM_ISA_EXT_ARR(ZICCRSE),
>  		KVM_ISA_EXT_ARR(ZICNTR),
> @@ -864,6 +868,11 @@ static __u64 zicbom_regs[] = {
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM,
>  };
>  
> +static __u64 zicbop_regs[] = {
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_REG_RISCV_CONFIG_REG(zicbop_block_size),
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOP,
> +};
> +
>  static __u64 zicboz_regs[] = {
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_REG_RISCV_CONFIG_REG(zicboz_block_size),
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ,
> @@ -1012,6 +1021,8 @@ static __u64 vector_regs[] = {
>  	 .regs = sbi_sta_regs, .regs_n = ARRAY_SIZE(sbi_sta_regs),}
>  #define SUBLIST_ZICBOM \
>  	{"zicbom", .feature = KVM_RISCV_ISA_EXT_ZICBOM, .regs = zicbom_regs, .regs_n = ARRAY_SIZE(zicbom_regs),}
> +#define SUBLIST_ZICBOP \
> +	{"zicbop", .feature = KVM_RISCV_ISA_EXT_ZICBOP, .regs = zicbop_regs, .regs_n = ARRAY_SIZE(zicbop_regs),}
>  #define SUBLIST_ZICBOZ \
>  	{"zicboz", .feature = KVM_RISCV_ISA_EXT_ZICBOZ, .regs = zicboz_regs, .regs_n = ARRAY_SIZE(zicboz_regs),}
>  #define SUBLIST_AIA \
> @@ -1130,6 +1141,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zfa, ZFA);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zfh, ZFH);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zfhmin, ZFHMIN);
>  KVM_ISA_EXT_SUBLIST_CONFIG(zicbom, ZICBOM);
> +KVM_ISA_EXT_SUBLIST_CONFIG(zicbop, ZICBOP);
>  KVM_ISA_EXT_SUBLIST_CONFIG(zicboz, ZICBOZ);
>  KVM_ISA_EXT_SIMPLE_CONFIG(ziccrse, ZICCRSE);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zicntr, ZICNTR);
> @@ -1204,6 +1216,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
>  	&config_zfh,
>  	&config_zfhmin,
>  	&config_zicbom,
> +	&config_zicbop,
>  	&config_zicboz,
>  	&config_ziccrse,
>  	&config_zicntr,
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
