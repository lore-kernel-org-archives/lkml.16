Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A01422127A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 22:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745533116; cv=none; b=Xn7SIPastfjPohBspBm3DwM7EUQbn0mkl0S89Rq+OdLTZPGzllnFnCKWmtSImAvKaacFXrh7zstO2/7lvTliu83yXwWU7LuUFMd9C35YMNt/7Lq0RILQZ5Ga3gTw4vaKLhtBssnKnLYaC+QCgKikRuSTbH5ECL6xXK5Y8tuaIFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745533116; c=relaxed/simple;
	bh=h7bS8t6pLBwRLFNubDUutpACHo61OxsUV8u730LTnig=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=m7BWJZEivMVRlbUIOXWqapYv5gfy5VKt4iaPNpYCv5ZowWA34fYP1iCG3WFsax6IETMYPF7gKkzTW/iK2zUKE6GQToNXn1orIRBuTY8SG/pfhTu0PLRdHE5AUzVEOUu548vgvuoV99oQx9tqA++PZd6zU3b5SvdREUYZ5BXjWaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=WuL+ZVmF; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="WuL+ZVmF"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so18329906d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 15:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1745533114; x=1746137914; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAjyXB+CyDav4k4P6PubMcZjSZyXZYM+TboJS0Fnb7s=;
        b=WuL+ZVmFB3eGhyW1vpV1hiagAKqGRt34rxaY37woXQl6y2AJJQ42uty6YuYkOQdhuR
         TYSvY5oo1bmaP3V4aXdl8wCoZhs08vDnw46tqTm1Znm+Y860XC+UFXmaVZRtjKKk9Dqo
         8LOpa7w/tVe4teV//GfSpzdriWNK91pKHsDph6e9JgNub3lRWWyrUDDiOZL5NK81NnRr
         On0wCjVpf1NkFUexqskbDEmEM2Yg7TjfTjvgPQkdWPJE8pF4auz/0ajEPZD8IAWRn6kL
         UJ6+w0uOVCk7xbyY/tsRv7jbVscQ5xtbpN1RRowvKH13sbFToTzmwWTfd2aVLmzknJrW
         C/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745533114; x=1746137914;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hAjyXB+CyDav4k4P6PubMcZjSZyXZYM+TboJS0Fnb7s=;
        b=uarr0pA39bwn/SqtWbA9CEHV/RzDdWOHDR/HbysqhdF5JIOcQWZ3FheDQPGY2NbwGR
         mcIguQCv5t8WFctYLSH3LM2LR5tos69tPHDxPnHm0haIy96Z2mjraPSJ/Nm83Vu6PyNb
         IXBvKUWdRZanASGlMGMpRRzFSDINaeEi/VZbtY3R2Yy6EwQixj0dVFVxXcHHq8gVIiGh
         Ojmr1E3Pgu2Fv3+rwSyOgFk6hbONNq0ny3MlBAUec90VUaZQ7l3djWI+aAuIs//ug2XW
         cKOou4CslvzWrirwFLcw2jcs3MuYL/qpdd9RVTQDluh3UhwQ9dD5uHdju9/5UtxU8bxy
         VhjA==
X-Forwarded-Encrypted: i=1; AJvYcCWFg+JUrs7uIfRvTQPjxIUnKY5lkMps8TGwm67wVqPD3+1w/914J9AAIz6/3En9jkr74pqaLnDmjBP95PY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpIGahn/6sAxkJ7gfSKPM0cC7sKzmbJTJTORAcPXoujwsLvqbw
	FOVg4Q7x8LPTV6o67Apg3XBqS7JEkj7z6VDSuDJpkFKb1QXoyQwDSNGnlkw7Fw==
X-Gm-Gg: ASbGncu3tbhcwSE0+Gpp0oLg9SS5yrp2gPpFLUqzmPO+zcXTiD3fRQe7FK/0gAHBLnm
	+rWaIDWR10Bk9pQeYmJ728X8hSVMEPffxFek9SlJloSSPUHMCjnuIzou7mjsrvL0UtUtb0oXjTI
	dr29RGgCcVpPaHoA379XkyDUBwoOhfO6kWqnoPlM4Qd7/nRezVU7Orb7x3a7/SnekMBvKc/YRpU
	qRm0a5Qku/4UEuhjUgqieJPnbzjc3+1VauKU2bIc5xM26jlRaLMvFy0jd4L0qoFP0SrkgjcTwLx
	WNqmQPXvhVXQf6LwFXrF7FD9ynkrsCoz80hjUibXC0L4UbCAGEItFJ2zvZLvQEFk0IfZ2DlR32y
	Ek3UpTkLn5Q==
X-Google-Smtp-Source: AGHT+IGXqCgssDpLUT5Km+2/uYfoayGN7KEZy1Sw7rm2oXTApNyBMkE2ly+T0vaDsF3ffw6xOmoIag==
X-Received: by 2002:a05:6214:242d:b0:6d8:ada3:26c9 with SMTP id 6a1803df08f44-6f4cbcb37femr1511986d6.10.1745533114161;
        Thu, 24 Apr 2025 15:18:34 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f4c0a7433bsm14465726d6.93.2025.04.24.15.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 15:18:33 -0700 (PDT)
Date: Thu, 24 Apr 2025 18:18:33 -0400
Message-ID: <0211e4c6561bf2eabbad2bf75a760e03@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250424_1707/pstg-lib:20250424_1742/pstg-pwork:20250424_1707
From: Paul Moore <paul@paul-moore.com>
To: Casey Schaufler <casey@schaufler-ca.com>, casey@schaufler-ca.com, eparis@redhat.com, linux-security-module@vger.kernel.org, audit@vger.kernel.org
Cc: jmorris@namei.org, serge@hallyn.com, keescook@chromium.org, john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp, stephen.smalley.work@gmail.com, linux-kernel@vger.kernel.org, selinux@vger.kernel.org
Subject: Re: [PATCH v3 4/5] Audit: multiple subject lsm values for netlabel
References: <20250319222744.17576-5-casey@schaufler-ca.com>
In-Reply-To: <20250319222744.17576-5-casey@schaufler-ca.com>

On Mar 19, 2025 Casey Schaufler <casey@schaufler-ca.com> wrote:
> 
> Refactor audit_log_task_context(), creating a new audit_log_subj_ctx().
> This is used in netlabel auditing to provide multiple subject security
> contexts as necessary.
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>  include/linux/audit.h        |  7 +++++++
>  kernel/audit.c               | 28 +++++++++++++++++++++-------
>  net/netlabel/netlabel_user.c |  9 +--------
>  3 files changed, 29 insertions(+), 15 deletions(-)

Other than moving to the subject count supplied by the LSM
initialization patchset previously mentioned, this looks fine to me.

--
paul-moore.com
