Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352681F03D7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 10:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743502273; cv=none; b=W9uOdiVP5S8CB4+yXB59px2Cn5ScCXAnZmHVQxoBoypvm+mdrEZuXyZUTlQMgHXnx+7plmAmjwLhA+5Bj2haqI0mMcRuyn4Jd3hJrWZ8fYbJ4Xdk0LGm422iK9xHeIj2fI76/r37Qmw/adm0pbQ2yiZgrVbvEY/gims83fCpSYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743502273; c=relaxed/simple;
	bh=najhAWRGQ57Y7UB5J/ILd72qZWp6BmS+tkxT/OOIcAM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=riS72C1O0KtlqNX2oIl+h6y9ctbtTo4NnAP0d2rZRJpPg1OFevk552o/Drl9Ngu4GLfusJYJXv5nYCA2IfQQQYsCyh1wE8FW+8ArNjJnvLi3OkzChhSAoR+FQWC0cyPiGzFyu6DfpiixtoiyqQ1AmKvwuJMVcBMufblnUZmd4Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zShq3P4y; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zShq3P4y"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5c9662131so8324943a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 03:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743502269; x=1744107069; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rHGgSQdD2hCEm7pwASM4ZVE3/ZfNMjeU9kHI9pQmKw0=;
        b=zShq3P4y+AjPfdx82voQvT5m5+uOABbc5bpz8pxOvFlT6rIHzEBm/TB+1oz0bBgFlM
         evRYymS4kStzUnifA38M1LZsRqA1pjiPUhLg8oOoJF6Qn6xpcPa/dO7w/AMGStmghwCe
         3H1ddwQ5tVbeh67nroaYLg5+FmJsURJK6kB7TOEzwQOgMoL+SFzN1qVUP7GeTNP/GMpq
         HrgYbQwtEjYSq/YklheHCgAAyyHx/FUo8mq3R6zCpbuEpiIhvq+w6eDd4PlSXyOIfm5U
         HLRvT7drTDHk+ESXNOWsryb+WhBszaZPl6iyQKgc8OTits/ZDyTasQXD1MtJ3+ZwJto8
         GpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743502269; x=1744107069;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rHGgSQdD2hCEm7pwASM4ZVE3/ZfNMjeU9kHI9pQmKw0=;
        b=UF9Ye40YQiq798qpybbo2Mh1IYq9oBLJSW3Q0mNWkyk1dcq5vp+268yteSGwrAFuJA
         6NY5Rq9xNKqnZJEY1viIfsKn5VrsRfzL7mYikZs+w8BaMfdUE1i34jWbCKJFVEEVnjbA
         ytiAdFwtXIeHkjjm0n/cJrIs1m6D9S1vV2/I56pqP4+3Hd2IgVYrp4JxKkMwUk03QuwK
         rzYumn3YpNrVUxu48qFqolUNCQxjnoM1CX4gfuaoulkzYmyamCzcmi5/qS1MCnJ9Xrd3
         aY/yTWfdpA5o3U76T8qjEJ3Ayt6kw3Wfjo8t1oELTgQGjSxYADu/O3cgmwflsVKUXM4Y
         Y3fw==
X-Forwarded-Encrypted: i=1; AJvYcCULwf49ahsqAqwxwu7lF6+4MGjtrv9V5ROGcXjZtBP59+Bm1nA7z28OM56XA+hjcJ0ROE5ZfkyLu1ic8UA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgJSZhosjyLfqSCKDqgtqAnepJFq8asqJIot3wKN9TckghpNpa
	2jbMkD4cy1fx/PZjOEHRG+Lh2j58sYhOR0e5JIpT7FcLhq2lXvRdJt7xjP36wNQ=
X-Gm-Gg: ASbGncsimCPnYj82Oo1rtGDb0x8Vds+iflhU/41mbdQD2mxBdQCOS/7OSzDNTRUHs+g
	p9L0PzpQ7tqJBrnqg6SBsM6nnN3mV0toWJAEo1cr39xmCnwSoHYwbjHKIZxJ/WPRzUFExXuyTq1
	w39BPLbwukI9iicZ0w8oAUlcdc+fNnYgslBvcbFSiqyCi689O+13gCtRPLMPjy7UN9sPDepivuo
	TfXSxUla92E9boqd8XM8auTKrSy3AaAx4gvkaH9gsMyxabXmCgTT1g/Q0MAV96k19OE5p+54UIB
	A60EvjU7n245pNOu+NJK2/vVGeMKPkQp+hTr16wrnVHeF1/QsSfZLlllwuU2GTl9UHjAKJZzOXX
	cbXTgVduPHCr1/c14mVpxxUsMern3
