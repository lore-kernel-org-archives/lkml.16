Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8052586ED
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 17:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744394093; cv=none; b=DzW1O8JlKuoGN6BdevSJA0LIYzWRG8kqDcHPd+Bd4zPYIDpx6qpxko9giJhpMJzf0B83rEaesIaupa3VlxBBJbEcTvGr/ZXzrz7jgdE2lVwHBeswYuMXO/WhVyseXYRX0SlnE2Vji0rKl8ngPsnqFSVOYTdBc+rrq7Omthemc/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744394093; c=relaxed/simple;
	bh=ucba/TyRjphp5QB5NmFsNbDWb/WFdcnndSRrwoEMpJA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=StrHfNj5RWvvGO+8/JcmL+gxT+lfTeTL51kc+dLikOJzWj9cEvdwtIYmXTVxWaydRFlMr6/O6EkPelhlq4LfvD/Zlw2IHfLiAop8eY3a7eP05QFevsRVO/mtDurUDxLnTthyw8M7uYxyvQ0ScTrbgQbo1S9dEU8gNWyYmQ5TA70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=XIe8zYUP; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="XIe8zYUP"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac25d2b2354so368438466b.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1744394089; x=1744998889; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uZElioqvOJMRGLrrbRjtOKF/8Aggf8tT1T8UOQr1p6A=;
        b=XIe8zYUPdcuX4Vl9xiQHoFR6q7oqLvwv7yFoLGQk/648ktFbwV4erdH8vnG4UNV7W/
         4gqjXnDyTNzYf7Ro1TApfEldZpVvs2o4d5tZRSfNwQZZGsfeSL3BlxAtULHN1M7aKQgi
         XXFwNGzogrlL+z+9HIxZiUIR/mQLyNwX3Anda/UWqZiSq1c5axT8sqvWU3EutLven15V
         Jj8OWgsfRDeufCHi0tqPqmDdZifzNWFXR2NNmESArXmCMW25jJJlFQucVAgGt52nsfLc
         G1lnt9LX1ARITZ1pqid+Mb/R8j46HIDBhKJkvRaFHjCILoxzPbQrs4h+2d/2HnkwD9hH
         P7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744394089; x=1744998889;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uZElioqvOJMRGLrrbRjtOKF/8Aggf8tT1T8UOQr1p6A=;
        b=f8QiQLTcyBNnET71arsl/7q41zioMsQd5ahMeZ1yWnQoflgYXn/LntfnoDKN26QGV9
         iuo4SsQbjJTkmrp8ILvdRGnBP3zJbajhUZKZ5zc0lFasxSGWwq7/WcshCpwnfEIehvWl
         GIQtv8+imm3RZEafXRYloodKsXrJBSDCRDoC+HaVihQpH5Ga/2SZ52JaM0V2l/gC0VED
         MIhCZhnelcFKRZXlyLzL2aOlIpu/E1ckL8H1GScD982xZ4oyDFQ2xaJBGNQEr+WdDZ7P
         HLPPeL6FAYfjdLwX3v40WMmyIehLvjthMTJPLqfg4PEXeBVjx6ek02el0i/6UtjN8Vux
         6hEA==
X-Forwarded-Encrypted: i=1; AJvYcCWcnMKlLrvFJ6a13MhhezZRaoKsAWnUWWHXpD1zEikSafAV/Urh97vlMwTVhHzuNBDaUO4/3HQrECKeums=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9zB4iyA+LWU7qFRojJ0aEzoMwZItpt2PPLfUu+qnKbHSoJPUK
	mikR40vCQ0obp7wB/Xjp3kVwP6y3MAok3007jl8kyamI51XtRPlRSC0md9i2N98=
