Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D5A3208
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 01:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750210409; cv=none; b=SFlxHIkpWJy01uJuz5Mhk4YT9Y0hgOzP4cE6X67iV/qyCzd0sQ8/blclR0sA5ukYrDQ8WbAcP6K06g4pdmSZ4CoQAKfwnAvOjkXiMFA9g+DOwEWu/XG9ePh8YPb+O6cRVjjRAOcy4g494jUaRCPK96Gob9NwlLSS1jDMS/0AA74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750210409; c=relaxed/simple;
	bh=R1jdRpn0qWrazHAgS+e7nAeEjudGEXj1FGnMdw/f3kc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uKXWtb1K1lUH7+t03O1DHH+Z7QF3Rjtuc3Sj6ZSYZhM1Q/koYJqEQgU8jhqKbeVrz69vaIQqtE+I9b8Mhu8xFVqMJLlwapJv8R1FMBNC5spK9OV76n7APe82NhRSky/l2KJ8gPnj43TCeeCM1Ocnt2Uduugd/Sod2fU+uqp/DQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net; spf=pass smtp.mailfrom=fluxnic.net; dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b=h/7FeS3W; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Xums3PEv; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="h/7FeS3W";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Xums3PEv"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id D32F313802A3;
	Tue, 17 Jun 2025 21:33:25 -0400 (EDT)
Received: from phl-frontend-01 ([10.202.2.160])
  by phl-compute-11.internal (MEProxy); Tue, 17 Jun 2025 21:33:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fluxnic.net; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1750210405; x=1750296805; bh=0XuRSI+geY
	2H6RaXEzpvPw1bj5hraiXJ++urQvItPpA=; b=h/7FeS3WE2t2h/5MPB9Qh1Th8S
	r/R1qoxcrM5ip38ogo8nReQZsdZsLv88D/4tnh6fgHeQ+HU34KBvyyYuF9kmyR9c
	2Gm/XS00dSKy6NXnvTSZQV4edwYa4ZDgZfKoMbl5l9p12v3qQnEVHtWxFiRm/Z8o
	6K1RjiAVofLN3P65JyKfi9loUAoIedieazjfwVkHCvFh7BlHeKWENZ4vYsmu5YHd
	w/jQl3srFB+lcD5piX1AB0QbKu/klysUV8bV3yGOlyeip76HmjGOp1FkG3jl3S01
	tze2KMvf9rpRU5z5H3MqqBqI2CwC5ca2uEr6PqjB3aOWItcysjJzH58kvw/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750210405; x=1750296805; bh=0XuRSI+geY2H6RaXEzpvPw1bj5hraiXJ++u
	rQvItPpA=; b=Xums3PEvScpJIyOQ+wlkkepn35bIoof06QpjYZ4kwV4xUjVeKAv
	8x//XUM5PzgSmhWDRaIkuXtgy84axbySXfU5oI2Q0QCM4oIsvPZhCJ/gQtJlF7Jz
	drzMyI8std+cgep+3YoKSo9RGfETeG0GVj1dl0Hqt7FLovBHgFHBlfjlznkjQO+Q
	5opRFdKzYS2uuoEMnILxmiYwGkdT77MUrW0fXynFi3bcaRXIGvSuPdP7ijYYeVWs
	9brttKsc5aunWv2qcK4RjEVeCsCOKn2HnmI7cdo3jS/H02LAS3jO/wibx04D2XFq
	WjYGTokxemyvGi4QLvuu8iK7ZgRj0SQfaPQ==
X-ME-Sender: <xms:ZBdSaPBzRacMolvvSI44cvXHwnFsY5nrnVIOZ9JR0iPmgLiCmnvGcQ>
    <xme:ZBdSaFgZ8ucNtN-BTPtwB3PdB8SxbAvYxSZIccIbzNRGK-LKngH-Nui9VcxSF9Mg-
    NGC0nsqhgexueKEdXk>
