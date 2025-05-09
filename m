Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E25221731
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 08:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746777809; cv=none; b=CBHZi2W87x7Ax8omdpIPYSj8r4s2V3/E1oudU37UekHJcbU3fpOBGgzZjWWsFjVaqNyXu8HsQt7m6PZuToRl5Djl4K9AocsdLaOBKyTtoRZCvXq3sRHhlPP2VdoIMHccrU+l3Opotcqaz1iI9xYTWNeW9im8BwAQbBKpHEKS74I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746777809; c=relaxed/simple;
	bh=Bxr4f8XqlhiHDO8vXlb3wsLZaRiLl9d4KMCuvjqxlV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qZvrD01j97Tg6H9xQhKBXmoGDe8A/ZT2wzMCUaCoHgjmRwBLCm2rFg9cIFZg1VpYvtED8BW1Z8Vh5gB3IRdmsI/ZH9IgiuBpkKBcWO/YFpP7O9qAbw0zr9pHefXHq1LhQkPOIZf/cAebgbnwb/vi2mG/p5q8SJOyYBQ+x/slIhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IGlJh5UR; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IGlJh5UR"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-326c38c7346so5959801fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 01:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746777806; x=1747382606; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O1HMko1aCmpwMylOv6VaTNj1Xzn+TxcEsWmBvyHWGyA=;
        b=IGlJh5URUX+El1Bs/paXpsPkXnJroAIhZ+I5tL1Uj0lMO6oZej+lSoJ7VLGKO26qNG
         EGVeERz8toE8GaSZU2wZMrGLcQ6DDV+skmwJ3S8OoYuI39hH9ahgWj1v9HZ7ujvPezh2
         3FLA9zd1F8s3crnAttZZGMiBxbsWRQUw0EysA/kmxLnqe6NYltmSmzF4ZFFrDDxjl8LN
         V9lmxE3j3be6PmdVaecGQLl0Y6EQtXx1Za+qbZwkLM9Ns3aUbrXny/6z60r0uflkpidG
         +2wEU8HLLZ0M+wIxn9TvCy0z6GJn4NhrSHmmyw0OptIxw+m5Kdz5kQzDsv7nZ1169e9r
         6yXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746777806; x=1747382606;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O1HMko1aCmpwMylOv6VaTNj1Xzn+TxcEsWmBvyHWGyA=;
        b=B9A9gur2xT+UpgF2pnopJKItp/jdRS8s9P7+BSs0VrW6qt14gkKZX0eH6DcMK8t7SX
         sL5tFPrpIEHrnTSooKYRwiTNP5HXjvpashvctbM7xDh141/7frfRH3j7dgMecIP93M6p
         aeBxC5ylEG0JEY4czIFOjLMGeJGWo41fclBq60DG51h7LTr4/c9aXEBwhFykxKaeelzM
         iN1ccdXjPvDtfddz5T8ZFpjeXf6P41bd6J5WzfMOkYu7Ls1QehBDNDwuyxPCilpnFa1O
         zsVeok+TkK+ePOlJvT2hwt3NvpdTWCTSIbcBiONlfTigwV004MrRYpeRHFtmw+Xk5gan
         3zQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7RUL9NERmE8boSxxq/QO7+KdOCAC2vu2AYKEuF7aFmhdrlNfXg2FDG4Nyp+QlHSLGXR0HZkiTvLwdqK0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/CsBXeF0Em88Gosw3NsfCkGJCQyhdBWLL4kkfndnBlzYsZS1P
	sEinIJh7ic089vTh4aMK+qnVxdVjwFs6x/+PQrlV9GzT3MNJIfvLtNgqqIROnrQnLOXqrbNd1Gh
	Yr7jDTyO4ErH9xacgOFvnikQJk8wuGWUyeU46
X-Gm-Gg: ASbGnctE5MhcwvFIjbLxmCjyv8Awk7/7o/pnTpEbuXqCZ2sRgxKxowDn7+SG0tc8913
	Ufngo6RkRVKDAciZyW7NJCVEjzQmnwfBpGlvw9yeT/we9atf/05dSZJ8PXEGnLAcoN0Zqv9pZKd
	h30l/WtsITXE0U5bzb5KHuXITiu7Caiwi32PRZaCuNoDzw1Mrk9ATmfRE=
