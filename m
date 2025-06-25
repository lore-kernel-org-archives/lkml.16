Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D758F4A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 19:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750880727; cv=none; b=MQbZk73qQRRQ/CqU+4TtaBMHuWJKxLCmTdSFWlKSzA6UK+RFiXs/BZtyhTng23Hd+yu/ncaeXzbOpEQXmykTokI57oIgSl+tSwi+SZI2RoelfbYx70ABYKE6zQCVrAZsZF/5i67I0Lmm9zNf6CwAxttAzBJKQYOwj+6eL4sN+uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750880727; c=relaxed/simple;
	bh=w6SpGrYkhTVKpUDJKF5VkJGZ/CdHYl4z8SYk18rbbns=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fVnsYvUqryTDk4K1RplY0v/PExrQhTaOMCqCZdwM6Rq6QKzt3wB320VuBKEhAhk1p08XvmKLfg8+TTa5smrX0T5N1H/1Q/Ije1z2vfcdWAC9DoP+rsuboITKSg4PmNOlLHL04bx7wUGLCsFzFYwsOVRpbW55fk/4rZtmFuv64ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gianis.ca; spf=pass smtp.mailfrom=gianis.ca; dkim=pass (2048-bit key) header.d=gianis.ca header.i=@gianis.ca header.b=fpXDx90A; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gianis.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gianis.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gianis.ca header.i=@gianis.ca header.b="fpXDx90A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gianis.ca;
	s=protonmail; t=1750880711; x=1751139911;
	bh=XYOVBScNatvLSFmdY2zfe/+Mewb8QtadPWut8agQSwk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=fpXDx90AG+f8k7afpvIb5XjFo5l6/3yEyqmFLnBMF7XYLJ9oUtsoOf67/bIgXW9Cy
	 7Ht07mwM3dy0lEBRCMp//3BdKNKAmLg7X1Gei1O/4OcIaiAEhHwqfQXOmpxaSVhKwW
	 ddeIOLV2RBum2cD6bcQGRITxPwx/0b/J6Cqzyk//MGEntyKQl2hJ6cTAl8aL21If6P
	 kPHtyQ1moPXtx9u6zh/2llLb0LvHPbtvmd38g8rBK8Wf+DPppbaFA2t/Ve1836T0Ea
	 C16DtrWOhK/HWoqIxi7Z926XkINQoqcMBhrZ1egD85tmpudSlBSxLacyq251NLxmaF
	 Z/DMa7D6YdKrA==
Date: Wed, 25 Jun 2025 19:45:07 +0000
To: Peter Zijlstra <peterz@infradead.org>
From: Dhaval Giani <dhaval@gianis.ca>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] sched/fair: Manage lag and run to parity with different slices
Message-ID: <aFxRupnVWaGMBHYE@172-0-28-123.lightspeed.nsvltn.sbcglobal.net>
In-Reply-To: <20250617092208.GQ1613376@noisy.programming.kicks-ass.net>
References: <20250613140514.2781138-1-vincent.guittot@linaro.org> <20250617092208.GQ1613376@noisy.programming.kicks-ass.net>
Feedback-ID: 128275035:user:proton
X-Pm-Message-ID: 61805f64f6f034ef3ad25a87cb61095af8c10c0b
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 11:22:08AM +0200, Peter Zijlstra wrote:
> On Fri, Jun 13, 2025 at 04:05:10PM +0200, Vincent Guittot wrote:
> > Vincent Guittot (3):
> >   sched/fair: Use protect_slice() instead of direct comparison
> >   sched/fair: Limit run to parity to the min slice of enqueued entities
> >   sched/fair: Improve NO_RUN_TO_PARITY
>=20
> Ah. I wrote these here patches and then totally forgot about them :/.
> They take a different approach.
>=20

Mind sticking them on a git tree somewhere please?

Dhaval


