Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80441239573
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738862287; cv=none; b=iNYp1ZJi8WpyOqYr58+i9v6mqmvq+H7rrOHhYKpkUeVLVp6vTgNzpJn+x+lqZRbRwPYoZ/Hr6dvkcrHV6PrKsTYQWuSPPRObKfEEsgLSEiwhWqR0VBr358rwyqe5jMqw6N6kSp1zdFH7MTtawLi4WXWXf3ZrA2q97oZzO/opcYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738862287; c=relaxed/simple;
	bh=JOwGLgYsPSFwIYyb0GW3l8HYahDCo2F/VehNRyBqSTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VJi6KTJmY8zAIm+b6hpRJj2ztqxHLm2SAOMhdmzH4lHiw15CMZlCgB8i6IEUwyBT4D1biO5TxMRkgZ9YQ2kB51TJ0SnBB69lxi68AopDxrVw/WQyTSkYaBcRL07Pf9ftUhr3pgVddduqlaxheLTjFueD8X0kJYfH+XyQkPfjqYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j0TBPx+G; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j0TBPx+G"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5401c52000dso1211697e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 09:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738862280; x=1739467080; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ueAPYpXJvcfTr/q+Id1IwP1ydGbx5eYC+BvmtKb8pog=;
        b=j0TBPx+G7eD/pEU/ysQwxh4Ozki7LphdyKoJpHuqx9uMKyX1c900vx36UkhQ+Qikob
         +Xqm/3tP9PAB67QhrBXdo5Lj1CIgmZNzefZZ20dlFXqSBefyPJSLd9tZIxYdAxLKVNQA
         dxD2nGNwUqsOhFFE3PGwPV5+QAe0zwT/565YQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738862280; x=1739467080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ueAPYpXJvcfTr/q+Id1IwP1ydGbx5eYC+BvmtKb8pog=;
        b=H0sE+uqzCv56rB7toGXJEGA14A5MuHL3KlJWXeHDL5fKOdgLEDQpgz0NPPp+jqlWfe
         QeBgHtruqPD/AK6C7BgkSpGViZK7g+UhTNZv7yYyctrxDPVy1XxbddKq5NZP6fLzEhB3
         bvswSle7mVOexA1Nq4xluIbpmueKX7ONTVJeLdGLWm8tpfeS8Q7G8PuFPwOQ86t85PZu
         f7SFsw1foZ3ZwSXIz1ieYtKJ7Mnn6ZNOMjALR5f327mK6BqZvsdELLON5VQTmScbctNj
         5IJF0cVSNKmihQobo+2/fpM5WK7CPwwFvLmD5lMLjP0Dzp4OOaQBm2Nr/6mAgnqEDGZm
         jBBg==
X-Forwarded-Encrypted: i=1; AJvYcCUFcrfmb/9PqtVV7+sxOpo0brEsrDYUUfCoOOGen9Tj2RFjeDPBtOs40GOceAinMv5U6gyHz3v1iCX4QYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyStcDHo+kJPGi+DAXpZVHqFuo+czhc9tvbzOkzRMCiLjBp6lBY
	WZlTllpsT4d10xnt4NGYnCm2DyqOCWrWxiViqN2sB2YYwPp1vH56BpiwaD60S9cXWDQg8rN0Au0
	GBg==
X-Gm-Gg: ASbGncuohmpQ+UXgv3VKWZltbZZvyNbd9oMQdqEZGIWc0Yfqh78iPo5Pm2YngYkVZdX
	zU4NGmQZ1a4LToS401RV0ZFPV1uP1itXcEyRqioccR1pV337TRkZACioh7zSmBJYYJUEzugCQZB
	EF0K3TNKWe7dVwBZ7f3ydW4uZAqDknVuWEIFp1lcWA+H7OhjGH9jM9QUlV7pI8hqaKYGxAgCJDd
	V28WIrfr89lGBk3cK+LU4aJcgOhv8wXZmCQvWavTz7cwqCKxPQvr4Z3gs7CoqsHdCTZoJ57ByL+
	YSpblkfpDD21aXf/jCVfeG+WvPHTnd2YyCYo87xffQKllmqEO+DKecU=
X-Google-Smtp-Source: AGHT+IFx/dl7BcJj09z2+GUHR99PQ1F8R6UkmdDdcRwKR0C323C00ZHrzhg8uRyb6TOIzOWLF5KiEw==
X-Received: by 2002:a05:6512:ac3:b0:540:3594:aa39 with SMTP id 2adb3069b0e04-54405a024c8mr2831753e87.5.1738862280437;
        Thu, 06 Feb 2025 09:18:00 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105bf735sm181590e87.146.2025.02.06.09.17.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 09:17:56 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so1260964e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 09:17:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX7P1aCSTA1Ow8appdsMBj10RzdLQ79/e5S2Se2ppfyMoBwVe/9lLOZQ0uAWKX+SJLEC5+dT8OyBXVrR9M=@vger.kernel.org
X-Received: by 2002:a05:6512:280e:b0:540:1f75:1b05 with SMTP id
 2adb3069b0e04-54405a181d4mr2811882e87.19.1738862275685; Thu, 06 Feb 2025
 09:17:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
 <20250206131300.1295111-3-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250206131300.1295111-3-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Feb 2025 09:17:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W0jvGESB59f_Hnz3tL8y37YdX77nx0hO+e0KK5TngPpQ@mail.gmail.com>
X-Gm-Features: AWEUYZkNkoAXZHBbfT2iBqqpLsWvoirtpsqxceL-idOINtHwPQs__7CAWjInIok
Message-ID: <CAD=FV=W0jvGESB59f_Hnz3tL8y37YdX77nx0hO+e0KK5TngPpQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel: Add compatible for
 CSOT PNA957QT1-1
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 6, 2025 at 5:13=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> Add a new compatible for the panel CSOT PNA957QT1-1. This panel uses
> HX83102 IC, so add the compatible to the hx83102 binding files.
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  .../devicetree/bindings/display/panel/himax,hx83102.yaml        | 2 ++
>  1 file changed, 2 insertions(+)

I haven't personally run this through DT validation, but this looks
good to me from a visual inspection.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I would assume this lands through the drm-misc tree and it'll meet up
with the vendor-prefix patch in mainline. That'll cause a temporary
schema validation error in drm-misc but I think that's OK, right? I
also wouldn't personally object to this landing through the DT
bindings tree. As a simple drm-misc committer I'm not sure I have the
official authority to ack that, but I've given my blessing for stuff
like this in the past and haven't been yelled at yet.

For now, I'll wait for a DT maintainer to give it a review and guidance.

-Doug
