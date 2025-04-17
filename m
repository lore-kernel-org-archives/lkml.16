Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC34254B12
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744908208; cv=none; b=j3++MOWp5D+YAP8r20iJdvT7Wu3HxaBK5K2R7He1lBARzLaoCQ5HJlycMqh/uM7Dj8xt8gtGaeKeqAGYFlXt6QYsOzbSjDv4t6zCrvc2lD2WjG9eEC1eEAOKmPh/YUtapXglVbBS438ONMKzzogwL797h7bAcOmN7FJzvrlv33w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744908208; c=relaxed/simple;
	bh=cE0SsJXubMVoO/NUjivTf4Jtt0m+Kx9DZncRgLItiJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbFN7fEuy3XQvv6Bgn7FhiE1QTPYuM/XMFXzcDtZ7zPblQlWAzaHQcpNQ/XJSNopAleDtNEJie4vlcaxvuM6NtWCRa7z2uU7jLbo7HJn4oCj4XzcWvpKmn3aUrPEs/DHiRSPO8i5IMHOXxqSvYl7vIPaDG8b98E4xb6lonqDuyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=hFP13GVt; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="hFP13GVt"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-73972a54919so932288b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1744908206; x=1745513006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HJs3R27mGXFnUc6xsOALgXGRVDRyXs8OoUcWIG3enHk=;
        b=hFP13GVtwYn8MV8aG2khVJWT1njBW5N2uFkrWfNIV4v+CTVErrPkFiBGt6Mnnp+j1j
         f1bIW6/SyZhCQWNRNuV2paZCvpH4lwtXa2Ww3iSVipiSnrMfqmer2evE1yHz+261x9Vh
         bsQfyf5nTXFJ+whm6X1eTfJPdePEcOeHYdZsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744908206; x=1745513006;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HJs3R27mGXFnUc6xsOALgXGRVDRyXs8OoUcWIG3enHk=;
        b=k/YoSdcD+MEMu7TFoWEg3xOd3/qGq/vv3ErZLNmyuN0oBGh6QN7v6V+dQD6S9lFmt2
         PFTJEYvj4+Y92SlzSeXisU2OSOOdgtFEGagxP5pWc5UJ1IdPG6aG0pvPrOK5KCtVgg+U
         Xwd1WCclYov6iMUDxGfn1JzQ3xOrQqhcibuk0aQOqZt25m06S10kuCQQ6a+eQXU8Twxp
         BoqpqUBUjRUDyygt+mN+woO0LM79rU44Nm1XfR7sVYfdm4JiIgBK/JOSYezjBTHGEPyK
         M55LByH5+g7mF1z2FMrLjgHI4xxPQCUb6vvtzpuaFlMgThzK1W9CKQ19UscMzK5d+ufH
         abxA==
X-Forwarded-Encrypted: i=1; AJvYcCXLnUs2MLvkShDdb2Z68crkOYMyjx0XEtiVgoFMOuLabwhTJIOVxqRTPMvNSLI6tWgtivMBJ4N3or1jljg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyVtFy4fDCZpJnbO78rXryDPdJj8uhtcz/SKeENJeKc8wZ4APG
	ZHqJ25XsxJw9Xqfr5MKAw6ih3Js3eSZ2TaHGFrp/S7YLTNs2PI982Km1ZoWD8Oc=
X-Gm-Gg: ASbGncvpuJFmHuBvKOzLX0NzgoEA2v/l/ZgYR8lixbHW8iqGXdEEDKdn7AX1a5hVllZ
	E/RyT5JetzSH+IUvtrFiCuG3yPT1iMGZjtwhXki/+MV5aQwe3WICZMVa1SWAk3FGjpK4N2T3pJo
	1Uih7FUFc3xdBm71yC+2NNfbkQj0ht1bzgJOjCWwqzyfL+ad5rQEWs/piI9HH4LsHRCxgOxCgSO
	vJCcjOppEQgQvVfedOuryiQUgDBqAzJpicJ1+7U2Sg2dHPy5LRNkq6atmhYvlZWYIQ6iLMbExEd
	K9nxPqhri9OFbXPXZpMdSiX7NdBC3Nhkuu5KYHhH+NIfGgOHU/7ytKfH8pSX1o0rdWhLHc3Jxfe
	cG8IanZFd6Cti
X-Google-Smtp-Source: AGHT+IG+XpQJVC4yi6kR32NZ5IA6ihEOayDuhg24CWyM1y1U1cd5X2UW8o/p/Y+LyClf8OSD/ROclA==
X-Received: by 2002:aa7:88d2:0:b0:735:d89c:4b9f with SMTP id d2e1a72fcca58-73c264c4cb4mr8349614b3a.0.1744908206170;
        Thu, 17 Apr 2025 09:43:26 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8bf802sm63829b3a.13.2025.04.17.09.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:43:25 -0700 (PDT)
