Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48188635B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 18:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743447289; cv=none; b=I+vtxBMi1q5eS54FpNBfr3kyhqg/d9JubtuJkghoXDGhdHfJgb0sBPqH7pI6WqNK3EfGuyUBmMcJ1S08VUGyBT7XrdJ3yI2yavGeH6bCc5rQW8QvpbCz3nWFd9BF6jg07s2NAu8OGaj2cbLxBLx1SRs/oabK0rhJfhrNPqLgOh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743447289; c=relaxed/simple;
	bh=EFjt12ORwAX2szoEbgHJ6MCeanzMD4HTthGpC/vo4gg=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=bowXjxLJ1NaP7gBXsPA/xX9KFlsSUNtjA8AKl75S2eYciGiMFJXK2WuZcouC4yYApXHaaqHy/rBWFqlyHeUkdipnelDba98qdJCPVgXKkHP0a0D0O/tncBbIzCxYYcVOUQtAMa0R4d0dH4BJeQrt6lUOeRPsRy7plEH0fWAoS3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=F0Ph4swu; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="F0Ph4swu"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-223fb0f619dso90224595ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 11:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1743447286; x=1744052086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OTVda1P252At+m8osJteKN1IA5m1eg7LV3r4D8xmaDc=;
        b=F0Ph4swupGS8lRfApxyggf9A5fjbMSLOPlZYKWjIo5HSxOpPZ7g1pjgJAL6q09BoJG
         hVfxIElf5Vx0j1J6efElqDgRHi8hyA99+fco3WXy31rJXZ9wkYLSbRdVSZpjqMgZgR3j
         MpZeZ9NCgFII/zHqC+mouGf+aLRPrvRcy0GEJCeYLTBzom78gOu5XXNDoqGfhqplP585
         CYDTY8ffu1mumZr8JRMHIr1RYYGLXQH+lmsyp5JRr5t3XY9cN25H4W0H0TABRhsPjgSr
         HtaFBLRuhCuo2Vi21OhRNUcBw7ATrFFH2P5CQYSqrg0kuvGAYO4yBAZUMItj9lEnQ1rS
         Ev0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743447286; x=1744052086;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTVda1P252At+m8osJteKN1IA5m1eg7LV3r4D8xmaDc=;
        b=CjPe4c6DiAprBrknWTSoZHdkvBqejQ3iHbI7nnX7D99bpNkVA3OJITLjwEAK2UnGLS
         +a889R1tytartL+b5pFL5GJ0OkzD3jOaFI1POp6ywRxh+tjyrfAHrotNHmu4qWup7plU
         TRSnaG8LNmdug0yiZsPpykTOdyv6tBMnHdBfHBZDanfC1muWiyqgjoKrfoUfjYm3yQvB
         xLXsgNgljEfY/Em/A58fuBVzv9a3kKGm4aCAvPthLvGAouPEYddZ2Bk5jqLtcTFwiF+2
         /pvPUFJhFpRk01UH4/NcXwN18Lk74vxgKD7LzWL/VPZeWEgG5E/7jv5FlCt7gY+NX8w/
         UQ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6iIZY5C/hv0Udvg1UIQPZ/+b/jvvIHLC3aK9EMS67dRR1j89UqC2SxqvGdgjDyKMlVPP+WM8b5DmVNBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyjKuGPQQvkcoM21jmA2z4XhRALiiN3LZvEqYPQrSudqfH1Na1
	H3GpBzdQEX+lVSNbcg2it6ESr/mbOmvadLgNG2Kmpy1bP19xFLsoZT0LSrANW4I=
