Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927D63196D8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751471510; cv=none; b=nTiBxBcyTWBXWMxsNy2ZiZBa2XDzjsOU+g2NOEwc0y1Wmiy+YSOoYTfrV4vtb0jPnTApXRC07263ArWKI/S47jRqbfROfQSAxbe9ZU7dC2Gig+KQXwOv6cf6Sldj/Yz7TFIfzPIoGuNiq+paN0XjBc0GiNX91HzqQzVxUbLIr+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751471510; c=relaxed/simple;
	bh=HRKMOxJNCOuE3r7j3FuZwUyOBeo/BiXUxOoqeQ1lCDE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NJPN+j29mosus4N4bsfXkUCNo5FkVn7SXYpmFZ12QSEpSXPvGk2MvRvIf9CTyGN3Dh9EOvlknvCO6y1krOFQhawY8rQ4jSgTNX++9xbyjOkI2qTeydMBcx3AcIj1c5ExiDWNiNgoLYaVzkpHqKNONB5uWyIgiEByoLEAQg+6ViI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=en60+m3v; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="en60+m3v"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-234b9b01a76so5152835ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751471508; x=1752076308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S+/e2xVPy9P/pxcztqgbVVvrefjHlSRtg01yndExOy8=;
        b=en60+m3vG9fkfd4Nk+SXQ5JJebBBOlFwYqdE/Q8TkTCTtGC3P+q0fxK6HP0hLvtXrr
         TdmNpWq0fK/usKaP5iGxlZ4IToHwlLb4eS7Jojh35JOyKT5iGNt2s5kcid3GYr5t7MAv
         mkvFBs5Zk6bcDxrJ7LD6aPlOBBsieidlUJ2avBeo+qAf9+rLhwSoDIkFg+I7o4F8HMdc
         nurYON+pgmwC14pfErQWsNBwK+OzsZ6c9bmehmWXoXlV/HFb1deaNYB1wwAoyqUYFGMn
         cLdZ/ticr8xYjhyd+0XJqKTGqK3T73/gCz4M0Rrc1i2TziVrtKthrTElYXPHr/z6wMFa
         5QoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751471508; x=1752076308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+/e2xVPy9P/pxcztqgbVVvrefjHlSRtg01yndExOy8=;
        b=LAsk4b5HcTptgtIPSCjEi6sZa3TCpHhBHJutae22v4ze2FAnJ60oxpa7yrXZdJCbS6
         8bK0R09x/0eJK3mY1BfEIyp3A4gPdM4tj8ED7T0i1NDph+RylGHYCN1ZbMPU0HQr6Mi6
         V1SIwI4sJchmjfK+XhlT5VXYM1kRAmCvOKxGHYb/Ksf4JA2R8r+z7gNIjb2LSqWAICTg
         cpCvXNRZe4ol08T96bPjZ3f6jP/O6JiRR7ZXT95TB5bkLBsJY7zyujr2QqprWsOqhdAO
         CF0oAeQjmHPbtXokAqCDz1IlLq86I/oMLDoyNwxJEtrgZA0k8op/0JbDV0YGTng2IjJh
         jsMw==
X-Forwarded-Encrypted: i=1; AJvYcCVH+OYa21f44JOw/FAuMevdQ737w+wMZKdbWYq4mDIGHz69+krhDxQCjG/h66IbSfRWffMWuEke7l05btg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwADLEwftqr3DjD3xT2ZdrifamdCDambb+WqyjAsBr1C/6J/ND3
	Bsi9y3zqAsEYyhbZlERrEsc+cUZ6r0tz4nrl0IsGSgVdymKaYgKJEKvXt3sr7Q+vWy0=
X-Gm-Gg: ASbGncvLXm9vHJJb8AY4x4zcY8KeA3o58beBYDXIvR1dU8gGYgJeg2atajDu7GsKYer
	fb5hxXf98g22DIS73tDdqjjJcCPAuIPC3wb2snNSirO6d99B2jS6Q6AHBaQxak0g4khv6jRkE1o
	ABd9xkk7BL9nr01mKbaK6NBrimgsT5DDc7bx5VoMzVcPqiMes+wdVy6zhjvOF5s0fJBOcNI+NcO
	xkptrTy7WgsMxWuYYQAYELxKxQil4wqmVLTS6sBdhxrQqsM6XdL9pEcgfl7iKwwDcR3uNPLPRdk
	jHu/bw+0Woy1s2qkhkPmapOSWHAyzb8Veak0IxbO/q7hAYyRfbcVBhXdrkqtVWFmG9u4+ti3GqY
	7PMiBvpvSGfEX1w==
