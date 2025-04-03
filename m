Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374DE1DD9D3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 23:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743723291; cv=none; b=rPXdJoF64XAEz5yNeKLK3m3o/Dh956m/nxNxsF7IurfZEErJ03lpy6R3pvEuKAkf/d/gxuEdFvlQNATo/daWgkLu97SyWLOczGut+0Nbl9gICPHjwllk0bQMS4TtXDzjictAbMd4pqUu1mXTzVQunsoFCaNjxje5Q24ez6/Xj2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743723291; c=relaxed/simple;
	bh=yPfUoEabLqKntQr8q5pur3n1i93VDPliNk27Nfw4Yc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DYFpVg+1sM5p9LggbghGtgI+WqT3+GOEFvmsLGsUC5x+w++IXFsoRsSDSLOgudjCRTw1ITR07v7PMpgQ17a8MGL0jRFutpd5w2MCUQPsxSzSjC3AQt2n380a1XgZ8A2+vS2rso/KQxdcE6zbn4Enq41kHnM2UGHA2QrDk9vfim4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aU61gBdf; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aU61gBdf"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5259327a937so642017e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 16:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743723289; x=1744328089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avbDQjcLHqr7esMYO8nwxUtIxsYjEDsKF3924zpDBE0=;
        b=aU61gBdfWyUpb3HoM5Mqz2LREy79t4vloMgbqu28wqEd2EzJgx8hUA0w1wmrO8pbgn
         B3qMNVE/K/eKsEHxMzR39QHYpNENOpzYHlJpDv1l910NQNu1Ko6bQZyg7B4Bq32RB9ii
         K5LZvzjVdNHFRYfeIeFArp5GGMsx8CfoMeBmAim+174xFE1b8dLTdTKKaNUVv34uAUWI
         anwdLu8bopgF+WQt4J42h5xj7nGtioelzlATQ0HEDScxFE5jIHp5wLBmHX+ss4yzLw3n
         PUfp33GKp3z4r9ZB8BoaupiRdkkGslxAjjmIVlVMOG1E2dhPkAGhjxheTCu+fM+V1GK1
         DmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743723289; x=1744328089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avbDQjcLHqr7esMYO8nwxUtIxsYjEDsKF3924zpDBE0=;
        b=upGtZ0Rrfo2IS4uFsWQRTxzBor7bgna/6rBvucjIwosqpcQ+2zjhvFo/iuFSO53na0
         UGlYz00w72EkNqwii6k8wuSC5ASIGHtHCptFL1B4EbTlA9iT6iUo+lGLDIv7HwCjWPo6
         cI3WZ/LGx4o+Brmd4KhT7KvhamOmsLuEw6B1SZ+AVQEn2UiXuNfvH4O5j8T9rkolPLCp
         gcWP2796kT9k7J+IbGRIMubh+faiqSsDlJbqbDkPQiFBudNEHw2RvZQCNLFvYqsXaRr5
         N2XkSzKX5uYgS2Q5PUmSayf0xFRbYkTQWOEpU0AMYVXO2Wz4alxDfL8VAJwNI40mwiEz
         ZRuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEnKkyyIm4RWe6jFIzZwkSM9UQZJDGQn7cCO7beeXPCvFGkfwLLmw4dsZDOerciJS7TikyRftELmqe8yU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrMOpcIYtWy3rr0B6mS/8Klmzp2+nSwJlnVmDIGRCql7y9Xvlp
	X4/988bxLEAt1mCyauBIWY18ueC/bH0td70kJcwHIGhUGhIu1yt0FaETy2ruDsgo0+evOrBIpQV
	pu8ZPB8DVdA/xencFzCJ13vd2y+Q=
X-Gm-Gg: ASbGncvLyjeQkqAr+B2m3A+t/Z6H9meJIPbmmDBHShxHNOvuyf35UvzVTpmXX7sdkTg
	M9JpXAQJeNsIy6VAT+t2TSMuKoRJA420dCZBdfI/umAds+qxQpw737TIjtapyYoJ/K6FoaezgUY
	pVC9jOoIhqTEFdMUutyAS6Lu8zcJs1fWwf7nRlfw==
X-Google-Smtp-Source: AGHT+IE0jVTAdZK/1z5sRC69OvaJbihukmG2bfl5C4hSu/+suvfXKUqs00L2PVJ92KBbTrochuTagRBujIH4Xq+OURE=
X-Received: by 2002:a05:6122:16a6:b0:51f:fc9d:875d with SMTP id
 71dfb90a1353d-52764573f29mr1079951e0c.8.1743723289031; Thu, 03 Apr 2025
 16:34:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1743685415.git.abrahamadekunle50@gmail.com>
 <1325d06f5a4eb18eb52eb20d5af89207504c46b6.1743685415.git.abrahamadekunle50@gmail.com>
 <Z-6PlWGmn09hYYKU@smile.fi.intel.com>
In-Reply-To: <Z-6PlWGmn09hYYKU@smile.fi.intel.com>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Fri, 4 Apr 2025 00:34:40 +0100
X-Gm-Features: ATxdqUE2HQCOn8HmmyJdYwJeZCngwFtMlNx29UmcDIb26j6tvHO7ChxpInIanIg
Message-ID: <CADYq+fY-y1BqnzK7fCvjPhLfvpTgMeiK5_XCoF_BZqiYyX_1bw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] staging: rtl8723bs: Prevent duplicate NULL tests
 on a value
To: Andy Shevchenko <andy@kernel.org>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, hdegoede@redhat.com, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 2:40=E2=80=AFPM Andy Shevchenko <andy@kernel.org> wr=
ote:
>
> On Thu, Apr 03, 2025 at 02:26:43PM +0100, Abraham Samuel Adekunle wrote:
> > When a value has been tested for NULL in an expression, a
> > second NULL test on the same value in another expression
> > is unnecessary when the value has not been assigned NULL.
> >
> > Remove unnecessary duplicate NULL tests on the same value that
> > has previously been NULL tested.
> >
> > Found by Coccinelle
>
> Missing period.

Noted.
...
> > +                                     psta->BA_starting_seqctrl[pattrib=
->priority & 0x0f] =3D (tx_seq+1)&0xfff;
>
> While at it, make this more readable:
>
>                                         psta->BA_starting_seqctrl[pattrib=
->priority & 0x0f] =3D
>                                                 (tx_seq + 1) & 0xfff;
>
>
> > +                                     pattrib->ampdu_en =3D true;/* AGG=
 EN */
> > +                             } else {
>
> > +                                     psta->BA_starting_seqctrl[pattrib=
->priority & 0x0f] =3D (pattrib->seqnum+1)&0xfff;
>
> Ditto.
>
> Also consider to use module operator as it shows the exact amount of the
> records we support in the circular buffer.
>
>                                         psta->BA_starting_seqctrl[pattrib=
->priority & 0x0f] =3D
>                                                 (pattrib->seqnum + 1) % 4=
096;
>
> Since it's power-of-two denominator, it will be optimised by the compiler=
 to
> the same code as it's now.
>
> > +                                     pattrib->ampdu_en =3D true;/* AGG=
 EN */
> >                               }
>
>
Thank you very much for the review
I will send an updated Patchset

Adekunle
