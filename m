Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05127339A1
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 16:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749054409; cv=none; b=qI7gU1axnH5raoX2pXJUTUq8axChvePBvpP6Q+k0sZEZMnPyggUyCR3ZnqFT54/05FbH5AkPudSoIxZjc7rqYbplsp7CS6a0cIQHqNbDUBuCG5ofxm+W9hfWN73K4nyjj8TZqP+ErK/BV3Lv23U/JpV1LZWhwBLsregfbNtqs1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749054409; c=relaxed/simple;
	bh=b2Jp9y1aS3dq0K/b3a9Q4JLHQgTnLOLgMzTeqWA6jGU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=F4Jl21xMhDCinmrkmHk7KEqZ85/oQ3MgH6e3AVIOu/jLY2f1yWw04emTDc2NW5KWVcLX8SO/fBL1sNwP2M67jhfsnh+cRdNc28Hx9EwyyxrHDa/EPsT/Hx/k1V+dSFLdDnFTpnyFJE62Joaj0WfyRBHj76+vC4J95OOGP3RJcSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sg8txfAy; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sg8txfAy"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-735ae79a44bso5786362a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 09:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749054407; x=1749659207; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ll3GQZZx1aAM5fgTmVcrO9i0nGXI4VPhhW9oOfi4ATE=;
        b=Sg8txfAyFJrCWHpvrorCXdZqmFvZ4Ap+tkrZyBW3nqp/q8eITQ2sX/Ac1qhSOcl7CT
         EHOJXtZFXkTJg+h4IK1ghZK1vplWw54mH8PTiHScDPS6H8TowE0cccD2IaiztfhWwK89
         fJfznLME5OQYHa+Asilr091z0nwJWqIdtpuvJdpEyRNOz2brMZ1+bb9mIXn++BDMLDyO
         u35wJZnLJaKUWiKQFOo7aK5/w6SxjBB3+ucHXta8THu8Sg5BL6IXzHf3dlQ5NpSjVCuo
         6R2orCRFXdf8T1FRGUpMWJ5rdHInUbdXeWCUnAPV9uYRpry9m+HNLHGehdYoeuMhy1Ww
         itxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749054407; x=1749659207;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ll3GQZZx1aAM5fgTmVcrO9i0nGXI4VPhhW9oOfi4ATE=;
        b=R+yldbaFxrxw8V1/B+KgVLcKTbDiRW9bMTCVm/Iy1hiiLB8LQO6jHZQ2PM40FXFQtA
         5Mti6zDNl2rCCwvckEZsani49uoOW66Tuvp0GWPJoBr+J2Bs8kkDV6W6hsqy6HndhG3S
         ddZlESQ+u+x8C7x9Ilvfk7Qmc+5O/YFU2JGEbR6ZSWFYAKk+lOYVpVLrknFrzgKJ7Sg4
         1ooN5DmugznI/9PvYa00AGBUSm5/hi8z1iiV+FO4K8xeFCGHnv+mQzR39O0G8+t9PTAn
         D9wqRt82WejKYOCnzTDz6Z/UWln/KsMSi2AfK/jdeajfMZQPp9xCR4qKIi/n8UmNb6cU
         hoow==
X-Forwarded-Encrypted: i=1; AJvYcCURyObFP9ahsv9SNexvCm2vj6/TGtgx2kBBS17AJpOOBMuS4vQu7VGWhm2ZagRG27jtmUMCer4EgM+LlM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAUEIL1KV8UvksrzagMfXXpTt8siOt20rog/c19oaRWTgRVkFh
	wq97Xdaj4d6+Rh/IWUUtwJev2UVueJ6Q7a6lQRhoMgTcIk623YEehQCXsgglBxSJS2iDeW77C/G
	wYmboaw==
X-Gm-Gg: ASbGncswoiR5B5Xrhcjud5LWIm9sneTshyBwQNdmRbpsjsFA+TMqAEHwxTigm+o1dRm
	qjKB+u0Lci0d1p5CWRvdcwd0n7K3ObeXs/RSBa+Sm0HQz2PHh2ExSuT+KGS5hDdmaIh10UemtMC
	d3acADTlaes0+KPGjE80mdWHkUswvLr95AGhJfkRkt7yqoHpz+jbAueYfo5iaipGGgkdcwtCYgv
	tADqDD0evBMIPIvEBGx23kFoj+xvLAGJdfrkzNw/BHRQnycqxlAGRC67uiPAfVK108mC7BnuIDW
	YbKAxkvlK0M2CBFFmDmLvF7kvPhoX311pfMs/mvdxv5p+q/3ZV4M/vHk4FwrpqsrQeZWma7vwCi
	b8y2N+uLdV5EE74R8yIj1f9z+KCbxXAnfCHGTXeXfnovvYA==
