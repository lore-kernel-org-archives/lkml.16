Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56972C2AB7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 22:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744757371; cv=none; b=ZcnI3iU5gcZbM5ZL/+Z68QTFUmGn0MqGLs9LmvwVwskcUPBDHFUdTMkXPI1aZETVfjnkTXkx7uYtXm8kmVNZivN8x03tigid/76JZ26h1r1f29Yj1BzsUdD+3OalxSCs/Yga9/tzFijdBVL1WW1EF+QwDA7La2xZOTKgDrfWONg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744757371; c=relaxed/simple;
	bh=4tpKeEU4oHsr9RgoZBwILILJIKvoS2vU+4HEMQLzFVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mpPTetGjCy0i2xcqt8f+Zb2tj1IlAy+wo3DkfDcRrorZLnWfzPMlZi5AFYDPjZ1Z9GRbAhDH77dADkttj+OPkFUS8u/H81uFbQABBIdfIh7YmxmCwwsVemtGNhy8X5Eqc3q31izZ+DnmezMoeHo6vMgXbQYgV5NB3i82O8z6O24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=coRb/he4; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="coRb/he4"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e609cff9927so4281096276.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744757368; x=1745362168; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBy/k/5Nk+oz59QuiwTpYbqHNj2ov+/FVca+4VwHPcw=;
        b=coRb/he4qEhqiWdpwr8TrtORcir425hZ6oTAQtG3R/LD259TlJBiAJtx86RRpMdjJ2
         kgJAE7FKfvXrAZ9dD4IePdd+9IaGN7KaksTM5Y1mX2HnebsF9itfS/LosuF1+nf/npNy
         EVuZGv2XQsA2ByRzcq2k2U60J/Kgn00u6SnTb1uHExspP+HJWUETBPtpLCQW+EWnL3lg
         Y1tLF8KHYDkemoHeusG6iW/V+eMgE1XAwp8CPtXCM21QhoNGG/tn8AZG313Hya6SG6M7
         Sx+78fC10mjXtk826IFR0xgQhi4Knu+1GkCWfFLjA++FE0GDPr6mydSLmZjlxcD+QzWl
         7i7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744757368; x=1745362168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBy/k/5Nk+oz59QuiwTpYbqHNj2ov+/FVca+4VwHPcw=;
        b=WRmrtBP1YfjL3Wa/z3zJNK4K2Y5k0rrqRPgD6CJTS86sXzaNNoj5W8AlD/+s1r0JA6
         uSVEXNNSGWlv1iPvIli5NPM7WwpO7t5lLT14tXcazsjpMwPKAoLRU+/kfWwVn8qxEpap
         a9LCiNDwecI4JLa0gRMkgO40LUY+aU54hG6xrcN65YzImlW5hjEqP+uiTnKx4f9laicd
         SMrJH9LXRkZ/IIupCZAAW6fpTVOcZ2/3+SmE+obM7ZnqIgp9N7Ebc4R3/taN863uqrDs
         gqargn+Crlgmg7iYsxvAllc1IPI78pXQkI96eCBqg4O94KWVKmTLq4Hom8AheJUJxaqr
         kB4g==
X-Forwarded-Encrypted: i=1; AJvYcCWkwOeGA+TzvPj6PXT1lniPZRQNu6OK1lo4HCPz8+Dw1boNRWOxgWzC0tF2PFMUJ39h+XlhwHbKKEiOzD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDXdknuInjwPV1VMf/h7Ir2ypDlcc7VjbBkkv3PZOEnaO5jYNm
	5An++AQg6qA95L5CY8HsLNxnZmVv0dJRRPTf+G6xHwzLtzkAq3TqyN/DVCm0LCwH+2suTM4LQzz
	43OtWigLwS8qclRTx5LF9uHg7T7c=
X-Gm-Gg: ASbGncs1Hv/A7P9JBMvO0Ckuqv/XinAMC5//lO8Sa3mfteg7T1IlLljDauyswEe1R9S
	5pbPIeX0pJKBtGWe2TjDvdZ2XJi79CpI7p44BdWerloqdVzGiGJeQAMEoLMmVL812n1cxg4d1BC
	YLOVQO5/hyMsktWihGpZgu
