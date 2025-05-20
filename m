Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA70011187
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747746623; cv=none; b=PKzIGhJ6RUYXSCzOIEZv8PSwNjW/h6UmmxoTzchMBBvrFUDtAP794eJnIw6Agq59YQtQIZ9JEW2IzlOPLwLRcMDNy793Q/KbDtFs4LxZWimbf1Mr9htNCyDMq2sCSE1bciRmEpmXLE3Fs1bVtuSoNs+eUcno6osthGpFPBV7xUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747746623; c=relaxed/simple;
	bh=zQn2/qVp7aVOulzGVWCXqmrs16Ff9BYUWMvM3Ni25h4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zue9+VwcDVSmYuU28Ew2Pj7YTxOSJUFjT1rOv9lOn4cmS4WDEHYpZceOiVRIdm5WohEDxVmu6k/j2x9h7orYw4+/M2R5emqK/3lzXvBCWmEc8LvLrXGqRbXgzZmUk+vLVEl8Y3OA093fSFmoGXY9z8c3xlGjhPdIo4p7aG7eEQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-476af5479feso61396501cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747746620; x=1748351420;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PihPyOnVfAc0awqgzD+HWXM/THFITbZ4L2dMvsSbwyw=;
        b=LUHJFN80arRukLQ5mqSXXRQ2nc0RrgbCTR6KiXRW43JJS4ALxiz0RAmIFp3L+cLY1s
         pYoGw8IqY+7AM9x1cFspCWq0bBOkLZO7GN0Vy1iZTFAm8RynVVGmh85BJSY+Lb0CF0fR
         s408lf1GkB1hRBwSRthY8ai7H4XALlf5Lp/Jz9tlaBDf82a1gUE+HcOuabBaSn+o+Svg
         o9jp6LZkyuh5lyHJbaYnxyOpZBffOcRqtj0AtUEaMEZH6byyEEWCLV245V6zy+1i/1+M
         Qdn9ZQbIcytsS35yN8Kgaevt47C9ljSECdSVS1x6MeXGo2BA8F0ZUM5jDh3kKgXsVlEJ
         PnDw==
X-Forwarded-Encrypted: i=1; AJvYcCUp3DMiXKHG7YRi5BGAO9KrmP6R37JF4R/zQyws3KfhjisEMxesGGvOv6XUcXQYJtam6QCFyl5uApuiiZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0zFBaQgTN01n3uBg7XlMjLGYjP7kwwPZH0DIp3zBwFm8J0XN4
	lxGPZ978RXNcSbmizzMbM6lWzUFb9LfgQ7QrC/Zl7lEpKlPvJlMnrhcRlTkFvaBH
X-Gm-Gg: ASbGncu4mjbkpWACUIRQMwxHbh0XF2FN6obYJoc3Og/suSxUjQu7dPZAclnUdeOUeh3
	oUWm+KSylV4RBatAAgOfLp5fWtQBQ5VA5V1Q0RCjgoqbh3ASDvTW4d7DLeIKxAXXynq+/5jkIwS
	moWfBqfhzqCncNSrqpccGSPg+h6gHwyID9DFki1CG3fuoMBXfy0fYuF90/JgGjSBIertoMHtqhN
	qLLjmJVNqJljyC6bYXsa9z4kKYBpFpLRTi/H/+2mnf0if+HjPv9jUk/QyWP+o3DN0zFmf6XSztE
	fX0vLos06YgY7n8RAwwPjaFC8O/oS245xVI7ZSMg128Ag0WPGUp44YmnK+ACJ5pjSdmrOxvTHWv
	IPkEpxokaxB33JA==
X-Google-Smtp-Source: AGHT+IH9miQxwpTdxOxj1akcb32psAGmxyg0UaEYQhsZvF0zIKwb6fWnmLlWvr+PFELFw/TcOjgssw==
X-Received: by 2002:a05:6830:3485:b0:72b:8326:f0c7 with SMTP id 46e09a7af769-734f998b997mr10791874a34.28.1747746609144;
        Tue, 20 May 2025 06:10:09 -0700 (PDT)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com. [209.85.160.44])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-734f6b7092bsm1758460a34.69.2025.05.20.06.10.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 06:10:08 -0700 (PDT)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2d522f699bcso1843074fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:10:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW64A6YiTBdRhvUZSLCG3Ko0KMF8dPZheI0uubcc+Vqw/jjP4GICQtJ6p+pKVoBpm0+91j4zMg/2YzpVJI=@vger.kernel.org
X-Received: by 2002:a05:6871:6089:b0:2d4:ce45:6985 with SMTP id
 586e51a60fabf-2e3c82002c8mr9244405fac.11.1747746608411; Tue, 20 May 2025
 06:10:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1682cd80989f9ab98a7a9910a086a3a4d9769cc6.1747744752.git.geert+renesas@glider.be>
 <07088966-73f4-4b5d-898d-b596dede53e4@suse.de>
In-Reply-To: <07088966-73f4-4b5d-898d-b596dede53e4@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 May 2025 15:09:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU6XD_tqXaf4-h9KeC58XDOodUWa0d-Wmp6zcr2BHTA1w@mail.gmail.com>
X-Gm-Features: AX0GCFuWRN-2Q9BJGy-nr1GbiWBc5HMiQPDlkidfm2ZCaSPcGNWJYB8zl_mxdns
Message-ID: <CAMuHMdU6XD_tqXaf4-h9KeC58XDOodUWa0d-Wmp6zcr2BHTA1w@mail.gmail.com>
Subject: Re: [PATCH] drm/sitronix: Fix broken backwards-compatibility layer
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Tue, 20 May 2025 at 15:04, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 20.05.25 um 14:40 schrieb Geert Uytterhoeven:
> > When moving the Sitronix DRM drivers and renaming their Kconfig symbols,
> > the old symbols were kept, aiming to provide a seamless migration path
> > when running "make olddefconfig" or "make oldconfig".
> >
> > However, the old compatibility symbols are not visible.  Hence unless
> > they are selected by another symbol (which they are not), they can never
> > be enabled, and no backwards compatibility is provided.
> >
> > Fix this by making them visible, and inverting the selection logic.
> > Add comments to make it clear why there are two symbols with the same
> > description.
>
> These symbols were only meant for variants of 'make oldconfig' to pick
> up th enew symbols. They where never for being selected manually.

But that pick-up does not work, unfortunately...
(I know, I had one of them enabled in one of my configs ;-)

The alternative is to just drop the old symbols, and ignore current users.
Which is not that uncommon...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
