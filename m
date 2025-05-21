Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784FF4A21
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747835184; cv=none; b=OTcOhZcvhl5POOzq0hO+w+Ltd6bgayEJ4K1ELNX7oenaXzaNCXzVSBYVA+8tTSbuFx0EzEd1vrMCn5H99c+8WzM86mwciFkrjKBh8XpKlFJutj3CN8TN10M0hiapVyYrQAlAbDK0bCnmG2QvSbAeA8dT1rFwUNcNkp503DMaoxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747835184; c=relaxed/simple;
	bh=eQ8+Cd8WCJ96TP2sE+wg5x88FjD5Yy+Ylv7G3FxH/jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPywCyFuQUcMdKZYEo0GuxUUDJ9UeejMCHhpXMOXpVjYUXwSqsaNzYtW9EdfgBOg9WGvdD2Qh5oFCeMEZ2WF2gkpSzjviubS4iMSEFMzPT+jl6jh9RgBngIWIYJISZ7P0YL5i0HcSvd1oQk+bpC/PvogPPulmbg5ahHMGWt9huk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1d1/GTmX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1d1/GTmX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF8EC4CEE4;
	Wed, 21 May 2025 13:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747835184;
	bh=eQ8+Cd8WCJ96TP2sE+wg5x88FjD5Yy+Ylv7G3FxH/jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1d1/GTmX9zR8jwvfxNp0EMQIvK05DiyefwEDgWii0Jhch8gTl70ysBGEQZnkF94L1
	 uf9wJ2oMabANFswNyqXqqRChBN9xVYXQvCTN1Zp95TjGn9miRrG9dkVOly1csc7ucy
	 1wB2n4CMNi/0yJKdbRT4bg8uTJVWoIaypoMO3tyM=
Date: Wed, 21 May 2025 15:46:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org,
	gregory.clement@bootlin.com, richard.genoud@bootlin.com,
	u-kumar1@ti.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Davis <afd@ti.com>
Subject: Re: [PATCH RESEND v3] mux: mmio: Add suspend and resume support
Message-ID: <2025052157-uncurious-crayfish-0d58@gregkh>
References: <20250407-mux-mmio-resume-support-v3-1-cb88abc04db7@bootlin.com>
 <c65c01b0-f407-4479-a6ad-6969c5cab06e@bootlin.com>
 <2025052119-agenda-greyhound-d37c@gregkh>
 <8f6fb9b4-dc84-4443-b7e2-1a857400f79a@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f6fb9b4-dc84-4443-b7e2-1a857400f79a@bootlin.com>

On Wed, May 21, 2025 at 02:54:04PM +0200, Thomas Richard wrote:
> On 5/21/25 14:27, Greg KH wrote:
> > On Wed, May 07, 2025 at 10:33:22AM +0200, Thomas Richard wrote:
> >> On 4/7/25 15:06, Thomas Richard wrote:
> >>> The status of each mux is read during suspend and stored in the private
> >>> memory of the mux_chip.
> >>> Then the state is restored during the resume.
> >>>
> >>> Reviewed-by: Andrew Davis <afd@ti.com>
> >>> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> >>
> >> Hi Greg,
> >>
> >> I apologize for involving you, but Peter is not responding anymore. I
> >> pinged him several times, resent the patch but no news.
> >>
> >> Could you please review and apply this patch directly?
> > 
> > Does not apply to my tree :(
> 
> I just tested again and it applies on v6.15-rc1.
> Which tree are you talking about ?

char-misc-next.  Or try it on linux-next, 6.15-rc1 is quite old now.

thanks,

greg k-h
