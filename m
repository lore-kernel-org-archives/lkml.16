Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE9C21C18E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 04:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749531368; cv=none; b=s30uHGW0seHrkjh0aq4gVdNiF7t3jJVpOR/4xDQ1hIWT2v9UIKN4OhUm0MBiOH1NHBE6Xglw/+1VXEJfRVcYY6DIk1L1j21g7Zt8WvtPEF4Ou60t0cLVkwpJ67X0JSCeHY70XUcEgh/W3Gc7/tMimOP9NMqu7xztVHa3aQ9JW+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749531368; c=relaxed/simple;
	bh=ACrPjCNMNkwFDXJy7gnBW2xPAwHaQ0JnySCEiCWvtMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FfHkXiWLR7rjoDD/aVlh4bk916P6/ecKTm7r384AjZTBpxERShn2H5anp5hisrwAZSnHwe/4uaKN+70e+mRE2ODcbvReZJi5dhSg4KTU1cJTo0BhJDfbsKN1D5iIfyOgf2paByanQQ9HvX1rhU2EPFpbsduuT8AglrpmXgaB5Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Aj8Rjr//; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Aj8Rjr//"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-74264d1832eso5778040b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 21:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749531366; x=1750136166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qki4u1ARte4A1FCY+DBjuYiE3kbSTbsi4JExJG2FT2E=;
        b=Aj8Rjr//ohdp+oCP2hGvLID7LSE5WbbWWiZOQ/2ylF5AGNgr8QYAqCJe7DpZQvFpBH
         U2RLw3grYXnvy196Z/kg/LdKMWa/gdYcyLENoACUiWYFMIAbYhaLdJXv1yugT+K5m4SG
         tB6mUklR/pc//90QoDmKKuUoylbOgjlDKzJ/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749531366; x=1750136166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qki4u1ARte4A1FCY+DBjuYiE3kbSTbsi4JExJG2FT2E=;
        b=SXTTNm3XbobTOTP+O+VC6GSxrff5X6Z/+4iaz3v/uu/Ao8mjOKIpz42oFhwBaj/Rda
         FkBYI+6UVZXIKO2WYV1c5Ugahtu1kRJ+J26uixhbQaIojP76lBCd+zN+tBI7SaG+HuNL
         ulUbwl4ImFJuptY5tb+7KgWiORG2H8Ax81sM187bdfD4FEU6nxT+x4T2EeEUDkf/of1T
         hieEfFVJpoKnjPc1IByEv42Tv8wyYFeOLzHg3YPWLAGqQgV7t0+u7/E21Le/Wmi6EMPO
         x++p0QLvBlQ9+fiE9lYJRthmpXc4+U3oh8WG3vMtjpfpgJIugGdKQdy2bM78ofq+gWx1
         aLBg==
X-Forwarded-Encrypted: i=1; AJvYcCU1d1MpbjdRjR1LPdWCRpJ9evfZn5nuChMed3WbjDsyd0OGOEHcb5+oOdy+1hEi0+I3SxR7ehyZkNPVxxI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx57oEn9ojHt8lMywwP4vXCbnGTD9DXWWhju1QPSdmsMJfIx6SC
	jCXVeXCl529bhtCYP9BTEt4sPPBJLU58ujxFgrU93oHybpuZGPMTvY0OcT23VsLF3Q==
X-Gm-Gg: ASbGncuo+2XbY9D6jRP27AU6JOF+upAm4TRJ0lEkhwRV791ubhZimiEtl1/ZVJ8Vmer
	bs9Uorl/szj7zWYGtVRwAR+T3gpOBTj53uEa+9oClztpr5j4ugKZwoVFbaGDX6l2qyjWy3CaCJo
	mBOisx6Uhpm1RQBh6/99EyL30Ve8nsTPK1J+IFuSHrfeQHUWkH6bGyb3hF5TyKcYOHWYfqbF4b7
	LQtl0xRdAF0A6Y8L0q8eLcioFXF9ri5EjTXfHcxJPc2wCLzGr15puuy0EeB15rGTyk+AZU1IJM7
	DJ9tU91gU8aaU3owKwuiAKxZawMpVRSkChD3et2dfbOuYntufisbXa+QRa3acJ6QiA==
X-Google-Smtp-Source: AGHT+IFSDAss5UN+FP5CfZ0KjyYXiBlN9b2UJ6xKVd1D/6YzHaiPhv0TdnCukpQpMXZECc9dafUTWQ==
X-Received: by 2002:a05:6a21:a616:b0:21f:5532:1e53 with SMTP id adf61e73a8af0-21f55321f30mr8226224637.33.1749531366270;
        Mon, 09 Jun 2025 21:56:06 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:ca42:1883:8c66:702e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0847b9sm6815101b3a.104.2025.06.09.21.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 21:56:05 -0700 (PDT)
Date: Tue, 10 Jun 2025 13:56:01 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: fuse: suspend blockers
Message-ID: <chiicm5lwiok5ni6evrohkjvmt3upy5ikm7vdxz5ukops464kg@vf7hr2mprg3i>
References: <jofz5aw5pd2ver3mkwjeljyqsy4htsg6peaezmax4vw4lhvyjp@jphornopqgmr>
 <CAJfpegtNB22Dpi=wX8nBDx=A9SeYZKpZGniJHBBxJBHB3o0nHQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJfpegtNB22Dpi=wX8nBDx=A9SeYZKpZGniJHBBxJBHB3o0nHQ@mail.gmail.com>

On (25/06/06 10:26), Miklos Szeredi wrote:
> > @@ -241,7 +241,7 @@ static struct fuse_req *fuse_get_req(struct fuse_conn *fc, bool for_background)
> >
> >         if (fuse_block_alloc(fc, for_background)) {
> >                 err = -EINTR;
> > -               if (wait_event_killable_exclusive(fc->blocked_waitq,
> > +               if (wait_event_freezable_killable_exclusive(fc->blocked_waitq,
> >                                 !fuse_block_alloc(fc, for_background)))
> >                         goto out;
> >         }
> 
> This looks fine.  We can turn each wait into a freezable one inside
> fuse.  But that still would leave core locks (inode lock, rename lock,
> page lock, etc) unfreezable.  Turning those into freezable isn't
> realistic...
> 
> But a partial solution might still be better than no solution.

Thanks Miklos, I sent out a simple patch set [1]

[1] https://lore.kernel.org/linux-kernel/20250610045321.4030262-1-senozhatsky@chromium.org
