Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5BD1F8BC5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 23:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743637166; cv=none; b=lmNiSgNbDd2Jz3N3sflEVpeUAwLoZd93SXBCuO2b3jhQ3Y+lNkrMZm3ChZx6LM3q4Fomv8tDFzwi/WDlTE9gOot7ckcvRFRVYbm5G/iztSpTRPBeUyV4mjq7Dw7AOk5V51ojTlYaZdPrxNNUV7N1boxJrxrDJT3ffay/8SMI7i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743637166; c=relaxed/simple;
	bh=dNwwA9O4m64y6yXRySB+PnQLilzg4NVSA35tpcvwWKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ef4OI4WzQvq5BlnIzV4ITPsb17vK3yFsy/Jyxlod6sjZel8/SjrQWKctAl+MQm6796kKk7QNzzJOhlmcRq8JJCf6pA1sv67RXDAIHv9t+3kjnqgMPDOl2mJVvCKgJGzoVfvundfpRRkUyo5NYiJ5I0QrzuigT1uuoDKD3ZiUKpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=maY5YrJi; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="maY5YrJi"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2aeada833so67375466b.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 16:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743637163; x=1744241963; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YudTlNEpaAEFNWXAJfFj34JKspVfdSXBGtUKkahvOIQ=;
        b=maY5YrJiI5gWZcYM4Kz+6f/IuhJDRHrctT22qySXtvFfKNZmLeVeYpCAhYYZyi+T54
         iauUBqMFrtKxgG27oY4/ByTSiQS6QaL5WbLDWvF59h0+m0xM25yoniH6BsFDQojsRkNC
         LSkecULVR4SJUt8hukpJXBzeOrYvYRV7BemZDTrWWPNPKmGtTZMOj4GtR+PHuBI4YIzf
         6jFs1tsnoMmcruVMPs4+TaMUg0LB8j4tHq/mOvno434d+UUpaFvTpNkmhvYQ9/muUY6s
         AReJxjEGu5BaQYwCvWR3uOCcqAkvzbUhsUIjCB3SCNydjr4DuDq4mVoInHrVyMQRfZki
         19zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743637163; x=1744241963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YudTlNEpaAEFNWXAJfFj34JKspVfdSXBGtUKkahvOIQ=;
        b=S+5iv5KJP3MynYOR08OBRk3CJaIRPp25KQTpvWFU+JtSPd45TzdBkWISIWhgxBnKY+
         dRKvv88z81gYLvgRlSO/o+sjOuG1i6fOm2+0QEF6BWqxlOqZ5xHYuR8sXTW0C3y1atLq
         uX9yYOpPH3eday/o70QM+Vj4y4PZBQIZ+QmkbvWWwAKlXZYCSZ63yqhboqeaWB/Yq/wz
         K+fNr+GRVCJmRxgzjOlYj9dcFwtwK7cUl8ngkFY0zFZCjHeen6R0t2sjhRXNxcOSGPEo
         qCshYDnbvRIMRxme6yRszc9gglWKYhFphRgoygybg/rBTiEPDjm65AueMOngQDN/QMPi
         ocig==
X-Forwarded-Encrypted: i=1; AJvYcCUGZLYhqi5Ss7bFGNcOb3uJYeASO8JqKq5gToIXY0gCe8+1DKqY9IXWg27gQxiD6ean/Nuf6mj7lBKuINg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoJ1vHhveCZWUUUwxosYh+u0c/646x3hDvBXqSahDhm0lbMEJU
	bW/QrflmYu6OQD+49Kn4Iz8TaN4BB3M+J49fQh1oZ77/LFYwXNTdaiG4MjjKF67yQuYnet/xn3f
	N2x4H7m+K5w6sLfYc1PBTcbK4ma4=
X-Gm-Gg: ASbGncsMNqKx5zuU4dsBDGb2ZgmIgX1MqY7LxClppSCzuz1tMZINzSkBm/FTDJyN44v
	2IBk+HbiN99KgEM9SLwP1VsG36Ti8KSjPXSbDjL6OelHgVeHxmDjXKcV7MWpV8itH7WoYa7Jgxg
	dxjmtdF3FsbiIDO9VfVigfnswB
