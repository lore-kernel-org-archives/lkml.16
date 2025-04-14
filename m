Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847211B4241;
	Mon, 14 Apr 2025 07:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744615387; cv=none; b=Eb5hDlI1jHe1Bd+iW9ojiXc01T6mc+nA571q5BmAhT/gb7idUwgpyixdefNgeCvpaAKSVEVB1pd2ksXXq+x2P2dHunu0+rI1XLXV04SzZWpiGJj+4uUSRE8hc76UBChwcB7zUXMVwwpQpnyw0XeSXd+9pkZlcrzDoh1nQwp/rGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744615387; c=relaxed/simple;
	bh=iYfMwdwlizIVZeBodF62KsxziUgzyzoIwnXZz7RurGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2+9t9a4LkgbZLdFPPVInDc1hv18IRKlWYA2NoQDz62MtdomoGMJcyOn+UuEXfHvkSgK3Nvm2xloQm8PtInVUXnvcEWJtmHl3RYNPXQS6zNFwdpKVAm695d55Q6DHX3SPFmlbPRPY8LDy8X/BQJ7nb6VpC7l0GIC/hcLzZfUbC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xsfiJsbw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xsfiJsbw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85643C4CEE2;
	Mon, 14 Apr 2025 07:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744615386;
	bh=iYfMwdwlizIVZeBodF62KsxziUgzyzoIwnXZz7RurGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xsfiJsbwYnO0PxMvI/1zj4KhZlcGAw/gS9D8hxuIIM0ZSwnHtu+EZHXJEmbVm3qEL
	 QP680KQRtSg4tbP3kh297vP+EQczeOMydml5JLa+7eHumNRZWTqknvTTY1vbJtsT/l
	 APi00GNd4Z74spUUQF9q6Qbp35IEJofx4FwKXS/s=
Date: Mon, 14 Apr 2025 09:21:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com, dan.carpenter@linaro.org,
	andy@kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Replace `& 0xfff` with `% 4096u`
Message-ID: <2025041402-colonize-rocker-1db1@gregkh>
References: <Z/bA4tMF5uKLe55p@ubuntu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/bA4tMF5uKLe55p@ubuntu>

On Wed, Apr 09, 2025 at 06:48:02PM +0000, Abraham Samuel Adekunle wrote:
> The sequence number is constrained to a range of [0, 4095], which
> is a total of 4096 values. The bitmask operation using `& 0xfff` is
> used to perform this wrap-around. While this is functionally correct,
> it obscures the intended semantic of a 4096-based wrap.
> 
> Using a modulo operation `% 4096u` makes the wrap-around logic
> explicit and easier to understand. It clearly signals that the
> sequence number cycles through a range of 4096 values.
> It also makes the code robust against potential changes of the 4096
> upper limit, especially when it becomes a non power-of-2 value while
> the AND(&) works solely for power-of-2 values.
> 
> The use of `% 4096u` also guarantees that the modulo operation is
> performed with unsigned arithmetic, preventing potential issues with
> the signed types.
> 
> Found by Coccinelle.
> 
> Suggested by Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
> ---
> Coccinelle semantic patch used to find cases:
> @@
> expression e;
> 
> @@
> * e & 0xfff
> 
> To ensure this change does not affect the functional
> behaviour, I compared the generated object files before and
> after the change using the `cmp` which compares the two
> object files byte by byte as shown below:
> 
> $ make drivers/staging/rtl8723bs/core/rtw_xmit.o
> $ cmp rtw_xmit_before.o rtw_xmit_after.o
> 
> No differences were found in the output, confirming that the
> change does not alter the compiled output.

This is version 11, right?  What happened to the list of previous
versions and what changed down here?

confused,

greg k-h
