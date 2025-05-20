Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADF225B1D8
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 18:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747765730; cv=none; b=qfJNMNDFAQwnvLVFO2o+5xgBcpbxjTbMCHkIecCCB6RTaNNTjXOhzhmmIqvJCbuHGA/NAlMaLqQSjvwRjZLrWiF0tv0aJc1eb35Jhfwosc5qSc0kUMOwNDQopWxCZw/q/coLEFfCrsSpgzscaibazDXkhHi+uIXsK3bjPwEHw9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747765730; c=relaxed/simple;
	bh=zeB46xGsrjZ7JRG5Aj0J31/1Fuw08jBiwz2TGCaTHJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H5lnJMXcaAU/sn3SYy8TU8vREm3IguzeUAJ3kCmHuX5MTFbvrYbljnRveNbmKNqBWSz+CAA9gWaLzQs76NANk9RAJ/vw5trc8sKs2+ero09S1cZ+Sp1JWdY5l+Ii3DzJ4YwozYDHsJyAU4vcMeWnm0PD9A3Ildfg5jv/R3xg7Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dUxF+ldl; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dUxF+ldl"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6021b8b2c5fso1368008a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1747765726; x=1748370526; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fQbIdXejFm38skr3lFeOE2v9r10+iL7vwnfvDB5rB6A=;
        b=dUxF+ldl0nkI21hU3wpcL7IHe1lvaPnKMKZnMS4lJsFpCuC8j/X9HG9W5MarJLYlMH
         PTyLEiZsxdUL+m4v/Vw3clpPADx9PNyDjwk7b6lKFw74zlm/+K3TZCERswClQw5qX3Mw
         gkZN8XpkOCD8MCZoIkF1ibbRq2R1zrzkD3KJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747765726; x=1748370526;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQbIdXejFm38skr3lFeOE2v9r10+iL7vwnfvDB5rB6A=;
        b=Sg7YaT7S2g0dhVKbW6c7ICpWkMCwZ3UYQ4A6cfe1R/w7R9cxj2O+QFcD8n9C6uR7ge
         Za3BWT/hzPzznTn/TXXs9wFlK/NiHInIXGSRg60sPkwrpmsRL8QpZFC9pfyNu8vhLE+1
         r+PbN0+SR0D8n9K6JvZlgSflCRnRTszcJhcdauP4NM57hoi3ON8lZ+Z8dgOLvZFTjTTP
         Jb/3pLV6rAvlmsZmQJx0UbWyOB7PY92ls902gLXzsmjcgkxAtmmElR0NfVI9qG4YIjdX
         Mrxkfr2MKzWaJpmui8VEi4fnfXXDTjL3EnA5opf8kEaXuDHO0vvxe8i9ym9jpfY8BS11
         5+ow==
X-Forwarded-Encrypted: i=1; AJvYcCVqNOtC+gkdFwDo4aTzSk5H6W9paWZ280fpC07oT0h2COXq5+rEETBnx3QTlggV9wquDUwKRvV09wvrofI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIXjFkfVV6Ifw85QXKgP74QGg8TiEt18tGfp6cIVl78EvDORGv
	m0Xbl0oe0BuAE4UBF45qpoQalDz2X6ar5LIWLGKzz3T+36921HKhwjmtqRzyfVdqrCEN4RXDE4a
	gCsvEGXw=
X-Gm-Gg: ASbGncsPqG6tnSpSO+ocmGiVnkQxBsVQfSsSv9fRgX2MU/N7FLunj3aEf+ekDlwo2Rc
	hPbJzrMyIonmyDoT9tKcmxRklcy3LE0YLVJ5OcXBdEr+6/neXg9vas3VO9LkVlTI76xw0Sepj9b
	bikEK3pHxLZAMUlAqdo1vaCS2iuJKOjFhB05tlpszS232/3pqyDl90yIJNPZ6JYp1sy0crAotSP
	5h53HnEdNB/qkUnaDdXFSYAjdz9cuGswQHCveQPNaplpF0crsLxtCv/RGWgrzokETXR1jktUNv9
	b+9ONUGDiYFMRfSqGmTevuqXBpM8GTE6czcuc7JAY8L+AmJltbsdQzEPFbwK/udyDahC9ep47RT
	t+trK95T9ghGT9ghQOU8wzrZvmw==
