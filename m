Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1AD1B87E9
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 20:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738355586; cv=none; b=qFfrkH0011me6z+XjeSkXJ8Z5YHcbdSKGuHPWWX9/EVQX6kr80BJgXnf7daxL4s7ugkc6RpMNN0Qp9/fAY2YaFxQ6Aycq6sx6lvE0v/Btkg1oUKrSEl1Act4pwZo0Kd8BtJkM+lDofEecC60+3qMAzZGGAZpnOLHdHMx4ih3DaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738355586; c=relaxed/simple;
	bh=6HQIl+pQmZwYtAJMEPZiyMRa7ufVFSc7Z2hzx46ZPK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C9TbhUuoEQK0bNiDXxZ6eSm9PaoPzauJCfGMDdBFsFAF0LdyIEgJH5adFdaf8qe4k7TA5R5hKFysOWrrDxvKTn826zleeZU/NZqtE2zp6mxp+x7DasxwIAc0We/wKaTeY/lfKBxjjLxwU+DKDNBtk5BxPPiHLWeyWV9j1l4Ox2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=HX82bcKe; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="HX82bcKe"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-46c8474d8f6so18895421cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1738355583; x=1738960383; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fi0MwM3w9TjVgRiY2TxYN38tQCD7guButB+IM55g75Q=;
        b=HX82bcKe754xHugQHCWy6cWZNqhTDVGML1l3FhSjtzhLWlbQ43c3F0msuIhvvBC4Gx
         QWZYTinx3Y6qjvZRF13zKSfnwt+rvWncurIrELVofrcORhickQCJ3AfRwC/5CotNXhvS
         7ZXeCiE9uAbRe9O3wT+lZsXmJvV8CfR7Y8i4YRlrxLKtvvBSU9MHqe62uwwMKDuaKPZv
         Dr27JqfvG+BzSPWIKF/6nJ0MmWwKEiM8XvD64vxaEKWupeiawgYK6kkGK+A4rqrbfmT0
         Eo1XJNaehE06YPHZLKMwBoTahBHA2BBm5Zojm47fjIPLGGXodeIr2fHEU05+XheURcnK
         5oHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738355583; x=1738960383;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fi0MwM3w9TjVgRiY2TxYN38tQCD7guButB+IM55g75Q=;
        b=JusmQRSl0ADttHN+j1MpVoNbofK8ceCpHXBAFAIvTEAD2SMMv1NBryc2M+O+nOrPF6
         nXkoVTDtlBa5YzNbxuPwLBzaNW6jLFB9q2LRg44fMPpxP4GLljGon02jcJ6/b6S3pJQu
         qA642NQ7MaPnD8zjvEQVAfKx4UgywH+lU5yd8hkd0k+M4pNWVuDs/AuksZABTi4MCLJn
         BOLXNKW2gniZymn3ZDJeKxwG212qRjsCKURwvMoHJrZsYcxY7gtCm5N40YII0ypQfSl6
         tZpN1V1HwYhi/TanjOEg56jDU2Ix47JZ4WQ7wdKDNGyg+pmgCRf7umS5VZgdcuFgBM9w
         ibdg==
X-Forwarded-Encrypted: i=1; AJvYcCUUM/kYFj1tmg0mW9v+ppWdDOsikvOMwCbZSSpF7r4F08XycAOdFj2gDfmw01c6dAfnq+u5I98KWPPrQy0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkBsTC/xnCBHRRn6FuQlkVEWlA7Enlu1sD7ag03MRCRpxKnn/T
	Bmhv3PcAgo4s8AVPaj/5PX8DG81Po56V5znk4rl8pL+uwv0PmOfu+QHzYwV8R1U=
X-Gm-Gg: ASbGncteeFFgAWTlsJUOitTd/rZI6XV8rGCzAsD8fQbZb0Q1qvuZckVPAUsO2gKQJmm
	AUW3I4V64Q0keDTnuzzRHeMhVQN8tmM6CI+OlShfV/6X0uRJLr1c0NnCQWWQ4MldQmMSVYz484P
	1TV6U5XFLT1UHdn45LdgmACS9veufykbsB2pFgY2LQ9QcElzBvhRGjx3PUi+Lz2bUPayTVCwpuj
	Qfs+WNEmy/6WeTMK5ffgfCxmxDhn23d9aWqvUTV8FrYWsHF+MR4rttIo7ePYZCGz/e06uU8iF+B
	2Ng=
X-Google-Smtp-Source: AGHT+IH2AcPhVqV8pp+FxoFEYodsDi6QjWt/uboIY/FehAjbO09w9dZEPJaKKEzNqikq40cLsv311A==
X-Received: by 2002:ac8:570e:0:b0:467:8651:40a2 with SMTP id d75a77b69052e-46fd0a6483emr197728091cf.13.1738355580870;
        Fri, 31 Jan 2025 12:33:00 -0800 (PST)
