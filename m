Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0751F63F9
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748420033; cv=none; b=tc5f6qPCooISzPOi3MY5tACg1mUCDe8g1blQr/Ux5RpbZZoUhB4syIjAVnY9JS+kUX4tXMSPMMpkxezro+BNqlVniwtDFyzp6memdWU7qtTpVR+3ORRFibIYka8Upb+H0mSD0yartnfWmG0j+xo8Bu7HkOBAChXJRTnt60YdeN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748420033; c=relaxed/simple;
	bh=+Y0uRBfTZif9EgODttL1hBd9w/+qxXwFk6XTnVGQ7A8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G+2DcrJzaTgunVj2EB2RurnepHIW322rBqHp+LODecvtiGiVOGE5HNaP/eItTOt5lezPUKKF8jo8IZu7aPdsHqUkz65jKBp8R2fHIRpJOWakE91KKICYgA67mCR5lGB0xujSXvQo1MWackkxvP8kFO0KunhDSvJ24yOnsdktFcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=agntaPft; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="agntaPft"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-442f5b3c710so39155095e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 01:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748420030; x=1749024830; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q0yiIdr8kiMktQtzAz6WMndkMTPinkFXHlilIDGPLcU=;
        b=agntaPftrRvV4F7X9Oj+/cKV/e0sHa8FfLilHUrVFjqtxoftC0P9RDT8IwTvxmwK80
         rJF5xHU0xtuQGhjrdXqMkw0GVhu2HY93CGnlP3cIueqZWggD4VUdVDtBrtlW0e55xv6Q
         1jhHACcF1A9soWM/Qh3IDjs3leX353g/Nq2w2nOR0FqizTIwvoUTPsaRFFCnR2Eswa96
         EAcDxoZYAScvFmgM0UIao/pdWlpBbTxB8xgh3othv1n3BaK3gWe/1Pzd+VK5BdVt4y7C
         Ou8dVT1f0JGqBHm7fWqK4oIunxoeAeMOOt0bo0IxtgvX5N8iSjwt/uiQ9mFnByl48vbP
         yFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748420030; x=1749024830;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q0yiIdr8kiMktQtzAz6WMndkMTPinkFXHlilIDGPLcU=;
        b=N8pEaZxWpa0AvsAxiYYTWCfdx4wfs4zzNmmd6Ycd0s1ebsoHm6IM+AOXy59ifUnejL
         5cCRmIi7FkJHfrCQrdz1EVa9AzELpdMJNv/wfgGi20Dr8o2UWqEC/JgoO+4FWTo1gojm
         mSer0j1dgf59XGGp3HsBaDsR7r2y7zPz/4WRIhD2Ua9lVt03tvnoyZcOKrZ4GiXwe05d
         Ur/z+S8nVqmhfMcJZ/3gRA+Sgi8FD9oumVw1z2KKFvfJLhI2bWo9B0hNGtOuBq+CqxsX
         J1Eyx2gCQhCX20tSnBrlhmyDJF+QhrirBxUU24uy82rf+th+fmlZxYah1GB3KOu57axH
         gE6g==
X-Forwarded-Encrypted: i=1; AJvYcCUx9+qfbAPNkmoZOpXQhKeyvic2IvSXCZBndYJ+Z0/4AyfcgJYeP98o5VZ8sitqBIH+mhC+44bgywXGot4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9cFhIL9Ujc4S4KNM0Y+GyqcVgZV/iHexwlGzn9ZgRqC6FnZuK
	k6ov+rf79w5uId3p1u661Mww5E5JqWGBrH6i1v9kzSKna0S4A8PBElMSB94bh9eeXHNHhAGRT0J
	Nr/cx
X-Gm-Gg: ASbGncvL2FkuwpJIMz9uQy/IXD8ZEjwRu/RurLa2BxU7uRQ99rrD/GyIuRSmh6d/e+M
	j/nwnxaaOQ6ELlBsUtOGooddsDCM697e+CpRktZRdwq5OGNu5DJbjDrgcJZ0HrvAcdX/2uqE/7+
	Np+sh9ERJ5TRLEQvOMSwnuL9T2e5sEC2YUYByrrObhYkCrbuQW8FksMOuOqAwv5GmsqzOyHsOLD
	AuhYBsgBkHdBdE841UF/Q7ne+48iTgXqLAVBOPRQ5exL02LJP9TPx5vyltUypj7p77r9Sq0x3GE
	Niaxb9QGmBRSCoe8pL1+CB1Ii5cBCEKPF74dXTvLPArBJK5e8RKCPSkx
X-Google-Smtp-Source: AGHT+IHwxFIuBvvAastdxx+Kytl7VBX/kiaYR4D/z8QcwH+3DXyCV3M1g6v8ommXnYfifmpBZc7UkA==
X-Received: by 2002:a05:600c:4683:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-44c932f9572mr154626255e9.30.1748420029682;
        Wed, 28 May 2025 01:13:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45006499727sm13341795e9.3.2025.05.28.01.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 01:13:49 -0700 (PDT)
Date: Wed, 28 May 2025 11:13:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
	Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] tools/testing: Check correct variable in open_procmap()
Message-ID: <aDbFuUTlJTBqziVd@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Check if "procmap_out->fd" is negative instead of "procmap_out" (which
is a pointer).

Fixes: bd23f293a0d5 ("tools/testing: add PROCMAP_QUERY helper functions in mm self tests")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 tools/testing/selftests/mm/vm_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 1357e2d6a7b6..61d7bf1f8c62 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -439,7 +439,7 @@ int open_procmap(pid_t pid, struct procmap_fd *procmap_out)
 	sprintf(path, "/proc/%d/maps", pid);
 	procmap_out->query.size = sizeof(procmap_out->query);
 	procmap_out->fd = open(path, O_RDONLY);
-	if (procmap_out < 0)
+	if (procmap_out->fd < 0)
 		ret = -errno;
 
 	return ret;
-- 
2.47.2

