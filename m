Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384E621D5AA
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 14:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746799244; cv=none; b=fq4Ruijuf+ChxSuLydcVW4Q2cnXcgahzA+vXxPpfDuc7XuUmwXd6BwIw89l6d+V1dw9oZQ6kAFFGlO+mXj5B52d+5S537jtmPUfmcA57ZFrjzutFE4J0FMh8GiBx6aYSd0gSAyp1Bf/tVND2CQmk/B3rV9sJ0XMBKuoai73KyUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746799244; c=relaxed/simple;
	bh=/nEfxeCBEnRy4J1NhW4ZqzTcGc1y/vXaM52vTSkRK7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eCmzF3epaxpBxPZejHNvdWKqq3MxA3oGH2JHJcY9VZwAzIUe0/BsQuP3woXChjo3eXPGH2+SbGNMTzJISaKk0BZgzlEKnm0Wvhmsb6zRR/LeqimhjPl+JFOdX1xPBb04ViI5t3aUNxh0H2X+IrG7W8ptEn+T4E6v7j44QfFO4CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=kJmjPEwL; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="kJmjPEwL"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-52c5a3bb8ccso231981e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 07:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1746799241; x=1747404041; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MLzQadwrXSWBi28Qvo99BU7DHYabFA9gVXIbPnyaBXo=;
        b=kJmjPEwLulPbgtscVmcmyCYbode1jRuculUcYeCNZQ1sst3pUxy+0o08To9fDOqf30
         6iWFCDh7Za4OH4WT3DRBN4s9S72USyRcR/JbLGhr745og9ZaTy3hFof/TLMU19PAkh2h
         Jr4H3CB2HZZ8ZPSg3mluIDY6Ti/uMWLzECu9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746799241; x=1747404041;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MLzQadwrXSWBi28Qvo99BU7DHYabFA9gVXIbPnyaBXo=;
        b=EbAZtk6tFnG0Wl5cRviJzXyXIf96O7hbvAYFqTJ+SZocUgDcxPfd3vyRJKuSKTspcn
         X2p07TiTMTgvQKpd7FezVJ5ENn5MvBMsWd3BKJ99iSZqMvE2mc0qvOUYrLzBJpQaNe8+
         k/Gqo/wlrO50a1+LBCdh+PE+WdinlibKDOTyVW7xecvV7hZbDnqTszDE9GIKSxsZbx//
         J3GUx29oujAc8Puh3bDsVxCymIymqIeACJncmVr9QKOPVb6+SHRX5Rz5J9xQhi1IXJXG
         M0d2cFCu9ofYd+/71Lrn6zmIz48C09cqCRODrvDljXH9rOPJMk1uOD/fcs9KlkzYTXrm
         nsAA==
X-Forwarded-Encrypted: i=1; AJvYcCXJN3mY/9QicSmv2Iv1j3H03qDfbcQzomk5j59ukv98AQNtfWeTWAlBBWedlzUjzD6WC/mcuEcSH1r/YiI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1f1m/pTmwZVozPZnO6WensX95DJ7dUxUHj9uh6tgEK73WMsYS
	42NlvyNZ7BScBIpNmrwMiS1b21aTdrhDpSHFw5MUWUhkST7z6kjwb7l6weFPJeCXA8QiAykGYlv
	CnmOw7rTXbDKnhvgn3bkI+mrScsYxkNrnbQ/kFQ==
X-Gm-Gg: ASbGnct5QR9eAqCGYmQeTgRzIfzHk0uBDHSw1Zmg/yeTOtVVJb6xdKPHHi1D/kdb1Am
	TpGsDrJzso64FqLH3XiXQ7wCe5tTi9ziFp/uE5y8T5XvFq9PlcX6qN73vmifgjoafhUzNlarwp3
	PaNYE8E1V/9gH9eHfwV1nuwKHH
X-Google-Smtp-Source: AGHT+IGyXCmdqeHIcOPC3gHNLGaFw/4ws3BpBLfMJMQe3MgaB4FgAiGLVSqxSN1BdX83jJnLj8SFCFTwHy+JNqvfxq0=
X-Received: by 2002:a05:6122:828d:b0:52a:d093:75ee with SMTP id
 71dfb90a1353d-52c53be5491mr2951764e0c.5.1746799239114; Fri, 09 May 2025
 07:00:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-fusectl-backing-files-v3-0-393761f9b683@uniontech.com> <20250509-fusectl-backing-files-v3-2-393761f9b683@uniontech.com>
In-Reply-To: <20250509-fusectl-backing-files-v3-2-393761f9b683@uniontech.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 9 May 2025 16:00:27 +0200
X-Gm-Features: ATxdqUHItDoVCeDRwi4i4w5h2rc4ClAFNW1aPU31NxRA4fxq0P_KhXao0V8Zs7w
Message-ID: <CAJfpegvhZ8Pts5EJDU0efcdHRZk39mcHxmVCNGvKXTZBG63k6g@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] fs: fuse: add backing_files control file
To: chenlinxuan@uniontech.com
Cc: Amir Goldstein <amir73il@gmail.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 May 2025 at 08:34, Chen Linxuan via B4 Relay
<devnull+chenlinxuan.uniontech.com@kernel.org> wrote:
>
> From: Chen Linxuan <chenlinxuan@uniontech.com>
>
> Add a new FUSE control file "/sys/fs/fuse/connections/*/backing_files"
> that exposes the paths of all backing files currently being used in
> FUSE mount points. This is particularly valuable for tracking and
> debugging files used in FUSE passthrough mode.

This is good work, thanks.

My concern is that this is a very fuse specific interface, even though
the problem is more generic: list hidden open files belonging to a
kernel object, but not installed in any fd:

 - SCM_RIGHTS
 - io_uring
 - fuse

So we could have a new syscall or set of syscalls for this purpose.
But that again goes against my "this is not generic enough" pet peeve.

So we had this idea of reusing getxattr and listxattr (or implementing
a new set of syscalls with the same signature) to allow retrieving a
hierarchical set of attributes belonging to a kernel object.  This one
would also fit that pattern, so...

Thoughts?

Thanks,
Miklos
