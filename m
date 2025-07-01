Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3736F2AD02
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 12:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751371511; cv=none; b=ituwv/s9ZGNtqzK9KhK4wCPRjTjGF15wtUEogbu/HxJ5/JGi0L/qbO339mTPHX/cA0mwpTnPL9zIDmdEGLX8xTlTovf3en5zk91LFyc6Dw3ZVK0qoTjei0Y0mobZfxz8M9SEH0lrGJUH2sohD+YI2iNttQCnl76xW29XBgTJkGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751371511; c=relaxed/simple;
	bh=7Il850HC4B6hsF48EAUNNcNpYLtlGdgfeExCGJTT5zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r7Z5xqy+El/txGfGIuIDbs5mgQs1DlSV/ImITtNFVFcc5bmy8Kdyd+TJSKgrd+w0vlrflStOCFiF98HTBfShc7R7YnD1UUVerfTGpL75w5c5KMbL/9WcIfb/eILaGVkxvGDw1tJrdpli+M0KyL/QXWvVIXbCZ0JydLeNDp8wgN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zI5N0dsr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zI5N0dsr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55F19C4CEEB;
	Tue,  1 Jul 2025 12:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751371509;
	bh=7Il850HC4B6hsF48EAUNNcNpYLtlGdgfeExCGJTT5zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zI5N0dsrYMzuQZIqsab3+H7eX65Jf71MjBGkS7z5335bmp0WMXo5Q+P8oMCEeEIZl
	 3BGna0fE5ULRNFOjwTBI31yQDJPZGVBEVzqy1FYD9B6+pGqXg2GAnLJUqumsaLoOyd
	 GuFmTYMI1NgTujy8SMV7FDoa5SNIpEwXt6jTnmBs=
Date: Tue, 1 Jul 2025 14:05:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>,
	Ninad Palsule <ninad@linux.ibm.com>, linux-fsi@lists.ozlabs.org
Subject: Re: [PATCH] fsi: make cdx_bus_type constant
Message-ID: <2025070156-babble-moodiness-fbf7@gregkh>
References: <2025070111-magma-scheme-313d@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025070111-magma-scheme-313d@gregkh>

On Tue, Jul 01, 2025 at 01:59:12PM +0200, Greg Kroah-Hartman wrote:
> Now that the driver core can properly handle constant struct bus_type,
> move the fsi_bus_type variable to be a constant structure as well,
> placing it into read-only memory which can not be modified at runtime.

Got the subject wrong, let me go fix up...
