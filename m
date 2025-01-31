Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546531CAA99;
	Fri, 31 Jan 2025 15:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738337654; cv=none; b=uLZ7L5A8cK2ruH3bmJCHduRg6D4TLXn7smQfuhqVtIfG35+gvZpKlIu6tH+PtRAkAM+hVZy2ZcLUmmBU81KFAfCF9bWOyJeJjg4xDqEJ94vm1MM5e3RIRB11L5wAX2RvdNtoDRaoBQ9z/xSMt4/vgWuJNkaDd1kQcYiQ8BCtko8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738337654; c=relaxed/simple;
	bh=re3wYPEzIKzslBfJmiyCrhALnqaCwpgJEAYE5GfLpHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xs5kOfpDXvbRBPWRJPGNSm38KoLiBTZd0qdASRpS75zOMJgfhBaEG3FYxY0TJITaHAs+zaomwrmosWHY2FNtFAGvSO7bkeikEbGPKysL/sUWKeBStT/fnMIqa5DczALU8wPJLb7OhTAhB5hNoPxTJPeCced5iOUY/jvfV8OPgmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifq/oeAr; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifq/oeAr"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so1405840f8f.0;
        Fri, 31 Jan 2025 07:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738337650; x=1738942450; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YlN3hvL9n56nyWua3u4fzIOe7QsEs4Hpzyubxj9K5cE=;
        b=ifq/oeArDNmFclBhP8TqmCrbAgGZa4LUvkQMZQYbGIuE8hWXMQavRqNw6EfZvFna2m
         4R231sFVR68rf+OtNDsSfGf5gzElHv2z6rywAm1e7K3noJ+IKnNGvZv60IItzGmoljhK
         aEA4B3QcUMiabRNduoi8xqpj1bFnKxKfE2TB3/T90kwsGSyKL/5V0onujaeIPaRrElE7
         AQB0xbFKoNw8wWZVEZgdynvAYY31K9YZCxXRv6Rrulkw7ZXX/puRu/yoohkYTdprtldF
         iLG/ZoVUwB4kJicWinbfMMh6KC997chQTYJDtt/fUETRJP7qBZ0jExJHt2sBgzvcx/Nx
         SiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738337650; x=1738942450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YlN3hvL9n56nyWua3u4fzIOe7QsEs4Hpzyubxj9K5cE=;
        b=OvVHqQQMaMH3e7SQ6dYNJd4V5VOtUykhB/JxrWpCTUshYWUjeBTpepo0rMpokGRysu
         yQ4fgdjh+jEhmWHFpirRjUsJqqBIrz1zUxAidzys/BSCAAL0bKhEJgljAk6FWLOSj+2Y
         xKAktD69j1CnzmUHlfGKTlLh6Y3AMVNyAO/Jmv8tYN9+ap4BLPJxu1ECrodorQvcu9YY
         P/DjbTQ3CDuzEhMnrz7T2eJew1yGCgq1dm+2V1fCm5/VHJXk7OFax9bbUwhAcp7CTvH/
         pv+mk6Xs+dEKdb+XGBQC9Q1Www1h7JvjI07TeYTzIL2UqKUBPnj56UxcQnsGrDa68Z2g
         70tg==
X-Forwarded-Encrypted: i=1; AJvYcCU6KggvAv2xtEIbZDsu+h3swl7UMiETLeHxl0l4jx3g1Wzjm8/cSKF3Jt7tN7/IKD6MKMD1X/E7rpg=@vger.kernel.org, AJvYcCUOZ+bGZFkYacIobAwkIkUvSbPFh4Kv3lAA9W1xejyqbYsHLIv0fv4GfqwHOF0fcOdBNZn0CMQoAKxNm6+l@vger.kernel.org
X-Gm-Message-State: AOJu0YyGOLFE5WRbRPe2HoBI5XiZfiTQ+nVuHe9sSgmNE1ud7skNkXYd
	3EH1tdYlX5LALMtInZWy8uL78Bec7Akb7ZmAqoLuKVLmWHaFszW1
