Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D620520318;
	Fri, 31 Jan 2025 01:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738285907; cv=none; b=Ent8XMc0gCqAxjjofmnePvQ7XLtcs2GCFftU1FpaWjDX/2/XVLxonYlALC9s85UB5X49hHMmS1qebbPBbM3ksg5qb0KZ4uRcDqQ7Oi8j+4vRZNFexNFgCGZNTILB+bfvMcuAsvsUvvJWDGIC/JU3gorOfA7OOLJEThBMAvalX3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738285907; c=relaxed/simple;
	bh=XjzSXkraxSwy8UjglFIK4wJQ+SKs6TIvw59tKH2tt48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t5/ZUCwXqmNOz8L7d62dPfYqejST9wy/iIoI02Mva7128eI77NgrPckDUyn5QpwAVEQvBzrddMp0IZXnE3r85V6qfpOJPvG2L7DnePnyedlS9x5kjZbCNb31sDZMnrEZVVKz6AXHXzACDAJKVpD9g7RaZiFgXsawDlFTlhagxe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMtm12gB; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMtm12gB"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2162c0f6a39so46538455ad.0;
        Thu, 30 Jan 2025 17:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738285905; x=1738890705; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MtChoqjOFgGNn4NofE//947FRmDIp0ClcKYH040Uq9Q=;
        b=gMtm12gBXP3or0jDJjcf9OiU8Z43v4wIfpZQ9+HolgFYcIQTIOKiMvHpu4t0szEjKS
         iPtFbQ1Ies1uSDQBy436S1NctmhyCcpddnIXuoPjjfYgxrpYVXGE2uslLM8bT5jXq+K+
         +u3NmMubd2YYiXMn/FqNoQzTSsmrID87S3HcU0K2MPDPeAIet3kkKDcE9uO55xyjy76Z
         geNfaiNwBlc0LqWejzxohsX8eT47drqzl+vPjWOeAGW+J/9hHONlPAPEmQPHmqkAwhX0
         F11aDF+Ch2/MjhJpvn8dnJ6ZOImnN2MW5txIVnKGH4XujxnQROaNGjSdb4kJX+8Gqd03
         RKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738285905; x=1738890705;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MtChoqjOFgGNn4NofE//947FRmDIp0ClcKYH040Uq9Q=;
        b=CbY+h8FRO7Lf62/7DkCjIEfPCPJki4ettWVkzVcpKBlVqwJN+4IQDzW3UQQplmkJBi
         xtG5ClpxK/JXLHQGbaHDK4M8TEEiKaw+itk1Juny7fACGIPLe3ad+e8UlgD0QkPzxiyC
         QjM/4l6NCqfcDfeX00vdGVQRxnX1NDwOp41Sn3WQXXBuR0P/n0rOR2EcFOAt+xG7ioOf
         5uubsp3ZqMiWqpejg2HTTCBO6LhTwEe3LyAqTaJCT6uSFYoz4Vz622uKXejbehTb4kKP
         kjQ/1gA8IkJi3pBJIkwJztlWkBHxaeXPZ6QIKI8aSYLhVyt2WfK/k+eBoDIc4uzVgyZ5
         cemA==
X-Forwarded-Encrypted: i=1; AJvYcCUb4s3cn8YDlbM/bt2rVizKVYwjXbVWpZAeLX/0c1rZECQ6L7g6dLTZmOmpI102Roq3xP/rRe5ftQ7h0HE=@vger.kernel.org, AJvYcCVjRstH6sPs7HfTNVF5DPuu1qnjwitxiHkKSn29/gEXcWAuQhVpL3i21q6k6JZQcU8rDoFRonkeyqWd@vger.kernel.org
X-Gm-Message-State: AOJu0YzWT8k0TNPnRnSa6AFQKh2tV7MlRnxdt4R/NjQFxUqwrTIB8SAz
	cohMHZHT0Jz/mHmFZoj4sYbI8h01qu+BNlPs4FdfvcPKUw4jXLog
