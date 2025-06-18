Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508EF15D1;
	Wed, 18 Jun 2025 06:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750226563; cv=none; b=IOFlr3kk58xhn2l1N8rShV6F9ZTD9hgUFTJkI8oaKjWrPF0nDvilJGxqcydVBSZpG4taI/sgWFCWyRmqJN3eD5d+zV3Qraddn0WYRmESp04BWLuzJXby7JeA3xrJPn8t2v4jya+/fUYFgkJFgJwbnTpnh1rVrYvbSR73goNDs3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750226563; c=relaxed/simple;
	bh=1KWjBUDvenRWajrh/urAz5Kq6VzPtstYK1MeFqukqXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CSeWfzErthubMTTVqQPHl6Bacp4oi1HDKcW/efkGv/OLXpj4tJyuvonJITQBIPRMj42PMZnWzPAH7udn+cFt4kGJdnnT5KnPUE4RIwyWpWPc+TtUyMZzxm6IC8BeXD5upyZtNCcBIIVXikAoD4lh2RjDBSqFJlCu8aNZzqm+xgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rnmrO/am; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rnmrO/am"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AF7DC4CEE7;
	Wed, 18 Jun 2025 06:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750226562;
	bh=1KWjBUDvenRWajrh/urAz5Kq6VzPtstYK1MeFqukqXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rnmrO/am5ayonNbd+R/dyfB0XZaUqe3OlmG/COBTnyQq2CA+xPyJCY6J7d2lNsixl
	 iwJupzD6k/pYG7+J+OtxTNNyhoGxAexwQSJC//oVH6MrNKODDwMBtsZegpshlmClWK
	 5btG3ckPPG0r6pwUANE/E6rP21Bo/aq4ReRQLizo=
Date: Wed, 18 Jun 2025 08:02:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: pip-izony <eeodqql09@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: host: xhci-plat: fix incorrect type for of_match
 variable in xhci_plat_probe()
Message-ID: <2025061804-existing-taking-1f9c@gregkh>
References: <20250617204500.346984-1-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617204500.346984-1-eeodqql09@gmail.com>

On Tue, Jun 17, 2025 at 04:45:00PM -0400, pip-izony wrote:
> The variable `of_match` was incorrectly declared as a `bool`.
> It is assigned the return value of of_match_device(), which is a pointer of
> type `const struct of_device_id *`.
> 
> Signed-off-by: pip-izony <eeodqql09@gmail.com>

We need a real name here, please.

Also, what commit id does this fix?

And finally, how is this even building if the type is wrong?

confused,

greg k-h
