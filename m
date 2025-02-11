Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC15219AD99
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 17:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739295962; cv=none; b=NZVl0VJxOWy0MHcNlQw5j70Fu1Fku85ArSvm0UpfPfjmbqkH4gxLVWQEsI/UN5X9mcjogmOQbplN3aHKKVUq9UcSZ9UJ9p2VlRKvfHpN5vTI/iQF3bnaF01tuVh0ZGNPPcsNCnPWL+M7Ya3punr1K7/4HXLQHX6FqrmuP5uDNkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739295962; c=relaxed/simple;
	bh=u0XrVF8iTTm5UaCKcKl+IQNCx5OX+tUX5xKCetplVyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktdGQE2wVNY2fQJwkXyKduFxph6T0NxNgocnFOrNHY7T6LLKi92UMzsvEDwCKcEkj/MaNgAaY3PbEf9oxTrqPHdw0D/wPl/5bWZxjiGSWpQg+aeYYq1jge1aDWnj/ky79uR2d4fQRcvCqp6B5PESHpMZCR0ObWZ/hbiqEAaEoi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=XH1xgEOh; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="XH1xgEOh"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21f49837d36so68441145ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1739295960; x=1739900760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hU0k36QB1XU8Cts/gsb6V0Pakg2qWpL/o6Sf1GbitsM=;
        b=XH1xgEOhDENpheNQveaJb4KLCeCzJm9EjxEHmPPgRbHIlriRz0vak7hBRdxK78EmDE
         QknjrOid6eSGRIryu48ME5qnumlV0sB/N5AE3QUuKPLmeH0IlkIe6/zUn7N15Vqa56wj
         rPYydxek/8UkSZLtb1IWkvb1MByGX9M7ORXjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739295960; x=1739900760;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hU0k36QB1XU8Cts/gsb6V0Pakg2qWpL/o6Sf1GbitsM=;
        b=ZxWz9S7VQTMOitB7J9AEYexd9QrlI298JRnQzqPpjeN9xjyj/gySpE6tlx5L752Smv
         Pc+7YtcODRzGsMkqr6m1TFqKO6FV7/HYdvFwQU1KoFJFObHYVulZ+HKEDkDh2jOM3Ll5
         pn7ohI9OchnLL9mbZnAFMe+1AhAfmMREp99et39CEkWg7WJOLwdGLjMGeQpI+moIslcj
         +gblrXsVtKy1qmv2SMQUgQWRE3dSQu+yjn4//ouBOTHVIUzI3AwSDhBtHibk46Ld1pj+
         7BLuTpXF3c/tPAnjtlE1Ht6VXoO7GPK/4ugXHpvuSdcxbNrPhJSQyXibkUC3SWdcrutL
         oulQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHrr7h3yoUYa/diAVssKvK1jOrlSqO/f4/goiWu3sM6ECvt6V6eYdZSQ4DWIO/7hq3fjdj+lEGd+QHKrc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw85yTQTZiDxS/G2ls0m+wi1aT2Y9PFYEN/6bmfVudpgWcuNAGk
	AtYvPEgnd48GppqEv4SA5zXnQyidrg3LF5+iISYPUpiuTw/mOUfkpg6txgTGhf0=
X-Gm-Gg: ASbGnctMzjyqpE32o/sGWIeXBORbK0bScFEV0gwTPVQBdbrQMgjwF6jbnHfatqVWQmf
	iXeEihPVXr9XxmVLYBvMSE75Q/6zxyw5njX3u+sxpHLsbVP6isW8pyM0XWRna9X9jFOm+bQUtBQ
	2+c9VcpUxHCn1LjSmAgelUzl42n+7V7fc10l1QBxDh5guy1RIbFRfayZoMzaxwAYB3sG2MhsWBu
	/agQPwoNyFiHJkIwm2IOVSI+3iC9drxFHqAmvTwCkQg1lAxbfMvKvU/qGQmBrN+0XxzDomv2XU5
	Wf0T+WM1tdX2qgd6L1gjxwbEeGI1YARlGOR2FZVIIbUFL9lWLrxhMsdcqw==
