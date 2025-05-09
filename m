Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1276D22D9F1
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746803904; cv=none; b=JKenmExNfL3AsBtZsxst3neNi5YeOPhew/AQpHXKlHxnjvcPEF71+oL/2Voxp3U7Aw9ae7pd8dzzigx/byfkQF4HvpXyUOt5KS78vBicLeS4PNSp7LN/+tMYboubiz6PPtria6Jgya/BMha3/kExnKeyt9Tkd+TSaYSEVzJg7X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746803904; c=relaxed/simple;
	bh=Ou/2c7O9OYGBPIiwgyVhzmRbde4rIGuem3JOLe7v0rU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OYBP/0Sx3w6Vyc0lkpN15BKHqL4zpqvtzPDvYUdl0NTUZz1JBPXJIwLKp/+fzhGM6goylbDyE0UTNnjVuA2ekxaPH+4pTLXlTA2+P3USyRVCKU9+m+ihw9O8OYLb0HBTV879qiKnySLyLsP+YlPH1gHfQs12DRd6Sa9OQIR3+3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mr3frn6T; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mr3frn6T"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b170c99aa49so1522390a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 08:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746803902; x=1747408702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ou/2c7O9OYGBPIiwgyVhzmRbde4rIGuem3JOLe7v0rU=;
        b=mr3frn6TCu4mRa8zW0nkmEP+lhzH9n2PBdYaA34uB1VUx2xzBGrKYE4CZoNisR1kgG
         TkhL3kAvR6bPMoRfPbPRcQHxGDDzq18jwfe7dZZRRUJiXEsTZL3EuCNMWvHKzJDdvIx+
         Cl8YAAqls6TvVsB1szhNK4R+Z8Vc/iSAdZJd+DyQ1joJL11GbAt9LFOOJQNeuFHLJMsF
         KDLni4LwhcUPCE5BFxO/hGS79uyq3Fh6pt/UrP5xuMGdgxmVBu8mOIoL1InN6Vmw7QAm
         A8rtnYqkVu8W4OBY/eOv2oaAh+azEucIWyWVZRDlHT0jFbCf8c/vidnxVD8vQrt8CB4N
         WRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746803902; x=1747408702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ou/2c7O9OYGBPIiwgyVhzmRbde4rIGuem3JOLe7v0rU=;
        b=SW5o6dKAgFQ4EIqk4dzXcIYb/OM0a+9OwnnXF4EmxWGUlxFs8q+lxwZZORfFmozD+/
         8uts6iY63MPfA19GQjAEqLjCBK1NtvU3R8KrO5ASE8llD/UdN2tDVmmp5WAW31lL+G7R
         oXe0o3ic2NLaHxbdLfie+A7/4+3x15431x6i/npR0EofWhkxNW4J6AZqCcd/HKR82CBU
         uMUYMRnCkN3FwaC6Vy6IY5Ku/cVH49dbKMe75atCsCdaAKp+5lMbqY9r4h8QF3iZ9Iye
         TfO43xtKMIMFQ8OjWyY+HM360ihQlvPAfL6NqdKJli/pG5TpV8n1wheMgsYnQBxT81cg
         ppHg==
X-Gm-Message-State: AOJu0YwG25dA1aw//ut5XwJLF/i0fsfHII+fU5KyirX52wGwi6RY6Q6X
	sLV9jo7ZPam/73DDQYyRP0I3Y+JkwWOlzH0Rf/mw5V5cJMibjtaC9nYzdEYSc/0oVNOIp+I+jCe
	Q58Wo3LFMUphcLIDCN380TGA57Dyvhpmq
X-Gm-Gg: ASbGncvHVLBHeThfPDktme6mCP7ua77gw0Fgq/tl7CbhHF1tZ+wgb/hSAlTP91MyZCu
	lqICkOM8ebs9tP+nl1ekIqavVNoE7pw6cAstgRZmhJ8OLmi1dBFO+5ZqLRCRIWYUI+p3vp0UF8M
	FRtYEakU4eamq7MYjCDS5j4Q==
X-Google-Smtp-Source: AGHT+IFavTRYJqKP/p79qLIdhsNGre72UoO/i/0KpCkj9eOThDgcoZRUeIOi7XoTXVTZhWIKhYPNnn/KfxiIv4JMnHg=
X-Received: by 2002:a17:903:2346:b0:215:bc30:c952 with SMTP id
 d9443c01a7336-22fc8b1b2e4mr48477415ad.6.1746803902226; Fri, 09 May 2025
 08:18:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALaQ_hp+TAgH6TFOy_DB0YpRYiDKNYH7LSL4nf03c1XWbrHFxw@mail.gmail.com>
 <6fca28e476396963581acf511999086b71d2ec4f.camel@perches.com>
In-Reply-To: <6fca28e476396963581acf511999086b71d2ec4f.camel@perches.com>
From: Nathan Royce <nroycea+kernel@gmail.com>
Date: Fri, 9 May 2025 10:17:44 -0500
X-Gm-Features: ATxdqUEPJMRnIEytEY4XRzctRBogO7mZ18tPNCRM_UKEzoO03OVPscaAtbz7gJ8
Message-ID: <CALaQ_hopH1XSi_wNMALdq=yzXVeuK+Bm+Qif2yLN2LCTtTWNgg@mail.gmail.com>
Subject: Re: "scripts/get_maintainer.pl" - "Bad divisor in main::vcs_assign: 0"
To: Joe Perches <joe@perches.com>
Cc: LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 7:12=E2=80=AFAM Joe Perches <joe@perches.com> wrote:
>
> On Fri, 2025-05-09 at 03:18 -0500, Nathan Royce wrote:
> > Commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> >
> > The result from `./scripts/get_maintainer.pl -f scripts/config `.
>
> Dunno
>
> :linus current
> -------------------------
> $ git log --oneline -1
> 9c69f8884904 (HEAD -> master, origin/master, origin/HEAD) Merge tag 'bcac=
hefs-2025-05-08' of git://evilpiepirate.org/bcachefs
> $ ./scripts/get_maintainer.pl -f scripts/config
> Seyediman Seyedarab <imandevel@gmail.com> (commit_signer:1/1=3D100%,autho=
red:1/1=3D100%,added_lines:16/16=3D100%,removed_lines:10/10=3D100%)
> Masahiro Yamada <masahiroy@kernel.org> (commit_signer:1/1=3D100%)
> linux-kernel@vger.kernel.org (open list)
> -------------------------

Something that came to mind with a subsequent report is that I'm
working from a shallow/grafted repo, so maybe there's something to
that?
I figure maybe there's limited history to query through.
I think Linus was the one attributed to that script, and I was aiming
to avoid TO/CC'ing him.
I ended up looking at the log online to get relevant email targets.
