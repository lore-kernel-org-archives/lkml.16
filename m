Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DBF233720
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744843197; cv=none; b=n4ilYYr10amT1Q5xEHeFwRHyOJyEs+qEcdo3zRSlH4hhNtlrgAhYJEwO05WMdVmNGnuW8KhbZ3swE9UmkRCJDxKAMnyuLnZ1LfPly5BKcp5Y3hqGzKx65KXsITqxkt18ztfSfSBGminR1hBpBy2m7N04TF0fWOxVAO5CiBFu6oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744843197; c=relaxed/simple;
	bh=kd8CIoyZU9z+s6yhVJAsL20bAYQiydUjPDvjdWdTYQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XRhcyc3y8cI2q8F4DWgru+dK9+01HtgDxy9J2SRvZVSH1eMklP2nMFc0sCK7ejA6dD4yEar0NyaVx09b8k4Fotn+k8kqj2eU06Q5kGybgPpbkeO8LWdStPWlVkJPrfXDlYgg/YkqAfhJa8mPKD7bsSHUkKdsvK/x+2VrfP3ifIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=atVMYsgB; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="atVMYsgB"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso261308a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1744843193; x=1745447993; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jm44dwmZcQ04sKyHxrckFG06FkU/O4r8HH0/pnpLZx0=;
        b=atVMYsgBJedqVBa3muizlrVb1k5F4IJGcIdbNH70eOi9Vzfeo0V4xWsPv3QRAMyOmQ
         +F/zCInH10/kPMtE4onWNa2TmUCqFuZ6Hl+SplUS1R7yo4xqNQkXXouf0U7LQ7cAvTdi
         iZmzM85Oi4eZdMAsVZJ+mZermcM579t4Vrc2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744843193; x=1745447993;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jm44dwmZcQ04sKyHxrckFG06FkU/O4r8HH0/pnpLZx0=;
        b=BLlS3TYWydc2dSxzoQwmzGD1LRJo/ukvrU9gR6Jn+w+glR8pnMomUmMtm7qLuTBV5S
         N8xRvL6vwB+E/5Ywww1njW5XmpOwl1Wgte1ZNf7hfAt5D0R8Bq8gllPGFbf13OKRxpid
         ELFT143BOeezzxzf/j33QieRzjVTuQA1YmPF4lLbCUbTCeTNGOG0V4OBvjecXmkWwzyw
         htudQZizgV6czP9mBM+WmLwHMNkNCLjS8ybiu844TtwDcgB7sJceI66H9St2EO++S0OH
         kLNQi4iN90dTaV9Vq2Ccn7hVZvwrl51qR+EWilbKNmeP00G0PIGRb0/7eKoHKtGNy/L2
         yqKA==
X-Forwarded-Encrypted: i=1; AJvYcCW/oYvY6jESBvQNWMTcg1zR5a7XMGTxt18jy/XlR6Z7MgxBqXN2l6EWyQX9gMkwy4S2I+VsCDN1uw1a3kM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDm1ajbltlDHISUqH6jO8L6YnovQpMHSNbASAzkb0oXwPCSTiJ
	bMWsg9PiykgeIzKvTja1V8L22PTTSKM2I0r4b5uIxS2dheF8z7Req5a9SmQQT5D+8qakIMg8ux7
	s3dlvYw==
X-Gm-Gg: ASbGnctSwBIybLnuVsFvWUSLFbGJUWBYh7gfCwyYGor79UZtQ5U359UOvUrHJcRSs0U
	poxBm+2siCz4WXpMMcGljzmsW841B88pLV62TmUPk75bgBdHMufJAZrVEwxtBDN/etrq2xe/Bhr
	DPfscyF2C+w5sJW3amjIu+Girl7Cn/Aa5TI8899pJPeZOzNuymvMnnu94ubJATeHEmUnF2MYzlp
	c0TGMZs0FP9vI35hivpRwrj9NjSrT9S1wUMmd8D58oN+mTyhk0Y0VtuK+KE9dV+pDVu5wk4c9ZW
	zHV8Ly/HL66XToQDzmpC0AjvRBK3YmhnQDuvMHUdixO0nMziz+nuPw8uP8rvlR2Q6p7AzmNNL3z
	CL3WQNWovFPzjtIWcn+6IP4n2Gg==
X-Google-Smtp-Source: AGHT+IGV82P87vgcCFPrL+mbqrpl9lUJczETISSL/+0VxgM7m0dkQLky4E3d5gAnJ3s0VFfiMN8aSw==
X-Received: by 2002:a05:6402:2750:b0:5f3:f04b:b5d7 with SMTP id 4fb4d7f45d1cf-5f4b74ad11amr3193094a12.18.1744843193239;
        Wed, 16 Apr 2025 15:39:53 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f06c5desm9225822a12.48.2025.04.16.15.39.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 15:39:52 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f4b7211badso274914a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:39:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXG4/mms2zD3xJkls3bmlOYpg0vSCZvX2jxd04PXwdIo1yFePetdtERUs/9/hAEuhjDe/0zy0RabjSaXto=@vger.kernel.org
X-Received: by 2002:a17:907:7f0d:b0:aca:d52d:b59b with SMTP id
 a640c23a62f3a-acb42af00f9mr291976266b.47.1744843192133; Wed, 16 Apr 2025
 15:39:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416221626.2710239-1-mjguzik@gmail.com>
In-Reply-To: <20250416221626.2710239-1-mjguzik@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 16 Apr 2025 15:39:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgUYJ1XbnMnKzv1coxX=WhH1g-ufMGxz7anf-Tw6M3+Bw@mail.gmail.com>
X-Gm-Features: ATxdqUFLEOCfS07bzwWoyJm7dcPWUV3_QMm7wan5599m25oiRJfIRXjqUJ1YLl0
Message-ID: <CAHk-=wgUYJ1XbnMnKzv1coxX=WhH1g-ufMGxz7anf-Tw6M3+Bw@mail.gmail.com>
Subject: Re: [PATCH 0/2] two nits for path lookup
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: brauner@kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Apr 2025 at 15:16, Mateusz Guzik <mjguzik@gmail.com> wrote:
>
> since path looku is being looked at, two extra nits from me:

Ack, both look sane to me.

             Linus
