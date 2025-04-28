Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C58B38F9C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745856910; cv=none; b=OgbTWsjNIgPo0sc1RJjHlW7QDuh7oTbbUQmt8/YGe9/2IncSsFO0Pb8VKj0VX2wTL07FYvMv4VkV1HVI0FqODfM1v4xogY0FjmpRvHFOv9Rm9YlUZGBnHmI8LRSwjWiu3qYO/svXBPbGOtOFVRo/MeW9+7smw0a2Jukg4fIOdO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745856910; c=relaxed/simple;
	bh=/4WEADGTxXovLUfxXrmVaoT+Q6fIuK56MLUUKJPFAjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q81Km0l0alnyJnxPbcqP6pD8UlufHU43mQtmlSVC0sRYsh9xyZVJZJKQJDbPzrN2UetzxNTFabZKiESrR5sagA5gVYOZxbfWc2qsVAOEiR/B+lErjSfDO0A7hTv2IZ9XJyc7gSRiSRio0NNWbkFkMJxKaXB20Sn74wjxyYmWcp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=AB8FvPfl; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AB8FvPfl"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f7ec0e4978so2937227a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745856904; x=1746461704; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AF1KZ463/zoTgYMZNz+2yImgi273kMcd/qUiFYdEgdw=;
        b=AB8FvPflIefKb4fL/CCTg2yen599XuseYDIvL24wGvpmoXmCdZsRh57X8LrdExcZzC
         RJEXbdV4FKOChooE5yFYpECTYQmONxaCrkHJvj9n7p/onna9pNEtH85jFeDeGz6Yu406
         bddesp4NWMrU7yKr0MxSQQXEE4fkh3k/iXsTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745856904; x=1746461704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AF1KZ463/zoTgYMZNz+2yImgi273kMcd/qUiFYdEgdw=;
        b=La4IWqt3yoHrgoNV5l0oPSQV+HzKZvoF16WVudyfUd8auPXUPyPkn9jNrFvGDj5sJo
         1zR4NVro8oH2SK5GLKrdBlN/wbiw6D6fcm6i98OeUq9b+uKEI8s5k3A7bhcTtlBrqT5Q
         CvRFk+hjb1GKq7Vfc0N1alaopt2dD4Zwf55TSoAQ89IijcoTX7QXBrJexjMg/tSYHuu4
         O5oqviornrf1YxH+WEkMyePnTv/XbSbGdHzCebaN/kUOlS+v3OkjCWAxLMjQ9AmUPQzv
         JI+H6wUHGNtIyMXmp7e0PK+cfgUWgUhmrLzWjhd16p/lTTYLFavey8tdUwZG0l+MeXGK
         FJGg==
X-Forwarded-Encrypted: i=1; AJvYcCUbJhl70/3CZeuPElMv5CNRGQZDsJaSp5nhhFNFOEBqlTX12NZThamz1DP+YpNErs8NVCSOrR2WGqiy4Lc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ReFZWOqESemKz+9pUfAh6vBhYu/7CMGxmd9b4p2Qf79Ab64Q
	mBjzYTO3GQZ9ApcraZ7LapPcYUmZLed3PsWuy5sUcYnfq2Qti2nSY8ca6pqA3cpVftlOKPYLMci
	J+NY=
X-Gm-Gg: ASbGnct8XxfrJp4btETsbVvZdyu94INijNJTS5jm2p7GIZRrmo5dXC/BcV++L4J2TbG
	dxR8bmbks4g5dfeqO+SmMKehz8tYvu5gJEveYmzY+y97MeBqCvs34QTB6VUiOA0t8tDwXBWouNm
	BuTTKMrULOiLScbvQVFz/MosixNknDkzme/KTlRe5y0b/PCRMU4WD5yuzAlEWT7Fx+AwIUjDLxP
	NOwMxlSbFz2Bt8804IlGP0rx/KEDUj8dER2qUJC++bj29Yz6GCpHYcaTN+4xBHwI3+dK9f8+gLO
	vQ0T3iIJ9v+kkfMItgLJ8T/yaY9D5upzjQzUxYZaZ4rGqWAmiyGvetUAB84d+foAdHnanhNvS/r
	aRvdP+bdOCk+s3ik=
X-Google-Smtp-Source: AGHT+IFKr+/5Xy/dZyVHTc57VeQB1s3rG/G2NO/ekVGy5QmeC/05Dq5mNAffCjT6WC4S3zDnX9tAfw==
X-Received: by 2002:a05:6402:35cd:b0:5f6:c5e3:faab with SMTP id 4fb4d7f45d1cf-5f722672a7emr10016015a12.1.1745856904551;
        Mon, 28 Apr 2025 09:15:04 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f70383296esm6036364a12.69.2025.04.28.09.15.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 09:15:04 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ace98258d4dso331180566b.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:15:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXMWrFSiYQlWSCS/567CKOUKRbq8IfsJogtMBqSLYvdoYxqGcCyCvR+xMRcuFIeavJ86rngKFPAJnbbVAY=@vger.kernel.org
X-Received: by 2002:a17:906:9fd1:b0:ace:3a3d:7e35 with SMTP id
 a640c23a62f3a-ace713deef8mr1136725066b.53.1745856902085; Mon, 28 Apr 2025
 09:15:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com> <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
 <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
 <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com> <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
 <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com>
In-Reply-To: <aA8oqKUaFU-0wb-D@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Apr 2025 09:14:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgJfWfWa2NTiTmev+Xr=e8Uo=aFkrXujLAQBVAVN-VigQ@mail.gmail.com>
X-Gm-Features: ATxdqUGS9kvWc-L4SzJnxgACgdDJk4h_LSvRVKtfYkcRU-1jXGpVN9caYxF5bEk
Message-ID: <CAHk-=wgJfWfWa2NTiTmev+Xr=e8Uo=aFkrXujLAQBVAVN-VigQ@mail.gmail.com>
Subject: Re: [PATCH] bitops/32: Convert variable_ffs() and fls() zero-case
 handling to C
To: Ingo Molnar <mingo@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Arnd Bergmann <arnd@arndb.de>, 
	Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>, 
	Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Apr 2025 at 00:05, Ingo Molnar <mingo@kernel.org> wrote:
>
> And once we remove 486, I think we can do the optimization below to
> just assume the output doesn't get clobbered by BS*L in the zero-case,
> right?

We probably can't, because who knows what "Pentium" CPU's are out there.

Or even if Pentium really does get it right. I doubt we have any
developers with an original Pentium around.

So just leave the "we don't know what the CPU result is for zero"
unless we get some kind of official confirmation.

          Linus
