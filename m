Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C471EF397;
	Mon, 23 Jun 2025 08:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750665766; cv=none; b=GyXZr6foALkdikvp40xbmAiIgCDYxYgIsIcrpQtoyzE6ALN+GcV2Iugr+jeNSBv/ZN6XaMOnTJGxEQZ6J4WDom3H2+NoLwFbgrJ8ccoHxpFapR5TlRkCMx2a684wlYulmtNi36CFTTloTVjeTrCJKs0/wr20f8s9w4Uow+rduaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750665766; c=relaxed/simple;
	bh=kaKMiOfkpWRbEg4xy0UHOKVBR0HGVHBUXNQOVBQDt8k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M+c9te1EbM6fOFWNMeuqiCcIM4c7BAUYFoZXa3Wv4AEefd32yhjLW6qhypWJl3sZL3Z0itDf8Y1d1neF9j1S6/yQgugR+KpgYkVD4fahGiBQxUr/6SblR7VOc69k8bHkal7bvHd3mnikddw4UUWLG4Iq1aR4zJolIJJKUbu+Q6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=OdKW2lTT; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="OdKW2lTT"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bQgY60DXSz9t7R;
	Mon, 23 Jun 2025 10:02:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1750665754; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kaKMiOfkpWRbEg4xy0UHOKVBR0HGVHBUXNQOVBQDt8k=;
	b=OdKW2lTT0fak8lbZBZo1JVCGBadhgLBIf1cPLMoWi2TNTU9jGzX7j+IfEPacIjp4m813vS
	nq8WzByKTiLbJridcZGMNc1Qutr4k0O5ixfDTzM8JUHqMNdReCu3ffZo0lTzSmzFcn1vIp
	7RgrMJbHGeQLtPCmWzXwoQaDYWNUpfkz5iw+PwS1hRB63H8VNLT4il/aMyxklurn2CjYdF
	urOR9AEL8Ty4me7XBZVuW0irtVRQq+q/nJ8r2QFc1qrmtgEIMSdta0wwjPnsjHLNoLy+Df
	KJO30cem0LPwaPjRIpeCq/PrNxdmbdBuf9uAJe15im2ud9xApT3oBeXgEsy94g==
Message-ID: <3c6c7fb03375bc4532c3a6af65d78226cb5b9281.camel@mailbox.org>
Subject: Re: [PATCH] ALSA: intel8x0: Fix incorrect codec index usage in
 mixer for ICH4
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Takashi Iwai <tiwai@suse.de>, Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: perex@perex.cz, tiwai@suse.com, phasta@kernel.org, 
	andriy.shevchenko@linux.intel.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 23 Jun 2025 10:02:30 +0200
In-Reply-To: <87msa0w2f2.wl-tiwai@suse.de>
References: <20250621185233.4081094-1-alok.a.tiwari@oracle.com>
	 <87msa0w2f2.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: t8hj9ekz7785xogwracs9dwf1sz3knfh
X-MBO-RS-ID: ddf59aad599939980fc

On Sun, 2025-06-22 at 11:28 +0200, Takashi Iwai wrote:
> On Sat, 21 Jun 2025 20:52:24 +0200,
> Alok Tiwari wrote:
> >=20
> > code mistakenly used a hardcoded index (codec[1]) instead of
> > iterating, over the codec array using the loop variable i.
> > Use codec[i] instead of codec[1] to match the loop iteration.
> >=20
> > Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
>=20
> Applied now.=C2=A0 Thanks.

Shouldn't that have been a bug fix with

Fixes:
and
Cc: stable

?

P.

>=20
>=20
> Takashi

