Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09942F5327
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 16:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751472754; cv=none; b=l/VkNZXQ02SqvDE7IhMWHl5axvL+ujsCXQ7NvPJ/eo/ONIO+8mbTP8W02uAQ3dZX2e7TYPSesS9myVtjp2qqqIYAuiaO97h5cNo7ko+9dBEAkrhOEjd9xVW0Ic39oxgPdbMhI86PDOeWTRNkMQ3fUMp6HXa4dUFjx37l6U3JxYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751472754; c=relaxed/simple;
	bh=Sum3p1qWbHYTUe1b7sJiD0ptw0dscGjPm28F6ydHQfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksZzNYpbuEzfV1PV6n54M0BBQo+WwXKjR2PcLGxLFXUZqtsYlmO2ViwfaG0l7bcjQ7s9kE+R/MQ4XrjT9p6UD6D2fGb+KDz6Ib6bfj69RiTBUDpqrcmew+Mc7SBQNQKXFfObTUxLntxSTKL1D3dNE/tyO28kb295dk876U7s8no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XcajqwIA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XcajqwIA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751472752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fYGC1e7sjBNRXLMw9xhFOcR1EiYfaaj3YxfulV+gTOw=;
	b=XcajqwIA9l/DUbnBxhp8nJA1Tev3Qcwm2S9w796vdFBsA+k3jgYxM5J6Qi5BUfLv2M0Vb8
	hcNqJ8LNgwnA8D3W9Qed3GHq3KxkkCf6WXNl/fM+GQAOhUD1d2oBi94RcoLyxKc/xaCjPw
	fL9L8BBLDONm8NDl3SREEjZS9ftPq94=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479--8m2qAbQOU2ow48Yvjg02Q-1; Wed, 02 Jul 2025 12:12:31 -0400
X-MC-Unique: -8m2qAbQOU2ow48Yvjg02Q-1
X-Mimecast-MFC-AGG-ID: -8m2qAbQOU2ow48Yvjg02Q_1751472750
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3e90c3a81so433080985a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 09:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751472750; x=1752077550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYGC1e7sjBNRXLMw9xhFOcR1EiYfaaj3YxfulV+gTOw=;
        b=Konf+czJTVHWeYp7jltzAEUEuHKtw2Dm0etVBPLcGjY6mxtJj7WhoB9WBP1oZ8aUtg
         Shdw/7/gGH0+PGRMne6kQGPjt6ZUDT7tEWWM7ClHKs1EDET91/nhq5c8voJ+7oi9zIh7
         2PpYH60uhS67TP6YRmHiO+PEuo84p5yX16aghlg9pjSI4vNEyWhWTG/CZ25AJB9lfuB9
         ZRd70xfyDbTLjXRVCdPTW5iLhQ4xEuWoyBqK5uvu9LxKitSBHdR3yBSylDXn0vCLyGjL
         auYGFlFdl8dwBfY/kjVwpqNJslITFZCEDmfIRGEcMeBJPPecs9T70KC0oXql1z1wVYa+
         iOEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCxqDVCTn0rXgFAaTnGLtSjYonAuSWsxKD+F6AKboF3BuNobENgEXcyulIDVTrqJaohvw1tt+rd9EOdQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRVaHADHWF5joVsA0i7w1zZJi9f5Czv/2WEjxYde6t94sn1ulD
	Vq86P2UYkIg3sN36A+27OkKdHahCcl8EufIYIcYq+xh3wzs0fERDljXuGHABAFt78dJ+tm5Vb8b
	0VPwpBCHKTaj2pNzRekmimZ5WlW2JG/0R4/TYZQnLTajqq2RYHjwbKQmdtQqWeoqxkA==
X-Gm-Gg: ASbGnctcO96+5yrK2mPwcnjv8DznwCj1FksXkMHNr7I7EcAtBLAa4AFa8YfaWnCpvZM
	2RlgRTRRn9ub+tT70a6G8Hog9e0cHfFNaa6X+TI5m12WBCZbEjQTMRFaLgMJMjEQWZnwFT4Vn94
	qTi/ssX8ScZXn3KDaGtSuFvMx8kGwtRT00Uve80bdJz1wZGMBl3C5zH3rjOHyVUO55iT8DScfit
	ogd4aGNhDcB4rg8Sf/a1jkh426HQ8KzaSgxo4d3pU9SbPfChAhbHHr87aopudKwX4hEXChkt+6z
	D2DPM6+0qKCyHuxz0AWEGbydFe7QaUbBi5YZHz0uwl0ANGVy+5XdiPaxuZZC3y2+koR8ja1TtdV
	2yduDoA==
X-Received: by 2002:a05:620a:4492:b0:7d4:5b4b:530c with SMTP id af79cd13be357-7d5c479071cmr519537185a.35.1751472750245;
        Wed, 02 Jul 2025 09:12:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpMjHbzyM3WwQm44w9W/nWqycIJ9HJ4DREbycb3mIOG8Z/RY6NfgQr6ikfjWRDEzfAcct5Ug==
X-Received: by 2002:a05:620a:4492:b0:7d4:5b4b:530c with SMTP id af79cd13be357-7d5c479071cmr519532585a.35.1751472749812;
        Wed, 02 Jul 2025 09:12:29 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb (host-2-102-80-182.as13285.net. [2.102.80.182])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d45ac68268sm564344785a.68.2025.07.02.09.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 09:12:28 -0700 (PDT)
Date: Wed, 2 Jul 2025 17:12:24 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, clm@meta.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/12] sched/deadline: Less agressive dl_server
 handling
Message-ID: <aGVaaJif1metVJpA@jlelli-thinkpadt14gen4.remote.csb>
References: <20250702114924.091581796@infradead.org>
 <20250702121158.465086194@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702121158.465086194@infradead.org>

Hi Peter,

On 02/07/25 13:49, Peter Zijlstra wrote:
> Chris reported that commit 5f6bd380c7bd ("sched/rt: Remove default
> bandwidth control") caused a significant dip in his favourite
> benchmark of the day. Simply disabling dl_server cured things.
> 
> His workload hammers the 0->1, 1->0 transitions, and the
> dl_server_{start,stop}() overhead kills it -- fairly obviously a bad
> idea in hind sight and all that.
> 
> Change things around to only disable the dl_server when there has not
> been a fair task around for a whole period. Since the default period
> is 1 second, this ensures the benchmark never trips this, overhead
> gone.
> 
> Fixes: 557a6bfc662c ("sched/fair: Add trivial fair server")
> Reported-by: Chris Mason <clm@meta.com>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Link: https://lkml.kernel.org/r/20250520101727.507378961@infradead.org
> ---

This looks good to me.

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>
Acked-by: Juri Lelli <juri.lelli@redhat.com>

Thanks!
Juri

