Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A8C238172;
	Thu, 12 Jun 2025 10:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749724009; cv=none; b=GgafjfAt1LSIic3EibGTlYCAQAk60JHcKcvJQ1+MvSef9rZnPi+7Is7Gji68R3a3PlUtP2Qn0tWp5fov6aGEvWgSsaDZFu68zbE4mp5F0haeI+aEUZhBzLVS9fsgc1qwmuBHrbGrY67seURcXRMUfSY2aebnczuire3IiZXkMrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749724009; c=relaxed/simple;
	bh=rD0YUMXFPBPvyIM4B9tIpbtzHBvlw+LEAiVw3KL2LP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VG0GQYf/9AhSzsPJFB9kEhYsHBtAn35AKKJ6M63cOV2j57D9qym3dnUvjhAO3MfM5oWeXtnUL9XDaFqpvHE03TWLccSAax3liYaJ2Oq+06Tjf57ZEI/EPL54cUA5NIafojIPHPMezyrrCT9/4bfPq2wDA6b55YBQDEW+lm7ELVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PBpCG/L0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PBpCG/L0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E724CC4CEF2;
	Thu, 12 Jun 2025 10:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749724009;
	bh=rD0YUMXFPBPvyIM4B9tIpbtzHBvlw+LEAiVw3KL2LP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PBpCG/L0ulR+jMxwYmAqPGtEAkM9oDn7dgdM4XLkc22XABKDKzaPxxdDeD/frAVtP
	 Wd0CewQKWoPd/vgpWl29zZxnR/51YDQB8c0/PzkWZS9492i5jRSLn0c97lCLqiiYyk
	 TCV4LiXQzS1P89XlnWIBx6Q7j8+QCHJNpOJ0KmfR91I5TXJHlKmrW0XafzXxRT6e7D
	 IoGIkdOSteIBO/ayCl/oU9PCe0pfyyjYpgNFbjGTAy/FJO5ptNBI4Kf+jJ/TPjjn+l
	 UPsBucFNdQ2Q8UnSOwPL7Njkn0GRg3c44ZDRq36slb7Jyt0d8hzYyWvMknQspB/44Z
	 yPt2AdHg7v3oQ==
Date: Thu, 12 Jun 2025 12:26:43 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	chrisi.schrefl@gmail.com, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] rust: devres: fix race in Devres::drop()
Message-ID: <aEqrY3fEWGKl8rf2@pollux>
References: <20250603205416.49281-1-dakr@kernel.org>
 <20250603205416.49281-4-dakr@kernel.org>
 <DAKEK5YPNCAU.3LQGI98GGG4KF@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAKEK5YPNCAU.3LQGI98GGG4KF@kernel.org>

On Thu, Jun 12, 2025 at 10:13:29AM +0200, Benno Lossin wrote:
> On Tue Jun 3, 2025 at 10:48 PM CEST, Danilo Krummrich wrote:
> > In Devres::drop() we first remove the devres action and then drop the
> > wrapped device resource.
> >
> > The design goal is to give the owner of a Devres object control over when
> > the device resource is dropped, but limit the overall scope to the
> > corresponding device being bound to a driver.
> >
> > However, there's a race that was introduced with commit 8ff656643d30
> > ("rust: devres: remove action in `Devres::drop`"), but also has been
> > (partially) present from the initial version on.
> >
> > In Devres::drop(), the devres action is removed successfully and
> > subsequently the destructor of the wrapped device resource runs.
> > However, there is no guarantee that the destructor of the wrapped device
> > resource completes before the driver core is done unbinding the
> > corresponding device.
> >
> > If in Devres::drop(), the devres action can't be removed, it means that
> > the devres callback has been executed already, or is still running
> > concurrently. In case of the latter, either Devres::drop() wins revoking
> > the Revocable or the devres callback wins revoking the Revocable. If
> > Devres::drop() wins, we (again) have no guarantee that the destructor of
> > the wrapped device resource completes before the driver core is done
> > unbinding the corresponding device.
> 
> I don't understand the exact sequence of events here. Here is what I got
> from your explanation:
> 
> * the driver created a `Devres<T>` associated to their device.
> * their physical device gets disconnected and thus the driver core
>   starts unbinding the device.
> * simultaneously, the driver drops the `Devres<T>` (eg because the
>   driver initiated the physical removal)
> * now `devres_callback` is being called from both `Devres::Drop` (which
>   calls `Devres::remove_action`) and from the driver core.
> * they both call `inner.data.revoke()`, but only one wins, in our
>   example `Devres::drop`.
> * but now the driver core has finished running `devres_callback` and
>   finalizes unbinding the device, even though the `Devres` still exists
>   though is almost done being dropped.

Your "almost done being dropped" is close, actually Devres::drop() may or may
not be done calling Revocable::revoke(), i.e. drop_in_place() of the data.

CPU0						CPU1

Devres::drop() {				devres_callback() {
	self.data.revoke() {				this.data.revoke() {
		is_available.swap() == true
								is_available.swap == false
							}
						}

						// [...]
						// driver fully unbound
		drop_in_place() {
			pci_iounmap()
			pci_release_region()
		}
	}
}

This means that we have to ensure that the revoke() in Devres::drop() is
completed before devres_callback() completes, in case they race.

> I don't see a race here. Also the `dev: ARef<Device>` should keep the
> device alive until the `Devres` is dropped, no?

Yes, the device reference is fine.
