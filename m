Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA88148827;
	Sun, 22 Jun 2025 13:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750599245; cv=none; b=BNu6gT2XzsyWDrxtRF1zDZOdFl81LcL+qLjUYi1d9zZ+96wPCctUQANelJLOafyNnMxc///ovmr0PbhsDT22KSfgboB42l08DkVzA23SAt+Z6EJzCSy+0Oc7e1v6U18vmSbtLVkqQYlEzuRz9DXeSrFE/PwO/0KBqP7y2xC/JKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750599245; c=relaxed/simple;
	bh=HHQx6XI8PUXoRsrgzuEZOZPBz8v2UtREYWVc/h1FARI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VAc+h5L3p0vaOZdZxOQEn01vsb8q48arNvkewmw4G7Qy3/FBFOzS1Egu+Zq5LxD2yy2KVXoGnPSY3kdH6mJ32sma/5vHfNqIiVdeHufJB1o2tT9/5CQPIfbwls+lTRdS8BgYskXO0NK87rhajpmmH0Dc6eKm09PkYG9XN0EEkJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngF4o8PB; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngF4o8PB"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b31f0ef5f7aso1542037a12.3;
        Sun, 22 Jun 2025 06:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750599243; x=1751204043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHQx6XI8PUXoRsrgzuEZOZPBz8v2UtREYWVc/h1FARI=;
        b=ngF4o8PBjxwGGf1rrONnbNyOUAINN/gz093/criIfOWtcKe//g7bRwv9ITYTYpmvSN
         kFFMTb4aRjI3R/dCE9rvjc371BtVShmyHgz287rERNh+xfKIQaH24aC8PQcknUaaKIOC
         Lt9qL9pKznhy/AbdErWSUCdUe2fLECbVAiH+CZkfFtNAHxtdd09RqhjiYpVxGoI1UNoZ
         ENY1kxm/vG2Ze1wE9SY5tewp0vq+2H1s0MXsMCVcTRN1qSAFtAyJMBYyErKGmEdF2pYk
         amK8JfV3vz+8NUOrRmLvC5mfK99eqTf/JXITUlqkdJrn6ELGD8BxMu09ppz84iSb2AXk
         zZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750599243; x=1751204043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHQx6XI8PUXoRsrgzuEZOZPBz8v2UtREYWVc/h1FARI=;
        b=I2A8i+6v17vyvkHXUnVNdAs0sCtLTGqGA2VZvDrmw/HjQs7Bij/vhCwvTPs3mPP4vf
         RcNgDzPX6kUzogoTTrVC0wnR181pwe7bHGEqfS5SFdNgW8L+lUwUF5l+vWOSGUZheiek
         oe+bqNyFdA7alZPH5vFubQE1VVkYNg8KWv3GPeLDUnUoQ9eXQHHTbsmm0WdKCng9MxI/
         2zor0rtRaC3vlbc+hA4zFVlT2afloRTZvm9mcL4/TxgQdsbp2UJGTf4qL4/rB6/Fh1gX
         T+g22Nct6jWeQBPI5EuAKu7hG2e1dA2f/MhJVGAUeyqS+eZjsDrY7ln4f3Kct+bT9WJJ
         KQTg==
X-Forwarded-Encrypted: i=1; AJvYcCXQfFmjI2yN+jCCsw46f6IKLRz32n+hocJFxk73lZcckrWIDXb7RlgHHMTw+jwMB0EjqaCXLOBSchE=@vger.kernel.org, AJvYcCXYAjixbDwb1oyWKKgQvyMpZ+WpNrruj90fB3FJHy/EoGguBa6sEkD+bgU+dpM4mmsuLsxUncbq4uM+qyQf@vger.kernel.org
X-Gm-Message-State: AOJu0YzK9+kyShmyPRcRrrRZprOSlRed6qAcBmzaLOAqS4VhiHcijB4a
	FqcaPcYJE5mQq8j90aadXZOIvHVvCw1tKlLNltoOc7BXRaKSkP3TF3dI
X-Gm-Gg: ASbGnct6cGbnLMVfGDXsSCcqJAbVV12veOaz1Kap/oAoEPjOLpVPuDIOrXx1Rh9UtaJ
	Bptclnaw+YjxBJhtqKVh0Guk0nCedO5B3260+5WkWenlBMvLVheYtAi992t6AtXegvDbSW2CO+/
	LvVYX7XNOZ5C9q7QfkToqV/dLCrSZoLjj1UakaBk2n5J9GRN22NQcxOMK4RyXCTnmSH3pwKfs+6
	0JBSnUcjaZPmu4lVPArdRkmfMlwfpq0NSMSHkxMd0AzndUdqQ8OWba6nS+/vk/gmmN067Wc1Dbt
	P3cGDH04K3RWvjXEf2eeuWsWYx0AqR5gYv6EgXSd1uy7dBW1XPL2KsGwHBPFbwO+jMf6mHla1AF
	9eK17ucF7a+8VKnmzprRyLhzUvK3GgtsUD6ZzhImuDRLJ2A==
X-Google-Smtp-Source: AGHT+IFtAu0RSGb7WSIq+yHKoxKrfiIRV33NQjJdCmh9pXaXj5Ql2KmPIxcQP2ykmdpQ1rt5T3fWdw==
X-Received: by 2002:a17:903:32ca:b0:235:ea29:28e9 with SMTP id d9443c01a7336-237d9a74a4fmr166500735ad.38.1750599243069;
        Sun, 22 Jun 2025 06:34:03 -0700 (PDT)
Received: from localhost.localdomain (36-231-187-194.dynamic-ip.hinet.net. [36.231.187.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159df71bbbsm6475665a91.9.2025.06.22.06.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 06:34:02 -0700 (PDT)
From: Nick Huang <sef1548@gmail.com>
To: sef1548@gmail.com
Cc: akpm@linux-foundation.org,
	alexs@kernel.org,
	corbet@lwn.net,
	david@redhat.com,
	dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	si.yanteng@linux.dev,
	vishal.moola@gmail.com,
	wangkefeng.wang@huawei.com
Subject: [PATCH v2] mm/balloon_compaction: update Chinese docs for movable_ops
Date: Sun, 22 Jun 2025 21:33:08 +0800
Message-ID: <20250622133308.13413-1-sef1548@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250622004249.9083-1-sef1548@gmail.com>
References: <20250622004249.9083-1-sef1548@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch is identical to v1, with the only change being the addition
of a missing Signed-off-by line.

Sorry for the oversight in the previous submission.

Signed-off-by: Nick Huang <sef1548@gmail.com>

