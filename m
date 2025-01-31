Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609E225760
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 20:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738356066; cv=none; b=drIk5buUi8RR4reKUydkgBRWr5DMmVPu18LWBoGC5yv/rTLi9mpmsfUAEfqN5evgucPqGS/pCK3Q4poEkzmiKeNqjAwhPqCehPwEOia28UAvDv2jf8jjKcdkiuFk0tMe/hfH+xof0nDYsrRN042jHP1jKX5z0X4wZ58jEL7ijlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738356066; c=relaxed/simple;
	bh=syc1sIgEYukNEqJa8DChTmRlkTkcWqFoIiEqdImom5k=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cekzgQsKqllc76FI6YP2KBeejsbHvFyFFKzn9efHXKr1G9EXqLTVECkGH9wt7vLnW4awRta/0MuJuUc6GOrL5uZyvkh3i7+FdB/RJRDp/0HWt6qRWf3LkQ3zm2KqJ5dvcWTROcVPeo3bIixmLZ6D3zI157TU5YqcJCbnwSshi9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Tuo2kscC; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Tuo2kscC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1738356048; x=1738615248;
	bh=Yi3JIUM6xwq3zGVkOrxOqLB0T0cu4+4SGhnD3OuiQYU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=Tuo2kscCycnFyLEJBFT7SltaKsLYC76K1zubFu/LdOzD9BI9SuFaZI13js8o4a5m8
	 67F8dMo9+XJgoaMLqFycUIMBC+sQGPG3jgUY03Yy16qFvHZz4gT5RQ5Mdnp4tGwxU7
	 +rifCb31lcXwh/NvMbjFgiyN2PDO+0flLE2B4x9vU4Z2vcU6qU2F4/rK+mwn/vJE54
	 Q4q97i1WXjLKuFbY38MZQrmjqvcyMyDQRLEWQjCS7oEyrdq0fYD8xc3gKNz8xeAvH5
	 lp3TfhvGJILnR3zaepAIe4OR+rkoxVWLBbUMKoMcsJpp5hjnlLdg2KDeUX8AMrXRnM
	 UxntfMJXN447A==
Date: Fri, 31 Jan 2025 20:40:40 +0000
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
From: Sybil Isabel Dorsett <sybdorsett@proton.me>
Cc: Hans de Goede <hdegoede@redhat.com>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Sybil Isabel Dorsett <sybdorsett@proton.me>
Subject: [PATCH] Fix invalid fan speed on ThinkPad X120e
Message-ID: <20250131203854.6608-1-sybdorsett@proton.me>
Feedback-ID: 131381098:user:proton
X-Pm-Message-ID: 654a71d66ed105459ecb1103c6d9ea69b8661d1b
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Fix fan speed reported in ticks per revolution on ThinkPad X120e
by converting the reported value to RPM based on a 22.5 KHz clock.

Based on the information on
https://www.thinkwiki.org/wiki/How_to_control_fan_speed,
the same problem is highly likely to be relevant to at least Edge11,
but Edge11 is not addressed in this patch.

Signed-off-by: Sybil Isabel Dorsett <sybdorsett@proton.me>
---
 drivers/platform/x86/thinkpad_acpi.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/th=
inkpad_acpi.c
index 1fcb0f996..147a70af3 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -7885,6 +7885,7 @@ static struct ibm_struct volume_driver_data =3D {
=20
 #define FAN_NS_CTRL_STATUS=09BIT(2)=09=09/* Bit which determines control i=
s enabled or not */
 #define FAN_NS_CTRL=09=09BIT(4)=09=09/* Bit which determines control is by=
 host or EC */
+#define FAN_CLOCK_TPM=09=09(22500*60)=09/* Ticks per minute for a 22.5 KHz=
 clock */
=20
 enum {=09=09=09=09=09/* Fan control constants */
 =09fan_status_offset =3D 0x2f,=09/* EC register 0x2f */
@@ -7940,6 +7941,7 @@ static int fan_watchdog_maxinterval;
=20
 static bool fan_with_ns_addr;
 static bool ecfw_with_fan_dec_rpm;
+static bool fan_speed_requires_conversion;
=20
 static struct mutex fan_mutex;
=20
@@ -8142,8 +8144,11 @@ static int fan_get_speed(unsigned int *speed)
 =09=09=09     !acpi_ec_read(fan_rpm_offset + 1, &hi)))
 =09=09=09return -EIO;
=20
-=09=09if (likely(speed))
+=09=09if (likely(speed)) {
 =09=09=09*speed =3D (hi << 8) | lo;
+=09=09=09if (fan_speed_requires_conversion && *speed !=3D 0)
+=09=09=09=09*speed =3D FAN_CLOCK_TPM / *speed;
+=09=09}
 =09=09break;
 =09case TPACPI_FAN_RD_TPEC_NS:
 =09=09if (!acpi_ec_read(fan_rpm_status_ns, &lo))
@@ -8176,8 +8181,11 @@ static int fan2_get_speed(unsigned int *speed)
 =09=09if (rc)
 =09=09=09return -EIO;
=20
-=09=09if (likely(speed))
+=09=09if (likely(speed)) {
 =09=09=09*speed =3D (hi << 8) | lo;
+=09=09=09if (fan_speed_requires_conversion && *speed !=3D 0)
+=09=09=09=09*speed =3D FAN_CLOCK_TPM / *speed;
+=09=09}
 =09=09break;
=20
 =09case TPACPI_FAN_RD_TPEC_NS:
@@ -8788,6 +8796,7 @@ static const struct attribute_group fan_driver_attr_g=
roup =3D {
 #define TPACPI_FAN_NOFAN=090x0008=09=09/* no fan available */
 #define TPACPI_FAN_NS=09=090x0010=09=09/* For EC with non-Standard registe=
r addresses */
 #define TPACPI_FAN_DECRPM=090x0020=09=09/* For ECFW's with RPM in register=
 as decimal */
+#define TPACPI_FAN_TPR=09=090x0040=09=09/* Fan speed is in Ticks Per Revol=
ution */
=20
 static const struct tpacpi_quirk fan_quirk_table[] __initconst =3D {
 =09TPACPI_QEC_IBM('1', 'Y', TPACPI_FAN_Q1),
@@ -8817,6 +8826,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __=
initconst =3D {
 =09TPACPI_Q_LNV3('R', '0', 'V', TPACPI_FAN_NS),=09/* 11e Gen5 KL-Y */
 =09TPACPI_Q_LNV3('N', '1', 'O', TPACPI_FAN_NOFAN),=09/* X1 Tablet (2nd gen=
) */
 =09TPACPI_Q_LNV3('R', '0', 'Q', TPACPI_FAN_DECRPM),/* L480 */
+=09TPACPI_Q_LNV('8', 'F', TPACPI_FAN_TPR),=09=09/* ThinkPad x120e */
 };
=20
 static int __init fan_init(struct ibm_init_struct *iibm)
@@ -8887,6 +8897,8 @@ static int __init fan_init(struct ibm_init_struct *ii=
bm)
=20
 =09=09=09if (quirks & TPACPI_FAN_Q1)
 =09=09=09=09fan_quirk1_setup();
+=09=09=09if (quirks & TPACPI_FAN_TPR)
+=09=09=09=09fan_speed_requires_conversion =3D true;
 =09=09=09/* Try and probe the 2nd fan */
 =09=09=09tp_features.second_fan =3D 1; /* needed for get_speed to work */
 =09=09=09res =3D fan2_get_speed(&speed);
--=20
2.39.5


