Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664BE1C84A5
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 15:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750951360; cv=none; b=uyR37hTpMWkDQJoJGNDIEkO9T+9hCt4AQY6PS5qhx1aVYlnscnAWos6cXToCK1ht9nYAybrB7Ckr3BU3nsYKdPfWnHRUngxBGYbYo8zV+xz/BK6bIaF5XyF0+HDihojXh2T29pVNxE1eQ7IRy2DG5DdBoaBa9EnV35dYquXryEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750951360; c=relaxed/simple;
	bh=4zHzQ+izDp1vj74rfR0zKODzsyQdw3lWIvnDbFenFtM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bpFZVrcl7DC3j5bTGGV6G6bzpdxQp+K8dE0K4e5qGgBWyxztqZM4cDSaZfl7WatKwtX9/L2aE5yzMaT0vt8xs1rg2Kxw2Sdiogdm9SoPTUnAdoJBhXkC6gMvBahguxMUIbfob10SnOcK4jnoODvrfgFV2vW+MIrRv+ltZsLst44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kUYa13Up; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gjI75jPY; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kUYa13Up";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gjI75jPY"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750951357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ONXrsCxkDDT3Yh5OojaO/sgqdxQZlo/vYJ7GIt4D45M=;
	b=kUYa13UpIh98Ml+fI+ZDYKfE8ltEdnF++Uqtnr3468B6lZxQPL0IMbU1nElYaLVtG1AZC/
	f1U+ihVSi+WUKV2T7QhQ1ari+yXRJ0cH++F0k2kegsdmvoB9bVB/2faAzusWF7OFHcPFJO
	4AyG2nohRI62/vcKvL6MOn7vIOGJanlTff0PiHCwAZOpZ2a7+PN3w8PP72Q9FmSI41v9OI
	vbB6FGefJk2G0IzH7RSBHxqumuHcteRkz62bTHWWeOXglaRKD5IduLbpP2VAdqcPezxFeN
	G66Sq262Qs+zNNY04/mm1+lEsjzjO/keQuz7slBg/08rmbR3U6J9GTgUiQhqLQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750951357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ONXrsCxkDDT3Yh5OojaO/sgqdxQZlo/vYJ7GIt4D45M=;
	b=gjI75jPYYtnOmn3h+6zByPFDOaAWh77xcZt6vjD4/ZeHaKlqfmakryogxAnUSEHFCaITkf
	HRd8dVghvE0PVjCA==
To: Waiman Long <longman@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v3 2/2] debugobjects: Allow object pool refill mostly in
 non-atomic context
In-Reply-To: <20250617053527.1223411-3-longman@redhat.com>
References: <20250617053527.1223411-1-longman@redhat.com>
 <20250617053527.1223411-3-longman@redhat.com>
Date: Thu, 26 Jun 2025 17:22:36 +0200
Message-ID: <871pr6r0hv.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jun 17 2025 at 01:35, Waiman Long wrote:
> Removing the pool refill call from the other two may make pool
> exhaustion happen more easily leading to the disabling of the debug
> object tracking.

May is not a technical argument. Why would that happen?

As we established before the only reason why activate() or assert() can
consume an object from the pool is when the object was statically
initialized.

Are there really enough statically initialized objects to actually lead
to pool depletion without that activate/assert hackery?

> As a middle ground, we will allow pool refill from the
> activate and assert_init functions if they are called from a non-atomic
> context which is roughly half of the times depending on the workloads.

Which brings you back to the square one on RT enabled kernels because
the held locks in this circular lock chain scenario do _NOT_ disable
preemption, so in_atomic() evaluates to false ....

Thanks,

        tglx
