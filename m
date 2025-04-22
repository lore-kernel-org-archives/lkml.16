Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217F82066DB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315646; cv=none; b=CdwggdR78qRoKsKXuupsdSDHWfvVU/UectkugfFutQbv+mZ6ahZ8TCjhjEQL7dO8uQv0GSd4ZGt2qa/zIvXs+a/EvHX1DXQadTubA3KVzL66I3rqS7b+R+1tNzpwb6eQcfWWyqQuVvXchRDyMOP+VlwHZSKdVeopX9hg41POKyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315646; c=relaxed/simple;
	bh=egRR99i9nHWRLJSkLdIOmqIX1zLBqzvayXnVEdpZ92s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ifyArlwAOCK/VZj3M1PJgObSk4b+x3+kS7NrP7YWdWKTwsQLcpSdt16yEnVeo61SpanBj/W1IgjDsN9pg/fTgENLPizRCpp4rvCYBPCqaGHlkWsQfpWcS3DR2NXym5eiKM7Rfrr3MVCrCl7kJhbH9JCg4+M8cSZ3n1Hw0eJ9b9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l9a9vsHB; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l9a9vsHB"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-223f4c06e9fso41594335ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745315644; x=1745920444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iPZNfcaggW8uG4XfjMHFTZr4Y8+XA41YuZRRPWh0lH0=;
        b=l9a9vsHBElBpk7f9N47KZ/b8UBTiLIrRttfW4lCISTz02sXkE0vrYFxRtkVKCzZte1
         7xUdMB1oJQGzbtFY9bIhhB9p2wRwlwDi393ec03iqfkdJLWM67RRjxszDk0zo7WHeu1m
         +d3Of0ugO7UULMP1sxfvKoKvEzJehKUfS2HhXKxs37SdEnhjpJ9HOhUymvsajY5ocXBI
         smqppvIO9ErQjHRlZFwClTFYs9PPyNaq4rDm6Ja8uaaS+i3cx1wYG4x+PbV7rHyBspdO
         5Bv9xLp3wU7Gu2WUUCJlGnq8b5CTiAxJOEhQkLmOkmPDBuVNkJKU9eGUxoKqkFGIxPrt
         nxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745315644; x=1745920444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iPZNfcaggW8uG4XfjMHFTZr4Y8+XA41YuZRRPWh0lH0=;
        b=L7TYBD/Fyh6uiwOKslQcyA6angvxF4F8ubRFfy/Fjfn3julUyFjwSnik1CF78eBVfp
         z9+xW6DHUP5xfFQrIJmvRWnTym4e5pyyTpei2IqXhreKv9CMyCnEMbqnt6IPkj4KLVMX
         896K0MYgwbo9Gtz+AbmypJxcK/LFPvqvhzf//xT451HNDFIbYuWQ0T/Xiz0ZNY947T/S
         ccu90fpm7gF75SUiVCABywOQJyF7jI/OzaRXyuziDTyRUTEhRezGXVX57ZMreAGzhz75
         Fs5NIdvffyNe3ZfkdIXNRQ66IsAWpbK8Ra9KO3YFp+DbO9mQLKBI9yYrapCHQMzd1lIC
         HcuA==
X-Forwarded-Encrypted: i=1; AJvYcCWE0EyZ0yLimXdxHR/HbjuWshOVnT3n2NMwnvZU+2k3PfIVnkmxdWmIp+qOPHKeMsfZz+CKGN06ORXVcXc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz8HaY6cVmUP4Mkpzbmp1pKwpVZcqZKkBpcCjdZk+TWyv1KTWY
	6HhZzA821aW4qn1GY5CDwCQVYSE3BsC8yVJuyT8iaxB+CaYx2yohxApxawu9P6g=
X-Gm-Gg: ASbGnctbkk825ka0nZpUucT2Ao3JWfCq3omOewS5hDXsTeakECPU54jJrJMjeteGvOL
	wUmTLc6zRn3lfMBf2qKERzL7ooTs8Sxm6x0SCmBky47AI0lTK+MLkLGSS0n2NlF06JlyqK2spoY
	ltJoOOpI1lcZ4bo/diPIrKIdaFhdNZg1y/Fvip2C5xB8bd8a8mrso07nDOp7TnxXX+NmenJ9dJp
	0wCI54WzYVkT/cYX0AU3pkbRtyX+oxKB5mhQRe5iMJQvMFnGKOm0yHQYdjibX2fsEtaX86kkIku
	Aa3Yf13p3JS2nqawRer58sFjWAfAtO/mVA0Xc6KP9g==
X-Google-Smtp-Source: AGHT+IHKou40qiS7674aCZgsNbYQ3NjPMMj46gtqN3TSMH1ZrnQNn1nfjehtyZw5rtQa72SBcl4KYg==
X-Received: by 2002:a17:903:3c6e:b0:215:ba2b:cd55 with SMTP id d9443c01a7336-22c53e1a157mr219276895ad.2.1745315644374;
        Tue, 22 Apr 2025 02:54:04 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eced75sm80823325ad.173.2025.04.22.02.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 02:54:03 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Nicholas Chin <nic.c3.14@gmail.com>,
	linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH 0/6] cpufreq: Boost related cleanups / fixes
Date: Tue, 22 Apr 2025 15:23:50 +0530
Message-Id: <cover.1745315548.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series tries to fix boost related issues found recently.

The first two patches (hopefully) fixes the boost related breakage
introduced recently. These should be applied for v6.15-rc4. Nicholas,
please give the first two patches a try.

The other four patches are general optimizations and fixes for boost
handling in general. These can be applied to -rc or next merge window.

--
Viresh

Viresh Kumar (6):
  cpufreq: acpi: Don't enable boost on policy exit
  cpufreq: acpi: Re-sync CPU boost state on system resume
  cpufreq: Don't unnecessarily call set_boost()
  cpufreq: Introduce policy_set_boost()
  cpufreq: Preserve policy's boost state after resume
  cpufreq: Force sync policy boost with global boost on sysfs update

 drivers/cpufreq/acpi-cpufreq.c | 38 ++++++++++------------
 drivers/cpufreq/cpufreq.c      | 58 ++++++++++++++++++++--------------
 2 files changed, 50 insertions(+), 46 deletions(-)

-- 
2.31.1.272.g89b43f80a514

