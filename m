Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF22F2192E3
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732554; cv=none; b=JWg5OBCoquvKYvKNTfBtTY3xg5Ak39biuzRDNVjgaewusCd+NmGtLXdCe3BOcM9X7werMrfTo/dBcx0xmlZTs3rGKyG+gOmSRQAeXRmM/ybyfRs+mSbpAjuj3ZMpPgkpbpyVfHxfkb8Fdqgi6UHrpLj+Rr4vY4UG7DWv7eQbrg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732554; c=relaxed/simple;
	bh=hAxmmjzsAYVT1sNDVLnxaei5u2Ja1JhgSPN81JIqWV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDMoNqeDQ46j5x8boyd2IG+2sFQ7VN5q+c3whXVp0e+78rwojBTu6+jh+jht4vLXlR/ALIoRO3uFbiDb3LZTuswu18qtHWppJy7Vd50fTKS3RyAqh1VXhxzBUl3SFM/92bXW2N5QHTwpKpvR+/m/qwFeWOKaa0xbZq3ZiDZ7YKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZvvjKpOW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZvvjKpOW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747732551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KhESp3G/SIa6HPbqoYw8chTa3J1tACi3fMTgeUE9g64=;
	b=ZvvjKpOW+LUfi3W2Eg1VIvsiZoYXQ6KaA+NRfNTB7PLsjneGvgWxHbozH/hINiADCa5SII
	OugWLx7GCxKPWUrx6J4grYIqLcg0yTzqKLtvjWBHdXDgEyeQlspR2LMDPthBvF60mxbXx2
	nj4FQU4MgdBdiAFAuqgqFz/3x2b4dno=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-u2iH8ojFNf2rkB5P_rNygw-1; Tue, 20 May 2025 05:15:49 -0400
X-MC-Unique: u2iH8ojFNf2rkB5P_rNygw-1
X-Mimecast-MFC-AGG-ID: u2iH8ojFNf2rkB5P_rNygw_1747732549
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-30ec5cc994eso2188910a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 02:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747732549; x=1748337349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KhESp3G/SIa6HPbqoYw8chTa3J1tACi3fMTgeUE9g64=;
        b=BsHBR6PHwP+/Zwu974VhC9/SPnRC5UXeEm/TRyTNqjht92Gi+zC2NRhoiMn4PF29Vo
         2Vnxr9fSHTD7iEw5coI6uGtnc22MweRHg4iMvSOwLpTdO/0t9CjD/PS8guiKNx8h7SPv
         VY+/O/JvKMPDu2G8kiXPB2eP/lymrJSWvfhO5DLad1vvTjbboJo6HQ6OicGP8QF6DPjy
         nHng8M6ggsIMv0yDLQ6RrJEhKLJikYlbNL22aAEzRKxojcXQsR4aDFecxjel1YOV6PD8
         JNKmQZbx1aTm9Kn6TN1zX2k5wm4T804wWzja5/2cDWxjifFfU2vgV5q4djyz4MBEp0JS
         LsHg==
X-Forwarded-Encrypted: i=1; AJvYcCUbCI9OmydPmpT+oRBsUG/S/jvepZiYNoq9hHKfNuJAqTiW6PXY7MixBgtIQZ6pzZ5Ej7nOqPk3Pc2krng=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ+YW96RQv547rPy8fqThgTl19d5UTsYr/qe9HgckN5lk6y3x8
	SKnTDN4bvzV61L05W9ALhGhNB83rA3bqgZAa91OOIGFNssqeSbmx935uZEiMf8ywjhbK25Otjoh
	DEDPJQwUp+UHUBjcMOC0s/D0tSQbTxwKKBVTS50vzr/gphz5Glz1yjSMxocXn1mYs6g==
X-Gm-Gg: ASbGncu5jzcUaEgtL4J3m/LwD4EEVYG2y6AnfeWfLIDCnQd+HoQx/PNis81u+31SqCq
	0eBhvyowaaeMMJEoKn9e943iV48sZrpeGOl8pXcdwi5q5GsV1CbIaiZaMuN9Uz5c49m5joCqf5E
	73SOL5ipTBd8CIFm47f9WIzKusGq3KcpOWDtvcFTer/epE939JSwMXxNpGtqGEImZAqwrkM7Ir8
	RzIEp3hQJz8KWiuoh9/6t7lQ3cCnbjYayA1rzU6pNKIdEM7BT3IW3atceiuJ+fgq6s3UPyNNG6v
	rBg=
X-Received: by 2002:a17:90b:2e42:b0:2f5:88bb:118 with SMTP id 98e67ed59e1d1-30e7d5aca5cmr21330346a91.22.1747732548829;
        Tue, 20 May 2025 02:15:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxay4p7pv52Vodnk4Tfn2ozXI0HmKtyE04pWaZsFVCaSe4/2BLoC7rn0Est1OtxnsGuBJXMg==
