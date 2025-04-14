Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CC91DF971
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 20:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744662515; cv=none; b=GjhPGcxFGuJRZa6L/DpyetmwWrRTtCyAgnBIbB8Y1SBAbKGRZGekT9C8KSDhqPhoMHGYMiBowek2m+0S5f7kN3hJtHMxJPlcW646y1a/3L32Fs9y2XUp3PbRTlcCV6pec85jZ5DxaYLU4rtvMzbd/bbIv2eN/BDmNqleKT5pkBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744662515; c=relaxed/simple;
	bh=8TaE4U50cKnetEE5qxz8et9q1kplSCeKNx9UK6JRhnk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WyG+CdIhkN9k0KpeQJT/SoBQ3kv4txGBEDsj8HV+Iw99amUVm6G8iwyCTKbYJ95HEDZBHwiVHWviZNIbnnnXjQTouF5YqkVkAxVthZUMVn0Q/C2BfuhMLKz4EhIxHsRjK4sTQV6+zR3CoW1R9mzDRVIz1Ffop/O3tXEPdGHC9F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=ZUykQswF; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="ZUykQswF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1744662511; x=1744921711;
	bh=8TaE4U50cKnetEE5qxz8et9q1kplSCeKNx9UK6JRhnk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=ZUykQswF45J0+U6T9Bt6it0yZans4SB8FPguGkZJih5PTcMyVjkm/V98vQSzsEPOv
	 RKHmlPAxSYIfLVN9zSTgmUWon5oWn5np5LRHqBrEZb5iAYk3TDzLX+pV+khPHjW30J
	 qPd5pPcA6DOyQPIYW6/6NIq7cGLpAESzS0FDXZ7l1uCEtN+hOWscNLNV8S1XmcTesg
	 hhuTVuLMyuiG6ug/ceYuSezWB8eLajwhXWLoFpMI8G1LvQDjLwtA4sq2WI4gR/+3D1
	 b99uCL1LwUdB2QcRBjoEHUb8l9WnHSTX7GueF3rif1dRHk6KH93fo8DIYUoy3lim3H
	 lNipI0dhbs/sA==
Date: Mon, 14 Apr 2025 20:28:26 +0000
To: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH v2 RESEND 2/6] USB: serial: ftdi_sio: Add missing blank line after declarations
Message-ID: <20250414202750.9013-3-dominik.karol.piatkowski@protonmail.com>
In-Reply-To: <20250414202750.9013-1-dominik.karol.piatkowski@protonmail.com>
References: <20250414202750.9013-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: d40a20c93caa0d0ac7b8d582e74cbcad5ceb07e9
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add missing blank lines after declarations to align with code style.

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>
---

v2: Split the patch into smaller patches

 drivers/usb/serial/ftdi_sio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index b02dbe4ec1e4..f52bab3a3bfd 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1143,6 +1143,7 @@ static unsigned short int ftdi_232am_baud_base_to_div=
isor(int baud, int base)
 =09unsigned short int divisor;
 =09/* divisor shifted 3 bits to the left */
 =09int divisor3 =3D DIV_ROUND_CLOSEST(base, 2 * baud);
+
 =09if ((divisor3 & 0x7) =3D=3D 7)
 =09=09divisor3++; /* round x.7/8 up to x+1 */
 =09divisor =3D divisor3 >> 3;
@@ -1169,6 +1170,7 @@ static u32 ftdi_232bm_baud_base_to_divisor(int baud, =
int base)
 =09u32 divisor;
 =09/* divisor shifted 3 bits to the left */
 =09int divisor3 =3D DIV_ROUND_CLOSEST(base, 2 * baud);
+
 =09divisor =3D divisor3 >> 3;
 =09divisor |=3D (u32)divfrac[divisor3 & 0x7] << 14;
 =09/* Deal with special cases for highest baud rates. */
@@ -1657,6 +1659,7 @@ static ssize_t latency_timer_show(struct device *dev,
 {
 =09struct usb_serial_port *port =3D to_usb_serial_port(dev);
 =09struct ftdi_private *priv =3D usb_get_serial_port_data(port);
+
 =09if (priv->flags & ASYNC_LOW_LATENCY)
 =09=09return sprintf(buf, "1\n");
 =09else
@@ -2194,6 +2197,7 @@ static int ftdi_probe(struct usb_serial *serial, cons=
t struct usb_device_id *id)
=20
 =09if (quirk && quirk->probe) {
 =09=09int ret =3D quirk->probe(serial);
+
 =09=09if (ret !=3D 0)
 =09=09=09return ret;
 =09}
--=20
2.34.1


