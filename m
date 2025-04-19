Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5191DE89C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745075589; cv=none; b=iPTJX/gKOT2ea5stkg8NgoZApmeSdxwO8ENC6nqodirXYtb7l5QGIz+V93ioV6NNMNlNVcuQpMu5TtlI0Wp6GodSFyNxAPfxtoFvaCjiPgdZJ4Ni0NeYqWHW+xVzgfINodQRMrSBzsLEj2zKIHnnaQHKHiW88TRg6AcGir3c+nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745075589; c=relaxed/simple;
	bh=95RxpmpZ0giF/7gyYSSGqss0+oqI6G9c5XkJIKhzNbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L9aPwipiGiI/vXbtz/YjuGlnfc/ewR1YdTY/Ec+H6gbIbSlvWv0DY6hi8b3nojuz8dZz+Y9ygr8ipG1h1Xv29LUJL7gUNKl83CxCQFeWR1vlpo8955Zjrap0SZJUBNBTibTPpmPyMBK4n/gq3SXqtXZMH+uOsEaVrYM/LSLQDEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PoPBDb+G; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PoPBDb+G"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22c50beb0d5so4269565ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 08:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745075587; x=1745680387; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95RxpmpZ0giF/7gyYSSGqss0+oqI6G9c5XkJIKhzNbY=;
        b=PoPBDb+GnFpRj96Z9K+VgIkKRyQqzjUkiqwfIS3DuiPpiXUzQxZLnOQHvaWkldvFw6
         9/nYq7flRHRt54uGnimrgMbFMbl5EVrwd9v9pb7p8WI01KeJnH4hQhpPMTvFeHpTjKQZ
         uypg98jSKoxwp8FpaGcnhJ2KkyDhLAqOJGmBZF+m3zIM8HiReKSjggTUPbvRJuc1ziXx
         eI15hxD4kGGOhrYGfCF9aCYDB6/kbsNUS+MJ/D+RY76QshDDgEgXeFtUtziW29F/VOTg
         1xMnl67ezOSCG5XvtYH40phjunobIeKft/jngckW+zzzRcSOVAo1teYxslOwY0sIojIU
         r6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745075587; x=1745680387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95RxpmpZ0giF/7gyYSSGqss0+oqI6G9c5XkJIKhzNbY=;
        b=ApQvp0Ex1+sgzuo7Ubd3PMXIYexvLpVFlUcnpVq60H7lmok2pK2robdH8oj2XAMUrt
         LufVWUuzy4A9wySIkDG4NNjsZKFv8xHhP9OL3PpbNQxxrW2J4+1A4u3egWFWxPU6lgon
         cezZ3uOjjlXpQWdamGyblLc7/eCqzQ3QsdJ691ndtbfIYrBIDe5yTdzZXvaABoKAKq1+
         9we39qI0kGYANBEBvIYF38jIesrALpSwW1UgfLa1Th6k2Mo/4qpXCtCL2c7hcnfcw0Pr
         hPrkZIhgNq8U+cIcENOcp6lneB3zQ8VPDnsNpSSqSuJjEKnzP0oiqVWH7evZT0Xj3F7e
         PhoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgu+2FIJcWoKZukq1iLJ+rq7aLJCM5Dzqa/FoAXAVY6L/OICtAo27X4DPJmzbbkARA2LTmpdeg2+Ttln4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjTxMDPS0X9itLpDik1kgk7k0d6ZjwGoXVXKlcoimqgiaeZvnE
	Zhsx3AbpyoAoko9rOnVmmLg2EJmZ2VK2shtOMDJsh6K1nl2yZyNp56xjm+TP9ROvHybjzOk4fkW
	1C6sp06MI4R14zuEpg+h10fyKoxg=
X-Gm-Gg: ASbGnctO7l2TJgbd1J9nXbg9JRlCM+YrCNBucR+3qeanc9i0+ssuujAbzox0908ddB9
	EgY8PYUxr2Iuz6MUGBL826b+tsHKiKHKjQz5qNXp+5z2blvoaCjW6zQUAkkRe84aoZdeudEBtFo
	jLmoC3nb3aQWk3Ng2t7GZ4MA==
X-Google-Smtp-Source: AGHT+IEziLt307ihN5LVVyeSbDFr816gjqy53DnGLHHyJOodnymWcmrvNitHbDubfK4aK+vSvo7eL5S3q9JwbdsKoNA=
X-Received: by 2002:a17:902:ebc1:b0:220:cddb:5918 with SMTP id
 d9443c01a7336-22c5369584dmr34839785ad.9.1745075587505; Sat, 19 Apr 2025
 08:13:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319154242.GA3599324@ax162>
In-Reply-To: <20250319154242.GA3599324@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 19 Apr 2025 17:12:54 +0200
X-Gm-Features: ATxdqUHoIooJrqPQXObre4cvfndlLjskZS1LWvvU2Gg-V5rp8n6pzclKvjsos40
Message-ID: <CANiq72=MZrMOmTq4CcTt9U+HHFOMNghOYO-rQ=YYMuWyaDG-9A@mail.gmail.com>
Subject: Re: Prebuilt LLVM 20.1.1 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 4:42=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 20.1.1 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 20.x
> series is no longer supported.

Build-tested with a native defconfig+Rust x86_64 build -- thanks!

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