Date: Thu, 17 Apr 2025 09:43:23 -0700
From: Joe Damato <jdamato@fastly.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	"open list:XDP (eXpress Data Path):Keyword:(?:b|_)xdp(?:b|_)" <bpf@vger.kernel.org>
Subject: Re: [PATCH net-next v2 4/4] selftests: drv-net: Test that NAPI ID is
 non-zero
Message-ID: <aAEvq_oLLzboJeIB@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	"open list:XDP (eXpress Data Path):Keyword:(?:b|_)xdp(?:b|_)" <bpf@vger.kernel.org>
References: <20250417013301.39228-1-jdamato@fastly.com>
 <20250417013301.39228-5-jdamato@fastly.com>
 <20250417064615.10aba96b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417064615.10aba96b@kernel.org>

On Thu, Apr 17, 2025 at 06:46:15AM -0700, Jakub Kicinski wrote:
> On Thu, 17 Apr 2025 01:32:42 +0000 Joe Damato wrote:
> > Test that the SO_INCOMING_NAPI_ID of a network file descriptor is
> > non-zero. This ensures that either the core networking stack or, in some
> > cases like netdevsim, the driver correctly sets the NAPI ID.
> > 
> > Signed-off-by: Joe Damato <jdamato@fastly.com>
> > ---
> >  .../testing/selftests/drivers/net/.gitignore  |  1 +
> >  tools/testing/selftests/drivers/net/Makefile  |  6 +-
> >  .../testing/selftests/drivers/net/napi_id.py  | 24 ++++++
> >  .../selftests/drivers/net/napi_id_helper.c    | 83 +++++++++++++++++++
> >  4 files changed, 113 insertions(+), 1 deletion(-)
> >  create mode 100755 tools/testing/selftests/drivers/net/napi_id.py
> >  create mode 100644 tools/testing/selftests/drivers/net/napi_id_helper.c
> > 
> > diff --git a/tools/testing/selftests/drivers/net/.gitignore b/tools/testing/selftests/drivers/net/.gitignore
> > index ec746f374e85..71bd7d651233 100644
> > --- a/tools/testing/selftests/drivers/net/.gitignore
> > +++ b/tools/testing/selftests/drivers/net/.gitignore
> > @@ -1,2 +1,3 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  xdp_helper
> > +napi_id_helper
> 
> sort alphabetically, pls

Thanks, fixed.

> > diff --git a/tools/testing/selftests/drivers/net/napi_id.py b/tools/testing/selftests/drivers/net/napi_id.py
> > new file mode 100755
> > index 000000000000..aee6f90be49b
> > --- /dev/null
> > +++ b/tools/testing/selftests/drivers/net/napi_id.py
> > @@ -0,0 +1,24 @@
> > +#!/usr/bin/env python3
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +from lib.py import ksft_run, ksft_exit
> > +from lib.py import ksft_eq, NetDrvEpEnv
> > +from lib.py import bkg, cmd, rand_port, NetNSEnter
> > +
> > +def test_napi_id(cfg) -> None:
> > +    port = rand_port()
> > +    listen_cmd = f'{cfg.test_dir / "napi_id_helper"} {cfg.addr_v['4']} {port}'
> 
> you need to deploy, in case test is running with a real remote machine
> and the binary has to be copied over:
> 
> 	bin_remote = cfg.remote.deploy(cfg.test_dir / "napi_id_helper")
> 	listen_cmd = f'{bin_remote} {cfg.addr_v['4']} {port}' 

Thanks, fixed.

> > +    with bkg(listen_cmd, ksft_wait=3) as server:
> > +        with NetNSEnter('net', '/proc/self/ns/'):
> > +          cmd(f"echo a | socat - TCP:{cfg.addr_v['4']}:{port}", host=cfg.remote, shell=True)
> 
> Like Xiao Liang said, just host=cfg.remote should work.

You are both correct; sorry about the noise. I thought I tried this
last night and it was failing, but clearly I was wrong/something
else was broken.

I've fixed this locally and dropped patch 3 which is now
unnecessary.

I think the main outstanding thing is Paolo's feedback which maybe
(?) is due to a Python version difference? If you have any guidance
on how to proceed on that, I'd appreciate it [1].

My guess is that I could rewrite that line to concat the strings
instead of interpolate and it would work both on Paolo's system and
mine. Would that be the right way to go?

[1]: https://lore.kernel.org/netdev/aAEtSppgCFNd8vr4@LQ3V64L9R2/
