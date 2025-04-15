Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AD4EEA9;
	Tue, 15 Apr 2025 14:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744728605; cv=none; b=hUS6XvBAk/b8C6aWSuvukPYxpnTnx+z/CwFRTCmG9+SefUU5FNUO6mb6P/Bc2JDYWoIv03OgDiLSEHOPtcPHxg1ExwBvhDF0jPQ5EQ6qTEpXRyX4tLJI/P+9CTFjPxeSREsLls1V7qx5Rop9lerUebkEEEKz0M/aDgN8wcBGAkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744728605; c=relaxed/simple;
	bh=ovKn+cTo3LrtnpAZGIxLEMpzi81s6sGlKDB0b80UVKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q9zh6sY/hZ8aoO41LLBg2cUa57o4Z0fIL5cTPrkLqzcgjwhMk4MapbLrcHIZBoJDP/6l0CSjUYMuU9d52k+G/WkhfEI5DMZhARLkL4/4YiLRVROIc9FsFi0WOQ2yk1JEUbNwVhJOySPDUOmA/ZBH9gJGURFieK01jTXzg/1OpMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pDGVKtIc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pDGVKtIc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC5EC4CEEB;
	Tue, 15 Apr 2025 14:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744728604;
	bh=ovKn+cTo3LrtnpAZGIxLEMpzi81s6sGlKDB0b80UVKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pDGVKtIcAyQbPZccggJAVpkr5vhIbVBW3k/PImpU1p0QX954zq2qn1mOgnVYIRXIw
	 NHRMxgr/wBVnerDUgZSHuxIIITGQdMfsv8G0bovzETDriszS62XEef3KH1oQXBBGV6
	 VRXiyv0VB46eG8qtdtTMjcy4D+m1g3S/w23kctUw=
Date: Tue, 15 Apr 2025 16:50:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Paul =?iso-8859-1?Q?Retourn=E9?= <paul.retourne@orange.fr>
Cc: dpenkler@gmail.com, dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/16] staging: gpib: fixes multiline comments style
Message-ID: <2025041546-outlet-timid-bca6@gregkh>
References: <cover.1744438358.git.paul.retourne@orange.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1744438358.git.paul.retourne@orange.fr>

On Fri, Apr 11, 2025 at 11:21:52PM -0700, Paul Retourné wrote:
> Fixes the style of multiline comments to comply with the linux kernel
> coding style as requested in the gpib TODO file.
> 
> Paul Retourné (16):
>   staging: gpib: agilent_82357a: fixes multiline comments style
>   staging: gpib: cb7210: fixes multiline comments style
>   staging: gpib: common: fixes multiline comments style
>   staging: gpib: eastwood: fixes multiline comments style
>   staging: gpib: fmh_gpib: fixes multiline comments style
>   staging: gpib: gpio: fixes multiline comments style
>   staging: gpib: hp_82335: fixes multiline comments style
>   staging: gpib: hp_82341: fixes multiline comments style
>   staging: gpib: include: fixes multiline comments style
>   staging: gpib: ines: fixes multiline comments style
>   staging: gpib: lpvo_usb_gpib: fixes multiline comments style
>   staging: gpib: nec7210: fixes multiline comments style
>   staging: gpib: ni_usb: fixes multiline comments style
>   staging: gpib: pc2: fixes multiline comments style
>   staging: gpib: tms9914: fixes multiline comments style
>   staging: gpib: tnt4882: fixes multiline comments style

One of these did not apply to my tree, can you rebase and resend the
remaining one?

thanks,

greg k-h
