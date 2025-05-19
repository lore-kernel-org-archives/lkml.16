Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB231714B3;
	Mon, 19 May 2025 11:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747655114; cv=none; b=dU292PNBl0/LcrBXbWHHFB6minge/PAeDI1vFUtaTnWE9JODlhuhO7yoy02aPn1bLyhtS9jRk/z/r07qQV5uDjwDBwvDfwUrzYq8PnkiF0Ar6U/0Of5G4q1Z9XLf8EU8cKGZLtkyNhKGD3g3sBQMAgjc2tUp2Zqu4EAumVlpxiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747655114; c=relaxed/simple;
	bh=//y/ewFwK3+P6K/VtcuEDULsYjMnHbZpJURZ2u9sFRA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sdpiR5EUfLFpi/ILGOXVV2GsryFWDJuSjp+Gg49HpKWUNI+q8VU/ZSdV74uLI+FFMTK/c0/k16TtFbTvef8qJ+f79egadTfGMhala7/wKFcrSNNKH6Z1NuljeiN+TRAWlcLE40myiwT+2e4RBvMoAlcBuTMcgKUlWQjNwhIp28E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=HgxQcn55; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="HgxQcn55"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3F09E41086
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1747655112; bh=9lINbBbTmIKTG8eNObFCf37E2v9kYcGZFOY+2A4xoRU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HgxQcn551KrLQSFmvbOJ/cZq01qzF99L4I4asmdZ76tKjp/dL7Z988owwved0b/eS
	 W14BH5S6xZfRIbqCU4pM5mTziAdd66nw1GGoSeiVFTsJCidm0C3gO/CBl8hWJbxfzv
	 f12gqVPiD5kdVZPgvwwBDCBh6DdULd7KIfov+dcOrGuFNVykprgOS6yY5PPOjIbbXS
	 QB0IjoeQOXIIrAEpgODiNWIi8Pkn4bTlvEfdMHIids00jXJ47vDkWRzDY97kaZPfHm
	 weE8BeT8+Y6aq3LAa6G3CMfBQFLyTrR1JtFrllZxDRS1GrQrmCdcR/K0Amljzf0P1t
	 5BK2EJVgv6HAw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3F09E41086;
	Mon, 19 May 2025 11:45:10 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, Andrew
 Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>, Tom
 Zanussi <tzanussi@gmail.com>
Subject: Re: [PATCH] Docs: relay: editing cleanups
In-Reply-To: <20250512023233.107582-1-rdunlap@infradead.org>
References: <20250512023233.107582-1-rdunlap@infradead.org>
Date: Mon, 19 May 2025 05:45:07 -0600
Message-ID: <87bjrokenw.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Cleanup some punctuation, capital letter, and a missing word
> in relay.rst.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Tom Zanussi <tzanussi@gmail.com>
> ---
>  Documentation/filesystems/relay.rst |   26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

Applied, thanks,

jon