X-Received: by 2002:a17:90b:2e42:b0:2f5:88bb:118 with SMTP id 98e67ed59e1d1-30e7d5aca5cmr21330307a91.22.1747732548461;
        Tue, 20 May 2025 02:15:48 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36368bb0sm1213053a91.10.2025.05.20.02.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 02:15:48 -0700 (PDT)
Date: Tue, 20 May 2025 17:13:28 +0800
From: Coiby Xu <coxu@redhat.com>
To: Kees Cook <kees@kernel.org>, Baoquan He <bhe@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	fuqiang wang <fuqiang.wang@easystack.cn>, Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>, 
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v4] x86/kexec: fix potential cmem->ranges out of bounds
Message-ID: <gxysezp2tc6qtb3o3wpdsk7k4aijxontf3ozfnhn76giobkefe@v2vkfov2tcck>
References: <20250507225959.174dd1eed6b0b1354c95a0fd@linux-foundation.org>
 <2754f4evjfumjqome63bc3inqb7ozepemejn2lcl57ryio2t6k@35l3tnn73gei>
 <aB3RqS85p6DiHKHm@MiWiFi-R3L-srv>
 <20250509183518.bf7cd732ac667a9c20f1fee1@linux-foundation.org>
 <sn775iwfnogyvgxetbcfneuuzsnr5wva6kc4vachyzc7r6uhfi@ozhimoihtk4b>
 <aCaycGEtgNvynjNQ@MiWiFi-R3L-srv>
 <202505161616.F4C1BCCF6A@keescook>
 <aCksAsgAw1jsGBL9@MiWiFi-R3L-srv>
 <202505190716.B21F11984@keescook>
 <aCtBf2LqRqlWXaUp@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aCtBf2LqRqlWXaUp@MiWiFi-R3L-srv>

On Mon, May 19, 2025 at 10:34:39PM +0800, Baoquan He wrote:
>On 05/19/25 at 07:19am, Kees Cook wrote:
>> On Mon, May 19, 2025 at 09:22:30AM +0800, Baoquan He wrote:
[...]
>> > > I went back through the thread and the referenced threads and I can't
>> > > find any details on the USBAN splat. Can that please get reproduced in a
>> > > commit log? That would help understand if it's a false positive or not.
>> >
>> >
>> > The original patch is trying to fix a potential issue in which a memory
>> > range is split, while the sub-range split out is always on top of the
>> > entire memory range, hence no risk.
>> >
>> > Later, we encountered a UBSAN warning around the above memory range
>> > splitting code several times. We found this patch can mute the warning.
>> >
>> > Please see below UBSAN splat trace report from Coiby:
>> > https://lore.kernel.org/all/4de3c2onosr7negqnfhekm4cpbklzmsimgdfv33c52dktqpza5@z5pb34ghz4at/T/#u
>>
>> Ah-ha! Thanks for the link.
>>
>> > Later, Coiby got the root cause from investigation, please see:
>> > https://lore.kernel.org/all/2754f4evjfumjqome63bc3inqb7ozepemejn2lcl57ryio2t6k@35l3tnn73gei/T/#u
>>
>> Looking at https://lore.kernel.org/all/aBxfflkkQXTetmbq@MiWiFi-R3L-srv/
>> it seems like this actually turned out to be a legitimate overflow
>> detection? I.e. the fix isn't silencing a false positive, but rather
>> allocating enough space?

The words "out of bounds" in the patch subject are kind of misleading
because the patch is outdated. A later merged commit 6dff31597264
("crash_core: fix and simplify the logic of crash_exclude_mem_range()")
has actually fixed out-of-bound access issue as illustrated in
https://lore.kernel.org/kexec/ZXrY7QbXAlxydsSC@MiWiFi-R3L-srv/ 
Current crash_exclude_mem_range simply returns -ENOMEM when there is no
enough space to hold split ranges (I'll post a patch to prove the
correctness of crash_exclude_mem_range by reasoning about the code and
including a thorough unit tests). So I'll change the subject to "fix
potential cmem->ranges out of memory" in the upcoming patch.

>
>This v5 is on top of below patch which Andrew has picked to his mm tree.
>In there, it happened to get the ubsan warning fixed. But the hunk
>doesn't reflect it in the v5 patch.
>
>[PATCH v9 7/8] x86/crash: pass dm crypt keys to kdump kernel
>https://lore.kernel.org/all/20250502011246.99238-8-coxu@redhat.com/T/#u
>

-- 
Best regards,
Coiby

