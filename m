Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7387222D7B9
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 22:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751148785; cv=none; b=nNQvuS87Y0j0WQwx6v9ctdOfq3CDbvg/x/KuLfeo34NRxvprCjT1x55cZ6RP8hoy99PAmjcGqq4WvdDpulCmq0rR/urpzLIDNstlfRqGIFeNQRBBIamz4iDECliZiQq8B8XDRhkcj6m/OAGuOA7leUbBCWUmkPrXAUBwzjYSu1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751148785; c=relaxed/simple;
	bh=4hIoRo/BUe44/U6WOEvGpQ6TzxbhSycnGnHZnPeiuxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nJN+UUSqEHs0dkoLYr7jJcyFWIGRIC5NvCHte1IzzJhKJS5XYWT4zPAJJr5LPPgwcT3KuCnFunCs3ty2CWGp7cnXRkV/+TbpdXNpoBCSQEOq8LLE8YUdodSgQar2T9fhvG/KyArCY3Z+kBMrv3eZS4Uj3YwA3zVju+GE86piwS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=atero.ai; spf=pass smtp.mailfrom=atero.ai; dkim=pass (2048-bit key) header.d=atero-ai.20230601.gappssmtp.com header.i=@atero-ai.20230601.gappssmtp.com header.b=JornGeAG; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=atero.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atero.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atero-ai.20230601.gappssmtp.com header.i=@atero-ai.20230601.gappssmtp.com header.b="JornGeAG"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e733a6ff491so787793276.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 15:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atero-ai.20230601.gappssmtp.com; s=20230601; t=1751148782; x=1751753582; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pG0Jf3AyAuPPLWWO8w92wLQs80Toybr3R2SUNpvAU3s=;
        b=JornGeAGRFCFIZA8nfxooZmGGi0dL4DlXy1++S/NqKp/VM2aSAhoS3rmm9RSrywob6
         /NULLDBEppbz6jUhkqSZcFKsmKifVXIUuViOTaUENtsuprg/BXolyLuc53rtwXDwf0fC
         +E1vs4IdLB0fqxWz1beKbCm/1TmQz0MrLHI0dUxuqmTHjmDP993X+0VYtkxSrT6PWxAA
         5QNpKmBLQC0RRqpI6T1ZpCjGjJPPGh5Vwc+o6Dhp4BcayJtJUqt7WGcVbSo61qFejsRV
         R+zHfm2hR7cxYON2cvQ2mmCenazbbMcXdz1S2SR+nxnce4rmkXLya8o8Car7Z98PPMZL
         Mf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751148782; x=1751753582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pG0Jf3AyAuPPLWWO8w92wLQs80Toybr3R2SUNpvAU3s=;
        b=LtYDc3rIqQxmuTI5k9GUv60nBsxg4BZJAZ6dz43dFwhz18p+NqfuRt18AP1Z2Jz72k
         NfMwmYs24rbo1Hlj/c67Zm1vNG74QfjzEkWqe0G3UDnk2wq/cawwzmqy4uzp+rHYt+V6
         noHe+j1tZ12j3r4+xYLBCKLdxX+UQ0ymWIVjtkuFxw+1kYptCKERVjnEf6m2pccwRuQ8
         Wzu20WWRCYZyuvWxTcadS28E4q1QW/Lyzr71m6hxRbCE5bJkaggUSVEvQtReQqBDJqGp
         1ri++UlbJqZfojX0YGw3YI9ZT8un/q1GHdJQKr2cBTp4SQAVLsXyubs4OD+DygkNsyVg
         nRrg==
X-Forwarded-Encrypted: i=1; AJvYcCXgnjh6zqvK9AwyX8hfYcYRp8hq7QdPmJui81u1Qs31m5eAgGH9LcQ9dCV5TW/ESfWxMRE1SZbPJQ47g/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKwSpMH+yPixdPrSrk9o2yAsO46KOIOeea93gGsYNTdqJrmWjV
	aMHpTZBP6DitAcL2QzOv0KK6PLbwpMvS1D1NzhRgwP2l1tTNeH5iz1fWE7L0Mj6Irt4YGK9f+Kl
	zICI8Waq+d7D2WoDy2pLDXbb6sK6FBK3ZA/1CsxwKsg==
X-Gm-Gg: ASbGncsIWGU37l+YsYnqTfrowMWlBd1fAPqPl2i2cOs84QVwbfyBHXS1iqMteZHK5jm
	1NyrQ/GLLr47ANF2aiNYs2Lijzl5ebSeNsuwe6Ab59Dq7N1Jz8jeR59mtMWbPDnLiiZUaYh5Cxp
	fCNb5k30oSJC3MVMYy+Vl4ov/8i4tRACk30P+Qk1HGBkdJ
X-Google-Smtp-Source: AGHT+IGmZPJroRvvxHKmgN9a0X1tAnR5pbdtgYaEXaOTqCbeF41sWs4hBEm9ibaXTwBW1beTqacoRcXW+Uum57AXsr0=
X-Received: by 2002:a05:690c:a0a4:10b0:714:4e0:ba42 with SMTP id
 00721157ae682-7151714574fmr86419067b3.1.1751148782373; Sat, 28 Jun 2025
 15:13:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618231632.113471-1-sivany32@gmail.com> <CAJZ5v0jXPten8QwruK_Dqzvc0izLCfecMPBWMMoP8cnG4mDY0Q@mail.gmail.com>
In-Reply-To: <CAJZ5v0jXPten8QwruK_Dqzvc0izLCfecMPBWMMoP8cnG4mDY0Q@mail.gmail.com>
From: Elazar Leibovich <elazarl@atero.ai>
Date: Sun, 29 Jun 2025 01:12:51 +0300
X-Gm-Features: Ac12FXz7nWMf_ruYnnpMIxVSTL1Pb61zrmsTZHgUhqpM3MMbLMfc5P52r-Ru3vw
Message-ID: <CAFcvxdMozCv1mJFKemQKhOnZPLpfkWs3d97bHUijRdw7MdFO1w@mail.gmail.com>
Subject: Re: [PATCH] powercap: dtpm_cpu: Fix NULL pointer dereference race
 during CPU offlining
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Sivan Zohar-Kotzer <sivany32@gmail.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, elazarl@gmail.com, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 11:07=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.o=
rg> wrote:
> > * DTPM power calculations are triggered (e.g., via sysfs reads) while C=
PU is online
> > * The CPU goes offline during the calculation, before em_cpu_get() is c=
alled
> > * em_cpu_get() now returns NULL since the energy model was unregistered
>
> But energy models for CPUs are never unregistered.
>

Can't the following happen (extremely rare, but still):

CPU gets set to impossible during shutdown sequence, e.g.

// arch/alpha/kernel/process.c
common_shutdown_1(void *generic_ptr)
...
        set_cpu_possible(boot_cpuid, false);

Just before `get_cpu_device` is called by `em_cpu_get`.
Then `get_cpu_device` returns NULL for impossible CPU, causing
`em_cpu_get` to return NULL.

It's not a common scenario, but it seems NULL checking doesn't cost much,
and can assure us no rare case is crashing the system.
