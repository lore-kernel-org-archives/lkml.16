Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7411A2054EE;
	Mon,  3 Feb 2025 13:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588573; cv=none; b=eein1UveBrYqSgNQwg1TWKI3O6kTElMPjoiTs7fxkUqTGUyfk6BCvaFI8HVXNBfnQjcAfWoLckLEJ3Rn9wkRJiSXQopuZmG6oRzIC7DSSimZ2uWnoep1UyuRv/LYXm/kIL4JcT9JQymGlp9N3VceOwaH0CwlvxOz/d9lS+NXXAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588573; c=relaxed/simple;
	bh=B36CdIu2ZGIqc8/YsWGKv39jqsJp/DbS6uMb+98QctI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cXZbXdEiuuf56AyTKixH46aqqdhDRfzeOmC+PJW3GIt33tcSzaK466M6bRv/FJ/YDQFmfbBBoRiKXRR6LxY0Iz6x557XUa31YNe225gb4wgHi1VIQUkvBOgoRSuYZMhOxn+6Du5H4RdvE1NGXt16lVhTLDV+N9+AgU3CIFz23Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fv+Dlof3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fv+Dlof3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738588571; x=1770124571;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=B36CdIu2ZGIqc8/YsWGKv39jqsJp/DbS6uMb+98QctI=;
  b=fv+Dlof3FeqZtjtWuLPTCGmUhFZit5qbRM4KCke9GQnT4FTWqfgOphhl
   OP3gaY4nNsHM0aKkfOw8rDwLLLF/m31SJhtoTSU4z68Z134vmONnUzZQD
   fJpwMUudnMk0mDie/g3UUIhrMWzf9f2H8O/0p2TfoFtQnrjlEckGwtJ9B
   3cryFRmun4fFAMMWLpfEneEM8DUFy3a/URIBSmPb5oeQGiY4DzpDhPdq0
   4/Y97J3emUPTBULWES9wfyFPNMjO9t3fRe/5HFX5c+bj2hHhJHP2/PM+A
   J5lByDnA7ZyfRm8xqQTG+b9DX9sN0e8KNeX1uRr30jryf/CrlVhbCBTIJ
   Q==;
X-CSE-ConnectionGUID: rLZdMQXESb6jyKcL5KcRlA==
X-CSE-MsgGUID: jQWFdBZsTue9E8UyMXdvCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="49683484"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="49683484"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:16:10 -0800
X-CSE-ConnectionGUID: HAg9gQiAQ4erBu0V7ZTasQ==
X-CSE-MsgGUID: +C1FFZkNSWG3r/7iDmd7gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110457943"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.194])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:16:08 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 3 Feb 2025 15:16:05 +0200 (EET)
To: Sybil Isabel Dorsett <sybdorsett@proton.me>
cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
    Hans de Goede <hdegoede@redhat.com>, ibm-acpi-devel@lists.sourceforge.net, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] Fix invalid fan speed on ThinkPad X120e
In-Reply-To: <20250203130232.3481-1-sybdorsett@proton.me>
Message-ID: <d20f933c-8041-bc8d-13c2-98d89ccfa524@linux.intel.com>
References: <20250131203854.6608-1-sybdorsett@proton.me> <69e279a3-7fd5-9dc3-680d-7415022dc5e4@linux.intel.com> <20250203130232.3481-1-sybdorsett@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1162884328-1738588565=:934"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1162884328-1738588565=:934
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 3 Feb 2025, Sybil Isabel Dorsett wrote:

> On ThinkPad X120e, fan speed is incorrectly reported in ticks

I'd drop "incorrectly".

> per revolution rather than RPM.
>=20
> Recaculate the fan speed value reported for ThinkPad X120e

Recalculate

With those two changed, feel free to add:

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--
 i.

