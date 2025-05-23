Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167B2218AC8;
	Fri, 23 May 2025 03:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747969849; cv=none; b=dt/Jub4qZdm5bovj+VmWMBXY4DwWtx/jHLPVBSLmHsiKNmTarG4P3ghPywbgfSzhI47ofWstOCWnCqxRAsfhhoAu2dyY3pDfxMMb+CAPZ5fEsDTba1NXAXHi5SZHS4rS6Y6HKI8KlUrzEoiuu6Hasey2pCLcZ1/7ctDjV7p1ls4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747969849; c=relaxed/simple;
	bh=EDg1HtRdEKu2wx072cSUDWyclmRErO56Gv/XPdGs1ZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m6GWPCyqRyqzlkEPbhxEbA4gamvYZdzIF35qpLsrftZUlFC73UwLrurvXwTlywuVFo7QUDx3LeYoO/cg9QvQUbNow3eSlKjFvQI4O6+G9NWVugkQ6KIdDNpchgOztkPGDa5ynkxC8FCm3wxnugEYSunvnPzgWiq4wxe2xhCnwUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzReLTYK; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzReLTYK"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-73c17c770a7so9257338b3a.2;
        Thu, 22 May 2025 20:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747969847; x=1748574647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IQ+DvPxjKWEL7WwSCKI9gbi6R0NoaJVuMVX8JBqcEaw=;
        b=lzReLTYKNmOdFdM6nlTEu1aHVWWKDa7BndxmAuLx3cosdTISirob1TX6YOf2WZDmXE
         +QfuBxIg+c5NDfguQo5HvAtwbC0BDbxzPq9+Xkd9XQM0z2f+CrHTg5qoS2kAZ/scSnoa
         B/9KkcuHa/+x9iqwz4GGsTYdJe5My9nAMK2yVhp+QxBLHmknl12bHUyBXDuDHM1+BYJX
         n40ELEsRNO2a4RCAqBJzz3VBZe6De2m9R1wcl5ioHRs/jLe4GIW3nYdnSgpsvdBmqwoo
         4WcCbxdMAswIiZEf7jn6KvKEjBnbxlZNEkykyQk60ZhDBk4dtEvmpga/lye+UqGtjOe0
         mj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747969847; x=1748574647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQ+DvPxjKWEL7WwSCKI9gbi6R0NoaJVuMVX8JBqcEaw=;
        b=X8DbINYluLnJQNnVlzKmy7K64qOJzR8Y1DQWSykxekfIXlR+ltYuE7GEMPd7bXLsQk
         D5uGduYfzY9lfqGFW4BaFPrAiLDzzG4kjBWg2TMmcoYB1OBMQnzg1pa/EZ9ao0B2IPAv
         jC/Ky2JgHEO6UUmqTEbifa1OmbrKeRHkAqZKruwWwkLRaTGidQ10oBUizSVu6ti3EWDB
         UUNXnYjqY5ZwzcQBExXzQcV8PSEXvVcuKaQM6YmCwRmu5SN+iFFXGW4rElJihCecyEhf
         P4na8368jnBlCSnFZ6DiUEMxtikCuiuHrqJk7mp76mL+XrgPA+E5t7oAswKyijbi2Yg3
         yhAA==
X-Forwarded-Encrypted: i=1; AJvYcCV6Os4dXdvW4rliLlYoky3DlgQP1DKnRejQ9zWtWy3coLe1AGaUOMKjJHhFEygnJVIBu3r+ssHY/Y3aOzAy@vger.kernel.org, AJvYcCXC29OVyrcD87YyLujn3EUbVVyZGGRWbwXvcNNzkzVqBgcEJf4gliokBsWuxWUPjPJwr1+TzTRc17Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/JkNEVf49r2E4EazytmWqs1NHVL5snQ1zqS3M3z7NplLppNb0
	/xmmsRPD7LCwgNcB1FGIHi0TEoQt3yZ/CfCoclH6z08+SGa8iiDJoJw/cIxV3Q==
X-Gm-Gg: ASbGncvovvzlpCclsA2pA0WzLmUtZcdnTHcJ6HBHRys29tIgCFy4ELTpxwbpuZ+vq7I
	vwshAQgvUhDuTqXF+PPTtaW2nt2DwJSwDBRu/zao2q7qMS8qzjlcCaOWbJftUac0e89+cm+GLtM
	VLG5yxFbFAijafaRa83VNsvJI0QN5ejnA5aOROEumiU69Vv6PnHBI6/uvGPdVgN+g/p/Sp1kQ9t
	zFpDG2CM9SjhBvGKsdbsVJcREiXbPREQiO4iGJ/oYeW9eR7GS9djNAE7MbQ5+pPnot37JknWuE1
	RTesjYKIWjniMllIKB+aVaHjDERYIeZX0VUGy0vTLVrTp/j37hy9f/oKxYgPfw==
X-Google-Smtp-Source: AGHT+IHakgt4Oo144LFlK0CdrZV/uiDMprRX9FVu7JhxaNdV3cktYYQ5oHfnfFpCIqZpXDB87tP8lw==
X-Received: by 2002:a05:6a20:7d9a:b0:215:a9d5:1a46 with SMTP id adf61e73a8af0-21879eda720mr1812330637.12.1747969847013;
        Thu, 22 May 2025 20:10:47 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb0a89edsm11828150a12.67.2025.05.22.20.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 20:10:46 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 6EDF642439C3; Fri, 23 May 2025 10:10:43 +0700 (WIB)
