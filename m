Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEC01CAA76;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182704; cv=none; b=aXhi9IW+tpNRMJEjT16Ubv2Icbgh1DRglQfZb4nVytm6sbei2KPvNZ0TML5wRQAhs42pOEzeSQA6fiDnzfpTDEjqIFFnGBpDKgp2R8z9otijkB/qcNluDoCAw/e2eHsqQJyn2fbeDOaCqbNRHguH5DeQBlYStFJvKlaeqYXfikI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182704; c=relaxed/simple;
	bh=Tj1nz2RZBql0geo5lraeHUCDCc6IdX7LSdJsN5wj1mY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TT+stvLAcUFpEKtBvbImHQ0Dj/I+rli9lBcXZCNfygEPnEO4O7zj6PdZIz/HjapbrWDJq9/PofVKeSftm817wT0T+G88IbqpyvtpiouBbHqTLndS/0jKYqvVruJTUPPeS9xd8PRjDqmuWD4A8ahgTnLfLvv/VIHyvXx86435MlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gkyTn+T4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkyTn+T4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB2BC4CEEE;
	Mon, 10 Feb 2025 10:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739182704;
	bh=Tj1nz2RZBql0geo5lraeHUCDCc6IdX7LSdJsN5wj1mY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gkyTn+T46XmjwUvB/NsFZsATTY/D6pP/CIlfrDaTdKfLuO7Kd+EPuT2Q0fOpEGyRp
	 U4I8VplC4l0zulyZbxvHIU2A5wUEyR3x6TXDHdVF2JSnmKY47bYLha5H17eE/0Fgdr
	 F7WFjVRuy/POEFg/mIPz9fypejZtXihLQJZc9PMxZOqUvybP9GYM+cC77fMPLZQzbT
	 eEsb7flvm3GCMb8uR0AsnDXaR8ilHtSN875HSnv434GiNHrHtWkwzpce7D0zIvh0/T
	 2mppWRtGG2Oe8X7LnxSdXktEELekU1oBMMmKUYVYpKSAH6gfPnV6gxkw/ii0YImvm2
	 qUGi38cKe2Hhg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thQru-00000006Cie-0IyP;
	Mon, 10 Feb 2025 11:18:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/27] ABI: sysfs-power: fix a what tag
Date: Mon, 10 Feb 2025 11:17:57 +0100
Message-ID: <508051136ea2e07e0dd7fa41ff40382387c24ba8.1739182025.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739182025.git.mchehab+huawei@kernel.org>
References: <cover.1739182025.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

There is one What tag that it is using semicolon instead of colon.

Fix it to comply with ABI description and produce right results when
converted to html/pdf.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/testing/sysfs-power | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-power b/Documentation/ABI/testing/sysfs-power
index a3942b1036e2..2192478e83cf 100644
--- a/Documentation/ABI/testing/sysfs-power
+++ b/Documentation/ABI/testing/sysfs-power
@@ -131,7 +131,7 @@ Description:
 		CAUTION: Using it will cause your machine's real-time (CMOS)
 		clock to be set to a random invalid time after a resume.
 
-What;		/sys/power/pm_trace_dev_match
+What:		/sys/power/pm_trace_dev_match
 Date:		October 2010
 Contact:	James Hogan <jhogan@kernel.org>
 Description:
-- 
2.48.1

