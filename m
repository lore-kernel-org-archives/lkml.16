Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4AF26AD9
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 01:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746149720; cv=none; b=hvIZE21UE4dfi2U97T4NpNAEEbGP5TklNYJIdcHoKnxIfYaZdqE85M9zu0S6RwSG3nobACWvsYg71bTpxnFXucKVmkItTX26CxUwPerI3IDLVY2kfYWns2YWmHPjB9ZyQF3WJ8fxRZbZy547pA2emcW93CyjXzFoyPJGt8cYECg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746149720; c=relaxed/simple;
	bh=0As8xmw9EhCI8l9UThvyG5mZVKiCmUiyNh+yysJrxBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eHQ7v1okrE+V9CnDU7yqRbgfOoiCMCuAuNcUzWZxN33kTbPXZ0kReQ90GOaSeXKXJXvSheuBvEwmVy/VpMz9w0YKAtQ0nccg8pTQL8X4RfF/ugU6F9mgk0fnxHhZf3GXi2aLhWXNucZ5mtsIgN3e90cnWBh+2U44MiKCI0Sm0GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SPprT+1n; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SPprT+1n"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso2187156a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 18:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746149716; x=1746754516; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=97MRcwlNgiaSiCPIOhEJ8niynAiuZuA+VUyMszsZ0b0=;
        b=SPprT+1nFQ67fCpBtccCG0ezIC35XPVenOv47cyWL9UlhZCiEimwZxGyirEa1bosTv
         HopzMfWDPB6cRJF4iA0xDZmbTQJxBVwhDCR2i4KNNGmC2ubug6/2gzVBy6hosWrFnSTz
         Cp0Ieax/SA3Uzs648PAVJeVcM2HB2B5TGAXhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746149716; x=1746754516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97MRcwlNgiaSiCPIOhEJ8niynAiuZuA+VUyMszsZ0b0=;
        b=CSpOQhOQ8EDcbmb5sL0tzLS8gun0Xehm6IsQJoQyuWcs4cFyK/8gICt3iUIGHDK+Cr
         N19e0tlbeDfZpmNAPKbprYr5d0MoFM1wjoCaez1Ii7yAugwWGO9r8ALH8KY0pc7VzI4z
         W9RAfI+EVZ7inZL1nhwspNzFWuP95uzZuJVn0Gj0cYpB68lGbluBzjgdB+qVHHxYiqYW
         qFCYItnCZXe9F5jE0BKJLWEBudlzEidVZ+p7YO8rOd1FoDIGWDZ8wKOb9hwnVvko9vQm
         iQwAmd5fnjY7bTldnKUpHpvvymKqR3bsRG8bFqNsJB4DtaVIrGVjsRyClfAGsyI54yHq
         qrXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7xcmbyNast48D2WIFoxJP7G2paGam4Cp6vJouIFmaEyr3EfvkJDEKIlUf9uKdJ8jRaSKxY84wJX4YE2I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD1092HipCab6H10KghpLSOuH5dn4jxQKe+5mvdkLvd8WlSy6f
	1dq8UazQv6soQbqEzRQVEdLgvWF+lP3ueRKQ4SAEdTujqaLbHOCZeK5FP8w6CyjNdnclodo3UTS
	zFUo=
X-Gm-Gg: ASbGncuRHW8MSRHiBxQSnjA9T8Y1y44laFTrkGp9oCUZ0XNRiuGkVCr5NCLznAZq5qx
	CxS99Gebhfg785MN6Fd9tSrZ46aQxLzrKEHaKCiJ3VXFfkjv/e6pppYT03ga31xWg19GLvZxcnn
	5ZEUg2YtQY9f7FSVa85B1zTuDl4gwmVfPsqnyTQP35EpeCcIQPBJ0gO2Jx+csnRwlSsNNDhqaE4
	IqafSRgOmQpvG8NS9CFxhyPJ76U3OWKYwFStm5Txn04IMuXcyvxYiAwCZF+ehYS1kYvppe/zGpk
	uLyUZDN5M8K9UCLftUJMsJqmVXlfx3JyQED8KJpFX+ixky/svx8OS1hiqhJtr0sAtBOF9DNTcHP
	Pvry1GW8kPhZ65Iw=
X-Google-Smtp-Source: AGHT+IELPXnB9lKlBasOGUFYnlU512vWCF7LFI9g4JPofD0di8E6S9eBu2VHK600elfod/82/D0xkw==
X-Received: by 2002:a05:6402:1e89:b0:5de:c9d0:6742 with SMTP id 4fb4d7f45d1cf-5fa78017633mr534470a12.9.1746149716572;
        Thu, 01 May 2025 18:35:16 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777561d3sm423826a12.16.2025.05.01.18.35.14
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 18:35:15 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso2236604a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 18:35:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXllsnaztabxFEeUjw2Y65iurgMHA9aybWDm7/xUfL6GqawEnAe4ZX13N/9fPGTrRjqaUj/Eus9a3/UfYo=@vger.kernel.org
X-Received: by 2002:a05:6402:3806:b0:5f4:35c4:a935 with SMTP id
 4fb4d7f45d1cf-5fa788ade3emr571279a12.21.1746149713941; Thu, 01 May 2025
 18:35:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-default-const-init-clang-v1-0-3d2c6c185dbb@kernel.org>
 <20250501-default-const-init-clang-v1-2-3d2c6c185dbb@kernel.org>
 <CAHk-=whL8rmneKbrXpccouEN1LYDtEX3L6xTr20rkn7O_XT4uw@mail.gmail.com> <20250502012449.GA1744689@ax162>
In-Reply-To: <20250502012449.GA1744689@ax162>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 1 May 2025 18:34:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wif4eOpn3YaUXMKUhSrF1t-2ABasBiBRXR2Mxm059yXqQ@mail.gmail.com>
X-Gm-Features: ATxdqUH6AO9B4IM6TzOpfLne5kIG1EGNzVEfwRIWeNnmYRyNorzVe6ZE38sDwtI
Message-ID: <CAHk-=wif4eOpn3YaUXMKUhSrF1t-2ABasBiBRXR2Mxm059yXqQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] include/linux/typecheck.h: Zero initialize dummy variables
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
	stable@vger.kernel.org, Linux Kernel Functional Testing <lkft@linaro.org>, 
	Marcus Seyfarth <m.seyfarth@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 May 2025 at 18:24, Nathan Chancellor <nathan@kernel.org> wrote:
>
> but '= {0}' appears to work: https://godbolt.org/z/x7eae5vex
>
> If using that instead upsets sparse still, then I can just abandon this
> change and update the other patch to disable -Wdefault-const-init-unsafe
> altogether (

The "= { 0 }" form makes sparse unhappy for a different reason:

       void *a = { 0 };

makes sparse (correctly) complain about the use of '0' for 'NULL'.

    warning: Using plain integer as NULL pointer

and gcc has also finally adopted that warning for braindamage:

    warning: zero as null pointer constant [-Wzero-as-null-pointer-constant]

although it's not on by default (and apparently we've never enabled it
for the kernel - although we really should).

sparse has complained about this since day one, because I personally
find the "plain 0 as NULL" to be a complete BS mistake in the language
(that came from avoiding a keyword, not from some "design" reason),
and while it took C++ people three decades to figure that out, in the
end they did indeed figure it out.

In case anybody wonders why '0' is so broken for NULL, think stdarg.

But also think "Christ people, it's fundamental type safety!!%^%!!"

           Linus
