Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4CC244664
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745948679; cv=none; b=HAMMdeQzyNx33RNtvovlrkoF/y/mU0zI+7ZqNaSnICitC/87WRAPZxHzMPa5XD3u6tc/yTpsAcvctVwHogwU+DEC0jaPWQBBxtW4C3GAYuL9Pk4eJEzpoqJI7WHdiRpI0u6xrOSPbFi2EmInK1B4SVokNW88Xar+WmNFCsvuKgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745948679; c=relaxed/simple;
	bh=AZSyoS3nQ87t+azxCNy70Sy3taZI5p9+MlltjLGguYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SqjNBhAhfnSwkirc1m8WOASkzsrPbf6wFXZk/5Z0rEKcX3s4vuVSRaqT9noh1fOzGtHWtYZrH0nMyvGu0K/BG/DHg/3GSFxqD6JUmuIFZ0K/ttt3WGI35wWe8pzc1c/+j+HSClkJJXFYm3z6NE1hw5fBbcPBitpN38tJnPFwf3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LHIWVKvf; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LHIWVKvf"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5f5bef591d6so12145507a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745948675; x=1746553475; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VqI4giFijDKwvdPy+fzn8+ohURMxpiNTgKcLiD6rcNc=;
        b=LHIWVKvfozQhmQyrdW5/t5AsAApFsARR6YHtM2l+DnUWUJ1IY3YhXP0ifKrHWVItdf
         CmjROOSR7lR9XCEH0llgJrWjDD9JpoTEJvcczlcQthMRm3YBFr0AEYISCdkllLjuxR8n
         +EhIwZ02eGXKNpb9VoY6HFFEIE7c0UGTjgEIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745948675; x=1746553475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VqI4giFijDKwvdPy+fzn8+ohURMxpiNTgKcLiD6rcNc=;
        b=j8a0xNlBTC+IhN5lP6cFJ+pSLkOoUSZST+QlvLEKEzWgyNmUuO1u5cWKpFwMNsc1HB
         DEIyP0NrPXYZnxxWFkeF792pkhKmfTo5ic6+PoqaPrqKMSgrY2HpIRmUzTl0S+wSIU9F
         DgrBknvnz6bNdse9EFvff2Nkb3MeB0pkdJ9sQ4Mz3vXTHTY5RJN9BN3dJmiYT8dC6hyL
         P/MP1AdRhiZhwzKGy9430trb+G/kaEGqjsBMCXntJ07XY2sNBOwNqsJNgmBIoL5u3Mcs
         n/wtFoFiaKBlc9cmmQ5PShJoO3pl0t0nWN04ZQ9hF+LDvr6cEBjcXlZyLkykW1bPlTie
         0RJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwvR8f79AkroWVvq8Fht3JRyCAUGlBZS1Pol0omvH6UzYsF3dHNv/qutwcNaVodMrwr8V0ieVGxfYoRPM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7/yurbrxe55LiohzRsem6vN6CFmdp1QGRRqfjuh5K/Scgd9Ew
	N7kNg/W+YNA/B18V9JN58xft4ZqCJAXDcGVC0Y1N53NFqWmUgGoIY9EpzA4xD2ZYH0B9pLKvLCZ
	6LEwWEA==
X-Gm-Gg: ASbGnctb/eG4muHw8CNB2o1rhB9Q68/yw3f7MbESXtnXcoI3pOoTUAPvztIc0E6pWPh
	gTpxvpyd9QcYwIujfzKJKoe5+anZ7JGrV0ExLznGareZU0U8OX95W24UY6+iO+yMPrGN7N3sxHl
	2AcAqCSKpLE5w4t5BVfi720h+3HS0vrDr30rvcUdIW01cY/7I8W2GVSdWLM56eq8QCBQdhdV3CL
	lYBe8n8NQ53Wzq/P+H47aIAp+ZSYz7P/07MJk7jJ9wtWbBlk0XCiazYu++E7Xi2/nZ4m2NPeEAj
	k64Ydghj/brtsKLChG7PODCMkA1URemHiMI+3to0F6AEKXhQCROc3av1SPYxhO0JjeoiHnDVWBI
	8lmJUOCZa6DPLBX0=
X-Google-Smtp-Source: AGHT+IF4HHgjKvVqOSAn8k4YQLHxexXU3pRREAo1TdVlWThmUEfKRUeLxK+yO0e6f4e4vzDRY+kewA==
X-Received: by 2002:a05:6402:13c2:b0:5e7:2871:c137 with SMTP id 4fb4d7f45d1cf-5f83afc01fbmr3561663a12.14.1745948675322;
        Tue, 29 Apr 2025 10:44:35 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f48a3sm7673196a12.34.2025.04.29.10.44.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 10:44:34 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-acb39c45b4eso1005758866b.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:44:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1sxFoOAeEn3auJbXTmLd0oHMv2skLauW8I/sYpK/BfpOGg6lFgc2Fm0LAqmxPKeYPMm3ntiT0KYVn9J4=@vger.kernel.org
X-Received: by 2002:a17:906:ef03:b0:ace:cbe0:2d67 with SMTP id
 a640c23a62f3a-acedc766bb3mr29490666b.55.1745948672062; Tue, 29 Apr 2025
 10:44:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231001131620.112484-1-ubizjak@gmail.com> <CAHk-=wg6P8pPg-x4BPUQj-wE0xC7HkGzFk89ftuji8MVo+RRxw@mail.gmail.com>
 <CAFULd4Y+HXuditB51Q0LznqiBsvxJr3BjEYvx4_224XmqrycCw@mail.gmail.com>
 <CAHk-=wh+cfn58XxMLnG6dH+Eb9-2dYfABXJF2FtSZ+vfqVvWzA@mail.gmail.com>
 <CAFULd4Y-gr+UAvi4m1-p4MnJyMv3NRcyH=TFLZfFfNngnE_Kpw@mail.gmail.com>
 <CAHk-=wi4ji10PR35r0FqiKA_XYO38gLbZmPN4SYursP9fiUcXQ@mail.gmail.com> <CAFULd4ZfAjobU45POv0uSB73urVFa0kFX_35RNyHy3rf_kbFjg@mail.gmail.com>
In-Reply-To: <CAFULd4ZfAjobU45POv0uSB73urVFa0kFX_35RNyHy3rf_kbFjg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Apr 2025 10:44:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg=tK1H30dxfBMYvxG87XgM8Jx2Foh43gLULq=k3d7ucA@mail.gmail.com>
X-Gm-Features: ATxdqUFHkWkI-niDdKFIg1ut4XVJcVUvAXNGQro7VQe8aj9RTLzb997l-3EcZkQ
Message-ID: <CAHk-=wg=tK1H30dxfBMYvxG87XgM8Jx2Foh43gLULq=k3d7ucA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] x86/percpu: Use segment qualifiers
To: Uros Bizjak <ubizjak@gmail.com>
Cc: X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@kernel.org>, Nadav Amit <nadav.amit@gmail.com>, 
	Brian Gerst <brgerst@gmail.com>, Denys Vlasenko <dvlasenk@redhat.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Apr 2025 at 10:05, Uros Bizjak <ubizjak@gmail.com> wrote:
>
> True, the generated code due to mentioned HW limitation is then:

Thanks, looks fine to me.

             Linus
