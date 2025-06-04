Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68E6274FEA
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 01:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748999193; cv=none; b=KtBVWL1ZD2irW+lSr5tM3DzC7NwaNUE4Av1I/NslhZD09v5BuZmbSnsZRepvKyUV+yIf8gLvEreMqT2lcYSJmj8Ob7IhlPloz/XOpbZD437K6NuC3QkDdhHbJ2jahDy6rjyxFurgNOAd50lA401fYZmZCwBxp6G0yiMrbDLY2m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748999193; c=relaxed/simple;
	bh=IQVVm2xw/bzq7dRFtzdHXISHByqKzowllZ0anTotjhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hiqtMK4qRreJKpRbkyrmcbGmJFN0FxtTGF1KJuToEjLOruEqcBacbygT3MyLaEHVrem4ddWpNLPfEm0aEBdvQlDC8mHpOivc1KlubelPjWMw1uS+XYc2nh+qDi3rxH7pU5g89Pj9bKoir4CV9qqxXJAM+lWV01dfFTXzG50POAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=c8vli8My; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="c8vli8My"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b26d7ddbfd7so6424356a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 18:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748999190; x=1749603990; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LhHMc55NRcsN/FvPE9B87wOrlUj3VF0MtSHgMnAPDz4=;
        b=c8vli8MyEe8l2a0DR0XNegz6yakVCON8KoZR8aFgg0WeMYKfLSvtHJvTQHf75lU+N3
         wNtjuA4HUSGFVxOsbq7QfSd9L2+yuZFbRxDvSJgAYERJPlkU4FgDadcu4Z7v+HFzanCt
         Zuj4LMl4ZiAgdTp4++qaRUOlTL567JIvTux4r5b7lh24f5zSAUVf49kgaWmozQ862+5K
         fjygTQc6afqAg5/IT7fYKGTiOzrCiLFzqcp5Xnp81qGvp1xfGTuDashjqnsHHhQ14Lsv
         uLgaTonDlQo5J8xneb/iMLylXU5JC5fLMfh9rOMpuCVTMmUSqW0dgDNRijZxr4e6vEQg
         IkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748999190; x=1749603990;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LhHMc55NRcsN/FvPE9B87wOrlUj3VF0MtSHgMnAPDz4=;
        b=j80v86YQK0WyqjuiyfPNSAbinOjvewcQ8yN6UgkIUmJZcwxUGbF5CscyYBKg47TQM/
         lDNAi5cPG+RyPaRZLfa9Ik3pnhpY76NG8kjI1V46ujyHkhTI8SVTZkiWgBUtqWMy5VOo
         k5hMkwrThLDASdv2920PY//7fLauctYK3MnCJCzUq0FFsKBr4TB7a+iQIm8a7ybSc7ip
         HD+VX/SybaK6Ut+qg/QljtrtwVI4mLooweRL2N7D6GKSbrmH43AVbHzVvTnuEhcCSkgV
         i4ypcgRETq0DI/EhOhMGVYpsIwj353letqy3vDAfabLJSheOxQtCVAK3PJlYkGMTXkUp
         AVBw==
X-Forwarded-Encrypted: i=1; AJvYcCWa6qN/yOoBl9mz4sCvGcNvrvuVu3mrbt65l7M5GdA5v41RRqldBQCFO3GGgXqU97OzIX7kJ2oTmm9yDj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYJ9lTcOQFcSuGrynTADakunFBkV1hoF2Qo5Ze662u7vJm1an+
	88xuDjoXZxc57i3PUZRCEoY8JnTE4euz93jYCEXPqNZA9W+w87Nfd+9bJZBJHr1Oe2M=
X-Gm-Gg: ASbGncs9WzpIF1Dwpn+939FGZlnuPrMPEgdm+ixzLGlJ2vIqtPbe84Uw1yFJQAA4qGD
	4I+/MWeCSYYJlaMGg0sOSeaetkR18/YGQJQd1T5vfJiwUBlgQwvJrPfduu1pskWRYYVvFRQ3aHG
	QEqqQwaXbVzki6pOB0mNrsItFC0eMpQ799ljUoIv84ANaEo2lOqsSCFrKH3dWySxgsxs8h4CVa+
	wGUh4mxvbTpCcmpwhdrlKCfGdXYLmdiv2koh2Sx3PhzwDiR0ne4jJyNzlxYn4wgAx9DcxywGdlZ
	fJB7JudHqDBDuhO0kunsA+B6yXZ4Js4p/UJX89KYom/5Yuz1qfyeoj742Ho93g==
