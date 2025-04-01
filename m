Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D673884039
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 19:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743537266; cv=none; b=by5DyAYX0q73XONQWwcC/rSpIcMOMXnY90tjuy88h7VtdnK3IVK025nHyaLmK+2NRXXYSHmUx7liwfD8TG45k0GvWiiPABJk92Tcow0qtao7jmthxzrNlR24fH1unkDtUcjBSvpECMf82UfTmyZppVZYHsd3rDXiMIX3YcTdG2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743537266; c=relaxed/simple;
	bh=de/BtIj5To60CHP517asQruuMVZmw7HGpY7NsHjlU38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U2lpJaAwhc9nAy+8n10RXExdXuZDu2E4iwSmM/RV/8ORhSgKJ5SQ2uxE0o/3ANYaG6ftpvnDhrhgH15/8ZxP90rieyS8PfGl/4JG+FZS+bufnkOFlxbMRCinS4jwhfArcVCwEPjHLvvLh6to80KQVr9/kR8dpJFAu4lUROBAAcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RNt2fYjy; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RNt2fYjy"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2263428c8baso3015ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 12:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743537264; x=1744142064; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=de/BtIj5To60CHP517asQruuMVZmw7HGpY7NsHjlU38=;
        b=RNt2fYjysvv6091cvCbVZTN0pSs9MX3rbcwS+FXf0TvTyPYMttWIIJvfak1180Ew41
         iCfsUt0Uk0u1JnypaXVNgkoUSkA91yPeOxCxvcrfWJn6r8C+OhIGfWb5+KRMtcXC6q2f
         /iKUHB7bRIMw1Qzx8vXfhjzDWAdVrpRPY4X/mEmezU+xLKMsc8cg820LJSKsd6b3mcYm
         /OuiIYZxD2mTrhfbJtTEi6WZRVCI3pHtMoF4oB0ocoixH+mGpVb4ETNFvGkoLIA/HF8e
         iTCs7v0bzEG+/Kyuu7jTFFieSfv+3f69F1RrwM2eNO7cah/89yGg5O80ptNEzvaAqkbx
         sWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743537264; x=1744142064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=de/BtIj5To60CHP517asQruuMVZmw7HGpY7NsHjlU38=;
        b=vgRbOFziAcvvDEW+e9J2cG7XT3sSToj80xiKMiLvFpFt/umriWK+Tqsf+lH6uDXbZt
         gtGSSvPL+yydNoM/Y6ZC+vAarm+nBbqj1Ngb30PkvtfR4HjuNhkZbRAPNK6vSHJ46Ntd
         F8eB+G+D2XiNswKcH7YOw8t2wX5fQWNOWjrC7rQpCunrmCvfGChDG7Npjm/n6dqs6Ykx
         EcbhRBG9Ak4YP6jMpu5kXDBLhVDYwNn7PE9mSyYcCiPJNYsdUvbolmizN2/els8/k0dW
         03K5b8ecztc+a2WjNdXpI7ROXtMtPAeAGiv2qjj5Oi12TWTtPIRbBzUkJ5JXv4WnkXQl
         U58A==
X-Forwarded-Encrypted: i=1; AJvYcCVQBHPUT6gD1OV3Rlubqsoh4AxeD5dIRD9y/dK5MGOQ7y4347CBCgFCP3az/8tE2S/dVI2uNmRpuNDtC4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEz88Sco8/vGPSqLZ87hXbKTHwp4VlaVq+VsxK74BX6vP5kMds
	ksoSQINumk6mX9A5N9lKyofNum8Hx0+UgzhlKbiV5L9y0gOZvP+iGPEMmkjs5LIqLzl55Vj19yL
	yH/g7rV45o+isRAC1us+pcq1obu9IRVq3EEXl
X-Gm-Gg: ASbGncvPdgLrn5ab4GcF8PKqDNwJYsAYNcOQQtCLq1rzbqBG4Q0tlWSV4I+0ajOdP4o
	FBz5UqYszsHO2BdxhIU3kgY3wxA55C6Uz6l6ZnDtIteXwUmwveqoqqqnv+O+3zLq/lpjgTXMCk5
	lHh7H/kY9tAgTfBdWD1pGUgftg49cdfuArHjFCi5TbiePhN+Tcv2Jd6DcH80oM4oFx5A==
X-Google-Smtp-Source: AGHT+IHOs9BdqrTvFPQWqJzaQfsrpiXeP0qaabdPaOzhGdnfECmfbLNE+FP+wHg/1tSnxeoJnrwfErtVjaEBIcva9iE=
X-Received: by 2002:a17:902:b68e:b0:224:1fb:7b65 with SMTP id
 d9443c01a7336-22969e99900mr464395ad.22.1743537263944; Tue, 01 Apr 2025
 12:54:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331172759.115604-1-leo.yan@arm.com> <CAP-5=fVsgahBhOEOac52PmL0V+n1jqAxzf7n9PVWgWsxq9TvgQ@mail.gmail.com>
 <20250401091422.GA115840@e132581.arm.com>
In-Reply-To: <20250401091422.GA115840@e132581.arm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 1 Apr 2025 12:54:12 -0700
X-Gm-Features: AQ5f1JrOuWrNQZJezs0L3XR8GhYfLpTvpu06rrvr2p2w6K3tJeuVBfouNq8Z_vk
Message-ID: <CAP-5=fUGLy9xGmMO+6PXvfviB4U8Q8O7H3iTSSqEf72vin8gDA@mail.gmail.com>
Subject: Re: [PATCH] perf tests switch-tracking: Fix timestamp comparison
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, "Liang, Kan" <kan.liang@linux.intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 2:14=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> On Mon, Mar 31, 2025 at 01:18:31PM -0700, Ian Rogers wrote:
>
> [...]
>
> > I'm reminded of a Java check I wrote for this:
>
> Nice short article.
>
> > In clang -Wshorten-64-to-32 looks to cover this. I'll see if we can
> > clean those warnings up a bit.
>
> I checked a bit and seems GCC has no this flag, but it makes sense for
> me to enable the flag for Clang.
>
> > Reviewed-by: Ian Rogers <irogers@google.com>
>
> Thanks a lot, Ian.

I made a small variation to the change in:
https://lore.kernel.org/lkml/20250401182347.3422199-10-irogers@google.com/
to avoid a subtract and just directly compare the values.

Thanks,
Ian

> Leo
