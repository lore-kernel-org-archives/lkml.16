Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B318633F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744718129; cv=none; b=bXimhve2YzNu+o7eE+qqrkMQjNq2HExM5rHHEl5jqIz3u3j2AXQkb30TCD77bA5U1M7KJTLsLdGWdhZCwkVo7X4fGKQlGB0dTeEDbHFv4mWElAAAVpMxq0HQiPti352JMXTl/XM57kny/2vk7urKSt/HS3Gr8XPtWC70yjAX9T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744718129; c=relaxed/simple;
	bh=/esvY+L8tDw+9+UnsY+H5W6t4i2xiOeZDwq6uVWi18M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVsg2Bj4Vc/TNbFA2W90SUmodLlMseiNNaxJQ+3iO4yQ0ofqrYPif4TzIBrCPM6bu6HgKUXDl1nxoQYUbiT6t3MpY3VwR9K9UJs1WNLDxnX3Xvn/ZKmX3Ma78BfurTvx/4eyW2/jJ4RvrArz/n0qHg/irl1kZwOslRP/9pYEu6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=o479CiQm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="o479CiQm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F3FC4CEDD;
	Tue, 15 Apr 2025 11:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744718129;
	bh=/esvY+L8tDw+9+UnsY+H5W6t4i2xiOeZDwq6uVWi18M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o479CiQmUxW36GKoOF6x32SBZjrgOSP32Ko2KP3wD64KpFfVOQznCzWXNtM6+NGBR
	 goV2NYOhV2HfDfBdmJoNNVaJVuYM+htK/nngCi7B6waaR8rnOMH/7kGFmVuWIH059+
	 SXeVcHUgH+RxlwBqQhBBksKXyjLAK9ajrYFnDgHk=
Date: Tue, 15 Apr 2025 13:55:20 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Tejun Heo <tj@kernel.org>, Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH] MAINTAINERS: update the location of the driver-core git
 tree
Message-ID: <2025041551-oblivion-pusher-0744@gregkh>
References: <2025041447-showbiz-other-7130@gregkh>
 <Z_1LZHFnwiKl2MlO@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_1LZHFnwiKl2MlO@cassiopeiae>

On Mon, Apr 14, 2025 at 07:52:36PM +0200, Danilo Krummrich wrote:
> On Mon, Apr 14, 2025 at 07:40:48PM +0200, Greg Kroah-Hartman wrote:
> > The driver core git tree has moved, so properly document it.
> > 
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Cc: Tejun Heo <tj@kernel.org>
> > Cc: Dave Ertman <david.m.ertman@intel.com>
> > Cc: Ira Weiny <ira.weiny@intel.com>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Should we use the chance to also add the corresponding T: field to the
> FIRMWARE LOADER entry?

We can add that in a separate patch, as this is just a "rename" patch :)

> Are there other entries that go through driver-core?

Not that I can think of at the moment.

thanks,

greg k-h
