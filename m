Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80E51F4627;
	Mon, 10 Feb 2025 18:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211546; cv=none; b=RZFgNmHanDoGi07CNAZxP+gxt1HnSU6O5RN29+rVXTN6bpxtRI+1mNgby62BPpMgXKx9ncErXAK4As6MQm8WdpEFo2lpc7RJCG5YTBUJqnLfKj8UB+DWApe40WDh+ospGOF8+UrOJ8IrrZF3E3xOHEGSlkOwAc1Xbh1jpgoLVyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211546; c=relaxed/simple;
	bh=T1jt/7m3ygthlgwa18s0xrNKJh33jRt9XUEXWyoYukc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vq44aqIJbrdsTmNHsAPFKIdObjZZ+2OntiosZjJ39XE0w3otHE+1Wd6ZeouLD+FdddN2KWS63ra9X2yTJJPXFlF2MLzonxIk9ws6TuuISvSC4wLTgB0BMhOM6kk/vsQUqkeejpkd/SiQ09pZrwf5UpSnCvA2jOTYYRze1s/RABA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qBpadJJW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qBpadJJW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA7FC4CEE4;
	Mon, 10 Feb 2025 18:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739211546;
	bh=T1jt/7m3ygthlgwa18s0xrNKJh33jRt9XUEXWyoYukc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qBpadJJWCZMEcwVRrTDjh3AQjek3aF5Bor9YeXnfGNWHQAP/1JGP7ABwBQIKr5Jvc
	 j45U1pwmSNt2Ciee9rcmcy1KFFJMtkMB4DRjyfwZu56ecCf75DBiEr6qMdNO8w1mYN
	 MJoFSvsNwI4CjQScySpK2icX/02uVYelvakkpj74pgUDx90pXFNveXMpb4BMkFBEHN
	 uTwj2pscrhMb8Krw3vkN9jg+HFVJB+O3A4Kxc5Jtf9dUvLgIGMfGncAdMQcVzBpeOH
	 /cxmff9MT1F0sMM4nXcTOFCltgsYT56k2ZlsFVONmFBSVCtH1DfH5YksFj0ZPaYCtN
	 LK2kmFMoqzI3g==
Date: Mon, 10 Feb 2025 19:18:59 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
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
	rust-for-linux@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH v4 2/9] rust/kernel: Add faux device bindings
Message-ID: <Z6pDEyDcmhxqE0U4@pollux>
References: <2025021023-sandstorm-precise-9f5d@gregkh>
 <2025021026-exert-accent-b4c6@gregkh>
 <c00ee85d-8e8f-4d59-9c90-af5fd35cc4ac@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c00ee85d-8e8f-4d59-9c90-af5fd35cc4ac@proton.me>

On Mon, Feb 10, 2025 at 04:32:15PM +0000, Benno Lossin wrote:
> On 10.02.25 13:30, Greg Kroah-Hartman wrote:
> > From: Lyude Paul <lyude@redhat.com>
> > 
> > This introduces a module for working with faux devices in rust, along with
> > adding sample code to show how the API is used. Unlike other types of
> > devices, we don't provide any hooks for device probe/removal - since these
> > are optional for the faux API and are unnecessary in rust.
> 
> For me it would be useful to know why this is the case. I looked at the
> dummy regulator driver and it still has a `probe` function. Presumably,
> because it has to wait until other resources are usable and that is the
> case once `probe` gets called. But doesn't the same hold for Rust? Or
> are Rust modules loaded later than C modules? Because if I were to
> rewrite the regulator driver in Rust (assuming we had the abstractions),
> the `probe` code would be put into the `Module::init` function, right?
> Or am I missing something?

AFAICS, the only reason for the dummy regulator driver to have probe() is
because it calls devm_regulator_register() (which given that it neither ever
removes the driver nor the device is meaningless, but let's ignore that).

Actually, not even that would be a blocker, since the same would be valid as
long as you ensure to call devm_*() after faux_device_create() and before
faux_device_remove(). But obviously, it's way cleaner to enforce this through
having the scope of the probe() callback.

In Rust we only need devres for real device resources, which a faux device can
never have. Given the example above, in Rust we wouldn't have anything like
devm_regulator_register(), but a module structure with a regulator::Registration
member, such that the registration is automatically removed when the module is
dropped.

I cannot predict if we ever gonna need probe() for the faux bus in Rust. Maybe
at some point we will, and then we can add the corresponding abstraction. But
for now, I don't see what we would need it for.
