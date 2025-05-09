Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E6028F527
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788978; cv=none; b=DhRwyv42oam+9nPJau3XaQ1Ak62oUk+NFh3yb2LcJqTOpyQwxmMptdM2HkxPS7kFrHuNl7ZiMhwcqKY35FM9ShSAm62R2XBTcvDmxl4jqNdqh9r/mlEyxL0/w8XxlvIYfd5Ve9nb09F+VW0f6ZRNUmUxRHsCQuZmGg4ZBXPEfG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788978; c=relaxed/simple;
	bh=IvCseEsNXn2YDR22ofVS1EjuRoUQXxujlI0mWYKfm9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kUjsFdwxB4VcMaqjtA6bPu0A+gfEGvsmKIzRcaEAPeYCnHcDzNUgiEwwkbPbnodsqp4b3H23Ed9zscFJ5a7a51WQQ+uusi5LUDP3EB7xAhkDdK+DY4A3vOY5njF1PKIc5vSXZpRJ0GMQWn5BUv8IUtQ/R0vuA1lRXUvVAUIEpoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=CTZM7qNC; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="CTZM7qNC"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso3625592a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 04:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746788975; x=1747393775; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvCseEsNXn2YDR22ofVS1EjuRoUQXxujlI0mWYKfm9A=;
        b=CTZM7qNCzeXCT4ShfG3on48F/uNt8RWhd9zMnE6fTbQaLZFkQOLv5c2Uq8/coaOViW
         oi1fY/zQsqGHAT0ATZUOeT/kHTZNB1tXEJQQjb1S8QiaKnVOFOboZD/RLTv0/xR0Cutz
         sm0V5JCnG8ZY1PLu0zLuIU9rfHKAngzx3UgEDSK/DE/te+2rMxApjrZxYtTBZz/EJhc1
         T4svnDEK346c//j4et3wmo++YW1q+jRRdr4kb8c0kPHkDdPA9XFTqhb5uykN1MOhwf+g
         3lXAojt/wvkmZqELUbiXHdIDz8Azm4wT/QY/BC2H7n6pwZbG0aj9l+Y4Rof8by5c6i/i
         lBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788975; x=1747393775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvCseEsNXn2YDR22ofVS1EjuRoUQXxujlI0mWYKfm9A=;
        b=R+whovNvVblkeavPNkvhkIaQvrccLaxLUSUuDi62Gds51mpxDKec4+m27ptC34kiJC
         HAW1zst1bYocrnj1ZkFL/qKexX4BKIOWh8DTVljKOzUGNxl3P84pDMbHBejzureB4fwG
         T8D+YXwidH4g2fBlGuxEOKwidZbALSFkKDfjAnQ2XCIBvfwPCFo4IOj18DlcRkyV0LOo
         Xc+piMSxNjPjaFIG46AlLtDD5cRyG4X0Pi9U6YaciEENjKQh147me05mQ2pL7Lo3PZly
         C1a3l7q5z84sJMdZQ900C/CtalV7RZcKTcrOV5UJLqMV1YLSw1dohxUam7xzSgNnIE+1
         jLhg==
X-Forwarded-Encrypted: i=1; AJvYcCX2G0N6mL294lkw2Js5Ub0AfIgoLdG0Hr/ivMA4d9Y2xfpIX5A2YpgQgiS78Vic1NJ0tBPzAFXPJ3+LSSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzybZn5zfOcNbT43Y+4+Ic143us9dQQScL8+ZVne5dtcFng3m3q
	4fSCDwDHbHmDcWoHJlS4f2Tzf1SMG5btIc/+cSpQlHDwA+YEbbRRFBssFTMqZyetVBT4NewTj1n
	BDdaoo9bdpNMjbFBBWAlwYCv2iYnNh3unFfRfqQ==
X-Gm-Gg: ASbGnctoibRe9IpRyysqAIWhR+xxhOx4TYHuGF0fHjofJKyw/Y5zn6CKiN1MxIilDal
	T2dtQPzIhHEadXcLLKUUrym6rB5ruWWL1jd79puxCw2YA3tIJLpAGf1pvt1wg4PF3z0amL03Jw0
	F5m+nEgFTcE04U78Jb76coXs2Qjc0OUvJE5FhEyQCTP8+16nglq6rU2A==
