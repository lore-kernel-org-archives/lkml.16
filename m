Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C551C19994F
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751263328; cv=none; b=Fkl0fC5mhGF6jI65bXG6M/e6+4R2TITFrzwa6rAZhepKEL2keMFr72sYxVgfHyZv3C7uV8D9aZtgbWMCxBlA+LN5IOPPM1zp0l/WN5/JRmTM0pYDES2jHxpfTDYboBwHkmfLNoG3RKOyb68JSDtmM0l197vCcLogqE58shMc9c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751263328; c=relaxed/simple;
	bh=ScDCbKztzH2ieoL0iYBisn4tcvXqoUj0at/V2ZcR/hs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F4VlKC8tQ2cjMCut1V3xk6CzAFzoCB2UF6eOMIyssJu9VaBwMGvarO4Mi6UKjsCzpUaQFIEhD/utYMLulYGty0d+eq0WIlr/+lWpWhWW837sdX2TDOx2sc6rRTizs389bvPChRh8konMY7um06lPqY5tCIw6kVT0pPsN2jfOoMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=s/oYlGrY; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="s/oYlGrY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ScDCbKztzH2ieoL0iYBisn4tcvXqoUj0at/V2ZcR/hs=; b=s/oYlGrYtA50WXtmY+kFnu5Nar
	adXXK0i8EmAqwVST3UnUSn5F42euQlOzRHLqNe2/PRTxYtnCVQsl4LZihCt7oI0Ie2dlw68zs01eh
	rXG+QFkGZCrEhuXe05YiqyjjEmHwyq5u2TNN8ZcpVKNQ9bsiA2C5QumhyuChyp6NFIaA4cjsEEQZB
	v6S1OYPbofD0al4q+DipoAxhS8jgM9iIkTu0gDz04eO61K9p3YFWQQYDksdAALsw9gJfhgzgctLhv
	wetPehFqBphC9PvSJzvc/Jm2QQt10SCepgzIig5XKKli2B43UAE6CsBYqzVwPrDQuE34X4YXuy7lo
	wDs1nhoA==;
Received: from [178.38.100.64] (helo=[10.10.1.179])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1uW7aH-005wxd-3u; Mon, 30 Jun 2025 07:01:42 +0100
Message-ID: <df7cb41da58dc80e2b293ab93fbaca6a9eab9a26.camel@codethink.co.uk>
Subject: Re: [PATCH 0/5] sched/deadline: Fix GRUB accounting
From: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
To: Juri Lelli <juri.lelli@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann	 <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall	 <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider	 <vschneid@redhat.com>, Waiman
 Long <llong@redhat.com>
Cc: linux-kernel@vger.kernel.org, Luca Abeni <luca.abeni@santannapisa.it>
Date: Mon, 30 Jun 2025 08:01:41 +0200
In-Reply-To: <20250627115118.438797-1-juri.lelli@redhat.com>
References: <20250627115118.438797-1-juri.lelli@redhat.com>
Organization: Codethink
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Sender: marcel.ziswiler@codethink.co.uk

Hi Juri

