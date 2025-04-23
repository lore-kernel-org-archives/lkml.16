Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A23E191F7F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745381012; cv=none; b=I2VpI20XC9YrNzUMkpm6YCPiuUHGJvdfnEjb5xwVN9tDserw61yI7XoyT27tXgZQibFNJ3qIyRUCNhof6FVq1frZn8sjS9RuNtu24iNJa/uG6YqYfw3aT2ukClfLPrsD6uTvFDcP6OOfIMyu+uaQNvHWNiZ5EdFoWr1COoYh+14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745381012; c=relaxed/simple;
	bh=sEsKAWQ6ercVp7cRPavLEhhmptGGRcHOf5HhMke53qU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PqDGEYqOYRcr3LI7p/fjkBSydrr75OaeGXInqe0r8F5J4Odr8Zsq/IS6H0IAvmxMYUt0UK4QcnnyBLzMz1RDsuP2BQJp2c2EjEm956MNCoX5riRS0jiqlFCsUPbddWLxGSTdn+kyhZL4zjGPrb8vQ8RM+m9YM+8FPrv1RZtJpXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kJNAi6mD; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kJNAi6mD"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so849717066b.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 21:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745381010; x=1745985810; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sEsKAWQ6ercVp7cRPavLEhhmptGGRcHOf5HhMke53qU=;
        b=kJNAi6mDYdAcjJXjDXQyHPyaILbjVmeiEL+u2yPaNVqgNwjD/qn7qPUZCNmZ5w9/xw
         rmKzCPqw86awwDwQy9w82XpME8zWjr74zqJbU8JeN7Fc/Ht5rvaw7lrK+Spyhk+ewpiD
         WNJMnLX7tjAsz2jO9SLSboaniCnWOQlM11hWdaifBxgDuTxNtrzrzxVmrFWQcvDhKiIW
         MFR4UoAbIbYJyHo9/VD/cNnoF9kXgFaVnCD6C2x7ZPIWauI6+uKTteSclPgFwXB+oPCu
         MKbKk8m18lwZvLNAtlLbmRfK712XQpYNPh2Qypom1JtiYkLZSM9ZbgF//uTiNWSzdkov
         L9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745381010; x=1745985810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sEsKAWQ6ercVp7cRPavLEhhmptGGRcHOf5HhMke53qU=;
        b=doe5MCBP3IhyETw7nYb2dP51/Q+2+e6W3mfbAmOiAivSDFf9SeKeRrtq0biq9+g1S0
         tYYnaFuUU0zX7loz1G6jKTUAsfaQ+qmzyoXpCoXZL6SOFaIlSwISxxgdgrOvmG7Cutlm
         tOSrhw7RKCtRxkBB2KtPR4swa+JQXpjrqglHsUEl3u6iK4NCrhVFMKQ9rCzBzhoPntHi
         Yg+OE7zCE0GI807j1bDDtqQYFjlryk4NMM8zBw5whJHVmpan53qByHCIFyv2Ist2viDb
         E8/Eyd07VtGx+5aXNvzXzUDHM3sc80Sc3lDLPNIdXFNyKxbtVmiQHyXBC2zLtTj5+SSs
         woCg==
X-Forwarded-Encrypted: i=1; AJvYcCXwSCVNERsCUmr9MuvBWS5unY13FQEk502eASCwI32VbzdjdyYIW1bp0pH9HiQle+Puu8yhFkZHzuBmSxc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIBxILckCawFsbiHMOU2fjj/t5+MjWcn1fslwhkYNwhbi1ofaa
	SuLPMzgsmwpuGdQguhExAcXH9OiP0XY8Dg1iJUaU55wErHnDaYMZp44O+I/3NVevloHl5SJ9eUh
	hW1nx3X562h8LYrzMfy3LwFO6LqET0t5JAU+W
X-Gm-Gg: ASbGnctqFR8kfp4RZQ9XrhlqOOYnx8lixJM2k6LHyjHjG90j95aQTTmqeca4dMMZfJ1
	ihjX2TpPvfMuYZpS4zEpPHho9kVkAIFQ+CCkM/8VJOq8rnUEJpZz+QktjgMKxFj9Sf9f9iCFqLo
	Qg/C0qmgQc6tf+rMeDbg==
X-Google-Smtp-Source: AGHT+IG2hQRFHZCruzqyHNTCSbKVoad8NGLwftg2olIH1TLMgSCl8qIOGnRYXmKp4b5vplSlTZlrkgmHAZm0Twr2M5g=
X-Received: by 2002:a17:907:3d8e:b0:ac4:76e:cdc1 with SMTP id
 a640c23a62f3a-acb74b372bfmr1197543566b.21.1745381009127; Tue, 22 Apr 2025
 21:03:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422234546.2932092-1-dhavale@google.com> <7a433a6f-4c35-493c-94a7-0f925ed52230@linux.alibaba.com>
In-Reply-To: <7a433a6f-4c35-493c-94a7-0f925ed52230@linux.alibaba.com>
From: Sandeep Dhavale <dhavale@google.com>
Date: Tue, 22 Apr 2025 21:03:16 -0700
X-Gm-Features: ATxdqUHNIzFZtPoi0_hhnWqVp_TxLrcGudCIAQBWCUwpvzJUhD5KEx4TBUdlXqc
Message-ID: <CAB=BE-QXYR-3-Jtfk8WpLRM6xus5Vo5Xja=sJgQbDpraOnUyNA@mail.gmail.com>
Subject: Re: [PATCH v3] erofs: lazily initialize per-CPU workers and CPU
 hotplug hooks
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: linux-erofs@lists.ozlabs.org, Gao Xiang <xiang@kernel.org>, 
	Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
	Jeffle Xu <jefflexu@linux.alibaba.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Gao,
Thanks for the review, I will work on v4 to address remaining items.

-Sandeep.
