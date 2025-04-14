Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BC01EDA3F;
	Mon, 14 Apr 2025 20:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744662525; cv=none; b=TRtgfuMkOCfPo+DJmvYO5tD1RqyNW8eUwBHSi3ZmJJDLv4s1cdmWWb0bF8Z/o/KwxjRI2VHPSBZNxFsz8IzkejvoVpZNPdWm8+WwwCe1qDVxJf8BTYjEnj5G75NTxQ3wL5tttFcBcyHX8cnRgqvSdHscQaClCJfe/DJahC0aSMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744662525; c=relaxed/simple;
	bh=8SjZa3CmHvhU+LhLOx4jffMk+jRhfpsXqV7OR3OOGAI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iE7fIoZMk3S+qdgpKAOOm3vsokSVsJmYQhU3RUp/ZivTOBdDoSGuhy4V6TJiCEmSmwc/IKzdlFSK0O6kIYTgQ7rpQ2WhL+3b3QvSEglSoEH8nOAarDAePHclopwZH7sd749NSIPizddAWB51FOL/cPWavAzrWGoIoecOX0HaN8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=foLsbQv3; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="foLsbQv3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1744662522; x=1744921722;
	bh=1glU/OShXpOA2ephq0ZPJD8B6OeSEFrC5TU1C54+82E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=foLsbQv3ZKXVteq+nisT75xDdT3o5NRiJHsvNkF8vMk/VUJ2Vshs7vmrsuUVRr+oE
	 kCtuTyCYb+9bmFrYNT9QpE21aGhLMvQAHgWrxkOHMY1udBE8dGajlpdAUnCpc+zWJx
	 TjmZpSx7hMZkdOhglXyynkXSwnZltySDDnevtjy/LuN366l54D5WgPXQrdWKpF1g3D
	 fM0rmBqoVlg+pkj1A25j9HLx3eE0x1Z9eLR5Atvy3X7wDAgcL86+7QqNb2RaXhlBD/
	 a4KMgfhMF1jGafQscvBHXvUsADw4FMnygNZitWuETk6RBh0niYAzlo5z/T8qI9xxHm
	 pPvOd3A9Z5UkA==
Date: Mon, 14 Apr 2025 20:28:38 +0000
To: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH v2 RESEND 4/6] USB: serial: ftdi_sio: Fix indentation made with spaces
Message-ID: <20250414202750.9013-5-dominik.karol.piatkowski@protonmail.com>
In-Reply-To: <20250414202750.9013-1-dominik.karol.piatkowski@protonmail.com>
References: <20250414202750.9013-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: 8a098daf29bd46c714fb63002270f7f8a8068c96
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Fix indentation that was made with spaces instead of tabs to align with
code style.

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>
---

v2: Split the patch into smaller patches

 drivers/usb/serial/ftdi_sio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index c2b9b8edcc8e..60d24152e385 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -2625,8 +2625,8 @@ static bool ftdi_tx_empty(struct usb_serial_port *por=
t)
  * WARNING: set_termios calls this with old_termios in kernel space
  */
 static void ftdi_set_termios(struct tty_struct *tty,
-=09=09             struct usb_serial_port *port,
-=09=09             const struct ktermios *old_termios)
+=09=09=09     struct usb_serial_port *port,
+=09=09=09     const struct ktermios *old_termios)
 {
 =09struct usb_device *dev =3D port->serial->dev;
 =09struct device *ddev =3D &port->dev;
--=20
2.34.1


