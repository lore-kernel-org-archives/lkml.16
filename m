Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2552153D3
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 21:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750108289; cv=none; b=CanqS9cDpjVFHHYsVTavx9se7oOmca8uly0dw0GdBW/hBlKZB/27MSpBPFTNJ3F2Xn+de40maOT2DKVA/oX8ivpWkq2QkmVwBhC9Kdy833/0Tg12IAJeDv5mppo/yWwx66HUtUCDTKjiVGQWslqn6WrUSyoeCWXSqVgsjkDk144=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750108289; c=relaxed/simple;
	bh=IgYPB6NSRiySo3tOXBpLXxIs1rnBT7hMzDeQePuqOK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q7sAYCrtQSX75irCELJGno7gVOrH+iV8+0xOSpnvxZ5KoN1hKL/xNeLHPJ1CIAMe989OuzlM6trhUYUwVekUQpwoUNQmVrqwSNBtS7ERZ/ty23dy1wxAyBRr8bvFDaavk4yk1mOBhHWlpDWysDRVwjW/Q5Fmtj6IFh0FT+EjTFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lNuHYmfv; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lNuHYmfv"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2348ac8e0b4so20385ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750108287; x=1750713087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzvFmHWfZ+bWAuTVcKtdw0qV+ufI/jqJ17BT4JBpweI=;
        b=lNuHYmfvfIo3qxvT1Pe4owENzg0v2AcCvpTwV8yaVXqa554R7utFF9eqTpTGovVv1e
         YTBRGQw5QTnHHQqlWj8u6XbCwGKvl214C0h+VBmdJiy03puWqm3RiXoin/yu5otQhmea
         bzonDmWiPsuER+su2wUUZa5wKAspwphLHxNiQcN7yprNM/RKQ7/8FHw5obtpR5IZAJ18
         Bs7OsRRkecXnLvfsFT4e9BNd69J+A/KBsAZ5PYM9vmHNmC/eU2LmVvk97+NbBmY9gqEb
         ixdisYCBzeudD/AG20l5BDXWe7TVxxk/7JeevdYN1xgoD5UIdwfMHMCXgBSUc+alJb2/
         qXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750108287; x=1750713087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LzvFmHWfZ+bWAuTVcKtdw0qV+ufI/jqJ17BT4JBpweI=;
        b=fOQ0h4RcnQ3rQcdHGtlrNBtV3HsVrWerOu0Pl6zU3+5hK2cCTc5l9CMhup2zjNLsxl
         qgu9iJU0AMspE78GtlLT4TRO1TZukgHiyTSoLYzICr676+N3buUxpZJAiuqgsmpYTCxI
         cIyeb+KWtz6+7QIYM/SrkPVxPlGGUJbhFfp5B3PCsHUTf7u7TX/EksBwZF6IYe3Aqcwq
         hq1m8CPCc16T3TFcP63PTG9VAWFLL0q5InRttIh8dGJp1CKOvcKzIqayxiEgtmIaPmOe
         7CkxsHZy+YxjQvfWGWNwrImrprhppT1mmf7AdcuawGMQIlnkgTfXKnzoCDTwm6dq7DAX
         kKfA==
X-Forwarded-Encrypted: i=1; AJvYcCV2bbetsw7lvJgEfBq48RD6K+L1gJfRZW4dTmXKzlHkMw+kbaG7N9o2m6il8MXR+2wT298BzwQSCrETzYg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt7tn8M9JIchTogVb5oVswvGyWOEhKI6TLaMKbE41N//Uk7Xzr
	JakyMF4SYwNjIlRIjded1XUPjVEZlsA8dNHmQmHKy1S+6j2flS+XnUuKNiuWkp/TT/V+TZPSx+x
	jn60CRCz+MhwArMePQFTJVaEKHkpQi3IwSaHVAhs+
X-Gm-Gg: ASbGncvW6u64BINVnPl1RIkD7noJkI0LqM48iItorMDBt5iSdlecDp52cPkUpsWL+aP
	ecyAbGiYJRebj02rZq/gWtGxrk88TA599ETVOgrhBhAC21P8ZSTpc4LxTj5QyaqunzMBazpJs8h
	bFqsSFftJri9gZNFEkr3bprJtvYDZEZAyMDC1XXG31Ux9h
X-Google-Smtp-Source: AGHT+IEYD9mjZhB+8kdOtsUeVNHAgHFECRq5REI45W+eZ0qjy9K8ihOl699135DPyu8F/uAp0DbHfoASyudXxJwDbRk=
X-Received: by 2002:a17:903:3b8f:b0:234:8eeb:d81a with SMTP id
 d9443c01a7336-2366c5cd450mr6187045ad.16.1750108286081; Mon, 16 Jun 2025
 14:11:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250615205914.835368-1-almasrymina@google.com> <c126182c-8f26-41e2-a20d-ceefc2ced886@kernel.org>
