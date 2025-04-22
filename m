Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973D72BF3C2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 22:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745360586; cv=none; b=aZTNAgvHwFL5IoCRRxECPaA6eL6RzfgoYEKKuAenfZWLo8XS9TJ37KcxTAQsaQnbmIgh+N+WlLvW5Q2FS2julHFmjkyD6urVUC82QLTITtD9ErF547vaHKiHN5EZ7+UPSPJ6Pdhx4VfCuJUjy7W8wvTCR+v5iKV83mDYOvyIT0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745360586; c=relaxed/simple;
	bh=e2uRwWrb8ebhkycf61ed5XHbka2o5yaZh1hlxBkjDhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m3+/ZU6C0ZPP7Nkd4Ft8mbCZiCFoou897zQlJQFkEQecCTiJBtJey7wGWXG6j4Ooi/z1PGFmxz5GAzZ7+QjSaFEJjNj4iOjchSSl1ecRZ7brcovQ34Dxvdq8kzVijozmjtKawnnKT5opBKmnd9uKIzFdoLSvJK5dVceeqG5LN5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jEO23b0W; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jEO23b0W"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30db1bc464dso55321911fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745360583; x=1745965383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2uRwWrb8ebhkycf61ed5XHbka2o5yaZh1hlxBkjDhc=;
        b=jEO23b0WVqe76hU2A4ZzLru2kUgZ4k45WEDovoqlJUD5tIrmxp3QiCpwCamYoVMlEq
         H9nTEB54qEtTaGx7KmAPCTRBeVNhTq6ANRPZ6W2v7wKK06A9fe4+oZGzEzgK/JcjrXS+
         T3tkPEnsuVbq7CcrM0dZM6bU/jTM8xY258VC+8wLuGZMSuJqGYuHBN09MSYdGj2P+WMM
         svvUe+I99pYmKxXLRDDTCkxf+eIN2k2mfSo1zVZneoMwXIQYuezHR+ZkCsefxOMhK7FR
         TzwNZf5oBDO2Kt4bDf7ydjqkfLJP8vK60exG/EnSYsLY2J7pAWIvWIqGpByUOgb/CuD9
         7Yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745360583; x=1745965383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2uRwWrb8ebhkycf61ed5XHbka2o5yaZh1hlxBkjDhc=;
        b=Dq9dc6DpunGsgUYxGCouQrk4M6YAnsD8xFDiQZXujTMK790xL4kk2Aw748p7mxvs4L
         frSuUmkr5BR5pCHImd+iP//oCOvGIR+EoTtl4HrJ3YWAP77ttUw/W6kLlr02du4u+gVa
         A8Ijg7DalCF5kQAbK/kbwj/uceVb5EiehjqcJSdUj5drg87A0ATsM/NV2rEttMP0z1a1
         D3y405/lh45CCt8OzGNeTx4cc558oGBkZH0fK+9QLimaX7ZXyj9Ivl9YTOzzso0GTPOo
         yyTjoSSP5/f4EggA36JuAVG3qPrfrOQOUg0L1oH+5d5NKMlQ/sA6dHssbKtuIu8dXjTk
         T6Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVNK75i6i+vBFYt88LNOW5GSeFJAAcL2AmwA8pPceXGUn2h3fLp/aI/p1FOwAsYRi95t0+WNWFBVBZTIjI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2UpGzfu41P4z0NVdrqTj88zMsS7ItFo9SzPdVG6zztwVwFdi0
	F785YOoxldgRiITe8W22naCiJZBm+Ly7m+kNdJ388BwaLmRo5xHK+7uoP+H3qCFNYO1DWhYkZtv
	BSkyCXfPrUOAO2xG5mmuMqQm5A4/jiXj3jco=
X-Gm-Gg: ASbGncveLq/BhgWsQp8QFyhafudWEq43lr5L8ANXU5Mj4mVUT33gr+8mw+wSKqui98p
	uDtfFz2LTQ4XxVDJCDIzmc4uQ9kyrWnsIeVzw+adG7nRdtnqTMb/fZ2Z+oajsXtfD7t6LNpZmQZ
	lTiUGi/oCGL1ZrbtNI6uMCi3qejtY+ZqqwxZDiR0nWYAY+N8qPoHcsySUreWgw
X-Google-Smtp-Source: AGHT+IGrB/MiyfMTsIh+vYbWS/FNQhnUERjXD1nH9PAly6Ako+aVzVIOOf/PQlHpqWj+hJ7n2hzR9xaSmnbnValKnS0=
X-Received: by 2002:a2e:bea1:0:b0:30b:f24a:651a with SMTP id
 38308e7fff4ca-310904c626dmr45311251fa.5.1745360582583; Tue, 22 Apr 2025
 15:23:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422191939.555963-1-jkangas@redhat.com> <20250422191939.555963-2-jkangas@redhat.com>
In-Reply-To: <20250422191939.555963-2-jkangas@redhat.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 22 Apr 2025 15:22:50 -0700
X-Gm-Features: ATxdqUFD0eE26rdQ7w42uNdNNlbQHNUlvuTnoRS4o--E4bvf8dH1hzjOR3S0oaE
Message-ID: <CANDhNCpqSeSUkV2QvgLW3JY+Tsf_UOBjBrn4vBkYf+dvbtq2wQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dma-buf: heaps: Parameterize heap name in __add_cma_heap()
To: Jared Kangas <jkangas@redhat.com>
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
	Brian.Starkey@arm.com, tjmercier@google.com, christian.koenig@amd.com, 
	mripard@kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 12:19=E2=80=AFPM Jared Kangas <jkangas@redhat.com> =
wrote:
>
> Prepare for the introduction of a fixed-name CMA heap by replacing the
> unused void pointer parameter in __add_cma_heap() with the heap name.
>
> Signed-off-by: Jared Kangas <jkangas@redhat.com>

Thanks so much for taking this effort on. Looks good to me!

Acked-by: John Stultz <jstultz@google.com>
