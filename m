Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFADF2BE7DE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745934841; cv=none; b=LwUg3/3SMTSkGgfZIp0ZYNn4GFMPniGRMWgkPjG/GOywTjoob/ptWQb8bmrIU22qbhpQL2PNRp7KUTXiFfp9UQ9DNT5odbxm4A+RudwCekfiLYMq/9nTdrxoYoIGqqTEZVNTZ2WLDEgTcXF6Rg8GLd9TjYjoDYn4n6FHkEsLQ+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745934841; c=relaxed/simple;
	bh=LwrNs6Te90+T9KCSxccB267LjMWr4DFK19QpJtMKndY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QvYSDmEe8M70PSOtFxB26eLLJ7VQCIHKFs1SKKei/rZFfmombjt9djKtmbTb/6JWa4SRQfs1pIkSk7JCB4b7+EtZmN9tBh+7v1p/OK3Th6mmoz/xM/mEXnrpzQqYk+Dn8yX180UODtc0yWNHlw/qcnZCSeW3nTilg74pUBH2buw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=sXDGQe1K; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="sXDGQe1K"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1745934837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=10AMgIZT0Rv1ZZbzCxlqVb5gUSHFv8lux2lqcz435Rc=;
	b=sXDGQe1KcJryzSamz/Dj8Rr0w2Glv5tl9jm+XJBTPdmGZ6cC/TRZ++eBpJaYZKZWTCYTdd
	QLy3vDfQnpIArMSWrnKZ3DZ09qsMCGx2piZORLrbuXmlCXRp78fUXcfKgT7cgCpELsk7D6
	+F5QkWg0YCA6UJb3S3aVepyOtPYTvTWbv/hdNp2sk2SkusWGdSQss2y8j9xvzEZrLGNvmW
	30EiL7My124SHTqTKhFCaKoH6IGLnBWV0J2HzZCb6KRaF04rq8zHqu30SVHdmdw+JgGxah
	UflWIkn2nSbtoaJm6UgNIUTyWQVGmbMVoAObbKb1mZXj50UyV7PUFKMuxVODEQ==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>, 
 airlied@redhat.com, Simona Vetter <simona@ffwll.ch>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
 apw@canonical.com, joe@perches.com, dwaipayanray1@gmail.com, 
 lukas.bulwahn@gmail.com, Kees Cook <kees@kernel.org>, tamird@gmail.com, 
 Petr Mladek <pmladek@suse.com>
Cc: Aditya Garg <gargaditya08@live.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 Hector Martin <marcan@marcan.st>, 
 Asahi Linux Mailing List <asahi@lists.linux.dev>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
In-Reply-To: <20250428123132.578771-1-pmladek@suse.com>
References: <20250428123132.578771-1-pmladek@suse.com>
Subject: Re: [PATCH] vsprintf: Use %p4chR instead of %p4cn for reading data
 in reversed host ordering
Message-Id: <174593483342.171975.1813917421417975137.b4-ty@rosenzweig.io>
Date: Tue, 29 Apr 2025 09:53:53 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On Mon, 28 Apr 2025 14:31:32 +0200, Petr Mladek wrote:
> The generic FourCC format always prints the data using the big endian
> order. It is generic because it allows to read the data using a custom
> ordering.
> 
> The current code uses "n" for reading data in the reverse host ordering.
> It makes the 4 variants [hnbl] consistent with the generic printing
> of IPv4 addresses.
> 
> [...]

Applied, thanks!

[1/1] vsprintf: Use %p4chR instead of %p4cn for reading data in reversed host ordering
      commit: 37eed892cc5ff36aeee59bb78f6aa417a44030a9

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>

