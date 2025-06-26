Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5EA2E0B72
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 12:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750941464; cv=none; b=L+++hmZdkhH7YEymFPuMose67OUr1jtBi+lrnDLX2mfe8pGYztt9CKWUzHLtcvvx1TCBJv91L0dEFvbxcDOKlBBR277XteEUnMbZpFeTpKaBxnnpCtEgWmyG+dfj/HaDpRW2G8mdA4HUKHqipr4PWp7KU09HSKfOJJgNcl9z0iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750941464; c=relaxed/simple;
	bh=/czma84Eer6tNDzWXV4EgHZ0U8xLVTiprJkMDLL0cRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RR8Taq5IuRx/dFBR/IQCCDBSXvWFc2GWaratNaOP6X/8vq04wpGTME4YrPpUJEmMjW8qNQedk8587Li2GWYk9CXPsX4CAvFsJHJGOmWSOePear8zVGs3utUwNLR5SRqoWrhaxiVzOtxPzMBXDPopzAArABMZ+lZ9XeYjJ2onzds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Wzihc796; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Wzihc796"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+YBTVY6E54N+/VkKcNbQEDOvXDHOVgRKbti2O/wwJ9o=; b=Wzihc796sJkZex2MJVqlxkkFxF
	VSK6unBgz6ksjMIuwbiF6vJZ0Yn6eaitLf9nqZr1ROQ3+r+JWFq+OLbWjnZSohQ50LkUFnDSYLIdY
	+lCDsCCw3jsKMkW3IISeVU4dqSTxu/9Fz5PniJDF+RTQ8VxAbzqXzmn4GLnZx69vzztNREGTlgeA7
	rRpH+nBsPlZWUvxzJkq00gjJANqvL5xJeXJiZmCVuqd0vXXzTG+Itgc3e/lK25nyN8ApxLMTmPzL9
	1EUiBDxg5G8U7uu7SQUSBCe2OBwVZMXOqx/Axmb/RZ160K89jGYv+7fHibzZyhaIPlNeMpx/XqL6j
	zXZcOk5w==;
Received: from 189-92-252-99.3g.claro.net.br ([189.92.252.99] helo=quatroqueijos.cascardo.eti.br)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uUlr7-008yir-9d; Thu, 26 Jun 2025 14:37:30 +0200
Date: Thu, 26 Jun 2025 09:37:19 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: Re: [PATCH RFC] char: misc: Enforce simple minor space division
Message-ID: <aF0-_0pHqLL39wse@quatroqueijos.cascardo.eti.br>
References: <20250620-rfc_miscdev-v1-1-fda25d502a37@oss.qualcomm.com>
 <2025062445-procedure-latch-9421@gregkh>
 <ac666ce1-564d-496e-be42-8a8c1af654e7@icloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac666ce1-564d-496e-be42-8a8c1af654e7@icloud.com>

