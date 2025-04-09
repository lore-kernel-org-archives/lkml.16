Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AF42248B8
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744196493; cv=none; b=Io741N+QTGp++CJDO9c7ONPJ3aePF7XTN6Q11wRGyMgfGr/OR9i0pjY4zk7wrJaYTCBhpGRFGyU6B4lO44KAxIoRPNgG/t64rymt270m7M297A6MmAnB75a6UnOIOtEeFtpi49hBb1YNjreC/sMO0d6fMsy09Cfy4TCSz/lEHTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744196493; c=relaxed/simple;
	bh=kbcnBub2qRCGOu06jo+ufjNUGTCmhyGxpUtKPPrK65k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sItxO35e9wzknJ6AtLa40CpYAbBmKJYJgWXuRVPCSQ9nU6sUW8IT6f0uU5o3GN9Y1UX3YadSm7MLG8m+HxFx6NHGY95luReFGQy5huFCkpC2JkwhwcHgnFLzQ1IHRD8NL9bz27hCA1P6i3kVeOiMCtTKs30ZGg2nD4Q8fu9znFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=InKwe0+Z; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="InKwe0+Z"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c1efc4577so3622367f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 04:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744196488; x=1744801288; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WexvrN0iRH6s5lqXIKOGOc76DID+kB8LkmF1Khh6aFg=;
        b=InKwe0+Zr4NPnAaN7KME36tJvgoUSCnXpsh+0E4c+omkT2jYPFPCi1iQaAGFxOvGr+
         8sA4AuTt5sAodApX0OwaoG1ob9tOIM66G8g13MtmdF83DmI7EA0pyeFlwAvhQ9K3zHGY
         yW7vh1M3ykS+6AGNO51Puvbd9jdMR/pEA4AUKmgMOzOTRIws9wyzqwnacYWqjU4VZ+1v
         gCINfWDzGqxeec66CHtzWePY9O7e6uaI/rL5drlzfCznIekjv4IKiWB/5SOFbFM5sYjU
         6ryevgrFMPEyQzi/tUVExaJHAhlGW9PvseXTsGoaPoOKCvfd/8lsbjlzDhdtHKV7v5zY
         DbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744196488; x=1744801288;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WexvrN0iRH6s5lqXIKOGOc76DID+kB8LkmF1Khh6aFg=;
        b=YswODXi7LawsWvjvE4IFDM9rKdfrfaMIJTH7CTH+eGeGAmSDMRLquvAKry+cl401I9
         3c7euwhnmRTkbhvFnTc0oojw/wOKs4288uufV7eFtBEI01o4mRrEqipQamxwQQsJ2yBO
         QhYJ8P2sDepi+i6Yi/nIuRNpTczLh+C8EObdhPOjLaUjDOx9VqmsCKXf7MO6yYhIVWCt
         Egq5ytxZyeSbJQJO8109L5OIs/3vnz+l+Lk+JN7Uq9OxgChcIvM3DHsAGv03YYp3Hrdb
         7sMd1UBc/WFQcsF7Xs/4wO5CXGBz9NfFqtYQfqjD4dRwzWGWlKxt3gamYQ4BtaM/7OSj
         vXGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwlxSHWR+e2abdRxRZ0OG1CzjMmeuK36q17/lvFUNfgcaCQpczNZ9GkXFd0SqEqNPADrjX8M98xJOf+ZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMdjo9HY4cwwrxsDpQeRwhUjwNQlpaCepTfRpdSf1f4xS8BsKR
	S8+Xu8fFk475BrDg0Bbvyw8pTLgvpzimkMBvHk6HpOp6Qmo6lEaqABriG/dzoL8=
X-Gm-Gg: ASbGncsD+wS9lpuKqU9VFenoAbKVuom5DG542fHD6VD+NN8pbgL5CFvCY2kDf/BbF4q
	hvohDOiv9v4+jUK1B1c9kYm+7UomoJqgPb5oMv1Gbi5/i95ZP8yusUnwS+MKOz2cv8plfOW/NV2
	Zogq4ZQje0lkDryG/NL4V1GvtoMX8lmkxh0CToCXkO/j7vxbHy/y/umohtblvqYDlZRN4eze/Ao
	mSwHP1igvysyHb+TPBAVF9l+nIUy13K6xU7Dl1AbQ0ujB9U7ySfk9qMqg9ZY0jHk1DuYzhA7xhe
	wmp1s+Z0pGE34p2UijJDtoUlFnBX2kp+72c1OaS+wfEP6g==
X-Google-Smtp-Source: AGHT+IF2Njmy6uDcmNjK/vqJ2HttsKJfbdo9EDMtXLQyenYtyEJxAD4fQ/53R944kzDkaZ5HLwroFA==
X-Received: by 2002:a5d:59a8:0:b0:391:31f2:b99a with SMTP id ffacd0b85a97d-39d87aa8ae0mr2409272f8f.5.1744196488617;
        Wed, 09 Apr 2025 04:01:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39d8938aac2sm1307492f8f.52.2025.04.09.04.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 04:01:28 -0700 (PDT)
Date: Wed, 9 Apr 2025 14:01:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dinesh Karthikeyan <quic_dinek@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] wifi: ath12k: Fix buffer overflow in debugfs
Message-ID: <35daefbd-d493-41d9-b192-96177d521b40@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If the user tries to write more than 32 bytes then it results in memory
corruption.  Fortunately, this is debugfs so it's limitted to root users.

Fixes: 3f73c24f28b3 ("wifi: ath12k: Add support to enable debugfs_htt_stats")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index 1c0d5fa39a8d..aeaf970339d4 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -5377,6 +5377,9 @@ static ssize_t ath12k_write_htt_stats_type(struct file *file,
 	const int size = 32;
 	int num_args;
 
+	if (count > size)
+		return -EINVAL;
+
 	char *buf __free(kfree) = kzalloc(size, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
-- 
2.47.2

