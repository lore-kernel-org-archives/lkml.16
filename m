Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7EB1991C9;
	Sun, 22 Jun 2025 11:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750593298; cv=none; b=rf5X8zkRJehv9NLeBVt0zqMnh6I3WXeLufL8af0TGgUE9VSts6HISjB+CHtGKGqgThZ48mhPUJ0I6NWK++DC9zci0aiuqKz2O0JFXd1gM1nK40ZArwhuwL055paEAq6ffrH41sPwmCANSqvy3ItNOF+tfCHfZg0fUgIouhNf6EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750593298; c=relaxed/simple;
	bh=RrYA5pGqQTVuG8VEnbomPsLS9eMaSBJfUiFm3MvrSzk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c0PmZQSdVRDTX3bI0EfFduaXcqv8ujPVaNhPPmRknTw16wTXmosuiw30DCseX0XVSEDOqmu2eknEOBbuqBJWkOetgAvOooBCfljjeqH4kDge3S5PI3piKUkWCcuXhc21qkoM2u5U1TjVubbUrCcgLSvQcP8IQNuUOqxYR+9eFGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BsHgkU5I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BsHgkU5I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B564C4CEE3;
	Sun, 22 Jun 2025 11:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750593298;
	bh=RrYA5pGqQTVuG8VEnbomPsLS9eMaSBJfUiFm3MvrSzk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BsHgkU5IpJ2sOb7v5LHTseQ1iBo0oMidsaUCDsiBZ3qvau3sZx4NJAkXKPznpQwou
	 IfxJfEDDN00q7HZsMQTjoq/133T+ai+TLRMCpe00JhSoPH1RD/zESES19Qvk0pbK4v
	 uXkFMKwrdUbdagBynUm6mHudFkY4XZcbORYHvVWMjTkT/C7qB8wc93Las7dlzX0UQI
	 YbHXGn9R/vXJbfPWscaqcxFFrcRTBvDMlod9W08n3QG+so9lZ+wXAzJ0jxqX+kDCGc
	 w25XtH3yFwzEZPXw64Da1LpMl0mf9yC4O9s8/5BMDELuK+ym0S3TBeiZu8lhA53ysY
	 mH78kPgHQToLg==
Date: Sun, 22 Jun 2025 13:54:54 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH 9/9] docs: kdoc: finish disentangling the BODY and
 SPECIAL_SECTION states
Message-ID: <20250622135454.41fa0c7c@foz.lan>
In-Reply-To: <20250621203512.223189-10-corbet@lwn.net>
References: <20250621203512.223189-1-corbet@lwn.net>
	<20250621203512.223189-10-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 21 Jun 2025 14:35:12 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Move the last SPECIAL_SECTION special case into the proper handler
> function, getting rid of more if/then/else logic.  The leading-space
> tracking was tightened up a bit in the move.  Add some comments describing
> what is going on.
> 
> No changes to the generated output.

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  scripts/lib/kdoc/kdoc_parser.py | 80 ++++++++++++++++++++-------------
>  1 file changed, 48 insertions(+), 32 deletions(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index a6ee8bac378d..3557c512c85a 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -1405,10 +1405,53 @@ class KernelDoc:
>          """
>          STATE_SPECIAL_SECTION: a section ending with a blank line
>          """
> +        #
> +        # If we have hit a blank line (only the " * " marker), then this
> +        # section is done.
> +        #
>          if KernRe(r"\s*\*\s*$").match(line):
>              self.entry.begin_section(ln, dump = True)
> +            self.entry.contents += '\n'
>              self.state = state.BODY
> -        self.process_body(ln, line)
> +            return
> +        #
> +        # Not a blank line, look for the other ways to end the section.
> +        #
> +        if self.is_new_section(ln, line) or self.is_comment_end(ln, line):
> +            return
> +        #
> +        # OK, we should have a continuation of the text for this section.
> +        #
> +        if doc_content.search(line):
> +            cont = doc_content.group(1)
> +            #
> +            # If the lines of text after the first in a special section have
> +            # leading white space, we need to trim it out or Sphinx will get
> +            # confused.  For the second line (the None case), see what we
> +            # find there and remember it.
> +            #
> +            if self.entry.leading_space is None:
> +                r = KernRe(r'^(\s+)')
> +                if r.match(cont):
> +                    self.entry.leading_space = len(r.group(1))
> +                else:
> +                    self.entry.leading_space = 0
> +            #
> +            # Otherwise, before trimming any leading chars, be *sure*
> +            # that they are white space.  We should maybe warn if this
> +            # isn't the case.
> +            #
> +            for i in range(0, self.entry.leading_space):
> +                if cont[i] != " ":
> +                    self.entry.leading_space = i
> +                    break
> +            #
> +            # Add the trimmed result to the section and we're done.
> +            #
> +            self.entry.contents += cont[self.entry.leading_space:] + '\n'
> +        else:
> +            # Unknown line, ignore
> +            self.emit_msg(ln, f"bad line: {line}")
>  
>      def process_body(self, ln, line):
>          """
> @@ -1419,37 +1462,10 @@ class KernelDoc:
>  
>          if doc_content.search(line):
>              cont = doc_content.group(1)
> -
> -            if cont == "":
> -                    self.entry.contents += "\n"
> -            else:
> -                if self.state == state.SPECIAL_SECTION:
> -                    if self.entry.leading_space is None:
> -                        r = KernRe(r'^(\s+)')
> -                        if r.match(cont):
> -                            self.entry.leading_space = len(r.group(1))
> -                        else:
> -                            self.entry.leading_space = 0
> -
> -                    # Double-check if leading space are realy spaces
> -                    pos = 0
> -                    for i in range(0, self.entry.leading_space):
> -                        if cont[i] != " ":
> -                            break
> -                        pos += 1
> -
> -                    cont = cont[pos:]
> -
> -                    # NEW LOGIC:
> -                    # In case it is different, update it
> -                    if self.entry.leading_space != pos:
> -                        self.entry.leading_space = pos
> -
> -                self.entry.contents += cont + "\n"
> -            return
> -
> -        # Unknown line, ignore
> -        self.emit_msg(ln, f"bad line: {line}")
> +            self.entry.contents += cont + "\n"
> +        else:
> +            # Unknown line, ignore
> +            self.emit_msg(ln, f"bad line: {line}")
>  
>      def process_inline(self, ln, line):
>          """STATE_INLINE: docbook comments within a prototype."""



Thanks,
Mauro
