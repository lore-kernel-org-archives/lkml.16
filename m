Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFF41372
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 05:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744263288; cv=none; b=q3HB574k6Nb6MkpcTzqkAWBLdNy31maaCbv4mRHPE7jqyQJi4t8CrVBvEFGCrlnfdALdlSoADRlNuIvVlzISHtKrBKzcWnQURsrow/BKRw+qnqvKFBGfrT/G2enlWk9ya+Eq3wTFgqkWNzqbk2bsW3B1+WH4OMZ7rIdszyvzy40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744263288; c=relaxed/simple;
	bh=Afe3pDb5t0o4rs2tProRODrtznX9leQKO5Isy0DI6SQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tF0q6dxKTc5mYLylGPlwYzT4t4JGd7tpI7pjup8dM7+CRFy64vQBgylCDjiMhqZbOYc0MBataa98XNjzqMLvtsqEpGBytvuMSo0sh0ITlrDUQYVZiHyFPi53H0a6PWplmJp/V+XHNIlo6lWfDV3ias/BA/qUiZMI0YaGVSu6P0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f+ttX4NS; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f+ttX4NS"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54acc04516cso512753e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 22:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744263284; x=1744868084; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LS9cXKaropXzeVH//TMB76La9FmI0OUrS3KtKoQRooI=;
        b=f+ttX4NSwvFIqaikFzUVciBRJZELxMbA9IdrLDoQLA0JBnknYF9/uPO9v8EMEwLPMw
         udCMx6ypA79cRQ9xg9L3Np9K4dn6Eb7a3SB6YiZ0oLm0RAyOtoSiMaP41eaopSUQN5iP
         n2gzK3VBgfbEG6/mcQYH1mshPI/1b/keNaPEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744263284; x=1744868084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LS9cXKaropXzeVH//TMB76La9FmI0OUrS3KtKoQRooI=;
        b=iUFVyc/SjIhqo3UE3/9qR4Z+2VZNNrG7SFq5qSg0coGCUM2yaJYZeaGLxQymdZPiRW
         Gb/THVMvZIzL/L5rCrHodtxQdXv+ToQ9K4JqCNKa5w/qaL0M/rX3v58TNFjTR9qe12vP
         iE2IJlKRRD7PlOnPPzYiP2p/prFO2h+TujHb4V/gwByO+/Pzt87Mu8CbAi+8Jx79YiBS
         kL0vATxCb9VCcBC3rv8fU6fnJtNFINx9rDPgl6MGSeArzhFLvi3XumvCFtMQ0gOnqES8
         GQcvUgqfmBbO6dS5EzZ5DKUjEnsiTmF7vdyJzHbPObw0x/ZnSlKEFLgF9YpGy/Sq7ZaE
         OjQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnX9s6ANcWfY49RxFm6Y1DoNHWZ3vWA/bBZFeBaY1eQWDjLEGXrDMsGFVFC9xQBptInNOMFCNsHXsCwNM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7OQuSkacC0oqI9OTbdcsZQiBur5QEyU9DRvtckAy/9W/o0/3C
	Wt0Qb3efIzcSv3nGC8NujdinQLiiD+Ahb7zNM2nKNi2jZgdd5nKsweSxnFBJVyNL+Nk8gck6pwM
	TPQ==
X-Gm-Gg: ASbGncuxLjxGZ6pQaTWfoA42tN+Ir3OpZxE5DLM6g3CBfAaJK/l4mHQZ+jEjNP2rGpv
	GMmQKMIjfrNrMBF/RbLa+yYsjAk1R/6FHc9tgN3NtmrXJzwnR8224N7R7JDNIQkjHdb51oyhsBi
	wKYE+IIP695pvsCO4cYDGQwPOh9XED9X1UgzQCO8O/ZG/DPxzzoxVNEBfzLXmsoO+4Gz1aXpzZ3
	zQXTr07xHvJiEqBIzsnslveQ6L73aLS2k3Jt81kGA05XPlYdOOrWHpDuwGOsUpbjBYzl5D2NNzf
	CkwucHJ1n8pNlrzjC2Q9W8y4sqOFlKOv6LE3jLoFXwuz0FkztKCczupiFmOishFUvtS0usC8MjO
	+kGJvwEY=
X-Google-Smtp-Source: AGHT+IE5W/FeBKjgpxFcnqrDjGi9/iRIXRzbYQMJMaHPhb5DxtKt06pNAijdLheOJtMKzjqhym0+TQ==
X-Received: by 2002:a05:6512:1318:b0:549:7c13:e88a with SMTP id 2adb3069b0e04-54caf5aeaf5mr401742e87.17.1744263284328;
        Wed, 09 Apr 2025 22:34:44 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d50265fsm45801e87.138.2025.04.09.22.34.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 22:34:43 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3061513d353so4414441fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 22:34:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXswbLUpE/lEX8SLgZhxrDX8hte86AXMjAoMEwzKD1RBi2tSAotww1f0qSbHwDg6QNEkVIiCcoqN4m/Qo4=@vger.kernel.org
X-Received: by 2002:a2e:ad92:0:b0:30b:b204:6b98 with SMTP id
 38308e7fff4ca-30facc05999mr4595191fa.12.1744263282519; Wed, 09 Apr 2025
 22:34:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409-spx-v2-1-168115798db2@chromium.org> <Z_bbHP3JeRh2hLe2@pampelmuse>
In-Reply-To: <Z_bbHP3JeRh2hLe2@pampelmuse>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 10 Apr 2025 07:34:29 +0200
X-Gmail-Original-Message-ID: <CANiDSCvLartP0qB1WN0AaqJ3KP+aOhw0KcPGMK4oKx=QpjV-DA@mail.gmail.com>
X-Gm-Features: ATxdqUEcVfEw1mbLR_8L-wMlr9qoBejpAVty9izlFJ8_hg7ZVdQTWb1suwjnMNA
Message-ID: <CANiDSCvLartP0qB1WN0AaqJ3KP+aOhw0KcPGMK4oKx=QpjV-DA@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/spdxcheck: Limit the scope of git.Repo
To: Gon Solo <gonsolo@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-spdx@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Apr 2025 at 22:40, Gon Solo <gonsolo@gmail.com> wrote:
>
> Am Wed, Apr 09, 2025 at 08:04:19PM +0000 schrieb Ricardo Ribalda:
> > Changes in v2:
> > - Make repo a local variable
> > - Link to v1: https://lore.kernel.org/r/20250225-spx-v1-1-e935b27eb80d@chromium.org
>
> This is not necessary as it was Python's fault and is fixed by 3.13.3
> which came out yesterday. I just checked.

It will take some time before this reaches all distributions. This
patch is relatively simple.

I might be biased, but I think the benefits outweigh the cons.

>


-- 
Ricardo Ribalda
