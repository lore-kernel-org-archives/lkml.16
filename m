Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9487718A93C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 21:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749072090; cv=none; b=GrIM0NmpI3O92BHEFYOTEZZHsvQ6x0A9lcqIUUtu6AuR03X/RZkRrU/WMLaRVNXsit/Oegl7ReowQuQ94LhPCFrr29FNh2+RVKLrtOC24Zqi3UifvrgM2mfdkt6q8DYOBYPFfmEUBslRdM+VIsFVFWs5u/+Af/WkS++rEYtQrNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749072090; c=relaxed/simple;
	bh=Q8VEBZ7ziQ8YXSbdiWvjZBxi0JvQBhytEGyvFvabMxQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=f/U52XYQS+DQrVn9khP7Ul9kKczSRDwNuxQa+5hEEDAjeVQNXM5NeAYkiQnzPKTDNMwS3B2e6/JOq/mP6jt05Et8S89iWDjzhoyAgg42giYnVuQlWyMa6oHdijlRfRjViuiMf7xK2hXpwqx+zzAS+D03xAH62VFCVkL5Pz7nd1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WExevFis; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WExevFis"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7080dd5fe92so3349017b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 14:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749072087; x=1749676887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=c3TyDKkYnghRIwFBOBsjsVIcl/iVq9sMyxo77obIjZA=;
        b=WExevFisDGOiN07VinJ1DQyIkMYltnlLIjb38Wzq93UYEH3hI+H3Ekg5zFYTitbb89
         ox6+I+0+Mum17EZubK7AobPTlFytS+3vshUh9yhkIcErP5iJYXKnm5Ze0sJh7+K/onnJ
         7AfATaehZRyTIe6Wx/cYLAbWmnPuhpoyOYCFITO7UOyhDbtIdpuOlPHj34bDIN2TGLSv
         DiHgRFcKUIYQr54Opzg80Qi9/k15f+8i6Ud6ATZarVe2ZofNG+ExwJx58vrA3WVCyxzZ
         cibAfXPSG5qJVLme8dqxm0t3jIaD799K7VPn0aqkq4dfoATrBOnhFgOXo3ZOUTPvC+54
         vkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749072087; x=1749676887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3TyDKkYnghRIwFBOBsjsVIcl/iVq9sMyxo77obIjZA=;
        b=YSTXeY3mqqXKMa6u94vQ2kO3HI2dexwpvCIfiGKe4KZc1wA/1FOhtJhxKesji02Pg6
         I/Rl7NvOTbH9NF3MDG8fiWQVnOPLSVIavhIPeIVHyCk3bRozzVX954w65uuI25+fAAF1
         mR9djpBnUM3kz+aOpIZSfGrs3smEkXEdOw7Ls814FCIduh8b5YYbkinkG4ZhrNcHeZQw
         876nk52683QBk2dz1CknaakQ7LX8kAkfnwnNeaC94cFGodfr9++bsf5J2tKDIhzpvPeF
         knIK9mSBk2LQOIOF9d1AWwxAX5H2wgwuTySD7Jg85bLOTYiAEjU9JXN+MehRulM9H3vW
         rKCQ==
X-Gm-Message-State: AOJu0YxTR1ymaR/ojSMil9ZGLc9m2cNJ75q+GA39m2hCA3HwOv2fOxiv
	LSaI6vXdq0qzdZCrTf9Nsm7l6dK96ZBQU8WBp7I73dFP7uKGP2Ir7Oix9MWIBg==
X-Gm-Gg: ASbGnctmaIdSZ2uXOruf7DNKo0p4wMpAmv0guPmiPMTmn+07OxQ1pe03698l1tvNtiU
	kq9iizCue6NHvjOgI712+vu/CKgjKne4ms8UZ3OvQgvbG5pMLq+5p2Bd65dga5CxA3wD3Q0xXXg
	qjniQgM7xwpp9P9jl24TMZ8huSEXeDeGaXsdn+AcKeOIPhB2Xz30UL6ljeam0TJR098y502Xe9U
	/YGQa7h2PMDWbO7bWkAz6Fbx8pjFC6+QXqYHpFkuUrRDZTKaMA3rVSGEDrDxBmvvti9k7m5VFBS
	i5lzoYx18kC/wqcp2sYaAclrgPcjADkq/FaVOBAzD187VUFB3P6/wKF8PHy5S1A+WGXw99Mcw/m
	PgZfpqQ9iX+E=
X-Google-Smtp-Source: AGHT+IG0+tOPz8KhVHyF6appH615CjKn8/ox/ikovv7wCZFdUp8h84JcVFqufWAi7dzcVTHoB+f+9g==
X-Received: by 2002:a05:690c:6c03:b0:70f:8884:17af with SMTP id 00721157ae682-710d99fd497mr64151687b3.6.1749072087260;
        Wed, 04 Jun 2025 14:21:27 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710ea6872fcsm270487b3.11.2025.06.04.14.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 14:21:26 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 0/3] bitmap: introduce find_random_bit() and use in clocksource
Date: Wed,  4 Jun 2025 17:21:20 -0400
Message-ID: <20250604212125.25656-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yury Norov [NVIDIA] <yury.norov@gmail.com>

nodemasks implement node_random(), which may also be useful for other
subsystems. Generalize the function, and propagate to cpumask API.

Yury Norov (3):
  bitmap: generalize node_random()
  cpumask: introduce cpumask_random()
  clocksource: improve randomness in clocksource_verify_choose_cpus()

 include/linux/cpumask.h   | 12 ++++++++++++
 include/linux/find.h      |  2 ++
 include/linux/nodemask.h  | 16 +---------------
 kernel/time/clocksource.c |  5 +----
 lib/find_bit.c            | 17 ++++++++++++++++-
 5 files changed, 32 insertions(+), 20 deletions(-)

-- 
2.43.0

