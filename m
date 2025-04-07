Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C582222594
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 23:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744067202; cv=none; b=HQPsT/br3n/SjAheYMaJQj4toRhLTPGF9EQAxiMJblaDrpiRtTSBIx8BjKIRx2xGfbpydm9RPYzHIKnFTAN2gFUxjCvTg0Y5RkVGOu3pibmwzbu2seKfY4NyyY8DKZG+Wp2DB3SjDBmeWk4APkhz/hNW9hr+KZTn6FDK537WxAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744067202; c=relaxed/simple;
	bh=NnpMR//R+lE0HzsOk3Sqk4S2BtKa0vwBWH2sSUWKfnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=apXYQUTuIK75PGkLAQPs3pO+fTbVs00Vgalipmqteuq0uwqsbP+ukrTvEXi0DkyQD4FeSl6BtAbrzE3l2JrwX3X/9jKRX8mG75/wFXyue4VgV/yK1/n9kB9HOMhGhD2Pa4O4BrmIv0yxMsVmh/EQanxH7AIViwCsm1wlKYd/HHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4WhjCcnt; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4WhjCcnt"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5dbfc122b82so4637a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 16:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744067198; x=1744671998; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6ZU8/5kXxHvtLmBpOqeu36t6PMkH8wk6iaMboo1oUk=;
        b=4WhjCcntCPmbLzJzbDIej7JAeA5fafx5VCkpzzUGcGsNq0A3HgH6sPXczPvkJB222L
         RQCSflsLL0rDyz5lj1AJ8ZUEuGLR7Yc+10hiBI/3C9VJVq9sQe2ZIYX8uVyqbPGTC+Mj
         MaTK9RbSFi0krpzV4KXEfAdwrVHWDx+1BicZ0mXecivSilcVKArkQ4XqKxd19s5q3uDz
         bXvRwdZeTclQJmRf8iWuuoga9TJNhjxr8BSUxL+jKEWvfu3Aty5JYFmJypsW311NN3s5
         5IAVWnBIK1nN0EnDVq9fZl9TvIbU7jovQNKFBzG8+UeGTpEYdkEkZysj6Z6ns+i5Xu2g
         5x2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744067198; x=1744671998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6ZU8/5kXxHvtLmBpOqeu36t6PMkH8wk6iaMboo1oUk=;
        b=Tj7bT+cHdOntcZ2b7dD13Di7lkLpC+JFGIoYKQ8IqCoIzN6ejfRmQLiBRybxEUAA1F
         +Jk3mPv1HKiQITnKICBIqJPzDj8+TGCJN8dGLpzocxKNe1va9mBc5kKANkPOmAyq1cMn
         rhsDs0pYsDQpDOtzb3UWP40+fkLt9eDVmSduElRCQSWp8i6SGAZ7lTFHVi1bkhywYJId
         3eEcficKRbcIEC/ccCwJfXYA4V+ALyWd3UVYmedz3Ci6HSa1OAomj9vtvuo3hoUJ5cBB
         SbSlBi5AmtsuKSfLASIS2R9XnLNr1C2LN0BmctiOENcALW3qCPT0FhYJem4X42i+F9Zu
         0b5A==
X-Forwarded-Encrypted: i=1; AJvYcCWkidR/Z26SUJhW7PW8qlJBWapi1/vVMYGT0anp9RyEg+Q3T2+IWDxeiWHEbvSGEFnjWdprCkbSpXJ8y3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YywKyFsu3TwMvXyjsny1D/OxhUmx/piDNofxc+yaMgmygoqr4kG
	PfHVzoKAT059g2gm2lSJiM9rGMAwT2etYunT+Enswj+i30bvNRkYnYTkpaJUMhRuVV+AJvW1xod
	Vohe5AqOWGdp98YcbMAcus+NhlOD9NGgMC5sW
X-Gm-Gg: ASbGncu/lKZ+mYvq0spRUKsDMWtjxPfAkDZbddKbb9QktkXYqI2oBglzaDzpsjuNL3r
	GJ0qRz1dpd2zlCAMuPu+8Wf8RDluxKDfCrYMWjp8Q9odhVprTL/j2p71kox2cyn7bPiU8M5K3Za
	/uS0zs2QcDIiT6ZFo+Vmtapk6r1a8VyO61nGXNZx+0zOdXuzrTmRePXg==
X-Google-Smtp-Source: AGHT+IGwqCibUtvZ7zXUKoLw/9l4mbZWNa3k4PRsHBInjoFnc3gA8HPUr5aBeYPf7FZ1MhHrVbTftQ1BznakccCAUeY=
X-Received: by 2002:a05:6402:8d3:b0:5de:c832:89ad with SMTP id
 4fb4d7f45d1cf-5f26a698aa5mr22942a12.6.1744067197193; Mon, 07 Apr 2025
 16:06:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320232757.2283956-2-samitolvanen@google.com> <CAK7LNAQ8t-O2Y-47MEQA2cPYKq2NB+FURbZ8zJKWgT0grG90rQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQ8t-O2Y-47MEQA2cPYKq2NB+FURbZ8zJKWgT0grG90rQ@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 7 Apr 2025 23:05:59 +0000
X-Gm-Features: ATxdqUH8gwXDjnSDaoNdK4s6L04JtZ--H42vGnrNEIhr4DeJpws2XPsHyTPSZa4
Message-ID: <CABCJKudb3GVL-nfUvd=1rhyH_ZWnxQCQkZBdGXQ16pA5fg3yng@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Require pahole >v1.29 with GENDWARFKSYMS and BTF
 on X86
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paolo Pisati <paolo.pisati@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Sun, Apr 6, 2025 at 1:21=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> On Fri, Mar 21, 2025 at 8:28=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > With CONFIG_GENDWARFKSYMS, __gendwarfksyms_ptr variables are added
> > to the kernel in EXPORT_SYMBOL() to ensure DWARF type information
> > is available for exported symbols in the TUs where they're actually
> > exported. These symbols are dropped when linking vmlinux, but
> > dangling references to them remain in DWARF.
> >
> > With CONFIG_DEBUG_INFO_BTF enabled on X86, pahole versions
> > before commit 9810758003ce ("btf_encoder: Verify 0 address
> > DWARF variables are in ELF section") place these symbols in the
> > .data..percpu section, which results in an "Invalid offset" error in
> > btf_datasec_check_meta() during boot, as all the variables are at
> > zero offset and have non-zero size. If CONFIG_DEBUG_INFO_BTF_MODULES
> > is enabled, this also results in a failure to load modules with:
> >
> >   failed to validate module [$module] BTF: -22
> >
> > The pahole commit that adds 0 address DWARF variable verification
> > was merged after v1.29 was released, so later versions of pahole
> > shouldn't have this issue. Require pahole >v1.29 when GENDWARFKSYMS
> > is enabled with DEBUG_INFO_BTF on X86.
> >
> > Reported-by: Paolo Pisati <paolo.pisati@canonical.com>
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
>
> The issue occurs with
> 47dcb534e253 ("btf_encoder: Stop indexing symbols for VARs"),
> then fixed by  9810758003ce ("btf_encoder: Verify 0 address
> DWARF variables are in ELF section")
>
>
> Perhaps, does it make sense to do this?
>
>  depends on !X86 || !DEBUG_INFO_BTF || (PAHOLE_VERSION > 129 ||
> PAHOLE_VERSION < 128)

That's a good point. I confirmed that v1.27 works fine too. I'll send v2.

Sami
