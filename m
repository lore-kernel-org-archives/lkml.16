Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5641A2658
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 08:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739004741; cv=none; b=JS5efioR75TJVbR1uW0MT/ougfWh6GxFbA0b/DmeEOJfcI2+gsfBIL1nNtJT7ABfwk8EQsIcrPG4Wx70rJP2uYg/MPY1FZtzipYClOzLU6UiYm1ZfebRdrmkCiu+h8q+GVb+xW0q5WSK86VxYZ8EFEsmWrFxK95Xep5aZ6l3uok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739004741; c=relaxed/simple;
	bh=ECULLkPV4AuAQPEfZtXbNOMju38Vy0yvZVdyQigeSi4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LuKXJkLeYtjajOE1NNLNil0fOk50e24pYMYNPGZxP1oD/z0vJK3hFh2rGiva2liFTJeDvtCmKBX6SgHmpa8jGKbXqBvHRvIe3w97q2KpddYalCRt1i558ZxXNqQt03OtMMcY80vUJ1aMFF5LxAJ0YTQwatltoA1VsGtFtyPgy1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYFXBf2r; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYFXBf2r"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-21f50895565so21895435ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 00:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739004739; x=1739609539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YyDyoD9TacPs+lBZmjke4sp2E1eatcMJb5jiWYmCNT4=;
        b=XYFXBf2rEXCjLmY37T647DnAyc0UOHtJsUCc2QfbPo2GUY/Qi2uJRw+hgjz1g8VEXg
         QYTnWEsMG51zBaawp0oHmFURU+wPspggmDa8u7jmGGq/j2AE8ZUPQYxjvBPXFLCLPx3z
         fM45wlDyUXQON0ZZSHj7y/ksPuU5wq7GvkJHW4n+U4n1KGFI1VtmgzvrEp068q0YoJEu
         vpoPVk+ya9tycRYl3cOtdOnJDeU4XWvbdqYXsOSAr0TT7OsfLpQtRHmRUUyOZrM/l8O/
         uyAwg5QR8f7otixk2bboBTTAFNIVTORSaXyJSrHHZt4TRwNy78o1vlFhwHnqlBFbFKm1
         ho8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739004739; x=1739609539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YyDyoD9TacPs+lBZmjke4sp2E1eatcMJb5jiWYmCNT4=;
        b=piIlSPV/eVkktBW9nlicNEWyZ1w2U++YGXUIbUkv7+kHBRDXrQ0AApAPE+0WXs66F0
         60PxddT//B48tuovp/LB+9f95vKcbBYPFzZt+wXdA1mIy3DF1rGOdUWiqM+cHm3UhyHp
         XFvPXQee7ewpVYdkllnz/IkXlts4b0icfW++vKe7dnBr4tQ+x5J4C/Nh7C5SYIvB2QjT
         tWs31QeaPlblMcF1+DK0DeLZ6E3Rr+UC5zy26scHVUDObxBsElanag0G6z1AOqytsL2A
         tnmga9syFnjLsxCxzPGad0YPPjGViwMcJdW0TQj2IzGz9bO7ydFNsrmsdxShoGHGsIJR
         VjLw==
X-Forwarded-Encrypted: i=1; AJvYcCXvsfGyBW22MRUeuuxEqnGPgGFl64mKX2CzJ1ZLomOchUnAgqnqxzoqtochZVPiq7xkoUqa+LYraBmCXuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIIp87yzEvIeJfIgS0lZumQaOilHmFrXgfDSmZwpdxF/8WfDq6
	cE82Uj6jeneQ8dZz5SJxDnHzYGllw2TQiDkGK69LRsW7ATgKg2e7/V5NnbFf9jc=
X-Gm-Gg: ASbGncvRdOgxz4Sc9oehI4s7ConDu6Cc51Fo0EaUSopB0jeufpzEbAvsRu/7WSfcg/3
	mZvbPRmG2Ijut8chTZoyQDiI18ZX0QShDwIdLDcGAqJ0lrjxPiFhwolP3kLFjWH2EKXkhdfSM4L
	VP3yVz2asaLQskaUAMHMazTLc5X3KiIsTdfm2pMoH/RjULU6gVIUDKMXWQMp4m81lC/YcmUwRM3
	KiF9zvWBPtvJXa4F2h7yxaXkBvVaXuBbB+y9E3adgJPicnjfILt8nGYC1pYhjQnbBsIzg8I8Dsr
	mEppGtIag62xVPC+vBAgA+BESxSfEWhJWRY=
X-Google-Smtp-Source: AGHT+IHCoaIMW6z15utCmKhdFqEM5RAUOsAvDcholSmZbjC9nsvgbA1dkvzJY02Du2ZkguBGP1HO4g==
X-Received: by 2002:a17:903:2291:b0:21f:3e2d:7d2e with SMTP id d9443c01a7336-21f4e6efc9bmr101289785ad.27.1739004739631;
        Sat, 08 Feb 2025 00:52:19 -0800 (PST)
Received: from localhost.localdomain ([114.67.205.189])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653d41asm43152395ad.80.2025.02.08.00.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 00:52:19 -0800 (PST)
From: zihan zhou <15645113830zzh@gmail.com>
To: vincent.guittot@linaro.org
Cc: 15645113830zzh@gmail.com,
	bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vschneid@redhat.com
Subject: Re: [PATCH V2 1/2] sched: Reduce the default slice to avoid tasks getting an extra tick
Date: Sat,  8 Feb 2025 16:51:27 +0800
Message-Id: <20250208085126.24341-1-15645113830zzh@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <CAKfTPtBwRV4ndO5Zao1YbNNSi0EtMbrO081nDKjNvdjmJv5xZg@mail.gmail.com>
References: <CAKfTPtBwRV4ndO5Zao1YbNNSi0EtMbrO081nDKjNvdjmJv5xZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for your reply!

> The explanation above about why you change sysctl_sched_base_slice
> from 0.75 to 0.70 should be put in commit message instead of the code
> 
> With this change:
> 
> Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

Thank you for your guidance! I have submitted patch v3:
https://lore.kernel.org/all/20250208074821.11832-1-15645113830zzh@gmail.com/

Looking forward to your review.

Thanks!
