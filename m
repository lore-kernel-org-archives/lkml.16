Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73BB29B215;
	Thu, 15 May 2025 19:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747338019; cv=none; b=fsy72pUVKG5e8tWNADYoR7zGyVKCp6J3xtqe9uEbgiwAT2XL0txWR677PYT+4RSxBcFO+jz/z4bBEd+HbPfgbp10NbWMkQCWnUmqRq7fa2QiPxubO4f++SDit3cj4pO9z4cI3TkR1vnyM+n+1IvwGQfGFKcsZPc0ZkwfH0nnmsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747338019; c=relaxed/simple;
	bh=q2fii1TNd8FQwF7ZkVGmdhiOTgRMqmaoTUEG7puOjJk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ac5sRZ2Zd2s0LU4txn2J0/c7pV+S3uldrEi+QmIhk3Xx5OIIKrKJJ+Jf/+JwxbhYfXJMvw6KObKkPy8i7Bsu8ycE4l9EEqf+HLABkt0vxbtcpQa9IhU6DoMciVOxVRL8bEqjgo+iqhOo0gYAI448DPSjGH7m1396HcYhF8CjZlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UU+HIqB2; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UU+HIqB2"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-550d6e7c563so1554968e87.3;
        Thu, 15 May 2025 12:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747338016; x=1747942816; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x9hf1pY/E40EfpOzBfn/r3vdhfrUtuW8Q8jEK1DP9OY=;
        b=UU+HIqB2jmC0qks6tj3dGVjPoZJijNSHnZU40MzAfU7qGvnBSY9YdnTorIIGRpI1z5
         2AL3a/ZJapAMk4f5uCsBNOdCjnTcleDdnKZEN0CtplP41+92kX5dSZe3R/zTcZpdCRSF
         Qwdv+Qjj5t4yv6iatabkvnJrRXn3wAKyoepZd4sYlKnttU6hrhUpyGlMz5H1V5xL8IwC
         dd5UYd8D38ZNAA2RYAwQ3jmx8TQy4zm7RA/RDasyUVURAAoMB/iCEbXdwKXST9xoYYAp
         s++63OaHoWGhVd1FBNlnTUhufYw5WJXpgdIzkAHJjAWCF+MVzXpBzUU3v58vrnyDMndL
         UT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747338016; x=1747942816;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x9hf1pY/E40EfpOzBfn/r3vdhfrUtuW8Q8jEK1DP9OY=;
        b=de/eKbqQI7rRGuBmq0HIwBBpzVtuwkjnVNdHx5Yzcb7kBHLSEkbneVojiZBMj5blTt
         eUUoQM9AvmPCBKW3jOqAxydc0PtoY1dMOVAqA1F1TJpbAaPQcEM6yGfHSWmWxSfvEZu+
         g7jSoYF4V2N+kIDo1Bu+qCtKPt9QipmIxQNfscCUO11LU9V6LmaC84OCvOAJRwz5AJmR
         bQJFhrDWuM9t6joczBi85zC2t7VKbFJQhno84st7EV/LOtIkjTIN9TB+JENkJ4B2yd6U
         VOI0UIzLp8ci7JgTewn+S9hH1HK4x+Gx6WmJyInr3s8IIDiOXzDakqEOwooWR1nwYlTQ
         PvWA==
X-Forwarded-Encrypted: i=1; AJvYcCU9XBk4Ueib8X5hL9ses8W0/h5qarIWL/WEzj+o4b36U0BUGN32Q+gSKpBR//26iS5Be2LnbRv9juxtNUDA@vger.kernel.org, AJvYcCUbUTmumpLKV1mQgpdeUpzhAGeit05dosCoSOs8EbQIY/3HeTvVRgjcuGqcMJ9dPIkKsEw8KSpYCxzoL5xWxuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS9jdqTHUOTzFLnZU93iZmLynJ+rv3lnJ5lCqB5Fa7BF4L6AeJ
	IGhzgO6iEcrKlVAaP5ZYLT6ltt5TGGiCO5rtUdmn1Ml9Z/dyqry0ZRWQDxSaamnc
X-Gm-Gg: ASbGncvNYvWMEt6TMYcvoAWFxDJ7XKhWB7TqxgIcqsGJawJmlBLmTTMCQ0eQjzYa4ZN
	GHjfcF+O7ANyY8jD+mldwWSZszXyTkzCqHaQup8LpxXxbpQAfdO3bD+bkHVdlMRjzD9tMcwi5fW
	13Ll4bcu2SU6D3EKkFgG9MX/JbOm248Py4hBfvT9c81oisBzdYqdQDM+QA2ckZqr7kPFmlox7m7
	KFksbxlREhEHveLrpPDfs4Jr8rUK9GStGv/3EN8fcxo6TWpWTZPTc/kVc2hNoseL0ZEB+KUDd1E
	qmYqb8ahBw4q5zMSLEE7orRJcs0McFa33Dnt8W/MoUTij/tzjZbm/47Xy4jctfvFUmsrI0+oGNo
	XBXpKyMPqrGCszECvqDFwK+rYPT/EkIAgvnY6DqpRSMUm3Y8dZjZa+yEfgYs=
X-Google-Smtp-Source: AGHT+IGeDQ/reVYdGrk3Ixycu5e5TUYCKh6cEoMm/K3M5xzTNaAwDZD90DyJeJrbM6gCLc9SyHeq9Q==
X-Received: by 2002:a05:6512:6505:b0:550:e648:1822 with SMTP id 2adb3069b0e04-550e7232577mr206286e87.43.1747338015527;
        Thu, 15 May 2025 12:40:15 -0700 (PDT)
Received: from Lappari.v6.elisa-laajakaista.fi (nzckegddy2ah4yxpld5-1.v6.elisa-laajakaista.fi. [2001:99a:20b9:a000:5c04:23bc:16da:4169])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084dbc32sm426221fa.50.2025.05.15.12.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:40:15 -0700 (PDT)
Date: Thu, 15 May 2025 22:40:13 +0300
From: Heikki Huttu <heissendo88@gmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: vme_user: add missing includes
Message-ID: <aCZDHXJTyfJRseho@Lappari.v6.elisa-laajakaista.fi>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Header files use u32, size_t, dma_addr_t, struct device, struct list_head.
Add direct includes to make the headers self-contained.

Signed-off-by: Heikki Huttu <heissendo88@gmail.com>
---
 drivers/staging/vme_user/vme.h      | 5 +++++
 drivers/staging/vme_user/vme_user.h | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme_user/vme.h
index 7753e736f9fd..55499b240dc3 100644
--- a/drivers/staging/vme_user/vme.h
+++ b/drivers/staging/vme_user/vme.h
@@ -3,6 +3,11 @@
 #define _VME_H_
 
 #include <linux/bitops.h>
+#include <linux/types.h>
+#include <linux/device.h>
+#include <linux/list.h>
+#include <linux/mm.h>
+#include <linux/dma-mapping.h>
 
 /* Resource Type */
 enum vme_resource_type {
diff --git a/drivers/staging/vme_user/vme_user.h b/drivers/staging/vme_user/vme_user.h
index 19ecb05781cc..297b25fab164 100644
--- a/drivers/staging/vme_user/vme_user.h
+++ b/drivers/staging/vme_user/vme_user.h
@@ -2,6 +2,8 @@
 #ifndef _VME_USER_H_
 #define _VME_USER_H_
 
+#include <linux/types.h>
+
 #define VME_USER_BUS_MAX	1
 
 /*
-- 
2.47.2

