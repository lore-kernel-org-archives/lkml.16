Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4D42AC17
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747655628; cv=none; b=mlxqoGAqXX6FuWSx9dYdCB7lDTmrOCrjWhe2opSr1xCQTAkCFQQAyvVii6xPXS5ByCFaZIOFutQIJl5Ro271xyF733CgDHhjgHSjvFNPVZhs5A35Cuc+vOIVjej0vk6V7sd4Jz6GpdiJU24olAAIt/vrHcZ9VMZjJljCQelUb/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747655628; c=relaxed/simple;
	bh=ItUQVcI3QMhfWdrEKxGthHFAAK+IsdAOcxEFglXZCCY=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=TU2hi5n9QGX5cb4DyWlAwJPdy0wUXiJ/IoCNo2Dbbel8oUmxlaKnnSxpar8Xpoi4yMJ0xPZxxrBDpg+eW49enEMXA/7fIeOf1s6/K+14P96XAT5idIF7Y5qWbQas/oTH4xEpR/YLu+M+3Q1SItroGUJxo1P6vCPPlU8lXHwZ9cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=a9i1dG/S; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="a9i1dG/S"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4b1GKs2nXNz9sFf;
	Mon, 19 May 2025 13:53:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1747655617; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=MS2B3XIUhvPZ3FWOhUePYptY+koGCfuLPYLrRrJ8NlU=;
	b=a9i1dG/S2hfqQ+LXJ3CGKsJHPPC12IhF4sVBfGTEwKmE9xqUimJNFVkkikY5ve3OEPTg7C
	ikMRVcJS3gTN2fJLBmpho2MXncuJ5g4f9kfn9MAySqTle1g3zvbGQQBRDhNRO2wm/ssR2q
	TBbhOTpfqX+CAifynZcGP3oxReiXE42e55P/p24yK6igOIu0lW9LNUpnRfYM3T4ouzjKv/
	lAEESAo8eurv/Q+loIsmtjB3NiEE7nVsYhxGjJVAay0iIghgXDiqhYDYtYQHbfkdmmr3fO
	SQoW2I4LRuefKVz7sB8K6W+vcuZ1RYuAHT2g9MVHBetCleoDr/MpTeK88Ch7mA==
Message-ID: <1a1126467214c348c5d6ed16c17df82a867a3070.camel@mailbox.org>
Subject: checkpatch doesn't detect "empty" Subjects
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
 Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>
Cc: linux-kernel@vger.kernel.org
Date: Mon, 19 May 2025 13:53:35 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 4ffec501531b413794d
X-MBO-RS-META: a5a5rb8sesngmjamh9ku7g6qyauwboo9

Hi,

I just accidentally sent an empty-subject patch series [1]. Checkpatch
didn't detect that problem.

That's the relevant patch section:

=3D=3D=3D=3D

From fd169d030319dcf2221eaf9cac9e79760c989ff7 Mon Sep 17 00:00:00 2001
From: Philipp Stanner <phasta@kernel.org>
Date: Mon, 19 May 2025 13:27:46 +0200
Subject: [PATCH v3 0/6]
PCI: Remove hybrid-devres region requests

Changes in v3:
  - Adjust wording for Documentation patch (Randy, Alok)
  - Apply Sathyanarayanan's RBs.

Changes in v2:
  - Drop patch for removing forgotten header. Patch is unrelated. Will
    resend seperately. (Andy)
  - Make docu patch headline "Documentation/driver-api:". There seems to
    be no canonical way, but this style is quite frequent. (Andy)
  - Apply Andy's RBs where applicable.

Howdy,

the great day has finally arrived, I managed to get rid of one of the


=3D=3D=3D=3D


(I messed that up in copy pasting. So the BLURP was missing and a line
break separated the actual subject line)

Just for your information, in case someone thinks that should be
checked by the script. I can't fix it, I've got no clue of that
scripting language.

Thank you
Philipp


[1] https://lore.kernel.org/linux-pci/6e46fbe01199d420dc2c9f6c5bd564ea45b0a=
0e9.camel@mailbox.org/

