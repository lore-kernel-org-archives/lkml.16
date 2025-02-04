Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC51020550A
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 10:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738663332; cv=none; b=pAUdoE1h0clHCySpEcvCShA+8NDCKrcHw5NL7vh+Z4nonT55RNG0hs2Vt95uDQo5pUVr3ybldoyNATedbYrn+5u9WEiAVltpKLFwAU9tx6k4tqDWNUk74XjkegTnkha9q8T16sGz0GmlxPXnNq5j3mNLg/lT3pIkdi+QuhnAMzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738663332; c=relaxed/simple;
	bh=rs6r8CwLrd0Tx3iUQWSkDUKnHU/WdCTr2Cy4KQpmB2o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=P8WPXV5CR+ys+kWV08Om4p0hLtDwhBVFC1D8eeBNctVX2o4kL8UqwVenCs4LOPvIlbIfVEqLJ8ztuly69xaS5oPpzD0GGAo90+1OWqaAWAxsDEIZF2N4gtVn0p59ZQO3lWHOk6pV9Q+EeWPPHpTNnHHWigQvZLTqZHAXYq+a3Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dvyukov.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xkY4qYHl; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dvyukov.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xkY4qYHl"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-ab6d6a9bda9so512742566b.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 02:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738663329; x=1739268129; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R3VK9KPfRS9ADIKsKEkEJDj658krGSJ2N1FxBZpZz/c=;
        b=xkY4qYHlJXbVw0OOAPHPLRI4N3kePjExQvdb72Y5ozj6rNiJKtye0P35Vancl8RzON
         i5Y0CiTC86RI1qOwHn6Ldl5BdSQEGlCUx8utjJPZv9CaZTalTwMdqiT2CnZLO1HuARK8
         IQTI0Du6TDmrrAGbtu63mxkCREA/SFwVd8GMaOBdsAXFgK7SUJVZ4L1/TwyUdEvWgNkR
         H4lSO3fUtwoicBslL/AD/Vph4AnyUa/6c/YbOn9jefm2unaRJlthr8SfpZDJmkBv6jQb
         HPwsA9mPcfD6qh44AXvb0qlnu+Hpv2FQdmC+bZf5fovPUrsk71y8xkf8yWrv3XxqlSze
         qKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738663329; x=1739268129;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R3VK9KPfRS9ADIKsKEkEJDj658krGSJ2N1FxBZpZz/c=;
        b=H1z9DQmE3E7SN3s1hjWV8D65o9oydVPZU96YnO2KqN4RTnlZXeoVGObXh8Bm3oWZHN
         HW+TQqtbkubLvviWQ+GQIcFb9jYl7FhbgbtkgFBpvuGYATWOFSaiFHI8hXGxy7ms7qxB
         LEMrzVg+i7mzaY3Y3nt8cG0jOd2DZEIQZD9PIJIpjgs0wVWkCallhp/8Ywn7r75B3fEp
         DUUKNOoRjzfCdi8m498+HTg1gLuWY33mGANttzNHaeclrYWDzF/V76n5u23m2e7EWG5A
         Q0tf82Ddp2cxlrfsX1vPGNlD2f8nJDnio05CP+oo/FqTUIMRo/ap8S9JqMjuxtuCCE5Z
         q9gw==
X-Forwarded-Encrypted: i=1; AJvYcCWLigt70OpV7gnkr0JtyukOtsfJ1IS9p3LcBZnnpsovmlCeD/WvgHDusKLJyVRxvERdZYOVRVPH31StE5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQx+bYNBLd8Rvx1+YWYt4dvS1CQTjBAEz8e1vNbiGpw784Rqdf
	Po3nH4IoA7Eu4k/mpTHR3TigBhLgiSvrQQQTFlgrpnhhu1DBmhIAou4I4wMxhuobzIBw3sSzmbZ
	FcZhKFw==
X-Google-Smtp-Source: AGHT+IElMyTrr4qYdFWMMlVNSEGR0ZkNHi4Yomz2MjuhwLpcA5rv3gjSfCpET9evIBxb/j6WvHIkH5r9aF7h
X-Received: from edbin8.prod.google.com ([2002:a05:6402:2088:b0:5d8:8209:8769])
 (user=dvyukov job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:6d1f:b0:ab6:f06b:4a26
 with SMTP id a640c23a62f3a-ab6f06b4c6fmr2158765466b.34.1738663328970; Tue, 04
 Feb 2025 02:02:08 -0800 (PST)
Date: Tue,  4 Feb 2025 11:01:34 +0100
In-Reply-To: <20240802061318.2140081-4-aruna.ramakrishna@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240802061318.2140081-4-aruna.ramakrishna@oracle.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250204100134.1843654-1-dvyukov@google.com>
Subject: [PATCH v8 3/5] x86/pkeys: Update PKRU to enable all pkeys before XSAVE
From: Dmitry Vyukov <dvyukov@google.com>
To: aruna.ramakrishna@oracle.com, mathieu.desnoyers@efficios.com, 
	peterz@infradead.org, paulmck@kernel.org, boqun.feng@gmail.com
Cc: dave.hansen@linux.intel.com, jannh@google.com, jeffxu@chromium.org, 
	jorgelo@chromium.org, keescook@chromium.org, keith.lucas@oracle.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, mingo@kernel.org, 
	rick.p.edgecombe@intel.com, sroettger@google.com, tglx@linutronix.de, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Re commit 70044df250d022572e26cd301bddf75eac1fe50e:
https://lore.kernel.org/all/20240802061318.2140081-4-aruna.ramakrishna@oracle.com/

> If the alternate signal stack is protected by a different pkey than the
> current execution stack, copying xsave data to the sigaltstack will fail
> if its pkey is not enabled in the PKRU register.
> 
> We do not know which pkey was used by the application for the altstack,
> so enable all pkeys before xsave.
> 
> But this updated PKRU value is also pushed onto the sigframe, which
> means the register value restored from sigcontext will be different from
> the user-defined one, which is unexpected. Fix that by overwriting the
> PKRU value on the sigframe with the original, user-defined PKRU.

Hi,

This unfortunatly seems to be broken for rseq user-space writes.
If the signal is caused by rseq struct being inaccessible due to PKEYs,
we try to write to rseq again at setup_rt_frame->rseq_signal_deliver,
which happens _before_ sig_prepare_pkru and won't succeed
(PKEY is still inaccessible, hard kills the process).
Any PKEY sandbox would want to restict untrusted access to rseq
as well (otherwise allows easy sandbox escapes).

If we do sig_prepare_pkru before rseq_signal_deliver (and generally
before any copy_to_userpace), then user-space handler gets SIGSEGV
and could unregister rseq and retry.

However, I am not sure if it's the best solution performance-
and complexity-wise (for user-space). A better solution may be to
change __rseq_handle_notify_resume to temporary switch to default
PKEY if user accesses fail.
Rseq is similar to signals in this respect. Since rseq updates
happen asynchronously with respect to user-space control flow,
if a program uses rseq and ever makes rseq inaccessible with PKEYs,
it's in trouble and will be randomly killed.
Since rseq updates are asynchronous as signals, they shouldn't
assume PKEY is set to default value that allows access
to rseq descriptor.

Thoughts?





