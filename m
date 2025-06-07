Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C8E221DAC
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 10:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749290627; cv=none; b=j3cI4LEU9fms0AG1wed0fv5wi1GR+SennI9B5IQ7pZQy/DCHqFAiXeq0nrVWck5NWjXKp2VRatGxX9IWPhxXqvU9fjkm2ua2ImMU9oQ8d3QsbZvHWVT03EhxPBKOHJThvHeSTNBgtIxfAC/+DbE8ck1YjYCTUyvaUTpVlkvkScs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749290627; c=relaxed/simple;
	bh=CJ6M9RyEUPBvGNT+8wSLoYbO+13/x8VnwNsprw0ll/Q=;
	h=Message-ID:Date:From:To:Cc:Subject; b=QrMpUUiXousVPaVOy9tIqXoy5wxnOYlcZojFGYCOt3s15EV8eEt9Wc1kC/KrDD9fEpTSb60VytNA41kUlW5tKtceHyyFGmQ+y8bhTvA2IrKhhJLH/XO5EL2tCWcig33w23R90iwkV0YYutVMlLdFsEj8emrJpGzbr9pJX+tap74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gkWeqgTQ; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gkWeqgTQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Cc:To:From:Date:Message-ID:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=iW6N4/awdNAortzChg601PW5tRmALx2HYh0EPC9VvJc=; b=gkWeqgTQuA0IYPwR/QXoJXVUmC
	yupCZ2Y07WjB1xiZuy1rMk1oA+Jh96qospGsL+KbFudLP6gJs3gOyZLjw0I1Atju2EkN1VhjSiXUJ
	pzNNjJf9SdUkbp9Mbz/8HMBrl4Y7qg7y3tKGsF0uaVzz8ozSCWeEitqP2QIkTnqwSj8n4aOj3J2iv
	5DwX8bCbtm8X6uTfzC1Uj5J9YtlP6fG9JHgyHZsFQxh44hdc9jJ+wD9dh1MAwB1AeQRcgNJD2qz8a
	GM0LnfSMea8e54YWjbQDLANlRI4FbgXhjMjVs9Oj5PzT9mJawBnmbcK0rEndcXhvdU95CIp6mQaxZ
	wR6RDTdA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNqOm-00000001N8j-20Ug;
	Sat, 07 Jun 2025 10:03:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 51FB1300F1D; Sat,  7 Jun 2025 12:03:35 +0200 (CEST)
Message-ID: <20250607094224.104791182@infradead.org>
User-Agent: quilt/0.66
Date: Sat, 07 Jun 2025 11:42:24 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 kees@kernel.org,
 acarmina@redhat.com,
 jpoimboe@kernel.org,
 mark.rutland@arm.com,
 torvalds@linuxfoundation.org
Subject: [PATCH 00/11] x86: WARN() hackery
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi,

Slightly less mad this time :-)

The primary purpose of all this is to get the WARN() printk() and
__warn() calls into the same context. Notably the current state is that
WARN() ends up doing printk() in-place, then takes an exception and has
the exception do the __warn().

The problem with all this is the ONCE logic. Normal WARN_ON_ONCE()
(without the printk) has the ONCE logic in the exception
(__report_bug()). But because WARN() essentially results in two distinct
actions (printk + trap) this cannot work.  With the result that
additional ONCE logic is sprinkled around for each such site.

Current proposals look to make this worse by adding KUnit checks for all
this, including regular WARN. Making the per-instance code overhead even
worse.

As such, by moving the printk() into the exception, and having the
exception (__report_bug() in fact) do everything, we get rid of the
external ONCE logic and provide a cental place for additional conditions
without need to litter all the instances.

