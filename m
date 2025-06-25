Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941A5BA4A;
	Wed, 25 Jun 2025 08:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750840793; cv=none; b=IWltORpljV4dOD7jyRodPK3xOnF1gV9GwJ4B1RioT/2q57zhZtOCC0iMTogegcZ9tA2tWvJFGIwAD+KKG4UhWNIjbXfFxxiHbvO7gP3uVdhcWElmkLHeSjEL53Sm6fLGcqnq3hZKozl+8oNf9bKMxZ1mDSz+wzCW/j9POeZDlOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750840793; c=relaxed/simple;
	bh=1/kjlpSwf+6F2gTqCeLo5ATGF0NRGzb0h+zdWq8kh38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O84zpBfm/VT2Hr5xnUjXkj622GijfNIMIfCvyFMgl1zPMtjYiEos3cjFTP+iHDu4/fIoQguK0UJ9E1cHv8sJzKk9MywJuftzWGCjKVZrXBvyD/Em4syHwgN4utaTjY81NalDHmjGNUSfvEqWDKEAIwFaRjQPYBH57F2msNCSXk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GXUka6/a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXUka6/a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 468D2C4CEEA;
	Wed, 25 Jun 2025 08:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750840793;
	bh=1/kjlpSwf+6F2gTqCeLo5ATGF0NRGzb0h+zdWq8kh38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GXUka6/aGAnipxrPWUDCXi2oAjXbbXzhCxykOPyv2eMo62Bz7xK5GQYb/vqNCx9sF
	 gY9cM5zyGnDXycKgTn2ruGHHRR4HG6m+Y2ntWNhJn1k29p10Jjb4mVvTqUD/WVJ3eI
	 +F6yl8WVQAkuRqOBNbsbEb/RgOKF3afTnMbUnZg2Ym3oxt3BHlkfTWJ1IGGxuw5mua
	 vILG7f2FWeyKl3lQjPt5EOIGDQ2wAYF5qyCE1/QafVWkgqvcfzq9vczZAsjyKJWt9L
	 JMdTRPDYge21phccl2u8IndXGzG6mqsMLVLidwFK7fVC/w271Q5mqtXv4QHldY3b5t
	 ud/EeAive5dTQ==
Date: Wed, 25 Jun 2025 10:39:47 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Onur <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu
Subject: Re: [PATCH] rust: simplify `Adapter::id_info`
Message-ID: <aFu10-dGkoyi0I2T@cassiopeiae>
References: <20250625043630.7677-1-work@onurozkan.dev>
 <aFux2MUDAGEYY49I@pollux>
 <20250625113604.21a6ec4a@nimda>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625113604.21a6ec4a@nimda>

On Wed, Jun 25, 2025 at 11:36:04AM +0300, Onur wrote:
> Even with that, it can be something like this:
> 
> fn id_info(dev: &device::Device) -> Option<&'static Self::IdInfo> {
>     let id = Self::acpi_id_info(dev);
>     if id.is_some() {
>         return id;
>     }
> 
>     Self::of_id_info(dev)
> }
> 
> or maybe even this:
> 
> fn id_info(dev: &device::Device) -> Option<&'static Self::IdInfo> {
>     Self::acpi_id_info(dev).or_else(|| Self::of_id_info(dev))
> }

That's fair, can you please rebase your patch onto [1]?

[1] https://lore.kernel.org/lkml/20250620153914.295679-1-igor.korotin.linux@gmail.com/
