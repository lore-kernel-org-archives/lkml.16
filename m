Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCA52F2E;
	Sun, 22 Jun 2025 11:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750592844; cv=none; b=QRaMvl+kz4Myh6OzAWiZqepOFR64RC8YKahs++RIUsxI6or7lPD1S0ILgKd2R8f2LNRUMp1YnFKV1Ju+YJ0SNBIMuN6iAsOp3Da7q9PE28yBr709TA1qga3dXO+BRTQpggpgdU+bfIEIFe8sgazzsdI4Gxl1K7LYvYt70xrAoQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750592844; c=relaxed/simple;
	bh=OcWyqnnyP49TnV8sUEiWR78wpLcWlD2ua3iEpIK94m8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EEDKUIK8ZcUDUcDDdi2jQeSZqfKaZJ98cAfDYYMnkbp4UT6o/OBlprXoT0APTOT9cjRKrmmBSeHwvXIeCb+CQFEKIcIdWrv+w3DU0yFWJ4HcSbtoGtaQAJVKzW/BfWWNnacSbF08HAoVo2dPZqdNBWfFh3GN9wfUZWqfQGGMH7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yvhe39KH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yvhe39KH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8058CC4CEE3;
	Sun, 22 Jun 2025 11:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750592843;
	bh=OcWyqnnyP49TnV8sUEiWR78wpLcWlD2ua3iEpIK94m8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Yvhe39KHqVU4OgOZhCtMQdTsKP2EeDErx1x7YwXZy8wGffIA+h4pCSp80DyeY1eC+
	 gh7Gi/N/4Mpttkezxogr5qeXyr9s2s0npY21IpBX8OvT3cMAV357k/1Vt84OU//XMD
	 sA9kTWLHw/07N4U5RYFe3/LCZyHqB5oLmIy6O4jcNgkOIJ/DO4r/xn66IZCjGgjnuL
	 PHqz1srcudhhNb2r+VR6607dOVfOJSTsAYVMd2VrQIdi22ppAseRPSdLyzzzFvgBwt
	 AUeuY823bDTKiZeOJUqeKxq/mAbmdUjDMyQ/K6qPz0Fr6bFkdtPfiyesJtCe/5h257
	 qBsQMCnC7ImrQ==
Date: Sun, 22 Jun 2025 13:47:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH 2/9] docs: kdoc: consolidate the "begin section" logic
Message-ID: <20250622134719.1b9818c7@foz.lan>
In-Reply-To: <20250621203512.223189-3-corbet@lwn.net>
References: <20250621203512.223189-1-corbet@lwn.net>
	<20250621203512.223189-3-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 21 Jun 2025 14:35:05 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Pull the repeated "begin a section" logic into a single place and hide it
> within the KernelEntry class.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

Heh, I had a code snippet similar to this one on one of my test branches ;-)

LGTM.

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  scripts/lib/kdoc/kdoc_parser.py | 32 +++++++++++++++++---------------
>  1 file changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index c46e1b6a7d4b..d29a61a06f6d 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -169,6 +169,15 @@ class KernelEntry:
>          self.warnings.append(log_msg)
>          return
>  
> +    #
> +    # Begin a new section.
> +    #
> +    def begin_section(self, line_no, title = SECTION_DEFAULT, dump = False):
> +        if dump:
> +            self.dump_section(start_new = True)
> +        self.section = title
> +        self.new_start_line = line_no
> +
>      def dump_section(self, start_new=True):
>          """
>          Dumps section contents to arrays/hashes intended for that purpose.
> @@ -1231,12 +1240,11 @@ class KernelDoc:
>          # Check for a DOC: block and handle them specially.
>          #
>          if doc_block.search(line):
> -            self.entry.new_start_line = ln
>  
>              if not doc_block.group(1):
> -                self.entry.section = "Introduction"
> +                self.entry.begin_section(ln, "Introduction")
>              else:
> -                self.entry.section = doc_block.group(1)
> +                self.entry.begin_section(ln, doc_block.group(1))
>  
>              self.entry.identifier = self.entry.section
>              self.state = state.DOCBLOCK
> @@ -1270,8 +1278,7 @@ class KernelDoc:
>              self.state = state.BODY
>              self.entry.identifier = self.entry.identifier.strip(" ")
>              # if there's no @param blocks need to set up default section here
> -            self.entry.section = SECTION_DEFAULT
> -            self.entry.new_start_line = ln + 1
> +            self.entry.begin_section(ln + 1)
>              #
>              # Find the description portion, which *should* be there but
>              # isn't always.
> @@ -1312,8 +1319,7 @@ class KernelDoc:
>              r = KernRe(r"\s*\*\s*\S")
>              if r.match(line):
>                  self.dump_section()
> -                self.entry.section = SECTION_DEFAULT
> -                self.entry.new_start_line = ln
> +                self.entry.begin_section(ln)
>                  self.entry.contents = ""
>  
>          if doc_sect.search(line):
> @@ -1340,8 +1346,7 @@ class KernelDoc:
>              if self.entry.contents.strip("\n"):
>                  self.dump_section()
>  
> -            self.entry.new_start_line = ln
> -            self.entry.section = newsection
> +            self.entry.begin_section(ln, newsection)
>              self.entry.leading_space = None
>  
>              self.entry.contents = newcontents.lstrip()
> @@ -1370,9 +1375,7 @@ class KernelDoc:
>  
>              if cont == "":
>                  if self.entry.section == self.section_context:
> -                    self.dump_section()
> -
> -                    self.entry.new_start_line = ln
> +                    self.entry.begin_section(ln, dump = True)
>                      self.state = state.BODY
>                  else:
>                      if self.entry.section != SECTION_DEFAULT:
> @@ -1427,8 +1430,7 @@ class KernelDoc:
>  
>          if self.inline_doc_state == state.INLINE_NAME and \
>             doc_inline_sect.search(line):
> -            self.entry.section = doc_inline_sect.group(1)
> -            self.entry.new_start_line = ln
> +            self.entry.begin_section(ln, doc_inline_sect.group(1))
>  
>              self.entry.contents = doc_inline_sect.group(2).lstrip()
>              if self.entry.contents != "":
> @@ -1627,7 +1629,7 @@ class KernelDoc:
>          """STATE_PROTO: reading a function/whatever prototype."""
>  
>          if doc_inline_oneline.search(line):
> -            self.entry.section = doc_inline_oneline.group(1)
> +            self.entry.begin_section(ln, doc_inline_oneline.group(1))
>              self.entry.contents = doc_inline_oneline.group(2)
>  
>              if self.entry.contents != "":



Thanks,
Mauro
