Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735621E1DEF;
	Mon, 14 Apr 2025 20:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744662522; cv=none; b=SsIQAiPbXkJQeIpuWbN+J3XjXug/q5tp0VKtM0iTruaxVcvNbugXa3IKSAj7EtZEEqDXbg2sm8JJHNAjDWQjA4NnilNwrffCxuVMmF/vrCEpx0Enn9FqRXsdBOeae2NivIPHavjzkvpQkX6Jxdj3VB79XItKV6sYGIDNtbY23Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744662522; c=relaxed/simple;
	bh=tmMoYs9RIJY8JE+MjASDE7DvS+BS0lXX6Gh/vx2/yys=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ECLcH7icdHYVzt3uUk9zSR921tcfFnlfKHpatG2HP29MDXVKTgm5VqhsloOgCgdSLOOT7pr0wnsUhGv9DjC++7kMRDxKnfre1dBEYK7HCQd9asemDpNruwrQcj3Yplrs/pVxucxcAj+kPHCbpv0JC+iqJ5spfmcQlebBTURhhuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=SF1syiyb; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="SF1syiyb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1744662518; x=1744921718;
	bh=tmMoYs9RIJY8JE+MjASDE7DvS+BS0lXX6Gh/vx2/yys=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=SF1syiyb/QHcu8pthyLx6beKordc/dG0WqIfqXAwWk13iYdCagZAxwfeEGYRS2rgq
	 vR1/SVriIJX8q0uIPhTI/igtk4nWiLDtpAcDculpnoK3O9AfCaJ+84aj/JJu0KK3bt
	 Rym1ikGw0lgsW7DjYGR4pbsrgkYxXHrCGJ8t25Tx7XqgQeBOnNdZS6zFYlZdTHoIjV
	 St7xspY6QiK5mzLbzq2x0TNMOqTgcf5f5Y1eNGEUiA3BDiZlKjDUyCKrljYUiKp7UE
	 i09U0CTjdD/fz1Fzm+fokbyDaRjmuRJ6QpqDUuuLf+dwI4TZRkP4DTsDQEYdKe5aAB
	 YkVJcm+xkirBg==
Date: Mon, 14 Apr 2025 20:28:32 +0000
To: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH v2 RESEND 3/6] USB: serial: ftdi_sio: Remove superfluous space before statements
Message-ID: <20250414202750.9013-4-dominik.karol.piatkowski@protonmail.com>
In-Reply-To: <20250414202750.9013-1-dominik.karol.piatkowski@protonmail.com>
References: <20250414202750.9013-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: 5b1d28e026652a1776a87defe7c901ddf022422e
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Remove superfluous space between indenting tabs and statements to align
with code style.

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>
---

v2: Split the patch into smaller patches

 drivers/usb/serial/ftdi_sio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index f52bab3a3bfd..c2b9b8edcc8e 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1161,7 +1161,7 @@ static unsigned short int ftdi_232am_baud_base_to_div=
isor(int baud, int base)
=20
 static unsigned short int ftdi_232am_baud_to_divisor(int baud)
 {
-=09 return ftdi_232am_baud_base_to_divisor(baud, 48000000);
+=09return ftdi_232am_baud_base_to_divisor(baud, 48000000);
 }
=20
 static u32 ftdi_232bm_baud_base_to_divisor(int baud, int base)
@@ -1183,7 +1183,7 @@ static u32 ftdi_232bm_baud_base_to_divisor(int baud, =
int base)
=20
 static u32 ftdi_232bm_baud_to_divisor(int baud)
 {
-=09 return ftdi_232bm_baud_base_to_divisor(baud, 48000000);
+=09return ftdi_232bm_baud_base_to_divisor(baud, 48000000);
 }
=20
 static u32 ftdi_2232h_baud_base_to_divisor(int baud, int base)
@@ -1213,7 +1213,7 @@ static u32 ftdi_2232h_baud_base_to_divisor(int baud, =
int base)
=20
 static u32 ftdi_2232h_baud_to_divisor(int baud)
 {
-=09 return ftdi_2232h_baud_base_to_divisor(baud, 120000000);
+=09return ftdi_2232h_baud_base_to_divisor(baud, 120000000);
 }
=20
 #define set_mctrl(port, set)=09=09update_mctrl((port), (set), 0)
--=20
2.34.1


