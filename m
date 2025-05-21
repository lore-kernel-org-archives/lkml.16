Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1B4230BC5
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 05:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747806101; cv=none; b=MKZijWzq9KgKODSERjBibFKE5CQ9+nMpJHRf5dRaZ+jzzt14Ciww1JNT3LwwPdaSkMP8FK/OA0TWXeCZ39G0AjdmtY+11WwtexbKYcuzp4cLhccca2de+ep1P/gxwb8OIn16887Pnb8Ftdcd4nT8+suwSqJ1ZP674j3Jkq0xYvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747806101; c=relaxed/simple;
	bh=WuKPUIc4ggVixbgxrmfedA4AH8Wix3/q/5/YdGnifww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YdbdutZsxyCkq/aVFcB5qgydR0Ghbyu2XjNMGA3yh8SXDSfSU8oNgkrRsbftXLmJik6/etV8GVlcUb1MdTDdlOAp+2y+R2PCYZuaCtMfBCcOJFvDMVoVgsiUz2no3LBJoyDDnbGxYcqlKlvGXN9dl8PCe7xnEqbcFc4QwHcmM4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DIx0B2CO; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIx0B2CO"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70d70ee042dso21684167b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 22:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747806098; x=1748410898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WuKPUIc4ggVixbgxrmfedA4AH8Wix3/q/5/YdGnifww=;
        b=DIx0B2CO+iAOj6bJFmM6v9lnQGKMMtp90IhVzzly/WVQPTwV2gTXxdOriG0Wwj/8Pe
         4o2YmrprlyoisspMz4utLMJQMZN/81uq9coGoBkpPCv/IXZDY4RDvS01eRnLVp9pg57f
         FGHNRdJPkSM4Y6S0HTDvdQ/yv6QCTFgk8eyTrXXStlPU0yONi5MldFiQ3LsSmciiU210
         o5rKZ63l1mqki6LL3IwT6xlE1PpkBoZAuZNcubv2LMKyEB4xxe6yUU3ClRC0B+DSkVpu
         Iw5f8ltWIZV1k8EtZTRBgc7g9c2wRlV6D+Tcfykf6OMMogNCuDiLQk64oRSrp1BUZWFL
         Vsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747806098; x=1748410898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WuKPUIc4ggVixbgxrmfedA4AH8Wix3/q/5/YdGnifww=;
        b=b8A5qS8CiKsWqdq1yrHghRceNkFSW4H7LlF9YTUzqnKT42+xUFpTq81JaTvaJSWiC6
         rR/9LRmhhiKWk4rjppKUk4pS8o9BNJ7fHs7ngtIinEPI8rLEJNcEX8R6c5oF4D47y/bg
         bXCsZbkKc7XKSNMFfAlVKsaWgbuWoUZTm4ScX7tACHMuvmDC9toNdxuFIIhz5xKh1dw+
         J7m4yjJXyYk8JJRbrFzZO4KRYRZc9AxyuN0zLzoqESoJ0e/woCe2XhbiJQxIQ5AxskF4
         aGKGGt2IHqbZw98hKbcr/mRXKbZlBIBls3AnklnnGLPhpx0q5TCKpOB3q4rSfVt8VRKL
         qVDg==
X-Forwarded-Encrypted: i=1; AJvYcCUqG+F1L+QNEQqg3EQjFRL7+0/8x6N9cxmUUKvm1UcDv9vnD0wqUREE3m4Ci3EXu8KKwmFXnm50qF4GF70=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJhMRHfhZuXDDpxFG66+gaVoPJvOj8zwnXV41T37AzSz5CUW+P
	HCsVyP84r0ztwHgNYS5yVy4/m3tBC0+FlMo/1f1NMCh6WQUH41wHkVvEeK6yN6LsSgETD3sJb4k
	tDAVfmzhRE8dyZYdLdrSL89DuTiEMK1Cnd4tt
X-Gm-Gg: ASbGncsYFVSzRxTx0QsacwVESkmXgR9CKXgxumHj9rdWEj7SnT/oC6KyziM4DBSNE69
	x7E03aINNi9sq7YrRNH+AOfXr3R2mj+qxgEAuKx9aZBTk2YucOV7FjajcU72qqObvEGMq2vuaVN
	Y/wrKtKpTymBCGGVUM5rP4hdoyXPZGAydICHg5U2h9Cb8Y5+qWwHf2vb6t+v25A2L9
X-Google-Smtp-Source: AGHT+IGdSZe7ylfgOWcxywNa73o7coZc7jyagjAA4TlJYJVRxstnsjYUscSako9JGhA3ho960/y7DVvylMCCgAFPLnM=
X-Received: by 2002:a05:690c:4981:b0:70c:b882:2e5 with SMTP id
 00721157ae682-70cb88204d7mr223289207b3.2.1747806098307; Tue, 20 May 2025
 22:41:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG+54DZYz-4hW33Py9mihHDauWw55=_rP71s1MbCg-5gxw7J7Q@mail.gmail.com>
 <2025052116-diaphragm-payback-a3ef@gregkh>
In-Reply-To: <2025052116-diaphragm-payback-a3ef@gregkh>
From: rujra <braker.noob.kernel@gmail.com>
Date: Wed, 21 May 2025 11:11:26 +0530
X-Gm-Features: AX0GCFvPSzModwUdGmboKsJgQOYx09zLVKlfPKnab7JQIOmFxYmkMhIanR6ZZLk
Message-ID: <CAG+54Db4k-sMVHUsUWx=oN-AXE5aife=Ugx4f49smGnhq6=-0g@mail.gmail.com>
Subject: Re: [PATCH RESEND] staging : greybus : Documentation : firmware :
 Replace deprecated strncpy() with strscpy()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, elder@kernel.org, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi greg,

why is this a RESEND ?:

>> I had sent the same patch 4 days ago and didn't get any reply , hence tr=
ied to resend the same patch for the same,
here is earlier mail :
https://mail.google.com/mail/u/1/?ik=3Df63b03515e&view=3Dom&permmsgid=3Dmsg=
-a:s:12290863930259651721
,

line does not match this:
>> sorry , i could not get it what it is exactly ?, if possible can you sha=
re some insights or example so that from in future i would get it right.

thank you,
rujra bhatt



On Wed, May 21, 2025 at 11:00=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Wed, May 21, 2025 at 10:26:52AM +0530, rujra wrote:
> > To ensure that the firmware tag is properly null-terminated. When
> > copying firmware tag strings to prevent buffer overflows and ensure
> > data integrity.
> >
> >
> > changes has been made in 3 positions:
> > 1: update firmware tag
> > 2: backend update firmware tag
> > 3: backend update firmware tag with unipro
> >
> > Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
>
> Your From: line does not match this :(
>
> Also, why is this a "RESEND"?
>
> thanks,
>
> greg k-h
