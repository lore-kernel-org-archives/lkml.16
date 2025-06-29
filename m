Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFD121D5BE;
	Sun, 29 Jun 2025 13:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751202885; cv=none; b=sz6wN4rOMkVU7CW37WQTEe9VWSF5FDTghf7nFCsUGBLLq0o5MFEy2pVa075Up8BZSheVMhQbW/6Q6KbM1KSr7I2tCwVxOelyYh6wrL7tXYYDV4wJXnhbbqcDPqHdN+mUBuu8Z4K1K5v8HRQ6TyNpklUnPHv9ADfeEIYadcvwEwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751202885; c=relaxed/simple;
	bh=557WYkzph8520AlJna0U5Win5RE9F4oKVWBDqE5p8rA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Wi2TPiWVDq6UZUj/Ln9ZuiXez2huDROP+ROduQanegpobEZhBg6TF18FgHzpRW6eEYK1rP+YoA7ch7+v19n6qqAD5Z348wZkYCALJJXLGjw80t3PSQq4czdGCy6gZC8sFOHjnCAC8uU+KOiFdobIsqBac/+1TOQ2xlWlscr1FnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJSEE7F8; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJSEE7F8"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-453426170b6so23817755e9.1;
        Sun, 29 Jun 2025 06:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751202882; x=1751807682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2J/3eXMSb697PQ+JEqiey5lYxVm4mGnisWtAeiEV3Qs=;
        b=kJSEE7F8C7xv1ptToZLMiEhq4qtD9s0B3RcNmKVumZ0SRV924f7HNm0+bcfZCBRmmN
         W0b5ge5BRo53yNIMcDgpsp+miEI4p2O7U08k8ajuzKqhsRizOHx7AEGoxOtD2rDb6Gxa
         LeQcPZ6UIk818VjnMBWGHx8FMdy6P+fiC8CxTNy0XoryeknnC37NXvVTxEfb8FTdAGZX
         wWxsQCfBq2sRLSQBtpKQhC2tWi9miXqLuiDDPEcoC6i+p6F2V/hEvujdwt5/vGH4BIlv
         CwIMrRgtUlJ00iB588TY/CVYRwrOOhiHcbYnXpg7vlpmpf4bYpgdHsikJVrPYOQJ/Kt4
         9HmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751202882; x=1751807682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2J/3eXMSb697PQ+JEqiey5lYxVm4mGnisWtAeiEV3Qs=;
        b=Rhh/6rfKM2rdbnUD2kg4aVy53CePyiUWf6r/y7TxT3JeSBnzz4jGr22PnIFv6vff43
         WHHsDu5hrRSSMit24JJUCl3CUZzs1ImVPAzDLmhl0EtnyI9iTh5cNhjE38HeiG7NCn6q
         2/Ze1fSqHDZnpkjfb7AlMKiMeIinA5/vGwsamOB+LY9sLemddMXQgREMBbJMRu9KAtyw
         CLQjGbVbedqdsqh7C5h1Y8s0XKq1/3bHTByQEZHhiBHWtJVL+T8tDCGk+gXw5fPhu6PO
         EoRy3EBDEkPutThrmgOqrk0+L2dYO1nvJRAfX6Zd+CgqiWvtw214CRTF9NtAcSU4IFra
         awwA==
X-Forwarded-Encrypted: i=1; AJvYcCX35wUkdudTv0D2UqbWXOlwSAKrkqzyggmDBs+JieYYVSJvvIQWw8CDnvQgznIdlLFnm0m0d6QLDitBzNQsKhKvGxIZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxHyV8mKfbb0GtF1NUqXEQzsUxbxELU0R+npSVEBCSJO1QNfXsn
	khSVKZNfTi7+dVfdKhC0SR9hnFayIiSkHxk68xlz2fvtvjbFTajWYuQ6kLakQw==
