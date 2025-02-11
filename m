Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E701E3DFD;
	Tue, 11 Feb 2025 06:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739254995; cv=none; b=janRaDjTzJ6sSMMn1OqUnaiQH9eNl9U3yVJQV1dksnCKNbOzVLZCvM6Clg3eq0Kb8rXVatY+FR75XLi2+VGsbxNWvpvKNL9tbul9p8i/Z0+acoO3vwZS2ipowHLaRG0njvdjjV4AkKVsoQ5PNaO5kI2hs564V004HcJYwBQbkOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739254995; c=relaxed/simple;
	bh=rbk4BpPM7ONpaeiUWNXID/PprX5q2RG5Ax9J83M5MFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KRcbHhdAohzXq8ReGenDvMNF4PzZ95WSrhu4LUDRR7M6kO581nlZEFB2JSpqxIpM194toK2ClxbaMgVhfGhMoEsYenI1Kw2WiwHq990foDCoqzAgRYH6rOQ7DIOUYBOgs+xFKJXqRQsQxUdAEGt9HpLEXi1ZcZCqPOH8PDDGGGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5RNmNSo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5RNmNSo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9017AC4CEE5;
	Tue, 11 Feb 2025 06:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739254994;
	bh=rbk4BpPM7ONpaeiUWNXID/PprX5q2RG5Ax9J83M5MFM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G5RNmNSoMc+SaaL2V2pZNmm3UdE6xYr4BD4fUnKW9b0Hzkh0t00EVzF7wbkrN/vlg
	 mM4J8/ioHnIHkI7P9ZI+T9f9vKiFCgcmqJtlOXuhj0GdfEaRirRXIMD64Uwx5YuGce
	 EwSCWuyu0sy8+8gIa77CTR5LhVfgS3hiog7YAJX8Qo0XQGiAaxBjqpJ1ljrtFDyySW
	 3Hd/MjSarGn7VIIdpbkX+aKXoseawV5n7f+N8mlhx/4Ih/t+RYvgg9c2qJn7BPYqeZ
	 zKU/A6TPjzDlSVC3qZa/zCaWl65XO1HBT31Kl8yDrCd+NZUfsft723s7FfwODvz84p
	 gQ7PoVEKRX83w==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thjfs-00000008YBP-3J0Z;
	Tue, 11 Feb 2025 07:23:12 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 3/9] docs: thunderbolt: Allow creating cross-references for ABI
Date: Tue, 11 Feb 2025 07:22:57 +0100
Message-ID: <a655e770e1446f91088f579b79ae890a19771119.1739254867.git.mchehab+huawei@kernel.org>
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
generate cross-references for the corresponding ABI file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 Documentation/admin-guide/thunderbolt.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/thunderbolt.rst b/Documentation/admin-guide/thunderbolt.rst
index 2ed79f41a411..d0502691dfa1 100644
--- a/Documentation/admin-guide/thunderbolt.rst
+++ b/Documentation/admin-guide/thunderbolt.rst
@@ -28,7 +28,7 @@ should be a userspace tool that handles all the low-level details, keeps
 a database of the authorized devices and prompts users for new connections.
 
 More details about the sysfs interface for Thunderbolt devices can be
-found in ``Documentation/ABI/testing/sysfs-bus-thunderbolt``.
+found in Documentation/ABI/testing/sysfs-bus-thunderbolt.
 
 Those users who just want to connect any device without any sort of
 manual work can add following line to
-- 
2.48.1

