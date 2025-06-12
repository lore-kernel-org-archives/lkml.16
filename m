Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BC023C8B3;
	Thu, 12 Jun 2025 13:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749733638; cv=none; b=T7CXagy7WivBCL3gMFOdTM0jw15LSLtM4hPVcixzbnJWYv4beczTp1Slodwj2hUQu9Ad1GqXFwoCMyYkqmOoPdNFBEsU+/gCF185eE5Ho6jhu1kKdcsV0q5PxGSo1zZUmR0qKoU5zsqB/FUMsqbqnnc3mqv2433Ueamrn6KI4MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749733638; c=relaxed/simple;
	bh=Ht8NIHUWY05/PIbqs7EIkuaSxSpm2Y4FLH6CxtL40+Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nH950Gkca6yBmIRrq24JouGW2S5bneW8gLRI+/6tXUnawZkKFFRuBcL6/JhdQte4m1IgRTyhgMOrRA4qdHqhvjcfxzilauFLp9OvEsf2r9LiK5vxNqui0R4Zcqg8Q3Q9fgadvrCqJPYtj0jh00rd+03MMc4AuA98ctOzx/jeuMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JbiWPpPh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JbiWPpPh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54DAFC4CEEA;
	Thu, 12 Jun 2025 13:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749733636;
	bh=Ht8NIHUWY05/PIbqs7EIkuaSxSpm2Y4FLH6CxtL40+Y=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=JbiWPpPhStkDwlqbOklhYu2YmA0zyhr2SqnwXLxe89Hy6xQEuIfQL0HAS2ngoppBG
	 Nr4WPRWSLFGIa5nGaOF2pGFBcD8DfFCC38H5T1NHZo08kFBW8hwweVs03ohEWu+CgC
	 6UihtVOSJThDHwRLJOR1nGPoIMcMc7Pik1S5qnxApr+Q8Pt9ZD//sEw2FUg9LtTSOb
	 Qif61o8YPGl/fe0r5AckR5bb78HgfmJgspIvEd/oKtH50E6DuGl0rf2ndg16eFrzsF
	 r0h8pHa3EyauXfBTA3fduJMp+KLuXKXSmdms8F4U+PDaXDihlhqi1O/On99k2qo1m/
	 wNDDBGIcQMZ3g==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 15:07:11 +0200
Message-Id: <DAKKT1ML27VO.35Q9I6SQHTYTX@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] rust: devres: fix race in Devres::drop()
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <benno.lossin@proton.me>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>
X-Mailer: aerc 0.20.1
References: <20250612121817.1621-1-dakr@kernel.org>
 <20250612121817.1621-4-dakr@kernel.org>
In-Reply-To: <20250612121817.1621-4-dakr@kernel.org>

On Thu Jun 12, 2025 at 2:17 PM CEST, Danilo Krummrich wrote:
> In Devres::drop() we first remove the devres action and then drop the
> wrapped device resource.
>
> The design goal is to give the owner of a Devres object control over when
> the device resource is dropped, but limit the overall scope to the
> corresponding device being bound to a driver.
>
> However, there's a race that was introduced with commit 8ff656643d30
> ("rust: devres: remove action in `Devres::drop`"), but also has been
> (partially) present from the initial version on.
>
> In Devres::drop(), the devres action is removed successfully and
> subsequently the destructor of the wrapped device resource runs.
> However, there is no guarantee that the destructor of the wrapped device
> resource completes before the driver core is done unbinding the
> corresponding device.
>
> If in Devres::drop(), the devres action can't be removed, it means that
> the devres callback has been executed already, or is still running
> concurrently. In case of the latter, either Devres::drop() wins revoking
> the Revocable or the devres callback wins revoking the Revocable. If
> Devres::drop() wins, we (again) have no guarantee that the destructor of
> the wrapped device resource completes before the driver core is done
> unbinding the corresponding device.
>
> CPU0					CPU1
> ------------------------------------------------------------------------
> Devres::drop() {			Devres::devres_callback() {
>    self.data.revoke() {			   this.data.revoke() {
>       is_available.swap() =3D=3D true
> 					      is_available.swap =3D=3D false
> 					   }
> 					}
>
> 					// [...]
> 					// device fully unbound
>       drop_in_place() {
>          // release device resource
>       }
>    }
> }

I forgot to mention: you used tabs, which breaks when tabstop is not set
to 8 (such as in my editor. This is how it looks for me ):

    -----------------------------------------------------------------------=
-
    Devres::drop() {      Devres::devres_callback() {
       self.data.revoke() {         this.data.revoke() {
          is_available.swap() =3D=3D true
                    is_available.swap =3D=3D false
                 }
              }
  =20
              // [...]
              // device fully unbound
          drop_in_place() {
             // release device resource
          }
       }
    }

I personally would have used spaces for this, but it looks fine in my
gitlog, so feel free to keep it this way.

> Depending on the specific device resource, this can potentially lead to
> user-after-free bugs.
>
> In order to fix this, implement the following logic.
>
> In the devres callback, we're always good when we get to revoke the
> device resource ourselves, i.e. Revocable::revoke() returns true.
>
> If Revocable::revoke() returns false, it means that Devres::drop(),
> concurrently, already drops the device resource and we have to wait for
> Devres::drop() to signal that it finished dropping the device resource.
>
> Note that if we hit the case where we need to wait for the completion of
> Devres::drop() in the devres callback, it means that we're actually
> racing with a concurrent Devres::drop() call, which already started
> revoking the device resource for us. This is rather unlikely and means
> that the concurrent Devres::drop() already started doing our work and we
> just need to wait for it to complete it for us. Hence, there should not
> be any additional overhead from that.
>
> (Actually, for now it's even better if Devres::drop() does the work for
> us, since it can bypass the synchronize_rcu() call implied by
> Revocable::revoke(), but this goes away anyways once I get to implement
> the split devres callback approach, which allows us to first flip the
> atomics of all registered Devres objects of a certain device, execute a
> single synchronize_rcu() and then drop all revocable objects.)
>
> In Devres::drop() we try to revoke the device resource. If that is *not*
> successful, it means that the devres callback already did and we're good.
>
> Otherwise, we try to remove the devres action, which, if successful,
> means that we're good, since the device resource has just been revoked
> by us *before* we removed the devres action successfully.
>
> If the devres action could not be removed, it means that the devres
> callback must be running concurrently, hence we signal that the device
> resource has been revoked by us, using the completion.
>
> This makes it safe to drop a Devres object from any task and at any point
> of time, which is one of the design goals.
>
> Fixes: 76c01ded724b ("rust: add devres abstraction")
> Reported-by: Alice Ryhl <aliceryhl@google.com>
> Closes: https://lore.kernel.org/lkml/aD64YNuqbPPZHAa5@google.com/
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/devres.rs | 33 ++++++++++++++++++++++++++-------
>  1 file changed, 26 insertions(+), 7 deletions(-)
