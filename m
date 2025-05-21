Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DFC4C74;
	Wed, 21 May 2025 04:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747801148; cv=none; b=FC+IootkiOnaTJDzI1vP2pTI7zn+JB6/ffpSr4Vxj6t+0aqQp84zYcin+8jkWRYgLYemU6/NESpqFXFtR84xMNMNTXMHrnyZ4CKALZ+U4z1zC73tjD0Beu0KYugIO13X0VDToFRZKljlkL4L2CRIt8XhcL8GGwmMcHfAVXuvP1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747801148; c=relaxed/simple;
	bh=RE/zGEQn3HpGfrl9zUt/0y6DHdLHReb+v/il33a7fYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RxvTfh4VlXNAWUn2eOpguitTcUZW9lEcELrLUAn2Ht4aa61+OwCZoCX0sEgQnApafBU7Gedv0iLVh7+cb7nlynVhZdbxQ7HxqRSu9uMgPAjra56kkHEZf9ymMTX0dWVYoQkSFmmQDT3zUnIwNdyJbuJ4TvIcLf3Bm4Wd519en0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bsBQWEV3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bsBQWEV3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9276FC4CEE4;
	Wed, 21 May 2025 04:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747801148;
	bh=RE/zGEQn3HpGfrl9zUt/0y6DHdLHReb+v/il33a7fYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bsBQWEV323gSFJXEapJEPiW8HRqRTw1gOcgl+O01RoeDDDj4Nj0dLXWiUvd+ms41H
	 maj1A5Aq2htXkF0WhOAIYqAe0S7Qkp6Fq3kg+O934YbslAQUk+vXylLqWeF5qcFedg
	 VCt5TCZj0VZBB720fZEBvm8a4N0Ijp8p1JxWCSS4=
Date: Wed, 21 May 2025 06:19:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Donny-Dev <donnyturizo13@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Fix typo in variable name
 'ips_deffer_ms'
Message-ID: <2025052140-deputize-liberty-96e9@gregkh>
References: <20250521011358.12910-1-donnyturizo13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521011358.12910-1-donnyturizo13@gmail.com>

On Wed, May 21, 2025 at 01:13:57AM +0000, Donny-Dev wrote:
> The variable 'ips_deffer_ms' had
>  a spelling mistake ('deffer'
>  instead of 'defer').
> This patch rename it to
> 'ips_defer_ms' to correct the
> typo and improve code clarity.

You have 72 columns to use, please use them :)

> Signed-off-by: Donny-Dev <donnyturizo13@gmail.com>

Please use your real name.

thanks,

greg k-h