X-Gm-Gg: ASbGnctIgrHbqGsR8RlqBEJqVXvx/T5z4c8eOZBs6DAaIuw4afPNU0hUYg9iZXPmFeP
	xrYDE5ORXLuUBDUfxXojMwCA6LyXtXxb2ABwMVN+b8HnRJYtSsBKlo6Mp1HOm5N6lc5HaO9actr
	oOxKKz8YOmy1fhG/z4Tm6cJmYcVvOXjVsafE/rhcbvoXea6CCqlVY1+zOrTnJxp63uzFphrEzaI
	bEVwMx5Xn6wHObtVqemFc9lOhe4laLaHGiGARkOqbBNop2XYxNVU+Ng1A9vbZ7fm6alThSgbicy
	AFDUFSaiZ7cqgWZ4TWrCr6pnzZxf
X-Google-Smtp-Source: AGHT+IGeZg8pc1dnHI93SS1bPuVQwFVdIXopfhzkJBDwn8qHPECSHOzdEIGLge2i0w0yjCScGHxjxA==
X-Received: by 2002:a05:6000:2ac:b0:38c:5cd0:ecd4 with SMTP id ffacd0b85a97d-38c5cd0f0f5mr5634438f8f.6.1738337650276;
        Fri, 31 Jan 2025 07:34:10 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf555sm4998186f8f.97.2025.01.31.07.34.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 07:34:10 -0800 (PST)
Message-ID: <f8b59f05-55b5-4208-8bdf-b4be8e93bc22@gmail.com>
Date: Fri, 31 Jan 2025 16:34:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>, Rudraksha Gupta <guptarud@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, Geert Stappers <stappers@stappers.nl>,
 Andrew Lunn <andrew@lunn.ch>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
 Sven Van Asbroeck <thesven73@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
 <a83b0149-7055-411b-ba86-d227919c7c32@app.fastmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <a83b0149-7055-411b-ba86-d227919c7c32@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 31.01.25 8:40 AM, Arnd Bergmann wrote:
> On Thu, Jan 23, 2025, at 23:40, Christian Schrefl wrote:
>> This commit allows building ARMv7 kernels with Rust support.
>>
>> The rust core library expects some __eabi_... functions
>> that are not implemented in the kernel.
>> Those functions are some float operations and __aeabi_uldivmod.
>> For now those are implemented with define_panicking_intrinsics!.
> 
> I see you are doing this part the same as the other architectures,
> but I don't see why it's done like this in the first place:
> 
> In C code, we really want to get a link failure rather than a
> runtime error in order to catch those bugs as early as possible
> and fix them before even trying to run the kernel. Is there a
> reason this doesn't work in rust, or is there a plan to change
> this later when the existing callers of those functions have
> been fixed?

I agree having a linker error instead of a runtime panic would
be ideal, but it is currently impossible to build without these
intrinsics.

To fix this Rust would have to provide a way to build the core
library without float support. I don't know if there is a plan
already to allow this.

> 
> 202397be76d8037b531b34dee16c7dfcfd0124ef..3375c91e698c024f95a85682f5a91d9815c355e5 
>> 100644
>> --- a/arch/arm/Kconfig
>> +++ b/arch/arm/Kconfig
>> @@ -130,6 +130,7 @@ config ARM
>>  	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
>>  	select HAVE_REGS_AND_STACK_ACCESS_API
>>  	select HAVE_RSEQ
>> +	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7
> 
> The ARMv7 dependency makes sense, but I think it needs
> be disabled on combined v6/v7 kernels, like (CPU_V7 && !CPU_V6 && !CPU_V6K).

That might be correct, I don't know much about the build
system for the kernel. I've tried it and it still builds
with this change.

Also it should probably be relatively easy to support 
armv6 as well.

Cheers
Christian

