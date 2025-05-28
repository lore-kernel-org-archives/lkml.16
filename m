Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFB32147E3
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748464560; cv=none; b=Qtiq2FbmRMmiPUVZ82b2CIRDVgrqF3wTHdCEnlMmy0Lh5NdDKPCr8IWEN5jgiAIWrWV/lNcIW+dLWOuvZNSkih0qGti6tDKbMQW4yn2iEH9jgnbcl/a5TVvWxzfAG3kGiB++f0tayVY7Pwoby7a9FuTZsKLTqN3QrOIXsiv3sPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748464560; c=relaxed/simple;
	bh=rL2WJHK3yK6U8yCpBEsDlHfjp9mdR1IrM81qSsZErHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ktHlh+PG7xEBXVOKlilYskX4muaO4VebzkAF/aU3JzGEUgMPiDiTfVY78SkpMDgMfDgD4ttWysZXTfqLzqg2F4WXppPx2q+0GOyezQ5qzieRZ6nLTSy1f+dv/v+OHwZ2r7cMoSe3C69fPYrh3hWQ6p3d9IK+sXYMROPECA6LAbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=d0C8kYcN; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="d0C8kYcN"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad1d1f57a01so28574466b.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748464556; x=1749069356; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SI3go0hstqNJMeRsNvBC/Uwu5IUh2YuAXmhIt3IADQ4=;
        b=d0C8kYcNXVLsHGj1yntNqWW4CrV+1WrfGDmluUnyu2LNNcF04WfdgpXM9g5LZWyG2I
         PUqChEqAZwfHk+8cYY1sN7KCQ5Gash3/V0Bc0RqDVNO3MVi/O2Qm1UPAnvoBdXGIOJTB
         WMoxO8a43gJjFyScm6StS2HPvl7+vL3fvClak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748464556; x=1749069356;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SI3go0hstqNJMeRsNvBC/Uwu5IUh2YuAXmhIt3IADQ4=;
        b=sh4wb2xMrlg7xiPVBPJA7XD+76m8SvSrGSx3EB6XL/DEG6l9MGqNyeKzNpx+AJtYeG
         Z3FJOtfxwCsluRqG7vhifsQS0NynvARELzgo57SqPU8ArAx8ImmaoSdDdOuCb9Eh6lmE
         b1xSGf3mRJlX/mZj+ZduKA/oB/NKTXIz19UAG+lphD0DAhizoxYvgJZIukBH8NTs3I+n
         K9vUXdtv8ODvtrjLVP3snLxEZ/T2zG/ApY9PXMeF0yRnk408d4vN8BEy1Nbwfct9ccrj
         XoBOaJBaSTG2A4DhHABTk8jGWcNsnt4/6n/4DpO+Ogi/5uvdLSAJlCmD6+RpSudJYM4q
         8OpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl+fhVm5ffOzG3kUEf4yrl/vmekWep3mxu9wZZcfSGvjibSHprYh6dj6TcGOJVy1FQ6bIXd+UebLElwWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpRkcCwGsG/jDzyd869FLufHyl+CFWNJhsZjVF/bCy6yrDjn64
	tPWon+AcJ84C7shBK2OE/VqDi8BcsE1Ji2ZTjdWmeRo98K17NcLQuICIh29eCSieIzFMCEU5zlk
	2jnwg+F0=
X-Gm-Gg: ASbGncshOoThOlweLkfEvid0cKsNePxQRNlRSmRaTH5KGAk7ymRib+t3o3DNa+aXX0g
	hzNZwvj/PAT2NTs+X+cPIEhLpEqHfAKnv6+KAT4UyV2Rz54TvINR26bHxT14+F5b8NT8+1xVuV0
	xrABi58C0qm+b639g7hpTjIQLSWlbs1LQeu2MJTQSTGT8WifGyUJyCW/F/PM93cGoufx35xd8Yx
	rUwosmYU0Uf407Y8qsyTNJGzr4NAqXFfoNe/2X+QwhUM+ct6SfX2bel2kX5hpL5gbERA/ZOV1Jv
	UyNXsCg9a03mYxsm78yxqVhwaWappNNTUcoBHZfmfTlGxk49S7NOktlaYBnIzoVtncf7CmiM5vv
	NNHiHbDnPXI4rDWHhKUUxgMbYVg==
X-Google-Smtp-Source: AGHT+IE6lRMvFOLWE7RgYWuCsKLpaBcGq2J/BhDS0ucAbEEqbesIMLo4l800lx1RVy9w4q7ariZDAQ==
X-Received: by 2002:a17:907:9721:b0:ad5:7529:94d with SMTP id a640c23a62f3a-ad8a1fce9demr360559266b.42.1748464556487;
        Wed, 28 May 2025 13:35:56 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a1b47a0bsm165650866b.132.2025.05.28.13.35.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 13:35:55 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6046ecc3e43so332377a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:35:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXSMwQOEg3zqkmjiXJsIAwPYVjSiKN0A96sS8HpSaXBtXIAF6aQuNcG4BU9MmXZDJ/JuD/r1zQORanCoBI=@vger.kernel.org
X-Received: by 2002:a05:6402:4405:b0:601:834a:e678 with SMTP id
 4fb4d7f45d1cf-6051c391cebmr3066095a12.17.1748464555249; Wed, 28 May 2025
 13:35:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527141706.388993-1-cel@kernel.org> <CAHk-=wggC6PP9ZNwKY7sEzdsC7h8qySA7pjqAchrYowniADUQg@mail.gmail.com>
 <20250528-wise-platinum-pony-ea6f62@lemur>
In-Reply-To: <20250528-wise-platinum-pony-ea6f62@lemur>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 28 May 2025 13:35:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjzMJBiBboMEWy+cP5ke0otahkzfO-UAjvRh4XrSqrL1Q@mail.gmail.com>
X-Gm-Features: AX0GCFt7MDkczEmwkTnb1VLnT_bDG5bEQpgslWhXYWynZCrj6otp4h35LOxc5RU
Message-ID: <CAHk-=wjzMJBiBboMEWy+cP5ke0otahkzfO-UAjvRh4XrSqrL1Q@mail.gmail.com>
Subject: Re: [GIT PULL] NFSD changes for v6.16
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Chuck Lever <cel@kernel.org>, linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 May 2025 at 13:18, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> So, if you receive mail from a bunch of people called "Your Name", at least
> you'll know that they are reading the documentation (and still following it a
> bit too slavishly). :)

At that point I suspect they *may* actually be bots, and it's a good
sign that it isn't a real human behind the email ..

            Linus
