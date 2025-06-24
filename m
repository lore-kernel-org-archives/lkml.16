Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96B327AC28
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756819; cv=none; b=OrId+ujxnZDgoIvJkStM5NIQpFGNKIMW+XEQ9YF97WjRTzFdw9MfA7218RIQC+QD4RLOTREmu4lbslxXlMBwD7xy4N9slnhDFKK3TTcWEMvhjxWzXBLcNKeduD6YXJqxNCWuzwv7+N/WTxGDuUJlDvwfqSrk6UliLY4sQCqM/F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756819; c=relaxed/simple;
	bh=r7b9+YdEXsnWpLlEGtT7fhWq6i3byVNh3eeoZJlx1pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ce1rzZOvWQ5mEmU7xMZnMzqKDAAHYbj+Tu8Y/bW8w0qkPDBkcOdJ/dJz6AfpyJGz5kHKi/+D1HuIjzxJpt9qpAWEkJ/N6YcGbiOmXSuMrVjWgrkyeeOrv7PzVgI1EpG/h0JdlCZqojGo/f8xgbmeAVBNmB8TFeU1kvBJM9u4yO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FiKd6Dyk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FiKd6Dyk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750756816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0jdlbyzwhOvR0TOSckRhTiUQnf05D9iDWTr7qMjHW2U=;
	b=FiKd6DykwVcBqYb8pTfsG0o7MPVFM9KzmQVx7w0+tr7VwOcC6qN+9CJxXau8WO0NPawKES
	HWDn9Mc6AxQ8fhkKUZhhJsJRJZZ5GLpkQbI9aB6Gx4wF/pFFRM7+aOUDItjYhxtpiTyxbY
	rx5vvc1E27oBuQd0SPEh0YosJHTPTXY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-8ZHb4k9NNJe7QcAG0M1cqg-1; Tue, 24 Jun 2025 05:20:14 -0400
X-MC-Unique: 8ZHb4k9NNJe7QcAG0M1cqg-1
X-Mimecast-MFC-AGG-ID: 8ZHb4k9NNJe7QcAG0M1cqg_1750756814
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f65a705dso2819512f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750756813; x=1751361613;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0jdlbyzwhOvR0TOSckRhTiUQnf05D9iDWTr7qMjHW2U=;
        b=VFS7V3afzyphSGm9wkL+Tp3lhxlpAE2DVdSsq1NhXhMcN3O/95NUanSQd8RXPq/79u
         9robnH6GWbZPglTMmRhbw0KXJges8qLpIxdTQfTKYjqm3pjjgCTJ+7ogfS+0tj+WzGq7
         Y1TipPIqVnAPElscbFctNo9G4eFbiIsPV2ORGQo2cL/aXbjENw9BbuOtdxU/aCPAGAih
         i7X0j5y9JFTl+QFR9q62NAMJmaAoqEGOG2GSa4iVscJswa/zz9V5vLuQRB2l4O4O6hhm
         xCsVDtVfcaTsU+UAPmQgTZ9AVBcJSTf7Z0RKeOvV6ipyRaVqO/jTfP9QMNL7CGbx5IUG
         3KwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz7fQwUxHmLO8NAbNqb1EwqxB8XnBouUgZA9UCb2DB1mHeFCEFmBXjE6qdDiygCechjvW9SgpFpWkF3n0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz3qPbV+eLTlFwAZh2UGLFPsfs2A/BK0j7GN8cY+xVHTx3Ah4F
	a2KIv+vPFZPKYFXLDkbgf/EUwSzf6SJWchSWFSAi2OoLbtz120JkH4S75yvAumntl1729bCTaC5
	ExcTg7YB/RKNXm9uCTdpO820VIKeJGvtq4p7+mwu6bVHDph4twwRyqGQQ/Ckf8RBesg==
X-Gm-Gg: ASbGnctquCCzpjl7c33kBYdkCvhRh//PCl9NvgCVJZGuTnsoGFCvmuCBQVEPBcK/oFZ
	YPkCNhYkbRw5DOdjIeQVwDNp0JJjJ33HWGuPCOYC614tNj0uNiXOcZaSqXKXXtmAGcpSKsxZDfO
	ECIuai9mUDbbDws9xybVO99sJtmeeSh75EDswJnzxSqPDmaI/gt3Fuqaq4rn8V54OGv2EoRZ779
	brtWK4wP6uZvtgyowDcXComn9IKdLJNhZDyEFZE+B80QLvnQWy4R3scFmkT/qNxbG5nAsOICiK5
	lP6YNuh1ym1X212AJHBSUh3T6O/em9VQy34gHE6G627aQZco3G8fPWOVn/Tszmcq
X-Received: by 2002:a5d:5846:0:b0:3a4:e6e6:a026 with SMTP id ffacd0b85a97d-3a6d131708fmr13847255f8f.28.1750756813575;
        Tue, 24 Jun 2025 02:20:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG90ssd/Q7UJyYLoQ/soeF+R1DyWoiSsSC9z7zTe1BY8pnooxTi/4aCxQxIMA8YQroBd4jqAA==
X-Received: by 2002:a5d:5846:0:b0:3a4:e6e6:a026 with SMTP id ffacd0b85a97d-3a6d131708fmr13847222f8f.28.1750756813145;
        Tue, 24 Jun 2025 02:20:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e810b140sm1417562f8f.80.2025.06.24.02.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 02:20:12 -0700 (PDT)
Message-ID: <55346a73-d20e-494a-a287-6874216457c8@redhat.com>
Date: Tue, 24 Jun 2025 11:20:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KVM: arm64: vgic-its: Return -ENXIO to invalid
 KVM_DEV_ARM_VGIC_GRP_CTRL attrs
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Jing Zhang <jingzhangos@google.com>,
 Kunkun Jiang <jiangkunkun@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sebastian Ott <sebott@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Keisuke Nishimura <keisuke.nishimura@inria.fr>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <bbbddd56135399baf699bc46ffb6e7f08d9f8c9f.camel@infradead.org>
 <5e22442e-ddf8-4f5d-b7e4-5e2c9bf783b0@redhat.com>
 <0f86df0c2866114898da1e9f4274e23b3d1c38b4.camel@infradead.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <0f86df0c2866114898da1e9f4274e23b3d1c38b4.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi David,

On 6/24/25 11:01 AM, David Woodhouse wrote:
> On Tue, 2025-06-24 at 09:25 +0200, Eric Auger wrote:
>> Hi David,
>>
>> On 6/23/25 3:22 PM, David Woodhouse wrote:
>>> From: David Woodhouse <dwmw@amazon.co.uk>
>>>
>>> A preliminary version of a hack to invoke unmap_all_vpes() from an ioctl
>>> didn't work very well. We eventually determined this was because we were
>>> invoking it on the wrong file descriptor, but not getting an error.
>>>
>>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>>
>> In the corresponding doc (virt/kvm/devices/arm-vgic-its.rst)
>> it is said about possible returned values:
>>      -ENXIO  ITS not properly configured as required prior to setting
>>              this attribute
>> which does not exactly match your situation. Shouldn't we also update
>> the doc or change the returned value?
> 
> Hi Eric, thanks for looking at this.
> 
> I think this is OK because the -ENXIO return is covered by the high-
> level description of KVM_[GS]ET_DEVICE_ATTR in virt/kvm/api.rst:
> 
> Errors:
> 
>   =====   =============================================================
>   ENXIO   The group or attribute is unknown/unsupported for this device
>           or hardware support is missing.
> 

Ah OK I missed that. Anyway that's not a big deal I think.

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


