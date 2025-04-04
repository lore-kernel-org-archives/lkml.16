Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B879D1EFF9D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 15:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743779239; cv=none; b=SU8yKsHLtoch0z34BZSVwyiqy0RomVbMTvgsGXeyKwEx1OVc9u0zNmH3xsGOa9Pltbe+vSbk48n+k3wL/HPIm+8/O6bJanTM7kyyfBt+F/63dmlC8UaN8fK2WxkfSgd5VevBstI0BuhzagBpFhR/dketaEc6fbsKAKKpZCZ5A3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743779239; c=relaxed/simple;
	bh=zjH61skezqD/tzvm29Me2P3Co+mAG43uQMEf1jjgfpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S/SkHvJ1WJKPvrMlfhS/00f9RsN5l/emBZaiVg+mkHeSNAZYqtVSuc3VTZH4KZiisEckJw5AlKkwwD5SJGTIkZGdhT5gncWYLG2hNbebq60QID4hM648cpWK3VuzLN3pCclY5h22g0bYVMcJY5sNAc9HfL7W1VZDbDClpgEcb2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fKhYDN4I; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fKhYDN4I"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so3833981a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 08:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743779236; x=1744384036; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjH61skezqD/tzvm29Me2P3Co+mAG43uQMEf1jjgfpU=;
        b=fKhYDN4IWujKw2EwXewviOKx7np1F1bTg4uXGipT82BkDEecyDAxNFguvM1/WqEg5n
         Kz1ZM08Fq2DhDCiW9v15l7MHlSSqKPa2Yx4dE14i2/qmUkYRQxYiXjKzcXO55EnpI/dl
         w4+Rb+T+6q6Tt5O2+e1OevxaqnooXHjSQ2+d62HtzveGgBgpELfJ/KXJ1agP5RwsYDot
         whE4LAKy4XsyTWE+k9d4S84L0jFkUrCUhr9jGfBsRAnY1Ws9WKXZN76E0P5sROXC3z22
         g44t+dtW91Jfesjh5iiLrAidw6dAcN0y7gYofv9fgOHzqTHUfBlu/NFYs3wMAEMpG+ND
         cuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743779236; x=1744384036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjH61skezqD/tzvm29Me2P3Co+mAG43uQMEf1jjgfpU=;
        b=ewNdDitmUf5W0Y1+ZqDMfQGu5AYwddTrLUF7xzh8itate/+HYAcTFSqZEz6FwHmdIP
         1AnNLEJ8dDh5mL39EqURvrtMGJrHgAaeoS9t7rH5j3OQoq9TsMZOPW1qslIrFHIPKmqm
         zPWAXp0wRDzdaAAZyaIG9cRNDEQfDKMu1xt1TDVZeee7vPJmaGMPvss49nvG6InW7tU4
         D5j0riSnQxktzwnjc8YDokWzf1penh60sMzcGMNGYW9ybwQzk/U8PWeoExyJ4umKDM0s
         ZS8v2FuMjKtEvqzlswLtXDBJXU9+UQm7bkQ82pD7jR08KpSlS29XV5lcfOqjgeqTbujp
         rmgg==
X-Forwarded-Encrypted: i=1; AJvYcCWJJVSDp8EIUgWuHHV28fNp3PRc5DZs4tY3o03/REfMwVaMx5hFGoqlVHJA3sUpeJxIMBGidHMRfTWBzVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGWY3ydZHXArCKLAikX5LZLcR126wGYWH4tsq5MoCIEVOXY376
	Kugxtg+SRQ6sqC+1c2bw8c9nzChot3GRcfS2UsrFiBDXHGLkryBIqCQjbgvDrkvPy6WlDujK1kw
	nqbC768kOcmWnJDEG4rI+sKwLqwQwm9rkMSap
X-Gm-Gg: ASbGnctmqkqdKMaJowAChRijwiSJozLCKbrRhyERplnUm2zylq9nlAft4qNiTY0Kmxe
	x2f40qeEICz4ufvj7baNVyLgFtdFuZ2/M+auGCl3wqgkaPPMi1nlaUw8d8IoATWsWuJPDByzVm7
	tpiFTHAqO0BRq30Cg0yhWt/TKLMA==
X-Google-Smtp-Source: AGHT+IHoHYIgjnTqNf/koXP1ZSa7N4fhejRbYw9l8KvhvhtNeBsuIxWeqajQ7XAq8z7bAk2STRMZANtpn6Q1WObbEIA=
X-Received: by 2002:a17:907:7f90:b0:abf:19ac:771 with SMTP id
 a640c23a62f3a-ac7d185479bmr395006366b.2.1743779235688; Fri, 04 Apr 2025
 08:07:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404082921.2767593-5-ardb+git@google.com> <20250404082921.2767593-8-ardb+git@google.com>
 <l6izksy3qtvo6t6l3v44xhuzmrnl2ijv7fx5ypvaz7kjxvpwhh@4zwlvxyfrp43> <CAMj1kXGwnTkb1bUDaRpkh3ES8thcUVQE7+qgfZQw+RORtvtv-g@mail.gmail.com>
In-Reply-To: <CAMj1kXGwnTkb1bUDaRpkh3ES8thcUVQE7+qgfZQw+RORtvtv-g@mail.gmail.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Fri, 4 Apr 2025 08:07:03 -0700
X-Gm-Features: ATxdqUG8b4-wASJzngQs_3ZF1ziQG91_baB_efphAg_aCiOaBYtqHZwyn4feFV8
Message-ID: <CAAH4kHbxMDGQy3v9ef1ZdqK0TNzpm==BJgx1KiUpRP-CRKDx4w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] x86/boot: Implement early memory acceptance for SEV-SNP
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Ard Biesheuvel <ardb+git@google.com>, 
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Borislav Petkov <bp@alien8.de>, 
	Kevin Loughlin <kevinloughlin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 1:46=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wro=
te:
>
> On Fri, 4 Apr 2025 at 11:43, Kirill A. Shutemov
> <kirill.shutemov@linux.intel.com> wrote:
> >
> > On Fri, Apr 04, 2025 at 10:29:25AM +0200, Ard Biesheuvel wrote:
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > Switch to a different API for accepting memory in SEV-SNP guests, one
> > > which is actually supported at the point during boot where the EFI st=
ub
> > > may need to accept memory, but the SEV-SNP init code has not executed
> > > yet.
> >
> > I probably miss the point, but why cannot decompressor use the same _ea=
rly
> > version of accept too and avoid code duplication?
> >
> > Maybe spell it out in the commit message for someone like me :P
> >
>
> I assumed there was a reason that the shared GHCB page is used early
> on. Maybe it is faster than accepting memory page by page?

This is correct. The MSR protocol does a round trip per page, whereas
the GHCB page can communicate hundreds of state changes per round
trip.
>
> It also depends on how important the memory acceptance is for the
> legacy decompressor - AIUI the use case is primarily kexec, but
> wouldn't the first kernel have accepted all memory already? I.e., if

The first kernel may not accept all memory due to the laziness of
unaccepted memory transitions.
I'm not sure if we have the planned background acceptance process in
place (probably not), but we
can't expect that to have finished before the first kexec.

> it is slower, we might not care if it is a rare case.

If the GHCB is available, we should always prefer it.

--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
