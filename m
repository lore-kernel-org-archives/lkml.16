Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A6D225A44;
	Thu,  6 Feb 2025 14:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738852130; cv=none; b=ERloUtfCFSldi+VbQpf0QMC39LB1fyI2ILpvGzDoK2CzQAX72LQzUqzvHX6FXZ7CWS3766KoRjRXPyt9CC4MJ/5uzg1EASqQJQxEmqgMZqZGfbBWLnd0w/LI8C3YexfcKyuEDUu16r89XZ74Oyd0/52nGVo3zIwR/RmrqnGOnIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738852130; c=relaxed/simple;
	bh=46H9thu0K6mtrKrurhKzzWN7+y7vOz7lvMl4P4bmcV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DY7Rmy8010hP4JwgMCfP8i1U6U3Z6RO7mLewofaZp0Xn8wgKUpb5/urToczGUupFe7GzDDIOfF3ctyINajCQwZB/Tm228ID4kfQbshuJ8hj1UeYEZDXGF2Tqu7vwj4ZTrFCbtDvjJHiELGWmdpQwXzhaL9ymFYfpCC+1gsIjRqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Q9lhrPGF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Q9lhrPGF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA835C4CEDD;
	Thu,  6 Feb 2025 14:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738852129;
	bh=46H9thu0K6mtrKrurhKzzWN7+y7vOz7lvMl4P4bmcV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q9lhrPGFdGD8l4tpxijE3TJGWrlVzp+yU6dYSJ/FOxy0kQWV5+YvOE2m2wdAcGxbN
	 nIbYS1Mb5wOrizzuNVUw5REFsM0jKUJXknlGGCJz8OAzqcFTe5KiOPHwysxwG7l7om
	 E1j3o3wraQTDyenoCGv/oTeDgCwPBdVi2jTSe1R0=
Date: Thu, 6 Feb 2025 11:50:57 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lyude Paul <lyude@redhat.com>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/5] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <2025020608-gutter-spoof-be8a@gregkh>
References: <2025020421-poster-moisture-534b@gregkh>
 <2025020424-retrain-recharger-407c@gregkh>
 <3cf0cf1501613babf443b23da179bc59efd0fc70.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cf0cf1501613babf443b23da179bc59efd0fc70.camel@redhat.com>

On Tue, Feb 04, 2025 at 05:18:12PM -0500, Lyude Paul wrote:
> I am currently writing up bindings for this in rust now (shouldn't take very
> long), but after reading through this patch:
> 
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> Once I send out bindings for this I can also write up some conversion patches
> for vkms and vgem, thank you a ton for the help so far greg!

I've done a conversion for these two drivers now, so no need for that,
but thanks for pointing out some examples for me to verify will work
properly with this new api.  I'll send that out as part of the v3 of
this series later today.

thanks,

greg k-h
