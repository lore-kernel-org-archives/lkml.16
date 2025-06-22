Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D489BA34;
	Sun, 22 Jun 2025 11:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750593057; cv=none; b=PGJweDYQE2yPltazhh/k+7dRPpIF1Ncc2KKoSiknLTlOQXka5sF1ZBlD5W6XtV7lXBUOt3A73pR4vrtZS60web8b9ySYynJgcmNBhXjNKYaFl3GFl4nhYj8rRMR8KjPsM1kk7oJ19FmkN8dbjJCXOLrX3H1Dd2q0qm5Iprx76sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750593057; c=relaxed/simple;
	bh=u4cFr5deuCMw0mqsMpEOtVVKUmdS2qhkUmSJHwvV7h4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h2YEaLvd/xppho5wZX+6oh8NJeSiilXesykOiPsrjiCUbF7rdgOZmrC3VJh6Y3r0Pe9EBuwojgjp8CS+4vNVGa78XvnduvGTsDzXKiIVX109kaoOPrtXJLpLCkNl2oQ5nbZ+31Fizt02d0mhbmt0WQxJGEbnJcacWiBk0iUXeq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Odr0w+Dr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Odr0w+Dr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0939C4CEE3;
	Sun, 22 Jun 2025 11:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750593057;
	bh=u4cFr5deuCMw0mqsMpEOtVVKUmdS2qhkUmSJHwvV7h4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Odr0w+DrR8+otnywMpRzSCtcwWSogNj8LIznyudd1abZZ+i9cp/grWp8cHjH5eZ3T
	 qgdByYGKLe7s6UpLuqwkhyYlKXIh4QqaYBd32BMg+yxsKz49LFbAKBZzlIz6PRUCF4
	 DFjmfrYzl5PhLpKEjFchQUNiL6J8GyCtv6O9EOwX4cLH4TI02X+IR3/dIvXsUwHS9G
	 G9Jd5EPAGFhXTndMfP3AjjHaYFVhuRQi7XViO/ezJ+9H3xM7ezdhX3QGftQ/p2LNr5
	 9ce4JQrHObsHZBkIka1gH9A+DUasf/hoSEifcONoqHEUE4Mrc3+88y1xM7glGZKAOV
	 2SMH5rcpKuGMA==
Date: Sun, 22 Jun 2025 13:50:53 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH 5/9] docs: kdoc: coalesce the new-section handling
Message-ID: <20250622135053.349c3184@foz.lan>
In-Reply-To: <20250621203512.223189-6-corbet@lwn.net>
References: <20250621203512.223189-1-corbet@lwn.net>
	<20250621203512.223189-6-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 21 Jun 2025 14:35:08 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Merge the duplicated code back into a single implementation.  Code movement
> only, no logic changes.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  scripts/lib/kdoc/kdoc_parser.py | 49 +++++++++------------------------
>  1 file changed, 13 insertions(+), 36 deletions(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index 185ffe4e1469..a336d543e72b 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -1310,10 +1310,10 @@ class KernelDoc:
>          else:
>              self.emit_msg(ln, f"Cannot find identifier on line:\n{line}")
>  
> -    def process_decl(self, ln, line):
> -        """
> -        STATE_DECLARATION: We've seen the beginning of a declaration
> -        """
> +    #
> +    # Helper function to determine if a new section is being started.
> +    #
> +    def is_new_section(self, ln, line):
>          if doc_sect.search(line):
>              self.entry.in_doc_sect = True
>              newsection = doc_sect.group(1)
> @@ -1346,6 +1346,14 @@ class KernelDoc:
>                  self.entry.contents += "\n"
>  
>              self.state = state.BODY
> +            return True
> +        return False
> +
> +    def process_decl(self, ln, line):
> +        """
> +        STATE_DECLARATION: We've seen the beginning of a declaration
> +        """
> +        if self.is_new_section(ln, line):
>              return
>  
>          if doc_end.search(line):
> @@ -1395,38 +1403,7 @@ class KernelDoc:
>          """
>          STATE_BODY: the bulk of a kerneldoc comment.
>          """
> -        if doc_sect.search(line):
> -            self.entry.in_doc_sect = True
> -            newsection = doc_sect.group(1)
> -
> -            if newsection.lower() in ["description", "context"]:
> -                newsection = newsection.title()
> -
> -            # Special case: @return is a section, not a param description
> -            if newsection.lower() in ["@return", "@returns",
> -                                      "return", "returns"]:
> -                newsection = "Return"
> -
> -            # Perl kernel-doc has a check here for contents before sections.
> -            # the logic there is always false, as in_doc_sect variable is
> -            # always true. So, just don't implement Wcontents_before_sections
> -
> -            # .title()
> -            newcontents = doc_sect.group(2)
> -            if not newcontents:
> -                newcontents = ""
> -
> -            if self.entry.contents.strip("\n"):
> -                self.dump_section()
> -
> -            self.entry.begin_section(ln, newsection)
> -            self.entry.leading_space = None
> -
> -            self.entry.contents = newcontents.lstrip()
> -            if self.entry.contents:
> -                self.entry.contents += "\n"
> -
> -            self.state = state.BODY
> +        if self.is_new_section(ln, line):
>              return
>  
>          if doc_end.search(line):



Thanks,
Mauro
