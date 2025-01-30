Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489D91EE036
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 16:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738254565; cv=none; b=oNKwoK/TIPwL2DpGmca+n8Y9aQH+mIYk3LcbVIAgYgnHUFqL6MAAeRq+T6p/AsOaKeZirTQxPrVay6aN5PpoVewbNyOCMEk4lRYy/hghjZ6LBKP9hT/+WsH/RQTd0xOtDHHP8Ppf/KTd/09oRE8RowGXNTEKb6TeWW+nrOBJvhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738254565; c=relaxed/simple;
	bh=t83gBk3R1gJYHaKAAfvjNUShPqKhN3qh0uSgLbPTP6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D8IwY+5XHb+1m3lINOKhRtjNCGuHIM6DDhbF/oWLoCrZvUTqrFz5jaKcuQjHDcbltzzXk3vgs16ahEeEMskPi4e2cGs5AJbPRnMheXb7kRD0I4qQhODeXj+heQx4skxhny7imFvsvcw35n8d9V3a3S8zymPL9WqVL+DR+3eiJrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=tY7tASqR; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="tY7tASqR"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-467918c35easo14297631cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 08:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1738254561; x=1738859361; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PaELnFzz9aRPiHl2MvgwZe5wGfHA1Rh3SyrWRVQiS98=;
        b=tY7tASqRwmsVr0Dhlx1A8MFyV/JSYFFol9/Bes0rqSbY9GWcaUPkgNkGRpWEcPlo5B
         878X5HvRTANi1bsYLe16QeRnx8iNkiTevyzI9fEjA8b5QeGYtIdM1GbI5wr4+hi/Keyj
         2iZu1umLxJx+cXQ55F/Bmm2r7ALCuowRI7rjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738254561; x=1738859361;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PaELnFzz9aRPiHl2MvgwZe5wGfHA1Rh3SyrWRVQiS98=;
        b=AEU/bi4aWu+LL5mQNScWB0yQY+EpGXCVOEtjaqRPDAi0KJisreD733ueC+mTd9s9qZ
         8so1+NZvRuk9rWv7ppA5iZNQcLrdRLvsZl95f1JCVn9FPZuWLwtTUVa0OrPJvMO+tUr+
         Aou9w8C/dTSOX6bWZ2fwT8wRiqlZ/NdDbSuvJ7nzN8DAKDjKVSkwHQyTXjkZ+DGk8KpK
         xpFhcmQwFKyr8In+8jodNOkB+MU3HkzfOpBvbeSMaqv5b7un59p0FpFdxsWTqfA6wWwK
         xx6vBG1XzCQKVsGeH+nbG8H1ZWVZ4Y5Rbkd5dbU6CjmsIiD1mTGmXezIyq5E0k1lWQyZ
         vLEg==
X-Forwarded-Encrypted: i=1; AJvYcCXUq37hR/gF+dAqgqTRBF073uusUZJblWxNaM3hXEguuQNoqk4Uzx45wpMofeDzjb45rNjT+v9JIFB9eBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ7bQlOKuPBEjUrKCfW32FMT9rXbHd23V3h40rwu3oun5ekZyF
	t25r7mmXED9hMF8OnU4PQgp85WVTSY1zvl0ezQttMfwO4NiPgeFgk6MI8NXnnrz0K2cF1QmfUpx
	U
X-Gm-Gg: ASbGncthai9kq4uN51JlxARlu8HIrMPCvaWs/X2gmHWUJ+gdo8u5TdqY9HyUBo49mne
	9oVhDhyoXsi0+KRZyHfQ1b5k1B9soJlyUj/Stvg//9Iz+y7cVu8I2F7obN0Pi3xz50gtNcjDrs3
	lBoTMa81he+3GqUjK7dIzm2l2NOWO2CyL/e8pM6xSMsTxf2irUiXmOG72HirboT5Fco5lcTEsOD
	KTto1D4LeJ9rUJYmf6FDeNJJnIbH0PgX7U5sSsPOfr4+971eXzgHhfZtWNmnwAaXjGpzS3ry3OK
	WIYmftO6Btx1k1o6L4n7
