Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A1127CB0D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224842; cv=none; b=FsIq80fwKKebSJQnrBxZFaJahTrc1XhJZgScCZd/Z4WJyzM/zLIYyer0q3vKIOTQ+1nP30EGE4MDFs6Rwy+nV4OYzwUrrycJNVz6/Hs+yUwv6FNZV4JZ/ATxLTRWylO0TrnY+XXIgMYeEZKY72LUcCWAFu0tbjMlCDwLm6/NEbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224842; c=relaxed/simple;
	bh=S/Xg5A+TBhyzRVId5bzth89Ojw9mymrrKQfHfcRjiX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ALRYTjrN5PlbbSD4ZVGXuA55fDWJxACinbOGCaaOwvk5uSFp43U0o4Y1iwdfIN/kkWyAN2r4jdWjk9qCy1MpUTGYa+U8nCjUtrBRiH1jZ6dHbRavQ/aZPBRi6ApP0btbPXXhPUCQNF/O/sLKuWv8eSTAcV8nRdQYk9Hhb2iD9pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=bt9G6FXx; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="bt9G6FXx"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso837461f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744224839; x=1744829639; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OLxDcef/gKFj6jpgfhC8SbBxJlwQndkI5ymOb6usHAQ=;
        b=bt9G6FXx68QxzInEZNyasP9vtSMHVVC3jUlRw0o11gUoED0b0GgR2IRFss8stPYhmJ
         GYOkbP9KQCqpT3PuwhkXMgPV6e8zDmhhoIjP5RvLl7eNWN+Jm2PfQuJfyql1uA2uBpXy
         kJb+A86Xo/V+cETNAEbcdl0mDJgetV3wmOLxDhMRGzjbb45UXk+eYP/ljCsnXNE0UVnB
         7KhMWCqxZnsN74RHQ0dKoF5YRujlFAz+p4I6GwdUM2wHrrF0gzPsjwx9Y3OT+Oag9YOe
         vysiP45lDcgUroQw0kRKp4O/sO3FbQj/SNWNYnBlFE2X7P6Z5O6ppdzZZZtB3AXKATHC
         lCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744224839; x=1744829639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLxDcef/gKFj6jpgfhC8SbBxJlwQndkI5ymOb6usHAQ=;
        b=pNGNVm0sXzCnWm62JHJJajFqoEW1190teGAEPvr+BkDbY+KkovyJUPCqi7y21l7DFZ
         dGz39UQBs2NnjO0AuBUVGsjaJ2/DvrP8/siUs2THD197xp8/XdbRXCSYuFOZ32TWT4w5
         R5OQUX69ichQMB20fQHGV3EiGzsHjyhIsRTCr68h39z0fJ8cvccPvAjVfEf6YVNCwVyd
         FH8bbOUq28d4xA3g690J+YQE+Hnt6PKIfOeqUUPJ8c76+TwjGiakpP5ICjrkJg4aX5Ud
         0If2ajkOjo4esvOhsIjiGY5cAi3u7l8EnwbWW0Hb3d5bQHoDZ1Bqsv96hWdaUDgZdP5T
         1sLw==
X-Forwarded-Encrypted: i=1; AJvYcCWSDTQzVDGgrE3N+IV1ECv2ni+/Tqv+b8DAxkH3QF3gu8wp+e4vdjOqpn0asosvLKfujoh6kz2TUsd9DgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXHj/vilRsk01KRif1ZyugnvsdSO1N+U6zIjo57bTq4rQAkkmn
	SfC3vqgHw5V6v9zJGKGujgPcuUw7ItSO1nhpZ9BhNJ/HOMNI7Ki713vxgbywZSs=
X-Gm-Gg: ASbGncsFAiIG5w//hfNCI/iLNY0kYpCTVV+FN1mWeedFJQtO3V17hFXV2tYmUgoHwh/
	p9yidA/+i0z2Xzmt1ngoKmudAAOAZ+YPtxW6S7oYA9mBQAannMA5BFnnxSe8Sr4r0ETNsvathH0
	TAm/26mav8KN/yj6hEiS4PyFT1mI1xGVS8M0zDFbLepbhZR8Yi/DYhYYgJLQzUFWASl508XKsLC
	HSUmA8bzT3oiBUUlRTq5ebrESWGiCkxoPTR0era4bA8Niq8bgPUnnrfOzm2n2h7/QMT/xm9AVd6
	zpK+EhUbQviARpqJPITWjboEV9qokslm4GIzNQEcJYBAg0R1jM0rSVZZ2whiaLiFo0+hTw==
X-Google-Smtp-Source: AGHT+IFomURG1YZ6MaU3eQzhvE9DCFtZWTCQi1bNYeooIn598e5QS01eOCe8n8ZhHftKe9tnJoa+TQ==
X-Received: by 2002:a05:6000:2585:b0:390:f0ff:2c10 with SMTP id ffacd0b85a97d-39d8e32c615mr411689f8f.19.1744224839182;
        Wed, 09 Apr 2025 11:53:59 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235a5d31sm24520595e9.35.2025.04.09.11.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:53:58 -0700 (PDT)
Date: Wed, 9 Apr 2025 20:53:57 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
	Pritesh Patel <pritesh.patel@einfochips.com>, Darshan Prajapati <darshan.prajapati@einfochips.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] riscv: module: Allocate PLT entries for
 R_RISCV_PLT32
Message-ID: <20250409-cf4fead4fda7b1b11bf4107d@orel>
References: <20250409171526.862481-1-samuel.holland@sifive.com>
 <20250409171526.862481-2-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409171526.862481-2-samuel.holland@sifive.com>

On Wed, Apr 09, 2025 at 10:14:50AM -0700, Samuel Holland wrote:
> apply_r_riscv_plt32_rela() may need to emit a PLT entry for the
> referenced symbol, so there must be space allocated in the PLT.
> 
> Fixes: 8fd6c5142395 ("riscv: Add remaining module relocations")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
> Changes in v2:
>  - New patch for v2
> 
>  arch/riscv/kernel/module-sections.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
> index e264e59e596e..91d0b355ceef 100644
> --- a/arch/riscv/kernel/module-sections.c
> +++ b/arch/riscv/kernel/module-sections.c
> @@ -73,16 +73,17 @@ static bool duplicate_rela(const Elf_Rela *rela, int idx)
>  static void count_max_entries(Elf_Rela *relas, int num,
>  			      unsigned int *plts, unsigned int *gots)
>  {
> -	unsigned int type, i;
> -
> -	for (i = 0; i < num; i++) {
> -		type = ELF_RISCV_R_TYPE(relas[i].r_info);
> -		if (type == R_RISCV_CALL_PLT) {
> +	for (int i = 0; i < num; i++) {
> +		switch (ELF_R_TYPE(relas[i].r_info)) {

I see ELF_R_TYPE() is equivalent to ELF_RISCV_R_TYPE(). So OK.

> +		case R_RISCV_CALL_PLT:
> +		case R_RISCV_PLT32:
>  			if (!duplicate_rela(relas, i))
>  				(*plts)++;
> -		} else if (type == R_RISCV_GOT_HI20) {
> +			break;
> +		case R_RISCV_GOT_HI20:
>  			if (!duplicate_rela(relas, i))
>  				(*gots)++;
> +			break;
>  		}
>  	}
>  }
> -- 
> 2.47.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew
