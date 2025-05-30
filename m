Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2116220E32F;
	Fri, 30 May 2025 21:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748638894; cv=none; b=qTzgkDrpO/+BnPrAdqRidut66uG6Qd0z/GQWFjFgIU6km965s3htQ6SzgumIX0PuTA0xjj2mtfxM/795RPP7GZPUX3kPoyfHHPzdlrdVJsonbNuZuymzMYEYAXhTFRc67fxzq8rCasxRJcUpygJC2XLouO8gJQcyn/6WB2y1b+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748638894; c=relaxed/simple;
	bh=d4IfK2ka6jjEmZXTXqL1lPng2l65qiPmf5r7IC9XgXE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=t8C6st8oa1rW+DMQ1M2WHR78eva0db3DbbhgVX+PmRjuole5IQ5OgaghYPPvMvdguzkrLjjmGxe3/1N1F0zfXLfR3kp/Tx/3nI28kdjDZelLNMcNGgCR46zhGuUg10Gjs8opFSbVmvwqGnAuYMcndYoLuiylDCR0BJdpwlCharQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RG6pfkL0; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RG6pfkL0"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so2290230f8f.0;
        Fri, 30 May 2025 14:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748638891; x=1749243691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rOiB56y4MoyS/CzvCmU15wdJwiiHxlOhTBulQb1MiCk=;
        b=RG6pfkL0tzE8LQhmdPuNSpy0rAHFcZ+EXxf4SAAswFnW68Dbn9867OQGu1lAhwwPEW
         DrEfgPI4oVkUniB/qALagP0/1/mp/sxovsbSK2K66WfxkI+b+CoHc3TRqyj38XWDMuL7
         U7IRfgIod2xX6DIFIQDUNeozTTLrGag0AxR0NigywuuD9W1IeFmlEpH5nI4mk4eHt9cg
         rVmA07iS0ybu1+N0k/KFmZKTUNKl8zToZetI7GVpJglc1oNhehTLrpuUa46bs0sejrMD
         9aEYWlFSlA5hlXEcstd6WqUaGVkIG9bTobHSfAN1IndqeKrEIh0Kg0EUkhxkKZY+fbWG
         GXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748638891; x=1749243691;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rOiB56y4MoyS/CzvCmU15wdJwiiHxlOhTBulQb1MiCk=;
        b=as+BZwRY+vvyueOOQWGYo8zp54ZH3iOgyYivw13B0/ebTLvf+TOg47DjCdpkTFs/0k
         w7jFNGICscQRzhzIS2zxwwfUFzepcF4ZgUuFwb248GWoArjeS/5aLGHVTc52wHSiGq81
         wDlKwyrkjuyoYC16k9icdXJFXxhCVwjuFoLpjf0IpjtmCsev1QCiUFaCZZHIZiK+08DV
         EjvNpcmVaZlS7D8J7gUrUlMI6BItOkRbShVUvCbqrVfd8BBabdPgwE6T8irTdXq+Bkh+
         Bfj8obh5aqryePiiQ2Ab8GfapkYMor0PVooVVeEBtCahKX/YJitRCpuC0JH+VE1hFCcm
         YA6w==
X-Forwarded-Encrypted: i=1; AJvYcCUa6ik4/pkiuiCP6LsN3tAUdWsTzhIjcZKEXfV6ZjkgXYtiBTrCRyutuyvdwk9R0omTN2NNtxetjosQZs0Y2yQ=@vger.kernel.org, AJvYcCWDWK3a/HBCwwBpsnrX/vKdp0UIpgX/JBCoOB1DeYdJMV8KaFxO9akSsMr1a/AYVu4r/DynUe5iDGmCWYs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa2YxuRo0VdqCM/eKwRm5TqLnp492vinCPxnesdN2D9o717nC7
	5eXdUwrGQPNRYsNl5xHB22OkWODZLrBzOGesSexKVUr4zmfMGGmEx0iE
X-Gm-Gg: ASbGncsGxqpCYc5JAy4EQtda6WS8uDoACBuyREfIMEjVeLmThY+kLvB56vxioon3pMh
	TCiYkFshldJHpOpBqhIaXLw8BorYBbKfKUDTLaSBtts3s1paGCulNYP139VYh2DPOJs3Qeytlh+
	K5W0PGITxr/5G9Q8/lA6LtQAqmMS4PtnwXaejezVVedmAjdd4z+LsrON8ZSpTMK7NietkZOA84w
	/N7GKXSYpJ0FjIt9ycamBTSju6StNAXlpNc7w7LNtAC/hbvlLS+luAF5VG4kzpeNLesvI7UzEuX
	M1vd0h/RAkufxoSSbFiXjcEHMmRPlW5Wa3JzsxAj7x37NBROCe4tfDHuDnofQ1Db
X-Google-Smtp-Source: AGHT+IELYtMr8G86T/WDXfoL8a0eG5NyCgP5oG+4rgfVuvLxB0Ejdrd4sfjXgfEArS/dX/IBihHZVA==
X-Received: by 2002:a05:6000:2890:b0:3a4:eb43:6003 with SMTP id ffacd0b85a97d-3a4f79e9846mr3851759f8f.29.1748638891290;
        Fri, 30 May 2025 14:01:31 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:cd68::171c? ([2001:871:22a:cd68::171c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00a13fasm5797576f8f.98.2025.05.30.14.01.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 14:01:31 -0700 (PDT)
Message-ID: <013f62b1-c015-4382-89ba-2104892a2b96@gmail.com>
Date: Fri, 30 May 2025 23:01:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] rust: add UnsafePinned type
From: Christian Schrefl <chrisi.schrefl@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Sky <sky@sky9.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
References: <20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com>
 <20250511-rust_unsafe_pinned-v4-1-a86c32e47e3d@gmail.com>
 <CANiq72n0EcibX3Vx95tiPEkd04DA4hjY-TJQs9YSOmHj=VZ_5g@mail.gmail.com>
 <0dfe6958-1dc8-4e36-aab8-e83a6da4d0e0@gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <0dfe6958-1dc8-4e36-aab8-e83a6da4d0e0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.05.25 10:22 PM, Christian Schrefl wrote:
> On 20.05.25 11:26 PM, Miguel Ojeda wrote:
>> On Sun, May 11, 2025 at 8:21 PM Christian Schrefl
>> <chrisi.schrefl@gmail.com> wrote:
>>>
>>> Signed-off-by: Sky <sky@sky9.dev>
>>
>> Apologies for not noticing this earlier...
>>
>> Since this is a Signed-off-by, the DCO applies, and it requires that
>> the name is a "known identity":
>>
>>     https://docs.kernel.org/process/submitting-patches.html#developer-s-certificate-of-origin-1-1
>>
>> Sky: is that name one you use to sign paperwork etc.? If so, that is
>> fine (and apologies in that case!) -- please let me know. If not,
>> please feel free to ping me in private if needed.
> 
> Since it seems like Sky has not responded for 10 days
> is should be fine to just drop their COB & SOB.
> 
> I only offered to add it since the upstream implementation
> that this is based on was entirely done by them.
> 
> If you want to wait for some more time that's fine as well.

It might also make sense to wait for this PR [0]
and use the new code as the basis for the kernel
implementation, since that will change `UnsafePinned`
to include `UnsafeCell` semantics.

[0]: https://github.com/rust-lang/rust/pull/140638

> 
> Cheers
> Christian

