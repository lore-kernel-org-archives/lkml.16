Received: from mail-io1-f74.google.com (mail-io1-f74.google.com [209.85.166.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF1C211290
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 21:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738618647; cv=none; b=R7TqyPfhkLfyZM90ci+ydj/zgl2uSEXT86mJTKAyqmPrYNktFdRo8GkXzArJ8flv5PJla6AyaU0EK4UP6bWdgZ4Jn+IFHUmjsGvoZw7+QPe/TeT8+EpEWjBiFSWVDlAOIe7QD3OmRtkt7L5NeTGJrVKAnng01tvhdQEbkvOPpnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738618647; c=relaxed/simple;
	bh=QLnx4/Rgy7zQOoI/TasPwiI6+hjEJs/e68fuOcK9rGs=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=GfU9c5uTcbxuR7SfyLMFK0PY0JuBj8EfcjHzI2FsZLI0wTx3GyeQMvhg2qhGZDi+n5NsO0dO6vbeYspNRpz0cQ6yghhKpZwtdpQ5yq31rGnc4QjC09+doO5PL2a/QgbypG2YDnZHUXoaXUxDvT0DfnfLEv1Bw0LIZBkNd9bvHCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qmDEtDXn; arc=none smtp.client-ip=209.85.166.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qmDEtDXn"
Received: by mail-io1-f74.google.com with SMTP id ca18e2360f4ac-847500c9b9aso762763939f.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 13:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738618645; x=1739223445; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XEqP/YEsjQP6HXPcAZ+OLL0SnqZRyU2wi8fLU4Seg48=;
        b=qmDEtDXnc+drZ2rBsx5VwzDTo8GAidumBDsj/exrwP3oPPPzqsVXCuGF68aWe3gD+9
         fzEtf1YGvJojJQm6s9piBShclKbrI+4Jgs6yCx65MwpwhX5+dVpgfCWWVppr6fdpRsCo
         RvX2A9Q2z5mplQVC1RKXwMyBzd2Hya9FENjOS/qMpJqcodTv41OfSqA6J0RrzH1dsgAH
         IC572ulqisdDqw6RsKjq9T03zRi8lA37nIQLIcF85+S5qpQfUzeR1MlNsuCW910R3iEY
         BNZhhqwPV09n/lrMSAkB/BgVgOwAELzePUlvyo5s/UoXcjwQht8jFSgy2GItQ8b1fBG3
         qwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738618645; x=1739223445;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XEqP/YEsjQP6HXPcAZ+OLL0SnqZRyU2wi8fLU4Seg48=;
        b=T1OW5mj5+E3Ao/Fg1BCxnKpHGTRii8newATy0Zd/DOWk1BQAwaomX41neoNWmiCvZd
         KNPy556Ko7iZDcnUUo/dUiIDHmML2A3AlGooBR3augRARnzmpWx0eU5iOztyo9z0vEiY
         vBtxMwTfbRtbWb7bXDLs/RoLKdhwuZjzIIlujZnKcNBmUrSFilzBhMm1AxbtQntcWuf+
         IinesHiKCvDUH/i1NcVmOd7PLnhUazRMSxq6q6Zb0TgI8osNIXa4t6vWkwjkM9m+bk6q
         umwOBxd6KHpdiIvZ/3WaA7lNUuyQPZ1RVESW6LYBbaFaVIOqZjg0cKKYrq9PPz5qDH+o
         ztsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbR4Yd0cFPRryw7sPSOq8xTEyRVvNjw8J6qXk9toAlEYicNtE0G9+3uEYJBgW2VLhKhbE3L0+E0N1YE1k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTcKixKCXnOCQt+6rLKFOuleSDHG+SKIVHTuvYHUa7IWggdbxn
	G7ufPek6guBBK5g27tB+5RMipttxmTVgL0FFdph9XgYnI1majP/vwye+KFsHyCPJXYOQpsV/VLz
	NhSbpL5KPwGANNnxIpd841g==
X-Google-Smtp-Source: AGHT+IFzEQXFVr/GsJOoiYsXrEqAdOToUP7ubJ3+EUez4554ouloGovsV2x1HVo9oXN98kh3qBpaq5S0IrbbEWoKkA==
X-Received: from ilbby19.prod.google.com ([2002:a05:6e02:2613:b0:3cf:c127:d037])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a92:cd83:0:b0:3cf:b571:c08c with SMTP id e9e14a558f8ab-3cffe3d1bc2mr218960215ab.3.1738618645230;
 Mon, 03 Feb 2025 13:37:25 -0800 (PST)
Date: Mon, 03 Feb 2025 21:37:24 +0000
In-Reply-To: <gsntzfj91fbs.fsf@coltonlewis-kvm.c.googlers.com> (message from
 Colton Lewis on Wed, 29 Jan 2025 21:27:03 +0000)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <gsntwme61zhn.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [RFC PATCH 1/4] perf: arm_pmuv3: Introduce module param to
 partition the PMU
From: Colton Lewis <coltonlewis@google.com>
To: Colton Lewis <coltonlewis@google.com>
Cc: maz@kernel.org, kvm@vger.kernel.org, linux@armlinux.org.uk, 
	catalin.marinas@arm.com, will@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, pbonzini@redhat.com, shuah@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Colton Lewis <coltonlewis@google.com> writes:

> Marc Zyngier <maz@kernel.org> writes:

>> On Tue, 28 Jan 2025 22:08:27 +0000,
>> Colton Lewis <coltonlewis@google.com> wrote:

>>> >> +	bitmap_set(cpu_pmu->cntr_mask, 0, pmcr_n);
>>> >> +
>>> >> +	if (reserved_guest_counters > 0 && reserved_guest_counters <
>>> pmcr_n) {
>>> >> +		cpu_pmu->hpmn = reserved_guest_counters;
>>> >> +		cpu_pmu->partitioned = true;

>>> > Isn't this going to completely explode on a kernel running at EL1?

>>> Trying to access an EL2 register at EL1 can do that. I'll add the
>>> appropriate hypercalls.

Ooohh. Making this work at EL1 is much more complicated than adding the
hypercall to write MDCR because once HPMN takes effect, the upper range
of counters that the host will use is only writable at EL2. That means
using any register related to any counter in the upper range would also
require a hypercall. The only way around that would be to avoid using
this feature in the host entirely and only enable it when we load a
guest.

I know we don't like feature discrepencies between VHE and nVHE mode,
but Oliver thinks it might be justified here to have PMU partitioning be
VHE-only.
