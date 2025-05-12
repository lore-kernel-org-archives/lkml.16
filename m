Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37647229B0E
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 14:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747061066; cv=none; b=rMGxxKmidLRfk8uMv6OIrkRdrEhOrDl6f9+ARvxa5ERmC0dwZRuWk9u90Dlb3tbtCulklJbDL2Cv2dIW+fSzwZZyJRJI79jpwZBNr6GvBwsXp79GLiBQTtZHLnWe1bjKwWLXpDOqjsGKPgiIzY/3ti7Payk0HxXBkbDxDLj2f+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747061066; c=relaxed/simple;
	bh=n5u4ITr5K4JVg0SYgATbC3JFYBGncePZiQGqrLSr8Io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ji6Jvya9h53j9yaW+b2ot/hO3svsVugl+ZjPWNqVT1lEuDCYujMmgNuVnAUL4l7g1kHqpANSo75uQICRfjFVT50qpINXYGbNbcEndbvCOwsI/18s14HLbCRmeegfvcuJzpAxjN/300n9arouMH0aiQecvUPLAxx1XKedBdIVE9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from cwcc.thunk.org (pool-173-48-112-151.bstnma.fios.verizon.net [173.48.112.151])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 54CEi3xO004930
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 10:44:03 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id C548E15C022D; Mon, 12 May 2025 10:44:02 -0400 (EDT)
Date: Mon, 12 May 2025 10:44:02 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, cve@kernel.org,
        linux-cve-announce@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: REJECTED: CVE-2025-0927: heap overflow in the hfs and hfsplus
 filesystems with manually crafted filesystem
Message-ID: <20250512144402.GA200944@mit.edu>
References: <2025040820-REJECTED-6695@gregkh>
 <20250509072033.1335321-1-dvyukov@google.com>
 <2025050940-marrow-roundish-8b98@gregkh>
 <CACT4Y+aiQcbHfj2rB6pGKevUbUoYwrHMu+aC-xh0BCKE8D-8sQ@mail.gmail.com>
 <2025050924-marmalade-overfill-fc5a@gregkh>
 <CACT4Y+ZqToLK5R__x8O1ZctsG3wQtRn36JWF2MPRYqY+Zy_CUA@mail.gmail.com>
 <20250509121036.GA92783@mit.edu>
 <CACT4Y+Z8ANddFCpNHvNqq6u6=s_aWoYPwu_1HmH19OWeLBi47A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+Z8ANddFCpNHvNqq6u6=s_aWoYPwu_1HmH19OWeLBi47A@mail.gmail.com>

On Mon, May 12, 2025 at 03:22:12PM +0200, Dmitry Vyukov wrote:
> 
> This is not even about auto-mount. Let's say I am mounting a flash
> drive that you gave me, how do I ensure it's a safe image to mount?
> Removable media, portable drives, and some use cases related to
> mounting images stored in local files either deal with images with
> unknown origin, or can't provide 100% guarantee that the image wasn't
> tempered with.

From my perspective, the answer is simple.

You run fsck -y on the file system image.  If fsck.FSTYP isn't capable
of sanitizding the file system image to make it be safe, then that
should be considered a security bug for fsck.FSTYP, and should be
reported as such.

Does the user not have the latest version of fsck?  Well, they should.
If they don't have the latest version of the kernel, or any other
system software in the TCB, then they could be unsafe.  And that's on
the user.

> Question of resources for fixing is orthogonal to classification of an
> issue (if it's a bug or not, if it's a security issue or not).

No, but the resources available should inform the trust model, and
assuming that users should be able to blindly insert any random USB
thumb drive, or blindly mounting any untrusted file system image, is
not a trust model that is realistic.

If you want a different trust model, then give me the resources.
Otherwise, don't try to impose an unfunded mandate on me.  Because I
will ignore you, for the sake of my mental health if nothing else.

     	    	     	      	 - Ted
