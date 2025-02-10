Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7FD1990CD
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 06:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739168913; cv=none; b=NC7GHjKOSUx5Lblb9tQNeCZuQ2LtgykLapR/MGDugvfJhEsssWyuOvhO5XjFhsV0kfGrs5qkZFG5hJ0fYv2k7yPoKfVmqRj0hUOs6MzAQSsKdqR0sv7oHOUP92p2urfYgkd5YvCDemzv9WamwGWCQd6cu6rWWRWO4+38tdz6UEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739168913; c=relaxed/simple;
	bh=/gjiDwZzKtwVV8zIKvjeHYq6tlC7+zimxYd74x0hIwk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DDbx0o582iB76hO5/IoVMN4dHJ4nyOBUzCzpTbQgtU5u9SM4SvfwuknilPj1boG+Egfx27mC4aXTyaSECr+6Wo87MLhyen1QS7h3F/IOlhasciONZgYjBfDwngzKbY40ruJjyKHbUYx0qHQIPrVhTfiejrgODO22iECiCvNoDZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IuiKsc76; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IuiKsc76"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-2fa44590eebso3184770a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 22:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739168911; x=1739773711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZw8tu+RO8Bp2eWCV8TS9Nack3Tv7jJGmkhaul16KJU=;
        b=IuiKsc76Ct4sPGs+PP6I7OhPp5f0RayEJgcd9AnQaEfT1lYHxW3zNE3o3K0XUN8oYF
         nc5ogoC3yFuGJFu8T3Tql7K7aprPhDhMxVReVKmptTo5FFrpxF9IdsK1Glbxw/c94/OR
         JbgkEfPhCR8Qao8QFIaQWrwoF3ImgF5MJFeSAWWREMfHg872fr1MtBE2Kqod34fdG58/
         dcCpgUEib7252Sp2ZbUoyKPLAZXw8fXuey4XW4jC5DtTcRkXALFF2Mi51AebCt36jC5Y
         rwTrjlR5W+KmjXEH1eqRAKgAsBp5baBf4gii+sKnxnXNf1R0N2A4D5DD/Cr2bbTi48Zf
         FZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739168911; x=1739773711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZw8tu+RO8Bp2eWCV8TS9Nack3Tv7jJGmkhaul16KJU=;
        b=vig20I3m119V1L1Bgu3l6COWo7zRzf8uX6QtnOoTGOwqFgqYLXxrURoO0RsCazsTZ/
         fbG17Lr+qAxq695eTFEDPXJjXQFOW38vCxOWIzc3612tI9fS/sFJ2y4NskIQB32DIN2r
         u2HXOYBrlLwDkX5kYUYkddJ1e0dMAkZLLxm3cNiT6VUVPiTiVh6GK57VoHn5JVfEm+Fb
         228egZqM1r+h7QUP7mv6Ntd2GwkAl0d0l53i4LbmzUiQpo9oZc5D1P3Ka4qa71C/FzYq
         3t+J/nToKvDoQQQIgDUvln01wrwhGM+sfqYlRTwwmAYhkJdLyyTY68xKmrdlogp+01Ti
         Hr7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvb52OnWqbVsisMMrpgBu/3tervzpsqXg0ET0dbh1pei0Dko/7KHy3Zie/S+5e6CwJ8wAxRq/sU1eLOZg=@vger.kernel.org
X-Gm-Message-State: AOJu0YywxZaEpNFrTpSRBip6uUoxWJr2uxcL0tvdY0n6OsuGypVrv8qi
	PfguvORkEeqahvTD7uOx+w8vhzKelDjgLanJ34AMN7E62plRp3OM
X-Gm-Gg: ASbGnctDWeoEyZA9YPt1Q79SNOVCaR2GrVPTyvOfhcg1wWqKrHvGVsWkUcOUajfiU2J
	Q4Dz9vnY190XcY+EqC4U+RKhb3rQVdj2xUYiaDzKR1ZBqXUfWjmRT5/eW2S3Xw1sUPRcStNgBtm
	lc/U4gNZPbW5p2tnTTmVuh31ZBKxppcsa9AVRSlIYGHhlQLQpFk13iAs3CoLU5qHnZ1xSkeJTm2
	2j2HbNoBfiw3M79DdOnGgvve29SleFBXhaRar3qWobOvbPVWyEoLN3hnpQmKh4foiY9RgKkJ6Ce
	Vb0rQrPF0IVZqeRuzVXxPPzfd5Zm7d2k5AY=
X-Google-Smtp-Source: AGHT+IGmTxJhv45woSQJPITImtV3BfW8vtgPQJ6Yje+MvwttZ3It1LgogZoLaA4JL9dOkm/TKuSCSA==
X-Received: by 2002:a05:6a00:882:b0:71e:6b8:2f4a with SMTP id d2e1a72fcca58-7305d47c9d1mr20324720b3a.12.1739168911052;
        Sun, 09 Feb 2025 22:28:31 -0800 (PST)
Received: from localhost.localdomain ([114.67.205.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7308aa3a1cfsm1590129b3a.137.2025.02.09.22.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 22:28:30 -0800 (PST)
From: zihan zhou <15645113830zzh@gmail.com>
To: vincent.guittot@linaro.org
Cc: 15645113830zzh@gmail.com,
	bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vschneid@redhat.com
Subject: Re: [PATCH V3 2/2] sched: Reduce the default slice to avoid tasks getting an extra tick
Date: Mon, 10 Feb 2025 14:26:59 +0800
Message-Id: <20250210062657.301669-1-15645113830zzh@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <CAKfTPtDuCJTOJ0WvtEJLmkanZCWLfKG-D5r8+8p7EWGin2mGRw@mail.gmail.com>
References: <CAKfTPtDuCJTOJ0WvtEJLmkanZCWLfKG-D5r8+8p7EWGin2mGRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


> > Update sysctl_sched_base_slice with debugfs, limit its value and
> > update normalized_sysctl_sched_base_slice.
> >
> > Rename the function sched_update_scaling to sched_update_scaling_or_slice,
> > it is no longer related to CONFIG_SMP and return void, as the previous
> > function always returns 0 and there is no need to judge the return value
> > again, just like the function update_sysctl.
> >
> > Signed-off-by: zihan zhou <15645113830zzh@gmail.com>
> > Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
> 
> My Reviewed applied only for patch 1 not patch 2. That's also why I
> asked you to split it. Patch 1 makes sense for me but I don't see the
> benefit of patch 2

I'm sorry I misunderstood your meaning. Do I need to resubmit or just
ignore this patch?
