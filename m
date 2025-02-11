Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FAF2F5E;
	Tue, 11 Feb 2025 05:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739253198; cv=none; b=Ekjuja+qg4zAmwcmRByDRX2BnoJmVTcSvNJnyoKCkztgLj9rQj/J36xEbbnonh2wXu0ADc5Hvy7TIHvQj7EOspyYdzEcdUazdBKsS3ucWUb0yXRZdEi8YYQ3YIBJ/QH1ojyY6FtcXBATh8T+i7xkGvtaDXRBcT1ga30q/nyZqGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739253198; c=relaxed/simple;
	bh=SIKt6kXM0j5thsrghSBxyv0QckaBCVB8pqC96GrMnSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mwe/NqpoIiKIqbuBkPix1Z78/9KHk5QXVxUuC1zg5YVdIIBagBhjEg8BzdCdFjTa/Izq3KUzr9JAKJ5odLoXd/id2lp4Vxx9HvZYl5J1gPjAoHBFOvOcKqZouuVvbr5n05JGrrgSuC6h9HsjsmjpNfNGawcR1YH2II7U31mfcTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LJrR7KX4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LJrR7KX4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B9BC4CEDD;
	Tue, 11 Feb 2025 05:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739253197;
	bh=SIKt6kXM0j5thsrghSBxyv0QckaBCVB8pqC96GrMnSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LJrR7KX4oPGIpt8kHQNAGOCURV/iJF0oJB7lanVzzYetA2xMfVa1jpIG9/UB3lAac
	 uuL6aqqt90Pni7rt23Uh9BJchczYN+2tF1kGBHW5N2rslfloPXlBYCegTDvpQUosrS
	 7s/oypDbMB9fXjbhjgFMQeHlzJHxem9FkzJOUkJk=
Date: Tue, 11 Feb 2025 06:52:14 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Benno Lossin <benno.lossin@proton.me>
Cc: linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
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
	rust-for-linux@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH v4 2/9] rust/kernel: Add faux device bindings
Message-ID: <2025021103-isolating-desecrate-8b4d@gregkh>
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

I left the probe() in the dummy driver to keep the same pattern of the
existing code, but there is no real requirement that it has that at all.
I could have rewritten the dummy driver to not need it, and maybe, after
time, we realize that no one needs the probe/remove function and then we
can remove it then.

thanks,

greg k-h
