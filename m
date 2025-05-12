Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D13C2AE68
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 22:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747087359; cv=none; b=QRRz/0fbMNlZZq7RJJp5er+nCWJfOahBhDJhD/WT8aJIhcq3eOH1ygUzPjyZRGMsB0/NoBO55tyPhQBfWVbQbqdDdHflLJchpqMlgB5iJa/uKc0zyZw9LSxU3C6J17NM/yKB1C1iDn+Ml2VyAqpAtLgR9jaXNSSCuVZoBWeHmOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747087359; c=relaxed/simple;
	bh=Oi1DAOtb6owPdmhsxmbmlFroX+fOcLI+wg1xCtwIW1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VWYLfwaDDGcYFF8bf+hhlDbueuknoW2XycuRqsQcfKddNLGNLxTIr0Sd3ZiCoJHwSpvuR3zY4rdsFJp3zZxESpdYMv+jT3QUzEqo+GRqAPWItGEecHosX12TwUKXWOMeLGdxk69CxRwgM85h0idmIhU2qcF3sOhpHhtAfpuO92s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q4u0YqE6; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q4u0YqE6"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-708a853c362so45209447b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747087356; x=1747692156; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vW7A5aHjiKH+X9Ydb070/D1q8O2n+GGEFy0ERxt+OF4=;
        b=Q4u0YqE6wSFKuiGLaxX+Ucm94VA3VV1anbL+PCSLoWiRVtgI4AQtAyCRs33RsG6vhV
         kK1MtytZ7MEMF6Il0wcXkXtDxq9epybhYg3FWfm5tOwHRXVorHQxQujV5JBsxOzWrMmY
         yooX2jsvEv1ykKDXjA5CMqodyDm/Z/TOdWauiQBwM/T6uK7Hd3tk3XMmU2lYi+YMRrgF
         pxIMAWiWsdiKwCTqp1YOKYSlGr0IEOqqU/Ap6x5uqdWtgmyObrZrz7YnYs8CJNCEiLaJ
         Y1iqp/Chq5WRyrcnZ4hJemcNJ6g7zsKoje75t6Y8JBgK2b7dgMYQbB+fP8pOshRFVNLE
         HY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747087356; x=1747692156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vW7A5aHjiKH+X9Ydb070/D1q8O2n+GGEFy0ERxt+OF4=;
        b=pQPopge+xBp8Q41Nwb3oISdXq3HJEw32umiCm0d0ekdvRFAjm2eZylPvGQ849VqpKa
         9ulxzNSbn7o+6rMEWm7FNcIgbP2n/SioTdubnSvGRDmpdZv7NcAkaRpx87QNfZP0tmq/
         zVbKrqM0B90v5AqhT4Z3Y0KkvoVARKLSidRU59DlF5Ii9XdVqGpKGyNT9370fitzlEWA
         UpzaBBqe4J4SsuT5xjdDJQ/QzXKRILM/b/huG6dUEafZlPj7QbhmqKSZXAkFUhZm9hmp
         J1LasjX4eBV4hFURS9rShVz9HV8BXLpeU5EGGssRFLVF+4qsP5oJWpORvyqWmym3TV8s
         wUfg==
X-Forwarded-Encrypted: i=1; AJvYcCV3iqaLfjSofBbRV+oUMu8a5E9lZtTUW7olL8f5Ps9eeaAA8bbI+k+xaQvZaAnPv8OKmMBPIkT9D5+Zkn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkKXIsFWcOp7NbyuQmz5XYt6mAhoROuCCfnzsA/eLVbbnZJL57
	RpVaxQGJD2an++Q19uIUGE9WbHxkuFjZULKU86p6Si97VLvleEzXrM8FD1a6UCIBRoDMBTKQJua
	7jyhj0I7Wc5HP9n1JMt0pJNtciyiJUYqPvH5x
X-Gm-Gg: ASbGncuhvWLlUvPo2j0i/IK1DP8lBRQ1do7PjGsbn98kdkUz7OByE5Jdju8WkA6pMml
	/o2GNs4IuLTNHG4v0t8zxkZv2H22gOO/B0m0qLRH7+qSP0i1NYk0Kr68TyT9r1EkH6Ol1zdEcI6
	/UGxNb0LCNs23R/JR1foj9jf+3Hson5Jmc0QW88xTsTFjEeQKYu8BWy7LClgIbSr8=
