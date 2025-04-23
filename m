Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B068F40;
	Wed, 23 Apr 2025 13:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416759; cv=none; b=oRu6z/Dv0GI5mxRGdQfF9SnABrdG681aNnWoRswmAUe+rhSvNK6+OpY5TgzfMbCiyM/sKkP91G7g5zSSjrEYlM9u5F2hP1ZfHQEKGUlAXHlbhl/tiw+QtPI8Pjgl45yO7cdouU9ALqv0swJrqk/lOQYCFQ/0GO/8SfMu1uFtikY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416759; c=relaxed/simple;
	bh=NhZ1vBbFXojhftlTCOQYWC/5h37cFDUHJEpCdlmm0N8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+Uz1lh8seHJ3so8SAq0+0BJygVNjrmqYTrODyOIgTiwLoXmovhrJyFBmsYWmpfPNAGTTLIYetCTvjqYy59qCOOVqRqgqFRrjbmVDKkFyEIhjCDubKOxeIeQM4zIOAseBcrCgIJoJMakzWBvxhu8w2MB0W5CEBXBK3OudjHWiIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bomU381D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bomU381D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB9BC4CEE2;
	Wed, 23 Apr 2025 13:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745416759;
	bh=NhZ1vBbFXojhftlTCOQYWC/5h37cFDUHJEpCdlmm0N8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bomU381D3RpToifcppftVNrm7pvaJTvfLO6AK/a8Oic3Mj32t+RyouYTtLdDiBu0P
	 PTET8PjeASUd0Zw/bvPCNXBHi2AAMZTXGyuTDWVA40oOtISEjNu3aNEPbg26XtLq8n
	 xtU3Knue497ZXlWj/fE5zlecN9LKdwUV/FCsxqko=
Date: Wed, 23 Apr 2025 15:59:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Kurt Borja <kuurtb@gmail.com>, Lyndon Sanche <lsanche@lyndeno.ca>,
	Mario Limonciello <mario.limonciello@amd.com>,
	platform-driver-x86@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] platform/x86: dell-pc: Transition to faux device
Message-ID: <2025042314-grub-savage-3894@gregkh>
References: <20250411-dell-faux-v1-0-ea1f1c929b7e@gmail.com>
 <20250411-dell-faux-v1-3-ea1f1c929b7e@gmail.com>
 <2afb6e58-44cb-486e-8062-074ff397dc2c@linux.intel.com>
 <1e8a6fe0-518d-4eac-9895-51179ca23f36@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e8a6fe0-518d-4eac-9895-51179ca23f36@redhat.com>

On Wed, Apr 23, 2025 at 03:44:56PM +0200, Hans de Goede wrote:
> Hi Ilpo,
> 
> On 23-Apr-25 3:27 PM, Ilpo Järvinen wrote:
> > On Fri, 11 Apr 2025, Kurt Borja wrote:
> > 
> >> Use a faux device parent for registering the platform_profile instead of
> >> a "fake" platform device.
> >>
> >> The faux bus is a minimalistic, single driver bus designed for this
> >> purpose.
> > 
> > Hi Kurt, Hans & Greg,
> > 
> > I'm not sure about this change. So dell-pc not a platform device but
> > a "fake".
> 
> Arguably the dell-pc driver does not need a struct device at all,
> since it just exports /sys/firmware/acpi/platform_profile sysfs
> interface by using the relevant Dell SMBIOS interfaces for this.
> 
> As such maybe we should just completely get rid of the whole
> struct device here?
> 
> If we do decide to keep the struct device, then since the struct device
> seems to just be there to tie the lifetime of the platform_profile
> handler to, I guess that calling it a faux device is fair.
> 
> > I'm not saying this is wrong, but feel I'm a bit just lost where the 
> > dividing line is.
> 
> In this case it seems to be clear that this is a faux device,
> but I do agree that sometimes the line can be a bit blurry.

If a device needs access to platform resources, then it is a platform
device.  If not, then it is not.  Not too complex :)

But (you knew there was a but), many drivers want to detach their
ability to create a device, and have a driver bind to them, in a
different "place" in the kernel.  For many of those, they have (ab)used
the platform driver/device api to achieve this, despite them not being a
platform device at all.  For these, we can't convert them directly to
use faux bus, as it's not as simple of a conversion and in some places,
doesn't work well.  So let's leave those alone for now, but not take any
more of them going forward in the future.

hope this helps,

greg k-h
