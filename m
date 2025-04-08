Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1818B1C2324
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 19:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744141716; cv=none; b=JI922BHvKMEKbeNsjZjw41wlGTKmIf56sKisgnpA3mgSIXqzFm4bkCkI1GXfEJPSigmlDc6bL3iYVEBXyPrlAbetC+oD0VtQGwBHhlUiRWxKpGzYV9gRqnPoeJx7dqXCoSZvVo4KIlCbNVIYEIdMcFwuFh73qxhIDl66wpKlHQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744141716; c=relaxed/simple;
	bh=JNMC1smP0znMZTGCRhKtNQBanQ+6veq93e3qrxxTCrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sSBH1qvA01Qvg5xnU0crUribZCaQ8ta/iGma8WwkMrpSHPOlB7j/iLtt3jmpqZ6gSxht5dw2Nqpoxje/YuztUagwRtjh3osISjsMT3cLLV7mAbCZ1gPOZRGI+xWhBvS30Kz6hJuVgkhTQh8wYKQahzhtv133TzWq70VwTNn8r+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cFvHTU/p; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cFvHTU/p"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so69013a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 12:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1744141712; x=1744746512; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zL/uwXeWfg7A6QPOJUAVWLRzIe3+HicAR6S1WGa4/4A=;
        b=cFvHTU/pgQaJUrd9PO1HZjHcsgyAOjNsECiv7F/pIaRb9Om8uz/6tDlXhism9SYv6T
         hUtpsqsOsxRogWdu5nCLWZKKkeOknqL3b3/uAzFtUjRuAjtVMCFTGyvxFXSHu8o/9C+W
         +Gv50LqX+D5GfZJODwbUTrNxgTf9ITycSyFGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744141712; x=1744746512;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zL/uwXeWfg7A6QPOJUAVWLRzIe3+HicAR6S1WGa4/4A=;
        b=jRvTelb8cURbzUN+Ra5sZiTLN9+h8DoeS6LFe3uz7C5Ov16xm6HntXjLK6ulwZp1hL
         kDPN9no6womNZI7Ta2Qn4tX3K8Vy5cQfglhrF3IyJ3vucXzBky7ERcuA3FN+7ZWUt3vM
         LTYZA3qBruk4nIfs4MZn+dnQBDFNAjfC5Lh2DZ62thdcWf4fGl5m4mESPqM5NneDbxkY
         j7/H54SjesJTaZiTI3QfxjO81mKcpM3HfN00iPJdgPyJg1y3NfvcOtbfeWC8+UStakc7
         WFWLcnxVhNXDechPpA7dDwXtsZVLNavK42/h2SynTMgB3qxugKlU7OjFrwe8/lyWZkH7
         sjpw==
X-Forwarded-Encrypted: i=1; AJvYcCUhuOIQIMilXZj8J09AjnFP6/J/ErQiGjHethfaXmqaddEalSi1Fnnr0/rjVCigOoj8UvQuzmAGVyFDfC8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7tYazjDIlJ1czNFoILf66005B/qjr8CBoFtKYSSgIglC2gDw1
	6P2ih2FmkACz+MPz+5dfBAWMi3LqpRXD+Q8JJC5obC2BcCvVut/LFu76Ley7XoUdXDwR9bV64PE
	IDwk=
X-Gm-Gg: ASbGncvfD64GDMnapMV5LnYBnYtxAaHeh/c1kIbaO8fkXGaE1ugOZwHLks0UBPiFHm5
	HB2yOVN3elBrBFmYOxbMGa3zFkFymZjUizM/17D3bF3qDC1PlHYd09q9uuFOej1AIe1E3boNEej
	9P8z8vTWgzUfIY1FaSBbKyHkBY9i2S4S612E/jSDCdmj+OPN3aX2xauM9P1IjYUxL+dbp22ELJe
	xkY2+8ZYRHRc8RoEYLR2aCp/lk6S6IdcWTYDD/0zf1bF2I4eLYhuJxu3nqXSOaf/bAACTLwiB1B
	UFoZ45yuorgs2/hZJvLvxpiZCfaQFoZfRnVxjvB2snbprRLeRQFv3uLyODnWap+rX0VYOAasVJ7
	o4V881jb0vI+dgr9be9sIDH/QM/Km1w==
X-Google-Smtp-Source: AGHT+IFa+P97OEHHzvPvKVg+k+/vcIx6FDsz8tNd/2dNuBUA0dLEO6Qk/UbznquFEMAhoZeF1/Egow==
X-Received: by 2002:a05:6402:234c:b0:5e5:854d:4d17 with SMTP id 4fb4d7f45d1cf-5f1f47050ecmr4546939a12.11.1744141712169;
        Tue, 08 Apr 2025 12:48:32 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087f08a98sm8639340a12.34.2025.04.08.12.48.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 12:48:30 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac7bd86f637so5889466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 12:48:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNXJpu9gFPLmmxrviz7Tx1aNsaVhV0vqrFLmlZL0+G8Udqe1ua5OLXjYsh3Z4fD+b7g8Y7Rsd61JG0c94=@vger.kernel.org
X-Received: by 2002:a17:906:6a06:b0:ac7:3929:25f9 with SMTP id
 a640c23a62f3a-ac81a87912bmr311971566b.29.1744141709943; Tue, 08 Apr 2025
 12:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402124656.629226-1-jani.nikula@intel.com>
 <CAK7LNAS6o_66bUB6-qj6NnaTRNKvu5ycxOP+kGfizYVBNjZAyw@mail.gmail.com>
 <878qoczbhn.fsf@intel.com> <20250407171209.GJ1557073@nvidia.com> <871pu3ys4x.fsf@intel.com>
In-Reply-To: <871pu3ys4x.fsf@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 8 Apr 2025 12:48:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgXb5ZVd+=b49957gm2Uo58h8EHBX5_mZfX4R_MJFqd0w@mail.gmail.com>
X-Gm-Features: ATxdqUEdLh_PIaVo8IEhaJ-xWVSdvij9xBxWmcQMsdyDiXQo9KjbMpRmjfCGH_0
Message-ID: <CAHk-=wgXb5ZVd+=b49957gm2Uo58h8EHBX5_mZfX4R_MJFqd0w@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] kbuild: resurrect generic header check facility
To: Jani Nikula <jani.nikula@intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Apr 2025 at 01:28, Jani Nikula <jani.nikula@intel.com> wrote:
>
> Your goal may be to make everything self-contained, but AFAICS there is
> no agreement on that goal.

Yeah, absolutely not.

I'm not interested in making some general rule that all headers should
be self-contained.

We already have some fairly obvious and clear exceptions to that, in
how some headers are special and get included early on and headers are
*not* supposed to include them themselves (ie things like
compiler-version.h and kconfig.h)

And while those are *really* special and end up being done
automatically by our compiler flags, they are by no means the only
special cases.

Quite a *lot* of our headers have things like

    # error "Please do not include this file directly."

because those headers are literally *designed* to not be
self-sufficient. And that is absolutely not a mistake. These are
headers that are meant to be included in very specific situations by
specific other header files.

So no. The whole "everything is going to be self-contained" is simply
not going to happen. It's not even worth discussing. It's a
no-starter, and limits our header file design much too much.

Honestly, I think the whole "headers have to be self-contained in
general" thing is a mistake. But I think it's fine for people to mark
their "generic" headers for some kind of checking.

I think it's a bad bad idea to make it a rule, though.

              Linus
