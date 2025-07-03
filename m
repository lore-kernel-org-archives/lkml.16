Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35003596B;
	Thu,  3 Jul 2025 15:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751557197; cv=none; b=T4KD/MbwTFJM3jFcZ6St/QACgWGjDVAbFF3cvGdX/8AmDUNIyuERyAPWGCPW+yK01COdhkTR+oFyDPzhn5RjkeWzJZAt3/nLHulZvNzt6XKtu+tyz4G3nbkAe90fA6vNKs2IrODphfydXyVdV1H8k8hqB9YE9DtWCehJAWMhHVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751557197; c=relaxed/simple;
	bh=HgKr0YZKmRVGauoQQTFdL3SNUskeQSvGGYQlafcuNcw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LDR60au9fw2NvG78WGIwF0OQ5ObtscVqI93CaT5RnI41E0CXKAgLQOi9qk1YZtnd8fvUPVOt1BDUsTjCsimr6+hJGiklbj7WIHdiI00swDslLekwY7uNXDo57NzNa4zAwN7QZhAj3cRpw86LMhbrDxglsdqp5DAx1EoiHtQPLC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UzCTrgXJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UzCTrgXJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F62BC4CEE3;
	Thu,  3 Jul 2025 15:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751557197;
	bh=HgKr0YZKmRVGauoQQTFdL3SNUskeQSvGGYQlafcuNcw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UzCTrgXJTfyKhIn5C047tQmT63HVE8KG9QuiG0Ryy5OUSEYRR2SGcs6E5TNCnMJWO
	 G0rp4HmxKRvry2de7RwlaoJszIXkFtkjZ/oDE6ue+lk98N9ZPtmvvDU3uOrExRlLsC
	 ldspcHyu9ybVDqa6gjmZHxV32YQEWgFpqH4YGWvujjp0Lursm9BDERup9HGDExXfMs
	 2WqmhjU0vrUvz/R2FXkcmeP6dIsSXJqHFQBXqv0Rm1hOc4+AS2IKPTbN3TRkA0lT3I
	 2GQUAPiBR0kA9ADu3QOowAjQB/dvajrVWZxYvvoCGUVNuH50jFk8IVlmQ6QrTthAGz
	 RxuVJkRG1xpmQ==
Date: Thu, 3 Jul 2025 17:39:51 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH 3/7] docs: kdoc: remove the brcount floor in
 process_proto_type()
Message-ID: <20250703173951.0b368df0@sal.lan>
In-Reply-To: <20250701205730.146687-4-corbet@lwn.net>
References: <20250701205730.146687-1-corbet@lwn.net>
	<20250701205730.146687-4-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue,  1 Jul 2025 14:57:26 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Putting the floor under brcount does not change the output in any way, just
> remove it.
> 
> Change the termination test from ==0 to <=0 to prevent infinite loops in
> case somebody does something truly wacko in the code.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  scripts/lib/kdoc/kdoc_parser.py | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index d9ff2d066160..935f2a3c4b47 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -1609,9 +1609,7 @@ class KernelDoc:
>                  self.entry.brcount += r.group(2).count('{')
>                  self.entry.brcount -= r.group(2).count('}')
>  
> -                self.entry.brcount = max(self.entry.brcount, 0)
> -
> -                if r.group(2) == ';' and self.entry.brcount == 0:
> +                if r.group(2) == ';' and self.entry.brcount <= 0:
>                      self.dump_declaration(ln, self.entry.prototype)
>                      self.reset_state(ln)
>                      break
