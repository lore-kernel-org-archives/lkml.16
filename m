Received: from gmmr-2.centrum.cz (gmmr-2.centrum.cz [46.255.227.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86871AA1C0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 06:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.227.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744093191; cv=none; b=ATvj59cYJFLe0NwtGwy4H7WjjAVcat/KRmtejbASQeTDCssS3EVYD26fYpSGShw4vUcF8r2kfv2auxMSDNhNAk7uaH0/TZ7uOh/RQ5Q78kso6McpgIQn15o09YP/PYm0pjUMN6xwEgA77jj5/v0WjpClQ1sv17oVVRyIs6qk6ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744093191; c=relaxed/simple;
	bh=ESZ/gDHsgXIMhe8QeZmGDiYKlNIFXzEF0k9fDrzfcvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LfRhlKH4+7xX5tN+KN6oQ6XkDrQGQ2JZNZVPgucL6BY0O9aPeW/jl/qggIpEWrRw2IHERr4jBmsK4UY3ZeTVeICdlRNqyKjPhUUFTn89nuPacuICR0r10uqDK1lBey7ozQ9JYdoIQ4rsxSnIv+OJip0CEj2d0HwC94WygMnngQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atlas.cz; spf=pass smtp.mailfrom=atlas.cz; dkim=pass (1024-bit key) header.d=atlas.cz header.i=@atlas.cz header.b=JJXZ7Ip1; arc=none smtp.client-ip=46.255.227.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atlas.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atlas.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=atlas.cz header.i=@atlas.cz header.b="JJXZ7Ip1"
Received: from gmmr-2.centrum.cz (localhost [127.0.0.1])
	by gmmr-2.centrum.cz (Postfix) with ESMTP id 5CB8120931A6
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:19:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atlas.cz; s=mail;
	t=1744093183; bh=lvyjIJKGy8QhZAPg5VkaN7V4KSmrZ8/Cvduct4cuvCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JJXZ7Ip1rzshsSYnF++lv5XhBb1xUc6/nh7CNM3sUOn2m/LKuBKPSE0zBxNTsxZXO
	 I1UzvEIhFlRtAljYlB7Uxf/dz/F2WNtmb840cw5dinC3UhODRez80mV70agwS0Zsv1
	 bWGJMfIYlPgxlng3pSg3DdaXP4Y52bV5Nol8N72s=
Received: from antispam37.centrum.cz (antispam37.cent [10.30.208.37])
	by gmmr-2.centrum.cz (Postfix) with ESMTP id 59D662092EC0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:19:43 +0200 (CEST)
X-CSE-ConnectionGUID: zCTAe/TKRguaPpQhCVET8w==
X-CSE-MsgGUID: mo02/PjlTVGfV5Mc6j3YCQ==
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2ErAACZvvRn/03h/y5aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQAmBOQIBAQEBCwEBghqBJYFkhFWRdYokiAWBIIxIDwEBAQEBA?=
 =?us-ascii?q?QEBAQk5CwQBAQMEOIRIAosqJzcGDgECBAEBAQEDAgMBAQEBAQEBAQENAQEGA?=
 =?us-ascii?q?QEBAQEBBgYBAoEdhTVGDUkBEAGCAIEsgSYBAQEBAQEBAQEBAQEdAg1+AQUjD?=
 =?us-ascii?q?wFGEAsNAQoCAiYCAlYGE4MCAYIvAQMxFK8ReoEyGgJl3HACSQVVY4EkBoEaL?=
 =?us-ascii?q?gGITwGFbBuEXEKCDYEVgyo+hBuEA4JpBIItRVWNVJMhUnscA1ksAVUTFwsHB?=
 =?us-ascii?q?YEpQwOBDyMPBz0FMx2BfINygwqCLoIRgVwDAyIBgxV1HIRug02BDS1PgmpJP?=
 =?us-ascii?q?R1AAwttPTcUGwaYEoRuYIF9SVTFeYMcgQmETYdLlUozl3ADkmSYfo4Fmy6Bf?=
 =?us-ascii?q?YIAMyIwQoIFW1IZjjwWFnYBC4dTw0V2CzECBwEKAQEDCYI7i26BQDOBSwEB?=
IronPort-PHdr: A9a23:PkHKsBVfYWmLPAAM4RqRTUIQAbDV8KwdUjF92vMcY1JmTK2v8tzYM
 VDF4r011RmVBt+ds6oP0bKM6PuocFdDyKjCmUhKSIZLWR4BhJdetC0bK+nBJGvFadXHVGgEJ
 vlET0Jv5HqhMEJYS47UblzWpWCuv3ZJQk2sfQV6Kf7oFYHMks+5y/69+4HJYwVPmTGxfa5+I
 A+5oAjfqMUam5duJro+xhfXvndEZepbyG11Ll+Pghjw4du985Fk/ylMofwq6tROUb/9f6Q2T
 LxYCCopPmUo78D1thfNUBWC6GIEXmsZihRHDBHJ4Q/1UJnsqif1ufZz1yecPc3tULA7Qi+i4
 LtxSB/pkygIKTg0+3zKh8NqjaJbpBWhpwFjw4PRfYqYOuZycr/bcNgHQ2dKQ8RfWDFbAo6kY
 YUBD/QPMPhFoYf+qVsBogexChSjCuzt0TJImnz70Lcm3+g9DQ3L3gotFM8OvnTOq9X1Mb8fX
 /qrw6nU1zXIcvxZ1i376I3WcRAqvPaBUqhqccrS00YvEhnKjk+LpIP/IzOV0v4Cs3OB4+V8V
 OOikmgqoBx+rTaz3MkjkJXJhp4LxVDe8yV02Ik7K9K3RkN4f9KpE5tduiWeOoZ4XM8vQ2Fmt
 SI6x7MJpJK2YCsHxZUpyRPQavGKfYeF7w7+WOuNIzp1h3Joday5ih2v/0agzej8WdO10FZMt
 idFkcfDtmoL1xPN7siLUPx9/l2u2TuJygvd6flELFg7mKfaMZIt3L49m5oJvUjdACP7mF/6g
 a2Ue0k85OSk9urqbq/4qpOCK4N4kB/yP6sylsClBek1Mw4DVHWB9+umzr3s50j5Ta1Pjv0xj
 6bWrojXJd8epq6lGw9V1Zsj6wqnAzemztsYmX4HIUpKeBKCloTpIFTOIOzgDfuin1igiitky
 O7APr39GJXNM33DnK39crd880JcyQwzws5D559MBbwMIej/VlHxudHYFBM1LRK4zub9BNh/1
 I4SQWePDbWYMKPWv1+I/OUvI+yUaYAPojb9KOIq5/v0gn8jglISZ7Wp3Z8NZ3CjBPhpP0SYb
 WL2gtgdCWcKohY+TOvyhVyNUjNeZm2/X6Ei6TEhDoKpE4PDSpqqgLyb0ye3BodWaXxeClCQD
 XfocJ2JW+sDaCKWLc5siTgEVbmnS488yRGurgj6y7xmLuvb4CEXqIzs2MBv5+LPjREy6SB0D
 8OF3mGJTmF0mH4IRjAv0KB8v0N90FGD3rZ8g/FDC9xT6O1GUh0gOZ7f0eN6EdbyVRzFftuTT
 1amWNqmDSk3Tt0q29AOeVpyG82+jhDf2CqnG7EYm6SWC5w386Lc2mD8Kd5yxXnIyqcvk0UrT
 M1XOWK7g65w7RLTCJLRnkuBjqikbasS0DbW9Gebw2qDpFlWXhdoX6vKRXwffVPWrdrh6UPCU
 bCuDbMnPxNZx8CbMqVEZY6hsVITePfkPd3FK021lmagAxuSjueQY476U2Ec2jjBEk8CkhBV8
 XvQZiYkASL0m2/CFnRQHFRMYAu4+PN9oXayVGc90wWDdAtqxezmqVYumfWARqZLjfo/syA7p
 mAsdGs=
IronPort-Data: A9a23:+UBBXqCg/n/C7hVW/0riw5YqxClBgxIJ4kV8jS/XYbTApDsr3mcCy
 2UdXj/SMv6DMWXzLtxwPIng9E5S78PUzIdlOVdlrnsFo1CmCCbm6XZ1Cm+qYkt+++WaFBoPA
 /02M4SGcYZtCCeB+39BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7dRbrVA357gXmthh
 fuo+5eCYAP9i2YtWo4pw/vrRC1H7amaVAww4QRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuuuTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vR3Sxowsl
 48d3XCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfE0py3
 PFfFBM3YQ2Kv/qPwJmFZ9U8mZF2RCXrFNt3VnBIwjScFvM6WcmbBa7H48NCwTJ2jdIm8fT2O
 5RfM2cyKk6aPlsQZT/7C7pn9AusrnDlcDRdoUi9rLYz6nOVxx4ZPL3FYYWOJIHRGZg9ckCwo
 2WepSPBABUmCvOR92eg+Syu3d7kpHauMG4VPPjinhJwu3WDljI7CxAMU1a/5/6jhSaWR91bO
 2QQ+ywzsbI18k27CNXwNzW8oXiZrlsfVsBWHukS9g6A0OzX7hyfC2xCSSROAOHKr+dqG3pwi
 wLPxYm0Q2Mw2FGIdU+gGn6vhWvaEUAowaUqP3dsodctizU7nLwOsw==
IronPort-HdrOrdr: A9a23:cTT8NKpXXM6TxS3YOxdUGiYaV5omeYIsimQD101hICG9vPb2qy
 mLpoV/6faSskd0ZJhAo6HjBEDuexnhHPJOjLX5eI3SOzUO21HYT72Kj7GC/9SIIUSXndK1l5
 0BT0EUMrPN5DZB4frH3A==
X-Talos-CUID: =?us-ascii?q?9a23=3AjRgxEmiJSf/6SxuXr5SNskHdeTJuYFbh5XqXH2y?=
 =?us-ascii?q?CBntgcKWsSXSu1Z80jJ87?=
X-Talos-MUID: 9a23:2VX0jQjQ61VRcj6PC58jYMMpMcAwueOWCkQxr7oIhZShPnJyYAa2tWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.15,197,1739833200"; 
   d="scan'208";a="97365345"
Received: from unknown (HELO gm-smtp10.centrum.cz) ([46.255.225.77])
  by antispam37.centrum.cz with ESMTP; 08 Apr 2025 08:19:41 +0200
Received: from arkam (ip-213-220-240-96.bb.vodafone.cz [213.220.240.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gm-smtp10.centrum.cz (Postfix) with ESMTPSA id BF5A480911A9;
	Tue,  8 Apr 2025 08:19:40 +0200 (CEST)
Date: Tue, 8 Apr 2025 08:19:39 +0200
From: Petr =?utf-8?B?VmFuxJtr?= <arkamar@atlas.cz>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [tip: x86/urgent] x86/acpi: Don't limit CPUs to 1 for Xen PV
 guests due to disabled ACPI
Message-ID: <20254861939-Z_S_-ybv1at7EdUO-arkamar@atlas.cz>
References: <20250407132445.6732-2-arkamar@atlas.cz>
 <174403706955.31282.7031075757256146451.tip-bot2@tip-bot2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174403706955.31282.7031075757256146451.tip-bot2@tip-bot2>

On Mon, Apr 07, 2025 at 02:44:29PM -0000, tip-bot2 for Petr Vaněk wrote:
> The following commit has been merged into the x86/urgent branch of tip:
> 
> Commit-ID:     8b37357a78d7fa13d88ea822b35b40137da1c85e
> Gitweb:        https://git.kernel.org/tip/8b37357a78d7fa13d88ea822b35b40137da1c85e
> Author:        Petr Vaněk <arkamar@atlas.cz>
> AuthorDate:    Mon, 07 Apr 2025 15:24:27 +02:00
> Committer:     Thomas Gleixner <tglx@linutronix.de>
> CommitterDate: Mon, 07 Apr 2025 16:35:21 +02:00
> 
> x86/acpi: Don't limit CPUs to 1 for Xen PV guests due to disabled ACPI

Thank you for accepting the patch.

Out of curiosity, why did you remove the Cc: stable@vger.kernel.org
trailer? I thought it should be backported as it is a regression.

Thanks,
Petr
