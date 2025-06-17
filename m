Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB93202C48;
	Tue, 17 Jun 2025 06:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750142266; cv=none; b=QgrjN7/ZhbvDRHtmNMKuss9S3sHoAaCKMf3n5lmT3wbB+hokn3ssICPMIi2MPLN89OH9gaMqBikByC1MvW5VUuMCb+QwKnn386xrvVEVXZitveez9khbHBnFSwfyyohdus/9gTDPPowHDB+qtZoOZN6XYqV6iDPoPxhQliuSQtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750142266; c=relaxed/simple;
	bh=0syMiA1wj686DYdM/JE2Bhmx1ELKVcChRIizkUG5j9E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JBDTpaZSpYiXhel1AndJLAQ7wrRly4NsSCyN8DMnOAfrg+2oofMimNtCh5wz4nHxU4f20Lmgb0qWAHDCiCgQaWkeyVUTmQUzumHUwskA3CS6MyGOXWfqs2mR83BwkOKL2jN1+gss6GCsS2CAMma7u7qPiMRwUmovXxdNmM/G1zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=hK5setuy; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="hK5setuy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=MtYHNp8aAYCgkeanBg8ddRHBfnD96tPaecDXDyyDoRg=;
	t=1750142265; x=1751351865; b=hK5setuyuW1b5QHmFdjJUdrU8XHt88I+QmDm7ofVvv9Nf04
	h4bm8EpamSgb1KbohI2nYhoH9Ffezsre1bS3nfSQawHUAxZBWwwNPIdndMSbwFYgTsbmhqef+vPBv
	42pxL/gofg/8NZOj9xpMVwslNZZ5oqUlIMwgn5It+RgoSHeAPMlJjCdEJnPY690J2x95m0xXzL1A1
	AHsDmCMTxx+MB/6clyat0tvl7HaD7AOw6yH2h6ynQXzrdNRux2lGtnq+y3/WO/Sjyj2pi3zgp0hoe
	NnpHpm8z//TAxab485VJir5qB8dkCaQtmPWUNL6/b1aqURMrjfuXVFfQtiaHSqLw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uRPwt-0000000DxWc-1HS8;
	Tue, 17 Jun 2025 08:37:36 +0200
Message-ID: <59c92abd11fdc0ba0a30c174cabc749cf74cb717.camel@sipsolutions.net>
Subject: Re: [PATCH] sonypi: add depends on HAS_IOPORT
From: Johannes Berg <johannes@sipsolutions.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@kernel.org>, Niklas Schnelle
 <schnelle@linux.ibm.com>,  Mattia Dongili <malattia@linux.it>,
 platform-driver-x86@vger.kernel.org, linux-um@lists.infradead.org, Hans de
 Goede <hdegoede@redhat.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Date: Tue, 17 Jun 2025 08:37:30 +0200
In-Reply-To: <20250615183642.902070-1-rdunlap@infradead.org>
References: <20250615183642.902070-1-rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned


>  config SONYPI
>  	tristate "Sony Vaio Programmable I/O Control Device support"
> -	depends on X86_32 && PCI && INPUT
> +	depends on X86_32 && PCI && INPUT && HAS_IOPORT

I sent the same fix b efore, but not sure it ended up going anywhere,
although Greg said he'd pick it up, I think:

https://lore.kernel.org/lkml/20250606071255.7722-2-johannes@sipsolutions.ne=
t/

Anyway don't really care which one gets applied, they're the same anyway
:-)

johannes
