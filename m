Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2101F1E1DE9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 20:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744662541; cv=none; b=goE3gS8GSItdLO9kRGUYPmS6k+QlrdTCaQINC0Zo9UERKIIYRI+Gnwt6LXZbAy9s6iTaV50w3OvZPrqEt2CB9GVcfKuUZ2aNXC4QFFkgK0I27fcXMH/Yl1GTsV75ZyHFpojWDd6+BYQUb6MK9xjcdxZOTA6BDmr0Of7OU3HfV4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744662541; c=relaxed/simple;
	bh=GNu+kahqRURr3jBKGFOwVS7xGN4jr0+9cKSPvRimRUQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I4C3Qhtx+/BDPTKDpGlI2RyEjzuhEqbGIE4eLlqutxR9kyFPqi4ift0UC3neKm7cFNseMuncGZnoUXR6RHSuvcaeNqiin28DpUVZhzWtewIFX6LXHuvCg/fcesKn+3UIaG8KKgUy5k51bC7KJGVNha+i4zKBmaJ03VAwV/vxwIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=OeOYxhT5; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="OeOYxhT5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1744662535; x=1744921735;
	bh=u5mBsTab4mA8udrpnBydbaZhEo5uyqSSg9IwaotnLuw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=OeOYxhT5w5WuFRgp4gIw7Wy+mOLcZQurVcmpRfJXhdMhIY4LVQG926gwhoFmFpIvD
	 JBXbrrmKS6zIGZ9jzODB95h0PBzWlU+fu4ilIDqsIDmhXF+4PdYDeCfV/GWQreash2
	 i58ocZmCR3rEZSaVGt1mhiUIB7eoX7yQBHDhZQK5mnwZtQlqGP4aBGwAktJbcpDoS7
	 nUIuzDSoDdM4duKeAzgGL9vmUoOjeSu/caSz9huhdXB4IbZ4AFLe4Wvtv7y5lhH2xi
	 T54m7Ixsp35Wb5aADzz9CeKuJhCaMUeTBehSHYhh+zSJY9qg2IfEd4qj3UNWhUqngx
	 J5+98TPrdDajw==
Date: Mon, 14 Apr 2025 20:28:51 +0000
To: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH v2 RESEND 6/6] USB: serial: ftdi_sio: Remove space before tabs
Message-ID: <20250414202750.9013-7-dominik.karol.piatkowski@protonmail.com>
In-Reply-To: <20250414202750.9013-1-dominik.karol.piatkowski@protonmail.com>
References: <20250414202750.9013-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: f042265354f45c23594c973a41aad8e4bbba6fba
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Remove superfluous space before tabs in defines to align with code
style.

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>
---

v2: Split the patch into smaller patches

 drivers/usb/serial/ftdi_sio_ids.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_si=
o_ids.h
index 52be47d684ea..3d9f6ed97783 100644
--- a/drivers/usb/serial/ftdi_sio_ids.h
+++ b/drivers/usb/serial/ftdi_sio_ids.h
@@ -1022,7 +1022,7 @@
  * Kondo Kagaku Co.Ltd.
  * http://www.kondo-robot.com/EN
  */
-#define KONDO_VID =09=090x165c
+#define KONDO_VID=09=090x165c
 #define KONDO_USB_SERIAL_PID=090x0002
=20
 /*
@@ -1446,7 +1446,7 @@
 /*
  * Accesio USB Data Acquisition products (http://www.accesio.com/)
  */
-#define ACCESIO_COM4SM_PID =090xD578
+#define ACCESIO_COM4SM_PID=090xD578
=20
 /* www.sciencescope.co.uk educational dataloggers */
 #define FTDI_SCIENCESCOPE_LOGBOOKML_PID=09=090xFF18
--=20
2.34.1


