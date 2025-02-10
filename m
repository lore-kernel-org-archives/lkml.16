Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E21E8F49;
	Mon, 10 Feb 2025 07:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739172472; cv=none; b=O4/0fFPU5jhpZ5aO+mWThdzhS+OCbm139HfoNh9uuksKjfG2rhVPisVU14idqVXRTh1nHatADQKRQUlGIEnjjlJzHZiNr7kzrhfHAB9D/+qnouCchWWGWuZq2Ubdw59xhexyxBjmbHW+WlT3Usr5Z3ElBY1uUciqgI/9j4vP8fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739172472; c=relaxed/simple;
	bh=io+aPIWHumdCGQZeZed0nhFjIJYgHleGcqa00PqvCA8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ovwL+FdhQ/iuaIk3DJf53sl+vj/KcMDEUKVF055752FhsFGd36S9cHadDD9nWEcOJ85MuftYJv/UCtcnpsKsPZ8EP/CnepS712QO8fVneQSvKurtZhUkjvlBmJ1XRz1wllzypN/cilCW04kik0Bt2iZEOHTo98g6mgh8PyW/L0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYz4sHBk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYz4sHBk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13839C4CED1;
	Mon, 10 Feb 2025 07:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739172472;
	bh=io+aPIWHumdCGQZeZed0nhFjIJYgHleGcqa00PqvCA8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aYz4sHBkexH3zcP6ZHhwCY/js7zCpMTCmyfAe3o+uWAwHXSHR4iMLv5zEJHhqtiCj
	 t1ovl0XJ9NuNySnbw0086oQpQci/Ys3PFOnFAzumjjThlHOPCKJZmnq6JFrJ2OJRd9
	 M/99DDq6d8CkWvrrC/sUrN5wb3xQCnaRYRxiVbb8VzvNBUMGkDFiVQE30Wa+typQbm
	 vFSUDAGLaJQXe9ux7z/Ao7dk2g4k9NKom+v3kCqZIp+Wn2TmfnLJ6vfY5IqpMqQoab
	 PSYzTQcJiQUydb9NkgdaSmSrRnOygtPibZO4ffEfUdZvd89tkV3yFZF3o9r7y5NIGh
	 1h74ioKPqEUyw==
Date: Mon, 10 Feb 2025 08:27:48 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [RFC v2 18/38] docs: sphinx/kernel_abi: use AbiParser directly
Message-ID: <20250210082748.05ba85ae@foz.lan>
In-Reply-To: <878qqlfxc9.fsf@trenco.lwn.net>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
	<fb800900352d90a0e501e5d6732e1bea277478f2.1738020236.git.mchehab+huawei@kernel.org>
	<87lduu7efu.fsf@trenco.lwn.net>
	<20250129014324.60a8dfce@foz.lan>
	<20250202155652.1652e420@foz.lan>
	<878qqlfxc9.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 04 Feb 2025 10:12:22 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Hi Jon,  
> 
> > As I'll be preparing such patches for merge along this week, I'd
> > like to know what do you prefer in terms of directories:
> >
> > 1. Keep it as-is;
> > 2. have a separate library directory for Python modules
> >    (scripts/lib?);
> > 3. place python modules inside scripts/;
> > 4. place python modules inside Documentation/sphinx (IMO a bad
> >    idea);
> > 5. something else  
> 
> Honestly, I'm not sure.  I do feel that importing out of scripts/ is
> inelegant at best; having a dedicated directory for modules meant to be
> imported would be better.  So maybe scripts/lib?  Or lib/python, though
> that might raise eyebrows elsewhere, dunno.  Pick something you like,
> and we'll give that a try.

I would go for scripts/lib then.

> 
> > Btw, I'm considering to also submit later a patchset similar to
> > this one converting kernel-doc to Python. I already started writing
> > something like that (written from the scratch, following as much
> > as possible what we have today on Perl to avoid regressions).
> >
> > I would probably split the code into separate classes to make the code 
> > more readable/maintainable (a base class, a class with rest output,
> > another one with man output, and a few other helper classes).  
> 
> I definitely approve of the idea - I've pondered doing such a thing, but
> have never come close to finding the time.  It's probably worth looking
> at the rewrite Markus did years ago as a starting point?

I took a look on Markus work: it was licensed under GPL 3.0 and it was
written in 2016. There were several changes on kerneldoc since them,
including the addition of a regex that it is not compatible with
Python re[1]:

        $members =~ s/\bSTRUCT_GROUP(\(((?:(?>[^)(]+)|(?1))*)\))[^;]*;/$2/gos;

This one use:

	- recursive patterns: ?1
	- atomic grouping (?>...)

Also, it is hard to map what he does with the existing script. I'm
opting to write a new script from scratch. I have already a version
that does ReST conversion (still missing man pages and filtering).
I'll send a RFC patch once I get it to the point it works properly.

[1] In the specific case of such regex, added on this commit:

	 50d7bd38c3aa ("stddef: Introduce struct_group() helper macro")

    I'm not sure why a very complex regex was used there. I'm currently 
    stuck on handling it properly in Python. An option would be do to:

	try:
		import regex as re
		has_regex_advanced_features = True
	except:
		import re
		has_regex_advanced_features = False

    And, if has_regex_advanced_features is false, use a simpler regex 
    that would work in Python or would just ignore struct_group
    expressions.

    Another option would be to re-implement such regexes without using
    such advanced patterns.

Thanks,
Mauro
