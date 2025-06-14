Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D25175A5
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 02:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749867641; cv=none; b=oKRo38rOgj4mOG5zoHgqMnAgMJcEoXe39QxnZN5oHbcJbcq9lHflHZx4XSnPhKEhLX1fditRLIFJofSOPxNqxLglnkq+iBFC6cuknmDQFTHvpbWL9hcKcnsNslERGCeqkoyJAFogN3WevxNWIFmRdamGAQ+XpFxiKnS0heHM2zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749867641; c=relaxed/simple;
	bh=qnHnh/eh5pvaU9wU23V4kDzRq5bjKim08WvNI6Fua80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DoOeiwIMZzNpchHPBdra5XGk83TMdLNez9SIFLxmXSIbBGUNTl41qEeHOAvQ83eB+YvqPXUHU2yrP4HviAoC9k6Ghafy7nzz5MCUKp53x2qxbAwj27+5WuwYvdNH5CBHE/qoiNaDRU/kfpDnIgdEPydx6v7MqjYK6YSrWoaiqb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org; spf=pass smtp.mailfrom=wbinvd.org; dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b=XUAPZz+f; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b="XUAPZz+f"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-311e46d38ddso2574705a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1749867638; x=1750472438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0TCpdrHqvVyx+/z5RHafQUI6EpwCZP78GRIUPCgFN0w=;
        b=XUAPZz+fCjAAYwbBxybGVle8xhbZ+qZnaYwujspfZSJoFOcd3rNK2KVRxXn7k79Sco
         iHbo1mDNkqPKqbdPRgHvuWpQKSce3ZigMkAXApyjjrtYHySHlX4aauMLC5/ErKCDkTVC
         oyzbgAjye/YNV4L34tZoJktnLtibvfRfVhVOiKcvda7eBjvxaMwK7+JmdmB3gYJsS7IO
         I6zelS0R8Wk8JJViLUReXGVAdLVpab2zJPyIEkfkbI8u/KsYW4gnjGJO+ePUbLdrDRMi
         OyPGe6jcbsOSo3PA1J/rOCfT98N+Hub+74UQgYn3aJ79KWqUHGCrzrPG7XOacpw28f+v
         NACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749867638; x=1750472438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0TCpdrHqvVyx+/z5RHafQUI6EpwCZP78GRIUPCgFN0w=;
        b=tr8Kjp1gfiLp7yRXgKN6y3cR1e92CSmnemGPRq3W5xXf0Vs1c4VkkXMGxKkItWXSgP
         TOh5dCHD0c3Gh5VNzhTyg8ode4jwt0X4oHrIVPQqtnWPKKkQTDuNiKBk3cv7frziEDH6
         AC/55CHZpgDzsrIiRQY7k3VspLSl6kFFDw/fwxmOENPEiHehQBql90CsyWsTwKES80Fk
         RnoFyLGcaqZECm1Hy6OtP6WmS+zj/pQ2kx/+WIz+0OUOMK+rSKorSaTtuaTmOaGYYvZz
         7WPGGoRg5rsbr+kqfn3cwhjKoLMZBRBlFyD6CrsCskAL45jXxkBIbVZzWfk4oeQEx0eD
         6B7A==
X-Gm-Message-State: AOJu0YwcfdE+a8zKhNmVW7Oqv/Xg+0oKVmHHtojNnK90bwohuOumdjXv
	g/dNFXV+nv9k+rr6l5Vs4lDOA8ljvlsvy8v2KsJP2jOCTS5jX/NenIQYFzh0RimARkWyfr1srNq
	7oAZf
X-Gm-Gg: ASbGncukfUh1d7w80rl14P0RpZITlOKj9YuWmBjy8SAVesyITCcdWLZh8b0ZV6YlkNL
	Dw5Tea0aaf6jA+8FdTg7btFw/SAxT42+3D/QV7abLirvEOenAWm6xDab/QhMPr3CuC+7hesbbDJ
	c+0jc9niy55bRxoH+gaJIiIqD8w+mYH1vMB/jZUgqNp9zcUq3KVrOIrW0AsYR+zRntFKJg+FYZt
	dQM5xmkNG29413v5S5mFw1MFhN1xg4PFhRVLjbuTCs+xDj5c8pcIZZeXU3eip3DAkrra6la7jNG
	3813sRIGnEwk87D3Vmpbn7GIpqxPeha+oG0d6IqL3uJ0Z3rzoqVB9AtROwuu/yX5IHjS59KNByY
	xcyDoL90N39j15Eqe2NE44bf3sATUOtk=
X-Google-Smtp-Source: AGHT+IGO/t+Jv/rmdF2kqCa8WUSlji+mz6WDWVoeL7ZLdOjABOPGoI//E1v0p8MAykSAF3XJd20QAw==
X-Received: by 2002:a17:90b:586b:b0:2fc:3264:3666 with SMTP id 98e67ed59e1d1-313f1e129cdmr2206003a91.30.1749867638329;
        Fri, 13 Jun 2025 19:20:38 -0700 (PDT)
Received: from mozart.vkv.me (192-184-162-253.fiber.dynamic.sonic.net. [192.184.162.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19cd3cbsm4132857a91.11.2025.06.13.19.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 19:20:37 -0700 (PDT)
From: Calvin Owens <calvin@wbinvd.org>
To: linux-kernel@vger.kernel.org
Cc: linux-pm@vger.kernel.org,
	Len Brown <lenb@kernel.org>
Subject: [PATCH] tools/power turbostat: Fix MSRs with CONFIG_MULTIUSER=n
Date: Fri, 13 Jun 2025 19:20:28 -0700
Message-ID: <81f4c402d1fda7c2419aac1148061a0789112e76.1749849645.git.calvin@wbinvd.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Handle ENOSYS from cap_get_proc() in check_for_cap_sys_rawio(), so
turbostat can display temperatures when running on kernels compiled
without multiuser support.

Signed-off-by: Calvin Owens <calvin@wbinvd.org>
---
 tools/power/x86/turbostat/turbostat.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/power/x86/turbostat/turbostat.c b/tools/power/x86/turbostat/turbostat.c
index 925556b90770..f7d665913a52 100644
--- a/tools/power/x86/turbostat/turbostat.c
+++ b/tools/power/x86/turbostat/turbostat.c
@@ -6496,8 +6496,13 @@ int check_for_cap_sys_rawio(void)
 	int ret = 0;
 
 	caps = cap_get_proc();
-	if (caps == NULL)
+	if (caps == NULL) {
+		/* Support CONFIG_MULTIUSER=n */
+		if (errno == ENOSYS)
+			return 0;
+
 		return 1;
+	}
 
 	if (cap_get_flag(caps, CAP_SYS_RAWIO, CAP_EFFECTIVE, &cap_flag_value)) {
 		ret = 1;
-- 
2.47.2

