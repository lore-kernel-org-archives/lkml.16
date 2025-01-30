Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6CEC2FB;
	Thu, 30 Jan 2025 12:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738241242; cv=none; b=HNz0utrzXCdNHllq4PmTnZEEZVYSYI1P5R2XwG7RYYNXcECAIrB8k4T5MEab6cg31FJn45DJxuajyNVe81RAcH6c+VkgfbV1bsHQ96I5RprfK9CUFbIu68G4idRQ1II4oTSm8NF4LLJao3FwU+tOmdoJZENON6DThUlgr3WtXQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738241242; c=relaxed/simple;
	bh=pt8yzs445SYe6Fv06Z4OE/Tn1tnAljL7yGTRhU2/rRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tz87WzM76E3Ghbhc6BEh0j2lcPZWbG6J0gGrwSVzfoaecsfXVPZHDAgnhdff0ItE0KmZGVVbrU7taXRSSWXVmrT9XJZCLncF+ZSuxqx3mncJM+yaKV6P4ttuScpu7r6cq8YvUjVVW342DMSlhw/PtnZxbd7+jvTW79GbcHPWfnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F3WYUATO; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F3WYUATO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738241241; x=1769777241;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pt8yzs445SYe6Fv06Z4OE/Tn1tnAljL7yGTRhU2/rRI=;
  b=F3WYUATOKTuwgahomkRC3i2+6PG00IZG3fQIVwOzUwF/Ry7uWVlWvATk
   Awns6ZPVz9FkbZSLeo6Uj1KBV5tvexHLqNIzRt/x+kmbt7YUHMLdwwSJ1
   c5UzoJAmqsL3yGCj9LvzPNRGex9fSwb5/uDdGYGGJKg3ObHjU7k0ROFYj
   4sU856/Jk6Cf3FRF9sW8ljNGWHwZU+GmenmDvAg+SWnqBjULxxqQorA7X
   emmcIojdUaNKh4OvjjMz3rncRk8r1EKYdpVk2KqF+HgVSvWE8zj/FzcPF
   7jGJPr/y7CCDi2cDEi2NpX6ODh8sT9rYHAwv/y0gYOWA/oFFBeWjtOrjM
   g==;
X-CSE-ConnectionGUID: p4DW8KI6S5WaQITuHPIG0A==
X-CSE-MsgGUID: E5bFfepGSIOnOSZYtfg1sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38920441"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="38920441"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 04:47:20 -0800
X-CSE-ConnectionGUID: wsrK+ZucRPe9jnkP65rsPg==
X-CSE-MsgGUID: vZIfwxp0TDmoHj1FiuilwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="140209567"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 30 Jan 2025 04:47:18 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 0228FDC; Thu, 30 Jan 2025 14:47:16 +0200 (EET)
Date: Thu, 30 Jan 2025 14:47:16 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] thunderbolt: Disable Gen 4 Recovery on Asymmetric
 Transitions
Message-ID: <20250130124716.GW3713119@black.fi.intel.com>
References: <20250130095704.10779-1-rahimi.mhmmd@gmail.com>
 <20250130095704.10779-4-rahimi.mhmmd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250130095704.10779-4-rahimi.mhmmd@gmail.com>

Hi,

On Thu, Jan 30, 2025 at 09:51:09AM +0000, Mohammad Rahimi wrote:
> Updates the Connection Manager to disable the Gen 4 Link Recovery
> flow before transitioning from a Symmetric Link to an Asymmetric
> Link, as specified in recent changes to the USB4 v2 specification.
> 
> According to the "USB4 2.0 ENGINEERING CHANGE NOTICE FORM"
> published in September 2024, the rationale for this change is:
> 
>   "Since the default value of the Target Asymmetric Link might be
>   different than Symmetric Link and Gen 4 Link Recovery flow checks
>   this field to make sure it matched the actual Negotiated Link Width,
>   we’re removing the condition for a Disconnect in the Gen 4 Link
>   Recovery flow when Target Asymmetric Link doesn’t match the actual
>   Link width and adding a Connection Manager note to Disable Gen 4 Link
>   Recovery flow before doing Asymmetric Transitions."

Looks good in general few comments still see below.