X-Google-Smtp-Source: AGHT+IFMhjJxwdWrG2OptdCx16imUHT/yVI/4gwEFDkVKpzed2hScRedqGpI22WePJd4xDb4S84Whg==
X-Received: by 2002:a05:622a:114d:b0:46c:791f:bf3e with SMTP id d75a77b69052e-46fd0ba20c4mr121048431cf.48.1738254561168;
        Thu, 30 Jan 2025 08:29:21 -0800 (PST)
Received: from LQ3V64L9R2 ([208.64.28.18])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e0d5fsm8544561cf.44.2025.01.30.08.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 08:29:20 -0800 (PST)
Date: Thu, 30 Jan 2025 11:29:18 -0500
From: Joe Damato <jdamato@fastly.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, sridhar.samudrala@intel.com,
	Shuah Khan <shuah@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	"open list:XDP (eXpress Data Path):Keyword:(?:b|_)xdp(?:b|_)" <bpf@vger.kernel.org>
Subject: Re: [RFC net-next 2/2] selftests: drv-net: Test queue xsk attribute
Message-ID: <Z5uo3ugZB13k1aKW@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	sridhar.samudrala@intel.com, Shuah Khan <shuah@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	"open list:XDP (eXpress Data Path):Keyword:(?:b|_)xdp(?:b|_)" <bpf@vger.kernel.org>
References: <20250129172431.65773-1-jdamato@fastly.com>
 <20250129172431.65773-3-jdamato@fastly.com>
 <20250129180751.6d30c8c4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129180751.6d30c8c4@kernel.org>

On Wed, Jan 29, 2025 at 06:07:51PM -0800, Jakub Kicinski wrote:
> On Wed, 29 Jan 2025 17:24:25 +0000 Joe Damato wrote:
> > Test that queues which are used for AF_XDP have the xsk attribute set.
> 
> > diff --git a/tools/testing/selftests/drivers/.gitignore b/tools/testing/selftests/drivers/.gitignore
> > index 09e23b5afa96..3c109144f7ff 100644
> > --- a/tools/testing/selftests/drivers/.gitignore
> > +++ b/tools/testing/selftests/drivers/.gitignore
> > @@ -1,3 +1,4 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  /dma-buf/udmabuf
> >  /s390x/uvdevice/test_uvdevice
> > +/net/xdp_helper
> 
> Let's create our own gitignore, under drivers/net
> we'll get conflicts with random trees if we add to the shared one

OK, SGTM.

> >  def sys_get_queues(ifname, qtype='rx') -> int:
> >      folders = glob.glob(f'/sys/class/net/{ifname}/queues/{qtype}-*')
> > @@ -21,6 +24,31 @@ def nl_get_queues(cfg, nl, qtype='rx'):
> >          return len([q for q in queues if q['type'] == qtype])
> >      return None
> >  
> > +def check_xdp(cfg, nl, xdp_queue_id=0) -> None:
> > +    test_dir = os.path.dirname(os.path.realpath(__file__))
> > +    xdp = subprocess.Popen([f"{test_dir}/xdp_helper", f"{cfg.ifindex}", f"{xdp_queue_id}"],
> > +                           stdin=subprocess.PIPE, stdout=subprocess.PIPE, bufsize=1,
> > +                           text=True)
> 
> add:
> 	defer(xdp.kill)
> 
> here, to make sure test cleanup will always try to kill the process,
> then you can remove the xdp.kill() at the end

OK, will do.

> > +    stdout, stderr = xdp.communicate(timeout=10)
> > +    rx = tx = False
> > +
> > +    queues = nl.queue_get({'ifindex': cfg.ifindex}, dump=True)
> > +    if queues:
> 
> if not queues:
> 	raise KsftSkipEx("Netlink reports no queues")
> 
> That said only reason I can think of for no queues to be reported would
> be that the device is down, which is very weird and we could as well
> crash. So maybe the check for queues is not necessary ?

I kind of feel like raising is slightly more verbose, which I tend
to slightly prefer over just a crash that might leave a future
person confused.

I'll go with the raise as you suggested instead.
