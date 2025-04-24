Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30237139B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 00:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745453199; cv=none; b=Vr7NLH+oycCoMjjnPCBGWOD9BKecmb19bEVgOVGD9KjSGwSE3uMjJGDJLEicojNP3UJWsmyNL1APc/tYYa1z55QS7nbagShCm1kODPWr6BPM0cO3MZyRJ8YfByEnuBYGvOB+S985Woe4FrSlVUcDfSKZhHYssQXzp+8zKMRfkpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745453199; c=relaxed/simple;
	bh=uYeUPhaJO0VFRnUYEiHGuqeBCchIBnETBBTTmOK0m+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z72jjWu0ggK8xqRB8bw9SNu6FMOqOA/sUnzhlmattKb9QINfam+QUD6HsCEi++lUKtO6hsVigLj4q0S9c1B2NuA4Au7wf0+vtTue+//SafpmFmfkarFBR+aIbUTpakLPGEiBkIhJk1YiUG4mxvS0LDr7Pm8VqFQqPFbP9Y3IQAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from macsyma.thunk.org ([204.26.30.8])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 53O06J30011107
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 20:06:20 -0400
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 79619345A1E; Wed, 23 Apr 2025 19:05:34 -0500 (CDT)
Date: Wed, 23 Apr 2025 19:05:34 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
        linux-man@vger.kernel.org
Subject: Re: newlines in filenames; POSIX.1-2024
Message-ID: <20250424000534.GB765145@mit.edu>
References: <iezzxq25mqdcapusb32euu3fgvz7djtrn5n66emb72jb3bqltx@lr2545vnc55k>
 <20250422222131.GE569616@mit.edu>
 <3wpydsib5maytq4m4ve4b7wfbfkxwzd5m6u5woqr43qr6mickk@gw4ww6vvgyo5>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3wpydsib5maytq4m4ve4b7wfbfkxwzd5m6u5woqr43qr6mickk@gw4ww6vvgyo5>

On Wed, Apr 23, 2025 at 09:31:42AM +0200, Alejandro Colomar wrote:
> 
> <http://austingroupbugs.net/view.php?id=251>

Ugh.  Reading through that bug, despite the fact that the original
proposal was *significantly* bared down, has greatly reduced my
respect for the Austin Group.

One of the people in that bug argued unironically that using pipes
should be deprecated.  i.e., that somehow "find . ... -print0 | xargs
-0 ..." was a security problem.

<<Sigh>>

Other people pointed out that creating proscriptions that were not
implemented by many/most historical implementations would fragment the
standard and decrease the respect people would have towards the POSIX
specification.  That was the "toilet paper" comment which you
referenced.

Well, they got that right.

> I think a mode for disallowing _any control characters_ (aka
> [:cntrl:], aka 0-31) would be a good choice.

As the Austin Group Bug pointed out, the problem is that the control
characters can be printable characters, depending on the code page
that you might be using.  The example that was given was cp437.

The problem is that historically speaking, the kernel does *not* know
about what locale that is in use.  We made an exception to handle case
folding, where we added Unicode tables into the kernel.  Some would
say that was a major mistake, and it's certainly been a headache.

    	       	     	      	       - Ted
