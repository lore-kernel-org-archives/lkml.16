Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2820A25CC4F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 22:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745360558; cv=none; b=Z039ZT1XXfD9dvcByROp9OqGJZrzWOx9oY5Wd4pXtArZf1qisYtHsbhERbU7iLxrkkQNz5mm6MmPZ+Xv8h3WdZnQVCU0mJ6/8pryVDvhbdQLUdeNneXRczy3K/fB4y+hIfPX/a7QRMbfx2EUe715X3JXinQwtok1v4as5k3xGxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745360558; c=relaxed/simple;
	bh=8+W3ZgMU+QoYs4p0b2TU3n98HQ9zhovyAb7htKt2BxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Seo1lsGTieVi2stv2hVe+UpgTW4Gx0e2nxaofgwTvNRPgrpuCp07loy4WxdZvxkSEHGpMwP3SBz/HxziXiiEeFzkR9sHqz82XTrSCSfQduwNWV5cqhGC+/9yi0z17p1ncbN/2H+85w6SQC3jkWxTaTE2cDxqV9QWSrzVfhOJEn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from macsyma.thunk.org ([204.26.30.8])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 53MMMFeS008792
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 18:22:16 -0400
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 28C693463B2; Tue, 22 Apr 2025 17:21:31 -0500 (CDT)
Date: Tue, 22 Apr 2025 17:21:31 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
        linux-man@vger.kernel.org
Subject: Re: newlines in filenames; POSIX.1-2024
Message-ID: <20250422222131.GE569616@mit.edu>
References: <iezzxq25mqdcapusb32euu3fgvz7djtrn5n66emb72jb3bqltx@lr2545vnc55k>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <iezzxq25mqdcapusb32euu3fgvz7djtrn5n66emb72jb3bqltx@lr2545vnc55k>

On Wed, Apr 16, 2025 at 06:50:00PM +0200, Alejandro Colomar wrote:
> 
> I'm updating the manual pages for POSIX.1-2024.  One of the changes
> in this revision is that POSIX now encourages implementations to
> disallow using new-line characters in file names.
> 
> Historically, Linux (and maybe all existing POSIX systems?) has
> allowed new-line characters in file names.

Do we have any information of which implementations (if any) might
decide to disallow new-line characters?

If the Austin Group is going to add these sorts of "encouragements"
without engaging with us dirctly, it seems to be much like King Canute
commanding that the tide not come in....

Personally, I'm not convinced a newline is any different from any
number of weird-sh*t characters, such as zero-width space Unicode
characters, ASCII ETX or EOF characters, etc.

I suppose we could add a new mount option which disallows the
weird-sh*t characters, but I bet it will break some userspace
programs, and it also begs the question of *which* weird-sh*t
characters should be disallowed by the kernel.

> I guess there's no intention to change that behavior.  But I should
> ask.  I thought of adding this paragraph to all pages that create
> file names:
> 
> 	+.SH CAVEATS
> 	+POSIX.1-2024 encourages implementations to
> 	+disallow creation of filenames containing new-line characters.
> 	+Linux doesn't follow this,
> 	+and allows using new-line characters.
> 
> Are there any comments?

I think this is giving the Austin Group way more attention/respect
than they deserve, especially when it's an optional "encourage", but
whatever...

						- Ted
