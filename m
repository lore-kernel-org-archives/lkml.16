Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459CE40BF5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 19:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743449997; cv=none; b=VKnHqqunpiM6y33bYeAxED98wJi1anO6UhsjqSlLr/hwJXGyyXSnKqGqld+Ks5VfL/zYrlUuv0kJcWVyyOtPuXoNnk4BSZ8XVKp1gKYSyg137e/AHBJtNKJhsukmZ3XzO4j8NGVSA1nE8i8r9DogEwaZrjyQIeNJDNb4Sxo4mpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743449997; c=relaxed/simple;
	bh=WMrOSux3d041kvJhwd25JmPn54Ax3vU8/DHkV76LhwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n/DgIlAFasFtlWwxMC53rKEffGTh2ivTBgRRTJSCxFhCGk0fnZGu5V/0kZachRXSABaukkHOYnNVK/z74h2isBb6woUuykXmm3yEw47+j4iF6zpfPatfI7TlQBlJwYOQt/xPTQya6ie4Tnn+9biD7H5ov+CHflbZ9GxOODscMYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqFdWOgU; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqFdWOgU"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54b1095625dso437524e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743449992; x=1744054792; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KE46Inlegp6APD9xE6trTWfYli76kOte9df0I7MWvBQ=;
        b=SqFdWOgUdPagzpykPGD5HyNuCTzP07bsvxChP4BgCi6mDYpbH7J2/ZuUvAAxc7RK4z
         l5nhaV/aZZ6lXVFr98lw2mKuIX82ElfgmK1piBIeCcltLr8AYzTw01NIIpi6PrWyYD4J
         SBBBnzbo5lhhNbMPz8IgCx8dgmGRBuvaTdkhBTyS5QUFShOWLKQV5HqulVihpmQ5SIx/
         qsUT9rlFWD9qhdfcys9Hw+XZjDwWwJ27O5WdZLtL7GHrBMt/1Dp24HDrPmoTFIbBy0GS
         S/Nfy8btjhyxYE0xta9ZloRyi3q36CvyJ30yfoRfwt2Ap8Tqn24nGjcsyNKqenPJnppW
         ExEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743449992; x=1744054792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KE46Inlegp6APD9xE6trTWfYli76kOte9df0I7MWvBQ=;
        b=wB58Et1dvIc6ZhwPIIVIfFyA+DUPqnGP5slFSeU6BFmsMlxK6nLH4CIMrr5Erle95R
         3q3eTOu5VG5vcEDApTiza601p45U6lweZ5yUtNnKSzjr+KkhctugdHUnA2TtpMucQwgT
         ESieYYtpGhU6vLiHe4SwEbl6z97G5qsoOjsfteBZg77wiib+SC6L6+Yb3w+DVNJlVzz8
         abvgI/iuBgeXOS2Pn8ioNTOky3hA56S45gAc1tmqdlIUao75A9Ug1ZDfM87zH2OVnb3l
         awN60p4RCC/P/Y1FsDTjQhTlyR+NiOUs01D5aknxKrXybQv52MhVXcIk7DuaeE+KI8G4
         mw5w==
X-Forwarded-Encrypted: i=1; AJvYcCVBGKSFvRfkBvZw5BokYIXJ8XZD/xP7Ef7Td+krnfB4/cXy3soklGoxsS36q9xCvCfv7wMLyNsjYnGGv24=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLAb3syZn4VihlEDZQdPY1qCue07oeDNqadYZFtkPDcc2iHPY9
	Q4yJvassCdQDg/9tiPPgF62aqZNWiGnsPisWLB3sWdr2RBLN1D+n
X-Gm-Gg: ASbGncuAvFA7qV+AxtD9zbXqwsYfUr9JOcnTI+xvmysbMq8v8OMO6kuLlIdP18PNEtO
	6WF7Is/p1WyBMeTQVylCWzE77Guun8awr5CSPtgyGkeYII6ER69pKfkwbH9leVMJerlMFu6x3mc
	eRXcP9c6/Ga35Fb8GrwQpjrax3QYbHZP5nEZU47ka1pQ0qWExzNtciYbNo5lLc0ZlMDRAts9oxx
	Vcbe0faOQXm9/Wv3MaC8ukf9vBWB1D6mLknAUTI7fP1CnsGCa3ehN5344JyZsKyDTNA49yfQxsZ
	g9ysQNT6Wk79yThl3GcF7ULZPeyqyPBXJHdp4v2ja1wUh41QgNqJmuWxC8HEZIolHN4EP7LZuSj
	pEtW0yeJfKmm5DseeZwQ4ZOA+ES/AW+oVvms=
X-Google-Smtp-Source: AGHT+IHtvjwnzdADUjoykjBM/nZjeA0797jOcEMUJpoq4gEQBt2aHMNBmOBXLVHt4e4Gi37A9IwK2A==
X-Received: by 2002:a05:6512:b1d:b0:545:bb6:8e41 with SMTP id 2adb3069b0e04-54c0a536fd8mr64283e87.52.1743449992095;
        Mon, 31 Mar 2025 12:39:52 -0700 (PDT)
Received: from ?IPV6:2001:678:a5c:1204:5508:6e19:c6a3:9875? (parmesan.int.kasm.eu. [2001:678:a5c:1204:5508:6e19:c6a3:9875])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b095a0b39sm1219278e87.229.2025.03.31.12.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 12:39:51 -0700 (PDT)
Message-ID: <256412b3-9878-41be-8a22-78d5356b8479@gmail.com>
Date: Mon, 31 Mar 2025 21:39:50 +0200
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
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250331-fix_runtime_const_norvc-v1-1-89bc62687ab8@rivosinc.com>
Content-Language: en-US, sv-SE
From: Klara Modin <klarasmodin@gmail.com>
In-Reply-To: <20250331-fix_runtime_const_norvc-v1-1-89bc62687ab8@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-03-31 20:45, Charlie Jenkins wrote:
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
>   arch/riscv/include/asm/runtime-const.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> index c07d049fdd5d2999c57d8a90e7363829c5462368..451fd76b881152919f22de8f5c56b51171acbf3c 100644
> --- a/arch/riscv/include/asm/runtime-const.h
> +++ b/arch/riscv/include/asm/runtime-const.h
> @@ -56,6 +56,7 @@
>   #define RISCV_RUNTIME_CONST_64_ZBA				\
>   	".option push\n\t"					\
>   	".option arch,+zba\n\t"					\
> +	".option norvc\n\t"					\
>   	"slli	%[__tmp],%[__tmp],32\n\t"			\
>   	"add.uw %[__ret],%[__ret],%[__tmp]\n\t"			\
>   	"nop\n\t"						\
> @@ -65,6 +66,7 @@
>   #define RISCV_RUNTIME_CONST_64_ZBKB				\
>   	".option push\n\t"					\
>   	".option arch,+zbkb\n\t"				\
> +	".option norvc\n\t"					\
>   	"pack	%[__ret],%[__ret],%[__tmp]\n\t"			\
>   	"nop\n\t"						\
>   	"nop\n\t"						\
> 
> ---
> base-commit: b2117b630c48be69d2782ed79fefe35dcd192ce6
> change-id: 20250331-fix_runtime_const_norvc-407af1f24541

Thanks!

Tested-by: Klara Modin <klarasmodin@gmail.com>
