Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC451E3772;
	Wed,  4 Jun 2025 09:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749030601; cv=none; b=FJEpgikllfavLd8KOxzDAeevYWRIpEtKnbfv0zIPbFuR7XAGjnshlx2zVUEY972XuKLveNRpa1uAGNvgARxmB62LHRWfsRNQ0iJwyYmNPw1n1Hv9u6lL4uP6a5Ooys2Vt+IxUXnJLw0I1Jwg0vzCNjaQU9fpE0Tk5rsW9WUCOT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749030601; c=relaxed/simple;
	bh=Ab424E9k28t4IDBrmxzZpiv39b/KLWE7lhSswN4XFJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UD8lhii3n3PYd85uRkge722gBa94sLe5sH3nXzm/IN3k+QAYwLBPBccbMzCDPZabtQcMRAGqbvHZG1//aSI1c1Cb9V2IwNVPcQz+RlEn9pUe2+oSO+Ino4XckEXVVLCwzWW7/gW6GPs0FwV4AlKeMaP6UMaOUM1Q+y+gOGpvTi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ig2Owuvf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ig2Owuvf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC7AC4CEE7;
	Wed,  4 Jun 2025 09:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749030600;
	bh=Ab424E9k28t4IDBrmxzZpiv39b/KLWE7lhSswN4XFJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ig2Owuvfk1TYotGhEXFMRgP7tIhEPMEP8zhQituOqKBsNEWNJ3JmRw/dOcKRd8KCC
	 hmtstscqscz2CND9P4MWh0aysetXK6HmrZBtHwz5DIBwZOBbvtGMYH3+99qcC8sRjx
	 VG1e/6UqOIlPY0GxyUGp+GlcXkkgLQeUmgY8KUfiHdQrxOcTi/cZ7Z36tT1S8L5Dvi
	 sSezxPBIpJJAAU6hNRZ9LyxeSzb2qGi9pjx1EwfiZHQ4HI01GOM0uSGaP079DtZTGg
	 VP7J8jgZ0j40VuAoBH4oG4Qs5+AWJ6JTqrfGxTAVQL7akPvOtM75IZp8pAsvJ/LG2Y
	 31hajWnW/fwOw==
Date: Wed, 4 Jun 2025 11:49:54 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, chrisi.schrefl@gmail.com,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] rust: devres: fix race in Devres::drop()
Message-ID: <aEAWwnyP4zwwrccX@pollux>
References: <20250603205416.49281-1-dakr@kernel.org>
 <20250603205416.49281-4-dakr@kernel.org>
 <aD-EiRChuScS5TK-@tardis.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD-EiRChuScS5TK-@tardis.local>

On Tue, Jun 03, 2025 at 04:26:01PM -0700, Boqun Feng wrote:
> On Tue, Jun 03, 2025 at 10:48:52PM +0200, Danilo Krummrich wrote:
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
> > 
> > Depending on the specific device resource, this can potentially lead to
> > user-after-free bugs.
> > 
> 
> This all sounds reasonable, one question though: it seems to me the
> problem exists only for the device resources that expect the device
> being bounded, so hypothetically if the device resources can be
> programmed against unbound devices, then the current behavior should be
> fine?

I don't think that such device resources exist from a semantical point of view.

We always have to guarantee that a driver released the device resources once the
corresponding device is unbound from the driver.

However, there certainly are differences between how fatal it is if we don't do
so.

Complementing your example below, if we for instance fail to release a memory
region in time, a subsequent driver probing the device may fail requesting the
corresponding region.

> For example, in your case, you want free_irq() to happen before
> the device becomes unbound, which is of course reasonable, but it sounds
> more like a design choice (or what device model we want to use), because
> hypothetically you can program an irq that still works even if the
> device is unbound, no?

You can, just like for every other registration (e.g. class devices, such as
misc device), but it's sub-optimal, since then we could not treat the
registering device of the registration as &Device<Bound>, which allows direct
access to device resources with Devres::access(). Please see also [1] and [2].

We have two (safe and correct) ways to access device resources, one is the
runtime checked access through Revocable::try_access() (which implies the RCU
read-side critical section and atomic check); the other one is the compile-time
checked access through providing a &Device<Bound> as cookie for directy access
without runtime overhead.

Wherever possible, we want to enable the latter, which means that registrations
need to be properly guarded.

[1] https://lore.kernel.org/lkml/20250530142447.166524-6-dakr@kernel.org/
[2] https://lore.kernel.org/lkml/20250530142447.166524-7-dakr@kernel.org/

> Again this sounds reasonable to me, just want to check my understanding
> here.
> 
> Regards,
> Boqun
> 
> > In order to fix this, implement the following logic.
> > 
> > In the devres callback, we're always good when we get to revoke the
> > device resource ourselves, i.e. Revocable::revoke() returns true.
> > 
> > If Revocable::revoke() returns false, it means that Devres::drop(),
> > concurrently, already drops the device resource and we have to wait for
> > Devres::drop() to signal that it finished dropping the device resource.
> > 
> > Note that if we hit the case where we need to wait for the completion of
> > Devres::drop() in the devres callback, it means that we're actually
> > racing with a concurrent Devres::drop() call, which already started
> > revoking the device resource for us. This is rather unlikely and means
> > that the concurrent Devres::drop() already started doing our work and we
> > just need to wait for it to complete it for us. Hence, there should not
> > be any additional overhead from that.
> > 
> > (Actually, for now it's even better if Devres::drop() does the work for
> > us, since it can bypass the synchronize_rcu() call implied by
> > Revocable::revoke(), but this goes away anyways once I get to implement
> > the split devres callback approach, which allows us to first flip the
> > atomics of all registered Devres objects of a certain device, execute a
> > single synchronize_rcu() and then drop all revocable objects.)
> > 
> > In Devres::drop() we try to revoke the device resource. If that is *not*
> > successful, it means that the devres callback already did and we're good.
> > 
> > Otherwise, we try to remove the devres action, which, if successful,
> > means that we're good, since the device resource has just been revoked
> > by us *before* we removed the devres action successfully.
> > 
> > If the devres action could not be removed, it means that the devres
> > callback must be running concurrently, hence we signal that the device
> > resource has been revoked by us, using the completion.
> > 
> > This makes it safe to drop a Devres object from any task and at any point
> > of time, which is one of the design goals.
> > 
> [...]