X-Google-Smtp-Source: AGHT+IHjHfKn8EdR7TqxaySaf0TL1ILl1v5sSHiSF/35MJTWepIJYBvHONcE+pkpvNhaFCOMO1yE/w2kxPjmQ4IfNn0=
X-Received: by 2002:a05:651c:2210:b0:31a:ba1:2387 with SMTP id
 38308e7fff4ca-326c45de068mr9037631fa.31.1746777805477; Fri, 09 May 2025
 01:03:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025040820-REJECTED-6695@gregkh> <20250509072033.1335321-1-dvyukov@google.com>
 <2025050940-marrow-roundish-8b98@gregkh> <CACT4Y+aiQcbHfj2rB6pGKevUbUoYwrHMu+aC-xh0BCKE8D-8sQ@mail.gmail.com>
 <2025050924-marmalade-overfill-fc5a@gregkh>
In-Reply-To: <2025050924-marmalade-overfill-fc5a@gregkh>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 9 May 2025 10:03:13 +0200
X-Gm-Features: AX0GCFsvjMgX4UMUNF5TUHFJKZmIUAnm-11W6C3KEI9I4NFG84lE2mCEAKkPLxE
Message-ID: <CACT4Y+ZqToLK5R__x8O1ZctsG3wQtRn36JWF2MPRYqY+Zy_CUA@mail.gmail.com>
Subject: Re: REJECTED: CVE-2025-0927: heap overflow in the hfs and hfsplus
 filesystems with manually crafted filesystem
To: Greg KH <gregkh@linuxfoundation.org>
Cc: cve@kernel.org, linux-cve-announce@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 May 2025 at 09:55, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, May 09, 2025 at 09:47:20AM +0200, Dmitry Vyukov wrote:
> > On Fri, 9 May 2025 at 09:34, Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, May 09, 2025 at 09:20:33AM +0200, Dmitry Vyukov wrote:
> > > > > CVE-2025-0927 has now been rejected and is no longer a valid CVE.
> > > >
> > > > > Filesystem bugs due to corrupt images are not considered a CVE for any
> > > > > filesystem that is only mountable by CAP_SYS_ADMIN in the initial user
> > > > > namespace. That includes delegated mounting.
> > > >
> > > > I wonder if this should be the case only if the image is flagged by fsck
> > > > as corrupted? Otherwise I am not sure what's "trusted". It's not about
> > > > somebody's "honest eyes", right. E.g. in the context of insider risks
> > > > the person providing an image may be considered "trusted", or in the
> > > > context of Zero Trust Architecture nothing at all is considered trusted,
> > > > or a trusted image may be tampered with while stored somewhere.
> > > >
> > > > Without any formal means to classify an image as corrupted or not,
> > > > this approach does not look very practical to me. While flagging by fsck
> > > > gives concrete workflow for any context that requires more security.
> > >
> > > And how do we know of fsck can flag anything,
> >
> > By running fsck on the image. Or what do you mean?
>
> That requires us to attempt to reproduce stuff when assigning CVEs?
>
> And what architecture/target?  How do we do this for all of them?
>
> Remember, we are averaging 13 CVE assignments a day, this has to be
> automated in order for us to be able to manage this with the volunteer
> staff we have.

If we can't prove it does not have security impact in any context,
then the safe default would be to say it's unsafe.
That's the current Kernel CNA approach, right. It creates a super set
of any issues that may be relevant in some context.


> > > AND which version of fsck?
> >
> > This needs to be answered as part of establishing the vulnerability
> > triage process. I would go for a relatively fresh version. That will
> > remove bugs fixed a long time ago, and if users rely on it for
> > security purposes they have to update it.
>
> Remember older kernels are updated but userspace isn't on many
> platforms, so the combinations of userspace tools and the kernel
> versions is not anything we are going to even be aware of.
>
> > > We'll defer to the fs developers as to what they want here, but note, we
> > > do not determine "trusted" or not, that is a use case that is outside of
> > > our scope entirely.
> >
> > I think classification should be tied to users and use cases in the
> > first place. I, as a developer, wouldn't want any CVEs assigned to my
> > code, if I could just wish so :)
>
> This is open source, we can not, and do not, dictate use.  It is up to
> the users of our software to determine if their use case matches up with
> the reported vulnerability or not.  We can not do it the other way
> around, that is impossible from our side.

Indeed. And for that we need to flag it as a potential vulnerability
in the first place.

But the current rule says it's not a vulnerability for any possible
user and use case out there.
