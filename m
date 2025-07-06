Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86DA18DB1A
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 07:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751785292; cv=none; b=cHXJkgrgopmHGXi64fQo4NgsVSC15AbVsPkkqW8RTsG9gaUPz8PUCakeMm/x4vZ4TzcSDlA36S7zXR8IoBroWrpVp8HZuN2rhn4GmvRt/Wpm/FyWTiQCWi0txUtufAMF1IIhnibJvmrc3TCZ1pY2Pche/PakBb3VoiPYBUVAQUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751785292; c=relaxed/simple;
	bh=3lm9xxcrlgIXCgKt7ZTRsurqJCXYkY+6vZZBANv13As=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K09370jsasMsiOm8p7rKe5mjb9vJrt8vSbf4rEw+5Qh1b13OwpnUw6ZNKvDnBPMxkvujhdKf3xskkaeECXlEy48divSFCRi0MI0Jjn+ExiNWGPdDb4FLFuABtF6qo1JAKKWfNvzsjui30YGn0PL6Un0Hy9pzYMKFJBamSJAR8IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 56671Opm029762;
	Sun, 6 Jul 2025 09:01:24 +0200
Date: Sun, 6 Jul 2025 09:01:24 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
        linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH v2 2/2] tools/nolibc: add a new "install_all_archs"
 target
Message-ID: <20250706070124.GD29601@1wt.eu>
References: <20250629170732.16817-1-w@1wt.eu>
 <20250629170732.16817-3-w@1wt.eu>
 <2363c2c9-a3ba-4b2b-849e-cd9e4d73297c@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2363c2c9-a3ba-4b2b-849e-cd9e4d73297c@t-8ch.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sun, Jun 29, 2025 at 10:44:31PM +0200, Thomas Weißschuh wrote:
> On 2025-06-29 19:07:32+0200, Willy Tarreau wrote:
> > This installs all supported archs together, both from nolibc and kernel
> > headers. The arch-specific asm/ subdirs are renamed to asm-arch-$arch,
> > and asm/ is rebuilt from all these files in order to include the right
> > one depending on the build architecture. This is done by reusing a
> > template file (asm-template.h) for each file found under asm-arch-*,
> > and including the right sub-dir depending on the current arch.
> 
> Personally I would slightly prefer the shorter asm-$arch/ over
> asm-arch-$arch/. Similar how the arch-*.h files are named.

That was my first intent but I wanted to avoid special casing asm-generic
if the list of archs to be processed came from asm-*, as my initial
approach was to have a method that was totally independent of nolibc. I'm
of course fine with that approach as well, just not sold on any of them
at the moment.

> > This allows to use a single unified sysroot for all archs, and to only
> > change the compiler or the target architecture. This way, a complete
> > sysroot is much easier to use (a single directory is needed) and much
> > smaller.
> 
> What is the base commit for this series?

Just forgot, will check, though at the moment it's not important since
the purpose is to discuss about the installation method.

> > --- a/tools/include/nolibc/Makefile
> > +++ b/tools/include/nolibc/Makefile
> > @@ -86,6 +86,7 @@ help:
> >  	@echo "  headers             prepare a multi-arch sysroot in \$${OUTPUT}sysroot"
> >  	@echo "  headers_standalone  like \"headers\", and also install kernel headers"
> >  	@echo "  help                this help"
> > +	@echo "  install_all_archs   install a multi-arch sysroot + kernel headers in \$${OUTPUT}sysroot"
> 
> "headers_multiarch" Would be more consistent with the other targets.

I'm still not fond of any of the names in the list, they're all confusing
because the same terminology is used to install uapi headers and nolibc
headers. Ideally I'd like to have this:
  - a method to install only uapi headers (similar to make headers_install
    but for all archs supported by the kernel).
  - a method to install nolibc headers only (now it's for all archs so
    that's probably covered).
  - a method to install uapi+nolibc only for one arch (currently
    make headers_standalone)
  - a method to install uapi+nolibc for all archs supported by nolibc

If it is made clear that there is no interest in packaging uapi headers
for archs not supported by nolibc, then this means that nolibc can be
the place where the archs to be packaged is decided, and the two can
be more tightly coupled, but as of now, this lack of interest is not
yet obvious to me.

In addition, I think it can remain desirable to be able to produce headers
packages for a given kernel version, and independent nolibc headers, so
that it beacomes easy to simply assemble the two depending on what's
desired. And as a convenience, having a single target that does everything
is obviously nice.

> Also should be above "help".

If renamed, yes, but I was respecting alphabetical ordering ;-)

> >  	@echo ""
> >  	@echo "These targets may also be called from tools as \"make nolibc_<target>\"."
> >  	@echo ""
> > @@ -105,6 +106,29 @@ headers_standalone: headers
> >  	$(Q)$(MAKE) -C $(srctree) headers
> >  	$(Q)$(MAKE) -C $(srctree) headers_install INSTALL_HDR_PATH=$(OUTPUT)sysroot
> >  
> > +install_all_archs: headers
> > +	@# install common headers for any arch, take them all. This will clear everything.
> > +	$(Q)$(MAKE) -C $(srctree) ARCH=x86 mrproper
> > +	$(Q)$(MAKE) -C $(srctree) ARCH=x86 headers_install no-export-headers= INSTALL_HDR_PATH="$(OUTPUT)sysroot"
> > +	@# remove the contents of the unused asm dir which we will rebuild from the arch ones
> > +	$(Q)rm -rf "$(OUTPUT)sysroot/include/asm"
> > +	$(Q)mkdir -p "$(OUTPUT)sysroot/include/asm"
> > +	@# Now install headers for all archs
> > +	$(Q)for arch in $(nolibc_supported_archs); do \
> > +		echo "# installing $$arch"; \
> > +		if ! [ -d $(OUTPUT)sysroot/include/asm-arch-$$arch ]; then \
> 
> I don't understand this check. If used with an existing sysroot, the
> files won't be updated.

It comes from my initial intent not to depend on onlibc and instead seek
a method to incrementally install archs one at a time in the target
directory.

> > +			$(MAKE) -C $(srctree) ARCH=$$arch mrproper; \
> 
> For the defconfig target we tried to avoid implicitly deleting files.
> Maybe letting make erroring out would be less surprising.
> A clean source tree is necessary for the testsuite anyways.

My problem for now is that we don't have an explicit "clean all archs".
I've been spending a lot of time running and re-running the installation
to see it fail in the middle after a minute, it was really a pain that I
imagine nobody would accept. We could have a "clean-all-archs" target to
avoid the surprise and mention it in the help command as a prerequisite.
I've also been wondering if using O= could alleviate the need for mrproper,
but I don't know (not tried yet).

> > +	for file in $$(find "$(OUTPUT)sysroot/include/"asm-arch-* -maxdepth 1 -name '*.h' -printf '%P\n'); do \
> > +		sed -e "s!_ASMFILE_!$$file!" asm-template.h > "$(OUTPUT)sysroot/include/asm/$$file"; \
> > +	done
> 
> I think it should be possible to use the existing arch.h as template.
> That would avoid some duplication and busywork.

Yes it could, but see my comments above, arch.h is nolibc and I still
suspect there can be interest in installing headers for all supported
archs outside of nolibc.

All of this means that such points are not yet clarified. I'll leave
that at rest for a while, seeing if others chime in any direction, so
as to try to propose something that better matches everyone's needs,

Thanks,
Willy
