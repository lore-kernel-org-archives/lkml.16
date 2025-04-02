Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ADBF4E2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 08:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743581867; cv=none; b=i5d/F5kehJCqI8lMPb/stxc56LCqXPL/Hbpw7amhj2jBPRO1AXR/JR/YLN6rBG46KxSGGgJxD+0E7h9Bo1vbdNy7hvnEX7xrfUfKGviCYqbA7daF2ZWGbd/4yYgisn/m8iq5agL8N32wOd1oTZ9ltg0V8ONHV+IvsPDm04XKtb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743581867; c=relaxed/simple;
	bh=0q+S1hyB2bD2iYxcKQW4K5H0rWMVwEzHTrltKS/Se9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+gi+MG2LwE1PN8t5NU1GysfFlFj90mgSNZvHx3ODbemZjdtUibcSZSAj4Ub9/gjLch3SXDCgZI/VO9LYeJeHHeJQQ+TXaMU9O3oVLXxKFl5TOQBdxPKzuLoltt7MdtrlqLaGjXszDrEJLegOsFLPUnDjISkKvytrkWGc1h+Ghw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bbAsompa; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bbAsompa"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-223f4c06e9fso12203045ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 01:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743581865; x=1744186665; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iReWBKNHJjwopXjK+8MuckTWWzuTqK2CEkS+IjT3heM=;
        b=bbAsompaPwzrPClUTs7sgciw/KKcEufZjly0gbvdFxDMN/k+nkK+CU3bbWH3Hc3BGh
         4sgehhlWuy4m3QRY+TdstMaON1XtoFi+2drSgNxPhH75ioftivQYpk4nMUH4GSBIsFdN
         BAAUBaLOvah26tRFgqhb46nAkIrab+LsGU3UlnSdRNO+9JPB3+ywSUQkoP5gb9IPQeMg
         97Bzk2ro1Dp6JmG/N0T9IpVmy+sXXR3C1SPHqOkdjeiLOIE93jgXi0G/6SuirYqIF81U
         R+PSVBTnhBPYZ3kTM6GfvelabPvvVnA3h2lMLdnxvj0Zp+AKUD4iqGopc+qDvwd2e45a
         0WRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743581865; x=1744186665;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iReWBKNHJjwopXjK+8MuckTWWzuTqK2CEkS+IjT3heM=;
        b=NVwKCC12Gj8Jc7UvfOFleI/g5XGwgN5Zw8/Xqc35pruyXufKDIjA63Z4ITZyx5mLYB
         FDEFhxC7jKypJKhjKS470X8s/HqiaaoLejIZGWNp2/o0JQNYDPMsKB1ZIMPZbxRSnpC5
         Frw3fCwxiq8GFdMSD7YzhUiLspien5DPN/DFlVjoaGBauY+3cOqfqqyUkcFpAVgDMhsr
         MAXPJHItOJlXtLDRjkeg7IwiiAga9QTjEEUjicn8YQNDI65K9KJRS48fWACFZySkXPH3
         yvk8aunNFdlOYUsPt+d2jjN/T0QWBAE7sG5UP19lL0iAbdyIcbWEXQMcQse3MUwcUWSU
         1WHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmhCF3x9f368vLO2Z/WuUeF1lfqu9ii4hfcuECpu+H3BrqMzwCN/EIDq7hS6CGX9GQp91istPfRvsTJ4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbtLb17COp8sQNo5q3HD4Y7fqLrnCuUR5KhD+09G2xz/+yr4Nz
	N2IZOOl6AUcO1fLCfzB8+3ZEBA1oAXqKQKJP8BiUln01vxvwt/Cxo2l9jMl+LJ1YDnHinHnXdSJ
	3iqpDJmD3IBnEyvrRVCUaGUc2obnAIzVbPT7usw==
X-Gm-Gg: ASbGncvXfrtLfzzXfgiDd62JXHA4fomKyIBQexGkZRW40OCHzLzs9CdnsSizCD1ETeO
	j6cb01NtYj/uCk8dJyOvmiBYfdImZwHB2/vBmzIIdqyla7uYU36hLjULfQ1JfX2X7WsJVhUlTXh
	nlYuzDw7SwaN0/X6iiO0HN4qbxYhY=
