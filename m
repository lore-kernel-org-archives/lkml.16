Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F79243378
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751289735; cv=none; b=KM51gSGIXj1dLEbQci5tsf0eTM1fc0AERivf9QMsvUanA5vQj0DjdNlt9o73iu3TxeuCiWard+8aKuGUSqBlmlnNL17OtHzK03QLTYYlMJVC/kQQtGHQCnYK6s3Yy1NiE4c3dadGW+++dxey/qdLGgfnC2NFnUNbGr+6hmFRoIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751289735; c=relaxed/simple;
	bh=Jr7+w4HbugE03E3Lx8VkbvxjMdVWpxs7OMe1tCng0ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rpz6foKkveRbDP66m/gs9gwT1gdpumH98QgeL7caCDKj/rsj2CF12M9ly9eDN1Sc/EEQ7aamVXzYGV2Xh/6wnDnQfT3iIihcZEP4sEKKVS3sczW2msi1TFe07C57egX0rKlByQnlXvVh3P3zLthgAo6A4dQJUSJt8+LDAzIXCz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JGoRXNy4; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JGoRXNy4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ggmhFGoUHM2tT0xKDJXNPqjYExBy9UkalZiiW/8jWso=; b=JGoRXNy4QbhwvWd2UEMNc+MY9X
	EgDKeCYSdexrAjqZz1lkEiv3WcYpgrJvYP9LrH3RCv1jc4dPwfBl9ekLGM9OpySHfGH1VvJ/J2VA+
	GnErelAUW5uwHjSXTFTcLqdkzlf/m1fb13RfD8PVJUKONjRvTO1frEB+BlNYnK5SNEOdN/Gt+NAxo
	CYrCJs9Mq62byLDze/jCkQQ7NWW7kAmlBI+witIWBLI0OT5hjBilUbfUB8urv8pcHtxFsXiskVE4U
	EAVL9+T5GP6TX0WWpkuLx4JGQqGbn9UqBS79K1uzPdIhh2MbswGWEzhIVR/oAW3i8xcCLYTYCA8Ot
	uNKE+Kdw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWESZ-00000006mNu-0zTm;
	Mon, 30 Jun 2025 13:22:11 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C647F300125; Mon, 30 Jun 2025 15:22:10 +0200 (CEST)
Date: Mon, 30 Jun 2025 15:22:10 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] objtool: Add missing endian conversion to read_annotate()
Message-ID: <20250630132210.GL1613376@noisy.programming.kicks-ass.net>
References: <20250630131230.4130185-1-hca@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630131230.4130185-1-hca@linux.ibm.com>

On Mon, Jun 30, 2025 at 03:12:30PM +0200, Heiko Carstens wrote:
> Trying to compile an x86 kernel on big endian results in this error:
> 
> net/ipv4/netfilter/iptable_nat.o: warning: objtool: iptable_nat_table_init+0x150: Unknown annotation type: 50331648
> make[5]: *** [scripts/Makefile.build:287: net/ipv4/netfilter/iptable_nat.o] Error 255
> 
> Reason is a missing endian conversion in read_annotate().
> Add the missing conversion to fix this.
> 
> Fixes: 2116b349e29a ("objtool: Generic annotation infrastructure")
> Signed-off-by: Heiko Carstens <hca@linux.ibm.com>

Thanks!
