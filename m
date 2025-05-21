Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B8D231857;
	Wed, 21 May 2025 07:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747811164; cv=none; b=WWKZXTa9LFmwLG+hDZbjx1joIvjutw/2wFCa9HXfbzESIerahB/LCdcW8Jhz2V+hQaLUqGT7dh7boAdwVUu+qwZb2bUfuikk+RErqKSEecv4W5OZy2Rh2dPEpAenDmuxRf9MyHdeCYJZL19zpa1vNU3GnBCWXqEEM52gQWIOAJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747811164; c=relaxed/simple;
	bh=NjqaB0O3NiViOC6SIiau9SxCy8Ie5x4b0CTYJB1+P6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A5f1hACaWI4XiqmNNYt0yc7qJwcU3AMx4lIntuqs6+rLuKMhYqLvb0trSMD+eIqiBCk1Kwti3nT2Nc9u7k5MbH06dHsvYoeuRUUsKHpm1a0GHvyLjAzPN3nJmJDv66shx+LYWFE0BsEvYopy+QNeN/WLrX+KMXQVIG9+1l0Q/n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=if833Ztc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="if833Ztc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42694C4CEE4;
	Wed, 21 May 2025 07:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747811163;
	bh=NjqaB0O3NiViOC6SIiau9SxCy8Ie5x4b0CTYJB1+P6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=if833ZtcnPVEc2BaZ/BxPYcp4EJn2F6hmrhTIQeTGHQOULHgmK19gpIT+UjELoSGP
	 biTk2btxVk4cCd9ipUxnJbzMgCmksUnFWSGpoN2hnzq7SpKMUpq2V1R/8WwXaj4d4p
	 Zc2oe5lZt/+gepvrZ/vFPAmuyFN6nzJgtoRrAWRY=
Date: Wed, 21 May 2025 09:06:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: rujra <braker.noob.kernel@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] staging : greybus : Documentation : firmware :
 Replace deprecated strncpy() with strscpy()
Message-ID: <2025052120-partner-sulfite-81dd@gregkh>
References: <CAG+54DZYz-4hW33Py9mihHDauWw55=_rP71s1MbCg-5gxw7J7Q@mail.gmail.com>
 <2025052116-diaphragm-payback-a3ef@gregkh>
 <CAG+54Db4k-sMVHUsUWx=oN-AXE5aife=Ugx4f49smGnhq6=-0g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG+54Db4k-sMVHUsUWx=oN-AXE5aife=Ugx4f49smGnhq6=-0g@mail.gmail.com>

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?


http://daringfireball.net/2007/07/on_top

On Wed, May 21, 2025 at 11:11:26AM +0530, rujra wrote:
> Hi greg,
> 
> why is this a RESEND ?:
> 
> >> I had sent the same patch 4 days ago and didn't get any reply , hence tried to resend the same patch for the same,
> here is earlier mail :
> https://mail.google.com/mail/u/1/?ik=f63b03515e&view=om&permmsgid=msg-a:s:12290863930259651721

That is a link to _your_ account, not a public record of your email :(

> ,
> 
> line does not match this:
> >> sorry , i could not get it what it is exactly ?, if possible can you share some insights or example so that from in future i would get it right.

Your "From:" line in your email does not match with the signed-off-by
line.

thanks,

greg k-h
