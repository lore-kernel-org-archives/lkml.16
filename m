Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C861B12B63;
	Mon,  2 Jun 2025 09:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748856861; cv=none; b=XUoU+uryFG1Ih2H2A+5715abd1QiYC8xgUBwl792mlXZXSzfLkw4OLXlqGopAb5ryeJjEpvsWNwGibpFfWhFSBah/VORYh+tUgawAb/u3qcbBhiOIV+MJ+vu4yuL4arsGSI4f+mOome3cQiUmvbACziACMSjH/dEcqbDoMZNDgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748856861; c=relaxed/simple;
	bh=uaNxXdIv0VOzDzA7SEWBB4Mg9JidqvOk1YBgqw7TZok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H86wAp4RHFl2SMl/l/YIMdEnXl0VGQL0R7PzAU2WCB+hFfTssFGql5cSN00a4BwvQEI/tRYfbwuWeB5GFN43gQfKyIe+le+QyKEqR+pdaiB1jjP++GbAA+6QDDxtlNRcg4pF2MRig+5Gds4nI/s/ZVlB0g1d7HVEPY9OFf4LfwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LDTZOai3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LDTZOai3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45CDC4CEEB;
	Mon,  2 Jun 2025 09:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748856861;
	bh=uaNxXdIv0VOzDzA7SEWBB4Mg9JidqvOk1YBgqw7TZok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LDTZOai3vQMw7aoiAJgvh0t0Fjt7kkZtGC2RIJkWQhfOLWhqefq4pNwT1fOPsOmLG
	 gH4bhbfa2W4w90B6kpz85ZxUoXRYBmbwtLZZvD/k6Q9ONCyLvxgKgaBP5JS8uMPnU+
	 WmipumcGf99lZSlOxx0cXNoTeeuORYIyg+bnCycM=
Date: Mon, 2 Jun 2025 11:34:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sai Vishnu M <saivishnu725@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, daniel.almeida@collabora.com, me@kloenk.dev
Subject: Re: [PATCH v3] rust: doc: Clean up formatting in io.rs
Message-ID: <2025060244-dragster-unknowing-23f0@gregkh>
References: <20250602083119.17752-2-saivishnu725@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602083119.17752-2-saivishnu725@gmail.com>

On Mon, Jun 02, 2025 at 02:01:20PM +0530, Sai Vishnu M wrote:
> From: Sai Vishnu M <saivishnu725@gmail.com>
> 
> Removed reference to internal variables in the comment of `IoMem`
> This avoids using private variable names in public documentation.
> 
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes:  https://github.com/Rust-for-Linux/linux/issues/1167
> 
> Signed-off-by: Sai Vishnu M <saivishnu725@gmail.com>
> ---
>  rust/kernel/io.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index 72d80a6f131e..41404c1e17b3 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -43,7 +43,7 @@ pub fn maxsize(&self) -> usize {
>      }
>  }
>  
> -/// IO-mapped memory, starting at the base address @addr and spanning @maxlen bytes.
> +/// IO-mapped memory region.
>  ///
>  /// The creator (usually a subsystem / bus such as PCI) is responsible for creating the
>  /// mapping, performing an additional region request etc.
> 
> v1: Used backticks instead of `@` for parameters
> link: https://lore.kernel.org/rust-for-linux/20250530123129.31505-2-saivishnu725@gmail.com/
> 
> v2: removed reference to the variable entirely.
> link: https://lore.kernel.org/rust-for-linux/20250601164939.5306-2-saivishnu725@gmail.com/
> 
> v3: Moved changelog to commit message. Used the proper parent commit.

All of this "version" text needs to below the first --- line, as the
kernel documentation describes.  Putting it down here makes it so the
patch will not apply at all :(

thanks,

greg k-h
