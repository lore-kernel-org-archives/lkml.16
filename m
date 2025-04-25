Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076B8218ADE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745594760; cv=none; b=iTRV2Ly1KxKXL9mxk4nnP7oWDHcaLyOJuI9bqgQaLrhELoifiejF3Bt4oXEjDiDRKOg+1PA0TOVLBB1lpiQMadxtApnpGH2Hab3/cCx99gV3FgCjRphgn+RG/NRJTxc48np7yJ7v+PEO1t2GmfgLEqTXIp4sEhNXqJVDWDFq3Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745594760; c=relaxed/simple;
	bh=l6PfwDEF+ySZXDsa6ShqQORIy/iiP8Vyai8V4qClOrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qrGbbjr/G8YQyLKI/7SFFN2U2c04izDQ08v2AqUjJv31fR2g7WhI4hFerbtUBHsCufBmx8BmIRHq9NlPi3ulgJAY9q5yxubs7vuIaNALVVDOO+ItbXggUCyRjkt+TY9PvLGvCLNKnFLTpVVRofXDIOrDl3VUtMwU12PdHRpK0cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bCaTDKVu; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bCaTDKVu"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso2541981b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745594758; x=1746199558; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SFMfmyje2Ay7PUB1MUIQLu/sa8uRRcfjUmehOtjPqDY=;
        b=bCaTDKVukjjdfc2pFblnqmEpTJONg2WyF7V5cMDwt3rsQBYMBJPkqgWtIHThctfWby
         guwBrunoU8mhtVO8yLL8MZV2lRPNHM+tfl6G4kRSQr9yVh6y1X+i5rj+92dZcu2i7kse
         D8Q0ppP7hopvjWagTXQIH2Hw/Amk4jOeC+DRZS8nggPyJsxsasBT0IkGa+cfG7v3LPpb
         Fp35rxR1T3XzHulbtlm1bVkUded7BFPtaA7dCoMTQ4eGuPZGmM9hT9oMRiMxTdT9+you
         7GYjroHx1OXMnfZJp2+47jWumMq9IHacVxXliQYjZhRNQvusOLs4YyXpYAySthUgSRPE
         nGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745594758; x=1746199558;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFMfmyje2Ay7PUB1MUIQLu/sa8uRRcfjUmehOtjPqDY=;
        b=r1FO1/3I3Fm2oxcNRq1CLeDsGOSIttSVsY8bFWhN71N3qA6mEKP/OU37GFCovaLSA7
         tFtiwfrAQiXf4mlbeNaOaBfZjlM/Ov6I5AggoSWKTFdTGR6IbJ3wJjXiFq+gFjWJiOo6
         EkekkSjPkEPnvxgpDjoTkPzRj0C7hYtU1kZUUNRVsXm3nWQgN9QGDtTz4tEthOeEGdu8
         AGSTpnfSpRnL7+3hXIapNdxZ4Qk2QluaYFMy5WQxEbgyI+BvEty0yaX1r53Feoe1lyhq
         swFWW31Zhq1a8XTzvk1SjCGyakAjdYCtUFMV0bswvEd3A3aVVusTI4SZ/DuoV5/5Adu2
         ED9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5Z6Q+fYavcaDl+UQDE3DANyi73B4eb1KbjemebPLOnP0RZGTuPu2LwF9kQFZd0wiLWrIcxsfUjm4sLmk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtofg+LiwOIVfCtyLkkWjzjGPbu4Fyv6Uf3GyWQPSJ25D2U8lo
	YutnqMhEMKJdF2+tJtGIRndTOb66MjJ6gu0uZAvvayKjJBirdDgKGtjq89eAghcATqGMEg3vHOE
	45/Unjol4QOdNsCFT1Sgcb1lbHHZ4h1EPRf3/ig==
