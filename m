Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E13C264FB1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751357860; cv=none; b=Sa59e3YSaaF5BTR3FLShj8UcdhIXl0OuhXzcBBy/Gh+LFCdtyOvB6LjXQDHjRsg6YRgbcrhkPkrbKBXC0zi2yFfgjRzq5jCPOWCwhLLeD2v3slZH7TllWlx/QQgdjRQorvIKny8lgUHvmbi6QYzAFh2X745xEOaRngGWuabdAzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751357860; c=relaxed/simple;
	bh=RjR9flCJ4czURwcEr5ZovtQZRhNst2rQWm4ARl2i/ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YvVzVRfp8IuvLVNYEhbrePrLCL16V+vZPGnJs1DXBAxCYRJ/HvUHmn13nQKdCmZe/YqAoZ+PjcgLflM76YHGS1dBI+8czGG3uThJXRFOLQp50K655RYT2MZ2SetHv+tlvXoY49kOe1oEsQUXMu3IyVg7U+k5ejxZrji1wFukb4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rXQjAePU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rXQjAePU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F1CC4CEEB;
	Tue,  1 Jul 2025 08:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751357859;
	bh=RjR9flCJ4czURwcEr5ZovtQZRhNst2rQWm4ARl2i/ZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rXQjAePUTZjZJWcj2thQXkev/3yslkppvrqE+WD9hhWzWSHHWoYyW1kPbl1naC8gi
	 T7T084yw4lGBUtPjLcF7kgF+PUVFKQg0UqJMQqcrklzNtqXjYTGbnw8MpUHfimo+Ie
	 wVwXeFlTdRtHaAhIlPoxLL4zqRy1ahk+MYJdIokk=
Date: Tue, 1 Jul 2025 10:17:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com, alexander.usyskin@intel.com,
	daniele.ceraolospurio@intel.com
Subject: Re: [PATCH v4 02/10] mei: late_bind: add late binding component
 driver
Message-ID: <2025070131-snaking-trolling-87dc@gregkh>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-3-badal.nilawar@intel.com>
 <2025062808-grant-award-ee22@gregkh>
 <a0e54703-721e-4e87-9962-7007771f947b@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0e54703-721e-4e87-9962-7007771f947b@intel.com>

On Tue, Jul 01, 2025 at 01:37:36PM +0530, Nilawar, Badal wrote:
> 
> On 28-06-2025 17:49, Greg KH wrote:
> > On Wed, Jun 25, 2025 at 10:30:07PM +0530, Badal Nilawar wrote:
> > > +/**
> > > + * struct late_bind_component_ops - ops for Late Binding services.
> > > + * @owner: Module providing the ops
> > > + * @push_config: Sends a config to FW.
> > > + */
> > > +struct late_bind_component_ops {
> > > +	struct module *owner;
> > I don't think you ever set this field, so why is it here?
> > 
> > Or did I miss it somewhere?
> 
> It is set in drivers/misc/mei/late_bind/mei_late_bind.c
> 
> static const struct late_bind_component_ops mei_late_bind_ops = {
>         .owner = THIS_MODULE,
>         .push_config = mei_late_bind_push_config,
> };

Ah.  But then who uses it?  And why?  Normally forcing callers to set
.owner is frowned apon, use a #define correctly to have it automatically
set for you in the registration function please.

And are you _sure_ you need it?

thanks,

greg k-h
