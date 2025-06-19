Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6117823A98E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 03:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750305343; cv=none; b=IKiR6uV3N5HcQbGHp0CwITspKlqIjf2m3p/uu+b501bB1FZo6rQmJM3DE2UDZAyBC/d3i7/Jfx3Dg2skOF6uF9mqHCME/1wFnP56g819OZJ3zZBdf0sxhxIMNSbA7MlNC9k0jaeozfoy2gA0RxIBkyvlaE3FiEMD7FcwlOT9Up8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750305343; c=relaxed/simple;
	bh=IlYpdHYyVfnWT2hmGdyVuAHj/CWtIcKtVnWXmATVXRY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VTzHfdXzSxiIUkeAsgTWk+3UNIiiKfsemeNJxFM35dIVuC3jeuAg7uojNEAmzEaI0Ds54pzB0QdAEyJD3bn2rhW1FAy4IvOB+sufthm78rSekfOxoG96cqhwRUGuOvnQwL9M7B4jH/cI2SPr8APFH5v7dkuFeACuIparEq1hM7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3qL8Lj9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3qL8Lj9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0C3C4CEEA;
	Thu, 19 Jun 2025 03:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750305342;
	bh=IlYpdHYyVfnWT2hmGdyVuAHj/CWtIcKtVnWXmATVXRY=;
	h=From:To:Cc:Subject:Date:From;
	b=I3qL8Lj9C+IrtvxAHXoIm6CyqH4HW3OWgFWH+W9RatyJfNIuM8gIiwCz/JWUmXYAi
	 kv5oPr4FpPe+DQn19yqVyYyEmLEtXjDGUCDAMyB0eopwUqsMiI628atSTnbPqNg14f
	 KKWnyCo/mp9Gn7/SULbo6C1wpKsTq/qNaa1qtYZAJCbPaJz8aTipPhSXo+t9G8dn9y
	 BimZ402lsC7g1WRGGdkEHmj535ckXN1hN9rWWoe+06FJU3X7GKnQW2wL6PQ5bqeBN+
	 aar4KTnXcxTRPjDrsfQVfsg8tmwOi19D+FLG5/eVn0ssbP+GjgJKMvPj1aplgWOvGL
	 WlzY7tHq04XpQ==
From: Drew Fustini <fustini@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Mathieu Othacehe <othacehe@gnu.org>,
	linux-kernel@vger.kernel.org
Cc: drew@pdp7.com,
	Drew Fustini <fustini@kernel.org>
Subject: [PATCH] MAINTAINERS: Update Drew Fustini's email address
Date: Wed, 18 Jun 2025 20:54:57 -0700
Message-Id: <20250619035457.331065-1-fustini@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch from personal domain to kernel.org address.

Signed-off-by: Drew Fustini <fustini@kernel.org>
---
Note: Palmer told me that he'll take this through his tree.

 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index b77cd34cf852..4c3be5a921a6 100644
--- a/.mailmap
+++ b/.mailmap
@@ -222,6 +222,7 @@ Dmitry Safonov <0x7f454c46@gmail.com> <d.safonov@partner.samsung.com>
 Dmitry Safonov <0x7f454c46@gmail.com> <dsafonov@virtuozzo.com>
 Domen Puncer <domen@coderock.org>
 Douglas Gilbert <dougg@torque.net>
+Drew Fustini <fustini@kernel.org> <drew@pdp7.com>
 Ed L. Cashin <ecashin@coraid.com>
 Elliot Berman <quic_eberman@quicinc.com> <eberman@codeaurora.org>
 Enric Balletbo i Serra <eballetbo@kernel.org> <enric.balletbo@collabora.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 0c1d245bf7b8..383dac9da517 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21377,7 +21377,7 @@ N:	spacemit
 K:	spacemit
 
 RISC-V THEAD SoC SUPPORT
-M:	Drew Fustini <drew@pdp7.com>
+M:	Drew Fustini <fustini@kernel.org>
 M:	Guo Ren <guoren@kernel.org>
 M:	Fu Wei <wefu@redhat.com>
 L:	linux-riscv@lists.infradead.org
-- 
2.34.1

