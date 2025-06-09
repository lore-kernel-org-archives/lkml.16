Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E89718DB34;
	Mon,  9 Jun 2025 20:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749502469; cv=none; b=VdGkAsIRBaM49oeVKLXkx10qm4BlDq/wNUf5OWZ5hsvsWnDmtzBLohq9jWlCRmeCdbvfQuZ1DagR+9qlpSmXdESVeLVyVWSt9PU3y19QnPagikLHX3ZJqZg6S//Tg1A4B0FjwtxZE4WXqqxEMP+7yBSlKc782LNKjC4aTYcMxEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749502469; c=relaxed/simple;
	bh=XvHkisD5A5nJeWdLqDH0n3g7++f6RHuc3NlXBnVejMs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZLdfJlg+QkGOWf9u+Uw5zLDvWbYqBnaeBH2iwYWB5odgOOByDCpqbSg6bzNCsee2zY/PXuxEp2S6CK0Ce9HMlR2gxg7ca/taS1qhQIP79CH8PzkDB99R4FS8qh9rS7PFr9THIfB3lgqRhUwS3Ih9iB+tPKpPcbJYBm8NjWK8rhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=L+Z04i7+; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="L+Z04i7+"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 816C441AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749502467; bh=EtJai2BUpQloF32RX2MqY9UbUtQoEX+8QicLHnfLIZM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=L+Z04i7+nwO5QkEYxCFXuAzo7aOk+JhKR1iBOBXkrd1RGGWtzdB8mTi7yaoke1BuY
	 +8tNR3h7q+yDGtp4hYP/alAczcNIoK1kjAGmPE+P/J9WDqvDGgb7ODFd/egCZnl7kh
	 BmQf9N+q43pry504e6moz+ht4dddUYotbImu8fK5dJ+eSpmFNHVOTsTBc7J+cnrrLD
	 uYgSJRVaQT8d1eL9jt8BZAb/z0vaxpYVZUZ/I/iu0d2Ni+Gn6q2lobv4ZqPJxoXjun
	 ZOGV76mV5Jhm2gcMd5SLizt2YjKqZDcNuEfx0tpJRXOnET5gwiRX8vdeDXwfOjcPeN
	 LinaENd+UkrRQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 816C441AA1;
	Mon,  9 Jun 2025 20:54:27 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Collin Funk <collin.funk1@gmail.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Collin Funk <collin.funk1@gmail.com>
Subject: Re: [PATCH 1/2] ver_linux: Remove checks for reiserfsprogs.
In-Reply-To: <4d9808b5e3a87eab41d5d0417d453800faad98b1.1749352106.git.collin.funk1@gmail.com>
References: <4d9808b5e3a87eab41d5d0417d453800faad98b1.1749352106.git.collin.funk1@gmail.com>
Date: Mon, 09 Jun 2025 14:54:26 -0600
Message-ID: <87plfcab5p.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Collin Funk <collin.funk1@gmail.com> writes:

> The reiserfsprogs package is no longer needed since ReiserFS was removed
> in Linux 6.13.
>
> Signed-off-by: Collin Funk <collin.funk1@gmail.com>
> ---
>  scripts/ver_linux | 2 --
>  1 file changed, 2 deletions(-)

Both patches applied, thanks.

jon
