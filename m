Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8E02FD86A;
	Tue, 24 Jun 2025 15:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777757; cv=none; b=aPNrPV6flYcV7MM89jYnSBSdO1Iw0ZgcWBk48tFrZ532w45Y6oBVGR6U9uHM0eSsaBIcghAl3NBOVJZ5jHf/cT7u7wpn4In99I6/QPus8woUMab2WJKw6Oojb6nJBaCEMaGVBFaU5glNMNTLnbG6hoK5Z+GFSD4J4CtZw7UcSKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777757; c=relaxed/simple;
	bh=ZE9LwqVUg7dE6O4fOWYKm1h+jAevlxkSZzzZRGPLOVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iAswNszhrcQ7X72NSNxkPzX53qkdfwAYrIGhiokcvXwtrsUDz9HeLVsEiSbYgk7yec1iHwnjIq6FvMZI1JdQqc3P8PuynHwxG6EShYYxWVXFZ6xPsYX4VcDLb80oyC8V7VPWNI1FHaIz2h/vy52/uV5yjfJXkHjrOzxd97wRVuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tkyfgX3/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tkyfgX3/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A16EC4CEE3;
	Tue, 24 Jun 2025 15:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777756;
	bh=ZE9LwqVUg7dE6O4fOWYKm1h+jAevlxkSZzzZRGPLOVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tkyfgX3/J6QVKMJXtG0wnh7g+fDtZ7DgUEGLgMDZF05CADwhDykusuSm5JwEN/XE/
	 0VxO1lWCK+LeXKqEMEFiIPu9+J3noWlcdD17BRLyipIF91d+x2yhlThcqn4kdh3FnJ
	 vWObKsACfAhyJncjoRIAbyr3PnblEQ4AQo6XjoLY4Jdnh6CPlyjtxILgHIWLvFVg+E
	 LWacU48CnlyJ+m43G7ooBPqRwbZNx6RME6NOH+Dh08WN47Ko/+nN2hfMXuOuvGcphi
	 xjO09ZCQu5IOuqMZCXw5/KCM8mA2DDfgtqQUhs7G1+3pF3DMlmfoBFXpFZv1k8WX/Z
	 3wJJWFncOS6cA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 58/66] kconfig: gconf: remove unnecessary default message in text view
Date: Wed, 25 Jun 2025 00:05:46 +0900
Message-ID: <20250624150645.1107002-59-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624150645.1107002-1-masahiroy@kernel.org>
References: <20250624150645.1107002-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This message looks odd because it is displayed when nothing is selected.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.glade | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/kconfig/gconf.glade b/scripts/kconfig/gconf.glade
index c3996f4635e9..b2e15b23744f 100644
--- a/scripts/kconfig/gconf.glade
+++ b/scripts/kconfig/gconf.glade
@@ -517,7 +517,6 @@
 		      <property name="left_margin">0</property>
 		      <property name="right_margin">0</property>
 		      <property name="indent">0</property>
-		      <property name="text" translatable="yes">Sorry, no help available for this option yet.</property>
 		    </widget>
 		  </child>
 		</widget>
-- 
2.43.0

