Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AFA1CAA6C
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 18:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748371054; cv=none; b=ujHYoocKThN/RjSpmiLrx7n39QZxzD/VW0FwTrsjKxzPMgdEYkIGCh3a7/ZptD4bg89bWw65UCFc4txu0j2VHmGJ0AtFV1ACP8+BBv515nFnW2A8QHSx0fdv6udRS4ByXtDl43t46Fc0bXWHV7dFUhPXomeblrHsceu4AukdsAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748371054; c=relaxed/simple;
	bh=TuQk566s+Q0ln3wP7QoM1+7HbVXdvrykoGXS+3NTsHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YllIVUofxhGAfCuCyL3SzSUcN2TWUqFvDrZgycqP1fAXNj7cHDh1dpDV7ejZXxysrRC1X0qlGKJ/vOP/cs55nj734MskVeNrb3bCboeTm1kK3nrqJRnUreSb4PvF+qi/wCcMqAr8gVksbbfWwdtF6Zc6T3OyqzGj9OirEXEKy0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=G/lLt5+P; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G/lLt5+P"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso664027266b.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748371050; x=1748975850; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hj2+lcjOXOZv7KiFPOZxmuP+mffssHA7pqR7imIqepY=;
        b=G/lLt5+Pl+fuwo/hbvETbnCPz6ws3/LhSJtKRAHzXXxMluJ5PV+7WnSHfdEC6nB2rf
         +TYhTxe5Sy1F5v9LFFl7hBj3zgosTrxelQSA9bvsgt+P7LPr7vejVpTNbqs6yHtWZPi1
         2Oc6jWlylmETEIRjt/obJfFIHHIcCxNMW8DJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748371050; x=1748975850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hj2+lcjOXOZv7KiFPOZxmuP+mffssHA7pqR7imIqepY=;
        b=qHnAxywvdoiVvfx1zkj+hRGyZCyXkNU5qYtkjvMSXVmtNMJ3gV38q3jy/dLW7eQ4VA
         E0RKN1W4xwScWAFpXXYB0I2HSvFTEguK7MELQ4clYvR/vmlQFgeTIRgiSR9uks162PD4
         EPsKn/gTN2u5TMC1VzRr7UVE33Ozee9BxRtVhVZHN/tBI66SW3GMkiyZwhONINbZMK2L
         dqzGv/D3n7+Pm4H7j2VhwtutSh3oRJ//oRsyZ8EaRVahPqyaFs8noA7IY0fhir1PlNsk
         DoYbqWJ6tT3XTxPElbxTmKCs5NJRQgEx64oka/OSo0lBpOkqGi9FzyTGXhm/ec2jhIJ4
         ksOA==
X-Gm-Message-State: AOJu0YwE3CRm5PsXFQLCDX6QWFE5mHA2nAZKWrdKSXvqzfvtPkZQSN6z
	pZCMU2zTpVAja0XAS8En9CfwZucpLiwa+ySBP0SCpbUioS28zEPX93PVPbqm9v/kxPOPMgxNq7f
	tFiLxd6Y=
X-Gm-Gg: ASbGncvM7DNFKsem5/JYJdSzrNhhvL3phfyEe5bmK3wsJ7S1nGCMrGggvH98Mlo999/
	85J6AuJEiZIoM/theHJUwh3M/XpTMLllD/vRoF55bQwHuCZPxYq5QiJCg2x5ZYM784n29GrrIT7
	zc74bejUNjiXAOyquIPfxNIo77s6wO12DRMEzveK8L/s3D6PILPRTOlByTgPWxaI5zTO912KMcQ
	N20S805v4pP1B4Bzl3PMbOxgkGigYn0viDEzy49N5SbWzPvLhNOOwztN6Q7gvxxaURe1439Deoa
	yotgp2x0SvujjMeGcYoqHgP2xMLatCKOpEuwiIFXua7JI0l6U/WrKvhP69TFXRMf33EjnuILwxL
	x6RaSQZZkEEHr6bVH8i/FDi4Bc5pQ1Ef031M=
X-Google-Smtp-Source: AGHT+IGhJmhsYp+lKQmFVFCQxXmTKG0EkBBaY4kZ7tYo/qsXpmUIStdb70QE5RPn9bADsQSa1C8ATg==
X-Received: by 2002:a17:906:f118:b0:ad8:7656:4d75 with SMTP id a640c23a62f3a-ad876564fcamr713785666b.12.1748371050099;
        Tue, 27 May 2025 11:37:30 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad892d4754esm117671166b.13.2025.05.27.11.37.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 11:37:29 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso664021366b.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:37:29 -0700 (PDT)
X-Received: by 2002:a17:906:c144:b0:ad5:c312:513a with SMTP id
 a640c23a62f3a-ad85b2c17a2mr1022204066b.56.1748371048991; Tue, 27 May 2025
 11:37:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87bjrekpp6.fsf@trenco.lwn.net>
In-Reply-To: <87bjrekpp6.fsf@trenco.lwn.net>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Tue, 27 May 2025 11:37:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi6U90ddnUvh5A0AxBecSPczswRj4hsd2rvKeMv4pUNgQ@mail.gmail.com>
X-Gm-Features: AX0GCFsyyQo8w_POWyPRKioQ18WfcIChszVMUzK-DjTlXF1qv-KGOOC-nNCgKe4
Message-ID: <CAHk-=wi6U90ddnUvh5A0AxBecSPczswRj4hsd2rvKeMv4pUNgQ@mail.gmail.com>
Subject: Re: [GIT PULL] Documentation for 6.16
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 May 2025 at 09:01, Jonathan Corbet <corbet@lwn.net> wrote:
>
>  scripts/kernel-doc                                 | 2440 +-------------------
>  scripts/kernel-doc.pl                              | 2439 +++++++++++++++++++
>  [...]
>  54 files changed, 7336 insertions(+), 2815 deletions(-)
>  [...]
> mode change 100755 => 120000 scripts/kernel-doc
> create mode 100755 scripts/kernel-doc.pl
> create mode 100755 scripts/kernel-doc.py

Bah, I was unhappy about git creating this horribly diffstat, but it
turns out that it's because the pull-request scripts by default don't
use the fancier 'git diff' options.

In particular, with the '-B' option, git will give much better results:

 scripts/kernel-doc                                 | 2440 +-------------------
 scripts/{kernel-doc => kernel-doc.pl}              |    2 +-
 [...]
 54 files changed, 4903 insertions(+), 2821 deletions(-)
 [...]
 rewrite scripts/kernel-doc (100%)
 mode change 100755 => 120000
 copy scripts/{kernel-doc => kernel-doc.pl} (99%)

but I think we never enabled the 'break rewrites' option by default
because it generates diffs that I am not convinced non-git sources
understand.

Oh well. I just wanted to point out that git *can* do better than what
the default settings make it do.

          Linus
