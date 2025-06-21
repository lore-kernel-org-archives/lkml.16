Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FE1196C7C;
	Sat, 21 Jun 2025 07:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750490440; cv=none; b=lnoPhYcNGE0dCTp0dokDZsdg//PmFWu7Y32hNmtVcNnFbaEnN/W+6ai4cHtaFspIhyNKPTw2sae1EPfevn/ix0u53BmmsaemkxKX65tjJnTTmAYA1P7STxv5xcYsQ4RGyh0fgNHm4N9JqRndIJiXuBAxLwYG23o7X7jh8Q4K95U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750490440; c=relaxed/simple;
	bh=mLvd9Gqocb9k339FLiaa/yirmOQpnB7Yx6TkRrlWF5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6E8eAiCtFdRXLi+RUaq1dlOvKn6BPgGxxh9QR1FPgZGy2M5wn6ZL2BEq2mDQgE/vXOokWeUU4LVKKrJfAj5NCPvyCIqpTxyXgl8KaHA65zNXGCq9UjxxBi3ko0xKoHILNwVduV9qZczBYVVQVIftFK0YfBG1203rBikgObXj/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=S8SuzjSy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="S8SuzjSy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A80C4CEE7;
	Sat, 21 Jun 2025 07:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750490439;
	bh=mLvd9Gqocb9k339FLiaa/yirmOQpnB7Yx6TkRrlWF5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S8SuzjSyglHmFkvRw2FoKZ7pmdYUQQUpkN4zgqkCBJ//c+rVKGeOfgGCV+7Ul4rxw
	 ePa2esUC7TitkNP1gCo9NqaGbIk7nWuxUfTnrw3rYaMUa+xjGgCfIo6hyyAfa+h78o
	 Nh/S2c8inwpytnsXEgJZ6ew51ouMHoNYag4gTe/Q=
Date: Sat, 21 Jun 2025 09:20:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	LINUX SPDX ML <linux-spdx@vger.kernel.org>,
	LINUX KERNEL ML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] LICENSES: refresh FSF GFDL/GPL licences
Message-ID: <2025062111-detonate-clapped-b630@gregkh>
References: <20250621012117.91729-1-xose.vazquez@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621012117.91729-1-xose.vazquez@gmail.com>

On Sat, Jun 21, 2025 at 03:21:13AM +0200, Xose Vazquez Perez wrote:
> Old licences have been modified, because FSF postal address was changed:
> https://lists.gnu.org/archive/html/info-gnu/2024-09/msg00000.html
> https://www.fsf.org/blogs/community/fsf-office-closing-party
> https://www.fsf.org/about/contact/mailing
> 
> Just "cut and paste" from original sources:
> https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt
> https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt
> https://www.gnu.org/licenses/old-licenses/gpl-1.0.txt
> https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
> 
> Relevant change: postal address was replaced with an URL.

You also changed whitespace and some terms, and did not describe that
here, why?

This license text comes from the SPDX repo, why not use that instead?

Or better yet, _JUST_ change the address, if that is correct with what
the FSF has published, and that's it.  Unneeded whitespace issues are
not a good idea and not needed at all.

thanks,

greg k-h
