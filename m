Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7120A21516E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875467; cv=none; b=SdIfyc2Mq15/To3iURPdXcs70U1fa5FYJgFhUkO7x+aJaO9NVe7nvVP4vmBoSFLzkSNae4Tnmgw6xHbk0rNPqCawvm2e1Tva4PUr3loUqcU4KKHG3XzSDVAMSo5zyxj7ePvvrtMWdWgWcPHS014zGS3TcjFdBULWlnxPYD2ut1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875467; c=relaxed/simple;
	bh=7V4MBaHfmNpXkbxyLM+2yx8HmRlbU21u2PYd4BG42b4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uUrePyKMvRUv8SdVi4NrBKRYZffb7zCqPhore8qEj3mXQnoJHjcQYQy4p4xxIT89fJfGW0uoSmGwW/yiHs6uv9B2M9tarLoN94I0FaA9VHuscXctdZnIDloI2cycsJxyu4iTN/6LGMUUYnzFhT+NtN7Z2h84vJh3bUDpa+DKjJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=R0bBO8CS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LgmDhw/S; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="R0bBO8CS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LgmDhw/S"
Date: Mon, 2 Jun 2025 16:44:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748875463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7V4MBaHfmNpXkbxyLM+2yx8HmRlbU21u2PYd4BG42b4=;
	b=R0bBO8CSwA9TNKSV62xnvDuP29PIJ6VXGaqJBTGy8rVR82VBDtVIsJN/bOFpSD/7ycqGCg
	wZjeAii1GF6VuQHXB9iLBPAxVJIcCLe1T5/f6DwE/Lp7yeRo2Fzz6franP45mBpVjEJWUI
	BCGyJchLPzp9RTAf5Y+eFJk+tIjpNVScl1VMB0qHly8iWCJkliy34bsJmdHQPp0uyOSnjx
	pQpZSh8JeO34n0QUQtRDPtc+E3PzQuzw9tF8J+Bal8BaZ+eP/1JRChJna8gwYkvLQexOBP
	3Co1gX+bjO7w7bcRgwumjEswlgp/v/DrZCHbQulGyVhd/xL6fc/jFo/PprSdjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748875463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7V4MBaHfmNpXkbxyLM+2yx8HmRlbU21u2PYd4BG42b4=;
	b=LgmDhw/Sj5/LVGCh/crvdb1QEqyN89AI1/LG538sNyezAfB/QIJjRuNlwf7Dz58AW3Naei
	rmNdBpkoPQQGLVBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Lai, Yi" <yi1.lai@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>, yi1.lai@intel.com
Subject: Re: [PATCH v12 14/21] futex: Allow to resize the private local hash
Message-ID: <20250602144422.GIWEDzbT@linutronix.de>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-15-bigeasy@linutronix.de>
 <aDwDw9Aygqo6oAx+@ly-workstation>
 <20250602110027.wfqbHgzb@linutronix.de>
 <aD22/Ra2jHOsHJ9W@ly-workstation>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aD22/Ra2jHOsHJ9W@ly-workstation>

On 2025-06-02 22:36:45 [+0800], Lai, Yi wrote:
> Will trim my report next time.
Thank you.

> After applying following patch on top of lastest linux-next, issue
> cannot be reproduced. Thanks.

Does this statement above count as
Tested-by: "Lai, Yi" <yi1.lai@linux.intel.com>

?

> Regards,
> Yi Lai

Sebastian