> Signed-off-by: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
> ---
>  drivers/thunderbolt/tb.c      | 28 +++++++++++++++++--
>  drivers/thunderbolt/tb.h      |  3 ++
>  drivers/thunderbolt/tb_regs.h |  1 +
>  drivers/thunderbolt/usb4.c    | 52 +++++++++++++++++++++++++++++++++++
>  4 files changed, 81 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index a7c6919fbf97..31a8269a5156 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -1013,6 +1013,7 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
>  			     struct tb_port *dst_port, int requested_up,
>  			     int requested_down)
>  {
> +	bool link_recovery_up = false, link_recovery_down = false;
>  	bool clx = false, clx_disabled = false, downstream;
>  	struct tb_switch *sw;
>  	struct tb_port *up;
> @@ -1075,15 +1076,29 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
>  			continue;
>  
>  		/*
> -		 * Disable CL states before doing any transitions. We
> -		 * delayed it until now that we know there is a real
> -		 * transition taking place.
> +		 * Disable CL states and Link Recovery flow before doing any
> +		 * transitions. We delayed it until now that we know there is
> +		 * a real transition taking place.
>  		 */
>  		if (!clx_disabled) {
>  			clx = tb_disable_clx(sw);
>  			clx_disabled = true;
>  		}
>  
> +		ret = usb4_port_link_recovery_disable(up);
> +		if (ret < 0) {
> +			tb_port_warn(up, "failed to disable the link recovery\n");

failed to disable link recovery

also should we still continue? How catastrophic this actually is? I mean
this now prevents the user from using her new UHBR monitor even though it
probably works just fine even if we don't do this step.

> +			break;
> +		}
> +		link_recovery_up = ret > 0;
> +
> +		ret = usb4_port_link_recovery_disable(down);
> +		if (ret < 0) {
> +			tb_port_warn(down, "failed to disable the link recovery\n");

failed to disable link recovery

and actually you can move this message into the function itself and drop
these messages here.

> +			break;
> +		}
> +		link_recovery_down = ret > 0;
> +
>  		tb_sw_dbg(up->sw, "configuring asymmetric link\n");
>  
>  		/*
> @@ -1091,6 +1106,13 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
>  		 * transtion the link into asymmetric now.
>  		 */
>  		ret = tb_switch_set_link_width(up->sw, width_up);
> +
> +		/* Re-enable Link Recovery flow if they were previosly enabled */

previously

> +		if (link_recovery_up)
> +			usb4_port_link_recovery_enable(up);
> +		if (link_recovery_down)
> +			usb4_port_link_recovery_enable(down);
> +
>  		if (ret) {
>  			tb_sw_warn(up->sw, "failed to set link width\n");
>  			break;
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index ddbf0cd78377..d37d778082fc 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -1332,6 +1332,9 @@ int usb4_port_router_online(struct tb_port *port);
>  int usb4_port_enumerate_retimers(struct tb_port *port);
>  bool usb4_port_clx_supported(struct tb_port *port);
>  
> +int usb4_port_link_recovery_enable(struct tb_port *port);
> +int usb4_port_link_recovery_disable(struct tb_port *port);
> +
>  bool usb4_port_asym_supported(struct tb_port *port);
>  int usb4_port_asym_set_link_width(struct tb_port *port, enum tb_link_width width);
>  int usb4_port_asym_start(struct tb_port *port);
> diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
> index 4e43b47f9f11..085139e1a958 100644
> --- a/drivers/thunderbolt/tb_regs.h
> +++ b/drivers/thunderbolt/tb_regs.h
> @@ -398,6 +398,7 @@ struct tb_regs_port_header {
>  #define PORT_CS_19_WOD				BIT(17)
>  #define PORT_CS_19_WOU4				BIT(18)
>  #define PORT_CS_19_START_ASYM			BIT(24)
> +#define PORT_CS_19_ELR				BIT(31)
>  
>  /* Display Port adapter registers */
>  #define ADP_DP_CS_0				0x00
> diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
> index e51d01671d8e..99fd6aa1704e 100644
> --- a/drivers/thunderbolt/usb4.c
> +++ b/drivers/thunderbolt/usb4.c
> @@ -10,6 +10,7 @@
>  #include <linux/delay.h>
>  #include <linux/ktime.h>
>  #include <linux/units.h>
> +#include <linux/string_helpers.h>
>  
>  #include "sb_regs.h"
>  #include "tb.h"
> @@ -1518,6 +1519,57 @@ bool usb4_port_clx_supported(struct tb_port *port)
>  	return !!(val & PORT_CS_18_CPS);
>  }
>  
> +static int __usb4_port_link_recovery_enable(struct tb_port *port, bool enable)
> +{
> +	bool was_enable;
> +	int ret;
> +	u32 val;

I think you should check here

	if (!port->cap_usb4)
		return -EINVAL;

> +
> +	ret = tb_port_read(port, &val, TB_CFG_PORT,
> +			   port->cap_usb4 + PORT_CS_19, 1);
> +	if (ret)
> +		return ret;
> +
> +	was_enable = !!(val & PORT_CS_19_ELR);
> +
> +	if (enable)
> +		val |= PORT_CS_19_ELR;
> +	else
> +		val &= ~PORT_CS_19_ELR;
> +
> +	ret = tb_port_write(port, &val, TB_CFG_PORT,
> +			    port->cap_usb4 + PORT_CS_19, 1);
> +	if (ret)
> +		return ret;
> +
> +	tb_port_dbg(port, "link recovery %s\n", str_enabled_disabled(enable));
> +	return was_enable ? 1 : 0;
> +}
> +
> +/**
> + * usb4_port_link_recovery_enable() - Enable the Link Recovery
> + * @port: USB4 port
> + *
> + * Enables the Link Recovery for @port.
> + * Returns -ERRNO on failure, otherwise the previous state of the Link Recovery.

Returns errno on failure..

or you can also specify which errors but then use %-EINVAL and so on.

Ditto to the other function.

> + */
> +int usb4_port_link_recovery_enable(struct tb_port *port)
> +{
> +	return __usb4_port_link_recovery_enable(port, true);
> +}
> +
> +/**
> + * usb4_port_link_recovery_disable() - Disable the Link Recovery
> + * @port: USB4 port
> + *
> + * Disables the Link Recovery for @port.
> + * Returns -ERRNO on failure, otherwise the previous state of the Link Recovery.
> + */
> +int usb4_port_link_recovery_disable(struct tb_port *port)
> +{
> +	return __usb4_port_link_recovery_enable(port, false);
> +}
> +
>  /**
>   * usb4_port_asym_supported() - If the port supports asymmetric link
>   * @port: USB4 port
> -- 
> 2.45.2
