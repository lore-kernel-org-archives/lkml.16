Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72BB1DC98C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745075635; cv=none; b=QJX3h3h8UxwRJn7iTrJE7EX5YU3z/17IKdER2nDVejvutTVnxTAveEdcuUjeN1tCOU3Sk8WG4aAHvZWXX6KRg5jARBkWZuFSsltJc9fMR0ztCsGxY6mqM2CT6kKUxjYJJVxKcG9BvUkIQH6dFbQwFN2NKQ5jk44DusC08+IoLA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745075635; c=relaxed/simple;
	bh=xjS2bMDeIbhC0yshi+jMm+EWIBUbVhlRrjV+NI3C8Ok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nPIqiGaR8h2mJTwAsEc/MwoE3iWWHGbzj0ih9ziWfzrBQbzJ7p4ex6S05A+AH/R3vFvBpYcAgIox5T6GySSTqsyvpU/vSIx+01U7aY8ICVhhS1GhZuuKWTzERP2Lzhlqn4CbC+G8x/UucZBfS7iZFlOe411DN+fdIK1PaazMdYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kpzTYnGS; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kpzTYnGS"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3054e2d13a7so430778a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 08:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745075632; x=1745680432; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjS2bMDeIbhC0yshi+jMm+EWIBUbVhlRrjV+NI3C8Ok=;
        b=kpzTYnGS0xzLL3YNVHpuqvEX2hs4Rfh20o/CechMBhTbaFRn50mHNsDzbYJm19DIXq
         pEcrHm5aPMjZtRm3yawGwTRgqm9dEFq4camDbA45DcoRGt8p7mdtt9Eai3d4hyFYphOY
         aWCYZ6U3AO8JDT8tvX8QLaf+yCXMp/1mffesL8pvfuRmLQ86VO4JvC+FRGLy1dg31BBW
         0UZ6eGJubbmqtLT2t/5IEaYlEr9D4Ne8vj+CuungGvrS1KD77d0vXZi2nERBKtjTWAKd
         u5UyFqzALLmu+eXUvMYTsWFUECcK7irviUSYCYy8CA+P7fb6Am/3Y/U22Z5sItMKuY4A
         DrXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745075632; x=1745680432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xjS2bMDeIbhC0yshi+jMm+EWIBUbVhlRrjV+NI3C8Ok=;
        b=TBnBcaq89VI5aEOHb64XOWB1w7krWxMWm/ZzDVuAlykGOQArJnR2wPnFXgHKYGkSLu
         dRF9HM5eNERzOXooZgIedA1XzQYHxGX71zMVHHktcdPzg2YWfWayBvhjbEMeduB7tAXK
         8DbM27edrhTxr1vgnPUgz2aCff6OMNzPFxpl2MSINl5ujDIvv3M+b6Au+E9gIK4n2ljC
         wrNdbLN+6U1qaUvsXO6zo1tFxWTBjIMi2uZ8rI+6cOst75ZSVQ6vqcVApRG0ioNhJmbb
         trI1l72GvGI+baQeDfmbpHVnPp2DhT8gEZOyQA/PSI6aJCa5iLUUYWjjTxMJVpTI8TpO
         z4ng==
X-Forwarded-Encrypted: i=1; AJvYcCXyBWGTAzyYaJD3UN16q8orqV+Fjht6Slqm6AIiT77GpEG/dzrp0sr6OyaCf7nEaIuCn263YnUYN1sMpNY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhwqT4tTT8Fb/0NzYOZ/sDOE2Vv4XEs2X+kx5WQLjV5OGAwkOE
	BjfMN/lDlSzZTTA1ydr+r12eScGR5lVnwtbIkP7XUqW/DaOxCaxS38AWxZP3z3Wf8Mgnrl8W77w
	UzgfXHu5fGg9oepM4cendUPvyOWk=
X-Gm-Gg: ASbGnctbd4PhBsJ7YnM5jDLy0tg3nn/nt+fAD02ATrWnQmuR5unpQrvEh19FriJgvnO
	AZJ/38t+f0HteLHk6G98/jAfnDRqB6ltb3c2OFvKzoK94Bzfc5+sGHLoihkAx5p2vj1Ofxnq+fM
	PBLgvWpWeCT6oe2pzdutaDKA==
X-Google-Smtp-Source: AGHT+IG1aCfPQhnBXsvG8ECP52ka2sLz5yKvS0cOAtGpRTOS3+qv2td4+5bLSvnUJnRNYP0BaXxwScy8wtNUpAhrsdw=
X-Received: by 2002:a17:90b:1d06:b0:2ff:7970:d2bd with SMTP id
 98e67ed59e1d1-3087bbc4f53mr3345545a91.5.1745075632258; Sat, 19 Apr 2025
 08:13:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416152800.GA570023@ax162>
In-Reply-To: <20250416152800.GA570023@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 19 Apr 2025 17:13:39 +0200
X-Gm-Features: ATxdqUGRNkjsD6enVW3TUiA5cYbGWXxCCSBQlvVzerYHNWFwSBicBV9k8htVI0Y
Message-ID: <CANiq72kB6H9g24Aw+Oux4oiJdwWbutyMw0uvLEUBUjg=Mj3jzg@mail.gmail.com>
Subject: Re: Prebuilt LLVM 20.1.3 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 5:28=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 20.1.3 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 20.x
> series is no longer supported.

Looks good, thanks! I also did a few quick tests on the older 20.1 ones.

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
