Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F264E1CA
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 18:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739125090; cv=none; b=BLTP4baIzMnMDuwU7q+Z+DEzIhE7F2AbOMSzpJfuKJTowIf1GJdXfyhfHu9y0z8x60rh1gPRauduZolwQ0n7+DWbQXjCVHEa6+ue+DYA5eyeHnUGWRCGa7xqHWhQSVntZI7hT1CB++krA6UpC+0T3ajeNfPXpsG3bU9pquoSGVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739125090; c=relaxed/simple;
	bh=W3CtYi4Z88+6aVSD35NGtCbEIEaD6AszZa4ps3GQPE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sK6b2Rh7brf7R91IzFPokoT6w1dpgqtL+OAZjYtSqtLUUD6xGj3XRRzr9NkieV9MBiDsoeC5DcZHripDQOygGj4JgRUqVe2hTflYZPDyxNJoyUjrQk2KiyN+xwrV1KFWLKPp1PEWWFoLzjc5tSjDlbEjX8Krg99A76Wkt8rcFcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KIbu/IbH; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KIbu/IbH"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so4546127a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 10:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1739125087; x=1739729887; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C/ylRg0Jxp12DciqYX00fFGZholOPej5f3TNUZ4A9Rk=;
        b=KIbu/IbH8LDYFSBAhJFiUsyTJUBgO8o6isxjgcH1ryiLxCU3QKuNByV1qXREJ/LAMS
         GOdQw5Rppg5N+9l3rgbTaKuarB8VAPkYfjThLIBvGoUmmo6fxgo811jySgSUX7sFbyml
         9mToYNawkMizNG/ClR22a5Fddj2EaFoms/ZUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739125087; x=1739729887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/ylRg0Jxp12DciqYX00fFGZholOPej5f3TNUZ4A9Rk=;
        b=SAShs4oI4yXbu3DVcWGf6Iw8ZXyX/8OOa/d/kKHsIcZLzadGfFi6SNEdPHfFLRtJxk
         OGCh1snN4wQqcNvYVOjHkX3AHicGJq/Yc0DeZbJxTiAqHpWVNZDbP2zCfudfU/01Vd74
         rFCMb8dYdpAfSFZPaWYg4c5wiG8RrUqy/ySN5hBoC9bKB1eyO/NpmHQ1JVdQQgYqlbFP
         ta/16V2ECjcfxA/+HV0Xx3vRqpHO3lbNMJkFrOWYv4khUjxHCK5BbMyxDzqm1ml9tmKQ
         5PvJNv+rfscrY2/I0f9huenp1F3y2V59RN76UzTL+9SSAqynw0czB5yUS4pf1BXQeoZK
         FBiA==
X-Forwarded-Encrypted: i=1; AJvYcCX6CZN9povI09hHbrMTmFPz2KT+t5+lPJRVwJoswEkQEXZgF8niBH0QEw2/00Re8Hz2SxXTj0pwIo+MxPY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrIj4/Pr9TA1KQZaC0Ly8NhiBa6+7SpkFBORMN5t687GIe1dPd
	8Ap7DzDcul41PqnCfwTuVJuUWZl3LCzLj/e6rauj++LqSAhZz3Tl5ZySlXkm9NSpPYcTbBaH/Hc
	8GGc=
X-Gm-Gg: ASbGncsDAmGBxGNlt69Z5hS7jSbKykGXU4yFnMWjQNebFaH7Y8C7E+XnDLP66EYKQMO
	l5girtCU90YEtSvwN72/W/qdmMoIHkjPb3czLd8fxpngcDO6E5C73RSyaqj9fs0m6y6F4qL+hov
	3HEZDbITkALhOcrZNF9smO+2KN/Q4ymeCkLEfvlYyfuLcfM7Ry0UovvsfET6T4q7s4qyLBq6C1c
	YWXh3N+erWZt4WXPV3yPIVyR8szmHkeSMJU/jGo4+/rOXSgVLPta2qxgCn9Fyny0m6ug0AU63Xl
	dFXvUI88ZBSWoXkeIUdszxQHW2AASU0nfxNUm8jZvuKaK6+jg3YWFG2vnfvHGLxmJA==
X-Google-Smtp-Source: AGHT+IEmovMnKSHZ0sQBcj+v4SEDV5k0bAU9PiENs5trpYwDLDDLuOFSlIkp5uCIAqyX5G+xYqAt/g==
X-Received: by 2002:a17:907:c285:b0:ab6:fc81:d2c6 with SMTP id a640c23a62f3a-ab789b2070bmr992271866b.23.1739125087121;
        Sun, 09 Feb 2025 10:18:07 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7809a2ec4sm640515266b.116.2025.02.09.10.18.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 10:18:05 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5de3c29e9b3so4944622a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 10:18:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXPUsoktix4uDXwVJG052EsRhsMlvUgynMV2Kz/YDxSsDKygzMJdS4xi6ak8twRD/BQf9ywyQ+JqKJXwSg=@vger.kernel.org
X-Received: by 2002:a05:6402:26cf:b0:5dc:63d:b0c1 with SMTP id
 4fb4d7f45d1cf-5de4509ae3fmr12781548a12.29.1739125085104; Sun, 09 Feb 2025
 10:18:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209150718.GA17013@redhat.com> <20250209150749.GA16999@redhat.com>
 <CAHk-=wgYC-iAp4dw_wN3DBWUB=NzkjT42Dpr46efpKBuF4Nxkg@mail.gmail.com> <20250209180214.GA23386@redhat.com>
In-Reply-To: <20250209180214.GA23386@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 9 Feb 2025 10:17:47 -0800
X-Gmail-Original-Message-ID: <CAHk-=whirZek1fZQ_gYGHZU71+UKDMa_MYWB5RzhP_owcjAopw@mail.gmail.com>
X-Gm-Features: AWEUYZkGD7XWYHffjs-JYLiULY2lp9YzIIBQf0_AgiptO5vUBWe1f1MsKggjsyg
Message-ID: <CAHk-=whirZek1fZQ_gYGHZU71+UKDMa_MYWB5RzhP_owcjAopw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pipe: change pipe_write() to never add a zero-sized buffer
To: Oleg Nesterov <oleg@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	David Howells <dhowells@redhat.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Mateusz Guzik <mjguzik@gmail.com>, 
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>, Oliver Sang <oliver.sang@intel.com>, 
	Swapnil Sapkal <swapnil.sapkal@amd.com>, WangYuli <wangyuli@uniontech.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 9 Feb 2025 at 10:02, Oleg Nesterov <oleg@redhat.com> wrote:
>
> Could you explain what do you think should I do if I keep this check?
> make pipe_buf_assert_len() return void? or just replace it with
> WARN_ON_ONCE(!buf->len) in its callers?

Just replace it with WARN_ON_ONCE() in any place where you really
think it's needed.

And honestly, if you worry so much about it, just allow the zero-sized
case. I don't see why you want to special-case it in the first place.

Yes, the zero sized buffer *used* to be a special case, but it was a
special case for writes.

And yes, splice wants to actually wait for "do we have real data" and
has that eat_empty_buffer() case, but just *keep* it.

Keeping that check is *better* and clearer than adding some pointless warning.

IOW, why warn for a case that isn't a problem, and you're only making
it a problem by thinking it is?

              Linus