X-Google-Smtp-Source: AGHT+IFvTALfjp/Y3ibakB8CWPTcZ35xraSu/LuIlBzY9vBaddLzmcMTcOCjwa9SRy36GVF16/VEAg==
X-Received: by 2002:a17:90a:da87:b0:311:e8cc:4253 with SMTP id 98e67ed59e1d1-3130ccf5106mr1396296a91.2.1748999189904;
        Tue, 03 Jun 2025 18:06:29 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2e9262sm7890955a91.27.2025.06.03.18.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 18:06:29 -0700 (PDT)
Date: Tue, 3 Jun 2025 18:06:27 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Zong Li <zong.li@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: traps: handle uprobe event in software-check
 exception
Message-ID: <aD-cE9IGrV6nOUjX@debug.ba.rivosinc.com>
References: <20250314092614.27372-1-zong.li@sifive.com>
 <aD3WKnyp_ffk60oF@debug.ba.rivosinc.com>
 <CANXhq0r8DeksFQC2ht8jeLpfn-0Tvuy4LU52BOMAj-AAB83+5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANXhq0r8DeksFQC2ht8jeLpfn-0Tvuy4LU52BOMAj-AAB83+5A@mail.gmail.com>

On Tue, Jun 03, 2025 at 09:48:08AM +0800, Zong Li wrote:
>On Tue, Jun 3, 2025 at 12:50 AM Deepak Gupta <debug@rivosinc.com> wrote:
>>
>> Hi Zong,
>>
>> Thanks for taking the initiative for making cfi work with uprobe.
>> And sorry for not noticing the patch earlier.
>> Few comments inline.
>>
>>
>> On Fri, Mar 14, 2025 at 05:26:14PM +0800, Zong Li wrote:
>> >Handle the uprobe event first before handling the CFI violation in
>> >software-check exception handler. Because when the landing pad is
>> >activated, if the uprobe point is set at the lpad instruction at
>> >the beginning of a function, the system triggers a software-check
>> >exception instead of an ebreak exception due to the exception
>> >priority, then uprobe can't work successfully.
>> >
>> >Co-developed-by: Deepak Gupta <debug@rivosinc.com>
>> >Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> >Signed-off-by: Zong Li <zong.li@sifive.com>
>> >---
>> >
>> >This patch is based on top of the following series
>> >[PATCH v11 00/27] riscv control-flow integrity for usermode
>> >
>> > arch/riscv/kernel/traps.c | 9 ++++++---
>> > 1 file changed, 6 insertions(+), 3 deletions(-)
>> >
>> >diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
>> >index 3f7709f4595a..ef5a92111ee1 100644
>> >--- a/arch/riscv/kernel/traps.c
>> >+++ b/arch/riscv/kernel/traps.c
>> >@@ -386,9 +386,12 @@ asmlinkage __visible __trap_section void do_trap_software_check(struct pt_regs *
>> >       if (user_mode(regs)) {
>> >               irqentry_enter_from_user_mode(regs);
>> >
>> >-              /* not a cfi violation, then merge into flow of unknown trap handler */
>> >-              if (!handle_user_cfi_violation(regs))
>> >-                      do_trap_unknown(regs);
>> >+              /* handle uprobe event frist */
>> >+              if (!probe_breakpoint_handler(regs)) {
>>
>> If task has uprobe enabled and there is a cfi violation due to mismatch in
>> return address on shadow stack and regular stack, then it would be a cfi
>> bypass, right?
>> Perhaps we should be doing this only when we match that sw check exception
>> is due to forward cfi violation?
>>
>> Do you agree?
>
>Yes, let me add a condition for forward cfi violation here. Thanks for
>pointing it out.

Cool, I'll send out another revision for my cfi series this week.
If you send out your uprobe fix, I can include it in my patchset.

>
>>
>> >+                      /* not a cfi violation, then merge into flow of unknown trap handler */
>> >+                      if (!handle_user_cfi_violation(regs))
>> >+                              do_trap_unknown(regs);
>> >+              }
>> >
>> >               irqentry_exit_to_user_mode(regs);
>> >       } else {
>> >--
>> >2.17.1
>> >
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
