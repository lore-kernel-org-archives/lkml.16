Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BDC2E540C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945839; cv=none; b=pFCJHOyhG60ndiIC2EKodtQijeTgHPsB+KDCkNULlPSMO7syzpW4GnIZLpt1soRnCOYtR9WhbmO1wnYbbHP9aZUX7yFiBNDf0EaHHzEMFDjYtpK4XFroHOSalnW3gC4A/W82r4oMFngScymKagSjlBZDsWDxOWTpwMybePD/uv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945839; c=relaxed/simple;
	bh=/2SL6QRaYvDAwbGKxaNtYugn3ePahaIfY4aFGJgIJyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HGDf1oOEfNELDLnEYm7jQsvDenYMiNm4LYM9x2X0lh5dAXAXUXtX4DTOb4rVpjD1apPM/zvkBai7NVtM9mkCCALScFNKorZc5V980YlwpBN6vtGfiExKeYfn7V1r+Tlm6gPt8Np0pmlZx/ZcyJEKzMXIKghwFOlX2Nh6INJFWF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pB8F7nos; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7dQyFoGp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pB8F7nos";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7dQyFoGp"
Date: Thu, 26 Jun 2025 15:50:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750945835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CjHZS1MugimhHTZ/0Zouhr2+ysM4hV0ngKa1Sl7fLqM=;
	b=pB8F7nosj7HB5P+zw2UdXnnUQJVVZdDGsHE9JOLvjTA21LiRHWeRsFySef0ne1lnQBjlVE
	8Rt5Ahec6j4ykQuMEm80EG5YyMkZdVGYqHj3lEPrDhM5GT7tLdP2LRIKs6nHUm34dEwX6F
	UGldJMnDpa6v5i9VpiA2Y1xMRkT1NtfkYnw8PxNKFnibVCVZtJ87E5nKyMvXxQGJzoTQuW
	yH+T/ZApXmEeeboNN1JGb7RikpA5Bi8fPUbui9Sko7axWwsPbJW8T6tDF289O2j1GbQLgB
	/c7N4rTBLKZCfkaW3vZq/uLP59ySvMBdm17zmQuwLaIUTjSZlEWeyjgQVm7AJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750945835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CjHZS1MugimhHTZ/0Zouhr2+ysM4hV0ngKa1Sl7fLqM=;
	b=7dQyFoGpGZOfeczoszCmZeWCIMGbCpU2g8HpJPTH4iWWUVK0FX589q+tWzxouF7IFY//uW
	AWXhC2YvuotCf+Bg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Chris Mason <clm@meta.com>, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: futex performance regression from "futex: Allow automatic
 allocation of process wide futex hash"
Message-ID: <20250626135034.18sab4Xp@linutronix.de>
References: <3ad05298-351e-4d61-9972-ca45a0a50e33@meta.com>
 <20250604092815.UtG-oi0v@linutronix.de>
 <372d8277-7edb-4f78-99bd-6d23b8f94984@meta.com>
 <20250604200808.hqaWJdCo@linutronix.de>
 <aa6154d1-726c-4da1-a27b-69d2e8b449c6@meta.com>
 <20250606070638.2Wk45AMk@linutronix.de>
 <20250624190118.GB1490279@noisy.programming.kicks-ass.net>
 <71ea52f2-f6bf-4a55-84ba-d1442d13bc82@meta.com>
 <20250626131715.GI1613200@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250626131715.GI1613200@noisy.programming.kicks-ass.net>

On 2025-06-26 15:17:15 [+0200], Peter Zijlstra wrote:
> > I'd vote for defaulting to global for one more release.
> 
> Probably best to do that; means we don't have to rush crazy code :-)

If we do that, that means we need to ensure that the private hash is not
deployed while a thread is created and the prctl() function can only
work create the private hash if the application is single threaded.

Sebastian
