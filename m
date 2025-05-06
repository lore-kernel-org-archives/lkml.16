Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C2F220F43
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746552468; cv=none; b=q5quyA7NFIp+DVT05O7lWct0dNpZZMIONRBYgLMytl5JYw1U4q2/NwJNDKAQ97iqyKjZ3NmIu1REBVkNFkBvyjvW+tQkJqhpG6zmRuCmhuF6XwbgjX54hXz0n0pxe6U5DmQSlyNS08ayRDBrcc9R8AII0yoeoG+PbSCKhB26s14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746552468; c=relaxed/simple;
	bh=VZvedTE73bYMhdMPuuSG6IzGG8tV020eWS/PwiWAOIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DBIJFO7LacWXmTsvTotuHz3W2RVSMZhQkc3gIV0738DB+UIVDB/kV2j1bogbxC35ueXY1av7wyXP89XsdxdsxA+A/OjEq6jng6VcQ4qq5t5IHWs8T9bnrhyiO1K9uuetz9IF3aGCR81GrSQe/Eci3GeAdipwq0PrY6IaZuzpg8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RQrOF3WE; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RQrOF3WE"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22e09f57ed4so1417385ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 10:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746552466; x=1747157266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QntcJ9JC7N6KnoCCkYdEnTnrHKLcwgcPOoyiEKb/q5Y=;
        b=RQrOF3WEkxj488AF++sb+gDfJIaeku9qfo2Rzd/iKMeDJXEows66TYFE5sOcUICCaP
         Zi/8X6BTnwh/TC0WksaMXkNhGXLiTN8Ug1KvOB5JL5Dszv2RihaT1dePuOes9HYXHDlT
         4JKkuTVGsAnPqQxNOweCPJfvja36yji8QpC81rf64EgoEJkwVVtP1/6o2Ba05OPdVqC1
         S8a4KRzfW//c0BXoQ+8yJk7WknwvTuCMfpUNUDIsW7TdV1jMU0NscWzXEDYBQbKOqDFo
         FqA5A9Z3+SF9EAi0NKg6SEY8iZXJBxu7PSL+WQ7vJybDuKm/g7Jg52on6YE/zpkLQPaI
         5njQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746552466; x=1747157266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QntcJ9JC7N6KnoCCkYdEnTnrHKLcwgcPOoyiEKb/q5Y=;
        b=d4Yj+/00RZKmCMk+/qCnuQlKypF40mNXRV7OMyHHTwyePZ+8hJg/SVzHYgEkOyxUbm
         Z4RtNtQv/FNhhQNIvI3yVP8o44ve8ubtr5j6tGbMfFP/3/39tSLZ/NAow9yep6Ig3NME
         0DG4AiM5Ce0yD2eZwwIlIQG7PQKsNhaa7mFJ64KvhggxzO5EFf2pKTSG07kExVH8zzMH
         qmpd10tEmxtweYYZMT6ptDT6bZt1pWzrLiEZ4ip95m2jNUjGKQKR3ZNIJxgQ91bA0BTz
         zqWEfl9c0/4Wz5dhFqGMvpfAiSGHl1y05x4l93F9CXo/Z0+vx1zAyAiPuuRdayRfnGFX
         NGLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTB8R86I85xqlh8hVKLY8X5+PWczfoC2ULy87xOgm5LFsMMsoUBkNWMxflg0J2MP2xAorWRB8GFipkDQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1YxpdgTUbKDkywpdc4S1lteSad/xZ71li80ZZE74lAugElIOB
	crf08Yt8nHmsi7iwdGiGpSaRKt3ylkZclaxF0JowaFUx/UHZWplgBxf573g3GjQ=
X-Gm-Gg: ASbGncvfSE1Fh3zk65S0Yv0an+0wBky3UDzLwdYt5hphJFZAWGPRzBsmtZI4ze6QpL/
	yoipkjU8ebubk2CkqSmuhljIOE0FgBOZkPwxijDhfhSDuEqbB7quvvwiUc43svqz4KZV25PHt2o
	7bYbolRISOIyKhRN0vsgoJS2JR12Fl5qqU2FNRD5dEePqhSK4LvciDczsxw6CRjBudcxs4qKcWP
	XSzDDUMJPRdn+dZqFlmbe4kw3pQfzJEaMWIDkra0yVvM3y6mWPYnNw1Mlbh4VawkdzMcKd/NSAT
	sDsxht+zfn/WVEKiNP9N2LX3HN0+PxnVPMki8VqMbJ/mfM/JcA77NbA=
X-Google-Smtp-Source: AGHT+IGb8PrWjxNOFSHqY4dUSPx0THioDcdMr2Zu+IP4nb33zCe+XaNuoMpebGjNT9nY0LAwSXTtUg==
X-Received: by 2002:a17:903:283:b0:21f:5063:d3ca with SMTP id d9443c01a7336-22e5d9a1cfamr7061195ad.16.1746552466098;
        Tue, 06 May 2025 10:27:46 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:18ea:e7ed:8d1e:88a0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e150ebfa4sm76661845ad.13.2025.05.06.10.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 10:27:45 -0700 (PDT)
Date: Tue, 6 May 2025 11:27:43 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: linux@treblig.org
Cc: arnaud.pouliquen@foss.st.com, andersson@kernel.org, corbet@lwn.net,
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] rpmsg offchannel deadcoding
Message-ID: <aBpGj35VsjvAjNmL@p14s>
References: <20250429234600.301083-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429234600.301083-1-linux@treblig.org>

On Wed, Apr 30, 2025 at 12:45:56AM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> Hi,
>   This removes a couple of unused functions in rpmsg,
> and (v2) after discussions with Arnaud, follows the thread
> and removes code that they would call.
> 
> (Build tested only)
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 
> V3
>   Fixup comment on rpmsg_send_offchannel_raw(),
>   removing the reference to "_offchannel" - as per Mathieu's
>   review
> 
> Dr. David Alan Gilbert (3):
>   rpmsg: core:  Remove deadcode
>   rpmsg: virtio: Remove uncallable offchannel functions
>   rpmsg: Remove unused method pointers *send_offchannel
> 
>  Documentation/staging/rpmsg.rst  | 46 -----------------------
>  drivers/rpmsg/rpmsg_core.c       | 63 --------------------------------
>  drivers/rpmsg/rpmsg_internal.h   |  6 ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 24 +-----------
>  include/linux/rpmsg.h            | 22 -----------
>  5 files changed, 1 insertion(+), 160 deletions(-)

I have applied this patchet.

Thanks,
Mathieu

> 
> -- 
> 2.49.0
> 
