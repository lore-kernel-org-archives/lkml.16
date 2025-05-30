Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE49121C182
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748598849; cv=none; b=Gh1p0AIFcIFfmb50FTMaSvho5uE06hxxUYlK1DUiXn7rz9cSagOMcfbgZVeLDCEONsvg1vatR35cb+aMTaZs/dagu1mCuvI/enG9djJ3Un93v7DmY69xcVwxpxkmetYM0qtyuhWYi6rAk1RXupcPlr/posro+E4c9zXIt3b0s88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748598849; c=relaxed/simple;
	bh=CseKbxBhjM0XiCNE+VYabCg1YlIjapBoWrEyeWexl34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QHJE31tblnxPHwOPcj+x8bHgmPieMhlXHTiYzFF2uMCFZTCejt4WiWoIe/b0ex3yDQ4/7T7rUkpnEQxBS7P91vqqEvsmDBdlvFzbVRrzea1AgHQJUjxNPH/p0dHCp4kOwBAje9VHAeX1g2ISYXERRs9B9gtBMCyKbyNcDRM/JfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SfpYa6JB; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SfpYa6JB"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so19064545e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748598845; x=1749203645; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eRxoEOZMhRODJSYZJ+F0wZvNK0em7c0dCwwEsoHNqDU=;
        b=SfpYa6JBuRAmjA3s5fm5V7tUmw4+vtzhidgFKpSstIIj3oUf81ifsJ0rJFF/1j3Ndq
         gx5DpXuY0XhzQjFau0d4SYdYSpYMrCEVpmdy/w9xRQG/Wm0+/fxEvoeZuxZ5ZL5svudl
         vTgn5CTAZLnfqG/7Vk3sFlr1VxsZb9ENZEwcmhhJ4t9fLV37QMCRe641aGhEdYbi5mjU
         rPPu8Zzc47NFA92AsxXaLqGJzeIbstKDIXUAhAYuSTWaX8c/yLFDVmI2h61h61FZpPD8
         1z82LWUSU+JrIxsoeHrUYFrHFG706qgjvW1zDwRGfAhjyaXYLhTelSeW78uZAA5hUhZV
         Vocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748598845; x=1749203645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRxoEOZMhRODJSYZJ+F0wZvNK0em7c0dCwwEsoHNqDU=;
        b=bGglZYDOwQ1e3kNsGMafH8CjBKN1/Kz+trb2JFLiQbPOMOShgAT7+iEVgc2va2tD3/
         00GBFoki/odjUevsooaT1Am5vTt+kwr+dfmTyoIjFbn/YHwFsDWDzBWRYRYacZH9okYB
         lotKQ3Y/o5sr+6tALoCXeAGGdavDdC9ECb1pKcnHWdOoEw3q/c2zITQBeFThm4bTFoUT
         NX8sqnkoUyjdhmE69Uw+CB3UyS4boYv6X3Jjk/yrQhyXxQF8PZ3TBxOlBzj3Y7U/CV15
         ctta/atie2LAX0xEd4ryRsWgsr/Qfe58PyyT6/sezFW3kD18svdnwXP0uKjEIzBypHNI
         SJ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXJPb4x4/aLNNLi2dtuZDJXG/2R//UQkGDGtAYlq/2/ZCCNUkMNHgX95TSQssn6/Xo/PGn6DMUsU+OUZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMWVPtXpb4y2ghpOiFeSfMbcIaesml9d3YpOX8KZQvL037MGnj
	VNKjFTfnjf+rZq5xSQ2fq/ANm30M+VThuZ4iAvbo1mmjCvZJBnlYmq2HGOnqzxNdqpE=
X-Gm-Gg: ASbGnct44H+R+F6umc9TZAKtIEhURt+6jPCB1X9tPZX8q+Mh0lPkBkjh8vw2BMGNqR3
	Q5RJcenHX3ElAZ6ejFc75TX0ieDS5n9DWUYWhjJL7B0eMt2vmQv0ZDBBVUxlesoahdw+UmfUE4x
	dVg+HLkev+6ijLziroigLnprnE2qQ52MTjgXH6RTDkfm2vhSzcKypJqakLlZjIxcIvRRDVr+9yx
	YTQ2cPXDCxkcX1qgKnplvmNzuJRxDaKau0OUVNB25nGCkHUIut4F+wkXeS13f3p+uksL5VXOlFW
	OVZxnQOVNxXDnkSPSwUzaeBgmmhiOkrZfy53zYd5nvzsR3kuYi1693JPPd8q+lQP5pT+rr1Yt+Y
	=
X-Google-Smtp-Source: AGHT+IGaNzRwdlYZwrr0rVLBeL3KDtn/FBgW3cCsT7b4Bkm0T+MvmIXf3H7HJrmY+BO1AWC5F5xocg==
X-Received: by 2002:a05:600c:620f:b0:442:e9eb:cba2 with SMTP id 5b1f17b1804b1-450d6452cadmr34288755e9.0.1748598845108;
        Fri, 30 May 2025 02:54:05 -0700 (PDT)
Received: from localhost (109-81-89-112.rct.o2.cz. [109.81.89.112])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450d7fb051bsm13429285e9.18.2025.05.30.02.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 02:54:04 -0700 (PDT)
Date: Fri, 30 May 2025 11:54:03 +0200
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Cc: Jiri Bohac <jbohac@suse.cz>, Baoquan He <bhe@redhat.com>,
	Donald Dutile <ddutile@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
	Philipp Rudo <prudo@redhat.com>, Pingfan Liu <piliu@redhat.com>,
	Tao Liu <ltao@redhat.com>, linux-kernel@vger.kernel.org,
	David Hildenbrand <dhildenb@redhat.com>
Subject: Re: [PATCH v2 0/5] kdump: crashkernel reservation from CMA
Message-ID: <aDmAO7Hd30PtCD33@tiehlicka>
References: <Z8Z/gnbtiXT9QAZr@MiWiFi-R3L-srv>
 <e9c5c247-85fb-43f1-9aa8-47d62321f37b@redhat.com>
 <aDgQ0lbt1h5v0lgE@tiehlicka>
 <a1a5af90-bc8a-448a-81fa-485624d592f3@redhat.com>
 <aDlsF5tAcUxo4VgT@tiehlicka>
 <e0f7fc1e-2227-4c6b-985a-34a697a52679@redhat.com>
 <aDl1ViMpK_6q_z06@tiehlicka>
 <04a49de5-eb79-431b-ba5b-eae2536781c6@redhat.com>
 <aDl7rHb34zIXEf6j@dwarf.suse.cz>
 <f95f2f30-1393-4ae1-96b1-96e4abfc368f@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f95f2f30-1393-4ae1-96b1-96e4abfc368f@redhat.com>

On Fri 30-05-25 11:47:46, David Hildenbrand wrote:
> On 30.05.25 11:34, Jiri Bohac wrote:
[...]
> > I am inclined to just setting the fixed delay to 10s for now and
> > adding a sysfs knob later if someone asks for it.
> > 
> > Would that work for you?
> 
> Sure. We could always add such a flag later if it's really a problem for
> someone.

Yes, no objection with the most conservative approach first.
-- 
Michal Hocko
SUSE Labs
