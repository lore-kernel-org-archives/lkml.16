Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD781E32D6
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 20:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751316743; cv=none; b=Vkd9xgk5F+GQoQsbctszcSxyJm4isoEe3/VWBYFbYnAKe9ZqJjjmoJuSHv+ofCDmPtGZABkBY9124D10kMoAkWesNw/iyFsrylYUMFjdlyYjG4AOeS0Zvt1daZsE/s/AcNQ0OAjnzn7DvfzKbCyxwUesxvV95ctd79HtXhzSHb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751316743; c=relaxed/simple;
	bh=mxRrvl6YSpyOZkVpd+nnbah+lBUYNtAHL90ESkU1n7s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bWkJypnaVye9Z1LQp6k26zmQr63gllM7CuhzFX8mQjI24riL8pR8+Ao58MMNxtp8lYl0peOy3bvOV54lJrRMEhlmoGOjss53jOGKUMIEVy4ZH9js+pVLr2o/JV4knTd+J2E+gBmoSJaLR4D39rdqUzxhMpnP6G0e1xNHua7Aiuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVIYSwF1; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVIYSwF1"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso2865543f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751316740; x=1751921540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVzYd4Tl2gpultj1nN0TR0VicNkFT38l1p0mf0zbhn8=;
        b=OVIYSwF1Hf4DVE8Fpa6Bfb5TKPxJomqV1StAH9DEnqmtygE38Sb2VEV5BwT2443B16
         n8ovFyW0bd4ADiguthuUPU9FhcXmiR2SRQ9CHMXzyPfbGugSlMou+h9al8joAV+Vkl2h
         VOC4u6NTMn+VJqtG/wrKuBzYMvwxvrA72j/26pmtpmywryTfKUD5/HQvc20+UM4vaMPb
         zcqfkGS1Xi0PSHAmiZx9UnITjccnu5cIE7G+RNpF9Qe4XOqKU+4JcQAZpufM8l/wNKVx
         aR/F9jckvCWXBeREGEE/OYVHF140KycQAncFuFBj3Ya+odX7Sn1NMn2IGuhe3yEs7YH7
         dsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751316740; x=1751921540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AVzYd4Tl2gpultj1nN0TR0VicNkFT38l1p0mf0zbhn8=;
        b=XlI+Wzi6z1RqUr9j7dN3X+8gDgrMkGCnxGW0M4tGl9kB9qJpwhvda2NVupnL8Z3sFv
         Ftkq+CjScufOH3uyAFpJwXiqK7NimzeAXJ0jkQ//A0qemBllh5zTK1Eb6W6ZrE+clgaO
         WuG0gbCTm+dlIzTbycNalC0ux+UukGYVAzLxdBoHp80ehuqEAuj4brQqx4xg1UWKnXS8
         EYx/62NxhAECMXSbqvUUaiHMeEbBo1104rsPsRjW1Um42x0pioU5qJe6nxr5aasL8Uri
         202iIdzXpMV8haUGv0Z/8WlcGeAJCFyzKONPSXDJvxkZUpKNs1KQRZ1AGf6EXtGskFca
         u0gw==
X-Forwarded-Encrypted: i=1; AJvYcCVDnBFHJaJXuDd1jWg/fWBG/Gms2LONV0bN+SiG0DZpXFZqRGZcvvHlPkbTV6wqxzGhAyT2RYaL5diq01s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8ytlGD2eOv1QzgoZjA6CrTXi8dkKAgVDN8M3uT7MfMnnbr1Y7
	MycRpaV+C66HNSMrA2gc+IIMYbbiWYM+Tqmzq7W37nAVao3CoIZjeqV0pgM6dA==
X-Gm-Gg: ASbGncvhQNibwM7vhNYavwwYKFA978yCIcjn0BX5OQr+SlAf5RJ+rQQbmSR3RVM8oWX
	d6ASFi69Mm1AfQ1EYW2C2plHfpmz5Iu6uZo91Mi8qNUv0L2LolQHVaxeWgewGteK8+wXbYcLzOW
	BbjPGzmEneIl7Orj9EJKvUhL6rcnh4w/Rz1ScWqJo//c7Zs4SugHinBVzycz2ZKUJlkVMc40L8h
	tpjARXZNSAgljXbQx6ScX4cI/+AqGrwCqjxNzS5CvOdqy56mDeomRveR4+zXox7acFSEO28Ulmh
	t46vCQJaDqVeERJnAfaWERJUjZQd1pWinxnetpPt69YQFRXJupO7f4AgTRiRiYeKUdhEAkihD5Y
	WJNW2Gr3C7xpXOdJLhA==
X-Google-Smtp-Source: AGHT+IEFvhQ3DTRLYUvObs/6Q4XMPW+98gFdO8K5H8wccOv0hl+MsyFbeGywTiTBWhgruq8DPrYGvg==
X-Received: by 2002:a05:6000:4404:b0:3a5:2ec5:35ba with SMTP id ffacd0b85a97d-3a8ffbd4bc3mr7478685f8f.30.1751316739739;
        Mon, 30 Jun 2025 13:52:19 -0700 (PDT)
