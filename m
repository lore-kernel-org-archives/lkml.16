Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1156B28DF17
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 18:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745432460; cv=none; b=VK5FeNsVFwwOM8KmtvPZt7JZXSkC8fxEpBY+thTiv4t7m2SDgKUhm1Y2SGQTdcEc9se5HwT6bvvAeARGb44I3GQuEBvyXkDPqiiZXMYt+Bygxt/w+f6s6yKKg6AvGM1rzhlzisG2wGYwEuKk5y68MXZfsX+qRqCk02KESu6a+GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745432460; c=relaxed/simple;
	bh=rL40QV7ZOck7njFnFxpE1AOhrGFBkAAgQb6AOZESYyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGogXTm4MF28iZjPjMGn3PnJRnR9twLHdmwdcVwQPdDHHTyuzZPnX3U96nZKrqKBOGhn2VSjBaM6lzTx2ing6Ret49tyEVlIec3yGhV34l0GWEapmvUGotsKEncVHc+CTkc/S4Dq+au4Lop0Ss+LSr/KI3WczWL/PunHJw86lK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pYmXNekC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pYmXNekC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7290BC4CEE2;
	Wed, 23 Apr 2025 18:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745432459;
	bh=rL40QV7ZOck7njFnFxpE1AOhrGFBkAAgQb6AOZESYyw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=pYmXNekC41LOXDoH5QOAMkKFF6Pojdh/uf/H3CaggiSY8u7YrARpBTt1dVtMR6hW/
	 4Nm9fFX2uN5qdm+uucfDF/+f9k4cqlAEmVsA4VZhHAk9cf3T0dGlhdJHK16KKjVKRE
	 vHBh5fXsu6Nft8qXYuNRk9HvBeqaFzTbY8BbUb+e8R9D0Ua0fqmm35lFRIty+Z/hw4
	 vda7hLUFnFd37j4eudAdpd0wx01sTzqUkx19TJSl0bBXnrvzoVktJ9ONNl1flgYLb5
	 crgVvc/v3XzS8Vo2MvZyMFYWaYyKvv613fMQZmkAbK6hqLplAvkDwsxRxv3vQL3tp/
	 z+MUXr2tbH9nw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 21DA6CE0B75; Wed, 23 Apr 2025 11:20:59 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:20:59 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Aishwarya.TCV@arm.com, sraithal@amd.com
Subject: Re: [PATCH v2 ratelimit 11/14] ratelimit: Force re-initialization
 when rate-limiting re-enabled
Message-ID: <559db775-f151-4694-86e6-72809b386097@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
 <20250418171359.1187719-11-paulmck@kernel.org>
 <257c3b91-e30f-48be-9788-d27a4445a416@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <257c3b91-e30f-48be-9788-d27a4445a416@sirena.org.uk>

On Wed, Apr 23, 2025 at 04:59:49PM +0100, Mark Brown wrote:
> On Fri, Apr 18, 2025 at 10:13:56AM -0700, Paul E. McKenney wrote:
> > Currently, rate limiting being disabled results in an immediate early
> > return with no state changes.  This can result in false-positive drops
> > when re-enabling rate limiting.  Therefore, mark the ratelimit_state
> > structure "uninitialized" when rate limiting is disabled.
> 
> Today's -next is failing to boot a defconfig on a wide range of arm64
> ACPI platforms.  One ACPI platform (Softiron) is still fine, and I've
> not noticed any DT platforms having issues.  Output grinds to a halt
> during boot shortly after userspace starts on affected systems:
> 
> [   23.334050] Freeing unused kernel memory: 11328K
> [   23.355182] Run /init as init process
> [   23.378221] NET: Registered PF_INET6 protocol family
> [   23.396506] Segment Routing with IPv6
> [   23.414054] In-situ OAM (IOAM) with IPv6
> 
> A bisect converges fairly smoothly on this patch in -next, which doesn't
> look completely implausible for something that stops console output - I
> didn't dig into it at all though.  I see that Sirkanth (CCed) seems to
> have reported a similar issue though with a different SHA1 since he
> noticed on yesterday's -next.

Thank you for the confirmation of Bert's and Srikanth's reports!

They reported that the replacing the offending commit with the following
patch fixed things up:

------------------------------------------------------------------------

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 04f16b8e24575..13ed636642270 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -35,7 +35,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	unsigned long flags;
 	int ret;
 
-	if (!interval || !burst)
+	if (interval <= 0 || burst <= 0)
 		return 1;
 
 	/*

------------------------------------------------------------------------

If that fixes things for you, could you also please try the following,
also replacing that same commit?

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 04f16b8e24575..8f6c54f719ef2 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -35,8 +35,10 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	unsigned long flags;
 	int ret;
 
-	if (!interval || !burst)
+	if (interval <= 0 || burst <= 0) {
+		ret = burst > 0;
 		return 1;
+	}
 
 	/*
 	 * If we contend on this state's lock then just check if
