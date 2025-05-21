Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A5C21324E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 19:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747854420; cv=none; b=D6KuCc5jH9kuRx5GNmkD0xbZjuekukIpoaMYwd75J9F3fpJknHMcGCU4JjNhnfk4V/944euSU4wmv9w8XRQFx7UFAPQ29QnRXchePBeh8sVT254OdvBJBoCtCA0yz0jlZvMMxgxMXRJDRA5gu2TN99bPjhTrvhqt4dbKMQPI9Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747854420; c=relaxed/simple;
	bh=D2KqaEz81T7+J/kvpNyyq76KkQ1iTBVlrTgIr5VrxHw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iOwm6BshpozaI3ul9ChdrkfiioMQ0PJ3tsOzNNn0O2lH3nV3sHm4l+lREJYVy4K3+6k5cugjgrm1BxCJ50qtNkNMXbFJr54CWpXp0AvtgM2wU7oQSfpxsGgXismbdwtjir8Z16w13/0lZJty6BF/v3YhwrtTyIg/3LxQIj1AuJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pNO3N5lW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=w5i9e5dB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pNO3N5lW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="w5i9e5dB"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747854417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wu3LOEUSMm8SUQd5p5Qsk9bRgy0QGcEvKsCCH/IqaTA=;
	b=pNO3N5lWlIpqyldg/OiyeKbAWTLkJJGWD8+guFnqyTm6u78TlsjWbbXsJPXpILVulkUVTC
	+Ecf8Rwbhesje+0OaGhHljlD2Ea0EODTfuGbVt/HfPWuuNvrqQb5j7Mq1vmtU24VG/hRDr
	8bBXTll5BTy0hQk9F0FULd3csejwbsYU/EKkhCK0N3hZ6r1IUSegoXTQrxro+YUreenGbD
	stLdPEhbeu/Qr5A5ppOoUHTzknajq3sPtLHLnLNatzyjXWwCIRHSvaVznGDcHMfLmuEWAe
	WDfD+PvzgzYR3VD3myI2rigE/HFauBoIfW0jLjjYpXudjOPb+1MwWaMzuHHiug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747854417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wu3LOEUSMm8SUQd5p5Qsk9bRgy0QGcEvKsCCH/IqaTA=;
	b=w5i9e5dBlmxPOtW5aRYgr2WrZg7AbPP8TCLo/5dgCqAvNhbzUtO9uqZpJRMRFDSW5rE/Xm
	DIhx41lr/e/3HrBw==
To: Dave Hansen <dave.hansen@intel.com>, Rik van Riel <riel@surriel.com>,
 linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, x86@kernel.org, kernel-team@meta.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 mingo@redhat.com, bp@alien8.de, hpa@zytor.com, nadav.amit@gmail.com,
 Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: Re: [RFC v2 7/9] x86/mm: Introduce Remote Action Request
In-Reply-To: <2385d4ed-48d5-4d50-ae95-dbeb23432b71@intel.com>
References: <20250520010350.1740223-1-riel@surriel.com>
 <20250520010350.1740223-8-riel@surriel.com>
 <2385d4ed-48d5-4d50-ae95-dbeb23432b71@intel.com>
Date: Wed, 21 May 2025 21:06:56 +0200
Message-ID: <87plg1rdf3.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, May 21 2025 at 09:38, Dave Hansen wrote:
> On 5/19/25 18:02, Rik van Riel wrote:
>> +/*
>> + * This is a modified version of smp_call_function_many() of kernel/smp.c,
>> + * without a function pointer, because the RAR handler is the ucode.
>> + */
>
> It doesn't look _that_ much like smp_call_function_many(). I don't see
> much that can be consolidated.

It does not look like it because it has a gazillion of function
arguments, which can all be packed into a data structure, i.e. the
function argument of smp_call_function_many().

There is zero justification to reinvent the wheel and create another
source of hard to debug problems.

IMNSHO it's absolutely not rocket science to reuse
smp_call_function_many() for this, but I might be missing something as
always and I'm happy to be enlightenend.

Just for the record: The changelog contains an utter void of information
why this modified version of well established common code is required
and desired.

Thanks,

        tglx
