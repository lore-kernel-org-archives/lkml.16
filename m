Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E331865E2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377077; cv=none; b=qaTcjipnXEojsm3GpWpj57YEVUEEuvNDRbMGpKlp53mLOdRl1Xo1H/eJPB8fxpC7WWd+CSp27dUEC2tEoRmyec5shKCZMr1vLusiFO6Yfngx2HJFzASroh+6ZZN/YCsKnOBl1kYrtB0IjlkMKVZwZDa/daK/vSDPvylN4WBLM98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377077; c=relaxed/simple;
	bh=b90QMSZdF7aLByNUjzfPWgG5MIx777w7nz595hC8aX8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qVjW4LZpFAbixkHEGmlRZ+2eYTkfnle51fNB6asYYWKczlV/2SEVA4G5vvFPegC/RCMSWCHDGfKRFXG4c5z3IrxrAOXY/CBOF2phV+IPkFLZ3I9QRqAnc/6gFa4Ox7WrijlUloFUsR94lfG5hoXXmHWek/lQn3NdmZZDl9ylrZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fssDc4DM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fssDc4DM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744377074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sVZ4QSAu2dyki6ocaWRXYDX2sA20EeQkrcN4x5tVkmQ=;
	b=fssDc4DMaW5W5OtvxvE4w9SaX4O5G8jYlGk7TCvz7+9lvo+LSrNJyEHfSFmx2z/GfhHZOz
	zLbN94JqrkPXRaTLyeObNPwp+2ztovpQQzn8mxQQbY1DCUV2hyeoFa0cxe0aFZRHnaGIPE
	iefG4Y9LG9mJ2HyppYiALfyO8erggwA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-EWbCYDdxPfKNqutxIq5uag-1; Fri, 11 Apr 2025 09:11:12 -0400
X-MC-Unique: EWbCYDdxPfKNqutxIq5uag-1
X-Mimecast-MFC-AGG-ID: EWbCYDdxPfKNqutxIq5uag_1744377072
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43947a0919aso13797945e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 06:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377072; x=1744981872;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sVZ4QSAu2dyki6ocaWRXYDX2sA20EeQkrcN4x5tVkmQ=;
        b=EjrcT2PsfNaSzamkIROzw0lmrxcCRfw1CfoRR8niaRzNHCRTplpzc7pA88oVHzWDUD
         +Nqm+xFx5H5VuPmqQv6uTjPGaUIeUVFo9ffuhkiSGFpPT3mX4G4nTx7zk974lQWJZHH+
         isLPa2JshytcQC9SHlF8h4U3xr9bw9k+8VxJlsNtVRTYJVzz36UC4rQqma3BoCjUxnMZ
         26KrFAM38KanBKRNJHO6FQOZ5gu0d3LWPPBVMABKuW8jp2XAOHOoGc+xDJDHXd+Ie4yo
         yZ3SS/R3XuWFPaGH3szlfr8WgVg4ODc0Y/W8ODWlEjb+ElP1M3FFO8BmoZrhK1z4amjy
         w1Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVplFNKZV24gxCrens0URwp7K3x312zLbsyCqdD8klB4BBcn2m8XynnYL7COnj1fcHgyO3IsuhPqQhanT8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya4EvD/RDGxAxKiN6KQcTSyJbrCatPABBOtfTnGeNrxU8DxBdx
	fq9V7ROu2uA48exvqYmpEEf6O2dg0XokimFkoNq/Q0NkmD7SkntHBbTgpcqXcQk5KVVmU5R8dDz
	XIoKS/Ud4S4q7ldUzOQ0ts3ePRIJ2MpKQlYXDg1bhpybw/il2alcvPM7vhPOs6g==
X-Gm-Gg: ASbGncvgbMisZAXOMc7DYme8oV6Wz7zS9MHko62AQXsr/nZBKQwhiMoR2Sqnp3reGjx
	pfp5Lnl3k/1G/kEjtn+TGTG1r8B6IGle1DPyjzczJ7aUcY08O8zCzdGzwYuvK794W9ERo2+R7r2
	EvbIzKUzU2cJwLeojJfyWcN/ps0S+uBt7ZSYv3QB95u1GcohJdZvVS/l5g6ifMfxpbgK3mla8uq
	wV3ZoYYKR/0SPQwMPCOkeF4wRd8iRvP/cXd07cQHSwgM5SLQc9FWPeI9lwEpArc6RMrpYL2xOR2
	QMJi8QEv/2DZmrpVy61y6as+2efvg3JPkIfcU+N5MzanN+AODNjB9F7j5XZ2/waJsEd5FA==
X-Received: by 2002:a05:600c:4f45:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-43f3a959a54mr27221125e9.15.1744377071551;
        Fri, 11 Apr 2025 06:11:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC+z92vhh7g2ybLS4kL/brhBh5vT1DbMh4lJA6Q6ypcMXRNf2AULVsSlzOqoIHKKXQrjXtDQ==
X-Received: by 2002:a05:600c:4f45:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-43f3a959a54mr27220665e9.15.1744377071067;
        Fri, 11 Apr 2025 06:11:11 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572d43sm81516565e9.31.2025.04.11.06.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:11:10 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Nathan
 Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] drm/efidrm: ensure screen_base is initialized
In-Reply-To: <20250411125554.1453825-1-arnd@kernel.org>
References: <20250411125554.1453825-1-arnd@kernel.org>
Date: Fri, 11 Apr 2025 15:11:08 +0200
Message-ID: <8734ee3ksz.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Arnd Bergmann <arnd@kernel.org> writes:

Hello Arnd,

> From: Arnd Bergmann <arnd@arndb.de>
>
> clang points out that there is a code path that leads to undefined behavior:
>
> drivers/gpu/drm/sysfb/efidrm.c:353:11: error: variable 'screen_base' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>   353 |         else if (mem_flags & EFI_MEMORY_WB)
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
>
> Add the missing initialization.
>
> Fixes: 32ae90c66fb6 ("drm/sysfb: Add efidrm for EFI displays")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

A similar patch has been proposed by Nathan already and acked by Thomas:

https://lists.freedesktop.org/archives/dri-devel/2025-April/500539.html

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