X-Google-Smtp-Source: AGHT+IG3/CAcTS3CiCjU9yipQAdPsOj3aLbPkEZBQL3ZsInksDgw155tgyytgR1Oc/LgBs+GNy+uXQ==
X-Received: by 2002:a17:902:e846:b0:215:9470:7e82 with SMTP id d9443c01a7336-220bbb112e9mr2596865ad.4.1739295959965;
        Tue, 11 Feb 2025 09:45:59 -0800 (PST)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51aecd55esm9673581a12.29.2025.02.11.09.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:45:59 -0800 (PST)
Date: Tue, 11 Feb 2025 09:45:56 -0800
From: Joe Damato <jdamato@fastly.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, stfomichev@gmail.com, horms@kernel.org,
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
Subject: Re: [PATCH net-next v6 3/3] selftests: drv-net: Test queue xsk
 attribute
Message-ID: <Z6uM1IDP9JgvGvev@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
	stfomichev@gmail.com, horms@kernel.org, kuba@kernel.org,
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
References: <20250210193903.16235-1-jdamato@fastly.com>
 <20250210193903.16235-4-jdamato@fastly.com>
 <13afab27-2066-4912-b8f6-15ee4846e802@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13afab27-2066-4912-b8f6-15ee4846e802@redhat.com>

On Tue, Feb 11, 2025 at 12:09:50PM +0100, Paolo Abeni wrote:
> On 2/10/25 8:38 PM, Joe Damato wrote:
> > +def check_xdp(cfg, nl, xdp_queue_id=0) -> None:
> > +    test_dir = os.path.dirname(os.path.realpath(__file__))
> > +    xdp = subprocess.Popen([f"{test_dir}/xdp_helper", f"{cfg.ifindex}", f"{xdp_queue_id}"],
> > +                           stdin=subprocess.PIPE, stdout=subprocess.PIPE, bufsize=1,
> > +                           text=True)
> > +    defer(xdp.kill)
> > +
> > +    stdout, stderr = xdp.communicate(timeout=10)
> > +    rx = tx = False
> > +
> > +    queues = nl.queue_get({'ifindex': cfg.ifindex}, dump=True)
> > +    if not queues:
> > +        raise KsftSkipEx("Netlink reports no queues")
> > +
> > +    for q in queues:
> > +        if q['id'] == 0:
> > +            if q['type'] == 'rx':
> > +                rx = True
> > +            if q['type'] == 'tx':
> > +                tx = True
> > +
> > +            ksft_eq(q['xsk'], {})
> > +        else:
> > +            if 'xsk' in q:
> > +                _fail("Check failed: xsk attribute set.")
> > +
> > +    ksft_eq(rx, True)
> > +    ksft_eq(tx, True)
> 
> This causes self-test failures:
> 
> https://netdev-3.bots.linux.dev/vmksft-net-drv/results/987742/4-queues-py/stdout
> 
> but I really haven't done any real investigation here.

I think it's because the test kernel in this case has
CONFIG_XDP_SOCKETS undefined [1].

The error printed in the link you mentioned:

  socket creation failed: Address family not supported by protocol

is coming from the C program, which fails to create the AF_XDP
socket.

I think the immediate reaction is to add more error checking to the
python to make sure that the subprocess succeeded and if it failed,
skip.

But, we may want it to fail for other error states instead of
skipping? Not sure if there's general guidance on this, but my plan
was to have the AF_XDP socket creation failure return a different
error code (I dunno maybe -1?) and only skip the test in that case.

Will that work or is there a better way? I only want to skip if
AF_XDP doesn't exist in the test kernel.

[1]: https://netdev-3.bots.linux.dev/vmksft-net-drv/results/987742/config
