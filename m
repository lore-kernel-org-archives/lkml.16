Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0899617A5BE
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 15:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749397792; cv=none; b=tdX1o6qN/Pg35kUuH1xj8rWBWSpi7mBP+wlY40qeRy2xa/Q4Ma6tqQRv02czVqz2YYV8czGIiAx/U7cuDhBTfBmp/FpfyiizcXt3Z8n6dFp3Oh5Cv8uEpM3RlZ9Z5YcdU86H+7UmyhpXQiCzYDVzJwn06U7QmxDUSlYJEvEdcV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749397792; c=relaxed/simple;
	bh=MKsTM1+C9QeCGD0Pjs9eZErUYlC1Pyuc2805DCEa5Ew=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vwg69pBVBPgC5cu7I0YhulrMr3EDWC/nwno93JjPKJeb0sd28On8jt67lcJ9bdcQFLeBG61mvtlEvx0t3/KBKwgtGd1AYcWENqnR7/OnwEX/SSuxGcUxuy68EUSO/tGJt+Gf7XRmwLs+Xu/U5ZlGmDzndfo6BKLvtlsqUBknX1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org; spf=pass smtp.mailfrom=networkplumber.org; dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b=qFBaxcwr; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b="qFBaxcwr"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d3862646eeso58891385a.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 08:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1749397789; x=1750002589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15SfyzB2KZkvwixg00o+49m0a1+RaFWhfwNSGqXDKgg=;
        b=qFBaxcwrGwx3aC4keLcL1yxTx9LInLVOMMYK5CmMizK9qjXY9C3o221FK2DC9cBFJa
         i0FJjBgYkCxNKBw4qQbWmAchJ61jl1pcxmPUUsX8+OTonLcqH7Ks1JbO1WhqS+rMjngn
         1Qhk0GRZP7Q6iIuPhV5yJjrDsGr4YqymemcP3H4k29FfwbPeOBXb3yt/TODOB3AOg8yN
         I8SROv+PIBKd1ereY3L7onL+lQTPsdITHJO1U83Xh03NzOm60f4o0wzJB48vj8QjCQee
         9gUeBu3fZTO9qNY7T0nZVgpdu6LlRskPWtMDKEfRk4YhzG3rSgakJSMbRDf6BlG+UJlk
         0S0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749397789; x=1750002589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15SfyzB2KZkvwixg00o+49m0a1+RaFWhfwNSGqXDKgg=;
        b=q0ppEqgCkTU/yNTZwHkD8T9ozYcFymfjceGWnbArcq5B1VVCb96A4k0zwMS7wOIllv
         VNDYmifhHJ67tlN/6P/ErwW2oLZ5HbUHm1LEIPKF3mb3RKDyt1uPO1UmsbV8Fe8rIBiN
         3Q9Nbxum5nJG/a6pigQhxQJgPJFBq0snp0+4eZTsnZyCP65AiJsA8iOsr0Mix7pX5mG4
         foWBLIMgKR9vT4FB813kHR2z09qpj18CfMhPxNFaiAwLl8RyH1/eM5uVGcisL/bKHCLb
         G7nbwrqRIbqSgQHJUkxzzfcuUexfwMIh42qJnRePvLjmMNuSM5X79VQ38SYBu+QwDn5w
         WTzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV9gZSxHaBq8Z+FW1LJKGXaaJV/cXvxc1hmal49Q15tu/43ooF+LNdy2XYsMG6ipkrC0NbkCG5YPaC2vA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeESa07ztxz5orhESU/jkUp1wgEdXTmvzf4Jg8XDTmQiEry9AB
	y+Zry88fPV40vnsGz+inipSxWYN0WIE3g/Ttpji9YUt/K1Nuqgszk307Y4ozZYT6p/E=
X-Gm-Gg: ASbGncu9mzw+9x/RKRO3od8QbuwoMkWWz2jn3Ur7l7DH5NJNhoWOBkGaNdSHXuElvYJ
	4LJLwz+WAKthWa9oPE8cEWMQb11q9D9o2MQl6RnngoUm5TROytlysEJiF7X6i2Dlgqv+AulmfjI
	Z68G1rw+CjXYdYwDZHub7C7gUUGN8NY1SfVFwvY/V/o7ttwhLSUD4cAiafUudhTr+ic4vH4yRFJ
	iAaxRjYdEfkUP2Zx44eY951Qk3YM1gYzpuPKB7ps3tvK80wU48FGpIJmDXuIvbtHLor07gX4kAE
	FtIejZE94Di3XJfNAKdN+kBvb7IOEqc8Je2D3HSHIy+vQYJxq+EQGyaxojquC4i6MscRB+3FfGw
	ps5AKWw7quWXNr0keziNmjB9jTZ8GPX2LoSZJLf0=
