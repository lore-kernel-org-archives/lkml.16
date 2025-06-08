Received: from mail-106104.protonmail.ch (mail-106104.protonmail.ch [79.135.106.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761D93FF1
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 05:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749361778; cv=none; b=rZdmIQKfBXhbt6FNfyVSCz2OITH+EOHd5ZxvrHbq/b9qzdnj7juG1go/Ow3ois4reqhIPkg0PuSn81ecMEnpmTTyDAbaCdko0Q4BoHZgUhEWSrZ2+oj8DMFIVEXbK+zLbTGddIm7YbJ3T/gVItsGg7/scS6TI2mLMb6Xsok/ogI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749361778; c=relaxed/simple;
	bh=pbmsNz5qGcxG5a2pI5MXmXVrYQ2k24O0ZmECDl4UH3Q=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MUbD1PydGSpDst08XJSs+buL+kgBw/wk2AjjHTBQ6QH7QKlv0cpm3FDkGtWMAcj3jlYXaPfhQmDUt6qrhglIwQzplO3//oa3slZQo9PUp+qmXj6s8+9Rzivo6Ct21Lcc6PZd6FapX5tppucSovlrZDedR2VGYIvzfo/5PKn4Rsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=JvwDWqe8; arc=none smtp.client-ip=79.135.106.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="JvwDWqe8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1749361766; x=1749620966;
	bh=pbmsNz5qGcxG5a2pI5MXmXVrYQ2k24O0ZmECDl4UH3Q=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=JvwDWqe85IoPa9EDvMDx7n0gouwtWcbKFLASU4sjmblBtFziP69xV2TXs/CjGwGJf
	 sc/8XVTMYRxrE5PJqDe0xO4s8MZippVOG7zZPdmpzWq7BHNi2T7OZzNvJ1qkYQviBI
	 20o9dcq85Ry0xmRyPEeJ87tSqaSCa6MeLBejjX6qpfxYE7t4JVNJKv1pt8YaWw5cxw
	 mcsKfviDzP1fWQmrqpXYtLPQL/31VWLmRshPwtAGxq5/sE72T3s6bCLwVGZvlCTON3
	 itBnpZKOucHyofbQwESyOtxKxur0YdJ3jPmwJlm9DCBDdH490h8nvnL/A4u0Lef0A+
	 ZgCJ2MzuMHKGw==
Date: Sun, 08 Jun 2025 05:49:22 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: Recommended backup software to clone Android (Linux) phones to image files
Message-ID: <iblyiEY3Qp_2IdrHk1_2fonb-x_fEyeqCqq09cyHUxirczjbAo29kIXhD9XZllWvopUt9sNXXdKP66PRuVG8ObHt8vwQjUjyCuXOjUxff6U=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: b13a4ba5f5944cf2c334301f1aac1de01546ab69
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: Recommended backup software to clone Android (Linux) phones to ima=
ge files

Good day from Singapore,

Acronis True Image backup software can be used to clone Windows 10 and 11 t=
o image files with the extension of .tibx.

I am wondering if Acronis True Image backup software can be used to clone A=
ndroid (Linux) phones to an image file?

If it cannot be done, what other backup software can be used to clone Andro=
id (Linux) phones to an image file?

The recommended backup software should be cheap and affordable. Ideally, it=
 should also not be very technically difficult to clone Android (Linux) pho=
nes to an image file.

I want to clone Android (Linux) phones to an image file very badly because =
the Singapore Government hackers keeps hacking into my Android (Linux) phon=
es every day 24x7.

Please recommend a good and affordable backup software which would also be =
easy to use.

Thank you very much.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individuals in Singapore
GIMP =3D Government-Induced Medical Problems
8 June 2025 Sunday

PS. Is the Singapore Government trying to divert my attention away from gov=
ernment-induced schizophrenia and lots of government-induced health and med=
ical problems by hacking into my Android (Linux) phones and other devices e=
very day???



