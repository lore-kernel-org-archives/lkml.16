Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D858938F80
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747834989; cv=none; b=laAKmg5Bd880BT+UuBP0NmR4ldl9t6FT9JDbmlff5scW78unakxEPr08c7uwmCy23Axn0QAGvwCYft2ufBWx/ZPvo3tFhNHWYSCfSNkPNGVYC+m6h/tdd3pSVVBI6O66uPZIEaVuVsn+RcPK6GFlB70mXeFOuHZZSd1gGxI9Ff4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747834989; c=relaxed/simple;
	bh=ewXsOuklC5Z7FIKXEef8KCMKsx7wQL81g4nf+dup6Ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJ7lJwqxyIJr5GUauP6NJl9f6YYumsAaZZpvI9FhizJZ2paLSFIVzeK1cKHVJsw1MIMgh2urA31ps8YKYiG0ouUq5EszexzG2LcVrU30CWxW3HaskrrGqXwKMN05b5Ic05hjwB3ykueKKwT6WqBBFiGYsP7t28nR5TTZHXzxchw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=y6MBxXxl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="y6MBxXxl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAAF2C4CEE4;
	Wed, 21 May 2025 13:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747834989;
	bh=ewXsOuklC5Z7FIKXEef8KCMKsx7wQL81g4nf+dup6Ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=y6MBxXxleWgyIaUpsS9CKLYp1EnU2k1yuxEpL24/qOKV0c10Mmqfyw6ojKf9olpek
	 t6O6SLpLFAItrYmGqFwdpRnZkwjfdsgnsdCJNUuoi9XSQVgQjGpvHhOgYtZhjskCNk
	 A28Pn2PFS7KnY+PSc3O0+SpUo/pulTg5Hfh8uFj4=
Date: Wed, 21 May 2025 15:43:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] container_of: Document container_of() is not to be
 used in new code
Message-ID: <2025052118-unneeded-viscosity-8790@gregkh>
References: <20250520103437.468691-1-sakari.ailus@linux.intel.com>
 <aCyOzUIIvMk6Gp8o@smile.fi.intel.com>
 <2025052000-widen-lip-350b@gregkh>
 <aCz9jlMcXDooqx0s@kekkonen.localdomain>
 <2025052138-carport-applaud-61b8@gregkh>
 <2025052121-drastic-hacker-aab6@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025052121-drastic-hacker-aab6@gregkh>

On Wed, May 21, 2025 at 03:31:36PM +0200, Greg Kroah-Hartman wrote:
> On Wed, May 21, 2025 at 03:27:19PM +0200, Greg Kroah-Hartman wrote:
> > On Tue, May 20, 2025 at 10:09:18PM +0000, Sakari Ailus wrote:
> > > Hi Greg,
> > > 
> > > On Tue, May 20, 2025 at 04:30:19PM +0200, Greg Kroah-Hartman wrote:
> > > > On Tue, May 20, 2025 at 05:16:45PM +0300, Andy Shevchenko wrote:
> > > > > On Tue, May 20, 2025 at 01:34:37PM +0300, Sakari Ailus wrote:
> > > > > > There is a warning in the kerneldoc documentation of container_of() that
> > > > > > constness of its ptr argument is lost. While this is a faible suggestion
> > > > > > container_of_const() should be used instead, the vast majority of new code
> > > > > > still uses container_of():
> > > > > > 
> > > > > > $ git diff v6.13 v6.14|grep container_of\(|wc -l
> > > > > > 646
> > > > > > $ git diff v6.13 v6.14|grep container_of_const|wc -l
> > > > > > 9
> > > > > > 
> > > > > > Make an explicit recommendation to use container_of_const().
> > > > > > 
> > > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > ---
> > > > > > Hi Greg, Andy,
> > > > > > 
> > > > > > I guess we generally agree the additional constness check in
> > > > > > container_of_const() is useful, but adding the same check to
> > > > > > container_of() generates warnings -- there are some errors, too -- such as
> > > > > > this one currently:
> > > > > > 
> > > > > > In file included from /home/sailus/src/linux/include/linux/bcma/bcma.h:14,
> > > > > >                  from /home/sailus/src/linux/arch/x86/kernel/early-quirks.c:17:
> > > > > > /home/sailus/src/linux/include/linux/ssb/ssb.h: In function ‘dev_to_ssb_dev’:
> > > > > > /home/sailus/src/linux/include/linux/ssb/ssb.h:291:14: warning: assignment discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
> > > > > >   291 |         wrap = container_of(dev, struct __ssb_dev_wrapper, dev);
> > > > > >       |              ^
> > > > > > 
> > > > > > As noted above, 646 new missing constness checks were introduced through
> > > > > > container_of() macro use during the 6.14 cycle alone. Most of these are
> > > > > > likely harmless, but with so many new users some are bound to be ignoring
> > > > > > constness.
> > > > > > 
> > > > > > Once the warnings from bad container_of() use are worked out in a way or
> > > > > > another, the constness check could be added to the container_of() macro
> > > > > > and the current container_of_const() be dropped altogether.
> > > > > > 
> > > > > > If this patch is accepted, I'll see how to add a warning on container_of()
> > > > > > to checkpatch.pl.
> > > > > 
> > > > > Hmm... Wouldn't be better to fix non-const cases and add the const check, etc
> > > > > to the container_of() instead of doing these comments?
> > > > 
> > > > Yes, fixing up the existing places where it is broken would be best, how
> > > > many of them are there now?
> > > 
> > > Adding constness check for container_of(), with my partial build on x86-64
> > > I'm getting 893 such warnings. A fair number are probably duplicates or
> > > repeat of the same pattern, but also the compilation didn't succeed --
> > > there were multiple compilation failures.
> > 
> > So who is going to do that work?  I just did it for drivers/usb and it
> > was pretty trivial, just declaring "do not use this!" feels like the
> > easy way out, absolving yourself from any responsibility here :)
> 
> I tried it for the whole tree, and ugh, there are some real "errors" in
> there.  The nfs inode handling logic is crazy, passing in a const
> pointer and then setting fields in it.  So this will be some real work
> to unwind and fix in some places.

Oh, and here's the patch I used to test this out if anyone else wants to
attempt it.  I've sent out fixes for drivers/usb/ already, let me see
about a few other small subsystems...


diff --git a/include/linux/container_of.h b/include/linux/container_of.h
index 713890c867be..2f62729e49d8 100644
--- a/include/linux/container_of.h
+++ b/include/linux/container_of.h
@@ -15,7 +15,7 @@
  *
  * WARNING: any const qualifier of @ptr is lost.
  */
-#define container_of(ptr, type, member) ({				\
+#define __container_of(ptr, type, member) ({				\
 	void *__mptr = (void *)(ptr);					\
 	static_assert(__same_type(*(ptr), ((type *)0)->member) ||	\
 		      __same_type(*(ptr), void),			\
@@ -31,8 +31,11 @@
  */
 #define container_of_const(ptr, type, member)				\
 	_Generic(ptr,							\
-		const typeof(*(ptr)) *: ((const type *)container_of(ptr, type, member)),\
-		default: ((type *)container_of(ptr, type, member))	\
+		const typeof(*(ptr)) *: ((const type *)__container_of(ptr, type, member)),\
+		default: ((type *)__container_of(ptr, type, member))	\
 	)
 
+#define container_of(ptr, type, member) container_of_const(ptr, type, member)
+
+
 #endif	/* _LINUX_CONTAINER_OF_H */
