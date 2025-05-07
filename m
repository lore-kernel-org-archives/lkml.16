Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCADE10E9
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 00:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746576969; cv=none; b=Y0MdHH9dmvYCWo1Wz4msed+GowI32NWp03Zkj7swUMjtQbQBBEY/ZP3AJXzDivNZYbpX9wrMNw8BvGcAgld5/bceI6F3niAho0oR1LlQfo28G7ooD8q3ohXq/lt44ZpVVM+iXeWh8J1F3WGq2sQx3s3N1N9LqXfcYVkjxwCSxNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746576969; c=relaxed/simple;
	bh=7be0/2LE++Ckek26lvbdY7EmcP9hl10SUMNHHpogdAY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=qL9mmQKwPT3+UPYSN4KyXyFn40f/CvLvZzCI7YNtTSOrKUJWdhBtrXvTjtjMYJ1hlqvO6TMSRtubGjqDxIeJPoimJ3Ql76j5UhXglrZKILMjAJPIOlNefZghEP+KvsuR35RcVf7XIjrGO5W7RnnbPB6KGTin10OlACMcJ/03ZyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rg/k8MZ7; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rg/k8MZ7"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2241e7e3addso55808535ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 17:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746576967; x=1747181767; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEfRZPC7A6O+MNC8gvc2UAGXPdHnkovUWHJGbcAaarU=;
        b=rg/k8MZ7CECjIQLhMHS9mSae5THKFADYEuLyeuTJLiZFhVP+TBt5zyUO+wJwvxYPLS
         1pRvfKbliUuDOaPcD3pOTcBIVavY89C4+vwJhLL39ZGpzeEqX8BbTwdJO+YlN1YIosrI
         xc3v0a5FQIVcTnLz/Ubyg1WA6x1HXJEd1346adSBZ9w6N60KFLGX46jzCJJsH/ok/ycj
         4S523iH8/eClT23qKoZlz2EZrdaTwMymQcxZ6K3xPWtPWm98KNnVWn8wDxouxmkpVyte
         h93JoUH7hXxYOkDlMCgoOb09WPn+rBm5RL+7ugTiFdjwBKc3EE7ih0t3x3STu72xC3bd
         ri1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746576967; x=1747181767;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vEfRZPC7A6O+MNC8gvc2UAGXPdHnkovUWHJGbcAaarU=;
        b=HxyxueC1iqgWADkLu0VO31cyqFUv+x1exMAbJ7/FMgbcc0wLc+0DPTBETTY4+lJTMA
         iJCcvSb1/kpP8Y1+pJe3STx6r3v+a6WDwDmXlDsyMS5+WjlX8sqt1w3U9NhOYDbRjqaN
         YeI7eDUxzC18tnooONyF2ZWGAlUhtPcVMv47HMW9CGuNm7MpMaqsf7vv7bTOVwFoTo6s
         W8z35FhpiRuvjYQAjpX5NuKiKTAwNa/WDaIdPmVO5S3Ha9Jhidc6Pyhh7xMCmT6fWgmA
         lzdkSv2dzPEmLWIrAHEKcMsxz3VdWLzSBBrRWdkn2M3XAaAE1AQSCFtrkdAtixzoeQB5
         XieQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp7s93sX+PhBXS/DevOnbbvHJRkwTbbpyP4rmV8ty39kC9oP9d7jImnNjkkCxfWG/Gbm578RG27ypVxW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAWhEBpIGV9vMumXdkDgRezgCerV4X75dguI0egg9IPckU5fMh
	bTA7n60kHx4RFnAmTo96oGtEp64JHs5hk/+nJHwRNO+wU8FoHbJcLDoFA+ud3r2OuYcU0h234Sc
	eGQ==
X-Google-Smtp-Source: AGHT+IF8JF04aIaURb+TMdlY2QffSZ0v5To8N2ID4w81qBfaHvIcmyhuSKw9WurVeHu2raGCu51Dk0mMk44=
X-Received: from plbjd9.prod.google.com ([2002:a17:903:2609:b0:224:efa:ef21])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f54c:b0:224:13a4:d62e
 with SMTP id d9443c01a7336-22e5ece3e71mr17636175ad.35.1746576966995; Tue, 06
 May 2025 17:16:06 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  6 May 2025 17:16:04 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250507001604.1254877-1-seanjc@google.com>
Subject: [ANNOUNCE] PUCK Agenda - 2025.05.07 - No Topic
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

No topic for tomorrow, but I'll be online.  The tentatively planned guest_memfd
conversation was taken care of in the guest_memfd call.
