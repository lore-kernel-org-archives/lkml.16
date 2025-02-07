Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE12516C684;
	Fri,  7 Feb 2025 09:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738919770; cv=none; b=WFLXf+LZwXCKjDdrVeSfq5KFFtEInpuS7+y8xWZlGGMcSc0hWV1HFAqLUzfAzsOxOkCNwvR7sdDklKj0MS1QVfxEgVsZJnHZPt22hjV6NYHICU8ST01f/yYQyUU9GVlxVZydlSgneZvTCOosEJWXmITzf3usO0d63pPZbA8HQNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738919770; c=relaxed/simple;
	bh=I5ha/1rhKOfrm7X8U1xQC444mT36ec/pGd5zJ18QP3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aVX+XJVHbZBD0ZUAvn+i9Se0TMqZPg8drCbTCeOjuxBMTpDwO7V6vePu/PoL50D8GrPtajG+OVi/enOYeYz5rnW6E/qajB5vSTBWX58wUm6y6wJScEAdb2semqkzvEULAjcJDw2CXWbj1QBlf5WKn7XP801p6YeVr2T+Wg/7PB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hkq0WJ3Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hkq0WJ3Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ABA1C4CED6;
	Fri,  7 Feb 2025 09:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738919770;
	bh=I5ha/1rhKOfrm7X8U1xQC444mT36ec/pGd5zJ18QP3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hkq0WJ3Z018uD35qyZ2U23Lt8AS6adjbDIMXrvrfTHOhPLS3woBE9kTufG+3dBen4
	 nBIHW/QgugIbsnH9slSubk5uY1HpKtJGxs48Zf7pr5WRGV4lS+w6pUnBqhlxvyDFaL
	 hMJn0dmcejynEXzwjkbutKdzYvSNSbt73cdP/JWY=
Date: Fri, 7 Feb 2025 10:16:06 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zijun Hu <quic_zijuhu@quicinc.com>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>, linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/8] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <2025020710-tree-greedless-65bd@gregkh>
References: <2025020620-skedaddle-olympics-1735@gregkh>
 <2025020623-chemo-amends-102a@gregkh>
 <e9c3f622-0126-4cea-984c-29e77209ae30@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9c3f622-0126-4cea-984c-29e77209ae30@quicinc.com>

On Fri, Feb 07, 2025 at 10:54:38AM +0800, Zijun Hu wrote:
> On 2/7/2025 1:38 AM, Greg Kroah-Hartman wrote:
> > +#include "base.h"
> > +
> > +#define MAX_FAUX_NAME_SIZE	256	/* Max size of a faux_device name */
> 
> Remove this macro?
> 
> > ++ */
> 
> <snip>
> 
> > +struct faux_device *faux_device_create_with_groups(const char *name,
> > +						   const struct faux_device_ops *faux_ops,
> > +						   const struct attribute_group **groups)
> > +{
> > +	struct device *dev;
> > +	struct faux_object *faux_obj;
> > +	struct faux_device *faux_dev;
> > +	int name_size;
> 
> Remove @name_size?
> 
> > +	int ret;
> > +
> > +	name_size = strlen(name);
> > +	if (name_size > MAX_FAUX_NAME_SIZE)
> > +		return NULL;
> > +
> 
> Remove above block related to @name_size
> 
> > +	faux_obj = kzalloc(sizeof(*faux_obj) + name_size + 1, GFP_KERNEL);
> 
> faux_obj = kzalloc(sizeof(*faux_obj), GFP_KERNEL);

Yes to all above, I forgot to rip that out when I dropped the name
logic, good catch.

> > ++int __init faux_bus_init(void)
> > +{
> > +	int ret;
> > +
> > +	ret = device_register(&faux_bus_root);
> > +	if (ret) {
> > +		put_device(&faux_bus_root);
> > +		return ret;
> > +	}
> > +
> > +	ret = bus_register(&faux_bus_type);
> > +	if (ret)
> > +		goto error_bus;
> > +
> > +	ret = driver_register(&faux_driver);
> > +	if (ret)
> > +		goto error_driver;
> > +
> > +	return ret;
> 
> return 0;

Nah, this is a common pattern, it's fine as-is.

thanks,

greg k-h
