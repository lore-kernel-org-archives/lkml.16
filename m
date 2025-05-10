Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B2C18DF8D;
	Sat, 10 May 2025 10:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746871542; cv=none; b=IuEvCpqrwoO5mPx6fbnaf/yS8umtRBc4MP5XkD7dz7+57HUm+uKdJJal035kobn+TfFXBiwBEu5AnmqkYGnPqIcKy3E5VxSJ+BqJIlr71UteTnvzWBjJB6vhWDB3+EweUBOT5j5KMWyo2jkBYZMSj2ko0/oGvaXxlzhHmWxbf5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746871542; c=relaxed/simple;
	bh=nCg5dTq3OdqIAS+Cl59freLTg2I/khLS4trUZ7wl8+g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=h5octX1AvQIZaGlJ3SxioFE4IZBJpH5Lbpr1EISdbSoJCtvUZMeruiGWJ/+0psxKutA4v39TeK4n59ZlQ3kPIaNYxp5nkbBwhcurL3qe57nlsME4gh7jbdAJM7BjkS/sU8TCHQD6IG73grvlVEZ6Jri/SKihnyOi16qr72ZHDSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=lYr2mgJ6; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="lYr2mgJ6"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4068341080
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1746871534; bh=nCg5dTq3OdqIAS+Cl59freLTg2I/khLS4trUZ7wl8+g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lYr2mgJ6qGVYEx6+p/cIs1CIN8mPg7NT6QgMaqIRRJ4IBLrnd0/l7gE9ksWO20JGM
	 AAgWMWa0jTYU6AH+6JSLOjbz++zbuTZ8szStTrQQK/xNIKD6V6tnKaR3HM1myRlVwZ
	 WO5ANi8PSKOJ0X+7SkoLDiSDZByu6fbfrhEbW4q9B+8huGEp6C9WWWPHfo2gqnHgeC
	 We9HQahhV8JHWuxFB39dRVxVCiFdJhhCDEC5hfdxZHTFwlkHcV7GknzBMvxeLikvb9
	 qspUgUcLV+lN3/+PPVRMGrPO9b235Xs2h9Pt8BszoY/ms72Byvsrm0T99l0RNR1kx9
	 7JnXAoQo+vrSQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4068341080;
	Sat, 10 May 2025 10:05:33 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: workflows@vger.kernel.org, linux-kernel@vger.kernel.org, Alexey Dobriyan
 <adobriyan@gmail.com>
Subject: Re: [PATCH 1/9] CodingStyle: make Documentation/CodingStyle into
 symlink
In-Reply-To: <20250509203430.3448-1-adobriyan@gmail.com>
References: <20250509203430.3448-1-adobriyan@gmail.com>
Date: Sat, 10 May 2025 04:05:29 -0600
Message-ID: <87frhcsrva.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alexey Dobriyan <adobriyan@gmail.com> writes:

> Every time I open Documentation/CodingStyle it says the party moved
> somewhere else. :-(
>
> Of course, I forget where it moved to by the next time.
>
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> ---

No 0/9 cover letter?

Just FYI, I won't apply coding-style patches without a strong sense that
there is a consensus behind them...I suspect that could prove to be a
high bar here.

Thanks,

jon
