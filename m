Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3DE288503
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749651852; cv=none; b=CcesBg50ZFoZDfMAHGuG5IngYE/syLdyZSieTVEGY6bVKdnXJB9B5Zn2HNtfQnPH4QYKqmHsN2BaQR9ST4JotD49gxfkC6e49+v6cccVL6a4/GBg8kI+aPv9ns9rJ964JCVf7buRiHIdkX4QSgIhCnxkEuocaxjywxztIoLZnzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749651852; c=relaxed/simple;
	bh=+n2wxlhNO/5kmSj5JkekXPG3vsLUDhvGncEIlxfIMF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mns9RFjF7kZXht0vH1f59n6puCrkWVJt7uHFEwfQrsDdr3Lf5gQ2rQnDkLMRCNwmA5/jPs8hB32G9UHwdfHZMAVfo1SpELHvOgdyVotxt/CSeRxL79ZOl0XPy3njVmSQIBYRCEWxO2W9H86ezcoLJjSGCog19FY2w4b4rBzOHpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=fboq00SM; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="fboq00SM"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad8826c05f2so1281471066b.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1749651848; x=1750256648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+n2wxlhNO/5kmSj5JkekXPG3vsLUDhvGncEIlxfIMF4=;
        b=fboq00SMjpBc/dzR+nnXMmZDLpc4cY4Uk/8wUG0553GWJsGrpqT8xialuROWYUOgT/
         3Ys48/I2I6OUa8vHn18KMVkvpHqzfgzRFKuiPNkQaAgPWRzcRRjYXGrxzy/S5CQvAkxQ
         rnhfRmIr5HobqnCprThFMaaKeQG2s6sC6OREEwhCgIfEKPcnjILByz+aJKy29yOVXG/n
         31s/8/p34/yBuXNJf5ZSB/WUrEtj7ypG5E44PUuHGp85T5r9BhHloI4qjR7rLLwlUnn/
         fgCh+bk/DWCTTJS/F1FiAKF7Wy9F+VgSopHi05EfRKRWxWWJglD3tlP8vieJ33cpfMI1
         y9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749651848; x=1750256648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+n2wxlhNO/5kmSj5JkekXPG3vsLUDhvGncEIlxfIMF4=;
        b=I2XNipfGiB+u+ZpRkxGCw2Ro79jfLg91heTLfIvhgC8h+m9PEn257B/mr3wVw5PkP3
         CEQMUuzzLwxonGZKwwW/JtnQPSuD9yhSh0hSPbnhwXlOk1kXfyZzAApIAIkIAdqC2I3j
         j2YF0M0Fcvtby6jB/Cj86Pp+bQSIJho7OeJAylbrdBakj41buQEt7gwKH/Bl4SVdV3qo
         Fb+wNUPBDw7YhWfJj7iwM5x9rvpSU5AmslfaKqMfHydS2Zq7wYEZZSryGSz0UfBW5v0y
         qyjGYiqtcjOfdhQgxHERgPrFlFYF9V9ciGJMAuTfxHllwIGPShczZYRucii22X7zcD8m
         zgxA==
X-Forwarded-Encrypted: i=1; AJvYcCWvYqFViG6Fd4azSKO4mmxQDR2MyHRyjhwmYFHB1Zl6fpUyuZteKmLgNxm5iZtBt+ET+zkOZ3SqCcr1yD4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqQ0o5M8j2j+ckHRGhVD6BOpwccF9/+gz/1mDpwlaCLhkK68FO
	56AwW0ZnK2Z6XgnRVAO80bJXbRDjNWoHZj84gDRnjAElRdpkr7EZ6rUXy29la+LAYGPxC1P8/fk
	sBuYmVsjgFqJdmD9zrlimNkCoy5YZUOZUN/cjpVHL2w==