On Thu, Jun 26, 2025 at 07:29:56AM +0800, Zijun Hu wrote:
> On 2025/6/24 23:50, Greg Kroah-Hartman wrote:
> > On Fri, Jun 20, 2025 at 10:53:32PM +0800, Zijun Hu wrote:
> >> From: Zijun Hu <zijun.hu@oss.qualcomm.com>
> >>
> >> Enforce simple minor space division related to macro MISC_DYNAMIC_MINOR
> >> defined as 255 currently:
> >>
> >> <  255 : Fixed minor codes
> >> == 255 : Indicator to request dynamic minor code
> >>>  255 : Dynamic minor codes requested
> > 
> > Is this the rule today?  If so, does the now-added tests we have for
> > misc device properly test for this?
> > 
> 
> 1) yes. this simple division becomes possible with recent commits below:
> Commit: 31b636d2c416 ("char: misc: restrict the dynamic range to exclude
> reserved minors")
> Commit: c876be906ce7 ("char: misc: register chrdev region with all
> possible minors")
> 
> both available fixed and dynamic minors interleaves with narrow space
> [0, 255) before above commits.
> 
> it is easy to balance minor space division by adjusting macro
> @MISC_DYNAMIC_MINOR if required in future as well.
> 
> Also hope all fixed minors are registered with header linux/miscdevice.h
> 
> 2) no. below recent commit don't cover the simple division fully.
> Commit: 74d8361be344 ("char: misc: add test cases")
> 
> drivers/misc/misc_minor_kunit.c may need to be corrected to reflecting
> division today.
> 

Correct, those added tests do not enforce that one cannot register a static
minor above MISC_DYNAMIC_MINOR.

However, to some extent [1], it tests that a MISC_DYNAMIC_MINOR allocation
will not return a number in the range of the static numbers. See
miscdev_test_dynamic_only_range.

It also tests that if a dynamic minor is allocated and one tries to
allocate that same number statically, it will fail. It also tries [2] to
test the other way around. That is, if one minor was statically allocate in
the dynamic range, that a dynamic allocation will not return that same
number.

Those tests, named miscdev_test_conflict and miscdev_test_conflict_reverse
were written considering the current implementation, which allows for
static allocations in the "dynamic range".

If we are going to change that, you need to change the tests too.

I would suggest applying only the last hunk of your patched
drivers/char/misc.c with a separate commit. Then, when misc_deregister
would be called the minor would be restored. However, since statically
allocating a minor above 255 would still be allowed, it could "restore" it
wrongly.

As Greg has observed, if there is no known case in the kernel where minor
is not set to MISC_DYNAMIC_MINOR by the driver before it calls
misc_register a second time, then there is nothing to fix here. If there
is such a case, then the driver must be fixed. It has always been the case,
even when the ranges were different, that the minor needed to be reset to
MISC_DYNAMIC_MINOR before calling misc_register after misc_deregister has
been called.

As you point out, when misc_register fails, it already restores the minor
number.

Let me know if you want to proceed with this change and need help with the
test case. I may be slow to respond since I am going on vacation.

Regards.
Cascardo.


[1] To some extent, because due to the large dynamic range, it only tries
allocating 256 dynamic minors. And only verifies numbers below 16 are not
returned, because that was the bug that existed before.

[2] Tries, because due to the large dynamic range, instead of allocating
all numbers, it just assumes that the allocator would give the first
number, but it also picks that "first" number by doing a dynamic allocation
and freeing it.

> >> This enforcing division also solves misc_register() reentry issue below:
> >>
> >> // Suppose both static @dev_A and @dev_B want to request dynamic minors.
> >> @dev_A.minor(255) @dev_B.minor(255)
> >>
> >> // Register @dev_A then de-register it.
> >> @dev_A.minor(255) -> registered -> @dev_A.minor(500) -> de-registered
> >> -> @dev_A.minor(500)
> >>
> >> // Register @dev_B
> >> @dev_B.minor(255) -> registered -> @dev_B.minor(500)
> >>
> >> // Register @dev_A again
> >> @dev_A.minor(500) -> encounter -EBUSY error since @dev_B has got 500.
> > 
> > Does this ever really happen?
> > 
> 
> i never meet this issue. but in theory, it may happen as explained below:
> 
> misc_register()/misc_deregister() are sometimes called within driver's
> probe()/remove(), such cases have reentry requirements
> 
> actually, error handling in misc_register() also reset minor code allocated:
> 
> 	if (IS_ERR(misc->this_device)) {
> 		misc_minor_free(misc->minor);
> 		if (is_dynamic) {
> 			misc->minor = MISC_DYNAMIC_MINOR;
> 		}
> 		err = PTR_ERR(misc->this_device);
> 		goto out;
> 	}
> 
> > And with the recent changes in the last dev cycle in this code area, is
> > it still an issue?
> >
> 
> this is a different issue with the ones recent changes fix.
> 
> >> Side effects:
> >> It will be refused to register device whose fixed minor > 255.
> > 
> > Do we have any in-kernel users that are > 255?
> 
> NO. no kernel users have such usage.
> 
> Actually, if fixed minor (>255) is used to register miscdev, it may
> encounter failure since the fixed minor (>255) may be allocated for
> other dynamic requests.
> 
> > 
> > thanks,
> > 
> > greg k-h
> 
