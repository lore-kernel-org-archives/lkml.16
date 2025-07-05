Received: from smtpx1.feld.cvut.cz (smtpx1.feld.cvut.cz [147.32.210.191])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1392E36E6;
	Sat,  5 Jul 2025 19:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.32.210.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751744168; cv=none; b=uetkMRuTy2w55zdR4D4ABNFuZLR+VT9rsdXyfDJ3uF7HuIaT3Gj/PBJusFEKJgT5gpZb4YBl76rm3BOCi0TqnMuHrfW46PXDUvl4+5evQ7e87JAE06kNs9pXWzpl9hMcw8AsBICn+Uwi8tlqdp9WNiQ+o7WRbp7UtEyEYd0sP2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751744168; c=relaxed/simple;
	bh=P2wVVIyNNFi99icpzNRl6oBqKXsSSS9BxN+FOusjyqc=;
	h=From:To:Subject:Date:Cc:References:In-Reply-To:MIME-Version:
	 Content-Type:Content-Disposition:Message-Id; b=Cqaco1rjTTZVlS5bJqeJaeE141xNvri0tOD8PRKGVKiGKnJNedUYKO275OM5hrs2S/URlq2mxoGAUdqJ0Lnl0i7q6jBoFw4uJ5DaY0UWIk4d37Uxskl2xz/Ac/CG2AuZ/4kIgpGAXW3eRtphKXy/KM8cssqvTKYq7xmJTtVzo4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fel.cvut.cz; spf=pass smtp.mailfrom=fel.cvut.cz; dkim=pass (2048-bit key) header.d=fel.cvut.cz header.i=@fel.cvut.cz header.b=hoKjqOwk; dkim=pass (2048-bit key) header.d=fel.cvut.cz header.i=@fel.cvut.cz header.b=HUquos4j; arc=none smtp.client-ip=147.32.210.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fel.cvut.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fel.cvut.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fel.cvut.cz header.i=@fel.cvut.cz header.b="hoKjqOwk";
	dkim=pass (2048-bit key) header.d=fel.cvut.cz header.i=@fel.cvut.cz header.b="HUquos4j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fel.cvut.cz;
	s=felmail; t=1751743594;
	bh=bQHckHvyX9ZXT3v8VL83hL8ddqeWCtoA2CagF+Z3BZQ=;
	h=From:To:Subject:Date:Cc:References:In-Reply-To:From;
	b=hoKjqOwkdNbjn5myk3VVQc7XaP1yKMYnyir5Nxp2Y5TTCGi/8Cn/ExHJaveQXgFBG
	 3AqCSbMKGbEG/cFtgnlq1wh3VKPQKWqnguNSOU4gxRe3NMH1o3wOttSOoPOIUIA3AG
	 d6jXKg+Bf7FFIN0tpWQuOG2t6XK6ys8VA9i4/OPjt+FtAMAr6xx8ZKwStcigL5GVci
	 oEHpQCz4NLyhlG8i2XNjMdQjh4MVhkq/NsaBTzrqmd8a3Yq/UFuajCORoxv2dAMIoB
	 wgjeLQiXYfvTo2GYR8qtCoxaNMMG/xKHsvXnp2ndIYZGhwoHHTqXDba1VJpE7Sg7MC
	 F6VrqeDZG5KnA==
