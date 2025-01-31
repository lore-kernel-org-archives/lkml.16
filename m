Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDA0143723;
	Fri, 31 Jan 2025 08:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738310444; cv=none; b=kXrq0CddKUFoZ89KNGBQ6HocR3uJqkIGyAxR7tEfN8HvLuKT9cvr/0KRajySZX1F4roqUGKHuehU65xsxfhgbCBMa5DUaAkPoUCDThhhVMlgXjOJeaMMiXFnII0DDRpdzqiTet5rxHyj+plJOWoRdKpRubLNcvPAjQRSgpfqOSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738310444; c=relaxed/simple;
	bh=udesyE0697+EA9cQPPOlWNe/XbzT1OhHht2eojgSG58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0kJdtHbPOKDYz85SfaAGHDuwHUfhRQONpnSP38xfN5s8SiuJFDtRL8aSUAWKTkkrnFnEL5i1IwWJXb4IqbbwDVD4bLZvvQ4oUQV5QQNQP4wnMxKULGPlAQMgB+kx0lrSoTiqj36VxiyIhnA1Yn7DoyoZjOMR00uDrPyXd9omIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=is0EeApJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="is0EeApJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF48C4CED1;
	Fri, 31 Jan 2025 08:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738310434;
	bh=udesyE0697+EA9cQPPOlWNe/XbzT1OhHht2eojgSG58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=is0EeApJHjJTpjRaatXI6inqMW+tElwRg6lvvWy58KYCJxUq2su9HO7qdDvqXuDVL
	 e/Sft/FSdaYbVSB3njbBMqdGh89WnNEOdQuv05efY4Ki1DVyYJbq42hOYDwXP0L1/r
	 +eaoG96iM6iKc/1vi3/DGQl/1SsJooEn3vbKdhRo=
Date: Fri, 31 Jan 2025 09:00:32 +0100
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
Message-ID: <2025013159-shabby-professor-515b@gregkh>
References: <Z5Nw8kaieLueWyUu@pollux>
 <20250130212843.659437-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130212843.659437-1-lyude@redhat.com>

On Thu, Jan 30, 2025 at 04:28:26PM -0500, Lyude Paul wrote:
> As Greg KH pointed out, we have a nice /sys/devices/virtual directory free
> for the taking - but the vast majority of device drivers concerned with
> virtual devices do not use this and instead misuse the platform device API.
> 
> To fix this, let's start by adding a simple function that can be used for
> creating virtual devices - virtual_device_create().
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> 
> ---
> 
> So, WIP obviously because I wrote this up in a few minutes - but this goes
> off the idea that Danilo suggested to me off-list of coming up with a
> simple API for handling virtual devices that's a little more obvious to
> use. I wanted to get people's feedback and if we're happy with this idea,
> I'm willing to go through and add some pointers to this function in various
> platform API docs - along with porting over the C version of VKMS over to
> this API.

This is a big better, but not quite.  Let me carve out some time today
to knock something a bit nicer together...

thanks,

greg k-h
