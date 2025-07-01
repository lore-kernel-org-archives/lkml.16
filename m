Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5309B27055E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 21:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751405865; cv=none; b=g82uttAbuiyLFcqJf6cTJIocJudAIoUoTGU9LdMHDpDznR4/n9gEUmpEV1wS22deHblv5+Y+PIHLHNJoU4NdJbIBawQhztRzazsk2ZFATil452ihpHgVAyGJciQgHo1OIHUzm2HxQem7/JgK8QnI92hrHyo4ueqCQSevdLZANS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751405865; c=relaxed/simple;
	bh=mC/l6q4CWSnnwGzOfbly5ZqDi3wwhuV0jt4g7O1wZcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L30KZWNGWSoc35K1c4J/R7kSVMyKGOCByfzLGvbustpfpzh639o2kdMiz1vcupAkqCATemXj0sMLnG7Kdx7DHGXnqpVxdfdh0paiosGWvEAhr2D3LxIfSANPR3L5H3ChOvLtGqUZ7J77rijaHnqp1G0M/H6VFA7DWfHjGk9YFCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8R6DFMX; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8R6DFMX"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-74264d1832eso4668621b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 14:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751405864; x=1752010664; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OdmRU/xL8sd153MKFf5ld1ppQiJmRDfnpnmDu5gQhkw=;
        b=U8R6DFMXl8c1X835wRuzitbJomobZE265Ux3mUN41Rzo1ERT15u+pAueoToT2oCUmF
         dWT8/djmrdFbRIGcoBCkkL77AgK6NZHgAt0MUvkMolZ1+aaz0DGLjGhrZZqjxibEsBRd
         /n775fH0pRlOCw7estZPmQ7Zycl3a7S+FVyw+WtRyFHoyR2vcnPVObjdwNgbrCNQPd6d
         m0png9svGlK0IpO/M66RrLTcCkh28PJvikLRxEhXRwVBq4HkRymlO0/f7eQ9tAwVFeM/
         v/QlwUO34VS1/ifPqi+/4Qj+ql8fEsMixu+yvSr6qR26+bbM5hysLRQ6QpsFNXqpwd22
         sx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751405864; x=1752010664;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OdmRU/xL8sd153MKFf5ld1ppQiJmRDfnpnmDu5gQhkw=;
        b=jBaojKC5HgIspDD7x31ljZIuN+NTzpcolG7C5PdUi0wATGttZVW+2O0KL2gbPBvyQX
         XAkf199HFXkZDyJgVFmyJmmiu7wCEL0kGLN0ke1ldZRKbteFq6vVGGxTzYeCFUL5KGda
         d4GL7TTb7DMRrZxSieWyv9KyAgHOfjrH2LmVYpBD46pyzgeEHwEVQJUKGnoA3wq6VJq0
         wMOUWGePXdw0X50M4IOLP0Qsuk+EolYzUGcEf01H2vnSu0g1NWFaHby4J35z1p9NRZxF
         IBUwQKWH9Pz5mCLRQWLPrjtB0SvoqEpmeHV46oy5HivXq4bYbbXXRDotN6n2FdNC6k0i
         mNuQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3qIwoNrNb8pul78HlYJZYl3hTTn0TH5Hs2I6vKHngd2xR0BMvoVASjF6sXvdTLuFJ5FIMmCQ3UMAD9ls=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfV6pPhv5zD0sE8M/nbKJO5ImE4XPqrgllmCybzrxdo59RbYkn
	+7kpCz/+J2TtajR1kQEwOEJs3ejAKj0kDUUcMpphwsN4jjmg2pktzWXE
X-Gm-Gg: ASbGncskQ9mgNjYUBzF4yzv3VO+K7CAk5ktcXhLXbtbIWALe5qEEykFrcNwIcq0GU61
	ajzyuJGGvsNF5qbKEjkALWyp7BjJOdYJg1gTdoCVYSirUPhNiHycI9prIP8q87fMOb2hP1yJzEk
	Atl4dQ+pw6MHgKWKJXI54HyMi3XUucq7BocFx7BWw/Bs+f1L4yz3RAMg1Wlz3Nau9VwujaE+Is6
	IKzYt/DjsA5btzYNwJMVbB8P11mz5U+TN9ZYkgVG8O+0jsUFZsZICRHsIf3byRYgNDQFsa1OR9F
	MxKFJMqhamqxs/nQMB2T7tYCBkZpVEwH/yVTGx+3v3VMUtmjtGNjSTBUUySTfg==
X-Google-Smtp-Source: AGHT+IHLXSEn4ikmGzjZbo3sSfHwWloeSWhunrHaXBB2o/ZdMTc7Y3bgH2+9jpDCT3tcXQPfrsIMYw==
X-Received: by 2002:a05:6a00:1ad0:b0:740:9d7c:8f5c with SMTP id d2e1a72fcca58-74b514c3b03mr463974b3a.18.1751405863519;
        Tue, 01 Jul 2025 14:37:43 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57e7279sm12198867b3a.150.2025.07.01.14.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 14:37:42 -0700 (PDT)
Date: Tue, 1 Jul 2025 17:37:40 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] uapi: bitops: use UAPI-safe variant of BITS_PER_LONG
 again (2)
Message-ID: <aGRVJHZF36KGVs4c@yury>
References: <20250630-uapi-genmask-v1-1-eb0ad956a83e@linutronix.de>
 <aGKkw6b1QPTf9yii@yury>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aGKkw6b1QPTf9yii@yury>

On Mon, Jun 30, 2025 at 10:52:54AM -0400, Yury Norov wrote:
> On Mon, Jun 30, 2025 at 03:02:18PM +0200, Thomas Weiﬂschuh wrote:
> > BITS_PER_LONG does not exist in UAPI headers, so can't be used by the UAPI
> > __GENMASK(). Instead __BITS_PER_LONG needs to be used.
> > 
> > When __GENMASK() was introduced in commit 3c7a8e190bc5 ("uapi: introduce uapi-friendly macros for GENMASK"),
> > the code was fine. A broken revert in 1e7933a575ed ("uapi: Revert "bitops: avoid integer overflow in GENMASK(_ULL)"")
> > introduced the incorrect usage of BITS_PER_LONG.
> > That was fixed in commit 11fcf368506d ("uapi: bitops: use UAPI-safe variant of BITS_PER_LONG again").
> > But a broken sync of the kernel headers with the tools/ headers in
> > commit fc92099902fb ("tools headers: Synchronize linux/bits.h with the kernel sources")
> > undid the fix.
> > 
> > Reapply the fix and while at it also fix the tools header.
> > 
> > Fixes: fc92099902fb ("tools headers: Synchronize linux/bits.h with the kernel sources")
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 
> Acked-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> 
> Arnaldo, do you want to move it yourself or with my branch?

OK, added this in bitmap-for-next together with the MAINTAINERS patch.

Thanks Tomas for looking after that!

Thanks,
Yury
