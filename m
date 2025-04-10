Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D732820C013
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744273869; cv=none; b=b+lm9nZYOUd90lrgC/JLK0s999fWgD911iBRURZyMgBptMtpYoZf+G/7vtXJRZEtDgcqV9soWCcaGsqsdYi+15guj+d+CCkI21Jo2mpLmIGcceb82YfPAUQPWwwVMNLm/TMbbf9cgYcvttI6XSzTb1RL5diT06uli1urUveQSkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744273869; c=relaxed/simple;
	bh=oQnUDeEZ2r8C9sjmNcaFJtnHOl/Ix9z6aHaoboLoVYI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B2aBQXZ8JrwfqA5XuWNjngMKPQ/c2jRSNNlif4cSXvFgUblSjGqVgB+GjP/MiHiGFgPvH9IO5/T7aBKvHKwvGkD9JOuwiCEC6ME2tsjoKJ8Thzve3ybXUtYEsk9kqC1KKZfuwwY3jiPJsDH35x7NPx/z/nMiEAhXLn7i7PaQWqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1f1c:893d:f419:6517])
	by andre.telenet-ops.be with cmsmtp
	id bLWz2E00L3xgA3j01LWzWw; Thu, 10 Apr 2025 10:31:00 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u2nJK-00000000Gmv-2oem;
	Thu, 10 Apr 2025 10:30:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u2nJL-00000009IPH-39Mj;
	Thu, 10 Apr 2025 10:30:59 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Aditya Garg <gargaditya08@live.com>,
	Kerem Karabay <kekrby@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] HID: HID_APPLETB_KBD and HID_APPLETB_BL should depend on X86
Date: Thu, 10 Apr 2025 10:30:55 +0200
Message-ID: <cover.1744273511.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

The Apple Touch Bar is only present on x86 MacBook Pros.  Hence this
patch series adds dependencies on X86, to prevent asking the user about
its drivers when configuring a kernel for a different architecture.

Changes compared to v1[1]:
  - Split in two patches,
  - Correct Fixes.

Thanks!

[1] "HID: HID_APPLETB_BL and HID_APPLETB_KBD should depend on X86"
    https://lore.kernel.org/4b046ce1cae2170453037c7ea006c91c12383dab.1744190441.git.geert+renesas@glider.be

Geert Uytterhoeven (2):
  HID: HID_APPLETB_KBD should depend on X86
  HID: HID_APPLETB_BL should depend on X86

 drivers/hid/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
