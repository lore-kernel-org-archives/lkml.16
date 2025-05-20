Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CC12B9A9;
	Tue, 20 May 2025 16:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747757669; cv=none; b=cjzW4NrHdbMU2jzXeHOEcdZ1fUijLR7UZZdLzr07AcfFMZh9VsIJQvYNfWtnZsRnbYIFsLQpLkuXr4xYQRzmDf63QV6zk2eHtF9W+jfmw1Ar5Q97ywZkFF5cKOFqae7+TrzYYmLvgxs1jS4q27Qhm46FUli0ZNtVmjUP7S62FbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747757669; c=relaxed/simple;
	bh=G4OeVJaHWU8e9AWKs/6MjTOJ3y5+xYpJpR4n2h0gX24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qgyYS/j3YwnVSVGo312Y89xaEGhLQz5gj6vCWLtzwcxRg2EKig8mlN4YtAtwmypUFbQMp2Lpa7aGKKM0qVzPWObXCjXkinoYgWCpcfs9yZdk1yWya1J8JkYlDNYpJO1+6SdHsHjZ1rb+wWqjAeII+rS/fHUhReAk0oeo9pExAOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=K5b80v9n; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="K5b80v9n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Q9Yskx1+F2KC9BIkcgUc8G1d29WKT7KCX/R5Joz+egE=; b=K5b80v9nmtE4obNQgfJts2PcOu
	pZZ9kQXyj2XP+iW1aRq3dUf9Om4kZXpFKiEAljea/G78RhauNEjyxpVwceAlcJP3sXP6A5PbIeL5r
	9irq8InYGzG6/0Z7Np8lCIOevDkHfQlWKe5ld+fBnzaRHx7PhmwkVc679piFG6+xmlLTEXWDe/09+
	rifqc+CfG7NJBZnTECCEwRUwX747fLCw5m5HBDl5I2L8C3pZdQ0nv3CiwDx+X9FsZ5Eio2Nr5OD8O
	8kWUjJUgxXQLAvrGzU8DdKK0k0LPu8cP966M/Uuy4VK5gb+CU0EcX4Vq5KJqJZEhUszWxyRhtMaZl
	8yB2YrSA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uHPbh-00000000nJ9-2EyZ;
	Tue, 20 May 2025 16:14:21 +0000
Message-ID: <02a91f3a-c83b-4c1a-a07f-cdd0b82cc199@infradead.org>
Date: Tue, 20 May 2025 09:14:19 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] docs: Document how to use the recommended docs theme
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250520-linked-list-docs-v1-0-db74f7449785@collabora.com>
 <20250520-linked-list-docs-v1-1-db74f7449785@collabora.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250520-linked-list-docs-v1-1-db74f7449785@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/20/25 8:57 AM, Nicolas Frattaroli wrote:
> The current documentation on writing documentation documents that the
> RTD theme should be used. It goes on to explain how to install it
> through pip, but fails to mention how to use it. While the DOCS_THEME
> Makeflag is mentioned later on, it's not clear that the pypi package
> name of the RTD theme happens to also be the theme's name.
> 
> With web search engines approaching a critical mass of uselessness this
> decade, let's explicitly mention how to make use of the recommended
> theme, in order to save people some effort.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  Documentation/doc-guide/sphinx.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/doc-guide/sphinx.rst b/Documentation/doc-guide/sphinx.rst
> index 8081ebfe48bc045ff4e86001d3eba884b338bf32..029c350dc12803b53d0c3193acc0cdc5a6777de6 100644
> --- a/Documentation/doc-guide/sphinx.rst
> +++ b/Documentation/doc-guide/sphinx.rst
> @@ -46,7 +46,8 @@ or ``virtualenv``, depending on how your distribution packaged Python 3.
>  
>     #) It is recommended to use the RTD theme for html output. Depending
>        on the Sphinx version, it should be installed separately,
> -      with ``pip install sphinx_rtd_theme``.
> +      with ``pip install sphinx_rtd_theme``. You can then pass
> +      ``DOCS_THEME=sphinx_rtd_theme`` in your Makeflags to use it.

In https://lore.kernel.org/linux-doc/20250519223613.37277-1-rdunlap@infradead.org/
(just posted yesterday, not merged anywhere), I moved that "note" to just after the
mention of the DOCS_THEME environment variable.
Maybe that will be sufficient?

Thanks.

>  
>  In summary, if you want to install the latest version of Sphinx, you
>  should do::
> 

-- 
~Randy

