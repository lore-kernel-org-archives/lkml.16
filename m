Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C4821147D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 21:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749072048; cv=none; b=QUG8NghSCH8h9n958mCAHjB3g4ueZsUAq749LOa1zFUOu3ARvYJVQighT+T9ns1HrA+yiC6OfGciw3qUB8bBXUxtK7GEjqaZmcYDSyXJBillUjMWWmok0YBc05QkXreILIUzaPkxB1oUji/ksteVm1N4vam5j9+YkXHTUcOyzos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749072048; c=relaxed/simple;
	bh=+/sFF7UUkjVRwePZ93zUTXlTfs8VqB5xPpbl91ZZerE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=k1UTPtyKlTdQ9sQVU6DD34GWe+T+DGr6YH5Av+3oQ+clgVLK/34X8sgqDNgekC1NLzDMd2ZGCqihXXXH7n1U2xavzkpVqlrbkVDnwqZYkM3b05VrGflaJ19XeNKevLLRcHnPo/VkCth9Bmzv9mK7LlRs2bjEUxyOLrFSLuv0qkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgYvi+23; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgYvi+23"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5532a30ac41so317157e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 14:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749072043; x=1749676843; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y90zevijk7xVMPG4OZ2AlSvhyKgAsEHSVc3Ynv+uEPQ=;
        b=WgYvi+23B0dML9vFmOshoh/NpPdegbpw1/oeHTcChUlWa3eTiZuBECdxDzFoiuJQD+
         Phmp+uE0u8kbJF0P7U+9BLwrsuUJ+ZLq1/pDjvA2onnFj6zX9q5kkeYZemSA5tUp5cUd
         njtTwLPiJhWpnkB30b7SnWsl6U6WJ4cnFBDZCGXmHEQmFCPWbY+on3Bkk8bIvU8DlL0g
         VqxW0JGcB9lhXq55MFr8z2zzhKJfTaWgZi6rCcQtnnhcP2sIOvATIkBe9giXVbURVR7x
         ubGIOYTQnMSmWyGlCN6+NTYogzH2nQHvrheyfSeN6Qk1tDTUiN0aRJe1ZIv/Hf0d3VkH
         t9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749072043; x=1749676843;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y90zevijk7xVMPG4OZ2AlSvhyKgAsEHSVc3Ynv+uEPQ=;
        b=ayut7jbKJu6Fw/1gB8Uzu05DJF42uvxsQeoPicB75njKE1jBiq2TeTsvL0tcoy+grl
         O2ek4pvIWean+iprC0U/V1WvM932mCO0RU8joaSywaaSiZS1AhJcO0k0pp3uHMcl3aRu
         VRyjyuNCDn5+x/AZg21vQTJIuIGWuxIDWMIntyF+wwUJWbuOLgBdeAn4U5yR91su80ul
         SaQQL9n2TGLRQbK/DMlvrbHs+6Y1J9p+cr7yPDlFMWVy7YKy4zDSwspF19s3T0IiJ4h5
         VmysBsgOxVBec+ZMVTe/TJ+Ejt8oWuvOM4VPGSZXAZCeCNBla8NqLC2CqFduA0BXesLt
         Zo9w==
X-Gm-Message-State: AOJu0Yzodsm6m02EVMsAP+uc05eIiz5onQH/Yvg3mb4Lbvj2fg1Oiy2a
	gNxY4akQiDrJzx+CIabFt1UsWZ35pj5SZ0b4x+CZWeBRC02w/HNfoDJRj3VzgaaNWQOdRzUFtDw
	UPHPwrvVoWk199ivthP0cgy53h6l6QY1TyQ3h
X-Gm-Gg: ASbGncsj8lrEBpt6snA1D7Eoj9FCT8v8VyvkdSmts4ztg9t31KObw4JG+PvI+PUvDJu
	XF//jhNaaNZl3goNNRFm8r2XaXkDl4QWUVVYC6PV5R6T7CFo11HymjDjDvJxvcYSjRKasi8uRKU
	7lBP4wpi8kGhnl8IpdyhZJXCYE8alJB+zS64MpSKoL3g==
X-Google-Smtp-Source: AGHT+IEb+Pblj22bjexHKXP7iykBDdb+VUkNblzj0eWDUe2YmKjlQOP67Nc01jOL1RguvtrvcMA5Cj3lNQOFFJ5awME=
X-Received: by 2002:a2e:ae0b:0:b0:32a:648e:7ede with SMTP id
 38308e7fff4ca-32ac7966c6cmr9831881fa.22.1749072043278; Wed, 04 Jun 2025
 14:20:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Alex Davis <alex47794@gmail.com>
