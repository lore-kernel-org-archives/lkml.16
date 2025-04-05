Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F8C2FB2;
	Sat,  5 Apr 2025 08:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743842270; cv=none; b=UcAxT/BZRBqHsHWABa1959PP8H37K8i4HiPh+jc6kj0GNZ2pkaO6AZuCvwS2LAHDzORsU9GR9OC+zDFBp/QEb03gTg0LvCmgLoEYhszqCEViioRAv+ENVkpuJXRdmZe8EiM+zMmAI+LIThyWgdC581wSpFUWxJLeHnhl+vAOsc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743842270; c=relaxed/simple;
	bh=rZbBTFqh22zPlKex34rUu1jikwIP6p+olhCh1EPorsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dFpe0Z/75Sn8JEsBI/9MYLuDPMN0G1Ts4cP6OWHg+6QQPlB398fGPwE8dhpWdeSeiRIOAyQi9TEf93zK6IYT2qBNNhHub0b31WOpiIabGV7sWhnk2WWKEJ0qmVmpxL5FivhtQIZHtCq3wkvbaTEed6kK6nk0lZ/M95fdMt8jS+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ybUFy/kA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ybUFy/kA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F077C4CEE8;
	Sat,  5 Apr 2025 08:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743842270;
	bh=rZbBTFqh22zPlKex34rUu1jikwIP6p+olhCh1EPorsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ybUFy/kAxGxfx5aaYnHscn8Cejpu0sD8HjmO0J9bGPZBJl1Oq4nNnozBAAiF/u5D+
	 hAxAd9wF3eA1AlPp7ahIzMX7q4i/tjnxm3vogYsEguzzbrVb8kevtHQSjN9vnpc0Gq
	 daI5WGBeeuAM4Xd3OKflS3B9qUjJZcARIxLfhY1w=
Date: Sat, 5 Apr 2025 09:36:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	andy@kernel.org
Subject: Re: [v3 0/1] Unnecessary code cleanup patches
Message-ID: <2025040505-blip-mower-bab6@gregkh>
References: <cover.1743723590.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1743723590.git.abrahamadekunle50@gmail.com>

On Fri, Apr 04, 2025 at 01:02:19AM +0100, Abraham Samuel Adekunle wrote:
> The patchset modifies unnecessary duplicate NULL test on a
> value in an expression, when the value has been NULL tested in a
> previous expression.

Nit, the subject line does nto have "staging:" in it, so I don't know
where this goes.

Also, it really reads as "this is an unnecessary patch" :)

And finally, for a single patch, there's usually not a need for a 0/X
email to describe it, everything should be in just the single patch
itself.

thanks,

greg k-h