X-Gm-Gg: ASbGncs+yKYb1+5ry6ot7eUa3HUlCd+mDMxCaEM/JtygeIQCuWEXiOFmBcgGNwagZOW
	7KiwmUo4LkMFedlT/0Sqo+F/jnf0zDHweIIDNxVD09rH1EoHDD4N6yOM4SAM7GZBSba6XDYIvmd
	b8PGy/c/L51bu0+t55o9vlQeL2sFu+aPW00v12/z239Rsqh/fWDT2/7Ua4qoSfVKdd3gTKpUFF2
	yFccEiFiv/BN6xDEBWsojTABG4Cxn1eJSeLT3QmpUO14e8MTzQXlzf1E+FY2owxLeyi0Q6tiSqc
	BOFpf29UXALy4Q==
X-Google-Smtp-Source: AGHT+IHkmEYNh8vrNk9CC40ONQrdF/kevyJaIxtyqRaqmApIazbV4RVCnAt+SaPgBH2bM9xosaiadg==
X-Received: by 2002:a05:6a00:2918:b0:725:4915:c0f with SMTP id d2e1a72fcca58-72fe2d5e058mr7545712b3a.11.1738285904895;
        Thu, 30 Jan 2025 17:11:44 -0800 (PST)
Received: from ubuntu ([175.141.178.229])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631bf8esm2106622b3a.28.2025.01.30.17.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 17:11:44 -0800 (PST)
Date: Fri, 31 Jan 2025 01:11:40 +0000
From: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com, 
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] thunderbolt: Disable Gen 4 Recovery on Asymmetric
 Transitions
Message-ID: <rbpvuczeeo4rmmsyj76g3dkx76jhuondyj22x7y6vozihriyvr@zuafqxw27l3l>
References: <20250130095704.10779-1-rahimi.mhmmd@gmail.com>
 <20250130095704.10779-4-rahimi.mhmmd@gmail.com>
 <20250130124716.GW3713119@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250130124716.GW3713119@black.fi.intel.com>

Hello again, and thank you. I have three comments below:

