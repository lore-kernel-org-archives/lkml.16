Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3141A3145
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738953638; cv=none; b=r4M/Sje2GtZ0GLoCuzhR/sk9PIequEft3FC2Ye1hxFsf6/tRv4VKgfyIBAJ+ya2QYgf5vD8YlzXc/GHxQA3mUuptFQLdml58vgC72GbR5KfV5MmJOZ+K/lpVp+qNSBsf6WGModqyELQBf/lO4NvMe7EE3fjeFJHIZSnNwmAnHjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738953638; c=relaxed/simple;
	bh=VTB46/0sISArTiJeOu2Tixa/98RJnTC76varRmbdaas=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=cdzXvpc7prZTJ5hYhqYSQcxHMdF5oXFjiP9H9x9d2tawABmDOhr7m05bpBMB56ocGUJMnsmS9H64KGt0ZML5jg+bOdfrS2cPZYF+PVZDWOjmsYcTRxBncbgMlWnEzeQDhZSWhQO3N6ZIupWcchrCbh5gGyCUPgasbammGnUXfOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=UGaLwyll; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="UGaLwyll"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaeec07b705so409841266b.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 10:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1738953634; x=1739558434; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N7UQx8ofkruRoZGyQgvBGKJ0B34UHRuZDuLQLSOhp+8=;
        b=UGaLwyllS3RYgF7GlJqtZpADDjAzz6fXVi23LCOUAm9AB/FHS6mocnV/f1bnGRVcm9
         LHacHX4I+1wd8zs0VrS3flu+TSjyJql5KFG4bT5+jSRJX/tZxHcUusUvspASp+5eh5kn
         bb5lftu0mq63IyKjlvLnjqs454kA+DHE18UeEzwFWJC1Ijqpka1WtuhmBwyg0JXHJndt
         ZAGgKTFQ6cFtBhwn+nN5JuLzKUe7Zu9a1llxDMEqKalRUdRMqCcm9bqkVpzGzmHi7xWE
         SGebAroR57ksJtaibV2nXUwU7mMjNsIaBHh48HsqEXYhxfrJCpCTefPdDv23GNuwshLv
         wckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738953634; x=1739558434;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N7UQx8ofkruRoZGyQgvBGKJ0B34UHRuZDuLQLSOhp+8=;
        b=pb+1TOt6P5mE9LZfP8OKB92OfL62PZbgISNxGM97BOzbNLOMwcmcvfpDFRWqLcsCV2
         Wpd/GMIxzKwPyEVfTo/ByJgzctfrouDneEtyJ6jYvYYL1KG8Ey1Cki+LBcFVIn0MPAph
         /HApA8ys3QaXz30U4ib+eQmUdaj4z7X6wikd76Lrbo6mQc/NWZH5VJy35AcALhrPwp0e
         cbLW9dWRsJ21Iq4HiYlqWx1hOlM012h4XeNAafcWxinEIZL/5wRI6fRlxyn44nqYhQEA
         gPKsP8x5cH7JbM4CRJo/tgZzTxXv/7PJwqSlevHFtsPbXO6oSIGfUYpcMpu27ZhmDp9o
         11xw==
X-Forwarded-Encrypted: i=1; AJvYcCX1xQbhm1IRhDZpKqZyUXMsdvcGCg5G+Is5lkg+JCFDKLVE9qy+l2bX30eTnDh+vlyjklAWsnUrn4mWfwU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7IXicbSWSxrd/i4j1i7mco+NdERu4TtiNmbYu3fpOAntmRQ6A
	JXMQ1Cl6W0uBMHm+IR+63Xs3BlUbgW2oRChq2Tyzmqx8uo6fzXgPyoEvjKREt21s1AI8uiR74Ej
	GSrkJu4+Qx2tYSosks1sSFvBs6WVKDWOoBgq0DpfqtfXdcefzACxcfQ==
X-Gm-Gg: ASbGncutGyBSyBD3G+6/4T+/nuJw4eFWD4xSdc9IL9c3PdyDwxPoVG+x1O8Tasfgs6Z
	IWqbypcAxcsdMSnNi67vn+hlDmXgYGP58a03XAjowkGNK0NGdl4xJnXZWDZgbq/z9PspbhH7PWY
	PE06/BvB/ECKclFjTDbygl9pocjw==
X-Google-Smtp-Source: AGHT+IF+rdiRwpjE2SYvjnMVb7c5EyeDPHUuoHbmLbCjryYQnZ3NOp27ohv8g5IHTGnjgTTuzlsBWDMzy/gISWA1Nnw=
X-Received: by 2002:a17:906:ef0d:b0:ab3:4b0c:ea44 with SMTP id
 a640c23a62f3a-ab789a67db2mr496614966b.9.1738953633765; Fri, 07 Feb 2025
 10:40:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Max Kellermann <max.kellermann@ionos.com>
