Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1974D279911
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701827; cv=none; b=ns3UwAcxT17dd/K6XH6o1c42637dnR9RfDpZ21OxhvOJifo9leRwtslSc4qxyZ3grcgNIHTzC1RObq33OxS4TTHVlum7mxlEOlCXaqYJo/dnLXGM3cxPGOhwSnmgVQ7Lyvk8/DqZVQDed7xarKI1GDTZdPBCHUQwK7rO1ArYctQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701827; c=relaxed/simple;
	bh=UDj4eAeCiIPS1KrBXrK6pNmhKNCEyzIvzN6l8yfOIt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TJsQ/69RlkUenc/EkibBWOvwoP+r8Iu1NiP4QOH18CjNmilFDkN7XgOJZYHhXB/syUlJFb5rEihKNGW2MT5mPAURyoQrYqppWHUxB+a4HLcjjbefSa/kGGRKz/1fmw8b1a41o39QFYjaNLAmpp/WiQPmcq1y881QOPOI+uEevUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s0aWOljH; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s0aWOljH"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30effbfaf61so56844361fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744701824; x=1745306624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDj4eAeCiIPS1KrBXrK6pNmhKNCEyzIvzN6l8yfOIt8=;
        b=s0aWOljHtl3DYidT4aBuJ5RbOxGD9xuVQ7XbynkofVHRGqgSxThq2b/B0pWaoy4maz
         auxxhCx/GtAGSO0VotQQynzt+4gcaYpVSeWmWWYD7mdXYfqz2GJC75tK+MJv5UluprA+
         E6D4Bq1vpEYg92kphPPOahfOs06pLP/evDQK02BnCI6bvavUEMdPlAhpO5LHP6wDHOPF
         ugVSHq4Nhx8ih2HHPLHAJKSN4nzEMWwcPg8u89zEwPFMLlKTlvG8PWaYt97TOsTz3era
         h3BVoZKC3RaadKJ2aI4+Lk8YLjSF85BJTNcuSRg16dWdASx6XTYDusqGbdIYFjK3SBqk
         gkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744701824; x=1745306624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDj4eAeCiIPS1KrBXrK6pNmhKNCEyzIvzN6l8yfOIt8=;
        b=LTye0k9u5kUw1gPX3AaYrbFEHDW4+m6df2GvZeVjN85Jv3ebYLXwR7UPQXIB5SvSgZ
         xFL66Dmt0NU+AfiCIECDg05drAhgSCTBgJuZAuKEExm/K3/hTdTAElTOsTQggfPOi+7L
         9XcN+hAvc807UoJM4O+AxSs7hQ5H0UG1z0d8G+oJoEHms/IyhWKLa4C6kXgeUAe7JROn
         hXZDVjeu3Ih7EnMe8f5nCpJIE/WBkJO3m3HHgu0FJJPZJd2KyPPz5zD1nSi781t/a2ps
         Yo0ByV34i4HYX8Eo2rlYmRNEw7KOkgGfkiqpvXHcUhl8aJdLER/jtqC85ye+Y4xaZo/y
         QUlw==
X-Forwarded-Encrypted: i=1; AJvYcCXwgtD9ZOaPzW8+IIJqak0O2PgUaGxO6VJqMA4wU69jOMjK6qJ16oaOJbXZtT9Y2FSnhwPTCMKQ8nzEkOA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw81rxW9Q5x1BAJs3tQKS/I8PQHO68HBvU5Y7hTxbO1kibxKM/Z
	xg3gKkclNgVzivwQdLJDG6fMsvOEIWLzejUv0wPXk0oopjBzzPvt5MkQL6Mvhiknitih7jiMoIk
	rKgI1zp3vcfynA7kjoxLUK/km8TBemLWxSoRAIg==
X-Gm-Gg: ASbGncsFlQiK1KFQhDiI72YbS7Eh8beTAI6JXDiExPryTQd7Hk+ISvSuCoRNgdFWR0u
	NPITDBVhpk1aaEVlglo04ZL65L2u+iR39mwsIeksRLGY1vJE3M4OuGIx4vI30tMh+U/D4ljWo0S
	cq4ZPKoA08nSlEMrKGA55c5w==
X-Google-Smtp-Source: AGHT+IFglWsLuajUozFpVPnPlBh2TjItDXNHlDH6L4EnWFRw+AziSkdH6rFqHcXtAE7NLHbCAo69n7eu1N1+R9UHYqI=
X-Received: by 2002:a05:651c:54c:b0:30b:c36c:ba96 with SMTP id
 38308e7fff4ca-31071c0b5bamr8409831fa.1.1744701824036; Tue, 15 Apr 2025
 00:23:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325094932.4733-1-hanchunchao@inspur.com>
In-Reply-To: <20250325094932.4733-1-hanchunchao@inspur.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:23:32 +0200
X-Gm-Features: ATxdqUE5jF908PdCkX3CIFaPCBX4_mmXl_uxNevSNqAZQBsFJDSR9NbcxEZF5qo
Message-ID: <CACRpkdbWx5u2RBmZ8bjoV-85b3HmQyWHxxwQ12zx_6pAFPPMUQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: tlmm-test: Fix potential null dereference
 in tlmm kunit test
To: Charles Han <hanchunchao@inspur.com>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 10:49=E2=80=AFAM Charles Han <hanchunchao@inspur.co=
m> wrote:

> kunit_kzalloc() may return a NULL pointer, dereferencing it without
> NULL check may lead to NULL dereference.
> Add a NULL check for grp.
>
> Fixes: c7984dc0a2b9 ("pinctrl: qcom: Add test case for TLMM interrupt han=
dling")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>

Patch applied.

Yours,
Linus Walleij
