Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F99239E9C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 17:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749576844; cv=none; b=tQsfvNSbGV7p5efVtRAomJokMW1YNZaYNoEMN3Bg1QhNmy92cA7WUfTVwnqekv8lFJ2/Jjfkf6Ec4B35aiMUNoXzC8wFH7TjwMFG4unachdNyUcZ+Oxp+WOhj01neZFVrY+VsNQ3Th+JWBAE8IyqNTY9UJpBp+KeFn499jhhhCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749576844; c=relaxed/simple;
	bh=1B4bj1bKCWDx4kIdDX5qBX73gONB/Hts3pl9yTz+RAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GuWzVvo4D2aN5doV7ZSSPwp3KbhSwXzDL5u5Of9f+TDElniOZJHVDNafph7DQ635QGR4Jd8HNN+DUvFGdGLC/7Nu6O7kzvF7ZU77kiuau/pCoHyYViW+bJmrfHdy9erYGlzYy8m+NB2izKGn5k3u8fh7onC6GsIiS1PQS7z+F1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=azpYtPJJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="azpYtPJJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA895C4CEED;
	Tue, 10 Jun 2025 17:34:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="azpYtPJJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1749576841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JluJY1ImLnnCY9XXjQmblvCgU4/bT/f4wBo1nGnTA6Q=;
	b=azpYtPJJsgfQ28D/ZBGVNuX6xb7wjCzLPR221Apk9+tWAPixiLQmo/Rp8SoKEEa0PToxJV
	IxAlr51CK++mfNLmXMh44gn4F48zqKbZ+Gm0UBeXPNpeg0363T4rIzvC9iTDSPLVY7wrNc
	oa3QomrgEP9huJbAb6qSIJr1B1FBx+w=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 969cde82 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 10 Jun 2025 17:33:59 +0000 (UTC)
Date: Tue, 10 Jun 2025 11:33:46 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Theodore Ts'o <tytso@mit.edu>, Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, Eric Biggers <ebiggers@google.com>,
	Joel Granados <joel.granados@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] random: use offstack cpumask when necessary
Message-ID: <aEhsekBWuP51sWRZ@zx2c4.com>
References: <20250610092712.2641547-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250610092712.2641547-1-arnd@kernel.org>

Hi Arnd,

On Tue, Jun 10, 2025 at 11:27:08AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The entropy generation function keeps a local cpu mask on the stack, which
> can trigger warnings in configurations with a large number of CPUs:
> 
> drivers/char/random.c:1292:20: error: stack frame size (1288) exceeds limit (1280) in 'try_to_generate_entropy' [-Werror,-Wframe-larger-than]
> 
> Use the cpumask interface to dynamically allocate it in those configurations.

Thanks. I hadn't seen this interface before. Applied with one nit fixed:

> +		goto out;;

Double semi-colon changed to single semi-colon.

Jason
