Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CF915573F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826262; cv=none; b=HjbUPl3DikW5EgkMPchf0kYXxJlIpVrkvMXrQx9mQTl9gHL+30ZJEintvTydramH/2nYftstxszdomvh58FDX2dtKl7q+PzJHOQHz/9cfvdwQdAGIBzhMmr7W67Bhx5/ADr2l4dLoWy07qng4PDVzoeRfqxz0ZFr61WhxNlmIbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826262; c=relaxed/simple;
	bh=WXGpMxHygcfzTELJGLmTF9Qa1p/d89Zbk7jdPDFTfug=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=M5Mb+zx9tcbMf0+Z9bZ1dg3T+Lwh0ydUk0IMG4D5fXOHoxQAIDxcDEJN2DTICU+twuf4o7rdCPIt7Da0A6kQRpr0Udhvt6YbJumJN5sNM6t+PsJfqxRpBVhrJapgfNjDbf22qj++etAzwFdH6JdsI6nqj3olcr3YWwBORgycri8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YqnOd9/U; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YqnOd9/U"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450cfb79177so13665905e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749826259; x=1750431059; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXGpMxHygcfzTELJGLmTF9Qa1p/d89Zbk7jdPDFTfug=;
        b=YqnOd9/UpYAnk/h4wt4ESiDSiT5nVw7RACJYscBjYQDxN0GdH8A9a0ZuWry6z1zjhc
         4mjAGAIue6oT9uCpJLe7DmUUaU53Kf5QzcEdkUYQvA7XB8+Z1NiGhhb8p/mO4tG80NO3
         xIxv0VXeBQYEkwogxSkYmzXMZz9ZmsN41zyvGjGN1S2WQXpaAz3B9wIsNee8z98iVkt7
         zSZZUyPHcTSlr2Rew41CTVIkUygNGoUp2YOAnpEbBnQsQhcj+VBATL2wsBOwa6V9J5YA
         AleyU+8mps2ajjwiFYie/ANBDUVW46mgRgCFqbsCKqFrk6mJWOpnHWFhiD3wDuK/GVkj
         IEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749826259; x=1750431059;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WXGpMxHygcfzTELJGLmTF9Qa1p/d89Zbk7jdPDFTfug=;
        b=WJimQclqJBo4+X4J9DusaZqa1c3Ge+9rGUMeCJ6R9BjYDl4Ky0Q5gEvLz5+dOXLpfe
         IuMz5XEv4HQB9p06UVBCHlqLFF6MB5LrGpMD9FTVv8Caf0AnAtkHFW8e6nfzMJD64JVR
         YNeDIkQG3EQE888jPuI2M2hP0XFBnZeKyt6SC0hb9lMqdj/8jzUsyQrg5+AUDd+zj10C
         1T2/auDyJ16RabylQ8E42RDqpHOU8IrReHLR3AhBvq6/oDUjTMoD74/n4fIyoJ/EFLyM
         Gkfg4mr8FH+SZV3mWLq+IHqfm9yGWhCbdPG2QWfKog3doEyeqrxhEXXuxPm1kv99m/MS
         n6Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVgKzDKBdYzHwDyGXXVSdxjI7mdOj1T+3b4IG4iZSZ0GzursOpAlGbFHuivBjSNb8O+Po+5BLwunxIU0lE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHpCgHN+fu4BJVaqPtonpm3OQUDHpgEn9fCQ5ztk4ZgJQx9Hic
	KthbqETxNo/nqSbtTDsge7T3bf7/wmdRIKi7mlEIzPv3Zjgpxt+2F3I4sZ3juIYJXHg=
X-Gm-Gg: ASbGncuXdNOcQmfEek4QHed1rGP4JpQ4osRafUkhjKIxJyx6trHhhI3nPX06R6+k/AK
	oLjt1zmUnHZfyYo6SQHw6ic/1Des7FDmsocHxKWAXqnTiqYL6pmkluecyLkfXk4fQNRD3c0o5qB
	jaVAcev/xkQgbtk5yKBomPb052mQOPXObUKOfoKxnPvP6626fKNYwlnm6CW2rQueJADNROnDd5f
	ahEu70eG1jCEik7K9c3Hk5Or60zISFM65vOgN3VSCT2CJ8a8xoIDjbUgrSlix1JaYI1XqZBTLB+
	e+Z7jBpaA8E6GnLcGvA1PqtqKkbS6Rx/ecJ8hpIdrAa0ylNIsiak2+2T5EBsYBj4XxMauBieve3
	v3IM=
X-Google-Smtp-Source: AGHT+IGJ34DzRWm1T2gZxcoEWSQEcbIW5w0AwTNiA/GS5kJjbzV7TTazO9AA/zJ8635JEJWkBn/LUw==
X-Received: by 2002:a05:6000:2893:b0:3a5:2fe2:c9e1 with SMTP id ffacd0b85a97d-3a56876abe1mr3243520f8f.30.1749826258845;
        Fri, 13 Jun 2025 07:50:58 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:c8e2:ba7d:a1c6:463f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54d1fsm2562363f8f.2.2025.06.13.07.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 07:50:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Jun 2025 15:50:57 +0100
Message-Id: <DALHN1EOXETI.3BLGEY3KMN4HD@linaro.org>
Cc: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Rob Clark" <robdclark@gmail.com>, "Sean Paul"
 <sean@poorly.run>, "Konrad Dybcio" <konradybcio@kernel.org>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Fix inverted WARN_ON() logic
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Rob Clark" <robin.clark@oss.qualcomm.com>,
 <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.0
References: <20250613144144.27945-1-robin.clark@oss.qualcomm.com>
In-Reply-To: <20250613144144.27945-1-robin.clark@oss.qualcomm.com>

On Fri Jun 13, 2025 at 3:41 PM BST, Rob Clark wrote:
> We want to WARN_ON() if info is NULL.
>
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 0838fc3e6718 ("drm/msm/adreno: Check for recognized GPU before bin=
d")
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

You forgot Reported-by tag.

Reported-by: Alexey Klimov <alexey.klimov@linaro.org>

Was the series where it is applied already merged?

[..]

Thanks,
Alexey
