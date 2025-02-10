Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F32E24C67D
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739217176; cv=none; b=jLLl1ejR3+OgjscsQoVhlgRflHkNi9FE5KIyEI15HJik30uJbcn6sXY6GwDlVHqrEmHH85G63+WsiO1N+g7CXLD2RvAOqne20RhYuPsLnsXqqd5sbDrttWhPmIlgMLeNN3s8CYnLHLPm72HDEH8Q4vJ02c9qnyDviPQow5LWz3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739217176; c=relaxed/simple;
	bh=NGEj4sT+ZFiE7KJ3birqqGN69PaGP6e4B843Ge8LRdI=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RQ5CSPlId7xOQHwbOW5ajHHkFVBMDkbUq1jbzQH7pqQr8W9fe+zNZyyY7NScGskgK1oWVwgL/K7VjU0CluzDghgHy1WEPDYCc7SZh/AcrT+CAnw6tgOtUbyKSqG+7JULFgZ0BMPLmou2v2Qf0W5PK305vykdodOnLAjw48yiE1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=q5+YN6k7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SViL+dzs; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="q5+YN6k7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SViL+dzs"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739217171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yNBNohQlvDYU1rylWLfk3BumUzUQF+tRBpWGImScioI=;
	b=q5+YN6k7cXvy3E2cYd6XOt9/ovhHusva2j0y9eHAP15e6iHF/Uxf7XO0kagbVYWDGxImXT
	P8TAWPM0EmXI9SWdUzSGRAGsODa6BOInituWpikDoqWwGTV3ccc8P+zQbePEfmhJwfvxF8
	3AmFPTxvjPPTUXGT5xA2fFA0F2c93Zzg2xUYZvooC0fozGKlkLPGWW0IgK7fNe9rstXdJQ
	DDoB5y7K5YOgVcpRJB28Jg0mht2pTFHzjyATUSizHKqU8f1EoFC4IHXCWETyWV48+/Vg2A
	qkEbfE/so0T0trp67DW0yXCrK77E/26Df/HHqL+6rBovmwG55JsBJPj+7S3+qw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739217171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yNBNohQlvDYU1rylWLfk3BumUzUQF+tRBpWGImScioI=;
	b=SViL+dzszwerqC31niQxQ5YKDUZ8W2zb7fg4pyF/oS23we5TkGxRuLG/eZTOnVhke3gCCD
	eezX4vu5BBdajYAw==
To: Jens Axboe <axboe@kernel.dk>, Nam Cao <namcao@linutronix.de>, Anna-Maria
 Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hrtimers: Make hrtimer_update_function() less expensive
In-Reply-To: <b6f4b197-becb-4150-8986-2c568f7e738c@kernel.dk>
References: <cover.1738746927.git.namcao@linutronix.de>
 <9b33f490fb1d207d3918ef5e116dc3412ae35c1e.1738746927.git.namcao@linutronix.de>
 <35d4b9be-3d08-4eaa-8750-7b34ec6e6064@kernel.dk> <87y0yjm4hi.ffs@tglx>
 <4f317ca3-0ffd-4ee0-9da6-8b80a6366d0f@kernel.dk> <87h656n3r6.ffs@tglx>
 <ad55978e-4356-494e-8cda-9e6487344768@kernel.dk> <87ikpllali.ffs@tglx>
 <b6f4b197-becb-4150-8986-2c568f7e738c@kernel.dk>
Date: Mon, 10 Feb 2025 20:52:51 +0100
Message-ID: <87frkllgq4.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Feb 08 2025 at 08:18, Jens Axboe wrote:

> On 2/7/25 2:16 PM, Thomas Gleixner wrote:
>> The sanity checks in hrtimer_update_function() are expensive for high
>> frequency usage like in the io/uring code due to locking.
>> 
>> Hide the sanity checks behind CONFIG_PROVE_LOCKING, which has a decent
>> chance to be enabled on a regular basis for testing.
>
> Looks good to me, thanks Thomas. On my side, I always have a debug run
> done with PROVE_LOCKING and KASAN, fwiw.

I assume that with that your objections against the conversion of ioring
to hrtimer_update_function() is gone too.

Thanks,

        tglx
