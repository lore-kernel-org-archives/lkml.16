Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A4F1E502;
	Fri,  9 May 2025 14:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746801958; cv=none; b=KhqjLKSHnL8ZeZSOwd4JqrKbmqcAYzU5G4Yq6g1GXPoST/X3OZ3pHWPbc5k/7DOWpDy8dLhjiuRYwdVF3FWagVCZCI2pZyexSNiDAYQc1KZ7NuSaLzhJHYCQiS9cRiNClBM2+sWH9BvKfvftYzwr3IOU++HZFr8BWiRwGTH67lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746801958; c=relaxed/simple;
	bh=ntBMin78EnkTSsOldRL7mkEUyVHQ8dmIM6H0VFghpsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M69gJclhkd1v3OsUVh4VBaBKaw+7Li2GkvQO4im378ClPQs1KgxToVrMTt6MJn6f60/lEXpr+SmT8JGQVQFarMxO2nHuCouOYnPjf2sevVV+GZ5wNkYdJbDAo48XT7bTPJRP4BQMEK9tT7Vb6E+OzKTtxJII6s2JZ3VQ5uzSNho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=G3JLyls1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G3JLyls1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3322AC4CEE4;
	Fri,  9 May 2025 14:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746801957;
	bh=ntBMin78EnkTSsOldRL7mkEUyVHQ8dmIM6H0VFghpsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G3JLyls1wH3CM1FkQAqA5JCNJ4c5dkbKnI132Yz0jyyNFnni4LCgOUht5MEuL/bwi
	 +V+A9Y4mju2nbDS30du2OmKdb9TBIs2y8GrzGA/V58kciP/0OpUwEGVpYiZgWjLeW6
	 qOpN6MhmdvzobcnVJKweyu8hpRU8hkh+/VpIgNIo=
Date: Fri, 9 May 2025 16:44:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jake Rice <jake@jakerice.dev>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] usb: storage: Add blockbuffer ptr to info struct of
 sddr09 driver
Message-ID: <2025050927-bring-gusty-e850@gregkh>
References: <20250506191531.3326-1-jake@jakerice.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506191531.3326-1-jake@jakerice.dev>

On Tue, May 06, 2025 at 03:15:31PM -0400, Jake Rice wrote:
> Hi all,
> 
> This patch updates the sddr09 driver to allocate a reusable block
> buffer. Unfortunately, I don't have access to the SDDR-00 hardware
> (which I know is pretty ancient), so I'm requesting testing from anyone who does. 
> Please let me now if the patch causes any issues or improves performance.
> 
> Best,
> Jake
> 
> ---
> Currently, upon every write the block buffer is allocated and freed which is
> computationally expensive. With this implementation, a buffer pointer
> is added as a member to the info struct and allocated when the card
> information is read. The buffer is freed during desconstruction if
> necessary.

As Alan said, this is really slow hardware so I doubt allocating/free
the buffer will even be noticeable.  Why make this change at all if you
don't have access to the hardware to test it?

thanks,

greg k-h
