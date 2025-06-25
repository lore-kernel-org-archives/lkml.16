Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F321D1FDA
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 00:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750810254; cv=none; b=QDWkVXsb7ALAQ9BHWiBCPeGuTtdqF6i2YR402VGVDR7VAI2YcJ6O+NiGh+Kh2VZVVu4jyNP8Kas1L+5JJpSbwCMsS9pesGp2MGawSgVtYEsxVJdthN0EKTRCilTjV+uqNbAOEAp/DVl9PtO+BqwuMJfKurh3Wt+1kYjOV9yjmxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750810254; c=relaxed/simple;
	bh=9ivD5AaMhRDnIDnklljlK+k1JVxliQvvRwvsCgoM9ck=;
	h=Date:Message-ID:From:To:Cc:Subject; b=pu8f0M+kPhqd6mzE72lxPH186d9x/WeLpKFYJyfh31PDKQNcBFL5xZ0Ii+YtC42pvYUaKAETkuBPkF4swRhiQN4OGDYwX0IgfHM7b+pyOtn9Sav6E5C1N4/GEbgBDXpzWPnnVprDmvE2Ew5pfDw/DvH72V74mYR4QM39CZpW4Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=TqG2G9Tm; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="TqG2G9Tm"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d0976776dcso690155585a.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 17:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1750810252; x=1751415052; darn=vger.kernel.org;
        h=subject:cc:to:from:message-id:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zL28Tc4w5+Q9+lcS6siAOTOvpsM1FGjQwIS4zdqxK/Y=;
        b=TqG2G9TmsT9W73nwV065TYKqyDZr540bCvd78cgAbDNcyt+VkmQidpBM/aXHlkUBrw
         BScrnBJktJj9q64n0RnxMRJkv2hSA9z3kB31gGbnB7APCpyfm9p5qf20U0rgkvhzkVqe
         2X7fzK1fIIRhuNH70P08WDm8LLWxDlNRjVAjqVNkzlKf/4043NFgeU9djry35qQFxEta
         QG675alk+W2bSgqK3JYCSPytVS+rfuUE6HmE7Imi6yHzRpAJcQOEKFvpnlvIGpUPdn0y
         pcCf2WppCQRpHA7uAidxYgHSuKoUjp9Y9JBkfr+AoCi8sALC6AbOf1Usyk9+v602464T
         3xaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750810252; x=1751415052;
        h=subject:cc:to:from:message-id:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zL28Tc4w5+Q9+lcS6siAOTOvpsM1FGjQwIS4zdqxK/Y=;
        b=mtQdr9Hnvc2214aiW3u4gy5s8/2tTD9k8aoPfevSBt5WH3HZJxEU57MjcyB65EJz3C
         PARvyzCP7FbwghqnrmwUghQZegflaR6yrwIwDe5V8XCg2XVxIfLNaHuShZWrEZCd1Uc4
         Z+0fy0M1LBkXK0GRs6a1YS8Ho13XSb95VLZrxTcBAYBd4Ypb5VZbz8zpezKw0SPyjlVk
         gqBPMs/ni3LEEHkx+Xi5LMSkBPS+gRwBCjf/IQL+UjHz6hVN7CTktaHpxXddtgW7n3rD
         scK8+HuIux9p8Xpvhs3rNEZTtfQexSXBH0fZFIKESutVO9f/8ujr30je0jqAo23y2vrL
         nrIw==
X-Forwarded-Encrypted: i=1; AJvYcCVY/7GJbHhgCxPyfuLCeOlveBdtxPjXnGq2aM0jG8poera03y602beW7DNy91KWM3ypd9T60I/xgxulcIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLFHraDTQ6xQg7m8D3gt6oh8xL8oURu+kp8nlemUy40xs+hvaB
	4E8HQYvwGf48QbzSGiA76N6t0V/vQtCzI5Bf4FsXZmIl+38piGrOyhuW8fglY8CxDw==
X-Gm-Gg: ASbGnctaSpnkCKjHlIYIAVLx5dJ7LmfcZQc+hYMVHHkvYTT32Fzn4w3ZnqwMiFHViwn
	Gzw8zWLJ8mBnWoiKxCYBH6ueDguRCfN+jBA9DuYydqFI5/dunaLMwiqyrxo1BHvSt/W9Ohg0RN2
	0ts+s6d3wVlY2pqCVwzegCRkQ2K7BUfYdlQZMNA8SteTJHCkxhUw/6rX2j/RgkD7C9VgITnJYJ1
	IQ08jRrGF3l5+JlKK1wEj6CGkoUOafUg1tBJC008+co9c6zeGZCn0JDPAar2Y4YvKXtyBEGAzql
	Y6crfgBQeiIVEoNH9SFstm0fAU/4NOhDBCu6gLP0G6ChqbPk9Kgfo3sMdZE1KQpxfRpQa3pZ8TD
	rH7MfCOubJj/sWzAV1bonHPG0NajISFI=
X-Google-Smtp-Source: AGHT+IFL+HjknXTXoFRm3XUtKW87TK5WTKCaVLsRbT3brEr6WmdayurdNBDLXUWYy5PXbZrC8PQy/g==
X-Received: by 2002:a05:620a:370c:b0:7d2:18a1:ce0 with SMTP id af79cd13be357-7d42974ba31mr151411285a.49.1750810251876;
        Tue, 24 Jun 2025 17:10:51 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fd09442d14sm62087126d6.34.2025.06.24.17.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 17:10:51 -0700 (PDT)
Date: Tue, 24 Jun 2025 20:10:50 -0400
Message-ID: <190ee36309adb0efa27e3b39a1a93de3@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: selinux@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] selinux/selinux-pr-20250624
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Linus,

Another small SELinux patch to fix a problem seen by the dracut-ng folks
during early boot when SELinux is enabled, but the policy has yet to be
loaded.

-Paul

--
The following changes since commit 86c8db86af43f52f682e53a0f2f0828683be1e52:

  selinux: fix selinux_xfrm_alloc_user() to set correct ctx_len
    (2025-06-16 19:02:22 -0400)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git
    tags/selinux-pr-20250624

for you to fetch changes up to fde46f60f6c5138ee422087addbc5bf5b4968bf1:

  selinux: change security_compute_sid to return the ssid or tsid on match
    (2025-06-19 16:13:16 -0400)

----------------------------------------------------------------
selinux/stable-6.16 PR 20250624
----------------------------------------------------------------

Stephen Smalley (1):
      selinux: change security_compute_sid to return the ssid or tsid on
         match

 security/selinux/ss/services.c |   16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

--
paul-moore.com
