Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0890618DB2A;
	Thu, 12 Jun 2025 08:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749716014; cv=none; b=u/GJbui3PDBvl8T0M8d3D7Aunk4evCgCXDyWjffZFQ6dDcv2PA2+g2npY3FrybJCgzmkMIrls8AngT8ANk6/+Vbc4vfh+03UNSowCNyaqQvpAN/MV7Asefbdp1JjiUcUgXCOBvqffrf0zIfSfrbLyXJvBR/JwtmjPhCpFtBCiAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749716014; c=relaxed/simple;
	bh=nDMS9g+Bk/QeVRgWt7heX7r7uo+JtLzV4PyG8up0zxk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Q+/A1DO94yYaAU8ZyVTgLGhlOfDCPoe5M8u1I7LRGIYAT7C8J1SCWmHlwFv9NREoD4jkah/LVGNOButV+3hcq1DfHHf65BfXgbexrJIRUl4rQiVmhujoHpOJGgNR9e+UwIk6kylJyJ3fbHF5FmeOBC0KfFbqsrseGjb/zOXCjfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOBfFPAk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOBfFPAk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74B1C4CEF0;
	Thu, 12 Jun 2025 08:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749716013;
	bh=nDMS9g+Bk/QeVRgWt7heX7r7uo+JtLzV4PyG8up0zxk=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=UOBfFPAkqn0/5Qa8ozLrbc6kw5oNKd9Ls0uO1HhhhBOMhj2zxZTuuVJjIQqX94DBx
	 +KgVinLXMZvTf0PLPZaXlLuH5nyLfMFuwoClSslkNl7UxSljNMpjdjlw6UEevXj72Y
	 n9hkmKOExgvActWN43YnGocNlRH1Gzip2fBravrXYHid1jKtYEaxCzndzkQWqxskda
	 WUwDSGGY1wsmyOaBFiMwDUZXnlHrbdE1iS+YWdKNPKbL6kEJchz5Gz6SEfsWACpUFO
	 tmRWELy6CPa3kjRBDZGNuH2y8YQEHAwoUUXQ1qdCxjjy4aOU+Ne9jeDlol+t8X7/qn
	 mDWnnSYD2Cikg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 10:13:29 +0200
Message-Id: <DAKEK5YPNCAU.3LQGI98GGG4KF@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <benno.lossin@proton.me>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <chrisi.schrefl@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] rust: devres: fix race in Devres::drop()
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250603205416.49281-1-dakr@kernel.org>
 <20250603205416.49281-4-dakr@kernel.org>
In-Reply-To: <20250603205416.49281-4-dakr@kernel.org>

On Tue Jun 3, 2025 at 10:48 PM CEST, Danilo Krummrich wrote:
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

I don't understand the exact sequence of events here. Here is what I got
from your explanation:

* the driver created a `Devres<T>` associated to their device.
* their physical device gets disconnected and thus the driver core
  starts unbinding the device.
* simultaneously, the driver drops the `Devres<T>` (eg because the
  driver initiated the physical removal)
* now `devres_callback` is being called from both `Devres::Drop` (which
  calls `Devres::remove_action`) and from the driver core.
* they both call `inner.data.revoke()`, but only one wins, in our
  example `Devres::drop`.
* but now the driver core has finished running `devres_callback` and
  finalizes unbinding the device, even though the `Devres` still exists
  though is almost done being dropped.

I don't see a race here. Also the `dev: ARef<Device>` should keep the
device alive until the `Devres` is dropped, no?

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
> Fixes: 8ff656643d30 ("rust: devres: remove action in `Devres::drop`") [1]
> Reported-by: Alice Ryhl <aliceryhl@google.com>
> Closes: https://lore.kernel.org/lkml/aD64YNuqbPPZHAa5@google.com/
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/devres.rs | 33 ++++++++++++++++++++++++++-------
>  1 file changed, 26 insertions(+), 7 deletions(-)

> @@ -161,7 +166,12 @@ fn remove_action(this: &Arc<Self>) {
>          //         `DevresInner::new`.
>          let inner =3D unsafe { Arc::from_raw(ptr) };
> =20
> -        inner.data.revoke();
> +        if !inner.data.revoke() {
> +            // If `revoke()` returns false, it means that `Devres::drop`=
 already started revoking
> +            // `inner.data` for us. Hence we have to wait until `Devres:=
:drop()` signals that it
> +            // completed revoking `inner.data`.
> +            inner.revoke.wait_for_completion();
> +        }
>      }
>  }
> =20
> @@ -232,6 +242,15 @@ fn deref(&self) -> &Self::Target {
> =20
>  impl<T> Drop for Devres<T> {
>      fn drop(&mut self) {
> -        DevresInner::remove_action(&self.0);
> +        // SAFETY: When `drop` runs, it is guaranteed that nobody is acc=
essing the revocable data
> +        // anymore, hence it is safe not to wait for the grace period to=
 finish.
> +        if unsafe { self.revoke_nosync() } {
> +            // We revoked `self.0.data` before the devres action did, he=
nce try to remove it.
> +            if !DevresInner::remove_action(&self.0) {

Shouldn't this not be inverted? (ie 's/!//')

Otherwise this will return `true`, get negated and we don't run the code
below and the `inner.data.revoke()` in `devres_callback` will return
`false` which will get negated and thus it will never return.

---
Cheers,
Benno

> +                // We could not remove the devres action, which means th=
at it now runs concurrently,
> +                // hence signal that `self.0.data` has been revoked succ=
essfully.
> +                self.0.revoke.complete_all();
> +            }
> +        }
>      }
>  }

