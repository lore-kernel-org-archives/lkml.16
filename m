Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D6B2750F0
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419929; cv=none; b=apvl1ow5+NJQTMtZZymjaLIKhHqY4ioTJBS3TA9nMA8g1LIS9/fioKHfG6boaHWPOjXzcHj+gtziNGwHUjQ4qbkt1+ZNIPts/jT/xpAIhOw1nJGjibrofEaJEsTUXbgL3WT1+MDW7b0czvsAdjOUkJVWf3lmUzHSLx24XMoS2mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419929; c=relaxed/simple;
	bh=iq49G9wOYggjoDJcANMi0VVctc/wtpWsREH7YqiZsIc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=g/J9jgH5vIJH5sPEhzOckDqecrVDcQbs/FVJVjQ+HzBjGvSS/aOOEp33ff4Ac/vf4U6g8DbQs/QbmZ1Meuv7CFOcO6rAy1p6U0NBWvvn2csaFotiP37iSq9X96H7FuD5gqHoguNRXPvzj2UqAeUk/+aWzaYiFtNEaUiyuXeBVrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgwepJs5; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgwepJs5"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-85b3f92c8f8so83822439f.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 01:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748419926; x=1749024726; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LGZqeibOWB7S91gACjnl9P5+C3jb6bhNOrGxwNqaoHA=;
        b=bgwepJs5V2h7N0dj5v4/zO9pK9kdcIYULXlnCTnp1WrXb0win6OXgnVyazlm+MscxL
         4Wn6sVC9btEYrcwh/FQzKwYidGxlov8mfohKGutRisFHEcgHtFL6/vKWmur/FpuF21V3
         DhShe8ZEK+Tk4Op7oHZ8ZaUQABsgGvlImJxiHSH6uuhiK/YIDcXu7JgKVb2EP9D1UYDz
         /6waZAUESa4KsaUWdCTsKfr449twR2tO0xEeb27G0OnCEpzMJFxZYxtKCV8MPxzAaLJj
         jYRTuj7w/7XsPLHLRDme6QG+95HHkjG/m7nlhVlS661A1nzaXoLX5fjg3QvLAFizKGEq
         TRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748419926; x=1749024726;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LGZqeibOWB7S91gACjnl9P5+C3jb6bhNOrGxwNqaoHA=;
        b=sDUgEhgGazVGzH6VzlJfKF3srWWViBD3kxh9UBKG9QSJKcLHhnMzRN77iUN7VpqhSk
         pVH3enmULwlxhnmcY7/35Flj0SVCctJFwRWOyd36dJqLYhfmwxP5XpFlvWDp27Lm7kIR
         +ZQAf3wy9Gvhr/hgiXvUUTUBOQtLxS039JHE8a/Hvc/LU35FM12H5SeVXIv71yULptBX
         eVvLoDDFQAXUhAkV0zexUlTY0qDg5sPK9tt5+P1898in6e0YQdbQAT3UNiaPh7eaO7xM
         NyqE73dAVjPUAeCuuDYG1OiZtA5Zg7KHw/v/Jii9wdRLVbnod9S1TK4JftbH3s0MrOUb
         URbQ==
X-Gm-Message-State: AOJu0YyaIiJZBSagYP6NG8wLiTDjvHtjT9Pz6Ki0k0Bo2mbnes7OhVxf
	W0fDsDy+eTPy1CKDcPGXA1xBYlPzXxeRJmiHF+dyp/5vHsVcqMKHAfw7Q1PMpQN2EMETKfOm1+P
	HvnuBSgyw2QIKUvafIcQqi5oUA6ppMSUeN1u/h7/1hw==
X-Gm-Gg: ASbGncvrlwb1BYt1uIrF+wFetYwnR1ys6Wo6w1HP+Nsh52vnN54P2Q/og5o3TJ2dNXz
	2PHypnK5sq4Ca3AFrLMTHQgf/25UhdEn1bWRnjgMnWGo2bTc7mvx10zIDolo5JEQAeCX2eyxBvf
	q/SFtb6G1Ea1PKGDJIvehjsFL/vFwhJ7/q
