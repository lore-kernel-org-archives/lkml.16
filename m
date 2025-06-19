Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B718D2475F7;
	Thu, 19 Jun 2025 07:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750317169; cv=none; b=MYp8U+zBq+PV4zPTf/HSnXYJueRc52GdicNIggMyqMGCryeuZAzm0Wdr7KVj9lKguNE3p9SpgCr32j/syzFg8uzG5bVG95XdFSjmnRYNaFIHK5/dwgskdechd30vWojg32WX9++3gVKAq4CJ/t3e4iFXCALaiD4H728rNkD2zAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750317169; c=relaxed/simple;
	bh=l3qlc40PN+JkLbZgh1BtdXkaI7iJLWml0rgWSurp/ak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y6b95OtY3RZ6r/Ed+0qxL5Yii0eLiEYnleIMxDXXnU4lrtTIV8mvpH5QwqYrlXwMtOvkiht6iEFlrQour0/8i3Ws6IDlffEm3wPPf/a7e2oXGNAytOqxptC8J6hrkCmFrPQa21f6VC55Sf1dOq7YpEeGWFo4rbyI3D4Je7Z6LOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Wx5k9B0l; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Wx5k9B0l"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=R7tGyFiM7WSeVH4C/w6xl3Lu9ITt8cyLFMs5e/oyiFg=; b=Wx5k9B0lMNkIdYL64vBUzPThua
	aSU94dIXOmmKvkqQHEANa++whmR89vAWo8RM9Z0vv7SA0C2s/BiOfeb5pCmNyd8bzOXxdyfBocNd1
	UIxpA8jvlMdolNZa2EbNoZEa4A93pdOFOkT24WjG9S0ttYYdJkI91kfr2+ZvG13Qmqx93KvzkB1Ic
	FMfMfvVcJXvX1b2OUf+QfqT9PN3tckfYHwWyNBrd65OmPOX3974PtIe4saun4DsK5SCfHMKqEGivz
	tkCJRIRt3dsqp6QVrK3k/69xyDOyDdxBZq3eVHG5Ri8e9H0LBt6qLzLhmDoZls28Qg+Y1YidWEZon
	mqL84uVQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9Ry-00000007be1-3yJg;
	Thu, 19 Jun 2025 07:12:43 +0000
Message-ID: <1067bbff-be53-4bec-9cec-8a4d0f531fb7@infradead.org>
Date: Thu, 19 Jun 2025 00:12:38 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] Documentation: typography refresh
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>,
 Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik
 <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stanislav Fomichev <sdf@google.com>, David Vernet <void@manifault.com>,
 Miguel Ojeda <ojeda@kernel.org>, James Seo <james@equiv.tech>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20250619042318.17325-2-bagasdotme@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250619042318.17325-2-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bagas,

On 6/18/25 9:23 PM, Bagas Sanjaya wrote:
> At present, kernel documentation uses system serif font for body text.
> Some people, however, objected to it and instead prefer that the
> typography choice must be legible, consistent, and accessible (after
> all, the audience ranges developers peeking into kernel internals to
> ordinary users that skimmed through Documentation/admin-guide/).
> 
> To tackle the problem, follow Wikimedia's typography refresh [1].
> For the font choices, instead of using web fonts as in previous
> attempt [2], use:
> 
>   * Linux Libertine, Georgia, Times for serif (used in h1 and h2
>     headings)
>   * system font for sans-serif and monospace
> 
> This allows for more readability and consistency without sacrificing

More readability is debatable IMO.

> page load times and bandwidth, as the font choices is most likely
> already available on many platforms.
> 
> The reason why serif fonts is used for headings in complement to sans
> serif in text body is to break up visual monotony of docs page by
> creating contrast between headings (as entry point to docs information)
> and text body, which is important considering that kernel docs are
> quite lengthy with many sections.

It's interesting that mediawiki chose to split the serif and sans serif
usage this way. Newspapers essentially do the opposite: use sans serif
for headlines (mostly, not consistently) and use serif for body text.


Have you read "The Psychology of Computer Programming"?
[https://geraldmweinberg.com/Site/Programming_Psychology.html]
The content is very good but (at least in early editions) it was printed
completely using a sans serif font (probably Helvetica). It's not a
long book and I found the subject very interesting, but it took me
forever to read it because it's (or was, don't know about the later
editions) in sans serif typeface. I hated that part of it.

So I applied this patch and tested it. It works as far as I can tell.
I got tons of sans serif font text instead of serif font text that I
don't care for. (I don't mind that the sidebar text is sans serif.)



> For body text (excluding sidebar), it is set to #252525 on top
> of #FFFFFF background as they have contrast ratio 15.3:1, which
> is rated as AAA according to WCAG 2.0 section 1.4.6. Having slightly
> off-black foreground text on white background can reduce eye strain
> and juxtaposition on dyslexic readers.
> 
> This refresh only applies to default Alabaster theme.
> 
> [1]: https://www.mediawiki.org/wiki/Typography_refresh
> [2]: https://lore.kernel.org/linux-doc/20231102123225.32768-1-bagasdotme@gmail.com/
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/conf.py                      |  5 +-
>  Documentation/sphinx-static/typography.css | 62 ++++++++++++++++++++++
>  2 files changed, 66 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/sphinx-static/typography.css
> 

Thanks.

-- 
~Randy

