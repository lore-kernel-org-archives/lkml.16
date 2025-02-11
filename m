Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF941E990D;
	Tue, 11 Feb 2025 06:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739254995; cv=none; b=Br15EXORL8urjL77XRY6vDADUh+k1PjLOps89rBrSddUSbEFlTHSIuSwTGANMWobuPFLQrPWCUNYRKUpr2uJntwoBxmRjHgL0e3/7czJROal/MK063Dkcj8bYU0o63iFelnQ9zGJ8ps4zNaZIM7tTB0cytv+1sd72WNxNLDO0R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739254995; c=relaxed/simple;
	bh=PV0mWqmAdYMvl5Hv3e7UkT26+zH8oclaLfygrOMSOZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DT91AZAhRdocJ29pqICmpMo3QQNHB2Y94Qx7bW9E4oRC2uUNbPazeauI9vyI1Ojr1BFwJa3SKA02OjYXbb+5K0jQXvdz+S0eJND1vewaPzBjCYRAX6J2+Q5UF9D43ME6pUc1nghUonrhlp/e2yc53Lsd620lGUuiiKwGGhea9kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4bmxKBN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4bmxKBN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A83E1C4CEED;
	Tue, 11 Feb 2025 06:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739254994;
	bh=PV0mWqmAdYMvl5Hv3e7UkT26+zH8oclaLfygrOMSOZ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P4bmxKBN1vTjyVRt/N5Uo0Yjtg8QrDXmWSiGFhUKn2cumXe1O5K82V9rbBNUbEIFY
	 nS7E9fRwKgg9FeGgTGBiZTZI3QDTWr9vVasF9aymyxBiipBbuj18dT6OF9Mq4J+uaR
	 eg61ThuqSXLx13D5svElPqISs/NcLz1FGE2UPtIEMn1s+Tqbg4Phjm1EQPKrwhiICB
	 7w+CMg3oFeFK3nNO3eUa2L54c3myxiRmqW80VcMcw8ib/us63l7TIGTB8TClLWXWPg
	 Fl9iXiDmgv4d/V9fQ83eVzG/BqpPht9DA0fVP3KKv2UyfnPbLZ7UCkQwRAZ2Vq2o5f
	 ALe/PSGDWIOQg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thjfs-00000008YBj-3t4i;
	Tue, 11 Feb 2025 07:23:12 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [PATCH 8/9] docs: submit-checklist: Allow creating cross-references for ABI README
Date: Tue, 11 Feb 2025 07:23:02 +0100
Message-ID: <76e60ee8717551f3d15d7c92b9c93bbf2ca8cff3.1739254867.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739254867.git.mchehab+huawei@kernel.org>
References: <cover.1739254867.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Now that Documentation/ABI is processed by automarkup, let it
generate cross-references for the ABI README file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/process/submit-checklist.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/submit-checklist.rst b/Documentation/process/submit-checklist.rst
index 88b6358258d7..2abf8831cf74 100644
--- a/Documentation/process/submit-checklist.rst
+++ b/Documentation/process/submit-checklist.rst
@@ -52,7 +52,7 @@ Provide documentation
 4) All new module parameters are documented with ``MODULE_PARM_DESC()``
 
 5) All new userspace interfaces are documented in ``Documentation/ABI/``.
-   See ``Documentation/ABI/README`` for more information.
+   See Documentation/ABI/README for more information.
    Patches that change userspace interfaces should be CCed to
    linux-api@vger.kernel.org.
 
-- 
2.48.1

