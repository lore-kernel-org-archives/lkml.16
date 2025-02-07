Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6AE23C8DE;
	Fri,  7 Feb 2025 16:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945938; cv=none; b=PvSZTbiAp4lXfj85V9KRcZ840Q3pfPSw7/gonKVO0UpbJpZJiZ4qz96MYxqwjCSkiWsvaAIzyR4Zgnd6zqHZNs2lOdYzgTcjVhwRwtmJEs8ZZw1AOzQ+j9EgJeBsXvOBPJ5bxj++kvqE28Di5VzcnCUYMYhYZNfYki1jUng57mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945938; c=relaxed/simple;
	bh=SWMAtsZl+6/OnFXjwi8FBccywuIUqyfNqF4ljMcrhtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l39NGbMzobziSgPBZkFySF/vi9w6UhkXzoKFjVPRk/Rnve7d+sHmcD1EoP4yF1283IFdHualt1Op64EB31kxFa50KUjTsZBcRuY1SnxBIMo2g0KJSh9dmjFnk7ouTH72SHW/S1nTc+NFr4yTdWPWo/1O0c043mOWi6a9Uju1tt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qfKJAe0S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qfKJAe0S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF3BC4CED1;
	Fri,  7 Feb 2025 16:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738945937;
	bh=SWMAtsZl+6/OnFXjwi8FBccywuIUqyfNqF4ljMcrhtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qfKJAe0SImk6yzc/QUsgDUhlmToZBrTalW/O15nq7508s5F5gGtY71ag1/47Sbozr
	 U25N4b3CN94u3L8Y+N0i/rhptzRmHMWa1lFBsUi6yTxgep+7JXx8FSiNlHNMxH9m9k
	 gVFMY2c52jV/+QZlGkHN4OwOL4PXRfOWASkXvzKk=
Date: Fri, 7 Feb 2025 17:32:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jillian Donahue <jilliandonahue58@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] f_midi_complete to call tasklet_hi_schedule
Message-ID: <2025020741-ladder-startling-b1c0@gregkh>
References: <CAArt=Lib_PiR1z07hb1E3tqq-PG=KVKU9CZP3cPsQE5ciokLVw@mail.gmail.com>
 <2025020708-manned-antidote-7d57@gregkh>
 <CAArt=Lg25QafefcOAGcvj2ZHuQ4Keip70NFSF1K3mau=2Y12XQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAArt=Lg25QafefcOAGcvj2ZHuQ4Keip70NFSF1K3mau=2Y12XQ@mail.gmail.com>

On Fri, Feb 07, 2025 at 09:10:50AM -0700, Jillian Donahue wrote:
> On Fri, Feb 7, 2025 at 2:35 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >   The kernel documentation should show you how to use git
> > send-email or other tools.
> 
> ok, I will use this when I resubmit.
> 
> > No Cc: stable?
> 
> Cc: stable@vger.kernel.org
> Like so? I just emailed the 3 from the maintainer script.

Yes.  See:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for what that means.

> > And this is a v2 patch, right?
> 
> I have sent a few out because I cannot seem to get it right. I can add
> v2 to the next one, if that helps.

You have to, the Documentation says to :)

thanks,

greg k-h