X-Gm-Gg: ASbGnctrCtpx3wlis99jPthcmTXoHt9zUlCjDn5PcSbswEtNTdovUpI0jpTiUOcxLmg
	1PwbvaamyTxpFCWiR/YKCVX3oIqDAOlgjyGZ0pg+tuoY5/5keNPBEr6sho2Lsr9+RXNvIPT6VFB
	DsRUyUtak/pG2aVhChd/P245PkAA7eU6jsqVHZ2EbzZCDR/2wFuaT7N7ZuTAaQ81CnNYhm+Ma6q
	QdCCiO1gY/PmengT25IAdP/BYz5fr2mKweF56yx0NU4WAvBwg/MKGC5Ibx+9u6uLUm5O/E3t1ML
	clLLLnTahEkMIz9DJ76lUUL3ucKvKUpIzy/jcHTA2WRS7XaipQX2H2f0wZUaQ4k=
X-Google-Smtp-Source: AGHT+IHndDDlKdqKhqnbaBUqXwClIjy0B7MkVd6Kc29Uvp3tBzXCDYqs0KglQ0kQpFKm8BGwKeotig==
X-Received: by 2002:a05:600c:c0c5:b0:450:d3a1:95e2 with SMTP id 5b1f17b1804b1-4538fcf9703mr63842195e9.9.1751202881641;
        Sun, 29 Jun 2025 06:14:41 -0700 (PDT)
