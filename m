Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E02A214A8D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 11:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743591766; cv=none; b=fQ+pMKtEvGyhmsO5ITso/r+CYuU3UBi2ShjjagqF2zKLbzhJFM2amsWheKq7xOK7rPMoo0sMb9BzVfPN7eyMUmrOfeVDqZWUqCNZxT9WADfwmFGWthKvBfLH2OXQLBUab6m5eYgk/eQ7bofIKwyW6ValSN1J13S0kYI2V03oaR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743591766; c=relaxed/simple;
	bh=/ksHMeBu/p/asNzn0ejbgAzHS7nmF3zhaWIA6ZgUn2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=adfxFe00w/MuCBH4MnL+vLjMul9eXh0NOplaZjbeXEXnLIqnnd7wnTusP0DfSz/P4LT/77qQw1dpGe4AQHFdJW9jYIUBbTbYezr3oqTThLms/5EaVBw59aEe9ebCx1LN3ECEMdEoouYPVP858UTM8XmaRW5zKbBwaKDbpZv3+KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FOSbTBU2; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FOSbTBU2"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so71519195e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 04:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743591763; x=1744196563; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GPszXvzT1nBu1lLTF10nosvpBa1AQVUmdaJflyBmnvA=;
        b=FOSbTBU2yUZDuXFdijjS/bTo04BelqhiKRVjT8rPHXrXERtTdR/4Vg8C95WgQTWUkp
         rm3cT+b25kcM//rOIcqxfs71vOnUfnGTgF7NhotEUTzfZeFRMsAbRnVnMBeuwtrS2Spp
         0vN3RuVElf5bIcdr6iHX/BYrt+LpQbEpkUuwVM9KWZIJcH4JjjT3kWNZoGJUPlyKYwV/
         IWELFqtkq9W4FLbrnbhu2glbTUs8VVClvDXiw3bniidG0XaV5H1EBC9dBagaQknYeLBz
         ZBlziqjpRuGEPfE2XBdko3ozr+mbnu/UuqlKSZh8VYeTSwZkhy8OXs1hGzzNH3coiV09
         EzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743591763; x=1744196563;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GPszXvzT1nBu1lLTF10nosvpBa1AQVUmdaJflyBmnvA=;
        b=YfeaiRLuoS1W80A7be8owkDZ/IfjotG89P/eMGBgK+7VHKNkryGDtt+ZP0Cpjns9mo
         6lY23GfqFelaafhlxYihJbljDZ/DOlcmHzOeY1oZZ0VcJeC8ZczeQlw9jtv1EaimVx5P
         Jknm8IHpO0xfelqTvXuPM33IJ7lKz3kv32qlkrNNzyw5yzD8LFFdF0fOCNJPEHYJ8+Sl
         8QtBjKuhRtAtxQehyf8K5BuNaE40yqDEndWhI71+ZIWk7y4ywJFUodBJtEiIzzz0Tiix
         +TRImJVUgJP5IO3gXlZWOLWPFQIHTcqEDOfl90AK5KZAAqFl/JBmoytaGffT0Z/buZSx
         a9Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWXRaIpLDJEGMQWvrfpBICk5szaob2MOPCuefC4KoE72kOZcMC8F0Ao0bJN5E84gQ9+BaUwK8FAwzD6Puk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJONrSDRRVbtIwGKpzt2axZ3vPuCvKut48Ri3sJ7/GTAi8e96A
	gU4vwjSk1YuciVU0DrUUk4AXkDYk85897DetPH/PwsbAWwe0x+rpDDvh4Lhz1UA=
X-Gm-Gg: ASbGnct0HLfLoNyG75xe1HKHtapUJjapbe58dmzNb8spEzLskjlEMQXUBPQIDCSgEjl
	D4mR9+ZV73B7mT5Xp2g7m3DZXv6sDvzVBCjyKdchVDkhSJOQNWQvCaNkXIJnR89htmMdzqvs+w5
	UO9Zq7QKN/H7dFTwAGkV5oqNHt69K9wtGmGbd3eJybLPWe/JApB8NFo4sjwRKeVmRIK8sbjryKK
	8rrQOZdrCXH0Mb/oLQ0WATh/519K3Lq4+6YxvnHRgO0QubvMBcEq6VEi4IyUNaToP5Nk5OKub2w
	n/gwc+qXMYCt/yVy8u3zs/81xy/AJ/doYtQ0/pww6vJBDwDsVg==
X-Google-Smtp-Source: AGHT+IH2PxxnwoGmEekj/JPGQfhyg6WywOXDfzxclh3b+yJlm63bf//RxWl96Bfbtzsi6wSpbo9I/Q==
X-Received: by 2002:a05:6000:40e0:b0:391:4977:5060 with SMTP id ffacd0b85a97d-39c1211d5b0mr12864765f8f.53.1743591762880;
        Wed, 02 Apr 2025 04:02:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b7a41b4sm16396725f8f.85.2025.04.02.04.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 04:02:42 -0700 (PDT)
Date: Wed, 2 Apr 2025 14:02:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] nfs: Add missing release on error in
 nfs_lock_and_join_requests()
Message-ID: <3aaaa3d5-1c8a-41e4-98c7-717801ddd171@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Call nfs_release_request() on this error path before returning.

Fixes: c3f2235782c3 ("nfs: fold nfs_folio_find_and_lock_request into nfs_lock_and_join_requests")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis and untested.  Pretty sure it's correct, though.  ;)

 fs/nfs/write.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/nfs/write.c b/fs/nfs/write.c
index aa3d8bea3ec0..23df8b214474 100644
--- a/fs/nfs/write.c
+++ b/fs/nfs/write.c
@@ -579,8 +579,10 @@ static struct nfs_page *nfs_lock_and_join_requests(struct folio *folio)
 
 	while (!nfs_lock_request(head)) {
 		ret = nfs_wait_on_request(head);
-		if (ret < 0)
+		if (ret < 0) {
+			nfs_release_request(head);
 			return ERR_PTR(ret);
+		}
 	}
 
 	/* Ensure that nobody removed the request before we locked it */
-- 
2.47.2

