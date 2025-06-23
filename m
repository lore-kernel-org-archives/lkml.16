Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3A1188735
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750679068; cv=none; b=Y2DcAdp4xj4Lis0cFDAzTrTBqfoV27kQTX7HW4cbr9jquFpStud9ZCjZHBrIFcKf2uxRceK3YQ5R7IzaKbPVJ5llQYwVJnOcoTrcfPFEuW4iBeg43M34rGrlkd/uEDMK1KQfT0Fblz155fzQh4Ei8WYZixI+3hM7W7yIrklw1jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750679068; c=relaxed/simple;
	bh=4ZqoQKdDvBPRQXyCngBAlFvRk74fScCEs9u1xA/pSDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f1goUKPp2aFbD5nN4vmx23wq1oGv5ahFJ2AalXyUyVajoiFScjyql6j0QFwC3FlP/2fWqzaZkjWkvl5zZuf2P+0em7iD947kXY2645HnABDdWhxG/xpC2KxIAMHuL0gXsnQgVlfZpImnOV9pp1j0Ga9vSmkND6qRHZMoqcPaDrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PxJJpEfT; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PxJJpEfT"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a440a72584so45037271cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 04:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750679066; x=1751283866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrHTjhxlEVyzlxLPx8Yr8nFxLDqwxAF0xyp3qSY+qZQ=;
        b=PxJJpEfTmjLyvhiOKFI5GTh+dOTi/378xb7t37Pk9AAUUFK8wtVBYPCfudYu+CP5jc
         IQvtcFj+4+3CDqjUJskv8Xcth2KJ9abvvAeEih5RJaofDyZJaR38sOlcBlmgSbQ9rP8f
         Ef1BnH/c+ilX3BObEuJpOT3f8nO+dPOfO8MZzfjHSkm42bc6tGive6vKLev7IOFpqINb
         3p7tHB0V9CsOPca8+9r2IN+nZrwkbyNVzVPzNiEtIe0rea67x643f3MKeVt6OWOXMjzN
         VTNg14BdPTEbkTFoghnyezdyUgEljOdKMk1xAPipj77UVfna3cjaxrI2nlI05psfPVMa
         8oFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750679066; x=1751283866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrHTjhxlEVyzlxLPx8Yr8nFxLDqwxAF0xyp3qSY+qZQ=;
        b=QwXfY3GNwLq4TLNza8PBkjc8Wm3ZoEoXqXpQUlB78zAU9B8wLNPE58c7zpIh8iGItg
         7kpa0Vm2G5UeejHJR9F7bIyjG3qWHLVMfrXR3qGaUdh9OMkNXS4MLtQB0inORM8iR8zH
         lgCaF/5z6Q1AFcaEE4jQKBpdXWDVyWv4GYLIXUT+4QVQ8UZXbOFDnk418YyDbUafDblr
         3xcAbs10scI5Vv6kIRWRCRqRbDu9NQw1/AwNxNVxHn0mX8uMjxFdB4ZWA9OUvTKv7X0V
         PPBMScqB1j17aIy2a80k/naZbNjm4KYWVamgJlgcUpfhar6s3AMldjo8mbD/VI6RPaqo
         nYUw==
X-Forwarded-Encrypted: i=1; AJvYcCW77f71NUvyf0IgKSW2y9IgBFojkObILhks/NDBn2qJ86At5wWm8/UquHVHJhwGI/2zgWv0CVERzoR8MCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5RBSAXBmuvdhddMyJ9+fgGXzIgoM/9lQr37RY5EqgCbzPobXa
	wN2DGiuQOeVtDjR9i8Rjq8a9Tw2NnSzqO4UP7+js1bSP8WO1AQ4B+x1ndfztd6zsJw/0dgqNBgN
	Da29g+0PBkOBZ9+MWNcWBTmozrCf8gtHgWe2z3WKI
X-Gm-Gg: ASbGnctsykEeQ16oW8phrEiaAJkn1PParp+2Ip8YB7uhQTE8aA06s/Aq0bbY6ermiaq
	SAM8esRU1T7IkIlVlZVL1slS9KXgv2sZqACMuxTLf3mq9hqXYpAuYdLUfvYTDa0W/swdY0yBgZk
	kUqXk8L0NFBCIRMt9FuPabE7V2sSigCwzVqukoekRsJEE=
