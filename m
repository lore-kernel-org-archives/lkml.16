Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6580D1FF5F9;
	Sat,  7 Jun 2025 10:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749290707; cv=none; b=CNovWjeEpCIfHIYrMUHIhf+fQxSyECG5V6/KIXeeLtg+JXDdjS+CLPngPYvMuRbyrjag609N760sIykTTRfKIpdKqujCw8wXW6kO0jNJR+lY7cM9QLuRs/4xoYTgpEP8XT2prWTAMdViy9bTzbKTPYHkdd3R5OEBieEHQzTJcU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749290707; c=relaxed/simple;
	bh=y25H9gTnu6can1B4hFv7RYzYXD+Im5faAmp1z5goPmE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BYr3OwW98b+vCZoFpXwcO0qnHXHfZaAWEjzO5VeaO0EpMjTOxE6AxeGew0WGcqujfC7pUicJo3x4TSxWqZ3Kc/ZCaHhqugIWyC9lhxH1hiBJmCvn9c1Cac8Uf1ANQglvbwNPj3OapntWSu66wZSnD4smtPgr8G87Q34V5HDA9XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4AurPLO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4AurPLO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06ECDC4CEE4;
	Sat,  7 Jun 2025 10:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749290705;
	bh=y25H9gTnu6can1B4hFv7RYzYXD+Im5faAmp1z5goPmE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=F4AurPLOaU6jiScFZEOtJap34OiXqa96yP2Ts2D2LKexqcfFe2K4tltuAubETXmoK
	 Km7TKwGWX2Ur7SFUG4ROyFhCVs1FUzVZNIcbwoMV3RyXrwI1Gxg+pzkvyxh3m4lC3W
	 UlnuKqLAtmAhCspyCoUyP/cxt5S99gfJlCs8p4RiW2qZiLrVsJCpm8nGOG9T+MiFAf
	 AH3vQjp3K7EBsIqiuEpPhM8EsRwSzgHMnndICIRocdzuImAlBAwdGrbytVod79zZOg
	 UHa0kLn0U/e2dpJN33BibPRGQtNltvJVTD3CaY32Zrq+tNO+dlFTdU5Aa06ihqt4N6
	 0yAoM3oeFKp4A==
Date: Sat, 7 Jun 2025 12:05:01 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/9] docs: kdoc: simplify the kerneldoc recognition code
Message-ID: <20250607120501.7a0db912@foz.lan>
In-Reply-To: <20250606163438.229916-5-corbet@lwn.net>
References: <20250606163438.229916-1-corbet@lwn.net>
	<20250606163438.229916-5-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri,  6 Jun 2025 10:34:33 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> process_name() looks for the first line of a kerneldoc comment.  It
> contains two nearly identical regular expressions, the second of which only
> catches six cases in the kernel, all of the form:
> 
>   define SOME_MACRO_NAME - description
> 
> Simply put the "define" into the regex and discard it, eliminating the loop
> and the code to remove it specially.
> 
> Note that this still treats these defines as if they were functions, but
> that's a separate issue.
> 
> There is no change in the generated output.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

Nice cleanup!

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  scripts/lib/kdoc/kdoc_parser.py | 24 ++++++++----------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index 90b53b70cfee..3ea260b423e2 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -1230,26 +1230,18 @@ class KernelDoc:
>  
>              # Test for data declaration
>              r = KernRe(r"^\s*\*?\s*(struct|union|enum|typedef)\b\s*(\w*)")
> +            r2 = KernRe(fr"^{decl_start}{fn_type}(?:define\s+)?(\w+)\s*{parenthesis}\s*{decl_end}?$")
>              if r.search(line):
>                  self.entry.decl_type = r.group(1)
>                  self.entry.identifier = r.group(2)
>                  self.entry.is_kernel_comment = True
> -            else:
> -                # Look for foo() or static void foo() - description;
> -                # or misspelt identifier
> -
> -                r1 = KernRe(fr"^{decl_start}{fn_type}(\w+)\s*{parenthesis}\s*{decl_end}?$")
> -                r2 = KernRe(fr"^{decl_start}{fn_type}(\w+[^-:]*){parenthesis}\s*{decl_end}$")
> -
> -                for r in [r1, r2]:
> -                    if r.search(line):
> -                        self.entry.identifier = r.group(1)
> -                        self.entry.decl_type = "function"
> -
> -                        r = KernRe(r"define\s+")
> -                        self.entry.identifier = r.sub("", self.entry.identifier)
> -                        self.entry.is_kernel_comment = True
> -                        break
> +            #
> +            # Look for a function description
> +            #
> +            elif r2.search(line):
> +                self.entry.identifier = r2.group(1)
> +                self.entry.decl_type = "function"
> +                self.entry.is_kernel_comment = True
>  
>              self.entry.identifier = self.entry.identifier.strip(" ")
>  



Thanks,
Mauro
