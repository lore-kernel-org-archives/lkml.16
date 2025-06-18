Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C16D3085B3
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750271963; cv=none; b=R8nc5lquHJQxrervcIcTsRjSgePSTPCrHIrz6nw6nRu78qTLQixiRKMesjpIHAkhZROaA7KrwqqjCI+Gy5fcu2Jko4h1Rst5dcmH+kFH9/7mqWDQEL3hoyYKrsstPa6qH30gqmPUe2ucz0gL++w0evOoPr7adgdYozmdy+b7PqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750271963; c=relaxed/simple;
	bh=PQvKTVCGBx2u4smdsQmu6FoHFBrZOQ0B2v/JiNxbRUQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=r45ERH7U+4kE5BUgX80GfSQZ32Hbp9YU80G83qbDIMiyzZkL7c6gTaGZcZgrP5Az1HbaPHb1yxobk8GIHBaJXlf3KGHFp+hYXx++Pc/eHcYZM6p7t1npR160LjFaTusSBBekWYSJC8v6FzOskFT2V9PhuhMmB0vHw2hD/J2uMGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HlB/rH/9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dcHTbIDk; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HlB/rH/9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dcHTbIDk"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750271960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PQvKTVCGBx2u4smdsQmu6FoHFBrZOQ0B2v/JiNxbRUQ=;
	b=HlB/rH/9ABf5yob0lAGkDg8UN1N1uVTgUtY85n8Rhln8OaK+aVXfvBgZw89hL0R4Ex+2wt
	Sk3yvj4/MbaPy+2aYmAuSKrogUsWcYQWUvK93cFTecYfqR4bdazP4I8ihcqhD24k9SuzOT
	o+tGiZz5EAi/w79HuukSJs7pPC/e1toCuqpxxhD1mHCTbhtd9VoslZFlI4lKK4FXLLselh
	YDtwscbbEQSj8ftUB97Cq8e+StMmyt02MqVfh/RsjGYQaCUgnJZqOZxBXVDf78+ts1rN/z
	15sgU1ZkijHhvmNZ5UwKU5xLAsyMUNLLXkbDR9Z3E9V6CgMIgcRu89OXwDnUsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750271960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PQvKTVCGBx2u4smdsQmu6FoHFBrZOQ0B2v/JiNxbRUQ=;
	b=dcHTbIDkTZRvslinMeFXDU3PSwhaUV5al75Jgw/4ldXaFjpfbHhDOjZ03dCOFHZae4JajC
	e8QgZfHW1TOHy8BA==
To: Borislav Petkov <bp@kernel.org>, X86 ML <x86@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>
Subject: Re: [PATCH] x86/CPU/AMD: Add CPUID faulting support
In-Reply-To: <20250528213105.1149-1-bp@kernel.org>
References: <20250528213105.1149-1-bp@kernel.org>
Date: Wed, 18 Jun 2025 20:39:19 +0200
Message-ID: <87plf0rj1k.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, May 28 2025 at 23:31, Borislav Petkov wrote:
> From: "Borislav Petkov (AMD)" <bp@alien8.de>
>
> Add CPUID faulting support on AMD using the same user interface.
>
> Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