X-Google-Smtp-Source: AGHT+IFoDO0mmRvgytWxdK4jwDaUjKuojvRPscp53C4f16cMljsF2WfNspX6xf949JDptok6KJLuzw==
X-Received: by 2002:a17:902:ccd2:b0:234:11cb:6f95 with SMTP id d9443c01a7336-23c6e4aff58mr19686985ad.6.1751471507750;
        Wed, 02 Jul 2025 08:51:47 -0700 (PDT)
Received: from JC4TPG1F9W.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f32a3sm130952795ad.87.2025.07.02.08.51.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 02 Jul 2025 08:51:47 -0700 (PDT)
From: Shuan He <heshuan@bytedance.com>
To: bhelgaas@google.com,
	cuiyunhui@bytedance.com
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	heshuan@bytedance.com,
	sunilvl@ventanamicro.com
Subject: [RFC 0/1] PCI: Fix pci devices double register WARNING in the kernel starting process
Date: Wed,  2 Jul 2025 23:51:11 +0800
Message-Id: <20250702155112.40124-1-heshuan@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All.
I encountered a WARNING printed out during the kernel starting process
on my developing environment.
(with RISC-V arch, 6.12 kernel, and Debian 13 OS).

WARN Trace:
[    0.518993] proc_dir_entry '000c:00/00.0' already registered
[    0.519187] WARNING: CPU: 2 PID: 179 at fs/proc/generic.c:375 proc_register+0xf6/0x180
[    0.519214] [<ffffffff804055a6>] proc_register+0xf6/0x180
[    0.519217] [<ffffffff80405a9e>] proc_create_data+0x3e/0x60
[    0.519220] [<ffffffff80616e44>] pci_proc_attach_device+0x74/0x130
[    0.509991] [<ffffffff805f1af2>] pci_bus_add_device+0x42/0x100
[    0.509997] [<ffffffff805f1c76>] pci_bus_add_devices+0xc6/0x110
[    0.519230] [<ffffffff8066763c>] acpi_pci_root_add+0x54c/0x810
[    0.519233] [<ffffffff8065d206>] acpi_bus_attach+0x196/0x2f0
[    0.519234] [<ffffffff8065d390>] acpi_scan_clear_dep_fn+0x30/0x70
[    0.519236] [<ffffffff800468fa>] process_one_work+0x19a/0x390
[    0.519239] [<ffffffff80047a6e>] worker_thread+0x2be/0x420
[    0.519241] [<ffffffff80050dc4>] kthread+0xc4/0xf0
[    0.519243] [<ffffffff80ad6ad2>] ret_from_fork+0xe/0x1c

After digging into this issue a little bit, I find the double-register
of PCIe devices occurs in the following logic:

Early:
static int __init pci_proc_init(void)
{
...
    for_each_pci_dev(dev)
        pci_proc_attach_device(dev);
        //000c:00:00.0 will be registered here for the first time (succeeded).
...
}

Later:
acpi_pci_root_add
-> pci_bus_add_devices
  -> pci_bus_add_device
    -> pci_proc_attach_device
    //try to register 000c:00:00.0 here for the second time
      (failed and triggered the WARNING trace);

I tried to add two more steps in the pci_proc_init function
(shown in the attached patch).
1st is to prevent the concurrent issue by holding the
pci_rescan_remove_lock.
2nd is to correctly update the device's status after
it's been successfully registered (by adding the
PCI_DEV_ADDED bit to the device's flag).

Then the WARNING disappeared and the system worked well. 

I understand that the device_initcall(pci_proc_init) function
stays there already for 20 years (time of the initiliaztion of
repo), and it hasn't really changed since then.
So I wonder if my patch is the RIGHT way to fix this WARNING issue?
I am not positive about this. :(

Any suggestions?

As a beginner Linux programmer, I am not sure whether I have included
all related reviews/maintainers in my email list, but sincerely seeking
your help and any comments are very welcome.

Warmly regards,
Shuan

Shuan He (1):
  PCI: Fix pci devices double register WARN in the kernel starting
    process

 drivers/pci/proc.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

-- 
2.39.5 (Apple Git-154)

