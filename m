Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C254C92
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747651074; cv=none; b=JC+d2zFsSKM0XwLXBJpKN4bI7OxnxrI44gCvNVb7VIFO1NN9iYSfz1/Z5xAEtPPsgjXHvLDjIdaxPqGMrOE9od356Lov647BwB3ZgAKMovYC+GGCV//3dEjGOyCI3HGRxRw4TZmyFImmP4xx6ltFWnQ0g0fiX0y43y0v0bEVkKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747651074; c=relaxed/simple;
	bh=uLUsUinTMdjmLW5wpU4q/NnLHv21b+lbzGHwrlwL4dk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IqKMME3RSASNhQk1ays8Lfl3QoyE+adCb0Ogn/rC9oUWGfBjj/Zr9M4fToHQML+ReoX633fJWQiUeNpl/AyWit7AFn7JSwNcGy3eaZpipU3CjGtOQInQ+wW0vimyd3Df/+tejjRG+slsvPSkEeANYjn0TsceB+hJg3nqqI7AxHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=ZiOo8jr1; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="ZiOo8jr1"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-476ac73c76fso62527491cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1747651071; x=1748255871; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uLUsUinTMdjmLW5wpU4q/NnLHv21b+lbzGHwrlwL4dk=;
        b=ZiOo8jr17u6jnVDGpiqO/C0Ldqxp0nyMkchr/GZ4mdrx2X6HJDPS/ZKmSr3EmeO1GM
         I0j+5OGebQ5DM6GjOLPgD6Ud0Eld1qEHyPkpepTGKImivF8KtZTwLYXgsV3+Vdzxlcw5
         VF79hQ7g4tMA1FKzHhLKP/IJ4mkbPM0iSPCe5hg+WDpw5Z/k75DyxB9ZQX9ubUKi5QB+
         RT63IEJPsIY4sbmy0hlRvojwq87VPFF8Ge7Pfqv/j8Fndu7GujyJFY6Ur07aKkD393+z
         7LSBNMVr7uNtA9yBpnW9CGMzIS+zfIwLDsUIBKEAguzp0Gzqr9d8lPw1BPFBc/EzXfUJ
         iuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747651071; x=1748255871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLUsUinTMdjmLW5wpU4q/NnLHv21b+lbzGHwrlwL4dk=;
        b=rKd0v0s6WBLslKPYLPWaB+ZF+VuFfqsb8imL6m2x1jSVUucr2WpXxw6bna0ahW+lUI
         UCLGGcFL+1WWDefNaL8YQRrkdtia4GmrMhsaIYBsdl9/E7aXK/CSjisgVU3zxtKoeS3z
         DbiY7W8S8actk1aOUDnhLf1Wo8i/9NuZO25Fn2vhZujJW3VCS4OpQIX9wjnO/Ba9wEVz
         umkcEgtsyjtvbpT5EWzt034Mn5dQNFpa6gBLio/WVJL6zMu2X2bRycJYQ7mVootwmaYU
         f7w18qTVlLOhAFv4KODAl1eN+KZHP7zMFp7FRJWo5nrWj1ueKxFxYk5wiyZIhhpNHZZg
         jcrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpkBofgZGSq+T5XVy5Tq3gWViLMblbz+OZapc87/h1m/+n+BL/mFqd6ZR3JxT8OejVu6XAi3ripf1kJlU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo7TGZL4V3xEEiGsrY0OLMRhwisV5DbxEg6zM0ju1zXcdc01Ci
	Dufvq0EWRCNkennQcqoCJYGJwlTc6cdfJ8yNXcOkB1qUZ+sW6cNCQcXt2wdZgogx+VR25Cd7NmV
	XhRaLcqO80DXuhOBQVJ0VpxPUwBG60iRm+u5/CgUDxQ==
X-Gm-Gg: ASbGncsTc7oPsmPGbWZLy5x4x+qUCRoqeCSk2lQwVyFTyxDDHzgIiqaDPeejAvMJT2l
	RKoIvqS+1KKUlYHgs3ZieQ++yJPgz95eTXwwCCzSevzxItw4VslCWUkh46Ya70twhFSEnOb64QX
	m/6mh8tfxcXn6BRihDYwl5nWE9HZ5gk+w=
X-Google-Smtp-Source: AGHT+IHpoUyld3bWH/ccuYhs5XzdWrCcsdpq7tt7nhCOmlUkWwsRYL1EjQOis7dWQLywSekRjLeCOO/84Vo4YpYBUNY=
X-Received: by 2002:a05:622a:343:b0:480:7147:1998 with SMTP id
 d75a77b69052e-494ae3d017bmr155270341cf.22.1747651070647; Mon, 19 May 2025
 03:37:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514050340.1418448-1-vignesh.raman@collabora.com>
In-Reply-To: <20250514050340.1418448-1-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 19 May 2025 11:37:39 +0100
X-Gm-Features: AX0GCFseuNxg2cyB31Kw8bdxaPv3D0EAGzhfq8OnlO6TTPxanjeFtSt3PM_LQL0
Message-ID: <CAPj87rMR9C4bgZBPhu=Pm7E-kqszt=GPQdnt4tCn_8-QqQAx=w@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] drm/ci: mesa uprev and python-artifacts fixes
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch, 
	robdclark@gmail.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
	lumag@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	quic_abhinavk@quicinc.com, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Vignesh,

On Wed, 14 May 2025 at 06:04, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> The python-artifacts job has a timeout of 10 minutes, which causes
> build failures as it was unable to clone the repository within the
> specified limits. Set GIT_DEPTH to 10 to speed up cloning and avoid
> build failures due to timeouts when fetching the full repository.
>
> The current s3cp stopped working after the migration. Update to the
> latest mesa and ci-templates to get s3cp working again and adapt to
> recent changes in mesa-ci.

I thought I already did this, sorry; the series is:
Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
