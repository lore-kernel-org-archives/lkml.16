Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF19280CD5
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 20:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744403379; cv=none; b=au3dnCvhzNUXuLpCBM1Hpcq1OmGAz+76G+snjpc1Ncl11TfIZBhKyyyqN2hZDUFfSPxergIjkp2ndGnEE8i9NeWe6A6VBu8eVwlkZwaQ2EAHXemDhR6OnMgdRBbg0O9S57qGsBs4rU68Ll9N3qIF4UtIHKpN4rSBaCGfyv6+u9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744403379; c=relaxed/simple;
	bh=PLl9qmt/fzbjwndzJldvUlU3AVSqPKp1HHLdDNYCu9s=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=ma/AIL4Pkv2EjXUaTmQ5PzSpgKl4WN8+yhq9yjJ8znydrkywDDQxniShO1YvPmPVLBrRoaIciIuTxHcwLgiqEJ1yImINCthBVk6Jgztr092nk50N4ewxj0t9QXPivR0TNw5I5Prfeb//AUtPtcpS733JoLDwOtvXZVSkL11C6sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=PWk1Glzl; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="PWk1Glzl"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c5b2472969so246544985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1744403376; x=1745008176; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ktRVy/kIheAqpbf8tUSC8ehC31QAJCePsk0t6WKxomI=;
        b=PWk1GlzlbAObnirKuJ7i+Y0A0IHBshXp3bAJMN+BXP+lWjDB3+W7AXLpxbgEeP3hMU
         3vE9TMrRrL7a4z0/8YAFHYS0FSJQB0AZhu4Huzfd3SWnuAxEcYsFbc4ke0jb33jog4Yc
         /6nwHJfVXClhVKHMEkxyV8cRk+zejfLaQV3jrsZfsrB3U5apoKT1eu6nDmmj8Unuztco
         wV+0NkXJsc3xI6Xy4Out51HLha1tNKeJBkCBuhHzl8TxAioKaum/QUgLy2Ch95Sle2kC
         IZ2vkzkRP/EALGjCZCcg0thlZ4xjcdHEDJc1aTD3G1HhrDf4cWLP9TksQSRx76Zgp0XI
         45fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744403376; x=1745008176;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ktRVy/kIheAqpbf8tUSC8ehC31QAJCePsk0t6WKxomI=;
        b=ZKl/oS5eB2VS8qD9CcC2eou+2cNh8Klvjq+pIQ6S2STKMi+NLPgZZApofUF+GK59bS
         4xSWgkHvIXypuo7LJaXcwPh99ekhySdOgatktfmbVfZNBazwBKsDV8VirOQqQUdImHoB
         MM8euBHhQJL15e3gECz+UK0ohOogIY1Tr0gr1fwW/FGshovlXEer/RLiZ4jrl6W2OD5a
         J4mnwRFq251BjKSN8+Eh2zoUWcpy7JDhjVOYubVypZQK8pjTZ8/6hzVj/ZwzXwYNl5yd
         sgYXiGkpJI0p253ZGHB/RuRyFXlMrLfzuJtb+HyWGmLOmh1BUJt2YVBQcFixBDzqkxVF
         yxrA==
X-Forwarded-Encrypted: i=1; AJvYcCV99yURMIqpKJy5Kdx5+pJrp4e2A9d51wiND280qB2FIpjhZF4AEG1A0GacGpHnSbxEk2mJyxh+JXzKGhc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEj7Fnt+uzcbLCgA5/7A3imoTaCUqKzZHe+C4wmJCrD2PldV3A
	0l/3UE/XWEIpCsw1HULBQO9jUaAQSd+52OZmus8qHa/C5ExD20c95FcGaB/etw==
X-Gm-Gg: ASbGncvB6EzsO6apD0Ug9i8MKW7br2gsplEYIoxAJ6WXEtC1iaPrVdZ6tK0o/SdKpBm
	0lIjFArAEzs4+t3vDwmqW418JAq2zVDSam+QteJwDmKEG2eV0DQeD7RAZTD+MFZYflu7OP/UIau
	coQcIHHDd1fBn1Rt5Y3G3thSJAKuXVMr23NZA9YZS1v4Ly5ATEQDn5BxjssL+3T58jeQPxna4kY
	1UaivdJxDoYWMYIL0mxAnnbWv70yV3zv0IXo1079aDY+sSoVrCF7P8MlBImioLw5qfyM8/90yXh
	muGQC7XQZJKXRUJnlldaFwEvLlNoRM0FdFBn9h1pUIcc/8pTGJYtbyhByw+VOnqNlgHGBK9lS5t
	wgbHgoTwEmXt1PJcRVimz
X-Google-Smtp-Source: AGHT+IHrI1EUrUVygltkuHfnRucDiC0qqict77jWL5RBb/PkRNG9F9tnOg0M8ZX6T5ukmsj9PaclnQ==
X-Received: by 2002:a05:620a:1792:b0:7c5:a55b:fa6c with SMTP id af79cd13be357-7c7af1f3a65mr569107785a.38.1744403376436;
        Fri, 11 Apr 2025 13:29:36 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a89514f7sm309302285a.25.2025.04.11.13.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 13:29:36 -0700 (PDT)
Date: Fri, 11 Apr 2025 16:29:35 -0400
Message-ID: <b2a47590f8fea264863d0cef0a9c426d@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250411_1406/pstg-lib:20250411_1552/pstg-pwork:20250411_1406
From: Paul Moore <paul@paul-moore.com>
To: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, =?UTF-8?q?Thi=C3=A9baud=20Weksteen?= <tweek@google.com>, =?UTF-8?q?Bram=20Bonn=C3=A9?= <brambonne@google.com>, Casey Schaufler <casey@schaufler-ca.com>, Canfeng Guo <guocanfeng@uniontech.com>, GUO Zihua <guozihua@huawei.com>, selinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/6] selinux: add likely hints for fast paths
References: <20250318083422.21489-2-cgoettsche@seltendoof.de>
In-Reply-To: <20250318083422.21489-2-cgoettsche@seltendoof.de>

On Mar 18, 2025 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de> wrote:
> 
> In the network hashtable lookup code add likely() compiler hints in the
> fast path, like already done in sel_netif_sid().
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---
>  security/selinux/ibpkey.c  | 2 +-
>  security/selinux/netnode.c | 2 +-
>  security/selinux/netport.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Merged into selinux/dev, thanks.

--
paul-moore.com
