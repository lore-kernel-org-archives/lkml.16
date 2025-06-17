Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814D92E264A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750167432; cv=none; b=B15vsMic434+E+Nl44me/SC91RWd5fXpWt6fgVfn5c5/t/yYKeBm05HKdqNOBP0cZLi68pEfzodaeGHxpm8P2F71a033j2Srg9uZq4lsj6d38FzVoMGprjvIuR6Nsoq6aQKS8e/77/f4fw3YVyOsrdStqIshUJJZg+ypKhEabd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750167432; c=relaxed/simple;
	bh=syEOF23WYnR+m4ZXDu5w2UCFevHV0uRwaU7OFMcE7RY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FlIurAHvMfuSum3w7J0T5vw8WNyKXRqOoqpEZS7d4HKXPndZmIexo7pKCJksYFsbYabvScEbsLy6qwIQKXMHPRkYukt7kgAU3AfZLmrQuqdqwdUJmR5jo4QGAT9Xe1utzKah7g7LHLljWMSMuan6b+AwbJTY3oTQObJQqoa0Avo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eeeubEMo; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eeeubEMo"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-450ce671a08so35988415e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 06:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750167429; x=1750772229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zAb6vAt4cs//1SvpF4Ccxpw3YC8TLR2gb172yFffxHY=;
        b=eeeubEMojDy8IavtdzD88nb70r8zDEOBGSONI9yUjo8UqzFDIGqlTE1j/a1PXJ29z7
         f8m1JJ0PiT8S223orRhpW1QTRerbgaFXLXv6b4TQtMsPgh0I0RWP9sOTR2EEnw0ebY+2
         wRHMKxP6Jc2C5hYk6kgc2kgXp4G9z/ob7F6vANYHUO1IJU+UzD48bhHxAmMlXzT3ha9r
         1NhceHyrJ9Y1CpKCaB9KzEJ1BK/BitLLsXTY284RUvzI0De+aqvC25e+iWMy6vdnPLDX
         dFhsCnKTth+CTIy8vNTjG7SRiAIoxvOWkBYgOKjVePGlsDV4eYeNr+jYIqAsovEkZbDD
         VAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750167429; x=1750772229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zAb6vAt4cs//1SvpF4Ccxpw3YC8TLR2gb172yFffxHY=;
        b=ferUuB1F8kcE5H9Jz4RS9IMlXAHlI72cZ1SgadBGPMD3tZ9IdrEDKzfeLdz/78zx+W
         ElLi6jN0D/twx1mCcLy6zfAejW2X3myoBpjX/A7jawUOk7DVxdcWBEb3drhrcmFMFn+a
         GKHTHOPC8RV0aZT4IXsOZ/k9l0GBLA1hqAH6Qdk9eslKcXZz+9H3Yomkbm1pr0iRckfJ
         vZGp9rsbu679NI5FKVgybOCyOue+Jt87iYM6G4+dQyX+ljMbvMTkqeI60DM1KqLbvdmk
         7+oaDuyF0RjrXbX4hxFsIaep23wycGOYXY4dAbMF5275WBK3wJOufkaLG49EwSwAlTbJ
         k3rg==
X-Gm-Message-State: AOJu0YylnZhmD8RWlrLTf5YBDsa8gO/imn3jAuR7AV6yPOuFeRnwqint
	EQQcfI75tKqpbGmPcVGy9ERsbEM7YK1SxAbKWSpFeAA5s1hNTPkCuVhBJ94MXy6MHXPJr1sWp4o
	omhfAvi8=
X-Gm-Gg: ASbGnctX3TzLa/Zwb2ptUuKUNRmYTS3raOf7+XWJyNjNM8sJ+Mrf6zpOHWL9qT15hdI
	hzRjOrNFaRhbLqEhilQPSnsN/mIdfn8bDm0T4AXvlcPIscPYtTh5zQeeaw9DFDeaynNaYnHulXM
	fiSLOmS17UCZZ05IszuEPzFyNWEj5nF3Mkpu3cWtjaoZ1lOHzaQjxSsOH9uoKS53Ehyf7ZtbvA4
	OKTSGxeMWaitpaAVhO77tmDzqFZwM4P5274PfL9HShIvicDziQdot7iEtD2PFaqlxSksUbSTlPq
	+m/hKuRC/gdhsFKlhWfrgaF2NQlhJuTg+ERG2fpTvnTA83v2AVxVRiX85LUfL4cFhV50CFvSWXo
	=
X-Google-Smtp-Source: AGHT+IGyp/xTGp5oc1Flc0suMmUx+z84Pn68KeWyBolHGZeBeRUJhIRXZcDbZoi8bBEnqcyDMtHfRg==
X-Received: by 2002:a05:600c:470c:b0:442:f482:c429 with SMTP id 5b1f17b1804b1-4533caf534cmr134483935e9.8.1750167428760;
        Tue, 17 Jun 2025 06:37:08 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e224888sm179494365e9.1.2025.06.17.06.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:37:08 -0700 (PDT)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Tejun Heo <tj@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Subject: [PATCH 0/4] selftests: cgroup: Add support for named v1 hierarchies in test_core
Date: Tue, 17 Jun 2025 15:36:52 +0200
Message-ID: <20250617133701.400095-1-mkoutny@suse.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This comes useful when using selftests from mainline on older
kernels/setups that still rely on cgroup v1 while maintains single
variant of selftests.
The core tests that rely on v2 specific features are skipped, the
remaining ones are adjusted to work with a v1 hierarchy.

The expected output on v1 system:
    ok 1 # SKIP test_cgcore_internal_process_constraint
    ok 2 # SKIP test_cgcore_top_down_constraint_enable
    ok 3 # SKIP test_cgcore_top_down_constraint_disable
    ok 4 # SKIP test_cgcore_no_internal_process_constraint_on_threads
    ok 5 # SKIP test_cgcore_parent_becomes_threaded
    ok 6 # SKIP test_cgcore_invalid_domain
    ok 7 # SKIP test_cgcore_populated
    ok 8 test_cgcore_proc_migration
    ok 9 test_cgcore_thread_migration
    ok 10 test_cgcore_destroy
    ok 11 test_cgcore_lesser_euid_open
    ok 12 # SKIP test_cgcore_lesser_ns_open

Michal Koutný (4):
  selftests: cgroup_util: Add helpers for testing named v1 hierarchies
  selftests: cgroup: Add support for named v1 hierarchies in test_core
  selftests: cgroup: Optionally set up v1 environment
  selftests: cgroup: Fix compilation on pre-cgroupns kernels

 .../selftests/cgroup/lib/cgroup_util.c        |  4 +-
 .../cgroup/lib/include/cgroup_util.h          |  5 ++
 tools/testing/selftests/cgroup/test_core.c    | 84 ++++++++++++++++---
 3 files changed, 82 insertions(+), 11 deletions(-)


base-commit: 9afe652958c3ee88f24df1e4a97f298afce89407
-- 
2.49.0

