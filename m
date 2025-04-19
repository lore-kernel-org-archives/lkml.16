Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B90BE4E
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 00:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745022899; cv=none; b=kffFjQSAt5skU8pW+8/fcJqX7DKn92LGeeccQcVeyQQClN+O2B6VDAzXeAHqzurOmfRT6xfeLiO2YnEaNeX1RZAFrhWoxhZU/zmYEHSnJpyfPYM4/HlIOIS323QDbQ9qRT+EzDLwQeVCEECqtakquiD5OU3BM4lBA1AMthVHcls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745022899; c=relaxed/simple;
	bh=ahHG9u0rD9umDxN4xagOg4rIAlbhb7yY3RtmSc4HzfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YR1nzei3vtwCOMk0q8zR+uzuN26uZNA6V2cJSwDF8/zrf9YaO7imT38bnUdtdkySbMrFcC6o5IQo82RoQH5mZq+uqXlsSSWsT7sqyBS54CKKpK7W48hG7oi0ixWqkRB/WYtvkqXqppiIxXPe22R3DTeJ6tVmHtiWkCwklZxpjZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hg7kBFCy; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hg7kBFCy"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2263428c8baso289505ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745022897; x=1745627697; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQ0yR5jl20WEOAV0nC2Kh5pIrclrAyN7Dk/PJZDO1kI=;
        b=Hg7kBFCyBFIRu0gDS8OrQwChuQPQ5BxaFMLQmLnXex80TyPZTeLxdAu2j+PNor7v7m
         zFFCfVkPpsA7W5TTXHs93QGFi9tu3FGwyfgziV2v7AtEw+h6GCbzUsQfV1/Ci0llfpO4
         0zK6giCUsYejEN1lf6gWwPIto/L17LLplXSloIZLll0yIjubbhv84YesCUwdjHycueYC
         Rjp4lM6M12tFoWBnIzEW/1fOSxUgXq/izwBcFDS4kjse9ZDl0jMCVqCN5EwqB+J/k+hQ
         C9d5ycMa7/u0trKO+9AjSJLvOHF1jHwkozK/ue0SQPkepVAwIhuPKksdtx9XemciiUZ1
         2IWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745022897; x=1745627697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQ0yR5jl20WEOAV0nC2Kh5pIrclrAyN7Dk/PJZDO1kI=;
        b=AUCeP2zCWTrV4YQ+fW3jR24+6PQjJSxKu93H1G+k+cKfI3KpxHgUD1tCJYuL/1wcOj
         gzRVdVTyNPrX2D3Lnxk6SDtpjpX5WdMR5hApDIoTD+xAu9jig2FBAPaXSDwl67emrKnS
         kttfLJXuSJutnK3QStxlJplD3n2oEm42WHDuTw+ERbAmOiHdafvXxSnEdgyqcCj2FM9V
         xDxsET69KIEk4saZ//YyEH4XqcIbGSI9TjvO+iSDT8WUK157RrkAIj2G9ASG2kM2Aeq5
         +0ohNDhy3jUSl7a3u3MfBFa1cR7uNA9Z5eL0scXsqUY0m9KIXAw2waFTquUIy/BDp2TG
         ViQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQW5QUbqGgPxyaXu31gIn3l1iUQnH94mZ16bbbN/UCFHmDGCqX0hFBnb2Rr/NMPo7H/LNWvD+pmSaKujE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyggKcQPzUVvxeortTdRfANcoS3ckPwTdeeBpQgWCgbwRHAYStg
	ZOcJR1U6GgyRTwbD+jUkP7kdWKGHwnw2FO9+UM6d0B0Bd1eY58r68o4FrnxbLujq9icKIfaqVqf
	4anA9YIrqBzCJb8HxhEmkAunc/53zBj3xib5o
X-Gm-Gg: ASbGncsWGe8QNDCyU2NpDSJHH3mWHd8cFhc6sefWafvZf7+srYS2reI1thaEcZngDpm
	ek32DjyrDBmxjGDPutlzwtYDYvQKLlIQ7BfsHKP5MVEX0kOIPHvEryew/+PwYfMa/QOIvUa/hUy
	NLM4pHvtU5TQZO5fuXu+TMNW7WzQ/gtF/pq8F6iTYieSSigjpiETU=
X-Google-Smtp-Source: AGHT+IGvIbyVLUQqrTzMWiwcyOAnd17i902tnMA/kbj0+Mr4UoTQ/NIBk1rPd2pvIfxIF2nkB3VSPa8wRfsyVT6VhuY=
X-Received: by 2002:a17:903:1b6f:b0:21f:3e29:9cd4 with SMTP id
 d9443c01a7336-22c52a93da4mr3989635ad.20.1745022896577; Fri, 18 Apr 2025
 17:34:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417131945.109053-1-adrian.hunter@intel.com> <20250417131945.109053-2-adrian.hunter@intel.com>
In-Reply-To: <20250417131945.109053-2-adrian.hunter@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 18 Apr 2025 17:34:43 -0700
X-Gm-Features: ATxdqUGRPn-OE9rX7bFhLESbA-lhcuPVKmZ_X02BQITuqE72Tc1GwfJL8yHvkew
Message-ID: <CAGtprH8EhU_XNuQUhCPonwfbhpg+faHx+CdtbSRouMA38eSGCw@mail.gmail.com>
Subject: Re: [PATCH V2 1/1] KVM: TDX: Add sub-ioctl KVM_TDX_TERMINATE_VM
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, mlevitsk@redhat.com, 
	kvm@vger.kernel.org, rick.p.edgecombe@intel.com, 
	kirill.shutemov@linux.intel.com, kai.huang@intel.com, 
	reinette.chatre@intel.com, xiaoyao.li@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@linux.intel.com, 
	isaku.yamahata@intel.com, linux-kernel@vger.kernel.org, yan.y.zhao@intel.com, 
	chao.gao@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 6:20=E2=80=AFAM Adrian Hunter <adrian.hunter@intel.=
com> wrote:
>
> ...
> +static int tdx_terminate_vm(struct kvm *kvm)
> +{
> +       int r =3D 0;
> +
> +       guard(mutex)(&kvm->lock);
> +       cpus_read_lock();
> +
> +       if (!kvm_trylock_all_vcpus(kvm)) {

Does this need to be a trylock variant? Is userspace expected to keep
retrying this operation indefinitely?

> +               r =3D -EBUSY;
> +               goto out;
> +       }
> +
> +       kvm_vm_dead(kvm);
> +       kvm_unlock_all_vcpus(kvm);
> +
> +       __tdx_release_hkid(kvm, true);
> +out:
> +       cpus_read_unlock();
> +       return r;
> +}
> +
