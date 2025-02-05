Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1823155747
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 14:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738765472; cv=none; b=kAl+LHw4axBQbtTOE41qgpaVy8zhX5l0I1haAwVmYDr30RF8lI8O/XhiDFe6sdtA1lO8bi/NF0Kb/CBoOJoCnjNA6YkHjAJdihCvi2VFD2+mFdbEVm4g3Tqb/pAHIaVjwnM/phNilcA5Y0lpAb4dFqiw4xQluY3/RrMWGk9XMrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738765472; c=relaxed/simple;
	bh=Ld1oYj72iOoIU8GaSocADZfs7sr+ubrQTaVt3aghNVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MCioeuZIzaXxJlXEnyT520xFwrAVCeLrDgrIsyTLzdleXj2Vpcd0UFZzw+B5OXe6siM5k94lqxvwf4/S9C/2K8LySpJQSh9LrjTeBnKAiNjDthVyeoa5cQjbgxCJ6A3U2ti3jQO0cUJXoBizEhb/2zBHCVtDY6QdlK+fWYmwbPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=SvHeIoRz; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="SvHeIoRz"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7be3f230436so588268985a.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 06:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1738765469; x=1739370269; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ld1oYj72iOoIU8GaSocADZfs7sr+ubrQTaVt3aghNVU=;
        b=SvHeIoRznCdAJsdztbOcXuXYZBiavHoBhYAnB0sDzizEK6Bas7G511je6c3IGV8F4j
         JKoS8DspsJ5lP2YHF1PySr5s6y9VdmTR9VccG0yLRD0xe9quA1lcCpaUyJDGCm913nuA
         BywSVzLU8uO2FJYF8FtUz4xXQozI8vTqRaIfN4HaO4sIidRAmfmkUgNVv1hORDjaXqsZ
         X/qqAXhRH9ZC4a5qNpLkHDmf+00SatlWh4a4u3AVCTya2IbNnfkdWEB7lE+1DHfIQaak
         kwbFdFFL1cdx4IOT2O6e57lBFYcLF74ZUNlkfhG7KNO9ZFGPXLkeQ3L4HdGy0T7Ekw8D
         02kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738765469; x=1739370269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ld1oYj72iOoIU8GaSocADZfs7sr+ubrQTaVt3aghNVU=;
        b=AWukTSDlXiBQwfTgQ7vXMR0P08utGvvZnuKeoeNJ2laRPSzKiIVWymBFdEUZmtyJLy
         JVdIm4eTS1PCGfBxmJN1bsuC/pYFW66frHGDR6aJ66WKS2KJePZ86rxWocZ1vqhWy1MO
         87ilwwgWyPWULOMKLRgdEmAsOffOMWIZnOQfHAQxW1J31l0lATqFF5FD47LlVllQobJL
         p2dLugkY9Jvrwo0fyTU+ivO68Wz8/sdg9Ytw0/ou7SBBHPDKCdNZf4O9+96/ufFV7YeN
         oIFksCHCBRJkPgaCtcFIRQB5BsQl2+s0lNu81FPQpCziJhhySlOZIT4QtPBigJBbRJOG
         v6pw==
X-Forwarded-Encrypted: i=1; AJvYcCXIlpdr2Nm/jOUmQUcqQ9A7ksYWuEz4rJ8KA5Qt/35/KHqUOG7j9cXqPACXy+2NF0+spgf/qJyad1XaVRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeM3s4JDF0+wpykN9owvuwO4xhZL7tAX9HTF/LYS0/g1IumYiY
	x9NUaHVNri/e0ugDR7I/pEHxotFtHPjBdgxBk7LxyFw+UIctcp6JCkomxOSHAaF08+l0lsYPhlS
	4KYeTuFc4F57qCFZSjfz2+YUbKis0zxOr+nHD3g==
X-Gm-Gg: ASbGncvXga32PPelEaLnwMDn+o7CTQbOhaJK9L3hCh6Z5DOejyLIJupogg5BvnZf5/N
	Flf/7s/F/JDX/jX0PTnMH4q2nwguHWxvY1gQtKjfrwl4Ejz1CROQmmXD0nfjRcwa7MZmdSg==
X-Google-Smtp-Source: AGHT+IFPR0OeA9uoeQPLRJ/PVeOESSKUd48c4NvqLCM7ceOkwPl/SNrIh5YGHdKirT6M9x5TaHEttfB2XqRT50R5zH0=
X-Received: by 2002:a05:620a:2726:b0:7b1:527f:cf4f with SMTP id
 af79cd13be357-7c03a035203mr396153785a.42.1738765469402; Wed, 05 Feb 2025
 06:24:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205134811.2002718-1-vignesh.raman@collabora.com>
In-Reply-To: <20250205134811.2002718-1-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 5 Feb 2025 14:24:18 +0000
X-Gm-Features: AWEUYZktRsUSSGoFW48lG4Mw2z0zY_bip7FAmQz944mGwxXuWjZNSfIAfUeHsAk
Message-ID: <CAPj87rPREj3hJmjuhQRd1Tzxt8fk6rsa8Qv5xoHx97LuzwgYrw@mail.gmail.com>
Subject: Re: [PATCH v1] MAINTAINERS: Update drm/ci maintainers
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, simona.vetter@ffwll.ch, 
	robdclark@gmail.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
	jani.nikula@linux.intel.com, dmitry.baryshkov@linaro.org, mripard@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Feb 2025 at 13:48, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> Update drm/ci maintainer entries:
>
> * Add myself as drm/ci maintainer.
> * Update Helen's email address.

Acked-by: Daniel Stone <daniels@collabora.com>
