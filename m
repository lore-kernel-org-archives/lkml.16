Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD75272607;
	Mon, 26 May 2025 19:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748288128; cv=none; b=siDXsFoJFwn2WERFVs8QenSx/3YvQdDe4EIB0g/xXn6fFyV4udK8JYZItWVl0ZWtFe+qyIMyByj38kPg0KCPnRfeiwhCSeDrDTIml5vMJOkHP2J4cAxsNfKc5F7BAgcFkxAxXHBjErUP1r0z3cDZ/pSBwjtjlhdLrj6L8ogVJso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748288128; c=relaxed/simple;
	bh=e9kXzJCLhxxaB/nMDARoSmQTHAobzT6klqKO2qsIq7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HKN43yyomr7xazP7Cj0TC875Ssfsr9ooO+QYBEjDj6Tb685TxxwEUjycwgW69SyrteI4nujDy7GLGSlROoD29WvBfl8b4dPRrfZ3XTFoheOOdfJYOfE2DuSAhNUgxJsQ4vMykKufdrZaQnH+6xnCOiJ0vFFgMKIeNh+BvgWv3kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pw8S+dr2; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pw8S+dr2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0k1xbCJ1xlanu6mhuuA1e5sIZnwYvon7/wqI3P7ZK2U=; b=pw8S+dr2PFAtq6iMgMGlOu9ugN
	z9qsyTklUE8b5yUXNTBJnxUf0Anb2V87VDCed7Y2X0mpbK2nt5lJcFS389rbSbXktgWsQZBv+AfAB
	SsM/xBndlesY2bssi1CrDraPpeZV0J4F+hDtluY9AU5oxccz4Ej+LMfYxjUdwVNjCkNzoTicQQTFH
	AfH+ibBms/iVWAFxajiFALwshqmvvLqKgVA/oDwWztJsqW89D3N6/vTtT3gOa90wJMqV46rvqXcQz
	KyqOmQOa2hTrwx5Vyby0t4tt7POchAf2FjgdwP9VPq7AWM6wvYmjIARYMRshP/9rUVWxXbOCSm07M
	ZOGkPX5Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJdbR-0000000Bj9o-1O0P;
	Mon, 26 May 2025 19:35:17 +0000
Date: Mon, 26 May 2025 20:35:17 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	shuah@kernel.org, corbet@lwn.net, masahiroy@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: escape literal asterisk to fix reST emphasis
 warning
Message-ID: <aDTCdQNUN4Zlw2jJ@casper.infradead.org>
References: <20250526184401.33417-1-khaledelnaggarlinux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526184401.33417-1-khaledelnaggarlinux@gmail.com>

On Mon, May 26, 2025 at 09:43:59PM +0300, Khaled Elnaggar wrote:
> Escaped a literal '*' character in symbol-namespaces.rst to prevent
> a Docutils warning about unmatched emphasis markers during documentation build.

I don't think this is the right way to fix this problem.  We want
the test to work in both rendered and un-rendered form.  I think
we can do something like:

-For example:
+For example::

to turn it into a block that is rendered literally.  See

                For example::

                  echo $((100 * `cat active_duration` / `cat connected_duration`))

as an example in Documentation/ABI/stable/sysfs-bus-usb

>  For example:
> 
> -  EXPORT_SYMBOL_GPL_FOR_MODULES(preempt_notifier_inc, "kvm,kvm-*")
> +  EXPORT_SYMBOL_GPL_FOR_MODULES(preempt_notifier_inc, "kvm,kvm-\*")
> 
>  will limit usage of this symbol to modules whoes name matches the given
>  patterns.
> --
> 2.47.2
> 
> 
