Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2504BBA34;
	Sun, 22 Jun 2025 11:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750592942; cv=none; b=jjok1MkmX/8T5b/ykPEp6lWF/LtdB1qA3MHuBvJggK0Qdawcuesuu9WhsacZQ5cN7Tnqpy/Jxr1f/lT2C5XreBKMVdlSwGAYW9vRlGzV7RTweVPin/WYeWhEbs1KTz2QPEasNekgJMMvEiDo61deyas0cSPSw0mbnz3VrXBvb+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750592942; c=relaxed/simple;
	bh=kPiv8Htn2RzUtKSYQkgG0DhzX60RgBfLfRLL7aPdIWY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LHrTaUpcorgpI8zxTEZGW3gF3omFqVHwB7tJ6tubNq03NTD6NXqsyKYOpkUy9yEKtTfBDkDGzcqOgFqx4S2bblr210YbC8a0bWgC8Iu3VVBIouKsnNFVAlUe6NknVIfixUOm6AAv1Nrs3xDLn+KAYdpZEL4Gp+hNaSvqLV9f5QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ngC/ny9h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngC/ny9h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DFEC4CEE3;
	Sun, 22 Jun 2025 11:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750592941;
	bh=kPiv8Htn2RzUtKSYQkgG0DhzX60RgBfLfRLL7aPdIWY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ngC/ny9hw+XJ4twDaIqHmb6Y08WEorqs0Zwz7LvjhjHIaN0FKYBmAn5XLxRascwwf
	 Cp5heVSfVY5MC2w0Kt5rmVdzy9UzzuHCEPEsvHOH229wdINauaGl9pwyIhq0dmDwK9
	 iLpMGe2unXcEO+40TpjVszYKcRJQTcgmlFWmv05shVt7q7RvT2JW8a5anYhMAVdVWi
	 Sv3+hz1ZTWCA750/5vcfg8Ereux+IzYE05PQtONIFl8qltzgH5NK7zbj9gau+FG+lh
	 w9FpjNQqja52zudme9IlID0wtG8JO5/P5arsej8wR0Etv3c+O5/qUoDp0Ggp52sCIP
	 hec/UPJDUwI0Q==
Date: Sun, 22 Jun 2025 13:48:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH 3/9] docs: kdoc: separate out the handling of the
 declaration phase
Message-ID: <20250622134857.543cb85a@foz.lan>
In-Reply-To: <20250621203512.223189-4-corbet@lwn.net>
References: <20250621203512.223189-1-corbet@lwn.net>
	<20250621203512.223189-4-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 21 Jun 2025 14:35:06 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> The BODY_MAYBE state really describes the "we are in a declaration" state.
