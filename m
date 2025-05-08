Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8557F10F9;
	Thu,  8 May 2025 07:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746688675; cv=pass; b=WfgG+7T/86slNQ7bbRbpmoCK6FvPq06gwN8szyqltLGKkrZfvToDxM+JFOtAqKjzCAd4bVF6AscNPq+qhI33dwstzCo5XnVWF8qClS7ZbPAsjeXfhsbFnDL4S7ID3ioe59/5ImM4bobzNZ+JwK5LAPtD50G2pAITokmKYgrTckU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746688675; c=relaxed/simple;
	bh=vYCDu5efpnGg8Jut4LYEfxMi9552KR5R18/GTqYfT+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBUy5iwNWIoE2CnoxDtUMA8NQcr0iiKUnSrVc50CnynM6zFQkvp2UdwiEbz3rWTrzdVgHGe9zawyBVKACY2VqY+RVtzv56majGfpLSuWd1hwR49msDx0tDWxuFiSfbuYE2dvGAzVEAR4Zv0VE7f2yFVtsLFGdIkfzUwbMp0G27k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=iH/ZrBjU; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="iH/ZrBjU"
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4ZtNkZ3QzczyRf;
	Thu,  8 May 2025 10:17:42 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1746688663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YvSTwCgucN+/YVAF7uGKKlxukvXhz2N1xjZsJoTLdT4=;
	b=iH/ZrBjUdi0TnM5aoTYtlIy7Wrv1SUZDP3Af505alufDE5JHrZC7+FCymbrecP5rbi9BCT
	RVnE0UodIZNeUa3Xv2NJSrGmPxc9eM/uZK00a0FCxSQaDI2hRZxUUmsF6jFyqxZ7w82iWi
	RiVXrqD6Q2fy9Svu4RjjgMGGSSJfsaY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1746688663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YvSTwCgucN+/YVAF7uGKKlxukvXhz2N1xjZsJoTLdT4=;
	b=w7ODN86qNPUOLsk/Vcr4VHwajVd1zxTI5aMWb3CoEQTpab6udQ68lTWBZ+SGCOCo1v2oIB
	1BlZ8npBNPpStbPCF0cpl7uYP5LYmIs4Bye+fcXYcCd6XtSNe5WAJ5CW2AmVnkcHwBnCoj
	L7+x7II/XAc30zGfOnJLC2MRVHJKfXQ=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1746688663; a=rsa-sha256; cv=none;
	b=uoNRvsm97R3i3S27vJUD4UOIBRD0osYd2Xs2uXUAmgf2szkUnBmT4XjhXJ06v3mlfJHUI8
	Drg17RzoAe50gdKk/KnAgeTxwHX6CCF6fhqyhthbLcJtRvjmYkVUKVlWgCmptq7X3yYdgZ
	cLcjoNIQ9HzVMFcdTFkkhNi+LA2IewU=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A0F1D634C93;
	Thu,  8 May 2025 10:17:41 +0300 (EEST)
Date: Thu, 8 May 2025 07:17:41 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>, W_Armin@gmx.de,
	ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
	king.li@amd.com, dantony@amd.com
Subject: Re: [PATCH v12] platform/x86: Add AMD ISP platform config for OV05C10
Message-ID: <aBxalXYus1R6Xbrr@valkosipuli.retiisi.eu>
References: <20250505171302.4177445-1-pratap.nirujogi@amd.com>
 <aBosuj_TbH7bzjfZ@valkosipuli.retiisi.eu>
 <0d801367-da24-4596-83d9-08ccd89ca670@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d801367-da24-4596-83d9-08ccd89ca670@redhat.com>

Hi Hans,

On Wed, May 07, 2025 at 11:13:18PM +0200, Hans de Goede wrote:
> Hi Sakari,
> 
> On 6-May-25 5:37 PM, Sakari Ailus wrote:
> > Hi Pratap,
> > 
> > On Mon, May 05, 2025 at 01:11:26PM -0400, Pratap Nirujogi wrote:
> >> ISP device specific configuration is not available in ACPI. Add
> >> swnode graph to configure the missing device properties for the
> >> OV05C10 camera device supported on amdisp platform.
> >>
> >> Add support to create i2c-client dynamically when amdisp i2c
> >> adapter is available.
> >>
> >> Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
> >> Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
> >> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> >> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> >> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> >> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> >> ---
> 
> <snip>
> 
> >> +/*
> >> + * Remote endpoint AMD ISP node definition. No properties defined for
> >> + * remote endpoint node for OV05C10.
> > 
> > How will this scale? Can you use other sensors with this ISP? Although if
> > you get little from firmware, there's not much you can do. That being said,
> > switching to DisCo for Imaging could be an easier step in this case.
> 
> Note I've already talked to AMD about the way the camera setup
> is currently being described in ACPI tables is suboptimal and
> how they really should use proper ACPI description using e.g.
> a _CRS with an I2cSerialBus resource for the sensor.

That's one thing, yes, but it's not enough to get rid of the board code.

> 
> Although I must admit I did not bring up the ACPI DisCo for imaging
> spec as something to also look at for future generations.

I think we should really try to get rid of the board code the raw cameras
on ACPI systems currently depend on, in future systems, instead of just
reducing it a little bit. MIPI DisCo for Imaging enables that.

I guess you're not very familiar with Intel-based ChromeOS systems in this
area? Maybe largely because they work out of the box. And there's no board
code for these systems in the kernel. These are based (albeit I'm not quite
sure about the latest ones) on older Linux-based definitions whereas newer
MIPI DisCo for Imaging spec is OS-independent.

> 
> Note that there currently is hw shipping using the somewhat
> broken ACPI sensor description this glue driver binds to,
> so we're stuck with dealing with these ACPI tables as they
> are already out there in the wild.

I agree, there's little that can be done at this point.

> 
> But yes for future hw generations it would be good to have
> a better description of the hw in ACPI.

-- 
Regards,

Sakari Ailus
