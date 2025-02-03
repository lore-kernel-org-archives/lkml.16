Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66C017C9F1
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 20:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738614167; cv=none; b=HEKeT6MI6LS3DGPr0Q0oiaVkldp74xVJJzQezfNoG+bT07j3TrnAy0CmQeOrLQGbTZu3y2EXYjFxTiOIdV71fgpt/refoVV8OliNRBL0zTFq1yEOpOJz94H72vkmpHI/WnREFWN1tBU1QgpZz0OjMr1fhE/tRqOBxkjVKRVt8EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738614167; c=relaxed/simple;
	bh=KlFhKtwt41EVszJlJwCZmyzl91BMVLmz70yB0Nm6eXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=RJEgvjdKsOHUIdw1rzKNjRy6CFf7TRTmZz2SvUhMh2TyK15hPTsMqr6nP8Z/gi7YNb7/C+3aDcZp7YejBzBMoxkQPk8tG+Japd114Crg2H0Csw0Z2FDFU+qgxd3nQkpCn0owGEYYmnLyGtAsAcgNeg3RCOYtQF0LJU5aRvFO1FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNSvXxN9; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNSvXxN9"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3f57582a2so11611460a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 12:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738614163; x=1739218963; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/XEdmScHeWqM1bRv4Q12lO0Ns2gaJHDTi6X8kScdIVM=;
        b=bNSvXxN9jrHL2v3eKTcDLOJZWJSUblLrE5/JCJ+PZPGTivadzNJB1rTK56bsVgIZa/
         4bGQ2jVmwjQh7BhAZ5EEALVriCkUQfdv6+eD2kM4jPBVy5gSit7ukqrmiorgx5xsiBP2
         I+ktJeT+6Axd981nAihQh0aC1/EsOugRmUAsR/styi7fzCekCBNGDAp7oU/w9fOQcPDo
         A2wdyOaomLZGyCDM3DmbZfdYoCK25O0BqnDLWxvWQPPC0uS0okb42vmWs/y5dxEHbVQM
         eeIB7hrS58S42URLYTuJuVeJnoiSkVeFd4yUX6kAIVIpFbPVpiEgMp2UAg6zoowl8nIS
         OHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738614163; x=1739218963;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XEdmScHeWqM1bRv4Q12lO0Ns2gaJHDTi6X8kScdIVM=;
        b=fnwC9VONn1cBiwklMXHAIqd6rYeBKdaOdLCME721Tci9TDEe8H2sB0HjonMYX919zr
         xs/E2vvpur4ZA2axmxq11zZnVZjYMGFU/MDZaAZFHYOvyIvPhQyaoXVF3eeYdig8WCF6
         KxA/Mu9Zpf/aiy8Cp8GeG0A4ryLoUl0OajzZJzxRoH317lKnCe0A0ql1xZMOBgxF7nhh
         rx7TdirBSY+eBjVh7G51hCdzTk3lwZ5+HyJRTpJBRbNcql+f9HfBQgbaJz3sZsXEzQtU
         BvAFdcCv2vsJq44AGOiOykJO1LHfNGndqt6zhRAsdjS6NqgCvJjeAlQTgjM6uNydUIe6
         R0sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdOCLUQnyh5OTikMJ3tbHoSocXQZTQom5p/sgY3OipcPlMv7ZsgXhgxry+tD1NYdJS4TLATphMnbsows8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhrPQog/Ny+7Fwa9As0ES2e9IAST5hXuNJz3M4aZCzwT8HnbRF
	5UmipLY3Yw2iuj2Apv2+/QBfG5YQJju1zK/NNv/s4Dy4WsI2g5OWn29dQhPIAjp6FiXgTEdkQfE
	J9jOVbf09TgW9G1FEj9OplsVNwrM=
X-Gm-Gg: ASbGnctr2cxe033iclmFK40dpn0CXL/jGcYN7QOjo+7TkYhauwWxbc+5UMAka3vxjRz
	JKhHK6cHTM04VCSde/5GE37nFtCXeVpyAVxk1MhoIuS3NdH0kdZOaNdDaLMuxbiGfgn8VbMg=
X-Google-Smtp-Source: AGHT+IGvgaBMH46P7KpANrk19GqbklkRlrhhLaAdPBt4pSyg24m+XRUnyhqqrtq6buSipKpRAbgY01AZWCut1PowNAk=
X-Received: by 2002:a05:6402:1d55:b0:5db:f40f:1a5f with SMTP id
 4fb4d7f45d1cf-5dcc15d5c17mr516465a12.15.1738614162827; Mon, 03 Feb 2025
 12:22:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201163106.28912-1-mjguzik@gmail.com> <20250201163106.28912-3-mjguzik@gmail.com>
 <eqoac7dyanvez62nc5ge3lfxxxbjcln3k6nrz4tkrg67v55sdb@sosx2sguy5f6>
 <CAGudoHGXR-vnYm-wMs5c8EE448UeuEps3ecrf_g22Mw=9oQtLQ@mail.gmail.com> <2f3gjvg6zwp2xpkhb2e36ux2resnjdtxuinbbgnr57jdqesrm6@oau2dgx63fxy>
In-Reply-To: <2f3gjvg6zwp2xpkhb2e36ux2resnjdtxuinbbgnr57jdqesrm6@oau2dgx63fxy>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Mon, 3 Feb 2025 21:22:31 +0100
X-Gm-Features: AWEUYZlDF3XmDOIROq3wg-O1e8hHx6MTDVWUZYbjsd8zw3fJogSdvfceFOqPckg
Message-ID: <CAGudoHE4vTUQtSnp01ziqCXVm_qw9sBYnKe2Gbwp6Kz5NOp3Gw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] exit: hoist get_pid() in release_task() outside of tasklist_lock
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Mateusz Guzik <mjguzik@gmail.com>, ebiederm@xmission.com, 
	oleg@redhat.com, brauner@kernel.org, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 9:14=E2=80=AFPM Liam R. Howlett <Liam.Howlett@oracle=
.com> wrote:
>
> * Mateusz Guzik <mjguzik@gmail.com> [250203 14:36]:
> > On Mon, Feb 3, 2025 at 8:27=E2=80=AFPM Liam R. Howlett <Liam.Howlett@or=
acle.com> wrote:
> > >
> > > * Mateusz Guzik <mjguzik@gmail.com> [250201 11:31]:
> > > > Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
> > >
> > > Change log is a bit sparse?  I get that the subject spells out what i=
s
> > > done, but anything to say here at all?  Reduces lock contention by
> > > reducing lock time or something?  Maybe even some numbers you have in
> > > the cover letter?
> > >
> >
> > I did not measure this bit *specifically*.
> >
> > As one can expect get_pid issues an atomic and that's slow. And since
> > it can happen *prior* to taking the global lock it seems like an
> > obvious little nit to sort out.
> >
> > I would argue the change is self-explanatory given the cover-letter.
>
> But when you git blame on the file, you will not see that cover letter.

if this lands, I presume it is going to go through Andrew who uses
tooling pulling in the cover letter for each commit

but i'm not going to argue this bit, just provide with a commit
message which you think works and I'll use it

--=20
Mateusz Guzik <mjguzik gmail.com>
