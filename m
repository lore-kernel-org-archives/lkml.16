Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CDE28C2B6
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 14:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746627321; cv=none; b=PhkNn6Aqf2l9ODvEUlzBX6LJ4FwU3kKsQvbnoGkWc1ZrNSNlXwwXZMHdtcw7tW73DmPx1lW9Cg4BJVFyRLWvS4547FQTukDE0vAan4DNqvw0QWkP5gjqEgr+za20VY9QmOGighQnDv6/n0urba3uUnK8vfV3ZKgpuw424r1Av5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746627321; c=relaxed/simple;
	bh=jvV8SAceXWq2LG1ocRLBnIabfhFhDm+ru/WXS6Y4/ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y3HbEg/ekmZyWiIAm6Ub50fxkj9XR9VWtKHWJmebf/zmessZGrMyRtvTSoVDlA7Jsgk6D9ggDEktpNf/PMt//a2unJi9u6Ufo9SBBrBwT3hWmRyt8yFAH7biy+yHvl8Q5HaYZ/7VJXVRTDUT/grgxILZ1Drllv++zR+ZF1NyZk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gw35g0YK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gw35g0YK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746627318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IR4sYe4zuV+MgdFUj0SEQEMny2GtXp9mBqrR8ByAWsg=;
	b=gw35g0YK12o4O44PNnLcsoK10pYUdgreyRE/6mujFG/6sGStrZFXAI2gxOpW5RYT8mLBCX
	RY3hF5HPHXy4u5VlIcmGGcfWwch1zQAJeZ16QjLm+eqWR/yrXLBmpqAwqgBscOAG2mj1SQ
	kauh1DtfITGkMAb1hj7x2fAYKzkicSY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-eYBovbWJPDmXAGTsdSBKsg-1; Wed, 07 May 2025 10:15:17 -0400
X-MC-Unique: eYBovbWJPDmXAGTsdSBKsg-1
X-Mimecast-MFC-AGG-ID: eYBovbWJPDmXAGTsdSBKsg_1746627316
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43eed325461so38906255e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 07:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746627316; x=1747232116;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IR4sYe4zuV+MgdFUj0SEQEMny2GtXp9mBqrR8ByAWsg=;
        b=KP/L/vPJoFSyYZMMmAp9qiEp8DPMuHMD9XBk54X4dbqWZ6Bu7zT03cPHxkAnhsoI+h
         ewBOjEkHDpz+LQZkmf5mdIH2XpeJipSClbrBHiFeGTlrIbxPTwD+sVnnWmsmIde5zsvk
         A7P4A8qV9uAk97Bki0x2yOsxT9mefJLyltlTUrkH3Obqu0Jc7kIH69az7I9a00/hkr4u
         Ld6CWLmkswmjmlATVenYlAMi5KokkHV6I5A3j280nfS9M0lXNH0gIttDKhJhkHyQOsnW
         hpITf5Te7eN3VcCt+dTnAHCI60aUtcjhZyNvwW/mofEndGD/a3DSHpOT6w8uunZ59njO
         PShQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGgnH0XkPw0UyOpc1BpH68escSo/eW+43xdb7eKS/KmcZ1DrSjtKAuPc3IbTcdcdXQSUxqWFVpRYxujNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdkTvl1ulVf8zh0zleL5E/f/ZTO9WknO7Mp73AHVew9pbduAYa
	AtI1I6omupnCyhamD6aFa/nBZlblJlOiqWPGPruZwehtQwXc58PLcID75XehJvhyDtiJZ8QVaeA
	/rVJzHY35q2SBPvKUslj/SG4s+3VDpKltAAgz17tEcVIVyhdxn2a/n7RtCjR73g==
X-Gm-Gg: ASbGncv7czWIiCnqAnKwpflXx7jZ7ca3DSb3Z3uQtVSKRScYgftxAqNf4+h11n9AOTO
	2JRE2N5hTEsBaf5y5wRBk2Q/aAorGxfSRAx/LjWyW0Wxea7141mT+tw9/jxOn81YW8Ux1yVwtFg
	fpeogAyGro9J0iyYHSJ7/vpiTmvb+PFM/MEwe34Jz6RjL1aKDSCu3pX+KC3A4r+PQMXhKJvfgTR
	x70MlK6WgEpY6ZvqLgPEIKneH6h5MaR94AN9QDh/715BT1wHkfBwdF4BwXeM7vKE3x60w1nfdx8
	3gBZLgM5PT0IGpalY9zXaJMa//RJln2y45+vJoy4EOd+EP9+DUb22sryilsGMTRTPiQu8Eiod+P
	bvRO5TlPjwePu5jIfU01ar8S5e6+vphpW2DEkqw==
X-Received: by 2002:a05:600c:4eca:b0:43d:563:6fef with SMTP id 5b1f17b1804b1-441d44dcd83mr25874165e9.21.1746627316007;
        Wed, 07 May 2025 07:15:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEU0Dz+x4SiNUmlpqgxEkYcd0eKKNeptqhw2nJzZPcuY/oNAzsky9GpaxoI8b3MNp8F7/bkjA==
X-Received: by 2002:a05:600c:4eca:b0:43d:563:6fef with SMTP id 5b1f17b1804b1-441d44dcd83mr25873895e9.21.1746627315648;
        Wed, 07 May 2025 07:15:15 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:d400:ed3c:fb0c:1ec0:c628? (p200300d82f12d400ed3cfb0c1ec0c628.dip0.t-ipconnect.de. [2003:d8:2f12:d400:ed3c:fb0c:1ec0:c628])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3285e0sm2477015e9.5.2025.05.07.07.15.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 07:15:15 -0700 (PDT)
Message-ID: <b44ba934-cb95-4229-89da-06b1fc1f8683@redhat.com>
Date: Wed, 7 May 2025 16:15:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] mm: mmap: map MAP_STACK to VM_NOHUGEPAGE only if THP
 is enabled
To: Ignacio.MorenoGonzalez@kuka.com, lorenzo.stoakes@oracle.com
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 yang@os.amperecomputing.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250507-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v5-1-c6c38cfefd6e@kuka.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250507-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v5-1-c6c38cfefd6e@kuka.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.05.25 15:28, Ignacio Moreno Gonzalez via B4 Relay wrote:
> From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
> 
> commit c4608d1bf7c6 ("mm: mmap: map MAP_STACK to VM_NOHUGEPAGE") maps
> the mmap option MAP_STACK to VM_NOHUGEPAGE. This is also done if
> CONFIG_TRANSPARENT_HUGEPAGE is not defined. But in that case, the
> VM_NOHUGEPAGE does not make sense.
> 
> I discovered this issue when trying to use the tool CRIU to checkpoint
> and restore a container. Our running kernel is compiled without
> CONFIG_TRANSPARENT_HUGEPAGE. CRIU parses the output of
> /proc/<pid>/smaps and saves the "nh" flag. When trying to restore the
> container, CRIU fails to restore the "nh" mappings, since madvise()
> MADV_NOHUGEPAGE always returns an error because
> CONFIG_TRANSPARENT_HUGEPAGE is not defined.
> 
> Fixes: c4608d1bf7c6 ("mm: mmap: map MAP_STACK to VM_NOHUGEPAGE")
> Cc: stable@vger.kernel.org
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Reviewed-by: Yang Shi <yang@os.amperecomputing.com>
> Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>
> Signed-off-by: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

