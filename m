Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0108EC5
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 05:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748325399; cv=none; b=nfocnJCdG/jk2lLDrWVuyxj4vy7Bh6Yws61fg8xJgsfeJUqCWP0+y/ubH8ofMasuiwja7/UDGCqznGlEBzZ6UnZUmUmFCV9pW4I9eo6GEiPKTXGdxRcOnHUaijNhB0EO2tT7hgWiLT80M9y0SZQtWD5GQi9YMypf+LnJhNL9zkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748325399; c=relaxed/simple;
	bh=S6lrD0Op5pKlWL71e8qgzke0xa2+KfIHREDTWYi7JZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Igfo6tGJ+PIXPObAJRRmMmgDvQGQxByc+szPeRFZj4LdJHCsgt2wGAxV7mtlll+6oG3elYF+Jbj+wctoNyhzdO5RJ3lpm3svv+auFT0jxyYaOUiv6luEQGh/r2mpBKKXc5iiUeRbM7G4rLPU8uC2EPBdSAJsYf8Y8gDQWN0wk5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ooMo/78Q; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ooMo/78Q"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad574992fcaso560169266b.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 22:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748325396; x=1748930196; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1sqY5GIDGTtXFbbXu39XJwDlCZ5xKeuav8V3AHR7Qzo=;
        b=ooMo/78QLU2KQR5tjALqxSXjmfUPnGjeDyTRyMlydIWW18ESCT2AuXgG12tTr5aDKy
         t39E3RiMPYphlhlBqdbaoWjAL2bAt64Txuj6YxNGT0gzrFVgG5+dX7hff9qpJ5aOoYUm
         qV5A5Jag9FalQUl5I6hJlH2o02Kh3ceLNz3RLD5cRhO9Inux8yW9QTgGCIhIFFaE9Kcg
         eJa+6R+LHRmgIFYy6scyzS8euox7NrSamuoHF0hXg1P5FidjMAiynSp4yhUPavzXRNGu
         gQGmXsZKrphloC4IL9uhKUHrIzTjl+1kY6SR4tSLuM0RyYYSEH4yGoM1jboK6GtHNDSM
         fMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748325396; x=1748930196;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1sqY5GIDGTtXFbbXu39XJwDlCZ5xKeuav8V3AHR7Qzo=;
        b=SBVkGYOBlmsRL8SEIEOudkuQbGdU6VKoakewlaCBPGZLf0/1Z8A2zgCC/vRTLNfI4D
         MoRR1xl03PX+Uov/OXnqqG0egtFhaK+lxjGaOyQI36IKeYJrokjeVtHhGfv9CvJbYhKJ
         9S1QJol28RoZ9YdXwZfD6eBUK8xGkE/3BoO+Gs06XFd5ZBDSFPQhrjR+ByAbluWks0xf
         l3pc99R6s/eFpCvefXpPd0/Z49Me4zVmztWwQvd6tQ2qVnZgRY4lCXsUJhsQe8zA7aGu
         J87VgUeS0pVF7oSUT8wvkruHcF4T/3tibQ2VY3Wiu3M4pN9XX4NMEy5n8gsVWBDH0cTT
         LSig==
X-Forwarded-Encrypted: i=1; AJvYcCUVHstZMcbYGFdkaRrlbimqPUcLXi7GFCF3FjtVTJGK3p5g04fmGXdyM1etM2foS42WJ+x805kM85qsxwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCJsFi7GUiJJ5au6Naih5Ef0iWTJ5pLI5QvkgopNU0Qag+4zeJ
	BpqfZqmY7e4LhLvYQFbM6j1WZFrkQZQo1fUTcevygtm84u/pPy3V4mXDu+w9Ij1Wfs/+J/r0aUg
	gT9uV
X-Gm-Gg: ASbGncvqZVzYrq5nW4GdvDwIs6M3JfEymC5tADQ6AEjmaxwEks7Yd/NMrKZdVDZNaTI
	VzntCzn/9RjjbriDpzWMULTEP2lmszQTceTCsk0uE2KIU3AHFIf7HhONqd4RDUUIGa+hZMbL1JU
	1JIH7gS/efJe39IYSIlWpOUX3Ci46zUn38NRizuhEZ8xOOUlmlVu8TKPs8dnBCUpA997RnyAjIE
	1bVXZEkt9HdDr5DiGLf1Fdi8+/LiWFTDeCdoQN/h2solLcwAuOrpT9ceQjKHNivdsKkhAtpkp7B
	fn9KZd/Yzy3JT2KH5VjRY1pgXlkwCsqe2GMx3APzcLwuKK7+dlz0MGAG8kPn3WJGus34Zar9RlO
	UxKNX/hhukg==
X-Google-Smtp-Source: AGHT+IFTol4OTI7mtKP7rV/Mh6vlzvg43m7yooyV7FvKtcQVu98SoqAju8dLAhQhxa1PD6WLeSmTZg==
X-Received: by 2002:a17:907:8dcb:b0:ad2:5499:7599 with SMTP id a640c23a62f3a-ad85b0d2777mr1008212766b.18.1748325396080;
        Mon, 26 May 2025 22:56:36 -0700 (PDT)
Received: from localhost (hf94.n1.ips.mtn.co.ug. [41.210.143.148])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad88973815asm94306066b.129.2025.05.26.22.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 22:56:35 -0700 (PDT)
Date: Tue, 27 May 2025 08:56:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zong-Zhe Yang <kevin_yang@realtek.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] wifi: rtw89: mcc: prevent shift wrapping in
 rtw89_core_mlsr_switch()
Message-ID: <aDVUEHfa9q2zBD6i@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "link_id" value comes from the user via debugfs.  If it's larger
than BITS_PER_LONG then that would result in shift wrapping and
potentially an out of bounds access later.  Fortunately, only root can
write to debugfs files so the security impact is minimal.

Fixes: 9dd85e739ce0 ("wifi: rtw89: debug: add mlo_mode dbgfs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
---
 drivers/net/wireless/realtek/rtw89/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 49447668cbf3..7e5f87700941 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -5239,6 +5239,9 @@ int rtw89_core_mlsr_switch(struct rtw89_dev *rtwdev, struct rtw89_vif *rtwvif,
 	if (unlikely(!ieee80211_vif_is_mld(vif)))
 		return -EOPNOTSUPP;
 
+	if (unlikely(link_id >= BITS_PER_LONG))
+		return -EINVAL;
+
 	if (unlikely(!(usable_links & BIT(link_id)))) {
 		rtw89_warn(rtwdev, "%s: link id %u is not usable\n", __func__,
 			   link_id);
-- 
2.47.2

