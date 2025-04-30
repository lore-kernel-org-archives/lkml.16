Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A84125E821
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746030555; cv=none; b=q03HyGF5HpT5o2f6YIVRMinuOud7FX222eHI/+UXBd/e94JM/cLZnHSILrhixGBljYYTS6EaAq7n1gU/fWq8leYdCC0jcfteqA9fbRTNq0ARnyiE3fNjktiJ1FH5ysK+KPHutv1rk3bjcaXl9FMkkShJDbul2AsOMGttsJ71Mbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746030555; c=relaxed/simple;
	bh=N2fIhTPP3bAsp+EgIBZ1fV/xQFWlcYofrCRmusWDnh8=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID; b=hdSUK0MQfTWE956cFAeLYusZ6Pxv+g0TmYDNyhSBKI/cSeY5pp5ysxO/2Gljvrr/1COXhHhW7TzEQUDQVukBkhKZhXReplyYCd6BHBEX4adWEodytMJJMTiQe2/MCIOBheyzhl3rfrIjLUHRQIgLHfnoZYwVkQlewzHlOU7AmzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=MJvRCvHV; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="MJvRCvHV"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736c277331eso1214162b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1746030552; x=1746635352; darn=vger.kernel.org;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GFOC4sM5/CH4fwuCHLrUzpIazRlQRbLd7/G/i93FgIw=;
        b=MJvRCvHVFKRCK2J9qzxUI9YQOZ5vQsTZTtI+4dzuvLOKru4mNhjLgLqWg7yfZaFCh/
         oE8u7WSCpVg+zaTwGWBhtm3Sc2ARTdfN7tSehpECzFLESgdVJPNcc5rmTLxiYkwMWFtn
         rdVxRdnRJfmaUa4NTMSYEFLb94vp/IOXH87zD0epTs0w3gVl+62FYG4IrrEp+4WjLEHY
         wX6+t5M9UCYj7XLmc0EdXr+M3wE5WPU6ECFhQUyzUDJyKrC9mdV96CVkkh5OZA3ig32p
         ZPRBacUaKCdmPqQ5Eh82/aRJo3Agg0tS+GKgZiXr6TqXknNkptRBYYPINvK4Vtzc2Oe9
         bQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746030552; x=1746635352;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GFOC4sM5/CH4fwuCHLrUzpIazRlQRbLd7/G/i93FgIw=;
        b=hVlr6lFE63RajxgIbRBTlNP7SiLUJG6TwM/DKWFW6B+3mo0mEuTHA9kMmK0cy1/Q+b
         QakWEKUIJx+ol4t1t/s4mblfHWTlf5rAabsCJB2CnpqPa6rJ3VNPSdP+YTG0jc4ZPjMr
         YdTbkCYbiFDyuE6N1MLfCKqkp2cH2xwRwh73ylhgmzoCqNpCtTJGXQIq8rQOA/gx2KVs
         j3kAaR5oa/0CsoEXCZ1CvaaA0PHpMQdyoPfYMRcZRldvT3277CbqHSEymUz7UYev6Hu/
         f2nLVKUelVO+IUOY5YrypqZVslig4d7QETzrI7hk5awf4w9mX6IbrJnpourUMkpx/UXq
         ADcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNMzxXp9gcdkcVDvgmYlIfgcoj00Uh0z2TVIfwnkwQIK+XvYmwzJTEMrsGC/QCNgXBqmkmJ5+j5RgIdww=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbeSG+BSZwO2v0QnDVIEC0bTwMZcLJKh1EFzdada9zMjrZFAoO
	lkA8RSnDtQmtGdTPeVdqGbOdjKCOsGmARjPxB+MYf0nyL4CW2Qu0it+zjyPDV4o=
