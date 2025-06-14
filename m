Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01DC1C4A20
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 19:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749930560; cv=none; b=ezBhJLg7XonAveJkv8McWhuE8wGPnA9HOPsMYs6LcaMGeS1hqEjs0zeIdX9e9yXFWDgerBrVkogqXUFnsFhClWLAGpio7YtsIWdSJOIPJwWHRO7qQX+6e4sm/csdRB4S7EneeI+nV4/xOfSpC72RZCM54wTOapwXJNbCbcu8DiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749930560; c=relaxed/simple;
	bh=ts0D/JVI13MV62uXjKgYXC+HMpEEWjv/t1pwNm2GAig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KsqofOnNtYzUabNAEU5ZYPxENoYVQ0U2sBw++v458usX1QADMKP6PHbT4syWQHUKrk+6bXkdkvFwxrIRJJbN40FygvuB4r73RVGa3Y6KX8CRFKh/6Fp5Phk6vyrOyJDQyx/hhbbl+nFlZL0BvIRYR+qoODrleAJvA5QZ/KxPIfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2NP0Lsb; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2NP0Lsb"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad8826c05f2so608035966b.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 12:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749930555; x=1750535355; darn=vger.kernel.org;
        h=content-transfer-encoding:reference:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9v/OERbMm8fY+Li4p/o5YEEMylWvXe/Gi8BIEHf/NFI=;
        b=i2NP0Lsb5Xd8/q5XHOGiCWwvXeMuQSVWnjH3qqfUVFvllsk+rq3EvB7PZ1puaROAp+
         PhLgM5TirzaiMqXLJcYuIQlroazgy9fDivOMXymWmKHOp5egbBuXxjboYKITrFBS6tcO
         xb10liXXeEv304d/4cdCypqmTk22fbqrkVRU+h2kMX4OPxaTZFttNB7SdRPa1HhXOjyL
         aCYsGMzonSWSoyqGPd/t+/R527nvIlsJUpVwG+OBRRBfJ+53zVhjMv9Rl8uc9ZkOBMfw
         vtsMa6/g843Zrm1iDZjoBJ+4RdHbo9CQwZw1dLyxZlojjWhMpJa01s6X6/tNtGuDxDxz
         IJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749930555; x=1750535355;
        h=content-transfer-encoding:reference:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9v/OERbMm8fY+Li4p/o5YEEMylWvXe/Gi8BIEHf/NFI=;
        b=EBH2zoAwNTgl7pM6muyknPivuLWI6VzF+V9oy2MS3aV+dEVypGUjfILF+402iKvAiO
         3W6DxG2iRjK2fBfm8HqAgBJKcm7pqXT27VN9QOL3ipwg1gMCafErszz3UwuysTh5xrUY
         3IDpBjptS33KYToJaAjSki/TWdEzNxXPBKJ5hvrXSsbWqJzLqJAeTUXPJCuHyIAVrugM
         1DS4W9KnemvbfwOBW9SaAveTJFGnOQfFr8sI0B1yfo5cBBlvLrv9nLxD8w9+I92w+kRk
         gG5OWTMG22qOV0eg3eQgSMslPea7mgylVZEarCgJ6uyj70S/+Z1PeKdduWmFnGjyK5xr
         vKZg==
X-Forwarded-Encrypted: i=1; AJvYcCU8L9sh9IXVqkocSQS3yYxJnAMIBkGEfzHRQNss7tRKswKnXCYTDCXHhHFWP/95j+yR5JKihVjCFTh1q4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YztRtkrHavnbQAcCzx7myq6MZdXEL7/E5pkqSGd8s7rDkfP6TiG
	AXATH45WjLU1GXn0ebYIZr0QqvyYppYZyJKwEG6+dJbXurORaEBwzr+wKJLtuPjimjo=
X-Gm-Gg: ASbGnctyoGjR+2C2/F+Iy9JtXJkNs15BNCB+czx0LjIZsvTd01JQ7poOLS08jgv6mwy
	7BE9TnzJIBnqoQtKSz0lTSKhdn0fip00J88dszE+HdTT8x97e2e88Sj4Aj4R4eAwcT3EXJ+DK8C
	f5NvAzFE70663ekIzPKzWIY/n9mN1JbdWiuG2g+5glrcFPWPlON+QLSLw2+0uMOZ2HtYnqFhPQf
	p9EeAI/XtfE4OUtgv8ODTz0Ldw2eVogHnhWJDOILCKhZdfkcB/ayktPGFMh1kHEY+84E6Oi0ysY
	3rWX4wnNR9oq3vC588dFA+xs9B7d/BRaaadaYkAzKkgWETtEAxAR6tsQZITx4SRDX7kYWUFRAht
	4
X-Google-Smtp-Source: AGHT+IEyvHtREuHJyVmdDk7ypIM/fRZtZ988FeulxrJx2/mrvpRNa9tLA3bNhUNCPQlyIr5QX7/fsw==
X-Received: by 2002:a17:907:3f87:b0:ad4:c55e:ef8b with SMTP id a640c23a62f3a-adfad4f162cmr369621166b.48.1749930555016;
        Sat, 14 Jun 2025 12:49:15 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec899c04bsm349949066b.180.2025.06.14.12.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 12:49:14 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: tglx@linutronix.de
Cc: khaliidcaliy@gmail.com,
	linux-kernel@vger.kernel.org,
	luto@kernel.org,
	peterz@infradead.org
Subject: Re: [PATCH] kernel/entry: Remove unneeded header "common.h"
Date: Sat, 14 Jun 2025 19:47:46 +0000
Message-ID: <20250614194829.10832-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <875xgziprs.ffs@tglx>
References: <875xgziprs.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reference: <875xgziprs.ffs@tglx>
Content-Transfer-Encoding: 8bit

> The reason why common.h exists is that syscall_user_dispatch() is a
> internal function, which is on purpose not exposed globally. There is no
> reason to expose it globally, so it stays where it is.
> Still there is no strong reason "common.h" could exist, there is no doc
> explicitly mentions that. 

Why can't we just put the prototype into the source since currently it is the
only place used is common.c, so we should put it on top of the source. Again don't
see strong reason why entire header exist for single function, even on future if more local 
definations come we should put on top of the source, if there is one single source file using
it. This makes consistent across the entire kernel codebase which mostly do what i mentioned.

The only exception for local headers is if the source file using it is too large and using many
structures, enums and prototypes, in that case it is acceptable. However the decision of creation 
of that local header with no exception makes the header pointless.

I didn't find any kernel doc that describes the decision, so we should make it consistent with other
subsystems if there is no specific reason for that this makes the source file more organized.
