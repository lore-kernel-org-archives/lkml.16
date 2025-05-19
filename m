Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABC52AC17;
	Mon, 19 May 2025 11:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747655531; cv=none; b=Orb2qqUvJ8FaWeZGuFAZMWpG1xv8TQWJ0xR42dfWpmx9VuHOpiFP3aXpAl+leJj7i9fIyjeQSJhmRjWlEHMmN1mKfOCpfeFAuv7uLayVnERS9RGLfS3RWLxqRwk9rde+RVyvqAP+nkJuLmzmdfBg0Yf7ewh7XxUMo9jM8laMshY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747655531; c=relaxed/simple;
	bh=WhfYD8BZF2exgNOUZ0BwMjfXArtwVKPVofntBiajQSM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GA4UYe/JdOlgnF3CxiaUIUiFux2IH9B4wf20ZXVyNTrPfvSzEXpQ83yyNWdiFMQVNpRD74X8fhEJ/kDBkfGxsi5btkqX81cQggt72vJfJlbRzueAj2lwFF3Pv0lbzgrIXUaBKkql+5GyqbFK7xajmgL7NUGrKDFRb2ljFsewfdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=jZ15FRN4; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="jZ15FRN4"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B5DD841086
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1747655529; bh=AIx/ClbAO7AfFBm4+Qx+I0G9FV/NMyJENufEqJzBeUc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jZ15FRN4KSPJdXIT9jItCQ++D2n8u3UIIeLvuuuHhVy2dJVJNuvROYPbU0PpjuZEH
	 0eVDXEsRSJK+4rXq+vFiatPkfwlLr1j8CGLScVzDMSuOCMLBb7Qeo8Q/3i/RAi5mHx
	 d8GM/zCat1QX2dYXD81XJMb2tLZKpqw0gI6CTMG4uSGJ8ikZ5SMmCYrUVO+INSe6Va
	 Jt9vZfcH3fN7r8BwCcI43CkTQrC7RPekbfxeUziHGQYlaJulM6bNV/5trv/v0h/5HY
	 5cnOtQyZohgEBuqVfJcoYL9gaPU8inbk7Lv/EKY0I+BuJq3ojkqtTZNu1B/ARme8iw
	 HRVJs2vzOZt3Q==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B5DD841086;
	Mon, 19 May 2025 11:52:08 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH] Docs: driver-api/basics: add kobject_event interfaces
In-Reply-To: <20250509005538.685678-1-rdunlap@infradead.org>
References: <20250509005538.685678-1-rdunlap@infradead.org>
Date: Mon, 19 May 2025 05:52:05 -0600
Message-ID: <877c2ckeca.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Add the kernel-doc comments from lib/kobject_uevent.c to the
> "Kernel objects manipulation" section of driver API Basics.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Danilo Krummrich <dakr@kernel.org>
> ---
>  Documentation/driver-api/basics.rst |    3 +++
>  1 file changed, 3 insertions(+)
>
> --- linux-next-20250508.orig/Documentation/driver-api/basics.rst
> +++ linux-next-20250508/Documentation/driver-api/basics.rst
> @@ -108,6 +108,9 @@ Kernel objects manipulation
>  .. kernel-doc:: lib/kobject.c
>     :export:
>  
> +.. kernel-doc:: lib/kobject_uevent.c
> +   :export:

Applied, thanks.

jon
