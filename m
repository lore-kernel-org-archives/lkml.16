Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAC714658D
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747835432; cv=none; b=pWRACIhbzl/3D09L4CRXQSA0495MF1JC7w2KY6lf+TDvH+oHnYtBHVLWwESgJkFWqXb/m/8HXFBeXQj43A4z/OzePYsK8RvWNy7aDNSCKHL4a1tV5zhABPWP/4ezD5t4RApdgqnZXliDnmzBN52f/FNQl2Fz5EDgpQpTjwLKnvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747835432; c=relaxed/simple;
	bh=5WNVFez13gkrFCGaq+9jGVGNf+OVB17HWFv54cA6Nvg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=n90W44eC1lQk6hV/+1sRrQG2NhohYbocRdyFogfhfppCbRkZlV2yw9RHGLsOHFHYwrdG08rWRmrXjivK9XBdSOGlzvYcaIgJwaTwDssMMH4Zo5p413gq1ZFghM74eGo/KA5KuzpmZHYudA2x0mPIoYUcAezE9I9SIQrAGAIfrqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=q897Bi6+; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="q897Bi6+"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c58974ed57so726658585a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747835430; x=1748440230; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SHPu/rR9OhvHMhtOpQJoGCEYJPkS0HuUBXWSeViBZYw=;
        b=q897Bi6+2vLhS5wJ7Y1NSmZut+cCfOl1vtxEtz9QOULLg2EfAg6TQQ79yvrhH+h0Rb
         x8RgrbUSiVn4cA+QdAg8jDJmPfZTF7vBIGxbI2sRHfA9S6I7eVEFUTJbAKUwIrs2x5U8
         DiGSqoUN8XuGWcLKWQzEGOl+jPH66kJYX78DLDPcKd51E1x+0ZkIepOXSQ+VQJqr9cNX
         tH0qO7W5vj38cm2P2s9rpMWpL44nxd3rU9aCg+hFqMzuz6lQ6yu62qLja/lHHIQWz4aG
         GAt9FUviMFDHFhKFsBMY5/OkOS+BaWbNvlZe2rwpPAAZgz4C8Q/v7Tz7sQPPbB2qOkHZ
         5A3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747835430; x=1748440230;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SHPu/rR9OhvHMhtOpQJoGCEYJPkS0HuUBXWSeViBZYw=;
        b=tL4lvzOwGPJIWtgAQOFPNglBuT5RApqlxB713/F7pTQM3gTH3aLqSArttBRsgCrU1w
         LrvEMA9NtPnhM1Cvfeox6/dcrgFSSKhejy7QrCj1iZ6teU089MFd7fR3V2598NID3VOF
         2NeALn5PmzMIhniKwVfzAekwpOCZh67uXaQWr9tsf1gtO1WjbAt6NIilevhCiq7wn2An
         4n+lX8i+P5KxdTnU1CMe3mYlSFc0fmq4jdmFzkTDU+3z+LKIDLxY7+54blsiDmDMi1Ge
         7/Swr6YLek0pUvEURLhdhbYz+zbOGc1AbCTRvk+1Q7Zkq3ToPSDRCfSlrn+FY09b1eFc
         PTYA==
X-Forwarded-Encrypted: i=1; AJvYcCXfgQ/mEZmxMBuxzKb4opNIo77V2/PauRNufU2dKUb9lEUqXg/rvh1Zvy/8dfEf/SC0dkITH4C32PLTiN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhnETY64KtRtDokPQEFlqxuUy/KC553NawYTLqfG8/13WIQQw/
	vwjBvRMCAQQCeJ3w5SqcoYA1fGNbmeUfgDD77Y7U5ws86xQGJbbDnivFRFN5CuCqv48=
X-Gm-Gg: ASbGnctpYOlIdW9TMaVgh5o3WnFzaNDguN6Qj6Z0n7/sIwcFPIlzvUJlzsX+/cNZTpV
	Q8Ob25dqHIyHEeV2pfAILHFJ2q6w2v/SHhfvO2zjxLQmaNFYeYnh5Mem4ynf/QzM++8SVezryLK
	+DxnsXsXRbnUbhPr/I86NDyESjL4Yjetmr+FT+w6KpEvCUcwIiH8xWujON50Low4xaCD/GVcik0
	9Ko/u+sBcPejTwqDv/lJkvbOiF6ptD4a9Xw7GjCPWyaFj44Z95+QbLO/SANVJ+VvWt1Q3wmGqpa
	L+JbSvt2T6rBdyrRZ8mCTs78dI2d68V1WLk6dqn1EwTa3JXqic4M1Kf2rzB6ybiak+yizZpPSUn
	ak2ahb9J0vmy/Kw==
