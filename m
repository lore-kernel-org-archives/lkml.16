Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5BB27A104
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746719118; cv=none; b=ZSZ0dkHCS8RHMc3EFEd5T3Y8URarkNJkr7rrnkuxoCzHJk/QkQgSL8xXkSWcKyfm4pK4DdWn6N7oQc/B9q8HeRoRc3FZm+bvDiUkRr/2/rdZFsvYec1yK8AaxTdKqqwe2vZZYM+TKe4ywuPihVyj55A9kc/0GXy+bYpfSrJU+bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746719118; c=relaxed/simple;
	bh=MuUjO0lVy+uE19DvVWBJLTPKJIu/iOqDmi/K4/QirxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NVCNOWh2ukA/oA7DqXb8RW1L0k/Gne8u67xLKzgO3Kym2DK783mqYorA41ZfD9KJK+Lzy9kkImyyG7gP1bekmXqUN9jVTHeOjFqcRWO1VHY6TBBquXX1tLsgX3r6SDRP5osOO8JhxhhIhOfoR4QyG7EhH9mv7E7CC6NcuOm/T/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=android.com; spf=pass smtp.mailfrom=android.com; dkim=pass (2048-bit key) header.d=android.com header.i=@android.com header.b=e3u3b6Yd; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=android.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=android.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=android.com header.i=@android.com header.b="e3u3b6Yd"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6f54036c4b9so10845356d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=android.com; s=20230601; t=1746719115; x=1747323915; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NM4QjkPCoOZz7ahD1Rov7Pc15g+3o4zNeRGOhW1N2W4=;
        b=e3u3b6YdJNIXMCfSmn3U0BtEMofCJGJFfkJ25RJv61ILAbbsWu3QTlZbYiqXmvLEzJ
         GNgLbUkdKmGfZZsGFUmXYLLhTfLE1r8dOqdyAHbxtaAK4xwb/MVkkomgikMVGfKtPKgR
         nGMOPIr6Y7SguEaeAjKNgBfsYyp249GyhihXsTSGbxAF05KaVXREezgZKapONb5RBpOH
         f7TrLg3IaQW9yvwdmcGL6uXanVIRhpbxZkoSxkW2csKpM/WTffepOC7xXIlX0pNTOWDo
         //HgzC5OYvbYEbE+Pvi30pxpBqzsUTn3deEwkudE8eWX49udjIH6F9YO6emjJWlxgWd9
         m5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746719115; x=1747323915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NM4QjkPCoOZz7ahD1Rov7Pc15g+3o4zNeRGOhW1N2W4=;
        b=aNImKKDP/oD4Xh+mqT5IgnC8MRmlVSjXqyXUOGNSFHh9DHGP53juYaW30L/5TeSSN/
         v6A9ShTfhZlJxkh1bX6aa9Ak6k35dDMp03pERFMtmPXg3vc3tqsa3AK7r6as/Qe7GH1K
         gMZfDNuc9ECgC80m+w5NeLuFvrXPK9zsiJA+IWTLOpYtlMlnu1lb6dYudgTW8wEE+vNl
         mVo6oQf3rGrsnuAgDHZItanHV/xYoSKpMf/0AoLXKSTLo0C8z2FIcxY+1SWUNKd5LlFI
         Dy1m0KmluYx6eQ/LnY/5bs0hgRka6B01iqsQOlJDFvqeT1pjUj8PcLtECm9hy8U3XAl+
         E7NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc9qY86eVLaVIx10PDNqecFePYMFjk7ofJj9HhlRM/2mBO/cjQqoXy1+dL4Ou5DkTfUPYlAF2sKRphE3k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4U3bcm5T7/k5JBd1lYayN2obRiQTpleKlM4PjUupMFKxkjKH+
	j0jaIBtwKaMIDcjswr2jg2/zhvSShDuWThmMtT5GKEUzcgYNryEDu+9LzItmJFVRXlRmxR9lK5S
	7TygnP0qitNejnwvRHHLMiwOKzGicKM8ZPfGo
