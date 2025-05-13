Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1821F03EF
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747119354; cv=none; b=FwlHMyTPV2qu5iXRZwJVuqg/kbPSRevRGdQJP+1LGZZO+gvFWi2Tocr3murIlMQQMhA+G3u+GGTCYoNYq0HtsqN799qwqhBGKqkZBX23IX2onJGJFRQuA/liQizuzS8IBh21sbGjPTLSJErqJurgfbyR9p5lN0yjGgcSp6T20T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747119354; c=relaxed/simple;
	bh=CNwMZT9WQrA6EdVJEgo05UMzWBM4RqtEzt039Ek93xM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Idu9dmsua0cpu1gq3WWTd3QXN4zjVhjvD7/bynu5BWQ5+8aunw+WAWsdPsbkkD1kOSdsH2T82emduHx4IXyzlUVLwl8acL4Ml0eLGxXERIEhwMAnw9pLaiC7cWcWrLqN9c4DJKA97cZ8VrmmBO6yJXZL6Xbd16ppxErKKRdD00s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EppbS1Pt; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EppbS1Pt"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5fbc736f0c7so7445057a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 23:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747119351; x=1747724151; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z2xRiSFv5DUxreBQg2Vos9MdPz8VRSwkIGSa4Iomr6U=;
        b=EppbS1PtYmmj9Hhtqgy6JIkibTSsgxdbhaWLrvMXojUshgK4kiJ61bUayXitD5D4t6
         5BVzHRwaf16KEp8eY3RIqqSCo1N2ZuilOA9B7r2Y2yih6L5xMa3tWhla2rKYOdwzPKcr
         1lQD4kkVbAF1M5dCe+7pDVxPYcJUd81umb8+FefklYoL1Ub9r9CXZllqjWfD9eOW36Lw
         HRj0oHjoYu2kdEO/rLJ43ubVlHbqqJ3+gj7Gbje9uNi6vOYYUD5XdGati6vPcNw7ZohO
         68cHj/kK2nku1iKfsc+pvbSbgsnHJOWaqVOu+9mBwrpwreNuEAxVWayXWWnUN9EYO1ME
         T2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747119351; x=1747724151;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z2xRiSFv5DUxreBQg2Vos9MdPz8VRSwkIGSa4Iomr6U=;
        b=kl+mOMW0a5d6DInI1b/mERKTBusGlQEQUyXUiaHCwSmLKngBtOPTMG00y9OCECHp+0
         sq07n2sqo3CCq3O0h1Or9AujbQPH7WCrHLbp7S2I6NPjkW2SIKlsIZbQdiU9Sql90HcZ
         qqkvjzHn3AWTfZoCeDkOBisK/9MYQhM7W9x+3Tv8B/BJ1kAU1gSCpjGn3VyB/l4ag7eF
         U0/iFpmmknWk9euBMojpMIWZGcjiDXNrD3v3IGhURrgMf8TLKuV/7ql2mTXJWgnpQDXy
         Z2SIE9tDp0cPX8ICq/jISR63DxRqo4S5T0G45vXtpMf7QMVHettQ/cncMxllrgDVEDsa
         5m3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXam98B4JxL2E1WfRvjx+HMj3fG5LOTaWC3B4HYZBcsv0ujgtQBJxC3ljSbh3UlUME1G1JIiXJZGOdmoCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTF54hWKdb1nvsPvoRETFQin/g5rn43gvKdJgJ3ElHzGCYV7hN
	Rmq7pSOrhw9O/m+BKC3gIUX6IaYr1yCSmSRKen1nFN5xdRvXXqQpxWbvdvWxew==
