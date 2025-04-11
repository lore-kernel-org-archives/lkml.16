Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DDE298CBE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 23:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744413235; cv=none; b=UdqgojqASwUUHhkHHa2FzPU6LeWvEoSYM1nlozUYqurZRvc1rZAtJV/kje5uSAaINQbpp88q+fx7fG3x+3kEt24UcePjJjyBzo6zuJdHTEf6roTnmpaAY6A7Gub9EYUlyc6TykBaHXvGc+1MsJNNv+x9V7+0iNc6ncRDS6Qp670=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744413235; c=relaxed/simple;
	bh=ZuIcrKzR77S3rywuzIWFvcaLlqxr+h3zktfH9J5ndLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zg5MBV6QupKVEUGVO2d4g/ok1EH8nAV6wOcYhjcOE1DP4wfWa4xJiPIasVL5kgq0td6/4Z/YiVNutdP9PEGyl7nVmNKZ1/kLzXn4hzQTxBubGstgSkf/lEKS5aXu6r8nP+eTonbxY5T5UbWDshbAKtXKP8xl5Zqs3+t1JHbaGZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XkkEmCMf; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XkkEmCMf"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7020d8b110aso23214147b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 16:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744413232; x=1745018032; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKlZigizjEVKoGnzIAZvuzGR7lV+iJHJRXEgqXvc8+0=;
        b=XkkEmCMfN0uJqGZXi6WRXay8/vI6a3m9oAhYgehkxBT0V/1/RiVBzbByGSwUTK724j
         6olLgYKeTvxgbQc6FBbwy0vcS7ET6UBghEGUbQ8jV8PpDAGDIqyTW2XLJ6KzgwimnCv2
         SxmY5S3NFr+9DS6cH80Zmn2T61wqd+0cWJ6qevf0jJsXzQkYabVmSZ847H9CSRY9DdiY
         sfnar4tVdhGSUtteT8kLFZpZRh/ODtVSGxtEAzGZkAyrIc6SgIufDeybiHIY4XK0BrPe
         H1Nfw0Dsp6DZUAv3xzPyLHyvbosk4WkuHW4iStRmYhNGPfCg0wfEHoEeHQSW9kkXBxXB
         iDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744413232; x=1745018032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKlZigizjEVKoGnzIAZvuzGR7lV+iJHJRXEgqXvc8+0=;
        b=fRf83S7+PZhEbS6HirCvLCO6cIdAZ310LquyEvjRN+Au6y698koO5RyUzvodhtskLB
         h9aURwOQp/z5UfRmcOGLmE0lCE5gVC2yxzNXIsCAXD8ZhUaXACsyyu8tcpNs57L4TMNS
         HiuP0z1TCEYm9yC5WUeIcs56MT6qNfV44SZPW48H3HWHgLAJRj7jkRqYxIBYioqkkpB4
         QZj6wUqUCCbwTc5YKA1wxXJ6FbmbMGSdCiyQcjFMH2LX1s4qf5rfr1Cp93IJ54rLqc+Z
         aDuqyATCYDG4sRy57WgwHt8f4h65tWZ0VGT1M9Stjjy/fhJBttpp+yLm1iSqnph1vqpz
         X46g==
X-Forwarded-Encrypted: i=1; AJvYcCUfwX3X+hc/A8iO3ceB5Ff6C+PTKrz8O5d27P24T+voNvdOCMDPRTICBr60cthqBP1oBWSfNxrWweP79hY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjRnQppUpnLihcEoyDHUSo7mPhvmxWWH1htKMTWiKZ1c8HBYhG
	v1occnTyIe4Tu575eDaO2qYUdi4j3wCrDgIEGQ2Vvs74+6kQ1VgEo3TNh0tmOsWgdWxJvDhRdUa
	Uqx6DoKHoky+mAy+/KdEVZVrq951Rig10bRpo
X-Gm-Gg: ASbGnctnkWEs8PjUQK4eMZI+PG8HSeAsT9kvYVfOtY+F6WG3gZJRZN2r4Y1yc3IwHHo
	bkDnusa7VT3K0HxGGI+KAWTFtqScJ79Ob8hpWuKJ3VmAy/H2ZpslfIUO/IMCi3hlzBIWtORhKle
	2Wnc+99yrW8V3dx7WUgalGUQ==
X-Google-Smtp-Source: AGHT+IHUa0aOwFiR93RonLdgGAycz902QQYijJ1KESM3WoGwo/vcnDBRRDtj6oj7TNBsL6Aa9rmB1pjYuwu+8AZzwxA=
X-Received: by 2002:a05:690c:f93:b0:703:b770:80fa with SMTP id
 00721157ae682-705599cd6e4mr85757587b3.13.1744413232272; Fri, 11 Apr 2025
 16:13:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331213025.3602082-1-jthoughton@google.com>
 <20250331213025.3602082-2-jthoughton@google.com> <Z_mFxiXcWKcxRo8g@google.com>
In-Reply-To: <Z_mFxiXcWKcxRo8g@google.com>
From: James Houghton <jthoughton@google.com>
Date: Fri, 11 Apr 2025 16:13:16 -0700
X-Gm-Features: ATxdqUHr4RtBhVEB1WBBU3luDedsUJxjRd02o3MEmhcbXrN14SY5_nC8Tj2kKog
Message-ID: <CADrL8HWum=2uJu6N23SaWHd4r4Pu96GbEqELRms_tq8gtMBbMg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] KVM: selftests: Extract guts of THP accessor to
 standalone sysfs helpers
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, Maxim Levitsky <mlevitsk@redhat.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, mkoutny@suse.com, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Yu Zhao <yuzhao@google.com>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 2:12=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Mon, Mar 31, 2025, James Houghton wrote:
> > From: Sean Christopherson <seanjc@google.com>
> >
> > Extract the guts of thp_configured() and get_trans_hugepagesz() to
> > standalone helpers so that the core logic can be reused for other sysfs
> > files, e.g. to query numa_balancing.
> >
> > Opportunistically assert that the initial fscanf() read at least one by=
te,
> > and add a comment explaining the second call to fscanf().
> >
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
>
> Needs your SoB.  It's a bit absurd for this particular patch, but please =
provide
> it anyway, if only so that I can get a giggle out of the resulting chain =
of SoBs :-)

Ah! I meant to include it. I'll repost the v3 with David's change to
patch 3 and my SoB here. Thanks!
