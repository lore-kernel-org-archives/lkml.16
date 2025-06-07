Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE5E1D5AD4;
	Sat,  7 Jun 2025 10:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749291293; cv=none; b=TS/PYBP5ODhZA8CmXPdjAPToKHxvBtN/jC9TZIk7/FEVJ/eHMA6SQ6N164jMxO0aqPTrSxIJ98/+KNjYhfVe7NKTHoL7ag1Pv4cxPtwB6PYaeAauQMMP/5taCuMMJzAvAhWVH4Hf5OtpMl9xO2JqzAIgUEhwDoOKVIjPaETje4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749291293; c=relaxed/simple;
	bh=pbR4Uyu14HhS6c3c+zCWCCPOgjBihCsXzUcgZhFwf6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WYcGLDmUmwpUlOyhuzy6f/N6IogxmhFLv7BgZm9ZnIS6fRbFLEQNTRYXR4hTq39xHRpsyf4jk2IMMloK5L2+VRubWE52oYfXYHevZP8CufN9zVIZ9DiKwhXGKlpz9ORbT2g/pssn+lHxvg8HGm2os3EeVblSweOvbWnrVvZ+gFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qTlJ5+M8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qTlJ5+M8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB5A9C4CEE4;
	Sat,  7 Jun 2025 10:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749291292;
	bh=pbR4Uyu14HhS6c3c+zCWCCPOgjBihCsXzUcgZhFwf6Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qTlJ5+M8RWR7FUevBa3Tu0fEsNoJKtU7xJLRCLFh6qi8HtGxOkBj1PZTQGfzVDogh
	 dVJ97vIce79gCC/pHu8QYqsyxq5AxFa8ddQBMPqArGnhaReQMbeTMsOiVQemiTpAhz
	 6EXtxiEtu5qFDvX99d4SmMg6URKnnr6cAwsPTbkVHKcE/n27RIb93EtvLzJX1TUr2j
	 K3dV5VOYeKLJ+6FhfRpxVbGDcJA/tapoCgPdbLLIEIo4wvJY2hQ0BqlCjI2wqYs1yW
	 Qncmy0hsaB9GSE7khkPV3rKltfFJDbOl22YaTfTSBJSclFor0LIhdWkXYSHrWwatdR
	 N59gPwjdrns1A==
Date: Sat, 7 Jun 2025 12:14:48 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] docs: kdoc: remove the KernelEntry::descr pseudo
 member
Message-ID: <20250607121448.11411bf9@foz.lan>
In-Reply-To: <20250606163438.229916-7-corbet@lwn.net>
References: <20250606163438.229916-1-corbet@lwn.net>
	<20250606163438.229916-7-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri,  6 Jun 2025 10:34:35 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> The entry.descr value used in process_name() is not actually a member of
> the KernelEntry class; it is a bit of local state.  So just manage it
> locally.
> 
> A trim_whitespace() helper was added to clean up the code slightly.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

LGTM.

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  scripts/lib/kdoc/kdoc_parser.py | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index 56299695abd1..7c635000f3de 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -60,6 +60,13 @@ export_symbol_ns = KernRe(r'^\s*EXPORT_SYMBOL_NS(_GPL)?\s*\(\s*(\w+)\s*,\s*"\S+"
>  
>  type_param = KernRe(r"\@(\w*((\.\w+)|(->\w+))*(\.\.\.)?)", cache=False)
>  
> +#
> +# A little helper to get rid of excess white space
> +#
> +multi_space = KernRe(r'\s\s+')
> +def trim_whitespace(s):
> +    return multi_space.sub(' ', s.strip())
> +
>  class state:
>      """
>      State machine enums
> @@ -1258,12 +1265,7 @@ class KernelDoc:
>  
>              r = KernRe("[-:](.*)")
>              if r.search(line):
> -                # strip leading/trailing/multiple spaces
> -                self.entry.descr = r.group(1).strip(" ")
> -
> -                r = KernRe(r"\s+")
> -                self.entry.descr = r.sub(" ", self.entry.descr)
> -                self.entry.declaration_purpose = self.entry.descr
> +                self.entry.declaration_purpose = trim_whitespace(r.group(1))
>                  self.state = state.BODY_MAYBE
>              else:
>                  self.entry.declaration_purpose = ""



Thanks,
Mauro
