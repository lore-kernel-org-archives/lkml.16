Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647D824DD06
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751277781; cv=none; b=LrwoQQD0npm6z30I8/W4nvnbk9s3Jlt2cabfmnAWzDynHrmLrF/8mPOb7SEBUZ9S71li4tXHp/u6hDCcK4ARvJnFTCT06pyegDftto3A/pS9uXl3JQmQpAyhLc5jXm6qA4ogxVEpclsxYD5Onx0r77WvGE5FFNvy4N0+2Q4IRms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751277781; c=relaxed/simple;
	bh=Ept0/W178IJMijBe25QaMcfMQGcHXNSB78FXBxkenak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MIGgoJe/u2NUO5vXWRSSiUXRIAXOI+0J9KD1B3oa0x9aiSZ6HIdO+8IzrrHJNZUxjjWQZEREc+YrxzPTDnigHOH51zleNjYfZ7ewJn0bTqxPO92pa+lnxEfVfOhV/JGPf5CUOIGGH1JadpSHB/wdiryMAp13pMuqfGiJlpte+fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BD7t9lKz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BD7t9lKz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC04BC4CEE3;
	Mon, 30 Jun 2025 10:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751277781;
	bh=Ept0/W178IJMijBe25QaMcfMQGcHXNSB78FXBxkenak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BD7t9lKzb5N36Vy7y/G/qKyp6olMo/2bmzKfO8YO7lUdiU+AHgrpBZB9RsKu0vogs
	 8REZqH5ukh7G1kXvr87Rd8dFMDRvKdnZm/XtEL21te/JGl94aqqiQbpVbYPR52rwB5
	 CQA9MCZwAh57zPu/OrkQDK0ib+4aG6+IEH2uCfDI=
Date: Mon, 30 Jun 2025 12:02:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [char-misc-next v2 0/5] mei: fix mei_device lifetime
Message-ID: <2025063050-finale-single-11b2@gregkh>
References: <20250630091942.2116676-1-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630091942.2116676-1-alexander.usyskin@intel.com>

On Mon, Jun 30, 2025 at 12:19:37PM +0300, Alexander Usyskin wrote:
> mei_device data structure is allocated using devm_* functions
> and hooked to the parent device.
> It works for client systems where parent device is pci one.
> When parent device is auxiliary bus device produced by
> graphics driver, the parent can be destroyed before child
> and on the way it cleans all allocated memory.
> This leads to use-after-free if mei character device is
> opened when parent device is destroyed.
> Introduce device to hook the mei_device lifetime on it and
> decouple cdev from main structure to allow all memory
> to be released when it is unused and not before.

How was any of this tested?
