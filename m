Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3531AAA2C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744614526; cv=none; b=FIjOlTgOG4GZ8lDEcp2M96WSnGNUR0g5qsxt8g0fUjYHsAQSGarxjiA1JDtoxPX6eyLIIW1UQnOyrwyeJ3w7Lw+01XwnlPLzA6/I49jsw0KjnvlbcZ2gBaKH2VuVFzkJFsbm3CBF9Iy8sE7NhilmG/t7w7u4Pk1Q1cEk3V7S4fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744614526; c=relaxed/simple;
	bh=8juwAuA5QfCK9G0ZTyfkhbvbUPbhRFAk1K5ddM/3Al8=;
	h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type; b=YarYsXokIoFQipd9Ekzso7mJcvUODeSmjzsQL57O549Vz/EghfhoPLJUcu0+t4dXCBvxqAu6hFkRK/XidnH8QDV9VxyduYD21odDxstCHGqAdCPPdLEgeGJszVd4nN6F+zAcMLS1D/P9xyAWidg+XhZDPfmIIVD27CusC7ZXqqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nqICWdcB; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nqICWdcB"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-223f4c06e9fso36141385ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 00:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744614522; x=1745219322; darn=vger.kernel.org;
        h=content-language:content-transfer-encoding:mime-version:user-agent
         :date:message-id:to:subject:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8juwAuA5QfCK9G0ZTyfkhbvbUPbhRFAk1K5ddM/3Al8=;
        b=nqICWdcBIMFOLPeo35tLOSaotOtWT9tE65LdKA6u/FY/ZbPuc1IJywFDughq2AvlZ3
         AOG09cYbMTi7+3vnzDGWEyFlxim+x3zHd658m+814SpROH9qFZPgFQ38PIRjWasIZeQb
         84HRRK25pALtC6wXX9fs0hfYZ5CyWoKLs44XMo/j41Q0AxRmSZbmH5rWSZo7mor5AIQE
         0SZYf/hXXZZpA5mClTK+2hBWnEDqZvh3TSuppR2q5KfR30gRmfogvfHHnuM7QQrje4nk
         tcNhEaIldNZYIANghMJ9cEVeTHQMolUttVa53n/YN9KkI+qFbtfUtBwoCcNg8iN+S3I+
         UMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744614522; x=1745219322;
        h=content-language:content-transfer-encoding:mime-version:user-agent
         :date:message-id:to:subject:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8juwAuA5QfCK9G0ZTyfkhbvbUPbhRFAk1K5ddM/3Al8=;
        b=nisFO5ICfzHqV1rjStr8+9RNoifgNkZtxYbdlYYR0SIRuXuUaZurmR6GTgycGu/OKa
         0oLCd0laDjTd+4BNc93iCPbETcnr9P8jai32DvB8cKY0LMqpE5tIxduX9XhIlDNsZfu9
         Ly1iCAc8PzJGV+GGLHP83VKAA3A9CW68VHkdlnNVwh607OBhYyKPV5QZsTyAK3/Kp+0s
         cDRMXCHRkyWDM4LZhc5CCXv8bQ26n8nNWSeMOxnDVninXXQM/wTYnIlS0UyEBoiu26GV
         DfN+/qS+PRuCEF7BPyRoYMfq58OM1citma9J7Q658FTCw/wF1vuqN2D1JTtgc5yG5MZg
         i1FQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8KMDaJlBMUGI9fA9qdLA7StCEow/GpsKS5kfya3nQNiBvNhlIycV7g3PlAOCPrz2kN8Tx8/a8ZOcL5HE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNfUTt5hMMzjHmobu6sDmQX2/AUIKyo16EpTkbU/XrTqKB5Fyu
	6WKzrLRwJbYnmt7Xzo6yqCJjfbgq9DVtziia6z6ShrJxEUhVFgYoV6FOY93yiMJCI9An