X-Gm-Gg: ASbGnctSVTQSnxHfjnEAxsbCiM2mjNR5NGNsZTtNViboc19co1MRcpGrLShPAuvynhz
	QAZux8NcvoHl/64ZhbUlz3wfvn3wwFQtnDqZuuZRMusD9DuqPmkKokNHJCv6wX5Th4hIO5nzoan
	t2HeoVyZ9wj79cRq5AY2bRi3TbmfFi02Pu609mMemD0YTWV+Yv6fmdZf3KVSSc7d80/8Dl/4uMm
	fvbu8fmhCTrYPeXwp+1w8Bi6TcbygyCyf8DnTG9gGPWKR5PXOpoKFyKomfxkYfx3DiTx/7jP2Zp
	QEb+lVzE7p0uwS1GkwZn+BAA4FjK/8KOsRpuOi7NROhCAq49CetD1oKpt7Q5psgI1cEPzBnpAnx
	11UTOdwfRZJYq+NNSgQ==
X-Google-Smtp-Source: AGHT+IEJcWAfvRS3kBvpInjaCmKU8N/uYiVZUsBrTjTyDMdtwenObnLSTYADlQEa479B/uOO9FGD5w==
X-Received: by 2002:a17:907:998d:b0:ad2:4eb9:d889 with SMTP id a640c23a62f3a-ad24eb9da87mr593957166b.30.1747119351130;
        Mon, 12 May 2025 23:55:51 -0700 (PDT)
Received: from google.com (201.31.90.34.bc.googleusercontent.com. [34.90.31.201])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21988d43asm738207466b.178.2025.05.12.23.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 23:55:50 -0700 (PDT)
Date: Tue, 13 May 2025 06:55:46 +0000
From: Matt Bobrowski <mattbobrowski@google.com>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Viktor Malik <vmalik@redhat.com>, bpf@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v4 2/4] uaccess: Define pagefault lock guard
Message-ID: <aCLs8rUaO2q4NViq@google.com>
References: <cover.1746598898.git.vmalik@redhat.com>
 <39416cac1d011661601caffc6ac38195c82ede86.1746598898.git.vmalik@redhat.com>
 <aByA1wael6H4tMo8@google.com>
 <CAEf4BzbggjOmEziyLjSRSsEQzLMMXQGoEJ6SODVF2exLR1S9UQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEf4BzbggjOmEziyLjSRSsEQzLMMXQGoEJ6SODVF2exLR1S9UQ@mail.gmail.com>

On Fri, May 09, 2025 at 11:20:48AM -0700, Andrii Nakryiko wrote:
> On Thu, May 8, 2025 at 3:01 AM Matt Bobrowski <mattbobrowski@google.com> wrote:
> >
> > On Wed, May 07, 2025 at 08:40:37AM +0200, Viktor Malik wrote:
> > > Define a pagefault lock guard which allows to simplify functions that
> > > need to disable page faults.
> > >
> > > Signed-off-by: Viktor Malik <vmalik@redhat.com>
> > > ---
> > >  include/linux/uaccess.h | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
> > > index 7c06f4795670..1beb5b395d81 100644
> > > --- a/include/linux/uaccess.h
> > > +++ b/include/linux/uaccess.h
> > > @@ -296,6 +296,8 @@ static inline bool pagefault_disabled(void)
> > >   */
> > >  #define faulthandler_disabled() (pagefault_disabled() || in_atomic())
> > >
> > > +DEFINE_LOCK_GUARD_0(pagefault, pagefault_disable(), pagefault_enable())
> >
> > I can't help but mention that naming this scope-based cleanup helper
> > `pagefault` just seems overly ambiguous. That's just me though...
> 
> I do see the concern, but
> 
> DEFINE_LOCK_GUARD_0(preempt, preempt_disable(), preempt_enable())
> DEFINE_LOCK_GUARD_0(irq, local_irq_disable(), local_irq_enable())
> 
> so we are just staying consistent here? But also "guard (against) the
> pagefault" does (internally) read somewhat meaningfully, no?

Now that you've written it out like that, yes I do agree, that does
read somewhat meaningfully. I also don't have any better suggestions
at this point, so I think leaving it as it is now is also totally
fine.
