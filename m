Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B2D18E764
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 21:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738360034; cv=none; b=ucZ2YrisuYziJYdBz7oLeZqVp01OMrNxfgUMVaSyDXb/sVPx7hBJmODkN69T7t/tLQp8HeM0j7kMn4bMTk3F2zBdxc9Mgruo5TmfLcfB4K8wV5cSvEFA5UZ+0cVat4CieSy65Zd4JQJiOmlGc85XoDUZ0x968S6V62CbtrPGpSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738360034; c=relaxed/simple;
	bh=TdioR9l6OB/5FZYYq0Y2pfhMgBfw74inkF+2LN9RksU=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qzmW6nPp8mMKnNo5mcqBniU2mdOmepN3ABA8pcF3Mr0VYFiS4GaYK3FkMC6daYM+9s5pT/3JPyCnLUXNqhKDtdW3AeoITbl3VM8vA91l+GIKiXx0Tupm0+0b8/wRBRGsagsk/85uri+XQ1j31E9EjgiT+HI7uuifjA7DeFLgBc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MdLszAOl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MdLszAOl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738360031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uAN6v3BNpuQVpPwS8NbavOxkp0zp31YDjnQkNM/zvWU=;
	b=MdLszAOlLOO1kKLaApNgKo9JtauX0e7krfce8nC16PT9FCq2FeGphajpaS/TkjcsArGjj8
	OArpXxQ/0AjYh3l5tlMP+I1Mm25tzsx1NB/nffs0n6/YXX7NFdjtWsUIiRfKFrQNg4DWK3
	GYtq7nqbCJ+JZ6Voa4/d2YlXIQcpl+Y=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-aF-va-0rPMG9Sl_Rt-acLw-1; Fri, 31 Jan 2025 16:47:08 -0500
X-MC-Unique: aF-va-0rPMG9Sl_Rt-acLw-1
X-Mimecast-MFC-AGG-ID: aF-va-0rPMG9Sl_Rt-acLw
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-46fa764f79cso43405921cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 13:47:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738360028; x=1738964828;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uAN6v3BNpuQVpPwS8NbavOxkp0zp31YDjnQkNM/zvWU=;
        b=kkNgc42ZtwmLIkBna3jP1bODA9aHzkk6ZViD93cqOvM1sJWyTSIieQt4oCQi//2ofQ
         s42BWWT6gd5WXj/e7mxwy75xRWOOhV9jvbP4843mHE4rybqKPVPXRCk5VvsP3XUzrTmM
         43Q1Bjb5k0XHb7FGFpi+20m1ehmgvXiV56zXyuM4yhQ8NfBH5phAFRUvxrHjsSH24r1f
         sdXjd/BbXtlVym3TzG6akHdcaqpEGtbVpbeQLM5rSNAumNSov9QtligYAJp+iVPMJwvc
         fpaPaO4Aw36XdvxtPRCbJ7iwRCcv4DcnSL7qwk9/zHie+QRMakHRNr5vWK5hR0T/FXa7
         iXrw==
X-Gm-Message-State: AOJu0YxLdLQY3hzTa+DMt+2Zq0bcPlypooPf4gBHQGGdeBekZ84qEREu
	o7LpL5SzRc968CdjoBdwK+YqWmIp6puslw4YpgXpq5r5LxaFYeb9GO3JVsA2NMzFaPUdKN+OmJi
	078n1QpAP7ObvHLdg0ClQ4/kALlhPalEJ6WPz6fQl6IJXZdTaZBjDSy3wNyzUZA==
X-Gm-Gg: ASbGncu3z6z+xtWhdjjwpQVu+2Dn7vVEkSe5AcXcBGYJtBwoiCCMqZYhYRFrktlhEZj
	iSzwFa4V0l8gBnqFGHlcax153h5UfIrpLCNGsiXyxndSeDKJsXwKUmm813v6rUVyTnv0Z5iZ1Jy
	cOmQbxg57dns1RU2MYe0YKZhIL1UakMjzPbAAYCsTpXmPWLPxYWC0ziSvtq2H5Dhz2r8fbGr2yD
	Y7Lag/HHM6gjonJUsXZOE55rwetVS/rO/VantEigoMb9GB8vE+wmNEtwTkxsWybhSN/3p+6QSBc
	dQModcbjqC8qsPFA8W7vTnGH7UWArmcWNStVk+zLhmXd1NGloXU=