X-Google-Smtp-Source: AGHT+IHfB/vZlIK9/FvjHWffL16LexUgBodwMHiN20SOOnfFPs17HBBf8UZjdusDwWuVV6zghVMq4F6HwMqGXNnWlks=
X-Received: by 2002:ac8:7f87:0:b0:4a4:4165:ed60 with SMTP id
 d75a77b69052e-4a77a23a330mr188912371cf.3.1750679065927; Mon, 23 Jun 2025
 04:44:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620125644.1045603-1-ptesarik@suse.com> <CANn89iLrJiqu1SdjKfkOPcSktvmAUWR2rJWkiPdvzQn+MMAOPg@mail.gmail.com>
 <20250623093604.01b74726@mordecai.tesarici.cz>
In-Reply-To: <20250623093604.01b74726@mordecai.tesarici.cz>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 23 Jun 2025 04:44:15 -0700
X-Gm-Features: AX0GCFsucZXpCrOv00H7hp6ojejTsrZfYjmXvKm7wa1_ILtb3HSf82YKGy7NqRQ
Message-ID: <CANn89iLKuzbEq=7A-TnB6jZypx0mObbLSNA=HmLjj5CBooBYPg@mail.gmail.com>
Subject: Re: [PATCH net v2 0/2] tcp_metrics: fix hanlding of route options
To: Petr Tesarik <ptesarik@suse.com>, Willem de Bruijn <willemb@google.com>
Cc: Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"open list:NETWORKING [TCP]" <netdev@vger.kernel.org>, David Ahern <dsahern@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 12:36=E2=80=AFAM Petr Tesarik <ptesarik@suse.com> w=
rote:
>
> On Fri, 20 Jun 2025 06:24:23 -0700
> Eric Dumazet <edumazet@google.com> wrote:
>
> > On Fri, Jun 20, 2025 at 5:57=E2=80=AFAM Petr Tesarik <ptesarik@suse.com=
> wrote:
> > >
> > > I ran into a couple of issues while trying to tweak TCP congestion
> > > avoidance to analyze a potential performance regression. It turns out
> > > that overriding the parameters with ip-route(8) does not work as
> > > expected and appears to be buggy.
> >
> > Hi Petr
> >
> > Could you add packetdrill tests as well ?
>
> Glad to do that. But it will be my first time. ;-) Is there a tutorial?
> I looked under Documentation/ and didn't see anything.

I came up with the following test (currently working for IPv4 only).
Neal, Willem, any idea on how to have this test done for upstream tree ?

tools/testing/selftests/net/packetdrill/ksft_runner.sh does not have a
way to make a test family dependent.


diff --git a/tools/testing/selftests/net/packetdrill/tcp_cwnd5.pkt
b/tools/testing/selftests/net/packetdrill/tcp_cwnd5.pkt
new file mode 100644
index 0000000000000000000000000000000000000000..e28b63b696d200ca447f613c300=
03571c1ff1ae8
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_cwnd5.pkt
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+// Test of RTAX_CWND routing attribute
+
+// Set up config.
+`./defaults.sh`
+
++0 `ip ro change 192.0.2.1 via 192.168.0.1 dev tun0 cwnd lock 6`
+
+   +0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) =3D 0
+   +0 bind(3, ..., ...) =3D 0
+   +0 listen(3, 1) =3D 0
+
+   +0 < S 0:0(0) win 32792 <mss 1000,sackOK,nop,nop,nop,wscale 7>
+   +0 > S. 0:0(0) ack 1 <mss 1460,nop,nop,sackOK,nop,wscale 8>
+  +.1 < . 1:1(0) ack 1 win 257
+   +0 accept(3, ..., ...) =3D 4
+
+   +0 %{ assert tcpi_snd_cwnd =3D=3D 6, tcpi_snd_cwnd }%
+
+   +0 write(4, ..., 20000) =3D 20000
+   +0 > P. 1:6001(6000) ack 1
+
+   +.1 < . 1:1(0) ack 6001 win 257
+
+   +0 %{ assert tcpi_snd_cwnd =3D=3D 6, tcpi_snd_cwnd }%



>
> > Given this could accidentally break user setups, maybe net-next would b=
e safer.
>
> Yeah, you're right. Technically, it is a bugfix, but if it's been
> broken for more than a decade without anyone complaining, it can't be
> super-urgent.
>
> > Some of us disable tcp_metrics, because metrics used one minute (or
> > few seconds) in the past are not very helpful, and source of
> > confusion.
> >
> > (/proc/sys/net/ipv4/tcp_no_metrics_save set to 1)
>
> Yes, I know about that one. FWIW it didn't help at all in my case,
> because then the value from the routing table was ALWAYS ignored...
>
> Petr T
