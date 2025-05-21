Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9406B79CF
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747830449; cv=none; b=i5lgdC4KMav3qI5dR6mjeXiFbpWe1KXY7WT2wxYiOChGWYiRPXbGdQyg4/juxWH7RTeMPyfb59ZcuUJY308D2eqIxjt3BvNICeMMdhw/NTcmU3hw1WdvL+rRXAPbYFRWFk0MO60Zna6SbWc6F23skHs/7EkE3HiAfiPOmGmJwMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747830449; c=relaxed/simple;
	bh=j6O42uMmAOaCXOj8Yb3fq15lBX7OkBwdZSL/NTq05rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gS65UPwce9k5Qm06+LgL7WJDbijJD2x/+QEHJy53Aa+pRVJ5c90p3BDciSMyZ4UlHFD6j3eJCfcHY0T52By0bH6/2dyoeQTxB6qOrKcLzw5ZnCkpx6bzyA7Qg0PXA4V+zXHJFa7x6ilOtQ+75atpx8p9+ObEAfAqZ9ymaV7iW8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2ENn6ukI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2ENn6ukI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81FAAC4CEE4;
	Wed, 21 May 2025 12:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747830449;
	bh=j6O42uMmAOaCXOj8Yb3fq15lBX7OkBwdZSL/NTq05rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2ENn6ukI0L5FiZMk0obC2r5XeSjqNUnWNRdPMhf1mc5nmidqorx38jNhHmDRE2zSG
	 5DFkVfOlJptk+JLFz0ch/cRiSJq3HhvLyeNejnZKyHQ7IK7if/bjJctcwi4ktr1WU0
	 zhA6XHhlrhboRIIF8ZXbjP83e3qaQpZmuOomiPcs=
Date: Wed, 21 May 2025 14:27:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org,
	gregory.clement@bootlin.com, richard.genoud@bootlin.com,
	u-kumar1@ti.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Davis <afd@ti.com>
Subject: Re: [PATCH RESEND v3] mux: mmio: Add suspend and resume support
Message-ID: <2025052119-agenda-greyhound-d37c@gregkh>
References: <20250407-mux-mmio-resume-support-v3-1-cb88abc04db7@bootlin.com>
 <c65c01b0-f407-4479-a6ad-6969c5cab06e@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c65c01b0-f407-4479-a6ad-6969c5cab06e@bootlin.com>

On Wed, May 07, 2025 at 10:33:22AM +0200, Thomas Richard wrote:
> On 4/7/25 15:06, Thomas Richard wrote:
> > The status of each mux is read during suspend and stored in the private
> > memory of the mux_chip.
> > Then the state is restored during the resume.
> > 
> > Reviewed-by: Andrew Davis <afd@ti.com>
> > Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> 
> Hi Greg,
> 
> I apologize for involving you, but Peter is not responding anymore. I
> pinged him several times, resent the patch but no news.
> 
> Could you please review and apply this patch directly?

Does not apply to my tree :(
