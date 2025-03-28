Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EAF219E93;
	Fri, 28 Mar 2025 11:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743161482; cv=none; b=HCjfwd/p5fu2NqVlXAF+tUIRIULj3ok7wxHKEer41ZGdo4IhkU7Bp5W6vCUJ9MkCdE1z5donS6TgcGpI8joPhGKs9FOpuCKvyvJmFPaq82/hf1pEcf+Kq3Ox17ywqmvlV84BLDNhNEPHq2RLnoIe1pWBOEAeS+qoLcCak9q716w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743161482; c=relaxed/simple;
	bh=LHa9xz76CIhV2+jLsq3mcF4E3EUSoSeXhvdMAA5/E7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QxVSWIKmYhzjzXXQ6+Wp/lKmMggx+FotlJOhsMz2oEM2BoGp5CrhPiIMHIJcIB0076T+MhUcOOsjTOkn2nxbhgHPjA3ccRCfGIuxHFjDPiZ4nY0WJc+NzjH/sH8Pn0vKCSnesPhO+f9kcyTx8SAdA+qnyS91BVsqPNW7PC7G7vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VMZgeRpX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VMZgeRpX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F96C4CEE5;
	Fri, 28 Mar 2025 11:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743161482;
	bh=LHa9xz76CIhV2+jLsq3mcF4E3EUSoSeXhvdMAA5/E7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VMZgeRpX3tm3Kr8Dsh0HSvOzxgKr44xetLhJDROMN2yZbplCj/42ncBbw25Lxe0O/
	 vMP+aZZutnaJFmEm/orUOrTjYoFs7U+/wyu+BLqe2blCJmZbvHOYE2n5bEl3wKwsWY
	 bnBtOFgMRhGCHDmTesOk1bA1xxF35r9TX5muxpEo=
Date: Fri, 28 Mar 2025 12:31:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: madhu.m@intel.com
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	pooja.katiyar@intel.com, dmitry.baryshkov@linaro.org,
	diogo.ivo@tecnico.ulisboa.pt, lk@c--e.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: ucsi: Add the UCSI commands in debugfs
Message-ID: <2025032818-trash-backpack-5518@gregkh>
References: <20250328115041.555008-1-madhu.m@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328115041.555008-1-madhu.m@intel.com>

On Fri, Mar 28, 2025 at 05:20:41PM +0530, madhu.m@intel.com wrote:
> From: Madhu M <madhu.m@intel.com>
> 
> Added the UCSI commands UCSI_GET_CAM_SUPPORTED, UCSI_GET_PD_MESSAGE,
> UCSI_GET_ATTENTION_VDO and UCSI_SET_USB support in debugfs to enhance
> PD/TypeC debugging capability.
> 
> Signed-off-by: Madhu M <madhu.m@intel.com>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
> Changes in v1:
> - Removed UCSI_READ_POWER_LEVEL and UCSI_SET_PDOS commands.
> - Modified commit messages.

I see 3 different v2 patches on the list from you now, which obviously
is not correct :(

Please slow down, take a day or so at the least, and work with Heikki to
submit this properly.  There is no rush here.

greg k-h