X-ME-Received: <xmr:ZBdSaKkyWulu93vkUlEnQ7Q-OGxZWGkwYYO1xDV2podEZOjlJW69WBGSi2u_Vi6kU2ztGceTVhii7Ohr-98Kf0K73ZqMtK6MF7EgsEWvJyADfs2Otw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecu
    hfhrohhmpefpihgtohhlrghsucfrihhtrhgvuceonhhitghosehflhhugihnihgtrdhnvg
    htqeenucggtffrrghtthgvrhhnpefgvedvhfefueejgefggfefhfelffeiieduvdehffdu
    heduffekkefhgeffhfefveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehnihgtohesfhhluhignhhitgdrnhgvthdpnhgspghrtghpthhtohep
    jedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuhdrkhhlvghinhgvqdhkohgvnh
    highessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepsghijhhurdgurghsrdhjiies
    sghprdhrvghnvghsrghsrdgtohhmpdhrtghpthhtohepuggrvhhiugdrlhgrihhghhhtrd
    hlihhnuhigsehgmhgrihhlrdgtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgr
    uggvrggurdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtih
    honhdrohhrghdprhgtphhtthhopeholhgvghesrhgvughhrghtrdgtohhmpdhrtghpthht
    oheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ZBdSaBzUmuvhyUbblOF3mjtxjZYhMNtJDbDVM0tM3LXptXDWAtItmg>
    <xmx:ZBdSaEQ8kXlTYDouvUxkFbKqMpFItTJU3GCpPYMDWqUkss5x5oO61w>
    <xmx:ZBdSaEZdkkYoUhESrxtsn4EgNY7XewsozW0UY8hUorKr8QRVKi1KJA>
    <xmx:ZBdSaFQsRK-QgccFTWyAiUOXICsS8g90T__Ifo50L4WIN9lBxjM51g>
    <xmx:ZRdSaMiwjhuo-LU7fxjC5AlHIZh6PkHo6NBA_N61EXWyGE-o3wgsQVvA>
Feedback-ID: i58514971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jun 2025 21:33:24 -0400 (EDT)
Received: from xanadu (xanadu.lan [192.168.1.120])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 6768211FA037;
	Tue, 17 Jun 2025 21:33:23 -0400 (EDT)
Date: Tue, 17 Jun 2025 21:33:23 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 next 09/10] lib: mul_u64_u64_div_u64() Optimise the
 divide code
In-Reply-To: <os452n92-2p25-2q4r-453r-0ps224s90r98@syhkavp.arg>
Message-ID: <7r88r006-o704-7q1q-21o2-6n62o864oo79@syhkavp.arg>
References: <20250614095346.69130-1-david.laight.linux@gmail.com> <20250614095346.69130-10-david.laight.linux@gmail.com> <os452n92-2p25-2q4r-453r-0ps224s90r98@syhkavp.arg>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 Jun 2025, Nicolas Pitre wrote:

> On Sat, 14 Jun 2025, David Laight wrote:
> 
> > Replace the bit by bit algorithm with one that generates 16 bits
> > per iteration on 32bit architectures and 32 bits on 64bit ones.
> > 
> > On my zen 5 this reduces the time for the tests (using the generic
> > code) from ~3350ns to ~1000ns.
> > 
> > Running the 32bit algorithm on 64bit x86 takes ~1500ns.
> > It'll be slightly slower on a real 32bit system, mostly due
> > to register pressure.
> > 
> > The savings for 32bit x86 are much higher (tested in userspace).
> > The worst case (lots of bits in the quotient) drops from ~900 clocks
> > to ~130 (pretty much independant of the arguments).
> > Other 32bit architectures may see better savings.
> > 
> > It is possibly to optimise for divisors that span less than
> > __LONG_WIDTH__/2 bits. However I suspect they don't happen that often
> > and it doesn't remove any slow cpu divide instructions which dominate
> > the result.
> > 
> > Signed-off-by: David Laight <david.laight.linux@gmail.com>
> 
> Nice work. I had to be fully awake to review this one.
> Some suggestions below.

Here's a patch with my suggestions applied to make it easier to figure 
them out. The added "inline" is necessary to fix compilation on ARM32. 
The "likely()" makes for better assembly and this part is pretty much 
likely anyway. I've explained the rest previously, although this is a 
better implementation.

commit 99ea338401f03efe5dbebe57e62bd7c588409c5c
Author: Nicolas Pitre <nico@fluxnic.net>
Date:   Tue Jun 17 14:42:34 2025 -0400

    fixup! lib: mul_u64_u64_div_u64() Optimise the divide code

