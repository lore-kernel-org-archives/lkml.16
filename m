Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7B7202C34
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746455542; cv=none; b=A6yx5reyD5SAHNslBKrmzlPNc2Ss2sa8rKtDwa2wy4CkXpmgWClhyzQxwbPXZjZSofunG8rqjurDHfWwjMvxrGjtfTvohctTuP9oqbijVEO4OeahqL6kAzftnohFRj0F4b1bWslQ3EkexEFGqs/dazuhRDQPHOccMjEVzUmmtXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746455542; c=relaxed/simple;
	bh=e+0ixCQAB8W0GMaVTPmt2pQk324LCu5mkg5wTjPzaZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=En8T7GMGmGjAQYghj7G70t8cRvqgWbCgWHiK5sL7GOUwpFdEqExmx7ENyECDjnKw93sTMSaBjUA+BTpMI3toDfRZs2Nel47L50NpUeXnwJGwgFcCw+KQhsI0mz6LYLwUXVTz5CgxBFwAeVhyKzP/s5zuNfjwI2B/PbcsJLYtas8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lawefhdz; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lawefhdz"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso42579145e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 07:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746455538; x=1747060338; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a+ecdvXRp9B7lDrSJDnwst1YRnJE0a6dpkQ8An/AD48=;
        b=Lawefhdz9B6aZS0CiZcWs34OeDz1S3yCgIblhsnafkiEuJ12pfQSJmM3EeW1lSmnee
         LhP/hlnxzR0JuuoCv+BV9yjlehIDKfMtxyd7zrf4Kmcc31Zj87no3j/4SJG0Y2zMid3Z
         KPW/X3hklDU7SsY50UCJSOKu6kMYbR3uIBcBfxfFFyjpLQ8xYz3ZJS4wXqEJDeHJDrF9
         mVRm10YyyVcQjI7EmgKErubA9zpT61rdaThM9KaqfqkoR1ggl7qkrXEGfOe4AUBg/xAW
         x1zjRum/ssP6E56uRDmGw+yGBLIDdct4G6/bhH/9BLO1iPPW0q3R7D6h4hd1ymQQEEIV
         9G8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746455538; x=1747060338;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a+ecdvXRp9B7lDrSJDnwst1YRnJE0a6dpkQ8An/AD48=;
        b=kDfLFYPZ6EhcM0/xoAaAfN7nF8D+HSHgQ69XtVTkiKPukL0FaZoNISRrH1YdAZZKge
         LRbFz/7/TlzH8YVd0Mu5DrkEc3bsIc78vNuB0J0rS9KB2daZEab5bAKGmlqMMFt+IHKd
         P5ONDBRovWrh0ouQc9nuHRuM6EDKor/Tnni/csm/LYobWSsus0u0k0iCFgav2V7tabhx
         nXSCWggemeXg/qQoTZ2PG4yNdjyIllUCMYRQx+aqIi50B4sA+cpzPQAzRilu5esdV8HZ
         cLfF4XGnaY3k2AS6GUYV3Kw5k8McF/ucE9jgJlaBCjmaQ6oxlTD3sG+dylwCUmW35Lme
         12gA==
X-Forwarded-Encrypted: i=1; AJvYcCV84QCZQAzZG2q46X4VubjTGlyzzyatrwP733b2It/FNd5EcHOhy4u9ZQvwQFEiJI22kwbDVN3fkMR2F/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7swI6E60ISxvTvLzeCQxColgwoykWrb1xGtUdZiBf+NmTH922
	JfBfMwaf5//hkiNQleXnHuHZ0FkWVfA1/6Ceu7OghCmJe4FTwn9KnQXFv0H8GSo=
X-Gm-Gg: ASbGncu6NHpRBOm7w1piEJNYYLjxeEpMbQ0oWo1/I4ZGaduW033BdMqSgIz0ko2XVpt
	zLhgamw1G1hv/zUisrWEbHWBVORN00i5Vw9UZNSmk6kkfiGibHII8R02aoj0t45aqwz9umsGvU9
	9OVV4TNT4ArzkuzQb7V18LLELSdp2sUes+Gpzk6vUjQqEL9W274Df/tgtoZG33L+oP/4Hvanv2P
	x62pHKWAYptT7OghUG6QHFrKXlwjI8i8pTIsv/Y8cxa+aT++ii45/js4//Wsj0CiJLpGtKoWdjc
	MnctJt+7V+4AQzps1Uz/TmutA3cFD45QuGk4eCYCHEU5mQ==
X-Google-Smtp-Source: AGHT+IGyIpQEeGOI1bpJxkqVYKCv5xmDFxvVhoHPMyQ+WpC+IU6OnU3bGuzYtxbn8Ywflhv/y8WTSQ==
X-Received: by 2002:a05:600c:45d1:b0:43a:b0ac:b10c with SMTP id 5b1f17b1804b1-441c49236b0mr63894895e9.26.1746455537718;
        Mon, 05 May 2025 07:32:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2aed5e8sm180265185e9.16.2025.05.05.07.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 07:32:17 -0700 (PDT)
Date: Mon, 5 May 2025 17:32:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rakie Kim <rakie.kim@sk.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Yunjeong Mun <yunjeong.mun@sk.com>,
	Dan Williams <dan.j.williams@intel.com>,
	David Hildenbrand <david@redhat.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2 next] mm/mempolicy: Fix error code in sysfs_wi_node_add()
Message-ID: <aBjL7Bwc0QBzgajK@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Smatch complains that there is a missing error code here.  Arguments
could be made either way about what correct behavior should be but
in the end we decided that returning -EINVAL probably made sense.

The wi_node_notifier() already prints an error so this pr_info() is
duplicative so delete it.

Fixes: bc7527e0a127 ("mm/mempolicy: support memory hotplug in weighted interleave")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>
Reviewed-by: Honggyu Kim <honggyu.kim@sk.com>
Reviewed-by: Rakie Kim <rakie.kim@sk.com>
---
v2: Delete the pr_info() message as well

 mm/mempolicy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index f43951668c41..9a2b4b36f558 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -3539,7 +3539,7 @@ static const struct kobj_type wi_ktype = {
 
 static int sysfs_wi_node_add(int nid)
 {
-	int ret = 0;
+	int ret;
 	char *name;
 	struct iw_node_attr *new_attr;
 
@@ -3568,7 +3568,7 @@ static int sysfs_wi_node_add(int nid)
 	mutex_lock(&wi_group->kobj_lock);
 	if (wi_group->nattrs[nid]) {
 		mutex_unlock(&wi_group->kobj_lock);
-		pr_info("node%d already exists\n", nid);
+		ret = -EEXIST;
 		goto out;
 	}
 
-- 
2.47.2