X-Google-Smtp-Source: AGHT+IHpFfy1sdCvk3W1Rd9jWY5bWNJkGf0+jjyu1BQLChSZ07zVQ/pkk5+oePaDY+2em+LRUDdvDfvX5Vbfk5O15Sk=
X-Received: by 2002:a05:6e02:12e8:b0:3db:7b4c:309b with SMTP id
 e9e14a558f8ab-3dc9b695e1dmr163220745ab.2.1748419926500; Wed, 28 May 2025
 01:12:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Andrey Khalturin <andrey.khalturin@gmail.com>
Date: Wed, 28 May 2025 11:11:55 +0300
X-Gm-Features: AX0GCFsxCqR5KCgBY-3wMsAyTWPvicMPxDPJwSc_GOhMypD9xcUWmAPUlKhMjFI
Message-ID: <CAPEB=f0QxT2S9q2znpML35z+YyMVJ7p2kmr2sON+m7eJ=XbMpw@mail.gmail.com>
Subject: Subject: BUG: Process termination deadlock in exit_aio() vs device release
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Problem Description

We have encountered a fundamental deadlock issue in the Linux kernel's
process termination sequence when using libaio with custom kernel
modules. The problem manifests when the OOM killer terminates a
process that has pending asynchronous I/O operations managed by a
custom kernel module.
Root Cause Analysis

The issue stems from the order of operations in do_exit():

do_exit()
  -> exit_aio()           // Waits for completion of all AIO operations
       -> wait_for_completion(&ctx->comp)  // BLOCKS HERE
  -> exit_files()         // This code is never reached
       -> close_files()
         -> filp_close()
           -> fops->release()  // Custom module's release() never called

This creates an unresolvable circular dependency:

    AIO subsystem waits for all pending operations to complete before proceeding
    Custom kernel module cannot complete operations because it's
unaware the process is terminating
    Module notification (file_operations->release()) only happens
after AIO cleanup
    Process cannot exit until AIO operations complete

Scenario Details

    Service process uses libaio to communicate with a custom kernel module
    OOM killer sends SIGKILL (uncatchable) to the service process
    Process enters do_exit() but hangs in exit_aio() waiting for
operation completion
    Kernel module never receives device close notification via
release() callback
    AIO operations remain pending indefinitely, preventing process termination

Current Workarounds

Kernel module developers currently must implement workarounds such as:

    Process state monitoring - checking current->flags & PF_EXITING
    Timeout mechanisms - forcibly completing operations after timeouts
    Task work callbacks - using task_work_add() to detect process termination

Proposed Solution

The process termination sequence should be reordered to notify drivers
before waiting for AIO completion:

do_exit()
  -> notify_drivers_of_exit()     // Signal all file descriptors about
termination
  -> exit_aio()                   // Then wait for AIO completion
  -> exit_files()                 // Finally close file descriptors

This would allow:

    Kernel modules to receive early notification of process termination
    Proper cleanup and completion of pending AIO operations
    Graceful process termination even under memory pressure

Impact

This architectural issue affects:

    Custom kernel modules using asynchronous I/O
    High-load systems where OOM killer activation is common
    Any driver that legitimately expects release() notification for cleanup

Environment

    Kernel versions: Affects multiple kernel versions (observed on 5.x
and 6.x series)
    Architecture: x86_64
    Subsystems affected: AIO, VFS, process management

Request

We request consideration of this architectural issue for future kernel
development. The current design creates an unavoidable deadlock
scenario for legitimate kernel module implementations that rely on
proper file descriptor lifecycle notifications.

The fundamental problem is that asynchronous operations should not
block process termination when the process cannot provide the
necessary completion signals due to the termination sequence itself.
