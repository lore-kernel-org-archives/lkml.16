Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C7F2857FF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744292833; cv=none; b=YDiIDeO2cYPv0yb+Z/sT1WDCTxr/nunKaDp1uzo8vbD7w0N0jJKmdmk5NP8uDwJ4ZWZFdNP3gfnF5vjZHVVC+uvSsmhm3jhEIRSZ0s3nvl9PW879wyQaZg+u1kK1wNBQSTH/YAwRJaedjuWSJ3mj6ngw7aB6qO1I0mJNl3kxd+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744292833; c=relaxed/simple;
	bh=4b9272PBm8zs6TURGhpg1ANgpmpR6PaBZxZkWeDeEHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YYYpVVgLKTVRH54RuJT8t3nI20SkTvZ4Kd/ANmsSuv2IzS83efcAlNa4GtYvR7EGB0EDZHy/cmrT5uqFnfplBgRzcfstbosbeEjveoiQjzmPfntAZPOvteIyaLMIo3yLurSBOa12zod0TBSAUUfmS1XnUKGn/NWQuzDbAMGEAIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Mk9oC8Ci; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Mk9oC8Ci"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so6861665e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744292829; x=1744897629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+9TWPr4cIFFLNnl4cBBmSOXCekcTbC/DxVvbdg+OgM=;
        b=Mk9oC8Ciseix0Lc9kzOm7O/CrVcBc8ogo8t3nGu2efGsUpin5FPC/2BkM1D4lVl7gq
         sbwpnxZTMlFNLdhnVwadktRsdl3q/mJkxZxr1OBBM2i6tlU4v0ppICZrrODtzKUg6kwr
         y/PmrXN6Fip2HnGhrYMTxkuOu07dGHLyayrXn8jYLUMAFINTbZYSgNYVFfA8CWhtqe4O
         tqwDtAIjtX0WLOoGP8aIwDCN66oTszueE6qNelX61SQTpWLsaiyqcoQYwx9QkDfuxgjz
         yCsHSK4kZeU2HSI5yo7pZ8W+YqZGvufXIJHxix8nGUBSxdSVf3WgraVDTfcrCRG1/5RK
         0iIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744292829; x=1744897629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+9TWPr4cIFFLNnl4cBBmSOXCekcTbC/DxVvbdg+OgM=;
        b=mR6luFdhVPqQILyFYjcqCo30xlcI43xaRo7LbDAoRnk5SXDhOuhl8U1WtVykqO2xT5
         /jBy+zhq/I0vWo5J9j6gCLGh6oWR4eA9zH7tCAtstnCAl2eYuMcGRtVMBX2L1sr6GVlR
         kyywf1MThFUKJHME6EVRXw8Hz/YYWnVIezTrN3mwy1TnPjI36zw5zRwE7ndYwyQwK4f9
         dN5aX7bEHVrOhtta5XXKHgIDwE2jLEErBqrj1FZb5PO9p4mBaqxY0Ajy0YYM6ISGFUrg
         OwgyRi5e4relZ66fEy5nwucC0VLqoCHsOQiyQbkhWLJp41XS3rquFZG1mK5t+aHRZXfL
         RhWQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6MGbARKpEn4zO5Duv2V3xP26mjiun16VunrM7RbH1IqVx49+vM200M2atcXgeCty9af0B9XrHLUETrMA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6avP069S5AmTNRuGZ3qpz8HDU5caQJsPQAGXTYRFesDPNrC1T
	8BkfMFyQPQQPdH7hFL1/5NwqSq4a7lij4GOTok2a8AKG1UZgIJf7VgVkM88da4s=
X-Gm-Gg: ASbGnctiH1lOvn9gWsvnwNhSEBiQIgnDy4e1w6xTzY2X+/Be9Ep8KYH2kcS+/Cie2yC
	sDWWHjrILoHNwa5YnKKjbOJbkqtJBOJwgUWGY3n8g/XwTGEJtYJV20Vr3XlbfKpfLOcXrr9aOrp
	znvdF7dNbn5R+hMlVlFDEHnzb2sOQ5YMWIQaZ8zs9tYGtaMqosVKtXvcxvfSCKHJVUYN1FpJoLM
	EqjiZ2os5wO9q/FP92FdCkG7FlUErb3urjh32+sBYf74EjcIvSX0hw6PmOtH+32UaAz9FDL0iOm
	8cvcRMHPOUiPtsmP/llNBeY9HOXICscSz74eJ+nj6dw=
X-Google-Smtp-Source: AGHT+IGJpePNvVyjgvmav5Kd5AqQY4lDiNg+UquOUe0N4IN23Wm6xkWaUOUyn4V50aiJmmCXeU8IOg==
X-Received: by 2002:a05:600c:5248:b0:43d:79:ae1b with SMTP id 5b1f17b1804b1-43f2d7bc45bmr27374935e9.14.1744292829089;
        Thu, 10 Apr 2025 06:47:09 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d004sm57414615e9.18.2025.04.10.06.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:47:08 -0700 (PDT)
Date: Thu, 10 Apr 2025 15:47:06 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Vishal Chourasia <vishalc@linux.ibm.com>
Cc: tj@kernel.org, hannes@cmpxchg.org, corbet@lwn.net, 
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] doc,cgroup-v2: memory.max is reported in multiples of
 page size
Message-ID: <la6q2koug4ohzcfc5eqguod7x6fdwhndqkhzfrttsfnjo5fbb3@xzxodtpjl6ww>
References: <20250410133439.4028817-2-vishalc@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cbkayfgiworvjsdj"
Content-Disposition: inline
In-Reply-To: <20250410133439.4028817-2-vishalc@linux.ibm.com>


--cbkayfgiworvjsdj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] doc,cgroup-v2: memory.max is reported in multiples of
 page size
MIME-Version: 1.0

Hello.

On Thu, Apr 10, 2025 at 07:04:40PM +0530, Vishal Chourasia <vishalc@linux.i=
bm.com> wrote:
> Update documentation for memory.max to clarify that the reported value
> is in multiples of the system page_size. The following example
> demonstrates this behavior:

This applies to any of page_counter-based attribute, not only
memory.max.

> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -1316,6 +1316,9 @@ PAGE_SIZE multiple when read back.
>  	Caller could retry them differently, return into userspace
>  	as -ENOMEM or silently ignore in cases like disk readahead.
> =20
> +        Note that the value set for memory.max is reported in units
> +        corresponding to the system's page size.
> +

There seems to be mismatch in whitespace to surrounding text.

Also the wording would be more precise if it referred to 'multiples',
not 'units' (units are simply bytes).

Michal

--cbkayfgiworvjsdj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ/fL2AAKCRAt3Wney77B
SRSNAP0bnJApWLajoXwxzl1ghVWKw5zQVjK3WrLIJrECXtDDewEAugoDnnl7QTvl
4H/JYvFk91gyh5my4GuIExOBCwcMQQs=
=2s8B
-----END PGP SIGNATURE-----

--cbkayfgiworvjsdj--
