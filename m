Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9706B2D46B4;
	Fri,  4 Jul 2025 12:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751630681; cv=none; b=GmuPeQSxP0RUuG3845od7eGNqPi72MTHwWlsBnz4qTBIGZAU4y4SRtJFVwxBY8FX841GiD6h41GwV0iEPAomsD6QhlIBEl0mW5xA3BcbRounDEkIfdBbmTTGVzWSAYJKhHxx0pfLvIDWGqtwEWdO3brTf/nnHopt1k3V1msFt/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751630681; c=relaxed/simple;
	bh=h1s5jBBiV6pG756G9M04lUnoOS0jQ0qJgj49ePhNsRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jah2SNsKY3Ou7HRNW+pcSycNsRsfrM8BQa+NUql6pf2A43rF7W/PDrK+dSTVlaBUT70MUuhnLImb1+DU0MQINtazmbGUqiVy19esm0CXUUpSJVx9ItL+8sxle28Bbr/+3vv9FbUn3sVFa5zB893iXe3SZEeFO//tMlR53whFfUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bLBte2bl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bLBte2bl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C22C4CEE3;
	Fri,  4 Jul 2025 12:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751630681;
	bh=h1s5jBBiV6pG756G9M04lUnoOS0jQ0qJgj49ePhNsRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bLBte2blwKt7JAx0PxRkqvqI/2HZzHuqHOa5Pue5LIgZOV78DUsjVs7wbgkN/HqAd
	 rbyRlrvlCGf6KOBYiGm/HTopY0gsvQiBSu95yewxkLktZkIHENLNOn3PGatHDH4zxx
	 ut48YPft9lwi1lp6AlswTQan/YlH+5t4bYLq5k1U=
Date: Fri, 4 Jul 2025 14:04:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Srikanth Chary Chennoju <srikanth.chary-chennoju@amd.com>
Cc: Thinh.Nguyen@synopsys.com, m.grzeschik@pengutronix.de,
	Chris.Wulff@biamp.com, tiwai@suse.de, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, punnaiah.choudary.kalluri@amd.com
Subject: Re: [PATCH 1/3] usb:gadget:zero: support for super speed plus
Message-ID: <2025070407-walmart-mobile-c0f7@gregkh>
References: <20250704114013.3396795-1-srikanth.chary-chennoju@amd.com>
 <20250704114013.3396795-2-srikanth.chary-chennoju@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704114013.3396795-2-srikanth.chary-chennoju@amd.com>

On Fri, Jul 04, 2025 at 05:10:11PM +0530, Srikanth Chary Chennoju wrote:
> This patch adds supports for devices which are capable of super speed plus.

Nit, you need so ' ' in your subject line :)

thanks,

greg k-h
