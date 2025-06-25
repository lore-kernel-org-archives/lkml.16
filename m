Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F79525C83F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750854968; cv=none; b=jmgSLkgVJhiDJzTjkuE67zzSBU0qWfD9Tui+kVAUb7oD00woYeKjFWjptJgdvbKR2u8jIrZtZRTZkBPQ+NIJz9F77a7imH1zwqVDo9+rb5K0ylcibifblJicl5Znwijpio8WGfs0vocFdBdGtpC7zYoMlCxt8JDzdN/Wsg/o6XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750854968; c=relaxed/simple;
	bh=8gvxEe87rQANHTSvFJNGL1YdvNiKYh/OurROwhKELtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kJQlY/tSMBNuqzLxGB+vGuSJRhyxkFgM0I4CwK0q+9M4DcAJx6HY0vh5b9FlVTiuYKVbFT6ODMFaOf2SK2Btqs3hZAXzm/wKZy/HpE7lXm1KTIV2HHGp6gW81NhXWHiQMmQt5af+od6zOULHg21RCErmGgSRQXv0cSLvVA9YznA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWAVVuUP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWAVVuUP"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so9105855e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 05:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750854965; x=1751459765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utxSfQIUzNDyFd0wpZpYOIjsXWTH5XEhERSRTus0EMQ=;
        b=ZWAVVuUPwVwpOCis0bEEJQuI3Q1aYZsWyCe8TnI0RwknT64vAT+Mxnzsz7MbeDIl6t
         sJbOzTcjMNZI71bTvfpGX7j/MLnxJyAeUgPQuiPUfqU1tHkenaU+k86pPUCg9pT/x16U
         0No6CJXLfH+senNqDdp/OO+wKaQKFkYAlFArQLw9Dz9O0zGsuhnYUsPxF9Gr450Fxg8G
         17tNTtsVmFUFM89RWrPv98EZBIdyhcxUfapch1Ymh0uYZm9ZJj0F6LcfwW/oAZKnAFql
         veS3R7KaAyNAQ8EO5McSe+QYLHyH2ijLnTizI7uQoXR7fVkix0KBH9nUEbhOQTTHK+ui
         ZuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750854965; x=1751459765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utxSfQIUzNDyFd0wpZpYOIjsXWTH5XEhERSRTus0EMQ=;
        b=jySqpahyDeelcbq3/sqLfByZ/5XTx8ZUIzIoUP5Cqe3SUpuhoiD6uiOUnFMRqcYU/g
         C/HxfYi9fsK3HeUhwv/FQ34y+MuFKaZKC/8qtKYgeqK8Wj6wjm2gR84lTLpQT/LUu0lv
         EsE9vpPK3gfR9J4WoVAZOaJQpnM8gswnhKh1qwJu5tN+HBHtixouf/kQ93EnHEKRU9cm
         DwNI1H7qM0dwPl3YH5ehuKbziZwRA+/y2o129iKHuUNVP/2KlKb1KC7sjY6InfZEHn6Y
         zjHNuRYBbJQup0W1NL8VeQOD1zoBCNmwHqIjXC7I1cs6V5PQfm0Ie/vdfIRg4Mk9M7PT
         9itA==
X-Forwarded-Encrypted: i=1; AJvYcCWmcqbg1tSrEUTPlA6cP76YtwUMuvo5RaYEyQqnUVbiq4vjhik0DHTRwTOT3t6WaqOrmOsv/DfRlQ9QjQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6+2JayQe5rYXqwOG9lNwxwovg6kQyzBbz5AX2YtF/zhpAd285
	7OLdP2IZfNNkUl25btjpa4HH1G1ygwxduA+5tDG1t9++0eCjCZ6q4KaWj18Xohu1JgE=
X-Gm-Gg: ASbGncvT9Zfja3JSeHThh85160KD5D4BupPNKj07U7Tdrg15/b2UWB4KxjDk5Syp0M0
	8SeMgkNXOyoSFA8b84ZxRLx/CtzP6gELgAJIwTMz8j6fCD0uRFL5TALsHh/70BvGo1fPnXHNKnw
	HMEOt2advhJC3aAtFYshKkLv2B0WVlv3OsIe15UAnNxj5URLKLh7db+BsbNJs4ICbpEv319vJqZ
	uKn4j58Uvq1Wdt9Yeg9Ypn8EH7ZgCUWWy13kHctytM3WJ2o3VGQ9KBZ9P0joC2g4tP4uR4XQqgJ
	ebrWI4Qg1mZQcP+8EcVfw/jDKZujv9jWbcniugU6P2y01GM7+XgDrFnusoiBiZsqA+OosE3xM5o
	z
X-Google-Smtp-Source: AGHT+IHpR4lo9ocHAd6uQqZvgKCDOe86RYPFqDU+jrEBWi/cnlm4y3T0WDIq0VxBKL5+i3Qtu6Jpog==
X-Received: by 2002:a05:600c:1c95:b0:450:d386:1afb with SMTP id 5b1f17b1804b1-45381aafecemr29587905e9.9.1750854965395;
        Wed, 25 Jun 2025 05:36:05 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805112asm4515756f8f.9.2025.06.25.05.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 05:36:05 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: kai.huang@intel.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de
Cc: x86@kernel.org,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] x86/boot: Don't return encryption mask from __startup_64()
Date: Wed, 25 Jun 2025 12:34:21 +0000
Message-ID: <20250625123517.4333-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <487c2747bb4c02d643324292489243fdc82e1c6a.camel@intel.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Sigh... this comment is broken, since there's no '*' before the last '/'.

>Here's how I find it:
>
>So I went to see why this patch caused early boot failure, since the code
>change doesn't seem wrong to me.
>
>After staring at the code for half hour and yet unable to see any issue, I
>went to disassemble the kernel image, then I found the above two lines of
>code wasn't there at all.
>
>Then looking at this again, it's obvious that the reason is the change to
>the comment is broken, leading the above two lines of code being commented
>out.

So what i was wringling all along was the comment. I don't know why i couldn't spot it
if those two lines where commented out then even boot was supposed to fail on my side too.
I guess toolchain difference. Probably this is the reason since i compiled with gcc not clang.

Thanks though. :)

>And this patch has other style issues too like the broken indent of function
>parameters after changing returning value from 'unsigned int' to 'void', and
Could please clarify more as checkpatch.pl didn't notice it.

>So, please, before posting patches, test them, and run
>./scripts/checkpatch.pl against them.

I used it, well the tool seems broken and giving me false positive. I fixed all your suggestions and sent 
v5, as my best i could, i fixed all issues and that patch seems good. 

Could you please check it?
