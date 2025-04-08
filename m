Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB312356D6
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 17:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744131613; cv=none; b=Ys7U0UXt6OCP5IN973GkoskS/KykPA4KxQAXblmaU097ohEQ90bUr5GpsunklhR6xZ3F+1emK8LrTtI8CpKf43ar6yU1ESzm5/3P9aMfWzvSWLJYTrm8axTD/uP3aHBHGLF23TuZ02n18lE3vsbRltNy7zn8p/2Xv/Ao4QVxpiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744131613; c=relaxed/simple;
	bh=SjOuF3EfAG/Cm4uKwVJhwmrygpxq+tAaTnsO4W7wjWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cQuGdVWgr9a8P9ue3ZtcSdVzQIt75b1VFaNW6WptTDO4u6daa8S0/zQfNT3xZPOeZSxcTYCViE09rImsEA76BCFykk4nOXwBe7KVERfFsTjinqo3uQDfDuxrb4rkKzLTsnfAx+GSC0Zgrmi8oMu1pnP0rJX7xa+5RXj76SqEVwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n+4ZQ5uT; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n+4ZQ5uT"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so7454210a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 10:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744131610; x=1744736410; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lnqPpyCI67o+FtOeQVQFZzGEVChwMTKzHgvwg9jq2HQ=;
        b=n+4ZQ5uTR3sa5ZwcZVt9wiZi0x0jZyjSNj/00ZNMM+pqc1Jl6HIl8XkCEYfwL7Kvts
         lQHSi4MSRWOQUsKgZ56MpJWywfTbgyncSAiBtUh4pu2K+MFTisvbx4AiDRqdY1mbK3DP
         uKzMHS/Se7oPXSSD7qdcL7ZnHngxEDoGjZSxloMqCmuuLFI7RLlEjYT/uDf5rFh52aVa
         9cJQQWyWT6yghn4IT1tLbOYPZO4Ob8ge0v6gjFAlAEj4NZVJgqOBT1Fw1BxtwAOz9aXW
         NrTowdrIKnLmKtXBAD9FWElfpUZNs3vjSrMKPc+ojNcCRqzK94/vtf/Uh5AA6GEpel0O
         lrlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744131610; x=1744736410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lnqPpyCI67o+FtOeQVQFZzGEVChwMTKzHgvwg9jq2HQ=;
        b=EDFWrmIjJKGb1Q/XICN/12l+fI+LnkFCNUrYxe1jFkB213R7m/ExvjRBAKU5T5IyWm
         2gPZmpavyJxORMB1m0bqdVjUY/EoIklAcdVlzdGHdeRHF73BaaK3RjZFABdm9vyYTMYB
         9bs/7MX+mcAjVheePHf7k6lHkPoHeK/jO3uZ0Uij+/oC8tPtlfhjMfphd9koyAk7tRJ5
         OaKjUiqgTx3oJ8jPv6iGn+RFZBrHGSEuM2Y6x2Piz+kWK/3AkK09Vk/wQjlYomw7ynjn
         hOqjb8M/70gZemXQdo9c1HXSkWzDm5a/WjFity349XtdPJKikIVTpwxY5f7JwRqmGIi4
         jA8A==
X-Forwarded-Encrypted: i=1; AJvYcCUIJB+ZzfiAOVONDbTpScFh4H4allsEXK3neaMUy6QmK3iuHE+rz4DNfO4Jm19oQ7qNRmS2DjHN56Xw/CI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt461pmiuhdvD+mOhA1CvReas5JBgoawarxFJADzHbFpnFCqBd
	IAd2hiW3RDjpToHuD4HS+2lFOfz7Dz4Jnq8HmzWQFm2Pm/FZblS5QyBsswGqDqkObqSsoi0oZ7i
	E4aWuTp+bw0psCrGLGrCpn3xSPhjr3Oz5s9P0nw==
X-Gm-Gg: ASbGncv7Sepa+yhtQ0BM/LszPHuq8MbF3UyNWUGK/vDseVIkieYey6nZUJPJAy/6WF/
	+XcvHgyfCntZxQatwWJK/p7yA/CfFX7NlzXLdjYnqIRqHmOuPy3kIVPJSqPL+2qFX4qh2VGYwIz
	gI8456OBT106OYe8wXQar8tVrpof2A2QKiCOsSMAJrADxSrLwJybLRwwdkoIE=
