Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE062AE99
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 06:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751524562; cv=none; b=YnXGmAck/FDgjltXAqpR5sK2WPU+vD79zWmyXPrci/rDossjpd76Kdh3oBTNZS5rqM4LGKvC80yy5i5uL46aRKSDmYt3eCXKzR5Z54HSn4iH/dxUSLvTVb2oBYmkbWD2RDQBAaA/Ksqr0amkNyD9iuskCGXId+4sErXh6tLodEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751524562; c=relaxed/simple;
	bh=YTVVnVJ6PdWC/AKl489gZ/2Sl6Au8Ca1tG/ODoK6oOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHI/L48pPjZlz/bgX/TgYsDUupsQyhmMHOf+sbiZ+2Ba23Ti35D9H1xg2GALD4nw8icB0b/1CphBNe5KusqTeycND+DAcra0YtzWRfMPY+S63sBt/D8ldEh5QAb01DZXgsBSfS6Ig/8aBcIL6Mxgyyd3EyNUrOX+uAecNXq5hZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=aaoehm5M; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="aaoehm5M"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-234d3261631so55380515ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 23:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751524560; x=1752129360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QIKd4XyqKz0WFU05jsmNNatyFr3GWpnfNcV6WEt42xQ=;
        b=aaoehm5MJbBnlpjv9TaIa4TtSQnEdpiCcbI9jpOm/5BZQdWSofSDMXiURwceOFu3bl
         SqcbOPXY55pqqA6akly7udwdEjsVf+o5oFKcxs7QWjNIxeEFl2wCFjiPg9F/b/gIA9BQ
         5otTV4xzaUaNeCR6bqZntfnPn4Muxg7WgV2uGn0iS1JklOvSxmuYZqBpNSNLH5QmI7mX
         itnq4R0nBW3TTv58Zh8uEgoCRg263PTXXGk2lIFDrRGCWZo7qsfVH74MwmeqXKNTyElU
         0BnQiDXWVOLMpLAEHQrFJHAogCh2sAOvOX2kXl5/9esgUTpjEsEZm27vqodouyMVusVS
         b8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751524560; x=1752129360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIKd4XyqKz0WFU05jsmNNatyFr3GWpnfNcV6WEt42xQ=;
        b=TwjP2Qnx6LBZrfDvKbKMYhckpBBOO8rKF9ph6V3iPa1phQ9VImf3a/rBrjeQXasWW0
         /3+qHGkSt6qgZUnkZm8yTP2NF3KXjlzAu/pjQ7a8WoAGUj0v6deJTbIS7AIex7Lo1bK2
         i2tC5q38t8QOrMT4C0CYiZePiLg7eJZaUmM9W8tALnHJ3T8FaBnBjZhvM0eSdd/ddHNq
         xTZ39Wtva+fljfsVtYbHClxFdkeglOic5HWcUBe2JBNnC1bL3MD3ZuF40mAGVnne39Lq
         CENZ6tQSxmJR4VfB3atem64R3I6efZO7uopBJRkP9gtFX6tgFSB4OuCZBIn6Ziz94WiT
         MYgA==
X-Forwarded-Encrypted: i=1; AJvYcCW/hduiBN3DcHjUWDLh9wDX0b7MNTkwdq34x7je0EFItl6mmsEZt0tXkssEh12/enairx53rEgf7r8IF10=@vger.kernel.org
X-Gm-Message-State: AOJu0YysgXkhrcXystLWeW/GXz+CwgMTvJ+5mXsNiGwVTsihxUGbJ2mH
	S5u5UHLjRu2bbtEvPpCjLfyZ0UoFli+tL/w4x7k996tb6DDoUh1/lwoFQl9QjYvYUxI=
X-Gm-Gg: ASbGncu1MyoIBYc49W1uJt0PeHRy2rwrpWrIpem09pFRVdBTvl2U3p1lqzkrJ8OsNsk
	xvK0BsQalS8lAVaeu/9KlwRH5MO31DllXhqx7tjOIaUDMpHlnfPpIV5TlKFp4v0QK1a8lF/PqWZ
	Ewd3I81NyLsoR9jrXypqs+/bSHBzjHZ9gqaSWML+J1CjJOw/FkJZEDDTiixEAeUpJL+ixB4naTS
	exwQdApQYq+XdZp9nYhx+7MGASiBcnfhmJMcxbNlJ+O6mcPX4iTVVlZJdt45+yoc0vTPezVY5ix
	L8NNIq0RP+iyE8RmizSpx+RYH1j6tugag4p2du35OWeymaqukZlJ5fZCe5X37KPGgmPjfQ==
X-Google-Smtp-Source: AGHT+IFVznHzewXkRwXl+jlpU+/jlWH9G3uXJOnEyYhJffoLUHYr+wecCaP0uvRb31laWEgyZwnmrw==
X-Received: by 2002:a17:902:da91:b0:234:bfcb:5c21 with SMTP id d9443c01a7336-23c797b28efmr33182915ad.19.1751524559978;
        Wed, 02 Jul 2025 23:35:59 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3ba5bdsm139341455ad.186.2025.07.02.23.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 23:35:59 -0700 (PDT)
Date: Thu, 3 Jul 2025 12:05:51 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Shuan He <heshuan@bytedance.com>
Cc: bhelgaas@google.com, cuiyunhui@bytedance.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC 0/1] PCI: Fix pci devices double register WARNING in the
 kernel starting process
Message-ID: <aGYkx4a4eJUJorYp@sunil-laptop>
References: <20250702155112.40124-1-heshuan@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702155112.40124-1-heshuan@bytedance.com>

On Wed, Jul 02, 2025 at 11:51:11PM +0800, Shuan He wrote:
> Hi All.
> I encountered a WARNING printed out during the kernel starting process
> on my developing environment.
> (with RISC-V arch, 6.12 kernel, and Debian 13 OS).
> 
> WARN Trace:
> [    0.518993] proc_dir_entry '000c:00/00.0' already registered
> [    0.519187] WARNING: CPU: 2 PID: 179 at fs/proc/generic.c:375 proc_register+0xf6/0x180
> [    0.519214] [<ffffffff804055a6>] proc_register+0xf6/0x180
> [    0.519217] [<ffffffff80405a9e>] proc_create_data+0x3e/0x60
> [    0.519220] [<ffffffff80616e44>] pci_proc_attach_device+0x74/0x130
> [    0.509991] [<ffffffff805f1af2>] pci_bus_add_device+0x42/0x100
> [    0.509997] [<ffffffff805f1c76>] pci_bus_add_devices+0xc6/0x110
> [    0.519230] [<ffffffff8066763c>] acpi_pci_root_add+0x54c/0x810
> [    0.519233] [<ffffffff8065d206>] acpi_bus_attach+0x196/0x2f0
> [    0.519234] [<ffffffff8065d390>] acpi_scan_clear_dep_fn+0x30/0x70
> [    0.519236] [<ffffffff800468fa>] process_one_work+0x19a/0x390
> [    0.519239] [<ffffffff80047a6e>] worker_thread+0x2be/0x420
> [    0.519241] [<ffffffff80050dc4>] kthread+0xc4/0xf0
> [    0.519243] [<ffffffff80ad6ad2>] ret_from_fork+0xe/0x1c
> 
This should not happen. I suspect some issue in ACPI namespace/_PRT. Can
you reproduce this on qemu virt machine?

Regards
Sunil