X-Google-Smtp-Source: AGHT+IHolmFqWEGC4AyYal+IeZ3IwV5YHOWUsjQ6qySOfZum5CD2COEsMayA91FRo6y4k+ibRc9NvWuirdTrS8RhJ24=
X-Received: by 2002:a17:907:724f:b0:acb:5343:e75 with SMTP id
 a640c23a62f3a-ad2190afc7amr206746066b.34.1746788973864; Fri, 09 May 2025
 04:09:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321130635.227011-1-alexghiti@rivosinc.com>
 <4dd5d187-f977-4f27-9937-8608991797b5@ghiti.fr> <64409a13-1c07-42cd-b1ec-572042738f1b@arm.com>
 <84cb893a-46e3-408a-ba0e-2eff0b44d2a1@ghiti.fr> <20250508123046.GA3706@willie-the-truck>
In-Reply-To: <20250508123046.GA3706@willie-the-truck>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 9 May 2025 13:09:22 +0200
X-Gm-Features: AX0GCFtetDfDezkP8vUdVhHiVYD6YKsFtOYLD7hY4r0bKx1J-4Tcdfpu2fXv07A
Message-ID: <CAHVXubjZB-riBLv+RGis6ErS8NvU4ijVTgvUO06fTxPhbEjXfA@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Merge arm64/riscv hugetlbfs contpte support
To: Will Deacon <will@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Ryan Roberts <ryan.roberts@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Matthew Wilcox <willy@infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Will,

On Thu, May 8, 2025 at 2:30=E2=80=AFPM Will Deacon <will@kernel.org> wrote:
>
> Hi folks,
>
> On Mon, May 05, 2025 at 06:08:50PM +0200, Alexandre Ghiti wrote:
> > On 29/04/2025 16:09, Ryan Roberts wrote:
> > > On 07/04/2025 13:04, Alexandre Ghiti wrote:
> > > > Can someone from arm64 review this? I think it's preferable to shar=
e the same
> > > > implementation between riscv and arm64.
> > > I've been thinking about this for a while and had some conversations =
internally.
> > > This patchset has both pros and cons.
> > >
> > > In the pros column, it increases code reuse in an area that has had q=
uite of few
> > > bugs popping up lately; so this would bring more eyes and hopefully h=
igher
> > > quality in the long run.
> > >
> > > But in the cons column, we have seen HW errata in similar areas in th=
e past and
> > > I'm nervous that by hoisting this code to mm, we make it harder to wo=
rkaround
> > > any future errata. Additionally I can imagine that this change could =
make it
> > > harder to support future Arm architecture enhancements.
> > >
> > > I appreciate the cons are not strong *technical* arguments but nevert=
heless they
> > > are winning out in this case; My opinion is that we should keep the a=
rm64
> > > implementations of huge_pte_ (and contpte_ too - I know you have a se=
parate
> > > series for this) private to arm64.
> > >
> > > Sorry about that.
> > >
> > > > The end goal is the support of mTHP using svnapot on riscv, which w=
e want soon,
> > > > so if that patchset does not gain any traction, I'll just copy/past=
e the arm64
> > > > implementation into riscv.
> > > This copy/paste approach would be my preference.
> >
> >
> > I have to admit that I disagree with this approach, the riscv and arm64
> > implementations are *exactly* the same so it sounds weird to duplicate =
code,
> > the pros you mention outweigh the cons.
> >
> > Unless I'm missing something about the erratas? To me, that's easily fi=
xed
> > by providing arch specific overrides no? Can you describe what sort of
> > erratas would not fit then?
>
> If we start with the common implementation you have here, nothing
> prevents us from forking the code in future if the architectures diverge
> so I'd be inclined to merge this series and see how we get on. However,
> one thing I *do* think we need to ensure is that the relevant folks from
> both arm64 (i.e. Ryan) and riscv (i.e. Alexandre) are cc'd on changes to
> the common code. Otherwise, it's going to be a step backwards in terms
> of maintainability.
>
> Could we add something to MAINTAINERS so that the new file picks you both
> up as reviewers?

I'm adding Lorenzo as he is cleaning the mm MAINTAINERS entries.

@Lorenzo: should we add a new section "CONTPTE" for this? FYI, hugetlb
is the first patchset, I have another patchset to merge THP contpte
support [1] as well so the "HUGETLB" section does not seem to be a
good fit.

[1] https://lore.kernel.org/linux-riscv/20240508191931.46060-1-alexghiti@ri=
vosinc.com/

Thanks,

Alex

>
> Will
