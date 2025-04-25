Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED442914
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745540043; cv=none; b=iAQ/Sko6o2w/LpG4lbQaLnDgIGNtQFDTqkKZ89OSseYWOXdJCS+YfDYMBRX2iExLuzf/51wGpraIyKdbx2S9J44mpSKUvwHF7yScB3Oo14wShGFeUyEoHwE0I7AAiwJxQxRf0iZq0YnmYtI9UIGvowaJ93xNR1Wtc/vNbw18+8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745540043; c=relaxed/simple;
	bh=xrVUCjHF2GDru78rE0oor9FuAl7jfx+3P3yczM92YEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BDrN677L2zjju73XH1cNTBGG4xBv4FfEooF8F+za5B44FPYhhayv8APhiNC393FkS7jC64fWHjcr57LgCa8XIFvDIrFerz6+72kCyxJ+beg9JG/NEIIGI/pZOlKptsmdc//ivvTt0dVSgiyjzBGtgXwAzpC3bG1nCBXReNIRsT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XgFoyDs+; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XgFoyDs+"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so1802036e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745540040; x=1746144840; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weepQ3o3E6eVKCjaxY3CTZ3gGB6j9iWw3wdfeMK8HxI=;
        b=XgFoyDs+8KxX8ZClimhGGs6GrlgX6SkMv/innosc12qO+spCWfODN2e/bC2EqnyvfR
         oxnTmBB0NPzVEWxZe9lM7SwekXrg3f/JCcIGxZW72QlJyvKHn4MJTjP45w5RfZvIsTu1
         +I7LKBFNayY9zp5BwAEMWfhjgV2V60U8fMZnJO+ac8kXZVptli4MdQPajCiGCGyO1q97
         XSLfjDHhElWo/0wDt3EMnpqcbwlzUZ5sh8qkoeNb7qDv+3yBEQ3b58Fl5vy7OYo9XHHn
         Oyd7jtH4LoioQMJXu+kkMqSWp9kVRf2Z0BY+k7vSB98xTd5N6vw0Vl1k6DjBnsedWKXa
         eZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745540040; x=1746144840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weepQ3o3E6eVKCjaxY3CTZ3gGB6j9iWw3wdfeMK8HxI=;
        b=DbdzUvcTYVoQqNGaMs08IkDVYlD5wPuUVUMXDjqJDLEMWfUN/D+tF7CzvEzNsYXn0I
         US7QOeXPIVi1AAkP90RoA8Z2E16BnLSxMknumEODCHnc3aRdR52KoayYQzm2VZk4v+ku
         XLzLIZchXA4HC61hlcBF4iWpKVqggAaI7d63qLt1oGM46CsFEVzcph+ryknZ4de22mNR
         iY5JTUp76qumPPtYYFo2tdvb5+jVbdL/gVKByskg0WNaBQHLfJwjw2Jy9pgtLOGcWpWE
         jZ2cnci3zJxYY84+ul11K/3y0JIzegvvaudzl2W9FUa0WFAs2nNpN0cvC5eoe47df5HQ
         +nxA==
X-Forwarded-Encrypted: i=1; AJvYcCUAFWAysW1uFeIq40cavKYNhxdd6NSwtAa/XiriSyf6mmFHpWvu2Z1iq4sKCR1i2gOYQsA4Q9sThz947qQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxovC0BGW1XAFBjd2+ndHhdfRvmDYlxX6uxNbw790DF/nn4hObx
	yEf27QKrBmToKy574L84/7IwMm0irG238JRJDt0g/zPu9zw3UgE03bzCHDxn0tZJC0/ffxBCjfJ
	EmDaxLgs4IQ/k7dTAYvrmqtjCCsShSMF5VM8=
X-Gm-Gg: ASbGncsYNBgdF3qbUBBRdbg+nrr0PIJDrvqhdJDfaBHNgbI1znQtbW1bhFAir2HZaHF
	9oKwTJ19uTbZ2tKfdDlH+7udWRd6UwcMFKoO0tFLrw/nKUsC6xaGEvkV1dJt+t2gPNrNKfcKSux
	YZmxae0FNu2jzakeIA9Z0aBkWgJTb0g0OSGeMvJVD+0kwLeCk1CHDqHMFxE5w1K2w=
X-Google-Smtp-Source: AGHT+IFupDhtk787UYFC+m51vWARrrW+g3qeY1nzKmRJUOvJStBMU1HIyqroJk5ca7MURfz+ouovj/qgbuHigNDZtwA=
X-Received: by 2002:a05:6512:ac5:b0:545:2871:7cd5 with SMTP id
 2adb3069b0e04-54e8cbce2bamr107809e87.15.1745540039297; Thu, 24 Apr 2025
 17:13:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422191939.555963-1-jkangas@redhat.com> <20250422191939.555963-3-jkangas@redhat.com>
 <20250424-sassy-cunning-pillbug-ffde51@houat>
In-Reply-To: <20250424-sassy-cunning-pillbug-ffde51@houat>
From: John Stultz <jstultz@google.com>
Date: Thu, 24 Apr 2025 17:13:47 -0700
X-Gm-Features: ATxdqUEd-WZkBCWlXClEEov2Vu7arSm9wmBJpDM85wdm6VobmqGM8s292rnkW9E
Message-ID: <CANDhNCqfsUbN3aavAH5hi4wdcKuUkjLX4jqhKzy-q+jCEqpoow@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Give default CMA heap a fixed name
To: Maxime Ripard <mripard@kernel.org>
Cc: Jared Kangas <jkangas@redhat.com>, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, tjmercier@google.com, 
	christian.koenig@amd.com, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 1:34=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Tue, Apr 22, 2025 at 12:19:39PM -0700, Jared Kangas wrote:
> > @@ -22,6 +22,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/vmalloc.h>
> >
> > +#define DEFAULT_CMA_NAME "default_cma"
>
> I appreciate this is kind of bikeshed-color territory, but I think "cma"
> would be a better option here. There's nothing "default" about it.

I disagree.  It very much is "default" as it's returning the
dma_contiguous_default_area.

There can be multiple CMA areas, and out of tree, vendors do reserve
separate areas for specific purposes, exposing multiple CMA dmabuf
heaps.
There have been patches to expose multiple CMA heaps, but with no
upstream drivers using those purpose specific regions, we haven't
taken them yet.
I do hope as the drivers that utilize these purpose focused heaps go
upstream, we can add that logic, so I think being specific that this
is default CMA is a good idea.

thanks
-john
