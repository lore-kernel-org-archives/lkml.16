Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B342F1F869E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 11:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747826679; cv=none; b=ZMPwPZBQ7drIMKrxStCwSk7S8JGxBQAkVnOKvO0/K4jGGZ0k5Ag07LKFuEhcxeClLDFCsoB3Xe394VsFgHoaLA9QsJGMcDaakZlhQ6eaHJeYl+11eIL87TzCJsp1t4XgqYmaSQU4VNPpZ5n9vnJrtJMu9NSyVC/81FqRB2gtpTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747826679; c=relaxed/simple;
	bh=HtG7dGBzYKwlsDCHOgzLc6f15ORTyc2DWiOAB0bqj1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfWkuAI4Gojw6R6/DNt8Qjpw+w56OOkImZGY/+oUBhZYqasP/OfJMfessvE/A7GxIalZZQDWo8pdTxiAs+3kD/Yj5X/WXLEbiP0p9lRnuGj1CnvSWMdT8mwYzjU1RE+x2KebavwQ8RpaGIDTRw3jZ7NYkct/noiYbTYoXAkDSTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PKJuDgUf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PKJuDgUf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B15C9C4CEE4;
	Wed, 21 May 2025 11:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747826679;
	bh=HtG7dGBzYKwlsDCHOgzLc6f15ORTyc2DWiOAB0bqj1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PKJuDgUf1pMzjSuv8KY69mCYvvRaTsHN3fkvYG022JosQwG16eaqQm1s4lxGIaZyR
	 9pY4eT7PkFq7oQYCM/t5rT20GW1m308lnC1hcWOrqyE+Jf650moeuEOBRZWFMatQri
	 1orJ54PIC09hshr5lffQlrc2nL7nGH3UvbKuFPoc=
Date: Wed, 21 May 2025 13:24:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Max Kellermann <max.kellermann@ionos.com>
Cc: tj@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs/kernfs: implement STATX_BTIME
Message-ID: <2025052100-depravity-founder-6332@gregkh>
References: <20250506164017.249149-1-max.kellermann@ionos.com>
 <2025050600-economist-display-2d25@gregkh>
 <CAKPOu+8c4Z_Biie3R6LP3pz6u-bpzBZjfoWv4XAQ5AreziDccg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKPOu+8c4Z_Biie3R6LP3pz6u-bpzBZjfoWv4XAQ5AreziDccg@mail.gmail.com>

On Tue, May 06, 2025 at 08:30:26PM +0200, Max Kellermann wrote:
> On Tue, May 6, 2025 at 7:44 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > You did just make this structure bigger, which has a real effect on many
> > systems (think 32bit s390 systems with 30k disks.)  Are you sure this is
> > really needed?
> 
> No, it's not "needed", and I understand that you question any increase
> in struct sizes.
> 
> If you really worry about memory usage, kernfs has a lot of potential
> for optimizations. One simple example: embed struct kernfs_node into
> struct kobject/cgroup_file instead of having a pointer. That would
> save 8 bytes plus the overhead for a memory allocation (i.e. that
> alone would save more than my patch adds). Would you accept such an
> optimization, if I were to submit a patch?

Sure, if that saves memory that would be a good change.

> > What userspace tools want this in such that they can not determine this
> > any other way?  What do they want this information for?  What is going
> > to depend and require this to warrent it being added like this?
> 
> We have a process that reaps empty cgroups and reads resource usage
> statistics (https://github.com/CM4all/spawn and
> https://cm4all-spawn.readthedocs.io/en/latest/#resource-accounting),
> and this process would like to know when that cgroup was created. That
> means we can measure the lifetime duration of the cgroup, and for
> example we can estimate the average CPU usage over the whole lifetime.
> Using the cgroup's btime is the natural canonical way to determine
> that time stamp, but cgroupfs doesn't implement it.
> 
> Sure, our container manager could store the birth time in an xattr ...
> but that feels like a lousy kludge. If we have a concept of btime, I
> should use that.
> 
> (It's okay if you don't like the patch and it doesn't get merged - as
> always, I can happily keep it in our private kernel fork. I'm only
> offering my work to everybody, because I'm a strong believer in open
> source.)

I feel like the creation time here is odd, but if others really
need/want it we could take it.  I would like to see others review it
though.

> > And knowing when a device shows up in the system isn't that, sorry, the
> > kernel log shows that for you already, right?
> 
> That was a theoretical example that's of no interest for me currently
> (just a side effect of my patch), but it might be interesting for
> others.
> But are you suggesting that programs should read and parse the kernel
> log for that? I don't think any program should ever do that.

Many programs read the kernel log for various reasons, that's why we
have some common macros/functions for displaying data properly there,
like the dev_err() call.

thanks,

greg k-h
