Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B7B36124
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 03:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746068481; cv=none; b=aEmaE5ZvREKPSVMO0b9Tvx1PW4827YvfE1hMMSIQgFeH37T0CKBe6FVFKxo/a/D7Dz6lJdF+RhDTj1NHEHVvE+/UeQvLs2oEwtyXhoPi88U5jwZr7a/d/znCLUfIux5hawE38QaZn8cKQ8OaQ8mv1++G7SazyBdKTD8BwZap784=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746068481; c=relaxed/simple;
	bh=/ptZbSFI9sOT2FDVpzMMrJrZJtXi7a7ktLAYSxgGEAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EgnIFSXkVsKXsUfUPd6G2nFG0f7SRb2E/FREdl/FmAkQ/X+ewEnAwp30SFcYpUqixICTgZtcZcgUyqmmL7FX8F5GB/jjQWPpbfMIq27iMLfyLb0yNnlWWg+W+qGPsiHuUSSfUrvQQvIjlzyQbTXA1MKTjqscLH9CmDglg+9yDqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UwYIodk+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UwYIodk+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746068478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=66PeGHTOpdnar+Qa0JWdL51yAJjG/0kQaEukyiMWp3k=;
	b=UwYIodk+oevI+XQCHYJ+Y6zniECQFFhBiejemgIAUW0yLzcGZKAMZyuqcrYeeGJ35L2Q8g
	5dekDQi7vynLlhvS/IRSSCiXYiI5fgy8AC11iV46EIC7xErDC3Z72RzdmEqxEP00FKBth2
	UN6xgfOrye6HI4TXrYDSlgNcsn240dw=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-YD8jBxL-Mp673z2Ossmjag-1; Wed, 30 Apr 2025 23:01:16 -0400
X-MC-Unique: YD8jBxL-Mp673z2Ossmjag-1
X-Mimecast-MFC-AGG-ID: YD8jBxL-Mp673z2Ossmjag_1746068475
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b0b2de67d6aso561603a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 20:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746068475; x=1746673275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=66PeGHTOpdnar+Qa0JWdL51yAJjG/0kQaEukyiMWp3k=;
        b=d232LBcWQ04SW4rF5VVtnuzSwt1XZRvyDBpmrDykw3iOKZL2wOedgE3KmZR954wcCp
         nAotqF9z1lFPltS+6AAhITMf5A12ssmQEpD1ZOTFhpB4Ri6kl6ONTs4NS+/bqsYQLS/6
         3erFPQog92VOS89rnVrLroUO9kqla9pNT3EawBXRKCEuZnLMH7uCEzndv3ObjGjFR2wy
         gbbn4jOVsG4PKRYQ1D1Ad7A65VgsD2G6zuAblJHVgBG1wCvgh1Gr+i90Be1wuIVWygym
         9ZDdj1hnSS/47DYJv1K+3loAknWDoV63zNg3YL6NvlGfO3HREcmlbwixv5W/Rbv3Agpj
         EEYA==
X-Forwarded-Encrypted: i=1; AJvYcCWQCVzgRJ80l+ot6nJ59G4H274Ni25q4LPWq88XmeST54eh0cqElBW6nguTsjBGTE4DlO8p8g2U00LXNv8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwq37B+0JaTdT3u1mhRdDle6I3e8IlIvxm5a4l3j/53S+vyiph
	BC8ByvMsU6+dqQRdM5M7B2LtGUikgoayxl+jtsvA2pUykTPijCD8ZQyhbFtZm2BAC/Q4RMurMPS
	AJ1ySpWFo6HRGDUC4EC62J5r1GtXi9ogcOlboTrphxutE6U89VmL/PoXLl+tAdQ==
X-Gm-Gg: ASbGncswlrEZoVDwxMw7XUtks0rw280WKEeb1v1LxNv7WoKzM9/5opSgF6Pb7QGrVkB
	TlTWu4w4SxZEUyxVAtQu/kX1MyChQmEowQVdmKqnpscXMRiL2QzAKN+9SmaCMK1BP+WZtkofbR1
	ZRYxaGG2dilBT1OAF09XKuqLu9iFlLK/SRTzoBskeG7Tb8bb1I+qJByTSHulgWW/z7bO/lHQW/+
	t7hTvPzdYDDXgzzN9Ozcyou8XNLPKqS/j3cI1jTXegne8PybpEwkoustpfhpMuFOuvkvtIYlqkm
	fZGckLyXHXTv
X-Received: by 2002:a17:903:3c4c:b0:224:256e:5e3f with SMTP id d9443c01a7336-22e040c6e79mr22292975ad.25.1746068475343;
        Wed, 30 Apr 2025 20:01:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZAaGsqWilNG9nKIQwO6WjMhMxoDtCPFtqO+KYQXEgWxu5s0tu5Q6Ot3OxM8Xca9EYb2dyqQ==
X-Received: by 2002:a17:903:3c4c:b0:224:256e:5e3f with SMTP id d9443c01a7336-22e040c6e79mr22292615ad.25.1746068475064;
        Wed, 30 Apr 2025 20:01:15 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e0a243e82sm766515ad.2.2025.04.30.20.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 20:01:14 -0700 (PDT)
Message-ID: <fd1936c7-cc82-4dd9-9bc0-2b25a3bbbb91@redhat.com>
Date: Thu, 1 May 2025 13:01:06 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 33/43] arm64: RME: Hide KVM_CAP_READONLY_MEM for realm
 guests
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-34-steven.price@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-34-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 11:41 PM, Steven Price wrote:
> For protected memory read only isn't supported by the RMM. While it may
> be possible to support read only for unprotected memory, this isn't
> supported at the present time.
> 
> Note that this does mean that ROM (or flash) data cannot be emulated
> correctly by the VMM as the stage 2 mappings are either always
> read/write or are trapped as MMIO (so don't support operations where the
> syndrome information doesn't allow emulation, e.g. load/store pair).
> 
> This restriction can be lifted in the future by allowing the stage 2
> mappings to be made read only.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v7:
>   * Updated commit message to spell out the impact on ROM/flash
>     emulation.
> ---
>   arch/arm64/kvm/arm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

