Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61641290BC9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745420701; cv=none; b=uwh2oTWvbNQsV3W3o18ub4fqD8xdbi7wPV8xgmiWYxD3e8+40L3zit6eQ6rgJxEYKwfMu1I8Qh+NQ97q0pnKPUY1Rq4mR0sHYClDX/B5z7jbbjY+CtjOZbTOqvGVL6LGrOAjJ1RTaJuNyvEvaWbpAE25VcL7RHTVTy+N2oxki/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745420701; c=relaxed/simple;
	bh=4R6lj0hZ4/p7O8oGQyGh1YZI8vXp8HHuwSAXkKuPK68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NtwZQU3a6t7UVe5/JOx0n/k5LoSfW6ig+qjjrLlCJrqTMIzyuaFh3wmMl/JqnJXIfHIW7qcL+HTHaYxJYsL0T9IZpve24IbCfV9ldJx9yNKyaIPLcnLvQ2N5neV+ANYbLIscfa0JelLMuoXz3kn+UdZWyDeZnfhsuMWqp6eom2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WFtoAY8L; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WFtoAY8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745420697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y/XwtWlQK2gWEuKfXA1Y/H+Qql53usM87hFbg/riAys=;
	b=WFtoAY8Lj2t99q07djc4fZbSh/u9mQLVx59IeGlR1crR/Vne+/4bBitSWxlI6hnQOaXrRj
	GU4qyhBnqXc+SBe1ArZQeavYYvMwqA1A3AHNK7LngMnqI/fezNq0fTbpb4dRXiK5U5JPs6
	LN+KcTf6K3cQ6eB3xJoJ5Uao58RkOtA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-xbJQFwRBPvqtcoarsaYuBg-1; Wed, 23 Apr 2025 11:04:55 -0400
X-MC-Unique: xbJQFwRBPvqtcoarsaYuBg-1
X-Mimecast-MFC-AGG-ID: xbJQFwRBPvqtcoarsaYuBg_1745420691
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8feffbe08so156960866d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745420691; x=1746025491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/XwtWlQK2gWEuKfXA1Y/H+Qql53usM87hFbg/riAys=;
        b=r6GrkTJZ3AfcKZMYaY8NX39292llydJAjpCkGDV2Hu9DuwgekATYmpO9fU55uKvULX
         R89fRUnf84XEb3Bza8UNdwmcTzx/bu5IgJjtTnjpFdir1SWC6xLwSyIgxZfujWbhSqJH
         9StYX84O0YA/k+HwEW28MUbz5640J/v31SUzit1D4WHN4uf5xbzz6wyDnoUs3ZVzij/m
         AuDV8CABeihwE4sQPHFgFYPFfi/G4J40WclU5bSO+6GpqV8BayGmI9/hQakWu2mPemP4
         HB/gCa0wK6phIiEzlfOIG0bGtsuOoMSjocO2V0WK9m3CCpZ/VaGcHZHvKFVaQLhjkltQ
         JYJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW2sY7eE7QuapYOX/PntjIbRCiVEXqpNPGb9AEOVIM/UecnnEiTYyPhtcqh3YRnqc25MwOeLR/lyuplqk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi4qgyAcyzxg7q4Fz6Cf5poWRZ6XNMBVUzTsYxSriy7Zw0KOum
	NATEwi6u8NvIoL3IGN2aj+NbFCQ2iyGq0i3oz+i/1hcs4zvtaifMIL/Mv6F2HTsZFu5c/iSXZop
	1Dp3oHz3+qNZOR8AoupxHe75vqjWIZQqUUB+lsobl09De+lIuBBM3pMlg60lPWA==
X-Gm-Gg: ASbGncsgJHus35zAJyi9Ehw9Asz6GyH8YntmdRhSEjJdKxhQ07g0L/84zgc93U0/q/w
	GlKWUQUSUo1UX9Lm6tHEt6ZfKIuoNwGbkwmcIBCnviitkidVmsAQAupbviOgv3TC4qs6fTWvb8n
	e0Qz5JzoK8SwnZ+V60U/Z5Y803E1xNBT9DLi454HoEMyAFzMyfoLrLGiWJulw1NDENSc0+kRMAM
	mFO/pFlUgS99FIr7nu525QYgqw7XlVCmxm/vm1YrSuHkSkb3ffx9keDQZXvD039HAYLPxMbwR4u
	J6r3enSc7VNR0a//KHa+DZz7my8Ds9NbrxQCf5K71kPCkHXaG/ce1Dc=
X-Received: by 2002:a05:6214:5085:b0:6eb:28e4:8519 with SMTP id 6a1803df08f44-6f2c4562ff4mr349522316d6.21.1745420691115;
        Wed, 23 Apr 2025 08:04:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIAe6YgRzYFI//AuYLkGgT9bMQm2RTQxu8bUNb2e6etKdith1hNCEE0IZQWqDOiU1oDePTvw==
X-Received: by 2002:a05:6214:5085:b0:6eb:28e4:8519 with SMTP id 6a1803df08f44-6f2c4562ff4mr349521466d6.21.1745420690350;
        Wed, 23 Apr 2025 08:04:50 -0700 (PDT)
Received: from localhost (pool-100-17-21-114.bstnma.fios.verizon.net. [100.17.21.114])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af5b28sm71585546d6.10.2025.04.23.08.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 08:04:49 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:04:48 -0400
From: Eric Chanudet <echanude@redhat.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Ian Kent <ikent@redhat.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	Alexander Larsson <alexl@redhat.com>, Lucas Karpinski <lkarpins@redhat.com>
Subject: Re: [PATCH v4] fs/namespace: defer RCU sync for MNT_DETACH umount
Message-ID: <ubimdwyutm47mlmtn43mbobtnwaxkmuse3vpgosbsh4yd7f73t@bbt7az62ybbb>
References: <20250408210350.749901-12-echanude@redhat.com>
 <20250420055406.GS2023217@ZenIV>
 <fzqxqmlhild55m7lfrcdjikkuapi3hzulyt66d6xqdfhz3gjft@cimjdcqdc62n>
 <20250423021547.GD2023217@ZenIV>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423021547.GD2023217@ZenIV>

On Wed, Apr 23, 2025 at 03:15:47AM +0100, Al Viro wrote:
> On Tue, Apr 22, 2025 at 03:53:43PM -0400, Eric Chanudet wrote:
> 
> > I'm not quite following. With umount -l, I thought there is no guaranty
> > that the file-system is shutdown. Doesn't "shutdown -r now" already
> > risks loses without any of these changes today?
> 
> Busy filesystems might stay around after umount -l, for as long as they
> are busy.  I.e. if there's a process with cwd on one of the affected
> filesystems, it will remain active until that process chdirs away or
> gets killed, etc.  Assuming that your userland kills all processes before
> rebooting the kernel, everything ought to be shut down, TYVM...
> 
> If not for that, the damn thing would be impossible to use safely...
> 

Right, that ties up with Christian's earlier reply and was also stated
in 9ea459e110df ("delayed mntput") description.

Thanks for your patience and explanations.

-- 
Eric Chanudet

