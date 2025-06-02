Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A6322ACF3
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875582; cv=none; b=mD4gjvC5NZUcT6T5JjZyTn6KbtR4i3DGgDadZcCTZ/T004E/QC+OsKqorpYEDZshYec8BmnTc55GI6+PKMo4mgwyPT3zXFr1n/SiYfGH3HY62CqQzCfX2M+eij3vz4xJ2choeYLjbkFA1H5WIRkfLivCE+d9LBHXM5YPu8as57s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875582; c=relaxed/simple;
	bh=BMdmqxyCVbd7fEc++ql37zNwaBo1D8/TV+gOsCFIGWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C3YN3NK0m5VP56aUj3SVFBUBgGowwWnZfQWkVKfJPP2ks9A6RwLTcllMUWKY/0Zy3DEiofCr8tNx5fectTh2aRsdzXrLCWXmz4uBkaHAqw9jwBo6vXuAq4V2qtFLxo88j21mcP3QTSO4AVmOmiGdO4wGM8opX2oKfrFR9NDEf4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SF6yYloj; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SF6yYloj"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-606741e8e7cso1355747a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 07:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748875576; x=1749480376; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cg0dwJvYfbYUNtSY86lpjPZ26U71B5eHF51TBSSqPe4=;
        b=SF6yYlojOixJbBBhIxUACxynoF+Ykc+9DyX65vtQ3Lhl/X5Io8anAasHAL50IOwwDK
         B9gqP9+TGWQDY9+YPCj/dfBj7SeBHS7WCv0NtkeOdlNGO7HcRrUM/muyIMZ64yJWs+f0
         RqtkoZ+a1Tl4xCPOpZpsq+yfgH4mR6xYdK67I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748875576; x=1749480376;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cg0dwJvYfbYUNtSY86lpjPZ26U71B5eHF51TBSSqPe4=;
        b=TZBjTZD0STekxT0CBvdhnZhwaLaMG3Kh5EBdqBcu97BlXnPA5qbUzrUmAF74mvSAAC
         ImdbNYMxi8wiPKicMPgTaTNa3C56/mrzUXsLb7SBHUL6Xbj9C1GdNt3vaSIvygXzxyA5
         S1d76xMM73pSq65TGNA9rGh8MfzyWIH+yf1ksGLB0E6H3mTIHFxQu965D1vC1vRBHDpR
         ynRB46SELdQPKtm6TaejNto7F+wZEmku2/Tu2cbj8vWhacntiYEiuABwPA5WFunjLmHM
         L4HsBWb3j5paP9bIANTvCX0TzWVD7sgENHCPUAC8REW+3Yo8CrxxfcRAH909jMu1LuVY
         yi6A==
X-Forwarded-Encrypted: i=1; AJvYcCUmTGGvuVNfi5uj/zAvAI2NQKYFsd/HvcIBJVxppo+DnTnPiVzxXdBKfgg/SElyM7kRhP31BSBjdUQaFU0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1IVUoKde92c/wNChXuMeriAYIYrnhiaBFe3C0RbIU2KBXAGsB
	77E+kmbopp7DfpVSNdObAPy6d/PXc+dwrfcBXucpi1ILS0lTuPT8ydCfwIlTwsMPUUhvxdY2MeS
	Q9p89+IM=
X-Gm-Gg: ASbGnctNNcQ8macEKSIPh8Ax9MFUqQt1HCV9NfZI2vDCRx8YnzIpoOqSryFgr1O8Lqe
	2Viw3OU8Jel/8TcOkZStQsDJAHNdaqzZDvrXYNgBCk2467rgUR7YQJbGacr089Ynsgw2gFSZW8/
	9ap2feX5zkTusQkr/Ixp5wk4LV1l6mCeWx1HEvBxaUed75Ks22mfSM+N88y3q5vWY9PjrhE7GKy
	mS+58O0VP1wE6KDCzwk3oI/9B6lbu3w4kVaVS0ao9bLTW2vsm25RzXcFJjSoamHebZt++VuLWpy
	2CEeeNNDbCq28Y/swklx2a88L9tnEL8Ur33jpol/tMEcW6E+qldXPiuudwqyEFBOgkb5yGQ7gYA
	6WWVORlYeLUXirrh6/beap1bPqmlAYlofql4w
X-Google-Smtp-Source: AGHT+IHEu2pJOX4iDLLuaeTYMD4ePz/ZYJl4ZGt49UmBbOrrhHRA4xT3ahPrTI7uwEMB6jEFbnMS/A==
X-Received: by 2002:a17:907:930c:b0:ad8:8621:9268 with SMTP id a640c23a62f3a-adb32599e70mr1268282066b.59.1748875576071;
        Mon, 02 Jun 2025 07:46:16 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adb390f09c8sm559429866b.45.2025.06.02.07.46.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 07:46:13 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5fff52493e0so6398959a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 07:46:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUr8UVfAZbJjx4K7+uR0c+3NntE23mnArdy0oiLCbX5LaiewuBTL1WVegnArXsUWKaWfOU8nVmrE8uafpk=@vger.kernel.org
X-Received: by 2002:a05:6402:5205:b0:606:3146:4e85 with SMTP id
 4fb4d7f45d1cf-60631464feemr3563572a12.4.1748875572780; Mon, 02 Jun 2025
 07:46:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428170040.423825-1-ebiggers@kernel.org> <20250428170040.423825-9-ebiggers@kernel.org>
 <20250529110526.6d2959a9.alex.williamson@redhat.com> <20250529173702.GA3840196@google.com>
 <CAHk-=whCp-nMWyLxAot4e6yVMCGANTUCWErGfvmwqNkEfTQ=Sw@mail.gmail.com>
 <20250529211639.GD23614@sol> <CAHk-=wh+H-9649NHK5cayNKn0pmReH41rvG6hWee+oposb3EUg@mail.gmail.com>
 <20250530001858.GD3840196@google.com> <20250601230014.GB1228@sol>
In-Reply-To: <20250601230014.GB1228@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Jun 2025 07:45:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjO+t0FBrg=bHkbnXVsZ_U0TPgT9ZWUzu12-5NurCaWCA@mail.gmail.com>
X-Gm-Features: AX0GCFuodXM8SKmhJCuuDQhW2iq8pjrSnsjy_QXiBCm4TA9D0azfhocKT2KWhmk
Message-ID: <CAHk-=wjO+t0FBrg=bHkbnXVsZ_U0TPgT9ZWUzu12-5NurCaWCA@mail.gmail.com>
Subject: Re: [PATCH v4 08/13] crypto: s390/sha256 - implement library instead
 of shash
To: Eric Biggers <ebiggers@kernel.org>
Cc: Alex Williamson <alex.williamson@redhat.com>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 1 Jun 2025 at 16:00, Eric Biggers <ebiggers@kernel.org> wrote:
>
> I implemented my proposal, for lib/crc first,

Ok, I scanned through that series, and it looks good to me. A clear improvement.

         Linus
