Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D3B184
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 12:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746881176; cv=none; b=d+vgy0VqAhwTN5b90+utqKEYDtx9K9MtQbe9g2t+JxO0lOEDgDf/RkR1bf/sTrsHiGPs2AUqEGMfDdLKamX/i/wGwG93LxKqSkjk5m9YSB/Ta0ath6G+hejaix5R3zY/c5OgNqR7/Gnn0uT0uXzWgzNAvrwNMBwM5rtMvg+Bf0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746881176; c=relaxed/simple;
	bh=KLlh+8Ltw8JoNaViizo/a9p3tE/BvWruiWybxbpBQDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pog4KLgMr0dhr6s/exqFekm0LflIjzpSZPsXMMDU2OWedzgLYtw4aIADkykdyEsFBUp1ggvx1j5C0y3BOZjjrpd7NbCQ9sA8JvWBIvwb/wlvONd3HNjgKhTU6aRfoHAsAHvlZIKi0O8ALBs9tbg9l71UGG5AFxa5JrdCXGRCROk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQ2DBm32; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQ2DBm32"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso3359289b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 05:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746881174; x=1747485974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kJptZbL6QovkSOzJ8PBjROmwqQurdv9mRyfz6ZZ9R8w=;
        b=UQ2DBm32DnyJfL0YF7a28c0BmBeJTeFHQS6qR6qFVyLLpNeufid2oqwj9Qxt5aOMRQ
         2cUUgvVgeft4cFbyWL67+CO5egDK4QIWRoOKqVGEm1kLJUiS/6ZveCrXShRqeRJOAo8s
         8do5HhlC+sipsaaho4vQ9z1RqTWUA+evuanzbQskrfKD8Fl5oAt/aHsc7mNqN0WOoFrI
         64USL3QwI707hjh+PKfg0fVHxNEFiAJjXYIGshJRcKG03UXreaCwUjrIbopcxazIZ93l
         IHuFvmNmsgAut9WxoNGzozAHBmO7qbfP5iXdBVziNMYAo/Zl21yRsj3KPMrUPoMGZLaG
         36Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746881174; x=1747485974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJptZbL6QovkSOzJ8PBjROmwqQurdv9mRyfz6ZZ9R8w=;
        b=w0LIGV5cNkv2eWP/E8TKDAJiK8e1yikl6YboHWIykQWK9QV5mf1mjqpZAD5mR4R16N
         fpTJBNAabh7SbosbmemBKyxGnS1FVI0SNRF+fVQnX/pOlEiaUDay83Hy0X5Y7e301KN6
         +sgsXmw4kl6kQ12YlDbdfZU9EprQzSOMWiG4hKqMZ1k72FrzN0W/oIfxIEleX1yXXlMg
         prwMnz0a+Iaon8TwG+dHMf8WMEJxfGUU7WtoWMFdHUdgTXG0WOlQ90SI0MC3/REuLKZU
         kuwm+RuCMzL5Cgjb5O11TaWvce6QABdQCimT3UPLu6WyHddNjvhUN+xa07krAQ9iZm95
         20fg==
X-Forwarded-Encrypted: i=1; AJvYcCX8T++FO9MLldd0R0F1NpunH4yr6bVAN+uEE6BcatsQ5GLRpEkpHUoQFglowPECd6WV5He/ePK55e5EPOE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9zjyT7fID7JoCPnpkyETMbOymQbOX8pMtrlgHXaEZgjtVtxaf
	wfiS0y+g+TNp7Pm5LT2hDb6/qbBF+dJPdFrV9J4WKZ69Kasl6RrW
X-Gm-Gg: ASbGnct+OY5dYcMJTPEbfMWLXe6PpEgfFH6c/R+VkyJwA3H1E2xYqXO8+KUT2G1Ixcl
	Ugb6dLIZ6SIa0JxtUgzbJr9uqBZt0eWiDzjkhR593drE9sbM9oi7jzIxAH30B2rTgc6bd7EeCTg
	o6JQCZRNahz4hmrMqU1GKn2Jq2vq+Ou9hCSrr68aogiHR0OdyhxZjU4lSwBrdAreYFsOE5yWI6A
	ZluRQOG5eQ/Zo4Nh1ic9L6ztz7Ox7Jn6AICquv6EdF1ZfOhMeMGAZO+aNxUQviy32iJWLOD3leQ
	OlmLfVDf8KrOHMOkqBYFJlpQQVZSi9fyS15+Py0YXczS3armMpp0zHILbViPKpyse5p2
X-Google-Smtp-Source: AGHT+IFm4BPC2O9iYWCdhvY6ixnruWUPssuzfVNGiLcK0VFlExUGd4bt5+WKSNxgP/7DNAkHJktdBA==
X-Received: by 2002:a05:6a00:139d:b0:740:9d6f:a73b with SMTP id d2e1a72fcca58-7423c04220fmr9215898b3a.17.1746881173804;
        Sat, 10 May 2025 05:46:13 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:bea7:51b5:8c2a:f16a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a1088csm3130373b3a.113.2025.05.10.05.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 05:46:13 -0700 (PDT)
Date: Sat, 10 May 2025 20:46:08 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, christophe.jaillet@wanadoo.fr,
	skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/meson: Use 1000ULL when operating with mode->clock
Message-ID: <aB9KkD5-zzdnWQRb@vaxr-BM6660-BM6360>
References: <20250505184338.678540-1-richard120310@gmail.com>
 <174681696108.3272668.11983752901167871124.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174681696108.3272668.11983752901167871124.b4-ty@linaro.org>

On Fri, May 09, 2025 at 08:56:01PM +0200, Neil Armstrong wrote:
> Hi,
> 
> On Tue, 06 May 2025 02:43:38 +0800, I Hsin Cheng wrote:
> > Coverity scan reported the usage of "mode->clock * 1000" may lead to
> > integer overflow. Use "1000ULL" instead of "1000"
> > when utilizing it to avoid potential integer overflow issue.
> > 
> > 
> 
> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)
> 
> [1/1] drm/meson: Use 1000ULL when operating with mode->clock
>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/eb0851e14432f3b87c77b704c835ac376deda03a
> 
> -- 
> Neil
>

Hi Neil, Hi Martin,

Thanks for your kindness for adding the tag for me, I'll make sure to
add Fixes tag in future when I send patches.

Big thanks!

Best regards,
I Hsin Cheng.
