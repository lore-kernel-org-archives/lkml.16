Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78A1B67F;
	Sat, 10 May 2025 10:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746874043; cv=none; b=LenfN7FZiCxh04BJsIhgJ9UIm82PvbyPbCy0C0Q4PJtE1xBUm6OBaIwVBqfqYx+jXTsldc2lKtzKpx6xOyDyA9p+HN2mRfStrttSaCvT4J2zI2RX7efwWYwXY1lPihceGfrw6YAcud2kmEHjekq5TcqDP8pPd+ARv7uFqAzzoH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746874043; c=relaxed/simple;
	bh=JzL8VGVYtgBK9zzL1zBp88LEkrJDtaAyUWPZRfOo2iI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jtEXzA/bVcukaXrk7Pda7WlDkU4YoK1SSQr7IdFoWQEoamc5bkUF7mRmyrA81P6XeThDLvK3tWx7/4SA1jlrXKINMQohZyESLIrVMbJW8oRwfZvirG9H0FU7AMZm3mA84abofNgkG6lBV55dvsa5uF+9f/F7drzLv7mlh0wtdmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m/3heN6c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m/3heN6c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CB8C4CEE2;
	Sat, 10 May 2025 10:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746874043;
	bh=JzL8VGVYtgBK9zzL1zBp88LEkrJDtaAyUWPZRfOo2iI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=m/3heN6cdXU8QOX+GHST5lV2WW1Ck0kp1ZMMr/W6cHvz21qQX6C6rAa4A2TokpvF+
	 bmyVhibgajwIBcMtXjuuvdjefh6qIDDhaLpLrzh+cdSL6RjAnmo7tw15L87Fu/tDWi
	 E2zhKDPAHaihP29zx+gCW/cAZuAkf0/nI4rU/kkHxpy0XyR2+TE0tVmLA9mFGIRFXD
	 CuoH5TOca97QSG8BKlbCivLkIEdeUwzomnjhQXD0gooweGM3Km3HlqmgcdysOHF1L3
	 CJHqGV4P8StZkk5d+C7EYAXBh2k9AR3EoVOxi8VYz/QuiWsO0UFJkoVJLBxTujEiyu
	 Fq9XysRI6S/dg==
Date: Sat, 10 May 2025 12:47:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/9] CodingStyle: mention "typedef struct S {} S;" if
 typedef is used
Message-ID: <20250510124711.6b5d8b9a@foz.lan>
In-Reply-To: <20250509203430.3448-4-adobriyan@gmail.com>
References: <20250509203430.3448-1-adobriyan@gmail.com>
	<20250509203430.3448-4-adobriyan@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri,  9 May 2025 23:34:25 +0300
Alexey Dobriyan <adobriyan@gmail.com> escreveu:

> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> ---
>  Documentation/process/coding-style.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
> index ac9c1dbe00b7..5c5902a0f897 100644
> --- a/Documentation/process/coding-style.rst
> +++ b/Documentation/process/coding-style.rst
> @@ -443,6 +443,20 @@ EVER use a typedef unless you can clearly match one of those rules.
>  In general, a pointer, or a struct that has elements that can reasonably
>  be directly accessed should **never** be a typedef.
>  
> +If you must use ``typedef`` consider using identical names for both the type
> +and its alias so that the type can be forward declared if necessary:

Better not, as symbols with duplicated names will generate a Sphinx warning (*). 

(*) It shouldn't, but there is a pending issue on Sphinx since version 3.1
    still not addressed:

	https://github.com/sphinx-doc/sphinx/pull/8313

Regards,

Thanks,
Mauro