diff --git a/lib/math/div64.c b/lib/math/div64.c
index 3c9fe878ce68..740e59a58530 100644
--- a/lib/math/div64.c
+++ b/lib/math/div64.c
@@ -188,7 +188,7 @@ EXPORT_SYMBOL(iter_div_u64_rem);
 
 #if !defined(mul_u64_add_u64_div_u64) || defined(test_mul_u64_add_u64_div_u64)
 
-static u64 mul_add(u32 a, u32 b, u32 c)
+static inline u64 mul_add(u32 a, u32 b, u32 c)
 {
 	return add_u64_u32(mul_u32_u32(a, b), c);
 }
@@ -246,7 +246,7 @@ static inline u32 mul_u64_long_add_u64(u64 *p_lo, u64 a, u32 b, u64 c)
 
 u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
 {
-	unsigned long d_msig, q_digit;
+	unsigned long n_long, d_msig, q_digit;
 	unsigned int reps, d_z_hi;
 	u64 quotient, n_lo, n_hi;
 	u32 overflow;
@@ -271,36 +271,21 @@ u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
 
 	/* Left align the divisor, shifting the dividend to match */
 	d_z_hi = __builtin_clzll(d);
-	if (d_z_hi) {
+	if (likely(d_z_hi)) {
 		d <<= d_z_hi;
 		n_hi = n_hi << d_z_hi | n_lo >> (64 - d_z_hi);
 		n_lo <<= d_z_hi;
 	}
 
-	reps = 64 / BITS_PER_ITER;
-	/* Optimise loop count for small dividends */
-	if (!(u32)(n_hi >> 32)) {
-		reps -= 32 / BITS_PER_ITER;
-		n_hi = n_hi << 32 | n_lo >> 32;
-		n_lo <<= 32;
-	}
-#if BITS_PER_ITER == 16
-	if (!(u32)(n_hi >> 48)) {
-		reps--;
-		n_hi = add_u64_u32(n_hi << 16, n_lo >> 48);
-		n_lo <<= 16;
-	}
-#endif
-
 	/* Invert the dividend so we can use add instead of subtract. */
 	n_lo = ~n_lo;
 	n_hi = ~n_hi;
 
 	/*
-	 * Get the most significant BITS_PER_ITER bits of the divisor.
+	 * Get the rounded-up most significant BITS_PER_ITER bits of the divisor.
 	 * This is used to get a low 'guestimate' of the quotient digit.
 	 */
-	d_msig = (d >> (64 - BITS_PER_ITER)) + 1;
+	d_msig = (d >> (64 - BITS_PER_ITER)) + !!(d << BITS_PER_ITER);
 
 	/*
 	 * Now do a 'long division' with BITS_PER_ITER bit 'digits'.
@@ -308,12 +293,17 @@ u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
 	 * The worst case is dividing ~0 by 0x8000 which requires two subtracts.
 	 */
 	quotient = 0;
-	while (reps--) {
-		q_digit = (unsigned long)(~n_hi >> (64 - 2 * BITS_PER_ITER)) / d_msig;
+	for (reps = 64 / BITS_PER_ITER; reps; reps--) {
+		quotient <<= BITS_PER_ITER;
+		n_long = ~n_hi >> (64 - 2 * BITS_PER_ITER);
 		/* Shift 'n' left to align with the product q_digit * d */
 		overflow = n_hi >> (64 - BITS_PER_ITER);
 		n_hi = add_u64_u32(n_hi << BITS_PER_ITER, n_lo >> (64 - BITS_PER_ITER));
 		n_lo <<= BITS_PER_ITER;
+		/* cut it short if q_digit would be 0 */
+		if (n_long < d_msig)
+			continue;
+		q_digit = n_long / d_msig;
 		/* Add product to negated divisor */
 		overflow += mul_u64_long_add_u64(&n_hi, d, q_digit, n_hi);
 		/* Adjust for the q_digit 'guestimate' being low */
@@ -322,7 +312,7 @@ u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
 			n_hi += d;
 			overflow += n_hi < d;
 		}
-		quotient = add_u64_long(quotient << BITS_PER_ITER, q_digit);
+		quotient = add_u64_long(quotient, q_digit);
 	}
 
 	/*
