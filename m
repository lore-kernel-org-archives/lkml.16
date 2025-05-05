Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4BC1A5BB6;
	Mon,  5 May 2025 05:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746421206; cv=none; b=M8/6c2QNJTsvCHhebyFwH0SZ7RFU0O1K6FyRvT32e6l1roILnxEn1QO22EN03oTXdDVeoZQSt3uHRKgu2z/FUMutxN2MSBZ+zo5EV0rh1TbAXaK8kIK29RWLYiZdkTdVANedqu/8dnWoL66TEr7aNFsz4fBCQbJrO2oEakENBzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746421206; c=relaxed/simple;
	bh=y752l2ToGFkhw6kZQZEFJ2FARY230jWaWs4UYE7RZcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMd0EbGWIPLqeV9n3kS59cDUahcQp3yL1Co5Z9YVkllrD9G2D+zZJkfRny5EgUM/89a32quVfMWv8EI+ChjucCWMwe84/kbK+cXF/af3B1sUaJIZxv2weA2SroqXjvM441aZrAjhel65j4jjOaTtxYtTMiApqW2fsPDGSxrEJY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2EX/fff6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2EX/fff6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A55FCC4CEE4;
	Mon,  5 May 2025 05:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746421205;
	bh=y752l2ToGFkhw6kZQZEFJ2FARY230jWaWs4UYE7RZcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2EX/fff6i+ktQOhguGPaLoLDdQJQQ46m7X+IOzlAjbRga284f/pDBuPqUbw3Wh3Eh
	 rcLss8qplx5Zr8bRKlxRo3mKp5Mds8QSusz4Ny27T5xrxdTrqHDp5B9ZxC4XYCcgIy
	 PX18Wnis8RVnhXqK32qEXj+MgOMZZDY/NUpm5rMg=
Date: Mon, 5 May 2025 07:00:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hans Zhang <18255117159@163.com>
Cc: mathias.nyman@intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xhci: Add missing parameter description to
 xhci_get_endpoint_index()
Message-ID: <2025050546-unlivable-monitor-ad66@gregkh>
References: <20250504160415.183331-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250504160415.183331-1-18255117159@163.com>

On Mon, May 05, 2025 at 12:04:15AM +0800, Hans Zhang wrote:
> Fix kernel-doc warning by documenting the @desc parameter:
> 
> drivers/usb/host/xhci.c:1369: warning: Function parameter or struct member
> 'desc' not described in 'xhci_get_endpoint_index'
> 
> Add detailed description of the @desc parameter and clarify the indexing
> logic for control endpoints vs other types. This brings the documentation
> in line with kernel-doc requirements while maintaining technical accuracy.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>

What commit id does this fix?

thanks,

greg k-h
