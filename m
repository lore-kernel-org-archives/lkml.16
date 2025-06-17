Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE8B2F0049
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190946; cv=none; b=RlSiuTNnMNuYduBfLUdL0zAZMtk/fBJHRuO0eomr381Yw7qcXO8qcy+LOQtVST5bnERICAP/iIo98qbBEHakJQ2DaeZI7dO4hUB7/d0kkleaKqNAS5eLkWfYdHdRAkL0muMp0MXVVb7XR6UUWqoCb7FoOyb1pYwlQ/lOfMzc+tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190946; c=relaxed/simple;
	bh=WKZqq2YEuAVNJBHG19OIJ1BG7TY/8FPSe5eCYcffo/A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pczoQz9pBNQ/wHylgewppnOSuY0z1acMXRuyRK80UswpfcMOpTXTtGsKcGX+W6WQ6avJTnKjRr2A0MMYszUSdI/o5HANxEwSLMhoKiZ0acaBtx6kES6uNbFeVUBeyBx0rapBlWWnr58owvlvGatPVQH/SJ+lYsb7fEjag80D6TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4B0F+nj; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4B0F+nj"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3122368d7cfso4802176a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750190944; x=1750795744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=giWfCtGbWEqU63iGbzpmokmH0FMbVzty9wx804zxVgU=;
        b=l4B0F+nj7Z4CabdhItD7ShVrJXhoePvwZUWK/NmlS8JmMCGiZleAKb2g0nY3RHmzbF
         arlDGDQSGNBlTm8lKUg+jj3nbL5lNW4NFirbRCqNUVXrC874qyOrKOJPswPix//11E1t
         7DF/w1OsYYQOC5HA5XHGB6Ip5Kv+hndVsi9u3G/nmwLDQdYVIZnxKweIKFw83pSarIg6
         OVTjOsjmBai9cjd2JYURD7368H9srOcgUNfwpzHokxdptaeu2cPXVpOigr1VVk6StHq0
         2Ye3IzVIc2gMR3qpqyrUh/unOy0KU2sdtkpk8cBqI/gp35oxJrBXijNJEtr3EFos2lHa
         Zw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750190944; x=1750795744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=giWfCtGbWEqU63iGbzpmokmH0FMbVzty9wx804zxVgU=;
        b=K3LrK8ssetXVoXKCDxOmJIG312/ucZUk3p5Pu55uiSM4fUYEHZrLP3HutyLdjfGp6/
         jllUDHdTEOZSZrgP2xGYBTs9eIC4ScH1cTPJDPdunxpp6cLCTlPOTcYB/wu0f0UlIZ/4
         k92s+fn4PEpP+yAOKNGIKoOi+D8iUncmJ4hOiYvjJFMVJ3LctiLRyIjD0zGN1G26evHW
         0PkZRKQEsXgU8k88cVGkD4deUWn2McEOyUGOp7OkN86zf1ByJ5Hc60DdDKPZudL8ROTy
         PhPxyrYTAu45eMu9ETijTGGX7Log7U/NVqwGWbz3IT9pi3coeWKWi6zrpGKiaBOEkHZ4
         CaCA==
X-Gm-Message-State: AOJu0Yy1OX8T4t/4OvU1q4KuetKxfsRp2p0T9d5z7vXO+m6UmmKJ0+Zx
	Oz1XQZXEve5K1ujp8LcgkeTVJwBlEyYAv6xFgxT2axQ/ociXwvDH0KHj9jdcTw==
X-Gm-Gg: ASbGnctOH04QQdpArpgeT0eowg4ZKCkPtNC7hWPiPFs7gADwGQSfY30p5RVViiJQuyx
	YKvgSXq7tandOS733GJxRw5EE9l5DiCwTWQdYB0IbFnCgXDVujZuKPTqYJyexnABXFT8QRi1QUt
	9QLVOGDMdJ+VxIzYmxlthuWPcPLc4QSp5neyHgN/2YWohWr1WZFzrxOem45X1d8G/G3V649Rwlc
	fI9lNozBuKJKRY3qsSwXVy7zIdjO4voE1fjhwWZpUtkGmpvrC5dOsO0FVmO0RmTUxga7IUd46q5
	SIDufA6sEV2W3tdI24yDQt09pRVUse1iI531IpHaed/U6BMHeoo3A10mKAp7Vw==
X-Google-Smtp-Source: AGHT+IHx3MgIVSGDCv7wBGiIbtFBuDWjnqCVHuNC6JWptkhYTjdBZ7XEoFqqkfqKpxQhJESw4O+4Nw==
X-Received: by 2002:a17:90b:1b48:b0:313:287e:f1e8 with SMTP id 98e67ed59e1d1-313f1ca745fmr20457548a91.8.1750190943937;
        Tue, 17 Jun 2025 13:09:03 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313f9ee73c1sm7009784a91.16.2025.06.17.13.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 13:09:03 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 2/3] cpumask: introduce cpumask_random()
Date: Tue, 17 Jun 2025 16:08:52 -0400
Message-ID: <20250617200854.60753-3-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617200854.60753-1-yury.norov@gmail.com>
References: <20250617200854.60753-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>

Propagate find_random_bit() to cpumask API.

Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 include/linux/cpumask.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index 7ae80a7ca81e..39b71b662da3 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -354,6 +354,18 @@ unsigned int cpumask_next_wrap(int n, const struct cpumask *src)
 	return find_next_bit_wrap(cpumask_bits(src), small_cpumask_bits, n + 1);
 }
 
+/**
+ * cpumask_random - get random cpu in *src.
+ * @src: cpumask pointer
+ *
+ * Return: random set bit, or >= nr_cpu_ids if @src is empty.
+ */
+static __always_inline
+unsigned int cpumask_random(const struct cpumask *src)
+{
+	return find_random_bit(cpumask_bits(src), nr_cpu_ids);
+}
+
 /**
  * for_each_cpu - iterate over every cpu in a mask
  * @cpu: the (optionally unsigned) integer iterator
-- 
2.43.0

