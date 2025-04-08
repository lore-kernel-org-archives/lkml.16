Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03922620E8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744099884; cv=none; b=LwhFxc4TKN/jaryzaeIol/wedkTTFnbUNVzfuIV3c18sRM1QpMlSghBvSpkm8zcUklbIP2vudj1UMrm37cnT06+jl+WHpdpxiLIc+stJZ/Oz+1GuM+uhoZeRv3plcv8w9exzHSDd+R4Kq8/KQeIzRfYR6cgTnLPOFcUDZ00rWxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744099884; c=relaxed/simple;
	bh=HNeRbYF4/v2655du+OhPlrYqgFpc4HO0WwSrHFA5Wvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYA9v18GTvy7RPVKP1uBOf4lP1R77jBKBrUhMz1UkWUtZwI1Jku47E4Alw/ozLKYuOI5dcjczeJu9BsGkYKCev2rZVSGEhHnK+cEomFKw6OjE0EdwwAMeC+Uk9jOO6FeohFh3VDi52hUg+TcvFOzHbr3lzLsXiVnybY5cGwDbRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fIIoJFUd; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fIIoJFUd"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-224171d6826so72477565ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 01:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744099881; x=1744704681; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNeRbYF4/v2655du+OhPlrYqgFpc4HO0WwSrHFA5Wvk=;
        b=fIIoJFUdoObj6pLnLKymgmHqDL1Kn+AYCSRTQyNUsdbRbH1Z24unMEj8egSOgIlQ4w
         MwUjlWuYlKj2prZlIJQI/FHgbLjcXCYwWt3AfuLgErb/zm/YoDxSFFXJoVyNnqFfURlN
         0v3Avb+D7sLQf1IYh6VXeX/lyAOSmaqI+xAFjhbkoNYRTShz3DWE2d4w7nMeikKESUx2
         VaRtB1MpBTNd3szxMp9I1321TGWYD6Xw/63Kd8AnYeR0jfWmq8rKKyvl7RAJmMFtC1u8
         8XM/S8dpGFa1Gw/9RJ70E0Y8+0c5V7Ivik/4ZPpFtgaoBA7HagD2aPfdUuqdIy17I0RM
         DWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744099881; x=1744704681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNeRbYF4/v2655du+OhPlrYqgFpc4HO0WwSrHFA5Wvk=;
        b=vikO/42o5zgn6ikjmdHFJjAB+fpmCcv8t5UDeyB5BqoF8NLKXt+4HlvZiaAfjV5KvE
         lLRZHWtZzANvHpWFu3yBm2+wbAhVMAwp9tnQ1t+PZnumjNSc9Z+VfpV19Okhbvtx1537
         DyhEb8ifE2yjAteJDdp5Lk3/9dZHjnvYgvsn4y5wCCswFod5MOjo+nnbdzdk4ujrLaR9
         MuxpZMP+pHNOikkq14yZ6y1wPap8OteumiOl+ylM1d2+SMuY709yAN9IpFf+RZ2KwNQE
         83ED1BBo8sCKoZflREWYzy0rZu0vCxSLHPWuo34K5rUe7cZU+o4tl0EkN+Fj6z1VATGC
         WbGg==
X-Forwarded-Encrypted: i=1; AJvYcCVwvcRqRnJK6p5H2no9uSq25NNcOxyTZAJKCO6hj4ZehvjlSIQywMoxEvC2rwg90tMKtIYq3uH2q3uDaaE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNqLWai81OW85cExjN1mcgIsQovFDSWakTBWGMLVIyQQ8ZFW9R
	1/RodaZUBWCyv6c3K93xG2B/LlcU0buhV6JHTGJuEg4WiVpjI4xnL/eYBzSLaTXCT9y5Cn3RcPX
	RxlvRjmea+JW1ieKos0CZrPpDtoJwC7PgLETH
X-Gm-Gg: ASbGnctFJwZoALMM85s/Yvtl9KHlbAcr7DSDVeUFcnVfH4LY10EHfZdVUvlw9T/vpsy
	+oZnqB8b1ultSZBW5Wf92SRyRXr9ZkhzPAPWRsLCykYs2Et9wVbjVgqBO7EyFco6PSZxdkFsThj
	0bpgxH3kDGA0TzNHpVqceb0HFyxMYQG1nimprYxEdrTqRXv2q+471B9kuA
X-Google-Smtp-Source: AGHT+IFQWcX8la3mf3erxygnc0Yxk6VdfJlO+R1O7xgLJNRsvV6Nb+bNzo3lRucwwrpQVJHAsLqHfIHBTUxDqrFrZkE=
X-Received: by 2002:a17:903:1cb:b0:21f:7a8b:d675 with SMTP id
 d9443c01a7336-22a8a0428b8mr221441315ad.4.1744099880739; Tue, 08 Apr 2025
 01:11:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z_PfCosPB7GS4DJl@mini-arch> <20250407161308.19286-1-kuniyu@amazon.com>
In-Reply-To: <20250407161308.19286-1-kuniyu@amazon.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Tue, 8 Apr 2025 10:11:09 +0200
X-Gm-Features: ATxdqUEJdhoVuF1kE17SFFqgm4y9d22GopYGugK8_wlLPzMs2KTVHWjwqJHr5p4
Message-ID: <CANp29Y5RjJD3FK8zciRL92f0+tXEaZ=DbzSF3JrnVRGyDmag2A@mail.gmail.com>
Subject: Re: [syzbot] [net?] WARNING: bad unlock balance in do_setlink
To: Kuniyuki Iwashima <kuniyu@amazon.com>, Dmitry Vyukov <dvyukov@google.com>
Cc: stfomichev@gmail.com, andrew@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, horms@kernel.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	sdf@fomichev.me, syzbot+45016fe295243a7882d3@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 6:13=E2=80=AFPM 'Kuniyuki Iwashima' via syzkaller-bu=
gs
<syzkaller-bugs@googlegroups.com> wrote:
>
> From: Stanislav Fomichev <stfomichev@gmail.com>
> Date: Mon, 7 Apr 2025 07:19:54 -0700
> > On 04/07, syzbot wrote:
> > > Hello,
> > >
> > > syzbot has tested the proposed patch but the reproducer is still trig=
gering an issue:
> > > unregister_netdevice: waiting for DEV to become free
> > >
> > > unregister_netdevice: waiting for batadv0 to become free. Usage count=
 =3D 3
> >
> > So it does fix the lock unbalance issue, but now there is a hang?
>
> I think this is an orthogonal issue.
>
> I saw this in another report as well.
> https://lore.kernel.org/netdev/67f208ea.050a0220.0a13.025b.GAE@google.com=
/
>
> syzbot may want to find a better way to filter this kind of noise.
>

Syzbot treats this message as a problem worthy of reporting since a
long time (Cc'd Dmitry who may remember the context):
https://github.com/google/syzkaller/commit/7a67784ca8bdc3b26cce2f0ec9a40d2d=
d9ec9396

Since v6.15-rc1, we do observe it happen at least 10x more often than
before, both during fuzzing and while processing #syz test commands:
https://syzkaller.appspot.com/bug?extid=3D881d65229ca4f9ae8c84

--=20
Aleksandr
