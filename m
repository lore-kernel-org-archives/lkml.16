Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2051821D3C0
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 01:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748483606; cv=none; b=k/HpP0lXhhUgNdYheSZg0PMzfQ1EDSKeljEFiXaOJkmBzS2bxXvssjK4QXNS01KNZ4Wu5Q5sqP1Bqf4ATwHYe1B8/hDGwWLoDxub3SEq3KO7oWAbm79Nqav0q21dm2un29SehXzWSEVLJ8Vv6QzVm4b/K8smiUaSOEmcs5M4vfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748483606; c=relaxed/simple;
	bh=rJbOnLrons4tTuN78stT1ORqO5zSyyGsE+esZxR3PBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZByVT7BjMG6IuLfuDrNbEcb99IIhURIddseoS8a1c8a3hLb08btSLEV9t5bgtLZgInK42Z5XI9dzaEGUIMvqXv5CD3t9Q4InUAt7ScFF2ZIn7nPG+Ee/bLO/CNKf1oaghUB7jZY1LjsVwXs/uPzHlo6+8eNdiDK9g+pBD5/v2r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xLH9qh6W; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xLH9qh6W"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3dd89910484so15ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 18:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748483602; x=1749088402; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rK28GjLplaS1k6sqbBmLq7Kl/oZsU4xMjKQXJ8HS3rA=;
        b=xLH9qh6Wzyel+Qcwg7oraOeFJvWcjbp2sDQo3q+QMvOdqB5Is/qIbwKEdx62m17kcB
         NDcN1BJVn4c6RojJriZALkozb3UabYmyqbER7XNquDEDzF484+6rhfTtJX694bibKxLw
         oEefb6zx8WJ/ViWFjMUgCf8tdjOtVITIs9nq+YeBiNGZAuIO76FMS1bNHFc8+din55kJ
         7C5iGk5mTPOyH/t6M4NlhQLt5u1ekxUDgoMDVye1wgcTp7T1USKQpG9vPGOQ0NP5tjmU
         9N1+PaYxLCNi3mN86gip2sIg0kQLF/Cq2QYqIOUzuAU3nD66n7EY21Q+eHYNpSyy3ifn
         bW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748483602; x=1749088402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rK28GjLplaS1k6sqbBmLq7Kl/oZsU4xMjKQXJ8HS3rA=;
        b=itWH7qxGPH7bkTOyY3CeIqc7O8NJaRWZ+3ae+W/gwB02zo5fDLgY7ue4Yd/Ux/GLGn
         N7r92UkdokplG9jIUxu14nXBSAzEZ6Zw0DetBfFnNLt+hSLrSl0YaoJ8knyJhEeCVivr
         VaGuQkJ6Ns2dtZeoXNz0auoGp6jxbnqmYq0f3OP/GK6NrvwcY2nvj0VJEa00BUfp+vMB
         89g3qKZY9DGwxrETrkiMi4rpgwUZJEpJfXmtQj8BSRV+u9FWByCCKJAlfTtppjT5n9Bl
         H6df1hS3tujU+kRNwNbYjGb4powHzPPZM0otKF3yfaQRQwEsc9Dj+/OSiqyUI9xXTLaR
         zDrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+mo2UwGsgmP77asD2CrnfU7LgRNbRP/51Aj3sX7G8DFdCOII6XRLFCKpMXCXcNAl0HPg0VWSUBQ3CbEQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1u0N2l1bMruJztkZL87oAytzRxfu1g7Uncd+t97SsjQb5iH9F
	U6MxdHMlIrQ2v6r0jhFMaZ/jNsbws0bMIw2UTY4N0n/NMbvTTgDT8QZrtUOlf7Uacf3O7pZEM63
	hLPs5EgEZ0+XpPc2aVykAclLZRTxeAt1WKE9QBkso+wVDLIY7Uj0RURpWYY0=
X-Gm-Gg: ASbGncvnpamE6qpYBRFCjEbgrPUSSJ1VKklmi9/hKDafAOZmj/lXNYipMh/sn0UEB+y
	uvxYIWYoySHWtHfHmUVZj2XgA0n5Clv8knsrTyAeSNlKa8YFC5Irhgn2zgvspiJviVkNjht3YLf
	FGbX5/6XmaZWHQfBaOwuQWii9UKfN6XGaeBTf5UW0I5pE6EREuonvBM/1BNoadtk86oGFbJlMMT
	w==
