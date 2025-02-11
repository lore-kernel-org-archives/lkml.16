Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742A41EF0AA
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 12:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739277806; cv=none; b=ScYdMCkVxX1wHP+MlyOAUeYO9CLmAZsFJgeJXOfPUUv0NMGFRj0jbCpe32lTyFP7yK22DxNa1C4xB7yraccZpD+Dn6+BvyNRpkLx5tGBmFv2+RCAmLc7GHDZQHDZ0oD7/ARJukGy7X8sfLYrCJCkmJjDFqRp0fCfJnkl38F1C4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739277806; c=relaxed/simple;
	bh=ZaDynmUZpB3fgf+ccdlspZi8D8W0GokI4Rg3ucKPjTw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jy6wrfcA3yWxlK+mFskZHHKGM64yJbNEyCmC+jt1Bu/EYI+HPb1nMaPoXik13VZsHMOpr3oM9drnSfCsqOK8ariQmEIjmhustpEhLRTL+UzjhhUsqyqiyrcfjx+zDq4VljxTO5qAWKNtLfkuo+FpWtwDGvt8A3kLRN2ZoHoh7es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q7mq1vEk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q7mq1vEk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739277803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fl8OSnLCA195UnsHqHADtSdhh5YuMF6KeCEzc0u9BFU=;
	b=Q7mq1vEktqkfvEQecyoD8nS0KH4UBeuR86G2L8jiGC78yi73eKH1LDYpf2kUupl8B3XrmN
	eoc9hQIKYlZAEYCE3TdPs/xEBDzvUJVT2rAZyzQtrwCI5Sp5AgKNmCbWRZlEvvDAUdBfWA
	hbLl/ikcmiwDx6mgCmV0wflpyZ66Mo4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-LdjSg0oZOCOCXSnfmSnpnw-1; Tue, 11 Feb 2025 07:43:21 -0500
X-MC-Unique: LdjSg0oZOCOCXSnfmSnpnw-1
X-Mimecast-MFC-AGG-ID: LdjSg0oZOCOCXSnfmSnpnw
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4394040fea1so12193935e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 04:43:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739277800; x=1739882600;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fl8OSnLCA195UnsHqHADtSdhh5YuMF6KeCEzc0u9BFU=;
        b=ASBS+0gQYfXzHnefF6ZTA2Zj1ndTpONKFHIfXroLRk44khbXWJcbQd+X/MwlOCKexZ
         9otg/YNKIaYGGqzb2Hh5dBc76lxorAT3u4ytiLZSOA9jSky6ZSlGOy5Dz9CeIkmbdfUN
         /ZKSF4GZNoeO2YB9Ggcwsc6RJDj/VwTb9SBPiunXeXp0mJlwhX5QcQS7Oiu+N/H4yVRI
         PG2dfIYzzLS4ywbL2P6jaD84Hsg+tyA5+Gz0y2Ua9f3IOBaSmxeAsjhojE07feovIbGA
         rsiJk7NUtT1nUTczNVTBl1ZhppSWQE+y1FeDsFsDo6PYhiksDPa7w0xY+AwzqllUhNJn
         N/oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA6DNP8NscvPKJrdXKxq786WSZdE1lIlkIrF+6qp0D0QKrfme1BoVYWj/XyIwgsI5lXje0znKeL0Mq4AE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFmpiXcxANkW1EE8VydeaEQilm5v07DmvEEDELF5ruSKbUuQCk
	f+9D7rGX5kSD4/LFn9hV9T8OlDFe4ZErjWmP1Iv+GSq08LJrAzF/L6jAIMJQaPo5d9/7YmgT3/I
	1ExiukaxW9pqvWLw09a68aI4Qlfy59PHxCyxi8LOaxf1ihEtYQcS3b+RbNB9BOg==
