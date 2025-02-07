Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED8618BC1D
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 06:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738910772; cv=none; b=Rvx/1IdNkrtbP6u+0LKnicsPBMPAFf/NUEFedgKi2wW5gBqgGCqC2hoamCHPUzbrqZHlyz0HQ27tKgSC6YqZXbVDc/efY06y9419zp0AQaMVyJKVh6A/clwcWIr0eFk/AvWKDBv7V92TimcoqcA14yPyRu5RfyJOHTn68knxnxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738910772; c=relaxed/simple;
	bh=cOoNUzK4M/7zq7LjohTCaBNlMZYJ0ggtkBE7nacMSrw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i8prXRoIZ3PeXXRIFHMCAVlU5TMP/YcLLfxiT+izLjzHolkn2lJl6gLMA2KZIfDtoyXheA5oPTuUImuwjTpAmhK1sZkhgEvahGyO325KB0ivVejCwRQzQr3/t9HrmYVcs+wULqk4umV2IupBI+sDunPeBAYA2t2LosclCeMpOhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWqlbKwC; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWqlbKwC"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-2fa0c039d47so2252609a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 22:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738910770; x=1739515570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOoNUzK4M/7zq7LjohTCaBNlMZYJ0ggtkBE7nacMSrw=;
        b=QWqlbKwCgbs3ye8KX5kEuhdW/hFuRstLaU5kg89IxPAncee0vd/ronCesPxY0mMClS
         fUKUjdDtcgX5V2vH73y4AZ/YCh6BopzIxoo7YiOejdrC5IQ4Jz72W6EvTaPNOc6KVxAS
         fxv8Bwjf8kcHwEeWz/fUfY1k2VUfrGal2IwS3WBLaQqXoaunuL5aIEhvomO2JTnIgxMI
         zJwdEhgo1ftXZnHFRj6TwAuMGE3myVA2tAqL8OGQIpWrc0TjlBhkzgCFXQj2IayO+6qB
         Wqgl+AKql7Ow2tTYnv3tSikVdgTbky/6syv4Bub/Sj+iSCm3ewtfSToaXUdB9gT9+FD7
         OljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738910770; x=1739515570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cOoNUzK4M/7zq7LjohTCaBNlMZYJ0ggtkBE7nacMSrw=;
        b=ddxk107kTbV8nEhvKN5ad91+mZR8pVhmWf4ZQsjXEMEbH0iiYsQevgweRL0byJW07U
         AD2KbiORuqb7P4XzJ0K8vNyjYBb+poxVENyvwmqYj/wpHoThREPmpgQOAsVA0TqlAuHC
         2RwSsdtJwRNctraTVNPViIUKINsqp5EXlkH5W4UG8vH2QJYVD9KeTge8c1uOYsjNFixA
         0aSOJA5jEgsedoSgypodNCgFeqVXYagS5cbhyK1xp3I1V3fUwibGatd5SUabL+CjTv4f
         PRXFLrJJmwbMLXgdfbseOnJZDqXj02hjs3Kaq/yjM0k3QLClYvRgaLf10aeDLkJFIUXe
         peww==
X-Forwarded-Encrypted: i=1; AJvYcCV669Q2YsMtel4id1WFCynKw9bkKTJZNi9qjEnuvL38AnmzNuU7tFOvzdFwvf5c8u393wfn5v2nVZwd2og=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3yE74x8kMatlOXAltgzSRvbKkM9F48JwGGGkhf+ApGZKrT2Yu
	ye43LFZGeeKdPIZiI+316jfysdp/GEtbEM0o9VzKLdojdo9Ph27m
X-Gm-Gg: ASbGncuuAf7xOlKdmNkhzqKnPJIJ638qTVYg71IwOeUtw2XOFIi4jyvN6FnRP+JHrHi
	EvSh8mgoo5Hg92I+pAp9SRQxKcHpGBG952AlkYU3L2sio2gAiJOXbuSmktbStS3FFZr3Um0qNxx
	chWkjjhYtMR4EnzB+T4Yk2jUdhCAbbmZ7L2HDhdLB/3b3vXolygghjZQFxbUNm6uC5iIdxPHKGy
	L0D7B9HvvxYqsXgz13bZ7Z/dhLErOEsyX2w79SikyFCNLrQz1EfSvzPJS164Ab4sS/iLkq+jAb1
	S5d+FPnlbQ+8zea4twqj+l+xB5W0w65pz8Y=
X-Google-Smtp-Source: AGHT+IF2Tf7cFvU3Hxiq0ekN5pgb0OwPSau97B7HOZhwPU4LqPrQ7ZtkPH4k1gyLcoHwWOGET17NSg==
X-Received: by 2002:a17:90b:1b44:b0:2f4:f7f8:fc8b with SMTP id 98e67ed59e1d1-2fa242e7602mr3103422a91.27.1738910770034;
        Thu, 06 Feb 2025 22:46:10 -0800 (PST)
Received: from localhost.localdomain ([114.67.205.189])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3650ce87sm23491785ad.36.2025.02.06.22.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 22:46:09 -0800 (PST)
From: zihan zhou <15645113830zzh@gmail.com>
To: 15645113830zzh@gmail.com
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH V1] sched: Cancel the slice protection of the idle entity
Date: Fri,  7 Feb 2025 14:44:47 +0800
Message-Id: <20250207064446.37346-1-15645113830zzh@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250121030628.113497-1-15645113830zzh@gmail.com>
References: <20250121030628.113497-1-15645113830zzh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello, the submission of this patch is aimed at minimizing the impact of
SCHED_IDLE on SCHED_NORMAL.

For example, a task with SCHED_IDLE policy that sleeps for 1s and then
runs for 3 ms, running cyclictest on the same cpu, has a maximum latency
of 3 ms, which is caused by the slice protection of the idle entity.
It is unreasonable. With this patch, the cyclictest latency under the
same conditions is basically the same on the cpu with idle processes and
on empty cpu.

Looking forward to your reply!