X-Google-Smtp-Source: AGHT+IGSJuYZ5PsSec3GKgHBhYBIFvpgIeA062k15kkewiYaZixAYmRU9waq5Y86IJBjw0vOZ1huZA==
X-Received: by 2002:a05:6808:99a:b0:408:e711:9a8 with SMTP id 5614622812f47-408f0f68e39mr2160313b6e.15.1749054396518;
        Wed, 04 Jun 2025 09:26:36 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40678d038c0sm2244681b6e.46.2025.06.04.09.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 09:26:35 -0700 (PDT)
Date: Wed, 4 Jun 2025 09:26:21 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
cc: Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, 
    Matthew Auld <matthew.auld@intel.com>, 
    Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
    Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
    Maxime Ripard <mripard@kernel.org>, 
    Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
    Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v2] drm/ttm: Fix compile error when CONFIG_SHMEM is not
 set
In-Reply-To: <6b3a37712330ec4b17968075f71296717db54046.camel@linux.intel.com>
Message-ID: <d996ffad-42f1-1643-e44e-e837b2e3949d@google.com>
References: <20250604085121.324be8c1@gandalf.local.home> <6b3a37712330ec4b17968075f71296717db54046.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463770367-1698767313-1749054395=:6218"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463770367-1698767313-1749054395=:6218
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 4 Jun 2025, Thomas Hellstr=C3=B6m wrote:
> On Wed, 2025-06-04 at 08:51 -0400, Steven Rostedt wrote:
> > From: Steven Rostedt <rostedt@goodmis.org>
> >=20
> > When CONFIG_SHMEM is not set, the following compiler error occurs:
> >=20
> > ld: vmlinux.o: in function `ttm_backup_backup_page':
> > (.text+0x10363bc): undefined reference to `shmem_writeout'
> > make[3]: ***
> > [/work/build/trace/nobackup/linux.git/scripts/Makefile.vmlinux:91:
> > vmlinux.unstripped] Error 1
> > make[2]: *** [/work/build/trace/nobackup/linux.git/Makefile:1241:
> > vmlinux] Error 2
> > make[1]: *** [/work/build/trace/nobackup/linux.git/Makefile:248:
> > __sub-make] Error 2
> > make[1]: Leaving directory '/work/build/nobackup/tracetest'
> > make: *** [Makefile:248: __sub-make] Error 2
> >=20
> > This is due to the replacement of writepage and calling
> > swap_writeout()
> > and shmem_writeout() directly. The issue is that when CONFIG_SHMEM is
> > not
> > defined, shmem_writeout() is also not defined.
> >=20
> > The function ttm_backup_backup_page() called mapping->a_ops-
> > >writepage()
> > which was then changed to call shmem_writeout() directly.
> >=20
> > Even before commit 84798514db50 ("mm: Remove swap_writepage() and
> > shmem_writepage()"), it didn't make sense to call anything other than
> > shmem_writeout() as the ttm_backup deals only with shmem folios.
> >=20
> > Have DRM_TTM config option select SHMEM to guarantee that
> > shmem_writeout()
> > is available.
> >=20
> > Link:
> > https://lore.kernel.org/all/20250602170500.48713a2b@gandalf.local.home/
> >=20
> > Suggested-by: Hugh Dickins <hughd@google.com>
> > Fixes: 84798514db50 ("mm: Remove swap_writepage() and
> > shmem_writepage()")
> > Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> > ---
> > Changes since v1:
> > https://lore.kernel.org/all/20250602170500.48713a2b@gandalf.local.home/
> >=20
> > - Instead of adding a shmem_writeout() stub, just make CONFIG_DRM_TTM
> > =C2=A0 select CONFIG_SHMEM (Hugh Dickins)
> >=20
> > =C2=A0drivers/gpu/drm/Kconfig | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index f094797f3b2b..ded28c71d89c 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -188,6 +188,7 @@ source "drivers/gpu/drm/display/Kconfig"
> > =C2=A0config DRM_TTM
> > =C2=A0=09tristate
> > =C2=A0=09depends on DRM && MMU
> > +=09select SHMEM
> > =C2=A0=09help
> > =C2=A0=09=C2=A0 GPU memory management subsystem for devices with multip=
le
> > =C2=A0=09=C2=A0 GPU memory types. Will be enabled automatically if a
> > device driver
>=20
> Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Acked-by: Hugh Dickins <hughd@google.com>

Thanks a lot!
---1463770367-1698767313-1749054395=:6218--