X-Gm-Gg: ASbGncsgKo+UorCgv8WWJ9iKmV33Z/A2Zsg4tmqXSDBZsfY1FQVZWphTZtvb/tu391F
	YlZA99iEZKg1DpiaXscBVwCR9Ep41ZpuZvyI8u/AOfvIAkiZOuOMd9NqG+ktuhnTMTODLhR7BdG
	RIuMVQLbMwAvoCeiI/pfgi8mJQs7+/s0QXpLSp6yt9kUQl6sj4TV5/n+ViU7f4PISFRP03QjbVH
	Tv5uUmT/YJpH4Za3lOvMmE/BBJ6aaNG+iXMKFO35WjNwdPAyJRZIHX8AMUXCO1XFy3pZfAj6705
	lo+rJLlKCG8FhYWJgdEx+HIs+ArYkLEsWxR6zIMlxuHp1gHulTjqnF/ArNTAdcCmzdIqwBgabDU
	=
X-Google-Smtp-Source: AGHT+IFI+TJHtXuU1Um1khf1rw63watwMWDxf39z1l44AL0ytJFyYwaYRdKUfwGI9oSBq3JyA0oBxA==
X-Received: by 2002:a17:903:2ac5:b0:223:607c:1d99 with SMTP id d9443c01a7336-22be9f68255mr174065865ad.0.1744614521164;
        Mon, 14 Apr 2025 00:08:41 -0700 (PDT)