Date: Wed, 4 Jun 2025 17:20:31 -0400
X-Gm-Features: AX0GCFvLRUrct0Mmk1aEa0eiF_VFFLbImrsNI0PqaTn8h3XyFsIn9tV2FtQxAik
Message-ID: <CADiockAtCnLdN1rWTRuMeyuQisAWRyosG_K64AQSdVr-k7CLug@mail.gmail.com>
Subject: Latest kernel firmware update breaks intel wifi card.
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I have the following card:
2f:00.0 Network controller: Intel Corporation Wi-Fi 7(802.11be)
AX1775*/AX1790*/BE20*/BE401/BE1750* 2x2 (rev 1a)
    Subsystem: Intel Corporation BE200 320MHz [Gale Peak]
    Flags: bus master, fast devsel, latency 0, IRQ 19, IOMMU group 16
    Memory at aa800000 (64-bit, non-prefetchable) [size=16K]
    Capabilities: [40] Power Management version 3
    Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
    Capabilities: [70] Express Endpoint, IntMsgNum 0
    Capabilities: [b0] MSI-X: Enable+ Count=32 Masked-
    Capabilities: [100] Advanced Error Reporting
    Capabilities: [148] Secondary PCI Express
    Capabilities: [158] Physical Layer 16.0 GT/s <?>
    Capabilities: [17c] Lane Margining at the Receiver
    Capabilities: [188] Latency Tolerance Reporting
    Capabilities: [190] L1 PM Substates
    Capabilities: [1a0] Vendor Specific Information: ID=0002 Rev=4 Len=100 <?>
    Capabilities: [2a0] Data Link Feature <?>
    Capabilities: [2ac] Precision Time Measurement
    Capabilities: [2b8] Vendor Specific Information: ID=0003 Rev=1 Len=054 <?>
    Capabilities: [500] Vendor Specific Information: ID=0023 Rev=1 Len=010 <?>
    Kernel driver in use: iwlwifi

With the current firmware, I get the following error in dmesg:
iwlwifi 0000:2f:00.0: Detected crf-id 0x2001910, cnv-id 0x2001910 wfpm
id 0x80000000
iwlwifi 0000:2f:00.0: PCI dev 272b/00f4, rev=0x472, rfid=0x112200
iwlwifi 0000:2f:00.0: Detected Intel(R) Wi-Fi 7 BE200 320MHz
iwlwifi 0000:2f:00.0: Direct firmware load for
iwlwifi-gl-c0-fm-c0-93.ucode failed with error -2
iwlwifi 0000:2f:00.0: TLV_FW_FSEQ_VERSION: FSEQ Version: 0.182.4.1
iwlwifi 0000:2f:00.0: loaded firmware version 92.67ce4588.0
gl-c0-fm-c0-92.ucode op_mode iwlmvm
iwlwifi 0000:2f:00.0: Detected RF FM, rfid=0x112200
iwlwifi 0000:2f:00.0: loaded PNVM version 71864399
iwlwifi 0000:2f:00.0: Microcode SW error detected. Restarting 0x0.
iwlwifi 0000:2f:00.0: Start IWL Error Log Dump:
iwlwifi 0000:2f:00.0: Transport status: 0x0000004A, valid: 6
iwlwifi 0000:2f:00.0: Loaded firmware version: 92.67ce4588.0
gl-c0-fm-c0-92.ucode
iwlwifi 0000:2f:00.0: 0x00000071 | NMI_INTERRUPT_UMAC_FATAL
iwlwifi 0000:2f:00.0: 0x000002F0 | trm_hw_status0
iwlwifi 0000:2f:00.0: 0x00000000 | trm_hw_status1
iwlwifi 0000:2f:00.0: 0x002C43D6 | branchlink2
iwlwifi 0000:2f:00.0: 0x002B89BE | interruptlink1
iwlwifi 0000:2f:00.0: 0x002B89BE | interruptlink2
iwlwifi 0000:2f:00.0: 0x00015ADA | data1
iwlwifi 0000:2f:00.0: 0x00000010 | data2
iwlwifi 0000:2f:00.0: 0x00000000 | data3
iwlwifi 0000:2f:00.0: 0x00000000 | beacon time
iwlwifi 0000:2f:00.0: 0x0001A67A | tsf low
iwlwifi 0000:2f:00.0: 0x00000000 | tsf hi
iwlwifi 0000:2f:00.0: 0x00000000 | time gp1
iwlwifi 0000:2f:00.0: 0x00046F7B | time gp2
iwlwifi 0000:2f:00.0: 0x00000001 | uCode revision type
iwlwifi 0000:2f:00.0: 0x0000005C | uCode version major
iwlwifi 0000:2f:00.0: 0x67CE4588 | uCode version minor
iwlwifi 0000:2f:00.0: 0x00000472 | hw version
iwlwifi 0000:2f:00.0: 0x58C80002 | board version
iwlwifi 0000:2f:00.0: 0x800CFD1B | hcmd
iwlwifi 0000:2f:00.0: 0x00020000 | isr0
iwlwifi 0000:2f:00.0: 0x20000000 | isr1
iwlwifi 0000:2f:00.0: 0x48F00002 | isr2
iwlwifi 0000:2f:00.0: 0x00C0001C | isr3
iwlwifi 0000:2f:00.0: 0x02000000 | isr4
iwlwifi 0000:2f:00.0: 0x00000000 | last cmd Id
iwlwifi 0000:2f:00.0: 0x00015ADA | wait_event
iwlwifi 0000:2f:00.0: 0x10000004 | l2p_control
iwlwifi 0000:2f:00.0: 0x00000000 | l2p_duration
iwlwifi 0000:2f:00.0: 0x00000000 | l2p_mhvalid
iwlwifi 0000:2f:00.0: 0x00000000 | l2p_addr_match
iwlwifi 0000:2f:00.0: 0x0000000B | lmpm_pmg_sel
iwlwifi 0000:2f:00.0: 0x00000000 | timestamp
iwlwifi 0000:2f:00.0: 0x00000024 | flow_handler

When I use the file iwlwifi-gl-c0-fm-c0.pnvm from the previous
version, it works. I'm running kernel 6.12.30 in Slackware current
