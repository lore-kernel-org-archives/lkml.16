Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175FE2AEE1
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747038452; cv=none; b=Y0zj+JcOf8uufXy6sN4lqFpqC/nb9fqZ1+HiQiCy03Co2YyPSLV/S5YIE9e6vORkvsE4qxSINCG7ZRZtB0kG9iI0mlmTmsbwQLKsRX8UJxK0SVhedeJSh7hz/KYiT+WMssZ/tuvb4GPlm+OMRBdLdx73YiMu8DNyzO2Piuv6vt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747038452; c=relaxed/simple;
	bh=KpI2Ldw9Q5XCynekX7E8uDM8g2s+AhFWPW0rqHWZVJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qIu9LT9vKc8ue8d0woXO7YgN45F17euVu7B8Z9QNzaNJ7LwUsby8OklUCRHf98YrVTAJwgAZ5/NJIvfPlSSMonN9150tXTYPqbgxhvIbRTJtwJBPNhR8RSsyPmtzGH73F42CWaH4Rwkpbou8gM8wmH00bZHy93+DUNkSu1XX/Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=Oe5ACETo; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="Oe5ACETo"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4775ce8a4b0so77480911cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 01:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1747038450; x=1747643250; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WZSshcLUS/dyVyuovWTzmyTQWV68KoRHYV2oCPryNnw=;
        b=Oe5ACETodc5JhgxEMq2DUl8Bzgse8j9F1smCzTYEgEraAUVU+2sV615yAXjqdm3oac
         OwyJ8n0UhloUMPILO+o9Pfvtgk1wi0/ihTxlR/eZKx65D/oq8KzCsdktvfazGQqSXy1P
         91Fkxa3uqeN586rTPEmA6MmBl16uE/1fw3OrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747038450; x=1747643250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZSshcLUS/dyVyuovWTzmyTQWV68KoRHYV2oCPryNnw=;
        b=QYStE9PRb4QzMwsb2tS8IcReKmNGLu+IMubSLRbg42C9LhqqTT7AY2qfaUtz/6LmKP
         1RlJc3XjyIcpSDaiU/J4ye420pzNBgWnqXq1DqJjdNTtMuy1L7ElcjesNmvg27cxYcZb
         Zj+19vxi3PYaAHuRTNaVMYQlfeUosCmf1mXo0z6hnW6r2OU2mrHMp1z4wBWZ03324wKL
         XFBspJYjGX7i53kHv3iuK1Tlbq2s+r5F25BAOmrY5gqKV6iihlDaoZ5hvrUyhiRr6cxz
         nth3zmONYtuPdIkPPn7N5CqMDpKQmMYqHI944hcG2ewgKgvXanbn8uuFBjAhRrMED6YI
         7Naw==
X-Forwarded-Encrypted: i=1; AJvYcCVPVR0AGU1Z2dVg/OtCGG8B0iN3V7Wsb/+iC+sgudtlvVw/QWcy5MjPApLugdlYpY1BSs27k57QGnkpcpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMKBwvCk5Q9NPWfoSbzB4+HwseKTIvgPs0ewZvwToXOGthCQQ6
	iPduOoF8CgjTcKJ+567SOL20ckWTrLrGg4LD+dYGQBCNS/I7alA+4iy403SAFfncjqse/P1nM0S
	7FjpowYDMdZAWeZBlNx9aVUYfDTdr2A290ShiAA==
X-Gm-Gg: ASbGnctMSX8tPusZ2rvg6bt5edTyuFlR1/uLo2fwAgN8AhGaKyo4LpZDRWf84TdaS6a
	BA+KLlB1XZzKiJI9Afz3ItpZlGgBpUlFxa47Sq4qU60Ce6NUmKy/iq6pLCio3FSM/AmzTHqcBbF
	sKwJEUCbhstfJIjmYZGHK8aRTdbc2fJ9PFywo=
X-Google-Smtp-Source: AGHT+IGtNC1aUdyyeI43+8U+artHWY9OR/1bTof+TWdQENJAoLSWoxq+eX3iik65c/E4tn4ZjidjqLC0YPMRryXIc58=
X-Received: by 2002:ac8:578c:0:b0:480:9ba4:3022 with SMTP id
 d75a77b69052e-4945273580cmr175507551cf.17.1747038449952; Mon, 12 May 2025
 01:27:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-fusectl-backing-files-v3-0-393761f9b683@uniontech.com>
 <20250509-fusectl-backing-files-v3-2-393761f9b683@uniontech.com>
 <CAJfpegvhZ8Pts5EJDU0efcdHRZk39mcHxmVCNGvKXTZBG63k6g@mail.gmail.com>
 <CAC1kPDPeQbvnZnsqeYc5igT3cX=CjLGFCda1VJE2DYPaTULMFg@mail.gmail.com>
 <CAJfpegsTfUQ53hmnm7192-4ywLmXDLLwjV01tjCK7PVEqtE=yw@mail.gmail.com> <CAC1kPDPWag5oaZH62YbF8c=g7dK2_AbFfYMK7EzgcegDHL829Q@mail.gmail.com>
In-Reply-To: <CAC1kPDPWag5oaZH62YbF8c=g7dK2_AbFfYMK7EzgcegDHL829Q@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 12 May 2025 10:27:19 +0200
X-Gm-Features: AX0GCFu5sfhVzUqTe5y8_c4SjL32Qv9LBh40xP-R3ct5pAFtrxq8WNsBOYRC3vs
Message-ID: <CAJfpegu59imrvXSbkPYOSkn0k_FrE6nAK1JYWO2Gg==Ozk9KSg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] fs: fuse: add backing_files control file
To: Chen Linxuan <chenlinxuan@uniontech.com>
Cc: Amir Goldstein <amir73il@gmail.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 11 May 2025 at 11:56, Chen Linxuan <chenlinxuan@uniontech.com> wrote:

> I noticed that the current extended attribute names already use the
> namespace.value format.
> Perhaps we could reuse this naming scheme and extend it to support
> features like nested namespaces.

Right.  Here's a link to an old and long thread about this:

   https://lore.kernel.org/all/YnEeuw6fd1A8usjj@miu.piliscsaba.redhat.com/#r

>
> For instance, in a situation like this:
>
> A fixed file 0 in an io_uring is a FUSE fd.
> This FUSE fd belongs to FUSE connection 64.
> This FUSE fd has a backing file.
> This backing file is actually provided by mnt_id=36.
>
> Running getfattr -m '-' /proc/path/to/the/io_uring/fd could return
> something like:
>
> io_uring.fixed_files.0.fuse.conn="64"
> io_uring.fixed_files.0.fuse.backing_file.mnt_id="36"
> io_uring.fixed_files.0.fuse.backing_file.path="/path/to/real/file"

Yeah, except listxattr wouldn't be able to properly work in such
cases: it lacks support for hierarchy.

The proposed solution was something like making getxattr on the
"directory" return a listing of child object names.

I.e. getxattr("/proc/123/fd/12", "io_uring.fixed_files.") would return
the list of instantiated fixed file slots, etc...

Thanks,
Miklos
