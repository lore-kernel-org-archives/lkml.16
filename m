Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A071525B67D;
	Thu, 19 Jun 2025 22:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750371293; cv=none; b=I8vC3wk9dCJ0NcTlHfHFnr6pGavBXOT+ySsU1uJIRrydx5XOiCY+Gh2qx++fMaGhrXpcyqz9bHauHgr0D64KmWJbqwOfHAwzSiEJc35qbv+GFUbTy9eMRjE7dwy67NW4UmBbm792oqcIrUFlOvGQ/6xFEiKqVWr1U7YQ2gbjrzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750371293; c=relaxed/simple;
	bh=4pEeREFybpd/OnCjYi3h6TofHXkoRxCnxIpsfW2tmng=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NXuMqpL8gUvbv1Up5sDjyUu0HHirTql4elEULYFEbzfMbSh2jnNPLHXQKSXHnxJ1323yAtag2CndD5RjtzgDzectNY6mii/FEZx04rwl8aBcyGfpHRlpnkDT2sqfJlUSSUm38n1PI9XsdgHNyDSvNZAoDc9xoc/cwdGQZTBsXDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=jVE8sEFi; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="jVE8sEFi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750371285; x=1750976085; i=w_armin@gmx.de;
	bh=4ErRuAzCnDZGL5TW/v1gasHoSkgO2RZnnNnbdc0/nfQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jVE8sEFiBCimJjCOt1zpa6u1H2iwPiWrjuikeTvqTQ9g3dDCjYkjXEmOIqHwdfz8
	 wP14BAHZ6Ms9ctB+gOw+VaOu906j9kID0o9OBSXX6JYBz/D1yCHcDvR2kmhbDktV7
	 mKF398O7NjaOgv59vahhmAJcSlzHHwvWPVeQNytntC39WWlSN3+nSoX3Oa+ztm2a1
	 6TJm2r/CYNzMFNKfJ/GFaDNTHDQ1BHGIWfb16iDbmr9t2V8e22+uuVsb5CPN4O5Ob
	 ac1Yt2UfBYk8APvYWkxV7jxJ0Cb6mPxtwbSdwFAIUf0KL4lK9pkTsCt/Cfw9VpJUW
	 6bw4qUcG4QWGgb6qIQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([87.177.78.219]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mo6v3-1v8u1W1TgZ-00mclk; Fri, 20 Jun 2025 00:14:45 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: dimich.dmb@gmail.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	kuurtb@gmail.com
Cc: corbet@lwn.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: wmi: Fix WMI event enablement
Date: Fri, 20 Jun 2025 00:14:39 +0200
Message-Id: <20250619221440.6737-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fFxLv2+Ugj2b37UX4mUm00qGoYvYuDCP7E09ILb1L2qmWjis55b
 g/taT1tAHgqOiShGmNbCr/XtEZ291mBuOqb+760g3KKbe2TMop1hCSKlh15DE7Tzj6AipJK
 IYbMPaaDCqtNqgnIqutsB3XcBQK5hSoPd7Zcj2SWbhs8VuQ7B6HiUL4slsXRZ4aaOPEQjar
 RqRwRUo7rw/4GdMWbf0vA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:CiiW+VObMx0=;QIP9ZH1IJX2dTzlPPKK5hjQJJgf
 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
 lR9fKfmt9/RFbcYF

It turns out that the Windows WMI-ACPI driver always enables/disables
WMI events regardless of whether they are marked as expensive or not.
This finding is further reinforced when reading the documentation of
the WMI_FUNCTION_CONTROL_CALLBACK callback used by Windows drivers
for enabling/disabling WMI devices:

	The DpWmiFunctionControl routine enables or disables
	notification of events, and enables or disables data
	collection for data blocks that the driver registered
	as expensive to collect.

Follow this behavior to fix the WMI event used for reporting hotkey
events on the Dell Latitude 5400 and likely many more devices.

Reported-by: Dmytro Bagrii <dimich.dmb@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D220246
Tested-by: Dmytro Bagrii <dimich.dmb@gmail.com>
Fixes: 656f0961d126 ("platform/x86: wmi: Rework WCxx/WExx ACPI method hand=
ling")
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/wmi.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 21b7e54bd7ab..4e86a422f05f 100644
=2D-- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -180,16 +180,22 @@ static int wmi_device_enable(struct wmi_device *wdev=
, bool enable)
 	acpi_handle handle;
 	acpi_status status;
=20
-	if (!(wblock->gblock.flags & ACPI_WMI_EXPENSIVE))
-		return 0;
-
 	if (wblock->dev.dev.type =3D=3D &wmi_type_method)
 		return 0;
=20
-	if (wblock->dev.dev.type =3D=3D &wmi_type_event)
+	if (wblock->dev.dev.type =3D=3D &wmi_type_event) {
+		/*
+		 * Windows always enables/disables WMI events, even when they are
+		 * not marked as being expensive. We follow this behavior for
+		 * compatibility reasons.
+		 */
 		snprintf(method, sizeof(method), "WE%02X", wblock->gblock.notify_id);
-	else
+	} else {
+		if (!(wblock->gblock.flags & ACPI_WMI_EXPENSIVE))
+			return 0;
+
 		get_acpi_method_name(wblock, 'C', method);
+	}
=20
 	/*
 	 * Not all WMI devices marked as expensive actually implement the
=2D-=20
2.39.5

