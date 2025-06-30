Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE55724501D
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751277754; cv=none; b=gOdsYs7S4cdGXf8hyT62c1Ph1S+HR6j0B5b4bc6vGEbkwh1YPGXWZbqR2G/GgYOb743pNM1/+8oF9sPZAo+OFCid6JJJvVBOfrSe0/T0T6gp6Oe/7+PD582ZoK4RpZzy5LFMncAF34BPuGw2aFOEGz/N3PntcsgeBeJ+Aee0vmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751277754; c=relaxed/simple;
	bh=w2nwX2MzRx+mmSoliNGiv7XWdCDJ5OG0C8bSVS7azFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k97SdmH2D+GlCRjO3EW2gDkiYkPVsoxM2+9HMLQrQTc1SWLpGyvLFVm3GvQpW6zSKdjQ9WQHxy4h/wodYFfcZeEHhHW03/688fEbzTOEsLQCE47lgZTjaajOdyi0A/Ua2IcVO4Z6b+uL59McFomwkGtJHl0oQEKi/Eadksz8T7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SEdL5wO8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SEdL5wO8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC0CC4CEEB;
	Mon, 30 Jun 2025 10:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751277754;
	bh=w2nwX2MzRx+mmSoliNGiv7XWdCDJ5OG0C8bSVS7azFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SEdL5wO8NxUsICdFP2DVBLtotA6P5WM7uCW8jvErqXoPQ9OMCdX3EPOXvJEvWamWQ
	 zgdq8CCmYK7B2jhtMZCbi6PDwG56VQTalk7aJn2vO7y5s2gKWlC6G3nQmK4qZ9w8cB
	 yCH76obQb/HsFdV5ZwAI4uarianJj3rme0LMWMP0=
Date: Mon, 30 Jun 2025 12:02:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [char-misc-next v2 1/5] mei: set parent for char device
Message-ID: <2025063036-hypnoses-ajar-fdb0@gregkh>
References: <20250630091942.2116676-1-alexander.usyskin@intel.com>
 <20250630091942.2116676-2-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630091942.2116676-2-alexander.usyskin@intel.com>

On Mon, Jun 30, 2025 at 12:19:38PM +0300, Alexander Usyskin wrote:
> Connect char device to parent device to avoid
> parent device unload while char device is
> still held open by user-space.

No, that's not what cdev_set_parent() does.

Also, why not wrap your lines at 72 columns?

thanks,

greg k-h
