Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24902192EB
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 22:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747346823; cv=none; b=ePYf6RDpCgolomiIFGok6hUJUHT+U4+HBtyOtE6F4QY/t4QBbufdFiVJC7fEf1/CjCFsgW2tQa8AodXI0EI1PKIEgCsM7ggWg63edrZqEtjr5cbvBAZSrSjG82EBoi45CHPvdRdbFo/UeXDIGF67llv/32eD374UYXyIgrIj/+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747346823; c=relaxed/simple;
	bh=VOcjrs308B52KT52vs0HhqeVrWy1UWSL98594xsdx2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jnHegwd+fPRVTCY0cvr1pzAxbwxD3BpPGlS+eaTjvOlj/EcuKcoOJmRHUgaPdZAp88G6piUWlbet1lqWKCLwl+oMFc+DQPq0PFznAlL2bOZwyGI5kXwG+b6T2BbnG9QKVc3e6BEp64VdNDnMO5QWAaLeNxA3UZ61CUj2zgFhAsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=e8AmbK4j; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="e8AmbK4j"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5fd0d383b32so2400268a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1747346818; x=1747951618; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qhGwuGRW61usYD00HViI9ouZ/RQSyG12rMjq3gQRknY=;
        b=e8AmbK4jTG8yLMdRreaJLMRFzQQiW/sThiRUDyixI93VdOed/emfNZ4gJsGgWccDQR
         xiR2aaGGHqq5zirbxq7FMYY2pexZgsuejdWI8vki1ShmfaaIQjVp0cdvPSzAtn0lc5ui
         sN//8gJvhAj42tS3eUDUYUyfm28gYh1SfyjNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747346818; x=1747951618;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhGwuGRW61usYD00HViI9ouZ/RQSyG12rMjq3gQRknY=;
        b=Y5u3MRq1TyF3OXx0RMPRA+7GfUXq3wtN4GcxkB89W8132AYB3TqPxBAgYDlF17zQXz
         nv+Gm64elkwp6U6r7X8ipUGntWGv1uKwdiAEzlkJAxZ/aog1SHxI1yp5mlJNYogUTbkt
         UnRv+Av35NVhPQHmauxGmjhreCO73dr6mZUYyv8zghBcxvEBSB9JxIvFNgy/RNccGLVi
         u3gJbBy1TI5pRAmYLUyEX1Osq/prXWAxiAZT7tfa5RAKe5QSXNKEeSw1cf8DUiAEGn1S
         9nOIfwoGS4ZhlyTuBX32b/V97gaQommOJedOAyFg9xOOyKE/SIwIGF8I67VWnSe+/Lj2
         WHsg==
X-Forwarded-Encrypted: i=1; AJvYcCWCEuwtK5HydXJg6w7+ZYhJ/QDBFluMBpKEOvR8FDIx2Azp+4cFIL3U4sAchGgVFu+nrBFEuAxjjpRs5hY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmkFhTN5U5UOfy3kNT8k4GQNX1ycih6P0DTCIVLRs/ncu7v1Hh
	MG3x9AydksgSXNGzC3ruego9tT67dtZviLcdPFHxesL4b+tJC3e9Y3S144Sb95TFSRl4veStMKC
	73rnojTs=
X-Gm-Gg: ASbGncv6aOG95AoR9C/qxUpnmRBcM5DgQ1dp5/jmpflGEO+/MmGZefRKkKfaNVOF7sr
	5D9bbQExNNy/K+QaoLenYhGISbe8r7jZ1p/MIzDPnRiqVcJz5kun59K3r7CjOCkVBwTSx1bu40w
	Qc11eS35Kd5Tjsi2avgs0diJMrmqRLImDweXtU9Ru+MNzrc/8ds5dvy+c+muMMlyuuHiIluXXUN
	C7/qngQ3xIkWUuyjec5AnNf12fOC6LEAV7ghqVzum4SCl2LuNugYK339IJubDTzpE2A/DLr7tmj
	E0ehle3UNM6091E9c5BOEo7wLaERi61t/PWRJYMoHZi2hHKomqG+NllF3m2D9nkXvr4zk07PiYM
	MgFTbDET2gsS/sOq54HvnvWbh/A==
X-Google-Smtp-Source: AGHT+IFgoFKMfs7Fm1smak9uUz62lV2HvEu3d/CaQKBQy9F6qY9IndawmouRBHrbuCrpY1C6ls+9gQ==
X-Received: by 2002:a05:6402:1d4c:b0:5ff:7175:a6f6 with SMTP id 4fb4d7f45d1cf-600900f54eamr819686a12.19.1747346818571;
        Thu, 15 May 2025 15:06:58 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d502adbsm367705a12.27.2025.05.15.15.06.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 15:06:57 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5fbfa0a7d2cso2383568a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:06:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU84CYwsMiWvyooMR7ZA6Dch2XNcUQQQ/07IS77gqLiVrUhQxMRyX7f9+htspOa/+cV5ZGhVaJpIirvD+0=@vger.kernel.org
X-Received: by 2002:a05:6402:35d1:b0:5ff:b5f9:c646 with SMTP id
 4fb4d7f45d1cf-600900a5281mr695948a12.1.1747346817439; Thu, 15 May 2025
 15:06:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <feb98a0f-8d17-495c-b556-b4fe19446d5d@zytor.com>
 <CAHk-=wi7sLm+zHUkyFO8V6QNghLQn0yiWsHfm8WU=V15K7K07Q@mail.gmail.com> <425880dd-e694-4428-999e-a787a666de5f@zytor.com>
In-Reply-To: <425880dd-e694-4428-999e-a787a666de5f@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 15 May 2025 15:06:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=whivBr0xME3h1Po9aJK8FE-+EhmL11ojT6hSLioGr4okw@mail.gmail.com>
X-Gm-Features: AX0GCFsqqthU2uUT1mopyAu0bi9uStWBYXDmLmZRvLj9PURyJOI3EnXwFtx9NyA
Message-ID: <CAHk-=whivBr0xME3h1Po9aJK8FE-+EhmL11ojT6hSLioGr4okw@mail.gmail.com>
Subject: Re: Metalanguage for the Linux UAPI
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>, 
	libc-alpha@sourceware.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 May 2025 at 14:42, H. Peter Anvin <hpa@zytor.com> wrote:
>
> Building it on top of sparse might still very well be The Right Thing.

You can look at the 'ctags.c' file in the sparse code, it basically
does a lot of this kind of thing: it parses the file, then walks
through all the symbols and #defines that it found.

It then obviously prints out filenames and line numbers rather than
converting the result into something else, so I'm not claiming it's
useful as-is, but from a "how to parse a file and walk the symbols it
declares" standpoint it does almost everything.

I just tested, and it looks like it hates the kernel headers because
it hasn't been updated to understand about the bitwise type and dies
with a

    builtin:0:0: error: unknown symbol __le16 namespace:0 type:13

but when I just made it not die it seems to actually do its thing, and
knows about how sparse considers preprocessor symbols to be symbols
just like C symbols are, just in a different namespace.

Obviously for things like ioctl numbers, you'd need to then make it
also actually *evaluate* the #define etc after you list them. You
could do that in sparse itself, or you could do it by just creating a
list of #define's from within sparse, and then have a separate pass
that evaluates their values. That 'ctags' thing doesn't do any of
that, of course.

              Linus
