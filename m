Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF99C1624EA;
	Wed, 14 May 2025 14:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747234001; cv=none; b=eXbu7OAR8Smq6U4OCP5+y5KO+QSQzyhgzk3hIb6lvs06QDIxRz+6A7KBc6g0CJlf/v1okkNEodCrI/eEGq+2lmcTmhFACuzkUaTsxTWluwXQTGHnnIky3wZP1oQrSKc/d1rgk08N5W3Ytf0oGuaLH7HpxmxNegaLpAExf0FuX5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747234001; c=relaxed/simple;
	bh=SGDkX1d+uo3yITc3PwRHnv+hcDSCIY8Ie9roBIm0GuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GM7ltUFiwqNN8kAN4MXu8JwXuCSICD6ohOOpDj+zX/yqhFl6F1SmVhL30j1Xkj/QD3sd0JGShLal6RLyFN9fet7o/Z07nvbqbQjS6vq9KT9upXl86hlW/lX9H2PuOOxEUnrbVECKxmmaPXJ8F4t4t9xc3mSnM5cjRTGrxkVpdtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=x3zqkEVF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="x3zqkEVF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82EEC4CEE3;
	Wed, 14 May 2025 14:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747234000;
	bh=SGDkX1d+uo3yITc3PwRHnv+hcDSCIY8Ie9roBIm0GuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=x3zqkEVFJb3Fa92jCKKpRkUPVfhalgRi+Mv5c5OOD2XgdXlbUyuuW740l+XZ5CYPy
	 GpIUnB+86c1SXj5NnQPaB3WLGtmaIyR2ry8h9asAiInA/FFbi28QKCEZ01FpA41ooz
	 V8VbtBXLBP4DhcvODNVz3yY6OBRLhGNQm1pnJshA=
Date: Wed, 14 May 2025 16:44:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "jay.chen" <shawn2000100@gmail.com>
Cc: mathias.nyman@intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Set avg_trb_len = 8 for EP0 during Address
 Device Command
Message-ID: <2025051444-among-posh-afcb@gregkh>
References: <20250514134011.16285-1-shawn2000100@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514134011.16285-1-shawn2000100@gmail.com>

On Wed, May 14, 2025 at 09:40:08PM +0800, jay.chen wrote:
> According to the xHCI 1.2 spec (Section 6.2.3, p.454), the Average
> TRB Length (avg_trb_len) for control endpoints should be set to 8.
> 
> Currently, during the Address Device Command, EP0's avg_trb_len remains 0,
> which may cause some xHCI hardware to reject the Input Context, resulting
> in device enumeration failures. In extreme cases, using a zero avg_trb_len
> in calculations may lead to division-by-zero errors and unexpected system
> crashes.
> 
> This patch sets avg_trb_len to 8 for EP0 in
> xhci_setup_addressable_virt_dev(), ensuring compliance with the spec
> and improving compatibility across various host controller implementations.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220033
> Signed-off-by: jay.chen <shawn2000100@gmail.com>

Please use your name, not your email alias.

And as you are now using a gmail account, please set the "From:" line at
the top of the patch properly as is documented.  Please work with others
at your company that know how to do all of this if you have questions.

Also, this is a v2 patch, so always document what changed to warrant a
new version.

thanks,

greg k-h
