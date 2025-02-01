Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD3C450EE;
	Sat,  1 Feb 2025 08:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738398813; cv=none; b=B5zpEyMdKRS39C8RBXalIbUQJLBi2cMxbmTbWpJgGX2mEmHgehohInNOeysyDqwMKeK0hmlyzmeO+Vc0WFN4OmVwcf+9N0i4MN9QPusVEO/6BP4jakueQX6Wnjg/mEhc2nY5u7WaTfMzbjZqIE/jLQOs/8cWGX/tGOjlZbJPEZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738398813; c=relaxed/simple;
	bh=cY7+EsD7M8XkB6G31jK8of5Q7MCUMf+o7HuixLQ6SRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxaPk+kwFGfWsuoyso7pxPnlq/ASEXt8abctGr1uSfMn3m9GsUnWY1T5gu2eVXNtB/W8ZxDokltTYUKjfMouRJkA4wkKtiN/ry0qo/drxLCkw0MkjwkXXrUtcYb2sK3c9n5xCC++DWLba6WkiAxegzU4keoz5VzTXhztYjt2geY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=chxQ2Qkn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="chxQ2Qkn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C38C4CED3;
	Sat,  1 Feb 2025 08:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738398812;
	bh=cY7+EsD7M8XkB6G31jK8of5Q7MCUMf+o7HuixLQ6SRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=chxQ2QknmRNGOP1Y3r9f5fZEvlqQkSuHp2IVzql0MX91NJ8vP0BNowk5GvSYAjvAJ
	 903gqQGjPVQ5yC1s7zXRf6AqaajeywXmu5e1XsXwayEX7duSihsFIYUb4bZ/tgwSZ9
	 zKxCTznUb011BtBsV9p5jawEDKIouEj3p+hXe5NA=
Date: Sat, 1 Feb 2025 09:32:32 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] WIP: drivers/base: Add virtual_device_create()
Message-ID: <2025020130-donator-entering-54da@gregkh>
References: <Z5Nw8kaieLueWyUu@pollux>
 <20250130212843.659437-1-lyude@redhat.com>
 <b0eb69eeb1cd6e1bfbbf91c12dcebf1e58673147.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0eb69eeb1cd6e1bfbbf91c12dcebf1e58673147.camel@redhat.com>

On Thu, Jan 30, 2025 at 04:58:50PM -0500, Lyude Paul wrote:
> (FWIW: after posting this I realized I will need to split this API up a bit
> more anyway so that we can also do init/register in separate steps, since I
> realized rust will need this so we can store a reference to the device like we
> allow for normal device probes)

Do you always need to do init/register in 2 steps in rust code?  Or can
you do it all in a single call?  I'd prefer a single one just to make
the interface simpler overall, but if you all can't do that, I can keep
it in two, just seems wasteful.

thanks,

greg k-h
