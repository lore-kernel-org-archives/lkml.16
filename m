Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBE1276045
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749152638; cv=none; b=lCUKTcfUBt46c9DoyqqH4ohXzj97Ex0dN3+rl8YI5oJFQQkOhK3To/PrrjKdoJ82gXBLMTfnJi+0js1GfG5oTHJAFTPOhOau6edLgaZSS/qJv5ZMevoF2t3TSzEu4ifUkbI7IcIlE7TjVqf55DtX5DBbr762Zd/1nvaVRzFnVC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749152638; c=relaxed/simple;
	bh=jN44ZFVMr9GHNcIYHb3FN2FmJm8OL7ZLAAK+uoNvIUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZXnCsfPHZtKleiZDWx7BI9AojtHu3FB4LGEjYC5CWS5lyjLrmu2EczwIcQxaG5J60r/rM74GcZpJpSE5d7kJ4OZxYoeb+0MsTDJmVCDphTxDKSXsjin/LcHJyLdI0zbWNK5L09Vt2kApFDPFbGbYjPXkvT7HMBwE4uL2OrfSBsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BNGckdM9; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BNGckdM9"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2357c61cda7so4215ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 12:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749152636; x=1749757436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lj3tye4JAMlRcErC28Dz8Fh6Njy6GB9AnVOY8tKtYOE=;
        b=BNGckdM9/alHGZr0CBny/zgGBFCG+enXk78P0r9eya08tX3/YohwUdPyv/SlWm3zdC
         qxYDfmb7/Mn9mfRWO3BTsUL8fbeV8tpYAItRvKYumdF7YjVzzeoos3TDl8c8TWtvthXe
         BuiDWcdFpEQTevPC8LL5yFrA82tst+ntTxrvyGGCaiE5W5MaSncDqL4tJeqHSr+8+okt
         3XdCh1Ko41oc+rOXnspAuaWWxUyX1hs8PshRaazqYhMdsGjmCPrN8cU3o0x0rf1EEsCr
         0AlNf+wlsP2JxV3mmyMQdWe62Yc8qw+yONOpI+v4+eAF9BnBMuyNFP4O+x8kLtsAVqCt
         28IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749152636; x=1749757436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lj3tye4JAMlRcErC28Dz8Fh6Njy6GB9AnVOY8tKtYOE=;
        b=nJWSR5aw/x3S/BiXjhHaYJ+QGzPXjbxMqXiXKCcEIRpswGR5j2OR0clMtd/IU/YaZ3
         3BT58dZV0An00pjlnCyY9tGYyuDakCqKvbetdTJv2z87O/SDEZhCIQ6bGqLxZSnLh4il
         ttQ2+2QTl8UkaHi82kdGo59aIhL8WZ0UdD1wT7h4fXj5mhAb8SFCKdNPVnRr1oK9JRZW
         LFOx7Ax49vj9n0+vU/p8bpl+KNS009Xyuqxf71l1K7KX02myCL0e5xMd7aRebaanQYmk
         1cULUw6NqA3Z07wpBTCpevGtS817gxoc9w5M/EagYPAsntyZ/XUJp5o0yhA57GAyt/QR
         LgTw==
X-Forwarded-Encrypted: i=1; AJvYcCXFoQE/wF8OCZxWBDwXMeUPblg2A6otgOqZ3rmYsst6+DPn65eqEywraLaMkp4DNvUFVtl6tUY+L2wIqe0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp7Ca1ZQJ+rQMefbGrCNMVihlAfQxHqegnbsHkMr4IGbQdJGEg
	nepb3sMGNSarEJfd/2d3tWGW41Fk3DATl7it34BDdnBZOBKMLoe8pblYF6jwetOSFUiIVyeFfGO
	elB0omjG8NF8i9+G0dWOH5OUdHkhgnJXvVsj3pAHm
X-Gm-Gg: ASbGncsNhmXSTEFM0Aa+g3eDfP9a1H6uLY1GlRgjwdq8786j41GQvNwQLIHjQSsSxeR
	v8BqNsj/kG6jtqBSbtPP2L60skMfaNjXg8lLzWTZZNsPSFwfI6zag7NAtddPEbEdFzJT1C58iV8
	UlKSxyLoB5f5+SHGYGq29lK9VHJJjUjzNj6/jaXpNtDdDAJLzVFrYufjA=
X-Google-Smtp-Source: AGHT+IEBIODvKBKgtAshAl1P411grxlbXS/55w2jMC1YMikPG5ZKwDo4SPQP9h6zD1jvtjknBfImHPrKKrn1cZNVkuU=
X-Received: by 2002:a17:903:1c9:b0:235:eb8d:8018 with SMTP id
 d9443c01a7336-23602350a46mr581785ad.28.1749152635690; Thu, 05 Jun 2025
 12:43:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604025246.61616-1-byungchul@sk.com> <20250604025246.61616-17-byungchul@sk.com>
In-Reply-To: <20250604025246.61616-17-byungchul@sk.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 5 Jun 2025 12:43:42 -0700
X-Gm-Features: AX0GCFtYUIJFXLeYwJiH9gq68hlpsWo0WYW6pa8nN0A0HiJO6W2G4teckj3LJCU
Message-ID: <CAHS8izPU=A-sb-8ybSGx=Y30at1Rah2ofpR0FfRAgUnJ87=-rA@mail.gmail.com>
Subject: Re: [RFC v4 16/18] netmem: introduce a netmem API, virt_to_head_netmem()
To: Byungchul Park <byungchul@sk.com>
Cc: willy@infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kernel_team@skhynix.com, kuba@kernel.org, 
	ilias.apalodimas@linaro.org, harry.yoo@oracle.com, hawk@kernel.org, 
	akpm@linux-foundation.org, davem@davemloft.net, john.fastabend@gmail.com, 
	andrew+netdev@lunn.ch, asml.silence@gmail.com, toke@redhat.com, 
	tariqt@nvidia.com, edumazet@google.com, pabeni@redhat.com, saeedm@nvidia.com, 
	leon@kernel.org, ast@kernel.org, daniel@iogearbox.net, david@redhat.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, horms@kernel.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org, vishal.moola@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 7:53=E2=80=AFPM Byungchul Park <byungchul@sk.com> wr=
ote:
>
> To eliminate the use of struct page in page pool, the page pool code
> should use netmem descriptor and APIs instead.
>
> As part of the work, introduce a netmem API to convert a virtual address
> to a head netmem allowing the code to use it rather than the existing
> API, virt_to_head_page() for struct page.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>
> ---
>  include/net/netmem.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/include/net/netmem.h b/include/net/netmem.h
> index d4066fcb1fee..d84ab624b489 100644
> --- a/include/net/netmem.h
> +++ b/include/net/netmem.h
> @@ -265,6 +265,13 @@ static inline netmem_ref netmem_compound_head(netmem=
_ref netmem)
>         return page_to_netmem(compound_head(netmem_to_page(netmem)));
>  }
>
> +static inline netmem_ref virt_to_head_netmem(const void *x)
> +{
> +       netmem_ref netmem =3D virt_to_netmem(x);
> +
> +       return netmem_compound_head(netmem);
> +}
> +

I would squash with the patch that first calls this to shrink the
series, but anyway:

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
