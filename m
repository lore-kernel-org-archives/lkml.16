Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C52283FC3
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748437191; cv=none; b=TQxKDgYYvdV/BZnfgFq1LBtqKlZGNIIpqyI71+fWLYV71JxenkNUZ+XLIXJ79qDkbXGIxtFk6qFj1OtJcSJzVgjn1L+nH7QZNUhZHMpQFOM8CkPmCMBf9Rgrrhpka0E2MAtD8A1kiWBMTvSNrjKq7/PI5iKAxdvfctZjS260JIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748437191; c=relaxed/simple;
	bh=C0NmBaW0ATR+BjEQEZWGSFa+sfjvBIIHXFfmCizBQV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TUqLop4wD75a1pCaIIsBrKPwaSeWoXs07XSdI0p8H7Qf5XtP816DktMzQRy5ogdttSaCBh+jYycJaRlvrntclVSeI9HLrIBTi2AeJRvyxHwePKd9vC0dy8ombE7WUlcDvJNP8YL9QgaarTrUlzwqNtD1AOqswRu2qF6KPEa6tSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E2hOF5uy; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E2hOF5uy"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-47691d82bfbso86046821cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 05:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748437188; x=1749041988; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mh3KYFguc08WUp3HQG/e3NOwLqhhclGw8CBRTTOw3xk=;
        b=E2hOF5uyCYaFXLK3QY9yHNIuPk9SUOYJMKyVoeum8fZWf28pRvz+yGCaCAh0uTmMP1
         XazinLmHV98caDDOhInckm9MLVURIyaxdQrGOtS71bmbeZ/TovcclOODD6hY0XeprTrl
         hn0jKnv9mLhw0fuYbKWlSyJ45qlThQJEYEX4yan3lbhf8VcGNZiCvstgvJH5HvjH9hSi
         LLVXqo1OC9vprxNx40wGa3rHrXEYfJH+U+WAoATWbD/g1PN6YmoglWNmPCnni5CIrIDY
         DyET9POZX0Kismg6eNLFhFWGtl5LWZlqOIp1fde3Hf2XHrmbpaChA9Ej9iP+xbLRLTJM
         Pxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748437188; x=1749041988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mh3KYFguc08WUp3HQG/e3NOwLqhhclGw8CBRTTOw3xk=;
        b=JEogf4s1HTLjKsYIGEC3rAMwN5edYeWOzgMX/RqehlLLCecrB9IhLe13wHxyAPzC0S
         hTexcDLbjriyrqg5fP1zQmAIi5RaA7U/TDU9W17jLD9pKetZhsVVhtSzEn6CmF/jHuQj
         oU/ozRZnMwvtUqSGCs52NXHOETq8hMklJO30x4UZhiW26S2M0vkPg10WIGBByymfwe1e
         3GKLKogvCA5p5RAQ9QWmC7/fCSpfc2OD5iqalXjxkSL8B6Mgnx6KaC6R47hEPZ38fiUt
         Vot91zN7XFJfqFvLyW6bCTMNsaePtRORNqbyLaktClrqdDFbqoPBvsOEB7CwjOOaPOOT
         JF5w==
X-Forwarded-Encrypted: i=1; AJvYcCW9obzcL5/igYYdItFJdspquDlKW0a5D8NVJaHmeaOWN6POEllR9Kw7W5m9HooQjkyGQqrw5doQnhr2OA4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3BsLQ7EUmAR8SB6aQ06RDU3gFretQ2mEYuHqkdt8HlwwdF31d
	+7wk9wX/YGRBkzm5HjZQsVmIB0954FgpTHlsWw+iQKQOFgX6SrTGsYJR908ynEpdU5FjCjklXRT
	gCDRwNI4YJGzTd6dab1YzG2ZIWDRcLjuoYneWvm6/
X-Gm-Gg: ASbGncuFx570JqksK6zOdy9b6VS8RwQSMgEF2GBxaWRPB26Wrw5qD2kKX61DQM+hfjM
	na7+lY2kSdTrpptvLgt9qaVg5XLRzZqQis8lJdvLjNCN5LtX1qKfVyu/qMt0Ld5pr6LgVt6NaW+
	8LhAkW+ael+Qf4Mcihc6HW9y7KENOLD8qUbycXB1pf+e4=
X-Google-Smtp-Source: AGHT+IFAJntWLEM+jLIr7N9mWP3wVZkrJg6XEkO/SEN/9+02OAMFuE/XmC+xS/0WBbR3yG/snqITFeF03Is/SbZOa1Q=
X-Received: by 2002:a05:622a:540c:b0:477:1edc:baaa with SMTP id
 d75a77b69052e-49f46154670mr281543701cf.6.1748437188237; Wed, 28 May 2025
 05:59:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAN2Y7hxscai7JuC0fPE8DZ3QOPzO_KsE_AMCuyeTYRQQW_mA2w@mail.gmail.com>
