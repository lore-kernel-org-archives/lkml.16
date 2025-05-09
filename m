Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E34E27A44D
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776856; cv=none; b=rjlC+X4NBJsmc0H/RgpWUt3f6YeCXPIgu195406uoblTm/WXeeSzMw22SQe3azIV5X1hvrvMG8H/UlAsptDpsRw4Wt9waU4ACWgLpIAsG89m9ZYqhmXWKwhKLyM2JS5nk/gqoW8COzfMmHAu5qrhCmhoTmILFataCVEGz4BEB74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776856; c=relaxed/simple;
	bh=nwn/1xFnDofNjE5zObbTyO3jQ7C6fJ/VDExirw9zwxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RWHLTXOSVBVYzcoaNTklEg5ysbbxZkyzgnyxN1n9s/BBLPtGS0noSLcQwTVLi16k5/rc6IH4/MMTiGwuyCE634QACg1aqIHsJrPwYFZIw/NeJi0wD5xo97jH2VFJWHeVw2P26iMRoPXuG+4iDtiqoNxWERaGOqiEeR1FnqCmOLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N9UUwott; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N9UUwott"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-326c38c7346so5864881fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 00:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746776852; x=1747381652; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nwn/1xFnDofNjE5zObbTyO3jQ7C6fJ/VDExirw9zwxQ=;
        b=N9UUwottZ2v6W2iL27LrJ1qXg8mNe+3ZY5X63+nvtw0WtZi/tJQo7FEZ9WeKmCQzlr
         eT6mR2q+HIdiReU9iz7oTJT6UtqHdu+8qa28T7A/q1cAMjH0CsSECUvU7SmMhxW9GCq6
         L/m5HxpEiNLqY0WtZvn06Fh44RBadj4c6QldxSp+1l8TX4eqT1uXYXnXtpoU1S82xHlo
         /nnDu40na/0WFrIWHGN4GNCNaeakaJAz6sMWmQiLYBKNmKrwcIvEKb2NiBrPPH3ZJm+F
         8U2TIHy3X08VsVS6vrO2Sif29HnSyXv528lvW4MokrW4mq5xp/vSyNs4JUK4JdH2Tkyx
         oQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776852; x=1747381652;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwn/1xFnDofNjE5zObbTyO3jQ7C6fJ/VDExirw9zwxQ=;
        b=OWwjm8aTqYoFKmThPSObj0wu90LpJx0l7m1rHCUMazhPZxbIXkGcPx1wS5jcdrDfo5
         Lm4oy7+g3bUAjBPIRLR2052oQX5pfrihXFF5CuLxdxL4uZYSw3EM9YA9i5MtbOl5HeaG
         tLv+yDnTuVTeIeKE+OkwJuT9jwbt4rn07ZN5BxooWwpUCKfOzRGvX6gDmqRHAs07Xk/g
         cYo7sG9pxCojxU1JOKfMNtMXlV9srzs82qqXMiMnU2RWteDDZ3fKtKfpaI8c9v+SwxPh
         HALaSEwI4giHKncAXXIvqM5R05P1uQBnisMzRVHXGY8Or3PSC2smLlLiY5VZ7UnoFiO0
         oUhw==
X-Forwarded-Encrypted: i=1; AJvYcCXnIu9JEp72Xatb3sfwF4AcPs8/mlehcejzEGrjpGnQuLGoPFtRJeXDiLsbyvdjrGLbybTR9av/Z+7Y4Dg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2eFFDlKWQSNzeaX4Ircq3Ws8GcMTS0Y+kgLpdeXnm5RR8sMUy
	ZCAdlwSQrvnm9seL8JKK87AI/rlBjevffR+ytwgJ21Xei5ozTJLaO5coVJvif6Bnnoupu22U/Y3
	jzrd+qtqVM2woeqmf5GEBfE6WCLOZcPZUim5U
X-Gm-Gg: ASbGncssjaql1tq11FzubaRGD2CmRCdgjiCuiLUFQe6gXSgObxJKcHK5grv/5vaXcpf
	kma2b5ke46grlZnnkbbmWX/tYVHorPY9sRn9rrbrvLBKhsQvoXtPwM8UjlGbk8GVERVdQ02rL5A
	mCqoNqY0/5JuloiZEni4pB9NdPpJFdUtuOSbegNBqxHwQLr4HWh4HDtg0=
X-Google-Smtp-Source: AGHT+IHvxm9nRo1BcrA9kxjbnZiSs4jSYmi+WIjgg0nbDn0V42esB6SSl4ogD0paL923V4yspKeBojmYT/Evqfb3XeY=
X-Received: by 2002:a2e:a104:0:b0:30d:e104:cd56 with SMTP id
 38308e7fff4ca-326c468a3d9mr10106721fa.39.1746776852294; Fri, 09 May 2025
 00:47:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025040820-REJECTED-6695@gregkh> <20250509072033.1335321-1-dvyukov@google.com>
 <2025050940-marrow-roundish-8b98@gregkh>
In-Reply-To: <2025050940-marrow-roundish-8b98@gregkh>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 9 May 2025 09:47:20 +0200
X-Gm-Features: AX0GCFu56T9Fwh6NOL-MLff4IDProsCbytk6OglpFiIlgFXBBwGRXwMKRhRLb6I
Message-ID: <CACT4Y+aiQcbHfj2rB6pGKevUbUoYwrHMu+aC-xh0BCKE8D-8sQ@mail.gmail.com>
Subject: Re: REJECTED: CVE-2025-0927: heap overflow in the hfs and hfsplus
 filesystems with manually crafted filesystem
To: Greg KH <gregkh@linuxfoundation.org>
Cc: cve@kernel.org, linux-cve-announce@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 May 2025 at 09:34, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, May 09, 2025 at 09:20:33AM +0200, Dmitry Vyukov wrote:
> > > CVE-2025-0927 has now been rejected and is no longer a valid CVE.
> >
> > > Filesystem bugs due to corrupt images are not considered a CVE for any
> > > filesystem that is only mountable by CAP_SYS_ADMIN in the initial user
> > > namespace. That includes delegated mounting.
> >
> > I wonder if this should be the case only if the image is flagged by fsck
> > as corrupted? Otherwise I am not sure what's "trusted". It's not about
> > somebody's "honest eyes", right. E.g. in the context of insider risks
> > the person providing an image may be considered "trusted", or in the
> > context of Zero Trust Architecture nothing at all is considered trusted,
> > or a trusted image may be tampered with while stored somewhere.
> >
> > Without any formal means to classify an image as corrupted or not,
> > this approach does not look very practical to me. While flagging by fsck
> > gives concrete workflow for any context that requires more security.
>
> And how do we know of fsck can flag anything,

By running fsck on the image. Or what do you mean?

> AND which version of fsck?

This needs to be answered as part of establishing the vulnerability
triage process. I would go for a relatively fresh version. That will
remove bugs fixed a long time ago, and if users rely on it for
security purposes they have to update it.

> We'll defer to the fs developers as to what they want here, but note, we
> do not determine "trusted" or not, that is a use case that is outside of
> our scope entirely.

I think classification should be tied to users and use cases in the
first place. I, as a developer, wouldn't want any CVEs assigned to my
code, if I could just wish so :)