Received: from [0.0.0.0] ([103.127.219.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cc9202sm92845015ad.211.2025.04.14.00.08.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 00:08:40 -0700 (PDT)
From: Linjun Bao <meljbao@gmail.com>
Subject: nvme: potential stack collision when running nvme_setup_io_queues and
 nvme_user_cmd in parallel
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
 Christoph Hellwig <hch@lst.de>, sagi@grimberg.me,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <3c6be8cb-753a-6efb-e2a6-5686740e6361@gmail.com>
Date: Mon, 14 Apr 2025 15:08:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi there,

This is Linjun Bao from Solidigm, a SSD vendor. Recently we get some drive drop report from customer, and we confirm this is solid on the latest kernel.

## Issue Description
This issue happens across different platform, from Intel BHS server to several desktop system. This issue happens on newer kernel including
5.19, 6.0, 6.3 and 6.6, but older kernel 5.14 does not have such issue. This issue happens on SSDs from different vendors.

This issue is easily reproduced under test scenario below. Two scripts are running concurrently, one is keeping sending nvme reset to the SSD, another is keeping querying smart log from the same SSD. After several reset cycles, when issue happens, the dmesg message prints out "nvme nvme0: I/O 11 QID 0 timeout, disable controller, nvme nvme0: Disabling device after reset failure: -4".

Using the kernel 6.6.85 (almost latest) to debug, from both Lecory PCIe trace and kernel ftrace, it shows the host stops sending out nvme_admin_create_cq or nvme_admin_create_sq during the nvme_reset_work. This issue happens only when the nvme_queue_rq() from user cmd executes just after the nvme_queue_rq() from nvme_setup_io_queues(), and with the same CPU core and thread.
In the example below, I marked "Q" as parent cmd is nvme_setup_io_queues(). "L" as parent cmd is user cmd of getting smart log.

```
 13)    <idle>-0    => kworker-151717
 ------------------------------------------
 13)Q ! 561.302 us  |        } /* nvme_execute_rq [nvme_core] */
 19)L   0.125 us    |            nvme_init_request [nvme_core]();
 13)Q ! 563.722 us  |      } /* nvme_submit_sync_cmd [nvme_core] */
 19)L   1.244 us    |          }
 19)L   1.549 us    |          nvme_map_user_request [nvme_core]();
 13)Q               |      nvme_submit_sync_cmd [nvme_core]() {
 13)Q   0.368 us    |        nvme_init_request [nvme_core]();
 19)L               |          nvme_passthru_start [nvme_core]() {
 13)Q               |        nvme_execute_rq [nvme_core]() {
 19)L   0.140 us    |            nvme_command_effects [nvme_core]();
 19)L   0.348 us    |          }
 19)L + 13.250 us   |          nvme_execute_rq [nvme_core]();
 13)Q               |          nvme_queue_rq [nvme]() {
 13)Q               |            nvme_setup_cmd [nvme_core]() {
 13)Q               |              /* nvme_setup_cmd: nvme0: qid=0, cmdid=8214, nsid=0, flags=0x0, meta=0x0, cmd=(nvme_admin_create_sq sqid=19, qsize=1023, sq_flags=0x1, cqid=19) */
 13)Q   1.716 us    |            }
 13)Q   0.494 us    |            nvme_prep_rq.part.0 [nvme]();
 13)Q   3.718 us    |          }
 13)L               |          nvme_queue_rq [nvme]() {
 13)L               |            nvme_fail_nonready_command [nvme_core]() {
 13)L               |              nvme_complete_rq [nvme_core]() {
 13)L               |                /* nvme_complete_rq: nvme0: qid=0, cmdid=0, opcode=2, res=0x0, retries=0, flags=0x2, status=0x370 */
 13)L               |                nvme_end_req [nvme_core]() {
 13)L   0.411 us    |                  nvme_error_status [nvme_core]();
 13)L   3.194 us    |                }
 13)L   4.299 us    |              }
 13)L   4.952 us    |            }
 13)L   5.729 us    |          }
 19)L   0.158 us    |          nvme_passthru_end [nvme_core]();
 19)L + 18.486 us   |        }
 19)L + 19.510 us   |      }
 19)L + 19.731 us   |    }
 19)L + 19.966 us   |  }
 19)L               |  nvme_release [nvme_core]() {
 19)L   0.159 us    |    nvme_ns_release [nvme_core]();
 19)L   0.433 us    |  }

// this nvme_admin_create_sq completion irq comes way later, 60s after the host sets nvme admin cmd timeout
 ## line 3165365
 12)  nvme-303232   =>    <idle>-0  
 ------------------------------------------

 12)               |  nvme_irq [nvme]() {
 12)               |  /* nvme_sq: nvme0: qid=0, head=27, tail=27 */
 12)   1.341 us    |  }
 12)               |  nvme_pci_complete_rq [nvme]() {
 12)               |    nvme_complete_rq [nvme_core]() {
 12)               |      /* nvme_complete_rq: nvme0: qid=0, cmdid=8214, opcode=1, res=0x0, retries=0, flags=0x1, status=0x0 */
 12)               |      nvme_end_req [nvme_core]() {
 12)   0.076 us    |        nvme_error_status [nvme_core]();
 12)   1.486 us    |      }
 12)   1.794 us    |    }
 12)   2.087 us    |  }
```

A call stack ftrace shows more. Among the lines that I comment "wield behavior here," the call stack for nvme_fail_nonready_command <-nvme_queue_rq seems wrong, for an user nvme smart cmd during nvme_create_io_queues(), it should go the path nvme_fail_nonready_command <- nvme_queue_rq <- blk_mq_dispatch_rq_list <-...<- nvme_execute_rq <- nvme_submit_user_cmd since this NVMe is in CONNECTING status, but the trace shows nvme_fail_nonready_command <- nvme_queue_rq <- ... <- nvme_submit_sync_cmd <- nvme_setup_io_queues. This is wrong, since this user cmd is now using the same thread kworker/u40:5-302 and cpu core #19, I believe some stack collision happens, and this user cmd wrongly uses the stack for the sync cmd from nvme_setup_io_queues, that's the reason why there is no further create sq/cq cmds afterwards. But I do not know how to debug further, please do help guide me.
```
=> cpu_startup_entry
 => start_secondary
 => secondary_startup_64_no_verify
           <...>-20136   [018]L .....   744.363379: nvme_open <-blkdev_get_whole
   kworker/u40:5-302     [019]Q .....   744.363379: nvme_setup_io_queues_trylock <-nvme_setup_io_queues
   kworker/u40:5-302     [019]Q .....   744.363380: <stack trace>
 => nvme_setup_io_queues_trylock
 => nvme_setup_io_queues
 => nvme_reset_work
 => process_scheduled_works
 => worker_thread
 => kthread
 => ret_from_fork
 => ret_from_fork_asm
   kworker/u40:5-302     [019]Q .....   744.363381: nvme_init_queue <-nvme_setup_io_queues
   kworker/u40:5-302     [019]Q .....   744.363382: <stack trace>
 => nvme_init_queue
 => nvme_setup_io_queues
 => nvme_reset_work
 => process_scheduled_works
 => worker_thread
 => kthread
 => ret_from_fork
 => ret_from_fork_asm
           <...>-20136   [018]L .....   744.363383: <stack trace>
 => nvme_open
 => blkdev_get_whole
 => blkdev_get_by_dev
 => blkdev_open
 => do_dentry_open
 => vfs_open
 => path_openat
 => do_filp_open
 => do_sys_openat2
 => do_sys_open
 => __x64_sys_openat
 => x64_sys_call
 => do_syscall_64
 => entry_SYSCALL_64_after_hwframe
           <...>-20136   [018]L .....   744.363383: nvme_ns_open <-nvme_open
           <...>-20136   [018]L .....   744.363385: <stack trace>
 => nvme_ns_open
 => nvme_open
 => blkdev_get_whole
 => blkdev_get_by_dev
 => blkdev_open
 => do_dentry_open
 => vfs_open
 => path_openat
 => do_filp_open
 => do_sys_openat2
 => do_sys_open
 => __x64_sys_openat
 => x64_sys_call
 => do_syscall_64
 => entry_SYSCALL_64_after_hwframe
           <...>-20136   [018]L .....   744.363390: nvme_ioctl <-blkdev_ioctl
           <...>-20136   [018]L .....   744.363391: <stack trace>
 => nvme_ioctl
 => blkdev_ioctl
 => __x64_sys_ioctl
 => x64_sys_call
 => do_syscall_64
 => entry_SYSCALL_64_after_hwframe
           <...>-20136   [018]L .....   744.363391: nvme_ctrl_ioctl <-nvme_ioctl
           <...>-20136   [018]L .....   744.363392: <stack trace>
 => nvme_ctrl_ioctl
 => nvme_ioctl
 => blkdev_ioctl
 => __x64_sys_ioctl
 => x64_sys_call
 => do_syscall_64
 => entry_SYSCALL_64_after_hwframe
           <...>-20136   [018]L .....   744.363392: nvme_user_cmd.constprop.0 <-nvme_ctrl_ioctl
           <...>-20136   [018]L .....   744.363393: <stack trace>
 => nvme_user_cmd.constprop.0
 => nvme_ctrl_ioctl
 => nvme_ioctl
 => blkdev_ioctl
 => __x64_sys_ioctl
 => x64_sys_call
 => do_syscall_64
 => entry_SYSCALL_64_after_hwframe
           <...>-20136   [018]L .....   744.363393: nvme_validate_passthru_nsid.isra.0 <-nvme_user_cmd.constprop.0
           <...>-20136   [018]L .....   744.363394: <stack trace>
 => nvme_validate_passthru_nsid.isra.0
 => nvme_user_cmd.constprop.0
 => nvme_ctrl_ioctl
 => nvme_ioctl
 => blkdev_ioctl
 => __x64_sys_ioctl
 => x64_sys_call
 => do_syscall_64
 => entry_SYSCALL_64_after_hwframe
           <...>-20136   [018]L .....   744.363394: nvme_cmd_allowed <-nvme_user_cmd.constprop.0
           <...>-20136   [018]L .....   744.363395: <stack trace>
 => nvme_cmd_allowed
 => nvme_user_cmd.constprop.0
 => nvme_ctrl_ioctl
 => nvme_ioctl
 => blkdev_ioctl
 => __x64_sys_ioctl
 => x64_sys_call
 => do_syscall_64
 => entry_SYSCALL_64_after_hwframe
           <...>-20136   [018]L .....   744.363395: nvme_submit_user_cmd <-nvme_user_cmd.constprop.0
           <...>-20136   [018]L .....   744.363396: <stack trace>
 => nvme_submit_user_cmd
 => nvme_user_cmd.constprop.0
 => nvme_ctrl_ioctl
 => nvme_ioctl
 => blkdev_ioctl
 => __x64_sys_ioctl
 => x64_sys_call
 => do_syscall_64
 => entry_SYSCALL_64_after_hwframe
           <...>-20136   [018]L .....   744.363396: nvme_alloc_user_request <-nvme_submit_user_cmd
           <...>-20136   [018]L .....   744.363397: <stack trace>
 => nvme_alloc_user_request
 => nvme_submit_user_cmd
 => nvme_user_cmd.constprop.0
 => nvme_ctrl_ioctl
 => nvme_ioctl
 => blkdev_ioctl
 => __x64_sys_ioctl
 => x64_sys_call
 => do_syscall_64
 => entry_SYSCALL_64_after_hwframe
           <...>-20136   [018]L .....   744.363399: nvme_init_request <-nvme_alloc_user_request
           <...>-20136   [018]L .....   744.363400: <stack trace>
 => nvme_init_request
 => nvme_alloc_user_request
 => nvme_submit_user_cmd
 => nvme_user_cmd.constprop.0
 => nvme_ctrl_ioctl
 => nvme_ioctl
 => blkdev_ioctl
 => __x64_sys_ioctl
 => x64_sys_call
 => do_syscall_64
 => entry_SYSCALL_64_after_hwframe
           <...>-20136   [018]L .....   744.363400: nvme_map_user_request <-nvme_submit_user_cmd
           <...>-20136   [018]L .....   744.363401: <stack trace>
 => nvme_map_user_request
 => nvme_submit_user_cmd
 => nvme_user_cmd.constprop.0
 => nvme_ctrl_ioctl
 => nvme_ioctl
 => blkdev_ioctl
 => __x64_sys_ioctl
 => x64_sys_call
 => do_syscall_64
 => entry_SYSCALL_64_after_hwframe
   kworker/u40:5-302     [019]Q .....   744.363402: nvme_submit_sync_cmd <-nvme_setup_io_queues
   kworker/u40:5-302     [019]Q .....   744.363403: <stack trace>
 => nvme_submit_sync_cmd
 => nvme_setup_io_queues
 => nvme_reset_work
 => process_scheduled_works
 => worker_thread
 => kthread
 => ret_from_fork
 => ret_from_fork_asm
           <...>-20136   [018]L .....   744.363404: nvme_passthru_start <-nvme_submit_user_cmd
   kworker/u40:5-302     [019]Q .....   744.363405: nvme_init_request <-__nvme_submit_sync_cmd
           <...>-20136   [018]L .....   744.363405: <stack trace>
 => nvme_passthru_start
 => nvme_submit_user_cmd
 => nvme_user_cmd.constprop.0
 => nvme_ctrl_ioctl
 => nvme_ioctl
 => blkdev_ioctl
 => __x64_sys_ioctl
 => x64_sys_call
 => do_syscall_64
 => entry_SYSCALL_64_after_hwframe
           <...>-20136   [018]L .....   744.363405: nvme_command_effects <-nvme_passthru_start
   kworker/u40:5-302     [019]Q .....   744.363405: <stack trace>
 => nvme_init_request
 => __nvme_submit_sync_cmd
 => nvme_submit_sync_cmd
 => nvme_setup_io_queues
 => nvme_reset_work
 => process_scheduled_works
 => worker_thread
 => kthread
 => ret_from_fork
 => ret_from_fork_asm
   kworker/u40:5-302     [019]Q .....   744.363406: nvme_execute_rq <-__nvme_submit_sync_cmd
           <...>-20136   [018]L .....   744.363406: <stack trace>
 => nvme_command_effects
 => nvme_passthru_start
 => nvme_submit_user_cmd
 => nvme_user_cmd.constprop.0
 => nvme_ctrl_ioctl
 => nvme_ioctl
 => blkdev_ioctl
 => __x64_sys_ioctl
 => x64_sys_call
 => do_syscall_64
 => entry_SYSCALL_64_after_hwframe
           <...>-20136   [018]L .....   744.363406: nvme_execute_rq <-nvme_submit_user_cmd
   kworker/u40:5-302     [019]Q .....   744.363407: <stack trace>
 => nvme_execute_rq
 => __nvme_submit_sync_cmd
 => nvme_submit_sync_cmd
 => nvme_setup_io_queues
 => nvme_reset_work
 => process_scheduled_works
 => worker_thread
 => kthread
 => ret_from_fork
 => ret_from_fork_asm
           <...>-20136   [018]L .....   744.363407: <stack trace>
 => nvme_execute_rq
 => nvme_submit_user_cmd
 => nvme_user_cmd.constprop.0
 => nvme_ctrl_ioctl
 => nvme_ioctl
 => blkdev_ioctl
 => __x64_sys_ioctl
 => x64_sys_call
 => do_syscall_64
 => entry_SYSCALL_64_after_hwframe
   kworker/u40:5-302     [019]Q .....   744.363408: nvme_queue_rq <-blk_mq_dispatch_rq_list
   kworker/u40:5-302     [019]Q .....   744.363409: <stack trace>
 => nvme_queue_rq
 => blk_mq_dispatch_rq_list
 => __blk_mq_sched_dispatch_requests
 => blk_mq_sched_dispatch_requests
 => blk_mq_run_hw_queue
 => blk_execute_rq
 => nvme_execute_rq
 => __nvme_submit_sync_cmd
 => nvme_submit_sync_cmd
 => nvme_setup_io_queues
 => nvme_reset_work
 => process_scheduled_works
 => worker_thread
 => kthread
 => ret_from_fork
 => ret_from_fork_asm
   kworker/u40:5-302     [019]Q .....   744.363409: nvme_setup_cmd <-nvme_queue_rq
   kworker/u40:5-302     [019]Q .....   744.363410: <stack trace>
 => nvme_setup_cmd
 => nvme_queue_rq
 => blk_mq_dispatch_rq_list
 => __blk_mq_sched_dispatch_requests
 => blk_mq_sched_dispatch_requests
 => blk_mq_run_hw_queue
 => blk_execute_rq
 => nvme_execute_rq
 => __nvme_submit_sync_cmd
 => nvme_submit_sync_cmd
 => nvme_setup_io_queues
 => nvme_reset_work
 => process_scheduled_works
 => worker_thread
 => kthread
 => ret_from_fork
 => ret_from_fork_asm
   kworker/u40:5-302     [019]Q .....   744.363411: nvme_setup_cmd: nvme0: qid=0, cmdid=0, nsid=0, flags=0x0, meta=0x0, cmd=(nvme_admin_create_cq cqid=13, qsize=1023, cq_flags=0x3, irq_vector=13)
   kworker/u40:5-302     [019]Q .....   744.363411: nvme_setup_cmd: nvme0: qid=0, cmdid=0, nsid=0, flags=0x0, meta=0x0, cmd=(nvme_admin_create_cq cqid=13, qsize=1023, cq_flags=0x3, irq_vector=13)
   kworker/u40:5-302     [019]Q .....   744.363411: nvme_setup_cmd: nvme0: qid=0, cmdid=57352, nsid=0, flags=0x0, meta=0x0, cmd=(nvme_admin_create_cq cqid=13, qsize=1023, cq_flags=0x3, irq_vector=13)
   kworker/u40:5-302     [019]Q .....   744.363412: nvme_prep_rq.part.0 <-nvme_queue_rq
   kworker/u40:5-302     [019]Q .....   744.363413: <stack trace>
 => nvme_prep_rq.part.0
 => nvme_queue_rq
 => blk_mq_dispatch_rq_list
 => __blk_mq_sched_dispatch_requests
 => blk_mq_sched_dispatch_requests
 => blk_mq_run_hw_queue
 => blk_execute_rq
 => nvme_execute_rq
 => __nvme_submit_sync_cmd
 => nvme_submit_sync_cmd
 => nvme_setup_io_queues
 => nvme_reset_work
 => process_scheduled_works
 => worker_thread
 => kthread
 => ret_from_fork
 => ret_from_fork_asm
 ## wield behavior here
   kworker/u40:5-302     [019]Q ...1.   744.363413: nvme_queue_rq: nvme_sq_copy_cmd
   kworker/u40:5-302     [019]L .....   744.363415: nvme_fail_nonready_command <-nvme_queue_rq
   kworker/u40:5-302     [019]L .....   744.363416: <stack trace>
 => nvme_fail_nonready_command
 => nvme_queue_rq
 => blk_mq_dispatch_rq_list
 => __blk_mq_sched_dispatch_requests
 => blk_mq_sched_dispatch_requests
 => blk_mq_run_hw_queue
 => blk_execute_rq
 => nvme_execute_rq
 => __nvme_submit_sync_cmd
 => nvme_submit_sync_cmd
 => nvme_setup_io_queues
 => nvme_reset_work
 => process_scheduled_works
 => worker_thread
 => kthread
 => ret_from_fork
 => ret_from_fork_asm
   kworker/u40:5-302     [019]L .....   744.363417: nvme_complete_rq <-nvme_fail_nonready_command
   kworker/u40:5-302     [019]L .....   744.363418: <stack trace>
 => nvme_complete_rq
 => nvme_fail_nonready_command
 => nvme_queue_rq
 => blk_mq_dispatch_rq_list
 => __blk_mq_sched_dispatch_requests
 => blk_mq_sched_dispatch_requests
 => blk_mq_run_hw_queue
 => blk_execute_rq
 => nvme_execute_rq
 => __nvme_submit_sync_cmd
 => nvme_submit_sync_cmd
 => nvme_setup_io_queues
 => nvme_reset_work
 => process_scheduled_works
 => worker_thread
 => kthread
 => ret_from_fork
 => ret_from_fork_asm
   kworker/u40:5-302     [019]L .....   744.363418: nvme_complete_rq: nvme0: qid=0, cmdid=0, opcode=2, res=0x0, retries=0, flags=0x2, status=0x370
   kworker/u40:5-302     [019]L .....   744.363418: nvme_end_req <-nvme_complete_rq
   kworker/u40:5-302     [019]L .....   744.363419: <stack trace>
 => nvme_end_req
 => nvme_complete_rq
 => nvme_fail_nonready_command
 => nvme_queue_rq
 => blk_mq_dispatch_rq_list
 => __blk_mq_sched_dispatch_requests
 => blk_mq_sched_dispatch_requests
 => blk_mq_run_hw_queue
 => blk_execute_rq
 => nvme_execute_rq
 => __nvme_submit_sync_cmd
 => nvme_submit_sync_cmd
 => nvme_setup_io_queues
 => nvme_reset_work
 => process_scheduled_works
 => worker_thread
 => kthread
 => ret_from_fork
 => ret_from_fork_asm
   kworker/u40:5-302     [019]L .....   744.363420: nvme_error_status <-nvme_end_req
   kworker/u40:5-302     [019]L .....   744.363421: <stack trace>
 => nvme_error_status
 => nvme_end_req
 => nvme_complete_rq
 => nvme_fail_nonready_command
 => nvme_queue_rq
 => blk_mq_dispatch_rq_list
 => __blk_mq_sched_dispatch_requests
 => blk_mq_sched_dispatch_requests
 => blk_mq_run_hw_queue
 => blk_execute_rq
 => nvme_execute_rq
 => __nvme_submit_sync_cmd
 => nvme_submit_sync_cmd
 => nvme_setup_io_queues
 => nvme_reset_work
 => process_scheduled_works
 => worker_thread
 => kthread
 => ret_from_fork
 => ret_from_fork_asm
           <...>-20136   [018]L .....   744.363429: nvme_passthru_end <-nvme_submit_user_cmd
           <...>-20136   [018]L .....   744.363430: <stack trace>
 => nvme_passthru_end
 => nvme_submit_user_cmd
 => nvme_user_cmd.constprop.0
 => nvme_ctrl_ioctl
 => nvme_ioctl
 => blkdev_ioctl
 => __x64_sys_ioctl
 => x64_sys_call
 => do_syscall_64
 => entry_SYSCALL_64_after_hwframe
           <...>-20136   [018]L .....   744.363449: nvme_release <-blkdev_put_whole
           <...>-20136   [018]L .....   744.363450: <stack trace>
 => nvme_release
 => blkdev_put_whole
 => blkdev_put
 => blkdev_release
 => __fput
 => __fput_sync
 => __x64_sys_close
 => x64_sys_call
 => do_syscall_64
 => entry_SYSCALL_64_after_hwframe
           <...>-20136   [018]L .....   744.363451: nvme_ns_release <-nvme_release
           <...>-20136   [018]L .....   744.363452: <stack trace>
 => nvme_ns_release
 => nvme_release
 => blkdev_put_whole
 => blkdev_put
 => blkdev_release
 => __fput
 => __fput_sync
 => __x64_sys_close
```


