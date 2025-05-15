Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9B1219A8B
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324562; cv=none; b=esz80Kc0462B+iirxAUrAlvtxaQqVTuUHw5k08NJCjxQYqQubV8SJi3FDuQLIVdSrM7Nz/RNkI6TSsTnSJb4tsmIYxd01SWmWOFbEc5eylbLx33UgWqWyhFlqOHejsN4ASzQ3BhJm0DVavWihSvMlS40/F8cuAUJjoLNP5aGbzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324562; c=relaxed/simple;
	bh=ZWFaz9G8mCh4fL/ZI8lOzKp4rkTmq+qocrzzt+P6HcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KgBxo0xla0s0JOOcxIwI20v8mlRhIqTQmBsTsU+9eOdf1b/dG7LVIhQWqrXlIF8ZV/R5BhlRMxYk1+hNQy38h3MKcPbecGB0PtougC9eThOkkVxhTX8ussiVP3jjDbr5wqFY2MXMYv67JRPtq77leEg4ybStS243i/ymWAyUbZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kXzw4QXH; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kXzw4QXH"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-48b7747f881so341431cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747324559; x=1747929359; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+K0vt/UsfM3vUNh3n2feDqNw5L/kOjFVTMJKG3X0A0=;
        b=kXzw4QXHdd1AHwFZSMwKWxR0oxF2tifNySjPJRniduID99JI0xjANUKUbllruUZGGV
         zOZHLgHxcQ8fTb/cEHYmyuBjKKp1sDF49FhLRLXf6aM7D790+UbZPWZN5xIDrvWVyYbq
         XMzYbzb0xsk4u45ftTqga+PteOkjuQa8YD8tWj/bibT/cf5FZ4xUBw/lcC+H/6i7Rysc
         9CQLKN0lePV+kbbQ/ghbGI1j9Q/a2HJfMgF8C1udC14oThT0FFfiWlkYuPvJiMjk7t6Q
         owtmmRnoDWwrA2v/4/hWjuMGKFqh0M5HrX45MOX+CoN3d1qSakviGF4+Yo5xJpTZA6gi
         KV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747324559; x=1747929359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+K0vt/UsfM3vUNh3n2feDqNw5L/kOjFVTMJKG3X0A0=;
        b=jOb2CeCE3LtoujEJdtohR2Gk20uTqlEyD+P55pdnNGg6HOzDUlCDpMNcyTqkyNYNm5
         6Vhq1Pp/0VUzako4SuJOHiwqEDYPg1i3bbbyKxwN/kYEh7U+TAjWZFS+pWPXNXqbsPDM
         0VxgdaCjGGy/MQTANXxPHJpuZg2/xz9WDH2CcJYz8x6ouvW9rR1ZkRsIk+NX6GPcITB7
         o4zWuBC1xysmLO+eqLMfKByuVoUybvfbQsbR0zooO66Ws4olLHEl/gmFj4U6AilZJRGP
         e6qnM0SEaFXjOVgX+W+fSctHoZ2kzeXD6N+koMuINq6oiUZqhTwfmBKKIDYrakRUx9bT
         w/lg==
X-Forwarded-Encrypted: i=1; AJvYcCW2SniaDhoB/lQI7347xlTEv4GW+UYcsQ3/PJ0Ae/S3lkNqpOLibzFit4TRLCK35HuW3Eiaty2FS/k2wTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUAJ3aSOhxYGihbqrB3bfhsb/JkZQw0dLIr1RvtautoiLGRoec
	3iRYVNI3tZd9eIaVmnJcxzzCTQVSCCosXodUBFamRR+QZ8yoNK2YgRWqPXCQ740Gxd6IbGYu9Qm
	1ShNEV81nljXziJcLM/jtDtFCJtmtDdrpgszHVu1/