X-Google-Smtp-Source: AGHT+IEuDyAtb3J035y+ewvbAOiSkrMUX4Bvbz2hxthwagxAZwB2X+VCBgOccBZJT6A84W8a4x1DNPMed8dqnvNjtK4=
X-Received: by 2002:a17:903:41cc:b0:223:517a:d5a9 with SMTP id
 d9443c01a7336-2296df23507mr15163485ad.15.1743581865407; Wed, 02 Apr 2025
 01:17:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401014210.2576993-1-jie.gan@oss.qualcomm.com>
 <470e4a90-41c3-4974-a4d7-3073a7fcc737@arm.com> <CAJ9a7VinQSx9FYvw4ww0KQgMqapLhWTaU9D2qcc-120YywUu2Q@mail.gmail.com>
 <92dc9b50-5e58-4cfd-a78c-e32a4bec8e26@quicinc.com>
In-Reply-To: <92dc9b50-5e58-4cfd-a78c-e32a4bec8e26@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 2 Apr 2025 09:17:31 +0100
X-Gm-Features: AQ5f1JqACQ7YzdMw4Wc1Q8A3QYmI1HCNj3Ligt1dvD-z-qjoAaOVowy7RgvRkgY
Message-ID: <CAJ9a7Vjhm5B=3mDHQpuRj2JSE1hfYzOx5wq-yQcC3k+QqEcvAQ@mail.gmail.com>
Subject: Re: [PATCH] coresight: fix the wrong type of the trace_id in coresight_path
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Jinlong Mao <quic_jinlmao@quicinc.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, 2 Apr 2025 at 01:50, Jie Gan <quic_jiegan@quicinc.com> wrote:
>
>
>
> On 4/1/2025 5:56 PM, Mike Leach wrote:
> > Hi,
> >
> > On Tue, 1 Apr 2025 at 07:11, Anshuman Khandual
> > <anshuman.khandual@arm.com> wrote:
> >>
> >> On 4/1/25 07:12, Jie Gan wrote:
> >>> The trace_id in coresight_path may contain an error number which means a
> >>> negative integer, but the current type of the trace_id is u8. Change the
> >>> type to int to fix it.
> >>>
> >>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> >>> Fixes: 3c03c49b2fa5 ("Coresight: Introduce a new struct coresight_path")
> >>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> >>
> >> LGTM
> >>
> >> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> >>
> >>> ---
> >>>   include/linux/coresight.h | 2 +-
> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> >>> index d79a242b271d..c2bf10c43e7c 100644
> >>> --- a/include/linux/coresight.h
> >>> +++ b/include/linux/coresight.h
> >>> @@ -337,7 +337,7 @@ static struct coresight_dev_list (var) = {                                \
> >>>    */
> >>>   struct coresight_path {
> >>>        struct list_head        path_list;
> >>> -     u8                      trace_id;
> >>> +     int                     trace_id;
> >>>   };
> >>>
> >>>   enum cs_mode {
> >
> > There are many places in the Coresight drivers that assign a u8
> > traceid from the path trace ID.
> >
> > e.g.
> > In coresight-etm4x-core.c : etm4_enable_perf()
> >
> > drvdata->trcid = path->trace_id;
> >
> > drvdata->trcid is defined as a u8  - the reason being trace IDs are
> > 128 bits wide with some reserved values.
> >
> > Will this not just trigger the same issue if path->trace_id is changed
> > to an int? Even if not it is inconsistent handling of the trace ID
> > values.
> >
> > Trace ID errors should be handled by returning an invalid trace ID
> > value - were the trace ID value will fail the macro
> > IS_VALID_CS_TRACE_ID(), or separate the return of a trace ID from an
> > error return in a function.
> >
>
> Hi Mike,
>
> The path->trace_id is verified after it has been assigned with the logic
> you mentioned:
>
> if (!IS_VALID_CS_TRACE_ID(path->trace_id))
>         goto err_path;
>
> So it should be safe to assign to another u8 parameter, like you mentioned:
>
> In coresight-etm4x-core.c : etm4_enable_perf()
>
> drvdata->trcid = path->trace_id;
>

It is safe but will it not trigger a warning just like the one you are
trying to fix as the types are mismatched?

Mike

> Thanks,
> Jie
>
>
> > Regards
> >
> > Mike
> >
> >
> >
> > --
> > Mike Leach
> > Principal Engineer, ARM Ltd.
> > Manchester Design Centre. UK
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
