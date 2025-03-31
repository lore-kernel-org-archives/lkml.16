Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F9621ABB4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 23:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743465366; cv=none; b=EaIhjMx0yiNYS/EF83DUZ3sOCciv50HDo8hjgHPxQ6judZhd2uiTR5KbaM26pqGOgu1juzACqYQsen8JEAKTbYII0LU4HVykN9pDKr93rPxUc6GG1IL5jqXkVMKfX7M+fkFxWh1sbvYIkIprKGGytdvmbXt/cexTxfpglfhVwD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743465366; c=relaxed/simple;
	bh=UKqkDnVLHO0eb5VBLI3/oGn0MhxC/u8iF88E6GkzjKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aT/8B2Lp3qaTQv1daLallcZFbXfNbNwa76VSXGQsMf4rkaN/YnNDugYrcdvkwwQddsN2iSXT6JEUvBaN9ETbfRc1qDkGrr5LKwYNl2fbm/vVTXSR83g9mfKgq4Wb1DKALdFgdshaqn/iMBSZlW35Tz0YCRZClRyS8iapMLhEgTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=KQsnWNag; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="KQsnWNag"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ff53b26af2so1105111a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1743465362; x=1744070162; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZEq/Fka6YRBKENdOliwx1ILIyB+IBRwt7XPFaRfOBxw=;
        b=KQsnWNagD6ZDhUZtpVtFI+H4Ox2R08LWpfeKaFDty1HAmWl9fLT6lelWXvblamqjNu
         ptF+hBkmFeRe5xMaaRQjrAH7/zDXylVw7ipYTrAnHXLOZTCydaolvTKRh69DsLlljxsP
         LKXoZJ+tCaDv3GfamDk1wZ41WvlXjPpYtnoAaK/xkf3HL6ZgepPT4EDgEIgWKk/xTzwl
         DM5/irPlIjTqTkhqXStwYo25NbOdbp4PSHN+DgQtP074+oMPnR71pVTbI9vwJcvH99lC
         4VK+r7DEKaaFQP+HR6yAUnwKi8JBGG4V3yxBYYQ+aVWsfJKIjeodpHwlKC4LDyq1KjI0
         0j7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743465362; x=1744070162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZEq/Fka6YRBKENdOliwx1ILIyB+IBRwt7XPFaRfOBxw=;
        b=CnQyqKY0RrWus6OilVGwmXl0HlX3cXYiyL4Uf/52NGH8N7kRgN5iiH9RP1Ka4tSzpx
         n0IVihPHshey7/OolFEDqU0XFsm9XaIHGgKa+N8eBQhCsQqYuCBwoOUyB/V3nv3Qe5mf
         lxYEFfl56hjvbs6iM0tfr1zeUk12LtqQSX6zRMuxQT7NrU62EvCzdVucjzZ6aLkTyLNV
         S5pjUY5K0taNJvY1HhCiXoy7OuUCHUTl1j76xravxC/wC647hjXljEmFEo8S/48/LGWo
         mCtc2KX6G0FYu+h7TR8bLVL6mv+Ho9c0tHSlj3p4mbaxAtavw6/CfnbSpLakkL/C9u3x
         bE6A==
X-Forwarded-Encrypted: i=1; AJvYcCWi9Npt1Q/hKahqRXsQnTSAj31+cMTd/zEsD1IxZ+/sfBOgYfOnWDEgy3lirmQmt+DraCX2mngZTIOP1a4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyydUNWLZu9jXVsEBZ/DqpE1LQ8rhbwi/K60rsiewtD+3YwJ/XK
	NOW94S4Uz8pPbVIrAzPPDt+aOSUKP8cJ9X7ltyii3sVaaHuc9decaRr0DjdOCV00W53+tU0MF48
	IzP/Zc6u0vHqruOoxQ2oNs/oWnvaBCJ7nP9jWZg==
X-Gm-Gg: ASbGncu2h3vwxyJYdaATLGWVLIdcQc8HoYZx/aiPbU5rX6G2H9+sjAeYfM1ZNetH4nQ
	H50KFKgwufw5XL7e+TOIs3tS3reuT87yFe6meQPaUmz5ML7f08XAr51VaHwAQxPgbnbCkL6sOy2
	o13Q+VthKXPiwnsufIlKZE2CQg
X-Google-Smtp-Source: AGHT+IEGH/a3rGABDa2/mh2XtCmOTSKeNqoAZuyY5b3WmNkh66z8tCEG7KQAC/uJtaXSfm9b8H+tCKGTp34mrusVN3w=
X-Received: by 2002:a17:90b:3e8c:b0:2ff:6666:529d with SMTP id
 98e67ed59e1d1-30562e93988mr179869a91.6.1743465362263; Mon, 31 Mar 2025
 16:56:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328193826.356257-1-jmeneghi@redhat.com> <20250328193826.356257-4-jmeneghi@redhat.com>
 <CADUfDZoXg39h-5gi+aVj2u1H6HC4Beyp2XPTrjJ_PMDPf11dQg@mail.gmail.com> <e22e3cd8-f792-4f20-9624-76e973cf4940@redhat.com>
In-Reply-To: <e22e3cd8-f792-4f20-9624-76e973cf4940@redhat.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Mon, 31 Mar 2025 16:55:50 -0700
X-Gm-Features: AQ5f1JqEc-i7jWqvdZxWprnCNGoZvK041yZkM41VIWbo0NwE3LXl8I8l3z6zTBs
Message-ID: <CADUfDZoNdUBuX06FB+jsduS=shgPTKxbr_dYdtS+adEe2hnVWg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] nvme: add the NVME_ENABLE_MULTIPATH_PARAM config option
To: John Meneghini <jmeneghi@redhat.com>
Cc: kbusch@kernel.org, hch@lst.de, sagi@grimberg.me, loberman@redhat.com, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
	emilne@redhat.com, bgurney@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 7:29=E2=80=AFAM John Meneghini <jmeneghi@redhat.com=
> wrote:
>
> On 3/28/25 3:49 PM, Caleb Sander Mateos wrote:
> >>   bool multipath =3D true;
> >> +#ifdef CONFIG_NVME_ENABLE_MULTIPATH_PARAM
> >>   module_param(multipath, bool, 0444);
> >>   MODULE_PARM_DESC(multipath,
> >>          "turn on native support for multiple controllers per subsyste=
m");
> >> +#endif
> > If CONFIG_NVME_ENABLE_MULTIPATH_PARAM is disabled, could you #define
> > multipath false in place of the global variable? That would allow the
> > compiler to optimize out the multipath checks and the resulting dead
> > code.
>
> If we #define multipath to be false that would permanently disable the mu=
ltipath code
> when CONFIG_NVME_ENABLE_MULTIPATH_PARAM=3Dn, and this is not what we want=
. The purpose
> of CONFIG_NVME_ENABLE_MULTIPATH_PARAM=3Dn is to simply remove the core_nv=
me.multipath
> parameter from the kernel so the user no longer has the ability to change
> the bool multipath variable.  We want multipath to be true.

Sorry, I just meant to #define multipath to a constant. I mixed up the
boolean value. If CONFIG_NVME_MULTIPATH is set, of course it should be
true, not false. If CONFIG_NVME_MULTIPATH is not set, multipath is
already defined as false.

My point was just that the compiler will pessimistically assume a
global variable with extern visibility could be written from some
other translation unit at any time. But
CONFIG_NVME_ENABLE_MULTIPATH_PARAM removes the only way for the global
variable to change at runtime, so it can just be a constant.

Best,
Caleb
