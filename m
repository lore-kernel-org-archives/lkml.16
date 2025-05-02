Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4487F18BC2F
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 03:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746157812; cv=none; b=fNjnJYbkFdArqT429XMEMAi9UpcKPFvt9c8M0lpbRpHNZPDY6MTCYkIWPPun3UNTd3vpP5PSREKWjqxhMziuL/jT6UaTDGpZa6dFE++UNdQeBt8kjyHKFx+UPcmfYXjAQ+PYB+8bokzFguHbcJL5SbL+EyisKEeoXqeq/oQohRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746157812; c=relaxed/simple;
	bh=yqu8sxN8vXWGWRHsJGlCQvKRYulQkFz+N2frigbjAhs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qIY0f4JtkeHxEff+CG/Gl1HonElPh40zbPqrwRtVJ6MACd6Jl9nypOMiXmzFdESyvCs89lQjlnHS+Hb1Te0z67YE7mmQmWYF2k2g5fWMv69kGiyU2MS7dtfCB7mZtjWBrI/pumLwtw9Sv3h/6GfUzrDdi3pUYBP9OxKPFGxSBz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=immunant.com; spf=none smtp.mailfrom=immunant.com; dkim=pass (2048-bit key) header.d=immunant-com.20230601.gappssmtp.com header.i=@immunant-com.20230601.gappssmtp.com header.b=0KdbKUCH; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=immunant.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=immunant.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=immunant-com.20230601.gappssmtp.com header.i=@immunant-com.20230601.gappssmtp.com header.b="0KdbKUCH"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3feaedb4085so971918b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 20:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immunant-com.20230601.gappssmtp.com; s=20230601; t=1746157810; x=1746762610; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=200bRbkNG4RFm4RNlBvwI80KWoLNHSBTitlUXIIUifY=;
        b=0KdbKUCHPzRWb4K0vvb0ijdytoxH8wN8hV9l8uR/Br1KkSfSCtc6YeIJa9EPbBP5AL
         dtpW5rVAW0pLUzj/ifqzKuPOMeKHn5IOZJM03WjOBQn1lsf1wVCzFMpd73OxL99aSbaE
         jXTN2jSpolmMTXylUnyANQo7ZowMXpZgBuSmWzgu2MnswHauXyVZvW4JwQo1Eo/sQvPn
         4RtNFnTv7jDsBzaf7kCPWMYSzZbiRYbKgZSgTU3FNYusZD163RmzIkJOLWfX/X2yNLNK
         RGODV667YKTRZMCcepNle/O7TD41WWKxjUMswyBk22Bthlkv6Jg6QQuSf6ArTBpAcqEf
         Ny4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746157810; x=1746762610;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=200bRbkNG4RFm4RNlBvwI80KWoLNHSBTitlUXIIUifY=;
        b=iCkZXq0SG55fFfU7vQdWBo3KdRj9NezzK3/pLgrS63ELH09I744Que//v9zB6Te8l9
         yRCtobE3f3B03z3nD+Tc/AHWsbwL96pOZ3Jw1V9ZaUbs7sJPQqlYgc2xKWExHQCQoSdS
         R2weR3Jz/wEDQRHAaTdAD1JOgq3Z3v0L9/7mTvjR/9q5hXxUw+qBm77Bqk8PCLlHDwJq
         vv8EUXjTtpiSbtsDRzc/xclG5aIzDYfbqmD8WLQm4AoHOvbdPkb4MT+3XFjoRrjOpfcv
         kIgls7SRXGRAZBTzFSBsvvbxG8F0nrmOZA1yGHgZZgPM+87hA8PNQkEA763ezH/txcpH
         9LMw==
X-Gm-Message-State: AOJu0YxBGaVkpaecu8rs0BLuzd6tAKIZTK06TviijTS8vD35pLHYbCBK
	l2wqO/49wvqkHnHB/UfrDsPAwKd8X+6UV1L2W8ybiuhUFLNjvSibOBv/Cz+qbEqKruyfXEu04tX
	TC7eLFrkGjpP4RqnY8sNRO6viWb3gmANJxqC+iCCQe1OAoPBERFA=
X-Gm-Gg: ASbGncupu0qJlCsZL1B/45WuSM0XWCwr4NGsTyuZMGbg+bOzrf7f9jJ0tezOw61Ac+5
	T1NhNYUVngvPx3jyw7FJOiqScvEQPwQrXtMvF23JWVorXK2keGEtfKwwJ7WsJtCvaWHEncQ3xyp
	fZ9wFIS0ZAWQRubs0l+Q==
X-Google-Smtp-Source: AGHT+IFWDH1QH7ebTs8UuQsCRHiO0kkjYVbdpD1lI2qZLhDSsrRH3ei2huvBBDrcoqitjfmO+306hZ3bUjGoQYSjf1c=
X-Received: by 2002:a05:6808:4e11:b0:3fb:a7d0:3b1f with SMTP id
 5614622812f47-403414c0ac9mr902368b6e.39.1746157810107; Thu, 01 May 2025
 20:50:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Per Larsen <perl@immunant.com>
Date: Thu, 1 May 2025 20:49:33 -0700
X-Gm-Features: ATxdqUH6DSpDNWj9GH7IVvgNReOtTawW4yUp6qlFfnIUyWLaN_WIyzpu7vU_EyE
Message-ID: <CA+AY4Xc7SEhSd-zQzhDnuewEOksxEqDHarcHzDwp-_SibDu2pg@mail.gmail.com>
Subject: [PATCH 0/3] KVM: arm64: Support FF-A 1.2 and SEND_DIRECT2 ABI
To: linux-kernel@vger.kernel.org
Cc: "qperret@google.com" <qperret@google.com>, "sebastianene@google.com" <sebastianene@google.com>, kernel-team@android.com, 
	"will@kernel.org" <will@kernel.org>, maz@kernel.org, 
	"sudeep.holla@arm.com" <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, yuzenghui@huawei.com, 
	Armelle Laine <armellel@google.com>, arve@android.org
Content-Type: text/plain; charset="UTF-8"

Hi,

The FF-A 1.2 specification introduces a new SEND_DIRECT2 ABI which
allows registers x4-x17 to be used for the message payload. This patch
set prevents the host from using a lower FF-A version than what has
already been negotiated with the hypervisor. This is necessary because
the hypervisor does not have the necessary compatibility paths to
translate from the hypervisor FF-A version to a previous version.

Support for FF-A 1.2 in the hypervisor is added as a precursor to the
addition of the FFA_MSG_SEND_DIRECT_REQ2 messaging interface. The bulk
of this change has to do with the upgrade to SMCCC 1.2 required by
FF-A 1.2. Additionally, unimplemented FF-A 1.2 interfaces are added to
the list of unsupported functions.

Tested by booting Android under QEMU and loading Trusty as the guest
VM and observing the SEND_DIRECT2 ABI being used successfully during
guest boot.

Thanks,
Per Larsen

Per Larsen (3):
  KVM: arm64: Restrict FF-A host version renegotiation
  KVM: arm64: Bump the supported version of FF-A to 1.2
  KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in host handler

 arch/arm64/kvm/hyp/nvhe/Makefile |   1 +
 arch/arm64/kvm/hyp/nvhe/ffa.c    | 235 ++++++++++++++++++++++++++++---
 include/linux/arm_ffa.h          |   2 +
 3 files changed, 221 insertions(+), 17 deletions(-)

-- 
2.49.0.906.g1f30a19c02-goog
