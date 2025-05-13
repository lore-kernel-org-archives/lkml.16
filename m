Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9401DE3CB;
	Tue, 13 May 2025 16:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747155292; cv=none; b=iOGJoT/HwRhJfgdrNKB5OuxabbsDcAv00k6Ni1jGJSSTuiU+NkoF5qfSLKO5bD8bxt8nBiz0ougMonj5P+IunvvTssreRn/Ka8HAeQlfABZH/sVyTbE+LyqHs01NI+JI53VDhk/QCsbNs3eHxcV+Rzdpb3+CllhgSpA3RJrSCYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747155292; c=relaxed/simple;
	bh=YpxeMsclx/cfQojbduR8BOC1erNUrwzSXsBKptYtpqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UZpjkKa8v3Tr4mDbKrS7OaMXQOqugxu8kFDDPLCXAycm+e9q7GebQ2TaUl/99lpquN6hCN7sdyVupYOWHfi7FcpCfsHcxXDMybeCUZIKu6jGkIZMfOCw1n7YwG5aNAsbDcWtaT1qqVP156aNDGpO3bbbt12fZQoE2hqwMHsllPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTlZZBix; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTlZZBix"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-30a93d80a80so4748364a91.3;
        Tue, 13 May 2025 09:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747155290; x=1747760090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpxeMsclx/cfQojbduR8BOC1erNUrwzSXsBKptYtpqY=;
        b=hTlZZBixFpwqqlgapIGFuRACt7AKxC1saHyYDj53LDjLo5vYxlvj85w5jDaQWehILF
         Z/4bwRvswZqv5ojgA7jhu4Jtm8KS5r502cE0dPTBfcjBdl3hPsm3KNdZWSuVBJJVHWuA
         3HHBHppdGN5JFkGv67ppvC5belEspliXS2L5Y3BJ/K2gaC4pY+i6rQiR9osEvsHRclya
         bcJ0SOGEZSR87FpQ4R1keqYy9qC5lpgJHI7TxrjroWXqU7paQLWxWe/1NonEt0jWejWH
         qfnfVRenCD1z6ENhcvQ7F7YSAhlu+6r/sXJmVzyvB+BS2eww/HdZFJG7iVWO7zYM4wki
         DW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747155290; x=1747760090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpxeMsclx/cfQojbduR8BOC1erNUrwzSXsBKptYtpqY=;
        b=GTQJrcAltj82aW9xe8hSw8/qHxYBWqpLsD9koL2w3lYYsHiL1kLodyxgl+oEET276S
         wIpmC4hq1MSjo9Of6EfWztylbJ1Ht1OlyA3+EFU9dEtG78JweOrlnbdqneXeMdRdzobQ
         g0nA6E7ivNQ0kjg+XYWtELmjtEDn+TdG21r9DKccv3aVb90pHBrkHhiA0Iphq7gTwS41
         1XkPBHqEJTJ8Q2AiyafqgqAIFYEzTm8VcoT96KDBo7MvjCgj6u/3arGE2GFHkr+NwGCo
         ekl3VydW11EkzhWDOu26IJP+mZv0cvyRmz7Cqwn1INEqaznbE1a6NiRLFNQbOXSrGGxT
         ISXw==
X-Forwarded-Encrypted: i=1; AJvYcCX+M8TYT2Bm7vDhab0LSNc/XuJOBwjJrnSaIZaL8filX0Vz6rqHF+6SDtmvb58IQYu60KGOrZ9dXOrT@vger.kernel.org, AJvYcCXxyqKcdo3EgL2OQmi00vPI6YMSTJkzIcsMtNSzrO6UNmYTj+6RzXTeiYioQbllH3cZhHqOcCk4NtprGTJ3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+vRTdni2A6UPaKLdTi/I0jKqxXlZfX+dJSdDeh6rqokS+cEAK
	vzV+BavYA45CDRZ5BNm5YB546FQF5p+LBAD9DR6smn4DTknxwI2Sk/Ez5R0i/UOmvRo6xo5/vE0
	eVmGG10A+Ud0cUd6yeLOFhjt9Ex66Hw==
X-Gm-Gg: ASbGnctR5//Q8hJ1yjONaE0uANw4ESsHCjvyRgWmjnVLkY2H9xSAKIQxT0Jn9lTwQpV
	ED2gmMNlqoQHry2TzQTHcZoQBUHXrcI9eWL+4WO7RDRORBRofY8rNuHmsRxIByBuy7ZPqrohd7q
	2GacbCCNTRYTTChM/DGl/Fk6pvbBmpm/g=
X-Google-Smtp-Source: AGHT+IGpcBwCTyylzCB1E+/M0SUM/SN2419X676QPWEq491uYxj4BxNUdMxOkKFuz465fKh8cprvCMOXU8NpGolHRkU=
X-Received: by 2002:a17:90b:180b:b0:2fe:8902:9ecd with SMTP id
 98e67ed59e1d1-30e2e5d6393mr348466a91.1.1747155290132; Tue, 13 May 2025
 09:54:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241222002957.2582212-1-masahiroy@kernel.org>
 <CAK7LNATVrJLPQSCVTxKARm_4wk=Piem1ZHMA-8c8CfaZPs0H7Q@mail.gmail.com>
 <CAMo8BfKgLgWiTVre_zSy3SMm-tJySgmJpVDphtE7C1kFZsuwZw@mail.gmail.com> <CAK7LNATT0=TOT0jjC_vfS5Wi+oaenutRnVair5rbCqfPmRDpDw@mail.gmail.com>
In-Reply-To: <CAK7LNATT0=TOT0jjC_vfS5Wi+oaenutRnVair5rbCqfPmRDpDw@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 13 May 2025 09:54:38 -0700
X-Gm-Features: AX0GCFuymEaQEkOEg1g62dnFn6PvofrXfFQUkK1xmbap6w7MVBn7c6If6VfAG6k
Message-ID: <CAMo8BfJbMfw04+Ex5dnRjaB6+9K_fEp3BXkzr37UvtCxg0L+kA@mail.gmail.com>
Subject: Re: [PATCH] xtensa: migrate to the generic rule for built-in DTB
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Chris Zankel <chris@zankel.net>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 9:32=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
> On Mon, Mar 17, 2025 at 1:27=E2=80=AFPM Max Filippov <jcmvbkbc@gmail.com>=
 wrote:
> > On Sun, Mar 16, 2025 at 1:37=E2=80=AFPM Masahiro Yamada <masahiroy@kern=
el.org> wrote:
> > > On Sun, Dec 22, 2024 at 9:30=E2=80=AFAM Masahiro Yamada <masahiroy@ke=
rnel.org> wrote:
> > > >
> > > > Commit 654102df2ac2 ("kbuild: add generic support for built-in boot
> > > > DTBs") introduced generic support for built-in DTBs.
> > > >
> > > > Select GENERIC_BUILTIN_DTB to use the generic rule.
> > > >
> > > > To keep consistency across architectures, this commit also renames
> > > > CONFIG_BUILTIN_DTB_SOURCE to CONFIG_BUILTIN_DTB_NAME.
> > > >
> > > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > >
> > > Ping?
> >
> > Thanks, applied to my xtensa tree.
> > Sorry for the delay.
>
> This has not been available in Linus' tree yet.
> Will you send a pull request in the next merge window?

I will.

--=20
Thanks.
-- Max