> Rename it accordingly, and split the handling of this state out from that
> of the other BODY* states.  This change introduces a fair amount of
> duplicated code that will be coalesced in a later patch.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  scripts/lib/kdoc/kdoc_parser.py | 93 +++++++++++++++++++++++++++------
>  1 file changed, 78 insertions(+), 15 deletions(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index d29a61a06f6d..f1491f8c88e7 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -86,7 +86,7 @@ class state:
>      # Parser states
>      NORMAL        = 0        # normal code
>      NAME          = 1        # looking for function name
> -    BODY_MAYBE    = 2        # body - or maybe more description
> +    DECLARATION   = 2        # We have seen a declaration which might not be done

A way better now.

>      BODY          = 3        # the body of the comment
>      BODY_WITH_BLANK_LINE = 4 # the body which has a blank line
>      PROTO         = 5        # scanning prototype
> @@ -96,7 +96,7 @@ class state:
>      name = [
>          "NORMAL",
>          "NAME",
> -        "BODY_MAYBE",
> +        "DECLARATION",
>          "BODY",
>          "BODY_WITH_BLANK_LINE",
>          "PROTO",
> @@ -1287,7 +1287,7 @@ class KernelDoc:
>              r = KernRe("[-:](.*)")
>              if r.search(line):
>                  self.entry.declaration_purpose = trim_whitespace(r.group(1))
> -                self.state = state.BODY_MAYBE
> +                self.state = state.DECLARATION
>              else:
>                  self.entry.declaration_purpose = ""
>  
> @@ -1310,9 +1310,82 @@ class KernelDoc:
>          else:
>              self.emit_msg(ln, f"Cannot find identifier on line:\n{line}")
>  
> +    def process_decl(self, ln, line):
> +        """
> +        STATE_DECLARATION: We've seen the beginning of a declaration
> +        """
> +        if doc_sect.search(line):
> +            self.entry.in_doc_sect = True
> +            newsection = doc_sect.group(1)
> +
> +            if newsection.lower() in ["description", "context"]:
> +                newsection = newsection.title()
> +
> +            # Special case: @return is a section, not a param description
> +            if newsection.lower() in ["@return", "@returns",
> +                                      "return", "returns"]:
> +                newsection = "Return"
> +
> +            # Perl kernel-doc has a check here for contents before sections.
> +            # the logic there is always false, as in_doc_sect variable is
> +            # always true. So, just don't implement Wcontents_before_sections
> +
> +            # .title()
> +            newcontents = doc_sect.group(2)
> +            if not newcontents:
> +                newcontents = ""
> +
> +            if self.entry.contents.strip("\n"):
> +                self.dump_section()
> +
> +            self.entry.begin_section(ln, newsection)
> +            self.entry.leading_space = None
> +
> +            self.entry.contents = newcontents.lstrip()
> +            if self.entry.contents:
> +                self.entry.contents += "\n"
> +
> +            self.state = state.BODY
> +            return
> +
> +        if doc_end.search(line):
> +            self.dump_section()
> +
> +            # Look for doc_com + <text> + doc_end:
> +            r = KernRe(r'\s*\*\s*[a-zA-Z_0-9:\.]+\*/')
> +            if r.match(line):
> +                self.emit_msg(ln, f"suspicious ending line: {line}")
> +
> +            self.entry.prototype = ""
> +            self.entry.new_start_line = ln + 1
> +
> +            self.state = state.PROTO
> +            return
> +
> +        if doc_content.search(line):
> +            cont = doc_content.group(1)
> +
> +            if cont == "":
> +                self.state = state.BODY
> +                self.entry.contents += "\n"  # needed?
> +
> +            else:
> +                # Continued declaration purpose
> +                self.entry.declaration_purpose = self.entry.declaration_purpose.rstrip()
> +                self.entry.declaration_purpose += " " + cont
> +
> +                r = KernRe(r"\s+")
> +                self.entry.declaration_purpose = r.sub(' ',
> +                                                       self.entry.declaration_purpose)
> +            return
> +
> +        # Unknown line, ignore
> +        self.emit_msg(ln, f"bad line: {line}")
> +
> +
>      def process_body(self, ln, line):
>          """
> -        STATE_BODY and STATE_BODY_MAYBE: the bulk of a kerneldoc comment.
> +        STATE_BODY: the bulk of a kerneldoc comment.
>          """
>  
>          if self.state == state.BODY_WITH_BLANK_LINE:
> @@ -1385,16 +1458,6 @@ class KernelDoc:
>  
>                      self.entry.contents += "\n"
>  
> -            elif self.state == state.BODY_MAYBE:
> -
> -                # Continued declaration purpose
> -                self.entry.declaration_purpose = self.entry.declaration_purpose.rstrip()
> -                self.entry.declaration_purpose += " " + cont
> -
> -                r = KernRe(r"\s+")
> -                self.entry.declaration_purpose = r.sub(' ',
> -                                                       self.entry.declaration_purpose)
> -
>              else:
>                  if self.entry.section.startswith('@') or        \
>                     self.entry.section == self.section_context:
> @@ -1687,7 +1750,7 @@ class KernelDoc:
>          state.NORMAL:			process_normal,
>          state.NAME:			process_name,
>          state.BODY:			process_body,
> -        state.BODY_MAYBE:		process_body,
> +        state.DECLARATION:		process_decl,
>          state.BODY_WITH_BLANK_LINE:	process_body,
>          state.INLINE:			process_inline,
>          state.PROTO:			process_proto,



Thanks,
Mauro
