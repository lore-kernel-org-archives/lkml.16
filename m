Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4E61CAA4;
	Sat, 14 Jun 2025 14:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749911486; cv=none; b=PcvLx3MSpCtZvdh3Pz4pnUngJjkmGsDjhZ9SHW3N0zxBZm2dOZ1IXgTlzBHwCWdY+GSrBZSDrW0q/e3XN8E78aXDspMo2SHkpWuL+s1LdVefBBkGCQEZp4rk2fTrxU2opsQG6zMpjRQQlO5k9sqxbOgaifoTaqUu2yi6UFCfxAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749911486; c=relaxed/simple;
	bh=nkZfACPbAZYiMo0yba8y/ZNVqELFDNwH2ijh2AR8nig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1uo9iIkRqRVciLUmg8vNxUXjUPdhQlQSmoWMbCIGo62coGxlfmcM/HqTGtk5y0dJjKITl2eHKAlGW46exE4x4em4NfnG8StqfxisJJUQS7LaL25rphJWVPaNpB9zhpQBT9PkLOK4OP03jFfKPkxueGSGbj1cwZs+/CpMMiJrmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=dTE4CLCm; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="dTE4CLCm"
Received: from localhost (unknown [10.10.165.14])
	by mail.ispras.ru (Postfix) with ESMTPSA id 2BB4E552F527;
	Sat, 14 Jun 2025 14:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 2BB4E552F527
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1749911479;
	bh=vezHVgus5Nj2g1IeYhLAF3M4Cc0sGwErYshdPXsCNIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dTE4CLCm9fLLXAyEtPxYcwpVrSDQQ8+AZBUS7t+OV0F6esV9Qk7FeT4+Y+OY59XOC
	 hKZdQERA+2llYBJxiUeRX1DdGRkpXopWJ8eGhYoxPcaLjasaEgOvhFfw7dkQgW0G+c
	 2VZMfb+fYama65bAwIMB3sgywPL3XND8R3GKe/t8=
Date: Sat, 14 Jun 2025 17:31:19 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
	Takashi Iwai <tiwai@suse.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH 0/3] ASoC: amd: fixes for runtime private data memory
 leaks
Message-ID: <ikzadk3upz2uh2zbnamycs2ua6qmhsdok34xsvygdcwqy3hzbk@epeuts7j5htr>
References: <20250530164425.119102-1-pchelkin@ispras.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250530164425.119102-1-pchelkin@ispras.ru>

On Fri, 30. May 19:44, Fedor Pchelkin wrote:
> Here follows a set of related patches regarding leaks of memory referenced
> to by runtime->private_data pointers in amd soc drivers.

Hi,

a ping on the series..

Thanks!

> 
> Fedor Pchelkin (3):
>   ASoC: amd: acp6x-pdm-dma: free pdm device data on closing
>   ASoC: amd: acp3x-pcm-dma: free runtime private data on closing
>   ASoC: amd: acp3x-pdm-dma: free pdm device data on closing
> 
>  sound/soc/amd/raven/acp3x-pcm-dma.c  | 2 +-
>  sound/soc/amd/renoir/acp3x-pdm-dma.c | 2 ++
>  sound/soc/amd/yc/acp6x-pdm-dma.c     | 2 ++
>  3 files changed, 5 insertions(+), 1 deletion(-)
> 
> -- 
> 2.49.0
> 
