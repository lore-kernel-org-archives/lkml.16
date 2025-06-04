Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA1F12D1F1
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 04:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749013065; cv=none; b=CEL8KNRLenHxD+J+gHBqSaTGiGoeITqFE5uVxxnAUFXaoi1/uTUgiYK5BHCp5YVJ2xhdKdF+8k3anc5i64dZ1nDsTxwSIX0hJMUEf4Ulogsv1PNvcemL6quAuveH4ptMZAtzVh5BN8ug792xxKVzwE08coTungXC+ppkv62ofMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749013065; c=relaxed/simple;
	bh=/UMWeeuI2kH5RYs1+AIMLMXpCj6fFS2b1YHebi/Pm6c=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qifB5cdSILe9vs2X/v+R/4ku06sEyIxe2WCI2tvIDv5/isTq+PMe/jSgUSB3HDAAXFDBNVgv+KtuIYgLf/Pn0X05sxcnCGGOZK98Pi6Xj16zrd+DNSKNLcZf8y3AXeZtrqt1fawNEfaoxzVMsYd+SgEP4NvBmMXk/oX3X4Sttqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VC/0n4u5; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VC/0n4u5"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3105ef2a08dso52906841fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 21:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749013061; x=1749617861; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8v5xJFrwaVgiw+YxRPuN7JQSLgnhsE9pwmAc/C6xcjU=;
        b=VC/0n4u5P0jiHzwf9qrbKj4N0ZTrbL90mlEFHeoaMKXYmkDKpbz2neE6igRd3FYAkB
         /hfpzl//urBi8/1yS6jAIgrBmOy7FRUKvmAZ+YAmITyCj3ToqvH1WgrnXaMAVe0gAWqc
         +3OLB6XH0UOQNg+qpbTcyhPknOs9eWob84Z7M3BSJU+j1i4Ts8lFxkIbvsOgj9Ozl+DF
         O/B3w/bJepxgCC1n+bimqGh4AjmOlxGWCF73jSCrQWMSdvm3Fld0yCx7oWHvj0Ma6833
         1vRESiL4Cg3gILAk0jzy2omL7K9QiBfuBlrR+X0naCR9J7WFhT475EpkMecmUdGH1Poi
         bfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749013061; x=1749617861;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8v5xJFrwaVgiw+YxRPuN7JQSLgnhsE9pwmAc/C6xcjU=;
        b=mctyvOFJmjdUibMbRSyiN7f6ibA2fzaAy5MzFqBy0ArH603ubNOntF8QDO+PEB9NrJ
         AYgBeSi9OJdSvkAlugyrbi9aYCG2pd7B4BCnQc9AhLLLl+lZ/3cYzq9/9iw8lvPv66yH
         EJksjWppBAa9ecjIqyonS45XNWCMnGFiMP+dQmQczSs4j8LNujGgqv0ILbiWYcq3oWgF
         O89VdwjT+RJuawY/KaD+iK4+Hg5Rubw6HBf8oG4OgSj1G3fQ4ouX58u+b7IOKnAH/721
         VNA7QJacV6BW4pQhsv/uSpt4SIykBEh1g0M985zscza9W+DbI0dYGJDERhd9AnChYF3A
         Xymg==
X-Forwarded-Encrypted: i=1; AJvYcCXS2NzLxnJV8gQFZ4ctuXFuugUUQaX1nMKIsamRRIwb6FcRyE1MgdhXb74noV8xIjpIl25z4r49QmcZ2Sc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKdY0+Zru8KBAFXqJSKEzXPlYaFce4B1m8zO6ZUjXhl0tTWO5n
	ls0N/HnqnWgJhWuhCBZCqtxGS7RXYU58wFuSh0No3C1q0ZzoOCalmly48MmJHKbc+E8DYUaX8qJ
	FVNnUCGnaAkNFUurBaLug8wXmeEBc26KnO+Pr
X-Gm-Gg: ASbGncutidFelBpAkJsHvuN7CBp2G1L0IVvcqO5qHVFkgigb654Ml7OHtwOV9oGAiT+
	mdJqWSW9uKmGjrmGp2iSVPWn3nT2RErFFMLE+aeRSzas6gaYqymg8JY2diUWY4q0wUEgK7xX9ev
	MeTksUzlI0yzYwNWgQC8XOWc5Nqr7AyI903dE=
X-Google-Smtp-Source: AGHT+IFCc6usfArAC56VsjkQpd20/+8UPY+2dsAxUSQR1IdmWnM/fac69vr4SmvVauiBXNtHXrVY1QMfPYslQyec1jI=
X-Received: by 2002:a2e:a547:0:b0:32a:79d4:c900 with SMTP id
 38308e7fff4ca-32ac72676b8mr4754761fa.33.1749013061112; Tue, 03 Jun 2025
 21:57:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Luka <luka.2016.cs@gmail.com>
Date: Wed, 4 Jun 2025 12:57:30 +0800
X-Gm-Features: AX0GCFuiuI26uYAWnjBt__6hOhO5j4NVk_k2g0fbnGosRIZ_ix3S49ouN7EvK8U
Message-ID: <CALm_T+0k9oZ-AN+4jk=07DPfLpWM7jZQK9s4KWi5kMiEjOi1Aw@mail.gmail.com>
Subject: [BUG] WARNING in do_sve_acc in Linux kernel v6.6
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear Kernel Maintainers,

I am writing to report a potential vulnerability identified in the
upstream Linux Kernel version v6.6, corresponding to the following
commit in the mainline repository:

Git Commit: ffc253263a1375a65fa6c9f62a893e9767fbebfa (tag: v6.6)

This issue was discovered during the testing of the Android 15 AOSP
kernel, which is based on Linux kernel version 6.6, specifically from
the AOSP kernel branch:

AOSP kernel branch: android15-6.6
Manifest path: kernel/common.git
Source URL:  https://android.googlesource.com/kernel/common/+/refs/heads/android15-6.6

Although this kernel branch is used in Android 15 development, its
base is aligned with the upstream Linux v6.6 release. I observed this
issue while conducting stability and fuzzing tests on the Android 15
platform and identified that the root cause lies in the upstream
codebase.


Bug Location:  do_sve_acc+0x17c/0x3f4 arch/arm64/kernel/fpsimd.c:1479

Bug Report: https://hastebin.com/share/calarosado.css

Entire Log: https://hastebin.com/share/efepocaxoh.perl


Thank you very much for your time and attention. I sincerely apologize
that I am currently unable to provide a reproducer for this issue.
However, I am actively working on reproducing the problem, and I will
make sure to share any findings or reproducing steps with you as soon
as they are available.

I greatly appreciate your efforts in maintaining the Linux kernel and
your attention to this matter.

Best regards,
Luka
