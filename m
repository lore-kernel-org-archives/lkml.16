Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFB32512E0
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 19:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745954022; cv=none; b=Y2aZAqGzFRcF000L8+IlKCADRc97qA2yA2ukg/eshNLyHP2H7jBUba47A8BOT/QmcLAWaZLqD+oxDyEqtSiQTCZZeqr1SC4uhgzzsmWXD0KOuvaGnbhCCo6VYkjaMjymEaKWZ/s3tY9FZ9lOasAeyKHa5Wtg9rB7Je1QwSH5x1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745954022; c=relaxed/simple;
	bh=W5BjTJvpi56tIchaIMYEA2MR+Hh2oP0PYOBJlpni960=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LXZj76EEG0PVHn8y9b+k5J0SXGduFR4ELCNQsXcYxpAD+SGjQVGYeH0OK+/SIgPxRqFp6adOHSgYtBeQWEDMArpLuBD3Rx9TqDWtJY51uvJnQ1G3rj6bGYx/rR5WLOSSWGaPo7vvtVQuCkJWHi/8wdHZmaH8oylPsSdSGBp4di8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=Zh0uZ3/8; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Zh0uZ3/8"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39c1efc4577so3579596f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745954019; x=1746558819; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UX6tO0/f8tzM35VSZEpfCuQP+GztRd/ihEJf8UXpFmQ=;
        b=Zh0uZ3/8opsF5LBvD8KMDupP74FiHsBy/ujsTl1BvI3iZ99fh7MOjyOWZwqFq+15Lr
         b3LDIThshOM8WkwdjqC9bn2o0+y4EhRxFGXupgmRMUH1QhhiqqSCod8R3aMmqp2Dgujl
         zDTfBKxGpIG4GzkjjYvhCoYDbm9Zt7t3u6vrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745954019; x=1746558819;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UX6tO0/f8tzM35VSZEpfCuQP+GztRd/ihEJf8UXpFmQ=;
        b=Sj6ZJpzpyqDzR5TU/NkzD71txQVsaRQib/Qi4eOwF3fVTjgpGDepEpPA8JrFlZ/my8
         +KgoZPs5b2QIxXua//iI4qTHihvbMaPmOAI9fn3ldKdaEcWRk1J8i6lH42FtGCgfYiRo
         EonuVKWGSOEyssaw8ymL2Eeb1Vp7Cgg8ROd4qg55g41nfqb+8dQMTIQuD/qrOOldQpW8
         6DD0BSmhiNxVOA6xAum1nGog9NaRifbIx/D3JsU8zZ51jN2aRiGrwVu2SarN0KdTM/om
         TKm0NgKwrlr4x1s6/DlRCwjoRknuunmfpMHPXLdiibX28hZGRl5vywP+TZsxYsZzEJrE
         ESPA==
X-Forwarded-Encrypted: i=1; AJvYcCVowM45duNfPevUTyLLAj7vRhUA0iev6g9Osv+VMi85b6eWCCIzJ+frd7myS6dgB5bJ7w9UqkLLCYwLcHc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuXYelpXJttWmCByvJdPfEKGHu2F2Vb99ufqt1IXkKIO0pquDY
	YHtepUiihxdwN0TInF/aih5dQWxugekWoDV1XLOuXJcFKLFTWE6M4wxbkQeESME=
X-Gm-Gg: ASbGncsIAGDv/Bdf/gIoWJDTik9v8Sm+xXDe5x9IhKlyrELuPVWhvRHW//svnHXdLu0
	nJYGYxWPplcU6foNcAGGnA+uH5VHx0YHNLUPbc/+FrLEHfqRz0FpRzjc+pG+z9Aq5Fc/DM/BiKi
	DOmL/KY22jQchXsWuHFcvGBrQ7gb727ksAnvNX3W5ZnDrHlZ0gWG2FMmMkZxUnNt98llJ+GhWiN
	XZ4GIJZLNHzUHKodY1zMcfFzauFmKGt3IDnyvF8XSNtVBYTbMg/vQq3DJzK3iDdQmjvH+r9zqRE
	I/Dp53LNx6iBREnAAOPVt4YeJ8VJewMxHpgmU7jyZ6sf/dFnR+o5L/S4kG7WvBEd1u+ZdLowcv6
	bAFoKlg==
X-Google-Smtp-Source: AGHT+IHx8NsqmGZdCp+0xXgpqGC9ZFTWYMoD2+M6VSNKH0/6Nh2g1o/zmEoF1Kr5VT2M349EDM3B0A==
X-Received: by 2002:a05:6000:1446:b0:397:5de8:6937 with SMTP id ffacd0b85a97d-3a08f7c9a56mr417279f8f.41.1745954019072;
        Tue, 29 Apr 2025 12:13:39 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cbf030sm14702049f8f.46.2025.04.29.12.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 12:13:38 -0700 (PDT)
