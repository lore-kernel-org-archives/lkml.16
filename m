Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AAC20F069
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523942; cv=none; b=CVd7bVRnTpMp0B0viy8TtsNlUt95jC1gTwZICaVwTtaFokxqNjrTUJve6XXMTcMcxrjZrGoG3JQ1JnRvFSaJxL2vIPVgjTnGVbLvuXECCF+Hl975nlpTayCXpogHMY+OR5Exeps47+EQEhWM5Ai+RAI1hVV0S05m48rbSGJ70PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523942; c=relaxed/simple;
	bh=x6iH1miz4SBrShUgnRfWCAm4cElQH+nuoE2PFcN3gX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pxQHbBvnL48zE+h4GkXw/ZhIZO7FXmXr516V8d63z3QFx6x7fYTLIRJuglrkG7cjeaSN0jIhI16aY991Vuim3wHDZv1jmxgQ7hidMPzmPs7J1Jd4oZDbfrJLPtJe+nckFZHHVvdmQcXubP5LGdOGCQXpy5sV16Z9bWOca9l+Ddc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IieQ04KH; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IieQ04KH"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e61375c108so7523261a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743523938; x=1744128738; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R0cWPyIGalJTJpOn4sOHZYmIkTB2QC9Z2olFNCWNik4=;
        b=IieQ04KHyOzv6EyM94pwsXD8VnSMzo840xdz12Q51btx0Q8Bb0HUCMWmvpSN1/OsXJ
         fPNiK+fzy77MWtmS7DWtRaM1TeIopdxVUtTGje5Z7cDhoabsMVk2B6YLuNo9Kvc1POee
         42LzwlcTe6mTztDFFET0EhdYHaHuPyM2k/4WE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523938; x=1744128738;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0cWPyIGalJTJpOn4sOHZYmIkTB2QC9Z2olFNCWNik4=;
        b=nOcOVFf4m04wC9W4cNrePScnppwzQjQ+rSlePodLEUaG7WnSRdQ0l0AuhanPF0CjN8
         p0Nwp2BkRqsycnxwkE9Uo/nZw9a9jd/kmAyslPnjGfV7lkWAkxrA+l+BeYUYIcIzZk95
         Ug+n1DzBKzwEk8InWEdi4dcc+Lo2TRuyoOZ1vh3twZZwSWLDjSdxUAVEAnEb29I0/A+k
         5JgVRQ2PXMslOWJiI740w8Z9tc0hFH8SFhJ/k5iAsTWsFngvKiRemqUOgItNJPMoJJlF
         ENkqoEvOBNJqEUCccKYPZB48cOgePvFKxbAskG3kgowc07TvfNjrnKqaR62DvsxoJZ7/
         ZJrg==
X-Forwarded-Encrypted: i=1; AJvYcCVMS7JDmorFIIhp5INKENKc9tdjmGkFaFQLU9PH4e3XHC95W2sYAZUr3TRFZokGXohezpGYYTuLSkXs2ww=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHYQZqpLgQJZ3hV73sgDfbfdeQnoRSyh6+j296yNRFKdy0Z2mX
	UVMUSlT1QghbajM08W9UMNBoh8rv3iVLI/0KfGl0AgYnjLc8ZYz3Z0Hwie8JOCtIm/9q9DEnUhZ
	ge20=
X-Gm-Gg: ASbGncufHJmO/afPJr8J0ydyb0sc3e13fD0soDcCypQxxAVmMZ0xlmzfzfaK0A7HnWZ
	WxTMdvbgAPPJ0aKJIiF+TnYcF7oJWKTfRCWQhTkWWrAHqlluvsB9+AsQew9OHQrBcjmMazS+V/0
	56kdBHL/uYK/hEJ5xHPQriAPc6jZahqfvHfRvb4zRfj4hvkApos9ZF+XbRVi+V1DgXzf2o5jYSO
	adN8k+fUAYu/2687UnIShMUQMZQBxETL0deZKLStzO6PwcBvXjedh9R6gbYI9M0aW8BSq9eIEXi
	zqFe0kAX8QgMszN36NPO0mQPLV+CcLJH+kDkMWDhq8GXSze/o6GQzMKHMrhLc9v5kDa6A7g4b/D
	uWCtPL/6A7tJ8ggeQh5M=
X-Google-Smtp-Source: AGHT+IHYHskDkG+5x/8DYLHToi8c83BNIJYQfAVBmEFsZqXBsXlVY6eDlJikno3DIEcDHtwQuH+rVQ==
X-Received: by 2002:a17:907:868a:b0:ac3:bd68:24eb with SMTP id a640c23a62f3a-ac7389e793cmr1421861566b.1.1743523938027;
        Tue, 01 Apr 2025 09:12:18 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71967ffcdsm797629166b.140.2025.04.01.09.12.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 09:12:17 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so9248325a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:12:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXpTnH8pBsFgvKqwEAV72Mc5Uqwf83ore3NGUMCkavZuHazgTHS6QewsiRFoFknPOWdkVXa0PxYOLK+oTA=@vger.kernel.org
X-Received: by 2002:a17:907:60ca:b0:ac7:95b3:fbe2 with SMTP id
 a640c23a62f3a-ac795b40722mr84123166b.56.1743523936719; Tue, 01 Apr 2025
 09:12:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
 <CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com>
 <87h6394i87.fsf@intel.com> <Z-p2ii-N2-dd_HJ6@phenom.ffwll.local>
 <20250331133137.GA263675@nvidia.com> <87tt782htn.fsf@intel.com>
In-Reply-To: <87tt782htn.fsf@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 1 Apr 2025 09:12:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiP0ea7xq2P3ryYs6xGWoqTw1E4jha67ZbJkaFrjqUdkQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jrv7hzkHPbwtJqWz0Cd1SXHgUtjes9IRxVS7PrDi4g4uM9zP-lB0F8gOBM
Message-ID: <CAHk-=wiP0ea7xq2P3ryYs6xGWoqTw1E4jha67ZbJkaFrjqUdkQ@mail.gmail.com>
Subject: Re: [git pull] drm for 6.15-rc1
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Dave Airlie <airlied@gmail.com>, 
	dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Apr 2025 at 05:21, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> The header checks have existed for uapi headers before, including the,
> uh, turds, but apparently adding them in drm broke the camel's back.

The uapi header test things never caused any problems for me [*],
because they don't actually pollute the source tree.

Why? Because they all end up in that generated 'usr/include/' directory.

So when I look at the source files, filename completion is entirely
unaffected, and it all works fine.

Look, I can complete something like

    include/uapi/asm-generic/poll.h

perfectly fine, because there is *not* some generated turd that affects it all.

Because for the uapi files those hdrtest files end up being in

    ./usr/include/asm-generic/poll.hdrtest

and I never have any reason to really look at that subdirectory at
all, since it's all generated.

Or put another way - if I _were_ to look at it, it would be exactly
because I want to see some generated file, in which case the 'hdrtest'
turd would be part of it.

(Although I cannot recall that ever having actually happened, to be
honest - but looking at various header files is common, and I hit the
drm case immediately)

Would you mind taking more of that uapi approach than creating that
hidden directory specific to the drm tree? Maybe this could *all* be
generalized?

           Linus

[*] I say "never caused any problems for me", but maybe it did way in
the past and it was fixed and I just don't recall. I have definitely
complained about pathname completion issues to people before.
