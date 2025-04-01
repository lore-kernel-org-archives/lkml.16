Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02671C7006
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 09:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743499638; cv=none; b=azuZsvr9uPslC4GveIoIOI4DA1y+v10xutdVxOt5YyLFpxRYLYpZXNHyCTzHsi20R2mSoIUy3aSVe+Kb7d8vEspEjvIHOyb3xZlRxYrF9dwIwIwg3HImahe+y4uGCPCNNzlpu4eDEcb3Xc3de3J8Xpf5I65d5kduT2PnhU2IuXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743499638; c=relaxed/simple;
	bh=cfTqZDHcE5fiz//FNirKrbvmscvekrm4mADcU84mmSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a/ZsiNeRm/vkkSPTis/3UrYGZDz//xdvs/RPiZCGoehGmGnw2DGj7EvD8t7riZtM6PtK7hHdeXLxkYJwFDV+/LJLKL1kt+/czCk5zqiaAyolx5xfPlw6zm4fhQdZHp1VDFTseMdmUcFp+8xWcmTiLWqK+Am6qP1tU7LSja8zp6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=dnLmlc9I; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="dnLmlc9I"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2254e0b4b79so137068575ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 02:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743499635; x=1744104435; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Uado/lwoP6/yzxDnZMmcfqF7svpEZg92uh1rPCCI/A=;
        b=dnLmlc9IKdG4e9MSiBGO4NACYHLhj0h0AR/WVTMaR4INva+OmP9ctY4bRsUrKLBrve
         fv5mSf+51ysl1zrPCK2kNG9ENz0t/2lxnfhzP82vYFd1BGRmTaxBRH/u80ObH8zG0WY0
         q80/XEiDpUhQUJ/kkX4jkQOIiBPkBBHnGSaed2Faz2ngxUajpkQAhmna4rQ2OB/RhW11
         xxG5Mcq12d5CSKKQnejBWj4ENoOF9Qu4Vkyk564NZl8vPZNrfrpV7Nrfws5n7R8xfRwY
         Emu46VuVo73nOQSjKLfCqOmWb02Joqrd1oopqgf9M/gEPvWB2VxFUV+sqkwG1MA9pIMR
         zCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743499635; x=1744104435;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Uado/lwoP6/yzxDnZMmcfqF7svpEZg92uh1rPCCI/A=;
        b=aJebKkaAJQlpNxryeXGriHSuxaNd/8gs6nOVlzRySYJMvllNLef1wDKT1+ZZoWmNuh
         s23W6osgASY8CImRdY7BLA+vC/B6WJ5WUvvkWccgApV/U66671nEKkNlHIxjmGEDC8w8
         0NGodCvgmgyAOy+NOkCbesIZdl3yenIXmVaP8DdcCJhI0b/jkZbsqjoRK1IhcjToeZln
         w3g0IuVu/vhkj77liaHa9HRhnFp6RWeXZlZMhWWTvR9xxRYClQA5lGokNPRlqWVw4lrM
         kLAEVHHo4yTu9BCdYqbAI3aawPO/hBCO8vV8/tOqmi3RUOkxj3PaRwqFlNq4VsKniSkj
         cYPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJGyw6/YQBVZE7Tcve01whknr20Z2ztwQt41ZJjKGr5V688kXtOHNaiQ1fUnT9kxEYoblnTn0pSl5XuC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdMp3X8auB5SJpREBP54P0Ri1jSyZ9HP9SGXQwMRnqhslAlJWJ
	RiaqOlDoKug/ro6Gn6Y/ECnX0hsRK6vu0tNR5faFdZh89u27Ht5JfLkouUQgBKY=
X-Gm-Gg: ASbGncu+RO/MiYFrH4W4+Bb5139eYyU8geFUcUTg6aj/rfDLGRBtlPjMAPGL9fUeU55
	23uEiQKmtkQ9XfcC0sK+CKY06bo2QowoXShlWn7ON4dzAhEcwhAWJl2YFLe1fBTR2N4B8e+D0Yc
	4QT3/qwwgCteWTZRmfWQ0oVHa7eRXBCYoNLbdJFbxXhhZRIUsiD8XD5yjHo2bckFEjg4ZDihb45
	wVzhgAmy93j+WC5Y+e709hGgTF0E3rrxxF1DF3NJ/ajHQaeuDKyu+TViZ5ruk5M7VVc9ChrSLS7
	w6t1A0smQ1bQv5oU56FjFEb/ToodaaRdS3xOGWnbz8TPzXlIdMqKsz3S10nc0DKGtsc6RAupRxi
	0zUM2NT7Dee39+fEf
X-Google-Smtp-Source: AGHT+IGqaCCTYrqWmclHIKooaJS6kAOzFT7W0prKClRtoHu3FK+uWwiXhw0KuQp6tmIfbZ4lKt34fg==
X-Received: by 2002:a17:90b:56cb:b0:2f6:f32e:90ac with SMTP id 98e67ed59e1d1-30531fa159emr21548695a91.11.1743499634871;
        Tue, 01 Apr 2025 02:27:14 -0700 (PDT)
Received: from ?IPV6:2001:861:3380:2e20:6214:6f9b:8e4c:f723? ([2001:861:3380:2e20:6214:6f9b:8e4c:f723])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039e10af2csm11190566a91.21.2025.04.01.02.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 02:27:14 -0700 (PDT)
Message-ID: <f8b56a02-c508-4bc9-a503-48e487ced86e@rivosinc.com>
Date: Tue, 1 Apr 2025 11:27:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH FOR-NEXT] riscv: Add norvc after .option arch in runtime
 const
To: Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Klara Modin <klarasmodin@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250331-fix_runtime_const_norvc-v1-1-89bc62687ab8@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250331-fix_runtime_const_norvc-v1-1-89bc62687ab8@rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 31/03/2025 20:45, Charlie Jenkins wrote:
> .option arch clobbers .option norvc. Prevent gas from emitting
> compressed instructions in the runtime const alternative blocks by
> setting .option norvc after .option arch. This issue starts appearing on
> gcc 15, which adds zca to the march.
> 
> Reported by: Klara Modin <klarasmodin@gmail.com>
> 
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

Hey Charlie,

Could ".option arch,+zba,-c" be used as well ? That way, c is treated
like any other arch option. Or does norvc has other side effects ?

Thanks,

Clément

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

