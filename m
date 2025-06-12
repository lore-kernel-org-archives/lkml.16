Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D0B1A304A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749728548; cv=none; b=oqC0TgIzbQFNdVWbmLQkELW96d5jcXsjmMFsQgk3KJGuu6rXrBqt0eF/doyU/+9eGpKvdfL2hmIPi13vGvZTETQfinsjQuHorTctTXbmZuKVYTj5bPBbjjH/My70qn8NBbKkYEMWDjY2ojCIEfyMcDzPbZQNIzh1IJSKmtcRuN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749728548; c=relaxed/simple;
	bh=QXtBQLsLvmgKCeZpy9SACWHhgLdOix4C6WfpyVk7tJ8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=C4wUoxjcA613G0bICRSx3AjRclbCN5UxsMQOIKK5BJJPlSKu/T6soBw3vjQ+tJoguxYWH8TdZpQ8Fg0/C2FAxeO8J232wAf2MoXBYtmaX0ir0dPmlfoSQymqzWACRAPwlnwbMt/SQ086KPaGPt+D5IJtmbtaxleQY+k23WDcbSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mclapinski.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zAqYtyvi; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mclapinski.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zAqYtyvi"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-606aea61721so726382a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 04:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749728545; x=1750333345; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zzguWUlfoEXe+YlTaZtG+0rEZ7v9uyUK3wef2hG/zAY=;
        b=zAqYtyviPp/hTJoaDYiE7m0yHhv0JrHqcN26c08NzzKrEZcnbUZLZSWCbETVML7Vns
         W0icugi4Tq8uXIOsEzMry18nMu13QQo0ASDib5w37VPUJ5Tff0qj8Ckk44KvtVAI70SL
         C4heeCCJ+xN+kftX0ShQpgYLyTtN3E3Id686dVPVEmCVxguyGB5gR5NFmb+FgdVBeWlP
         LJ1egXGuBOKkrfuAjE8deQPcAJkhmAd/ZqMmiLq7WrnWSsKnvdDiwplfFerGZVDMcp59
         qUFPbp6UGN68vNzYNyKLL7LPv+M+eQMUA3X3oeSXYTAjtDZyDktnG6G4RE+cSlop062i
         QZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749728545; x=1750333345;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zzguWUlfoEXe+YlTaZtG+0rEZ7v9uyUK3wef2hG/zAY=;
        b=vkxfEX6FOtNC7eG7JE58UCmA9/0Tc3XamKcI7OtxMAurJvVSrIL4CSgAZBFqp60R+Y
         py24b+bPVvYqDWJVGCveZ91VPhBZ3z5faPndY4v6X1zLXKkEH3KZ+RsJK0P1+tz2M2ih
         a9bbyqVadTQeXk2dGpVH2/F+5oIK+F4yJZ8WXgcbd38KxTp2cTZmThlBNKPSNDSC8dqG
         lxdSJQhKT4Di0OGCRSHBqtTCaOKH/4XFU/rVSi+oRboXAipbDMof9saDTZpd8DbiEsUP
         YVvsJ0ruErbq5qe2W8ANxOQBhXJz3OlMxH+Ze/ySuVoOIZvwnN7YVyxJY5+a1sbgZz9I
         FStQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLbgtNxcYOHR+bBLe+6X7BuQxnYKmwh45nf4flVVk67vOLEgjxQpMcX3RW+hHSceyY0w4T8tkm4uu6t20=@vger.kernel.org
X-Gm-Message-State: AOJu0YydCAZL2Jbb1wNh5EzG3LyCUa5yrU10+/o0bViA0uU2m4BQGIdF
	qIF2gnTwbzY27111nXa2jVdGOdz1TsarQQr18sfOS41iuLd7yYNKnAf3Uv+6hsQlp3jyShqwDHv
	ixsaauGdOfkO74yu1q7KIFg==
X-Google-Smtp-Source: AGHT+IHQhB9KxEerkKZiu9qR2EkYzNfHsYj6AxxV/xNEcdvJShwSN5Xny18JELLkZkfVd8q068snd0PkYT5KwIGL
X-Received: from edil3.prod.google.com ([2002:a50:cbc3:0:b0:607:e52:389])
 (user=mclapinski job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5cd:b0:607:d235:87b1 with SMTP id 4fb4d7f45d1cf-60863c28483mr2905583a12.32.1749728545512;
 Thu, 12 Jun 2025 04:42:25 -0700 (PDT)
Date: Thu, 12 Jun 2025 13:42:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250612114210.2786075-1-mclapinski@google.com>
Subject: [PATCH v3 0/2] libnvdimm/e820: Add a new parameter to configure many
 regions per e820 entry
From: Michal Clapinski <mclapinski@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Dan Williams <dan.j.williams@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, nvdimm@lists.linux.dev
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Thomas Huth <thuth@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Mike Rapoport <rppt@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-cxl@vger.kernel.org, Michal Clapinski <mclapinski@google.com>
Content-Type: text/plain; charset="UTF-8"

This includes:
1. Splitting one e820 entry into many regions.
2. Conversion to devdax during boot.

This change is needed for the hypervisor live update. VMs' memory will
be backed by those emulated pmem devices. To support various VM shapes
I want to create devdax devices at 1GB granularity similar to hugetlb.
Also detecting those devices as devdax during boot speeds up the whole
process. Conversion in userspace would be much slower which is
unacceptable while trying to minimize

v3:
- Added a second commit.
- Reworked string parsing.
- I was asked to rename the parameter to 'split' but I'm not sure it
  fits anymore with the conversion functionality, so I didn't do that
  yet. LMK.
v2: Fixed a crash when pmem parameter is omitted.

Michal Clapinski (2):
  libnvdimm/e820: Add a new parameter to split e820 entry into many
    regions
  libnvdimm: add nd_e820.pmem automatic devdax conversion

 .../admin-guide/kernel-parameters.txt         |  10 +
 drivers/dax/pmem.c                            |   2 +-
 drivers/nvdimm/dax_devs.c                     |   5 +-
 drivers/nvdimm/e820.c                         | 211 +++++++++++++++++-
 drivers/nvdimm/nd.h                           |   6 +
 drivers/nvdimm/pfn_devs.c                     | 158 +++++++++----
 include/linux/libnvdimm.h                     |   3 +
 7 files changed, 346 insertions(+), 49 deletions(-)

-- 
2.50.0.rc1.591.g9c95f17f64-goog

