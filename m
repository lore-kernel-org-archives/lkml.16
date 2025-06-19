Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFC430E833;
	Thu, 19 Jun 2025 22:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750371293; cv=none; b=DxKZC8JHMW3fmc6+410OIlCu4NbCq3b5wAA+F0Oo9wQ8RGeOaAKzXXTLykbzLZgQAKHIMTi12AD7nLdnzqZZrQEs6IgIvb0Jmwns0++TY5LFAnLSA3N3U4eNbeiaRjA7n5elF1HOCVOZw8X09YAwOLI04isbsKuUwPLVgA6S+Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750371293; c=relaxed/simple;
	bh=O936/vauKXiVp1nm3ylMAplHgjtRIVP8HwbPflvl1XY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BetngJTdH0w9oRe9bnShj+kx2lFeaAvUXfFNRXm0+5zHFe/pY+6KHbLNpCUcoZLmyVn9W0mmAdO+IUh7+YY+mt55mYdl034GQFARcXORATbmGUpHioZaJwIMSszSkRoXnS8ipXgKL/6h97yI1jyOVjbIvoE8emaNLWLDqNVxCF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=MDPRvwRm; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="MDPRvwRm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750371288; x=1750976088; i=w_armin@gmx.de;
	bh=GNgfsCQIN1H+UxBaxTBvW/rMGREqliyFFcsFenyIrps=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=MDPRvwRmuvDyfNIbCbMX8yKI1DaMIAj+95E8X2xNltk6uML9bIbBzVU+/zaL5Pu5
	 TAMrKbfQdwemO2466VzxVVhCS4VYvkPsCwzttANaZqWzyGiD9iTdYNP0QlrVZ9ug2
	 3M9KrpzCDUoi5BImJcV8lmhsj9aTqNCRL7rc6lQASlM+CFSgiSiCbX8Byks84t9l+
	 KAgXeKLTz9lt528BbxCXH1etrF0yEmCnrUiFerDVUui4n15Oykwz0iRaRiO+4Pmrr
	 34hby3/xBWkI7x9gIX6iijjehbyz4gJtxX+2sRzhpinlDO4ypZyjdmZNnJZqA3xwV
	 N/47NvPa0tkLu5M9JQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([87.177.78.219]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MgvrL-1uyQQH0qaL-00fldx; Fri, 20 Jun 2025 00:14:48 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: dimich.dmb@gmail.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	kuurtb@gmail.com
Cc: corbet@lwn.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: wmi: Update documentation of WCxx/WExx ACPI methods
Date: Fri, 20 Jun 2025 00:14:40 +0200
Message-Id: <20250619221440.6737-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619221440.6737-1-W_Armin@gmx.de>
References: <20250619221440.6737-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SLHGpVlT1rU6QWQGfCDEC9IlWYZ6EfL67Uy+hqxe85k4ebL+QVt
 L/AWM/dMlUJU6tcz0uQ+I3I4F76n3t652nvpMvUnL+SozQOprf3+0pSF47r+8073NgwKg/s
 xLOU+DTe8ES/9PiiDZMw0ODHxykui+Xdhs5n+Dd2rBGvIYLTKuuf7OkYOiVjL8Mk1vti5zJ
 vwTQFv/b8xe2KOQ1cBDCg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Qb7UoZPRIoc=;jLr3+BoN0SxGf3Opz8rRYkTPaa4
 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
 RG3b9gcD6oIr2+bI/WMGBYEMyunMUm9YU+uhRg==

Inform potential firmware developers that WExx ACPI methods are
always called by the WMI driver core even if the associated WMI event
is not marked as being expensive.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 Documentation/wmi/acpi-interface.rst | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/wmi/acpi-interface.rst b/Documentation/wmi/acpi=
-interface.rst
index f1b28835d23c..1ef003b033bf 100644
=2D-- a/Documentation/wmi/acpi-interface.rst
+++ b/Documentation/wmi/acpi-interface.rst
@@ -36,7 +36,7 @@ Offset  Size (in bytes) Content
=20
 The WMI object flags control whether the method or notification ID is use=
d:
=20
=2D- 0x1: Data block usage is expensive and must be explicitly enabled/dis=
abled.
+- 0x1: Data block is expensive to collect.
 - 0x2: Data block contains WMI methods.
 - 0x4: Data block contains ASCIZ string.
 - 0x8: Data block describes a WMI event, use notification ID instead
@@ -83,14 +83,18 @@ event as hexadecimal value. Their first parameter is a=
n integer with a value
 of 0 if the WMI event should be disabled, other values will enable
 the WMI event.
=20
+Those ACPI methods are always called even for WMI events not registered a=
s
+being expensive to collect to match the behavior of the Windows driver.
+
 WCxx ACPI methods
 -----------------
-Similar to the ``WExx`` ACPI methods, except that it controls data collec=
tion
-instead of events and thus the last two characters of the ACPI method nam=
e are
-the method ID of the data block to enable/disable.
+Similar to the ``WExx`` ACPI methods, except that instead of WMI events i=
t controls
+data collection of data blocks registered as being expensive to collect. =
Thus the
+last two characters of the ACPI method name are the method ID of the data=
 block
+to enable/disable.
=20
 Those ACPI methods are also called before setting data blocks to match th=
e
-behaviour of the Windows driver.
+behavior of the Windows driver.
=20
 _WED ACPI method
 ----------------
=2D-=20
2.39.5

