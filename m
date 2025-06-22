Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18721D6DB9;
	Sun, 22 Jun 2025 11:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750593124; cv=none; b=lvJlPWjVo6mSDyitAs7b2ziKQ9N65VUlR4G8DW6g0N7QNNnNKU+f7dZM2oJOZYCnS+xYVdeDS8e5EZyov9xHaxWBH36S0gbgteLqZ1k+ty9rgdGpwmq9RcbZMhQSdVK9CaE++1MGDd/9D3Hygv68nswr9Ymo7BCMPfCM1AbLTow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750593124; c=relaxed/simple;
	bh=eKCvTzcMotjVJgZ5cw4vzSrYXlWHXIg6iKJiRwWQO1I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i+lJaLj13+yNhEo2oErru9/gIuepoUutUFfquUubdY/beXMN7aNvWMBAlwpusLmDCp+GUbU3YnPxfknZUrmK8DLRkClAQUKfpX+z2o3uTg3gEyngVIRXDoE/uviqRJywGdakfLhPFDoY9hLeKvjARQq4inKgPwnrjNy0SUOtBDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qeTDUYnK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qeTDUYnK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8A2C4CEE3;
	Sun, 22 Jun 2025 11:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750593123;
	bh=eKCvTzcMotjVJgZ5cw4vzSrYXlWHXIg6iKJiRwWQO1I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qeTDUYnKGsi5kP/ztiIj5vAa5xkziQ8VXXjDDUUJSfYTO53uM4XgyhWutBsaEqNGK
	 5UfZNqOX6SVrzyKJCITzIzHkY+Y10BYKzCcbMgGwmV2kj9Ow0zYKwNcMN0Y1layy3i
	 JIoDfKXQPbaKZ95qwvWrvJR9O9KWbwWJQkfnZacIQNSgR7daEFHcnLMdXvRzNuBVa3
	 SOM9vk42b5slFmSdmbvoGnEqNyqKcDbOSdwTKJLSBb6UMZ3ynTuYRywtt2xtCh76oN
	 GUSvfNd3p9TIR8m/63VDBWot1xdrsCJDojw9//9HMvyJMXWQt2gOSiZVYyDmq5kNaD
	 Y1Kxqyw/QOkxg==
Date: Sun, 22 Jun 2025 13:51:59 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH 6/9] docs: kdoc: rework the handling of SPECIAL_SECTION
Message-ID: <20250622135159.231bac62@foz.lan>
In-Reply-To: <20250621203512.223189-7-corbet@lwn.net>
References: <20250621203512.223189-1-corbet@lwn.net>
	<20250621203512.223189-7-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 21 Jun 2025 14:35:09 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Move the recognition of this state to when we enter it, rather than when we
> exit, eliminating some twisty logic along the way.
> 
> Some changes in output do result from this shift, generally for kerneldoc
> comments that do not quite fit the format.  See, for example,
> struct irqdomain.  As far as I can tell, the new behavior is more correct
> in each case.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  scripts/lib/kdoc/kdoc_parser.py | 48 ++++++++++++++-------------------
>  1 file changed, 20 insertions(+), 28 deletions(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index a336d543e72b..5998b02ca3a0 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -1316,21 +1316,25 @@ class KernelDoc:
>      def is_new_section(self, ln, line):
>          if doc_sect.search(line):
>              self.entry.in_doc_sect = True
> +            self.state = state.BODY
> +            #
> +            # Pick out the name of our new section, tweaking it if need be.
> +            #
>              newsection = doc_sect.group(1)
> -
> -            if newsection.lower() in ["description", "context"]:
> -                newsection = newsection.title()
> -
> -            # Special case: @return is a section, not a param description
> -            if newsection.lower() in ["@return", "@returns",
> -                                      "return", "returns"]:
> +            if newsection.lower() == 'description':
> +                newsection = 'Description'
> +            elif newsection.lower() == 'context':
> +                newsection = 'Context'
> +                self.state = state.SPECIAL_SECTION
> +            elif newsection.lower() in ["@return", "@returns",
> +                                        "return", "returns"]:
>                  newsection = "Return"
> -
> -            # Perl kernel-doc has a check here for contents before sections.
> -            # the logic there is always false, as in_doc_sect variable is
> -            # always true. So, just don't implement Wcontents_before_sections
> -
> -            # .title()
> +                self.state = state.SPECIAL_SECTION
> +            elif newsection[0] == '@':
> +                self.state = state.SPECIAL_SECTION
> +            #
> +            # Initialize the contents, and get the new section going.
> +            #
>              newcontents = doc_sect.group(2)
>              if not newcontents:
>                  newcontents = ""
> @@ -1344,8 +1348,6 @@ class KernelDoc:
>              self.entry.contents = newcontents.lstrip()
>              if self.entry.contents:
>                  self.entry.contents += "\n"
> -
> -            self.state = state.BODY
>              return True
>          return False
>  
> @@ -1395,8 +1397,9 @@ class KernelDoc:
>          """
>          STATE_SPECIAL_SECTION: a section ending with a blank line
>          """
> -        if KernRe(r"\s*\*\s*\S").match(line):
> +        if KernRe(r"\s*\*\s*$").match(line):
>              self.entry.begin_section(ln, dump = True)
> +            self.state = state.BODY
>          self.process_body(ln, line)
>  
>      def process_body(self, ln, line):
> @@ -1424,20 +1427,9 @@ class KernelDoc:
>              cont = doc_content.group(1)
>  
>              if cont == "":
> -                if self.entry.section == self.section_context:
> -                    self.entry.begin_section(ln, dump = True)
> -                    self.state = state.BODY
> -                else:
> -                    if self.entry.section != SECTION_DEFAULT:
> -                        self.state = state.SPECIAL_SECTION
> -                    else:
> -                        self.state = state.BODY
> -
>                      self.entry.contents += "\n"
> -
>              else:
> -                if self.entry.section.startswith('@') or        \
> -                   self.entry.section == self.section_context:
> +                if self.state == state.SPECIAL_SECTION:
>                      if self.entry.leading_space is None:
>                          r = KernRe(r'^(\s+)')
>                          if r.match(cont):



Thanks,
Mauro