X-Google-Smtp-Source: AGHT+IHT9jkz+UCs3Db5OyfIYrlRo4mz+SAmgujhurHxk3CEiZo8YgaUE+HWHRECisppy8g9djLtgA==
X-Received: by 2002:a17:906:f85b:b0:ac7:3912:5ea5 with SMTP id a640c23a62f3a-ac739125f39mr976557566b.58.1743502269438;
        Tue, 01 Apr 2025 03:11:09 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71967ffcdsm757406966b.140.2025.04.01.03.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 03:11:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v5 0/2] support Linux reboot modes in syscon-reboot on
 gs101 (Google Pixel)
Date: Tue, 01 Apr 2025 11:11:01 +0100
Message-Id: <20250401-syscon-reboot-reset-mode-v5-0-5b9357442363@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALW762cC/43PSwqDMBAG4KtI1k3JwzzsqvcoXSRx1EBrSiLSU
 rx7o5u2COJq+Afmm5k3ShA9JHQq3ijC6JMPfQ7iUCDXmb4F7OucESNMEMYkTq/kQo8j2BCGXBI
 M+B5qwEJKobXVpQKK8vgjQuOfC3255tz5NIT4WjaNdO7uQEeKCa6oo1YyKqWB8833JoZjiC2a1
 ZHtlViWGk20llwRa9VK4r+S2pD4fJOojBPcca7NSiq/Emd6QyqzpJQ1QinCjfv/bpqmDxxViaS
 fAQAA
X-Change-ID: 20250226-syscon-reboot-reset-mode-566588b847e1
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

This series updates syscon-reboot to support warm/soft and cold/hard
reboot on gs101-based boards (Google Pixel 6 and Pixel 6 Pro).

Linux supports a couple different reboot modes, but syscon-reboot
doesn't distinguish between them and issues the same syscon register
write irrespective of the reboot mode requested by the kernel.

This is a problem when platforms want to do a cold reboot most of the
time, which could e.g. wipe RAM etc, but also want to support rebooting
while keeping RAM contents in certain cases.

On gs101, this can be implemented using different syscon register
writes.

As Rob pointed out in [1], register access shouldn't be encoded into
DT, though. At the same time, at least on gs101, the difference is just
different register values in different registers. Therefore these
patches:

    * add a new compatible for gs101 reset. In [2], Krzysztof suggested
      to simply add that to the existing generic binding
    * update the generic syscon reset driver to support this new
      compatible 'google,gs101-reboot'. In this case, and as suggested
      in [1], the syscon writes are then deducted from the compatible,
      rather than parsing them from DT.

The existing generic syscon-reboot driver seems like a suitable place
to add support for that, given all of this is straight forward and
simple and similar to the existing code. If the preference is to have a
separate driver copying much of the existing generic syscon-reboot
driver code instead, please let me know.

Link: https://lore.kernel.org/all/20250227132644.GA1924628-robh@kernel.org/ [1]

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v5:
- Krzysztof:
  - drop gs101-specific schema and add the new compatible to the
    generic syscon-reboot schema, with all appropriate follow-up
    changes to it
  - reuse existing syscon-reboot node for gs101 in exynos-pmu schema,
    don't introduce a new one
- Link to v4: https://lore.kernel.org/r/20250328-syscon-reboot-reset-mode-v4-0-77ba57703ace@linaro.org

Changes in v4:
- Rob:
  - don't add more properties to existing 'syscon-reboot' compatible /
    binding
  - add specific binding for 'google,gs101-reboot' compatible and
    related driver changes
- Link to v3: https://lore.kernel.org/r/20250227-syscon-reboot-reset-mode-v3-0-959ac53c338a@linaro.org

Changes in v3:
- support <reset-mode>-reg in driver, not just in binding, doh...
- correctly parse <reset-mode>-offset
- add a comment for all the BUILD_BUG_ON() checks
- Link to v2: https://lore.kernel.org/r/20250226-syscon-reboot-reset-mode-v2-0-f80886370bb7@linaro.org

Changes in v2:
- fix whitespace issues in binding
- Link to v1: https://lore.kernel.org/r/20250226-syscon-reboot-reset-mode-v1-0-91c1b62166ae@linaro.org

---
André Draszik (2):
      dt-bindings: reset: syscon-reboot: add google,gs101-reboot
      power: reset: syscon-reboot: add gs101-specific reset

 .../bindings/power/reset/syscon-reboot.yaml        | 42 +++++++---
 drivers/power/reset/syscon-reboot.c                | 98 +++++++++++++++++-----
 2 files changed, 107 insertions(+), 33 deletions(-)
---
base-commit: db8da9da41bced445077925f8a886c776a47440c
change-id: 20250226-syscon-reboot-reset-mode-566588b847e1

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

