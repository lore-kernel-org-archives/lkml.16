Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB352C327E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 20:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748897642; cv=none; b=NshppUjEITTZ1foyyWP6d5+oAG44V68fFDdf6+dXajO2A6d7P9MVlwoZvztqql3hf0lKEeeesHHuJCSuoGHRb+FSCen2c6MQ8J/6ooU7uH/QrQ1P1C3Zyorgc0FQz9jNtbyqKu/yhUf0sXUjnId9Zdy97m/SGcmE/gqwDN8jbEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748897642; c=relaxed/simple;
	bh=Z+zmL5/BASf+skWpsDEGc/FQlKzwb4MH35eU1FIiIyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WsVTxoPOCor9ICP/312uNuU8GZvRJ+EUrS5v40+ADQwz82KOTfeQ8iNpx4Tja6fjX9FbS2spAmqVOHoSUUKuoyqIiYQLq3/MO51FSYe8hlnnqNpkgHhaj+2LbLqTt+Ln6lciTD+G0j2Xr/TPetVPCF2iScm/4SMk+xrs3lIPLuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ElhRBlGe; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ElhRBlGe"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-30e8feb1886so5228408a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 13:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748897639; x=1749502439; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hweO6tmk9XCIs8J63FaekelILSkYnStY5cMnlCZXw2o=;
        b=ElhRBlGejRDaqnnqzgroKiewhOb5mYp400ry6nYP587VgTTC3lYvnswc6G0LITga25
         43vpaC6HU65fVVIVxzwBtIhhTT7Wd4ycYkeMjfkzmlFQZcf5G5X5m6yceFg1aKndNoO8
         m5fHribuO1pBP/OCQ0Rvrf66lL8zGWHRgtv7VCopuy+j6EsLmG9+JeosXYjU9VXwgz1V
         THYLL/Rd8rhydxJWi20FwQEWfHhP5ANteDXthCHwnNibNC/xdok6Q1D6qkc9B1sWFRed
         BaGjB+qp4661dW3zPuwdDVPPLje6sikGPpCEQgoGiBrldx2N5PAHVPh7MLQG170Db2jE
         u3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748897639; x=1749502439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hweO6tmk9XCIs8J63FaekelILSkYnStY5cMnlCZXw2o=;
        b=mSWIPNT/HB4oNXiClgVAItQIPMObZ+geUdeZV+D6amQdPXF9+ZfqQvbkndqSzUuI+r
         F9M1jt4voKEMgz49DUYjPEIKM/6ZLpve5IDrGSXnNVK2QtJJosQW28EpYg+s61F/8Ij2
         BWLzx5Jqq0NNkjgWzS46HmgB8K4SE4zKHWALKcmvhtQydqOf6IG/oLrfnE4oGyhhVC9i
         SDWwwkWS1aMJ5J7AO8ZrGbEdBk+dbpTyVnKrQpBIoRR9zZ+N42XtGl77X7ToRBnqiQkb
         mmQ0I2+xDcJVHDMwQ3eQItcBgQdcYwCgVjPPw3AqPbJm0u8QL9250o4efueDbIUZa5Jt
         5BjQ==
X-Gm-Message-State: AOJu0YzGsL2hFWC9gvdoge4JE5V5jzGSFmqiehdh3rb5iOacJJu/zB9F
	nPLJ6wazfZU7rR+nIKtkZ0fdPqXJgIZtsUOH0+/nb4LgDLF1vT3Jskie87adEuKnuzQ=
X-Gm-Gg: ASbGncsuGu0EKvQpf82trVKcMul8Wwz4PCGwZDu40Fdgl8C5pN43Fb6azY9ZQSJyo0K
	GjC3rE25Td3qOvQiBsMPieE7ArksZP4ys+OkIuCdlkQ0DAIJtRKbTmSEtCMMAX6kKb49pA3Qh/8
	KRkY1Mr+4eDfikWvO+FW0I3DOsE6ppXZf38zVUfD5bhJQP3lm9ZrBCdQDvsUxI5jsUX0WnabR3r
	d2TXNovwfEavuB/PkTDZmnUMUNzxSFH2fEmFD0Frumc3WHxbo3AvukuL8JeLAqO9lTiLoO4afJ6
	/oyVdKusaCCWD7A34V7psv7I3GcFkvWJ8b6F/0tHtcrSWcA=
X-Google-Smtp-Source: AGHT+IGOKGYMi71C1WdDvSFZiiPsMZwi3ra5fDpgeX9iy2Xl0DNGuAzsi7Is4p4NcEg1vfx34vd9Rw==
X-Received: by 2002:a17:90b:35ca:b0:311:b07f:1b86 with SMTP id 98e67ed59e1d1-3127c852665mr16301929a91.29.1748897639572;
        Mon, 02 Jun 2025 13:53:59 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:3831:e87c:eedb:3ff2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e399b3bsm5998010a91.31.2025.06.02.13.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 13:53:59 -0700 (PDT)
Date: Mon, 2 Jun 2025 13:53:57 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Charles Mirabile <cmirabil@redhat.com>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v1 1/1] riscv: fix runtime constant support for nommu
 kernels
Message-ID: <aD4PZdg0pghM1Nil@ghost>
References: <20250530211422.784415-1-cmirabil@redhat.com>
 <20250530211422.784415-2-cmirabil@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530211422.784415-2-cmirabil@redhat.com>

On Fri, May 30, 2025 at 05:14:22PM -0400, Charles Mirabile wrote:
> the `__runtime_fixup_32` function does not handle the case where `val` is
> zero correctly (as might occur when patching a nommu kernel and referring
> to a physical address below the 4GiB boundary whose upper 32 bits are all
> zero) because nothing in the existing logic prevents the code from taking
> the `else` branch of both nop-checks and emitting two `nop` instructions.
> 
> This leaves random garbage in the register that is supposed to receive the
> upper 32 bits of the pointer instead of zero that when combined with the
> value for the lower 32 bits yields an invalid pointer and causes a kernel
> panic when that pointer is eventually accessed.
> 
> The author clearly considered the fact that if the `lui` is converted into
> a `nop` that the second instruction needs to be adjusted to become an `li`
> instead of an `addi`, hence introducing the `addi_insn_mask` variable, but
> didn't follow that logic through fully to the case where the `else` branch
> executes. To fix it just adjust the logic to ensure that the second `else`
> branch is not taken if the first instruction will be patched to a `nop`.
> 
> Fixes: a44fb5722199 ("riscv: Add runtime constant support")
> 
> Signed-off-by: Charles Mirabile <cmirabil@redhat.com>

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
>  arch/riscv/include/asm/runtime-const.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> index 451fd76b8811..d766e2b9e6df 100644
> --- a/arch/riscv/include/asm/runtime-const.h
> +++ b/arch/riscv/include/asm/runtime-const.h
> @@ -206,7 +206,7 @@ static inline void __runtime_fixup_32(__le16 *lui_parcel, __le16 *addi_parcel, u
>  		addi_insn_mask &= 0x07fff;
>  	}
>  
> -	if (lower_immediate & 0x00000fff) {
> +	if (lower_immediate & 0x00000fff || lui_insn == RISCV_INSN_NOP4) {
>  		/* replace upper 12 bits of addi with lower 12 bits of val */
>  		addi_insn &= addi_insn_mask;
>  		addi_insn |= (lower_immediate & 0x00000fff) << 20;
> -- 
> 2.49.0
> 