X-Gm-Gg: ASbGncti+4OjbgGwi0p3/rIhHVR4VpiwL6wSq9VbWE11Z5VG24OSi9F+n0VKevU2zUW
	F+rfwXr9CA/4kV/anUdsemYWVEpf5vM5XOu6iZB7Sn8XssZUW87CcP7rUZe4uSancBZITWGyUUj
	JVLXq38HV4idYJdPfDLX2k81OQRZmFIZBuqfLHHzRmE6dlA3503PsxK+i0jwyjSzdE9sS/gHkd
X-Google-Smtp-Source: AGHT+IHi3WuXVPV9hfbd1BQHgmHc2xgdYuuZf0M1hUFi8jc87uLtSAZ8i8Pv46mcKxcv8DLSc26FN718JaJ1toUbZkI=
X-Received: by 2002:a17:907:c0c:b0:ad8:9466:3344 with SMTP id
 a640c23a62f3a-ade8c8993d1mr286839666b.43.1749651847859; Wed, 11 Jun 2025
 07:24:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306082615.174777-1-max.kellermann@ionos.com>
 <878qmxsuy8.fsf@email.froward.int.ebiederm.org> <202505151451.638C22B@keescook>
 <87ecwopofp.fsf@email.froward.int.ebiederm.org> <CAG48ez1VpuTR9_cvLrJEMmjOxTCYpYFswXVPmN6fE3NcSmPPVA@mail.gmail.com>
 <87wmagnnhq.fsf@email.froward.int.ebiederm.org> <202505201319.D57FDCB2A@keescook>
 <87frgznd74.fsf_-_@email.froward.int.ebiederm.org> <CAG48ez0N_1CEKyMHdjnvwsxUkCenmzsLe7dkUL=a6OmU4tPa6Q@mail.gmail.com>
 <87zff6gf17.fsf@email.froward.int.ebiederm.org> <CAG48ez1z97sCsx53W0O_dCCJL6tnf2pWuv=qaeszcYBfz_01sA@mail.gmail.com>
 <CAHC9VhRPUXwqLvo4rbxL0++5zqHXfD8_tr-sirTJXdF_Aba_UQ@mail.gmail.com>
In-Reply-To: <CAHC9VhRPUXwqLvo4rbxL0++5zqHXfD8_tr-sirTJXdF_Aba_UQ@mail.gmail.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Wed, 11 Jun 2025 16:23:56 +0200
X-Gm-Features: AX0GCFt-lvgulZZy51v1nQGdrw4LjdO7BhuMTAtxvy7UyojcjPOL_75VvfjJ_Cc
Message-ID: <CAKPOu+-S5C59X8zW=6keYAsHecketOBzMbb3XXDnLTc0X1nBhA@mail.gmail.com>
Subject: Re: [PATCH v2] exec: Correct the permission check for unsafe exec
To: Paul Moore <paul@paul-moore.com>
Cc: Jann Horn <jannh@google.com>, "Eric W. Biederman" <ebiederm@xmission.com>, 
	Richard Guy Briggs <rgb@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>, Kees Cook <kees@kernel.org>, jmorris@namei.org, 
	Andy Lutomirski <luto@kernel.org>, morgan@kernel.org, 
	Christian Brauner <christian@brauner.io>, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 2:19=E2=80=AFAM Paul Moore <paul@paul-moore.com> wr=
ote:
> Aside from a tested-by verification from Max, it looks like everyone
> is satisfied with the v2 patch, yes?

Sorry for the delay. I tested Eric's v2 patch and it solves my
problem. His patch is nearly identical to mine, it's only a bit more
intrusive by removing the weird __is_setXid functions that never made
sense. I welcome that; I wasn't confident enough to do that and tried
to make the least intrusive patch.

Eric, I'm glad you changed your mind and no longer consider my work
"pure nonsense" and "pointless".

But one problem remains: in the same email, you demanded evidence that
userspace doesn't depend on the current behavior. However, in your
patch description, you hand-waved that away by "I don't expect anyone
to care". What happened to that?

Max
