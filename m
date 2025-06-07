Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310521EE033;
	Sat,  7 Jun 2025 10:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749290424; cv=none; b=djMC1j/YYcGCmHy9gQM617KMjAO+YGB/fMgUoUsmJkR+j/8+4+WsqPtFpNUZLIsBJkgzrFv34ay1IvHhWRX3Tv/7AfJkXH+0w8h4BW8+2unUkUxD3FIDOU83QcipUKGC/kTKlij7znrp0wSaRYA2JpoXjA9c5EtZajrKRU8Hiw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749290424; c=relaxed/simple;
	bh=6G5mgrIzKGtDdZjd0DxjZ9iI7TZ73Yu68An/fXTKRBs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HRgPMmjX3pkUnzung+7wu44pWaI+PvTk9UMQxCT20W2lZzq9XLP6HYNOPT0Gjn65TES+M2zlDSy1e/CPqkwpjxkF5kqv0bZQhN/d7Cbj95Apx0oLI7IkOHFo38KWbH2a7WFBmKcXlkxl2c/Y3pj24LWBxArTXw1YRmTiu2z8K5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYNhXHyW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYNhXHyW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0EF4C4CEE4;
	Sat,  7 Jun 2025 10:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749290423;
	bh=6G5mgrIzKGtDdZjd0DxjZ9iI7TZ73Yu68An/fXTKRBs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kYNhXHyW3e4sXegY2l4NRrE5e47uJy+5sn0AmD8BlmH0PUn418Dazf0HPwt68v76j
	 wMPCfsItjbqIXMM4n0uY8Usp6zgledTklKHJyBgUMqvVFtnTs5mWEf3sb5ndZf/+cb
	 DR5nW6CITXh++mc6tePGaz3zaeFJGL70C6/0Uerh9UKb6CAlMPkER/bPz8f8+ZTAzU
	 MhUHvCJtrM5zMsrhdoYC7XSEpQY3bX+9tGTyGhbOnfpMmRpRIvrPO3SI/Ao8kIrkzo
	 1XTS7mxRth1upwUNYcEMgdnVWpmLgVvOiqVzwBn3UQgtF0KBFreOMpelZUTWL4XrFA
	 JS90TMrjqM+Cg==
Date: Sat, 7 Jun 2025 12:00:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] docs: kdoc: move the core dispatch into a state
 table
Message-ID: <20250607120019.20dff0a3@foz.lan>
In-Reply-To: <20250606163438.229916-3-corbet@lwn.net>
References: <20250606163438.229916-1-corbet@lwn.net>
	<20250606163438.229916-3-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri,  6 Jun 2025 10:34:31 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Since all of the handlers already nicely have the same prototype, put them
> into a table and call them from there and take out the extended
> if-then-else series.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  scripts/lib/kdoc/kdoc_parser.py | 30 +++++++++++++++++-------------
>  1 file changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index b193cf9dc0d1..37b7e501af7c 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -1670,6 +1670,21 @@ class KernelDoc:
>  
>          return export_table
>  
> +    #
> +    # The state/action table telling us which function to invoke in
> +    # each state.
> +    #
> +    state_actions = {
> +        state.NORMAL:			process_normal,
> +        state.NAME:			process_name,
> +        state.BODY:			process_body,
> +        state.BODY_MAYBE:		process_body,
> +        state.BODY_WITH_BLANK_LINE:	process_body,
> +        state.INLINE:			process_inline,
> +        state.PROTO:			process_proto,
> +        state.DOCBLOCK:			process_docblock,
> +        }
> +
>      def parse_kdoc(self):
>          """
>          Open and process each line of a C source file.
> @@ -1721,19 +1736,8 @@ class KernelDoc:
>                      self.process_export(export_table, line)
>  
>                      # Hand this line to the appropriate state handler
> -                    if self.state == state.NORMAL:
> -                        self.process_normal(ln, line)
> -                    elif self.state == state.NAME:
> -                        self.process_name(ln, line)
> -                    elif self.state in [state.BODY, state.BODY_MAYBE,
> -                                        state.BODY_WITH_BLANK_LINE]:
> -                        self.process_body(ln, line)
> -                    elif self.state == state.INLINE:  # scanning for inline parameters
> -                        self.process_inline(ln, line)
> -                    elif self.state == state.PROTO:
> -                        self.process_proto(ln, line)
> -                    elif self.state == state.DOCBLOCK:
> -                        self.process_docblock(ln, line)
> +                    self.state_actions[self.state](self, ln, line)
> +
>          except OSError:
>              self.config.log.error(f"Error: Cannot open file {self.fname}")
>  



Thanks,
Mauro