Message-ID: <81ed8b53-1a40-4777-ab87-4f4abe032dbc@citrix.com>
Date: Tue, 29 Apr 2025 20:13:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bitops/32: Convert variable_ffs() and fls() zero-case
 handling to C
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
 Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250425141740.734030-1-arnd@kernel.org>
 <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>
 <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
 <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
 <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com>
 <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
 <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com>
 <CAHk-=wgJfWfWa2NTiTmev+Xr=e8Uo=aFkrXujLAQBVAVN-VigQ@mail.gmail.com>
 <B364FF6D-DFCC-42A7-ACA1-6A74E27EE57E@zytor.com>
 <67be5eee-b67b-409a-8309-829f891b9944@citrix.com>
 <916BD58C-E6A7-495E-9A60-722E130AC7A7@zytor.com>
 <e5e97ff8-9670-40d1-a0fa-69504d34c4c4@citrix.com>
 <956DB0ED-F3DB-456D-8D06-6F40DBDB815A@zytor.com>
 <06d04c13-76e8-45fb-a563-e365e1f19362@citrix.com>
 <CAHk-=wig1E4B-e1_6=it1LfVQ64DJsVgO6f6Ytnbzm2qChbAdw@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CAHk-=wig1E4B-e1_6=it1LfVQ64DJsVgO6f6Ytnbzm2qChbAdw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/04/2025 7:05 pm, Linus Torvalds wrote:
> On Tue, 29 Apr 2025 at 07:38, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> I tried that.  (The thread started as a question around
>> __builtin_constant_p() but did grow to cover __builtin_ffs().)
> Maybe we could do something like
>
>    #define ffs(x) \
>         (statically_true((x) != 0) ? __ffs(x)+1 : __builtin_ffs(x))
>
> which uses our "statically_true()" helper that is actually fairly good
> at the whole "let the compiler tell us that it knows that value cannot
> be zero"
>
> I didn't check what code that generated, but I've seen gcc do well on
> that statically_true() thing in the past.
>
> Then we can just remove our current variable_ffs() thing entirely,
> because we now depend on our (good) __ffs() and the builtin being
> "good enough" for the bad case.

That would improve code generation for 32bit, but generally regress 64bit.

Preloading the destination register with -1 is better than the CMOV form
emitted by the builtin; BSF's habit of conditionally not writing the
destination register *is* a CMOV of sorts.


When I cleaned this up in Xen, there were several factors where I
thought improvements could be made.

Having both ffs() and __ffs(), where the latter is undefined in a common
case, is a trap waiting for an unwary programmer.  I have no particular
love for ffs() being off-by-one from normal, but is well defined for all
inputs.

Also, leaving the constant folding to the arch-optimised form means that
it often gets forgotten.  Therefore, I rearranged everything to have
this be common:

static always_inline attr_const unsigned int ffs(unsigned int x)
{
    if ( __builtin_constant_p(x) )
        return __builtin_ffs(x);

#ifdef arch_ffs
    return arch_ffs(x);
#else
    return generic_ffsl(x);
#endif
}

with most architectures implementing arch_ffs as:

#define arch_ffs(x) ((x) ? 1 + __builtin_ctz(x) : 0)

and x86 as:

static always_inline unsigned int arch_ffs(unsigned int x)
{
    unsigned int r;

    if ( __builtin_constant_p(x > 0) && x > 0 )
    {
        /*
         * A common code pattern is:
         *
         *     while ( bits )
         *     {
         *         bit = ffs(bits);
         *         ...
         *
         * and the optimiser really can work with the knowledge of x being
         * non-zero without knowing it's exact value, in which case we don't
         * need to compensate for BSF's corner cases.  Otherwise...
         */
        asm ( "bsf %[val], %[res]"
              : [res] "=r" (r)
              : [val] "rm" (x) );
    }
    else
    {
        /*
         * ... the AMD manual states that BSF won't modify the destination
         * register if x=0.  The Intel manual states that the result is
         * undefined, but the architects have said that the register is
         * written back with it's old value (zero extended as normal).
         */
        asm ( "bsf %[val], %[res]"
              : [res] "=r" (r)
              : [val] "rm" (x), "[res]" (-1) );
    }

    return r + 1;
}
#define arch_ffs arch_ffs

and finally, providing compatibility for the other forms as:

#define __ffs(x) (ffs(x) - 1)


The end result is fewer APIs to implement in arch-specific code, and the
removal of undefined behaviour.

That said, I don't envy anyone wanting to try and untangle this in
Linux, even if consensus were to agree on it as an approach.

~Andrew