X-Received: by 2002:ac8:6f0f:0:b0:467:6c18:9857 with SMTP id d75a77b69052e-46fd0b6f998mr208109191cf.37.1738360028414;
        Fri, 31 Jan 2025 13:47:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+AfguvmY5vGMQD9Z5QpI0sdjPyDZrCDWPzOIiArJYxXMcoqDFbFHB4+sG5dXzhD2VFuePqA==
X-Received: by 2002:ac8:6f0f:0:b0:467:6c18:9857 with SMTP id d75a77b69052e-46fd0b6f998mr208108971cf.37.1738360028151;
        Fri, 31 Jan 2025 13:47:08 -0800 (PST)
Received: from ?IPV6:2601:408:c101:1d00:6621:a07c:fed4:cbba? ([2601:408:c101:1d00:6621:a07c:fed4:cbba])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e312asm22428501cf.43.2025.01.31.13.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 13:47:07 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <14eb5880-7df1-4717-8f6e-e667328c369d@redhat.com>
Date: Fri, 31 Jan 2025 16:47:06 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] locking/lockdep: Disable KASAN instrumentation of
 lockdep.c
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will.deacon@arm.com>, Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org
References: <20250131165020.878944-1-longman@redhat.com>
Content-Language: en-US
In-Reply-To: <20250131165020.878944-1-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/31/25 11:50 AM, Waiman Long wrote:
> Both KASAN and LOCKDEP are commonly enabled in building a debug kernel.
> Each of them can significantly slow down the speed of a debug kernel.
> Enabling KASAN instrumentation of the LOCKDEP code will further slow
> thing down.
>
> Since LOCKDEP is a high overhead debugging tool, it will never get
> enabled in a production kernel. The LOCKDEP code is also pretty mature
> and is unlikely to get major changes. There is also a possibility of
> recursion similar to KCSAN. As the small advantage of enabling KASAN
> instrumentation to catch potential memory access error is probably
> not worth the drawback of further slowing down a debug kernel, disable
> KASAN instrumentation to enable a debug kernel to gain a little bit of
> speed back.
>
> With a debug kernel with both LOCKDEP and KASAN enabled running on a
> 2-socket 144-thread system, the time to do a "make -j144" kernel build
> was 18m40.641s. After applying this patch, the parallel kernel build
> time was reduced to 17m35.136s. This is a reduction of about 66s (5.8%).
>
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>   kernel/locking/Makefile | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/kernel/locking/Makefile b/kernel/locking/Makefile
> index 0db4093d17b8..8a588b0227b1 100644
> --- a/kernel/locking/Makefile
> +++ b/kernel/locking/Makefile
> @@ -6,6 +6,7 @@ KCOV_INSTRUMENT		:= n
>   obj-y += mutex.o semaphore.o rwsem.o percpu-rwsem.o
>   
>   # Avoid recursion lockdep -> sanitizer -> ... -> lockdep.
> +KASAN_SANITIZE_lockdep.o := n
>   KCSAN_SANITIZE_lockdep.o := n
>   
>   ifdef CONFIG_FUNCTION_TRACER

The rationale behind this patch is due to the fact that a similar 
configured PREEMPT_RT debug kernel is found to be about 3 times slower 
than the non-RT debug kernel. For the test same system, the parallel 
build runtime is 59m56.722s. After applying this patch, it is reduced to 
38m3.348s. Its more than 1/3 reduction is more than I would have 
expected. So the lockdep code is much more heavily used in a PREEMPT_RT 
debug kernel.

Cheers,
Longman


