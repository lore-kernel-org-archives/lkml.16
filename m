Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC2A2820A0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744707808; cv=none; b=gtAzT1qg2IqNTy80LwAjy3E7Wr3gF/orO/lsxOCL/4gZTJW6VDlXEwx39etGNUm298hoXXutmCwB0EZWS6ciu8vI6J2gZ00fLFSzReUdBqwgX1QWzHRg8prij0RMxSix42JzsKs5TC/kPZCpj9k1DpZmEnWPUTF6+Qd8lDf0b+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744707808; c=relaxed/simple;
	bh=nYbA9kru2FXesVThtgdseMbe1b6S4ILp9Kf66UMmsE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P0k1pNCDfe95aningYdtq9JfyFk3vb9PDxHElIlLZnLr3+1yT1JC62k5JSIeYduC/8eqVfrC6WNrZhjKlfwVPvYS1aUyuY/GBXsZ0htB8mRpAgTdThVuMS69tZ7b7VbJ8ZYi0XnvprxsHHUebZBJocxJlZaLIN4YXpGrufQJ/lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eiYli8W0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/dyn91Jg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eiYli8W0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/dyn91Jg"
Date: Tue, 15 Apr 2025 11:03:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744707804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7WemkJBzO+WM+dFn1ysFVN7oi+9pL4eKkCD+1tNWdiU=;
	b=eiYli8W0ICcnFi/mrDV9t7MN9DnivU8sgmh55J0JUPUIsWNCjwgytI7hfNVyPAFU9GDXF3
	OSvXUqtcqcGh9y3Kv5lSKQ+LMBJZ8wXnMUVFDHjYKJMnNgJ2fMBpbTkCCwVAmdhqNLmrWC
	HhkQWdyeElWDrkn90rzyEs8WtA53thBv/dq9GrdV3x/2hrIkNoVHruLxWcVC7LbnvbueaZ
	QYuHXUjmkRA7J0rzgj2Xxt8bOeNNanDLZDAR1I1vflljFr18/AV6H7sgZkLcpw8x5Knll8
	mfiNrrjWZUuiaOrKaF/C5aJFNaqvukMKr1JvbG307ztIWjl7L2RNObbdGPt+PA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744707804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7WemkJBzO+WM+dFn1ysFVN7oi+9pL4eKkCD+1tNWdiU=;
	b=/dyn91JgZcbIozgxFi/Or5m/FXilcJi/mJpt1EgPEYwfs/w8Dl06T0NWqJudIFL+zFzrjS
	OTyWUZ9KOL/VxNAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v11 00/19] futex: Add support task local hash maps,
 FUTEX2_NUMA and FUTEX2_MPOL
Message-ID: <20250415090323.F21QhO3s@linutronix.de>
References: <20250407155742.968816-1-bigeasy@linutronix.de>
 <c2aa89d7-c3ab-40e2-bd65-443a75b04017@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c2aa89d7-c3ab-40e2-bd65-443a75b04017@linux.ibm.com>

On 2025-04-10 23:21:49 [+0530], Shrikanth Hegde wrote:
> >    - Updated kernel doc for __futex_hash().
> 
> 
> I don't see any change in Documentation/*. Is it updated in some
> other path?

Look for "__futex_hash - Return" in
	https://lore.kernel.org/all/20250407160007.vOk8ijom@linutronix.de/

This is the change I refer to.

Sebastian