X-Google-Smtp-Source: AGHT+IERkKLn+onsDUJYfu3kDKklFMU9iqW5ZYQW4MKYANoCD5x2BBsG9GwZxjudRD44nWhn/7F33A==
X-Received: by 2002:a05:620a:c4a:b0:7ce:c600:b5e1 with SMTP id af79cd13be357-7cec600b71amr897648385a.11.1747835429795;
        Wed, 21 May 2025 06:50:29 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468cc8eesm874244585a.106.2025.05.21.06.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:50:29 -0700 (PDT)
Date: Wed, 21 May 2025 09:50:28 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 next 3/4] lib: Add mul_u64_add_u64_div_u64() and
 mul_u64_u64_div_u64_roundup()
In-Reply-To: <20250521135246.7dab6bda@pumpkin>
Message-ID: <403s8q39-33sp-pp3s-95o8-14s190or25o5@onlyvoer.pbz>
References: <20250518133848.5811-1-david.laight.linux@gmail.com> <20250518133848.5811-4-david.laight.linux@gmail.com> <321rs9r7-8858-p195-263n-49q78q8rn25o@onlyvoer.pbz> <20250520223700.2ec735fd@pumpkin> <148nop5q-s958-n0q4-66r8-o91ns4pnr4on@onlyvoer.pbz>
 <20250521135246.7dab6bda@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 May 2025, David Laight wrote:

> On Tue, 20 May 2025 18:24:58 -0400 (EDT)
> Nicolas Pitre <npitre@baylibre.com> wrote:
> 
> > On Tue, 20 May 2025, David Laight wrote:
> > 
> > > On Mon, 19 May 2025 23:03:21 -0400 (EDT)
> > > Nicolas Pitre <npitre@baylibre.com> wrote:
> > >   
> ...
> > > > Here you should do:
> > > > 
> > > > 	if (ilog2(a) + ilog2(b) <= 62) {
> > > > 		u64 ab = a * b;
> > > > 		u64 abc = ab + c;
> > > > 		if (ab <= abc)
> > > > 			return div64_u64(abc, d);
> > > > 	}
> > > > 
> > > > This is cheap and won't unconditionally discard the faster path when c != 0;  
> > > 
> > > That isn't really cheap.
> > > ilog2() is likely to be a similar cost to a multiply
> > > (my brain remembers them both as 'latency 3' on x86).  
> > 
> > I'm not discussing the ilog2() usage though. I'm just against limiting 
> > the test to !c. My suggestion is about supporting all values of c.
> 
> I've had further thoughts on that test.
> Most (but not all - and I've forgotten which) 64bit cpu have a 64x64=>128
> multiple and support u128.

Looks like X86-64, ARM64 and RV64 have it. That's probably 99% of the market.

> So the 'multiply in parts' code is mostly for 32bit.

Exact.

> That means that the 'a * b' for the call to div64_u64() has to be three
> 32x32=>64 multiplies with all the extra 'add' and 'adc $0' to generate
> a correct 64bit result.

4 multiplies to be precise.

> This is (well should be) much the same as the multiply coded in the
> function - except it is generated by the compiler itself.

I don't follow you here. What is the same as what?

> The only parts it can ignore are the those that set 'z' and 'y_hi'.
> If my clock sequence (in the other email) is correct it saves 3 of 10
> clocks - so test to avoid the multiply has to be better than that.
> That probably means the only worthwhile check is for a and b being 32bit
> so a single multiply can be used.

Depends how costly the ilog2 is. On ARM the clz instruction is about 1 
cycle. If you need to figure out the MSB manually then it might be best 
to skip those ilog2's.

> The generated code for 32bit x86 isn't as good as one might hope.
> partially due to only having 7 (6 if %bp is a stack frame) registers.
> clang makes a reasonable job of it, gcc doesn't.
> There is already a mul_u32_u32() wrapper in arch/x86/include/asm/div64.h.
> There needs to be a similar add_u64_u32() (contains add %s,%d_lo, adc $0,%d_hi).
> Without them gcc spills a lot of values to stack - including constant zeros.

I mainly looked at ARM32 and both gcc and clang do a good job here. ARM 
registers are plentiful of course.

> I might add those and use them in v3 (which I need to send anyway).
> They'll match what my 'pending' faster code does.
> 
> 	David
> 
> 
