Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6838329993D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750779094; cv=none; b=UngAhtEAzXtQKSUUV3UgKJIp1HbIxqkiL+y3rlmxAxihFXvD6r7ZT+1TmEELS7KPqb0fQ+XAInrInNYSRi3ceIXbRxCBTeSspI3GDeFb3WP8CNoDpXyOw5Iu3zsmvjMsvrBUKN16VOBtFPSPs9FbLmWeJlmCIdwpdkWM/6BOGRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750779094; c=relaxed/simple;
	bh=HtxM0mqdyb1NXs/pOiev3+CEmu/i93ijfIjEAoevf10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jRQyEhqum1rt3UCmygK05T7MtekRjOnGp/79TC9+WkUfJD3LpntP0U1cA2yEOmYMQo7kW5m1AKu7ZjHymRkA12ja2L3A1cIP+SXfQEYEwlo7j6usoD4BVg1ot7n1axrMnpV6B8rpV3yxoBOYe97soWYyyRA9pd+8Oc2Ody0c1bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vGKRr9wp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vGKRr9wp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E59CC4CEE3;
	Tue, 24 Jun 2025 15:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750779093;
	bh=HtxM0mqdyb1NXs/pOiev3+CEmu/i93ijfIjEAoevf10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vGKRr9wpxmEwhkX1luFCWtaT/gQIl//E5E6LGpuXkKqiNs4epSmLtlcx68cyf1ueq
	 UAXLYmaXuzVoImzFjN8E+U8LRFi/gL4kH9WGnpwt5LsQKTdO+zhNIaBK0LAqEU3DMy
	 Qvax3hH1q689MdUwLSvvBMNJwnLtLWFaH7wi8Dv8=
Date: Tue, 24 Jun 2025 16:31:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: Hans de Goede <hdegoede@redhat.com>, alexander.usyskin@intel.com,
	arnd@arndb.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mei: vsc: Remove unused irq functions
Message-ID: <2025062412-immobile-unclothed-0fc5@gregkh>
References: <20250617003450.118751-1-linux@treblig.org>
 <30565c88-fb3c-4970-a7c8-bb81200a13aa@redhat.com>
 <aFqJRIQkw624nQFf@gallifrey>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFqJRIQkw624nQFf@gallifrey>

On Tue, Jun 24, 2025 at 11:17:24AM +0000, Dr. David Alan Gilbert wrote:
> * Hans de Goede (hdegoede@redhat.com) wrote:
> > Hi David,
> > 
> > On 17-Jun-25 2:34 AM, linux@treblig.org wrote:
> > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > 
> > > vsc_tp_request_irq() and vsc_tp_free_irq() last uses were removed in 2024
> > > by
> > > commit 9b5e045029d8 ("mei: vsc: Don't stop/restart mei device during system
> > > suspend/resume")
> > > 
> > > Remove them.
> > > 
> > > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > 
> > Alexander pointed me at this patch because I just posted
> > almost the same patch:
> > 
> > https://lore.kernel.org/lkml/20250623085052.12347-2-hansg@kernel.org/
> > 
> > Normally I would say lets go with your (David's) version since
> > you posted your patch first.
> > 
> > But your patch is missing the removal of the function prototypes
> > from vsc-tp.h, so in this case I think we should go with my version.
> 
> Oops, yep that makes sense to me.

Ok, I'll go take your series now, sorry for the delay.

greg k-h
