Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D9F9460
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749524665; cv=none; b=G8+VHAi0oPS6AwOt5pv1n/7SdfrCoy3XNpKsD25pj8D+ANVfb30ogUyTcAeSlp+wWqmPi45G3freAeWDXv9jZZ7yWTGNlgj6Z3yMrgH9JQD1gX4ig7AK0SNp8ONXXHcEmIhQfRb9DUtZBEfThQwUgYzWx7UkKFLouSvtd+h4T1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749524665; c=relaxed/simple;
	bh=Sb0o9rWVXROjN959mgSf0zkMP9TqDqECGwDeHOFfN4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KP5dDFhSr11AI2cIP3xy5Zv/e74ugClztnMIO3/evdUTg3rC6mdWdE2SVgyjluGKyjp4J9DO2uHq69D0n9lZncJ2YlHjOhWRhmFhZdPuyb71Ph651QQD2MzPuZf79N6HMgfxc6GHrbWnOG6k/dJlN65BKSqtqq1SVM1HtK8F4tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2mZqPak; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2mZqPak"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6fad4e6d949so28022446d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 20:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749524663; x=1750129463; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sb0o9rWVXROjN959mgSf0zkMP9TqDqECGwDeHOFfN4w=;
        b=O2mZqPakKZxeR0mPHukDN2ELkOdhrQVD0I8LVe6xWjBxKQX14v/zrexUMv/tL1gsIM
         JsY+yPDkIqWEHBKBo/NFRRmLLbUeMsA15AwYpZm4piB/KXeIn4um7KAFHa4yP0tMtFir
         wpOM/WDyA/w/6o47W/wT+DiGYrE5G346eNVojtRHCvi9UH7MEXMN4CIlUE6ySs1bDPLx
         JmYN6bNDssyxPmGAA9Z8B3Ds7AZUc+vg4VcE+/cxurZuijI/KJmqSRoR70vQHSNte7LZ
         5qsdfWgbEujPcuBrlw6mrhoAWdCFyToOfNd6SCcW2UUM8IbW2hiJLRggGoR7f/RVtjJK
         Uzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749524663; x=1750129463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sb0o9rWVXROjN959mgSf0zkMP9TqDqECGwDeHOFfN4w=;
        b=F4A/1ekYAVHJMSmA0sOJyEAL5u5oB6mkK26JDvbut8+RvfBEafnA+PZIq2nqixmA2L
         Op9v9WwlX3iDsflWzSBR8VIrbowwTckAq8LLEs/+A6BrLfFxd3hQ5YwzyVXHUtbDL0V4
         +OmTdr/tvPGN2rKsIXFBKv1wo1cWbTOQtZsZKi2E6py02iiaBaCW2jGeynjEf/PDnKh5
         4D1Unc0qunLPcvfl2DjyvGFd3nYgNjT8OE+mtkmKIQ5DFZw2SvULsMJYeav3iHHJWoSH
         GtXwPl9WOPXgefOncwK5Zd/rovW33b8stx8NOH1Byqk3qRZaEVPZdZHGBDOpMyFEJt/f
         GKMQ==
X-Gm-Message-State: AOJu0Yx6v9G9NC7fSCAM1H+myEr1rHT2xP9/1BjvS30ZizW+tociXNIz
	26gwMhffMsOGmNKboG+yCxmkcv1M4AyylGt8Q1T09iDnz6V+ezxq8BvqPFGMb44hB4YlJUWWMMc
	u44NmZbPDxqAGhMmzWsPgRx2TzVNL9GSafYXiTEc=
X-Gm-Gg: ASbGncvKrjYS6w5JilvyHcdVmXVgBLf9k1h8bc+iYbK5HB/xDBd+QXal0C8dNwrGb7c
	ZgrZgxzm2B8s90MNARm1tgNpp1HUBh+CapcfnQ25T4Vcqfp+2wjFnW8mA5EiVj7B18d36n9YT1S
	8L1OWseMfEfOFNnVAk1+LpLSk3SqLO/VL3c4zCr/HVr1mgzTJYJQTd
X-Google-Smtp-Source: AGHT+IGvXG9MNWp2SNxIusTV8GenuzPm8gpU75as1bf2eTo4avog4w0okQk+qmFmUg4gGYsnhB/4RKbhsYgOSBH9dxI=
X-Received: by 2002:ad4:5ba4:0:b0:6fb:14:5e82 with SMTP id 6a1803df08f44-6fb08f8d348mr215003186d6.29.1749524662796;
 Mon, 09 Jun 2025 20:04:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609103535.780069-1-marco.crivellari@suse.com> <20250609103535.780069-3-marco.crivellari@suse.com>
In-Reply-To: <20250609103535.780069-3-marco.crivellari@suse.com>
From: Lai Jiangshan <jiangshanlai@gmail.com>
Date: Tue, 10 Jun 2025 11:04:11 +0800
X-Gm-Features: AX0GCFuY64oK3QesZTujjIJTYAGxiMPxpDC-fjXAg6ASZi71gUnWRyBmNAZJ-D4
Message-ID: <CAJhGHyBVWDKXfMLT3LBKFUu9ot2uRk=1xLebGf_Grh_j1_VOSg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] Workqueue: add system_dfl_wq
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 6:35=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
>
> Currently if a user enqueue a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
>
> This lack of consistentcy cannot be addressed without refactoring the API=
.
>
> system_unbound_wq should be the default workqueue so as not to enforce
> locality constraints for random work whenever it's not required.
>
> Adding system_dfl_wq to encourage its use when unbound work should be use=
d.
>
> queue_work() / queue_delayed_work() / mod_delayed_work() will now use the
> new unbound wq: whether the user still use the old wq a warn will be
> printed along with a wq redirect to the new one.
>
> The old system_unbound_wq will be kept for a few release cycles.
>

Hello, Macro

What is the reason for removing system_unbound_wq? I believe system_unbound=
_wq
is a perfectly appropriate and descriptive name for its callers. I=E2=80=99=
m not opposed
to system_dfl_wq as long as it will be an alias for system_unbound_wq (or e=
ven
system_percpu_wq, if that can be configured at boot time by sysadim).


If anyone feels that the term "unbound" in WORK_CPU_UNBOUND is not aligned =
with
the "unbound" in system_unbound_wq, I acknowledge that concern. In that cas=
e,
I would prefer to rename WORK_CPU_UNBOUND to WORK_CPU_UNSPECIFIC.


Many structures and functions underlying system_unbound_wq already use 'unb=
ound'
in their names, so simply renaming system_unbound_wq does not increase
consistentcy.

Thanks
Lai
