Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C275B234970
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744795665; cv=none; b=NRWVDS4pb/uehDQsgxGNo4KlnHe4WZwTa7SJB0gjPehS1r9CdqxqaWqH8+nA9MNwjM8WdWCk6+O6EaQgS8Ej0J2iRaNDscsgU2M88F0BMrHXcZtM7VrHBva5HpxObmcSPNplte7q2eeDRbl4l4VPEE+7l0KDklyA7LgVTovMKZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744795665; c=relaxed/simple;
	bh=ZSAyVPJa+DNSA9XuJEayjEky1UYza5wCLhZqf3SURto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JjUVKQSxiLxENNuC5edmkfrmtDra8uqaSmngRgmBJ9nmq1Igq9myX7hUBhQKt7SbRqwbZUE1ljHH0MYzb3/kqc0hqM8Szk1fTPHSR/Ux76Abni0q8oO3WekpMVyTR2mpFwjV0dM5zIrfYTS2GU/bywWlW7/BFpKNsyxwqe/jeIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fQgfi9WS; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fQgfi9WS"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5dbfc122b82so9263a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744795662; x=1745400462; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CrZlkaDKpY03Yt4YkAABkQhHLXVWR6nTz81SYg7uyo=;
        b=fQgfi9WSBv5VOimBm1X0Jd6TyEIKCu0hRQ6YXlY+jempSqtBK1Xf0/Ig4pQhNbXYF9
         f0Y+aMukSPAFxfQ354p7VCqzR+FDqSTx23Q1IgBXwqsr0crS0NPmTrw/0lsP7HHPdqhu
         3wlMOTZlcrfp4/1j7G0M5yPeq/jskhxsZbM1XXJg/OKd/IEOBI8xZ7pAGsJAFLSh6Nie
         PooHJcwecCQx7zyduL38JmjQ4MOzqWsl53LIs7QJuUvu0Tt3WtrdknI4Y+cgw/bes4v4
         1TkydHGHYTndvXtVKEpGJyd1ZG8dNgiUHsxGRFggEj03jhd8oltkLp9b4nE2+gooIAzx
         vCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744795662; x=1745400462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8CrZlkaDKpY03Yt4YkAABkQhHLXVWR6nTz81SYg7uyo=;
        b=GVXz/J6WnQkVIsYubHh8bAZrzJTaRf9KWSOpK60/Ce1unS3sMOEjgOmW13QJdlLwHX
         uAA1zxGovtwSGsaDywbwPwVp9GtzDkCKtPjq1XZLD5GTXemCHz/khWZnSdX74FMv3mAA
         UJ4UL5DBo4D/SMM6EN0aBp5W6KsoBftg3e+v8Vs46aqRvMLX6hm5EQSFBiii2qPmvCnW
         JjIqiWL3f2961H3H+zd+vso9GEgHcbTNiRe/EzOpO2Shz6wNLWN5RlH17pvQExfYEivr
         1fzxwPW6mYhyioto5dqIW7/WnRSNyoA7gXkRXEh8OCGnjSrFqbg+pyAQ/5J5e7o2UTfi
         Q57w==
X-Forwarded-Encrypted: i=1; AJvYcCUOGZqVpVJdsDg0YEtGcDApdHkfpB94HV/yjNU30Yw4Bp6lkAnwGVz5gM+936txOEAHVCzwBF3WcpqHTt4=@vger.kernel.org
X-Gm-Message-State: AOJu0YySyX12Zz/e6SD1gXYqtrtwQ5KBrdgEtHzPW88+7DxCOIXltb94
	ejIECrMFwt1sj9TndtlNRLqPVtmqzgVPIRqzUtNcu0S0losYrHZSIXp1TgAAl7z9POjcaVr2tnI
	H6+s5BKSl1xhYRQlJ5ZJgaKVs1K41WwOegytk
X-Gm-Gg: ASbGnctIdXiG4ftyfOSiWrgHeeuaxKJoNCtePZ9yAWUs6xmIxpdr6JA8J2dAFsS/xrf
	3JLEycY91dQ/kI1cF/TfzkGpD/Wnv8c+RaJNNuNh8N+pwrsOOATXuvQZNIU6XcDQkqZQyP660Sv
	4OwhYShqsNMwK3SlLD15R4JgG1JQaicP71oPtCZt4q3IJ33gcXiUPI
X-Google-Smtp-Source: AGHT+IEvFptH5xHEGdtt4MJIe2+XGOfTwQGM7EUnJ9iIULwbi4T9KbtIIp6jL86bzXtnC//yJXZZbO6taLcyFU8adQ0=
X-Received: by 2002:aa7:c48a:0:b0:5e4:afad:9a83 with SMTP id
 4fb4d7f45d1cf-5f4b653c428mr38661a12.2.1744795661783; Wed, 16 Apr 2025
 02:27:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408035833.844821-1-guanyulin@google.com> <20250408035833.844821-5-guanyulin@google.com>
 <adc03a95-baa0-4a2a-9b00-39a644bab426@rowland.harvard.edu>
In-Reply-To: <adc03a95-baa0-4a2a-9b00-39a644bab426@rowland.harvard.edu>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Wed, 16 Apr 2025 17:26:00 +0800
X-Gm-Features: ATxdqUEuCCfU8ATcbV828rfpdrpnLClVnv1356aBerj8g_kmnmezO7kTyYNwoag
Message-ID: <CAOuDEK2g-wejkuXUySJLJTo=S1NS=P-isTUTUaNDgGQeWXsoCA@mail.gmail.com>
Subject: Re: [PATCH v11 4/4] usb: host: enable USB offload during system sleep
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, mathias.nyman@intel.com, gargaditya08@live.com, 
	kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, elder@kernel.org, 
	quic_zijuhu@quicinc.com, ben@decadent.org.uk, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 11:17=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Tue, Apr 08, 2025 at 03:57:24AM +0000, Guan-Yu Lin wrote:
> > +                     /*
> > +                      * Don't suspend interfaces with remote wakeup wh=
ile the controller is
> > +                      * active. This preserves pending interrupt urbs,=
 allowing interrupt
> > +                      * events to be handled during system suspend.
> > +                      */
>
> Here and below, please try to limit the line lengths to below 80
> columns, even in comments.
>
> Alan Stern

Thanks for the reminder. I'll address it in the next patch.

Regards,
Guan-Yu
