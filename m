Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1A5263F59
	for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 21:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743025416; cv=none; b=ubDD44DHFrlBS010f9zph6r/8yDkbMZRD02lwD6p09FjnRFVNAbZQotsiPm7e17nAoM1fHusHnstwBMXJVQ7jxGI0YnbMg2ppiUZ9smSdAra3DyAKUI/8MRkrxdAE/rP2SipflgQuawS/HjXr3yoXmNzOPZWupW8BHhIkgZgM6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743025416; c=relaxed/simple;
	bh=OsP7wE2EtJcuyDUU3LnpDBMfiZeaPmZK7m+jKaBQfKs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Gi4g5jd7cr7zB9eg8hj62G4fnmncro2Zv6MbYbC/PYwtOW/jg6A3IOQhXCtv4003qQ3U4y1U7dhgF9bLJifHlQeJzc47yGc5eQ5ikzhgD5q0m+R/WgfGhrxOwAv1KyN/vWITn4c0OFW0FcKrbhRr1myHUVx7zL83wqT+mtRtP04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RJOYoObM; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TPKQaMF3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RJOYoObM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TPKQaMF3"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743025412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TGXt0FaS0lGjt19aTsHqtHOk4mXbjNvWVmWotjvykLk=;
	b=RJOYoObMu8fSitUel2NLJyxLfe0N63Y5DUEO6GPjCVFI/9vtfTtfjA/eKWlv85Dt1dJD2n
	3EXqJBhHnoZif60dak4P3QXpFCJBsrYjB+Ul4H5ZRixDn/PmGZVMvQlamjvgLN8DkKCWRQ
	/xT7F/BCpvJXLx8xPLcahdDUwrUp2P1M2bYyvYKjlkmyn8SY+manYY9NJc/OXcdCNRm8Aa
	dmu+pGToYLxNG6KEJgVbDmgDvho9ei3yf2tgfey/SssaXQrZFnJIU9wWjlyFr2som8+EqI
	QwhVl/njee41IMaoCWCGN7UeRihefX0OgFmIwC5qEADWacH/lsjsi+XWeUehhA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743025412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TGXt0FaS0lGjt19aTsHqtHOk4mXbjNvWVmWotjvykLk=;
	b=TPKQaMF3z2Wp8HAaVWs66hsHnJuNUKtO3CejDr10QD7CSfjPk6HSGEQfFX+SS9xRa6OoNx
	UJ64xVefSC+05/CA==
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org, Eric Dumazet
 <edumazet@google.com>, Benjamin Segall <bsegall@google.com>, Frederic
 Weisbecker <frederic@kernel.org>
Subject: Re: [tip:timers/core] [posix]  1535cb8028:
 stress-ng.epoll.ops_per_sec 36.2% regression
In-Reply-To: <6sn76aya225pqikijue5uv5h3lyqk262hc6ru3vemn7xofdftd@sw7gith52xh7>
References: <202503241406.5c9cb80a-lkp@intel.com> <87pli4z02w.ffs@tglx>
 <6sn76aya225pqikijue5uv5h3lyqk262hc6ru3vemn7xofdftd@sw7gith52xh7>
Date: Wed, 26 Mar 2025 22:43:32 +0100
Message-ID: <87cye3zcvv.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26 2025 at 22:11, Mateusz Guzik wrote:
> On Wed, Mar 26, 2025 at 09:07:51AM +0100, Thomas Gleixner wrote:
>> How on earth can this commit result in both a 36% regression and a 25%
>> improvement with the same test?
>>=20
>> Unfortunately I can't reproduce any of it. I checked the epoll test
>> source and it uses a posix timer, but that commit makes the hash less
>> contended so there is zero explanation.
>>=20
>
> The short summary is:
> 1. your change is fine
> 2. stress-ng is doing seriously weird stuff here resulting in the above
> 3. there may or may not be something the scheduler can do to help
>
> for the regression stats are saying:
> feb864ee99a2d8a2 1535cb80286e6fbc834f075039f
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>       5.97 =C2=B1 56%     +35.8       41.74 =C2=B1 24%  mpstat.cpu.all.id=
le%
>       0.86 =C2=B1  3%      -0.3        0.51 =C2=B1 11%  mpstat.cpu.all.ir=
q%
>       0.10 =C2=B1  3%      +2.0        2.11 =C2=B1 13%  mpstat.cpu.all.so=
ft%
>      92.01 =C2=B1  3%     -37.7       54.27 =C2=B1 18%  mpstat.cpu.all.sy=
s%
>       1.06 =C2=B1  3%      +0.3        1.37 =C2=B1  8%  mpstat.cpu.all.us=
r%
>      27.83 =C2=B1 38%     -84.4%       4.33 =C2=B1 31%  mpstat.max_utiliz=
ation.seconds
>
> As in system time went down and idle went up.
>
> Your patch must have a side effect where it messes with some of the
> timings between workers.

It does as it removes the global lock and the potential contention on
it.

> The testcase is doing a lot of weird stuff, including calling yield()
> for every loop iteration. On top of that if the other worker does not
> win the race there is also a sleep of 0.1s thrown in. I commented these
> suckers out and weird anomalies persisted.
>
> All that said, I'm not going to further look into it. Was curious wtf
> though hence the write up.

Thak you for taking the time and looking into this. The analysis of this
"benchmark" is a fun read and I agree that it matches my impression of
looking into the source of this thing that it does weird stuff, which
does not make any sense at all.

Thanks,

        tglx
