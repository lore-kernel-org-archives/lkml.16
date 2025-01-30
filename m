Received: from minute.unseen.parts (minute.unseen.parts [139.162.151.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D8C7482;
	Thu, 30 Jan 2025 14:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.151.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738247639; cv=none; b=Lp0QdOX+HmHU8QCeRX6kLgMsRRAH5FLQzo9HUKan+trxxGlcJoDun6ER0PLmsV5CSCdZjitVodjchX+0Imb3YgaZ/O2evDHenwCnLWRO5dn8XXsGl5zw87kbf+aNgJbDVpBrDI6ZR0JTyejmSaIQHA3swPHOGXSFkg7w3/TQpJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738247639; c=relaxed/simple;
	bh=vn1F/Gd1Nh/IjOXkXXIBlxDviwARqJ5o4zcJqS23dh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pa3aPspTycL3g9N4/r6LoCRXt41D0rQ+ABBBkjr1XT10rqndvsnFOQv/9Vvmb9WC+PWfCDMXtjKRIBQ82M/3HNNUJCs3Dvi08wn5PedJuTgnIRvKymGvUoReJgCnX3dr6pwE6wwmDFw1L4/jDRhUi3WfznvalsQ8LnkahbkRT4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unseen.parts; spf=pass smtp.mailfrom=unseen.parts; dkim=pass (2048-bit key) header.d=unseen.parts header.i=@unseen.parts header.b=vkwhLe27; arc=none smtp.client-ip=139.162.151.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unseen.parts
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unseen.parts
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=unseen.parts header.i=@unseen.parts header.b="vkwhLe27"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=unseen.parts; s=sig; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6I7M5sP+H1PcOzyefa9FhBz5nmy77udBHnCQGCqgbt0=; b=vkwhLe27dORNM5KaAQEOC5cKSr
	KotWBgeG1BoAnfEdYnjvusi9fSJceRb91ii3xRlKAwNhYHlTbvy4Al+Xwag2vDPwp62ikAVLo/KjS
	mWZj8EJi+YX6qukrJxqFhi23GOImhGTzgKx4LCIldUfBoqki1b8jDMOySYH+6+3Oli5OqFDAQOMOd
	B/7KpHtpwHMO7H5C9pZ2q9HwRw4VRqaps46Ne7q+eeHHUz0fw+h3lYVBYozxTjahvh7g+EGkyTySd
	LK5KbycYRdWbN/lWBm1M9pjOCbtpCTrzkUgFsI4j/c4kMV5KNXbdid8X9Cq3GHdi2Gxcy8kqap9mU
	A8KquPZw==;
Received: from minute.unseen.parts ([139.162.151.61]:57852 helo=minute)
	by minute.unseen.parts with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <ink@unseen.parts>)
	id 1tdVbr-0001Hj-0u;
	Thu, 30 Jan 2025 15:33:35 +0100
Date: Thu, 30 Jan 2025 15:33:33 +0100
From: Ivan Kokshaysky <ink@unseen.parts>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>, Oleg Nesterov <oleg@redhat.com>,
	Al Viro <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Magnus Lindholm <linmag7@gmail.com>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] alpha: stack fixes
Message-ID: <Z5uNvYWCwBFuX-W7@minute>
References: <20250129094312.27399-1-ink@unseen.parts>
 <alpine.DEB.2.21.2501291541500.56843@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2501291541500.56843@angie.orcam.me.uk>

On Wed, Jan 29, 2025 at 04:02:26PM +0000, Maciej W. Rozycki wrote:
> On Wed, 29 Jan 2025, Ivan Kokshaysky wrote:
> 
> > Somehow we got away with it until recently, when we ended up with
> > a stack corruption in kernel/smp.c:smp_call_function_single() due to
> > its use of 32-byte aligned local data and the compiler doing clever
> > things allocating it on the stack.
> 
>  Thank you for doing this work.
> 
>  I'll review/verify your changes by hand and push them through GCC and
> glibc regression testing, which should hopefully pick any fallout without 
> having it buried among any intermittent failures, and report back.

Thanks!

>  However, would you please cc <stable@kernel.org> with your submission, v2 
> presumably, so as to have these changes backported?

Sure.

As I need to deal with bpf build failure, v2 is inevitable.

>  The thing is I find it quite a grave bug being fixed here, which has been 
> there for decades and triggering occasionally[1], and it might be the only 
> way for users of certain older systems to get a kernel with the fix 
> already applied.  As you may have been aware non-BWX Alpha support has 
> been removed and while I'm working on bringing it back, it will likely be 
> missing support for specific models such as Jensen there will be no kernel 
> developer to look after.  So getting an LTS kernel might be the only way 
> to get a stable system for some people.

Yes, I know about your work on non-BWX Alpha and highly appreciate it.

> References:
> 
> [1] "System fails to boot when CONFIG_SMP=y", 
>     <https://bugzilla.kernel.org/show_bug.cgi?id=213143>
> 
>   Maciej

Ivan.
