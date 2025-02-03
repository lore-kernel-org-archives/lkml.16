Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF521137932;
	Mon,  3 Feb 2025 09:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738573630; cv=none; b=cIX4ovN00EbuCJM5XwLLBnIDg/GY5X1vOKFReCo1bi5B7ScthoOcWyI6sXSccybwaoJ9AdXKq92u5LPu3/oibuo5KhCLsKLXvAOQWA1LMXK4K9ocHKzWb8TyXZ5iQtjqHAKH5AO2YWY64f4Z8mTSwoxcjSJvPWA+22s80DkAri0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738573630; c=relaxed/simple;
	bh=xrg3zyRvkjTS3AygFhzB3mjFbXZSuEeWNrskZZUi6cw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oEl8BSiQ2qDX657BaFhwTMIeZSOjJwGXRkmvR1M5VmJE5u9OczG6XnnxrhrYZuKt0xnnDsIoHw6CE8yev5h6FoQ5YE42pTwf3iHDLEHC8K/2ZDP1xO4ZBVoxvYU7WZPvhew9zsXTgsu+/vga8EXg8pE4TGbmDBX3ZvqlKEPo744=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k4uL5zfJ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k4uL5zfJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738573629; x=1770109629;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=xrg3zyRvkjTS3AygFhzB3mjFbXZSuEeWNrskZZUi6cw=;
  b=k4uL5zfJ8iDjZz+bZu5+FG7g5kg/F8NOmaBdf68D1k/QKIytU9t1Mvcx
   dW5v24ZW3VsQF/ALVg3IkJirpLtaDwxCoFms5kbnqCxc1w0pV7Cv2snwf
   qkj6BZZhaaqy7zzM0z8gOUGWEn1sZJp5H+pLEzj3g65Cv5OxnKHEUtfBB
   igDe17xh5rQ97LAhhB7kiXprQwhf9Mk6TenzvWSqQbGwgz7pk+Xwq1fEv
   8OPS8vUDH/jb+vI1BF1VEiuHO51cR81e5NuTPWfkp31pOT9YD/z8MgITX
   W+gk7bUx4+3gKthq3u1kwByX+utmQzmTpvPV0G89AejaaIeK2nX2Blhb7
   Q==;
X-CSE-ConnectionGUID: QJFhiKdiSvavKuXgijKrxA==
X-CSE-MsgGUID: l3FEaV8VTuGhHsa9tD0tmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="64413298"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="64413298"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:07:08 -0800
X-CSE-ConnectionGUID: NxJvendURZy4Fo1gx7mHiw==
X-CSE-MsgGUID: nc49Vyd6QDW7W7RD/atFHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110059743"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.194])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:07:05 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 3 Feb 2025 11:07:02 +0200 (EET)
To: Sybil Isabel Dorsett <sybdorsett@proton.me>
cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
    Hans de Goede <hdegoede@redhat.com>, ibm-acpi-devel@lists.sourceforge.net, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Fix invalid fan speed on ThinkPad X120e
In-Reply-To: <20250131203854.6608-1-sybdorsett@proton.me>
Message-ID: <69e279a3-7fd5-9dc3-680d-7415022dc5e4@linux.intel.com>
References: <20250131203854.6608-1-sybdorsett@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 31 Jan 2025, Sybil Isabel Dorsett wrote:

> Fix fan speed reported in ticks per revolution on ThinkPad X120e

Don't start with "Fix" here but just state what's the problem/situation...

"On ThinkPad X120e, [...]"

> by converting the reported value to RPM based on a 22.5 KHz clock.

...then tell you fix it by converting the value.

kHz

