Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994762A1CA
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 02:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747101670; cv=none; b=AdGqWXt4HI5w+IhFGInOYBqPN+Ix/vglp8hLUrZetiSapbbHLMGmmIAjIngy6dt5s1rEwDpc5K88JwRFszkc5+RA6RJ2jy/GTlC5YKhIUfqcCjmVZ9iU2dJ9/7Uuphvq/GhytGCQUIhJmIJ5d3seIlAXrstMDrXSYDSwExxHsYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747101670; c=relaxed/simple;
	bh=kxh/Lh7RFMTaonXAnN83PEO9EicnxQWHTtdB/wWUb9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jJAyLd1Tg0eNqucCFYY34IowG0KRlK4GlFFgv9z+GYF9zpavcaLjz2ZPh1O5dqGSL+IJnRsweI0vvu+t5KVLAG23fwZzy1zHIvQshfzSaWjCNhNdIH7r2JZ7YbbkvJO7XzCEeVQyUT4iJciL51NxFdKUCBNAi+9LyNOmOeDRxgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WojAEkx9; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WojAEkx9"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7091d7244e8so48172677b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 19:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1747101666; x=1747706466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+4gLT198DkD9ofBl+7O5/TGDFIHm+IzIu5evM3sI1Q=;
        b=WojAEkx9xwuOo8JWzvImsXzNnEThwAjtqNyh7WIJqY8OJMtXtiMZfALfN9raDvu+Dq
         wwDi94HeJjALFv/es5aPGbDgjOz/BLycd7ilVMdosWshdA+63RRRKkdtopvUosohvmPD
         tuWun42cVLXwBJdqd3h1yjcOdUyGWO/CoGao0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747101666; x=1747706466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+4gLT198DkD9ofBl+7O5/TGDFIHm+IzIu5evM3sI1Q=;
        b=T7BvdxvyOzMu//kUEdppUM5yG7EJ5IEoleMEM5uvmPkOrqXHilGkzB1skb9IryAHY9
         m2hcvzai+Wz4Zs2pkq55TNsgKYCjwdkGVSpRsATPekHNrJB2mrxqhIXoo4zDggmgPqJ6
         gMZIDAlgC8K6c6qVCqZCUFlwzVcXvyYkFHFdKrV81NO78npQowyJ01Fruws4sN9DDzmy
         W+RWz3Fq1Yzd1+bqr68uiSJlBxE26R9/cSjphGFDjz/eecAfg4JSHI59Rd/PffafnzYk
         Dv9RQ4jbPfIzvRhXVyTrivQqGRUySV2LSNI4xfSuGhR0xL3fBsz7cjSYi9p9axZ1Ke0c
         tHSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsjhvm6lc/6V9K1j5OtrFOyXTKaD1neehbQf+i8bg/gvjxbKFUpvZ65EQKOORDM5+vNBxkMGN7nUaWs34=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWYtd1JgwJs0sCwOOGKRb5HSPoTu2o0AgY2M7FgxWfN1xvzqyy
	HC5R8S88yYNcC98QQPIm1JIf+JUl2p6eLgXH2R8gtznTsfq/NUUfnnL5PQzkduw6R5LSUO0JJtZ
	H3ft6HCbRfvK7MgnaCHuRqLpATPW6q4Los27hRw==
X-Gm-Gg: ASbGncu5vfVQJ5fD1umQw80OoftRiTXFAY4BJofLfTGnDZjXAFh5v1buPuess8rqCfF
	GiPbL2FZPUcBkjGc1QC7UzoyOGgNYuatoXXLPdpDPw7BIzpv48qptcgR+DRFDGkTJrVOTSutcwU
	C9an0BveS4iSGklkFoUD2/JMQqaha+AVnIIxtfbR7s8jfhlKizxJ+wtwfyXKSZVTF6Yg==
X-Google-Smtp-Source: AGHT+IEJ325sRwqRS5Q5LcGq4DyDzJGOmAH1jfA1gnDPIfb3WA3FvnEHCnVbCcXsIzlvhWvDXUQ3+b4y3Zp1FOsJ6zo=
X-Received: by 2002:a05:690c:4b89:b0:708:1852:9897 with SMTP id
 00721157ae682-70a3fa24d48mr227093717b3.11.1747101666437; Mon, 12 May 2025
 19:01:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk>
 <98C88CE8-C3D5-4B75-8545-71DD47C67614@zytor.com> <alpine.DEB.2.21.2505051356340.31828@angie.orcam.me.uk>
 <1E50C160-EB89-4C5C-B9F0-6441026EE380@zytor.com> <20250505205405.GNaBklbdKLbadRATbr@fat_crate.local>
 <alpine.DEB.2.21.2505060059010.31828@angie.orcam.me.uk> <20250506141631.GEaBoZvzPCWh88xDzu@fat_crate.local>
 <alpine.DEB.2.21.2505062228200.21337@angie.orcam.me.uk> <8C172B63-38E1-427B-8511-25ECE5B9E780@alien8.de>
 <alpine.DEB.2.21.2505121225000.46553@angie.orcam.me.uk> <20250512134853.GGaCH8RUjJwgHq25qx@fat_crate.local>
 <alpine.DEB.2.21.2505121810040.46553@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2505121810040.46553@angie.orcam.me.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 12 May 2025 19:00:55 -0700
X-Gm-Features: AX0GCFthmPe51gp6uIEQVpRBZyDyaNhzTarJmkzn08Ssddaktccz165yk0a4ltQ
Message-ID: <CAADWXX8+-=pcOUeu_cwX_vkkkGp6jn0GQLUhZX8MxGGRjKz=Lg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/15] x86: Remove support for TSC-less and CX8-less CPUs
To: "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@kernel.org>, 
	linux-kernel@vger.kernel.org, "Ahmed S . Darwish" <darwi@linutronix.de>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Arnd Bergmann <arnd@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	John Ogness <john.ogness@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 10:29=E2=80=AFAM Maciej W. Rozycki <macro@orcam.me.=
uk> wrote:
>
>  Thank you.  It seems it'll be tough for me though to fulfil the GPG key
> trustability requirement.  While I've used PGP/GPG since 1995, I haven't
> been active collecting signatures with my more recent keys/IDs and neithe=
r
> I have appeared in public among Linux kernel developers often enough for
> me to be identified by face over a video call.  Oh well...

I don't think this has been insurmountable before, particularly for
anybody who has been around for as long as you have.  Even your
current email goes back to at least the beginnings of git.

If "two decades+ of active kernel development involvement using the
same email address" doesn't make you eligible for a kernel.org
account, we're doing something wrong.

                Linus
