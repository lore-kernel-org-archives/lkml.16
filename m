Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70378241698
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598092; cv=none; b=eMrEhUZwGdDdhIEq6BOwazsTxIvHH4ZxEvt1GuGKRT5V+tFNvSJOu6W2zUXnfyuE6zWM6kEyfKtEIbObCz66QvczlYVK+nDXT6YC5xeMp6hz5X0M4+gYp099JhYGukEnOAbr23cQkmOH596xH4EHA22jPaQUOvIMT+/wAO1xVbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598092; c=relaxed/simple;
	bh=gJR2vqorpVwZErAmb3XaISI/AYZE12CiUuRkCzdjxxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i8g3GRNI4Y23KkwGrt8nz5kED+zApI00pm84a/2mjtFp7FUfXUjvV30QFa85jog8jWrj0NNH37YK0/PQXjbmLhE6cN37FKU+dH8q9YqGhT/7mALK/o7XhSDcnSvAnPIFh1NGMl7JlhDx6hZcopeqSDyzUzySEuH59i8ClVqcx24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8Csl5yv; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8Csl5yv"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3965c995151so3713015f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 05:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743598089; x=1744202889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sT+yvPMemtPOR/HKjNs6XD5v3Nsj8KVdns4dq/Y7ql8=;
        b=F8Csl5yvhtqLWvwYcVZQauA9s0rSqGI8i177+JoKjakTxZh8//wt/ZrxEKjOZ10Q1x
         54wT9WeIrQKWLV8nIPIIphCqcTmAMQvKJsOO78NcvJdO0CO9EkxiNqqveQFg//2RyXgp
         9WHBEK+EI3BvZCeR0tb2R/XXcp76nMqK7fnHzoJ9HEWAzZV0rGWLkfPIz3Hr1HVassyK
         B6xFczKFOebSCFzc+eZ+t64pk0Javhmnh1h6oMjBFPSqXTIBjXzsIfDhhuTDMC4KbkvH
         V6UeF4Nua08jOIVpnJq8Z8J8JQYHv3b3odLuvJltljSBWKpqcNWMUAfbizhsUhUS1jl1
         +6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598089; x=1744202889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sT+yvPMemtPOR/HKjNs6XD5v3Nsj8KVdns4dq/Y7ql8=;
        b=W8fFmdtQLn9paDO6PNRZ7Gdx5vd9EbZ/ujQP5s4kgWeriIP+xWpj5TXYHmfTCPf10w
         oGhiC0n7Hv/HryMYjOZtRhF3xH2tc0pJ7B9WCcLRaiCrMLFRMdlyuU5KBHwpYSiwaqba
         uELnZv+pBxJp3eQKRfMJVYLCbIFiAKR//VblxD4iTfITulkI+EyoouLfOjH99CqT2s6O
         xiw8lu67hBfz1dmJ90JDWpiwyCnHm+UTdxvkcyn6IfIU/X7E6O+6sC3gsbLzIkZ8qx3a
         8nTlclT5KOWRgJ222Bk2QgVKRpZzod1wKM4I7pJpLEWmCRmyrxR8tqoYv9uqZG116UZ7
         i74g==
X-Forwarded-Encrypted: i=1; AJvYcCU4To3XHLaJ7mY9t+K9Z/QFEVydcZzwPx4yn++VgGVhaAt3g0rk+RKZIYMVhNYwqYL0kB9/gsLivwQo2Zw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ4LNoSeRbHvhP/9Bq5obOcUfLdAPlUi0gUJuAS0JmLaA9OLND
	S417pbgEgDKdwNKtfxebsnDChhWJ0vHOp5vtwwP5FcT/NVH9nEt0
X-Gm-Gg: ASbGncu2hKbhW4O5PQDHEJ+kqqiJDj0Hy92m19fdnjhAg4CzP+0NpI3+pBf/A3uHvzz
	9J3buqXBeYlsIrvjohegzF/InGqlYWYe8ORHtyRKQzxfheB3zgVHK/Kn/8bq6NlPILWP7HPqV3k
	+lwha0oSSACdQMkCsACtCdg6lqFADrR6qHL6tV1QQGcgdZue1DZ0F5gjBQ7GqLn3sFFyicR05Hl
	B0FhKZjUE8GDrW/y6O60HpbNPmmVUDm6kHBUhzQW56BxwXCHHBq4499L78wDAmV14m+ZOXarob9
	Vuwea3mDAXfAlzUpX7LhzwbW2UQJHNH5UDNCXh6N/tE2nMNe6Gwd
X-Google-Smtp-Source: AGHT+IGnc011EOBPeB/NrESCecedPvm684BUXOiL+FPzCD08PsPKT4rS32n6UjnY5bJR1s9NfzrUdA==
X-Received: by 2002:a05:6000:22c6:b0:39c:1efc:1c1c with SMTP id ffacd0b85a97d-39c2976984emr2071008f8f.34.1743598088696;
        Wed, 02 Apr 2025 05:48:08 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb61b6cd2sm19675985e9.39.2025.04.02.05.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:48:08 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] staging: rtl8723bs: Use true/false instead of 1/0
Date: Wed,  2 Apr 2025 15:47:43 +0300
Message-ID: <2d7f7db67520fa127b81cb200a67304dfff2eaf7.1743596287.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743596287.git.karanja99erick@gmail.com>
References: <cover.1743596287.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

    standardize boolean representation by replacing 1/0
    with true/false in cases where boolean logic is implied.
    This improves code clarity and aligns with the kernel’s bool type usage.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index a389ba5ecc6f..fd04dbacb50f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1358,7 +1358,7 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 			u8 *mgmt_DATA;
 			u32 data_len = 0;
 
-			pattrib->bdecrypted = 0;
+			pattrib->bdecrypted = false;
 			pattrib->encrypt = _AES_;
 			pattrib->hdrlen = sizeof(struct ieee80211_hdr_3addr);
 			/* set iv and icv length */
-- 
2.43.0