X-Google-Smtp-Source: AGHT+IHKwNRtebTsCB1ynvwlleGqOBo6vd1fadMzVDtULsLDAE2yNxumOT7/yZv12UgE0QLbAucJrcqv9ZjoW7UMOwc=
X-Received: by 2002:a05:690c:3707:b0:702:195b:7ebe with SMTP id
 00721157ae682-706acee3f2bmr16326777b3.22.1744757368597; Tue, 15 Apr 2025
 15:49:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
 <20250402174156.1246171-27-jim.cromie@gmail.com> <cb9fc7d1-9533-495b-83e1-6950bdd45e85@bootlin.com>
In-Reply-To: <cb9fc7d1-9533-495b-83e1-6950bdd45e85@bootlin.com>
From: jim.cromie@gmail.com
Date: Tue, 15 Apr 2025 16:49:02 -0600
X-Gm-Features: ATxdqUEynsfg7YuXOle9oKp2N721l58a4kxxw0vTAgdjbpOnM2FgU5Sva6pebu0
Message-ID: <CAJfuBxxGRujd01b=Ou3MDL8XxX0kOHS9LHWQZMC8xGy+uESqOg@mail.gmail.com>
Subject: Re: [PATCH v3 26/54] dyndbg: change __dynamic_func_call_cls* macros
 into expressions
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch, 
	tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
	ville.syrjala@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 4:06=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
>
>
> Le 02/04/2025 =C3=A0 19:41, Jim Cromie a =C3=A9crit :
> > The Xe driver's XE_IOCTL_DBG macro calls drm_dbg() from inside an if
> > (expression).  This breaks when CONFIG_DRM_USE_DYNAMIC_DEBUG=3Dy becaus=
e
> > the invoked macro has a do-while-0 wrapper.
> >
> >     if (cond && (drm_dbg("expr-form"),1)) {
> >        ... do some more stuff
> >     }
> >
> > Fix for this usage by changing __dynamic_func_call_cls{,_no_desc}
> > macros into expressions, by replacing the do-while-0s with a ({ })
> > wrapper.  In the common usage, the trailing ';' converts the
> > expression into a statement.
> >
> >     drm_dbg("statement form");
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> > ---
> >   include/linux/dynamic_debug.h | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debu=
g.h
> > index ce221a702f84..2d87cca27544 100644
> > --- a/include/linux/dynamic_debug.h
> > +++ b/include/linux/dynamic_debug.h
> > @@ -337,20 +337,20 @@ void __dynamic_ibdev_dbg(struct _ddebug *descript=
or,
> >    * (|_cls): adds in _DPRINT_CLASS_DFLT as needed
> >    * (|_no_desc):     former gets callsite descriptor as 1st arg (for p=
rdbgs)
> >    */
> > -#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {        \
> > -     DEFINE_DYNAMIC_DEBUG_METADATA_CLS((id), cls, fmt);      \
> > +#define __dynamic_func_call_cls(id, cls, fmt, func, ...) ({  \
> > +     DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);        \
>
> You remove the protection around id here.
>
> >       if (DYNAMIC_DEBUG_BRANCH(id))                           \
> > -             func(&id, ##__VA_ARGS__);                       \
> > -} while (0)
> > +             func(&(id), ##__VA_ARGS__);                     \
>
> But you add the protection here.
>
> I think in macro it is better to be defensive, so I expect to have ()
> everywhere (except places where it breaks the compilation).
>

yeah, Im a bit inconsistent.
defensive parens are almost never a compilation err.
I'll go thru the macros again


> > +})
> >   #define __dynamic_func_call(id, fmt, func, ...)                      =
       \
> >       __dynamic_func_call_cls(id, _DPRINTK_CLASS_DFLT, fmt,           \
> >                               func, ##__VA_ARGS__)
> >
> > -#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) do { =
       \
> > +#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) ({  \
> >       DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);                \
> >       if (DYNAMIC_DEBUG_BRANCH(id))                                   \
> >               func(__VA_ARGS__);                                      \
> > -} while (0)
> > +})
> >   #define __dynamic_func_call_no_desc(id, fmt, func, ...)              =
       \
> >       __dynamic_func_call_cls_no_desc(id, _DPRINTK_CLASS_DFLT,        \
> >                                       fmt, func, ##__VA_ARGS__)
>
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
