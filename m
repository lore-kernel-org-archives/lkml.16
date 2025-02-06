Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1D92417D3;
	Thu,  6 Feb 2025 23:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738885718; cv=none; b=QZiro98PPgBymjlDAPyZqvoTuat11+MMcY4b8w2ngnf1HWTd4prMAP9/K3EGqNrWF5BzAsodowFGxwCI4YwB/mj5USpxH0i2ZH7xd6HegWLRW504lgCcuGuxwLKqgMlggBWF/2PlitCf9c51eDDzTrYHjYgteZ/sz+P1K7A9ShE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738885718; c=relaxed/simple;
	bh=55yXgormICt1STeAJtH0+SxMpKazdX3WK42TpJe/cgQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HpCsghUtCMj4r1QxLiqVfrd3osxaYh9WEQ0+ZeUG9NMJdL14Lx3WlcBlriEqT8bLqELpcTBeuCjnv8nC7ZD6GDkNxWM2RDozgwCXqncTvNEho9iTPt7gjeA089J3h7cVGCZvHRtSeleAItZoTw6yNZnnnDIg0iVT+apCbUD83rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=afVgT+4+; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="afVgT+4+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738885713;
	bh=55yXgormICt1STeAJtH0+SxMpKazdX3WK42TpJe/cgQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=afVgT+4+pgyKo0XLPWREuk4x5qEBAuGjtxG5YlL0Heo/G9+Zbx3BPuj/bj4McTOHa
	 kJ3lezAN/aN3U4/tJUtWpRN3m+0FgdxpNmFjkfGlO3HHNEvrabJC14OzhYU3ewoD7o
	 njjM8zFPe4YAQPAzpkFDpwDysr9v+b8/WSX1FuNDrigH8dyIYflA93kN0V5/yoL3dy
	 K2/36d+XYYxjB5+Y+CSz9HHRwrhX78n7wVms2zhjg08Mcm6OTWDRvlgTodtPqowVIy
	 Y1o/y61YAsde1UAghmcmtcBGmxe4TegOOjO0uB30yCue9Y0vOcHmzeJauWMUb4kAWH
	 hKVRQV0HmK+fw==
Received: from [192.168.68.112] (ppp118-210-167-20.adl-adc-lon-bras34.tpg.internode.on.net [118.210.167.20])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2EF0574A98;
	Fri,  7 Feb 2025 07:48:31 +0800 (AWST)
Message-ID: <9f0447151e6574d74e7fa9cbbb50d8e970059273.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.6] A backport request for SY24655 driver in
 INA2XX driver for Linux kernel 6.6.
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rush Chen <rush_chen@wiwynn.com>, openbmc@lists.ozlabs.org,
 andrew@aj.id.au,  Guenter Roeck <linux@roeck-us.net>, Jean Delvare
 <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Date: Fri, 07 Feb 2025 10:18:29 +1030
In-Reply-To: <20250206030747.268165-1-rush_chen@wiwynn.com>
References: <20250206030747.268165-1-rush_chen@wiwynn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Rush,

On Thu, 2025-02-06 at 11:07 +0800, Rush Chen wrote:
> From: Rush Chen <Rush_Chen@wiwynn.com>
>=20
> Summary:
> The driver SY24655 has been supported by INA2XX driver,
> since Linux kernel version 6.13.
>=20
> Issue a backport request to Linux kernel 6.6.
>=20
> Signed-off-by: Rush Chen <Rush_Chen@wiwynn.com>

From the way you've structured the subject prefix I expect you are
asking for this to be applied to OpenBMC's kernel fork (openbmc/linux).

If that's the case, this patch has no business bothering upstream
maintainers (Guenter, Jean, Jonathan) or the upstream mailing lists
(linux-hwmon@, linux-kernel@, linux-doc@). The only people this should
be sent to are myself and Joel, and the only list it should be sent to
is openbmc@.

If you send a backport patch for openbmc/linux and are using `git send-
email` to do so, then in nearly all cases you should use the `--
suppress-cc=3Dall` option to make sure upstream maintainers and lists are
_not_ automatically copied on the mail.

However, if you wish this change to be back-ported to an _upstream_
stable tree (e.g. the v6.6 series), please _first_ familiarise yourself
with the stable tree rules, satisfy yourself that the change meets all
the requirements and constraints, and only then follow one of the
documented processes:

https://docs.kernel.org/process/stable-kernel-rules.html#stable-kernel-rule=
s

If you have any questions do follow up with myself, Joel and the
OpenBMC mailing list, but make sure to exclude the upstream maintainers
and lists for now.

Thanks,

Andrew
