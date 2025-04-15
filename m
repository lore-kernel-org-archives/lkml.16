Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FCF221549
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 18:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742636; cv=none; b=hPZshe6P5zzQUpMgmlrX05VkPcnWZFAID2xe0Aos99jl36/JXOVhG5HZcVIv43ZH0Q1M1nNvq55mUuCjncWXQ5McrKvuMWas1d5VW7gaK7a/aitRm5Jjiib5688hSQi8SjjylZeGQAQk+tPF01RZMnTZ1gGF41/5A0V2k1IrJKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742636; c=relaxed/simple;
	bh=uov5pf2FdkO2Gsa2n0Ob2obAF9nGPbtTncGp38+Ube8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ghpW+KvCvVVnJGNUVx+8eOVqg/xivYzfo+iW5HbTiKc1VzSiBVBr/jCXrjKVpDBpHEkoCaMPa1P95DwGCUIRjaQ1Cvk5HH0OPCC7P2wsF3eJtcbrcMIK8SPz70kU2+smnEdqQ06LMxGCd6zxb4xB5Ld0pATXmm1af/AhyzheduU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=NTvbSl/0; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="NTvbSl/0"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22409077c06so78353725ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1744742633; x=1745347433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vsqX9FF/96tgvWv/MBEvfR9STkMTnr/F/tKaBfVEUTE=;
        b=NTvbSl/0FCKvIYuFCSRMs9xpDRLnv5E6X3e6svvD5SvQdP4O6COvKcGFAXw3JMZQzF
         EsGeMegPa3gU95hy05ZLen8D07n+cpxufvEg+NWA5loM2WCYWi4CQ2HSu1zhdrzJqYqc
         rvUrgonDr5sAnSd00Rzi3EQFBKXDKerTbxEZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742633; x=1745347433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vsqX9FF/96tgvWv/MBEvfR9STkMTnr/F/tKaBfVEUTE=;
        b=RhbE81dfzYT2D0cHgb8+GFicMoCg9dXFi9bwHFsDEyySEKBwrj0faSEm3ByLU6dThK
         f6fHBs+gVFBcypkD9o8spmhbe6fRG8HQHroR6Lpn3kvkLQllDdg2oQ0s/1kafCAcnVIl
         GZ+fiLv7ysk+WvNDzZpI1dQ+gukcYRB6kDmGd9w/K1QPZZ3kjR4QWWDROoLN/ok9WVx0
         V+cKM2uLfFs6LS6ba6nvShQJy9ZTME3L1e2kprOZO2IDGDN7K4A0sDEge17NYRGLkv0o
         CkR70M5siBuBa321l3WC29S3iMAbF562kW+EyfPtREzzjr3mo6ERUTjz93F3oQaN6+34
         1afw==
X-Forwarded-Encrypted: i=1; AJvYcCXMWkQRY5kxGCKTpMUFw1pY/iKn9nr6gEb9I4tJPS7+4myRa4os+J6N2H8nrLPnQhhdFvAmNdxRduMwVRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQKdHkP4VBaQQGSFbujFrZxuq07cLqJvv2O7glyw6azKBE1GjI
	xkmsiNj8egiRn7S/Pfu6mGFwfLLK/Ge7c2jMfwiBh83wYU3DuH/TCBWH0Z7rCzk=
X-Gm-Gg: ASbGncvb1oX9hjR5C+iqjB+BZe4nzvDuN2Vm9xguGjPlqLsqodHeRj0YgMNvN9BpDuh
	oNB0vY5/zwm8pk4vmH2fMi11bTTtvpoMGWtIjKmHshDy6KZMAeUKWVs2fk0/ROpnabXjzukO+Qc
	BgdsAIvLsqNwKlVqG0dv1Fl5VR/eUf7yCsnm1yRjs9BPqRDlpOGwRikPUuld9nl8RV94j+Qt4Ab
	bd8i+YkBeGU3C9E9GKUX7Oi8ayJ/z1bMd+mkUFdD17g1URyPjp7gkPvy7DwYYgYcAnGej4zFwVF
	r0Vk7IL+jK2qjbHa0aGBm4j64Vxs4BDlwGAbB+iai7JC4beP
X-Google-Smtp-Source: AGHT+IEMF7kJ1BVNruMG1QJeIs+nIXZYq+KKJZbOCfzP18tQCrD9H3dYN/X4lmLNx7Ghzq3ksbhYzA==
X-Received: by 2002:a17:902:d4cb:b0:223:5ace:eccf with SMTP id d9443c01a7336-22c319f64d0mr2924155ad.25.1744742632722;
        Tue, 15 Apr 2025 11:43:52 -0700 (PDT)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb7b5sm120514455ad.237.2025.04.15.11.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:43:52 -0700 (PDT)
From: Joe Damato <jdamato@fastly.com>
To: linux-fsdevel@vger.kernel.org
Cc: Joe Damato <jdamato@fastly.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC vfs/for-next 0/1] Only set epoll timeout if it's in the future
Date: Tue, 15 Apr 2025 18:43:45 +0000
Message-ID: <20250415184346.39229-1-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greetings:

Sending as an RFC against vfs/for-next because I am not sure which
branch to send this against.

It's possible this should be against vfs.fixes with a Fixes
bf3b9f6372c4 ("epoll: Add busy poll support to epoll with socket
fds."), but I am not sure.

The commit message explains the issue in detail, please see the commit
message for details.

If this patch is appropriate, please let me know:
  - which branch to generate the patch against (I suspect vfs/for-next
    is wrong),
  - whether to include the fixes tag mentioned above or if this is
    considered "new code" instead of a bug fix and I'll omit the fixes.

I'll re-send as instructed (without this cover letter)... or not if this
patch is incorrect/not desirable :)

Thanks,
Joe

Joe Damato (1):
  eventpoll: Set epoll timeout if it's in the future

 fs/eventpoll.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)


base-commit: 2e72b1e0aac24a12f3bf3eec620efaca7ab7d4de
-- 
2.43.0

