Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCBE233706
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 08:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749631411; cv=none; b=oRHfIbdRCSJrNDerOCRyf58yu+DVg5OsvEWMDAIYEWXnDmRhlo/riZ5KtfoVobHMXXCdwYKwtjixy40U1fWYJg8mAFNAdoD2Ek814P2n7q4vYNl4C6RS6ujbfNCiV+0M+4YoU3LI0moGsEgno7wn/vh5btvUwTqCUmbGbEQEPuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749631411; c=relaxed/simple;
	bh=5kGrQ+ifJCYTeQpYjb/8/PhswHaott8cs4tOaCvg9Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPVAnHm4Msg9Xd3F7cRcUxUl3Q75OlyzQ3baCfzjwpTrsGHfX9B76UYz4qHJmMi4VuFKQwyk8iyz+2iO//dYL0UEL16NEaPWf4b5kjpySH4ItSUv2xV1/nKbtSZzApIlxrCWT2PLv314YriFNvITGlH58clhejCHV9USEKG+Q64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fpmaOxDN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uqz1ljZy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fpmaOxDN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uqz1ljZy"
Date: Wed, 11 Jun 2025 10:43:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749631408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tIbvNQzuAlh0KklPDYVIJHHOqTiIbuj6wtKKXEIKHJA=;
	b=fpmaOxDNiJlDuQaG76ZZACMo6TSQMv5nQRrWn541hmOQu/F18qSARRRdwEYOHeEVSLcfyz
	3SABtxmCxBI72OtPzoUP56b+uX9BhDUwlm5SLCxKSDJQRY6Kb+PRjsWNhQeR5EzcrCbSra
	XduzCvOfiFqYVLvXsRisUcaDnNmch1XKpG1r6dNmwhRyeZKGKkCKqh8Lbt4rcMuMS8m5L8
	lDMQuEG+81Jm8PL4Hv45+WivR5FstVS4csKew9TCH7xhqGkIxowBUJErXZJcqHyilh4KQB
	E5F2xjFj4e8Fr7aR/7QcnXoXh/RQ9RAPCx3+YhrEHcA5k2oStTg2tgTWfCVWmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749631408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tIbvNQzuAlh0KklPDYVIJHHOqTiIbuj6wtKKXEIKHJA=;
	b=uqz1ljZy5d8Ma59U9UhB6sjWF0Z5fMLIDw5qZssjV2knrdTjX1II2DS4RsUyAwx4cbo1pc
	dJduOvk9dlG3zQAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 1/1 fyi] tools headers UAPI: Sync linux/prctl.h with the
 kernel sources to pick FUTEX knob
Message-ID: <20250611084326.X-sUHsGX@linutronix.de>
References: <aEiYOtKkrVDT03hZ@x1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aEiYOtKkrVDT03hZ@x1>

On 2025-06-10 17:40:26 [-0300], Arnaldo Carvalho de Melo wrote:
> tldr; Just FYI, I'm carrying this on the perf tools tree.

Thank you.

>   $ tools/perf/trace/beauty/prctl_option.sh > before
>   $ cp include/uapi/linux/prctl.h tools/perf/trace/beauty/include/uapi/li=
nux/prctl.h
>   $ tools/perf/trace/beauty/prctl_option.sh > after

Ah. I missed that copy of prctl.h

=E2=80=A6
> This addresses this perf build warning:
>=20
>   Warning: Kernel ABI header differences:
>     diff -u tools/include/uapi/linux/prctl.h include/uapi/linux/prctl.h

But I did cover this one.

Sebastian