X-Gm-Gg: ASbGnctyE1HD9U5qAWx5yG6wX5KJ33/OXURraPPEZbfbuJ4OcKdFx7kt6Z5mnVloKuy
	rhnd3aOzr46nHysQKGlfoaWXnR7RMGhgBhlGr97WudaM5zRIZDSBe3FfEZgQqAUlL5rffOVxbUY
	fGmaiKZ0sl5XwoRpR2Jp1eHB538wLHs6k/VxwCXkCr17EeLeZ35OBsMwK4XCWeJ1AHVExupO/Et
	NaiaaS1c71Y3Xj5uXrcWb+8vjWopRB4C92QpWp5pccnYckwHyIV0cYkt+hlPLJuXrmtZGFZeiM6
	0EgbVe8dOGyuKdtW4BocIT5wqEXrDh/NUb8oLA==
X-Google-Smtp-Source: AGHT+IExcv1noClcSuOpJP7nbUZjzGDa8bluXkLE8YWpSh0gFLO9pEFgcrLD3V9H/3+JCHX18NNokQ==
X-Received: by 2002:a05:6a20:2585:b0:1e1:a449:ff71 with SMTP id adf61e73a8af0-20b9688ad53mr178074637.1.1746030552553;
        Wed, 30 Apr 2025 09:29:12 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740415497a1sm865577b3a.116.2025.04.30.09.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 09:29:12 -0700 (PDT)
Date: Wed, 30 Apr 2025 09:29:12 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Apr 2025 09:25:26 PDT (-0700)
Subject:     Re: [PATCH v2 3/4] Kbuild: Create intermediate vmlinux build with relocations preserved
In-Reply-To: <20250430-bronze-unsuited-3f47ce46d8d2@spud>
CC: ardb+git@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
  x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, masahiroy@kernel.org, mingo@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-66039f92-bd1a-4314-a728-3fa8db3f3e58@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Wed, 30 Apr 2025 09:03:56 PDT (-0700), Conor Dooley wrote:
> +CC Palmer
>
> On Tue, Mar 11, 2025 at 12:06:20PM +0100, Ard Biesheuvel wrote:
>> From: Ard Biesheuvel <ardb@kernel.org>
>> 
>> The imperative paradigm used to build vmlinux, extract some info from it
>> or perform some checks on it, and subsequently modify it again goes
>> against the declarative paradigm that is usually employed for defining
>> make rules.
>> 
>> In particular, the Makefile.postlink files that consume their input via
>> an output rule result in some dodgy logic in the decompressor makefiles
>> for RISC-V and x86, given that the vmlinux.relocs input file needed to
>> generate the arch-specific relocation tables may not exist or be out of
>> date, but cannot be constructed using the ordinary Make dependency based
>> rules, because the info needs to be extracted while vmlinux is in its
>> ephemeral, non-stripped form.
>> 
>> So instead, for architectures that require the static relocations that
>> are emitted into vmlinux when passing --emit-relocs to the linker, and
>> are subsequently stripped out again, introduce an intermediate vmlinux
>> target called vmlinux.unstripped, and organize the reset of the build
>> logic accordingly:
>> 
>> - vmlinux.unstripped is created only once, and not updated again
>> - build rules under arch/*/boot can depend on vmlinux.unstripped without
>>   running the risk of the data disappearing or being out of date
>> - the final vmlinux generated by the build is not bloated with static
>>   relocations that are never needed again after the build completes.
>> 
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>
> Delayed report since I have been slacking on my testing, but looks like
> this has broken boot for me on riscv (mpfs-icicle-kit), no output after
> "Starting kernel", defconfig should be:
> https://raw.githubusercontent.com/ConchuOD/riscv-env/refs/heads/dev/conf/defconfig
> Toolchain is llvm 16. LMK if there's some salient info missing.

Thanks for tracking this down. It's not manifesting on my end, but we 
talked this morning about this maybe being some config-specific issue.  
I'm also on LLVM 18.

I'm going to start poking around with the configs...

>
> Cheers,
> Conor.
