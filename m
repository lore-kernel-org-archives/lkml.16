Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B101C5F06
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 05:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751434685; cv=none; b=BFYehn5LTiRtLjXYHT4oUZL5cEmJQuDp306rPHGJErK+vO+6m2vfEXmPFB6hnjFIsih+kl0rZsNvV9QQetl/u6BrTkacFrq4NSxCadNm9LK5BhdWxR+JWTj/v4JjeQOzrFGS2P1dMSTknxbO5K2cKTk3CbIvyTj5N++VIR5lWYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751434685; c=relaxed/simple;
	bh=b4jYhBLaJVWS8uCLTTvFGVkJv0bteHOKXi+J5IzUiHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LhegQFm0CVLvk95R5MebHX8h42FIyE1BWI8LJDISZ2L/9BQIcGoWHpnjEx6B7yCLCWwew2aXkDJT2mADkLkHMDnLvaOLwzU/QKFbbB3SjRT4D/o2sxpQtbwhBJ+qFHdVFR6YCWwqlIAMRvKewFjsgUKSvJ0VKJGsR6zUKEvx/Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=OIN8OM2L; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="OIN8OM2L"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a58f79d6e9so84451211cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 22:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1751434682; x=1752039482; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XBw4HF7qWDcXJbgwvgqT6jgJQFstUmKnuwkt3nojl78=;
        b=OIN8OM2LvfCfeppp1blKo4zz/zy9cmevcQIaJ35ew16/rePFm5GyPHBvq52DM6O0dQ
         QhMlYrCDozus4YFg6mFJX3h3A2WjGwP2KrqHOzo4TTtll9dn39FfYC5kQ3fuaN/TBSyf
         RxZllTUwZ/orTxmsAsmzxZx+J4CuUxLoTYB2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751434682; x=1752039482;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBw4HF7qWDcXJbgwvgqT6jgJQFstUmKnuwkt3nojl78=;
        b=ZxWVMD4487mbvE8ny0OOkjYHIrVc9qGP+OQtD4wpHZxySLxHa6NDa7bNOubT5V2/CR
         PBFRS2y2fafxoaSehnqrjWDQZ7DSWWacrZO7OsdWFbezoGkWXXcmqw3DX3lc1I5c1uUI
         tjrvDTe5A5UKFGmeM/rG9GdtEqztvfFySJzuUcPIBdhic8sZ7it3nVLSoppZAxWWbi8u
         Ns5DYeK/ZXrPcBRM85BjkaORZBto1oOBtEHpgU43Q02ubZNgMKYW2lMFBHk7ZqioOBas
         jbfECcdUBB8CLZ/pJIhQyg0aWOldZMUOVLIxz0m2T4NBiaSBJdZUodWOhYfyFT1YIGro
         B60Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3fu5SOMUJmvHNpKqzobH4LD3nNRYinxPaDjEDYeJFXPCP13CktuwfJXkIVgYZASCKuO/Yz2p+1EVmpIU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVgyQd5n2LkRxdb5NQmSbddVZJU3o0PBYCsjPlnZLgjvXqsCUx
	WsO+KBwMbsgrMUwWRsaFLhrZMviPk0SVC6mdhKe/hLqbZKospALjIVl1QhzcvpEj/dYqMgTedkB
	Cbyrfk6LrdM5/hC2tSjKIhIEo5jXdfSC6gt0d8NuiSQ==
X-Gm-Gg: ASbGncsm6afLx8Ry9+qGdYINDayG2mvWZo6s8mbe3jKkKsria63dJuc+vU+RPcxd7QF
	rShtfBgFXUSwSR7otB8Pf5x42Jla90teyIFJ2uZmOcT8Oi/OFb8/ogD0CN60TKGQrS91KXF3Uex
	NvC3eCGxjYNhgRlCCpgeyQMT385dV9ZmzMCe3aaA2OX8o0uHcAylYOnSUpqpmCocZT4mbix3+aO
	zkeHMq5/JFf7DQ=
X-Google-Smtp-Source: AGHT+IF8xAcXBcrSYEe9Ba8cdGjOrU848zSeBK/Ng3+OTDZ69YucBQEbh5zW/k8ND8IcNbh6AVxqSBsNCfOLuuhGP7Q=
X-Received: by 2002:a05:622a:1827:b0:4a7:face:ce10 with SMTP id
 d75a77b69052e-4a976a13b4amr29650981cf.31.1751434681962; Tue, 01 Jul 2025
 22:38:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610045321.4030262-1-senozhatsky@chromium.org> <20250610045321.4030262-2-senozhatsky@chromium.org>
In-Reply-To: <20250610045321.4030262-2-senozhatsky@chromium.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 2 Jul 2025 07:37:51 +0200
X-Gm-Features: Ac12FXzLD6BJxilx6zyt-xoL-NaGTq-9HFVDoqCZzsuZQN3zCETTYbd9SUoGWps
Message-ID: <CAJfpegvVojwCaoTkdGcP_LJT8q-m6_VMyxciKoFFXFVvuDW-SA@mail.gmail.com>
Subject: Re: [PATCHv2 2/2] fuse: use freezable wait in fuse_get_req()
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Tomasz Figa <tfiga@chromium.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Jun 2025 at 06:53, Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> Use freezable wait in fuse_get_req() so that it won't block
> the system from entering suspend:
>
>  Freezing user space processes failed after 20.009 seconds
>  Call trace:
>   __switch_to+0xcc/0x168
>   schedule+0x57c/0x1138
>   fuse_get_req+0xd0/0x2b0
>   fuse_simple_request+0x120/0x620
>   fuse_getxattr+0xe4/0x158
>   fuse_xattr_get+0x2c/0x48
>   __vfs_getxattr+0x160/0x1d8
>   get_vfs_caps_from_disk+0x74/0x1a8
>   __audit_inode+0x244/0x4d8
>   user_path_at_empty+0x2e0/0x390
>   __arm64_sys_faccessat+0xdc/0x260
>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Applied, thanks.

Miklos
