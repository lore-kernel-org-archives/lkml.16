Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD08D3085DF
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 23:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750290941; cv=none; b=DecX0Vj7Txvl5k1SyA/rYwdBfXUR4GZix5AFHlLw9kSRgohJrK/qxhM6/v2PM1XN9IcpvAhqUHyLcWaTgnGZIN3BEavkSHwUw+If7w7aciC4i87FlmrEz34++J2CooKPnXRnSzo2Qt4yVZjfIOUvfuXBKFyx8uATv5kwCae3rJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750290941; c=relaxed/simple;
	bh=jXiE9rzeNs/RRjF+fEh/djBAzoD6GL5vfoqjbMTJVtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aatw7Qx59G3LYMuZCZhgxbRlvrxcEu2TbZUPrIi00yhVdSEoxqwo0wDTQ8Idl8Z8EjwpWhAmACjFTk8IuX7sNdwKxqC/q9c+uSn+9DcqsE96eeTChqcOwsbTtVXlBFWoYVz5T9ez2dBFAS81rPWzUtnQn7KxwEQMoMwNnw9eV5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=epLsLDBb; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="epLsLDBb"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3ddc7905075so05ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 16:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750290939; x=1750895739; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhvnUJBdUC24eZOisoPiZwhVd/LIwB2bYvJ6RT4qk7Y=;
        b=epLsLDBbkmHP5kptTc0JsZlOWw5LmHVUQmlaOnYKZgkwi8aq9NDDJaYJBPxB4bUhp0
         SIdzS1haD9EBI8ud71RIm1LIx4NgaT+yM3COPyw+mpvzZp2VZF+dXEhTmiTcbbjlFl6K
         NjLajHkgthw2JUgCPzsO5LDKcDHXH+IuhOKzCdv0iz+u6U4QsP/XmILQcc56g25qesah
         esSfc+lG8Licz36wDKwkxhMbOsh/o3waZ+vQGGyokI1ii9TqFDWcabIwbXAG+JT02MHT
         a5FKqdKLZacGuYGWl6tA+Wdql/PRxTBJKghz7P55Vs/Zji5F1OdqlxpJuWXA43fnolPf
         MkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750290939; x=1750895739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhvnUJBdUC24eZOisoPiZwhVd/LIwB2bYvJ6RT4qk7Y=;
        b=VkslsCBfel7rUNhLPXLxSOKmof7bSDzrFPsFbx7F1NDuGt1YvqxKusEHgETbERWfbi
         7e95mdHHMqmCqSUYMLxKD5dAByBRXf2yHe5URvEZvn1tXYUxkvsbk7iiRKKWHBxhFfN3
         qI5DxxqPiVrb8o9mJbbZXvc7VqI3/LdPAXXXqvGO7X+vd5MLlPg14wtKsxHfna5Tc0ew
         mg4WVXb1R4YkaUCU0tFRhhF8in0bvKTmIgWU/9Gj8b8k33OW7B/T8y0eSYmVS/NUTWAA
         3atbhak49URhUMwPs0oX/Cu3fFnD0BWsfoU7iPJrLEOKy7ECV1fUmDsEsBvLIEzA4wZL
         /nuw==
X-Forwarded-Encrypted: i=1; AJvYcCVy1ReAqQRsXQ3VsZIExdaGwVIz5FxAbmVgukWmfF+r3QAbBHHVnYBwD8ylH9NaOvXnPMcQ7KpljsfZvDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YznjA7Gq8VutWRSBTm8Ft5LymoRO/bVUiisFMvCq6QDkAYuYegu
	KQoJ+EHTr6wgmPdAkIJJLVzKIe0jaPuNDvPKoRDKTDwjb+7QDpXPNSLYVY5zZu9VmkEl32Uv9YR
	9z5lW32cYQONraBVjGtCoBYT3q4FwQ0dz43Aq6X63w2PID40jFX/4IcV/
X-Gm-Gg: ASbGncvpQuvdPvW4TTT0vVJknMvFfoo0OYjLffIUGKXjDTSiHEAxChB5z0DkI0Oz/WK
	+UjM35bHO/AWw38HLZSbEfeWmGzKdrbopNlAXaH+2FQWsKd92PUizeye3JM6JhwlhX1KqLk25tv
	e0OV3K8adKcpvraRfm3GTrZyymqeUss6diKhTjNkLme53OTRRviujjaLFecIciXj27WrKgU8u+n
	Zdu
