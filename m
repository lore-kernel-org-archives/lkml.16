Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0891FECDF;
	Mon,  3 Feb 2025 13:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738587852; cv=none; b=q8JfLzRabie5xlvy37cmDS+DFHdgQWVglAtzKhHIICUregapoY9pdPVbL+fEcSSLE/TT3XvkpknoAByoOELRshS3pEMaCvVIW0G7gxUp8q0h6BUr+QV7nhngbC7dzakIOuwQuw5KZy6Bg9CaaSJIjqtfuO2A1JPghw3FWt1kPBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738587852; c=relaxed/simple;
	bh=KumOaeExJYWoZFrQ1WczsCS0W0XjuVxxfDDFoiYqKH8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c8iXyZ3hKJof4CfC35qO24vGLvbnAejoBGYDpdY8AqRIiZyIhubf5HebbYAf3XJ2Sha4p1iPVjg4mH9dWnCwKf+N0O0DAVES8yR9Q8oIyx80er0iiZFY0cjQDMJG9ibwiHQVoJisqFD43bVHrS/fshik48dQRv0/D5CJ3Sh72xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=j/A5YlR1; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="j/A5YlR1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1738587834; x=1738847034;
	bh=lyI94ufJSh6lUlXJ/S+lNXlUptY1Rt7+L5fRyXKExDc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=j/A5YlR1OSTSSAumUsgXC+R4fdLKWatY7G2n8XvPkISmqT4p01Rh4f0svywa/IoPf
	 KGrH7vk2RCfux+8KrnpXPKWXhi02A0UiR1nyVTP1zajr08p0MISm/KqqN4RK1ZgU+n
	 C6U/7BYpt3crr67QsepucSHjmhkcW+9m6I/SgiCkovA2axbNqfBLE5JnNs/HvbmhRQ
	 ZznpWuyeUFkwbNSZhr47ZceMuS4vAN9yw37E4+I1YWi6x/eFkyhDCDr1FQAa4Qvw4b
	 sQml+4qBKPi/AUseIW+h7fja/Ym+MHJthoHx6JkkTOYj0u3zNeXowOtD5E/5ZbXDEo
	 jp9MlWFDg/DBQ==
Date: Mon, 03 Feb 2025 13:03:49 +0000
To: =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Sybil Isabel Dorsett <sybdorsett@proton.me>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Hans de Goede <hdegoede@redhat.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] Fix invalid fan speed on ThinkPad X120e
Message-ID: <20250203130232.3481-1-sybdorsett@proton.me>
In-Reply-To: <69e279a3-7fd5-9dc3-680d-7415022dc5e4@linux.intel.com>
References: <20250131203854.6608-1-sybdorsett@proton.me> <69e279a3-7fd5-9dc3-680d-7415022dc5e4@linux.intel.com>
Feedback-ID: 131381098:user:proton
X-Pm-Message-ID: 7d598d5d06022fda869b199f2c42873aecb158bc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On ThinkPad X120e, fan speed is incorrectly reported in ticks
per revolution rather than RPM.

Recaculate the fan speed value reported for ThinkPad X120e
to RPM based on a 22.5 kHz clock.

Based on the information on
https://www.thinkwiki.org/wiki/How_to_control_fan_speed,
the same problem is highly likely to be relevant to at least Edge11,
but Edge11 is not addressed in this patch.

Signed-off-by: Sybil Isabel Dorsett <sybdorsett@proton.me>
---

Notes:
    v2: addressed review comments
        - name of the new variable is changed
          from "fan_speed_requires_conversion" to "fan_speed_in_tpr";
        - rephrased the commit message;
        - "KHz" is respelled as "kHz".

 drivers/platform/x86/thinkpad_acpi.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/th=
inkpad_acpi.c
index 1fcb0f996..e7778ea41 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -7885,6 +7885,7 @@ static struct ibm_struct volume_driver_data =3D {
=20
 #define FAN_NS_CTRL_STATUS=09BIT(2)=09=09/* Bit which determines control i=
s enabled or not */
 #define FAN_NS_CTRL=09=09BIT(4)=09=09/* Bit which determines control is by=
 host or EC */
+#define FAN_CLOCK_TPM=09=09(22500*60)=09/* Ticks per minute for a 22.5 kHz=
 clock */
=20
 enum {=09=09=09=09=09/* Fan control constants */
 =09fan_status_offset =3D 0x2f,=09/* EC register 0x2f */
@@ -7940,6 +7941,7 @@ static int fan_watchdog_maxinterval;
=20
 static bool fan_with_ns_addr;
 static bool ecfw_with_fan_dec_rpm;
+static bool fan_speed_in_tpr;
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
+=09=09=09if (fan_speed_in_tpr && *speed !=3D 0)
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
+=09=09=09if (fan_speed_in_tpr && *speed !=3D 0)
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
+=09=09=09=09fan_speed_in_tpr =3D true;
 =09=09=09/* Try and probe the 2nd fan */
 =09=09=09tp_features.second_fan =3D 1; /* needed for get_speed to work */
 =09=09=09res =3D fan2_get_speed(&speed);
--=20
2.39.5


