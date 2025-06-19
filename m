Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978A7221FB5;
	Thu, 19 Jun 2025 11:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750330940; cv=none; b=p3dReJHL6fj5ocz5dDoW8JLVJemLkSHD0YnzO6doLr3lRA2rseG8W35oFNcBSVQ8PJWcgCrQsQ7afriiOmhXd+K1HwhWjOnlss5YHQ2PcTHyEh8zFQspKxtwqw+nYwekY2cGLDAsF9hB6pBhQrrGOYucv+589U5Lyknxp7kzd+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750330940; c=relaxed/simple;
	bh=rhh8ZPdaSugp4Pd5Flh3dwvFCLv+71zUHnyvuzCIHy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5cXqjAsPhvG5jQYYdHLXjdUoFTuM6aBtPJfjbA29PTSVbDJ7c9ZGLjPjjSmHCOCIAJymRHCYSWo/32yy5gNO+cQB2IByT3kD/y5V9MvZB1/iDJkG9K/QoXDRn23UKNYYFeySP+avDSBZ+JW7raNaGu39QPTemvrKTQ7g5TZmIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SD5L/rCA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SD5L/rCA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F14C4CEEA;
	Thu, 19 Jun 2025 11:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750330940;
	bh=rhh8ZPdaSugp4Pd5Flh3dwvFCLv+71zUHnyvuzCIHy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SD5L/rCAAjrZfus/UIUTx4tebUg29e0ywo6UqzNvaptelYZaC4VC2ewEO5Mep6uvV
	 1ajwKzjsV5eY7a7aWSuNpL0gb5EAoY+5OcYniQfJKFWyJqCVrhbnHr1ZGk6aGnZbgm
	 wsmCj8tJ16WByHMVHsSUImDJhLeiOyXnLcN6LEvk=
Date: Thu, 19 Jun 2025 13:02:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Zongmin Zhou <min_halo@163.com>, shuah@kernel.org,
	valentina.manea.m@gmail.com, i@zenithal.me,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	zhouzongmin@kylinos.cn
Subject: Re: [PATCH v2] usbip: convert to use faux_device
Message-ID: <2025061955-pungent-overripe-f8e4@gregkh>
References: <2a327b520760271471717fff9b222cdc34967489.1746662386.git.zhouzongmin@kylinos.cn>
 <20250604065410.76069-1-min_halo@163.com>
 <1a9cea94-c198-4cc4-bd69-d36f6511a121@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a9cea94-c198-4cc4-bd69-d36f6511a121@linuxfoundation.org>

On Tue, Jun 10, 2025 at 09:15:51AM -0600, Shuah Khan wrote:
> On 6/4/25 00:54, Zongmin Zhou wrote:
> > From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> > 
> > The vhci driver does not need to create a platform device,
> > it only did so because it was simple to do that in order to
> > get a place in sysfs to hang some device-specific attributes.
> > Now the faux device interface is more appropriate,change it
> > over to use the faux bus instead.
> > 
> > Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
> > ---
> > Changes in v2:
> > - don't change faux create api,just call probe on vhci_hcd_init.
> 
> I will defer the review to Greg on this.
> 
> I am fine with the change if Greg is happy with it. :)

Well the build errors aren't that good, but overall, yes, it's a nice
change :)

thanks,

greg k-h
