Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2101E47A3
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 21:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750972532; cv=none; b=sh6XiGfe2EhcDp9vq92fCabtU71eKbXoWxIHU7H6g8MyVMP5fV7jxRUmdeDtrm4VGaiGLnm/bJ8/8by/lrbRJ2oc2d+7IGOD3mM/ALXNt+FUs6P79UX6t6gFLCE0wYSNsX10au6ZKXkRw9sn1AVG/ExJBEv38GJa4c0yWlQAT7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750972532; c=relaxed/simple;
	bh=Vr9fIHjcv9JydDC6SFVXUvOSqLY4I+yeRoV7iovDQ7Y=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=oP+pL/D88C2Nkqn5y0Ub4OzBEPjMEF5XnIOOLZhavGdlDu6jEDXWaEMerXBt8TecARVu7H3/5gow12ygonSmFdZPedExLF2ZGHOa7k77e4ACNd5pK+jHG4pOsk83d5A5CZ0HCkv+f/wb9iJcqwlL3QxRpFJaCv/Xqp1e4ozQ8wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=g/7U6gsw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lr/9cOXY; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="g/7U6gsw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lr/9cOXY"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8A7507A0220;
	Thu, 26 Jun 2025 17:15:28 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 26 Jun 2025 17:15:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750972528;
	 x=1751058928; bh=9BfmrdO7/IPqM9w//P/ArNGREQB098RTJB5xFko6MN8=; b=
	g/7U6gsweZdWAwU7tE5b4+2vYF7mRTA8Y/0dnFH2WwYN1m34/TS5HsGlI+rnEwNy
	Xr1m5xZpzGiNBQTW4okWkNlY7QSy/PO+X4BQBt4Y3YO3uJrMWcOgYGxDX9I4Dpb4
	c+q4ooklYnGqP6HWIVM+9RQR1mNGwBmPoV0E76BeO/hm7FrpmUw0XmBoo3WClai7
	pLA9Yuqi1fq+S5uc1k53TCcnIl0JoWzDvJNshA675/RbzrcfgDanwRLsOrQ2Samz
	btU7pMXYzZmLrFtAm1xdRJzyguAa3mcOrPcJ45gGebOXKPzZPpB+nHoGdvYigCko
	Wh6EEZnFsTCHorcfM0sjBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1750972528; x=
	1751058928; bh=9BfmrdO7/IPqM9w//P/ArNGREQB098RTJB5xFko6MN8=; b=l
	r/9cOXYxpQKBFOm+hjliIYgyqBScEw94SzlsoYecSem1FfyLYZm0z5SuYnLf7ERC
	YD5EtZnSQQCwzujv5AUb4CunkkpU9JXACUlXr/fnZjdnXKHwZNwMZhOxU2Z2TrwS
	SYqXauSU5fZJNwZF0Y++ytspUdIA2yXxzNN24bR63XzGgzOexbPOOe0HdfxLzKuT
	yztfqTxdWZrLKgV2dcWNk6d+wUECumwGYnenbjN/1V6RJCnkIKu4xq3nL9JZKuYM
	PuKcNDy0Qfiq2ir7IrPTFwz9zoYGpMN1BgJx1/Q0Qv8yYRhn7/IYeGTtk+dKo9ho
	GXe77jZ1X7MSI1YfXbFYg==
X-ME-Sender: <xms:cLhdaGXB8ArfOUJOOci-ddqG7L35yJ0VYiFtQxjAtOXTR0KPwCU0Mg>
    <xme:cLhdaCkyVR2hq1bNFG_21UI3FjsQM-17HQNBlfRrZQnclODiR59xvUMvTrWKHq_of
    y0He_iLYocxB5YSiIk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdefucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:cLhdaKaJg8tmlE4cj7CrkTQHhVASSMykzdZKTlILZZD8BlCpLM7YPw>
    <xmx:cLhdaNUrmPKHPDpbE78mnleS1nJgR2IWhlX5gYRLcoii4kMpG9zElQ>
    <xmx:cLhdaAnMy1z9Ws4X2rJtB7HSZ2T1ekc6V2BYH6JgoJ276FZofjJgFA>
    <xmx:cLhdaCeSSAMK-WoRS9XQ8G7Ji8UIlZEc3470lNefrakdelu2MUTShg>
    <xmx:cLhdaBqh37Y1A0SVfbi5Xurcy4gsWO_G4EsUN0kHOlx12kl9gqNXIvQ5>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EFC8C700065; Thu, 26 Jun 2025 17:15:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T7363e6af6027e1df
