Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B962580CF
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204103; cv=none; b=B34k8HaEnbCTjXb3xRkKi+BewiS3746kfGGqKxCEihmGPqL39+hpELgeS1U8kbsMa6out4daGkZJEetes5/fjngtGqxPjsldnjzdAQILXWmatcdTIx8SUHhHDhT01KuSBDzDVPqyySYWlK0SPD8U0e5uDMJuPxxx5YXUfWNijIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204103; c=relaxed/simple;
	bh=ZpXrG2sN2wi6UN4HqvAALsWh0lmAcUxywTgURpW7JMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DL+QbgKkWThHVI/p2NNSb+m70D0rOuTzoe+2Oqx72DAT51lmNF4aVyPNE/DQWv2f4vz58AIGUPA71vLKZGLCMYmcIYHGaKV11pKBD5GVDXAtVrceZqjj1vQy5ja9AHplODQxNQPu9Jc+EPm8Qt6+pIJ7ilu0JCI6d6gxmhvE/IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VnXiivay; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VnXiivay"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d13fe99d03so388185ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739204101; x=1739808901; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpXrG2sN2wi6UN4HqvAALsWh0lmAcUxywTgURpW7JMo=;
        b=VnXiivaygbahmSWYwFaeJOou2rM9V6G0Gv0fddEF1x0LU9ytf2NlNgt6/vfIGNbpKn
         YdRMy5QlrdmNidedTrJZy+Ii0uRqLJDqoQ0JmjPDTN9axSS2AbVCuyoM+cT4l1FvN8+c
         EIvQm0YC3FXRGoZ/bB1gBrQYQ2t5gMP43mp6oJ65CwpsQBaO9nFzRa8qoMJt4ws5z8R1
         O6SQig4fw6uYT3bhuGCfXNtfP+AQP03e0FCo4DpIm2FTmVGTGrv2XyUOoN6BAAza7iQ8
         WTOMpZABJ9eoEBsANoCmZZajq6TFMY0p2teMYVSWOnZN7+TINxrbIzdd/qzpDoJwXO/Z
         9SFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739204101; x=1739808901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZpXrG2sN2wi6UN4HqvAALsWh0lmAcUxywTgURpW7JMo=;
        b=Ey93kD9PO85BQSx3tPnVNPW8fzrEGrskOBE9ckxJbXb1Z0Dmaq0HlntVF3yjSuD4Dc
         xU+0Uj3CUFFNYF4LQW0JQUK1PXVFjvFXYXl/5xesrS28VTv9oPHM+jJ6Hn7O55Xj9lPO
         Mg24gEfVzI5nbNgZ5U1Rwtct+/nDYGXzVNReViICzunVOBNZvy+zO6H5bITDTlaPgkiE
         Xxrn9kJY1GTGUrh2pVbz+vDLXynQgc3TZIhZmbEv9P1tAfyhBsBa6Lhv/rTFyPcwfihv
         otP9u+D3/pa1LnLJZ28YLFIsLAhO9vDLDG+qysa3ehRE/WAVLo+VAQQOoFsbhJBO2cOp
         OAhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBT/q5kLsL9khCrHrOhRjA9ZWtqix91xld59m7iw8rMjflEs9QzwKZBJOXS8p02Y8qyLF9gu699wj/ebo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD6TTTDWkj4lbzkKB8stRJcIKmT6Yr/iwRgX2ctLN5urvcKBL4
	W3w2fcyB5o2fiMnWB++n0RYtexOOlZdH9y0/WCYyiX/H4r5iX7VWXCQO/GFbiJKaDdjzQyi3uVs
	SIhA0pk+wmnWI6tDi07Zqm5a65n420G+D/Vr/
X-Gm-Gg: ASbGncsGinjkfo4YJoQ2OSgrZxUswJqymTLUzdzykzv5AvXFzxOkahbmh5VNz1uFj8X
	4938iQfUEMJZp4q5ORz6AzgyrocfJsLpvGfrwT5vPGCl1JD6d0Mx5Rw/Ec+DJ7vgHDp9rB/nMnD
	PNKy45ogy+pxEWNz7PkA+W/9d7
X-Google-Smtp-Source: AGHT+IF0F+MN337EGtx3MgZDKjVRiYrWMi34Aaeh7u0FXEkx5GRN2Sri6JuckHmlmUmGxVz1Vu080YIFGVuzEeT3MUw=
X-Received: by 2002:a05:6e02:16c5:b0:3d0:5855:85a3 with SMTP id
 e9e14a558f8ab-3d14cc6576bmr6276765ab.8.1739204100912; Mon, 10 Feb 2025
 08:15:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204220545.456435-1-linux@treblig.org> <CAP-5=fWMp-ePPHUsBD_pe5NPoyCpHVZ2gzSn1HRyu_gO3Ghmkg@mail.gmail.com>
In-Reply-To: <CAP-5=fWMp-ePPHUsBD_pe5NPoyCpHVZ2gzSn1HRyu_gO3Ghmkg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 10 Feb 2025 08:14:49 -0800
X-Gm-Features: AWEUYZlTnPSbdHY0P6JUo3a7VHYIiUQ9YxMPf6d1ews8ZaqkgkoWKjrOhIRJWc0
Message-ID: <CAP-5=fXHTnvxVOGSWjGbodMH_rKOqfOV8+qkQDCSWf01LGSzRA@mail.gmail.com>
Subject: Re: [PATCH] perf: Deadcode removal
To: linux@treblig.org
Cc: peterz@infradead.org, mingo@redhat.com, namhyung@kernel.org, 
	acme@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, kan.liang@linux.intel.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 2:11=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> On Tue, Feb 4, 2025 at 2:05=E2=80=AFPM <linux@treblig.org> wrote:
> >
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> >
> > The last use of machine__fprintf_vmlinux_path() was removed in 2011 by
> > commit ab81f3fd350c ("perf top: Reuse the 'report' hist_entry/hists
> > classes")
> >
> > mmap_cpu_mask__duplicate() was added in 2021 by
> > commit 6bd006c6eb7f ("perf mmap: Introduce mmap_cpu_mask__duplicate()")
> > but hasn't been used since.
> >
> > Remove them.
> >
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
>
> Tested-by: Ian Rogers <irogers@google.com>

Ping.

Thanks,
Ian