X-Google-Smtp-Source: AGHT+IGekmSfbQuIyvFfz7Stho6MU7GYlFI2lRYDKhjH7rLTkfZA+zKeGtWaeR97sSmOaYBlCFP7b52v5Ds+MX19Al0=
X-Received: by 2002:a05:6402:34c1:b0:5e5:bfab:51f with SMTP id
 4fb4d7f45d1cf-5f0b5c43ba6mr15002775a12.0.1744131609168; Tue, 08 Apr 2025
 10:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z-WO-fhDJKyG7hn2@p14s> <20250328045012.GA16723@nxa18884-linux>
 <Z-au0USkvoDYTF7A@p14s> <20250329125629.GA11929@nxa18884-linux>
 <Z-q3ebPSjkSPVlgP@p14s> <20250401014124.GB15525@nxa18884-linux>
 <Z-wOr3eLaX9myqb4@p14s> <20250402014355.GA22575@nxa18884-linux>
 <v5xgigrvpy6shmgdkivmxywkacsubnsimk6vyrue4mmoyufpbk@br7lnyvtnatc>
 <20250403143239.GA22779@nxa18884-linux> <20250408161054.GC31497@nxa18884-linux>
In-Reply-To: <20250408161054.GC31497@nxa18884-linux>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 8 Apr 2025 10:59:58 -0600
X-Gm-Features: ATxdqUFxRkJwgjEdzSDI73SR9AFZYTXSMJ4xjqknUtylbhMnKOBBwweFsaVOm2Y
Message-ID: <CANLsYkyEhhQA5KOsNveGSHUc3ZpckoL-CCHNZ0DZLMNYdNGzdQ@mail.gmail.com>
Subject: Re: [PATCH V2] remoteproc: core: Clear table_sz when rproc_shutdown
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, 
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Apr 2025 at 09:02, Peng Fan <peng.fan@oss.nxp.com> wrote:
>
> On Thu, Apr 03, 2025 at 10:32:39PM +0800, Peng Fan wrote:
> >Hi Bjorn,
> >
> >
> >Thanks for replying this thread.
> >
> >On Wed, Apr 02, 2025 at 08:48:58AM -0500, Bjorn Andersson wrote:
> >>On Wed, Apr 02, 2025 at 09:43:55AM +0800, Peng Fan wrote:
> >>> On Tue, Apr 01, 2025 at 10:05:03AM -0600, Mathieu Poirier wrote:
> >>> >On Tue, Apr 01, 2025 at 09:41:24AM +0800, Peng Fan wrote:
> >>...
> >>> >
> >>> >The core is already checking if @loaded_table is valid in rproc_start(), why
> >>> >can't that be used instead of adding yet another check?
> >>>
> >>> Ah. I was thinking clear table_sz in rpoc_shutdown is an easy approach and
> >>> could benifit others in case other platforms meet similar issue in future.
> >>>
> >>
> >>I like the general idea of keeping things clean and avoid leaving stale
> >>data behind.
> >>
> >>But clearing table_sz during stop in order to hide the fact that the
> >>future table_ptr will contain valid data that shouldn't be used, that's
> >>just a bug waiting to show up again in the future.
> >
> >Agree.
> >
> >Do you need me to post a fix for
> >commit efdde3d73ab25ce("remoteproc: core: Clear table_sz when rproc_shutdown")
> >by clearing table_sz in rproc_fw_boot and rproc_detach as did in this v2?
> >
> >To i.MX, the above in-tree patch is ok, so all it fine, and this v2 patch
> >could be dropped.
> >
> >But anyway, if you prefer a follow up fix, please let me know, I
> >could post a patch.
>
> Hi Bjorn, Mathieu,
>
>  I will wait for one more week to see if any concerns or questions.
>  Please raise if you have.
>

I am working with Bjorn to get your patch reverted.  Once that has
happened you can send another patch.

>  If no, I suppose this thread is done and I will start my other work
>  regarding rproc.
>
> Thanks,
> Peng
>
> >
> >Thanks,
> >Peng
> >
> >>
> >>Regards,
> >>Bjorn
> >>
> >
