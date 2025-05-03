Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E54221290;
	Sat,  3 May 2025 12:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746275423; cv=none; b=p2LMmw1X0d8EOwt8HC2Zja3ZjhuBLlRkWR12iIHGdmOZp3FtBUqXGFTL/1bpQXYPAWia4b02oPROjt6HONKjS58tOr1Ex8KUVzDURLXaWVO67gvzDtYv3DkH1Wf8Kyfw2P9hOs9JxK6sInj0qt4SqzQeToxzQhrQh2Lf/nj5TZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746275423; c=relaxed/simple;
	bh=4RqM3dbTeHOhSEudiVNOdmYSNfw8s93ZXvQIrXjPVo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CE5S2n+kkdn16EGw5Dgt157/zGKZtcnWWggJqWqkn2TqHBCSC4tc2Ce8a8TLe37KgjW1ikF7Uuoaz1a1+9fj0WBDMxXFT6jvT6pbKW9uKEidqLLSu+PxnpOMVeHp3GgCr14eqMpPOVPIQXbSMR4W0CozHI7R4WeRurfxnQDe6EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pAZNFr/V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pAZNFr/V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36EEBC4CEE3;
	Sat,  3 May 2025 12:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746275422;
	bh=4RqM3dbTeHOhSEudiVNOdmYSNfw8s93ZXvQIrXjPVo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pAZNFr/V9FXhsZ/ggFR4jGuswVDQ+QDfi7WT3+HpWNkRFxGlXn0QtUmEZu065bkEy
	 HJ3NUf6ivLnHklTzq9STPGzgoq7ez3ykK+UEkaBVvegahCX4H2i57CcQuqtZEfs8zN
	 7Ofnl+RCmVaI/zmDIY5mUqXHnwMOhSnkeuQFBa/k=
Date: Sat, 3 May 2025 14:30:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "zhilin.yang" <zlyang_001@163.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: u_ether: Continue to send skbs if remote
 wakeup fails
Message-ID: <2025050321-apprehend-lavish-ea92@gregkh>
References: <20250502145352.557174-1-zlyang_001@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502145352.557174-1-zlyang_001@163.com>

On Fri, May 02, 2025 at 10:53:52PM +0800, zhilin.yang wrote:
> While UDC suspends, u_ether attempts to remote wakeup
> the host if there are any pending transfers. If there are no
> pending transfers, the is_suspend flag is set. If the is_suspend
> flag is set, it attempts to remote wakeup the host when start to
> send skbs. However, if host does not support remote wakeup, skbs
> will never be sent.

Please properly wrap your changelog at 72 columns.

> To fix this, stop to queue skbs and return NETDEV_TX_BUSY only if
> remote wakeup operation is successful.
> 
> Signed-off-by: zhilin.yang <zlyang_001@163.com>

Please use your name, which I doubt has a "." in it, right?  :)

Also, what git commit id does this fix?

thanks,

greg k-h
