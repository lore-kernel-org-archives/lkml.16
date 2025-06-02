Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7594118FDD5
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 16:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748882991; cv=none; b=nW89M5lcKZR/9kQJh1Q/XjjXD+a2uabOlrK6CHacwI6+5OGpnZ9htKf5icxfM25fEfGIHaSk8onOzweIwgyLajjTN7F7Am2OpqUWtLbeykfd8hdyHg6gpfiOE4z0UD6/35VzGPB05zuwv9Q4Sn9dUk78J8GmNrgyXB2/UtkDJko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748882991; c=relaxed/simple;
	bh=t41YNlrYxkEJSSxgqLb/rQ0ZuTZlBz9xtzIyTCEdCPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uxscAzqqEkjOO2xmG3k6H2wOR+x1kT67BykxABkWSWulpVTMB8yEqCnb/enr2LHFqSA21WDon1NX/UO/UlUXzDbN+16iQigY7rdTSEc8kWKKl7JrAeB7qmKLIPe7NbLGo4Jn2vv8hCI/LRZ22e061MRMpEBhP0gMzhuLAN0JEls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Ox5muyNT; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Ox5muyNT"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-234e48b736aso55760905ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 09:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748882988; x=1749487788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SJtLmJ1+ZA9gGTeiAdVPiVyS3gmJ2S4O+OKpjfVOgGU=;
        b=Ox5muyNTSBUZz7ZyVEZbqvyMt6EjkDAFHsNw+SUePwpntaX8QrA3Tn/Yc9Zdy+SAfH
         8ZenGAxtQzvNh8vGdaWGocJGcJzT4c1tKygSA6kIaK9n9TCnZRvlErVRZqG1zH4+XQXt
         PHiaNvCgLrVT15GvWd6nrR7GI0g9XFqO0yH2/cztoFXaYyuYHAymHKIjKGlYpz/7gB8d
         UI9sdVC21e0SRXOp706LbH3HKEky1mAEcDCDdfR9kxhUQJ7ww8tuOKGAuEFE48C52Qwv
         8QHZepuohPFBiV9hDGlE5vxT3/ij6CuRdy+g5zpgGg+Wv2f4ZrZ3OBS7UIAz8Y1F0+w6
         sohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748882988; x=1749487788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJtLmJ1+ZA9gGTeiAdVPiVyS3gmJ2S4O+OKpjfVOgGU=;
        b=f5ajcrgNyw7EfC4rwbd7NCD2LBEkvtrCrdC189f+Kd5eGhURYfl0LdwK26jVOK7kSa
         2yhEEgxXt8+9rnne2Fu+arw0f3psC+k0cCkYQlQrTzl2aC5pzWB3h/oBdWQXhpLFuZvb
         hhovBhnYwLSJ3FsHB525j/+fxD/df5UUfzU/Fr63koVl+4mt5/5tFqKHfPU4+yYivoA3
         uEC57G4T9vat7F/9uJ4vYF8NpeZ5Hzkq8/Syrxt9iogha8kYd0Ua0o/7e4c6GGI5F4Dd
         M5MF7zh+mARqUhsDNcwOdNCxMnaJCqVyCn/B468AZfI4d0seJlzEvKaAesc4+8YXnor1
         x0mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzDSlZgXu3jWHaoJeeHSjW0w5CcMtzivPuYIBRH0TqlpU94vuYv4zRuEJjk7yWwFEsTAE6+WJUFol2mhg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDsZHfM+h76W3l8UObzSxQPv/4Wxjzg5X1fv/kUxOl9uVD4y46
	MFjzdxiyfSbw5gYlDA967ktQUcdyGdpAhCwrRYfTcrejB696W4vn0jSWXqYqN6I+4S0=
X-Gm-Gg: ASbGncuoFoBIixTTSXmVQ7HZZqWvt26JEEyQMBAEwgNg9xjFo067UudzpHq2zPPoMD4
	S5a2Hj6OKFRwjRpD/ONtqVgL197bDBbOgGibcjHnFeffuSjjUzLBrFhGCJXGzos/zE0SPDs1ebd
	XiR6Kz8HyId9tj3dCkGu5JlySohGFoN1mlVlLB6EbYPB4tXdkqNmvBedlxV34E1a4FMOT32mCrN
	KMxAMYbI/zzw9qvOTpB06U1VcMacf3xQQsgA3ff7SVKe65/DCco34phpcosefACIpXkYImb37bV
	zc9BqL2mjbSQoWz3uLsVtLWNdQwdapfNKJeR4hVPonF/qHG3zotpHD/0lFkmBVM7Hj39Czfa
X-Google-Smtp-Source: AGHT+IHf3hxMDA11sY8CrqFCsHaPToaLCZdH89rX8lG5jyAges8FHHXEJxrLZzMcA5pRD8YHrbMtkg==
X-Received: by 2002:a17:902:ce84:b0:234:a992:96d8 with SMTP id d9443c01a7336-23528ef7a17mr232511875ad.19.1748882988548;
        Mon, 02 Jun 2025 09:49:48 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd75c7sm73327845ad.113.2025.06.02.09.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 09:49:48 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:49:46 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Zong Li <zong.li@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: traps: handle uprobe event in software-check
 exception
Message-ID: <aD3WKnyp_ffk60oF@debug.ba.rivosinc.com>
References: <20250314092614.27372-1-zong.li@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250314092614.27372-1-zong.li@sifive.com>

Hi Zong,

Thanks for taking the initiative for making cfi work with uprobe.
And sorry for not noticing the patch earlier.
Few comments inline.


On Fri, Mar 14, 2025 at 05:26:14PM +0800, Zong Li wrote:
>Handle the uprobe event first before handling the CFI violation in
>software-check exception handler. Because when the landing pad is
>activated, if the uprobe point is set at the lpad instruction at
>the beginning of a function, the system triggers a software-check
>exception instead of an ebreak exception due to the exception
>priority, then uprobe can't work successfully.
>
>Co-developed-by: Deepak Gupta <debug@rivosinc.com>
>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>Signed-off-by: Zong Li <zong.li@sifive.com>
>---
>
>This patch is based on top of the following series
>[PATCH v11 00/27] riscv control-flow integrity for usermode
>
> arch/riscv/kernel/traps.c | 9 ++++++---
> 1 file changed, 6 insertions(+), 3 deletions(-)
>
>diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
>index 3f7709f4595a..ef5a92111ee1 100644
>--- a/arch/riscv/kernel/traps.c
>+++ b/arch/riscv/kernel/traps.c
>@@ -386,9 +386,12 @@ asmlinkage __visible __trap_section void do_trap_software_check(struct pt_regs *
> 	if (user_mode(regs)) {
> 		irqentry_enter_from_user_mode(regs);
>
>-		/* not a cfi violation, then merge into flow of unknown trap handler */
>-		if (!handle_user_cfi_violation(regs))
>-			do_trap_unknown(regs);
>+		/* handle uprobe event frist */
>+		if (!probe_breakpoint_handler(regs)) {

If task has uprobe enabled and there is a cfi violation due to mismatch in
return address on shadow stack and regular stack, then it would be a cfi
bypass, right?
Perhaps we should be doing this only when we match that sw check exception
is due to forward cfi violation?

Do you agree?

>+			/* not a cfi violation, then merge into flow of unknown trap handler */
>+			if (!handle_user_cfi_violation(regs))
>+				do_trap_unknown(regs);
>+		}
>
> 		irqentry_exit_to_user_mode(regs);
> 	} else {
>-- 
>2.17.1
>
