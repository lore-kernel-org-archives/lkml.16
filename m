Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2227E0E8;
	Sun, 20 Apr 2025 22:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745188428; cv=none; b=Ng3Kc0RGcxHFojazy3zCAV0qS8dzXaJCDYBmcVBDK+66Va2OcFzbITeoEqS8DQvszInS84qfpSoZHVPkA/2+dej5mpzFt36ZxFP2BcGT774dBS5TKOpRUhbWor9SL0Do45GBXKx6kju8mAi8hDy4bWDOjqsc7OM7Ruf7ZvqFd7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745188428; c=relaxed/simple;
	bh=Qx3z+j2HX+QOxtcS4rs6ymT9x6wbAF7BUh+b0bmZ6yc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cMnkHuDpGPLa10WVTbkpOPponzqCSzDEeC/BTKQt1gU66s3qb9avF4h6QFPJaDG9OWmCtBY4r994bjYmk2vXVG3M2k/yLElv3OKRdZggU2f+e4kAnfgv4nGCof8NNxUn2jZeS/em1PgbFy+vjhO+ZsUDbJ3F45a5dsc811QMMAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=HBp5SRi5; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="HBp5SRi5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1745188418; x=1745793218; i=w_armin@gmx.de;
	bh=fthjne6OmtQsqrjZYqKaJ4Y0cGO+9TN6rwmAoJnV36A=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=HBp5SRi5FDnGpsPuGehLj43E9TSci625Ms23qz/namDjhFwxSQGC6Htkiq8ZD935
	 9QjViiZ3JtzIxFCGUqk8195Y2nIu3WWncjJpJTsiW2vjwFwOfHuyJ3uptvaWBplgN
	 v8iZTlzl3ZGfc/T+ChionqcrnufRBgjUxKA4/niW9nSPGTilar1tfVQF5oXlACL1A
	 dYonfNPgkVqrNPMMj55lkAaEEurCUNqPNZcXNzN9zL4vZUtZgMc4bH/iu01hp5yip
	 HEwNMUQPg7h0dcJY8tUAhwoafaK/fR4bYJaKKCp1aNa4tZg3sFwlvOHDHvQJiqCNn
	 8W9AGUuDJ7VhAs05xA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([87.177.78.219]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MGQj7-1uKbsK2zHx-00B2vC; Mon, 21 Apr 2025 00:33:37 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: pali@kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (dell-smm) Add the Dell OptiPlex 7050 to the DMI whitelist
Date: Mon, 21 Apr 2025 00:33:34 +0200
Message-Id: <20250420223334.12920-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:a5v2M1/aVJwtTiYXPCtpcf4tGhECL+5M5JZHEDptnwwmKwvauOo
 2ELyPGJEVMdpvKo23OSHq1qt4p75/jU7QuHB07bCV/T4IqgufsgsNr/EPvhZBoG4o3twCCX
 0E7zkwIAV2EoqB5rMUeH2Ze6BX2PKQzffXQ5aQGOlfQISl7vfanIkwiGA9oeIWgTbdQQjsg
 o23ruW2UakLh4sxCuOj3g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:iWCLIIbyJjA=;s395TWvMMMz4XcIM9PeTCaMAZ3/
 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
 BxJx3qR85GFSs=

A user reported that the driver works on the OptiPlex 7050. Add this
machine to the DMI whitelist.

Closes: https://github.com/Wer-Wolf/i8kutils/issues/12
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 79e5606e6d2f..1e2c8e284001 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1273,6 +1273,13 @@ static const struct dmi_system_id i8k_dmi_table[] _=
_initconst =3D {
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "OptiPlex 7060"),
 		},
 	},
+	{
+		.ident =3D "Dell OptiPlex 7050",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "OptiPlex 7050"),
+		},
+	},
 	{
 		.ident =3D "Dell Precision",
 		.matches =3D {
=2D-=20
2.39.5