X-Google-Smtp-Source: AGHT+IF2Mt7utW00d8zs0H6dSeLFf72pzQmblSH0oIpDvCfb0iiU4fkbc7a14aJOurMcEim3aRxhlMN6XXNBmCRx2Uw=
X-Received: by 2002:a17:906:70d:b0:ac3:4228:6e00 with SMTP id
 a640c23a62f3a-ac7b6b499ebmr124619366b.6.1743637162423; Wed, 02 Apr 2025
 16:39:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGudoHEV-PFSr-xKUx5GkTf4KasJc=aNNzQbkoTnFVLisKti+A@mail.gmail.com>
 <948fffdc-d0d8-49c4-90b6-b91f282f76c9@citrix.com> <CAHk-=wg4syfXPBgQhq50ePOnB=zP9Jk1U+GmjXWmDMwcQ7X7WA@mail.gmail.com>
 <e0021746-d43c-4c45-83b6-bcf3982b2548@citrix.com> <CAHk-=wjYrfUDOd3VYhn8HvH7MCnampXt1TdtaXo86UDrT_rbMQ@mail.gmail.com>
In-Reply-To: <CAHk-=wjYrfUDOd3VYhn8HvH7MCnampXt1TdtaXo86UDrT_rbMQ@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 3 Apr 2025 01:39:09 +0200
X-Gm-Features: AQ5f1Jqh3LZBVSFXS-E6Zy77Llv46PD7ibzGTWbDuL2iigIT0fUPPNwvJ7NBgpw
Message-ID: <CAGudoHFwa3Wa-SYHJ7VVHoQMoB2ZkZqzq=Pth5xeovSGON_YHA@mail.gmail.com>
Subject: Re: [RFC PATCH] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org, 
	mingo@redhat.com, x86@kernel.org, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 8:56=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> Admittedly my main use case for that was the big fixed-size case in
> the stat code, which just does
>
>         return copy_to_user(statbuf,&tmp,sizeof(tmp)) ? -EFAULT : 0;
>
> and shows up like a sore thumb on some benchmarks.
>
> But I've always hated the patch because it turns out that the real fix
> is to get rid of the temporary buffer on the stack, and just copy the
> fields one-by-one with 'unsafe_put_user()' and friends, but every time
> I do that - and I've done it several times - I end up throwing the
> patch away because it ends up being problematic on non-x86
> architectures
>
> (Reason: INIT_STRUCT_STAT64_PADDING(). Ugh).

Well, one could do ugliness as follows, opt-in for interested uarchs,
pseudocode-wise:

__stat_fill_padding_start(user);
unsafe_put_user(user->somefield0, stat->somefield0);
__stat_fill_padding0(user);
unsafe_put_user(user->somefield1, stat->somefield1);
__stat_fill_padding1(user);
.....
__stat_fill_padding_end(user);

Where archs would provide padding macros as needed, expanding to
nothing or zeroing something. I don't know if everyone has fields in
the same order, it may be the stores would not be clean here. I guess
the two archs which really matter are amd64 and arm64? Archs not
interested still get copy_to_user.

Anyhow, for stat specifically, I think there is a different way out
and I suspect it will be faster.

Things start with memsetting struct kstat and populating some of it,
and only some of the populated stuff is used to begin with. There is
some getattr calls to further fill out kstat. Finally the kstack thing
gets converted into userspace stat and copied out.

While you can coalesce kstat -> stat conversion and copyout into one
thing, there is still the cost paid for doing work the syscall is not
looking at.

Instead the vfs layer could fill out an on-stack stat buffer
immediately and copy that out. This should be less work (no kstat
memset for example) and not require anyone to mess with
unsafe_put_user.

I don't know if this is worth pursuing, maybe I'll hack it up out of curios=
ity.
--=20
Mateusz Guzik <mjguzik gmail.com>
