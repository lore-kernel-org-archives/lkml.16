Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A011E253324
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744907601; cv=none; b=YCyXKvnr/f/Pq08bYWyd7QO8Q/nd9UUVoyc4fM4j4lgwI2l3ed9M+NhMyqA0NLjIdvb1LeSDtSex/HdBD64Dr7zr2Tg35SAZxl7LBDSVvF5TiZ1ClP0QrY2vlIZTtbJbJw/+7iJXsD4vpdV44yU9iCaURRPeSqHIpyLu4F7DRtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744907601; c=relaxed/simple;
	bh=MorJ0Vcovdi4XLQZKAYt8UWHrt+gqIuT1WCj8KBdkGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LYLVmYU9lb3OQPeYDC1SwJrjU59L6c8hsGhsisZ0HdKrnZgBdlL6btd4PmCwkH2Q/EXidJd2ESyWS9pPYmhJzuzCy8KSwbSXBVkazWLkfpL7QxQSLQDNJSEGQg6KZEvrNytCNCoEgy7hdvb9KTiPJtGMXJ+ti0dWY2dp8vnuOq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=L2BHWXuB; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="L2BHWXuB"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2240b4de12bso15663325ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1744907598; x=1745512398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mprfwwo0Da4LxnvcuRCJo8vR8B5fCLfrLhkCs2VqZg0=;
        b=L2BHWXuBfQDvEXIUJ2E9Y9ISzkb04o6NxilKIALyLn2k/F1a/k/Jhtew0qp5NcaQR+
         yBdIBb8V6lIarsQgoYIsyEUKb3xUnfQacsT219Ndp3wvcv099AiTTvzUUq2YQmyiX/y8
         QyAwIvSBEgeqtE6O7ZOsAZUTJUcM29nhF2obE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744907598; x=1745512398;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mprfwwo0Da4LxnvcuRCJo8vR8B5fCLfrLhkCs2VqZg0=;
        b=P+itQxeO+yHmFHQwkep8u8aw4BTMOupCkJeGbbG5NPKdWDD7X7NHRawSyEeIfmD9Rc
         BYtVESVUQY0N2J5XWhOD4oeqLvcIFlMSoyK1GnfyrhsMiuVq01f4wWlFhEzQpMevk+tl
         YhYZVexErYWBLe/hjvrWSbduFLI8ILXb+BDsgLIUQxvKzri1ALNPLzP0YMXBT+vgVVnC
         g8oA8HjKFi5jVh+63barz1T5c3Vub8qQ3XESqAoh0HKkL/qBznatZn2HzICKcHyXJnmc
         IcmismY8YoX1M3QdsxnujnqOe2TrSUtD75n+DyoLML15rmGYRX206w/EjUDiw98kr/7r
         v73A==
X-Forwarded-Encrypted: i=1; AJvYcCXI3V1J8wFFyArEZ9n483ldrgO4foyBYtoTqWCYXeyiiZPVVXBJQqpKPvC7kYVCXGbhZJXZddpFkqF4bkE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxEwpU/JL03I4JXE/aJK5UHut/oLulLJbjX9YTFTn9EN4E0RrL
	SjpbfYZMgf74vIh7nvWjpcBGxQFex1HirIv7rN7P386OHZrFnIiYIcrnzOmdplk=
X-Gm-Gg: ASbGncuEOgzXLO7ixp1z2QUN7D/OWMC9At/hNVarSi0IWGW2vdx0jGR8Q0lrh34UlMd
	evujkFuZoK/S7m2aEIy2VYmcOS+m6WtsOOgGff/1IiFkdQXLnvtInnJMQ4X253bSysPrw98cjog
	+uF70UWyY5Dau5oPKPiWYQZT5y7zBqekQCm7wWCz8LhKUAcWGimYglA4pyIMSq3nR6NOF4RMdJS
	o7undGJv9yD5f1eQDXpYpFiu1tyGCFZNBKHL2lXsPACxDC7AdhRLpO751eJ/6FY5ADOr4DqhdVY
	Wyyjb0NxYhai94gtcwXuSG4V7rZpMr9WklFw6cmyZp9p3BCNUsi8QN8YXuEoNfVr5kLwPDgdYfm
	NNFQhCkIg1697
X-Google-Smtp-Source: AGHT+IGJpmGDv/RmZoBpASwHCPsKTxrbaXtrzgvFEb/fiM5N6VFMbYf2bDKD9j/RfqFYVUJiTtyDyA==
X-Received: by 2002:a17:902:ce91:b0:224:1ce1:a3f4 with SMTP id d9443c01a7336-22c358c543amr88775005ad.1.1744907597917;
        Thu, 17 Apr 2025 09:33:17 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bdae5dsm2114315ad.35.2025.04.17.09.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:33:17 -0700 (PDT)
Date: Thu, 17 Apr 2025 09:33:14 -0700
From: Joe Damato <jdamato@fastly.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, kuba@kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Shuah Khan <shuah@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	"open list:XDP (eXpress Data Path):Keyword:(?:b|_)xdp(?:b|_)" <bpf@vger.kernel.org>
Subject: Re: [PATCH net-next v2 4/4] selftests: drv-net: Test that NAPI ID is
 non-zero
Message-ID: <aAEtSppgCFNd8vr4@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
	kuba@kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Shuah Khan <shuah@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	"open list:XDP (eXpress Data Path):Keyword:(?:b|_)xdp(?:b|_)" <bpf@vger.kernel.org>
References: <20250417013301.39228-1-jdamato@fastly.com>
 <20250417013301.39228-5-jdamato@fastly.com>
 <b1fa9607-f9bd-4feb-a22f-55453a9403e9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1fa9607-f9bd-4feb-a22f-55453a9403e9@redhat.com>

On Thu, Apr 17, 2025 at 09:26:22AM +0200, Paolo Abeni wrote:
> On 4/17/25 3:32 AM, Joe Damato wrote:
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
> Not really a full review, but this is apparently causing self-tests
> failures:
> 
> # selftests: drivers/net: napi_id.py
> #   File
> "/home/virtme/testing-17/tools/testing/selftests/drivers/net/./napi_id.py",
> line 10
> #     listen_cmd = f'{cfg.test_dir / "napi_id_helper"} {cfg.addr_v['4']}
> {port}'
> #                                                                   ^
> # SyntaxError: f-string: unmatched '['
> not ok 1 selftests: drivers/net: napi_id.py # exit=1
> 
> the second "'" char is closing the python format string, truncating the
> cfg.addr_v['4'] expression.
> 
> Please run the self test locally before the next submission, thanks!

I did run it locally, many times, and it works for me:

$ sudo ./tools/testing/selftests/drivers/net/napi_id.py
TAP version 13
1..1
ok 1 napi_id.test_napi_id
# Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

Maybe this has something to do with the Python version on my system
vs yours/the test host?

I am using Python 3.13.1 from Ubuntu 24.04.

Please let me know what Python version you are using so I can try to
reproduce this locally ?
