Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8A41F4174
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738858463; cv=none; b=l+fYNUFkvK/ou43IMbIhynIWF1U9QJPZoORsMyI84O/TpslIe72KngVtypAnWEivFuqpnB8awyM8DfGuphsAsY1UqshToDhQ105JFqOJBsvQi6aR+tKpNzFjAFArZAgebakNH8mgM7oa3TtvxwSl0iWs5PmDAK3OBmtfrAtvRlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738858463; c=relaxed/simple;
	bh=Lkm7Dx5XNruZjQoSpzCbDWwOxVHtNg2BPt3GL7xYB+4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AELXgIiJbk/bDPSWGVivsPpu08q3Ok82fAThnBtAl09cVp9DQBA+B0lPUTLE0DH5Hx+VahlZdx8WClpQqASdi+dghrJVRhCw/7kYiShAkDgWq4L27m3A89Rqhn1WV5j3LtjkSS8aK5xGrOZtFwfMZXSG3GgfXqs0DS/ZwpsHrvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=u06qRaLS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ocLYSghQ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="u06qRaLS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ocLYSghQ"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738858460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=azM9/D49s9gfWjERdzZNJws3LgiXufxM13ClW10VfMg=;
	b=u06qRaLSyw2y9ITlB2AqqXFWPjV94diN8ijA45yTdwAqjCWyXV/HZsK0SCMFFEe2Jo4gZ3
	Qi8s53Dz5ymZoHLyiRe596oO9q+8DBiQKlL/Ggew5u5fiTlNCaRLVK52nVy8wXQTAh6ugz
	vq6FK/a5htfNPrEmrS3LZH85oSA7fACjZLiJrFarcXRV0PwzrHkUFE/xwgQcH7WhJU/4n8
	zPF1GTQj163ToP14aceJBneN1JnV+ljm5udaEe49O1e53U7Cl/U1dFtD1ENOkjJkhDBpHR
	NznXDmasdinBTaaSjrCQa5wDS596NOL0KidNGZBfhXH+PyVZOVyuLBX4/VDh2A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738858460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=azM9/D49s9gfWjERdzZNJws3LgiXufxM13ClW10VfMg=;
	b=ocLYSghQxDKQdXkNvQ6ZxwFm2LAUhKPXa+XJeQmYRmexszAwsuEjmxq7jhy2PQowVcNdmU
	dH90ZVYGE2Q+5fDw==
To: Waiman Long <llong@redhat.com>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Peter
 Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Rik van Riel <riel@surriel.com>
Subject: Re: [PATCH v4] x86/nmi: Add an emergency handler in nmi_desc & use
 it in nmi_shootdown_cpus()
In-Reply-To: <cf3a8f45-683e-4fbc-bee7-cfae73d9061c@redhat.com>
References: <20241219150653.349177-1-longman@redhat.com>
 <87a5b0oihc.ffs@tglx> <cf3a8f45-683e-4fbc-bee7-cfae73d9061c@redhat.com>
Date: Thu, 06 Feb 2025 17:14:19 +0100
Message-ID: <871pwbnj8k.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Feb 05 2025 at 21:46, Waiman Long wrote:
> On 2/5/25 4:20 AM, Thomas Gleixner wrote:
>>> +int set_emergency_nmi_handler(unsigned int type, nmi_handler_t handler)
>>> +{
>>> +	struct nmi_desc *desc = nmi_to_desc(type);
>>> +	nmi_handler_t orig = NULL;
>>> +
>>> +	if (!handler) {
>>> +		orig = READ_ONCE(desc->emerg_handler);
>>> +		WARN_ON_ONCE(!orig);
>>> +	}
>>> +
>>> +	if (try_cmpxchg(&desc->emerg_handler, &orig, handler))
>>> +		return 0;
>> What's the point of this cmpxchg()? What's the concurrency problem this
>> tries to address?
> It is because I am not sure if there can only be one instance of 
> nmi_shootdown_cpus() at any time. If there can't be more than one 
> instance, I can remove the atomic instruction.

There are two ways to get there:

  1) crash(), which installs a handler

  2) emergency_reboot(), which sets the handler to NULL

If they interfere, then the callback is the least of your
worries. That's already broken today in so many other ways.

> I do remove the smp_wmb() in nmi_shootdown_cpus(). If I don't use an
> atomic instruction, I will have to add it smp_wmb() here.

Right.

Thanks,

        tglx