Received: from smtpx.fel.cvut.cz (smtpx.feld.cvut.cz [147.32.210.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtpx1.feld.cvut.cz (Postfix) with ESMTPS id 08B21233AE;
	Sat,  5 Jul 2025 21:26:34 +0200 (CEST)
Received: from localhost (unknown [192.168.200.27])
	by smtpx.fel.cvut.cz (Postfix) with ESMTP id 000A34FDFB;
	Sat,  5 Jul 2025 21:26:33 +0200 (CEST)
X-Virus-Scanned: IMAP STYX AMAVIS
Received: from smtpx.fel.cvut.cz ([192.168.200.2])
 by localhost (cerokez-250.feld.cvut.cz [192.168.200.27]) (amavis, port 10060)
 with ESMTP id TUl3fu33WDO5; Sat,  5 Jul 2025 21:26:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fel.cvut.cz;
	s=felmail; t=1751743436;
	bh=bQHckHvyX9ZXT3v8VL83hL8ddqeWCtoA2CagF+Z3BZQ=;
	h=From:To:Subject:Date:Cc:References:In-Reply-To:From;
	b=HUquos4jZsHWzwERSjYMNQUHAKjBBi/TXG4KB6nQNplyPYCKc+7HU5IF09SXnJ5JZ
	 fbrvSs/w6ZMxClwIk9v8bl7AdplwCkQW6HYzwTPYJkq7mZwHiEKExGR7H7gUzM3yHt
	 uPPa3IbIT6ZvgJXs1qOum4Cxk+mHaNuXTSdw88mF7lGegI/2EEavtCuMA8d+uxBwql
	 8yQC30zSffz+jp8i9iJ+KiGEECfLd07VaasuQkgOypH/XXEM2TIV5rgFiupI3kD/AH
	 CzsARPf0BMWrFg+uA5lbq5MPqqcx2m02Fndkl9FIkfjN0xClTyJkfa4HFJnMFslGIg
	 W3sMBBbUdqLPA==
Received: from baree.pikron.com (static-84-242-78-234.bb.vodafone.cz [84.242.78.234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pisa)
	by smtpx.fel.cvut.cz (Postfix) with ESMTPSA id 6C1854FDC3;
	Sat,  5 Jul 2025 21:23:52 +0200 (CEST)
From: Pavel Pisa <pisa@fel.cvut.cz>
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Subject: Re: [PATCH] docs: Fix kernel-doc indentation errors in multiple drivers
Date: Sat, 5 Jul 2025 21:23:55 +0200
User-Agent: KMail/1.9.10
Cc: corbet@lwn.net,
 alexandre.belloni@bootlin.com,
 ondrej.ille@gmail.com,
 mkl@pengutronix.de,
 James.Bottomley@hansenpartnership.com,
 martin.petersen@oracle.com,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Ondrej Ille <ondrej.ille@gmail.com>,
 Martin =?utf-8?q?Je=C5=99=C3=A1bek?= <martin.jerabek01@gmail.com>,
 =?utf-8?q?Ji=C5=99=C3=AD_Nov=C3=A1k?= <jnovak@fel.cvut.cz>
References: <20250703023511.82768-1-luis.hernandez093@gmail.com>
In-Reply-To: <20250703023511.82768-1-luis.hernandez093@gmail.com>
X-KMail-QuotePrefix: > 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <202507052123.55236.pisa@fel.cvut.cz>

Dear Luis Felipe Hernandez,

I focus only on drivers/net/can/ctucanfd/ctucanfd_base.c

On Thursday 03 of July 2025 04:35:11 Luis Felipe Hernandez wrote:
> Fix kernel-doc formatting issues causing "Unexpected indentation"
> errors during documentation build in CAN, SCSI, and I3C drivers.
>
> Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
> ---
>  drivers/i3c/device.c                     | 6 +++---
>  drivers/net/can/ctucanfd/ctucanfd_base.c | 8 ++++----
>  drivers/scsi/scsi.c                      | 4 ++--
>  3 files changed, 9 insertions(+), 9 deletions(-)
>
...
> diff --git a/drivers/net/can/ctucanfd/ctucanfd_base.c
> b/drivers/net/can/ctucanfd/ctucanfd_base.c index bf6398772960..bd6938f6e105
> 100644
> --- a/drivers/net/can/ctucanfd/ctucanfd_base.c
> +++ b/drivers/net/can/ctucanfd/ctucanfd_base.c
> @@ -507,10 +507,10 @@ static bool ctucan_is_txt_buf_writable(struct
> ctucan_priv *priv, u8 buf) * @isfdf:	True - CAN FD Frame, False - CAN 2.0
> Frame
>   *
>   * Return: True - Frame inserted successfully
> - *	   False - Frame was not inserted due to one of:
> - *			1. TXT Buffer is not writable (it is in wrong state)
> - *			2. Invalid TXT buffer index
> - *			3. Invalid frame length
> + *         False - Frame was not inserted due to one of:
> + *         1. TXT Buffer is not writable (it is in wrong state)
> + *         2. Invalid TXT buffer index
> + *         3. Invalid frame length
>   */
>  static bool ctucan_insert_frame(struct ctucan_priv *priv, const struct
> canfd_frame *cf, u8 buf, bool isfdf)

I do not have strong opinion there but the numberred list {1., 2., 3.}
is the sublevel of the top list {True, False} under the False option.

You have flattened the list which hides the connection of error
reasons to the False return value.

But if the strict rules for indentation are more important
than my feeling for easy navigation then I do not want to stand
in way and go forward.

Aligning False under True has some reason, the original
text used tabs for indentnation, which is I understand
as generally preferred in kernel sources and the original
comment with correct tab = 8 spaces renders well for me

 * Return: True - Frame inserted successfully
 *	   False - Frame was not inserted due to one of:
 *			1. TXT Buffer is not writable (it is in wrong state)
 *			2. Invalid TXT buffer index
 *			3. Invalid frame length

Best wishes,

                Pavel

                Pavel Pisa
    phone:      +420 603531357
    e-mail:     pisa@cmp.felk.cvut.cz
    Department of Control Engineering FEE CVUT
    Karlovo namesti 13, 121 35, Prague 2
    university: http://control.fel.cvut.cz/
    personal:   http://cmp.felk.cvut.cz/~pisa
    social:     https://social.kernel.org/ppisa
    projects:   https://www.openhub.net/accounts/ppisa
    CAN related:http://canbus.pages.fel.cvut.cz/
    RISC-V education: https://comparch.edu.cvut.cz/
    Open Technologies Research Education and Exchange Services
    https://gitlab.fel.cvut.cz/otrees/org/-/wikis/home
