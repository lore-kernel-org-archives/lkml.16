Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E46229B21
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744125805; cv=none; b=XnHB3cu+xHr/Fwr1zbfgpMIrHU4Daevj7s1AA4IOWmudYGBbXnTLkCVFYOVi9Vziw2zJY+qXb4lvnfITnjsOEhUcvQ+qVQOtgqarpXAuU2i22XVGjRW8233CNzGwIAYV+Lob0tcU9cJet/b9FjtdQ9WxnqJrtCX0PgPavHkVf3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744125805; c=relaxed/simple;
	bh=0NbGjHFA/Uw+XeBsmtArNxJmAVRgP2VG06NNVhzxbEk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dm0uVBjblmRYD+VAVpdAaOK4lUAp1sd17z0FQPGT2znLDk9C8g5YXUKoN8LNR3llyQXg5hBKybweAq3O9NZ6NyfzrWK3KuACN4oHBy0RHhPyEMHXgJyG7rv6ksfKHAoZiGxj7NiDz45FYjrq7pIOmvP4Nsi3c2TBRqBL99DRZqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MlgKR+R3; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MlgKR+R3"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3913290f754so629509f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 08:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744125800; x=1744730600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bz+Bs3liGXitDac5fSoKdGCUlDiZD33IBG8oiYGkQEk=;
        b=MlgKR+R36CrgOiVUuvdVjNnnIMrdf/PI2AMWumxAZcbNINhDNdSO7fMiqfV/3bzg7k
         Bf6QVGl8zMz0SjK3w0CUTzI2Rd6/+TnwKU4B1nFo4zcgPzfAVQVg9JrwAcU8p5txyBui
         sS1XEnhZQGspGYwcPom8d/KY2iSQxtVMi/oZ93zpHQCsiTT1Op5+xn1TOBVHEJXeJwGc
         WyNUTq7OLh/MNzCtCo494bM4QF15S78B5FFHh8RDEJpXM7ofF4DaLAeLpT/XJ3hcUz26
         loldxgwaB2ZlDapmqYjjQMDnpFD6HZTHNKbN88fA8Z9Lgq0vNQ2Rjv88li0LN+xRHaQG
         3pZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744125800; x=1744730600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bz+Bs3liGXitDac5fSoKdGCUlDiZD33IBG8oiYGkQEk=;
        b=HYp0XPFABpVCCeWBAGpcoCc5ykusNyvpJKSudrCCnZ1vtiuc5H8btNyTBl55Y04xSZ
         c0VTLWmConGyibYGn+gqdm7AyMdSqzdTb83lTYe2Yk54iq/FzLUYWykGAX294CHn0lGw
         UC2pSLNfpWnJOfrw/765AIxyZfyjXAiIeLXB/KWqshfuXehMNvwLLUmiBLESbvp84dpw
         MpiY7Nivy7GOfgHo8tHPx9oEaJKYzvc5jkqATCZ21w3MYyOPt5vEykW92hVkxLoE4++p
         Gk90ToCincgEiJrvSjh1edgh1Q+GvoDDRfJOiKD5ihEpwICgFGgyUXu2gfEIMqPNW1FY
         DCxw==
X-Forwarded-Encrypted: i=1; AJvYcCXy+fzl+20qIlh3rU+9GSoQt6K8TlM6CDVddTgEJqluK0gbBV854eLj3e3l1npHyrNvtCr0X4cgURGYT3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsZ9D99jue1jiIz16oReEqZbuOd8anHlhlMzonJDRntAQHZ6m1
	YEjialrAEwGHnHPuNsHisctKyHALFwStS4YyO539pUuls46yoO3CCuKwRRNSZA0=
X-Gm-Gg: ASbGncvnR3NLFvolXrSxwd69Hsqg+KvdAF0MLW9sGi88xtaHBf/5eJ2KRvcOzDnQyEV
	uUQcU4oevwR2Mu+U9WgkQsapAcLhuzFl4fyhZNiP+QrK9rAks/ldDekl9dcpjRNtMKNBYdaLP1s
	Vm/Xd9AWiTnLFYS2+nC1Xw2ZGYiNIO9d0Q+OsEaH6ZmikjFxz3MRmPjsnka4b8H5EHM4LqL+HB4
	UeUSR6Pm5CeBhSe0ithHIjFM7+wIukHW+QC2iqTTMXWqmpdN2G7goBmby68uD1oQO+gcHclAleL
	lt0kfR84EGmT+VQ+TcHXVxnbiOmguNPXDkU/U1fGxwTvjw==
X-Google-Smtp-Source: AGHT+IEz9HHlBEMjwmttz4NE6nz9WMJmIdm2e9g2AbIGCuNCiHrT1FJw1r1H3ZgrQAhiBTgM/eUf7g==
X-Received: by 2002:a5d:6d81:0:b0:38f:27d3:1b44 with SMTP id ffacd0b85a97d-39cb357b616mr4976593f8f.2.1744125800057;
        Tue, 08 Apr 2025 08:23:20 -0700 (PDT)
Received: from p15.suse.cz ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9e9dc9dsm10990155b3a.96.2025.04.08.08.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:23:19 -0700 (PDT)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	gautham.ananthakrishna@oracle.com
Subject: [PATCH 0/1] ocfs2: fix discontig allocating issue
Date: Tue,  8 Apr 2025 23:23:04 +0800
Message-ID: <20250408152311.16196-1-heming.zhao@suse.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First, I submit a PR [1] for ocfs2-test package.

Then,
When running ocfs2-test, I found another issue about discontig
allocating extent. the previous patch [2] is not enough, so I
send this patch. And note, this patch code bases on [2].

[1]:
https://github.com/markfasheh/ocfs2-test/pull/21

[2]:
https://lore.kernel.org/ocfs2-devel/1f3049dc-5536-4a27-8768-b264be062f7c@linux.alibaba.com/T/#t

Heming Zhao (1):
  ocfs2: fix the issue with discontiguous allocation in the
    global_bitmap

 fs/ocfs2/suballoc.c | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

-- 
2.43.0

