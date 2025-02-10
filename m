Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C75722F16D;
	Mon, 10 Feb 2025 14:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739196270; cv=none; b=hL/qxPSHYABvIJ8mn1JonerOMbMrg2NOnOxWUs6ovwKJJAKZDaJGC7rUGpwjoqSNXQy0QSax8rE5C3hG9NJGQogTttPXeujphE/pK+DRXktqB7k9ELFNfGul61lTqUpp56Tr9iZP/G0EhKfn0SD6ORCs2mAnMrKH7T6+5FYmsz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739196270; c=relaxed/simple;
	bh=530cEWB/iUyOXf2BuCAkA6Zdb/i/eyD6p5TbApfPjtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HC1gL958yeNwHdidSjgEo1/WpyukEZPTd66gnHeOfayhkTXgPbZyrWPOxwHHaT/HbF7bFRAvMViCpAbw0O5YB4sLZFx52hPF4UbyfNDGAaaufLkActx1Y925UhpozygjNlKayukI7CZn0ohJCX/bLK5LNkdIgIhsFY6AQ0ZhCos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=2y259NvN; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="2y259NvN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UfuBIcq6o6pd5Lky7KHDHxvpQdqj4uIwbsrsWkRv4y8=; b=2y259NvN7jKxSqKZofA185dq2o
	enK8KcFyHAimIMTX0cygzP3gW5BXHU98khsVCAAw3cZXywfXhHFuWS+YT+2SNZkIzZqjD1NDdnjxD
	XC5fezOqRRhoBDtwcb0zf1mYK2yET2BrphLt10XNzKUTtBYqI6PvzSLJr0kUHwACeXPPESMAlqHbx
	wdX6eR7HNTChazp8xGXMXgXK4Cdfb5wIKTe8dU1DeHp8DUhFyWcFKh5QCVpvjvY1KxH6GXhJ7Y9Uj
	5Vs0G2alSTwv+Hlg17R1mh1SgdKIrd9D8HLgETiH6QQBnQ4AbNQaV2mkJbLnU1zMcYMhwZRiNcnWY
	OPNU8jHQ==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thUOc-0003Qo-V6; Mon, 10 Feb 2025 15:04:22 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alexey Charkov <alchark@gmail.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/3] dt-bindings: ASoC: rockchip: Add compatible for RK3588 SPDIF
Date: Mon, 10 Feb 2025 15:04:22 +0100
Message-ID: <870305083.0ifERbkFSE@diego>
In-Reply-To: <56d128d7-c4bd-48de-b823-0b88147220e1@sirena.org.uk>
References:
 <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
 <4315116.iIbC2pHGDl@diego>
 <56d128d7-c4bd-48de-b823-0b88147220e1@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Mark,

Am Montag, 10. Februar 2025, 14:20:58 MEZ schrieb Mark Brown:
> On Sun, Feb 09, 2025 at 10:10:47PM +0100, Heiko St=C3=BCbner wrote:
> > Am Montag, 20. Januar 2025, 10:01:27 MEZ schrieb Alexey Charkov:
> > > Add a compatible string for SPDIF on RK3588, which is similar to the
> > > one on RK3568.
>=20
> > as the binding is more in the driver-realm, is this patch still
> > somewhere on your radar?
>=20
> Please don't send content free pings and please allow a reasonable time
> for review.  People get busy, go on holiday, attend conferences and so=20
> on so unless there is some reason for urgency (like critical bug fixes)
> please allow at least a couple of weeks for review.  If there have been
> review comments then people may be waiting for those to be addressed.
>
> Sending content free pings adds to the mail volume (if they are seen at
> all) which is often the problem and since they can't be reviewed
> directly if something has gone wrong you'll have to resend the patches
> anyway, so sending again is generally a better approach though there are
> some other maintainers who like them - if in doubt look at how patches
> for the subsystem are normally handled.

With it being 3 weeks since the patch was originally posted, I thought
it might be the time to ask if the binding-patch was still around.

I vaguely do remember you saying in the past that if a patch hasn't
been applied/handled after X time-units, it wouldn't be in your inbox
anymore, but am not sure anymore ;-) .



