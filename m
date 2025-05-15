Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED67198823
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 22:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747347897; cv=none; b=Z+nQ84a+E+R+O5kh1Et1ucAj/d9oBbNMqaBwTtvlYiSzbuSEu8Im8WyQtybzheaQFFQS5L3+kOIhm5wfCab1STIhIFfBhV2s+M5GCe9sUC7Vv+qFpOJuGkO7KlKtFh3RK19G2fXLZCPXqke66FYtAwjHsGvTowUwT6j/cEZ4oIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747347897; c=relaxed/simple;
	bh=TLJPHWe7UMhZiT0n6XrFXrKP5yl9e1QIEBFASh6EgA4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nrvHZ71OMwI+m5okp2wKPMWx6P4EIEtFlezd7syCqcw/BTSoci4UCPbaSev6aMhVNl3ChMes2Xjulp+EJSCDnTP/+qpgSWw2swUR8i351FrHW63T/iom6To8OYysxCPtMaiqzB2HSXgDw/DPd98liH/3w5r9EDpMHza9u6s0sA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Q7tYoI7u; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qH29ssUe; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Q7tYoI7u";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qH29ssUe"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747347893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DPAUpnXzVSfXtutaNaPrgF9RzAR06Xkkh91/D39/wUo=;
	b=Q7tYoI7uB3pGBbzyOh8tk85JGkzVS3bmjfAeErXUA2LtVuanRiejE+cPm2BEJDokoexn1x
	szDuBIz6DCQcjdbR2mCYAuoH6X95dXykDfoJUpXXBYPHrAY5SgS2FLNr5YrQSuJmQxpUki
	mdzB5Plu5DunZCt2laSCRRDmb86Z3Lo0AyEL/VO078AnnGRJi1qWXNcqCbCy0FBXEJ5TH0
	tdi1WI2JUtMsBKeWBwKpvwCGomYfqHs/BApSmJurD355+jRdIi34IHMj2Er7AhgIFnFPzN
	ja+hyWuHFjxiUXVElQV+AFY9XufXZM+N2CcgL93vjlmyCGLduqPSQVwbvav29A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747347893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DPAUpnXzVSfXtutaNaPrgF9RzAR06Xkkh91/D39/wUo=;
	b=qH29ssUe8lxuwc2zkh0RPjZDmeXKA1leu3D4amLJvvyR2IYyNc8GbMl9O1LF2dyTQM+plV
	kdavssER1wB1HbCA==
To: Brian Norris <briannorris@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Tsai Sung-Fu
 <danielsftsai@google.com>, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/2] genirq: Add kunit tests for depth counts
In-Reply-To: <aCYit48N85WpjmiN@google.com>
References: <20250514201353.3481400-3-briannorris@chromium.org>
 <202505152136.y04AHovS-lkp@intel.com> <aCYit48N85WpjmiN@google.com>
Date: Fri, 16 May 2025 00:24:52 +0200
Message-ID: <87ldqxikaz.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, May 15 2025 at 10:21, Brian Norris wrote:
> On Thu, May 15, 2025 at 10:01:18PM +0800, kernel test robot wrote:
>> patch link:    https://lore.kernel.org/r/20250514201353.3481400-3-briannorris%40chromium.org
>> patch subject: [PATCH v2 2/2] genirq: Add kunit tests for depth counts
>
> First of all, thanks for the help, and for applying patch 1. I see that:
> 1) this bot noticed a trivial problem with patch 2; and
> 2) I received notification that patch 2 was applied to tip/irq/core, but
> 3) I can't find it there any more.
>
> I'm not sure if #3 is because you dropped it (e.g., due to #1's report)
> or some other reason, so I'm not sure what to do next. Possibilities:

#3 because I dropped it.

> (a) send the trivial fix separately, as a fixup (against what tree?)
> (b) resend an improved patch 2 on its own, against tip/irq/core
> (c) just drop it, because you have deeper reasons to not want these
>     tests.

#b please

Thanks,

        tglx