Received: from pumpkin (host-92-21-58-28.as13285.net. [92.21.58.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a40766csm147053875e9.32.2025.06.30.13.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 13:52:19 -0700 (PDT)
Date: Mon, 30 Jun 2025 21:52:18 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Imre Deak
 <imre.deak@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Matt
 Wagantall <mattw@codeaurora.org>, Dejin Zheng <zhengdejin5@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 18/18] drm/i915/ddi: prefer read_poll_timeout() over
 readx_poll_timeout()
Message-ID: <20250630215218.1aa32a1f@pumpkin>
In-Reply-To: <1b5d73351eda2d86437a597673bd892baf90fafa@intel.com>
References: <cover.1751023767.git.jani.nikula@intel.com>
	<59bcc15dd4debf00ee0c7b430a3b701462ac9de7.1751023767.git.jani.nikula@intel.com>
	<aF6UOCLdO0fGHGA9@intel.com>
	<f922ec0a42855e17228d3f22d7291b389abe2df0@intel.com>
	<aF67cxjlfWiWMx-4@intel.com>
	<1b5d73351eda2d86437a597673bd892baf90fafa@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 27 Jun 2025 19:26:22 +0300
Jani Nikula <jani.nikula@intel.com> wrote:

> On Fri, 27 Jun 2025, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.c=
om> wrote:
> > On Fri, Jun 27, 2025 at 04:34:23PM +0300, Jani Nikula wrote: =20
> >> Internally the macro has:
> >>=20
> >> #define read_poll_timeout(op, val, cond, sleep_us, timeout_us, \
> >> 				sleep_before_read, args...) \
> >>=20
> >> ...
> >>=20
> >> 		(val) =3D op(args); \
> >>=20
> >> So you do need to provide an lvalue val, and you need to be able to add
> >> () after op. I think GCC allows not passing varargs. IOW you'd need to
> >> implement another macro (which could be used to implement the existing
> >> one, but not the other way round). =20
> >
> > Just get rid of the 'args' and 'val' and it'll work just fine.
> > Then it'll be almost identical to wait_for() (basically just missing the
> > increasing backoff stuff).
> >
> > AFAICS this thing was originally added just for reading a single
> > register and checking some bit/etc, so the name made some sense.
> > But now we're abusing it for all kinds of random things, so even
> > the name no longer makes that much sense. =20
>=20
> Yeah, evolution not intelligent design.
>=20
> > So I think just something like this would work fine for us: =20
>=20
> LGTM, with the _atomic version for completeness.
>=20
> Want to send it to lkml?
>=20
>=20
> BR,
> Jani.
>=20
>=20
> >
> > diff --git a/include/linux/iopoll.h b/include/linux/iopoll.h
> > index 91324c331a4b..9c38fd732028 100644
> > --- a/include/linux/iopoll.h
> > +++ b/include/linux/iopoll.h
> > @@ -14,27 +14,24 @@
> >  #include <linux/io.h>
> > =20
> >  /**
> > - * read_poll_timeout - Periodically poll an address until a condition =
is
> > - *			met or a timeout occurs
> > - * @op: accessor function (takes @args as its arguments)
> > - * @val: Variable to read the value into
> > - * @cond: Break condition (usually involving @val)
> > - * @sleep_us: Maximum time to sleep between reads in us (0 tight-loops=
). Please
> > - *            read usleep_range() function description for details and
> > + * poll_timeout - Periodically poll and perform an operaion until
> > + *                a condition is met or a timeout occurs
> > + *
> > + * @op: Operation
> > + * @cond: Break condition
> > + * @sleep_us: Maximum time to sleep between operations in us (0 tight-=
loops).
> > + *            Please read usleep_range() function description for deta=
ils and
> >   *            limitations.
> >   * @timeout_us: Timeout in us, 0 means never timeout
> > - * @sleep_before_read: if it is true, sleep @sleep_us before read.
> > - * @args: arguments for @op poll
> > + * @sleep_before_read: if it is true, sleep @sleep_us before operation.
> >   *
> >   * When available, you'll probably want to use one of the specialized
> >   * macros defined below rather than this macro directly.
> >   *
> > - * Returns: 0 on success and -ETIMEDOUT upon a timeout. In either
> > - * case, the last read value at @args is stored in @val. Must not
> > + * Returns: 0 on success and -ETIMEDOUT upon a timeout. Must not
> >   * be called from atomic context if sleep_us or timeout_us are used.
> >   */
> > -#define read_poll_timeout(op, val, cond, sleep_us, timeout_us, \
> > -				sleep_before_read, args...) \
> > +#define poll_timeout(op, cond, sleep_us, timeout_us, sleep_before_read=
) \

I might name it poll_timeout_us(...) so that the units are obvious
at the call site.
There are so many different units for timeouts its is worth always
appending _sec, _ms, _us (etc) just to avoid all the silly bugs.

	David

