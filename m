Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43111448D5;
	Thu,  5 Jun 2025 16:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749141169; cv=none; b=ZmpiGsPrPwMYxxx6JPCGWmMPv9WKFpqFlziNvzPP/HtIVvAQcWncNTfLDfcBBfm7TUKRAgSrToIygxkrz5T7YSrwrZC+3EF6V+uwidISLZyktoNjQHG5VN6j5OQPANnQ2GBlVUlzIL61IL3roZL+gs3kNHwATNadBFFOcyUtT7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749141169; c=relaxed/simple;
	bh=lSb7wgm6+3MfS+rydqDdOOpXcLux/y/tdAxLtmOvSVY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kUaaFoLzoLQx5szP35qlX02u/NSYmM3WTimMbpLDPdVowXm5mTwJ5qzkKgTY9lhMFVR9BWh0o1U3Ky6yxw4QYsqxl35iJDyyVxX5afjY6KftU7CQE/284RaG0I3exdWP2C35yjlBjFqpWii4PXMiG91kYhfCypBsADpdWB6Am1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=cvwKX9H/; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="cvwKX9H/"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 593D341A90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749141156; bh=uxbiOAzkCQNLdUAja8Z6ISHzSjpr7WzG2KMheQzzyTo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cvwKX9H/IAFowItpNKc+spjCtBsIenWLsqxUVorgcBTTIw9KNsAfoA25SnHOUqS7v
	 UrSUbRuYmRrQQ5Kt04cwErVJcBH5JIbcWsT8gZlsALCTFDfTX4iaB9vBqaa2DJeP3F
	 xRMCg6naOmzTQ0CDwUB95fNV70FqAEHB3ZrBMT7UfXocmR4zsWScGLxxVj/ucFVi56
	 eIa79/q6olbaiK8SRp85IGQRpbZT+n92TaLjfsvYhhNky3NDaJlZFQ4w1LHHAlbaOe
	 wnaIMEd5/2GaJquA2iv0cuQyOfg8sgm6e2h0Ddca2WdUNe025yN57dMjTHA/6JGSOP
	 QPim5XObVqF8w==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 593D341A90;
	Thu,  5 Jun 2025 16:32:36 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Mauro Carvalho
 Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2 0/3] docs: some automarkup improvements
In-Reply-To: <ebeb020a-8403-441b-ab02-f017ffcb7b83@notapiano>
References: <20250604143645.78367-1-corbet@lwn.net>
 <ebeb020a-8403-441b-ab02-f017ffcb7b83@notapiano>
Date: Thu, 05 Jun 2025 10:32:35 -0600
Message-ID: <8734cegndo.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com> writes:

> The only other thing I noticed is that the links in the sidebar still use=
 the
> old style, since they rely on a different CSS selector for some reason:
>
>   div.sphinxsidebar a {
>     text-decoration: none;
>     border-bottom: 1px dotted #999;
>   }
>
> That makes it a bit inconsistent style-wise, so I think it'd be sensible =
to
> update that selector as well to follow suit.

Sigh.  Of course, making it exactly the same doesn't work well due to
the shading that we already use in the sidebar.  Since we know
everything in the sidebar is a link, I suggest something like this:

    a.sphinxsidebar a { border-bottom: none; }
    a.sphinxsidebar a:hover {
    	border-bottom: none;
        text-decoration: underline;
        text-underline-offset: 0.3em;
    }

That makes the sidebar relatively uncluttered, but still lights up the
links in a visible way when the pointer passes over them.

Thanks,

jon