X-Google-Smtp-Source: AGHT+IG1sh9x/aownzCoMBEarI68102aTsmH6pdCK5+Wo7ysRUAQKPX2xBP1B+/wUiLHAp/Xz9WlKg==
X-Received: by 2002:a05:6402:13cf:b0:601:fcc7:44fa with SMTP id 4fb4d7f45d1cf-601fcc74949mr6091315a12.30.1747765726402;
        Tue, 20 May 2025 11:28:46 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d501f7asm7523454a12.19.2025.05.20.11.28.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 11:28:45 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ace94273f0dso1016239466b.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:28:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVoIe5gUfyTbGf4mgxSvJ3hF2JbFZOPjqiuk8XVR9u/OZeINiYSagcfHO05EbnmB1xNZ2bVOrH2iPDHKcM=@vger.kernel.org
X-Received: by 2002:a17:907:1c11:b0:ad2:48f4:5969 with SMTP id
 a640c23a62f3a-ad52d53e79emr1673656266b.28.1747765724806; Tue, 20 May 2025
 11:28:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520104138.2734372-9-ardb+git@google.com> <20250520104138.2734372-11-ardb+git@google.com>
 <awmpxjln22i5zmnv3wcwhzvpbbjqmhiw3onmpq66owbtdoujs5@f336cwpvlasn>
 <CAMj1kXE+2P6_y0SnmtmD=J42pe67itnr5jQs6NxjMTvV7HHp0A@mail.gmail.com>
 <20250520143532.GMaCyTNJqH_T2LR8q5@fat_crate.local> <CAMj1kXFxRZWsML_5FZvZjwOPO8cvsAwDqvX1686bqqfqkD_PHg@mail.gmail.com>
 <20250520173825.GOaCy-Eekk661c94ne@fat_crate.local> <CAMj1kXHpFK+=1gdo11Msw9w6gh2f-4gnSCkyA5kaB_x4mafS5A@mail.gmail.com>
 <20250520180101.GPaCzDXW2MlArU71xe@fat_crate.local>
In-Reply-To: <20250520180101.GPaCzDXW2MlArU71xe@fat_crate.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 20 May 2025 11:28:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=whdFESwxUMvyMGuXzpCA6cm0d5kAc57fGWkWs0DLEi9qw@mail.gmail.com>
X-Gm-Features: AX0GCFvx55pH6JB6fdIpvtVTiryF5OzpJ0KhFwXnhgyf_9vqtDfdEgXeIu5p8K8
Message-ID: <CAHk-=whdFESwxUMvyMGuXzpCA6cm0d5kAc57fGWkWs0DLEi9qw@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] x86/mm: Use a single cache hot per-CPU variable to
 record pgdir_shift
To: Borislav Petkov <bp@alien8.de>
Cc: Ard Biesheuvel <ardb@kernel.org>, "Kirill A. Shutemov" <kirill@shutemov.name>, 
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>, Brian Gerst <brgerst@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 May 2025 at 11:01, Borislav Petkov <bp@alien8.de> wrote:
>
> OMG. :-)
>
> # 32 "./arch/x86/include/asm/pgtable_64_types.h" 1
>         movb %gs:__pgdir_shift(%rip), %al       #, pfo_val__
> # 0 "" 2
> # ./arch/x86/include/asm/pgtable.h:1178:        if (!pgtable_l5_enabled())
> #NO_APP
>         testb   $1, %al #, pfo_val__

That's garbage.

Gcc should be able to turn it into just a

        testb $1,%gs:__pgdir_shift(%rip)

What happens if pgtable_l5_enabled() is made to use  __raw_cpu_read()?
With a compiler that is new enough to support USE_X86_SEG_SUPPORT?

Oh, and it looks like we messed up __raw_cpu_read_stable(), because
that *always* uses the inline asm, so it doesn't allow the compiler to
just DTRT and do things like the above.

                Linus
