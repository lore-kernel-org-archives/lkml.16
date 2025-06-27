Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05511E1A31
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751003962; cv=none; b=NdNiMOVQD4ewNITKrjGp33MbRgNimwmEceB6ElTMFjVgObVE67vXjNht5V1sHpZdsac6S+hHvpqogJvdwb4keSGAG17sTrl4kvwGedVCACr1/9dKFheuWS7h7JfgsbQUyFHclAh3oDeUnRw6i4okfQ2VsRiHRzqJPM78Bg+EWUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751003962; c=relaxed/simple;
	bh=5pZO41QhZsACwzNP7hZabRK+rKPydjFhgDc8SXyTs1M=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=VttBSBmJrHGMAvLcGsl4kKnnPHDuTr7MFYkeNB3XpoxT+FeZ+DEbCURU7vfQtx2rfUbTSDTBJr3bwlRzXbQy9Gw7Jy0E+kpq42qElDFGfAOF3RFR4Y1f0Bi4Lh6XWkTIdKGt9KgaFk/qe/j99oDdqiEZ73U5QGo7dXTieF/KJyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=HnNolEAz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cTC8zpWW; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="HnNolEAz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cTC8zpWW"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A44A8140014E;
	Fri, 27 Jun 2025 01:59:18 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 27 Jun 2025 01:59:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751003958;
	 x=1751090358; bh=x9Y1/z1qsO2wW4zgtUnEKvpNzjgHl34uKsWIYHMwoU4=; b=
	HnNolEAzfHblmA3uYTAc9Qu0NqSkm79PNxfDxbRHZ/bijZMj6KPBI0GVf6MfrENe
	fGpaz68zja3GThRZK0woOidNbAqKAIsXlDfdMgeIwVHv3WZTc4ssDcfUb8YuMWTL
	1qowODWJNdLRtTaIMCqURLFGnWtYynVkg3DwARANVchI2VDyhR7q8BgmC7OejOnK
	jrmP8azdXRdmMB2j/IapL+4EX+raek0xQzdMjHVPOJ76cNvEKkW4L8TQn628aX4c
	5G8zVh1yjnd4x9WYZqneejgFq7Rk2paSAIEQZzQgEH+Vs4Gu9fuxJd7GLmk1c3Oh
	iYOUBe7JjI1OyxS28U/lQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751003958; x=
	1751090358; bh=x9Y1/z1qsO2wW4zgtUnEKvpNzjgHl34uKsWIYHMwoU4=; b=c
	TC8zpWWjyOGVjBPyvs8vmhHdpsEXWrLFyLLwv/bbVv65VQKi1nbWhQodQ2nTropf
	OY2uM1vzgtB0Y2aO2E6ZCsIZoiHOvnYcN+LTY3OQhbVb6TF9JwDp9itQHKd5Xu6j
	C956xCkxDwyImUuELJ7HtePKIuxdQkvE21jVQNpdF+5dmKLFt+ssrLkcgaemBqSy
	RQDA6ggZTStdHaLde4CbfWsGZmFM5lzzlQppd5j5WmVm6KQKvVS5jyAFAb/4fkH1
	i8fAxXRH9Q8dQxVOn+hhhQza2V7k+t4g8QMROHTp31+bb207FpXxjhOTnlkJvVPi
	+A7o+I6PVKZj0fN53ZI0Q==
X-ME-Sender: <xms:NjNeaAWR62-zlti5oLbX1ozDRgneXnH7paHz6tQlYfA_vYWbzfugkg>
    <xme:NjNeaElZKZoRdMDbwcsrdQbXvg5sj2__X2kTrJv8CdLSMEWQ46tnPhUi_JFPqBFdA
    oVxN1t2UxIf15jeo24>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleejnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
    grrhhnuggsrdguvgdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepfiesudifthdrvghupdhrtghpthhtohepmhgrshgrhhhirhhohieskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdifvghishhsshgthhhuhheslhhi
    nhhuthhrohhnihigrdguvgdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigseifvghishhsshgthhhu
    hhdrnhgvth
X-ME-Proxy: <xmx:NjNeaEbyfl68ILDPf7s1mqfOIUmEdbiKdYWHVKMv7elB9b3UY5Ffow>
    <xmx:NjNeaPV3I5u21hEyw2zycj0AhMlK4EhCSg4CvIVGU1hDYT4M0pprSw>
    <xmx:NjNeaKn1_zPFIFOaeXNY2sbIXVHRZQYOXFnsNcjJ6MlrTeYneDqrKg>
    <xmx:NjNeaEcLZKEf9ezm3cOMW9a9ZVVCIzMEdF8cibNNBK9K11NY3t49fQ>
    <xmx:NjNeaLq1MmeghfGradsyXjOseVO-T-rL4VGFYugJ9XSlxx9eLoSkSY2E>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4EE10700065; Fri, 27 Jun 2025 01:59:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T7363e6af6027e1df
Date: Fri, 27 Jun 2025 07:58:58 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Willy Tarreau" <w@1wt.eu>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 linux-kernel@vger.kernel.org, "Masahiro Yamada" <masahiroy@kernel.org>
Message-Id: <50dc2d72-79be-45cc-add9-82c76099cfe1@app.fastmail.com>
In-Reply-To: <20250627032551.GA4224@1wt.eu>
References: <20250620103705.10208-1-w@1wt.eu>
 <20250620103705.10208-4-w@1wt.eu>
 <92eda9ff-116e-4ec1-930c-7474da9652fc@t-8ch.de>
 <b14da196-84cc-4d13-baa2-952ba22f5a3e@app.fastmail.com>
 <20250627032551.GA4224@1wt.eu>
Subject: Re: [RFC PATCH 3/3] tools/nolibc: add a new "install_all_archs" target
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025, at 05:25, Willy Tarreau wrote:
> On Thu, Jun 26, 2025 at 11:15:07PM +0200, Arnd Bergmann wrote:
>> On Thu, Jun 26, 2025, at 22:18, Thomas Wei=C3=9Fschuh wrote:

>> If it's indeed possible to concatenate the path name (I couldn't
>> figure that out either), that could also be done in place of the
>> symlink but simpler than the #if/#elif/#elif/... block, like
>>=20
>> #include <arch.h> // defines ARCH_PREFIX
>> #include CONCAT(ARCH_PREFIX, ioctl.h)
>
> I have never found how it would be possible to do that, let alone in a
> more or less portable way, because #include doesn't take a C-string in
> argument but a special syntax which is specific to it ("x" or <x>). It
> doesn't support concatenating strings for example:
>
>   #include "stdio"".h"
>
>   $ gcc -E inc.h
>   inc.h:1:17: warning: extra tokens at end of #include directive
>       1 | #include "stdio"".h"
>         |                 ^~~~
>   inc.h:1:10: fatal error: stdio: No such file or directory
>       1 | #include "stdio"".h"
>         |          ^~~~~~~

This variant does seem to work with gcc and clang:

#define ARCH i386
#define __ARCH_HEADER(a, b) <a ## _ ## b>
#define _ARCH_HEADER(a, b) __ARCH_HEADER(a, b)
#include _ARCH_HEADER(ARCH, stdio.h)

Or even simpler

#define _NOLIBC_ARCH_HEADER(file) <i386_ ## file>

The ## concatenation is a bit limited here since cpp requires
both sides to expand to an identifier, meaning you can have
a '_' next to it, but not a '/' or '-'.

      Arnd
