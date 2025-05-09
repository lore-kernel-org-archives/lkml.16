Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6D2269AFB
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746792653; cv=none; b=jT71CFZVSw/LkFoYM7kxdPF39Nl3Afc5CgoMWCEYUPAfV4dmow3vxZ37DucRwPPyBkzUNU2ws53cuX4LwtZnYHpZ/twD1H3o9419+gOBULKS+6WCWlIQckfQbQT21OzdnYExsnE0SEPxgAxcgcftAqKVJ+Tgp8NsNR3kFPv9fOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746792653; c=relaxed/simple;
	bh=XCc0z64VgbqtmzVk6jMi5CuOvNIgqhxOs01SPZSfkCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z467C3Wg+wxLWtN2JDWBSbplVtch1IuDRij7v9xfc8lWYCV3zpCw3WFtGa0NKfXRbQvt00pvR4RMf+KM08CAFAn5Rn09y/fIB7gJ2uKMYUbD1kVlLlDvSLSXG8Yghz5JqkM89Hz6yojA7Ll8gJpBsd0CfcScIr2V3akQbi6j5jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from trampoline.thunk.org (pool-173-48-82-148.bstnma.fios.verizon.net [173.48.82.148])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 549CAa1C018060
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 08:10:37 -0400
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 9A5EA2E00E1; Fri, 09 May 2025 08:10:36 -0400 (EDT)
Date: Fri, 9 May 2025 08:10:36 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, cve@kernel.org,
        linux-cve-announce@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: REJECTED: CVE-2025-0927: heap overflow in the hfs and hfsplus
 filesystems with manually crafted filesystem
Message-ID: <20250509121036.GA92783@mit.edu>
References: <2025040820-REJECTED-6695@gregkh>
 <20250509072033.1335321-1-dvyukov@google.com>
 <2025050940-marrow-roundish-8b98@gregkh>
 <CACT4Y+aiQcbHfj2rB6pGKevUbUoYwrHMu+aC-xh0BCKE8D-8sQ@mail.gmail.com>
 <2025050924-marmalade-overfill-fc5a@gregkh>
 <CACT4Y+ZqToLK5R__x8O1ZctsG3wQtRn36JWF2MPRYqY+Zy_CUA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+ZqToLK5R__x8O1ZctsG3wQtRn36JWF2MPRYqY+Zy_CUA@mail.gmail.com>

On Fri, May 09, 2025 at 10:03:13AM +0200, Dmitry Vyukov wrote:
> 
> If we can't prove it does not have security impact in any context,
> then the safe default would be to say it's unsafe.

In that case *anything* could be unsafe.  You could have a context
where (a) you aren't using secure boot, (b) /dev/mem is enabled, (c)
/dev/mem is world writeable, etc.  In which case the mere existence of
/bin/bash would be "unsafe".  Yes, this is uncreasonable and unsane.
But that's because the "no security impact in any context" standard is
insane.

As far as many file system authors are concerned allowing automount by
defaullt is insane, and is apparently the fault of some Red Hat
product manager many years ago.

E2fsprogs and xfsprogs now ship with a udev rule which disables
automount by default.  If applied, mounting a maliciously fuzzed file
system requires root privileges.

Of course, distributions are free to change the default, just as they
are free to ship a system where root has a default password of
"password" or /bin/bash is setuid root.  It would be insane, but
product managers often do insane things in the name of user
convenience.  In those cases, I would invite that security researchers
file CVE's with the *product* as opposed to the upstream open source
project.

If companies want to assign me a chunk of headcount (say, 4 or 5 L4's
and L5's for 3 years working on thing but ext4 hardening, plus a
full-time L5 after that working exclusively to maintain the ext4
hardening featuers and fix random syzbot complaints), I know what I
could assign them to change the security assumptions that we have for
ext4.  It might require a
CONFIG_EXT4_SECURITY_IS_MORE_IMPORTANT_THAN_PERFORMANCE parameter to
enable all of the hardening features, but it is doable.

But they aren't, so I consider it to be *obivous* that the industry
doesn't think is important --- just as Orange Book A1 certified OS's
was a total, complete, and abject commercial failure.  And note, we
don't assign CVE's based on the fact that se all OS's violate the
security trust model of Orange Book's A1.  :-)

						- Ted