X-Google-Smtp-Source: AGHT+IEY2Wm0wRuKLCb1QmSEkjT4BonO7vkJwDLak0FvVLGxCP+HmOGNgi+tbfiHD1pu4N/5AkT34JQGp18mtpkll4U=
X-Received: by 2002:a05:690c:7209:b0:6fd:318b:9acf with SMTP id
 00721157ae682-70a3fb6c30cmr199093197b3.38.1747087356145; Mon, 12 May 2025
 15:02:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508141012.1411952-1-seanjc@google.com> <20250508141012.1411952-4-seanjc@google.com>
In-Reply-To: <20250508141012.1411952-4-seanjc@google.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 12 May 2025 15:02:00 -0700
X-Gm-Features: AX0GCFtYvDiSjKXwNYi5yPNZUrZVRNCxuiYwCVVYJdbwfCZQdLE8KCQ5ZWcpNFo
Message-ID: <CADrL8HURpnXgN0ux4sUk0nVze=A6d488i_ztiZTwGZUdDMoTvg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] KVM: Conditionally reschedule when resetting the
 dirty ring
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Xu <peterx@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 7:11=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> When resetting a dirty ring, conditionally reschedule on each iteration
> after the first.  The recently introduced hard limit mitigates the issue
> of an endless reset, but isn't sufficient to completely prevent RCU
> stalls, soft lockups, etc., nor is the hard limit intended to guard
> against such badness.
>
> Note!  Take care to check for reschedule even in the "continue" paths,
> as a pathological scenario (or malicious userspace) could dirty the same
> gfn over and over, i.e. always hit the continue path.
>
>   rcu: INFO: rcu_sched self-detected stall on CPU
>   rcu:  4-....: (5249 ticks this GP) idle=3D51e4/1/0x4000000000000000 sof=
tirq=3D309/309 fqs=3D2563
>   rcu:  (t=3D5250 jiffies g=3D-319 q=3D608 ncpus=3D24)
>   CPU: 4 UID: 1000 PID: 1067 Comm: dirty_log_test Tainted: G             =
L     6.13.0-rc3-17fa7a24ea1e-HEAD-vm #814
>   Tainted: [L]=3DSOFTLOCKUP
>   Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 0.0.0 02/06/20=
15
>   RIP: 0010:kvm_arch_mmu_enable_log_dirty_pt_masked+0x26/0x200 [kvm]
>   Call Trace:
>    <TASK>
>    kvm_reset_dirty_gfn.part.0+0xb4/0xe0 [kvm]
>    kvm_dirty_ring_reset+0x58/0x220 [kvm]
>    kvm_vm_ioctl+0x10eb/0x15d0 [kvm]
>    __x64_sys_ioctl+0x8b/0xb0
>    do_syscall_64+0x5b/0x160
>    entry_SYSCALL_64_after_hwframe+0x4b/0x53
>    </TASK>
>   Tainted: [L]=3DSOFTLOCKUP
>   Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 0.0.0 02/06/20=
15
>   RIP: 0010:kvm_arch_mmu_enable_log_dirty_pt_masked+0x17/0x200 [kvm]
>   Call Trace:
>    <TASK>
>    kvm_reset_dirty_gfn.part.0+0xb4/0xe0 [kvm]
>    kvm_dirty_ring_reset+0x58/0x220 [kvm]
>    kvm_vm_ioctl+0x10eb/0x15d0 [kvm]
>    __x64_sys_ioctl+0x8b/0xb0
>    do_syscall_64+0x5b/0x160
>    entry_SYSCALL_64_after_hwframe+0x4b/0x53
>    </TASK>
>
> Fixes: fb04a1eddb1a ("KVM: X86: Implement ring-based dirty memory trackin=
g")
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  virt/kvm/dirty_ring.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/virt/kvm/dirty_ring.c b/virt/kvm/dirty_ring.c
> index e844e869e8c7..97cca0c02fd1 100644
> --- a/virt/kvm/dirty_ring.c
> +++ b/virt/kvm/dirty_ring.c
> @@ -134,6 +134,16 @@ int kvm_dirty_ring_reset(struct kvm *kvm, struct kvm=
_dirty_ring *ring,
>
>                 ring->reset_index++;
>                 (*nr_entries_reset)++;
> +
> +               /*
> +                * While the size of each ring is fixed, it's possible fo=
r the
> +                * ring to be constantly re-dirtied/harvested while the r=
eset
> +                * is in-progress (the hard limit exists only to guard ag=
ainst
> +                * wrapping the count into negative space).
> +                */
> +               if (!first_round)
> +                       cond_resched();

Should we be dropping slots_lock here?

It seems like we need to be holding slots_lock to call
kvm_reset_dirty_gfn(), but that's it. Userspace can already change the
memslots after enabling the dirty ring, so `entry->slot` can already
be stale, so dropping slots_lock for the cond_resched() seems harmless
(and better than not dropping it).
