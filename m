Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA7123C515;
	Wed, 21 May 2025 09:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819178; cv=none; b=iJ8dXf2894hMmfBownOh3gcI9bxKvSRXBO6sStTlKwXDb+vIt0bG+AuGOMzTrwsFhUE/JR3Fb4015pUaosHTGY5kDsK2MLteDL09JeOL11NFg3Kt8gl2WMF0O+tQyaNteHT4PI5kdKhpPhbFy7W0yPjiGWdJLb5m4JuMg56oD3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819178; c=relaxed/simple;
	bh=KQZ0URLKaAeR3tem+EHBReFm/G2mKEAF1N/X4iJwrB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWp4Wtxlq4VGAJOzUHYIh+CXpcq1iTjBIvm4YTZb0TkEdrUjCQba42gOxr11+axi0TI1ufEIpYYbtNtZZOkDYa7hsrDBVWFO9f44TF54eNWeYN7ddrqiPNc3YmKMRbFVdRP5O3Ku3aA9OXHv/QL3CKUpCVojybzdZTyqrJdTiXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CnwI/D7Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CnwI/D7Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19F2EC4CEE4;
	Wed, 21 May 2025 09:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747819177;
	bh=KQZ0URLKaAeR3tem+EHBReFm/G2mKEAF1N/X4iJwrB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CnwI/D7QchRUObcWrSVYhqS/6KJS9ACo+MIkYyOrkgLUhEnnMdksgs2zCN7G7eHav
	 VHTDzZyMK+kZr0tp4EaFqhWpAGB9EojTwKD+ZnnQ26y+0fIMAyS/1H/24jQp9Q9zkZ
	 RLMiJcGSmrBlze+KZaqjdBkWRwAxy/RjSTV1FLps=
Date: Wed, 21 May 2025 11:19:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Rujra Bhatt <braker.noob.kernel@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] staging : greybus : Documentation : firmware :
 Replace deprecated strncpy() with strscpy()
Message-ID: <2025052140-reprogram-polish-30da@gregkh>
References: <aC2ILNV6xgt11KuN@brak3r-Ubuntu>
 <2025052142-maturing-earthworm-cb31@gregkh>
 <CAG+54DZWjN3ii-JCOME8XdA1B+5yCmRSo0-wqTv+zt5w6UcEVA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG+54DZWjN3ii-JCOME8XdA1B+5yCmRSo0-wqTv+zt5w6UcEVA@mail.gmail.com>

On Wed, May 21, 2025 at 02:08:52PM +0530, Rujra Bhatt wrote:
> On Wed, May 21, 2025 at 09:06:00AM +0200, Greg KH wrote:
> > A: http://en.wikipedia.org/wiki/Top_post
> > Q: Were do I find info about this thing called top-posting?
> > A: Because it messes up the order in which people normally read text.
> > Q: Why is top-posting such a bad thing?
> > A: Top-posting.
> > Q: What is the most annoying thing in e-mail?
> >
> > A: No.
> > Q: Should I include quotations after my reply?
> >
> >
> > http://daringfireball.net/2007/07/on_top
> >
> > On Wed, May 21, 2025 at 11:11:26AM +0530, rujra wrote:
> > > Hi greg,
> > >
> > > why is this a RESEND ?:
> > >
> > > >> I had sent the same patch 4 days ago and didn't get any reply , hence tried to resend the same patch for the same,
> > > here is earlier mail :
> > > https://mail.google.com/mail/u/1/?ik=f63b03515e&view=om&permmsgid=msg-a:s:12290863930259651721
> >
> > That is a link to _your_ account, not a public record of your email :(
> >
> > > ,
> > >
> > > line does not match this:
> > > >> sorry , i could not get it what it is exactly ?, if possible can you share some insights or example so that from in future i would get it right.
> >
> > Your "From:" line in your email does not match with the signed-off-by
> > line.
> 
> This has been addressed successfully, Kindly preview it.

I'm sorry, preview what exactly?  If you think you have fixed it,
send a new patch with it fixed up as a new version.  I can't determine
anything just from an email like this :)

> is this the way correct about the reply email ?

Yes.

thanks,

greg k-h