X-Google-Smtp-Source: AGHT+IFMItTRkpFBvAJi4PVEEUt3/gJfRAjUZYN3c1UYEfhEKFgqVle4xRdj02wbVxFz+gkYB1ZUlw==
X-Received: by 2002:a05:620a:9163:b0:7d3:8df7:af6e with SMTP id af79cd13be357-7d38df7ba37mr494433985a.32.1749397788793;
        Sun, 08 Jun 2025 08:49:48 -0700 (PDT)
Received: from hermes.local (204-195-96-226.wavecable.com. [204.195.96.226])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d25a61b5fesm425460185a.93.2025.06.08.08.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 08:49:48 -0700 (PDT)
Date: Sun, 8 Jun 2025 08:49:45 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: moyuanhao3676@163.com
Cc: edumazet@google.com, kuniyu@amazon.com, pabeni@redhat.com,
 willemb@google.com, davem@davemloft.net, kuba@kernel.org, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] net: core: fix UNIX-STREAM alignment in
 /proc/net/protocols
Message-ID: <20250608084945.0342a4f1@hermes.local>
In-Reply-To: <20250608144652.27079-1-moyuanhao3676@163.com>
References: <20250608144652.27079-1-moyuanhao3676@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun,  8 Jun 2025 22:46:52 +0800
moyuanhao3676@163.com wrote:

> From: MoYuanhao <moyuanhao3676@163.com>
>=20
> Widen protocol name column from %-9s to %-11s to properly display
> UNIX-STREAM and keep table alignment.
>=20
> before modification=EF=BC=9A
> console:/ # cat /proc/net/protocols
> protocol  size sockets  memory press maxhdr  slab module     cl co di ac =
io in de sh ss gs se re sp bi br ha uh gp em
> PPPOL2TP   920      0      -1   NI       0   no   kernel      n  n  n  n =
 n  n  n  n  n  n  n  n  n  n  n  n  n  n  n
> HIDP       808      0      -1   NI       0   no   kernel      n  n  n  n =
 n  n  n  n  n  n  n  n  n  n  n  n  n  n  n
> BNEP       808      0      -1   NI       0   no   kernel      n  n  n  n =
 n  n  n  n  n  n  n  n  n  n  n  n  n  n  n
> RFCOMM     840      0      -1   NI       0   no   kernel      n  n  n  n =
 n  n  n  n  n  n  n  n  n  n  n  n  n  n  n
> KEY        864      0      -1   NI       0   no   kernel      n  n  n  n =
 n  n  n  n  n  n  n  n  n  n  n  n  n  n  n
> PACKET    1536      0      -1   NI       0   no   kernel      n  n  n  n =
 n  n  n  n  n  n  n  n  n  n  n  n  n  n  n
> PINGv6    1184      0      -1   NI       0   yes  kernel      y  y  y  n =
 n  y  n  n  y  y  y  y  n  y  y  y  y  y  n
> RAWv6     1184      0      -1   NI       0   yes  kernel      y  y  y  n =
 y  y  y  n  y  y  y  y  n  y  y  y  y  n  n
> UDPLITEv6 1344      0       0   NI       0   yes  kernel      y  y  y  n =
 y  y  y  n  y  y  y  y  n  n  n  y  y  y  n
> UDPv6     1344      0       0   NI       0   yes  kernel      y  y  y  n =
 y  y  y  n  y  y  y  y  n  n  n  y  y  y  n
> TCPv6     2352      0       0   no     320   yes  kernel      y  y  y  y =
 y  y  y  y  y  y  y  y  y  n  y  y  y  y  y
> PPTP       920      0      -1   NI       0   no   kernel      n  n  n  n =
 n  n  n  n  n  n  n  n  n  n  n  n  n  n  n
> PPPOE      920      0      -1   NI       0   no   kernel      n  n  n  n =
 n  n  n  n  n  n  n  n  n  n  n  n  n  n  n
> UNIX-STREAM 1024     29      -1   NI       0   yes  kernel      y  n  n  =
n  n  n  n  n  n  n  n  n  n  n  n  n  y  n  n
> UNIX      1024    193      -1   NI       0   yes  kernel      y  n  n  n =
 n  n  n  n  n  n  n  n  n  n  n  n  n  n  n
> UDP-Lite  1152      0       0   NI       0   yes  kernel      y  y  y  n =
 y  y  y  n  y  y  y  y  y  n  n  y  y  y  n
> PING       976      0      -1   NI       0   yes  kernel      y  y  y  n =
 n  y  n  n  y  y  y  y  n  y  y  y  y  y  n
> RAW        984      0      -1   NI       0   yes  kernel      y  y  y  n =
 y  y  y  n  y  y  y  y  n  y  y  y  y  n  n
> UDP       1152      0       0   NI       0   yes  kernel      y  y  y  n =
 y  y  y  n  y  y  y  y  y  n  n  y  y  y  n
> TCP       2192      0       0   no     320   yes  kernel      y  y  y  y =
 y  y  y  y  y  y  y  y  y  n  y  y  y  y  y