Date: Fri, 23 May 2025 10:10:42 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: add overview diagram for drm stack
Message-ID: <aC_nMs-hAyd8cpDJ@archie.me>
References: <20250522-drm-doc-updates-v1-1-d1efd54740bd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fFwlWSH1Re80NIG0"
Content-Disposition: inline
In-Reply-To: <20250522-drm-doc-updates-v1-1-d1efd54740bd@gmail.com>


--fFwlWSH1Re80NIG0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 06:20:27PM -0400, Abdulrasaq Lawani wrote:
> -[Insert diagram of typical DRM stack here]
> +Overview of the Linux DRM Architecture
> +-----------------------------------------------
> ++-----------------------------+
> +|     User-space Apps         |
> +| (Games, Browsers, ML, etc.) |
> ++-----------------------------+
> +              |
> +              v
> ++---------------------------------------+
> +|    Graphics APIs   |   Compute APIs   |
> +|  (OpenGL, Vulkan)  |  (OpenCL, CUDA)  |
> ++---------------------------------------+
> +          |                   |
> +          v                   v
> ++---------------------+  +-----------------------+
> +|  User-space Driver  |  |    Compute Runtime    |
> +|  (Mesa, AMD/NVIDIA) |  |  (OpenCL, CUDA, ROCm) |
> ++---------------------+  +-----------------------+
> +          |                   |
> +          +--------+----------+
> +                   |
> +                   v
> +        +-----------------------+
> +        |   libdrm (DRM API)    |
> +        +-----------------------+
> +                   |
> +                   v
> ++-------------------------------------------+
> +|     Kernel DRM/KMS Driver (i915, amdgpu,  |
> +|     nouveau, etc.)                        |
> ++-------------------------------------------+
> +        |                       |
> +        v                       v
> ++----------------+     +-------------------+
> +| GPU Display HW |     | GPU Compute Units |
> ++----------------+     +-------------------+
> +

I get multiple Sphinx indentation warnings and errors:

Documentation/gpu/introduction.rst:23: ERROR: Unexpected indentation. [docu=
tils]
Documentation/gpu/introduction.rst:22: WARNING: Block quote ends without a =
blank line; unexpected unindent. [docutils]
Documentation/gpu/introduction.rst:23: WARNING: Blank line required after t=
able. [docutils]
Documentation/gpu/introduction.rst:24: WARNING: Line block ends without a b=
lank line. [docutils]
Documentation/gpu/introduction.rst:25: WARNING: Block quote ends without a =
blank line; unexpected unindent. [docutils]
Documentation/gpu/introduction.rst:29: ERROR: Unexpected indentation. [docu=
tils]
Documentation/gpu/introduction.rst:28: WARNING: Block quote ends without a =
blank line; unexpected unindent. [docutils]
Documentation/gpu/introduction.rst:29: WARNING: Blank line required after t=
able. [docutils]
Documentation/gpu/introduction.rst:29: WARNING: Inline substitution_referen=
ce start-string without end-string. [docutils]
Documentation/gpu/introduction.rst:30: WARNING: Line block ends without a b=
lank line. [docutils]
Documentation/gpu/introduction.rst:31: WARNING: Block quote ends without a =
blank line; unexpected unindent. [docutils]
Documentation/gpu/introduction.rst:35: ERROR: Unexpected indentation. [docu=
tils]
Documentation/gpu/introduction.rst:35: WARNING: Inline substitution_referen=
ce start-string without end-string. [docutils]
Documentation/gpu/introduction.rst:36: WARNING: Line block ends without a b=
lank line. [docutils]
Documentation/gpu/introduction.rst:37: ERROR: Unexpected indentation. [docu=
tils]
Documentation/gpu/introduction.rst:37: WARNING: Blank line required after t=
able. [docutils]
Documentation/gpu/introduction.rst:38: WARNING: Line block ends without a b=
lank line. [docutils]
Documentation/gpu/introduction.rst:39: WARNING: Block quote ends without a =
blank line; unexpected unindent. [docutils]
Documentation/gpu/introduction.rst:42: ERROR: Unexpected indentation. [docu=
tils]
Documentation/gpu/introduction.rst:42: WARNING: Blank line required after t=
able. [docutils]
Documentation/gpu/introduction.rst:43: WARNING: Line block ends without a b=
lank line. [docutils]
Documentation/gpu/introduction.rst:44: WARNING: Block quote ends without a =
blank line; unexpected unindent. [docutils]
Documentation/gpu/introduction.rst:48: ERROR: Unexpected indentation. [docu=
tils]
Documentation/gpu/introduction.rst:48: WARNING: Blank line required after t=
able. [docutils]
Documentation/gpu/introduction.rst:48: WARNING: Inline substitution_referen=
ce start-string without end-string. [docutils]
Documentation/gpu/introduction.rst:49: WARNING: Line block ends without a b=
lank line. [docutils]
Documentation/gpu/introduction.rst:50: WARNING: Block quote ends without a =
blank line; unexpected unindent. [docutils]

Please wrap the diagram above in literal code block.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--fFwlWSH1Re80NIG0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaC/nLwAKCRD2uYlJVVFO
o0YoAPwP/GehTZZ/E4/JcMOdTC7wObkIe1OLa0lGTzgAjWND6AEApJP3MFdq+y9+
RaJncUrLjmh4hjOHSxP5jQUoYmWL6wY=
=++Ke
-----END PGP SIGNATURE-----

--fFwlWSH1Re80NIG0--