Received: from debian.debian ([2a09:bac5:79dd:25a5::3c0:2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0a72d4sm21072031cf.13.2025.01.31.12.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 12:32:59 -0800 (PST)
Date: Fri, 31 Jan 2025 12:32:57 -0800
From: Yan Zhai <yan@cloudflare.com>
To: bpf@vger.kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@cloudflare.com
Subject: Unchecked sock pointer causes panic in RAW_TP
Message-ID: <Z50zebTRzI962e6X@debian.debian>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

We encountered a panic when tracing kfree_skb with RAW_TP. The problematic
argument was introduced in commit ba8de796baf4 ("net: introduce
sk_skb_reason_drop function"). It turns out that the verifier still accepted
the program despite it didn't test sk == NULL. And this caused kernel panic. I
attached a small reproducer and panic trace at the end. It's stably
reproducible when packets are dropped without a receiver (e.g. run iperf2 UDP
test toward localhost), in both 6.12.11 release and a recent bpf-next master
snapshot (I was using commit c03320a6768c).

As a contrast, for another tracepoint like tcp_send_reset, if sk is not checked
before dereferencing, the verifier will complain and reject the program as
expected. So this feels like some annotation is missing? Appreciate if someone
could help me figure out.

thanks
Yan

----- Reproducer and panic trace ----
#include "vmlinux.h"
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_tracing.h>

char _license[] SEC("license") = "GPL";

SEC("tp_btf/tcp_send_reset")
int BPF_PROG(tcp_send_reset, struct sock *sk, struct sk_buff *skb)
{
        if (skb && sk && sk->__sk_common.skc_state == TCP_LISTEN) {
                bpf_printk("sk: %d, %d\n", sk, sk->__sk_common.skc_family);
        }
        return 0;
}

SEC("tp_btf/kfree_skb")
int BPF_PROG(drop, struct sk_buff *skb, void *location,
             enum skb_drop_reason reason, struct sock *sk)
{
        bpf_printk("sk: %d, %d\n", sk, sk->__sk_common.skc_family);
        return 0;
}

Byte code:
int drop(unsigned long long * ctx):
; int BPF_PROG(drop, struct sk_buff *skb, void *location,
   0: (79) r3 = *(u64 *)(r1 +24)
; bpf_printk("sk: %d, %d\n", sk, sk->__sk_common.skc_family);
   1: (69) r4 = *(u16 *)(r3 +16)
   2: (18) r1 = map[id:7][0]+12
   4: (b7) r2 = 12
   5: (85) call bpf_trace_printk#-63104
; int BPF_PROG(drop, struct sk_buff *skb, void *location,
   6: (b7) r0 = 0
   7: (95) exit

Trace:
[   29.982295][  T348] BUG: kernel NULL pointer
dereference, address: 0000000000000010
[   29.983487][  T348] #PF: supervisor read access in kernel mode
[   29.984326][  T348] #PF: error_code(0x0000) - not-present page
[   29.985138][  T348] PGD 0 P4D 0
[   29.985654][  T348] Oops: Oops: 0000 [#1] PREEMPT SMP
[   29.986351][  T348] CPU: 6 UID: 0 PID: 348 Comm: sshd Not tainted
6.12.11 #206
[   29.987309][  T348] Hardware name: QEMU Standard PC (i440FX + PIIX,
1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   29.988678][  T348] RIP:
0010:bpf_prog_5e21a6db8fcff1aa_drop+0x10/0x2d
[   29.989553][  T348] Code: cc cc cc cc cc cc cc cc cc cc cc cc cc cc
cc cc cc cc cc cc cc cc cc cc cc cc 0f 1f 44 00 00 0f 1f 00 55 48 89
e5 48 8b 57 18 <48> 0f b7 4a 10 48 bf 0c 4f e2 c1 ad 90 ff ff be 0c 00
00 00 e8 0f
[   29.992008][  T348] RSP: 0018:ffffa86640b53da8 EFLAGS: 00010202
[   29.992811][  T348] RAX: 0000000000000001 RBX: ffffa866402d1000
RCX: 0000000000000002
[   29.993852][  T348] RDX: 0000000000000000 RSI: ffffa866402d1048
RDI: ffffa86640b53dc8
[   29.994929][  T348] RBP: ffffa86640b53da8 R08: 0000000000000000
R09: 9c908cd09b9c8c91
[   29.995991][  T348] R10: ffff90adc056b540 R11: 0000000000000002
R12: 0000000000000000
[   29.997043][  T348] R13: ffffa86640b53e88 R14: 0000000000000800
R15: fffffffffffffffe
[   29.998097][  T348] FS:  00007f2a27c2b480(0000)
GS:ffff90b0efd00000(0000) knlGS:0000000000000000
[   29.999279][  T348] CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
[   30.000161][  T348] CR2: 0000000000000010 CR3: 0000000100e69004
CR4: 00000000001726f0
[   30.001217][  T348] Call Trace:
[   30.001724][  T348]  <TASK>
[   30.002145][  T348]  ? __die+0x1f/0x60
[   30.002694][  T348]  ? page_fault_oops+0x148/0x420
[   30.003386][  T348]  ? search_bpf_extables+0x5b/0x70
[   30.004082][  T348]  ? fixup_exception+0x27/0x2c0
[   30.004748][  T348]  ? exc_page_fault+0x75/0x170
[   30.005416][  T348]  ? asm_exc_page_fault+0x22/0x30
[   30.006104][  T348]  ? bpf_prog_5e21a6db8fcff1aa_drop+0x10/0x2d
[   30.006923][  T348]  bpf_trace_run4+0x68/0xd0
[   30.007566][  T348]  ? unix_stream_connect+0x1f4/0x6f0
[   30.008274][  T348]  sk_skb_reason_drop+0x90/0x120
[   30.008960][  T348]  unix_stream_connect+0x1f4/0x6f0
[   30.009662][  T348]  __sys_connect+0x7f/0xb0
[   30.010267][  T348]  __x64_sys_connect+0x14/0x20
[   30.010927][  T348]  do_syscall_64+0x47/0xc30
[   30.011567][  T348]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
[   30.012371][  T348] RIP: 0033:0x7f2a27f296a0
[   30.012998][  T348] Code: 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f
1f 84 00 00 00 00 00 0f 1f 44 00 00 80 3d 41 ff 0c 00 00 74 17 b8 2a
00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 58 c3 0f 1f 80 00 00 00 00 48 83
ec 18 89 54
[   30.015491][  T348] RSP: 002b:00007ffe29274f58 EFLAGS: 00000202
ORIG_RAX: 000000000000002a