X-Gm-Gg: ASbGncutLA0gEbPMGskv7Oy26vRIyalDlxyV2V28uUzhmRcvt4bTL56aBtljiEM0Rj7
	DasBqvUNxUOLU8KKLvxXtvzydP+4AoYdq59Q/Qi7X/H2DDGNFJK/maRliQdteDQQv8yTw9lkH6i
	bSK/ASn+2cK42jNLX6WOkWnrhW/YY8npWTY73KLmtSF6fcPcpSPs4PZ7ZcYpVR8bDDlJeaqW9IF
	Df/sc+bdJOe8SujMpQkcfqh6h+pQm9SwynZWClXkiuLz3zu5at2NsvjYfcnzormLBtf713IHGA4
	pYyHg4N5dogQDAo36SVGpmrj+A4m9dHEyra73NFpm9Ohg3bhKVOS2Q==
X-Received: by 2002:a05:600c:2053:b0:434:e65e:457b with SMTP id 5b1f17b1804b1-4394ceaf842mr28612865e9.3.1739277800598;
        Tue, 11 Feb 2025 04:43:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEk//W2BZo5OkvrLHLvMbFfjLDfIdPmBrP4srGuM2VWkzHyhBkqsKX8bhs4FGGa0+OXOscEUA==
X-Received: by 2002:a05:600c:2053:b0:434:e65e:457b with SMTP id 5b1f17b1804b1-4394ceaf842mr28612595e9.3.1739277800283;
        Tue, 11 Feb 2025 04:43:20 -0800 (PST)
Received: from rh (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc5a8a9e4sm13420373f8f.10.2025.02.11.04.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:43:19 -0800 (PST)
Date: Tue, 11 Feb 2025 13:43:18 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Oliver Upton <oliver.upton@linux.dev>
cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
    Suzuki K Poulose <suzuki.poulose@arm.com>, 
    Zenghui Yu <yuzenghui@huawei.com>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, 
    Cornelia Huck <cohuck@redhat.com>, Eric Auger <eric.auger@redhat.com>, 
    linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] KVM: arm64: Allow userspace to change MIDR_EL1
In-Reply-To: <Z6pBd0XgEvrMoLcS@linux.dev>
Message-ID: <99f6301e-69dd-47e6-2cc6-10f44f6760cd@redhat.com>
References: <20250210154953.27002-1-sebott@redhat.com> <20250210154953.27002-2-sebott@redhat.com> <Z6pBd0XgEvrMoLcS@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

Hi Oliver,

On Mon, 10 Feb 2025, Oliver Upton wrote:
> On Mon, Feb 10, 2025 at 04:49:50PM +0100, Sebastian Ott wrote:
>> Enable VMMs to write MIDR_EL1 by treating it as a VM ID register.
>> Since MIDR_EL1 is not handled as a proper arm64_ftr_reg apply only
>> a sanity check against the writable mask to ensure the reserved
>> bits are 0.
>
> How exactly does the VMM's MIDR_EL1 find its way to the guest? VPIDR_EL2
> is still set to the hardware value.

Ouch. Completely missed that part, sry.

>
>> @@ -2021,7 +2037,11 @@ static int set_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
>>  		return ret;
>>  	}
>>
>> -	ret = arm64_check_features(vcpu, rd, val);
>> +	if (skip_feature_check(id))
>> +		ret = arm64_check_mask(rd, val);
>> +	else
>> +		ret = arm64_check_features(vcpu, rd, val);
>> +
>
> Can you add a new implementation of ->set_user() for MIDR/REVIDR/AIDR
> instead?

Yes, sure.

>> @@ -2542,6 +2571,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>>
>>  	{ SYS_DESC(SYS_DBGVCR32_EL2), undef_access, reset_val, DBGVCR32_EL2, 0 },
>>
>> +	{ ID_DESC(MIDR_EL1), .set_user = set_id_reg, .visibility = id_visibility,
>> +	  .reset = reset_midr_el1, .val = (u32)-1 },
>
> nit: GENMASK() instead of truncation by casting.

All done. I add a test and send out V2.
Thanks a lot!
Sebastian

