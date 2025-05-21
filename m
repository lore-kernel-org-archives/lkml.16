Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD5374040
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747834471; cv=none; b=PJJWwbA+TuntDgwPLwoxpC1482SxFsYfPU54CtrpHSy2InMZHE6fyfdXYhjf4Bl3OtgTS+T2BMrkDwCkvzzAFyWGK7uNwUUiTxbExJXyBfoDUeokF6eIhsFGi0ayzKDu93NkDXes5To+CG/8o/rctf8ZBQwm3wwbPECbgmp3uj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747834471; c=relaxed/simple;
	bh=YIx/wbFDuX14hvgW+qQouMsHCpMYiwEmsBWt3wq0QLE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=abPV6YfSgvbgZWswkB7HvyhxT5RdzFTeQ/n+d1Jys3sdAon71YNH1MZKT+ciz03jqwcADmP5baT1p+OnbrLJ2ux/5IZxHdZ74L40VnJpyI6FpuMqIgJ77rwHwLallQxLjE7D4ffhSiJNdkw7WnpOsYqjjQUxe6LNVQwP3pD1FM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGGH2qMB; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGGH2qMB"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-31062172698so68245931fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747834468; x=1748439268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YIx/wbFDuX14hvgW+qQouMsHCpMYiwEmsBWt3wq0QLE=;
        b=RGGH2qMB9BtzmpNReTJRiV65rC+fsm+orSB6HwURpJTnpwI2Pq5lEX5vmKqMB5kug2
         BNWpRbrpvNeF57/s+e8gCaO5pzL9d5oF1euKTVwRVmU560urxGCHezPd3qkJW1Xcn/JP
         AL2K5CqnM9tUiTZimRwa4E1RTu10jFvQeaf8U3ychtHDOEFOvNMaqTcKVXQgXZjq9LDe
         oT6Ngnw9Yz57ww69fMYHRDlojgwnAGaju5yAvGeBYI5it87C2QE0xWYM+O51l3XAL7pr
         x0Xe+F5+LcyJtGVuWWQ16CJ31Oi1mZKIKDOtAdyz7BdasP/oyc8Mq2e/szH9msAqzMrZ
         6Nbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747834468; x=1748439268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YIx/wbFDuX14hvgW+qQouMsHCpMYiwEmsBWt3wq0QLE=;
        b=E5xYD4zpbjyXeLAfsu3S2n59UnHSsbKX2a/ErR4F/I/wTZ9zSfoHibdh5qFdmzEMLA
         yLQCU67d0mxfEVjzzQL13dT8E7hZa30UwicLdnh7oBJgzi9bNvYNF3K2ZEK7lrUMRER2
         bj1qhmqHkzv0aCkEHcSCcCHUDmrGEzHggof1ixUlbBlxAJBRgG2hqOFKLQC+pT4iQhbE
         Tc5cgjXOtOzl8kMde3ouoGxQewxIH0FiUckGfMI5lnpFhiImjw1+cj++6q/dUSsnwgHv
         1eM/8Tup3wnij/Kn5QGs6dv6724DbJVdQXqIuJTJnnHaQf5QAzVB8eYaD45d0od+/ZuZ
         Webg==
X-Forwarded-Encrypted: i=1; AJvYcCWmo21gZSQOPOODrKkjkRnX2do6iOaLtDORZAH0RftbnpudidK42eyswbEsU48pWOaLfS+HJAmPO3KYylo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZuujVnWDBBZ8qo7oDPrKRUczDVMWwGTcsjF2hc8edUoRIsItl
	V/oy5vKdjdSREeY1jFi0jyOJyCXP0S+h3OqHx0poIdFqeQXqTvv3DrppWZvPOVCyYwcxh5NdwZF
	Z1B0R7ospyv8347AqZJu9uCVvTjjtTQ==
X-Gm-Gg: ASbGncuqmiMNORBiLqyag2LxsQU/5vjMj4IPu1HBQI+5EBXd0jm/qVLwZ4ffiO5FFGr
	VOVNo+QYK+UWXAkRcbqvmjhKqmXpgdF1H758bqQvi0ab3qYW75/dQXOhEPx8ePDlVyK+qZTq9BW
	SbEov/ReL/VbAdwc9ykJterPYQip5VZRoSmkZkVAbOrufQ7i7MB0Zaig==
X-Google-Smtp-Source: AGHT+IG9mkVePDnWFYOItzSrdxVi8p8WeDTu3RISQWDLI8bgJ2TchaFraDl8mHATbNtCid8wWRg+VbqsiIW16lIrYZU=
X-Received: by 2002:a2e:a98e:0:b0:30c:1d:b147 with SMTP id 38308e7fff4ca-3280772b051mr71206301fa.19.1747834467125;
 Wed, 21 May 2025 06:34:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: John <john.cs.hey@gmail.com>
Date: Wed, 21 May 2025 21:34:15 +0800
X-Gm-Features: AX0GCFvJ5_8cOM-36i8UgVmQLyVqnCKH1_2eetImQz2ZLjJhw6RnYskWeEBj4Oc
Message-ID: <CAP=Rh=NB1bAs9Rn+cf8LPBUtStsHOF==9W89gyvuO=q7Cmrpug@mail.gmail.com>
Subject: [Bug] "soft lockup in corrupted" in Linux Kernel v6.14
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Linux Kernel Maintainers,

I hope this message finds you well.

I am writing to report a potential vulnerability I encountered during
testing of the Linux Kernel version v6.14.

Git Commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557 (tag: v6.14)

Bug Location: arch_stack_walk+0x79/0xf0 in arch/x86/kernel/stacktrace.c:27

Bug report: https://pastebin.com/6yUV9ssn

Complete log: https://pastebin.com/s0h502ZW

Entire kernel config: https://pastebin.com/MRWGr3nv

Root Cause Analysis:
A soft lockup occurred on CPU#1 in the arch_stack_walk() function
during an interrupt context (<IRQ>), while the kernel was trying to
walk the stack.
This call chain ultimately intersected with the RCU callback execution
(rcu_do_batch() =E2=86=92 kfree()), and KASAN instrumentation code, which l=
ed
to extensive CPU spinning in an interrupt context without yielding,
triggering the soft lockup detector.

At present, I have not yet obtained a minimal reproducer for this
issue. However, I am actively working on reproducing it, and I will
promptly share any additional findings or a working reproducer as soon
as it becomes available.

Thank you very much for your time and attention to this matter. I
truly appreciate the efforts of the Linux kernel community.

Best regards,
John
