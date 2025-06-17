Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC231AA1DB
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171109; cv=none; b=Gg7wmHG293/tgD/j05MLK7GQJ1gax4YRsQR/K08Mv/DMDEG6qDICnz/nXoAlU+/8yOLj6gXvfOzjyYSM8/hWzWXdb+cagdi3eqaA//+yx35kycwbAnjCGMbP7bIv6jV1ZWxLuh1uRrxKqrb579dZvkOMlnt9llKhpj/JqZk7hcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171109; c=relaxed/simple;
	bh=qqBcutOWrUy2OBIvx4k6gFQSBfYCgp760gkiPso8wEo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ux88OecjHM2G8bZBlda72iT/O8IbvJXsK+micDttaYlQjS4Sbex8NsD7Sr9EIxvQKO0nOT1NgagF6Zgi0f/TfoATUHReR6Ajz89lBg75SmFDnDQdrzfbGF6vMR/Z1KRRQyY+BGCUKCM10zedGJqr7AgXZBps6E12nEKJ59GqaWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 98DF1B8DE2;
	Tue, 17 Jun 2025 14:38:24 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf05.hostedemail.com (Postfix) with ESMTPA id E3E4F2000E;
	Tue, 17 Jun 2025 14:38:21 +0000 (UTC)
Date: Tue, 17 Jun 2025 10:38:27 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Francesco Ansanelli <francians@gmail.com>
Cc: mingo@kernel.org, bigeasy@linutronix.de, dietmar.eggemann@arm.com,
 juri.lelli@redhat.com, linux-kernel@vger.kernel.org, mgorman@suse.de,
 peterz@infradead.org, sshegde@linux.ibm.com, tglx@linutronix.de,
 torvalds@linux-foundation.org, vincent.guittot@linaro.org,
 vschneid@redhat.com
Subject: Re: [PATCH 20/43] sched/smp: Make SMP unconditional
Message-ID: <20250617103827.25ee218e@gandalf.local.home>
In-Reply-To: <CAF0E3p61W1fs_t4-LX86HATHVy0+-+ru_3wfw3vE5t2HwuCTsQ@mail.gmail.com>
References: <CAF0E3p61W1fs_t4-LX86HATHVy0+-+ru_3wfw3vE5t2HwuCTsQ@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E3E4F2000E
X-Stat-Signature: rfaqi35b6qj71eqck7ce35uok9wajwar
X-Rspamd-Server: rspamout05
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+l7nNce2itAtT9CDF/sA1VTt0I3a2W5qY=
X-HE-Tag: 1750171101-207520
X-HE-Meta: U2FsdGVkX1+zpa7BTnIpwSzAcIchcIUvjFwIav0/Uw40P5HADM+sg+FcbDksftuPHwOY/WCVqFAQpkUtK7DDISdU0OsVTuq7ZdGtulKvDozHFbE2RKdReW0fp3hYB4t7cn2JNG07S2vaOZrqOuuXep0j+6bUvZBxfUcGQZotU/CYkD9rd8/0zpn1XwJ/DYtNAaqRhCpkek6JWKaTMjyLnznwQMnTjz6pu2bZ5iS+/LkbfEChyz0D0MnEwvn20HplpgeZsG8UJDL6kJLxhyZmEUUVgIu60JO4vwpwbXi6055ep7F23GVTe2qq6AKF8LgdhJ90UmepbpfHFDeHDfULnTxlsQkiaNbM

On Tue, 17 Jun 2025 06:43:00 +0200
Francesco Ansanelli <francians@gmail.com> wrote:

> I hope this is the right way of reaching you.
> I was reviewing the patch in subject and noticed a possible error:
> 
> -#if defined(CONFIG_RT_GROUP_SCHED) || (defined(CONFIG_FAIR_GROUP_SCHED) &&
> \
> - (defined(CONFIG_SMP) || defined(CONFIG_CFS_BANDWIDTH)))
> +#if defined(CONFIG_RT_GROUP_SCHED) || defined(CONFIG_FAIR_GROUP_SCHED)
> 
> I think it should be:
> 
> +#if defined(CONFIG_RT_GROUP_SCHED) || (defined(CONFIG_FAIR_GROUP_SCHED) &&
> defined(CONFIG_CFS_BANDWIDTH))

Nope, it was right as is. The "Make SMP unconditional" means CONFIG_SMP is
now always defined. The original was:

#if defined(CONFIG_RT_GROUP_SCHED) || (defined(CONFIG_FAIR_GROUP_SCHED) && \
 (defined(CONFIG_SMP) || defined(CONFIG_CFS_BANDWIDTH)))

With defined(CONFIG_SMP) always true, the:

  (defined(CONFIG_SMP) || defined(CONFIG_CFS_BANDWIDTH))

is always true as well, which makes it:

#if defined(CONFIG_RT_GROUP_SCHED) || (defined(CONFIG_FAIR_GROUP_SCHED) && (true))

Or just:

#if defined(CONFIG_RT_GROUP_SCHED) || defined(CONFIG_FAIR_GROUP_SCHED)

-- Steve


