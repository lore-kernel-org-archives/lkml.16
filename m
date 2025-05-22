Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA86833CFC
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747927861; cv=none; b=rHu2eZA/WSdfn4J4225Bd+2GSu7t865BOyvO2FVGSCDIBoDrOHlWWHXRLrc6ONrX0plcCao4I2L4aWDFKK2xgGMM5hP6H2ooPswj/tdVLYrjZeEXWhtlstOJgedwR45nvWu0pemGqJzhoQN4fpcXkMcgek3oHCMJRCCXmYV557I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747927861; c=relaxed/simple;
	bh=l8kQIb40na+VGqlJWgMhXyEja7uGkKnGFelDx2FLLF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kqcpD5vUNcRAN9jkelf/6LNv08XXKXWb6znCJDLox9EqsA+APBeTfiFYuJ812pZTtPi3UzjDaKnM+34udqw0imh9cLckDhPpOEpt93uFNhEYZDGe/7p52JdVPgiWgDZ2fDKAJA69jhMqHpnjkdb46gD1IZ04785BJp/4N9GNheE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfqrtWrK; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfqrtWrK"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32934448e8bso23579651fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747927858; x=1748532658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8kQIb40na+VGqlJWgMhXyEja7uGkKnGFelDx2FLLF4=;
        b=VfqrtWrKvysJQ1x0WnTIIBjecdtiXtr82UWfAJr3Uwg8FwISF9h9tMNv/ftKSbTdYd
         MTrv/QhlaTp8a8gmtVPcMGi8XBriJZrX3b2qPbEQnRJWA4WWKzUi5eh7/1jz2TPx1IDm
         RTl/N6kyQAcQ7EyixAqXUVjyAzFciu28dwxXhGitgfM14ZWwyK8pESqQ3xnWzvJqLZuZ
         hpyqCQ1lj1t/l74+JyZ8hNtWfiFFO2vU1WxWoQ44ywy+nMVW+B9Knq2XmrjgJWr6MjBC
         R6ybrZAstKO9BgTL9eO4iBAs00M3Le6rYr8xzpw6x7eUDuCKGMlvB0mP3+oYX4VJxhZG
         6V1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747927858; x=1748532658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8kQIb40na+VGqlJWgMhXyEja7uGkKnGFelDx2FLLF4=;
        b=GRNPuRb0c3GfpzC/WyXnrVdyCBFVUrwt7MxIVN/MkpRvcEalVPfHeXPxY6XpOmtyW8
         G913qembMLn8DIJFlWZl/mwMZSr+iW8J7PznRdk1WujenxNvqhfhROVFbzXUPZLP1CmN
         MSe7NxUltDSsNGxN9jQ25aQVvcQKstSw1ZTlFQaKFpYJHx29vFsrvGSifO41Fcvc1A3F
         a4XWvfpqoZ0IZuepGVYfxNCNdVeam762o3quP7AAy+VQayHvax/9kSBiGuoiXXnhCBYC
         KcMsEu8g3K0HGv/xUw4ccR80J9TzqIGxzVyxs3w07KPIMyKyoZE8MAvlLjcY6+7kAvO2
         TumA==
X-Forwarded-Encrypted: i=1; AJvYcCWwU4xjDDhUTC8ZKygEeBxO/QA/d4q1PuVwed4AEZNivQ/LS2WBLbArOWUaBnaURj2QkvC0kiTv4gddHLU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcgd+86giNdOEAb8ypR8nB/5j+z7PxBQZbhqXnbfYUnAJFxGhi
	WmctvTtgOkFyObVMIRefXPKW/ItPrr1r/hfAcrNtVtekiY7Q7NWmJ7dtxJfrYraWe9EzM009R6O
	ACpZfpYRhslWIUtCdM4uwIfhVI0nU2Q==
X-Gm-Gg: ASbGncuNYdsNxwRyiMQ5vZGEkPYNLiI60R1QiG6965UujofXD+0pMhAhdp/He9eUs8P
	EyYpQlfza4kyurhBUtAQZBDNR2sYGwB2iyFIQOfSORAcysf7b2JcYI0ThEaf3sEa8/ZBnLOM6m7
	T7i9GsfEZAUx2mgwTklamPKUyrAnLGS6YiY1xo0mPhDVXjF9i9JA4GHA==
X-Google-Smtp-Source: AGHT+IFpkis3MDcdQUsr+AAi5COzV3+ry3hnkRtDRmtUc4LDzIKgexzVPdJ5GaPCG5Ei5bXR7eWVAK/+XxC3K75Es7s=
X-Received: by 2002:a05:651c:3041:b0:30b:d543:5a71 with SMTP id
 38308e7fff4ca-328076ef31bmr70332951fa.1.1747927857721; Thu, 22 May 2025
 08:30:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAP=Rh=OLo895nvSSXq5Z2Ubzs-eDtAfg6gHDineqF3NEap+rwQ@mail.gmail.com>
 <8b61a0ec-3d39-43c4-b008-b2a09443773f@intel.com>
In-Reply-To: <8b61a0ec-3d39-43c4-b008-b2a09443773f@intel.com>
From: John <john.cs.hey@gmail.com>
Date: Thu, 22 May 2025 23:30:45 +0800
X-Gm-Features: AX0GCFsFyjznAG5QEGohNO4KnXVxPUXNmkqWikl6UHcFZXoUnOsH1eDhrbcDFhY
Message-ID: <CAP=Rh=MON8RSf7dAAFnYvjCgN703LMtEuDA+QU08Hwrf-snR0w@mail.gmail.com>
Subject: Re: [Bug] "BUG: soft lockup in unwind_get_return_address" in Linux
 kernel v6.15-rc5
To: Dave Hansen <dave.hansen@intel.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Dave,

Thank you very much for your prompt reply and kind support. Based on
your analysis, I will disable KASAN and attempt to reproduce the crash
accordingly.

I will keep you updated with any progress. I truly appreciate your
time and assistance.

Best regards,
John

On Thu, May 22, 2025 at 11:29=E2=80=AFPM Dave Hansen <dave.hansen@intel.com=
> wrote:
>
> On 5/22/25 08:09, John wrote:
> > I am writing to report a potential vulnerability I encountered during
> > testing of the Linux Kernel version v6.15-rc5.
>
> Hi John,
>
> Could you tell us a little more about the overall environment here? It
> seems like you're running syzkaller and just reporting whenever you see
> a splat. Is that about right? Could you tell us a little more about why
> you are doing this? What is your goal?
>
> I think Steve's advice he gave you yesterday applies to this one as well:
>
> > https://lore.kernel.org/all/20250521133137.1b2f2cac@gandalf.local.home/
>
> Feel free to _run_ with KASAN enabled, but please don't report issues
> unless you can reproduce without KASAN. Unless it's an actual KASAN
> error report, of course.
>
> But, in general syzkaller produces a ton of noise. Unless you have a
> reproducer or a _clear_ bug, I'm not sure it's very worth sending these
> reports. There's honestly not much we can do with them.
