Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDA2BA34;
	Sun, 22 Jun 2025 11:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750593005; cv=none; b=hlT1wCmi2Mgim+iPA63xV2/8OEWevzLI07U6NHGOK4PHT8j/42Rjm/zgK+obouckoSzRYmLQqwRmtlZBJoje0Bz6q0XXNC/YciLr9xGsXPIoqX9KxLdW0fzIBNWkO0DhjDAcCx0NdrsURtQ0fA+5WKGzMCWZRKGtVtvYuI/o9P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750593005; c=relaxed/simple;
	bh=+h6tabdmqhZWFEeUWGh7TnDrOXf4QZEipJfVs1NQBz0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hlyFNRgAZNHEKj6WJMu4rqr0UHZIfa604ZZYyA6QMzpkzhdzmF3RZpb6uT9gFvMGqFRPeS+9u3JLj4ZozfLWTtMInUMlDLpRQLE/B1vr4fn5kVKR5aHPnK+yXdBaYontsnJriJHSx5ZmhcIh9Xjn6OLhZxYCtNO/Zz94GDKDCNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mGqwDpcV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mGqwDpcV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA82C4CEE3;
	Sun, 22 Jun 2025 11:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750593004;
	bh=+h6tabdmqhZWFEeUWGh7TnDrOXf4QZEipJfVs1NQBz0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mGqwDpcVR9SdTUQa6u08/XyDf+6v5EKnkEF1mB3vA0avV/B+EMt8WULkuDs4zwmSv
	 uXfGnIEABr/y44tBscDNz9hAYxzvldbNwxL2/DvO1TK8+ZWgbRECLshAfNzef1awfr
	 DygAN8PIk8tLsAWspa6fYkUfT4RWV/DPJMry7GyI6WXzfYjzL8Sue27gA+1RM0z+9k
	 9IU/pb/mQghEJEDxrJhQRUmSQ5M/KcJNLrCEuA2mJzuohi/6lZL/VT84si3smhmx6B
	 T3uihursI5HzR1CcXVx7XziYj15+2+t2WedBkeuO9XpRp/lvwhTYhODeOwWmeUBp4A
	 sHy1qn8VcRCbw==
Date: Sun, 22 Jun 2025 13:50:00 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH 4/9] docs: kdoc: split out the special-section state
Message-ID: <20250622135000.3580ba52@foz.lan>
In-Reply-To: <20250621203512.223189-5-corbet@lwn.net>
References: <20250621203512.223189-1-corbet@lwn.net>
	<20250621203512.223189-5-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 21 Jun 2025 14:35:07 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> The state known as BODY_WITH_BLANK_LINE really, in a convoluted way,
> indicates a "special section" that is terminated by a blank line or the
> beginning of a new section.  That is either "@param: desc" sections, or the
> weird "context" section that plays by the same rules.
> 
> Rename the state to SPECIAL_SECTION and split its processing into a
> separate function; no real changes to the logic yet.

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  scripts/lib/kdoc/kdoc_parser.py | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index f1491f8c88e7..185ffe4e1469 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -88,7 +88,7 @@ class state:
>      NAME          = 1        # looking for function name
>      DECLARATION   = 2        # We have seen a declaration which might not be done
>      BODY          = 3        # the body of the comment
> -    BODY_WITH_BLANK_LINE = 4 # the body which has a blank line
> +    SPECIAL_SECTION = 4      # doc section ending with a blank line
>      PROTO         = 5        # scanning prototype
>      DOCBLOCK      = 6        # documentation block
>      INLINE        = 7        # gathering doc outside main block
> @@ -98,7 +98,7 @@ class state:
>          "NAME",
>          "DECLARATION",
>          "BODY",
> -        "BODY_WITH_BLANK_LINE",
> +        "SPECIAL_SECTION",
>          "PROTO",
>          "DOCBLOCK",
>          "INLINE",
> @@ -1383,18 +1383,18 @@ class KernelDoc:
>          self.emit_msg(ln, f"bad line: {line}")
>  
>  
> +    def process_special(self, ln, line):
> +        """
> +        STATE_SPECIAL_SECTION: a section ending with a blank line
> +        """
> +        if KernRe(r"\s*\*\s*\S").match(line):
> +            self.entry.begin_section(ln, dump = True)
> +        self.process_body(ln, line)
> +
>      def process_body(self, ln, line):
>          """
>          STATE_BODY: the bulk of a kerneldoc comment.
>          """
> -
> -        if self.state == state.BODY_WITH_BLANK_LINE:
> -            r = KernRe(r"\s*\*\s*\S")
> -            if r.match(line):
> -                self.dump_section()
> -                self.entry.begin_section(ln)
> -                self.entry.contents = ""
> -
>          if doc_sect.search(line):
>              self.entry.in_doc_sect = True
>              newsection = doc_sect.group(1)
> @@ -1452,7 +1452,7 @@ class KernelDoc:
>                      self.state = state.BODY
>                  else:
>                      if self.entry.section != SECTION_DEFAULT:
> -                        self.state = state.BODY_WITH_BLANK_LINE
> +                        self.state = state.SPECIAL_SECTION
>                      else:
>                          self.state = state.BODY
>  
> @@ -1751,7 +1751,7 @@ class KernelDoc:
>          state.NAME:			process_name,
>          state.BODY:			process_body,
>          state.DECLARATION:		process_decl,
> -        state.BODY_WITH_BLANK_LINE:	process_body,
> +        state.SPECIAL_SECTION:		process_special,
>          state.INLINE:			process_inline,
>          state.PROTO:			process_proto,
>          state.DOCBLOCK:			process_docblock,



Thanks,
Mauro