X-Google-Smtp-Source: AGHT+IHvXpxdbsNsdSIj7f0krR3C592J4ox9Z6xPbGgTujvSL8gBecLol8wGmmUwIDp3VmUxXJZIQ9cqFHX68YMuAB0=
X-Received: by 2002:a05:6e02:17cb:b0:3d9:6c7a:2b37 with SMTP id
 e9e14a558f8ab-3dd943b659dmr165085ab.0.1748483600459; Wed, 28 May 2025
 18:53:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527091855.340837-1-yuyanghuang@google.com> <20250528154906.GD1484967@horms.kernel.org>
In-Reply-To: <20250528154906.GD1484967@horms.kernel.org>
From: Yuyang Huang <yuyanghuang@google.com>
Date: Thu, 29 May 2025 10:52:43 +0900
X-Gm-Features: AX0GCFuYgCNb70ORjeZSMAVUwUmRpmuC-GcYb2mnhAWrV6WRxyL5vLj9hHEg0Fc
Message-ID: <CADXeF1E7zuqpixcB+9j90d7tZhR5bsSsrniYD-BtpK8+uzA_Pw@mail.gmail.com>
Subject: Re: [PATCH net-next] selftest: Add selftest for multicast address notifications
To: Simon Horman <horms@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>, 
	Lorenzo Colitti <lorenzo@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon

>Other tests in this file seem to warn if the ip command is too old
>to support the test. Perhaps we can achieve that here something like this
>(completely untested!):

Thanks for the advice. I will modify the test to make sure it skips on
old iproute2 versions. I will send the patch after net-next reopens.

Thanks,

Yuyang


On Thu, May 29, 2025 at 12:49=E2=80=AFAM Simon Horman <horms@kernel.org> wr=
ote:
>
> On Tue, May 27, 2025 at 06:18:55PM +0900, Yuyang Huang wrote:
> > This commit adds a new kernel selftest to verify RTNLGRP_IPV4_MCADDR
> > and RTNLGRP_IPV6_MCADDR notifications. The test works by adding and
> > removing a dummy interface and then confirming that the system
> > correctly receives join and removal notifications for the 224.0.0.1
> > and ff02::1 multicast addresses.
> >
> > The test relies on the iproute2 version to be 6.13+.
> >
> > Tested by the following command:
> > $ vng -v --user root --cpus 16 -- \
> > make -C tools/testing/selftests TARGETS=3Dnet TEST_PROGS=3Drtnetlink.sh=
 \
> > TEST_GEN_PROGS=3D"" run_tests
> >
> > Cc: Maciej =C5=BBenczykowski <maze@google.com>
> > Cc: Lorenzo Colitti <lorenzo@google.com>
> > Signed-off-by: Yuyang Huang <yuyanghuang@google.com>
>
> ...
>
> > +kci_test_mcast_addr_notification()
> > +{
> > +     local tmpfile
> > +     local monitor_pid
> > +     local match_result
> > +
> > +     tmpfile=3D$(mktemp)
> > +
> > +     ip monitor maddr > $tmpfile &
> > +     monitor_pid=3D$!
>
> Hi Yuyang Huang,
>
> Other tests in this file seem to warn if the ip command is too old
> to support the test. Perhaps we can achieve that here something like this
> (completely untested!):
>
>         if [ ! -e "/proc/$monitor_pid" ]; then
>                 end_test "SKIP: mcast addr notification: iproute2 too old=
"
>                 rm $tmpfile
>                 return $ksft_skip
>         fi
>
> > +     sleep 1
> > +
> > +     run_cmd ip link add name test-dummy1 type dummy
> > +     run_cmd ip link set test-dummy1 up
> > +     run_cmd ip link del dev test-dummy1
> > +     sleep 1
> > +
> > +     match_result=3D$(grep -cE "test-dummy1.*(224.0.0.1|ff02::1)" $tmp=
file)
> > +
> > +     kill $monitor_pid
> > +     rm $tmpfile
> > +     # There should be 4 line matches as follows.
> > +     # 13: test-dummy1    inet6 mcast ff02::1 scope global
> > +     # 13: test-dummy1    inet mcast 224.0.0.1 scope global
> > +     # Deleted 13: test-dummy1    inet mcast 224.0.0.1 scope global
> > +     # Deleted 13: test-dummy1    inet6 mcast ff02::1 scope global
> > +     if [ $match_result -ne 4 ];then
> > +             end_test "FAIL: mcast addr notification"
> > +             return 1
> > +     fi
> > +     end_test "PASS: mcast addr notification"
> > +}
> > +
>
> ...
>
> ## Form letter - net-next-closed
>
> The merge window for v6.16 has begun and therefore net-next is closed
> for new drivers, features, code refactoring and optimizations. We are
> currently accepting bug fixes only.
>
> Please repost when net-next reopens after June 8th.
>
> RFC patches sent for review only are obviously welcome at any time.
>
> pw-bot: deffer