On Thu, Jan 30, 2025 at 02:47:16PM GMT, Mika Westerberg wrote:
> Hi,
> 
> On Thu, Jan 30, 2025 at 09:51:09AM +0000, Mohammad Rahimi wrote:
> > Updates the Connection Manager to disable the Gen 4 Link Recovery
> > flow before transitioning from a Symmetric Link to an Asymmetric
> > Link, as specified in recent changes to the USB4 v2 specification.
> > 
> > According to the "USB4 2.0 ENGINEERING CHANGE NOTICE FORM"
> > published in September 2024, the rationale for this change is:
> > 
> >   "Since the default value of the Target Asymmetric Link might be
> >   different than Symmetric Link and Gen 4 Link Recovery flow checks
> >   this field to make sure it matched the actual Negotiated Link Width,
> >   we’re removing the condition for a Disconnect in the Gen 4 Link
> >   Recovery flow when Target Asymmetric Link doesn’t match the actual
> >   Link width and adding a Connection Manager note to Disable Gen 4 Link
> >   Recovery flow before doing Asymmetric Transitions."
> 
> Looks good in general few comments still see below.
> 
> > Signed-off-by: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
> > ---
> >  drivers/thunderbolt/tb.c      | 28 +++++++++++++++++--
> >  drivers/thunderbolt/tb.h      |  3 ++
> >  drivers/thunderbolt/tb_regs.h |  1 +
> >  drivers/thunderbolt/usb4.c    | 52 +++++++++++++++++++++++++++++++++++
> >  4 files changed, 81 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> > index a7c6919fbf97..31a8269a5156 100644
> > --- a/drivers/thunderbolt/tb.c
> > +++ b/drivers/thunderbolt/tb.c
> > @@ -1013,6 +1013,7 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
> >  			     struct tb_port *dst_port, int requested_up,
> >  			     int requested_down)
> >  {
> > +	bool link_recovery_up = false, link_recovery_down = false;
> >  	bool clx = false, clx_disabled = false, downstream;
> >  	struct tb_switch *sw;
> >  	struct tb_port *up;
> > @@ -1075,15 +1076,29 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
> >  			continue;
> >  
> >  		/*
> > -		 * Disable CL states before doing any transitions. We
> > -		 * delayed it until now that we know there is a real
> > -		 * transition taking place.
> > +		 * Disable CL states and Link Recovery flow before doing any
> > +		 * transitions. We delayed it until now that we know there is
> > +		 * a real transition taking place.
> >  		 */
> >  		if (!clx_disabled) {
> >  			clx = tb_disable_clx(sw);
> >  			clx_disabled = true;
> >  		}
> >  
> > +		ret = usb4_port_link_recovery_disable(up);
> > +		if (ret < 0) {
> > +			tb_port_warn(up, "failed to disable the link recovery\n");
> 
> failed to disable link recovery
> 
> also should we still continue? How catastrophic this actually is? I mean
> this now prevents the user from using her new UHBR monitor even though it
> probably works just fine even if we don't do this step.
> 

I followed your suggestion and here is my analysis:

Before this change, if an event occurred during the transition from
Symmetric to Asymmetric mode with ELR set, the link would enter the
Disconnect flow. According to section 4.4.5.2, the Router must then
reset the Target Link Width and Target Asymmetric Link to their
default values, effectively restarting the transition process.

This reset happens only if, during the transition, one of the conditions
for Link Recovery is met. Regardless of whether the link goes through
Link Recovery or the Disconnect flow, it will eventually resume normal operation.

The only problematic scenario I see is a device that consistently triggers
Link Recovery during the transition from Symmetric to Asymmetric, potentially
causing the LLSM (section 4.2) to enter an infinite loop. Such a condition
should have been caught during compliance testing.

To address this, I followed your suggestion and made errors from disabling
Link Recovery non-fatal during the transition.

> > +			break;
> > +		}
> > +		link_recovery_up = ret > 0;
> > +
> > +		ret = usb4_port_link_recovery_disable(down);
> > +		if (ret < 0) {
> > +			tb_port_warn(down, "failed to disable the link recovery\n");
> 
> failed to disable link recovery
> 
> and actually you can move this message into the function itself and drop
> these messages here.
> 
> > +			break;
> > +		}
> > +		link_recovery_down = ret > 0;
> > +
> >  		tb_sw_dbg(up->sw, "configuring asymmetric link\n");
> >  
> >  		/*
> > @@ -1091,6 +1106,13 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
> >  		 * transtion the link into asymmetric now.
> >  		 */
> >  		ret = tb_switch_set_link_width(up->sw, width_up);
> > +
> > +		/* Re-enable Link Recovery flow if they were previosly enabled */
> 
> previously
> 

Thanks for catching that.

> > +		if (link_recovery_up)
> > +			usb4_port_link_recovery_enable(up);
> > +		if (link_recovery_down)
> > +			usb4_port_link_recovery_enable(down);
> > +
> >  		if (ret) {
> >  			tb_sw_warn(up->sw, "failed to set link width\n");
> >  			break;
> > diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> > index ddbf0cd78377..d37d778082fc 100644
> > --- a/drivers/thunderbolt/tb.h
> > +++ b/drivers/thunderbolt/tb.h
> > @@ -1332,6 +1332,9 @@ int usb4_port_router_online(struct tb_port *port);
> >  int usb4_port_enumerate_retimers(struct tb_port *port);
> >  bool usb4_port_clx_supported(struct tb_port *port);
> >  
> > +int usb4_port_link_recovery_enable(struct tb_port *port);
> > +int usb4_port_link_recovery_disable(struct tb_port *port);
> > +
> >  bool usb4_port_asym_supported(struct tb_port *port);
> >  int usb4_port_asym_set_link_width(struct tb_port *port, enum tb_link_width width);
> >  int usb4_port_asym_start(struct tb_port *port);
> > diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
> > index 4e43b47f9f11..085139e1a958 100644
> > --- a/drivers/thunderbolt/tb_regs.h
> > +++ b/drivers/thunderbolt/tb_regs.h
> > @@ -398,6 +398,7 @@ struct tb_regs_port_header {
> >  #define PORT_CS_19_WOD				BIT(17)
> >  #define PORT_CS_19_WOU4				BIT(18)
> >  #define PORT_CS_19_START_ASYM			BIT(24)
> > +#define PORT_CS_19_ELR				BIT(31)
> >  
> >  /* Display Port adapter registers */
> >  #define ADP_DP_CS_0				0x00
> > diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
> > index e51d01671d8e..99fd6aa1704e 100644
> > --- a/drivers/thunderbolt/usb4.c
> > +++ b/drivers/thunderbolt/usb4.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/delay.h>
> >  #include <linux/ktime.h>
> >  #include <linux/units.h>
> > +#include <linux/string_helpers.h>
> >  
> >  #include "sb_regs.h"
> >  #include "tb.h"
> > @@ -1518,6 +1519,57 @@ bool usb4_port_clx_supported(struct tb_port *port)
> >  	return !!(val & PORT_CS_18_CPS);
> >  }
> >  
> > +static int __usb4_port_link_recovery_enable(struct tb_port *port, bool enable)
> > +{
> > +	bool was_enable;
> > +	int ret;
> > +	u32 val;
> 
> I think you should check here
> 
> 	if (!port->cap_usb4)
> 		return -EINVAL;
> 
> > +
> > +	ret = tb_port_read(port, &val, TB_CFG_PORT,
> > +			   port->cap_usb4 + PORT_CS_19, 1);
> > +	if (ret)
> > +		return ret;
> > +
> > +	was_enable = !!(val & PORT_CS_19_ELR);
> > +
> > +	if (enable)
> > +		val |= PORT_CS_19_ELR;
> > +	else
> > +		val &= ~PORT_CS_19_ELR;
> > +
> > +	ret = tb_port_write(port, &val, TB_CFG_PORT,
> > +			    port->cap_usb4 + PORT_CS_19, 1);
> > +	if (ret)
> > +		return ret;
> > +
> > +	tb_port_dbg(port, "link recovery %s\n", str_enabled_disabled(enable));
> > +	return was_enable ? 1 : 0;
> > +}
> > +
> > +/**
> > + * usb4_port_link_recovery_enable() - Enable the Link Recovery
> > + * @port: USB4 port
> > + *
> > + * Enables the Link Recovery for @port.
> > + * Returns -ERRNO on failure, otherwise the previous state of the Link Recovery.
> 
> Returns errno on failure..
> 
> or you can also specify which errors but then use %-EINVAL and so on.
> 
> Ditto to the other function.
> 

I traced all the function calls and identified the following three error numbers:
-EINVAL
-ENODEV
-ETIMEDOUT

> > + */
> > +int usb4_port_link_recovery_enable(struct tb_port *port)
> > +{
> > +	return __usb4_port_link_recovery_enable(port, true);
> > +}
> > +
> > +/**
> > + * usb4_port_link_recovery_disable() - Disable the Link Recovery
> > + * @port: USB4 port
> > + *
> > + * Disables the Link Recovery for @port.
> > + * Returns -ERRNO on failure, otherwise the previous state of the Link Recovery.
> > + */
> > +int usb4_port_link_recovery_disable(struct tb_port *port)
> > +{
> > +	return __usb4_port_link_recovery_enable(port, false);
> > +}
> > +
> >  /**
> >   * usb4_port_asym_supported() - If the port supports asymmetric link
> >   * @port: USB4 port
> > -- 
> > 2.45.2