> to RPM based on a 22.5 kHz clock.
>=20
> Based on the information on
> https://www.thinkwiki.org/wiki/How_to_control_fan_speed,
> the same problem is highly likely to be relevant to at least Edge11,
> but Edge11 is not addressed in this patch.
>=20
> Signed-off-by: Sybil Isabel Dorsett <sybdorsett@proton.me>
> ---
>=20
> Notes:
>     v2: addressed review comments
>         - name of the new variable is changed
>           from "fan_speed_requires_conversion" to "fan_speed_in_tpr";
>         - rephrased the commit message;
>         - "KHz" is respelled as "kHz".
>=20
>  drivers/platform/x86/thinkpad_acpi.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/=
thinkpad_acpi.c
> index 1fcb0f996..e7778ea41 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -7885,6 +7885,7 @@ static struct ibm_struct volume_driver_data =3D {
> =20
>  #define FAN_NS_CTRL_STATUS=09BIT(2)=09=09/* Bit which determines control=
 is enabled or not */
>  #define FAN_NS_CTRL=09=09BIT(4)=09=09/* Bit which determines control is =
by host or EC */
> +#define FAN_CLOCK_TPM=09=09(22500*60)=09/* Ticks per minute for a 22.5 k=
Hz clock */
> =20
>  enum {=09=09=09=09=09/* Fan control constants */
>  =09fan_status_offset =3D 0x2f,=09/* EC register 0x2f */
> @@ -7940,6 +7941,7 @@ static int fan_watchdog_maxinterval;
> =20
>  static bool fan_with_ns_addr;
>  static bool ecfw_with_fan_dec_rpm;
> +static bool fan_speed_in_tpr;
> =20
>  static struct mutex fan_mutex;
> =20
> @@ -8142,8 +8144,11 @@ static int fan_get_speed(unsigned int *speed)
>  =09=09=09     !acpi_ec_read(fan_rpm_offset + 1, &hi)))
>  =09=09=09return -EIO;
> =20
> -=09=09if (likely(speed))
> +=09=09if (likely(speed)) {
>  =09=09=09*speed =3D (hi << 8) | lo;
> +=09=09=09if (fan_speed_in_tpr && *speed !=3D 0)
> +=09=09=09=09*speed =3D FAN_CLOCK_TPM / *speed;
> +=09=09}
>  =09=09break;
>  =09case TPACPI_FAN_RD_TPEC_NS:
>  =09=09if (!acpi_ec_read(fan_rpm_status_ns, &lo))
> @@ -8176,8 +8181,11 @@ static int fan2_get_speed(unsigned int *speed)
>  =09=09if (rc)
>  =09=09=09return -EIO;
> =20
> -=09=09if (likely(speed))
> +=09=09if (likely(speed)) {
>  =09=09=09*speed =3D (hi << 8) | lo;
> +=09=09=09if (fan_speed_in_tpr && *speed !=3D 0)
> +=09=09=09=09*speed =3D FAN_CLOCK_TPM / *speed;
> +=09=09}
>  =09=09break;
> =20
>  =09case TPACPI_FAN_RD_TPEC_NS:
> @@ -8788,6 +8796,7 @@ static const struct attribute_group fan_driver_attr=
_group =3D {
>  #define TPACPI_FAN_NOFAN=090x0008=09=09/* no fan available */
>  #define TPACPI_FAN_NS=09=090x0010=09=09/* For EC with non-Standard regis=
ter addresses */
>  #define TPACPI_FAN_DECRPM=090x0020=09=09/* For ECFW's with RPM in regist=
er as decimal */
> +#define TPACPI_FAN_TPR=09=090x0040=09=09/* Fan speed is in Ticks Per Rev=
olution */
> =20
>  static const struct tpacpi_quirk fan_quirk_table[] __initconst =3D {
>  =09TPACPI_QEC_IBM('1', 'Y', TPACPI_FAN_Q1),
> @@ -8817,6 +8826,7 @@ static const struct tpacpi_quirk fan_quirk_table[] =
__initconst =3D {
>  =09TPACPI_Q_LNV3('R', '0', 'V', TPACPI_FAN_NS),=09/* 11e Gen5 KL-Y */
>  =09TPACPI_Q_LNV3('N', '1', 'O', TPACPI_FAN_NOFAN),=09/* X1 Tablet (2nd g=
en) */
>  =09TPACPI_Q_LNV3('R', '0', 'Q', TPACPI_FAN_DECRPM),/* L480 */
> +=09TPACPI_Q_LNV('8', 'F', TPACPI_FAN_TPR),=09=09/* ThinkPad x120e */
>  };
> =20
>  static int __init fan_init(struct ibm_init_struct *iibm)
> @@ -8887,6 +8897,8 @@ static int __init fan_init(struct ibm_init_struct *=
iibm)
> =20
>  =09=09=09if (quirks & TPACPI_FAN_Q1)
>  =09=09=09=09fan_quirk1_setup();
> +=09=09=09if (quirks & TPACPI_FAN_TPR)
> +=09=09=09=09fan_speed_in_tpr =3D true;
>  =09=09=09/* Try and probe the 2nd fan */
>  =09=09=09tp_features.second_fan =3D 1; /* needed for get_speed to work *=
/
>  =09=09=09res =3D fan2_get_speed(&speed);
>=20
--8323328-1162884328-1738588565=:934--