X-Google-Smtp-Source: AGHT+IEAj3oIerZ8VMhDsBvB9jTtKhynwQ/opLvvI7poEt160ct1eaw1qJ+tjnjOnXuXTGGXuUfKXdzM8SueivuxuaI=
X-Received: by 2002:a05:6e02:4507:20b0:3d9:3ee7:a75b with SMTP id
 e9e14a558f8ab-3de304f2062mr903775ab.1.1750290938367; Wed, 18 Jun 2025
 16:55:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618104025.3463656-1-yuyanghuang@google.com> <20250618182029.GV1699@horms.kernel.org>
In-Reply-To: <20250618182029.GV1699@horms.kernel.org>
From: Yuyang Huang <yuyanghuang@google.com>
Date: Thu, 19 Jun 2025 08:55:01 +0900
X-Gm-Features: Ac12FXz88D2o7FcO2slqJtiNgJD5NxCpvCi7fsUGH4HLmFCQnQ7_XC7-NAVyGH8
Message-ID: <CADXeF1F6q5NfboqbnoGJPFf9C1x3-v2OkspKqYhnFOVL2=1vdg@mail.gmail.com>
Subject: Re: [PATCH net-next] selftest: add selftest for anycast notifications
To: Simon Horman <horms@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review feedback, I will move the clean up to a seaparte patc=
h.

On Thu, Jun 19, 2025 at 3:20=E2=80=AFAM Simon Horman <horms@kernel.org> wro=
te:
>
> On Wed, Jun 18, 2025 at 07:40:25PM +0900, Yuyang Huang wrote:
> > This commit adds a new kernel selftest to verify RTNLGRP_IPV6_ACADDR
> > notifications. The test works by adding/removing a dummy interface,
> > enabling packet forwarding, and then confirming that user space can
> > correctly receive anycast notifications.
> >
> > The test relies on the iproute2 version to be 6.13+.
> >
> > Tested by the following command:
> > $ vng -v --user root --cpus 16 -- \
> > make -C tools/testing/selftests TARGETS=3Dnet
> > TEST_PROGS=3Drtnetlink_notification.sh \
> > TEST_GEN_PROGS=3D"" run_tests
> >
> > Signed-off-by: Yuyang Huang <yuyanghuang@google.com>
> > ---
> >  .../selftests/net/rtnetlink_notification.sh   | 52 +++++++++++++++++--
> >  1 file changed, 47 insertions(+), 5 deletions(-)
> >
> > diff --git a/tools/testing/selftests/net/rtnetlink_notification.sh b/to=
ols/testing/selftests/net/rtnetlink_notification.sh
>
> ...
>
> > @@ -18,12 +20,11 @@ kci_test_mcast_addr_notification()
> >       local tmpfile
> >       local monitor_pid
> >       local match_result
> > -     local test_dev=3D"test-dummy1"
> >
> >       tmpfile=3D$(mktemp)
> >       defer rm "$tmpfile"
> >
> > -     ip monitor maddr > $tmpfile &
> > +     ip monitor maddr > "$tmpfile" &
> >       monitor_pid=3D$!
> >       defer kill_process "$monitor_pid"
> >
> > @@ -32,7 +33,7 @@ kci_test_mcast_addr_notification()
> >       if [ ! -e "/proc/$monitor_pid" ]; then
> >               RET=3D$ksft_skip
> >               log_test "mcast addr notification: iproute2 too old"
> > -             return $RET
> > +             return "$RET"
> >       fi
> >
> >       ip link add name "$test_dev" type dummy
>
> > @@ -53,7 +54,48 @@ kci_test_mcast_addr_notification()
> >               RET=3D$ksft_fail
> >       fi
> >       log_test "mcast addr notification: Expected 4 matches, got $match=
_result"
> > -     return $RET
> > +     return "$RET"
> > +}
>
> ...
>
> > @@ -67,4 +109,4 @@ require_command ip
> >
> >  tests_run
> >
> > -exit $EXIT_STATUS
> > +exit "$EXIT_STATUS"
>
> Hi,
>
> While I like the changes above (that I haven't trimmed-out)
> these seem to be clean-ups that aren't strictly related
> to the subject of this patch. IOW, they don't belong in this patch
> (but could be a separate patch).
>
> --
> pw-bot: changes-requested
