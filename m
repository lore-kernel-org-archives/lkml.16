Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC6321B1AB;
	Wed, 21 May 2025 10:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747823324; cv=none; b=qe2BZDbtCPnwitQTATyW0OHqiNFSjSOdBMeRGGI/O9QQT9PkM/KIdXGkWjp2bX9knIuPHJzVMNXS92U4uB3HU4HcGSGGuMhDYrMjUijfP+NFGNJ4JIfry3QF7BzXm0I4acqdDKgNhahmvrU2CE4COmxoCthcDa2AnzNamUaCXb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747823324; c=relaxed/simple;
	bh=tjAa5qfSW304MZRjU8O+2TQWJaTBZRn54Nu7A3w6zZ4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=azThhk4nE+ISmn4EWUOe/galoNoRHG7TJaBT76fjVrXxlHfzD1uIBPW+AkHL0wZApenAWfs1mnbezVQLyD2Rpe9Qr9gdy2WmciU9CF5w+6OQJqukTgPdGqAxZ0pUhWqVadqAhd1nuz68Q4Ieqr+NC7n/bispl/VgVYRJgTWLGH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=UutLolWK; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="UutLolWK"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C3AB241A9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1747823322; bh=DeF1xZRaa3WvltCwTn/lKXhpNOwpvZ0prQhLjG1Q5w0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UutLolWKPf6EqKauOkrwvduhFO9IM6G64fhYdveKOZ56oZ0UMS/+aKaOqY8jUyr37
	 2gPg7sOVQUebpRrinYvjDl5JpOkKFbMTUk/vOe6Cc3QBOsdfzgOXgxdTaCQn2/L9Rw
	 plKzK3TVzjc1nuNo6eQ2mgnSvtuOMqP2YiemoeDv98TLsi/JQh38+Y40LDwqozEDWP
	 vH7x+ymIoC/H+yoiztBkD07JtYvB+kYcdp85dCZizJzlmkmscPKisC5i7o1AM83TGG
	 JBrw2g6XWai9eF1kQ1vCy5IAEeUsiLfnkVzduiCLvgBr1QDgoIY4zcgpriH8CUBBze
	 vjjfl3INiMXYA==
Received: from localhost (unknown [93.187.88.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C3AB241A9E;
	Wed, 21 May 2025 10:28:41 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] Docs: doc-guide: update sphinx.rst Sphinx version number
In-Reply-To: <20250519220413.2914890-1-rdunlap@infradead.org>
References: <20250519220413.2914890-1-rdunlap@infradead.org>
Date: Wed, 21 May 2025 04:28:38 -0600
Message-ID: <87r00ifeax.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Update the minimum version number to match both
> Documentation/Changes and Documentation/conf.py.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  Documentation/doc-guide/sphinx.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-next-20250516.orig/Documentation/doc-guide/sphinx.rst
> +++ linux-next-20250516/Documentation/doc-guide/sphinx.rst
> @@ -28,7 +28,7 @@ Sphinx Install
>  ==============
>  
>  The ReST markups currently used by the Documentation/ files are meant to be
> -built with ``Sphinx`` version 2.4.4 or higher.
> +built with ``Sphinx`` version 3.4.3 or higher.
>  
Applied, thanks.

jon
