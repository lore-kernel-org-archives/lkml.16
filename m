Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F104110F2
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 02:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746758427; cv=none; b=qCUlXer+vX1g3T7KiQu628BubV+lKBVCdGAoQcvQK+MzLY+/XcjXBNMjEU3RzhosheQk1Sk8IvJfG/3eJw8kSeQmwh8otiSYHLjm4RB/wBju7UKr12CKVycPQccszkbnIrcYSGqOE9/mMokysfu+Nmd3L9O0bMdsCvYggTnyhCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746758427; c=relaxed/simple;
	bh=fbU3HjWyMXkb9dGsZnGLbxInBFDNVNu9m2J3gvv0qnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DSatk+tucK3d4m1SnZANK86jIckJBNcS7EVdCHlDeWU6sH9VQlSBKRPPRNQtazSbRAQ7xJK8moVPi/EdX/U+3HcS/3Y8uSZQGw4YETgdxSQuzxBhLtFioC7lzBCdD6DoBqizLLibmhwP9xi5dAgEecUCt0OpyJ+uuD+NT1t8pH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eINcCWxD; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eINcCWxD"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5fbf1365b1fso5121a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 19:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746758424; x=1747363224; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbU3HjWyMXkb9dGsZnGLbxInBFDNVNu9m2J3gvv0qnM=;
        b=eINcCWxDjU1u5WMzC4bWyzKpLTcSq8kp09EeAwZ0xQl1jnSPwVMY0Jg6czzR32uyN2
         xHAcVRWGKfF/VfNUf9jwpyv/7aQPRjdV+VTns7wy3oV2r2464Ptj2Sp+tshepmCtBziM
         UYzJYmk3VIxMyw2pjHKnWprRvEhKDVdv4SIsawitKDYfdhSrchpkBeqlva3OaJNFjZQ0
         Fg/i/wcKwSxWfoO0mS0kJYbWS+w/i2K1dYubAezrlrwhQ1pqA5PaKfEAArDgal2LlZuS
         BXDVjQR/2b6VpTXz4UeHtYdGw9ieb4muVvc/jL/EFNab9YPKY+OvOQ9Nox7O3b3DZ5jM
         tbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746758424; x=1747363224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbU3HjWyMXkb9dGsZnGLbxInBFDNVNu9m2J3gvv0qnM=;
        b=qa3gD46t+rCLb/uvkVqPz7R0uqB07EbfdJyEl+oEQRrwqO0fPmm8IwuBw07ZDWKRxv
         5ITgkDCAG+8eLgWjacrgzlUw77kK4MIkG/Rt80hRyqoTyzIXlEkc1bk/uYJMN8zFqOrm
         3KBfkNKVEaWkI2D8LVhC6THn0jbeeFKD4rDU0mn5xlhPq9HZS1wBaAlQGbxibUpSln/x
         Cne8j/G9Ak3KbIO2gWKJyR0kjXJKAN86oFDudjfJaJJlMYC3F5MJeDRzspgxg30mZt4C
         mxtQXOOABNw7DQMZZYg4i6+leypTB9isnLfZs/FzJDrGW4ewmLxzplQLGN9pxSK8df6F
         kXwg==
X-Forwarded-Encrypted: i=1; AJvYcCVsMGMRq68MFzZ89XlY70j4M3vNQe7euwR6cIUhn3ZE89dDOYstuvR8t3NoQwYyQFFY2QG3FIGak74siJk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjj5rorWf+m9XquKHS+T13059pSmVo/g91Gap/ydl1Kt4Jwbqv
	U+9iF3FftmjPCwxZkcdHWcz9+WKiGwUUFPD0UXR4+m/d3PmY4qWZDSQVmqC5XxDN6PuTpHbrHFD
	eFKMTnhn8xFVCVCqfmrd4HDWuvqPhdzUNrTTmxFEKwI+EWFNRmw==
X-Gm-Gg: ASbGnctSAd9Hg5W1N2F5bUh+0puhzpLm67y9yhtZWzpUKkxbfff0QZtWN00iRL7ugr1
	mlKUSW1t93fh8lveNe43HomLkC4z1E4BB+56KzV6jZJGZgNNVyqpeE/bOz6Cic7DaJYzipxVjzv
	20RTBbiBEiv0YHKGQ05xEX
X-Google-Smtp-Source: AGHT+IHs8N8GIJHV6hQ7v6BVcAhLlzquJwKORlwm8OHV24AyjhJvWrD2zfqx4hpKyBMB0ZsJzP8evSJIQn9Apks+tPQ=
X-Received: by 2002:aa7:cd07:0:b0:5fa:ac6f:ff97 with SMTP id
 4fb4d7f45d1cf-5fca1efb492mr46780a12.2.1746758424053; Thu, 08 May 2025
 19:40:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425200541.113015-1-xur@google.com> <174601619410.22196.10353886760773998736.tip-bot2@tip-bot2>
 <jj4fu243l7ap4bza5imrgjk5f5dhsoloxezgphdjwo7sb5iqsq@wkt46abbt45r>
 <yrdh2fmzgqlrfe35wvxb3a2z7wdqod3liupdbriqzc5ihqjw5y@fsqeyi34cbgg>
 <xb2rjui75xylasuihl7gdnovv2z6qxgsefmzhxvhntlcuw5ktb@zbstyytmzjag> <20250508152713.GI4439@noisy.programming.kicks-ass.net>
In-Reply-To: <20250508152713.GI4439@noisy.programming.kicks-ass.net>
From: Rong Xu <xur@google.com>
Date: Thu, 8 May 2025 19:40:13 -0700
X-Gm-Features: AX0GCFuXdBKM7y2tZJ4PRPCqtCRq-rf2WAsTlEUdkGvaXI8BntKBO0j8ScCcDyc
Message-ID: <CAF1bQ=S52yEfJhhW8WrqmXu7ux1W4zVyk7Osv80tkiXpvegNqQ@mail.gmail.com>
Subject: Re: [PATCH] objtool: Speed up SHT_GROUP reindexing
To: Peter Zijlstra <peterz@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, tip-bot2 for Rong Xu <tip-bot2@linutronix.de>, 
	linux-tip-commits@vger.kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 8:27=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Wed, May 07, 2025 at 05:11:53PM -0700, Josh Poimboeuf wrote:
> > On Wed, May 07, 2025 at 05:11:03PM -0700, Josh Poimboeuf wrote:
> > > From 2a33e583c87e3283706f346f9d59aac20653b7fd Mon Sep 17 00:00:00 200=
1
> > > Message-ID: <2a33e583c87e3283706f346f9d59aac20653b7fd.1746662991.git.=
jpoimboe@kernel.org>
> > > From: Josh Poimboeuf <jpoimboe@kernel.org>
> > > Date: Wed, 7 May 2025 16:56:55 -0700
> > > Subject: [PATCH] objtool: Speed up SHT_GROUP reindexing
> >
> > Urgh, sorry about the patch formatting, the above can obviously be
> > dropped.
>
> No worries, my script did it almost right :-)
>
> Patch seems sane to me; I'll go stick it into objtool/core. Rong if you
> could verify your case still work correctly that would be appreciated.

I tested the patch, and it works for me.

I also looked at the patch. It assumes there is only one .symtab section.
 In general, there can be multiple symtab sections in an ELF file. But this
(i.e. one symtab) most likely holds for the kernel.

Tested-by: Rong Xu <xur@google.com>

Thanks,

-Rong

>
