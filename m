Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986352A1CA
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751208572; cv=none; b=YCUPuDHAU69ynDfV8aXsRsdAWejOPbnJSQdXixpXdISPbx/IY8IerK9ILHFffL08MXk4y1JJLXwKlTTCpG2+dWjMecODGLWdlyXuSnR6H8ozLlvqaxbXMRV6KcivnRnqw+IqYzuCU5EMVZ5KSPSCU2Cd1//W6PuWIaNT9+VLY6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751208572; c=relaxed/simple;
	bh=cvh/eRSTCF7UEu5QBsgWoqMSWqnvc+vpBtIM/odhqtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxL5hhm3LdhvetNuDnXkqggB88JRvcWxZtvhjDc+u3lpA5ARLBCaqVOJuX0ygDsvaJBIj4SKzR4jo4z68rDhm+XEf4Th/RHeVVehmMvDQVhH+YPWy8ZpBMW1cNZtHOmocbLNC7HS8u8ipA4wtNMFLZNF1c5iCImiX98H4899kXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EmEHIpU+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EmEHIpU+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751208569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FMo4hXlw+x8qKQedb4fDzGU6UZAlnq0HY+9C+6mhqr4=;
	b=EmEHIpU+b/UG1ll/DGsawZK4uSHSUmGdZNpFKdiH8+PbnETEIQFhLQwcYCaRazIHEpZuus
	ZxoznlT0/epNGMhSwOpfqjnYVruQmmMd1nxlL9Ubv+UbzXN8oWMd4g7HatuEJ3Cw28yodQ
	LYb57IGmQwo0hT618D6ecINDqwZAnoE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-Ih9fTcfoM8eTyGBqk183Jw-1; Sun, 29 Jun 2025 10:49:25 -0400
X-MC-Unique: Ih9fTcfoM8eTyGBqk183Jw-1
X-Mimecast-MFC-AGG-ID: Ih9fTcfoM8eTyGBqk183Jw_1751208561
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a6d1394b07so2300417f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751208561; x=1751813361;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FMo4hXlw+x8qKQedb4fDzGU6UZAlnq0HY+9C+6mhqr4=;
        b=AmA7k2KSoBWh0rCDuumjy4+cc7X6gRgonHqXeGSlAV9DQ+dC0ImBj/r3ombfGeLUnB
         ysuxRcyh1JY/FYAtMQkjCETdGJllnLZO51Ow4okg4thfNCw2xLROsrvN0qVd/B7B46qC
         AH0Veai1CUBjXv3p5zdYyWNIdy950uQFLO8nvLJ3bqk88as6Jb4fopL9CzDr5yliUIG1
         cTQnvkYOvzIFz0g4Y93SxwL+IZov7cNmKbUJsNkYMUxWSfMUVp4UacJ7hhU2Ta7zzvEb
         a6iBcHzEFdhL5LXFwSXBODhGLRD2fw6RvL4ergtkbJrT0xoLg4ZCdGgiYS71M8eHoxOy
         uuHw==
X-Forwarded-Encrypted: i=1; AJvYcCXjtqO8WwkpO4frf3ipGeOqVC1+0TPbhVNiYhe+f1nWV0V1K2leNSR2ngKBsq5nJZW9uuka0xWR6ZFC9j4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCfMQvT9TIXqepuPdslZyQy+Evl+UgNidaE/E7WV9wUNikor79
	1CDHt3H4l7nG9RJYsBS1JnJ13Y+4T7as4LWIWMfSpYBmfEtE+FEjVworQ/J+F/z1C9w8SPNTWPQ
	fGMCaD5YPUFZBS+0X/eh8feVzDxomCcSDylsJfHC2ETcsywQJG690PdBQKldAHoXGnA==
X-Gm-Gg: ASbGnctCin6vabcmALuNx7rNLNhtD3Bnp42NPFX29ADgcHCgC0vewDP54Uz0o/to7b1
	j9xpDqPVencwDf0Rdu/bJ33RFlQVCxSiYOVp9aHspyoy16175bsCaeyckb3tt/KyH11mMyWqdM/
	nYIUI/wIckZg5Hcu3FqiVa/A/ZNARm75cHqTtUhIKcwGtKlkfITNb7mgU3K+yXMN28wPQLkbPGe
	8RDgvTSvE9o4no5xcH0ZBdOXNMFrYtfFDKyjED8M9PL5ZniUU8BjfuL4ui7Ne4e5GROUU6As6RH
	Wu4bCS8ECOE/hFpJJvHQASQkXgN5X7QPDF2lY7ls3i4flshKJnUdERDJgyXwQA==
X-Received: by 2002:a05:6000:40c6:b0:3a5:527b:64c6 with SMTP id ffacd0b85a97d-3a90d0d6ce1mr10106124f8f.1.1751208560864;
        Sun, 29 Jun 2025 07:49:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEglecXEkF/z7cvyPDkLXht+rIkJ5l7TX//baZlvQGm4Pvn+sfnI3+HYTKX4a47o/g4mXZXLQ==
X-Received: by 2002:a05:6000:40c6:b0:3a5:527b:64c6 with SMTP id ffacd0b85a97d-3a90d0d6ce1mr10106102f8f.1.1751208560423;
        Sun, 29 Jun 2025 07:49:20 -0700 (PDT)
Received: from ?IPV6:2a00:79c0:638:3500:abf:b8ff:feee:998b? ([2a00:79c0:638:3500:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa8aasm7826048f8f.27.2025.06.29.07.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 07:49:19 -0700 (PDT)
Message-ID: <b7fafea0-2a0d-43fd-a3a9-847d61273cee@redhat.com>
Date: Sun, 29 Jun 2025 16:49:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/42] drm/gpuvm: Add locking helpers
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
 <20250629140537.30850-3-robin.clark@oss.qualcomm.com>
From: Danilo Krummrich <dakr@redhat.com>
Content-Language: en-US
Organization: RedHat
In-Reply-To: <20250629140537.30850-3-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/29/25 4:03 PM, Rob Clark wrote:
> For UNMAP/REMAP steps we could be needing to lock objects that are not
> explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
> VAs.  These helpers handle locking/preparing the needed objects.
> 
> Note that these functions do not strictly require the VM changes to be
> applied before the next drm_gpuvm_sm_map_lock()/_unmap_lock() call.  In
> the case that VM changes from an earlier drm_gpuvm_sm_map()/_unmap()
> call result in a differing sequence of steps when the VM changes are
> actually applied, it will be the same set of GEM objects involved, so
> the locking is still correct.
> 
> v2: Rename to drm_gpuvm_sm_*_exec_locked() [Danilo]
> v3: Expand comments to show expected usage, and explain how the usage
>      is safe in the case of overlapping driver VM_BIND ops.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> Tested-by: Antonino Maniscalco <antomani103@gmail.com>
> Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>