On Fri, 2025-06-27 at 13:51 +0200, Juri Lelli wrote:
> Hi All,
>=20
> This patch series addresses a significant regression observed in
> `SCHED_DEADLINE` performance, specifically when `SCHED_FLAG_RECLAIM`
> (Greedy Reclamation of Unused Bandwidth - GRUB) is enabled alongside
> overrunning jobs. This issue was reported by Marcel [1].
>=20
> Marcel's team extensive real-time scheduler (`SCHED_DEADLINE`) tests on
> mainline Linux kernels (amd64-based Intel NUCs and aarch64-based RADXA
> ROCK5Bs) typically show zero deadline misses for 5ms granularity tasks.
> However, with reclaim mode enabled and the same two overrunning jobs in
> the mix, they observed a dramatic increase in deadline misses: 43
> million on NUC and 600 thousand on ROCK55B. This highlights a critical
> accounting issue within `SCHED_DEADLINE` when reclaim is active.
>=20
> This series fixes the issue by doing the following.
>=20
> - 1/5: sched/deadline: Initialize dl_servers after SMP
> =C2=A0 Currently, `dl-servers` are initialized too early during boot, bef=
ore
> =C2=A0 all CPUs are online. This results in an incorrect calculation of
> =C2=A0 per-runqueue `DEADLINE` variables, such as `extra_bw`, which rely =
on a
> =C2=A0 stable CPU count. This patch moves the `dl-server` initialization =
to a
> =C2=A0 later stage, after SMP initialization, ensuring all CPUs are onlin=
e and
> =C2=A0 correct `extra_bw` values can be computed from the start.
>=20
> - 2/5: sched/deadline: Reset extra_bw to max_bw when clearing root domain=
s
> =C2=A0 The `dl_clear_root_domain()` function was found to not properly ac=
count
> =C2=A0 for the fact that per-runqueue `extra_bw` variables retained stale
> =C2=A0 values computed before root domain changes. This led to broken
> =C2=A0 accounting. This patch fixes the issue by resetting `extra_bw` to
> =C2=A0 `max_bw` before restoring `dl-server` contributions, ensuring a cl=
ean
> =C2=A0 state.
>=20
> - 3/5: sched/deadline: Fix accounting after global limits change
> =C2=A0 Changes to global `SCHED_DEADLINE` limits (handled by
> =C2=A0 `sched_rt_handler()` logic) were found to leave stale or incorrect
> =C2=A0 values in various accounting-related variables, including `extra_b=
w`.
> =C2=A0 This patch properly cleans up per-runqueue variables before implem=
enting
> =C2=A0 the global limit change and then rebuilds the scheduling domains. =
This
> =C2=A0 ensures that the accounting is correctly restored and maintained a=
fter
> =C2=A0 such global limit adjustments.
>=20
> - 4/5 and 5/5 are simple drgn scripts I put together to help debugging
> =C2=A0 this issue. I have the impression that they might be useful to hav=
e
> =C2=A0 around for the future.
>=20
> Please review and test.

Over the weekend I run 312 mio. test runs on NUC and 231 mio. on ROCK55B wi=
thout any single deadline misses.
Therefore,

for the whole series:

Tested-by: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk> # nuc & rock5b

Thanks!

> The set is also availabe at
>=20
> git@github.com:jlelli/linux.git upstream/fix-grub-tip
>=20
> 1 - https://lore.kernel.org/lkml/ce8469c4fb2f3e2ada74add22cce4bfe61fd5bab=
.camel@codethink.co.uk/
>=20
> Thanks,
> Juri
>=20
> Juri Lelli (5):
> =C2=A0 sched/deadline: Initialize dl_servers after SMP
> =C2=A0 sched/deadline: Reset extra_bw to max_bw when clearing root domain=
s
> =C2=A0 sched/deadline: Fix accounting after global limits change
> =C2=A0 tools/sched: Add root_domains_dump.py which dumps root domains inf=
o
> =C2=A0 tools/sched: Add dl_bw_dump.py for printing bandwidth accounting i=
nfo
>=20
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
> =C2=A0kernel/sched/core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
> =C2=A0kernel/sched/deadline.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 61 +++++++++++++++++++---------
> =C2=A0kernel/sched/rt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++
> =C2=A0kernel/sched/sched.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0tools/sched/dl_bw_dump.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 57 ++++++++++++++++++++++++++
> =C2=A0tools/sched/root_domains_dump.py | 68 +++++++++++++++++++++++++++++=
+++
> =C2=A07 files changed, 177 insertions(+), 19 deletions(-)
> =C2=A0create mode 100755 tools/sched/dl_bw_dump.py
> =C2=A0create mode 100755 tools/sched/root_domains_dump.py

Cheers

Marcel
