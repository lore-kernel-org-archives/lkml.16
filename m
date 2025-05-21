Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDEA236451;
	Wed, 21 May 2025 11:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747828775; cv=none; b=oP0hqHEQSVEe5Xm1RfmEHX2cffvvSEgh1n3VZa+rGTXGvE2LC0TxEibTxzYFMNHgA4PcNE/872Cclq5Wjb+uB+MvIxbTy3BmkgdaOAke3KjH6mS+EG2S9P4MD6t+3/mDLrxHRgetqSixq7g+6zwZXnIwyrl5EjOaQ9JOVUzkUBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747828775; c=relaxed/simple;
	bh=VB+9/B3bnqfyE1YkqB4s1Q7fIX4qpcah8DL7O16Ihhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n04OVZ0yJa631FoytRLY3IyLMgOxeRzEBA3rHl3dLbYoQCzm6Kw1T7vGTkN1utEB0B+A4LCEJ99IyEit3i6X6Qrtu0co2hwcixROER8cwhUBlnGFYT9dnpVg08gMgEMg7tfWDh2qAEKctRBZdi+XAENsXdJ8gCpuBl5mlzrlYEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=b8Yb+OKS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="b8Yb+OKS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7261BC4CEE4;
	Wed, 21 May 2025 11:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747828774;
	bh=VB+9/B3bnqfyE1YkqB4s1Q7fIX4qpcah8DL7O16Ihhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b8Yb+OKSfjDvn66A5nAiMYrGLurbMl3zYcrIdb63RHToD/OOxi/WWwTsgC3+MMLSY
	 yJUjHPbsAaEpube5MR1xomv7QaH5aHhMX6WVIu+26AYhe9AtPyJppCbDLKfrFAfldP
	 t2cvbluPMls2wK9ROFDHfQoH4pLT38iQMgm6edPA=
Date: Wed, 21 May 2025 13:59:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 2/9] rust: device: Enable accessing the FwNode of a
 Device
Message-ID: <2025052143-ergonomic-ongoing-36e5@gregkh>
References: <20250520200024.268655-1-remo@buenzli.dev>
 <20250520200024.268655-3-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520200024.268655-3-remo@buenzli.dev>

On Tue, May 20, 2025 at 10:00:17PM +0200, Remo Senekowitsch wrote:
> Subsequent patches will add methods for reading properties to FwNode.
> The first step to accessing these methods will be to access the "root"
> FwNode of a Device.
> 
> Add the method `fwnode` to `Device`.
> 
> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> ---
>  rust/kernel/device.rs | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> index d8619d4485fb4..b4b7056eb80f8 100644
> --- a/rust/kernel/device.rs
> +++ b/rust/kernel/device.rs
> @@ -186,6 +186,21 @@ unsafe fn printk(&self, klevel: &[u8], msg: fmt::Arguments<'_>) {
>          };
>      }
>  
> +    /// Obtain the [`FwNode`](property::FwNode) corresponding to the device.
> +    pub fn fwnode(&self) -> Option<&property::FwNode> {
> +        // SAFETY: `self` is valid.
> +        let fwnode_handle = unsafe { bindings::__dev_fwnode(self.as_raw()) };

Why isn't this calling __dev_fwnode_const()?  And there's no way to just
use dev_fwnode() directly?  Ugh, it's a macro...

thanks,

greg k-h
