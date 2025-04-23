Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305BF28A1F0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396706; cv=none; b=phBovhZXuMX+37XZVQM4+ud7bn8Sn98ohrk5Bm9XEXOske3rPX1oeLrsCOhB9Rl5FAfOAbyx1n/CxO/KyXjF51B1y/G4gvPkgvk7u1gFV7aifTr2zATFZ1w233ty9B/rBWoMBAQ7CNf7xJ1v+xorX/KV4sr1ojSlFJOoGskQC7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396706; c=relaxed/simple;
	bh=mgXUK5sj3c48J4YiMVHK3z4CVDEbhjTcZXmPRxa92T8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C8BVgdvuMXTu7WcFbc027aN/T03rimMOqmuvyn6nM/jR2SNSs2hDwEuS10WoXjpdNV7jwsHi+a22vjiJXl1I6DOx3v+CQJ/ZXLOxbCL77auc9JfXTl9ZSvBovK53c24sNgLn4jiUGjvRGPdmBZyzqW+mE8afqoadlhp4Pk9dd04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GE5MI48a; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GE5MI48a"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so55267175e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 01:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745396702; x=1746001502; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mZ2BajsrO1xtArLAi+wn8MeS8GL5ES9k/0bb/t3RE8U=;
        b=GE5MI48a5yIvjSRhhHdHCAmI6xFRH0DpJlny4WaHda8yUi9QAKaAGi2zWMZIzOiOCT
         nTrgJjZCXkbIfjJIWRg4wSubem3KsHSU9fnfm5ywBWJXdpHS+DR9FFFKk6OLbYc4nb8x
         tWmTGrdL+a++spLgrTU1Kv+i/yiAR2OlyQ72PV9uVdBtYDqkwP4cNPoYlCUTChl80PgI
         y+mWupJdUY2mL4u4gUhvvLABPPvEQIedRY93ZK5Behxv/Ea/SkCL6CIKSPMlYwtY+f+7
         iCnw9KQ6NTOVvbF6+AEehMnl2N2sf9SWhoSExbIS2wPulcYXVIb2ZjoU+Zu8LeyMJVzy
         CiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745396702; x=1746001502;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mZ2BajsrO1xtArLAi+wn8MeS8GL5ES9k/0bb/t3RE8U=;
        b=WX6bm0S0xpkMMqeEvluED/y3EWidONCPerPTibtxA7nqijOA+Dn7Sls1g7g/2bcIU4
         t1EvsiWCqn7uLqlOvNHqhOO+3TUCQyKSJxXpwDpzpP1p7av7iAhfH2PBDWxcn9wo22X/
         K6at3wUf005ssuix+UjuV2Tit+qEn5ijy9Zm2RRJt9x+XVlPiIvOySWud8ArfRN9gEQy
         KlouLXM1aSGDh3BonqM6OKlLm2SYC3eJbiRdbtlO9/SLzMJ08wIV3+7MTsjJte7FE1Bh
         JgaoQHjxI/Q2M4Co68w9ao9oJx64R+NtcjxOf5QVMgePeW/XOQQq6CQmxloEH5TLCdq+
         0BbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtjrstZ/2VSV9ZczjZpJ4h9tn6En6vbfoImGmxa/skUq8GnU/5LArEyqSdWyYR3ATIKQwdmYqHZjJIHSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJlPohGKJP5fGa+3mEra72/RONrOJZnw65OgB64haoRSXlGvpL
	zrto0YlgE4P7+tuh/UdMMpHsgPIKpUzLp1x88z8+heugLa/Fw6hqgjnAVsHddtQ=
X-Gm-Gg: ASbGnct/76XIOLP/lXGNz4W30n2kkaeT0rYxbWcd1VLu+/ziPbbeSe/BfWe1FDveav/
	Hb9OnqW2F7A3n+8cANec/6zH5RuNaWlbkL5PGHxaCnaTx63BcVSH8/KKnZC6uN1/8P38MLqGBRQ
	Uz0UDZKrMowgxZGKIPh7hBBce4uHGMCfdWOo+hANDm3jUTezPcNT0/d+ua3du/p0hNnXffjJBJM
	q6/FuOAkg/tDWpBxd+eCyIOn4vrqnFC05MeUpmCRRQ+k5m4hmkCE7Tg/f9LFhbUDWl188UAkb1F
	hMztQbWvOymsK9vBnzEHUbuCT8IG9+my47v5CrZx6Y9RBg==
X-Google-Smtp-Source: AGHT+IEOsr2GYu8CB0C6z+X52cXEurZZkRfa4SYjeQ2F18Db0W+Om64FqFyMx1yp67irQ95BN9CpFw==
X-Received: by 2002:a05:600c:a009:b0:439:9b2a:1b2f with SMTP id 5b1f17b1804b1-4406ab8144bmr182156015e9.3.1745396702371;
        Wed, 23 Apr 2025 01:25:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39f069df9fcsm12706005f8f.16.2025.04.23.01.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:25:02 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:24:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rakie Kim <rakie.kim@sk.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Honggyu Kim <honggyu.kim@sk.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Gregory Price <gourry@gourry.net>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] mm/mempolicy: Fix error code in sysfs_wi_node_add()
Message-ID: <aAij2oUCP1zmcoPv@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -EEXIST if the node already exists.  Don't return success.

Fixes: 1bf270ac1b0a ("mm/mempolicy: support memory hotplug in weighted interleave")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Potentially returning success was intentional?  This is from static
analysis and I can't be totally sure.

 mm/mempolicy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index f43951668c41..0538a994440a 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -3539,7 +3539,7 @@ static const struct kobj_type wi_ktype = {
 
 static int sysfs_wi_node_add(int nid)
 {
-	int ret = 0;
+	int ret;
 	char *name;
 	struct iw_node_attr *new_attr;
 
@@ -3569,6 +3569,7 @@ static int sysfs_wi_node_add(int nid)
 	if (wi_group->nattrs[nid]) {
 		mutex_unlock(&wi_group->kobj_lock);
 		pr_info("node%d already exists\n", nid);
+		ret = -EEXIST;
 		goto out;
 	}
 
-- 
2.47.2