X-Gm-Gg: ASbGncuwnMfldiVwhPW+qnx/dhkzVonQ3cOyHlebooeHichL0Bs9Pf/V/FksC7qj9P7
	ZvyksKeOit4aCWZ6pbYJ0Ut71KoJJ3evsaqAUaPu4dIXNZeu3NUMgHlDfT6pCAPMp2jrNzMdArR
	K2yrO8Gc7/M+eFBzgx89pU7f24hPKTDhByWWIpHd742GxEeiJTctEl4pyKLfF6LaI=
X-Google-Smtp-Source: AGHT+IGE8aOMfceY42fJdDmnr6JiZyRmyYUbEN4lifv+BrH+R9XF5r2WJo81r1w3ZWlb4E8sxeUCVV5r7958jw/lsCE=
X-Received: by 2002:ac8:7f55:0:b0:47d:9e7:91a4 with SMTP id
 d75a77b69052e-494a339e50cmr3395421cf.27.1747324559128; Thu, 15 May 2025
 08:55:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514192159.1751538-1-rananta@google.com> <5d204cf7-c6a0-455c-8706-753e1fce3777@arm.com>
In-Reply-To: <5d204cf7-c6a0-455c-8706-753e1fce3777@arm.com>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Thu, 15 May 2025 08:55:47 -0700
X-Gm-Features: AX0GCFtGa6LDhgwrs8UTR4zlPfPiOcKTMSK-2-OfwRKhnoGtsBeWQpI8tPkyL4U
Message-ID: <CAJHc60w1rYc9guoideuKpKaukuCyvxu3S7Fidoy3Lh94+_xDiw@mail.gmail.com>
Subject: Re: [PATCH 0/3] KVM: arm64: Allow vGICv4 configuration per VM
To: Ben Horgan <ben.horgan@arm.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	Mingwei Zhang <mizhang@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 3:30=E2=80=AFAM Ben Horgan <ben.horgan@arm.com> wro=
te:
>
> Hi,
>
> On 5/14/25 20:21, Raghavendra Rao Ananta wrote:
> > Hello,
> >
> > When kvm-arm.vgic_v4_enable=3D1, KVM adds support for direct interrupt
> > injection by default to all the VMs in the system, aka GICv4. A
> > shortcoming of the GIC architecture is that there's an absolute limit o=
n
> > the number of vPEs that can be tracked by the ITS. It is possible that
> > an operator is running a mix of VMs on a system, only wanting to provid=
e
> > a specific class of VMs with hardware interrupt injection support.
> >
> > To support this, introduce a GIC attribute, KVM_DEV_ARM_VGIC_CONFIG_GIC=
V4,
> > for the userspace to enable or disable vGICv4 for a given VM.
> >
> > The attribute allows the configuration only when vGICv4 is enabled in K=
VM,
> > else it acts a read-only attribute returning
> > KVM_DEV_ARM_VGIC_CONFIG_GICV4_UNAVAILABLE as the value.
> What's the reason for the cmdline enable continuing to be absolute in
> the disable case? I wonder if this is unnecessarily restrictive.
>
> Couldn't KVM_DEV_ARM_VGIC_CONFIG_GICV4_UNAVAILABLE be reserved for
> hardware that doesn't support vgic_v4 and if kvm-arm.vgic_v4_enable=3D0,
> or omitted, on supporting hardware then default to
> KVM_DEV_ARM_VGIC_CONFIG_GICV4_DISABLE but allow it to be overridden? I
> don't think this changes the behaviour when your new attribute is not use=
d.

KVM_DEV_ARM_VGIC_CONFIG_GICV4_UNAVAILABLE is reserved for the exact
situation that you mentioned (no GICv4 h/w support  or if cmdline is
disabled/omitted).
Regarding defaulting to KVM_DEV_ARM_VGIC_CONFIG_GICV4_DISABLE,
wouldn't it change the existing expectations, i.e., vGICv4 is enabled
if available and set by cmdline?

Thank you.
Raghavendra
