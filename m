Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E7B25C708
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 14:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746023942; cv=none; b=YJdW/8yBY8lh3TZX2aOtaQKA4KLOeC6Tr9qduiJ+lPyV2nx6sMVv2dmZbZPdpM5vOcGFlidXCqK6gHcLDyeqr+QX6H6RTn33YzeCdCbZmenSnVfJRMbB/9WBBBp2U7w4XoUe6jG0kdeEGCaJmkD4qQT38XADmc1gMVi6mC8RNHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746023942; c=relaxed/simple;
	bh=BhYYOz5NlOOegoPQI5hpXU14NXhJBnlFgf+RsnopOZI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=IKtmQi17N7X4oBCb1eUrM6EJi9L9Yq9htT1vB5ipAMYPW83yXGWzZYdeWKV+ifXXirfIK1B/KGHZgxvS/MVxUDBYIVGaXlncjqZRIWk2zUdP7hPTNG6uhGYx+lYDnvMhFXkPDLQeSkOlpFpXerKJmdTuPTIMZm4QiGPNUUMAN+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ob4mrwLg; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ob4mrwLg"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3912622c9c0so689798f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746023938; x=1746628738; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhYYOz5NlOOegoPQI5hpXU14NXhJBnlFgf+RsnopOZI=;
        b=ob4mrwLgHr/TnoJfJXzXsmPz3AP8Lup2cqan3/Ay3JNkV1HTMaDsePKim33PaO3yxV
         cZKSPxCnwCxou6nYUna3AzwUXInpW6AuIfKcZrdmtsVml7pFop9mXLF3GUfo9KQLx5Nr
         aF7q4mQ89CsipQt6MJBYm5XDq9gmDU5f7A/MA72rRpmxDaIaBHa+4iYfFk1I0/Sz8NNM
         I3PkZ70OZ1awdyQU6gtMZZgifxZ0PZp1GdidYilIsFewSdL3bNpInhqcj7znXsTwYqUM
         AXTZZqmwlsU2LcrPURzdrw/Os+jD7M3ZjWakugQYjzJ0EgRkNWPYBxYgEd5z/8DfvCKl
         GVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746023938; x=1746628738;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BhYYOz5NlOOegoPQI5hpXU14NXhJBnlFgf+RsnopOZI=;
        b=tuEZoyw0VSTmwxyXY3q30amLfbjEXCtTzjrsKkofIHzaqO1lxVx5Mc2LviAhhw48cf
         gnEQFxZRwB5lPv2tpyfN0D5hXCLoxay6iNYA8EQAD2QMQSEoe6Kw4N17LO0cyjn8UAz0
         j3TPm/r2hySQ9pB9UxKfw5g3UYrrvMp4rcfGvfwE6upNTwr4kG2d4tZcYwVPLOEFf3Db
         RJMOf6tfDBrvDFTNXUnWNVct8DRuDiLyAwSrnRJNhwNGOXhbVkHP3vfAVzJCPvDt9wO2
         esg6uAwac00buhm6C631HnDY/FfIuFx6W4dFqYkXTShCIUKBoFjw0/J5yR834g+zXPnh
         05Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUbWpMD1vo9DO5XHiR88jdCq+XBx7uM4TnYLZNeWqlum82qNzaIbzE/KbCVnn06sJoXAfyDS/vEtLI54i4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCBTFpCRs+20LVhQDqpsNGEPJCMGdv3cQBRuTEE+5AL8K4C6Qs
	m0Xao1mSDFehSEjczAb12LzzoZZoQj3Vdy3wwQ2dIgdfZDgQAvul5y/H4zHDOog=
X-Gm-Gg: ASbGnctzdewx9yIzWseMF7mDhKyfB9aFxfDj4WrtYbcgn/XXRZj6D3BUWzMFke7RsH6
	R5aFKM8TCRTh5thu/jKt6lVz80fHxfiKiWQ/+3R8nPWcGUxE33RJ+UMFQwL4qHCMNGuliK1NFMo
	wbWupC/mcmwp6oLZrl/wVscSP/lQzh6wxwuMn+6JpTCijKygIEj2UOIPFvBAQ/216NkQF/S6KAj
	95sAAu/mIFfP1LBfVOhbE9tJzZUjEO9+RB3LvS/VZs4+sUfIsBhifX6fJJcvjBp5RfyRDj+xIMp
	/GuQV7lekctsV36ZjNU6szOtHe/FW7sUju6MUfOT9RRYp2L8mmPD8ZC+lCE7MN6+WFos5lxAAzR
	X
