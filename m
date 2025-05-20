Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EB82594BD;
	Tue, 20 May 2025 17:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747763313; cv=pass; b=qO14d5d5vkwRcmvydPbeyy184nbZq1q1x5F9rZ/l9WxsxrTw/XMUbRglNRweeyBtgaRup+dZKzUFcp3sg5JgWxVHqk/MEGZaNLxIcCmN7I36O6TJzuWXwBlHgsYvsPtnDz3fGKbm0aSpSKfE7xaGbQUF3uPCcAv+k2e8sTNRyMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747763313; c=relaxed/simple;
	bh=zCk7W8VjEUt8lGIxIqXK+msIDO5l3WUoooYkUWFdoIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D0awi/1XpHI7rViKYb3eMPCBPbafLSUC83rYqOh1fw8KBQfPAPduiElaRdFD5HRJZ6MjY5ggcGCVzhMPK4v+WeIQOgMx17yl1P8ZaJxLnw9p2eQj/xuzWiupm9g0j3gRBlQBrmEL3Tb2mas2W2+XAoBLfNUWBg5SY4XtqIu0yUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=bqBCysV9; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="bqBCysV9"
ARC-Seal: i=1; a=rsa-sha256; t=1747763298; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Kk01EscMQ0sAmwGqvTOuzL+2s62g6lxXmZ1t9JOxgmvft1x7mOzfTRX/vru6HKro6o+YSb72qF3pyDteHe+M4W7kI3A+xB/x5RtrOhdT/tvcg2hGzygWOhzvbTVlgN6cq+PhUu0P/Y6jgcFbJJXH+q61RDrRamfUmBvoz+Jss+k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747763298; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Aaa1WpGBzo+uzWa0N4GaSWNysSqMsKWT7tlAGfk929c=; 
	b=k1dbbG3YQQLTSnxB6prUYLeOPzXXUiS2d/FOf8jFYQ/F7EFA8Nfj0ZRM78AIxWc8MT5t28rDmnslUml+XqHd2jy74UBbclmA9c2K7/BgwTHZhVGZ8ORfMiKE3uhV4COqUDBxCILfbLbp6DMKqAtnkNMZnJlM8vJMXLlRQMzxW2I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747763298;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=Aaa1WpGBzo+uzWa0N4GaSWNysSqMsKWT7tlAGfk929c=;
	b=bqBCysV9fMDVEzkI7DzI6tLqT6Wj1eHf66PwHMUTBFi7+W+JV42SBLPx7mP0tp5O
	e1jE68TdyQ4QKj8OTJPeBcLpJUG64KWdjCxRwJZCJShEacJZFP4OMRCsDQ+DpQuDxCC
	WOjS35+PxGeQJxwDO8B44/oOJ0lnRRe18rhw6pgU=
Received: by mx.zohomail.com with SMTPS id 174776329703669.79078572187052;
	Tue, 20 May 2025 10:48:17 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>
Cc: kernel@collabora.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] docs: Document how to use the recommended docs theme
Date: Tue, 20 May 2025 19:48:13 +0200
Message-ID: <3068468.mvXUDI8C0e@workhorse>
In-Reply-To: <02a91f3a-c83b-4c1a-a07f-cdd0b82cc199@infradead.org>
References:
 <20250520-linked-list-docs-v1-0-db74f7449785@collabora.com>
 <20250520-linked-list-docs-v1-1-db74f7449785@collabora.com>
 <02a91f3a-c83b-4c1a-a07f-cdd0b82cc199@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hello,

On Tuesday, 20 May 2025 18:14:19 Central European Summer Time Randy Dunlap wrote:
> Hi,
> 
> On 5/20/25 8:57 AM, Nicolas Frattaroli wrote:
> > The current documentation on writing documentation documents that the
> > RTD theme should be used. It goes on to explain how to install it
> > through pip, but fails to mention how to use it. While the DOCS_THEME
> > Makeflag is mentioned later on, it's not clear that the pypi package
> > name of the RTD theme happens to also be the theme's name.
> > 
> > With web search engines approaching a critical mass of uselessness this
> > decade, let's explicitly mention how to make use of the recommended
> > theme, in order to save people some effort.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  Documentation/doc-guide/sphinx.rst | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/doc-guide/sphinx.rst b/Documentation/doc-guide/sphinx.rst
> > index 8081ebfe48bc045ff4e86001d3eba884b338bf32..029c350dc12803b53d0c3193acc0cdc5a6777de6 100644
> > --- a/Documentation/doc-guide/sphinx.rst
> > +++ b/Documentation/doc-guide/sphinx.rst
> > @@ -46,7 +46,8 @@ or ``virtualenv``, depending on how your distribution packaged Python 3.
> >  
> >     #) It is recommended to use the RTD theme for html output. Depending
> >        on the Sphinx version, it should be installed separately,
> > -      with ``pip install sphinx_rtd_theme``.
> > +      with ``pip install sphinx_rtd_theme``. You can then pass
> > +      ``DOCS_THEME=sphinx_rtd_theme`` in your Makeflags to use it.
> 
> In https://lore.kernel.org/linux-doc/20250519223613.37277-1-rdunlap@infradead.org/
> (just posted yesterday, not merged anywhere), I moved that "note" to just after the
> mention of the DOCS_THEME environment variable.
> Maybe that will be sufficient?

Yes, that would absolutely be sufficient. I wasn't aware the RTD theme wasn't
the one to go for anymore. Feel free to drop this patch when merging.

> 
> Thanks.
> 

Cheers,
Nicolas Frattaroli

> >  
> >  In summary, if you want to install the latest version of Sphinx, you
> >  should do::
> > 
> 
> 




