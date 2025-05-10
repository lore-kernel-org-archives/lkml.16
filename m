Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0804212F94
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 13:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746885294; cv=none; b=rjGiH0I/ao4q3o0ykLTLpgCj2d2on6UAHvGfTdp8UheQmI+gCP07hV3ZrzNUi+XFSM7EAJ6xxsAYusQR4tvkyaVvbKecRhDAlre6pXPpfl8FFPztCe4aIis8AcyS6KahOlg1FzcNn5xmKpeX7Ar9v4xT1RXNqJyizPJXzYvggOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746885294; c=relaxed/simple;
	bh=tew+OYjJ5cRuTPrgY5OlKkHhrAih9UXuCeDccAztix8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hL3I34Kr/rk/GMXap7Fdmey//I5Y0FnWM8jHFXMxKlemlVdUrTYUqedv6QcrWSytvYzJ4nM2/Vhu1b8gmdrKCXM6Q1tESZMAh+D87mc9MQi3+NVzOIwc6GirgO+SK3I/Flrjd2XqaDnQS04XXgNGJvgbPpDAnFgILdqG88cW0/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ed8ZRe4+; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ed8ZRe4+"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a0b9625735so1496874f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 06:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746885291; x=1747490091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjBPZ3Dx0YY0ztC7lpM0G2cZI/G3ZsQmJznRB+o2OEw=;
        b=Ed8ZRe4+/FK0/pdbgUMeHLmQRy4dJcji2I+fVMi2WQy0iw6NTprUOxIW405/nE/o0l
         5/KyigURVK6Yu9T/2PxSuMqDs0oMkssHy3l+OmyIiTMjoPuVEey/6YxCOpI+jO9LO8SR
         iD9bWDmU16KgjK4hR9Rn6X29XVRFyxQvB/SRHFpvIvkkiuW3zs0XB/J6AYSWID96M/IE
         8Qa8K1q0FlsRY7WgsEnsn5C6FABWwM2cNfyUdjp0dnPGDLmYR4Nnalai+DTJdY/GPZA6
         C+igHaXcDgoUJ4DMcZpKv8cYP5HoNuf5mzsWbTKq/oPWDu4psUmSgDU91vmwPfVNbiPT
         HfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746885291; x=1747490091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BjBPZ3Dx0YY0ztC7lpM0G2cZI/G3ZsQmJznRB+o2OEw=;
        b=lN7oUTl9UvoB3yTtvfL7XSTHbGgklCZpmUyn1d6T/fQ8TCdjXJPXRdltLO/4/7jn3x
         s/seFZOD6B+8B5MXeOIhEevMrpyPqcSCnqNd98eQiDppCW/PHC4kp2uPMejlUjgSJ2AK
         xN6IIuZEB+Q3S49TFFHb0fLa8lNhylCi4ocR3/+e3u35H/xdo1gQbZ4gJRbLf4YHpYKt
         mWae1jyH2ycEq5fDfxQg3VGwDpqF9fdjDvEDrwVnWsssCvbDbaXEQ0H00UnL3hjxbAhx
         TKeSfVqJvsjZ4BNOunM73v2qEBjZL0GSlhD+KQ+Eid+Vda48J1GTZnkJJKGNfNJMbm3r
         hSpw==
X-Gm-Message-State: AOJu0YxBu0nq9wNepL0IX/3vmJDRfyAL0j1l/nMSW4LPFAqnTa6noNHq
	A40ooDTTR3+a+6ZTym2YQMq6XllTFSj8frBQQBebguAmLxGtzV5S
X-Gm-Gg: ASbGncv8KNlgb4YTBIcIziklUmJcZCjd13tWxQn3+99acgcBy/WW/rjKHgsnsLs5h77
	eq3iiW2+QMIFtMP84vU7xeh2ANyisGnQVCaLpWC9uFb784yl5R+NRruc7VwA0Jjh2XWuz8gOd+J
	xRtWAt6NImcEykB4JEvffTcWIT7O8RIpA0LpipLXssgQ/HSjOgNB2BRBJ8X3uiIhKzi+KvVtG8s
	9dtrE6MD5TbjOeeUVajYOlkk+wKiGkXLZ/4tvhOe06Ohw3Z5ITG9Jm48mfflnfdGcxcmjFuaGRT
	N6SIL6nBiubI6zA/lZbQYOaH5tjs1fKT8tI/ZfpjzjqUTeC6MpstD5V3CpqycSfgFKjBx0fXd4T
	HNQNnkE1YbbG2UQ==
X-Google-Smtp-Source: AGHT+IHyhIYCaq1wsdSJlvlYOTzk+T0PRtflOw27eVEMnhZlvP5XqVbge6zQ91TY7pzQxh2U8XY0qw==
X-Received: by 2002:a5d:4fc7:0:b0:39c:1257:dbaa with SMTP id ffacd0b85a97d-3a1f64b5a66mr4754793f8f.58.1746885291084;
        Sat, 10 May 2025 06:54:51 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2961sm6429607f8f.45.2025.05.10.06.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 06:54:50 -0700 (PDT)
Date: Sat, 10 May 2025 14:54:49 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, Ard Biesheuvel
 <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [RFC PATCH 2/3] x86/boot: Set __pgtable_l5_enabled correctly
 before calling into C code
Message-ID: <20250510145449.4117af82@pumpkin>
In-Reply-To: <20250506154532.1281909-7-ardb+git@google.com>
References: <20250506154532.1281909-5-ardb+git@google.com>
	<20250506154532.1281909-7-ardb+git@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  6 May 2025 17:45:35 +0200
Ard Biesheuvel <ardb+git@google.com> wrote:

> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Ensure that __pgtable_l5_enabled() is set to its permanent value before
> calling into any C code that may manipulate page tables or reference any
> global variable or object that may be dimensioned differently based on
> whether 5-level paging is in use.
...
>  #ifdef CONFIG_X86_5LEVEL
> -/* __pgtable_l5_enabled needs to be in .data to avoid being cleared along with .bss */
> -unsigned int __section(".data") __pgtable_l5_enabled;
> +unsigned int __pgtable_l5_enabled = 1;
> +
> +/* These need to be in .data to avoid being cleared along with .bss */
>  unsigned int __section(".data") pgdir_shift = 39;
>  unsigned int __section(".data") ptrs_per_p4d = 1;

Is that comment (and the section assignment) relevant given that they
are initialised non-zero?

I'd guess that __pgtable_l5_enabled was getting set before .bss was cleared?

	David