Received: from denis-pc ([151.49.78.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406ab6sm106301495e9.30.2025.06.29.06.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 06:14:41 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	mario.limonciello@amd.com,
	"Luke D . Jones" <luke@ljones.dev>
Subject: [PATCH v9 0/8] platform/x86: Add asus-armoury driver
Date: Sun, 29 Jun 2025 15:14:15 +0200
Message-ID: <20250629131423.9013-1-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Luke D. Jones <luke@ljones.dev>

Hi all,

the TL;DR:
1. Introduce new module to contain bios attributes, using fw_attributes_class
2. Deprecate all possible attributes from asus-wmi that were added ad-hoc
3. Remove those in the next LTS cycle

The idea for this originates from a conversation with Mario Limonciello
https://lore.kernel.org/platform-driver-x86/371d4109-a3bb-4c3b-802f-4ec27a945c99@amd.com/

It is without a doubt much cleaner to use, easier to discover, and the
API is well defined as opposed to the random clutter of attributes I had
been placing in the platform sysfs. Given that Derek is also working on a
similar approach to Lenovo in part based on my initial work I'd like to think
that the overall approach is good and may become standardised for these types
of things.

Regarding PPT: it is intended to add support for "custom" platform profile
soon. If it's a blocker for this patch series being accepted I will drop the 
platform-x86-asus-armoury-add-ppt_-and-nv_-tuning.patch and get that done
separately to avoid holding the bulk of the series up. Ideally I would like
to get the safe limits in so users don't fully lose functionality or continue
to be exposed to potential instability from setting too low, or be mislead
in to thinking they can set limits higher than actual limit.

The bulk of the PPT patch is data, the actual functional part is relatively
small and similar to the last version.

Unfortunately I've been rather busy over the months and may not cover
everything in the v7 changelog but I've tried to be as comprehensive as I can.

Regards,
Luke

Changelog:
- v1
  - Initial submission
- v2
  - Too many changes to list, but all concerns raised in previous submission addressed.
  - History: https://lore.kernel.org/platform-driver-x86/20240716051612.64842-1-luke@ljones.dev/
- v3
  - All concerns addressed.
  - History: https://lore.kernel.org/platform-driver-x86/20240806020747.365042-1-luke@ljones.dev/
- v4
  - Use EXPORT_SYMBOL_NS_GPL() for the symbols required in this patch series
  - Add patch for hid-asus due to the use of EXPORT_SYMBOL_NS_GPL()
  - Split the PPT knobs out to a separate patch
  - Split the hd_panel setting out to a new patch
  - Clarify some of APU MEM configuration and convert int to hex
  - Rename deprecated Kconfig option to ASUS_WMI_DEPRECATED_ATTRS
  - Fixup cyclic dependency in Kconfig
- v5
  - deprecate patch: cleanup ``#if`, ``#endif` statements, edit kconfig detail, edit commit msg
  - cleanup ppt* tuning patch
  - proper error handling in module init, plus pr_err()
  - ppt tunables have a notice if there is no match to get defaults
  - better error handling in cpu core handling
    - don't continue if failure
  - use the mutex to gate WMI writes
- V6
  - correctly cleanup/unwind if module init fails
- V7
  - Remove review tags where the code changed significantly
  - Add auto_screen_brightness WMI attribute support
  - Move PPT patch to end
  - Add support min/max PPT values for 36 laptops (and two handhelds)
  - reword commit for "asus-wmi: export symbols used for read/write WMI"
  - asus-armoury: move existing tunings to asus-armoury
    - Correction to license header
    - Remove the (initial) mutex use (added for core count only in that patch)
    - Clarify some doc comments (attr_int_store)
    - Cleanup pr_warn in dgpu/egpu/mux functions
    - Restructure logic in asus_fw_attr_add()
    - Check gpu_mux_dev_id and mini_led_dev_id before remove attrs
  - asus-armoury: add core count control:
    - add mutex to prevent possible concurrent write to the core
      count WMI due to separated bit/little attributes
  - asus-armoury: add ppt_* and nv_* tuning knobs:
    - Move to end of series
    - Refactor to use a table of allowed min/max values to
      ensure safe settings
    - General code cleanup
  - Ensure checkpatch.pl returns clean for all
- V8
  - asus-armoury: move existing tunings to asus-armoury module
    - Further cleanup: https://lore.kernel.org/platform-driver-x86/20250316230724.100165-2-luke@ljones.dev/T/#m72e203f64a5a28c9c21672406b2e9f554a8a8e38
  - asus-armoury: add ppt_* and nv_* tuning knobs
    - Address concerns in https://lore.kernel.org/platform-driver-x86/20250316230724.100165-2-luke@ljones.dev/T/#m77971b5c1e7f018954c16354e623fc06522c5e41
    - Refactor struct asus_armoury_priv to record both AC and DC settings
    - Tidy macros and functions affected by the above to be clearer as a result
    - Move repeated strings such as "ppt_pl1_spl" to #defines
    - Split should_create_tunable_attr() in to two functions to better clarify:
      - is_power_tunable_attr()
      - has_valid_limit()
    - Restructure init_rog_tunables() to initialise AC and DC in a
      way that makes more sense.
    - Ensure that if DC setting table is not available then attributes
      return -ENODEV only if on DC mode.
- V9
  - asus-armoury: move existing tunings to asus-armoury module
    - return -EBUSY when eGPU/dGPU cannot be deactivated
  - asus-armoury: add apu-mem control support
    - discard the WMI presence bit fixing the functionality
  - asus-armoury: add core count control
    - replace mutex lock/unlock with guard
    - move core count alloc for initialization in init_max_cpu_cores()

Luke D. Jones (8):
  platform/x86: asus-wmi: export symbols used for read/write WMI
  platform/x86: asus-armoury: move existing tunings to asus-armoury
    module
  platform/x86: asus-armoury: add panel_hd_mode attribute
  platform/x86: asus-armoury: add apu-mem control support
  platform/x86: asus-armoury: add core count control
  platform/x86: asus-armoury: add screen auto-brightness toggle
  platform/x86: asus-wmi: deprecate bios features
  platform/x86: asus-armoury: add ppt_* and nv_* tuning knobs

 .../ABI/testing/sysfs-platform-asus-wmi       |   17 +
 drivers/platform/x86/Kconfig                  |   23 +
 drivers/platform/x86/Makefile                 |    1 +
 drivers/platform/x86/asus-armoury.c           | 1175 +++++++++++++++
 drivers/platform/x86/asus-armoury.h           | 1278 +++++++++++++++++
 drivers/platform/x86/asus-wmi.c               |  165 ++-
 include/linux/platform_data/x86/asus-wmi.h    |   24 +
 7 files changed, 2651 insertions(+), 32 deletions(-)
 create mode 100644 drivers/platform/x86/asus-armoury.c
 create mode 100644 drivers/platform/x86/asus-armoury.h

-- 
2.50.0