X-Google-Smtp-Source: AGHT+IEI4GADqeHdXAfmffYECZ9pL6Wjw9iSIa7PRhjYESKXYcU7d8boy1B3uio5ziNSls3PXGMoQg==
X-Received: by 2002:a05:6000:2c8:b0:3a0:782f:9848 with SMTP id ffacd0b85a97d-3a08ff6e786mr1015889f8f.4.1746023938369;
        Wed, 30 Apr 2025 07:38:58 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca5473sm17383962f8f.31.2025.04.30.07.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 07:38:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Apr 2025 16:38:57 +0200
Message-Id: <D9K1TVIG544A.DAEZQAFBUDB4@ventanamicro.com>
Subject: Re: [PATCH 4/5] KVM: RISC-V: reset VCPU state when becoming
 runnable
Cc: "Anup Patel" <apatel@ventanamicro.com>, <kvm-riscv@lists.infradead.org>,
 <kvm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Atish Patra" <atishp@atishpatra.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Andrew Jones" <ajones@ventanamicro.com>, "Mayuresh
 Chitale" <mchitale@ventanamicro.com>
To: "Anup Patel" <anup@brainfault.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-7-rkrcmar@ventanamicro.com>
 <CAAhSdy0e3HVN6pX-hcX2N+kpwsupsCf6BqrYq=bvtwtFOuEVhA@mail.gmail.com>
 <D9IGJR9DGFAM.1PVHVOOTVRFZW@ventanamicro.com>
 <CAK9=C2Woc5MtrJeqNtaVkMXWEsGeZPsmUgtFQET=OKLHLwRbPA@mail.gmail.com>
 <D9J1TBKYC8YH.1OPUI289U0O2C@ventanamicro.com>
 <CAAhSdy01yBBfJwdTn90WeXFR85=1zTxuebFhi4CQJuOujVTHXg@mail.gmail.com>
 <D9J9DW53Q2GD.1PB647ISOCXRX@ventanamicro.com>
 <CAAhSdy0B-pF-jHmTXNYE7NXwdCWJepDtGR__S+P4MhZ1bfUERQ@mail.gmail.com>
 <CAAhSdy20pq3KvbCeST=h+O5PWfs2E4uXpX9BbbzE7GJzn+pzkA@mail.gmail.com>
 <D9JTZ6HH00KY.1B1SKH1Z0UI1S@ventanamicro.com>
 <CAAhSdy0TfpWQ-kC_gUUCU0oC5dR45A1v9q84H2Tj9A8kdO0d1A@mail.gmail.com>
 <D9JY52BJEFX2.2S5XL9NOOGBS7@ventanamicro.com>
 <CAAhSdy1xCRocu2uNri4iDm+NQd+VE8JRVeASfYJ8Qspr5aEz8g@mail.gmail.com>
In-Reply-To: <CAAhSdy1xCRocu2uNri4iDm+NQd+VE8JRVeASfYJ8Qspr5aEz8g@mail.gmail.com>

2025-04-30T18:32:31+05:30, Anup Patel <anup@brainfault.org>:
> On Wed, Apr 30, 2025 at 5:15=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrc=
mar@ventanamicro.com> wrote:
>> We can re-use KVM_SET_MP_STATE and add a KVM capability.
>> Userspace will opt-in to reset the VCPU through the existing IOCTL.
>>
>> This design will also allow userspace to trigger a VCPU reset without
>> tearing down the whole VM.
>
> Okay, lets go ahead with a KVM capability which user space can opt-in
> for KVM_SET_MP_STATE ioctl().
>
> Keep in mind that at runtime Guest can still do CPU hotplug using SBI
> HSM start/stop and do system suspend using SBI SUSP so we should
> continue to have VCPU reset requests for both these SBI extensions.

Will do, thanks.
