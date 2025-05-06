Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEA0264620;
	Tue,  6 May 2025 13:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746536938; cv=none; b=ffZ0ri9/WCzbr8DtnzJ81AkRTdUS5F+fGBF5s7iYoZ+415qFYxCQ3VsIR0ciI17vVBl7fEC5LUqbxBYCet2cUxcYcV8ymAr3coy9hELDmyUg2ViYtMRdAlLPZh90O9yuHmsiaVv2KoXcIscQ9G0HepdPcKJJ231rBHW2iKIfU8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746536938; c=relaxed/simple;
	bh=VG1Gufcwh7MZa5se64kpEfKPSmyJ29Vehebnpd5IRAo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ObzPTyB9owZFHTXPOCNc+Hygvnx+R00sXtRXywPjq9o6WfVFBd/cccifuwSReqq2NiYsQ9+s9OnjXp7bXe6NU0jMyfc6rg7TiGyBzKp3Z7LG7wn6QzRaOXkGmxkMC4R6vyGL1zzgDAZX09y/yuldGkhGBVggbXQkmbPNst89Zfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=KOFvp1Bb; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KOFvp1Bb"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E38C241080
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1746536936; bh=6moqhSqcopj/M7QIHpptEPyR/KI+0fFlzJiY6KxBFDc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KOFvp1BbTNMURBYB2UuCtQo79WcsZA8qaCa5RYXZcwnXodnPmfH7v12St33yfLaML
	 +v5y1nIzpNL4qOcPstkobst1qwM8v7XB9y/pEcRe4p4eO/hdxrh7MxFuTEklT1xVFk
	 r9sJWLmBpsR+Ah6fV6apAcl1bgMsuUG4jkw6rw+sY78Rk2HHmlmH3LMyO0ue777OjY
	 9MzA9RMVqNp3fRWltR2UzLvxmyUwMJtCvRWrQKofNFA0AePzxAitSorfh8QY80aVOF
	 LH43MjfKur3bSr988RVbz+QoS7fnOo2IElCrm3WZ6VVz0qvTMxK11IVDfPUtSltuZK
	 bwy2XrmBbiTqg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E38C241080;
	Tue,  6 May 2025 13:08:55 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Alexander Shatalin <sashatalin03@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander
 Shatalin <sashatalin03@gmail.com>
Subject: Re: [PATCH] docs: fix typo in firmware-related section
In-Reply-To: <20250430142726.3276-1-sashatalin03@gmail.com>
References: <20250430142726.3276-1-sashatalin03@gmail.com>
Date: Tue, 06 May 2025 07:08:52 -0600
Message-ID: <87ikmdx4wr.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alexander Shatalin <sashatalin03@gmail.com> writes:

> Fix a minor grammar issue by changing 'firmwares' to 'firmware' in the
> Documentation/index.rst file.
>
> Signed-off-by: Alexander Shatalin <sashatalin03@gmail.com>
> ---
>  Documentation/index.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/index.rst b/Documentation/index.rst
> index f9f525f4c0dd..c0cf79a87c3a 100644
> --- a/Documentation/index.rst
> +++ b/Documentation/index.rst
> @@ -84,7 +84,7 @@ which are kept separately from the kernel's own documentation.
>  Firmware-related documentation
>  ==============================
>  The following holds information on the kernel's expectations regarding the
> -platform firmwares.
> +platform firmware.

Applied, thanks.

jon
