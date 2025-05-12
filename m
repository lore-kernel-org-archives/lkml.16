Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B678B291163;
	Mon, 12 May 2025 13:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747056704; cv=none; b=ViKlQhoCRUV1hjW+xYSbUEohw+PXlnbIpqEdRySclA/mbI/1hnajUvLy2Cr6fZsXgBxOR3G4fAT6a/85NerX40suNjgKGWJDT57tpC2wjBoDLLcMQeSr77onSGJcI0jmU2/eBqgWMZvcnmmedps8FSxuiY7dUZyEMK8/g59/e08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747056704; c=relaxed/simple;
	bh=hglYuKmxN4zcQEW7/ROUv/QWojJ+3PZfbTHmGdPFU10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s7aW4y3EYFh3YgJ/pu2TVEAWeEkh68mm2XSHBfOiJrXzn45ktwMlEn9DjNDIZeRRC/yV20/NxmLNKZNllcjMuIWSC1w3EZIFrZodfv5s6nTgoUT6/riR5wMzr+YKSq1Qc5oQtt43GMc+LL0hmrs7Gce0H+oGH7odEmJLTVyJUkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Co6n9zSv; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Co6n9zSv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=O+V+RCvpoAaGRFT4GZBhiApWS5v7S4yG0iss69ry+Po=; b=Co6n9zSvwNUsxs6gnNNk3Jo6KX
	xK5oFL4yQV10FygzxSVW0Lc9tRJk7exKi9G5xm2wAlQXL4BVmCeMdoc2Cw50s/XYPw5+hoEAz/Jh9
	HMfEey7XQqTz+Yt9jo6VIYtS8bziHyuO67q8DSaFZWsJH5erR2/8vTPEi6flXiM1bPXC9uFZVfKsa
	GrH7rIRVtUiGinhT8ZV/LUq+kDmXJRasTmq//5IT06hbOkOj8YJNbFyKazqHA5HpNekXp4+1z0wab
	2/9t/z5auo5hpJXvVA5VzCyuO3NALLe3R8vDuGqhk4E0H3uFMcFJJSEewW296QKk7sEArOw/w1Vd1
	YsgwY3Qw==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uETFV-0006NF-9J; Mon, 12 May 2025 15:31:17 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: robh@kernel.org, chainsx@foxmail.com
Cc: chainsx@foxmail.com, conor+dt@kernel.org, krzk+dt@kernel.org,
 sfr@canb.auug.org.au, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v1 0/2] Add support for Firefly Station-M3/ROC-RK3588S-PC
Date: Mon, 12 May 2025 15:31:16 +0200
Message-ID: <3612514.V25eIC5XRa@diego>
In-Reply-To: <tencent_D5C17F39C684CD6491505763B23BACCE5106@qq.com>
References: <tencent_D5C17F39C684CD6491505763B23BACCE5106@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Am Montag, 12. Mai 2025, 15:20:48 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 chainsx@foxmail.com:
> From: Hsun Lai <chainsx@foxmail.com>
>=20
> This series add support for Firefly Station-M3/ROC-RK3588S-PC.
>=20
> Info of device can be found at:
> https://wiki.t-firefly.com/en/Station-M3/index.html
>=20
> Changes in v1:
> - Add support for Firefly ROC-RK3588S-PC
>=20
> Hsun Lai (2):
>   dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
>   arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC

hmm, you seem to be using git-send-email, but your mails did not
get in-reply-to headers. Normally git-send-email should detect the
cover-letter + patches thing and tie them together to a mail thread
when you send them with a "git send-email *.patch" or similar .


Heiko


