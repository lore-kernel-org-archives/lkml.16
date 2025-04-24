Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED58213240
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745486609; cv=none; b=rIEGuvpsNwTHCLQk0qB3R+0cL2/R/jTSz/nBn+d50cDdffYDZ2Jq+uj2BFVB1OrENTZbSSJOM/+Y47lWQBW2a2ywyRPMtxkMzySxLRojX0S6mSZJn3UiaJ3FVLy2M/Ds2uD6EblE3unkXot/NFaKfZqY46flMhD5s6EM+r7a08Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745486609; c=relaxed/simple;
	bh=mvolAf2JU2F8eP0edLb5CXAcR0qLRl4vnPy4nQDqt3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AUDD+Bj4K/UQeuYXlTZmFHH+6nMl7pukbb466VP4UUgLxhnoMEjnw0lFsh2Qvj2hwWbeRgu/IA6Jn3ARSR22YDV0p4m8Nb2FYy/h69uCj27bGBUcaVekeTFF/bUiM0NAsmhL1pC+v11k/z1oszh47DUV1ehPmUbONKjtMKumygc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OEkxTymx; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OEkxTymx"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c14016868so711198f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745486606; x=1746091406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9hCllJCkBelUx+2R4zB5n2lQMaonRD+b0FrE8QTmkw=;
        b=OEkxTymxDUH0xsCd+VRx26ffVEyPvjh04HpbNaW6DPhPF4Fo2wI/skSa/XMIReMSOz
         7CuRxjvvsKVmaa3nBPLayHMKetHfYRjtN5vpBGkLMelzUvZF0C/cqnxC13bCQTf4ukLP
         rr/bJFsDbKraAniDaBNbNxeMLNd6d8AhQtpH/3e0dcFrokdoWXvFMQ0J9M6C305mFNxY
         oqFibcEmTgs5OpzdawPez1PDTXSE94KaokmSmXe0neXzzovZysifm+xN5bltRjm25Nw/
         yDb3WmX2AegA4QUpex9hr9gJkrkTXj7FEyvGXviGVJeuXnlhB0+Z3PM4XArK2fiY2iBf
         NFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745486606; x=1746091406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9hCllJCkBelUx+2R4zB5n2lQMaonRD+b0FrE8QTmkw=;
        b=hF9V027IatXmJL2nU3OP4EischXP+dzg8S01c2n7uEROvZg239lV+/Kvwwrm0mAYxg
         m82Y/2e9vr/85/mNZ5NkGV4BtmIF3ssWP+K5sGQ3SDrbcsD0yMcYon+8PUK93FCzZMML
         cONkINY4BJ5W86QsuXvKy7fsYJAiLSF59rj+37oOMxgJk48Wym6mT0/GvzgoJxYedV1/
         iYSXJ77kTOafCS/LUzvHLMVmb9hG4/HEHR9jJbg5/FanjwYsMEULXdKQWKW81mgcozc4
         BXXKn2xwkOSedKcX5JZ1kIknmb9tH3E/W0AFFtOSOtYKWMOjDWpFIoJbLEhDPGkVI+//
         Ft9w==
X-Forwarded-Encrypted: i=1; AJvYcCVpK2sseWzMNs6VRnqxE2uEWY/KQ1kueYPVUf+oaaZL6mIwSMnsaf8smnIrdAM8CfYyH6akBKLo0OHAjvc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2/DsWc/AleuPzFP4706Z+jPiAXEqYHVBWiWXrf0dCXUAjD4OH
	L8XCLCalPe59PpF5bDJ0wzGdvH3+idi6TJDx9k9tN+C/JZ7FNBHWo7jWrF85LaoRgm7BTupAD7t
	i
X-Gm-Gg: ASbGncta6FG/tV9vlYzI0hXCQKDRKWUOhBIkE1iLDy9eEpOLwUEXfxvMU8VmfxQqpwu
	qe26wAz4T9HhdwFyHOmt4d7tFM0hfyuRoewl72v91XbdV2Qa5PZts0yw8PmgkDcBougL9hFWpoZ
	UpyorqBHxtOA6CIvndL/6CtiURZk25nmV2i9IWRXNv3CWUXibeRwLJZHIbu0mQWlEFb2RUrPhai
	irKmA16H+YtVDzq4qY61gh2HQAHxBAWDMXqnuDjqDnxHBNxyELDdNJ+S0FYajloHJtgmC1BipPq
	p3Gb3L/WTz+cm7d2nTh18SVQ6RLTmmUsZItr2qqBjAA=
X-Google-Smtp-Source: AGHT+IETjmi/Y7OyIjYMlqNEY6NcsrowSG6ChgDsbfIVMoAUbnGyhwm5MHZjrmLvrUIIGtjKQPxO/Q==
X-Received: by 2002:a05:6000:240b:b0:39e:e557:7fa with SMTP id ffacd0b85a97d-3a06cfa8d32mr1596859f8f.44.1745486605744;
        Thu, 24 Apr 2025 02:23:25 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a7fa9sm1447241f8f.5.2025.04.24.02.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:23:25 -0700 (PDT)
Date: Thu, 24 Apr 2025 11:23:23 +0200
From: Petr Mladek <pmladek@suse.com>
To: Kevin Mitchell <kevmitch@arista.com>
Cc: "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	John Ogness <john.ogness@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ryo Takakura <takakura@valinux.co.jp>,
	Joel Granados <joel.granados@kernel.org>,
	Jocelyn Falempe <jfalempe@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] printk/panic: deduplicate backtrace on
 PANIC_PRINT_ALL_CPU_BT
Message-ID: <aAoDC76UiSpCJhGY@pathway.suse.cz>
References: <20250423202620.1686446-1-kevmitch@arista.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423202620.1686446-1-kevmitch@arista.com>

On Wed 2025-04-23 13:26:17, Kevin Mitchell wrote:
> On panic, the backtrace of the panicking CPU will be printed either from
> within panic() itself or by the oops handling. Previously, when
> PANIC_PRINT_ALL_CPU_BT was enabled, the backtrace of the panicking CPU
> would be printed again.
> 
> To avoid cluttering up the crash log or console with this redundant
> information, this commit omits the panicking CPU from the all-cpu
> backtrace printed by panic_printk=PANIC_PRINT_ALL_CPU_BT.
> 
> Signed-off-by: Kevin Mitchell <kevmitch@arista.com>

Makes sense. The patch looks good to me.

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