Date: Thu, 26 Jun 2025 23:15:07 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "Willy Tarreau" <w@1wt.eu>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 linux-kernel@vger.kernel.org, "Masahiro Yamada" <masahiroy@kernel.org>
Message-Id: <b14da196-84cc-4d13-baa2-952ba22f5a3e@app.fastmail.com>
In-Reply-To: <92eda9ff-116e-4ec1-930c-7474da9652fc@t-8ch.de>
References: <20250620103705.10208-1-w@1wt.eu>
 <20250620103705.10208-4-w@1wt.eu>
 <92eda9ff-116e-4ec1-930c-7474da9652fc@t-8ch.de>
Subject: Re: [RFC PATCH 3/3] tools/nolibc: add a new "install_all_archs" target
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025, at 22:18, Thomas Wei=C3=9Fschuh wrote:
> On 2025-06-20 12:37:05+0200, Willy Tarreau wrote:
>> This installs all supported archs together, both from nolibc and kern=
el
>> headers. The arch-specific asm/ subdirs are renamed to asm-arch-$arch,
>> and asm/ is rebuilt from all these files in order to include the right
>> one depending on the build architecture.
>>=20
>> This allows to use a single unified sysroot for all archs, and to only
>> change the compiler or the target architecture. This way, a complete
>> sysroot is much easier to use (a single directory is needed) and much
>> smaller.
>>=20
>> +	$(Q)rm -rf "$(OUTPUT)sysroot/include/asm"
>> +	$(Q)mkdir -p "$(OUTPUT)sysroot/include/asm"
>> +	@# Now install headers for all archs
>> +	$(Q)for arch in $(patsubst aarch64,arm64,$(nolibc_supported_archs))=
; do \
>> +		echo "# installing $$arch"; \
>> +		if ! [ -d $(OUTPUT)sysroot/include/asm-arch-$$arch ]; then \
>> +			$(MAKE) -C $(srctree) ARCH=3D$$arch mrproper; \
>> +			$(MAKE) -C $(srctree) ARCH=3D$$arch headers_install no-export-hea=
ders=3D \
>> +				INSTALL_HDR_PATH=3D"$(OUTPUT)sysroot/include/$$arch" >/dev/null;=
 \

>
> I'm not a fan of the loop to build the ifdeffery. It is a duplication
> of what we have in tools/include/nolibc/arch.h and horrible to look at.
> Can we stick this into a reusable header file?
> Something along the lines of this:
>
> 	/* asm/foo.h */
> 	#define _NOLIBC_PER_ARCH_HEADER "foo.h"
> 	#include "_nolibc_include_per_arch_header.h"
>
>
> 	/* _nolibc_include_per_arch_header.h */
> 	#if defined(__i386__)
> 	#include CONCAT("asm-arch-x86/", _NOLIBC_PER_ARCH_HEADER)
> 	#elif
> 	...
>
> However, so far I couldn't get it to work.
> Also it would be great if we can use it for the current arch.h, too.

I'm not sure either of those is better than the version we
had until commit f3c8d4c7a728 ("kbuild: remove headers_{install,check}_a=
ll").
which simply relied on a symlink to the architecture specific
directory to be set.

If it's indeed possible to concatenate the path name (I couldn't
figure that out either), that could also be done in place of the
symlink but simpler than the #if/#elif/#elif/... block, like

#include <arch.h> // defines ARCH_PREFIX
#include CONCAT(ARCH_PREFIX, ioctl.h)

      Arnd