In-Reply-To: <c126182c-8f26-41e2-a20d-ceefc2ced886@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 16 Jun 2025 14:11:13 -0700
X-Gm-Features: AX0GCFtZMmk9CxeJgCCVOcm5DzBrlgdeP3SE9Biv6QMSHTkAiL4Vqg5o1bTfpyM
Message-ID: <CAHS8izPyzJvchqFNrRjY95D=41nya8Tmvx1eS9n0ijtHcUUETA@mail.gmail.com>
Subject: Re: [PATCH net-next v4] page_pool: import Jesper's page_pool benchmark
To: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>, 
	Ignat Korchagin <ignat@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 2:29=E2=80=AFAM Jesper Dangaard Brouer <hawk@kernel=
.org> wrote:
> On 15/06/2025 22.59, Mina Almasry wrote:
> > From: Jesper Dangaard Brouer <hawk@kernel.org>
> >
> > We frequently consult with Jesper's out-of-tree page_pool benchmark to
> > evaluate page_pool changes.
> >
> > Import the benchmark into the upstream linux kernel tree so that (a)
> > we're all running the same version, (b) pave the way for shared
> > improvements, and (c) maybe one day integrate it with nipa, if possible=
.
> >
> > Import bench_page_pool_simple from commit 35b1716d0c30 ("Add
> > page_bench06_walk_all"), from this repository:
> > https://github.com/netoptimizer/prototype-kernel.git
> >
> > Changes done during upstreaming:
> > - Fix checkpatch issues.
> > - Remove the tasklet logic not needed.
> > - Move under tools/testing
> > - Create ksft for the benchmark.
> > - Changed slightly how the benchmark gets build. Out of tree, time_benc=
h
> >    is built as an independent .ko. Here it is included in
> >    bench_page_pool.ko
> >
> > Steps to run:
> >
> > ```
> > mkdir -p /tmp/run-pp-bench
> > make -C ./tools/testing/selftests/net/bench
> > make -C ./tools/testing/selftests/net/bench install INSTALL_PATH=3D/tmp=
/run-pp-bench
> > rsync --delete -avz --progress /tmp/run-pp-bench mina@$SERVER:~/
> > ssh mina@$SERVER << EOF
> >    cd ~/run-pp-bench && sudo ./test_bench_page_pool.sh
> > EOF
> > ```
> >
> > Output:
> >
> > ```
> > (benchmrk dmesg logs)
> >
>
> Something is off with benchmark numbers compared to the OOT version.
>

I assume you're comparing my results (my kernel config + my hardware +
upstream benchmark) with your results (your kernel config + your
hardware + OOT version). The problem may be in OOT vs upstream but it
may be just different code/config/hardware.

> Adding my numbers below, they were run on my testlab with:
>   - CPU E5-1650 v4 @ 3.60GHz
>   - kernel: net.git v6.15-12438-gd9816ec74e6d
>
> > Fast path results:
> > no-softirq-page_pool01 Per elem: 11 cycles(tsc) 4.368 ns
> >
>
> Fast-path on your CPU is faster (22 cycles(tsc) 6.128 ns) than my CPU.
> What CPU is this?

My test setup is a Gcloud A3 VM (so virtualized). The CPU is:

cat /proc/cpuinfo
...
model name      : Intel(R) Xeon(R) Platinum 8481C CPU @ 2.70GHz

>
> Type:no-softirq-page_pool01 Per elem: 22 cycles(tsc) 6.128 ns (step:0)
>   - (measurement period time:0.061282924 sec time_interval:61282924)
>   - (invoke count:10000000 tsc_interval:220619745)
>
> > ptr_ring results:
> > no-softirq-page_pool02 Per elem: 527 cycles(tsc) 195.187 ns
>
> I'm surprised that ptr_ring benchmark is very slow, compared to my
> result (below) 60 cycles(tsc) 16.853 ns.
>
> Type:no-softirq-page_pool02 Per elem: 60 cycles(tsc) 16.853 ns (step:0)
>   - (measurement period time:0.168535760 sec time_interval:168535760)
>   - (invoke count:10000000 tsc_interval:606734160)
>
> Maybe your kernel is compiled with some CONFIG debug thing that makes it
> slower?
>

Yeah, I actually just checked and I have CONFIG_DEBUG_NET on in my
build, and a lot of other debug configs are turned on.

Let me investigate here. Maybe trimming the debug configs and double
checking my tree for debug logs I added would point to the difference.

I could also try to put both the OOT version and upstream version in
my tree and do a proper A/B comparison that way.

If you do get chance to run this upstream version from your exact tree
and config, that would be a good A/B comparison as well.

> You can troubleshoot like this:
>   - select the `no-softirq-page_pool02` test via run_flags=3D$((2#100)).
>
>   # perf record -g modprobe bench_page_pool_simple run_flags=3D$((2#100))
> loops=3D$((100*10**6))
>   # perf report --no-children
>

Thanks, will do.

--=20
Thanks,
Mina
