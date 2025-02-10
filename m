Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB5E204860
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200233; cv=none; b=TRHmx7lRJKxGstUsyovnPThtGySrICPUMPWpna3iG57ssEHVKmXm/6uNr82fZV6sSF++MygOcrW8ote198a4XRD/Eoe0N2GKxxwqqbqRzUGdP7Qd70fd/pkmhbm7O5DDJXBTCnCVrbOei+QvxHP+h56K7qQ9qtQjqzs4gWKlPTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200233; c=relaxed/simple;
	bh=/WED9W7vj071TIVLce8utn3oZWKaP0jz++GiWe9APm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bG0ZUYNI27qg8dUgtNN32W2kXxUOYH8Ybfd28loUCkuBYyhCoYc7gZYOBRNgQUzDtRN07v0ycN/vgsPorPe7S73zy+KN4WI9UmqElgfutINFppwgavTm6A9zsM+JZXQPQGlIUt9lE86gUQvMKXxMjhBQGi3fTuisc7Fqt9o7BrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPYnaLZ9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPYnaLZ9"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43937cf2131so11620465e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739200230; x=1739805030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H7ywKxO6aRoA2l5hpZMYFuLPKAduv3SkzGzfh6WzbJg=;
        b=kPYnaLZ9C7aFvOzf5+b60iVMnArWWVGdRhtI7hujTbhwT/C9gUEgVNsLHuCTbNbTtC
         oSj7I9TDLy/4zmFGIeBOKcT83mpXvUvNlU087lLnaDtt5prUgepxLYLHssoC3o26lys8
         768Fn0Vdw2bZ3DLT/EFO5lEb+ixalJ/wS1YgImy/evURmr7PVeG3wr5DnV+Yy3R1YEcw
         KcEACm2HVJceOSqOUZbs72ANO8Dq1CMa8jVvoEmFf/TnSdzj1wXa0AP16AhBpUC2amoE
         hlIfTlOtxbLidUHFOoom/yrOLpSwzvZje2ZcVj4ath+nep3jOBcZNPtaklicRZQYEHKm
         jUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739200230; x=1739805030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7ywKxO6aRoA2l5hpZMYFuLPKAduv3SkzGzfh6WzbJg=;
        b=JMBfBUuA3JMq7krCWWfFLmzngVm1GqIfXny/Pd/pZYSOXlREc4s7igiejdO8H1D620
         +j6KYhpLm5lgaqjcOfFKXVy1wjTdUtqP8aX9CL+d6zCVOzW+R8NE89Ni0Wd9vHQ5z+ZF
         mpuKpZXTpAp/ewsTD2+pasAdbIeIl+4jqqI/X9wFiThFAaO/JvoGYkCCpDtojpurJo7Y
         KLCXOTbzQ9EmRumIGNd04J7OQBdnH+MHQgfXAz8GzGudaQCSio0JdTfnYzaKf7YgxpnP
         hahwWTFromxHlZjhCEkKOSvSJ2Iwg4hBjU3NN8qqNY+5YQPdrujWIp1LBU7L8iuYfmCq
         Z3sA==
X-Forwarded-Encrypted: i=1; AJvYcCUg0bjjF8kNdws1Trd0klynWq9k8wYAWMKDHocHity0p9CQUUpKSZUwq4xRvxJmpw/J9EQEpGWb76iWjiE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/jyoxBHJ7HBchmj+kvqwcin+KZBTuF+Tu+anWbQ3Ej5twzlE0
	rYmepCAYjiUotPgofTZhLk8xqm+X7h657uDV/VP7fpZfqIa+dqPW8hCalw==
X-Gm-Gg: ASbGncv0BsrLgM+JIbb8TotkSRGEnnDsDJoU56oyXHrOGz8Ry8SR3iSjSvqBjXYPYRo
	NvrVuyqs96JNEsQ8y6juaLOcSC16HxbxPhy8gd7ZLEQZt9jjaSxV/lOoBTtQM5lB9LSWg/a1x+v
	HCbF7NDAZNqSq+asncIUs12olbdoPkingJgkq5HLKnRRMuM2BPKw328hv1ca52mVyZJmUBOspHd
	XndY28uH+EnkZT/0vmKstdGgXF0GH7W83/7MyNfFRfOTz/l5j92z9ea5ZKueVNqye7YfrcPuAAp
	5YHe0R9UtsjRq10MK7jvXifIXYBlptQGCjxK+JNV88wvTwYbIao=
X-Google-Smtp-Source: AGHT+IHgCpTtZ8NwKI57dDhEmalZGMf7ijeLpRg5cTwpLhLrHKRjjs//L8dap3yq1hkftdRf+672lA==
X-Received: by 2002:a7b:c4ce:0:b0:439:4696:c063 with SMTP id 5b1f17b1804b1-4394c8461d5mr1393855e9.19.1739200229421;
        Mon, 10 Feb 2025 07:10:29 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfc8881sm146834645e9.28.2025.02.10.07.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:10:28 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 0/2] staging: gpib: Remove redundant compilation symbol
Date: Mon, 10 Feb 2025 16:10:20 +0100
Message-ID: <20250210151022.4358-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The intermediate symbol GPIB_PCMCIA was used for compiling the optional
PCMCIA support in the out-of-tree drivers. These patches now replace the
redundant symbol with the Kconfig symbol and remove its definition.

Patch 1: Changes the drivers to use the Kconfig symbol CONFIG_GPIB_PCMCIA
         directly.

Patch 2: Removes the definition of the intermediate symbol from the
         respective Makefiles.

Dave Penkler (2):
  staging;gpib: Use Kconfig PCMCIA conditional compilation symbol
  staging:gpib: Remove definition of GPIB_PCMCIA in Makefiles

 drivers/staging/gpib/cb7210/Makefile        |  1 -
 drivers/staging/gpib/cb7210/cb7210.c        | 10 +++++-----
 drivers/staging/gpib/ines/Makefile          |  1 -
 drivers/staging/gpib/ines/ines_gpib.c       |  8 ++++----
 drivers/staging/gpib/tnt4882/Makefile       |  1 -
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 12 ++++++------
 6 files changed, 15 insertions(+), 18 deletions(-)

-- 
2.48.1