Date: Fri, 7 Feb 2025 19:40:23 +0100
X-Gm-Features: AWEUYZkCyX8DjjF12TNsjDfa6XpP_u6-S4Qa_aFIAHNlLhxJKVB5hDN6wSQeBYU
Message-ID: <CAKPOu+_4mUwYgQtRTbXCmi+-k3PGvLysnPadkmHOyB7Gz0iSMA@mail.gmail.com>
Subject: "netfs: Can't donate prior to front"
To: David Howells <dhowells@redhat.com>, netfs@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, linux-nfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

the following crash occurs with 6.13.1 on our servers every 20 minutes or so:

 netfs: Can't donate prior to front
 R=00070d30[3] s=9a000-9bfff 0/2000/2000
 folio: 98000-9bfff
 donated: prev=0 next=0
 s=9a000 av=2000 part=2000
 ------------[ cut here ]------------
 kernel BUG at fs/netfs/read_collect.c:315!
 Oops: invalid opcode: 0000 [#1] SMP PTI
 CPU: 7 UID: 0 PID: 0 Comm: swapper/7 Not tainted 6.13.1-cm4all2-hp #416
 Hardware name: HP ProLiant DL380 Gen9/ProLiant DL380 Gen9, BIOS P89 11/23/2021
 RIP: 0010:netfs_consume_read_data.isra.0+0xa72/0xab0
 Code: 48 89 ea 31 f6 48 c7 c7 bb 7a d0 ae e8 b7 d2 d1 ff 48 8b 4c 24
20 4c 89 e2 48 c7 c7 d7 7a d0 ae 48 8b 74 24 18 e8 9e d2 d1 ff <0f> 0b
4c 89 ef 48 89 54 24 10 4c 89 44 24 08 e8 1a 4e b5 00 48 c7
 RSP: 0018:ffffb434cc448db0 EFLAGS: 00010246
 RAX: 0000000000000019 RBX: ffff8fa63d9cbec0 RCX: 0000000000000027
 RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff8fbb1f9db840
 RBP: 0000000000000000 R08: 00000000ffffbfff R09: 0000000000000001
 R10: 0000000000000003 R11: ffff8fd31f6a0000 R12: 0000000000002000
 R13: ffff8fa5350aaee8 R14: 0000000000004000 R15: ffff8fa5350aaee8
 FS:  0000000000000000(0000) GS:ffff8fbb1f9c0000(0000) knlGS:0000000000000000
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 00007f9c5000ef48 CR3: 0000000bcee2e001 CR4: 00000000001706f0
 Call Trace:
  <IRQ>
  ? die+0x32/0x80
  ? do_trap+0xd8/0x100
  ? do_error_trap+0x65/0x80
  ? netfs_consume_read_data.isra.0+0xa72/0xab0
  ? exc_invalid_op+0x4c/0x60
  ? netfs_consume_read_data.isra.0+0xa72/0xab0
  ? asm_exc_invalid_op+0x16/0x20
  ? netfs_consume_read_data.isra.0+0xa72/0xab0
  ? __pfx_cachefiles_read_complete+0x10/0x10
  netfs_read_subreq_terminated+0x22d/0x370
  cachefiles_read_complete+0x48/0xf0
  iomap_dio_bio_end_io+0x125/0x160
  blk_update_request+0xea/0x3e0
  scsi_end_request+0x27/0x190
  scsi_io_completion+0x43/0x6c0
  blk_complete_reqs+0x40/0x50
  handle_softirqs+0xd1/0x280
  irq_exit_rcu+0x91/0xb0
  common_interrupt+0x79/0xa0
  </IRQ>
  <TASK>
  asm_common_interrupt+0x22/0x40
 RIP: 0010:cpuidle_enter_state+0xba/0x3b0
 Code: 00 e8 ea 86 1c ff e8 45 f7 ff ff 8b 53 04 49 89 c5 0f 1f 44 00
00 31 ff e8 73 b9 1b ff 45 84 ff 0f 85 f8 01 00 00 fb 45 85 f6 <0f> 88
46 01 00 00 48 8b 04 24 49 63 ce 48 6b d1 68 49 29 c5 48 89
 RSP: 0018:ffffb434c018be98 EFLAGS: 00000202
 RAX: ffff8fbb1f9c0000 RBX: ffffd41cbe7e3448 RCX: 000000000000001f
 RDX: 0000000000000007 RSI: 000000003149acb2 RDI: 0000000000000000
 RBP: 0000000000000004 R08: 0000000000000002 R09: 0000000000000000
 R10: 0000000000000004 R11: 000000000000001f R12: ffffffffaf660060
 R13: 0000030f6179fa73 R14: 0000000000000004 R15: 0000000000000000
  ? cpuidle_enter_state+0xad/0x3b0
  cpuidle_enter+0x29/0x40
  do_idle+0x19c/0x200
  cpu_startup_entry+0x25/0x30
  start_secondary+0xf3/0x100
  common_startup_64+0x13e/0x148
  </TASK>
 Modules linked in:
 ---[ end trace 0000000000000000 ]---

This is a server with heavy NFS traffic (with fscache enabled).

Please help - and let me know if you need more information.

Max
