Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD7E168DA
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 05:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739165626; cv=none; b=VoRHb5A3utl1H5G+cvPGeNOGqaUO1uq7xGIb0lmx9QBvMKfS43si6oiHyolLPXsFJckJjSfqNYjCGMPJAxq7ITpL75kcS3NZWE0RYa4qYatDjhlw/g9ZAa7b2a6JrTkicZ/t9ZcpnhRKcBNNkHfBjNXmtRJcFNFXUN/xUtfFeIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739165626; c=relaxed/simple;
	bh=xhaDyAZoEzwt2ECFzsIWm6MQhhJ1q8m+UdQ8T10n16g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RsDrWQZa/xooLaI1P4LqyHMyP5+GDe7rs9oz1SI73lvUcm4BK1bCPf7TzfB4k0hrudGInVakm2D96e9iTmRuXE+Asp4SbY5SodLRxiHlb8jKHAQSCbQR4lfJPDRb585zsJkWOWqylKKVhKa5fU2JJCN6QDCshQi25zI1ts4vR+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=U+Bv+BcQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="U+Bv+BcQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959FFC4CED1;
	Mon, 10 Feb 2025 05:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739165626;
	bh=xhaDyAZoEzwt2ECFzsIWm6MQhhJ1q8m+UdQ8T10n16g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U+Bv+BcQJmKhgTEmVq1K+zmVSrzfSNVgy672G6QdWmqzSkVExT0Fjynr8yH160cSu
	 uhTuwzdMaJwXJNdPemgPxB4hNIYEsZJGlZAScqptmhhgKAk0WHVX4JEtTk2aYutgYV
	 19Z9Zhm+0qXXX62Er7qVFox5+HnFKinh3WY6ZR9M=
Date: Mon, 10 Feb 2025 06:33:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?5p+z6I+B5bOw?= <liujingfeng@qianxin.com>
Cc: security@kernel.org, shaggy@kernel.org,
	jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	rkeshri@redhat.com, syzkaller@googlegroups.com, secalert@redhat.com
Subject: Re: FW: GPF and null-ptr-deref caused by uninitialization of jfs
 module(INC3342348)
Message-ID: <2025021052-alfalfa-unwrapped-c53a@gregkh>
References: <!&!AAAAAAAAAAAuAAAAAAAAAKIhlVZMQAxHpE33aCjXyrEBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAADjUO4EdW0hQ4941fq05lF+AQAAAAA=@qianxin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <!&!AAAAAAAAAAAuAAAAAAAAAKIhlVZMQAxHpE33aCjXyrEBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAADjUO4EdW0hQ4941fq05lF+AQAAAAA=@qianxin.com>

On Mon, Feb 10, 2025 at 10:09:54AM +0800, 柳菁峰 wrote:
> Hello,Here is forward INC3342348 origin message
> 
> I hope to receive updated response regarding this issue.

We have no lack of syzbot reported issues, what we do have is a lack of
people fixing them, so patches are always welcome, especially as you
already have a working reproducer for the problem to test against.

thanks,

greg k-h
