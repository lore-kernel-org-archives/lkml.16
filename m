Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C61317BA9;
	Sat,  7 Jun 2025 10:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749291197; cv=none; b=BssfL4GOMjZYov7dJQYSZ6DbKKjIBCY+R3T1Xrek0CvTAapZvyu4DybCV0yATJZDZsWkeFq79T5SArPs/yPn2zKJTvHsLfQv+8i3/ZzORl48GDbX/Mv7nZJQukxoAuacMiWk8FMAH7qeHN/ihRThtqvA363IuA9PiE9irS88o2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749291197; c=relaxed/simple;
	bh=tQ0PPfxfsC6VJq8L61IYitT0si7iO7YI036iLWsgbl0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uHMnMf3ak22gX6B/dqyUOzLFP+0HHNmoGr70pL/i50Wp8aOPv6C8vTZwK9uvO67OIBJwqq2a8nYqdA4G35qwDf3ZmIziuVuXiAcLVqk5S+0C+o/2qRggDZJ3Nj5bJZa45d9EzWNrPnj7XpsPKXl6Vt6JSV99dV8umdMq3kSfSi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pa7/j0dd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pa7/j0dd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30BF2C4CEE4;
	Sat,  7 Jun 2025 10:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749291197;
	bh=tQ0PPfxfsC6VJq8L61IYitT0si7iO7YI036iLWsgbl0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Pa7/j0dd6i3AKzS09zlu+cv/jxJ8nnydTdnBEox2JBdCCE9e9/lc9xNRnOq257GNT
	 pdeU/2FfcItX3ZmOM04lh7eyaghkKUZjaJLPmdlh8f+bjiE4LvKLc8Pi0KYY3z6iGm
	 QxGGZjyr3N8MysuPqjjo8WJzA25B3Gcsf10c1yTsdZm7IFxCTM3hGhETXjU7xIyVQJ
	 oj5Pqy29jBJA4zZam+jyv+DTd5xM32zsh/FYPmnPis1yLkE1Yfgeh7oDdWtU5z3aU5
	 trFb+5KrX8n/GhFelzXsLfkE2SxjnrcCGIfB9q8YDJiOwQMURcIqfjXzqAvTbXzjpb
	 bFGjHn5EDrDGw==
Date: Sat, 7 Jun 2025 12:13:13 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 9/9] docs: kdoc: some final touches for process_name()
Message-ID: <20250607121313.0edc0a3d@foz.lan>
In-Reply-To: <20250606163438.229916-10-corbet@lwn.net>
References: <20250606163438.229916-1-corbet@lwn.net>
	<20250606163438.229916-10-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri,  6 Jun 2025 10:34:38 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Add some comments to process_name() to cover its broad phases of operation,
> and slightly restructure the if/then/else structure to remove some early
> returns.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

More comments describing the parse steps are always welcomed!

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  scripts/lib/kdoc/kdoc_parser.py | 33 ++++++++++++++++++++-------------
>  1 file changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index 55f38240d4e5..9a1ce6ed8605 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -1219,7 +1219,9 @@ class KernelDoc:
>          """
>          STATE_NAME: Looking for the "name - description" line
>          """
> -
> +        #
> +        # Check for a DOC: block and handle them specially.
> +        #
>          if doc_block.search(line):
>              self.entry.new_start_line = ln
>  
> @@ -1230,9 +1232,10 @@ class KernelDoc:
>  
>              self.entry.identifier = self.entry.section
>              self.state = state.DOCBLOCK
> -            return
> -
> -        if doc_decl.search(line):
> +        #
> +        # Otherwise we're looking for a normal kerneldoc declaration line.
> +        #
> +        elif doc_decl.search(line):
>              self.entry.identifier = doc_decl.group(1)
>  
>              # Test for data declaration
> @@ -1253,15 +1256,19 @@ class KernelDoc:
>                                f"This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst\n{line}")
>                  self.state = state.NORMAL
>                  return
> -
> -            self.entry.identifier = self.entry.identifier.strip(" ")
> -
> +            #
> +            # OK, set up for a new kerneldoc entry.
> +            #
>              self.state = state.BODY
> -
> +            self.entry.identifier = self.entry.identifier.strip(" ")
>              # if there's no @param blocks need to set up default section here
>              self.entry.section = SECTION_DEFAULT
>              self.entry.new_start_line = ln + 1
> -
> +            #
> +            # Find the description portion, which *should* be there but
> +            # isn't always.
> +            # (We should be able to capture this from the previous parsing - someday)
> +            #
>              r = KernRe("[-:](.*)")
>              if r.search(line):
>                  self.entry.declaration_purpose = trim_whitespace(r.group(1))
> @@ -1282,11 +1289,11 @@ class KernelDoc:
>                  self.emit_msg(ln,
>                                f"Scanning doc for {self.entry.decl_type} {self.entry.identifier}",
>                                    warning=False)
> -
> -            return
> -
> +        #
>          # Failed to find an identifier. Emit a warning
> -        self.emit_msg(ln, f"Cannot find identifier on line:\n{line}")
> +        #
> +        else:
> +            self.emit_msg(ln, f"Cannot find identifier on line:\n{line}")
>  
>      def process_body(self, ln, line):
>          """



Thanks,
Mauro