X-Gm-Gg: ASbGncuEsLIZ8uISRP7OGFxsq8Y7Ik+t/1ObCwiv38m753xMKwSGMzyiw0zYtH3gcx8
	fyoXSTgMjFDOtqui5JCF6uDp3oj9bGI/K74XU513EGrDvWoz3HboV7h4lFwlMSu0EP8t5j7ZWj3
	xzDoIiBmPnCuypcretzP4WRR0TsGnO1hfDi7wHhYi1+Bcg8NcwwP61PZpET5sv7Zrno5Vkxo2N0
	UQ6+GK8PdSq9u+NZRFof4ZlQ5kXMHYD5Cs44lsq+QtyWXW7m33o92zKkwuH3P+WDzXkdcNSuYTf
	39ah0bCPIDIaOcRiIE0QIaxlpOrgdmX8+NiVA90BfQ==
X-Google-Smtp-Source: AGHT+IF1hRmDTAmef95Trsj63EDsH+36mRerL5rWu6aYssdZOJ08HOdEXIdFEQhqyXQ7iDu9IBfwrg==
X-Received: by 2002:a05:6a20:9f46:b0:1f3:293b:7aa with SMTP id adf61e73a8af0-200d12ff415mr420725637.4.1743447286022;
        Mon, 31 Mar 2025 11:54:46 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93ba0e532sm6701397a12.64.2025.03.31.11.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 11:54:45 -0700 (PDT)
Date: Mon, 31 Mar 2025 11:54:45 -0700 (PDT)
X-Google-Original-Date: Mon, 31 Mar 2025 11:54:36 PDT (-0700)
Subject:     Re: [PATCH FOR-NEXT] riscv: Add norvc after .option arch in runtime const
In-Reply-To: <20250331-fix_runtime_const_norvc-v1-1-89bc62687ab8@rivosinc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, klarasmodin@gmail.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Message-ID: <mhng-af57c321-9a96-4098-9eff-5feeccdeb199@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Mon, 31 Mar 2025 11:45:24 PDT (-0700), Charlie Jenkins wrote:
> .option arch clobbers .option norvc. Prevent gas from emitting
> compressed instructions in the runtime const alternative blocks by
> setting .option norvc after .option arch. This issue starts appearing on
> gcc 15, which adds zca to the march.

There's some clunkiness around ".option arch" and ".option rvc".  So 
this might be an assembler bug, but IMO it's sane to just work around it 
in Linux -- at a bare minimum it'll manifest for users, as binutils 
already released (and GCC 15 is just enabling the Kconfig that triggers 
the bug).

> Reported by: Klara Modin <klarasmodin@gmail.com>

There shouldn't be a newline here, I'll just drop it.

> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Fixes: a44fb5722199 ("riscv: Add runtime constant support")
> Closes: https://lore.kernel.org/all/cc8f3525-20b7-445b-877b-2add28a160a2@gmail.com/
> ---
>  arch/riscv/include/asm/runtime-const.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> index c07d049fdd5d2999c57d8a90e7363829c5462368..451fd76b881152919f22de8f5c56b51171acbf3c 100644
> --- a/arch/riscv/include/asm/runtime-const.h
> +++ b/arch/riscv/include/asm/runtime-const.h
> @@ -56,6 +56,7 @@
>  #define RISCV_RUNTIME_CONST_64_ZBA				\
>  	".option push\n\t"					\
>  	".option arch,+zba\n\t"					\
> +	".option norvc\n\t"					\
>  	"slli	%[__tmp],%[__tmp],32\n\t"			\
>  	"add.uw %[__ret],%[__ret],%[__tmp]\n\t"			\
>  	"nop\n\t"						\
> @@ -65,6 +66,7 @@
>  #define RISCV_RUNTIME_CONST_64_ZBKB				\
>  	".option push\n\t"					\
>  	".option arch,+zbkb\n\t"				\
> +	".option norvc\n\t"					\
>  	"pack	%[__ret],%[__ret],%[__tmp]\n\t"			\
>  	"nop\n\t"						\
>  	"nop\n\t"						\
>
> ---
> base-commit: b2117b630c48be69d2782ed79fefe35dcd192ce6
> change-id: 20250331-fix_runtime_const_norvc-407af1f24541

Thanks!
