Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AE61B423B;
	Sun, 22 Jun 2025 11:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750593228; cv=none; b=j0tTJB9X3+KJrfx6L8XivYkuMzeh/9Uge/QJRTVUUR9vRW1QysfS2VeNOz7BNK7/EnBF8oKAk1Tvv56ryqSWXCsam33nzZ93PS70kQJrVK5/l4tjKdBWSSQUa7M1qeRGLQJ7ttLs2QyqxjaTz6NyA3KJhQNqD4TKjl3mahDgrlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750593228; c=relaxed/simple;
	bh=1d2sCIvvF2dbtRvnkPeRbqIk7XoEH2f91ttakls6UPM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dQVHyo7466+h6RrYo0hGNjjJyaNWUrd5H3m6qMmx5tWrNCVRX2WYPHMutJ5WOE8vgqVPsedqnZMGT8S6O3PhZc6ZrVsFxpGo49Z+fPMOIgIOBbLoqMPhgbBYahuDrRfDnKFEAR/iEsSrJ3sMw7wM0URNlcmV/dnxSGg0FsV2p/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dN41K1jH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dN41K1jH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69425C4CEE3;
	Sun, 22 Jun 2025 11:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750593226;
	bh=1d2sCIvvF2dbtRvnkPeRbqIk7XoEH2f91ttakls6UPM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dN41K1jHCuY2skcpwUSKHGFg1/zkGUkj1z9UIgLJwyhSgOa4HVOFM3TVzpVlukafE
	 hpKgCzGNe8fjOVSsO+ACUoT5Jiv/kNG0GRB/zMl11Z42HU7GWQsSlu0jNRfib2qQfD
	 3TtcvwEqlADtsJXSbo1VSVYRpdukEsgdDd2qPJuhBy+DPfr67fbOi/OF8xS3q+0Om4
	 m57hPUtv+AVvZMyVO0WGuQ8+zNVQ8PIFs24xnR3I872H4E6qhLwMI9sPVQMO4sHilA
	 9hRwydn87tW6gsO/b79JQV2ilEWlzaWU4mXkGTt15amHpKCdvnuyR5F9GD/Vnm7dkP
	 h9a8k0MqACfgQ==
Date: Sun, 22 Jun 2025 13:53:42 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH 8/9] docs: kdoc: Add some comments to process_decl()
Message-ID: <20250622135342.182edcb4@foz.lan>
In-Reply-To: <20250621203512.223189-9-corbet@lwn.net>
References: <20250621203512.223189-1-corbet@lwn.net>
	<20250621203512.223189-9-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 21 Jun 2025 14:35:11 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Now that the function can actually fit into a human brain, add a few
> comments.  While I was at it, I switched to the trim_whitespace() helper
> rather than open-coding it.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  scripts/lib/kdoc/kdoc_parser.py | 30 ++++++++++++++++--------------
>  1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index f7a5b85a8ed7..a6ee8bac378d 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -1377,26 +1377,28 @@ class KernelDoc:
>          """
>          if self.is_new_section(ln, line) or self.is_comment_end(ln, line):
>              return
> -
> +        #
> +        # Look for anything with the " * " line beginning.
> +        #
>          if doc_content.search(line):
>              cont = doc_content.group(1)
> -
> +            #
> +            # A blank line means that we have moved out of the declaration
> +            # part of the comment (without any "special section" parameter
> +            # descriptions).
> +            #
>              if cont == "":
>                  self.state = state.BODY
>                  self.entry.contents += "\n"  # needed?
> -
> +            #
> +            # Otherwise we have more of the declaration section to soak up.
> +            #
>              else:
> -                # Continued declaration purpose
> -                self.entry.declaration_purpose = self.entry.declaration_purpose.rstrip()
> -                self.entry.declaration_purpose += " " + cont
> -
> -                r = KernRe(r"\s+")
> -                self.entry.declaration_purpose = r.sub(' ',
> -                                                       self.entry.declaration_purpose)
> -            return
> -
> -        # Unknown line, ignore
> -        self.emit_msg(ln, f"bad line: {line}")
> +                self.entry.declaration_purpose = \
> +                    trim_whitespace(self.entry.declaration_purpose + ' ' + cont)
> +        else:
> +            # Unknown line, ignore
> +            self.emit_msg(ln, f"bad line: {line}")
>  
>  
>      def process_special(self, ln, line):



Thanks,
Mauro
