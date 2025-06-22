Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A671BA34;
	Sun, 22 Jun 2025 11:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750593167; cv=none; b=CwUL2rIH2hBmkfy5Zf6cNNTgOJyFkQWqeX6vhNX63WLgNpY6+rg9HRxVVcI5aPbd/m8PCwFT/QFiMe+rnFGOY9AXfUWOvaPYrsg274VVjK64ubELCr7f9vrzMfqjDPECGAQk3LzTn3frupb4bL5Lz1nMhaAcs5e15JDc2KL29EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750593167; c=relaxed/simple;
	bh=Cn5ciQMdeMhPqGNIUDQZDVhBez/60Fh/UIsHKt1OSh0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nnhlIoQWS7En6xxpiaqIeQrLQVnM9iSjWmVH5bM5J+wClnNt0kC1boA6xjsHlIekaOqtA0j5gVSA8uXfvHBkuq+m4ErL/5SUSCzy8L1vi6NIHgRAfbIjMt/rIssxO200SO/lJ7eFqxvcHy6h2uW1iXyqoDX8p3PXeYVaBdTKZvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dmw+ZjxL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dmw+ZjxL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC18C4CEE3;
	Sun, 22 Jun 2025 11:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750593167;
	bh=Cn5ciQMdeMhPqGNIUDQZDVhBez/60Fh/UIsHKt1OSh0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dmw+ZjxLnn1iGCUamBPTW8YJn922RjehOaU4rXZuEkqomj3rBLTPL4ADMXeB2MiAD
	 abJ7GGKZHRxmAxyPwEfHsJRWaSezMwM9CTjHvx21doPy1GxlgqkqorPhAnR7Z9PDYz
	 QqNKtAz1NEqkyZmzuL0m/4ZUt2ciI5uvjVFDW9rz2q9Tv6rU8fegir73ntKJYhE2rI
	 9u1ha1AKfkeerXSjGTPPmSEmUgE7vDOMbRfewgmxrtFvSkRnLplwyO9MNoKGtW2ObC
	 T1ol5kcLvUqOYoss4+0PQc3NT8QUel6K9ttoOZ34rvYceWlcleV9XxXxUZHXq97fXK
	 JO7lJOSKjfPYw==
Date: Sun, 22 Jun 2025 13:52:43 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH 7/9] docs: kdoc: coalesce the end-of-comment processing
Message-ID: <20250622135243.6d9e64d3@foz.lan>
In-Reply-To: <20250621203512.223189-8-corbet@lwn.net>
References: <20250621203512.223189-1-corbet@lwn.net>
	<20250621203512.223189-8-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 21 Jun 2025 14:35:10 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Separate out the end-of-comment logic into its own helper and remove the
> duplicated code introduced earlier.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  scripts/lib/kdoc/kdoc_parser.py | 36 +++++++++++++--------------------
>  1 file changed, 14 insertions(+), 22 deletions(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index 5998b02ca3a0..f7a5b85a8ed7 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -1351,13 +1351,10 @@ class KernelDoc:
>              return True
>          return False
>  
> -    def process_decl(self, ln, line):
> -        """
> -        STATE_DECLARATION: We've seen the beginning of a declaration
> -        """
> -        if self.is_new_section(ln, line):
> -            return
> -
> +    #
> +    # Helper function to detect (and effect) the end of a kerneldoc comment.
> +    #
> +    def is_comment_end(self, ln, line):
>          if doc_end.search(line):
>              self.dump_section()
>  
> @@ -1370,6 +1367,15 @@ class KernelDoc:
>              self.entry.new_start_line = ln + 1
>  
>              self.state = state.PROTO
> +            return True
> +        return False
> +
> +
> +    def process_decl(self, ln, line):
> +        """
> +        STATE_DECLARATION: We've seen the beginning of a declaration
> +        """
> +        if self.is_new_section(ln, line) or self.is_comment_end(ln, line):
>              return
>  
>          if doc_content.search(line):
> @@ -1406,21 +1412,7 @@ class KernelDoc:
>          """
>          STATE_BODY: the bulk of a kerneldoc comment.
>          """
> -        if self.is_new_section(ln, line):
> -            return
> -
> -        if doc_end.search(line):
> -            self.dump_section()
> -
> -            # Look for doc_com + <text> + doc_end:
> -            r = KernRe(r'\s*\*\s*[a-zA-Z_0-9:\.]+\*/')
> -            if r.match(line):
> -                self.emit_msg(ln, f"suspicious ending line: {line}")
> -
> -            self.entry.prototype = ""
> -            self.entry.new_start_line = ln + 1
> -
> -            self.state = state.PROTO
> +        if self.is_new_section(ln, line) or self.is_comment_end(ln, line):
>              return
>  
>          if doc_content.search(line):



Thanks,
Mauro