X-Gm-Gg: ASbGnctJganOw1EhMc+SWadWxY9SvHCTn2/ATaMoYiWvFfE4elrkk4D7WouF166qZvW
	tvf/ZrwqDPgzrIn+BZdi92WY2gnDoR7iOE0FCxsMfNG+V+9uXuDT092ZEkSd0cIPNFpTKEaEKP1
	tATY4cN15LnLJwx6UAVw1NTZFyhKMHZspbbFFflyf+0jdKR2Ivr85ejeo=
X-Google-Smtp-Source: AGHT+IHZt/PvL0IYviSGWGwys58uHHU/qyJ3mVkVbS0ImrXbA+M9ZGv4a48+hBPrudXzjwRv0uMRYoHDKa+TdE0Dyk8=
X-Received: by 2002:a05:6a00:18a6:b0:736:ab1e:7775 with SMTP id
 d2e1a72fcca58-73fc7b51460mr3994796b3a.0.1745594758219; Fri, 25 Apr 2025
 08:25:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408195922.770377-1-yabinc@google.com> <20250408195922.770377-3-yabinc@google.com>
 <358f4a8c-29ad-4e5e-91b9-063f06e769ec@linaro.org>
In-Reply-To: <358f4a8c-29ad-4e5e-91b9-063f06e769ec@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 25 Apr 2025 16:25:46 +0100
X-Gm-Features: ATxdqUG1fmyZ5-PKnBFr3vozBSaptLAsvKtSFIiRksEvaZt8vaft2LpISC3dbm8
Message-ID: <CAJ9a7VigiBrcenP9w84KS21iE8gnB7bGC9Q6ZFF33ZHveu9SEg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] coresight: core: Disable helpers for devices that
 fail to enable
To: James Clark <james.clark@linaro.org>
Cc: Yabin Cui <yabinc@google.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@arm.com>, 
	Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Apr 2025 at 14:51, James Clark <james.clark@linaro.org> wrote:
>
>
>
> On 08/04/2025 8:59 pm, Yabin Cui wrote:
> > When enabling a SINK or LINK type coresight device fails, the
> > associated helpers should be disabled.
> >
> > Signed-off-by: Yabin Cui <yabinc@google.com>
> > Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > ---
> >   drivers/hwtracing/coresight/coresight-core.c | 9 +++++++--
> >   1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> > index fb43ef6a3b1f..a56ba9087538 100644
> > --- a/drivers/hwtracing/coresight/coresight-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-core.c
> > @@ -486,8 +486,10 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
> >                        * that need disabling. Disabling the path here
> >                        * would mean we could disrupt an existing session.
> >                        */
> > -                     if (ret)
> > +                     if (ret) {
> > +                             coresight_disable_helpers(csdev);
>
> Hi Yabin,
>
> Unfortunately coresight_disable_helpers() takes a path pointer now so
> this needs to be updated.
>
> I tested with that change made and it works ok.
>
> >                               goto out;
> > +                     }
> >                       break;
> >               case CORESIGHT_DEV_TYPE_SOURCE:
> >                       /* sources are enabled from either sysFS or Perf */
> > @@ -496,10 +498,13 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
> >                       parent = list_prev_entry(nd, link)->csdev;
> >                       child = list_next_entry(nd, link)->csdev;
> >                       ret = coresight_enable_link(csdev, parent, child, source);
> > -                     if (ret)
> > +                     if (ret) {
> > +                             coresight_disable_helpers(csdev);
> >                               goto err;
> > +                     }
> >                       break;
> >               default:
> > +                     coresight_disable_helpers(csdev);
>
> Minor nit, you could collapse these last two into "goto
> err_disable_helpers" and add another label before err: that disables
> helpers before falling through to err:.
>
> Other than that:
>
> Reviewed-by: James Clark <james.clark@linaro.org>
>
> >                       goto err;
> >               }
> >       }
>

Subject to James' comments -

Reviewed-by: Mike Leach <mike.leach@linaro.org>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
