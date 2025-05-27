Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DEF27B4EB;
	Tue, 27 May 2025 16:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748363605; cv=none; b=A5/CmYhhW6+QQSNpJEgVxqKKXaP0a4e5+Ef3gQYrQJ6jrgcN9NqrHUwhF24Vv6kAnzPsV1xACYwndupOnR3nHL0tH8ogJi4tV3/uAJGIPjAnzjxqCE57f7DszXLwxjwke0s3Sg+rQ8+SQC514MSfeMmkyY58GAdXtqReGssRVyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748363605; c=relaxed/simple;
	bh=HyTgDh5cAO8OPW/g7S/tq4DLh5jwNnJ4nud2y1OhePo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=U/fsv9L5mDyBybc6QSLjltEbgmQ/7SY++96QwhANN/xg3hhgzsbTXBzQgmrD7A+MFcGI6bf7FZjdH3MKvk7cg3czaALyxz8neo1bpEv62smC6M27u+AY7p29/PPAgeATgiOTVf+DhWgf/Z4JgdkOlltm4kuvRHCYMDdJoCQjXNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AU9Aj7SA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AU9Aj7SA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775B8C4CEEB;
	Tue, 27 May 2025 16:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748363605;
	bh=HyTgDh5cAO8OPW/g7S/tq4DLh5jwNnJ4nud2y1OhePo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AU9Aj7SADaSoc+uZXgHtW/H9MASQFJVMRJSss02BgBXgDMf9veat6k//j50RnUg1v
	 IYfUIhvR+Mhihs0EtAoAts4TTj2/D5QrWsqVB/5s8o+AW3UFNZhvuISisUB/Z9MxWr
	 ely09CCkHQk+qA4SAo9BBJRlQHm+v+e1INxdSG0d1NNNZBTuqEVvxK6/bu4WwPRgnO
	 Jr+asmIt1W0G+f1+u/4/dI6q3g1fyc8IQtq2No4RUdV61XsCl3ECBCZnGUOfy1pPf0
	 nGsTiHAjVNwKVPKt2IO63e/1gBxWF5HfbKAsygvMBfwowR+JH2zbBjfb545XP9y9LD
	 iKl6UNwYaoPpg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-kernel@vger.kernel.org,
  kernel-janitors@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: Constify struct spi_nor_fixups
In-Reply-To: <aa641732ba707ce3690217825c3ca7373ffde4f9.1748191985.git.christophe.jaillet@wanadoo.fr>
References: <aa641732ba707ce3690217825c3ca7373ffde4f9.1748191985.git.christophe.jaillet@wanadoo.fr>
Date: Tue, 27 May 2025 18:33:22 +0200
Message-ID: <mafs0iklmrp2l.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, May 25 2025, Christophe JAILLET wrote:

> 'struct spi_nor_fixups' are not modified in this driver.
>
> Constifying these structures moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
>
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   23304	  13168	      0	  36472	   8e78	drivers/mtd/spi-nor/micron-st.o
>
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   23560	  12912	      0	  36472	   8e78	drivers/mtd/spi-nor/micron-st.o
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Pratyush Yadav <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