X-Gm-Gg: ASbGncvHJs9LAo1oOLiOSq9r0ucDIzBArXf67SLKwNhyKyHf9M+rA34JpYUFvbOodHe
	KhNeNJmCSZqsT6lUsdWKoC//gkHpRB+6BeBD8RkDLq5EeQm89ksZSfOLQ783jWlOGCt8gLrrLBN
	QXBee0B6CgGAmoOpeUUq6KRY+mieG6o/ENzfxIVNHaPfl07eCE0Y8ZWY3UVd7M8X/PPdv0cxuyV
	AJMwNpBemRo46hMwshKpxA8IQTSw9Br1Lh4f6IQfuM9PMWS8tvaCQHK1Yp205iXYfo9Ff0lZAE6
	zPp9iP2ttWOco5GwivIOp4KxkObDfudc
X-Google-Smtp-Source: AGHT+IHlsd1OjqlMWlAQPwwAuOKfCl8uk/pGPlrihEPFE8d9StcXjSTkGzgHNBrELNxLTW7C3iUInw==
X-Received: by 2002:a17:907:6d0b:b0:ac2:cae8:e153 with SMTP id a640c23a62f3a-acad3445f7emr328570666b.4.1744394089440;
        Fri, 11 Apr 2025 10:54:49 -0700 (PDT)
Received: from cloudflare.com ([2a09:bac5:506a:2387::38a:3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce70ebsm479714666b.178.2025.04.11.10.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 10:54:48 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Jiayuan Chen <mrpre@163.com>, Michal Luczaj <mhal@rbox.co>
Cc: Andrii Nakryiko <andrii@kernel.org>,  Eduard Zingerman
 <eddyz87@gmail.com>,  Mykola Lysenko <mykolal@fb.com>,  Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>,  Martin KaFai
 Lau <martin.lau@linux.dev>,  Song Liu <song@kernel.org>,  Yonghong Song
 <yonghong.song@linux.dev>,  John Fastabend <john.fastabend@gmail.com>,  KP
 Singh <kpsingh@kernel.org>,  Stanislav Fomichev <sdf@fomichev.me>,  Hao
 Luo <haoluo@google.com>,  Jiri Olsa <jolsa@kernel.org>,  Shuah Khan
 <shuah@kernel.org>,  Jonathan Corbet <corbet@lwn.net>,
  bpf@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 5/9] selftests/bpf: Add selftest for
 sockmap/hashmap redirection
In-Reply-To: <fnsy7wey4vaewoyur5363w2q2nb7dvljmaroijflgq2hfqbumo@gqdged7tly47>
	(Jiayuan Chen's message of "Fri, 11 Apr 2025 21:09:53 +0800")
References: <20250411-selftests-sockmap-redir-v2-0-5f9b018d6704@rbox.co>
	<20250411-selftests-sockmap-redir-v2-5-5f9b018d6704@rbox.co>
	<fnsy7wey4vaewoyur5363w2q2nb7dvljmaroijflgq2hfqbumo@gqdged7tly47>
Date: Fri, 11 Apr 2025 19:54:47 +0200
Message-ID: <87a58mh9co.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Apr 11, 2025 at 09:09 PM +08, Jiayuan Chen wrote:
> On Fri, Apr 11, 2025 at 01:32:41PM +0200, Michal Luczaj wrote:
>> Test redirection logic. All supported and unsupported redirect combinations
>> are tested for success and failure respectively.
>> 
>> BPF_MAP_TYPE_SOCKMAP
>> BPF_MAP_TYPE_SOCKHASH
>> 	x
>> sk_msg-to-egress
>> sk_msg-to-ingress
>> sk_skb-to-egress
>> sk_skb-to-ingress
>
> Could we also add test cases for SK_PASS (and even SK_DROP)?
> Previously, we encountered deadlocks and incorrect sequence issues when
> the program returned SK_PASS, so explicit testing for these cases would
> be helpful.
>
> If implemented, this test would fully exercise all code paths and
> demonstrate a complete example that covers every aspect of
> sockmap's packet steering and connection management capabilities.

This could easily be a follow up in my mind.

[...]
