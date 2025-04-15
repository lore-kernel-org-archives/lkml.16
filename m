Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE33296D06;
	Tue, 15 Apr 2025 14:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744728111; cv=none; b=jcTyTverxvuVY++UA5tRDL/YJVrVe0DyYFt/2RMsdvhLu7qLAiFphnVwZVl01rFqZHAcuI9f4IvbBGaSoMVzHp33o7rLS2uwtHZABYC1vTb5vThJAMlsg6ss8zbJ375jGjc8lwO/PcqBmznW92QeUgudPPy13UC9P4JX3PSwZr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744728111; c=relaxed/simple;
	bh=zlRT5hZp/BfIE5GKT/WAW1Lj+zdB3ypVFh179TfYHOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fFkb4AZBk/hhCOFKYBj4myzB5H0UoAgHAsBaijRppsw2msu4tNzHM1rG4CSumSLDT3Br//KSYUm4q4Gt7QCgdctu+yPhgklnFkb+6mQSP337imHDQD63iaLBMNiJR3ZV0DmqijsDEYaOiAb9xu18XzPWZ8gH2TkvuL+TZ7+SAoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2MRril7+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2MRril7+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D17EBC4CEDD;
	Tue, 15 Apr 2025 14:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744728110;
	bh=zlRT5hZp/BfIE5GKT/WAW1Lj+zdB3ypVFh179TfYHOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2MRril7+PXSL1hSkzhy/7iemVsh/YccywuaXq8GAPMrPkkxZREjMm+NQQIt33jDg9
	 S3nGBT1/pVd1fmzRThjNJAlwemYBrtXKdOOLMg7mU6/+4IA1xpkbKZaQIIEFC0vcp9
	 f6dP3PgnK9wfuu9GWBDWusUYFBBJ/tppmiUt6jP4=
Date: Tue, 15 Apr 2025 16:41:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Rubin <matchstick@neverthere.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, dpenkler@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 01/18] staging: gpib: struct typing for gpib_interface
Message-ID: <2025041512-coveting-scrimmage-9312@gregkh>
References: <20250408222504.186992-1-matchstick@neverthere.org>
 <20250408222504.186992-2-matchstick@neverthere.org>
 <804eaa0e-e1ce-4ee2-8ad4-f56bedd6d14f@stanley.mountain>
 <Z_az87Yx-NJvGASJ@tiamat>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_az87Yx-NJvGASJ@tiamat>

On Wed, Apr 09, 2025 at 05:52:51PM +0000, Michael Rubin wrote:
> On Wed, Apr 09, 2025 at 11:26:41AM +0300, Dan Carpenter wrote:
> > On Tue, Apr 08, 2025 at 10:24:47PM +0000, Michael Rubin wrote:
> > > Using Linux code style for gpib_interface struct in .h to allow drivers to
> > > migrate.
> > > 
> > > Adhering to Linux code style.
> > > 
> > > In general, a pointer, or a struct that has elements that can reasonably be
> > > directly accessed should never be a typedef.
> > > 
> > > Reported by CheckPatch
> > > 
> > > WARNING: do not add new typedefs
> > > 
> > 
> > This commit message is quite long but it's totally unrelated to what the
> > patch does.
> > 
> > This commit message should just say "Having the word "_struct" in the
> > name of the struct doesn't add any information so rename struct
> > gpib_interface_struct to struct gpib_interface."
> 
> Thank you for the input. New commit marked v2 sent to the list.

I think we need a whole new v2 series, I can't just pick up 1 of the 18
patches as a v2 as our tools will get very confused.  Can you just
rebase and resend a v3 for the whole thing?

thanks,

greg k-h
