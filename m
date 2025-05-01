Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810A11DB13A
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 20:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746129918; cv=none; b=MAKGGiVSaJOvo3pIWbtOdts/0rA6DpA6h0FdFpu86FPtN+PUIKvTmidJu9GzEjiDn28oMi5Tj/4/eZt/nJ+BpNk1OxGvUOt1sZQm9wgE6bmuuf7m/HJ84IIXmx5jSR3M0lXfY7R/Ct0bavyPowColyRv8fO6jec3iD75+VKYOE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746129918; c=relaxed/simple;
	bh=26KLM5dZRQ3NJjBdM1DhkpkwsRdAzHVwQwn315ygHgk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=E10RLAGof+7dXj29yMGuA90iDW+7zEfn1NYHyZR+N3NsUPaQC62ZOx8mNih0S8SonjjEeSZLfOg8n/NBYNbe/RPHTFQ5m8R4wbTLZx3UbeV4QRY0kBpoNAWuy5xa0q4W3IN8f2PkqRJzlOrSbaa7tMWWdFNjR2S/C1aIY8v3vFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=D7l+MFer; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="D7l+MFer"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1746129905; x=1746389105;
	bh=KW982IgOoBOOp3BAl/UFrj9WOFU9ekJ0484lkiUFlcI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=D7l+MFerQ2IyiZvseotrVpK9WKLI4Vx3lNoh/3o3MZBUpoC37Zwy09SscI/g80UUY
	 kHCJItdTGsoxXny9qWrpua/J9U3TukAVt3uKGQ9+Ew5uxubjxDR3Wbm0IMrf3dKx3H
	 qWKq92CreXbNmSSWOYY8u/T81sR4yfz+6+WKerr8VTKpvHPzOMZc2I6wEFqvQYLb/R
	 YgnEsSn0GbAiXbk4TYIGdTR+on62117J3vVfvqJ5P/EIwTDfukwNwfgM4T9SmHIcAm
	 GIlTCZMPZlI5IgaVZL/bl+fg2ljZ+Ibz9zC+ppwGBt81tU0MD8nydvq70guBjb+gqb
	 E1O2DWtWldnxg==
Date: Thu, 01 May 2025 20:05:00 +0000
To: gregkh@linuxfoundation.org, arnd@arndb.de, linux-kernel@vger.kernel.org
From: Roxana Nicolescu <nicolescu.roxana@protonmail.com>
Cc: markgross@kernel.org, skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] char: tlclk: Fix correct sysfs directory path for tlclk
Message-ID: <20250501200457.18506-1-nicolescu.roxana@protonmail.com>
Feedback-ID: 136600343:user:proton
X-Pm-Message-ID: 066c63416cf39cec242c32130da7e333f07a70be
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The tlckl driver does not create a platform device anymore. It was
recently changed to use a faux device instead. Therefore the sysfs path
has changed from /sys/devices/platform/telco_clock to
/sys/devices/faux/telco_clock.

Fixes: 72239a78f9f5 ("tlclk: convert to use faux_device")
Signed-off-by: Roxana Nicolescu <nicolescu.roxana@protonmail.com>
---
 drivers/char/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
index 8fb33c90482f..ae6196760556 100644
--- a/drivers/char/Kconfig
+++ b/drivers/char/Kconfig
@@ -404,7 +404,7 @@ config TELCLOCK
 =09  configuration of the telecom clock configuration settings.  This
 =09  device is used for hardware synchronization across the ATCA backplane
 =09  fabric.  Upon loading, the driver exports a sysfs directory,
-=09  /sys/devices/platform/telco_clock, with a number of files for
+=09  /sys/devices/faux/telco_clock, with a number of files for
 =09  controlling the behavior of this hardware.
=20
 source "drivers/s390/char/Kconfig"
--=20
2.34.1


