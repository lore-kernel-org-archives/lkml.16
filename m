Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986D94642D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744009404; cv=none; b=GkG7ttmN0wIEmJYJx6SDVFWKqD+qPYLJ3xVxlSZXC4+uOJ+ZGdWAz0VNH8X8QtgMh9X+MUvudlZvf+I+kmQ9azLaSJ5Ec8v5wcmy3icy0jazqgUX/n9nMQnu3HCP2X//GjaUT3GHgOq0aVzLbGyRnflL7EiJJ9lEB7wLz9/eI2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744009404; c=relaxed/simple;
	bh=uDgEtJQPU+fslqK5yJ62OOHac7G6MrmEBQ72O25UGM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eivZlw/MvKPngkpPw/ik1G/spZCZmhfKaNFQXmE3c1OWUbxMC0f0J/74wD5HSaLFQf3mCwZKPfbrDb8J8kATlAj+N/TIIyaDvfq/aoRBfK1Av00ELg4wAocCcRNPD5HW62DnUsx6U66+EGZLx+AMcpYdZ1Tuxv/j5Fph9uc2KDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mkawj8Rn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mkawj8Rn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E9EC4CEDD;
	Mon,  7 Apr 2025 07:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744009404;
	bh=uDgEtJQPU+fslqK5yJ62OOHac7G6MrmEBQ72O25UGM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mkawj8Rn3vpRdaOTLMZEQqpgu8lXipID1RRje44gW8A9Lu6Eo9rOi3LytkDcSafkM
	 zhK8dtF9failqJhiEjvSt2Ep6MUUre4DOhNPi8txTfb52ZfgEi2JfKNnyTy783BwJS
	 GJ6dftEewbFPM2EwuOziJBPhJXigrs4lK0+iS/dA=
Date: Mon, 7 Apr 2025 09:01:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: zhoumin <teczm@foxmail.com>
Cc: akpm@linux-foundation.org, dakr@kernel.org,
	linux-kernel@vger.kernel.org, rafael@kernel.org,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH] kobject_uevent: add uevent_helper exist check
Message-ID: <2025040744-anvil-tiptop-bbdb@gregkh>
References: <20250405155207.aac347bcdc56e43cb0cae3cb@linux-foundation.org>
 <tencent_474AC55ADEE443D037337A9ED09422D8C408@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_474AC55ADEE443D037337A9ED09422D8C408@qq.com>

On Sun, Apr 06, 2025 at 02:19:15PM +0800, zhoumin wrote:
> Hi Andrew,
> 
> Thank you for your feedback.
> 
> > Is there any measurable reduction in boot time?
> 
> This depends on the number of uevent and the performance of the device. 
> In fact, I found this issue during a project to optomize boot time,
> and on my embedded device, it can be optimized by at least 2 seconds.

So you are spending 2 seconds in failing to lookup the uevent helper
path?  That feels really wrong, how long does your boot take overall?
What % is 2 seconds?

thanks,

greg k-h
