Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com [209.85.219.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F991EA7EC
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 05:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747631961; cv=none; b=mXWtJQP0f1/psI2r/z0xAjhCjyIOj89XHIogGBW2ef1vr7zN6wdaNHNuD/dJbevw+Gnr9AT0Ym6XAL6Z9++WmpJXJTXgSNZg6KsW67pJy9bRUGQFNEHn+zsEgmPOsQWnTbZ+vkDZe53CnKXIt+DhhIJmQYcvThrmpKBATZZo7L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747631961; c=relaxed/simple;
	bh=Mzp2y9qZnoJFTRXdo2PmXje+XJzl1PCZcCPOk7FGWCI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ixaDVg3jNzPQ4HeCyXAL8qYLosOpuBYwwue8YIMjFGyG8PPULUZy+oUoy8QPzCS1jCNQDJfotQJfk2KQzGKf2oO0UTAzN9CV8NzixKWLTCJy1wimtIcs/LXAwRx30F9vjzu2OnDOb7zJze4V5mpgkDQIaGgt0vY2HMvXNAnXA9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMdaDt9b; arc=none smtp.client-ip=209.85.219.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMdaDt9b"
Received: by mail-yb1-f194.google.com with SMTP id 3f1490d57ef6-e7c5d4709caso431292276.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 22:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747631955; x=1748236755; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Mzp2y9qZnoJFTRXdo2PmXje+XJzl1PCZcCPOk7FGWCI=;
        b=RMdaDt9bEZm3X472hbH0bGmIWm2nmj/nfSC2RZb6bvl9kF8adGw7VYzfh8+jNV9kcP
         u/vfdIDkMBwgzS1YQr3qA9ZIc21wbtaWPe7BvvYLjGziCgd7llSpzFW8JWPET8/b2Tje
         tIc2fbdAeukEFA8MZiHewfycqGoLrghUgwgXJpvA7PZh2dtqqcKu3zn4DlV0FF2Q4q7c
         pTKJzUwmbkFRVLAJ4SvMheQBRkhGtsUDkhs8JRPSK4YxQpAKhjfiiAJTiB7K+o32C7YG
         9iZfVXudZHlT1y1/KnMMixLA+pVLuQMXW5SdfxeF0Shb00VHhUPI3sVrOtCqAy/AmKEF
         huMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747631955; x=1748236755;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mzp2y9qZnoJFTRXdo2PmXje+XJzl1PCZcCPOk7FGWCI=;
        b=TTHrUJRPgxKQz5IcnBGUQPwOTxf3S921Q2aUBdAsNqcdQoohmRc3NyMz7bB8rD+HTM
         UpWkkrWq7OZZyy5Sj/dYaedE4vsIT8b1iGvj0AXTy4X9AvaRExV+vEdb22LPR5VfcgN9
         WDdny0gz2W7YmwsB064CGCH5tyWvn8BT3gkMQB4QNum23Z8JI03kPVMX7D8dmEuXLCJk
         4A2G/SCZByNK8XMeKR9hIGozdrnFWDnpam+TIKMl/C17E/u5VbdmZPtTylWyzbnQ5qGy
         +mGfrdyRn4Ust+0BFh5V/fMravsfJ/zPEEr0jcYM/X7BKmI6av7+69AbP528chirpnot
         KXIw==
X-Forwarded-Encrypted: i=1; AJvYcCV7xLIy3PqpLzgXpAfwKtRnXLRzR+jF9ENfdHzJd58uBD0Qvwqt3gwYBpsVHDU5v16pNpQ79zFfDkC/q/M=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywej1aKnJbKxjAlsZY3ox5BD4xMIVrePokev3sgLpsdZdaiIEnp
	o38wqeJ19N5rtyyuACQN5bFOpYOsSZDd6l7T0EfXU5SvyvQir+qmXddmzngKNqMjWDf8KaCHYSk
	ss+aVHdZctP3pt7wyiDo3lhDIiCfrvOI=
X-Gm-Gg: ASbGncvDEB/VGHuvvpMH8qS9ccndXecOQf2yhNf6itYbTpveU1nMhScJY6Wv3vYmtLO
	7JLWOBlVNdEhFVL4cr9c+rudOzx5HkOBzi2akq6mczDiCUwk7QFor5tbcUDDCAb2f5SM2QbxbGu
	k6x8rfpy8OJ6PwsND0Geyf9IkCCmAxQcmg8w==
X-Google-Smtp-Source: AGHT+IH/joJxBYqiRTH/uPR8cDT+aXxnniJ5h4EoMihnIcBb0JEcFuRXT98gVJWfCnX7KaO8+W21sFg0GhxHsePNmQQ=
X-Received: by 2002:a05:6902:2b86:b0:e72:bb4d:80d9 with SMTP id
 3f1490d57ef6-e7b6d32d2abmr14413984276.3.1747631955432; Sun, 18 May 2025
 22:19:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Guoyu Yin <y04609127@gmail.com>
Date: Mon, 19 May 2025 13:19:04 +0800
X-Gm-Features: AX0GCFuD6t2dmAz79LzViKtIGCDV9jMsDTBJ9pE1zjqD8zFQ9OEemW_a9IGd0Go
Message-ID: <CAJNGr6v1GL=ZzgGar7NCjCGVBaAO7YVYU7bBhUt3T4T-DAnUAw@mail.gmail.com>
Subject: [BUG] RCU Detected Stall in sys_process_vm_writev
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org, 
	hpa@zytor.com
Content-Type: text/plain; charset="UTF-8"

Hi,

I discovered a kernel crash using the Syzkaller framework, described
as "INFO: rcu detected stall in sys_process_vm_writev". This issue
occurs during the execution of the sys_process_vm_writev system call,
where RCU detects a stall on CPU 0.

From the dmesg log, CPU 3 is stuck trying to acquire a spinlock in the
pgd_free function (arch/x86/mm/pgtable.c:490), leading to the RCU
stall. This is likely caused by spinlock contention triggered by the
page pinning and unpinning logic in sys_process_vm_writev under high
load or abnormal conditions.

I recommend reviewing the page pinning (pin_user_pages_remote) and
unpinning (unpin_user_pages_dirty_lock) logic in
process_vm_rw_single_vec (mm/process_vm_access.c) to ensure it does
not cause prolonged spinlock blocking due to scheduling delays or
resource contention.

This can be reproduced on:

HEAD commit:

fac04efc5c793dccbd07e2d59af9f90b7fc0dca4

report: https://pastebin.com/raw/v7xV4BdD

console output : https://pastebin.com/raw/GfJLqkpf

kernel config: https://pastebin.com/raw/zrj9jd1V

C reproducer : https://pastebin.com/raw/8Mm5f2kh

Best regards,

Guoyu
