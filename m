Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89502673BD
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750862036; cv=none; b=Bw0m9CsZsABUGGaOSG0Mfpo0l5nNr707kaOXqhbknXSR3Io/EFRgkzdMHFXV1Aa8jH+7pd2QIgyw52yf7IEx8Gua/cK5WEN4RrPYRE96JGh7lfQmgxeZ7jqwXnRj3m2zybVNw/WSefxd7HhNjCoEEJbJO2J/CoeFDAb7K7z/VjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750862036; c=relaxed/simple;
	bh=k/9Jmpcevuw9DPLUN7lxWq/HVRKdkSC2nfzszYCDb30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKT/hi1GcyHPqKL0V+t3KKCA7iLK0SZF9mXEcDmLGxrUCNhZScMe0csAxL1MfJyDG/Csn80FG3B9SmVYxyZ1lCkoKMKu1UCtjE8DOaRscoPx6KywB7RByYYXLGZN6wWPtw8s8Fpq8Cc/Jejc6kY8tGjUMMgyXcc+OAu6KmuTk1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FLZcWRah; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FLZcWRah"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-237f270513bso147225ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750862034; x=1751466834; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdV48kTp/uRROljNRCynqJ7h0+dKwD9pZid+7Ju9vko=;
        b=FLZcWRahed/cn0x/habzbVuKXmZ8smUrK0DytAimjUAB29yqxoUhuNkSZSeo7lmqoO
         P53EXbq32TNb2FE/dcII/rv8m5wlWMUqK/9UMvfB/jhN3slPF0Akw6gbHqS6li+F6bIU
         3cwRdkH2PtAu/6OoQFOGDxODEZF/m0r/52USX1JlXUxkmyZFMusihN9lYR9d0+7O9V1i
         3doBljxT0RCG9PjDTIppWmVZkGOkx0ute/e1XSaIj36DfYx/RsVuc7uUCAw0Y4TLhr7D
         drAAsgAc7j3YLJEDQQmsE0w6dGyUatd16vZrjNUdbhXAw1Ph1Cgy7gGu1V49qb56hPNl
         KlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750862034; x=1751466834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BdV48kTp/uRROljNRCynqJ7h0+dKwD9pZid+7Ju9vko=;
        b=XdGJvilW6stNNfuHGxb2blBs2+BE2TBfYBB8ZwB6SC/2HaSay5apI2KjAXrJVy6WL+
         7009luPiiE1Ejl7UarypDpxLKzqs4+oVapLEsT4NP6YTK3JL5vQ1MguXYdSM64LmAx0z
         e89DFEElxIG98Na1OwrzPz6XZx2/B5SuK6iXzvrQOeGovfBRi824NGKtCXDl107UGNUL
         gOpmRE3z6RIH+FDj4AinSTSHKr992gcXph2LH1h7U3/6IhGxP1ZNnL6oI1BwzPfoO50q
         ccd9eXxqxYQzF/bkeRPNSxS/kol+ZNr3kSbKfyGOBfhUVOyzTVutSHQ4Gr6Fe962vv5/
         cTTA==
X-Forwarded-Encrypted: i=1; AJvYcCXRrvEC/1R393RTSh9adf3qpKKK36UvO/kNcEZB4qkxE1eo/aycv6rUOzWQrT3vaGiVwq5h5C/+o10oki0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFVeQgDEUZwgB/zQ/B56t/v/1kSmbcSCDzv9bbv0fKSOsRuMuY
	R12vx4fV/9YSNlbjr+mVEJwtZNRTQGXqDEwFa7hOC29lzYaHYvDsuviVPCuW/RNi0HKvRr/2HEZ
	W1FoZmPljB7IZiiOOKEwuVSDiVGJEQ4LXGa2JzbdX
X-Gm-Gg: ASbGncvjBr/9mTjho/fvHtU5XOfpDIfKZAGQpMiDmymmqopSLrPh1+7XH9O9OfOzFzF
	HX30uhYa0a7upsg38+bc5MghTrPn81qBCZyI3MB+kQPPW5kG3kCRT9mnNrbKckDHGApRNADGdD5
	1eR9lAduS29vWmx0ZOmmBFYDADfDWqjBe8DarMMfW5QyWrgNtVIgX1MbnnYWiZMjdLSDqVsyXKb
	TkI
X-Google-Smtp-Source: AGHT+IHOl4ROtzPHTK+wA3RxqSQB0nXvE1X3o8JvmI/Y5HuW89eI98s0XYuUXqOg4//IZvRW47fajZljsA5Du+i3Zig=
X-Received: by 2002:a17:903:178b:b0:235:f298:cbbb with SMTP id
 d9443c01a7336-23827442ec7mr2061555ad.26.1750862033549; Wed, 25 Jun 2025
 07:33:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618120806.113884-1-adrian.hunter@intel.com>
 <20250618120806.113884-3-adrian.hunter@intel.com> <68938275-3f6a-46fc-9b38-2c916fdec3d6@intel.com>
In-Reply-To: <68938275-3f6a-46fc-9b38-2c916fdec3d6@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Wed, 25 Jun 2025 07:33:41 -0700
X-Gm-Features: AX0GCFtcX4EHPJezVuR03z_zvYB0b1sB8iUGWdlclbBZyL1LJyYQEWzO3JG3LhQ
Message-ID: <CAGtprH_cVwWhfXFkM-=rVzQZ0CpY_zcnkF=q5x1n_9Bzm1xKfw@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: TDX: Do not clear poisoned pages
To: Dave Hansen <dave.hansen@intel.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Tony Luck <tony.luck@intel.com>, pbonzini@redhat.com, 
	seanjc@google.com, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	H Peter Anvin <hpa@zytor.com>, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, rick.p.edgecombe@intel.com, 
	kirill.shutemov@linux.intel.com, kai.huang@intel.com, 
	reinette.chatre@intel.com, xiaoyao.li@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@linux.intel.com, 
	isaku.yamahata@intel.com, yan.y.zhao@intel.com, chao.gao@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 7:58=E2=80=AFAM Dave Hansen <dave.hansen@intel.com>=
 wrote:
>
> On 6/18/25 05:08, Adrian Hunter wrote:
> > --- a/arch/x86/kvm/vmx/tdx.c
> > +++ b/arch/x86/kvm/vmx/tdx.c
> > @@ -282,10 +282,10 @@ static void tdx_clear_page(struct page *page)
> >       void *dest =3D page_to_virt(page);
> >       unsigned long i;
> >
> > -     /*
> > -      * The page could have been poisoned.  MOVDIR64B also clears
> > -      * the poison bit so the kernel can safely use the page again.
> > -      */
> > +     /* Machine check handler may have poisoned the page */
> > +     if (PageHWPoison(page))
> > +             return;

IIUC, even if movdir64b stores contents on hwpoisoned pages, it's not
going to cause any trouble.

This check should be (unlikely(PageHWPoison(page)) and even better
probably should be omitted altogether if there are no side effects of
direct store to hwpoisoned pages.

>
> I think the old comment needs to stay in some form.
>
> There are two kinds of poisons here: One from an integrity mismatch and
> the other because the hardware decided the memory is bad. MOVDIR64B
> clears the integrity one, but not the hardware one obviously.

To ensure I understand correctly, Am I correct in saying: movdir64b
clearing the integrity poison is just hardware clearing the poison
bit, software will still treat that page as poisoned?

>
> Could we make that clear in the comment, please?
>
>