In-Reply-To: <CAN2Y7hxscai7JuC0fPE8DZ3QOPzO_KsE_AMCuyeTYRQQW_mA2w@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 28 May 2025 05:59:36 -0700
X-Gm-Features: AX0GCFv6GDabW9ltrrqADmuYBvRnrtFJ8jrQAKBbibiNhMSdO8QJCQSrZAN03og
Message-ID: <CANn89iLB39WjshWbDesxK_-oY1xaJ-bR4p+tRC1pPU=W+9L=sw@mail.gmail.com>
Subject: Re: [bug report, linux 6.15-rc4] A large number of connections in the
 SYN_SENT state caused the nf_conntrack table to be full.
To: ying chen <yc1082463@gmail.com>
Cc: pablo@netfilter.org, kadlec@netfilter.org, fw@strlen.de, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 5:52=E2=80=AFAM ying chen <yc1082463@gmail.com> wro=
te:
>
> Hello all,
>
> I encountered an "nf_conntrack: table full" warning on Linux 6.15-rc4.
> Running cat /proc/net/nf_conntrack showed a large number of
> connections in the SYN_SENT state.
> As is well known, if we attempt to connect to a non-existent port, the
> system will respond with an RST and then delete the conntrack entry.
> However, when we frequently connect to non-existent ports, the
> conntrack entries are not deleted, eventually causing the nf_conntrack
> table to fill up.
>
> The problem can be reproduced using the following command:
> hping3 -S -V -p 9007 --flood xx.x.xxx.xxx
>
> ~$ cat /proc/net/nf_conntrack
> ipv4     2 tcp      6 112 SYN_SENT src=3Dxx.x.xxx.xxx dst=3Dxx.xx.xx.xx
> sport=3D2642 dport=3D9007 src=3Dxx.xx.xx.xx dst=3Dxx.x.xxx.xxx sport=3D90=
07
> dport=3D2642 mark=3D0 zone=3D0 use=3D2
> ipv4     2 tcp      6 111 SYN_SENT src=3Dxx.x.xxx.xxx dst=3Dxx.xx.xx.xx
> sport=3D11510 dport=3D9007 src=3Dxx.xx.xx.xx dst=3Dxx.x.xxx.xxx sport=3D9=
007
> dport=3D11510 mark=3D0 zone=3D0 use=3D2
> ipv4     2 tcp      6 111 SYN_SENT src=3Dxx.x.xxx.xxx dst=3Dxx.xx.xx.xx
> sport=3D28611 dport=3D9007 src=3Dxx.xx.xx.xx dst=3Dxx.x.xxx.xxx sport=3D9=
007
> dport=3D28611 mark=3D0 zone=3D0 use=3D2
> ipv4     2 tcp      6 112 SYN_SENT src=3Dxx.x.xxx.xxx dst=3Dxx.xx.xx.xx
> sport=3D62849 dport=3D9007 src=3Dxx.xx.xx.xx dst=3Dxx.x.xxx.xxx sport=3D9=
007
> dport=3D62849 mark=3D0 zone=3D0 use=3D2
> ipv4     2 tcp      6 111 SYN_SENT src=3Dxx.x.xxx.xxx dst=3Dxx.xx.xx.xx
> sport=3D3410 dport=3D9007 src=3Dxx.xx.xx.xx dst=3Dxx.x.xxx.xxx sport=3D90=
07
> dport=3D3410 mark=3D0 zone=3D0 use=3D2
> ipv4     2 tcp      6 111 SYN_SENT src=3Dxx.x.xxx.xxx dst=3Dxx.xx.xx.xx
> sport=3D44185 dport=3D9007 [UNREPLIED] src=3Dxx.xx.xx.xx dst=3Dxx.x.xxx.x=
xx
> sport=3D9007 dport=3D44185 mark=3D0 zone=3D0 use=3D2
> ipv4     2 tcp      6 111 SYN_SENT src=3Dxx.x.xxx.xxx dst=3Dxx.xx.xx.xx
> sport=3D51099 dport=3D9007 src=3Dxx.xx.xx.xx dst=3Dxx.x.xxx.xxx sport=3D9=
007
> dport=3D51099 mark=3D0 zone=3D0 use=3D2
> ipv4     2 tcp      6 112 SYN_SENT src=3Dxx.x.xxx.xxx dst=3Dxx.xx.xx.xx
> sport=3D23609 dport=3D9007 src=3Dxx.xx.xx.xx dst=3Dxx.x.xxx.xxx sport=3D9=
007
> dport=3D23609 mark=3D0 zone=3D0 use=3D2

The default timeout is 120 seconds.

/proc/sys/net/netfilter/nf_conntrack_tcp_timeout_syn_sent
