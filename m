Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30CF1DE4E3;
	Sun, 22 Jun 2025 12:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750594407; cv=none; b=bp8Gl2aDd+UTVvz/SYSgQZ7p/3iS4W/H8TeaDh9E9KLQmfkSIZQYzkFr5mYlTSZIgGiQL5E3M/XzA7SFmFnjrWeVFKFNjQ3HyDggfsrEx/BpFYjMexa0059ClxjHCjsi6tmgpaUO7tzrGInw+4Jt+RseN3hC7LQnbPi3WG9Dk4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750594407; c=relaxed/simple;
	bh=P9DyqpH3WjbrPFVDdJCcU1NRpdBVUBWYSl4bYGLYPUY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S0IOKntXcKVjARBduA6leo9o4G8dRjlE6fUXxLbHKdpT/3gaScXGKDNM4+iqQfyxP8Apv6di6zcwHoswAneYIL9falMPcd+rgRAjAi92U9Dwt8g6UpnvZaNr5thULbKA+cxBBIkOYU9AdW48peCJ7D0SuB5N8MsueeltjJQ22XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pvPG5Jwe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pvPG5Jwe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFC41C4CEE3;
	Sun, 22 Jun 2025 12:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750594406;
	bh=P9DyqpH3WjbrPFVDdJCcU1NRpdBVUBWYSl4bYGLYPUY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pvPG5JwewF3CQsTU4kZ8QF7btO8Q/9s/vZePhrmQpvlscWnoE3YI/cYZ8KsvdF/eT
	 vUQShfUmBEBTySqODtW9u5QM0dRAgh2D7NJcTpVS4o+9/Ntm6WGKAPHopThxXxZzdT
	 FIphEatiqVq2jma8GvuMOcJZGXSAt38GeSmvggFlVmAZKLV3XT7VElbcyffW7ok/yq
	 VTsEe1SKGwwPxo0Vo8OIhCnoclI82E/HJhJ0bqgNQgaSZxQA34VitMva4io6DiWHTG
	 A/T9qTMVumV4z41ZQzeUgZdmoLBQJn8FLYaivMMxmXxk+G99TB7A+LLQOQjRL5mUJN
	 QYXdYsjccwn0A==
Date: Sun, 22 Jun 2025 14:13:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux
 Documentation <linux-doc@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Federico Vaga
 <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, Carlos
 Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Dongliang
 Mu <dzm91@hust.edu.cn>, Thomas Gleixner <tglx@linutronix.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Stanislav Fomichev
 <sdf@google.com>, David Vernet <void@manifault.com>, Miguel Ojeda
 <ojeda@kernel.org>, James Seo <james@equiv.tech>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH RFC] Documentation: typography refresh
Message-ID: <20250622141311.389abf16@foz.lan>
In-Reply-To: <20250619042318.17325-2-bagasdotme@gmail.com>
References: <20250619042318.17325-2-bagasdotme@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 19 Jun 2025 11:23:19 +0700
Bagas Sanjaya <bagasdotme@gmail.com> escreveu:

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
> page load times and bandwidth, as the font choices is most likely
> already available on many platforms.
> 
> The reason why serif fonts is used for headings in complement to sans
> serif in text body is to break up visual monotony of docs page by
> creating contrast between headings (as entry point to docs information)
> and text body, which is important considering that kernel docs are
> quite lengthy with many sections.
> 
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
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 12de52a2b17e78..f5713cd70cc17c 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -310,9 +310,12 @@ if  html_theme == 'alabaster':
>          'sidebar_width': '15em',
>          'fixed_sidebar': 'true',
>          'font_size': 'inherit',
> -        'font_family': 'serif',
>      }
>  
> +    html_css_files  = [
> +        'typography.css',
> +    ]
> +
>  sys.stderr.write("Using %s theme\n" % html_theme)

I liked this part: having fonts inside a css. However the code is broken,
as there are already several parts of conf.py which alrease sets
html_css_files on different ways, depending on two make vars. From
make help:

	make DOCS_THEME={sphinx-theme} selects a different Sphinx theme.
	make DOCS_CSS={a .css file} adds a DOCS_CSS override file for html/epub output.

The code on conf.py in question is:

	if html_theme in ["sphinx_rtd_theme", "sphinx_rtd_dark_mode"]:
		...
	        html_css_files = [
	            "theme_overrides.css",
	        ]
		...
		if html_theme == "sphinx_rtd_theme":
	            # Add color-specific RTD normal mode
            html_css_files.append("theme_rtd_colors.css")
	...
	if "DOCS_CSS" in os.environ:
	    css = os.environ["DOCS_CSS"].split(" ")

	    for l in css:
	        html_css_files.append(l)

You can't just replace html_css_files without considering the above,
specially since one could be doing DOCS_CSS="some_other_typography.css".

IMO, the code should be instead:

	if html_theme == "alabaster":
	    if not html_css_files:
	        html_css_files  = [ "typography.css" ]

E.g. only use it if:
- the theme is the default one;
- the Kernel docs will be built without DOCS_CSS.

Thanks,
Mauro
