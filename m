Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FCA1EB5FF
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 23:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743204192; cv=none; b=tzN6QbV5B27stinftgrJDCpaLVu+vT1n71iWBHbVCvHhcU92Os2jfv+dKRfNzALVy11YeSnnl/wzDfxEX3jI5txjMyXxYKhBnHTh3zmtxX1/QYjs1eYMElAylVyUece9JXox/Ff4Xh5Zdv6lOZnkWI8Dx0+dbdL/QaPrRHtGo1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743204192; c=relaxed/simple;
	bh=FYCb6jI6gE0zR+3jmwvLvCpodqrhqxP4ovGMxUIe7yE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hw1dF9DzlJY4BHMIZ/ESNChAS2HBMM5yeal2eIXf27sm0r49cEuAkVzEhj82JBkLD91/F9wIhNib32VOSkNDaRmge4BFXhOI4CT/Ds+DC9sWayB7KIWWbwTKvXk7zBJ24gMPA6TK1etaJaVGP/4vq0ZpB8BpdwtGQC/4hu8/0cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZeZFHCS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZeZFHCS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D958AC4CEE4;
	Fri, 28 Mar 2025 23:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743204192;
	bh=FYCb6jI6gE0zR+3jmwvLvCpodqrhqxP4ovGMxUIe7yE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GZeZFHCSU2iRgXNRV4t94f8mMZmPH3hvO97o8OPEYFbitp0KCur03hz6+ke4tAumn
	 06ylm1183YhIx7IgWaOKwDqoxocaotAIaxLW7QlfsVqlAcCREQNNFKhXH+vIswg+Km
	 1I4CBVZr6C4QXzE1WvAXl3Vt4uz+5/t1eddJuBLNNx1LVNKXMNQ7+qvFhZlai7e2aU
	 qlFNYFyJHP4nhCDrfmDjezKlC9kLdVG4rJI7s7hfTMDEGKoJNKoJ+lGMhqxKNe46UW
	 aMFOq8OIZSthcA50NotlCBEu1SzfFzOJ3QFV2e6lphMMNUgQ6Y/lrKCUOGzsy+jSt7
	 +zShGmmdWJQeA==
Date: Fri, 28 Mar 2025 16:23:11 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "H. Peter Anvin (Intel)" <hpa@zytor.com>
Cc: Michael Kelley <mhklinux@outlook.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, "Xin Li (Intel)" <xin@zytor.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>,
 Nikolay Borisov <nik.borisov@suse.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [tip: x86/core] x86/cpufeatures: Generate the
 <asm/cpufeaturemasks.h> header based on build config
Message-ID: <20250328162311.08134fa6@kernel.org>
In-Reply-To: <SN6PR02MB4157D2C2260E6BD529BCF08AD4A52@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20250305184725.3341760-3-xin@zytor.com>
	<174238223959.14745.6970497940010271580.tip-bot2@tip-bot2>
	<SN6PR02MB415756D1829740F6E8AC11D1D4D82@SN6PR02MB4157.namprd02.prod.outlook.com>
	<CAHk-=whChrRQ0kuRuZo2+9D+J2BO9Q=1CV2eEk_yjrNi8kdjBg@mail.gmail.com>
	<SN6PR02MB4157D2C2260E6BD529BCF08AD4A52@SN6PR02MB4157.namprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 23 Mar 2025 18:06:07 +0000 Michael Kelley wrote:
> > > With this commit, changing the modified time on .config causes cpufeaturemasks.h
> > > to be rebuilt, and then all dependencies on cpufeaturemasks.h are also rebuilt. It
> > > doesn't figure out that nothing has changed in .config. A fair amount of
> > > unnecessary rebuilding is done.  
> > 
> > Hmm. Normally it is the tools that *create* the config file that
> > should notice that it hasn't changed, and not write a new one.
> > 
> > See conf_write() in scripts/kconfig/confdata.c for the particular case
> > of the regular "make *config*'
> >   
> > > I'm seeing this changed behavior specifically with the make-kpkg script on
> > > Ubuntu 20.04. It's not clear why make-kpkg is updating the modified time
> > > on .config, but prior to this commit, that update had no negative effect.  
> > 
> > It sounds like the make-kpkg script should probably be fixed to not
> > overwrite the config file unconditionally, and do that "make
> > oldconfig" and friends do, which is to notice when it hasn't changed
> > and leave it alone.
> >   
> 
> For the record, the problem with make-kpkg is that it does "make syncconfig"
> multiple times in prepping to build, sometimes passing environment
> variable ARCH=x86 and sometimes ARCH=x86_64. scripts/kconfig/conf uses
> that environment variable to decorate the header of the generated .config
> file, and to force a rebuild in include/config/auto.conf.cmd if the value changes.
> So flipping between two different values causes a "new" .config to be
> generated even though nothing of substance has changed.
> 
> I hacked the make-kpkg scripts to consistently use ARCH=x86 and that
> solves the problem. But this is a private hack as make-kpkg hasn't been
> updated in years and is no longer supported. In Ubuntu releases, it is
> deprecated after 20.04.

FWIW this also makes netdev CI melt down. Combination of allmodconfig
insisting on WERROR, us insisting on W=1, and this change insisting on
full kernel rebuild every time .config is touched :( IOW we do:

	make allmodconfig
	./scripts/config -d werror
	make -j W=1

Could a hack like this fly? I don't see an easy way out ..

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index a607769a25af..35401572d039 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -276,7 +276,9 @@ cpufeaturemasks.awk := $(srctree)/arch/x86/tools/cpufeaturemasks.awk
 cpufeatures_hdr := $(srctree)/arch/x86/include/asm/cpufeatures.h
 targets += $(cpufeaturemasks.hdr)
 quiet_cmd_gen_featuremasks = GEN     $@
-      cmd_gen_featuremasks = $(AWK) -f $(cpufeaturemasks.awk) $(cpufeatures_hdr) $(KCONFIG_CONFIG) > $@
+      cmd_gen_featuremasks = $(AWK) -f $(cpufeaturemasks.awk) $(cpufeatures_hdr) $(KCONFIG_CONFIG) > $@.new; \
+       if [ -e $@ ] && cmp -s $@ $@.new; then rm $@.new; \
+       else mv $@.new $@; fi
 
 $(cpufeaturemasks.hdr): $(cpufeaturemasks.awk) $(cpufeatures_hdr) $(KCONFIG_CONFIG) FORCE
        $(shell mkdir -p $(dir $@))
