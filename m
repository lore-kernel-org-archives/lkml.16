Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73807289E3D
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751289212; cv=none; b=rNuSnijWG7u9JlMU/iJezR5Kfzn5sc52zEp9UeD1yWKW4+zIQDc30/XuByUK3aoMa5ndffqZ1mZLjOn2prGN378vC4hE8YqQ8hLfE7nOqhxUahXM+WfrUGo9mL//65r6tEd5r2rTeTV9yuh9Rf/e4Y3lytJWeTgunryvyp4Q6QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751289212; c=relaxed/simple;
	bh=RIsLO3JXS84ulKACAzkHmSuFxU6FsbRilsOEmI7Iwmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvTL73hQLJrFPuIEgcU6wUxeeQURJnDU32TfByhFTj/UY6obawHuXO2caVBYd8in3O3mkSmsODCdnVfwgzMJujxkW+V28eraQsg2H1NX98i4ESAXBcV/FU4yn1rOHOJ/cEv8CoAN6d1MnHn3afGIcuujUH73rm7jXh/jQCr/K+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=09/Q/zj6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="09/Q/zj6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E53C4CEE3;
	Mon, 30 Jun 2025 13:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751289212;
	bh=RIsLO3JXS84ulKACAzkHmSuFxU6FsbRilsOEmI7Iwmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=09/Q/zj6T5YGkLUi2W/CEtIjzXeKS2kJhNMBDYdEDNH+VM+OJjsGbZtZ4HqgThHRO
	 /q04WO5N9eoEV/UvvW6Yw8HQqhdNgJCgeXK6zogZkn/E5W0dQ5LVJzVv8BFGDsgVai
	 AMP4ZArFuBQvpRmDVUaeIG7c5juhCA4I5APJnjNo=
Date: Mon, 30 Jun 2025 15:13:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: "Abliyev, Reuven" <reuven.abliyev@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [char-misc-next v2 1/5] mei: set parent for char device
Message-ID: <2025063030-surprise-blinker-89f8@gregkh>
References: <20250630091942.2116676-1-alexander.usyskin@intel.com>
 <20250630091942.2116676-2-alexander.usyskin@intel.com>
 <2025063036-hypnoses-ajar-fdb0@gregkh>
 <CY5PR11MB6366307E6C7330B44132C6D7ED46A@CY5PR11MB6366.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY5PR11MB6366307E6C7330B44132C6D7ED46A@CY5PR11MB6366.namprd11.prod.outlook.com>

On Mon, Jun 30, 2025 at 01:02:12PM +0000, Usyskin, Alexander wrote:
> > Subject: Re: [char-misc-next v2 1/5] mei: set parent for char device
> > 
> > On Mon, Jun 30, 2025 at 12:19:38PM +0300, Alexander Usyskin wrote:
> > > Connect char device to parent device to avoid
> > > parent device unload while char device is
> > > still held open by user-space.
> > 
> > No, that's not what cdev_set_parent() does.
> > 
> https://elixir.bootlin.com/linux/v6.16-rc3/source/fs/char_dev.c#L511
> * cdev_set_parent() sets a parent kobject which will be referenced
>  * appropriately so the parent is not freed before the cdev. This
>  * should be called before cdev_add.
> 
> This is what written there. Is my interpretation wrong?

It has nothing to do with a char device being open or closed from
userspace, it has to deal with properly placing the device in the
kobject tree and the object references being correct.

Surely the mei device had this set up before, right?  If not, how did
sysfs look with these char devices with no real parent?

thanks,

greg k-h