> Based on the information on
> https://www.thinkwiki.org/wiki/How_to_control_fan_speed,
> the same problem is highly likely to be relevant to at least Edge11,
> but Edge11 is not addressed in this patch.
> 
> Signed-off-by: Sybil Isabel Dorsett <sybdorsett@proton.me>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 1fcb0f996..147a70af3 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -7885,6 +7885,7 @@ static struct ibm_struct volume_driver_data = {
>  
>  #define FAN_NS_CTRL_STATUS	BIT(2)		/* Bit which determines control is enabled or not */
>  #define FAN_NS_CTRL		BIT(4)		/* Bit which determines control is by host or EC */
> +#define FAN_CLOCK_TPM		(22500*60)	/* Ticks per minute for a 22.5 KHz clock */

kHz

>  
>  enum {					/* Fan control constants */
>  	fan_status_offset = 0x2f,	/* EC register 0x2f */
> @@ -7940,6 +7941,7 @@ static int fan_watchdog_maxinterval;
>  
>  static bool fan_with_ns_addr;
>  static bool ecfw_with_fan_dec_rpm;
> +static bool fan_speed_requires_conversion;
>  
>  static struct mutex fan_mutex;
>  
> @@ -8142,8 +8144,11 @@ static int fan_get_speed(unsigned int *speed)
>  			     !acpi_ec_read(fan_rpm_offset + 1, &hi)))
>  			return -EIO;
>  
> -		if (likely(speed))
> +		if (likely(speed)) {
>  			*speed = (hi << 8) | lo;
> +			if (fan_speed_requires_conversion && *speed != 0)

The variable should be named something like fan_speed_in_tpr or something 
along those lines.

> +				*speed = FAN_CLOCK_TPM / *speed;
> +		}
>  		break;
>  	case TPACPI_FAN_RD_TPEC_NS:
>  		if (!acpi_ec_read(fan_rpm_status_ns, &lo))
> @@ -8176,8 +8181,11 @@ static int fan2_get_speed(unsigned int *speed)
>  		if (rc)
>  			return -EIO;
>  
> -		if (likely(speed))
> +		if (likely(speed)) {
>  			*speed = (hi << 8) | lo;
> +			if (fan_speed_requires_conversion && *speed != 0)
> +				*speed = FAN_CLOCK_TPM / *speed;
> +		}
>  		break;
>  
>  	case TPACPI_FAN_RD_TPEC_NS:
> @@ -8788,6 +8796,7 @@ static const struct attribute_group fan_driver_attr_group = {
>  #define TPACPI_FAN_NOFAN	0x0008		/* no fan available */
>  #define TPACPI_FAN_NS		0x0010		/* For EC with non-Standard register addresses */
>  #define TPACPI_FAN_DECRPM	0x0020		/* For ECFW's with RPM in register as decimal */
> +#define TPACPI_FAN_TPR		0x0040		/* Fan speed is in Ticks Per Revolution */
>  
>  static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>  	TPACPI_QEC_IBM('1', 'Y', TPACPI_FAN_Q1),
> @@ -8817,6 +8826,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>  	TPACPI_Q_LNV3('R', '0', 'V', TPACPI_FAN_NS),	/* 11e Gen5 KL-Y */
>  	TPACPI_Q_LNV3('N', '1', 'O', TPACPI_FAN_NOFAN),	/* X1 Tablet (2nd gen) */
>  	TPACPI_Q_LNV3('R', '0', 'Q', TPACPI_FAN_DECRPM),/* L480 */
> +	TPACPI_Q_LNV('8', 'F', TPACPI_FAN_TPR),		/* ThinkPad x120e */
>  };
>  
>  static int __init fan_init(struct ibm_init_struct *iibm)
> @@ -8887,6 +8897,8 @@ static int __init fan_init(struct ibm_init_struct *iibm)
>  
>  			if (quirks & TPACPI_FAN_Q1)
>  				fan_quirk1_setup();
> +			if (quirks & TPACPI_FAN_TPR)
> +				fan_speed_requires_conversion = true;
>  			/* Try and probe the 2nd fan */
>  			tp_features.second_fan = 1; /* needed for get_speed to work */
>  			res = fan2_get_speed(&speed);
> 

-- 
 i.