> SCO        848      0      -1   NI       0   no   kernel      n  n  n  n =
 n  n  n  n  n  n  n  n  n  n  n  n  n  n  n
> L2CAP      824      0      -1   NI       0   no   kernel      n  n  n  n =
 n  n  n  n  n  n  n  n  n  n  n  n  n  n  n
> HCI        888      0      -1   NI       0   no   kernel      n  n  n  n =
 n  n  n  n  n  n  n  n  n  n  n  n  n  n  n
> NETLINK   1104     18      -1   NI       0   no   kernel      n  n  n  n =
 n  n  n  n  n  n  n  n  n  n  n  n  n  n  n
>=20
> after modification:
> console:/ # cat /proc/net/protocols
> protocol    size sockets  memory press maxhdr  slab module     cl co di a=
c io in de sh ss gs se re sp bi br ha uh gp em
> PPPOL2TP     920      0      -1   NI       0   no   kernel      n  n  n  =
n  n  n  n  n  n  n  n  n  n  n  n  n  n  n  n
> HIDP         808      0      -1   NI       0   no   kernel      n  n  n  =
n  n  n  n  n  n  n  n  n  n  n  n  n  n  n  n
> BNEP         808      0      -1   NI       0   no   kernel      n  n  n  =
n  n  n  n  n  n  n  n  n  n  n  n  n  n  n  n
> RFCOMM       840      0      -1   NI       0   no   kernel      n  n  n  =
n  n  n  n  n  n  n  n  n  n  n  n  n  n  n  n
> KEY          864      0      -1   NI       0   no   kernel      n  n  n  =
n  n  n  n  n  n  n  n  n  n  n  n  n  n  n  n
> PACKET      1536      0      -1   NI       0   no   kernel      n  n  n  =
n  n  n  n  n  n  n  n  n  n  n  n  n  n  n  n
> PINGv6      1184      0      -1   NI       0   yes  kernel      y  y  y  =
n  n  y  n  n  y  y  y  y  n  y  y  y  y  y  n
> RAWv6       1184      0      -1   NI       0   yes  kernel      y  y  y  =
n  y  y  y  n  y  y  y  y  n  y  y  y  y  n  n
> UDPLITEv6   1344      0       0   NI       0   yes  kernel      y  y  y  =
n  y  y  y  n  y  y  y  y  n  n  n  y  y  y  n
> UDPv6       1344      0       0   NI       0   yes  kernel      y  y  y  =
n  y  y  y  n  y  y  y  y  n  n  n  y  y  y  n
> TCPv6       2352      0       0   no     320   yes  kernel      y  y  y  =
y  y  y  y  y  y  y  y  y  y  n  y  y  y  y  y
> PPTP         920      0      -1   NI       0   no   kernel      n  n  n  =
n  n  n  n  n  n  n  n  n  n  n  n  n  n  n  n
> PPPOE        920      0      -1   NI       0   no   kernel      n  n  n  =
n  n  n  n  n  n  n  n  n  n  n  n  n  n  n  n
> UNIX-STREAM 1024     29      -1   NI       0   yes  kernel      y  n  n  =
n  n  n  n  n  n  n  n  n  n  n  n  n  y  n  n
> UNIX        1024    193      -1   NI       0   yes  kernel      y  n  n  =
n  n  n  n  n  n  n  n  n  n  n  n  n  n  n  n
> UDP-Lite    1152      0       0   NI       0   yes  kernel      y  y  y  =
n  y  y  y  n  y  y  y  y  y  n  n  y  y  y  n
> PING         976      0      -1   NI       0   yes  kernel      y  y  y  =
n  n  y  n  n  y  y  y  y  n  y  y  y  y  y  n
> RAW          984      0      -1   NI       0   yes  kernel      y  y  y  =
n  y  y  y  n  y  y  y  y  n  y  y  y  y  n  n
> UDP         1152      0       0   NI       0   yes  kernel      y  y  y  =
n  y  y  y  n  y  y  y  y  y  n  n  y  y  y  n
> TCP         2192      0       0   no     320   yes  kernel      y  y  y  =
y  y  y  y  y  y  y  y  y  y  n  y  y  y  y  y
> SCO          848      0      -1   NI       0   no   kernel      n  n  n  =
n  n  n  n  n  n  n  n  n  n  n  n  n  n  n  n
> L2CAP        824      0      -1   NI       0   no   kernel      n  n  n  =
n  n  n  n  n  n  n  n  n  n  n  n  n  n  n  n
> HCI          888      0      -1   NI       0   no   kernel      n  n  n  =
n  n  n  n  n  n  n  n  n  n  n  n  n  n  n  n
> NETLINK     1104     18      -1   NI       0   no   kernel      n  n  n  =
n  n  n  n  n  n  n  n  n  n  n  n  n  n  n  n
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: MoYuanhao <moyuanhao3676@163.com>
> ---

This could break existing applications. Changing the format of /proc output
is an ABI change.