X-Gm-Gg: ASbGncv3Czg+Ic+2AOMT0IquT/OkL9jnRqzeh1rJO4V+U2axQk/k4n/lBHKFnpsSpVJ
	P4sfF4bfQGdFOhpQ31VXrbAiIpFcl3wF3MYJP4k8K7oBRUf15intYIDEC8qBSRtQSzDn4M3hVwe
	sYE3SwVMi9M1jhil6EoXAPUDk1hfpshWspTvecGKRxJBpNxzJfw0r8JXg=
X-Google-Smtp-Source: AGHT+IHc5QpsocWh4+JhJxyePGK+eK7xc3hc4CKN9/ujajSYCJIlTH83nwZ4fer3bYFp280RvLfeG7NtLclp+yhwbtI=
X-Received: by 2002:a05:6214:20ef:b0:6f5:374d:3cec with SMTP id
 6a1803df08f44-6f542adfef8mr152122036d6.38.1746719112652; Thu, 08 May 2025
 08:45:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+AY4XcaJa1_U3qXQUBj4wZJYc9hKmRX8FTNeDvV2auEnC_WrA@mail.gmail.com>
 <86r017h00e.wl-maz@kernel.org> <aBnNXyJn818ZEKOS@google.com>
 <8634dfh47q.wl-maz@kernel.org> <20250508-spectral-sage-whippet-4f7ac2@sudeepholla>
In-Reply-To: <20250508-spectral-sage-whippet-4f7ac2@sudeepholla>
From: =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>
Date: Thu, 8 May 2025 08:45:01 -0700
X-Gm-Features: ATxdqUHLxJTSxwoqFpk9lA8TVBYoTMM9oR5V-VvKoxrBxJB4bep25PWQBicEw1s
Message-ID: <CAMP5XgcCg+kB7tPwSYUcjfZqR_734cGEs_KX4st9SQOVLBV-Yw@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: arm64: Restrict FF-A host version renegotiation
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Per Larsen <perl@immunant.com>, armellel@google.com, 
	catalin.marinas@arm.com, kernel-team@android.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	qperret@google.com, sebastianene@google.com, will@kernel.org, 
	yuzenghui@huawei.com, Per Larsen <perlarsen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 2:27=E2=80=AFAM Sudeep Holla <sudeep.holla@arm.com> =
wrote:
>
> (just adding some additional info not particularly impacting the $subject
>  change implementation)
>
> On Thu, May 08, 2025 at 09:55:05AM +0100, Marc Zyngier wrote:
> > On Tue, 06 May 2025 10:29:41 +0100,
> > Per Larsen <perl@immunant.com> wrote:
> > >
>
> [...]
>
> > > Asssuming we drop this patch from the series and apply the rest, the
> > > hypervisor and host can negotiate FF-A 1.2. If the host then calls
> > > FFA_VERSION a second time to request FF-A 1.1, the hypervisor would
> > > return version 1.2 (without this patch).
> >
> > Why would it do that? Once a particular version has been negotiated, I
> > expect to be immutable.
> >
>
> Not suggesting that we need to support this, but it is technically possib=
le
> today by loading FF-A as a module=E2=80=94first inserting and removing a =
module with
> v1.2 support, then loading one with v1.1 support. It can ever throw error
> as not supported to keep it simple.
>

I'm not sure how what you are suggesting here is different from what
this patch does. This patch does not alter what versions the host can
negotiate. The hypervisor already disallows negotiating a different
version once has_version_negotiated is set, the return code just
doesn't always reflect this. If you try to load the 1.0 driver in the
host after unloading the 1.1 driver similar to what you describe
above, then this CL will let the 1.0 driver know that the hypervisor
does not support 1.0 (I use 1.1 to 1.0 as the example here since this
is an issue even without the next CL in this patch series that bumps
the hypervisor supported version to 1.2). Without this CL, the 1.0
driver will now proceed making other ffa calls using 1.0 data
structures that the hypervisor will incorrectly interpret as 1.1 data
structures.

With this CL, loading a 1.2 driver after the initial 1.1 driver will
work as it did before by returning version 1.1 to the 1.2 driver to
let it know that _it_ needs to downgrade to 1.1. if it wants to
proceed. Loading the 1.0 driver after 1.1 will now fail at the version
negotiation stage however. This will be clearer, and more correct,
than getting FFA_RET_INVALID_PARAMETERS return codes from other ffa
calls when passing valid 1.0 parameters to those calls.

--
Arve Hj=C3=B8nnev=C3=A5g
