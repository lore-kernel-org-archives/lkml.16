Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D464E15748F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745824602; cv=none; b=mCcJ6LN8XAGuRFscnOAmF/Z57vvB88kQFMqn7dy8qs9fVOxKuLgqEuX2rznIAKZLg+lNRPzue4DQ+XjdddyuCcZVXTRnn+XFg8stxw2X+RGs06lWi2eHa4jSnFnuHc+nPDngUCuots+cdFSulzjndcpn+JvRCOv+iUTh/iHJif8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745824602; c=relaxed/simple;
	bh=KBLb/tzZzgags6HxVGiD3V3/GtAE+/sw48XMlxBGB3A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tUhcn9OhA3VMalVGynQ2ZJm7FblmJEltyCZOR7D/k4LsR6s8+tI762fRA4FP7KXZQSUaS3AeDa0V/AP/D+OelLGXW1mpzO53DJR2+xFtXiKsFd9LwJWAKN4xydlDzu+Tx+PnqtdwFT0ACKBhsw0C4j+aGYqyV29tysz/mlenJYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i2qS9m1u; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i2qS9m1u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745824599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=16CNKajqgwGmZ8oI9vbBSydbJPDHhv2hM7VyKx5uLvo=;
	b=i2qS9m1u4ncuH7r0iSqFcB/F69MJjbmS+AgqQEJMYkDK9AUsFsIOkCgYmuki98+5foyMQN
	5Hly4BhwtnyL7jdGd/mReqycMAij/sPRNgzuhmD1Zh3tb2w27LynFjB09F0H/0gGq+eHpf
	S3WUUqSYJtYtqcmxFjDw5Z/AMDHNMtA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-o3msMSZ4OxqM61ewL4GAOg-1; Mon, 28 Apr 2025 03:16:35 -0400
X-MC-Unique: o3msMSZ4OxqM61ewL4GAOg-1
X-Mimecast-MFC-AGG-ID: o3msMSZ4OxqM61ewL4GAOg_1745824594
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-440a4e2bad7so10280245e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 00:16:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745824594; x=1746429394;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=16CNKajqgwGmZ8oI9vbBSydbJPDHhv2hM7VyKx5uLvo=;
        b=t6Awbd1BUp/5AXGbiWIHLsFAAd3lMrw39VND3Vm0u8qkP/oX2ym+y54J582Rmq5s17
         7xmAF6WhyD3mUd5hkkdqswXQYy0YTlHeIPWY6lnESpqFxdL18paZi7Nt6Z8lbw7sWdXw
         qniQuU2kZV9gRj2S53My0U4wOSJY5QCmbCbmH7RaH448frHsLZJq0r5azvzpJkPwth32
         1s27K4Ux90unIWWY/g8hEbVye0DSHbqDanqKLgoFKCc+ufDpJVAvj2UTPAgFIpHkGJpc
         +816Qyp6y9Hl9cHGn3eP+9pNzQqMmWX/tnKwvbQ71x2JA5xo2GhMZ0R9PfMlg8P8txTz
         FC3g==
X-Gm-Message-State: AOJu0YzbMeXWB/ZRnf0+Z9cZ7enZpZv8h7Yk3jk95JEBrrxh9HezhTYM
	gn+S+rifi37GzUxSIex3dxs7widZWPtZBdiFI4Y8SFN7pDK5yIRFMPBrFwFQwJjYELkbIoVqY3n
	wWIjvMfNsaEBL1bAxSb+m8z07h3K2YmPLIQs+By7V2lR93XHc3BDCurHI7kPaMA==
X-Gm-Gg: ASbGncuYN4d1UcC2nrIZTSKEJGw3NBKvcm4HZxiRHC2NFPHpiMtc6sagAcfESewTofk
	AOioYti4yHbgs1ObT2qMvDemcfzfmadGa5/g+IdmbbmPGcTS1VZiDvn5kg8NH5X50CO2ohs4Mnn
	2Pu4jZwImPz1SGRxriRPg84TBdjMpJ3beAbMZ6HtoHQ6tj0cKPwOedNN6vg+MTijy7j8+Wm1a5S
	kyXg2FSX1zt7Cc3ZnlhPI8k0IsFNtS8s0uizbTbBFP/jwGx2/kCpQxrRwISnu5d+Hvu7cNsV8St
	+J0phUTRkJvVh0uFuXF46Hgsa275EFYwcPrlHK19bQ==
X-Received: by 2002:a05:6000:4285:b0:38d:e0a9:7e5e with SMTP id ffacd0b85a97d-3a06d641ee8mr13559949f8f.6.1745824594520;
        Mon, 28 Apr 2025 00:16:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIrPcunVHLnlQ1AatF9UYAiW856wnW8cOclcw7+LA1ObWz8K2SToJ1c1vlFs6uRPgv8kBJdA==
X-Received: by 2002:a05:6000:4285:b0:38d:e0a9:7e5e with SMTP id ffacd0b85a97d-3a06d641ee8mr13559929f8f.6.1745824594178;
        Mon, 28 Apr 2025 00:16:34 -0700 (PDT)
Received: from localhost ([195.166.127.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46257sm10241681f8f.77.2025.04.28.00.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 00:16:33 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, David Lechner <david@lechnology.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Marcus
 Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH] drm/sitronix: move tiny Sitronix drivers to their own
 subdir
In-Reply-To: <20250428-sitronix-v1-1-4e7cc0a8195a@gmail.com>
References: <20250428-sitronix-v1-1-4e7cc0a8195a@gmail.com>
Date: Mon, 28 Apr 2025 09:16:32 +0200
Message-ID: <877c3421tb.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

Hello Marcus,

> We start to have support many Sitronix displays in the tiny directory,
> and we expect more to come.
>
> Move them to their own subdirectory.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

You can also include the following if you feel like it:

Suggested-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

