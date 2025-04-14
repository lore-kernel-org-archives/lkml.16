Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970E51E47B0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 20:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744662506; cv=none; b=Vw1cBkFQM+WLLwnwbnXxxhYE73XuEZtvuuGRwJ1+4ALp+ybsJeT/TpDf/zwsNy4nIGDqD+ZarlQJZI4e6zQs5XWp/ikM2ztAtbjQrq8KWbOmJgyfLlSbaQ4jsi6XV7x1dax1aRR97GgN7pTZG+CmoPgizbc+GHEXJD2hDcd91RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744662506; c=relaxed/simple;
	bh=hyU4NSwdZyi1ic0q6erpOYIB7qc2G4+0kHu3Htlz0kk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kGe+UWbzP0Rc03db3fiEVIPeY4MXkHGVV/CqeaMBjou9ma9O6co+ApC/MQdQpMtSB4DTDWyx5QtuZxXTNq8DOBDHy+cYVcODW7X2HO4t3yToxVHGshGSIOQnXz3EvG9i2AT8xs0JWGoNQ3kAIo6axfUv8SdkCQ5/twbJD3ajmbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=cPgVwTS1; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="cPgVwTS1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1744662502; x=1744921702;
	bh=hyU4NSwdZyi1ic0q6erpOYIB7qc2G4+0kHu3Htlz0kk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=cPgVwTS1hPj6+0ZZs7ImFLWv5JHUesAB9oVoG5T8k1bUL+z7jKhaHkeTzpkD3D6m8
	 zd9CgQi/KbVBF2Q9Q3LuJBlo1bYkabM9omqPVCQLIPCgWxbA/x/Sw+5r+V1xLwHf0Y
	 UKmLkC8a2bEAyQDYtxm44g6i2+fqz0yIqvdixjBKnuW2OsV+RtkLvYdFxmrjQG3ZGw
	 Ulo1ioaWvi3xUOMG20RU8UIlYY7nLkICFYZ/t365BX7s9Sokaf1NqOk9orFsSZ3QLL
	 4gEH5J7AowS2EgkH4dTvRakdgZxi3SG6+lrBrCP/Ph2Wh0V55iO594fDUg4FR+o2wg
	 veua050yQROWA==
Date: Mon, 14 Apr 2025 20:28:17 +0000
To: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH v2 RESEND 1/6] USB: serial: ftdi_sio: Remove space before comma
Message-ID: <20250414202750.9013-2-dominik.karol.piatkowski@protonmail.com>
In-Reply-To: <20250414202750.9013-1-dominik.karol.piatkowski@protonmail.com>
References: <20250414202750.9013-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: 2f0616f2af7df125ac6d2715b5bc3a208d5ea6c7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Remove the space before comma in id_table_combined to align with code
style.

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>
---

v2: Split the patch into smaller patches

 drivers/usb/serial/ftdi_sio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 9b34e23b7091..b02dbe4ec1e4 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -190,7 +190,7 @@ static const struct usb_device_id id_table_combined[] =
=3D {
 =09{ USB_DEVICE(FTDI_VID, FTDI_8U232AM_PID) },
 =09{ USB_DEVICE(FTDI_VID, FTDI_8U232AM_ALT_PID) },
 =09{ USB_DEVICE(FTDI_VID, FTDI_232RL_PID) },
-=09{ USB_DEVICE(FTDI_VID, FTDI_8U2232C_PID) ,
+=09{ USB_DEVICE(FTDI_VID, FTDI_8U2232C_PID),
 =09=09.driver_info =3D (kernel_ulong_t)&ftdi_8u2232c_quirk },
 =09{ USB_DEVICE(FTDI_VID, FTDI_4232H_PID) },
 =09{ USB_DEVICE(FTDI_VID, FTDI_232H_PID) },
--=20
2.34.1


