Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C6B1DD0F2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744380217; cv=none; b=N4ogTB6MtcVqHZt5/911HJZpiIkZmvi5P872jYYYEr3PVlHoUx89SeTT2Opbx2DlLLx6Qu2HEzL9108+SfdFO8N2JMUlJv1ACyGEjDyR92RT8m11Shajlbn7U0wJdoHDVGP4iSqSXrx1QhLuyhftInyrdrpBNu9KqDlj5kQyeWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744380217; c=relaxed/simple;
	bh=+B3dssbzQ0T+9tjtOKViLG4iLIBBnTTBP8+6J/vDyXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EW4esSf3hOCB1eXXZl8K9AcLcm1+9tmm/Fgo0dPN6ERQF88g9LnaWaWR9EgY55AOVdyhVTGu+elsP5zcESxCjgePh7YJXV2C7c6luM6DasUxTY82lyn1AnIYj3f51YbC/+cEBCBP2SRD+f90CBXAGrkdluWfM5AltW108KxnOCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PO8AItXl; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PO8AItXl"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso14009235e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744380214; x=1744985014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjHI8iLKNyjSer6QwZ0T4nLrTbVuh8PFv9EW9BoptFs=;
        b=PO8AItXlpHlJXYohYpQQKAom+Aj8yHrwLKVt2Pq5132DqhU3fHsva95bVqy03fzPbo
         t2NJ7R5VjOL4tXUJyOZK5c1vLuOoHs2EfOuMJ7Xa9A4xfl2b+yHY2kkhDNes6HhOYNOV
         BATSPjFmiq4BnkoT53wR+xdCHK7L/Di841TFU1eqyAkC78udk7KzbNv7r8MtPGVzQA57
         WvDld3xfOVSDA7/CTfMzdyLcK7A8K0ZI6DNhfqhhLrxntZizhZVlOFHTEThGgLQmj7tX
         IGNq9Be2HaVMZMdMq3fATgJpFf/XjBFrBQnVQz2fZnOTaC/d9Zm3rljIDlw0Bvdhr7Kh
         AmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744380214; x=1744985014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WjHI8iLKNyjSer6QwZ0T4nLrTbVuh8PFv9EW9BoptFs=;
        b=CSnKJUs0BukTNd3gmZ/6HbwwUbGK/Ii1Z8jw5slEkp8V+6Q5N1OJHjVdMU4ifmTSqe
         4SZ5IdtVQNl1q18BtwGn8C3kVCI+VmY+lOivVFyzuPXh+powcPbNiQkq0ebu9VVw8jqQ
         LVSzG/+j1i3KKlDl1kyZkWupSGI6ra8OsxBHZVWPuM2N9RcNajk9WuKyETsvhihFiW3/
         t89fIvd5akYLbqespBwQVnk4mmZA1/IUa6x+1FAfvIJcu3lyBMC0zEOk9C4UNokJ4pIK
         KKAvsAWo/n84SKgUgnjGj1DwRPLZJDlzmtu5fZMJxn1loMObZslTD/wXRZ6KFxRNY1vh
         gcaA==
X-Forwarded-Encrypted: i=1; AJvYcCXkcGXHShLpXEi1Uzj4NvJmnPa6+kOUWH+m38KWrlIP5G3jK9tMxxSjqgz42ugTfiyk2aQNB686J016HHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtuV0QsTHRUk4x8IwBeKeSd7KHC22UncoIsEeSsSGhO4z9hZef
	jfct59WSIiu/aikima9iwhB7vDLMUJdgPms0dGK35ryq5U6d3tcCmV5DGJadBCw=
X-Gm-Gg: ASbGncup0dsWoqwQoey9TCwtPG8CNcjuxhdoM+5Yi3r7hatg1+IQIif/q/YfJ2u7iZg
	iFzBxgu0D/yEXLIdg8tIeqxM8xWVuFPBYvD7pPKoLZOwHRAm6g0quDdOOxdi+PiOpIcjd/qMEEg
	s5gh5CsunxoF0AuImMIap4m+bVusFCps0wKBhxexTWzdPQXLezrRcx91iNVxwff+Eum+49wibzI
	o6vXVgKI5QC1SZW+aJ7rF3xwkwTE//j9xlgJlgW1XJzYYT89FsQJ2wUmtR9nrwtoFGs0RbOcncH
	R22yCu+qHt01DoqE1JjK6SYmCnmEG77d5hwwnRZn7a/dB5Lmyb7uS+x/yQ4rOzU=
X-Google-Smtp-Source: AGHT+IFNQChJHGwm0jpg81EkuoYc4db4lN0W2dHhvYnddiYay5Ou28lyQpS+tRSobcbaI0Z86YjbrQ==
X-Received: by 2002:a05:600c:5112:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-43f39622947mr26940535e9.3.1744380212225;
        Fri, 11 Apr 2025 07:03:32 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f20a897b6sm51235895e9.1.2025.04.11.07.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 07:03:31 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: marco.crivellari@suse.com
Cc: anna-maria@linutronix.de,
	chenhuacai@kernel.org,
	frederic@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	macro@orcam.me.uk,
	peterz@infradead.org,
	tglx@linutronix.de,
	tsbogend@alpha.franken.de
Subject: Re: [PATCH v7 1/2] MIPS: Fix idle VS timer enqueue
Date: Fri, 11 Apr 2025 16:03:21 +0200
Message-ID: <20250411140321.218752-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403161143.361461-2-marco.crivellari@suse.com>
References: <20250403161143.361461-2-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gentle Ping, also for "MIPS: rename rollback_handler 
with skipover_handler".

Thanks in advance.
